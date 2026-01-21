Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICliCSAocGmyWwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 02:13:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69544EEB3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 02:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8A710E049;
	Wed, 21 Jan 2026 01:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pt7AZS2s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B804010E049;
 Wed, 21 Jan 2026 01:13:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 76EFC44351;
 Wed, 21 Jan 2026 01:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50305C16AAE;
 Wed, 21 Jan 2026 01:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768957980;
 bh=/GNei2JmWT5PlnwMApcKkDG9Vb/qfVkL/dGZeOAGVmg=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=pt7AZS2s+M/Nsyee8SAmBXkqzUdmV3ejHtNMNaeTwCxQE9fEOdg7RA7P2xh4CHMYM
 4sjml1B8e51ThZnP0QsOfBO7Knsz72oAFv4P0k9LP3BTL1DL10PrbPfrNGtcV2qj/o
 jC542owMQZO8nCpJ44CpywN1Ka4G9DNgv0t/jFbxMHSKiSscz0PeKFYpn21Yu+pfYm
 2oU2PChKP4nhzDkr1lf71NMqtozHCVXzZgL/2Lf4Pg90H5R4VblYiwFqWJ5hqwzGul
 iD7paYKMFL8JXl09j+GgCUg5LYP1nTWyXhviB10X/CGsQXyn42Z1SPLpyHPqzkgwsx
 bLoDpNBK/5wEg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 02:12:56 +0100
Message-Id: <DFTV9NQTFFU0.NOD8PPU8HW8L@kernel.org>
Subject: Re: [PATCH] nouveau: pci: quiesce GPU on shutdown
Cc: "Dave Airlie" <airlied@gmail.com>, "Lyude Paul" <lyude@redhat.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Simona
 Vetter" <simona@ffwll.ch>, "dri-devel" <dri-devel@lists.freedesktop.org>,
 "nouveau" <nouveau@lists.freedesktop.org>, "linux-kernel"
 <linux-kernel@vger.kernel.org>
To: "Li Chen" <me@linux.beauty>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260120121455.142960-1-me@linux.beauty>
 <CAPM=9tw-Mkw95g=VDgjvqQha8KaTM7e6Qs2b3bvTaNUdz-Q7Kg@mail.gmail.com>
 <19bde085588.1b451560725069.154128025837198067@linux.beauty>
In-Reply-To: <19bde085588.1b451560725069.154128025837198067@linux.beauty>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,redhat.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: A69544EEB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Jan 21, 2026 at 1:50 AM CET, Li Chen wrote:
>  > > +       usleep_range(200, 400);\
>  >=20
>  > Why is this needed? it at least needs a comment.
>
> This patch is needed for kexec/KHO/LUO reboot: firmware reset is skipped,=
 so the GPU may remain in an active/DMA=20
> state and the next kernel can fail to re-init nouveau. We can=E2=80=99t c=
all the full DRM/TTM teardown from ->shutdown() because
> userspace may still hold DRM fds during shutdown, which triggers WARNs.
>
> So the shutdown hook reuses the suspend/quiesce path (safe with open fds)=
 and then powers down the PCI function (D3hot)
> to leave the device in a consistent state for the next kernel.

I think the question was about the usleep_range() specifically. :)
