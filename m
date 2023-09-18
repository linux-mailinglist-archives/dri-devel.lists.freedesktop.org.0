Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A09817A54B5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 23:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4039610E345;
	Mon, 18 Sep 2023 21:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3A110E345
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 21:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1695070877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PGvKmZ4gaTSql+5Gg/EmBcBsE1/45EteF32nr/hxcZo=;
 b=ijlY7zatBWXUmIxq4VkOLaBZC2y/y4fDubHLt9REXR9DJhzjsscveIfKT8vlGE8SvHjBhp
 iMRuIIreS9ezl3Xt6wHwmc+6ryYcL/rw+KMW6mrpRkDtAZJc3tB6zmqros4UFA7XpU1XSE
 FQqp4lIKDXcTMUEZGMhTp/Ml8h3Sm7E=
Message-ID: <4d2079d66249a7052acded0abf30169a4e95d151.camel@crapouillou.net>
Subject: Re: [RFC PATCH v2 3/9] drm/panel: nv3052c: Sleep for 150ms after reset
From: Paul Cercueil <paul@crapouillou.net>
To: John Watts <contact@jookia.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 18 Sep 2023 23:01:15 +0200
In-Reply-To: <ZQi4fFZ0VnsUIiXO@titan>
References: <20230918125853.2249187-1-contact@jookia.org>
 <20230918125853.2249187-4-contact@jookia.org>
 <7fc1ca68-ca7c-59b2-0b70-27bc34d83cee@quicinc.com> <ZQi4fFZ0VnsUIiXO@titan>
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
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

Le mardi 19 septembre 2023 =C3=A0 06:52 +1000, John Watts a =C3=A9crit=C2=
=A0:
> On Mon, Sep 18, 2023 at 01:19:03PM -0700, Jessica Zhang wrote:
> > Hi John,
> >=20
> > Just wondering, is there some context to this change? I.e., was
> > this made to
> > fix a specific issue?
> >=20
> > This seems like a pretty significant increase in wait time so, if
> > it's not a
> > fix, I'm not sure if this would be an improvement on the current
> > behavior.
> >=20
> > Thanks,
> >=20
> > Jessica Zhang
>=20
> Hi Jessica,
>=20
> Thank you for the feedback.
>=20
> This patch here is required by the data sheet if the screen was
> already running
> and was reset. This is necessary if for example the bootloader set up
> and had
> the screen running. However I have not tested this, it's possible the
> specific
> panels have shorter tolerances for resets. This is purely
> precautionary at
> this stage based on what the data sheet says.
>=20
> That said I will be investigating this specific use case with this
> panel over
> the next few months. I am okay separating out this patch until I have
> proof it's
> needed for my particular display. I don't know anything about the ltk
> display.
>=20
> The second sleep patch can probably be omitted as I don't think the
> panel being
> prepared then unprepared in rapid succession is a realistic
> situation, but I=20
> figured I might as well propose it to see if it's the right thing to
> do.
>=20
> Thanks for your time and review,
> John.

The datasheet does say a 5ms sleep time is necesary after a reset. I
assume the 120ms delay you quote is when a *software* reset is
performed in Sleep-out mode. The code here does a hard-reset.

Cheers,
-Paul
