Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CE7B57ED2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 16:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4429D10E2AB;
	Mon, 15 Sep 2025 14:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="JR6UfJVP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011056.outbound.protection.outlook.com
 [40.107.130.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DF310E2AB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 14:24:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6aFfKJcTaWxaLU2ukmjoz941HnZGYzmWVQ2j88FLYtwi3pwUfDBuHhg1A4SfTY7d3GSC6wm/u53jSdIpHB+b6Lee5EM5+Qh+iiEdAy4ZMozVnvaPH0sqQ7BSaHRxmMwvFAOQwSRdxP8D4GAGq//rxdz98SHp6wUZf9bo3QBgBCOGeUYDICN5VC3+DvE/7gbIV+WGS9Z2OoRXsAzaHKaxjTRgUKe0JHd3bKXHALlT9Xz2+2RgH6j2NJ+dg+ENsPhYfIuz+PVvLTzc8p2uLmHsB9JWqjrCMkOSMpectWDn2unPLGDXzD0e4J03Mq/VlTrWAHrtGHNcAFQANnAPudzTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmE2S4r91+QwWKm6YrCWq3nOWxoozluxFmjmZ6An0WM=;
 b=mIyB+Zp69+yuZpnhIVHopO2mhApKrWFY13Blj2KNqNNIrhUENz05iO+kfuNAZtdwpcXh6fJGGvhxRY5ghlg02M2y8TuHW1q0pXTaZzVACHubnf0iEY580pF7eVJfSpt5w8bHSSgTSUpc5M8MtCVkrNq+uqSOa/ibxmRxIv+cA7uZRxkZ+vuRT/U3pmpxIw7a+wCJeVyGiHroVtmdupHWb2Tp6898IzrNKlShplKduU6DAmm+R9Fx+KvQCP/z9mx5JWpGJg32n0a9eX654BOmVqBdoFwYz3l066MV4dNDFC0NSt31cKqLyBTo7p9CpAFl61lnQoj7wfkO2iRIyd29KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmE2S4r91+QwWKm6YrCWq3nOWxoozluxFmjmZ6An0WM=;
 b=JR6UfJVPisY+SnJZe4faBD/mOWJBKauoAFB740BX8lZB4CherOmrc1yoSfuiFHX26RuBPAkh4WMN71cFssEWoOBGkIwiUiVE9FzLTwTxa39be8p7Sqo/+Mg+OsEz1AAdPaUqF21QMU7GG2xDGiIpssizIm4EfHZEss8JeURj5ucE0D0760oAd855/+mmPobjq+/KFEo5z8SvUeXn+eMC4tWWJuRF7+gnu57su1Z+BG4MUTgbxnbEAqZ4h2HhYOIzCnp9CgUU0hDEyswidRCu/WPCFZGi1QQW7KP4loghxLc+8GzmJst+dbCMvDYdAOLmny1XVeNlgUQ2snnzRul3Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PA1PR04MB10365.eurprd04.prod.outlook.com (2603:10a6:102:442::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 14:24:31 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.010; Mon, 15 Sep 2025
 14:24:30 +0000
Date: Mon, 15 Sep 2025 10:24:20 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: display: simple: Add innolux,
 n133hse-ea1 and nlt, nl12880bc20-spwg-24
Message-ID: <aMghlBUIu0z2HqPw@lizhi-Precision-Tower-5810>
References: <20250912185159.1118209-1-Frank.Li@nxp.com>
 <ufmwjrlnaq6tucfpqishzvdpgsxartxgohjrgyr4eccahb5jrc@5ausrm3osivb>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ufmwjrlnaq6tucfpqishzvdpgsxartxgohjrgyr4eccahb5jrc@5ausrm3osivb>
X-ClientProxiedBy: SJ0PR03CA0286.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::21) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PA1PR04MB10365:EE_
X-MS-Office365-Filtering-Correlation-Id: 27444d3e-676d-44f8-e511-08ddf46395b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?uq8CYuuv8y8OkFHwMTcDsNuR4CWEZR6zDtO9TIhcmGtQHxuzbfxH+H9sMt?=
 =?iso-8859-1?Q?Ay2YG6ZEEtNO7aBjgLdbMlrphOCdbceI/XOY5tY1MbhKyHbuxqvasAzOLM?=
 =?iso-8859-1?Q?APNrBuduJtAe2RjxzymIQB5g/Jg6pe6WOGS6Z1ntQAz/KUaXkjYjW2UtKc?=
 =?iso-8859-1?Q?dFeIqLBsY+KLpLghFKlDRhdvjUVcevw7INod+Vf2pcz9JtRLo+IdXUxHwL?=
 =?iso-8859-1?Q?mXh5p+PhgRvfpkrq1qHFJd4EvlqyVaK3Z7of3aP7vy15EhkeZhCdkpV8IQ?=
 =?iso-8859-1?Q?Iw1SSecbS0gbUEViRho9OJxordEOsb+99m9vhnaY3G5VG0dr88QMzXA6t5?=
 =?iso-8859-1?Q?sy3nhE/4AduzkVTXDDMi5V6ZNQ5EdumdLRct5O8q62ELmzWWYbHacw2GZa?=
 =?iso-8859-1?Q?k3xyU+JdqFJAy90jp+bRiRZtAMIO0RAPkpOkPev00CMuiBuqDbaHYevdEb?=
 =?iso-8859-1?Q?5fyHjMYOjtBhDtD8MiwOsuoJGuEtgocHGaDL8QbBqkVODCsI2LNNAM+E8c?=
 =?iso-8859-1?Q?9AFKZf5MAIs306Xa30tEpI8CMtk1pZ6dMmXQRQrg4/WCQMTebh6YVa1rN+?=
 =?iso-8859-1?Q?7sgZk3S3zmYQ9Yf42khxBfnJi9KSAATFlNsoitf2VKYMOHlKR3n0Wqr9RX?=
 =?iso-8859-1?Q?+f51vYD0obinWctqKhy7gxu9ES7184Ul8/ER6lF6vQ2/NiPdqGl17MGgXr?=
 =?iso-8859-1?Q?iD0+NZZEBxAh5nWsIvOhfjqeCnZEyhJvkpKPb15TsviI/OPSPcI01XOqwc?=
 =?iso-8859-1?Q?RGWiwNZ5jaWi3BIgyBytr6er+p9Kq+R2wT1+zSONAJK/n4ZCtf2/IdEsXC?=
 =?iso-8859-1?Q?U6WC1JLCjJVLxycz1dGWsdacfLn6cNyYjkwTRF4Apy38F7+UJtAeWBkkJi?=
 =?iso-8859-1?Q?0e5TWT4coy2cPt0Pd9/QPyqQ27Ftv2cSCJWxhXMrNJUy+KwtoafYBMFqG/?=
 =?iso-8859-1?Q?ojb/ASA9o/wVzyNUBHIfeZTA0PVsat+BOfVPRDOLjMOXDkeRfNcpHu5wYB?=
 =?iso-8859-1?Q?VkAvlFFeOcM6Hujie88f380szr/+cQAIYKrILVyOe20CVODIu95pNJvSk+?=
 =?iso-8859-1?Q?fMObSIxOrhGKObPIkJPNf7Y1yhNhMMfBlRsULRkBNoRJbVuJM9wIyLKX3i?=
 =?iso-8859-1?Q?4neqcQvRhVoAEFEkZRU4DEboz+fcJ4uUt8p4k1OfMJGCObsh3KRl3ZEWQp?=
 =?iso-8859-1?Q?Hn1bbyQJzWsCh0SrrVoLJobKZt3OHiPsKtoBcfaH1zPefR4PGxlNt+2nWG?=
 =?iso-8859-1?Q?K9lJ+9Z5HffjbRTGzY03q6w19Ryx8i2h2cV5kBq2Id3YRtwBD8EEkLc/b/?=
 =?iso-8859-1?Q?7s908GpR4rItPC/IvpWlJ+bTeVnitaAV7pxL+gyxfW0MQRQtiNLs8/jyJj?=
 =?iso-8859-1?Q?CLKaUSTYIgDOY6gYWAt1o4sU7oVzQQb730PCHCb8TBfM152cNmknaYlxZ1?=
 =?iso-8859-1?Q?sS5JJgI0OsOaiIe1P2iPhaJ+HkRqhjyFvRzXDv091aFvU2c4yDBoWHZn+q?=
 =?iso-8859-1?Q?3FM1WiZgcReM/chSEX+8yvirdXcGn45sr1k9rX31x8ZA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OSIqdYmpaOk8G7c1ftPXgfwosSfqZcM0hkHiIYxxf/zkSrGUABWHT9otnN?=
 =?iso-8859-1?Q?mTbAvKoTPtxCR1gOg0id8JCLbDOsUEYqJJgAaGhnS6rldX3kSRz1Hpry3S?=
 =?iso-8859-1?Q?XaE5zjDvTMAVSIOuESwGes6vnElsVOVbeiJPzZMwXTWkO07vpvoc/b1ZxL?=
 =?iso-8859-1?Q?ypTsF4ofpWILHGU6WAFKVov3CVyujKEckYvEI7L1VuUcYgIDW9BBFYjSBl?=
 =?iso-8859-1?Q?gjHa0TOkz1FnLhIfih0TbgoAn8u9uNoFZ7Ezv653s/CKpkGn0iOeESkaha?=
 =?iso-8859-1?Q?MlyuX/6e/KMQpG+XHsuuJARp1gBGQV478A9fNxLb+OYZbGzQa5HO10NK9Y?=
 =?iso-8859-1?Q?pM/rnSRfARgDQW5hyTr6Zd2DQ8hpNyxf7l+mA95duyYhX6NpmULwz3dWbV?=
 =?iso-8859-1?Q?XF3WIuqRoOzNvSb2psNdHyAAHr2A1dtjeZRX0NTpZGrXmeeN+wbuMWsKWi?=
 =?iso-8859-1?Q?IY5LOVba9SThEM/NXxbTEkxuIaP+sYfkLvSq7riyqcGvteaoKYcZtcVUuS?=
 =?iso-8859-1?Q?sPErXlps7dFO8wA7ib2wEHkWv36hr6Dhj3NBFesfilFiMtQVOKtG1S0wTj?=
 =?iso-8859-1?Q?KzVa4CWbHFIN/OF+GmeRlgojuGu3zHyf5qlNu+O4iD3Xx+gM5gwJmw8AqV?=
 =?iso-8859-1?Q?0akDQ9wYLLQrImD03BW6vCAE0og6Q840d9RV5p9q7ow6o6savqSVb4+X/U?=
 =?iso-8859-1?Q?WsDHLTMo4yuIe9HfgIr3+l77hdCbDtcwb6GAidqVJZkLJ8Ux27hZN+4kUy?=
 =?iso-8859-1?Q?s2eenaasGtBl2ChlB3i00XT1c3Z6rwGE8K9gN7qVDEgcVQqAlKcMn5wV+D?=
 =?iso-8859-1?Q?whjAQit4j5ezhPb3jVtQ9qwbIHJPWLIJiB56Xla6BXQqR2Apo+YCuy57wf?=
 =?iso-8859-1?Q?jg3C4xwMbl8nyAkP7CPjVJq7Cre3IqrbHpjCOBERhoqx9WqU6XWZjjg2WN?=
 =?iso-8859-1?Q?m6doUEbdSsCEffoaSnsAqTiT8X/zFNpli3O1jTlSzg3Z+1/cPDygXpo7kO?=
 =?iso-8859-1?Q?H+OI5+ulx2RhnTGT6+FgMNpkUTI0wzgQLZx41Wdo43CXtNqXWWHJRQtgXs?=
 =?iso-8859-1?Q?YRiASlz/x1kCC/cdfumTh2TUGotC2O44Emvu8aKFzRAOAYOxYNDupQAV/G?=
 =?iso-8859-1?Q?MJuYUHHmsER1MZ+z2e3+tZmDvd9eYHUdoFC/gbHyip0mNifYJKf3zhx3Wb?=
 =?iso-8859-1?Q?/5n6suqdOEr+BXHMgkgo8k2MraIe5p0wnCJ7Gn5+zaWmf95VyLRVyG3QLj?=
 =?iso-8859-1?Q?hHe2lXlWc33ZL53pCmIBNM48vIdKRxULemstl8qt5DGonhvfjnCluwb9DJ?=
 =?iso-8859-1?Q?kU9lzARfRA4Xqi/OYtJRSvnYAqr4GcZMNMmkewTSWO0bfBHP7pkE7LDGio?=
 =?iso-8859-1?Q?O9bQluK/JQAo4Sa2TWHjUYlhcTJR5T3VC0k1Dt91Zm+a7wKZ5AUvARtffI?=
 =?iso-8859-1?Q?604k0ti4flfsFkdzPykVul+d5n/Pq6h8XvVo9NTtF35QtVn8XGj0nEdk2C?=
 =?iso-8859-1?Q?7YhqwN8qvzQApfLB2ti2txdT4cFPQ+fgzMrg5vSLwyPEqKWbfT92NoSZ83?=
 =?iso-8859-1?Q?+1h8ynVt4lkikBAPwgVRLVHw3l19+/3wrZoqA8Hu9R2RgcDQwLDgjYQiB3?=
 =?iso-8859-1?Q?7toC8IjkQj4ot01Kp8afpR1pMuD/CC7/ta?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27444d3e-676d-44f8-e511-08ddf46395b6
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 14:24:30.9263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0NHNHFo6FIVw6hrG44ROZTL6y71/6CTmjGAFaB5lSWMP1I8/3AhuB3Do+tSU9Ibkks1fNtCcjrscrQVOMzwIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10365
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

On Mon, Sep 15, 2025 at 04:00:22AM +0300, Dmitry Baryshkov wrote:
> On Fri, Sep 12, 2025 at 02:51:59PM -0400, Frank Li wrote:
> > Add innolux,n133hse-ea1 13.3" TFT LCD panel and nlt,nl12880bc20-spwg-24
> > 12.1" WXGA (1280 x 800) LVDS TFT LCD panel.
> >
>
> And no driver bits?

This patches just try to fix CHECK_DTBS Warnings for existed old platform.
I have not these platforms to do test. It is not necessary to have one
linux driver when add binding doc.

Frank
>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > index 48344ce74a6e7..742ec6033b724 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > @@ -180,6 +180,8 @@ properties:
> >        - innolux,g121xce-l01
> >          # InnoLux 15.6" FHD (1920x1080) TFT LCD panel
> >        - innolux,g156hce-l01
> > +        # InnoLux 13.3" FHD (1920x1080) TFT LCD panel
> > +      - innolux,n133hse-ea1
> >          # InnoLux 15.6" WXGA TFT LCD panel
> >        - innolux,n156bge-l21
> >          # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
> > @@ -230,6 +232,8 @@ properties:
> >        - netron-dy,e231732
> >          # Newhaven Display International 480 x 272 TFT LCD panel
> >        - newhaven,nhd-4.3-480272ef-atxl
> > +        # NLT Technologies, Ltd. 12.1" WXGA (1280 x 800O LVDS TFT LCD panel
> > +      - nlt,nl12880bc20-spwg-24
> >          # NLT Technologies, Ltd. 15.6" WXGA (1366×768) LVDS TFT LCD panel
> >        - nlt,nl13676bc25-03f
> >          # New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
