Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHbtEbX5gWk7NQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 14:35:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D179FD9F04
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 14:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194D710E669;
	Tue,  3 Feb 2026 13:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="D29dbryw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113A110E655
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 13:35:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770125742; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NRtDZYrDtG+Qo6TQ6bHGL1iKjJNQwFHS9aGPrnY2taQmU2ygNnd43sIP/YND9vKwNWfnA5+kzEt1epU4CbWKzRHWlplgfv4AvnOEbxMdVKv0Iad7w4eoOhNKqpWV6TBEoK0Awftzly6wqWHLuhXCixuXKha7blt9SgpXPtDKcvg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770125742;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=HP8JuP4ZZCylaDagLho2pSOiJ0oq/o6LUgghhG4awbc=; 
 b=UL60gkPGuWwziImQ3DXJd1OyZy4CIH77KYNToI8bnqCQODB7z5bZGNAB+HDk76HzwMHi2sY/ULGT+Sbdtonp+aQBBxkBR+oi1mCsMjKQaczQv9stKMmIsmN9z4EYiA1gbkRHUjNfKcYw+vqIoYkNTawKqsM1/yfeHaMEmmf/aMM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770125742; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=HP8JuP4ZZCylaDagLho2pSOiJ0oq/o6LUgghhG4awbc=;
 b=D29dbrywcjyDlJoFsJig9167NPWoCvvR8G3w5TDJ1TyWO4fARp+KWxE2r+SPluVH
 5wsZLXfE+MX0EI1KRM6A/4ZsSj6hSP0hkYMPyTH6/3HW+Vc++fxUt922D075Lj4WL6x
 NtzpfqxhwHMSw86kdTTTffq5ikFKRb5ZUtV6AjDM=
Received: by mx.zohomail.com with SMTPS id 1770125741199133.148611143052;
 Tue, 3 Feb 2026 05:35:41 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260203101726.2cec1050@fedora>
Date: Tue, 3 Feb 2026 10:35:22 -0300
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
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
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <399B3E13-1ED1-49C2-B5E6-6B6FAA8019D5@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260203101726.2cec1050@fedora>
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
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:dakr@kernel.org,m:aliceryhl@google.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:boris.brezillon@collabora.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,google.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
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
X-Rspamd-Queue-Id: D179FD9F04
X-Rspamd-Action: no action

Hi Boris,

> On 3 Feb 2026, at 06:17, Boris Brezillon =
<boris.brezillon@collabora.com> wrote:
>=20
> Hello Daniel,
>=20
> On Wed, 07 Jan 2026 12:09:52 -0300
> Daniel Almeida <daniel.almeida@collabora.com> wrote:
>=20
>> -        /// Disable and unprepare the clock.
>> +    impl Clk<Enabled> {
>> +        /// Gets [`Clk`] corresponding to a bound [`Device`] and a =
connection id
>> +        /// and then prepares and enables it.
>>         ///
>> -        /// Equivalent to calling [`Clk::disable`] followed by =
[`Clk::unprepare`].
>> +        /// Equivalent to calling [`Clk::get`], followed by =
[`Clk::prepare`],
>> +        /// followed by [`Clk::enable`].
>>         #[inline]
>> -        pub fn disable_unprepare(&self) {
>> -            // SAFETY: By the type invariants, self.as_raw() is a =
valid argument for
>> -            // [`clk_disable_unprepare`].
>> -            unsafe { bindings::clk_disable_unprepare(self.as_raw()) =
};
>> +        pub fn get(dev: &Device<Bound>, name: Option<&CStr>) -> =
Result<Clk<Enabled>> {
>> +            Clk::<Prepared>::get(dev, name)?
>> +                .enable()
>> +                .map_err(|error| error.error)
>> +        }
>> +
>> +        /// Behaves the same as [`Self::get`], except when there is =
no clock
>> +        /// producer. In this case, instead of returning [`ENOENT`], =
it returns
>> +        /// a dummy [`Clk`].
>> +        #[inline]
>> +        pub fn get_optional(dev: &Device<Bound>, name: =
Option<&CStr>) -> Result<Clk<Enabled>> {
>> +            Clk::<Prepared>::get_optional(dev, name)?
>> +                .enable()
>> +                .map_err(|error| error.error)
>> +        }
>> +
>> +        /// Attempts to disable the [`Clk`] and convert it to the =
[`Prepared`]
>> +        /// state.
>> +        #[inline]
>> +        pub fn disable(self) -> Result<Clk<Prepared>, =
Error<Enabled>> {
>> +            // We will be transferring the ownership of our =
`clk_get()` and
>> +            // `clk_enable()` counts to `Clk<Prepared>`.
>> +            let clk =3D ManuallyDrop::new(self);
>> +
>> +            // SAFETY: By the type invariants, `self.0` is a valid =
argument for
>> +            // [`clk_disable`].
>> +            unsafe { bindings::clk_disable(clk.as_raw()) };
>> +
>> +            Ok(Clk {
>> +                inner: clk.inner,
>> +                _phantom: PhantomData,
>> +            })
>>         }
>>=20
>>         /// Get clock's rate.
>=20
> Dunno if this has been mentioned already, but I belive the rate
> getter/setter should be in the generic implementation. Indeed, it's
> quite common for clock users to change the rate when the clk is
> disabled to avoid unstable transitional state. The usual pattern for
> that is:
>=20
> - clk_set_parent(my_clk, secondary_parent)
> - clk_disable[_unprepare](primary_parent) // (usually a PLL)
> - clk_set_rate(primary_parent)
> - clk[_prepare]_enable(primary_parent)
> - clk_set_parent(my_clk, primary_parent)
>=20
> The case where the clk rate is changed while the clk is active is also
> valid (usually fine when it's just a divider that's changed, because
> there's no stabilization period).
>=20
>> @@ -252,83 +429,31 @@ pub fn set_rate(&self, rate: Hertz) -> Result {
>>         }
>>     }
>=20


I=E2=80=99m ok with this. I just assumed that these operations were only =
valid on enabled clks.

Will change this in the next version.

=E2=80=94 Daniel=
