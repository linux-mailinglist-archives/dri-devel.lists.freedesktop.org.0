Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CEB7070DD
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 20:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41A210E24E;
	Wed, 17 May 2023 18:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4FC10E23B;
 Wed, 17 May 2023 18:34:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNGfdtzt0MFhxpoNnoBn1t2N2OKzzx6kZZ7ujswsUGpCgeYiP1kQ7l8KxkCtfKXY3Km3ISQ6AMkHyE8GB1dV6vFgEBS2xiQQNZUuaM+/drUtoI5vwpg66rmlxLu85nB7kTKycwjEx0+SSMVLCifgS+t+iSu7B3hqw993xAfwTNZ3SHBY+549trEYchcYlGibexnspP8ONxSuUTJnVpU64JKUITN6fSmSlqnfe9SngAiv1DjrTJ8SbzjO0hinz/isSeZj9Dh82mt90TNHjP8tkSXKF+PGj76IODc4U39KgQggSqjYvn/v7NDVzH/vTVDjY9VrZ8z10SlVyra0R8rU4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRYH/uzNiOwE1sDt/LCmolvLy4Oaj0Zbqy2+rO2nD70=;
 b=H3gCkG/9lhQX6cBqFvCmgobiGjYZ7RFeaDruVAjDWdQ0vEcTd42qhxelgLbV+Mp5PWF6fuKK/CCwAkU+ZrOqJTNSYiAe0fxWVT08utJPx8IyV9GdP5TKnOh55ulFkUJlHBc6fiqVTym8WakPQ6BCTHZQe9jg4CJA0j+asiM40A1Ya5cXxQQtQJ5PKa0oCnWMWCqSkhwLpfs1m0vpjCi7xUNs4gJniEjVTAFiXexuqGNnH4gzl0Xu/Xxy+y4Dqu0rzZidASGzlel/d+PkK+5ob6pkUWTJK9iEUM9pGQBlLivSIyyzkpErTL4Mq9VScQzzOSg2gp1aSb6aTaRkcvsTOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRYH/uzNiOwE1sDt/LCmolvLy4Oaj0Zbqy2+rO2nD70=;
 b=qD1ZhFuj5fQOmta/OKqIPS3yRPWBglAaajtRp3sqcuKj7z4PRRuUuUa2gUSuYWBIBeg/JUBZlVAkC9xx3G01IVF6eRogj4IV7VvzNMhp71PXGPLRq3b1TSmiSoPoXxHPX/JjxiXjNAj/oejkvvdv//3ggYMfrihs6OwfHVcoXjY=
Received: from DM6PR07CA0038.namprd07.prod.outlook.com (2603:10b6:5:74::15) by
 MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 18:34:49 +0000
Received: from DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::96) by DM6PR07CA0038.outlook.office365.com
 (2603:10b6:5:74::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18 via Frontend
 Transport; Wed, 17 May 2023 18:34:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT085.mail.protection.outlook.com (10.13.172.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.18 via Frontend Transport; Wed, 17 May 2023 18:34:49 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 17 May
 2023 13:34:47 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amd/display: drop unused count variable in
 create_eml_sink()
Date: Wed, 17 May 2023 14:33:47 -0400
Message-ID: <20230517183350.314082-3-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517183350.314082-1-hamza.mahfooz@amd.com>
References: <20230517183350.314082-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT085:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: 55980f43-ac8a-4b7e-3169-08db570565b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WWKwejt24dkvk3jTOoYMU7TJh/hem0RNqx5naTLwlBv/iUF6N6SLgN96qQzn7UnICzLQMt8wV2ZTUtBrlE5+ExzbZ2HNQT5j7jFkJWxiXUMXjxZeRxQonpaQMjKksA2pxNBNqc8T8Mo8b0YF4QMcZKJhBynt73YnGSQ/Y/4GuQZ9LSLG+TaAFXg5FErT5j0YVFLbUc/a5ebhi4jlecpBy+EA6QYg07N5KaG5Tt7DOBXAqmg+KSpcQSqjisXvpXRpmd179p1tvpaFovA4EhfbJBiI/fteMj3hDWf+Y6IFixcrmrdbJMCROi+Y3a5ssTiaub3lyRa/anMSecBWXOVGSqy9tXwzm2sjCn7N+MC2c8c/5aSfyR/d86GWkA3vKIaAo18VMgb7ZDAOAckaXVtKzT0EV10y5JwbXev9HnzQEc/Yh8QzAPh95dvdNnYc8pPX4geVi3f0Ke0Oiw7tUNMHXbE7sbRJ0O8hKGyPksSF9C6gDbO+1IJsBlTrYIEsQY/BcuwDkUTSFJpc8g2VkF3ZTNCpfGfNHZDfP0J6Yq/YXU11JInAOpInlNYLDOzWZoMO8MsG3po9SS5lOJCMJJDGMK1u/OMa0GDHg8Y3D/5mTUN2caLnzRL/BVS+LNlDhWZNbvm83LuIcDUNSpyvzFu7JZKd4vMd6EHk3dIySH/cVjvFmRmTldaoPH/Hd/uuH4NhfA+IavhJQKTGrbXt2nn0k/14kl+tWNlzQ+3lybHdBWg/TZcXcBR01ukTlOYYWir4pJFhbwH/etOdzzAzJK+LknG/qsUaTwVIQKfnvpb5PPMkX+SaK2NY9WV0JK9Eymdr
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199021)(46966006)(36840700001)(40470700004)(70586007)(70206006)(5660300002)(8936002)(8676002)(54906003)(478600001)(6916009)(4326008)(316002)(41300700001)(40460700003)(36860700001)(81166007)(40480700001)(47076005)(426003)(336012)(83380400001)(2616005)(86362001)(82740400003)(82310400005)(356005)(44832011)(16526019)(36756003)(186003)(1076003)(26005)(2906002)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 18:34:49.5102 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55980f43-ac8a-4b7e-3169-08db570565b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
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
Cc: Wenjing Liu <wenjing.liu@amd.com>, dri-devel@lists.freedesktop.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Nasir Osman <nasir.osman@amd.com>, kernel test robot <lkp@intel.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Stylon Wang <stylon.wang@amd.com>,
 Leo Li <sunpeng.li@amd.com>, pengfuyuan <pengfuyuan@kylinos.cn>,
 Hersen Wu <hersenxs.wu@amd.com>, Mike Hsieh <Mike.Hsieh@amd.com>, Hans
 de Goede <hdegoede@redhat.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Leon Huang <Leon.Huang1@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since, we are only interested in having
drm_edid_override_connector_update(), update the value of
connector->edid_blob_ptr. We don't care about the return value of
drm_edid_override_connector_update() here. So, drop count.

Fixes: 068553e14f86 ("drm/amd/display: assign edid_blob_ptr with edid from debugfs")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 14b296e1d0f6..5a2d04f47276 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6396,9 +6396,8 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 		/* if connector->edid_override valid, pass
 		 * it to edid_override to edid_blob_ptr
 		 */
-		int count;
 
-		count = drm_edid_override_connector_update(&aconnector->base);
+		drm_edid_override_connector_update(&aconnector->base);
 
 		if (!aconnector->base.edid_blob_ptr) {
 			DRM_ERROR("No EDID firmware found on connector: %s ,forcing to OFF!\n",
-- 
2.40.1

