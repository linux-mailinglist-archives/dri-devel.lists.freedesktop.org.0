Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1520A40D367
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 08:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453DA6EAB5;
	Thu, 16 Sep 2021 06:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456C16EAB4;
 Thu, 16 Sep 2021 06:47:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMzWZ+8dzlOQd4wO6bk5XL3s+NpaIOxZI7XcRHZDkyNcqA8EkEpYYoebbQwzIWz1eRzXklYic5J1hn87kRxTUaULpkbEpOWjcD2F3eG/h+rkyPX9vgkK38Z6YtmlMffGMi1MSn6oiS78jG4MqMKygR7D1hg0p3LLzomWwMB0saKL5UlpMIbd6ffGZWCGzAE/+T4X/nCF68Go8AiUlgjTTaEI6zNL9ua1FkEz6oAS9+3pBVkioS3Fa/lFTLFZcDPIThDEkoeDJ8gE6sI6k0L3bRL29OVerq/zdSpPXPwOJwEC+khXZxUlPgy67dL3/lfiWLYgliBXt3Y6RGqhX4oXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=VePey9Yut5NuyZtOsn6beWgO3bYBRgydNhRIu3KR5e0=;
 b=n8KtzyTd7zMQYMZFq1Vajgp8Ue4y56dkO7tT2Y+XxzrtrGFya0c672UUQ+sOdjDUwhcmwihV1rh3VsCXYKvb8Q3KyMkIuDgWmJ9iW5y3CEJ5eGESo1/TnWvXCkh7X76Kz3btLTqfIBak/nJCQ6BWvMEdCyiElLgWGp17jfaC7vNqJVPSRx2CdZ+8FNN9IPRBsfHHlWDoP6wBN306Hjv/sQA2SSv7MJWwYrqSGlfQT9NlgKAR/I9+8YEBVAicXDGbQS1Wssui+nGotDyEU9aXSIsUEIr0WWxxbPxVf0+Z5bNBfIvBH3iuFOYiW+cmLpFSg9KIlOD5H0CFVM4hGQucUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VePey9Yut5NuyZtOsn6beWgO3bYBRgydNhRIu3KR5e0=;
 b=iZk8wbSQTx8g6kAXfg5M6I6U8R3SJ0ljKkrOJIcnNXAF3EOaZ3UV0LZpb6Tk+lTJAtXTw06arBjOp6+HfqsPu5CY+hysTnN0oNSvLrHHg9MubxjZF6ZuQOxiNRqxUoETEmCtsnxEMG78O7GXlu5JvB6Q9wNawcbO+9vIWAKOW9M=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4847.namprd12.prod.outlook.com (2603:10b6:208:1ba::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 06:47:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4523.014; Thu, 16 Sep 2021
 06:47:41 +0000
Subject: Re: [PATCH v3 01/12] drm/ttm: stop setting page->index for the ttm_tt
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210915185954.3114858-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <06157d68-71e1-cf94-7893-ad2309908ad5@amd.com>
Date: Thu, 16 Sep 2021 08:47:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210915185954.3114858-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0011.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR10CA0011.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Thu, 16 Sep 2021 06:47:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7406836d-9d31-41cd-1f01-08d978dde123
X-MS-TrafficTypeDiagnostic: MN2PR12MB4847:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4847F927E167A0C92416D62B83DC9@MN2PR12MB4847.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UYOSA6q3mOI6psjx08CWEE9dl0qVKZWEZqVhJwcNJijwPmaFJSE5L0a1erSGcIKwm7MN7Ym1PErRYylwmrgw2bSQV2jaTlhbJ0+Gm2r2xkpPeNcGb4xcksdHoWjhLO9GYmVMotA4e66JG9L8dDHOEqq8uaxNZgKjTbYb9OgpR1Umo/GpWG3wiUtcAel6OfZsvx3uyc2U70SL+yg9/5sPwKxD6+G8vcsdm9hWsXt13EiL/0n4leVtM1l5Af4+ZBntdu3X1w5qIJTV/vOaxY0AMlqRimDLYBzcBPZrvldogjEQqr3JrTKDpxoNQlwGCbsWsSRCT17TYlgHX+r/LV6IXBReXDYj/XOgv7QL/7AEv+yRrLSVl3mWlFrkdlzStIS6b+vWVz7d1LuiW7YFoGvJ66aPv68qk0vU4dMknQB344dMNYCTqd0ydbRuZcoFijBN165+TnWvMgUlhpWf1tfM+L4J04tf0/jovBpzHo0Egv6cwTj/l/bjMzERPQ3uAwAYvdHesDATTy43unEHMVzSLXOzN8m9i6XtV1I1TcthkPq37YOQCjQA/M54cdto675NoHhR4OvueTAGT0Q6wljFmS8SZpH3ghM+/Az6QMXijyniVygOplwTrF8woWt8zNxWwDPQT9ni66PDyuqUHUTfw1TbWmmcjNcaWMy4Ab7iaNcaFEdXZKuA5HesIwa71twOtvP/NrSWXtN53LTEDFL8+oSZ1uLO0HndZB1adwx3O3BvrVBbq3PQ8gYwIiEcLByb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(6486002)(478600001)(2906002)(36756003)(38100700002)(31686004)(4326008)(316002)(16576012)(31696002)(6666004)(956004)(86362001)(26005)(2616005)(186003)(5660300002)(66476007)(8936002)(66556008)(66946007)(8676002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXprNUdxYU5MLzNJNEFrMVBJV1E5dk5uNFU4K1RBajVRNlJ2MElWL2pNcEVK?=
 =?utf-8?B?aGgzL1Y3QjNkcFptdFBXeVFvdk9LemM0NFBwZ3hTendoRjRUakxIOStyVmhB?=
 =?utf-8?B?elpMYkpOS3htOGFrMWdUM0lOVDkxQWRuQ1NINjhkNUhqbFJUQm1NOE80MS9T?=
 =?utf-8?B?eWlFbUIvN1prbXIxWjNPYUZ1VUlNVmFPc0crSWJxSGtuY0FVeDg3STdEaFA2?=
 =?utf-8?B?WGRQdXVVMVFmT08yZWtKVkRzY1VLVXB5WkxGQllSQUU1S1lQTVlHeXRWUzJ4?=
 =?utf-8?B?VUNwaWZWNEVxQWJrVk1WRUs0bFFFWWNmYjg2SC9oNzFkT1NJc29GQW8wMTdL?=
 =?utf-8?B?cURWd1h6K3NEbWRtcC9kMXJEZTJDWStVU293VVlaU2dWdk9CTkVObkNvcURL?=
 =?utf-8?B?UkJLOWNnS3QvS3pzSDVHeFlpQ1VwS2ZJVmcwZ3hwVjJwSWNrNFUzRUxESFYr?=
 =?utf-8?B?clh2ZlVwY1ZIOWhXY29FY3FJcVdHMjBlWFh3YmZBNjhoaXJBZDAvT244T1Jk?=
 =?utf-8?B?WnRmcUpDSUp4RDQxYVM2emR2YStRN0ZEa3E2K1A4cWNOSmoza015dnZjSnZ4?=
 =?utf-8?B?QVNhWkk3bUNxTENnZEY1ZzVRYUxmNWtmKzVlWkN3aEVVV3dhenl4cElML2VC?=
 =?utf-8?B?K2s5SStiMkNkTDNRY1gza2thZU1xMVRoeUxLQ2cvYy9zcWdEOE9OK25rdlRr?=
 =?utf-8?B?TzNuY2pZMXFCQStlWFBTVVhyNU1aMjNPcGp0K1A0ck1xMHNOSEQwMDRsaUZV?=
 =?utf-8?B?aVBoaDIzd2ZvYk1SMElrUWJnODNYVzZjV01QUDdZTlRyV3J0SE5EL2FzeHcz?=
 =?utf-8?B?b1ZURzUvWDNHRVlkUkRmaHVreWQ4UkhscGhuREh1UW9jRE8zR1FZOSs2c0RR?=
 =?utf-8?B?bWduU3F0aVJxc0VIMDBKQldsUkdBWU9ma1hjaTRxREFENGhSYnRrZDkvd3hE?=
 =?utf-8?B?NHBwMTM3bEN4N04yUnJ4b29FTkV1UUpDcFRHQXgrTmt3ZGk4MnZraXFlL0Vh?=
 =?utf-8?B?NGdPZUpnbWNJa1JIbWd0NTN2aW9MU3NDYUNUN2hsSDJhOEhGZEpIRi9MbURx?=
 =?utf-8?B?TDVCWmxQNnhyUlZuTXQrM2pqQ0FMb3JiRjJGSWRaTzR2MkFvNXVYR2tJVHVN?=
 =?utf-8?B?b1dkMTlNTUxhQlZ1WDQzdklNR1ZCRjVMUDBKWkgvaHY0UGZFME16WWMwc3VF?=
 =?utf-8?B?MGlOOVNJaVBNaHM3S0hKTXhTMmY5SVlEOTRiY2RPME1IVUhpd2x6VEMzYlhV?=
 =?utf-8?B?V3RpOVZKWnJBMUZHblNPU3FwbmI4SnQvYk5hbUpiNnZxVGZQRTFEdGxVWDNH?=
 =?utf-8?B?Z1pRV3pRdW9oek85anUyTS9DaVBoUmZqZm0raWcySGZweVZ3dWJHeDdWZysy?=
 =?utf-8?B?QU9LVExOQ0xOZVYzVmVRdHJrZUQ1OXo0S0NDYjdYb29KS0Q1OXdsUk1wR3JQ?=
 =?utf-8?B?UWNjL3MvZmZHd1FiZkgyaU15UmpsSWRCM2YxSmx4aGNta0lselFEOFJacGty?=
 =?utf-8?B?UEpZelRxcXlhTDE4SXdYN1Y2NnMxRlo1dTFsbmlOSzNOM29tOS9LK0RxalRi?=
 =?utf-8?B?MmxqQnJvRm5GYVdUMmh4c29PLzhDNGh0cGYwaU9pR3g0a3d0VlVIVGxsbENl?=
 =?utf-8?B?V1J3VE1kU3h3eU1XcERrWnJWVW4xRHFjbU96SStFZVcwb25KTjNWRjFsSGdu?=
 =?utf-8?B?d2RNZ3VsVU5oNlhSeVhocFRpUXVxMjkyT2pjRWtITExPVnRBbHVNN1JOOXA1?=
 =?utf-8?Q?zWGHDBvjmMmLb5KYfRlx65KUg/3Ji2f7/TcwhHt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7406836d-9d31-41cd-1f01-08d978dde123
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 06:47:41.1785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qk+KmNWC65wms4lViCD9CL0un5Q5HYI/zyNEAhlhFp2nBZcLtsO/u8xZe6yutkdL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4847
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

Am 15.09.21 um 20:59 schrieb Matthew Auld:
> In commit:
>
> commit 58aa6622d32af7d2c08d45085f44c54554a16ed7
> Author: Thomas Hellstrom <thellstrom@vmware.com>
> Date:   Fri Jan 3 11:47:23 2014 +0100
>
>      drm/ttm: Correctly set page mapping and -index members
>
> we started setting the page->mapping and page->index to point to the
> virtual address space, if the pages were faulted with TTM. Apparently
> this was needed for core-mm to able to reverse lookup the virtual
> address given the struct page, and potentially unmap it from the page
> tables. However as pointed out by Thomas, since we are now using
> PFN_MAP, instead of say PFN_MIXED, this should no longer be the case.
>
> There was also apparently some usecase in vmwgfx which needed this for
> dirty tracking, but that also doesn't appear to be the case anymore, as
> pointed out by Thomas.
>
> We still need keep the page->mapping for now, since that is still needed
> for different reasons, but we try to address that in the next patch.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Fingers crossed that this really works as documented.

> ---
>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 --
>   drivers/gpu/drm/ttm/ttm_tt.c    | 4 +---
>   2 files changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index f56be5bc0861..906ec8a1bf5a 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -346,8 +346,6 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>   			} else if (unlikely(!page)) {
>   				break;
>   			}
> -			page->index = drm_vma_node_start(&bo->base.vma_node) +
> -				page_offset;
>   			pfn = page_to_pfn(page);
>   		}
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index dae52433beeb..1cc04c224988 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -367,10 +367,8 @@ static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
>   	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
>   		return;
>   
> -	for (i = 0; i < ttm->num_pages; ++i) {
> +	for (i = 0; i < ttm->num_pages; ++i)
>   		(*page)->mapping = NULL;
> -		(*page++)->index = 0;
> -	}
>   }
>   
>   void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)

