Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLdoFI0jcWl8eQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 20:05:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9734F5BCD0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 20:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1127B10E865;
	Wed, 21 Jan 2026 19:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Q+5iA1dS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD17010E865;
 Wed, 21 Jan 2026 19:05:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769022340; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FfgGndmamLkoIWDKPYiKhzeLM5DSD0H6fhswkcAKM+lSN6G1xwBi5AGONl4blERew8prIOMgYKH0AwzS26wxIm3EOrosAIA+5VyDUGfeWrDbxzQSvKOENSNLd0XObH1L8AE08mMmAdiWR4wbFmkfR5Dx9o2M40FsUNC7nr63wjg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769022340;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=GwUrV7Qj4EARXRM+GghZGm9v/6bAFT6QLlVPI91PR80=; 
 b=KXtTDktyyvUFnpGYF9pwo/rpyHkAkeK1v09P8H3t+SkkqpfcP4gBWlOT5c2LuT0WH0FjzdwVo+BSt/Zm9Rg7LGQ/qcxVLz7js9ta8/Yp278QG6DbCuFnCB5CLhW1LHDN9fM1R9aWv2RxrsmTmFmP5aAXlqJIjzYTxmKHcYMZKC4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769022339; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=GwUrV7Qj4EARXRM+GghZGm9v/6bAFT6QLlVPI91PR80=;
 b=Q+5iA1dSt/3flpuK0Bz9f27pEJSWIbb01CBWcMNdoe7E9ljktRj31axsgQ0FyJi9
 8UI4nlvdyS98qJt26e2z5px3kuiQo4yRl4XirwyOg5A4qsOAIPJpVOLMID2Seny/NfO
 YnbW1Y7QyAW65eECwa/oAnJtczfXak1s4b1Bi3uM=
Received: by mx.zohomail.com with SMTPS id 1769022338505656.627659142558;
 Wed, 21 Jan 2026 11:05:38 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 1/2] rust: drm: add support for driver features
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DFUG2U4PVVTN.1DVPXGJK735F8@garyguo.net>
Date: Wed, 21 Jan 2026 16:05:22 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <FBB3C949-5568-4F26-95C8-8873F6DF1530@collabora.com>
References: <20260119-drm-render-v1-0-8326e4d5cb44@collabora.com>
 <20260119-drm-render-v1-1-8326e4d5cb44@collabora.com>
 <DFUG2U4PVVTN.1DVPXGJK735F8@garyguo.net>
To: Gary Guo <gary@garyguo.net>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,protonmail.com,umich.edu,collabora.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	APPLE_MAILER_COMMON(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9734F5BCD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Gary,

> On 21 Jan 2026, at 14:31, Gary Guo <gary@garyguo.net> wrote:
>=20
> On Mon Jan 19, 2026 at 11:34 PM GMT, Daniel Almeida wrote:
>> Add initial support for drm driver features via the DriverFeatures =
trait.
>> This trait is unsafe, requiring the implementer to comply with the =
safety
>> requirements of each feature individually if the feature is enabled.
>=20
> I think such unsafe requirement is quite vague and also very =
non-local.
>=20
> Maybe we can use a single trait (the `ModesetOps` that you described) =
to do
> this:
>=20
> Something like:
>=20
>    pub unsafe trait ModesetOps<D> { ... }
>=20
>    // Maybe the never type in the future...
>    pub enum NoFeature {}
>=20
>    impl<D> ModesetOps<D> for NoFeature {
>        fn foo(&self, ...) { unimplemented!() }
>    }
>=20
>    impl Driver {
>        /// Reference the modeset implementation (typically Self),
>        /// or `NoFeature` to indicate that the feature is not =
implemented.
>        type Modeset: ModesetOps<Self>;

Yeah, this looks better indeed. I assume we can have multiple features =
by
having multiple traits, right?

>    }
>=20
> When building, you can use `TypeId` to check if it's actually =
implemented, and
> set bits in the feature flags automatically.
>=20
> Best,
> Gary

I assume we would enable FeatureFoo if typeid(Foo) !=3D =
typeid(NoFeatureFoo)?

Where Foo is =E2=80=9Ctype Foo: FooOps=E2=80=9D in the Driver trait.


