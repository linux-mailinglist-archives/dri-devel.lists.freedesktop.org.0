Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3057BCD8E
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 11:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D0310E073;
	Sun,  8 Oct 2023 09:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C565E10E073
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Oct 2023 09:37:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhLgFmuLALll7lB8G6UmryWp4x4VERUQXKpwphYx3v/+B5l37ENSM59qwas1ffOCp1PNQpqm3HhFcuwQbXn1MpDT7jphCHNRVmjQl3oVu/DnypmoAgANBDwnWbcj4wqGJChd+BauaKdxigQwWrqzM7gTwqXh+kwhnkQeC2iG2WFovZCeug8zAkSHlNmaSp5sEqhTUSc/TbxM5KXPisNqbJ0YB3CxzcTZx6YNhSgCkhqwp+dk2JDfELozi+Ifq7iPLxLVwPzTKJ1OpzDUt4HrkKbhUKrD2yrOrePc3Gro2SFkZ0W2U4wC+V6tUQzOzagTL6Jgn8usHZQNZI50xGb1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zHr14/Mo66O7moz7Fx61+j77m9QmbggwvZKrbUK23E=;
 b=FPrFQZg8Cbo1QF8MRVSJczGky/q4JYH7yX/U4EMqPoxAiAENqbVLY7WyyPJYLVeJU+2XlwxdyGZ8vQC38DXe1I09jfitJqfYtGUpxiSixc+hISAV6BZ+ClGhN01m3SWnuz5XukaCjWD6eNc7hUvQcSiwVop4oT9kahK8jymHnnbjgHlNQhnjITRuZNtL31FUqwsNZjqfDXc7Gx8RqqZz1exGZ/hhg6DlGzvYepo0PHJLhKtHg6D0nJfitSXs2n+/cPkmXNYG3cLhrsPVt/5UkGVAKRK9zlRlRV+nLblbvQcB1WXkfeqdqG6COelyCi8dyCnN51ECz/VfYRI99KdZjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zHr14/Mo66O7moz7Fx61+j77m9QmbggwvZKrbUK23E=;
 b=ScUtPzXAFv4ksgbRwxx9Fej+Gi4xZgVKwGpIrAwpa26iHqfRx8zUstxU//YGGzLDAI4b5QG73laocEBXpwvZxN8E8iMXGjXiWdhwkM1/F2K5wvmyu2epOQ2TPK0jBimjGYGt6GuMkOcaZaBa+Z1bAGPMKiMYXE/gq067S7mH/34=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6972.eurprd04.prod.outlook.com (2603:10a6:10:11c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Sun, 8 Oct
 2023 09:37:08 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b%3]) with mapi id 15.20.6838.033; Sun, 8 Oct 2023
 09:37:08 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Marek Vasut <marex@denx.de>
Subject: RE: [PATCH v3 3/8] drm: lcdif: enable DMA before display
Thread-Topic: [PATCH v3 3/8] drm: lcdif: enable DMA before display
Thread-Index: AQHZ8gAHc8+WUbbSSUqpvl6q6wiHXrA/eVhA
Date: Sun, 8 Oct 2023 09:37:07 +0000
Message-ID: <AM7PR04MB7046FF021B8BA46EFB758BA098CFA@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230928113629.103188-1-l.stach@pengutronix.de>
 <20230928113629.103188-3-l.stach@pengutronix.de>
In-Reply-To: <20230928113629.103188-3-l.stach@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|DB8PR04MB6972:EE_
x-ms-office365-filtering-correlation-id: e21926a0-c112-4cd3-4069-08dbc7e223cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AfFZW5h6C5Jx2FtWkOBED9K4JezNJ+LAhRs/uC2fnX5S5wvuse25JYOe2PEVNxm6OAly5IjhutVuqm1vJ/cNV/IbQsFaQ7drJNdS1nMn8dv0irU9bmpta+DcnhlmYPJAJHbEc6Z1Zg2CAvpewKaQOlWD/Oa1gGwZBvuM0MI4wDekqEo3jSrL42D08mqGaqQkVGcAbIxo4naaggHYrwZYmMY3SBSo1z4AsXfuvlqgO5/93hvN7DAYzEB37Y40k9tNGPThOSbNNUCUswYMRUjo57IxTzSzNmvlwry8qWnnB6GeQVQNIL+Uaq6yoentS2lQaC+n7b/TT7hB+aa6ou6vRspKcjD8XWLw9Og7Aq8ZIOJ2Fve2XT9Hq1IeF1wwMAcgixS/KAhIcxAHTQVlAKSXZH3rNRfSaGW3dEG33N/UA9G/jU/v/lVh4YJ4Qw+QrGQhJjhX+6UWNd1mPv4ZBosLNVoP/Lg2OuqZUR5Kfuat+tiO3vF/KkQzdriFG5QWhvT7IG2bb9iL6V8typUQUs2mEJ0ISfYHKaHKWnY1VlQ33E4y4gWLNwuNyCu8ontj0NVi3Ek9+5V8N+jUVLXTeZYd12nCt3qIFDTHgDsGmxbmgpfGHXl/BmAOVseqQHDRFfTf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(53546011)(26005)(71200400001)(478600001)(8676002)(7696005)(6506007)(4744005)(83380400001)(2906002)(4326008)(54906003)(66476007)(76116006)(110136005)(64756008)(66556008)(66946007)(66446008)(41300700001)(52536014)(316002)(5660300002)(8936002)(55016003)(122000001)(38100700002)(38070700005)(86362001)(33656002)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hK4Wc+0kgaabMTJyKaVO2p6uSfdXXcQFBjq5eLk9BbVtmwGkANJwSYnukHl6?=
 =?us-ascii?Q?AVxOmID8jUoscXQYQI4KG4WjdG4Shj1DCWwKtCFH7iA1AtSx0EmPyNnyQ1Pt?=
 =?us-ascii?Q?Oei7rWcfYcrONzXNFgILKaE6LGnEHT1kQQ01soWeVwFmdvwmiq8Yh/SrNOcF?=
 =?us-ascii?Q?hX3XBlesB2TVt2CMXZBsJVuQw+sjJBYyxyIvq0/ngWCFnASuK/tQ1LVCkk8Q?=
 =?us-ascii?Q?5jAOG9WJ5F0RGFQWOU0eX1Aefh8GPXslIT+7XsDEjPMq9qrlF5xU8cfsuBfR?=
 =?us-ascii?Q?JsjVEXruH5kH1z/VyA9XW+p456hYvqrsi9aATGzKUInyeX5uwuhyUPu+9eeH?=
 =?us-ascii?Q?Sws0OOPyMWCbIM5aKR2Tj3IZZf/4dEtASMU2C1Jo1QG1hpAmguuldYo7mTm6?=
 =?us-ascii?Q?8UGPymz1Yrl/c4diThXHuc7VcMNQnoy24PtGKCjPYMSYxnU+LlqEc8KynCJc?=
 =?us-ascii?Q?VNx2jJsW426ya1X5U/jWpjnMNN+MabWY9tRQYm5hTQsNfzRNK9rlQ761Z3/l?=
 =?us-ascii?Q?7ySEK5eh9I+rH84+ns2eUklAt2wY4c3o/MXfT3UtdljmGyXA1tnNS4xioLOF?=
 =?us-ascii?Q?q0df6Cl13y1vHQytfct4aGfL+m4uqevEt/03P8BKRVvZ4OP4adU0HLzAFdaZ?=
 =?us-ascii?Q?tJ9DjRGcDw5oz3DZorF7VXa8QPp1rPReOndd3hXqrNMqF1O8+Sk7XZdx0O5C?=
 =?us-ascii?Q?orufTKXkth8yAHTEN4zbE04ekH4Ib7ma+oqT5B8OZkThnMqYzbXjGiTjJNCI?=
 =?us-ascii?Q?orH4PMjK8iUSlqTz+w6015SPPjwCk9vfaBfit1+2dLdF/X5iCSJuPuQGpgPO?=
 =?us-ascii?Q?x8WZhNFW42Upz/x2UsX+5t+A2WKkzOcJACAbTP9NmlXTvjs5VqYA+2hbyfGP?=
 =?us-ascii?Q?zMMX6afGrhV6a0u583TUsCL0Q7un8pgOUn4xNcX/5PdBAeJ8K1e72dr0k58s?=
 =?us-ascii?Q?DShmBZ7o6GzewPZIFwV3MN+JVshrGoHNpM4YYXwHqhGUFWhzC0VPTYOZZYts?=
 =?us-ascii?Q?gMG8wEU6E08imM/Lj0ohC3xj4jrKWO/HgcpCcTCh2NY36wogKd7BuNM09btg?=
 =?us-ascii?Q?2hPUVW1N9zz8wrgy2l6G2i882BWTrQopIZtwaPiL1Y+0xfum6JKEUccJxnyz?=
 =?us-ascii?Q?I6cpUh/bolA4qjsNbjYFRZt9REIhz1dFhbyyNyDwhAnkGnH924VzUNKS2SpN?=
 =?us-ascii?Q?a61u7rtxbROQ5S53r/CwZTL3ODd3fpytlrKV5lgSGZxjrBKLsjcpsPFagbwS?=
 =?us-ascii?Q?cVVnzH5+hB6pr/oIGtLaZem6wZqS38XeJr65X0gtPud0V6KQ6+KRo70WQr1q?=
 =?us-ascii?Q?xo1gR1HWYex8LEAftyi3zUT252o4Oex/H1tDm9QI4L4L3bc1E4/ASWAooIJb?=
 =?us-ascii?Q?GwtYpC6soZm/uSQukC+PbZ6LYSZFQMSpfRs2OYv/qaNRfFC0laVC2Hs20vh2?=
 =?us-ascii?Q?mdgdBNdiebzscvx2+s1MANLXAjC4W37cfQkwl9b9OeSBIUaOyKxXsqoBDqyq?=
 =?us-ascii?Q?924i2/YtId6Ykgs4qsTEi0GqeO3g4n40kwGz73MyI1RSjmu+QfohTJm23C+G?=
 =?us-ascii?Q?K6lGamMQyF34AamWNhQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21926a0-c112-4cd3-4069-08dbc7e223cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2023 09:37:07.9637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7wabFCWHg+d1y+0i9zpr6g826IPKRtUecqEIPxVWxgHbVut2Lz52QYAdp9y7KIXq7AkcreAEfHKZEDuPyvlziQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6972
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, September 28, 2023 7:36 PM, Lucas Stach <l.stach@pengutronix.d=
e> wrote:
> Otherwise the DMA enable races with the fetch start, which causes
> wrong or no data to be scanned out on the first frame. Also there
> is no point in waiting for the DMA disable when the controller is
> going to shut down. Simply disable the display first so no further
> fetches are triggered and then shut down DMA.
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> v3: new patch
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 23 ++++++++---------------
>  1 file changed, 8 insertions(+), 15 deletions(-)

It seems that this one is the key to make fb pixel format change
work ok for i.MX8mp LCDIF with modetest.  However, there is about
20% probability to show constant color with the same test running
on i.MX93 LCDIF.  On top of this patch series, duplicating plane update
in crtc atomic_enable like downstream driver does seems avoid the
issue for i.MX93.

Regards,
Liu Ying
