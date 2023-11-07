Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 420A67E4D90
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 00:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8451610E0AE;
	Tue,  7 Nov 2023 23:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6016C10E0AE;
 Tue,  7 Nov 2023 23:47:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWzk1dmnyxU/CqxarrxfCQZ5T1sQcyot5dV4u5izUvcuBGZeZwLc0Rmwa5bv8MTBD71RjsKgQm1pLKtuVYf6F19sTVJch5dSeWB0gHjdAFEKe9+b2h6kCIShcsl5NMMcEJ2R9b87ARsWLzCYjv+RTy3kvZOzkYwHMt9KXZZECumvKdzyCu6yM38nscDSb3jb2RPp+R7XiQaY5N1VCaxKDkP4Jx2rM1F4iBt64aBPl95r8kim+YxayVYX2vnPw/gGoK+vgDUevq6C0aYCM3CsiRL9DBY0IndiXwwzKSWrxu99bMLUUsTm9Vu9xpzLgBIpeCxzl/iEIiWjqR1jUunDjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtCegG5MnWal6P/yvDYoNAP2qZHLQfkvueP4PZ4ZpYQ=;
 b=niSVr1rL8VuYecwBcBiNQvbr+rEL2xWcj5PGx73BZs4FmG51aCzSBngfOh4GiiZXMvqvcarcXC18obfTVh8v/L9N6CK9aTirGIegrxmL8eTGUJr/mMFoG7trcZJ22UpnhDO38G8SZfIdPX4kWOff4EUa4dDlJd6nOhzDqYJWKgqfb52CVKqeds2/GxAHmDtTZk3JxTmuvHlSAsekXhZThG+m6bC2jzixafyO/OuaRoW9zTqd+tCbYzPtrawJ7N9x+VjtWRdYyDLnPmbWAAthB4aempN5FbBlwfVgAdixwUJiLPC3CTtQQUdGv9mDctP6wxzUqZiYLzw+2IZis1hKaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtCegG5MnWal6P/yvDYoNAP2qZHLQfkvueP4PZ4ZpYQ=;
 b=sg6UwfrA43N4q3ehBOaTc8uUNOJ/jbAq+QUwEn7OzL09VCJD2tXrNhzb8KsiLd1uAwGysWZoXwlxRDrTF+LcsPcJoLGiuBOODvn5DhDksZJ42Q6B2uLe9O7u7wJowMKCSp9FUYOZcZiJZep1SXv/nsz6qrvMo9O6Yx7TXhcteQa93gqRASnWWuz6zvdlcZKDT7rkBApdEuhbMdFkRYAOIkNMHbRWv30z1MxI7/QLv0sgeAODl7xRH6/7uv4CycbSRflTLgoc/T0IAS08g+aJA8QESJDglipi1U7SnBjnn+WCYMHuzLDXfeAzeT0+P6f1s0GDe9hL6Oo6RPX57OWIvg==
Received: from BL0PR05CA0028.namprd05.prod.outlook.com (2603:10b6:208:91::38)
 by SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 23:47:45 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:91:cafe::da) by BL0PR05CA0028.outlook.office365.com
 (2603:10b6:208:91::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.16 via Frontend
 Transport; Tue, 7 Nov 2023 23:47:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 23:47:44 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 7 Nov 2023
 15:47:29 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 7 Nov 2023
 15:47:29 -0800
Received: from ttabi.nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport;
 Tue, 7 Nov 2023 15:47:29 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Dave Airlie <airlied@redhat.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] nouveau/gsp: fix UBSAN array bounds warning in
 PACKED_REGISTRY_TABLE
Date: Tue, 7 Nov 2023 17:47:26 -0600
Message-ID: <20231107234726.854248-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac1b35e-a41e-4871-7419-08dbdfebf070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xNd1C1og+dPr6Su71GRvdVCxMtS7OJM9Y4IkXb4xjx97+UvuhAowrF6H/EzBc7f3WtaTcsYL9fELU+pRGmB6nLOrPj2wAMudDhVcPuqvWZvnmmpZU5b1BWQKGIISi36P6nMDKeCw10ldoxnyl38AVFZGu07uRg/wzqNYTXLicyHKR7N9gywuH9ubRv6ZAXkUXVMIjvYqLagYVv/9DbjE5PxrT5I81ZIthHoObsPFUa9H7m6WOG0H6RjTLruSYeCckkguzXZp/N3agFNjP9RK8sTcBfToDUppN5wzq6gl88UMRqWdTgk/Qg4pGeYXC1HThU2jvwl3PGXaboJ7eSrsnjnNP2L0vQl8m2YWIXJYZUKTDR+La2H48rVHkC8QuP8/BP8nB9B7GNyJdN66VVjlPyGGjtgn0sJUgvyuakKdrcEzr8OyPur6t3Kx/+IbzWbZJQ70CNJDjR3qVEoz+hvR726mg/VTY8zvKa1x3xzKS56YEJFWAfxx/kPhQhlQXH+9hNmoMqzrxdlUiFON2TBkx3UNKT0viHMxo19D30QE5ux610Drbh28EzB2Um0KSSO1/ZT/N9k/uP93pJxWYgy15kMUBLx/l/jyZgCfmUR8kgDAASVR0I+AFokpsL0y//G48mBefLNeZJ2q1EnxQy84Uf8MYWvRNu53N21BVd7vSmyDrCAV39t5xlduUw/dh55l4Ykh3A82SqjMUWGl72zl0bijYiTPg0apbZmcIytjvdlNOfYEgiFLUGtOF3/hkujLvW3HbS1qxJp6rTvTmmb1CzI9yUjvXlxC6NljG+S6LiY=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(39860400002)(396003)(136003)(230173577357003)(230273577357003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(82310400011)(46966006)(36840700001)(40470700004)(47076005)(26005)(336012)(2906002)(83380400001)(40460700003)(36860700001)(426003)(356005)(7636003)(82740400003)(41300700001)(8936002)(8676002)(478600001)(6666004)(86362001)(7696005)(70586007)(70206006)(316002)(2616005)(40480700001)(110136005)(5660300002)(1076003)(36756003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 23:47:44.5079 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac1b35e-a41e-4871-7419-08dbdfebf070
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6885
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change PACKED_REGISTRY_TABLE so that its last member is a variable-length
array instead of a zero-length array.  UBSAN treats zero-length arrays
literally and warns if they are dereferenced.  Changing the "[0]" to "[]"
tells the compiler that the array is variable-length.

This fixes the following warning in function r535_gsp_rpc_set_registry
when CONFIG_UBSAN_BOUNDS is enabled:

UBSAN: array-index-out-of-bounds in drivers/gpu/drm/nouveau/nvkm/
subdev/gsp/r535.c:1066:33
index 2 is out of range for type 'PACKED_REGISTRY_ENTRY [*]'

Fixes: b5bad8c16b9b ("nouveau/gsp: move to 535.113.01")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 .../include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h
index 754c6af42f30..1d236c68fa30 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h
@@ -38,7 +38,7 @@ typedef struct PACKED_REGISTRY_TABLE
 {
     NvU32                   size;
     NvU32                   numEntries;
-    PACKED_REGISTRY_ENTRY   entries[0];
+    PACKED_REGISTRY_ENTRY   entries[];
 } PACKED_REGISTRY_TABLE;
 
 #endif
-- 
2.34.1

