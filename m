Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB83C89998
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 12:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5ED110E5B2;
	Wed, 26 Nov 2025 11:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NBNEBXRd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528F610E5B2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 11:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764157950;
 bh=A+Iy9gw/oSVl6UMpSq71sfSzaKWEJ3qOU3DO/TBzHvA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NBNEBXRdH0zPkD+//+cCuzgVTpk3/yCpKB64K4DVTatmEq8JhulAXdy9/fMgnfr2Z
 YuXtoSxhM74Vv/wiNlIO4zBywx3fGkuvY/lIFV3jw81W1Png+mXKZ6XltVDYtcr54a
 RN7HJWCKF9CkMewQRQxGmysYGEcO+7LzqMuHfNNS5oD6qG2iYGekJ2AbIYWO7VJT7C
 lDBhW90gWPX5nzPZlMom9F5ULJ4ErE3JSzE2W2ARmlVPy0Tl2Pc/e4QHWlfUSTU3e+
 /SoF2YmwWEr+eWbIOw30LnCd8mmXQrdI/pgJ/P58XxkOReseX5xb24r08r6t1myPnl
 7MIQl+s4hDlfA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CB26817E101A;
 Wed, 26 Nov 2025 12:52:29 +0100 (CET)
Date: Wed, 26 Nov 2025 12:52:26 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Detlev Casanova
 <detlev.casanova@collabora.com>, Ashley Smith <ashley.smith@collabora.com>,
 Philipp Stanner <pstanner@redhat.com>, kernel@collabora.com
Subject: Re: [PATCH v8 0/2] drm/panthor: Scheduler fixes for termination
 failure and timeouts
Message-ID: <20251126125226.37241407@fedora>
In-Reply-To: <20251113105734.1520338-1-boris.brezillon@collabora.com>
References: <20251113105734.1520338-1-boris.brezillon@collabora.com>
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

On Thu, 13 Nov 2025 11:57:32 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> This patch series includes previously attempted patches to fix panthor
> scheduler issues with spurious timeouts and issues when a termination
> failed which would lead to a race condition.
> 
> Timeout recovery has been tested with some IGT tests issuing jobs with
> infinite loops [1]. It's certainly not enough to claim that everything
> works as it should, but that's still more testing than we had so far
> ;-).
> 
> [1]https://gitlab.freedesktop.org/bbrezillon/igt-gpu-tools/-/commit/15c3ee220808a437a76638bd21fedfb4498a434f
> 
> Changes in v8:
>  - Don't touch drm_gpu_scheduler::timeout
> 
> Changes in v7:
>  - Add Steve's R-b
>  - Use the local group variable when we can
> 
> Changes in v6:
>  - Re-order changes
>  - Dropped the Fixes tag on one patch
>  - Cover UAF situation when the timeout work is pending/running at group
>    destruction time
> Changes in v5:
>  - Swiched to a patch series to make sure the patch which addresses the
>    bug is added as a requirement on the scheduler patch.
> Changes in v4:
>  - Moved code related to a timeout bug to a separate patch as this
>    was not relevant to this change.
> Changes in v3:
>  - Moved to a patch series to make sure this bug fix happens before the
>    changes to the scheduler
> Changes in v2:
>  - Fixed syntax error
> 
> Ashley Smith (2):
>   drm/panthor: Make the timeout per-queue instead of per-job
>   drm/panthor: Reset queue slots if termination fails

Queued to drm-misc-next.

> 
>  drivers/gpu/drm/panthor/panthor_sched.c | 295 +++++++++++++++++-------
>  1 file changed, 213 insertions(+), 82 deletions(-)
> 

