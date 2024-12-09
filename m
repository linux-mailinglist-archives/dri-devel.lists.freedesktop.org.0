Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFAD9E9AC3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 16:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFB110E340;
	Mon,  9 Dec 2024 15:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ocR2G4cD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2079.outbound.protection.outlook.com [40.107.96.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34AF10E340;
 Mon,  9 Dec 2024 15:42:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCSZol7hGPztaqqh9+Fzk0Avh0/IgJOXxXaFwGOBdqyO5mvGoan2J91eLnetF4V9Pn8G/+t0jsI6aimqUQ4mtKZmb1P52UbFRSFxtaaNYOqymvqET7XXBeIC4tiI/R+j4kPY+Nn3zqTaS3LJShmHGPAolPkfKzKsYDvHXiYk7eddhHWChtF6OjSW1XrQQ5t2RVkyH81m+vp+cq3KEXrB2SW4jwiZuwAiBPoqcDWyNOH18tV2P/oO5R23+d1rIHWyb0MWuCUZa7cgNTj9Ps9DYZhT+UjcrIbXg9jU40/kn5n8FV9o5TqIWp2AROGm215zelCd+B0GhsSi63DaTrtPrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kztLg4yei5nceQ/Yfz738L4EcNimEvZdXSkHK//aCL4=;
 b=iSRRyNE5fv3drglmRb6IA93OkX2YDGGFeHgk+9IuAELfZ6ge9A/oKF0mvWtTZ6VPKlWUnXnAuWjBczCY449Dzya4vQnOMu4PirNO0wyiPDu6YpQdlWNTk2KX8Phj00I51Ke9Y8ZH6ZpPtuM6zZUC0W8WsALww5Um3IxplIlzvbrfel0ZxgZy2s0c0WocA+sxzDSqc5lCP/cVA/3ygUMWnH9q9JWkDimhr3qCGsp7OVoYLh75skRSoLshFBE9GpQivZDjMNt2qGifn8vXGDjC3hcIA7rASBhzhx0EdS3+qlJxIPM03XFGy5LtojeEJeO1YQpgHGfiMjvYBzJZ8eVW+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kztLg4yei5nceQ/Yfz738L4EcNimEvZdXSkHK//aCL4=;
 b=ocR2G4cDisx57+IvrhIF/i3uBdB2Ukl6KPhsXx6L4myMpN2dKrkm7FYC9hnqSsqUsDepAShEXVLBBl+rE2YtN/E2lkAOwEFMebr8TLIDxXwDWefgK4KJXrherQtdzkWDVHmDzmeTCmen0SUvwbFLh8k2BBefJr+LaMIIrZJdU5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB9476.namprd12.prod.outlook.com (2603:10b6:8:250::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 15:42:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8207.017; Mon, 9 Dec 2024
 15:42:39 +0000
Message-ID: <e4401ab1-0562-407a-a0e9-2f6e43e5ac22@amd.com>
Date: Mon, 9 Dec 2024 16:42:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/26] drm/xe/eudebug: implement userptr_vma access
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
 <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <ec42fe8b-9be0-41cc-96f4-f1869c6bb7e6@amd.com>
 <Z1cNQTvGdAUPp4Y-@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z1cNQTvGdAUPp4Y-@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: a28d1f38-9137-4904-c771-08dd18681c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzV0UEExZTVkcFEvNFlZajF6R1cwT1piT3d1NG9QY1ZKdU82OE1kclg1Vkpa?=
 =?utf-8?B?WkRCVytUT2cwdjNhTzVEL0pSY1NzRWdmQVI5eTlVaWhKL1hXUHoyWDE1cEZM?=
 =?utf-8?B?U2VGa3JQSXVoenZTSzFJVVJ2TWgxQ0xQdHJVZ2ErQ0t1NW1Ob0JHejdCdkFw?=
 =?utf-8?B?V2hiUVRmMXpDc05oVkExTHVmbTY2VmhEVFNVMWJYYnJsTWZORmhQNUU1b1I3?=
 =?utf-8?B?VnNPYU9qY01uVFNHQkxHMXdQdFRiWnZxSzM5ZE1weVlXL1FxcGNuRkNJakV2?=
 =?utf-8?B?ZU5yN1JCSk5qbUhJdnJzRGd1NjR2dzNaZ1JtdHN5cVBrNHd1cnZKdkZ1OVpu?=
 =?utf-8?B?WFFaWnI3ekNkMVcxN2wrU0FJRHFKWTJxOC9relJlc3ZqL1NhYTBFS0RFRldj?=
 =?utf-8?B?WCtPQ2dicktvZGxXUHp1RXltNW1zcFVLdTdCRWpzMGlRSFd1a2FZbFRVc0Uw?=
 =?utf-8?B?L0R2T2I4Sy9tOXF4eTB5SFJFL2FGdXFMcUtxNUZLWVQ4azBkb0gvRnZ6eldM?=
 =?utf-8?B?K0pBRnhyQWZjUVA4bzN5aFhkczRlRk9Vc3I3YVJnV3phaCtOZFhBQnRXWXJ3?=
 =?utf-8?B?c2xPZWlha1RXTUV6aEJlV1hMZGl1bUFQTUlPL3dFRGw2UFhsVDRlWEM0M2xZ?=
 =?utf-8?B?eURHNk5pR2l6b29mOXV6VG1TalA4TG1QNldWejRyTnhaSndsU1VyYzRSNTRm?=
 =?utf-8?B?MnRxdVd1UUoyQmhnMFk3QUgvVFNPMUdXdmNkL21wNDVRbnR0aC9EdHlmVDNp?=
 =?utf-8?B?amFuTllxVUNTc3c5MWlGcHVEaS9VeXl0NEpSWEFZdHFHOHF4UGhKZ0IxMUkr?=
 =?utf-8?B?S0pIeHB2VVJYWXA3dXVlU2JDZElvejd3cGVvTm5jaUhzclZWQVFrSjdLTnBy?=
 =?utf-8?B?aVgvNUpDZXMyYVpGVVo4QWVYUEtTWVNQU1pIWm9KcUZCSzFnQitWS0hNU1gw?=
 =?utf-8?B?WCs2UXNST2FEclc1MFRreDFYQ0Uvc1dVRXJqQUN2d3AxbmpGWHhhRnVrVXo5?=
 =?utf-8?B?Z1AweEN1SE9kVHd3SUMwSkRpRGVzdVV2K2Y4SUlhZW1sVzlTZlk1dEg3c0dM?=
 =?utf-8?B?TlpYUGYwQkJqNFcyK1l1R2VBYWRGMXpHdld4c2ErQURNYWFGOENoYWdCYXlN?=
 =?utf-8?B?dWZIbzQ0Y1JjN3JIaTVlYU0zT3ZmMnl1UThLS2FqckdCZnN1Y2pzQXdYeHhD?=
 =?utf-8?B?cFgwbGZZTTFrbDZlQkQ5UFVNWHRXRFhhTXJqLzk1WDNXOUVwZFEyZHczcEVz?=
 =?utf-8?B?YUJTcmVVTFFuNW5mWGlKaVZzTXdCN21VNENJdW9LUmlOMlNZY0h5dG50S2dk?=
 =?utf-8?B?Y1F5bFg1QmlEMWV0c1pWM1RwdFY1eGphNVFDM3ZCdnVRS1pLek5EQitMdnlO?=
 =?utf-8?B?ME9Wc3ZJYzZ1TVEzaTE3R3V5czFlSzNMRWNhMXgva1RwN2JYT1A2Nzl4VG1P?=
 =?utf-8?B?Yis0cWk2MzdSSTZtK1ZQL3BWTHBidUdqc3Y4eGpUQW81Q09TNGMwa2Z2a25r?=
 =?utf-8?B?MUFJR0t1UmNsT09NMTBhY3RlQWlaWFA3NVRzS3d4aUpWN2tsZjRwblZIRnFJ?=
 =?utf-8?B?U2FvbHlsc2NxZE52d1ZtbWVRekRwNUZaWTFvWVBmY3RWbUlHb3p2bTZrY3hX?=
 =?utf-8?B?Sks4eFRDRXRNTkI5a20rODJSelFLVGg1U3hOR3ZHUmVFSDB6aUJqajErdmtQ?=
 =?utf-8?B?cGhUWUFIWTRXSnJqYnFPd2VLSSswZ1p6dDE2Wk04MTRHMHhwNU1VUHFvME9N?=
 =?utf-8?B?aGRlSlo2SlArWG4wWC9IYWloaHJFekUwMVB3VnNRRUUrNTl5QTRwVnlIc0h6?=
 =?utf-8?B?cDY3UnBYOFkvT0F4eDFqZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHU5Vm9wcWtTVDBHc3QrUzQ3TVBhTFhxVXhLV1RGVG9VVjZQdFN0TlpTM1F4?=
 =?utf-8?B?andLNkwyL0FlRXVFTUUyWlE2MnhFdGEyeCsvNEhSeXNZTFNFN1l5YkpIVmx2?=
 =?utf-8?B?ZVUvUVJRVlg3Mm5PTU5qbXVPQUpJd24yOHRpemxrSnJwTE9XUTR4NnNwM1BG?=
 =?utf-8?B?QWlUYVhKTzBlcnUyRUhBNzlIUVltWE52cU9TODVKbjBJVzY0dWRnSnNaWUVT?=
 =?utf-8?B?ZWlhSXBQMjFCSzlIS0gxb1FsTllBS1pZV0hYakkxSXFadzlBMGh3MHAyQjhy?=
 =?utf-8?B?VWg0WWdXUnI3TmxXbkcwNUFvNlN3c1hkT2VNWjJzRExrZ0RuRUgyNWUyblVV?=
 =?utf-8?B?OHJXVDM1NXRWQkRaTWZmUWo1R2czTiszTXl6dlkzM3FMb3lwSUE2dDl2Yk15?=
 =?utf-8?B?R1NqdmtPb3VuYjBKOGZIU3NVRDN0SmlvblRNQmlhdjRjaHpKaVlsd2tsd05G?=
 =?utf-8?B?Q09TaEo2YXliYnRINDN6Tm1hYWFFVVcvU29WT2N5N0FHaEcrQTdNakdVbk9p?=
 =?utf-8?B?c29IcEVoTml0MDFGVXZ0dDhCS2FqcURSb0tHUjJqYUVsTTZVa1paK01hYzNE?=
 =?utf-8?B?TnY3K2JpSjVLY1NSRVhDMWVHcEhhZHNLdmsweWJqYUcwUDl0Ykk1b3dPUVhL?=
 =?utf-8?B?L0RGSmthY3B2TTN1NGVJZzBwdWVLSEIxaExvNmJDRzBPdi8ya0grUGswWllm?=
 =?utf-8?B?a3BoVmlrVU5xRGhZS211TElycXNkcmhpUWtYdHBnVG56aVBJMWNLakxHYWdk?=
 =?utf-8?B?bGl5a3ExNG02K29JVmJFMThIRzBqSVJEQXZ1dEFTeURZTHdWK3YzelBpYVVN?=
 =?utf-8?B?UGFOTHlWN0lkSGZmQVhiZFErUUtmMmx2QjluUmwyRFIvYlFtaDI3RFdhN3hW?=
 =?utf-8?B?OG10MVdDc3hxUElXTzQxenIyeDhzdC9ZWnRMRmhiQzY1emZhWWdweENwcWpS?=
 =?utf-8?B?eDd3R1NMbkpORGNnYjc4dzB6Q0NBVmw1cjJBb3dYNThuZjd0RktVL2UwbVNq?=
 =?utf-8?B?Tmt1Sis4L3EzcjVXblNBZ001R0NhVTUrT3FFNjJLSCtSK3pRb016MDJ5dFZo?=
 =?utf-8?B?eUs4VzRYSm9BVzlUMUoxenQ0V3YrQ2ZENysyMXFJNmhSZjRXbGJWK3RtNEhZ?=
 =?utf-8?B?NnVOM01sYnY3SUhZREV4Q0pXTU5SOHA5Mk5KWWw0U1hUQ3E3OEVzeXd5QlNs?=
 =?utf-8?B?U1BXZy91SWJUWEhQNENMM1IyUlZxcndKV3h0WHRaZjlBQzRweUUxU2ZDM2w2?=
 =?utf-8?B?dlZaMGtHRUNONllES0xrUTNrdHE0c044ZzNXTUdkMDVuVmxKQ1AyQkw1elJ6?=
 =?utf-8?B?bUw1enc2TXgrb215blNtMkd5Um1LY3FGREt6dHZUV3pqbG1FclZPY0cybnZj?=
 =?utf-8?B?WVo5TmRuUW9SWXFtMExSYnZ1QVRldjY3ZDRGMnFFZXRWbGh6MjlSTUlUSVAv?=
 =?utf-8?B?V1E1UTJma29tUnhnK1Y1bXdPVzlOT2ZHV1lURHhMVDdBRUJET0RPVVh5RFBx?=
 =?utf-8?B?blBieHdLR1lHWnhZSWQyQ1VjMTIvemRDOTBLTzZpbTI2MkFlTkNaYkl3ZUxM?=
 =?utf-8?B?c1BxUnFSR09idkRmWjJ0OTJnSWtyTGtBd1Q1Tlo1ZDAwYU9FUnBnUTNDMGNa?=
 =?utf-8?B?Y2FkQ3l3K2h1bUdSWUw1bmxPT2czK2Q0aERBOVpQZWRPM1hCVDNzRC8vQzBp?=
 =?utf-8?B?TjdIYkttMmJXMW04bEZDbmZyTEJwRExvOC95MnpNdlhPMENwZHl4ek9ubGxQ?=
 =?utf-8?B?UEdPbDVielU4T2pzV044Y3ZRWDNBdGNDRk9tR3g5S1V4elJ2SW9FcWd1Q3BP?=
 =?utf-8?B?b1ZuNDE5N05HQ2dDS3A1a3FWc1ZNUWV6dCtrL3VDTG9qcHZ6b1RnZXl5OGsr?=
 =?utf-8?B?TCtVb05JanN1K3RHTjRWMGxFTlpnTE1mSXhlRU9pVTA3NmlxM2V5YTZldWd1?=
 =?utf-8?B?anVvT2ZKLzhsay9aRkJVaHNvZDBJSHRxWUxRa1hNaEpNbmZZNTJrd3RxRE5q?=
 =?utf-8?B?allaT01lbzdrbU1nUzVWR21BbVEyWHJ4MnJTbjI2Zm5jbDJxNkh0YWFITlU1?=
 =?utf-8?B?WTNFazdSZjFjZERseWR2RWZqbm8xNDJGNy9INXBuZHBZOGlBa2dFTGxmcERX?=
 =?utf-8?Q?43LU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a28d1f38-9137-4904-c771-08dd18681c86
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 15:42:39.2369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IKnla4lUGnp6wOoEiCdpbpTeyDH1NwvqdfFZlZlRinLRWiBLTLN/W9rHCCVl1u2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9476
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

Am 09.12.24 um 16:31 schrieb Simona Vetter:
> On Mon, Dec 09, 2024 at 03:03:04PM +0100, Christian König wrote:
>> Am 09.12.24 um 14:33 schrieb Mika Kuoppala:
>>> From: Andrzej Hajda <andrzej.hajda@intel.com>
>>>
>>> Debugger needs to read/write program's vmas including userptr_vma.
>>> Since hmm_range_fault is used to pin userptr vmas, it is possible
>>> to map those vmas from debugger context.
>> Oh, this implementation is extremely questionable as well. Adding the LKML
>> and the MM list as well.
>>
>> First of all hmm_range_fault() does *not* pin anything!
>>
>> In other words you don't have a page reference when the function returns,
>> but rather just a sequence number you can check for modifications.
> I think it's all there, holds the invalidation lock during the critical
> access/section, drops it when reacquiring pages, retries until it works.
>
> I think the issue is more that everyone hand-rolls userptr.

Well that is part of the issue.

The general problem here is that the eudebug interface tries to simulate 
the memory accesses as they would have happened by the hardware.

What the debugger should probably do is to cleanly attach to the 
application, get the information which CPU address is mapped to which 
GPU address and then use the standard ptrace interfaces.

The whole interface re-invents a lot of functionality which is already 
there just because you don't like the idea to attach to the debugged 
application in userspace.

As far as I can see this whole idea is extremely questionable. This 
looks like re-inventing the wheel in a different color.

Regards,
Christian.

>   Probably time
> we standardize that and put it into gpuvm as an optional part, with
> consistent locking, naming (like not calling it _pin_pages when it's
> unpinnged userptr), kerneldoc and all the nice things so that we
> stop consistently getting confused by other driver's userptr code.
>
> I think that was on the plan originally as an eventual step, I guess time
> to pump that up. Matt/Thomas, thoughts?
> -Sima
>
>>> v2: pin pages vs notifier, move to vm.c (Matthew)
>>> v3: - iterate over system pages instead of DMA, fixes iommu enabled
>>>       - s/xe_uvma_access/xe_vm_uvma_access/ (Matt)
>>>
>>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v1
>>> ---
>>>    drivers/gpu/drm/xe/xe_eudebug.c |  3 ++-
>>>    drivers/gpu/drm/xe/xe_vm.c      | 47 +++++++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_vm.h      |  3 +++
>>>    3 files changed, 52 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
>>> index 9d87df75348b..e5949e4dcad8 100644
>>> --- a/drivers/gpu/drm/xe/xe_eudebug.c
>>> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
>>> @@ -3076,7 +3076,8 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset_in_vma,
>>>    		return ret;
>>>    	}
>>> -	return -EINVAL;
>>> +	return xe_vm_userptr_access(to_userptr_vma(vma), offset_in_vma,
>>> +				    buf, bytes, write);
>>>    }
>>>    static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index 0f17bc8b627b..224ff9e16941 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -3414,3 +3414,50 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>>>    	}
>>>    	kvfree(snap);
>>>    }
>>> +
>>> +int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
>>> +			 void *buf, u64 len, bool write)
>>> +{
>>> +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
>>> +	struct xe_userptr *up = &uvma->userptr;
>>> +	struct xe_res_cursor cur = {};
>>> +	int cur_len, ret = 0;
>>> +
>>> +	while (true) {
>>> +		down_read(&vm->userptr.notifier_lock);
>>> +		if (!xe_vma_userptr_check_repin(uvma))
>>> +			break;
>>> +
>>> +		spin_lock(&vm->userptr.invalidated_lock);
>>> +		list_del_init(&uvma->userptr.invalidate_link);
>>> +		spin_unlock(&vm->userptr.invalidated_lock);
>>> +
>>> +		up_read(&vm->userptr.notifier_lock);
>>> +		ret = xe_vma_userptr_pin_pages(uvma);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>> +	if (!up->sg) {
>>> +		ret = -EINVAL;
>>> +		goto out_unlock_notifier;
>>> +	}
>>> +
>>> +	for (xe_res_first_sg_system(up->sg, offset, len, &cur); cur.remaining;
>>> +	     xe_res_next(&cur, cur_len)) {
>>> +		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;
>> The interface basically creates a side channel to access userptrs in the way
>> an userspace application would do without actually going through userspace.
>>
>> That is generally not something a device driver should ever do as far as I
>> can see.
>>
>>> +
>>> +		cur_len = min(cur.size, cur.remaining);
>>> +		if (write)
>>> +			memcpy(ptr, buf, cur_len);
>>> +		else
>>> +			memcpy(buf, ptr, cur_len);
>>> +		kunmap_local(ptr);
>>> +		buf += cur_len;
>>> +	}
>>> +	ret = len;
>>> +
>>> +out_unlock_notifier:
>>> +	up_read(&vm->userptr.notifier_lock);
>> I just strongly hope that this will prevent the mapping from changing.
>>
>> Regards,
>> Christian.
>>
>>> +	return ret;
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>>> index 23adb7442881..372ad40ad67f 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.h
>>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>>> @@ -280,3 +280,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
>>>    void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
>>>    void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
>>>    void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
>>> +
>>> +int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
>>> +			 void *buf, u64 len, bool write);

