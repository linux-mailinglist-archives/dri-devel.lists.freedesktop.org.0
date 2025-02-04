Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7469AA27A78
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 19:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB3D10E6E4;
	Tue,  4 Feb 2025 18:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q9QYtU32";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB69710E385;
 Tue,  4 Feb 2025 18:46:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1069AA42C09;
 Tue,  4 Feb 2025 18:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578BCC4CEDF;
 Tue,  4 Feb 2025 18:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738694791;
 bh=pL6LpTgYSVbLGUfW4heiYQ/ikhNIMZk1WKQPE8VKxIo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q9QYtU32h4vgHedQJzby3d3GuU3j3r0Cv7pzZSWUuxzrWMBIt6FxSZZ7HlNH7kqrh
 ZNC2GaMGW42gyg9O+126vptKPHrEGrZ29jOdwTiN3MAC7JycGkoahhO4I08aX9N8Pd
 RT2WC0YNVPaD2cAC0IGrzUx/cZsAXvYc0lpLpXBHejrxZbMn+lluASYxLdXk1vVof9
 WXPw+tQbV1d8CjzYlrLwCboaU4+BfBd16pDXu1mQR9hWWna5sPXlx6edK7+Q5Oueaq
 JjU7p5Dcy9hvAHH0dBiVpy4PpCAQ5TagnFLJjOIgsalUy4f/obD0inAshERi55V5Nj
 BF332P2DzbSIA==
Date: Tue, 4 Feb 2025 19:46:23 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Joel Fernandes <joel@joelfernandes.org>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, joelagnelf@nvidia.com
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
Message-ID: <Z6Jgf-cVt_AlM6Qd@cassiopeiae>
References: <20250131220432.17717-1-dakr@kernel.org>
 <20250203202410.GA3936980@joelbox2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203202410.GA3936980@joelbox2>
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

On Mon, Feb 03, 2025 at 03:24:10PM -0500, Joel Fernandes wrote:
> Hi Danilo,
> 
> On Fri, Jan 31, 2025 at 11:04:24PM +0100, Danilo Krummrich wrote:
> > +#[pin_data]
> > +pub(crate) struct NovaCore {
> > +    #[pin]
> > +    pub(crate) gpu: Gpu,
> > +}
> 
> I am curious what is the need for pinning here in the patch in its current
> form, is it for future-proofing?

Yes, it is.

It's not always needed, but since I know that further down the road we'll need
at least a few mutexes, it seemed reasonable to already consider it.

> 
> I looked through the sample PCI driver example you had posted and did not see
> pinning there [1]. Thanks for the clarification.
> [1] https://lore.kernel.org/all/20241219170425.12036-12-dakr@kernel.org/
