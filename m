Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FTrK3DyeWnT1AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:26:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DCFA0544
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:26:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E867510E694;
	Wed, 28 Jan 2026 11:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="qJw3Ji5p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9512610E694;
 Wed, 28 Jan 2026 11:26:33 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4f1KjL1TZXz9tmC;
 Wed, 28 Jan 2026 12:26:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1769599590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UgMqvRxiMInROhFo09cCsWov6HfEo9x2oEpjYZtqkjM=;
 b=qJw3Ji5pgV7YO8j2CKYL46Zm0LAnV4tkneRpDowzhJHTQGwgdmeQbV5sSQLu0dxioQjUpI
 +sqK346GVPrrA9VG4ZfVgyf72EfZvK9mLawealRB6mv6F57eUti8NZlyyEOkgnqK5QNQiB
 QQjHi6ok6nk5mmikDOYcRT0f0wI2mw6HRdXSAeC7zxqVPv3PZPexM8ay1z7eGUWgUmFKEt
 vsf14wftsylNXmQV6axEFI/w6zkJoHkjA3YVVGM9gXOb6ai872Yn+ZypRw3vhqkkSofq5q
 dgu7sjGru+J0zD7pNwk87GYDKQTyf+3PWfhprTnfIIhnwwfOmIOzp+tJYOyi8Q==
Message-ID: <f71df23e-f267-46b7-8fd8-4235e9a7a7fb@mailbox.org>
Date: Wed, 28 Jan 2026 12:26:20 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 Hamza Mahfooz <someguy@effective-light.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
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
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2de6d428-b997-4ba8-8766-a211e5612e72@amd.com>
 <2349754.vFx2qVVIhK@timur-hyperion>
 <a8b972be-7265-492f-9855-cdec94a0e0dc@amd.com>
 <aXUQKSJGkz7nzHJ4@hal-station.localdomain>
 <CADnq5_Ob8yiivco+szanSiXuRwdAu4xHMe=8OQSk+Ufqykgobg@mail.gmail.com>
 <aXlBx528d11lMJvl@hal-station>
 <CADnq5_NXd7HYipJTW_riwQDjrZ7S-PW7oFJ=C94_FGAAesV3kA@mail.gmail.com>
 <17cd6378-e3fa-419b-90d3-7e0549817110@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <17cd6378-e3fa-419b-90d3-7e0549817110@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d8bd9bd850864ad67a1
X-MBO-RS-META: a5jk46pmjgbh87au54hpo1sbf1zjj4wd
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
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,effective-light.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,lists.freedesktop.org,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: 57DCFA0544
X-Rspamd-Action: no action

On 1/28/26 11:39, Christian König wrote:
> On 1/27/26 23:57, Alex Deucher wrote:
>> On Tue, Jan 27, 2026 at 5:53 PM Hamza Mahfooz
>> <someguy@effective-light.com> wrote:
>>>
>>> On Mon, Jan 26, 2026 at 09:20:55AM -0500, Alex Deucher wrote:
>>>> I suspect just calling drm_crtc_send_vblank_event() here on the
>>>> relevant crtcs would be enough.
>>>>
>>>
>>> Seems like an interesting idea, though I would imagine we would still
>>> want to attempt a reset (of some kind) assuming that the subsequent page
>>> flip also experiences a timeout.
>>
>> Is it actually a timeout or just missed interrupts?  I'm wondering if
>> some power feature races with the modeset and causes the interrupt to
>> get missed from time to time.
> 
> That is my strong suspicion as well.
> 
> Even if we missed a vblank interrupt that thing is reoccurring, so the worst thing that can happen is that we delayed reporting back success by one frame.
> 
> So something must have turned the CRTC fully off.

Not sure that's a generally valid conclusion (do the gitlab issues talk about the display going black, or about it staying on but freezing?). AFAIR at least in some cases amdgpu uses a dedicated "page flip" interrupt instead of the vblank interrupt, in which case missing a single interrupt could cause a timeout.


P.S. Completing the atomic commit and sending the completion event must work even if user space turns off any CRTCs as part of the commit[0]. So your hypothesis would be a kernel bug, accidentally turning off the CRTC and/or not handling a CRTC getting turned off correctly.

[0] If any CRTC for which the commit has state is off both before and after the commit though, the commit fails with an error before it could result in a timeout.

-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
