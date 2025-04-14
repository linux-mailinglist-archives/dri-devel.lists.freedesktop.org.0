Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FA8A87CE5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 12:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E93C10E55D;
	Mon, 14 Apr 2025 10:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="oH7IirTp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11020117.outbound.protection.outlook.com
 [52.101.193.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859EA10E557
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 10:05:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfo/xt3SgI3u7OixAhIu91eAk7Gqn4OhLg2odPBo1770BfIIxLdmWuKjf8G9XFpQhOnGqW6RmbprCdnRty/FD6mhGQY9sfDBksG4n5pXWmToUBi6hXLCmLSga0fCTdfHLi3BqY+us4IOqO/9fcWZxUvffLXFJopfTH0z6W1Prg5iOlPVgr/lNwFub9F/f59gjh2sj/Bn+wjvHyfBWrmLwsE4Av5FeNBtOCQUJVXlKBUMWqxnW2cLQJi3/ORjmRQw23kPFJ0OjgUAxPkRPxjElpQ+YKzjw5akWPsSnDUDF+DegbSJqPPlrkqxYhAUh28hP4nzbSbbHVImwS664a4HZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nR2CrNP6BUcwt+XXMM1UChhg4BAQx9HjrhkmBCJMwlo=;
 b=Q+FksoyWcbxqgwtf1JvZvNnJaX8eyi/XntiH1+TECW0BVZBxzlRyKVT9IRHNbIhQoZE95tFHyFz2CDN4y6AODcB5wpSMA40Jt+Q9j9JBvGn/uZsqGXHWJG18a1lXadsLhYp0hwh6COba4ucZIIYdIOMPQknLgaEJy8BFmbdoE1snrcfwdhb6uxlK+a4uUFk136IplQ8CIbYrn0ERRQs2u7gTJCGmgjeYN3AjVFqk4yf+Runy00nLPRcjYMLkmGXpBN8OzpU24vgZzvvZl53n/8x7qGijr4Jsa0s89VnDadU87z0N+4WeXrTYlbmr8IN3XcDmGJ0VYxFH9zphHTd2/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nR2CrNP6BUcwt+XXMM1UChhg4BAQx9HjrhkmBCJMwlo=;
 b=oH7IirTpDB971ZHwMZJATujWJp6w/IQk0dTf82n6OvdxIz4Wy1HjnXbD3bg5rMGKK7IlRDehgzoJ5itTPo5x/M6OuxFfq+sNJ6YoYi+IOQnrjtMmux591GEAGabqA7P2NzYVeYAkY0LSGBFD3THchfLjf5M0UzgFGInlr/HGq3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by LV8PR04MB9268.namprd04.prod.outlook.com (2603:10b6:408:256::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Mon, 14 Apr
 2025 10:05:39 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 10:05:39 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: bliang@analogixsemi.com, qwen@analogixsemi.com, treapking@chromium.org,
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] drm/bridge:anx7625: Enable DSC feature
Date: Mon, 14 Apr 2025 18:05:02 +0800
Message-Id: <20250414100502.1604717-3-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250414100502.1604717-1-xji@analogixsemi.com>
References: <20250414100502.1604717-1-xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PS2PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:300:5a::20) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR04MB6739:EE_|LV8PR04MB9268:EE_
X-MS-Office365-Filtering-Correlation-Id: fce591c9-647c-40d3-265b-08dd7b3be8ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|7416014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S4oWqSkAAwQQ4V8mEsgoViUR9N5se04xwKNqNazJLPGcrBU8r3TVNZ8sKlzi?=
 =?us-ascii?Q?4tqY4wmIqjiwusVBUijeqPEJGNRYMp3IRZvw9asTIqL0jttTl47UdlX4ScGC?=
 =?us-ascii?Q?uOb0qSt0qbCCFRZ5S+MXpdPGgkEYcUzxHkPlHRKKqYfFPg4OcU5ynFOKjHp+?=
 =?us-ascii?Q?Qzh3KTx1/1a5uSJ6wLQUQhyiJT5wcVMotoc9JSJ4kt3Euas9dr/IU4sC/Mh2?=
 =?us-ascii?Q?PW7dQE4YLb83M4ORB623+ffnunkSrWIhb1wJ1GVPHDFzPMgxMDwf4gxUSRJf?=
 =?us-ascii?Q?mQ5W4idz6TCcV7VgRyNaKffiEY3v4uMFgD3BNrrPUQLEFU/qMo/G6W3iZLyG?=
 =?us-ascii?Q?vuXA1FE+PyvKnOwZv0sjg78FI44bbFyFwI18wlHS9pnpYFJk9fyLMSZVNXN7?=
 =?us-ascii?Q?4Ytww/N/RxRzeFS1G8oXgizHrI+wufBycm94OfJx7qiblK1ZhCmn3y6R6w9u?=
 =?us-ascii?Q?g0Ep7W6nMnskrMKvpmPVhs+54H/EBFP/jutByx/+Qf/n2uP4ZmC0a2kfaLbE?=
 =?us-ascii?Q?rIvJGdrhF9hFw+ssAJI2ipdq6OXnaB8w2OvpblhJfqGjefGcz2c1JPsdGPV0?=
 =?us-ascii?Q?A1HYQgaQd44Sfsy9RZBUeD8y/xQ1rNziUb9de0h+LNz60+T0X/HPTBOBF4Wk?=
 =?us-ascii?Q?y2KSaDxwkE8LxN/TmfFysHfzMzkGbJ3pnf9mcIVa7iNP/DjYHblp14jGp0/w?=
 =?us-ascii?Q?x/WacApGyEkuF05/F6KN11J5V6Llbphs/X5b/feWWQT4tq/bG1etNSM2Z2qX?=
 =?us-ascii?Q?7MJxY91mS3oBmUVlHMke6ij+7W+8VYrsedgP43VYrwRP/upsN67rNS9h+Hi4?=
 =?us-ascii?Q?YNhOv7uV6xtqluSWLzePKywGN2EzMMsfB3ad8Xprd12scy9SVQP7Tn2zz4RO?=
 =?us-ascii?Q?74SD0XdcvEiHKAeuZQ9MBSnTpjOr0Kbdedz+2fdyiiYskbnGNOk3BS5ixLkw?=
 =?us-ascii?Q?qZewVroLXptTCTaowabm7e4Hd4NHOhsfOBUmnJAesy6pf4MQVxJJES7Eybzp?=
 =?us-ascii?Q?7XkbnHzTBU4bJwiPLKFzsIdJzfo0/XIiJ0PBJDItg7weKG8JVLXaxcTJvuOc?=
 =?us-ascii?Q?c//P6dGZQDhrWqi1uFGcw1N2jIq6LdM0IPVYR/baIpw5+5v+idkE62AJHIsL?=
 =?us-ascii?Q?y7bVYB8DTMuaaF/hAj0FqJdMlxlq3J1nV9WXTrhPIQByYuYBiSz1/48elv+E?=
 =?us-ascii?Q?zs7DPU2mg0TPB5sHbrNJExE1o1ja/BgKAuirYi75spyCDvgraeZuaiD+Ag2q?=
 =?us-ascii?Q?JW1lkzMpNBh1F4bEqBV4OdbbRoxvqxGIMVyrdemQiQtl+u2eJkq2FkfCJvBQ?=
 =?us-ascii?Q?bga9hcdQ0xYEE1+GzkVBeWN8wnMfo6FAiRZgmEMYlPbDNK8WBmnXv4+uMOa4?=
 =?us-ascii?Q?VNgWoNeIu1xPWv1QMC9lM5LmQqiuEW+seHgO1nMDnEZimXJJlYnpxRJiNKLw?=
 =?us-ascii?Q?UkvhkYTvVNhwMjFwVILdgsX4YK5h1frqPlxtDlTVN8SRpJgvifN9lo34wzQ6?=
 =?us-ascii?Q?OZAEz7/AFGtXrbU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(7416014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1r6aTsZuYEttqplQmDPHNfk6vNPwC3WlYQcdA/WxmRRjbrZWi7hBpJGwxP0Z?=
 =?us-ascii?Q?IGFC22bCqmRueCrJ/vJ7SvtPXLLVbz/cxc7icnvajGqx2HKYSm56UhdKscUH?=
 =?us-ascii?Q?IMIpCYC4Jiny/Ln9gODYQ0Y2hm2IDjcZJWuZU/j7r2SrQ9LR8ulpTSvRkGq5?=
 =?us-ascii?Q?5wUutlIRrbzmyqsV9mVGaH3QfwjtM/7cUXQK/ysj3cAByZ2RYJs92hVAVxSh?=
 =?us-ascii?Q?bBamy94dyD/UuoB2wwU+OifFvkSxo3tjJ4504aU847XuCu7GBd1kXbXu6Dvq?=
 =?us-ascii?Q?VnNASmCOsiEstpVqTPcMi0EpKtvgRuGR9gP+Onx73bLA56h1FGvHgJ8W6s/u?=
 =?us-ascii?Q?2fv7PYOGWuUBk380b0dQLNvGbIlJa5yWs/9V/7oKa1aBMon2jVRlSUnfXyPD?=
 =?us-ascii?Q?3xMtt9FpvX6ntNCezMaN2hV9C0ORu6isw1PcvE20k8VxmVsqcvjhCcsRW0XL?=
 =?us-ascii?Q?IJUNDy21VlN0UTFGhfpshxvAg71s7iPfgg1/3T0Y3xFsRN05BcdqllAZY5wi?=
 =?us-ascii?Q?858FKrbsP6XC7822AwSuVvPS9YQeJdvLJCeNqzL6csROKe2zmZpHRl7T8epB?=
 =?us-ascii?Q?MlwSw6zLrr93cbYA558PoJFNAZvWjelIfLn/K/sJryh4fbfrU3SB/qnxySIq?=
 =?us-ascii?Q?WYlNlHV6cWBe2cueeGfVNjXoEIq1+rPQr3gpgaI24DfOCgLS9ZeUjJ2d/TAv?=
 =?us-ascii?Q?5EONKAAc1VWEG3sXYOhdXdiA5pRKHltaWgUYL6Gr2NNHJerTn5DXvGbVeJVv?=
 =?us-ascii?Q?TFP21kIizm4Fi+bUEx56hB4nJBwU0yWTUebFmDaFySwyutU9Oiqh8uapDPn2?=
 =?us-ascii?Q?OByWhmwY1fO5XHs9CeJgyWp7fdrM3ocLxD4+gcF6+/us4evQta2JdI4TuM5m?=
 =?us-ascii?Q?2F3DZ15bGqsbtgH3MoXX9Bln2c9eLnEHwZdceUFpUPshBQ1tkzUH+cz5dqNP?=
 =?us-ascii?Q?dYi8dL7yczmgw5461pXSAjPWimQ5QMxlFonFdz8kGD5hR86DORMNxKSab1J1?=
 =?us-ascii?Q?D/CtiP1Gu7vKhZHwqAkVaXFORPSashl1Uh9NmAYuzpqhL7gBFvNZh1elVC82?=
 =?us-ascii?Q?G8xtEghaGsDyHLegW7t+I7f/Z63X9bZtlk48w4c8f1u7qrh2W7aYDxZmVr9S?=
 =?us-ascii?Q?vcJr998ys7USKO8WrDxAT836Sykoh7R1c8wmVQ1gcIY0hYMYw79wXAyiDYUV?=
 =?us-ascii?Q?gOHf1gGKZQqkzzo6XEYYWunO8AeuONyisC0qbKJEhDNX3nTaYTbasQd/tog2?=
 =?us-ascii?Q?JwhRBFflFbR1qAsUP+OdGfmJkEg2uLzz8lfth1wZibLcqYZEqad4eI0ZWV6L?=
 =?us-ascii?Q?CpE4J+N3Aop/m6c7CJZ2blx1QFZaKeYxoUDRavTSk3g8WPKtaPeYXEIz7A0X?=
 =?us-ascii?Q?lKLVcTo61csMsI5bsBkOXWUMWuANg7O0D+frgT3GrZvt1twtaX7V61MUUx4g?=
 =?us-ascii?Q?IpRuqCSFian9E9hWieX2dJKUmkQDbiQg2eoMGCiBXa0sX2dVSPhWwK0jRYY5?=
 =?us-ascii?Q?6pPblRKaZxxpUlfR/fuw9fOQZH/Qcc9S6muHTb0zWgR5ORJpVIM7TfMJRJui?=
 =?us-ascii?Q?u8E5v6OSmW8bJF6+k/1k3uWyDqHm+YbgYjzOTyCTFSVBvYwNfYPTgROkewXT?=
 =?us-ascii?Q?6Q=3D=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fce591c9-647c-40d3-265b-08dd7b3be8ba
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 10:05:39.5962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2CngNZ9BOjAROe20EMFkGzgtlk9zGN50/KYncLaOHausC6p5y4j1VrZCkNxNvVNaeGHxs/dX9i73O1Gj7OMZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR04MB9268
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

4K30(3840x2160 30Hz) timing pixel clock around 297M, for 24bits RGB
pixel data format, total transport bandwidth need 297M*24(at least
7.2Gbps) more than anx7625 mipi rx lane bandwidth(maximum 6Gbps,
4lanes, each lane 1.5Gbps). Without DSC function, anx7625 cannot
receive 4K30 video timing.

When display pixel clock exceed 250M, driver will enable DSC feature,
and the compression ratio is 3:1, eg: 4K30's pixel clock around 297M,
bandwidth 7.2G will be compressed to 7.2G/3 = 2.4G. Then anx7625
can receive 4K30 video timing and do decompress, then package video
data and send to sink device through DP link.

Anx7625 will check DSI host capability to make sure whether it support
compression feature, if not, anx7625 driver will limit maximum pixel
clock to 250M.

Note:
Anx7625 is bridge IC, sink monitor only receive normal DP signal from
anx7625, sink device didn't know DSC information between SOC and anx7625

v2:
1. Remove dsc_en flag

v3:
1. Split timing refactoring code to a individual patch.
2. Add drm_dsi_host compression_supported flag check. If DSI host not
   supported compression, anx7625 bridge driver will limit maximum
   pixel clock to 250M.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 191 ++++++++++++++++++++--
 drivers/gpu/drm/bridge/analogix/anx7625.h |  26 +++
 2 files changed, 203 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 8928971558d2..fe8ccd6bad96 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/pm_runtime.h>
@@ -22,6 +23,7 @@
 
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_dsc_helper.h>
 #include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -476,9 +478,14 @@ static int anx7625_set_k_value(struct anx7625_data *ctx)
 				 MIPI_DIGITAL_ADJ_1, 0x3D);
 }
 
-static bool anx7625_dsc_check(struct anx7625_data *ctx)
+static bool anx7625_dsc_check(struct anx7625_data *ctx, int pixelclock)
 {
-	if (ctx->dt.pixelclock.min > DSC_PIXEL_CLOCK)
+	struct mipi_dsi_host *host = ctx->host;
+
+	if (!host)
+		return false;
+
+	if (host->compression_supported && pixelclock > DSC_PIXEL_CLOCK)
 		return true;
 
 	return false;
@@ -491,7 +498,7 @@ static inline int anx7625_h_timing_reg_write(struct anx7625_data *ctx,
 {
 	int ret;
 
-	if (dsc_check && anx7625_dsc_check(ctx))
+	if (dsc_check && anx7625_dsc_check(ctx, ctx->dt.pixelclock.min))
 		val = dsc_div(val);
 
 	ret = anx7625_reg_write(ctx, client, reg_addr, val);
@@ -551,6 +558,79 @@ static int anx7625_v_timing_write(struct anx7625_data *ctx,
 	return ret;
 }
 
+static int anx7625_set_dsc_params(struct anx7625_data *ctx)
+{
+	int ret, i;
+	u16 htotal, vtotal;
+
+	/* Video Horizontal timing */
+	ret = anx7625_h_timing_write(ctx, ctx->i2c.tx_p2_client, false);
+
+	/* Video Vertical timing */
+	ret |= anx7625_v_timing_write(ctx, ctx->i2c.tx_p2_client);
+
+	/* Vtotal */
+	vtotal = ctx->dt.vactive.min + ctx->dt.vfront_porch.min +
+		 ctx->dt.vback_porch.min + ctx->dt.vsync_len.min;
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTAL_LINES_L,
+				 vtotal);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTAL_LINES_H,
+				 vtotal >> 8);
+	/* Htotal */
+	htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
+			 ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, TOTAL_PIXEL_L_7E,
+				 htotal);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, TOTAL_PIXEL_H_7E,
+				 htotal >> 8);
+	/* Hactive */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 ACTIVE_PIXEL_L_7E, ctx->dt.hactive.min);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 ACTIVE_PIXEL_H_7E, ctx->dt.hactive.min >> 8);
+	/* HFP */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 HORIZON_FRONT_PORCH_L_7E,
+				 ctx->dt.hfront_porch.min);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 HORIZON_FRONT_PORCH_H_7E,
+				 ctx->dt.hfront_porch.min >> 8);
+	/* HWS */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 HORIZON_SYNC_WIDTH_L_7E,
+				 ctx->dt.hsync_len.min);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 HORIZON_SYNC_WIDTH_H_7E,
+				 ctx->dt.hsync_len.min >> 8);
+	/* HBP */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 HORIZON_BACK_PORCH_L_7E,
+				 ctx->dt.hback_porch.min);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 HORIZON_BACK_PORCH_H_7E,
+				 ctx->dt.hback_porch.min >> 8);
+
+	/* Config DSC decoder internal blank timing for decoder to start */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
+				 H_BLANK_L,
+				 dsc_div(htotal - ctx->dt.hactive.min));
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
+				 H_BLANK_H,
+				 dsc_div(htotal - ctx->dt.hactive.min) >> 8);
+
+	/* Compress ratio  RATIO bit[7:6] */
+	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client, R_I2C_1, 0x3F);
+	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client, R_I2C_1,
+				(5 - DSC_COMPRESS_RATIO) << 6);
+	/*PPS table*/
+	for (i = 0; i < PPS_SIZE; i += PPS_BLOCK_SIZE)
+		ret |= anx7625_reg_block_write(ctx, ctx->i2c.rx_p2_client,
+					       R_PPS_REG_0 + i, PPS_BLOCK_SIZE,
+					       &ctx->pps_table[i]);
+
+	return ret;
+}
+
 static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
 {
 	struct device *dev = ctx->dev;
@@ -697,13 +777,20 @@ static int anx7625_api_dsi_config(struct anx7625_data *ctx)
 static int anx7625_dsi_config(struct anx7625_data *ctx)
 {
 	struct device *dev = ctx->dev;
-	int ret;
+	int ret = 0;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "config dsi.\n");
 
-	/* DSC disable */
-	ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
-				R_DSC_CTRL_0, ~DSC_EN);
+	if (anx7625_dsc_check(ctx, ctx->dt.pixelclock.min)) {
+		ret = anx7625_set_dsc_params(ctx);
+		/* DSC enable */
+		ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
+					R_DSC_CTRL_0, DSC_EN);
+	} else {
+		/* DSC disable */
+		ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
+					R_DSC_CTRL_0, ~DSC_EN);
+	}
 
 	ret |= anx7625_api_dsi_config(ctx);
 
@@ -2121,6 +2208,8 @@ static int anx7625_setup_dsi_device(struct anx7625_data *ctx)
 		MIPI_DSI_MODE_VIDEO_HSE	|
 		MIPI_DSI_HS_PKT_END_ALIGNED;
 
+	dsi->host = host;
+	dsi->dsc = &ctx->dsc;
 	ctx->dsi = dsi;
 
 	return 0;
@@ -2224,21 +2313,79 @@ anx7625_bridge_mode_valid(struct drm_bridge *bridge,
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	struct device *dev = ctx->dev;
+	int maximum_pixelclock = SUPPORT_PIXEL_CLOCK;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm mode checking\n");
+	if (!ctx->host->compression_supported) {
+		DRM_DEV_DEBUG_DRIVER(dev, "host not support DSC");
+		maximum_pixelclock = DSC_PIXEL_CLOCK;
+	}
 
-	/* Max 1200p at 5.4 Ghz, one lane, pixel clock 300M */
-	if (mode->clock > SUPPORT_PIXEL_CLOCK) {
+	if (mode->clock > maximum_pixelclock) {
 		DRM_DEV_DEBUG_DRIVER(dev,
 				     "drm mode invalid, pixelclock too high.\n");
 		return MODE_CLOCK_HIGH;
 	}
 
+	if (mode->clock < SUPPORT_MIN_PIXEL_CLOCK)
+		return MODE_CLOCK_LOW;
+
+	/*
+	 * If hdisplay cannot be divided by DSC compress ratio, then display
+	 * will have overlap/shift issue
+	 */
+	if (mode->clock > DSC_PIXEL_CLOCK &&
+	    (mode->hdisplay % DSC_COMPRESS_RATIO != 0))
+		return MODE_CLOCK_HIGH;
+
 	DRM_DEV_DEBUG_DRIVER(dev, "drm mode valid.\n");
 
 	return MODE_OK;
 }
 
+static void anx7625_dsc_enable(struct anx7625_data *ctx, bool en)
+{
+	int ret;
+	struct device *dev = ctx->dev;
+
+	if (en) {
+		ctx->dsc.dsc_version_major = 1;
+		ctx->dsc.dsc_version_minor = 1;
+		ctx->dsc.slice_height = 8;
+		ctx->dsc.slice_width = ctx->dt.hactive.min / DSC_SLICE_NUM;
+		ctx->dsc.slice_count = DSC_SLICE_NUM;
+		ctx->dsc.bits_per_component = 8;
+		ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
+		ctx->dsc.block_pred_enable = true;
+		ctx->dsc.native_420 = false;
+		ctx->dsc.native_422 = false;
+		ctx->dsc.simple_422 = false;
+		ctx->dsc.vbr_enable = false;
+		ctx->dsc.convert_rgb = 1;
+
+		drm_dsc_set_rc_buf_thresh(&ctx->dsc);
+		drm_dsc_set_const_params(&ctx->dsc);
+
+		ctx->dsc.initial_scale_value = drm_dsc_initial_scale_value(&ctx->dsc);
+		ctx->dsc.line_buf_depth = ctx->dsc.bits_per_component + 1;
+		ret = drm_dsc_setup_rc_params(&ctx->dsc, DRM_DSC_1_2_444);
+		if (ret < 0)
+			dev_warn(dev, "drm_dsc_setup_rc_params ret %d\n", ret);
+
+		ret = drm_dsc_compute_rc_parameters(&ctx->dsc);
+		if (ret)
+			dev_warn(dev, "drm dsc compute rc parameters failed ret %d\n", ret);
+
+		drm_dsc_pps_payload_pack((struct drm_dsc_picture_parameter_set *)&ctx->pps_table,
+					 &ctx->dsc);
+		dev_dbg(dev, "anx7625 enable dsc\n");
+	} else {
+		ctx->dsc.dsc_version_major = 0;
+		ctx->dsc.dsc_version_minor = 0;
+		dev_dbg(dev, "anx7625 disable dsc\n");
+	}
+}
+
 static void anx7625_bridge_mode_set(struct drm_bridge *bridge,
 				    const struct drm_display_mode *old_mode,
 				    const struct drm_display_mode *mode)
@@ -2283,6 +2430,8 @@ static void anx7625_bridge_mode_set(struct drm_bridge *bridge,
 	DRM_DEV_DEBUG_DRIVER(dev, "vsync_end(%d),vtotal(%d).\n",
 			     mode->vsync_end,
 			     mode->vtotal);
+
+	anx7625_dsc_enable(ctx, anx7625_dsc_check(ctx, ctx->dt.pixelclock.min));
 }
 
 static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
@@ -2297,10 +2446,6 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
 
-	/* No need fixup for external monitor */
-	if (!ctx->pdata.panel_bridge)
-		return true;
-
 	hsync = mode->hsync_end - mode->hsync_start;
 	hfp = mode->hsync_start - mode->hdisplay;
 	hbp = mode->htotal - mode->hsync_end;
@@ -2311,12 +2456,24 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 			     hsync, hfp, hbp, adj->clock);
 	DRM_DEV_DEBUG_DRIVER(dev, "hsync_start(%d), hsync_end(%d), htot(%d)\n",
 			     adj->hsync_start, adj->hsync_end, adj->htotal);
-
 	adj_hfp = hfp;
 	adj_hsync = hsync;
 	adj_hbp = hbp;
 	adj_hblanking = hblanking;
 
+	if (anx7625_dsc_check(ctx, mode->clock)) {
+		adj_hsync = DSC_HSYNC_LEN;
+		adj_hfp = DSC_HFP_LEN;
+		adj_hbp = DSC_HBP_LEN;
+		vref = (u32)div_u64((u64)adj->clock * 1000 * 1000,
+				    adj->htotal * adj->vtotal);
+		goto calculate_timing;
+	}
+
+	/* No need fixup for external monitor */
+	if (!ctx->pdata.panel_bridge)
+		return true;
+
 	/* HFP needs to be even */
 	if (hfp & 0x1) {
 		adj_hfp += 1;
@@ -2388,6 +2545,8 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 			adj_hfp -= delta_adj;
 	}
 
+calculate_timing:
+
 	DRM_DEV_DEBUG_DRIVER(dev, "after mode fixup\n");
 	DRM_DEV_DEBUG_DRIVER(dev, "hsync(%d), hfp(%d), hbp(%d), clock(%d)\n",
 			     adj_hsync, adj_hfp, adj_hbp, adj->clock);
@@ -2396,6 +2555,10 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 	adj->hsync_start = adj->hdisplay + adj_hfp;
 	adj->hsync_end = adj->hsync_start + adj_hsync;
 	adj->htotal = adj->hsync_end + adj_hbp;
+	if (anx7625_dsc_check(ctx, mode->clock))
+		adj->clock = (u32)div_u64((u64)vref * adj->htotal * adj->vtotal,
+					  1000 * 1000);
+
 	DRM_DEV_DEBUG_DRIVER(dev, "hsync_start(%d), hsync_end(%d), htot(%d)\n",
 			     adj->hsync_start, adj->hsync_end, adj->htotal);
 
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index df9efecae55a..e0953864062a 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -149,6 +149,8 @@
 #define HFP_HBP_DEF		((HBLANKING_MIN - SYNC_LEN_DEF) / 2)
 #define VIDEO_CONTROL_0	0x08
 
+#define  TOTAL_LINES_L          0x12
+#define  TOTAL_LINES_H          0x13
 #define  ACTIVE_LINES_L         0x14
 #define  ACTIVE_LINES_H         0x15  /* Bit[7:6] are reserved */
 #define  VERTICAL_FRONT_PORCH   0x16
@@ -168,7 +170,27 @@
 
 #define  DSC_COMPRESS_RATIO           3
 #define  dsc_div(X)                   ((X) / DSC_COMPRESS_RATIO)
+#define  DSC_SLICE_NUM                2
 #define  DSC_PIXEL_CLOCK              250000
+#define  DSC_HSYNC_LEN                90
+#define  DSC_HFP_LEN                  177
+#define  DSC_HBP_LEN                  297
+
+#define  TOTAL_PIXEL_L_7E             0x50
+#define  TOTAL_PIXEL_H_7E             0x51  /* bit[7:6] are reserved */
+#define  ACTIVE_PIXEL_L_7E            0x52
+#define  ACTIVE_PIXEL_H_7E            0x53  /* bit[7:6] are reserved */
+#define  HORIZON_FRONT_PORCH_L_7E     0x54
+#define  HORIZON_FRONT_PORCH_H_7E     0x55
+#define  HORIZON_SYNC_WIDTH_L_7E      0x56
+#define  HORIZON_SYNC_WIDTH_H_7E      0x57
+#define  HORIZON_BACK_PORCH_L_7E      0x58
+#define  HORIZON_BACK_PORCH_H_7E      0x59
+
+#define  PPS_SIZE                     128
+#define  PPS_BLOCK_SIZE               32
+#define  R_PPS_REG_0                  0x80
+#define  R_I2C_1                      0x81
 
 /******** END of I2C Address 0x72 *********/
 
@@ -419,6 +441,7 @@ enum audio_wd_len {
 #define MAX_EDID_BLOCK	3
 #define EDID_TRY_CNT	3
 #define SUPPORT_PIXEL_CLOCK	300000
+#define SUPPORT_MIN_PIXEL_CLOCK	38000
 
 /***************** Display End *****************/
 
@@ -482,7 +505,10 @@ struct anx7625_data {
 	u8 bridge_attached;
 	struct drm_connector *connector;
 	struct mipi_dsi_device *dsi;
+	struct mipi_dsi_host *host;
 	struct drm_dp_aux aux;
+	struct drm_dsc_config dsc;
+	char pps_table[PPS_SIZE];
 };
 
 #endif  /* __ANX7625_H__ */
-- 
2.25.1

