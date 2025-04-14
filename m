Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E408BA87CE1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 12:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A5910E552;
	Mon, 14 Apr 2025 10:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="SL8B8mMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11021081.outbound.protection.outlook.com [52.101.57.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9DA10E54C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 10:05:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7KaGmDu7o7QBx1/KBicDARw1GYQ2xBpSoxf/GFvnZalzZ1H6LmxWO637DytqNDG5TJPyu/YQ5Bbr/m0d0fUyPEzrQbZNfkxL5JfvTS2Oo9l/Lso8imZb0B4nU1t2bqeIVU9umaGjdEONsJcUZknwakQVIDeilvAHfZZCt/dX5tNskb+wxlwhXItD1gOITXWjt3fNv5kWT6Pc+DqAzfA5dUNpRl7aQVxPNXaGS+7PKRBHVfh+ORJp0h8ir55HKfMG/70kFV1F+Z+NZXhk9PjUDcdaOc2kgH3CD8m6xW4/2WEw3GcOFY5t4vkDT4e19XrIKWd5Byn0LrKO+g1e27ZDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWW+4HS8Bq7ek68/sjeROQYphEHzc1tpFcMSoiNnFRU=;
 b=a72E0I1sAjjejBvHhfdrQEmv34kEKU7re3imj/vG/gLDTG5kemCZkj86I4gqidnXPkBG/jfy4zvylejAnxzEv8vRma2lBPBm5qvkMqmBwWfYIAmSbELVYOMScbICivdBQGZWFnhW+La3eEkpXVVI3/FtjkpnpixQsh8o2CStEwg8OIOaNSuOe6ALxfl5/lV4xUI5eNbMXYG+mqaUBWMlhNcmtRxNVmWmq1umQSbXsB8hcOlJ7pDtemviaG2HRrCIJ6+BtE0K3PfRIDF2MvYP800gVgvnZy+7MALsl5IYSfsXarKKz8Y5x/D2unSKv6OCbG0i4Jyig/TL8BBHXJ9YPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWW+4HS8Bq7ek68/sjeROQYphEHzc1tpFcMSoiNnFRU=;
 b=SL8B8mMWH5RO+1aC9EZyDKcAxHX6zFJe/+1vuyFyD9q5bLEUwIVEKaidw01+KMhQAQ0ZXyj6MlXVSsxbQJssWXiPjQecZdE/6ZBZf5MuFC1fZlXv22OxdQYKbN/qhz6KLx63W1Yybi0WP8OEWLJx2CJnGiZnwi6x8HelKL5jKT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by LV8PR04MB9268.namprd04.prod.outlook.com (2603:10b6:408:256::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Mon, 14 Apr
 2025 10:05:30 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 10:05:30 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: bliang@analogixsemi.com, qwen@analogixsemi.com, treapking@chromium.org,
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] drm/mipi-dsi: Add compression supported flag in
 drm_mipi_dsi
Date: Mon, 14 Apr 2025 18:05:01 +0800
Message-Id: <20250414100502.1604717-2-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250414100502.1604717-1-xji@analogixsemi.com>
References: <20250414100502.1604717-1-xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0013.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::18) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR04MB6739:EE_|LV8PR04MB9268:EE_
X-MS-Office365-Filtering-Correlation-Id: 017066d9-3af4-4b04-16bd-08dd7b3be369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b3ir4Be0Oo1pdmikRjXPd66NerGc7065n3LDJhKVLbFXITuINbtd418GJyeQ?=
 =?us-ascii?Q?8hQmQ+OqmYaOYd45DxURW4QtRtpg5DqLqFiIEifNTQYvigpZR/V/tX5kZ5LD?=
 =?us-ascii?Q?ZgJyVqJysuGTGOAil65gK7RPKt8jBfK1sD7Yv5YRMGEF+6Hnrj+DSvG6g7B+?=
 =?us-ascii?Q?5DYLq8/JFs5QTnMccY/2xFhIeQ/QjyNlWv7JyYXhJvoq+MAUjHSsdNXNahA3?=
 =?us-ascii?Q?X/Jv1HT0Ty2kTbOq3JZ3y87/6MDUhLHgXuYPeJd32Bw97fpxRKLGWT06z6RM?=
 =?us-ascii?Q?gejVPpFi5gDc00lVfbB+RZCZ2XtzR4AUOIEXlA4PwkNT/BF6CVbNZ+/Im0O0?=
 =?us-ascii?Q?/seepdZ8a4mjQ2fGhqVaXnKITjPNftc87e1RTx6dGjCz2nXbssc0K/U4s1dQ?=
 =?us-ascii?Q?T5dmnEXVZQNQNW5rT4AR7W23VWFzzXnDtjvk1RRIw0eJAl4x2lQHAqVRpLQh?=
 =?us-ascii?Q?9t2VpSnkwiG4jdtLLZ/eQjArGM9ypKOeZBoPs4vfIQyc8HymTNgbF0qITrWb?=
 =?us-ascii?Q?3N6L2DlbJosIbuusVRZx78LtEMc3al1TUf9rNZgwcxK27OZi3fOihNvI4T3V?=
 =?us-ascii?Q?LunHwoT/4RAN3CyFRXlHGOCb/B2hWEhwUY9duERdwaA/hRtW4VUiwsyODcTF?=
 =?us-ascii?Q?KEn/BYpdis4fftv7dvn9OzwLlzdQMvwADG20VYy8YOra71CLNn+c3n5DDOs6?=
 =?us-ascii?Q?uukhsW/ufk6dmxYSbKb9IXCZhPS0bXWbAbyjtFAbT/zj+eLWzTolUguDCVrU?=
 =?us-ascii?Q?T5slCOsGa+a8j+R6YCRYF3oGRJW9ilpdHEInkYoz0/3K93gmgHwaDQiVU087?=
 =?us-ascii?Q?8IWXFtLHB636gl1fRfMqeyKu55Q2N3psvrr2395G/Zr4/LqUU03aDZ7yCgYn?=
 =?us-ascii?Q?AUddvlFv5seTHZEZFvRx9tjq/3khpN6eLe0x6AStbizFPKVGM9+FCkIakmKU?=
 =?us-ascii?Q?xwVV5lBCQ56yosn8cWvPZuSeoDUNfqqBWgksc+X6l1MPPSp6dL20dqkx917Z?=
 =?us-ascii?Q?L0oXkFxxNyVUUk31bV2OKr1FdTm7+GZguYGNWUTqQSFLa4sZ2laCVJmaenm2?=
 =?us-ascii?Q?/EzdE73oj56s+/scwGYkhbZN8xo6PYyXc6xdXYK3at8knmaaYE6tc2q3ijWT?=
 =?us-ascii?Q?d5HXBkSDfqMZ4XJGzSTjG4qSlBFmFKLCAGpvxvX75mlwgjIb9AScPXR6wxIT?=
 =?us-ascii?Q?CMk93NgLZpuKR/iPP9l58h9ybRy8+aJB83BmOgejxfcsQ5nMKHGoPFqFlehG?=
 =?us-ascii?Q?wrXNXgzCPguJrRHmesEHeLRKOOQzj+tAjQHA7M/0JevsqIxnpRBKCM2y7Ffh?=
 =?us-ascii?Q?IXrcK7Z1AmPfbjc1yRyXL/HQtWIZVbaknL4Ce6Zwh7dXiRmu1jzE0uaLbBOm?=
 =?us-ascii?Q?5BYcWZw0NIPGYsYMvyAQ3xae3GfoZN6gDJtC3rTjHaDnNEKeYy7iCh75szK5?=
 =?us-ascii?Q?O9YdalCuEHMVVz8Ik+EomGPYRAryqPIRvqppVk9pfZUIVSf/HoZT2w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RN/Kn+dAtOn89TvUVHhK0tDxJM0YynWPdxlKCqotEyF5zwVR+5UshD4Bs3YA?=
 =?us-ascii?Q?6zuQ301mwinZt9R0Z+KpYPepB3eKi1FUspLyw0tS92BD5R2tb3ExkdOl66Mb?=
 =?us-ascii?Q?BoLWZhcxV/ciErDRUwrc9UERIKn8xBbW9M9+4NI9HJ7BDg4pvRCZHfhc2kD8?=
 =?us-ascii?Q?IOCn7RHblcYrSYG1UyK7yP9YYAZ75jCBkrM+g9xWCWct1OB30rOFznfhwphW?=
 =?us-ascii?Q?HoEkVBoxXQKwhA29cgTszHVTHTPLt6OZIE8/Vd0cVxOLfqul85tw4BgRwT1V?=
 =?us-ascii?Q?bh5+BD5efN074xZOGXukczunyjq4LU+wbDpxujXm4CVTLs5tVbs8Dd1Vza9Z?=
 =?us-ascii?Q?JZae0XXGMw9w2QiuciEGpH7sl3k3tM50ZRYaNExaInV/aSCwG4N3NAaInzSG?=
 =?us-ascii?Q?Lw0P6yvM+LN6ZSG5aumAJJJmlJRhRk5V9lwRc6hVi+gM1kjcAy+mQLRHWvnJ?=
 =?us-ascii?Q?eczP42qWjZca/Sj7SAbjVvPeQKyzq1a2gJOnSGVxpHlYs0ji2M53d3HC+Bou?=
 =?us-ascii?Q?x0gemxQitNIvtm0odIMhIPfS5pCYCfMgkEb0vjhkO+xYJ2rBGUfQ2kkwaxU4?=
 =?us-ascii?Q?a20JNYYVvjUkdbV6j6lWzRnoQteu3hHBfGZrya0HGDAv1MxO2UX3vf33leJe?=
 =?us-ascii?Q?DLBP2qN8nf+84xvKtwyuIw9YaqJ+DcgsY1nQaUtRv4GqhLzr3iHTR7dYm4A1?=
 =?us-ascii?Q?SJf//2/ZJQ6QjiuZPAQNAjKdAEurJ/rkVzAASMOo0gye+SKxyJSdfXeUCyd8?=
 =?us-ascii?Q?AZ7xelrY3rra3K+h95R8ODvHpEv6EtkQm4Vsn6vGAhwm8Uq4+v/e4+iGf31o?=
 =?us-ascii?Q?PeJFMVaKajSc9HqeAooJM5GxTAWENNIo60/KKG6jBpDuj1BIsR03j2cJQOtm?=
 =?us-ascii?Q?lT3gNlPGKELVUF4kUC4wteINOE58xEN7SlCDStbe7Chft75ff/sbrACLS+1d?=
 =?us-ascii?Q?Ztu55f0869EbraR4JSKTmefIdcFiDkvjjmAXASznn8Z6OlXGleUEvII2PuYq?=
 =?us-ascii?Q?qtI+931Ajlq8eRBRBQXoCOgZCUDFpMQDD0JJPnljVv3Bz3s/WA1QGGz66/7e?=
 =?us-ascii?Q?pcd5otcptAyWW3gmlz29zAe2FnXwvbsaRMP17hSfgDFAdSSrUW7fjvxGohGf?=
 =?us-ascii?Q?bMjKA6w7N9kPtjDGlAGMsu5IXdJshUOVl4oGObWkGZFhKJMkBzrYD+KayrSG?=
 =?us-ascii?Q?paUa/3oDbb3mWLWos4bQjFb62C00L5q90fCP1256ip74hiqzuDE0BEQ4g+bj?=
 =?us-ascii?Q?aeIrDmbQYhOOxIbGK1IuTqYr9Q5S5Z1qhIqt9atGe2Om7OzqSXzCZV4adQyK?=
 =?us-ascii?Q?01vNC4DXM9RnAQ01Oq8ISvENABl8sdQZPE2e6yRCWYghGATW86Jocjvl/8jx?=
 =?us-ascii?Q?81bL5FEsPQkO+0GdqCh06ESauzTrYDoq72VB/UgIP3hVtmvrkElHXykofOLm?=
 =?us-ascii?Q?cdz/HLXxwBv+2mXlI/UYXYLEmkuUhnAgbG5NaskzxKTfiyJlY/0GFpJ9rand?=
 =?us-ascii?Q?xTs9DQX/+kYf9UGKVqFmh2Qrx+BSFi1MKvyR8NGGodoSaObfP8isE5YdZZ1f?=
 =?us-ascii?Q?9lXtwdrhogJ7kU2sBGdtg5u/hAM1psEAmles6dN4USb+FC5l+EVAtFF5ffx+?=
 =?us-ascii?Q?4A=3D=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 017066d9-3af4-4b04-16bd-08dd7b3be369
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 10:05:30.6212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KruITWiQ3F6P3P0iEhqTv0FKrPRizIg+xj2zEeUAcnQ8pdkce5wSrDwA6Mea2abeZKePYhnw3nPNXiULZRvHMA==
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

Add compression_supported flag in struct drm_mipi_dsi to indicate
whether DSI host supported DSC compression feature.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 include/drm/drm_mipi_dsi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index bd40a443385c..c5ffb48182ef 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -99,11 +99,13 @@ struct mipi_dsi_host_ops {
 /**
  * struct mipi_dsi_host - DSI host device
  * @dev: driver model device node for this DSI host
+ * @compression_supported: DSI host support DSC feature
  * @ops: DSI host operations
  * @list: list management
  */
 struct mipi_dsi_host {
 	struct device *dev;
+	bool compression_supported;
 	const struct mipi_dsi_host_ops *ops;
 	struct list_head list;
 };
-- 
2.25.1

