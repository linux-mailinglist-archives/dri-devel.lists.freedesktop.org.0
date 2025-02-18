Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7E1A3A51F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 19:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E8C10E04E;
	Tue, 18 Feb 2025 18:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="sooZ/3QH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3293D10E04E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 18:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wLZah36tLm4xOWwJU55Pxm/enxSsJZjr9oUwxC7JWZg=; b=sooZ/3QHQye4tgIwF7EprYtpTw
 QfZjyavNYFnQTwhE2F5c9qB8uGoSIwJYwl1ADhN8au46xyjeCB96YDChy0F1hzlEPTcwm/MQYP7VE
 SxkC8Pg8mmz4KS492SepYPEs2SI+msvtk7fwBdtcni/DPIkhcJS1eWHXuWc5rPEbK7Nch7uPVuNJD
 fRFw28flOpN9HXNa8azfYnezZChgSLgYtKyu/7hNQsZZUtrRnQ+aPfapTnYUrdyb0vCxLJJFx3xJQ
 idc0J7D0IWV3RzLbGz+hLFQMTYrojQdbik78Kcep0okhgnoVNMOsERQ0TgJs7KL5EHO5NjAcmX+Me
 pjCVP2nA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tkSAj-00BPDZ-4t; Tue, 18 Feb 2025 19:18:23 +0100
Message-ID: <3c7da108-4692-4456-ad23-7e5d51f0f606@igalia.com>
Date: Tue, 18 Feb 2025 18:18:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/sched: Fix preprocessor guard
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250218124149.118002-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250218124149.118002-2-phasta@kernel.org>
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


On 18/02/2025 12:41, Philipp Stanner wrote:
> When writing the header guard for gpu_scheduler_trace.h, a typo,
> apparently, occurred.
> 
> Fix the typo and document the scope of the guard.
> 
> Fixes: 353da3c520b4 ("drm/amdgpu: add tracepoint for scheduler (v2)")
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> I just discovered this. But I have little understanding of what is going
> on in this header in the first place, so I kindly ask for comments on
> this entire guard line with its logical or ||
> 
> The code hasn't been touched since 2015. So it seems it at least didn't
> cause bugs.

No other header includes so it never caused a problem.

> P.
> ---
>   drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index c75302ca3427..f56e77e7f6d0 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -21,7 +21,7 @@
>    *
>    */
>   
> -#if !defined(_GPU_SCHED_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> +#if !defined(_GPU_SCHED_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
>   #define _GPU_SCHED_TRACE_H_
>   
>   #include <linux/stringify.h>
> @@ -106,7 +106,7 @@ TRACE_EVENT(drm_sched_job_wait_dep,
>   		      __entry->seqno)
>   );
>   
> -#endif
> +#endif /* _GPU_SCHED_TRACE_H_ */
>   
>   /* This part must be outside protection */
>   #undef TRACE_INCLUDE_PATH

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

