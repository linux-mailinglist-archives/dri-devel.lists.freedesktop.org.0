Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 013825F4AC2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 23:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891F010E00C;
	Tue,  4 Oct 2022 21:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B10710E16E;
 Tue,  4 Oct 2022 21:15:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJ3YN7zNBZzud6JsRMGEduK0shNWrl9A4ecDUCn8/a2JvLoTaAY3TpScTbPYmhc/q5snMWKbZg+F10KcF488X2YtNJDari7kNsFO9l2X1MKU36NX+VEHDjuizOs1wnzArzILc72Z6mULXyfl3898jt0Y+9YFFsN8K/l3zJUo4vXch/Lky0GPRBQFRmjASJss//2GMa5NeF/L7XmpmOr8bHKdrpB4QOH6KAvRp2eyTOV0PO8tUXjMycWJiUFAyiQGCQLc+SNCkkwI51pVcJj2cQeO2WddRf5Ttuc8uZBCXPDmd93Y8C5FuhxPjIFpQQuVieETrlmlyqFvKTqUOE8feg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucErDs4adg236opnS5erXRRIu67UlQYOXgb1hh4tOo0=;
 b=ccHcEts5TJM8cRp0doE0oMhNgK5kEj1yySixZGnHavw891nb+NF1DYpZHSmvfFTCXS2JnLYjgyQcTef5jGr/ti1QjIGz234PcN1KES+ySfIIGI8EGviBp9KsrlAJAccZoyK4nSaEEDRx6XzZPatMimwZcaauW1STzsREhiy5GOXd2URYHxynX+TXX/HEAB4tr5W0WeOXxsijRSJg4Y+rS4rIvFJQumazsP4seeXmQyVSmg9JSWXzLTNgqBYwI/fLrSVNUKAuyPHDEwrq5pVwBwvxbejPVWgc7TXd08e+RV4mKRxaTm4QDR9xGrr9FIIvHzw+ai0j/NOUzw8L3FZtkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucErDs4adg236opnS5erXRRIu67UlQYOXgb1hh4tOo0=;
 b=NSyZ8M9Zd9+ohRsLpwRENp35QPQ9ZwVFx+H5JHYvORuEDk+er8S0NUBr36VGW/njn+m7/iuMYTZvUkUxdtMi2N3/7qLKj0f7v0ejLtumCLR4qL6RPMaWOz27GH1qexodtA89RyyDG75+waVd23hvq9eAavjtluRu8Q0qtaHbISQ=
Received: from BN0PR04CA0148.namprd04.prod.outlook.com (2603:10b6:408:ed::33)
 by BL3PR12MB6380.namprd12.prod.outlook.com (2603:10b6:208:3b3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 4 Oct
 2022 21:15:16 +0000
Received: from BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::1b) by BN0PR04CA0148.outlook.office365.com
 (2603:10b6:408:ed::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24 via Frontend
 Transport; Tue, 4 Oct 2022 21:15:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT063.mail.protection.outlook.com (10.13.177.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Tue, 4 Oct 2022 21:15:16 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 4 Oct
 2022 16:15:14 -0500
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC PATCH 1/5] drm: Add 3D LUT mode and its attributes
Date: Tue, 4 Oct 2022 15:14:47 -0600
Message-ID: <20221004211451.1475215-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004211451.1475215-1-alex.hung@amd.com>
References: <20221004211451.1475215-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT063:EE_|BL3PR12MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aabb7ed-9510-4868-e060-08daa64d88a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZAypXibUTcXwQ+SLq5Hym8wjGi6T3tEFEUShWjlvJV/97SnWJj7YUkQHRjfTF0rZB+vz1U8YIhuAOSXv+xP1aa4Dgs+bp7xQvM8t9BDQ8DoOogDirwaic1kK2g66LkFwLl0H2+NXC5EGO9VfEzpJXd/O1fbco/EpyQB5lJpUvX0F5ZX+5NdJDBCDiYXT5YCHszQ3MOhQ4ZHru5yYBr2Llk+0o4GOT0TmhT09wBDfB46Ppwspp2UAzq8cl7Uj0ki8k9F7FsOSMzGf8trcqZ0WgFMudopnAmIPiWCyjMANgprJ5Ocs5Pnvm5XS2kEUTaQV2jH12A4qsEzbDnB3kl4NZ/UIlVCD5odTOrWSgGGbKZBZA9KwapmrBzULHVW/9QLSNWRLGQXNJfYZhwtWQHoTkoMJcQoJuFY5kbsrB/hNxkvCWSIXnzlYei5ENWLvnRmkXrGYuzXQF/LG4DVGeL2HBxED/V2VwOvajIh5UcvMdJIuP6JH2XFfOWbf7bhrevjbbHyty7oqot6tneDc/H22prTejhSBpf1yciO3fpDzWplFO8Fclw6AUEydRuMa2xedscwj+Vj2qmRwv6aXP/COWSlEjYZ1sQFlEHCvKf+L3CajF7cBQMvUL7PXj/Q09156sSwsmwuVJpXb15WwwH5MqyGTazXPqfcAvpD1l/Rx82fRt03Qpbc9Bdh1jdWULWrPHJ6yYvj5WyazMFRkArbsEzIQVfEmgpe2pMtJC+chCIKl6cdJTec1NJ1l/CqvIAeg5v1eJKThKfyqVoM8kJP4iAhHsD6xkVtOgjwoI2TU7mBSLSJcOYXSUXhgRnpz1PSs
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199015)(40470700004)(46966006)(36840700001)(54906003)(110136005)(82310400005)(478600001)(86362001)(44832011)(70586007)(41300700001)(8676002)(5660300002)(36756003)(316002)(40480700001)(8936002)(4326008)(70206006)(356005)(36860700001)(16526019)(1076003)(82740400003)(40460700003)(81166007)(186003)(6666004)(2616005)(7696005)(336012)(26005)(47076005)(426003)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 21:15:16.0895 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aabb7ed-9510-4868-e060-08daa64d88a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6380
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
Cc: mwen@igalia.com, bhawanpreet.lakha@amd.com, Alex Hung <alex.hung@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A struct is defined for 3D LUT modes to be supported by hardware.
The elements includes lut_isze, lut_stride, bit_depth, color_format
and flags.

Note: A patchset "IGT tests for pre-blending 3D LUT interfaces" for this
proposal is sent to IGT mailing list.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 include/uapi/drm/drm_mode.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index d0ce48d2e732..334e8a9b49cc 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -877,6 +877,23 @@ struct drm_color_lut_ext {
 	__u64 reserved;
 };
 
+/*
+ * struct drm_mode_3dlut_mode - 3D LUT mode information.
+ * @lut_size: number of valid points on every dimension of 3D LUT.
+ * @lut_stride: number of points on every dimension of 3D LUT.
+ * @bit_depth: number of bits of RGB. If color_mode defines entries with higher
+ *             bit_depth the least significant bits will be truncated.
+ * @color_format: fourcc values, ex. DRM_FORMAT_XRGB16161616 or DRM_FORMAT_XBGR16161616.
+ * @flags: flags for hardware-sepcific features
+ */
+struct drm_mode_3dlut_mode {
+	__u16 lut_size;
+	__u16 lut_stride[3];
+	__u16 bit_depth;
+	__u32 color_format;
+	__u32 flags;
+};
+
 #define DRM_MODE_PAGE_FLIP_EVENT 0x01
 #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
 #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
-- 
2.37.3

