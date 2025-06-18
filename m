Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F47BADF395
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 19:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D441410E204;
	Wed, 18 Jun 2025 17:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h6oWJFp0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D82810E013;
 Wed, 18 Jun 2025 17:17:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 21014629CE;
 Wed, 18 Jun 2025 17:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D50CC4CEF0;
 Wed, 18 Jun 2025 17:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750267040;
 bh=7N2qedqfmm2wSBE+X0xRUvrNeOitpNABVy0dpLK4z5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h6oWJFp0fiMQrE1E5+fibmlM2jCeT2KZxH+a6iMOr+JJAnOUGSKQSP7kXS0H5H3Nu
 mBWOsyUE42uLIwTS3uWFi7MN0WpZIXNkIUDuAY3zPSiC7r2FozFALhUw2UsKsDYpYv
 O0WAXLDXJcCCFawSHxSIv5dZANuNpR96I/TUSYOWQAS6Jt8BzTXhQeW8EzHc+uptwS
 /77M5B6EBvyXZz447YneeE6jj58S+lPZGrJ8qdDaa3DdueRpK4NX3pXlZfEby1mrYj
 F+dLHAHgoYV/buxAedHuY+/YFLMyWlRT6SiemUYklWEZFk/R0ixstw2GZuorkoV0X7
 npiOADLxMx9kQ==
Date: Wed, 18 Jun 2025 07:17:19 -1000
From: Tejun Heo <tj@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, David Gow <davidgow@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Rae Moar <rmoar@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Benno Lossin <lossin@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Breno Leitao <leitao@debian.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org,
 linux-block@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-mm@kvack.org, linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v12 1/6] rust: enable `clippy::ptr_as_ptr` lint
Message-ID: <aFL0n0KxQUbxjWdT@slm.duckdns.org>
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-1-f43b024581e8@gmail.com>
 <CAJ-ks9=6RSaLmNmDBv-TzJfGF8WzEi9Vd-s=1wyqBcF7_f7qQQ@mail.gmail.com>
 <CANiq72kgnKH2SSp76EdPeysExBWasqhTyf1JyReR65g6FMsidA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kgnKH2SSp76EdPeysExBWasqhTyf1JyReR65g6FMsidA@mail.gmail.com>
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

On Wed, Jun 18, 2025 at 06:45:56PM +0200, Miguel Ojeda wrote:
> On Wed, Jun 18, 2025 at 3:54 PM Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > @Andreas Hindborg could you please have a look for configfs?
> >
> > @Rafael J. Wysocki @Viresh Kumar could you please have a look for cpufreq?
> 
> Thanks Tamir.
> 
> Christian, Danilo, David, Greg, Tejun: It would also be nice to get
> Acked-by's for your bits. Thanks!

For wq part:

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
