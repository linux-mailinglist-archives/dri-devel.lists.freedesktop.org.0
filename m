Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2137C537342
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 03:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628CA10E9A0;
	Mon, 30 May 2022 01:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2126.outbound.protection.outlook.com [40.107.117.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93DA10E9A0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 01:27:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYI8AEFYGekYhoHGasq8Wi2lIh+KjOD8BJZQ4qDz/WPE/nNqVhcecDjSJR8xCO8n/YLzRW1mPT2ZT+qqXX940nXDXmpuopie4EIWnKsnOLiXiQ3iy383GIDXd2sZcnR4xT6k4FlEMrWcyFVZEXrzB154lexFOTSYLOudnzaaq0aGqVqlRUXEijrdBJuxgBaWd0a9/EFbzuTtQ0aVH9sxzqKacMIlAntgo8/jcjsL7fFFBx9vhRhAGookhXUmj0i7bY4KIrHBZgNOAsonJp429XgOHIczI5WWRf8mMHUvXAHg4hVZfN7LC6AFRb+/3ycYXhYuKYP90WabAXhm2K553A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRE4zRg6Gyk6SsExfCl2iXJS6EewWCHMTluKU7cRJnI=;
 b=FzbJGIaJ8KLjjHZXUjX7VkBXhifTN5Kpx/xQ3l6JgkjY4dN8mN/apKmZr4buhQi7URe8AfZgU9svJ+LcpuSglUbxupOvhonUDBqRr48XOWJK1j1jTGDkMDJBxPYII/OFjnZV8gW1XaGgYWeqCTUh3JMrnPiiIvC0DyuKQHvrAYhiY4MBy6PGWimLbEUBk5FqusJ7jNsloy4tMYe3VKAf9y3iw2Eq59bSal/p72zcY7anN9sVv6SLbxXlHGi3WO4f9p0Aq5sgta2UUeJNMfP8dugn1dymskcY6PgTLvht1juTznpl8J9cwDNxnBbyTC8X+YDCBjsJrbE3uG+S4kXr+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRE4zRg6Gyk6SsExfCl2iXJS6EewWCHMTluKU7cRJnI=;
 b=mNX04B4n93k5fX5R4LfqyJPoqZ9t5rdGaeqCDIaDbfn3HMZ792j2+sk7PvhDKFE4INm1UUKee3etsBzc8ADsRV76DzcIGR/r+M61vYpRU6mIp+uSjxF7HgUNAuoI3SxnnfW7A9j+8+MI5zxiV6hPHFgrf5Cp1RZq5jo+4C/e8Jzg8uaXSlXa13sVDpBkGdjX6tI0iWzFwuj2W1eQTp3OD+gGPVLWGqdungYAzedKf/a5k+2ud4oZGUph3qilnU4EKxvPkdTm6VrNN3qadbBs0PvakqPSP7UCnoLlcIwy0zKUYcDDF/rr0dlbzTbln/ZgavhmvS5TwtNvxGCN7Wlpeg==
Received: from TY2PR06MB3213.apcprd06.prod.outlook.com (2603:1096:404:97::16)
 by PUZPR06MB4659.apcprd06.prod.outlook.com (2603:1096:301:b2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 01:27:17 +0000
Received: from TY2PR06MB3213.apcprd06.prod.outlook.com
 ([fe80::7847:b601:7d4a:1625]) by TY2PR06MB3213.apcprd06.prod.outlook.com
 ([fe80::7847:b601:7d4a:1625%7]) with mapi id 15.20.5293.018; Mon, 30 May 2022
 01:27:16 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, Felipe Balbi <balbi@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Li
 Yang <leoyang.li@nxp.com>
Subject: RE: [PATCH v5 1/3] usb: gadget: add Aspeed ast2600 udc driver
Thread-Topic: [PATCH v5 1/3] usb: gadget: add Aspeed ast2600 udc driver
Thread-Index: AQHYblFv8upl497Tr0KWTmQJeF4k3a02q/WQ
Date: Mon, 30 May 2022 01:27:16 +0000
Message-ID: <TY2PR06MB3213611D7D9DD6F9B47DBB4080DD9@TY2PR06MB3213.apcprd06.prod.outlook.com>
References: <20220523030134.2977116-1-neal_liu@aspeedtech.com>
 <20220523030134.2977116-2-neal_liu@aspeedtech.com>
In-Reply-To: <20220523030134.2977116-2-neal_liu@aspeedtech.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0276f712-4233-4e17-3a82-08da41db8814
x-ms-traffictypediagnostic: PUZPR06MB4659:EE_
x-microsoft-antispam-prvs: <PUZPR06MB46591A03F3DE8541D066D12480DD9@PUZPR06MB4659.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BRW2RPWMYE7UOr5xbgtjEp7nuvLKjAqR3H5oXUTp3fWpMJ49PCZW1JMWkT/AV81Qjf5WXsgk7HTMmmTZXhQDayeUX2ngx3rlH84Z7bFJ086qGvF4pWO4INaFRlQDjqvgadTdNPZMrU+FVLAQa/Me3Iq58xdWDos+9OKYCLD6jsLcdfQuJ24W1S8CCBZxy/58fvP/zhorSGbifd6KEEjx8JgWRm26LCj7I/Q9zojYQLBIDSjSBhDS9venGwxc1VAjrOuKHzaqqdhDIJ6faIIeetXTesD6DznPKp3YWYKwXETcq6nxpdMCAuOCxOCBsQ0ixud+bJtlTAMpNsnfGcXjCD6gM996n9SOkOZcT1+OdAU/vyv4ycGP6StejVlpUCy/JfpnjTdxkNzgC+Okfb51VBI64Q9NJYm2HlRNLwNW+OKVhokd5dUD91YOol1Z8kEDRctS08DXHDHdv3qL2Lqf8w/smqlHmcydkXH2knFZEwlcRn7XvpCYpqTtrT34M4OubUeBujf17jnFxur8ebcEy1gju6Aj8baLjLdKpolnL4fV++ug1xQwWqqHRthOkJDqDcIsnLyxNvvNBUAv05DOtIgcVn7Fd3IFAh46aMHJsu3cfOZ4dVG4JqF687TijD7aHQaRfuSlCnat6WWTqkJAUxccnz9iYxyRkg7bZ+sPFprc9wWx1ZEppiLr9xmG18GekM4zTwcaZqXX5Ty3S9cjic2FhOfJdqsS+K51DL6iiwE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3213.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66574015)(186003)(38100700002)(55016003)(54906003)(110136005)(4326008)(316002)(8676002)(64756008)(66476007)(66946007)(66446008)(76116006)(38070700005)(83380400001)(71200400001)(8936002)(66556008)(52536014)(53546011)(7696005)(6506007)(86362001)(7416002)(508600001)(30864003)(5660300002)(33656002)(122000001)(921005)(26005)(9686003)(2906002)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8Qe/JVc7U1v4fH4ZdDiClmoH3B+Oq45PF29turajMCOuPwcQzO35OYrvZF?=
 =?iso-8859-1?Q?sKYA9NqNs74yLpZIxI1Y3uNkEyEVzKYIsShQ5r5ZJL9GR0KY2ZqPqWZSYo?=
 =?iso-8859-1?Q?4o8C7qZdRi/JQrsbmqqDFtHC5c33VdHM+ZVnEhxKyj/5zuBdriBRvwqwN7?=
 =?iso-8859-1?Q?XN/BcCcrmtj7LApTTv6rgAXvsYmZQ7yGI5oTq2HHukQdwjqpjpJEwUbo9h?=
 =?iso-8859-1?Q?ehj4swag+n8Xm1icBQkhiSIfTpV8cl7kWpEwx8FYQo84WENWLiFekwTl34?=
 =?iso-8859-1?Q?yNkHqxklGGiJhuRo6YNY2oT+y/yXMESylLVAeVsQ2LGqIM1llTnEBeN7Ut?=
 =?iso-8859-1?Q?Wdb6iAxEPW0MIQmNIzmsMqHWVE008NNU6fGKJ5AuWAQ2B8dmPEgjwdKTXh?=
 =?iso-8859-1?Q?pveWNPFhKkS/aYBrHKm0p8Gjilb4L/WiDjGpuU0ZqHfm+iPrTNH+Gjyg2R?=
 =?iso-8859-1?Q?TMWuJA8vVHuwPOgN0oRpo1+MyTZ/Z+rRwczsPzXYFKe3gBevPFH/2P2DQd?=
 =?iso-8859-1?Q?jvP2RX2Nc0+AJ6JpJNqcyyg65h9haRl5kNeczlXceg2WrKyZLTR9PJy29W?=
 =?iso-8859-1?Q?IyrP+KZzjm8kJ+LPajq5+ya/hCeOLJl8jdSNYDbOYqnHFQW2XKeAWxc6M3?=
 =?iso-8859-1?Q?2plDpeVYYMMziDEy0/wCXRqRxefdfxvxKqy029SZ8/r9/0NPljbvUBEUBR?=
 =?iso-8859-1?Q?XJud0ZWxdxayLRKQjJ9gqbqTuJxYUvX3Kqjwitu9fjURC7unqsgTBMloZM?=
 =?iso-8859-1?Q?tP7BTMv1DjvC2B891Y2zRB7wYx6qqRqAL9E/qz2LAN7ICq+pKiugKXKnp6?=
 =?iso-8859-1?Q?jPYsefoIBMlg13O70akKlPP5YwcGFi1g4Vzi9QPBbrdjoOsuReUZCT4XAB?=
 =?iso-8859-1?Q?IzRz6htvGB9iG6+eG4MFl9OjINECeN8phRlDt5HPmYaCn9v+Lw6Hk/moAs?=
 =?iso-8859-1?Q?J8Zs68oFI5hvQ8OT/bRWozfNvswEb0j/Ff15TnP7itb886CEObH0TfImeF?=
 =?iso-8859-1?Q?PwdhneTvgxGdEqSq0EApMRPPlMACc0N184UB33+lg5uNmTcVKpcB5/lVgg?=
 =?iso-8859-1?Q?umJQayWlvm7fm9jF4Me8UTkdCDNGT9gOnfQHhFtB7ehlTbLGgz5tySZ5vg?=
 =?iso-8859-1?Q?jRnNrONnKiuVhHlaUfl8R8WoA1StL2c+ByuNiubZ6vvMn0RRzPSL/G33Zv?=
 =?iso-8859-1?Q?QWNEK6YNRhizPLyJ5bTe4K71Oy4cswH7hYtdA7naPlSo4CVGEpHb8697lp?=
 =?iso-8859-1?Q?tLcLghHsHRU1KreXCllzGbfJ5OrcsrqQmQHQ31wp43Owor3I9NNe8ltT+s?=
 =?iso-8859-1?Q?UFhFQAfVMDWDk3t0nGhp+Q6JIcVU5cBrJgPcyWNcN8ORXhKYwJOufqUo92?=
 =?iso-8859-1?Q?13ENaHZIqSoxwRz7R8/lbUIDsJyBLre4KBX+uLW04gJEjCdgKig3pZuu9u?=
 =?iso-8859-1?Q?F4iaGKm4NODPtYP0L/IIuN4s0w2ieX5uOEAIjcYuIL1NgyJdobDgG+0pz0?=
 =?iso-8859-1?Q?mJHCNfCO8SqUpflthIQUYGtjHHQdguGf5VrIc1O8ml1EL3py5R4LBQuLyu?=
 =?iso-8859-1?Q?BanUzSxcF6QfsWcJhG55rO/bll+qcc6bWlUw8J1j10ew79ILHbfQrX1tt5?=
 =?iso-8859-1?Q?O9hvT+YYmFaL39kzNLM5pb2R57oArxlpgpmA6gIhjBdIiEHJ9QBIOXqNXl?=
 =?iso-8859-1?Q?b7LlQ/qjG85yqR77edTkBwyGQlqDkFlXia9NR5zqQ1lH/NdjuzOx3yJqqy?=
 =?iso-8859-1?Q?ZIFfi++KWHbCgwTIYvKYhOfiCMP7SJwS91CIIJEhwPaBVu+rsjvNufiDxp?=
 =?iso-8859-1?Q?wkVvEXsfxA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3213.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0276f712-4233-4e17-3a82-08da41db8814
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2022 01:27:16.2548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H6JHs9oNaM5V6LOtKjDcrQpxLKoE06jceiipfxb1Rz8Uh5xTl3tIQQ8G3dP0FvQA7O1jQAvQL/iCDoKELIsAtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB4659
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gentle ping on this path, thanks.

> -----Original Message-----
> From: Neal Liu <neal_liu@aspeedtech.com>
> Sent: Monday, May 23, 2022 11:02 AM
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Rob Herring
> <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>; Andre=
w
> Jeffery <andrew@aj.id.au>; Felipe Balbi <balbi@kernel.org>; Sumit Semwal
> <sumit.semwal@linaro.org>; Christian K=F6nig <christian.koenig@amd.com>;
> Geert Uytterhoeven <geert@linux-m68k.org>; Li Yang <leoyang.li@nxp.com>
> Cc: Neal Liu <neal_liu@aspeedtech.com>; linux-aspeed@lists.ozlabs.org;
> linux-usb@vger.kernel.org; devicetree@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> linux-media@vger.kernel.org; dri-devel@lists.freedesktop.org;
> linaro-mm-sig@lists.linaro.org
> Subject: [PATCH v5 1/3] usb: gadget: add Aspeed ast2600 udc driver
>=20
> Aspeed udc is compliant with USB2.0, supports USB High Speed and Full Spe=
ed,
> backward compatible with USB1.1.
>=20
> Supports independent DMA channel for each generic endpoint.
> Supports 32/256 stages descriptor mode for all generic endpoints.
>=20
> This driver supports full functionality including single/multiple stages
> descriptor mode, and exposes 1 UDC gadget driver.
>=20
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---
>  MAINTAINERS                         |    7 +
>  drivers/usb/gadget/udc/Kconfig      |   13 +
>  drivers/usb/gadget/udc/Makefile     |    1 +
>  drivers/usb/gadget/udc/aspeed_udc.c | 1596
> +++++++++++++++++++++++++++
>  4 files changed, 1617 insertions(+)
>  create mode 100644 drivers/usb/gadget/udc/aspeed_udc.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e8c52d0192a6..784d8d8e7b22 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3109,6 +3109,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/aspeed-video.txt
>  F:	drivers/media/platform/aspeed/
>=20
> +ASPEED USB UDC DRIVER
> +M:	Neal Liu <neal_liu@aspeedtech.com>
> +L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/usb/aspeed,udc.yaml
> +F:	drivers/usb/gadget/udc/aspeed_udc.c
> +
>  ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
>  M:	Corentin Chary <corentin.chary@gmail.com>
>  L:	acpi4asus-user@lists.sourceforge.net
> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kcon=
fig
> index 69394dc1cdfb..03535f33511b 100644
> --- a/drivers/usb/gadget/udc/Kconfig
> +++ b/drivers/usb/gadget/udc/Kconfig
> @@ -463,6 +463,19 @@ config USB_TEGRA_XUDC
>  	 dynamically linked module called "tegra_xudc" and force all
>  	 gadget drivers to also be dynamically linked.
>=20
> +config USB_ASPEED_UDC
> +	tristate "Aspeed UDC driver support"
> +	depends on ARCH_ASPEED || COMPILE_TEST
> +	depends on USB_LIBCOMPOSITE
> +	help
> +	  Enables Aspeed USB2.0 Device Controller driver for AST260x
> +	  family SoCs. The controller supports 1 control endpoint and
> +	  4 programmable endpoints.
> +
> +	  Say "y" to link the driver statically, or "m" to build a
> +	  dynamically linked module called "aspeed_udc" and force all
> +	  gadget drivers to also be dynamically linked.
> +
>  source "drivers/usb/gadget/udc/aspeed-vhub/Kconfig"
>=20
>  #
> diff --git a/drivers/usb/gadget/udc/Makefile
> b/drivers/usb/gadget/udc/Makefile index a21f2224e7eb..12f9e4c9eb0c
> 100644
> --- a/drivers/usb/gadget/udc/Makefile
> +++ b/drivers/usb/gadget/udc/Makefile
> @@ -40,5 +40,6 @@ obj-$(CONFIG_USB_GR_UDC)	+=3D gr_udc.o
>  obj-$(CONFIG_USB_GADGET_XILINX)	+=3D udc-xilinx.o
>  obj-$(CONFIG_USB_SNP_UDC_PLAT) +=3D snps_udc_plat.o
>  obj-$(CONFIG_USB_ASPEED_VHUB)	+=3D aspeed-vhub/
> +obj-$(CONFIG_USB_ASPEED_UDC)	+=3D aspeed_udc.o
>  obj-$(CONFIG_USB_BDC_UDC)	+=3D bdc/
>  obj-$(CONFIG_USB_MAX3420_UDC)	+=3D max3420_udc.o
> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c
> b/drivers/usb/gadget/udc/aspeed_udc.c
> new file mode 100644
> index 000000000000..1fc15228ff15
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -0,0 +1,1596 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2021 Aspeed Technology Inc.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/prefetch.h>
> +#include <linux/usb/ch9.h>
> +#include <linux/usb/gadget.h>
> +#include <linux/slab.h>
> +
> +#define AST_UDC_NUM_ENDPOINTS		(1 + 4)
> +#define AST_UDC_EP0_MAX_PACKET		64	/* EP0's max packet size */
> +#define AST_UDC_EPn_MAX_PACKET		1024	/* Generic EPs max
> packet size */
> +#define AST_UDC_DESCS_COUNT		256	/* Use 256 stages descriptor
> mode (32/256) */
> +#define AST_UDC_DESC_MODE		1	/* Single/Multiple Stage(s)
> Descriptor Mode */
> +
> +#define AST_UDC_EP_DMA_SIZE		(AST_UDC_EPn_MAX_PACKET + 8 *
> AST_UDC_DESCS_COUNT)
> +
> +/*****************************
> + *                           *
> + * UDC register definitions  *
> + *                           *
> + *****************************/
> +
> +#define AST_UDC_FUNC_CTRL		0x00	/* Root Function Control &
> Status Register */
> +#define AST_UDC_CONFIG			0x04	/* Root Configuration Setting
> Register */
> +#define AST_UDC_IER			0x08	/* Interrupt Control Register */
> +#define AST_UDC_ISR			0x0C	/* Interrupt Status Register */
> +#define AST_UDC_EP_ACK_IER		0x10	/* Programmable ep Pool
> ACK Interrupt Enable Reg */
> +#define AST_UDC_EP_NAK_IER		0x14	/* Programmable ep Pool
> NAK Interrupt Enable Reg */
> +#define AST_UDC_EP_ACK_ISR		0x18	/* Programmable ep Pool
> ACK Interrupt Status Reg */
> +#define AST_UDC_EP_NAK_ISR		0x1C	/* Programmable ep Pool
> NAK Interrupt Status Reg */
> +#define AST_UDC_DEV_RESET		0x20	/* Device Controller Soft
> Reset Enable Register */
> +#define AST_UDC_STS			0x24	/* USB Status Register */
> +#define AST_VHUB_EP_DATA		0x28	/* Programmable ep Pool
> Data Toggle Value Set */
> +#define AST_VHUB_ISO_TX_FAIL		0x2C	/* Isochronous Transaction
> Fail Accumulator */
> +#define AST_UDC_EP0_CTRL		0x30	/* Endpoint 0 Control/Status
> Register */
> +#define AST_UDC_EP0_DATA_BUFF		0x34	/* Base Address of ep0
> IN/OUT Data Buffer Reg */
> +#define AST_UDC_SETUP0			0x80    /* Root Device Setup Data
> Buffer0 */
> +#define AST_UDC_SETUP1			0x84    /* Root Device Setup Data
> Buffer1 */
> +
> +
> +/* Main control reg */
> +#define USB_PHY_CLK_EN			BIT(31)
> +#define USB_FIFO_DYN_PWRD_EN		BIT(19)
> +#define USB_EP_LONG_DESC		BIT(18)
> +#define USB_BIST_TEST_PASS		BIT(13)
> +#define USB_BIST_TURN_ON		BIT(12)
> +#define USB_PHY_RESET_DIS		BIT(11)
> +#define USB_TEST_MODE(x)		((x) << 8)
> +#define USB_FORCE_TIMER_HS		BIT(7)
> +#define USB_FORCE_HS			BIT(6)
> +#define USB_REMOTE_WAKEUP_12MS		BIT(5)
> +#define USB_REMOTE_WAKEUP_EN		BIT(4)
> +#define USB_AUTO_REMOTE_WAKEUP_EN	BIT(3)
> +#define USB_STOP_CLK_IN_SUPEND		BIT(2)
> +#define USB_UPSTREAM_FS			BIT(1)
> +#define USB_UPSTREAM_EN			BIT(0)
> +
> +/* Main config reg */
> +#define UDC_CFG_SET_ADDR(x)		((x) & 0x3f)
> +#define UDC_CFG_ADDR_MASK		(0x3f)
> +
> +/* Interrupt ctrl & status reg */
> +#define UDC_IRQ_EP_POOL_NAK		BIT(17)
> +#define UDC_IRQ_EP_POOL_ACK_STALL	BIT(16)
> +#define UDC_IRQ_BUS_RESUME		BIT(8)
> +#define UDC_IRQ_BUS_SUSPEND		BIT(7)
> +#define UDC_IRQ_BUS_RESET		BIT(6)
> +#define UDC_IRQ_EP0_IN_DATA_NAK		BIT(4)
> +#define UDC_IRQ_EP0_IN_ACK_STALL	BIT(3)
> +#define UDC_IRQ_EP0_OUT_NAK		BIT(2)
> +#define UDC_IRQ_EP0_OUT_ACK_STALL	BIT(1)
> +#define UDC_IRQ_EP0_SETUP		BIT(0)
> +#define UDC_IRQ_ACK_ALL			(0x1ff)
> +
> +/* EP isr reg */
> +#define USB_EP3_ISR			BIT(3)
> +#define USB_EP2_ISR			BIT(2)
> +#define USB_EP1_ISR			BIT(1)
> +#define USB_EP0_ISR			BIT(0)
> +#define UDC_IRQ_EP_ACK_ALL		(0xf)
> +
> +/*Soft reset reg */
> +#define ROOT_UDC_SOFT_RESET		BIT(0)
> +
> +/* USB status reg */
> +#define UDC_STS_HIGHSPEED		BIT(27)
> +
> +/* Programmable EP data toggle */
> +#define EP_TOGGLE_SET_EPNUM(x)		((x) & 0x3)
> +
> +/* EP0 ctrl reg */
> +#define EP0_GET_RX_LEN(x)		((x >> 16) & 0x7f)
> +#define EP0_TX_LEN(x)			((x & 0x7f) << 8)
> +#define EP0_RX_BUFF_RDY			BIT(2)
> +#define EP0_TX_BUFF_RDY			BIT(1)
> +#define EP0_STALL			BIT(0)
> +
> +/*************************************
> + *                                   *
> + * per-endpoint register definitions *
> + *                                   *
> + *************************************/
> +
> +#define AST_UDC_EP_CONFIG		0x00	/* Endpoint Configuration
> Register */
> +#define AST_UDC_EP_DMA_CTRL		0x04	/* DMA Descriptor List
> Control/Status Register */
> +#define AST_UDC_EP_DMA_BUFF		0x08	/* DMA
> Descriptor/Buffer Base Address */
> +#define AST_UDC_EP_DMA_STS		0x0C	/* DMA Descriptor List R/W
> Pointer and Status */
> +
> +#define AST_UDC_EP_BASE			0x200
> +#define AST_UDC_EP_OFFSET		0x10
> +
> +/* EP config reg */
> +#define EP_SET_MAX_PKT(x)		((x & 0x3ff) << 16)
> +#define EP_DATA_FETCH_CTRL(x)		((x & 0x3) << 14)
> +#define EP_AUTO_DATA_DISABLE		(0x1 << 13)
> +#define EP_SET_EP_STALL			(0x1 << 12)
> +#define EP_SET_EP_NUM(x)		((x & 0xf) << 8)
> +#define EP_SET_TYPE_MASK(x)		((x) << 5)
> +#define EP_TYPE_BULK			(0x1)
> +#define EP_TYPE_INT			(0x2)
> +#define EP_TYPE_ISO			(0x3)
> +#define EP_DIR_OUT			(0x1 << 4)
> +#define EP_ALLOCATED_MASK		(0x7 << 1)
> +#define EP_ENABLE			BIT(0)
> +
> +/* EP DMA ctrl reg */
> +#define EP_DMA_CTRL_GET_PROC_STS(x)	((x >> 4) & 0xf)
> +#define EP_DMA_CTRL_STS_RX_IDLE		0x0
> +#define EP_DMA_CTRL_STS_TX_IDLE		0x8
> +#define EP_DMA_CTRL_IN_LONG_MODE	(0x1 << 3)
> +#define EP_DMA_CTRL_RESET		(0x1 << 2)
> +#define EP_DMA_SINGLE_STAGE		(0x1 << 1)
> +#define EP_DMA_DESC_MODE		(0x1 << 0)
> +
> +/* EP DMA status reg */
> +#define EP_DMA_SET_TX_SIZE(x)		((x & 0x7ff) << 16)
> +#define EP_DMA_GET_TX_SIZE(x)		(((x) >> 16) & 0x7ff)
> +#define EP_DMA_GET_RPTR(x)		(((x) >> 8) & 0xff)
> +#define EP_DMA_GET_WPTR(x)		((x) & 0xff)
> +#define EP_DMA_SINGLE_KICK		(1 << 0) /* WPTR =3D 1 for single mode
> */
> +
> +/* EP desc reg */
> +#define AST_EP_DMA_DESC_INTR_ENABLE	BIT(31)
> +#define AST_EP_DMA_DESC_PID_DATA0	(0 << 14)
> +#define AST_EP_DMA_DESC_PID_DATA2	BIT(14)
> +#define AST_EP_DMA_DESC_PID_DATA1	(2 << 14)
> +#define AST_EP_DMA_DESC_PID_MDATA	(3 << 14)
> +#define EP_DESC1_IN_LEN(x)		((x) & 0x1fff)
> +#define AST_EP_DMA_DESC_MAX_LEN		(7680) /* Max packet length
> for trasmit in 1 desc */
> +
> +struct ast_udc_request {
> +	struct usb_request	req;
> +	struct list_head	queue;
> +	unsigned		mapped:1;
> +	unsigned int		actual_dma_length;
> +	u32			saved_dma_wptr;
> +};
> +
> +#define to_ast_req(__req) container_of(__req, struct ast_udc_request,
> +req)
> +
> +struct ast_dma_desc {
> +	u32	des_0;
> +	u32	des_1;
> +};
> +
> +struct ast_udc_ep {
> +	struct usb_ep			ep;
> +
> +	/* Request queue */
> +	struct list_head		queue;
> +
> +	struct ast_udc_dev		*udc;
> +	void __iomem			*ep_reg;
> +	void				*epn_buf;
> +	dma_addr_t			epn_buf_dma;
> +	const struct usb_endpoint_descriptor	*desc;
> +
> +	/* DMA Descriptors */
> +	struct ast_dma_desc		*descs;
> +	dma_addr_t			descs_dma;
> +	u32				descs_wptr;
> +	u32				chunk_max;
> +
> +	bool				dir_in:1;
> +	unsigned			stopped:1;
> +	bool				desc_mode:1;
> +};
> +
> +#define to_ast_ep(__ep) container_of(__ep, struct ast_udc_ep, ep)
> +
> +struct ast_udc_dev {
> +	struct platform_device		*pdev;
> +	void __iomem			*reg;
> +	int				irq;
> +	spinlock_t			lock;
> +	struct clk			*clk;
> +	struct work_struct		wake_work;
> +
> +	/* EP0 DMA buffers allocated in one chunk */
> +	void				*ep0_buf;
> +	dma_addr_t			ep0_buf_dma;
> +	struct ast_udc_ep		ep[AST_UDC_NUM_ENDPOINTS];
> +
> +	struct usb_gadget		gadget;
> +	struct usb_gadget_driver	*driver;
> +	void __iomem			*creq;
> +	enum usb_device_state		suspended_from;
> +	int				desc_mode;
> +
> +	/* Force full speed only */
> +	bool				force_usb1:1;
> +	unsigned			is_control_tx:1;
> +	bool				wakeup_en:1;
> +};
> +
> +#define to_ast_dev(__g) container_of(__g, struct ast_udc_dev, gadget)
> +
> +static const char * const ast_ep_name[] =3D {
> +	"ep0", "ep1", "ep2", "ep3", "ep4"
> +};
> +
> +#ifdef AST_UDC_DEBUG_ALL
> +#define AST_UDC_DEBUG
> +#define AST_SETUP_DEBUG
> +#define AST_EP_DEBUG
> +#define AST_ISR_DEBUG
> +#endif
> +
> +#ifdef AST_SETUP_DEBUG
> +#define SETUP_DBG(u, fmt, ...)	\
> +	dev_dbg(&(u)->pdev->dev, "%s() " fmt, __func__, ##__VA_ARGS__) #else
> +#define SETUP_DBG(u, fmt, ...) #endif
> +
> +#ifdef AST_EP_DEBUG
> +#define EP_DBG(e, fmt, ...)	\
> +	dev_dbg(&(e)->udc->pdev->dev, "%s():%s " fmt, __func__,	\
> +		 (e)->ep.name, ##__VA_ARGS__)
> +#else
> +#define EP_DBG(ep, fmt, ...)	((void)(ep))
> +#endif
> +
> +#ifdef AST_UDC_DEBUG
> +#define UDC_DBG(u, fmt, ...)	\
> +	dev_dbg(&(u)->pdev->dev, "%s() " fmt, __func__, ##__VA_ARGS__) #else
> +#define UDC_DBG(u, fmt, ...) #endif
> +
> +#ifdef AST_ISR_DEBUG
> +#define ISR_DBG(u, fmt, ...)	\
> +	dev_dbg(&(u)->pdev->dev, "%s() " fmt, __func__, ##__VA_ARGS__) #else
> +#define ISR_DBG(u, fmt, ...) #endif
> +
> +/*---------------------------------------------------------------------
> +----*/
> +#define ast_udc_read(udc, offset) \
> +	readl((udc)->reg + (offset))
> +#define ast_udc_write(udc, val, offset) \
> +	writel((val), (udc)->reg + (offset))
> +
> +#define ast_ep_read(ep, reg) \
> +	readl((ep)->ep_reg + (reg))
> +#define ast_ep_write(ep, val, reg) \
> +	writel((val), (ep)->ep_reg + (reg))
> +
> +/*---------------------------------------------------------------------
> +----*/
> +
> +static void ast_udc_done(struct ast_udc_ep *ep, struct ast_udc_request *=
req,
> +			 int status)
> +{
> +	struct ast_udc_dev *udc =3D ep->udc;
> +
> +	EP_DBG(ep, "req @%p, len (%d/%d), buf:0x%x, dir:0x%x\n",
> +	       req, req->req.actual, req->req.length,
> +	       (u32)req->req.buf, ep->dir_in);
> +
> +	list_del(&req->queue);
> +
> +	if (req->req.status =3D=3D -EINPROGRESS)
> +		req->req.status =3D status;
> +	else
> +		status =3D req->req.status;
> +
> +	if (status && status !=3D -ESHUTDOWN)
> +		EP_DBG(ep, "done req:%p, status:%d\n", req, status);
> +
> +	spin_unlock(&udc->lock);
> +	usb_gadget_giveback_request(&ep->ep, &req->req);
> +	spin_lock(&udc->lock);
> +}
> +
> +static void ast_udc_nuke(struct ast_udc_ep *ep, int status) {
> +	int count =3D 0;
> +
> +	while (!list_empty(&ep->queue)) {
> +		struct ast_udc_request *req;
> +
> +		req =3D list_entry(ep->queue.next, struct ast_udc_request,
> +				 queue);
> +		ast_udc_done(ep, req, status);
> +		count++;
> +	}
> +
> +	if (count)
> +		EP_DBG(ep, "Nuked %d request(s)\n", count); }
> +
> +/*
> + * Stop activity on all endpoints.
> + * Device controller for which EP activity is to be stopped.
> + *
> + * All the endpoints are stopped and any pending transfer requests if
> +any on
> + * the endpoint are terminated.
> + */
> +static void ast_udc_stop_activity(struct ast_udc_dev *udc) {
> +	struct ast_udc_ep *ep;
> +	int i;
> +
> +	for (i =3D 0; i < AST_UDC_NUM_ENDPOINTS; i++) {
> +		ep =3D &udc->ep[i];
> +		ep->stopped =3D 1;
> +		ast_udc_nuke(ep, -ESHUTDOWN);
> +	}
> +}
> +
> +static int ast_udc_ep_enable(struct usb_ep *_ep,
> +			     const struct usb_endpoint_descriptor *desc) {
> +	u16 maxpacket =3D usb_endpoint_maxp(desc);
> +	struct ast_udc_ep *ep =3D to_ast_ep(_ep);
> +	struct ast_udc_dev *udc =3D ep->udc;
> +	u8 epnum =3D usb_endpoint_num(desc);
> +	unsigned long flags;
> +	u32 ep_conf =3D 0;
> +	u8 dir_in;
> +	u8 type;
> +
> +	if (!_ep || !ep || !desc || desc->bDescriptorType !=3D USB_DT_ENDPOINT
> ||
> +	    maxpacket =3D=3D 0 || maxpacket > ep->ep.maxpacket) {
> +		EP_DBG(ep, "Failed, invalid EP enable param\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!udc->driver) {
> +		EP_DBG(ep, "bogus device state\n");
> +		return -ESHUTDOWN;
> +	}
> +
> +	EP_DBG(ep, "maxpacket:0x%x\n", maxpacket);
> +
> +	spin_lock_irqsave(&udc->lock, flags);
> +
> +	ep->desc =3D desc;
> +	ep->stopped =3D 0;
> +	ep->ep.maxpacket =3D maxpacket;
> +	ep->chunk_max =3D AST_EP_DMA_DESC_MAX_LEN;
> +
> +	if (maxpacket < AST_UDC_EPn_MAX_PACKET)
> +		ep_conf =3D EP_SET_MAX_PKT(maxpacket);
> +
> +	ep_conf |=3D EP_SET_EP_NUM(epnum);
> +
> +	type =3D usb_endpoint_type(desc);
> +	dir_in =3D usb_endpoint_dir_in(desc);
> +	ep->dir_in =3D dir_in;
> +	if (!ep->dir_in)
> +		ep_conf |=3D EP_DIR_OUT;
> +
> +	EP_DBG(ep, "type %d, dir_in %d\n", type, dir_in);
> +	switch (type) {
> +	case USB_ENDPOINT_XFER_ISOC:
> +		ep_conf |=3D EP_SET_TYPE_MASK(EP_TYPE_ISO);
> +		break;
> +
> +	case USB_ENDPOINT_XFER_BULK:
> +		ep_conf |=3D EP_SET_TYPE_MASK(EP_TYPE_BULK);
> +		break;
> +
> +	case USB_ENDPOINT_XFER_INT:
> +		ep_conf |=3D EP_SET_TYPE_MASK(EP_TYPE_INT);
> +		break;
> +	}
> +
> +	ep->desc_mode =3D udc->desc_mode && ep->descs_dma && ep->dir_in;
> +	if (ep->desc_mode) {
> +		ast_ep_write(ep, EP_DMA_CTRL_RESET, AST_UDC_EP_DMA_CTRL);
> +		ast_ep_write(ep, 0, AST_UDC_EP_DMA_STS);
> +		ast_ep_write(ep, ep->descs_dma, AST_UDC_EP_DMA_BUFF);
> +
> +		/* Enable Long Descriptor Mode */
> +		ast_ep_write(ep, EP_DMA_CTRL_IN_LONG_MODE |
> EP_DMA_DESC_MODE,
> +			     AST_UDC_EP_DMA_CTRL);
> +
> +		ep->descs_wptr =3D 0;
> +
> +	} else {
> +		ast_ep_write(ep, EP_DMA_CTRL_RESET, AST_UDC_EP_DMA_CTRL);
> +		ast_ep_write(ep, EP_DMA_SINGLE_STAGE,
> AST_UDC_EP_DMA_CTRL);
> +		ast_ep_write(ep, 0, AST_UDC_EP_DMA_STS);
> +	}
> +
> +	/* Cleanup data toggle just in case */
> +	ast_udc_write(udc, EP_TOGGLE_SET_EPNUM(epnum),
> AST_VHUB_EP_DATA);
> +
> +	/* Enable EP */
> +	ast_ep_write(ep, ep_conf | EP_ENABLE, AST_UDC_EP_CONFIG);
> +
> +	EP_DBG(ep, "ep_config: 0x%x\n", ast_ep_read(ep,
> AST_UDC_EP_CONFIG));
> +
> +	spin_unlock_irqrestore(&udc->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int ast_udc_ep_disable(struct usb_ep *_ep) {
> +	struct ast_udc_ep *ep =3D to_ast_ep(_ep);
> +	struct ast_udc_dev *udc =3D ep->udc;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&udc->lock, flags);
> +
> +	ep->ep.desc =3D NULL;
> +	ep->stopped =3D 1;
> +
> +	ast_udc_nuke(ep, -ESHUTDOWN);
> +	ast_ep_write(ep, 0, AST_UDC_EP_CONFIG);
> +
> +	spin_unlock_irqrestore(&udc->lock, flags);
> +
> +	return 0;
> +}
> +
> +static struct usb_request *ast_udc_ep_alloc_request(struct usb_ep *_ep,
> +						    gfp_t gfp_flags)
> +{
> +	struct ast_udc_ep *ep =3D to_ast_ep(_ep);
> +	struct ast_udc_request *req;
> +
> +	req =3D kzalloc(sizeof(struct ast_udc_request), gfp_flags);
> +	if (!req) {
> +		EP_DBG(ep, "request allocation failed\n");
> +		return NULL;
> +	}
> +
> +	INIT_LIST_HEAD(&req->queue);
> +
> +	return &req->req;
> +}
> +
> +static void ast_udc_ep_free_request(struct usb_ep *_ep,
> +				    struct usb_request *_req)
> +{
> +	struct ast_udc_request *req =3D to_ast_req(_req);
> +
> +	kfree(req);
> +}
> +
> +static int ast_dma_descriptor_setup(struct ast_udc_ep *ep, u32 dma_buf,
> +				    u16 tx_len, struct ast_udc_request *req) {
> +	struct ast_udc_dev *udc =3D ep->udc;
> +	struct device *dev =3D &udc->pdev->dev;
> +	u32 offset, chunk;
> +	int count, last;
> +
> +	if (!ep->descs) {
> +		dev_warn(dev, "%s: Empty DMA descs list failure\n",
> +			 ep->ep.name);
> +		return -EINVAL;
> +	}
> +
> +	chunk =3D tx_len;
> +	offset =3D count =3D last =3D 0;
> +
> +	EP_DBG(ep, "req @%p, %s:%d, %s:0x%x, %s:0x%x\n", req,
> +	       "wptr", ep->descs_wptr, "dma_buf", dma_buf,
> +	       "tx_len", tx_len);
> +
> +	/* Create Descriptor Lists */
> +	while (chunk >=3D 0 && !last && count < AST_UDC_DESCS_COUNT) {
> +
> +		ep->descs[ep->descs_wptr].des_0 =3D dma_buf + offset;
> +
> +		if (chunk <=3D ep->chunk_max) {
> +			ep->descs[ep->descs_wptr].des_1 =3D chunk;
> +			last =3D 1;
> +		} else {
> +			ep->descs[ep->descs_wptr].des_1 =3D ep->chunk_max;
> +			chunk -=3D ep->chunk_max;
> +		}
> +
> +		EP_DBG(ep, "descs[%d]: 0x%x 0x%x, last:%d\n",
> +		       ep->descs_wptr,
> +		       ep->descs[ep->descs_wptr].des_0,
> +		       ep->descs[ep->descs_wptr].des_1,
> +		       last);
> +
> +		if (count =3D=3D 0)
> +			req->saved_dma_wptr =3D ep->descs_wptr;
> +
> +		ep->descs_wptr++;
> +		count++;
> +
> +		if (ep->descs_wptr >=3D AST_UDC_DESCS_COUNT)
> +			ep->descs_wptr =3D 0;
> +
> +		offset =3D ep->chunk_max * count;
> +	}
> +
> +	return 0;
> +}
> +
> +static void ast_udc_epn_kick(struct ast_udc_ep *ep, struct
> +ast_udc_request *req) {
> +	u32 tx_len;
> +	u32 last;
> +
> +	last =3D req->req.length - req->req.actual;
> +	tx_len =3D last > ep->ep.maxpacket ? ep->ep.maxpacket : last;
> +
> +	EP_DBG(ep, "kick req @%p, len:%d, dir:%d\n",
> +	       req, tx_len, ep->dir_in);
> +
> +	ast_ep_write(ep, req->req.dma + req->req.actual,
> AST_UDC_EP_DMA_BUFF);
> +
> +	/* Start DMA */
> +	ast_ep_write(ep, EP_DMA_SET_TX_SIZE(tx_len),
> AST_UDC_EP_DMA_STS);
> +	ast_ep_write(ep, EP_DMA_SET_TX_SIZE(tx_len) | EP_DMA_SINGLE_KICK,
> +		     AST_UDC_EP_DMA_STS);
> +}
> +
> +static void ast_udc_epn_kick_desc(struct ast_udc_ep *ep,
> +				  struct ast_udc_request *req)
> +{
> +	u32 descs_max_size;
> +	u32 tx_len;
> +	u32 last;
> +
> +	descs_max_size =3D AST_EP_DMA_DESC_MAX_LEN *
> AST_UDC_DESCS_COUNT;
> +
> +	last =3D req->req.length - req->req.actual;
> +	tx_len =3D last > descs_max_size ? descs_max_size : last;
> +
> +	EP_DBG(ep, "kick req @%p, %s:%d, %s:0x%x, %s:0x%x (%d/%d),
> %s:0x%x\n",
> +	       req, "tx_len", tx_len, "dir_in", ep->dir_in,
> +	       "dma", req->req.dma + req->req.actual,
> +	       req->req.actual, req->req.length,
> +	       "descs_max_size", descs_max_size);
> +
> +	if (!ast_dma_descriptor_setup(ep, req->req.dma + req->req.actual,
> +				      tx_len, req))
> +		req->actual_dma_length +=3D tx_len;
> +
> +	/* make sure CPU done everything before triggering DMA */
> +	mb();
> +
> +	ast_ep_write(ep, ep->descs_wptr, AST_UDC_EP_DMA_STS);
> +
> +	EP_DBG(ep, "descs_wptr:%d, dstat:0x%x, dctrl:0x%x\n",
> +	       ep->descs_wptr,
> +	       ast_ep_read(ep, AST_UDC_EP_DMA_STS),
> +	       ast_ep_read(ep, AST_UDC_EP_DMA_CTRL)); }
> +
> +static void ast_udc_ep0_queue(struct ast_udc_ep *ep,
> +			      struct ast_udc_request *req)
> +{
> +	struct ast_udc_dev *udc =3D ep->udc;
> +	u32 tx_len;
> +	u32 last;
> +
> +	last =3D req->req.length - req->req.actual;
> +	tx_len =3D last > ep->ep.maxpacket ? ep->ep.maxpacket : last;
> +
> +	ast_udc_write(udc, req->req.dma + req->req.actual,
> +		      AST_UDC_EP0_DATA_BUFF);
> +
> +	if (ep->dir_in) {
> +		/* IN requests, send data */
> +		SETUP_DBG(udc, "IN: %s:0x%x, %s:0x%x, %s:%d (%d/%d), %s:%d\n",
> +			  "buf", (u32)req->req.buf,
> +			  "dma", req->req.dma + req->req.actual,
> +			  "tx_len", tx_len,
> +			  req->req.actual, req->req.length,
> +			  "dir_in", ep->dir_in);
> +
> +		req->req.actual +=3D tx_len;
> +		ast_udc_write(udc, EP0_TX_LEN(tx_len), AST_UDC_EP0_CTRL);
> +		ast_udc_write(udc, EP0_TX_LEN(tx_len) | EP0_TX_BUFF_RDY,
> +			      AST_UDC_EP0_CTRL);
> +
> +	} else {
> +		/* OUT requests, receive data */
> +		SETUP_DBG(udc, "OUT: %s:%x, %s:%x, %s:(%d/%d), %s:%d\n",
> +			  "buf", (u32)req->req.buf,
> +			  "dma", req->req.dma + req->req.actual,
> +			  "len", req->req.actual, req->req.length,
> +			  "dir_in", ep->dir_in);
> +
> +		if (!req->req.length) {
> +			/* 0 len request, send tx as completion */
> +			ast_udc_write(udc, EP0_TX_BUFF_RDY, AST_UDC_EP0_CTRL);
> +			ep->dir_in =3D 0x1;
> +		} else
> +			ast_udc_write(udc, EP0_RX_BUFF_RDY, AST_UDC_EP0_CTRL);
> +	}
> +}
> +
> +static int ast_udc_ep_queue(struct usb_ep *_ep, struct usb_request *_req=
,
> +			    gfp_t gfp_flags)
> +{
> +	struct ast_udc_request *req =3D to_ast_req(_req);
> +	struct ast_udc_ep *ep =3D to_ast_ep(_ep);
> +	struct ast_udc_dev *udc =3D ep->udc;
> +	struct device *dev =3D &udc->pdev->dev;
> +	unsigned long flags;
> +	int rc;
> +
> +	if (unlikely(!_req || !_req->complete || !_req->buf || !_ep)) {
> +		dev_warn(dev, "Invalid EP request !\n");
> +		return -EINVAL;
> +	}
> +
> +	if (ep->stopped) {
> +		dev_warn(dev, "%s is already stopped !\n", _ep->name);
> +		return -ESHUTDOWN;
> +	}
> +
> +	spin_lock_irqsave(&udc->lock, flags);
> +
> +	list_add_tail(&req->queue, &ep->queue);
> +
> +	req->req.actual =3D 0;
> +	req->req.status =3D -EINPROGRESS;
> +	req->actual_dma_length =3D 0;
> +
> +	rc =3D usb_gadget_map_request(&udc->gadget, &req->req, ep->dir_in);
> +	if (rc) {
> +		EP_DBG(ep, "Request mapping failure %d\n", rc);
> +		dev_warn(dev, "Request mapping failure %d\n", rc);
> +		goto end;
> +	}
> +
> +	EP_DBG(ep, "enqueue req @%p\n", req);
> +	EP_DBG(ep, "l=3D%d, dma:0x%x, zero:%d, is_in:%d\n",
> +		_req->length, _req->dma, _req->zero, ep->dir_in);
> +
> +	/* EP0 request enqueue */
> +	if (ep->ep.desc =3D=3D NULL) {
> +		if ((req->req.dma % 4) !=3D 0) {
> +			dev_warn(dev, "EP0 req dma alignment error\n");
> +			return -ESHUTDOWN;
> +		}
> +
> +		ast_udc_ep0_queue(ep, req);
> +		goto end;
> +	}
> +
> +	/* EPn request enqueue */
> +	if (list_is_singular(&ep->queue)) {
> +		if (ep->desc_mode)
> +			ast_udc_epn_kick_desc(ep, req);
> +		else
> +			ast_udc_epn_kick(ep, req);
> +	}
> +
> +end:
> +	spin_unlock_irqrestore(&udc->lock, flags);
> +
> +	return rc;
> +}
> +
> +static int ast_udc_ep_dequeue(struct usb_ep *_ep, struct usb_request
> +*_req) {
> +	struct ast_udc_ep *ep =3D to_ast_ep(_ep);
> +	struct ast_udc_dev *udc =3D ep->udc;
> +	struct ast_udc_request *req;
> +	unsigned long flags;
> +	int rc =3D 0;
> +
> +	spin_lock_irqsave(&udc->lock, flags);
> +
> +	/* make sure it's actually queued on this endpoint */
> +	list_for_each_entry(req, &ep->queue, queue) {
> +		if (&req->req =3D=3D _req) {
> +			list_del_init(&req->queue);
> +			ast_udc_done(ep, req, -ESHUTDOWN);
> +			_req->status =3D -ECONNRESET;
> +			break;
> +		}
> +	}
> +
> +	/* dequeue request not found */
> +	if (&req->req !=3D _req)
> +		rc =3D -EINVAL;
> +
> +	spin_unlock_irqrestore(&udc->lock, flags);
> +
> +	return rc;
> +}
> +
> +static int ast_udc_ep_set_halt(struct usb_ep *_ep, int value) {
> +	struct ast_udc_ep *ep =3D to_ast_ep(_ep);
> +	struct ast_udc_dev *udc =3D ep->udc;
> +	unsigned long flags;
> +	int epnum;
> +	u32 ctrl;
> +
> +	EP_DBG(ep, "val:%d\n", value);
> +
> +	spin_lock_irqsave(&udc->lock, flags);
> +
> +	epnum =3D usb_endpoint_num(ep->desc);
> +
> +	/* EP0 */
> +	if (epnum =3D=3D 0) {
> +		ctrl =3D ast_udc_read(udc, AST_UDC_EP0_CTRL);
> +		if (value)
> +			ctrl |=3D EP0_STALL;
> +		else
> +			ctrl &=3D ~EP0_STALL;
> +
> +		ast_udc_write(udc, ctrl, AST_UDC_EP0_CTRL);
> +
> +	} else {
> +	/* EPn */
> +		ctrl =3D ast_udc_read(udc, AST_UDC_EP_CONFIG);
> +		if (value)
> +			ctrl |=3D EP_SET_EP_STALL;
> +		else
> +			ctrl &=3D ~EP_SET_EP_STALL;
> +
> +		ast_ep_write(ep, ctrl, AST_UDC_EP_CONFIG);
> +
> +		/* only epn is stopped and waits for clear */
> +		ep->stopped =3D value ? 1 : 0;
> +	}
> +
> +	spin_unlock_irqrestore(&udc->lock, flags);
> +
> +	return 0;
> +}
> +
> +static const struct usb_ep_ops ast_udc_ep_ops =3D {
> +	.enable		=3D ast_udc_ep_enable,
> +	.disable	=3D ast_udc_ep_disable,
> +	.alloc_request	=3D ast_udc_ep_alloc_request,
> +	.free_request	=3D ast_udc_ep_free_request,
> +	.queue		=3D ast_udc_ep_queue,
> +	.dequeue	=3D ast_udc_ep_dequeue,
> +	.set_halt	=3D ast_udc_ep_set_halt,
> +	/* there's only imprecise fifo status reporting */ };
> +
> +static void ast_udc_ep0_rx(struct ast_udc_dev *udc) {
> +	ast_udc_write(udc, udc->ep0_buf_dma, AST_UDC_EP0_DATA_BUFF);
> +	ast_udc_write(udc, EP0_RX_BUFF_RDY, AST_UDC_EP0_CTRL); }
> +
> +static void ast_udc_ep0_tx(struct ast_udc_dev *udc) {
> +	ast_udc_write(udc, udc->ep0_buf_dma, AST_UDC_EP0_DATA_BUFF);
> +	ast_udc_write(udc, EP0_TX_BUFF_RDY, AST_UDC_EP0_CTRL); }
> +
> +static void ast_udc_ep0_out(struct ast_udc_dev *udc) {
> +	struct device *dev =3D &udc->pdev->dev;
> +	struct ast_udc_ep *ep =3D &udc->ep[0];
> +	struct ast_udc_request *req;
> +	u16 rx_len;
> +
> +	if (list_empty(&ep->queue))
> +		return;
> +
> +	req =3D list_entry(ep->queue.next, struct ast_udc_request, queue);
> +
> +	rx_len =3D EP0_GET_RX_LEN(ast_udc_read(udc, AST_UDC_EP0_CTRL));
> +	req->req.actual +=3D rx_len;
> +
> +	SETUP_DBG(udc, "req %p (%d/%d)\n", req,
> +		  req->req.actual, req->req.length);
> +
> +	if ((rx_len < ep->ep.maxpacket) ||
> +	    (req->req.actual =3D=3D req->req.length)) {
> +		ast_udc_ep0_tx(udc);
> +		if (!ep->dir_in)
> +			ast_udc_done(ep, req, 0);
> +
> +	} else {
> +		if (rx_len > req->req.length) {
> +			// Issue Fix
> +			dev_warn(dev, "Something wrong (%d/%d)\n",
> +				 req->req.actual, req->req.length);
> +			ast_udc_ep0_tx(udc);
> +			ast_udc_done(ep, req, 0);
> +			return;
> +		}
> +
> +		ep->dir_in =3D 0;
> +
> +		/* More works */
> +		ast_udc_ep0_queue(ep, req);
> +	}
> +}
> +
> +static void ast_udc_ep0_in(struct ast_udc_dev *udc) {
> +	struct ast_udc_ep *ep =3D &udc->ep[0];
> +	struct ast_udc_request *req;
> +
> +	if (list_empty(&ep->queue)) {
> +		if (udc->is_control_tx) {
> +			ast_udc_ep0_rx(udc);
> +			udc->is_control_tx =3D 0;
> +		}
> +
> +		return;
> +	}
> +
> +	req =3D list_entry(ep->queue.next, struct ast_udc_request, queue);
> +
> +	SETUP_DBG(udc, "req %p (%d/%d)\n", req,
> +		  req->req.actual, req->req.length);
> +
> +	if (req->req.length =3D=3D req->req.actual) {
> +		if (req->req.length)
> +			ast_udc_ep0_rx(udc);
> +
> +		if (ep->dir_in)
> +			ast_udc_done(ep, req, 0);
> +
> +	} else {
> +		/* More works */
> +		ast_udc_ep0_queue(ep, req);
> +	}
> +}
> +
> +static void ast_udc_epn_handle(struct ast_udc_dev *udc, u16 ep_num) {
> +	struct ast_udc_ep *ep =3D &udc->ep[ep_num];
> +	struct ast_udc_request *req;
> +	u16 len =3D 0;
> +
> +	if (list_empty(&ep->queue))
> +		return;
> +
> +	req =3D list_first_entry(&ep->queue, struct ast_udc_request, queue);
> +
> +	len =3D EP_DMA_GET_TX_SIZE(ast_ep_read(ep, AST_UDC_EP_DMA_STS));
> +	req->req.actual +=3D len;
> +
> +	EP_DBG(ep, "req @%p, length:(%d/%d), %s:0x%x\n", req,
> +		req->req.actual, req->req.length, "len", len);
> +
> +	/* Done this request */
> +	if (req->req.length =3D=3D req->req.actual) {
> +		ast_udc_done(ep, req, 0);
> +		req =3D list_first_entry_or_null(&ep->queue,
> +					       struct ast_udc_request,
> +					       queue);
> +
> +	} else {
> +		/* Check for short packet */
> +		if (len < ep->ep.maxpacket) {
> +			ast_udc_done(ep, req, 0);
> +			req =3D list_first_entry_or_null(&ep->queue,
> +						       struct ast_udc_request,
> +						       queue);
> +		}
> +	}
> +
> +	/* More requests */
> +	if (req)
> +		ast_udc_epn_kick(ep, req);
> +}
> +
> +static void ast_udc_epn_handle_desc(struct ast_udc_dev *udc, u16
> +ep_num) {
> +	struct ast_udc_ep *ep =3D &udc->ep[ep_num];
> +	struct device *dev =3D &udc->pdev->dev;
> +	struct ast_udc_request *req;
> +	u32 proc_sts, wr_ptr, rd_ptr;
> +	u32 len_in_desc, ctrl;
> +	u16 total_len =3D 0;
> +	int i;
> +
> +	if (list_empty(&ep->queue)) {
> +		dev_warn(dev, "%s reqest queue empty !\n", ep->ep.name);
> +		return;
> +	}
> +
> +	req =3D list_first_entry(&ep->queue, struct ast_udc_request, queue);
> +
> +	ctrl =3D ast_ep_read(ep, AST_UDC_EP_DMA_CTRL);
> +	proc_sts =3D EP_DMA_CTRL_GET_PROC_STS(ctrl);
> +
> +	/* Check processing status is idle */
> +	if (proc_sts !=3D EP_DMA_CTRL_STS_RX_IDLE &&
> +	    proc_sts !=3D EP_DMA_CTRL_STS_TX_IDLE) {
> +		dev_warn(dev, "EP DMA CTRL: 0x%x, PS:0x%x\n",
> +			 ast_ep_read(ep, AST_UDC_EP_DMA_CTRL),
> +			 proc_sts);
> +		return;
> +	}
> +
> +	ctrl =3D ast_ep_read(ep, AST_UDC_EP_DMA_STS);
> +	rd_ptr =3D EP_DMA_GET_RPTR(ctrl);
> +	wr_ptr =3D EP_DMA_GET_WPTR(ctrl);
> +
> +	if (rd_ptr !=3D wr_ptr) {
> +		dev_warn(dev, "desc list is not empty ! %s:%d, %s:%d\n",
> +		"rptr", rd_ptr, "wptr", wr_ptr);
> +		return;
> +	}
> +
> +	EP_DBG(ep, "rd_ptr:%d, wr_ptr:%d\n", rd_ptr, wr_ptr);
> +	i =3D req->saved_dma_wptr;
> +
> +	do {
> +		len_in_desc =3D EP_DESC1_IN_LEN(ep->descs[i].des_1);
> +		EP_DBG(ep, "desc[%d] len: %d\n", i, len_in_desc);
> +		total_len +=3D len_in_desc;
> +		i++;
> +		if (i >=3D AST_UDC_DESCS_COUNT)
> +			i =3D 0;
> +
> +	} while (i !=3D wr_ptr);
> +
> +	req->req.actual +=3D total_len;
> +
> +	EP_DBG(ep, "req @%p, length:(%d/%d), %s:0x%x\n", req,
> +		req->req.actual, req->req.length, "len", total_len);
> +
> +	/* Done this request */
> +	if (req->req.length =3D=3D req->req.actual) {
> +		ast_udc_done(ep, req, 0);
> +		req =3D list_first_entry_or_null(&ep->queue,
> +					       struct ast_udc_request,
> +					       queue);
> +
> +	} else {
> +		/* Check for short packet */
> +		if (total_len < ep->ep.maxpacket) {
> +			ast_udc_done(ep, req, 0);
> +			req =3D list_first_entry_or_null(&ep->queue,
> +						       struct ast_udc_request,
> +						       queue);
> +		}
> +	}
> +
> +	/* More requests & dma descs not setup yet */
> +	if (req && (req->actual_dma_length =3D=3D req->req.actual)) {
> +		EP_DBG(ep, "More requests\n");
> +		ast_udc_epn_kick_desc(ep, req);
> +	}
> +}
> +
> +static void ast_udc_ep0_data_tx(struct ast_udc_dev *udc, u8 *tx_data,
> +u32 len) {
> +	if (len) {
> +		memcpy(udc->ep0_buf, tx_data, len);
> +
> +		ast_udc_write(udc, udc->ep0_buf_dma, AST_UDC_EP0_DATA_BUFF);
> +		ast_udc_write(udc, EP0_TX_LEN(len), AST_UDC_EP0_CTRL);
> +		ast_udc_write(udc, EP0_TX_LEN(len) | EP0_TX_BUFF_RDY,
> +			      AST_UDC_EP0_CTRL);
> +		udc->is_control_tx =3D 1;
> +
> +	} else
> +		ast_udc_write(udc, EP0_TX_BUFF_RDY, AST_UDC_EP0_CTRL); }
> +
> +static void ast_udc_getstatus(struct ast_udc_dev *udc) {
> +	struct usb_ctrlrequest crq;
> +	struct ast_udc_ep *ep;
> +	u16 status =3D 0;
> +	u16 epnum =3D 0;
> +
> +	memcpy_fromio(&crq, udc->creq, sizeof(crq));
> +
> +	switch (crq.bRequestType & USB_RECIP_MASK) {
> +	case USB_RECIP_DEVICE:
> +		/* Get device status */
> +		status =3D 1 << USB_DEVICE_SELF_POWERED;
> +		break;
> +	case USB_RECIP_INTERFACE:
> +		break;
> +	case USB_RECIP_ENDPOINT:
> +		epnum =3D crq.wIndex & USB_ENDPOINT_NUMBER_MASK;
> +		status =3D udc->ep[epnum].stopped;
> +		break;
> +	default:
> +		goto stall;
> +	}
> +
> +	ep =3D &udc->ep[epnum];
> +	EP_DBG(ep, "status: 0x%x\n", status);
> +	ast_udc_ep0_data_tx(udc, (u8 *)&status, sizeof(status));
> +
> +	return;
> +
> +stall:
> +	EP_DBG(ep, "Can't respond request\n");
> +	ast_udc_write(udc, ast_udc_read(udc, AST_UDC_EP0_CTRL) | EP0_STALL,
> +		      AST_UDC_EP0_CTRL);
> +}
> +
> +static void ast_udc_ep0_handle_setup(struct ast_udc_dev *udc) {
> +	struct ast_udc_ep *ep =3D &udc->ep[0];
> +	struct ast_udc_request *req;
> +	struct usb_ctrlrequest crq;
> +	int req_num =3D 0;
> +	int rc =3D 0;
> +	u32 reg;
> +
> +	memcpy_fromio(&crq, udc->creq, sizeof(crq));
> +
> +	SETUP_DBG(udc, "SETEUP packet: %02x/%02x/%04x/%04x/%04x\n",
> +		  crq.bRequestType, crq.bRequest, le16_to_cpu(crq.wValue),
> +		  le16_to_cpu(crq.wIndex), le16_to_cpu(crq.wLength));
> +
> +	/*
> +	 * Cleanup ep0 request(s) in queue because
> +	 * there is a new control setup comes.
> +	 */
> +	list_for_each_entry(req, &udc->ep[0].queue, queue) {
> +		req_num++;
> +		EP_DBG(ep, "there is req %p in ep0 queue !\n", req);
> +	}
> +
> +	if (req_num)
> +		ast_udc_nuke(&udc->ep[0], -ETIMEDOUT);
> +
> +	udc->ep[0].dir_in =3D crq.bRequestType & USB_DIR_IN;
> +
> +	if ((crq.bRequestType & USB_TYPE_MASK) =3D=3D USB_TYPE_STANDARD) {
> +		switch (crq.bRequest) {
> +		case USB_REQ_SET_ADDRESS:
> +			if (ast_udc_read(udc, AST_UDC_STS) & UDC_STS_HIGHSPEED)
> +				udc->gadget.speed =3D USB_SPEED_HIGH;
> +			else
> +				udc->gadget.speed =3D USB_SPEED_FULL;
> +
> +			SETUP_DBG(udc, "set addr: 0x%x\n", crq.wValue);
> +			reg =3D ast_udc_read(udc, AST_UDC_CONFIG);
> +			reg &=3D ~UDC_CFG_ADDR_MASK;
> +			reg |=3D UDC_CFG_SET_ADDR(crq.wValue);
> +			ast_udc_write(udc, reg, AST_UDC_CONFIG);
> +			goto req_complete;
> +
> +		case USB_REQ_CLEAR_FEATURE:
> +			SETUP_DBG(udc, "ep0: CLEAR FEATURE\n");
> +			goto req_driver;
> +
> +		case USB_REQ_SET_FEATURE:
> +			SETUP_DBG(udc, "ep0: SET FEATURE\n");
> +			goto req_driver;
> +
> +		case USB_REQ_GET_STATUS:
> +			ast_udc_getstatus(udc);
> +			return;
> +
> +		default:
> +			goto req_driver;
> +		}
> +
> +	}
> +
> +req_driver:
> +	if (udc->driver) {
> +		SETUP_DBG(udc, "Forwarding %s to gadget...\n",
> +			  udc->gadget.name);
> +
> +		spin_unlock(&udc->lock);
> +		rc =3D udc->driver->setup(&udc->gadget, &crq);
> +		spin_lock(&udc->lock);
> +
> +	} else {
> +		SETUP_DBG(udc, "No gadget for request !\n");
> +	}
> +
> +	if (rc >=3D 0)
> +		return;
> +
> +	/* Stall if gadget failed */
> +	SETUP_DBG(udc, "Stalling, rc:0x%x\n", rc);
> +	ast_udc_write(udc, ast_udc_read(udc, AST_UDC_EP0_CTRL) | EP0_STALL,
> +		      AST_UDC_EP0_CTRL);
> +	return;
> +
> +req_complete:
> +	SETUP_DBG(udc, "ep0: Sending IN status without data\n");
> +	ast_udc_write(udc, EP0_TX_BUFF_RDY, AST_UDC_EP0_CTRL); }
> +
> +static irqreturn_t ast_udc_isr(int irq, void *data) {
> +	struct ast_udc_dev *udc =3D (struct ast_udc_dev *)data;
> +	struct ast_udc_ep *ep;
> +	u32 isr, ep_isr;
> +	int i;
> +
> +	spin_lock(&udc->lock);
> +
> +	isr =3D ast_udc_read(udc, AST_UDC_ISR);
> +	if (!isr)
> +		goto done;
> +
> +	/* Ack interrupts */
> +	ast_udc_write(udc, isr, AST_UDC_ISR);
> +
> +	if (isr & UDC_IRQ_BUS_RESET) {
> +		ISR_DBG(udc, "UDC_IRQ_BUS_RESET\n");
> +		udc->gadget.speed =3D USB_SPEED_UNKNOWN;
> +
> +		ep =3D &udc->ep[1];
> +		EP_DBG(ep, "dctrl:0x%x\n",
> +		       ast_ep_read(ep, AST_UDC_EP_DMA_CTRL));
> +
> +		if (udc->driver && udc->driver->reset) {
> +			spin_unlock(&udc->lock);
> +			udc->driver->reset(&udc->gadget);
> +			spin_lock(&udc->lock);
> +		}
> +	}
> +
> +	if (isr & UDC_IRQ_BUS_SUSPEND) {
> +		ISR_DBG(udc, "UDC_IRQ_BUS_SUSPEND\n");
> +		udc->suspended_from =3D udc->gadget.state;
> +		usb_gadget_set_state(&udc->gadget, USB_STATE_SUSPENDED);
> +
> +		if (udc->driver && udc->driver->suspend) {
> +			spin_unlock(&udc->lock);
> +			udc->driver->suspend(&udc->gadget);
> +			spin_lock(&udc->lock);
> +		}
> +	}
> +
> +	if (isr & UDC_IRQ_BUS_RESUME) {
> +		ISR_DBG(udc, "UDC_IRQ_BUS_RESUME\n");
> +		usb_gadget_set_state(&udc->gadget, udc->suspended_from);
> +
> +		if (udc->driver && udc->driver->resume) {
> +			spin_unlock(&udc->lock);
> +			udc->driver->resume(&udc->gadget);
> +			spin_lock(&udc->lock);
> +		}
> +	}
> +
> +	if (isr & UDC_IRQ_EP0_IN_ACK_STALL) {
> +		ISR_DBG(udc, "UDC_IRQ_EP0_IN_ACK_STALL\n");
> +		ast_udc_ep0_in(udc);
> +	}
> +
> +	if (isr & UDC_IRQ_EP0_OUT_ACK_STALL) {
> +		ISR_DBG(udc, "UDC_IRQ_EP0_OUT_ACK_STALL\n");
> +		ast_udc_ep0_out(udc);
> +	}
> +
> +	if (isr & UDC_IRQ_EP0_SETUP) {
> +		ISR_DBG(udc, "UDC_IRQ_EP0_SETUP\n");
> +		ast_udc_ep0_handle_setup(udc);
> +	}
> +
> +	if (isr & UDC_IRQ_EP_POOL_ACK_STALL) {
> +		ISR_DBG(udc, "UDC_IRQ_EP_POOL_ACK_STALL\n");
> +		ep_isr =3D ast_udc_read(udc, AST_UDC_EP_ACK_ISR);
> +
> +		/* Ack EP interrupts */
> +		ast_udc_write(udc, ep_isr, AST_UDC_EP_ACK_ISR);
> +
> +		/* Handle each EP */
> +		for (i =3D 0; i < AST_UDC_NUM_ENDPOINTS - 1; i++) {
> +			if (ep_isr & (0x1 << i)) {
> +				ep =3D &udc->ep[i + 1];
> +				if (ep->desc_mode)
> +					ast_udc_epn_handle_desc(udc, i + 1);
> +				else
> +					ast_udc_epn_handle(udc, i + 1);
> +			}
> +		}
> +	}
> +
> +done:
> +	spin_unlock(&udc->lock);
> +	return IRQ_HANDLED;
> +}
> +
> +static int ast_udc_gadget_getframe(struct usb_gadget *gadget) {
> +	struct ast_udc_dev *udc =3D to_ast_dev(gadget);
> +
> +	return (ast_udc_read(udc, AST_UDC_STS) >> 16) & 0x7ff; }
> +
> +static void ast_udc_wake_work(struct work_struct *work) {
> +	struct ast_udc_dev *udc =3D container_of(work, struct ast_udc_dev,
> +					       wake_work);
> +	unsigned long flags;
> +	u32 ctrl;
> +
> +	spin_lock_irqsave(&udc->lock, flags);
> +
> +	UDC_DBG(udc, "Wakeup Host !\n");
> +	ctrl =3D ast_udc_read(udc, AST_UDC_FUNC_CTRL);
> +	ast_udc_write(udc, ctrl | USB_REMOTE_WAKEUP_EN,
> AST_UDC_FUNC_CTRL);
> +
> +	spin_unlock_irqrestore(&udc->lock, flags); }
> +
> +static void ast_udc_wakeup_all(struct ast_udc_dev *udc) {
> +	/*
> +	 * A device is trying to wake the world, because this
> +	 * can recurse into the device, we break the call chain
> +	 * using a work queue
> +	 */
> +	schedule_work(&udc->wake_work);
> +}
> +
> +static int ast_udc_wakeup(struct usb_gadget *gadget) {
> +	struct ast_udc_dev *udc =3D to_ast_dev(gadget);
> +	unsigned long flags;
> +	int rc =3D 0;
> +
> +	spin_lock_irqsave(&udc->lock, flags);
> +
> +	if (!udc->wakeup_en) {
> +		UDC_DBG(udc, "Remote Wakeup is disabled\n");
> +		rc =3D -EINVAL;
> +		goto err;
> +	}
> +
> +	UDC_DBG(udc, "Device initiated wakeup\n");
> +	ast_udc_wakeup_all(udc);
> +
> +err:
> +	spin_unlock_irqrestore(&udc->lock, flags);
> +	return rc;
> +}
> +
> +/*
> + * Activate/Deactivate link with host
> + */
> +static int ast_udc_pullup(struct usb_gadget *gadget, int is_on) {
> +	struct ast_udc_dev *udc =3D to_ast_dev(gadget);
> +	unsigned long flags;
> +	u32 ctrl;
> +
> +	spin_lock_irqsave(&udc->lock, flags);
> +
> +	UDC_DBG(udc, "is_on: %d\n", is_on);
> +	if (is_on)
> +		ctrl =3D ast_udc_read(udc, AST_UDC_FUNC_CTRL) |
> USB_UPSTREAM_EN;
> +	else
> +		ctrl =3D ast_udc_read(udc, AST_UDC_FUNC_CTRL) &
> ~USB_UPSTREAM_EN;
> +
> +	ast_udc_write(udc, ctrl, AST_UDC_FUNC_CTRL);
> +
> +	spin_unlock_irqrestore(&udc->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int ast_udc_start(struct usb_gadget *gadget,
> +			 struct usb_gadget_driver *driver)
> +{
> +	struct ast_udc_dev *udc =3D to_ast_dev(gadget);
> +	struct ast_udc_ep *ep;
> +	unsigned long flags;
> +	int i;
> +
> +	spin_lock_irqsave(&udc->lock, flags);
> +
> +	UDC_DBG(udc, "\n");
> +	udc->driver =3D driver;
> +	udc->gadget.dev.of_node =3D udc->pdev->dev.of_node;
> +
> +	for (i =3D 0; i < AST_UDC_NUM_ENDPOINTS; i++) {
> +		ep =3D &udc->ep[i];
> +		ep->stopped =3D 0;
> +	}
> +
> +	spin_unlock_irqrestore(&udc->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int ast_udc_stop(struct usb_gadget *gadget) {
> +	struct ast_udc_dev *udc =3D to_ast_dev(gadget);
> +	unsigned long flags;
> +	u32 ctrl;
> +
> +	spin_lock_irqsave(&udc->lock, flags);
> +
> +	UDC_DBG(udc, "\n");
> +	ctrl =3D ast_udc_read(udc, AST_UDC_FUNC_CTRL) & ~USB_UPSTREAM_EN;
> +	ast_udc_write(udc, ctrl, AST_UDC_FUNC_CTRL);
> +
> +	udc->gadget.speed =3D USB_SPEED_UNKNOWN;
> +	udc->driver =3D NULL;
> +
> +	ast_udc_stop_activity(udc);
> +	usb_gadget_set_state(&udc->gadget, USB_STATE_NOTATTACHED);
> +
> +	spin_unlock_irqrestore(&udc->lock, flags);
> +
> +	return 0;
> +}
> +
> +static const struct usb_gadget_ops ast_udc_ops =3D {
> +	.get_frame		=3D ast_udc_gadget_getframe,
> +	.wakeup			=3D ast_udc_wakeup,
> +	.pullup			=3D ast_udc_pullup,
> +	.udc_start		=3D ast_udc_start,
> +	.udc_stop		=3D ast_udc_stop,
> +};
> +
> +/*
> + * Support 1 Control Endpoint.
> + * Support multiple programmable endpoints that can be configured to
> + * Bulk IN/OUT, Interrupt IN/OUT, and Isochronous IN/OUT type endpoint.
> + */
> +static void ast_udc_init_ep(struct ast_udc_dev *udc) {
> +	struct ast_udc_ep *ep;
> +	int i;
> +
> +	for (i =3D 0; i < AST_UDC_NUM_ENDPOINTS; i++) {
> +		ep =3D &udc->ep[i];
> +		ep->ep.name =3D ast_ep_name[i];
> +		if (i =3D=3D 0) {
> +			ep->ep.caps.type_control =3D true;
> +		} else {
> +			ep->ep.caps.type_iso =3D true;
> +			ep->ep.caps.type_bulk =3D true;
> +			ep->ep.caps.type_int =3D true;
> +		}
> +		ep->ep.caps.dir_in =3D true;
> +		ep->ep.caps.dir_out =3D true;
> +
> +		ep->ep.ops =3D &ast_udc_ep_ops;
> +		ep->udc =3D udc;
> +
> +		INIT_LIST_HEAD(&ep->queue);
> +
> +		if (i =3D=3D 0) {
> +			usb_ep_set_maxpacket_limit(&ep->ep,
> +						   AST_UDC_EP0_MAX_PACKET);
> +			continue;
> +		}
> +
> +		ep->ep_reg =3D udc->reg + AST_UDC_EP_BASE +
> +				(AST_UDC_EP_OFFSET * (i - 1));
> +
> +		ep->epn_buf =3D udc->ep0_buf + (i * AST_UDC_EP_DMA_SIZE);
> +		ep->epn_buf_dma =3D udc->ep0_buf_dma + (i *
> AST_UDC_EP_DMA_SIZE);
> +		usb_ep_set_maxpacket_limit(&ep->ep,
> AST_UDC_EPn_MAX_PACKET);
> +
> +		ep->descs =3D ep->epn_buf + AST_UDC_EPn_MAX_PACKET;
> +		ep->descs_dma =3D ep->epn_buf_dma + AST_UDC_EPn_MAX_PACKET;
> +		ep->descs_wptr =3D 0;
> +
> +		list_add_tail(&ep->ep.ep_list, &udc->gadget.ep_list);
> +	}
> +}
> +
> +static void ast_udc_init_dev(struct ast_udc_dev *udc) {
> +	INIT_WORK(&udc->wake_work, ast_udc_wake_work); }
> +
> +static void ast_udc_init_hw(struct ast_udc_dev *udc) {
> +	u32 ctrl;
> +
> +	/* Enable PHY */
> +	ctrl =3D USB_PHY_CLK_EN | USB_PHY_RESET_DIS;
> +	ast_udc_write(udc, ctrl, AST_UDC_FUNC_CTRL);
> +
> +	udelay(1);
> +	ast_udc_write(udc, 0, AST_UDC_DEV_RESET);
> +
> +	/* Set descriptor ring size */
> +	if (AST_UDC_DESCS_COUNT =3D=3D 256) {
> +		ctrl |=3D USB_EP_LONG_DESC;
> +		ast_udc_write(udc, ctrl, AST_UDC_FUNC_CTRL);
> +	}
> +
> +	/* Mask & ack all interrupts before installing the handler */
> +	ast_udc_write(udc, 0, AST_UDC_IER);
> +	ast_udc_write(udc, UDC_IRQ_ACK_ALL, AST_UDC_ISR);
> +
> +	/* Enable some interrupts */
> +	ctrl =3D UDC_IRQ_EP_POOL_ACK_STALL | UDC_IRQ_BUS_RESUME |
> +	       UDC_IRQ_BUS_SUSPEND | UDC_IRQ_BUS_RESET |
> +	       UDC_IRQ_EP0_IN_ACK_STALL | UDC_IRQ_EP0_OUT_ACK_STALL
> |
> +	       UDC_IRQ_EP0_SETUP;
> +	ast_udc_write(udc, ctrl, AST_UDC_IER);
> +
> +	/* Cleanup and enable ep ACK interrupts */
> +	ast_udc_write(udc, UDC_IRQ_EP_ACK_ALL, AST_UDC_EP_ACK_IER);
> +	ast_udc_write(udc, UDC_IRQ_EP_ACK_ALL, AST_UDC_EP_ACK_ISR);
> +
> +	ast_udc_write(udc, 0, AST_UDC_EP0_CTRL); }
> +
> +static int ast_udc_remove(struct platform_device *pdev) {
> +	struct ast_udc_dev *udc =3D platform_get_drvdata(pdev);
> +	unsigned long flags;
> +	u32 ctrl;
> +
> +	usb_del_gadget_udc(&udc->gadget);
> +	if (udc->driver)
> +		return -EBUSY;
> +
> +	spin_lock_irqsave(&udc->lock, flags);
> +
> +	/* Disable upstream port connection */
> +	ctrl =3D ast_udc_read(udc, AST_UDC_FUNC_CTRL) & ~USB_UPSTREAM_EN;
> +	ast_udc_write(udc, ctrl, AST_UDC_FUNC_CTRL);
> +
> +	clk_disable_unprepare(udc->clk);
> +
> +	spin_unlock_irqrestore(&udc->lock, flags);
> +
> +	if (udc->ep0_buf)
> +		dma_free_coherent(&pdev->dev,
> +				  AST_UDC_EP_DMA_SIZE * AST_UDC_NUM_ENDPOINTS,
> +				  udc->ep0_buf,
> +				  udc->ep0_buf_dma);
> +
> +	udc->ep0_buf =3D NULL;
> +
> +	return 0;
> +}
> +
> +static int ast_udc_probe(struct platform_device *pdev) {
> +	enum usb_device_speed max_speed;
> +	struct device *dev =3D &pdev->dev;
> +	struct ast_udc_dev *udc;
> +	struct resource *res;
> +	int rc;
> +
> +	udc =3D devm_kzalloc(&pdev->dev, sizeof(struct ast_udc_dev),
> GFP_KERNEL);
> +	if (!udc)
> +		return -ENOMEM;
> +
> +	udc->gadget.dev.parent =3D dev;
> +	udc->pdev =3D pdev;
> +	spin_lock_init(&udc->lock);
> +
> +	udc->gadget.ops =3D &ast_udc_ops;
> +	udc->gadget.ep0 =3D &udc->ep[0].ep;
> +	udc->gadget.name =3D "aspeed-udc";
> +	udc->gadget.dev.init_name =3D "gadget";
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	udc->reg =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(udc->reg)) {
> +		dev_err(&pdev->dev, "Failed to map resources\n");
> +		return PTR_ERR(udc->reg);
> +	}
> +
> +	platform_set_drvdata(pdev, udc);
> +
> +	udc->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(udc->clk)) {
> +		rc =3D PTR_ERR(udc->clk);
> +		goto err;
> +	}
> +	rc =3D clk_prepare_enable(udc->clk);
> +	if (rc) {
> +		dev_err(&pdev->dev, "Failed to enable clock (0x%x)\n", rc);
> +		goto err;
> +	}
> +
> +	/* Check if we need to limit the HW to USB1 */
> +	max_speed =3D usb_get_maximum_speed(&pdev->dev);
> +	if (max_speed !=3D USB_SPEED_UNKNOWN && max_speed <
> USB_SPEED_HIGH)
> +		udc->force_usb1 =3D true;
> +
> +	/*
> +	 * Allocate DMA buffers for all EPs in one chunk
> +	 */
> +	udc->ep0_buf =3D dma_alloc_coherent(&pdev->dev,
> +					  AST_UDC_EP_DMA_SIZE *
> +					  AST_UDC_NUM_ENDPOINTS,
> +					  &udc->ep0_buf_dma, GFP_KERNEL);
> +
> +	udc->gadget.speed =3D USB_SPEED_UNKNOWN;
> +	udc->gadget.max_speed =3D USB_SPEED_HIGH;
> +	udc->creq =3D udc->reg + AST_UDC_SETUP0;
> +
> +	/*
> +	 * Support single stage mode or 32/256 stages descriptor mode.
> +	 * Set default as Descriptor Mode.
> +	 */
> +	udc->desc_mode =3D AST_UDC_DESC_MODE;
> +
> +	dev_info(&pdev->dev, "DMA %s\n", udc->desc_mode ?
> +		 "descriptor mode" : "single mode");
> +
> +	INIT_LIST_HEAD(&udc->gadget.ep_list);
> +	INIT_LIST_HEAD(&udc->gadget.ep0->ep_list);
> +
> +	/* Initialized udc ep */
> +	ast_udc_init_ep(udc);
> +
> +	/* Initialized udc device */
> +	ast_udc_init_dev(udc);
> +
> +	/* Initialized udc hardware */
> +	ast_udc_init_hw(udc);
> +
> +	/* Find interrupt and install handler */
> +	udc->irq =3D platform_get_irq(pdev, 0);
> +	if (udc->irq < 0) {
> +		dev_err(&pdev->dev, "Failed to get interrupt\n");
> +		rc =3D udc->irq;
> +		goto err;
> +	}
> +
> +	rc =3D devm_request_irq(&pdev->dev, udc->irq, ast_udc_isr, 0,
> +			      KBUILD_MODNAME, udc);
> +	if (rc) {
> +		dev_err(&pdev->dev, "Failed to request interrupt\n");
> +		goto err;
> +	}
> +
> +	rc =3D usb_add_gadget_udc(&pdev->dev, &udc->gadget);
> +	if (rc) {
> +		dev_err(&pdev->dev, "Failed to add gadget udc\n");
> +		goto err;
> +	}
> +
> +	dev_info(&pdev->dev, "Initialized udc in USB%s mode\n",
> +		 udc->force_usb1 ? "1" : "2");
> +
> +	return 0;
> +
> +err:
> +	dev_err(&pdev->dev, "Failed to udc probe, rc:0x%x\n", rc);
> +	ast_udc_remove(pdev);
> +
> +	return rc;
> +}
> +
> +static const struct of_device_id ast_udc_of_dt_ids[] =3D {
> +	{ .compatible =3D "aspeed,ast2600-udc", },
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(of, ast_udc_of_dt_ids);
> +
> +static struct platform_driver ast_udc_driver =3D {
> +	.probe			=3D ast_udc_probe,
> +	.remove			=3D ast_udc_remove,
> +	.driver			=3D {
> +		.name			=3D KBUILD_MODNAME,
> +		.of_match_table		=3D ast_udc_of_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(ast_udc_driver);
> +
> +MODULE_DESCRIPTION("ASPEED UDC driver"); MODULE_AUTHOR("Neal Liu
> +<neal_liu@aspeedtech.com>"); MODULE_LICENSE("GPL");
> --
> 2.25.1

