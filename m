Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAgOOS9aqWkL6AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:25:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFC820FA7F
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17DD10E250;
	Thu,  5 Mar 2026 10:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XItnlhbF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A632E10E250
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 10:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gD2VR7mzQYx/8y9fIepR2VJiuXtuC8Fg7+xQ4JZevxI=; b=XItnlhbF+KshxuMAReA8uzMypa
 8s9jq/ow9/+eMoCLinq+qAeGtH/5qxlt+o+0N9K0XU+jVJm/KYzotnga5FnD8EZy0hTrlYuTn3XrT
 uM9m/RgEGuuw6F78WjktkZzUsDFtGF+H8f4N4YC8MprBaD+Wpu0I08qF2KOVhknbiB3wLx3cVYG5p
 iLdF16CDlPEP3MeKnRSkSxu/9z+lE22EjJzRHffJXYhYH/0jLDnCyxjNRAgp2QEGVy3aZECHJvB4n
 pYxTpBA/QVnI+OVdLfOR9kpUaqqwfjGw5qL3VIuTb8EpLvhST3h2Qp0aOKGwvRkMq1NlxXJTZ5IPJ
 K/MI6VpA==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vy5tn-009Jhb-D1; Thu, 05 Mar 2026 11:25:43 +0100
Message-ID: <e7c2447d-d19c-4e67-a4e5-eec6ced0fbda@igalia.com>
Date: Thu, 5 Mar 2026 10:25:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/v3d: Attach per-fd reset counters to v3d_stats
To: Iago Toral <itoral@igalia.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20260217-v3d-reset-locking-improv-v1-0-0db848016869@igalia.com>
 <20260217-v3d-reset-locking-improv-v1-5-0db848016869@igalia.com>
 <3c27ff4ab7e18c7d2d3208a46f18ced2d2ca6957.camel@igalia.com>
 <73c11615-a459-40a4-be5d-8535040753d5@igalia.com>
 <052f80f50c0f6e57f5b3b5c3494fb70651ef22bf.camel@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <052f80f50c0f6e57f5b3b5c3494fb70651ef22bf.camel@igalia.com>
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
X-Rspamd-Queue-Id: 4FFC820FA7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:itoral@igalia.com,m:mcanal@igalia.com,m:mwen@igalia.com,m:mripard@kernel.org,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.959];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


On 05/03/2026 10:18, Iago Toral wrote:
> El jue, 05-03-2026 a las 09:34 +0000, Tvrtko Ursulin escribió:
>>
>> On 05/03/2026 09:15, Iago Toral wrote:
>>> El mar, 17-02-2026 a las 09:18 -0300, Maíra Canal escribió:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>
>>>> To remove the file_priv NULL-ing dance needed to check if the
>>>> file
>>>> descriptor is open, move the per-fd reset counter into v3d_stats,
>>>> which
>>>> is heap-allocated and refcounted, outliving the fd as long as
>>>> jobs
>>>> reference it.
>>>>
>>>> This change allows the removal of the last `queue_lock` usage to
>>>> protect
>>>> `job->file_priv` and avoids possible NULL ptr dereference issues
>>>> due
>>>> to
>>>> lifetime mismatches.
>>>>
>>>> Also, to simplify locking, replace both the global and per-fd
>>>> locked
>>>> reset counters with atomics.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Co-developed-by: Maíra Canal <mcanal@igalia.com>
>>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>>> ---
>>>>    drivers/gpu/drm/v3d/v3d_drv.c   | 20 ++++----------------
>>>>    drivers/gpu/drm/v3d/v3d_drv.h   | 14 ++++----------
>>>>    drivers/gpu/drm/v3d/v3d_sched.c |  9 ++-------
>>>>    3 files changed, 10 insertions(+), 33 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c
>>>> b/drivers/gpu/drm/v3d/v3d_drv.c
>>>> index
>>>> aafb402c6ac3118a57df9fc0a0d21d35d48e3b2c..4e77f4808145df21746ff4b
>>>> 7058
>>>> 089d0d161e3fc 100644
>>>> --- a/drivers/gpu/drm/v3d/v3d_drv.c
>>>> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
>>>> @@ -110,13 +110,13 @@ static int v3d_get_param_ioctl(struct
>>>> drm_device *dev, void *data,
>>>>    		args->value = !!drm_gem_get_huge_mnt(dev);
>>>>    		return 0;
>>>>    	case DRM_V3D_PARAM_GLOBAL_RESET_COUNTER:
>>>> -		mutex_lock(&v3d->reset_lock);
>>>> -		args->value = v3d->reset_counter;
>>>> -		mutex_unlock(&v3d->reset_lock);
>>>> +		args->value = atomic_read(&v3d->reset_counter);
>>>
>>> Don't we still need to take the reset lock here? Otherwise there
>>> would
>>> be a chance that we read the counter while a reset is in flight,
>>> no?
>>
>> I don't see that it would make a difference but maybe I am not seeing
>> your concern. It uses atomic_t so the increment versus read is fine.
>> Are
>> you maybe saying the v3d ABI guarantees reset is 100% done (so not in
>> progress, for some definition of progress, because hardware reset is
>> done by then, only re-submit and re-start of the software state is
>> poending) if userspace observes an increased global reset counter?
>> That
>> would be surprising and I don't see how it could make a practical
>> difference, but perhaps could be mitigated by moving the atomic_inc
>> to
>> the end of v3d_gpu_reset_for_timeout(). Or still taking the lock as
>> you say.
> 
> My concern is just that it is possible for the query and the reset to
> race and that I think it would make sense for the counter query to
> include in-flight resets (since what apps really care about is whether
> a GPU reset happened not if it completed the reset process).

Then there is no problem I think. Mutex lock or not, in both cases it is 
not guaranteed reset either is not in progress at the time of the ioctl. 
Even if the ioctl does not return an increased counter perhaps the reset 
handler is running but hasn't grabbed the mutex yet.

Regards,

Tvrtko

> 
> Iago
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>>    		return 0;
>>>>    	case DRM_V3D_PARAM_CONTEXT_RESET_COUNTER:
>>>>    		mutex_lock(&v3d->reset_lock);
>>>> -		args->value = v3d_priv->reset_counter;
>>>> +		args->value = 0;
>>>> +		for (enum v3d_queue q = 0; q < V3D_MAX_QUEUES;
>>>> q++)
>>>> +			args->value += atomic_read(&v3d_priv-
>>>>> stats[q]->reset_counter);
>>>>    		mutex_unlock(&v3d->reset_lock);
>>>>    		return 0;
>>>>    	default:
>>>> @@ -173,23 +173,11 @@ v3d_open(struct drm_device *dev, struct
>>>> drm_file *file)
>>>>    static void
>>>>    v3d_postclose(struct drm_device *dev, struct drm_file *file)
>>>>    {
>>>> -	struct v3d_dev *v3d = to_v3d_dev(dev);
>>>>    	struct v3d_file_priv *v3d_priv = file->driver_priv;
>>>> -	unsigned long irqflags;
>>>>    	enum v3d_queue q;
>>>>    
>>>>    	for (q = 0; q < V3D_MAX_QUEUES; q++) {
>>>> -		struct v3d_queue_state *queue = &v3d->queue[q];
>>>> -		struct v3d_job *job = queue->active_job;
>>>> -
>>>>    		drm_sched_entity_destroy(&v3d_priv-
>>>>> sched_entity[q]);
>>>> -
>>>> -		if (job && job->base.entity == &v3d_priv-
>>>>> sched_entity[q]) {
>>>> -			spin_lock_irqsave(&queue->queue_lock,
>>>> irqflags);
>>>> -			job->file_priv = NULL;
>>>> -			spin_unlock_irqrestore(&queue-
>>>>> queue_lock,
>>>> irqflags);
>>>> -		}
>>>> -
>>>>    		v3d_stats_put(v3d_priv->stats[q]);
>>>>    	}
>>>>    
>>>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h
>>>> b/drivers/gpu/drm/v3d/v3d_drv.h
>>>> index
>>>> 72c3f40715dae6e86e0c8356cb997cdf1cf03fae..3de485abd8fc274b361cd17
>>>> a00c
>>>> ab189d8e69643 100644
>>>> --- a/drivers/gpu/drm/v3d/v3d_drv.h
>>>> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
>>>> @@ -55,6 +55,8 @@ struct v3d_stats {
>>>>    	 * job queues, even the write side never is.
>>>>    	 */
>>>>    	seqcount_t lock;
>>>> +
>>>> +	atomic_t reset_counter;
>>>>    };
>>>>    
>>>>    struct v3d_queue_state {
>>>> @@ -203,10 +205,8 @@ struct v3d_dev {
>>>>    	 */
>>>>    	struct v3d_perfmon *global_perfmon;
>>>>    
>>>> -	/* Global reset counter. The counter must be incremented
>>>> when
>>>> -	 * a GPU reset happens. It must be protected by
>>>> @reset_lock.
>>>> -	 */
>>>> -	unsigned int reset_counter;
>>>> +	/* Global reset counter incremented on each GPU reset.
>>>> */
>>>> +	atomic_t reset_counter;
>>>>    };
>>>>    
>>>>    static inline struct v3d_dev *
>>>> @@ -233,12 +233,6 @@ struct v3d_file_priv {
>>>>    
>>>>    	/* Stores the GPU stats for a specific queue for this
>>>> fd. */
>>>>    	struct v3d_stats *stats[V3D_MAX_QUEUES];
>>>> -
>>>> -	/* Per-fd reset counter, must be incremented when a job
>>>> submitted
>>>> -	 * by this fd causes a GPU reset. It must be protected
>>>> by
>>>> -	 * &struct v3d_dev->reset_lock.
>>>> -	 */
>>>> -	unsigned int reset_counter;
>>>>    };
>>>>    
>>>>    struct v3d_bo {
>>>> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
>>>> b/drivers/gpu/drm/v3d/v3d_sched.c
>>>> index
>>>> 4adbf5175eb005b37d1feac1514150630ce6aab2..de6497741ff789b5de9212a
>>>> e3e9
>>>> 941a13cd0475d 100644
>>>> --- a/drivers/gpu/drm/v3d/v3d_sched.c
>>>> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>>>> @@ -701,8 +701,6 @@ v3d_gpu_reset_for_timeout(struct v3d_dev
>>>> *v3d,
>>>> struct drm_sched_job *sched_job,
>>>>    			  enum v3d_queue q)
>>>>    {
>>>>    	struct v3d_job *job = to_v3d_job(sched_job);
>>>> -	struct v3d_file_priv *v3d_priv = job->file_priv;
>>>> -	unsigned long irqflags;
>>>>    	enum v3d_queue i;
>>>>    
>>>>    	mutex_lock(&v3d->reset_lock);
>>>> @@ -717,11 +715,8 @@ v3d_gpu_reset_for_timeout(struct v3d_dev
>>>> *v3d,
>>>> struct drm_sched_job *sched_job,
>>>>    	/* get the GPU back into the init state */
>>>>    	v3d_reset(v3d);
>>>>    
>>>> -	v3d->reset_counter++;
>>>> -	spin_lock_irqsave(&v3d->queue[q].queue_lock, irqflags);
>>>> -	if (v3d_priv)
>>>> -		v3d_priv->reset_counter++;
>>>> -	spin_unlock_irqrestore(&v3d->queue[q].queue_lock,
>>>> irqflags);
>>>> +	atomic_inc(&v3d->reset_counter);
>>>> +	atomic_inc(&job->client_stats->reset_counter);
>>>>    
>>>>    	for (i = 0; i < V3D_MAX_QUEUES; i++)
>>>>    		drm_sched_resubmit_jobs(&v3d->queue[i].sched);
>>>>
>>>
>>
>>
> 

