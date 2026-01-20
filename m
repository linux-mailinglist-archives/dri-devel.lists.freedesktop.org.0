Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEFHD/qmb2lDEgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:02:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CE046FBB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FD610E092;
	Tue, 20 Jan 2026 11:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EiEPzaJr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700DB10E092
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 11:14:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9E378600CB;
 Tue, 20 Jan 2026 11:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7E7C16AAE;
 Tue, 20 Jan 2026 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768907678;
 bh=M+5IH4rPhd3O/CiKQNbmPNdoVNjC+8DGvt8pxyAAxuc=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=EiEPzaJrbDRPOVNGuP19VhN1BcljC3yI9MqgN/+siqnDucSM/bFDH5jI7MGDAapUX
 yxuN0+uAZbWonce1CDMfZgqf8NeLDtOUd+lmW4O+kmE9ZpKBRh3W2ekvGzKcD/kFWw
 2Be7RbrFiqfl5QqRwCOTExitHsQv9/oWhTpijABhEf/WAlZJoa9n2SXGtG9UGnjsbp
 aN/PDzVvxGkKxW2zTWbSQuaNiArkeVklWqp1UW7N82hqyEV4HLQVGuPcHTKEZLko1F
 PmLJWF+lVtczRKloFhrnlqPBzg2zo7jisyF8EsolLs7oDTnN0kZG6950qasnCqI24i
 HvZn4UhgvkoCA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 12:14:33 +0100
Message-Id: <DFTDFR0943NX.3RTHNQURC11XQ@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 4/4] rust: drm: dispatch delayed work items to the
 private data
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
References: <20260115-aref-workitem-v1-0-9883e00f0509@collabora.com>
 <20260115-aref-workitem-v1-4-9883e00f0509@collabora.com>
In-Reply-To: <20260115-aref-workitem-v1-4-9883e00f0509@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:airlied@gmail.com,m:simona@ffwll.ch,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:daniel.almeida@collabora.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 01CE046FBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri Jan 16, 2026 at 1:36 AM CET, Daniel Almeida wrote:
> +// SAFETY: Our `HasWork<T, ID>` implementation returns a `work_struct` t=
hat is
> +// stored in the `work` field of a `delayed_work` with the same access r=
ules as
> +// the `work_struct` owing to the bound on `T::Data: HasDelayedWork<Devi=
ce<T>,
> +// ID>`, which requires that `T::Data::raw_get_work` return a `work_stru=
ct` that
> +// is inside a `delayed_work`.
> +unsafe impl<T, const ID: u64> HasDelayedWork<Device<T>, ID> for Device<T=
>
> +where
> +    T: drm::Driver,
> +    T::Data: HasDelayedWork<Device<T>, ID>,
> +{
> +}

What do you intend to do within work that is queued for a DRM device? I ass=
ume
you have to access bus device resources?

Also, it would be nice to see how this is used in a driver. Can you please =
add a
patch for Tyr to the series?
