Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0DC8BF97C
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 11:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670AB1134F1;
	Wed,  8 May 2024 09:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="k3384num";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCD81134F0;
 Wed,  8 May 2024 09:18:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+6pJtXiqto3khdnhVcFK07cFc7Tp9RaFEyVfXx8rToH68R9jmxPIROSMPMIV+jjwg5T/DUtYR/d7USM00gsnZNVf7vzt8hSdRNfobYsKkt/Tjrivad4dNd5bsysiHdwoqj8RYkMonypVfyZyvHaPkO3rtHEV7MomSX6fH8gAckeKdFxGEG+IX7zv9zHFASej0yEVP97j0IlN5CjfP8VtsRsKdxDaWKKDqIa/P0tZvk3ei1H3T+pB9ESjozPELoSyBbfGUTtXpmyDHD6WZukHl0XesRSpHDyj0AzGDmJdG4zzrxgWZOrnJSuvvJsmLx7iOJMPpiwOJ8nwGEMVC1vIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQB9/+jg1Bs2CI14TO/laXC/4HAg9S3POaQr+xhNlXE=;
 b=aBsdj3b2D+Ni4lFKQm1QwduxEZldLaf5SAulJInpUEjWd7ozVvNAe3H6z2tBxSqq1BeM2qjYNvTbkzwSRk/wAItUBgR3geg//Eo5pIyhZV/qf1a5q8y1Lvd2qnU5MjHrRpaLADJR2QdxBOtG5kiebXf+Q1CbJvil7BDOw8+hI/MvUa9xBu3sJTn7NUTF+9xW9efybe4MqEi09MI+Vt4VRs57bGjgsmBLH7Vd1dz8uRFrT/0VJMAhRZHDHQ8HW9uVKEIjfeIWJ5Gn0qEqonD3Hx3maRtNjsL5UbPTjqJqbjUuD2qi4SqFISAzasmJfaywZPN1EBy3BqTDUqz9Z+LTpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQB9/+jg1Bs2CI14TO/laXC/4HAg9S3POaQr+xhNlXE=;
 b=k3384numg5GUu339VTIKy81gveNSY7Uci48ljyvUNQNRgPPiIHanbMvJJyA0QGG5a8dY2+8EPddFW/ChJwQrqjyxEbZcJDiygz9kmmPunxx5b0ytO4C/T+3uAOILEjsknIwAyUCMQBcxH8sBraJgSpmLXTaxRZPW6cchse9owwbDcMFTSgcsEOyL7NevnGsw2aTgMhjoJAbZtoOpdeN2MSd1lR31/SpdCgU3aeXAlFHtAcmfLnsxIwg3HWHjoB1VLGjWVdeXgj522qnGO+V3+z3GVXmBlzBdbhEcX1n8Kh3yrMagl7rfVogH2zAZ/ZTMU1qzUZ8sY6q5OEr8ioNAjw==
Received: from MW4PR04CA0288.namprd04.prod.outlook.com (2603:10b6:303:89::23)
 by DM3PR12MB9352.namprd12.prod.outlook.com (2603:10b6:0:4a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Wed, 8 May
 2024 09:18:42 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:303:89:cafe::5e) by MW4PR04CA0288.outlook.office365.com
 (2603:10b6:303:89::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Wed, 8 May 2024 09:18:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Wed, 8 May 2024 09:18:42 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 8 May 2024
 02:18:26 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 8 May 2024
 02:18:25 -0700
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 8 May 2024 02:18:23 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
 <jonathanh@nvidia.com>
Subject: [PATCH] drm/msm: Fix gen_header.py for python earlier than v3.9
Date: Wed, 8 May 2024 10:17:51 +0100
Message-ID: <20240508091751.336654-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|DM3PR12MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: eb34d998-5700-4cde-cff7-08dc6f3fdaa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|1800799015|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XeoF4xTLUJ9PP3osw973EMcRXxHm8sHbIEYZb6CZD+UpQirkM6yTdEeKn655?=
 =?us-ascii?Q?W2z8k6gljrS2Yud1Ti+ZcqtYJUhaUKwDW11PyDK2idrkKjg72F1ycgoR8lvc?=
 =?us-ascii?Q?tf5O2Tqy3YqIihgvvNslJZfEQTRBApDDckdxvPBM3oJ/vZOq/jPL2gZk1CnU?=
 =?us-ascii?Q?xahXm6BzYHRtyrXCBABavChCeyUOXIwR6bPBLQmF6trb0JQyznKVHW6+d7Rr?=
 =?us-ascii?Q?RVN0ocX31ZAi9gznkwWdf6kiey1Ag3uLBS5fUMwTUX8pCE4O4eIMKZrdjyLd?=
 =?us-ascii?Q?ahrWGiiHiEyYOJsr1KiUy5nNYP3RRsUPEOG+OQPfSTs5+pcZE5DSK68eTqOe?=
 =?us-ascii?Q?X1ApilW9fFWAQcHaM9U461TQkDYLhXcay/p9hLfhlS6cIXY/6vY5+UI6YDNu?=
 =?us-ascii?Q?eXrr57iPjp4fD5kqGArXtI31J3LLBkCEdk009HfuxGBv/pa9M+trxoV3/J4g?=
 =?us-ascii?Q?XlYoFGsJNvMQtWWRkwHkFX7tYTEjqS6T40xu88o2HdQ6cWk6JT2m8n7nUCUM?=
 =?us-ascii?Q?CGceLvcfygnaGJGjJWnuq8vf4g5azVRlCCTFgdhBXT2GKozFS8EWDprSViPd?=
 =?us-ascii?Q?kwCNYrR+l+EyvtPb2SzLvImACURHJWQ4NptFA7lrwVASRh/8OtUDuCWS2I7z?=
 =?us-ascii?Q?j1JVCh/3KQ9sOjEr5ZowUS7lhHDJ4IIOT4X5iZcyfh9PTtDtmz9m04SsSmvG?=
 =?us-ascii?Q?MH6qGmu7G37VwKV4s+Z6skJRA0KiCiEPa9SGw13+jbhH5y11nqYhBGvhaqgx?=
 =?us-ascii?Q?jetNvRAvvuWnRshmy502ajnizmTeDzSLOH6Z6t1QHDBiuo4bv/3ZbrlrrgQR?=
 =?us-ascii?Q?vq6+x4bXbfYVrYwsmUAmSrMdirRtjoUoSU/Po0DoZVF4ULqzeMOLyDY8AV38?=
 =?us-ascii?Q?Kw8q71ShJb4pTIn8ncOjIQwe29D2Q/9G9LmXOuN053piyyo3F2Q+b5kdlqCH?=
 =?us-ascii?Q?FPUDh805kfBVM69SSsrXadZBWSK8lzZ4H/OFVXkvvPRj+Dd5hWDEbUiEUtij?=
 =?us-ascii?Q?7EF4lXVfX5k8TjaPiIAGBgVCX9ZQxbqsmKdSQhJ1nwALPzdM4o6KFwwVuIxM?=
 =?us-ascii?Q?lhvCWNa7M4UUartkRSasKRkHVDZ1U+vJzj1zRmae+1Yfq5YQCypDFwSxA1RB?=
 =?us-ascii?Q?5nt1oNXy8/R+ii9kf+wTYlq1GJyj4OevNJ4qGCj3c0SEWEriQXeTR8rY8chJ?=
 =?us-ascii?Q?QpvnWfZtAIdvSQxVaAPF/KDHu9mCFt7fGRN1ibZnmnMLcAoFWVGtqCJ6sm9v?=
 =?us-ascii?Q?tei/mAx9USqV1zFKsviVh9OldG4raqOvIVwoqlblXFWhA3wHSsHcYPYJLP2I?=
 =?us-ascii?Q?Z7tAmGQ8AXWvZAkHpu3zCNFpidCo885Vx++F4CHCMwYVpv0s6Z7OlW3a6pT5?=
 =?us-ascii?Q?Qc8dWNf7foBurvpheyTp+O5yrnFA?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 09:18:42.0324 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb34d998-5700-4cde-cff7-08dc6f3fdaa8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9352
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

Building the kernel with python3 versions earlier than v3.9 fails with ...

 Traceback (most recent call last):
   File "drivers/gpu/drm/msm/registers/gen_header.py", line 970, in <module>
     main()
   File "drivers/gpu/drm/msm/registers/gen_header.py", line 951, in main
     parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
 AttributeError: module 'argparse' has no attribute 'BooleanOptionalAction'

The argparse attribute 'BooleanOptionalAction' is only supported for
python v3.9 and later. Fix support for earlier python3 versions by
explicitly defining '--validate' and '--no-validate' arguments.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpu/drm/msm/registers/gen_header.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index fc3bfdc991d2..64f67d2e3f1c 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -948,7 +948,8 @@ def main():
 	parser = argparse.ArgumentParser()
 	parser.add_argument('--rnn', type=str, required=True)
 	parser.add_argument('--xml', type=str, required=True)
-	parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
+	parser.add_argument('--validate', dest='validate', action='store_true')
+	parser.add_argument('--no-validate', dest='validate', action='store_false')
 
 	subparsers = parser.add_subparsers()
 	subparsers.required = True
-- 
2.34.1

