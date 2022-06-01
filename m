Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E0C53AD34
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 21:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9AF10E150;
	Wed,  1 Jun 2022 19:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A37110E150;
 Wed,  1 Jun 2022 19:25:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPwDSE6xZTOcDmegfxpwIk8FJ9dc7LHCLzsEPjNkQWD49KDk6ibSXC45oRuBbtVW+x2Etdjr2osxlnYHJ+iacLYjyDT/fByrkfh79bKbGPjXoJfXkjemzytUTLEq6dPBhmJDmERTcEh5Ggo692+4zjlmTe/dVexWMRZrYZdbXs+DqzJiicX0zU9pD07tfEykUONS1bO28hbZOXowq9QZQWyCuIbr6Lp5eDwdROmxSOjC8fT4GDRunUP+z2htGkM00JKGcKfRtHDiYhlOmmElEPJB91x5iHPPQO4wX7ddbrHfsIltrX4nBcXzG/mQloSCJW3Z8fb13zm3GXLnGudStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CigibqX+v/Ksvun/vB99uDAt8pC9OuO3KP/4qjkXez8=;
 b=B/I7rUbSPl2lawnPMDwYoo+7xZNs90sz8n6qDZI4zJgqICdyKjSpJ+JQw0vPMMPkbLhWNSpIiJ7G05EeFj5jUkOlDBZr76gF47O8beFDTfqTrLUWsrLTYckv6RYG4mCda+7no81kYxE0HDWb3NmBwzJg78oh6MGuUuyoA1uZarIk4/uEFC8MXSX/iU4izDoYYYF+b6QXBMb/hmHwRaH1uh37+QJwVO1EpkFyYhQ/YRwvkpM1uve1JZUFU2gYpwvWLz7DPQ7IXA1awFR8LA2yRI+YAUJVZofNHMx6lJkXPdYybiYVHAGEPyIFtsn+GdH3gc1vHoKhp+Dl71HCD0WAxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CigibqX+v/Ksvun/vB99uDAt8pC9OuO3KP/4qjkXez8=;
 b=wd3qkq/wvSXSYWMiLr32LWH8cXnrxwb3bORlo5TSlJ/zXZtJFN/CYhmxsoeHRyL+yxvE/QRu9p9Svd1EIlGSLyHZpvtWpn38Ytp+Rzrci8lopdl/DjwpXat/QS5zWYABnwvuCYWsgK7ap209O1eJhItohsyhDdrsfsNUBgqyxNM=
Received: from DM3PR12CA0104.namprd12.prod.outlook.com (2603:10b6:0:55::24) by
 CY4PR12MB1941.namprd12.prod.outlook.com (2603:10b6:903:11a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.17; Wed, 1 Jun
 2022 19:25:00 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:55:cafe::d7) by DM3PR12CA0104.outlook.office365.com
 (2603:10b6:0:55::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Wed, 1 Jun 2022 19:25:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 19:25:00 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 14:24:59 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 12:24:36 -0700
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 1 Jun 2022 14:24:35 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm: Don't block HDR_OUTPUT_METADATA on unknown EOTF
Date: Wed, 1 Jun 2022 15:24:05 -0400
Message-ID: <20220601192405.74982-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db6c63ef-d7c7-41d2-8528-08da44046bfb
X-MS-TrafficTypeDiagnostic: CY4PR12MB1941:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1941764A33EBFD32FCA5E0188CDF9@CY4PR12MB1941.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y6wSuz9+v9aaiYJViANdvEUnKzzu7EnzDwxV1lrD37qFDlw6pl+K9U3qTzCR0Z1C6DW/pwu4TVVy585eW/qZUOEcUog37olxovrsn8VpoLnGIjMd1DS529RDsfCkCdHbPL9crY6Nz3stgvf2CNOnauUN1vhCiM8EWfF4bFwxXklniBonV4oo6BsZvPF6X9Mie0IjzE8D0b8XhR8XLgHasxpFu4vyBAfMG+VAbQzd+455FUXA7N020Up+rwO0hZL79WsVlEhThMNNlcjJ3yD2sUWnBEIiaKIIsQNg6Dm18CX7elJ2oKZ1tIZG7g1jIA9PoJs2ATJjslY3Q0aqKDzWiswk846HvDXoEtVGoXNq4ilv5YtIBzmfsmCpWNItWIabht7MCGrVUjwN9j88iijvDTgy2DlZNZ6f8jaI3Z3p/NfmSpOm/r+ozLCfYML1I9nmA+/wk+/ojF/MXLmPjKVHSoOncKP6FAysCV0/UW+/EPiwrtlioymi2Mmmx1OCYVbn4GM/SPguuDCybmwLuOA3Bvy9uwqd1dKjMRIwOhm7fyInNG1OIo+LhttCX0K0zJmPIvM5ecQ0Pqt/0MjwX4X7hqMk0XTGs2qZx2Ms4eoI5+SfMMGat2r+b8sqD7glZb6/WrFW5QVv29pD0iOOlfTFsbUU+mvQdYhT7Ej+YYNQj6+WtcxG9sycWUC5ypLUBAQdvInQtzLTUjbN5EXZl81jQA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(5660300002)(8936002)(110136005)(966005)(81166007)(54906003)(86362001)(26005)(2616005)(6666004)(426003)(47076005)(336012)(66574015)(40460700003)(2906002)(7696005)(186003)(83380400001)(356005)(44832011)(1076003)(70586007)(70206006)(8676002)(4326008)(316002)(36860700001)(508600001)(82310400005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 19:25:00.7456 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db6c63ef-d7c7-41d2-8528-08da44046bfb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1941
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
Cc: sebastian.wick@redhat.com, Pekka Paalanen <pekka.paalanen@collabora.com>,
 ppaalanen@gmail.com, Uma Shankar <uma.shankar@intel.com>, vprosyak@amd.com
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: ppaalanen@gmail.com
Cc: sebastian.wick@redhat.com
Cc: vprosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
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

