Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5F59D4E40
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 15:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A4510E1D7;
	Thu, 21 Nov 2024 14:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GG1lvHex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9FB10E1D7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 14:04:57 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-38232cebb0cso668551f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 06:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732197896; x=1732802696;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CkzzeXPDV0OuvJPIPbzu0+X4+yJU9K+UT0DlmrNc6SA=;
 b=GG1lvHexND7hsQ1bRDRnXT2JKz0N9ULlWPqDcIBkmHJ+q9geNzc8tZeGIFIqhwhWkg
 i9r/z5J6hy1S/YpIJ8sOFlZQmIsvf1H6SrdIotuQs8n1tyz0GE6L/dmgnFfyKhkb2u1B
 W+cvFIal3MnmLkcxeJRNTxCYaElaN9s84AFsIN1LQioVFbWE5zRT4z9CY/MT4q69a7rf
 xKjMv4b5UL9k35wRP24vJYgYeRW40SFcVVvY06gAbKPprxmKA4O/Fvvq7apnLK5XYfym
 Uv1z0K03eDx9m55OWcTc3UVHQ6E9UufwJ5eY9omDPCmP51DiMhH1HI5+yqEm/f5JaeAE
 GQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732197896; x=1732802696;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CkzzeXPDV0OuvJPIPbzu0+X4+yJU9K+UT0DlmrNc6SA=;
 b=mAQechMHp89z6VxmaZovP9IC8udp34Auutc90+l5RY0ad+2fXxZFeLCMcmwV1T4+wt
 Ubh8P0xj9e5OU5aTojV5wap3ceIRdBLvbieDd2wTB/fYYn8CVmyNpjjViI5ozL1SpSjC
 JmxBdoaWmjctnuSi4R49e+7Hx3b3eA/q6ioF2ktGjZqUKG3drNduzMaq4t4UepVrngmX
 CjKqMvo8QJqhfEyfM0CsxHMXV4tFuGJNQS9LKw6ZQaE0U4Zdm8wEoBrd0ewoLjXZfLmu
 xjW/FH1euvSZEg1CE9+HGZClfDV6a7FQldYVqNpyKGGP4CgVJu9JwaWc8wt/2Ggpg2PU
 bE1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjJqLPgTsmL7+i7txLU2O4Vmyid+8sM8Mc1H+D6Xn2z8elXstuD09/ZpsDh1uXHS7fsIekCs2AqA0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMSjwjTjNN4xP+v8azODX0xdCptTv0ex3H+rgwythHnsvLfGg2
 7RW32XfcZt0tPzj69HlCN0Alrs9mmTDHrAl6tbYPM4uHEvLFtS5D/QRem9lDz0A=
X-Gm-Gg: ASbGnctuHepBPqgW4QNNowAnQ6fcf6ObYCEFA5TU4e370GrMYGQA8kQJmGn8ctnlyIn
 l34kA83JIDxmWRP8QkGCJy1waIcgxD+RaYOO6kvD3iy0xlTm7mRE4+sktSQ3uc0QfV582NzRetJ
 5+2RF+43V8oEvFzhVyvtL/qsUpyif0HBOvf8Z1G6sSWTC3JmrjSiPH2z7sdpZzxMDrTnEPYEXgk
 oWUaZ94kNtORSJO5rv5cLnO2XbA9JVgpGh/d5IGq3sWiCQIIh3lWoVRAvdPlnL1ks/sI3dyaq4n
 IFE=
X-Google-Smtp-Source: AGHT+IGOOsfIl1JAjgf7kDd5oywzOAtVaQvQvXfPLIcz9cDfRlZE0jlhvEPwC9EtW28TdNTPrOjdyg==
X-Received: by 2002:a5d:64c6:0:b0:382:442c:2c54 with SMTP id
 ffacd0b85a97d-38254afc65fmr5321357f8f.28.1732197894429; 
 Thu, 21 Nov 2024 06:04:54 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825490c29fsm5083350f8f.32.2024.11.21.06.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 06:04:53 -0800 (PST)
Date: Thu, 21 Nov 2024 15:04:52 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, 
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, 
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "simona@ffwll.ch" <simona@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>, 
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "hjc@rock-chips.com" <hjc@rock-chips.com>, "heiko@sntech.de" <heiko@sntech.de>,
 "andy.yan@rock-chips.com" <andy.yan@rock-chips.com>,
 William Qiu <william.qiu@starfivetech.com>, 
 Xingyu Wu <xingyu.wu@starfivetech.com>, "kernel@esmil.dk" <kernel@esmil.dk>, 
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, 
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/9] drm: bridge: inno-hdmi: add inno bridge driver.
Message-ID: <2ujegy7cw4kka4j6rrjf7fsigk7p4hw4rkitmp4rzt33qnlhv5@c6exsgaou5x7>
References: <20241120061848.196754-1-keith.zhao@starfivetech.com>
 <20241120061848.196754-4-keith.zhao@starfivetech.com>
 <oabm3ahd6vyeirjbbmp74w3tldqkcy3de7u6avio3ohfzfns2t@vfcvn3rl23xm>
 <NTZPR01MB10504FAE3695BF54DADB7B54EE22A@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aiaflkf5aq5b3zo3"
Content-Disposition: inline
In-Reply-To: <NTZPR01MB10504FAE3695BF54DADB7B54EE22A@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
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


--aiaflkf5aq5b3zo3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/9] drm: bridge: inno-hdmi: add inno bridge driver.
MIME-Version: 1.0

On Thu, Nov 21, 2024 at 02:06:20AM +0000, Keith Zhao wrote:
>=20
>=20
> > -----Original Message-----
> > From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> > Sent: 2024=E5=B9=B411=E6=9C=8820=E6=97=A5 22:56
> > To: Keith Zhao <keith.zhao@starfivetech.com>
> > Cc: devicetree@vger.kernel.org; dri-devel@lists.freedesktop.org;
> > andrzej.hajda@intel.com; neil.armstrong@linaro.org; rfoss@kernel.org;
> > Laurent.pinchart@ideasonboard.com; jernej.skrabec@gmail.com;
> > maarten.lankhorst@linux.intel.com; mripard@kernel.org;
> > tzimmermann@suse.de; airlied@gmail.com; simona@ffwll.ch;
> > robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > hjc@rock-chips.com; heiko@sntech.de; andy.yan@rock-chips.com; William Q=
iu
> > <william.qiu@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>;
> > kernel@esmil.dk; paul.walmsley@sifive.com; palmer@dabbelt.com;
> > aou@eecs.berkeley.edu; p.zabel@pengutronix.de; Changhuang Liang
> > <changhuang.liang@starfivetech.com>; Jack Zhu <jack.zhu@starfivetech.co=
m>;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v5 3/9] drm: bridge: inno-hdmi: add inno bridge dri=
ver.
> >=20
> > Hello,
> >=20
> > On Wed, Nov 20, 2024 at 02:18:42PM +0800, keith zhao wrote:
> > > +struct platform_driver inno_hdmi_driver =3D {
> > > +	.probe  =3D inno_hdmi_rockchip_probe,
> > > +	.remove_new =3D inno_hdmi_rockchip_remove,
> >=20
> > Please use .remove instead of .remove_new.
> >=20
> Thank you for the clarification regarding .remove_new.=20
> I understand that it's a relic and that new drivers should implement .rem=
ove().
>=20
> I have a question. One of the changes in this patch is to rename some fun=
ction interfaces.=20
> The original code is like this.=20
>=20
> struct platform_driver inno_hdmi_driver =3D {
> 	.probe  =3D inno_hdmi_probe,
> 	.remove_new =3D inno_hdmi_remove,
> 	.driver =3D {
> 		.name =3D "innohdmi-rockchip",
> 		.of_match_table =3D inno_hdmi_dt_ids,
> 	},
> };
>=20
> Rename inno_hdmi_probe and inno_hdmi_remove
> struct platform_driver inno_hdmi_driver =3D {
> 	.probe  =3D inno_hdmi_rockchip_probe,
> 	.remove_new =3D inno_hdmi_rockchip_remove,
> 	.driver =3D {
> 		.name =3D "innohdmi-rockchip",
> 		.of_match_table =3D inno_hdmi_dt_ids,
> 	},
> };
> Based on the principle of maintaining consistency,=20
> does it(remove_new) need to be changed?

If this isn't new code but moving from somewhere, don't change
=2Eremove_new into .remove in the same patch. If you want, fix that in a
separate patch then.

Best regards
Uwe

--aiaflkf5aq5b3zo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmc/PfgACgkQj4D7WH0S
/k5i8wf/XcvUCC2rVJqEZtMZvKrDI/ZGnH8FSDI5ZF6TzlFZ2mmT+IW/9fosKPzw
XThFPhs4q3eRJZEujqjr+ChJ7LAlLRWGFuEQtogLtwLs6PjwEtyjGNrwGbaMwGDu
GVjtp1zsGgG7utTfoUsrvnoj9ZYCMmdiHM/gwUiBMGusJHgpSRTD2M4bIAbduV8m
U6vO11pTdh0KSZgBHp4Rpj814BVjTU3prIDttOs/k9Qhq4B05ZAIOXYig/+g1k56
o+cMqaeeXMHNLE13BKRg37xkzfr4+lQX1RmfX1laQXEUhxO9Fzumyh3+NYgqZ3Rf
2JaY8G8iTmPnrSNSVtdrzpmI8Ad7OQ==
=3HIb
-----END PGP SIGNATURE-----

--aiaflkf5aq5b3zo3--
