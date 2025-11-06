Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDD4C3B1E9
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33DA10E2CA;
	Thu,  6 Nov 2025 13:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Kmh1gU35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012063.outbound.protection.outlook.com
 [40.107.200.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C0F10E2CA;
 Thu,  6 Nov 2025 13:14:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwcnTbxkgt769X2ldSh4A7ahudAZIuJKlAnjeGuOQQ+iMBUlwrZKYh4W9EyP7/PvAJpfGXHTymdtHIjREAXYR5xcOD/cOYxlw43fQO9GNZobJIGFEWNhqEyfdiwWRR5/c5rUsZQq3yA+oujf4DZ+lfv+kI5iDuBEBSECPzoaDKxNt/PEYBRy7dfRmvTtlz4lS27TPwDOuCAYqY4hkG9Eokv7OVfW7L+9RWjCPFNHU672hnAa8WUDPziCkegouRZRry1K26/tQ29TUG3lnGg5WFTCE+c5Z+kS7NALerAKJQvXTn7wZ9WxFF40ASFhACHKtsY9wIPWQielgcJJxwCNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YQXFXo2STX2AV8XCo/GEwtD/ufGQBPLYcy47x5iHTM=;
 b=JuVZs1QiNLOee6hz4A971XyzVota0ABT++94Tkzq0Nd4nyHrl3M2EGwCQT43t2c3HvBhc3IGbAyBNpstVEkKmRYEoqOOembNyRivb+OzUoUmZu1dCJCZQ/TQtXjrPe+1C2pY65Kbl8VyLmAynj0dpcNfTU8vETTosa0qL+Lj9caGi4ko+ZZGY+1e+1PtEOwYvCs/uEHOZ7X4AW13N+zYvDL+RMfFKEjfscQVaJzMWLCHf3pe3MDKsmnFNxcJs269mbkQ5KDstWsl8KaBGERe4ezI+htbhBqjO++wY2Y1gfjFxG0BiPGCixU9NzgqiIp79m0f+5ZanhcIm1B58xz+Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YQXFXo2STX2AV8XCo/GEwtD/ufGQBPLYcy47x5iHTM=;
 b=Kmh1gU35ED1PtmORmgKeA8faOGg3oyGPEcq8iKPzeJC8kuSESib14isMJ4e31tDvNe6PI8ZZAOSm+eDPq3gV7A5w9rq/etS//ENa/+F+P1vqhXyz8pwkrEh4u5vPhsCtHD7NE3UhMbakTY6PRnvCiv/ntwoRu1z+MAsSGz3I+Ak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB8005.namprd12.prod.outlook.com (2603:10b6:510:26c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 13:14:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 13:14:10 +0000
Message-ID: <59fb14d3-63b6-4943-be80-dfad7f59028c@amd.com>
Date: Thu, 6 Nov 2025 14:14:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] dma-buf: protected fence ops by RCU v2
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@mailbox.org,
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, airlied@gmail.com,
 felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-4-christian.koenig@amd.com>
 <0bdc899f-8c03-40fa-92ad-1b907a015c77@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <0bdc899f-8c03-40fa-92ad-1b907a015c77@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR14CA0007.namprd14.prod.outlook.com
 (2603:10b6:408:e3::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b48b16d-6ddf-4e16-b1e8-08de1d365fbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHg1dmlralhmdWtQOXFRVG5VSTdmbEg4S3JXdjQ3cjZLa0MvemJiSWYwcWx3?=
 =?utf-8?B?MFdGVTBISDFDajZZUERLbzlqc0RLVWhkTmhadDJsa3pUNkU5R0dNYmlkcWsv?=
 =?utf-8?B?SUtzTVp0TjljVUI4dXpKUmJvaFNWbDA1UFdqTVFQU29KTG1xbk54RmN1ZHVW?=
 =?utf-8?B?dmVBTDBVeTM2SkJvNElrT2hrdm94b00vUFZzTmNSMFVRNnoxQ3VWbmVJVEUv?=
 =?utf-8?B?Ykx6S1h4R2FQRkF5ZmQxOUdldUNRY3d5a1N1YzcrRzJjNnUyeEptUDJjREFo?=
 =?utf-8?B?VlpBUHhqRXUvMVBwL0crdjlvc1BTdWFvN0Z0Nk9LdWx0M0szbnkrVzRsQTR0?=
 =?utf-8?B?NXdtQTcrYmtNQUxmUk12SG42TTFCMVdvN1dMTWpybDRGelhCR0kvVVhwM2Zk?=
 =?utf-8?B?anFxS09pVWhPdmZGS1VRS2EyZnllZDB6WTJTK1hTUGRlejVhTVB1NXA4KzVa?=
 =?utf-8?B?L0t0eHg0MnRPYzRxMTN1aUVxM0dLSGhVNlNVQndxaGJkUjhQaHZoMHR0UzNK?=
 =?utf-8?B?cDg5WDdsY1VOMk9Vb1IzVXNjM3RNTlFoZHpuS3lKMDFwR1hvY0hrWitHYkZp?=
 =?utf-8?B?NFZkczROZWw5MzNUTGdOd0thSzROSkplbUFNV0VHZllwYlFieER1TTltek9a?=
 =?utf-8?B?d20zbGxDOG9XTDJxTVUvV0VoSmZKbklpclF0M3QwN3hFdDUyNU9CTk9WUnJJ?=
 =?utf-8?B?UVBETkFUQ1ljVjR1ejdhQTQrZXlwOVdueTc4eUpCSUJoVks5ckIzcGtWU0FR?=
 =?utf-8?B?emswaFJQZzFocEUyVDU0NWJDbW1JVTB5NFBtLzArMlUwVXNheTE3NFR6eEZ4?=
 =?utf-8?B?U1ZVQytVME43UW10TlpHMGt1azFCcmgvVWl1YVZaSGRFZXRocUxMS3Zvcmwx?=
 =?utf-8?B?WEJEWkVyUUUvYzRPQjc0M2FrQ0MvampYb3dtbnZIbjQxYmJCVjNianp4bDE2?=
 =?utf-8?B?c3dESHQvWVo2ZUpvNlBmL1ZjaUMrdjhtVDFlM2RaYzZhdWdzZE9zaDR5OEg2?=
 =?utf-8?B?YjdTTVFxYTIwZkUrYjYxSStxaWRjMllZYkRZQnhlZ2NvS1VUWWwvZGlkVGpn?=
 =?utf-8?B?MWc2TDJpa1A0SXI2Mjh6SDhIU01IWDNsTTFkT0o4STVuUVRnVnRibVE1UEMz?=
 =?utf-8?B?VFg5b1l3NzRtdEFESitZREp5RStqS3R1V29NakxCNVRQSVYyVGJFOElCSUNM?=
 =?utf-8?B?d20wMFpMQjVlQTlOSjYrcDFhSkE3alBwVVVzUnBLUzdXR29XelRrYWNuM0h1?=
 =?utf-8?B?K2w1UE12Mm4wRW5XREZTZ0xDSzFEQnlyN3ZoNEhxcW14WmpLc0ljM01KSzNu?=
 =?utf-8?B?eDM3NjZ0anlNRHk4dmR5TVRHeUcvMHFuZTZObisxNi80MU0vb2I0RXdqTGV3?=
 =?utf-8?B?ZE4yZDN5UkRKd3dzTkdzbkZLT3dQd2dBL0pOUDhSZ3hFTUJpZjlXOG03RHdE?=
 =?utf-8?B?K2FRc281SzNYY0JsNTFVSmRZSFplazlCYitVaUphUHN6THlYVytuK1A5VVcv?=
 =?utf-8?B?emNZUVRlYWhLRkk5YVl6cHg5N1QxZVZnNnI0a215MDh0dG1Bc0w5VGxnK29S?=
 =?utf-8?B?VGhFdExpVVUxeG1lck10S0VlU1MzWkRlRU8vS29EQ2RvRmtsVVpNL3FUcHdH?=
 =?utf-8?B?aVZqZU1qRk9PVTkyWm50Ry9PQm5qZ3J2UHFsTFVkdHlsTTNmclNiRWpFNGRq?=
 =?utf-8?B?a2gvZnFKZmxnWWJMUFhNNmtQdUwreWFaWnZtOGFWV0pENzZTOGtRbTFLbVFH?=
 =?utf-8?B?Q3pZcHNxaUh1ekFpRk5lUXdhaEt3bnhpNFpxMmZTdTJsOTNSQkV2UFRqUFR5?=
 =?utf-8?B?WStGaVhsQ2xvbnZuSHlseVlTRk16Wld6TVRkbXU1N2RERFA4QldSZnZBdllM?=
 =?utf-8?B?eDB0UkxlR3NtZGZoaFh0aFdGaTFOQXlUeE12ODdwbnhhMGdvYnZjTis1NW13?=
 =?utf-8?Q?nTPhNKaP9VkbgAqBjRkP55zYyYqNMfSZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzZSUXVIYmZZelJyUlVENC9ESTlacW16TTZpbG53ZzVSZ2doblNxeXo4ZStL?=
 =?utf-8?B?eFFCdGZ6MWd5K1I3eFBKRFFha0lGN0tReXBBOStLVVhiYlM5SGJWd1k1d2hE?=
 =?utf-8?B?cHo1cTZISHFJR0NGVnJhM1hkbkh3S09IeTUwaWJxQ0o4bkFaNlNOVnlhRHU0?=
 =?utf-8?B?L3plWDJ1Z0pQa2thdnltU0k0QmUxb1Jqc2R1N1JrVzUyQS8rS1BXQUdtcXI1?=
 =?utf-8?B?Y3NiU3RDSWYwdWhIYWdKZHdIc3dPNFBTK3VtQjE3NjNmaE53VHdnd1VQY2tQ?=
 =?utf-8?B?ZWNhTHJHbWZoaStyQmhPMDdER0NROHl5M2VweU5yS2RQekt3NjdQKzd0Mnp0?=
 =?utf-8?B?UUlYeThZMUtaQzZ2LzRkNWZmWWxCUGtNdk5mV0Z2WkpCN2pPQmg5bFRTSTRi?=
 =?utf-8?B?NWFTallOZmRHMWluNjdNMW5FeldURGhrTkE1Q0FRR0ZZb2xDVVVWS2dGb21s?=
 =?utf-8?B?cXM2ei94ci9nUVlSdkhkZ25GVGUrVFAxVkFMMDVscys0dndyNjF6azFCdXMv?=
 =?utf-8?B?ZEFGMXFZWmZrenExblpTSDV1Rkg4WFJSU1BVYXNPQURFdzBPbFcrcEZyN3ZX?=
 =?utf-8?B?QzFYWTFESUZaTWhMazRNSUI4aHVwRVdHWnpzT29iWmt6ZE1DejlFMnliaUVP?=
 =?utf-8?B?cHN4eWRqMTRzZVNqUkVGUU43Z1doY3RnVTZkYzZ1c3Jwa1lNVzFzNml4RGF1?=
 =?utf-8?B?MmpKeDBBWU9OUFlhdVBwalUySE1tWW5pSFVkWHB6MzVQMHJtVDdoYXhaNUUw?=
 =?utf-8?B?WFpNQTROc0Fha1pGVSswUUZsZDZXOXA3OVVQTnExRDFOeUNCUlo5Mlk4Smt5?=
 =?utf-8?B?bXN4SXNBQUwwQ2dpdzdod0ZTUEZ0RGNZeld2NmVlWHJ0UDNOUVM3d3c0cXBZ?=
 =?utf-8?B?VnpoUk0rRG4vWS9CQTJ4RFNoaVhKU2NjdHpMVDFsNlh5V2p2amV1bk1aMTdo?=
 =?utf-8?B?M0NtZG1RT0ZjbkdXTXc0ZWRLQVdDZjVvTTlZRDlVK3BBMzVwR1VJeWpFbGcy?=
 =?utf-8?B?a09tREJUaDk1SnZSQXVadll2NHlWNlFqcGIzVlFTY0pxNXVac0xIeXNZNm84?=
 =?utf-8?B?bmFtQUtwSStsWVdoMTVsbHFzV2J3cGZmakhNMUp0NTBvZkRDMVlXc1BzRWpv?=
 =?utf-8?B?OENNaHd4a05JVkhoYUxOZVBQYXdNdFBoRUE1WGJQaG1XTjcxZ2ttOTVVTGR3?=
 =?utf-8?B?MTBrakVLZXFqWk15Z2kzVFhscGNZb1hWU2lIUUtWYzUrSXY0aWhPTEVjb29Q?=
 =?utf-8?B?ZHZWTHd4YW4xNGRGR3pxZWtuTy9OTFBacHNVMklJcFVFMElYaStlN0NsNFV6?=
 =?utf-8?B?TDA1RmxTV1BiMzJ0TFJ4MlFWYmkrcDM2V3dXTVg5bDhZbWZMOXgyaGQvVE5R?=
 =?utf-8?B?QmVRalRCVVNJUXhXNE1DdGJRVStSMzhHcmVxVWRBZTliaVhMVUQ2M254V1Yz?=
 =?utf-8?B?dDgyemU3eTlBR2JuaE9CenllQVVjVTVKVHJyc0RBSFhmbDZXdTVTNGVnSENX?=
 =?utf-8?B?d0wyV2JtaTlVYm5NNzU4N1ZOSWZjZVYwRzQ4M1lPSDE2WnV2YW16MmxyMlZW?=
 =?utf-8?B?cGpEeWdLcDB5U3hOOXVBcE5CSUpKSkZKUE9UU0VzZHI3RTYvMWlrL0hKaTVN?=
 =?utf-8?B?UGJPTlBsVnBvYnZmaDNiRUs1ODdxVnNpYk81cXZuK000YkJwcS9ZUlpCTFB5?=
 =?utf-8?B?SkZycHJhSllWU1lNOTJYaEMyaE5RWWRDVzNpR09ZWUM2M1dacTVQcVdOeFdi?=
 =?utf-8?B?ZE5DemVuRkNuRFU3UjVEWEpzQjRmQmpiUHAzdkh5Zm9SMjBmK3lvdFNXRkdh?=
 =?utf-8?B?SWhlMkw2VEw4S0VnL0thaUNYVnpUbWNnUDBLSmd5TTdwRXl6N29IU29icStl?=
 =?utf-8?B?ck9OZm1OWTE2SEoxc0YzamRiY3FrYWtMZDZvYk8wVm42SFhIQjNEUDdkbVNI?=
 =?utf-8?B?aStyVGNoQWpSTDBnTGZxNG9aT1VLV0NPQ0Nzd0xBQmRxODcvdDkzMGhtM3FR?=
 =?utf-8?B?bzMvQzRJYkU0Zno0NFVFclJHV3UrSzlpdHIyQTh2c2VYRksyOEEvaVErVWRC?=
 =?utf-8?B?cDlNWjlhMFVIcjF6RjNyK3Z0VkdoUm05c0lCd1VjcEU0dDJxaU5mc1hpa3No?=
 =?utf-8?Q?86nY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b48b16d-6ddf-4e16-b1e8-08de1d365fbd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:14:10.8266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZ5aZ7aFiWuiCspyk1tCNyQMkI96DmD4bV4+Zezs67DyGyU/KDB+Zfjv1+1zBj1o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8005
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

On 10/31/25 15:29, Tvrtko Ursulin wrote:
> On 31/10/2025 13:16, Christian König wrote:
>> At first glance it is counter intuitive to protect a constant function
>> pointer table by RCU, but this allows modules providing the function
>> table to unload by waiting for an RCU grace period.
>>
>> v2: make one the now duplicated lockdep warnings a comment instead.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++------------
>>   include/linux/dma-fence.h   | 18 ++++++++--
>>   2 files changed, 62 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index b229d96f551c..ed82e8361096 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -498,6 +498,7 @@ EXPORT_SYMBOL(dma_fence_signal);
>>   signed long
>>   dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>>   {
>> +    const struct dma_fence_ops *ops;
>>       signed long ret;
>>         if (WARN_ON(timeout < 0))
>> @@ -509,15 +510,21 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>>         dma_fence_enable_sw_signaling(fence);
>>   -    if (trace_dma_fence_wait_start_enabled()) {
>> -        rcu_read_lock();
>> -        trace_dma_fence_wait_start(fence);
>> +    rcu_read_lock();
>> +    ops = rcu_dereference(fence->ops);
>> +    trace_dma_fence_wait_start(fence);
>> +    if (ops->wait) {
>> +        /*
>> +         * Implementing the wait ops is deprecated and not supported for
>> +         * issuer independent fences, so it is ok to use the ops outside
>> +         * the RCU protected section.
>> +         */
> 
> Probably a good idea to put this explanation about issue independent fences to struct dma_fence_ops kerneldoc. At the moment only .wait is documented as deprecated, so both it and .release can be expanded with this additional angle.

Done, but I'm not sure if my documentation is sufficient. You should probably take a look at the next version.

> 
>> +        rcu_read_unlock();
>> +        ret = ops->wait(fence, intr, timeout);
>> +    } else {
>>           rcu_read_unlock();
>> -    }
>> -    if (fence->ops->wait)
>> -        ret = fence->ops->wait(fence, intr, timeout);
>> -    else
>>           ret = dma_fence_default_wait(fence, intr, timeout);
>> +    }
>>       if (trace_dma_fence_wait_end_enabled()) {
>>           rcu_read_lock();
>>           trace_dma_fence_wait_end(fence);
>> @@ -538,6 +545,7 @@ void dma_fence_release(struct kref *kref)
>>   {
>>       struct dma_fence *fence =
>>           container_of(kref, struct dma_fence, refcount);
>> +    const struct dma_fence_ops *ops;
>>         rcu_read_lock();
>>       trace_dma_fence_destroy(fence);
>> @@ -569,12 +577,12 @@ void dma_fence_release(struct kref *kref)
>>           spin_unlock_irqrestore(fence->lock, flags);
>>       }
>>   -    rcu_read_unlock();
>> -
>> -    if (fence->ops->release)
>> -        fence->ops->release(fence);
>> +    ops = rcu_dereference(fence->ops);
>> +    if (ops->release)
>> +        ops->release(fence);
>>       else
>>           dma_fence_free(fence);
>> +    rcu_read_unlock();
>>   }
>>   EXPORT_SYMBOL(dma_fence_release);
>>   @@ -593,6 +601,7 @@ EXPORT_SYMBOL(dma_fence_free);
>>     static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>>   {
>> +    const struct dma_fence_ops *ops;
>>       bool was_set;
>>         lockdep_assert_held(fence->lock);
>> @@ -603,14 +612,18 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>>       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>           return false;
>>   -    if (!was_set && fence->ops->enable_signaling) {
>> +    rcu_read_lock();
>> +    ops = rcu_dereference(fence->ops);
>> +    if (!was_set && ops->enable_signaling) {
>>           trace_dma_fence_enable_signal(fence);
>>   -        if (!fence->ops->enable_signaling(fence)) {
>> +        if (!ops->enable_signaling(fence)) {
> 
> Have you tried the series with PREEMPT_RT enabled?

No, that is not something we usually test with.

> I am worried about spin locks in any fence ops callbacks which now run with preemption disabled.

Hui? Why would spin_locks be problematic here?

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>> +            rcu_read_unlock();
>>               dma_fence_signal_locked(fence);
>>               return false;
>>           }
>>       }
>> +    rcu_read_unlock();
>>         return true;
>>   }
>> @@ -983,8 +996,13 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>>    */
>>   void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>>   {
>> -    if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
>> -        fence->ops->set_deadline(fence, deadline);
>> +    const struct dma_fence_ops *ops;
>> +
>> +    rcu_read_lock();
>> +    ops = rcu_dereference(fence->ops);
>> +    if (ops->set_deadline && !dma_fence_is_signaled(fence))
>> +        ops->set_deadline(fence, deadline);
>> +    rcu_read_unlock();
>>   }
>>   EXPORT_SYMBOL(dma_fence_set_deadline);
>>   @@ -1024,7 +1042,12 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>       BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
>>         kref_init(&fence->refcount);
>> -    fence->ops = ops;
>> +    /*
>> +     * At first glance it is counter intuitive to protect a constant
>> +     * function pointer table by RCU, but this allows modules providing the
>> +     * function table to unload by waiting for an RCU grace period.
>> +     */
>> +    RCU_INIT_POINTER(fence->ops, ops);
>>       INIT_LIST_HEAD(&fence->cb_list);
>>       fence->lock = lock;
>>       fence->context = context;
>> @@ -1104,11 +1127,12 @@ EXPORT_SYMBOL(dma_fence_init64);
>>    */
>>   const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>>   {
>> -    RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>> -             "RCU protection is required for safe access to returned string");
>> +    const struct dma_fence_ops *ops;
>>   +    /* RCU protection is required for safe access to returned string */
>> +    ops = rcu_dereference(fence->ops);
>>       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>> -        return fence->ops->get_driver_name(fence);
>> +        return ops->get_driver_name(fence);
>>       else
>>           return "detached-driver";
>>   }
>> @@ -1136,11 +1160,12 @@ EXPORT_SYMBOL(dma_fence_driver_name);
>>    */
>>   const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>>   {
>> -    RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>> -             "RCU protection is required for safe access to returned string");
>> +    const struct dma_fence_ops *ops;
>>   +    /* RCU protection is required for safe access to returned string */
>> +    ops = rcu_dereference(fence->ops);
>>       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>> -        return fence->ops->get_timeline_name(fence);
>> +        return ops->get_timeline_name(fence);
>>       else
>>           return "signaled-timeline";
>>   }
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 64639e104110..38421a0c7c5b 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -66,7 +66,7 @@ struct seq_file;
>>    */
>>   struct dma_fence {
>>       spinlock_t *lock;
>> -    const struct dma_fence_ops *ops;
>> +    const struct dma_fence_ops __rcu *ops;
>>       /*
>>        * We clear the callback list on kref_put so that by the time we
>>        * release the fence it is unused. No one should be adding to the
>> @@ -418,13 +418,19 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
>>   static inline bool
>>   dma_fence_is_signaled_locked(struct dma_fence *fence)
>>   {
>> +    const struct dma_fence_ops *ops;
>> +
>>       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>           return true;
>>   -    if (fence->ops->signaled && fence->ops->signaled(fence)) {
>> +    rcu_read_lock();
>> +    ops = rcu_dereference(fence->ops);
>> +    if (ops->signaled && ops->signaled(fence)) {
>> +        rcu_read_unlock();
>>           dma_fence_signal_locked(fence);
>>           return true;
>>       }
>> +    rcu_read_unlock();
>>         return false;
>>   }
>> @@ -448,13 +454,19 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>   static inline bool
>>   dma_fence_is_signaled(struct dma_fence *fence)
>>   {
>> +    const struct dma_fence_ops *ops;
>> +
>>       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>           return true;
>>   -    if (fence->ops->signaled && fence->ops->signaled(fence)) {
>> +    rcu_read_lock();
>> +    ops = rcu_dereference(fence->ops);
>> +    if (ops->signaled && ops->signaled(fence)) {
>> +        rcu_read_unlock();
>>           dma_fence_signal(fence);
>>           return true;
>>       }
>> +    rcu_read_unlock();
>>         return false;
>>   }
> 

