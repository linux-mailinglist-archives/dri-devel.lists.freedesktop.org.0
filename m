Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E3764A6EB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95D210E264;
	Mon, 12 Dec 2022 18:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC3810E262;
 Mon, 12 Dec 2022 18:22:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6Utqv38dCuO/MBxcThpotutiXyWFuy//UAU0Hyiph0G1TYK8/eyoNjZKofn+CAVVNTu1UQWgq5CxAV5zt1FtC3VNt/W8O1JWPOxdJfpV2x9rPthDbjChtz7M8E5f3v6Qpf37zAIj8uLhymxrFOOxN57g7IV0PZC7TDnes+BvkonyrQSR3EpE4DrEF38CS0GCumMtAB0ygjIpprBecrkMWwg96ptoeuQMyUewORvXBVEsjui31ZFUbJiY2ZtJO6v4WO0Q/N2N1Rbcqi+0COiZL6bY7qpao427vRzI+W/VCIB5zbj1a+uHzRQONdG9Nac89Q6KLI5PQXlVUuuDhGKqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMDRUuosAz7gnr0jDxOfRPO01DL5ySiBYx7Kb4cJ9z0=;
 b=X/d8PQENZAPYR/ChaddbzcqD5Ne0Q7dN7YQv5ZDEvmhG/3fmNf1m39R6tBFIMx6APFtTpHrIqjLd/PYiVu7sWMnD1YcGsr939sVQmKqXob8EcIe3ZvwTLs2QUJjXJB/DyQ4hEGbqQSaSTqGnBjVd+YpHVrRdBE6+tpZlkMI3s+IfGYRnp7UOkYMDk1fsxLDtquYB670G238xUQ/s97EysMJFwEgFTrGXm695kTYj1r+sggRdt8HEkzSUgxXmGEJKmkDY8d3jsEeXE0WKsTjWZEXKFSFbXThLlLnAqyyaGQTMMX0imVsjqpl1aeQDMXFW4tm72lkLpmvPwFnIK7AjDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMDRUuosAz7gnr0jDxOfRPO01DL5ySiBYx7Kb4cJ9z0=;
 b=swH/Kwhi7XUSEw4bPBpjO1J6I4sV5IdCqzxK40NoJR81icbODI7taTUYdOnnVKfbHZm8nmCYsrtTVoHLKa951mkxxIAKLD87jcvHSNS1+fP7P06vv6+I2P2cwVqq6omXLgcSc7fhXaseNHyKn51ZDMlvb1ziZZ9MWEGkxv0iRkw=
Received: from BN9P221CA0023.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::11)
 by CH3PR12MB8332.namprd12.prod.outlook.com (2603:10b6:610:131::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 18:22:27 +0000
Received: from BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::5) by BN9P221CA0023.outlook.office365.com
 (2603:10b6:408:10a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 18:22:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT113.mail.protection.outlook.com (10.13.176.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 18:22:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:26 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 12 Dec 2022 12:22:25 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/16] drm/amd/display: Always set crtcinfo from
 create_stream_for_sink
Date: Mon, 12 Dec 2022 13:21:33 -0500
Message-ID: <20221212182137.374625-13-harry.wentland@amd.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212182137.374625-1-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT113:EE_|CH3PR12MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ef0817-be22-41b5-b2dd-08dadc6dd265
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dvNzzgxprRSXKgtGnjnyWr1O7Bu688IoRuhUhaFQzM8hb4aWAzOZXIDVJjIgv8fzp1riqsq23ZShWmcx6XrVKgGcQLNRdpMscqnZ21lINL6H6CIZex1KT4wt+TsJkviB3ofo8aggu5qW9mkcho76+ujXCXZ3Facj0MSXhTft7KeACloTFzJxteg77GYQOHu5TN1ORzftiFmLewivAfs0RyZ5jz6o+7HZYKCw+kxQSeU/WZaIlMMiZk/l3SINgxh0NkiKOHemCaqNrX/a4TbuBTnIa7LPcsC0oSfF8HUmM6Ec6T7uzPaV4TUbEWHyfXvFMAHeyPnXLHnZVmzVT6gR7d4wiMnSzTrEX6MXadFByKkpqTuczXG4G+vZ79zMDO6f1cXgsWHvoNZA348jR9m7zg8e1N5jqgT/i5+I/HozCYKCNHETQn73CRUHPJDONKdXFNglBCKGnAnkxks5MyTfgbyRRnA6btocf+vQX+ERmKXNNHCV0vv8eA2geBUn1AEcwJYBsNCQIwWsDNYOGAYPoR3cCCzq82BakJAdeCm0o3xqFDwsQUCWHp9UUMNwX+nWtAVtDdB7MAOJxuqAs7C2g4Y6RViAVvObO3JPpLYGlYbyhEHK4Br+G2SQrMJP+1XnLAj3jgofORGgK51FxrLHJeZM1wjCpbxNFnZ5Id/DuDlKrQZbJvmrfHYpPLbLWCsfxGImd2euoayMqA2BLJRXlDXrzmc9+T+dsivvr1xlOg8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199015)(40470700004)(46966006)(36840700001)(110136005)(316002)(54906003)(7696005)(8936002)(70586007)(5660300002)(4326008)(8676002)(6666004)(41300700001)(26005)(36860700001)(36756003)(70206006)(82310400005)(86362001)(66574015)(336012)(83380400001)(186003)(1076003)(2616005)(40460700003)(426003)(47076005)(478600001)(2906002)(356005)(81166007)(82740400003)(44832011)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 18:22:26.5304 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ef0817-be22-41b5-b2dd-08dadc6dd265
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8332
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma
 Shankar <uma.shankar@intel.com>, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joshua Ashton <joshua@froggi.es>

Given that we always pass dm_state into here now, this won't ever
trigger anymore.

This is needed for we will always fail mode validation with invalid
clocks or link bandwidth errors.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8cf5a44d1d15..5b347f8f4193 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5855,7 +5855,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 
 	if (recalculate_timing)
 		drm_mode_set_crtcinfo(&saved_mode, 0);
-	else if (!dm_state)
+	else
 		drm_mode_set_crtcinfo(&mode, 0);
 
 	/*
-- 
2.38.1

