Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3349792E895
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 14:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB0510E190;
	Thu, 11 Jul 2024 12:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HEhZa4uM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8FC10E2C7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 12:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZZG6Zhz1PhKJ2BOWVJNsPvGgxxWpbE13DqNQLnmw6nE=; b=HEhZa4uMZop4YELEoL7BFtJHcK
 mVZZzaMscv8AmjyhHUjoWM3tlpb7XPDmZDnUkTUdWsRe7HjdfoiweINhYetoAXnJB3YNKCwAlwfep
 UPei2Ox+/LLKbYfGEcZn7n85j0T9ETzgwr09L4wcaQbA5KIjpdvIa+ScR+ISr2cUeqb2luxmds9k1
 70TXONtmbdcN9z1vSZ5gwYy3UPkFUv62pqC5HD/LtyvVUfofuEJIRIrorpPcSK8iz55CJwISXwNiG
 2aJQbGMYsCcwPWH2nf+QP7wj+aQWcmakzmF3fVbajJoMEDSFqc8BuA2WRvsp3iojqtgeoEZ9mozw7
 95iX0I6w==;
Received: from [84.69.19.168] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRtKQ-00DhJQ-UC; Thu, 11 Jul 2024 14:55:18 +0200
Message-ID: <a65674bc-c4f1-4f9f-adb1-63a63293d208@igalia.com>
Date: Thu, 11 Jul 2024 13:55:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] drm/v3d: Do not use intermediate storage when
 copying performance query results
To: Iago Toral <itoral@igalia.com>, Tvrtko Ursulin <tursulin@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com
References: <20240709163425.58276-1-tursulin@igalia.com>
 <20240709163425.58276-12-tursulin@igalia.com>
 <8b87ef7081452ee385135342c171c514a61c6646.camel@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <8b87ef7081452ee385135342c171c514a61c6646.camel@igalia.com>
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


On 11/07/2024 13:31, Iago Toral wrote:
> El mar, 09-07-2024 a las 17:34 +0100, Tvrtko Ursulin escribió:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Removing the intermediate buffer removes the last use of the
>> V3D_MAX_COUNTERS define, which will enable further driver cleanup.
>>
>> While at it pull the 32 vs 64 bit copying decision outside the loop
>> in
>> order to reduce the number of conditional instructions.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_sched.c | 60 ++++++++++++++++++++-----------
>> --
>>   1 file changed, 37 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
>> b/drivers/gpu/drm/v3d/v3d_sched.c
>> index fc8730264386..77f795e38fad 100644
>> --- a/drivers/gpu/drm/v3d/v3d_sched.c
>> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>> @@ -421,18 +421,23 @@ v3d_reset_timestamp_queries(struct v3d_cpu_job
>> *job)
>>   	v3d_put_bo_vaddr(bo);
>>   }
>>   
>> +static void write_to_buffer_32(u32 *dst, unsigned int idx, u32
>> value)
>> +{
>> +	dst[idx] = value;
>> +}
>> +
>> +static void write_to_buffer_64(u64 *dst, unsigned int idx, u64
>> value)
>> +{
>> +	dst[idx] = value;
>> +}
>> +
>>   static void
>> -write_to_buffer(void *dst, u32 idx, bool do_64bit, u64 value)
>> +write_to_buffer(void *dst, unsigned int idx, bool do_64bit, u64
>> value)
>>   {
>> -	if (do_64bit) {
>> -		u64 *dst64 = (u64 *)dst;
>> -
>> -		dst64[idx] = value;
>> -	} else {
>> -		u32 *dst32 = (u32 *)dst;
>> -
>> -		dst32[idx] = (u32)value;
>> -	}
>> +	if (do_64bit)
>> +		write_to_buffer_64(dst, idx, value);
>> +	else
>> +		write_to_buffer_32(dst, idx, value);
>>   }
>>   
>>   static void
>> @@ -505,18 +510,23 @@ v3d_reset_performance_queries(struct
>> v3d_cpu_job *job)
>>   }
>>   
>>   static void
>> -v3d_write_performance_query_result(struct v3d_cpu_job *job, void
>> *data, u32 query)
>> +v3d_write_performance_query_result(struct v3d_cpu_job *job, void
>> *data,
>> +				   unsigned int query)
>>   {
>> -	struct v3d_performance_query_info *performance_query = &job-
>>> performance_query;
>> -	struct v3d_copy_query_results_info *copy = &job->copy;
>> +	struct v3d_performance_query_info *performance_query =
>> +						&job-
>>> performance_query;
>>   	struct v3d_file_priv *v3d_priv = job->base.file-
>>> driver_priv;
>>   	struct v3d_dev *v3d = job->base.v3d;
>> -	struct v3d_perfmon *perfmon;
>> -	u64 counter_values[V3D_MAX_COUNTERS];
>> +	unsigned int i, j, offset;
>>   
>> -	for (int i = 0; i < performance_query->nperfmons; i++) {
>> -		perfmon = v3d_perfmon_find(v3d_priv,
>> -					   performance_query-
>>> queries[query].kperfmon_ids[i]);
>> +	for (i = 0, offset = 0;
>> +	     i < performance_query->nperfmons;
>> +	     i++, offset += DRM_V3D_MAX_PERF_COUNTERS) {
>> +		struct v3d_performance_query *q =
>> +				&performance_query->queries[query];
> 
> Looks like we could move this before the loop.

Indeed! I will change it and re-send, either for v4 of the series, or 
single update if there will not be any other changes required.

> Otherwise this patch is:
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

Thanks!

Regards,

Tvrtko

>> +		struct v3d_perfmon *perfmon;
>> +
>> +		perfmon = v3d_perfmon_find(v3d_priv, q-
>>> kperfmon_ids[i]);
>>   		if (!perfmon) {
>>   			DRM_DEBUG("Failed to find perfmon.");
>>   			continue;
>> @@ -524,14 +534,18 @@ v3d_write_performance_query_result(struct
>> v3d_cpu_job *job, void *data, u32 quer
>>   
>>   		v3d_perfmon_stop(v3d, perfmon, true);
>>   
>> -		memcpy(&counter_values[i *
>> DRM_V3D_MAX_PERF_COUNTERS], perfmon->values,
>> -		       perfmon->ncounters * sizeof(u64));
>> +		if (job->copy.do_64bit) {
>> +			for (j = 0; j < perfmon->ncounters; j++)
>> +				write_to_buffer_64(data, offset + j,
>> +						   perfmon-
>>> values[j]);
>> +		} else {
>> +			for (j = 0; j < perfmon->ncounters; j++)
>> +				write_to_buffer_32(data, offset + j,
>> +						   perfmon-
>>> values[j]);
>> +		}
>>   
>>   		v3d_perfmon_put(perfmon);
>>   	}
>> -
>> -	for (int i = 0; i < performance_query->ncounters; i++)
>> -		write_to_buffer(data, i, copy->do_64bit,
>> counter_values[i]);
>>   }
>>   
>>   static void
> 
