Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B506C4FFE
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 17:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CAA10E264;
	Wed, 22 Mar 2023 16:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A4610E118;
 Wed, 22 Mar 2023 16:05:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCb3fsJv2H2JPUqOeHckUiow6qo+3PfTEm9QHcP1Xku1YzOq4pJ+hilOnpbEURp3EzXjzcu+MKb+YM5688ZsRqIT41bwgBcb9TGjsrNXHZTzCDELI3xS7jmB2ze2Q4GNUeP8HXAyAURE0YYL9Q85hfcLadVbT7eM0JV65NehvhnfvDx0TQOjQ//lTUX7KQ1VrqJle1RkKafsW0jFaBHkIpomop76oj0H3Rl8O09XBhTtfcZQ8GtcDTvMXDMPGIt+vDD7IgQkmhFwb7W64I5jfLLVDtH8fx8JWwycGTDqXIQYyHopuZWcRiR5heDtWmBQriX+n/omi7ZON66Bxfy4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKus3HdhzrXVBn+LZW/SDVyuIvv1hns7psI/dqJqlb8=;
 b=eK11GtKtLfmI/Qq4BHng1sNkGHnvkEXp5usHftVQC0pHAcErc2+ExxeLA9iQgexxTILIMtc2yfMnS4NZ8UiBdPtEiyKGmm+6YS92EFnsa+V5PuJ9TqPV6NUdv45/X7maqiLmzu0J5GxO4WIJ60b8ZviNAj+zF99FPX9NTYWLjdCRkMp4bVokPMMmo14ANBdl7q1bbZkAhIrp1eaoElDOvRr8nh11nuMYYN9tC7VE2t4oAIsJ3W1ZyZulS0PBe2AAjaB1NP+kyXNrbNVV57Jo46Hi88F8pCS9imWKiDDpoLqH3xOZ6kepgdeF+c4X6qAX8UZgiPwe9DRxd7PYrGA8sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKus3HdhzrXVBn+LZW/SDVyuIvv1hns7psI/dqJqlb8=;
 b=lJ/KyisiMa8Ly2u2OztO2aTUbMv0uLI4fu406kEvrh8FEsR3XUYTqzll+4HotYHf/bIigbX/WbCC1VlbP65fS9vTuIEgVRcYgUVgA2u90WqC0Bv05hOMTPHYNSP8mOfvFjfIWc5WxOGFRVQsCk0v+2Oh2z/zeR/JF/cL9zSN980=
Received: from BN9P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::31)
 by DM4PR12MB5054.namprd12.prod.outlook.com (2603:10b6:5:389::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 16:05:34 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10b:cafe::81) by BN9P223CA0026.outlook.office365.com
 (2603:10b6:408:10b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Wed, 22 Mar 2023 16:05:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.17 via Frontend Transport; Wed, 22 Mar 2023 16:05:34 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 22 Mar
 2023 11:05:32 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH] drm/display: Add missing OLED Vesa brightnesses definitions
Date: Wed, 22 Mar 2023 10:05:13 -0600
Message-ID: <20230322160513.1438881-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT026:EE_|DM4PR12MB5054:EE_
X-MS-Office365-Filtering-Correlation-Id: f3eeb707-8f1e-4231-cc97-08db2aef44ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 15mDuTH+DmE13xoyyMX3tLtojF1djvNpJSfmhi5EUWb5j8qfx01FWTjR/9mTfFcsBDgwD7Fd9WhP2gACUYir3T7/MP8jYa/8o6fj7dh1T7k2P9JWtxCrQp5tRCWkek8SU8th0N2c3QzcoRqGajjSysn5TIIhn0TMfu73w9lR7/8X4DK3d1tRJ1NxCqg/mC4Q4tm4Tv4u4UmZmFrGVcqs8M0cRSSQipcUL6m600oUTsInn94PBjE30e3T3fXdWybCVzNqlIfeYW67NiymCfNMCnkNoupVYp2Hr+kQz3K3cWUFFh8o6C0c5fa9r8stZwmU3eDIHVSjR9AFRXfYCjZNviPnc2GPbfVqwak6r9irzdOMgGFObRjyh29uN5h11/ZzAAE1yU/TqcTgGfQxnzQXGwwax22uh0qgyfkTnN8h1HHRt7oKBftSMarQwqZuhdgqlDc6TOemBLPrbjx6tEeYICTBGwozk1MLrhhVjKNJ3B9fBAzVhUKdUhnmpov8iQAY0iKXQcwkyC6o502JswlLlCx8TB7okMiQB0vanqHwHy5vWMo9OPvtqvXLnPnaniZ+1N+FzDjzflmlkrF5Aelxe2d7hWCQ4ruQDrQ5dQxq78Qhl4FaSxdLfsDeOi+/6GG3ZuKih7qf6pwjPuvtof1L2o0pENfHu/uP4vUWWbBedTktLFk6j80SXtZWz1jGsP+NxDjnRc1xNnNtLtHgamEI6V/W6X34Y117//IAgbDrdnw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199018)(46966006)(36840700001)(40470700004)(47076005)(110136005)(81166007)(426003)(54906003)(316002)(4326008)(8676002)(70586007)(70206006)(36756003)(41300700001)(5660300002)(8936002)(36860700001)(4744005)(40480700001)(86362001)(478600001)(83380400001)(2906002)(82740400003)(40460700003)(82310400005)(16526019)(6666004)(2616005)(356005)(336012)(26005)(1076003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 16:05:34.0379 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3eeb707-8f1e-4231-cc97-08db2aef44ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5054
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
Cc: Felipe Clark <felipe.clark@amd.com>, Iswara
 Negulendran <iswara.nagulendran@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Anthony Koo <anthony.koo@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cc: Anthony Koo <anthony.koo@amd.com>
Cc: Iswara Negulendran <iswara.nagulendran@amd.com>
Cc: Felipe Clark <felipe.clark@amd.com>
Cc: Harry Wentland <Harry.Wentland@amd.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 include/drm/display/drm_dp.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 632376c291db..d30a9b2f450c 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -977,6 +977,8 @@
 # define DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP		(1 << 5)
 # define DP_EDP_DYNAMIC_BACKLIGHT_CAP			(1 << 6)
 # define DP_EDP_VBLANK_BACKLIGHT_UPDATE_CAP		(1 << 7)
+#define DP_EDP_OLED_VESA_BRIGHTNESS_ON      0x80
+# define DP_EDP_OLED_VESA_CAP				(1 << 4)
 
 #define DP_EDP_GENERAL_CAP_2		    0x703
 # define DP_EDP_OVERDRIVE_ENGINE_ENABLED		(1 << 0)
-- 
2.39.2

