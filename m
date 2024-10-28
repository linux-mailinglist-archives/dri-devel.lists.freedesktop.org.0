Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776279B22D8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 03:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC6910E317;
	Mon, 28 Oct 2024 02:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="d8V+ySEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2078.outbound.protection.outlook.com [40.107.105.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965F510E317
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 02:38:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgXDD2mfJp6LScNLjeTss2uzM3fBHe8k2uGR4rSxIDddrc8m3v97UQ5Rt15FO1ltRkjbdioc6v/aibl9qRlBgWlh0YOSe6QPhG/uskY1g4q4uUIfc78/oBckIbwsX1A62vV0LCYIfq7IwaXnxkc+Ltb8PrupVcPhWW0TcFylLA9eoV+S0RF+XVVCGADBGXz3qvJuqKQiW5ognM9w0zigStUrKUhE2EW2G0S5L5B5R70elGniviuYx67GBE+LpXduaHqNZBZKs5pf2Uq7P0jcrjm+uqsEwym/ITmQH6u8xZWlDFOPa2Nqh0lzEG8vku/x4NpoDD49Gzv0h+a9xJ6HJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6d5NTKq+gipI9Re75HN7DkDjM7Rb0h876R4t0pleRes=;
 b=H1U4aOqJ4OFbbPyxeEFMKE9ticYERdR+qbj/iGhYoVLBmtatfA+fc5sCtOEtq7xRXX0PcuP1Az4R65GdsJEKqqgMlddMwLx2jqG8QOxl39RCfacQSCzvVy21Gk79+Cxf266tIoUovgvQ241GPjgUC3sLRxMEeFE8rCMTfbgrBkIxHkhdZXsl8K+B2aQNYDDggJbg3rGIE/ed387kRbLQ0onTFTrPH7ZASKzOUoyAjkbBb1uniFtLv98UjlOU/b+8a/XILWUBPWUiR/aAa7DAy72nWOCkccswqWtVmBi5tvJX9zT7+UtcSTHGUnnZF0SWNHB6kEHIdZ9/SHLr8mhNUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6d5NTKq+gipI9Re75HN7DkDjM7Rb0h876R4t0pleRes=;
 b=d8V+ySEzkwmg++ZwUK+TBvr7T1P5Ug8lCKt/Q6N+kYm3HL7a2epyl+PyzoI+9ukS0clgefn2g4dBj4eztW1QlpzfOslEa9h+G46Aq/OHk5bvtLS/90Z4O3vR8lXYD3Wvss+9ulzDlVCoXezHNIUpgdNdFudVCYdcvnOWYn97+GYDWEPWlWeyKRbRcfTzLadW0bFBd0BnmtKD6Owgrh7Odc+eLdkccA8n3wVyu5andUZKHaLXR7xQnmvOlTAUC2S3Ulqb76qakQMSw/WL3jGTgN5SpdM+q6VYcnqOH21DfD8raJzd5t/PkoU0UQKfPu6r7Jxjhs4vwfmnY8165WBH/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8709.eurprd04.prod.outlook.com (2603:10a6:10:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 28 Oct
 2024 02:38:39 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 02:38:39 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v4 05/13] drm: of: Get MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,
 SPWG} LVDS data mappings
Date: Mon, 28 Oct 2024 10:37:32 +0800
Message-Id: <20241028023740.19732-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028023740.19732-1-victor.liu@nxp.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f457e3b-b91f-4286-25e2-08dcf6f9a17f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|376014|7416014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7YqO3NdD95Fvsl07lYeeypC4SLYP795XNytrp6OwVayCquULN2TKuG69QWkh?=
 =?us-ascii?Q?qQFbxYVX2JWQgdWkChDvJv8uJ2mJH51JopG+9x+4EQL/IUywraOzH0g2Z0qz?=
 =?us-ascii?Q?Nlrout8lnfDXscmFXZwTVBZeJP8c9O2ncKElH49+IIRF3MAo8T90Kej7CjDm?=
 =?us-ascii?Q?sYUacR/Z8NweETp0evQLcz6W6/NDECKp/6kOjf568FQUCM9Fl9z7uRZsRjwS?=
 =?us-ascii?Q?MM5kK2nu2yyj2ET3B7eCAVofF4d0mcWa9ny0wa2NOMpjCLVaMXel7LmNTkt3?=
 =?us-ascii?Q?f8sutLcAPlf9idbbZc25yhHsf9r1uQWa820it7AsWQNjRfZ7OsRsx3ztt/E5?=
 =?us-ascii?Q?hi0sC6hGyQZ+pML4kwhxo7VkRbk1FEBGCe46WKS2MRpX9BHjAqfNdAMoWG6v?=
 =?us-ascii?Q?gGMjgYlHs6YMV/u9ysXbVeueb/df6KQCpiq0npWyK0fIUWrSajxxv45VBE8m?=
 =?us-ascii?Q?4z+jJxGKsNwTrtAt79w4B5QnTh/AI3dl2AcbNBi9EuZBbV3REMvQvERq7LX+?=
 =?us-ascii?Q?eLlAoptb9YqeDLI19Uh5ffaZ5oLj/boj7BSmzZ4w/KdqkVAjJPrJVWXMVlAe?=
 =?us-ascii?Q?DMMzkrZ809AXxegyM/pZ78LJITBF6yjscZoyB9VPzR5s5LUbvKhO9+U29qj+?=
 =?us-ascii?Q?KzMnS/58/XIfbict7JdPCh6KlTPP3hICuvsbZ3O5wLsqf95YCRAiWq9IzcMp?=
 =?us-ascii?Q?oayoa+lZO7MvywG21wjXnC2oeWysGx0x2dI8NHefeVxNa8dGfOqL+R133BSz?=
 =?us-ascii?Q?QqbQufHTQ+Q9mkBog7EJieWdalKZhzZnNxZkzEuVvo3xj4DbTbWWly/bkYkc?=
 =?us-ascii?Q?6QHXxnD3uz88e2Uwe7+ne9fy04lXN4LPrnTJ3ur+nRBP62LcFmkO9eQN94U9?=
 =?us-ascii?Q?cYXmLaOMG8cbmI7TKpPPYzI4KNph7Iv32EAXur8jniMeWewOvPlV9sj/mwjg?=
 =?us-ascii?Q?iYGPyO2gmHDdyCzjJCrmOvFqBVToBBylmRtGHTbQEOI1yG+Q9a8iNX7ASF3v?=
 =?us-ascii?Q?5MXsFLv1lOF+qlug03pr+FWpCIqTSBvDXeQiSstAwlE/KS7H7RBjrVGOG4If?=
 =?us-ascii?Q?S5iZ/DY7drUc0XeH72OCvChaCS9HEK19NwqReE7gaB25LCF+AyZuH1tr7pc1?=
 =?us-ascii?Q?lFibYpnYR8PtJq56JeiZlcXF2i7jQIrH8VrCqfWtmpPs9NhmbEkQh/FYzqSo?=
 =?us-ascii?Q?MHhbxs7EvsSc85U2oKf1TNVjjh3Pay82iZaQz8P30eJ6sWGiboKe+UrqIvPt?=
 =?us-ascii?Q?KBNxZtHgp+omqI9OLb+t+/DmZ2EB7HMw9mKNy+v6EsbGyTKqU2oa/DNAjcH0?=
 =?us-ascii?Q?2CFv3WhkQfDFbAZxMAQdV6ZA8a1eJirlcf5/+TrzjyjioWYxK68Mfn9qw9IL?=
 =?us-ascii?Q?f9tM/bY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(376014)(7416014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VNFWqoreLKNDPlGFGyWBMnlmbvaps34UErfzuMAe68xj+tU3Hwb9xSmCJkJA?=
 =?us-ascii?Q?Dl09/0qo7ivi9B9LABIUcu5TgykZFr23NHOedNxN6+nqIBNSnnQ1TamZu/XV?=
 =?us-ascii?Q?b2SpmnVPy9FBEEd+vpfWh/isVhILPmwWjRruc/ebdD+JYQmSOJq31xbQ2R8b?=
 =?us-ascii?Q?HMd1wKWbHgx6Saoak758TGbq2wst7iJE39CBWZdzW3r9Tt2qXGDdCQ+Qzleu?=
 =?us-ascii?Q?FoV8xnN0UHPz26M5E1Q6KSaIl/L7vpWS9wIeR3O3e1QmpiyldLgfjcih+sBp?=
 =?us-ascii?Q?sqTo+Ox7bGbmM/nh54NqyGzMybrqBjRkrtUaAr2HFxYy7BHP/1tIagolXyHl?=
 =?us-ascii?Q?VgGWGgKmf24nalnVqn2HGQ4gope3807qEXSMY9ApwrlvtkYlOYmlc8r1NAGu?=
 =?us-ascii?Q?vKXAKiZgjy40Po9NLPxe8Kxal0ODrGGOOKsOWK5xhcB9dIxjppoWngfmCl9a?=
 =?us-ascii?Q?V28Xkc0TBZVyCK4bGDB4lv2/iShJU/f5VBEqPUIr+Q2DCs2JPGsiEEpITLfi?=
 =?us-ascii?Q?8blkwW/1w+V8iT/Vx31ClesaZOnD5+NwB43bAdDuJpEMauwOVJffBk9j3o0M?=
 =?us-ascii?Q?lbFhtW2XEVgm6oWG5a4diRNxnU2Mp68gJO+4aCU089fVmMdi2DQBeZbJwNyz?=
 =?us-ascii?Q?QdfEoO+Yf72ZTwx1pXJ70vQ/mp7MyvMrEOsZlw9z8me2wDfsJr9f2UqPxTHV?=
 =?us-ascii?Q?3aLWLBV9rjbSAWNtpxZNzBDMzS0Rv+ZaSFuML3hXbCitfKTyXRATQfXV4eY/?=
 =?us-ascii?Q?fIAEzIcXckEj8m3D3p8FlueGG9qRvbtw1YeDQdw0QiEPZ0IkRHfR/SyqPBLz?=
 =?us-ascii?Q?iFp+mREYV55Lxf3T5lFUI3a8D8vqQJBT1dIr+CV+LIfwMw9md9hMduElIQdj?=
 =?us-ascii?Q?1lPKRLMqC1x6+/A3uP6uEALj37CbxFMDf7yQEjiw5va629tx4a/YGkbyARDy?=
 =?us-ascii?Q?qrRZEksEBdhbR+y8irWUw6I9qiUQ4KkX9RfaZXVEDbWYEI3vho8GfBmJRAWE?=
 =?us-ascii?Q?WBbxLSk4k9kq6DTFb84A2GZn5jeo5ZlutUay36CYTlzNw3/IXDK9kVVyGHz+?=
 =?us-ascii?Q?Ybri0BtXXqWmTGd8K243pEqriW3aYW68cHvq2sVemDc/lPDHaqy/G5ml0BF4?=
 =?us-ascii?Q?BxvhDgz2EljfvAKbUIWzzZXqaCgFByjdqn5wL6NHjt4AKUeqRPskrRRM9UV7?=
 =?us-ascii?Q?eIzzRMdTfmS//v8xSf8g4CEgKZkcvfd488efLE8WtzcRwMFV71glgPnRHV0k?=
 =?us-ascii?Q?K7Phor73sea1ureAOrTtYp3m6NV1PyF6rTvM5/os7hzvSU0gXws76yr0R1Ni?=
 =?us-ascii?Q?WyRsZ50zm0phzBV+sWAc7cJ8fz9DXq8b1IyU7bIUne++X2SRK5j5ZBA3TP5i?=
 =?us-ascii?Q?0BkLGpkLY3c8BiTkd6ZJneF8+mdVm+qZAqKXcooscqZ5Ra8CEssKbrRhsEBn?=
 =?us-ascii?Q?6cYjq6M1F72QLpKQRSTOKJ/LEhbNpujviC7WZtI60ptIej90s5hi+xsxX/1A?=
 =?us-ascii?Q?EspZF9FYwh9cqSLaP9ejWW61hEiOX5K/sB9ztE+DqDr16/HujfNZZCCbzg3R?=
 =?us-ascii?Q?f/4TCWr0odtjSpwwsJQCdQcd+QjaKBNv3Dsyufh9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f457e3b-b91f-4286-25e2-08dcf6f9a17f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 02:38:39.8318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1VQrqcD8vgoTdIzJ99DQbVfnE/mi/YTZNlyJAHKciMhMEZA8CEz3ZkGcyjRlXvJtWlW8Gaq0t6bQdC7+FzISxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8709
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

Add MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG} support in
drm_of_lvds_get_data_mapping() function implementation so that function
callers may get the two LVDS data mappings.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
v4:
* Collect Dmitry's R-b tag.

v3:
* New patch.

 drivers/gpu/drm/drm_of.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 177b600895d3..89863a35c731 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -410,7 +410,9 @@ EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_pixel_order);
  * Return:
  * * MEDIA_BUS_FMT_RGB666_1X7X3_SPWG - data-mapping is "jeida-18"
  * * MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA - data-mapping is "jeida-24"
+ * * MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA - data-mapping is "jeida-30"
  * * MEDIA_BUS_FMT_RGB888_1X7X4_SPWG - data-mapping is "vesa-24"
+ * * MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG - data-mapping is "vesa-30"
  * * -EINVAL - the "data-mapping" property is unsupported
  * * -ENODEV - the "data-mapping" property is missing
  */
@@ -427,8 +429,12 @@ int drm_of_lvds_get_data_mapping(const struct device_node *port)
 		return MEDIA_BUS_FMT_RGB666_1X7X3_SPWG;
 	if (!strcmp(mapping, "jeida-24"))
 		return MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
+	if (!strcmp(mapping, "jeida-30"))
+		return MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA;
 	if (!strcmp(mapping, "vesa-24"))
 		return MEDIA_BUS_FMT_RGB888_1X7X4_SPWG;
+	if (!strcmp(mapping, "vesa-30"))
+		return MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG;
 
 	return -EINVAL;
 }
-- 
2.34.1

