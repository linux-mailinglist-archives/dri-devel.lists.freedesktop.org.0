Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65744F0BA6
	for <lists+dri-devel@lfdr.de>; Sun,  3 Apr 2022 19:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC8510E129;
	Sun,  3 Apr 2022 17:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2088.outbound.protection.outlook.com [40.107.100.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D8E10E129
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Apr 2022 17:48:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daXLR2aKRfPoPo61NQaeypyKX/j4GYnCMyHWOzt2V//a2GO7Jd+l3dYTe8UgfvgCB44DyvtHW2gg2VjCWpZGI+yEgySSnl5HogwoPM4QfScszG9Bxyx8QW32+fcqDxnUaUftQ489D3yNLx6TrmVraJWR/BHdQp6krQhgyTDirQGjpPfiOhHKw/B2O+5MX06V7dqXAGZtwDh5FOl4jifSCsuOWv6i4f9I94H3mXHbVsARq/eU/tdFC5xoIM85iU0toNY0OLVbMledFHQVTXdIzsnQPY3pWUnu251g69rgxoZZ0GFbjO0tLSs6mUO1GGWAlDWO4ZijHj9dgFDCGecvAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfzfpbz4vGriKLRQYSauanyP8UfwUKhdfO87IiI/LYc=;
 b=QqI1LvhvzoRnN42FjXCNCV+46V7b4OLARakKefNVPSuDoxg/VNyFxw97oDcfHTrQnJXRcLnNUW0tDthOFgHhd1xHOM5o2yYsadmpAoCf7wSi6jMPLWDoUU48cKmYvzgG55hXuM6Labk8+8h0BC9bWjkD84IbKF6wcxRqDfX5e1bczYnELWMURcGzv3/T3fdDTk8ruxPg2wOOkqvKOISalEKV0Q97RpReGKcl4b5nNUmA0J4/bdkUtoEIQ7I4IGSTuBcQmHJKnoiI/CsSia9FhWm/EsHrVRbw7BrvYCsMQY7I/D6hOzflvOJk35oVkOhSXMcMNYrBUVxcHY/ekp+pmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfzfpbz4vGriKLRQYSauanyP8UfwUKhdfO87IiI/LYc=;
 b=yzvVX57K2XTpT+4bze5wjqNFOJRsr6l7P8VFWw6BRYte4F7l76psnKPyDukbldCFygPW4r80XfypauzAtTEmkm1klRNqrxVw9TAKs+Sy+dzi4NsyJtFQWvk0vB+vG97xozwYjovff4xSk7RDxhZD+tMeCOOTFBQfe8UGpUXXfkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR12MB1361.namprd12.prod.outlook.com (2603:10b6:404:18::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Sun, 3 Apr
 2022 17:48:54 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5123.031; Sun, 3 Apr 2022
 17:48:54 +0000
Message-ID: <0021afec-1167-dd1c-5efa-d3a6fdb6e756@amd.com>
Date: Sun, 3 Apr 2022 19:48:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 17/23] dma-buf: specify usage while adding fences to
 dma_resv obj v5
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-17-christian.koenig@amd.com>
 <CAP+8YyFtE6r3S8d=4QBH41M7zKYr97_keM3B=swdtvxeuFwz+g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAP+8YyFtE6r3S8d=4QBH41M7zKYr97_keM3B=swdtvxeuFwz+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5P194CA0005.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0cfa134-7fa8-48ea-9fd5-08da159a3845
X-MS-TrafficTypeDiagnostic: BN6PR12MB1361:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB13610C1F645492DDF812A44883E29@BN6PR12MB1361.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PWA0bymd0+9XTy/2nLtj6Lsg6E5sxkmwaH5qiGU8VxxdePxkhxndEMUEZk71q3WVjQVoEzCtwUxh6eLtmGmD7We+Lk4McNYVJO3KKuNgN3YGCXJdlfBN5Hos2yxcGz/6gUICu88vDFUFNWnDwdbREJxENJsF78JU06KRgic4xd2iF9DH9cZPRpgIVTOdheYzzG8412/lsshRNuX6DBxXxEsxtWMVa1S/UAJNFef/UGh/Jj0AaMgV6E289sjmmRB9s1H4PrOMPUz84xVuEXOv2T3pUBjPGySCzXBphhuME7xpPALQyw3hPSDfzoC0GGv7OgppfFBH02UR3dX/RfqGJ2RA3CxP9med4iK/VGbGjkFIOFdJh2Rvudjn0zXJ+oUZ10LfLWqISfNa5VNF7JniI78D80JCjMRnHwhdeSV54y2Ns7lbUQyAAutGaITJBU0qWmJD0/BvvpyO80R8enABDhURhd4z2zLgS9h5ZLMkGBTdmD2rOpi6SyOYA40Ues9vNTLu3q5JZpmbLGp0SRC1yvv8OUEZfApGn+O+sPXuxfkZtkwtHBIvWOFLpxAPsE9EZp/bX6wbsYJ84FyUxpKHE918xPf2T4opVLmpDSjqywGX9tkrY6eyJ5kgKjI7NH5NGnhfM/pDQP5+vCVH1hvatZJIsUiTvhExxHhVRhLtQoGQPB7zI6xF1AeZOt+AgXi8Dpump4c/LhPkpHYsn8Mq5L+MN8T83NfbWLrLT0/dOE8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(31686004)(66476007)(66556008)(38100700002)(6506007)(54906003)(6916009)(86362001)(66946007)(36756003)(4326008)(186003)(8936002)(53546011)(8676002)(6512007)(2906002)(5660300002)(508600001)(6666004)(83380400001)(66574015)(6486002)(316002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDlVaTJBS1B5bG5GeGNSZjd5R1J5Qit5TVBGR1BETlN6RFliQXhwTmxtZXZG?=
 =?utf-8?B?ZkxzYUoxM1laNVQ5NDlINzhwUVdieUx1UytFR2x0SVRpZ0hTUVFWTzNBZXN4?=
 =?utf-8?B?blptc3p3alBMVjNqam5BWVpjVHBTU1VsWTE5U3I2LzVtYkd6Vi9LRThhQ3M1?=
 =?utf-8?B?bE8rbzNCMjJZakpzdzlKWkxzc3hXWEQ2NDVqVUx5Y3cyb1JiTmRtMW1FYW1V?=
 =?utf-8?B?ZkQ3aTR5Y25kNytWUU9kZ25hdWJuRG1IYy9EL0ZoT0VsZlZIUEJNN0tPR1lY?=
 =?utf-8?B?QWdrRnRoNTAwMVVZZHVlbXZnZnhsbjhDTW8vWm5Cc3ptaDhMOWVWWDFRWXA0?=
 =?utf-8?B?MW81b1FsR2g3UTFtT2JIR0dOK09DeVFURENZOE5JWHBVYmdtRzZIb2VrYk9k?=
 =?utf-8?B?bnFtWXA0TGJ6WFpnbEVhaUxLQURMZEZiQTBBT21icEVXS2M3eWs0QVFVWFV6?=
 =?utf-8?B?WHpxNUF0dW8wcHRJaHBNSUw1ZHdEQnJzM3dKR0NFcDJVRGs5RXMybnJjTDI3?=
 =?utf-8?B?NzViODF3WGVNTjMzVjhXWjA0dEtEaWJ4anhVYk5xaVB1M2d6enJwSm1aM0tt?=
 =?utf-8?B?em9DVXo3ZFBWdjhxRGlaNnY4eFM2Z2JFWXpEeGxUTDdKdDMvRGh4U3BMa2Nh?=
 =?utf-8?B?OFVUM2lxcTlrY0NtRE93dzJPUjhOOGNhWjlEV1k1VEhSTitHamN4UG0zTVBT?=
 =?utf-8?B?SXpUck5LWW1pK2N4SXp4cisxWmdkZmF6N0hRdnZTZXdycUdLNDJZU1lseWlY?=
 =?utf-8?B?Z09RM2FxOWZqb1NJUTVhWkdtV3p0b1kxZ1hlSjEvZElHakk4NGpFeFU5RXFl?=
 =?utf-8?B?RWJKMUMvcm9TUDFqb2ZkSFl0OG8wYURZNENua25TeEZ3M01jZDY2dTJ2N0F3?=
 =?utf-8?B?ZWkvQzdxdGJLVzlsS1V3Ri94UTFjT1Ruak1HYkx2YXNPa1l0blB4ZWpYbEsw?=
 =?utf-8?B?cW1qcmZ5d3k0NHNLR0FPUDJUWWpOeFJkekk2aXdWdExwOVJ2OGRzTXcwWEd4?=
 =?utf-8?B?Nys2ZWliUGp1cUd6WS85YWJDR0dTVTVLVTFyK2NyNU1kRk1EQ0ZLQS8xeUZY?=
 =?utf-8?B?U2JVdWQ3Q0lFTjRNSmNnTXMyV0JmcGg0ZGd2bmJuWW05YTZXRWtSWVlFWjVx?=
 =?utf-8?B?bXdTVXpJdFI1TThhNDNuZDBjK0YxNVprMmVtdys4djN6eDl6ZEhlKzJBdkdn?=
 =?utf-8?B?cXJrMHEzLzJjU0pmMjdYcnVuWCtVRW1hWE12aGFQVWErYmZMM09JcVFSaE5V?=
 =?utf-8?B?OFBXcHVXb2tOenFYbXRYS0Z0R3VpNHMvUFBRRml3enRSWmNhZ2JxcXVzUDkz?=
 =?utf-8?B?QnkxQXlWSDVSSzJDWEZyM0hNMkpPNnkxdEpVRGcrMllTQ3pHVEVjT3VsSXpu?=
 =?utf-8?B?aCtRMFRxRkx1Q1Y3M3lPVEFjNEVPNnI5WjhiTVI4cEpOVWdhSC9yV1Q3djJB?=
 =?utf-8?B?YWpseHhhd2RoN2YwSTlwdjhrUjFPZWlENGEwZFVoQ3M4SFRZdnRMN2l6Umdj?=
 =?utf-8?B?VXBqcGJCdENFd0hiNDJmU2h6d09KM0JYUGxmK2RNNk84aitxTXozZVlXVk9r?=
 =?utf-8?B?b3VVV1p6cExVeGVERmNZSjBaWElBSXpaYXl4YVlFekFlK05SSFdQYnphNDlt?=
 =?utf-8?B?MThEdUFsZmZ2eEpwYlBab2F3eUs3V1hwaHFUVFhmUXNTb2RmWmpqRmFzMkU5?=
 =?utf-8?B?VWZLd2dadUZoS0YrSkpMNWpCQVRneGpZY2JpdGRaK3NqTUhDNWZldXhHMjVS?=
 =?utf-8?B?aWNqQmxCbE9iSTVCbmc2b00yS3VEVUl4UVR0dmZDc3g0eWxhU1lRcnhQRnFP?=
 =?utf-8?B?Ly9SSXA0emRjancwRFNoSSt5L2htenlYWFRSOFRCL0FyREROKzZaZkQ0TW5p?=
 =?utf-8?B?ZU1FL0p6MFRqOU9xT1c1NTRPWisyYzVaaSs5emZnODFmOXVhNGhPUVR5U21L?=
 =?utf-8?B?RUttK0ZnMy9nL0hQbXErNy9uVFhzbjZZN05ONUN6QS9POUZ0U2tHZjY5VURX?=
 =?utf-8?B?SUJSK3BNNFgybG14aDVEd1lNaWo3UW95UnFpcmcvR1p1QkJOVFU4cldaek5N?=
 =?utf-8?B?WGJBOWFwUER3cE5JWDRSQVBhb2I2Qnc3bVNRSkdNenoxaXNaK1pHaFozQjRN?=
 =?utf-8?B?azNZME0yNzhQY0NQK0pISTVCUlY3SXhxdG1RcFo0bm9ER3hTNllmQmhtUzdV?=
 =?utf-8?B?TGxsR0RxajlzOGY0M2x6MG91MVU0M3dwYmlObXhzVnhBcEk2MmJSRkMwTHE1?=
 =?utf-8?B?Y0lJY0liTXNlb3JLSjEzR1JQZ1ZmbnNEbUd6U3VwY05PZFFmVmczQXltSWNw?=
 =?utf-8?B?bHJYeVRSRklKYmxIU3QvMjhDQVRiTUFiYy9DenE3NmVNdzNJUlFyY3ZmQlBG?=
 =?utf-8?Q?7rm1CGaS6/rfOS4vwBsl3epto1mvJGXxIV0X+TedPoJYy?=
X-MS-Exchange-AntiSpam-MessageData-1: sQEAY1deVGalxQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cfa134-7fa8-48ea-9fd5-08da159a3845
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2022 17:48:54.4267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 174BjpRabjkp/BZcbJUDZdS03qRF3WlvB6j3RAlihuTMxdQn8UlwceKonykiDKtE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1361
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.04.22 um 00:16 schrieb Bas Nieuwenhuizen:
> On Mon, Mar 21, 2022 at 2:59 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> [SNIP]
>> @@ -519,17 +513,17 @@ EXPORT_SYMBOL_GPL(dma_resv_iter_first);
>>    */
>>   struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor)
>>   {
>> -       unsigned int idx;
>> +       struct dma_fence *fence;
>>
>>          dma_resv_assert_held(cursor->obj);
>>
>>          cursor->is_restarted = false;
>> -       if (!cursor->fences || cursor->index >= cursor->fences->shared_count)
>> +       if (!cursor->fences || cursor->index >= cursor->fences->num_fences)
>>                  return NULL;
>>
>> -       idx = cursor->index++;
>> -       return rcu_dereference_protected(cursor->fences->shared[idx],
>> -                                        dma_resv_held(cursor->obj));
>> +       dma_resv_list_entry(cursor->fences, cursor->index++,
>> +                           cursor->obj, &fence, &cursor->fence_usage);
> Shouldn't we skip the current fence if cursor->fence_usage doesn't
> match cursor->usage ? (similar to what is done wrt the unlocked
> variant)

Oh, good point. Totally missed that.

Thanks,
Christian.
