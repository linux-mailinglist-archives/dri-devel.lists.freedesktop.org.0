Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A19A917E3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 11:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAAF10EA6D;
	Thu, 17 Apr 2025 09:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VNYHiDNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD6C10E1C7;
 Thu, 17 Apr 2025 09:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V1d5EIBpCNDGqdaaS+OAWrNdD5MdtoajN7H4iYPcTMw=; b=VNYHiDNiv2evSNt4E3funDa+Y8
 yZ+jVHJhkBk5xEvuDazhUuO4JlJ4m4YVV7FhLXB6KgBRLfE0sJ+HSOuMq8643TlKblHJCkLYZ2sYT
 RSTqSo3AQXAri/VjirzIviqEb6T+gUx16iDEQAy+j2641Ahdl+6GEtb9h835kimGUiDHwrY5oWaP3
 tlwGwlAwVNxcnscV5cPbgyOCS/yu5TOdsP4OZRoplXRq2e+ESld99WRwGGd1Ua0U/ciiY+OgVBThb
 ZZgSEgRGbyAPidZD5N3d/J0/8aOL3V41H3sKhHBC6w5ps4/OW+oZ1D6yFB1tMylKK2qySccYtcZYS
 z41D1WgA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u5LaR-000khT-Lr; Thu, 17 Apr 2025 11:31:11 +0200
Message-ID: <cfaffac8-e1cb-4a1f-b35c-7832a5da2d98@igalia.com>
Date: Thu, 17 Apr 2025 10:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/schedular: fix the warning in drm_sched_job_done
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>
References: <20250417092514.2241612-1-sunil.khatri@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250417092514.2241612-1-sunil.khatri@amd.com>
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


[Added Philipp and Danilo to cc.]

On 17/04/2025 10:25, Sunil Khatri wrote:
> Fix the below warning.
> scheduler/sched_main.c:397: warning: Function parameter or struct member 'result' not described in 'drm_sched_job_done'
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index bfea608a7106..2b5cf2bdf900 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -390,6 +390,7 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
>   /**
>    * drm_sched_job_done - complete a job
>    * @s_job: pointer to the job which is done
> + * @result: passed dma fence error
>    *
>    * Finish the job's fence and wake up the worker thread.
>    */

s/drm\/schedular:/drm\/sched:/

With that:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Optionally, "passed dma fence error" could perhaps be improved to say 
something like "Error code to set on the scheduler fence".

Regards,

Tvrtko

