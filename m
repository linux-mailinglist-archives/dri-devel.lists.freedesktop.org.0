Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C3D95DC00
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 07:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D3610E19B;
	Sat, 24 Aug 2024 05:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1oi78JfT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BA310E0FD;
 Sat, 24 Aug 2024 05:51:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4ABE360C5E;
 Sat, 24 Aug 2024 05:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B92EC32781;
 Sat, 24 Aug 2024 05:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1724478691;
 bh=kisJaeF07B2iNDo4UN5LUpiQ8jfnmvdcW7qK5PAWhAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1oi78JfTt43Ynvw9yzOMZgpFOjEYrk7CZBHNV7YAvIjd5IMgFsikvJousUTS5g1QP
 PNdVTPoR+oe1WlwHVcK2n9RXsSJklWIrqW1a4gn1YRFmG/bZbue4aA2XeqbsYMBY69
 4h6VnKLMnqwgWWdhS0o/fYjczuB6kDYIE4x8+u2w=
Date: Sat, 24 Aug 2024 07:51:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 William Hubbs <w.d.hubbs@gmail.com>,
 Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Jiri Slaby <jirislaby@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "speakup@linux-speakup.org" <speakup@linux-speakup.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 Finn Behrens <me@kloenk.dev>,
 "Daniel Gomez (Samsung)" <d+samsung@kruces.com>,
 "gost.dev@samsung.com" <gost.dev@samsung.com>,
 Nick Desaulniers <nick.desaulniers@gmail.com>
Subject: Re: [PATCH 00/12] Enable build system on macOS hosts
Message-ID: <2024082413-florist-perpetual-526b@gregkh>
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <CGME20240807110114eucas1p2e1ca4cbd352c6cd9d60688b1570df8d4@eucas1p2.samsung.com>
 <2024080753-debug-roulette-8cb1@gregkh>
 <3jnp6tnkjpvnisefomxagazu2u3uzzt7rcon3r5jssraxzwegb@gsxc7c5sfh7v>
 <2024080758-dedicator-smoky-44be@gregkh>
 <20240823223736.mosqrdcwqanvdpmd@AALNPWDAGOMEZ1.aal.scsc.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823223736.mosqrdcwqanvdpmd@AALNPWDAGOMEZ1.aal.scsc.local>
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

On Sat, Aug 24, 2024 at 12:37:36AM +0200, Daniel Gomez wrote:
> On Wed, Aug 07, 2024 at 04:19:42PM +0200, Greg Kroah-Hartman wrote:
> > On Wed, Aug 07, 2024 at 01:56:38PM +0000, Daniel Gomez wrote:
> > > On Wed, Aug 07, 2024 at 01:01:08PM GMT, Greg Kroah-Hartman wrote:
> > > > On Wed, Aug 07, 2024 at 01:09:14AM +0200, Daniel Gomez via B4 Relay wrote:
> > > > > This patch set allows for building the Linux kernel for arm64 in macOS with
> > > > > LLVM.
> > > > 
> > > > Is this a requirement somewhere that this must work?  It seems like an
> > > > odd request, what workflows require cross-operating-system builds like
> > > > this?
> > > 
> > > This isn't a requirement, but it would, for example, support workflows for QEMU
> > > users and developers on macOS. They could build/compile the kernel natively and
> > > use it to launch QEMU instances, simplifying their process.
> > 
> > But that's not a real workload of anyone?  How often does this ever come
> > up?  Who is going to maintain this cross-build functionality over time?
> 
> The delta is becoming very small thanks to the latest patches from Masahiro.
> Earlier this week (next-20240820) [1] I rebased the work with all the feedback
> and the patch series has been reduced to 7.
> 
> For the maintenance part, I suggest keeping a CI to build and boot the lastest
> linux-next tag available. I can set this up here [2] and take the responsability
> for maintaining that. But I would be convenient to add documentation for it in
> the LLVM section and mark this as 'experimental'. If that's okay, I will prepare
> a v2 with this.

Let's see what v2 looks like and go from there.

thanks,

greg k-h
