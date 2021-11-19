Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BE84567AA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 02:55:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CDF6E9DB;
	Fri, 19 Nov 2021 01:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2131.outbound.protection.outlook.com [40.107.220.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC38E6E9DB
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 01:55:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdMZ6fRLNgSC4p769fXriDrh+qZT1ZqZzfMFI4Aqg6CYrT7Tg71AxLWfj6Ic5d7QT7XL7H+5rv3MPfNi21Qiv9Ym5gH0JG014YmcvHafp9SLiw5M9OusKopA5jxr9vmsp5YswfPliehZEDX19vPqQOZCzgfq7i5Wvt6y5OfKmx38qX1XyDmgif1SjKEcAZtm3Sn68NOMKEdv5kPE8hdsW5u++Kfpa2WfRGuA5cF6Q7FJkmF16fTCkVDPKeFP63Xjqw5ZS8JAhmUkJzVHtW5CCBHOkl/6AzXex85F7KVkf+w2tKW7s2VUVDmKF654Onud7dJ9FgoyrVVU1gE33yyLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/xdbExgj/ouG7ldiWsCR5AMWY4eupFw9GetCQ7wzmE=;
 b=fXrazToJEx+z2/fr8TFE+LbUS+MC2wK7RuikybkjdEJ/BmjOR5Cs4SfQg1BRSgb29/La60lTzUQiYzOi3nOJExIPkfN2n4A9U8j9aMbvSS3Aarrb1qCm3ikV+uJac48gRNoADqBbt5pGCCIlwNqok3+bLQCALyPZ5mH83Y8sppgk+hd4O5+i4nbA32oWU2wS4sQJhxq4eW9V9tJHlZs/z72mRvpLxCpxRdBxZ9T4avk+RbanujJFsK+aq24ga920relmeUBaGvQZEqwEXStSKIEVX07cnTNTSU01p5p+tI18SFitpDGp6FHlt0JrQoJV9u7WCQ2Po0J7AmSn6AvfQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/xdbExgj/ouG7ldiWsCR5AMWY4eupFw9GetCQ7wzmE=;
 b=LQnPKougsKi5Mcv1QMPqlcyk5SDjCamaOS+ZhdQ85m//Fd4xseTh7+P/TOpUfDIGqOjKljb2s6VQDXFYwSd+rKzJ7ED8hQUnHevhGtEZ2aXXyD2bi6mTZz8Q6i9VX/E6/9VivqX00z4VTq39UBQTjtF7LwrjH7D4GaLOjF0quaQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SJ0PR04MB7264.namprd04.prod.outlook.com (2603:10b6:a03:29f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Fri, 19 Nov
 2021 01:54:59 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 01:54:59 +0000
Date: Fri, 19 Nov 2021 09:54:53 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v2] drm/bridge: anx7625: Fix edid_read break case in
 sp_tx_edid_read()
Message-ID: <20211119015453.GB3823948@anxtwsw-Precision-3640-Tower>
References: <20211118193002.407168-1-hsinyi@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118193002.407168-1-hsinyi@chromium.org>
X-ClientProxiedBy: SG2PR01CA0155.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::35) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 SG2PR01CA0155.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Fri, 19 Nov 2021 01:54:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be397a44-a997-423d-2e24-08d9aaff9813
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7264:
X-Microsoft-Antispam-PRVS: <SJ0PR04MB7264CD26A134B8CF9CDA2BB3C79C9@SJ0PR04MB7264.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jOpX+5yRNa8DCcQAKG0V1uWdTkf5cdpzP9c2ap1SnTDTJa6ajQPLlmVl/z/bLEHLbTqNGP0jmbYx+qj5hzbJa0DyIp7Vd2wIX36Yq2K2YTmYelVgJhkn/rq1Pdv6E90ohhfHe9GYOL05ATgu9+ychxcCb4SSKxGSm2Pgl7cwWn93ZPecOthnwotGiyLu9oBASKevetNxbm4WKOd752jHZM7kzPV7jD2pnOQ9OK2F96/WzCUa34YKAdBBEM18yR+uAibgUCN03pjIRUZRvk13RPXCTq6K7ry5Kz2e4f98vScJOze+MvlWCJDlwwtOvv3A+7NezaGnzFIvEKsDEpQvjAgs4A5txtK6CFjGx++dsAWjD8QjEfekrnVWkbea0Pe4dYXnFOmq8xMU7TFCZZhCPo+PHcf4EUG0KytMf8BIuLdZy2VlM2iANS6IYe505CWAa7f62m06V5HqqmJBwyCVIHK8GHKAFRj5KFDHV9HuvrUitqilr2qDpiAAbBqB0env6UtlL8tkEztKDygCfdJ/ya6yRYaSgEdA8SihmLYadJokp8cOA7Iun/4u7N5mfgeYf5HSxOqEBXDaYo3YsYNYiIFgB2WytQZPG/WWud1WaA0BdhMQ4qLfny5p2INMX0EVPsNv83+PqfpIxttPAJRhKk9RIOpVJZCxtE70XDuexZ2/Os4KvLKLHZ4NgjvX0GXasbGDq4V2v33+eaIYz0mbfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(54906003)(6496006)(8936002)(1076003)(86362001)(6916009)(38350700002)(38100700002)(316002)(52116002)(2906002)(7416002)(33716001)(186003)(33656002)(83380400001)(66556008)(26005)(956004)(508600001)(66476007)(5660300002)(6666004)(4326008)(8676002)(55016002)(66946007)(9686003)(55236004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jt+vhI3iE9lXOKRl9V+peB1A5oyMRZK59zAnzC4wwQvj/FWfLyUOP95gGfyu?=
 =?us-ascii?Q?uJOixlzbd9SbdPJR/oJvj6kz7LvFJrdk2TSSWGSDXGXgz5L6rmd8bf01cUKI?=
 =?us-ascii?Q?ZJpIUE5GEp0/9MnQTzbn7Uh7cK6r5eyfdtAQlvUkQdFrwtwb7EaK/NBGhK3S?=
 =?us-ascii?Q?tN9iDyLfyd7lWyJ0TuiuaTAPlb4S0V2eFVPc5+D3pDHbnsKYNXNhKgZBpHoP?=
 =?us-ascii?Q?RuMFZPG3Hn8AYRn1j/1KdBIaUyuC+Y5+F8kmZzd5JW9FBFdrH32UiEJlXcpY?=
 =?us-ascii?Q?HlleXAmObkdIv3WxNprVl/uQYGCtqUgr+LhLURoB9ixHZI4vUb3zhY2xdEEi?=
 =?us-ascii?Q?YYz2xTetqynbzDewQ5p+0B6SUEgZIIUY++VsBB0ezbUqqRTKYPi+DVmIKAa6?=
 =?us-ascii?Q?uFK0EzOdkra6LubnX/tHvLG8kkoHug9/OyTJQWK176XyvnAKl46NG65MPCpn?=
 =?us-ascii?Q?/6j4+/f4CKv+PonW/fJVV+paw6/j035ZNHwDTqG1OH7pvzjkP+DS2GzvjSko?=
 =?us-ascii?Q?PpwEDTZ7MEIKoKlra+jIQma1inSEO4ndfrVt43s221pJjm0CyD4KwoVWRkYI?=
 =?us-ascii?Q?mKqyZFfkuCw0MwZJwGPhQCBVClrEjbFO2mYej+Hwf4zYXpdrBuRRiQd4B3I7?=
 =?us-ascii?Q?A9sOJYPS/dFFhYlv7mR8HnI1mffUul5+39+WRFMbNH5M7H73TJGdFJJslCPH?=
 =?us-ascii?Q?pey92y1Qhp8ADc0qPi3d3M0BSfFhxaac49mJTWWw5e5buG5q8aKeKBdl0dSy?=
 =?us-ascii?Q?XHiBJtTIz7gckPfeXDLZe1klksEfv9UzuBuL4zX5ph1Erb5TjjUQB2b/qkrj?=
 =?us-ascii?Q?LO8weoKUv+eAcAe/BlgiU3rakV2Kwzoc5O4Uh+3GdoipXG7jCZ60A6RnsmMl?=
 =?us-ascii?Q?TCF+xF0fcae8HxTQMuN/ZTM/SFTHmnip4VVlCoDTo5eEHSwGd8kkQY3MMunf?=
 =?us-ascii?Q?vGcVAIF1/VBYQllw1ANU4dOIzXRX74GhQ+gyyCNgqrIDc0H389qK6pgT2+bw?=
 =?us-ascii?Q?8gdFhE+peBMVyZShmi3jyqMwOCGBJljTXWy6Ta2vuTXDCJB87bUbM5z0i4Id?=
 =?us-ascii?Q?0TsckO7ISvPcRHzAK3vIv4teQ0gT6L71dm0wyvQycmH4UrCWd1rp0lMx/pu0?=
 =?us-ascii?Q?aUhVcVeTeaZA9nAm1KTtttj+PALe21DdTOpKGmvKAZBXIatAgDAgkNOPPY5d?=
 =?us-ascii?Q?Ahq38BPeQQpa8dwjHK1fBLDnMsnx/177OAeeMKiWumtis5c09USd24DWLyC/?=
 =?us-ascii?Q?+M8gM3+gkdmRkCxS5E65uFVcXmiMc87r3Z3dI60sMJDvgnsQ49KGreABwpqY?=
 =?us-ascii?Q?46pkCP0JkD6fpF0wOC2xx0qT2pDJ8qGIiyRDwtqhVzi46awKyW2emlm8eM5B?=
 =?us-ascii?Q?E67c6mXCYmTOorzYoMJ/+z9r1PO3xay8xK1vLuYWJ1vp+U7xDJYAHbcOojoq?=
 =?us-ascii?Q?IfrYFVseNkw3BsyhfUL74P6n7dY3tO126Wd79Uqno39U8hyC/shSomAOGZT2?=
 =?us-ascii?Q?8Rulp+zdsd0506OxhI+gQVgG4UM7kWsJSS3hMVsRI0JC28ael0gxW6wLY5ZI?=
 =?us-ascii?Q?Lav6pfPRNOZIRTTkX52M+1Qgn5/k1mQUBeZkVtoieEnAVH8HO1aoTNLru+rr?=
 =?us-ascii?Q?GDqny9m20F6PqyvkhaYMMvU=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be397a44-a997-423d-2e24-08d9aaff9813
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 01:54:59.6253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v85pj94ajj0/By8ydPJQU0/pxdETvXsryRJ46dUXxpgn1vaVajnlLPyHk3iKRpEoLZqTGhEMbRDzm79vUehkhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7264
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
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 03:30:02AM +0800, Hsin-Yi Wang wrote:
> edid_read() was assumed to return 0 on success. After
> 7f16d0f3b8e2("drm/bridge: anx7625: Propagate errors from sp_tx_rst_aux()"),
> the function will return > 0 for successful case, representing the i2c
> read bytes. Otherwise -EIO on failure cases. Update the g_edid_break
> break condition accordingly.
Hi Hsin-Yi, thanks for the patch!
Reviewed-by: Xin Ji <xji@analogixsemi.com>
> 
> Fixes: 7f16d0f3b8e2("drm/bridge: anx7625: Propagate errors from sp_tx_rst_aux()")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> ---
> v2: Fix type error.
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 1a871f6b6822ee..3a18f1dabcfd51 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -795,7 +795,7 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
>  	int count, blocks_num;
>  	u8 pblock_buf[MAX_DPCD_BUFFER_SIZE];
>  	u8 i, j;
> -	u8 g_edid_break = 0;
> +	int g_edid_break = 0;
>  	int ret;
>  	struct device *dev = &ctx->client->dev;
>  
> @@ -826,7 +826,7 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
>  				g_edid_break = edid_read(ctx, offset,
>  							 pblock_buf);
>  
> -				if (g_edid_break)
> +				if (g_edid_break < 0)
>  					break;
>  
>  				memcpy(&pedid_blocks_buf[offset],
> -- 
> 2.34.0.rc2.393.gf8c9666880-goog
