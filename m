Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610A8ACDBEB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 12:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63BE10E24F;
	Wed,  4 Jun 2025 10:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uSV2UJw/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B17110E238;
 Wed,  4 Jun 2025 10:24:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 32FFB5C0658;
 Wed,  4 Jun 2025 10:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6737C4CEE7;
 Wed,  4 Jun 2025 10:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749032650;
 bh=CkA7t5JHKnLC81OTeJgx+nWLwzFbh3oMj2svLeegIBI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uSV2UJw/i73iytoNxBk5Iq4aWiF3a/acB6XUW19B7KG1PXEN5f6k5B2Ze3TM0qCDo
 4VDjEqfa30L+LZx9eKuMQ7l1S61c9UDyfF6+jDaATvRlem3OHYhVNwWfFKOpGO1rYk
 T/ddZxpTCRY2C1NI5YwvkfVom5CPEBCjXNMoRqcTHtTs9zfgMQ9LQug8BJ7mNF9pm8
 mWUsU24tydD9GKZb4+5cD4y208fFnLyOnqObAK3XPzSgMB3Mm1boem0vcxnZONCRc7
 43nKuL9JjINnDmWe2KF79z1QsNZXYLy6SV2qdxPxWloUtUPwvACeDhsQYxmjnDEzqm
 e6jHQ/4+4wcuQ==
Date: Wed, 4 Jun 2025 12:24:03 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 17/20] gpu: nova-core: compute layout of the FRTS region
Message-ID: <aEAew5aBnfSqXFdT@cassiopeiae>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-17-05dfd4f39479@nvidia.com>
 <632966ba8231e8f3c20350b217b225301280cdd3.camel@redhat.com>
 <DADGJZGG5PXE.170H96D26HIN6@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DADGJZGG5PXE.170H96D26HIN6@nvidia.com>
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

On Wed, Jun 04, 2025 at 01:18:37PM +0900, Alexandre Courbot wrote:
> On Wed Jun 4, 2025 at 6:14 AM JST, Lyude Paul wrote:
> > On Wed, 2025-05-21 at 15:45 +0900, Alexandre Courbot wrote:
> >> +                const NV_PRAMIN_SIZE: u64 = 0x100000;
> >
> > Don't leave those size constants out, they're getting lonely :C
> 
> Not quite sure where I should put these; they are not used (for now)
> anywhere else, so the relevant scope is not obvious to me. Any
> suggestion?

I assume Lyude means that you should use SZ_1M here. :)
