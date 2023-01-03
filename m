Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F7365C967
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4DE10E4DB;
	Tue,  3 Jan 2023 22:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202AD10E40C;
 Tue,  3 Jan 2023 22:19:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEXCyjFs7Kde0kZ6+gZC72iBMBdgAvccjKoGmK9VVdxmhcLgcwkX3JrgIN0T44+n7+wKSE8MTnext0f8GIjjMAhrl2bJeZwHAeTOtzZ3rLnma8Gt6E97gY020DCI2dGHJ51tlOwTe+d3Px3w+wL8c55s8oq5sRSikkaCW7DI1oG3ae1qp5DZ037eWxNAT9V/566yH2cpqQIjd+EbBV/B6/jid+oWsIjHFDMs5/uGSn86jBQ4V+wDkp10IAKk0zxPlaEMOixeo54qeIW1Uz94bipdxQr/8H6CGHKShxURKrINK9roLhMgl6W53TrymsqtIo9gW3y9jpRneIe0qOzIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Y2sP3PlD3eGIiSQvNh632gBhes1ynqhUIRWZGZ9J2g=;
 b=CHpn6v9qRgYOldaS38qjqURFkeW8bqXINfTVfNAkMYwCDF9px7dzyhEk6HeVuTsjPpjOUcmDUPSJA3KaA3OFYsQPwOJO2s2KdzL4LrjIe8/Ae2zzFwiDKJEBM0HfCZeFNu/s4ZugoI+ONMWXCSTBFYLdiqtTxHM8B4bGLhuXWoEwHfUpW6cLwKC5q2qeDPnxUOk3bABj0iPe7lgugxfa29Og+Kw51a2MI/s6XRZwU8wAWMumYQsCK1ahtqbHv6sx6UVkYv4BoRNtt9l6hpW+xeW6Z5o4Q6AkSol0yo7a8vk7zgpTI2F5bUo/I3owoGXFew50qjxz7BQwaXnvC+5tLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Y2sP3PlD3eGIiSQvNh632gBhes1ynqhUIRWZGZ9J2g=;
 b=xF550u3gdtJxA30Ns+wiNRAyxW4jDSQdwP/t1ja+2vdRIrPu4zFz0jBwpPe0y+uLqZrg5hZKVBMr37LQbqZHN5/ls8K4nQgwMXuJ4XKsxp/CdsW53pJ3CAFsYhRYI4Xq58gkhpDDE0wILtzBVqolDcSqhsT7njHLRmjvKX+6M1M=
Received: from DM6PR10CA0011.namprd10.prod.outlook.com (2603:10b6:5:60::24) by
 CY5PR12MB6432.namprd12.prod.outlook.com (2603:10b6:930:38::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Tue, 3 Jan 2023 22:19:43 +0000
Received: from DS1PEPF0000E654.namprd02.prod.outlook.com
 (2603:10b6:5:60:cafe::8a) by DM6PR10CA0011.outlook.office365.com
 (2603:10b6:5:60::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E654.mail.protection.outlook.com (10.167.18.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:42 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:41 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 13/27] drm/amd: Remove superfluous assignment for
 `adev->mes.adev`
Date: Tue, 3 Jan 2023 16:18:32 -0600
Message-ID: <20230103221852.22813-14-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230103221852.22813-1-mario.limonciello@amd.com>
References: <20230103221852.22813-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E654:EE_|CY5PR12MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: b72f0a2f-5192-4aad-c5db-08daedd89d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cGHA8LOnQruHbdbUtbopH1ydqrSgrAd6JYz/K8VYVlRvJyK2mQcDj7SpgTsjGpPts/N/OYMtOmSPuadYD5ni7s6OJHxFOu2cppo+MOmgKzmjri3h4G3gsF6r2zN5evXARmis1Q+WWhD/PbxoDPLIAo5VD17c4RSRUdxy0B3fE8DZpcD1eRZm+6+Hzk/MajXva4I0wt8x8p6vYT4Bn9wmwBBAwrraVDh0Ltl8ZAYLtDdjWI6zuCYGqaXmZqPr+KAPcSqWlxbdCmvLhd97Mh9sRgBf3a06YG6GibMjDrQL14u5xGc9VaDbG27MZPidxWB0Mqwhox8Z4+M2/+Exv7EUIxKdfr7TlGLFiXOxXudgTmrQM6Dd29F1NXqNkN7qh3+SWOjbDKKbBgbUj3mBn2Z3XaaTqNJsqSrFaEeuBJAo6icSv8mrUfh0jz0zq27TsMX6JYYV2A+CZ5NCca1JwO9U4qn8SiCZoxGpFG5T+P0B7ESDz0J/PqY6x78dKD0fwCd8Z+1zTbydzfBYiwzs1t5ZNe2PKydA8T3T4fYjrPWZtKNqp6dDAq4cd97O4ePqpYwpampJvhNbRy0CUzwKDfcZf80C4Pwy9766dmWBoDIm7GuoCyFK85CchjtpVl8Iaqj11/YgAXEKUAFqy2oh1xObDLlunrCN9yKDNgJ5WdDsU8V20ILqoPk0Jw69OK9qL4LD+fhYxqa85tg4le+hLh2gPJ4em2UzUIar5HQQ9jRfglGY05fXM3dmwD6dkPBO+HWN3sOOBE6IDDh8EBpSwHYrtBFl/HnRSEPJm3pDvqZFgVc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199015)(40470700004)(36840700001)(46966006)(5660300002)(2906002)(44832011)(4326008)(8676002)(41300700001)(8936002)(70586007)(70206006)(316002)(54906003)(110136005)(478600001)(1076003)(336012)(2616005)(26005)(186003)(16526019)(82310400005)(83380400001)(40480700001)(7696005)(6666004)(47076005)(426003)(82740400003)(81166007)(356005)(40460700003)(86362001)(36756003)(36860700001)(22166009)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:42.9079 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b72f0a2f-5192-4aad-c5db-08daedd89d0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E654.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6432
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

`amdgpu_mes_init` already sets `adev->mes.adev`, so there is no need
to also set it in the IP specific versions.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v4:
 * New patch
---
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c | 1 -
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
index 9c5ff8b7c202..f58debf2783c 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
@@ -931,7 +931,6 @@ static int mes_v10_1_sw_init(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	int pipe, r;
 
-	adev->mes.adev = adev;
 	adev->mes.funcs = &mes_v10_1_funcs;
 	adev->mes.kiq_hw_init = &mes_v10_1_kiq_hw_init;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 3af77a32baac..c8bdee9a66c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -1020,7 +1020,6 @@ static int mes_v11_0_sw_init(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	int pipe, r;
 
-	adev->mes.adev = adev;
 	adev->mes.funcs = &mes_v11_0_funcs;
 	adev->mes.kiq_hw_init = &mes_v11_0_kiq_hw_init;
 	adev->mes.kiq_hw_fini = &mes_v11_0_kiq_hw_fini;
-- 
2.34.1

