Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGWHMYTHqGnLxAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 01:00:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D742094DE
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 01:00:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFEC10E157;
	Thu,  5 Mar 2026 00:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mGCQXwhZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD14310E157;
 Wed,  4 Mar 2026 23:59:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E31D261340;
 Wed,  4 Mar 2026 23:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37832C4CEF7;
 Wed,  4 Mar 2026 23:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772668797;
 bh=7GqYw5Pu87/AffcDaoPwsaMLaPL9JlCKUhGyzO/+gKg=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=mGCQXwhZhhcR3WYvFKs84pAGb7agdeLh5/c+ksgy0GuMEwmxLSorkaTOjT78a+JpF
 IlEh3tnFFCCWhoh64LTD1OLK7ZypbdnPD+eIjqEyujT0iztCA42CNid3IIkXkxN7ng
 lyYAObhK8/r8Et4skyxG3e3H4wak7mxzGLDmGgt7xV0lTxWf2C6NvSkf3poJSz6Jnd
 bTNuwpvB1rKZcXnveYhTOa+MjWJSaAyxdZAEdXKA/7wZhL27gpOPwhuSU++ESi3GJu
 QflIUl4JlpD3zDZbErRg2frxRXmp9uvW0sF/jur0n1c4I0RT0iBLKp7A6kenB7ir/t
 ptJjq+i7OWW5A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 00:59:52 +0100
Message-Id: <DGUEN4UNMUT0.3GQ73H7YWHQNL@kernel.org>
Subject: Re: [PATCH v3] gpu: nova-core: fix stack overflow in GSP memory
 allocation
Cc: <tim.kovalenko@proton.me>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Tim Kovalenko via B4 Relay" <devnull+tim.kovalenko.proton.me@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260217-drm-rust-next-v3-1-9e7e95c597dc@proton.me>
In-Reply-To: <20260217-drm-rust-next-v3-1-9e7e95c597dc@proton.me>
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
X-Rspamd-Queue-Id: 59D742094DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[proton.me,nvidia.com,google.com,gmail.com,ffwll.ch,kernel.org,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,tim.kovalenko.proton.me];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed Feb 18, 2026 at 5:01 AM CET, Tim Kovalenko via B4 Relay wrote:
> From: Tim Kovalenko <tim.kovalenko@proton.me>
>
> The `Cmdq::new` function was allocating a `PteArray` struct on the stack
> and was causing a stack overflow with 8216 bytes.
>
> Modify the `PteArray` to calculate and write the Page Table Entries
> directly into the coherent DMA buffer one-by-one. This reduces the stack
> usage quite a lot.
>
> Signed-off-by: Tim Kovalenko <tim.kovalenko@proton.me>

Can you please rebase your patch on top of [1] and use index projection?

[1] https://lore.kernel.org/rust-for-linux/20260302164239.284084-1-gary@ker=
nel.org/

Thanks,
Danilo
