Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AUXCvlBqGlOrwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:30:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7447C20183C
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9863B10EA24;
	Wed,  4 Mar 2026 14:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="wDh7FDut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DFE10EA24
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 14:30:11 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fQw7369nfz9ttL;
 Wed,  4 Mar 2026 15:30:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772634607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/YiuLi/KCUXnYRop69aQ38ONbKLX4RjOZUSznn24Vc8=;
 b=wDh7FDutq1VABjfYubbeLEA2gOVdJ7r1ofdii+kTW2syYA/AKG6AJy12KbiLIjFbm+6FbQ
 ITLh6mycOb46nnPsHDAjIhkM7+MfN3oLBkUlR3rxTQrNpjKnyHyha8AVlJdtHLBBdCVMkh
 ZzFrBcLl4ADnytnY16Mq5cnZmA2gwea2N8HcOtVFL7OpegpGH14IZshF7U0SU73hOjWl1z
 EaPI4acbeOhZIKElOMidV6WeBNaQ6V+/vH7Z8r+1sn4gWEAtcCP7QpGh2quAKRCy/6X2xn
 qTCkJ1Xseq6SuhZqTE9YL1Uj0WCFJ0TMSwBPhyh4I18orv20LItpMXF535Ic6w==
Message-ID: <07e4a878-199d-4f6a-a36c-95b3e168354a@mailbox.org>
Date: Wed, 4 Mar 2026 15:29:59 +0100
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
 <0847752c-39cb-4233-8e07-8e1325c196cc@mailbox.org>
 <CAHijbEX6nqnKOSQs7=UgwVZWDwQ71ZtSjhoDoo5YCvT2_rJ93w@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <CAHijbEX6nqnKOSQs7=UgwVZWDwQ71ZtSjhoDoo5YCvT2_rJ93w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: b1ucx37pfrjfjt6ti54yw5mpg9ad6mpn
X-MBO-RS-ID: 2ddff133a0b099d4947
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
X-Rspamd-Queue-Id: 7447C20183C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ju.orth@gmail.com,m:maarten.lankhorst@linux.intel.com,m:christian.koenig@amd.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:juorth@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,amd.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid]
X-Rspamd-Action: no action

On 3/4/26 13:32, Julian Orth wrote:
> On Wed, Mar 4, 2026 at 12:47 PM Michel Dänzer
> <michel.daenzer@mailbox.org> wrote:
>> On 3/4/26 12:25, Julian Orth wrote:
>>> On Wed, Mar 4, 2026 at 12:15 PM Michel Dänzer
>>> <michel.daenzer@mailbox.org> wrote:
>>>> On 3/3/26 20:12, Julian Orth wrote:
>>>>> On Tue, Mar 3, 2026 at 7:53 PM Michel Dänzer <michel.daenzer@mailbox.org> wrote:
>>>>>> On 3/3/26 18:44, Maarten Lankhorst wrote:
>>>>>>>
>>>>>>> You don't even need to use memset, this would work too:
>>>>>>>
>>>>>>> struct drm_syncobj_handle args = {
>>>>>>>       .flags = 0
>>>>>>> };
>>>>>>
>>>>>> TL;DR: This method isn't 100% safe either.
>>>>>>
>>>>>> It won't initialize any padding which isn't covered by any struct field. We try to avoid that and have explicit padding fields instead, mistakes may happen though, and in theory such padding could later be used for a new field.
>>>>>
>>>>> I don't think this is workable.
>>>>
>>>> libdrm begs to differ. It shows that it's not only workable but really easy. There's no reason for doing it any other way.
>>>
>>> Using memset to initialize padding bytes between fields is workable.
>>> Having the kernel add checks for this for existing ioctls is not
>>> workable because it would break usespace that doesn't do this.
>>
>> As discussed in this thread, memset is also required for when the size of an ioctl struct is extended, even if there is no such padding.
> 
> That is not a concern in rust code. If the rust code extends the
> definition of the struct, all call sites will cause a compilation
> error until the new field is also initialized.
> 
> The issue I'm talking about here is strictly about padding bytes between fields.

So this is not related to the issue which motivated your patch?


>>> Which is every rust program out there as far as I can tell.
>>
>> That's surprising. Surely there must be some unsafe code involved which allows uninitialized memory to be passed to ioctl()?
> 
> The memory is not uninitialized from the perspective of the rust
> language since all fields are initialized. Only the padding bytes are
> uninitialized and they cannot be accessed in safe rust, therefore no
> unsafe is required.
> 
> I've never seen any rust code that uses memset to initialize ioctl
> arguments. It assumes that the ioctl implementation will only read
> from the named fields. Therefore, while the ioctl syscall itself is
> unsafe, developers assume that the safety requirements are satisfied
> in this regard.

As discussed in this thread, that's not a valid assumption and may blow up in their face sooner or later. ("No padding not covered by any fields" is best-effort, not a guarantee)


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
