Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCF4227CC4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 12:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874D16E560;
	Tue, 21 Jul 2020 10:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40046.outbound.protection.outlook.com [40.107.4.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E856A6E55E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 10:20:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEM7vk9BnzDEDu2wooOkVh6TCv75MQzkzUdmrCfVb96lh2OHjmwvzdNTM56824FJwHlXDJ+mRS6FGHoTE/Y1CtssfvyZubJMpDC+MInDXz/JsW/N1yJlXvifhUw/keGE2hw88cSmyIptmWKAkOjj8qeiXnO4nOkKxVO31sqmFiGHZz3+yrGhP0hVbLxPVYgbDulcWGw0cw9k95BYqYpU2e+Kwvhj1wwM5w6LYmBRhDdsNuGCUoyDENvV5LNIZKPvxjs19fmX/oUPHn6Fyuuan3g67pBIvrw5m55P/bSU0kVWHzlPtXGEzQCjpX161g+WFa/X5Ap4n8BLFDMCJlyrTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmRfCO8DfQpqrXVtGTBUyw7wV25yp0MALyRAGwEitWw=;
 b=dD1vhHcaHl8IYv0wJnVUTTkPgNC8r/3AHgF9kPjWqdO9AGcMGAx2Ix5QWj/YluVDaIZEeOuEA+RyYKzR+YuseQGpLLAtv4vYdUDNUFhpqbjlmXSWnXE52+IWzyGAQyiUGX+jJhHVDfBWDLvICypgkKG3IfJY9AeUS2JueoHWhdljEZ0IrNy/ygTSuBQfTQoiehYx2e2ytm4dztChZmALFXE2Xv5yillUvz7eLGJx5h4ysqhIXTIAbuP/90CryHMA/jMStaTNXu0Ka1Vvf1YVUQA4PoNNWx+mMZyXrB3y84v/eYlrvfCPAlGs/9h6G9hjKdZxCooFkJw5EnN7cEUV5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmRfCO8DfQpqrXVtGTBUyw7wV25yp0MALyRAGwEitWw=;
 b=OpPv5GBLLHy7JI19lIQ0SzyFonPJMkcjUaMeUXQtuo/tWbfWySdk3HrRG/fT1lXCEAdJ4rwCBFgPpbh4vV+24wnFrbjtH1X1G5iN+jSWjqqoC6XgfEUyW0t9lLos2dXWcBDPb5Lv6GP9xOT27rhdn46ZpJyyU4WgWiSu35g/hGw=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB4398.eurprd04.prod.outlook.com
 (2603:10a6:803:69::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Tue, 21 Jul
 2020 10:20:35 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7%5]) with mapi id 15.20.3195.026; Tue, 21 Jul 2020
 10:20:34 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v7 1/5] drm/imx: compile imx directory by default
Date: Tue, 21 Jul 2020 13:20:00 +0300
Message-Id: <20200721102007.18368-2-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721102007.18368-1-laurentiu.palcu@oss.nxp.com>
References: <20200721102007.18368-1-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM3PR07CA0138.eurprd07.prod.outlook.com
 (2603:10a6:207:8::24) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM3PR07CA0138.eurprd07.prod.outlook.com (2603:10a6:207:8::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.15 via Frontend Transport; Tue, 21 Jul 2020 10:20:33 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 91b8ba8b-af5e-41b4-48db-08d82d5fb485
X-MS-TrafficTypeDiagnostic: VI1PR04MB4398:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB43987AA8823871FD975B8E45BE780@VI1PR04MB4398.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V6jZlapkXtnhTEKecvFLW6FQy3curdE+70VnL1OCYzVPkvoPSkHXAlurdq1GVavUjBzQbWVct8WQFkYVZl5zZjtYHaTo4lDR5nbocwym2qAKsmam5WFopyIzadnkg8CbvTMNrk1WLMdU3MmJ6r/2CLRUEi41kn4gZ1CB+/SttinPwzci0etabcCMRXiiHmCljviTzslvGWBUdWWXtu9MfV9tT2N5alCjSl57y5/WQYk27GLPUlhRw3xcYTbRsawhp6a5ZYBgwdSdKjDQlbnL+85rsZTUWbRi1EInNIuy2/G4/AsupQl522AhXTKlbmQITcUTWcOZDCs5G3ikoVN39g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(478600001)(316002)(66946007)(16526019)(66556008)(66476007)(26005)(8676002)(44832011)(6666004)(7416002)(5660300002)(4326008)(1076003)(2616005)(956004)(6486002)(86362001)(52116002)(110136005)(2906002)(186003)(6506007)(83380400001)(6512007)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: lL7Vxj9rSdMp1rkKKTC0dVFN5qzHrG7SsVGkPuLMFEbgGxbBRDPgbMU6jymASAkAlXtpcu7Yi+vdrEgjs1QMukuSCqH9jdMTLso1KQKuXch6hV8iaXgSabTIyovcs3z51hXIen61gQRWFHTyhIAE4F/GN/kWLSWnO+fX3O9y5ZNJQSHJUBBXsKBXhT2AxMEVCcmaywFiZhIXbfvYVBE+nN2y5vf4gtQbHc07qbTyMX7xVksV9fYEeI1VW642kqIsl6HBK7HXeNAAs47ncBYrqnFfbDHTFtO75pqjIK5yQHzqa97P5UcjlMdPpwulzlN9v1F+3gUQpaF5iKHKUEsACOs808Ou8K4hH/9sTqiBsaLgZrDAdYHJzzZqqYDCRXM1H33kRp3dUr3Dp9mCrj2lK0c/VrBq0W9dlsXuH7J5p6niOdpbDzt38YGZ2l6iomx5Osu9MC0Mw8OtnKCl6k+1PpHU1cgnSYEHwtGtofzJH3A=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b8ba8b-af5e-41b4-48db-08d82d5fb485
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2020 10:20:34.8830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBhY9OrzDR4pvxD3ktzg17dsoRy7wD2e0wYdfOSd6i9H3ljVaMjgwUD9/OgYxpoPHpuUSMRU9UAB9NBL39U6qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4398
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
Cc: agx@sigxcpu.org, lukas@mntmn.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com,
 laurentiu.palcu@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurentiu Palcu <laurentiu.palcu@nxp.com>

Currently the drm/imx/ directory is compiled only if DRM_IMX is set. Adding a
new IMX related IP in the same directory would need DRM_IMX to be set, which would
bring in also IPUv3 core driver...

The current patch would allow adding new IPs in the imx/ directory without needing
to set DRM_IMX.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2c0e5a7e5953..c4d12e756c63 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -100,7 +100,7 @@ obj-$(CONFIG_DRM_MSM) += msm/
 obj-$(CONFIG_DRM_TEGRA) += tegra/
 obj-$(CONFIG_DRM_STM) += stm/
 obj-$(CONFIG_DRM_STI) += sti/
-obj-$(CONFIG_DRM_IMX) += imx/
+obj-y 			+= imx/
 obj-$(CONFIG_DRM_INGENIC) += ingenic/
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek/
 obj-$(CONFIG_DRM_MESON)	+= meson/
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
