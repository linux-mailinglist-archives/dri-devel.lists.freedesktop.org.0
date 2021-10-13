Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E98F42C7E0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 19:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34146E0E9;
	Wed, 13 Oct 2021 17:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rosenzweig.io (rosenzweig.io [138.197.143.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B3B6E0E9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 17:45:51 +0000 (UTC)
Date: Wed, 13 Oct 2021 13:45:43 -0400
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2] drm/cma-helper: Set VM_DONTEXPAND for mmap
Message-ID: <YWcbRyk06yV2wT6A@sunset>
References: <20211013143654.39031-1-alyssa@rosenzweig.io>
 <YWcSm6szGFdnAvOe@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWcSm6szGFdnAvOe@phenom.ffwll.local>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > From: Robin Murphy <robin.murphy@arm.com>
> > 
> > drm_gem_cma_mmap() cannot assume every implementation of dma_mmap_wc()
> > will end up calling remap_pfn_range() (which happens to set the relevant
> > vma flag, among others), so in order to make sure expectations around
> > VM_DONTEXPAND are met, let it explicitly set the flag like most other
> > GEM mmap implementations do.
> > 
> > This avoids repeated warnings on a small minority of systems where the
> > display is behind an IOMMU, and has a simple driver which does not
> > override drm_gem_cma_default_funcs. Arm hdlcd is an in-tree affected
> > driver. Out-of-tree, the Apple DCP driver is affected; this fix is
> > required for DCP to be mainlined.
> 
> How/where does this warn? Also there should be a lot more drivers than
> just these two which have an iommu for the display block, so this not
> working is definitely a more wide-spread issue.

To summarize our discussion on IRC:

This fails `WARN_ON(!(vma->vm_flags & VM_DONTEXPAND))` in
drm_gem_mmap_obj. This warning was introduced in Oct 2019.

For a driver to hit this code path, it must use the CMA helpers without
overriding dem_gem_cma_default_funcs, but use CMA backed by a hardware
IOMMU instead of a physical carveout. This means popular drivers don't
hit this warning: normal drivers that use CMA do so with a carveout
instead of an IOMMU, and normal drivers with an IOMMU do not use the
default CMA helpers. hdlcd is one of the few drivers hitting this, but
hdlcd gets very little testing. Seeing as the last significant change to
hdlcd was in May 2019, it's believable that nobody noticed until Robin
hit this WARN and typed out this patch, especially as the driver still
works despite the WARN.
