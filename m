Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8CF7F988D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 06:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622A610E185;
	Mon, 27 Nov 2023 05:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D6110E185
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 05:10:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSsKEX/JI8ePpXCwTg+9tnoc+TJ6Lkqe8sbh99m37Y6HDGrTekjDHiEJNB09vsJRHry2qc3yCdb5Vg7jSoIGmKW1IGUMmvPfeJ/gv5RgnKo0aB6BBYIkmG7cvtYB5wuMiTMw/sKidO9Jl3V2CIeA4Ye1rwphcwojFFd9sk7QAHvImMLU0/qgaxYgrZF6kFMdSBSuUFHZjswsizbUlQbFVoDXRJjJIEIUpxyefiaN+X2Aivq5RextZUVYRzV092RRe/9W3QbFGbJQ+Okt/FaqpY+rr3cESil4dINfXdYCh6G3sPfaKJWdFTXF2iQKyJmIasykHJQvA2xiNfR07cDrGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5zWOZmsGTeT8xFxJ8FHYZvgDxLdC87QS8N39Aej3dE=;
 b=oJ4RdkSU+d2n6ia0weBlv36F4ED1blonNtb4mBcE4D0mSFkcDvZJJD+sRh9TYSYrDijHhoyiyHnoQ4XPiFZx5BsG/EKtqSlZcYilpyNBEeV6An24h9pfokiVCyGDEEP3dCQTiqjOMduDDeAKcHC9URpuKXCY3He2n3+0/TW87qNxEepFkX3XVCs1DSO7dzmMCTpjR3zeeuyQlBKccsEf3DcPYsOaho7BOe96PlUKJQ9KJ0kxH8s8D4ZmhUxXa5qMEGe5J/hIcLb6flup548C4f3QOe7bzjSw+nMKRECnkIAXBenFpA0Ln1NxGfnIpc9kbiCENfhC6EqD2k/OIXMvyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5zWOZmsGTeT8xFxJ8FHYZvgDxLdC87QS8N39Aej3dE=;
 b=PFfaT4jdBODUK4bJtGg7gE5RsJFdgCBmEqT/duS0TS3fNtxiI3wegiduygloj43NZ2o/0JPnrK84k8GQ+vOYz95M240wjkGSQo4qbNapuH6Wftnl8B07eafSfWm/klzxcENtOHA1aECMnh4ScHCEH+VcH9vmdt0m/5QXDHYiVvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB6961.eurprd04.prod.outlook.com (2603:10a6:208:180::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Mon, 27 Nov
 2023 05:10:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d99:f43f:65a3:9bf]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d99:f43f:65a3:9bf%7]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 05:10:12 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/bridge: panel: Check device dependency before
 managing device link
Date: Mon, 27 Nov 2023 13:14:14 +0800
Message-Id: <20231127051414.3783108-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20231127051414.3783108-1-victor.liu@nxp.com>
References: <20231127051414.3783108-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM0PR04MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 130cf83e-8372-4e41-9fad-08dbef072298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r92LQc+yAEo6qAPCnIvN2cJcKjShHhRaF2V45SdlgXKZR3Q+Ln0ooRNUw/BaGnlw90wtGCrhKq01ywseBcNRHj5LjN5+FGFQyB1BIKaOhu3hKgQNKiLCljs35+NRJuQAfxYKfGCFqo3/8ANb0UHXidpqmiOB8/8cd0xrG//7OAOupeIo2fV1W6aXQfnAJ/ixc3SLiGffblUgR9vekxpPwHRtlphWSKwPlDebZmVb+AqtDg21EWp4ZNDbzJdMxoGArbQJvcBr1mHQ3kGm4REElqei9I0FWwpdyruKfmhlH5LazQwgzIxiB5AAoQMSLHtk/5PYpg7leNRMt3WT+ysUUeDGP40kZB/lZgri5P6ZTFRpp++ODIt4eD5zXAfRZ/XhTAV8q5KtnTtjspkHbiwzvcRUL9jzXNByywSxO69AP5UCdCwXkJ2Q0mASd+0/02oBXQ14FBbVAwzPqtgLdyOsJg+Y4Ax/v8F01POhO/Pic8QvyCSiYivWeM1BSe9EfvNUchNxDlIEMs9a2m2zEVRfP418UYoee5gAr73ISaKinaT7MNnd/j4Aj9Ic8xne2r6Ue6mtitW4C0mNQ8FDrpQ0SMzN1e4hNPAVX0ZGXH8g1Xw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(6512007)(6506007)(1076003)(2616005)(6486002)(478600001)(52116002)(966005)(83380400001)(7416002)(2906002)(5660300002)(41300700001)(66946007)(66556008)(66476007)(316002)(4326008)(8936002)(8676002)(38100700002)(38350700005)(86362001)(36756003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HNu8tw0h9bZtckpOi9b3c99rlPv5TSZ23+P2k06qJ15pj+MiS5S/V1dLUbxF?=
 =?us-ascii?Q?o/bPEHgwXxQ/F4/V1HBDS7Nrme+6dsbsJlGJ7QO2683Txd+MYH2CHymvprKD?=
 =?us-ascii?Q?/kE99eTLjN+JfKweVS7hZE5h66ZcZhnRhOAag2D6QBUdslCo+6joRgdI0y+2?=
 =?us-ascii?Q?KsgkqAY/4JNDvXSxVyrUife6a6yVXg568Et/fqHfcGWfT4mR3wt6pbwqWAe8?=
 =?us-ascii?Q?uibNsNGTwQ+sWfhXBF+gI2pYZyJ/3sUMSlQl2MJDdLGENGpNgNd5nzq6HiUf?=
 =?us-ascii?Q?2RjRge6p8x6Eb5ECfpvrRcnvNgmUX05WaQpOPdd1coyPTz/ggzaJvHQ4DUcY?=
 =?us-ascii?Q?/PWhRreFJb5H7E6JBYVErvgYIO5dFZTM20JGuybxKFV9Sxp+7lRfyxlahCqY?=
 =?us-ascii?Q?oFsqoFnsY8MMTJe+zwad4GYClQ+nc3CCNUOBnGMGMPijuCAEn1R8JEGBbGIM?=
 =?us-ascii?Q?Q7PFjPhQ1PKY/riFb5VVj89F9f1f6xBhZszza+pa1rbbGKJIUKt8MOTyrL+f?=
 =?us-ascii?Q?ztOdEZcy1Kw0DqQco5gIFopRRMu1PRZD4kLF0iEoaH5Xb2Ul0O4rOkQ0WsXE?=
 =?us-ascii?Q?ANWKAhKaOS+aH/gWz6wnWNlKoxSefNKjk4vL8vezLohnBTzsrvjHoKhG8SAr?=
 =?us-ascii?Q?ZGDCXOea9EAyNzs5qg2QeUSnpPrNpNLrHIFJ/zPUC8zLVu0s9tNFVjuy67TR?=
 =?us-ascii?Q?zjDArFmYnm4VUAK9iVpVLLQ3SPzvRD89HoNpIrB8g1YfAYwgEJRj+QM/Jvws?=
 =?us-ascii?Q?9w5My7IgpfNaC8829V1qHJNWxnabb/VHRAqcku0g2xs2U4NRbCNKpIM2Gcgp?=
 =?us-ascii?Q?y8mTWePOvEXwP0uHunthM6Q63J4zGmTzDwSFqeQ06H2SEh8+s8jPmKH58Bcm?=
 =?us-ascii?Q?y2CXkJ7bpLuSeIpet7zUy2J1VHZ3ZEUvUcL5ro31nHj8cx9yRMcsPFBRJbJ1?=
 =?us-ascii?Q?9+hvhgiHkxK+NjLex25AtXI+2pWdX2gqdv3HdyNDOydaAyg0Y4O+OV7CYpug?=
 =?us-ascii?Q?mGyqj4p4DXFEXwnbues4ssC9RGY+3VkOLG8u6u/UDFigJonP2yI41SV/j1lF?=
 =?us-ascii?Q?3MEGZroOGXV4pOODBjGqDKBcVqvnm0iJiVfwQTOZ9hAl8zNFZA5m9ZbXHNgX?=
 =?us-ascii?Q?t6pPfJf6tIb1pBrwsai/o6d4VcR+Ev7JAyLhaY3KRW81zPet8ld11k/Hi1Jj?=
 =?us-ascii?Q?Q3QWoBCNVVMPJ3uXA4P0ainseSSbNAHWTdn8yqDHGfEtnFvctBOb3MdYOvql?=
 =?us-ascii?Q?Ll9ggTbd5NnPrGc8jC+Hr8ixXDSPZBi/wpayjyZxNle5A3XSnU6tM7U/XuBn?=
 =?us-ascii?Q?DZIiK4w4hM6sagKFrMXI2JdbjG9FDn48nf5HFO5KL3v2rbbk7wKietGRC+EW?=
 =?us-ascii?Q?dwU/AA1Isx8wjg8ME/RM2bbzb5Wa5wxVoEoUT5kPVFvvkAmxnvYHpZcKQUvc?=
 =?us-ascii?Q?uNqCWOkw2kBGAzymLBlud2oTDfJhubXg97bcC8oxIBcm3ELJ0ruAjARptFYs?=
 =?us-ascii?Q?eQD8v0KEYZXtRzlCIBLVmBwPDb15BFkWzXyfLW2pG0Q8A3x7d6LSQlZYXS7L?=
 =?us-ascii?Q?VgmW0UXEkZK5wvNYsL4+h18yVTr8WJT+EpmMIemS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 130cf83e-8372-4e41-9fad-08dbef072298
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 05:10:12.9275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHo0h4fqvwmozg5qC3vr04Tpjch7TvsbPlNh7A05b+cumK4bhM+Csg4kwYjfQHA5P/xCc4D7OQ8UCE7gdGA6Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6961
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
Cc: mripard@kernel.org, sfr@canb.auug.org.au, ulf.hansson@linaro.org,
 rfoss@kernel.org, tzimmermann@suse.de, rafael@kernel.org,
 gregkh@linuxfoundation.org, neil.armstrong@linaro.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-next@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some panel devices already depend on DRM device, like the panel in
arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts, because DRM device is
the ancestor of those panel devices.  device_link_add() would fail by
returning a NULL pointer for those panel devices because of the existing
dependency.  So, check the dependency by calling device_is_dependent()
before adding or deleting device link between panel device and DRM device
so that the link is managed only for independent panel devices.

Fixes: 887878014534 ("drm/bridge: panel: Fix device link for DRM_BRIDGE_ATTACH_NO_CONNECTOR")
Fixes: 199cf07ebd2b ("drm/bridge: panel: Add a device link between drm device and panel device")
Reported-by: Linus Walleij <linus.walleij@linaro.org>
Closes: https://lore.kernel.org/lkml/CACRpkdaGzXD6HbiX7mVUNJAJtMEPG00Pp6+nJ1P0JrfJ-ArMvQ@mail.gmail.com/T/
Tested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* No change.

 drivers/gpu/drm/bridge/panel.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index e48823a4f1ed..5e8980023407 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -23,6 +23,7 @@ struct panel_bridge {
 	struct drm_panel *panel;
 	struct device_link *link;
 	u32 connector_type;
+	bool is_independent;
 };
 
 static inline struct panel_bridge *
@@ -67,12 +68,17 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 	struct drm_device *drm_dev = bridge->dev;
 	int ret;
 
-	panel_bridge->link = device_link_add(drm_dev->dev, panel->dev,
-					     DL_FLAG_STATELESS);
-	if (!panel_bridge->link) {
-		DRM_ERROR("Failed to add device link between %s and %s\n",
-			  dev_name(drm_dev->dev), dev_name(panel->dev));
-		return -EINVAL;
+	panel_bridge->is_independent = !device_is_dependent(drm_dev->dev,
+							    panel->dev);
+
+	if (panel_bridge->is_independent) {
+		panel_bridge->link = device_link_add(drm_dev->dev, panel->dev,
+						     DL_FLAG_STATELESS);
+		if (!panel_bridge->link) {
+			DRM_ERROR("Failed to add device link between %s and %s\n",
+				  dev_name(drm_dev->dev), dev_name(panel->dev));
+			return -EINVAL;
+		}
 	}
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
@@ -80,7 +86,8 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 
 	if (!bridge->encoder) {
 		DRM_ERROR("Missing encoder\n");
-		device_link_del(panel_bridge->link);
+		if (panel_bridge->is_independent)
+			device_link_del(panel_bridge->link);
 		return -ENODEV;
 	}
 
@@ -92,7 +99,8 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 				 panel_bridge->connector_type);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector\n");
-		device_link_del(panel_bridge->link);
+		if (panel_bridge->is_independent)
+			device_link_del(panel_bridge->link);
 		return ret;
 	}
 
@@ -115,7 +123,8 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
 	struct drm_connector *connector = &panel_bridge->connector;
 
-	device_link_del(panel_bridge->link);
+	if (panel_bridge->is_independent)
+		device_link_del(panel_bridge->link);
 
 	/*
 	 * Cleanup the connector if we know it was initialized.
-- 
2.37.1

