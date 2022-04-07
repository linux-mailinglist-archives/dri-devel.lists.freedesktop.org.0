Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CD34F758F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 08:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0476E10E5A7;
	Thu,  7 Apr 2022 06:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FAC10E59F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 06:01:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSFlDOLFwYq5XOEuunNLq+zrBwM63JEvBelHAz+G62hEFZQSUmCcvJqjlaPY/qGzZJmBrLrlZ/01+qriIBtsy8GPvRaPt3QPECsv0b5BWCXGN28BG6bfu6gRlv5soEb0X5/5pfB9BV/ODxpfbNfJPTGha/iZ1W51sWiz5nAUUZzukQlK3u4qUr0tVsS2kKcLZdbDiyEwMTXKdzqxkvZBEsMrvJTQv0XhVCAHM1IsiTqoowHjed8Wqr976moDjvyiUvyVceFXWnOUOw/EvwRKYhi81Lop9hhDRe2fVIKxb/Y9hPOinKdmFP2aBWxvsbym5ojOMfV/s5jvs5mXHmbIxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gk6Ltrh5Bq0zBa3/iNGLIc9XbIv+XV77cGGbIfq3Yw=;
 b=YuDdw08DOWxpxsfToVWHK9oqxobzkDg3zzlCF4DbgcrdOZW4bkX0kRCAJLMMWwVpLEwJ1qBk+FE0bFOpzQiiEuXB/ZzN0RfSSaQHhwaOThf0acERbc3jq0LmKZntu60sOaDK7Bv51mHWVnYRgxs1FX1fOZs+N4/PI8b9wnZk/c2XxX5CnVzL622lxipSQF62qvU4zb+F7b1QjMEWGbvKXhbmw9fuSZi5eltvs2bMf/wAFX+HX4KXHs5H0Vqi/8p6iCqjQQey8H9m2p3gjLqTjB6ijB7SSacuyMAm1CiZV76qZblVJHaF5uVFBC4wEt/rbZHviIicxy7bS4yJCFHk2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gk6Ltrh5Bq0zBa3/iNGLIc9XbIv+XV77cGGbIfq3Yw=;
 b=ldyeytwwNKWBh38PbZ6eXv4u8XhZ5gZBWluEg8YGPg9DZCqJmTQor9mq+/18v5Zf0aUGZ2dei3Z1jRWDvyf7T3PITIgk2gdHv3OBVpnZg2Vnaamxb0cV45+TdDRVW35EKvYgbUODrFCFdfmRA+H553/ByZ2LpktvaNFBwip1IbU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB3610.namprd12.prod.outlook.com (2603:10b6:5:3a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 06:01:52 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.021; Thu, 7 Apr 2022
 06:01:52 +0000
Message-ID: <b84b40b8-fa7f-efa3-5c5e-2596d80bb94c@amd.com>
Date: Thu, 7 Apr 2022 08:01:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] drm/ttm: Add common debugfs code for resource managers
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20220407025652.146426-1-zack@kde.org>
 <20220407025652.146426-2-zack@kde.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220407025652.146426-2-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0028.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93aabe0a-bdd9-4478-28a0-08da185c1c9c
X-MS-TrafficTypeDiagnostic: DM6PR12MB3610:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB361012D77CA0E912D9C3632783E69@DM6PR12MB3610.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sorq1T9qJOfuY9GBeXqKnXtPgCnYcCUDS+/UlpkkQNzOAVolTsIwljnKIwxxE64W0FubSmUGH59JAPE98IJQ6KVwc4Lb08N+otnIACcW2WWm/Nfd1bz+s4EIJD8Txl00/6Tg1FxIgss0fCzuCQ7UXcUFehY+ogkCLD7hb8MWSiL7jX1Sdi9Lv1hUXJNOO/konLZ+PGo9tZJA8kg9p/1Lhjs67KMYnn+yoDwg2fmVp+vZtBLU0O8WKCQ7D6qp9LS8Ep8XETkHc/KtW5or4GcTo2XKVMA40QQeEedU6t4ndMVffdLt5DNJJsBOcl0P9aeFI0B/2gUj/cCOV6BKBNdWfN7gagkY8HnEQMX7x1blF1QIOGs8YTP1KNkmMDOQ8OthzWGptt4eUbeKfSR0+5LreV2CLwmW0XlMAM90LDIAeadO0BDAxbkZKXsx/i4CyH2pEjdL8FJkmu/I0Uk/NRYHF+Q7Pim8yf5hHCjJ//JbAJzlyZyvYS6lHYZhXXujHv3tWftHbvVlAZV4MBdsQyqN/4fMmF0jGQDlPL2tVMm95bPTGBF8uiB9HRrDusPd+C6bbIUX6jfLatvlbRDw9NYwsKDFjAjVi2r22f6C2Hxrbq4VBVhgBU7RIXojzi4pla1zreXVRZTQCT8F7dq59294DEfcBtOQjiDAhgUyU+6uDRlvo4mGdfrjgN2kblW9PArc13fbpDRR1TYcPPW8B8uJLuy/qPcH+jK3KZ4XkSgNlj8VGKjEutkVEroc2gIINGYP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(6486002)(186003)(508600001)(2616005)(5660300002)(26005)(2906002)(6666004)(8936002)(31686004)(316002)(66556008)(54906003)(4326008)(66476007)(86362001)(8676002)(36756003)(6512007)(6506007)(66946007)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmhmMnlndWo4T2lwRG8vODZYSVN1WDREWC9Idi96eUFaaDNsVktueWFTb2ZN?=
 =?utf-8?B?ZXhDOXh4aVRzUVEwUWY5WjhYa0VLQVBpeWR5MG1hcitSMktQcWFWTkpQcWZ5?=
 =?utf-8?B?QXJxU0gxY3BubmRkUGtOTGQ1SGpWWHRzclorY3lyVXUrcmVZb0tCTmlwRnhX?=
 =?utf-8?B?YjRxa241UFRGV0lOUnNvN2c4YzVYQlZMWG53NEpjVXNlSzlNWVVtbGRwbTln?=
 =?utf-8?B?R0h1RzEwWGxKVWo4dURBV0x2eE1ONEtMMnZkNWZQL3FBNU94andhTGVwM0RB?=
 =?utf-8?B?cDdIS01NR05NdGlueklJenNmdE9MNUhhYkhnZEhaVG52YlRwVmV3Q01TTXp2?=
 =?utf-8?B?N1BYaEN0VTdlU3h2QVBQNVFzOFJOUmRFRi9XYm83cHF1R01oNEF5cUFtSDZE?=
 =?utf-8?B?MkZBQnVZcEg5NDFYcitwOHN5WFMzZ1pNV0lhQ2J5TmlRVStrOHdFOUQ2THR3?=
 =?utf-8?B?ajlXSjh5SFdFT09zcDkwcWZlMDBoa3BpUXRtSnAwY0cvNUJTTlRVckp5TWta?=
 =?utf-8?B?VERuTzBxSkUrUm81d2hQSlpBUnhjVnpaczZlUm5RK2hQUE5IZ3VjNSsyVDd3?=
 =?utf-8?B?d3NWVkhhc0VHcWpGN1JUWE1zL21tL29aMGJOMThaWGpPTnRUY3NYVG1EcWY3?=
 =?utf-8?B?VWg3SlBKVFB6c3lzVVg4OStESG5xdW1yZ2lQTWNuR2t1MTBxc2V0TExDR3JD?=
 =?utf-8?B?WTZKWC9ZcFo5T0tmeU5zQ2VQazZrVFdBOHlwRytjbXIzMTNqSHVzYzVJR2Rv?=
 =?utf-8?B?dDE1U2svb1ZkVzRjTHFHRDNDb2dDbEhIL1k1bXFHbjJyNDdaOS8yWE8zNXJS?=
 =?utf-8?B?dGdhZ1BOT3pWV1hLQTF0YUlBUjM5ODBTNzRBU2NkUitMZ200a1haUWJGdGFT?=
 =?utf-8?B?YzdaVDFqWE5HWkxLWFN4bzZTM3EvWGxKRTlhc0dQZXA5ODBzY2dleUVES2lw?=
 =?utf-8?B?UUVnOGU5NXAvaGFDQTJBYTMxSmdNeUN0aTJvY1cyREhkT1UvamVmZzhZVWZY?=
 =?utf-8?B?RVJkWkJlMzdCMno0U2hGU2Y3WTlTYTIxd2NZSlhGMmlkbmtXeG96bXozeGY5?=
 =?utf-8?B?OU9nNlc3RDBqekM3MTMvdXdYYzFnNUxQQWd3YTdiT0IzOEwrVFpjTmcrSWho?=
 =?utf-8?B?L1RlRnhBTDZYWWRkNTZxT1c1UkQ0VHF2V0JjZW1VaUtGL2NGWWJDN0FwN3lR?=
 =?utf-8?B?STArdU1hNDdMdFVDdzJmaVVFR1ZnSS9PSFZqblZLVllOK2h3eGlqWVdEUW9S?=
 =?utf-8?B?RnRyQ0tldXlSQ293ZmlWbjVuZnRBU2VtYU9YZERsUHZEekg0S0xBS3g3Mnk4?=
 =?utf-8?B?N2NmTVN3SVVoSkc4bTdBd1F6TmNHR0trRG9KVUErRTJmSFlqU1dUWU51QXdL?=
 =?utf-8?B?eUNORW1pazZpUHBSemJmRU0zMTFHZGQ2M3JBUThFTm5KeldkeUZrbWRheHE4?=
 =?utf-8?B?cTF2Y2sxL0VYNXZvRmxSSUxacWg1YzM2eDFJZEFpZVJFbEdxOEw1VVcwa1NY?=
 =?utf-8?B?ejZ4TmVLaU5OSkJNZ2Mxc1lFQzBaSUNPWDgzMmRac29JVFlCcnJ5OWFPUmdz?=
 =?utf-8?B?QjZsUVppcDU0YlVXdGl1ZGN1blBZUE4yQmhFcUlCQmlBNjRYalJFSGdXSGJ6?=
 =?utf-8?B?NXdibEJIdXpzSkV5STROWlc3cDl1eVBEaGgyZExJc1ZnREJXWXUzWjIwWE8w?=
 =?utf-8?B?TktuV3BSd1BuNStteWdPMHE0MlFWRk9zeVc2RmpOOGF6Zzh2OFF1MmdUT0Fi?=
 =?utf-8?B?RXc2S3dJU1MzRkFWZStvdHpRdjUrNHFYOVB4NHpFVDh5UUE5eCtLS1RnN3BF?=
 =?utf-8?B?UFM3MjRZd3F1alNERS9VdVF0U25QVE13Tkh1NndzRnR0MFgzYU85U2U2OTIy?=
 =?utf-8?B?SnB0d3BGYUhKUWVhQ0tmcVBWdkdrS2YraG9nekhiWnBCZGJTdFFtQWEwK3Rx?=
 =?utf-8?B?Y2NBL3JSV1ZHc1JtVGE1QTczS3FXaDlaSzVjNXhVUm1pSUVvaTBzdUxOeHdo?=
 =?utf-8?B?NEw1eUEvSmd6cW9WWWwvK0VGZlAvVU4wdEdwVDRsb0hZOS9SWWlQLzlSdHVj?=
 =?utf-8?B?ZS9ZeWp5cGFNZGlMc3JIcFVZUWErV08vMnJub1FWUDlsVGhSVzhkTldoTUsy?=
 =?utf-8?B?TGFlN3JMYVFJR0FwVmRkS0xCeStvQjk4NktQZDM4MUNhRU5GVjlLU3ZoaGZ0?=
 =?utf-8?B?S0tCbGN0SFdFc1RyZnNiRE9paVlyenpXUTlxdXBkdkwybU9BcDJJazlkWTJp?=
 =?utf-8?B?dnNFZmQ3QTRZT3BtaEsrQWZWOXhIanA0QkhkV2tyaU5qTzMwaU1hYUp0Sm16?=
 =?utf-8?B?OElNK1R6RWhmVDZ2TWRVa1UrUXQvN3orZ3VmZEt5L0VXVGpmY1RyUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93aabe0a-bdd9-4478-28a0-08da185c1c9c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 06:01:52.3806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rF8ACRRdb0K9J+aDi1TvimtPTRpTmff8naQGtETE70C6vQunnoRAu1lw8NbhJQ04
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3610
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
Cc: David Airlie <airlied@linux.ie>, krastevm@vmware.com,
 Huang Rui <ray.huang@amd.com>, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.04.22 um 04:56 schrieb Zack Rusin:
> From: Zack Rusin <zackr@vmware.com>
>
> Drivers duplicate the code required to add debugfs entries for various
> ttm resource managers. To fix it add common TTM resource manager
> code that each driver can reuse.
>
> Because TTM resource managers can be initialized and set a lot later
> than TTM device initialization a seperate init function is required.
> Specific resource managers can overwrite
> ttm_resource_manager_func::debug to get more information from those
> debugfs entries.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Ah, yes that was on my TODO list for quite a while as well.

> ---
>   drivers/gpu/drm/ttm/ttm_resource.c | 65 ++++++++++++++++++++++++++++++
>   include/drm/ttm/ttm_resource.h     |  4 ++
>   2 files changed, 69 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 492ba3157e75..6392ad3e9a88 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -29,6 +29,8 @@
>   #include <drm/ttm/ttm_resource.h>
>   #include <drm/ttm/ttm_bo_driver.h>
>   
> +#include "ttm_module.h"
> +
>   /**
>    * ttm_lru_bulk_move_init - initialize a bulk move structure
>    * @bulk: the structure to init
> @@ -644,3 +646,66 @@ ttm_kmap_iter_linear_io_fini(struct ttm_kmap_iter_linear_io *iter_io,
>   
>   	ttm_mem_io_free(bdev, mem);
>   }
> +
> +#if defined(CONFIG_DEBUG_FS)
> +
> +#define TTM_RES_MAN_SHOW(i) \
> +	static int ttm_resource_manager##i##_show(struct seq_file *m, void *unused) \
> +	{ \
> +		struct ttm_device *bdev = (struct ttm_device *)m->private; \
> +		struct ttm_resource_manager *man = ttm_manager_type(bdev, i); \
> +		struct drm_printer p = drm_seq_file_printer(m); \
> +		ttm_resource_manager_debug(man, &p); \
> +		return 0; \
> +	}\
> +	DEFINE_SHOW_ATTRIBUTE(ttm_resource_manager##i)
> +
> +TTM_RES_MAN_SHOW(0);
> +TTM_RES_MAN_SHOW(1);
> +TTM_RES_MAN_SHOW(2);
> +TTM_RES_MAN_SHOW(3);
> +TTM_RES_MAN_SHOW(4);
> +TTM_RES_MAN_SHOW(5);
> +TTM_RES_MAN_SHOW(6);

Uff, please not a static array.

> +
> +#endif
> +
> +/**
> + * ttm_resource_manager_debugfs_init - Setup debugfs entries for specified
> + * resource managers.
> + * @bdev: The TTM device
> + * @file_names: A mapping between TTM_TT placements and the debugfs file
> + * names
> + * @num_file_names: The array size of @file_names.
> + *
> + * This function setups up debugfs files that can be used to look
> + * at debug statistics of the specified ttm_resource_managers.
> + * @file_names array is used to figure out which ttm placements
> + * will get debugfs files created for them.
> + */
> +void
> +ttm_resource_manager_debugfs_init(struct ttm_device *bdev,
> +				  const char * const file_names[],
> +				  uint32_t num_file_names)
> +{
> +#if defined(CONFIG_DEBUG_FS)
> +	uint32_t i;
> +	const struct file_operations *fops[] = {
> +		&ttm_resource_manager0_fops,
> +		&ttm_resource_manager1_fops,
> +		&ttm_resource_manager2_fops,
> +		&ttm_resource_manager3_fops,
> +		&ttm_resource_manager4_fops,
> +		&ttm_resource_manager5_fops,
> +		&ttm_resource_manager6_fops,
> +	};
> +
> +	WARN_ON(num_file_names > ARRAY_SIZE(fops));
> +
> +	for (i = 0; i < num_file_names; ++i)
> +		if (file_names[i] && fops[i])
> +			debugfs_create_file(file_names[i], 0444,
> +					    ttm_debugfs_root, bdev, fops[i]);

You can give the ttm_resource_manager directly as parameter here instead 
of the bdev and avoid the whole handling with the macro and global arrays.

Then ttm_debugfs_root is the global directory for TTM and not meant to 
be used for driver specific data.

Rather do it like this: void ttm_resource_manager_create_debugfs(struct 
ttm_resource_manager *man, struct dentry * parent, const char *name);

Calling that for each file the driver wants to create should be trivial.

Thanks,
Christian.

> +#endif
> +}
> +EXPORT_SYMBOL(ttm_resource_manager_debugfs_init);
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 4428a62e5f0e..3c85cdd21ca5 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -383,4 +383,8 @@ ttm_kmap_iter_linear_io_init(struct ttm_kmap_iter_linear_io *iter_io,
>   void ttm_kmap_iter_linear_io_fini(struct ttm_kmap_iter_linear_io *iter_io,
>   				  struct ttm_device *bdev,
>   				  struct ttm_resource *mem);
> +
> +void ttm_resource_manager_debugfs_init(struct ttm_device *bdev,
> +				       const char * const file_name[],
> +				       uint32_t num_file_names);
>   #endif

