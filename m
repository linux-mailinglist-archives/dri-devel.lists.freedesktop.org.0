Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7538A7C1B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 08:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AC21131A0;
	Wed, 17 Apr 2024 06:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="M3jeEJEM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0387910EF74;
 Wed, 17 Apr 2024 06:09:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFcBmXSBgElERnuz5zR3Ovg9MQQPpyEQREAsPTStTI/fOy++SHhtUANgZNWqCzntSkrMviuIpevv4wVXGMfyAd0QzEgdQ9MuERulxdTp2XVOQXLQPij2G/EPCzBXwyVx5dtSMHxf7LcYvRFjQcPFDYFxR5Ug+1ybQtGYIWQv6Ap3hl4cj1h5iHdxZ+NTYSUn0XPYDPkzIf/CEyVvKZY9Z61iVbL58I3JMz/WA4V9n1LB5p/ptJYY8LICJav16c3VMikrO9YDWYFmzPNC3kfxw47MNxnX/66g/RDKvAvq2ib6eSetYcICjkp+kMX/9hCmPBMLn0+X7NgfdkyQWkIcfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdqKb8uykcz68kikCkREaPkTD5yb1tXeapF3Zzwz2Dk=;
 b=i5nbh1mE/Bobk20bbsPLRY6TEkf2jL5U6C+5wby2V0DyXpN5bAJ8DINB+2ajkoeGThU7njZjRQCXa8HC+u8Ci2K39KdiSkYAlsnLhLkqJ5GXaer1RHHHxnBCK1aW4g2KUZFV5Ij1O8guYvY5vvniRI0u7W09nnU9ARarakT2FSeMbkKnF39xIdJi90vtoN0ci7FfT7MLyai7dm6e4yf4hJoaMVp+hxSL90CSAwDNhM+nz6hrLxerSWySDZEZ0wRxEwkOK9FD9W8+XicrTAU+fo+LN60x+BA619f0mVn/UdI1RvWhB0k09o/KQBEUS3HJYxvdPUjbNpU6g6WpHBWAcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdqKb8uykcz68kikCkREaPkTD5yb1tXeapF3Zzwz2Dk=;
 b=M3jeEJEMHUbHc0bGmqq5yFPnM8osDqFpVeUMRO5bDu9hrF3ZiDmNOSjgDGLFDx7sBajEDGZgfUHUoXASwC1wJFNS3AKtfwhkRRwUALWLj3EHSb64QyPZML/R1TBARYgJQ/INq54zVw8vtLqms2k16MdYcQBsETDeCY3UagrMt58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8340.namprd12.prod.outlook.com (2603:10b6:930:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 06:09:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7452.049; Wed, 17 Apr 2024
 06:09:12 +0000
Message-ID: <aa06fb7e-19d6-4161-a659-70cf953e534a@amd.com>
Date: Wed, 17 Apr 2024 08:09:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] drm/ttm: Allow TTM LRU list nodes of different
 types
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
 <20240416100730.6666-2-thomas.hellstrom@linux.intel.com>
 <Zh8isq+3btgEJGTx@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Zh8isq+3btgEJGTx@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: 935e9962-28c6-4f27-c5d6-08dc5ea4e709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5AQ2Yk7hgLsr5BpcyFHIXX1fuv61xfGyChsDUSEJmKVsFlkqJqTZsF+CI8VfOru7NIe4IYcn9CwYVAmXs4qF+bv/HA0QJBFEfTAzPppK2SrOH9dww2Nt+8XRMVtKddUeRZZkscm9VfjbtqqT49DOQTaPxX71CPqUK0AFEBemup1n2yFAVN+2ZRbo7Ke/ns78m21ICJUUeAFirJBm3uqQwZ/STDz4nhN3jbYQpZrcT1XruqrY3eoAmOFlPs/Lit2ADPztamojHrNs24c6WiFx2O/8OH+KrjD3vKku25tzwKuL3+q5q+7snJLaQCHeMtSvPd2CU3h+kHJFNKa+wW2nwcDsq5tITlqmw3UUjP90KCdPlwQzs4zH3xLLUzcJSphvsE3yQzgoxbFWUY/IQ1vLsdqjRukVanFF7uhFtMn2wQc+W4Pja3bcypVSjptWYeUI15SLdFlX05ChVqs4jo5tffyreVxlSWw0vVaClaCJF8utp5rA2oxWjOJ0q2Qdd2LF1/yPz0xKzqWk2stxX0ta06gUGWEQ8JFaEmufixTkxURp1oxf4b1gfKmKzClgnkFNbCqVj8O6sfvlaIh3t36IpQq6fXCyzIfqaR5Y96vNtw/WLb4kiOzuJzYWYD36ESEjU8aQJ3cdrG7fGZGfCLbjqEBXXuyAzifOZMoVdRVwQ5k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGxkL1VUeWdYS0JTaUdKV3dFcFNvZUUrV1pscVdYMHRzRHpKVmJuaXNvRDky?=
 =?utf-8?B?NXNWVWxHNU9paVh6cmNtSnFVcTN6cHg5aEFXbUI0TWZEVy85b294RENzdEc3?=
 =?utf-8?B?Q1RLdHoxRnZQM0tyZ0ZsUUJtcHRhdEdWZVpyb1M0WHdnOGFqaU5lUDhNNm43?=
 =?utf-8?B?cDRzMnN4cU9YUW5HNmVPUk9Lankwc1QxNVhoU0VHeUpWbVh4TU15STZzWW1Y?=
 =?utf-8?B?YkV4ODl4YWZjU2hXRjM4SEtYSE5qUkJ5aXN5RTlsaGJobXhPM2lIaTlCeHVE?=
 =?utf-8?B?alYzUWdMalhKU1g5VURLVnVFaEhyWTUrN0ppK1ZGWlRVSjJ1ZCtyMmtBVE9N?=
 =?utf-8?B?eUhURytnTmFWSUlVT1JTVFNzV0RrNTY1R1QvQ3M1bUdFL05ZWW5wb29HN3Fk?=
 =?utf-8?B?MU4wVmlSbVBRUk1jSzZLR3VaQlhKWndWK0pNY1RualkzdENZbFZiY25ZK3RG?=
 =?utf-8?B?NVVSUkhMcGJ3Z29nRHhXdjZBd3N3bFIzRTVCdGdZdVRXbDRNOWc5b1R6K2Va?=
 =?utf-8?B?b0xsd3cvSnR0Ukx2M0hlK2l6eW5xY1lpNERidXYwd3kwNkxaeVcxbkpGS3Jh?=
 =?utf-8?B?bWNBcTNmUGpJS0hmUjhydUc3SUJhR2dvajNvTkwyOWNvbExGbm5VK1MyNGVh?=
 =?utf-8?B?VWxwZmQxRjNENCtGNTVRTFJmaFgyVTBTM3JleVlRQ0VnWkRYVXpnc1lRU3N2?=
 =?utf-8?B?NUVhVGdlUDNEakRYVWlVTmthdWlDVU9nT0tkYkQvditxeTBxVFFNK3dEQXds?=
 =?utf-8?B?MHh6Q1pTaldkK1hUN1BPT0cxRGhkOHZrWFlyVmxKaHVTQlhubTNLNE0wSWRQ?=
 =?utf-8?B?SE5wR1JPUUJpOEJVOEZ4WU1QcEF3SzMyZmx6T3ZoQnRXZWNSWHo4OFAyaHdm?=
 =?utf-8?B?NWpIVGdvT1ZEZ3l6UUV0dVJXMkJPK0dGTGpBM1dncGd6LzZrL2FzM3JwUkpl?=
 =?utf-8?B?NUF5UUVvUjlyZ25pOVFvUTAzZ0ZsWlZDNTdJcUFieUtMd1E0Q3E2MFFRSy9Q?=
 =?utf-8?B?WWd3UDFpNHNXVUtJR01GQ3EvVE80YmRiaTVFWUtDaHR2YzFIM1VPMDJPMVRp?=
 =?utf-8?B?ODVzYm0xMVV3ak9raTJyTHZtSUVDU1prSWpXa1RrRmlhMmRhZStndGMrcnlq?=
 =?utf-8?B?a2JMVGVmbzVnRUZZOXZqUDRvV2pJQjBhUVJlUFVLUko2UU1zWk1hWTBqSUow?=
 =?utf-8?B?QVUvQXFzU2JTZGlMc2h4WTJVSW9pOUlLU2l4N0pqdW5qeFJaazFFOXlyd0Qw?=
 =?utf-8?B?QWNoV3JDWTZZeE0wYUt3d0pEaWE2NUVYQUVKMU43REJaNU1uak5nRys0YmxH?=
 =?utf-8?B?OXQ3YUUxQ2IwM0pkUUhRejRVeWxUSHdsa1d5eks0TG1RaHcxOUZpSDVsc0Rt?=
 =?utf-8?B?RE53cFl2bVUzY085OXNMT09BbHg0RnU3TGxBUksvMUtZQ2k0aTZ6UVhtU0Ev?=
 =?utf-8?B?eXRwMEVNaVg0SHVON2xobUVjTUJrNEkwQXRwaFZ6bWUrWkZkZWVaVFlMYXMv?=
 =?utf-8?B?VnVEVWx6SnJsRnU1a21wS0RXd1RIb2k1YzJEQnNidy9oSlhqRExtbFlNYlc0?=
 =?utf-8?B?VWw5alFnbHB3VGUyUVo1ek53aUZiNDRqV3V5RUlsZkdqdXBnQ1VVNDdGbXg2?=
 =?utf-8?B?NDl2NWlBQ3o2OXpMT0crZkR3YndaQkxpMkdxa2czY3VmcGZoSGMzQjd0cytB?=
 =?utf-8?B?ZElvQjRXaVdtYzhTcXVCNjJPZFV5TEFiOWJTSGNOZFhRT2pWT0NPaUZJUlZG?=
 =?utf-8?B?ZmlMSk5jRkJYemF2UTcwbkZpeURSV2E1ZHpWY083VXVnYnA3c2lja0dQanBS?=
 =?utf-8?B?djFxaUdaYmZBR2VlZkdxNThwa0xHOG5uSWxKU1NiYzcvandhd0cra0FhdWQ4?=
 =?utf-8?B?Z21EeUQ3TStnenJQMDY4d2lpekUza3kxYmJpU0xrR2dscFl3ZmtGekM5MnhU?=
 =?utf-8?B?UW9wRGdPM2dSU3BkV093Z0RIMUZkVW9KaUxOUGc5YUFjbzN0LzRkMlZYdU1V?=
 =?utf-8?B?YnkxbThUNyt5U1A5bWdxUDNZN2tkOUI1YXZMUFFOcjNZS29ZT2Q5ZGZsSUhx?=
 =?utf-8?B?NWZYM0E4RXN1eFVuT3YwTkNhckYwWXp0OUdnTUdSUDlwbFRoSk5waEZaL0ho?=
 =?utf-8?Q?M7+f5Y3q/o1SSeV6lfZ2D8bNu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935e9962-28c6-4f27-c5d6-08dc5ea4e709
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 06:09:12.6094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hGDphmeNeHd7bpUY8cIhacpMjrq3s1jh/OVu3GNmxTmAei5J/wbx7V2H6Wxju0B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8340
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

Am 17.04.24 um 03:15 schrieb Matthew Brost:
> On Tue, Apr 16, 2024 at 12:07:22PM +0200, Thomas Hellström wrote:
>> To be able to handle list unlocking while traversing the LRU
>> list, we want the iterators not only to point to the next
>> position of the list traversal, but to insert themselves as
>> list nodes at that point to work around the fact that the
>> next node might otherwise disappear from the list while
>> the iterator is pointing to it.
>>
>> These list nodes need to be easily distinguishable from other
>> list nodes so that others traversing the list can skip
>> over them.
>>
>> So declare a struct ttm_lru_item, with a struct list_head member
>> and a type enum. This will slightly increase the size of a
>> struct ttm_resource.
>>
>> Changes in previous series:
>> - Update enum ttm_lru_item_type documentation.
>>
> Patch itself makes sense to me. One style question (or maybe
> suggestion?) below.
>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
>> Cc: <dri-devel@lists.freedesktop.org>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_device.c   | 13 ++++--
>>   drivers/gpu/drm/ttm/ttm_resource.c | 70 ++++++++++++++++++++++--------
>>   include/drm/ttm/ttm_resource.h     | 51 +++++++++++++++++++++-
>>   3 files changed, 110 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
>> index 76027960054f..f27406e851e5 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -270,17 +270,22 @@ EXPORT_SYMBOL(ttm_device_fini);
>>   static void ttm_device_clear_lru_dma_mappings(struct ttm_device *bdev,
>>   					      struct list_head *list)
>>   {
>> -	struct ttm_resource *res;
>> +	struct ttm_lru_item *lru;
>>   
>>   	spin_lock(&bdev->lru_lock);
>> -	while ((res = list_first_entry_or_null(list, typeof(*res), lru))) {
>> -		struct ttm_buffer_object *bo = res->bo;
>> +	while ((lru = list_first_entry_or_null(list, typeof(*lru), link))) {
>> +		struct ttm_buffer_object *bo;
>> +
>> +		if (!ttm_lru_item_is_res(lru))
>> +			continue;
>> +
>> +		bo = ttm_lru_item_to_res(lru)->bo;
>>   
>>   		/* Take ref against racing releases once lru_lock is unlocked */
>>   		if (!ttm_bo_get_unless_zero(bo))
>>   			continue;
>>   
>> -		list_del_init(&res->lru);
>> +		list_del_init(&bo->resource->lru.link);
>>   		spin_unlock(&bdev->lru_lock);
>>   
>>   		if (bo->ttm)
>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
>> index be8d286513f9..7aa5ca5c0e33 100644
>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>> @@ -69,8 +69,8 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
>>   			dma_resv_assert_held(pos->last->bo->base.resv);
>>   
>>   			man = ttm_manager_type(pos->first->bo->bdev, i);
>> -			list_bulk_move_tail(&man->lru[j], &pos->first->lru,
>> -					    &pos->last->lru);
>> +			list_bulk_move_tail(&man->lru[j], &pos->first->lru.link,
>> +					    &pos->last->lru.link);
>>   		}
>>   	}
>>   }
>> @@ -83,14 +83,38 @@ ttm_lru_bulk_move_pos(struct ttm_lru_bulk_move *bulk, struct ttm_resource *res)
>>   	return &bulk->pos[res->mem_type][res->bo->priority];
>>   }
>>   
>> +/* Return the previous resource on the list (skip over non-resource list items) */
>> +static struct ttm_resource *ttm_lru_prev_res(struct ttm_resource *cur)
>> +{
>> +	struct ttm_lru_item *lru = &cur->lru;
>> +
>> +	do {
>> +		lru = list_prev_entry(lru, link);
>> +	} while (!ttm_lru_item_is_res(lru));
>> +
>> +	return ttm_lru_item_to_res(lru);
>> +}
>> +
>> +/* Return the next resource on the list (skip over non-resource list items) */
>> +static struct ttm_resource *ttm_lru_next_res(struct ttm_resource *cur)
>> +{
>> +	struct ttm_lru_item *lru = &cur->lru;
>> +
>> +	do {
>> +		lru = list_next_entry(lru, link);
>> +	} while (!ttm_lru_item_is_res(lru));
>> +
>> +	return ttm_lru_item_to_res(lru);
>> +}
>> +
>>   /* Move the resource to the tail of the bulk move range */
>>   static void ttm_lru_bulk_move_pos_tail(struct ttm_lru_bulk_move_pos *pos,
>>   				       struct ttm_resource *res)
>>   {
>>   	if (pos->last != res) {
>>   		if (pos->first == res)
>> -			pos->first = list_next_entry(res, lru);
>> -		list_move(&res->lru, &pos->last->lru);
>> +			pos->first = ttm_lru_next_res(res);
>> +		list_move(&res->lru.link, &pos->last->lru.link);
>>   		pos->last = res;
>>   	}
>>   }
>> @@ -121,11 +145,11 @@ static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
>>   		pos->first = NULL;
>>   		pos->last = NULL;
>>   	} else if (pos->first == res) {
>> -		pos->first = list_next_entry(res, lru);
>> +		pos->first = ttm_lru_next_res(res);
>>   	} else if (pos->last == res) {
>> -		pos->last = list_prev_entry(res, lru);
>> +		pos->last = ttm_lru_prev_res(res);
>>   	} else {
>> -		list_move(&res->lru, &pos->last->lru);
>> +		list_move(&res->lru.link, &pos->last->lru.link);
>>   	}
>>   }
>>   
>> @@ -154,7 +178,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
>>   	lockdep_assert_held(&bo->bdev->lru_lock);
>>   
>>   	if (bo->pin_count) {
>> -		list_move_tail(&res->lru, &bdev->pinned);
>> +		list_move_tail(&res->lru.link, &bdev->pinned);
>>   
>>   	} else	if (bo->bulk_move) {
>>   		struct ttm_lru_bulk_move_pos *pos =
>> @@ -165,7 +189,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
>>   		struct ttm_resource_manager *man;
>>   
>>   		man = ttm_manager_type(bdev, res->mem_type);
>> -		list_move_tail(&res->lru, &man->lru[bo->priority]);
>> +		list_move_tail(&res->lru.link, &man->lru[bo->priority]);
>>   	}
>>   }
>>   
>> @@ -196,9 +220,9 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>>   	man = ttm_manager_type(bo->bdev, place->mem_type);
>>   	spin_lock(&bo->bdev->lru_lock);
>>   	if (bo->pin_count)
>> -		list_add_tail(&res->lru, &bo->bdev->pinned);
>> +		list_add_tail(&res->lru.link, &bo->bdev->pinned);
>>   	else
>> -		list_add_tail(&res->lru, &man->lru[bo->priority]);
>> +		list_add_tail(&res->lru.link, &man->lru[bo->priority]);
>>   	man->usage += res->size;
>>   	spin_unlock(&bo->bdev->lru_lock);
>>   }
>> @@ -220,7 +244,7 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
>>   	struct ttm_device *bdev = man->bdev;
>>   
>>   	spin_lock(&bdev->lru_lock);
>> -	list_del_init(&res->lru);
>> +	list_del_init(&res->lru.link);
>>   	man->usage -= res->size;
>>   	spin_unlock(&bdev->lru_lock);
>>   }
>> @@ -471,14 +495,16 @@ struct ttm_resource *
>>   ttm_resource_manager_first(struct ttm_resource_manager *man,
>>   			   struct ttm_resource_cursor *cursor)
>>   {
>> -	struct ttm_resource *res;
>> +	struct ttm_lru_item *lru;
>>   
>>   	lockdep_assert_held(&man->bdev->lru_lock);
>>   
>>   	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
>>   	     ++cursor->priority)
>> -		list_for_each_entry(res, &man->lru[cursor->priority], lru)
>> -			return res;
>> +		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
>> +			if (ttm_lru_item_is_res(lru))
>> +				return ttm_lru_item_to_res(lru);
>> +		}
>>   
>>   	return NULL;
>>   }
>> @@ -497,15 +523,21 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
>>   			  struct ttm_resource_cursor *cursor,
>>   			  struct ttm_resource *res)
>>   {
>> +	struct ttm_lru_item *lru = &res->lru;
>> +
>>   	lockdep_assert_held(&man->bdev->lru_lock);
>>   
>> -	list_for_each_entry_continue(res, &man->lru[cursor->priority], lru)
>> -		return res;
>> +	list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
>> +		if (ttm_lru_item_is_res(lru))
>> +			return ttm_lru_item_to_res(lru);
>> +	}
>>   
>>   	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
>>   	     ++cursor->priority)
>> -		list_for_each_entry(res, &man->lru[cursor->priority], lru)
>> -			return res;
>> +		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
>> +			if (ttm_lru_item_is_res(lru))
>> +				ttm_lru_item_to_res(lru);
>> +		}
>>   
>>   	return NULL;
>>   }
>> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
>> index 69769355139f..4babc4ff10b0 100644
>> --- a/include/drm/ttm/ttm_resource.h
>> +++ b/include/drm/ttm/ttm_resource.h
>> @@ -49,6 +49,43 @@ struct io_mapping;
>>   struct sg_table;
>>   struct scatterlist;
>>   
>> +/**
>> + * enum ttm_lru_item_type - enumerate ttm_lru_item subclasses
>> + */
>> +enum ttm_lru_item_type {
>> +	/** @TTM_LRU_RESOURCE: The resource subclass */
>> +	TTM_LRU_RESOURCE,
>> +	/** @TTM_LRU_HITCH: The iterator hitch subclass */
>> +	TTM_LRU_HITCH
>> +};
>> +
>> +/**
>> + * struct ttm_lru_item - The TTM lru list node base class
>> + * @link: The list link
>> + * @type: The subclass type
>> + */
>> +struct ttm_lru_item {
>> +	struct list_head link;
>> +	enum ttm_lru_item_type type;
>> +};
>> +
>> +/**
>> + * ttm_lru_item_init() - initialize a struct ttm_lru_item
>> + * @item: The item to initialize
>> + * @type: The subclass type
>> + */
>> +static inline void ttm_lru_item_init(struct ttm_lru_item *item,
>> +				     enum ttm_lru_item_type type)
>> +{
>> +	item->type = type;
>> +	INIT_LIST_HEAD(&item->link);
>> +}
>> +
>> +static inline bool ttm_lru_item_is_res(const struct ttm_lru_item *item)
>> +{
>> +	return item->type == TTM_LRU_RESOURCE;
>> +}
>> +
>>   struct ttm_resource_manager_func {
>>   	/**
>>   	 * struct ttm_resource_manager_func member alloc
>> @@ -217,9 +254,21 @@ struct ttm_resource {
>>   	/**
>>   	 * @lru: Least recently used list, see &ttm_resource_manager.lru
>>   	 */
>> -	struct list_head lru;
>> +	struct ttm_lru_item lru;
>>   };
>>   
>> +/**
>> + * ttm_lru_item_to_res() - Downcast a struct ttm_lru_item to a struct ttm_resource
>> + * @item: The struct ttm_lru_item to downcast
>> + *
>> + * Return: Pointer to the embedding struct ttm_resource
>> + */
>> +static inline struct ttm_resource *
>> +ttm_lru_item_to_res(struct ttm_lru_item *item)
> Pretty much everywhere in this series we have the following coding
> pattern:
>
> if (ttm_lru_item_is_res(item))
> 	do something with ttm_lru_item_to_res(item);
>
> Would it make more sense to squash these functions together with only
> ttm_lru_item_to_res which returns NULL if item is not TTM_LRU_RESOURCE?
>
> The new pattern would be:
>
> res = ttm_lru_item_is_res(item)
> if (res)
> 	do something with res
>
> What do you think?

I would even say we should put that filtering into the iterator.

Nobody except the code which inserted the anchor into the LRU is 
interested in it.

Regards,
Christian.

>
> Matt
>
>> +{
>> +	return container_of(item, struct ttm_resource, lru);
>> +}
>> +
>>   /**
>>    * struct ttm_resource_cursor
>>    *
>> -- 
>> 2.44.0
>>

