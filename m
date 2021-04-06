Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16295354A89
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658FD6E563;
	Tue,  6 Apr 2021 01:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AD26E1EC;
 Tue,  6 Apr 2021 01:47:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gY8PMNsxW0ONPg11wmx1y+kQ/iamTRteJiP93q7nqP9/YrYgFIcv6YgiZ3wQ/XPVm3n0vV1YcmMGLPC6HyWIWzkGwKoy+xZqlTrv834hsT1T9lW1NUkB5zP9W9lkHlfWXBjmiahcxiUeBwGZomwszydHh5R6RMbswuQO1rcqQ1Q9+GfKOEm6jtLzabLxiw84y/oiVKbvJleQGW0r88w4edZl3wCdOGoDv14B9wmtOHILuTJAALx+opEKMA0VydpenON2+cJmt5U0w/rw2/gMFAax+MUfpbIaA/gDO5DH6+7YPRUIiLgTkZ1A8OA1uBmIS1jIzh+kG7Ddugpqgg2V2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBJ9B88yrqq7Z0VgTHm/lQSwunuvuay46RduyUlWz1U=;
 b=W/BmD4wnamjXoqfJcTAgqRDgVG+g2TZn06WoTM648KxJnY5Lk4f8CVvoVhOe8U2HNOOBj5tsgZfo1+8E5paeO7aSqGlP3FLfsyBrM7pDmdMbeo2F5d1y9+SBsYgbTlb5ElO+EGzLI9ZN8XoTSsaMSxciirfVaPp0/BxDFOia/RtPUplSofftXGu+wS4PJicXCPUfkXLg2hS8m5cXDvQBPuV4NkUVp4Z1ihLgv+H61nuIPlp6QayrH2lYUoZRAXwE9ZVG0+wkhR+BcTC+d3MAvoNNJ55WXGWr4ouTgc1OUJI2ofgiNW9Q2X+1wGTjxH6f3HHOTz/e7ITkhQYXgQqbQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBJ9B88yrqq7Z0VgTHm/lQSwunuvuay46RduyUlWz1U=;
 b=MXBHFdQMdyJljFX7WsRGWXDZAQllkcC0R33NcjTBvxEsYbmbNXADmAVDMQfCWxMj721Gr279HnWuxsnsQUUGDK2FZNWfVtxB98v7ikDvqFiPe5VCYWcxy6tXZI7i6nPpmfauQoU+n9t3pSRUmVniEgTLi2fXLX5YIU6CpWIl9/8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4159.namprd12.prod.outlook.com (2603:10b6:208:1da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 01:47:08 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:08 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 26/34] drm/amdgpu: add param bit flag to create SVM BOs
Date: Mon,  5 Apr 2021 21:46:21 -0400
Message-Id: <20210406014629.25141-27-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a0b872d-cc6e-4043-0950-08d8f89de364
X-MS-TrafficTypeDiagnostic: MN2PR12MB4159:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41596D45A80E1468A10E99F292769@MN2PR12MB4159.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6h2S5n3qXe1FGCslbXQ+hgXvcE/SZjiUQqt4AEjlj5JVxMQhJ+tukKpcg+t+w2X+sZXz8u6WLHPWKEHHHauJLUrnyKRTmEa+d+B4aNMRRNPDbVGyotUiQ4D/K1uHT+wtBnyrb/etoMsFplBnmC0+VzUzL0G+ToG1T6dW7I/c1AcuF6oF+oR1S1xN37VYjcN2FNvfajk/DlZTWGz4ujoKhfiPwTfKrM3lERYXHV3TTgyfpsdAzUx+yP70C0fe9wUeTQ39FzsGTHIbLTCdDy1AAJkqaEpKfJM4W/mswJNO/oFAehBFqMcQhhKb5tbpAzCCJlIhq5KZfzskoyDa1qh2eIKDBR+fQe/ra9e9HQtpEbwzx60cRV+JFx+8j+RUYlIEHYKu9AO+xoj1fcZKJwO4YksFwDFRf2uFM2Pejf/H+PVyoMWBt6urlo5tY3JEuomXmlhDQAYiXexyL4EhRUo9rw6yXrn+CuRxom5Bkta+D2z78zkYhhWNHMUG3PDHNY317lNhdy++WBGT4KIT9v2+On7Dn4AUG4pKA2CYkCVj/s2LCnCgd6GcHYc6gM2I4Qj1ZMYg/lrpwuno1qJRMhMp4E5tMADJ60xOfrkwzhxlQapPQBcu/Qnji/Gb2JzwUAbIkHuza3zqfNlRPMgvOo4sfPuPye3cT+bkwmz3x+8S08vTHt9HT7lfxlFarwPRt0WM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(66556008)(2906002)(66946007)(66476007)(5660300002)(8676002)(26005)(6666004)(186003)(8936002)(316002)(4326008)(83380400001)(478600001)(450100002)(52116002)(7696005)(38100700001)(36756003)(2616005)(956004)(6486002)(16526019)(38350700001)(1076003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5H3jUHD3B3e3O+nHZegyxbC8gUbV460cGOiK2ZzaezKTaVTdDCWzRjKm1gzX?=
 =?us-ascii?Q?8TCnyOEk1+Nbg7vT1BRjcOeEyGAn/9SnwqsQxbMz6VRxSkWODCPSjZ6gLyI1?=
 =?us-ascii?Q?IuOP36dBxF7ixHtsU9/NVKLdJYklGf0zJeDLS+QvD+UQ4TF6MAVr/dlt+zWw?=
 =?us-ascii?Q?Hue4jteLF3MJNIYiNQEWg1ZRf/IjCQyMCptuVHYAgLj+DmjcHjFmaSFDjuB1?=
 =?us-ascii?Q?55HpliWR0qysvyqhmDEDBdVj5odOw9pjUI1HJHDx0v6627JqgxJu5Wbry9rG?=
 =?us-ascii?Q?JQ0CkL+OLEsjnMSFWvgXTrcHmJLgSeWtETAudMdcJM1LLiGh9QkSOrWV3EVY?=
 =?us-ascii?Q?/leFLYVfbqLzQCaKf7whpldymNvX+8f/C7hi5BJvx4MvJngzkzATtULhnAl3?=
 =?us-ascii?Q?uAgbb4uc90uDwRF04aWk/JoXjpMA2W2vNF0JoL5IT6wdBpFBD+D9c2cn/Cfo?=
 =?us-ascii?Q?XSp0cBMd40A/CiQTEAPtGO+eZVcS9oQFLwPtyDV724kum0awBkzKnNuQZ4xc?=
 =?us-ascii?Q?iTKNC2YMihhp+9ianJOhynn2Jv6NkDxHkxlBxXI/dxccUYcaljQAekojwxfb?=
 =?us-ascii?Q?m9TDQF0D9el18kctKaZMuxnoBeel9N9HyI8Y08QfLkNsrWDJ9lDk7CPfXhmY?=
 =?us-ascii?Q?nP65dklCK87WLeK+zqrCY3lDk5kklaL6Xs4BukvuSeddr6q6kk6pHox/V2hp?=
 =?us-ascii?Q?gLufHTq8dJ/SdS5TOxUBjTzZ0ofa53KjMIOihcDR/OjgDubhJ1ct2fJln1C0?=
 =?us-ascii?Q?TTwOpThxjb+1an7AG9Tw1uzjxpYy0b9DczZ6uAQ+SEvS5x3NlQsRXH5ksqH2?=
 =?us-ascii?Q?PZHwm2fT3j/a2yI2GxLMiwzQqaEOzdTTllv+NvO/2XrLo213ZPBXBKyMjJVl?=
 =?us-ascii?Q?GIfP+XRmvj3BDkH4LfuhQw4p1bbkAj+QEIN7gNYGa2896SbNTbICjYubs4dC?=
 =?us-ascii?Q?vwtgj+/W2bt2IeFnI9VRiAJZmUa5FziYXkCMVWUx9OWHnf9m8/R5pwYtmfS4?=
 =?us-ascii?Q?LeaOlHhrEkqd7zUBi/qxfSGRY89cj3Z/uDymIiKMSC7eJD6go8hH4yQO8qZH?=
 =?us-ascii?Q?zsctc2d+oV6+MuhLHL0Y4H/4WGOsm+2HrI7HnDJlRyC4F+ty/sWK14l1SxRY?=
 =?us-ascii?Q?4a+0V9NwxsCDyXwkDNNXM5YM814mjvqGh6yp02kxHF0EILVYvyIvx74zmRxy?=
 =?us-ascii?Q?pT3igp+rtXFXMTsuWeyulsqT9V2GOXKmUEewXeT5Xxl+ZhIxy1cUhwn4/QkV?=
 =?us-ascii?Q?adCnOP9F9ddRPDUCQgE8R0SIfQJScOSOjj4rq60IzZ7tb6g/j59/DNyPiowr?=
 =?us-ascii?Q?u3b9vLE5+yiBo9HNtfdyaOYt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0b872d-cc6e-4043-0950-08d8f89de364
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:08.3972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHP7bgfnynE/mBkUzTzn7Kv5TdkYSgMzvnmPVg7tMczbSWSYJwPZO+VmY0J6299lQq1sVJkq6v7UAUvySgV1JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4159
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
Cc: Alex Sierra <alex.sierra@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

Add CREATE_SVM_BO define bit for SVM BOs.
Another define flag was moved to concentrate these
KFD type flags in one include file.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 7 ++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h       | 4 ++++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 9af644f256e9..bc38de8c5c38 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -33,9 +33,6 @@
 #include <uapi/linux/kfd_ioctl.h>
 #include "amdgpu_xgmi.h"
 
-/* BO flag to indicate a KFD userptr BO */
-#define AMDGPU_AMDKFD_USERPTR_BO (1ULL << 63)
-
 /* Userptr restore delay, just long enough to allow consecutive VM
  * changes to accumulate
  */
@@ -217,7 +214,7 @@ void amdgpu_amdkfd_unreserve_memory_limit(struct amdgpu_bo *bo)
 	u32 domain = bo->preferred_domains;
 	bool sg = (bo->preferred_domains == AMDGPU_GEM_DOMAIN_CPU);
 
-	if (bo->flags & AMDGPU_AMDKFD_USERPTR_BO) {
+	if (bo->flags & AMDGPU_AMDKFD_CREATE_USERPTR_BO) {
 		domain = AMDGPU_GEM_DOMAIN_CPU;
 		sg = false;
 	}
@@ -1278,7 +1275,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 	bo->kfd_bo = *mem;
 	(*mem)->bo = bo;
 	if (user_addr)
-		bo->flags |= AMDGPU_AMDKFD_USERPTR_BO;
+		bo->flags |= AMDGPU_AMDKFD_CREATE_USERPTR_BO;
 
 	(*mem)->va = va;
 	(*mem)->domain = domain;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 25411b2c4dd9..b07903d317e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -37,6 +37,10 @@
 #define AMDGPU_BO_INVALID_OFFSET	LONG_MAX
 #define AMDGPU_BO_MAX_PLACEMENTS	3
 
+/* BO flag to indicate a KFD userptr BO */
+#define AMDGPU_AMDKFD_CREATE_USERPTR_BO	(1ULL << 63)
+#define AMDGPU_AMDKFD_CREATE_SVM_BO	(1ULL << 62)
+
 #define to_amdgpu_bo_user(abo) container_of((abo), struct amdgpu_bo_user, bo)
 
 struct amdgpu_bo_param {
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
