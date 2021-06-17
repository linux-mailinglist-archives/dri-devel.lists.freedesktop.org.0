Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDC43AB73B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 17:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2802689B8F;
	Thu, 17 Jun 2021 15:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BC689B8F;
 Thu, 17 Jun 2021 15:18:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJuw/8N4y0aOO2900C56kadzglwt8951V/EThqWig1YNSZyvGmwE0YbhoJnSlEtCzTLt8xKXydF/NC7obrmVvAI3ahxilbJ4/alD3lYIEzO0svtxQrCn3LD7CNpvMhUgSQUFpUZq/x33MjPUrXKysXaDo+7AUM3pmIkDz4899R0K089Zo0RR7X0qSSoytXYs2alYTynJIFeyX1GONcLSLXVQCVFdapLKo+2jnWvaBKI62qgr/xXCmMNa21IoW0RI+QPWIo9SRqDEOfrYIXuy19d3y2w87qz1T7FUzm9cLAFMkY4P0ILnK1jlkaQpwcxo7I7uXHvHJ7Dba7Khjmh8WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPKPnrddVPbEN1uQT1iXLcCa/cH/uvZqBGSpkg+C9cA=;
 b=ibLDxYAvcIVRpe1nN+u5MIgt6XdLYhQka+z3zGi0kzWpTL3ZMUF4A11/RdSb6uxa0GIfbeqMfdnIgsNHbf/LIbnbkjvRMbYY/p7yPUW+JthGtR61szKmAZ0V6fmWI7m/bYCT4/7E8FSnfuEp5pI6D77CkEIPUyVzGDXwUbye0alJ0H/On2O1vpa5oPELSiL0u3HYKKG9jtx4uKGtBASVaLsidF0noCvCM5KofM5biSdwjSsfCg6cAb2HN+U8VLQ9h1FJTyrGuy2zfwtALjAWB9lKpS+rhE0ve/rhS8AP8t9VkffI3RZ1Phx5HgFQpB7t04D3hBPhuFy9JsBSyKOEmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPKPnrddVPbEN1uQT1iXLcCa/cH/uvZqBGSpkg+C9cA=;
 b=Vqgjnk+bUMDIWQwvDUkffgbOyIUCqOKuR2owfcD4Q3CQsdIx9BS+BVOlAMTe5XScQJmPYZV7ZI6QwkkMqQnPRbeTRzPY143eaxEKoK1upnHLQD9mk+tGR1AbdRibuYVknak3cJzZrY6SrYfXbHMZeoikitqCfWEyeVquxN05lZo=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20)
 by DM6PR12MB2970.namprd12.prod.outlook.com (2603:10b6:5:3b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Thu, 17 Jun
 2021 15:18:26 +0000
Received: from DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761]) by DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761%2]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 15:18:26 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v3 5/8] drm/amdkfd: generic type as sys mem on migration to ram
Date: Thu, 17 Jun 2021 10:17:02 -0500
Message-Id: <20210617151705.15367-6-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210617151705.15367-1-alex.sierra@amd.com>
References: <20210617151705.15367-1-alex.sierra@amd.com>
Content-Type: text/plain
X-Originating-IP: [165.204.78.1]
X-ClientProxiedBy: SN4PR0501CA0088.namprd05.prod.outlook.com
 (2603:10b6:803:22::26) To DM6PR12MB4419.namprd12.prod.outlook.com
 (2603:10b6:5:2aa::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0501CA0088.namprd05.prod.outlook.com (2603:10b6:803:22::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.9 via Frontend
 Transport; Thu, 17 Jun 2021 15:18:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b350ef04-f328-4fb3-c8df-08d931a32768
X-MS-TrafficTypeDiagnostic: DM6PR12MB2970:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2970575441F3639B1AAB8E8BFD0E9@DM6PR12MB2970.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4cwWoqgiy58PVGX/pnQCMxRJifqV4eE+vtWeu3E+kjfJa2F6eEpqGcba/Lblfh9bNLVXXNBnTLniFW+vY89M+X1VXF8jVrAR1dOWxUszsTBe3H8/AwhTUQ3Zac9LyxjQAYY54M9UnDn6sK7CaqzFK4ghNkmCdtl4atd7k48Y+7F/uIsY7QJxXDk9418tBTJglxcicDrzEhTnQLnDM3eCuIqtNcgIkG0jw+38JEzNe+OQQk3N8ThI13Zm9zG7bEEtLTg2B/R7s2Bjxr8qQljbUX/QzekeiTuW4BB1eE+puBYz8pX3egEycMQrJuJDqzk7qglTIGb2ejJQiDTGVZhOnkq1oYiLsPTjFsFFyW8efnMf8Us3M8xxo2b5FH45VqvLMb1td3oTjjy7J/nVjHjfqT8o5Mzcxl7Bzp0fnADnnYboGdiTl+2+uaXMHLrRt4VoR+2v50bVe/7o21sjaVU89zN9HLu5TTrKAMmklTGcaa6EsbSm+xaiFFd8R0iWUpZ8OiJxSDM9NZZ4oEFZM8TW8x6VQQxCA622gxnIVFk9x0ZmlfUVwy4szPlzSkAXw0y1XE2tmoVlILIvGJbtugzMbHlrA/wJAdB4fH+5gE0leYNsh+tfWykEOmaXbTqkocVoZxH6V7BKVF4k+RTRwN+AkYIn8/b8wRZFwcoElaYJUr7F4NjbIhwSdnLoQ5Y5MEbK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4419.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(83380400001)(8676002)(38100700002)(86362001)(4326008)(26005)(316002)(2906002)(2616005)(1076003)(38350700002)(956004)(16526019)(66946007)(66556008)(44832011)(478600001)(36756003)(6666004)(8936002)(7416002)(52116002)(186003)(7696005)(5660300002)(66476007)(6486002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R66+5ePq/PBySwRySrXyBeo2wBczzA+U+CvnDGAGryk+u19hEY+ppqj9tw3X?=
 =?us-ascii?Q?pRpznljrhGT+gd2LKSb3pY1TC3ZnvntFw96QhqYTFurwwn/LUHSF9qS9PJjv?=
 =?us-ascii?Q?MIqxRDZeOVC+eUW7aJBsVdJaFgVmXlnOQK7XZCw0zXybxTYmCJ9WUQXIZ1Hx?=
 =?us-ascii?Q?KgYmBnkrKBYsxWaIptDrh2J1rHDhkLzztyhTGTBPQk6c4/YW7xj+01pahmX9?=
 =?us-ascii?Q?NkmL51MNe3WxLGMl8pkn3buHAea6HrzWTjSaOYdo4FXHFtTMT+PvvZ7hSxz9?=
 =?us-ascii?Q?x1xKE4g5TzYCj6ui7i6BJbXORnt2Mbn+DtllE5pna86OWylaboa5UjYyAUCh?=
 =?us-ascii?Q?nQ6ysPnM1zajLng8pbJvqXL9RKDl/687ag48zFAV84rrXM+WKkhNi+xHKGKP?=
 =?us-ascii?Q?CkKWIxPtZ42NAcK9ooWJ86NfCnWJyBkBc4BO4k5w+ZnQrFXlaloO4ytOCYrB?=
 =?us-ascii?Q?yPOhDj0mshH+v3Prri1ivRfgkQUpPr2oCVmhyfuswbL/T2u2gwKDoGUMiAGY?=
 =?us-ascii?Q?sA1DUipwmoiBhfTiRaRT1dUnghf2y2Df9pcUJv1n9jVB+Qq/jCjE4v8y8+DF?=
 =?us-ascii?Q?IY2sLcA5q96kSv4MMDyHHATPFp+ppLiONA9To4xPtEtRS03x+3/g8CUCyEf6?=
 =?us-ascii?Q?q6h+RaEGKWawi9o7xQF3Ld6Xq0eTeMsEraLHQ/fQfREQQfMetsLnUEloAKO4?=
 =?us-ascii?Q?rYLsowY38r/3HAS0DbUCpp7YTbiGsCXu3yyadkrHKGOPwO/Rd8VvU0j2kTxG?=
 =?us-ascii?Q?/iECkNaaxskkCMHD/Az4sG7tl1XlSa2It0Hywv7cqLzcDpxuFMB0Wnb7KOSg?=
 =?us-ascii?Q?gbSLbkoFwr8mN2TTJlegOyEwujRnoMCG6dY9dp14SEtuuX0KmJiT+CY7GOAA?=
 =?us-ascii?Q?PgHQsNtBatQ/mq28l3XdbcuQTcxbPgJ+p/wCObLo4jNzCmHfmbiogS/As5Lm?=
 =?us-ascii?Q?LZ25VWwzf/fScHn4fPSOsGBoc4RzNFer00a5JMXn3iW0q66A8WuprjA6s/aS?=
 =?us-ascii?Q?zOg8RFmJFP2LfFTYlvKxnGEtd1sjddB8kADP6eGBl4+f9aR9IiOzxuikrUfX?=
 =?us-ascii?Q?eswwFDRJ/CnupVHcD4KiGMg4nc8smXr/2oTswXnyTyg+WHJQ06a2vXw2H1rn?=
 =?us-ascii?Q?iWo5PjV3pkpHi/FT1Iy86625GOyq5SSZvehyEKHO5Hvy9KA+GCgWX6uP4+9o?=
 =?us-ascii?Q?+Hggbu2GfMaPWhomlccgEhRDW+YAlBulkky55N8vSVIv1CviIiXahVsP3s+o?=
 =?us-ascii?Q?p6Ymg/5XORZUfi15LuLUv0p/Rnzn2RlmxE1yLPuLF6zN6LJ8+5ijHMnQLPkz?=
 =?us-ascii?Q?F1Cf6ozTyGiT7PSpVJ+4cUBs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b350ef04-f328-4fb3-c8df-08d931a32768
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4419.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 15:18:26.3112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0gK5PufHGXsAhqrpJnZpzokBkuLGJENMqGkqg8K+AhlFOcgHj8Chb7omRLoz5hsbZA2bNUSoxVdN4vhMz0ILw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2970
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
Cc: Alex Sierra <alex.sierra@amd.com>, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generic device type memory on VRAM to RAM migration,
has similar access as System RAM from the CPU. This flag sets
the source from the sender. Which in Generic type case,
should be set as SYSTEM.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index f5939449a99f..7b41006c1164 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -653,8 +653,9 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 	migrate.vma = vma;
 	migrate.start = start;
 	migrate.end = end;
-	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	migrate.pgmap_owner = SVM_ADEV_PGMAP_OWNER(adev);
+	migrate.flags = adev->gmc.xgmi.connected_to_cpu ?
+			MIGRATE_VMA_SELECT_SYSTEM : MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 
 	size = 2 * sizeof(*migrate.src) + sizeof(uint64_t) + sizeof(dma_addr_t);
 	size *= npages;
-- 
2.17.1

