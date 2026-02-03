Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FgyNSf6gWk7NQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 14:37:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C01DD9F7F
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 14:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4230810E655;
	Tue,  3 Feb 2026 13:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="gqfrGukE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD2810E655
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 13:37:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770125858; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jyI4meaWQ7AMWPlr3ocZeP4a8Leb/wZOp6iLnXi41aC7iUIHpQuEGlDlwkLwa+f7H4TLTJisCBJT8Clo30XcZi5xvOAlCWZabHyL+2GXK8GUTG3qHYqcjUoH412VFP4nasbIC6Kiak7FB1NMfNpgh4KHyQcxxNOZSx4ADoGRBvs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770125858;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=cJJwZPpkNEwlLug5p0tuaBK7xgapljD5Xt4JXpkrlyw=; 
 b=MRa59Jwa7oNC5AYrn5rgeKyRz6HAyygP+X1pqE9EynAdArLENNm1NR9e1tzJDLNO0C8ksqvfvTbgeSWc+PnCPC1m7BccbXw7NUq/MPayX4XJWouUPdopkDonMkq1r5s8ZS4Z1Th/AVTqNqRU5hAQ7g4JfB+x1u3+My0hD0Ci/vw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770125858; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=cJJwZPpkNEwlLug5p0tuaBK7xgapljD5Xt4JXpkrlyw=;
 b=gqfrGukEUbepacr6QOMH1Ji7Ud533J90A6PfT/bryn8vRrSuE+XWziJoQwD5x0SU
 ThakrPXNSrs/P4CkGg9JH5P4MyVAK7qNv2ESK8H9PHp8yhOgXJiyjuyTerOjgPYnxN3
 YEjh6zBSDKCrzpLDwMuk0dpA9fMfPm7FItPtVY3Y=
Received: by mx.zohomail.com with SMTPS id 1770125856001677.2359332250752;
 Tue, 3 Feb 2026 05:37:36 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260203100913.6d224657@fedora>
Date: Tue, 3 Feb 2026 10:37:15 -0300
Cc: Gary Guo <gary@garyguo.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E786E2B1-E233-45D3-923D-A2DBA54BB166@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net> <20260202171038.10e51e18@fedora>
 <20260203100913.6d224657@fedora>
To: Boris Brezillon <boris.brezillon@collabora.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:dakr@kernel.org,m:aliceryhl@google.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:boris.brezillon@collabora.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,linaro.org,google.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	APPLE_MAILER_COMMON(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 3C01DD9F7F
X-Rspamd-Action: no action



> On 3 Feb 2026, at 06:09, Boris Brezillon =
<boris.brezillon@collabora.com> wrote:
>=20
> Hello Daniel,
>=20
> On Mon, 2 Feb 2026 17:10:38 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>=20
>>>> -#[pin_data(PinnedDrop)]
>>>> +#[pin_data]
>>>> pub(crate) struct TyrData {
>>>>     pub(crate) pdev: ARef<platform::Device>,
>>>>=20
>>>> @@ -92,13 +92,9 @@ fn probe(
>>>>         pdev: &platform::Device<Core>,
>>>>         _info: Option<&Self::IdInfo>,
>>>>     ) -> impl PinInit<Self, Error> {
>>>> -        let core_clk =3D Clk::get(pdev.as_ref(), =
Some(c_str!("core")))?;
>>>> -        let stacks_clk =3D OptionalClk::get(pdev.as_ref(), =
Some(c_str!("stacks")))?;
>>>> -        let coregroup_clk =3D OptionalClk::get(pdev.as_ref(), =
Some(c_str!("coregroup")))?;
>>>> -
>>>> -        core_clk.prepare_enable()?;
>>>> -        stacks_clk.prepare_enable()?;
>>>> -        coregroup_clk.prepare_enable()?;
>>>> +        let core_clk =3D Clk::<Enabled>::get(pdev.as_ref(), =
Some(c_str!("core")))?;   =20
>>>=20
>>> Ah, more turbofish.. I'd really want to avoid them if possible.
>>>=20
>>> Any disadvantage on just ask the user to chain =
`.get().prepare_enable()?`? This
>>> way it is also clear that some action is performed. =20
>>=20
>> I've just disc
>=20
> Sorry, I've hit the reply button before I had finished writing my
> answer. So I was about to say that I had started writing something
> similar without knowing this series existed, and I feel like we'd =
don't
> really need those prepare_enable() shortcuts that exist in C. We might
> has well just go:
>=20
> Clk::get(dev, Some(c_str!("core"))).prepare()?.enable()?;
>=20
> and have the following variant-specofoc functions
>=20
> - Clk<Unprepared>::get[_optional]() (no get on Prepared and Enabled
>  variants)
> - Clk<Unprepared>::prepare()
> - Clk<Prepared>::{enable,unprepare}()
> - Clk<Enabled>::{disable}()
>=20
> Regards,
>=20
> Boris
>=20
>=20


I don=E2=80=99t understand how is this better than the turbofish we =
currently have.

In other words, how is this:

Clk::get(dev, Some(c_str!("core"))).prepare()?.enable()?;

Better than this:

Clk::<Enabled>::get(/*=E2=80=A6*/);

=E2=80=94 Daniel


