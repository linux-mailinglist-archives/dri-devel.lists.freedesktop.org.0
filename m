Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E64C3B2F4
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F25B10E8BE;
	Thu,  6 Nov 2025 13:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oOTeeXOb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010070.outbound.protection.outlook.com
 [52.101.193.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B5310E8BD;
 Thu,  6 Nov 2025 13:23:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oh8A2hL22v9ZJ/iTNu9AHyPm67Zgmeg6b4Eb0sn6CKFeNk+n+TreygwHnKPeGadfvuppzfMnM0Ec65dp1yZqGt37zrII+n9yyo+Tmngn9CCK9WCZ2vrYyuBEd09owvyBRyRgOhDc6+u9REOuxmdT6+BXV0FnQmuZ5pktp9XV+zJb9JNebDpu1IxXYVCNXV93G5iHguAV92Brj2HqY+TNCVHWBiuz3XaexHY/aoolvpvWqNejJrPj4Znl3cMUH2A1vBDTqJO7QZskgEBpkPQMzkDoEBnipqNF6kbx6tb22zHKqHjsf3RYCwFjogS6k5ympQJKDdQOqP91pv2IsuO3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYgfJ3pU8QgndWBlbF7hfYjOh9SULTqKXUsl/bztkPk=;
 b=SSp5SZCrpPJ28mDqHm6oDcykit6AyW5gqHL+DYsGPotmHk8A7Siwr2pByAz38RT3T8iYkgVUFqFcXj4lJM+II1tcaha9cmjoyvyt9r76VoJ11p8xwcOVh3v60QNLdVGgvx2gsG67pcMBrKC2NnJn0pCNYiMHqUtgcp+IIi2v6K1Ejzx0+sZHE6zD7FOtMxsLzWsncSF89dX462ehz8JApHB3ZU/zaUTwBreYBOQYUAk2oamm6e6yKxsZHXvYQVtpD8AK7L911VOYIWuMZxTzAY1FxQXLr8fCfWJoI5hIQ6feLM2QHrBEs5Pei1W2v4cKFTvH4aP5M5TKZbn75ou6Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYgfJ3pU8QgndWBlbF7hfYjOh9SULTqKXUsl/bztkPk=;
 b=oOTeeXObq9F12hw2hfY2jq705zy6A8EKFZ9B2YBanHUNp5MqkFo7tTdqOVkzEUiBH3H49TIjKivd8z2dMr0JS5buWlyxYGlUE0eODffXbOUF0J8tj5NfNpwh7IF7ZiUQl57l3ClnTa/x97e9H+UmNs63c7NgR7+hq2p8kWnecfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6633.namprd12.prod.outlook.com (2603:10b6:510:1ff::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 13:23:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 13:23:46 +0000
Message-ID: <1ddca1b3-e0d2-41bd-8708-10dd12f7e656@amd.com>
Date: Thu, 6 Nov 2025 14:23:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/20] drm/sched: use inline locks for the drm-sched-fence
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@mailbox.org,
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, airlied@gmail.com,
 felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-10-christian.koenig@amd.com>
 <21cbf337-45be-4418-b9dc-d3e2034b4962@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <21cbf337-45be-4418-b9dc-d3e2034b4962@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0694.namprd03.prod.outlook.com
 (2603:10b6:408:ef::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6633:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a0411c9-eb07-432e-732a-08de1d37b6f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0RlbkNWR3J4eGtnbzZZeG9LNFNpQnlJanY1eVVCOVVYM1ZTdXNnUDB0WkxJ?=
 =?utf-8?B?eXZ0OTcraUhIWnUzVUJBNjI5SWZYQk5MTFF4V3pBQU9VYVJLaHJLQ1NwcVBL?=
 =?utf-8?B?UHpTSTVta1Q0VkYxeXlFY2dVcFIxWS80SkRjcm1OZ3RINloyNE9ReU9kckZl?=
 =?utf-8?B?MTVYNTU0U1pvbEZwTXNWajdMaFRQZ2V2ZlhuSU5kMmMvYlBHbVJZMTNSdVN5?=
 =?utf-8?B?M3dlQVlnWlk1Qk40WFZvUHZyWkRFSGVSYzNHbUVjYnlQRGRCOFU1dW1IRU9V?=
 =?utf-8?B?amMwVi9Jc2NMODdwSjgvd0VJTDNjNDV0bDhpRWRudjJNcVErWHhQeGhZMHN3?=
 =?utf-8?B?TlhtMmJjcFp5b21Xc0hiVUNUbFJXS1JNa0tpYjFFN3l4UWMyQXh2eWZEYnpL?=
 =?utf-8?B?MGhDVXU3QXYxY1lBeGQrbjVqUUFOQWt3dW1CcTcvTDZnZStmTFJHSHN4eWRl?=
 =?utf-8?B?REhoWVhXaXQxZm42NVp4OWFIUW1WdzFIYTFvcnNVQUhTVHBVVngwb1h1SnVF?=
 =?utf-8?B?d2wxNkRBanhBZzZwNzdHVWllMm05dUI3Y0l3VFd1R2F0SXpxbEcxUzRSMkJK?=
 =?utf-8?B?Z1hsUTZqdEFDd1B6YUMvQVJtbTZKd1dBZTk0KzJtNzdpUXRBUTVSazJ3bjVZ?=
 =?utf-8?B?Rm9xbnFsanpUSFZnRVVaMkF2UTNOcEhTRmt3cWZ1WmZ1TzFnaEpRY3VIY1Ns?=
 =?utf-8?B?c0ZpY2dQaFhJZVorNGZQdHNiK0RUUXBlRU53Q3c2R0FNakRyLzk1MTdBaDlw?=
 =?utf-8?B?dWF2ZG5CSW93TG1leXl0QmlKbk5YYkw0MDBWSVdLSzEybXVOaGdsQlNFVm5w?=
 =?utf-8?B?VWM2ZzVibXgxU1lDaWJKWWMvUy9TWFo5SnRHdDlvaEd5aE5oTkp3M3VzeU16?=
 =?utf-8?B?b083U0RReFBsQng4TEcxa0x3a2x2NWlId24wTWJlSVEzOGZkOVBJZGR0OEx2?=
 =?utf-8?B?Z1FiVWxVUDZBTFRkQS9DSUNsYUlCbG9McDVaZTl0YUIxNWwzRmxNcGh3Lzlu?=
 =?utf-8?B?V2FSdy9qUDlzL1NUZTRlaEZOUldxWDBHSDNsekNTZUdCYk9LSTNja2RQZXYw?=
 =?utf-8?B?QmxWTGg1OGJHaUVUZWh5T00zbWE2T1Q4ZmFVVjVyNmEvQ0Z1UzJUaXRQM3ls?=
 =?utf-8?B?QlVBQyt4dTNYNXd3RlJpYjRQT21CNDl2Z1pVeGRKc1dFTGtzRkoyUlorSTJM?=
 =?utf-8?B?VVFOQ2hCU3pwQzVnVWhyY05PQWpEeTVhUG80a2RneWl1U0UvSy94QUxiVURh?=
 =?utf-8?B?NXQ1MnF5d2hiTGhMZXhHZWhzNWVOVkU3dTAyS0NyMkZlZWJQZWRKOGMvZElh?=
 =?utf-8?B?Z2lMcndrVXl0MEVOVHJLL3FldmRlZ3oydm9MVWRUTGtNeVlqOWtWQU5nMGY3?=
 =?utf-8?B?VnBpdGxBNHUvOVBSVjhGZVE5QmV3NEg4T3EwWHV5eU5hNk9TSUV5bDdZNTh4?=
 =?utf-8?B?UFArNzR5Y1AzemxTd1JDazM0ZGxkQU9qemQyL0ZDR3ordWlRR0ZadVZYbU9M?=
 =?utf-8?B?Smt3dEljelRWQVBNRHplcElrTDVYR2VIUlUvT1BXMzdhT3NKWlFwL0VBMFNu?=
 =?utf-8?B?MGxERUZBdGZMa2paWWRaMXZVbTlubmRQdDFzYVgzZXg1Zkh3V2wyMGxqdHow?=
 =?utf-8?B?c2ZnaEVhR0lnakxyYnhTaFBRN1djZ1J0TXlGbnJWM2YyTDhzUk9vT3hGUVV2?=
 =?utf-8?B?NkdOb3ppUkNMZytzNHpNRGhhN3Njc1p5QTdZelp3dlJqdis5R1ZoTnFIaC9y?=
 =?utf-8?B?aVFhVk9oVGVpcVJEckR2Ni9rdjc4YTRMbTQyeEpvbmx2K0krWE45YXZyR09N?=
 =?utf-8?B?c1BZeXhZbmRaTnk1dEpnTWdmNVc2Y2JodGRBc0huQlFlTmoveU56OWp2OWlO?=
 =?utf-8?B?OG9WV3BGa3VrR2RyVkZrUGFGNVB3dGNwVHpkSlpDMGh2QUphcXI3Nmt1MVRI?=
 =?utf-8?Q?hyzTwDXu+ZVAPsX748O9EwhDkUPb3Chi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXJmUEh5WEZXWHp4MXhrRFRYb2JNZkxnS1Roc3RVNkplNHVhbCt1MFM2Nlgw?=
 =?utf-8?B?MW9TTFdXS0NYWUNFWlZGMkNLSGt4Wno5K1RaNkgyWVZXRFUxV1dFZ2RuQUQ1?=
 =?utf-8?B?NlpNSUxTckRpS1p6TmVmM2I4REczaGw1R2xDL2VrMTFYSWp2NzlMWkt4WU4z?=
 =?utf-8?B?dlNDeE5xOTcrcENDbDJQQ1VwZ2syVkRndnIwektXeG5IZ2V2TXcwSTRQbW5Y?=
 =?utf-8?B?dmNuSUZjaDF1WUpQTEljbnNpNytWd1NwcTRHSnhpekpUbnMvMExpZFFBdXFm?=
 =?utf-8?B?d1M4MmQ1aDYydjk0WkRJSk9CZDRrRmw1V256TS9zdGZYQjN0RkptR1liR1lo?=
 =?utf-8?B?N29DMkpCTUtzeXdHbHlZU1g1RGpBVVlTMVJiT1VyUGVtcEFPODd3UkJ1NjBW?=
 =?utf-8?B?aGUwMWJYVmtCOWw4V2hFcWZRT24rZWNsQk1tamE0K0l3UnlndkFycUJCVFY3?=
 =?utf-8?B?aWRhZUNpaGkwVGFvcEE3RndNRHVMdEVzTDJHaGJ0U25iOFVkeHRnUTEvbW5R?=
 =?utf-8?B?cWNwRlhjTkNkOFB0S3VyNUl4ejYwYzhPQTNKdUwrRmg2bGg1cVVCQkc3UHhL?=
 =?utf-8?B?UDhESVdwLzNpUEZlYUZpd0p3L0IzRGoxUE9HejFUMXpZNzZiNjRKQTRJaHZK?=
 =?utf-8?B?QmJkY0VRSXVOKzcwUzJvSnIvNkNPbjlNemN0R0F2MjdyL1dBSjFNUVpDMXFh?=
 =?utf-8?B?TGM3WTU0SFJvWk9zN1J1MjUyOHgzVHZkL2hiQmlHOEk0bHpCR1R4MTN5ZXE4?=
 =?utf-8?B?YTZ3eHl2RUJzK2lVSyswdExBSEROaDhCQlMwVy80a2ZyS2ZYcXlMY0VEaitD?=
 =?utf-8?B?SVh5L21KNlFtdzZjWVRGbFV3V21DalZMZThQMks5S1VDRllQLzZ6bnRJTHRC?=
 =?utf-8?B?VjNIbHFSZEpqQ3d3YWxYMEFpNlFjb21oKzI4cjE3YWoxakxQMjVPUlllT0lB?=
 =?utf-8?B?djBPSitkKzh1Z21HRDRKTVJBWTVEU0xNNERyaWxKanYxL3RqR01ocEcxRXRp?=
 =?utf-8?B?Q29DRUo5NnRLeW9Ec1BOREFHUytBbzFjNkkzb2dlV25VcVlkRk1vTXIzR1BM?=
 =?utf-8?B?alFPWlNsZjE2TUJRaW9HSjR5aFpZck53WlpJbXUwcW1lWWhra2VTeVdJaEJY?=
 =?utf-8?B?Z016c2JtUjdPK1AwOTZpNForVGRwQXNveExWeFV0NloyYnlXZWJvbmNDd001?=
 =?utf-8?B?cXJXK2RIUThiaFAxTXAxQ01icnFTbDZCNWR0KzY1MHh5YlZULzd6QTVqQ1ZG?=
 =?utf-8?B?OUhBckhNUndkYmtodmhaRXU4U3lIZFhhSWlnNXZub2lvdkJiT084SHo3Wm04?=
 =?utf-8?B?YklhZWhjVGhUWHA5RVZEalRYbEtVUzYza2FXV2IzK3VKZHlGdk91SUZRM0s3?=
 =?utf-8?B?alpROVFaSkxuMWFOdlpGYnpGakk3VkZxNGpEcGhBTlNTZ2MyeDF0NDBEV3lx?=
 =?utf-8?B?eE85dmQxdGRmeGpoZXBhMUVSeEVKaUU5em1NWGlJbndkTk82YmYzTHJZcExP?=
 =?utf-8?B?QlRrM1VkT2RaeERQNkpRc2ttbGRPczJFcUJnb3VSOHQ5Nk5aUHFLSUlVRGRN?=
 =?utf-8?B?UVVqMStuRTYreGxHV3k3am5xbU1zOXd1dDJ5M3NyUlhNMHQ4bk1uRXBzd1hl?=
 =?utf-8?B?OG85UU52WWdNVXYxN05UcjRVaUU2OERRcDlFSGtoa2c5UWYvWkRzbW5CLzNG?=
 =?utf-8?B?YTVtUGpQNm9DZjBlc0RPNTBaU0JzdW9mK1QxeXNYZDlha25SZUREbnUyZTRP?=
 =?utf-8?B?NjNSTTFweE5MODJaL21taFhMUTJCa0w2b1JLbmNJeDltdStGcmpUUGE3NTRs?=
 =?utf-8?B?MnhpbUNvWDgwRmV0dGh3NHI2UTJRenBkTWRUUlkvbGkvTWt2QUtqRU1sc2lz?=
 =?utf-8?B?ak5rNDJyRUNNM1ZSdkpRRlVnZkN5dmg1NHQwZXhaNDFlTW9nUnBnMHhKOHRu?=
 =?utf-8?B?dkpLNTloWEFQbXdHdkNHeXRkWkh4TDZIMUJuZVRyQUxOdmxmWTRCSENxZWhP?=
 =?utf-8?B?aGlQbzF0a2x4U2ltUUNod3VDN3JSMXRGZnlsVVNlaStwWnV1bzh1RkpkRXNl?=
 =?utf-8?B?V0pCU3dPVTFQMDJHRVVaeGYzT2Q0SSszTjJtVENQbGpwZGN6U0ovNlNZZktr?=
 =?utf-8?Q?jvid3/mRTmeUYUmtLrNvOfJpG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0411c9-eb07-432e-732a-08de1d37b6f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:23:46.5325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HV15kiRuJNhziAAI/RITjP30/v2dq8mQuvC35xDRcAhEXn8AiprmGl31RdT+SXl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6633
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

On 11/4/25 16:12, Tvrtko Ursulin wrote:
> 
> On 31/10/2025 13:16, Christian König wrote:
>> Just as proof of concept and minor cleanup.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_fence.c | 11 +++++------
>>   include/drm/gpu_scheduler.h             |  4 ----
>>   2 files changed, 5 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>> index 9391d6f0dc01..7a94e03341cb 100644
>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>> @@ -156,19 +156,19 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>>       struct dma_fence *parent;
>>       unsigned long flags;
>>   -    spin_lock_irqsave(&fence->lock, flags);
>> +    dma_fence_lock(f, flags);
> 
> Moving to dma_fence_lock should either be a separate patch or squashed into the one which converts many other drivers. Even a separate patch before that previous patch would be better.

As far as I can see that won't work or would be at least rather tricky.

Previously from spin_lock_irqsave() locked drm_sched_fence->lock, but now it is locking dma_fence->lock.

That only works because we switched to using the internal lock.

> Naming wise, I however still think dma_fence_lock_irqsave would probably be better to stick with the same pattern everyone is so used too.

Oh, that is a good idea. Going to apply this to the patch set.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>         /* If we already have an earlier deadline, keep it: */
>>       if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>>           ktime_before(fence->deadline, deadline)) {
>> -        spin_unlock_irqrestore(&fence->lock, flags);
>> +        dma_fence_unlock(f, flags);
>>           return;
>>       }
>>         fence->deadline = deadline;
>>       set_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
>>   -    spin_unlock_irqrestore(&fence->lock, flags);
>> +    dma_fence_unlock(f, flags);
>>         /*
>>        * smp_load_aquire() to ensure that if we are racing another
>> @@ -217,7 +217,6 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>         fence->owner = owner;
>>       fence->drm_client_id = drm_client_id;
>> -    spin_lock_init(&fence->lock);
>>         return fence;
>>   }
>> @@ -230,9 +229,9 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>>       fence->sched = entity->rq->sched;
>>       seq = atomic_inc_return(&entity->fence_seq);
>>       dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>> -               &fence->lock, entity->fence_context, seq);
>> +               NULL, entity->fence_context, seq);
>>       dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>> -               &fence->lock, entity->fence_context + 1, seq);
>> +               NULL, entity->fence_context + 1, seq);
>>   }
>>     module_init(drm_sched_fence_slab_init);
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index fb88301b3c45..b77f24a783e3 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -297,10 +297,6 @@ struct drm_sched_fence {
>>            * belongs to.
>>            */
>>       struct drm_gpu_scheduler    *sched;
>> -        /**
>> -         * @lock: the lock used by the scheduled and the finished fences.
>> -         */
>> -    spinlock_t            lock;
>>           /**
>>            * @owner: job owner for debugging
>>            */
> 

