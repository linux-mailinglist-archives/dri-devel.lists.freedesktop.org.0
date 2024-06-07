Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1F89003B7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 14:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B706810E0D0;
	Fri,  7 Jun 2024 12:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FIluzvud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEFA10E0D0;
 Fri,  7 Jun 2024 12:36:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D6FB6CE1D40;
 Fri,  7 Jun 2024 12:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C718C2BBFC;
 Fri,  7 Jun 2024 12:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1717763811;
 bh=YfzeRLsrPb0sG0XHT7D/lb7hJ/Tzc0MEHKP5qnE9QTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FIluzvudUyT/th3uIRXHkbu+TCQF0uRlVXQEntbqLEb5F00L6tRRhxaD0gsxcfUB/
 9hiGd1FmKWACBylKL7bm/s21Gqo7YZ5zfZwxKy61lOpPg61k4BLuFMEE2ILIZNuVrh
 6BqrGSSIRBSyegQCnU9p76YcnBIxOTWD7Mq39jJg=
Date: Fri, 7 Jun 2024 14:36:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: dakr@redhat.com, wedsonaf@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <2024060708-residue-hardy-af36@gregkh>
References: <Zlgg_Q5y3Q99Ts1s@pollux>
 <20240531.165032.1895479176481879387.fujita.tomonori@gmail.com>
 <Zlmfkws-QjNmFxfr@pollux>
 <20240607.211132.1411950625632247437.fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607.211132.1411950625632247437.fujita.tomonori@gmail.com>
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

On Fri, Jun 07, 2024 at 09:11:32PM +0900, FUJITA Tomonori wrote:
> Hi,
> 
> On Fri, 31 May 2024 11:59:47 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > Once we get to a conclusion I can send a series with only the device and firmare
> > abstractions such that we can get them in outside of the scope of the reset of
> > both series to get your driver going.
> 
> Since your discussion with Greg seems to continue for a while, let me
> include the following patch that Greg approved with the next version
> of the PHY driver patchset.

Yes, please take this one now.  We can build on it from there.

I had a meeting yesterday with a lot of rust kernel and userspace people
at Microsoft and talked a bunch about this and how to move forward.  I
think we need to take much smaller "steps" and even encourage most
drivers to start out as a mix of c and rust as there is no real
"requirement" that a driver be "pure" rust at all.  This should both
make the interface logic simpler to start with, AND provide a base so
that people can just write the majority of their driver logic in rust,
which is where the language "safety" issues are most needed, not in the
lifecycle rules involving the internal driver model infrastructure.

Anyway, that's all hand-wavy right now, sorry, to get back to the point
here, again, let's take this, which will allow the firmware bindings to
be resubmitted and hopefully accepted, and we can move forward from
there to "real" things like a USB or PCI or even platform device and
driver binding stuff.

thanks,

greg k-h
