Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F6778C37B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03D110E2D3;
	Tue, 29 Aug 2023 11:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834C610E2AE;
 Tue, 29 Aug 2023 11:40:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXmbo5hJR/sYMB7IpKkDKTeqmknUfjAOqLvgLYswjuFkpn3J2kgi5SO3JXZErOdJZ8G8cYkYU9YCfyQcLANLVwEuN3ifLh5egdA37O8eKVOgRk7FG1Uu0TXjab2iJIN7mzgaO2ax9kBuyUCEcEpBMRzHotRLQARYUeRzOrB+HQc2khm5U7udWulzVeBUhY5cOPicLL6L78DA5/ON1tgDj0P7W1RJSMAc9RaGuYWG/XAr2ItfYivYBpY6HV2ON1+9H5yeFgvHa5pT4C1FYxMlgjBdJmqet5hvcqKsqQstAbZobfYH2MyjFS5/vQ7piIHwYQmktv5AVDdyMB4Wt0RPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtvAH2qRxU+GUWmAlfX6gcgsbFJZVUhwDj07oUoXyXQ=;
 b=moNuv/ODBfPbKLwzmhYewB1+0Obl5sv28eOg6DfltFkuk9LCWuJdY+ZiRxJS7cAwRgSIofhCCLH2w6YM/Y0TK8nH/kF8Hghan23foV2Zm+N7/LRlOWDDpPzn4yExsChxmOjLl3upcnRaqKt+vW01rym7b8NK3CjTwxabNTu8DMVVoWkceriyJh9M5B9H1h7Ef8hPDbP8Z5O/DLCj8XGb1GhhAPGbS8CP/QJmH2/ruJpe41D3nRcl5bOMa7XXkACJm4Z/oe3BvJtmRIQw2biO4s6uMmcTshIG4nyPFAf235Qo84ZyyLxuSwoM/E+wZ0FX9RViKEmMjYikPtC0AGOxhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtvAH2qRxU+GUWmAlfX6gcgsbFJZVUhwDj07oUoXyXQ=;
 b=eZSrb+v+V/mT0nd2X6MJmUE8Vu0sH43PMqGcbDnv8QfL/uCc7iAj8PRX/EC4F4Z5pM8Wu7qB/m/C+IxIk39cxfJLMyTVFZ794m8lfY3b6BP98t1JVlwzeUQsGIm0BahTGDiMxC8VgYW8b5XZ5ST6dFs2nXagOxiH70PjxqVTXdU=
Received: from SJ0PR13CA0105.namprd13.prod.outlook.com (2603:10b6:a03:2c5::20)
 by MW4PR12MB7117.namprd12.prod.outlook.com (2603:10b6:303:221::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Tue, 29 Aug
 2023 11:40:01 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::7e) by SJ0PR13CA0105.outlook.office365.com
 (2603:10b6:a03:2c5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18 via Frontend
 Transport; Tue, 29 Aug 2023 11:40:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Tue, 29 Aug 2023 11:40:00 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 29 Aug
 2023 06:39:58 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] Revert "Revert "drm/amd/display: Implement zpos property""
Date: Tue, 29 Aug 2023 07:39:30 -0400
Message-ID: <20230829113931.54391-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|MW4PR12MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 091a0b88-c81c-45cd-4f0a-08dba884ada1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DbcWd8HKnu8ZdcMNx4+iOezJJbfbF/XN7qIo2dZklGCSCFYuK/UM2R+BNaCGUlxI6L97t1eDs3ef3P7G0LKvpw4XKMoJKlUId3rHVrAglPJf4EwiK5AWewly+UUhTnrsxvWT3JcZehPzT8b86vfjHRbtmVcd2lnHqN1FsRmdO40kMtSwvadzORD74JgGzPyhDzH6+JPaCCS21tcBqni+6ehWZkjUZ3H2GyYxTC+rja0o5Cgksrod+r9MyHyp1FMoDKvV+nHjUwUkin7Db10ms7oIZ22t+CM7vWChepoWUM6PyJHRHgoDdROtFviCNCXWTwYb/GWAR+2kUYldzlOmSqtQ5OdBjtP2wY2h+cLq78sAGi5pscyEpI2ghSdCiJ5k75wjU2/eVUv2/UWPPGo3Nr2B/6bxRQLu+eEWBnWHRj6aIyIfU1UjuguHJBRH1r+Marx28eVmQnMwGaZ/USBrlbFmAkj6041Um2AiucNi7fpZ8YdwVZW7lpPCfcL2ydjj/4ZDHEW8Gb/k0sMTTzUyPAsBQ46zUlXIYXAifUBJzhvgrUbqotaqG7mDWbLP8I+wNWtLr+b+xd54LCDzM7xNBuHxgqCalSG2GSZ0cMUGmzsUO4rIYDlfJ4UWA0CbR1FCMUyoS96EhEXb96n3nmyrB3prPz7Rqt5r3xB61SnnzVqHZYaZBEqoP1Tcwg0e0zMoCJD8tZyYbYaRIcLYmFHubeJCjZUkhbwQWWd6n4TmOjb7o3pYuIRlOx1AIE+au2sd1nWuwI0mpvLthHCGkXO4SNL6KgLWKkMG3cDu0aRC1yg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(82310400011)(186009)(1800799009)(451199024)(40470700004)(46966006)(36840700001)(6666004)(966005)(2616005)(478600001)(1076003)(26005)(336012)(426003)(16526019)(2906002)(316002)(6916009)(54906003)(8936002)(70206006)(70586007)(44832011)(5660300002)(41300700001)(4326008)(8676002)(40460700003)(36756003)(86362001)(40480700001)(47076005)(36860700001)(81166007)(82740400003)(356005)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 11:40:00.3517 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 091a0b88-c81c-45cd-4f0a-08dba884ada1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7117
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
Cc: dri-devel@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Choi <Nicholas.Choi@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 984612bd4649c91f12e9c7c7f9e914fdc8ba7d3f.

The problematic IGT test case (i.e. kms_atomic@plane-immutable-zpos) has
been fixed as of commit cb77add45011 ("tests/kms_atomic: remove zpos <
N-planes assert") to the IGT repo. So, reintroduce the reverted code.

Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/cb77add45011b129e21f3cb2a4089a73dde56179
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 894bc7e4fdaa..df568a7cd005 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1469,6 +1469,15 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 		drm_plane_create_blend_mode_property(plane, blend_caps);
 	}
 
+	if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
+		drm_plane_create_zpos_immutable_property(plane, 0);
+	} else if (plane->type == DRM_PLANE_TYPE_OVERLAY) {
+		unsigned int zpos = 1 + drm_plane_index(plane);
+		drm_plane_create_zpos_property(plane, zpos, 1, 254);
+	} else if (plane->type == DRM_PLANE_TYPE_CURSOR) {
+		drm_plane_create_zpos_immutable_property(plane, 255);
+	}
+
 	if (plane->type == DRM_PLANE_TYPE_PRIMARY &&
 	    plane_cap &&
 	    (plane_cap->pixel_format_support.nv12 ||
-- 
2.41.0

