Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4E54B4905
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 11:20:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE4510E503;
	Mon, 14 Feb 2022 10:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C7F10E4FF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 10:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1644833982;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=/RNqZ6XDotK4+hH5HIHOFU3lzcpRUTrZvxsoPqCBBJY=;
 b=sDDyj2TZaq256WfhRwDUtNaoN5Zj8IwWD4DOK/8UTh9sejSsPTmEza9YdhMiB3EMGw
 w9l75qOJ+YBttR+/1HXxBPtm7qcBOVpqLXTUwmsDOorSJEspXTvjOkFPRxIr6VGfp71f
 waI43N4Et07SWWKHPOFrAOE8R9+U81pnhg5+Uf4IH3CM1NmtIFLAM9CfM3/tYmfNr/Wu
 +OQnQLqhxd3/g520JlTUNHJ2QH9x7ofwAQMYhhBlkUIkiY1FPXOwbAKJmQ0mtMlwm08d
 xV7+JkwMdx0FIrhoyKOeexVJysi2M+k12vwe+0eJv70cKV+Zru+fR6DZSQmPCb9uYVJJ
 A1Uw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jcR+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
 with ESMTPSA id L29417y1EAJfxt5
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 14 Feb 2022 11:19:41 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v15 1/7] drm/ingenic: Fix support for JZ4780 HDMI output
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <PQHA7R.CIX6XS4CFLMM3@crapouillou.net>
Date: Mon, 14 Feb 2022 11:19:40 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <CD0193A3-4E97-4B26-9D1F-1CFAD5B18506@goldelico.com>
References: <cover.1644681054.git.hns@goldelico.com>
 <9d3a2000d2bb014f1afb0613537bdc523202135d.1644681054.git.hns@goldelico.com>
 <PQHA7R.CIX6XS4CFLMM3@crapouillou.net>
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


> Am 14.02.2022 um 11:13 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi,
>=20
> Le sam., f=C3=A9vr. 12 2022 at 16:50:49 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> From: Paul Boddie <paul@boddie.org.uk>
>> We have to make sure that
>> - JZ_LCD_OSDC_ALPHAEN is set
>> - plane f0 is disabled and not seen from user-space
>=20
> Actually it will still be seen from user-space, but it won't be =
possible to use it. So before applying I'll change this to:
> "plane f0 is disabled as it's not working yet"
>=20
> If that's OK with you.

Yes. You understand much better than me the implications...

BR and thanks,
Nikolaus

