Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LbMG9BqmGn4IAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 15:08:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AE01682AB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 15:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E677010E7FE;
	Fri, 20 Feb 2026 14:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="QbigmygX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BD410E7F7;
 Fri, 20 Feb 2026 14:08:11 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fHXCD0nqJz9thB;
 Fri, 20 Feb 2026 15:08:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1771596488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yxQwWnys7SPdXyBlDqrzT4YU31/lCrXbaFhh/RoYuFY=;
 b=QbigmygXDeBY5xwras81h3C3pHOwyk0U07l+YbnlZFaXK9PC52JoHea6I31WGfS2L461Jr
 5bu5M9nVvzo/JpjcSCU001NgpOYZExkmEtgi3Zn2+30ag1iG1R4gmmjWHtpMgv3F9BnzG1
 o070tqsgr9B2iuk6sfmpFdjUugixCeciDU8SGoMFV9J/LNhTHExjIV1Ma808VKFdCRDIrW
 i1R/1ieS0fifu3HaggURcsV9UkT6oWTo0WCJ3LNcsmfy4bYWZn3RsQbo9/mDqpGDJsurdC
 5Rh43YB6g0Lh7OPYCWz9HJGa/Ydg40ChaXqsbbhxZeOC3kxjkV4Ed9XV8TsNUg==
Message-ID: <600034fb-d7e9-4249-8a28-71ed9ed194a0@mailbox.org>
Date: Fri, 20 Feb 2026 15:08:00 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] drm: introduce KMS recovery mechanism
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Hung <alex.hung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, =?UTF-8?Q?Timur_Krist=C3=B3f?=
 <timur.kristof@gmail.com>, Dominik Kaszewski <dominik.kaszewski@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260212230905.688006-1-someguy@effective-light.com>
 <2e359cd9-0192-44d0-886f-7f93a8b0a4fa@amd.com> <aY99D-yXVydpMdwy@hal-station>
 <85319290-4027-4eb8-95d1-9009d23f2294@mailbox.org>
 <aZD0W7V_6--2yqNK@hal-station>
 <7f4a86ad-d642-444c-a576-17ff9caaa934@mailbox.org>
 <aZULq2bDnZpdXvIg@hal-station>
 <8588dcbc-621e-43db-9d69-32398f75d9e6@mailbox.org>
 <dab8d21b-1d28-48c6-87bf-f2060e2d2f1e@mailbox.org>
 <d7c7a96e-1686-4878-8b96-92c3427b2f6d@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <d7c7a96e-1686-4878-8b96-92c3427b2f6d@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4q757zqrarzrhfxj8488zwzhqyxnb17h
X-MBO-RS-ID: 882b08cac187514c1bd
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,lists.freedesktop.org,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 21AE01682AB
X-Rspamd-Action: no action

On 2/20/26 10:09, Michel Dänzer wrote:
> On 2/20/26 09:42, Michel Dänzer wrote:
>> On 2/18/26 10:22, Michel Dänzer wrote:
>>> On 2/18/26 01:45, Hamza Mahfooz wrote:
>>>> On Mon, Feb 16, 2026 at 10:28:13AM +0100, Michel Dänzer wrote:
>>>>> On 2/14/26 23:16, Hamza Mahfooz wrote:
>>>>>> On Sat, Feb 14, 2026 at 03:02:49PM +0100, Michel Dänzer wrote:
>>>>>>
>>>>>>> In principle it's possible to do (the equivalent of) a modeset with the current state for all CRTCs, no need to do it separately per CRTC.
>>>>>>
>>>>>> AFAIK that is what the uevent is already doing (unless I'm mistaken).
>>>>>
>>>>> This is about just doing a full modeset, which isn't something user space can do in response to a wedged event.
>>>>
>>>> I was referring to what compositors are doing in response to
>>>> `drm_kms_helper_hotplug_event()`. Perhaps, the enum constants should be
>>>> renamed, since the forced modeset is actually sent when the current
>>>> reset phase is DRM_KMS_RESET_NONE (the phase is updated before sending
>>>> out the event though).
>>>
>>> Ah, you're talking about the drm_kms_helper_hotplug_event call in drm_atomic_helper_wait_for_flip_done (I thought "uevent" referred to drm_dev_wedged_event in patch 2).
>>>
>>> I don't know about other compositors, but I don't think mutter will do a modeset in response to a hotplug event if no KMS state changed (because some monitors can generate spurious hotplug events).
>>
>> FWIW, if it really turns out impossible for the kernel to do a modeset itself (which I remain unconvinced of), one way to require a modeset from user space is to set the "link-status" connector property to "Bad".
> 
> Having written that down, a reason why the kernel can't just do a modeset itself occurred to me: A modeset might affect other CRTCs than the ones affected by the timed-out commit, which could interact badly with other pending commits affecting those other CRTCs.
> 
> The "link-status" property seems like the best solution so far.

Discussing the "link-status" property, it turns out I slightly misremembered its purpose, it's not really suitable for this.

Maybe the hotplug event is the only way after all.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
