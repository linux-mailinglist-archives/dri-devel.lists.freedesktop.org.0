Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F64A566E3
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 12:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A15910E12C;
	Fri,  7 Mar 2025 11:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YLmlxbVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8744210E12C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 11:39:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BA05FA4572F;
 Fri,  7 Mar 2025 11:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED54C4CED1;
 Fri,  7 Mar 2025 11:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741347552;
 bh=3/sdXJVj7KtnSE85cKxaG8wUs9rqjrFuOU79jRxJq1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YLmlxbVxqEup0anPAlcb+dTa8FE8yj+y8ZZ0PST3YP2elqVhKYbGBRuANPKgYm1pV
 NGn7rb39E++lc1xbYoS5OhozY8nndia47/v8Sa5rqGO0Bu8MCd8jDX4s/rl8jnc9KS
 /Zw1dAykvcP3jA1LZJezkeY71xfpNocgXG5ZY1+5Iclozb/CN7EK86u7FruZPbQxgj
 O/EL7tcNhW8jLL10yopA5JzxQSg3yqC7XySzB7uBdYZaoLo+uDBWnCmh/MI/mDyW7C
 DnKxEvglJ/VC5FCGBR5poufWGtRL6VWA6EpoY09yZ3F8omD0L+wJBxziuE5Y36X3fT
 t3EHCJ+yuPtdQ==
Date: Fri, 7 Mar 2025 12:38:58 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 yury.norov@gmail.com, akpm@linux-foundation.org, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Message-ID: <Z8ra0s9uRoS35brb@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
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


* Jiri Slaby <jirislaby@kernel.org> wrote:

> On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:
> > Change return type to bool for better clarity. Update the kernel doc
> > comment accordingly, including fixing "@value" to "@val" and adjusting
> > examples. Also mark the function with __attribute_const__ to allow
> > potential compiler optimizations.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >   include/linux/bitops.h | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > index c1cb53cf2f0f..44e5765b8bec 100644
> > --- a/include/linux/bitops.h
> > +++ b/include/linux/bitops.h
> > @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
> >   /**
> >    * parity8 - get the parity of an u8 value
> > - * @value: the value to be examined
> > + * @val: the value to be examined
> >    *
> >    * Determine the parity of the u8 argument.
> >    *
> >    * Returns:
> > - * 0 for even parity, 1 for odd parity
> > + * false for even parity, true for odd parity
> 
> This occurs somehow inverted to me. When something is in parity means that
> it has equal number of 1s and 0s. I.e. return true for even distribution.
> Dunno what others think? Or perhaps this should be dubbed odd_parity() when
> bool is returned? Then you'd return true for odd.

OTOH:

 - '0' is an even number and is returned for even parity,
 - '1' is an odd  number and is returned for odd  parity.

Thanks,

	Ingo
