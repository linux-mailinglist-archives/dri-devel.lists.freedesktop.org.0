Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C538B3CA969
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 21:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C096E8A8;
	Thu, 15 Jul 2021 19:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120C16E8A5;
 Thu, 15 Jul 2021 19:06:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8PMJg7LwmBDxWcItDoTiY+rSJW7LCdOjMpFR+OnMRumlyGwNXBgxGJ6hWIvdwJb3c9oEHkvVbzU4ebjxgUvSZeIFtmhCIH+ZoyMHvvKpdky0D1+UDdMIDUFphRYnn8N5v9oP4sKAbqdy5NhmD5nxQGCUKnvNyhvEob4QJjbU0xaJ8cjM+KEp4utJxLQT9iLgAeehlqhfDgqlOZm9XHKbKKKGS631tnTY4rx1bANwpBrcg+LOz+FVfeOQzPMn3I11rw+oZU93m9DMaSdG35rGeimy02d5Zr8fPpsEeW62VNzi7LQb9K1+R5q7Je1ixsflBJNnmBasTg1Puf1Q5M5Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=provifNjivI/IZ8V+b2/h5ZRyzp9SQWU6Vt3bQVDrAc=;
 b=MGvak5J0JxYUGCWBrhT2DYSl10y/YnwoSlh7hxyo6M5CqAnmhstx/Xqw3ty6RXXIOTHmBfVkOQrlAH9lHqSyEFn6p58gZi0CZ9+8pHUWPvzKvYoqMJXHxw9M9xYVqMY7QGMqvH5ZKy/jKr+YwApnD4Gy1v5swpiRGVIwCvmql6PQat1R0zcpJ873xK2jKEKnJRnDk924LHEet9t6MGJntOweRv0kHNSr7nOucsOZMC3PXqBA+Dr/dvslTX2A7qvQLhsTwGCYpI9JjOCnseF5JTD7Aah6hvlqorGwEY6ajXtQNW2B5MqneqW4vwsQ0amR8MW+bOQf5IyxCm2hNlJKSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=provifNjivI/IZ8V+b2/h5ZRyzp9SQWU6Vt3bQVDrAc=;
 b=S00PzfJFuh787UOvP4yDAqHAg3yev87Iw/p/fsCZ0OMadwmRgKDMFcwt6exG9p5NDZPrrJs3V86v0GuIniHrlf6wd+L3T/WohtblAHHEYAJwrcRq9H979tUB1mdKkkPCWM7Kvkx2KMMCsJWeFmVSLKZG9v05znWh4+fw+zgKbxA=
Received: from BN6PR18CA0020.namprd18.prod.outlook.com (2603:10b6:404:121::30)
 by BL0PR12MB5556.namprd12.prod.outlook.com (2603:10b6:208:1cf::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 19:06:07 +0000
Received: from BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:121:cafe::a2) by BN6PR18CA0020.outlook.office365.com
 (2603:10b6:404:121::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Thu, 15 Jul 2021 19:06:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT042.mail.protection.outlook.com (10.13.177.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 19:06:07 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 15 Jul
 2021 14:06:06 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/amdgpu: workaround failed COW checks for Thunk VMAs
Date: Thu, 15 Jul 2021 15:05:37 -0400
Message-ID: <20210715190537.585456-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44378c5a-d66e-4e5f-2f62-08d947c39a0d
X-MS-TrafficTypeDiagnostic: BL0PR12MB5556:
X-Microsoft-Antispam-PRVS: <BL0PR12MB5556C1B33895A57BC6047EA792129@BL0PR12MB5556.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xKH3gGP7v43xFUKmsxZzcwqqajqzMq59oCNcAUusbRzFo61EF32CdFfJHkyle6pabgH7v6bQw5KpNvUebJmqp+wjb80roIKzepetPZ8RoMhAQ3vPmcBnR/eH/NrL5hfZZoi3Kj8qdJkd9gEM0FIygGbwPL7r0B4fA3WCP4/KGLN2rKjTGN1TExJ2zpiSKzoX+ljj2dlW5T89jSisvQiJHZ8J3cN/TX/rzbKSxLZqVKsQp7m4wFNuq3y3IbIsE41OCTQf0EynlQxAlAPb1RtvOPLUvvXJRIsvhGPd4+w9z78nlkcKrz/TwT1VtDvHzR3XLTycyJdRCJI4SBgfB6erlbQdg5klUJ/+b4j7qRJFuyXXBCMH4D0CtbGFelVT8S6YdsLf07v9c/okj3vHxe16NVvZUtTtFEf/RZFEzJGL+ZXUligndEgUL3eCMGY88pZfNSb3THofi4xUvY3tFkyaHimuumdUI80iAADH0xtQlwIntropNXPE6XGUsurLR0hpW5gtdBk22GScGreI3dZfG7007nUT/pMgJZ8NHfN5wKf/aGw6wj+UW10npMHzXBsLZbN2OL/jiBJ7kyzM6QgOXYG68Uqu8uBcB/8+bkvXTsaWLfVjXWt8oMHK2iofFlXVBkPuBS0jeiSIGtltAVAwBE/wQnfYepjN4FhsMJq3SrxmQ8O5Nnv+B/hBUlWWoVHweeUtOzWjOQt50fYjD4WBaaxwsz9mKkrFWFPTqUNtyxY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(36840700001)(46966006)(70206006)(70586007)(8676002)(4326008)(16526019)(478600001)(186003)(26005)(5660300002)(8936002)(6666004)(1076003)(336012)(2616005)(426003)(81166007)(83380400001)(7696005)(316002)(82310400003)(356005)(2906002)(36860700001)(47076005)(82740400003)(36756003)(86362001)(54906003)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 19:06:07.7826 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44378c5a-d66e-4e5f-2f62-08d947c39a0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5556
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
Cc: daniel.vetter@ffwll.ch, christian.koenig@amd.com,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
is_cow_mapping returns true for these mappings, which causes mmap to fail
in ttm_bo_mmap_obj.

As a workaround, clear VM_MAYWRITE for PROT_NONE-COW mappings. This
should prevent the mapping from ever becoming writable and makes
is_cow_mapping(vm_flags) false.

Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
Suggested-by: Daniel Vetter <daniel.vetter@intel.com>
Tested-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index b3404c43a911..9f952b7fc197 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -255,6 +255,15 @@ static int amdgpu_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_str
 	if (bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)
 		return -EPERM;
 
+	/* Workaround for Thunk bug creating PROT_NONE,MAP_PRIVATE mappings
+	 * for debugger access to invisible VRAM. Should have used MAP_SHARED
+	 * instead. Clearing VM_MAYWRITE prevents the mapping from ever
+	 * becoming writable and makes is_cow_mapping(vm_flags) false.
+	 */
+	if (is_cow_mapping(vma->vm_flags) &&
+	    !(vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC)))
+		vma->vm_flags &= ~VM_MAYWRITE;
+
 	return drm_gem_ttm_mmap(obj, vma);
 }
 
-- 
2.32.0

