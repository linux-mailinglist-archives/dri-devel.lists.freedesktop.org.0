Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oH+SKqaDlGlBFQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 16:05:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100B114D5EC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 16:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD6F10E4EC;
	Tue, 17 Feb 2026 15:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="AA26+UwB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A7C10E4EC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 15:05:06 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fFjcG5FHzz9tW3;
 Tue, 17 Feb 2026 16:05:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1771340702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m3UklnL2l1wJyZoRWMsGabIbrw1jRJeamlGBukUrD5c=;
 b=AA26+UwBk5TWo/D8dcdSI1nYyoJ29GfOwoasxd1kzgzpxSS9ZOxgSx7qncfbvHaMOYyEcz
 bMwwz9P4D3G5d28V08GeR8AcohFavX3zjVfdrd3SXRppRUEhvEQoBIEyJjogNHzY2OCFvw
 G8UN7S8TjdH3JJK1A7yTO+E8uSRp8xmKLdy5//S9Hl6BTUhUkjHD9cVPw1ySLrdu1Gjuge
 Jml9SBEcREfebIix2gu8nLAwc4WbL/n4P74Eqobd7xIqh8qrFSDEgVCpLwOKQ9VCuf14sU
 63Zvqsxh2mLMOaDphhCZjvzrZkCw7H5jrYR4DwG0ShqlpGhsACcbQOLzKb5xLA==
Message-ID: <22bd258d-c6ea-4ad2-b95d-e56c061f8a71@mailbox.org>
Date: Tue, 17 Feb 2026 15:52:27 +0100
MIME-Version: 1.0
From: Marek Vasut <marek.vasut@mailbox.org>
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
 <9c1b2671-3374-4d84-ad14-07dd499bb934@leemhuis.info>
 <86e23062-e439-41f3-9750-d87fa5b85447@imgtec.com>
Content-Language: en-US
In-Reply-To: <86e23062-e439-41f3-9750-d87fa5b85447@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 3b426e9dacb9a44bdc1
X-MBO-RS-META: sbdouupt3i1drrwqa46zctktwpiue3p8
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Matt.Coster@imgtec.com,m:regressions@leemhuis.info,m:geert@linux-m68k.org,m:Frank.Binns@imgtec.com,m:Brajesh.Gupta@imgtec.com,m:Alessio.Belle@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 100B114D5EC
X-Rspamd-Action: no action

On 2/16/26 2:37 PM, Matt Coster wrote:
> On 16/02/2026 11:38, Thorsten Leemhuis wrote:
>> On 2/16/26 11:58, Matt Coster wrote:
>>> On 16/02/2026 10:11, Thorsten Leemhuis wrote:
>>>
>>> We're currently trying to force this issue to reproduce on hardware we
>>> have on hand; we'd like to see it fixed properly as much as anyone.
>>
>> Yeah, no worries, I never doubted that. But getting things properly fixed
>> can mean "revert, fix, reapply" when it comes to regressions in Linux --
>> which is something that should not be seen as something bad, as Linus said
>> himself (see below)!
>>
>>>  From our side at least, I don't believe this is a regression at all.
>> In the end what matters is: some change afaics caused systems to not work
>> anymore that used to be working -- that makes it a regression my the Linux
>> kernels standards. And those by the same standards must be fixed, ideally
>> quickly. Find a few quotes on that from Linus below that explains this
>> better.
> 
> I feel like I should reiterate that the commit we're talking about
> reverting is fundamental to support for one of the only two platforms
> currently supported. And that the changes to add "support" (just
> bindings and DT) for the affected Renesas platforms came several months
> *after* this.

I would argue, that the problem at hand is not related to any specific 
platform, this is a driver bug. That some platform triggers it means, 
that the driver bug is real and has to be fixed. Whether the bug is in 
this driver or PM core.

> The "regression" here is that we allowed DTS changes to land for
> unsupported platforms in the interest of allowing further development to
> happen incrementally upstream. There has been no further progress on
> that front beyond the DTS patches, however.

Those specific DTS patches were put on hold, they couldn't be applied 
because they would lead to kernel crash in this driver, so the hold is 
to be expected.

> We have never declared that
> these platforms should be functional and error-free, and have taken
> measures to ensure this is clear to users[1].

I would argue, we should not mix functional issues with outright kernel 
crashes. If the GPU misrenders something, that is a functional issue. If 
the GPU driver crashes the kernel, that is a kernel bug and should be fixed.

And in this case, it is the later, the driver can trigger a kernel crash.

> There are currently two platforms on which this has been reproduced:
> 
>   - Renesas Gray Hawk Single (R-Car V4M) -- this was the original report
>     from Geert, and it should be noted that there are no bindings or DTS
>     support for the GPU in this platform in tree at this time.
>   - Renesas Salvator-X (R-Car M3-W) -- this was Geert's follow-up
>     reproduction case, and the upstream bindings and DTS do contain the
>     GPU, but it required adding delays to PM core code to trigger the
>     race condition(?) that causes the crash.
> 
> As far as we know, there are no other situations where this crash
> occurs.

It seems the crash would occur on any platform with hierarchical power 
domains.

> Would you consider a suitable "revert" to be fully gating support for
> these platforms (or even the entire group of Renesas platforms added in
> this "experimental" manner just to be safe) behind the exp_hw_support
> paramater until they can be properly tested? Specifically, I'm talking
> about masking them off at the of_match level so that no hardware
> interaction is even attempted without explicit user opt-in to
> experimental hardware.

No, that is only hiding the kernel crash without actually fixing it. 
This is not good.
