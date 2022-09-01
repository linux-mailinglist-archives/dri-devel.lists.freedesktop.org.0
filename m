Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC745A99DF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 16:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C3410E71C;
	Thu,  1 Sep 2022 14:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1854910E71C;
 Thu,  1 Sep 2022 14:15:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxHdXvFoM7qhFZaAydXUM3Qw2ssw7KHJE9lEbX4C0mzDi9WqseGTtDT76OIy4dCdc8WXm+Aflm05fuJmHWrq1+zZv0/ZvcCdPM0dE0kKs8LDEnhVEe6mHhwRQkqctdHdDwhZBWYFCJ0S/thWKI2MNNbTlJ97bqXdHIW2i2t0FBGoyH0ugpGW4EeYWZtHLx/z6PJjsdf/pKuwBq6rxWr/961xvZrBgPs1v4Ym2PU/EQTDQkQQ7fe/+4Qfzwqke/Qim4TqxJtMomMFEv3/0J4lEaBqIZfteFbBqiVW2NDCZiuODFuMdX6qyBgz3O+vlL5F3XmfALBE6q0zdzTk9zoC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ah7+9BSl97VUtO4No6KAg41pDfyrvJSwwkaBAGQXQpw=;
 b=ISVTDWYcxbcpA+eHkXONMne4cI7+ZzOXkRnABLte6Nxot+oXmWSlkNYCm9NeWvy9wEudYwHGgYZMhxJ3Yymeb9CKWQ6xfm03VHEEzPQ8xfvrLoe0PxXiTlJZUe8lDYFAa+eC+UBAbXy6r1UbEVMCG3IQ9DCJn0ShzdqS8O6zh8Zk5tCgT0UXr5uejTCRxiYFDYuEO5xvZ+wCV6cGk5qmv0MMFfJAzZvQs4oYqdDQfFfdqHGkrhy/3xjv3n3SEt4Zry1Nf5K3hSJvfENdnvEZqRFVd8GtdXP+dkCx8V9ji70YMitZO34W8buj9jiRwH5up8rS0I2m9odfa9gUVe81ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ah7+9BSl97VUtO4No6KAg41pDfyrvJSwwkaBAGQXQpw=;
 b=NA1dJosHlsLX9OOwtY2YpQ+HPxPw2zK/B8es5+iOzsBV+8jkfmgUlXxbM55HoOxPxeklmVUkmHYO/3ybSXY+sXs0EzLPZ6It2BdGjSCF/FUgEcbPSJ8ID7MLqi8icpM3KQY4c7J9oRQo4/slaRN/Lpzpmgnjska2MGYhznOhTHs=
Received: from MW4PR03CA0349.namprd03.prod.outlook.com (2603:10b6:303:dc::24)
 by BL0PR12MB4994.namprd12.prod.outlook.com (2603:10b6:208:1ca::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 14:15:17 +0000
Received: from CO1NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::e) by MW4PR03CA0349.outlook.office365.com
 (2603:10b6:303:dc::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Thu, 1 Sep 2022 14:15:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT107.mail.protection.outlook.com (10.13.175.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 14:15:16 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 1 Sep
 2022 09:15:13 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/amd/display: fix indentation in
 commit_planes_for_stream()
Date: Thu, 1 Sep 2022 10:15:10 -0400
Message-ID: <20220901141511.50523-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e205516-3c1e-432b-7f3a-08da8c24651f
X-MS-TrafficTypeDiagnostic: BL0PR12MB4994:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y13xEf5mzJs3k8StSx8r7ClbDYexU8gBgCkVLPqalQLTlmFK5KyZi7Frq9ngM5/4ebXLp/d5HamyJdeQOTtFbQdKWDbNG0SFpd6TlSCeMYjFkF6oC0R/iSc//ZmHv71F+lDvXsz74NRd+SOvfqGIHhULOZIwt3xQWS1ZWKLAWzy/h7fawVu/GRVSxdLvwzNX3dYCLpxKCIG9xmmVCVVp4eM1LH0zPUAz3fpKqIxMf4/1EimySQvi1CHASXJDsdwyqDtr7QaXSTOn0S1NdjNrLex0PaXe40jFSuMnP0tAiuXVwojc5AkqFs6FAQh3kNVBOnhKDB8JgoSn6ytYDvuaDCPFXMDTWJ+M9xdI7ZzydpOeehvf20Zpy8p56zYpV3MFm24PnhciPv4CjCCkMcAjz4StOo5DiWkCc9R14fO8N2ivFXaY1pYrXptML07mZzELmrkYSA5LLZSdJaup/MwrzauWxUxxguQV6danfEvwOe7jFt8CEixbjn5N63rsUa/utkZlRBR9GrZ1tM2b4UNdgRxwqxvxMXHXuAKhosp0cvTzBE7tF0CbLznh0kqXzKUGP78r9ikpUHw1bNF2r/YJPVncyQzfcpXs0+H2ANZ7u1z3859T0mSGXfdz0OSxmehyltwR4f2iIhBzTmid0ehOC9WkDR5Lfz7ZstAn9k+/04m5/lW13l8EODGjCy4TujTpFmxJ8RWtmYjtvVOdC95L/o1217F8QaDW3ZwT0734jqewEC0T1O9Kth3slRLQ288FYmHDl0N0F0zq+rGshgQVQp1d073k/7PDTiUaAm4u/Yw2TSgxpyK4HaBUBfBIx83ebEncovp5g0LgvL6nAMxbXQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966006)(36840700001)(40470700004)(1076003)(8676002)(6916009)(36860700001)(47076005)(426003)(36756003)(2906002)(8936002)(70586007)(70206006)(5660300002)(2616005)(44832011)(54906003)(4326008)(316002)(40480700001)(7696005)(478600001)(41300700001)(81166007)(336012)(86362001)(186003)(16526019)(83380400001)(82310400005)(40460700003)(26005)(356005)(82740400003)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 14:15:16.6964 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e205516-3c1e-432b-7f3a-08da8c24651f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4994
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
Cc: Joshua Aberback <joshua.aberback@amd.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Samson Tam <Samson.Tam@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>, Alex Hung <alex.hung@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Martin Leung <martin.leung@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alvin Lee <Alvin.Lee2@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Address the following warning:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3508:9: warning: this ‘if’ clause does not guard... [-Wmisleading-indentation]
 3508 |         if (update_type != UPDATE_TYPE_FAST)
      |         ^~
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3510:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the ‘if’
 3510 |                 if (update_type != UPDATE_TYPE_FAST)
      |                 ^~

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v2: implement feedback from Alvin
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index b49237390cce..9860bf38c547 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -3507,9 +3507,10 @@ static void commit_planes_for_stream(struct dc *dc,
 
 	if (update_type != UPDATE_TYPE_FAST)
 		dc->hwss.post_unlock_program_front_end(dc, context);
-		if (update_type != UPDATE_TYPE_FAST)
-			if (dc->hwss.commit_subvp_config)
-				dc->hwss.commit_subvp_config(dc, context);
+
+	if (update_type != UPDATE_TYPE_FAST)
+		if (dc->hwss.commit_subvp_config)
+			dc->hwss.commit_subvp_config(dc, context);
 
 	/* Since phantom pipe programming is moved to post_unlock_program_front_end,
 	 * move the SubVP lock to after the phantom pipes have been setup
-- 
2.37.2

