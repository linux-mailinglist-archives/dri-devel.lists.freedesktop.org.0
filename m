Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1888792B350
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 11:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A38F10E4C8;
	Tue,  9 Jul 2024 09:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ms/nfM4W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB19510E4C8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 09:11:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 57D1A60F37;
 Tue,  9 Jul 2024 09:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1BEC3277B;
 Tue,  9 Jul 2024 09:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1720516298;
 bh=bF04r8LuquU/qir0aCll9+NDJrFTCzvu0tF1oglQD78=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ms/nfM4Wxk8p5OGqAW6f8WdhgRTO9uLKNrF812GfyLcaO2s4aAXI2r1tC2P6vRjj/
 xdrWu3TDW4yyvZsCvtkJdY+hilXEPP5fPcy4ea6oVeQOCRpXTs2xnFCZsk1YEq7X17
 6Cc0ici7NOLuyh/tqjqK0+xDXxWdYzGtzz7cKkKs=
Date: Tue, 9 Jul 2024 11:11:34 +0200
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
Subject: Re: [PATCH v2 4/4] drm/panic: Add a qr_code panic screen
Message-ID: <2024070951-tall-effective-c916@gregkh>
References: <20240709084458.158659-1-jfalempe@redhat.com>
 <20240709084458.158659-5-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709084458.158659-5-jfalempe@redhat.com>
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

On Tue, Jul 09, 2024 at 10:40:10AM +0200, Jocelyn Falempe wrote:
> +config DRM_PANIC_SCREEN_QR_CODE_URL
> +	string "Base url of the QR code in the panic screen"
> +	depends on DRM_PANIC_SCREEN_QR_CODE
> +	help
> +	  This option sets the base url to report the kernel panic. If it's set
> +	  the qr code will contain the url and the kmsg compressed with zlib as
> +	  url parameter. If it's empty, the qr code will contain the kmsg as
> +	  uncompressed text only.

meta-comment, should we by default do this on a kernel.org domain so
that no specific distro has to worry about hosing this type of web
service?

thanks,

greg k-h
