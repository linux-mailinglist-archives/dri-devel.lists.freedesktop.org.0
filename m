Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5511B7824
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 16:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEF06E0C1;
	Fri, 24 Apr 2020 14:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CBB6E0C1;
 Fri, 24 Apr 2020 14:16:00 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h2so10632832wmb.4;
 Fri, 24 Apr 2020 07:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8w7+uCUhpHYzbGOZ01QDp28us1IRO4sOqHhMEDTp6HU=;
 b=BiYJa3L1GcSsLCZerQTAWPtUGBFNe3HAGW+NlURNhdrUIHx5elsf6OKXLm9Pd8Qhyz
 SHsVP0xONFLTM0+8MEQTudYClzAUc0NAVzG/NuAgOYVpCaN6Xb7/Y5KKQ34m0jCnVJYR
 K+3WDdXRQ4M7Jnu3w8hl/XSkLFdp/sWxUydnF5mdRUQV4eEhIbyvFYHcwAwjPQ4KUOL1
 jdSRa7oO5bjwZNmgWqNsxhxSRu5DKThAKFe3PU+pijmgadH5BEj/UQLbc833T6GU2D3S
 tebRFoUOq9csCYKkH1F2n/ddySjJYAT6aRG98nfYpSLfVPp462kyWdugchTc7KdbNeNe
 qDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8w7+uCUhpHYzbGOZ01QDp28us1IRO4sOqHhMEDTp6HU=;
 b=bGjbMhoUM3i7x0oh3urd7xzVBpYjpYa8tKfb+kMfQv/6O5yRzf2xzfAGJdKHzRPyP0
 XV6YCZHI875eimzpsURGAWC83+YJI32W9ZshCxnfeSjFoouPpFDQBX0l3BKw9oaQyHeh
 sIikGoV2+B9oIiRNKjf7Ij5v8FkrkWM/zVaZbSEX0pAt/K+xk3o9Le+DwyNwoEzJqSVW
 fF0RK6v1FukiNZoLdnXBwNuGtglVZ7JIAHK+LIRhpYFHHefolTcTFCfFukSayR8ZT6SW
 kCV99IhbWq38bs8iEBHRPvd+JzuZqeMB/kdJ3oi201vPt8Tj/TS1zhAL+o0sy7PXqWnd
 I7nQ==
X-Gm-Message-State: AGi0PuZ3SImn1/SNZBiBeM3B90aqh38tmDyxDMzvFqVYsTRMQLd/6NaZ
 BXDxFRox27+oJC2y7vd1OZpEzYE0xVSaqSmwXDQ=
X-Google-Smtp-Source: APiQypJxpZVUieBMlP6z0fAEtLmFyuOe11V+/kd2k3pWQy9UVGsp+SwtFgmr/+ixgaFFx8G3scEDN72dvcJ81EwgYIU=
X-Received: by 2002:a1c:6344:: with SMTP id x65mr10535226wmb.56.1587737759026; 
 Fri, 24 Apr 2020 07:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200424125640.22656-1-colin.king@canonical.com>
In-Reply-To: <20200424125640.22656-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 Apr 2020 10:15:48 -0400
Message-ID: <CADnq5_OXYD0bkLZtfQeL0+B6RrcWjEn2yrAPRANpx0HAtEREEg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: fix unlocks on error return path
To: Colin King <colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 24, 2020 at 8:56 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the error returns paths are unlocking lock kiq->ring_lock
> however it seems this should be dev->gfx.kiq.ring_lock as this
> is the lock that is being locked and unlocked around the ring
> operations.  This looks like a bug, fix it by unlocking the
> correct lock.
>
> [ Note: untested ]
>
> Addresses-Coverity: ("Missing unlock")
> Fixes: 82478876eaac ("drm/amdgpu: protect ring overrun")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

It's the same lock, just accessed via a local pointer.  I'll take the
patch and update the commit message when I apply it to avoid confusion
in the future.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> index b120f9160f13..edaa50d850a6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> @@ -430,7 +430,7 @@ static int gmc_v10_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
>                 r = amdgpu_fence_emit_polling(ring, &seq, MAX_KIQ_REG_WAIT);
>                 if (r) {
>                         amdgpu_ring_undo(ring);
> -                       spin_unlock(&kiq->ring_lock);
> +                       spin_unlock(&adev->gfx.kiq.ring_lock);
>                         return -ETIME;
>                 }
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index 0a6026308343..055ecba754ff 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -624,7 +624,7 @@ static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
>                 r = amdgpu_fence_emit_polling(ring, &seq, MAX_KIQ_REG_WAIT);
>                 if (r) {
>                         amdgpu_ring_undo(ring);
> -                       spin_unlock(&kiq->ring_lock);
> +                       spin_unlock(&adev->gfx.kiq.ring_lock);
>                         return -ETIME;
>                 }
>
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
