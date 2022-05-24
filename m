Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CA353307E
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 20:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20E910EEA3;
	Tue, 24 May 2022 18:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651CD10EEA3;
 Tue, 24 May 2022 18:33:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDu5QAajNA/SfHDV1+lKEXCanWsx2Owv5+dHfaGKI/IGfF36MgYeLxgq+5BfIIsG4NX1RZlGZhDow3NOvs/8NoIQIEbeADPxE5c4/SCd6rR4BLOfPfnw1+10J0yYTh0Q417znNYgOjNmQD4sO6hhrR28T/6557sIGneHJil7Lr0/w4YbGgkyHUmOHqt12oHwiNzfPnNVe45fX73mAaEV3ZNVGJah7DivAa0pg2IbngaqgnDRTy5mhiq6KEtaHSmFRGXW6f6PZelFsb5Qew3Sr4w+aJ/wAGFf2jedHsMolN0lgnFvvPLPUvL5eRuUB1Qtn+wS62ZruPiAgArWIiIRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlqiNAaIB9Y+IIex/HsVnaVBoCD21HNTiLjvcr3R2q0=;
 b=Ynbck/3Cma1zxVAe0rO/hoILUH02QaJhO1nNt/BZlCCDC4ZCz0RF0pHGrx14EI1Fxs/LzBs/CYJx5BwFAsWRrlnk+xhrLVyxND59a8wPlrsYCp6qQVnSy6u5/kEmHqmTZ8tf7Cmpq+heRwBzyzVRxx4sAUfddlIFP7TYSYB4yzetSChoacl/NW0uTBgME4jnn6WDpOP9bmL7f0KJ2BC2ckF8qo8d1bQRah0LitvxfATMCWf+F8CDfKYdDI3fOGuZJgXf4pdc4D5D1bEXsdAPyKv+HDppO+xCHwrSVfvVEYOmAvTG3VnUDu+USCiYieiGkPLMEv+1tuPck5s0vJtYIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlqiNAaIB9Y+IIex/HsVnaVBoCD21HNTiLjvcr3R2q0=;
 b=UoB8g4asud8/QG/BBHY7O9T6T+ci7cXvlC942La/cjc8vDAtxQ98PXiuqxtQw39x2k7TLOHYiSxgv18W4GalcXAPeMjpS7fSlzFw3s9e2CegXmF6q+yYb0Fceeg9dStoYzrePCK5m5H+OYVjIU0BN9niRxAklx/fZoxDRzx7OPg=
Received: from MW4PR04CA0209.namprd04.prod.outlook.com (2603:10b6:303:86::34)
 by PH7PR12MB5832.namprd12.prod.outlook.com (2603:10b6:510:1d7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23; Tue, 24 May
 2022 18:33:53 +0000
Received: from CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::44) by MW4PR04CA0209.outlook.office365.com
 (2603:10b6:303:86::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15 via Frontend
 Transport; Tue, 24 May 2022 18:33:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT041.mail.protection.outlook.com (10.13.174.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 24 May 2022 18:33:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 24 May
 2022 13:33:51 -0500
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Tue, 24 May 2022 13:33:50 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: Don't block HDR_OUTPUT_METADATA on unknown EOTF
Date: Tue, 24 May 2022 14:33:20 -0400
Message-ID: <20220524183320.28870-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01cf33b4-028a-4294-41d3-08da3db3f43c
X-MS-TrafficTypeDiagnostic: PH7PR12MB5832:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB583226FE4B8A5AA63138B8AA8CD79@PH7PR12MB5832.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xIoMDER7I1+SRC8ypn2uFjXXrjwH/U31b7obEbwbiwTsyEbK5mQ2ceuKEQ7YeJkPbJk617iK5z3fjkzIL0yoJ4xKU69PP18P02HmWIB5ibpMdHsytnmH2LqQZfuwZU08zvTZJgygLX0xnrXvgoo2arETCsKXcNqYsMXQXdjveA+5/9qGCkqvYqgJol9bU42aBo3HbRABCq/5qzdmA6eD0c4CSFhYjg2CyFGVOIbP7EzDTQdr6JPIlc7Hr0QlxUbcm87TAXEdUlXZpsssq2jcY82Je4a1z2NHuhONr1q9Lb//NsLsm6wuSaWeAHBDF94zaYIGN6qNPqxfcMlKrOSIy/TXSGJPthYSzLcp9Dv3UZ9CubU8Nxpbdgx7iiSsyCE1AW+3Ut4ycbCEfyvIHkjyC452I70RcWUxiIpQ81CeaCB/4RscdSGRS1Un52qkhgGJwsHn3fw21+Wt3uVnSZ/BsgJL+eAww94r1ctNWmGGswWAHIXhUH2uKhar/dyectr3bg6Xyv5tOr1zzMRv0c+8D7OEOJMKPo4OJ6w8gix3HCKG3wQlsAj2ZZamFDhpil2FXMqjxdCWk7bXcWnC5hRfEWU7DnU2ICrjTv3z0ibL7q/CQyvtvpRueuLuwbna7Oxy5jvku5dJ11fEyyVUg5aNBuBXpwDixVZ3HD+LgegzoYSlh0s2GVhrw2p9RFhh1NjHPYgch945DWa4jjY2rsEQEw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(44832011)(2616005)(1076003)(4326008)(26005)(70586007)(8676002)(70206006)(40460700003)(966005)(508600001)(356005)(86362001)(316002)(5660300002)(7696005)(82310400005)(110136005)(6666004)(186003)(2906002)(8936002)(426003)(36756003)(83380400001)(36860700001)(47076005)(336012)(54906003)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 18:33:53.0657 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cf33b4-028a-4294-41d3-08da3db3f43c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5832
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
Cc: vprosyak@amd.com, ppaalanen@gmail.com, Uma Shankar <uma.shankar@intel.com>,
 sebastian.wick@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The supported EOTFs are defined in eotf_supported in drm_edid
but userspace has no way of knowing what is and isn't supported
when creating an HDR_OUTPUT_METADATA and will only know
something is wrong when the atomic commit fails.

Since it is expected that userspace reads the EDID to understand
what the display supports it doesn't make sense for DRM to block
an HDR_OUTPUT_METADATA if it contains an EOTF the kernel doesn't
understand.

This comes with the added benefit of future-proofing metadata
support. If the spec defines a new EOTF there is no need to
update DRM and an compositor can immediately make use of it.

Fixes: https://gitlab.freedesktop.org/wayland/weston/-/issues/609

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: ppaalanen@gmail.com
Cc: sebastian.wick@redhat.com
Cc: vprosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 12893e7be89b..223f96a72064 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5691,10 +5691,8 @@ drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_drm_infoframe *frame,
 
 	/* Sink EOTF is Bit map while infoframe is absolute values */
 	if (!is_eotf_supported(hdr_metadata->hdmi_metadata_type1.eotf,
-	    connector->hdr_sink_metadata.hdmi_type1.eotf)) {
-		DRM_DEBUG_KMS("EOTF Not Supported\n");
-		return -EINVAL;
-	}
+	    connector->hdr_sink_metadata.hdmi_type1.eotf))
+		DRM_DEBUG_KMS("Unknown EOTF %d\n", hdr_metadata->hdmi_metadata_type1.eotf);
 
 	err = hdmi_drm_infoframe_init(frame);
 	if (err < 0)
-- 
2.36.1

