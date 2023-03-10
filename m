Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B1F6B503A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 19:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450ED10E31B;
	Fri, 10 Mar 2023 18:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959EB10E319;
 Fri, 10 Mar 2023 18:41:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7BVvSBTg4Pg7XO8cItxIK1jwX7e7a05u1v13OnLx4n5GgKqbfNcJLAz3TCpstfUkvzn5yqrrADqm40idqJO/ucsc7HIp5LrCKkKmbv5pAT5GiZyqX0WDWqTpRp9Bk02jDhfGF13KpaiEvasLzru9xfoj38b9AyGf4t3ddpqo/IJwPx786nd7pCsXlDR4+cwD/SuGsLZs83fjRc9gRT2ePIsEtspNQx1DUwcxY2HG/qZaqaNnctGQTmfEpMNOTyImgb4vP/fihMvZvA2QIAKvX0BN/KcYH/W+k5OAzEuw+6vLzvWSxxbuWpvFjoiOCnlG3j4MlYiJuTPE/shdvpeXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3mb7OXmR0KQmFQhUL3FGCV0dKKCgMQqJOF2eQ9Cazs=;
 b=D3Zx0FgulPEzTb3XXmiM6PY618cs/7Vxepx7OxnqSVhq/BYUW6etZfmxxpeUtB9AXjho5davIJe9Y3bcNZkPBMFYRqKg9ngVDpiGWRpevfXB7/6XycQMyS7pfi5+tXaUy2ZCv6VdiJZkZidrrohyIIxza5UGV+KMHgyNdo2plvVuOGnGTwjtsysjBV4TKzWF2sw1KIn1+oqlc1T9tW/vvfjSay3MIGZuaIvoOR7sGgxy86O+DWURMzJWL0QiodZwqtSjZ1N0VI5n1PbbNDs/mjLjSqLjs+OyqSzSFrAuo2SFe75cFQVVwusrJMIcgKUqmMuHDqpaerGjBhNXOmjd7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3mb7OXmR0KQmFQhUL3FGCV0dKKCgMQqJOF2eQ9Cazs=;
 b=slZacDEdEAL6gpmpEE73+ykj/f+LEuOZlvIVrgI1aYUMFgfgoAM+vNy+V0IAjp16WU9+CBfALJVT+pUiqgB87ID6KgYHGKCFfLauBhRuxrYxB0/70Mcadune+K77FTODV8RgTjcMpLyy509SPk0+B4e8zVcli5IdHFv/Kk0iNmM=
Received: from DS7PR05CA0104.namprd05.prod.outlook.com (2603:10b6:8:56::16) by
 BL0PR12MB4852.namprd12.prod.outlook.com (2603:10b6:208:1ce::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20; Fri, 10 Mar
 2023 18:41:28 +0000
Received: from DS1PEPF0000E630.namprd02.prod.outlook.com
 (2603:10b6:8:56:cafe::85) by DS7PR05CA0104.outlook.office365.com
 (2603:10b6:8:56::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20 via Frontend
 Transport; Fri, 10 Mar 2023 18:41:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E630.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.12 via Frontend Transport; Fri, 10 Mar 2023 18:41:28 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Mar
 2023 12:41:26 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/display: use a more accurate check in
 dm_helpers_dp_read_dpcd()
Date: Fri, 10 Mar 2023 13:42:33 -0500
Message-ID: <20230310184233.284388-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E630:EE_|BL0PR12MB4852:EE_
X-MS-Office365-Filtering-Correlation-Id: c849887f-e3cc-4c8e-0790-08db21970f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 52BE22lALr5ZleHAOjxJTQuZNjZ6T4+Z68CIp4m02hdGG6ffRl6+cdF81caML/3Zpfr5qNwXLdLlQkp8b9I6cnTmjMktuJZpGsxPf6OiCIAibPKFznd8N4oyxhvsJ3LDGeyYNM64nlrXsHC0r2MDrjukQlVYqtkl6oRALymsBLNWiAUoxXoZntjve5s//mlQCLABxapoHJqab8XcHvGNKtjrRS+K+dNzsJN5LfKxVR7X9Jb8a3bVmmTg3ey5s1Yg1wgTuQyG2FihiEym2dY6YWoipWkRLWgVG8o/QkEZzoLPIDqHfv3R7FZ1v3xfq8/8h8oVGHTNGIHbse1lRtXOzQyuejMWjAcMsHNfZba5rSCIQUl7TgpWvA+Ou/HLWyYTctKe1KEwhQCp5/tGKti3qr+Ya41A6neunuJVs3RU1VaPTLJyoOqgPTDv6z6KuoT1gfzgDOzW2BEdWMvGSk+Oh6MnZjDr8shf+RIApF+Up7gAMU/53aoISXAxC+DRx+T/YOzeOKASg+aOFDOFho9Tpn8vXvMbrDJOz4RVGg4uABSajyX/0NIynuxvkhGEyxP1DInWb1Lf9naIQciQAjBmDfTJ0V53nQxMQUPmMUZekmJsXbqUEqCn3T378fiTRx172Bz4mlKlQJtlXFWq/Uy63Wu58+p5qB9NRjrWETqhusnNTp2+7gQwju9WoQHzXYocqlR4eoKjDkqT276ypqDGWnz8YW7H9uRDOlnkRnuXIyXSwKVmbhwuy8zX+d7xUGRBaGjPtxagQ8ZV2RPyByJTXw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(2906002)(81166007)(82740400003)(83380400001)(4744005)(44832011)(5660300002)(36756003)(40460700003)(40480700001)(41300700001)(70206006)(8936002)(356005)(8676002)(4326008)(6916009)(316002)(36860700001)(86362001)(54906003)(478600001)(82310400005)(186003)(426003)(47076005)(70586007)(2616005)(336012)(16526019)(1076003)(26005)(6666004)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 18:41:28.0229 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c849887f-e3cc-4c8e-0790-08db21970f24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E630.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4852
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
Cc: Leo Li <sunpeng.li@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wenjing Liu <wenjing.liu@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sung Joon Kim <sungjoon.kim@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We should be checking if drm_dp_dpcd_read() returns the size that we are
asking it to read instead of just checking if it is greater than zero.
So, compare the return value of drm_dp_dpcd_read() to the requested
read size.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v2: drop the WARN_ON().
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 8d598b322e5b..9c1e91c2179e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -511,8 +511,8 @@ bool dm_helpers_dp_read_dpcd(
 		return false;
 	}
 
-	return drm_dp_dpcd_read(&aconnector->dm_dp_aux.aux, address,
-			data, size) > 0;
+	return drm_dp_dpcd_read(&aconnector->dm_dp_aux.aux, address, data,
+				size) == size;
 }
 
 bool dm_helpers_dp_write_dpcd(
-- 
2.39.2

