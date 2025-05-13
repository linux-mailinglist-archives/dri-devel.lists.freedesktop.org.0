Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2889CAB4E27
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 10:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B74D10E338;
	Tue, 13 May 2025 08:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UHeQbiTn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317B310E338;
 Tue, 13 May 2025 08:32:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 908E75C66A1;
 Tue, 13 May 2025 08:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7ED0C4CEE4;
 Tue, 13 May 2025 08:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747125157;
 bh=q70TIRrGdpp6yg967Z9NaG3C82XUVJAKivW+wfIO/tM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UHeQbiTn5XtYLW7+AfbL65SS3DvgOAZP2K+mt25BR8fhFkeRHeTTgjYJffT4uH6MD
 b77UFscjVwRx6Us3pQDmBq7Qlm7hmUzpyno/WePUR5mYocp+jiIy1yP822oACfAtLu
 eCx62UP6S4ZREJAEQ7HiCyZlntpUW/XMgRyni3i5wdrSUWNVntt+xDdzT2o1L6daS7
 gauhQEePN4NFpabmrfMTUgA604cCtWtWOunaees9Vjj+r2UpJO+mqfARF6Ns1U3d7N
 kL+2BBL7BNr2K3gOHn7g+X3PGFF+H4q7l33pTTUohTO9YOgw/Sz0Zm513FmUv68Om8
 b1uHeAuC4Czuw==
Date: Tue, 13 May 2025 10:32:29 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, akpm@linux-foundation.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 gregkh@linuxfoundation.org, rafael@kernel.org, bhelgaas@google.com,
 kwilczynski@kernel.org, raag.jadav@intel.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, me@kloenk.dev,
 fujita.tomonori@gmail.com, daniel.almeida@collabora.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH 00/11] rust: add support for Port io
Message-ID: <aCMDnQCcAOt28ONM@pollux>
References: <20250509031524.2604087-1-andrewjballance@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509031524.2604087-1-andrewjballance@gmail.com>
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

Hi Andrew,

On Thu, May 08, 2025 at 10:15:13PM -0500, Andrew Ballance wrote:
> currently the rust `Io` type maps to the c read{b, w, l, q}/write{b, w, l, q}
> functions and have no support for port io.this is a problem for pci::Bar
> because the pointer returned by pci_iomap is expected to accessed with
> the ioread/iowrite api [0].
> 
> this patch series splits the `Io` type into `Io`, `PortIo` and `MMIo`.and,
> updates pci::Bar, as suggested in the zulip[1], so that it is generic over
> Io and, a user can optionally give a compile time hint about the type of io. 
> 
> Link: https://docs.kernel.org/6.11/driver-api/pci/pci.html#c.pci_iomap [0]
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/.60IoRaw.60.20and.20.60usize.60/near/514788730 [1]
> 
> Andrew Ballance (6):
>   rust: io: add new Io type
>   rust: io: add from_raw_cookie functions
>   rust: pci: make Bar generic over Io
>   samples: rust: rust_driver_pci: update to use new bar and io api
>   gpu: nova-core: update to use the new bar and io api
>   rust: devres: fix doctest
> 
> Fiona Behrens (5):
>   rust: helpers: io: use macro to generate io accessor functions
>   rust: io: Replace Io with MMIo using IoAccess trait
>   rust: io: implement Debug for IoRaw and add some doctests
>   rust: io: add PortIo
>   io: move PIO_OFFSET to linux/io.h

Thanks for sending out the patch series.

I gave it a quick shot and the series breaks the build starting with patch 2. I
see that you have fixup commits later in the series, however in the kernel we
don't allow patches to intermediately introduce build failures, build warnings,
bugs, etc., see also [1]. You should still try to break things down logically as
good as possible.

From the current structure of your patches it seems to me that structure-wise
you should be good by going through them one by one and fix them up; your later
patches should become "noops" then. But feel free to re-organize things if you
feel that's not the best approach.

Can you please fix this up and resend right away? This should make the
subsequent review much easier.

[1] https://docs.kernel.org/process/submitting-patches.html#separate-your-changes
