Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15BA66B5AE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 03:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E77A10E08E;
	Mon, 16 Jan 2023 02:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE34D10E0F2;
 Mon, 16 Jan 2023 02:44:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neFrCuhJZ6Dc427Fgj11KrKJbgKEbdDs73RxUaKwFLGWS9CeY2e4MAECteNrqRlRFOA2iMKiB3mGWwIlPx74FdhF1TPnkjzNeuGCUvOodV/ZPrOVm+aAfdbdqRVBex/TDim0yWDfi5iFczdlwnD7McQC5PkBM/ZVSM5XVe4GiDZqVUxqzPLqpFIyTUCgh8hsbdWgx7tm7b9NJwScHe/PAjaoIxgIZIMVHqdn3m7KGUH0goJBt5EoS+OIC7eyCO6lB8mXSE0i7lfUXhxA3yOSKwzlKZbOh5sAASgGZSIWW9VdiavPwRiWyC1nXNYfBT5DfBSEKKyNQo85snQBRKcyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mvkxg6h5zPUwguNkTETVhG1zh9/0p1Wy5eSFrc+eLcI=;
 b=jDxhOc88tdZaKGENqh08vcTLO9vdo9FCr9M3HJEGNa4/pyOmD3+OqC4OiLStTNVWIga1vIQ5ppbmGh3RRKeuSgybBwoFmHQ1OzCPKnowSqwkRn678U9bng/IFcEGNDAR9mCvXwxuw3+MMWopbYuUGdq4Ulyp104tmSkB/VcgTV0F+OVTRj6uMOqgYVSH5A2s82dlTjklAEvc0do1eLIz7Ghz77SqpxrPnHCaXER5O1qlvqsZsIPckwNaCZxNeONsy0+jH14Qi+ympo3gDBVgWnsZ3N0PiCgV9b9o4Ytrh/CvSe15BJ117A8YN1+dks2SS7w5E9pmtqo4FS6/3FFCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mvkxg6h5zPUwguNkTETVhG1zh9/0p1Wy5eSFrc+eLcI=;
 b=xDCPvVXe+Lc6I8D2MBjEFBJ2nZn0+7dsmhdz98y+Tl9jUJ/+AUKPTFwp9WybEjzcy02ldsybuFt+CM6h71mxF4EA2rc9akQiJWR/M1XOXyrNOevjlnTDDMK5NSKjkjEfC/iJtZnxky8tkZWUO0iqUGvErZNhkLq3pct/w3saH1s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) by
 SJ0PR12MB5455.namprd12.prod.outlook.com (2603:10b6:a03:3ba::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 02:44:35 +0000
Received: from DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::edd2:a5a0:32e4:ae3d]) by DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::edd2:a5a0:32e4:ae3d%3]) with mapi id 15.20.6002.013; Mon, 16 Jan 2023
 02:44:35 +0000
Message-ID: <ada9ea13-37af-16c3-f662-e6e4cb20cbaf@amd.com>
Date: Mon, 16 Jan 2023 10:44:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] drm/ttm: Use debugfs_remove_recursive to remove ttm
 directory
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230113053416.2175988-1-Jun.Ma2@amd.com>
 <20230113053416.2175988-2-Jun.Ma2@amd.com>
 <7cafcbb2-f2bf-b7f8-8627-acdcaea258c1@amd.com>
Content-Language: en-US
From: "Ma, Jun" <majun@amd.com>
In-Reply-To: <7cafcbb2-f2bf-b7f8-8627-acdcaea258c1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
 To DM4PR12MB6351.namprd12.prod.outlook.com
 (2603:10b6:8:a2::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6351:EE_|SJ0PR12MB5455:EE_
X-MS-Office365-Filtering-Correlation-Id: 1682399b-7de9-4a51-9678-08daf76b9a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HlEWbwIJICn1izuh1cEGILxrwD3EhBpSUPRurxm8mYnbzc42dI1UbC30Y/r1RPtWRUIobtJIj+yy5NeIra4ml5miOh+q0TIboTSenu5eDgQ0lPK6AbFW1K7sdKOQodd9zCvbDKzx4tTBXZFrwGEj306d929xY1SISPlOgtFfDahLAEaC3Lnt3SpVKTvoUsbj0/NfNbuRXviPynz3IxCqLYoiNt5mEWwVpIu0ZZWAwyc5lxM/PmxeSal8NbAuPVaB/X9/9zLLy2jZY2JFu1A4JVtkp4QAHjCfVtu3v54BK20zVqs9TJPaA1ykVqV9J++oY6/MJM4IldQ0ZQiNBeWdazg9hQFRnBRU84fIcBirM/IWmD8EoDX3FqutUaV2JmY4oxLkZf3bJZ7Z62cxZNwacb1J24LGajhxm21CYkOyHZejxY5lJgN7RWqJDd1hZOmXrHK7PgNQgpOEWvJPknSPlUBi2ZhD3gKVn2rqu1U+cN1TicUhJWK+8u3R+YBUYMwFTJk3T0gJS2GYgjGJ3s/OveSzxpz4z6gGBzUke3O9IFbEWMR8usvRD/OJiyzjC//pbTX2EVduYOMxINb4QOoFBjOxYnXStXwFEqAP7C7B9l7ig/cJnFy0M7Fvf0wGsBq4v0lnMZbVj9YWJcbtU3rwWdr7RSTWgF2KEBkywFV1Ixy0MTAZwlWTpGVdm5th7/J3FHQoTnOB22XQvQXGDxPsC5smmzpt8KHC+RwHKufSPE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6351.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199015)(316002)(110136005)(41300700001)(66556008)(36756003)(8676002)(66476007)(66946007)(4326008)(83380400001)(450100002)(6666004)(66574015)(38100700002)(478600001)(6486002)(31696002)(2616005)(6506007)(6512007)(186003)(53546011)(26005)(2906002)(31686004)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2srSzQwUDJ3b1R3OU8rQnltNnNHL0JhVUZSR3dwbXhiVE5vWHM0SXRra3pz?=
 =?utf-8?B?SytzeUU5UEFqeGRXdkZ2ZFgwT1lLelV2VmJBTGQ3OUF2L1RXanhIRWUwaEJL?=
 =?utf-8?B?S2JySFYybXJyU1MrWGQ4Ryt1Vlo2SmlPU1R6SnZGNmdiR3l2K3NzbFFDdFEr?=
 =?utf-8?B?M2pXTzAwRkFFUVR6Q0RhR0FGb3hnZWlXd1hKQnE4TVh2cHN4MmhjWklSY0tE?=
 =?utf-8?B?U1VnclQ2bXNoYXFMVFhwZEI2bWNlTVZaWWpIUjVCYmpnSnMwbEQvUWtVNEhn?=
 =?utf-8?B?VkdaWndaRXkzMGdGalFJV0hGN2E1d0RyNHVLZCs2eVJLWG85K2JobjNKbGRu?=
 =?utf-8?B?L0Q1ZUpMVXc2Q09NKzlKN3JsQ1V2MStucFd5dXZEWXIza25GVWQ1endzSVd4?=
 =?utf-8?B?SHNQQmxJeWk2M3VCcjU4QmVQR2pDdkxqcGhWdG5lcXBqcnhESjRjNW82VFFF?=
 =?utf-8?B?UlM0RjVTUW1hdHVIMkh3bEF2V3ZDRjkvYmtZRzNVYmlMVjZ4OEoyZWZIVXNm?=
 =?utf-8?B?VmkrbWZIL3RCZFRyWDZMaXlTSWhFMEROZDJQOU04Y0FaV0JBb2M4amZxa3ZW?=
 =?utf-8?B?ZTl1R01JQjRuRW9waXFjUFpSZ29LZGowVy9xaG8xcm9uclhmZ3grZWlzQjd4?=
 =?utf-8?B?UklFZ2VYcXpmS3VsUVZQYVFUNVh3czk1QW9Zbk8vYlFLVDlrWHNCTEVkWFI0?=
 =?utf-8?B?bzlUSi9yRGFsT3F0UHgrZE1kVExnSmV3TnZZNjhUanBGZjhoaU1NMXB6b29a?=
 =?utf-8?B?YVBJaUtUNlVuSXV2eml2MzVwWitmWE9jV2hkN1RtNDJac1dVZXRKRE8zV0dt?=
 =?utf-8?B?TlVTQTlkY1oyR25HWFQyclgrcUJVMEpaVkw2c09Pczk5YmlZL3Q4RU5oZGw3?=
 =?utf-8?B?ZmtNZDdtT1lRQ1lhdDdZQnZ1YTZDUExmazJXVURQZ29zT3h3VlZaNHJmZGxU?=
 =?utf-8?B?VDZLdmVFWEV3Mkp0K1J3bkdnMGhyZHVRU3ZLTGNZa3JtV3QyR0RKNlNKbHdq?=
 =?utf-8?B?RkExcitsMHVVcTFaa2FRRGVvZ1BnNVArRy91bzF5OHN3MEVSSmxSd251dXhp?=
 =?utf-8?B?MFRUUWpBVTI3K3l6dlg5VDIvOUtvWGlsYzg0dnN0TjNPVVlraGNQK0loUzYz?=
 =?utf-8?B?SXJCNGxKTStXYUpqTDJMQ0hRVEJmcFVONDNMSzF0WER2UHVMdGxWSDg3eG8r?=
 =?utf-8?B?Zy8vNjQ4NlYwS1F2NWJqeVY5T0R0RHdIdW03b3RqN2xQaThZbGlJNXl2NE1p?=
 =?utf-8?B?bi8zR3Vsb1FaUVk3T0dQSUF1S01YN3BjdlhRcmFBZjVtVy9aTXRGcTFZc1lr?=
 =?utf-8?B?bm0wejZIZ0xlOWZ1c2EveVhGWEhFUzhwa1FwNW1FeFR5WlVpRkl4N1BxU2Va?=
 =?utf-8?B?ZEY2aUk4K1hldlljUTlsMDVwa2plZlVHd1kwRU5tQ3ArTTl5NlJDeHpBcXo5?=
 =?utf-8?B?RHZMV1JVNjdoZUM4T3MvdjB6QzNSQ0FtZ2NCcXg3dXlHVTZPaU9wZUI3OUQ4?=
 =?utf-8?B?K0FUcS9sQnNYNFFTaGdSYlVzZUc2NEpjVGF2Q29LbU9mUzhMdksvQ1cwT0hW?=
 =?utf-8?B?M0g0V2Q2TjV5UVdYUFR4bGZDVGFlQ1g0dDVqcFlkSWxVclhCN2REeGQyZ05H?=
 =?utf-8?B?dWFxT2EvNS95RHBHdkVXV0JTVVlLYUt4TjIvRFZnM0pYSEZGclY3SzFUMUNB?=
 =?utf-8?B?Ylk3Szh2cXN6VjRHZW1NVFVnb3dPN3pxZkJSUWR4WlVRWFZ2a0xiYThDWGJN?=
 =?utf-8?B?TTJQR2tOOVRhQU1sZ2I2elZRZG1nOGgrZkJkak9DVlQ4dEtQNHVCazA1OCtL?=
 =?utf-8?B?YVRFWHgvTW1ZREo1ZnZzaHB2SnQ0UnlWUkFjUW5xelZwY0JDR0lySWIvbkN4?=
 =?utf-8?B?cVlwaDl6VStiNkNsNXpYYmNiSVlWR0E2V0ZCTHVzTkNZQ2tzYU9XaHJXTWti?=
 =?utf-8?B?Zzh4SmZ1TmFxa1pJSnJ1ek9kTG90eDZ4VDBPNnZGUzJVRVU0L3JXOFQ5U2p2?=
 =?utf-8?B?YkNOb2xpaFNPRkE4bXlvaDBUZlFoaEZwclo5aFJLOUpLSitKZEVwOHJrVUh5?=
 =?utf-8?B?T2FJenNkc04rdlFZNjEyTjNTem5mazVYMkxnZmtMbWlTaVNvV3BsOFcxTTBi?=
 =?utf-8?Q?a0nA/TyV/WJpagazMTma/H1/h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1682399b-7de9-4a51-9678-08daf76b9a5d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6351.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 02:44:35.0669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVJW49/nEZ4/hDUsty2w33ZhPr7Vgi3+pRw8OW/VSBkyIuhNLXkhAwrS0c1HvmRY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5455
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
Cc: majun@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/13/2023 5:38 PM, Christian König wrote:
> Am 13.01.23 um 06:34 schrieb Ma Jun:
>> Use debugfs_remove_recursive to remove the /sys/kernel/debug/ttm
>> directory for better compatibility. Becuase debugfs_remove fails
>> on older kernel.
> 
> Again NAK for upstreaming.
> 
> The upstream kernel is made for the newest kernel version and should not 
> contain any compatibility handling for older kernels.
> 
Yes, generally so.

But the debugfs_remove_recursive() and debugfs_remove() are same function now.
The debugfs_remove_recursive is used here so that we don't need to make kcl patch
for it.

Regards,
Ma Jun

> Christian.
> 
>>
>> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
>> index 967bc2244df3..590297123bb2 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -55,7 +55,7 @@ static void ttm_global_release(void)
>>   		goto out;
>>   
>>   	ttm_pool_mgr_fini();
>> -	debugfs_remove(ttm_debugfs_root);
>> +	debugfs_remove_recursive(ttm_debugfs_root);
>>   
>>   	__free_page(glob->dummy_read_page);
>>   	memset(glob, 0, sizeof(*glob));
> 
