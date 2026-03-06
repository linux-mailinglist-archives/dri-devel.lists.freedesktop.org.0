Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GptJl7Vqmn3XQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:23:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EFE22185B
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1984B10E3EA;
	Fri,  6 Mar 2026 13:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mY+bpFst";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C8A10E3EA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 13:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1GmIrQJk+m8p+CyFaaikvvqxgn+guNrK6ciBzIqhFdA=; b=mY+bpFstsoFFVEWfvhIiQocuvz
 0y8VSfTm3+id6CkgIrFnPcxKUFDI+XJYUGxr47lxyCows4TC39a06JJ+RmiIoZ1G+12O/SJgCA/Lb
 b+K/CrjtQDN5bGt4TNbS72xKQuy08sESyLdttjQt1bN9EaJ1GpCEsGdRGZL7VlhwKbflmLQ/AIj6t
 JP+QJkISVgSjHcbQkoeN19lC46nooqJejGlESo8AB5O3JNRT9HG1wsfADZWehtRsnO33cm41Bxuu0
 aSRnRrCOpjotfxsvuJDnkDRX65frVkQm6xskS92g80Tj+OuMneFbzqoJiqy/htgvkiNh0Ig5X1yG9
 Eiq3cgBQ==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vyV9O-00A56E-1R; Fri, 06 Mar 2026 14:23:30 +0100
Message-ID: <95f20e14-1fba-4016-8249-72660d45b275@igalia.com>
Date: Fri, 6 Mar 2026 13:23:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] drm/vc4: Add DRM GPU scheduler infrastructure
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20260205-vc4-drm-scheduler-v1-0-c6174fd7bbc1@igalia.com>
 <20260205-vc4-drm-scheduler-v1-5-c6174fd7bbc1@igalia.com>
 <d7b29e86-c5fe-451a-b52d-62b78d908031@igalia.com>
 <469a5d76-191f-481d-8391-198d69b4d4c4@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <469a5d76-191f-481d-8391-198d69b4d4c4@igalia.com>
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
X-Rspamd-Queue-Id: 13EFE22185B
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
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:mwen@igalia.com,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:kernel-list@raspberrypi.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,raspberrypi.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.310];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


On 06/03/2026 13:01, Maíra Canal wrote:
> Hi Tvrtko,
> 
> On 05/03/26 09:19, Tvrtko Ursulin wrote:
>>
>> On 05/02/2026 21:31, Maíra Canal wrote:
> 
> [...]
> 
> Ack to all previous comments, thanks a lot!

Okay but beware, I later realised at least one of those was incorrect. :)

>>
>>> +    spin_unlock_irqrestore(&vc4->job_lock, irqflags);
>>> +
>>> +    vc4_flush_caches(dev);
>>> +
>>> +    fence = vc4_fence_create(vc4, VC4_BIN);
>>> +    if (IS_ERR(fence))
>>> +        return NULL;
>>
>> Exits with vc4->bin_job set, safe or accidental?
> 
> Accidental 😅
> 
>>
>>> +
>>> +    if (job->base.irq_fence)
>>> +        dma_fence_put(job->base.irq_fence);
>>
>> When can this happen, on re-submit?
> 
> Exactly.

Comment would probably be good.

> 
>>
>>> +    job->base.irq_fence = dma_fence_get(fence);
>>> +
>>> +    trace_vc4_submit_cl(dev, false, to_vc4_fence(fence)->seqno,
>>> +                job->ct0ca, job->ct0ea);
>>> +
>>> +    vc4_switch_perfmon(vc4, &job->base);
>>> +
>>> +    V3D_WRITE(V3D_CTNCA(0), job->ct0ca);
>>> +    V3D_WRITE(V3D_CTNEA(0), job->ct0ea);
>>> +
>>> +    return fence;
>>> +}
>>> +
>>> +static struct dma_fence *vc4_render_job_run(struct drm_sched_job 
>>> *sched_job)
>>> +{
>>> +    struct vc4_render_job *job = to_render_job(sched_job);
>>> +    struct vc4_dev *vc4 = job->base.vc4;
>>> +    struct drm_device *dev = &vc4->base;
>>> +    struct dma_fence *fence;
>>> +
>>> +    if (unlikely(job->base.base.s_fence->finished.error)) {
>>> +        vc4->render_job = NULL;
>>
>> No spinlock for render, only bin? By design?
> 
> The RENDER job is only changed in two places: when the job is starting
> (here) and when the job is finishing. As the two situations are mutually
> exclusive, it's fine not to have the lock. The BIN job is also used in
> the memory overflow worker and that's why we need the lock.

Ack.

One meta comment, I have a feeling a bunch of places do not need the 
irqsave spin lock variant, or maybe not even irq, although for later I 
am not 100% sure. But for stuff running in scheduler callbacks irqsave 
is not needed since we know the context is never irq.

Regards,

Tvrtko



