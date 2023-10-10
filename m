Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E35077BFC4C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D8B10E35C;
	Tue, 10 Oct 2023 13:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333F710E35C;
 Tue, 10 Oct 2023 13:00:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WntBXnu9vGJKp2Ifs+2y0Bc4W9EXsdXdI1ml/nEoHRsDxaIxL+2EqNC0HNqjcArdRp6uFMPgwRfwfn2RRiBcEkCKcu134xK/PPyVK5NttjP8BmJuPLhX4x5Kjzsk5VG6tcdhKf06y1GVSqvTFK8jcU+xEVT9NkylCHXSkyWqL9Pwf50ht21NRO5ijYi69sk+Hco85VnBm+UnqUgM3xwvzHVPU1PddrBu6qnQ/JjBMTV5WbKvpCjx5MlDfgJPva3GgNkK5jpfvzF7Jrt2k/pK9ydDrKwwDOpEvVRhAZp8ftkidojKdv4S+qv3wsPVyF3JNMSH+HiOhL3aMbjJ+EbZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRwSc66OrM7y5x4q5PRrYc1C+J4YRBCXgJYNNPHQfrI=;
 b=TNI2HToC9MYwbtVDY+eNAQ8euOwt9kWC3rmre3lkP9O1YrJ0qvx1D1AtdRw+y5YQG+3jffovG/mkn8y0ziRwirt/fq8GUPKHBy6g7Z7ulFkHW2lsBBQYpAWZc1ohOWA09JLhNLX6To3bbwal7LJ4PjUMFu+RQTMoVar0t0+iVNMGzcNOXidXihJYsUAgW7gP/6CTUPXVgd1+gSXXSxlwROu028RS1dlHZPjgW1FxEgphdjO6XPMstoj1d3PdxGOpFNMgtwIqQ7T8SkXdeUZnywfUKmKQ74Mp5Sgm7F5K4DoPk3QMQ4N4Zkzlcon8PN1q9xXGI+bU5hpSA3kqUqhbwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRwSc66OrM7y5x4q5PRrYc1C+J4YRBCXgJYNNPHQfrI=;
 b=OSBIGgSYRF/HGby54EzW5fACpI1/M3Utr8TIBVWsA5tsWIBKNOwBSxJe2qjmoeLcwFry/7sLBHWp95ZZz5aQQNuIhuIw45Q4aP3D5/IPcRKXnbxoF2EhXRwtH1+7Vcx538W/OWCPswmKTxleIHFS8eL8xazBRmf4AOy2U6UkRug=
Received: from DM6PR04CA0024.namprd04.prod.outlook.com (2603:10b6:5:334::29)
 by MN2PR12MB4502.namprd12.prod.outlook.com (2603:10b6:208:263::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 13:00:47 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::ea) by DM6PR04CA0024.outlook.office365.com
 (2603:10b6:5:334::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30 via Frontend
 Transport; Tue, 10 Oct 2023 13:00:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 13:00:47 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 08:00:42 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v3 11/16] platform/x86/amd/pmf: dump policy binary data
Date: Tue, 10 Oct 2023 18:29:12 +0530
Message-ID: <20231010125917.138225-12-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|MN2PR12MB4502:EE_
X-MS-Office365-Filtering-Correlation-Id: 23b35d4d-b3e1-40b1-5954-08dbc990ec11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AZCtQHF/3+9xpLlti8jXGcIqzwa/08F9v23Zj4oZdNNGoo1BsnfDhGb/IwWryAjbNmoOb/1S6WRig0Uo5YYO/aDjgOxaZhFs7ULUBkS2YozHbx+MaU1pVRpxvthW1O8MJ10lo9nyoknhaUK4CtfIEO5iHXm86zZ0VjJGgpfmcYM0QhIkRpSdkh0wTYIehiIzrJM4CZJ5jLMvtTD4yPwgj/FOwf6t1OUDicWH0hA5cvhRyHNL9zgHQ6O4mSyb8Oi/zBZfnx8MOE9C/SreL/Vg2U/4S8MOUySpkVChvOmB2jV59mUbr/Ko9+H8R3pHlGxN16ovuGqQx+fRpE2DcEtf7qIlMFu5Am/MmRxd8/38YLKbgI02uaZx1ETLFX5POkz3AU0BsEwVd0mq8h3m1UGD7sJunCbnRW4xF1tgskKFgCXxsSeVRZonWcRohYu5l2yVXxzMFfvIJYbbI/N1n0o8v8wW9TVsNAI2aU5XdIkay1KJDO/+MPfa5uLHIPTd2r1G9U4nC+k4ltNWseBOHn0GIkdfXE+f/azlkAjzHSshVS8ts+CU0i8q0R8O0l0JEDNkbUeDgdA2cUZyZAqDrREDyn+c+2OAuVn7AJ0N86XU5DxpTUxsfy8GGnf8aDkA4G1VWhfn0Zb6DJpnWQacMgUniEheGxINvzJ/Sr7HTeVzvXdUCMEyQ9/gHsu/1ZGldJhSFgLCrdfu/6lwB7yE+FBK/Y0hE4xSNTPifSCRpKd1ecKPCnoWalK1qvyrtHsjbijLO7Jpq2fI8C9e62PrCtyRBBwyyDaiP0+pfrNK52jL23A=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(451199024)(82310400011)(1800799009)(64100799003)(186009)(36840700001)(46966006)(40470700004)(40460700003)(7416002)(86362001)(47076005)(2906002)(36860700001)(921005)(81166007)(356005)(82740400003)(40480700001)(70206006)(70586007)(54906003)(110136005)(7696005)(316002)(26005)(1076003)(2616005)(478600001)(16526019)(36756003)(6666004)(41300700001)(5660300002)(8936002)(8676002)(4326008)(336012)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:00:47.5309 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b35d4d-b3e1-40b1-5954-08dbc990ec11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4502
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
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Patil.Reddy@amd.com, linux-input@vger.kernel.org, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sometimes policy binary retrieved from the BIOS maybe incorrect that can
end up in failing to enable the Smart PC solution feature.

Use print_hex_dump_debug() to dump the policy binary in hex, so that we
debug the issues related to the binary even before sending that to TA.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 994daf945795..e4386f503ad0 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -275,6 +275,12 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 }
 
 #ifdef CONFIG_AMD_PMF_DEBUG
+static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev)
+{
+	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
+			     dev->policy_sz, false);
+}
+
 static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
 				   size_t length, loff_t *pos)
 {
@@ -289,6 +295,7 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
 	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
 		return -EFAULT;
 
+	amd_pmf_hex_dump_pb(dev);
 	ret = amd_pmf_start_policy_engine(dev);
 	if (ret)
 		return -EINVAL;
@@ -327,6 +334,7 @@ static int amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
 }
 
 static void amd_pmf_remove_pb(struct amd_pmf_dev *dev) {}
+static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev) {}
 #endif
 
 static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
@@ -341,6 +349,7 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
 
 	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
 
+	amd_pmf_hex_dump_pb(dev);
 	if (pb_side_load)
 		amd_pmf_open_pb(dev, dev->dbgfs_dir);
 
-- 
2.25.1

