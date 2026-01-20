Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAD/Kyaob2ndEgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:07:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1512E47148
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9F310E5B8;
	Tue, 20 Jan 2026 11:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DIXJv2G3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737AA10E5BE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 11:13:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3402F43540;
 Tue, 20 Jan 2026 11:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B0EC19421;
 Tue, 20 Jan 2026 11:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768907608;
 bh=kIXzeKf0e4CbSc5xLvJoptrjAYgLuZH0QYeII1ZTp0I=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=DIXJv2G3a7V8+oS0nvqYnQLoJ82aVbNFFWCSBMPvujnekxGSfJSmFXLY8IoBliZ0B
 Y2WxnSP2yrIx84iss3Hz/suhl4VLpfONAvZJYkY8xwu03yGK0M/4aHk+d54JLKBMup
 TKPzQUpsiSkyMapXAxH3NltRYPbVaKNz4RWf5LTwQP0/jdpPLd7udOr7bG8FNHplxf
 OWY3S8rkQNxC5tG+c2nDqwHsK/CPstCLk5g9H+H+2RVECBTpiKKlt9/2cFLs2iMfD8
 ZH16F1iRlrq/qu84gPnhtmOF5hRHmnMfQVG7xgEH85/xfaam8EbHLG1HpOkPt/7ea+
 ejvoj4O3YbYBg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 12:13:23 +0100
Message-Id: <DFTDEUP7QD1H.KXCX4WWPZUNY@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/4] rust: drm: dispatch work items to the private data
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20260115-aref-workitem-v1-0-9883e00f0509@collabora.com>
 <20260115-aref-workitem-v1-2-9883e00f0509@collabora.com>
In-Reply-To: <20260115-aref-workitem-v1-2-9883e00f0509@collabora.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:airlied@gmail.com,m:simona@ffwll.ch,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 1512E47148
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri Jan 16, 2026 at 1:35 AM CET, Daniel Almeida wrote:
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index 3ce8f62a0056..c760a743e1df 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -6,13 +6,13 @@
> =20
>  use crate::{
>      alloc::allocator::Kmalloc,
> -    bindings, device, drm,
> -    drm::driver::AllocImpl,
> -    error::from_err_ptr,
> -    error::Result,
> +    bindings, device,
> +    drm::{self, driver::AllocImpl},
> +    error::{from_err_ptr, Result},
>      prelude::*,
>      sync::aref::{ARef, AlwaysRefCounted},
>      types::Opaque,
> +    workqueue::{HasWork, Work, WorkItem},
>  };

Please use the kernel's import style when making changes.
