Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBD56F6AEF
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 14:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CF310E391;
	Thu,  4 May 2023 12:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4889110E2CB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 14:22:39 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
 by mail.gandi.net (Postfix) with ESMTPSA id E7DE720012;
 Wed,  3 May 2023 14:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
 t=1683123757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uwxo62b1FjDP4W7+iA0HCFX6QqvdaT3I2gnswLMerSk=;
 b=FB08IkDN48YJRRLSHfeNgGlOMZREE3ZUEkFby9Cv+aGnB/sZq08iCFL8Edlmh++pWVjiRb
 MwWxNKoeEGR7QKMyaWPb6jQO7qUvatbqu8ndXhE18UPCFjxqQhQo9HOi4T7YxIBXimgSot
 mRuRo9cxs5euEITFQ0KBEIGmqki143DSaSn6gyFFviGrOoI5UHXXBTtEglILF2Vkt9zQue
 0+DLIhORCVQ0x0/0EmHZHgHeFV8qilx4njBppMlLW6EFR78prU0j1bVFYK+x1wN/c4A4Ct
 V9DyAoB0Ztbdh/IrN8ZO9bEt/LfRMl37aItpqkPTxYclousaDuRpOCMWONd8yg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 May 2023 16:22:32 +0200
Message-Id: <CSCPKPC8OB80.1TTBCM3YDVJQ5@void.crly.cz>
Subject: Re: [PATCH v2 0/7] drm: sun4i: set proper TCON0 DCLK rate in DSI mode
From: "Roman Beranek" <me@crly.cz>
To: "Frank Oltmanns" <frank@oltmanns.dev>, "Maxime Ripard"
 <mripard@kernel.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>
X-Mailer: aerc 0.14.0
References: <20230418074008.69752-1-me@crly.cz>
 <87cz3uzpx1.fsf@oltmanns.dev> <87mt2o9njh.fsf@oltmanns.dev>
In-Reply-To: <87mt2o9njh.fsf@oltmanns.dev>
X-Mailman-Approved-At: Thu, 04 May 2023 12:11:44 +0000
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
Cc: Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Ondrej Jirman <megi@xff.cz>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello everyone,

I apologize for my absence from the discussion during past week, I got
hit with tonsillitis.

On Mon May 1, 2023 at 3:40 PM CEST, Frank Oltmanns wrote:
> Looking at ccu_nkm_determine_rate(), we've found our culprit because it
> does not try parent clock rates other than the current one. The same
> applies to all other ccu_nkm_* functions.

Yes, that's why I dropped CLK_SET_RATE_PARENT from pll-mipi in v3.

>  b. Add functionality to ccu_nkm_* to also update the parent clock rate.
>
> I'm actually interested in tackling b, but I can't make any promises as
> to if and when I'll be able to solve it. I'm not certain about any side
> effects this might have.

It sounds like an interesting exercise. But what if HDMI is then added
to the mix?

Best regards
Roman
