Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8A5926EAF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 07:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D034E10E9B4;
	Thu,  4 Jul 2024 05:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Rb1cZVzT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B84110E9B4
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 05:03:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 880CECE32E2;
 Thu,  4 Jul 2024 05:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46706C3277B;
 Thu,  4 Jul 2024 05:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1720069402;
 bh=Hjf3JAXpXfAWWms/5UKIQ2jB2126fzQdVq72QWeU1SY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rb1cZVzTlJpr/k6oeKlH6QQHACs6VCGZyFHWJOYUKcADHzJ4VAxtmh0X0c0fmWz0D
 MR49wp5r4Fj5cxXpvNgXZvAozMuuQ8eMOBoFPJbt0lQRfVIJOTR2BMfPbiyBJnUpYQ
 6t8t7J0pkE1zBkxx5Es8U2yAYbhdxfjNa7MTFDBs=
Date: Thu, 4 Jul 2024 07:03:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH 0/4] drm/panic: Add a qr_code panic screen
Message-ID: <2024070417-husked-edgy-f527@gregkh>
References: <20240703154309.426867-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703154309.426867-1-jfalempe@redhat.com>
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

On Wed, Jul 03, 2024 at 05:33:57PM +0200, Jocelyn Falempe wrote:
> This series adds a new panic screen, with the kmsg data embedded in a QR-code.
> 
> The main advantage of QR-code, is that you can copy/paste the debug data to a bug report.
> 
> The QR-code encoder is written in rust, and is very specific to drm_panic.
> The reason is that it is called in a panic handler, and thus can't allocate memory, or use locking.
> The rust code uses a few rust core API, and provides only two C entry points.
> There is no particular reason to do it in rust, I just wanted to learn rust, and see if it can work in the kernel.
> 
> If you want to see what it looks like, I've put a few screenshots here:
> https://github.com/kdj0c/panic_report/issues/1

Cool, this idea has been floating around for decades, here's the last
attempt at this back in 2014:
	https://lore.kernel.org/all/1395093587-2583-1-git-send-email-teobaluta@gmail.com/

> 
> -- 
> 
> Jocelyn
> 
> 
> Jocelyn Falempe (4):
>   drm/panic: Add integer scaling to blit()
>   drm/rect: add drm_rect_overlap()
>   drm/panic: simplify logo handling
>   drm/panic: Add a qr_code panic screen
> 
>  drivers/gpu/drm/Kconfig         |  29 +
>  drivers/gpu/drm/Makefile        |   1 +
>  drivers/gpu/drm/drm_drv.c       |   3 +
>  drivers/gpu/drm/drm_panic.c     | 338 +++++++++--
>  drivers/gpu/drm/drm_panic_qr.rs | 989 ++++++++++++++++++++++++++++++++

Wait, we can put .rs files in any directory now?  I didn't think that
worked properly yet.

thanks,

greg k-h
