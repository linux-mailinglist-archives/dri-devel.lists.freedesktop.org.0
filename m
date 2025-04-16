Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD04FA8B20E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 09:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDA210E868;
	Wed, 16 Apr 2025 07:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gaqFbA2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061CD10E867;
 Wed, 16 Apr 2025 07:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JwobS364zmSsD5+VPW6jxonJjGIzHyIDQmMvrDv4xWM=; b=gaqFbA2AVj69FCrf1RLy5eujHl
 BCObck6GgXhzv707OiHQX7zT+myC0HP19ezTXSCOo+vu8J5s6KSKs8Y+UgbzqerpoKZqJKYgAG2AU
 YIHv2gybOKQ5oCdedABA/vUO1FfuFaha5hS7OFejU/ohd6XdJUxNqmyo7WlscQYmFUqUN9Cpjglpf
 MDXCesnkmzV3zHpmvaT+4wGcFkhXSSERfQ+JoZqnlcVcKF8ibmkHlvOknFSzBEcGEElMQfOab1G+j
 B9K66sGm0GJ2YDCPyn3yi/b/qfnay3KttUbGloR9MMi13anmfdRuRsaveY4vp/TrMQgoNuqTduo9F
 xygfPXYQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u4xAP-00HH5l-65; Wed, 16 Apr 2025 09:26:41 +0200
Message-ID: <34b082d4-b320-4eb3-8b36-fb63ffca3730@igalia.com>
Date: Wed, 16 Apr 2025 08:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/amdgpu: use drm_file_err in logging to also
 dump process information
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250415184318.2465197-1-sunil.khatri@amd.com>
 <20250415184318.2465197-3-sunil.khatri@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250415184318.2465197-3-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 15/04/2025 19:43, Sunil Khatri wrote:
> add process and pid information in the userqueue error
> logging to make it more useful in resolving the error
> by logs.
> 
> Sample log:
> [   42.444297] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] *ERROR* Timed out waiting for fence f=000000001c74d978 for comm:Xwayland pid:3427
> [   42.444669] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not suspending userqueue, timeout waiting for comm:Xwayland pid:3427
> [   42.824729] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] *ERROR* Timed out waiting for fence f=0000000074407d3e for comm:systemd-logind pid:1058
> [   42.825082] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not suspending userqueue, timeout waiting for comm:systemd-logind pid:1058
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
> index 1867520ba258..05c1ee27a319 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
> @@ -43,7 +43,7 @@ amdgpu_userqueue_cleanup(struct amdgpu_userq_mgr *uq_mgr,
>   	if (f && !dma_fence_is_signaled(f)) {
>   		ret = dma_fence_wait_timeout(f, true, msecs_to_jiffies(100));
>   		if (ret <= 0) {
> -			DRM_ERROR("Timed out waiting for fence f=%p\n", f);
> +			drm_file_err(uq_mgr->file, "Timed out waiting for fence f=%p\n", f);

You decided to leave %p after all?

>   			return;
>   		}
>   	}
> @@ -440,7 +440,8 @@ amdgpu_userqueue_resume_all(struct amdgpu_userq_mgr *uq_mgr)
>   	}
>   
>   	if (ret)
> -		DRM_ERROR("Failed to map all the queues\n");
> +		drm_file_err(uq_mgr->file, "Failed to map all the queue\n");

You lost the plural by accident.

I am also not sure "all the queues" makes sense in this context versus 
"all queues" but it's inconsequential really.

> +
>   	return ret;
>   }
>   
> @@ -598,7 +599,8 @@ amdgpu_userqueue_suspend_all(struct amdgpu_userq_mgr *uq_mgr)
>   	}
>   
>   	if (ret)
> -		DRM_ERROR("Couldn't unmap all the queues\n");
> +		drm_file_err(uq_mgr->file, "Couldn't unmap all the queues\n");
> +
>   	return ret;
>   }
>   
> @@ -615,7 +617,7 @@ amdgpu_userqueue_wait_for_signal(struct amdgpu_userq_mgr *uq_mgr)
>   			continue;
>   		ret = dma_fence_wait_timeout(f, true, msecs_to_jiffies(100));
>   		if (ret <= 0) {
> -			DRM_ERROR("Timed out waiting for fence f=%p\n", f);
> +			drm_file_err(uq_mgr->file, "Timed out waiting for fence f=%p\n", f);
>   			return -ETIMEDOUT;
>   		}
>   	}
> @@ -634,13 +636,13 @@ amdgpu_userqueue_suspend(struct amdgpu_userq_mgr *uq_mgr,
>   	/* Wait for any pending userqueue fence work to finish */
>   	ret = amdgpu_userqueue_wait_for_signal(uq_mgr);
>   	if (ret) {
> -		DRM_ERROR("Not suspending userqueue, timeout waiting for work\n");
> +		drm_file_err(uq_mgr->file, "Not suspending userqueue, timeout waiting\n");
>   		return;
>   	}
>   
>   	ret = amdgpu_userqueue_suspend_all(uq_mgr);
>   	if (ret) {
> -		DRM_ERROR("Failed to evict userqueue\n");
> +		drm_file_err(uq_mgr->file, "Failed to evict userqueue\n");
>   		return;

It is pre-existing but strikes me as odd that failure to 
amdgpu_userqueue_suspend_all() logs a failure to *evict* instead of 
suspend (as the previous log does). Anyway, I did not look at the 
surrounding code so just thinking out loud.

Regards,

Tvrtko

>   	}
>   

