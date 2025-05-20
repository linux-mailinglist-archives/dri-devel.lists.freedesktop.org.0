Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 645D4ABE169
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 18:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEC810E4D3;
	Tue, 20 May 2025 16:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="CwyNXFeY";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="DPADTAzj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D40910E4D3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 16:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1747760214;
 bh=bK6d56SoduXJWmbkEZP5dQH
 CvkZGM1JG60/cVI5W0u8=; b=CwyNXFeYu5J3ksYIGHzAAy83eosq3C9+2BDOECr4ZHYLAakawj
 q+e4Wsk4Boyl7aJOxmGbXUDW0ZtMcBFvPn6nw8v4MNzbLXQUR+96AipUpun63wgTK8dQPedOfei
 m9puOObjCjipXYp0Wn5fNcvfb4gUrn7mmg+7ARzTv5rGuHc/pYm9oWl2KBIRTaL471arAsSLSbi
 50ubja47xPBBaCZ8dfVl1/umZ3LK5cZZyW12MvJgynBbP4jfXDf0uwJ1q5A//5w0e9vSWHTbS7E
 NVNU+PphMsV0l5AXeMQfOEJAePp/sCHs9fteZI1OTBrlRNFmn7ANdWmSvxOgyurRD4Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1747760214; bh=bK6d56SoduXJWmbkEZP5dQH
 CvkZGM1JG60/cVI5W0u8=; b=DPADTAzjt9Kr+1Yk7wKthqzjmt53FiLLwRNYc3XTY8u6DyqL/V
 zod8DVyUvNx7fHiumgIDVeb85KBD5aTTnsAg==;
Message-ID: <c9794bcf-6e00-4900-ba1e-cc8b223bfbb9@damsy.net>
Date: Tue, 20 May 2025 18:56:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/10] drm/sched: add device name to the
 drm_sched_process_job event
To: Danilo Krummrich <dakr@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
 <20250424083834.15518-4-pierre-eric.pelloux-prayer@amd.com>
 <aCtPbUaah-bmcEMk@pollux>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <aCtPbUaah-bmcEMk@pollux>
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



Le 19/05/2025 à 17:34, Danilo Krummrich a écrit :
> On Thu, Apr 24, 2025 at 10:38:15AM +0200, Pierre-Eric Pelloux-Prayer wrote:
>> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> index f56e77e7f6d0..713df3516a17 100644
>> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> @@ -42,6 +42,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>>   			     __field(uint64_t, id)
>>   			     __field(u32, job_count)
>>   			     __field(int, hw_job_count)
>> +			     __string(dev, dev_name(sched_job->sched->dev))
> 
> Using the sched_job->sched pointer here and in other trace events implies that
> the trace event must not be called before the sched_job->sched has been set,
> i.e. in drm_sched_job_arm().
> 
> Please document this for the corresponding trace events.

This is not a new requirement as sched and s_fence were already used by the trace events.

Still it's a good idea to document this, so I'll update the comment added in the documentation patch.

Thanks,
Pierre-Eric
