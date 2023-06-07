Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16B9726485
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0002B10E52E;
	Wed,  7 Jun 2023 15:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5E110E53A;
 Wed,  7 Jun 2023 15:26:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVQ1Q6xqtrUWSnkXrwrtF2dIs8k9Tjsd13lunXaTroPJA4j7+f8rZOs4JFRJEilj/vSjEyMI/y3bCW6Op9gg/DQs/+PjQ2JceISeT8jmcAeH06d1kdnDYJZo7knr2nLFOCzzTbaSsa9DUw3Sd97X/DnuolhkIekX8OeWn3RTRwcn7BHJv5ADvTF8eMHOytSgvf05q4KoklDd8DFuyadD8GnAwKQe5HNJ/nuSEUbLbLJwWFZTgSK34I2C0YGiPVlZDXniic37shjNcVUop4/nV+8kUm2rE3jA4NAWOMiUf/GgE1z4mVLyxE2bN/z7+ULrEj97ocO18hwp2NUNtex2HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBwm/EljCgeiFmD0D8VHZAQSDNrZi5SvPsZvHFB2/JE=;
 b=VFdnej4AummmzX8xGUyb2AHs31ZD8elgkYOlrxxp7+mP2KrqK3ROHbSX1sFbmeuMarpsoxBQyiB9N9WQxpv3sh/oVRooqAFRdTFcoQ0BdCBwoWEjw7J8s0IdKlPr+XTJiy1jR+Rev8IGiiEa1ieszWEEdA73xUqfQ48ASxkO32O6ws5+8jpOaNVd49z61yAAGyNygtnOrOeeTeD+REOLfaZe35/DhFzqidYZxGKFhvJh5BQxNMogPF8kgxB+P3qdwp+YuEs2QVMwP759MU07BZEC3dLSCT+V8ZD2URH6PdqdTViC79L7Aaupn9nYS1sczZGBm4HsFy8XhddJhdq+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBwm/EljCgeiFmD0D8VHZAQSDNrZi5SvPsZvHFB2/JE=;
 b=CE6qGzoRjmqufEGO1yCaqaQmfyCo/cgeQWKdyqfsQ0kACnbTKzSBMOTUSH1QN7T5fTg9txahuhiqfAgtBRDnW5iLAAjQvUBjd5EereNxwHuoyD6qffQYheVaYWode9tbUieJ0i12ui09xYtAZmnK+3bmEc6K7gVVYGgk+prBLk8=
Received: from MW4PR03CA0111.namprd03.prod.outlook.com (2603:10b6:303:b7::26)
 by PH8PR12MB6891.namprd12.prod.outlook.com (2603:10b6:510:1cb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 15:26:34 +0000
Received: from CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::dc) by MW4PR03CA0111.outlook.office365.com
 (2603:10b6:303:b7::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Wed, 7 Jun 2023 15:26:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT097.mail.protection.outlook.com (10.13.175.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Wed, 7 Jun 2023 15:26:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 10:26:32 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 10:26:32 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 10:26:31 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 11/13] drm/amd/display: Always set crtcinfo from
 create_stream_for_sink
Date: Wed, 7 Jun 2023 11:26:15 -0400
Message-ID: <20230607152617.997573-12-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230607152617.997573-1-harry.wentland@amd.com>
References: <20230607152617.997573-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT097:EE_|PH8PR12MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: 97e66252-284d-4126-e4cd-08db676b93c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FJdJLJVTsnHI4mFbZUPXLDUJcOIymLmtsJc+j9UJDBrRvY4ABg7XX4zucnMWPXgBEFSdFuQ5QltixWb8wDx+7RbKDmZKVomB/j/yfry67Z4ZTZoXztYqlqvKzcxrdA+sOI/oJ9MdR/7ZGtDce48m5j5onyAN8tgjmH0SYI2N3ueg6Z2z7wUo51VO6s4mattcUErgXgxm52+Q3n/zw3h3t/5k9SXlHxnVVpJQ4wqSyX6fZIt5XIEods5XEcSszx9ih3mSW75JzM13hvZIlw3/WTNos9SFzV74sx/zGOAMX4pZmD5W6PHwB/0I1glHoWCKiNVjYaP7xTOwqJnk8Lpte057Y++dNewfqHBHE3dFgJuLPUs1nenLR84lJ81s+cUviTz88tVWG1jkR3+5AKzWtcKFTzdoxVIKr9vixQYq2TEnyIyKzccvvL6D9GQwJzUtarQquLe5tkdk8i7hsf3YJBIOyuJ26d5rMWV+3I8uhMht5D3CuIEZFoWz1lIXxguZIhWSXECft+rzZdoKqmotwashIuyW2rRVvxUA5u7E3kuaI2bf/9ZHJ9Kx/jJhZ9C1BNy8+tD3Fx9tKsG73PB4MoHUZfXpmCl7CPfzOU72v3UAMDRjFYWAH5FGk175h0ZbzOhWbi8X14MO2o1KwNuSYpdkQ7f5HKNjA2XC5IDsmr/QiEap/Eahtt9apiO36mfRv0Yti82k3C0j+jPmTRZxul+P85XuHlmz1jtKE8jNS3OVaghEfhCG7jU2ogEqKc+iVJGTCiv7NySqZA7IgEHM2A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199021)(46966006)(40470700004)(36840700001)(40480700001)(54906003)(110136005)(186003)(81166007)(356005)(478600001)(40460700003)(70206006)(8936002)(8676002)(316002)(4326008)(70586007)(2616005)(41300700001)(36860700001)(426003)(6666004)(83380400001)(1076003)(26005)(336012)(82740400003)(47076005)(44832011)(86362001)(5660300002)(82310400005)(2906002)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 15:26:33.9966 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e66252-284d-4126-e4cd-08db676b93c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6891
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Vitaly.Prosyak@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joshua Ashton <joshua@froggi.es>

Given that we always pass dm_state into here now, this won't ever
trigger anymore.

This is needed for we will always fail mode validation with invalid
clocks or link bandwidth errors.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Simon Ser <contact@emersion.fr>
Cc: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 060a975f9885..e17c8afce2f4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6054,7 +6054,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 
 	if (recalculate_timing)
 		drm_mode_set_crtcinfo(&saved_mode, 0);
-	else if (!dm_state)
+	else
 		drm_mode_set_crtcinfo(&mode, 0);
 
 	/*
-- 
2.41.0

