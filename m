Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACQ6H/7ljWms8QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 15:38:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F54812E50A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 15:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B40010E756;
	Thu, 12 Feb 2026 14:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="hkpRxZnV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9741810E756
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 14:38:48 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fBdGF2LM5z9sRl;
 Thu, 12 Feb 2026 15:38:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1770907125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/tASHD0fqztvwzzYhG9wjA3X6Sb887HuRt+4PzQxJS8=;
 b=hkpRxZnV4NZ8j1b1klMnWvP1cEFlt4/bJdJBzk3P8iXEt+NmPgvT+JdunIi7ZAYa6dsVDw
 6sKIkgJrYfcHS9Tvyucnz+KLHnl3lgC2ObC/himMo/eRH9pGUnE2pI9AkpCink6X8rFtcd
 wp0k1PSqOwpdbkdtO1o2SUN1ybCvMRxI/ek4OP7tRvpJubVdw4HOluLuZWYHa8wWXBIXmS
 pGURxTQqKWWxC3VZGkWJFVWqPkqJ0w+bzPwDc/I3Ecu4XAvymoqBPqS3kHOnjTI+DljDp3
 pCF8DZrbxLAp/lwtwXmdMuGdbyS8tQ8fRY9s3u/EIgwuPREyWcub6oS43KkNdw==
Message-ID: <f5d3dde6-edec-42f4-93cb-459c8677245a@mailbox.org>
Date: Thu, 12 Feb 2026 15:38:40 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <3e0def93-2f6c-4bcf-8ee5-bf607f2ca382@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: m5na1oyisi5kf9qja4q3ixf1e5yo8yfw
X-MBO-RS-ID: 5c189705801aa560717
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Matt.Coster@imgtec.com,m:geert@linux-m68k.org,m:regressions@leemhuis.info,m:Frank.Binns@imgtec.com,m:Brajesh.Gupta@imgtec.com,m:Alessio.Belle@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-m68k.org,leemhuis.info,imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9F54812E50A
X-Rspamd-Action: no action

On 2/12/26 10:00 AM, Matt Coster wrote:
> On 11/02/2026 19:17, Marek Vasut wrote:
>> On 1/23/26 2:50 PM, Geert Uytterhoeven wrote:
>>
>> Hello everyone,
>>
>>> On Fri, 23 Jan 2026 at 14:36, Matt Coster <Matt.Coster@imgtec.com> wrote:
>>>> On 22/01/2026 16:08, Geert Uytterhoeven wrote:
>>>>> Call the dev_pm_domain_attach_list() and dev_pm_domain_detach_list()
>>>>> helpers instead of open-coding multi PM Domain handling.
>>>>>
>>>>> This changes behavior slightly:
>>>>>     - The new handling is also applied in case of a single PM Domain,
>>>>>     - PM Domains are now referred to by index instead of by name, but
>>>>>       "make dtbs_check" enforces the actual naming and ordering anyway,
>>>>>     - There are no longer device links created between virtual domain
>>>>>       devices, only between virtual devices and the parent device.
>>>>
>>>> We still need this guarantee, both at start and end of day. In the
>>>> current implementation dev_pm_domain_attach_list() iterates forwards,
>>>> but so does dev_pm_domain_detach_list(). Even if we changed that, I'd
>>>> prefer not to rely on the implementation details when we can declare the
>>>> dependencies explicitly.
>>>
>>> Note that on R-Car, the PM Domains are nested (see e.g. r8a7795_areas[]),
>>> so they are always (un)powered in the correct order.  But that may not
>>> be the case in the integration on other SoCs.
>>>
>>>> We had/have a patch (attached) kicking around internally to use the
>>>> *_list() functions but keep the inter-domain links in place; it got held
>>>> up by discussions as to whether we actually need those dependencies for
>>>> the hardware to behave correctly. Your patch spurred me to run around
>>>> the office and nag people a bit, and it seems we really do need to care
>>>> about the ordering.
>>>
>>> OK.
>>>
>>>> Can you add the links back in for a V2 or I can properly send the
>>>> attached patch instead, I don't mind either way.
>>>
>>> Please move forward with your patch, you are the expert.
>>> I prefer not to be blamed for any breakage ;-)
>>
>> Has there been any progress on fixing this kernel crash ?
>>
>> There are already two proposed solutions, but no fix is upstream.
>>
> 
> Yes and no. Our patch to use dev_pm_domain_attach_list() has landed in
> drm-misc-next as commit e19cc5ab347e3 ("drm/imagination: Use
> dev_pm_domain_attach_list()"), but this does not fix the underlying
> issue of missing synchronization in the PM core[1] is still unresolved
> as far as I'm aware.

OK, but the pvr driver can currently easily crash the kernel on boot if 
firmware is missing, so that should be fixed soon, right ?

I added the regressions list onto CC, because this seems like a problem 
worth tracking.
