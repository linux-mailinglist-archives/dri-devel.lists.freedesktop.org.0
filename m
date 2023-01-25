Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE2967B5C6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 16:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619C610E7EF;
	Wed, 25 Jan 2023 15:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B6410E7EC;
 Wed, 25 Jan 2023 15:20:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sd1zK3fRNukvKhCIvpunGpCcCxDPcLFSkxgsYXAnUEPsV250v/MRc2C7/3hs9Uga37YXqM8GPC7JFfYuKb8qXfa/tYBTWS2zq4Heq7vL8Y80h2Ld7kiJerbDDInKyv2vmf4N1eeM1+WSPFy7U3JYPqzdOJkmwawvNj1j2OfHFXAu7sXIr8sPdHRxM867VfxHZZWSD8qIBBG05XAzFli4FhbzozIbzWQgx+MFjbDsXXQIIwnAxPVmHfJkDAOzSJbJDFOOOyUokjNaMlF1QQeZ9BKsYpHNzQY3vwwGpJQiz/zx94dkGS0w9gIZyyTbq4mYXvw62HkKsJy0qRNwcZnfbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05J3q0WXmpYhxvTVSC6vWNR6/2MNLFEf+37jBYHmAnU=;
 b=PfLLJUsbNoHDF7qoYt9GhNzvhyCB1ZMGNj4dQZMR9779X+AAd74hBLBFJZj4kMbMMy5IYeLnJ8LLQF/e/Lo1uE9kdo6jd+lEI+h471y1lvgdBX6hI1Kbxf9ybMiMLqxWBN1x7dRgXbzrKq6mc5o6IxC7aNHcmiJeXTcvnqeDIWOSwPUgao+GqmTq0KbbKxDWdUlibkaKpyNFn4nZv+MOed5qdSSpHvwPbtkpDW4sKORP68Yn+usFRVwsJeaO8Na/ZdtKFRP0GfG8+60RGFwjcfmWJ9a5ANAlPyRBmgHef/8OsR2Imn0OXL4wzdKe1fYRuatTTRH5+cr+fkTkbDC54w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05J3q0WXmpYhxvTVSC6vWNR6/2MNLFEf+37jBYHmAnU=;
 b=x8AIAEbxLipcR8YkjRb1B04k/DuKKSgyOvZrY06n61YXTxFqRP0QCDUX0aiN1+CiTGDbjoKofFFtX4zQdHaO5Tjz8u0AdplMYZ0Wvqi2RDcENsOnixt79okT5UmpWQyvArNsiDnIIb5Uci1DpZGnF7OFXkRf0lAw2h4ROnAoekE=
Received: from BN9PR03CA0487.namprd03.prod.outlook.com (2603:10b6:408:130::12)
 by IA1PR12MB6091.namprd12.prod.outlook.com (2603:10b6:208:3ed::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 15:20:48 +0000
Received: from BN8NAM11FT112.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:130:cafe::8b) by BN9PR03CA0487.outlook.office365.com
 (2603:10b6:408:130::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 15:20:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT112.mail.protection.outlook.com (10.13.176.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 15:20:47 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 09:20:44 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 4/4] drm/amdgpu: Cleanup PAGE_SHIFT operation
Date: Wed, 25 Jan 2023 20:50:06 +0530
Message-ID: <20230125152006.3945-4-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230125152006.3945-1-Amaranath.Somalapuram@amd.com>
References: <20230125152006.3945-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT112:EE_|IA1PR12MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea57d9a-13e7-4e6f-145b-08dafee7bc80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jQUVFvCv2P/4eKpcdcEZeySUuYjIJjrTweGUwzjfXiADAofh6v5A/P+Ox8nXgz6R6MPgGtGJo8c+trOSeoPAY49zSNoTXdfHlIHA/PjyPsd+sxRdLw119N+aXzjyLoEdHMSrHJx+CwGO29dm/oNMTjHrsAMBoBaE0WvPg2QPgjRE9lJESBgciamhjr4ZRWvWU6LrHiynta7BkW9aTQ6oxbjhfiK5voGi7DdGl3WR1odORiaCa5saRK20PMbs86TKtoUiKPu5xQ8uk+VibSghrz8Ej/cLvk+pOMpvaINRr0qSjNpfb4UR8w5n8xCENYcIWI4jfuQ3re7LpEp5Wro/QvnEeiCdOWU3CvRJ6NjFWReoh7ddSpnN0Sybx+ZkG76fMsQP3uOtemyO5nOH0Gl4cGiA8vuHFQWV87kN6cy/ogz1SEBLPHCt8hVLxdqN1opL3TUFO1x62jg/ZdVtXW0/t4OrGkEpXp+cQyhYvjTamNX2zV+Cmvn69p7xPm4F9jAeweLUmF6QBFRINYzQaKTYdWfohSNizMw1p3tEMrpycwa7ZTPlZGWV89j3oMC2Q4qKgVkBxRyrlvQgPARmtQOZzjThFwTyNLsg+97goh79MIocX6cnavHgAh6srtobFLFWgWrkJusjv2osmfEB7GkQh8P8gq3lxKZ8JVC5hylr2bmpV4z+bH0K22L/wH8IMr1NuayPi/uG8IyFbHuN5UEuJDw7R1dvjtrq7oEzom0WywM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199018)(40470700004)(36840700001)(46966006)(8936002)(4326008)(36860700001)(110136005)(83380400001)(70586007)(70206006)(86362001)(450100002)(8676002)(26005)(316002)(478600001)(36756003)(6666004)(40480700001)(186003)(16526019)(7696005)(54906003)(356005)(81166007)(2616005)(336012)(1076003)(4744005)(5660300002)(82310400005)(82740400003)(426003)(40460700003)(47076005)(41300700001)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 15:20:47.9288 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea57d9a-13e7-4e6f-145b-08dafee7bc80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT112.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6091
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
Cc: shashank.sharma@amd.com, arunpravin.paneerselvam@amd.com,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, arvind.yadav@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cleaning up page shift operations.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index a97e8236bde9..ffe6a1ab7f9a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -930,7 +930,7 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 
 	addr = amdgpu_gmc_agp_addr(bo);
 	if (addr != AMDGPU_BO_INVALID_OFFSET) {
-		bo->resource->start = addr >> PAGE_SHIFT;
+		bo->resource->start = addr;
 		return 0;
 	}
 
-- 
2.32.0

