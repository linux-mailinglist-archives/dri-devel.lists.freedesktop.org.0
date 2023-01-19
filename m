Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA666673C4B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 15:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6B610E972;
	Thu, 19 Jan 2023 14:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2048.outbound.protection.outlook.com [40.107.241.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD63210E96C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 14:39:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHcFwAwCG4SA05srllycvh56XvLHZtWeRmSUtNt4Fmc0iYpZEW/j1YjiDNlqoeoTcXIZDc1kqi/OgnH1/zkros44OvWZ6iIu98gVgDJ2d+HsqE0KRPQMq+v+3QMU8dI7PFANhtUnNtTZN1aScqyqIGhByWKB5pqEftbxsh+pjz28IH5j147t8kKAdQiaKMYC/tKTnzpOm7Y43zEaGjR/YamTsqzx2qWDHjWdl+8pmjM8X1XEgMblJi/fH4tAvYh56cWmSPD6kdrASaR/whtJ7ihkEdb44UcJEjOlx2zr3BGHf+AeTN5Uh0FaYq5FsD9RY9XpNIBBFvZlQOOTBE8jhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTDa3bsgB3lbqNtRTVwHqGScdV7FWISBbpPdc4IEoFw=;
 b=j5sWQA4VfXtx6hbgHj4X6rZjQ/hwI1thp2AcU9lxDlCmII2mfeDVEwXrxECAtSpcW3vnximyPXelptwIsddATAKsrkJ9EbqE1tbFdIoLBspChPFl20ax9wQYrEi7o9TmYOr5R+DmypdIrB+9IBlyoH1/p6M3IGILWU0GX2mxBokXrrUwPbHNQv3obGFCEBKqW1OQIRM04/B8Km2PnRJZ5Y0lDK5lXoIs/GdGJuQq3gLEqg+lqf7OGslh9xz2oJRu+pyxFp1lMNw4hqgajKdE5nnOF+36h5GaQTs9emxLqGEiQLua242FKVTZoQ5ig/2rEzUo2Zo/rTReVA9Y11aQWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTDa3bsgB3lbqNtRTVwHqGScdV7FWISBbpPdc4IEoFw=;
 b=habd9RtTyf0V9FqcvR7dlzJ93zOJeIl41zXRPls8d0kFX4GB1pM6QMFS/9P9Je3MyNDAR3bUmRcBz2JbTb3J+ci2M5oriOftXVhhEJxoaE950PjtfB3178c8/qa3uUj6QgabMBo4ljOl20rHKCtJUtGdQf3VV7bRCFAtopPbWbE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DB9PR08MB6556.eurprd08.prod.outlook.com (2603:10a6:10:261::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 14:39:30 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219%2]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 14:39:30 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/6] drm/rockchip: vop2: use symmetric function pair
 vop2_{create, destroy}_crtcs
Date: Thu, 19 Jan 2023 15:39:09 +0100
Message-Id: <20230119143911.3793654-5-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230119143911.3793654-1-michael.riesch@wolfvision.net>
References: <20230119143911.3793654-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0152.eurprd07.prod.outlook.com
 (2603:10a6:802:16::39) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DB9PR08MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: e8eb3cab-14ab-4bff-c207-08dafa2af948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Amhqask3UacCpQfY16L0PNn0CWQ0zY5gV8ajcbe28f04dG4P37TtNuWv/rKmcUy0i+uOb0UqgNyapJVY0ax1UV7YKhbdFlxqtDaBnkvDaZu+FYERkvhDzjcjFWAidg53/ghlGqdV7J6zU8lFvFYg7G5NKNXgNlq6BNFW5yYBLWNpk06b10zzCT5Hx1G35Pt1/HadThLxR808fmYvXugqZUD0Vm7DDG24NsdL6NtDtgFU0YqvImOT8/fAK84BERV6okiPy6u17mkQX7llzxLKRYxEuu10jMQk7sZs72l42dJLBWOyH7I3qROElbB5E4CarZGoAAAcV6O4RsXixABBXmWu82ilRkX7uKbx+qSBPHBHVaH2BnIQc+NbLRH9cF0smCsthcabqupchf4GeiSpFkxzhPqFIAXAbgeZoZTGuNi9ooJC0uS6AhzZqThxJ1IwuuxcvhbQ19ObzbFok3TSCLgJYiHxp0TN7c0cJZYDOAZPQ1DIM3cX3ofmHiOi+w4TLPUw7LrECn1/rfHte8SAxtOkSIlAEBqPUbyBT+B5EvIbP+Dv688/Q1DRA60zN4mUIQWqe6TyJ6SZco90wtNjrtMMK1WCiH9fQ3vNhPzx92hk8tI+spBI3lPTs3SppEgBzmed0i9xruBt/ulSqbbQRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(39850400004)(396003)(451199015)(2616005)(52116002)(36756003)(478600001)(6512007)(8936002)(186003)(6486002)(5660300002)(83380400001)(41300700001)(7416002)(38100700002)(44832011)(316002)(1076003)(66556008)(66946007)(66476007)(86362001)(8676002)(107886003)(2906002)(4326008)(54906003)(6666004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CIwsjhm+Kk8aFjXIY5PIHkB/OoIGHUNzn1s1BcKlPKanb8xUczLHioBTB24B?=
 =?us-ascii?Q?b9bG0LR1Xtw1n7YQlrKLBS1aFDHg2KQ9UaE4GSiJMxM40MS2l5uJHmXnowTM?=
 =?us-ascii?Q?45tuNBN9Ia+67G3FqvUcA2zycIYZ0J97BtF7GkxG5oB8MrgDc3wjL9EiKmsq?=
 =?us-ascii?Q?bexdi7fcBcks2J1aRRRJ/rrEx1tmRzsAl165bM07uH7wWoTlIc+ZsiSNyiuo?=
 =?us-ascii?Q?494yu3q50H+0c2H2IIkXycuqFF/MY74yhdVsUO82w1gV8FWS4xhAQLCl79LX?=
 =?us-ascii?Q?CwLag6IdXxESbbNUFS7sSt4K9P9A/1Q4jCUaTqeeKMT1uuDWyTtawhA0145r?=
 =?us-ascii?Q?1RxueRqKil243gw7DhjHwgBuHmuTwRCDG0/fY55JloMOnGzU1UNa3bp4adEM?=
 =?us-ascii?Q?bQuzdolwwPARWpe/CzgZGMC299KSNof1r85bYz4CbNc90tdA+5FBt5M8wSzS?=
 =?us-ascii?Q?Xw/8Nlz99Uz9nOXgn5391PmfILc9titONB/ZcoKdLslUG1X69ptcXnkiaF9b?=
 =?us-ascii?Q?T6PjNJSnrZzAmMlbrU//vPYxhnRb3FMDbmBV/CVBoXDKlWQWJ3v5etzxVfkJ?=
 =?us-ascii?Q?sq+E/YNkU6debS8erCkFLzVxqpmZrG4Yf49epqSk53DIl6t5i06nY7xwyWxe?=
 =?us-ascii?Q?U1yNJYdCTWBNGFRkwBuAJ7kz5Z7B4OEcWVvvPi/cuuyW1j//gO2EEOvDPtlu?=
 =?us-ascii?Q?Nu8D/DH8gq39A64va6DKIrbZ5IPkpk7HufmRXnHrx1XJf79ilUukD8Ycs34i?=
 =?us-ascii?Q?XTt98RbsR8IDW9y4RTpSW+4+agey52FKhyUer8PkCRnntu9WPZVxrGxiB9MM?=
 =?us-ascii?Q?X6r+mj4YEVTDAvx6H3/WZ32VPc7whceeg/M9EnhEA449xPjS9utRCLiIqqcQ?=
 =?us-ascii?Q?HZborAU/9/O6Ujg083CC9iFb/lmKQ9r6jKKrdF2QsM/EvvEInl3cN+vizvj1?=
 =?us-ascii?Q?z3ljP0d5RHynOU2gadefDNK9taRc7KZTFEPle/HRyAVqhlBjliR2wz/sLop2?=
 =?us-ascii?Q?IM6zDl/h6KuLMY+ox8VcKoCp8x0AEzHZuwY85aaI2WT1+w+Yl08FibOV+n+R?=
 =?us-ascii?Q?df2RYcNIvWkmHxZfo2mYvXBClMlaGXp/ip5yvHRA2jVITTftTyHUnWawkntE?=
 =?us-ascii?Q?1Acmyym4qxRWP0aJqXvGmx7HfxcCz6DI6mau2C06H2BD7hRBRtSy8gHj6IMP?=
 =?us-ascii?Q?Hg8x941STTzQp0fnEErikCMO8rVgVtpjVWlQm9jPLRQrRm3PNAMVWySsEk4n?=
 =?us-ascii?Q?2TK8frTcl2b6/bTrrvHm7FnP+tnAgtDrFyxgk33mRYN0Pssa5a+QrqpOfXFL?=
 =?us-ascii?Q?cZaxAHz7EsENUV3CqTIAxMzDvoCUN0UEX6poV+kDMViH2YJwdjWhiuH/u1XK?=
 =?us-ascii?Q?oeLgBb4xq8Leeig/5NnN/c4wjsbwVNetrkH0MgC4eazsyLbRRwl2wwd/xA20?=
 =?us-ascii?Q?36PqYxDnWEKv52VQf4czTuIm73geWeNURQBIVW03eJwyXtG8myKtKtxnUh6z?=
 =?us-ascii?Q?SQhFZxfMK1my1D/Y8+13KQvVonRJu020B9/OeM1LftIvf/MzSQRw2Yijl/j0?=
 =?us-ascii?Q?14TCjxNTU72DKBWFc/7jz4WA6iPsik7MXSSzSq2/U/cu9urEeZEsjoyWIfmj?=
 =?us-ascii?Q?dv4Vn9KxeB/+os8U8AvreSRERJgF5pcglhwkyypeYddo/ydy7hRorMhkJe34?=
 =?us-ascii?Q?29wN2OAq8rh1fbbWsHS+d8lWLaU=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e8eb3cab-14ab-4bff-c207-08dafa2af948
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 14:39:30.5149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvkHGKFTReS6mnofLwKIEQXiukh0GANR+sMAMDSd8dM+DIoZ94B3Ume+uPxj5iMxqsS18DKYtaVEaNgWB3YLdQeu74tscgqqtYnMNpbS5+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6556
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <sha@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let the function name vop2_create_crtcs reflect that the function creates
multiple CRTCS. Also, use a symmetric function pair to create and destroy
the CRTCs and the corresponding planes.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
v2:
 - no changes

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 31 ++++++++++----------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 374ef821b453..06fcdfa7b885 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2246,7 +2246,7 @@ static struct vop2_video_port *find_vp_without_primary(struct vop2 *vop2)
 
 #define NR_LAYERS 6
 
-static int vop2_create_crtc(struct vop2 *vop2)
+static int vop2_create_crtcs(struct vop2 *vop2)
 {
 	const struct vop2_data *vop2_data = vop2->data;
 	struct drm_device *drm = vop2->drm;
@@ -2372,15 +2372,25 @@ static int vop2_create_crtc(struct vop2 *vop2)
 	return 0;
 }
 
-static void vop2_destroy_crtc(struct drm_crtc *crtc)
+static void vop2_destroy_crtcs(struct vop2 *vop2)
 {
-	of_node_put(crtc->port);
+	struct drm_device *drm = vop2->drm;
+	struct list_head *crtc_list = &drm->mode_config.crtc_list;
+	struct list_head *plane_list = &drm->mode_config.plane_list;
+	struct drm_crtc *crtc, *tmpc;
+	struct drm_plane *plane, *tmpp;
+
+	list_for_each_entry_safe(plane, tmpp, plane_list, head)
+		drm_plane_cleanup(plane);
 
 	/*
 	 * Destroy CRTC after vop2_plane_destroy() since vop2_disable_plane()
 	 * references the CRTC.
 	 */
-	drm_crtc_cleanup(crtc);
+	list_for_each_entry_safe(crtc, tmpc, crtc_list, head) {
+		of_node_put(crtc->port);
+		drm_crtc_cleanup(crtc);
+	}
 }
 
 static struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
@@ -2684,7 +2694,7 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	ret = vop2_create_crtc(vop2);
+	ret = vop2_create_crtcs(vop2);
 	if (ret)
 		return ret;
 
@@ -2698,19 +2708,10 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 static void vop2_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct vop2 *vop2 = dev_get_drvdata(dev);
-	struct drm_device *drm = vop2->drm;
-	struct list_head *plane_list = &drm->mode_config.plane_list;
-	struct list_head *crtc_list = &drm->mode_config.crtc_list;
-	struct drm_crtc *crtc, *tmpc;
-	struct drm_plane *plane, *tmpp;
 
 	pm_runtime_disable(dev);
 
-	list_for_each_entry_safe(plane, tmpp, plane_list, head)
-		drm_plane_cleanup(plane);
-
-	list_for_each_entry_safe(crtc, tmpc, crtc_list, head)
-		vop2_destroy_crtc(crtc);
+	vop2_destroy_crtcs(vop2);
 }
 
 const struct component_ops vop2_component_ops = {
-- 
2.30.2

