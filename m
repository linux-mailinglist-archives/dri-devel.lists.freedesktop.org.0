Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CD464A6DF
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5BD10E25E;
	Mon, 12 Dec 2022 18:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C542D10E24D;
 Mon, 12 Dec 2022 18:22:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGipPqGvuJkunQZeMIewfmEHBVcxlSVelzjAavY7z5q7faJ3RSULZ6dpB+Wa5UDwhdLBls7pdkVvQwkG8XfWrVou0pZEdZzhbNo+5FGoFBfAs3RKDIkQKLVtCLvJb6rp2xypqsHr++mH8ZeKB/fObXy3nCMJTvHgnohjFvqGEVKMwwaLDKr+ATFiMQtvSsjHhVFDduywe6m61vXLhzzYLMtdDEF+osJh8P2IWOYcWO3dMtv8aKWx8bOEvVYdEPgXVS/qysE/ec7WVw2JrGyNaGo/Pc5cgO6vt9KC9JM5pCWI90BSpIpUdB+DZPRS/75PxypdRwDZP7EgCBqjvYgd7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cC+/yyhzUL9R1NeoQ+82scgpsMR0VgmOzjoc3lGhOaE=;
 b=DAp/mgMzAhqg4QjUHYY8+CmQ7T6GUsuch8ghSKQwc79QLXTB3IOPhk6GKzAEUT6Bgo/6OhDFhPvSXfPUUZlrjQKTb5ecCwdFAvV8eshIVqZhhlLOJh2ASTTHKPxG98iyMc6197WaQmlPwWVHdvHD2R88iMW9q0aQm1CgTZ/UX5m7NhXeiq6wmPuCw5UbCsBY45TQc25WMX6NYa/Wg0J7WUDm0KIAIOR6GC2kaBEDpuaxdvLE9enSSsTDicK917zsfBwppYP44CcP5iKnRdtTPKLdGsL1f3bkqB/wkGZyp2q4LWDkL8dg0zTykqePhhEG9J/bRrN0NwwceraSOPI9dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cC+/yyhzUL9R1NeoQ+82scgpsMR0VgmOzjoc3lGhOaE=;
 b=F7BbqtQQ+inEO8Uo9Pt65xIclykpHhvuUAo6HDHhclyXzOd0z8WyJBBgFz1ICxH5FPkXlmRZQMCW2C10H35Hi47F/TPQmKs1p2oCsnrbiyaeldPOBTT9dxgFx7kAGuhwYCyeB3y5n9P+S2nhbdTds1lCmXLzvc44PhO69kmmRLk=
Received: from DS7PR03CA0027.namprd03.prod.outlook.com (2603:10b6:5:3b8::32)
 by SN7PR12MB7323.namprd12.prod.outlook.com (2603:10b6:806:29a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 18:22:06 +0000
Received: from DM6NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::78) by DS7PR03CA0027.outlook.office365.com
 (2603:10b6:5:3b8::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 18:22:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT092.mail.protection.outlook.com (10.13.173.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 18:22:05 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:04 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 10:22:04 -0800
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 12 Dec 2022 12:22:03 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/16] drm/display: Don't block HDR_OUTPUT_METADATA on unknown
 EOTF
Date: Mon, 12 Dec 2022 13:21:22 -0500
Message-ID: <20221212182137.374625-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212182137.374625-1-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT092:EE_|SN7PR12MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: c77d3a31-4b22-4991-fa1f-08dadc6dc62b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y2skLWhxtAIEosyFUVwC9sIZUNRI8VmdS1ZrBwWuW9minUNFcaZDWkg4ECDgde4MK0No8R7adbGFCpNQDBbEJV9Qtqmny1KvWItkvFs0SSa3xY+NaF6IJMTFtUHS83sdm4rS/LiwR7YFHiVCsmmuW2wYNEPqtaChEStsSkujBmE5sMVHUvNKBUPGdFeUHde8iBl+nqHKBJluLlfR9/uope0CVIIkVh2prMolyPwfOjwhaOVUkTpCyzKFSN0E/IrswuJD7PY51eLL6XZbFjbE1KvsaRUkhwXqXCIxS7g4hJ+LF8QRczLcWjrFtQShcKXiClj9uMOURclLUKdFQKRafSxHYUyvVeTdYXZmionHcZo0mI9r4NtikCTmRSNP/h8BZrDkpwR/09CUn0al6FRWxbci8hPdZAQ41GjY9GKceKBllli6RnmibaWes4UUQ00nKGfg1MVcImwxlph272W3VPVr7zp5AIsVgQXlLWAyCEhgfsnB9Gygvy4+xRs/QftN9YbGTYHsBWB2hegzaRPSO9N68WEOdQuwt1ywTeuqbuB2S9Cvxu2gAgaXEVkIs/qx0m3LSZ4oXhaQxxdpFthc3ZJmvpSPXXKAt8H31dluVw4jT1lmmwu2zInvvnN97rKHXDYPK4ZabeT21dmDV93FRs4bmhVf8+80qlR8puquCTCa44/zvMV7Cuk/EWghmFek
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(86362001)(966005)(478600001)(40460700003)(110136005)(316002)(81166007)(356005)(82740400003)(82310400005)(54906003)(26005)(40480700001)(1076003)(186003)(6666004)(7696005)(2616005)(70586007)(41300700001)(44832011)(5660300002)(8936002)(2906002)(336012)(47076005)(426003)(36860700001)(66574015)(8676002)(83380400001)(4326008)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 18:22:05.8007 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c77d3a31-4b22-4991-fa1f-08dadc6dc62b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7323
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The EDID of an HDR display defines EOTFs that are supported
by the display and can be set in the HDR metadata infoframe.
Userspace is expected to read the EDID and set an appropriate
HDR_OUTPUT_METADATA.

In drm_parse_hdr_metadata_block the kernel reads the supported
EOTFs from the EDID and stores them in the
drm_connector->hdr_sink_metadata. While doing so it also
filters the EOTFs to the EOTFs the kernel knows about.
When an HDR_OUTPUT_METADATA is set it then checks to
make sure the EOTF is a supported EOTF. In cases where
the kernel doesn't know about a new EOTF this check will
fail, even if the EDID advertises support.

Since it is expected that userspace reads the EDID to understand
what the display supports it doesn't make sense for DRM to block
an HDR_OUTPUT_METADATA if it contains an EOTF the kernel doesn't
understand.

This comes with the added benefit of future-proofing metadata
support. If the spec defines a new EOTF there is no need to
update DRM and an compositor can immediately make use of it.

Fixes: https://gitlab.freedesktop.org/wayland/weston/-/issues/609

v2: Distinguish EOTFs defind in kernel and ones defined
    in EDID in the commit description (Pekka)

v3: Rebase; drm_hdmi_infoframe_set_hdr_metadata moved
    to drm_hdmi_helper.c

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index 0264abe55278..faf5e9efa7d3 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -44,10 +44,8 @@ int drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_drm_infoframe *frame,
 
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
2.38.1

