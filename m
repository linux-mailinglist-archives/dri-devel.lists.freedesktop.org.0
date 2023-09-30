Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44557B3F64
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 10:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9270C10E1DF;
	Sat, 30 Sep 2023 08:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF2D10E1D3;
 Sat, 30 Sep 2023 08:39:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ds9l38xxC/PS7PcU4xAqbIB2QPaVWd1CYEwgRW4hjukliDo54JIsc9NRmqiWKQHyWs0233IzaWgK/B3PHvlO105oprDLWkW2q23xEh17Z8S1Lc2Bajjl3M52nbN3vehtVePvMFDoEhHpdKEV2Ngsr310UOB3qy1wL3EMmHIamS3SD/bSWFUAfajR+nppYw8yUnt0f+wEBgweX5bCwBTV2ofrl3fw8R/u37R6lrMtac7ALf6YozMxHR/MelNEBGJsd/KC68Dy1H4Gedy7Wv7UQjR780l4MVIdOx2teNNIHDE7GYUkWVk400xQTZce5GLio8bRHAkFbuPHpUvyjHW2qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iW8uPcfL5rjtduGeUbEp+Tm2YhE6J6dvo5DGpOaQlk0=;
 b=bzeguezKZzOjQOfQoaAdIBHtgVVvSIrfzYwdsIUV+K+PbfjJYtPq6z1VPXHTyJmOJACOcx42V6I2eHuwXyR70JOlF7UxutjBkNNEIQSyYYisvZmUFTb+MXm9P8Bo3L/CbFXEGQ9pKhRN6NdSKbZQ1yceGJm7kDtVc0iPvtImhSuT9HPoNx3Kd5zhHWdN3Xkgl8kqGe47dOzUiPq5pnTcmqS6yTmLn3/p6Top/quha0tygm2PDxPLl2+vcRDXj6SW6WMPimJK6ins6y/lkQbnf68UFdEtShcFD5PymcTGdLj87fJXh0/uxCwD8kRkkhgmsrAEJwh1/yR/O28Y72ZTZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iW8uPcfL5rjtduGeUbEp+Tm2YhE6J6dvo5DGpOaQlk0=;
 b=WZEungcmYRRljRrkjiFq6SXMMSq1vWnmG71SPeYi2HfHiPv8TlVA9VRDeQ+h4hxKLrSpKytsIpTvbSH7T5vpazohRbQahJaJD5/ZhuQ01iG5hqTSoozhB7whbh7jMF4ei4i8KRLdmKHPV+Du7EXe4yAyxoVQd/Hcv+3U92743wQ=
Received: from MN2PR04CA0018.namprd04.prod.outlook.com (2603:10b6:208:d4::31)
 by PH7PR12MB7427.namprd12.prod.outlook.com (2603:10b6:510:202::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Sat, 30 Sep
 2023 08:39:19 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:d4:cafe::86) by MN2PR04CA0018.outlook.office365.com
 (2603:10b6:208:d4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Sat, 30 Sep 2023 08:39:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sat, 30 Sep 2023 08:39:19 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 30 Sep
 2023 03:39:14 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2 11/16] platform/x86/amd/pmf: dump policy binary data
Date: Sat, 30 Sep 2023 14:07:10 +0530
Message-ID: <20230930083715.2050863-12-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|PH7PR12MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: 7baa6db3-5b76-4e8a-af20-08dbc190bcfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UqFLrWfId2aqkoX4Eq+xxj8f7BDN2sLH6mWrBwTmY5DBa+m2dyFKMxr2kpkGCethu6K1ggINg9frgA2gygy24S41PyPXcMrRFjEia2KkuIhHYXs4ail/rnrQMEr0rgO+Z3/D7EyYNIRUIH+EvYuZTao80phqYwc9f+f07B+lnd+uveDu/X9hJxmvRDec8aYwNNYG6Z4rVNypUJCG/XFilDUlrjgSvLfuwsNK9KVzF0P9iZpKIoakoLdvH+/tUTyJvJlGzKpHOHlPB/gyFs6PdkUy58jbfJF3lWJzmgPlG/5Y6mu5cLLwq5ZNsHIi+pApPATbP48OyWVhfNP2Vo69zwdSU7cUGnkHhuPLxrk9lJPd7uUU+tkXS5IS+RPjzDM/BCfigmE9BGc8DJTRvYEpwQ2IZoiNS41oUeI367MLRNsOe0fQ8+0Fun+70kzPwWRSaxm6OcbvpUb2JAE9HsS/zNxo/ITzNbjM/4wPxATCLbHw+mWHyAGQUqzYx7s0PfxydR8Z40hPm0hfrv+pwq3/gx3jHgyc255SY/tSXFWnrulyRc2W2EyteVPH38QXl30fr5VtBq2K+AZycnaYnpRjqUAzgIfMCDRnGsZDqOkX5OcWRSz3Ibusp3GZPBUb1pqvlPggAB2qolJC9Vp/KU4pisThoLjFe7uye/RdD5tDppwXHD3TzSMF/q1dpEhTH5oZrMBJeJBCuc4VGn7UOG8qQ53SfM+8OwJukK4DjQV28ZFME3T1+8iFbAT0uw85TWJWn8QdjI2o055BNRkSus16p1XJB4SNS4MllBNFTj/WNE0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(82310400011)(186009)(1800799009)(64100799003)(451199024)(46966006)(36840700001)(40470700004)(40460700003)(8936002)(4326008)(2906002)(86362001)(26005)(1076003)(2616005)(16526019)(7696005)(7416002)(36756003)(6666004)(336012)(47076005)(36860700001)(81166007)(82740400003)(356005)(426003)(921005)(40480700001)(478600001)(8676002)(5660300002)(70586007)(70206006)(110136005)(54906003)(316002)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 08:39:19.2585 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7baa6db3-5b76-4e8a-af20-08dbc190bcfa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7427
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
 drivers/platform/x86/amd/pmf/tee-if.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 01f974b55a6a..d16bdecfd43a 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -290,6 +290,9 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
 	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
 		return -EFAULT;
 
+	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
+			     dev->policy_sz, false);
+
 	ret = amd_pmf_start_policy_engine(dev);
 	if (ret)
 		return -EINVAL;
@@ -341,6 +344,10 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
 		return -ENOMEM;
 
 	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
+#ifdef CONFIG_AMD_PMF_DEBUG
+	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
+			     dev->policy_sz, false);
+#endif
 
 	if (pb_side_load)
 		amd_pmf_open_pb(dev, dev->dbgfs_dir);
-- 
2.25.1

