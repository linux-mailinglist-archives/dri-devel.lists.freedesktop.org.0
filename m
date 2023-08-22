Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74446783D32
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 11:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111E010E2E8;
	Tue, 22 Aug 2023 09:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BE210E2EA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 09:43:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7yZtWN+Cl+RIqUnDMuRUYWw5+d68i5Udvwr+IO0raEwLfkXFezyq3HgM/VVvvXxRmO171OXRwBhw6DdutUAOkdTTFhoF5ghhAaCOiAuJUZj26WXSpFNI3TVTBk9Tbtw7PPN1Hio8AH27UOB58FaKx3Xycs6LD0scD1/3hRtAWwws0qVKOwU3MV8hzrsQYXT01fraM5cD3RUBxxVdnXqTvwx7lgsf9g29kaHzS0fnRHgkHqm+AN/5FkXtCyY32bLWomXEo4TRIkf/fEPiw4WqPFY+f6hrXm9LDE+iKZwh1qQpyg3BApWFtbVZBAOsXhZc4JCLQIpsoJeNRAJbBu7xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIo15WmK3Relit8BRHNbrzKxizn5sl/QvpXKqTNI2aQ=;
 b=EHpHTQeiPGkeZrq6WkT79dU4Yv83+chjHrWN0GTUTkkPZNLDSvoQuSoBOtMYvS/l3tIxJJGKlhgGAlje7vGuTVoXbHe58ZNb4vbo3W7QsC/GM5VxYGkC9RDUzqbeShyNGpe/OU5MfgqvdSS5/EiZmbgHv0HDCF0MfNkejTjd4oJ2OlZoje+yvffJXRFm/8UfbDpcSikZ1QvyxSL0O/1BD68+daF4v7TTLX31DkbiFC3qHbLG7H7bDTH+14vrAVj8KS50ReQFXVi19uczYMh38mpmNcaZxiGjky0+a2JeHNsBDQD38+swSdXYhG9Sw6bijPI/pq/e5FQHbzBMxfdrdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIo15WmK3Relit8BRHNbrzKxizn5sl/QvpXKqTNI2aQ=;
 b=tLICLQII19j47dKAl8ZsKSoa+//4u0kjatPb04aY6KQEZLV+v854uLT158g2OiZz3d+4E2AdAAyG8x+z8bZ6mQLCCUk+FyeKfw1ir7bO6dpJXXVMe6AIbYj8h5cec/Tp/OpeS3+2Y9Hednoip2S/TinFPUxNK1s05TP8YDleldw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB8468.namprd12.prod.outlook.com (2603:10b6:208:445::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 09:43:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 09:43:33 +0000
Message-ID: <690278ed-1f89-2380-c105-1c85f8da5ab9@amd.com>
Date: Tue, 22 Aug 2023 11:43:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/prime: Support page array >= 4GB
Content-Language: en-US
To: Philip Yang <Philip.Yang@amd.com>, dri-devel@lists.freedesktop.org
References: <20230821200201.24685-1-Philip.Yang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230821200201.24685-1-Philip.Yang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: b92bec8f-4e41-40a9-4212-08dba2f43fff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TKPIRDOM0xo8nUbLzCyGmYmEvXR+XHh/84xGRdW1VXG2Y3e1OhKtTkrmeTl2IGiiQRVhBIaev3EdEuugWK37TogkMKw8YgwBsn9KirXeZlSY8KvT1OA4qUUdv6LoxW+bBH2r5LoNlIil0UXvVcu20+Z/7XB4FBEGL2MmHoXQ7qktm1grOYJa4v4lAPr+3Az1wWtZ4Eg7z05pu3dQq/mYENigzTuGTulL4F3Q3WSjID4D7NMgHa5llWQz7owsH4Y8l2FzByXvi1NY6bcwx010K3gvY9nlgt+26wHpV9RlGmE6+DfN8nTZL9Uq1T4NFJztkmlZJBSkI8hPSh8Jj4rNegc+TPS0KD1lgGWeW2+INYKyKCQLU0KHSi9la1x613K9Ol+gAxIQF9M+GXvwAGBUdYG9xC0TocfFJTL7NfR1wwDRyXga6cJlDi34kHkBoIGx4Q9rJoROrIBLGi/egAqIQ+fxR7V+dDVkE75DtL+z/+qSTbHdRcv/j6PosbBG45FZHpq7d3CQ0LKRdDst2ksTI0j8SO0/SnY/kFK6trYW3oOdPjNS6h2FO8laAz2MaUdbDxvfde8TdgQ+1+eDpFvgAmqDFQCfvSGi+ycM78thkg+GK15GrrjL+nqUN5FD6wytY0rsYNnkrRguHJjExQanRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199024)(186009)(1800799009)(31696002)(86362001)(36756003)(31686004)(478600001)(5660300002)(8676002)(4326008)(8936002)(26005)(38100700002)(83380400001)(2906002)(6512007)(2616005)(316002)(6506007)(66476007)(6486002)(66556008)(41300700001)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aC9lZVpORDVDc1NxdDMxNyt6cXNpd0FyeEpQNkdzZWw5MkEzZUZaamMrSGVC?=
 =?utf-8?B?ZWxIWWFENCt5Rzg0UUxFNllmbFhPbmQ5V1VnSW5ubzJ0cFB5aWxTdzB2RkFQ?=
 =?utf-8?B?Z1pUNEtZV1ZZTGh5ZTNtOE1mem5qbm0xN1BOQllDZVlCS2ljRGFBTFh1b0FL?=
 =?utf-8?B?Mm9uTnhabEI2T2h2MWNIVkJDYzllMGpJS2dFTW4vbFpSbUxTc0Q1eGNzVUQ4?=
 =?utf-8?B?Yk9obFFVZUFrUm1OMXlvZ2RHeUZxNDg3V20zb1ZhczczM2ZyNHVjVSsyeGxQ?=
 =?utf-8?B?clBNTUlucUlTYnRUWlBselhUOG5BZnJZTExLakV3dnNuYVlXS0lWTkFwRS8w?=
 =?utf-8?B?ck9HNGh0WXJWeDJOR2h3NnkvZWxTWTVTZVoxZk5yY3pPN21oeWtiZS93Mmxm?=
 =?utf-8?B?SDVVMEtWZjNjZDhjbGhUNTZ3RHR3WktOaDM0U2p5Y2xyOUdKZUFGMzdwMWt2?=
 =?utf-8?B?T0ZSYUYzNWxWNDlSaDY4Z3o2SjVGemxuVUwxZkF4UzhzWnlpNGUvcXpHdzhI?=
 =?utf-8?B?WHlLL3lOaUsyMldFZHp0OXAzV3QwWWRjQjRYVGdjMmE5L2krdE1hT0loZ2Fh?=
 =?utf-8?B?NWtpVUxaKzNGVHE1U2dkdi9QMVQ1RXVjTVVQYjgzQ25BOXhUSTlMY3RIOEpF?=
 =?utf-8?B?Zm1iT3FkR1gvSkZEY3daa2xQQVZGVGpUaEJpY3J2cEZrSjlaWnVLZzZyQ0Iw?=
 =?utf-8?B?eXo1OTNacVVKZzQrdmJ0NGtZUXNZNmFNQTBvcWJzSjBacC9qWkNMdk1MM0tC?=
 =?utf-8?B?TW1jcFlzL2JQclU1TldpU0VNWlNaRXRUdjFTcVpuTWpSZWFCeHlHL2RoTHdh?=
 =?utf-8?B?elpFRkRYNDlqc2QzTDRXaHBRTnJtMnNCMUV2UDI1alNBMEdMUkpDbm53RkZs?=
 =?utf-8?B?ZUpOWGpFZzVDNk5lYWo1VkRlVnlTRUZZd2xtY09jUFNPUTNSQ3dtdUlxSEt1?=
 =?utf-8?B?QlVBckptRW92QzZrOHpUUWJWMEZQYnEvemdCTmlIRzlxOGNKbUJzYVdnL1ho?=
 =?utf-8?B?a0V0T2dTbC9xS293L3VlK3FyYUZRa0RNZy9iZlo3Y0FiRkFhYzFpTy9jVUJl?=
 =?utf-8?B?NFhXdWJDd0V0dmt1dmN0ZXFXR0cwNjM1QlN6UW43QkhSYk5TRE9LK0FxWVp2?=
 =?utf-8?B?YjVPUUdMOTIyZWVkMTcyMXV1R1VrWEtnR2F1UlprMzlBRlBLalFPZTdNTS83?=
 =?utf-8?B?Z3lYdEVOUnl2SHBqTDRBS2tZb1ZCcGtPZ2ZQWlJHZjlTUTRjU0xJUUlmOXZT?=
 =?utf-8?B?ZTZ2WDcyZnBkSGpYaGJ4ZDlrQWRPVHdZQ0ZHQXVjNHJGckZOZEI0UFluWUdS?=
 =?utf-8?B?MFBIRGhMd0hmczM1M01IVjFJUXlQWjBrTWVhT3gzd2tyVGNCL0JLVjdJM1hS?=
 =?utf-8?B?Y2k5QUJmT2svM3gxOXRtcGxDMUdWSmNyR2NYU3A5K3lmdUplYnZ5M0tQemN6?=
 =?utf-8?B?TkwwbFI1RUhxNVRLMzJ5Q0RsQ2syeGVCOXpEVkd4Z1VKa01zWXNLQmFsMnlp?=
 =?utf-8?B?Zzk5Q083emhiMjRpOVlWWmxRNHlhcmNJRktSd0pybmpFK09DSjhmTmw2VDFO?=
 =?utf-8?B?MWFPVkZNOUZsZ2lwaWZoaWkzaWU5VDdXNjg3RnIvUWV0TTEyZHJnVmlSK1Bh?=
 =?utf-8?B?cWtPV3lqUGtONjhrRjJHVStMZ2N2UWpOS1JXMWhEbS9kd21oUDRFLzdmYmxZ?=
 =?utf-8?B?ZWgybHJTZ21MU01UYi9reTZOT1ozZkNYUW9MbXRVbTJWajd0UE1BV3NOSERQ?=
 =?utf-8?B?dlVBUjE5S3lFVERBVlN0bUZuc3R0OGdrYWtEdnI1WGNCeDgwUkoraWU1V080?=
 =?utf-8?B?bnpkWFdKbjZhb09HbS9Ca280dTcwSXRqeFZJUmlsZUc3a0V0a2dBWGZTVDhK?=
 =?utf-8?B?aE5LdWwyRStoZzdZZGk0K3pvUEFoU3JHM3E4c1BkK2d6d0U1OGFvNlVBV1Bi?=
 =?utf-8?B?TDdQdHp3S3o4N1JCMTJmbW5kM0FlemlLOWdGVUovZStCbU9vSGNOOHBjM0ZH?=
 =?utf-8?B?d2E3aWU5YlJUVkpWSXBSWXhuaUQ0NU5DaDRIZDVvVWw4Nm00MjBiQ2tLWVU5?=
 =?utf-8?B?RzdibFNuU1B4aTBoQUVjbzBzM0Fxd0J1M2FnYkVtSTZkV1E4TUpuNlJiTlA1?=
 =?utf-8?Q?dNpfqtggGIPGKHfJ7fZqfsDHC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b92bec8f-4e41-40a9-4212-08dba2f43fff
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 09:43:33.4708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1m9fopLipR/cNYW3wVW3hJhQUvmxPSUL+EY64EdlfHugI3Fj60NZ1vxfGVqI0SN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8468
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
Cc: Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 21.08.23 um 22:02 schrieb Philip Yang:
> Without unsigned long typecast, the size is passed in as zero if page
> array size >= 4GB, nr_pages >= 0x100000, then sg list converted will
> have the first and the last chunk lost.

Good catch, but I'm not sure if this is enough to make it work.

Additional to that I don't think we have an use case for BOs > 4GiB.

Christian.

>
> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
> ---
>   drivers/gpu/drm/drm_prime.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index f924b8b4ab6b..2630ad2e504d 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -830,7 +830,7 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
>   	if (max_segment == 0)
>   		max_segment = UINT_MAX;
>   	err = sg_alloc_table_from_pages_segment(sg, pages, nr_pages, 0,
> -						nr_pages << PAGE_SHIFT,
> +						(unsigned long)nr_pages << PAGE_SHIFT,
>   						max_segment, GFP_KERNEL);
>   	if (err) {
>   		kfree(sg);

