Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1951EACAD34
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 13:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5D810E500;
	Mon,  2 Jun 2025 11:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="f+fOfQja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC0310E4F9;
 Mon,  2 Jun 2025 11:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6zZBRSUtKstvISsMK78xwVNlHOSYBVQcB/R/5DyfZaU=; b=f+fOfQjajBsSoXBxexr8FCnRGH
 m73DYZsowVGPeDKmH+ml8hDDNFZxBU/ZRJZEYxUlRn9NDDcjuZa7Q6q04XTYnCAJEkq3+KF25CheJ
 KiJ8q5u+W6RGBuSPmZkQZV88wfKf2p6XIjGj6DLcazHW+29yFlHPIcSOVQRAzj3hvkOliQR7dapvj
 oWH9Q8S/u6aHsV3TyzFh95I03XG49p3DHLPNevFxWGVh0R2s3vsJECLKs5gi01cjpQBfAZXBE3kve
 1/AQdf/GpKsxyvGxip18aeZRG3qCHp3byRQd+w52186kkJcJRTi4N0b8XkkM7PE+kxcH0p0MLnLhL
 hTose15g==;
Received: from [189.7.87.52] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uM3KV-00GFxr-IG; Mon, 02 Jun 2025 13:27:47 +0200
Message-ID: <a4f639ce-b8fb-49d1-8b53-ecc53ba41404@igalia.com>
Date: Mon, 2 Jun 2025 08:27:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] drm/v3d: Use DRM_GPU_SCHED_STAT_NO_HANG to skip
 the reset
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250530-sched-skip-reset-v2-0-c40a8d2d8daa@igalia.com>
 <20250530-sched-skip-reset-v2-5-c40a8d2d8daa@igalia.com>
 <b25c1cabe52436c83cb570a5d65ede2fc548fc0b.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <b25c1cabe52436c83cb570a5d65ede2fc548fc0b.camel@mailbox.org>
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

Hi Philipp,

On 02/06/25 04:13, Philipp Stanner wrote:
> On Fri, 2025-05-30 at 11:01 -0300, Maíra Canal wrote:
>> When a CL/CSD job times out, we check if the GPU has made any
>> progress
>> since the last timeout. If so, instead of resetting the hardware, we
>> skip
>> the reset and allow the timer to be rearmed. This gives long-running
>> jobs
>> a chance to complete.
>>
>> Use the DRM_GPU_SCHED_STAT_NO_HANG status to skip the reset and re-
>> arm
>> the timer.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_sched.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
>> b/drivers/gpu/drm/v3d/v3d_sched.c
>> index
>> e1997387831541fb053e472672004cf511c25558..fbb09a8aff3740b5cd59573b5f2
>> e26b2ee352dfb 100644
>> --- a/drivers/gpu/drm/v3d/v3d_sched.c
>> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>> @@ -761,7 +761,7 @@ v3d_cl_job_timedout(struct drm_sched_job
>> *sched_job, enum v3d_queue q,
>>   	if (*timedout_ctca != ctca || *timedout_ctra != ctra) {
>>   		*timedout_ctca = ctca;
>>   		*timedout_ctra = ctra;
>> -		return DRM_GPU_SCHED_STAT_RESET;
>> +		return DRM_GPU_SCHED_STAT_NO_HANG;
>>   	}
>>   
>>   	return v3d_gpu_reset_for_timeout(v3d, sched_job);
>> @@ -805,7 +805,7 @@ v3d_csd_job_timedout(struct drm_sched_job
>> *sched_job)
>>   	 */
>>   	if (job->timedout_batches != batches) {
>>   		job->timedout_batches = batches;
>> -		return DRM_GPU_SCHED_STAT_RESET;
>> +		return DRM_GPU_SCHED_STAT_NO_HANG;
>>   	}
> 
> Wait a second, help me out here quickly. You already added workaround
> stuff where you manipulate the scheduler's pending_list, as you state
> in the cover letter. That code here [1].
> 
> Don't you have to remove the very same code in this series again to
> still have correct behavior in your driver?
> 
> As I see it, all drm branches end up in Linus's tree ultimately. So I'd
> think about potential branch-races in case you didn't already.
> 

I always base my patches in drm-misc-next, which didn't backported
Linus' tree yet and still doesn't have the v3d fix. Hopefully, it will
be backported before I send v3.

Best Regards,
- Maíra

> 
> P.
> 
> 
> 
> [1] https://lore.kernel.org/dri-devel/20250430210643.57924-1-mcanal@igalia.com/T/
> 


