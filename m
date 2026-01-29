Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCJ0CSkxe2kVCQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:06:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4BFAE62D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23C910E84E;
	Thu, 29 Jan 2026 10:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rCBeFohe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E4010E844;
 Thu, 29 Jan 2026 10:06:26 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4f1vtR3CF4z9tpy;
 Thu, 29 Jan 2026 11:06:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1769681183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kb2jfGjQwA7ut3j/ptuhkH0E+7WJpvt3WXc+5hh8JZk=;
 b=rCBeFohevPYC91yLLM30we8BcEI/k5LIzBNrk35/oVkA1PJ6KKSG26TBpXAvr9GhRDSvww
 BRk5fVRZMN29nF8AtDDeKZ9KM84kM39F5niIxK6l9ix8H6OBwffUwao5Jeehvja8Q1q5aC
 iQ3GPYl0WPeqdyBDKqdOXLYpjHhljMRqji8/WIJkOZZA61ZPVPCPOJ5uImYZcnFQMM3D0S
 K2Cr03/+kdy9hZqYKGgJeB9MN3FpQcdCU1c/CM1qhCLmQSoEKlNqZRfA6+DFbeUC9FFnJ0
 pwBW+RuArlxw0v3sFVaZm49t15STwXQrqNf9hMBz0HXhf7OJEH3k8vOCqvhwcg==
Message-ID: <6f1239d2-eec3-40b6-aca7-5b278350dd04@mailbox.org>
Date: Thu, 29 Jan 2026 11:06:11 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 Hamza Mahfooz <someguy@effective-light.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <17cd6378-e3fa-419b-90d3-7e0549817110@amd.com>
 <f71df23e-f267-46b7-8fd8-4235e9a7a7fb@mailbox.org>
 <2203806.9o76ZdvQCi@timur-hyperion>
 <eef1982a-ddff-4aea-8ece-5aa1995cc2ec@amd.com>
 <ab52825d-8f26-4b52-af5d-4051760b2aa4@mailbox.org>
Content-Language: en-CA
In-Reply-To: <ab52825d-8f26-4b52-af5d-4051760b2aa4@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 5bc67119825c6734ca4
X-MBO-RS-META: f3p4f6ow56ajcedz4stst43zs8fqy943
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
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,effective-light.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,lists.freedesktop.org,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CA4BFAE62D
X-Rspamd-Action: no action

On 1/28/26 15:25, Michel Dänzer wrote:
> On 1/28/26 13:48, Christian König wrote:
>> On 1/28/26 13:14, Timur Kristóf wrote:
>>> On Wednesday, January 28, 2026 12:26:20 PM Central European Standard Time 
>>> Michel Dänzer wrote:
>>>> On 1/28/26 11:39, Christian König wrote:
>>>>>
>>>>> Even if we missed a vblank interrupt that thing is reoccurring, so the
>>>>> worst thing that can happen is that we delayed reporting back success by
>>>>> one frame.
>>>>>
>>>>> So something must have turned the CRTC fully off.
>>>>
>>>> Not sure that's a generally valid conclusion (do the gitlab issues talk
>>>> about the display going black, or about it staying on but freezing?).
>>>
>>> In all the bug reports I've seen about page flip timeouts, and in all the 
>>> timeouts I've seen on my machine, the screen remains on, but frozen.
>>> It doesn't go black and doesn't turn off.
>>>
>>> Christian, why would the CRTC be turned off?
>>
>> Exactly that's the question we need to answer.
>>
>> But from what you describe the CRTC keeps on, just doesn't send any more vblank events.
> 
> The vblank interrupt source getting accidentally disabled might be one possible cause though.

Another possibility is that test-only commits with the DRM_MODE_ATOMIC_TEST_ONLY flag (which can happen in parallel while the kernel is processing a "real" commit) accidentally have side effects on the current kernel state, resulting in the "real" commit failing to do something it should. There have been bugs like that in the amdgpu DM code before.


Anyway, this is all speculation. Somebody just needs to dig in and get to the bottom of why the commits aren't getting completed.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
