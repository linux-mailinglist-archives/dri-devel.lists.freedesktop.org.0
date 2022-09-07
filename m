Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D395B0EB8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 22:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A0910E895;
	Wed,  7 Sep 2022 20:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A7E10E885;
 Wed,  7 Sep 2022 20:57:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUGDZPXmsc7VDxBeQe4Y6qwTSU5+a8iSRYwSBZgEPCqcMuSI9JFPrsRkEQJkLE3hz9FUwcsujlijypiAJEXx2upv/RnkwRu0AfH0XIrxKh7b7WreeqBesFOYkA7UkO8NtV9Icpv8AJNu+iNRVYnnoTgFL7Udagq8Guy6aP+50bK9ozs6dKuK6SNBFZbGsnolJQv/N3FU0W04hM+LkJ1Xk2HtFZT+l7L39WXR/UxOeCvTkvs9K7Ivq3TVpe4oJ1p1FsxPrPNaQ4W28fB0DILCDSIZkwut/pRdBToM8AncaKwyP3lEQtahsJ2KubLmp2HihkdAkm3jgsOTdVJ6hlJRPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyHwSeYVAr47BNMfu2EAzSms/H3ZylUlJ/1SlTxTTuA=;
 b=H48EkAwAOMgg9CNcmZc4bpbNUTL8wwN4KONtIlydsJS51Un6KxoG63GU37octnPMzgbbtK4928NdAOcd2rTs3vR3rHNJhS676VH3Wq0e5COvSxvOEBfUh+heHqWGQ9c4o88yLILxpeaHZWxn9jrob5kJdpCI/CTf6GNCLdy6+60AFl19RnfRb5qSC/g67mh7Hnx/nvE3HATwoJ4srv6ZgTFp4rW8PSh4+pb0c2LVgjUrSfqXDFjQu0OsAVOF7y9NtlAdMmXVTharAYwtIga1Uz9PAR1lVzqsVE1k528nKEcv7JhSvqTrhS8Sob1sXBCH8OdSfbAl67Rov5p8PPs2Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyHwSeYVAr47BNMfu2EAzSms/H3ZylUlJ/1SlTxTTuA=;
 b=HcZOUmmxfBFyuKqn7T9ktEG5Xj7DF4bKAPxTq7nw+3Ax6dMo/gIOjqOe+PkWVC/rix9Brl9Fn1VnuRpDZacOdIfvXKOiZ9BwbQ9yEdNqHVVN7+9XHZ/5ugYFySnNdhICqqzLoIE4vT7p3lN9b4Z2+hK3aHM2sU8xY/o1nFDPhT0=
Received: from BN7PR02CA0024.namprd02.prod.outlook.com (2603:10b6:408:20::37)
 by DS7PR12MB6192.namprd12.prod.outlook.com (2603:10b6:8:97::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.14; Wed, 7 Sep 2022 20:57:32 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::1d) by BN7PR02CA0024.outlook.office365.com
 (2603:10b6:408:20::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12 via Frontend
 Transport; Wed, 7 Sep 2022 20:57:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 20:57:31 +0000
Received: from jz-tester.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 15:57:31 -0500
From: James Zhu <James.Zhu@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/amdgpu: update amdgpu_ctx_init_entity
Date: Wed, 7 Sep 2022 16:57:05 -0400
Message-ID: <20220907205705.934688-4-James.Zhu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220907205705.934688-1-James.Zhu@amd.com>
References: <20220907205705.934688-1-James.Zhu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT049:EE_|DS7PR12MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 5be30523-244f-4cdc-2c32-08da91139529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: npCiwCRg+jngI50Gi4fjax7YfL/vI7K/4vh/0Hvd4I43lfIyVpix1ewZ0C/X2y8YILNVubFgpyqZfr33/Szpt0nVfQrn3sm5NroZEgFyGHtGOxkkvTilqBXP/VAXGEGhVcqImOrZ6qY4CQVkVwLNDc4GtaKli42vNvsG0G2KBE/f5O98vGSdioWKXmyy3A7Thvgl9CWoV8hg+SRcNJ9HnbwRvJ9BhlbNbLYQAcT4DfS106L3JMdC4sTp3NKeKkx30P4UAeaugIjYHU16bq3z/PwwDLD7GBREhBA9p5Fkh1Tv3ECa0j85qH+gmYWlF96p7CtJWUZARWcoe7Yn9gDlolFFuWSJEztHUKYc/ZP6bxQHdIlZy6AA/Js6bZXNoj/01B4+hr4Lz3DUVwipKD0OAzAnlQl/F9GTxcM+D0FaZMwF3OG7SnJHcHH/UGF4vevXyGuU5zr/IJX+BgrBmFIwJ7G5DhVLrmuqSQTgtaIOz3SBT4KKZGd+6+2larPktGpjrxWF4wblYXQxiWdbprS93HsQO0eVEtod5iE/adS0NjiWszwzZNUByGaK0EJ2c5aQhcLoKV3kMmmQYDkhlIDPEm5n5SA0IXW8AfGxzl+tsQRxoYl+swg3KVr4tK6k+tUtp20xVwz2wm8TmECMTnRFr8ZLT0bQAWOyfNFAk4BGXyLaQxNTZl1YjuYlkqryZgcpdif08yOAeTnD0y9m3iZHvxXnYwtbXCYhZwJ2nQRfD3IYsrShu98zdpK3g7zgQixAiCxLtF0EoTG22Sy6a2QqVGDAy/LdacvfIcQt4PgvLPIEKntkigmjnqvavw8I3FZ0
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(396003)(136003)(376002)(46966006)(40470700004)(36840700001)(8936002)(6666004)(47076005)(426003)(81166007)(40480700001)(41300700001)(5660300002)(70206006)(70586007)(450100002)(8676002)(478600001)(4326008)(82740400003)(83380400001)(186003)(1076003)(2616005)(7696005)(356005)(15650500001)(86362001)(40460700003)(26005)(54906003)(110136005)(2906002)(336012)(16526019)(316002)(36860700001)(36756003)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 20:57:31.8474 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be30523-244f-4cdc-2c32-08da91139529
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6192
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

update amdgpu_ctx_init_entity with new drm_sched_pick_best.

Signed-off-by: James Zhu <James.Zhu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 6ea8980c8ad7..3a1cb0a70392 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -201,7 +201,7 @@ static ktime_t amdgpu_ctx_entity_time(struct amdgpu_ctx *ctx,
 static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
 				  const u32 ring)
 {
-	struct drm_gpu_scheduler **scheds = NULL, *sched = NULL;
+	struct drm_gpu_scheduler **scheds = NULL;
 	struct amdgpu_device *adev = ctx->mgr->adev;
 	struct amdgpu_ctx_entity *entity;
 	enum drm_sched_priority drm_prio;
@@ -230,8 +230,7 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
 	    hw_ip == AMDGPU_HW_IP_VCN_DEC ||
 	    hw_ip == AMDGPU_HW_IP_UVD_ENC ||
 	    hw_ip == AMDGPU_HW_IP_UVD) {
-		sched = drm_sched_pick_best(scheds, num_scheds);
-		scheds = &sched;
+		scheds = drm_sched_pick_best(scheds, num_scheds);
 		num_scheds = 1;
 	}
 
-- 
2.25.1

