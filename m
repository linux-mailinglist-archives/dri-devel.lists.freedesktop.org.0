Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Cz8AuYtcGniWwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 02:37:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB5C4F2E3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 02:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022F810E192;
	Wed, 21 Jan 2026 01:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.beauty header.i=me@linux.beauty header.b="FTEGwngV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1336810E192;
 Wed, 21 Jan 2026 01:37:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768959452; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=liIeJTKXCCTCr5TmSEz7NNqhik/u8Lgoyl6wqMLoKAznnAIjdnWADV2hmFD7Lcl4TfZx7cjaT36PCVYQANmxQeq0vzBLg7VNsuPrP4wrLut5ZqUGrqwF24a/t+2GALw44P+uHy5N/+oLEKnekij5fJREsa7nXRwNjXhirWzM1HE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768959452;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=289Atm7oPq1l3r6V8vm4GQYEXnTPwmsMGTT3QqYWfFE=; 
 b=JrBf5NRjWzqzI3poX5JkkT4XxekzYgY/nmxTsMoh5TkJJZyrL/z6lAb/tJ2/oTWivoNKCUopt7P/roX/47EXU4lV8nqbLx3JO+hbYi1uOlo3YGri5ASkaclmbh1V6zmX4DrITJpovTfLhcXjZ8NyCME9vKo+KBL8OFg4f/RjAyI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=linux.beauty;
 spf=pass  smtp.mailfrom=me@linux.beauty;
 dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768959452; 
 s=zmail; d=linux.beauty; i=me@linux.beauty;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=289Atm7oPq1l3r6V8vm4GQYEXnTPwmsMGTT3QqYWfFE=;
 b=FTEGwngVgxHZJC4CHqNeP06r2l8R0UEhOPrtbhJEB07L7h9qBkNqnN2gr5dQYnQq
 9K52QKybxPDioAj7ibU7qNxnCuumgPDMG5S2HqpFFATWCkCGd3WfoqxwzPHiDds9tKU
 GB+eGSRY7qH6bPFE7pw9DhfhgN4DIrq6fGC4PYRA=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1768959451085884.078207294641;
 Tue, 20 Jan 2026 17:37:31 -0800 (PST)
Date: Wed, 21 Jan 2026 09:37:31 +0800
From: Li Chen <me@linux.beauty>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Dave Airlie" <airlied@gmail.com>, "Lyude Paul" <lyude@redhat.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Simona Vetter" <simona@ffwll.ch>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "nouveau" <nouveau@lists.freedesktop.org>,
 "linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <19bde331fbd.dd44bec734977.5910036498943757747@linux.beauty>
In-Reply-To: <DFTV9NQTFFU0.NOD8PPU8HW8L@kernel.org>
References: <20260120121455.142960-1-me@linux.beauty>
 <CAPM=9tw-Mkw95g=VDgjvqQha8KaTM7e6Qs2b3bvTaNUdz-Q7Kg@mail.gmail.com>
 <19bde085588.1b451560725069.154128025837198067@linux.beauty>
 <DFTV9NQTFFU0.NOD8PPU8HW8L@kernel.org>
Subject: Re: [PATCH] nouveau: pci: quiesce GPU on shutdown
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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
X-Spamd-Result: default: False [-1.80 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_DKIM_ALLOW(-0.20)[linux.beauty:s=zmail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux.beauty];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.beauty:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@linux.beauty,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,redhat.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 7FB5C4F2E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Danilo

 > On Wed Jan 21, 2026 at 1:50 AM CET, Li Chen wrote:
 > >  > > +       usleep_range(200, 400);\
 > >  >=20
 > >  > Why is this needed? it at least needs a comment.
 > >
 > > This patch is needed for kexec/KHO/LUO reboot: firmware reset is skipp=
ed, so the GPU may remain in an active/DMA=20
 > > state and the next kernel can fail to re-init nouveau. We can=E2=80=99=
t call the full DRM/TTM teardown from ->shutdown() because
 > > userspace may still hold DRM fds during shutdown, which triggers WARNs=
.
 > >
 > > So the shutdown hook reuses the suspend/quiesce path (safe with open f=
ds) and then powers down the PCI function (D3hot)
 > > to leave the device in a consistent state for the next kernel.
 >=20
 > I think the question was about the usleep_range() specifically. :)
 >

Thanks for the hint.=20

That usleep_range(200, 400) is just to give the PCI power transition time t=
o settle before an immediate kexec jump.

 It=E2=80=99s mirroring the existing nouveau_pmops_suspend() behavior, whic=
h already does udelay(200) right after pci_set_power_state(..., PCI_D3hot).=
 In ->shutdown() we=E2=80=99re allowed to
 sleep, so I used usleep_range() instead of a busy-wait udelay().
=20
Regards,
Li=E2=80=8B

