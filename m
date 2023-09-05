Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2510792DCC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 20:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6145D10E445;
	Tue,  5 Sep 2023 18:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2089.outbound.protection.outlook.com [40.107.95.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CB610E0EF;
 Tue,  5 Sep 2023 18:53:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qd3ngPFH5nLw+9vmY3wVmHzTnZyBIxOOKh3AOT5qdGvNvb0XAYQQvWBlGpLOkH0K3Az2yiGhaWS6dbhoIPbcbmSBALQjkqJU8yhMX26yk/LNGt/bpciAfl/2QGSL5RVb/ZPKLL8jt/kphL4xF6ULyhUOd76R+SfrEbCNWVo9YRoDnKqoiLPCRFfv62NN4CkahmjEoK6Fp64X2VoL701+LL5oaSvavzU8cdN7cNZXVisf9hizkgIEE1USQf4VjIRGzanNa+7gwC4cIfHR11VHgX3d6fpch48Q0lHuqdZg4VGjLkjFVYKaAayF7M826tAsNA5y5R1cgTsCDyZvrfVuTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bp3ak/SjhdvLl7Q/X3K00mHhnoEnqXF8UbNZ5Vm2Tw=;
 b=Uf/TlYAaq3jR0X69k5uX2HVSIdqbopJJMk3+WagTk3zTVR/1FQl39tC8iK4xs+MWDmlRUxWrVRNch+C94RMd4waIpxekm6woVs2QHG5+WoZlbhCsTUqmZ1m05vrXF9CwRCksIcWASURsmzuY7ErYACYOFVD5wOnzW/LdqugX5uJqVrnXU/oIHL8lx/5u1i+gPGrSfLAVpncDl8B/K3naACJubkCehb9qh3LKXvQcOzGPK84wC1aRSMwuRf2V2+hpcN3ycQLFXa77u1vCKgUaN6elQc4VlUudL7Wpdyis/YIAVJNpLYUW/7/uTF6oWSzAhz1UA+LmLAZCUgDi7q9mCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bp3ak/SjhdvLl7Q/X3K00mHhnoEnqXF8UbNZ5Vm2Tw=;
 b=Sw6cH1paZEzekP0Q7cMUKwXhJbcyImVDjxDfsMDIPjESzMpyFz7stiRxWPSEu5VB8/snTvJr7r2gT/Ez+7y+MZIaWueCsz9sGgYeV42YJZE4nHkVSS2LIZcl0ZYotxZ2YWyBruN207apPurqy8Vc7I1fbpSidwlr9uzDqo7PrnA=
Received: from DS7PR06CA0024.namprd06.prod.outlook.com (2603:10b6:8:2a::8) by
 PH7PR12MB9256.namprd12.prod.outlook.com (2603:10b6:510:2fe::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 18:53:48 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::cf) by DS7PR06CA0024.outlook.office365.com
 (2603:10b6:8:2a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Tue, 5 Sep 2023 18:53:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Tue, 5 Sep 2023 18:53:47 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 13:53:45 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: prevent potential division by zero errors
Date: Tue, 5 Sep 2023 14:53:28 -0400
Message-ID: <20230905185329.26934-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|PH7PR12MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: 132d4fab-e30a-4c79-8481-08dbae417012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7n/z/kvblcRqLo0Z8sjKzR5wuawJ2mZwFps2WwQ5ArdKzmliTSl93X3s2pF0ViLG0B2Fm902kDvnFR8GSU/wS9cIYzCiZl34wzSogyxwupFMproxJnENo85BHW6Hjzo2pMXx2dzDPDuUIjfLajspPwOdN+vjn9cqrpAxfsyVpBxpf/lrxKZN4kTtNEjwOaJP9t/h/aACiPmKk80Ph69qyHMoMu1EG0esE65ikzJiyE7HXExBXq41pO6IfKGp3jqkEkmCl62OaJkfmi/QRsyLIyd042EV1l0P2tbwpqPJXZNA5shlGbAdRvk+mjijdyq7q6yF2xcgBPgtsgd0bMsL2CvkCeuJ8dw2bN0eJwRq0jlTh44NrvU1D54lg20gHFa9atdlP2T5kFb4rJNNLCJOoaH0vVjG5Zxf78TKATHAXDvzqOSSgUOgSEmy/mAx87KvQUetaF3GgxoodVhFWS3KWoLGbXNYz0vUrOsFhtS+JmIvjco9EWp+EgFJgo0gGLbLrg9eHCyllRwNteQ/mcuTRkiSsasNfYHS7/klwh6DV8WD7drFX9VoNSG0RNPlxL0dOlNycwG4jhtawRigHwyQ5NT7l2V2hz0s7T0hcibZqDqlebQKS3/AIoSUKeumK6GLrJbiVmLFlW+okCFm5vwN5rSc8+Sc92u8yiZxKo109yYvD4IcR6Fj+9oOL0n/It+ixnkshVH9PgtMb/0LYwZa3HAJLBTrPj0L49lJMORpnY5OhSv5nOx8LPMZ1UU56fSBa3hot7talBJu4VewWHfWdbvRfvwQ83UNigNN3lC/YSU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(82310400011)(1800799009)(451199024)(186009)(40470700004)(46966006)(36840700001)(40460700003)(41300700001)(356005)(82740400003)(81166007)(6666004)(86362001)(966005)(478600001)(83380400001)(2616005)(16526019)(426003)(47076005)(26005)(36860700001)(1076003)(336012)(40480700001)(70206006)(2906002)(70586007)(54906003)(316002)(6916009)(36756003)(8936002)(8676002)(5660300002)(44832011)(4326008)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 18:53:47.8332 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 132d4fab-e30a-4c79-8481-08dbae417012
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9256
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Austin Zheng <austin.zheng@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Bayan Zabihiyan <bayan.zabihiyan@amd.com>, Leo Li <sunpeng.li@amd.com>,
 "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>, Amanda Liu <amanda.liu@amd.com>,
 Mike Hsieh <Mike.Hsieh@amd.com>, Dillon Varone <Dillon.Varone@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are two places in apply_below_the_range() where it's possible for
a divide by zero error to occur. So, to fix this make sure the divisor
is non-zero before attempting the computation in both cases.

Cc: stable@vger.kernel.org
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2637
Fixes: a463b263032f ("drm/amd/display: Fix frames_to_insert math")
Fixes: ded6119e825a ("drm/amd/display: Reinstate LFC optimization")
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/modules/freesync/freesync.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
index dbd60811f95d..ef3a67409021 100644
--- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
+++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
@@ -338,7 +338,9 @@ static void apply_below_the_range(struct core_freesync *core_freesync,
 		 *  - Delta for CEIL: delta_from_mid_point_in_us_1
 		 *  - Delta for FLOOR: delta_from_mid_point_in_us_2
 		 */
-		if ((last_render_time_in_us / mid_point_frames_ceil) < in_out_vrr->min_duration_in_us) {
+		if (mid_point_frames_ceil &&
+		    (last_render_time_in_us / mid_point_frames_ceil) <
+		    in_out_vrr->min_duration_in_us) {
 			/* Check for out of range.
 			 * If using CEIL produces a value that is out of range,
 			 * then we are forced to use FLOOR.
@@ -385,8 +387,9 @@ static void apply_below_the_range(struct core_freesync *core_freesync,
 		/* Either we've calculated the number of frames to insert,
 		 * or we need to insert min duration frames
 		 */
-		if (last_render_time_in_us / frames_to_insert <
-				in_out_vrr->min_duration_in_us){
+		if (frames_to_insert &&
+		    (last_render_time_in_us / frames_to_insert) <
+		    in_out_vrr->min_duration_in_us){
 			frames_to_insert -= (frames_to_insert > 1) ?
 					1 : 0;
 		}
-- 
2.41.0

