Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B643F7FB1
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 03:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE416E453;
	Thu, 26 Aug 2021 01:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EEE6E453
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 01:16:07 +0000 (UTC)
Received: from maud (unknown [IPv6:2600:8800:8c06:1000::c8f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8DEC01F43E22;
 Thu, 26 Aug 2021 02:15:55 +0100 (BST)
Date: Wed, 25 Aug 2021 21:15:45 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/cma-helper: Set VM_DONTEXPAND for mmap
Message-ID: <YSbrQUNXx8vIugF7@maud>
References: <1c68be0449aa3217e2bbc898dd8c7426748fc6b8.1629902585.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c68be0449aa3217e2bbc898dd8c7426748fc6b8.1629902585.git.robin.murphy@arm.com>
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

> drm_gem_cma_mmap() cannot assume every implementation of dma_mmap_wc()
> will end up calling remap_pfn_range() (which happens to set the relevant
> vma flag, among others), so in order to make sure expectations around
> VM_DONTEXPAND are met, let it explicitly set the flag like most other
> GEM mmap implementations do.
> 
> This avoids repeated warnings on a small minority of systems where the
> display is behind an IOMMU, and has a simple driver which does not
> override drm_gem_cma_default_funcs.

Apple system-on-chips have their display behind an IOMMU. Actually, a
separate IOMMU for each display, and a separate IOMMU for each display
controller -- so there are 4 IOMMUs total for display on the M1.

I've tested this patch against my work-in-progress display driver for
the M1. It indeed fixes the annoying warnings every frame (wayland) and
on mode setting (x11). So this is

	Tested-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

I've cherry-picked the patch into my M1 staging/downstream tree, so I
guess that's an Acked-by. I don't know anything about the vm_* stuff in
the kernel yet, though, since can't give a reviewed-by. Will leave that
one to the pro's.

I know you were trying to fix an HDLCD issue, but I needed this patch
too, so thank you! 😄
