Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0511B36DAF5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28416EB70;
	Wed, 28 Apr 2021 15:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076B26EB55;
 Wed, 28 Apr 2021 15:12:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gsj1pPvRprMSwVizi+GoKLIEv1R4L8ZZ9VCzuYFAE1ojNMOHKiLcG3VcD6ab1BYHKibrp31bSqUFY3feQ1QJ73vbdtisYQNQkFIv2GM7ma6vs3cTZKgDj7gZCUVCumHeBSv4hxC5UcWhAFAn6M94weHaSLW/GgiEteYSP1zE9XzSqkUxFuwnThXT8VDpHXE9AYd73ec7/5RsgmBqC5CYcgB0WPiH/Ra4QDsEiQenCfKim4vyi9HRhMJ4TfXQoZjUlbDCA7m9YthBI8LQHPEfvGZL6cnL1GQDVujxFX1TeuRmkN3IqZlnqzslq1L5fHExz+Zd7qxZffL1ufCRwtOTHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39EB68ov2WeP48MIIJQjZulb+ZIqexUKl7RSS3dV+VQ=;
 b=Y4HX33ynxIgI2oF+xKlwr11dj54xeLgkZVuRlzV8LevKuI/I1SZtaIGHW7HqvFg3KUgC7UqaCQfR2WKNy0Cao3HAgjSy5jE0pfF3Ve0CGYjbZK5Pak0F4E6ujFn1A2OscpUfQCTBCC2fccaFB6oQ+WkAxjggaJQ2fapkkTwflVgYsRwCwMTngG8nLHeZVY4R56C0RDXFqwAp2/aNpCwiOpZFCc53eB3oanMJRciMhQ/Y87zo9C6VSFLaCa/STchL2aknDi3Yi3juPjwRbjKTwjWO3Xzgf0TDpQDWa3VQHjGXO8LiSf8ndwxl6pZwlNhOg26+ZLwLWSK4Gcu2KmK2gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39EB68ov2WeP48MIIJQjZulb+ZIqexUKl7RSS3dV+VQ=;
 b=HVwqscvA5q8BPA0CV+hz4Q6rJ+S5LPLvGykTKfRXdsL1o0k2Y+mb3wqztFf1lbi7hkea/CY9gwIzXRuVDYMMgavx6yj1IQ/ckAYXxgphmFKjh8Mx32EiGvpPJqHSwUFmEcjpECoEYLRFqrc/e/oVDLEMEDu5XJvxmmXlPK0xI3s=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 15:12:35 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:12:35 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 02/27] drm/ttm: Expose ttm_tt_unpopulate for driver use
Date: Wed, 28 Apr 2021 11:11:42 -0400
Message-Id: <20210428151207.1212258-3-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:12:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fdb6af6-e36b-4e19-c60e-08d90a580d9e
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4462DF01F6226EA6BF6DD791EA409@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9eoGq5gV1NGpVSSWWjNBncmwJbQflVQsFk5KlIe0mWtcR3kuyjoQBd17cdIe47r0VCuEBDOlhTuzVHRg+86wpJczjIjO2WjnslXWX8EQ0jgvZDc63Y2BhXFT2hwUJ5AJoRF07RWoqx20lB0Z9WQf0+aWHF7qWa/aQ61fuJxdvx7uare0LUP6C5xrAo4gLvysMpm+KHwm69j+0XNcv/KvBHIElt7Zwa1/R0dTI0adz1JH1rmBGPxMrxOdU4O6tx8K4xTxYKTZT28rPEI2IlT00dZtrqRgF/mMDpX0D7nxnSPqFnnjWNPJb82GwYCpOfaXqZJ/Jl5jw8tU5EE8mda8+0kgZjViCI0/Aco2uEi81u0136Q8Q63uPzV31gVqkm/33ysKi+yx7HN9RmTv8udisgLN79h4f/0EW/0IMkWKWaQX+CjmUV8DWRnwRk4zKHPixkqxHQoGQAx0HKZ8j7pB6DMv8eszNQDHiORdBvppq8S7crR6nYDh7j4MBAZUdjvNBRj5akoOpageF1Pc6Qoz47+rowaSDxfB9MF2lyD1PrMWD6VMwgGODBTErJCeB4qJWzLK0q8nLbgdpOr259FPHeAuq/pyKrWZlcFfpKeNkuo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(6512007)(6636002)(66946007)(316002)(186003)(44832011)(2906002)(16526019)(36756003)(83380400001)(6506007)(4326008)(52116002)(8676002)(66476007)(5660300002)(66556008)(1076003)(2616005)(6666004)(478600001)(86362001)(38100700002)(4744005)(8936002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pCddA1drrOZxjMlkM/TEmOWLbi+EvFQE4LVRMcb0/AjBPAdT3COOGLuqHRpL?=
 =?us-ascii?Q?gET64uzgh1A0ci0hcyJGwOXJRwRIdb6UORM/iS8A84wS1XmlR8nzobwyeIze?=
 =?us-ascii?Q?fcuKXwRRPbkjVD85ppfmjH0sNToTAsXS3Ngiz9xTQmk1Oe+JCBiOYAVUH1X0?=
 =?us-ascii?Q?oUr/Zoi2AbCots8kV9qPhxLEg1f2TjNB0fgVKZdPCNFj86kJyJaNEAR3Lhd2?=
 =?us-ascii?Q?Aw7We1kfH/9XsKqAn0pf2LHT69AXVW90u5X0rQoVSOlv1KU5i48V2inwiYVW?=
 =?us-ascii?Q?Y3XGAvDu1eSEp4aru+KHq9xXHggTQGxGSXj2k0WSTqYvwITBreCPEF1YJMR5?=
 =?us-ascii?Q?a32+R8Y5W0kFNxWrflldMX8ccooSxiXTnWj7wxCvCiCeu2Hzu8qrPAkAHEPt?=
 =?us-ascii?Q?2zt05w0URXVtXehV6MqMIgicmEd5MHQaAY9MqtekbGTG1GUUiMVr6NkC+/8x?=
 =?us-ascii?Q?8NSkIZfZ5wFrcnMasIvARshCuNSR2coDfROSrWgPANT7nWMprJdq87Q+DdnV?=
 =?us-ascii?Q?swTvvz+LlWl+hd+aJcHO4UK2P4B/aLCmHpUf9PKdnQY0GSZ2+JHfY2zc8Jb9?=
 =?us-ascii?Q?Sr+Gya54Sqb2iFugQpNCPHM40bVOCshSk1Q1Pzr/d2nQ274LoCHuzU+tM1uf?=
 =?us-ascii?Q?26IN3BqfkH3b9t6VOumLxRmvgD8y3Xja2+DBrx867HmECBpRPM8uh1ZzCvVw?=
 =?us-ascii?Q?ocG2T/0iywxnoaUiutHP4OBUzE0d2JYIE0vK3iQvU3b7rkWLi0xhnXcCENAF?=
 =?us-ascii?Q?bcdosK46UfLl7QekXFNq+81ELKQ3NZAIJRY+uY3x2JAPARcdC4u96seEMuH3?=
 =?us-ascii?Q?TqqGozw/M62qDD8NgIon1Omi0fpqloiH4k7N/VnVa7t4m8zIBlMt15nMzXTh?=
 =?us-ascii?Q?zaU2yfdOHvDzRxgyWPQLUFSkwlr8wnKsmKdKxoEeBrnKONXFi4OjEyiwIvyu?=
 =?us-ascii?Q?Y5D33P75UQ2vUVMegRTcYA44dakfb28StCBgIrLS/4MX8nj+4eh3xAMcch13?=
 =?us-ascii?Q?NmikUtraxCWg062EKyAt91yssxx9tsDQ9fyacEspyWV9/UiC4PqELBvYoi+2?=
 =?us-ascii?Q?95l1VwtItbSF+7KX/Uwk/E5SE9md91G7wr16l2BvFPr6Oc7nHBiO/BHnz3+/?=
 =?us-ascii?Q?wKPiGyotSvLKFbrOHoGZT1OXKW9rKeyL0MmFtbXUocXjTRXR9SDYXPpC8F3A?=
 =?us-ascii?Q?iCYPgKeIiOy44JjLc7qeIxBQC77B92uy6OGxBLVNCDSyTR+PDz1yJmKR8ur7?=
 =?us-ascii?Q?k5hEGBp1j+vzG97YGnaJLr24lS1IuB6EYGqz3/WH48wXYpN/5e4hYQSaG/fF?=
 =?us-ascii?Q?N/wjHVO7Cpwbkh7WGm4pUBHws1mCYzzQk1kv4kT0icaCuwlqGkAveVqv77WU?=
 =?us-ascii?Q?keH9WC6zqlFJ+g+gQm77t7mCEfxI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fdb6af6-e36b-4e19-c60e-08d90a580d9e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:12:35.3203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WI5m1BNmQVVtIVGny6N4ah5Ic6VABG/N9/6dPRf1Luo/0bxBdWlN/NgjahyM8XKSeIgUFAXLjGJQ0lanFqt9Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's needed to drop iommu backed pages on device unplug
before device's IOMMU group is released.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 48c407cff112..f2ce1b372096 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -431,3 +431,4 @@ void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages)
 	if (!ttm_dma32_pages_limit)
 		ttm_dma32_pages_limit = num_dma32_pages;
 }
+EXPORT_SYMBOL(ttm_tt_unpopulate);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
