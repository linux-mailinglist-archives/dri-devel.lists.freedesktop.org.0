Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6489F84D023
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 18:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7198C10E1AD;
	Wed,  7 Feb 2024 17:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yz4g4XAM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DE710E05B;
 Wed,  7 Feb 2024 17:45:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqNB0aTMvhgtmzjDPj3vkNq0eNB/Qgq9+3yz5BZ3jn/OsQxc+kHjKwVu96rKm5AZYyhaXkn7BtW/MPAK7hLYx8AlBvTctGBl9cse4PFOJ8ALEeXnDS+bUdMZxm8ThmcHCGcvkawwzqxSDpN3k42c58AIupjSXuGZEZVhxa7hfvpp596FvWv92nOpCIraKwSDpbDa2srya+U2hCDO4ctDe6akhWhN7Z6Clh8TypBuxtvmVxp/YHyC5dwY2QwLrI3gaXNWeV/MA0YsSoCgppMnkYmqhT0Jl/3OxlGPW1/k+Ny7Ve+srBGGNPPX0/hu8iY1+Zstj0trXsV/PAvuMAawOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UybFIMbL/Ogk45wDfGizsWZG2Xj9zMxQg0zK9xfqft0=;
 b=U9QmdD+EuIJX5Iw5qutmQV76ysTSFeACvyY/UUROhIa7+R9RHtc0LG8SdJbY6VI+5R6NXtj9Q0kW2vI0P6IA0xULF+k1YfF6ilMLweiaIhzo3vHPG7ENB3Khv+hthRjhCsv8jqUA/36ePjGsPffQjs8D7rGt+lFExuxSfUN0sEweHFhXrgzjSSys+0U4CyQtDk30dthd8x2fHqZ+CYVHthqCMdF0gMYxDEJSM4o48L10Ecnm18+sUMOEuBySuGwxfSdTrHRi0UH6yBE4a7uZRhqwo+aT8u2VgObiRbgaPOtyGYmAmGfYaJP1Qe3i3n9MRZhjRs9CbWlG2CPWhASBJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UybFIMbL/Ogk45wDfGizsWZG2Xj9zMxQg0zK9xfqft0=;
 b=yz4g4XAMHvJjo4Lo10doTdTIKxBnKqH2eYfa+kktn/ypewyOwCQxUYoh69YQJqTdy+U3YVSvvr94x9FxR2O4ATyamB7KrNO7KUk3S1SfBbsAGiIwmZAido6VoambjtAxaCvRyI8UGci+L/ghRW0sSvpP2f6vbW7wxh+q4m2g/RE=
Received: from BN8PR15CA0057.namprd15.prod.outlook.com (2603:10b6:408:80::34)
 by DS0PR12MB7825.namprd12.prod.outlook.com (2603:10b6:8:14d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17; Wed, 7 Feb
 2024 17:45:24 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:80:cafe::59) by BN8PR15CA0057.outlook.office365.com
 (2603:10b6:408:80::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36 via Frontend
 Transport; Wed, 7 Feb 2024 17:45:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 7 Feb 2024 17:45:23 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 7 Feb 2024 11:45:20 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <mario.limonciello@amd.com>, "Arunpravin Paneer
 Selvam" <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH] drm/buddy: Fix alloc_range() error handling code
Date: Wed, 7 Feb 2024 09:44:56 -0800
Message-ID: <20240207174456.341121-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|DS0PR12MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: a68483a5-2ea3-4133-d51a-08dc28048fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1b7deJ1HA/mE1MzulLG6xLSvyB58hOX7GutOls5Vk748o47gIpLPq+7WevPCP9K4FdvoR54SuELpvrwJ/1CGjMjT+JYGNZ+2OdCYqFD2cVYwc7PbH/gL9Cs/0CB0tcdXHn9cu6ngpogwzMewb3/i2U3doariAt5dB7BD61KX4aITPIcqOq4m6VuVrO+vU3WlFm3XsB9/RTp/ruOfA7VJZf6i7iaZsITIaLskEi/EUyqLe1YiwdiT3lli+LK+1IgUIrDayjCoukXPLMMkj8X+rGzwvQJzWTTVkTpPYXiXUBAK03xohQ6BujfN4RvknYQvsovcSIZMjH1A43xHesT0oZEvkJms/BGFOfdZ5J1LxfgVioqsprFEm3cTQY03qSZd4g4ibK/8Um6vax/f7jOSk92J46iF5UVcvvVkyB/FMd+Uf2H2yp4FOJeokAkI2FTvC3tpkhIxXJe1lKcyWSdRLqewNeaLh6XVQTV91U8p70LEZ1y5c8/T5xcVcToKVZzmgInZEaH+FlM7DZxzI679fXuaPMaYoygdaAIcsUjsPgzCrIrsNJIzjJlhX8hq0jKPFH15aouspqyByake203PvaW91O9r6r/TK2U4pvjkwSqQCtE1Ni9lhO/9p+9qV3tdK0110k1av2vHfUvdJQVQkbNPsRzHFQeOa+vIMwLtIv2Uyij8WfeTxP25egjbE6MvzsPCrY3navOSs13h/LiDoj1VrDSQRrNE9ohR3rolEaP6lJIxGhQXZdK2a3rg8XOM
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(82310400011)(1800799012)(451199024)(64100799003)(186009)(40470700004)(46966006)(36840700001)(2906002)(41300700001)(70586007)(5660300002)(356005)(8936002)(4326008)(966005)(36756003)(8676002)(70206006)(54906003)(82740400003)(86362001)(81166007)(6666004)(110136005)(36860700001)(478600001)(7696005)(2616005)(316002)(426003)(336012)(1076003)(83380400001)(26005)(40480700001)(16526019)(40460700003)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 17:45:23.8170 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a68483a5-2ea3-4133-d51a-08dc28048fe5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7825
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

Gitlab ticket link - https://gitlab.freedesktop.org/drm/amd/-/issues/3097
Fixes: 0a1844bf0b53 ("drm/buddy: Improve contiguous memory allocation")
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Tested-by: Mario Limonciello <mario.limonciello@amd.com>
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
-- 
2.25.1

