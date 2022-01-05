Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E40DA485248
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 13:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1972910E7C1;
	Wed,  5 Jan 2022 12:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2127.outbound.protection.outlook.com [40.107.255.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFFB10E697
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 12:13:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiXAmURp1jj3a9q5vdC3vZdrbTcr6QQ0vGvoxYPiOcVsFVxPDTo3WqXMgkILpe+lLEzZpVJ3QhajOujwo58Asb2pEn7Y7LB5UPKjbXKhMR6mU9c7ObHdVr3g6QUvrRZG4vJR3K73cm5/kyyTjo5taRm9XQFRzSivoliBE3erLgdPlRe12YiGtE/P+siWdkVZeG1CWT48eG1SW2mJAnUC02pB5laIDSwxCVNX/yrZGIORVgUqEzh//5kTYJjSU7Hitt9RFcqg5hauSILD2U8pam0sGEiKHN7vaY+jOtqYLkom3Eecq4iN9ICSnZ/9IFPP0v3Bmciaq0NJKfviJzoV8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rc5zukLYpQq+2DxmCZgzPi/LSGHsArMkdBGvro8G1fk=;
 b=Y+O6w606hGDt2SlvqRCOX9SqW2pt3QYpC48Oz1GLlY4o8prr3ncz83wWwvas4yXKzy1njIh9kEtxbSlwo5X1IO+ZFiasJsbdFUgAgpd/2TvlhkcyYCGejX/9oDrMjGKkF4NbyE9exF6xoVV6I5xY8LSEzcePhE4eiRRd/N+B8xA8enYKpEB8rB63Qdo1IsAvHbAkYALkrBXoNzhnslj+BlIU75lJ4V1GBMrQi3a4EuvdnoBtxPqDDPHa+h3M5a5n1LFmk6EzqOQ8IdAfkEmMxgsX85iVTqebFLgWiXGqlSQ3W+dlTR9nK58v9K+6HnHw07Yc06yXa+hgvACk3mKUAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rc5zukLYpQq+2DxmCZgzPi/LSGHsArMkdBGvro8G1fk=;
 b=h99qND1KyhgjBov0KEtapT5vQ78wA38fTegCg0zEEIqJRZLHc8zNJYuHXdd9GbH8QlnQB62rXiqumx0g3b8dHiISTxw5M5LqtwsWCytJfMzzd9rCswKg6Bu1upCeZ2udXFCVK1Xyh8ikVboMdHoG8E6pPaPuF3pnpwufD3cWqCw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PS2PR06MB3608.apcprd06.prod.outlook.com (2603:1096:300:63::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 5 Jan
 2022 12:13:39 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::81a5:768b:64a1:b284]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::81a5:768b:64a1:b284%6]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 12:13:39 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] gpu/drm: fix potential memleak in error branch
Date: Wed,  5 Jan 2022 04:13:25 -0800
Message-Id: <20220105121325.15188-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:203:d0::28) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb7b8b29-31e0-42f6-5b0d-08d9d044ce76
X-MS-TrafficTypeDiagnostic: PS2PR06MB3608:EE_
X-Microsoft-Antispam-PRVS: <PS2PR06MB3608C6B45640DDB78CF8AD6EDF4B9@PS2PR06MB3608.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BMFoYqBUuoIUedVBg7bfThV+A0MbaiFPVvELzlvktvsc4fzOWWVol2+vZ1tGEUxxCznf7kUuHZejRVUzRGzbl6J0O11MNy0Kq7pn16vT/c+rTc699sth2VTJpEshCEI5/2u6oc90P1Xdb442M//p4f997+dRgzyXO/PbtDjoLqI90UU1qtsfT0L2X2XEdVGrxoULaSdOjrkQkIsjb6guU6Xo27evIkaWgw8v66cjhx2ftr6OIkbfkUeieas/kUkr0v+VGHYg5S7V223iiBAsWMPpyYJ631wyCvg7uMO4fEFJSVyc2caTKzXD7TL6T/BKAn4ixOkPqLuPSfeP9yAXBDBQENcO1U9xgpN2bteSimZnUiv8ZGDO/jpCox3v4svS28jxKUPmGdZgE/1QLGwffjCAPTpmcGPwga+JrN1J6RceHSvxWnQv08vIHpQlPWgbCNpsf7A6R3ekUc8mrveO2T/YYitWL0Xb8FWEbfvwYE8vKKT3Mnrrfe30NL91CkmZnaU3DWg/MZ31eb9H2eXSTg0OCPl3btPx05+4Jhv7+GKU45c7LXFpGGfNF14E+nOYnXL96o7nu5KRrfY6FTHYcVmx6hQRnrughHwPXRfSurvy19339gCwuLQHlgQf3oUV3oooc+5eYO/gLMc44QJX8it5vVva2Dl3onmWGdKHFITEPRpzkjjM4e271jh0bNonUNg1gNQPzP2FgRPqrRIvdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(2906002)(38100700002)(8936002)(38350700002)(8676002)(26005)(6486002)(6666004)(2616005)(83380400001)(6512007)(110136005)(4326008)(508600001)(86362001)(1076003)(36756003)(316002)(186003)(66946007)(66556008)(66476007)(52116002)(5660300002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ch3o2rJro/+SfCCwfyytxYmP8zGPquKJRFHMeo+oi6tyPNRHRRth2h8KISe2?=
 =?us-ascii?Q?rK+XMPFIYssaMRW4kMqibGtMND7K5MEJaOkalsaKhbmQGo5nRuvRTIqBh4ya?=
 =?us-ascii?Q?dkoxaKDE1Xs3/AdmkWkvo8XOnYlj8tKvaOD3fbSWPG018N1eYGfAI+L3VWPZ?=
 =?us-ascii?Q?6LMJx3PdLghUMoSgEgQoXu7mbxPJK402zOUjtHR0roWq31LwfNoMZ64v7dJh?=
 =?us-ascii?Q?bmNDb9BTfVlosxO6YMKWxr+Recp6tvTkgEU8UfJc/e7f4r7zvsdCh5Y8jMGX?=
 =?us-ascii?Q?vR+dq3axvsycydmVwvP0S6AawORvXaLhTbQlah5XtID8/Grra4UhxVqSA0K3?=
 =?us-ascii?Q?QDzWxbjxz7dp+3WMIh87WGE0NCeCuJkPGz22lIMR8jXv1MZ3ZNkFWFHba8c7?=
 =?us-ascii?Q?xvftpnKSvFH+57krKrhfyTgG7BoTmX6GuakO68SACp8+Nf++nyHUbMCdGro+?=
 =?us-ascii?Q?Qnmhqy1ypE2xUrSCzRoKTTWLaIZA+4VmuPs2+9oqHWLf5s9VzVL8ctHv9UNX?=
 =?us-ascii?Q?W0JyDrN0Aydlh5SjjUsJFB9PvhHodLLmaUhtdmsMMqVz1ewhcTcJlDlbAccP?=
 =?us-ascii?Q?cefzyRF713xf+MpzrFVFnkLdAnpVXhapN35wAbkTzCVIWZxdFsh2f1ouylyR?=
 =?us-ascii?Q?L+3RnitDSq8K63kNEfUsIZKGAA2cHqqQt0qtZAHZyYghDrppqsgTHMSxEc8G?=
 =?us-ascii?Q?dCzCvyFhRBcaHx3cvFlkM6mYxEAex5yA2JGwWnhGrNd/pmMncMgdVwAxbU6M?=
 =?us-ascii?Q?54iRlbqFaftZ5QUJAe/+RmSkwklH/wztMZphSqOJyAwyxD6op008B2hvc3GB?=
 =?us-ascii?Q?vGgdvTV5ResMlNd5dznpObA+3/TyJ/JncE8KCXlnzdAAW2jlP6qQu0TKVqZT?=
 =?us-ascii?Q?UegKtot8JIXcLYjrtC+6ozIE8M4Yl/OxT0dqsn19zp0eZMHoaBCqMKcOYv3o?=
 =?us-ascii?Q?6bYo/A5RmFewF2xNBfytFG3quZjD7RZOgTUC9eiE+2L3xeOUJvu8+fhbbMf2?=
 =?us-ascii?Q?D5H/eyYI9kMt/EL+wcmHnxEOxol+u/sV+QNKz+1cNALd5QDL+a0bc63pPTCY?=
 =?us-ascii?Q?h1S36vCRBGWMcKV6QgrbGYVm4xnexdmkslxBZTdhm6zVCjo0t1CBgNr8G10h?=
 =?us-ascii?Q?sJiULFJnW/854LZPbnfSyK5oQNGLSFmRPvBRGv8Ki4eL/KOwYwOMy+g/fcq2?=
 =?us-ascii?Q?tkcBntPw8+EpiFpjBNHbC65lCtnewaNxPLDYa3/gaMxCmIpF16ET+YGguKBk?=
 =?us-ascii?Q?P/1ZeOWXvjqhC7W75ld+1pyGv2pbH261NKqXMMNYI61fA9UUd7VvCzrhe/Dh?=
 =?us-ascii?Q?3jNABeqRHrJYos/twSHcgiSaEvZaKPmEj43OVvAptWZrcJdMni8MvIUI9OGh?=
 =?us-ascii?Q?lovd35O/O8ucdh92k0KI35Rwx1QBMTustbz/ZNDybNHWLcTA+YYjl9LhBy7u?=
 =?us-ascii?Q?FE/K/BojKeU/hT+rvBGfcZtokTupnjpnGOPugEpS6tFudZVUNUO47NSrDSoY?=
 =?us-ascii?Q?jA8R2psVG363gDZjA2Z9f8a/ICbH6SMFbp5SswXUmPc5EOxhzevIxOGlAueh?=
 =?us-ascii?Q?1B0jIpd5Pf5F+C7T5isoOgluXegQfVTJEBf57yfGlew2mMWrjAp8cWjHSLMd?=
 =?us-ascii?Q?EVQioBcFWtR1+9ft4AIVmcI=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7b8b29-31e0-42f6-5b0d-08d9d044ce76
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 12:13:39.2664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMn194agimTTnZj3H/8b3mMmOtxywq0MTAycdMtNmVG1887KcgORkbk2kpfDw/Pl5/sNe4d73ujlKjPtWWKl1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR06MB3608
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
Cc: Bernard Zhao <bernard@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch try to fix potential memleak in error branch.
For example:
nv50_sor_create ->nv50_mstm_new-> drm_dp_mst_topology_mgr_init,
In function drm_dp_mst_topology_mgr_init, there are five error
branches, error branch just return error code, no free called.
And we see that the caller didn`t do the drm_dp_mst_topology_mgr_destroy job.
In this case, this may bring in the risk of memleak issue.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index f3d79eda94bb..f73b180dee73 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -5501,7 +5501,10 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 				 int max_lane_count, int max_link_rate,
 				 int conn_base_id)
 {
-	struct drm_dp_mst_topology_state *mst_state;
+	struct drm_dp_mst_topology_state *mst_state = NULL;
+
+	mgr->payloads = NULL;
+	mgr->proposed_vcpis = NULL;
 
 	mutex_init(&mgr->lock);
 	mutex_init(&mgr->qlock);
@@ -5523,7 +5526,7 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 	 */
 	mgr->delayed_destroy_wq = alloc_ordered_workqueue("drm_dp_mst_wq", 0);
 	if (mgr->delayed_destroy_wq == NULL)
-		return -ENOMEM;
+		goto out;
 
 	INIT_WORK(&mgr->work, drm_dp_mst_link_probe_work);
 	INIT_WORK(&mgr->tx_work, drm_dp_tx_work);
@@ -5539,18 +5542,18 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 	mgr->conn_base_id = conn_base_id;
 	if (max_payloads + 1 > sizeof(mgr->payload_mask) * 8 ||
 	    max_payloads + 1 > sizeof(mgr->vcpi_mask) * 8)
-		return -EINVAL;
+		goto failed;
 	mgr->payloads = kcalloc(max_payloads, sizeof(struct drm_dp_payload), GFP_KERNEL);
 	if (!mgr->payloads)
-		return -ENOMEM;
+		goto failed;
 	mgr->proposed_vcpis = kcalloc(max_payloads, sizeof(struct drm_dp_vcpi *), GFP_KERNEL);
 	if (!mgr->proposed_vcpis)
-		return -ENOMEM;
+		goto failed;
 	set_bit(0, &mgr->payload_mask);
 
 	mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
 	if (mst_state == NULL)
-		return -ENOMEM;
+		goto failed;
 
 	mst_state->total_avail_slots = 63;
 	mst_state->start_slot = 1;
@@ -5563,6 +5566,13 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 				    &drm_dp_mst_topology_state_funcs);
 
 	return 0;
+
+failed:
+	kfree(mgr->proposed_vcpis);
+	kfree(mgr->payloads);
+	destroy_workqueue(mgr->delayed_destroy_wq);
+out:
+	return -ENOMEM;
 }
 EXPORT_SYMBOL(drm_dp_mst_topology_mgr_init);
 
-- 
2.33.1

