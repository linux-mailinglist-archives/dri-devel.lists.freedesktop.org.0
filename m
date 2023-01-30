Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F557681D3E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 22:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD1610E122;
	Mon, 30 Jan 2023 21:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FB610E122;
 Mon, 30 Jan 2023 21:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AOwgK4J/USURlQ6GUiAV4ksDn6/wvgO3ISwlcxsgcrQ=; b=U4hUwrLirSZ6RX0dEj4krWi4df
 ibddECaIkFzpGsG7UcjBhC70m7UmLI2F3ddNmtQDQKWCX4nyxJhhmuh7NJaLSJ7taA1nYxFJFl81U
 l1q7uSW5moK+YwUCscCuD6cJJ2c7xMB6Uk6hs9DwqWBhli3yBSC3f3NdmoWZxRUBP+trkR/4tuIbb
 QApBRIFPXB4hfXufnC1bINK5/FAIsxMFAFMRfl5GsCIduI207QLqUEnZjLdBnrxM+D8yMsgEsMuiL
 X2l2FfgAOIauKjq3lwt26l7qjtHmefmhAfOJqOfL4g/VTwfloVqTAuTV61wwWNU0JFYi70EQUHxLu
 iZfpi3Gg==;
Received: from [177.94.21.70] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pMc3V-004q7I-R9; Mon, 30 Jan 2023 22:51:14 +0100
Message-ID: <ac604d40-ef87-7147-b1ee-3620e68b3268@igalia.com>
Date: Mon, 30 Jan 2023 18:51:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched
 init/fini
Content-Language: en-US
To: amd-gfx@lists.freedesktop.org
References: <20230130214504.1305042-1-gpiccoli@igalia.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20230130214504.1305042-1-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: kernel@gpiccoli.net, Guchun Chen <guchun.chen@amd.com>, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Luben

(sorry, missed that in the first submission).

On 30/01/2023 18:45, Guilherme G. Piccoli wrote:
> Currently amdgpu calls drm_sched_fini() from the fence driver sw fini
> routine - such function is expected to be called only after the
> respective init function - drm_sched_init() - was executed successfully.
> 
> Happens that we faced a driver probe failure in the Steam Deck
> recently, and the function drm_sched_fini() was called even without
> its counter-part had been previously called, causing the following oops:
> 
> amdgpu: probe of 0000:04:00.0 failed with error -110
> BUG: kernel NULL pointer dereference, address: 0000000000000090
> PGD 0 P4D 0
> Oops: 0002 [#1] PREEMPT SMP NOPTI
> CPU: 0 PID: 609 Comm: systemd-udevd Not tainted 6.2.0-rc3-gpiccoli #338
> Hardware name: Valve Jupiter/Jupiter, BIOS F7A0113 11/04/2022
> RIP: 0010:drm_sched_fini+0x84/0xa0 [gpu_sched]
> [...]
> Call Trace:
>  <TASK>
>  amdgpu_fence_driver_sw_fini+0xc8/0xd0 [amdgpu]
>  amdgpu_device_fini_sw+0x2b/0x3b0 [amdgpu]
>  amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
>  devm_drm_dev_init_release+0x49/0x70
>  [...]
> 
> To prevent that, check if the drm_sched was properly initialized for a
> given ring before calling its fini counter-part.
> 
> Notice ideally we'd use sched.ready for that; such field is set as the latest
> thing on drm_sched_init(). But amdgpu seems to "override" the meaning of such
> field - in the above oops for example, it was a GFX ring causing the crash, and
> the sched.ready field was set to true in the ring init routine, regardless of
> the state of the DRM scheduler. Hence, we ended-up using another sched field.
> 
> Fixes: 067f44c8b459 ("drm/amdgpu: avoid over-handle of fence driver fini in s3 test (v2)")
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Guchun Chen <guchun.chen@amd.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
> 
> 
> Hi folks, first of all thanks in advance for reviews / comments!
> Notice that I've used the Fixes tag more in the sense to bring it
> to stable, I didn't find a good patch candidate that added the
> call to drm_sched_fini(), was reaching way too old commits...so
> 067f44c8b459 seems a good candidate - or maybe not?
> 
> Now, with regards sched.ready, spent a bit of time to figure what
> was happening...would be feasible maybe to stop using that to
> mark some kind ring status? I think it should be possible to add a
> flag to the ring structure for that, and free sched.ready from
> being manipulate by the amdgpu driver, what's your thoughts on that?
> 
> I could try myself, but first of course I'd like to raise the
> "temperature" on this topic and check if somebody is already working
> on that.
> 
> Cheers,
> 
> Guilherme
> 
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 00444203220d..e154eb8241fb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -618,7 +618,13 @@ void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev)
>  		if (!ring || !ring->fence_drv.initialized)
>  			continue;
>  
> -		if (!ring->no_scheduler)
> +		/*
> +		 * Notice we check for sched.name since there's some
> +		 * override on the meaning of sched.ready by amdgpu.
> +		 * The natural check would be sched.ready, which is
> +		 * set as drm_sched_init() finishes...
> +		 */
> +		if (!ring->no_scheduler && ring->sched.name)
>  			drm_sched_fini(&ring->sched);
>  
>  		for (j = 0; j <= ring->fence_drv.num_fences_mask; ++j)
