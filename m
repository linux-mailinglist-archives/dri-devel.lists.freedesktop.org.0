Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E578049F1F7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 04:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58BF10E33E;
	Fri, 28 Jan 2022 03:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E85C10E336;
 Fri, 28 Jan 2022 03:47:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=li2wl1csbqRa/lMsLst5BPmG9kHMKROwasiaJGpNPjc36h++rzBPVFxHoboN1onKMVwyOR1z9Is2qycv/Dr4NaKwrpQvqPiHfcEB+QXsBekbuaqaz0xqO0GwguqC4P1zGTS+d35HSX5WtPRBVyHvVdAiYS+w9Q9pKswMGsmjWKw7dseRBqyf87yMB3m2h9auvoaSGQDN0kkgOlWoqrx8oDsK+BRZYcPxre7RCtXhNTgl1BF4bJjaNQdI7iYPuIvjBYsss4/dWbuPUN3ljJOUqy+iRlF8d/LHDmhLK1Okh+S8PQXxXP09+RfItdHjcnXrsApAqKX/yr4qxMc7JBcdew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gufNoReGaukTvhnLaKJLok7k6y2bq1db6ZhDiKhPiSM=;
 b=lpZUNGWZ3yHyNkZyfK6S2KCuRMjvAm4LXnwhhtBRgfDaa/HuO0Fz72Ty/01bVFfwOspIF24D5LwLXtD+Q4KjvggTMuUCmC1ybGldbXH9iw0Ap/S6/ietOs1oLV39El56kJRZQ4/Qz77tX9BQo0tQf13XkHrSYmoxG5hvw3vUs+AeC6CFsOUmJqm43XvEfqR75TcDBfcKiU8JcvugNkKQ7oVMJpopWDHKIvhscM4hnu43lcwwpmdPW6dkK1TKJZcXREkgU2+DLllyssX7aana8nS9hFuoHKtJ7ZItzXgq99iz9qHTTa7xo0CUJnkrEmnf5wtRE3xGN5sKOmczlO8fLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gufNoReGaukTvhnLaKJLok7k6y2bq1db6ZhDiKhPiSM=;
 b=kH2uO/7qa5iGZB/G4bxYvG5zNYeznuXSES4RDTgk6WuKEfuW4Qvc7V6oD7s1lMOMQKg4bHbrkKh4vIKeBavuVgeK9Vv3w7AMd9u/zNkMo115TnfctJ0Lcif47Bd/qnuHb2gnilYyTe4fJenh1WNHrE/sx4fEG9VkaHbzKZya5TE=
Received: from BN6PR19CA0058.namprd19.prod.outlook.com (2603:10b6:404:e3::20)
 by DM6PR12MB5567.namprd12.prod.outlook.com (2603:10b6:5:1ba::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Fri, 28 Jan
 2022 03:47:02 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:e3:cafe::53) by BN6PR19CA0058.outlook.office365.com
 (2603:10b6:404:e3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Fri, 28 Jan 2022 03:47:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 03:47:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 27 Jan
 2022 21:47:01 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 27 Jan
 2022 21:47:00 -0600
Received: from tsunglin-chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 27 Jan 2022 21:46:56 -0600
From: RyanLin <Tsung-Hua.Lin@amd.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <seanpaul@chromium.org>, <bas@basnieuwenhuizen.nl>,
 <nicholas.kazlauskas@amd.com>, <sashal@kernel.org>, <markyacoub@google.com>,
 <victorchengchi.lu@amd.com>, <ching-shih.li@amd.corp-partner.google.com>,
 <Rodrigo.Siqueira@amd.com>, <ddavenport@chromium.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <leon.li@amd.com>
Subject: [PATCH v2 1/28] drm/amdgpu: fix that issue that the number of the
 crtc of the 3250c is not correct
Date: Fri, 28 Jan 2022 11:47:01 +0800
Message-ID: <20220128034701.17174-1-Tsung-Hua.Lin@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f667e197-ea05-4559-9467-08d9e210d83c
X-MS-TrafficTypeDiagnostic: DM6PR12MB5567:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB55672D356BB6F998F64524CBB2229@DM6PR12MB5567.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RJZ6gRswcpAiVAxONMUCs7yXwsy5tQovfAYt19hlM8VUOul6QWJUGu0O3SzkH8/BKVOQO3ZSAO2wfFTcibhSF7wuDvAq21NklZ7FwRA8+2MldhxRQk9LWCbhXzYvIm6qxmL2a9DyXJhJwkWqaZGNfQ5ZJvwguqdif2ESpr9mRQYlrJ/GJuMoqPQv1rMlOyEY41quBC3rn5DsMf8xWhSaDPe2lat9gZgKLDVgdJHA6kqXybx5qmm2v4rBFxFjtzcAJMj7IoottPkX+ak83nwwVq5niY03syuuZenarlEc/4Ce7hERxyKrrJDEE0mON+Rxlw4OGh4gcKKgcBAWm5Ktq5JNek5MC1ehVEd+Exfe4CPC3ahksOdGMlxOyYICZ4Yg9sDGS9HKXMgzARDLlMKvVhHwgcJIRqKPZjC0Q4rvYmxOAdCezHjQgSbiRxB8WIYfbA/1CBBKQHvresnh1o9ZFZiMVFKJY3F98LUOsReWC4668RCcbUrE8uCfWWDp2zbuusBlzU1URhIfPTBpg+n5uS9bWD54eoDUOsjnW6fek1I0SdgT94m+72oGy2znOkBi3rNighiNeDx7Oah0IZfLGjoHjasNmBKaSzw/WfCUQ8ydmDQM6kkRIQVIxc1FwBVCO/RSQx9RNMSk0CirSP7B2z9R+xi/sEPc7BzU2Ts8FbRjDriPVmPO9NDKa0u8NCQ+WYUQ2TTx22uzX2FE/mSCFsArkKPliMyVJedJjv7Xrjq+H8zmSrmPVlmFeDQaYTZuTzqrdRM3TKmO2WB7yOoe0Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(81166007)(70206006)(70586007)(5660300002)(8676002)(4326008)(40460700003)(8936002)(356005)(921005)(7416002)(47076005)(36860700001)(316002)(83380400001)(6636002)(36756003)(110136005)(426003)(186003)(26005)(336012)(1076003)(508600001)(2616005)(2906002)(82310400004)(86362001)(6666004)(7696005)(36900700001)(83996005)(2101003)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 03:47:02.4057 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f667e197-ea05-4559-9467-08d9e210d83c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5567
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
Cc: RyanLin <Tsung-Hua.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2:
  - remove unnecessary comments and Id

[Why]
External displays take priority over internal display when there are fewer 
display controllers than displays.

[How]
The root cause is because of that number of the crtc is not correct.
The number of the crtc on the 3250c is 3, but on the 3500c is 4.
From the source code, we can see that number of the crtc has been fixed at 4.
Needs to set the num_crtc to 3 for 3250c platform.

Signed-off-by: RyanLin <Tsung-Hua.Lin@amd.com>

---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 40c91b448f7d..455a2c45e8cd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2738,9 +2738,15 @@ static int dm_early_init(void *handle)
 		break;
 #if defined(CONFIG_DRM_AMD_DC_DCN1_0)
 	case CHIP_RAVEN:
-		adev->mode_info.num_crtc = 4;
-		adev->mode_info.num_hpd = 4;
-		adev->mode_info.num_dig = 4;
+		if (adev->rev_id >= 8) {
+			adev->mode_info.num_crtc = 3;
+			adev->mode_info.num_hpd = 3;
+			adev->mode_info.num_dig = 3;
+		} else {
+			adev->mode_info.num_crtc = 4;
+			adev->mode_info.num_hpd = 4;
+			adev->mode_info.num_dig = 4;
+		}
 		break;
 #endif
 #if defined(CONFIG_DRM_AMD_DC_DCN2_0)
-- 
2.25.1

