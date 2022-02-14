Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C69554B503B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 13:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2900210E299;
	Mon, 14 Feb 2022 12:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF13910E299
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 12:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1644842007;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=qUySygnZkUVx2rCGOqeGTSW2rdh368jzeZLPMWUYvgM=;
 b=HgaFJ6Ad0ulS/opcA5h6cVZhkGErNDDWCWraBuVA+dHKnvROUI7LO2LlfCT2oHrhMn
 62W8bhJhgSocf6NKz51ZsXj1fzBjeqZldRG1v9qGWiee1NcfzyVmqhPAA2mA4IpIWtVt
 W+epz9xy0Xw9gTZnoCZsKDb1c3U2CG4ySTufPcm29MnIQhEQLFyAHSuaS20dSduPUMkl
 39Iby/GdVlzrLqaeg3qCMIGTdRM8tdIQJ1ud3wFvDXTXPqTkC62VmIJ1GInOSxzRKmDH
 u1LKTUElff1sKPiuyjfn+bMDasVqPqk/sUryL6kjlK8dlKA5fIXvdOhRJKPkJ7nlfplb
 +vzw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jcR+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
 with ESMTPSA id L29417y1ECXQyfk
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 14 Feb 2022 13:33:26 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v15 1/7] drm/ingenic: Fix support for JZ4780 HDMI output
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <U0OA7R.MYFTV5LL3N4A2@crapouillou.net>
Date: Mon, 14 Feb 2022 13:33:25 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <93A6366F-1B51-459B-9927-04FCF730698E@goldelico.com>
References: <cover.1644681054.git.hns@goldelico.com>
 <9d3a2000d2bb014f1afb0613537bdc523202135d.1644681054.git.hns@goldelico.com>
 <PQHA7R.CIX6XS4CFLMM3@crapouillou.net>
 <CD0193A3-4E97-4B26-9D1F-1CFAD5B18506@goldelico.com>
 <U0OA7R.MYFTV5LL3N4A2@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
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
Cc: Paul Boddie <paul@boddie.org.uk>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-mips@vger.kernel.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, letux-kernel@openphoenux.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

> Am 14.02.2022 um 13:29 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi,
>=20
> Le lun., f=C3=A9vr. 14 2022 at 11:19:40 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> Hi Paul,
>>> Am 14.02.2022 um 11:13 schrieb Paul Cercueil <paul@crapouillou.net>:
>>> Hi,
>>> Le sam., f=C3=A9vr. 12 2022 at 16:50:49 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>>>> From: Paul Boddie <paul@boddie.org.uk>
>>>> We have to make sure that
>>>> - JZ_LCD_OSDC_ALPHAEN is set
>>>> - plane f0 is disabled and not seen from user-space
>>> Actually it will still be seen from user-space, but it won't be =
possible to use it. So before applying I'll change this to:
>>> "plane f0 is disabled as it's not working yet"
>>> If that's OK with you.
>> Yes. You understand much better than me the implications...
>=20
> I reworded it to "plane f0 is disabled as it's not working yet", added =
a Fixes: tag, and pushed this patch to drm-misc-next.

great and thanks.
So I drop it from v16.

BR and thanks,
Nikolaus

