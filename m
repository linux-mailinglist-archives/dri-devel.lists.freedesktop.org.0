Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C784D7D03C3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 23:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1CF10E54D;
	Thu, 19 Oct 2023 21:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DF610E542;
 Thu, 19 Oct 2023 21:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bA3gPEAXdcyOYHR+Rrqe+Jt6zlPiMXf1ltzISv1YffZUhpcVreHc6tWD4dnWJxR1KF+NhzAL+3lTIouTtgg52ymj6475NY6mWw3BjoyK9BJS9yBJwuTLEmvgJjs19NqugCpIRJ6gj2OfbcXrCr1PyYi+ujBlC7V7ZM1HusSK/usnSPTFxjvIGX+IWs9B6MBZhNdr7TEPJQpkvR9iLUMLHuuINcRgDB4bQ/08v+lRLZxIEbLDXvlFRkm+Wr1MuLtMTMzr5wNqNRybF4w2+8atHt5XYhsS8YBOJV2cVP+4RIYkvcSG7ecMMiHISBKDEASit8S0WI6sbD7P1c1Vfac8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLZAgmCFSndkojjyuMbU45qAmsVffkjnMXyJhfP5UZs=;
 b=kdKl3jgbq/VsalowGhMjgZo/pvjHZRUlLcTmP1/pxNDVjH4myLt7rSu1AIo/xcj9gJoNWcfMU7zQjVt360YSI4UB/h0hY71Kzj6oxluYxKlfiQojJzvLwGx+pNIIFYnYvdrHCgYjHa3mQ1xTxMiultV+d4XtjVz2krwPPl6HlfoyCzs1orSVOEsmOma0hvwKsXF7dL0V9RmKLIQgmmi3mmK3wDkseMZqjHUna/ZUDx+0FEid8ipKVuBrQCBMTrF05wDDCJ2qlTglfwB/6fPqyOp4f6h6hPeDzJal2G+gMRUsqU2XTSQajrhra9cauh0IB8zlieoSBPFaklOul/bveg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLZAgmCFSndkojjyuMbU45qAmsVffkjnMXyJhfP5UZs=;
 b=e8B0qQWViDhOtakGmVhWQPDaE/E+RSTgIIod8AVq1JL1rOlOoVJ2FXG30Tf46aXb50wkLbfu/bIVHwEhy2QX3yjhjQoBioywP878/rx9fm8YZpP13/0PVA6EWTVGNbaAH5rc+MLE9cU+WyfiKYUyKJrsMTqZa8rO4V2GqdeEPSc=
Received: from MN2PR03CA0029.namprd03.prod.outlook.com (2603:10b6:208:23a::34)
 by DM6PR12MB4121.namprd12.prod.outlook.com (2603:10b6:5:220::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 19 Oct
 2023 21:21:57 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:23a:cafe::7b) by MN2PR03CA0029.outlook.office365.com
 (2603:10b6:208:23a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Thu, 19 Oct 2023 21:21:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.21 via Frontend Transport; Thu, 19 Oct 2023 21:21:57 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 16:21:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 14:21:55 -0700
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 19 Oct 2023 16:21:54 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v2 05/17] drm/vkms: Avoid reading beyond LUT array
Date: Thu, 19 Oct 2023 17:21:21 -0400
Message-ID: <20231019212133.245155-6-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019212133.245155-1-harry.wentland@amd.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|DM6PR12MB4121:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ed8ab0-50c8-418e-ae11-08dbd0e96c94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KIs6/QgR1CXSYCqHCzdmFT6XW2HORswA+eLv/gijTimhqvKMvax7TdvxsFqPA/acLi7P3hu9SRj+VjTfMLA0iHGO4bPl4aBdvW/pnPxS1HY1L6R7ZbMQnsiAhzStRNOCmfG3eW3Kr7VcLkQb706VmMb5fsvLlxEbosmEqofE/m/3VGpAMTbyhd6wiw+N4jBYFQh0cu4kbLca+/ApjDsz46HPokdU1sroddki8K1m4EuD/02Cv7tS0F2Ni7aC1mZM1HlyBDxVIic4EmIU44PMLJ5GGZPRCl9/JUJ4apch64R88lHjZIyNd+8B+uw1oIaj3qIYkAAFmjSKDZy76NDMbgPKrpN887XEUv3D0QLFL+3ac9rJmS2RcWAxRU1z7IKq4tS603L/Iv1wGif+cg3WCG3Wy0EmGcsqBmvFd6FyrrszsYqTdQa1opuowyqlFeCbMHGLtZQk9GkHOOpB/TVk849K0UqcTLMNZPqPPpzQfIVvetWd1YMyskOfNSRJf8ofp8x3B4jVoLmBjzR6RPMDByjZGjACTkhF/BMmTVzTzhv1+lbWlp8L+q4CfQbbheFxSLF/QH1jVBFh5ZQpKexV/IdzWzmCe5kiVZ1ACZSZf3FTgKKm9d0KU8BmFzYdLjh13ggnS9k1MOXCBMuSlKo0q12yNjJ2SwtmMlAKJk6kBjIFUgDXn/scQuDnNNqHrmPoOmxiIFT9mJROg4MSzfCcUfwA8XoAYS0lAb04nUdOiec0WXNlqn42MF5YNN2W5uTS7U2mGESKrx5c2qUi47Y2mQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(82310400011)(64100799003)(40470700004)(36840700001)(46966006)(2616005)(1076003)(7416002)(7696005)(2906002)(44832011)(5660300002)(8676002)(8936002)(4326008)(6666004)(41300700001)(70586007)(54906003)(70206006)(6916009)(83380400001)(40460700003)(316002)(478600001)(336012)(26005)(40480700001)(426003)(47076005)(356005)(36756003)(82740400003)(36860700001)(81166007)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 21:21:57.0229 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ed8ab0-50c8-418e-ae11-08dbd0e96c94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4121
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Christopher
 Braga <quic_cbraga@quicinc.com>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the floor LUT index (drm_fixp2int(lut_index) is the last
index of the array the ceil LUT index will point to an entry
beyond the array. Make sure we guard against it and use the
value of the floot LUT index.

Blurb about LUT creation and how first element should be 0x0 and
last one 0xffff.

Hold on, is that even correct? What should the ends of a LUT be?
How does UNORM work and how does it apply to LUTs?

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Alexander Goins <agoins@nvidia.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Aleix Pol <aleixpol@kde.org>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Sima <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Hector Martin <marcan@marcan.st>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Sasha McIntosh <sashamcintosh@google.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index a0a3a6fd2926..cf1dff162920 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -123,6 +123,8 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
 				      enum lut_channel channel)
 {
 	s64 lut_index = get_lut_index(lut, channel_value);
+	u16 *floor_lut_value, *ceil_lut_value;
+	u16 floor_channel_value, ceil_channel_value;
 
 	/*
 	 * This checks if `struct drm_color_lut` has any gap added by the compiler
@@ -130,11 +132,15 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
 	 */
 	static_assert(sizeof(struct drm_color_lut) == sizeof(__u16) * 4);
 
-	u16 *floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
-	u16 *ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
+	floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
+	if (drm_fixp2int(lut_index) == (lut->lut_length - 1))
+		/* We're at the end of the LUT array, use same value for ceil and floor */
+		ceil_lut_value = floor_lut_value;
+	else
+		ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
 
-	u16 floor_channel_value = floor_lut_value[channel];
-	u16 ceil_channel_value = ceil_lut_value[channel];
+	floor_channel_value = floor_lut_value[channel];
+	ceil_channel_value = ceil_lut_value[channel];
 
 	return lerp_u16(floor_channel_value, ceil_channel_value,
 			lut_index & DRM_FIXED_DECIMAL_MASK);
-- 
2.42.0

