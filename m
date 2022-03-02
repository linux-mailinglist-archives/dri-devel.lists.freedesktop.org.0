Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9684CB23C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 23:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B71D10E37F;
	Wed,  2 Mar 2022 22:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A515010E37F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 22:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646259883;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=iQfNJuH2Ji0pVE8fbybSO1iLM6ySE3fcPhmj0E324Ao=;
 b=tE231fH5UsT9bLVeBm4aBSqC3K8UPgFe3CjQmY24dlNuUZWoHCHt3ejFr8EkmDDg/7
 qiMj4GjqUcxmf1lvwOcefDUJ4/bBcZz4hKf+vFUSyywKOGFlGHrVlMON3lWTXsvfTPLd
 YiqbJH+8OoEMcEs86uEiIjc+z7kBKMNNM0ukuOREaSqhVTrBLp6TwbWnIvsVTEnzSMrB
 4tzonn0e9ds6zxCQSIiXjvTnGKKkLsMWRBTrE28VbAdIyxzTTFIPHwnFKPJIIIjs5mLT
 kvk7LeuCZ9eajRQJdkj7QmpEy4EFmVmL5Orza9Z7nLY1Df/YZGK22ka8zW9eIROpizCh
 ZPYg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43oQ+E="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.40.1 DYNA|AUTH)
 with ESMTPSA id V41e6fy22MOhWCe
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 2 Mar 2022 23:24:43 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v16 4/4] drm/bridge: dw-hdmi: fix bus formats negotiation
 for 8 bit modes
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <4cb08b5d-c1ec-f2b4-a107-63a771146ec0@baylibre.com>
Date: Wed, 2 Mar 2022 23:24:42 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <598F3A49-9CE2-4C59-95D4-CDA888A3B3BF@goldelico.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <169afe64b4985c3f420177cd6f4e1e72feeb2449.1645895582.git.hns@goldelico.com>
 <5da069b6-8a99-79c2-109c-c85715165857@baylibre.com>
 <E0D3B7E8-0C8D-4119-8267-0556AB921B24@goldelico.com>
 <fca28594-8d4e-dd2f-93a0-a052cb888d90@baylibre.com>
 <75CBD357-577A-402D-9E3B-DBE82A84BC43@goldelico.com>
 <4cb08b5d-c1ec-f2b4-a107-63a771146ec0@baylibre.com>
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
Cc: Paul Boddie <paul@boddie.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-mips <linux-mips@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

> Am 02.03.2022 um 15:34 schrieb Neil Armstrong =
<narmstrong@baylibre.com>:
>=20
> Hi,
>=20
>> (cross-checked: RGB mode still works if I force hdmi->sink_is_hdmi =3D =
false)
>=20
> I don't understand what's wrong, can you try to make the logic select =
MEDIA_BUS_FMT_YUV8_1X24 instead of DRM_COLOR_FORMAT_YCBCR422 ?

I have forced hdmi->sink_is_hdmi =3D false and replaced

 	/* Default 8bit RGB fallback */
-	output_fmts[i++] =3D MEDIA_BUS_FMT_RGB888_1X24;
+	output_fmts[i++] =3D MEDIA_BUS_FMT_YUV8_1X24;

And then screen remains black. MEDIA_BUS_FMT_RGB888_1X24 works.
(MEDIA_BUS_FMT_VUY8_1X24 doesn't work either).

So this indicates that YUV conversion is not working properly. Maybe =
missing some special
setup.

What I have to test if it works on a different monitor. Not that this =
specific panel
(a 7 inch waveshare touch with HDMIinput) is buggy and reports YUV =
capabilities
but does not handle them...

On the other hand this panel works on RasPi and OMAP5 (where I admit I =
do not know in
which mode).

> If your CSC is broken, we'll need to disable it on your platform.

Indeed.

So it seems as if we need a mechanism to overwrite =
dw_hdmi_bridge_atomic_get_output_bus_fmts()
in our ingenic-dw-hdmi platform specialization [1] to always return =
MEDIA_BUS_FMT_RGB888_1X24.

Or alternatively set sink_is_hdmi =3D false there (unfortunately there =
is no direct access to
struct dw_hdmi in a specialization drivers).

Is this already possible or how can it be done?

BR and thanks,
Nikolaus

[1]: =
https://lore.kernel.org/all/24a27226a22adf5f5573f013e5d7d89b0ec73664.16458=
95582.git.hns@goldelico.com/=
