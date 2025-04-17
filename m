Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9D2A9192E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 12:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7443210EA9B;
	Thu, 17 Apr 2025 10:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dfQKQB43";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2644610E1AC;
 Thu, 17 Apr 2025 10:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4gAAAy4MiWKbvXuC03x5Dl8ITPPu7sxbi1HdD0YXLjQ=; b=dfQKQB43YA4WzWMoVonPkfeL0N
 rcWOvhYoPhPT3sCp+1sWpcNnTpM96rng26y53jKJyNILNYycmzkUtoMtp7Mm53jeq2YxCbiymNwZH
 rSsKhYQYgUpqi0UOXIkTGrenKu/Qs+yzVU37I6iB/37csghjeuFxT/I411vK9FN28UFcr9JtHJYJq
 V6kYbdPusHk7KQVvsOSL3KSUEADl4Pk/JP2wq/aCIMlZWzxd2AkoNBGvlz/12YNllv+fvSTNKgaYF
 Ddnj2wrlZb5aN/DwaHBfW+MZ3gz6a+Mr9RDtxqAvlRFJSVhKYM7j2OeiTdklgdZpYKWgBsiYXYysO
 /IGOWzvw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u5MNK-000lXj-Cw; Thu, 17 Apr 2025 12:21:42 +0200
Message-ID: <deb4892a-0480-4f5c-b063-1bb03e7cb0e6@igalia.com>
Date: Thu, 17 Apr 2025 11:21:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/sched: fix the warning in drm_sched_job_done
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250417100139.2814393-1-sunil.khatri@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250417100139.2814393-1-sunil.khatri@amd.com>
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


On 17/04/2025 11:01, Sunil Khatri wrote:
> Fix the below warning.
> scheduler/sched_main.c:397: warning: Function parameter or struct member 'result' not described in 'drm_sched_job_done'
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index bfea608a7106..3c03dfdda966 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -390,6 +390,7 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
>   /**
>    * drm_sched_job_done - complete a job
>    * @s_job: pointer to the job which is done
> + * @result: error code for dma fence for schedular

SchedulEr ;)

Regards,

Tvrtko

>    *
>    * Finish the job's fence and wake up the worker thread.
>    */

