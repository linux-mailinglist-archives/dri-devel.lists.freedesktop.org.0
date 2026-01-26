Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEQcMcB6d2n7ggEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 15:31:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9A0897F9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 15:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F66D10E43E;
	Mon, 26 Jan 2026 14:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="RYQCaMrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBCD10E43A;
 Mon, 26 Jan 2026 14:31:24 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4f09vY21Ssz9t4k;
 Mon, 26 Jan 2026 15:31:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1769437881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6zVpRU2aramu9QFVYR92zkAi4BxWcnG9rzTg0nEJ44=;
 b=RYQCaMrUxWh2EzizXT6UuMZZDs++5PBTAeKcSv7UGS026OjNpFNhjVfd0JZZ4uKN8UGX/6
 8StteioGCKMI1vCyysvLJyJ13KAbbkty/WpmRNJB+7FyO+7W3WIhcZUtjhyKlwWGFahC4P
 L7wOU1Xd2TnbPqoQ3apx3K/RoLdcftwIDbp9pgqeBU6GAGX1pPfgk2pQxKt+9gCa9Pp9AI
 KvSkvqaGC1cYDdIPvDcQygXzMxqvhTloQoWJDzo8S6eU1HbAbtxT+Hnluaq0FJ2ElK2Gug
 ydlAelSykMRJh3xqjSCyN6sTVY/6zU70T7xE/HFXiJSfQCU+LEXwwSQkWE5M8w==
Message-ID: <ff1b1825-c2ad-42f3-8910-d919fe627cc6@mailbox.org>
Date: Mon, 26 Jan 2026 15:31:12 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Hamza Mahfooz <someguy@effective-light.com>, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2de6d428-b997-4ba8-8766-a211e5612e72@amd.com>
 <2349754.vFx2qVVIhK@timur-hyperion>
 <fd3f2b16-41e7-4a9b-999d-e137e5abb7df@amd.com>
 <79ed136a-cedd-4e97-adb8-bc3f4f2b8bb4@mailbox.org>
 <601b38b5-1890-48f9-adf9-54fb85650852@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <601b38b5-1890-48f9-adf9-54fb85650852@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 56g46ex4zzszpyyfj5jnnootet31fwhs
X-MBO-RS-ID: 5288ac53a679aea3988
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,effective-light.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,indico.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7A9A0897F9
X-Rspamd-Action: no action

On 1/26/26 14:00, Christian König wrote:
> On 1/26/26 11:27, Michel Dänzer wrote:
>> On 1/26/26 11:14, Christian König wrote:
>>> On 1/23/26 15:44, Timur Kristóf wrote:
>>>> On Friday, January 23, 2026 2:52:44 PM Central European Standard Time 
>>>> Christian König wrote:
>>>>
>>>>> So as far as I can see the whole approach doesn't make any sense at all.
>>>>
>>>> Actually this approach was proposed as a solution at XDC 2025 in Harry's 
>>>> presentation, "DRM calls driver callback to attempt recovery", see page 9 in 
>>>> this slide deck:
>>>>
>>>> https://indico.freedesktop.org/event/10/contributions/431/attachments/
>>>> 267/355/2025%20XDC%20Hackfest%20Update%20v1.2.pdf
>>>>
>>>> If you disagree with Harry, please make a counter-proposal.
>>>
>>> Well I must have missed that detail otherwise I would have objected.
>>>
>>> But looking at the slide Harry actually pointed out what immediately came to my mind as well, e.g. that the Compositor needs to issue a full modeset to re-program the CRTC.
>>
>> In principle, the kernel driver has all the information it needs to reprogram the HW by itself. Not sure why the compositor would need to be actively involved.
> 
> Well first of all I'm not sure if we can reprogram the HW even if all information are available.
> 
> Please keep in mind that we are in a dma_fence timeout handler here with the usual rat tail of consequences. So no allocation of memory or taking locks under which memory is allocated or are part of preparing the page flip etc... I'm not so deep in the atomic code, so Alex, Sima and probably you as well can answer that much better than I do, but of hand it sounds questionable.
> 
> On the other hand we could of course postpone reprogramming the CRTC into an async work item, but that might created more problems then it solves.

Seems doable offhand from a KMS UAPI PoV. The reprogramming just needs to be done before sending the atomic commit completion event(s) to user space.

Not sure about the DMA fence angle though. (I consider OUT_FENCE_PTR problematic for other reasons, in particular, using it to get a release fence for clients is kind of laying a trap for them. And in the compositor I see no benefit vs completion events)


> Then second even if the kernel can do it I'm not sure if it should do it.
> 
> I mean userspace asked for a quick page flip and not some expensive CRTC/PLL reprogramming.

More complex atomic commits can also hang, FWIW. In fact, they might be more likely to hang.


> Stuff like that usually takes some time and by then the frame which should be displayed by the page flip might already be stale and it would be better to tell userspace that we couldn't display it on time and wait for a new frame to be generated.

With my compositor developer hat on, I'd rather not spend effort generating a new frame if there is doubt that the kernel will actually be able to display it. The worst case of that would be constantly generating new frames, none of which are displayed.

I'd rather try again with the same frame, which boils down to an "empty" (no actual state changes) commit with the DRM_MODE_ATOMIC_ALLOW_MODESET flag.

Relying on user space for this can also be problematic, e.g. if user space dies and drops back to fbcon.


> And third, there must be a root cause of the page flip not completing.
> 
> My educated guess is that we have some atomic property change or even turning the CRTC off in parallel with the page flip. I mean HW rarely turns off its reoccurring vblank interrupt on its own.
> 
> Returning an error to userspace might actually help identify the root cause.

It seems pretty clear that the hangs plaguing KWin are amdgpu DC bugs.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
