Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4889D4CA31F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 12:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671BB10E80C;
	Wed,  2 Mar 2022 11:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492D110E905
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 11:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646219750;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=2E590GVKdRoZozo5tkYYbYzrccF+vxFAdL/JT2FI09M=;
 b=tozWRQmYDCzObU5/ZjhaM7E0SuLk6lsx38bX05TwJ41FYWhK3TxpIQtirgACLZwyWK
 bZ25sDR8MCOIccNxsb3TrhTIi2d8Q2c9J/zPRp3L3/ppfWVRjcBsi/7yM7sVFi0sNAvM
 e97CQ2/Vkm2WLzOKACbbrKn58iXR2E7T2+/2T+LvkutuITlwYkQA6yt+P2N78XZ6IvK3
 8IN/wHeDTUA9/cEbaABSM7cjbiaj/pWUqI5FOvgbBNmmDVoCZPVB1QlEIjnT8vFF3Q0B
 DJcOh5oZqHBxz6H+pmILrm6qtv7ruVXsLLg5RLcwl/hVQGfw6TIHd533EfnqU55wHKEH
 /Ctw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43oQ+E="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.40.1 DYNA|AUTH)
 with ESMTPSA id V41e6fy22BFnToO
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 2 Mar 2022 12:15:49 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v16 4/4] drm/bridge: dw-hdmi: fix bus formats negotiation
 for 8 bit modes
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <fca28594-8d4e-dd2f-93a0-a052cb888d90@baylibre.com>
Date: Wed, 2 Mar 2022 12:15:48 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <75CBD357-577A-402D-9E3B-DBE82A84BC43@goldelico.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <169afe64b4985c3f420177cd6f4e1e72feeb2449.1645895582.git.hns@goldelico.com>
 <5da069b6-8a99-79c2-109c-c85715165857@baylibre.com>
 <E0D3B7E8-0C8D-4119-8267-0556AB921B24@goldelico.com>
 <fca28594-8d4e-dd2f-93a0-a052cb888d90@baylibre.com>
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
Cc: Paul Boddie <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 linux-mips <linux-mips@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

> Am 02.03.2022 um 11:25 schrieb Neil Armstrong =
<narmstrong@baylibre.com>:
>=20
>> I added a printk for hdmi->sink_is_hdmi. This returns 1. Which IMHO =
is to be expected
>> since I am using a HDMI connector and panel... So your patch will =
still add the UYVY formats.
>> Either the synposys module inside the jz4780 or the panel does not =
understand them.
>=20
> By selecting the UYVY formats, the driver will enable the colorspace =
converters in the dw-hdmi IP,
> I don't see why it doesn't work here...
>=20
> There is a bit called `Support Color Space Converter` in config0_id:
> bit	|	Name	|	R/W	|	Desc
> 2 	|	csc	| 	R 	|	Indicates if Color Space =
Conversion block is present
>=20
> Could you dump all the config0 bits:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D><=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c =
b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 54d8fdad395f..547731482da8 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3431,6 +3431,7 @@ struct dw_hdmi *dw_hdmi_probe(struct =
platform_device *pdev,
>        pdevinfo.id =3D PLATFORM_DEVID_AUTO;
>=20
>        config0 =3D hdmi_readb(hdmi, HDMI_CONFIG0_ID);
> +       dev_info(dev, "config0: %x\n", config0);
>        config3 =3D hdmi_readb(hdmi, HDMI_CONFIG3_ID);
>=20
>        if (iores && config3 & HDMI_CONFIG3_AHBAUDDMA) {
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D><=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> If this bit is missing, this would explain the black screen.

[    9.291011] dw-hdmi-ingenic 10180000.hdmi: config0: bf

Hm. Or is the color-space conversion of the sw-hdmi module inside the =
jz4780 broken
or not configured properly?

(cross-checked: RGB mode still works if I force hdmi->sink_is_hdmi =3D =
false)

BR and thanks,
Nikolaus

