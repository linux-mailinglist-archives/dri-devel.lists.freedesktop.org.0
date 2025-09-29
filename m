Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A831BAA7BF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 21:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A39710E48B;
	Mon, 29 Sep 2025 19:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fDK7hvo/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7848210E252;
 Mon, 29 Sep 2025 19:37:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 02EA44456F;
 Mon, 29 Sep 2025 19:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0DCC4CEF4;
 Mon, 29 Sep 2025 19:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1759174666;
 bh=/ySbA8wRc6NkjqRPcqVdfv7w1rKuBdESIeJ1MkD9F3U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fDK7hvo/7FDQmZBMmAj4TMRwPYHiPY9prHY35LLyTilCv/drsPhw5eLW1lU8+7Trx
 Tc+icGUWm8QEUwxffgB1aOyPWr5iiKEQ+63AQGm8JXvUdogfMOM2+dlXzbm43lALy9
 /zTSBeqKce9y5hrP2/pv46++olaQ8w/kRC4S78c0=
Date: Mon, 29 Sep 2025 21:37:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
Message-ID: <2025092924-cork-mobilize-cfbf@gregkh>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <2025092157-pauper-snap-aad1@gregkh>
 <DCYHCLM67KRZ.366VS9PDKLYKY@kernel.org>
 <2025092125-urban-muppet-1c2f@gregkh>
 <20250923222434.GA2479829@joelbox2>
 <2025092425-sinuous-playoff-3618@gregkh>
 <76f87707-17d8-4cb0-8c81-e67ebf62984a@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76f87707-17d8-4cb0-8c81-e67ebf62984a@nvidia.com>
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

On Mon, Sep 29, 2025 at 03:26:57PM -0400, Joel Fernandes wrote:
> On 9/24/2025 12:40 PM, Greg KH wrote:
> > On Tue, Sep 23, 2025 at 06:24:34PM -0400, Joel Fernandes wrote:
> [..]
> > 
> >> For the separate issue of enforcing endianness with respect to (across)
> >> multiple fields, I agree with you that if the user's backend (the consumer of
> >> the data) is not doing such conversion, say via regmap, then that becomes a
> >> problem. But that problem is orthogonal/different and cannot be solved here.  
> > 
> > But that is exactly what these macros are being defined here for, so to
> > ignore that is going to cause problems :)
> > 
> 
> If needed, happy to add endianness support as needed by providing additional
> options to the macro. Based on this thread, it sounds like we want see if that
> is really needed here or can be solved elsewhere (?). The mental model I kind of
> have is this macro should only be dealing with CPU native endianness, much like
> bitfields in C deal with CPU endianness. Hmm.

Just don't go down the old path like drivers/net/fddi/skfp/h/supern_2.h
does with it's definition of:

	union tx_descr {
		struct {
	#ifdef  LITTLE_ENDIAN
		unsigned int    tx_length:16 ;  /* frame length lower/upper byte */
		unsigned int    tx_res   :8 ;   /* reserved      (bit 16..23) */
		unsigned int    tx_xmtabt:1 ;   /* transmit abort */
		unsigned int    tx_nfcs  :1 ;   /* no frame check sequence */
		unsigned int    tx_xdone :1 ;   /* give up token */
		unsigned int    tx_rpxm  :2 ;   /* byte offset */
		unsigned int    tx_pat1  :2 ;   /* must be TXP1 */
		unsigned int    tx_more  :1 ;   /* more frame in chain */
	#else
		unsigned int    tx_more  :1 ;   /* more frame in chain */
		unsigned int    tx_pat1  :2 ;   /* must be TXP1 */
		unsigned int    tx_rpxm  :2 ;   /* byte offset */
		unsigned int    tx_xdone :1 ;   /* give up token */
		unsigned int    tx_nfcs  :1 ;   /* no frame check sequence */
		unsigned int    tx_xmtabt:1 ;   /* transmit abort */
		unsigned int    tx_res   :8 ;   /* reserved      (bit 16..23) */
		unsigned int    tx_length:16 ;  /* frame length lower/upper byte */
	#endif
		} t ;
		long    i ;
	} ;

CPU endinness, hah, as if...

