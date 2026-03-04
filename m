Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AATyHeYZqGmgnwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:39:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 032231FF200
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF3010E9C4;
	Wed,  4 Mar 2026 11:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hy2HOrsP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEB110E9C4;
 Wed,  4 Mar 2026 11:39:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C196060097;
 Wed,  4 Mar 2026 11:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF2DC19423;
 Wed,  4 Mar 2026 11:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772624353;
 bh=UuegjYjNYdFZYA27dchsMoBmg0FJygSXcjoy8zrEaVM=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=Hy2HOrsPB2b4JElrQXZZO2/AwB1zsGmrhScOPZtBCa7DX8h2EXtAO7CrARdqoG8YT
 gkSqDunPagYps1kxEXIgVQFw7m2Qbt/sSh62rRVZMi63VwQ1sCfc90uYk1UIDJiWrg
 /aX1Gt1HLFzk05DW7yhl38EwR7IfUrkqujxbWMAtAJ52X7qKILjLqjVPMQtLLVsK6d
 h7601dTjKVpm5KTzJT1t5wrf2vvf6/3tFIDuMBhs125oZhEuFm6dpN/LAIp4pCwgRV
 H8bCOF0aWTK9E+FOROz1kQX6yvoGXDz6nCTg9I2T/8pMd/zI0ZqHl9ncEg9DA84I1F
 SdR9qICqcPcJA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 12:39:08 +0100
Message-Id: <DGTYVZMRVLLE.3HQVL7ZT6MU7H@kernel.org>
Subject: Re: [PATCH v5 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Zhi Wang" <zhiw@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
 <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>
In-Reply-To: <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>
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
X-Rspamd-Queue-Id: 032231FF200
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,nvidia.com,gmail.com,ffwll.ch,kernel.org,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed Mar 4, 2026 at 2:42 AM CET, Eliot Courtney wrote:
> +    fn allocate_command(&mut self, size: usize, timeout: Delta) -> Resul=
t<GspCommand<'_>> {
> +        read_poll_timeout(
> +            || Ok(self.driver_write_area_size()),
> +            |available_bytes| *available_bytes >=3D size_of::<GspMsgElem=
ent>() + size,
> +            Delta::ZERO,

Isn't this either creating unneccessary thrashing of the memory controller =
or
unnecessary contention at the cache-coherency level?

I think we should probably add at least a small delay of something around 1=
us.

> +            timeout,
> +        )?;
