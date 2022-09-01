Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB02F5A9321
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 11:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002A310E679;
	Thu,  1 Sep 2022 09:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2061310E675;
 Thu,  1 Sep 2022 09:30:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EabgYiN7qS5bnfs6XHoZ0VVZVaAUVZKpoVfnMqmHfKksSsATnOR4/5iaVN1EP01cZmHrKZUGiDbFhfMvBvOtmmlgnMbb+1rkMxaFnJOwHq/fgKOQnZa0EQZoeSn6I+PCSRpRL8b4T8bRuwBXS5/R+qpv90/gKaN1kCgQAJNMPIhGZILfh0wSMIGNpx/3bqM9qN+CwQDGAZJYNt5Z+KKbb/1tWDKrq8Acs7DmMVhjrUxLvqZHnhV51plRDNBRTOohYRhuYqQ6ORXZXbNH9alktUS42ER8mPa74W9K4zGWPuU29qy6adN+w7MNR1qhBlrLkwLELICn+ZTksJstKD9csA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Btxgb3a7q37m0sBtsWYxzXnWWc/pdaxLPTR9h0tEuLM=;
 b=F5LqoWxxyfqMgogJLKyO1zO4gUXellANigmCEj6+X8YYkICOcFr4jB7p9FUJGR5tn19pkYLIMgA9joSVojWFMEFO1PQnorGp8MHglZc4uaHSCRKT0GPDbjeiAc/+Wn3QGClnucNJG7yDbZmrd1/ycVRMEKzHpjQORfU1zMsW/OTg3ofBs3gGLTwBOROxWTxp42JsMypgRTULP7itHIdvFviFXw+z4nW2nV5ffmat8VSG9fmsgsMDSh15BfOLrkf898SQURaPQrBs4W45QyM0QcbcHrBAVl8rktwftloGWmjIknKalRsb8g+a/bVirWGjCUPbLtWkqZBoxHcHTceDDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Btxgb3a7q37m0sBtsWYxzXnWWc/pdaxLPTR9h0tEuLM=;
 b=ZAGPY29Y3WFzm6ysz830R3hEJ6SCOpcfAZfWnAB+8D1Slc7U0Le7atJyra1mHb059bRCxpPDblbcHOzjuI9DisFk4NElJdAFDsJPaK98YDwQ/m+VxPT2PT3y4TSQDq0JmjsyCApCXbdVQuQzJZtDXdX1bfQqlQSm2oL2vw55ZSg=
Received: from BN9PR03CA0464.namprd03.prod.outlook.com (2603:10b6:408:139::19)
 by IA1PR12MB6436.namprd12.prod.outlook.com (2603:10b6:208:3ac::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 09:30:00 +0000
Received: from BL02EPF0000C402.namprd05.prod.outlook.com
 (2603:10b6:408:139:cafe::92) by BN9PR03CA0464.outlook.office365.com
 (2603:10b6:408:139::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11 via Frontend
 Transport; Thu, 1 Sep 2022 09:30:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C402.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.7 via Frontend Transport; Thu, 1 Sep 2022 09:30:00 +0000
Received: from amdoffice.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 1 Sep
 2022 04:29:55 -0500
From: ZhenGuo Yin <zhenguo.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/ttm: update bulk move object of ghost BO
Date: Thu, 1 Sep 2022 17:29:46 +0800
Message-ID: <20220901092946.2030744-1-zhenguo.yin@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f2fe5d8-9b61-46f9-e614-08da8bfc8ada
X-MS-TrafficTypeDiagnostic: IA1PR12MB6436:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JuGrJwr5AxYxukWM+InyxgAbzvw0YDMdjDlhal/1EU751ZH2OPKOrbZEAvBk409BJZUGxhWChMo6nPWoM0ETSdmkoBtF6pB2SCrISozwHJxZdPr5qaKL0OJgvuChL13iqArj/Sp8eM2+18vC7WQNaEqM+nbyWkeDAGC+L0nJ2mgTARFw8VAwYRUlwImSAug5nrx2LblBNH1W7wJwgMWN8DaNXSeulYkzBobLxebUcrEdVW+Rmb4rjfQ5V5PpTThXOpxn/HyhiKJNpwo8P3avdp42sbECsSF9YBVFE/tEsHnXMpFj9NFaXR+GpukRjpvZUqNEDWDYVj88O8w6GPHMU3pXITIaHPdZOD93YO5rrXXUkYc6naHbUrSb+dG7N6Qg9FKASPQTZRrwCgPTLU5pY6lSs2ML7KH+eJGfbQ8MeZ/zYJuwLyr66uXnq1Dqtdv9d9ovB0sOiBFr/6yXICkHn2UgSSqskywhqj3S2tZ91Kd1HyBH0N6nSSR3h6ni3xz/6nYnfNNvCEXHKDdyjkTsvqS86oBvdW4WoqmT97cAKsjtIUS8niB8Zm2uYlCV7KrvrSKWrVG1Opum4fzNN4YZJFoBnVRGOAzx+Pzi1Zm+nmqdpjUkvD+N2HOdFJvYT8ce2vScscS1L/snZRVIrLT0CVSBWD3I+ZzfJ5OQpoqNNb6OjXQS/e4mwE91HgZC9EGbp7GRbuLg8shVlhXFmmxummov5csgv8X0kqt+2qeOlfacRzUax1dpjUovXdqC57oWrrRF0Gmoy4f2CiPMQ7eSShbvexwjJdh9uQn0vkwey0Bpm6nuw1ltzZITDqu3g0cj
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(39860400002)(136003)(396003)(36840700001)(46966006)(40470700004)(2616005)(186003)(36860700001)(356005)(4326008)(40460700003)(83380400001)(86362001)(81166007)(1076003)(82310400005)(70586007)(70206006)(8676002)(478600001)(26005)(36756003)(5660300002)(8936002)(2906002)(82740400003)(6666004)(47076005)(426003)(7696005)(6916009)(316002)(450100002)(40480700001)(41300700001)(336012)(54906003)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 09:30:00.3342 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2fe5d8-9b61-46f9-e614-08da8bfc8ada
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C402.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6436
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
Cc: ZhenGuo Yin <zhenguo.yin@amd.com>, jingwen.chen2@amd.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
Ghost BO is released with non-empty bulk move object. There is a
warning trace:
WARNING: CPU: 19 PID: 1582 at ttm/ttm_bo.c:366 ttm_bo_release+0x2e1/0x2f0 [amdttm]
Call Trace:
  amddma_resv_reserve_fences+0x10d/0x1f0 [amdkcl]
  amdttm_bo_put+0x28/0x30 [amdttm]
  amdttm_bo_move_accel_cleanup+0x126/0x200 [amdttm]
  amdgpu_bo_move+0x1a8/0x770 [amdgpu]
  ttm_bo_handle_move_mem+0xb0/0x140 [amdttm]
  amdttm_bo_validate+0xbf/0x100 [amdttm]

[How]
The resource of ghost BO should be moved to LRU directly, instead of
using bulk move. The bulk move object of ghost BO should set to NULL
before function ttm_bo_move_to_lru_tail_unlocked.

Fixed:·5b951e487fd6bf5f·("drm/ttm:·fix·bulk·move·handling·v2")
Signed-off-by: ZhenGuo Yin <zhenguo.yin@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 1cbfb00c1d65..a90bbbd91910 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -238,6 +238,7 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 
 	if (fbo->base.resource) {
 		ttm_resource_set_bo(fbo->base.resource, &fbo->base);
+		ttm_bo_set_bulk_move(&fbo->base, NULL);
 		bo->resource = NULL;
 	}
 
-- 
2.35.1

