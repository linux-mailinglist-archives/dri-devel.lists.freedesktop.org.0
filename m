Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8D37CD4F2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 09:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E77010E399;
	Wed, 18 Oct 2023 07:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::610])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F87210E394;
 Wed, 18 Oct 2023 07:04:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQQj0p4LV4QpA69+ywFA+voVlTI4WPQj+tEXnVK7gIsLN+RiN7ep3UyqJnQypQgHqjCS/Z654hGkBmRgl/ReLGgvVuMf4XRvIpx3sbXg5VReBasjUOlmMC5nnq7/DwNj4wp+lYVikcKiI3gpLjxyjg1wKFkecIPQsbYPnQe/CHA6PwEnvfnUFskvTNWLDWnJfyJRdC5Jc/gntF8c+ffQC2hVFkdPal3r8eGkRoZSeWFjFwu4Ps++l4fkFcxY7jkVfR3YLEQIueDMtPFQ1lRsCd/bS6KUdKzmkEuo6s4x/ZTc0L47+eHgyXObMV/pYxYGAZkJdAsbvZgz4m+xYotKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/YbupjGoS/lgXiknOa+geJjoTcviN3AVo7Z56beCcE=;
 b=OQazrWA44XrccgeL8kv0GOX36EGdnHKeDREENmFsCNIDGj6b4BsCxTWEdZDtIpyqK1SlANAaNAsnFUTl+eBPxsX9NC3mUW5eebuTZuVb3/zNvKePuoVIhhUXK7IkVxvrToEw1knJqR2omhwLO5IL6tHGaxrPLMMGU8yeinlVEhl47mnGeAbBpANdXiCos+j/QiXD99I7kuj+GGh1IYmMVYAqDmd7lsipOigfrGB+7kZcgoRr+6gkuPSppSVVsmyL2koNDV2G+euVi8wg0pL8a/LIv3g0Kl7bZhpYeym4rT1TxCKJGY8mFyE1KoqSX27ZWLlOjQPZJTJbLJqeqoKUVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/YbupjGoS/lgXiknOa+geJjoTcviN3AVo7Z56beCcE=;
 b=nah/M899YXbtfJByiLd+sluvBXiGEGMaDKnhvT0WUv/lTE2exhkex6yJO7Kdd3tWulix4aeBixYy5fb5uWUQvUQXS+QXsXv/STUF1EvtsY+Cw/01MDo6/E8+G6c4KV1l1BNFE9AmpY9avCcxxhWizQx5ft39rA/EJG7qNJ9vGDU=
Received: from CH2PR08CA0025.namprd08.prod.outlook.com (2603:10b6:610:5a::35)
 by MN0PR12MB6175.namprd12.prod.outlook.com (2603:10b6:208:3c4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 07:04:36 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::6f) by CH2PR08CA0025.outlook.office365.com
 (2603:10b6:610:5a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Wed, 18 Oct 2023 07:04:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 07:04:36 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 02:04:30 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v4 05/17] platform/x86/amd/pmf: change amd_pmf_init_features()
 call sequence
Date: Wed, 18 Oct 2023 12:32:29 +0530
Message-ID: <20231018070241.2041529-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|MN0PR12MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: ea69804e-12b8-4422-d694-08dbcfa87d01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JBNyQdYaYakuF0XqqCdY58mGryOhTQ24S384xe3PeLCy10BRHmULdn+JC/2ZooYm7UY5l+cF+9R7NtMWrT5Wh0a0e82XUt0YN2fWdsOsrmpwTQdjUfHNGGBTaVZ9Id/CHfbhtSP0sI4BmJvwSjXvxYJuj3zA3OgjlRFuIgG4jgNPH42fJRIbRUJ+QqydEso+LbqQpU4Pciv9EgTvgNbP7o0/ZCGTVIpF+Y2XyWwwekffuwFmgaHQfFtpOEJ289xHM+KVStHo5wYJOE1FJDcuk4r5ivNU1Ta7Ht9UjoJJFeBPodw5tY4wQnG2zEKuipRtI3gueZsV5eB5HpVT8LsrLGLEysCiufEbjJRrIn56RnEa1KdyA27Od2eiYdUXCVwZuGxQO+LCSzbe96Q9t6VIBRlhti9NRoqG7QhUV6qJoH7lhYk1FgZ7+KxQ2qLSlRcjd05R3z1UM7me68uuejbGAysVd1zvlP8V1gmq0IWWsDTi4CqcPPBewtvLMXPB6a6cxqXRNpQOJ02U3nM6mzBEmyiWDBf1onZstotCFsHmROsd5kaosVrII21WYk7Lgtj82oif8edeE9O8petgBbE1qo22d8GPgqJ9ECQuHZqpxBrZOCyf41lBKLsBK8MD93/thwNg3BkLqYjGBCbftcML0+po6W+M+6/sLoIFs7bzAiMQfTAjMpOpZou/BeTgHwH+TfFDF0/xEASNS/I8TSR/ZMf3Efe01emJ3/uJaQdRW2+cR854zt77GhAm4A8gUa7fKtQIPAZ0qGOq7vCxCRLNXb4e2cIvV0Yz5IRcewQB5T8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799009)(46966006)(36840700001)(40470700004)(40460700003)(2616005)(1076003)(26005)(7696005)(16526019)(8936002)(426003)(336012)(83380400001)(41300700001)(7416002)(5660300002)(4326008)(8676002)(47076005)(2906002)(36860700001)(70206006)(70586007)(478600001)(316002)(54906003)(110136005)(81166007)(82740400003)(356005)(921005)(86362001)(36756003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 07:04:36.0847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea69804e-12b8-4422-d694-08dbcfa87d01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6175
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

To sideload pmf policy binaries, the Smart PC Solution Builder provides a
debugfs file called "update_policy"; that gets created under a new debugfs
directory called "pb" and this new directory has to be associated with
existing parent directory for PMF driver called "amd_pmf".

In the current code structure, amd_pmf_dbgfs_register() is called after
amd_pmf_init_features(). This will not help when the Smart PC builder
feature has to be assoicated to the parent directory.

Hence change the order of amd_pmf_dbgfs_register() and call it before
amd_pmf_init_features() so that when the Smart PC init happens, it has the
parent debugfs directory to get itself hooked.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index c8f6ec4c2e2c..4b8156033fa6 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -442,9 +442,9 @@ static int amd_pmf_probe(struct platform_device *pdev)
 
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
+	amd_pmf_dbgfs_register(dev);
 	amd_pmf_init_features(dev);
 	apmf_install_handler(dev);
-	amd_pmf_dbgfs_register(dev);
 
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
-- 
2.25.1

