Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDAA979F41
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 12:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE8710E33D;
	Mon, 16 Sep 2024 10:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="n8zXW76h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6850E10E341;
 Mon, 16 Sep 2024 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gcpsuHo0gHtQ30vF7JeygP+gAgFIpnqC6Q93rgiIQgw=; b=n8zXW76hApCgkVGgtllIJP9TrQ
 K10rYLTKfzMymjvxzIXDgb3z1LC9fP2w7OPh0CzBRNMaZeszAMATVokGvELFaooED1tlPOo1ZZTZF
 kAvCk1O0SKTbl1NdaPhVlpUYWcIMbktUQnDoUWA/YGYwDvcYe/P+JHpVi6J8LVv57CUsotU5q6npu
 +p45LZQESfSKmlw3rPW6w0SyD/O82lJu69hcJVkwQ66o4JHXKkTfLkMILANPPl6ajvgN221xDBc5V
 0Y9vQ2odH5cRKYj8N3dujpx+sWy9Xbjup45Ower0Y9ZReMyCpu8AJXKBS4kKSFLWJgaaRH22lBkHw
 pz+ODGPQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sq8wT-00EOz0-Mq; Mon, 16 Sep 2024 12:26:49 +0200
Message-ID: <0d9850c5-0f47-49cf-b613-cf409c9ac936@igalia.com>
Date: Mon, 16 Sep 2024 11:26:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/sched: Re-order struct drm_sched_rq members for
 clarity
To: Philipp Stanner <pstanner@redhat.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
References: <20240913160559.49054-1-tursulin@igalia.com>
 <20240913160559.49054-7-tursulin@igalia.com>
 <f193ac6e13c9069eacf3498e1df41c97577c58e4.camel@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <f193ac6e13c9069eacf3498e1df41c97577c58e4.camel@redhat.com>
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


On 16/09/2024 09:16, Philipp Stanner wrote:
> On Fri, 2024-09-13 at 17:05 +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Current kerneldoc for struct drm_sched_rq incompletely documents what
>> fields are protected by the lock.
>>
>> This is not good because it is misleading.
>>
>> Lets fix it by listing all the elements which are protected by the
>> lock.
>>
>> While at it, lets also re-order the members so all protected by the
>> lock
>> are in a single group.
>>
>> v2:
>>   * Refer variables by kerneldoc syntax, more verbose commit text.
>> (Philipp)
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Looks good, thx
> 
> Reviewed-by: Philipp Stanner <pstanner@redhat.com>

Thanks!

4/8 and 8/8 are now the only two left with no r-b.
>> ---
>>   include/drm/gpu_scheduler.h | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/drm/gpu_scheduler.h
>> b/include/drm/gpu_scheduler.h
>> index 38465b78c7d5..2f58af00f792 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -243,10 +243,10 @@ struct drm_sched_entity {
>>   /**
>>    * struct drm_sched_rq - queue of entities to be scheduled.
>>    *
>> - * @lock: to modify the entities list.
>>    * @sched: the scheduler to which this rq belongs to.
>> - * @entities: list of the entities to be scheduled.
>> + * @lock: protects @entities, @rb_tree_root and @current_entity.
> 
> nit: in case you'll provide a new version anyways you could consider
> sorting these three to be congruent with the lines below.

To me it looks the order of kerneldoc vs members is aligned. Unless I 
missed what you mean here?

Regards,

Tvrtko

>>    * @current_entity: the entity which is to be scheduled.
>> + * @entities: list of the entities to be scheduled.
>>    * @rb_tree_root: root of time based priory queue of entities for
>> FIFO scheduling
>>    *
>>    * Run queue is a set of entities scheduling command submissions for
>> @@ -254,10 +254,12 @@ struct drm_sched_entity {
>>    * the next entity to emit commands from.
>>    */
>>   struct drm_sched_rq {
>> -	spinlock_t			lock;
>>   	struct drm_gpu_scheduler	*sched;
>> -	struct list_head		entities;
>> +
>> +	spinlock_t			lock;
>> +	/* Following members are protected by the @lock: */
>>   	struct drm_sched_entity		*current_entity;
>> +	struct list_head		entities;
>>   	struct rb_root_cached		rb_tree_root;
>>   };
>>   
> 
