Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A39F63D771
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 15:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C39610E462;
	Wed, 30 Nov 2022 14:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::602])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF6710E452
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 14:02:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLCRmmtgIuNi8/oD/RbO7p53Nuyl4NhgSugPgmJlaOd+/qfToRFO64M1C1OkQzWjKb9y+CYBZN9ti0TauYaCTxk9iVEN1x1NmPyzL4OYRepks+sxWrQMCkj9FuPWI8eWFcMjxsD0F7vSvDhOXcuyonahzj1UlDIvMrLZKBaC5KcDM6b02yuc/a9GyBF81I8Au/AVrxKuiZTWb8vq7AJkAnpjMIo/HO4jnRTxK/EPwoXP+BKAV1W9+e+0ZgUrGnKM4FNqncMopk2c8UyvD4XiwW3uqRFrVyWkU0bCzlMfg1sOWIErpveAAUq5mRPeMlrwX2uKT6XfzPMzYUMZURwnYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjpRKMepunFhsKnEHlMmrI3T8Oy+HxsC0vITn12Pscw=;
 b=HwqzCz19+UwTAikdcV9sQkD5ZA0KolejGH+BaI9OXWCHYcZvLNWS2UUjM3wDZ4vXJvJVBVpXkFpZC0J9wFRq12TVqz8fLqQIDqEuuQ/BFNLa+DU+BM+9XMq7sKpG4KYqVUlZfou95Jza46g8oLpWfiQslxIetS4QYELyJtOVtMPjFd3EAmyHNNIXk40Hdq6TDY7R8s88ZIF6gTUdwbxKimwolGs4Zg4ZUJg7e22OCGrxhMFgwzjKCfwvCtlUqbf+fLs9bez9EXjYYr/sKNfgelW0b97e+SRZpXrenGf46oi5rVL6EzUHChGfy3ZFbTzDpXG/L1jBeQki9SeUUkALXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjpRKMepunFhsKnEHlMmrI3T8Oy+HxsC0vITn12Pscw=;
 b=2omJr/RtHafj49vlB0L5kIubL8UBhahu1BTdyHaRLyaLmpHWyFsJr61WWYmV6kc2i47lLIdSabDYxFu4or5sXBQWFde5MeIM8eMoRUvgIqtgv8jnsbUd1g46RMqjXotZxyqw+SGrDgM6Z72e/z8AflMWHWRmuAMdW/i1WwabhMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS2PR08MB8695.eurprd08.prod.outlook.com (2603:10a6:20b:55e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 30 Nov
 2022 14:02:52 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::3643:6226:28c:e637]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::3643:6226:28c:e637%2]) with mapi id 15.20.5880.008; Wed, 30 Nov 2022
 14:02:52 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/rockchip: vop2: use symmetric function pair
 vop2_{create, destroy}_crtcs
Date: Wed, 30 Nov 2022 15:02:15 +0100
Message-Id: <20221130140217.3196414-4-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221130140217.3196414-1-michael.riesch@wolfvision.net>
References: <20221130140217.3196414-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0182.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::15) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS2PR08MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c026ac-92c5-4319-1e63-08dad2db9245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hPVIVnWqgpCM+4XaMP1ndKVN0GlPwxKy4oSJyfmvCh/dXjrEdZUlXrpcPRrAOxheifggTGbbiDt7m+6kuclq9cc1XSjPxAtUb7qClKCwNCqvILqxLZRpx9E/fA8W+xTHnQEVDAlma6PpoMWeWpbTnjBePP+q8rL1ny7HPu6QhF8CT1ImMJoz1Dqm+9W7kKBN9yLYsHu+CamBQCzezVOccZ34WyCZHLipNM2OoTo+Psf5/5pj6vg4q5aKC+r20EzqU99TyqeNvM+zHiRodoTKYcuhIi1XgA8KVzh1xB+vHRf+mM/p3HmVYOy9s7vrT0LQWJnFC4gtQEvuZB5ecY/rZzmJuzedbRpue4MNS9e6Bm7Ahcc0C2QxCPG7o4vbYfmX4S2F6DiSpaoiHJw77OLj1f6+E7OJYFA9bGxy4gRC7H2YZowVn7alMuq+EOQeDdBUHhV1PBmKIySQaQu9DDvPMOep7iNjJ6Bsq30mgfOVE5iPYrdGrK5Z0yeGifn2NTlhA/QkxSyezwZtudsZnY2GFCjRJ9Jcyoc/mxnbKmzH+BVdKkp5HORCs7tpH69xgajtn/mVSOQmEd0h0fjUHIG0PvLnWOBb/n8Sl5O27xzPq9T/mbYWLolAk0DYmO5/85ASENEoO7mafLkQhc5fTTJONA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(136003)(396003)(376002)(39850400004)(451199015)(38100700002)(6486002)(54906003)(478600001)(316002)(8936002)(2906002)(41300700001)(83380400001)(1076003)(2616005)(86362001)(6512007)(107886003)(6666004)(36756003)(52116002)(6506007)(66556008)(7416002)(186003)(8676002)(66476007)(44832011)(5660300002)(66946007)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nV1626GhlNG1HlEiQG7GkvXP2+1rbteLOo8mE8YoN7eAWEs5J2bN6Cwpaprt?=
 =?us-ascii?Q?u+YTeiw//TcfRGHTfIF4ZadIAyhFwGgxKNQuke88aYoU4WGBNUKd5bJxy5Vs?=
 =?us-ascii?Q?HgzoU6CBu2KV7SkKmENwAGcLTTNDRL1/VjvOdCcuOJIXB7FoNKjKUOq/bMZb?=
 =?us-ascii?Q?zNwV8BCktd98mN2TUtYo3UBF8yVLdNrffYB1E14+R2x6QCjQUqpESG22iHjS?=
 =?us-ascii?Q?yr6Aw20IgiETyF/uqAm5Ui6EQQ3c9+aqALQsX2ZBAXkqmIp5rZHhNxnY0343?=
 =?us-ascii?Q?YJ69e5IaKiY3KhuY6hDX0qt3hCjKkzd1UZanZ97DuPYCtUV71UyhWqFcPwU8?=
 =?us-ascii?Q?QSz+1xs3aMdJH3uLO/qCcWXFHMfAI52wtGuzJlw/FppZBYflSdo3/L9PAKV5?=
 =?us-ascii?Q?poiq2uapVaSdNQ49n/hSPAo9qulPPFHhrbvs9lsa3KM3xlGiuUPTzcjpeeJP?=
 =?us-ascii?Q?914hEbBSBfqofvJCgy/n972QbS2Ve2yfZpZAv6t0nu7yyW9G325cTcffNIvD?=
 =?us-ascii?Q?MEBC5Pq7QoP+wg3agzBl1kgiVuOPYl5legga1JLhC1MvGDkj2q2B8vt871Zy?=
 =?us-ascii?Q?v8t9a06WHeUrYYmqKQH9yehGoUPN90NoOJgx0wTrS3NGpM1OqBefV/l2QHbs?=
 =?us-ascii?Q?YATCMxmO5wimb5+Zg8SueXBUmUOY6lPNt4y9/NBOkU4rbwQh1rNQ+fstlHpt?=
 =?us-ascii?Q?e3lsiRcj4mff+m7M0zYRW4H3ZvxBhpFl/Zsw0QIANYCB5SY+bRlD+fbB+UyQ?=
 =?us-ascii?Q?PGH5HSGS7y+9fvHCmVMsIxpom9Fqvjmo/EQoU/BJNEXFndzin+9Ba9KRQTl+?=
 =?us-ascii?Q?H5cRvZtGd153aqr1zXWcjJyJdhwkpfrrxLOV82gYd9LMMNN6SBA5aTqKO5T7?=
 =?us-ascii?Q?OHckIny9/F2VZ3Io3NIFZ1mkn8e102cw063n1HugzU9TP1BlN/WceUSe21qc?=
 =?us-ascii?Q?LsQF+bPprUGudqj/AivEQHmj15sOOi7IikrQ1IXJQZV4++suWA2hHFkXXPLy?=
 =?us-ascii?Q?+eyaNNNjcZ1Kcpxinjs1L4uDolVzvi6CPBFSLpYaY+0xM5+gvu1VQmmzqBYc?=
 =?us-ascii?Q?Ap+i44Kzn1bRIdeVuJb/RPxxakK2SDRhi12/9ynoOzvL7kfoluydywmZznzw?=
 =?us-ascii?Q?AvraXdGOIF1XGQ/f/2C/AdvAzecRIupgA2+yJoBQfyoaFW0Sby+67cH0Ueaf?=
 =?us-ascii?Q?8ZYdEN4CdohyqWOlMO0DjBbOUxJT+lAMA3DdFhNEGNRqF/3jCBasHWya0sM6?=
 =?us-ascii?Q?4LUIKxRpKE2xtdsyXAol1WSOmGVp+r6CJj0YX6xaTBD+w0QTOwSj8OiGCbXZ?=
 =?us-ascii?Q?Mam0tbg/fG3wc4t/gJZJXGay7AbvBk7ha4BK9ZoFoKAQ+hnw9w/N7ieTlVjj?=
 =?us-ascii?Q?EAf5mPyGgFiXaUoZ1LKOH8PXruz8c5CtNRI5Z57Fi3yLiLANy3l06C520H0B?=
 =?us-ascii?Q?tU67QJPcqnA2ktLon65dd5UxCnFuJfSeTqntEfK2Oqlf/G28PLTdFq2RLBhX?=
 =?us-ascii?Q?GcFDC/p0izLCN+Hf8O5dXBzOM99APsLYbi3bqse1FFLSPl4KhXqniApkAkrK?=
 =?us-ascii?Q?QPyNHCv9wAj/9tL/mkanQ7SX4cwP2KrCEpqjpkBs/OOBzv25yZJt642OtOAS?=
 =?us-ascii?Q?M/bzAJNQAD6NLzRzgvX8+sfHTFIoD33NLdVsKjIE4rWhAbOxO+EN/iYr5T2h?=
 =?us-ascii?Q?y+rrxg=3D=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c026ac-92c5-4319-1e63-08dad2db9245
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 14:02:52.0801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RY+Qr2Cw3+O5Lc5GRNOb+4pR4JN4tC4YHntdidSw21JTHK165xdIxVSAlDIWubH4gZ4o45k+mEJ5AEgD0NB/X0qjgm/ViOd7kH3l2GCsAcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8695
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
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 31 ++++++++++----------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 105a548d0abe..94fddbf70ff6 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2246,7 +2246,7 @@ static struct vop2_video_port *find_vp_without_primary(struct vop2 *vop2)
 
 #define NR_LAYERS 6
 
-static int vop2_create_crtc(struct vop2 *vop2)
+static int vop2_create_crtcs(struct vop2 *vop2)
 {
 	const struct vop2_data *vop2_data = vop2->data;
 	struct drm_device *drm = vop2->drm;
@@ -2371,15 +2371,25 @@ static int vop2_create_crtc(struct vop2 *vop2)
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
@@ -2683,7 +2693,7 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	ret = vop2_create_crtc(vop2);
+	ret = vop2_create_crtcs(vop2);
 	if (ret)
 		return ret;
 
@@ -2697,19 +2707,10 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
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

