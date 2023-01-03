Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B418565C225
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 15:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3E010E047;
	Tue,  3 Jan 2023 14:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245E510E047;
 Tue,  3 Jan 2023 14:41:44 +0000 (UTC)
Received: from maud (unknown [12.157.81.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B189F6602CFA;
 Tue,  3 Jan 2023 14:41:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1672756902;
 bh=9kUBaPr5+/NLgDqrmIPkb/x8jcn2Rs9mopL9MBfl8Hs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M7W+Tc+M4crTRtWOpsrk7r7xw14EIiPobNgMAYi/54VpJkCdLi7xao1iSVl8YzgdG
 jYByAYZqJeLxMCgsIStPoPMshPXH1UD2uFknqqGkRGN7tQiZ543zW4nF4EFU1bW+3s
 DWPiTxwerzCjPtc/Kjzx3JlG9G15rgO9ro8s67AI85F9hU4ERhm+3pzG7MeDjF9YgH
 kZj+6R2jdmMcLR0jxEDuOdxAr0+4OHQzs7w8YQcV+FwAyrGFrQdqT5e2rbVY/zMM1C
 Lx6/zMDMW4p6AlNYPmFx35UjCWHVeACkKFqW43zRpjaJ3yzjfdt+pHbS8D4qmegcLm
 JYtzs83Zg5hWQ==
Date: Tue, 3 Jan 2023 09:41:31 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [RFC PATCH 00/20] Initial Xe driver submission
Message-ID: <Y7Q+m2m1rPV1HzBR@maud>
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <8c0a1792-c2bd-375f-fa56-747e34b085f4@suse.de>
 <87cz7xyxft.fsf@intel.com> <20230103145648.24947c06@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103145648.24947c06@collabora.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > For one thing, setting that up would be a lot of up front infrastructure
> > work. I'm not sure how to even pull that off when Xe is still
> > out-of-tree and i915 development plunges on upstream as ever.
> > 
> > For another, realistically, the overlap between supported platforms is
> > going to end at some point, and eventually new platforms are only going
> > to be supported with Xe. That's going to open up new possibilities for
> > refactoring also the display code. I think it would be premature to lock
> > in to a common directory structure or a common helper module at this
> > point.
> > 
> > I'm not saying no to the idea, and we've contemplated it before, but I
> > think there are still too many moving parts to decide to go that way.
> 
> FWIW, I actually have the same dilemma with the driver for new Mali GPUs
> I'm working on. I initially started making it a sub-driver of the
> existing panfrost driver (some HW blocks are similar, like the
> IOMMU and a few other things, and some SW abstracts can be shared here
> and there, like the GEM allocator logic). But I'm now considering
> forking the driver (after Alyssa planted the seed :-)), not only
> because I want to start from a clean sheet on the the uAPI front
> (wouldn't be an issue in your case, because you're talking about
> sharing helpers, not the driver frontend), but also because any refactor
> to panfrost is a potential source of regression for existing users. So,
> I tend to agree with Jani here, trying to share code before things have
> settled down is likely to cause pain to both Xe and i915
> users+developers.

++

I pretend to have never written a kernel driver, so will not comment
there. But Boris and I were previously bit trying to share code between
our GL and VK drivers, before VK settled down, causing pain for both. I
don't want a kernelside repeat of that (for either Mali or Intel).

I tend to think that, if you're tempted to share a driver frontend
without the backend, that's a sign that there's too much boilerplate for
the frontend and maybe there needs to be more helpers somewhere. For Xe,
that doesn't apply since the hw overlaps between the drivers, but for
Mali, there really is more different than similar and there's an
obvious, acute break between "old Mali" and "new Mali". The shared
"instantiate a DRM driver boilerplate" is pretty trivial, and the MMU
code is as simple as it gets...
