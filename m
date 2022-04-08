Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEA04F930E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 12:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A7B10E1A9;
	Fri,  8 Apr 2022 10:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80080.outbound.protection.outlook.com [40.107.8.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CFA10F14F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 10:33:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5fSkip+//FqmNiZaEZHQ6RMZyfSi2diTCk6MrS6Ao83TSuKQ1n/NqilSJxCqis10MEuQv/SmD2p8hXDqnJItlMDTy6uTgyibhqMRHRwvgdgU2YwMfftAyI7sS4k121/ycK7IeWBi7YSGJMNKO1hV6wNPXeVqLYC6x4TakdrkKSNPC0XjKt0hMp1R0Pg4Scbb4wkeiynpcwOBMriuZO86LdHEBITfiIbFDJKmAWoyZFulh0w9zXrR9QAm7H5QrJfpRIfUb35tJP7FqRTk7ujDkMapc+kpF8DAvyJUaCa54Co8ztzB/Furf1B3FeMDeiDvwYubqoTnQwgNqjTEQlXKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THrNQKpsWNdMxuYojeIsC5d7vKf1mcZHEIGlOy6s2W8=;
 b=H1NugxnIbArzuUQaKAdMMdgfk9HASuQh3EmKpeJxk1+5j6ruLoDlq2xP8vcwQUZXhvqbCXFoZNGDAUYrY00cZ7gsSnStnWE7GbACse4cL/s74e37IhFu9n0QvC+i8jPgciJJ16s+Rra1DfVN5PDFkdsjAYt/WM7FWhVP4QUkJhtMjKWNfbbrP9y7vGeCWKUuaMBkM1H+rcSgWPVMK3jeYC+QD4duKpsrd9MuWD5DmaWQ90UeomYuXJNx3SyT1kiorvXkoCG8vBYjqyl6YjLVFclg8t9rVxzOAgKgNFzJ/v2zeQamX1LogMvRBL0WL0W5QsOxYS8JwUxHvatjIbYMRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THrNQKpsWNdMxuYojeIsC5d7vKf1mcZHEIGlOy6s2W8=;
 b=mgoqElixFE10nA9dQUVTS5FULmuyuRHZ/I4/qThEQhdLGtO62UGkpH3KNOV+IPL+a1zEn0vbj2I68RlOSkBXLNmqddLW19+PeEMWUC2ka5gorZStrW1DufpMKil5ygMjTD54VKJcoLKSAXJvF5zXMKFfRgytfgyV1w4OTMxd0gU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
 by VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 10:33:14 +0000
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430]) by DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430%7]) with mapi id 15.20.5144.025; Fri, 8 Apr 2022
 10:33:14 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v2 3/5] drm: bridge: dw_hdmi: Enable GCP only for Deep Color
Date: Fri,  8 Apr 2022 18:32:26 +0800
Message-Id: <a0f9def7e7438592f78ef0a16cd0a560be0e6133.1649412256.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649412256.git.Sandor.yu@nxp.com>
References: <cover.1649412256.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::29)
 To DB7PR04MB5450.eurprd04.prod.outlook.com
 (2603:10a6:10:86::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebeea71f-0afe-4f5b-92c4-08da194b2fe3
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3405:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0402MB34057CC9EC8BF4535651D4C4F4E99@VI1PR0402MB3405.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pwBaMCRpcWeGPPgyipSPtBONNAjDCEzGAQojEpUF1ZPdvNziU2cS798XSNu5GlYYK+PMaES1CZga0vy1ncDPGa18iAaH6SKocSfqlPgA3Wv3v5A+AgVdgq3nRe2t81+auRo1cgaJxyuAzp6m4Ifdj4Z3zna0jkrw9S1GZ2Qso6PKIJkshH7U6RI2DOApbHSrHq7sRwMa5sCCPWUtpElyFR/JlArKkOO6qwLp10JWVOjvKVCphFLQiElLOf8AN0TAp7/Js9tX6J1QYvV++7Sx1xIqX6gdzCJjOvUYA8eGoM5eeMq4nnQJWMI9laWytAtUXz9NLeBacQbCUDw8DnQcYV6PVoAfk1uxaiKMlKHu4lJLjrmjKyaeApb1uscz2W3mliUH0glwEdw70VmN1kyXiGFpf9LPO87GTjQ+WRSzN2A0QKJczaPEL0BLhZP0Q01VcIAdrBXerqh1D6e2pSXAITFVDqS4PkZk3zPdO0BBbBF0OVYUvCL/0KBT0+9lPbksJEHCtXJLzUDZdbdFBDub6oZ7iz3rgGQretlaMGK02a8WxFen5lZr5fRALuN+fl/7L4+tkEbC7xrqrfthelcMlQtaz1oZ+xbfo3Vv29oROf/BUK3OVYJEvwr4L8nBicdSIePYbOdI6Fxkm27487T0zwueduRHvIlOCrg5SkIFZF6CVuPUx4Bapcb7fig7FCnaea7oid37ZGyPzIAMSZ0XYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB5450.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(2616005)(52116002)(66476007)(6666004)(8676002)(86362001)(508600001)(66556008)(66946007)(38350700002)(4326008)(7416002)(2906002)(186003)(316002)(5660300002)(6506007)(26005)(36756003)(6512007)(38100700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ezpyk5Eu2k3iU6sBJSf/pXyKhQQ2QsmeOwKuKFiOYkEhKS/PePhQ/D1iEjBS?=
 =?us-ascii?Q?2ko4R2ZONrDplB4yQXu0y6RTtQHc15KvKLu765LtEmciLvyCZjQOw2QeR+hb?=
 =?us-ascii?Q?G9ZbygHdW4fyl/dHKwkfK15f8TR8ALbzPm31WEK6S5dVD9SxP/7jeFBpI4Fn?=
 =?us-ascii?Q?jcVUCE+YJirKPikd2EpvCLh/uR/3f+vMY+fnG7fizEQGUe1c49wg2VoUW8RH?=
 =?us-ascii?Q?03y03FK5uf8FlJt40nBkzdtAVK8s+mTyu2aGycAex0aXaiwAqQT1B/6bhCpi?=
 =?us-ascii?Q?9IfxYkb62oBlpiHyjEfcNQl8m0MbOoFkINxheN/jRVTLHJipnthXx4ozPzYa?=
 =?us-ascii?Q?xqyKYHO+yXx1gC7VcQ6vp/kwsmzUcRMsuZqSZX88YmyP1Mkuht3CI03A0YDG?=
 =?us-ascii?Q?2L7Cc6Z81FULidgHg2NQmO3+FHOoCH3StwTqq9LZfM1+RApSSKT/xGilMNDc?=
 =?us-ascii?Q?FlZ+kPWQWE+H9RdbOxv/1sXCvhApEHbVfjDv9EtL77RaJNMa03to7IxWQy8q?=
 =?us-ascii?Q?CmD99vZ7sgmHgRFU0xL4BHpo1ekI50RZJAzCFIg2X78ex+EedX8Fehw3P4qp?=
 =?us-ascii?Q?daiDPqk6jnOR648/AVlhGGQiZLEgJ9UloflWvPdZhy3mntY2s8Vh03BBDgf4?=
 =?us-ascii?Q?cj+KTfgpfHSr1qpjKhqBCrVxVmmntBFyXbYUmpx3m7hljf8V4nsgTMpAJVyw?=
 =?us-ascii?Q?On6QxO2knn6moFrBlH+FAh4I7twN7bO8NTSkqJ7Q2/AuozG8ZP2RePJsx5Ot?=
 =?us-ascii?Q?mpcFhZCfIq+j49QW35/tCulVU8+65P9w1fdLfXP7BkOU+JloMS5kMgRCnNSo?=
 =?us-ascii?Q?Z/lLF0d3i+1ep5mFStCBa3G/L0qirzGhXbGkQvo9gCaJaxW7mBNFLrp8b1MW?=
 =?us-ascii?Q?F7afFL7abtJDEhKRABV4zuJQ/z7FlPjF2C3jOeudr7LoaXLyj6H8vzqR7/Jz?=
 =?us-ascii?Q?F4/kpWZvOMTsKWb9NC1KSFSov2yixPg4vn0Pa8Ksh4hZ52eIaRGkfXxoIp3l?=
 =?us-ascii?Q?z0yzPWsCmWRLdOxhLbrGntMoa0NqSBzSD3WlFLktqRZ33PRlI2XuSjEQLz0v?=
 =?us-ascii?Q?QpSSDqw7qobEMq5NN+xrKyVj7f49S5fl2xZFviNepQJbndc3GnFpPazxK1zB?=
 =?us-ascii?Q?qmzv0fDXu/up6cK9WQ9cvYT44830WdiE3GrKEyVtGyHnmpD2+AaZus0nD3PE?=
 =?us-ascii?Q?aonXm2dV96BPwensGcbD1kEWdWXXXssk13qbeOc8ltZLvz6nKVF5wQ6PvVb9?=
 =?us-ascii?Q?ublKLRlgYcv5azLdDPW5cAvDfJR/3NBIJmkIeSHqlejKAdeHAiGCvK52frGR?=
 =?us-ascii?Q?fvWbKZM4WqbmZ/K8ZOvOuumBC3F8ty3BOy71+DHTlUV1dphKKa5srljMPpvN?=
 =?us-ascii?Q?Hle6mBBgVfSex0SUSImpKSCMezIRGIT63NF2SbAvyH7qIiU2Igjk/HUtpak1?=
 =?us-ascii?Q?zMJv9DpQ1ewSTbTeV6rvMjpuivUwNSJ2Of+lHobMyZ3FIXTJu5Bg7AyHfPmu?=
 =?us-ascii?Q?MZhubhlwkiLFovTgsvOOBlMCQ/2jeBCGhhlSryMHS7w0HPFAMFBRb3bLBTI6?=
 =?us-ascii?Q?6p+tq8HX4IZWscgKmuGcIXiPVB09A/k4hBmg7GqplSJhgRlv+S9sr8SgXZcZ?=
 =?us-ascii?Q?zUzLI46M9cffsi8c2CTSNToP0038bSH4ZsvVLODZWyjGXy0+v/h3C08JWQxH?=
 =?us-ascii?Q?vxcucxf9VcSGJHIuzx3TrOzHqd/EpG4nJCYzP/2a13G7F3mle8Ha8b/fcv3Q?=
 =?us-ascii?Q?exoMvXhjZw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebeea71f-0afe-4f5b-92c4-08da194b2fe3
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 10:33:14.4906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zdjA4GR6/jD/CBe90U5YdbnM1jjA8Z0FNlo8yMdsW2E+coCWwHZP4QSwioHCmjNJHNW5qT1RlmQCdGeTkAUcOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3405
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
Cc: Sandor.yu@nxp.com, shengjiu.wang@nxp.com, cai.huoqing@linux.dev,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HDMI1.4b specification section 6.5.3:
Source shall only send GCPs with non-zero CD to sinks
that indicate support for Deep Color.

DW HDMI GCP default enabled, clear gpc_auto bit for 24-bit color depth.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 02d8f7e08814..5a7ec066e37a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1108,6 +1108,8 @@ static void hdmi_video_packetize(struct dw_hdmi *hdmi)
 	unsigned int output_select = HDMI_VP_CONF_OUTPUT_SELECTOR_PP;
 	struct hdmi_data_info *hdmi_data = &hdmi->hdmi_data;
 	u8 val, vp_conf;
+	u8 clear_gcp_auto = 0;
+
 
 	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format) ||
 	    hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format) ||
@@ -1117,6 +1119,7 @@ static void hdmi_video_packetize(struct dw_hdmi *hdmi)
 		case 8:
 			color_depth = 4;
 			output_select = HDMI_VP_CONF_OUTPUT_SELECTOR_BYPASS;
+			clear_gcp_auto = 1;
 			break;
 		case 10:
 			color_depth = 5;
@@ -1136,6 +1139,7 @@ static void hdmi_video_packetize(struct dw_hdmi *hdmi)
 		case 0:
 		case 8:
 			remap_size = HDMI_VP_REMAP_YCC422_16bit;
+			clear_gcp_auto = 1;
 			break;
 		case 10:
 			remap_size = HDMI_VP_REMAP_YCC422_20bit;
@@ -1160,6 +1164,14 @@ static void hdmi_video_packetize(struct dw_hdmi *hdmi)
 		HDMI_VP_PR_CD_DESIRED_PR_FACTOR_MASK);
 	hdmi_writeb(hdmi, val, HDMI_VP_PR_CD);
 
+	val = hdmi_readb(hdmi, HDMI_FC_DATAUTO3);
+	if (clear_gcp_auto == 1)
+		/* disable Auto GCP when 24-bit color */
+		val &= ~0x4;
+	else
+		val |= 0x4;
+	hdmi_writeb(hdmi, val, HDMI_FC_DATAUTO3);
+
 	hdmi_modb(hdmi, HDMI_VP_STUFF_PR_STUFFING_STUFFING_MODE,
 		  HDMI_VP_STUFF_PR_STUFFING_MASK, HDMI_VP_STUFF);
 
-- 
2.25.1

