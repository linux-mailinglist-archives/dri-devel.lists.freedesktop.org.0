Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F3F493130
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 00:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F385E10E13F;
	Tue, 18 Jan 2022 23:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 553 seconds by postgrey-1.36 at gabe;
 Tue, 18 Jan 2022 23:08:42 UTC
Received: from smtp1.de.opalstack.com (smtp1.de.opalstack.com [46.165.236.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642AB10E13F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 23:08:42 +0000 (UTC)
Received: from jason.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
 by smtp1.de.opalstack.com (Postfix) with ESMTPSA id 24E1B593FC;
 Tue, 18 Jan 2022 22:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boddie.org.uk;
 s=dkim; t=1642546765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OOVlv/895Cebypr4G3MxXQflLLnN34ToMNqXW8Yvtu4=;
 b=IU9Vv87stEBejoLadt2aTX/kD1TsEg7j1vf63Iun7KeiXtNCHC6/LvZErHyM98YoJV593U
 xPSij+9Ax1Ojkt3VgRblYokixJRErMhFAW/Ctd5p8PDnCUGC7b9cgPzF4Rjz4ZbmsCAlQ9
 D3erC4NT1RF0ebfJuoFOJVh53BKUKF8=
From: Paul Boddie <paul@boddie.org.uk>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI output
Date: Tue, 18 Jan 2022 23:59:19 +0100
Message-ID: <13356060.GkHXLIg068@jason>
In-Reply-To: <AI0X5R.YWIZO63QXTF4@crapouillou.net>
References: <cover.1633436959.git.hns@goldelico.com>
 <C846BAFB-473D-41D8-93B9-B9ECDD1846C1@goldelico.com>
 <AI0X5R.YWIZO63QXTF4@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=1.24
X-Spam-Level: *
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
Cc: Mark Rutland <mark.rutland@arm.com>, ,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Neil Armstrong <narmstrong@baylibre.com>,
	David Airlie <airlied@linux.ie>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-mips <linux-mips@vger.kernel.org>,
	Andrzej Hajda <a.hajda@samsung.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	"Eric W. Biederman" <ebiederm@xmissio>,
	Jernej Skrabec <jernej.skrabec@gmail.com>, n.com@freedesktop.org,
	OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Maxime Ripard <maxime@cerno.tech>,
	Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Robert Foss <robert.foss@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 18 January 2022 17:58:58 CET Paul Cercueil wrote:
> 
> Not at all. If the clock is disabled, the LCD controller is disabled,
> so all the registers read zero, this makes sense. You can only read the
> registers when the clock is enabled. On some SoCs, reading disabled
> registers can even cause a complete lockup.

My concern was that something might be accessing the registers before the 
clock had been enabled. It seems unlikely, given that the clock is enabled in 
the bind function, and I would have thought that nothing would invoke the 
different driver operations ("funcs") until bind has been called, nor should 
anything called from within bind itself be accessing registers.

> Why is this JZ_LCD_OSDC_ALPHAEN bit needed now? I remember it working
> fine last time I tried, and now I indeed get a black screen unless this
> bit is set. The PM doesn't make it obvious that the bit is required,
> but that wouldn't be surprising.

It isn't actually needed. If the DMA descriptors are set up appropriately, the 
OSD alpha bit seems to be set as a consequence. In my non-Linux testing 
environment I don't even set any OSD registers explicitly, but the OSD alpha 
and enable flags become set when the display is active.

Paul


