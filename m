Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JK+dDvtRlGlFCgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 12:33:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC22314B676
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 12:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A2C10E245;
	Tue, 17 Feb 2026 11:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lENEajt6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE1710E4C1;
 Tue, 17 Feb 2026 11:33:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B6BA4403AC;
 Tue, 17 Feb 2026 11:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3628C4CEF7;
 Tue, 17 Feb 2026 11:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771327990;
 bh=uoRAXvmYWx2i1bPxXi85jlUQdsQ7xtn+rljs8en2JyU=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=lENEajt6/0VVqpbW+LbJsYtgvGFKFp+AXEIGtw4mCLACaqZhIKV+K8+wkX1CHkCpl
 54R0zqB05jQ+KNnrbRngQVUqlMtOYLvJVhVs0c4BocIoV91I8l4FjfPpdUBwc3ZJXt
 fgygdfyQ/cNIUYhuLMCMB/UNTWMxd1SsKH3DZMU0p5Rox8UtHHUA/eR4NDc3iuSyfU
 9srcrx6/n+Vmj05+2K2TN1A6cIwRKfz4JnFgYgZUesJKy1nQaqqxWXv5LiRDHOsg4s
 Zp2ndCm7SIsmzCES/9Cjl67Lr61Bg2FTlYDL6pOyTVQz3yzAJgnVruzldAlgQpnhKv
 pMYiQhUm5OTKA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 12:33:06 +0100
Message-Id: <DGH7D7B7GEXG.2QQCBZYWQ4GP8@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 8/8] gpu: nova-core: gsp: use available device reference
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Gary
 Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
 <20260217-nova-misc-v3-8-b4e2d45eafbc@nvidia.com>
In-Reply-To: <20260217-nova-misc-v3-8-b4e2d45eafbc@nvidia.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,gmail.com,ffwll.ch,nvidia.com,lists.freedesktop.org,vger.kernel.org,garyguo.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AC22314B676
X-Rspamd-Action: no action

On Tue Feb 17, 2026 at 3:45 AM CET, Alexandre Courbot wrote:
> We already have a regular reference to the `Device`, so we don't need to
> repeatedly acquire one in this method.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

This conflicts with [1]. I think I will just drop [1] from my queue, since =
for
nova-core specifically using the base Device here may be better, as eventua=
lly
nova-core will work with both a pci::Device and a platform::Device.

(Which also reminds me that at some point we have to treat pci::Bar as gene=
ric
I/O backend.)

I hope we can actually keep as many code paths in common as I imagine.

[1] https://lore.kernel.org/all/20260123175854.176735-7-gary@kernel.org/
