Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3478669DC5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66E110EA3D;
	Fri, 13 Jan 2023 16:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC4610EA3B;
 Fri, 13 Jan 2023 16:25:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5ZZOZwJqnBIoWI1lKzNLbZ9BKLNoOdaAp4MreruyoVWNgDKF63mK8phoIDLGJtiC7kNxxObk77Q/4mCJyeJPEcyVTzkmhmmE41RslXYRSFf3WK+S58uE72FbNTaqND3eVEv7/h88/Ea7EH4dAKMXWXn+OpJeQkKKTrUMk+aCXjKlv+dUWFI4jXEjKy/SS0I2sEI7dXyE72vswAutoxRKXsZAygX/Fs/Boi5Pu327B1j9FZURbzHsPfnmL3QLlziuwTbQaFIPyBG7vK/HUSTkF/RMSXhcEG+Chsi/fYItTkDWt5mo27BMgdm2tV5lFU4QdeYQYJmk0y7Jat+cK3DWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4+Xvn+6Mat0LVdjaQBIhUkP7yEJ6rELEB0ZNObmNMY=;
 b=bbhlmn0UBJIrDt0l58jAiUJ98iCOVCyH4TP+0ocNDyQU6NGGgTfyRbPKipqKMNh6y3tfmhDEaxcOkVt9kZ25FZEZrIlW4aXVoUTGXS/urc+pEYydX+0EuKcX5jb9Qp+OX3Db1kbJSDTf4Tqxpobs7Oq0KiAUSVapyH6SCFKDM2JsyChKePHa02EFYsQkM0iSgvdt3iANJHv653qFXWVtcTya1vqWxjM3mXsuCbU16OiUXIm54ouMbs6bZ9AQSLPt8+C4aFZTOcaOZcjtoFpNCiu5WvBjfAXoh6kEvS5H0A9XO2sDe0ynaETs15uyP14oYezY01+c5ORqe+2UoyHLdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4+Xvn+6Mat0LVdjaQBIhUkP7yEJ6rELEB0ZNObmNMY=;
 b=w8/XaJjFazgeVTOBQ4o1SpBabsVjhySaDQQgZVXPte68mSa55MSQagR2aiif2wphKuhntVnA7wdF627CAP9qhjKgT2hK9vksSBEnlHCWncEAYMQ4kuiRlG10gbOBIbUP8OZolQO2Buc0Fv0LtC+JgUFNidvQE03SDVMNqvrsHp4=
Received: from BL1PR13CA0362.namprd13.prod.outlook.com (2603:10b6:208:2c0::7)
 by MW5PR12MB5682.namprd12.prod.outlook.com (2603:10b6:303:19f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 16:25:03 +0000
Received: from BL02EPF000108EA.namprd05.prod.outlook.com
 (2603:10b6:208:2c0:cafe::7e) by BL1PR13CA0362.outlook.office365.com
 (2603:10b6:208:2c0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Fri, 13 Jan 2023 16:25:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF000108EA.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 16:25:03 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:25:02 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:25:01 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 13/21] drm/amd/display: Add support for explicit BT601_YCC
Date: Fri, 13 Jan 2023 11:24:20 -0500
Message-ID: <20230113162428.33874-14-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108EA:EE_|MW5PR12MB5682:EE_
X-MS-Office365-Filtering-Correlation-Id: 011bb40d-54c5-4efb-fd80-08daf582b978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /TGFXy2a0nKilXNBqQNzGpIp7N7dlxP0ohAdQLxwPF0GH8Xco5mm7N4jHRiGCzQ4luFJF7UNDl1lv8WLkUoGnZsPfKtTqPZSXYwQeAaojb0i5ba+cZV0xJQNkpNdk4fFxigEVZxpjge1oe/lA/iPG7dNzZeAychgEQFz6phkDOypZXPkUrYgmMleSfTKHkUQfNL1UBckGoi18Zaz/tga4QiMKO8StkKvAUyqZ6rHpySPAyhbd6nNj8bhOyDRJ5QXGCeRC9vYq1pVKWSPjrekXqeO/SzMFjxQY/HUwN0zRAFAFT3oh//yB686y4l+ZNgPMsRmp9Gnll/t9AL+Fi9iWD0ooan8Rt60MIfArK3OhUkYUSbHZ7+v86GOI1rpzYrObwWl9EBNDuulgdcdBMcLv/iIJJEPg+9VthHE0RtXrJ2+HDT3vQjZLE0TeD4paMwFO6/mDBXqFOCXAEJfEBhebluNXM1HIoHD9wAA0juLfy26upAIafzNpL485KruAHZsGQc60amdFxM1o8y8Jyam37Qr74EjgJEt63mDCslakBacMrU+1TZ8WS91VRThBaGhNI3Cq9G3Halb+rlmrVEDeK0Stji2094wNq91EVNU0qyPNJVYaPpulodILZfMI32MgIuREJ6fbfvvB40o3LAgYRCLhO0QIHpEaNcbry6uaP+pz37GtuY8df9Ew9CPXrh9Z1puzGgen+inrpA9y2TEcbFfjYeASnYvl+vM7ngTnYk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(356005)(44832011)(2906002)(86362001)(81166007)(5660300002)(8936002)(40460700003)(82310400005)(41300700001)(40480700001)(82740400003)(36860700001)(47076005)(426003)(83380400001)(54906003)(110136005)(6666004)(478600001)(2616005)(8676002)(4326008)(316002)(7696005)(70586007)(70206006)(336012)(1076003)(186003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:25:03.2145 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 011bb40d-54c5-4efb-fd80-08daf582b978
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5682
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We use this by default but if userspace passes this explicitly
we should respect it.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Joshua Ashton <joshua@froggi.es>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index fc94f4872397..d2921d2179cc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5190,6 +5190,12 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
 				color_space = COLOR_SPACE_YCBCR601;
 		}
 		break;
+	case DRM_MODE_COLORIMETRY_BT601_YCC:
+		if (dc_crtc_timing->flags.Y_ONLY)
+			color_space = COLOR_SPACE_YCBCR601_LIMITED;
+		else
+			color_space = COLOR_SPACE_YCBCR601;
+		break;
 	case DRM_MODE_COLORIMETRY_BT709_YCC:
 		if (dc_crtc_timing->flags.Y_ONLY)
 			color_space = COLOR_SPACE_YCBCR709_LIMITED;
-- 
2.39.0

