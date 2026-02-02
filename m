Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHBTMovMgGl3AgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 17:10:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1116FCEB84
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 17:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4041810E2D1;
	Mon,  2 Feb 2026 16:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oKR4m0Bx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93FE10E2D1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770048644;
 bh=lgY3xynBWS6qvcthiKOlOb+Ph9aFwmFt+rqDpKZo9aU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oKR4m0BxCDsa35AvV87Kxi/T/JWn5q4Ecpk6cUo92FWRlCbwT4HqyHkBMhvEG8RKd
 mypR1b41lYkA4yWB2LMkRnEsdKOGY1FfcxlCciJJmkxsa3l3MGxULKYEj0l5NJYdvo
 xRejKT2rdZ35FS/eGhoB7hGmQieY+C/v7ghRk32W3+GW6NHMHW9dIl59zBcB4sbaW/
 ivFu04K66tIv6RSOCIb2D+jJdBNWrXId91JTE3sV3Os46pRZYO2uuxjL/JVNuce6aC
 v+pi6oit7ec+V5OD1u5kt1HZGhLti/0AC+BEWd7pxVjMQNdhRz3vepa+UDyXk+B05P
 P1tOI/Pxhz4qg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 205B217E1274;
 Mon,  2 Feb 2026 17:10:43 +0100 (CET)
Date: Mon, 2 Feb 2026 17:10:38 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Drew
 Fustini" <fustini@kernel.org>, "Guo Ren" <guoren@kernel.org>, "Fu Wei"
 <wefu@redhat.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <ukleinek@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
 <linux-pwm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Message-ID: <20260202171038.10e51e18@fedora>
In-Reply-To: <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
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
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:daniel.almeida@collabora.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:dakr@kernel.org,m:aliceryhl@google.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,linaro.org,google.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,rcpufreq_dt.rs:url,crates.io:url,cpufreq.rs:url]
X-Rspamd-Queue-Id: 1116FCEB84
X-Rspamd-Action: no action

On Mon, 19 Jan 2026 14:20:43 +0000
"Gary Guo" <gary@garyguo.net> wrote:

> On Wed Jan 7, 2026 at 3:09 PM GMT, Daniel Almeida wrote:
> > The current Clk abstraction can still be improved on the following issues:
> >
> > a) It only keeps track of a count to clk_get(), which means that users have
> > to manually call disable() and unprepare(), or a variation of those, like
> > disable_unprepare().
> >
> > b) It allows repeated calls to prepare() or enable(), but it keeps no track
> > of how often these were called, i.e., it's currently legal to write the
> > following:
> >
> > clk.prepare();
> > clk.prepare();
> > clk.enable();
> > clk.enable();
> >
> > And nothing gets undone on drop().
> >
> > c) It adds a OptionalClk type that is probably not needed. There is no
> > "struct optional_clk" in C and we should probably not add one.
> >
> > d) It does not let a user express the state of the clk through the
> > type system. For example, there is currently no way to encode that a Clk is
> > enabled via the type system alone.
> >
> > In light of the Regulator abstraction that was recently merged, switch this
> > abstraction to use the type-state pattern instead. It solves both a) and b)
> > by establishing a number of states and the valid ways to transition between
> > them. It also automatically undoes any call to clk_get(), clk_prepare() and
> > clk_enable() as applicable on drop(), so users do not have to do anything
> > special before Clk goes out of scope.
> >
> > It solves c) by removing the OptionalClk type, which is now simply encoded
> > as a Clk whose inner pointer is NULL.
> >
> > It solves d) by directly encoding the state of the Clk into the type, e.g.:
> > Clk<Enabled> is now known to be a Clk that is enabled.
> >
> > The INVARIANTS section for Clk is expanded to highlight the relationship
> > between the states and the respective reference counts that are owned by
> > each of them.
> >
> > The examples are expanded to highlight how a user can transition between
> > states, as well as highlight some of the shortcuts built into the API.
> >
> > The current implementation is also more flexible, in the sense that it
> > allows for more states to be added in the future. This lets us implement
> > different strategies for handling clocks, including one that mimics the
> > current API, allowing for multiple calls to prepare() and enable().
> >
> > The users (cpufreq.rs/ rcpufreq_dt.rs) were updated by this patch (and not
> > a separate one) to reflect the new changes. This is needed, because
> > otherwise this patch would break the build.
> >
> > Link: https://crates.io/crates/sealed [1]
> > Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> > ---
> >  drivers/cpufreq/rcpufreq_dt.rs |   2 +-
> >  drivers/gpu/drm/tyr/driver.rs  |  31 +---
> >  drivers/pwm/pwm_th1520.rs      |  17 +-
> >  rust/kernel/clk.rs             | 399 +++++++++++++++++++++++++++--------------
> >  rust/kernel/cpufreq.rs         |   8 +-
> >  5 files changed, 281 insertions(+), 176 deletions(-)
> >
> > diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
> > index 31e07f0279db..f1bd7d71ed54 100644
> > --- a/drivers/cpufreq/rcpufreq_dt.rs
> > +++ b/drivers/cpufreq/rcpufreq_dt.rs
> > @@ -41,7 +41,7 @@ struct CPUFreqDTDevice {
> >      freq_table: opp::FreqTable,
> >      _mask: CpumaskVar,
> >      _token: Option<opp::ConfigToken>,
> > -    _clk: Clk,
> > +    _clk: Clk<kernel::clk::Unprepared>,
> >  }
> >  
> >  #[derive(Default)]
> > diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> > index 09711fb7fe0b..5692def25621 100644
> > --- a/drivers/gpu/drm/tyr/driver.rs
> > +++ b/drivers/gpu/drm/tyr/driver.rs
> > @@ -2,7 +2,7 @@
> >  
> >  use kernel::c_str;
> >  use kernel::clk::Clk;
> > -use kernel::clk::OptionalClk;
> > +use kernel::clk::Enabled;
> >  use kernel::device::Bound;
> >  use kernel::device::Core;
> >  use kernel::device::Device;
> > @@ -37,7 +37,7 @@ pub(crate) struct TyrDriver {
> >      device: ARef<TyrDevice>,
> >  }
> >  
> > -#[pin_data(PinnedDrop)]
> > +#[pin_data]
> >  pub(crate) struct TyrData {
> >      pub(crate) pdev: ARef<platform::Device>,
> >  
> > @@ -92,13 +92,9 @@ fn probe(
> >          pdev: &platform::Device<Core>,
> >          _info: Option<&Self::IdInfo>,
> >      ) -> impl PinInit<Self, Error> {
> > -        let core_clk = Clk::get(pdev.as_ref(), Some(c_str!("core")))?;
> > -        let stacks_clk = OptionalClk::get(pdev.as_ref(), Some(c_str!("stacks")))?;
> > -        let coregroup_clk = OptionalClk::get(pdev.as_ref(), Some(c_str!("coregroup")))?;
> > -
> > -        core_clk.prepare_enable()?;
> > -        stacks_clk.prepare_enable()?;
> > -        coregroup_clk.prepare_enable()?;
> > +        let core_clk = Clk::<Enabled>::get(pdev.as_ref(), Some(c_str!("core")))?;  
> 
> Ah, more turbofish.. I'd really want to avoid them if possible.
> 
> Any disadvantage on just ask the user to chain `.get().prepare_enable()?`? This
> way it is also clear that some action is performed.

I've just disc

> 
> Alternatively, I think function names that mimick C API is also fine, e.g.
> `Clk::get_enabled`.
> 
> > +        let stacks_clk = Clk::<Enabled>::get_optional(pdev.as_ref(), Some(c_str!("stacks")))?;
> > +        let coregroup_clk = Clk::<Enabled>::get_optional(pdev.as_ref(), Some(c_str!("coregroup")))?;
> >  
> >          let mali_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("mali"))?;
> >          let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("sram"))?;
> > @@ -145,17 +141,6 @@ impl PinnedDrop for TyrDriver {
> >      fn drop(self: Pin<&mut Self>) {}
> >  }
> >  
> > -#[pinned_drop]
> > -impl PinnedDrop for TyrData {
> > -    fn drop(self: Pin<&mut Self>) {
> > -        // TODO: the type-state pattern for Clks will fix this.
> > -        let clks = self.clks.lock();
> > -        clks.core.disable_unprepare();
> > -        clks.stacks.disable_unprepare();
> > -        clks.coregroup.disable_unprepare();
> > -    }
> > -}
> > -
> >  // We need to retain the name "panthor" to achieve drop-in compatibility with
> >  // the C driver in the userspace stack.
> >  const INFO: drm::DriverInfo = drm::DriverInfo {
> > @@ -181,9 +166,9 @@ impl drm::Driver for TyrDriver {
> >  
> >  #[pin_data]
> >  struct Clocks {
> > -    core: Clk,
> > -    stacks: OptionalClk,
> > -    coregroup: OptionalClk,
> > +    core: Clk<Enabled>,
> > +    stacks: Clk<Enabled>,
> > +    coregroup: Clk<Enabled>,
> >  }
> >  
> >  #[pin_data]
> > diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> > index 043dc4dbc623..f4d03b988533 100644
> > --- a/drivers/pwm/pwm_th1520.rs
> > +++ b/drivers/pwm/pwm_th1520.rs
> > @@ -23,7 +23,7 @@
> >  use core::ops::Deref;
> >  use kernel::{
> >      c_str,
> > -    clk::Clk,
> > +    clk::{Clk, Enabled},
> >      device::{Bound, Core, Device},
> >      devres,
> >      io::mem::IoMem,
> > @@ -90,11 +90,11 @@ struct Th1520WfHw {
> >  }
> >  
> >  /// The driver's private data struct. It holds all necessary devres managed resources.
> > -#[pin_data(PinnedDrop)]
> > +#[pin_data]
> >  struct Th1520PwmDriverData {
> >      #[pin]
> >      iomem: devres::Devres<IoMem<TH1520_PWM_REG_SIZE>>,
> > -    clk: Clk,
> > +    clk: Clk<Enabled>,
> >  }
> >  
> >  impl pwm::PwmOps for Th1520PwmDriverData {
> > @@ -299,13 +299,6 @@ fn write_waveform(
> >      }
> >  }
> >  
> > -#[pinned_drop]
> > -impl PinnedDrop for Th1520PwmDriverData {
> > -    fn drop(self: Pin<&mut Self>) {
> > -        self.clk.disable_unprepare();
> > -    }
> > -}
> > -
> >  struct Th1520PwmPlatformDriver;
> >  
> >  kernel::of_device_table!(
> > @@ -326,9 +319,7 @@ fn probe(
> >          let dev = pdev.as_ref();
> >          let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
> >  
> > -        let clk = Clk::get(dev, None)?;
> > -
> > -        clk.prepare_enable()?;
> > +        let clk = Clk::<Enabled>::get(dev, None)?;
> >  
> >          // TODO: Get exclusive ownership of the clock to prevent rate changes.
> >          // The Rust equivalent of `clk_rate_exclusive_get()` is not yet available.
> > diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
> > index d192fbd97861..6323b40dc7ba 100644
> > --- a/rust/kernel/clk.rs
> > +++ b/rust/kernel/clk.rs
> > @@ -80,17 +80,78 @@ fn from(freq: Hertz) -> Self {
> >  mod common_clk {
> >      use super::Hertz;
> >      use crate::{
> > -        device::Device,
> > +        device::{Bound, Device},
> >          error::{from_err_ptr, to_result, Result},
> >          prelude::*,
> >      };
> >  
> > -    use core::{ops::Deref, ptr};
> > +    use core::{marker::PhantomData, mem::ManuallyDrop, ptr};
> > +
> > +    mod private {
> > +        pub trait Sealed {}
> > +
> > +        impl Sealed for super::Unprepared {}
> > +        impl Sealed for super::Prepared {}
> > +        impl Sealed for super::Enabled {}
> > +    }  
> 
> I guess it's time for me to work on a `#[sealed]` macro...
> 
> > +
> > +    /// A trait representing the different states that a [`Clk`] can be in.
> > +    pub trait ClkState: private::Sealed {
> > +        /// Whether the clock should be disabled when dropped.
> > +        const DISABLE_ON_DROP: bool;
> > +
> > +        /// Whether the clock should be unprepared when dropped.
> > +        const UNPREPARE_ON_DROP: bool;
> > +    }
> > +
> > +    /// A state where the [`Clk`] is not prepared and not enabled.  
> 
> Do we want to make it explicit that it's "not known to be prepared or
> enabled"?
> 
> > +    pub struct Unprepared;
> > +
> > +    /// A state where the [`Clk`] is prepared but not enabled.
> > +    pub struct Prepared;
> > +
> > +    /// A state where the [`Clk`] is both prepared and enabled.
> > +    pub struct Enabled;
> > +
> > +    impl ClkState for Unprepared {
> > +        const DISABLE_ON_DROP: bool = false;
> > +        const UNPREPARE_ON_DROP: bool = false;
> > +    }
> > +
> > +    impl ClkState for Prepared {
> > +        const DISABLE_ON_DROP: bool = false;
> > +        const UNPREPARE_ON_DROP: bool = true;
> > +    }
> > +
> > +    impl ClkState for Enabled {
> > +        const DISABLE_ON_DROP: bool = true;
> > +        const UNPREPARE_ON_DROP: bool = true;
> > +    }
> > +
> > +    /// An error that can occur when trying to convert a [`Clk`] between states.
> > +    pub struct Error<State: ClkState> {
> > +        /// The error that occurred.
> > +        pub error: kernel::error::Error,
> > +
> > +        /// The [`Clk`] that caused the error, so that the operation may be
> > +        /// retried.
> > +        pub clk: Clk<State>,
> > +    }  
> 
> I wonder if it makes sense to add a general `ErrorWith` type for errors that
> carries error code + data.
> 
> Best,
> Gary

