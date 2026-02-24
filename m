Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD8oD95UnWk2OgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:35:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47FF18317D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A218810E04F;
	Tue, 24 Feb 2026 07:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="XOak9il8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB06810E04F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 07:35:52 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fKqJj3vndz9v89;
 Tue, 24 Feb 2026 08:35:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1771918549; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IVfZkoXJxDi6b+zjGc37nGBvxy39t5lfDaYpg5IiQ18=;
 b=XOak9il84GKUF25NbeqzG8ijyTJO46bPRWA/EVX9xwga8VKSej2e7A1FFduO6ZBWysxyBs
 a7AKVjfco2hmV1EU3a4iqwneZq3z3ncf1V25NvqZbSxN5fyJxjUtrw6+8bmaHz31PvAQ4k
 k6mXPOSsC6NOe1/HS2dj4GqQHaP4GVQhe1oiFpvq2cNOd2UaUhjYRXtmpQGLZfuNydAb/4
 PEi4AMyaibbpf79ZbyW7Z8MSSJB/U78uhJycIhXZ4W8jpOKRdsfjlfog549l13djxeFIIq
 p3HHqMeZuiii3zThwARvv3f59i2gtea/IQolmJIDMj9KxZzxmapTS5p6QopkEg==
Message-ID: <0fdfb3adf756bc88f3b903c65eaf922d0ca3f9a8.camel@mailbox.org>
Subject: Re: [PATCH 25/37] accel/qaic: Replace pci_alloc_irq_vectors() with
 pcim_alloc_irq_vectors()
From: Philipp Stanner <phasta@mailbox.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Shawn Lin
 <shawn.lin@rock-chips.com>,  Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, Bjorn
 Helgaas <bhelgaas@google.com>, Philipp Stanner <phasta@kernel.org>,
 linux-pci@vger.kernel.org
Date: Tue, 24 Feb 2026 08:35:45 +0100
In-Reply-To: <d69a2cc9-15fe-453f-b647-41c5ead7a1c7@oss.qualcomm.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <1771862143-89507-1-git-send-email-shawn.lin@rock-chips.com>
 <41d7d63f-bcda-4182-9340-54d480473586@oss.qualcomm.com>
 <6f0932f0-1e08-62a8-eb92-2380bb9f6928@rock-chips.com>
 <d69a2cc9-15fe-453f-b647-41c5ead7a1c7@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 01de5d21ec9ccf1901d
X-MBO-RS-META: 7a1ugrctpmr8a9s8zuwom5k1ec3jmfq4
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jeff.hugo@oss.qualcomm.com,m:shawn.lin@rock-chips.com,m:ogabbay@kernel.org,m:linux-arm-msm@vger.kernel.org,m:bhelgaas@google.com,m:phasta@kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: C47FF18317D
X-Rspamd-Action: no action

On Mon, 2026-02-23 at 09:25 -0700, Jeff Hugo wrote:
> On 2/23/2026 9:15 AM, Shawn Lin wrote:
> > Hi Jeff
> >=20
> > =E5=9C=A8 2026/02/24 =E6=98=9F=E6=9C=9F=E4=BA=8C 0:01, Jeff Hugo =E5=86=
=99=E9=81=93:
> > > On 2/23/2026 8:55 AM, Shawn Lin wrote:
> > > > pcim_enable_device() no longer automatically manages IRQ vectors vi=
a=20
> > > > devres.
> > > > Drivers must now manually call pci_free_irq_vectors() for cleanup.=
=20
> > > > Alternatively,
> > > > pcim_alloc_irq_vectors() should be used.
> > >=20
> > > This seems to break bisect.=C2=A0 Surely you should update drivers be=
fore=20
> > > you go changing behavior.
> >=20
> > Patch 1 introduces pcim_alloc_irq_vectors() and then convert all needed
> > users to it. Then the final patch(37) remove the implict IRQ vector
> > management in pci_alloc_irq_vectors(). So the individual patch for each
> > driver should be safe IMO. And if these patches go via a single
> > tree with acks, it seems unlikely to break bisect.
>=20
> There is a conflict here between the patch description and what you have=
=20
> just described. It seems like the patch description is wrong.
>=20
> The patch says that pcim_enable_device() has already changed behavior,=
=20
> and now drivers are broken and must update.
>=20
> It seems that the description should be updated.

+1, the commit message should state that the driver patches are cleanup
preparations.


P.
