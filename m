Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C08A13B4C0A
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jun 2021 04:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209086E9BF;
	Sat, 26 Jun 2021 02:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D891A6E9BD;
 Sat, 26 Jun 2021 02:41:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXOlnE1eYVOXmjT2wWRGK097aKX7y7zri5eCEKFUMgkBUQVbLoN0ukerIMPR39xaCj/5/p8uNfqYlyJgpuKZu25yd1fnfdMQZgAeWGIPAkfF6JzEWv/kRdOvcSFAAOmCgVuNH+4NKxtbO0Gjt9jPE/76g9rdUFZjXYHYUQm1nILYbzcf85uKolJcn6wbIY/VqIZag6dLYfsI7pfC7L+CzWlE2eoHLu9YpwbvjhXhxXMvIYPlL9yIbeVAPdhafxcqRG2CgyzDJ1OcQtuGclj5GJfRd8jXrr15qE+lM30zxcr9UeDsLJqvm+HA3G/YmX+SVfEVqPPav94SBLsVKbM3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DY1EwPTlX2oQTM9JUbNIyIFbIIHh3X6kPkNgZnuutdQ=;
 b=U/V9M8f82trjEtEybbp+71NTEdMG1f2xHCq5nILDl9buydMft60ZM3yGyvj1MFhj+sjEUPR6TBtpocx8XU/A/YtwSGW3RLHPJFJUh4OoGtAh1ZL023nOO/4N25bXUICcCkqY3WNkvd/d4nUisoqjl8L2axv0PXRC4D5ssmJt+Ch27qIXgrM9qYqmktkAY8EoG29Cl48PmWlyM3hTevqiOKAN5WRM9ww4YFZdrwV+aNAlNw7z4hWr60143MEnF4qQ/FygOeeuPrqHiFhTgZIYqyZrJcaI/XxTvqN1LDhCviMzQRqModel7dRJe0KYKckv31G5HD80SNUAnemSRmqagA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DY1EwPTlX2oQTM9JUbNIyIFbIIHh3X6kPkNgZnuutdQ=;
 b=PwtSKmWlcpy66jYlSfY/6733zXD1RHz4VOaIM6HFiqPf0E+OLrzE1X48292+hJzsSAppNueC2X2mU1yrm/+knEzv4MInoj5s7YkbSS9orzU2HmbT1TSrkfT5V3OxtJvnSDOPv0b2K2MMOqsvJlz8SW47yxK9tL6j9m+riPi75uU=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6671.namprd05.prod.outlook.com (2603:10b6:208:d7::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.7; Sat, 26 Jun
 2021 02:41:07 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::45fe:a746:21e9:e8fc]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::45fe:a746:21e9:e8fc%6]) with mapi id 15.20.4264.023; Sat, 26 Jun 2021
 02:41:07 +0000
From: Zack Rusin <zackr@vmware.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 25/27] drm/vmwgfx: Don't set struct
 drm_device.irq_enabled
Thread-Topic: [PATCH v4 25/27] drm/vmwgfx: Don't set struct
 drm_device.irq_enabled
Thread-Index: AQHXaZtTePw5ruzrRkKIZ2BFLdAIq6slljUA
Date: Sat, 26 Jun 2021 02:41:07 +0000
Message-ID: <F2415B80-87BE-42B5-958A-E947CE693674@vmware.com>
References: <20210625082222.3845-1-tzimmermann@suse.de>
 <20210625082222.3845-26-tzimmermann@suse.de>
In-Reply-To: <20210625082222.3845-26-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.40.0.2.32)
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d724b7c-f3c9-4351-1544-08d9384bd99c
x-ms-traffictypediagnostic: MN2PR05MB6671:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB66716FE697D757755DFEDA7ECE059@MN2PR05MB6671.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9YwUGa9F59jPW5t10bxqwgTENH6AhjpdXJ+hkBSc8kZzyGF7/zC37JgtM+Cxxyx+6z0NQt6t8CHGK4bW33KkWjsq4cJHoVuDNrcEsLJwIe+vw+yIEHh1BcPslTXdJc9fiEpeG+8zH5lMua74e8KIa2CgUt8Vi8naVBRXP9rYTsGCfBOvbqKpNuP7u6dtIK+iv8cmu1oto1pm0FsAaLaJCUe4EVJH/REr4a/n0bfB6tLEulICwfm9uDdA/sSCYY0nOWQ2YOaXcCZeMmbzdBxInBaxpPA8jaoFZc2N3Rj8/fx01GdJI4CqzMNNz3SbKKWXyG/+A360NWea4hHyZZnu7smyeFJLSPKY//aELvoiSVrP3KLcNg1Djqubdr4iema9cl20/oLLYQuaaqXixKYoMbMMCW+Gxlfghg62kGYByjqfoWXdlQTHi9gk/Svgw+PgXByt52m5U2cFMT7gPRSyHhzoJAkweCKC78LLrmEQZ+nfaj/Vmlxwa1aubD49QhYs2W/8kbTp+Ooh31t6OdX6CIhrYetaqmbGWO3DrXapH6+89PKh8j1KG31roqqb4WEEVnOYiDSKGb8L5E4RDk0AAlA7KDrZZwvdTbtpj2HFcIdsn8r4bhco9xUrsTqwi7Ht5YJXua6hHyKV3NbAX9Xs4LWkZvyg/yfPNHpU89R0dao+qnHw3SXA/RC8xJrv7hBqQSCBPJuxPgJMN/ePdOU4tQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(86362001)(6916009)(66946007)(8676002)(7406005)(6506007)(66446008)(186003)(76116006)(53546011)(64756008)(8936002)(38100700002)(7416002)(71200400001)(66556008)(33656002)(122000001)(6512007)(26005)(66476007)(7366002)(4326008)(4744005)(316002)(5660300002)(36756003)(6486002)(54906003)(2616005)(2906002)(478600001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?U+rMibFYRBMdXU+oi3q9RiPhFagWoXjHonBkzopt9w0kphcIf4jeVA+4No?=
 =?iso-8859-1?Q?HXoSpYlOujO6tpBtssela6Tf9QR5SxnmUPdWErTd6vkK9S8Y9GYHQvsS4r?=
 =?iso-8859-1?Q?aE3nzPCe7rLyOqjqVngWbhEgj/5GSs/UO8HE2uZW2S9Pmzse7mpJb7uS2C?=
 =?iso-8859-1?Q?rLM1M0h27X1z3o9QYHvPkiEmdoGrA373LYxZQ1JWCOikbRhfOZ31NE7zNR?=
 =?iso-8859-1?Q?Juwy1JYx4GjB7NjG9m/BBhnGlHkxRTYadxcrLasHp5n+Z6axjN88MyWyO7?=
 =?iso-8859-1?Q?N5/v4kYzWEVeu9y7pNKaIb/GXnrgBlRG1oVpuqP3HtMvKHT873S1y0gUqZ?=
 =?iso-8859-1?Q?Uiy0DzfrOE+9IoZxnytXDZNcwre/d/k5EtTdLl5LMQpACJazHCxgRtryKD?=
 =?iso-8859-1?Q?i064Tw19WeB971bguW05vGo1/W0UNHRLTCR10q9ZjsLadyaLSTzaa8zchX?=
 =?iso-8859-1?Q?G0lSSZzklWhixMxb+pUDjTAb9bineBr6QWFAPR5EBnB6xy1OaJfKr5CZ9m?=
 =?iso-8859-1?Q?S3BZD896Tf4T1hJOcN5RHvO+rbwqtC3Ftezelw7Crb/s3hJ95DjubP3DHI?=
 =?iso-8859-1?Q?MBrRWQYRcKK1+J+7W1981KUIr2oRriPfcIlwYjdrD/dMt1bvXo8QdAYp8N?=
 =?iso-8859-1?Q?xCkCLqRaxRTwxynQHRfV9z49sIgWjnHjs0aJGmIB7KnXezBN6PvRagi2Am?=
 =?iso-8859-1?Q?uVVEcONly7tbGrHb1nhxYJ2ojw+uFxZ2x3crvIRehgoSHYm9DvCUIsOBA/?=
 =?iso-8859-1?Q?J+Et6PklWQBUK5xMuxh17PnoMZ8slnXbN8EjsCCI8vXnbPk/X5UVPorCb4?=
 =?iso-8859-1?Q?SLQeIveFuivg91hUAE/t9whNRlZoV2p47kDVxDAhbXZCHVuNSI4kDggahv?=
 =?iso-8859-1?Q?szYbHe+siHPKxwfEYxNL6l2oQOiUgrb/n5P7pywGl6kfU9Ex/w8Z7OmtX1?=
 =?iso-8859-1?Q?IGxvDJpqjo69qugsECPd1j5slNbGUogyKPFwMCg2eSworyw01i0nXjQQnX?=
 =?iso-8859-1?Q?1L9rJosonI2rg1dIVoBp73KTjos7On16viqaegD2slZLoZ1TNkPRWblU4l?=
 =?iso-8859-1?Q?ohqACT+20hz9ffgEsmp6E6A9c4RcomfIzsqc/4S8ga6ZJaDpmFJw1t6pqr?=
 =?iso-8859-1?Q?akewLh4659I42N8LwxWEKXK4O/kNKOQ8aQksheGf8zhsBOjgynzbMaA2kZ?=
 =?iso-8859-1?Q?EpiIKxW8CPjunBsRPW+UFHichncWALIBa1JvuC1pTHu20/3Z1xEOZEU9KK?=
 =?iso-8859-1?Q?XgueKNNuD73uSkM/5PoDvn8lSXQsHED7v9qEwNfqkDTRVhLM0xRy2Kpfk1?=
 =?iso-8859-1?Q?nfLtjUyQRkYguq2vB1DX7rE7vgDwQVJx23APhyrglT4Bu63JQlhyDYBk6q?=
 =?iso-8859-1?Q?hAIass/APC?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3A63C24550FCA2459958757D0D6BF16F@namprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d724b7c-f3c9-4351-1544-08d9384bd99c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2021 02:41:07.2954 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kXajZkRq1RXi8dgbD+grNfudub+URT9yuj36Xk1Wc1au/eF13alcvNqGA9P8wju6slkYTIH+W6BxsPZD7KS2Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6671
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
Cc: "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>,
 "emma@anholt.net" <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "melissa.srw@gmail.com" <melissa.srw@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "mihail.atanassov@arm.com" <mihail.atanassov@arm.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "jy0922.shim@samsung.com" <jy0922.shim@samsung.com>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wens@csie.org" <wens@csie.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "xinliang.liu@linaro.org" <xinliang.liu@linaro.org>,
 "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>,
 "james.qian.wang@arm.com" <james.qian.wang@arm.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 Ben Skeggs <bskeggs@redhat.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "rodrigosiqueiramelo@gmail.com" <rodrigosiqueiramelo@gmail.com>,
 "laurentiu.palcu@oss.nxp.com" <laurentiu.palcu@oss.nxp.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "hyun.kwon@xilinx.com" <hyun.kwon@xilinx.com>,
 "tomba@kernel.org" <tomba@kernel.org>, "jyri.sarha@iki.fi" <jyri.sarha@iki.fi>,
 "yannick.fertre@foss.st.com" <yannick.fertre@foss.st.com>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>,
 "hjc@rock-chips.com" <hjc@rock-chips.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "philippe.cornu@foss.st.com" <philippe.cornu@foss.st.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "tiantao6@hisilicon.com" <tiantao6@hisilicon.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> On Jun 25, 2021, at 04:22, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>=20
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in vmxgfx. All usage of
> the field within vmwgfx can safely be removed.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Looks good.

Reviewed-by: Zack Rusin <zackr@vmware.com>

