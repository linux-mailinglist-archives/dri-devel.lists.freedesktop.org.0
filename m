Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D4D726483
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C0F10E51D;
	Wed,  7 Jun 2023 15:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BBB10E513;
 Wed,  7 Jun 2023 15:26:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOw0OUmbnONYgiQPFdy4HAdtHIZY3NhE4/3rucw3w1/upVl1vykiwPZ3NpW/JzKaox8yHh86xkPomWJvjYDumDSWHfHQ9rq/s9e0Y9CAUWfjTJAuF1+gNQQT5+3vgNepVgiP24UbBaUg2WHNHP+CGb7LlnpOb9xYLPoIBAgDAMazfnBJfJ9p6CLS9rXfF00tGEgHQ4AyGgb06uuw8/ZPY3JR//+Jn3FeWTyduovh4M2sEydohRBuMF1/gMW2LUB8aJKgQajB6XCLuDvpSl02nP+wzPY33Jl22X/6BQpJXwgHa33iDEdLGrXtws4LWCaje+AcTjeixjIbKKryZDsssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bt3z4BK8+37vBHrJstFWP7dmn12+R4SgDmQvyeyiJAE=;
 b=Ns2OTRdSSmmlEi+Q+5az5RKDaZPX5+qkCPHmj3olCzUCMl52BQ6hwM2Hefo7AfUVNRONNbsViw8EZAr1dAVfG3NlB7ThL85DsZusegBxacVdMX08yNgdDH8tfElOmwRL3w8oBIsGkedjTdelXWNlwV/pmC8xSMTAssP0taKxubO6JZNN2xSxeuA/jCURqbF7yGkGlrJfPjtFjofXid3Yk0sWha6mKLT04cCQpg/YPgUHBNqD5nm0Dyy7a1P3Q+7Cg97Kw2IFnzCqsq0vOxy98hk4NdKAZe1S/aInkyDMxhDQOx2oVXyAoAnsD2rqsG90qMTZg0xO5dXrwj7//SMeNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bt3z4BK8+37vBHrJstFWP7dmn12+R4SgDmQvyeyiJAE=;
 b=e6Ux9t1NRk9x/q4F/u+HcI7gchRTs0CZ66HbaECpNl8fIuQWMEI00MImANMKxyOS78DLZsTaAfzAbzZ/R4IpO1MNrvBqEfre+3QhhGp/bioI4iKCIANJFEpUNLSM+Z0LxZ4KYwH7ozXYIjCJb3gH8aWCBSyS5s1cI3hhB4Z5EmA=
Received: from MW4PR03CA0104.namprd03.prod.outlook.com (2603:10b6:303:b7::19)
 by BN9PR12MB5307.namprd12.prod.outlook.com (2603:10b6:408:104::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 15:26:31 +0000
Received: from CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::41) by MW4PR03CA0104.outlook.office365.com
 (2603:10b6:303:b7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Wed, 7 Jun 2023 15:26:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT097.mail.protection.outlook.com (10.13.175.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Wed, 7 Jun 2023 15:26:31 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 10:26:30 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 10:26:29 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 09/13] drm/amd/display: Signal mode_changed if colorspace
 changed
Date: Wed, 7 Jun 2023 11:26:13 -0400
Message-ID: <20230607152617.997573-10-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230607152617.997573-1-harry.wentland@amd.com>
References: <20230607152617.997573-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT097:EE_|BN9PR12MB5307:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b88648b-a506-4d44-3cbf-08db676b920e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rool3GdTNO1Fu/6Fz4Mc+qvUbxyq/9GjJuDqVQTCmTgR0rKyyIDmfzcSX51FNtu/lRpcVnJSfUWCiInefaGTsLvv5O6y7TFDfENbO282LUVmk/4u9P0kcUjcdfnd/+bHWiCAODnHt22O4cJdjwO+vIZSBxiK8U3Rcotu7HnO6h01wvSxZ3uuTF28AxrpLZolR0ZCU6iTowVlTrdaZL6pa7HuG+/ksGDh30AUuscar+bnsf1NeEoPIDYCqmOEZJO7WuGNiK3Y7/y+Jd5iFebpPuLAN8Z5neattF/DXUMSy2cwBvmVWPNB5p1DcnUOQV660acVLRE6GI0gly+PC+nRwymDWSB4RKC+n75/vIqw6ndB55stwtbUb2QhHgmhkNgxj6dYyJ5I5palY09G/FoyC2xdYniHneLlH8RQ1kVFp2qF8aZD6HJepQxTT/n/WAifnjvVRxCVPszMpYSodI4p71E0shOUTgZ1iIeJ9wzhU8K7tTBkom5/8ta6oshAeQo1LCORwv2PUuwzi/yMOFsnoSqb7XafRvA46EoV/4IcjLns0Qf0Ctmlqhrk4yJg3QMYF4FImc1edQGzk4twuyuNVx4+LqcRd0v+l0I6js718aO2rHXOWMvxzvbEANBzziIAR/5pvxu0I38SmDopuMPb3mYTmSex9/wkwaiGEBMVMuzQTJbR/CvfNSfOFKXWJlOInGPqwdMjPQ6o/OlSxyg138Qupn1FcDz8mMnWrZIFNWYPAPx2wF1ffPOxy87XovNjeDu8b0/G5B1GPfcmM8QPHg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199021)(36840700001)(46966006)(40470700004)(40480700001)(54906003)(110136005)(70586007)(82740400003)(478600001)(81166007)(356005)(316002)(47076005)(8676002)(8936002)(41300700001)(4326008)(70206006)(2616005)(186003)(426003)(336012)(36860700001)(6666004)(83380400001)(1076003)(40460700003)(26005)(86362001)(44832011)(5660300002)(2906002)(82310400005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 15:26:31.1219 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b88648b-a506-4d44-3cbf-08db676b920e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5307
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, Leo Li <sunpeng.li@amd.com>,
 Melissa Wen <mwen@igalia.com>, Pekka Paalanen <ppaalanen@gmail.com>, Uma
 Shankar <uma.shankar@intel.com>, Vitaly.Prosyak@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need to signal mode_changed to make sure we update the output
colorspace.

v2: No need to call drm_hdmi_avi_infoframe_colorimetry as DC does its
    own infoframe packing.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
Reviewed-by: Joshua Ashton <joshua@froggi.es>

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Simon Ser <contact@emersion.fr>
Cc: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index bdda136235af..793ea29b4cfe 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6699,6 +6699,14 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
 	if (!crtc)
 		return 0;
 
+	if (new_con_state->colorspace != old_con_state->colorspace) {
+		new_crtc_state = drm_atomic_get_crtc_state(state, crtc);
+		if (IS_ERR(new_crtc_state))
+			return PTR_ERR(new_crtc_state);
+
+		new_crtc_state->mode_changed = true;
+	}
+
 	if (!drm_connector_atomic_hdr_metadata_equal(old_con_state, new_con_state)) {
 		struct dc_info_packet hdr_infopacket;
 
@@ -6721,7 +6729,7 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
 		 * set is permissible, however. So only force a
 		 * modeset if we're entering or exiting HDR.
 		 */
-		new_crtc_state->mode_changed =
+		new_crtc_state->mode_changed = new_crtc_state->mode_changed ||
 			!old_con_state->hdr_output_metadata ||
 			!new_con_state->hdr_output_metadata;
 	}
-- 
2.41.0

