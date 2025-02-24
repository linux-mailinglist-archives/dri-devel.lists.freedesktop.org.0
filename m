Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31114A42256
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 15:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBCF10E409;
	Mon, 24 Feb 2025 14:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="ims34gfQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D0E89A4E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 07:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1740383950;
 bh=KH7gHdSS1itQHQoP3z+uj401oB/rX1ncYfhBdSQWuUg=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ims34gfQA1vb1TN04LB3UWi8oHvR4gxRnPiIctjK103CyZjimW58U3jEvwGUiodUv
 Za6iGn3q5AdLIxYyGTz781CdTkRRuzvuzvB+jqoRCFNgqP3roPHIeinGtWFwJEKkks
 APqv1lGjpK23uVFnzo7nVVS6b3xXCg06P8jTIx1RlPQEEsIl6RAASM53YXWxfxgCPT
 YuWYvczKQgqWnAIi87XjLoll+9D2dsL+De6hgIcZaT1OeN4O1e1mvYID5Q0/x192AI
 cIKrTswlatGOS2XEjLU/PxGrM3nDGtjSOtqs2L52iQ/z9EMvUaOHQjKU3ndigQC8xz
 42ZoJR/u2NoBg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1Y5l5GVTz4wby;
 Mon, 24 Feb 2025 18:58:51 +1100 (AEDT)
Message-ID: <1cebfebb9c205a1ebc5722ca7e3b87339ceb3c79.camel@ozlabs.org>
Subject: Re: [PATCH 00/17] Introduce and use generic parity32/64 helper
From: Jeremy Kerr <jk@ozlabs.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com,  bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, joel@jms.id.au,  eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,  rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com,  mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl,  miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com,  louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net,  edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com,  arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net,  gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com,  akpm@linux-foundation.org
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com,  kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org,  dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org,  linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org,  oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, 
 Yu-Chun Lin <eleanor15x@gmail.com>
Date: Mon, 24 Feb 2025 15:58:49 +0800
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2025 14:05:04 +0000
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

Hi Kuan-Wei,

> Several parts of the kernel contain redundant implementations of parity
> calculations for 32-bit and 64-bit values. Introduces generic
> parity32() and parity64() helpers in bitops.h, providing a standardized
> and optimized implementation.=C2=A0=20

More so than __builtin_parity() ?

I'm all for reducing the duplication, but the compiler may well have a
better parity approach than the xor-folding implementation here. Looks
like we can get this to two instructions on powerpc64, for example.

Cheers,


Jeremy
