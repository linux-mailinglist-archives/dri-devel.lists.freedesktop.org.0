Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A66724E10
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFA010E3C5;
	Tue,  6 Jun 2023 20:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C1710E3B9;
 Tue,  6 Jun 2023 20:26:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4x0ej0uhKpHVmfro2vW2tGfGkkTlC5C61YbzPNPhJzxLmVq67VORkhbZJ2LLnpRjU0kiUKXanFgovrIGd4iHsu5/bJDTOOSHOiIfOL6Pd+WDM9Ilmzt/7n20Ulb5mRsvt8KvGmi7Ws6SEYRt+r8gggtOK96gikYmC51odmaSwdpdj7/PCr2FQPujjJTrE2T0aQcHNzXLOehgqI7axsuFrTR2JOigrCQmjB71nU9yhoR52ZFCnbPZI2XOs8Bgu+a8iu/lwq4EJOzbcUOb8J+DOrgkGZQqsH3tv2b+smnlRxOPn9NSOTxrLKEvezuFQw10oK0SRsV+9nOidUvxqPqlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6a7a/Ni+xFltNrVmB8jZ7XmETc89MCsBqaKOUqaiHE=;
 b=AEinCfI2BrTsvcWiaPBHDOsNxDocV0imADHf4HvmFnFhZC4AGfThLnvGSlti0D8XidQcZdC5cnpf2FAa2LrrF+yTlbQOYvEN4i+nL8dGFTkukT/wVG34Uq7BuILrfu6HJB1nS1B9K3Q01kPTxQDOwuvtKLvtJCTsVqNz4w/lKxfEp+QrodRMntAZ7CqQSAg2WALNr2GoHr3D/Fs02YDticO917XoTQsocMUD6CjPxdG0f+HsYazo8JcE+WHK8O7zR2AU7Fv6laeylV0CPSOgMzWLZU1PI8IInH414nKJZXTYegOH6sH39O2SGow4YE4r3jwFVCtCvQN7/GAtqlqGRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6a7a/Ni+xFltNrVmB8jZ7XmETc89MCsBqaKOUqaiHE=;
 b=dcQ089P/C/btmN2YSlMRz2ikITNOPrqtbK7Yh2hhVksy+rDAcBfVUzmqmije9e4eY1GaxcASaDDtuKaD9YwvCpyJkKw1dKYIpdbmT6sG0iN0TJ8XJJz3yycmO2A2KfW1bNCiTVA1gIwJ/bASFLifWHCbMQpyzzggFgDzPUyjjpM=
Received: from BN9PR03CA0225.namprd03.prod.outlook.com (2603:10b6:408:f8::20)
 by BY5PR12MB4050.namprd12.prod.outlook.com (2603:10b6:a03:207::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 20:26:23 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f8:cafe::88) by BN9PR03CA0225.outlook.office365.com
 (2603:10b6:408:f8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Tue, 6 Jun 2023 20:26:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Tue, 6 Jun 2023 20:26:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:21 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 15:26:21 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 09/13] drm/amd/display: Signal mode_changed if colorspace
 changed
Date: Tue, 6 Jun 2023 16:26:03 -0400
Message-ID: <20230606202607.122914-10-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230606202607.122914-1-harry.wentland@amd.com>
References: <20230606202607.122914-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT022:EE_|BY5PR12MB4050:EE_
X-MS-Office365-Filtering-Correlation-Id: d9d685d0-ee9e-40e9-2f47-08db66cc4bb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mAxFLy7vSrIGz1H8aDlGRsdlPdfmP0Stf14XLhW6ZaGi5JlUjvzgzxo9WdJtRrs/S0QPS+aJEdO1uPx4bBF31fvRCYk94U3ibIglbz7ZapJD+4MzGlr0aw6+QKLXB/Vt9UI1H+sOkkCwz6BfngktzEsqP8sUg1dRA8yIWkviLcQHkAUIR21DLDH0DThxKJOYQV8xIfBOdDrfxsZssM1qkfFzW7ox7bBwKxRX4Obgnvqk13ULsW2H5AOWyb0aEu0m78RP6kfHT3zKrVoekuDaMonVXp0q72jjsGtqiFesKoTOrOqffYyOOBWulofR5tXSNSNX79AZmZAAPul5V52xMlvV/VZQWnIUF5xjVK5R6Ve1IcBhP13td5Pxsmf3irBikeA1bzVgzKJoCHf61ezD5ZWG4oiKDiLX3c3YdqMCvKqVEQgkQjzoZN/zbUJG8/LnW6AnbQeh9jmOd6iuU66N0Ha3Pka/+eKPMHd8UvGNJr/0ATjMmB6Vz9Ko956pHMmNewEbgpeBpnu7JAeBT2CpGSmrKe5siGzWAi4Da+1NOM3jbN26qtk1kanuXSOulzDZaLTNe0HsIkf3i4BYHqv/sC2vgorxk24V4+T257Gjdp/Z2h8UNb0KL8bwyz01aIyLVOKTXi8ke9tjHIw0YQpB8cbKwX4EDd/Bm6AjUFWl59F5j6P746gQnGY40yd+T/CrfswpI3btvJejfw1GQlLAbM/WVOR9ai6ifslugTh6j2mjD7F90dJ8mlf2XnU554uf8BLZhKOCpC9wlnz6QynfZw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(6666004)(5660300002)(86362001)(186003)(26005)(110136005)(40460700003)(36756003)(2906002)(316002)(8676002)(54906003)(8936002)(40480700001)(44832011)(41300700001)(81166007)(4326008)(356005)(70206006)(1076003)(70586007)(82740400003)(478600001)(2616005)(83380400001)(82310400005)(36860700001)(47076005)(336012)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 20:26:23.2140 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d685d0-ee9e-40e9-2f47-08db66cc4bb3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4050
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
 Melissa Wen <mwen@igalia.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>, Vitaly.Prosyak@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need to signal mode_changed to make sure we update the output
colorspace.

v2: No need to call drm_hdmi_avi_infoframe_colorimetry as DC does its
    own infoframe packing.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Simon Ser <contact@emersion.fr>
Cc: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-by: Leo Li <sunpeng.li@amd.com>
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

