Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC353F6DF7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 06:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12AB6E10D;
	Wed, 25 Aug 2021 04:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 871 seconds by postgrey-1.36 at gabe;
 Wed, 25 Aug 2021 04:03:19 UTC
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (unknown
 [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CC56E10D;
 Wed, 25 Aug 2021 04:03:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+2Umku7vhgBIObqDRq+7aadzvzB+LV6ZTGs70KAREp/763GObHA/YNTvo/TZPENsJEzZeR1Z5xBRN0PnunhL0jfd/QFx1bwafR5cbupId3TRjWup9qkcAOweNzF111e2juxo5IMP5kNzEMAK3XzTzYc6R1Fgy1OSnbt0+nXVIq9D6nkM7fpPLphXQQ+5mTt991dct/67Ke5jiNsG5oENrMd1CwiyR16gI/KRfYapBXtBst1fEjM7MqpUWPW4FF+BusV/GPnrDmdL/RktFQ8FGhEpO/+zTL9IBEq1d4zFbSyWjTK8qw5dXjlhBLAm/usFw806zQvsb9TjxnimfHMzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gewBIQO8Z68IgfgsrXbEzqIa34U16SiSGjwinCd25vg=;
 b=OBBaymnlJiUhqaZ78L0xGrP9N38KAIMcZLHQxXOcsosoUy6bwNONmbyO6THYZlaqcj2+3Uv3KdZc5mTLt6C2is0J77DwKE0GyY22ByEJGeTDKoR6bt7bWDGte18HsDYkOIo+G+P8EKjmFIL5lKotemilc+9GyaGMGM72K5R6LeEfe7RVwJob9C4OZokm+4l54WxEDXQXN+ldGZkmPhACMlI68NmiCLPtc+9y8UBr6gszcPuNWCGW3ogabTDSEMDQa+JY+JVgPhYGPXpPN+8m6xFaDngy23zH9+Oyx3yY2dvjaipybgv4zzW7hJq0o4+YBbnsBS7yqFkBEYUKZBKQ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gewBIQO8Z68IgfgsrXbEzqIa34U16SiSGjwinCd25vg=;
 b=Z4RKmst5+aX+2o5eJDzdyCd4APBvgkP50trb9pKTNn6sK1JP9eBZ4sMhuz3404p1zdErFH0/ovvbZ+oYx0mzQQMqFNnD0yYS2aPEeHIMFonlmr6dQJZSwa+KMd0WuQlN90VKAg6Vb+0E5BmsUdrgBfn3FqITWSt8PSvVNpDEyDo=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4511.namprd12.prod.outlook.com (2603:10b6:806:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 03:48:44 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 03:48:44 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v1 05/14] drm/amdkfd: ref count init for device pages
Date: Tue, 24 Aug 2021 22:48:19 -0500
Message-Id: <20210825034828.12927-6-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210825034828.12927-1-alex.sierra@amd.com>
References: <20210825034828.12927-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:806:126::15) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR04CA0190.namprd04.prod.outlook.com (2603:10b6:806:126::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 03:48:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62f48c69-9d95-42c1-3aab-08d9677b3c46
X-MS-TrafficTypeDiagnostic: SA0PR12MB4511:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4511C3CE418DFE450DE5958DFDC69@SA0PR12MB4511.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j7YAuGS2Jo7J2K99NJqNyxfA7rI+uK44ke6WIUPhpjo2SUJPozTI7f4IipjxxB8DuZimJAAmoC5VmdKq36t0OL/PmTtnmmmhg3DjK0TUDcdITVzzxSYyjx7fP3gqDgTW3VRzqtfBUprDrHY25PxasLwoS/jHn1iMi0dGHHXJkUt8gSrcga64qxcHYFeH0fqHJN6Sq+PnNZY5gPnC7Ru32x5vkImeUugLp66u4eQMsURaLKqiYZitxX1+ywnhyPL5yyijROOwW+YSgmUUNgH9JOQ4UQM8PTBIA2Zi6K8ZTENyTbmU8Mk59DML+iZ+EndyLVbTJF/NYNXmcIpzkzylLuyThO+p4/rR9Um7Lh6F/E7868FqdzH4DhMNNvLZffQdC/eSh9ZjnDJloo5LfsKa3SIoS9OoKobF8YR3v9vCmRpNn9oHNL4qngGUe0fQ1t82WMSCAeeXz6hZD6oEGbmq8MSkaTLidJ8+umu9sPHkB9S44LFq+7FsJoTXNaMLQgg0Hw8JOlDwfQZNe4qnTfvKJJuUJGBeNha7pqxzLTdcGoV9XOyk7CUHgLbgyIEeyhz9ZeKKQyrOhwxCotudGoJbuBpqtYaYFo/FYcppl8rHeESbmZzRGmGpj+rSahPnsT8Z1+bvqFSG4o+Py1zlydBEFHRxzzKmL+3SIeTz05jnxNLXIlKqAxFrnhOekS/dlAic1Gp3GfSU0ht55/03YgvsVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(316002)(478600001)(4744005)(186003)(1076003)(83380400001)(8936002)(38100700002)(7696005)(66556008)(8676002)(66476007)(66946007)(6666004)(956004)(36756003)(52116002)(2616005)(4326008)(44832011)(7416002)(2906002)(6486002)(5660300002)(38350700002)(86362001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RHc/YK9DrpGz+WRV67ZHjvhvUja2p2CgruIQlttjSzkK2+XKmoW6P2325PPh?=
 =?us-ascii?Q?F6M6Eqp1R6XdeNMg6nh4RrvatRu2cEYjrZOGGqTj7JjbVuUW7pG51u4bbIpY?=
 =?us-ascii?Q?48x1CTk+gIlRMIBwSZkgAvgTJn1QLIXmLHkLwIoDKd+tebW/LJbto2OMfjV2?=
 =?us-ascii?Q?fCZYnUeDgPEseyP+ilydKbPqy/2i+L8R4RXedvCqHn4pIejV/q08DmGz6RbY?=
 =?us-ascii?Q?R2FgCLXKGeO664J0yCRlaqoi23kItgRJn2VZ/JuTM9jhsGfhaRVw218tRfo+?=
 =?us-ascii?Q?6w9/mFWppCyCd8MOBzDw9/6YU34ldH1rgJ7JyyExvt9xqCexTQW/iU1dET2F?=
 =?us-ascii?Q?C70Dhqz/lDbh4ZhEDA4FhjyYWwcz9cZeazpb9Umqz1E4I9xS6N9k04yamATh?=
 =?us-ascii?Q?6b7UJrmaPryKCZt89jLjyv27pAS+xw8PH8Le2LtQHGl7yPV0EwA3eHfySHnf?=
 =?us-ascii?Q?BW2qiEx+OBVm7lT+Dv8WyGtDQByr90C3B6XfMAtvvrP0ZJeKzGhGMuxL0Z+R?=
 =?us-ascii?Q?aIfbcG50x+2zShG5mm2MgvCPLUD7G25Yzx0cEqFNod7+Mg7h4R+bXbpvZ1KJ?=
 =?us-ascii?Q?JgTalqCmwKhXm80ORLscM227eDiw7EjboFc6u/LICpcCerdcnudAZgApO2Vj?=
 =?us-ascii?Q?x7zIAIbA6+65xGuWxdDDRva6wFr0xfqBtIkbzOdmvoBVPErxlgJdsbKoZh1Z?=
 =?us-ascii?Q?gfHm3roNl/S06bL4LZURhGyK7NLAumaEu1/dE7nbXVv+iSsqaTJjIRIdoaxu?=
 =?us-ascii?Q?iFsAoZwqgpZl6mJwdPpRn5H8Hm9gxDt21PS9KhnmB8HYVsl11pUvP7KcswH4?=
 =?us-ascii?Q?+6/36TvErE5jfyvkGbr74V4twDZRS6TIdCrX3Wvf+6lqqH3rL945wHjBpcYR?=
 =?us-ascii?Q?RvmbNyotLaNK5C3wmGYXkpI/i0VpKtRTk/AHAT6nzkyw7x4mwVn1h/AxwUkG?=
 =?us-ascii?Q?pTzwiN0u+0pt5DC9mZ8+8SVkeyBdq8kb9pG22+Jya09bus0utx+QFBaC3Pr0?=
 =?us-ascii?Q?Hl6YDIer7fRdVE+CxqpVCbEaNe1AHF+wdGtQ9gtQ6A3YX/ACERxbghoomjP0?=
 =?us-ascii?Q?Zz0KeZW9lV6uEgAFFu/suy0tfLtkPEA9xLta7hRQeF4QHJmsYVYcrv7AJAoL?=
 =?us-ascii?Q?moNNmOeWDBhHpc8CAWqpJJlx/3LbVSHPbWOX1EESImMVtGZmbNujJoffRTwF?=
 =?us-ascii?Q?C+RnCJIB7VGVqu6j+ghHrMsypqHCfMh1Lzai50xhCdY5W6GRbWHAVPVZ8CJb?=
 =?us-ascii?Q?cXUrqh4OPQgLEiigGQCNHnWdhYntuMtLWmXbFuP9/lkm8OE5nkr6jX+A0/Fk?=
 =?us-ascii?Q?JtGg+lA7dr+rUjqU438flJQR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f48c69-9d95-42c1-3aab-08d9677b3c46
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 03:48:44.1252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RoUYQAP8YKiUuvE1jHemGQLdo2PTtLA7yalbciS/rjmIjOIX1dbLYPSCQbroUlhLn+lfo8rdlW35EroSaY4P6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4511
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

Ref counter from device pages is init to zero during memmap init zone.
The first time a new device page is allocated to migrate data into it,
its ref counter needs to be initialized to one.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index dab290a4d19d..47ee9a895cd2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -220,7 +220,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
 	page = pfn_to_page(pfn);
 	svm_range_bo_ref(prange->svm_bo);
 	page->zone_device_data = prange->svm_bo;
-	get_page(page);
+	init_page_count(page);
 	lock_page(page);
 }
 
-- 
2.32.0

