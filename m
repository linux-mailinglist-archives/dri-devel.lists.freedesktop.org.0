Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A2AA4E0EE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6614B10E5F6;
	Tue,  4 Mar 2025 14:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f54Samq2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BFC10E5F4;
 Tue,  4 Mar 2025 14:30:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 73C4DA4561D;
 Tue,  4 Mar 2025 14:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C9DC4CEE5;
 Tue,  4 Mar 2025 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741098657;
 bh=+bcl3HGDoc9IqaZsMJSKegqvSclSq4gfCFg0kcJllNc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f54Samq2ENCyCzuTHGR/tYVZKiwx076XuyVyuDVLnKmBwmBZLrrFDqh/SJuc8H2A8
 QK/pOjMHQD2Zr1heHM8PR9WQZ9EqTc3k0MqkEQip4O0NsOspaS2Tn9LQvf1skBxKrN
 xLtT3Cn2+850TS7nTuTHGzQSRtU3CAqvIeCuNRcYiVNQbYsRIrOGi8IztoA9X0FxeJ
 JyWCMgeVgiQshwxCL02k7yH3iIhj9wr24Epn30wWdi02sU++HLb0uy1n5bZG+ArkTW
 a5Pkoyizp8l35EIyOFSmuLNWE16gROFxnX4oLq1YO0hUmND3VXceKOodcfD3Nkrk1R
 oRkGgycHf/kDQ==
Date: Tue, 4 Mar 2025 15:30:48 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 mcgrof@kernel.org, russ.weight@linux.dev,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v4 5/6] gpu: nova-core: add initial driver stub
Message-ID: <Z8cOmISkQNcFdcvm@cassiopeiae>
References: <20250226175552.29381-1-dakr@kernel.org>
 <20250226175552.29381-6-dakr@kernel.org>
 <D87JQ69QA6F0.184YR2BTJB0IT@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D87JQ69QA6F0.184YR2BTJB0IT@nvidia.com>
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

On Tue, Mar 04, 2025 at 11:19:49PM +0900, Alexandre Courbot wrote:
> On Thu Feb 27, 2025 at 2:55 AM JST, Danilo Krummrich wrote:
> 
> > +// TODO replace with something like derive(FromPrimitive)
> > +impl TryFrom<u32> for Chipset {
> > +    type Error = kernel::error::Error;
> > +
> > +    fn try_from(value: u32) -> Result<Self, Self::Error> {
> > +        match value {
> > +            0x162 => Ok(Chipset::TU102),
> > +            0x164 => Ok(Chipset::TU104),
> > +            0x166 => Ok(Chipset::TU106),
> > +            0x167 => Ok(Chipset::TU117),
> > +            0x168 => Ok(Chipset::TU116),
> > +            0x172 => Ok(Chipset::GA102),
> > +            0x173 => Ok(Chipset::GA103),
> > +            0x174 => Ok(Chipset::GA104),
> > +            0x176 => Ok(Chipset::GA106),
> > +            0x177 => Ok(Chipset::GA107),
> > +            0x192 => Ok(Chipset::AD102),
> > +            0x193 => Ok(Chipset::AD103),
> > +            0x194 => Ok(Chipset::AD104),
> > +            0x196 => Ok(Chipset::AD106),
> > +            0x197 => Ok(Chipset::AD107),
> > +            _ => Err(ENODEV),
> > +        }
> > +    }
> > +}
> 
> I know this is probably temporary anyway, but since there is a macro now you can simplify this implementation by making part of it:
> 
> 		impl TryFrom<u32> for Chipset {
> 				type Error = kernel::error::Error;
> 
> 				fn try_from(value: u32) -> Result<Self, Self::Error> {
> 						match value {
> 								$( $value => Ok(Chipset::$variant), )*
> 								_ => Err(ENODEV),
> 						}
> 				}
> 		}
> 

Sure, that's a good suggestion, will do.

With that changed, may I add your RB? I'd like to land this series in the next
merge window.
