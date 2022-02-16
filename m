Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809FF4B7BFF
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 01:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8DA10E1C8;
	Wed, 16 Feb 2022 00:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A1810E1C8;
 Wed, 16 Feb 2022 00:39:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fghUccCG55JAvWziz7PFDTvnebiW+rzdndf0xL3hi8rR15PXbiX4vw/tgKxF41LznZTbsGzJ3ovAoFqPj5YsnmiCXHgb3I/BJbHNSATCrLhqlzoY64W7beLNQ9x+NAaR8fqbuhUjMis/vzIvMaZG3ryT11UUiV/zH+ZALrn2hbISIm5F/v+aBNl7bPFBw63ft7qysynp48K7nijA7IgdA6SBlRQSn7SrfJd2qIhD/g0SpAUc8Moj+8Ngcwt2d/vmHXOU4qDj1YIW2hasL0TmkxVZQB6PNHsGBEvHeZQQur8DXgh9bD+zX1bWk7ol0jHWVKH3MPuuFCEmCwvMThmh8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wez8RS2yjn8aMEYps0U/bxVEiRmHW7nkA3iLUJwlgs4=;
 b=UP2OqXUnEBmCPCOFGqZb4Z/qO/obNod7+LHutg7bcrRyh0aYyiHamm/7crXJpfbQ26SH6tEa6JJQraX3g6vhfMleEYpOHrwtXt23+mtiODFp85p6sdamqZuRXmLz81k/fHhlBQxAg+fi1nT4+qg1/yEfHJHqrsDdn5ECY0P5pP99HtsSgXL51CHPktJBkkszMxhn5LVqRQz+1KV8mnoGD2PTOZhAzkoNRHrNLT3Y1lLm6te+8ep3jpzvpSGVCxQGP/Gto2OTJXzZJ0LqR6CfF8NpdeGd0gy2Ta21iLa6luQchn4YcKKvaH0t8tKu6nUMSI0SG82713c8C6IHeD4+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wez8RS2yjn8aMEYps0U/bxVEiRmHW7nkA3iLUJwlgs4=;
 b=pCYwFTyqGqT1K9GnpVnnwD34qnJcokrRagZVtUOOggKaiD9iKGmsZHjPomu5TJz1UjoMl0qyyHWaIi2gFpDvduHI8gbpyayilRpc+qWDpe9SLzZhx2ugk7+XaMNZHPScWqzkmtHAZfZZ4XlAh/LMHU2ZE1koyY1LxckiQ1U53L0=
Received: from BN9PR03CA0076.namprd03.prod.outlook.com (2603:10b6:408:fc::21)
 by SN1PR12MB2557.namprd12.prod.outlook.com (2603:10b6:802:22::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14; Wed, 16 Feb
 2022 00:39:04 +0000
Received: from BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::9b) by BN9PR03CA0076.outlook.office365.com
 (2603:10b6:408:fc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14 via Frontend
 Transport; Wed, 16 Feb 2022 00:39:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT063.mail.protection.outlook.com (10.13.177.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 00:39:04 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 18:39:03 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/amdkfd: Replace zero-length array with flexible-array
 member
Date: Tue, 15 Feb 2022 19:38:41 -0500
Message-ID: <20220216003841.1419615-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a8b8e83-89f2-4e76-5184-08d9f0e4bbde
X-MS-TrafficTypeDiagnostic: SN1PR12MB2557:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB25573895437429C2F11CB57C92359@SN1PR12MB2557.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 61TEuA7pd62iLHeDNDOxk08cJt4CpRZqqRZMNEreM5j5zzRvmebijUwCNLkwlq+zfAbQQXNOldefAIkWBtqxxOnVTrf+5x/XxKqJlqeuwuvWBHUKYnDkaEVgfUL7gRQJ/JqPIlA8Ce3zEt3wk/GHVx2ZLkmYy3vgivUf4+gE+WDlrp4HEVEaUkKyJ9YhSRcZWyOvyZPfDhelGdCLjrF0fYE5nJ7zXf6cAUEeNFfjLZM3h2tUFCBniGljdjGlJKW22WFteTbYiTXVDDdIQr9aHeURqSXKebnr3Vfd0R2hA4upXjCZBw71p/OwJhjhwgvZM8BA3Y3ot3Lw/vBy+Xw3ojw/d65d/j2uGPgaad6wm28N6LksLMCn38yMfiZXhTsBJrwEHx4l8ksWWiyO784sryBe3slpUZAOkyIWoO0jQk5n7wXyIHULpzQAQwf8N/Jy4JY0SCZCyrMQkMXSP7/W0hWgNw4g3U/XBzLnUa+cofCOnyDZoUCoELDMDn+jOkGe3q0D3FoTGVMfsEvF9azbt2o7j9hHOCXP6QYyOjJDumQdkhR79hh2AUJ5d5P8perC9lr29EA7F+fRnVzXKhOb6tHT5x5sLbAsNgN3SCoLN3dRm0udSC8QWq7HUsr/Ne4+4Y6AmmbPDMRF+gP/0iivNOrfdOOS5NVzuTLIi1vYff9jJHIDAPhK2QRYQLFojcnZVFoSF2Qlzb8Ric7shtZ0oEyVoZ8tlopx059zDCabbyh+2n6ftRM32UuVt23GTLgL6vS746PhNDmYp+bz4NvIlE64LFsa5mVQyfFUQCQ7/O8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(1076003)(26005)(186003)(336012)(47076005)(426003)(16526019)(2616005)(5660300002)(81166007)(356005)(82310400004)(83380400001)(86362001)(36860700001)(36756003)(8936002)(4326008)(8676002)(70206006)(4744005)(70586007)(2906002)(508600001)(6666004)(7696005)(54906003)(6916009)(316002)(966005)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 00:39:04.4286 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8b8e83-89f2-4e76-5184-08d9f0e4bbde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2557
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
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, Changcheng
 Deng <deng.changcheng@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reference:
https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays

CC: Changcheng Deng <deng.changcheng@zte.com.cn>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 include/uapi/linux/kfd_ioctl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index 6e4268f5e482..baec5a41de3e 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -673,7 +673,7 @@ struct kfd_ioctl_svm_args {
 	__u32 op;
 	__u32 nattr;
 	/* Variable length array of attributes */
-	struct kfd_ioctl_svm_attribute attrs[0];
+	struct kfd_ioctl_svm_attribute attrs[];
 };
 
 /**
-- 
2.32.0

