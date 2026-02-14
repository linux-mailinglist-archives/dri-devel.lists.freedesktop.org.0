Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LiXO6WAkGnMaQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 15:03:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFC113C291
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 15:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E344F10E0D4;
	Sat, 14 Feb 2026 14:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="sLN3Je3O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E67310E025;
 Sat, 14 Feb 2026 14:03:00 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fCrN01M4Fz9tMM;
 Sat, 14 Feb 2026 15:02:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1771077776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bu4Kh8+07Aj0vR82KnHjswgtePhrB3Pqq1DSTBdM7dU=;
 b=sLN3Je3OkMeRHLM/EmdLKp3Gs7xpZRrsAP/WHGqopZ44SGxP4Js14SVXWtqrxZxNp50cLD
 5wXfzZrB+Ce0wJ/OJcmOuh9hO9VgxpazOzvYtgNDuAmVJGuBNInEUsVWk1x9gW89XEZbyM
 G8vAke2XwM6Xa/KPDqMLeTJFGt+JcaXT+91FfGlIcQYcO6C4XYlOqrM29W7dTapmOMn1mB
 +EBS6P4r1aCB9rffv3lAtJj5i+T1cKVLa4JpvvYhDfgJhRphmvoc3ST8CF/rYDJp28OJw6
 CV8GdZkqKFGEellt+iPv1Q/eIldP7D/i7wDUOuD0pkRB0/zARGMMqt/piOyT7g==
Message-ID: <85319290-4027-4eb8-95d1-9009d23f2294@mailbox.org>
Date: Sat, 14 Feb 2026 15:02:49 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] drm: introduce KMS recovery mechanism
To: Hamza Mahfooz <someguy@effective-light.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>, 
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
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <aY99D-yXVydpMdwy@hal-station>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 982611f9b9d2b368ea8
X-MBO-RS-META: txbjk3j3ngpffmqrwtmk5n4bowfz4ce4
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
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: 3FFC113C291
X-Rspamd-Action: no action

On 2/13/26 20:35, Hamza Mahfooz wrote:
> On Thu, Feb 12, 2026 at 06:18:17PM -0600, Mario Limonciello wrote:
> 
>>> @@ -1881,13 +1886,43 @@ void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
>>>   			continue;
>>>   		ret = wait_for_completion_timeout(&commit->flip_done, 10 * HZ);
>>> -		if (ret == 0)
>>> -			drm_err(dev, "[CRTC:%d:%s] flip_done timed out\n",
>>> -				crtc->base.id, crtc->name);
>>> +		if (!ret) {
>>> +			switch (dev->reset_phase) {
>>> +			case DRM_KMS_RESET_NONE:
>>> +				drm_err(dev, "[CRTC:%d:%s] flip_done timed out\n",
>>> +					crtc->base.id, crtc->name);
>>> +				dev->reset_phase = DRM_KMS_RESET_FORCE_MODESET;
>>> +				drm_kms_helper_hotplug_event(dev);
>>> +				break;
>>
>> Since you're iterating multiple CRTCs if you manage to recover from one
>> with this call shouldn't you keep iterating the rest?
> 
> Most measures that the can be implemented at the kernel level (including
> forcing a full modeset), can't save the the current commit.

Why couldn't a full modeset?


> So, in all likelihood we will just end up waiting an extra 10 seconds per CRTC
> (assuming they haven't completed already, unrelated to the forced
> modeset).

In principle it's possible to do (the equivalent of) a modeset with the current state for all CRTCs, no need to do it separately per CRTC.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
