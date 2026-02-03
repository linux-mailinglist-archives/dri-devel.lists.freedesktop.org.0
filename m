Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCUrFDK9gWm7JAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 10:17:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65A3D6B0D
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 10:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB2A10E310;
	Tue,  3 Feb 2026 09:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qBkufrCK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B05710E310
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 09:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770110251;
 bh=cBIbAwNwla2fC+OQSZLKWgNR2kKKKXuZC77zlvR3EkM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qBkufrCKICBVVk2qxfskAIumkZvmYERz3287sjciVw50ZM7OZNaCeoQgNByPBgEWQ
 GPuDXaUio33B4VhBjag5+qwRowqURR2SfhON9vrW2EcVZ6QvnUHfhDdvxo76Q5/wwd
 9CjVDPtUD6r0fRtS60BpF5/ewMWz+W26A+zgEiPgxA65NpPJsGglTH0u5VORZZUbW5
 z25Rjz1T+g29QzBzyVvpiwPt/h+wgS8uxMSeVeKJV4lAC4IYESOsFQs/r/egAyKW4J
 UqK290TR/aYsygxbF1Ddrj0WPYdarara+5cNtkkm3obb/B2wdENmYbWqaQtF8Sx+vt
 xhTjl6tTJlmVw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9019B17E0927;
 Tue,  3 Feb 2026 10:17:30 +0100 (CET)
Date: Tue, 3 Feb 2026 10:17:26 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Uwe =?UTF-8?B?S2xlaW5lLUs=?=
 =?UTF-8?B?w7ZuaWc=?= <ukleinek@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Message-ID: <20260203101726.2cec1050@fedora>
In-Reply-To: <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:dakr@kernel.org,m:aliceryhl@google.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,google.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B65A3D6B0D
X-Rspamd-Action: no action

Hello Daniel,

On Wed, 07 Jan 2026 12:09:52 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> -        /// Disable and unprepare the clock.
> +    impl Clk<Enabled> {
> +        /// Gets [`Clk`] corresponding to a bound [`Device`] and a connection id
> +        /// and then prepares and enables it.
>          ///
> -        /// Equivalent to calling [`Clk::disable`] followed by [`Clk::unprepare`].
> +        /// Equivalent to calling [`Clk::get`], followed by [`Clk::prepare`],
> +        /// followed by [`Clk::enable`].
>          #[inline]
> -        pub fn disable_unprepare(&self) {
> -            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
> -            // [`clk_disable_unprepare`].
> -            unsafe { bindings::clk_disable_unprepare(self.as_raw()) };
> +        pub fn get(dev: &Device<Bound>, name: Option<&CStr>) -> Result<Clk<Enabled>> {
> +            Clk::<Prepared>::get(dev, name)?
> +                .enable()
> +                .map_err(|error| error.error)
> +        }
> +
> +        /// Behaves the same as [`Self::get`], except when there is no clock
> +        /// producer. In this case, instead of returning [`ENOENT`], it returns
> +        /// a dummy [`Clk`].
> +        #[inline]
> +        pub fn get_optional(dev: &Device<Bound>, name: Option<&CStr>) -> Result<Clk<Enabled>> {
> +            Clk::<Prepared>::get_optional(dev, name)?
> +                .enable()
> +                .map_err(|error| error.error)
> +        }
> +
> +        /// Attempts to disable the [`Clk`] and convert it to the [`Prepared`]
> +        /// state.
> +        #[inline]
> +        pub fn disable(self) -> Result<Clk<Prepared>, Error<Enabled>> {
> +            // We will be transferring the ownership of our `clk_get()` and
> +            // `clk_enable()` counts to `Clk<Prepared>`.
> +            let clk = ManuallyDrop::new(self);
> +
> +            // SAFETY: By the type invariants, `self.0` is a valid argument for
> +            // [`clk_disable`].
> +            unsafe { bindings::clk_disable(clk.as_raw()) };
> +
> +            Ok(Clk {
> +                inner: clk.inner,
> +                _phantom: PhantomData,
> +            })
>          }
>  
>          /// Get clock's rate.

Dunno if this has been mentioned already, but I belive the rate
getter/setter should be in the generic implementation. Indeed, it's
quite common for clock users to change the rate when the clk is
disabled to avoid unstable transitional state. The usual pattern for
that is:

	- clk_set_parent(my_clk, secondary_parent)
	- clk_disable[_unprepare](primary_parent) // (usually a PLL)
	- clk_set_rate(primary_parent)
	- clk[_prepare]_enable(primary_parent)
	- clk_set_parent(my_clk, primary_parent)

The case where the clk rate is changed while the clk is active is also
valid (usually fine when it's just a divider that's changed, because
there's no stabilization period).

> @@ -252,83 +429,31 @@ pub fn set_rate(&self, rate: Hertz) -> Result {
>          }
>      }
