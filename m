Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 145873E2693
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 10:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9796E6EAD0;
	Fri,  6 Aug 2021 08:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2135.outbound.protection.outlook.com [40.107.94.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A546EAD0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 08:58:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlpFK5EGlCgOjWYO4pwGPiLAdwEeZwP1ZXFLYZ6MS4AHIfNta5VyWlm+RPrbl/U6IEkQazsW+isNTpuBOiJD1zQRQD5Fth4DXOBVImYiH/6uI7iu7iXdjlPmVhZYk+80pnEtiupQvVldDy4aA1hoBvjoh58ggV7Vn8owp1Naw/KG4p11htt3VhtOqCc+syPtXIigHTJ/b4bJXTp02deOgFjRE/bstpBAwFqWWx/nK03rs9JF3hN80aTbogUWbHU9zklRqBA6NnDsMdJDIH+eRZKvXnBuSgsvVUc1kb0CRvlqZ/SJrT3slst8MA+c+12PEj62zzhaNd8hiQoGvS10TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnGuiuz5AyyxbGFn/TeZ/ZDl1bkOZtuEAu6nM1AzTOA=;
 b=VBaN+ZJ2+SMi2n3J5KUQH3uP6jvTk1FxL6Y8ZRzX3r/ouww2bWwJiMRnxJv0rZ+XJa44nckxz6sS1zztmKoI9xgC8O4Dso5Fz7W+aTFCpufTdpwFIG3hfz9CtWi6JlZG5VRuCYnKjSQMhqbJReVThkbgZ08/bs8+gpyMUJDHJoqrIFvnGDuz1M6KI2Eb75CNKCWrnBIPuu+49IIxCIFTiPRmxvbepbtP4dGisP7nwLaMYd7adUUKGaEVFX96Jovi2Z/VZX0IC2J8fLU4Jn4cKNeVlC8+C+JR92w88Hqk5map9lvxx7NhWAC35wRUuHDuixmHqcZ8XlM0M0ESOGbzaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnGuiuz5AyyxbGFn/TeZ/ZDl1bkOZtuEAu6nM1AzTOA=;
 b=X0ueFLbzik3N2fq6+qQXiLJoNZ+gf3Y2f2hhjEgwpn7fAfVbbvyDoBMcn56B3qHrW2H6gb3x0yuUboc8J7eky6pgfBjdRezanJiwSMvURbjvOcsW8CLtESiUKOKooYimz6zprE0CJQR679zwHn1ZZSsFqHKkqcowv7ekwJGYjys=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6568.namprd04.prod.outlook.com (2603:10b6:a03:1de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Fri, 6 Aug
 2021 08:58:37 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 08:58:36 +0000
Date: Fri, 6 Aug 2021 16:58:29 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>
Cc: Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Dan Carpenter <dan.carpenter@oracle.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Torsten Duwe <duwe@lst.de>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bernie Liang <bliang@analogixsemi.com>,
 Qilin Wen <qwen@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org
Subject: Re: [PATCH v1 1/1] drm/bridge: anx7625: Tune K value for IVO panel
Message-ID: <20210806085829.GA2189624@anxtwsw-Precision-3640-Tower>
References: <a565cb1662d2f8300905a369c575e19176fd8e4c.1628148418.git.xji@analogixsemi.com>
 <CAG3jFyuGJZ4ig6nFxXJJ0d-7ob2+=po2cxSuN29wedV5xVE+gA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFyuGJZ4ig6nFxXJJ0d-7ob2+=po2cxSuN29wedV5xVE+gA@mail.gmail.com>
X-ClientProxiedBy: HK2PR0401CA0008.apcprd04.prod.outlook.com
 (2603:1096:202:2::18) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR0401CA0008.apcprd04.prod.outlook.com (2603:1096:202:2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Fri, 6 Aug 2021 08:58:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18e48f7d-2c9e-4567-441b-08d958b86057
X-MS-TrafficTypeDiagnostic: BY5PR04MB6568:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB656872C52FBB40B512476FE4C7F39@BY5PR04MB6568.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GFjV9kSnK82W5wbvIVAnL0fzu5o8uzMAUGqk9y4a2k1JTcMj11/k39xNFST8r7gDEBfOsY1lCJQzQb8isx0runqpozXX6Pcu8JhwK3v5G0U9Ryf1x7CYCui84Qo4iWD2Wof2kITwUw5P97FA5P0UhbCrI+A7VVPp2Z92CTm1VTGJmpkMmKZ199IvW4jI5QG0beMRQlvOx6YBE8Mc/PAD7DEMc9Ey0N7HXnQxUsktfBL1mqkPiC1DqdbmVHBMHvGuCr3ldu3ysn/surBj/JrBlQDlR1fn4EMjQPKNzkMl6V66BZrb180ZSaZ96SJMyt7u1NAtCzvgedEEpm8TwQHffwpl2iNQrit44smO2/kCLpne9TQKD0ZqLtgNVbejCmLMsT8e29zDv4nES6CH0zjHT1lJYmrXR2UflawC6fRXhzQphLap/XeBimq5zpYrc12afMIJ006KNLY6xL6x6+zLCUJPxTCrNcUBEnA1UECbiMTdCtqYwsDAcJ+au1HuPO9ypsAPT4uMocSdYvCgkddaG2W6eAq19xAKrCHnsQJEDbhMejQZBwBqjBqaV9Pz9CkxQEaQVPGrRpRXHL2uve+eaQOkesUUFVrf6qW6skZ+IsbWyWaSXMznKYudyFmvTdx5l4RxFB/YOikk+u2IEDzz73CziX1+Q0/cG/KsaQOpr4RJjXKr9pCBkz0Kfu9UMA4cPKS7tb3oWexu/SX1tB4OwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(39840400004)(396003)(136003)(346002)(7416002)(2906002)(316002)(186003)(66556008)(66946007)(66476007)(83380400001)(956004)(4326008)(33656002)(55016002)(54906003)(86362001)(55236004)(33716001)(1076003)(8936002)(6666004)(8676002)(38100700002)(38350700002)(6496006)(478600001)(52116002)(6916009)(9686003)(26005)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EIbvWlpl34xzUoz2+buuuLQ0pWhdpgZAP/W6LRGk40+OHN1HH6fqNmwiYfHS?=
 =?us-ascii?Q?RhDRDOsgpDlZirBrhObylsccUZnFTCjMT9On+HDi5A7/Mqox8VKV7k8JOrud?=
 =?us-ascii?Q?9uy4jr00cFBrX1o7vZD57eVV6T7by0WImrCEnkIbHx74dN1F5WoVcb5PMYDu?=
 =?us-ascii?Q?TZEVHV7oIT9hbvq1QdANn0AgPIBTUz4X/HixqJzCqs+Oz3yQD7xuwe0eTw/4?=
 =?us-ascii?Q?lXUS9E6I7u/yzVWOw8pnGho0nVKcx3ASOqiDoz6HYF/L/b8u5ha4ob9/4q1v?=
 =?us-ascii?Q?e4lwIeoIHHysyVSvaccfjvIgIrRVcb3d4aebMFsK2PcPE90cFUidM6ZtfYne?=
 =?us-ascii?Q?BCoL7QwQumqAZBbi2RM3ZUBWpTITI6UYAFIixA2nxf1WGxTZH1EMCtlkQ5v0?=
 =?us-ascii?Q?AHnIpztfplG5aNQru8wH4H8ci5uGCGLfmh/cHt18/9s5f2i+1qWuPYwxDK2y?=
 =?us-ascii?Q?gEJpnIYtnSOX4zK0upnuw/04cI5ozzNb6Kj6CNEWpB4WvQL8YWCT9t0jVi99?=
 =?us-ascii?Q?FN53q2VisqEJVD6/uoCC52l89+b1/iOVWUOG24/WgQBsnOIBnXt4bEjQulJ4?=
 =?us-ascii?Q?Wi54qlAgoF00TdJYi0r4O3AIPR50WICXLjGV9SJJPn3NwJp5llkRp5iaRcYY?=
 =?us-ascii?Q?pFcPuLbVMaP0oar2zCHAkZ9QOPWyR8AIOkv2zYkG/C8GFgpiB0Zr4IPjvyGc?=
 =?us-ascii?Q?LDLFyc0E8ym6uSeUmc2jK4mhbCpitygNIRT0OO4RSc+hUW/fZtClEPf7M/YG?=
 =?us-ascii?Q?H29rq3n0m0a4+WiIGaLW9ET1/Ei/Fz1lFSdF1nFR/pLMb8BMa0+/qjsZHFUn?=
 =?us-ascii?Q?XJiXwFAE6G1cgc9mclRvaKcf93501jmUpf5DtehFM7hZVjsrauKc5FHy8GMe?=
 =?us-ascii?Q?OWCW7eapkbrCoFJBmYPwUdEAewpBd2WyfrTQCrOh/H0cz5YvG+hUSSuNIPk1?=
 =?us-ascii?Q?1za3ACNGbDmoOD5kZTKgUQrS3WYnnEVcKVcHGg+NKyQNYqU6rcZqprdhbgY9?=
 =?us-ascii?Q?nUco1v55qvEbE6V7tcci1wqThnITgCKmgejxpEu3Dk/theuf42A21342l2Du?=
 =?us-ascii?Q?zp+l+r32rkCuOn8U8qf0dbz2Qq8fvis5Wc0T59jUPk0n3Scnob8jQrLLYvoM?=
 =?us-ascii?Q?/BKNF6O5ZVk2CZqHUuHeEq/xCj24kk+W7/cZQlOXZAvd2fe8Q1T1ud1xWl+b?=
 =?us-ascii?Q?L8uYkMjYuHozXWZVoaGMNcUTK4HUPFeBU/UjYGzqs+7frV5r3vpAoZFSvfF+?=
 =?us-ascii?Q?SOEBzEkDtwgJc4v+U+zNhYVDDreHGs//0im1QWSUS4WtHXoBOnyMDZRHqGyI?=
 =?us-ascii?Q?oE6QV/enlCu3R7sdQqh+puLm?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e48f7d-2c9e-4567-441b-08d958b86057
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 08:58:36.6758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vMa0bcaj3NJC4Za5x7NruoB0Lx7V7gxxA/4laSJxRm9u/fOE7e4o4dgCN0K5Z+1t65MXPFMEepQrR2ID3PTYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6568
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

On Thu, Aug 05, 2021 at 09:05:29PM +0200, Robert Foss wrote:
> Hey Xin,
> 
> Thanks for submitting this.
> 
> On Thu, 5 Aug 2021 at 09:31, Xin Ji <xji@analogixsemi.com> wrote:
> >
> > IVO panel require less input video clock variation than video clock
> > variation in DP CTS spec.
> >
> > This patch decreases the K value of ANX7625 which will shrink eDP Tx
> > video clock variation to meet IVO panel's requirement.
> >
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 17 ++++++++++++++---
> >  drivers/gpu/drm/bridge/analogix/anx7625.h |  4 +++-
> >  2 files changed, 17 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index a3d82377066b..ceed1c7f3f28 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -384,6 +384,18 @@ static int anx7625_odfc_config(struct anx7625_data *ctx,
> >         return ret;
> >  }
> >
> > +static int anx7625_set_k_value(struct anx7625_data *ctx)
> 
> Pardon my ignorance, but I don't know what a K-value is. Could you add
> a comment detailing
> what the K-value does?

Hi Robert Foss, OK, I'll add more comment.
Thanks,
Xin
> 
> > +{
> > +       struct edid *edid = (struct edid *)ctx->slimport_edid_p.edid_raw_data;
> > +
> > +       if (edid->mfg_id[0] == IVO_MID0 && edid->mfg_id[1] == IVO_MID1)
> > +               return anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +                                        MIPI_DIGITAL_ADJ_1, 0x3B);
> > +
> > +       return anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +                                MIPI_DIGITAL_ADJ_1, 0x3D);
> > +}
> > +
> >  static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
> >  {
> >         struct device *dev = &ctx->client->dev;
> > @@ -470,9 +482,8 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
> >                         MIPI_PLL_N_NUM_15_8, (n >> 8) & 0xff);
> >         ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client, MIPI_PLL_N_NUM_7_0,
> >                         (n & 0xff));
> > -       /* Diff */
> > -       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > -                       MIPI_DIGITAL_ADJ_1, 0x3D);
> > +       /* Diff and K value */
> 
> With a proper comment above, this comment is no longer needed.
OK
> 
> > +       anx7625_set_k_value(ctx);
> >
> >         ret |= anx7625_odfc_config(ctx, post_divider - 1);
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > index 034c3840028f..6dcf64c703f9 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > @@ -210,7 +210,9 @@
> >  #define  MIPI_VIDEO_STABLE_CNT           0x0A
> >
> >  #define  MIPI_LANE_CTRL_10               0x0F
> > -#define  MIPI_DIGITAL_ADJ_1   0x1B
> > +#define  MIPI_DIGITAL_ADJ_1     0x1B
> > +#define  IVO_MID0               0x26
> > +#define  IVO_MID1               0xCF
> >
> >  #define  MIPI_PLL_M_NUM_23_16   0x1E
> >  #define  MIPI_PLL_M_NUM_15_8    0x1F
> > --
> > 2.25.1
> >
> 
> LGTM with the above fix.
> 
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
