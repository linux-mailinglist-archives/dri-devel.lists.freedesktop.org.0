Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAkFG6ODlGlBFQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 16:05:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F29514D5DD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 16:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2199910E277;
	Tue, 17 Feb 2026 15:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="AxHYE+2D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E22F10E277
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 15:05:01 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fFjcB1vcMz9thx;
 Tue, 17 Feb 2026 16:04:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1771340698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j+HfRGqTenwP1WEUYCI3cx5JseSezcTkyhSN5LAXhFw=;
 b=AxHYE+2DErvJPJwcroO11MQNOzCk0rAxOz3YG1X3yFQcpF23VwGZgzsZBdN5DbzVgoI+z6
 3Y6wIrts4hn8FjaiCwuktDP5nTHUx8ebFme0d2TiRKTQXU6XZoExbhDKTI9++F8oElYWkE
 xAILyAmHpqAWoNuXK/k69XW7NWREF8w40ZO4i+TpNAlnIPy8BlP4iBlW3G1rEi3GmEvo1z
 WcH/vaVCaRVNI9DEB5vKLC1OF20ntQ0x8sItgfkXyg5B3PhexseW2R3xC2W3Z6WmHjXJDu
 bf2LcKPeWym6ZMoY2qhJPOHpAwSoz6NRiWB22ah9HpBPLE5CnOwF4gwM1hXOIA==
Message-ID: <80fb62ee-0598-48c1-a490-6eefcd1d3b66@mailbox.org>
Date: Tue, 17 Feb 2026 15:33:45 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
To: Matt Coster <Matt.Coster@imgtec.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Frank Binns <Frank.Binns@imgtec.com>,
 Brajesh Gupta <Brajesh.Gupta@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
 <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com>
 <CAMuHMdWMh_oJFg-KtapcTDGvYWZ-hg_ZEJ2=E5Tp1apOEc8tnQ@mail.gmail.com>
 <b3b4f10e-1222-44f7-b308-db7199c67147@mailbox.org>
 <3e0def93-2f6c-4bcf-8ee5-bf607f2ca382@imgtec.com>
 <f5d3dde6-edec-42f4-93cb-459c8677245a@mailbox.org>
 <f82b7734-6ddc-4029-b38d-147e9a1de021@leemhuis.info>
 <fcf5ab75-029e-469e-8b2a-51fa5c2a2374@mailbox.org>
 <95fd3f52-c3ed-40c5-920f-11e8767f701d@leemhuis.info>
 <CAMuHMdV-g+3kTaG6Ost4iHo1Tdi_H=qscLBkBRWuR+6DG5c=SA@mail.gmail.com>
 <1e8e416e-e474-4288-9686-1ba2b88e4946@leemhuis.info>
 <21b1fd77-252e-4fb3-aa65-1c26043c5412@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <21b1fd77-252e-4fb3-aa65-1c26043c5412@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 0ddf39fc09e316a2b4e
X-MBO-RS-META: up57bdnnrzo8fenaqz6kyojobd4b1d9k
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:Matt.Coster@imgtec.com,m:regressions@leemhuis.info,m:geert@linux-m68k.org,m:Frank.Binns@imgtec.com,m:Brajesh.Gupta@imgtec.com,m:Alessio.Belle@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9F29514D5DD
X-Rspamd-Action: no action

On 2/16/26 11:58 AM, Matt Coster wrote:

[...]

>>>>>>> I added the regressions list onto CC, because this seems like a problem
>>>>>>> worth tracking.
>>>>>>
>>>>>> Noticed that and wondered what change caused the regression.
> 
>  From our side at least, I don't believe this is a regression at all. We
> haven't been able to reproduce this issue on any of the platforms we
> have available (although we did stumble on a somewhat related bugfix
> while trying).

There are already two proposed fixes available, and both Geert and me 
are available for testing any other fixes too.

And yes, this is a regression, because this causes a kernel crash which 
did not happen before.

>>>>>
>>>>> I think this one:
>>>>>
>>>>> 330e76d31697 ("drm/imagination: Add power domain control")
> 
> This commit added support for multiple power domains on Imagination GPUs
> in essentially the same manner as other drivers (as mentioned by Geert
> below). Nothing in there is specific to the Renesas platforms where this
> bug can be produces and it is required to support other fully-functional
> platforms such as TI AM68.

That does not imply, that the code is not buggy.

[...]

>>>> Well, it's a judgement call. 330e76d31697 was merged less then a year
>>>> ago, so I'd not be surprised at all if Linus would revert it in a case
>>>> like this. But it seems it doesn't revert clearly anymore, which
>>>> complicates things.
> 
> Reverting this change feels backwards, we're saying that Imagination's
> support for multiple power domains is broken because one platform has
> issues when we attempt to control its power domains. I fully agree that
> we should be working towards resolving this issue, but I don't agree
> that ripping out this handling (that, again, is essentially the same as
> handling in other GPU drivers) is a reasonable solution (even in the
> short term).
> 
> As it currently stands, we're only declaring two GPUs as "fully
> supported": AXE-1-16M and BXS-4-64 as made explicit in commit
> 1c21f240fbc1e ("drm/imagination: Warn or error on unsupported
> hardware").

Actually, this change landed only very recently and completely broke the 
GX6250 on R-Car M3W, which used to probe and work before. Now the driver 
does not even probe with "Unsupported GPU" output, which is clearly bogus.

I would say the aforementioned commit introduced another new regression 
-- something that used to work before no longer works, functionality was 
lost because of the change.

> In order to reach the stage where that check occurs, the GPU
> must be powered on so registers containing the GPU ID can be read.
> However, the original error report happens long after this and would now
> require the exp_hw_support module parameter to be set for this point to
> be reached (as the driver would not attempt to initialise an
> "unsupported" device without this explicit opt-in).

I don't think it is a good solution to selectively block specific 
hardware, only to avoid triggering the power domain issue. The power 
domain issue should be fixed, not hidden.

> It's not currently clear to me whether the crash can be reproduced on
> the affected Renesas platform without this opt-in; it's feasable that
> this is the case but we know it occurs during an error unwind after
> device firmware fails to initialise and the exp_hw_support check happens
> much earlier than this.
> 
> Either way, we should consider adding additional "supported" checks
> based on compatibile strings earlier during initialization to prevent
> fundamental issues like this one from even being possible on unsupported
> and/or unvalidated hardware.

Actually no, the hardware support should be as broad as possible, 
without imposing any artificial limitations like that. This allows users 
to test the driver and find errors, which if they are fixed, ultimately 
improve quality of the driver.

> All that being said, ripping out power domain handling will completely
> break one of the only two platforms we currently fully support: BXS-4-64
> which also has two power domains and is present in several TI SoCs (and
> their DTs).

I am not saying the code should be removed, I am saying the regression 
should be fixed. There are already two proposed fixes available, so it 
would be good to move them forward.

1c21f240fbc1e ("drm/imagination: Warn or error on unsupported hardware") 
should be reverted, this is not helping anything. Warning message would 
be fine though.

>>>>> But SoCs which have hierarchical
>>>>> power domains and which manage to probe this driver without having a
>>>>> firmware available for the GPU will simply end with crashed kernel,
>>>>> which is really not good.
>>>>
>>>> Does the patch Matt mentioned fix the crash? His "this does not fix the
>>>> underlying issue [...]" (see quote earlier) makes it sound like the
>>>> crash or some other problem (theoretical or practical? regression or
>>>> not?) remains. If that's the case and no quick fix in sight I guess it
>>>> would be best if someone affected could post a revert and then we can
>>>> ask Linus if he wants to pick it up.
> 
> The patch I posted (and applied) is somewhat orthogonal to the issue at
> hand. Geert originally suggested using the _attach_list() helper as a
> way to mitigate the issue, and we agree that it's a reasonable cleanup
> effort to make use of it, but I believe the "fix" in the originally
> proposed patch came from removing the device links that are required on
> our platform to ensure the GPU power domains come up (and down) in the
> correct sequence.
> 
>>>
>>> I don't think that patch would fix the crash.  The Adreno and Panfrost
>>> GPU drivers do similar things (explicit multi-PM Domain handling),
>>> so I am wondering if the issue can be triggered with them too (e.g. on
>>> unbind).
> 
> My current understanding of the situation is that the fix proposed by
> Marek in the Reneasas driver[2] works, but is not suitable since
> pm_runtime_barrier() should be inserted by the caller, not the power
> driver. But it seems that's not always possible (particularly when using
> devm), so I don't really understand where we go from here. I still don't
> see anything we're doing substantially differently (before or after the
> commit I mentioned above) from anybody else.

As far as I understand that, Geert was waiting for input from PM people?

At the beginning of this thread, almost a month ago, there was the 
following exchange, hence I was under the impression that a fix is coming:

"
 >> Can you add the links back in for a V2 or I can properly send the
 >> attached patch instead, I don't mind either way.
 >
 > Please move forward with your patch, you are the expert.
 > I prefer not to be blamed for any breakage ;-)
"
