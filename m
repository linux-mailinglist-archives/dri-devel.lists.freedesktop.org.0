Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D30E7A551F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 23:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFF410E0B9;
	Mon, 18 Sep 2023 21:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBC610E0B9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 21:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1695072893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBjUrTB1h6HTKFJu/vUBibZ6e10SxFFPD/tWImLBD8M=;
 b=aQOTQq7w9HVWKEl0ATGzAh6PQ68Fgak1vuBqlFH2PMpa73jk/hz3ktOCyM6KqF5vPaQVDD
 T6WzM8kGPKD3VyhTy/yiueGnkmcvCz7ayvx/2IyJrx3Ju0jTaZirSFgcSwh14GGtU1Lc5R
 h1botIamZ9WUbqAXcIve+PAvDpwEJos=
Message-ID: <0d6b0159552b10548391a9bd88449d12c13fdcd6.camel@crapouillou.net>
Subject: Re: [RFC PATCH v2 3/9] drm/panel: nv3052c: Sleep for 150ms after reset
From: Paul Cercueil <paul@crapouillou.net>
To: John Watts <contact@jookia.org>
Date: Mon, 18 Sep 2023 23:34:51 +0200
In-Reply-To: <ZQi8Z45VCqr-GqN6@titan>
References: <20230918125853.2249187-1-contact@jookia.org>
 <20230918125853.2249187-4-contact@jookia.org>
 <7fc1ca68-ca7c-59b2-0b70-27bc34d83cee@quicinc.com> <ZQi4fFZ0VnsUIiXO@titan>
 <4d2079d66249a7052acded0abf30169a4e95d151.camel@crapouillou.net>
 <ZQi8Z45VCqr-GqN6@titan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>,
 Rob Herring <robh+dt@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mardi 19 septembre 2023 =C3=A0 07:08 +1000, John Watts a =C3=A9crit=C2=
=A0:
> On Mon, Sep 18, 2023 at 11:01:15PM +0200, Paul Cercueil wrote:
> > The datasheet does say a 5ms sleep time is necesary after a reset.
> > I
> > assume the 120ms delay you quote is when a *software* reset is
> > performed in Sleep-out mode. The code here does a hard-reset.
> >=20
> > Cheers,
> > -Paul
>=20
> Hello Paul,
>=20
> Section 7.3 of the data sheet (AC characteristic) says that the reset
> can take
> up to 120ms to complete if the reset is applied during sleep out
> mode.
>=20
> John.

The driver is guaranteed to always reset the panel in sleep-in mode -
as long as the panel was off when the driver started.

What I'd suggest if you really need to support a case where the panel
was enabled by the bootloader, is to read the 0x0a register after
enabling the regulator to read the mode, and sleep 120ms if it was in
sleep-out mode.

But that's only if it's a case that you can test with. I won't accept a
patch that makes sense on the surface if it addresses a corner case
that nobody ever tested for.

For what I know, this patch just adds a huge delay to panel boot-up for
all existing users for no valid reason.

Cheers,
-Paul
