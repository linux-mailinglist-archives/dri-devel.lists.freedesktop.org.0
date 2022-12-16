Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB4764E61F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 04:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656EE10E5A6;
	Fri, 16 Dec 2022 03:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6047210E5A5;
 Fri, 16 Dec 2022 03:06:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLWiOtXrZaoWqPaH6M3fFyywSlyak8ltyL9kXci+a/OsZ9443T1q/pctfPg2qm2c5U4YsoVQCeOm7TK+DExHqn+YsJEVFBgSWEU7WmZ/t84w6TtO/k4uMOyUX3NVgj7IFH6lvJ34j0lXJHFeh02ppybP/UJ5EEDfmU/qU6JCsHU2bqZKR4dcD4kvH7jCW47+eTFXZ7v04M+q8hA4WX6FEytxhz/HUWqiB5ik/q35NqBNMnAGqYAYYtzpqveHo6spM5F2Vvt0v3suid+o0gcM3INOpfMfXaST/tSePwIjNVNns7Sy6TqOvNa8Lk5uVYuPOErMzXi9fXB4RSYfNjzbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MY7PY0bALJERvgdvJGz12ilOSfoTKk+06tDrXJ36hvw=;
 b=PkCTXp7RG7+pj/UxQ5qEIOfDHmdCa9pWVIyVmvFb0u5+nP2uMoi/qnG+VAcVnk5XCHQg3sTeP7m4RoaMP9jpC0u3aE261+SG7t7tKdaLmwQzvV3g8boZgffaCNIEcvynSV3uZD2a4DesVsqDDh00HhIVGUkp4ekJoqr75TO8PQ36BwuiKEsTt3o5CIeUtC8c38YLDpSO1Roj9+cEXiNGUBRONO+UNpVF7AhUIwpL2VIjGr/V/kVsWMTqoUQZcrL40W52UrYQv8T0M8teZBGxqaQQ+Dj4nICFcLuEwSHQA/S5ZBcHedKGpNkIf9Mmfk4k/zI+OROHuMOrtpPNp3lVHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MY7PY0bALJERvgdvJGz12ilOSfoTKk+06tDrXJ36hvw=;
 b=C4eeZwriLO979c5sIVtZMaonPXQ6TKKSqmy9YOaAwEqzFPA5qlNCw/QPemhwLQGEZWowc83Jbo2fHl8xiBsahcVZ3YIdH+EspdEyN/XW8iBwm7wbQxa2J8RqMcpu+kXYBTuqiJyVfmY6mBJu8kqsUExgsc1XQvLbN3nBY7H1ilQ=
Received: from CY5PR17CA0032.namprd17.prod.outlook.com (2603:10b6:930:12::28)
 by CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Fri, 16 Dec
 2022 03:06:00 +0000
Received: from CY4PEPF0000B8EC.namprd05.prod.outlook.com
 (2603:10b6:930:12:cafe::6d) by CY5PR17CA0032.outlook.office365.com
 (2603:10b6:930:12::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Fri, 16 Dec 2022 03:06:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8EC.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.11 via Frontend Transport; Fri, 16 Dec 2022 03:06:00 +0000
Received: from majun-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 21:05:58 -0600
From: Ma Jun <majun@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>, <tzimmermann@suse.de>
Subject: [PATCH V2] drm/plane-helper: Add the missing declaration of
 drm_atomic_state
Date: Fri, 16 Dec 2022 11:05:26 +0800
Message-ID: <20221216030526.1335609-1-majun@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EC:EE_|CY8PR12MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d70cada-2db0-4a7e-ce4d-08dadf1275f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TddPIskACfVoafQD+e0vQzu0XO7PzmSVz8rDuww+2MedFeEodgrijw+4NTk9EA7YJ6IYS1iTc+fXByFDE3Q8wEXTHgGfpYGTQBI9I9N9YeIzgYACAI/ATAjlmlzlncVOqD4nNil0gEGMA8iEEh0c7ecm3wiizdADpNdONW1fChF6sOI7pze192bRAZesL7Pg5goqmTYWXmMSaoJt7EIvupro1f1kuIoRE2QJdPNgkbiOrL1LN+f0EzDx5g8fYRs5cxcTzypNc9FVlgerb83IjZknguSDZG1D+f8VC59wqCHgf6xI4Pd6woQIYWp9MuUAxeeq1MZrnLbzCRcTEnQzCEapxQyZshyViwcbWt4VxoRAEJFgjt1X5FFqLMzIPio5nqwfs5EMBb+cOUH1KwrLQw4H/Z66m0+UYBEWskaAYrI3CJ5+KatQM33T8zjk0EvYv4LrPvOK4qtYTX8EQXA75HlcIoMhUgjdC2Sijk6eSy2+h0HPvp6md2X3yGwHcq4lyfFPhEJis2DKnS2IFT8E38lfWzkFSUnY5UxVOazLdUKz0Cl/WPsZwkFE0IcEkYl98qV2UFNyDetJuy6MuKSTCsV1aIbM9P63nvD1Ji+nenKChVfZrdMDV/5IM5E+qqOfLy/EmXrvnf7YaOIqbJxjMz+q3Igkq7eMjfmsXqBBRy7miLPeqVBlNmAeuZ88HAzhfyHtfSDRpV/ffavwTvQ+dafF+UV0RELLsHtgyxZ/JkI2DonsH2b6IwP92zSRq9qt
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(82740400003)(5660300002)(8676002)(356005)(2906002)(40480700001)(4744005)(4326008)(70586007)(41300700001)(81166007)(70206006)(82310400005)(186003)(47076005)(6666004)(7696005)(110136005)(16526019)(426003)(2616005)(316002)(1076003)(26005)(336012)(40460700003)(478600001)(8936002)(36860700001)(36756003)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 03:06:00.6898 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d70cada-2db0-4a7e-ce4d-08dadf1275f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8412
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
Cc: majun@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the missing declaration of struct drm_atomic_state to fix the
compile error below:

error: 'struct drm_atomic_state' declared inside parameter
list will not be visible outside of this definition or declaration [-Werror]

Signed-off-by: Ma Jun <majun@amd.com>
---
 include/drm/drm_plane_helper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
index b00ad36cf5b6..90156e13ac11 100644
--- a/include/drm/drm_plane_helper.h
+++ b/include/drm/drm_plane_helper.h
@@ -26,6 +26,7 @@
 
 #include <linux/types.h>
 
+struct drm_atomic_state;
 struct drm_crtc;
 struct drm_framebuffer;
 struct drm_modeset_acquire_ctx;
-- 
2.25.1

