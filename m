Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB053ECF79
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 09:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D3589C8D;
	Mon, 16 Aug 2021 07:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34FD89C8D;
 Mon, 16 Aug 2021 07:38:34 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q10so22190827wro.2;
 Mon, 16 Aug 2021 00:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=A1Cvwxi4LGlt/0yKCIl36gv62GuMM6RNpQclDirQKfo=;
 b=GbL3lEfxKdlxart7nc5QhivH3kZOfElOBvhbbzlOwnsZn+4U2EpUveTaf1Q1oKn7Hr
 s/nvvMbtIkU4w51EqiFK0j3it6uA+ozGHa39Ki4aoa70GDJ7lvuapgIsolZULng1LZEy
 0bPZh22kjHI+FesSLcD1lN2NtrBt3wgm+wpajEEa64FIENUInINeBd/JdaMSzzyO1udT
 ZrC/rWUNDjtENlXPXfezBG4dyX45zsTY21fiQ0bjamZPQSOeW8z9l3W05gs7j0SmPufl
 5DZ2zcQap9HXApeR3dbMmybOqkR3jY7nR8p+LMlWrPhRCM7jkbsQ9QnezvYByQcqS9QF
 GJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=A1Cvwxi4LGlt/0yKCIl36gv62GuMM6RNpQclDirQKfo=;
 b=LvHj3iMQYYtOk8UfoJHlBGoDl8kBqo8B6wlgvkm7HqZfM32yFgWJkhVZnF80tdQQKx
 FvKtukzT+hEWURgqKAC6Qm2LmYPW9AgTn+nsuw0kC6JHcDp/AjCMlvDkJjFQ/gwkk8XX
 y9mqPC87mJ7/Ktfvou3q8sfs/BwLnNUovuh8SmQHNyLTzogLYsOYer376PoDImr9VkIQ
 +fybOZ8ywVHyclxVehCdQvC8FUj/eXImNRyrNsiEVysadoFpbxUEKmx7JrmvqOFKyqqM
 dHdeFSVN/Moc+XJvR94mECH/F+PLLqaE3t/4VhdapDXc0cJTWdJdH7OJ/VP4+gqmZoC3
 12TQ==
X-Gm-Message-State: AOAM532GyLJQgiyEnStr86dhuMMleV8NKdLq1SxLF9NdXzUYnhAl29EQ
 gdQMUiC57BNXL23xSapccCDTlSP36hU=
X-Google-Smtp-Source: ABdhPJwvwWIeAl06vr7mgftmWuJEuEzjkt6jgdBsptzKZ4AfPUPQfbR8T/lBUm3zsZSm5UL5r9aDVw==
X-Received: by 2002:a5d:4311:: with SMTP id h17mr16802527wrq.263.1629099513219; 
 Mon, 16 Aug 2021 00:38:33 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7d83:fd8:eb16:8605?
 ([2a02:908:1252:fb60:7d83:fd8:eb16:8605])
 by smtp.gmail.com with ESMTPSA id z126sm9841580wmc.11.2021.08.16.00.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 00:38:32 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210811165211.6811-1-michel@daenzer.net>
 <20210813102920.3458-1-michel@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f63510d7-4449-34e9-98bd-bc2d07b08a03@gmail.com>
Date: Mon, 16 Aug 2021 09:38:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813102920.3458-1-michel@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Am 13.08.21 um 12:29 schrieb Michel Dänzer:
> From: Michel Dänzer <mdaenzer@redhat.com>
>
> schedule_delayed_work does not push back the work if it was already
> scheduled before, so amdgpu_device_delay_enable_gfx_off ran ~100 ms
> after the first time GFXOFF was disabled and re-enabled, even if GFXOFF
> was disabled and re-enabled again during those 100 ms.
>
> This resulted in frame drops / stutter with the upcoming mutter 41
> release on Navi 14, due to constantly enabling GFXOFF in the HW and
> disabling it again (for getting the GPU clock counter).
>
> To fix this, call cancel_delayed_work_sync when GFXOFF transitions from
> enabled to disabled. This makes sure the delayed work will be scheduled
> as intended in the reverse case.
>
> In order to avoid a deadlock, amdgpu_device_delay_enable_gfx_off needs
> to use mutex_trylock instead of mutex_lock.
>
> v2:
> * Use cancel_delayed_work_sync & mutex_trylock instead of
>    mod_delayed_work.

While this may work it still smells a little bit fishy.

In general you have two common locking orders around work items, either 
lock->work or work->lock. If you mix this as lock->work->lock like here 
trouble is usually imminent.

I think what we should do instead is to double check if taking the lock 
inside the work item is necessary and instead making sure that the work 
is sync canceled when we don't want it to run. In other words fully 
switching to the lock->work approach.

But please note that this are just high level design thoughts, I don't 
really know the details of the gfx_off code at all. Could even be that 
we need two locks, one outside and one inside of the work item.

Regards,
Christian.

>
> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 ++++++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 13 +++++++------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h    |  3 +++
>   3 files changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index f3fd5ec710b6..8b025f70706c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2777,7 +2777,16 @@ static void amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
>   	struct amdgpu_device *adev =
>   		container_of(work, struct amdgpu_device, gfx.gfx_off_delay_work.work);
>   
> -	mutex_lock(&adev->gfx.gfx_off_mutex);
> +	/* mutex_lock could deadlock with cancel_delayed_work_sync in amdgpu_gfx_off_ctrl. */
> +	if (!mutex_trylock(&adev->gfx.gfx_off_mutex)) {
> +		/* If there's a bug which causes amdgpu_gfx_off_ctrl to be called with enable=true
> +		 * when adev->gfx.gfx_off_req_count is already 0, we might race with that.
> +		 * Re-schedule to make sure gfx off will be re-enabled in the HW eventually.
> +		 */
> +		schedule_delayed_work(&adev->gfx.gfx_off_delay_work, AMDGPU_GFX_OFF_DELAY_ENABLE);
> +		return;
> +	}
> +
>   	if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>   		if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, true))
>   			adev->gfx.gfx_off_state = true;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> index a0be0772c8b3..da4c46db3093 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -28,9 +28,6 @@
>   #include "amdgpu_rlc.h"
>   #include "amdgpu_ras.h"
>   
> -/* delay 0.1 second to enable gfx off feature */
> -#define GFX_OFF_DELAY_ENABLE         msecs_to_jiffies(100)
> -
>   /*
>    * GPU GFX IP block helpers function.
>    */
> @@ -569,9 +566,13 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
>   		adev->gfx.gfx_off_req_count--;
>   
>   	if (enable && !adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
> -		schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
> -	} else if (!enable && adev->gfx.gfx_off_state) {
> -		if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
> +		schedule_delayed_work(&adev->gfx.gfx_off_delay_work, AMDGPU_GFX_OFF_DELAY_ENABLE);
> +	} else if (!enable) {
> +		if (adev->gfx.gfx_off_req_count == 1 && !adev->gfx.gfx_off_state)
> +			cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);
> +
> +		if (adev->gfx.gfx_off_state &&
> +		    !amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
>   			adev->gfx.gfx_off_state = false;
>   
>   			if (adev->gfx.funcs->init_spm_golden) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
> index d43fe2ed8116..dcdb505bb7f4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
> @@ -32,6 +32,9 @@
>   #include "amdgpu_rlc.h"
>   #include "soc15.h"
>   
> +/* delay 0.1 second to enable gfx off feature */
> +#define AMDGPU_GFX_OFF_DELAY_ENABLE msecs_to_jiffies(100)
> +
>   /* GFX current status */
>   #define AMDGPU_GFX_NORMAL_MODE			0x00000000L
>   #define AMDGPU_GFX_SAFE_MODE			0x00000001L

