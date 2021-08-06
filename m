Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1853E2809
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 12:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63A36E158;
	Fri,  6 Aug 2021 10:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2110.outbound.protection.outlook.com [40.107.237.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A589389D30
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 10:06:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRp0N0V+lVOSfy5bFBj6BOGhIJnwo06Bb+BkL2FYVHpZ05+BK+A//2dC/GJYOhkU3OKLcvvtdg6EcOR2bqC7W8l94gWTn7PRza1SpYm0lKbmhVqW5SbLsghUZqvEmCQkpXhnfpTOhjtkAqE3FyiEbotVIiEkgfevbx0PtOpwM9trY2PZYcy1/S2jWEnbsj/lWkQc40MwhEHWg1aZCTdb0slNr6hgaxbvdGZ47JAr02FdrpXI2MSZaw2rpjI6WICtuVgjK0xSTM4qWBIaTx3xHUdC9Hyq+mwzonCg5fKi4QtbhXh2woCL5eDS/LUAalEJ0j8ZOrMOEeqHL0mGoaILRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEhGD1rG6kcYYDmybe/8AwvUE0o3hJfYGvwNlGdNXBY=;
 b=kwgnEBRluQ9dmJOOakjhXD8WRqXMOYMp0/1c5cgAALx0nj9QQjyfkJOaGzeFTQ3IHV+QdcEGzbJy9K4zLghcGe7kjAenT9BimRIgrbsvcvyLGgGX3DsrPSNXB8Cj40125T3Y7IfzRjyiHntSSTn+hvz0BJtAu27GyCyGkPLLqBbuO4FYzC69vhd5n6LEMsS+P2aepQyiLopOfh0zYLQ4cqpGOjIYLy47aB4yWq2mflVhZaBPJEOo28XK3zHqUkxFMIOVRC51VrSIBpLJRnrtFGKjVZE790IKLoejelIH44k6rN+yNe2CeCtxErmmpwfGyCEBSHznTqiAIbPyMAgJCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEhGD1rG6kcYYDmybe/8AwvUE0o3hJfYGvwNlGdNXBY=;
 b=v9Lh/sMwHQEBdFjcSdRdf83dsyxlRhZ7+hcK603ooaC7829nExHcrYLDFnKSRPGlGAHL2CCUPhe7X87Rsfj2L9QnCGUK2yl0Y7ECWU/FeOPXxeqzggv/S9wSxLMOnZNcgVin5ZfG9sSweV1wITMmmTkwz5FbA7x/0mbly6z+13E=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6913.namprd04.prod.outlook.com (2603:10b6:a03:22e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Fri, 6 Aug
 2021 10:06:44 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 10:06:44 +0000
Date: Fri, 6 Aug 2021 18:06:39 +0800
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
Subject: Re: [PATCH v2 1/1] drm/bridge: anx7625: Tune K value for IVO panel
Message-ID: <20210806100639.GA2207093@anxtwsw-Precision-3640-Tower>
References: <a02c0a414bd3d0f67bf7d77c10415196743f1c0d.1628242192.git.xji@analogixsemi.com>
 <CAG3jFyvTsG1ZjqS+3yqspW+DCPX4zrs02tdmqC9n9mQxmvsJEQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFyvTsG1ZjqS+3yqspW+DCPX4zrs02tdmqC9n9mQxmvsJEQ@mail.gmail.com>
X-ClientProxiedBy: HK2PR04CA0078.apcprd04.prod.outlook.com
 (2603:1096:202:15::22) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR04CA0078.apcprd04.prod.outlook.com (2603:1096:202:15::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 10:06:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d903c8f-bfe7-4eba-5108-08d958c1e4b1
X-MS-TrafficTypeDiagnostic: BY5PR04MB6913:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB69136B329C7516459EF31D14C7F39@BY5PR04MB6913.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CgtFck/hI0A5RMczSDWuk8OCGTOaEZBTN1DuNyZPDB6lnb3vlwXExBZWMw7oCw1FFp2/itjI66FxkDx/CO7AT5VcsfIUc0S8LRpuN1d3frWXxk7G5QfcZmkKfry0Pcz5bIDkIHmSP+iKeMxEhJQTJPe/su7qghQseAAN46yVxvb9+9mYT87Jz6cH3fiHGqzQ8m8diOTuQUQ6q8QCq15gox55ZIEWfIXMGtAWj0YC46v9ft8wRUZV1N/iaKzi4lS43Qzsn5SSfSUYcFgoScRJWJ3zQBlnTE8JD1TU7jQhn2PD4NG41I5pR4lBnK8i9PqqTJD3Svdaq7oICXUpF5A7xJo0p+RqZ/gg7Lk6VIdU1jb3j2Vf6Qdk50aARQw0AGz0OKPEJDZdMb9wzoyH0mIDJg5Cp0Bjqj7HsZGZErtKd7s8veCECWQBlBkgI9NOlyUWAGOiA2MOEWsNBefiSGeF8vr/dwrx/DzBkxNOFFSQP0LIBmor6Nzta+eN2BmtaK3yG/FOxqO/ygyVWXTgIqZ4BD2GnPmhgf0xSI8v7tpUu8OxUOk79OUVt5XGYGPrYYy5HOgWNmL2pOD+QbAcdZLuqFg3kc0tPOEcGz2FNQkcCgNzT7g0S3Yt7iSTurLTLpAuVG/M52U9bqOCvrr6uhrzwaCE3C2GrWbUMoDrymuWvrLRfFGEVfp3Mp/DreYzQ7U7p3VDAPWZKHLGbZJu+Gb5vA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39840400004)(396003)(376002)(136003)(346002)(2906002)(55016002)(956004)(54906003)(4326008)(9686003)(478600001)(8676002)(83380400001)(66476007)(66556008)(6916009)(66946007)(8936002)(316002)(33716001)(52116002)(6666004)(55236004)(33656002)(5660300002)(6496006)(1076003)(38350700002)(7416002)(86362001)(38100700002)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?haUR7gFQxrXwIjfGiT/oZg5Ue+5zyLVA8qz9agi0FX46SSjXMw25aKfMcAN3?=
 =?us-ascii?Q?ZYFqMi3AJ3Kb/IdOPq4+AVGM8uiLG4CX41fqUpS1qzP32rBWcfX7FnMz8ZN5?=
 =?us-ascii?Q?tGoAWm5wOwMqIXpbkc0EsatVaYicTxU1EWCuT/X02mZrrXjcaL8as72+FGRl?=
 =?us-ascii?Q?EqMq61TVk/sJMP5jAf1iQ/TuLgmQEcjhV+tHWqKrEXbJV7QomfiA2DazI7sy?=
 =?us-ascii?Q?gXtXeWgP/fVwLs80JL5x0sDdLDVkkRw8SQIs5lM89gDn12pbGUmmXJ0Eg+58?=
 =?us-ascii?Q?aGlaY8Ix0vghUZSw/RRrmhvVG1hNG1N3rB8vq/PwpPWGsFkA5paSyPHQ4OSQ?=
 =?us-ascii?Q?+EcqLsH7gBsZIoRrP9S+pPQF7kSFang0FzC5wm0nNkgujjlnwrJy7OAtjMks?=
 =?us-ascii?Q?2k3+E5vghxyVj/Ubr69bq9XtX57j4CeYtkxgyrXLAEuTrb7BFqYrJDnjsl3+?=
 =?us-ascii?Q?dfwLVekBzWFAAktU3r8HtDiW2Tl+HWoz4TXrKh2BFwPrub8KBxjFy3LxY8wT?=
 =?us-ascii?Q?4TbFo4ylCxAeTQ9fPH5rcw5aXfTgCYO+IdXSNkqiSf0KNDuIUbJGJAEdHC/t?=
 =?us-ascii?Q?RGL/m7MyjvNhy2YY2GLA6k+XHEV4rJDYdDSV+mUxA2QvQGkBUi3O8RLNFjk0?=
 =?us-ascii?Q?rB445iQbcEhIn+5DNv+Eu7w4cRb6dqNtf7ij1pfOTZUw3ChsgC0g+h4rUaZu?=
 =?us-ascii?Q?f48z5THIo2kz+JzkxOvFrUjeIDDAjaUvmTOxGTUW44oi3wGXc9130I1xA+Ep?=
 =?us-ascii?Q?EAEI/DJ3CzTzAKjMVjfsimb4M4e790mSzXVDaVJGb9+TOcKgFEq5S7GdcOHw?=
 =?us-ascii?Q?mYxj73yLZWi5Skjx+4y92JvzovWBK0rmUywMaAzERN7zQ4xfKP3jPYe/D+Yj?=
 =?us-ascii?Q?n4HjkdwHx22qNXmOmvfnKG0UWQZ/gXn6jia375SQLaKSaDcQciHmANfbYPkU?=
 =?us-ascii?Q?OLS3i3ykfvzo5M3r02cUNqXdmjYCdeihOfaG9fBcLObPbP6+APTRucTmX/Hc?=
 =?us-ascii?Q?TCOmg7iJWsuNAhSXBIH+2gF0G+tKLCtpsbwGdpsHUbePP8tCKH3SXtseolAQ?=
 =?us-ascii?Q?Bkv+fTN+61XrE7ruA8U4NLAAuPm8y5ECoDPXYLmDWINLPChpWCBVEXAOc9Cy?=
 =?us-ascii?Q?sjBuTURkKoXjknfPcjd17Hb+SSAXkNKt1k53bWEjydVZUFAqoqDDL6AKMnA2?=
 =?us-ascii?Q?ZJlx47Q4qH2eQMcAN3IrgV6ylKrzpG85UdPtbqdq614cfZ+jArD+2kPbcIRY?=
 =?us-ascii?Q?pLu1iJYPgLSQW9o/9/nclGsGfeiouMQZF/oQqbUrq7u06S3UXZu16tgmJvUR?=
 =?us-ascii?Q?Ox1nFdsMFDAiijJ8S+tUbTzf?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d903c8f-bfe7-4eba-5108-08d958c1e4b1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 10:06:44.0345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RP3NCK4nCxLURWV5m++fr/XAswJyCQxKTQXBfgXu3fBbIRdJ0R7g/JpBYV2Z7TozmY4PILnx17bPO0h/WEPXLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6913
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

On Fri, Aug 06, 2021 at 11:42:26AM +0200, Robert Foss wrote:
> Hey Xin,
> 
> Thanks for implementing the suggestion so quickly.
> 
> Can you send this version of the patch out as v2? Versioning is
> important and both tools and processes break if different versions
> aren't submitted in different emails.
Hi Robert Foss, OK, thanks.
Xin
> 
> On Fri, 6 Aug 2021 at 11:35, Xin Ji <xji@analogixsemi.com> wrote:
> >
> > IVO panel require less input video clock variation than video clock
> > variation in DP CTS spec.
> >
> > This patch decreases the K value of ANX7625 which will shrink eDP Tx
> > video clock variation to meet IVO panel's requirement.
> >
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 24 ++++++++++++++++++++---
> >  drivers/gpu/drm/bridge/analogix/anx7625.h |  4 +++-
> >  2 files changed, 24 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index a3d82377066b..9b9e3984dd38 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -384,6 +384,25 @@ static int anx7625_odfc_config(struct anx7625_data *ctx,
> >         return ret;
> >  }
> >
> > +/*
> > + * The MIPI source video data exist large variation (e.g. 59Hz ~ 61Hz),
> > + * anx7625 defined K ratio for matching MIPI input video clock and
> > + * DP output video clock. Increase K value can match bigger video data
> > + * variation. IVO panel has small variation than DP CTS spec, need
> > + * decrease the K value.
> > + */
> > +static int anx7625_set_k_value(struct anx7625_data *ctx)
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
> > @@ -470,9 +489,8 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
> >                         MIPI_PLL_N_NUM_15_8, (n >> 8) & 0xff);
> >         ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client, MIPI_PLL_N_NUM_7_0,
> >                         (n & 0xff));
> > -       /* Diff */
> > -       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > -                       MIPI_DIGITAL_ADJ_1, 0x3D);
> > +
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
