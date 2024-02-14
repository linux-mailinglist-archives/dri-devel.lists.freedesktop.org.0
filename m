Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7596285424F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 06:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A9C10E1A3;
	Wed, 14 Feb 2024 05:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OB2tvQZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5360810E2BC;
 Wed, 14 Feb 2024 05:22:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIZqMrIreR2bMNKfCjcocrB3RfO50RQr94Ux8aOiBgFW7xZjuBzX/qWJ8hAMHUvb9tkc1OZzXKing0g6ii7hpFD6XOtpO6Nkfbu6v8Qgc4mZ5XIweMQiW6O3x3jVGLOm4bIfclblzx05W//SvObbWSgE6R3L8FaGrWZg5dD42Cci+t2O9+GJaOw586m9polMf2VhIQBZdbmEnO4eIpq3PNQ41Qkp6ULXmFzYkEDXGkDimWjYekRqgtWOSi0ZDBX1nI1GavEMSw973vPwaekLLXPN4LdDwla2Q6pOMy5BpKbB2S4qec4SI92Sbs/IOVTg+fmiP+bOsDOQNS9PORMMIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkdu6Myyqg8Cmg4PTCDnX9YhrNcYLp3uOeKpuuacY9c=;
 b=J62AqdRLKu1m1MxsAarTDssrrarVXUXv0V6ymV17tdUrHxXWuKLbKPZALsTqtINZidQPuT2FvuqN9BRV/Sk/u8x2m0HC9N2/VVHMC7lZQ52xCMBS40cIMMKEWBre3lRv+2bpPVNOyatWT+mtnvzo+0iIoQcfZj5F8c1xufPgHwPzO3tVhbwW2ezzXejqissuLfFzlLLgkEKOkriLofUdmPsZng6mLjBJ7mKKGtrCrqzh+ULOj3S3K6WQNvK8F0pbLHDiauLIyyhsLqDrZhaeoJEK9YuYwLukpHJd3oGBphw/jHol5RGqewesoWC92BWK9DhspejgpxNQmqSul62Dpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkdu6Myyqg8Cmg4PTCDnX9YhrNcYLp3uOeKpuuacY9c=;
 b=OB2tvQZv+Co0DPZSxnjmkmsSxHgVWtxoXniNr44Bj157hBV4WMqM5ZYVPBkGso4EqQ1ySdCvztFONbbe2RdOlsa9j/qZsWGZThhm4o5kSn2a5bYhBzX1kfaB9gdm5AzKIpyLfflSCugHZnKLHa0Kcu8uP46lAIIRxRY+9yXjINQ=
Received: from DM6PR12CA0003.namprd12.prod.outlook.com (2603:10b6:5:1c0::16)
 by DS7PR12MB5837.namprd12.prod.outlook.com (2603:10b6:8:78::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.21; Wed, 14 Feb 2024 05:22:29 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:5:1c0:cafe::b2) by DM6PR12CA0003.outlook.office365.com
 (2603:10b6:5:1c0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Wed, 14 Feb 2024 05:22:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 05:22:28 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 23:22:25 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <mario.limonciello@amd.com>, <daniel@ffwll.ch>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 <stable@vger.kernel.org>
Subject: [PATCH 1/2] drm/buddy: Fix alloc_range() error handling code
Date: Wed, 14 Feb 2024 10:52:07 +0530
Message-ID: <20240214052208.3035-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|DS7PR12MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: bf322ab0-1c77-4c89-2fff-08dc2d1cf02b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N1oh+SLwFdgW13Wtg+wIpWTRo2hV+Zj5BHDVflKJXgnoLav5+W2nkxOJ30jAonPieY4qMI8NtGvqXc2VEpmZ0Ko8RuSZEE+hAbfD8qSnDwZGyQ9AwltpqLpt8nem4Hd45NmUe+0ARdlMXNG3FKdgx9ODMCwqBT65d88sH0CFiXeDji99F7OPAl8GNAs/l1AHPDWEGdqwunC3u2xJzISlUZlusTVhp1Ypi4h9FNV28IkbznDjT7PAIg/ub/LQSrPkjDzVZxfAKYejcTU4Du+3tqOcqmam190W82MSqpKWIMatvMaPLgrY7NhKZWmy4XcRfwY4yOMNWwN3SHxDk72rT9Pp8wzYDz53WJ5aG2xKR/SvN1tslaX0eDnjkeb3mp8kp+DgFIv1ikdny9n/6dDpwXBvfdnkiINhteJmEDb3vCiO4OvOAu36VBi93zeJtCF0FAhuFzbsi4TFOiDR80/NcFdWU6NQpn2H6vvol9WKbxF65meFYzSutIelSGamQxgS9rmSCkB+2GLYbQDjFaB8bXrto0VjMWztFaIB8d2PPrILJOBT9SnOj1zgIfF1xmFen5JeRiJ8ZyATUXQYWctAmg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(82310400011)(186009)(36840700001)(46966006)(40470700004)(2906002)(966005)(7696005)(36756003)(1076003)(110136005)(6666004)(82740400003)(83380400001)(426003)(54906003)(26005)(336012)(478600001)(316002)(2616005)(41300700001)(70586007)(16526019)(70206006)(8676002)(8936002)(4326008)(86362001)(81166007)(5660300002)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 05:22:28.9745 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf322ab0-1c77-4c89-2fff-08dc2d1cf02b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5837
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

base-commit: 2c80a2b715df75881359d07dbaacff8ad411f40e
-- 
2.25.1

