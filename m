Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B81408630
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 10:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85626E134;
	Mon, 13 Sep 2021 08:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2086.outbound.protection.outlook.com [40.107.100.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80356E12E;
 Mon, 13 Sep 2021 08:12:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADjTTmM8exIpDYtnKYmVPSOgeYUzfj06/qAB1DEAaWh7e5CmT0AwdduUSIcXBprxD/ruIeqHz0A8keUvSdC2goVvOcFTsRtKZG0Yz0RybWI2f2XNx1k2Ppa/Vs523vZg0niErvIpCEbr8Oeuq480hstwAN0pP9ftkVa4kcDbk9d/C4cU7z1TotBWMKhqy/xWQDwCHABTPeG3xgjahMJK4meJKHfulBH1K7byAqxZ4nNsOOKaRShoyXV4fSxwYI/XokRaPAbLRWTScgbsk19zxtIHo24evmXdembvQjQkMlgeue1b40woElPGguaDlwtE2fmTvJYyUi8kZJTGj5VZqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=PzEtZ1jiomv0FDJJf9T4BSmUzz1IEmdxegy1arUKKmM=;
 b=mKokycCfcwjduyY83DSLMVx4Olbg0KaaO1ZaUc2yMnPa6eamkQcz7H/+Urc6YUY52/7lxDaqvd3XUMJS873d9E7CP2nVoB36TqUfdowrt9fwOmcrV+2PPOC8PhfokkIRNJ8RFln7LjzgurkbX/Laqanfa81JjfTcO40Y2WANYjAVrukw8nHHfkX0ZLXhTFV3TWBeQMnSB9IyxJcfso0x4RnCWcLR/7RAjxMVtarz5vI2KVwEKtdW7hGJN71TbNDk9dH/UxGZAPrE+SwIxEId/fA49bG7Misb7jTUiHcJsDwKnOqhqpvkDkmvfkSeQ/3vbeSHAkTz3j7UdM4Sa4hi6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzEtZ1jiomv0FDJJf9T4BSmUzz1IEmdxegy1arUKKmM=;
 b=lIY/PMGL4cDTs6gCWZhOuhWS2cwhROWskUo/XeY7Dyfie3mrRvFIiMvIGJaTd7eUb8mAljyTYrkWmOMN78BFKhZfVLYHWGGmxPfcBcqF48iRewjIogUnqo/XMILIqvzhftTYxbx37kLnNjh1L3Tl2RDnW/E61Lrp2DRXVKXDTow=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4191.namprd12.prod.outlook.com (2603:10b6:208:1d3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 08:12:27 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 08:12:27 +0000
Subject: Re: [RFC PATCH v2] drm/ttm: Try to check if new ttm man out of bounds
 during compile
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20210913080950.180752-1-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f19644a8-a60e-9a0e-a39d-36f2f44e992a@amd.com>
Date: Mon, 13 Sep 2021 10:12:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210913080950.180752-1-xinhui.pan@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0074.eurprd02.prod.outlook.com
 (2603:10a6:208:154::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR02CA0074.eurprd02.prod.outlook.com (2603:10a6:208:154::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16 via Frontend
 Transport; Mon, 13 Sep 2021 08:12:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c3c4566-cc0e-4b7a-5f6c-08d9768e3957
X-MS-TrafficTypeDiagnostic: MN2PR12MB4191:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4191B58D11313D1331C407A183D99@MN2PR12MB4191.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ykZn4g28LjIKvp09P1yLbR4atQoY7kCiPm9j5w9zdHeI+vadtac3elJIm6aBFHug+0NtP/K7mUDOxvZBHPciZ8+C28VK2tHiivjU9yyd4f8E/kJTXyKWmtPao9naPzQ3FlDfcVG31ncOrBMPD8rUCds61mnoHa2IXzG0wOpee+Saf+1yYrfO3p3zYL037Bj9M2d30xXrEg7w81Nmg7RnyTdsdAoHowLa8e8yXpUEuKWD/cWBmG5uKnuBP4IHJozDCsJp4o9e4XEXocSg9lUU1dQ/xeQjfFnpqiXjqEk+OG/ragWcix52XiqsbWv8K8iZ06vGk7rJ2vlgbS71fb0BVfdA/uwjs5rXzHiM/V0+YADe1zCoBq+0aVY1tOF3MKnMH8FSZgEORPRUSblxSEjvkZYwapwcA6FUu6gmsQ6tZrmKKSmdeBNAme+a8Qg//Wgca+lQfTfXbyxPT+Gf85gvHY7KNMFhq2JPpvHHiT2FTh89DLsO4cF6+PqY4XRYKBmXq9olOMsFichWjbTu9OMVG6p8EzqZXMjwExjFsG4G4y3afgPQ98i6NKn/WtVIOx2mT7xdHXmmvcVREP+uH/f5X5SKsCPK4n2iE22RtlrigLxcL54Pt8tsz1z3zyyYFqp+cohhVe33RQ5/XKWELJ2SyzM5ub4nIiBLufGVPuHmEmfUvPpi5LftPdRxyKuLF49XQK3VrksWwsjXg53cBQa0w6VUvaGRdDnRznR9y5AV5AkEXuVe9Dspg7syEyo+UALH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(38100700002)(31686004)(86362001)(31696002)(316002)(2906002)(16576012)(36756003)(66946007)(8676002)(6666004)(478600001)(83380400001)(66556008)(66476007)(8936002)(186003)(6486002)(26005)(4326008)(5660300002)(2616005)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0hBbzZHZTgzTG5jbm1hWnVudURLdklFQnJJNUNLb2hYZlhGTzB2eXk0SU1s?=
 =?utf-8?B?WHVadC9SaVJpNXZYbnRwM0dNVkE1V2pPQ1Nua2hKeHppcHFhemE1aDVSMkFB?=
 =?utf-8?B?SDRzTmNjd093QXV0c0lKNXl3cFFvL1Zldks2QTBmdklyM0lSa3NjL29IYjhw?=
 =?utf-8?B?bzdHcUpZNE9ET0V0S3IwMVgrdGd5cy95SUF0YWZydlFpK3MxMWJCWTR6TDB5?=
 =?utf-8?B?MVJJQTFnSUt1bkZZUEJXMkNac1VrczJnelZoeHlvcUMxNzB3T2l1ZVlUenNV?=
 =?utf-8?B?V09BWC9pZFFJLzBkdEZwN2wydGRDRC96cW5SMVFFa21YWWtXK0kvRGE5Wlly?=
 =?utf-8?B?eFl2aUxwN29Lak91elRmdVAxYmFJOHA5blAySTAvL3NzZXdNMEE0ajRBTlVw?=
 =?utf-8?B?WEU5Z2NtTjFYUTY2UlRDQ2k3N1M4aDQyUWhnbDNmbUpLcHAwK2xtWHFLa2pn?=
 =?utf-8?B?MTFKYnM0Nmp6d2JGOFRubHJLckNJVHJzenRWWWpDYnU4TS9NQU8vdlNZNmIy?=
 =?utf-8?B?Qlh2ZkhOYlBGWEVhMkpBUWhDZmxCRG1aWjRReUNsM3lITkFTWC9pSy84aGRq?=
 =?utf-8?B?STNmMTh5SFE5WktpZUZkU2M0Vlg5QnBjNUx5MWUwU3psN2FuS1k4NDROUXdE?=
 =?utf-8?B?N1kvTHBjWktIVjBVSXI0Mk1jbllGWVBMQ3hLVVZJdXFSRWhUeVRnUk5WRDZB?=
 =?utf-8?B?WWlDODBIcUYwRzlGTXM0bEZBcjhpMDVScXNYdldvWVlHUE55d1I4eC9wbG9s?=
 =?utf-8?B?c3p4OXRXSkJXMW9wa3RvMCtSSDYwSVlDQ1ZlUG1SSStFQnJJV1BUM1FjbWs3?=
 =?utf-8?B?YWRFbVpVWGJtVTlkbVF0VjFGMUZ5cERodStSK1ZFS3dFb3E2Y1E5a2NMcHk4?=
 =?utf-8?B?Qnhlc015RG9iSkliUlppWGMvRVpIdE8wUHNsZGg1MkVLMVVlTnVjQkJQN2lF?=
 =?utf-8?B?WFlWOE9RbGx0MmFTejhPRGcvL2dDOEZYK0IwNCtkK2hQQnR3TDYwK2psS1FN?=
 =?utf-8?B?QW9lKzRXSHdjZEZNQzErTC9ySnhxZUxuM0xMSlZHTnJESjZTVFBkKzBScVlC?=
 =?utf-8?B?MU1LWjVWOTdndVBJSlRZYU83Y25uSkR0OGhoUFVVSlF4VTcvQ09iQmRqbC81?=
 =?utf-8?B?ZUdKcnZKS2NhY1pMeWkwaHI2cGxLUGpNM3hnRFNKSkUxaUJsWkErNWIyZVZ3?=
 =?utf-8?B?ZVFlQVZVNU1hak1jSXI1c2dmbzZNYjEyckkyeHRzMlBWc05FNlM0QS8yRzdQ?=
 =?utf-8?B?aDZ4TFRlZ0JvYkZZVE5PVmwyWG9RQU91ejlqSkMyaEswRVpnTXpYT0MyTCtL?=
 =?utf-8?B?Q0tKNnJHMnpXYXptMzZXdStPNjFKZDM4UGt2eVI3Y053QW1nY3djQ3dCK0RU?=
 =?utf-8?B?SE43SCtIUmxsTHZnNVNaQjB2THJvcGZkK3RuWU42ZHpXbXlYbERyV3V0MEIw?=
 =?utf-8?B?UW45dzNQMHN4QmlxZFdWVUo3ZVZxY0JUMlpQR2oyRFlUbmpaVTJSMngyMUVQ?=
 =?utf-8?B?LytLaHRybVNzT3Y5TFpla1VzYVlBMExOR1o2djBoOUxZNlJJL05ZZ215MWNr?=
 =?utf-8?B?NUFpUDUxYXVGOGxyM1lBaVZvZHNsUGttTzFBQVhIOXFSYmduNkpxWmtiUjBK?=
 =?utf-8?B?WUdGbW5WTzdMU3l1OVQ3S3NrYWdqTkpubUVlTTgvVEZMZ05UUXl4WG01WWwz?=
 =?utf-8?B?b2ZFYVRVajJkaEFvMDhjNjB6VHkwbEF2cHVrOHZDbDJSY0d6V0VoNTkvVkpn?=
 =?utf-8?Q?lvjiwicc0DAFr57zPvv6dDCwxeoK/i0sJA37Lds?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3c4566-cc0e-4b7a-5f6c-08d9768e3957
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 08:12:27.0536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8a88GmPTb+EEbUFNmlcG9zf7XcTxP0BSYEE88b4ETPvv1FDMHSUoSsXFSSfnrtHk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4191
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

Am 13.09.21 um 10:09 schrieb xinhui pan:
> Allow TTM know if vendor set new ttm mananger out of bounds by adding
> build_bug_on.
>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>

Yeah, that looks better. Reviewed-by: Christian König 
<christian.koenig@amd.com>

Going to push that to drm-misc-next.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_range_manager.c |  8 ++++----
>   include/drm/ttm/ttm_device.h            |  3 +++
>   include/drm/ttm/ttm_range_manager.h     | 18 ++++++++++++++++--
>   3 files changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index 03395386e8a7..f2d702b66749 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -138,7 +138,7 @@ static const struct ttm_resource_manager_func ttm_range_manager_func = {
>    * Initialise a generic range manager for the selected memory type.
>    * The range manager is installed for this device in the type slot.
>    */
> -int ttm_range_man_init(struct ttm_device *bdev,
> +int ttm_range_man_init_nocheck(struct ttm_device *bdev,
>   		       unsigned type, bool use_tt,
>   		       unsigned long p_size)
>   {
> @@ -163,7 +163,7 @@ int ttm_range_man_init(struct ttm_device *bdev,
>   	ttm_resource_manager_set_used(man, true);
>   	return 0;
>   }
> -EXPORT_SYMBOL(ttm_range_man_init);
> +EXPORT_SYMBOL(ttm_range_man_init_nocheck);
>   
>   /**
>    * ttm_range_man_fini
> @@ -173,7 +173,7 @@ EXPORT_SYMBOL(ttm_range_man_init);
>    *
>    * Remove the generic range manager from a slot and tear it down.
>    */
> -int ttm_range_man_fini(struct ttm_device *bdev,
> +int ttm_range_man_fini_nocheck(struct ttm_device *bdev,
>   		       unsigned type)
>   {
>   	struct ttm_resource_manager *man = ttm_manager_type(bdev, type);
> @@ -197,4 +197,4 @@ int ttm_range_man_fini(struct ttm_device *bdev,
>   	kfree(rman);
>   	return 0;
>   }
> -EXPORT_SYMBOL(ttm_range_man_fini);
> +EXPORT_SYMBOL(ttm_range_man_fini_nocheck);
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 07d722950d5b..6f23724f5a06 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -285,12 +285,15 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   static inline struct ttm_resource_manager *
>   ttm_manager_type(struct ttm_device *bdev, int mem_type)
>   {
> +	BUILD_BUG_ON(__builtin_constant_p(mem_type)
> +		     && mem_type >= TTM_NUM_MEM_TYPES);
>   	return bdev->man_drv[mem_type];
>   }
>   
>   static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
>   					  struct ttm_resource_manager *manager)
>   {
> +	BUILD_BUG_ON(__builtin_constant_p(type) && type >= TTM_NUM_MEM_TYPES);
>   	bdev->man_drv[type] = manager;
>   }
>   
> diff --git a/include/drm/ttm/ttm_range_manager.h b/include/drm/ttm/ttm_range_manager.h
> index 22b6fa42ac20..7963b957e9ef 100644
> --- a/include/drm/ttm/ttm_range_manager.h
> +++ b/include/drm/ttm/ttm_range_manager.h
> @@ -4,6 +4,7 @@
>   #define _TTM_RANGE_MANAGER_H_
>   
>   #include <drm/ttm/ttm_resource.h>
> +#include <drm/ttm/ttm_device.h>
>   #include <drm/drm_mm.h>
>   
>   /**
> @@ -33,10 +34,23 @@ to_ttm_range_mgr_node(struct ttm_resource *res)
>   	return container_of(res, struct ttm_range_mgr_node, base);
>   }
>   
> -int ttm_range_man_init(struct ttm_device *bdev,
> +int ttm_range_man_init_nocheck(struct ttm_device *bdev,
>   		       unsigned type, bool use_tt,
>   		       unsigned long p_size);
> -int ttm_range_man_fini(struct ttm_device *bdev,
> +int ttm_range_man_fini_nocheck(struct ttm_device *bdev,
>   		       unsigned type);
> +static __always_inline int ttm_range_man_init(struct ttm_device *bdev,
> +		       unsigned int type, bool use_tt,
> +		       unsigned long p_size)
> +{
> +	BUILD_BUG_ON(__builtin_constant_p(type) && type >= TTM_NUM_MEM_TYPES);
> +	return ttm_range_man_init_nocheck(bdev, type, use_tt, p_size);
> +}
>   
> +static __always_inline int ttm_range_man_fini(struct ttm_device *bdev,
> +		       unsigned int type)
> +{
> +	BUILD_BUG_ON(__builtin_constant_p(type) && type >= TTM_NUM_MEM_TYPES);
> +	return ttm_range_man_fini_nocheck(bdev, type);
> +}
>   #endif

