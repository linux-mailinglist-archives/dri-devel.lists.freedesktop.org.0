Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616AD9FB48E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 20:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D08710E11E;
	Mon, 23 Dec 2024 19:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CFJbPtft";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF3E10E11E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 19:01:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91D88FF803;
 Mon, 23 Dec 2024 19:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734980485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dOIDsBuhIWYlOhDYObmF/pMoCGKUr2mxtjBccWWB15o=;
 b=CFJbPtft1cAi9gS1bNfPVvlq9d4TDktlA+P1LY0XAT1JHdKwdvjPEWP8zaOhDBXjx2fSSE
 HbeqSYQo05AL4bKiNURxm5HAGvle/LbXOn3QOBR1gOTyj7y5sRGwykJyf0NhErxZoI7oRP
 1bSg+KCtz3AVQW/hXDmBt3tiuqRgYMkX9yTzNPSEA/A7sCBN0KivK/4O8eqsW777/wKVih
 TbsVPGp81gQovTTSWKlxbZdNY0cGoGJyBcsZLUULpab1XYeMsntMnZxsNh720yExDzJyOa
 MqeaKBcnmk3cmHuEKHfbmum8dl8xjsBuNf9bA5FtwZJ3syCRj8PfX8TyAT7CIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kepplinger <martink@posteo.de>
Cc: Nikolaus Voss <nv@vosn.de>,  Alexander Stein
 <alexander.stein@ew.tq-group.com>,  Liu Ying <victor.liu@nxp.com>,  Luca
 Ceresoli <luca.ceresoli@bootlin.com>,  Fabio Estevam <festevam@denx.de>,
 Marek Vasut <marex@denx.de>,  Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,  Robert Foss
 <rfoss@kernel.org>,  Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  David Airlie <airlied@gmail.com>,  Daniel
 Vetter <daniel@ffwll.ch>,  nikolaus.voss@haag-streit.com,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm: bridge: fsl-ldb: fixup mode on freq mismatch
In-Reply-To: <80cdb6d83f37c1c87a71ad567b2c4f2433219465.camel@posteo.de>
 (Martin Kepplinger's message of "Thu, 19 Dec 2024 12:39:05 +0000")
References: <20241219105416.4AE0D1201@mail.steuer-voss.de>
 <80cdb6d83f37c1c87a71ad567b2c4f2433219465.camel@posteo.de>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 23 Dec 2024 20:01:22 +0100
Message-ID: <87ldw6rzp9.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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

Hello Martin,

On 19/12/2024 at 12:39:05 GMT, Martin Kepplinger <martink@posteo.de> wrote:

> Am Donnerstag, dem 19.12.2024 um 11:54 +0100 schrieb Nikolaus Voss:
>> LDB clock has to be a fixed multiple of the pixel clock.
>> Although LDB and pixel clock have a common source, this
>> constraint cannot be satisfied for any pixel clock at a
>> fixed source clock.
>>=20
>> Violating this constraint leads to flickering and distorted
>> lines on the attached display.
>>=20
>> To overcome this, there are these approches:
>>=20
>> 1. Modify the base PLL clock statically by changing the
>> =C2=A0=C2=A0 device tree, implies calculating the PLL clock by
>> =C2=A0=C2=A0 hand, e.g. commit 4fbb73416b10 ("arm64: dts:
>> =C2=A0=C2=A0 imx8mp-phyboard-pollux: Set Video PLL1 frequency to 506.8 M=
Hz")
>>=20
>> 2. Walk down the clock tree and modify the source clock.
>> =C2=A0=C2=A0 Proposed patch series by Miquel Raynal:
>> =C2=A0=C2=A0 [PATCH 0/5] clk: Fix simple video pipelines on i.MX8
>>=20
>> 3. This patch: check constraint violation in
>> =C2=A0=C2=A0 drm_bridge_funcs.atomic_check() and adapt the pixel
>> =C2=A0=C2=A0 clock in drm_display_mode.adjusted_mode accordingly.
>>=20
>> Fixes: 463db5c2ed4a ("drm: bridge: ldb: Implement simple Freescale
>> i.MX8MP LDB bridge")
>> Cc: <stable@vger.kernel.org> # 6.12.x, 6.6.x
>> Signed-off-by: Nikolaus Voss <nv@vosn.de>
>>=20
>> ---

I didn't investigate further, but FYI this approach does not fix my
situation with iMX8MP. I am not saying it's wrong, because I am not
experienced enough with drm, but at least that it is not a replacement
of point #2 above.

Cheers,
Miqu=C3=A8l
