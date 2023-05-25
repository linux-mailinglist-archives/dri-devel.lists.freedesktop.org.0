Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E7A710DBC
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 15:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513E810E166;
	Thu, 25 May 2023 13:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9607210E163;
 Thu, 25 May 2023 13:59:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fbgt+MnmGjeO18JF5ch7sEbBgvx5ZLkR0AA+u+EZbOI/eKxCESAoStRCa+MBvAr1NeNIM0XpA067Ao9kdW5MV2gocGljqzDhgyHQA8SFDM9mVz7Zw4pCu4rkoGOLI0BpOs9r23NTxsfSIitp8cj16zx9wDOGfd1HDG5eLDaceQhobs0HOWB8vLj7tfK5iq0E+O1dpO/a4SpY2DSTIxIz7ePStg91odsrwxrv5eaP8h3KBI7VHX5Bv8rWzEJy5WgEQPPxjEPONyWafiSXSODJp4xTGAJKeuwl+MM/kHpeDEdfl6WfmBQ+H0LoX4+uIVNgTR9px/n2ZEFLoBum40lewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ty1Ye3UbO7rqfkWwwdbTy37yaN2YOGk6ot4/vJmN2BM=;
 b=DHhp2WlBBwRVmwlVZD1nziNaRZeSC9rm8RBlrYJj+Ott3t1nKd8PCTHDkQfbHK88klAoh+/LQAPvC0YhzauZKZleV2RlTPAxqEmR45eooIyClgQvXZilfQvoAUNCxN9fTekPw8vPGDwzVFqlu/Dq8//MjXZ1YUTlEWMwBBvc5j41MOTp0xGUcZwi7Vab5lvg5Jt/dbJDfn+F4/+e5Xxay1QyOzg7Wsu/ss0wc7TzTGrFo255gl28rgdeToer9qJmgRpfUlTO0lPuqxTvH/UqfRFsDjr9ObagvGuLwmfJ4iVuYlQmu2+X5C87mD13KYWklLTNCv0vwrfhSWhE6eh9qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ty1Ye3UbO7rqfkWwwdbTy37yaN2YOGk6ot4/vJmN2BM=;
 b=N69Qw6TZB53xOzIfVIq7KzGEEFLnLi+5EsSDFBZCAPPu3YWZHIIM+OhpfDlNhBj8pJ9f5DQkru5bc3hfArxSilqvCIvMYf+uiVMeOcN5myOI17pY2poM95HDGzAhh4sQlDgSyyOzLkEcIx9LraIwc7EeUjPUElmLMzHaZKSskgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB7187.namprd12.prod.outlook.com (2603:10b6:510:203::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 13:59:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e566:9ca5:28e0:a42b]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e566:9ca5:28e0:a42b%4]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 13:59:45 +0000
Message-ID: <f7db4c6c-24df-b723-7710-490355082c24@amd.com>
Date: Thu, 25 May 2023 15:59:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH] drm/ttm: Allow the driver to resolve a WW transaction
 rollback
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230505141719.332109-1-thomas.hellstrom@linux.intel.com>
 <f5ac5b8ceacda35f435e7e6945429c2168314aae.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <f5ac5b8ceacda35f435e7e6945429c2168314aae.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB7187:EE_
X-MS-Office365-Filtering-Correlation-Id: a5582ff4-8d55-42ea-712f-08db5d284b7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2mxtYa1gMUV/ABUbfGGkqenxYANbQ5AnACmPEa9Nv39BgqBogrO5or98XHRXaYyUVXLL0IqwItFaJW63HTgVB1VXzrWfeHiPmtxr7RXpPzBCF0UwRGiqshpEOMkaX1eqk1gJlF+A6lr3P+GqtCw88c71jVi6taYuMk1przk1jgoOEZkbMt34RSim/TGbWSqNDveyqyvIf6iMr4pezcpDI+j9tYPjidejJS3kzw5464b0WFmul12Id8lJdTAlk6XhPJGSGREmdZKaE38NmB2GGbwgJTUZl5uf+hecfVGcg/9yXgWgNLK9scl0Cj0JkdwJlWJhnLNRKdi+L0fOJszkQ574gLmocc9q17IFArXLK0xMRzb6Eu/js8+abiVK6KGzXVcQQ1HwUig7ZuCsY92lcR04bjtgl0/qrDSi8KC5H3UEDXv0cN4CqMZ8XXGODIUEvnarGc6tVVnwgLLLNrGoZaZ/MilGmGEB0TYdHEB8oFb/guQrJYm/ir0ZvM32dLR71C1cDUTQ0A4NGKAoOF3kZvAAsPWiw1dRi8m4r52s3Vz44oknhV1lNuCugyNzU6EE48Nb9g3ikGurvAjZOr/mUVxVdKrFWJ2sozRzbYy3IuLsMm0QsUqaCEVJyTrcU6+jU6VZDuFNeap8j1IQk/unVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199021)(2616005)(4326008)(5660300002)(31696002)(8936002)(8676002)(86362001)(38100700002)(2906002)(83380400001)(66574015)(316002)(41300700001)(36756003)(6666004)(478600001)(31686004)(6486002)(186003)(66556008)(66946007)(66476007)(6512007)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RytpT2pvTlRoaEZlc3cvU2lpZGRCSElDZUNMSGtTdDVIc0lYakdUV1I5SmEr?=
 =?utf-8?B?SmRVeWJhUHh4SktSbmVxZEpMVDFtY0pSeE1EaUx1eTh2VE5oUXQvY1lPeVp6?=
 =?utf-8?B?NlpOdHcyb1VuZG4yUE9rVXJWNnV6aC9iOWxMYWJvK1IrSjhlWHdrQWVlUCtO?=
 =?utf-8?B?dlpjL0ZGeTRVNDZnMDFkQVQvekFTWXNUSldFdk5wL1ZTTlpORVZsdW9KNnJD?=
 =?utf-8?B?MDZ6bEhMRGYrSnBlN3QrS1dLU3Bib0dCb29ZMU95djE4cktBOUhXT3laYnVk?=
 =?utf-8?B?OXIwUnVNVFlTYURUeTIrbEpJUVBOZlV2dDZ4UldGT1NpK1FrcGd3QTY1cEdt?=
 =?utf-8?B?RVlZeVpHc2RSaWczVmxQeFM5RFNUUTRaVG9CU0FMZy9Bam4zQXJzeHh4RlV1?=
 =?utf-8?B?ZlRaMzRDOU1xVGx4SUgvbVJ5OFBLdG9YWlJiU0RLeFkxOVN6U2pLTmFYMWll?=
 =?utf-8?B?b2dpUUpQQlY3MWNVRmRjVUFNL3k1UHdQc0hXdkdlOUlCVGQ1T0hYNmgvb1BH?=
 =?utf-8?B?M0REb2tITm5ORnRLRllCa3VxNUUzYmRINVN6WGF2WmdLekNGZFpOVTV6V01n?=
 =?utf-8?B?VEhYcVJJejlaSWhIWm9wSEo2K0lVNXNkUVB4U0t0NUNjelhtUXovOFJDOGln?=
 =?utf-8?B?WkxUeURkT1JDN1pZSERuQlEvVktsMVVUZDZ1UXJGQnFBQzBGT3VNbWZRaURQ?=
 =?utf-8?B?VTZOd3lSNzZqK0QxdklUcmJ6cUp2VVc2RG5FYVFVYm5XSlFkaVVsMlpWM3JW?=
 =?utf-8?B?elp1RnpxYkpnbUlmcTFydXp4RGFhRDZSMFdhQnBUaHZEdFNKQXRmUmxpN2Vu?=
 =?utf-8?B?d3RCMUZDaTNHT0tzM2NNRHNaS0ZNR2xWY0YwbWF1SUVVL2dFd0lXUXJtMTRm?=
 =?utf-8?B?N2RqdlBxSzYvNUJYYnBMWTFLaW5mQlRGWG56RTFiZkFPcGs2Yjh2NXc4Q2ZF?=
 =?utf-8?B?VHNSUi9CVGt5d1g2RVJ1SGlUcmhhNHk3dzFwSDBNNGVldnFFb013Y3o2Nnpn?=
 =?utf-8?B?Yk9XZ2hRaW5xVUZKMlhOb0ZRcFZBNGVTKzQ3TzlUU2VVbnhjZEs0VmNFQU9j?=
 =?utf-8?B?cklMeUhLZ1AzVi93SGluM0x1NElpekp1OXBEbWlEQnRpVFM4U0FaR1ZPSXda?=
 =?utf-8?B?VzUxZ1NEVUw4eGdYbjNNdFdLcSt1enFxZ1BGcmp5ZU1DMFhOSlUvU0NTbE5s?=
 =?utf-8?B?cFREVGw4Zk9oMUV1UGJ4T1VoaTRSN0JMOXM4a2JLMlJjTFluc3Nid085QVlW?=
 =?utf-8?B?Q0NOMTJYeHdBUkh1aDB6aWlQeFEyZHp1ek1nRnMzNWJkWlZ1VzFjYVA5cy9H?=
 =?utf-8?B?VTV2L3ZsQ0w2SlZMUkNhUVlMMlg0d3g4ejB0cXcxa0dvSmJ3WllRR1NxQ3lE?=
 =?utf-8?B?MTFoS1I2SHlHMmVGVGdRNDBSMHYyZFJlUTYwSk5ZemxOcTJFdFZqb3VPdnlF?=
 =?utf-8?B?RzhYeitrcDkvQVhra0MrMThEenMrQ0szWWhwMkdTR09lREpHTWVWUnU3aEZ0?=
 =?utf-8?B?bG9tU2ptcEhYOE9qZ1J1ekFlOUVPakpQWTYwWHhBNmtWUmRRMDhjT3pQZHhm?=
 =?utf-8?B?MEVXT0RwSmVRbERiRFJXVUw5L1ZMUmFIdGkrU2h2SjR2OUhFay8vZi9PQUcz?=
 =?utf-8?B?TjVmejl6ckNuanl3TG9RZWJ4RWF0VHBvNWFKOGRiRnBqTGg0VTlReTZIMGhZ?=
 =?utf-8?B?SzE2WUlsamV4WDZkNWU2b05tb2R3Qjk1N2dLeEtOWklWdXVtVjc4N2puRVdz?=
 =?utf-8?B?YTFjVktqbGlhTjcySVZDaER4bFlYeEY3MnJMVXY5M2VLRlNoOUxvYUhTTkc5?=
 =?utf-8?B?cXpkajBmL0ZtTUxaMTlGTkJiMVRwZ1o3dXp5ZC9VeWRlWUtKUDRuazhxWEcr?=
 =?utf-8?B?SEZMNmVjNFgySmU2d1Yvck0yNUhaekdWdUQ4cXFVY1J2WGFwKy9Edmo1UGVw?=
 =?utf-8?B?OUpyUm9ZN2pyTXVwT0xJb3R1NWpORmxWQjNFZmwrRzZDVkthYmRkYXV3aG1G?=
 =?utf-8?B?UEh0STE5NlZSbTk1bTVBeXpTUFVyM0xIZXJ4VmYyK3hQUzNFT01XNldwdVQ0?=
 =?utf-8?B?SFU4Z2tvVUsrLzJYakhrdjNHcmhMNTJ5RjdIZElGeDYvTHdjcEJlL25NdGEr?=
 =?utf-8?B?K3RwVkIrMkVwMDJGOGgrZFI2djBaS0R1K2FWaVVZU01UNERiRE5HS1VsS1dQ?=
 =?utf-8?Q?WAJ4pPFV4TJS3R9A0SMyuX5J13y5EnMQV0vJFKRxeRKv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5582ff4-8d55-42ea-712f-08db5d284b7a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 13:59:45.1723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NqVt1UJy68Y0Z3tuZJLpDmf9IG2pDsFL5bjnmuVWC+kxB6o6Ob+02rn+1YpuhENF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7187
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
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.05.23 um 14:59 schrieb Thomas Hellström:
> On Fri, 2023-05-05 at 16:17 +0200, Thomas Hellström wrote:
>> Allow drivers to resolve a WW transaction rollback. This allows for
>> 1) Putting a lower-priority transaction to sleep allowing another to
>> succeed instead both fighting using trylocks.
>> 2) Letting the driver know whether a received -ENOMEM is the result
>> of
>> competition with another WW transaction, which can be resolved using
>> rollback and retry or a real -ENOMEM which should be propagated back
>> to user-space as a failure.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Christian, Any objections?

General idea sounds like what I had in mind as well, but I've moved both 
my office and household in the last two weeks and are now digging 
through >800 unread mails/patches.

Give me some days to catch up and I can take a detailed look.

Christian.

>
> /Thomas
>
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c | 17 +++++++++++++++--
>>   include/drm/ttm/ttm_bo.h     |  2 ++
>>   2 files changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>> b/drivers/gpu/drm/ttm/ttm_bo.c
>> index bd5dae4d1624..c3ccbea2be3e 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -561,6 +561,10 @@ static int ttm_mem_evict_wait_busy(struct
>> ttm_buffer_object *busy_bo,
>>          if (!busy_bo || !ticket)
>>                  return -EBUSY;
>>   
>> +       /* We want to resolve contention before trying to lock again.
>> */
>> +       if (ctx->propagate_edeadlk && ctx->contended_bo)
>> +               return  -EDEADLK;
>> +
>>          if (ctx->interruptible)
>>                  r = dma_resv_lock_interruptible(busy_bo->base.resv,
>>                                                            ticket);
>> @@ -575,7 +579,15 @@ static int ttm_mem_evict_wait_busy(struct
>> ttm_buffer_object *busy_bo,
>>          if (!r)
>>                  dma_resv_unlock(busy_bo->base.resv);
>>   
>> -       return r == -EDEADLK ? -EBUSY : r;
>> +       if (r == -EDEADLK) {
>> +               if (ctx->propagate_edeadlk) {
>> +                       ttm_bo_get(busy_bo);
>> +                       ctx->contended_bo = busy_bo;
>> +               }
>> +               r = -EBUSY;
>> +       }
>> +
>> +       return r;
>>   }
>>   
>>   int ttm_mem_evict_first(struct ttm_device *bdev,
>> @@ -816,7 +828,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object
>> *bo,
>>                          goto error;
>>          }
>>   
>> -       ret = -ENOMEM;
>> +       ret = (ctx->propagate_edeadlk && ctx->contended_bo) ? -
>> EDEADLK : -ENOMEM;
>>          if (!type_found) {
>>                  pr_err(TTM_PFX "No compatible memory type found\n");
>>                  ret = -EINVAL;
>> @@ -913,6 +925,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>>                  if (ret)
>>                          return ret;
>>          }
>> +
>>          return 0;
>>   }
>>   EXPORT_SYMBOL(ttm_bo_validate);
>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>> index 8b113c384236..d8e35a794ce5 100644
>> --- a/include/drm/ttm/ttm_bo.h
>> +++ b/include/drm/ttm/ttm_bo.h
>> @@ -181,8 +181,10 @@ struct ttm_operation_ctx {
>>          bool gfp_retry_mayfail;
>>          bool allow_res_evict;
>>          bool force_alloc;
>> +       bool propagate_edeadlk;
>>          struct dma_resv *resv;
>>          uint64_t bytes_moved;
>> +       struct ttm_buffer_object *contended_bo;
>>   };
>>   
>>   /**

