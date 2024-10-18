Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889229A3F38
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 15:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F83F10E913;
	Fri, 18 Oct 2024 13:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="OrqihEER";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="l4abCq4G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63EF10E913
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 13:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1729257180; x=1760793180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xrzeEoBsCionoKUR266fpAo3BaG9LZtKR8xkrwhis4I=;
 b=OrqihEERv6KkH9Q43iTvx5STt7IoUcFRHJcfGdgOGh3nKt0eaklPD++C
 Q3mpbUhppvGVQAcyyMikAxA0SIviMPiIZwjk26Gcqhoh69VQ4oC/v/ij3
 mdh8ZAuK/iEnH9O/RFuD3l5UyTEfM6+RGUeXZnPuUEizh8ptbE9TSHIMm
 jUCnNoM5Au/Kj4huRttUjDc1L/itMVNs4eb2NCK5sKDgnzNc7Y/tVQrTK
 z3Nzk9GNBlx1Gy98salSUVt71+sq4ZuVaJJNMHhP/mfvMTv+tNGKwVLNw
 9nQXOQQuwuiD7KgkHt5CmIdrbpmFNgJRoiVNfnC33fqe3WIHq/e2Ks5F8 Q==;
X-CSE-ConnectionGUID: 3KoUDJEnQRaRloi9VBQ63A==
X-CSE-MsgGUID: NPQH+y/pSTScykETWFj9YQ==
X-IronPort-AV: E=Sophos;i="6.11,213,1725314400"; d="scan'208";a="39543900"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 18 Oct 2024 15:12:58 +0200
X-CheckPoint: {67125EDA-9-BD84CFBF-E7C15A70}
X-MAIL-CPID: 1966C4EF9B0FB9E0C3310EAEA66099E9_3
X-Control-Analysis: str=0001.0A682F19.67125EDA.0060, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AB87F16ACBC; Fri, 18 Oct 2024 15:12:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1729257173;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xrzeEoBsCionoKUR266fpAo3BaG9LZtKR8xkrwhis4I=;
 b=l4abCq4GzoqmZ9BJX3njeI/FwjZI05uwLBz+mQMuGVbCBcbm1vRsJbUvYSO5vvavbmWhEv
 y38ZqQMrSpXDdl5nfXYT/JHFBzztTs0+BGKJtB9TRP8jNwct3OJ9BGPLlxMHQ1nzO+uSHY
 jW9NvLXRt1L/k40SMmI0ImpPm8H38zP7b5Z7XVkCk3kS16WZnpnoRaHh4qSSAYXxmc0YCj
 H7nii7oha2YVtDLjD33iRrAzwTQHHLIjVaVBh6G8uWt63MyibvhKD5GUYIZfI3gEY9CsBw
 /LumWuZE7UPbJBgSvdhgHmK6/uEGDhg9kGk6WHA9AhAxqiQ2JZRqA/LO6JWM2g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 marex@denx.de, stefan@agner.ch, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 4/5] drm/bridge: imx8mp-hdmi-tx: Set output_port to 1
Date: Fri, 18 Oct 2024 15:12:49 +0200
Message-ID: <5035853.0VBMTVartN@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <vvsj6ri2ke25nzocbq736yv7rphzma6pn3yk2uh7iu43zfe2sa@2fwye4k4w6he>
References: <20241018064813.2750016-1-victor.liu@nxp.com>
 <20241018064813.2750016-5-victor.liu@nxp.com>
 <vvsj6ri2ke25nzocbq736yv7rphzma6pn3yk2uh7iu43zfe2sa@2fwye4k4w6he>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Am Freitag, 18. Oktober 2024, 14:31:20 CEST schrieb Dmitry Baryshkov:
> On Fri, Oct 18, 2024 at 02:48:12PM +0800, Liu Ying wrote:
> > Set DW HDMI platform data's output_port to 1 in imx8mp_dw_hdmi_probe()
> > so that dw_hdmi_probe() called by imx8mp_dw_hdmi_probe() can tell the
> > DW HDMI bridge core driver about the output port we are using, hence
> > the next bridge can be found in dw_hdmi_parse_dt() according to the port
> > index, and furthermore the next bridge can be attached to bridge chain =
in
> > dw_hdmi_bridge_attach() when the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is
> > set.  The output_port value aligns to the value used by devicetree.
> > This is a preparation for making the i.MX8MP LCDIF driver use
> > drm_bridge_connector which requires the DRM_BRIDGE_ATTACH_NO_CONNECTOR
> > flag.
> >=20
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/=
drm/bridge/imx/imx8mp-hdmi-tx.c
> > index 8fcc6d18f4ab..54a53f96929a 100644
> > --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > @@ -96,6 +96,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_devic=
e *pdev)
> >  		return dev_err_probe(dev, PTR_ERR(hdmi->pixclk),
> >  				     "Unable to get pixel clock\n");
> > =20
> > +	plat_data->output_port =3D 1;
>=20
> This will break compatibility with older DT files, which don't have
> output port. I think you need to add output_port_optional flag to
> dw_hdmi_plat_data and still return 0 from dw_hdmi_parse_dt() if the flag
> is set, but there is no remote node.
>=20
> Last, but not least, this changes behaviour of the connector.
> dw_hdmi_connector_create() implements CEC support, handles
> ycbcr_420_allowed, HDR metadata, etc.

Mh, I was suspecting the same, but I couldn't see any regression regarding =
CEC.
Maybe the change is not doing what it is supposed to do...
I'll check again on Monday.

Best regards,
Alexander

> We are slowly moving towards the supporting all of this in bridge
> connector via the HDMI Connector framework, but this is not
> implemented for now.
>=20
> >  	plat_data->mode_valid =3D imx8mp_hdmi_mode_valid;
> >  	plat_data->phy_ops =3D &imx8mp_hdmi_phy_ops;
> >  	plat_data->phy_name =3D "SAMSUNG HDMI TX PHY";
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


