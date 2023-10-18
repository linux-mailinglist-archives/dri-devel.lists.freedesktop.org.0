Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F2D7CD50C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 09:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D3610E39E;
	Wed, 18 Oct 2023 07:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2087.outbound.protection.outlook.com [40.107.100.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BB410E39E;
 Wed, 18 Oct 2023 07:05:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjVQdFpWeapuslQvSvlrlVRY63QKotTttPjwnQwOzREYJstcnqgoYnJEcA/GaqJ+M9BLqc4LeV4uVbPckJ+4GOz/6VjJP8SqYrSjMnRyYd0J8iPgOKWOHv/B/o0YjcBdbJirsKjPYMZLwMFEQz2c8/nNhp1qUHvgx9Hh2JuA4B8JfY/RSed0rvXtwaPgr/CGHy4+/Io/MKb1QgEEkthhLfPW5HR8xnL8uB5tSl30yBxxUNpHC8bA2NfRuwd2VJiF8j+cjhrjWQpcIGYYmEZFjbGArAlxJg0oJ6FzyWtKuRpNXijsSeBX3EJpfrS6spU+akvoV65hGXFgJC1BoU0v9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4ThUBmT2J1YBqouHs0nneydTTV69xNOBh60SWe/WSY=;
 b=iu6OEGS92r75iVG6TK1fu4Yobv/fPNyMjLxhcKcLu0pbcc/4v3KokBxShSc8Fkn4Z/L/4i1aOxmmae04K+TWj/6AVM9qlQJQvuOBKx1+bFPNE7d+g90oFRmGqkaNttIjfGY7cu+3YMfM7Gr5yHulib/Y8wqGuGfRf8noY5HXuYGm5hdA44n3NOMnJ/nNHLuUW9PEjIVQDwoXbJG7FdjruRV6GEdsdhuxc487Pgv1i2Pwry3su24EG9OwcATDJ5ChekFdejmOvfYhIBo5RwkzQS3LXwipRWXf1NTeswfSQ6UNc9RnG/duo1nT9Gx38iqA9XBKQQkyUr6VGPjrr5u7jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4ThUBmT2J1YBqouHs0nneydTTV69xNOBh60SWe/WSY=;
 b=IngRZRBo9zcTNusyWBCXeyYkC49dULujz8ZGMohK7I5lmkXYYarlYyHXFfridonlTNe/LeQZRNG0F3ibl0KVh28pC2zj35CfkUfxSURhjlEWX5Vrxx5QXUS3vlZ//8y/1dHm8rvnNnKy8QOJFiONLBpoDhrQb5Ii7kWM81loeMI=
Received: from DS7P222CA0024.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::13) by
 DM8PR12MB5494.namprd12.prod.outlook.com (2603:10b6:8:24::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.34; Wed, 18 Oct 2023 07:05:13 +0000
Received: from DS3PEPF000099D7.namprd04.prod.outlook.com
 (2603:10b6:8:2e:cafe::10) by DS7P222CA0024.outlook.office365.com
 (2603:10b6:8:2e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23 via Frontend
 Transport; Wed, 18 Oct 2023 07:05:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D7.mail.protection.outlook.com (10.167.17.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 07:05:13 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 02:05:08 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v4 09/17] platform/x86/amd/pmf: Make source_as_str() as
 non-static
Date: Wed, 18 Oct 2023 12:32:33 +0530
Message-ID: <20231018070241.2041529-10-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D7:EE_|DM8PR12MB5494:EE_
X-MS-Office365-Filtering-Correlation-Id: b656d6aa-f260-464d-81b8-08dbcfa89356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HTVaVM7R3YN0MdgZofPICQkT1EgEkzz6dg2PoVh0yl3MptGvyaJpWCAxZtwvd94U5vfddzkfc94BX9acQd4hfGEYEmHiaOk4+6z3h2IuD3hDT4hzENoZO2NtEPxMljYhVFEJAh0/09J6tRsVaA6iL9L9JXhrf+oCML3CfzYbF84q5ZYgfUyAX7TeNe8Uu2eidAmIRnmNzEa2zK8tvmn50/DqtTtr5+1yJfqn8d1QRfC6U+5+MHMQg6H5Lq6a6McU8VJBu7Ncbbs0xzWSXz32vzGrKWJS7dC/s4FoPqENM6m/F7Z7H8reELrNKXjTeX9caziIQmCok+HRT38v4WUyciNIDULcFpdKeBEvH9zKbTPV7xvKrYTHn+h25cFcbSLVtVr/RT/0wB9AY2+oO5gaLFd+mr5hETK8WE3Mau8RaZilMTxbQq8uIIPi9SKsu6l/V4EzJflQ0vnO09PSk/2Dfo3hNm8UZ9jiJ1V56q4Y5FFcgINYMsxYIFVap3ELFWlTx67mpCZ16NZ37f+bu/BcEO1DkzMZf25sm7+xcFy1BnT3zfJ1u/DHkL51/FxL68w2nBBanxPLdL/CmxKNIEVq8ucJ1PjIjEBpoLiFy+ETfAYYjeKOhiNFMGfjSjBBz1pCmwhbnjuREbvkx1nGG6/YR6U12/WHMSXRV5ziDloXAkF6sMtE+/ERcEdWpUKmrCgL1QPhQdLDTEtvKat2pckkq7WUXJBKwAI2A5WQLcRPLHPqZLZ/uGlU2cvrEc27/xtbEglCHOQXKUD8aNXHdyFVFuJdKlhZ122NWB9GPsVm8Tk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(82310400011)(40470700004)(46966006)(36840700001)(83380400001)(41300700001)(40460700003)(40480700001)(36756003)(2616005)(81166007)(2906002)(1076003)(86362001)(110136005)(54906003)(70206006)(5660300002)(7416002)(4326008)(8676002)(8936002)(70586007)(478600001)(316002)(6666004)(7696005)(426003)(336012)(921005)(356005)(26005)(16526019)(82740400003)(36860700001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 07:05:13.5651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b656d6aa-f260-464d-81b8-08dbcfa89356
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5494
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

Add amd_pmf prefix to source_as_str() function, so that the function name
does not look generic. As this is a helper function make it as non-static
so that it can be reused across multiple PMF features.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 1 +
 drivers/platform/x86/amd/pmf/sps.c | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index fb9ce2593236..216a9f795436 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -600,6 +600,7 @@ int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
 				    struct apmf_static_slider_granular_output *output);
 bool is_pprof_balanced(struct amd_pmf_dev *pmf);
 int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev);
+const char *amd_pmf_source_as_str(unsigned int state);
 
 
 int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index a70e67749be3..33e23e25c8b1 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -27,7 +27,7 @@ static const char *slider_as_str(unsigned int state)
 	}
 }
 
-static const char *source_as_str(unsigned int state)
+const char *amd_pmf_source_as_str(unsigned int state)
 {
 	switch (state) {
 	case POWER_SOURCE_AC:
@@ -47,7 +47,8 @@ static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *dat
 
 	for (i = 0; i < POWER_SOURCE_MAX; i++) {
 		for (j = 0; j < POWER_MODE_MAX; j++) {
-			pr_debug("--- Source:%s Mode:%s ---\n", source_as_str(i), slider_as_str(j));
+			pr_debug("--- Source:%s Mode:%s ---\n", amd_pmf_source_as_str(i),
+				 slider_as_str(j));
 			pr_debug("SPL: %u mW\n", data->prop[i][j].spl);
 			pr_debug("SPPT: %u mW\n", data->prop[i][j].sppt);
 			pr_debug("SPPT_ApuOnly: %u mW\n", data->prop[i][j].sppt_apu_only);
-- 
2.25.1

