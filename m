Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76F6A134B1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA3910E8DE;
	Thu, 16 Jan 2025 08:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="fbPLGm/R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2094.outbound.protection.outlook.com [40.107.93.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736A310E5DB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 11:01:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGdtDlKKzZLJhE3VQLZnBd/AQGayhKXsgGK38iwee1+ywGZ+fgQ+FNao6N8dkr9Y4Kd+dMqf7NgmK7vikNOta8IydvYOZpETEzDWnip79LjxaCp2TpfahjGYv7L7Y9AA+fmbedndr/6AFl6xSY8+Rh+7a8hMNfIjpnD1zxPwjSk+iTIN6zccv4nYqhiTrRNk3SPgTyE7r7wvUth9VpB005yveF6R8q/fFBK4C3GC2QcgMVmvQdwUHVIeAb/AePouFNx0Ze///JzbgwDanZEF1G2RaAatAkr8HAb9yyQAMHiQsVGQDR6OfMmHXmhiVBIn97o8c7SL1d/aZwxMm3H64g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exkryPA9kC4YcCxJyZEE8U8u9uu36BXbsDs6dLKoCJI=;
 b=uZP2gnDMnAq7TgvdmSj+Z+HXy/tJCWPCt7O2oSsqRhT1ySgVBg39/TitdwLWcZGXO4GMKTa3qJIEIAd74HdHQojdin0sWHaNRzP/cAFXcMg7ZeYRtQKaumyVyB3xIMhOcrjORecorRogFq2EDwUTMjgW/OZdrzntK6GsG1+A2/IP6wjyKB/Mp9yqyZDV1Yw03KKH1atrO1z3WuhsrYd83EIeTI67BFOBn+cCRk6DobVwyFIGQePB6k3BhV0utBCpXK41N3aIQoY6vN3g/6Hhtrq+/84ngknPJ8P8yEqlMAV7LeesggBwwSmiXFujpDvt+jO4mzsRT+9HUnA+0YrpTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exkryPA9kC4YcCxJyZEE8U8u9uu36BXbsDs6dLKoCJI=;
 b=fbPLGm/RLbhv/S1cluhO5GCcvhLvLw2W2k4z9R6w5eM1yCRUEiKbTWD3Ms0hfFWqjK2i1fu4ITtcWB4gtuwR8HsjDXB6XVDofBxXJnLjHUlxu5GLccRL0TbGcpdtSgte+F+KeDoWbiS4+162nWFS1zIEyW9OKUmD9YoMXwCR83U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by CH0PR08MB6842.namprd08.prod.outlook.com (2603:10b6:610:c8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 11:01:55 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%3]) with mapi id 15.20.8335.015; Wed, 15 Jan 2025
 11:01:55 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/ssd130x: ensure ssd132x pitch is correct
Date: Wed, 15 Jan 2025 11:01:38 +0000
Message-ID: <20250115110139.1672488-3-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250115110139.1672488-1-jkeeping@inmusicbrands.com>
References: <20250115110139.1672488-1-jkeeping@inmusicbrands.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0215.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::22) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|CH0PR08MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: b6fa193c-0f35-405e-c77b-08dd355405f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ni0XLmCm6kidoXINeaE0TcffQyA3JFAIN43yOX/kPjmLjSoGVTjyZpTkZJmn?=
 =?us-ascii?Q?ux1wLxIAieRVBc0d63zP1hA+YKylz/ZKai39rZu0Pjq+uKHAaoraq5Ah+JTo?=
 =?us-ascii?Q?XkkJcgKSMflNbgkkSlnCC8LPL5zfJXA9noJpz5NC9rcELgHzyThxPc0wHP/q?=
 =?us-ascii?Q?pSQnpWyAraPnt2+j3IMi2OHSzDxaNKEdUYqG83DGacFlf6nI0/1eIH4aq3sB?=
 =?us-ascii?Q?VW7FRsCHPuommdGHyxbILtzGft/Bevw0xohl1GNe3k60sU2qcSuO46/rYWm9?=
 =?us-ascii?Q?hKY88BBlRGa51hWwNM3cIejhfF3meqqsq5NHtdMKaUyIvwopjMwpJcfYbUh+?=
 =?us-ascii?Q?Sj+uKxZS6f0wUzlJKAXoN3Kowuum8FMQEcAqJJ+stoD5mm9ayKP5CxnaUWnK?=
 =?us-ascii?Q?aJVjoM4dpVQPFI5AX49p7apkG9WvWhtsDrE1vIarOZPRjKY1B1Ycmr+s90v0?=
 =?us-ascii?Q?Ao7Mj+e31fpACmJkCLvzYpd6ifufn58BaRt2QyEb6i5cXLoHvRFJWbefeIX/?=
 =?us-ascii?Q?B9CcKPIm8UYRYf7GBL5NrxoQNHhd5zhVuqdyZwkM9Yj/ig1/9k6ilZTVnP96?=
 =?us-ascii?Q?KMCKQepi+rkCg+DkQOjAcKGy/X5bWuUq0HajxIasBQa8WPcgBiLtR7SMD/xn?=
 =?us-ascii?Q?oY4jUrCmsPMzdd2t+orFOn4dN7ALpvcyNPPpV9+7xF1ZVd5cwwLYvfQZaVHB?=
 =?us-ascii?Q?gi8zkyhMpZmqXN9m0F3DCAPIMVby9YxSmHWngSNHiUulT3f7oOEaRccCEvuC?=
 =?us-ascii?Q?SZoKctwviaXC3Yy6NmTO/nFskqM9dTxe3xyw4TL7UtVMEy3gaYkOQNIlZi9U?=
 =?us-ascii?Q?jobv/YTS5SwviPcSwWvG8f7t3WcwIdwSbMXRvXGki13TlJzw+QAZqFKLC/V4?=
 =?us-ascii?Q?gbV2of6VC+HbjIToxjVCA8+tVYKbPZiUevN0BxqDvUWllIm9/oyAMhTrh748?=
 =?us-ascii?Q?+zYRTeTvGarYcV2Iroshk6ZGNb7unU7mlIIm39SD54HK8kwHDowHHsDomu6v?=
 =?us-ascii?Q?IgR1+XzQvKKzkkrfSgmH6/p9urgaoyT0Z6aMp1zlGvND+jfqO66uoAsXjjv3?=
 =?us-ascii?Q?ccIwdu6EkohtzaL+XsQaGUb5lY8GIuxsJlBbfZCircuOTjtaTH6HIKxgdl4Y?=
 =?us-ascii?Q?XFYOjyeMa1+hb7nXtnXll0pAcQ3AU+P2kPNjdik61FVK8tdXhBGkbAp+6xQ6?=
 =?us-ascii?Q?MCqoD9HCH7a+3+WqPYqI6eZnRCA+xYMxAahcrFOmoeFNv/5GGRgpmQtgF7dU?=
 =?us-ascii?Q?TT7wQgyqDkXKhS/Ck7poWDqUAJT61h9HbUklhSJ9Q0ffnnbMzCtKsJOfgeR5?=
 =?us-ascii?Q?QuSj2mRxXhS7BsyHQTPruPpfeRnTxQivop2LYvnZt7bkA/ralL9WrYKPPNGq?=
 =?us-ascii?Q?wgvpV4yjU0JblHo/CEkDkPj8OmEHSvZU6VJW/q2dg2FUIiH/LmE3BMG6SxNT?=
 =?us-ascii?Q?v5nbbnBsGipAMiA23wpGq+ulR/8d0daj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR08MB8282.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vkKOBRpuZfbnion6+MX2jM9o0AXZKYr1hKPCXSiEqtv7ZHG491hPNDYNWu+9?=
 =?us-ascii?Q?GqxeT3iqoEYbk3yZLcDkEZYzBXK5fvWrh5dIZV7wmVJ51VD7II4N9zP6sOYf?=
 =?us-ascii?Q?uT0EXf4yUgKilt0+NqQkZz557+K5SargqMupWY8z62vX9ztRlcpRNRRi56Eo?=
 =?us-ascii?Q?ghMu3DJbSmaz4whEg+hR1IC+i1oORKrGazqVfbL/096TtUPD2Z3h0da+OmXj?=
 =?us-ascii?Q?BpsS7KeFw/Ve4uCbrepYFJf0feBSFY8ttNiHMOWuPGTu5jplJfDRIX8w1eQL?=
 =?us-ascii?Q?DDyD3/Xcwd8dwiuizLprFLtgL1RAHEP1gTSKrujAJfEFhyQh5FC1lX8Rns8i?=
 =?us-ascii?Q?WaOt8CM645hwTyjU+/NQH861z2lP0fI4Jl6lai0H8iNfCp+qhvz0Mce1Mf5Z?=
 =?us-ascii?Q?3VSkhoDMw9jvSqJeLuZAAPu9Ld8tMA/SCP4VOfs/id1ndVhFqcp0X5NRp75y?=
 =?us-ascii?Q?oRNQN8j3nBOLQkBt0fQQ7PwLu+83/L1/kLfJW9DiwbfjLLVwcQmReuCF1qXp?=
 =?us-ascii?Q?91QdaTwdDyJZEQDH5fJJc8Fw2+AYHurKTuGIK0y0B3p84aGNxa5PCRxAkVEX?=
 =?us-ascii?Q?tTgh62N2FDwON+GgZ927QirY40I2fm3GyrbS5pRWG5EK6kJDxbT54BHLmRUv?=
 =?us-ascii?Q?S1TCHssDXeLRv/Bz/uT/FrOa9XEpCJy02VA5wYDDTl/Qrp95ir/Eq5SsSsuu?=
 =?us-ascii?Q?8BqNJK+/njyoTTU8geHFK7fRc31CcxxPLVDg3jYoKeBoORMf7mj3wdpUtFkJ?=
 =?us-ascii?Q?FY0dA/YBuK7R1bg668wZhz3OJ/3EDjd8iW2/5TUkHO5MTmXSSaIZd/lbNC4H?=
 =?us-ascii?Q?ajFj7AWrImtv1pfra+ksWzTVMAqH+apcREDViZ0neu1M32FIqqsq/vm/5bwu?=
 =?us-ascii?Q?OWNGyO7jC/EjyPEllurdWa/YKoM/7iYCw5nIEe/WaOz0SoAstXX5TJtSFyUs?=
 =?us-ascii?Q?mEdj5d793Vg9qiX2FDUgRubsao7rSMsSx41EEYrafF6ChG97+LMJSuO/NhuJ?=
 =?us-ascii?Q?SCwZ32lMiu2Dy9XUOzF4FbjFumudETHgg4skf5Q7XE3mlkDKuFFe0Q7C8bNA?=
 =?us-ascii?Q?r7tz8B/gcKU79MgZAmsGn0OdyDY3+qtrDtQNe7J7wRdsDQQu8SLMyXEmFqJJ?=
 =?us-ascii?Q?mR6GL+beIOFIBfxfwU26rb3rLdmpEdPY/3GIyOnkUH/rEZTcudOMH4q7hXCP?=
 =?us-ascii?Q?m+6pbhAfeUxuGE9ZdxfjbiArX4ln6CyCdvMbJDks6NLG4BnavqH5bh+u5mD5?=
 =?us-ascii?Q?pY8qXA8Y9cM2H62KdIJ9nZ/gGp6XBKvj+4DXX6TnxP6zeDJCX6JvtlW/CRgD?=
 =?us-ascii?Q?m9ka/4ys2Rmqqq885gCDFtOtXE+jq5BfHlT1E7x8P0AReCQsZGMToag4Bd14?=
 =?us-ascii?Q?Fhq21FUJIFxmxjKBETIqzhsDygnyeqnj2dr/BzPofB78jhtYeoHd2eEfTQQX?=
 =?us-ascii?Q?IYV8KydgnH+8CvD08HoEpqwFVgdGDTz+vdRuKR67HcoP3/ooPR0DRYUn4O1f?=
 =?us-ascii?Q?OlvnABUKvfCedL4k3+CPScy2xKGirEfZXmaidhreR3YdA5WDGSH9HQUmc+BT?=
 =?us-ascii?Q?lfshlQR9v6QTvS3xGNVetnWiiGVwRmWDMMamg75rKhNFO09oODAJl6vnOnkV?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fa193c-0f35-405e-c77b-08dd355405f1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 11:01:55.0428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdZBMxAXYR6dck3dM6cF89G4T6SzFGt9VoIrYilqVIAJGzb0XGBqbg3vFVb8kqJFU8/Wpxn5pSljgt92Bz8IZyZAPFX/e9rFxJQZLXVVvG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR08MB6842
X-Mailman-Approved-At: Thu, 16 Jan 2025 08:07:59 +0000
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

The bounding rectangle is adjusted to ensure it aligns to
SSD132X_SEGMENT_WIDTH, which may adjust the pitch.  Calculate the pitch
after aligning the left and right edge.

Fixes: fdd591e00a9c ("drm/ssd130x: Add support for the SSD132x OLED controller family")
Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
Changes since v1:
- Correct typos in the commit message
- Add Fixes and Reviewed-by tags (thanks Javier!)

 drivers/gpu/drm/solomon/ssd130x.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 4bb663f984ce3..dd2006d51c7a2 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1037,7 +1037,7 @@ static int ssd132x_fb_blit_rect(struct drm_framebuffer *fb,
 				struct drm_format_conv_state *fmtcnv_state)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
-	unsigned int dst_pitch = drm_rect_width(rect);
+	unsigned int dst_pitch;
 	struct iosys_map dst;
 	int ret = 0;
 
@@ -1046,6 +1046,8 @@ static int ssd132x_fb_blit_rect(struct drm_framebuffer *fb,
 	rect->x2 = min_t(unsigned int, round_up(rect->x2, SSD132X_SEGMENT_WIDTH),
 			 ssd130x->width);
 
+	dst_pitch = drm_rect_width(rect);
+
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
 	if (ret)
 		return ret;
-- 
2.48.0

