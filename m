Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD79DC16FDC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA3010E1EB;
	Tue, 28 Oct 2025 21:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="bXpG40bx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B76910E1EB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1761686960; x=1762291760; i=deller@gmx.de;
 bh=xPy/KlQ3a3WK4A6CBMk7KgFLfmFGmWPb7EiPEHAYCIY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=bXpG40bxqB1cJ3p9IoN8ozrdvD//EndxX54t3Y/yG+2D25mM3nFYktWNyejq88/N
 Sk0qxZ4UuqWWvOCnW/thXqOQc2HAdWhyoD87aP30TRKi6y9vmRj936i4+w2bTVfLr
 h3renfwYItaawLvXfEgTGLT9DwVY0TcnXewWvf6OzgTc/7DNIEO1ulDcsxN5Qpvi3
 Jeohh3/zr4Pc1EGl+bPo+sT5eV2YwoZey0u9xX8PQQZwW5vGLjGkYkuJHqJbJSN6D
 M0YSsiAoQcsfWb9kC6lHOrMZGwzjDCXiT2AN/mNZ+tVTJeBJpDY7szpc4ovo8URmC
 IfxLmEeLdIJh/ifryQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.74]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUXpQ-1veI5Y2aK8-00YkKJ; Tue, 28
 Oct 2025 22:29:20 +0100
Message-ID: <879b9106-75c9-41a5-b0bc-b82e0bd30650@gmx.de>
Date: Tue, 28 Oct 2025 22:29:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: atyfb: Check if pll_ops->init_pll failed
To: Daniel Palmer <daniel@0x0f.com>, linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251024093715.4012119-1-daniel@0x0f.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251024093715.4012119-1-daniel@0x0f.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t7C7J1rINWxhASa1u3VifteotET4znh1v2Zlg4BtxxPKxrKHh3b
 uQEK3/Cc66LyIX7wRpR9PFmRRsE2Woe/rD93zSkNRwcWM8ad6+ZnsNbnfpntna3WuBqLhJt
 HzGFWyosp7QfGmWuEzYMozL5i9AnFbfTr5fyw1+RyqZ+bvOu81EIFdfAvPKxstxHn9j5qyd
 XYKJeAJ6EaOhhzx5guqZQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2GxAYr5NraE=;9TQRP5Ej8yS/K6VB9SZntT0JLk/
 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
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

On 10/24/25 11:37, Daniel Palmer wrote:
> Actually check the return value from pll_ops->init_pll()
> as it can return an error.
>=20
> If the card's BIOS didn't run because it's not the primary VGA card
> the fact that the xclk source is unsupported is printed as shown
> below but the driver continues on regardless and on my machine causes
> a hard lock up.
>=20
> [   61.470088] atyfb 0000:03:05.0: enabling device (0080 -> 0083)
> [   61.476191] atyfb: using auxiliary register aperture
> [   61.481239] atyfb: 3D RAGE XL (Mach64 GR, PCI-33) [0x4752 rev 0x27]
> [   61.487569] atyfb: 512K SGRAM (1:1), 14.31818 MHz XTAL, 230 MHz PLL, =
83 Mhz MCLK, 63 MHz XCLK
> [   61.496112] atyfb: Unsupported xclk source:  5.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>   drivers/video/fbdev/aty/atyfb_base.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

applied.

Thanks!
Helge
