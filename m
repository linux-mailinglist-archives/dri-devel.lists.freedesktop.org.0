Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D0C64A6F5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB1510E274;
	Mon, 12 Dec 2022 18:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7099410E262;
 Mon, 12 Dec 2022 18:22:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIqflc32kjASxupKKHjo+xGh40WRyaEyWzuddYVyt2KbZg2bullQGhR8fGaoIQbacL0/CZXBo/R3GQfF8xTGPPRGPOXlvGaCc922bGXoHedkyqJQ53Rmj/FzqRk5AJR+vF2cz9e6ifE8ORmQKfejopCK2h2pj/1q22vG8tMKA/Mwgc93Is7E22/fmBR+UwQaBMo6oIVGvl0qJaK2NJv3wFm30eHX4k6H1+SgQ4WPtdRyXkRULY5kp6sCWjDhiWXNFKUzl+8JrqMcl9lz7dwI+0raIoigqGG2RpUJGZDwDw3sXw39wrAabbZxNFeLgN5obusCaWaiQH8YI9WiBY+zmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIblX/EJw89B09/ZThKxlVzH6v3Kalz2tSfdK8b2h7g=;
 b=U/NuzVa7d+YWmnDmzWU3w3BaRYwW6NQ6YBF3cPkz3Ul11J4BI89rjV+nITAXgYZdm/Q39r8uhk7g10jTYBFbVw2PQqbe+PIYDdecSIOWSHH0myUIkn/+m77yZ106v388wusNcQsE1Q3eHqjeHLxqXW+9OSqa1jvxSS/ZAlLJkm+toK/ynCf2cMJkdfUEqMzpAhtg6RW2Be/OSXhkOMvexSZqeMFqtxUPl81WUc9hKCHvANyQULIyvi/B6Lzealo/k4mGS29zmOOYoacdpntHES2NzG8WFBFPnfzpDfW5f/UsLFX4I8MasjWcLej5ArszQO4++2qbTNtZ6BZPfLvybQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIblX/EJw89B09/ZThKxlVzH6v3Kalz2tSfdK8b2h7g=;
 b=M+Ujl2uz8nYI8e/wd/vo5OSIcG9DEqdogGS/359L7FtPZi0/dvfQNyslmeIH85YbHJQ2818Wo8ibMnLoxAzFG3uIiHfAG2hW6mUspk1QbbCXUVorztQ2882TjyqvOS2i7bjfEMWQAB4PidokGyu7nxUWx56EL39l+2154LLT5Z0=
Received: from BN9PR03CA0530.namprd03.prod.outlook.com (2603:10b6:408:131::25)
 by DS0PR12MB8071.namprd12.prod.outlook.com (2603:10b6:8:df::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.19; Mon, 12 Dec 2022 18:22:34 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::ff) by BN9PR03CA0530.outlook.office365.com
 (2603:10b6:408:131::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 18:22:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 18:22:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:31 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 12 Dec 2022 12:22:30 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 16/16] drm/amd/display: Don't restrict bpc to 8 bpc
Date: Mon, 12 Dec 2022 13:21:37 -0500
Message-ID: <20221212182137.374625-17-harry.wentland@amd.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212182137.374625-1-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT013:EE_|DS0PR12MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 22effc34-021f-488f-606c-08dadc6dd74c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z2Ld7dvzzYICkXylteFBnnYv1vNdo0piVkS0thlaLyuhCbbk9dXupjjMLSl6W0aIu2YB3+LGwU89cktJLa5gdSi2A5T+Qd2m/l09pWY93wP9/iOxJUu7QLsv+YKYgdSbGDZkLArXcZM3dmsfXRvct5WfMUINuPCmuwBE/e92JbzZmOAijUGqs4JrH4Xzn2wljFoa92ufnmfmaruquSOYaOZyBk4hQrSpQBndqoID42l9G3bXINCeQq00Q4IUk4rDtzOX2e6mHnHXFlVSf5NZpQUiMRMOprSFYAe1y3W0XGJ6T5jAyHHjjtzJADQYaWGeU5HT0Rth4g8rDnVsSsDHHbP6AF8+QGeTTiA7zI7k2iEOMlq/eD1+IPscyRGFofsSgVRPtnGedgaGhP4jT1fhN5k/T/Tj3khx34062ipkbOOWZVBvLif7FxjISz77jgrePXzFBJ4GJLqlY6phjLg/hA4b4AJBSsnjrX5JAAG1GC4o0Ckfg8slIKdSoLCG5HQmWxbH/ew8iH7f6oDtZaUA182QmBtpWZLyZxzg8uQ9xg6DNfNPYM/QCMH8JaonVZ23tK8crsLpwO5fExDWlSD+f3TWPsR189agdNWKGNdkfT2067N4cuWsZGgdfQUqwAKuOZLnycApt/Z7iHDKJJqpPHtr3C6YHefsKVXz3pmmtos7ExBFQkVEIbGNBdY6hQv4iN3z3tpmkpj59RtfDYWVq5w6GZgfqc+rNxl0Zrht0pU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(54906003)(86362001)(44832011)(41300700001)(8936002)(316002)(70206006)(36756003)(110136005)(70586007)(26005)(8676002)(4326008)(356005)(426003)(47076005)(82740400003)(5660300002)(81166007)(66574015)(336012)(36860700001)(2616005)(186003)(83380400001)(1076003)(40460700003)(7696005)(478600001)(82310400005)(40480700001)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 18:22:34.7530 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22effc34-021f-488f-606c-08dadc6dd74c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8071
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will let us pass kms_hdr.bpc_switch.

I don't see any good reasons why we still need to
limit bpc to 8 bpc and doing so is problematic when
we enable HDR.

If I remember correctly there might have been some
displays out there where the advertised link bandwidth
was not large enough to drive the default timing at
max bpc. This would leave to an atomic commit/check
failure which should really be handled in compositors
with some sort of fallback mechanism.

If this somehow turns out to still be an issue I
suggest we add a module parameter to allow users to
limit the max_bpc to a desired value.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d0c071000a5d..396e345f5d6b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7115,7 +7115,7 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 		drm_connector_attach_max_bpc_property(&aconnector->base, 8, 16);
 
 	/* This defaults to the max in the range, but we want 8bpc for non-edp. */
-	aconnector->base.state->max_bpc = (connector_type == DRM_MODE_CONNECTOR_eDP) ? 16 : 8;
+	aconnector->base.state->max_bpc = 16;
 	aconnector->base.state->max_requested_bpc = aconnector->base.state->max_bpc;
 
 	if (connector_type == DRM_MODE_CONNECTOR_eDP &&
-- 
2.38.1

