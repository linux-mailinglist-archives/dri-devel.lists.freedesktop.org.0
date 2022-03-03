Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E15B84CBD0B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 12:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9611E10E20D;
	Thu,  3 Mar 2022 11:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7DD10E20D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 11:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646307904;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=1U0RlICpC801yZ3pY7dq3Eqr5R+bRmZDq6Rw9zvDVVs=;
 b=mq6ftPqufFdfSq4Eu6iiJWsM4rQoXmcuM9eM277EAhbXY1hKkblJTEIQQd42F8SmQw
 7GooQoTwQPnEdSrTYkSkvW/9szLvgK7SCQZr0ntfVf9VA8RGwLmSufWgfMsGoCTM0W/a
 YhYJGSex8+llRP1/aznRRyVkLlwynt4h6ga3BpkKJvkbMw4UQM5yNwwxzGBFrXKGUjuh
 fXKFz3uHCEelVvI0/Y7gqTCSywL6PjC9wMd/QGoBckdM9HJLXLNDydSeGZ90P0/W9SDy
 D0w6LUANSH0yvN/aHC2M0zDagGg+GLyigcXC6YtlMvVgxqrOOzVo2u5LDvYJm5uDDWPo
 97Qg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw47tT+k="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.40.1 DYNA|AUTH)
 with ESMTPSA id V41e6fy23Bj4Ypx
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 3 Mar 2022 12:45:04 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v16 4/4] drm/bridge: dw-hdmi: fix bus formats negotiation
 for 8 bit modes
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <d75cd860-2a4c-6f81-b5d0-dc75f37b7150@baylibre.com>
Date: Thu, 3 Mar 2022 12:45:03 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <890BB299-AB92-4177-83E8-74C8AA551AF1@goldelico.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <169afe64b4985c3f420177cd6f4e1e72feeb2449.1645895582.git.hns@goldelico.com>
 <5da069b6-8a99-79c2-109c-c85715165857@baylibre.com>
 <E0D3B7E8-0C8D-4119-8267-0556AB921B24@goldelico.com>
 <fca28594-8d4e-dd2f-93a0-a052cb888d90@baylibre.com>
 <75CBD357-577A-402D-9E3B-DBE82A84BC43@goldelico.com>
 <4cb08b5d-c1ec-f2b4-a107-63a771146ec0@baylibre.com>
 <598F3A49-9CE2-4C59-95D4-CDA888A3B3BF@goldelico.com>
 <3625b23b-9718-640a-1aac-0b30773a26ab@baylibre.com>
 <E95145AB-DEFC-419D-B926-B0BAF0985D09@goldelico.com>
 <d75cd860-2a4c-6f81-b5d0-dc75f37b7150@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Paul Boddie <paul@boddie.org.uk>, Maxime Ripard <maxime@cerno.tech>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-mips <linux-mips@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

> Am 03.03.2022 um 12:42 schrieb Neil Armstrong =
<narmstrong@baylibre.com>:
>=20
>> So how can we get that merged? IMHO your proposal should be before we =
add ingenic-dw-hdmi.
>> If you have a version with proper commit message I can add it to the =
beginning of my
>> seried and include it in a v17. Or if you get yours merged to =
drm-misc/drm-misc-next I
>> can build on top.
>=20
> You can add it in your v17 patchset with my authorship and my =
Signed-off-by tag + yours.
>=20
> As commit message something like :
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> drm/bridge: dw-hdmi: handle unusable or non-configured CSC module
>=20
> The dw-hdmi integrates an optional Color Space Conversion feature used
> to handle color-space conversions.
>=20
> On some platforms, the CSC isn't built-in or non-functional.
>=20
> This adds the necessary code to disable the CSC functionality
> and limit the bus format negotiation to force using the same
> input bus format as the output bus format.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Fine! Will do.

BR and thanks,
Nikolaus

