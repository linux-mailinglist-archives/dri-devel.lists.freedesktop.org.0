Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MTuHNIbqGmYoAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:47:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80181FF3DC
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3773710E168;
	Wed,  4 Mar 2026 11:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="aHK6u5pH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC35A10E168
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 11:47:24 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fQrWF3mp7z9thQ;
 Wed,  4 Mar 2026 12:47:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772624841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HwZZKiDaDW77t57N7j3dbsc0ZP/jBXxIW5NtKt1Thu0=;
 b=aHK6u5pHPOROyZvrER9YfuEO5vItpakggpbiQGD2mrtz+Ri41HF+sgI0l+0DSkxeKbJWnh
 12AVbdhC7UqGGmctEOPMksEbpcEjmM9YhDX1/bxHvcc31Ly3cPsFPAivvF9qc3XR2efP3X
 RZ2wuriP9cB4hyes+6nzXQ11IrIVcsyr514rBRJMlEG0Iead2LA5esolL2FYNTGCxY3h2I
 3v5kLokWq7bf1ZBJCT9lkibLH0Zsw+fab+d5Q8cdonhDBbEFsSmSRKeSHLfhNmQpGUHjuL
 UGo4kYU8j/1DAdEpIrr9EGYfOHypiHToKI4K6wOlWvkqJB7A+Yqyt6yLJ2//Rg==
Message-ID: <0847752c-39cb-4233-8e07-8e1325c196cc@mailbox.org>
Date: Wed, 4 Mar 2026 12:47:17 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: Julian Orth <ju.orth@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
 <59bd46c0-03d9-4fef-a4fd-14b8f68f9860@mailbox.org>
 <CAHijbEUSFA3ptTNZ_YuOLgc44Px4CjAaa9x6DDjJktRCKjj+Dw@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <CAHijbEUSFA3ptTNZ_YuOLgc44Px4CjAaa9x6DDjJktRCKjj+Dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 54cn8yai9iz5yops7w8h4qatwudq7nbt
X-MBO-RS-ID: 290ba65cea1e1f0082f
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
X-Rspamd-Queue-Id: D80181FF3DC
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
	FORGED_RECIPIENTS(0.00)[m:ju.orth@gmail.com,m:maarten.lankhorst@linux.intel.com,m:christian.koenig@amd.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:juorth@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,amd.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
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

On 3/4/26 12:25, Julian Orth wrote:
> On Wed, Mar 4, 2026 at 12:15 PM Michel Dänzer
> <michel.daenzer@mailbox.org> wrote:
>> On 3/3/26 20:12, Julian Orth wrote:
>>> On Tue, Mar 3, 2026 at 7:53 PM Michel Dänzer <michel.daenzer@mailbox.org> wrote:
>>>> On 3/3/26 18:44, Maarten Lankhorst wrote:
>>>>>
>>>>> You don't even need to use memset, this would work too:
>>>>>
>>>>> struct drm_syncobj_handle args = {
>>>>>       .flags = 0
>>>>> };
>>>>
>>>> TL;DR: This method isn't 100% safe either.
>>>>
>>>> It won't initialize any padding which isn't covered by any struct field. We try to avoid that and have explicit padding fields instead, mistakes may happen though, and in theory such padding could later be used for a new field.
>>>
>>> I don't think this is workable.
>>
>> libdrm begs to differ. It shows that it's not only workable but really easy. There's no reason for doing it any other way.
> 
> Using memset to initialize padding bytes between fields is workable.
> Having the kernel add checks for this for existing ioctls is not
> workable because it would break usespace that doesn't do this.

As discussed in this thread, memset is also required for when the size of an ioctl struct is extended, even if there is no such padding.


> Which is every rust program out there as far as I can tell.

That's surprising. Surely there must be some unsafe code involved which allows uninitialized memory to be passed to ioctl()?


> I'm not aware of any ioctls that actually have padding bytes between
> fields so this discussion is mostly academic.

I covered that in my previous post quoted above.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
