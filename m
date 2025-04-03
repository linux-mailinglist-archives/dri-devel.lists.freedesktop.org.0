Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558AFA79E4E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 10:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE85510E066;
	Thu,  3 Apr 2025 08:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Gv0f1zS3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011004.outbound.protection.outlook.com [52.101.125.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F54110E066
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 08:36:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPiJwNGkKcjk/4qzFHG1Hvtmw6kcZggls1zMaSU6cd8qw1aEU3ZvZfSS58MVznu8rIV3lqBiG5Z8H1skwJoWu4X7KDejmWmpyG/yQH7Hk/flcpAUe1R1udfmtzriqk6zdbVbQc3UBQNRelTYv9I7BT1f9gE7pFAOrDzluQ52W1ZC25HPHjGH4RHhgML6pDq/+yZsw/59MIY5FYn8w0YlEp1h8yRvju//jtqxVRydmfd2wVHroLWn+872waVxAP7dcrNBD5ed+oGHyASwT3TBbVavuHmMKNUpPdRMn4v45UyAdsktD8tDOYGxJOAkPrSpHbeKMteATJd2XDRb0NlnGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swg09rI6Q+VGw3N8ziJtHgndSTpWvSr0nUDmhGZul5w=;
 b=USA6o5Kcwrym1SnzVOfHOKrrd1yAm95MiKyH+RlRGW+XyTwx1sMHj10UOt0pUq/ZjzWo/l/ec+J+QRoHarjnVElR7MvdX8jsJ1936rRFR1RMfnJKLE/NarvEs9EPLqooh/yR3mnCs6Hh5wUOgxY2FaRB3Tenae2s2oCM05qw7wSrad+qz9pQ50d6r+MSQQlmUYlzpobu1HWvr7zVA3ocnvZKG/P79JKJkWc1NdWUG/AtXbEeBgPnNGjQmsMs4q0BQb5+LlQW8P7dwq8/A/Y85uzcNol4Ds0k1I10wtgLZLStesBFWUYMGrSu9QV44PN0YPpn5gHkE1OKjv0Y2kma/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swg09rI6Q+VGw3N8ziJtHgndSTpWvSr0nUDmhGZul5w=;
 b=Gv0f1zS3VBhrJFNM6aJvWUojudu3oaleYq8T5hlg/3WNaEGfjyaNcZaJf8IUe02HRxJtvPYDlFR85/gnod5o27sslldYrqUdeA47GRFOo7DewC0APQ75cWWhEFVZtoNVzxrh6EcIKr8DYSdkxYbkBwFGszflPiWfPGifQU0UQXg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSZPR01MB8220.jpnprd01.prod.outlook.com (2603:1096:604:1a5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 08:36:39 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8583.038; Thu, 3 Apr 2025
 08:36:39 +0000
Date: Thu, 3 Apr 2025 10:36:24 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v2 2/2] drm: renesas: Extend RZ/G2L supported KMS formats
Message-ID: <Z-5IiPFJTL-nb9ey@tom-desktop>
References: <20250330102357.56010-1-biju.das.jz@bp.renesas.com>
 <20250330102357.56010-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330102357.56010-3-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSZPR01MB8220:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d98c0b1-07c9-4b75-b7ba-08dd728aa6ea
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zp3dpDeSZivvx3JEFejet5pmB20GXWSo78vZdkMkVjZLcGZDmT8V7GovS90W?=
 =?us-ascii?Q?v/TnlnikKkHPSqUSVx8V4IoBobhV6u5lDVuTudhA8ZXc94wnkDDZSmuOKitP?=
 =?us-ascii?Q?I/8GMB2jWVJ67PAI8DnWA6I0nVqvj67A3JA7Ykp1F8AZud6Z9WLjCAwjbeWS?=
 =?us-ascii?Q?mrX0QYPOLTU5yFaekOsxwwXTmy8Pw2nxuJHyM7B6YCbRduT1fG6X8N8harrU?=
 =?us-ascii?Q?prb5Tn2Z0V3C9LI8iL8ovbld0upO+gn7ixCzTmOS/8o9K7rF/Q0Spd/da/PC?=
 =?us-ascii?Q?+gul7ZMlOpLZXl1oyLVHz6r13K571QF5Dix28Q+CFEN0fFQjE3dxdA8ko5M4?=
 =?us-ascii?Q?aQiESxwGSHgQqP6kIZntUAxAQ0ijddUek/AmtioUMqjzs2ZsmxyD5Fahv1zn?=
 =?us-ascii?Q?DGHpgymt0VXq4LdTr8xxGKHHuaBgxvpelS29wUiMvKNIWNwywSlA5Nl09JOy?=
 =?us-ascii?Q?yW54qszWri9ClJGZ2z72yyMX7mk0vA7VIQyDILj7SGMYxLvG7WvGijpuC4Mg?=
 =?us-ascii?Q?PZ9jcrdRlhjKnis6ooKiiNpJeN4csJAY24JHONTzGzdKPL8/BD2VtdhDmNnL?=
 =?us-ascii?Q?9PJBT74iN66zKhgOj9kTeN4EQ2pHA0tc3EwtK4YHLsK6pd/V7dvfibzFFRzA?=
 =?us-ascii?Q?Iwjiwoyp+r3uzmXlTGMpncOv4LbxI9xhhTDw1+GLQDSwpVpz4dc3Gb5WDALF?=
 =?us-ascii?Q?EFC7s/KwLxvlBDoHJI1gsOy6ssvn30HxTbp9Qu4kkNhXNiv2yzLXwqm5PHLm?=
 =?us-ascii?Q?6tpTVDGL24RPWg+ymE4ehFyDVs4XJ0B2lj07C95V5T6dO+VcRsXHlVwsUHZq?=
 =?us-ascii?Q?gx60Ef2d6Aso2m8ihc8kJwEDSVbM6Kyr1sFMkIT59YcaEJPqmQJkJIyyr62P?=
 =?us-ascii?Q?ZIcjyyStQVLSINt61qvjhD5xm7yQc7tJbUvL0Lmzy2FcmshY3U+d/1Ttxbxm?=
 =?us-ascii?Q?b9fyvpSjKoz1b1QkJvS6SnT+tOMXg5PVwpqK24TsnUK0uDb5dOgetMY/6ygF?=
 =?us-ascii?Q?iTqnZi2XSGPECjG0WlBZs3UrB6IS2LfJpfWvpi03scov18ZzYQYuB+1YIKUn?=
 =?us-ascii?Q?7/we0CJaoChnoONjAO/qfXCGrQqs3YY3LC7K+L4nB0c7ZlHQ/rdXahGOGsdD?=
 =?us-ascii?Q?vQY2qCnP4T1rju8G4AbiZ1NjEIapIznNL/IcngSUnHI0zOxbZ6CRaNK9TCoS?=
 =?us-ascii?Q?tIR6FfQpiGRy8alE0r8efh2pSnsl1PLbBhLgQ6a8XgZIwG45sXz81wsqn7tM?=
 =?us-ascii?Q?FN21eunRNkI+T3nSfpsCB1uWQE/abyyJlfM55kwOrII2GajsYgZesqGolQQs?=
 =?us-ascii?Q?FXpYGUvjjdqyuiEvQw4BuWavInaPmx9SnxullzOhB9mI+2rvlJbAncUT4Bgn?=
 =?us-ascii?Q?9nQBXUQkPSB+pST5/glyWHjfKBADJYadsYVQCc/vW3whO2nkCGrQ0iuWSYeP?=
 =?us-ascii?Q?gDok4K0N3NSPYb6bKh9TSUVfNHP4fAqT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jC+UKFSFmA5xhiRhkfss2zrPh+v7hEhcC67IupVfX/aAuJ4oyt/wsbOj4VXF?=
 =?us-ascii?Q?uiQM1LnoXAnF+KUBE2Z6Jvs1Huyh4ktvJAiwXsFpELw9qwVEcM+tcPLBTQFk?=
 =?us-ascii?Q?ogE3PDDJau5KT5W8PwMoaRz0CFR0liagcx0KlWh/RzSR8j1U2/CSNYL7WDmk?=
 =?us-ascii?Q?v1dUtPqChvKxcGZj4l017Nv3ZGZRckq81JrDFIMD7S/2CEN2dqGblkG+oDQk?=
 =?us-ascii?Q?vt5/aOri/RZfVB1gX03CjcLfzXtJiBgy2WjJhJFuJ5aXKNmm3Crqb+8kvZMi?=
 =?us-ascii?Q?vqyHvhyc2+2zyddPURnibJT0oA2ac5Q1c9QTLmW2Lsxodd2W8MjpmCiUd1n/?=
 =?us-ascii?Q?PgZHAWeJKb5Xq5PJfTjjvEQm1CFXqZlWLtuUQnePl8xM9w3mql8cX+4BG+aa?=
 =?us-ascii?Q?RrRKknEfBJmCZMkjsyBg260NNddHC/7ndZPhExbtOyzjTF2EvPQsKor+pQDO?=
 =?us-ascii?Q?URpgcVKTiOfMiwtCMLKrh5DCXDADMNNlXYjc7zvz8jXWdrY8KPkeGCmUpk8j?=
 =?us-ascii?Q?1ug7Pj4GRtEQtK8zxfaq8ZPLuCQPgXzAP2lxcXcvAPw0E/nP+6PYTKPb21wS?=
 =?us-ascii?Q?eIR6Sorrd4ZDkNExQ7In4XuE2xDzpDdoV56x8n0QrfhAJLbLSJ1WJcY/zmgf?=
 =?us-ascii?Q?BoEkHSWFriOl8+WuYJmVG7ZAOEXiZSSb8vXmx0KWpNb3mktBgwuQhDgrOAEQ?=
 =?us-ascii?Q?et4JzydQImpPWKWP4fbMeLx6GG41vN3JKTNbL9aaeHVtEfPtrD/J3zqySj1y?=
 =?us-ascii?Q?1aFEvqMhPb+Qm0AqoNqT7w/xxcBdA8nuC6kV0o66xKhBcb36+LnmZYDYOII/?=
 =?us-ascii?Q?xOhBSJsWMmMN+uddhAJvqN1H7NyohB1aacXy9Rlmhoo/WFpScbDLDKEZul4a?=
 =?us-ascii?Q?GmDkBkUuXonbW/zOH2umjNsku+20Ip2dUHTMKqdwBLPk8PDK1b6KbiyjgmMk?=
 =?us-ascii?Q?g5bMwGrezG5AyK0qb+BwHOvl7cOtl+ZaJ0dn0cGdX6b67TlIXuhKwYitZw8U?=
 =?us-ascii?Q?KqiiV/KdSO7KSipwM/d5f1Tbaonqt5FV9otG1CIds4Fgp2j829MDcsSYI1v1?=
 =?us-ascii?Q?JgIPUZrgmAd6nWvKL7k21kZBN+cPjqVQWlbTLWfHFQx7ajeAkQhXghcWgNg/?=
 =?us-ascii?Q?zHlcXJGe5ptOzXtKlVkufEvL49u/6UVpYwXcQ8ZsOylpNewMTlRzhP3ijQAD?=
 =?us-ascii?Q?LuBt1BZqB+ytamxlhxUOXJJySXefFdXWG0JFsqFQVzrs8JdsoRO7tNFuxPDO?=
 =?us-ascii?Q?gsCS8gxCXNMTdFrtZ3BEsSvLIR77KXe1hq0OwjKhifZ5lq6X0/Eqrgn8f0w9?=
 =?us-ascii?Q?1oFeP5Ovw1yFXu0iga4Wk1eO5jci3l+DiGB4Au+s66TYokiZVDtAud5ondSv?=
 =?us-ascii?Q?mFnGEIcx4gKl8nwQOJQd5sHl9cqV2umGpYSpMbsLNIxjSSnYRFa9RbJYHZWH?=
 =?us-ascii?Q?4LjKGPhZUpVxN3skaARh9sabf5+QVevlbpg0M3PJi5vCQGU3FDNDDsT+0P1m?=
 =?us-ascii?Q?VOtP9Q+ujFXp89UCMz4+eTn/cjlRemFup0e9QFC8UgWBtMi2GLl2ppuVQlkg?=
 =?us-ascii?Q?9uLbdrlWnjENeDkmYX/+WGRlBaoEns9Uq9XVDRAmglsKgeQ+GZMLV7ifOfbO?=
 =?us-ascii?Q?4ujCuU8EZQFNKByIHaDbm7Y=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d98c0b1-07c9-4b75-b7ba-08dd728aa6ea
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 08:36:39.1848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mJvaZK/KH/9ph71XOOca+8OFNmE6YbAJvPoa6nL2pJSx46cgCQoVD621Qin1lqAphPbibvAIommcCarnuHU4BNR6r7PTXmV0JvuzcmFLq6EQNjL6mkr1fH717+EmZkK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8220
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

Hi Biju, Kieran,

Thank you for the patch.

On Sun, Mar 30, 2025 at 11:23:53AM +0100, Biju Das wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The RZ/G2L driver utilises the VSPD to read data from input sources.
> 
> The rzg2l_du_kms component lists a restricted subset of the capabilities
> of the VSPD which prevents additional formats from being used for
> display planes.
> 
> The supported display plane formats are mapped in rzg2l_du_vsp_formats[].
> 
> Extend the rzg2l_du_format_infos[] table with the corresponding mappings
> between the supported DRM formats and the formats exposed by the VSP in
> rzg2l_du_vsp_formats, maintaining the same ordering in both tables.
> 
> The RPF module on VSDP supports various format conversion and send the
> image data to BRS(Blend ROP Sub Unit) for further processing.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks & Regards,
Tommaso

> ---
> v1->v2:
>  * Updated commit description.
>  * Collected tags
>  * Dropped bpp entries.
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 117 ++++++++++++++++++-
>  1 file changed, 113 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> index 1a428ab3c424..55a97691e9b2 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> @@ -36,13 +36,37 @@
>  
>  static const struct rzg2l_du_format_info rzg2l_du_format_infos[] = {
>  	{
> -		.fourcc = DRM_FORMAT_XRGB8888,
> -		.v4l2 = V4L2_PIX_FMT_XBGR32,
> +		.fourcc = DRM_FORMAT_RGB332,
> +		.v4l2 = V4L2_PIX_FMT_RGB332,
>  		.planes = 1,
>  		.hsub = 1,
>  	}, {
> -		.fourcc = DRM_FORMAT_ARGB8888,
> -		.v4l2 = V4L2_PIX_FMT_ABGR32,
> +		.fourcc = DRM_FORMAT_ARGB4444,
> +		.v4l2 = V4L2_PIX_FMT_ARGB444,
> +		.planes = 1,
> +		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_XRGB4444,
> +		.v4l2 = V4L2_PIX_FMT_XRGB444,
> +		.planes = 1,
> +		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_ARGB1555,
> +		.v4l2 = V4L2_PIX_FMT_ARGB555,
> +		.planes = 1,
> +		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_XRGB1555,
> +		.v4l2 = V4L2_PIX_FMT_XRGB555,
> +		.planes = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_RGB565,
> +		.v4l2 = V4L2_PIX_FMT_RGB565,
> +		.planes = 1,
> +		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_BGR888,
> +		.v4l2 = V4L2_PIX_FMT_RGB24,
>  		.planes = 1,
>  		.hsub = 1,
>  	}, {
> @@ -50,6 +74,91 @@ static const struct rzg2l_du_format_info rzg2l_du_format_infos[] = {
>  		.v4l2 = V4L2_PIX_FMT_BGR24,
>  		.planes = 1,
>  		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_BGRA8888,
> +		.v4l2 = V4L2_PIX_FMT_ARGB32,
> +		.planes = 1,
> +		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_BGRX8888,
> +		.v4l2 = V4L2_PIX_FMT_XRGB32,
> +		.planes = 1,
> +		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_ARGB8888,
> +		.v4l2 = V4L2_PIX_FMT_ABGR32,
> +		.planes = 1,
> +		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_XRGB8888,
> +		.v4l2 = V4L2_PIX_FMT_XBGR32,
> +		.planes = 1,
> +		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_UYVY,
> +		.v4l2 = V4L2_PIX_FMT_UYVY,
> +		.planes = 1,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_YUYV,
> +		.v4l2 = V4L2_PIX_FMT_YUYV,
> +		.planes = 1,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_YVYU,
> +		.v4l2 = V4L2_PIX_FMT_YVYU,
> +		.planes = 1,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_NV12,
> +		.v4l2 = V4L2_PIX_FMT_NV12M,
> +		.planes = 2,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_NV21,
> +		.v4l2 = V4L2_PIX_FMT_NV21M,
> +		.planes = 2,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_NV16,
> +		.v4l2 = V4L2_PIX_FMT_NV16M,
> +		.planes = 2,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_NV61,
> +		.v4l2 = V4L2_PIX_FMT_NV61M,
> +		.planes = 2,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_YUV420,
> +		.v4l2 = V4L2_PIX_FMT_YUV420M,
> +		.planes = 3,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_YVU420,
> +		.v4l2 = V4L2_PIX_FMT_YVU420M,
> +		.planes = 3,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_YUV422,
> +		.v4l2 = V4L2_PIX_FMT_YUV422M,
> +		.planes = 3,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_YVU422,
> +		.v4l2 = V4L2_PIX_FMT_YVU422M,
> +		.planes = 3,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_YUV444,
> +		.v4l2 = V4L2_PIX_FMT_YUV444M,
> +		.planes = 3,
> +		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_YVU444,
> +		.v4l2 = V4L2_PIX_FMT_YVU444M,
> +		.planes = 3,
> +		.hsub = 1,
>  	}
>  };
>  
> -- 
> 2.43.0
> 
