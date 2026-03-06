Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNvXFXLMqmnwXAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:45:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67B9220E6D
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D5A10ED2B;
	Fri,  6 Mar 2026 12:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Wtl7LlsE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079E010E1EC
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 12:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FqNHr53AEqPExSsTyTxCMwErB6DgIDAW0ASE3i3paTs=; b=Wtl7LlsE6i2hnqbr9h77SRp9r3
 LGOrXk9nkB58cz7Hn/XbOSKoDST/GjHtue0t8AJD9XARF4mA5nzFMbSEEvAubzP5iytEYftoizFaA
 oodw28L5biAwi/XqDeuGxHsbOfwfP+J6zs0Lx2pgp6ughyt1cFRML4cGPaN0aAfmuMKqNhgpsMDSB
 tdxKUcmLj4j6EL6rLSnZh+q5jL+6KGHH4BG0I2fQARzENAknoaxR9QMFj9SdpzBCNFsJPxhwPQddA
 1KO/Vl0Vmsk8yKWJvpd++r7vtIQTRtLOjv8u7OhLBOMCK23xJcWJ1llwNxnZXWvSW/r/gReMEdGFn
 4vCFOzHQ==;
Received: from [189.7.87.203] (helo=[192.168.0.2])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vyUYS-00A2Ek-Ns; Fri, 06 Mar 2026 13:45:20 +0100
Message-ID: <d2860afc-823b-4a15-a17e-32afd3f59d1f@igalia.com>
Date: Fri, 6 Mar 2026 09:45:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] drm/vc4: Add per-file descriptor seqno tracking
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20260205-vc4-drm-scheduler-v1-0-c6174fd7bbc1@igalia.com>
 <20260205-vc4-drm-scheduler-v1-7-c6174fd7bbc1@igalia.com>
 <4c2b82c6-76f6-4a1b-9422-b111b35e47fc@igalia.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <4c2b82c6-76f6-4a1b-9422-b111b35e47fc@igalia.com>
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
X-Rspamd-Queue-Id: A67B9220E6D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tvrtko.ursulin@igalia.com,m:mwen@igalia.com,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:kernel-list@raspberrypi.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,raspberrypi.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.325];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Hi Tvrtko,

On 06/03/26 09:04, Tvrtko Ursulin wrote:
> 
> On 05/02/2026 21:31, Maíra Canal wrote:
>> Implement per-file descriptor seqno tracking using an xarray, allowing
>> userspace to wait on specific job completions via vc4_wait_seqno_ioctl.
>>
>> While this interface should ideally be deprecated in favor of syncobjs,
>> it has long been exposed to userspace and therefore must continue to be
>> supported.
>>
>> Lay the groundwork to replace the existing `finished_seqno` logic with
>> DMA fence-based tracking. Each allocated seqno is associated with the
>> job's done_fence in a per-fd xarray. This allows vc4_wait_seqno_ioctl()
>> to simply look up the corresponding fence and wait on it.
>>
>> This changes seqno semantics from global to per-file descriptor.
>> However, this doesn't affect userspace because a client can only wait
>> on seqnos returned from its own submissions.
> 
> Why is this better ie. why is the complication of a per file seqnos 
> worth it?

The old seqno logic relied on a global monotonic counter with the
invariant that finished_seqno >= N implies all jobs with seqno <= N are
complete.

With the DRM sched, job ordering is only guaranteed within a scheduler
entity, which is inside the `struct vc4_file` (per-fd). Jobs from
different fd's can complete out of order, so a global seqno would break
that invariant. The problem is that this would break userspace
expectations. The IOCTL `vc4_wait_seqno_ioctl` relies on this invariant.

Considering that userspace sometimes uses `finished_seqno >= N` just
like a syncobj, using per-fd seqnos is the strategy I thought to avoid
breaking user-space, as the seqno monotonicity contract holds. Since
userspace can only wait on seqnos returned from its own submissions, the
change from global to per-fd scope doesn't affect behavior.

> 
>>
>> This design is inspired by the user fence handling in the Etnaviv and
>> msm drivers.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/vc4/vc4_drv.c    |  2 ++
>>   drivers/gpu/drm/vc4/vc4_drv.h    | 11 ++++++++
>>   drivers/gpu/drm/vc4/vc4_submit.c | 60 ++++++++++++++++++++++++++++++ 
>> ++++++++++
>>   3 files changed, 73 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/ 
>> vc4_drv.c
>> index 
>> c18178f6c8cea0a182dc67c2b8a992d127c87fec..4d5760192ba090a58d1ec870c37c3459f2cac468 100644
>> --- a/drivers/gpu/drm/vc4/vc4_drv.c
>> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
>> @@ -166,6 +166,7 @@ static int vc4_open(struct drm_device *dev, struct 
>> drm_file *file)
>>                         1, NULL);
>>       }
>> +    xa_init_flags(&vc4file->seqno_xa, XA_FLAGS_ALLOC1);
>>       vc4_perfmon_open_file(vc4file);
>>       file->driver_priv = vc4file;
>>       return 0;
>> @@ -186,6 +187,7 @@ static void vc4_close(struct drm_device *dev, 
>> struct drm_file *file)
>>       for (q = 0; q < VC4_MAX_QUEUES; q++)
>>           drm_sched_entity_destroy(&vc4file->sched_entity[q]);
>> +    xa_destroy(&vc4file->seqno_xa);
>>       vc4_perfmon_close_file(vc4file);
>>       kfree(vc4file);
>>   }
>> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/ 
>> vc4_drv.h
>> index 
>> dc04803efad9fdf9179a98701b31b9e360e9ab15..ff6dc9aea52105359b72700ba367d390ddf84262 100644
>> --- a/drivers/gpu/drm/vc4/vc4_drv.h
>> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
>> @@ -10,6 +10,7 @@
>>   #include <linux/of.h>
>>   #include <linux/refcount.h>
>>   #include <linux/uaccess.h>
>> +#include <linux/xarray.h>
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_debugfs.h>
>> @@ -772,6 +773,10 @@ struct vc4_render_job {
>>        * Must remain allocated until the render job completes.
>>        */
>>       uint32_t bin_slots;
>> +
>> +    /* For userspace fence tracking. */
>> +    struct vc4_file *file;
> 
> Can jobs outlive clients?

Ack.

> 
>> +    u32 seqno;
>>   };
>>   struct vc4_exec_info {
>> @@ -904,6 +909,12 @@ struct vc4_file {
>>       struct drm_sched_entity sched_entity[VC4_MAX_QUEUES];
>> +    /* Mapping of seqno to dma_fence for job completion tracking.
>> +     * Allows userspace to wait on specific submissions.
>> +     */
>> +    struct xarray seqno_xa;
>> +    u32 next_seqno;
>> +
>>       bool bin_bo_used;
>>   };
>> diff --git a/drivers/gpu/drm/vc4/vc4_submit.c b/drivers/gpu/drm/vc4/ 
>> vc4_submit.c
>> index 
>> d6c684a14e6f9d9f7f456ad7fc985dbf631a7fb4..8d82fcb320a7ac16497c3f49e5106cf6b44ee706 100644
>> --- a/drivers/gpu/drm/vc4/vc4_submit.c
>> +++ b/drivers/gpu/drm/vc4/vc4_submit.c
>> @@ -203,6 +203,50 @@ vc4_get_bcl(struct drm_device *dev, struct 
>> vc4_exec_info *exec)
>>       return ret;
>>   }
>> +int
>> +vc4_wait_seqno_ioctl(struct drm_device *dev, void *data,
>> +             struct drm_file *file_priv)
>> +{
>> +    struct vc4_file *vc4_priv = file_priv->driver_priv;
>> +    struct vc4_dev *vc4 = to_vc4_dev(dev);
>> +    struct drm_vc4_wait_seqno *args = data;
>> +    unsigned long timeout_jiffies = nsecs_to_jiffies(args->timeout_ns);
>> +    unsigned long start = jiffies;
>> +    struct dma_fence *fence;
>> +    long ret;
>> +
>> +    if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
>> +        return -ENODEV;
>> +
>> +    rcu_read_lock();
>> +    fence = xa_load(&vc4_priv->seqno_xa, args->seqno);
>> +    if (fence)
>> +        fence = dma_fence_get_rcu(fence);
> 
> The RCU protection is for the drm_sched_fence? Comment maybe?

Yeah. While RCU guarantees the xarray entry won't be freed during the
lookup, it does not prevent the fence's refcount from being concurrently
dropped to zero from the irq context. I'll add a comment.

Best regards,
- Maíra

> 
> Regards,
> 
> Tvrtko
> 
>> +    rcu_read_unlock();
>> +
>> +    if (!fence)
>> +        return 0;
>> +
>> +    trace_vc4_wait_for_seqno_begin(dev, args->seqno, args->timeout_ns);
>> +    ret = dma_fence_wait_timeout(fence, true, timeout_jiffies);
>> +    trace_vc4_wait_for_seqno_end(dev, args->seqno);
>> +
>> +    dma_fence_put(fence);
>> +
>> +    if (ret == -ERESTARTSYS) {
>> +        u64 delta = jiffies_to_nsecs(jiffies - start);
>> +
>> +        if (args->timeout_ns >= delta)
>> +            args->timeout_ns -= delta;
>> +        else
>> +            args->timeout_ns = 0;
>> +
>> +        return ret;
>> +    }
>> +
>> +    return ret > 0 ? 0 : -ETIME;
>> +}
>> +
>>   static void
>>   vc4_job_free(struct kref *ref)
>>   {
>> @@ -262,6 +306,9 @@ vc4_render_job_free(struct kref *ref)
>>       vc4->bin_alloc_used &= ~job->bin_slots;
>>       spin_unlock_irqrestore(&vc4->job_lock, irqflags);
>> +    if (job->seqno)
>> +        xa_erase(&job->file->seqno_xa, job->seqno);
>> +
>>       vc4_job_free(ref);
>>   }
>> @@ -433,6 +480,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void 
>> *data,
>>           return ret;
>>       exec.render = render;
>> +    render->file = vc4_priv;
>>       INIT_LIST_HEAD(&render->unref_list);
>>       ret = vc4_lookup_bos(dev, file_priv, render, args->bo_handles,
>> @@ -488,10 +536,22 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void 
>> *data,
>>       vc4_push_job(&render->base);
>>       mutex_unlock(&vc4->sched_lock);
>> +    ret = xa_alloc_cyclic(&vc4_priv->seqno_xa, &render->seqno,
>> +                  render->base.done_fence,
>> +                  xa_limit_32b, &vc4_priv->next_seqno, GFP_KERNEL);
>> +    if (ret < 0) {
>> +        /* Jobs are already queued, just skip seqno tracking */
>> +        drm_err(dev, "Seqno allocation failed\n");
>> +        render->seqno = 0;
>> +    }
>> +
>>       vc4_attach_fences_and_unlock_reservation(file_priv, render,
>>                            &exec_ctx, args->out_sync,
>>                            render->base.done_fence);
>> +    /* Return the seqno for our job. */
>> +    args->seqno = render->seqno;
>> +
>>       vc4_job_put((void *)bin);
>>       vc4_job_put((void *)render);
>>
> 

