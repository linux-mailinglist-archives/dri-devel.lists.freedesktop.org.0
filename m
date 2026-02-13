Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLm5Ajmrj2nSSQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 23:52:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9600E139E02
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 23:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BE710E84A;
	Fri, 13 Feb 2026 22:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="nDfBIqoQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E31E10E84A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 22:52:37 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fCS9Y5p7fz9sm6;
 Fri, 13 Feb 2026 23:52:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1771023153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OYMdHs/+oaaB9f+4cKWkLE7Mz2I2iGZ0F48QC7i5Xys=;
 b=nDfBIqoQul/e7BI/OjW6TuLTAZbUyyZgXzctFELtYFeOcnPL5m17tUbKUdWcB8sW0EUNe2
 2PP2SKN0bPfbBup5yWPy5sNTU/arlgdVSpmW6aMQXWldq01zXwKYXsZKIYDrjmlrWmbFtk
 Glan+D26a6YnkTcPZZ9J7lVRGtgicsOncXpSsPSUZ9DnUsb3ITZf23C9QKQFxEqIUGFu8L
 GJAU+9M/kEvfPvt02ZUSaSelN6ZqodRozdOfgjbJ4gMicIbtx70B0OEA4C2ZkgVjhPEW5O
 RmmgrXxXMOyzFSl1KLUC/hPGXc/0OnZuyaMjdN1iMr38HbeyN0rJ3JYM5H107w==
Message-ID: <fcf5ab75-029e-469e-8b2a-51fa5c2a2374@mailbox.org>
Date: Fri, 13 Feb 2026 23:52:29 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Matt Coster <Matt.Coster@imgtec.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Frank Binns <Frank.Binns@imgtec.com>,
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <f82b7734-6ddc-4029-b38d-147e9a1de021@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 96c7hrsacadq8kc9oummy1uk1mamdons
X-MBO-RS-ID: b7be86f54666a4ea61e
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
	FORGED_RECIPIENTS(0.00)[m:regressions@leemhuis.info,m:Matt.Coster@imgtec.com,m:geert@linux-m68k.org,m:Frank.Binns@imgtec.com,m:Brajesh.Gupta@imgtec.com,m:Alessio.Belle@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux-m68k.org,imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: 9600E139E02
X-Rspamd-Action: no action

On 2/12/26 4:56 PM, Thorsten Leemhuis wrote:
> On 2/12/26 15:38, Marek Vasut wrote:
>> On 2/12/26 10:00 AM, Matt Coster wrote:
>>> On 11/02/2026 19:17, Marek Vasut wrote:
>>>> On 1/23/26 2:50 PM, Geert Uytterhoeven wrote:
>>>>> On Fri, 23 Jan 2026 at 14:36, Matt Coster <Matt.Coster@imgtec.com>
>>>>> wrote:
>>>>>> On 22/01/2026 16:08, Geert Uytterhoeven wrote:
>>>>>>> Call the dev_pm_domain_attach_list() and dev_pm_domain_detach_list()
>>>>>>> helpers instead of open-coding multi PM Domain handling.
>>>>>>>
>>>>>>> This changes behavior slightly:
>>>>>>>      - The new handling is also applied in case of a single PM Domain,
>>>>>>>      - PM Domains are now referred to by index instead of by name, but
>>>>>>>        "make dtbs_check" enforces the actual naming and ordering
>>>>>>> anyway,
>>>>>>>      - There are no longer device links created between virtual domain
>>>>>>>        devices, only between virtual devices and the parent device.
>>>>>>
>>>>>> We still need this guarantee, both at start and end of day. In the
>>>>>> current implementation dev_pm_domain_attach_list() iterates forwards,
>>>>>> but so does dev_pm_domain_detach_list(). Even if we changed that, I'd
>>>>>> prefer not to rely on the implementation details when we can
>>>>>> declare the
>>>>>> dependencies explicitly.
>>>>>
>>>>> Note that on R-Car, the PM Domains are nested (see e.g.
>>>>> r8a7795_areas[]),
>>>>> so they are always (un)powered in the correct order.  But that may not
>>>>> be the case in the integration on other SoCs.
>>>>>
>>>>>> We had/have a patch (attached) kicking around internally to use the
>>>>>> *_list() functions but keep the inter-domain links in place; it got
>>>>>> held
>>>>>> up by discussions as to whether we actually need those dependencies
>>>>>> for
>>>>>> the hardware to behave correctly. Your patch spurred me to run around
>>>>>> the office and nag people a bit, and it seems we really do need to
>>>>>> care
>>>>>> about the ordering.
>>>>>
>>>>> OK.
>>>>>
>>>>>> Can you add the links back in for a V2 or I can properly send the
>>>>>> attached patch instead, I don't mind either way.
>>>>>
>>>>> Please move forward with your patch, you are the expert.
>>>>> I prefer not to be blamed for any breakage ;-)
>>>>
>>>> Has there been any progress on fixing this kernel crash ?
>>>>
>>>> There are already two proposed solutions, but no fix is upstream.
>>>
>>> Yes and no. Our patch to use dev_pm_domain_attach_list() has landed in
>>> drm-misc-next as commit e19cc5ab347e3 ("drm/imagination: Use>> dev_pm_domain_attach_list()"), but this does not fix the underlying
>>> issue of missing synchronization in the PM core[1] is still unresolved
>>> as far as I'm aware.
>>
>> OK, but the pvr driver can currently easily crash the kernel on boot if
>> firmware is missing, so that should be fixed soon, right ?
> 
> Well, drm-misc-next afaik means that the above mentioned fix would only
> be merged in 7.1, which is ~4 months away, which is not really "soon"
> I'd say. Or did I misjudge this?

The PM domain issue here crashes the kernel, so I think this would be 
material for drm-misc-fixes .

>> I added the regressions list onto CC, because this seems like a problem
>> worth tracking.
> 
> Noticed that and wondered what change caused the regression.

I think this one:

330e76d31697 ("drm/imagination: Add power domain control")

> Did not
> find a answer in a quick search on lore[1]. Because if it's a
> regression, we maybe should just revert the culprit for now according to
> Linus:
> https://lore.kernel.org/lkml/CAHk-=wi86AosXs66-yi54+mpQjPu0upxB8ZAfG+LsMyJmcuMSA@mail.gmail.com/
> 
> Ciao, Thorsten
> 
> [1] I guess this was the initial report from Geert?
> https://lore.kernel.org/all/CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com/

It is.

I think there are other SoCs which depend on the power domain commit, so 
revert is not so clear cut anymore. But SoCs which have hierarchical 
power domains and which manage to probe this driver without having a 
firmware available for the GPU will simply end with crashed kernel, 
which is really not good.
