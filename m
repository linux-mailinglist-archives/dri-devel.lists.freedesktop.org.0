Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A52865F2E6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFB910E7E0;
	Thu,  5 Jan 2023 17:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7423610E7D5;
 Thu,  5 Jan 2023 17:37:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=josQhijl3eh9kqSq44Gmb88SVuijyV+diV1kCXMMweceCMjFEshaKhNWOf8Wae3xmyHNxc6Ztui7kytwq0ul1Iea2zZ2wY6lN0o5y+8dIFrmX5Lg2DtTu3uCTEaWzhOU/W9kFhoQAi1v76vnWX/b3xJG013lhuWiGWR/CCTz1E6DguSGSKf0h0rYjTP5AubGpNuTQjUq1bo+J2D3iWM0lppoVLPKCYhEhh5A81Y+EP7jKYPHdxJkodXJ1pKS1JKMYRGcXue8sASFryB0dMXUqmBQozsN/xL7w6mLyJ1Yj+M32NhFuqQNRtUR/1245/pHQ0kF5etCjG4RWGt9NLDHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6eClMa1RZ8Dg5HqK82s80FlONIdb3tIvyiNypRO25Y=;
 b=V0wZVvYnieqJ2jPYQJwvgEoQNOCFSOysrWHlAhQIewEWrDNepJS03z4p2Unnu35wuJ/5ihkM0xKRJpvryT6ZAKgbBQ1dEkD5BkmWjQSqzBUV5vWF2cH7jho6xg+XsnYc4p09uhQyd2j0KUjoknV1Qjwg+KuuHrQwcU0g5JFNboRdIlDYHtVMXYYHe/Fqu6E9spqx7Szh/6npPe1MBWBlRbeW2WGm9iMbenS0+ndOxIRjeVIeb5yKQxqcNki/6RfLAWCRsZQXtsO2yf2Ri47qs9VFz/+nid7E/HqMcl8l+wJ0e4WZz6jQd/AVZczj0fsByEpAYC3ZdfpmRn6MqBKUEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6eClMa1RZ8Dg5HqK82s80FlONIdb3tIvyiNypRO25Y=;
 b=vh7RWkrN9/9r97xNlVVV1D0oxyq3mXUBxYgWd/Rve3BPCdpuczUSKKf40phtuqfSfad+3tFdXqKH9lC2vNl1luoqMMO9Zc1NqtvyVtvXQQGj48i53of/9sQWREgahHFMGPrsSlbhmgG78zeEqaIGqdibrJjTcJ4KlUxt9zocWGs=
Received: from MN2PR16CA0038.namprd16.prod.outlook.com (2603:10b6:208:234::7)
 by DM8PR12MB5397.namprd12.prod.outlook.com (2603:10b6:8:38::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Thu, 5 Jan 2023 17:37:46 +0000
Received: from BL02EPF0000EE3F.namprd05.prod.outlook.com
 (2603:10b6:208:234:cafe::2d) by MN2PR16CA0038.outlook.office365.com
 (2603:10b6:208:234::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:37:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000EE3F.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.10 via Frontend Transport; Thu, 5 Jan 2023 17:37:44 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:37:42 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/display: fix PSR-SU/DSC interoperability support
Date: Thu, 5 Jan 2023 12:38:08 -0500
Message-ID: <20230105173809.289367-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3F:EE_|DM8PR12MB5397:EE_
X-MS-Office365-Filtering-Correlation-Id: 35837f35-03bb-4d7a-5f34-08daef438d8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fA23wUPRiReVAluhlS7ks0WrACFNg7bnCwqnkyXq1We9ZWzV0COdMd8BoQGZ3pG/sXOISZ7ZJtT2616oHk4GvAqhYoBilgk1V+Zuy0+V+my1yzUEGIdAugt5trYkPSeLAvzVggl0+vRE+2q75F0ykX41KxJr3I6Lb+yzOqkpzkDRNDVMyKd0n78pqnXi7WrmO0FrerXjsxgYmyyis1z0nmQ/hb6yNchD2XejE1wcxnnOe9U65dwDiEm4qgnjJoQEedtJg1d040fHaavwSjtEZyNDAFMn9jJGCLrD7fhXiR/Vk7Y9d1Y50+qfTX5HKWnlUhNZvTMS8Ak3MiQ3m+1xKsRHEuMDl6sb9xKsPOHeL3K5MfOAunjdEBgBPoX75eJnbpfZCpd8ESgUGFYG+3PYEHWYNQbiftH5WCG/Pq+dogIl1pyRN9oB9mo4klno9ldArchVZ4pS4g7VFwzwMBYjtzbtcMIODbVHEPt1B+CSeGCykOheVDPEXf7hM4YKu0wgN3PN7hdlZORDiew2ZFpdQvr7TyJ4gmyd/sPHP8Uv+KtPdGcMuiWcPP6RYb1CmIb0YDE6f65pMIcqgIOiR8OSOSjRe+dzY1Y8OXnSrl/b4OsZz0Iy8v4A0HzaGbeNopluwEMrZOeAafMQRKRVAp/ywW7M6O0GZpdfBXmshJLLV7P1a9EcM/7H/tAUcmohMkbDL0bCR7zp/ZrImzA2xgnaoRsiSMZtjb5KCCk1AbqKRYd0kcBif74+qFtIL/+tDd1jcdIJw0iHj/yX+v+C4PO0Sg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(70586007)(5660300002)(44832011)(8936002)(41300700001)(8676002)(4326008)(2906002)(70206006)(316002)(54906003)(6916009)(478600001)(2616005)(336012)(26005)(186003)(82310400005)(40480700001)(6666004)(16526019)(83380400001)(426003)(1076003)(47076005)(82740400003)(356005)(81166007)(86362001)(40460700003)(36756003)(36860700001)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:37:44.2668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35837f35-03bb-4d7a-5f34-08daef438d8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5397
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
Cc: Brian Chang <Brian.Chang@amd.com>, Robin Chen <po-tchen@amd.com>,
 David Zhang <dingchen.zhang@amd.com>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, Camille Cho <Camille.Cho@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Shirish S <shirish.s@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Po Ting Chen <robin.chen@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, there are issues with enabling PSR-SU + DSC. This stems from
the fact that DSC imposes a slice height on transmitted video data and
we are not conforming to that slice height in PSR-SU regions. So, pass
slice_height into su_y_granularity to feed the DSC slice height into
PSR-SU code.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v2: move code to modules/power.
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c |  3 ++
 .../amd/display/modules/power/power_helpers.c | 35 +++++++++++++++++++
 .../amd/display/modules/power/power_helpers.h |  3 ++
 3 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
index 26291db0a3cf..872d06fe1436 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
@@ -122,6 +122,9 @@ bool amdgpu_dm_link_setup_psr(struct dc_stream_state *stream)
 		psr_config.allow_multi_disp_optimizations =
 			(amdgpu_dc_feature_mask & DC_PSR_ALLOW_MULTI_DISP_OPT);
 
+		if (!psr_su_set_y_granularity(dc, link, stream, &psr_config))
+			return false;
+
 		ret = dc_link_setup_psr(link, stream, &psr_config, &psr_context);
 
 	}
diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
index 9b5d9b2c9a6a..4d27ad9f7370 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
+++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
@@ -916,3 +916,38 @@ bool mod_power_only_edp(const struct dc_state *context, const struct dc_stream_s
 {
 	return context && context->stream_count == 1 && dc_is_embedded_signal(stream->signal);
 }
+
+bool psr_su_set_y_granularity(struct dc *dc, struct dc_link *link,
+			      struct dc_stream_state *stream,
+			      struct psr_config *config)
+{
+	uint16_t pic_height;
+	uint8_t slice_height;
+
+	if (!dc->caps.edp_dsc_support ||
+	    link->panel_config.dsc.disable_dsc_edp ||
+	    !link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_SUPPORT ||
+	    !stream->timing.dsc_cfg.num_slices_v)
+		return true;
+
+	pic_height = stream->timing.v_addressable +
+		stream->timing.v_border_top + stream->timing.v_border_bottom;
+	slice_height = pic_height / stream->timing.dsc_cfg.num_slices_v;
+
+	if (slice_height) {
+		if (config->su_y_granularity &&
+		    (slice_height % config->su_y_granularity)) {
+			WARN(1,
+			     "%s: dsc: %d, slice_height: %d, num_slices_v: %d\n",
+			     __func__,
+			     stream->sink->dsc_caps.dsc_dec_caps.is_dsc_supported,
+			     slice_height,
+			     stream->timing.dsc_cfg.num_slices_v);
+			return false;
+		}
+
+		config->su_y_granularity = slice_height;
+	}
+
+	return true;
+}
diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.h b/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
index 316452e9dbc9..bb16b37b83da 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
+++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
@@ -59,4 +59,7 @@ void mod_power_calc_psr_configs(struct psr_config *psr_config,
 		const struct dc_stream_state *stream);
 bool mod_power_only_edp(const struct dc_state *context,
 		const struct dc_stream_state *stream);
+bool psr_su_set_y_granularity(struct dc *dc, struct dc_link *link,
+			      struct dc_stream_state *stream,
+			      struct psr_config *config);
 #endif /* MODULES_POWER_POWER_HELPERS_H_ */
-- 
2.38.1

