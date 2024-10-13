Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C1199B90E
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2024 12:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E81F10E048;
	Sun, 13 Oct 2024 10:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FWCt9peW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010005.outbound.protection.outlook.com [52.101.229.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F7310E048
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 10:27:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYUj8r6yKPCXUmW1hddeeBW/MyxOHtknCH4ihVYSDKmbO4Uptm89UmwBxAMwxN3m9lQbbMMs1K8MdkkIZ0qAl0N6fWdmGLOiJlWs0mLf93+7/EKLUXyTMCCOrCH6SHArfYb3qglue/HPzSc1ZfXLGzhwMmBjCrSuhWmIQlmpSGnfG5cG6xXt3ntsfu5IJ+sJ4o6WTNWyRZMM7BytNG1n8ELhupRMsIW0HEIQFgSRcu8C0qdKblQl75H0OvLV04utcPSOYKrlqU3B+vIuFgI6mg1YKUAE1eOxUIeSAkL0Wt7u92ggM1Sfrqs2Xgl5V3jYriJj3zrRBK55Xcle1rKPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pocAqRIJBh5Ea9u/EVygTiUmdUEqFv8bEPr8DHY3x7w=;
 b=nwaY6CsRYslCzu29Jz7VA6HnPZxKQRGkrEhd6rhLTKDpnvY5hRFF0OpmlJGIhbDLf1VxqtKb2Di4Ki3c83sSJqqO3YHiAJueKjdrz0c6d05X8cD/U87zt1wo03f0ZTPvBdT99DyxKTJjGtO3YU7xO5PNfaEqGmJXlO3vl5Bpt+Nn+1UiKFKgs+G0yEMvmJDcDtaaokHg5LEYJVr3F+707bpbmR3MUpXD3WptXVqX2zaldlkonPBxW+Jx/DLcjd/d4gAszYJCMmVCZsd/k+rdWCGYaQyHXzDBbbgaFPDXLQq6V1bZFAyP2/HR09lFgEsbW3NorULGOHrxweZ06PXYAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pocAqRIJBh5Ea9u/EVygTiUmdUEqFv8bEPr8DHY3x7w=;
 b=FWCt9peWd8jHnBfqYktn5xRhMpaDJwlPah1lhQacClpHCUxM6PhEanyKJmGpdVajG8thUq+SAtAQ/yk4Z+93c5qjy0Ln9LYSj/I1NdF2PTFW15gzzG6LKztwqssyXq6Nn2wnq8lrbKDnc24+3uE1TzWequWGmKLO1v6xhdfLxoM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11558.jpnprd01.prod.outlook.com (2603:1096:400:37e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Sun, 13 Oct
 2024 10:27:48 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8048.020; Sun, 13 Oct 2024
 10:27:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Liu Ying
 <victor.liu@nxp.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se"
 <jonas@kwiboo.se>, "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
 <will@kernel.org>, "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>, "arnd@arndb.de"
 <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, "y.moog@phytec.de"
 <y.moog@phytec.de>, "marex@denx.de" <marex@denx.de>,
 "isaac.scott@ideasonboard.com" <isaac.scott@ideasonboard.com>
Subject: RE: [PATCH v2 6/9] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Thread-Topic: [PATCH v2 6/9] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Thread-Index: AQHbHHmjKrSxUtUM4UujDkcK4B2m5bKCzRuAgAGr0QA=
Date: Sun, 13 Oct 2024 10:27:39 +0000
Message-ID: <TY3PR01MB1134691372F08F04BC4404A7F867B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-7-victor.liu@nxp.com>
 <cr24b75meaq25dcs35rffzmyrfu44sajy7r6jilyvavsbs6guw@ncr7rvu2yyft>
In-Reply-To: <cr24b75meaq25dcs35rffzmyrfu44sajy7r6jilyvavsbs6guw@ncr7rvu2yyft>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11558:EE_
x-ms-office365-filtering-correlation-id: dad91bde-5616-454a-6bda-08dceb71a9f3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PXsEHfUIiNaqOugr81GIgKBVdd9UrjE7makyB3JVzhBw+5dNqH9MJbVBTXuZ?=
 =?us-ascii?Q?G4CMgi/CEZkswBALNLfMxcHpLkWFcp//dOimQVxqXNvpzey7Rf51Q8KB25dN?=
 =?us-ascii?Q?xQxw7mqjnIa4E9qgscq3mvCk3ayT5YhjT2fXYhIe/+/b22dX0x7/4syhJEWl?=
 =?us-ascii?Q?Ure5mAAcyTpOaYe2P+/qcgdgT0lDv/ICaJYb6DkUL6lubrWiVxeEjtQWO/7i?=
 =?us-ascii?Q?Am6n6fLdqFm4SIeIlkTVr7ey/6htWLN1XN7t+ldq/R7bvgKbWezdP6CZ+WQl?=
 =?us-ascii?Q?kfBtzN44/X3dmqJtRadYlAVmaLodEyN65olI3/HPqSmvvSn8wcgFKOOohdoO?=
 =?us-ascii?Q?R2V0CU7+MrC83aSNrKPDIW24zn1RZbNKQrQuxQgMoNiq4FpLlcPVb5ZeviCD?=
 =?us-ascii?Q?XprDiYHAt9uzhJFRzpCEtjkuDC1swt2udjgJw2MbdPiTXXkZd5Hyk+S00n6a?=
 =?us-ascii?Q?kY3zQeEdS8IOOcJQXfDL91uLBhviX2sRHSATpZw0fIyhqlZ4UdLrg+dJnI+n?=
 =?us-ascii?Q?Ium8VW60cpOqkwDBTykCUQmjtvcUG/oW9EvfPJ6D2B1CQR2lVCN/TU2E3gFe?=
 =?us-ascii?Q?K2p1bilkh0qwZ4pG0gC0uegTV6ipvI+chO2N+0kFw2mBg9mJgnu7CDg97K8P?=
 =?us-ascii?Q?XrzrB6NjVmSeYLUN70eRfOJ0He0GuRHbj0Oj65f76Abe/vJtRMqRecR1AnmT?=
 =?us-ascii?Q?ZGK+ss5tzcGC7aEQAmcWFU14DGuKzcIfjrsPWBnbQrFFITX1Ry8CLqjA7qO8?=
 =?us-ascii?Q?IXq8zEThwN/RmQ3lpgz64ZGUWDAN+4i/5hykdiFrreqdixVYNgQrJo22etyZ?=
 =?us-ascii?Q?UpmAgE5pLN2IxT6j5vg673LR6HsIni+6171grYov25VYnCnKtv1Mk7pG/p7/?=
 =?us-ascii?Q?c1otlVCR7Ja3osTjCzYCGjVjJER7uJboA4dd1NhASvGgx/mSnlRfHxb4iL3T?=
 =?us-ascii?Q?prtSPsCVpRzO73wWUmPgGFgPTq7fuXpLaRSoRgus1dVCSpbn/41EsDL2B50T?=
 =?us-ascii?Q?n18uXx2pln4vf4Cj+mQ/F3Cta5zkt8nmQE0PkNEh708QQtu/i8hEuH7ZNLpZ?=
 =?us-ascii?Q?ttJFXjhvoJwygtiwO+DVCXhmhceign3QFmS84wtHmi7rlU19mMxk8CmUlnSt?=
 =?us-ascii?Q?1XlGYnz2xVxerWvtBy9/dCdS2f4B/CSyORzNWxx6eZ7LFKGLFkfR1VZsvH2k?=
 =?us-ascii?Q?L4GviW4qVMtiUJ4TPmxvoV2nHkc62FfK0bzZXwjEWMS8zePPomLiv77wYhqH?=
 =?us-ascii?Q?3MfuGZ8N98tmC0m6+DvQgFnwvfhswBN+XT+bGkgFpku7dP33IwKkM819NkSe?=
 =?us-ascii?Q?MvFNkGOMTEeK59uZU2NBAehhpyy01ziLoo1wSu/7Tm0cag=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lO5FtHWRC0s3/gZbnsYOUkVic2x2OaPdHj4mOgVIpmhDUryH1EfR97728UcO?=
 =?us-ascii?Q?kctdKREgmmm97COmACqXJpiFVZLsnS0HGSLrx1RPkllMtUCYhXk4iDOB8rnq?=
 =?us-ascii?Q?6XWHqpWuObp+2gArk5BpM8v82cNT2WxQzLlWGq6n7HyGIDqA3NzP95Qqs47e?=
 =?us-ascii?Q?vwo3lN5iICfBieNWtf3fqkgjiODLECFISfho30UnjgtW26vyawea1WVSLAQ/?=
 =?us-ascii?Q?oVzfMJQeb8KoRR36yG/e/bverxunqP+ThZp87BT3oqKi+I3WUJUM4OAesydu?=
 =?us-ascii?Q?Fvyo5lHZgeWcVpS+SgYJLkeoH29r/N3l7bB8QymWisS0pXoLAkeo2bP8f6rC?=
 =?us-ascii?Q?znGi31FBm9nNnsPKX0yUC9eUxZ3NhFgSwhhfosqRK/I7UN3Qo4wtm+A6UKg7?=
 =?us-ascii?Q?pvAgqDEAV7UMUJyk+NNkH4L0fMztIvshFHDvlO9bDHml6TKLfL87kSLC2Obo?=
 =?us-ascii?Q?WRIIqueE1MQBb2mullrHxbot4QffEt8/mY2osQG0iytslVPOuUj7ohJJ9Kw+?=
 =?us-ascii?Q?4TcvhIyVQSfQvAJaeGvJTNiBrWaRxaiqSymvNl0PffPqCw1SuQLHJdNnZA3x?=
 =?us-ascii?Q?o8FSwbhjuMXo5ht4RFogQ+X5jFQermrHZD76ejSbAxxGyM34SA+EHhqp+8oy?=
 =?us-ascii?Q?X2Nd0e5tp2JQX4uzGB7X7KfG82b5l2rPvKuJ4cR2zdR2mxlwK0FbbJD0lnos?=
 =?us-ascii?Q?heiFOYVEfd86ojjse2pBAqsds0TLckiZrcwLlszH55FizyumLJ6PVpbH6H8V?=
 =?us-ascii?Q?sQO+1+aJRwWVrJuuIqfbwI3Gpy06li5AEriU1ClfruVpJchO6uYlKPG8jRMV?=
 =?us-ascii?Q?jWx3hdBN0S3vUMM1TnxymHddXFVvJSZ6l0KgCmftXbQQxzvBQjBafx9wUa9k?=
 =?us-ascii?Q?2US7e+ukFD5FRNO7oaGb+eDlSk0fnvJsSO/FOdohaowwuG7poAyq8yFYfm4Q?=
 =?us-ascii?Q?UUQm95YnNZGUs/enyKHISLIFtxwLVhTi8M8WxpkUVKnCjjLBQcFCzVKkelOd?=
 =?us-ascii?Q?05KwCXBToIaiQDq18/GriDMK7LECwD5AG/EaDyT+jn2hkrko1J03ReqjF0fU?=
 =?us-ascii?Q?ibMdnsbzqKuiUitIKcoOVEuCQDYU7OoW6ZhS3UpVJiT+Oy7bEnVPDNiaEqY7?=
 =?us-ascii?Q?uHRZzh08tVkmZiJTOTYnz+Hzm5IgMy1O8XVOcF3rJqXjOR0CjdkDro7EklkP?=
 =?us-ascii?Q?tACK7QnrPe9rDDxY3QvZ5SRx0ySjWtaEAfBuQq3wTkA9NS710uaLSodp2cPS?=
 =?us-ascii?Q?lPyLJgGks843ZvY4ZJaJ5ED51zqOmEOmh65ocfI0o2b5jlZRuaaVfUhUgHcX?=
 =?us-ascii?Q?3aYGiOH+ytqmPUz30YeNLokvckrsx62imMBqnj+eyaRdvuTKt377flnTeLdq?=
 =?us-ascii?Q?hUMLsc9Cmsq4ZEpxwb/jaY3vJTPKbDqhLtZYghrz2u8jPXfjL9qn8SXZ8IPY?=
 =?us-ascii?Q?nWt+rRi9R+So3GL/9hHsmek8y3TJHJwQlzGPgnoz9PxwcRQ+yJx/JTQPIQ/F?=
 =?us-ascii?Q?HHqwRfSfQrtZUFMDX8gnGwWUcfOjnkUJnVw44O4qlKY3YTHPopro4qT2me3K?=
 =?us-ascii?Q?RjXaksPT7NtNSWp+0ecTPW10ECKkcO4WZbHojFfpsu8KcohNFGgCm89MFVq8?=
 =?us-ascii?Q?Dw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dad91bde-5616-454a-6bda-08dceb71a9f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2024 10:27:39.4786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CjkPwqB6uMvUTijQYZ2iCW7Y13rE6LsIcZfEO54au/sTd81NViCO4lnQblpDSUogJUaWKjdKMOme75sn0TbhS5GQGVLhmtFiBmOm2cBdvAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11558
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

Hi Dmitry Baryshkov,

> -----Original Message-----
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Sent: Saturday, October 12, 2024 9:45 AM
> Subject: Re: [PATCH v2 6/9] drm/bridge: Add ITE IT6263 LVDS to HDMI conve=
rter
>=20
> On Sat, Oct 12, 2024 at 03:35:40PM +0800, Liu Ying wrote:
> > Add basic HDMI video output support. Currently, only RGB888 output
> > pixel format is supported.  At the LVDS input side, the driver
> > supports single LVDS link and dual LVDS links with "jeida-24" LVDS
> > mapping.
> >
> > Product link:
> > https://www.ite.com.tw/en/product/cate1/IT6263
> >
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v2:
> > * Add AVI inforframe support.  (Maxime)
>=20
> Maxime asked to wire up the HDMI Connector framework. I have pushed the p=
atch that converts lt9611.c
> driver. Please implement similar changes in your driver.
>=20
> > * Add DRM_MODE_CONNECTOR_HDMIA.  (Biju)
> > * Rename it6263_reset() to it6263_hw_reset().  (Biju)
> > * Check number of LVDS link data lanes.  (Biju)
> >
> >  drivers/gpu/drm/bridge/Kconfig      |   8 +
> >  drivers/gpu/drm/bridge/Makefile     |   1 +
> >  drivers/gpu/drm/bridge/ite-it6263.c | 919
> > ++++++++++++++++++++++++++++
> >  3 files changed, 928 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig
> > b/drivers/gpu/drm/bridge/Kconfig index 3eb955333c80..93f99682a090
> > 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -90,6 +90,14 @@ config DRM_FSL_LDB
> >  	help
> >  	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
> >
> > +config DRM_ITE_IT6263
> > +	tristate "ITE IT6263 LVDS/HDMI bridge"
> > +	depends on OF
> > +	select DRM_KMS_HELPER
> > +	select REGMAP_I2C
> > +	help
> > +	  ITE IT6263 LVDS to HDMI bridge chip driver.
> > +
> >  config DRM_ITE_IT6505
> >  	tristate "ITE IT6505 DisplayPort bridge"
> >  	depends on OF
> > diff --git a/drivers/gpu/drm/bridge/Makefile
> > b/drivers/gpu/drm/bridge/Makefile index 7df87b582dca..f3776dd473fd
> > 100644
> > --- a/drivers/gpu/drm/bridge/Makefile
> > +++ b/drivers/gpu/drm/bridge/Makefile
> > @@ -6,6 +6,7 @@ obj-$(CONFIG_DRM_CHRONTEL_CH7033) +=3D chrontel-ch7033.=
o
> >  obj-$(CONFIG_DRM_CROS_EC_ANX7688) +=3D cros-ec-anx7688.o
> >  obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) +=3D display-connector.o
> >  obj-$(CONFIG_DRM_FSL_LDB) +=3D fsl-ldb.o
> > +obj-$(CONFIG_DRM_ITE_IT6263) +=3D ite-it6263.o
> >  obj-$(CONFIG_DRM_ITE_IT6505) +=3D ite-it6505.o
> >  obj-$(CONFIG_DRM_LONTIUM_LT8912B) +=3D lontium-lt8912b.o
> >  obj-$(CONFIG_DRM_LONTIUM_LT9211) +=3D lontium-lt9211.o diff --git
> > a/drivers/gpu/drm/bridge/ite-it6263.c
> > b/drivers/gpu/drm/bridge/ite-it6263.c
> > new file mode 100644
> > index 000000000000..9b3318792f15
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> > @@ -0,0 +1,919 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright 2024 NXP
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/hdmi.h>
> > +#include <linux/i2c.h>
> > +#include <linux/media-bus-format.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_atomic_state_helper.h> #include <drm/drm_bridge.h>
> > +#include <drm/drm_connector.h> #include <drm/drm_crtc.h> #include
> > +<drm/drm_edid.h> #include <drm/drm_of.h> #include
> > +<drm/drm_probe_helper.h>
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * LVDS registers
> > + */
> > +
> > +/* LVDS software reset registers */
> > +#define LVDS_REG_05			0x05
> > +#define  REG_SOFT_P_RST			BIT(1)
> > +
> > +/* LVDS system configuration registers */
> > +/* 0x0b */
> > +#define LVDS_REG_0B			0x0b
> > +#define  REG_SSC_PCLK_RF		BIT(0)
> > +#define  REG_LVDS_IN_SWAP		BIT(1)
> > +
> > +/* LVDS test pattern gen control registers */
> > +/* 0x2c */
> > +#define LVDS_REG_2C			0x2c
> > +#define  REG_COL_DEP			GENMASK(1, 0)
> > +#define  BIT8				FIELD_PREP(REG_COL_DEP, 2)
> > +#define  OUT_MAP			BIT(4)
> > +#define  JEIDA				0
> > +#define  REG_DESSC_ENB			BIT(6)
> > +#define  DMODE				BIT(7)
> > +#define  DISO				BIT(7)
> > +#define  SISO				0
> > +
> > +#define LVDS_REG_3C			0x3c
> > +#define LVDS_REG_3F			0x3f
> > +#define LVDS_REG_47			0x47
> > +#define LVDS_REG_48			0x48
> > +#define LVDS_REG_4F			0x4f
> > +#define LVDS_REG_52			0x52
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * HDMI registers are separated into three banks:
> > + * 1) HDMI register common bank: 0x00 ~ 0x2f  */
> > +
> > +/* HDMI genernal registers */
> > +#define HDMI_REG_SW_RST			0x04
> > +#define  SOFTREF_RST			BIT(5)
> > +#define  SOFTA_RST			BIT(4)
> > +#define  SOFTV_RST			BIT(3)
> > +#define  AUD_RST			BIT(2)
> > +#define  HDCP_RST			BIT(0)
> > +#define  HDMI_RST_ALL			(SOFTREF_RST | SOFTA_RST | SOFTV_RST | \
> > +					 AUD_RST | HDCP_RST)
> > +
> > +#define HDMI_REG_SYS_STATUS		0x0e
> > +#define  HPDETECT			BIT(6)
> > +#define  TXVIDSTABLE			BIT(4)
> > +
> > +#define HDMI_REG_BANK_CTRL		0x0f
> > +#define  REG_BANK_SEL			BIT(0)
> > +
> > +/* HDMI System DDC control registers */
> > +#define HDMI_REG_DDC_MASTER_CTRL	0x10
> > +#define  MASTER_SEL_HOST		BIT(0)
> > +
> > +#define HDMI_REG_DDC_HEADER		0x11
> > +
> > +#define HDMI_REG_DDC_REQOFF		0x12
> > +#define HDMI_REG_DDC_REQCOUNT		0x13
> > +#define HDMI_REG_DDC_EDIDSEG		0x14
> > +
> > +#define HDMI_REG_DDC_CMD		0x15
> > +#define  DDC_CMD_EDID_READ		0x3
> > +#define  DDC_CMD_FIFO_CLR		0x9
> > +
> > +#define HDMI_REG_DDC_STATUS		0x16
> > +#define  DDC_DONE			BIT(7)
> > +#define  DDC_NOACK			BIT(5)
> > +#define  DDC_WAITBUS			BIT(4)
> > +#define  DDC_ARBILOSE			BIT(3)
> > +#define  DDC_ERROR			(DDC_NOACK | DDC_WAITBUS | DDC_ARBILOSE)
> > +
> > +#define HDMI_DDC_FIFO_BYTES		32
> > +#define HDMI_REG_DDC_READFIFO		0x17
> > +#define HDMI_REG_LVDS_PORT		0x1d /* LVDS input control I2C addr */
> > +#define HDMI_REG_LVDS_PORT_EN		0x1e
> > +#define LVDS_INPUT_CTRL_I2C_ADDR	0x33
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * 2) HDMI register bank0: 0x30 ~ 0xff  */
> > +
> > +/* HDMI AFE registers */
> > +#define HDMI_REG_AFE_DRV_CTRL		0x61
> > +#define  AFE_DRV_PWD			BIT(5)
> > +#define  AFE_DRV_RST			BIT(4)
> > +
> > +#define HDMI_REG_AFE_XP_CTRL		0x62
> > +#define  AFE_XP_GAINBIT			BIT(7)
> > +#define  AFE_XP_ER0			BIT(4)
> > +#define  AFE_XP_RESETB			BIT(3)
> > +
> > +#define HDMI_REG_AFE_ISW_CTRL		0x63
> > +
> > +#define HDMI_REG_AFE_IP_CTRL		0x64
> > +#define  AFE_IP_GAINBIT			BIT(7)
> > +#define  AFE_IP_ER0			BIT(3)
> > +#define  AFE_IP_RESETB			BIT(2)
> > +
> > +/* HDMI input data format registers */
> > +#define HDMI_REG_INPUT_MODE		0x70
> > +#define  IN_RGB				0x00
> > +
> > +/* HDMI general control registers */
> > +#define HDMI_REG_HDMI_MODE		0xc0
> > +#define  TX_HDMI_MODE			BIT(0)
> > +
> > +#define HDMI_REG_GCP			0xc1
> > +#define  AVMUTE				BIT(0)
> > +#define  HDMI_COLOR_DEPTH		GENMASK(6, 4)
> > +#define  HDMI_COLOR_DEPTH_24		FIELD_PREP(HDMI_COLOR_DEPTH, 4)
> > +
> > +#define HDMI_REG_PKT_GENERAL_CTRL	0xc6
> > +#define  ENABLE_PKT			BIT(0)
> > +#define  REPEAT_PKT			BIT(1)
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * 3) HDMI register bank1: 0x130 ~ 0x1ff (HDMI packet registers)  */
> > +
> > +/* AVI packet registers */
> > +#define HDMI_REG_AVI_DB1		0x158
> > +#define HDMI_REG_AVI_DB2		0x159
> > +#define HDMI_REG_AVI_DB3		0x15a
> > +#define HDMI_REG_AVI_DB4		0x15b
> > +#define HDMI_REG_AVI_DB5		0x15c
> > +#define HDMI_REG_AVI_CSUM		0x15d
> > +#define HDMI_REG_AVI_DB6		0x15e
> > +#define HDMI_REG_AVI_DB7		0x15f
> > +#define HDMI_REG_AVI_DB8		0x160
> > +#define HDMI_REG_AVI_DB9		0x161
> > +#define HDMI_REG_AVI_DB10		0x162
> > +#define HDMI_REG_AVI_DB11		0x163
> > +#define HDMI_REG_AVI_DB12		0x164
> > +#define HDMI_REG_AVI_DB13		0x165
> > +
> > +#define HDMI_AVI_DB_CHUNK1_SIZE		(HDMI_REG_AVI_DB5 - HDMI_REG_AVI_DB1 =
+ 1)
> > +#define HDMI_AVI_DB_CHUNK2_SIZE		(HDMI_REG_AVI_DB13 - HDMI_REG_AVI_DB6=
 + 1)
> > +
> > +#define MAX_PIXEL_CLOCK_KHZ		150000
> > +#define HIGH_PIXEL_CLOCK_KHZ		80000
> > +
> > +struct it6263 {
> > +	struct device *dev;
> > +	struct i2c_client *hdmi_i2c;
> > +	struct i2c_client *lvds_i2c;
> > +	struct regmap *hdmi_regmap;
> > +	struct regmap *lvds_regmap;
> > +	struct drm_bridge bridge;
> > +	struct drm_bridge *next_bridge;
> > +	struct drm_connector connector;
> > +	struct gpio_desc *reset_gpio;
> > +	u8 lvds_link_num_dlanes;
> > +	bool lvds_dual_link;
> > +	bool lvds_link12_swap;
> > +};
> > +
> > +static inline struct it6263 *bridge_to_it6263(struct drm_bridge
> > +*bridge) {
> > +	return container_of(bridge, struct it6263, bridge); }
> > +
> > +static inline struct it6263 *connector_to_it6263(struct drm_connector
> > +*conn) {
> > +	return container_of(conn, struct it6263, connector); }
> > +
> > +static bool it6263_hdmi_writeable_reg(struct device *dev, unsigned
> > +int reg) {
> > +	switch (reg) {
> > +	case HDMI_REG_SW_RST:
> > +	case HDMI_REG_BANK_CTRL:
> > +	case HDMI_REG_DDC_MASTER_CTRL:
> > +	case HDMI_REG_DDC_HEADER:
> > +	case HDMI_REG_DDC_REQOFF:
> > +	case HDMI_REG_DDC_REQCOUNT:
> > +	case HDMI_REG_DDC_EDIDSEG:
> > +	case HDMI_REG_DDC_CMD:
> > +	case HDMI_REG_LVDS_PORT:
> > +	case HDMI_REG_LVDS_PORT_EN:
> > +	case HDMI_REG_AFE_DRV_CTRL:
> > +	case HDMI_REG_AFE_XP_CTRL:
> > +	case HDMI_REG_AFE_ISW_CTRL:
> > +	case HDMI_REG_AFE_IP_CTRL:
> > +	case HDMI_REG_INPUT_MODE:
> > +	case HDMI_REG_HDMI_MODE:
> > +	case HDMI_REG_GCP:
> > +	case HDMI_REG_PKT_GENERAL_CTRL:
> > +	case HDMI_REG_AVI_DB1:
> > +	case HDMI_REG_AVI_DB2:
> > +	case HDMI_REG_AVI_DB3:
> > +	case HDMI_REG_AVI_DB4:
> > +	case HDMI_REG_AVI_DB5:
> > +	case HDMI_REG_AVI_CSUM:
> > +	case HDMI_REG_AVI_DB6:
> > +	case HDMI_REG_AVI_DB7:
> > +	case HDMI_REG_AVI_DB8:
> > +	case HDMI_REG_AVI_DB9:
> > +	case HDMI_REG_AVI_DB10:
> > +	case HDMI_REG_AVI_DB11:
> > +	case HDMI_REG_AVI_DB12:
> > +	case HDMI_REG_AVI_DB13:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> > +static bool it6263_hdmi_readable_reg(struct device *dev, unsigned int
> > +reg) {
> > +	if (it6263_hdmi_writeable_reg(dev, reg))
> > +		return true;
> > +
> > +	switch (reg) {
> > +	case HDMI_REG_SYS_STATUS:
> > +	case HDMI_REG_DDC_STATUS:
> > +	case HDMI_REG_DDC_READFIFO:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> > +static bool it6263_hdmi_volatile_reg(struct device *dev, unsigned int
> > +reg) {
> > +	switch (reg) {
> > +	case HDMI_REG_SW_RST:
> > +	case HDMI_REG_SYS_STATUS:
> > +	case HDMI_REG_DDC_STATUS:
> > +	case HDMI_REG_DDC_READFIFO:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> > +static const struct regmap_range_cfg it6263_hdmi_range_cfg =3D {
> > +	.range_min =3D 0x00,
> > +	.range_max =3D HDMI_REG_AVI_DB13,
> > +	.selector_reg =3D HDMI_REG_BANK_CTRL,
> > +	.selector_mask =3D REG_BANK_SEL,
> > +	.selector_shift =3D 0,
> > +	.window_start =3D 0x00,
> > +	.window_len =3D 0x100,
> > +};
> > +
> > +static const struct regmap_config it6263_hdmi_regmap_config =3D {
> > +	.name =3D "it6263-hdmi",
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.writeable_reg =3D it6263_hdmi_writeable_reg,
> > +	.readable_reg =3D it6263_hdmi_readable_reg,
> > +	.volatile_reg =3D it6263_hdmi_volatile_reg,
> > +	.max_register =3D HDMI_REG_AVI_DB13,
> > +	.ranges =3D &it6263_hdmi_range_cfg,
> > +	.num_ranges =3D 1,
> > +	.cache_type =3D REGCACHE_MAPLE,
> > +};
> > +
> > +static bool it6263_lvds_writeable_reg(struct device *dev, unsigned
> > +int reg) {
> > +	switch (reg) {
> > +	case LVDS_REG_05:
> > +	case LVDS_REG_0B:
> > +	case LVDS_REG_2C:
> > +	case LVDS_REG_3C:
> > +	case LVDS_REG_3F:
> > +	case LVDS_REG_47:
> > +	case LVDS_REG_48:
> > +	case LVDS_REG_4F:
> > +	case LVDS_REG_52:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> > +static bool it6263_lvds_readable_reg(struct device *dev, unsigned int
> > +reg) {
> > +	return it6263_lvds_writeable_reg(dev, reg); }
> > +
> > +static bool it6263_lvds_volatile_reg(struct device *dev, unsigned int
> > +reg) {
> > +	return reg =3D=3D LVDS_REG_05;
> > +}
> > +
> > +static const struct regmap_config it6263_lvds_regmap_config =3D {
> > +	.name =3D "it6263-lvds",
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.writeable_reg =3D it6263_lvds_writeable_reg,
> > +	.readable_reg =3D it6263_lvds_readable_reg,
> > +	.volatile_reg =3D it6263_lvds_volatile_reg,
> > +	.max_register =3D LVDS_REG_52,
> > +	.cache_type =3D REGCACHE_MAPLE,
> > +};
> > +
> > +static const char * const it6263_supplies[] =3D {
> > +	"ivdd", "ovdd", "txavcc18", "txavcc33", "pvcc1", "pvcc2",
> > +	"avcc", "anvdd", "apvdd"
> > +};
> > +
> > +static int it6263_parse_dt(struct it6263 *it) {
> > +	struct device *dev =3D it->dev;
> > +	struct device_node *port0, *port1;
> > +	int ret;
> > +
> > +	ret =3D of_property_read_u8(dev->of_node, "ite,lvds-link-num-data-lan=
es",
> > +				  &it->lvds_link_num_dlanes);
> > +	if (ret) {
> > +		dev_err(dev, "failed to get LVDS link number of data lanes: %d\n",
> > +			ret);
> > +		return ret;
> > +	}
> > +
> > +	it->next_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
> > +	if (IS_ERR(it->next_bridge))
> > +		return dev_err_probe(dev, PTR_ERR(it->next_bridge),
> > +				     "failed to get next bridge\n");
> > +
> > +	port0 =3D of_graph_get_port_by_id(dev->of_node, 0);
> > +	port1 =3D of_graph_get_port_by_id(dev->of_node, 1);
> > +	if (port0 && port1) {
> > +		if (of_property_read_bool(port0, "dual-lvds-even-pixels") &&
> > +		    of_property_read_bool(port1, "dual-lvds-odd-pixels")) {
> > +			it->lvds_dual_link =3D true;
> > +			it->lvds_link12_swap =3D true;
>=20
> This is a nice name for the propery in the Dual Link LVDS case:
>=20
> ite,lvds-link-swap
>=20
>=20
> > +		} else if (of_property_read_bool(port0, "dual-lvds-odd-pixels") &&
> > +			   of_property_read_bool(port1, "dual-lvds-even-pixels")) {
> > +			it->lvds_dual_link =3D true;
> > +		}
> > +
> > +		if (!it->lvds_dual_link) {
> > +			dev_err(dev,
> > +				"failed to get LVDS dual link pixel order\n");
> > +			ret =3D -EINVAL;
> > +		}
> > +	} else if (port1) {
> > +		ret =3D -EINVAL;
> > +		dev_err(dev, "single input LVDS port1 is not supported\n");
> > +	} else if (!port0) {
> > +		ret =3D -EINVAL;
> > +		dev_err(dev, "no input LVDS port\n");
> > +	}
> > +
> > +	of_node_put(port0);
> > +	of_node_put(port1);
> > +
> > +	return ret;
> > +}
> > +
> > +static inline void it6263_hw_reset(struct it6263 *it) {
> > +	if (!it->reset_gpio)
> > +		return;
> > +
> > +	gpiod_set_value_cansleep(it->reset_gpio, 0);
> > +	fsleep(1000);
> > +	gpiod_set_value_cansleep(it->reset_gpio, 1);
> > +	/* The chip maker says the low pulse should be at least 40ms. */
> > +	fsleep(40000);
> > +	gpiod_set_value_cansleep(it->reset_gpio, 0);
> > +	/* addtional time to wait the high voltage to be stable */
> > +	fsleep(5000);
> > +}
> > +
> > +static inline int it6263_lvds_set_i2c_addr(struct it6263 *it) {
> > +	int ret;
> > +
> > +	ret =3D regmap_write(it->hdmi_regmap, HDMI_REG_LVDS_PORT,
> > +			   LVDS_INPUT_CTRL_I2C_ADDR << 1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return regmap_write(it->hdmi_regmap, HDMI_REG_LVDS_PORT_EN, BIT(0));
> > +}
> > +
> > +static inline void it6263_lvds_reset(struct it6263 *it) {
> > +	/* AFE PLL reset */
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, BIT(0), 0x0);
> > +	fsleep(1000);
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, BIT(0), BIT(0));
> > +
> > +	/* software pixel clock domain reset */
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_05, REG_SOFT_P_RST,
> > +			  REG_SOFT_P_RST);
> > +	fsleep(1000);
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_05, REG_SOFT_P_RST, 0x0);
> > +	fsleep(10000);
> > +}
> > +
> > +static inline void it6263_lvds_set_interface(struct it6263 *it) {
> > +	/* color depth */
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_COL_DEP, BIT8);
> > +	/* output mapping */
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, JEIDA);
> > +
> > +	if (it->lvds_dual_link) {
> > +		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, DISO);
> > +		regmap_write_bits(it->lvds_regmap, LVDS_REG_52, BIT(1), BIT(1));
> > +	} else {
> > +		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, SISO);
> > +		regmap_write_bits(it->lvds_regmap, LVDS_REG_52, BIT(1), 0);
> > +	}
> > +}
> > +
> > +static inline void it6263_lvds_set_afe(struct it6263 *it) {
> > +	regmap_write(it->lvds_regmap, LVDS_REG_3C, 0xaa);
> > +	regmap_write(it->lvds_regmap, LVDS_REG_3F, 0x02);
> > +	regmap_write(it->lvds_regmap, LVDS_REG_47, 0xaa);
> > +	regmap_write(it->lvds_regmap, LVDS_REG_48, 0x02);
> > +	regmap_write(it->lvds_regmap, LVDS_REG_4F, 0x11);
> > +
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_0B, REG_SSC_PCLK_RF,
> > +			  REG_SSC_PCLK_RF);
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, 0x07, 0);
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_DESSC_ENB,
> > +			  REG_DESSC_ENB);
> > +}
> > +
> > +static inline void it6263_lvds_sys_cfg(struct it6263 *it) {
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_0B, REG_LVDS_IN_SWAP,
> > +			  it->lvds_link12_swap ? REG_LVDS_IN_SWAP : 0); }
> > +
> > +static inline void it6263_lvds_config(struct it6263 *it) {
> > +	it6263_lvds_reset(it);
> > +	it6263_lvds_set_interface(it);
> > +	it6263_lvds_set_afe(it);
> > +	it6263_lvds_sys_cfg(it);
> > +}
> > +
> > +static inline void it6263_hdmi_config(struct it6263 *it) {
> > +	regmap_write(it->hdmi_regmap, HDMI_REG_SW_RST, HDMI_RST_ALL);
> > +	regmap_write(it->hdmi_regmap, HDMI_REG_INPUT_MODE, IN_RGB);
> > +	regmap_write_bits(it->hdmi_regmap, HDMI_REG_GCP, HDMI_COLOR_DEPTH,
> > +			  HDMI_COLOR_DEPTH_24);
> > +}
> > +
> > +static enum drm_connector_status it6263_detect(struct it6263 *it) {
> > +	unsigned int val;
> > +
> > +	regmap_read(it->hdmi_regmap, HDMI_REG_SYS_STATUS, &val);
> > +	if (val & HPDETECT)
> > +		return connector_status_connected;
> > +	else
> > +		return connector_status_disconnected; }
> > +
> > +static enum drm_connector_status
> > +it6263_connector_detect(struct drm_connector *connector, bool force)
> > +{
> > +	struct it6263 *it =3D connector_to_it6263(connector);
> > +
> > +	return it6263_detect(it);
> > +}
> > +
> > +static const struct drm_connector_funcs it6263_connector_funcs =3D {
> > +	.detect =3D it6263_connector_detect,
> > +	.fill_modes =3D drm_helper_probe_single_connector_modes,
> > +	.destroy =3D drm_connector_cleanup,
> > +	.reset =3D drm_atomic_helper_connector_reset,
> > +	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_sta=
te,
> > +	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
> > +};
> > +
> > +static int it6263_read_edid(void *data, u8 *buf, unsigned int block,
> > +size_t len) {
> > +	struct it6263 *it =3D data;
> > +	struct regmap *regmap =3D it->hdmi_regmap;
> > +	unsigned int start =3D (block % 2) * EDID_LENGTH;
> > +	unsigned int segment =3D block >> 1;
> > +	unsigned int count, val;
> > +	int ret;
> > +
> > +	regmap_write(regmap, HDMI_REG_DDC_MASTER_CTRL, MASTER_SEL_HOST);
> > +	regmap_write(regmap, HDMI_REG_DDC_HEADER, DDC_ADDR << 1);
> > +	regmap_write(regmap, HDMI_REG_DDC_EDIDSEG, segment);
> > +
> > +	while (len) {
> > +		/* clear DDC FIFO */
> > +		regmap_write(regmap, HDMI_REG_DDC_CMD, DDC_CMD_FIFO_CLR);
> > +
> > +		ret =3D regmap_read_poll_timeout(regmap, HDMI_REG_DDC_STATUS,
> > +					       val, val & DDC_DONE,
> > +					       2000, 10000);
> > +		if (ret) {
> > +			dev_err(it->dev, "failed to clear DDC FIFO:%d\n", ret);
> > +			return ret;
> > +		}
> > +
> > +		count =3D len > HDMI_DDC_FIFO_BYTES ? HDMI_DDC_FIFO_BYTES : len;
> > +
> > +		/* fire the read command */
> > +		regmap_write(regmap, HDMI_REG_DDC_REQOFF, start);
> > +		regmap_write(regmap, HDMI_REG_DDC_REQCOUNT, count);
> > +		regmap_write(regmap, HDMI_REG_DDC_CMD, DDC_CMD_EDID_READ);
> > +
> > +		start +=3D count;
> > +		len -=3D count;
> > +
> > +		ret =3D regmap_read_poll_timeout(regmap, HDMI_REG_DDC_STATUS, val,
> > +					       val & (DDC_DONE | DDC_ERROR),
> > +					       20000, 250000);
> > +		if (ret && !(val & DDC_ERROR)) {
> > +			dev_err(it->dev, "failed to read EDID:%d\n", ret);
> > +			return ret;
> > +		}
> > +
> > +		if (val & DDC_ERROR) {
> > +			dev_err(it->dev, "DDC error\n");
> > +			return -EIO;
> > +		}
> > +
> > +		/* cache to buffer */
> > +		for (; count > 0; count--) {
> > +			regmap_read(regmap, HDMI_REG_DDC_READFIFO, &val);
> > +			*(buf++) =3D val;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int it6263_connector_get_modes(struct drm_connector
> > +*connector) {
> > +	struct it6263 *it =3D connector_to_it6263(connector);
> > +	const struct drm_edid *drm_edid;
> > +	int count;
> > +
> > +	drm_edid =3D drm_edid_read_custom(connector, it6263_read_edid, it);
> > +
> > +	drm_edid_connector_update(connector, drm_edid);
> > +	count =3D drm_edid_connector_add_modes(connector);
> > +
> > +	drm_edid_free(drm_edid);
> > +
> > +	return count;
> > +}
> > +
> > +static const struct drm_connector_helper_funcs it6263_connector_helper=
_funcs =3D {
> > +	.get_modes =3D it6263_connector_get_modes, };
> > +
> > +static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
> > +				      struct drm_bridge_state *bridge_state,
> > +				      struct drm_crtc_state *crtc_state,
> > +				      struct drm_connector_state *conn_state) {
> > +	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
>=20
> Use drm_atomic_helper_connector_hdmi_check().
>=20
> Implement .hdmi_tmds_char_rate_valid(). Also, I think, single and dual li=
nk LVDS have different max
> clock rates. Please correct me if I'm wrong.

I guess this rate will be same for both links in dual lvds mode.
For single link, it supports only link0.
We cannot operate link1 its Own.

From ITE point the max rate is rate corresponding to 1080p(148-150MHz)

single and dual link LVDS have different max clock rates, but that constrai=
nt is
in SoC side?? ITE HW manual does not mention about this.

>=20
> > +
> > +	return mode->clock > MAX_PIXEL_CLOCK_KHZ ? -EINVAL : 0; }
> > +
> > +static void
> > +it6263_bridge_atomic_disable(struct drm_bridge *bridge,
> > +			     struct drm_bridge_state *old_bridge_state) {
> > +	struct it6263 *it =3D bridge_to_it6263(bridge);
> > +
> > +	regmap_write_bits(it->hdmi_regmap, HDMI_REG_GCP, AVMUTE, AVMUTE);
> > +	regmap_write(it->hdmi_regmap, HDMI_REG_PKT_GENERAL_CTRL, 0);
> > +	regmap_write(it->hdmi_regmap, HDMI_REG_AFE_DRV_CTRL,
> > +		     AFE_DRV_RST | AFE_DRV_PWD);
> > +}
> > +
> > +static void
> > +it6263_hdmi_avi_infoframe_configure(struct it6263 *it,
> > +				    struct drm_connector *connector,
> > +				    const struct drm_display_mode *mode)
>=20
> -> .hdmi_write_infoframe() , .hdmi_clear_infoframe().
>=20
> > +{
> > +	struct hdmi_avi_infoframe frame;
> > +	u8 buf[HDMI_INFOFRAME_SIZE(AVI)];
> > +	int ret;
> > +
> > +	ret =3D drm_hdmi_avi_infoframe_from_display_mode(&frame, connector, m=
ode);
> > +	if (ret) {
> > +		dev_err(it->dev, "failed to setup AVI infoframe: %d\n", ret);
> > +		return;
> > +	}
> > +
> > +	ret =3D hdmi_avi_infoframe_pack(&frame, buf, sizeof(buf));
> > +	if (ret < 0) {
> > +		dev_err(it->dev, "failed to pack infoframe: %d\n", ret);
> > +		return;
> > +	}
> > +
> > +	/* write the first AVI infoframe data byte chunk(DB1-DB5) */
> > +	ret =3D regmap_bulk_write(it->hdmi_regmap, HDMI_REG_AVI_DB1,
> > +				&buf[HDMI_INFOFRAME_HEADER_SIZE],
> > +				HDMI_AVI_DB_CHUNK1_SIZE);
> > +	if (ret) {
> > +		dev_err(it->dev, "failed to write the 1st AVI infoframe data byte ch=
unk: %d\n",
> > +			ret);
> > +		return;
> > +	}
> > +
> > +	/* write the second AVI infoframe data byte chunk(DB6-DB13) */
> > +	ret =3D regmap_bulk_write(it->hdmi_regmap, HDMI_REG_AVI_DB6,
> > +				&buf[HDMI_INFOFRAME_HEADER_SIZE +
> > +				     HDMI_AVI_DB_CHUNK1_SIZE],
> > +				HDMI_AVI_DB_CHUNK2_SIZE);
> > +	if (ret) {
> > +		dev_err(it->dev, "failed to write the 2nd AVI infoframe data byte ch=
unk: %d\n",
> > +			ret);
> > +		return;
> > +	}
> > +
> > +	ret =3D regmap_write(it->hdmi_regmap, HDMI_REG_AVI_CSUM, buf[3]);
> > +	if (ret)
> > +		dev_err(it->dev, "failed to set AVI infoframe checksum: %d\n",
> > +			ret);
> > +}
> > +
> > +static void
> > +it6263_bridge_atomic_enable(struct drm_bridge *bridge,
> > +			    struct drm_bridge_state *old_bridge_state) {
> > +	struct drm_atomic_state *state =3D old_bridge_state->base.state;
> > +	struct it6263 *it =3D bridge_to_it6263(bridge);
> > +	const struct drm_crtc_state *crtc_state;
> > +	struct regmap *regmap =3D it->hdmi_regmap;
> > +	const struct drm_display_mode *mode;
> > +	struct drm_connector *connector;
> > +	bool is_stable =3D false;
> > +	struct drm_crtc *crtc;
> > +	unsigned int val;
> > +	bool pclk_high;
> > +	int i, ret;
> > +
> > +	connector =3D drm_atomic_get_new_connector_for_encoder(state,
> > +							     bridge->encoder);
> > +	crtc =3D drm_atomic_get_new_connector_state(state, connector)->crtc;
> > +	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> > +	mode =3D &crtc_state->adjusted_mode;
> > +
> > +	regmap_write(regmap, HDMI_REG_HDMI_MODE, TX_HDMI_MODE);
> > +
> > +	it6263_hdmi_avi_infoframe_configure(it, connector, mode);
>=20
> drm_atomic_helper_connector_hdmi_update_infoframes
>=20
> > +
> > +	/* HDMI AFE setup */
> > +	pclk_high =3D mode->clock > HIGH_PIXEL_CLOCK_KHZ ? true : false;
> > +	regmap_write(regmap, HDMI_REG_AFE_DRV_CTRL, AFE_DRV_RST);
> > +	if (pclk_high)
> > +		regmap_write(regmap, HDMI_REG_AFE_XP_CTRL,
> > +			     AFE_XP_GAINBIT | AFE_XP_RESETB);
> > +	else
> > +		regmap_write(regmap, HDMI_REG_AFE_XP_CTRL,
> > +			     AFE_XP_ER0 | AFE_XP_RESETB);
> > +	regmap_write(regmap, HDMI_REG_AFE_ISW_CTRL, 0x10);
> > +	if (pclk_high)
> > +		regmap_write(regmap, HDMI_REG_AFE_IP_CTRL,
> > +			     AFE_IP_GAINBIT | AFE_IP_RESETB);
> > +	else
> > +		regmap_write(regmap, HDMI_REG_AFE_IP_CTRL,
> > +			     AFE_IP_ER0 | AFE_IP_RESETB);
> > +
> > +	/* HDMI software video reset */
> > +	regmap_write_bits(regmap, HDMI_REG_SW_RST, SOFTV_RST, SOFTV_RST);
> > +	fsleep(1000);
> > +	regmap_write_bits(regmap, HDMI_REG_SW_RST, SOFTV_RST, 0);
> > +
> > +	/* reconfigure LVDS and retry several times in case video is instable=
 */
> > +	for (i =3D 0; i < 3; i++) {
> > +		ret =3D regmap_read_poll_timeout(regmap, HDMI_REG_SYS_STATUS, val,
> > +					       val & TXVIDSTABLE,
> > +					       20000, 500000);
> > +		if (!ret) {
> > +			is_stable =3D true;
> > +			break;
> > +		}
> > +
> > +		it6263_lvds_config(it);
> > +	}
> > +
> > +	if (!is_stable)
> > +		dev_warn(it->dev, "failed to wait for video stable\n");
> > +
> > +	/* HDMI AFE reset release and power up */
> > +	regmap_write(regmap, HDMI_REG_AFE_DRV_CTRL, 0);
> > +
> > +	regmap_write_bits(regmap, HDMI_REG_GCP, AVMUTE, 0);
> > +
> > +	regmap_write(regmap, HDMI_REG_PKT_GENERAL_CTRL, ENABLE_PKT |
> > +REPEAT_PKT); }
> > +
> > +static enum drm_mode_status
> > +it6263_bridge_mode_valid(struct drm_bridge *bridge,
> > +			 const struct drm_display_info *info,
> > +			 const struct drm_display_mode *mode) {
> > +	return mode->clock > MAX_PIXEL_CLOCK_KHZ ? MODE_CLOCK_HIGH :
> > +MODE_OK;
>=20
>         rate =3D drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB=
);
>         return bridge->funcs->hdmi_tmds_char_rate_valid(bridge, mode, rat=
e);
>=20
> > +}
> > +
> > +static int it6263_bridge_attach(struct drm_bridge *bridge,
> > +				enum drm_bridge_attach_flags flags) {
> > +	struct it6263 *it =3D bridge_to_it6263(bridge);
> > +	int ret;
> > +
> > +	ret =3D drm_bridge_attach(bridge->encoder, it->next_bridge, bridge,
> > +				flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> > +		return 0;
> > +
> > +	it->connector.polled =3D DRM_CONNECTOR_POLL_CONNECT |
> > +			       DRM_CONNECTOR_POLL_DISCONNECT;
> > +
>=20
> Please strongly consider dropping this and using drm_bridge_connector in =
the host driver.
>=20
> > +	ret =3D drm_connector_init(bridge->dev, &it->connector,
> > +				 &it6263_connector_funcs,
> > +				 DRM_MODE_CONNECTOR_HDMIA);
> > +	if (ret)
> > +		return ret;
> > +
> > +	drm_connector_helper_add(&it->connector,
> > +				 &it6263_connector_helper_funcs);
> > +	drm_connector_attach_encoder(&it->connector, bridge->encoder);
> > +
> > +	return 0;
> > +}
> > +
> > +static enum drm_connector_status it6263_bridge_detect(struct
> > +drm_bridge *bridge) {
> > +	struct it6263 *it =3D bridge_to_it6263(bridge);
> > +
> > +	return it6263_detect(it);
> > +}
> > +
> > +static const struct drm_edid *
> > +it6263_bridge_edid_read(struct drm_bridge *bridge,
> > +			struct drm_connector *connector)
> > +{
> > +	struct it6263 *it =3D bridge_to_it6263(bridge);
> > +
> > +	return drm_edid_read_custom(connector, it6263_read_edid, it); }
> > +
> > +static u32 *
> > +it6263_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > +					struct drm_bridge_state *bridge_state,
> > +					struct drm_crtc_state *crtc_state,
> > +					struct drm_connector_state *conn_state,
> > +					u32 output_fmt,
> > +					unsigned int *num_input_fmts)
> > +{
> > +	struct it6263 *it =3D bridge_to_it6263(bridge);
> > +	u32 *input_fmts;
> > +
> > +	*num_input_fmts =3D 0;
> > +
> > +	if (it->lvds_link_num_dlanes =3D=3D 3)
> > +		return NULL;
> > +
> > +	input_fmts =3D kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> > +	if (!input_fmts)
> > +		return NULL;
> > +
> > +	input_fmts[0] =3D MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
> > +	*num_input_fmts =3D 1;
> > +
> > +	return input_fmts;
> > +}
> > +
> > +static const struct drm_bridge_funcs it6263_bridge_funcs =3D {
> > +	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
> > +	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> > +	.attach =3D it6263_bridge_attach,
> > +	.mode_valid =3D it6263_bridge_mode_valid,
> > +	.atomic_disable =3D it6263_bridge_atomic_disable,
> > +	.atomic_enable =3D it6263_bridge_atomic_enable,
> > +	.atomic_check =3D it6263_bridge_atomic_check,
> > +	.detect =3D it6263_bridge_detect,
> > +	.edid_read =3D it6263_bridge_edid_read,
> > +	.atomic_get_input_bus_fmts =3D
> > +it6263_bridge_atomic_get_input_bus_fmts,
> > +};
> > +
> > +static int it6263_probe(struct i2c_client *client) {
> > +	struct device *dev =3D &client->dev;
> > +	struct it6263 *it;
> > +	int ret;
> > +
> > +	it =3D devm_kzalloc(dev, sizeof(*it), GFP_KERNEL);
> > +	if (!it)
> > +		return -ENOMEM;
> > +
> > +	it->dev =3D dev;
> > +	it->hdmi_i2c =3D client;
> > +
> > +	it->hdmi_regmap =3D devm_regmap_init_i2c(client,
> > +					       &it6263_hdmi_regmap_config);
> > +	if (IS_ERR(it->hdmi_regmap))
> > +		return dev_err_probe(dev, PTR_ERR(it->hdmi_regmap),
> > +				     "failed to init I2C regmap for HDMI\n");
> > +
> > +	it->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LO=
W);
> > +	if (IS_ERR(it->reset_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(it->reset_gpio),
> > +				     "failed to get reset gpio\n");
> > +
> > +	ret =3D devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(it6263_supplie=
s),
> > +					     it6263_supplies);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to get power supplies\n");
> > +
> > +	ret =3D it6263_parse_dt(it);
> > +	if (ret)
> > +		return ret;
> > +
> > +	it6263_hw_reset(it);
> > +
> > +	ret =3D it6263_lvds_set_i2c_addr(it);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to set I2C addr\n");
> > +
> > +	it->lvds_i2c =3D devm_i2c_new_dummy_device(dev, client->adapter,
> > +						 LVDS_INPUT_CTRL_I2C_ADDR);
> > +	if (IS_ERR(it->lvds_i2c))
> > +		dev_err_probe(it->dev, PTR_ERR(it->lvds_i2c),
> > +			      "failed to allocate I2C device for LVDS\n");
> > +
> > +	it->lvds_regmap =3D devm_regmap_init_i2c(it->lvds_i2c,
> > +					       &it6263_lvds_regmap_config);
> > +	if (IS_ERR(it->lvds_regmap))
> > +		return dev_err_probe(dev, PTR_ERR(it->lvds_regmap),
> > +				     "failed to init I2C regmap for LVDS\n");
> > +
> > +	it6263_lvds_config(it);
> > +	it6263_hdmi_config(it);
> > +
> > +	i2c_set_clientdata(client, it);
> > +
> > +	it->bridge.funcs =3D &it6263_bridge_funcs;
> > +	it->bridge.of_node =3D dev->of_node;
> > +	it->bridge.ops =3D DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
>=20
>   | DRM_BRIDGE_OP_HDMI
>=20
> BTW: No HPD IRQ support?

Renesas SMARC RZ/G3E this signal is internal. No dedicted IRQ line=20
Populated for this signal. I don't know about NXP and any other platforms
has HPD wired to test the HPD IRQ support.

Maybe go with poll method now and add hot plug support,
when we have platform with HPD to test.

Cheers,
Biju

>=20
> > +	it->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
> > +	drm_bridge_add(&it->bridge);
>=20
> devm_drm_bridge_add()
>=20
> > +
> > +	return 0;
> > +}
> > +
> > +static void it6263_remove(struct i2c_client *client) {
> > +	struct it6263 *it =3D i2c_get_clientdata(client);
> > +
> > +	drm_bridge_remove(&it->bridge);
>=20
> Remove, it becomes unused with the devm_ function.
>=20
> > +}
> > +
> > +static const struct of_device_id it6263_of_match[] =3D {
> > +	{ .compatible =3D "ite,it6263", },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, it6263_of_match);
> > +
> > +static const struct i2c_device_id it6263_i2c_ids[] =3D {
> > +	{ "it6263", 0 },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, it6263_i2c_ids);
> > +
> > +static struct i2c_driver it6263_driver =3D {
> > +	.probe =3D it6263_probe,
> > +	.remove =3D it6263_remove,
> > +	.driver =3D {
> > +		.name =3D "it6263",
> > +		.of_match_table =3D it6263_of_match,
> > +	},
> > +	.id_table =3D it6263_i2c_ids,
> > +};
> > +module_i2c_driver(it6263_driver);
> > +
> > +MODULE_DESCRIPTION("ITE Tech. Inc. IT6263 LVDS/HDMI bridge");
> > +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.34.1
> >
>=20
> --
> With best wishes
> Dmitry
