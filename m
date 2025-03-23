Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D36A6D23A
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 23:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0057A10E1BC;
	Sun, 23 Mar 2025 22:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="pPcWRwJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968DC10E1BC
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 22:48:38 +0000 (UTC)
Date: Sun, 23 Mar 2025 18:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1742770117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IPUcsPWWa2X9NKfpybVnP9b2BUGvSK430jlCkPrgcYg=;
 b=pPcWRwJ6ULwbzFVnYhIkw85Ou/fbeyBqqixE9bPjue5gt4XnjsIwZtqv/W8AOOimwa//lw
 MGeQNOeLPbmVR4Uyo46BmpfX7ZGdrSley00lutcJsJ0Wpcr2x4oaYsBYKei0QTrvg7djta
 RF22Z3ZIY7jDI5SSCYfwpPEY/zAcQ5Z3M143egmgItXDXvPjsyLJfWiTEckWlVTJLeGhsL
 8zRsfeddKqwItobtsycZyajOv3GLCEWP4k2k+4qrEEjucPkaAWbnM391NLpwvYC907xwjq
 AZ7HfTVC+7PB4IFJv044IpsrUy4Lz2wsJejWoLjKXioqgx1zyBbtCFEYQnthnw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
 Jonathan Corbet <corbet@lwn.net>, Sergio Lopez Pascual <slp@sinrega.org>,
 Ryan Houdek <sonicadvance1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v3] drm: Add UAPI for the Asahi driver
Message-ID: <Z-CPspG_Cy-f-MKe@blossom>
References: <20250314-agx-uapi-v3-1-3abf7e74ea2f@rosenzweig.io>
 <Z912pMazVwHKLi72@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z912pMazVwHKLi72@phenom.ffwll.local>
X-Migadu-Flow: FLOW_OUT
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

> Since this is a deparature from our usual requirement that all pieces
> should be ready before landing anything we had discussion whether this is
> an acceptable one-off exception for special circumstance. Thanks a lot to
> Alyssa for driving this. The very much summarized consensus is that due to
> rust this is a special case, and because the userspace is in upstream mesa
> and lead by people who know what they're doing and have been around for
> years, it should all work out. As a stand-in for that discussion:
> 
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> 
> But Dave&me very much do not want to make this a recurring thing, please
> don't try :-)

Thanks for the ack :)
