Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820FB669DB9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9791010EA35;
	Fri, 13 Jan 2023 16:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AE510EA2A;
 Fri, 13 Jan 2023 16:24:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A03eU3fz9WkU/sGktLyfUDr0HErRgHwO4OdxnSk+xeJwvKs7JZT4nfCdC1Paj8SiMhIP3+JyyhXsVdghVUG0UiMBw6R0kqZluM3tSZ2oWt7BFU5N80t1GtvgJK+PmuDlEgGaOC/w7bm4FWihtkGeRXA45KTMzK/ZwXFnSEfIOPmOw9SIEKsjTURuuHEZvBT0uUwd/w3zi7S8CoO+un0CjPpfourM5vKwEMZINkP9TjQKbSmcHUJmaIqOt8e+KJuLK/M312qWYXrq9uAah+W9CkZDa09z8WWgCbwYMtAeWsDtoHy9ffSWhtrimkqeqBRJbOGrhdcUjdjGfIy0fHAgQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czRmDJSPIx6S/HatNAGmQ1apR0JX68L/YPT/QreF7QA=;
 b=NTaf8b4dbMS5Mb5kl331kX1HWoI2Fhgse4cd+RDA9dvPCahqYsHZ5qdyk75P074tP5/D4vtecX8EBUDYCWvonrsGrqpz4Rfch/Tcz4McQUq3Dp/yoLFdWvSwRaIiyA8DgEkwWcTYPe1LRdgmEV1CpiE/WvXF1iZfzzfeAb2fX0/V9V0sMMJ2F+X2AHbPms0Obo0OuZwwFkWt5AzO2Rsj76xCWBQ+J74ryzLqWAQWSCNUH/rw7WWJ9uLIOF3pOMfO8qY7mjo/lDtbXsofaHKLKI884HNX7JRgB/NL0DHzdnLsK5MwS/Fip+vajtxHAdd3vYDkb8tTlNv2c20xw2pvRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czRmDJSPIx6S/HatNAGmQ1apR0JX68L/YPT/QreF7QA=;
 b=R8nLkYTy2PxqzOCyXaywIq2lTeKlYe1m4lAnnCF6c9w0LaTs+u+a6lqGKmTFCO8ZGsjOUeGc2PKCLJ0w/p3f7K5LE+vGI48rjH/2TCrHunkPSgsD8r2aGKi5w8LGNCC+n4Zl779uIhjYMA98Z9n1GO2Pf/l2MtPlH/SZrmDHi04=
Received: from CY5P221CA0135.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:1f::27)
 by DM4PR12MB5167.namprd12.prod.outlook.com (2603:10b6:5:396::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 16:24:51 +0000
Received: from CY4PEPF0000C96B.namprd02.prod.outlook.com
 (2603:10b6:930:1f:cafe::3b) by CY5P221CA0135.outlook.office365.com
 (2603:10b6:930:1f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.14 via Frontend
 Transport; Fri, 13 Jan 2023 16:24:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C96B.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 16:24:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:24:50 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:24:49 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 01/21] drm/display: Don't block HDR_OUTPUT_METADATA on
 unknown EOTF
Date: Fri, 13 Jan 2023 11:24:08 -0500
Message-ID: <20230113162428.33874-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C96B:EE_|DM4PR12MB5167:EE_
X-MS-Office365-Filtering-Correlation-Id: e61c5662-69c0-4a59-f1ef-08daf582b259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ny9xDBbCtMIMHwRMo3Fbc4i3n9QvNuy7+/KJ7doIeGe5VEQXlnc9HcZnKCzprNt+DVgp3oKqQ4VciItbYL7i9f4P6/KWvqj/DOAvVCPzZk39GE8ZLiECAa6/CSpueu0Iv9MKH9X1KMNHhcbFECRlDwe+6TEG2fIOBpFga5sA5WMgYqhoXM9/NdoOkFjnB/HpOmnyChM3QOxqoORYTXfih0jpEliUY0a1etW5WvgHE5/f+ptowQqJH8VWIDT1EEkb0Kl7+xyrI8XObOKiEx9gz3pCeY4objVx+YmxGEtGnA072amjVl7/hKNkqGmDjV6yjKKLnIh4wZs9W1wdmkfbWBY9BlP96rRYuNLeo1FBtMJXtmgBV6CEjHhpIss+5bABrEtMkOfRsFkVXhBGlABQA6j4ioTrXKdSth2wv1mRbHru75DOT/gA96YW7XsVTz9V00qXVPjr7IieCQOpDwQgrcf+EFzhrmBPAH1PXDb6r73SAnLYfw6TgQsS9uv+G9AaOBmN3KYaqrmEZ8wBR1AhEfgqdu1wh0mDcVbv4m2AjR/YRnsA+oHGlezyKpa4i8aCb8hSZ2wBJmwqDjIIYfitD8jxDmndA9KyM7pXTJrg7Dsxm9jP/ZNEcsXwVdQaC8y9UlR1NO/R37BnbnOo0vuJk55lm170NbzL3r9FNNEZIIFs1IyZPXZG2MeQqLdv9ije
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(36756003)(6666004)(82310400005)(186003)(26005)(966005)(478600001)(7696005)(82740400003)(426003)(356005)(81166007)(40480700001)(40460700003)(86362001)(83380400001)(2616005)(47076005)(66574015)(36860700001)(1076003)(336012)(44832011)(8936002)(5660300002)(110136005)(70206006)(2906002)(316002)(4326008)(70586007)(8676002)(41300700001)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:24:51.2044 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e61c5662-69c0-4a59-f1ef-08daf582b259
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C96B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5167
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
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Reviewed-By: Joshua Ashton <joshua@froggi.es>
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
2.39.0

