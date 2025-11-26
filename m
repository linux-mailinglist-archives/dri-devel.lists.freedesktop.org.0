Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622E2C89B49
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 13:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DD110E5B4;
	Wed, 26 Nov 2025 12:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="V5Rh9C0f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AAF10E5B4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 12:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764159251;
 bh=tTCa2desEfkyUjdnYg9Mzr1EB8ynVO6nopYqW0m+Hp4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V5Rh9C0fgFHRbkXqdAey3rG6xTQEYvl41oXScOKZRRnnD08GK/7v5xSkRgU4dRi01
 d6YbxYoFz2y5+ASlyKiTH3rF9EI/OxYCNHmfI1UPCp4EEX+UfrvngJSmpYMHBAVN++
 pBnm0hrRK+p3IeUeo7IrGegBUlqnjMcylyGfTwDgYsjTjQfFOahCi49zxgt2mCO5Cv
 uwNMf8tJCVfG9DkasW+IUUPLCh0cNTKoctJY0cv8WCMcL7TBSPEuE/hOwoyNkQR4vL
 awTAWcVHjy9AKznkZuycUVp+S8SdWXCk7nXf4dFfy8IvsDappI8DeFn9e/k6eQR/Rf
 tItpx1aNkSc1Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 385D817E110C;
 Wed, 26 Nov 2025 13:14:11 +0100 (CET)
Date: Wed, 26 Nov 2025 13:14:08 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin
 <florent.tomasin@arm.com>, Heinrich Fink <hfink@snap.com>,
 kernel@collabora.com
Subject: Re: [PATCH v2 0/8] drm/panthor: Misc scheduler fixes
Message-ID: <20251126131408.68e7d868@fedora>
In-Reply-To: <20251112115142.1270931-1-boris.brezillon@collabora.com>
References: <20251112115142.1270931-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 12 Nov 2025 12:51:34 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hello,
> 
> This series is a collection of fixes that seem to address the problem
> reported here [1]. In order to validate those changes, I added a few
> IGT tests [2], but I'd like to extend the test coverage before claiming
> this is working properly. Until I get to it, I thought I'd post what
> I have for preliminary review/testing.

I've posted the IGT patches to make sure the bugs fixed here are caught
if it ever regresses again. If there's no objection, I'd like to merge
those patches before the end of the week (given we're passed the 6.19
branching point, this should give us plenty of time to address
regressions, if any).

> 
> No major changes in this version, for more details, check the changelog
> in each patch.
> 
> Regards,
> 
> Boris
> 
> [1]https://gitlab.freedesktop.org/panfrost/linux/-/issues/48
> [2]https://gitlab.freedesktop.org/bbrezillon/igt-gpu-tools/-/tree/panthor-sched?ref_type=heads
> 
> Boris Brezillon (8):
>   drm/panthor: Simplify group idleness tracking
>   drm/panthor: Don't try to enable extract events
>   drm/panthor: Fix the group priority rotation logic
>   drm/panthor: Fix the full_tick check
>   drm/panthor: Fix immediate ticking on a disabled tick
>   drm/panthor: Fix the logic that decides when to stop ticking
>   drm/panthor: Make sure we resume the tick when new jobs are submitted
>   drm/panthor: Kill panthor_sched_immediate_tick()
> 
>  drivers/gpu/drm/panthor/panthor_sched.c | 190 ++++++++++++------------
>  1 file changed, 98 insertions(+), 92 deletions(-)
> 

