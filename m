Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FCA7E5B65
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9426610E7E1;
	Wed,  8 Nov 2023 16:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4579910E7C6;
 Wed,  8 Nov 2023 16:38:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2uAvEJnu2RsS3LrlS8k9DYrpl0Px3o6v2U6rTWcqHy/DnCdh4RSciGzGdkB4HFGuLSrrfPiSJkF66Odcm/oQlW/1n5gubb3K8tcl5+hchLpqEpNtVIjbCw0hFLySMI5S79MqrTtgd6v5p7Fk7xywoIlXbt7PwPv41t89sH0iJ/77yhPRa0sMYhQA2ZDzDD4BRXP57HjKzmBwleXGSMjBhsbQloiSfzePlI5posns6TflGiyjCCOBs8UdABcLRtnzleoeTjfHTfG+j6pAQLQxwEOBjVSe+HJE08wsY031o2XL48hrcMbcgNIhQkwcbvd2VJKrB7cyicLDjEcGZ/WBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kf6SC2HbfE39nuOyJ2qSlAfZ+t1NrdCzXqxfMedkrR8=;
 b=PG+ypzBV2iSyIfGWfVEwSNeLJFeUOYfnCiTH4OK6pyTyYGP2TrU8asXgd/clyNfKw4aYJ/GN+QMWfRA8sIR9aL/Nq4xnURZEdt/FT5gXnxlopiSDvlRMI4FXcP0hSgxLj5Ww8d00rsLVMcD5phDoLbbO8Qp/9M+5Hqtph2/oul3c3TMJoNCS0Njetxle5RGrwkqc8G4hzPpIO4cKoiW8wWCBUn1n8vIpZOEygqxODej23fw7QoG0FqIEu9JZ+0hFYHxtKFwqTnz54H5S9MMib5M+3WuxCBPyIVFmQ1Ni0clXzAkgBuAdPzq6IpCRL9yfMiEs45YeS9C8Vh2r9F0zfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kf6SC2HbfE39nuOyJ2qSlAfZ+t1NrdCzXqxfMedkrR8=;
 b=PD9biav6KB9uv+k4u9qqpG1KrzpmNv+ARNT/srUfDLN/u83SGIckT5lRwrImzCq2RYn3fJTKJtl1u3piutX6RGChZnxxW7IZHkcxucOb00KVN6HllqTQHQDSi6nTVDLqn6qy/b51q5BjTNoxC93IOCWv+LPqUDoYFnJKHpwtetw=
Received: from CY5PR22CA0054.namprd22.prod.outlook.com (2603:10b6:930:1d::18)
 by DM4PR12MB5722.namprd12.prod.outlook.com (2603:10b6:8:5d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 16:38:01 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:930:1d:cafe::1c) by CY5PR22CA0054.outlook.office365.com
 (2603:10b6:930:1d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 16:38:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:38:01 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:55 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:55 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 16/23] drm/vkms: Add kunit tests for linear and sRGB
 LUTs
Date: Wed, 8 Nov 2023 11:36:35 -0500
Message-ID: <20231108163647.106853-17-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|DM4PR12MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f377a5-cccd-4878-0124-08dbe07912e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7ZcLtrg+X8W0i650Cu8zOlRHAfIbP6VuhY6gWu0E4AtOBvi9SnuhxYafU53FfTCFyrHi8YHZ4lDXxsxeHwO5FsOPJVM/krH5auZ/9hC+nRvqNCqYEQecgAMo4h/gYMYP/vMXVVZilz0q2kUh4IP9/kM/XW3QpvNCyTtk+9Ay9wbABygYXiiNf7RXNWUpgAMfzizgT2IVicfe7g19TUMZ/dty8qKdSsXQJDsyIaaKGtDb+MBGl9oTQqt/BN7ypVrEqwhVd7gsDg6QRvB/lEX/jKloF0FpEuoBe/9jIZNe44RLv0Ht796nYX30J1LucEADweGHSuxhxxTL8vf3NCwndytMa239T1TE3jf/Kg+QgDSrFqJzziYLYfdjRikPVgqO074Lup/5P22MgSPwF6m6S9P+Gi6/XZTQRkTVYpOdXDNRB2Qbmu8kXJ9wa4rpIBu5TvuEQxd14hcSSZya2WQQzOsFmSkWWPGWn+ywfxVEfMBelK/OXOLKiiTpPtDZLY0+PTgZNpGugKPj4DJL35lqbCgAjXwaqZ8+W/+lvnGwMwR9myau2yyVD3yXJlJV/BSYWPgkj2r89J51gDHokr2GIdRtpNiZ4DZDTYkJ07pOc2WMtgSX0btxoOxbe1eNRBMY4fOmQhs5fKgJuLePXCXUBuGhTvEdRpHIJrcoZxTtWfHZZ7IAWF847y1XIqlMok1NSMcluAGd1yKyLKne/ysc2sSr9nLgxdZ+WTbC/vmS+0sADsyNAdE8ezxx1XysdBpTpxWU8GWQ9wXdEZDdHVbGcQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(82310400011)(40470700004)(46966006)(36840700001)(40460700003)(426003)(336012)(81166007)(83380400001)(82740400003)(26005)(2616005)(6666004)(1076003)(54906003)(478600001)(316002)(6916009)(70206006)(450100002)(4326008)(70586007)(36756003)(8676002)(8936002)(2906002)(36860700001)(5660300002)(41300700001)(44832011)(86362001)(356005)(47076005)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:38:01.4454 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f377a5-cccd-4878-0124-08dbe07912e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5722
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
Cc: wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 37 ++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
index b995114cf6b8..ad4c2f72fd1e 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
@@ -31,7 +31,6 @@ const struct vkms_color_lut test_linear_lut = {
 	.channel_value2index_ratio = 0xf000fll
 };
 
-
 static void vkms_color_test_get_lut_index(struct kunit *test)
 {
 	int i;
@@ -40,6 +39,19 @@ static void vkms_color_test_get_lut_index(struct kunit *test)
 
 	for (i = 0; i < TEST_LUT_SIZE; i++)
 		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&test_linear_lut, test_linear_array[i].red)), i);
+
+	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&srgb_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x101)), 0x1);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x202)), 0x2);
+
+	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&srgb_inv_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x101)), 0x1);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x202)), 0x2);
+
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0xfefe)), 0xfe);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0xffff)), 0xff);
 }
 
 static void vkms_color_test_lerp(struct kunit *test)
@@ -47,9 +59,32 @@ static void vkms_color_test_lerp(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, 0x80000000), 0x8);
 }
 
+static void vkms_color_test_linear(struct kunit *test)
+{
+	for (int i = 0; i < LUT_SIZE; i++) {
+		int linear = apply_lut_to_channel_value(&linear_eotf, i * 0x101, LUT_RED);
+		KUNIT_EXPECT_EQ(test, DIV_ROUND_CLOSEST(linear, 0x101), i);
+	}
+}
+
+static void vkms_color_srgb_inv_srgb(struct kunit *test)
+{
+	u16 srgb, final;
+
+	for (int i = 0; i < LUT_SIZE; i++) {
+		srgb = apply_lut_to_channel_value(&srgb_eotf, i * 0x101, LUT_RED);
+		final = apply_lut_to_channel_value(&srgb_inv_eotf, srgb, LUT_RED);
+
+		KUNIT_EXPECT_GE(test, final / 0x101, i-1);
+		KUNIT_EXPECT_LE(test, final / 0x101, i+1);
+	}
+}
+
 static struct kunit_case vkms_color_test_cases[] = {
 	KUNIT_CASE(vkms_color_test_get_lut_index),
 	KUNIT_CASE(vkms_color_test_lerp),
+	KUNIT_CASE(vkms_color_test_linear),
+	KUNIT_CASE(vkms_color_srgb_inv_srgb),
 	{}
 };
 
-- 
2.42.1

