Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C05F711724
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 21:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CEF10E198;
	Thu, 25 May 2023 19:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D2410E198;
 Thu, 25 May 2023 19:18:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knVbVjl8bdhgcntWoa0pKFiKTEBG9fjabT0UmUC3uNpraXDJmsqxrIBmhv/3mpmtEucmEM75nJtL63u1l5kJfy0vBD0g+EPLPXnJy9FBk6TigxqX2TIkZqVi0tGTCa25ERvE6mum4Sdc8ocnktumlHsd/D+TP4SWaCP+7kjSRjyO4d2+FdBu5ahfZ7rGGv4Q6fstOZrxGPt8jZZ47W1YEPlIc5BFaLKZiv7i6OZJTUnlUaWIS7SeOpf6xM6K5XE/KQs/0dALYzlzFt2bmZI7w72TTU16KjkpC2g7NpPCYL3lSmNJegsbjwbEP8Bxg0E5yOlGtEcZ3rtkYEzo5Ea9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mnd+lqY4iPtExegXG4xgCzFilvq0CDTJj12ri14AR0Y=;
 b=Xh2aXyIw0LU5XSabc4C70k0WFN9w3ipjWA7ixQCmevQ5uFUfd6qauazX0gOaHI7wkpJJ8TUg9FC5UGvOyKFspy0YbYK6zf8eQpkrVz7DcDR8eKAOpUji0p+xziMPofPtlBxwhLU9Fmj6KrG7oi9n9KZ8oUGV83ModWsiifUON9m/v1jjUE7NQYNURuh+cojHJAiomvMx8THAo6lIdH+/PZyMuKlpsrTL41oSNWdRlKjvWCm+o6ibWjlUiccMIOXqIqQ3D2j7SibpPWzhjEmME/DpW2zignJb0f1NKD4hwu2tpQxEqTvzQNhM2CmPe8LXF2oxCEsMhgyLQA3/AHtWdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mnd+lqY4iPtExegXG4xgCzFilvq0CDTJj12ri14AR0Y=;
 b=4P3ExYCSm1ehQRtlYixhmnyQRh51+FyDbxHDO2g2psdqRHkUBa+Q13KaHuHPpq2Gtps0gmKT53FDQEBCM86ailCF9WisZ3YgKrs8Pl+bAbUVHyJlOXfGYRtvEkoeiRztGzfbRDJCudB0Jmwd7kapY7TjBA9N8NKsrBKXchM8tHw=
Received: from DS7PR05CA0045.namprd05.prod.outlook.com (2603:10b6:8:2f::7) by
 DM4PR12MB5309.namprd12.prod.outlook.com (2603:10b6:5:390::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15; Thu, 25 May 2023 19:18:46 +0000
Received: from DM6NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::79) by DS7PR05CA0045.outlook.office365.com
 (2603:10b6:8:2f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 19:18:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT107.mail.protection.outlook.com (10.13.172.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.16 via Frontend Transport; Thu, 25 May 2023 19:18:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:43 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 May 2023 14:18:42 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 11/13] drm/amd/display: Always set crtcinfo from
 create_stream_for_sink
Date: Thu, 25 May 2023 15:18:07 -0400
Message-ID: <20230525191809.3524-12-harry.wentland@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525191809.3524-1-harry.wentland@amd.com>
References: <20230525191809.3524-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT107:EE_|DM4PR12MB5309:EE_
X-MS-Office365-Filtering-Correlation-Id: 7848b3df-ef5d-4fd1-e3c0-08db5d54dcbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2OJuI+IAucuY0fMg3B81UoJa16Zk4uA+fIK4LGddZSIZGe1t/hDtWMIphGjR0gXWPK44pq3ms6gRDPEInfZpB9wfSNATRNTALnpjX5N3Xl8bHmrQHlJ2CpLjHj71EMPFeNvKSEJP6QyXLh5pj2DW7vnH8mwWj0PoqYPCcP7vAj3pjwDGlz+zvFw46k/nq00AYz9qY9H6pySKGrwI4d1rFkLvYp3lBnG0/+H9V0ykX0f6N4Wcbb8GvuoafxDwgxcwO+cM44IcGoF/stecCr24b37NfXjqdX/gP1rduQ6+8g51g5/NvqpHtPmZSGqlEqHfIKeqtzUDKfF3vkjj8/dbKZ+uZf/uXcW5H6w0EFkcGBIFey41Dxe82jMgR7aOREIuVmSe9b4ki8IT34Mkx60A1ofAvvHcqP7Vi3QFZ373PSIteLByuF5DhPqlKCjNB4SdfAi1bqz0b2OJ+C64etauXNMQnqBQrMEXmRTpQN51MsJEfu2dJs1SYyGjY1AXuTlDbenUi9ByUnK0hc1FpMgH+LHLaRTIMdNYke8xIbCX8J8cWb7Zo8IIbCNVGnOahBHgSARouFQRZZVD9ts4rPoC8zkAZM7x6dLf7ZOpK7dDEtBx0PD6XJEwRZz3QbLrpKZHwUPbFW9vrM8zKl9FvqGOTRt3ytXhv8FXj3MVIZjJpEvwog5DdS/3sgNbEUC8hf0CWuoQ90NR+a4G9IkKfuP0DY8S4IBfsgWNbHW+xQjwoAcT41V4uF11X7WWklENYTe9qtTwUpuqFKw4WF0Lqpt6Ww==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199021)(40470700004)(36840700001)(46966006)(8676002)(6666004)(478600001)(110136005)(40460700003)(83380400001)(47076005)(2616005)(426003)(40480700001)(36860700001)(86362001)(82740400003)(356005)(1076003)(26005)(36756003)(186003)(336012)(41300700001)(81166007)(8936002)(316002)(82310400005)(5660300002)(44832011)(2906002)(54906003)(4326008)(70586007)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:18:46.4213 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7848b3df-ef5d-4fd1-e3c0-08db5d54dcbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5309
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Simon Ser <contact@emersion.fr>
Cc: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a8de26f09806..4e96a34148cc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6046,7 +6046,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 
 	if (recalculate_timing)
 		drm_mode_set_crtcinfo(&saved_mode, 0);
-	else if (!dm_state)
+	else
 		drm_mode_set_crtcinfo(&mode, 0);
 
 	/*
-- 
2.40.1

