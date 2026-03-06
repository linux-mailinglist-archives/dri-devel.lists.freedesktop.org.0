Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCzLKYO0qml9VgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:03:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F391C21F673
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBD210ECDA;
	Fri,  6 Mar 2026 11:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jqR0YdSW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010059.outbound.protection.outlook.com [52.101.61.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD38310ECDA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 11:03:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+Pg9wyQ/M8CcG5Pc2djSTuhGiBRPllWMTOda4MiF6EgSBaR832vxvIkHkb3KT9s4TwoXIMLcKphSw37nObAOMMEyVmDC/VQ6J7Xsh1sFXpjgOYbY8U0hZo293OfAv5BMWTASRZTGywYWwOPANZVxdmBzRiH8dVuvAGzMtoiuydQ3kVxH5usQAohQhuyJOyDHn4boGpbStJBVmCZH7zeFipBSGZ0DhLtYJ6kBtdpX2GkTWC8sAh/cofA1Sn3LHnz0qUKK6lEgXZLfeXrjDQMTYVD24CLyDr4VF7MW6VDFz9bPWPqku/FcZrJONm433DCnTR/rCuukFFMhIpD5IF6Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4QgQIx/Qru/4/X/Wvoduyud1wQ13adkPFofmyD/Q20=;
 b=HH1NnGUKmkVx6l/VYoONDWJeuVTjLp8bQzVkoO+0TQFvnEC0Vbx163WIwl8dDOusSUJvXeELmrU+60qQAYgCtuWJKmlWdGVZzJLbQnp+VvsJCG6m1jqI1MTZXb74Uv8YxvrMDydh+DfZDATpktAFsi9aKjFXXA7dbWcpR2/9/tShp4k/ZZ+rNHPLPsvd6HfJQCthnbrNYu2NKBS89L5HeiyXEPTWwV/ldcjjq4tjh6bJxex4kFQ/OJEat41kdsxgv/QiwBzbEQdaMumYqSLNNpgK5Oifpy2mp1ff/2gCCbGbM7l+49n5/hSxpvu4Hb15P9RhyGmh4k2SVbN8cbcM4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4QgQIx/Qru/4/X/Wvoduyud1wQ13adkPFofmyD/Q20=;
 b=jqR0YdSWi0tpT6PoLQpJhAwgF9UReNng1ZFAcvFFHCW+cNcn1S+0EUpMppOE8/qj6UFmMwdg1WCHBa4hiizU0eiNPn9Aqgwp9qWkOplyiSqNGl8QqJFp+zz+5Tvmz0TV9VzvD0hGLXtvHBZOq4boiSLwGJxCqJV3+8Gv/ksbsR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8009.namprd12.prod.outlook.com (2603:10b6:a03:4c7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 11:03:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 11:03:23 +0000
Message-ID: <b5830a15-af9f-47b0-a811-d43c0c3828dd@amd.com>
Date: Fri, 6 Mar 2026 12:03:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: dma_fence: force users to take the lock manually
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: phasta@kernel.org, dakr@kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <080395923c92ef758ca6062f1e01392186413015.camel@mailbox.org>
 <718ad034-8fc2-4b43-9b04-729c5befc3ca@amd.com>
 <20260305161212.7dfbadbd@fedora>
 <e8b47e9f-f8cd-4be4-953a-931816e5f429@amd.com>
 <20260306104646.36319162@fedora>
 <9718fa34-95f7-4461-9d01-2ad4eed60b14@amd.com>
 <20260306113723.1f13010c@fedora>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260306113723.1f13010c@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: add1064b-e276-4f48-e8f9-08de7b6ffbf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: O60kZnyoVC/kECe8U7y02vkUwG0N3tuF5Gq4G+nG/omFp7TY7dGWPAXOPIfFwbvuwOxlppigI2EQuvKRVAEdmE7GTuwBehBrfgaLOV2ANCfgKLVpmMb4QrO1NEhDwG7u/clMPekUIXa0eMlpiP1vHxyzlAROsJLkxCUEHLjZe6gYwvJ/oPj7ADkATf3EIpEUzD0aSa6F+tgMMDFSsnyDwy9nqPHS5jKGdHitfmuv983LJ3jgyIR350Ub1HiUFdzya4B7au/pAmDW1PpxIfL1YPf7eAEz6IkLUts+7acll5P9/pfoLQFq+90yI68/xgfYhOH/DTlh552GXEUb6fLOqruw/waMI1KkY6b6LXHay0BTcDomniBBaVTrmT0MlcN0BQEPl4S37wGVceNE1FwzpUeXQgBrebhS7ysJQkA0hePdTVuVtxHTsgjn1zERhtsIW/ITdRb8DLLPD8FBq7LE8TiaYgpBN3L4aF9rBppUc2CQM7YWZCtHr2Q7OYfkSCuN6+ITF9kRaLj5q2UtOP3Lmpg5d+piwzFLCKFuWPF3kfI8BDxnxyj6grqsNuseTtID5SdNSqg4xJb5AfHT1AAxuWtzjtP4wWBe+NMzu229/vtcC/Oom5krg+CBF6QlCJ/ZSCL7yEQzk0cqPSl7TP72O6dD0sLGu1DAhVTTlRWgWOSsoNvHq+YNawVSyIHiKcTm6gfi/WOoxPVhvQPGwhf9+8Yfq+VUA4c4eYGR0UHsQOY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEw4ZWI0ZWF1ODVjV05UM1dHWVZQdFdXZ21tdVRtUU5EMjZ6SEpvK1FYYlh0?=
 =?utf-8?B?Mk9xUWtuVmppeFZRWVh2YXJLTnloREdOL1lneUhzanBHcXhhVkpiVUNjOU51?=
 =?utf-8?B?S0FkTnBlTXJadUVBYlp2NEtzU0VSL1JYQVQ1NG9ocXZhVlF3QVdCb0pJdGFH?=
 =?utf-8?B?YlpDcG4wSmNMbVpBdDYwOU1YSEZRMi9NUC8xMkZyUys0WmhQeDkreEg2NlR2?=
 =?utf-8?B?S1FqZW11cFJ1Y3hwZDRiNSsxTHREVXh1UDdZcS81REtxMXNtZnRRMi8zQVA4?=
 =?utf-8?B?MkRLYm9VNEV6NTlPeE5pd0p4WE9DeW9LR3lkWk5RVERMYVErUmltSHVtSW80?=
 =?utf-8?B?ZXNFcWtvT2x5TDUrMGVmbkF1NzZrd05HZTZTb1FXUk1VRWVLWWhSQ0xwdHVT?=
 =?utf-8?B?cnRtdGJrSnd5TXFzdk9Md3pXQ2VIWGpwUTY5RlBOLzV1N01PK3VVOXRlWEtB?=
 =?utf-8?B?ODZHR3lZZHF6MnJSVEdIWFRwTXNqTXBiZmlrZTNwQ2pNc0xBZDVpWEFiYjht?=
 =?utf-8?B?Y2pxTWhYdTh5eGd3cXJJRjNRKzk3TEdyaG51RG9Zam1TSUpSd3Nxb3pmYTBy?=
 =?utf-8?B?MnBCR3J0d1VoWHlWTXQ4dmE1UGs3UWRGQmh3cFNpVUluc3ZvbFdtL0l5aWZC?=
 =?utf-8?B?aS95OFV0TFI3SHZtUFFhNDgweTFqTFJYRmFpTStudU1wY2RxS2lwams5K2Yw?=
 =?utf-8?B?S1NFUjVQSUtoSGF2MnY5YXZTV1Q2RmNoVCtnMitzcUlRT093a1VFdll0YWJp?=
 =?utf-8?B?bjdWUGVta05HenhpK09CWnQ3L1gvUkp4eDJJS2lGamIxSklRdTE5b3dzVnVU?=
 =?utf-8?B?NTdtL0hIdjFuTGZEVTFnRUE5bTJKMGx2TC9peUJ0ZmRNWE5jbEgxZFVheXBO?=
 =?utf-8?B?NzlnSlRTUzZPSzlxREhwb3FYUUlJU0tPekhybzcwYTA1MzV3SnRENkRuaXln?=
 =?utf-8?B?WkVRdTNOUGUxK0FBT09lOEYyYVJuZ2N6akRCVjE0YUExZ3pra0xWUmxQOFJJ?=
 =?utf-8?B?VWFXTXRaV0RiZ05sS3BVeXVvN2dTa3UwL0VoRjBhaVdTUXhEVVJhUkpqaE9M?=
 =?utf-8?B?K201MmdkNCtVZlZKaFlNdkJ6R3ZGc25NbmNDRTNQLzVQSHdpMzEzMGJhVi8y?=
 =?utf-8?B?OTBSQmo1QXZiSld6QWJBeWVYUXRDOTNUTXZZWTVwNHVGNkxUbGNNMDVoQThz?=
 =?utf-8?B?Z0h3cGdxZG04bVRiQXNQWFVBVU85cXVSYk9TSWhEMWtOYWFoUDJCazhDM0ZO?=
 =?utf-8?B?SkdZbHNON2xZODhaMmNFSFZURjBLUXdRN054VkZpWTFrbERJaS9oc1oxYVZK?=
 =?utf-8?B?QkpyZHdxcWJxTnltODB4NzJlN2c4czlzd3ZwTkg4UjQ1YWx2Z1I3RkNKQ3BL?=
 =?utf-8?B?R1VYa1g5MUlPZk9WY2R4RmFUTFk2c0FLV2FjZUxhNHgrajh1Q1hzbGhlUy9K?=
 =?utf-8?B?VmpocDIxNWZhVkxETVlKK0k5TTNzN1RqL3VWL2MwRHZkZ1JXelBrWjh6QTdo?=
 =?utf-8?B?dGlnMU5ZODg1TWRxL1RTTHcxeVVnTmRoZzhoczh0ZVNtZEJTZDdvRzRnRlJi?=
 =?utf-8?B?djFPT1hvcU5XcUxWMHB4Z29PbmlJRG04VlpiaFN4OUo3MnJPajRYWjlnc2pn?=
 =?utf-8?B?cUE2TmpDZW5iOHBoMW51OTRaYnhRT1lOZ0xYZnZGb01tVmRIclpQL25yQmtN?=
 =?utf-8?B?MnFKdlp3QWZxaXErTlNQODlCYk9YWWhFT2dkM05sbUNlalBJeUlVOWVZMFlL?=
 =?utf-8?B?eS9WZmkwTUEwb2ovOERzSkF2TlQvdFNReWtqQkR4WENoNlE4VXo0QU4yWUJs?=
 =?utf-8?B?WUo0ajhkMGpjeFFGVHptTmt1L3hKeW5EdDZGYmVoZjc1Mi9PTzBiQk1qaUJv?=
 =?utf-8?B?dkRmVkZncjlsS0pkVW4vbXV6bStPcUR6QklqRGZjOEdVSG9kK1lRRnlHMWds?=
 =?utf-8?B?TDRuejNTNkZjVEFTbmduYWVLTG9aV2dUUXc4dGNEeVpyUXF6ejNjVGU3MWdB?=
 =?utf-8?B?eEg0aURqaXJ2L1FPL1RoVEdOUmkzdGJSV2QxVGh1WlJLUzRHUlJxaUFmcW5L?=
 =?utf-8?B?dlJTaUppS2ZqL05uSXhtWEYzWUk3dlRLWDErRGNJeTloOWs3cGNEazN5RjV6?=
 =?utf-8?B?TkpRTWpOWWczWm9mckJXLzFjRXl1TlA3TlYxcVVzWXJHYjRJTUdxUkRRWFpT?=
 =?utf-8?B?MzIzSHdJcWl0bWNzQkpUczVFV0hzdEllVjY4ZkprQi83aCtOQVFNR1RkU3p6?=
 =?utf-8?B?N3RrcnhmTHBWeDVrZmZiYmdhRmhsSC9TK1JYdXdPSkorSTN4cm5rUlRIKzAv?=
 =?utf-8?Q?6MT1dJKHrEZEy0s4r/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: add1064b-e276-4f48-e8f9-08de7b6ffbf2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 11:03:23.3097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uk9LbVR5pgFDq9jI3YHevbohWxk46+qiiiGr0O4sOLcaXWuzuCp7UsWmXifai5PT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8009
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
X-Rspamd-Queue-Id: F391C21F673
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:dakr@kernel.org,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

On 3/6/26 11:37, Boris Brezillon wrote:
> On Fri, 6 Mar 2026 10:58:07 +0100
> Christian König <christian.koenig@amd.com> wrote:
> 
>> On 3/6/26 10:46, Boris Brezillon wrote:
>>> On Fri, 6 Mar 2026 09:10:52 +0100
>>> Christian König <christian.koenig@amd.com> wrote:  
>>>> Well as I wrote above you either have super reliable locking in your signaling path or you will need that for error handling.  
>>>
>>> Not really. With rust's ownership model, you can make it so only one
>>> thread gets to own the DriverFence (the signal-able fence object), and
>>> the DriverFence::signal() method consumes this object. This implies
>>> that only one path gets to signal the DriverFence, and after that it
>>> vanishes, so no one else can signal it anymore. Just to clarify, by
>>> vanishes, I mean that the signal-able view disappears, but the
>>> observable object (Fence) can stay around, so it can be monitored (and
>>> only monitored) by others. With this model, it doesn't matter that
>>> _set_error() is set under a dma_fence locked section or not, because
>>> the concurrency is addressed at a higher level.  
>>
>> That whole approach won't work. You have at least the IRQ handler which signals completion and the timeout handler which signals completion with an error.
> 
> From a pure rust standpoint, and assuming both path (IRQ handler and
> timeout handler) are written in rust, the compiler won't let you signal
> concurrently if we design the thing properly, that's what I'm trying to
> say. Just to be clear, it doesn't mean you can't have one worker (in a
> workqueue context) that can signal a fence and an IRQ handler that can
> signal the same fence. It just means that rust won't let you do that
> unless you have proper locking in place, and rust will also guarantee
> you won't be able to signal a fence that has already been signaled,
> because as soon as it's signaled, the signal-able fence should be
> consumed.

Ah got it! I've worked a lot with OCaml in the past which has some similarities, but doesn't push things that far.

>>
>> We have documented that this handling is mandatory for DMA-fences since so many driver implementations got it wrong.
> 
> Again, I'm just talking about the rust implementation we're aiming for.
> If you start mixing C and rust in the same driver, you're back to the
> original problem you described.

The key point is the Rust implementation should not repeat the mistakes we made in the C implementation.

For example blocking that multiple threads can't signal a DMA-fence is completely irrelevant.

What we need to guarantee is correct timeout handling and that DMA-fence can only signal from something delivered from a HW event, e.g. a HW interrupt or interrupt worker or similar.

A DMA-fence should *never* signal because of an IOCTL or because some object runs out of scope. E.g. when you cleanup a HW ring buffer, FW queue, etc...

Regards,
Christian.

> 
>>
>> That's why Philips patch set removed the return value from dma_fence_signal().
> 
> I don't mind that. Just saying that's hopefully a non-issue in the rust
> abstraction.

