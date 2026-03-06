Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFFeH4HOqml4XQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:54:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD4D22115C
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A6610ED34;
	Fri,  6 Mar 2026 12:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hx2vuuBF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010053.outbound.protection.outlook.com
 [40.93.198.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B88310ED31
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 12:54:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVCWlVnEZwgzGkS9uybTdXnj2u5QPTQ3zqfIUpkNqmXXFFjkZPpWDThLl/kuOSFyxWkSehwnswXQRUJtCXG77zZ/8a0UDj3CYAw9gB+tDpuNkmDuixLnFAAWpAxk701BOuoaR/ASNx3QUKcUpbn62EoxTLxJ1GKPiOsCLnsrh8uShp6+RmkP6KL5SXpSeUyx2qZ0fGX7U7IX5rXDiJXIhFZR0MWa4MTHTGcSWaa3TRwx4MCeGxUJ/MqNIRtUP4uJHuKBvx39PMIWGkLlgUgNe+Jp9z0OZiRlyN+Ecc8GC5fmyBp7lMxkRFlDKYfjb52GXYz807dfAOFg8Osic8k6kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOJRMZMv+jVYh9kSokzGAsVwcPzsddeeOw9IG69EOrY=;
 b=djjfuckJTNJHk9/SJigeiPiLA3weLVMZ3ihVLnMfvhG/zBCLhjGydW+CZL5/2kgc7oiluIL4pWlxr9d9mOuYNVO7gp+ICNEkMfRglaQIMj3a/7DNyG86Ug1ptrkdK+KrQhnqK79FofpbvjH+OXO6iTxmeHDcFoeF/OLHLFQ5LzMsnRzwDdfBI8dylvsw565R9A1/cyUlVlEirtDMpjzcgxxXIkDAQbeJcHJU/TV4fK9I7YmRAYQv+lUJ4ZhLE1kwkv7/AGx9O43NEWy0GG8TtQS6ImOAiRTEhMoEkI+ZmN4DrSgYxze7eSa5sZ0AOgEBK4Ak2UMyfbnVQi9OS8isKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOJRMZMv+jVYh9kSokzGAsVwcPzsddeeOw9IG69EOrY=;
 b=hx2vuuBFvz21BCkXZXJZ908eMdQi1JaqV776dEcirCq5zBZgg4HQqnHiCL19T1IT+h5cKUaeJKph4xBom2wrT3nh/+4VGOhSAPwi1bjD8ogHGn3oknB4/gaL+voR62P92Y1IvMyTG4DeGLJCzwCCSL8rezVTjQkSxUnZWZ49bZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB8759.namprd12.prod.outlook.com (2603:10b6:303:243::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 12:54:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 12:54:19 +0000
Message-ID: <884567da-e884-425a-b0d0-c9a6211bc2ae@amd.com>
Date: Fri, 6 Mar 2026 13:54:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: dma_fence: force users to take the lock manually
To: phasta@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Cc: dakr@kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <080395923c92ef758ca6062f1e01392186413015.camel@mailbox.org>
 <718ad034-8fc2-4b43-9b04-729c5befc3ca@amd.com>
 <20260305161212.7dfbadbd@fedora>
 <e8b47e9f-f8cd-4be4-953a-931816e5f429@amd.com>
 <20260306104646.36319162@fedora>
 <9718fa34-95f7-4461-9d01-2ad4eed60b14@amd.com>
 <20260306113723.1f13010c@fedora>
 <b5830a15-af9f-47b0-a811-d43c0c3828dd@amd.com>
 <20260306122417.6febebf4@fedora>
 <6246da89fed7669247527fc36bfee5d92ada96e3.camel@mailbox.org>
 <0009b35c-265f-43ff-84bc-39fbf7109a3d@amd.com>
 <87197ff8d812debbd348ccb2befff855b30abb31.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <87197ff8d812debbd348ccb2befff855b30abb31.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB8759:EE_
X-MS-Office365-Filtering-Correlation-Id: 286018ea-3758-4aaf-74bf-08de7b7f7b0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: RCEal4hvAGk0TnIxwJ6fK3Egke/5TDXcxHrT1CZEn9M7S+ApzeP5du5yWsf3dqQGlP5/yJi1SYzILhc6xLFGUSA9Q0R98UIkTj3ZSUtMbJ7C4P0VoSXdEzmws1HRXondODxsHm7c1sGz3BrEnH9YT1UemyH/s9MokXxMvhUDWPh6Z5E5YfN0pEF3CeKFPf7MF4A25XdaUF1slnUTSYUw+D83vjmFnPAx6PkclMRWxuSgPb81oaggIaQWP1JTWsdLCJ8k5Mk1PJKYYV5ku/DHbewiMRXbdLs1qer7ns7E3g6lGAmu31gFuCOZKwHwSWg1zK4/1YkKdDPUdB5QbOod93yN6gkNSei483VBHhjLpRKIZmgPTbnI/vX9H6+j1R7irN3fz/cH6q3IILq20WyPdKPZqUxPDfus/jzC2QljqUUiBoWEp4e7lQgHGcK+s22Wxqc4pqZS6O3pQW3AyBila2K3ls6uvus0y2IA5NarJsNLDjiJvdx7Z+o+N0VrFQNj6ezMiM6slYrqlQSCfoO891pJujS7dnRK2N6NhzyLtgdTx+l8OcedC9Gb4SlneDJyzKuwKLZWO+gVhFUzf96kFiwkD/IuWhEpRne6DiL4dEqOsvrYJhr00EFhofk+lumtU1DQ7g7yzZz0SNOKRa+tCqR8bJ7XDcVBDzmzoomjLNuZ3ZlbZ5ALqoUbZm2iw7NqV68Qnx+wZ/V+h23eOKGT1H3Xcf8zeLNcgHzxCGzLSIw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3QwenZvTTcySTNydkFSdk1MNDZTeDRHOHROaVlXVnkzQjJXdG5VYkJDV3Zw?=
 =?utf-8?B?RCs1YmJ2UWtXckpIYUFWRUpabUZGbnJ6dDVXUUlBa3FldmdGdDAwVTVmTEVw?=
 =?utf-8?B?Rk1qdTNENWJNNEN3VVdqRURtTmUyZW5IWnN5cUpRUVp1RzVINWlmQXBOUlpF?=
 =?utf-8?B?bUpMdmJlL2V6dFBQR1RJdGh2ejM0Mk5iODBpY3hJNHJabzhUV2N5TkttUm92?=
 =?utf-8?B?MTNpVnpyaFJLeURQOEpxbWYyVDg2N1MrZ0xwU0QyT29XUlFncVhwZDgyVEdF?=
 =?utf-8?B?eGVyb2N4cW5KM3QvNHMzc0NvM0IxTnM2eWcxenllZllvTDZkNW4xZ1NseWNl?=
 =?utf-8?B?MEJQaFFZUklkVFhtQU5paVR3a0NWQzJnYVNjdXlDek1lK28rTnlzU3FPVlhE?=
 =?utf-8?B?U3p0VUpmVWNvT1p3VDFKS1BYTVZWV3ZMYjU5QW5tNFhZZklKU1ZBajBkZkND?=
 =?utf-8?B?TFdoNllsVHJyQVl0SzEzemZaY3ROVnJOZk1IWW9WRjdTS1RaQUUvOWo4bHJT?=
 =?utf-8?B?ZDdHRGVkM0xCdmhXUWVaWHBwQS84N0RIeGs0R0JHYjZSbG5FMk1TUndOTURw?=
 =?utf-8?B?ZkFXMFZUU0g0QVRvWGJpZGpUdW5neG04cGhqREdCY0E3N21JWTBPVUFLdG91?=
 =?utf-8?B?MFZ1Q1RmQ3JHWDFOclczcTFGcm5mZnpnaWVXRXZJcVJ5Mm55TFM0NUtFUUx6?=
 =?utf-8?B?TlRSejdaV2ZkM3NkWTZGRG5UVmpOSktnT25zcXZwRVpsamZWa01wQk4yY0JJ?=
 =?utf-8?B?RGo0T2ZkMWdoSFFXTjV2VGZRR2FCWlg5bnc4NkR0RkxUOVNNTE54cjBnV1VK?=
 =?utf-8?B?TVhuUVlKV3krWFdIaWxpTHBHcGhuUUZrdUJFRHlNZGxyUnRrcnVJYm5VQWtr?=
 =?utf-8?B?YnljeWZINHcrVVJjSUJ4L3UrNlpDazMyYTVrR1NKWHZPdnh3bDBaL2c5eWps?=
 =?utf-8?B?OE83aHJpSnp3eGlKaGY1dTBpVjdXeVRHdllkZTRqRml6UXlGV0FzL1BjdjFC?=
 =?utf-8?B?VVhRdmZORW5ncStSRzJDQVFyZmlOcEw0TnBzS3V4NERDN0F2SUNLRzQyK212?=
 =?utf-8?B?bUxvV2hJeGZ0VWlWeVhZVGNjZC9UWWRUSGNQSzY2Nk9HQW12TTNVYzEwY0xN?=
 =?utf-8?B?aU5JWEZPQVZXRWRrNExZNVRBK3EvQjRQdEtHNDRMekR5dzYyTXJsVDIwd2ZF?=
 =?utf-8?B?Q1JYVjVyMXJCVHY5UzRvRUFxbEYrREpJMG5HVUNZdUV1eVJ0MXF5Yml3M1Y4?=
 =?utf-8?B?d2xoSUhqSDNDNVdYaHdIY3I5TlNqL0VCa2xqak5jdjR1a1FENjBZY1dSS0c4?=
 =?utf-8?B?V3RiR2s4dFl6OHVPemZrakN1TktwMEY0QnpDRnJCTlFKUkZlV2RrT0Z6SDhz?=
 =?utf-8?B?K2dnUnYxek1TUXozajBKWGJaTFMxQXczZ0dKRUpoUFYwdW1YNkhtVmpHVmVH?=
 =?utf-8?B?YW95V3A1NldOZEF4K2VpOWw0cWlhOTFHUExOak5oaHJyRkE0aGxSbU9KNEND?=
 =?utf-8?B?NW5FMThJQVhublJpWVIyUUVuVDNYMlUydzdkRW1lcjd2RW5sK1c0SUMwM3RK?=
 =?utf-8?B?VHBySUpncmxVMzVlQzg2bUlnQ0hpbVZKbFJ0bGxRSGZQb245THQvcXVlRmts?=
 =?utf-8?B?dUhvWitKS3dVdDA0OG80aEtPYkJuenFTVnNpNWZpQndlRmtXQ2IzR092eXFw?=
 =?utf-8?B?RTUyVzdQeTZVVVBYNlBPU2VOaTZVdVZ1dzJXY1J5MEFtTVJiT3dSbjBqWjZp?=
 =?utf-8?B?YW1kUmFibS9UT2tKeXB0eW9NQUg4Zm5RdVBDYWdXMnB4bG9odml6ajc0aFV1?=
 =?utf-8?B?TWVaY0lVY2RNZGFhVkVUTWIyYVlWQ3hxdXE4K2gwSkJLNXFpRWFUbCtVQ0h4?=
 =?utf-8?B?YnVqMGZFNFp5S0ErOWdDbTR4RG9ETWt5VWQ4Sk5mYnQ3VSs5VGphbEYwNFJj?=
 =?utf-8?B?cnNJMVhRUzB1TjA5ZnNjM3dTUStyeGtMcWpVdEZCZFJsWEJ5TXRDUTlPdjZX?=
 =?utf-8?B?SzUxbzdESzlhNVQrY05sd2JhUEhrS2VBZDg3WWxySDZpZXcrWWx4cEloZGhK?=
 =?utf-8?B?bllkQ01sS2tkQkwzZjlrdmJ0KzU2MlpkS1ZVTkc4L1o2Vmk5YTgwMnllK2Ni?=
 =?utf-8?B?NWNEVWVWSWhIK0hEbHNER0JOSnJMcW9DWk9qNldJMGZxQU9MTVRwNTMzVXF2?=
 =?utf-8?B?MjFpNmVGSkk1L1dhbzg1TGlybEVzcHJmZ0M2Uy9WODdGSU1iNUQwU0hHZjVn?=
 =?utf-8?B?OTBrSktkZ05sL0F2cWZ5cjQ1SFhMZURjc0Z1dWp5V1JNYlZ6ckZDTzI0eVBj?=
 =?utf-8?Q?nI1i2T1HEQ1HzRHJf5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286018ea-3758-4aaf-74bf-08de7b7f7b0b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:54:18.9770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcAf5FfCfM2famBY+KKnvPNlqz/oWLHj1K4EGMBsptterAGCEbDQhchvbUW9cY8S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8759
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
X-Rspamd-Queue-Id: CDD4D22115C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/6/26 13:36, Philipp Stanner wrote:
>>>> (which
>>>> is the thing that would be attached to the HW ringbuf. The reason is:
>>>> we don't want to leave unsignalled fences behind,
>>>>
>>>
>>> Not only do we not "want to", we actually *cannot*. We have to make
>>> sure all fences are signaled because only this way the C backend plus
>>> RCU can protect also the Rust code against UAF.
>>>
>>>>  and if the HW ring is
>>>> gone, there's nothing that can signal it. Mind explaining why you think
>>>> this shouldn't be done, because I originally interpreted your
>>>> suggestion as exactly the opposite.
>>>
>>> I also don't get it. All fences must always get signaled, that's one of
>>> the most fundamental fence rules. Thus, if the last accessor to a fence
>>> drops, you do want to signal it with -ECANCELED
>>
>> All fences must always signal because the HW operation must always complete or be terminated by a timeout.
>>
>> If a fence signals only because it runs out of scope than that means that you have a huge potential for data corruption and that is even worse than not signaling a fence.
>>
>> In other words not signaling a fence can leave the system in a deadlock state, but signaling it incorrectly usually results in random data corruption.
> 
> It all stands and falls with the question whether a fence can drop by
> accident in Rust, or if it will only ever drop when the hw-ring is
> closed.
> 
> What do you believe is the right thing to do when a driver unloads?

Do a dma_fence_wait() to make sure that all HW operations have completed and all fences signaled.

> Ideally we could design it in a way that the driver closes its rings,
> the pending fences drop and get signaled with ECANCELED.

No, exactly that is a really bad idea.

Just do it the other way around, use the dma_fence to wait for the HW operation to be completed.

Then wait for an RCU grace period to make sure that nobody is still inside your DMA fence ops.

And then you can continue with unloading the module.

> Your concern seems to be a driver by accident droping a fence while the
> hardware is still processing the associated job.
> 
> (how's that dangerous, though? Shouldn't parties waiting for the fence
> detect the error? ECANCELED ⇒ you must not access the associated
> memory)

The dma_fence is the SW object which represents the HW operation.

And that HW operation is doing DMA, e.g. accessing and potentially writing into memory. That's where the name Direct Memory Access comes from.

So when that is messed up the memory which gets written to is potentially re-used with the absolutely dire consequences we have seen so many times.

Keep in mind that this framework is not only used by GPU where at least modern ones have VM protection, but also old ones and stuff like V4L were such things is just not present in any way.

Regards,
Christian.

> 
> 
> P.
> 
> 
>>
>> Saying that we could potentially make dma_fence_release() more resilient to ref-counting issues.
>>
>> Regards,
>> Christian.
>>
>>>
>>>
>>> P.
>>
> 

