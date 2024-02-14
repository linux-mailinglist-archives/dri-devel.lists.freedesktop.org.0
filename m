Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C302854A4D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 14:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF44E10E231;
	Wed, 14 Feb 2024 13:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S1lb34XL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECD210E0F3;
 Wed, 14 Feb 2024 13:19:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6rAM5Kux9+yT9GFImVxsHf+edB+CJoIqSRRAbTwVJNSK19De/w0lCvegaAMw85TSZacKIrKGc55JYZ4yc0neH/9R0CZ9c8XQwXFu1vqPFaAX4Z6lqtIzKm0ClRNaVDUDHS3uGFPXC6/bDI0zdDE0NpXgQpNqayOHGZzzGgcY0hlpvdVl2Jw7XuTOkNvnlk5ZdInjbwwu5UrgyBkCPKiBLBbtVi2RMg9HH0rIMXb9TYmLisoAO7nABV5Q6nkQP4RcKfI29yBAO/4VCk9XhXT9gAh4VPLo2dP1RakyDrtw1VUwBWpMZzrz1lKCLWra6HuVhY9Ri1LjrRX7xrve1wG7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TG12QiXtd60DWaTJ6ZvEDSIn9rF6+E4Yv/1dMfVoiqU=;
 b=M3Ft8lCRctrhGUUMIuWrbUKQ4q5RUC6pvQlFWRS0TKuUa7xf62MD+ECZj+YcehezpiH58LQX5uvxoLGXpsnNWFqbKLBUT7UJNFSOdhXoxheXgpLLgAB+u3q3TeyfrgJ4GVZReRliwWjLK3tfasUuEKZ2azm6rTp2onmHsy+fQAxe2+8MdqaVvDRFbRNGycP06FvZ8EVAAPJPsGs3spBA6mP03F59BAuso3zhVn0/bEKZOVNFUyTKvox7SauN4pIbQHx6oJAjSukl+fMd6IQN+LGyqzA5rTq02y0Aa8V5WzZmQO8lhCRLsG858Tp2PCvJ5etn7RX+rHtrUtyWUISroA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TG12QiXtd60DWaTJ6ZvEDSIn9rF6+E4Yv/1dMfVoiqU=;
 b=S1lb34XLTkq45kaGDO4yBeQQgaZ/9UgkNknkmoa1aYBWmjqeLe8x3sJWT+bo+4ykn6b14S1w+h05zaJWFaRo1k5hLgsGqnOb+hCodJQVRE1DeVQpEF+OnF2UbXUNmncvfaPXaeIjszHM1yq8Ll1peXtE3XL5OCYcra0aGBcGR8s=
Received: from CH2PR16CA0014.namprd16.prod.outlook.com (2603:10b6:610:50::24)
 by SJ0PR12MB6687.namprd12.prod.outlook.com (2603:10b6:a03:47a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.27; Wed, 14 Feb
 2024 13:19:31 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::56) by CH2PR16CA0014.outlook.office365.com
 (2603:10b6:610:50::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.41 via Frontend
 Transport; Wed, 14 Feb 2024 13:19:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 13:19:31 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 07:19:27 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <mario.limonciello@amd.com>, <daniel@ffwll.ch>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 <stable@vger.kernel.org>
Subject: [PATCH v2 1/2] drm/buddy: Fix alloc_range() error handling code
Date: Wed, 14 Feb 2024 18:48:52 +0530
Message-ID: <20240214131853.5934-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|SJ0PR12MB6687:EE_
X-MS-Office365-Filtering-Correlation-Id: 8012456d-64b9-46d4-9959-08dc2d5f943f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NjtI5XjJmHYbLrP/xwfYdRDWEHBtxLDlK5eYDYWU9mReui24AsF6y8bDHpR+jyOnTzivr+SJxzifkSmNjoLUqpSLXedZFZaNSXtij8EN8TtKqmImYuJVJh69jh/M/NS5MqkqKRuboXpXn9sJ9yRWR0RJYCMYVSpGM9TERh+l8EWHMrulgCT7xN79FPKZeqBGsOupq2DrgXzyzQObIhmHhrO0dP3kRD6aI6QL3Esa2dHskZOm0U2vEK7grtUcJXXh54pS8vDZ7lnpwVkvPaNQcGfqh/Gy3Do2OUvXtNEn23lai2i9MOCGw0KhHiEu0LSXWdut+W4GELrBOEGpQWBXnq6SUWlQPon+AyQHG3yQb0Y63naMV4S+0EDQeOTgjPCnjgnVtGwjgQjO+b1rSHxUH9+Xi7aL3GPqmnCX8idVFqFmyK2rQye88i/qQ/Mv34qA4iPWf8DAPHq0zORRZC2HteOJ883BwsaE1/5/UH/x3Zw6EXB8AS/tIxtyP4QajS7mQmoyAmBps1Ycj7sSyKAbBEeb1nCHjnpS+5soCzSJ5Us9Db+brEHAjm8lZj04tWzeBVcyx2vA2Sv8c29WSEKZLKUjioJBus1m7kuBqzIubwKUE91lFnYgyjAV4vfPaO7d
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(82310400011)(186009)(64100799003)(36840700001)(40470700004)(46966006)(83380400001)(86362001)(356005)(81166007)(82740400003)(478600001)(966005)(70206006)(70586007)(110136005)(54906003)(316002)(16526019)(1076003)(336012)(426003)(7696005)(6666004)(26005)(36756003)(2616005)(2906002)(4326008)(5660300002)(8676002)(8936002)(41300700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 13:19:31.1325 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8012456d-64b9-46d4-9959-08dc2d5f943f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6687
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

Few users have observed display corruption when they boot
the machine to KDE Plasma or playing games. We have root
caused the problem that whenever alloc_range() couldn't
find the required memory blocks the function was returning
SUCCESS in some of the corner cases.

The right approach would be if the total allocated size
is less than the required size, the function should
return -ENOSPC.

Cc: <stable@vger.kernel.org> # 6.7+
Fixes: 0a1844bf0b53 ("drm/buddy: Improve contiguous memory allocation")
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3097
Tested-by: Mario Limonciello <mario.limonciello@amd.com>
Link: https://patchwork.kernel.org/project/dri-devel/patch/20240207174456.341121-1-Arunpravin.PaneerSelvam@amd.com/
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index f57e6d74fb0e..c1a99bf4dffd 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -539,6 +539,12 @@ static int __alloc_range(struct drm_buddy *mm,
 	} while (1);
 
 	list_splice_tail(&allocated, blocks);
+
+	if (total_allocated < size) {
+		err = -ENOSPC;
+		goto err_free;
+	}
+
 	return 0;
 
 err_undo:

base-commit: b6ddaa63f728d26c12048aed76be99c24f435c41
-- 
2.25.1

