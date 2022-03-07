Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425174D018B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 15:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A5D10E37A;
	Mon,  7 Mar 2022 14:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC09110E132;
 Mon,  7 Mar 2022 14:37:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJ7oxpfxIWnaQxrsPcTJxiZJWH5eWpHg7f4UKD3s+Co9HbdfSh6N2L+Akajex0DUMh+hC8OVJIiHXqv+TTmiDDbVHht06ZDzPpuxEK2OKdnq3WfVL+M4i9AHjQbpuDteRSSK6/cHnkxYRV3Wags93uVLImxDmT9ZQCIfDfjXV7QGu8D2xKzdwcMccczPgijU2UMU0Om6t5zZf0eSXuU8Eh3IyDIVK3ODUFEPfSbeki6kL58P0FydPXS2ASkjiKOQNywJJ0Si9OD9tUoYTA1JL2cuX3TnE+ySQv1hSpH4vshjuYN3G8TuLBojIYUvO90fk4eQ84SXZgBWc0V04rVT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DF52+BeB8bfTykF4kty2hCJI7KsfA4alZS6gSDfGGoU=;
 b=jO+dgE4L7FfxMP9QsJzS6DSsPKhtIm8RGNhLeqveRFleSb+tJ1fh0DM/h8N/skQ2tKN49xM4ZmDfXC7SKKM0ohnsQiXGqtHzJU42hU067LLcXe9r7emRg8lStmyawygQpnMCiMAGcsWYzgtsvBjPq0AkNXBJplgexwQEeG2V+VBeIR9TRnp5GfmmcVILtpZDEqNHC3qwuWC72hres0ZdboaysT4SBAa1+V7O7OD7WvnsRNiQSSsplPaf6Mxl4RKEtwKwIcNtTN+VaxihHYNUJDR0ax1xpWxYGXaxKXxNTnX5DYDVLznZprBggh9jnlH7ISI5p2w5bHQp0FGPw0QtsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DF52+BeB8bfTykF4kty2hCJI7KsfA4alZS6gSDfGGoU=;
 b=mQlwDYz9FNiE2ZP/J/vuwjVU/V1ULK/zorB3xwuIO17Oqc/JrFV+HzaVfhD5bC1NKIFvv9RxSyhkDPkSDkFvB8QzJVjLvSkdNmEyGkHbxjfCXlIprBq0C4ROvHi15GsyOSM9DlB4mLYKf7RNZGIB9mXDXVoBj0wll+iC1eINE8w=
Received: from CO1PR15CA0099.namprd15.prod.outlook.com (2603:10b6:101:21::19)
 by DM5PR12MB1131.namprd12.prod.outlook.com (2603:10b6:3:73::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Mon, 7 Mar
 2022 14:37:37 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:21:cafe::a7) by CO1PR15CA0099.outlook.office365.com
 (2603:10b6:101:21::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13 via Frontend
 Transport; Mon, 7 Mar 2022 14:37:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Mon, 7 Mar 2022 14:37:36 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 7 Mar
 2022 08:37:26 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH] drm: remove min_order BUG_ON check
Date: Mon, 7 Mar 2022 20:07:07 +0530
Message-ID: <20220307143707.3687-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ad6cebe-b15f-4456-157a-08da004805f7
X-MS-TrafficTypeDiagnostic: DM5PR12MB1131:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB11313C22E5D88BFB29DA6346E4089@DM5PR12MB1131.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Duzbyxny5V106Eq4IYXu9vXn4lLlpcJidRRcOjeSGM5etuot+Yh5BrpzN6UbqYtLrdNMVV+UaNuUrlaTn/Agw6nVZTAYqHnB52mUxnEZIxyuNOfhLrNxSSNYIVSBVO4Om3b+D7TSzvtHe27NGXO/aV8gC6BWZc/6CccyNDlcrRsZOvRueA2Hp+Z7sxSmbbrOwFnuBzcyVJvcqwMjmmhYyznW1gyaKR0MDq2kEBBGqa63JkUdocfzZ8QRPTJBP8PVhAKGDYa+pBl4IlENQqh052Lk726NO7Jz+syZFGGTrXxzd736OXxio9OtjKf0K/+jHc1JMBRpwPGN7uDny92uYuM4OmE5HbeOddDSsinjp8cuCKWwjLdNr+Fu+iuUjSP3VPQ2yPqi89xPtsUY2Q8K/wrUrVFCHeHPejPogYd1EspvtLYVKdn5D9sgeYaVp0fm78Z3Keg0Ef2E/tZcu8G8EiyIHQYoPdPEnOoTXiRcDywm0tLplKP+THHTOjlPeuh5T7vFhu9Rkie4pZ5jkoAv4KobZCcFZnukb42QAjuGbpCUMJkalXpnQXPKQHjXmutb/lK0iVFzoJVgQAAUIXMQ1di8LMcid1PeRij9fS5rS6jFTXJZ2xqEvgFMDMUxYwuNzKUFbVaANn/J2Zu8cGf8ApYZ2hmVMrFLfkU7snlK/Vv1eMiLZz8mLZ3f21hsxwNttXALBk5QaLIox++blyJSHg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(186003)(7696005)(36860700001)(54906003)(16526019)(110136005)(26005)(316002)(40460700003)(82310400004)(356005)(81166007)(336012)(426003)(47076005)(8936002)(2616005)(70586007)(6666004)(83380400001)(86362001)(1076003)(36756003)(4326008)(8676002)(5660300002)(2906002)(70206006)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:37:36.2195 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad6cebe-b15f-4456-157a-08da004805f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1131
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
Cc: alexander.deucher@amd.com, Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

place BUG_ON(order < min_order) outside do..while
loop as it fails Unigine Heaven benchmark.

Unigine Heaven has buffer allocation requests for
example required pages are 161 and alignment request
is 128. To allocate the remaining 33 pages, continues
the iteration to find the order value which is 5 and
when it compares with min_order = 7, enables the
BUG_ON(). To avoid this problem, placed the BUG_ON
check outside of do..while loop.

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 72f52f293249..ed94c56b720f 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -669,10 +669,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 	order = fls(pages) - 1;
 	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
 
+	BUG_ON(order < min_order);
+
 	do {
 		order = min(order, (unsigned int)fls(pages) - 1);
 		BUG_ON(order > mm->max_order);
-		BUG_ON(order < min_order);
 
 		do {
 			if (flags & DRM_BUDDY_RANGE_ALLOCATION)

base-commit: 8025c79350b90e5a8029234d433578f12abbae2b
-- 
2.25.1

