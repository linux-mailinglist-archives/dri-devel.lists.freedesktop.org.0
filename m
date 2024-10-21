Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA909A5AAF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 08:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0B110E40F;
	Mon, 21 Oct 2024 06:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hXnAFvw4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012036.outbound.protection.outlook.com [52.101.66.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0829610E40F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:46:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YW+9if5ld0SEC7gVSKl1J21Rwvfn7SNPPZfDjGg0YiCIA8nTHGVSgJGZituvWv3dx8BQyQKT95NmaqM2jz1UsSV4VC8AlnfT10x1bxrO/551lulFpfRwo86xAxB/m/2X/db8lKR44LveP2OMjscJw/pUOn2soAXhjZhxaDNC5O3yWzoyfuLIpDhy8Cs5MLy8CCxPkzc2GF22MmFNEd6Cxup+xSEZ088lGuUoDshtpAX10Qy4y48LA2P+OlPTlS/nQux1/+VHSyY/FQtmduQZLR5PJyq/UFHrfUNZEnQmw/gmHlAfMJUUAHOW7/xzInUd8xFb1yjTwJr+JljcKVvBhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHKR5g0p6TAIkhKLLA0H/3FEJuQUjo4rnI6YjMndRes=;
 b=Q4yYO3PZ42ru7xcKhJ7BvTGn4YbQYcx+8QHw1wd+oLC8Yg2V0tnswSL7B+lr0reObTAGL0UCirU1U3aLm4M7x+hEdquReRB9QJXfVwvkj8lrz8Z79W+F96p0lmpcCi26OQGxk4oTqpeVXpdQpZ5nuIXLoMrP46mMwTN7EEemyO8/tKoBFP6zxuOOWOAKXSjV9U48GWdyZJB8cwSCqvat1NZtYDi45KqIMHLGl0bjvQ+/7gHyIxyQG3QtD2m2ICq9HJM05x2USXZZKqtpsdWNiu+IeEaRc9uFw1znGHPtSA/pNsGkTQL/PDFL9oq8fRsYhXMa0PyIyPJ6F9t2c8hP3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHKR5g0p6TAIkhKLLA0H/3FEJuQUjo4rnI6YjMndRes=;
 b=hXnAFvw4n/sgSUOUMweN8DafWLDWCtST2g13nyc9K0hqchbh39N1o190KNuWQ++TCffyyrc4w5Fy/9M90sClISPgwkgdfzxflqgWYgh3KdOVx9/99VpZ+lCeDDSZO88URagzz/iLrl1ZuCl6VuKltRuk6pHO1V/oYnLWkzA4DqYcSjdpxrOIfH0xOtEpjMZOG9AID1hb5NrZ3+leh87viRyfQT1cPWV6n+dU3aQ8MeUucJp7HBtb/Gv8KHbZ9oIuy9fqD3U8cS42IjNfshIHB1FnYgyQHofA+cU8n1ZgbPK5jkKJUW0Z6h/5QHQ8xndqvoEUn3ketZg4CTWchO7dLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB7374.eurprd04.prod.outlook.com (2603:10a6:800:1ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 06:46:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 06:46:23 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v3 06/15] drm: of: Add
 drm_of_lvds_get_dual_link_pixel_order_sink()
Date: Mon, 21 Oct 2024 14:44:37 +0800
Message-Id: <20241021064446.263619-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021064446.263619-1-victor.liu@nxp.com>
References: <20241021064446.263619-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VE1PR04MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eba65f2-abaa-4e55-3a52-08dcf19c13b6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|7416014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1WD3GpEFgQ5fE8wR3pbRnlae23gWzhVWXlRYSpd8AQXz3YLf68Ru68FXEusm?=
 =?us-ascii?Q?ngncbNNn0uwwhjRopS2AJGq+M6GAzmBpmE3n9i9xJrM53T6iNg2gnzIibEhO?=
 =?us-ascii?Q?zTetCZm8kIKXnja285v8jtmxXXxMD/+pGQ7NOIxPaCYZ2qQzSmLNh1vMsVwY?=
 =?us-ascii?Q?u6HZrd0sXUVAGHRqK99J4b8XdBYrR2vzAMRdDxo/dXXbeEUndD5Sd6M2sz52?=
 =?us-ascii?Q?lQUkWryzha81p4tiHLU2w7b8Nsq22aonsDI1t9ohnYORzpho+qCJiWHZoAx7?=
 =?us-ascii?Q?ug1EceWyD6S8djM5njFLJUxzJh9B17TTpldahaByxa3OXFWaaxFiqLeRqVZ4?=
 =?us-ascii?Q?ZWp5AbbqRqMFufmXw+v/J0iuowA7c8I0AVq6ibMwiD9ff7jkluDXHCcYeYx5?=
 =?us-ascii?Q?6nMnMM8jBYY6iSa3A3FmdvDYUt6ALWf4AYVAyOLU7xf9Z6WiFaUoLIteW2P5?=
 =?us-ascii?Q?HKGMLWvEGD2wj71EOh2fcxpDhmC+VWR+0SfPK8iNcgrIwEJ4CdDmAYQexYfl?=
 =?us-ascii?Q?dZOXYj84NatGXIjOAdGEcGI9tMXoUewVG7SI0HM9UjAHzRjy2shayoYaXlEE?=
 =?us-ascii?Q?BwYHR+zpGaLxrP7hyHKQqh1G1STp/rCSHEpKTCbvV6Ol+7JnANh4dAHac9aS?=
 =?us-ascii?Q?xFB+w5SU+5tQmpcZgDMaBEbPJOPqd8nHSYZre02NfkqjkKAyGHXdFqKAc6Hz?=
 =?us-ascii?Q?feZh7GOdMai9Ho9LAkYPx5BSBERVtPUMtaqCuSgJnJo5qcKR3jt+v29Q3z0T?=
 =?us-ascii?Q?cJyZ6PCrdeGG9XQywxgnkVt/5v7e+S3CeM8LgIFI2flqyihO7vdBIJ0DkChN?=
 =?us-ascii?Q?XYc0WmFXP9NsiogozTlp5e9u/c+06R7H4C5iZIZxV9dtCxtHxi6rD8v89d5I?=
 =?us-ascii?Q?yoBNDJdnL6pAZpR+aTCDYfGsUz+/kD9GYL0la6+lRGsQsM4dYtIbg1MvqoYK?=
 =?us-ascii?Q?M0ExZV7vQ/s6ZthksLLrq6R+ZeQciSadj0nQufXKp0Mz6p+CynJTFLbtDSUI?=
 =?us-ascii?Q?HwxGmoKKNX4QxVOHlTAcrdCwO+h2AZQ33DnQUZvfpN7yI6sH/Laq/zG3hSpd?=
 =?us-ascii?Q?EHxdgrRW4oSAh9H/otdNoRjSgR+7zDNtcvazXQjCsv3ylCJ/Ji6YSzpsw3QN?=
 =?us-ascii?Q?XtYKZjfA1uUX6gzSa4CqFQauOsAkSbShPy3+91Y0L14qg/ZM0QGr6bYw1muU?=
 =?us-ascii?Q?KhnqO8FHhY1zA9Bx/tCNWriHUU0RZiag3j3ot7Tjzyxd6NZ+1Az8AxvkApG/?=
 =?us-ascii?Q?9y5VUXpAri7CqVLzNaH5bGLcpPCix+3WpOOh8nULT656HsEKnakPUFwwVedJ?=
 =?us-ascii?Q?mhYr4OzTWU3AAtNzsKqSoGmp1x0+8iucUTRqcgOJnEBOgLGMFq4brQWDJIgu?=
 =?us-ascii?Q?J4KDQQ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qyLhsoimX1JV1qFeHZsU1Y5H3O8FtiZYjxYC0Z4y7Ks4tC9QhRQsVXkkQK2A?=
 =?us-ascii?Q?355KLmf4pfHtasfjqrMM+bIKTP/EmyjR5LBZdM6Mbt6XuIIAkAalEcNmbCf1?=
 =?us-ascii?Q?8unWF4ISBWaH8VIhuWYuGPvHZ/GzyUzR7K2U2ynIcC8kSl4KSDQWEZH/JBav?=
 =?us-ascii?Q?UdKZlgHYrcDlrk/1uaWWlR5kDyWPcwknWCjXekAB3x+RriB4+m6kGx50geLY?=
 =?us-ascii?Q?/SdILC8aw6IP9v0daAVTiH2w8hWvuIx4eJ54qHUyWxJ1uqqFNc0ySKK7FiRv?=
 =?us-ascii?Q?thul8131+CGsXdsZ2MfdiOmXnYlEWGsXFEowhFB9q2RHY9FFNKg6cf+Eu0B0?=
 =?us-ascii?Q?9wojetsbWUqWEwPeNfXaelbyscDibJcvwc6GE+Y/Knuu5vjIgWq+9Q1OtHAi?=
 =?us-ascii?Q?R/SYRmMcH3pEZQkrcvymWCxCtw0Q9mzDlvMYSeN9xNQuZINVBOiH7AtUccll?=
 =?us-ascii?Q?HsHBIDDL2FRyHYJNP4NfZhgat5mZeuqw1KgnhzpVEaoI3vDGCTuQchCc+YLS?=
 =?us-ascii?Q?K9v8RCNHd7QWLDPR38pp0TgntmZ/120sfB7679ssPKhUsLlOGwclpkoImI1Z?=
 =?us-ascii?Q?/UkGOKkZloecrEo9RU56HnIHjwXJOq7c9tVyR8nzqg6JwNW368vqOJMASNxu?=
 =?us-ascii?Q?4L79pHZVQvJq3nter/OdiC4Th6li4UXL/iw0ZZ7NaXCyPGBYsoRVzqTlobEd?=
 =?us-ascii?Q?V5v5GvyrvoiXm+x4C6rbQPswHLx9PjjyAzVcDSi2m+2cen0yIfakjUw9ebvv?=
 =?us-ascii?Q?d1JIGEHi3IhHraD0N6mqWglNmSlxaX6riElfTIE7RdGSnypBfswznF57APKA?=
 =?us-ascii?Q?9LuEaUGatnOEIuFxtgDwhv5gWIRGXlHLN6HSg43TS4hY2rwmijTIAQSkJJnp?=
 =?us-ascii?Q?VPior9ylBcm/WsZyY4qgPD+IFxdRR/N9uLr0MCzqgnyXiny+tSciPQwcGgPJ?=
 =?us-ascii?Q?5cPXsW4EIV3D9Ra/mfxfjb4zjJLWvg/V+DA8gtxz2aUDfOn6TyltAs7z8D9k?=
 =?us-ascii?Q?RKsIMpJkSxivjzuVHlgaCT98I4ChMLNuZx+N7YMmjhvk7lAFeycSRgMqt7iI?=
 =?us-ascii?Q?/X6xuFZZmP6sPdkf7bd5C2hR4EFq00AnTUvDQzORluNLX8KgvLMpP1y0rVnx?=
 =?us-ascii?Q?TU/36b3wQf925BuCVTYgu/gCNrPxWzy7z/U7YZWFFzkBuXqbqW3NxgMzLTtn?=
 =?us-ascii?Q?es2lSP4tCJbVNeDVQBsYWX6BopzuOhEDr3VQF4BWt+Sa0eEEuqlZBZlaNm3h?=
 =?us-ascii?Q?KR7AscOqJ1ruX/6yv4L2CxS2HQspM8JelcVgohRlA8bqQ1FmPVxTfhuhcsvr?=
 =?us-ascii?Q?03K1MiKH/7LpLCxqCg3URpTzyvMk0cPtyVdD7Am4QxbZVeE4wgA5flxVyoXk?=
 =?us-ascii?Q?5xqK9e7VoeuxyjcVzPMl1WyRftwWZkA9cLCe+FUdFs4svAC/ZdfhCfU/hAkZ?=
 =?us-ascii?Q?qAwoekzOtGhnNrtDOfiAa9TF0d89NCuY8IQt73AwFyOZuD4PUyQzG7HiBtAw?=
 =?us-ascii?Q?+XsJb8JzZZGHmLZarhzwyCKAY54RposX3PjWtTTEECoBP7U+s5lv922fIxLu?=
 =?us-ascii?Q?Acuoe9nGaSB2dn3UBA1B7wctU5dG3zsJSCGhYUT1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eba65f2-abaa-4e55-3a52-08dcf19c13b6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 06:46:22.9847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqRBn44RmuvvTSZlHH7W0ZB3+fEhY0TE9SqtMg2qqePK5qDFcRrVhh+bkg2DetsucQmfUg+PYUFW0i1MyKwFnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7374
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

drm_of_lvds_get_dual_link_pixel_order() gets LVDS dual-link source pixel
order.  Similar to it, add it's counterpart function
drm_of_lvds_get_dual_link_pixel_order_sink() to get LVDS dual-link sink
pixel order.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
* New patch.  (Dmitry)

 drivers/gpu/drm/drm_of.c | 76 ++++++++++++++++++++++++++++++++++------
 include/drm/drm_of.h     |  9 +++++
 2 files changed, 74 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 89863a35c731..5c2abc9eca9c 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -341,8 +341,23 @@ static int drm_of_lvds_get_remote_pixels_type(
 	return pixels_type;
 }
 
+static int __drm_of_lvds_get_dual_link_pixel_order(int p1_pt, int p2_pt)
+{
+	/*
+	 * A valid dual-lVDS bus is found when one port is marked with
+	 * "dual-lvds-even-pixels", and the other port is marked with
+	 * "dual-lvds-odd-pixels", bail out if the markers are not right.
+	 */
+	if (p1_pt + p2_pt != DRM_OF_LVDS_EVEN + DRM_OF_LVDS_ODD)
+		return -EINVAL;
+
+	return p1_pt == DRM_OF_LVDS_EVEN ?
+		DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS :
+		DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
+}
+
 /**
- * drm_of_lvds_get_dual_link_pixel_order - Get LVDS dual-link pixel order
+ * drm_of_lvds_get_dual_link_pixel_order - Get LVDS dual-link source pixel order
  * @port1: First DT port node of the Dual-link LVDS source
  * @port2: Second DT port node of the Dual-link LVDS source
  *
@@ -387,19 +402,58 @@ int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 	if (remote_p2_pt < 0)
 		return remote_p2_pt;
 
-	/*
-	 * A valid dual-lVDS bus is found when one remote port is marked with
-	 * "dual-lvds-even-pixels", and the other remote port is marked with
-	 * "dual-lvds-odd-pixels", bail out if the markers are not right.
-	 */
-	if (remote_p1_pt + remote_p2_pt != DRM_OF_LVDS_EVEN + DRM_OF_LVDS_ODD)
+	return __drm_of_lvds_get_dual_link_pixel_order(remote_p1_pt, remote_p2_pt);
+}
+EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_pixel_order);
+
+/**
+ * drm_of_lvds_get_dual_link_pixel_order_sink - Get LVDS dual-link sink pixel order
+ * @port1: First DT port node of the Dual-link LVDS sink
+ * @port2: Second DT port node of the Dual-link LVDS sink
+ *
+ * An LVDS dual-link connection is made of two links, with even pixels
+ * transitting on one link, and odd pixels on the other link. This function
+ * returns, for two ports of an LVDS dual-link sink, which port shall transmit
+ * the even and odd pixels, based on the requirements of the sink.
+ *
+ * The pixel order is determined from the dual-lvds-even-pixels and
+ * dual-lvds-odd-pixels properties in the sink's DT port nodes. If those
+ * properties are not present, or if their usage is not valid, this function
+ * returns -EINVAL.
+ *
+ * If either port is not connected, this function returns -EPIPE.
+ *
+ * @port1 and @port2 are typically DT sibling nodes, but may have different
+ * parents when, for instance, two separate LVDS decoders receive the even and
+ * odd pixels.
+ *
+ * Return:
+ * * DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS - @port1 receives even pixels and @port2
+ *   receives odd pixels
+ * * DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS - @port1 receives odd pixels and @port2
+ *   receives even pixels
+ * * -EINVAL - @port1 or @port2 are NULL
+ * * -EPIPE - when @port1 or @port2 are not connected
+ */
+int drm_of_lvds_get_dual_link_pixel_order_sink(struct device_node *port1,
+					       struct device_node *port2)
+{
+	int sink_p1_pt, sink_p2_pt;
+
+	if (!port1 || !port2)
 		return -EINVAL;
 
-	return remote_p1_pt == DRM_OF_LVDS_EVEN ?
-		DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS :
-		DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
+	sink_p1_pt = drm_of_lvds_get_port_pixels_type(port1);
+	if (!sink_p1_pt)
+		return -EPIPE;
+
+	sink_p2_pt = drm_of_lvds_get_port_pixels_type(port2);
+	if (!sink_p2_pt)
+		return -EPIPE;
+
+	return __drm_of_lvds_get_dual_link_pixel_order(sink_p1_pt, sink_p2_pt);
 }
-EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_pixel_order);
+EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_pixel_order_sink);
 
 /**
  * drm_of_lvds_get_data_mapping - Get LVDS data mapping
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 02d1cdd7f798..7f0256dae3f1 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -52,6 +52,8 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				struct drm_bridge **bridge);
 int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 					  const struct device_node *port2);
+int drm_of_lvds_get_dual_link_pixel_order_sink(struct device_node *port1,
+					       struct device_node *port2);
 int drm_of_lvds_get_data_mapping(const struct device_node *port);
 int drm_of_get_data_lanes_count(const struct device_node *endpoint,
 				const unsigned int min, const unsigned int max);
@@ -109,6 +111,13 @@ drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 	return -EINVAL;
 }
 
+static inline int
+drm_of_lvds_get_dual_link_pixel_order_sink(struct device_node *port1,
+					   struct device_node *port2)
+{
+	return -EINVAL;
+}
+
 static inline int
 drm_of_lvds_get_data_mapping(const struct device_node *port)
 {
-- 
2.34.1

