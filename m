Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9A9717A78
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 10:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3062B10E1B6;
	Wed, 31 May 2023 08:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2053.outbound.protection.outlook.com [40.107.95.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265C710E1B6;
 Wed, 31 May 2023 08:45:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+O7TFxvs5DEvPp8ytjNdktfMyYcXQiDSGjlfHMKfCxUQH5/WqueQ1EfgA/1XGs0UrCaSQGcoSSqxOEXTqkhlYIi2B9XLbkBAmKljArpAl+r4jysAml0cnRc+XAnxEgvnicysP37uPuC+Rn8B/hv0I+HPgB6KRSdLNNlFKLbAnfNJGAL1cMdtZEGHDnovU6Fxh1GmH/DP5Iikl/FkfJ2rB4L4B1oS50uk05QC+ixMHXHik+9cThWqEz3u47KP0FlVfDElMI/7B00/mzeYChhaWcCqGF7UIkvLKCL9L0YpgFS4e0GGi02ivpGA+f7BRqz8H5VtTwzQTaV+c9G+idaIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R02hqYpusEz1HY5tBqvIChu2/RAkJ8F/Pkh3r6V/txM=;
 b=NcfMWkvuZUWbV4ccUf/8LPKpjvwIUnImJ7OZxIqxvEAfcYAbol2A6peI4+tlNQqYcEySakAEH3GY8zORGxrWb59ZzQIJcq5KkVWX7WikaUOhE7Dwe5jhOdf9/TtvZ1417CDQu1IVT9OfenxUQPE/0M+ujtPUjlSolGCm2qRvU/A0e9Tois4ZEvwvs9pAv4XFDfN9+5XSOOyq8FGhgrIahh9WxVncTsfuvEv4NEjOEzLiW9eC59DdpXswNybx40p5xUqroU4hhNRc1rKj6RDaOiZ4KGze1B3/ol6rpunaxGsG4nQCm1A2AhUHr6UI3MgIV8tY9RP/dVQ9bJN0kl5HIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R02hqYpusEz1HY5tBqvIChu2/RAkJ8F/Pkh3r6V/txM=;
 b=wTxTLE5n23cZnGkr+HIDgbNgmqK8igUunS9T7vrI2sJVFs/jgBxfAJx08yYQ00WHDNIwddkeohocN506rJkfYz57Rjl37ttBuh1i4uoEStmvzyPOcOtzCq8Kks4zNPpFKRdzZ13BgcXE4NyuNUlEqDTrDwc7sF6pnLIqC6bFMRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 08:45:12 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::907f:26e2:673a:2ad2]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::907f:26e2:673a:2ad2%6]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 08:45:12 +0000
Message-ID: <e03d9463-4594-9c33-c773-15c22d2cad83@amd.com>
Date: Wed, 31 May 2023 10:45:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/ttm: Remove redundant code in ttm_tt_init_fields
Content-Language: en-US
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "Ma, Jun" <Jun.Ma2@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20230531053051.3453509-1-Jun.Ma2@amd.com>
 <DM5PR12MB246916A813942FA00CBF5978F1489@DM5PR12MB2469.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <DM5PR12MB246916A813942FA00CBF5978F1489@DM5PR12MB2469.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ef3a0c7-030e-4e77-83fd-08db61b358b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t/nCjY7fDMUsPzwkPJrO+f4y+AsGOxezNniYO0c7vrQrsxCdkeof+wC1d0OSpVR5H5fM4/HZo7g90H3uH5DNV13Q+1GuKzQsAq3l9IzNLByC6FBgLqIfO9gt+ObH753okxicxGVW1IiemnPakyON5MdkbKZoyjJ0CRBUnKFmB9ERn/TYCDfhe/Km0Vn+4Y9057UuzoMDmhMb8bWF94oR8hTWLUVNSPlyOFhS1d3k9ZJ9ifx04IOVWzsiAYUEO5CQ4Po6Epicr+TWlb0Bk20er0RQ9DHWDfvTe2Myvyscf2zbjxQtNdKJDyd0BWp5hdFqhYjibF/0P4bmxhHsA+T0ENJEXFWLURUj99J4nniKNWVgiTGZjRcn6neR5Y2aLmvkw4TSzh+ipnjIt+ifpGs7udh6CsipPrTyj09ZFUQpzosNu5jIZ+ffh1y6hZy8IdjNwG2Y7oQilB8utlDfatIn8SSO0ZgIpPnhyxx1AM+nm/F+LpDbcZRW37BucL8h08J2gWTVPThCxbuhE2mFRUWZvn0zkAwzuDaWKzNhkkbhXjXAx9pAHLbGsfgTxT5j/zxpNP7UKxHVIlelpH0UNWQ/FC0/yZFevMB466zUKzxNEg+u8hAhjKrnLW2p4/9iO1Q5YUnCPBF+go7Xr3Fzf06ilw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199021)(478600001)(8936002)(110136005)(8676002)(41300700001)(5660300002)(86362001)(6666004)(6486002)(316002)(66946007)(31686004)(450100002)(66476007)(66556008)(53546011)(6512007)(31696002)(6506007)(186003)(2616005)(83380400001)(2906002)(36756003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm5mQkZDWFFTT2pOUmVnMlc0WWV5Kzc5OHN5cUcrV3I4K28rTzViT3c1aFVl?=
 =?utf-8?B?NWNPdCtFcm9raUV4VTBVd0JmTmJ2Ylk5MHF4UVRzZ2pENnRrWE9rMmllTkJh?=
 =?utf-8?B?S0JKUjBiY20zN3Fob1FBdEhSSzdmU0F1Q0Y0NTNzU2tWZURwR2tUS0kyQ2NY?=
 =?utf-8?B?Qng5WUVKazVhQVFYOWx3MXorMkV5TDZLcnh5Z0QvU0s5ZFl3ZnhKaHdyVkVu?=
 =?utf-8?B?V1hxb2JoWG5pcFRwK0hkUXpNbjM4NTF3Z3E4WUNPVUNqcktFb25ORmlxVGZo?=
 =?utf-8?B?TUVXOVhaVGs1YW02dGNIdlJSRXF3bE5LRDBDY0ZFeDBZT1ZWeUZhMG9uNUpV?=
 =?utf-8?B?T3hMcWhndHBoa0pBdVRoK05WLzhZZzFNSHE4bWV4dGp6SitLaHlhMUZta3Qr?=
 =?utf-8?B?N1lTMm81bEZxQ2FNYUJXS3hzNDVMVnF3bGJScWxRdWFCb2FPdy9tcXMwUFkz?=
 =?utf-8?B?Zm01Z0pHcDRTbWJQV2N6Q3I4S2ZwSFFpREtXWWNRRkNMZEVqUUpvZzlDSkxR?=
 =?utf-8?B?KysrYzMxby92T0xNSk9yMThyQk1GQWwyZ3hXQ2V4MGxralBlWEZTSTV1QWVD?=
 =?utf-8?B?VHMrY3Q5S3FabFV0dGY2bW9tM1k5OU5sQ1NROER3MUk5N0lIVnRCNHNKMTRq?=
 =?utf-8?B?REJlWndRK0ZKUE55TVBFT1YxT0Y4S0RPU2hYZmc3Q2xoaXh0T21ZQjVxYkpK?=
 =?utf-8?B?Tm9WUEd2bGw2SFJoOFFoT2hMc21nN3Njd3BkWDhmNWZhYm9oY0lPUVFHZTFk?=
 =?utf-8?B?b0tUUm5PTTNNWFIxWmNSdjViSUVyR2cxVGc3Q3FEWWNsSnJ0NjR2Qks0akJ1?=
 =?utf-8?B?UVgyU0xNWjJra1RLdlZHTTdSUU1NRW9YT1JHaitFQUZhOEdMVGU1OG9lVFlu?=
 =?utf-8?B?bzZtYWJ0MWJEUVVYRUYwNXN3U3JyaVc5N2ZjaVFkOThjQUFPK2ZpNWFGT3Jy?=
 =?utf-8?B?WHg4T1k1ZFpjTFVsSERQV2s3WjhFNWtkZDVtWG9xVzRFMnQ3RFl1cU05UFFk?=
 =?utf-8?B?bXNuUUJuS3R5VVM0c2Rtc2lCeWRid3ZUalZWNXhCcDJPRmMyZzhoNXVJRlIv?=
 =?utf-8?B?ZGtvNDVDUEdFcjNiRlY1TE9zVVpLTnVJMURvMmEwcm5Yc0ZYZmV4RG9SamFF?=
 =?utf-8?B?Y2NJTG1qVGxiZksvTExseDhWU1JxWHQvU1FFUUtJWWtpbTlxM0VvVDlncVB5?=
 =?utf-8?B?NmNQNFZyYmE2N3pVYkttWEhNa21oSUtvbHZ3Y3FuMnR3c0V3NE5UMU9sT1hO?=
 =?utf-8?B?NXlONkxDSEEwTDA1cmplZ3VsMXlYcjV4NU1GZC9wSnRPWFZaOHl1MXdEVDR2?=
 =?utf-8?B?L3NrTU83anNFRUxoWTdoa2ZMSHRaMWdwVHpBV3BTSy9jeDVhVzdhS0owZE16?=
 =?utf-8?B?Zit6a293d2tQMjNRdEJFL3Q2N1dvSUZ3NWFOWW5LandSZEFnN3ZMOWw4ak9L?=
 =?utf-8?B?OHFqRHFCWVZtYzIxMEE2dzZ1dUVyUENoWUswSFJVaDFLeDZIL3VXckk1Q0Zr?=
 =?utf-8?B?LzJZSlU2dWNuTnYzMGN1SzR4TDlycDR0WjRCMktNTisrbVBweDFSK0hFaGtp?=
 =?utf-8?B?OXY1bjBmbmZhY21mRmdPemVkdlhwZTducFA4bEtkTXVIQUFlcnZjRldjam1Z?=
 =?utf-8?B?WDd4SzBoTFZselNiZjQ2WFU3MVhUTnpmaDJhbU9BK200UFNjMzJXRllHaDI4?=
 =?utf-8?B?d3kxYWhrbHpxUGVqdnZUT1oyTjZITEt5QkxCWVhhQUFUdzRGNEIzcTJBc3BQ?=
 =?utf-8?B?UGNMZ0F0Z3BUMG51ZnIveWVwN25kUDlBd0o2NldBbHMrYkZnSmVweWpDN1Vt?=
 =?utf-8?B?TE5MeHJwUmF3SjVaVkJ3RDFMaVZ5VGdyWEpxaXc4S25pUGdoelNLdFQzL3RI?=
 =?utf-8?B?VU5Gb0pBaExKMVdraFo5WS9XbTBxMHpSb2Q3WTJZRXJGM2RvMUdtdjdVYkd5?=
 =?utf-8?B?OFkyV211aEtrMkxGcWNVOUVnaURDdmkvZ2t1TTB5dENHcTVyVyt2ci8xOWRX?=
 =?utf-8?B?a2xpTTFjRXhZWmZmRXBvblBYUStiZmtkZ0lsbW53d0hXRGRUc0VVNE5xNllV?=
 =?utf-8?B?TFJpbHlpK1UxODdNaEtuR1FlbUFJZUlYTzl6Qm83MUswVXIrRUpLRStQOTBo?=
 =?utf-8?B?dHA1RHJxNlpRN29WUkdOTkRla01pd09kelpiSXJvMDVCUzRGVG5UcndRdzNa?=
 =?utf-8?Q?RhHWgfB41Bxokr21hT8E2XqZd+xlPpdHTHy1av7tOrzU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef3a0c7-030e-4e77-83fd-08db61b358b9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 08:45:12.0778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86/wNvWA2d/lkOCzKiBvd+umSF8+KZ2lxLf5zOk7I4+hXm8Y3b80GL7MuarazISg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800
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

Am 31.05.23 um 08:20 schrieb Chen, Guchun:
> [Public]
>
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Ma
>> Jun
>> Sent: Wednesday, May 31, 2023 1:31 PM
>> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Koenig,
>> Christian <Christian.Koenig@amd.com>
>> Cc: Ma, Jun <Jun.Ma2@amd.com>
>> Subject: [PATCH v2] drm/ttm: Remove redundant code in ttm_tt_init_fields
>>
>> Remove redundant assignment code for ttm->caching as it's overwritten
>>
>> just a few lines later.
> Please drop the blank line in above message. With it fixed, the patch is: Reviewed-by: Guchun Chen <guchun.chen@amd.com>

Seconded, I'm going to pick that patch up and submit it to drm-misc-next 
with the commit message fixed.

Regards,
Christian.

>
> Regards,
> Guchun
>
>> v2:
>>   - Update the commit message.
>>
>> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_tt.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>> index 02b812dacc5d..45a44544b656 100644
>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>> @@ -143,7 +143,6 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>>                               unsigned long extra_pages)
>>   {
>>        ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) +
>> extra_pages;
>> -     ttm->caching = ttm_cached;
>>        ttm->page_flags = page_flags;
>>        ttm->dma_address = NULL;
>>        ttm->swap_storage = NULL;
>> --
>> 2.34.1

