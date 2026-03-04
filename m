Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKTxGzECqGkRnQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:58:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42E91FDFAA
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1777610E99A;
	Wed,  4 Mar 2026 09:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Htq+LKqw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9956D10E999
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 09:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772618285; x=1804154285;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1AWufibk1ePl9xDGtjktK11AEy2ylzHc9sSlSEfKxkA=;
 b=Htq+LKqwLEnTeHkzMbEIx1EUKUMBzG+OkeXIyQciMppbAugN9tE/GGXq
 w0fZM73Wn96jVQ45wNvXoIhZc9C8ybboEYEstB4+lvd1CkcpSXHNfAUaI
 UaMOJns2phKej7+d/XAxrxHInALLzFOHPo/FH/xE/3heQlaI7LoAifO1M
 Mg8uKOJfKilpbhMA8kQsLSrWuJccWdN4Ul0hIUgbFLWhekn9mGesDds++
 /KtwY9slx19motGwqOyOpPL1r6AFTHRKQLRClo5G+Zux4EYKBgTN2N3BJ
 t5oBSWi5Cr9PtCmh5JcVjrpIHveXIzLqq/0/UnyVu1KGVKmV6HIZeu65Z A==;
X-CSE-ConnectionGUID: JgIgnEixR82MbWnTN5fBtQ==
X-CSE-MsgGUID: alL4ThVeS+mqnnV36PoIBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73801958"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73801958"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 01:58:03 -0800
X-CSE-ConnectionGUID: iVGu90dKTAaFXc3m46yesw==
X-CSE-MsgGUID: 0lHG02jQS5SJLCBjlxTAjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="241307378"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.178])
 ([10.245.245.178])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 01:58:01 -0800
Message-ID: <33217fcd-1187-45fe-9e0a-f024f62627e6@linux.intel.com>
Date: Wed, 4 Mar 2026 10:57:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: Julian Orth <ju.orth@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
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
 <5464a6fa-5a49-42f5-a1ea-ce9f18a6955e@mailbox.org>
 <CAHijbEXaxLU7sbCyJr1X8B_PoPdM2q19+JuF+huLQqFoLYP8kw@mail.gmail.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <CAHijbEXaxLU7sbCyJr1X8B_PoPdM2q19+JuF+huLQqFoLYP8kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Queue-Id: B42E91FDFAA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ju.orth@gmail.com,m:michel.daenzer@mailbox.org,m:christian.koenig@amd.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:juorth@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,mailbox.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim]
X-Rspamd-Action: no action

Hey,

Den 2026-03-03 kl. 20:12, skrev Julian Orth:
> On Tue, Mar 3, 2026 at 7:53 PM Michel Dänzer <michel.daenzer@mailbox.org> wrote:
>>
>> On 3/3/26 18:44, Maarten Lankhorst wrote:
>>> Den 2026-03-03 kl. 18:30, skrev Julian Orth:
>>>> On Tue, Mar 3, 2026 at 6:18 PM Michel Dänzer <michel.daenzer@mailbox.org> wrote:
>>>>>
>>>>> I wrote in my first post in this thread that I don't object to your patch, so you can relax and stop trying to convince me not to object to it. :)
>>>>>
>>>>> I'm just pointing out that this is working around broken user-space code, and that there are other similar cases where that kind of broken users-space code couldn't be worked around in the kernel, so it's better to also fix the user-space code anyway.
>>>>
>>>> At this point I think we're arguing about "how can ioctls be extended"
>>>> and "does userspace have to use memset" in general, not just about
>>>> this particular ioctl. You've made the argument that ioctls are not
>>>> extensible in general unless userspace uses memset. However, I'm not
>>>> yet convinced of this. As you've also said above, drm_ioctl happily
>>>> truncates or zero-extends ioctl arguments without returning an error
>>>> due to size mismatch. Therefore, the only way for userspace to detect
>>>> if the kernel supports the "extended" ioctl is to add a flag so that
>>>> the kernel can return an error if it doesn't know the flag. And then
>>>> that flag could also be used by the kernel to detect which fields of
>>>> the argument are potentially uninitialized.
>>>>
>>>> That is why I asked above if you knew of any other examples where an
>>>> ioctl was extended and where memset(0) became effectively required due
>>>> to the extension.
>>
>> Since it's always been effectively required for ioctl structs, "become" doesn't apply.
>>
>>
>> In terms of documentation, the "(How to avoid) Botching up ioctls" page says under Basics:
>>
>> * Check all unused fields and flags and all the padding for whether it’s 0, and reject the ioctl if that’s not the case.
>>
>> Which is what the code you're modifying here did: The code after the args->point checks doesn't use the point field, so it's checking that user space initialized the field to 0 per above.
> 
> I don't believe that is true. The old code only checked args->point if
> the flags argument was 0. If the flags argument contained
> EXPORT_SYNC_FILE but not TIMELINE, then the old code ignored
> args->point completely. The patch suggested by Maarten does what
> you're suggesting: It unconditionally verifies that args->point does
> not contain garbage. However, since the original code only used
> args->points if TIMELINE was set, I believe the intention behind the
> TIMELINE flag was to ignore the args->point field if the flag was
> unset. That assumption is the basis for my patch.
> 
>>
>> This contradicts the arguments in the commit log, so I'm leaning toward objecting to this patch now.
>>
>>
>>> You don't even need to use memset, this would work too:
>>>
>>> struct drm_syncobj_handle args = {
>>>       .flags = 0
>>> };
>>
>> TL;DR: This method isn't 100% safe either.
>>
>> It won't initialize any padding which isn't covered by any struct field. We try to avoid that and have explicit padding fields instead, mistakes may happen though, and in theory such padding could later be used for a new field.
> 
> I don't think this is workable. There is a lot of code out there that
> effectively vendors the ioctl definitions (and so is not affected by
> new fields) and relies on field-based initialization affecting all
> significant bytes. For example
> https://github.com/Smithay/drm-rs/blob/08dee22f0dcfa4a73a18ca3a954d4f7c2c749c03/drm-ffi/src/syncobj.rs#L48-L58.

Vendoring is not affected. When you carry your own definition, it's your
responsibility for updating the users if you update the struct too.

Using rust here is a good example. The rust code would still use the old definition.
If you use it against the new definition it fails to compile, or use default valuesif asked.
You would notice your newly introduced bug at compile time.

Kind regards,
~Maarten Lankhorst
