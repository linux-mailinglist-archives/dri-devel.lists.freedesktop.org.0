Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525A8A91E44
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 15:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D93710E29C;
	Thu, 17 Apr 2025 13:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eMZthCMr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B1510EB12;
 Thu, 17 Apr 2025 13:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y7w6bT08PHtfbUI9TiNNMNacc4NzsXmM1elwFQ06mFs=; b=eMZthCMr4g9M9TPsaYsgtnYvqf
 tz/MqWKkyBkVnE9GcjFwpHJs4Ah5Vm34zU8gJFam2hvV89FzMCczYiORD3tILFdjUAhSDar6XPmvu
 RDaL6BJXSIiYRkdl29Nk4jYSQahKVOLDhRMrNCNhPTJosKHjjp3JTXVhXE8RkNTQaWFFeZ0TUNwM7
 JGlmqHjhzKEzLyQBbC5WOf/DxJEY18zcAIF1h9KG5+fmcS+BSARiaSOGmLPXHSes4A4Y2oKBqBxsK
 hn3MWdW2Zd0LLO7zNHa4eQsa+oTsajE8CAMWDDzMyUjnQB7pRIMV0kP6yQuBJo2os/alTLEbL3H8v
 PhCOEXdQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u5PUK-000pKf-59; Thu, 17 Apr 2025 15:41:08 +0200
Message-ID: <1bf5b875-52bb-4ce0-8b7a-50837407bada@igalia.com>
Date: Thu, 17 Apr 2025 14:41:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 3/5] drm/amdgpu: use drm_file_err in fence timeouts
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250417123155.4002358-1-sunil.khatri@amd.com>
 <20250417123155.4002358-3-sunil.khatri@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250417123155.4002358-3-sunil.khatri@amd.com>
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


On 17/04/2025 13:31, Sunil Khatri wrote:
> use drm_file_err instead of DRM_ERROR which adds
> process and pid information in the userqueue error
> logging.
> 
> Sample log:
> [   42.444297] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] *ERROR* Timed out waiting for fence f=000000001c74d978 for comm:Xwayland pid:3427
> [   42.444669] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not suspending userqueue, timeout waiting for comm:Xwayland pid:3427
> [   42.824729] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] *ERROR* Timed out waiting for fence f=0000000074407d3e for comm:systemd-logind pid:1058
> [   42.825082] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not suspending userqueue, timeout waiting for comm:systemd-logind pid:1058

If you have some oomph left after this many revisions in a short time it 
would be good to update the examples to latest format.

> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c | 21 ++++++++++++-------
>   1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
> index cd9dc0018ee6..613a3a63301b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
> @@ -43,8 +43,9 @@ amdgpu_userqueue_cleanup(struct amdgpu_userq_mgr *uq_mgr,
>   	if (f && !dma_fence_is_signaled(f)) {
>   		ret = dma_fence_wait_timeout(f, true, msecs_to_jiffies(100));
>   		if (ret <= 0) {
> -			DRM_ERROR("Timed out waiting for fence=%llu:%llu\n",
> -				  f->context, f->seqno);
> +			drm_file_err(uq_mgr->file,
> +				     "Timed out waiting for fence: context=%llu seqno:%llu\n",
> +				     f->context, f->seqno);

I would just go "...fence=%llu:%llu" for consistency with tracepoints 
but up to you.

>   			return;
>   		}
>   	}
> @@ -456,7 +457,8 @@ amdgpu_userqueue_resume_all(struct amdgpu_userq_mgr *uq_mgr)
>   	}
>   
>   	if (ret)
> -		DRM_ERROR("Failed to map all the queues\n");
> +		drm_file_err(uq_mgr->file, "Failed to map all the queues\n");
> +
>   	return ret;
>   }
>   
> @@ -614,7 +616,8 @@ amdgpu_userqueue_suspend_all(struct amdgpu_userq_mgr *uq_mgr)
>   	}
>   
>   	if (ret)
> -		DRM_ERROR("Couldn't unmap all the queues\n");
> +		drm_file_err(uq_mgr->file, "Couldn't unmap all the queues\n");
> +
>   	return ret;
>   }
>   
> @@ -631,8 +634,10 @@ amdgpu_userqueue_wait_for_signal(struct amdgpu_userq_mgr *uq_mgr)
>   			continue;
>   		ret = dma_fence_wait_timeout(f, true, msecs_to_jiffies(100));
>   		if (ret <= 0) {
> -			DRM_ERROR("Timed out waiting for fence=%llu:%llu\n",
> -				  f->context, f->seqno);
> +			drm_file_err(uq_mgr->file,
> +				     "Timed out waiting for fence: context=%llu seqno:%llu\n",
> +				     f->context, f->seqno);
> +
>   			return -ETIMEDOUT;
>   		}
>   	}
> @@ -651,13 +656,13 @@ amdgpu_userqueue_suspend(struct amdgpu_userq_mgr *uq_mgr,
>   	/* Wait for any pending userqueue fence work to finish */
>   	ret = amdgpu_userqueue_wait_for_signal(uq_mgr);
>   	if (ret) {
> -		DRM_ERROR("Not suspending userqueue, timeout waiting for work\n");
> +		drm_file_err(uq_mgr->file, "Not suspending userqueue, timeout waiting\n");

...work?

Anyway, we can tidy it later.

With or without fence=%llu:%llu:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

>   		return;
>   	}
>   
>   	ret = amdgpu_userqueue_suspend_all(uq_mgr);
>   	if (ret) {
> -		DRM_ERROR("Failed to evict userqueue\n");
> +		drm_file_err(uq_mgr->file, "Failed to evict userqueue\n");
>   		return;
>   	}
>   

