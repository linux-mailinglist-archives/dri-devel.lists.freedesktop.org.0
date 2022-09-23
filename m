Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F7A5E845C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 22:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F269A10E997;
	Fri, 23 Sep 2022 20:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986E010E997;
 Fri, 23 Sep 2022 20:53:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nil4m0AfGZ5RtG1kCbXuktQ8RX+fZSPepBc+pMEmi08jqhbSzObZ6XpT/2V18Ny/uDNYzE/0UQmvuf9za6f+4GYPXtdfosoR/vGdIlKRsbvEshNsUnw5azSt/D4Zn7C525PJ1YIXSvZkhPSGkxlZ6yLu9F+QW87f4NTmB1ip6ZGxedwfKHdKvU53TxlV1/+1T5nQ4KeIxAzGqVocHpCHqqNBPNBLZ+w9kLlANkM7rbz+jhBze+zreHK47v4yOah5gXWYwkKNBS5LGqcU/+kHpz9vMy79m8xHoHNSk81HgPfqys+7Se3hpvRxdMKtrHWkwYFyDH5OSfTbiJ1CPcaD6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wINproSnQ2zV4otvYodZUjfYe3xxLum1SI8Z1fK1vMM=;
 b=Do5UH6QaSF+zjAQGd2s9F1192BMSY+eoVtK8aEmBKT5kztCY9HpnbVWfdI53QOwSD48z00bVpUHeSgnxBNGTTMy+lltSCIGgjZlvXrhCIpek7c8oi2UfGSoCCKSKkJSRM6OqTJQMvA2diCZ7SgHaf+11uzlzJygFY/YOqZ2ygm8UlNq/GLLaWgRD6pakvju0FjRjJpTH1qz50VPppCtJS5yiggPAxrPYdUAUZk6GDMY1BGAjgSk0jCJImIjZhYyZFePtmAuAanf8C2X2uwNo5Yxv+fhfKnuS9D1yXcl5isLxvhaaK7Ahaim+W2xMco3CbY3Ji56sspovQVdgrkO+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wINproSnQ2zV4otvYodZUjfYe3xxLum1SI8Z1fK1vMM=;
 b=mqdmeGf4GVVAXyy10ZqQagRr0mCBe+I6DVCEI29mdYNR/PD1pZVtQ1qN1vGHT1o0MlKOHgsRRZ/kHBlE7MqNzleDkYqSAGW/O9eQyYSCR9ThTfFkQY0z7ExFdlj0r3ii8XiZRb/1h1G6tpec5grHAe9+rEVLSnLfi5Eg9uc+odg=
Received: from DM6PR08CA0060.namprd08.prod.outlook.com (2603:10b6:5:1e0::34)
 by DM4PR12MB5182.namprd12.prod.outlook.com (2603:10b6:5:395::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 20:52:59 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::f3) by DM6PR08CA0060.outlook.office365.com
 (2603:10b6:5:1e0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20 via Frontend
 Transport; Fri, 23 Sep 2022 20:52:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Fri, 23 Sep 2022 20:52:58 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 23 Sep
 2022 15:52:55 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] drm/amd/display: fix a crash caused by hot plugging on
 certain MST hubs
Date: Fri, 23 Sep 2022 16:52:30 -0400
Message-ID: <20220923205234.207628-3-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220923205234.207628-1-hamza.mahfooz@amd.com>
References: <20220923205234.207628-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT020:EE_|DM4PR12MB5182:EE_
X-MS-Office365-Filtering-Correlation-Id: 312b1384-f1aa-4634-0ab2-08da9da5990c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8gZxDE3JQzwD0qketMib39a0qj0KukO5ptQIX+5kKhrQgPEutz2r7IqRs5UH4WNeLamk4KriYPFUSa/IyzwGZXCuhK5IAK7kt1ZhhYyd5XsU1g1C+ta5v4ZCjC34O+2nhdrptASPDCZqShxUWEnvyBmaNY1k68jsG5ldyktCUSrYvYmcpvSFC34ljZZLRSHp3UAhP/qJTkRfipO5mD/w6pXPJTwEGNcZYeLuTL+6HTgjWWhsZN4WnTfv4k7bxNlq7qrjqY7R0COohD1lFcvwpUYUT4AK2nTSR4VFjNyxnykAkG6mw9wqOI332dy/y7L6nk/SQ9JyEIyTbE4lbEJi0dNVAXvYUDtj5NgU7J7olSCmTvDOHuOuy5Sme2EqzQw4RPd6v09GnDoTGUipDVyKucBseMIwJf2YspS571YQEy/RIUCreTkpvc2uSeWJM9BTrW5Jc7BjES8trrhpza9YCYRmoAB0AIQXYRN+QkUhfC3TmLFRM5cFykWd9aoht2FC5TkEmwzLka6SlQDXCcvsscegQMrIJ+Y5eEqliHj9S+xNYLvyXtmA9MZSHYfIzHMqBNDDGT2C2cnDgTIy4e0J68IRgMEwxeHUjXYLzwb1n6U668xENDpl0kQO8BUdk0I2DcehIivzZT6tOdhNxZyQkDJVk0cnLqRV17rdrDNcTvUeZDWV0sMzrd4rsnqSHl1PebOVwW1mfvt9CW5zSPb3AmO7YfWh6nXvd9uiH22c6RRr4C0cJmdRn6dnYaJ+YMsMLsjjc2u/M0IzBcV3GfV2IiilBRZa6SVGpU2+jSH5Jzyt97DTiruWJVZ2Z5MZCeEgZ24/bijawChTtfymSt6bBg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(81166007)(356005)(36860700001)(2906002)(70206006)(70586007)(478600001)(82310400005)(316002)(6916009)(54906003)(426003)(47076005)(1076003)(186003)(40480700001)(16526019)(86362001)(336012)(26005)(36756003)(41300700001)(8936002)(82740400003)(5660300002)(4326008)(83380400001)(44832011)(7696005)(40460700003)(2616005)(6666004)(8676002)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 20:52:58.8276 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 312b1384-f1aa-4634-0ab2-08da9da5990c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5182
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
Cc: dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>,
 Jude Shih <shenshih@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <roman.li@amd.com>, amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>,
 Fangzhi
 Zuo <Jerry.Zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we aren't considering the mode_changed property of struct
drm_crtc_state, which can mean that we might not update the display when
it is otherwise necessary, and cause a crash. So, consider mode_changed
in is_content_protection_different().

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8d8788792f7d..78bd1a5099f1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7222,9 +7222,11 @@ is_scaling_state_different(const struct dm_connector_state *dm_state,
 }
 
 #ifdef CONFIG_DRM_AMD_DC_HDCP
-static bool is_content_protection_different(struct drm_connector_state *state,
+static bool is_content_protection_different(const struct drm_crtc_state *crtc_state,
+					    struct drm_connector_state *state,
 					    const struct drm_connector_state *old_state,
-					    const struct drm_connector *connector, struct hdcp_workqueue *hdcp_w)
+					    const struct drm_connector *connector,
+					    struct hdcp_workqueue *hdcp_w)
 {
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 	struct dm_connector_state *dm_con_state = to_dm_connector_state(connector->state);
@@ -7289,7 +7291,9 @@ static bool is_content_protection_different(struct drm_connector_state *state,
 	 *		ENABLED -> ENABLED
 	 */
 	if (old_state->content_protection == state->content_protection)
-		return false;
+		return state->content_protection >=
+			DRM_MODE_CONTENT_PROTECTION_DESIRED &&
+			crtc_state && crtc_state->mode_changed;
 
 	/*
 	 * Handles:	UNDESIRED -> DESIRED
@@ -8171,7 +8175,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			continue;
 		}
 
-		if (is_content_protection_different(new_con_state,
+		if (is_content_protection_different(new_crtc_state,
+						    new_con_state,
 						    old_con_state,
 						    connector,
 						    adev->dm.hdcp_workqueue)) {
-- 
2.37.2

