Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8FB7B3F4A
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 10:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7015510E1C2;
	Sat, 30 Sep 2023 08:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A92010E1C4;
 Sat, 30 Sep 2023 08:38:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCczof1kQ4EJz0chhKt8FZJ3mqt4Tztffi7WsJ1yELhTjdzJpohfqej17SO4rHAZeMaRhtjelM6eC2i8K3uLUD9JPiFh/LmWWSAz/2pvasndEjoG3dLxa7V1qLRtar1GR5zsWHpzfWmW5x1I2epOSBUUNJfbmAeE2BuGRKC3zIB14nxE5x5yBW10Z9afpB4gFhyTaK4fwrH+IACDEgijXN+q2PgzLhWAtQVVSFAYTpbmiRYDMaAmGc7lS19R+nz1Y0R/KlunBBBWXY57OpnF9KpEn/Kgxvi4CknApih+erkJZ9tNJ622UYpQMUQmdCSQnZemLOS8MualGsDWtlA6HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qZsydZKHbXMZHeYccoWih7jFXNn3p6Li7qH7v1jYHs=;
 b=hoK79b6OBUvtfL/RVJ7KD0IpgqJvs/O0CYzr50kiNFAZnjBi3PZX/VZDC8JS9Pho7ZHvWqErZehKHD0Sp8nzr8FySoEz2UUtkioxQi2iNMh0PET+cVFdP8RVhycGeo81xf6OVJmHUkGZeZg3FEJlahCBaI1YAhwjHoQBMY2JXgrlw/HEoHoMvohp3kkUryeXp9lyhdmjdbQ7sFUr7Dcz4ZhrIRnOnnS7E85WmFxxVzlGV8e46qv016BToJS6K11+sGF3ltGmi/qb1FEDeLqr43L0GHmKbkJgoVocvU9BHWORPmH23jgfEMZjbQIOCeVfMtRi7EBEStdMHuL3b1Cf9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qZsydZKHbXMZHeYccoWih7jFXNn3p6Li7qH7v1jYHs=;
 b=CKH6FTt44TzfnMW7QCq2n9pDM9hWUg7OnFByflCIQ9o+CpPTXTrE9w4lxvkI/Q9O7DLyUYt0Ym7GPz+rAVaJSd1Dh953aGs+v8UrwcCPKlJqOqh82UTsiodvgUFUDJAXUkG4fZBdiPxRviHfCB+th1E2DIIPQJ3L55IUOCcXK18=
Received: from MN2PR07CA0009.namprd07.prod.outlook.com (2603:10b6:208:1a0::19)
 by DS0PR12MB8218.namprd12.prod.outlook.com (2603:10b6:8:f2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Sat, 30 Sep
 2023 08:38:50 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::71) by MN2PR07CA0009.outlook.office365.com
 (2603:10b6:208:1a0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29 via Frontend
 Transport; Sat, 30 Sep 2023 08:38:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sat, 30 Sep 2023 08:38:50 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 30 Sep
 2023 03:38:45 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2 05/16] platform/x86/amd/pmf: change amd_pmf_init_features()
 call sequence
Date: Sat, 30 Sep 2023 14:07:04 +0530
Message-ID: <20230930083715.2050863-6-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|DS0PR12MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a409e8a-bd2b-464a-9c22-08dbc190ab9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0fleaQFW0oGjaipTYjqFaoLcRXR2+Xs7SYSGaHmeN/cVm/EdKMtFP1L7ZC0zQ5dWdPjr1W1INk+6bylThC/IAKcm10fiPa3Zeb8aE8VlllXO3Gkizb4WZJZkEEeX0Hn04Fg3jH27+4JTbKT4Cy9UB+Xdwe+XOftvLiGwTNM5qbKQmDj2Gw4VukKhpDcQONvR/rxYp578fIGTeUgfzcS13Pgj3exSeB1a6/rpNe2/UdHWGxTGo/APh+kK3CgeK1wEtdTpxmE0iFpfTIs3Z0msKZ0xkc7MoOl3FHXNagSsbl4cYcC4396C9Pn2LSeruCIQi6n3oqxeG3sM3rFqWsTSoS7NZGecmmoMqsZCMwT2lifzcAPCukfk21VEZS6uQwIvKeFJ2xUOsvMWGAu+mLyWZMo2uWEKrRAi2ZFBi4HRUGgRtWni/vTaJn9itGSQOzligEAlpNz5ziQ9nO+7Q6podhBCN8AoerH3Tw98iWWxrEzkbFrdG2Ald8X/IIOhWyH8YYb5FCIfZIs+SJJExuxMVykUrDm5BgfduVt0LFlpVZ1HrPkG2zIuRRPKVZRE/CHC3LzAxH9UEM/SoejNT7uSIS/CzlWCJGyD3edqqS0lw1rRakyXALrQNaRVRcufAtB3cigB8hc3rBnj1IqbT4a+/L1X/+fYMp4uMpC6SPiSa1QikGCJS5crfNfx4/8VsCgYYsbGmqB4BUErdr13pdTHeWfyYeO3ahZehzAwaMK+RCS2YweSnkY2qau2sc2omQzS5kYbhdgeo2DdHXkAuwTd5mzJS+xgAQmwf2ggqEzAR68=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(230922051799003)(186009)(1800799009)(82310400011)(451199024)(64100799003)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(8936002)(82740400003)(36756003)(6666004)(2616005)(921005)(26005)(356005)(81166007)(1076003)(41300700001)(70206006)(86362001)(316002)(70586007)(54906003)(110136005)(2906002)(5660300002)(336012)(426003)(47076005)(83380400001)(16526019)(7416002)(4326008)(8676002)(36860700001)(7696005)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 08:38:50.1298 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a409e8a-bd2b-464a-9c22-08dbc190ab9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8218
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
index 787f25511191..39671d245e96 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -435,9 +435,9 @@ static int amd_pmf_probe(struct platform_device *pdev)
 
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
+	amd_pmf_dbgfs_register(dev);
 	amd_pmf_init_features(dev);
 	apmf_install_handler(dev);
-	amd_pmf_dbgfs_register(dev);
 
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
-- 
2.25.1

