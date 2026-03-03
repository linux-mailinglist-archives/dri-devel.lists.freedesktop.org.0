Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKr/EUIup2mbfgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 19:53:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829FC1F5820
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 19:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D544510E051;
	Tue,  3 Mar 2026 18:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="kDjBQnct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5D310E051
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 18:53:47 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fQQ1g6Ykyz9ssd;
 Tue,  3 Mar 2026 19:53:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772564024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jg5nfly4d8nYPWpoWnRACsuMW4dTM5oPdA6hG9Z9y44=;
 b=kDjBQnct0k/r80CZYdDX40k2269WIhSgTOpv0I7PGWU8KW9sW1R6n7m5OMfiFt7vsgupP2
 7XGOxSQ0iouvCk/p8H+1xFscfe31bWLJcyIwqm3NFTjQZPyAvHs6xP8RJlKi8tJKnIX+G0
 LD9p/qyVCCmFu1gCJrTwgGpPaf09Rykkd8Qymgm2au/a85FPEAKz4kKam9yTyqOZvAClL1
 5xMc9NvN+SUmBbnHNzaPMTmJ0ZgR3Umz83yyEQSSA1u2xPpWtT43QpNEO9rOxo88nyfWKR
 HIQ7XVDZs+4RdPNPMyvlABccQQnGEItOMKekm+A218JQgFy4658dd7bWdeiOOw==
Message-ID: <5464a6fa-5a49-42f5-a1ea-ce9f18a6955e@mailbox.org>
Date: Tue, 3 Mar 2026 19:53:39 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Julian Orth <ju.orth@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
 <e0f687da-7323-40fc-af50-82abea6e25cc@linux.intel.com>
 <3c969254-ed38-4b13-84b3-5afa365b04cb@amd.com>
 <2b75199f-b78a-4915-8e75-5d186f63f7c5@mailbox.org>
 <CAHijbEXkn3+E_u1+aZgLT+pQ_vLYvKKv9VU_5kOuEaFheLRQeg@mail.gmail.com>
 <bc3417d9-d191-4cc7-95e0-968b0b9bec05@linux.intel.com>
 <CAHijbEXTPSLSADqet1=P1FV6jvoa5yGEprOuYtpQWUq_y5uT2A@mail.gmail.com>
 <c5e2cd1d-05a9-489a-be8a-be4d0d583688@mailbox.org>
 <CAHijbEWoQHTyj_V1dD9UWskPmz0WbrVwzPTD3XqJTczy1ojBnQ@mail.gmail.com>
 <d90d6eb3-72bc-4502-934d-f77dac83690d@mailbox.org>
 <CAHijbEXk9q_cF6g=OuPKG-Wd+GLfU6Pu1HU77FpLdV6jfg9MnA@mail.gmail.com>
 <daaa5465-c086-47b9-be7b-13f5d62292ac@linux.intel.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <daaa5465-c086-47b9-be7b-13f5d62292ac@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 39tb5ez316yko7oj9hebttk77qtt71o8
X-MBO-RS-ID: 2ec16498483368e0d37
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
X-Rspamd-Queue-Id: 829FC1F5820
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:ju.orth@gmail.com,m:christian.koenig@amd.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:juorth@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com];
	FORGED_SENDER(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/3/26 18:44, Maarten Lankhorst wrote:
> Den 2026-03-03 kl. 18:30, skrev Julian Orth:
>> On Tue, Mar 3, 2026 at 6:18 PM Michel Dänzer <michel.daenzer@mailbox.org> wrote:
>>>
>>> I wrote in my first post in this thread that I don't object to your patch, so you can relax and stop trying to convince me not to object to it. :)
>>>
>>> I'm just pointing out that this is working around broken user-space code, and that there are other similar cases where that kind of broken users-space code couldn't be worked around in the kernel, so it's better to also fix the user-space code anyway.
>>
>> At this point I think we're arguing about "how can ioctls be extended"
>> and "does userspace have to use memset" in general, not just about
>> this particular ioctl. You've made the argument that ioctls are not
>> extensible in general unless userspace uses memset. However, I'm not
>> yet convinced of this. As you've also said above, drm_ioctl happily
>> truncates or zero-extends ioctl arguments without returning an error
>> due to size mismatch. Therefore, the only way for userspace to detect
>> if the kernel supports the "extended" ioctl is to add a flag so that
>> the kernel can return an error if it doesn't know the flag. And then
>> that flag could also be used by the kernel to detect which fields of
>> the argument are potentially uninitialized.
>>
>> That is why I asked above if you knew of any other examples where an
>> ioctl was extended and where memset(0) became effectively required due
>> to the extension.

Since it's always been effectively required for ioctl structs, "become" doesn't apply.


In terms of documentation, the "(How to avoid) Botching up ioctls" page says under Basics:

* Check all unused fields and flags and all the padding for whether it’s 0, and reject the ioctl if that’s not the case.

Which is what the code you're modifying here did: The code after the args->point checks doesn't use the point field, so it's checking that user space initialized the field to 0 per above.

This contradicts the arguments in the commit log, so I'm leaning toward objecting to this patch now.


> You don't even need to use memset, this would work too:
> 
> struct drm_syncobj_handle args = {
> 	.flags = 0
> };

TL;DR: This method isn't 100% safe either.

It won't initialize any padding which isn't covered by any struct field. We try to avoid that and have explicit padding fields instead, mistakes may happen though, and in theory such padding could later be used for a new field.

FWIW, libdrm uses memset for all ioctl structs.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
