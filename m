Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1177DD598
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 18:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F31510E5A2;
	Tue, 31 Oct 2023 17:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D94510E5A1;
 Tue, 31 Oct 2023 17:55:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nM68TJ9scH73zgTOzHBLoaHQ6wp8pOh60pQzR4pX6lMa/oXlr7aCx/3Xpf72triCvZQT1038bngDdK6peeX4z6SoGBy9RxSRpIo75ns9H4M22P94YwWLprDfZH6yS1VknXLvwxcSdUbg32lRuEfsmbbHC4jiNoLiSCyxbcEW+o6kTxymgwzHFa1lDEGo2iIf8DkOmdNhHH5iu4F1oqyVRgB8YOsPMge974mRRkQGK1mHn+NElnl59RQ/uJwA5qPlIbAWipQFDzpnNnxZYHYcDEnNg2MUQUnhskme4g3DH6Fin8JdklPcmnUBGavGuH7UfK6Z3X65ZQWxF1zw957ukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19XMVbZW0xB1SdUEv8/g9Lt2inIgdLb+fpBo24KHXQY=;
 b=FsXDqAdSpDqZcpWIbVyB/3m9397qFJN53Och8BMer3PMAm5ujolP2x3IHwmNq+6ELwx0ovjFKiOt7ZnbCUm5xZmI4QKlgxeY5vlY7lkIWp+w/v0TJ7A0us3FOCNbLGoBDpqqZJb1YVN7CGabvidhZgPK681hX8C3Y9gZUK40VZuHPaaJoGzBdACIC20MGGzoozhzf36v6fnaV8Pdr1j4B6VmULx+ROqhV06fnSmjdCHATMjOjAl5BKK9syHHckwzFboGoz32laPzzJfeJHLm+maDfFD/QxcxnkdVhiqJhM+PlC2MT2mQxFivGxb6li0BnkDA9cl+ptTJDiM3/5enmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19XMVbZW0xB1SdUEv8/g9Lt2inIgdLb+fpBo24KHXQY=;
 b=vhmzS/VjbKEl/I9sAAUqdvK+bT4G2mlkLcGWwpWC0Sodx7cyFCiXvjjPYv27SELGHjchEuwOrirNDSC8c75VocIEqZHn2t8DOjxK7+72jyxj42j1Gm8RWLNYn/nPR4SOXb0ovJe5GObp7X/TIbU76LDgVlKO6TfNeU+oTPVHbU4=
Received: from MN2PR05CA0025.namprd05.prod.outlook.com (2603:10b6:208:c0::38)
 by DS0PR12MB7945.namprd12.prod.outlook.com (2603:10b6:8:153::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Tue, 31 Oct
 2023 17:55:07 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:c0:cafe::56) by MN2PR05CA0025.outlook.office365.com
 (2603:10b6:208:c0::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.15 via Frontend
 Transport; Tue, 31 Oct 2023 17:55:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Tue, 31 Oct 2023 17:55:07 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 31 Oct
 2023 12:55:06 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: don't put MQDs in VRAM on ARM | ARM64
Date: Tue, 31 Oct 2023 13:54:53 -0400
Message-ID: <20231031175453.1383422-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|DS0PR12MB7945:EE_
X-MS-Office365-Filtering-Correlation-Id: d9b0f5bb-a15a-4da1-2df2-08dbda3a84b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2SenuXiZ1rGpqI+XInlA62R9vEkF9fBrKfQTC0tkQahpRRwcZHooqcvJve+67l5y//zPl0QQzUPYLYWPwIgpXVH7fK10EgIh20fDcmOPmeso6RZ7EEESpa29O+Y4eeRYN/z+u6khvsnjN4ITS7e4dnG/uYyWBuW1W18ynm63rX6+FFtuo/e88QaifFnwDrgX3Qnj1dqniHPsSuiSKbHKRl6lwkkewC9smjPTzVEbXdxLEWFgwqJW3AI+xoCxjW2GeMgl99pHLzc39gydDw2ghk3ZEWWRn8TQWkGFmGlKH6kEDli20mIkfEgYslVjyQjM5GG09BTgmcGdvnNeFT9nY53LcxAcdbDBSxwcSjonJ4lnbpsBj9UbaeJRDz5TXFxP9+KAC8mlg35e+5nvu7fQUZ7qLbejXgU6nI5hIfurRFEnCkIoI+FXEST7yfbPbjb7JqTGUWRJAq+H7FtMvrjT1u+H9jKal+XTyiioMHrbeP3xXjWXYkwxDGIpsFWVKQlTUnTBMLSf82DLlo6VbfyQlq/XHiA2Jn5v80xHE9NDdGfbT/5SPgBwopyTRwiG8nayKSrXyLC958RaLjPoDY+sK777QvhwqswAylzm3sz6f+Fi+rmDSg9XDQt7B1wac7+lBAqwgDb0hV2vOzi6YU75NV7KwYitjiYXlT3289Ts5/+zaUyI4S0Mkz+SGVxCOVMOGc/7ZyLolEK5UBf+kNWl0qZnVAteuf8HIJ/7QJj0c3LDPmMWARzzyrbMeGkrdVSK
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(82310400011)(40470700004)(46966006)(36840700001)(1076003)(16526019)(26005)(40460700003)(7696005)(2616005)(47076005)(356005)(81166007)(86362001)(82740400003)(36756003)(36860700001)(83380400001)(426003)(336012)(5660300002)(8676002)(70206006)(70586007)(316002)(110136005)(54906003)(2906002)(8936002)(4326008)(6666004)(40480700001)(966005)(41300700001)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 17:55:07.2234 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b0f5bb-a15a-4da1-2df2-08dbda3a84b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7945
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
Cc: Alex Deucher <alexander.deucher@amd.com>, alexey.klimov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Issues were reported with commit 1cfb4d612127
("drm/amdgpu: put MQDs in VRAM") on an ADLINK Ampere
Altra Developer Platform (AVA developer platform).

Various ARM systems seem to have problems related
to PCIe and MMIO access.  In this case, I'm not sure
if this is specific to the ADLINK platform or ARM
in general.  Seems to be some coherency issue with
VRAM.  For now, just don't put MQDs in VRAM on ARM.

Link: https://lists.freedesktop.org/archives/amd-gfx/2023-October/100453.html
Fixes: 1cfb4d612127 ("drm/amdgpu: put MQDs in VRAM")
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: alexey.klimov@linaro.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index c92e0aba69e1..a2a29dcb2422 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -385,9 +385,11 @@ int amdgpu_gfx_mqd_sw_init(struct amdgpu_device *adev,
 	struct amdgpu_ring *ring = &kiq->ring;
 	u32 domain = AMDGPU_GEM_DOMAIN_GTT;
 
+#if !defined(CONFIG_ARM) && !defined(CONFIG_ARM64)
 	/* Only enable on gfx10 and 11 for now to avoid changing behavior on older chips */
 	if (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(10, 0, 0))
 		domain |= AMDGPU_GEM_DOMAIN_VRAM;
+#endif
 
 	/* create MQD for KIQ */
 	if (!adev->enable_mes_kiq && !ring->mqd_obj) {
-- 
2.41.0

