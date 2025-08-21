Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E458B2F897
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 14:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C13E10E979;
	Thu, 21 Aug 2025 12:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C2iqWvWw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2066.outbound.protection.outlook.com [40.107.100.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E438110E979
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 12:46:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9aZZpFUQygUO8O9ZymZKnMyHXBuSJmBuhcjWLunk+Nhju+tXffww/CH5VkDFURl3c5gxWOjE2Vb+WFWSkh9NBKhhNRN/mGdJkmlmp09E8WnoL/bQGrTrw/Us6/gtwatJUB9KhRajXLZhh2Gu+0QwHUlQRnOS8v6BcwX31eUyHz892QoRlVbYesW0O8wXF9+i3MOfs3Lfm7TYpPk7G8Lx2s+RXMJoClwHmP46NJlW/vB0mzI551f/ELIzI3go1RcYe7277WrSEw7qGpmqdy0AKVroH5n/kMVdV69PkuObLWiLeA0As/HuwS9xRkzOVWH6ZnX2A7/67/NwI9vOu/+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uL1JUN2sp4ZkGLIpr1vCqCfdy7uHyWj1ArHrffbpnP8=;
 b=XPoHKUeoDqvVRlVES1yG930lg2+xFzT/083HkCv62pQ4z+21HcsXSY8dHY9fNOFek3txO69OkrNjF2ajclpcxnMN7fjVoncGtu6byboNslD24PPKbc9KRSxCLWt+DTucYCeoKmu/OF05UNkbOjmaYP4D67YDyJuB3o4dcpDKHA5gUPe87Ragdi8dGxAzJMso3SxYWgF6u07C4Alx6y5YM0NwlK8yKFtTSFgQAQKUe3zvSf/NmNQNEtfsjGiniOjA0KNOAP1H34lrh32mx6RCLQe2bbvmZ0SrRGJE6UmKQrjpm3144TSBUKmt79NvUAUp45shB4OEQYxYNrqSoMiATg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uL1JUN2sp4ZkGLIpr1vCqCfdy7uHyWj1ArHrffbpnP8=;
 b=C2iqWvWw+7eZpsloW5oxBFVQabCwPX5813T1WEAMhqlhInzsctwiYl9prtJKSEfk2zaWP7wcxNNhf4+ibjR6+YRlo08zdziU7d2OqAD+yLmqIK5ooGpuxIEXvKWTsvByeIyFZ9yULkr2IvNBClICh/LbUsCcvegRNY+0y0vFaU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7176.namprd12.prod.outlook.com (2603:10b6:806:2bd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 21 Aug
 2025 12:46:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 12:46:30 +0000
Message-ID: <f055a604-ba68-4652-adee-14d5f4575ec0@amd.com>
Date: Thu, 21 Aug 2025 14:46:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-buf: add warning when dma_fence is signaled from
 IOCTL
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, simona.vetter@ffwll.ch,
 phasta@mailbox.org, airlied@gmail.com, dakr@kernel.org,
 sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20250812143402.8619-1-christian.koenig@amd.com>
 <20250812143402.8619-2-christian.koenig@amd.com>
 <125ecf34-4f9f-4310-8f87-586da9a78977@igalia.com>
 <0a381201-3a73-48e9-ad5b-550abf141022@amd.com>
 <66e1e772-da61-4422-9f50-1dfeaf92282b@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <66e1e772-da61-4422-9f50-1dfeaf92282b@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0215.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7176:EE_
X-MS-Office365-Filtering-Correlation-Id: f45f4421-e55a-44ea-a802-08dde0b0c03f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2lMaVZBYVRLTlUyeU9nT0ozQlh1TmFDb2JLeHMvbld3c0UxdEs3VXZwQTJ2?=
 =?utf-8?B?ZlJDYVlCbVhDVE1jcndEVFR5STBIM0RVTS8yc0RicFh6QkVtV1FjaVUyK2dF?=
 =?utf-8?B?cm81Ujl0QWdwNC9oZlk0REh3WkpMR3VIRUJzOTROd1lMcTZYcmpZVDk3cGNO?=
 =?utf-8?B?MUYyaWNyaUxQQVFVdEV6cjFSRmY0eUJqRXJ5ZCtxZTJKUGsyL2V6WkJnVmpG?=
 =?utf-8?B?Q1ZmUWZ3KzFCbUdpdDdmV1ZKQ2ZmcFVBRVg4Z2Iyd2RxOGt0cHNKUXhHdVp1?=
 =?utf-8?B?YmtJOHIxQTl5OGgxdHM5RmxHbzQzQlh4S2lQZlZLODRiWlJpMklnelplVm1p?=
 =?utf-8?B?aFhMdlMxODNRQ1pPaDJ2SHFJN0tJQjExNnh1b2JNUG1KODZCMnJvOEFhLzVY?=
 =?utf-8?B?RXkwaUpXL1pmS3IrS20vYytEbW9xbDM5QndjcjljajE2MEpXNi9zL2RaUWJp?=
 =?utf-8?B?dENYNzRPODZoWnBZdDZEUDYvSFFpem1PSWhYYjNQc1N4TDU3OWMvWFFoTVJG?=
 =?utf-8?B?bmR5dVRpaEpocHdJZnRZa1lHMmFWRytZa1NUTlRUb25uTUJHQ3ZjcDlyNUNy?=
 =?utf-8?B?MHlhY3Y3N1FwV24wOXpGZ1EweHFQTXhXVXdhZmVhWmpuNW1hNkJRc2E1dXN1?=
 =?utf-8?B?U3JGSk5OWk55NUFleEJNYW9UOE1PaldkclhRM1FMNStSNFBYUE12enRjektT?=
 =?utf-8?B?MXlGNEo2MGpoZ2tDK2JsY0JGNjhFdmg1WkYrYXJldFhRNUhoRmxUNnpld1hV?=
 =?utf-8?B?TitqL3lOZ0tTdTdIY0ZJQkFGdXpEVmU4UzRKQ3BwbDl2MEo0b09yZXl5L0Zl?=
 =?utf-8?B?L0w0TEloZnZpK2FoK04wemV5MnVJZWQxdnN2OU1NMzhDT3NLcjE2Y3BFUHo1?=
 =?utf-8?B?eFdUeVJXRC9hdmxoOEk4QVNyOThRSHM0THdOYjlIN2grUm5xajJuZ09qejhq?=
 =?utf-8?B?aDAxYmYrVnU4QW1TNGloRHZ5QUt2QW9JSnhhQ1BZVjBjZW02Tm93WUI5MkNY?=
 =?utf-8?B?NU5FbmF0bDlUL3NuM2FqaDBTb2xiaFNnTXVRalNjTXZtamFaNTFkWkZ3cUNm?=
 =?utf-8?B?YmJKem5OVEhUaXNFbnp5YXEvYjhjUFJBQ3hqRzZlN3lYcks3aElrczRtNmY5?=
 =?utf-8?B?RW9rQkthcGE0bVRhRUo5Z2J0MzByUE9QNENWdnB6RkJwVnREL2ZwbFNTNkdI?=
 =?utf-8?B?WkRzTndiYXUzdURNSmxTcVludGtIYmxyM1Bxd3VpRnFycE5DY1RGVkoxUXgr?=
 =?utf-8?B?bTJDc1VaN0dETHBocDFpTWJEcmJhdm8xamhpZ3ppL3paM0FwVFdBZzdZdytp?=
 =?utf-8?B?ZzRLSWNhNzd3K3BSeWZNZ1Rod083NEZDUDZFeGRFeUJiMU5JODlSOHZwNGVs?=
 =?utf-8?B?MERVa0ZDYi9INnF0NlA1Y2pqeW9sZ3I0VFFmWG9jTVpjZ011SDRaVVRBMVJQ?=
 =?utf-8?B?YkFQOHUyeWlMQjcwNG8xZEN4NThrMWd6SmtaN1ZWcmtwOUZNT2RvbzQ0bG9n?=
 =?utf-8?B?Y2VuZGRzOXFENTlLZnpkcS9RYzhjdU5DSEVzbmlsYzhrUlUrQnNsTktvRk1K?=
 =?utf-8?B?MitwNmdqTHcvWXlMWlVEdTA4N3V2ODlBdk4wajQ3RVVFWVZEei96dlJQbERW?=
 =?utf-8?B?ZjhSS1RWZEtLOFNKaEtPWnlOR0ZQL1NnU1hnM3BGa1VVVWs3NFNaM0s3UUli?=
 =?utf-8?B?Y3ZoOVhpWGpGd2laRjd2RjB6MUtjbXJReENtaUVseXhhZDM1VFM4ZjYzNWJ3?=
 =?utf-8?B?akhCZmJReWpYQWk4R0pWeVlsUWt2THozWTRseTNmS2Uvd3FZdm9kY013R09l?=
 =?utf-8?B?L00yVG1lWFRobm5NTjNydzRvQ1RWU0d2dGdINnV2OXh6VVV4V05tMkVKTWFy?=
 =?utf-8?B?VlZtcDQrSUdTODZoakIrVEhUN3E5Q1dEbFhiWHlwZkFHbXRNRGFLMlJIczZN?=
 =?utf-8?Q?9YpJh3lkq9k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejM2T0NURGxkV0Q2N1c5cC9GRTJucGF2SHh4VDVta0xzdnJURzVOZUpSNkRs?=
 =?utf-8?B?VEFUZDFFT2RwaVo2bjZSNWJMTXl3MHhZNGJ3QUV4UDJBdWtjdThDenZHN1hh?=
 =?utf-8?B?KzJDbGd2djJ3b3RuTVdGV0NMbCtxZ0RIeFJra3Qzd2NzQjRYbEpVYmo3K09M?=
 =?utf-8?B?TkxpNjE1ZmlFdW5kM2w0Q0dMNGp3Qm51WEVqK0p6Y081b29yVzk0dUZTMGxx?=
 =?utf-8?B?K2pVY3R3Y2tuM1E1TGtxTzRjeUh4ekpRVHUrTmVxTEVSaXh4aUZRVDhwbFZX?=
 =?utf-8?B?ekd4WDZMSFgyeXFVcWhJcDhQNk8wVFp5RklRc2dzK2ZxTFlMZnRMQ0tKc1BI?=
 =?utf-8?B?YnBBc0ZETm5ON2Y4amt2byt2Z29NMVg2WVRaNzBVQjN6M2RmT1YwNmFNaWMw?=
 =?utf-8?B?TzJZdVZ4c3ZqOFVvTGtrRjRzZXZrRnpjelF0Z1JHRW5TVWg1RXdNMUxYWlcx?=
 =?utf-8?B?dHhERVdicDJpV0FGWThNc3RPMkJYUkRzYUd5RmlkVnl0aTh5cGgrUTJwUjZL?=
 =?utf-8?B?bjhOSzN2dHB5eHV2VnhMeVBIK3Rad1IvWHF4YldRem54d2tDenBWcXBUZ3E0?=
 =?utf-8?B?N3M2VmdGQlVyQ1crVjhvSTNFQnJTWVkwWmFpMGZPQyt4MGVHaWEwTXRod2Nt?=
 =?utf-8?B?Slk5K3VXRXpMS3hOcFBsVU0zTTlBVGN4ME1yd0VpOFZSc20xci9CRDVxVVBx?=
 =?utf-8?B?ZzM5Z0NsUTVIVlcyemt4OWpoRXo0bytuVXJtSXpoR1Znd2s5MGFhQVg0ZTZq?=
 =?utf-8?B?ZVJsRjVTNEpXYWVHQzRFNjRUVG1TazZBUkhPYm5PVHIvbGplOHlwbXljV1pj?=
 =?utf-8?B?K2FkTnl3UXo1NXJpQzVDSU1nYWJueU9LcFhlYUFTNG80UEFPQkQxeEFldVlF?=
 =?utf-8?B?blMyYXVCa0hhYTE4SDFhT0tHdHNtb1hQd01OclZJeDNrRmRCQjM3RXFQaGc5?=
 =?utf-8?B?eTZzQTE0aWxVL1ZlaDlSNnE3MFNvb20vQnRIZ3RJeS9qNHRuNytOaVZBZnQr?=
 =?utf-8?B?aVNKMDR0MldERU8xa1p3czFSdXI0YkNybHBMMEtiRXhaY05kWEkxVHg5Tkkx?=
 =?utf-8?B?VEEzZEJEalNTMVo2aFBKMkxHUUxzNjRxYWtrWnBrbVpYdTJnWjF4ZUVUUnlP?=
 =?utf-8?B?WFdxc2l1NjcwVFZaZWU3NzRoMnBsTHp4VTIrK1JuODlrTTU1OVc1SkFLSUtI?=
 =?utf-8?B?NHlIaTExYlR5OE5qem5YUWY2eDIyT3JnZW9HZy9IN1VLSktGRzVjSzB4Z0tF?=
 =?utf-8?B?ZDhzUmlLczJibUxpMWxpUTg4a0ZYMHNEWVozcGpSdWJ4STdzczBWTCtLRVNx?=
 =?utf-8?B?ekpuK0ZTK0dGLzVVTk92TjZIVWxibW0vd1pNWnZNWTMvbGdrN0NEZGdNbzVt?=
 =?utf-8?B?ZmNYNHFtMG15RVpxZ1ROcmErbTV5OFg3MTNiVlY3bzZLdThEeFp3SmZKalVp?=
 =?utf-8?B?azFHa3NDRFBNYy9nL1poVzA4YWd3eWJQR0tvQnFiSmhSWXVhcHlJR2d2Z1RD?=
 =?utf-8?B?NEk5Z29YbjRUODlZYkpZQm5JWCtDNkg5Ykl3NjI5N3N1eE9ZY2xXZSt4cVd6?=
 =?utf-8?B?c3pkZTlRdHM2dUJGWStnT0pYeHhYaCtIOVJmTkNCS2NXaGY4Ylp2Y1l1VnRV?=
 =?utf-8?B?WkxmdmJ2dXh0Z2RzUnRIYlZQRzREY083VW9ueFlUY3h5L3oyYXZVeDNSeU1h?=
 =?utf-8?B?WDk3REdjOWN3L1NtOG5SbjFvMGFNRnR1RS9kRVQxZnJHRC9XNkpzbEUxUGpt?=
 =?utf-8?B?NG5EWWVmU2RCR3QvWWJaaTZxRVpLVFFMY2hUZnM4SUgrWWtWcHlJQXh3UzIw?=
 =?utf-8?B?YVlqZUM4OWV2YXFvRWFxcVUvV1VmL1ZNUDVTclQ0MGhudzllS2pXWldrMm8x?=
 =?utf-8?B?dkZIQ3U4VHdpbWdocXRvTGtUS1YwSm1Sc3oxRWorNWE0YTRHSnpsaFRLbXBm?=
 =?utf-8?B?ODlMMjJnbDFURU5WSGhQNTUxOGczSlVEbWlDbmhQdUF1N2NIM3MzMGR4dEha?=
 =?utf-8?B?SEJ6VmdPZVhWMCs5NU9Wa2dFNVRMUEhOOUpZanhsK2FMNndDWk1zblJFcXp1?=
 =?utf-8?B?Z3RIak5TTzVuQWxjWkRiVHNLdnNqV2RPZVF0QzJld1c5cTNpWDE5RCtQWUJu?=
 =?utf-8?Q?H8hZNq0fyZy3+wAYuwuuuEiLd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f45f4421-e55a-44ea-a802-08dde0b0c03f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 12:46:30.2966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4osr4qZL4TiOaeQLXkQLCZbIOJ/Df2xuAooxwE5DaOj9ZKNebtqXYeTrf9R0zZLs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7176
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

On 13.08.25 13:59, Tvrtko Ursulin wrote:
>> Good point. Could be that someone is using a pure kernel thread for fence signaling. Going to check for that instead of a worker.
> 
> Ok, I am curious how to do it reliably. Non-null current and PF_KTHREAD and PF_WQ_WORKER not set?

If I'm not completely mistaken (current->flags & PF_KTHREAD) should do it, but I need to double check that as well.

>>> Even the fact opportunistic signalling needs to bypass the assert makes it sound like there isn't anything fundamentally wrong with signalling from task context.
>>>
>>
>> Opportunistic signaling can happen from everywhere. But when an implementation tries to signal it from an IOCTL that is certainly invalid.
>>
>>> The first patch also feels a bit too much if it has no purpose apart from checking the new asserts would otherwise trigger.
>>
>> The sw_sync code is is only used for testing and debugging. See the Kconfig of it:
>>
>>            A sync object driver that uses a 32bit counter to coordinate
>>            synchronization.  Useful when there is no hardware primitive backing
>>            the synchronization.
>>
>>            WARNING: improper use of this can result in deadlocking kernel
>>            drivers from userspace. Intended for test and debug only.
>>
> 
> But it is adding kernel code for a questionable benefit.

The whole sw_sync is questionable to begin with.

We had that for a couple of years already until we finally realized the problem with the infinite fences.

Today it should only be used for unit testing.

> What about calling the non-asserting version instead of adding complexity? It is kernel code so should be fine.

That would give other implementations both the possibility and impression that this is ok. And that is something I would really like to avoid.

> Because even with the worker sw_sync can still create infinite fences. Worker just defeats the asserts so I do not see the value in complicating it.

Yeah, I mean completely ripping out the sw_sync would be indeed better. But that would break existing unit tests.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>>
>>>> Signed-off-by: Christian König <ckoenig@able.fritz.box>
>>>> ---
>>>>    drivers/dma-buf/dma-fence.c | 59 +++++++++++++++++++++++++++----------
>>>>    include/linux/dma-fence.h   |  9 ++++--
>>>>    2 files changed, 51 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>> index 3f78c56b58dc..2bce620eacac 100644
>>>> --- a/drivers/dma-buf/dma-fence.c
>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>> @@ -345,33 +345,23 @@ void __dma_fence_might_wait(void)
>>>>    }
>>>>    #endif
>>>>    -
>>>>    /**
>>>> - * dma_fence_signal_timestamp_locked - signal completion of a fence
>>>> + * dma_fence_signal_internal - internal signal completion of a fence
>>>>     * @fence: the fence to signal
>>>>     * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
>>>>     *
>>>> - * Signal completion for software callbacks on a fence, this will unblock
>>>> - * dma_fence_wait() calls and run all the callbacks added with
>>>> - * dma_fence_add_callback(). Can be called multiple times, but since a fence
>>>> - * can only go from the unsignaled to the signaled state and not back, it will
>>>> - * only be effective the first time. Set the timestamp provided as the fence
>>>> - * signal timestamp.
>>>> - *
>>>> - * Unlike dma_fence_signal_timestamp(), this function must be called with
>>>> - * &dma_fence.lock held.
>>>> + * Internal signal the dma_fence without error checking. Should *NEVER* be used
>>>> + * by drivers or external code directly.
>>>>     *
>>>>     * Returns 0 on success and a negative error value when @fence has been
>>>>     * signalled already.
>>>>     */
>>>> -int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>> -                      ktime_t timestamp)
>>>> +int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp)
>>>>    {
>>>>        struct dma_fence_cb *cur, *tmp;
>>>>        struct list_head cb_list;
>>>>          lockdep_assert_held(fence->lock);
>>>> -
>>>>        if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>>>                          &fence->flags)))
>>>>            return -EINVAL;
>>>> @@ -390,7 +380,46 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>>          return 0;
>>>>    }
>>>> -EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
>>>> +EXPORT_SYMBOL(dma_fence_signal_internal);
>>>> +
>>>> +/**
>>>> + * dma_fence_signal_timestamp_locked - signal completion of a fence
>>>> + * @fence: the fence to signal
>>>> + * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
>>>> + *
>>>> + * Signal completion for software callbacks on a fence, this will unblock
>>>> + * dma_fence_wait() calls and run all the callbacks added with
>>>> + * dma_fence_add_callback(). Can be called multiple times, but since a fence
>>>> + * can only go from the unsignaled to the signaled state and not back, it will
>>>> + * only be effective the first time. Set the timestamp provided as the fence
>>>> + * signal timestamp.
>>>> + *
>>>> + * Unlike dma_fence_signal_timestamp(), this function must be called with
>>>> + * &dma_fence.lock held.
>>>> + *
>>>> + * Returns 0 on success and a negative error value when @fence has been
>>>> + * signalled already.
>>>> + */
>>>> +int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>> +                      ktime_t timestamp)
>>>> +{
>>>> +    /*
>>>> +     * We have the re-occurring problem that people try to invent a
>>>> +     * DMA-fences implementation which signals fences based on an userspace
>>>> +     * IOCTL.
>>>> +     *
>>>> +     * This is well known as source of hard to track down crashes and is
>>>> +     * documented to be an invalid approach. The problem is that it seems
>>>> +     * to work during initial testing and only long term tests points out
>>>> +     * why this can never work correctly.
>>>> +     *
>>>> +     * So give at least a warning when people try to signal a fence from
>>>> +     * task context and not from interrupts or a work item. This check is
>>>> +     * certainly not perfect but better than nothing.
>>>> +     */
>>>> +    WARN_ON_ONCE(!in_interrupt() && !current_work());
>>>> +    return dma_fence_signal_internal(fence, timestamp);
>>>> +}
>>>>      /**
>>>>     * dma_fence_signal_timestamp - signal completion of a fence
>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>> index 64639e104110..8dbcd66989b8 100644
>>>> --- a/include/linux/dma-fence.h
>>>> +++ b/include/linux/dma-fence.h
>>>> @@ -369,6 +369,7 @@ int dma_fence_signal_locked(struct dma_fence *fence);
>>>>    int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
>>>>    int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>>                          ktime_t timestamp);
>>>> +int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp);
>>>>    signed long dma_fence_default_wait(struct dma_fence *fence,
>>>>                       bool intr, signed long timeout);
>>>>    int dma_fence_add_callback(struct dma_fence *fence,
>>>> @@ -422,7 +423,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>>            return true;
>>>>          if (fence->ops->signaled && fence->ops->signaled(fence)) {
>>>> -        dma_fence_signal_locked(fence);
>>>> +        dma_fence_signal_internal(fence, ktime_get());
>>>>            return true;
>>>>        }
>>>>    @@ -448,11 +449,15 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>>    static inline bool
>>>>    dma_fence_is_signaled(struct dma_fence *fence)
>>>>    {
>>>> +    unsigned long flags;
>>>> +
>>>>        if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>>            return true;
>>>>          if (fence->ops->signaled && fence->ops->signaled(fence)) {
>>>> -        dma_fence_signal(fence);
>>>> +        spin_lock_irqsave(fence->lock, flags);
>>>> +        dma_fence_signal_internal(fence, ktime_get());
>>>> +        spin_unlock_irqrestore(fence->lock, flags);
>>>>            return true;
>>>>        }
>>>>    
>>>
>>
> 

