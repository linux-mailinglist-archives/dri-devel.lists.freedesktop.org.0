Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 252A5A041C4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1176210E3FA;
	Tue,  7 Jan 2025 14:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RaDPDfw8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7B810E311
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RdIemA136J+yNatsWQtAPZWaqZCDWOa/uCvJfG57dMU=; b=RaDPDfw8U+1hA7jseZ53VYdXRh
 /tPeAqnz0iI3tlhhoGLVfBszcVY7KrY90Mojt2pk7t7qUg0lEps91du9FijT/GlBB7+nawXnD3VTY
 IxENO3BCBhs2WvVbJSDXUUk/w2Lug0640bkjKc0YXH9ejJpsstUot5NTyp1rgNfKDwXYpIzrfScmu
 gwu8Hh2bFGGrjdKXLYsFELSJ7z759Q7HG+kMOrkH4xw6ycHyUiLoN5s2TLhG83GQkX1pR/bCL2MlQ
 OyTtUhcEsauPq3o5VoQJIHtqJB23XHRdR/l3vz9ToksmvIW+40ocVFpw1LKYju1NCK4qBtO7lTzs/
 2aPqyCUQ==;
Received: from [179.214.71.67] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tVAIS-00Cl1i-6B; Tue, 07 Jan 2025 15:11:04 +0100
Message-ID: <94802f20-6208-4f2a-b9fb-f74cafb7ed5c@igalia.com>
Date: Tue, 7 Jan 2025 11:10:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] drm/vc4: Clean-up BO seqnos
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241220134204.634577-1-mcanal@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20241220134204.634577-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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




On 20/12/2024 10:37, Maíra Canal wrote:
> This series introduces a series of clean-ups for BO reservations in
> the VC4 driver. Currently, VC4 uses shared fences to track BO
> reservations, similar to many other DRM devices. However, in addition
> to DMA reservation objects, VC4 has been maintaining a separate seqno
> tracking system for BOs to track job completion.
>
> The seqno tracking system was implemented before DMA reservation
> objects and was left in the code after DMA reservation's introduction.
> This approach is now redundant, as job completion can be effectively
> tracked using fences. Consequently, this series focuses on eliminating
> seqnos from the BO implementation.
>
> Patch Breakdown
> ===============
>
> * Patch #1: Uses the DRM Exec to replace the open-coded implementation
> of the functions `drm_gem_lock_reservations()` and
> `drm_gem_unlock_reservations()` in the VC4 driver code. A straightforward
> change with no functional changes.
>
> * Patch #2: Implements the VC4 wait BO IOCTL using DMA Resv Objects.
> The new implementation closely mirrors the V3D approach and removes
> the IOCTL's dependency on BO sequence numbers.
>
> * Patch #3: The central piece of this patchset. It removes `bo->seqno`,
> `bo->write_seqno`, and `exec->bin_dep_seqno` from the driver. As the
> seqno tracking system is redundant, its deletion is relatively
> straightforward. The only notable change is `vc4_async_set_fence_cb()`,
> which now uses `dma_fence_add_callback()` to add the VC4 callback.
This series is:

Reviewed-by: Melissa Wen <mwen@igalia.com>

Thanks!
>
> Changes
> =======
>
> v1 -> v2: https://lore.kernel.org/dri-devel/20241206131706.203324-1-mcanal@igalia.com/T/
>
> * [1/4] Use DRM Exec to replace the (un)lock reservation functions
>          (Christian König)
>
> v2 -> v3: https://lore.kernel.org/dri-devel/20241212202337.381614-1-mcanal@igalia.com/T/
>
> * [1/4] König's A-b (Christian König)
> * [2/4] s/dma_gem_dma_resv_wait/drm_gem_dma_resv_wait (Melissa Wen)
> * [2/4] Use `usecs_to_jiffies()` to calculate the timeout in jiffies
>          (Tvrtko Ursulin)
> * [2/4] Remove -EAGAIN errno from the IOCTL (Tvrtko Ursulin)
> * [3/4] s/vc4_async_page_flip_seqno_complete/vc4_async_page_flip_complete_with_cleanup
>          (Melissa Wen)
> * [3/4] Add `dma_fence_put()` in `vc4_async_page_flip_complete_with_cleanup()`
> * [3/4] Maxime's R-b (Maxime Ripard)
> * [4/4] Squashed to PATCH 3/4 (Melissa Wen)
> * [4/4] Remove `vc4->seqno_cb_list` and `struct vc4_seqno_cb` (Tvrtko Ursulin)
>
> Best Regards,
> - Maíra
>
> ---
>
> Maíra Canal (3):
>    drm/vc4: Use DRM Execution Contexts
>    drm/vc4: Use DMA Resv to implement VC4 wait BO IOCTL
>    drm/vc4: Remove BOs seqnos
>
>   drivers/gpu/drm/vc4/Kconfig        |   1 +
>   drivers/gpu/drm/vc4/vc4_crtc.c     |  33 +++---
>   drivers/gpu/drm/vc4/vc4_drv.h      |  27 -----
>   drivers/gpu/drm/vc4/vc4_gem.c      | 183 ++++++-----------------------
>   drivers/gpu/drm/vc4/vc4_validate.c |  11 --
>   5 files changed, 53 insertions(+), 202 deletions(-)
>

