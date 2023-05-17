Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDBD7070D1
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 20:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27FE10E222;
	Wed, 17 May 2023 18:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A5510E222;
 Wed, 17 May 2023 18:34:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZJbEAfW7UP/jdO/1IHjZWIYJKasiBcCgAU33ItkD9GS8/p+mE6UbR5Z5UINtaWxhfzAbs/Ksj4TAJbBL40vxd3YQbmcJ6GfdJ8Y8SiNo+Os71CDkdAafyIGh/ykUlDtVxznypKiSR8q3CWxfLQp4jEXovKkd2zmatOARKnFyCQ0CAOQzTK2g2o+fkGQDSytYomx5/Wx00ES9SBsjEI4fwWGczQJ8im/yD0ytnoy8v8Ayqy7B7worFKC27P2fZuXAXy0T6a4rXcIExryzHvsdAmPaxE7bJmkL6JgzIdAJnJ/YOCh2dqTOZqPiXzjQwDKwzL0W8U7NOClbwbs+cPzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93aK1EtrxgRooQgtd6a2U+5yaty7/ZAr+872R7LmBKk=;
 b=aZ1+ZO7Kg4ma1MfT9ud8Xpe1nay6kzvJnRGYtumHpV4mL1VV91WikzadwS/MkeJWm7DSK2LBtZgbBdMf+rmq81GVrHo7ZzINmLY9Y8LXP4S0rWli+IjR5cDMJltEb3JFg7mkRXsjq3LV4eYlV1I1I1lmXdIacIKYSCUzREtOsT11e6rFXInoW3vbbjSw3LbkhgvlheMPC+hta1l1Utd3ObqW8/edHmt1U3jOxRYfNg6iK/Z4l3q2lKnKOMPBKMdAWifsF4GHXUX8RTflpJK861KIdx75r9vGSUvOdfVCb/NpFygvyeH/chee47LEpy890craRqVfEGDNRKy2W7T4Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93aK1EtrxgRooQgtd6a2U+5yaty7/ZAr+872R7LmBKk=;
 b=ZalQOTkiU9iCq0UIfq28hnmQt9o9lyH6V33efML/sm/7wSaUG1XzpMQpp6kTGaaHb8ulbJTq8+k5/zF74KR5K7crHQmC0px4LRfgDOqAhUXLo00BatgD2r78eBEiB4oZjpNgWBszQmd2xL40Wr8mqrLRGUwFO3HDq13/0CwriSs=
Received: from DM6PR02CA0063.namprd02.prod.outlook.com (2603:10b6:5:177::40)
 by PH7PR12MB7843.namprd12.prod.outlook.com (2603:10b6:510:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 18:34:39 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::fc) by DM6PR02CA0063.outlook.office365.com
 (2603:10b6:5:177::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Wed, 17 May 2023 18:34:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.18 via Frontend Transport; Wed, 17 May 2023 18:34:39 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 17 May
 2023 13:34:35 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amd/display: drop unused function set_abm_event()
Date: Wed, 17 May 2023 14:33:46 -0400
Message-ID: <20230517183350.314082-2-hamza.mahfooz@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM6NAM11FT032:EE_|PH7PR12MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b8c87cf-fc6a-44f8-aea5-08db57055f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pP+TadWuvPixNfZ83s7z8uHTC/goFrxVn6wgGCEgw9cazOHw3DT9IykOL2N2EEaY/z6cobtlWrdqM+da+r0idZHL6XGwFge4pKEoTAU+0ddeHyYd+MP1jCmzWsI9HyGagq6sMVJ5MkZlZ23O9Lk6rE3uscGjr+7977A5Ef7d1JZkEfShb4q0mksy5D7uv4FTFqPdiumldhYOFDQW/JdCzweLVA1Hpv2dNDhs5p1jH31frDWn3CEE5HUhxjyDkYomfWozKfu+wceLoAISVZS0T1Jzw8/+iQJTLYANDCq/MPijTFHFCIX3ysJkMMQrKrtvZrb+rYu0PWiPBZ4dGNeVDFQCanQe3c4LWPiXddWHMJ+xrfDAH3mpOT2jJst7xyz7eeqchcxuQ+kAwNhMnhUeilin6q3kNavMynCSLPwaDBTcekgGCq7Z29FL7lErqsICpip0vk8AUxQSCymKfEHOEg3w2/FdwqWo3UMe+w2JtIvRX748KnrgRi1XsEjFkevetz0qrrRJxsORLkitfLW6LcEePPIcgnOgR5XCvfZDlVDFSil0XtV3Df+G79rbhCT/Dz/xeUBLxxoU59QRY+fTNZp0fE5DvPO4jIRe40Zjg5hoyLms0Z1/vBbDsVcXDXRPdl6pqor4DxUcOCdA1xT2jsPLGeQAE2npzXw6QzY1wpcefTBenDLFvjP97l3/FO80rtr/BTeM8T0iJ3hu6MyDH4Q2fcL+QxaYRzCmjLQaivnmx/Y5SB7MthXjhoRiCs16DO22EIkgJvhWcf7JNWOPEz2VsXwIswNcKvDBOD283TnPUJeTuEPwXOyjpQqzyznj
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199021)(36840700001)(40470700004)(46966006)(54906003)(41300700001)(6666004)(82740400003)(316002)(70206006)(70586007)(6916009)(4326008)(44832011)(8676002)(8936002)(5660300002)(478600001)(86362001)(26005)(1076003)(82310400005)(40460700003)(16526019)(186003)(2906002)(81166007)(47076005)(356005)(83380400001)(40480700001)(36756003)(36860700001)(426003)(2616005)(336012)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 18:34:39.1285 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8c87cf-fc6a-44f8-aea5-08db57055f82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7843
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
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Nasir Osman <nasir.osman@amd.com>,
 kernel test robot <lkp@intel.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Stylon Wang <stylon.wang@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 pengfuyuan <pengfuyuan@kylinos.cn>, Hersen Wu <hersenxs.wu@amd.com>,
 Cruise Hung <Cruise.Hung@amd.com>, Mike Hsieh <Mike.Hsieh@amd.com>, Hans
 de Goede <hdegoede@redhat.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Leon Huang <Leon.Huang1@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

set_abm_event() is never actually used. So, drop it.

Fixes: b46c01aa0329 ("drm/amd/display: Refactor ABM feature")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Tom Rix <trix@redhat.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c | 12 ------------
 drivers/gpu/drm/amd/display/dc/inc/hw/abm.h   |  2 --
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
index a66f83a61402..2fb9572ce25d 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
@@ -131,17 +131,6 @@ static bool dmub_abm_set_pipe_ex(struct abm *abm, uint32_t otg_inst, uint32_t op
 	return ret;
 }
 
-static bool dmub_abm_set_event_ex(struct abm *abm, unsigned int full_screen, unsigned int video_mode,
-		unsigned int hdr_mode, unsigned int panel_inst)
-{
-	bool ret = false;
-	unsigned int feature_support;
-
-	feature_support = abm_feature_support(abm, panel_inst);
-
-	return ret;
-}
-
 static bool dmub_abm_set_backlight_level_pwm_ex(struct abm *abm,
 		unsigned int backlight_pwm_u16_16,
 		unsigned int frame_ramp,
@@ -167,7 +156,6 @@ static const struct abm_funcs abm_funcs = {
 	.init_abm_config = dmub_abm_init_config_ex,
 	.set_abm_pause = dmub_abm_set_pause_ex,
 	.set_pipe_ex = dmub_abm_set_pipe_ex,
-	.set_abm_event = dmub_abm_set_event_ex,
 	.set_backlight_level_pwm = dmub_abm_set_backlight_level_pwm_ex,
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/abm.h b/drivers/gpu/drm/amd/display/dc/inc/hw/abm.h
index db5cf9acafe6..d2190a3320f6 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/abm.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/abm.h
@@ -59,8 +59,6 @@ struct abm_funcs {
 			unsigned int otg_inst,
 			unsigned int option,
 			unsigned int panel_inst);
-	bool (*set_abm_event)(struct abm *abm, unsigned int full_screen, unsigned int video_mode,
-			unsigned int hdr_mode, unsigned int panel_inst);
 };
 
 #endif
-- 
2.40.1

