Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285068CAC43
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 12:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391F810E8FA;
	Tue, 21 May 2024 10:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uKCjrxFN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB7C10E8FA;
 Tue, 21 May 2024 10:33:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7R/BwbeLbQxlie/leXHTga0c+sTyrrgsjAAibvuwFaMFNVlY3C/FNL9mv4JPR5xy6/1ik3CZ4K65dLGOm42eE4upc/f2FdHS5mEjcq/7HJwvbEHYSsKHPnhCqo9Pxwy82swgHmrb8OLd6UYN/JDi/JO9GJWlvNk2Y0P9u4LRnnyyIJOrywVeFUnd9bcCCBjB3QybnoWU0w/NJNdLjzEVcpODtfYnn0TUTAF3/MtUf+3zzGI3aifxhxhAH/thAj67jXC+Oi/IRNfPgXnVtVkG3sSRqVUzg2i5idEaXxWXUiLViZNHs8vgq8aMeWoJD9b673RiGw3KpyTJ1mopUBgsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjwFZMQ197X6JOxWAuWtqpfNFiJr81YjNcPMvmeliMk=;
 b=g+hmadtYHPWs5xOIkOBkWGx31B/xiJpk+avHR9FTTCxCxX9a2TzwvrZKrbthrdg+srH8T9huQIOVb9V109CgwNbdPhrK19Trv6gy/Y3WqM6NUOzWZsPWfYvsUgMBu49PbsvPgPdisJZ1jvRXQmQKrxd2qhZHANXs+RBQHxI8OJeLUdsdoO5+sAMqrKerTtD2feT9dCOpbHU8cQYsFzil4cN0S0QucE2lENNL4KI0S8ADjpUL84oZTEdArbOEf/iiWrxy99r3Oj2emkKMa+ddviDxARXeCfU0Okq94GZC03SHVZciPwP6TIvYkaB51PiOyVZai7FDGrYR6awJXwNAZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjwFZMQ197X6JOxWAuWtqpfNFiJr81YjNcPMvmeliMk=;
 b=uKCjrxFNdwP08EsLZx6x/0B+pMBovUMfLsUuVzz8RFiKcGcqFqWfyK1VdXfVxjXNUxw49cOUM9XVHuZwabmLlSUeSNTwC5d8l3tbkRNbocK7kYHRCBt4kkigB3NK33rqzdWbl819u4YWzAixUQavoFEWdezsjXIynluPZOW1fnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6048.namprd12.prod.outlook.com (2603:10b6:8:9f::5) by
 SJ2PR12MB7797.namprd12.prod.outlook.com (2603:10b6:a03:4c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 10:33:22 +0000
Received: from DS7PR12MB6048.namprd12.prod.outlook.com
 ([fe80::af7d:5f4f:2139:ebd1]) by DS7PR12MB6048.namprd12.prod.outlook.com
 ([fe80::af7d:5f4f:2139:ebd1%4]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 10:33:22 +0000
Message-ID: <b0ee8466-8668-415f-80f5-b1c65dcb0950@amd.com>
Date: Tue, 21 May 2024 16:03:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: 6.10/regression/bisected commit c4cb23111103 causes sleeping
 function called from invalid context at kernel/locking/mutex.c:585
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 suravee.suthikulpanit@amd.com, jgg@nvidia.com, jroedel@suse.de,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
References: <CABXGCsN1z2gj99zSdhQWynpTXBymrqHejDfF8axxxoiZ_0g_-g@mail.gmail.com>
Content-Language: en-US
From: Vasant Hegde <vasant.hegde@amd.com>
In-Reply-To: <CABXGCsN1z2gj99zSdhQWynpTXBymrqHejDfF8axxxoiZ_0g_-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::17) To DS7PR12MB6048.namprd12.prod.outlook.com
 (2603:10b6:8:9f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6048:EE_|SJ2PR12MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: d1df44ef-ff24-4ae3-7cf1-08dc79817021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDRwaDRJdUszWktFeHR5YWtQWEUzdVZwUi9QZ04rclo1Y1M0eVQ5a2tnN2xi?=
 =?utf-8?B?NjBybEM5bzVOK1lmSnlzL3M0N0xObjdkdXVvQ2lYZE1oblFWMExTRDdyUnB1?=
 =?utf-8?B?OUZlZC81bFdNbjVzNjJWMXlrcWhtTDVEOXZKOEk3MGdmNnJmNVQ2OExEWlRi?=
 =?utf-8?B?SVFWWUw2TW5PZ3lFMlRJWTdZOTl5clRTYm9zdnFGS1NtZExBYUhSR2dMcDln?=
 =?utf-8?B?cCtMcGZoNkRGQW9vbE9waThCVnVJVStISzlUTlhPTnZmdHNkUEhsNGdxaTJP?=
 =?utf-8?B?Y0YzNkE4OFJzWDJ6c2MyYWdJand6V2V4b3dlSUhmdnAxUmVFQitKSkprblFa?=
 =?utf-8?B?YmpuZXlzQU9wSmh5Q1gvdmMra3g1SkJnNmRmcVJUQTZiVXAxYlBaRkZOTVRW?=
 =?utf-8?B?UTNCWHFpSkJMb3hJTEIrc0NlOGgxZTRkanpVVjNLcEZxRjBlVWcwdlZjSjBX?=
 =?utf-8?B?RmFoS2VKd2tYcnpHcnZObUE3VzF3enJLZko5YS9DYmp3Rjh0Q2RERmN6U3hy?=
 =?utf-8?B?cTRJejJEeHkyNW1PM3JHcTVpUTh1MlR0eTQ0d2tBZWdUVitOdFJNSjc4SDdm?=
 =?utf-8?B?WDFZeXNpb3NGQ0p5OFN6N2tBc1NwKzBjeWpWNTRoK0dWaEx5MVBjQ0tHVDNs?=
 =?utf-8?B?WlFWTGJmV1Z4eHFQSEdRV1hXQUkvM00rL0tUT010eEJtOVNFSHVPSHZIZU9Z?=
 =?utf-8?B?RmVBdUd3OWt6T3dqT1lLd0JKekdkNHZQMU95UkRmUkZ3Yk1WaW9HeFR5MVhU?=
 =?utf-8?B?OHJNaHE4YmhqNGo5WTBsb3JuZnQ5TEs3ZzZyTDFzWmFDQTBIYXMwRTBLRllF?=
 =?utf-8?B?MEE5Y1NEOE9QUGUrYVFvQm0rWjFGdlFiOC9JOFdNNEc0U2E1anNhbTNtZjI3?=
 =?utf-8?B?VDhXNU82dE4vSUIranBDWkUvSGlZL1ZPZnZpQzBBTW5BTElSVll4YlRTT2dO?=
 =?utf-8?B?dUdoVkRJTTRSREd1dXlTbWhsY1lwcWlHR3BDTjFpMC92bE1NVjZTQkEwR3NH?=
 =?utf-8?B?YjVqcFV5SWdFc2cyaytIbnVTSjBNU3RnY1dMdTR3UnRuYmdJMUNlaE9tMjJx?=
 =?utf-8?B?bFdmbFpZWXRsM1Q3WXhEQ3Q4MlBhdzBOTWR5RXUyQ1NCZzkyMGFaejQrVS9w?=
 =?utf-8?B?WWpkKzhNc01ieVJpWDdKd2MzTVlNTk5MT2xpSXg2TjlBRmRCVlFYZUxlemRP?=
 =?utf-8?B?RWFSQTR3aWptdE9FYk4xL043UFVFYkVwb0VDdU4rMmQrSUNLdVZYRzd3aDMz?=
 =?utf-8?B?MVF6UCtZSExJdi93dzBwdTIxb1FESkJTQWVpWnFBdmx6Ti9DZmlrOG5hbWRL?=
 =?utf-8?B?eXB5M1g2MUNUT3VtMitBbHdvME95NkZnYmxFVkJiTWtRdGpoa2ZDcnd4b0Zs?=
 =?utf-8?B?QUtwdHVUZHR0Vk1vbkI3bUl6UGxzcWlzUjZLWjFZci8vam5Vc3hLU1VEakdB?=
 =?utf-8?B?WUh6SCtBNW9Sam5LSklVS2FzWGFLMFBUY3Y1Tkc5enNEZkZxRUhGaWMzbXNs?=
 =?utf-8?B?YStKMVVKWndRRGRzVEw0OWpxSlNaNkxLNXJ0bjR3c2xDOWVUc3A4anNZZExR?=
 =?utf-8?B?YldLdUVMc2YzeVo1alJ2YXNseitMVzlyaDFvNUpZeU1YUDZnY0NNQi8wT2Fy?=
 =?utf-8?Q?DA5rRBG7Eev76nbmNlqMGlPlduVcwGjnGg2k7uJEl+iQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6048.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHNYZTNUMVh3ckZTNk1MaEJzYWY2QUROTkhDU0ZBMXBtVFVlVGV0cXpmajd2?=
 =?utf-8?B?cGg0RmI5UU1NRmZ2NGNJaVdPVWNuZHhrbmV1UENIYTd6bmlldnQveThRaUFU?=
 =?utf-8?B?T3IzSTNQRUw2b0RRajVDNStuNGh3REJSWVgvMmNOQUxOUTBqbk0vaHBrMnhM?=
 =?utf-8?B?OTd0b1U0dnloT1VoeHY2LytOUjFEZXFPTmRwQWJzeTFHekR2UFI4ZDhwZW10?=
 =?utf-8?B?QXdDTjlWQVNHNHNaQUJIV1BsSXVJdUhrSUpKZy9RNlFqVHdQc2VhTUlieXBZ?=
 =?utf-8?B?RVllR1hZdXZndzZUOXJaOFFlVGplUEtzSXVRMVpQQmRTSFRhSSswVWIvM3ZX?=
 =?utf-8?B?cyt0cHNpSVlQSjNuRUViaUZQSWtKY1RUQ0c2OVc1M2ZMSUJENFVUQ1dRWGhW?=
 =?utf-8?B?OVdLbWZ1UE5sbmJyVzZyNDg3WVRDL1FVcjRIa2ZTYmNwcXlqY1V3TTFCLzk4?=
 =?utf-8?B?RklLZHIwdEdaVDNiak03b1JXZXRPdjBjZGZ2N1ZtbE9SU3BoaXNmTlZjcUZi?=
 =?utf-8?B?L2w3ck9nMTZTSGVuYnpNSGViT040MkNwVmwzb2lBb1lya1FEdTJCYWJMakIr?=
 =?utf-8?B?VWp0d3Y1R0Z3YXFCSEx0WEwzbVMrbkFtZkpPM084Y1FnRGZlcjhtZzdock5Y?=
 =?utf-8?B?ZXBGeVBYVmxMZEovK0FHeFprWU5JbnFzMUd5Ykhub0dRdjl6OTBDZHRmRDB2?=
 =?utf-8?B?d0xSS3FDcVNvTWFSdE5xUFpJeE9NRWhWelNIZ2hkVlgvclEwVnBKMGNBZGZD?=
 =?utf-8?B?akZUcy9kM3NLdWNDSnVROXlQbHJZNmVNWDFKM3NXZU5EaThKQzkyV2NYYUxX?=
 =?utf-8?B?eGdjZ1YyYTJ5bDBEOGZVSWwwS0k4OXlZVjF0NzI1YTQ2dysrNVlSTzhwWkwv?=
 =?utf-8?B?SGV2Y2JxdzFhQmdjdzk1dEdOVTV3VTBqK1ZESlYrWnliRjhET1cyNTF0Zldy?=
 =?utf-8?B?UkJ1c0l2bHdBQTY2ZllHS0Vnd2YraVRCdi9jc2tDYjNucjNEa3c2WUVPOUtw?=
 =?utf-8?B?dUlwUzk3WlIwQ3RRNDV6VzQwcGxiME5ldkJqNWliVkIyeVgzWG1xYy8zcXd6?=
 =?utf-8?B?TVpYTXl5UkloVHVta09OZlREbXRxNDVJSU1pREJBa2RBRGdSQWZUb0JBSDVx?=
 =?utf-8?B?R1ZXTGhVYU1CY2o2SWNnRVlQdUhseDVuMzlDcTRCU2c3Z3dRNXM0bkVQaFBO?=
 =?utf-8?B?RkRNU1FzMDFUYzdUaGVPbzhMbFNneExPWXA1U1lkRHpEbGNlUjBzL08xT2RL?=
 =?utf-8?B?azliUlNDYXIwTlJsYjVKQUJQTXJZRWNhTHJjci9TYWU2ZXM2VmRMOUFyTDVO?=
 =?utf-8?B?bWRSYlVqaHQ0V2VTbjYxZ0tCWFR4aVkvaVIxVmR1Um1Za1I4dVV5Tm5qd1hq?=
 =?utf-8?B?VGJTME10NG9YNnpUSGRzVjhUVXlJY29GSm1SYkR0ZW80OCszd2pERG9OaTNw?=
 =?utf-8?B?ZVQ0YklNSExNYVlUN1JRZWJhMnJmRFJ6aWpoZVAxL3JUZEdlbjdTVEoxNGE0?=
 =?utf-8?B?U0JaQXFnVUNYWVBoUjNQZlRNVDA2aVVPT1VIQW9qWGlRUFdGbVBQUXJQVnZq?=
 =?utf-8?B?SW5yUkhyR3J6bXB0eG8wSGpzTEhOOWFaTGluM3BuVmFnZDYvbTRpMHIzT29n?=
 =?utf-8?B?KzVHbDdEK2UrS2RlS2FvL0FtdUZTUHlHNWhFR1RGcmErSEpuSU9qa0NiMTJJ?=
 =?utf-8?B?STNTSGI0N3RBdzhVd3NSSFk3SExjbzg2a282RnN6NlVsN0NiR01YZnk4cnB6?=
 =?utf-8?B?Y2J6Z0NtVmxKWDZVeENUS05nYy96MUIyemtzODh4dEN3NXl2aWh0WG10VCtx?=
 =?utf-8?B?OTNHZmtqU1FGaWh5MzdtOVQyOUhYVDFKaDlvK08zT01Pc2FJZTkzbk1aeVRk?=
 =?utf-8?B?WDRVMm5MWHFZVWQyS2prL2FlcXRyT3Y4ZnRJcGdkeWZCSWJONUk3cXA4bXM3?=
 =?utf-8?B?WnA2SzRiSEtTcURvNTdWTXo2QzJ0UjdWMEJ6am8vaWdQcHBzM3Qybm1kTnQw?=
 =?utf-8?B?V0JwVm11Z3JvSDlPRnRQMWw4VmdRcFdEblpJdUp5YVpRWFRwQVJXSU4rYzhK?=
 =?utf-8?B?Vkp6Q2Uwd08vdE1wWHlsdWNLNlJCREhoY2tKbjF6UERTYUt5M0ZqRjZIM21j?=
 =?utf-8?Q?BdTkvyRA97ZplxaMxtRmSHk51?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1df44ef-ff24-4ae3-7cf1-08dc79817021
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6048.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 10:33:22.2258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcPr3pzTsPzstrGKMPXqjDuCP9d5yonqlrxy3d6R770edKDJk5vQ7BXqOCTdcI9TnRGAiQ4EPP0mIm2B9beMVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7797
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

Hi Mikhail,

Thanks for the report. I will look into it this week and get back to you.

-Vasant


On 5/21/2024 3:09 PM, Mikhail Gavrilov wrote:
> Hi,
> Yesterday on the fresh kernel snapshot
> I spotted a new bug message with follow stacktrace:
> [    4.307097] BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:585
> [    4.307135] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid:
> 1, name: swapper/0
> [    4.307150] preempt_count: 3, expected: 0
> [    4.307159] RCU nest depth: 0, expected: 0
> [    4.307168] 4 locks held by swapper/0/1:
> [    4.307176]  #0: ffff8881080ba920 (&group->mutex){+.+.}-{3:3}, at:
> bus_iommu_probe+0xf6/0x4c0
> [    4.307203]  #1: ffff88811654c1b8 (&domain->lock){....}-{2:2}, at:
> amd_iommu_attach_device+0x1ad/0x1e80
> [    4.307227]  #2: ffff888113518c18 (&dev_data->lock){....}-{2:2},
> at: amd_iommu_attach_device+0x213/0x1e80
> [    4.307243]  #3: ffff888108393030 (&iommu->lock){....}-{2:2}, at:
> amd_iommu_iopf_add_device+0x69/0x140
> [    4.307243] irq event stamp: 1021718
> [    4.307243] hardirqs last  enabled at (1021717):
> [<ffffffff9cc35f2e>] kasan_quarantine_put+0x12e/0x250
> [    4.307243] hardirqs last disabled at (1021718):
> [<ffffffff9f46895c>] _raw_spin_lock_irqsave+0x7c/0xa0
> [    4.307243] softirqs last  enabled at (1020154):
> [<ffffffff9c2721fb>] __irq_exit_rcu+0xbb/0x1c0
> [    4.307243] softirqs last disabled at (1020147):
> [<ffffffff9c2721fb>] __irq_exit_rcu+0xbb/0x1c0
> [    4.307243] Preemption disabled at:
> [    4.307243] [<0000000000000000>] 0x0
> [    4.307243] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.10.0-0.rc0.20240520giteb6a9339efeb.9.fc41.x86_64+debug #1
> [    4.307243] Hardware name: ASUS System Product Name/ROG STRIX
> B650E-I GAMING WIFI, BIOS 2611 04/07/2024
> [    4.307243] Call Trace:
> [    4.307243]  <TASK>
> [    4.307243]  dump_stack_lvl+0x84/0xd0
> [    4.307243]  __might_resched.cold+0x1f7/0x23d
> [    4.307243]  ? __pfx___might_resched+0x10/0x10
> [    4.307243]  __mutex_lock+0xf3/0x13f0
> [    4.307243]  ? iopf_queue_add_device+0xd2/0x5d0
> [    4.307243]  ? __pfx___mutex_lock+0x10/0x10
> [    4.307243]  ? find_held_lock+0x34/0x120
> [    4.307243]  ? __pfx_lock_acquired+0x10/0x10
> [    4.307243]  ? iopf_queue_add_device+0xd2/0x5d0
> [    4.307243]  iopf_queue_add_device+0xd2/0x5d0
> [    4.307243]  amd_iommu_iopf_add_device+0xcd/0x140
> [    4.307243]  amd_iommu_attach_device+0xdc8/0x1e80
> [    4.307243]  ? iommu_create_device_direct_mappings+0x571/0x7d0
> [    4.307243]  __iommu_attach_device+0x64/0x250
> [    4.307243]  __iommu_device_set_domain+0x122/0x1c0
> [    4.307243]  __iommu_group_set_domain_internal+0xfa/0x2d0
> [    4.307243]  iommu_setup_default_domain+0x918/0xcd0
> [    4.307243]  bus_iommu_probe+0x1ad/0x4c0
> [    4.307243]  ? __pfx_bus_iommu_probe+0x10/0x10
> [    4.307243]  iommu_device_register+0x184/0x230
> [    4.307243]  ? amd_iommu_iopf_init+0xfd/0x170
> [    4.307243]  iommu_go_to_state+0xf87/0x3890
> [    4.307243]  ? __pfx_iommu_go_to_state+0x10/0x10
> [    4.307243]  ? lockdep_hardirqs_on+0x7c/0x100
> [    4.307243]  ? _raw_spin_unlock_irqrestore+0x4f/0x80
> [    4.307243]  ? add_device_randomness+0xb8/0xf0
> [    4.307243]  ? __pfx_add_device_randomness+0x10/0x10
> [    4.307243]  ? __pfx_pci_iommu_init+0x10/0x10
> [    4.307243]  amd_iommu_init+0x21/0x60
> [    4.307243]  ? __pfx_pci_iommu_init+0x10/0x10
> [    4.307243]  pci_iommu_init+0x38/0x60
> [    4.307243]  do_one_initcall+0xd6/0x460
> [    4.307243]  ? __pfx_do_one_initcall+0x10/0x10
> [    4.307243]  ? kernel_init_freeable+0x4cb/0x750
> [    4.307243]  ? kasan_unpoison+0x44/0x70
> [    4.307243]  kernel_init_freeable+0x6b4/0x750
> [    4.307243]  ? __pfx_kernel_init_freeable+0x10/0x10
> [    4.307243]  ? __pfx_kernel_init+0x10/0x10
> [    4.307243]  ? __pfx_kernel_init+0x10/0x10
> [    4.307243]  kernel_init+0x1c/0x150
> [    4.307243]  ? __pfx_kernel_init+0x10/0x10
> [    4.307243]  ret_from_fork+0x31/0x70
> [    4.307243]  ? __pfx_kernel_init+0x10/0x10
> [    4.307243]  ret_from_fork_asm+0x1a/0x30
> [    4.307243]  </TASK>
> 
> [    4.307243] =============================
> [    4.307243] [ BUG: Invalid wait context ]
> [    4.307243] 6.10.0-0.rc0.20240520giteb6a9339efeb.9.fc41.x86_64+debug
> #1 Tainted: G        W         -------  ---
> [    4.307243] -----------------------------
> [    4.307243] swapper/0/1 is trying to lock:
> [    4.307243] ffff88810de2fa88 (&queue->lock){....}-{3:3}, at:
> iopf_queue_add_device+0xd2/0x5d0
> [    4.307243] other info that might help us debug this:
> [    4.307243] context-{4:4}
> [    4.307243] 4 locks held by swapper/0/1:
> [    4.307243]  #0: ffff8881080ba920 (&group->mutex){+.+.}-{3:3}, at:
> bus_iommu_probe+0xf6/0x4c0
> [    4.307243]  #1: ffff88811654c1b8 (&domain->lock){....}-{2:2}, at:
> amd_iommu_attach_device+0x1ad/0x1e80
> [    4.307243]  #2: ffff888113518c18 (&dev_data->lock){....}-{2:2},
> at: amd_iommu_attach_device+0x213/0x1e80
> [    4.307243]  #3: ffff888108393030 (&iommu->lock){....}-{2:2}, at:
> amd_iommu_iopf_add_device+0x69/0x140
> [    4.307243] stack backtrace:
> [    4.307243] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W
>   -------  ---
> 6.10.0-0.rc0.20240520giteb6a9339efeb.9.fc41.x86_64+debug #1
> [    4.307243] Hardware name: ASUS System Product Name/ROG STRIX
> B650E-I GAMING WIFI, BIOS 2611 04/07/2024
> [    4.307243] Call Trace:
> [    4.307243]  <TASK>
> [    4.307243]  dump_stack_lvl+0x84/0xd0
> [    4.307243]  __lock_acquire.cold+0x1fe/0x2a0
> [    4.307243]  ? __pfx___lock_acquire+0x10/0x10
> [    4.307243]  ? ret_from_fork_asm+0x1a/0x30
> [    4.307243]  lock_acquire+0x1ae/0x540
> [    4.307243]  ? iopf_queue_add_device+0xd2/0x5d0
> [    4.307243]  ? __pfx_lock_acquire+0x10/0x10
> [    4.307243]  ? __printk_cpu_sync_put+0x35/0x60
> [    4.307243]  ? add_taint+0x2a/0x70
> [    4.307243]  ? __might_resched.cold+0x203/0x23d
> [    4.307243]  ? __pfx___might_resched+0x10/0x10
> [    4.307243]  __mutex_lock+0x189/0x13f0
> [    4.307243]  ? iopf_queue_add_device+0xd2/0x5d0
> [    4.307243]  ? iopf_queue_add_device+0xd2/0x5d0
> [    4.307243]  ? __pfx___mutex_lock+0x10/0x10
> [    4.307243]  ? find_held_lock+0x34/0x120
> [    4.307243]  ? __pfx_lock_acquired+0x10/0x10
> [    4.307243]  ? iopf_queue_add_device+0xd2/0x5d0
> [    4.307243]  iopf_queue_add_device+0xd2/0x5d0
> [    4.307243]  amd_iommu_iopf_add_device+0xcd/0x140
> [    4.307243]  amd_iommu_attach_device+0xdc8/0x1e80
> [    4.307243]  ? iommu_create_device_direct_mappings+0x571/0x7d0
> [    4.307243]  __iommu_attach_device+0x64/0x250
> [    4.307243]  __iommu_device_set_domain+0x122/0x1c0
> [    4.307243]  __iommu_group_set_domain_internal+0xfa/0x2d0
> [    4.307243]  iommu_setup_default_domain+0x918/0xcd0
> [    4.307243]  bus_iommu_probe+0x1ad/0x4c0
> [    4.307243]  ? __pfx_bus_iommu_probe+0x10/0x10
> [    4.307243]  iommu_device_register+0x184/0x230
> [    4.307243]  ? amd_iommu_iopf_init+0xfd/0x170
> [    4.307243]  iommu_go_to_state+0xf87/0x3890
> [    4.307243]  ? __pfx_iommu_go_to_state+0x10/0x10
> [    4.307243]  ? lockdep_hardirqs_on+0x7c/0x100
> [    4.307243]  ? _raw_spin_unlock_irqrestore+0x4f/0x80
> [    4.307243]  ? add_device_randomness+0xb8/0xf0
> [    4.307243]  ? __pfx_add_device_randomness+0x10/0x10
> [    4.307243]  ? __pfx_pci_iommu_init+0x10/0x10
> [    4.307243]  amd_iommu_init+0x21/0x60
> [    4.307243]  ? __pfx_pci_iommu_init+0x10/0x10
> [    4.307243]  pci_iommu_init+0x38/0x60
> [    4.307243]  do_one_initcall+0xd6/0x460
> [    4.307243]  ? __pfx_do_one_initcall+0x10/0x10
> [    4.307243]  ? kernel_init_freeable+0x4cb/0x750
> [    4.307243]  ? kasan_unpoison+0x44/0x70
> [    4.307243]  kernel_init_freeable+0x6b4/0x750
> [    4.307243]  ? __pfx_kernel_init_freeable+0x10/0x10
> [    4.307243]  ? __pfx_kernel_init+0x10/0x10
> [    4.307243]  ? __pfx_kernel_init+0x10/0x10
> [    4.307243]  kernel_init+0x1c/0x150
> [    4.307243]  ? __pfx_kernel_init+0x10/0x10
> [    4.307243]  ret_from_fork+0x31/0x70
> [    4.307243]  ? __pfx_kernel_init+0x10/0x10
> [    4.307243]  ret_from_fork_asm+0x1a/0x30
> [    4.307243]  </TASK>
> [    4.311628] AMD-Vi: Extended features (0x246577efa2254afa, 0x0):
> PPR NX GT [5] IA GA PC GA_vAPIC
> [    4.311639] AMD-Vi: Interrupt remapping enabled
> [    4.366191] AMD-Vi: Virtual APIC enabled
> 
> Bisect pointed to commit:
> commit c4cb23111103a841c2df30058597398443bcad5f (HEAD)
> Author: Vasant Hegde <vasant.hegde@amd.com>
> Date:   Thu Apr 18 10:33:57 2024 +0000
> 
>     iommu/amd: Add support for enable/disable IOPF
> 
>     Return success from enable_feature(IOPF) path as this interface is going
>     away. Instead we will enable/disable IOPF support in attach/detach device
>     path.
> 
>     In attach device path, if device is capable of PRI, then we will add it to
>     per IOMMU IOPF queue and enable PPR support in IOMMU. Also it will
>     attach device to domain even if it fails to enable PRI or add device to
>     IOPF queue as device can continue to work without PRI support.
> 
>     In detach device patch it follows following sequence:
>       - Flush the queue for the given device
>       - Disable PPR support in DTE[devid]
>       - Remove device from IOPF queue
>       - Disable device PRI
> 
>     Also add IOMMU_IOPF as dependency to AMD_IOMMU driver.
> 
>     Co-developed-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
>     Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
>     Signed-off-by: Vasant Hegde <vasant.hegde@amd.com>
>     Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>     Link: https://lore.kernel.org/r/20240418103400.6229-13-vasant.hegde@amd.com
>     Signed-off-by: Joerg Roedel <jroedel@suse.de>
> 
>  drivers/iommu/amd/Kconfig     |  1 +
>  drivers/iommu/amd/amd_iommu.h |  4 ++++
>  drivers/iommu/amd/iommu.c     | 39 +++++++++++++++++++++++++++++++--------
>  drivers/iommu/amd/ppr.c       | 41 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 77 insertions(+), 8 deletions(-)
> 
> 
> Unfortunately I can't check revert c4cb23111103 due to conflicts:
>> git revert -n c4cb23111103a841c2df30058597398443bcad5f
> Auto-merging drivers/iommu/amd/Kconfig
> CONFLICT (content): Merge conflict in drivers/iommu/amd/Kconfig
> Auto-merging drivers/iommu/amd/amd_iommu.h
> Auto-merging drivers/iommu/amd/iommu.c
> CONFLICT (content): Merge conflict in drivers/iommu/amd/iommu.c
> Auto-merging drivers/iommu/amd/ppr.c
> error: could not revert c4cb23111103... iommu/amd: Add support for
> enable/disable IOPF
> 
> 
> I also attach below a full kernel log and build config.
> 
> My hardware specs: https://linux-hardware.org/?probe=ca80d0a307
> 
> Vasant or anyone else from the AMD team can you look please.
> 
