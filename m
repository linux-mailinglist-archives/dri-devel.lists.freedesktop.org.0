Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E51A611BB9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 22:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DF610E224;
	Fri, 28 Oct 2022 20:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DDF10E224;
 Fri, 28 Oct 2022 20:44:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkUeYHXQLIXCBRzbs5OY6PkRnRi9o70oHLYYtjTLDQN0To42a7o0ciht5F3J3jT1fHyM3ALyFmOAJnFyEXM5fueV0Zs0mr0IAAxGa94s6GYGUKPkudo3SDeknfD6JrjcMb4tRjreCuvE/vD2U+cuJo1XbvGhLYCxPP6HGRafI3zetEBM7xFBkRZ//08TgAprPySkPsp+CmT+m7+2hWSYE9mu2mmbAcQWfwddWZmVcSf+baZbTN9BqkBTMlWiAk7qGEksvDYdWmkudmr0L3EAYpuum3uVWkHSthlF29h5ssJaengMg41KM3DtWGk9BC7xerEXACi3Felwc0XPU7eB/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4k8HfM2PWAi/GFFFr9yfKKJxq7nWyyGvT0ysx+xvX0=;
 b=noFNh++gPNqeKKpLWxjO3DcSDIUkNfbNiKLZjV465VXZ7cpt+5AZSn38wkc5dz3GkXEkBOfC4zkMkEgXMiY6ZsYSwSHYOCxMUkZZAXRtjesQ2sjR791kUzc8gbMxF/JMn/htQz700vVCGcuWGvsl7YO1MuiDOif936u0QWM4TgUjmD5TTz3eufnQ0jl4Hyv49yMQWzYbRGjPLNO6P4+NMxtN1vLJqSWaD+vfukKKHEoJ7S6WZ1KaGU0a4BmocDNR+AY+8c5bkMaUHvUzWaH+rjKr0qw2INQ+rBjD3vP7Muc+ROZOhUQ9+v36fHI0+xc8ibPArBHoEAreNgASuAG1TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4k8HfM2PWAi/GFFFr9yfKKJxq7nWyyGvT0ysx+xvX0=;
 b=asGapFmMs5ef76m675zcOLKLJKzsTntWp5ZbaIOcY1s5kDsbqDfcd8md7xV2GJGMj8kELg20Hfo1WP0TgHUoVKPclWrAycKy2dLrBvZNeO3iri7lBWroGSDtvx/B9YVtBZWydDo3fLW0Js3EfHzBjO+Of+8k8kZpCNjJjrSuvmA=
Received: from DS7PR03CA0021.namprd03.prod.outlook.com (2603:10b6:5:3b8::26)
 by CY8PR12MB7539.namprd12.prod.outlook.com (2603:10b6:930:96::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 20:44:34 +0000
Received: from DM6NAM11FT090.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::d0) by DS7PR03CA0021.outlook.office365.com
 (2603:10b6:5:3b8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Fri, 28 Oct 2022 20:44:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT090.mail.protection.outlook.com (10.13.172.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 20:44:34 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 28 Oct
 2022 15:44:32 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: drop vblank_lock from struct
 amdgpu_display_manager
Date: Fri, 28 Oct 2022 16:44:53 -0400
Message-ID: <20221028204454.193752-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT090:EE_|CY8PR12MB7539:EE_
X-MS-Office365-Filtering-Correlation-Id: 7092ee68-e985-40a2-dc04-08dab92538ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8VrcmTc6XqQ1cLwahIcGGXcR05N6ZCWWMK9vc8KfylcXFXorYGicqI7zcvuCTQMKuUWur6OsT4mL2Lk7PpmAUmazRmGGSQtPfMuJxaeA5NZ5xlCFxxxQn+CywzxQO4QNkQA7y6FjEpQIlJt5Q0HpAUgVxGmnRT5mTyDx6L2jNEUqXgezLLpCS1e25dd5QqnAUe5+TJ9bHAezBq8CB/T51koYnW1TTdK2jyXRsOIN6SUkSPY3jGZvUqNfqC+ob1otJ7yOB6h8jf4dHms+eYIs6GcYtJohzsx683hRyisrFDW5S3K1FC4wbkFFgNcXt2CYh8qeRrqzDB5H1vG38ZbqzYA4M+o42mhwOTdKMI2lyABXQh2x+frSRBXS9+eKf3sxG8mqNgkOfyQMRDNg1V180segqSNfiufnOoAnRqvWNM2XiObuz4M5PtT3EFdhr3Faq/O4onXFOZf9sgtFAvPQiWLFlp8PNtpF4p9klGY8YXPMIciCuwBkkVFS9Dfs8La1nWvy/MHCCS6ZkbIu/rHpAUblcEiUm3M5k2hUAERX1mkrgHzTF+QLsFlE+CIjCQrktYrCHirqVDN5GYvuEhf8tbwujRKPnKYgjjfT9zhXnX8OW26QpJJeOT+/I3I1B6IJh1aepDRP2i199Cfhg+QoU8W1R2RNLTuwp2+9KVdGNocTg7wxXvNxW9OoOgeL+2iP8a9XeBjy+zF6UhWWRpo91tSJRonf5MDT3RIOKP3piPnqE85P3gUlU71nW4ebHrbw8Ys1JzsDIitRSfmWy1e2/ldQxBBgjhR5m0TGOimn8Cxw8+bJc+f0uO9V7Dcb3oNGZBR4mL7kEbLqw0P/s8QvPQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199015)(40470700004)(36840700001)(46966006)(5660300002)(41300700001)(70206006)(44832011)(6666004)(40460700003)(2616005)(16526019)(70586007)(186003)(4326008)(2906002)(336012)(8676002)(36860700001)(426003)(8936002)(316002)(82310400005)(83380400001)(54906003)(1076003)(36756003)(47076005)(40480700001)(82740400003)(26005)(7696005)(478600001)(356005)(86362001)(6916009)(81166007)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 20:44:34.5671 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7092ee68-e985-40a2-dc04-08dab92538ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT090.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7539
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
Cc: Alex Hung <alex.hung@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne Lin <Wayne.Lin@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Shirish S <shirish.s@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As of commit 09a5df6c444c ("drm/amd/display: Fix multi-display support
for idle opt workqueue"), vblank_lock is no longer being used. So, don't
init it in amdgpu_dm_init() and remove it from struct
amdgpu_display_manager.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 7 -------
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index eb4ce7216104..11afb4b24fd9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1394,7 +1394,6 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 
 	mutex_init(&adev->dm.dc_lock);
 	mutex_init(&adev->dm.audio_lock);
-	spin_lock_init(&adev->dm.vblank_lock);
 
 	if(amdgpu_dm_irq_init(adev)) {
 		DRM_ERROR("amdgpu: failed to initialize DM IRQ support.\n");
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index b5ce15c43bcc..b618b2586e7b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -365,13 +365,6 @@ struct amdgpu_display_manager {
 	 */
 	struct mutex audio_lock;
 
-	/**
-	 * @vblank_lock:
-	 *
-	 * Guards access to deferred vblank work state.
-	 */
-	spinlock_t vblank_lock;
-
 	/**
 	 * @audio_component:
 	 *
-- 
2.38.0

