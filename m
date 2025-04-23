Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D2BA98A2F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 14:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5E210E1F8;
	Wed, 23 Apr 2025 12:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FTHH8RRw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2086.outbound.protection.outlook.com [40.107.95.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAF510E1F8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 12:57:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cr5ZMXzRwlCOQpLvItdL0q3406SSePlkXUZbtALKtffxH0hooJCnoH73TamIVURI9P7vVK2eaey9Lq+rxlD96RFr5yAqfZhGxFWh6rwgc+/Wy4GgU7woDlZsEKE4oMbowF6oWJk0WSP1P+BjcvhkiQZR/OCG+cuV2ZyiJdJC3ahOLZqwHozGE3aG9w5V+OYR2+ahPsUz7wtbPUZz8BVt1AiJsG1IvtG1qc+CmdJ5P0KhHASO8Bpso+Sg/7sw2zxnxs75k+cs3Rm3nc8F/pmiGJubFqO0GgiseN3g8bvMzwy7LdEGkvilbVaCTH0okOpDa6dtybhcFPC40W5/BkCSmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9VZfObUJ9RJM2UuhImzZmA/U/EjVnoprjlEZwvB0D0=;
 b=n7kIHoAlZTef0W5vKfMaraCZDIuQgg1ZFDHKdwCX5+vCLafn+fs0Mf/5lrCpq+Np7Fi1iCvYvRyzOU3PnzJB/FGikee1p1m7uwZiZcIwnzxM6u/iUpNf9rZHmp5QG5+8Bb/MH9AGFZJGAc4TWv8mhbMzihbCfz33rvUE8Mj5MCq1broyf7zXaysNin2WdSjLvEs4G8nTH2SRLBY8ImI5Nf8HzDkRfcZzGoOhK1aNDv4qdMsR/c43TpotKdxTIN2//qqb9CBM+X0pk4SFV/oWjaB1v4VtScfRu3wEt87iXznn5QA1Ro7WYnypzwesypTjUzIBC2BjJDsbo5TG2p3hdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9VZfObUJ9RJM2UuhImzZmA/U/EjVnoprjlEZwvB0D0=;
 b=FTHH8RRwVcOapPyqDz4kFTz8Y38OWqj6JsExaUkfJl/KFkATGnihw0jjhu+isTVOe3swLaxPLa/RMxM+hybhyfcVHx6oUtE0ShqsFRwsU2BKwRqRcTw/YgTf2whDYpj8WZ9Oj9YbxET+dAGia3VVDwQizpHlqzESEEhktv/mmok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6123.namprd12.prod.outlook.com (2603:10b6:a03:45a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 23 Apr
 2025 12:57:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 12:57:29 +0000
Message-ID: <dfc4a23b-00eb-4835-9683-154c5d7f516e@amd.com>
Date: Wed, 23 Apr 2025 14:57:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: AW: [PATCH] drm/fdinfo: Protect against driver unbind
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250418162512.72324-1-tvrtko.ursulin@igalia.com>
 <PH7PR12MB5685C40A8B0058293A9A8AE783BB2@PH7PR12MB5685.namprd12.prod.outlook.com>
 <9b3e27d6-724f-4fca-8214-3a3bd7053995@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <9b3e27d6-724f-4fca-8214-3a3bd7053995@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0133.namprd02.prod.outlook.com
 (2603:10b6:208:35::38) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c23a747-8edf-4342-afdd-08dd82666761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmNRR0VhYnFPTVRqNFFha0xTWHJxQWF6aHhkUmY4dzVkWGFrbittUHFDN3Vy?=
 =?utf-8?B?VEN6dUVsQlNERXBnUnJaeXlnVFErWHkvcXJvYWFOMlVFYThRZDFaeHp2THYx?=
 =?utf-8?B?c0ptWWJRREh5eHVMRnR2REwra0VPazdLYmtEKzNyaE9BYkxGQ1pNWXdtODhT?=
 =?utf-8?B?eUlzTzhJUHo0dmlIOWR1SnJ6MW5aU1BRSU9jclhPQ1FDeTJmc0JBaXZmZng3?=
 =?utf-8?B?NlJHQkpYSEkzVzBYdnNtaDhYb2FCc1VXRFFEeUZNV1FiWkkwenhYYUlPSWJK?=
 =?utf-8?B?ckZlcm5HamowRUU3bHI1R20xeWhkYm1WYkh3R2REU2EvN3JRY1FyTVNscnly?=
 =?utf-8?B?Yjk5akhackplZzVrOENQd0ZOTFcvSFBZQnVYT0tKMEp2U25hcjZaaEYrdDZ4?=
 =?utf-8?B?RU9YUGJPZHNmVTlxd3pGTFJaUWtIVnVCNnpLWlVVeUR3Q2xrVXllN3AyVzlI?=
 =?utf-8?B?WHhBRUJYK3NNQ090UXhGUnovMkloUTVuMTBUS1ZjenYrT3V4elRmanZxMlFF?=
 =?utf-8?B?b1BETm04d2RzRDhwL3EybVZBdXNlVENIZGl4T3lCSXpKNFp4MnFocURiZmFR?=
 =?utf-8?B?aGxJMGNQYkYrbHIrL2hFYk9tNDlIRnFpSVBnNTFsMmF2bjViVEhpM0VmY0Zu?=
 =?utf-8?B?cnhLclpDTi9lOTJncGxuVzNtSU1MZjNIMmNFRWhiRkx3bzVDV21sbjVCWDNK?=
 =?utf-8?B?M0FMU2tJMkpLWmsyc21FVzZSa0ZOMUpLK2hhOTJXVmxCQXpZY3Y0M3MrM3Y3?=
 =?utf-8?B?Q3FIYnVPNFFJVmFVdE9SWUpOSUk0RjcvYTh0U1AzVEt2ampkdWErZ2poUUVU?=
 =?utf-8?B?eFpxcWl6U2V6QlRJeXRCbDZuQzBOSmNOQWVBajJsV3BxSldkLy9udlVTY2s3?=
 =?utf-8?B?R2srQlJrTDBLWC9pWXQzNG9iS25vNGQ5ZUp2SEtuZmNaY2RFVlA4QjhWVGx1?=
 =?utf-8?B?bm5IM0d4V3BCMnlCd0pHOUt4YXl1ckJ6M25sS2lHVDFvdmh2V09CSFJrWE44?=
 =?utf-8?B?dkFiaHhsOEhDM2NwQmdkQlIzRmo1WFlHVVJYakpOckw4K2h0YkRMdWZ6a1FM?=
 =?utf-8?B?cnAxZ2N3RE1RR2NjVlJIMWR3SGNZWWVCREZwSVhLNkIyWXA4UlJyVlpSRi9t?=
 =?utf-8?B?ZVVyS3BEcnRMa0cvYmFWeUVLOUNmcjdBakg3TVMzVVQ0U091WU8zeXEvdVh4?=
 =?utf-8?B?RTVqVVlacS91Z2poNEU4MWZwWlpVWEhuVkhTMkpGM25YOUdPeFY3R0VyYi83?=
 =?utf-8?B?UEdQS3JEeGJiL3RiSjVsakdvOVh6alBOblJoZ2w5b3h1a3lKazlRbzNXR2dW?=
 =?utf-8?B?NVNKcVptR3J5RmNVakZqaFVKVFZpb1NqLy9FZCt6NG5CUlYvUnU1V2V0YXc2?=
 =?utf-8?B?VWE3aktJRTVhcEM2RTRRZm1zZU9Mdi9CYlNkZ0E2ZkJEeHF6TUt2VXA3Q3p1?=
 =?utf-8?B?Ny95bGtEQWQ2eVpuQkpKenFxMDU2ODQ1RGFBWks3M1I5VFZmN1dydlZtaXpk?=
 =?utf-8?B?bzhjUDJGRlBVSEFPSFRSMmhGNWVIZWVMeU15cEFvUjJIUUhxWTRpVmhKMFNj?=
 =?utf-8?B?S3Q0SHE0WkZrY3l1ZDBJUTMvVG1GbzNucnFxc0RlQTRNd0JHZU8xc0tHckI3?=
 =?utf-8?B?cE1OU0VhWjlVVUZIQkozUlN4STVvejNjMm1NcVI3a0RESWVTakRoQVdKQ3du?=
 =?utf-8?B?b3FMSm85aCtqeWpMTjdZUmpPYnBKSnlRNHUxZVQvQlJnUGo2OFdsREtnSk1a?=
 =?utf-8?B?ZXVuYWsrdWNhYkVWT3lVZ0F5ejJMQXVWWTIrb1haUkdJcyticmUyeEJZOG1t?=
 =?utf-8?B?THgveURsUzhrV2ViR0ZjUXRpY3NYZExRelpPVTNyQTZXNG9ja0Y3M3lFMzdC?=
 =?utf-8?B?U3NZc1cvcUg0TVlicmV0OFE4Szk0M0xzWkp3ZFdGd0U2djkyWFhZNGlLSnVW?=
 =?utf-8?Q?7J++VDC6xus=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1UzVDd3WE5BS0hGeUhmcXBVblExMXlpdDgweEdxRkZwZEQzZzR4RjlqUmxI?=
 =?utf-8?B?VGRLMnVnWlJ0MEZnTW02K2pPSi82ZkIrS2xPS3IyUjc3a2FESDY1cmdSSkky?=
 =?utf-8?B?WHJVR2xjaVNpTXM4UUFiVk92WDAyQThlUmxELzhoOTR2eWhpckNDMUVaaWVs?=
 =?utf-8?B?Q0lGWk1tNEt5ZXQrTUtxbmU2RXRaNVE2VWl4c3BqNDlTMCtTYzQwbmJEQWQ3?=
 =?utf-8?B?cE14MzV1MlpYNVJBb2o1ZHg2aTVObldER3dGNkVQMWcyMHE4V3djRDJxTk5Z?=
 =?utf-8?B?LzFQWXBaZGMxWkdQOGJwa0hjck9ZeCtZSnBFNS9nTUdVWk1taHF2d3hHZWNz?=
 =?utf-8?B?ckRFTzJYN2w1cldVOGJZV1QvbWZYY3FyVWdiYXcweWVOYzNnYUUya3VOdDVa?=
 =?utf-8?B?bG42dld6ZEZZTytMaW9RYldYY0NpcHoxWXFvZjZobXIyU2l2SVh5VlRBeXJN?=
 =?utf-8?B?TmdrTFBud3BGZFJzTnZXWUM2QVFQM1FrQW1Kb2N3aGhVSGVmcExjUjVWUUNS?=
 =?utf-8?B?S0kxdGdaTXlzeUhxb2lLT2p4bVJHOXdmNmdrZnMrVW93SFdJUncxdk1sbk9Z?=
 =?utf-8?B?ZUJBa1lUVHBDVGQ5V281aWdYM0Jsdyt1djNwUzhBdnBKOUNHS2hwMExSZ1FP?=
 =?utf-8?B?M0F1emxXQVNXNmNXUXJMZHFlbXh0UW9SNktDR3VNTURJSWhXUWpHTXlHcDAr?=
 =?utf-8?B?dXB6TkdkN1VBSEN3ckp6Q21INUZpaExQQUVCOElBajRLUUx4WGJpMVdSNDdP?=
 =?utf-8?B?R3duay92V2tjVjRDbjc4V1owNTNQbUJlSVNLZ1k3UytMNzJVbk1EMXRpY05N?=
 =?utf-8?B?TERZMjNWcGJmNWtWcEwwRU1TTlBLTEc0dWJwbVhkNTAyOUlrcUd6N2VKSkJ3?=
 =?utf-8?B?MnVjRDUvWW1CNWJoT1NGRmNrckFOeUJGMDVGZGp3KzBQTHhlMTNKbExyblEw?=
 =?utf-8?B?U2MrSTMrMG9TTlUvNmd3VTRIQVhMUkdPR1BVcVdkK1ZaeFJrMEk1TVMrbnky?=
 =?utf-8?B?Y1RySkIvYUNFeG1WL2U4Wkg5UXlNVUU4ZlRLVFVNRldIQmtFSWhlT0prdXh3?=
 =?utf-8?B?djN3WmtXV0thOGpFUnlRZGhPemZLQVBHcWY5NFJFd3ljNGlkLzkxSTlOeFhl?=
 =?utf-8?B?cWIyK1AwNXMwNEMzQTlqZUhzQ1YrampDbkhZZ3BodUI2NGNQbStBWEdjV3c1?=
 =?utf-8?B?S3Azckc4SVp4eG5aSEhWU1NUYVZnN05VWkVsODlqWmlER3plQitScHNuS2g2?=
 =?utf-8?B?czY2aWx6aml1VytWTWpseEtqRXVPQzFNVU9oVFJrdlNlSnhmTDNTQ3o5VU92?=
 =?utf-8?B?R2s4RFdNT01HN013R1NORmh0VGVseEFUaDBoM1hVc2dDZVhZYW45UllFdFNY?=
 =?utf-8?B?anN0elZTd2FQTC9YKzFET2orYWQzaTVQejRRNWxFeGszMWR6b2JOSlpibzEx?=
 =?utf-8?B?N0hBaUErbmlaYWx2cGlyRmNidFdYekFXTUdvek0vSmtqVXBkdU5xSXBySk1D?=
 =?utf-8?B?eWdMTS92T0VobkkzWXQvNktMUThhYXZ1RWRBTmZVZUZhZnE5UGk2OU51dmw4?=
 =?utf-8?B?MnFUS0JKZGVpanYrekxKZHhBQm1rbHQ4MjJJWTFseDVSNmhxYmtjK3B6bGRH?=
 =?utf-8?B?RWNjQnRWTnZ6TVVkNzlFOWQwYnhEVVdvcFpHMVV0U0VCRGRyTy9ETGlxSHVp?=
 =?utf-8?B?L0R3Q0poZ2ljcDRWUW5xRFJnVkw3V3dic1dDU3BnNlBheCtXNmpOZnV2czNG?=
 =?utf-8?B?MWRFOXdCUFdwYUprUHl5OXRVZmNPV0ZoeEZ1WDRaZ1o4MnBIdm40UllaZG1t?=
 =?utf-8?B?OFFjSHZ3Uk1VdHRIY2ZrenlnUWpDYy9nSGJJMXAzblovbHM2dVhsTGFZZ25E?=
 =?utf-8?B?TnR6d0ZDWmVpcjJYajYvdnN4Z3ZFUGJERHFTMWEvZlp4bTB1d0orUGo1b0JZ?=
 =?utf-8?B?WkwweFloNGJMWWlwV1d5TS9uUXU5Q2RsNEFURjdFY2lHekU5RFlTUUpSUDZp?=
 =?utf-8?B?TzF3ZDRyd3NRcWtRQVVqWnVlenZIZmlQemZ4Z0Z0TFlzM2gwd1JrTzJUSnJt?=
 =?utf-8?B?bVBFdmkyR1VPaG5BSmRDWUdnQVM3SytwWndoN0w2VGNIOFNzM2JkL1dXeFB4?=
 =?utf-8?Q?uj9GkvwsgAOo1Qk+rKrv3tPI7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c23a747-8edf-4342-afdd-08dd82666761
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 12:57:29.1200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6h0Qw+BL+PbmFi1Jw5dzKb6hZSYTDvsb2Peq/kR7dzxAe8nvU1UNWNQcLv8SO9W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6123
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

On 4/22/25 17:10, Tvrtko Ursulin wrote:
> 
> On 22/04/2025 10:20, Koenig, Christian wrote:
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Thanks!
> 
> I could also add:
> 
> Fixes: 3f09a0cd4ea3 ("drm: Add common fdinfo helper")
> Cc: <stable@vger.kernel.org> # v6.5+
> 
> With a disclaimer that the problem predates the common helper. Not sure if it is worth it for such an edge case.
> 
> I was planning to merge to drm-misc-next, but if I add the stable tag it would be drm-misc-fixes right?

Yeah even without the CC:stable tag that is clearly something for the -fixes branch I would say.

Regards,
Christian.


> 
> Regards,
> 
> Tvrtko
> 
>> ________________________________________
>> Von: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Gesendet: Freitag, 18. April 2025 18:25
>> An: dri-devel@lists.freedesktop.org
>> Cc: kernel-dev@igalia.com; Tvrtko Ursulin; Koenig, Christian; Lucas De Marchi; Rodrigo Vivi; Umesh Nerlige Ramappa
>> Betreff: [PATCH] drm/fdinfo: Protect against driver unbind
>>
>> If we unbind a driver from the PCI device with an active DRM client,
>> subsequent read of the fdinfo data associated with the file descriptor in
>> question will not end well.
>>
>> Protect the path with a drm_dev_enter/exit() pair.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>   drivers/gpu/drm/drm_file.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index c299cd94d3f7..cf2463090d3a 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -964,6 +964,10 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>>          struct drm_file *file = f->private_data;
>>          struct drm_device *dev = file->minor->dev;
>>          struct drm_printer p = drm_seq_file_printer(m);
>> +       int idx;
>> +
>> +       if (!drm_dev_enter(dev, &idx))
>> +               return;
>>
>>          drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
>>          drm_printf(&p, "drm-client-id:\t%llu\n", file->client_id);
>> @@ -983,6 +987,8 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>>
>>          if (dev->driver->show_fdinfo)
>>                  dev->driver->show_fdinfo(&p, file);
>> +
>> +       drm_dev_exit(idx);
>>   }
>>   EXPORT_SYMBOL(drm_show_fdinfo);
>>
>> -- 
>> 2.48.0
>>
> 

