Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULlDAxlZqWkL6AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:21:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3AA20F9D2
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703B110E249;
	Thu,  5 Mar 2026 10:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gzBZ5tHw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0CC10E249
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WQnlk+nV/bkjhuZg3p5P3js6ndTmK3hZSnDhnMgitkc=; b=gzBZ5tHwqLZyzix1fqmcNqO7sB
 7WdefPiEuZ9Eyl951Q3+r/nOsRC2KkASY2dqpU0xrGmeGYdE1+kHIx+c4ia9VuTh3vOKFzyuAffb4
 x7GEy7cblggQEXH9amvFtFldYiLSDfrausjeY/wCLtwibdL5GDE60N+DegKltao/zehIMmbrJ6Tyy
 qQPpxCv1VAQD3M50sc08OWURMpAkuOf2uHLDUl2JK1kgoBxXO6FwWUC5Cf5xAHXj1JAInWioADs6l
 2Lcgm/eQ0bVA/yPh5f6SkQqUwi0keBPeWv96xpYjmIjgFKk7YNQ2EVbtoTW8KEM3FfZW6u0cRWHXX
 1v54m4Sw==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vy5pA-009JZS-9L; Thu, 05 Mar 2026 11:20:56 +0100
Message-ID: <3f1a1afb-3bb4-49df-bb96-48d757307f4e@igalia.com>
Date: Thu, 5 Mar 2026 10:20:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] drm/vc4: Fix a memory leak in hang state error path
To: Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20260205-vc4-drm-scheduler-v1-0-c6174fd7bbc1@igalia.com>
 <20260205-vc4-drm-scheduler-v1-2-c6174fd7bbc1@igalia.com>
 <f40b48d9-d55b-419e-ac77-e94d336a5c3c@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <f40b48d9-d55b-419e-ac77-e94d336a5c3c@igalia.com>
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
X-Rspamd-Queue-Id: 6C3AA20F9D2
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
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:mcanal@igalia.com,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:kernel-list@raspberrypi.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel-dev@igalia.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.301];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,igalia.com:mid,igalia.com:email]
X-Rspamd-Action: no action


On 18/02/2026 22:01, Melissa Wen wrote:
> 
> 
> On 05/02/2026 18:31, Maíra Canal wrote:
>> When vc4_save_hang_state() encounters an early return condition, it
>> returns without freeing the previously allocated `kernel_state`,
>> leaking memory.
>>
>> Add the missing kfree() calls in both early return paths.
>>
>> Fixes: 214613656b51 ("drm/vc4: Add an interface for capturing the GPU 
>> state after a hang.")
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/vc4/vc4_gem.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/ 
>> vc4_gem.c
>> index 
>> ab16164b5edaf382b9c4bf1f08766748cac77fcc..f943ff7da28ae528c0fdfac76e989a2d5286d193 100644
>> --- a/drivers/gpu/drm/vc4/vc4_gem.c
>> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
>> @@ -172,6 +172,7 @@ vc4_save_hang_state(struct drm_device *dev)
>>       exec[1] = vc4_first_render_job(vc4);
>>       if (!exec[0] && !exec[1]) {
>>           spin_unlock_irqrestore(&vc4->job_lock, irqflags);
>> +        kfree(kernel_state);
> LGTM, but even better if you can centralize error handling in 
> vc4_free_hang_state() and point all returns to a single place.

More reviewers more opinions, so you have to live with the pros and cons 
of that. :)

I chiming in with an alternative and that is to not even allocate 
kernel_state before the "!exec[0] && !exec[1]" check. Or you could even 
go further than that and allocate a single blob if struct vc4_hang_state 
instead of pointer to array would contain a flexible built in array 
(kmalloc_flex). Then there would be no need for any cleanup.

But granted, as this is a Fixes: patch it makes more sense to have it as 
simple as possible for easy backporting and follow up with my suggestion 
on top later, if you wish so.

Regards,

Tvrtko

>>           return;
>>       }
>> @@ -192,6 +193,7 @@ vc4_save_hang_state(struct drm_device *dev)
>>       if (!kernel_state->bo) {
>>           spin_unlock_irqrestore(&vc4->job_lock, irqflags);
>> +        kfree(kernel_state);
>>           return;
>>       }
>>
> 

