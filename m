Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E567CD51C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 09:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7484010E3A5;
	Wed, 18 Oct 2023 07:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD99B10E3A5;
 Wed, 18 Oct 2023 07:05:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3/liThR46bp1tsAS0ro+GLK/3AjPI5h/WHMqtbiYJLrxaqbRB95eLDkgY6KKvw8JpA3/TGI4d3DuJXA1X1DOIG7aKcB1GD8zCA7hNMJyqWH7PmkpHZuXIlM4kmzqOdU6OWrdzB56/SqAN4pjYJoZ6pakzd5td9OTnN5f0UGrYogOHMLXKengST/kg1LVKRoSvIQXusWW/baXXH/eSZbiEbdQXB1yO1JGFyxl1505fm2tNuw03ZJA/Ou+2PITD3qJTV1p6ZTlu0wp9L+eFa5D/kZgJnA7xcT8kyD1gHjQAqE3gS+O955TV5EDusd/+IO/s/7Z51apGfsvO+CmNi1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHp3TdCunsFu2okfyF3kzl9IEonGNelw3Q8a/BT3lsY=;
 b=gNr6LMgGNtMzuu3ge72hCy4UbIlSJM1Le5jJUStpFWCGKJg7un5gz1xnbQpIc3PcGRlE5/hiEBQ231AOCbuNP36MA7m/WOCAYlOSVg8WVKUV3Ysfnvs/GQaLDjd8LxBScOpKz32hZdjBqgUqfccFWGThRsaqbsoc7ZYr6eofbQiTDguMP9QvoRtZdOgPJMDVhNdE0YbgslcrogySGG4K0+06dsNm+B04QyOY/gSjWaCiJJSlQhAWulIUPU2m1R+pBH7fREWlfl8iq+qOEcrPCch2TgfRekBEZ4h5i9aOdgIiSXHTK6Iefb131c43vrhyK5eG2Zd0Pg68AKVVGA61kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHp3TdCunsFu2okfyF3kzl9IEonGNelw3Q8a/BT3lsY=;
 b=qifyOq68T902N+uDuoWI554Ebp6WDi9n3HIrk4tT3uJVqyI62wjTfv+sAeryck+PE3O9fERc8n442L/+otKTHuQuE91vbWDSTbtEHm6v5tCByxIrP0muxO/N245T2iRZZWdZ8vgN8dn90eIH2BXr52tJT1ZP05nvIjlzKqNlqnA=
Received: from SA1P222CA0113.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::27)
 by IA1PR12MB6554.namprd12.prod.outlook.com (2603:10b6:208:3a2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 07:05:40 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:806:3c5:cafe::39) by SA1P222CA0113.outlook.office365.com
 (2603:10b6:806:3c5::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Wed, 18 Oct 2023 07:05:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 07:05:39 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 02:05:24 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v4 12/17] platform/x86/amd/pmf: dump policy binary data
Date: Wed, 18 Oct 2023 12:32:36 +0530
Message-ID: <20231018070241.2041529-13-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|IA1PR12MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: a062e01f-42b4-4ea1-71c1-08dbcfa8a2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h/E+raNnjGMwy0RRgZ/Wb7sxZp9mwQc7I7e0mRigaXlNCYSqIUZSTZhpO4T5luFpZF6MykiSfGTX3bXOHWVhwgvX0el59Kr1PxbBL48F09OJwaRS0J8AzBZcn9MZ2GmhJbXNdcmSar+DEehXpTIu9YTXW9xYVgijeive+SiyV5UE4gztOiWibgz9t7gIXfgG4kVp7LVcM9mnsVZ8OOHckqojvc+fqXFr42+ycOuKNSYTCyhXcixGdggxTJgRtmkkdWTzkI/WOk85M8BvXxwcPl9qrP/uaBimdIfUiC7ZVCPkPkTkBo4izsBI83OwYIBTbHxzZhgfqQT/HfvcLBVcfGlwezYhyVul/g5PlaLEh7/VGosKj6K/ah8aInv93jict8GAr3zKaXbegfU/NEwHmWgAS6BMHMUL72k+arIxLoFbU1gpcNtrEWQkbM8vjcxH8aAJo7RNG3Ujw3qjVrayHKPeNu72EdUftShJTDkGA4e0TShb4h7nUPRvrZR27eJo4do0ZPrU1vMyQFJkb9J1ZrEDQUAISJ8Mlu35Id3RNbttTL371QNz2VK1e6By0XrcFn0mGSJrU/6M2QQDrGK2nFSG/+VFdF97gNAecyjHuMykqdkByUlvxTS9ZfeI6zS5n/rJwllzAwFAr0CDZnlBsfYrccl7tpGqsrzcZhBp9xs575eAeI17FAp7rAw/ABITDbD3IQNBz6Spa5YydVfirdSf4EqDA4B2mBtQNiCS9njF1fHiIeGR9hVbxQTnHq7hYsrXMnnfjyAR0//2bkmjR7w8hVcCGZcXrF+I5c27W+s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(1800799009)(451199024)(186009)(82310400011)(64100799003)(36840700001)(40470700004)(46966006)(7416002)(6666004)(2906002)(7696005)(5660300002)(8936002)(4326008)(8676002)(41300700001)(70206006)(70586007)(54906003)(110136005)(40460700003)(316002)(478600001)(336012)(26005)(1076003)(2616005)(47076005)(40480700001)(16526019)(82740400003)(426003)(36756003)(36860700001)(921005)(81166007)(356005)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 07:05:39.7972 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a062e01f-42b4-4ea1-71c1-08dbcfa8a2f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6554
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

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 6c4ce22ba518..2f5fb8623c20 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -276,6 +276,12 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
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
@@ -290,6 +296,7 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
 	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
 		return -EFAULT;
 
+	amd_pmf_hex_dump_pb(dev);
 	ret = amd_pmf_start_policy_engine(dev);
 	if (ret)
 		return -EINVAL;
@@ -328,6 +335,7 @@ static int amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
 }
 
 static void amd_pmf_remove_pb(struct amd_pmf_dev *dev) {}
+static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev) {}
 #endif
 
 static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
@@ -342,6 +350,7 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
 
 	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
 
+	amd_pmf_hex_dump_pb(dev);
 	if (pb_side_load)
 		amd_pmf_open_pb(dev, dev->dbgfs_dir);
 
-- 
2.25.1

