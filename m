Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4088865E3F7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD80F10E677;
	Thu,  5 Jan 2023 03:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7C610E66B;
 Thu,  5 Jan 2023 03:44:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vwd/lQZKxkkZpImOkzIB9kwf+PfmdSNFHFRiQ4PR7/oxqEcCYeAU3cPQgjcPvZURAXlM7QeXr6pSr7mg/tRu/mcSxc1ArQN+LjRxKf4M4OqPW+tRm9fgJ8ifMRodJrU7DWBW2TGb7YI3cl9uXab+VXfK8Q4WcLHrarlOU8pVX9Fw2gl+xuzlgJBFOuL8gBKR5xEHJn3780V1QxAQvotssMqYJVpMnjrDryk1dPEIdeEOg+5zUpll3Rv9NJ3qZMQ/rIc/CV28m/1jktGhXIMrIMtobeZV7RVpTrhaMUIOr3gxhpaFbP0pBHGZFf/1letwEHPK7HVI+nU2DWcOw579uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXk+zF5O3IxPLeHM04mNh3UGzDXvGu7UFYGMaHfAepA=;
 b=Sxzdy32BirjoE3JupZXqngdh4IjEDbBc0J7dF4nA1TLJi/tt62y/e06X4nNEsnilpA2Q8QiG1Dq2vzx4vFSJzybYirOb7rB5BanR5sgImAG0418Mgdy4gfYSzdsckNztGsNChKdyBx5UVM0eXtuENVWr/WTihCY9SE0K7EDIm/G/mWPmbyE9bo1eoY3fJrJNwGvFl+U5oAcub9G9qievyS+OGD8fiJUmNFFqKDT6E+FiPzBfHFX+e0CEwV2c6wstoz05BvzKdlceoQYKfojmQsftnhjQI8spehOYQ4x/E/h23ZOy0eeyLUXeT56R1t0EVEeOpWpT/cQTymYnCFFC9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXk+zF5O3IxPLeHM04mNh3UGzDXvGu7UFYGMaHfAepA=;
 b=W+OfXP2k+NHJrOStBjnCBueHMsK/1BH7GvBpu//D3Zy+qvmOHDWDZyy9a5YXWAYNJ85jE2un83u0o7+2WlSWLGv1y7eB20VTqAMvZLnU1AnKrBfj/lqxot/UqK9ncG5lcQWCWh0B/61COOoHf1QfKAyB0HsgpFY6ey0qZ29+a4s=
Received: from BN9PR03CA0046.namprd03.prod.outlook.com (2603:10b6:408:fb::21)
 by DS0PR12MB8019.namprd12.prod.outlook.com (2603:10b6:8:14e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:46 +0000
Received: from BN8NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::f) by BN9PR03CA0046.outlook.office365.com
 (2603:10b6:408:fb::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT103.mail.protection.outlook.com (10.13.176.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 03:44:46 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:44 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 28/45] drm/amd: Optimize SRIOV switch/case for PSP
 microcode load
Date: Wed, 4 Jan 2023 21:43:02 -0600
Message-ID: <20230105034327.1439-29-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105034327.1439-1-mario.limonciello@amd.com>
References: <20230105034327.1439-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT103:EE_|DS0PR12MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 91dfc648-911a-4ad3-2af5-08daeecf3039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ICosUsaeYYbNSThLE2QIeZFYO5aeP2NloH+3tVg/+S8dgcDtaFgrVSXlwvX0IPQtF5IyOEKD+jZSjitIcS+AKTljwLBK34obV9S14KWaSmbMR865o4WgFJofB4UvrTBMfsCQO5f34yYyQ0MQr1wb6LeJrS84zHtOmVKuhTyNfretMnhmKnpJN1vcCxDUX0MNmJIX21O4KwiOwYyAJPJJYtPCngezLrdAOkym6zDQNBF/Pc8JsXD+Hkg8tVjFcE0uCraRCTkRr3JFy6F2Ef0alWr/PdhegO6m8hD1sRnzoDwMvcblCfvZILUyFxQPpKVht/VN6bphdXN5iUfz3KTVFGHy+wmFnyP5P6eA33jfCSgF6u+nfzYUTEG3xMC+0/v2UgnU9wx+uEoctbR0MIqJzZUnYfkJjieFFTPOZvmnhAhwqArLF9HlCInK6CC5+aCrE+jgLy9vxbmQwe/Q9ySux879nr8Z8riCij6OXf+oAoor6vG6IXn/z4ACaYP5E+cSpyzZ6b8qZ1FqmIP8QNAun5r1SFDW6I0BvS50KVRgRba3FfplaDU0j8Z07uu+GLSHyn9v8u1zi0jau6LX2pvBTxjM/zo0JvXfmDLRWECqee2yS8UiI+3eeOESXBfWjSS5ukFWgnB8DKmAIqZHeOGaGKcA2u5+8I/67xQLrLzvtk2ckE29fFg9/sffUnkOS34lWKMRdAHX4Ds74tZGI9S915vwBQ7sMiiC52ddb5rrFA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(47076005)(2906002)(426003)(36860700001)(356005)(86362001)(83380400001)(81166007)(8936002)(41300700001)(44832011)(5660300002)(70586007)(1076003)(70206006)(40480700001)(40460700003)(82310400005)(478600001)(6666004)(316002)(2616005)(16526019)(186003)(8676002)(336012)(26005)(4326008)(54906003)(110136005)(82740400003)(7696005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:46.0571 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91dfc648-911a-4ad3-2af5-08daeecf3039
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8019
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Lazar Lijo <Lijo.Lazar@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that IP version decoding is used, a number of case statements
can be combined.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index aaef30bba97f..380e08affc25 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -132,14 +132,8 @@ static int psp_init_sriov_microcode(struct psp_context *psp)
 
 	switch (adev->ip_versions[MP0_HWIP][0]) {
 	case IP_VERSION(9, 0, 0):
-		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
-		ret = psp_init_cap_microcode(psp, ucode_prefix);
-		break;
-	case IP_VERSION(11, 0, 9):
-		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
-		ret = psp_init_cap_microcode(psp, ucode_prefix);
-		break;
 	case IP_VERSION(11, 0, 7):
+	case IP_VERSION(11, 0, 9):
 		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
 		ret = psp_init_cap_microcode(psp, ucode_prefix);
 		break;
-- 
2.34.1

