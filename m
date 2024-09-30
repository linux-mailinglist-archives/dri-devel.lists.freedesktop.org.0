Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9453B98A3F8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7865B10E45A;
	Mon, 30 Sep 2024 13:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DcSXDtCS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0D510E45A;
 Mon, 30 Sep 2024 13:07:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dn1KQfje/TlnBGJyhv9H0pecN7/92XMsEbu325s5v15UZBc7+z5+2P1Tv5oZmitbSKWJRw/K8AKytUVbzMw/PhKDsEk3CKcFX4nz7gxc/CNd4j7LG9g8iZkq+ipuEOwZ8f9yLR7txEDipetApLHiuXYrboMraj2A++2JuFAeHD7Z7nb1u/hxlWjycXdmbJx8NmvdyeYyP8XE1c7tRRPDnLkJl7buJAZUIOq4NOhQuJzKz8JYMbluCJWdnhbml58DDX4OFqCYR8N2Sx4jHznXSPhYCdRBBWjLShlU62nTDx0za0hGwLosBf5qwxUZyaio2mEh2+jNoJJ8YBnCR9M2FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVzTEzS/G0ACA4Fye2BK1OMK3K6vJ9PnMRaI8xzQqE0=;
 b=GHNtJhiGiYwvX/aYOpvjugOGTDrbBGFCLbnwYv4xpTV1KOw2YHztrxO/m9YvId1O1VQ1ZMEJHatFJUC7vBQIhLeMni4rWnPyd8zLekxK+O6xD3+l0La/j7804oU4IiiTUslfl4O68UlBzY8DtXvbmX2dqUj+C0P9eSKx4drS76L5NZTInarkS/KKAIHTGCaxHFE6EkcqVn4ZVmRy/rXVDz9H2NuJ5mlG/WbwkwmceXcH7Qv4iByTSYhGmlkTJyVU5y4WCGAwdmlcjX/+pELWGCoOhSRNfrpKVM+1Y7lhCjQ+YBi2+hExEuWAmuP0K5+VPjXZ2sA9LbmaQU/c22YIEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVzTEzS/G0ACA4Fye2BK1OMK3K6vJ9PnMRaI8xzQqE0=;
 b=DcSXDtCSYA6txLwSmihFk50GTar1Vg829wz9r3kM0+jLM6B/EWAHnnwTVlZyqa4nqUJ+S9Ynhnae/dTqVkVOyqOyq65GE3ltIAbYgfEsVMekvQQO0F3Q0H1pgC/ebYfifVTv1BTQwuI90YTHR2uqAaC7JLfsRHsjaKCtizg3ERQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6814.namprd12.prod.outlook.com (2603:10b6:806:266::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Mon, 30 Sep
 2024 13:07:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 13:07:17 +0000
Message-ID: <cf135523-92ca-4d41-9acf-e979c9769ad9@amd.com>
Date: Mon, 30 Sep 2024 15:07:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/sched: Always increment correct scheduler score
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, stable@vger.kernel.org,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20240913160559.49054-1-tursulin@igalia.com>
 <20240913160559.49054-4-tursulin@igalia.com>
 <8392475d-489e-4aa3-b6c2-7cd15b86dab2@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <8392475d-489e-4aa3-b6c2-7cd15b86dab2@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0320.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 9881cf4f-02b7-43b9-86e0-08dce150cf3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U21ORWt1ekM3ekNTcEh5NFMvc1NmaW1BR00rWmlPTUJHaU5jMHhnNVU4eUps?=
 =?utf-8?B?N1dMMzlWOTd0SkFuS2FTVHRoek1FNmJ6cDVNWVFOMUdMcUhMemVLMFNDOG5y?=
 =?utf-8?B?MTQ2YmFWVjE4OHdNaXprNUx1akUxVTRXZWdBeUxDaFEvMUpsQjc2dktvMktI?=
 =?utf-8?B?d2RFVldWZkRPM2FjUVhqZlNmNXNJRFkzM1Z0eTcrK2dhZlRRb2trUXJLTmJj?=
 =?utf-8?B?eGhZK2haa3ppUGVrOWc5S0c2dkNPN1ozRGJ2d09nc1ZuQlJWOGhEc05kOFo3?=
 =?utf-8?B?NDJRazB2QXNrZjZJelVJb1UwVVBjczZFK3pTb3BKbG5NVWZRNFhqY29YMk8x?=
 =?utf-8?B?UTMwNnBVMHVGQ28vRUY5TWtGOE00MVFWb09rbCtmdzdZWEpZOFRwdlhJTTZJ?=
 =?utf-8?B?d3ZwWVl0Vlo3bEZtLzhUdk9GTHphdHlVSzh4OVJwRGcyQ3U0WTRKZkN6Y3E0?=
 =?utf-8?B?cThEZkxmckNYRkh6VGEvT2RiNVp3eVFxWlRRdlhoTDhKRVBNcnFmSEtDL0xI?=
 =?utf-8?B?WEU3QS93bXA3M0tjSnZYUTdlQ3ZmY0JtU2F1ZGtJMjV1VFJwVlU5NFNDcnp2?=
 =?utf-8?B?MlhTQm5OaG9OWWYzZDBSbnY0RU5yTVlmRUFXaENlbnYwbC95aWIvaHk4MXRr?=
 =?utf-8?B?UmZGVWZXNkVnTnRhOHdTWWt3a0NmbkZ1ZXNoWm54dHMwYzEyZXI4RHA5NCsz?=
 =?utf-8?B?alJOcHRRdzlvWUluSmZxN2Q2K0JwUktzWlIrNldaditKRFNJOXAwekxOeSts?=
 =?utf-8?B?WDRLL213bEwzVVdXMkFvNCsvWkhUUWY3T2twajRyT2s5VmFQV2R3R25UVUh0?=
 =?utf-8?B?Z0VxRkxFdUtLYTNGeWpKWjg3Smo0N2g4U1JFMHY1TlVLdHhFckNKRnpGdERL?=
 =?utf-8?B?TXdhc2t4UW1CVjAvYm93S20yRzl0N2FJMUlBQk4va3dJVWU1ZEl1MTcwV0pZ?=
 =?utf-8?B?YlFIM1lmTTRnd3lVcVZBMDh1OWhhRDUxZjdQcjAwOGZ2K0R5THM4ZHd5UUVx?=
 =?utf-8?B?b2JMRFJPYzNCdTVLVEYvUVNwTEI3TGQzNzQxSzZJbWYyOUdLemhkbnp6WUFJ?=
 =?utf-8?B?SjZhUm5yN0xneEFxeERodm5LL2xleXhuajZ5OTBOMXdJVnZCcXJBdU9RcEk2?=
 =?utf-8?B?bjU1MFNkZGNHTEQ5TzV0SUhGNWRqL1gxTFVBaEY2bmJmbWFJVjZDUHd3Rkt3?=
 =?utf-8?B?aEM0OWhONTBrUWRWUU83T1FyMUN1eGtZREVSTk9mNEtuMkJ2dFJRQ3d2R0dH?=
 =?utf-8?B?YzE1N2VJQ3d6alNicjVhSU1DUWNhaXRYWEY1ZGJSaWpDM0dLQWVHSUxTcHZ1?=
 =?utf-8?B?V2Q5aHpFaGJQalZuNjRYVER5MG9lbEE3RnhvMmNIMG8vbjNGQSt0blZPa21D?=
 =?utf-8?B?U09RL3lhSlBuL1pmTDJyTy9jNTVsaFZKb3NVRnZmd1g3OXM0MjdrMDE5cHdm?=
 =?utf-8?B?K0dsNkJyNUhMQmtCM0RVVksraVpOYXBhQyt5ZXFCMWswMUQwdjBTTENzVDFm?=
 =?utf-8?B?RzFHcVgrTEtHZmtQbHV2aHorSU5GZjMzNXFneE5hQlZ2Q3AxMDVxYmd6NDNl?=
 =?utf-8?B?alJFQ0wwcGIrZGxZeUNQbzJnQkw2M2ZVVEVGb1lwcHhNckRyQ2VlVFB0WDgr?=
 =?utf-8?B?QTg4L3ozdHpYTkVtbnRvbS83bXBTR0pzZFVMM1ZDNVZ4T2YwWkVXcU9BR0FS?=
 =?utf-8?B?bkJxSDMxYXZOOHZOWVhUN0lPV1V2TnpiSlNNVVBzM3JzN2o0QVFiVGRMblZv?=
 =?utf-8?B?eDFEcXorZldCNlpRTTVtY0VPWHpFcmhHZ1FFUlpNc0pWWEJrUzFEdUlEbUxr?=
 =?utf-8?B?L05JVUYvM3kvQThQbGJTUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVA4RjJzY3ppbjVMakxDcDBTV1hPS2ZuZmdnVWo0ODFDVXRqbHdZOWVEbFpC?=
 =?utf-8?B?OXpJWk50dWZNeW00YVkxZDFPNnBseW9hY2M1TjZlNWFFZ3J5WWhpT04vYzhT?=
 =?utf-8?B?N2JoU2tPbzV4ZlVOTm5tY1cwL3ZVdU9SNWQ4d0hyNmFmeGN1dW5xUi85WXNj?=
 =?utf-8?B?RW5nV3phblU3S1Njbk1WRmNsZmw1QXFTVEplOHlXaHd4S1JZbWFadkpQbVNz?=
 =?utf-8?B?dGsvSEp3OEh0L2xGbjRodkJTTHdmOE0rcktFVkdrbkdtM1RNa1oranZ5VjNN?=
 =?utf-8?B?eUUySVVSdUc5Y2UydVJYaHY3Q0ZZdE4yYzMzUUtVdWIxbVE3dzlEdG1kYm00?=
 =?utf-8?B?aTdCVFp5MlZ0bHVkWFRyUzlMREt0ZlJ0WnR4QVd3QVdYQTlhQnlDSGRVVjVr?=
 =?utf-8?B?amI1MlJmL2ZyaitUUVhaR3BNQzhPTGNpVW5STkFIM2VJalpqZWpobHZUT0Ey?=
 =?utf-8?B?WEovek0wRDg2OTFCYU5EZE5lSHh5WGYxeXc1QjJ5QXV4aHBCeHZzaVRNS2Ra?=
 =?utf-8?B?eml0b0k3UnYwM0k0M3Y0RUZtREFtMW96eXlqOTZ6L1c3NjZkVUN0NUhWL0lx?=
 =?utf-8?B?RWY5b2VGWmkyMWxMV1JTY1UzUUJVQjQ1QmtvZjZQOWpwVXR3am9hVlVva1VF?=
 =?utf-8?B?SnZmQmpjd2pYR2pqdzhlaU4vQ3NDOTlRQjc5OWFOVG5JQ2RQM2puMFUxaVBr?=
 =?utf-8?B?R1JQWUUvVnRmQWdSVU5YSVVja3h3VENRSTN4VGZmSkcwN1RVVWVuaEhId0kz?=
 =?utf-8?B?RXBKNWwrZkFCTnlyb0h0eC9BdDNIQzhBMEVMb3IzNndPVUNFQTVmYmtvQkND?=
 =?utf-8?B?NE5kNGZiaHVlN1c1MjJQRjl0ZmhzVDB2TEJsWE4rVHdjbzErSzJOQmh4Z3Vm?=
 =?utf-8?B?aFpPZWtlTEpSbkdUaVFIdG9yeGdLZkdBRENQbjlQL0o1SDl4TWVURU1PeUtl?=
 =?utf-8?B?OEFKSTl4VE14V09tU0w5ZnFtcGIzcTAvYnV1ZjhveHkzVWZ4VWhYN3RPZE9a?=
 =?utf-8?B?VWxKaHg0T1RlZUdSWGZJampqV0RPVWgvNXlSdEl6YW40SGEwWHRTTGpIYXEv?=
 =?utf-8?B?NmRkb0RlSXRVaHZsVksyejVRSEFSOFZ3STQwVjBkeDIvMkN0L0UxS0Q4V0M4?=
 =?utf-8?B?M0s3V0NuM3FFbnNmU0l3SzliMVQ4TWdnQngrRytmZHFhUGVvbDV5RlRPQVNK?=
 =?utf-8?B?a3BWTU1ZSEEzaU9WSDgvS20vUm9uTzdpY2FPOFdNWUFvc3FlUEtiY1ZpcEM0?=
 =?utf-8?B?T091ZnBiQzNpbEFPUDl1Smw5WUFxcTE0YkF3SW8ydTBMNnhQS2s5aDNtYjZ6?=
 =?utf-8?B?dFExeGg0T2RSTGtEZmg1MnpRZDhxS2QvODMzV24xb3ZPdzdEbnNreUtIbVlr?=
 =?utf-8?B?NDJiNWJxQXBsMk9wUEpmYVljeXhqRkRVTWl1bTg3dkxTRlFBUXVmbU8vdlVu?=
 =?utf-8?B?d25sbm05NXNHNVZjbmFRZXNRWjZYTGxSQllhaGtUUUphdUN0M3JLT2EzK2I2?=
 =?utf-8?B?Rk5JbzZ3ak9QUG11REVkNk0waU41VWdhYVZsU0pSUytNdGdGNG1NZHFFQXhE?=
 =?utf-8?B?MGg2QVd4a2tqVEl5ZnJYZ2x3UldTRnJZQStPaVJ6eUtuelZqTW1hR2NYNzRj?=
 =?utf-8?B?cFB4ZWdFQnZtSXBKUDJEeHp2TCtkNUQ5TWlsTGtEMjh4c1RZY1ZKMjVwWm5S?=
 =?utf-8?B?dmx4ZnZJWDFuQWNndUFuS21Wc0lhK3k0YS9aQW8vWXR6Y3lSVUNINkNBOTBy?=
 =?utf-8?B?SXZyclNCc2liTndsWEJoTUtxMlZWNUNOclFGNUhQelJIcHQvZ2ZjT0xFeVcw?=
 =?utf-8?B?UURFUlUxdEV5WkozQ0RPMWZLTWVpdnBkdlVwdG4zVnNNK1RmTGJZWEVlSEJU?=
 =?utf-8?B?MStSVVZRSVYwTmNMMUg1NjRQN2QrdEx3NzRCNDkzNGpXeER4eGhEWml3eHFa?=
 =?utf-8?B?UTZyZElOU1B1bngzMGh4OXY1RWRVSlhMNTZKS2hlN3ZtQ3ViS29TUkNZajJ4?=
 =?utf-8?B?czZFRmdRUUp0RmZqdzZzWEhTZjl4L0c0YmZ5Z3h5bTc3VkRVNUpNakNHUEhx?=
 =?utf-8?B?WjM5RDJXc09WRGpicUlJWEFJaTZuUUpvLzdNV0loejg4UGZmT1ZsWHEreEht?=
 =?utf-8?Q?kgEI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9881cf4f-02b7-43b9-86e0-08dce150cf3d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 13:07:17.2497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMDCUur9oTYUMY+iXZf5W00BY54rMGGXVYGiCs8tS9f9MolK+/xAhqe6R15jgw6b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6814
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

Am 30.09.24 um 15:01 schrieb Tvrtko Ursulin:
>
> On 13/09/2024 17:05, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Entities run queue can change during drm_sched_entity_push_job() so make
>> sure to update the score consistently.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Fixes: d41a39dda140 ("drm/scheduler: improve job distribution with 
>> multiple queues")
>> Cc: Nirmoy Das <nirmoy.das@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: <stable@vger.kernel.org> # v5.9+
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 76e422548d40..6645a8524699 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -586,7 +586,6 @@ void drm_sched_entity_push_job(struct 
>> drm_sched_job *sched_job)
>>       ktime_t submit_ts;
>>         trace_drm_sched_job(sched_job, entity);
>> -    atomic_inc(entity->rq->sched->score);
>>       WRITE_ONCE(entity->last_user, current->group_leader);
>>         /*
>> @@ -614,6 +613,7 @@ void drm_sched_entity_push_job(struct 
>> drm_sched_job *sched_job)
>>           rq = entity->rq;
>>           sched = rq->sched;
>>   +        atomic_inc(sched->score);
>
> Ugh this is wrong. :(
>
> I was working on some further consolidation and realised this.
>
> It will create an imbalance in score since score is currently supposed 
> to be accounted twice:
>
>  1. +/- 1 for each entity (de-)queued
>  2. +/- 1 for each job queued/completed
>
> By moving it into the "if (first) branch" it unbalances it.
>
> But it is still true the original placement is racy. It looks like 
> what is required is an unconditional entity->lock section after 
> spsc_queue_push. AFAICT that's the only way to be sure entity->rq is 
> set for the submission at hand.
>
> Question also is, why +/- score in entity add/remove and not just for 
> jobs?
>
> In the meantime patch will need to get reverted.

Ok going to revert that.

I also just realized that we don't need to change anything. The rq can't 
change as soon as there is a job armed for it.

So having the increment right before pushing the armed job to the entity 
was actually correct in the first place.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>           drm_sched_rq_add_entity(rq, entity);
>>           spin_unlock(&entity->rq_lock);

