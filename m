Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6487A7CCEF4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 23:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1442A10E348;
	Tue, 17 Oct 2023 21:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2049.outbound.protection.outlook.com [40.107.212.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238DE10E32B;
 Tue, 17 Oct 2023 21:14:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdWRCKg9G5/6Dgz2cg6H/sIzxjaEwgI9vLOKEFi/dN57gUdajFdWEhGABFpEVyuwwcCs7RwMUDebFP186DuK0RVelUxZgXz4cFUAZn03clFfdIt/rm+xyP5ikbmcfSrECxIPczaFb/R+bfJJdf0vPWFSTzsRNdqF3r9rVkUqmRl14POf3VL66tF6U3sve+NJkqhNkQt31bnAaOp2PHr149rCnf3foRnPIBPEzlVWqzVn/3r7thQXFjbgFt0cFoNjTbVGc34HOstakQjFW59VvMH/Handrir8cH7s6kRs1sh+/b3AeGnqk/ScCnQ2mIONql15KU7z7C+K5LB8knAOVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJVTvrynJqwestsLwPiHCPDP9UZP765r1KhbIPPWoA4=;
 b=Sp3e1CWQTmKkS0Sz+HiU3HLf1eTB3zXIhn0JT/lsDbk/0YppgVYmkLAAV7JuKyy2Sntj1ptL/+3NSmPigGrqETrgJznGs3y8EEEJYZ70JAEZajhUthBoCzqcnqlvQrwqFtYDDaegbw3nvtQZbvXTYsu79dzTVjvcBzNQs9ENfT4pnLYXfCW+ddJKgLEnpbLWNXO0x+mOP8gN1vQl/OwnVTiUCz8kVwJl1ALG8r8m5C+3qRtFxNsTt8t6kRcjioSKpJQff0Gd3ej8IiMo6toalygqdDD+8BAj/q+eH68RuMls+I/P4HuI2LrsoQQIUYi6R8q/Z9R6HcHcPUFd2XygQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJVTvrynJqwestsLwPiHCPDP9UZP765r1KhbIPPWoA4=;
 b=LevfPT4P/5jmyQbOLAPCncjxLTmek9jkvVCSUnuMPrIft67NRLLd/WBcYzg3isr/VD+wiihxGDjyEZwcxAJXhNnXQRnE/T2+kxeisGEsEc9wOPtG2YNoa5oS8F3SMvv0BiYqcG1kHoUXUaRi0WzqADxwtxxg2R+HXbFRSPSiD1M=
Received: from BL0PR02CA0028.namprd02.prod.outlook.com (2603:10b6:207:3c::41)
 by PH0PR12MB8174.namprd12.prod.outlook.com (2603:10b6:510:298::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 21:14:22 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::15) by BL0PR02CA0028.outlook.office365.com
 (2603:10b6:207:3c::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Tue, 17 Oct 2023 21:14:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 17 Oct 2023 21:14:22 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 17 Oct
 2023 16:14:20 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/11] drm/amdgpu: Reserve fences for VM update
Date: Tue, 17 Oct 2023 17:13:28 -0400
Message-ID: <20231017211337.1593869-3-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
References: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|PH0PR12MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: 1df954c5-9204-48c2-7101-08dbcf56089d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pyxn5jg72cXIlmSNX5OEAj20vRQjuNMKCUUmxm4OFtZgz+yxtS2lJRWF0IZEVait2L6UwT4Mhzrgfl9mdgtsCv6wt5pqrKx2rsHiYoD1pS80SpPr3O6YhENL/SaQ1lKgUFkM607zgE/1SVcOz5T5i2c0EoHAzrRNw3SPZzNQ2DYZAVlSb9WmpewKZRxt11WeRt4VjRd+OofEnotVxuK3A2NSb4ptApy/eClHy++j6UCNrNIIEn6LVg6j1v0ij94gonDvhjN4AJGB9qIhBuOaGDRlPnHL/67L8mK3nnpyVAujhLHw8EM2lfhAG94eZ/omCtM7CW1jgYjrR7bkoFs0wu2d3dbm7HD8bXh0H9hP9eY+lpbbgzT0gp9SmzBwVz9HEZxMLqG5vUl7dvcmhVDLyBCWQ9U6nL7z1ZFXIOo0y3Y4bwbgX7TKSx+wlaOgv1iC9BGqD8ITG1x2PhzY1HoNKEq6ENkvkwxE9c3HttWvELhVF/146vtsopfeRPKrMFKp3Pb6Ne9icTxpmzyq8yJ14uROggPJi1wxNrqIqq1L455X4Tcq12g/+2ETRRbpV6PZxbVbU3pn9VStjE7imjVJ2lx4KeIYoxAnAkEl3VFt6/xg3XnTZLDQpUOCN3UTyALdrZ1tAz++nJKfqRE8Dh1yQp2h+5S7VmRBhjCr7nObZvs7BhSyCJZGfqHOcz5ih+/Ayv8EHTHW+C0GL3NVcznZNska3McBMlExUiOa5MzWNIn7clNAXcGXV223lk+2Zq/vu9FKfuRTP6usd4GwLzuyIw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(40460700003)(36860700001)(70586007)(70206006)(316002)(110136005)(54906003)(2616005)(1076003)(16526019)(478600001)(26005)(82740400003)(81166007)(8936002)(47076005)(8676002)(356005)(66574015)(7696005)(426003)(4326008)(83380400001)(336012)(450100002)(15650500001)(40480700001)(86362001)(5660300002)(2906002)(36756003)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 21:14:22.1261 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df954c5-9204-48c2-7101-08dbcf56089d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8174
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
Cc: Xiaogang.Chen@amd.com, Ramesh.Errabolu@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In amdgpu_dma_buf_move_notify reserve fences for the page table updates
in amdgpu_vm_clear_freed and amdgpu_vm_handle_moved. This fixes a BUG_ON
in dma_resv_add_fence when using SDMA for page table updates.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 76b618735dc0..b5e28fa3f414 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -404,7 +404,10 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
 				continue;
 		}
 
-		r = amdgpu_vm_clear_freed(adev, vm, NULL);
+		/* Reserve fences for two SDMA page table updates */
+		r = dma_resv_reserve_fences(resv, 2);
+		if (!r)
+			r = amdgpu_vm_clear_freed(adev, vm, NULL);
 		if (!r)
 			r = amdgpu_vm_handle_moved(adev, vm);
 
-- 
2.34.1

