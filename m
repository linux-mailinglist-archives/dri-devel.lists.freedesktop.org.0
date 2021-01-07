Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ECB2EC884
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5093C6E3F4;
	Thu,  7 Jan 2021 03:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4266E3DF;
 Thu,  7 Jan 2021 03:02:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTgnxKNlrjFmQ/qix0Z+r9vDcrtYJdmmu2YF+NzR8VEMbvKkAuoAAD/oxd/U6G+03D7/dnhtn9sGoKK+AevKK6m1CzAFCezlQf1bFYW9sUVGp0rgxURaHFwwM8/31Qa2aQrTBi1znFod6FvX/q43gFuV5RVtEX1uecfRFxhUCTNWPO9rNjWbINH+qjUAAGYCSz4e1HrTI0Xc3nwLA8tR6TL15s7pfHcZWo2oUBqTBBdGxPKVpo++REzgTahQzSZ/efLz/YNp8CQGB36K/jlez8hNrioCQySw00MHYUxFIuFhwrMrfomXc61PmpcuAJ4WYjBlDOYftoVtz9IPpdBClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vu1EXYHwu8iMOx53Q9d3zT+2pRxkdJQiJkPpGdyfU60=;
 b=YnPa3a4nIB/ugWNjqYP6lC1UJ2/b+7UWt/9GMAiVaEwUI+KQeEHGFdVyqi0zwjxAOnTk8fQvKnAenmLQwJYZWdPKVGFVoHaNST8pShM+0EcLYpmnVpDzQYsYWw2+gOOoWo8FA2vnZIWr7NJfpn3LvDljjcGNql/dMykg+XFacRPzPe5A20nBY+AOTEpqCcfo+8RWQBd9DPCcYDdiVk2rNjwMgSI0/WDlHCSIlZHSx2mSBhETIibPgltdDOkv1zIgEdtVmiLn0L6oVzEBwzddMHMauNHwd3dL2tWWH4JacYGKE2ncBZ6eKP0MvPKfgIJmAwuiQQYRtxXO6Ef+hBcNAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vu1EXYHwu8iMOx53Q9d3zT+2pRxkdJQiJkPpGdyfU60=;
 b=bk0ClkR+hBF4i1IyXGV/fSTGoPUB72OvEm/bitND+9QiIIsDCtkdMnQI32F9GTSmZvuVCQi/E56MgqnHR+q+5bbFNXSGl/P2TsM8+NpQhK/ZeHepo6/7HK18fb3xjzBoqvdfDbdXK+w70qD8FEqZXYYNyAh+Ep9hUkIYwCcPYfk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:46 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:46 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/35] drm/amdkfd: select kernel DEVICE_PRIVATE option
Date: Wed,  6 Jan 2021 22:00:53 -0500
Message-Id: <20210107030127.20393-2-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8a02035e-f84e-4c99-00fd-08d8b2b8b5a6
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3999CFDDDF94A702DAB0FB2E92AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OsZJl6s/TPmlB4ljM7RjrNEu9c/x6sG3DAtQUI+pQZ/y6LlAX5iKdsmQjrc4hURYm8znF3QzeeUJG0JNpaoPID1Q96vpoLCce5bdWRedOA7yDIf1VtuY0h/KjBJC8LA0iLQPrmIxq13nQwWr/WKDOzYwhw8z+tKWCKJK8uWWmdwukXlHWe/qYLdXGEwLSl5M9cj0v3mjLToEmCYkTWRezJeEYdvhmeb2BvQvblrvtRkH4j7TiEutZs97dzDzZ542jVs7GweeKLViPv3enUQt/cm5Amxe0rXQ4/x15nyd2KSErX+P9nmrAM/lyItI1ck9K2HAKQXaEaiFbWwirnRgXMwaqvpcR7qXL9Avp+JrSI+kOFghpwrkzwUfZ33ABbSKsvJA/MChYT+JY0Pb/8cJ+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(4744005)(8676002)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lHYS9SxITFIzx4c/WIVYqmuwkATrUZIp5vKPJy/u+g/mJx609gPENcuBZb78?=
 =?us-ascii?Q?xggiYRkdgD4ePiR3UQJoe5C6ZSeHsx1Q4cksfvo7tifbOHDhE7I+gEhhWYyV?=
 =?us-ascii?Q?KAyr8ZW1Xw/yrNEU4mFf2SkmTUYKs092CXophZlwM+3OcqrwEI3M4NjgR7p9?=
 =?us-ascii?Q?5YidZZvKewQO+9XS5KR18vVGHvH9knkEvf3obaTtH4CSwB74kttfFz3pZ+C+?=
 =?us-ascii?Q?/CZBshWGb10uL6riDUUgs7BDQbOFL81Tes0u1NfjhHfFMUvGq+CUMI30Ip2d?=
 =?us-ascii?Q?loTX3tK2VJNwM+vovXNpVLR3fNOJhFx7IJf/49iF2JZIxgUIVTF1LyaX8ss9?=
 =?us-ascii?Q?a+hFgOPEDKUIdV3UcjrOCKMQ8R4TEhMhRRUgXDO1twAKOwJBNswDQuHfyakh?=
 =?us-ascii?Q?Yh7u1/k4nzXTeF2V8WXlU4Lg8rRZRAPHD4XmR3JowUcXjPqv7JdrE2PyrDIx?=
 =?us-ascii?Q?I+98qQAYrOKJQ4zohYqRXkgqetAtoj2jvK84QqJ4b1sOiikaFU8KTDZVeTaN?=
 =?us-ascii?Q?rujjT0dqfSLrbBpmXnDZAmQZcoocLT1mcO/zFgVKl90T+nLTwxOUfFK98sH8?=
 =?us-ascii?Q?JlugYo4aUK+Fyxg0pH/wgROaGvJwFw572Hxq5Pa6uheEZ1SU11A1429ndf9Q?=
 =?us-ascii?Q?A4jKp0EhKkRCGSXIpuEZFqZNbrej9HdISGk0sm48MF2PZFLx4olSoB0r1kn2?=
 =?us-ascii?Q?y+bXcPB2is/kCZNfkgJKtfaNo2APCSKEf5ujq3NqfLFZFMGWuKy6alezBmYr?=
 =?us-ascii?Q?uzgLQ9nrpqmD9BNQ3MaAec5zYvZHd2P5Ndgmrz+hLElxtfSFHn4czNqyKgvg?=
 =?us-ascii?Q?iy0e9p/YqUou+JAhGMZ3UbiTZ/gBm0ztaXgs2Pw/qn9NcbmsCV/Ro8ycp1Pf?=
 =?us-ascii?Q?Bg9C9lSDZWWPp6yf2fbheX3S+T09evDxTT+X9mSMj3A1zWbHJvmrQAUWYdxX?=
 =?us-ascii?Q?NQf/C+wd7FKPcA5rPU9wlaxSPgFsjk567xwstqFkafKOsSdlGQdp9WDaOsEd?=
 =?us-ascii?Q?Cgkb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:46.3739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a02035e-f84e-4c99-00fd-08d8b2b8b5a6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qeU7x+xQwYF30c3VKuXiA4A+PUBLMxWfrIGIvmBvEsrk059870y9sB84TbaSQ9kQzjHXI4Gf97PN7SYTYrMHWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
Cc: alex.sierra@amd.com, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

DEVICE_PRIVATE kernel config option is required for HMM page migration,
to register vram (GPU device memory) as DEVICE_PRIVATE zone memory.
Enabling this option recompiles kernel.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index e8fb10c41f16..33f8efadc6f6 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -7,6 +7,7 @@ config HSA_AMD
 	bool "HSA kernel driver for AMD GPU devices"
 	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
 	imply AMD_IOMMU_V2 if X86_64
+	select DEVICE_PRIVATE
 	select MMU_NOTIFIER
 	help
 	  Enable this if you want to use HSA features on AMD GPU devices.
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
