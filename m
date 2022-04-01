Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 643BB4EEE09
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 15:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902CF10E1AB;
	Fri,  1 Apr 2022 13:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F7610E1AB;
 Fri,  1 Apr 2022 13:25:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I34G84EBnHigS30Tmdk9V7mMPu5SFyU1WQQXUKrMCdJ4Huwe5kqq6kwZMNJhMGcO+lrDIt2PGsmJyIst/9ivmeF+r5ZzoqYmJ1mmKvE0sD7A9w5YMF6HnhlT0hhbowtl+ajwns+ZhXYN2qzIRq5qFehqlX81dQpeLLf8w2UD5+Roh02h/2BTGhLodX/muuRRyRleBASW9R4fASXJHSG2znY0mbj+MrdQw2Mda/2AmC2d18JQ8AFTTJUtulQ4GF19bWTVNOPZs889X6B8Fnu0LS1+nmPKoguvbjVmym5z2Nkps23PCS79PaC91ZAy1sBhCoxN+rRm3N47j1r84y+brQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TLj9WXW6z1CinaqUv+iyhfphjdj4Hb8XvKyFX7hezU=;
 b=hbQP0srb6u+C2ihkZgLwGJe+qm2zsm5fThHxYzzA8Do6ZUNmsBSNSLJiGxzwPgpuQQ15uhj9ABe5cUYzuXQ7kXp7JDs+QY6ZHUC635/7AbWzivaozDdFDy7rmVIQ98DuZNUyVOw11uB2oiwZxiAOqcJpyPuUcrydm33pCREAE5i7imAxh0OvOoNWpUXDwan4BezQwYu7JbiQN/Mn+7qhgwD6UBzW+AhNW99vVo4ins8v5I0Z6v2WMujkABoT0KgUPkW7jHSgdSRG3Cl9zIkgWo3Ge/wcL7gt5TcsZnvdK8ltJ6/qUtTHN00s+HRruZe3EwXOmjsrHJje4QIMOVi23Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TLj9WXW6z1CinaqUv+iyhfphjdj4Hb8XvKyFX7hezU=;
 b=OHA8Dplc0bxvlCG3Ny12BuBXAl6WjgOpWprtMHUTejSd5zbLg+J1B6k5ZvwGe7E4c02rGbGod2a7dDk7VOTF6BQU80TPWj82cnFpIBBk9hJTD6e6U+9U0Pc6yUJpGHD1/hZQqj3nbN2se/SLGBHQGDaF0lS0XH5b6qmn505Ev1c=
Received: from BN1PR14CA0002.namprd14.prod.outlook.com (2603:10b6:408:e3::7)
 by CH2PR12MB4823.namprd12.prod.outlook.com (2603:10b6:610:11::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Fri, 1 Apr
 2022 13:25:54 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::12) by BN1PR14CA0002.outlook.office365.com
 (2603:10b6:408:e3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.27 via Frontend
 Transport; Fri, 1 Apr 2022 13:25:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Fri, 1 Apr 2022 13:25:54 +0000
Received: from Gundam.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 1 Apr
 2022 08:25:52 -0500
From: David Zhang <dingchen.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm: add PSR2 support and capability definition as per eDP
 1.5
Date: Fri, 1 Apr 2022 09:25:40 -0400
Message-ID: <20220401132540.3574936-1-dingchen.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c076418d-3e30-405b-65e5-08da13e325fd
X-MS-TrafficTypeDiagnostic: CH2PR12MB4823:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB48239A40569E8E9A4D8B840D8DE09@CH2PR12MB4823.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t94TJiJWWDPRN5n28az/WQAGqmUDjtVo6vaxCZkfDFs6qBHD6etgmyaLYpgtpSNBoF/58JBso3SuPdC2+EgBI2HqGSupj5mOeWQmeAZS7LuXt8rg0bfL4QXb0s4QkQWEmBT9GVG1w1TejFEZWKZqzJ2HIR2PXFtfLPR+UwrARJcYFuWMA6tS/UnfdbqdFUSl5WQk//8q+AZ0HhWQzkcGuoqBb7X8OZHlfHR3tWXc4IbfaGo8MCTqieBBB4swFqbGXGpd6JxuIJ+h0mTi/4toYXeuJt0dT5/FM1E8DCONrus3hDfVPhF+Hm/aHzZatQc88bHWJVD5wbsMWAX3ncejpRzLq4OpyG8UXPAIOHbwa0wzdrAzH2aqUA+0tThqCidVN17LUFoKRjWU76UOjwXSd8mQ9Enk/7lwh8ttkAvYyMuTbx9y3KG2ycGmjYYDtK2PQMTxPj2d3fW3TC4Xds9xoU7msj8zIP9mgnc7jGfl5Rj/iyCuaRYvcelyVa22mAEhADVgwdKGGFa88hx5jmQ0ZZqjEd3TR1WPCXbVwtbOhHJjI04VAEnF4C0nOOb3Goju2bDMnlE2s6ssMrHjfsiodd4oa/rMplBr18RiqCxJlQQYE54W02YcipG9ixtQeitm293fY7z+QyLuMF8r6fvGpMVOHdrrxT0IDphDvVV5QZbA9zLihy4nX+Sszh+rN8+68d9wnJ4UFnji40W/Eb5xtP/9+1yapCvTDH6w+eG0Ztw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(7696005)(1076003)(6666004)(47076005)(356005)(82310400004)(36860700001)(2616005)(16526019)(336012)(186003)(26005)(426003)(5660300002)(81166007)(8936002)(36756003)(4326008)(2906002)(86362001)(54906003)(316002)(110136005)(508600001)(8676002)(40460700003)(70206006)(70586007)(21314003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 13:25:54.1589 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c076418d-3e30-405b-65e5-08da13e325fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4823
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
Cc: stylon.wang@amd.com, airlied@linux.ie, Sunpeng.Li@amd.com,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 solomon.chiu@amd.com, jerry.zuo@amd.com, Aurabindo.Pillai@amd.com,
 wayne.lin@amd.com, Bhawanpreet.Lakha@amd.com, agustin.gutierrez@amd.com,
 pavle.kotarac@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[why & how]
As per eDP 1.5 spec, add the below two DPCD bit fields for PSR-SU
support and capability:

1. DP_PSR2_WITH_Y_COORD_ET_SUPPORTED
2. DP_PSR2_SU_AUX_FRAME_SYNC_NOT_NEEDED

changes in v2
------------------
* fixed the typo
* explicitly list what DPCD bit fields are added

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm/drm_dp_helper.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 30359e434c3f..ac7b7571ae66 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -361,6 +361,7 @@ struct drm_panel;
 # define DP_PSR_IS_SUPPORTED                1
 # define DP_PSR2_IS_SUPPORTED		    2	    /* eDP 1.4 */
 # define DP_PSR2_WITH_Y_COORD_IS_SUPPORTED  3	    /* eDP 1.4a */
+# define DP_PSR2_WITH_Y_COORD_ET_SUPPORTED  4	    /* eDP 1.5, adopted eDP 1.4b SCR */
 
 #define DP_PSR_CAPS                         0x071   /* XXX 1.2? */
 # define DP_PSR_NO_TRAIN_ON_EXIT            1
@@ -375,6 +376,7 @@ struct drm_panel;
 # define DP_PSR_SETUP_TIME_SHIFT            1
 # define DP_PSR2_SU_Y_COORDINATE_REQUIRED   (1 << 4)  /* eDP 1.4a */
 # define DP_PSR2_SU_GRANULARITY_REQUIRED    (1 << 5)  /* eDP 1.4b */
+# define DP_PSR2_SU_AUX_FRAME_SYNC_NOT_NEEDED (1 << 6)/* eDP 1.5, adopted eDP 1.4b SCR */
 
 #define DP_PSR2_SU_X_GRANULARITY	    0x072 /* eDP 1.4b */
 #define DP_PSR2_SU_Y_GRANULARITY	    0x074 /* eDP 1.4b */
-- 
2.25.1

