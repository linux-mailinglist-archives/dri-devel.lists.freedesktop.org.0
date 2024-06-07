Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48D890095B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 17:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A0B10ECBF;
	Fri,  7 Jun 2024 15:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YhS3AEpZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDEF10ECB7;
 Fri,  7 Jun 2024 15:41:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5C00DCE1D8C;
 Fri,  7 Jun 2024 15:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0EAC2BBFC;
 Fri,  7 Jun 2024 15:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1717774871;
 bh=lSNsjez0w/wb93cv+wK7nT1BdHR+WTVkmUkwEyzKfaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YhS3AEpZKmcu3LvZLyghdcTPel8ph7bgdT4+bxZzju17gn5m30zNgh9myK2fo9ynk
 zhzMgkOSKFYlbjE18+VJOs3Ik8jB+in2WgrvelGGAXeOYCW0/3jYORj8jkK0Gu+9HK
 D+eYOvaIar+r2TBCvJYA1ECKsiLJnFLhpuL9UBE8=
Date: Fri, 7 Jun 2024 17:41:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, wedsonaf@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <2024060745-palatable-dragging-32d1@gregkh>
References: <Zlgg_Q5y3Q99Ts1s@pollux>
 <20240531.165032.1895479176481879387.fujita.tomonori@gmail.com>
 <Zlmfkws-QjNmFxfr@pollux>
 <20240607.211132.1411950625632247437.fujita.tomonori@gmail.com>
 <2024060708-residue-hardy-af36@gregkh>
 <ZmMMMyi3uXTFtIae@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmMMMyi3uXTFtIae@cassiopeiae>
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

On Fri, Jun 07, 2024 at 03:33:39PM +0200, Danilo Krummrich wrote:
> On Fri, Jun 07, 2024 at 02:36:50PM +0200, Greg KH wrote:
> > Anyway, that's all hand-wavy right now, sorry, to get back to the point
> > here, again, let's take this, which will allow the firmware bindings to
> > be resubmitted and hopefully accepted, and we can move forward from
> > there to "real" things like a USB or PCI or even platform device and
> > driver binding stuff.
> 
> In order to continue I propose to send out the following series:
> 
> 1) minimal device and firmware abstractions only

Sounds good.

But after this, I don't want to take ANY driver core rust code that is
not able to live in the "normal" part of the Linux kernel tree.  It's
just unsustainable to have it all in one directory sorry.  If this
deadline makes that kbuild work actually happen faster, all the more
reason to have it.  If that kbuild work is somehow stalled due to other
issues, please let me know what that is.

> 2) v2 of all other device / driver, devres and PCI driver abstractions

I will be glad to review this.

> 3) v2 of basic DRM driver abstractions and Nova

I love it how one of the most complex driver subsystems we have (drm) is
attempting to be the "first real" driver use for the rust apis.  Bold
move :)

> The v2 series would contain static driver allocation (in case of DRM even const)
> and quite a few more simplifications around `driver::Registration` and
> `device::Data`.
> 
> Does that make sense?

Yes, but note, I'm going to probably push back on the "driver::" stuff.
But will do so with more constructive criticism as I want this to work
very much and I agree that I think we are both talking past each other
in different ways.  Mostly probably due to my total lack of Rust
experience, my apologies, thanks for your patience with me for this.

thanks,

greg k-h
