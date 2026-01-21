Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MB4BslncGkVXwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 06:44:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CA651A44
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 06:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6182210E010;
	Wed, 21 Jan 2026 05:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.beauty header.i=me@linux.beauty header.b="JnCBp5t3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CC010E010;
 Wed, 21 Jan 2026 05:44:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768974266; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cZhpIDNUErIOAsEPvqPjjZg9iLKjz/FVysEPCCQtO21OclWkEPHDDez7RGUqru/DM82VnGZx5hSDQW8N250m+Y/N7jjYQGVii2wnwkRpiRGHCAsrGwR28nnxiOLrKVt4/pgffpnxH9qY7QJoX5AdxJMxckwT4EjiEyfI2UsPtu8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768974266;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=M1IjJsuCkyCNJR7d9d5lc/Xs7l1v8A10Q9+aE6hDk5o=; 
 b=hYTSU4u1ikruzES3hVVB5K0UDxwHSBv2D4D6qEClXOR14XiJIRHffx57Avp3Rni9qXKnvUp8ItDBssK0a7TTDVdgIn7I2yIiqN/l2ZcbKmnFzTtX6xxdpVGI+88Hc6ZSiW0ziqMFUQzsvKvqIQu5dXC3K/LctttYYWFMTMyEYiA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=linux.beauty;
 spf=pass  smtp.mailfrom=me@linux.beauty;
 dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768974266; 
 s=zmail; d=linux.beauty; i=me@linux.beauty;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=M1IjJsuCkyCNJR7d9d5lc/Xs7l1v8A10Q9+aE6hDk5o=;
 b=JnCBp5t3yTDjmowYYitEkKBOfBPh8Eg+jPPv2657RexlCYNGWHIsBk61dU9nJRDi
 xNm+EF/7Qkukq7i3zr6H+nEsAMReXOlWQFYtLszEojHIVu7EHaDZXuY/HJH2G2MoQMG
 w/UoysBoSj661XqFkLbU6DL/CBFwD3PvEULP8jzU=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1768974265002130.89096268231458;
 Tue, 20 Jan 2026 21:44:25 -0800 (PST)
Date: Wed, 21 Jan 2026 13:44:24 +0800
From: Li Chen <me@linux.beauty>
To: "David Airlie" <airlied@gmail.com>
Cc: "Lyude Paul" <lyude@redhat.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Simona Vetter" <simona@ffwll.ch>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "nouveau" <nouveau@lists.freedesktop.org>,
 "linux-kernel" <linux-kernel@vger.kernel.org>,
 "Daniel Palmer" <daniel@0x0f.com>
Message-ID: <19bdf152a97.5ffa0a07806790.470935296772844852@linux.beauty>
In-Reply-To: <19bde331fbd.dd44bec734977.5910036498943757747@linux.beauty>
References: <20260120121455.142960-1-me@linux.beauty>
 <CAPM=9tw-Mkw95g=VDgjvqQha8KaTM7e6Qs2b3bvTaNUdz-Q7Kg@mail.gmail.com>
 <19bde085588.1b451560725069.154128025837198067@linux.beauty>
 <DFTV9NQTFFU0.NOD8PPU8HW8L@kernel.org>
 <19bde331fbd.dd44bec734977.5910036498943757747@linux.beauty>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linux.beauty:s=zmail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_NA(0.00)[linux.beauty];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.beauty:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@linux.beauty,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.beauty:mid,linux.beauty:dkim]
X-Rspamd-Queue-Id: 85CA651A44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dave,

 > Hi Danilo
 >=20
 >  > On Wed Jan 21, 2026 at 1:50 AM CET, Li Chen wrote:
 >  > >  > > +       usleep_range(200, 400);\
 >  > >  >=20
 >  > >  > Why is this needed? it at least needs a comment.
 >  > >
 >  > > This patch is needed for kexec/KHO/LUO reboot: firmware reset is sk=
ipped, so the GPU may remain in an active/DMA=20
 >  > > state and the next kernel can fail to re-init nouveau. We can=E2=80=
=99t call the full DRM/TTM teardown from ->shutdown() because
 >  > > userspace may still hold DRM fds during shutdown, which triggers WA=
RNs.
 >  > >
 >  > > So the shutdown hook reuses the suspend/quiesce path (safe with ope=
n fds) and then powers down the PCI function (D3hot)
 >  > > to leave the device in a consistent state for the next kernel.
 >  >=20
 >  > I think the question was about the usleep_range() specifically. :)
 >  >
 >=20
 > Thanks for the hint.=20
 >=20
 > That usleep_range(200, 400) is just to give the PCI power transition tim=
e to settle before an immediate kexec jump.
 >=20
 >  It=E2=80=99s mirroring the existing nouveau_pmops_suspend() behavior, w=
hich already does udelay(200) right after pci_set_power_state(..., PCI_D3ho=
t). In ->shutdown() we=E2=80=99re allowed to
 >  sleep, so I used usleep_range() instead of a busy-wait udelay().

Dave, if this is ok, I would add it as comment in the next version.

Regards,
Li=E2=80=8B

