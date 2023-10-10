Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C64607BFC25
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF9710E34E;
	Tue, 10 Oct 2023 13:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A17510E343;
 Tue, 10 Oct 2023 13:00:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/3Ao9O0zpsD6dqOYYWZOYeSdPgHobFiD7ILWME1r2A0mr2vBq0MIzz5PL2FmhmM+8Ya0oDMxzjJKQuRYjnyZrHY0MJ8vkvTBk+HVzVCey7cAyUf2BjC4hmcfDxtR6bMliMzQdnNYSMuH9KIHAc9hiev55t0VYmyy4cARYpjoLE01c1p0+qthdNSHqzEAh32S9vfeGX5NQa6a7Rg8G4ZJA0Wuki+2M80kR3TBFy2TfsQ8L+fMLLjxLjMAfvFzwVxSVqMhKgxD+xe8WqhCloU/tbWNcQKHrE+sdbIUcchlUuUd5BOZ/HAYlthbFCj5aiNZNpudoWuxXp7GEXXS8UMMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gdkpRzsWW7P33A4m/Tk1TczNINWtyc1EM8CFjBLXNM=;
 b=EE39KtwmcctYYTtyc7Pt8F+1V14Kd6f5ZL187yRapUWEnhS75ijlwFHrTPrh228MkxDPFVznRcrGMzsDG8TwzSHbM59TlqhoEWW2NRvwyY6Dg2YX+tGGodV4Qzs6zqVygbB8E5IA41FtgOwPkADH+FZkf5/ZA0XLGDj8EDvBmFTrGGmFZtsHda30WEdYFoyIo0HG/r+6Reu+vsXHG6ooifj4fGQ/2NVRMGmxOuRP8TjxyOmE/fHlSPTrgqebjk6MKYKM4wrVwLYZIFeRomk2az9lx/6SFnEaLGKwLoUSL5ZwBBF6qWQY2qQioUiWip7duvWJ9DTOUqRrZl+D60ZZ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gdkpRzsWW7P33A4m/Tk1TczNINWtyc1EM8CFjBLXNM=;
 b=p137ZFQyk41eAZJONA+pteLpdPz0K03U4jX+jZ51IQpAoFmHXUV5frL4Ft9KgDqkDA0OcsXwXyziKQk4sMSCTTwdRgCMHeGqVQz7PufrTVma7pm9rZNVoCx4TR2r+20KhAoRS8WpT6jeVxACAuiJCqRaMQq1TE017fzLQAqUmQY=
Received: from DM6PR04CA0002.namprd04.prod.outlook.com (2603:10b6:5:334::7) by
 DM3PR12MB9433.namprd12.prod.outlook.com (2603:10b6:0:47::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.37; Tue, 10 Oct 2023 13:00:07 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::8f) by DM6PR04CA0002.outlook.office365.com
 (2603:10b6:5:334::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Tue, 10 Oct 2023 13:00:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 13:00:07 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 08:00:02 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v3 05/16] platform/x86/amd/pmf: change amd_pmf_init_features()
 call sequence
Date: Tue, 10 Oct 2023 18:29:06 +0530
Message-ID: <20231010125917.138225-6-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|DM3PR12MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f92d66-a112-425b-8b0d-08dbc990d41f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +PUH7Nqd7b323H5sPJMWFD3Podr+wySevdTNE+OG6NZh2hy3xLZr2OzkRdR1USZegZOAI0UosT/Fc9jjf+W0K1kxQbZ5we03VzFsGjM5zTUzrBI0LOW/ddwWOdc5dWqhrFbtBJHh6nZ2BCtLs5IWcGdWtDKkP11OMAQNKPUgUv+qTQSIhupkrmgonV7zCtL/PwVtOczIdoDiAwQuk/gJ3p5DyY5HQdSGV6W+QHF5bhd8PfL0MmgJO5Pq5XSd+JEQ0leC3JDBQ2ns+lVFNXB7bMK/ia0kSJbNHIvb4x+pt/rfnGDIMmYX7EwjrRSYC29tL20fXwdpuGfn+ntf7J5dIyf8MWvgZHAJf5TsIn0RMg5CDESRv05vbWXkk5rdT86+xQjR56Ga0zy8p8yCQt0Rcjxx8/DJRdoN3wE/7WH5YA0Q9CVOUfhciD6t1SVyrrEJJ5O+nn3EzXFYt+N/40RtzX5LCLgf7rTOAJHBL4zyfYBzppvrY0KTcC4E3BRKHSrKfIElS0VBy4VvuUAsEK+lXdg3Eyo2up2FyBErE+Lb1rnN9jQCm7yxkNR3KYS+OCA2nGcTODqdsO3b1fWz3hRCeKmBz62SSpjV90hzH2umv0p2BMGmaSFuTVzV3NxiD/fe90QOlfyNUMun0OEF+syxjtskZWrPoDKQCYOp4SxHu23CYa4MslJbs+w5c7ZYZeRIgJyv9q9tLutkAjedIDGgFgVnydurSshBSVOOzgCwf4t+AXU+mJuujTV+lvXoLBNOBtl0fpw9JlwEMGDfJkjVVNZdrNRkFEZtdZ8p4/KeU1U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(451199024)(82310400011)(186009)(1800799009)(64100799003)(36840700001)(40470700004)(46966006)(82740400003)(2616005)(7696005)(1076003)(478600001)(316002)(41300700001)(336012)(83380400001)(47076005)(426003)(7416002)(2906002)(70586007)(110136005)(5660300002)(54906003)(8936002)(70206006)(8676002)(4326008)(16526019)(26005)(40460700003)(921005)(36860700001)(356005)(36756003)(40480700001)(81166007)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:00:07.3586 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f92d66-a112-425b-8b0d-08dbc990d41f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9433
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
index 96a41e7d4e7d..64af6ddc23ae 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -447,9 +447,9 @@ static int amd_pmf_probe(struct platform_device *pdev)
 
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
+	amd_pmf_dbgfs_register(dev);
 	amd_pmf_init_features(dev);
 	apmf_install_handler(dev);
-	amd_pmf_dbgfs_register(dev);
 
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
-- 
2.25.1

