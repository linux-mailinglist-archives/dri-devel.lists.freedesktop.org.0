Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AF79944ED
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 11:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B889B10E4B6;
	Tue,  8 Oct 2024 09:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Kq7csZMz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3B810E20C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 09:59:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B5BFF5C5433;
 Tue,  8 Oct 2024 09:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49740C4CEC7;
 Tue,  8 Oct 2024 09:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1728381561;
 bh=7/ulf8aESND0FPeI6VfQVV6see6Ees/8tM6yesV090s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kq7csZMzJaBVqdfzyRaNHWVcVSxzoRDebga81FKhdnnLLIoX+3l5J8jmwoWF+WqEn
 s0A0SKx23SpLw92/0Gd7bdss7Xt+Mu/oRpr2GtL5hqSmj0IN3DP68iq13SGL0z69Gh
 hU13aw923URmOMnyxVTwE9bNcUoiIx2tXsLZBiTI=
Date: Tue, 8 Oct 2024 11:59:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: airlied@gmail.com, alexander.deucher@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ltuikov89@gmail.com,
 matthew.brost@intel.com, pstanner@redhat.com,
 tvrtko.ursulin@igalia.com, stable-commits@vger.kernel.org
Subject: Re: Patch "drm/sched: Always wake up correct scheduler in
 drm_sched_entity_push_job" has been added to the 6.10-stable tree
Message-ID: <2024100806-abroad-safeguard-7b30@gregkh>
References: <2024100752-shaking-sycamore-3cc4@gregkh>
 <8badb067-3cb3-431f-8081-be1bc0b9729b@amd.com>
 <2024100743-oozy-moving-59d4@gregkh>
 <dcd15de0-f2d7-45e1-bac0-1d600173465f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcd15de0-f2d7-45e1-bac0-1d600173465f@amd.com>
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

On Mon, Oct 07, 2024 at 08:23:54PM +0200, Christian König wrote:
> Am 07.10.24 um 19:59 schrieb Greg KH:
> > On Mon, Oct 07, 2024 at 07:53:26PM +0200, Christian König wrote:
> > > Hi Greg,
> > > 
> > > please drop this patch from all backports. It turned out to be broken and
> > > the old handling has been restored by a revert.
> > > 
> > > Sorry for the noise. The revert should show up in Linus tree by the end of
> > > the week.
> > What is the revert's git id?  I'd rather take that so we don't have any
> > "why wasn't this patch applied" stuff later on.
> 
> Good point. I was also not 100% sure which ones of Tvrtko's patches we had
> to revert.
> 
> Here is the git Id from the drm-misc-fixes branch:
> 
> commit abf201f6ce14c4ceeccde5471bdf59614b83a3d8
> Author: Christian König <christian.koenig@amd.com>
> Date:   Mon Sep 30 15:07:49 2024 +0200
> 
>     drm/sched: revert "Always increment correct scheduler score"
> 
>     This reverts commit 087913e0ba2b3b9d7ccbafb2acf5dab9e35ae1d5.
> 
>     It turned out that the original code was correct since the rq can only
>     change when there is no armed job for an entity.
> 
>     This change here broke the logic since we only incremented the counter
>     for the first job, so revert it.
> 
>     Signed-off-by: Christian König <christian.koenig@amd.com>
>     Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>     Link: https://patchwork.freedesktop.org/patch/msgid/20240930131451.536150-1-christian.koenig@amd.com
> 
> Sorry for the noise, we should have catched that during the review and put
> the stable tag on the revert as well.

Thanks for the info, I've picked this revert up now as well.

greg k-h
