Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E459A5AAC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 08:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBDD10E40E;
	Mon, 21 Oct 2024 06:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="lqucqYKY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2082.outbound.protection.outlook.com [40.107.247.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD7D10E40E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:46:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VrbfTtYIhxin9Xy/WK+2kJjh9H53avY8eSERqwqpMxDm4GwwIGha3BRSHZwmBC8LOCtkjNsm57rXYZ3ttDT9gmI+TSnvDx5kFgmFnY4sID+YA3xtEhSjD5Crj7fDzc97YyGp3y33+DXdBdo6HfsMQ1iXCr3fCdoh5qwAWfmU/F1zgbmM1qYTkneJl+pA6jdWDNC7cTFFAzp6WrtymLFwXb5dZThu74VIKndiRVT/snZs21JdJTz2FhVUeEQ4NDaontupfge6p+mjlv/ph0j0smJn9Z+HkLPDzTQkeAhduOnBrKfYR0JcolmQL+FBM+sjigtp2jDwsk7tyYbWPHZ0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwJjFbEQ08bHsxmMY3/mtRNTtRaMJCSX40jcwDqeRXc=;
 b=hXVueEMflCyUzzy5S1QuSVqVt5+k53EtmRE3W/+yTkQG2mMyKzHymT0nBEvciGg2eU19BDaA+9cRtkJoPOUplpL2x36LzwAcxxRUpRZOFMbgB/I0k5rwl+3LP+BrneEs/6BBQ+INX/V684r3mL15oyAXalpeapIPin8faR6j7bNj9cYCZNsShdLRtC84Gyi4jKFORZ9KlDHbv7cb9pJbMZpE6EH2jmUGMRQzOtNFtg54G8Y15WvvSJRa34OAgB+DMFYFrz1i/PmbmW5zEPyB2fWLwr1dxSH+cHlqbJbDFU1D8bQYrQhEFYrCHdGDe5HIQCD1A4n6q0cFcH8ECwJQYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwJjFbEQ08bHsxmMY3/mtRNTtRaMJCSX40jcwDqeRXc=;
 b=lqucqYKY0JndSYkVlMYRGGfJEqLls3gYdkEaiFd4HQkayErF/vOAbiTbFdRLEP6MMfj6R9vwARqLWWfkXfCyFhlkP34f2Yr/VaJLN55KRNJdYDd7m4D0oqzhyyMTYCjQOD0R+8P8KKJqOMZyGqf4hVxVTy5YW53Ig+mLS7He4QEbLEJU9T8M3qDPJzoMg1apWYwj+VRZNFPQIEYCU0u9rB3HQVF64cB9Yz9jFNPrKtL0MBg1zsbzECco1V8Owr+YDwe5J87AEGsacVwWrwxaiJ5KT47Hwe8mCkS0fHovsrVUsGXlm8Xvgaqk/53x4vTHKXPmqws1pP0VUdPAQCkUzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Mon, 21 Oct
 2024 06:46:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 06:46:12 +0000
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
Subject: [PATCH v3 05/15] drm: of: Get MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,
 SPWG} LVDS data mappings
Date: Mon, 21 Oct 2024 14:44:36 +0800
Message-Id: <20241021064446.263619-6-victor.liu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: a90540f2-103c-4813-e24e-08dcf19c0d54
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5x2g2EX1muf9hzzNxSg2Cws36FfZqiKAcVbqqshySiIpbzgb9rJVIB9FygfW?=
 =?us-ascii?Q?7dkneGAe5QFXPge0WsV/idQsqa2GgLQE9ud3At8hdDKFAPM/2Jz8I48KRnVh?=
 =?us-ascii?Q?eXrPwCtXfFysjrJreIlrgKZksqjUw7m/W35s0i91WEDA6E4fguaeUb000hEt?=
 =?us-ascii?Q?HgDBDUgjer+sXbjUIaotORhLvNle1c1pUDRY2/NMNDe7sCbTI5zv9bOPsWRp?=
 =?us-ascii?Q?aCDt09XIIfGA8gLADio7sMEgmwjiigWM9hn2Gim7E2A9sxmGZeBdRiipU6bz?=
 =?us-ascii?Q?SFznIfVOdm5IFlebMDC+OUwI/42AfNAP/jqUSd+hQmpV2O0jGYmjbp4amndp?=
 =?us-ascii?Q?0luubjuyXtpQ2v4el9FUeGDt/MJGzZ4wirFY4VsN6JsYz3zDCTQOWNcKS3YR?=
 =?us-ascii?Q?98WJ/YajKlBzf/LL9Ncx/ZtoJ5WTAc1nCAyz6EpSnACGNOH46n00fPMwPtky?=
 =?us-ascii?Q?qB54LnZWRIk4x/jaUpRZn7fUB4N1K/38KWyywl2phm364B8TDsJhxy5oZ9z9?=
 =?us-ascii?Q?Kg+k9EF+1OmUjGYyd9+BOvxLM0TY56oEf9FVAoS0u8Nr2L/91MLvT/4/Cssk?=
 =?us-ascii?Q?aRTmAY7q818udYyXnpgH/lixCrUFthKTf8R+E3MSsb6uBg69xNpZFflV8cvy?=
 =?us-ascii?Q?cmJ8kx8zJ6wFfyETiq5kCtP8OyBfzNluzbRfD31Z3h76ph7TjDJpBiT+PrZP?=
 =?us-ascii?Q?av6Gx4VIrJ694qgX20eoKlzDh/+dwNDoJFVa0WPNfELe+rRRjcpXElVH4THc?=
 =?us-ascii?Q?Sk68MHU1uT3SH8f1GOHyGtUbxOkQZ74TpW0LZxpWLXwVbroXkFe28uFeKlBo?=
 =?us-ascii?Q?VPoOup83WY0ayKrPufm8TJZ/YvbK/vcH460B5TeRudaSPlTfTtvidUnGdE9I?=
 =?us-ascii?Q?R+DEzw4oTFkR78XQp4ZEow60M4CM0HuLvjWI368Aah7bmAl/1xCmnf4lTj5G?=
 =?us-ascii?Q?yBmTkZcCH7Y1GMOcHvgp5+3KqN8wevXUhy+UBMRt/5jdN+wlOdIEu45wyqnD?=
 =?us-ascii?Q?g3hRAifd8w/8fnQzmkHGT6h1a9GyGe/NT1tTFXAAqT8oDDTKFXbzGgqvI8W+?=
 =?us-ascii?Q?gTz8/P6AQUNY6q929S2XSFrTALRpldpHJ9Vc82JZR0QO4qZRDwTizp1CCm9z?=
 =?us-ascii?Q?Afm/zbKxtIIlU4EhO2XdUkN8eDWpp40wjyRhmUXOITc09kvYCYnqGl2ej7w6?=
 =?us-ascii?Q?owR8Nv3bMsNMDreVR/Tf3AHpRyd24YF/3Qn0z9l3omWkymEjG/jwxcgfl3Up?=
 =?us-ascii?Q?gKvcO4zNYEuZVMcBHVqUamFwuXaJUBYrVxU+Ql9b320+1f/Ji3+xC+iHJ+GN?=
 =?us-ascii?Q?Q/yx6VLvmhGRlFW025m0uMiiDdHNqb68khV/nCqg7dyHabi8AvmghqoeoQyl?=
 =?us-ascii?Q?5oF+UsQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S2HVWJ1PleGtyOgRa8wX3xYkWgW1u8cHiAXaQX0+87eI9ez6E7LA6b5YUeVr?=
 =?us-ascii?Q?GB20lXQMvbSSatKbIq2BiyYM47yKpk3JKbNAdwFfW8DGh136yUw5ktqftDX/?=
 =?us-ascii?Q?3HhcqUVO+CFwOPWFy7JgA5jgGO6jGg/8/h8V7if1lGBtPjfGjhlkrQP+zH7T?=
 =?us-ascii?Q?NWbDJOYW2t8Yvky3ixspaGe8Hy2sRzoR1FWOJzNOcLy6CnoSQeQwewPzQKfj?=
 =?us-ascii?Q?eGctoKOydBNKObKsYbA5AcPEp/JwF1bZJX71zC9iKHNTPaN1Yd2uCj35HcNp?=
 =?us-ascii?Q?BbyNzJrB5yZiNVbuyxM7H5jg30r4fbz36uFu1hEOjI/HsVjbfyp5WLquTx5m?=
 =?us-ascii?Q?bnUynWjRKfhvZ9o89gYwzJw6i4Npy6PWX8o47miH+OrTqmSUw380nlsMBwHq?=
 =?us-ascii?Q?XOU9OVZzePy1BjcklMgh0FC/aj3/Hnrh6Vk1JXaBviKtJ3l/JSOYVMfnFOYd?=
 =?us-ascii?Q?b4muQ2GyXZ0NpjKKF1eQVQl0EHznU0UTYml+To9d55SrLe/Z4TsP4JPgHx1n?=
 =?us-ascii?Q?EZwmLuq1d+z9ywESEm81mDaKLACLSbQg4UYzDzbyBhSoLN+xRHhDljSbZlP+?=
 =?us-ascii?Q?R/pbbvkeYzVmfj880QkMvnbc+ifZFFzFTIqvIWSZa+VcHEWNzBDqY+7nTeh9?=
 =?us-ascii?Q?9Xx4jVa+3rh9E32Q2dLU8aprwMYxeoXkev+IdUjuvow0fORrrLEDXSh1+dsP?=
 =?us-ascii?Q?RNpHimllY9ohoJwYnVCoY2IxL8S0uD3zic3vjk1k4tJ5ZAhiEaLOswobK/Cn?=
 =?us-ascii?Q?9ilVo73bGNQLy7TygeTAd8YBDdI4Xprhg5cPsz82+FJzUMcsf+cTZHlpt9hn?=
 =?us-ascii?Q?wKKLifbWo6THBA/oMNl+ajUoRPJbK8bA1tT6zxqf9KxTsitndM1J6p90A3s9?=
 =?us-ascii?Q?72zhb9MdiWNx7AAI+++e1/M77u+BaZrsGUiYfaJ0B1Qm28WqXr7oZ13sjfJv?=
 =?us-ascii?Q?6Y+BusODoqesS6xpxnbsz5ROhmnYKTXZos2iXZq8TxVV40XFnI1qDxInlggT?=
 =?us-ascii?Q?nrPd9g7Bd2aCQRu44O5+PW+jB23OHjpKfygPCSOtJ/RuhT7Hbn88j3oZtHGk?=
 =?us-ascii?Q?EiyOz7JcVxfEz08MFQ7JZ3iOiSdZrDISo4SVXjLEHIvy+WhJZu7MnbERHS5f?=
 =?us-ascii?Q?fcKtSjaMI3AnwqVkftajU4gYOZkYeCuUg9aZpTPoaEdS7+jpbZp4T8ScXi6t?=
 =?us-ascii?Q?X3UlMinw6eC6ePf7u+I+Bnj08Et5dOCFKui5QOG6iSd2l/ooOt1vEMIG09iH?=
 =?us-ascii?Q?om0zgHiElLY+16RBaAZ4E1rDlgDoWYzWbtChCmpTvkx7jNgcrShJ8ZlJbxlN?=
 =?us-ascii?Q?FxlBfjboQjv7t9QHypi8hVBzpu+z47oGEFTMIYb4GGU0Phq4PBsoIEhdWg47?=
 =?us-ascii?Q?NcuQ6V5aIFAjppBbDi2jDvRJJEi9GrgUwpPbs7D0enlVZ5T3yJodgC3kQ6AX?=
 =?us-ascii?Q?VEoV68Uk0leabI1G5e8SuV4IZE5jf4TqkUB1cLd8T3AA0UWRWwHug4vpl41v?=
 =?us-ascii?Q?0KsN1gSu9p6ZLfZhBzXbGVmC7JFwtjH1dk/Y0yUocvDOcQALbv+jxdced5Th?=
 =?us-ascii?Q?qBnV3O1nd5EG7ZmUGVUMJuV6s0s7WfTqgYRieHSd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a90540f2-103c-4813-e24e-08dcf19c0d54
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 06:46:12.2556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DnbKhgOyFJ2Tqo5Y6+/uZMIXPc8yA7VLxo/lDr0ukp9afj51Us8uYDJlV5giQTWEiL0ewJDlq7DRJw9ajGTbtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
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
---
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

