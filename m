Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9AA3F77B9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 16:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572306E2EF;
	Wed, 25 Aug 2021 14:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECC46E2C0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 14:48:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8p432yLp/P88jtS4a9R+B+5Iv2w8JVZSHxkUuyZSUjPm/9GbGgYxFS5balghB3XDkJIB2NpLWjTMUTrbL30fmFJIbHGxQ6EWJmi5WnY0n1gODrXobzVcHAGw1bjl8O+TktuLig8USrt1ErdyW+HnCnP4luZMmMo8kLHyD5e9dG1IeR2W8tg75NuT5GjbzcYks65Vvbqd4L1+1PW9NZ3/vG6uBWy0gxOk5r7WLmhy9EQBjLjKkOnjyGK4yF5Xd6UCnVxuq3xWy+F3gHmrXg/LS9nmmyPg8L78xnUkUtzJhINwg1Rs5X7JYqIM/LF4jsTlk+dzeHZsLdU7tbamd9f7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qHqIEoxeIQpR7BHA8HeqWSqfLpgUMCB3aDCb0Bs464=;
 b=aCgJ768m7vWzF5T0ecMm/i1zS3Rpcn72vTVMf7rQJS6FVI0QfTCK99LWY5WfP3gJARF2Ej6P18FdegxYs7BEAwi7wqLt9+Ab16FWDIcdCXFjuNTiq5BU/i6jQH0DbDSr+ueEpdJiJnLFkupO0UCPl9nFlzpskvDxES2oOqrdtiM7c1cqrM3WCkklYjIei5aDsAltnaraPdK3JKkMaBhqVqWWWJrHK+4KucUTHTGTUiDP4276aMYgOl9Knfa+J4Am8H2KBs310FBKpraLcYZ3R/rPIrD0APkpNfcrWWxv6XW54Fk1YXKOW+Hn2oSRzSwMXoLUt8t5C9MMsyn5QLaNeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qHqIEoxeIQpR7BHA8HeqWSqfLpgUMCB3aDCb0Bs464=;
 b=MwAZdaC8wvgHl9m480lZTsqNoXqdD2acJym5kx/BMlQVJoaVVXCoG8JYXdBLL1bpr/59tOt1t/MB7DAaylt5KhxXWoTXdufLf62zicK8drlNR0vmUVScTIfVwXfFUJTmOx5y3epbYlASnk89PH6UbWfP73qMfeKOHhRweyNDeyo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5308.namprd12.prod.outlook.com (2603:10b6:408:105::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Wed, 25 Aug
 2021 14:34:23 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%3]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 14:34:22 +0000
Subject: Re: [PATCH v1 05/14] drm/amdkfd: ref count init for device pages
To: Alex Sierra <alex.sierra@amd.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 hch@lst.de, jgg@nvidia.com, jglisse@redhat.com
References: <20210825034828.12927-1-alex.sierra@amd.com>
 <20210825034828.12927-6-alex.sierra@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <9518973c-fe01-9e77-5a5b-e299c3ee3cee@amd.com>
Date: Wed, 25 Aug 2021 10:34:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210825034828.12927-6-alex.sierra@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0155.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::34) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.47.3) by
 YT1PR01CA0155.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 14:34:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad96be1a-08ce-4e8e-c4d4-08d967d56e54
X-MS-TrafficTypeDiagnostic: BN9PR12MB5308:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB53082811D4B25B865639B45992C69@BN9PR12MB5308.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T7DBUOyXLHR5q1iJoN3Q55xKdD2k5d2DMkjBhybj8ohd2vC1qYDJaNIgAzR+j5xfbh2anYcSWZ1SngtB/cO0GIW+5emv7BsRvGn5T2JaYXi+1dOYjHNNrlcQu7tm2YsKFfsFb6YDmICR7T/uwW+9JDn71x9yuvraiHbpiG8gx0yN9Eql/yijJNfreI3kQ/damxl5Kv8GFv6GlIKn58JvfQm6YjIOkXE+9q4VZu8h/a/uAAjZlJI2/Ysv9lQZq46k6hOVX8xNEXojhuxW1gIJU6Na8t62jsMpEMEEoHgnnoSGJ35RjuthhUJBu0OG2bpNpS+0i4oyO5RKgCMB4d3nn0CaBL1vst++ZbWKADIoN8iFz8rziJVJD8ewZFt+IwouIF7mifLSUFVjXDYtSi7Oe1NjE7+Kqz43Ynrab/rgA72NQQdC0GsLMelfAcrmSzGK1D/RFM4An32w9zy5SyWze19S4flQApnUa91DFQcDnakVW3EXRf61kq2MWpttDfi4IAA5YUWQ1eWl6+uKeNeW1xPuep33AwFxeDe7WrANjnm9Ahl24QJnJSy+Ft5NZcMHO3h514811dPGGFVbKEh5MC+9CdJa8CSo9wkY7FkuGj+sp3wRaTOvQ71lWzcU+0yM3MfOqjWEbF9/ibfQ53NaGBgURCLoFozo5PiEAgLvNMZcveEWAueNKCBB2w/X0TtR6kPRm6AM8IxYKp7yj0cyxGRHATkH/U2FOklb4VZU244=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(8676002)(478600001)(83380400001)(6486002)(44832011)(2906002)(4326008)(186003)(8936002)(31686004)(316002)(66946007)(86362001)(7416002)(66556008)(2616005)(26005)(36756003)(66476007)(956004)(16576012)(31696002)(38100700002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0s0aTRpSzQ3M0VZR1pyM09FeS9ZbkN6QzZaU0IxbGczS0NuQ2psbVlWZ1pS?=
 =?utf-8?B?TTNHTHFIcnZ2cm1pUTFWeElnWDgwc3M3d3NJNTkzTjFZb1dudnpod2FSVHpR?=
 =?utf-8?B?Ri9PaCtuZHp6TzdHNDBMUCtyQW0zaEh1VW4rZHgrRytxYXVLeUJpUW1VSmg3?=
 =?utf-8?B?L2ZtMnBWTUh6TUpyTjdmRHZKTWhEd1JiNVhiSjZ3a3FDS1ZvTnlpUHpLWjlO?=
 =?utf-8?B?eGF4a3kxT1BER3cvZVp5NURTOTQ0YUJvcXJYcE1tME5jV1dTK1JYcWZnMEdI?=
 =?utf-8?B?dDRiRHJrSEZFMGlsbzBGK05wS1NaMWQ5b1lWMTZNUmF5ZFVvWkN0RXJQUkZR?=
 =?utf-8?B?Qm1wZzhNWDZOZDZsbThpUkMxaFM1R1FmRml1aU5mSjZEUWF3eW9aZXBpaGNT?=
 =?utf-8?B?cTBiNGEzRlk5a3Y0TExDeWV5a3JIdFJMbFlHQjFldzcvMTlTbEVMQlRCN2ow?=
 =?utf-8?B?RzRUazdSZzYzeGxJdEhJdFZXcFFBVnp1OGttWXdieFEzOUxvZkpTa2puL3BC?=
 =?utf-8?B?cnV6MGpET1NocU1UbEhsdUJtVHZVM0d6eXYyTXRJVEJPM2FuaWZIRHVvLzBB?=
 =?utf-8?B?QzlTWFhkcjdUN3R1V0RMaGsrYTZ5T1k4Q0kzalJCdWpMSlZxUG1HZmE5MGk1?=
 =?utf-8?B?Y05mNngvWWRsMzNvb2p2TStJNzZkeDNoOVB3Nk9rNkNyeWcvakZhalBQdlVZ?=
 =?utf-8?B?SEJKRmRZU2hEVnozV0k3bkRuMldsbVlzQ0JkWG1icFJVaHAvYlNWdXFndE1Y?=
 =?utf-8?B?b3RhaXY4TGdjZ3poaTM1WmVHNm9hR0pRSUcrVU90M2dmbFRuVUxadmZLajhH?=
 =?utf-8?B?ZzNOYXFiV2QrZGhUeG03OHJiZFVXdjBTY2h1aHdaRG5mbzV6Nll4V255cUhZ?=
 =?utf-8?B?WmIxLzhiSmNOVkdNOFdWVnZjWmxVbzU0eC9tL3owdFJpNmhSdzFVcDVXb1gz?=
 =?utf-8?B?ek9LSUwrWisvTnZ2ZFBKSzAvbmQ0ZXBXR2tuWTJSK0N6R0RRb0o5Ujk2Sk1h?=
 =?utf-8?B?TnZ2VHdOa2lCbzVpWm8ycjJzajM2TGlrd3YvdVh4dXAwSytLbVJJYjdRSVFz?=
 =?utf-8?B?Q3Q2VUZwQXc3NUhYRDdNSldud1lVRE9VQlltL1hGSkZINTNFYXNEZU9tdUsw?=
 =?utf-8?B?V2tQNzU5REdBeFdxZnNaWEJDVXF0ZU5tVFl5anB2Y1VOUGE1anFnbXl0cnFF?=
 =?utf-8?B?eUZmNzBISE5WME1VYnBLRGF0NlQ2VHZjcmlVQjRNcVlTRjl6VFVXQTFUT0lp?=
 =?utf-8?B?eE5KL3FISTJvbWFuUnZmaTFMTWdRQ3ZWWkJpbUhGQ2cxQ1h1SG5rTDhTSGZJ?=
 =?utf-8?B?alBLN2NNUllvRHM1QjA3T25SZkk2L2pMSVlteHFsVDl6c0dINUZxQVFtcm9P?=
 =?utf-8?B?UnY3NXBNY2MxQVVlcU9zbjEwZUs2Z2tDU2YvUzlvRTN0SzBjM3ErUUNsM3h6?=
 =?utf-8?B?Sjk1VHRpUTM4UFdBWE5OeFdVK0duQUU2c1h5ODBwcjhsWWRHeTgzVjJTSXJm?=
 =?utf-8?B?S1NJWERSR0NlSm1aK1JBT25Cb2w2aUZoSmpHUWNuRjJWUkRoeUswQThZS09N?=
 =?utf-8?B?b1RpNjdaT05FTVpsdnlpbXZ0dzJnMWFoOW9IMVVQZFJucEUvWXZscVE0MXh5?=
 =?utf-8?B?VkdXMkdhRkF1K3RsOXZXZ3RMcFgvaitqUGZrWXVEZ1ZtWGlNdWNSYkUvY0M1?=
 =?utf-8?B?Yi8rYUUxU1BFd2JjTDJLaGxINk1qK0VCWkNsL0FmZ1N1THN5VXVRVGNkajdP?=
 =?utf-8?Q?Kbu9kg+LAKXEk9iHpifpjXsGPh0jZ3hgFEgYr2s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad96be1a-08ce-4e8e-c4d4-08d967d56e54
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 14:34:22.8421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hje9ISSUwxA1iURZKsj9aK2TkKomtHwsPLiR6FMlcaWp6R9Zjw5h/s4vCbF+lZGrzIsY5sw++HIDuLGpQrzlcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5308
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

Am 2021-08-24 um 11:48 p.m. schrieb Alex Sierra:
> Ref counter from device pages is init to zero during memmap init zone.
> The first time a new device page is allocated to migrate data into it,
> its ref counter needs to be initialized to one.
>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index dab290a4d19d..47ee9a895cd2 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -220,7 +220,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
>  	page = pfn_to_page(pfn);
>  	svm_range_bo_ref(prange->svm_bo);
>  	page->zone_device_data = prange->svm_bo;
> -	get_page(page);

There is an assumption here that the page refcount is 0 because the page
should be unused. I'd add a VM_BUG_ON_PAGE(page_ref_count(page), page)
here to check that assumption.

Regards,
  Felix


> +	init_page_count(page);
>  	lock_page(page);
>  }
>  
