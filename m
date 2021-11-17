Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951F8453DE2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 02:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB1489E36;
	Wed, 17 Nov 2021 01:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2118.outbound.protection.outlook.com [40.107.215.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A49F89E36
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 01:48:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEqWuqFR3l1e+6saFj4YUyQFQ1lBYzQYIO/umJOooMjpDfm80notCYwh2QERlH6KeScfZMpUyFst+MZySRq6XTU0mC+pOsDOJc4jevHcCC4KK7MoLtul8kPaNBgXyrs1rXCb/XCnzbKN60l99w+5E/nx3mNFyimnNY1NNdD3Kqotu46iftlpVAxkFT2O955xHi5sKFGGVE3+xy1vSzzrElkLBGlGlTPS1pr9CI8wjKMnIbsMjgAubKG/2hkc1HDo/6i0sASNW9WmVLN8VhKC6S7/hNRMRAz8G/3Sc97kVAuQz566QH89uH+IZ4QpO+vQLlrf4aWepxN1tZBIPvQHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prPawOZRd5bkH37BLxibNBJpOMzugeaN2ZNnNfaUYg0=;
 b=n5Eos3p+h4bmfVkLT8/1HIgZ0ldZriOP1/p4IG+VQGmgYGSTKXbkxQ9cHaZntDbUddG5HxyhnYtaAd3ggC09xbMYY9K6v7tvhBU+OaU/4uQ5BkyOnQf2+KBJawk4Tb9HmjdD3LYgmKmcKRnNDwil6E1q2MNE2QfxvEPtHnmeKe8rlh8inX7P9m/g5ofn0HhXsR/s27BRciuoWJnCODMSRCKwioCJlotXhB3K7aeC5nPBAdZGZyKXXXatSDFRMLBnGpb18uDB5TYcFvJNGVa2usidy9ZuRfVchP53EQJ4NHiLDmzRkz+zXmhZEOuQcmwl/gfWtrTzIdldznI5O8vNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prPawOZRd5bkH37BLxibNBJpOMzugeaN2ZNnNfaUYg0=;
 b=Fe6vKhb13+mUbkCT6cPe9oPNC88D2AZ+Ii8UkZXx/GXr6QZWthOY6TNE/q27FY50872hBO2/BL0AF+V66/jrfEBjDNpkK81rXBTX7uPiq2wmtHEszPvVTaiH5VvjexC3sqbNESLlXsu996Us5lX10roZrZzsTCQb0w/0TDNtvYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PS1PR0601MB3691.apcprd06.prod.outlook.com (2603:1096:300:7f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 01:48:44 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385%5]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 01:48:43 +0000
From: Bernard Zhao <bernard@vivo.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Lee Jones <lee.jones@linaro.org>, Bernard Zhao <bernard@vivo.com>,
 Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/selftest: fix potential memleak in error branch
Date: Tue, 16 Nov 2021 17:48:28 -0800
Message-Id: <20211117014834.36999-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0117.apcprd03.prod.outlook.com
 (2603:1096:203:b0::33) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
Received: from ubuntu.localdomain (203.90.234.87) by
 HK0PR03CA0117.apcprd03.prod.outlook.com (2603:1096:203:b0::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Wed, 17 Nov 2021 01:48:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7067561-5598-4cad-5d33-08d9a96c6306
X-MS-TrafficTypeDiagnostic: PS1PR0601MB3691:
X-Microsoft-Antispam-PRVS: <PS1PR0601MB3691F0BEE6FD79614B54FBE1DF9A9@PS1PR0601MB3691.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GhKe4G/vtjQBccwrWDep0RtzpKNYmpuTtO13fUv4A59LORLdYscuZy5sMJ+qNLU6PFflmDCfLl16serqH0aksee6uJdoZpbkthfPVXOFU1O3EoTWKe9bVL8QtIdjK7F5Xqam0CHnrRHfpxHZwnI9Tkp+T5eQBu/gn345uG7qR6iLE4TxRGDAvbosKAG4NC0qYiRvUQI80n6uaSV9fqZDDlSsGIaFBeKS/9B8syAiAs4yv++8dKnqvp0K72HJkH+BOGWKskd2eFkl9y1tNr8os3l8XxuafUX4pVb2dzLjMm8+ukEOD0mOA2AZKo2+FMrfKeX56Bt4Jjbr8SoT9RUJ3SUsOsmc2SHmyx9W5NAE7wz8ijhMa+YbbkmmhgOVtKqfGNC2RVKyzqNLkZb9gx4Lrqy/wbGNs9+6kEKPmf/KfkrnuV3UGWMTPrXEEWKF8rlpVEVjpiNKgHm9qc9qBlx6YgGvnS4RmMkyqCBXChIHLZxVB14RoIchwSKm7FIO5RstFbIr6GLHBsYbld3g22Q+emxCku5s6/ETGepN1D1QAVTtoCkBKVoIAS2Yi2JuwKEMr4LTvC8X3+VLy8HgdQqGUE9LaYJS79x8km7eS5c/+4gkM8u7SV7p0cBB3pcU2OOG6ppE1OTaH635K2DH4PW7HWzYaLJbZFdn28jI3aKKenND79idajrJ/v+EET3pAvKvCn3c4Q7+QsDTeiXdajcZkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(6486002)(316002)(956004)(52116002)(36756003)(5660300002)(66476007)(2616005)(66556008)(2906002)(1076003)(4744005)(110136005)(26005)(6666004)(8676002)(186003)(508600001)(6506007)(83380400001)(6512007)(38350700002)(86362001)(38100700002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?baZVuAGsgprnYxqUHVTLy7FplaXR8gGD4FeroB7Zd9pawjqsj5MI6/P2feFE?=
 =?us-ascii?Q?PUKVDsu5T0AH1kIyGWnhSLuPHl6Fw3LroSylfTK9uixA/q8MJPUKi7L9BkKS?=
 =?us-ascii?Q?93veLL3a4+SVAvu1wlwSdB5zjjAbsdlkYdSk+fO1HXYdciqJuk4MJviUkz68?=
 =?us-ascii?Q?nYTRTe9JBstMs1TLp44rgni7FiU+axgqEDTAQEb8+8jhAA/tfXxjcbe7W0qs?=
 =?us-ascii?Q?gy0QM0Ej7SdKPkIwzC9cP277HU3ZobhVTFeC12dwkAbmiZukd5bHInusfQWT?=
 =?us-ascii?Q?U3A8WD5F7Lw8/o88LkyXVh6CkAT+WreS9gPXOK6ZD8piWTOw0fBabbNs4W5P?=
 =?us-ascii?Q?A1LBmg3i+0R8v4KM7xp4Odz1FQ7wpy2tsYHCltZc9BxuyqLvkjVc6joIUT30?=
 =?us-ascii?Q?bHkyNV9AdJ0/EbD+04YIhtZXJy97TRHVNGX+rNCN0k4Hp7NVrrcnUaIeUwex?=
 =?us-ascii?Q?Jp3NHD61OHF5Bi25eo7+saVJ5T34BeK04DXkzGpvNOI5gr5Z76roF8TVc+n3?=
 =?us-ascii?Q?s3sjmx6jS9d2QQch+xDGq2eJyl0paKI8g+pRtp4ML1ZGhdTJYle/F8WhCc39?=
 =?us-ascii?Q?o5SQapyBPWslrxq2UlzfM3DWR7MkP1Vm0izSABb7Bz2RIpXbCpEhB/dXWXsz?=
 =?us-ascii?Q?kT1Z/62XJdAF0g71VWcLUq/vSLUKF8yIhVNYbkJ7L+3wRB9GWzsaY3w57Xwv?=
 =?us-ascii?Q?AUEv8u5reWp8oc9Nzs2jjeRGJ8ciVAxZEa/HXfXU9tcLwzJs/dnaomFnfJvX?=
 =?us-ascii?Q?M3qHpFHNdMOMHIEbkzBOAzL64wgMgqhC8fVszBsyvBk3zK4JHvbpJVIQ7j+C?=
 =?us-ascii?Q?xBOn0klrR2o0WCpvtkIeEnjGWF7afyeVRvr2I4ddIHr6R/kq8DxwIaxssqLo?=
 =?us-ascii?Q?sn5G2d4uVvTJrbu/wNyAo3bxQvTW2ekXU8yqrdg68S9Bkm9GOq0u19GMzYrc?=
 =?us-ascii?Q?ckpQCfhnHha5SULgdoAflaakI5Mi9MC95JtHMYvlxFkMrWruz4YAMkVb284h?=
 =?us-ascii?Q?uHNFYu6f63LUH/6hFBvmA4bJwW/NnQ/52TYP5FJMdv96hbNqRxdby6i0CIyL?=
 =?us-ascii?Q?bIWDEDGcSYT74WCuiwPzFixGSOZEopO1YajaS0O3bqhbQh3FFlJ5qtrJZpjg?=
 =?us-ascii?Q?5536pQr5jPIC9qFbwr0tpyVGCni+rysU+I/i/WtyY9Z18JviLPotgj02MQ/E?=
 =?us-ascii?Q?o2PUSrMo7aWbbBaw8SxvblBbU3fuCnOgdNwUjtphF4uWP23UncYB9QYjgvKh?=
 =?us-ascii?Q?4r+cmJKtedWvIhHMozq19bBlyouw6v9HaEBliw8JoWmLlbO5ZrHrPqSSCSA7?=
 =?us-ascii?Q?7jblixRLsGYKG01VD4FYrpS+9+T9lUbdviqrbMdYhwI2g/jKGcHWIjKb8rux?=
 =?us-ascii?Q?cNGAgu7tEA7wdpP35spM2vuKJiB+7S54eC2PgR1mdBHA+RgvLjD6mwk6a1tU?=
 =?us-ascii?Q?S9pjPp4ppUzm02uLVB/A2EDPGuQQNnGdNW7dCIy5jL3ZrbGzsQOn+EyOVjPb?=
 =?us-ascii?Q?6lcsaIWHXWvkAdfvhMqlNaStKkedLN2oNfZX6GamSmFyppObCofEObpnDWcM?=
 =?us-ascii?Q?xrnE/DdsnVqkUHEF/IrxyC/YqTHNHsG9vVzJlBS9Db6aRs1egboHaDOcGH2L?=
 =?us-ascii?Q?kYSmoOqrMNcqxA6uPBIHt64=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7067561-5598-4cad-5d33-08d9a96c6306
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 01:48:43.5486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OoMUjoPEyfBMHUuQaOc5kwMTSKQYFI42bexYMmcRcPKjEOM1z46B4x8xpwzRgnhWz2M3yj6elaAmIzgHgbAMJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0601MB3691
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

This patch try to fix the potential memleak in error branch.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
index 6b4759ed6bfd..dbac073ed385 100644
--- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
+++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
@@ -131,8 +131,10 @@ sideband_msg_req_encode_decode(struct drm_dp_sideband_msg_req_body *in)
 		return false;
 
 	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
-	if (!txmsg)
-		return false;
+	if (!txmsg) {
+		result = false;
+		goto out;
+	}
 
 	drm_dp_encode_sideband_req(in, txmsg);
 	ret = drm_dp_decode_sideband_req(txmsg, out);
-- 
2.33.1

