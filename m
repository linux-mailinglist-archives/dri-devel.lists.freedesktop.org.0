Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D17A98A93
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 15:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448C210E6C1;
	Wed, 23 Apr 2025 13:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cCcyrFWO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9619C10E69C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:12:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtH+X1tocJ1YaZyGvsSw0V7kXniux7ggGhpomemXRxXsYrGaLp2rA8JMF5rgXvA3Gds5B5Za674rVu53gi3lVgDosAYUqMVJL14/kILqyefBTKi1wn2oI9S+GViFF4KlIUX4GliO5T/eRPSEUGr+2FfnGHgQSdqCWuJyveOBz8Zv7rAUefLGdYvSiryAY6iUr5xpz7Z7yrVX49sAw1ICjmYt4YjWMgV3B1mlQys7Q0tgL6RnE/d0mxm7sWypS4UOlr+t+0uYyqK7PRdpxxFAgnBl/yE9P5+kbiELWDkrlXuHv3yVaKcrk+6bzs14d8sT8apwxQEiiLujRDV+w5vaBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylYdZPRf4XurMUP/5T48XODrsLOlLoyTX57/htJRs1g=;
 b=i2Yd64qFb0I8R9EGWEyRtvDn60LXEawCXxQrqQsYnnKBbU4SyM7aqnb+r5GevGxxGEZCkeuiLXGBTCHotYxswLpNiiwqM+MuETnllQbmSyyVCHmhShnWqLN4hBxmlXJEG4CT/8KKVHQ2gyLwgxsJHw2vDJt2OhSCHVyiWA2cVg8trxqaCDLb4mFd6EUar8xrJTGuUZd50ig2sXe7Peh2VLcO3vFUxX7Ve9BE087RUWblYjzEhdzvpG/VKrJ8fwunaeCBDgLLh96QwIegFCop6yvGwg0kw2FIMdEM91cs8Iko38WDzuUUkJNw3OJD/fBlz5Rxjn53xCu2vWQByl3jgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylYdZPRf4XurMUP/5T48XODrsLOlLoyTX57/htJRs1g=;
 b=cCcyrFWODqIbWIVo3z63I/BN6n31/p6pMi1vEfWl0bwvYvHNvDABPHCn7/xh+mKW+8dyQfRAd0g0YGVF9dRkdQsUtso3oX/fRLC5JExTR98PLd1P1lkzFeGIBD6RwrXYdQURfHvqHDt9wubCa+EXS0NDdtuQ5CoXDijrYWB5NYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7953.namprd12.prod.outlook.com (2603:10b6:806:345::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.30; Wed, 23 Apr
 2025 13:12:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 13:12:32 +0000
Message-ID: <29b27ae3-de56-475d-ae85-fd593a011ea3@amd.com>
Date: Wed, 23 Apr 2025 15:12:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/4] Some (drm_sched_|dma_)fence lifetime issues
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250418164246.72426-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250418164246.72426-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: 57c5ee18-8da1-4b42-c482-08dd8268818f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDExZVFhU255STV4cmpzZ3RpeWlZWU0zdURUTmJkMHZWU1d4ZCtsamdVZDZF?=
 =?utf-8?B?VUNteGJMdjY5UFlMSkVRYmhjOHIySXAraFliVmM5djlOd1pjYnNTY0pWN3pX?=
 =?utf-8?B?Qm5TWXdDc0d2WmxnNG5PV1FKSTlpc2UxaUZWNW1keHkxd3MrWEZqMmtiM1NI?=
 =?utf-8?B?R0dnQWpaS2JaRDZVN1RGdURUSHZ1NGZIRzBVZ3hXdDM2NDB4VTFTdDR2aW5D?=
 =?utf-8?B?d3BHWkNqM1FQQkc1YzQ1c2ZweDdoTWFjN2dPSVhBUzJtaUhpSVBWMnc4akc4?=
 =?utf-8?B?cEViWXNCN2xUelVDMm8vZ25tdjdDR1ZOUG9HNWUrU1hMcFNpdzVHQ3BDWGk3?=
 =?utf-8?B?aDR5NXVYV3N5WklCTm9CdlladWZYa0UreWRheGZibXZYS2ZUNTJyZWF6UnZj?=
 =?utf-8?B?MVdBU2pqT0t2UnIwZ21EaTRQbWdFZXJOSkpZUzVkQmo2ZXBjTXZLSHYzaEVm?=
 =?utf-8?B?bXU0blRkd1VWL3oyZmppbEtCNWtLWjVmLy9kTk1KMWEyZldYeU1sd0ZEZGpT?=
 =?utf-8?B?cG5MNE5jamZJK0FFQVNEdytWY0RUMU5oN0YybFZ5V2hQVW1BeVlFUDhIMXNZ?=
 =?utf-8?B?ME9WbzVONXpqQVNFK2RHblNzZnFZeTByblJ6R0loYW9HaXhObkdvNGVBWWhK?=
 =?utf-8?B?YTltWGdCNVJjZlVGUFd6SVNCQm40UmxJdXhoVUlhdGwyZW9neVJSaTB5ZDFW?=
 =?utf-8?B?d3g3RjVTZzZ0bGNnOXdWUU1DKzc1TGJEZy9pQXlxUTNubUR0bzd2VitDSFkw?=
 =?utf-8?B?Q3NlRWQrV0p1T0J2YlU1Ti9iQkJrTEw5a25sKzg0eVNCcVZuNno3aTM0cU9X?=
 =?utf-8?B?SS9sK2RLTWtNdlFXY3FUNXN0aGtNTXpwWU1jTld2c0M5V3pqMDVqVXRsdElT?=
 =?utf-8?B?cWRSUXlGdmJnSWJXVjcxWklhbDF1S015UU1Nb0lCY3BKOUlmSUQzbTZyaldy?=
 =?utf-8?B?QkY5Z25uNEZQSGUzQWMrTVphVE5JYjJsZWdXMTJTa3RmcG9yRXBqQkV1bkx4?=
 =?utf-8?B?emdYUG9uaWhWMDJvdUJnMG55VjVVNk9YaEd1QnJiaDBoNFdzVExXbkxEQjRq?=
 =?utf-8?B?OFFESVg0QkZvT0s4eWgwbWFuWGFkLzRwS3dCMUVYMko1N1A1QVhKaTFONmo5?=
 =?utf-8?B?NFJqcWxjS1dwSi9kRENqNk5hdHg1Z1Qvb1hSYUZiTW5xOFBRYnQ4cEFKZ080?=
 =?utf-8?B?SXhiSWQ4bFY2NjlEdXVCY3BqbGxDY3QwWUFERng0RFhVZThqNldOZndBaHVp?=
 =?utf-8?B?VWlhcXUrSFlUaDlmeE9qSDRmV21rQXhob0pGU3Z6U25hTXRPbkNzYlozN1lh?=
 =?utf-8?B?SC8rUm1HMVJJUkFnMTR1UjVyVWMvcTV5azkvVGx6YkdqYlBjN1VVTitrS0ls?=
 =?utf-8?B?dzR6QWF6T1prRjRpcExYVStYUEN4R2NSTjB3YmNKZ09sUlB4d1huWnNlcGgw?=
 =?utf-8?B?UDJ2U2I4Y2V0Zm5WQkZLNmlsVldUamhNTG43aXRMY2lPbXRBZ0dIRmdyYUpi?=
 =?utf-8?B?amg5ZWp2ZHMvK1VVbUxkZFJmYmJaQ09zOFVSd1BZd0dqMlBSQnpxc0pPUDV3?=
 =?utf-8?B?dS9jSHNydkJyUmYveDk4WHo3REM5Zmc2RmNwYStIMTVXUWdQSUJHSmplcmVm?=
 =?utf-8?B?M2dYSGx1Q252bGlKWHBwdFI3WU1lUHoxOWRNQjB1a2lMT0VWTWVDdlRVd0Ez?=
 =?utf-8?B?ZHkyc0VYQ2Qyb1V5UFNza3ZGUXd0bnpRcHpyMVp3RnVtcEt4MkYzNlVVMVht?=
 =?utf-8?B?THV4YXV1ak1kRmZJL3hKY3ZqRmNHNEVzRVJZUUdsdC9lUlgrbE9wZUx2b2w0?=
 =?utf-8?Q?LOQbWWJsiPkEdnadA3rP3mY7HLC907PPQoJxU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHR6MU1aSjl2a0NGejZzbTlmZHpWZzVqTEg1UG9oSWt1V0QvMENiREVMaHB3?=
 =?utf-8?B?V3pJcW1NWWlPWFhiRHFmKzN1MzlJcVBKczZ1d0xWZ3Y0dk4rMjhzSmVLZFY3?=
 =?utf-8?B?Ly9HTVpKRmg5N0Q2c0R3S2tsYk5MZEZRZU5aV1gzWXh2TGxrbkVDYWlXb0dN?=
 =?utf-8?B?NWpjdW9IdllSek9LRlBiYzVYQTh5bTFFb1U3T2dYV042S3MveWxRNDhhSUE0?=
 =?utf-8?B?RXBUUGN3SWdUbWxPS1NRZFgvaTdBOFlVUGtKd2Z6M2R6d29uTjVKNmtnSHUy?=
 =?utf-8?B?K1BSTWxoRlBQZnQ1L3F1TE5SRkg2NythR0tFY21TYWs2S1p5QXMzRzVSdXd5?=
 =?utf-8?B?NlhRakJQOFJpNUFaYnBWTlppUVhzQy9sZGlNcEYwTnhGTEl5d21qUGJyaysz?=
 =?utf-8?B?U0ZsQzN3U1hhQ01ESXRLYVYya0JZbXNBRVVSaU4wSHFCK1JJOHdadURCRjJZ?=
 =?utf-8?B?VVB1aWJvMkEyMnUvVGtWUTNXOFFBVllkNU1hNHNBMVNvU3UxODFsdlIzU3gy?=
 =?utf-8?B?RTFTWUl6VzlDTk02NXJtYjVweXJvWmcrT1k3UDltSHlaS1Q0MDRPWEQzMDdY?=
 =?utf-8?B?aDNwTEJMRkU1WlFiVW5sOHpCVUN5azhXcVZLT1prTHUvY29lNlBDOHF3d2NF?=
 =?utf-8?B?R1M3ZWlNUER0T0NUZnM3NVMwVERhS1hnY2txQ2gxRXhGdDNHY1lBZ29VTW9n?=
 =?utf-8?B?cnlUN0FYeG9PM2FGdnBmSFFySTY3RXJhSzl2R1BVYi8zUUpnVlNHOHJqRW9U?=
 =?utf-8?B?b2JNT1A0NGlMMWl2RndXV2dZTTNoQWo1ZklacDlWbm50NEhGakZCSFE2OXN2?=
 =?utf-8?B?UFRYZThaVm1qS1dIa3RaOHZOUW5aUXFsc2Y1d3JkdXFTaEhFOU1XVWh0clJv?=
 =?utf-8?B?WWpzS05UMzVuQzhNd2huL1RqUWpOTXJtakRkOGFMcEJ3cyttSHBLTXN5dFpV?=
 =?utf-8?B?b3J1VlNxNlJEeXhaUm1IZ2dJUHM2eXA0NHlKWnA5eWNqd0hYaXRwa0RJUk5Q?=
 =?utf-8?B?UVZJU2tTVnJiVVRCcXFQQzhoMEFpN2FyWmJmNzlhUWljTGVDMlN5TkdLMWVX?=
 =?utf-8?B?QXVvUHFobEwvWmhWUnNTYzhKM1I2VkNiOFRIeFhoaDd6TWZ3QVpOcThRdVAy?=
 =?utf-8?B?NlJUN1JXb0xPd1dFeWRFUlcrNmZqYVhiM0lhbVVxZ0U2d1JJQVUvZ2ZYQi9I?=
 =?utf-8?B?L0FEVHFaenpUL0xHSitVSXltMEpHTzZTUGo2R2drZWJvTTZ2eHhNbUt6Smcw?=
 =?utf-8?B?dklGY2Z0ajdiQXBqVkdRTmMxck9Rb1JpdzJrb0NZTTVpWjRYRnhYSGI0SDY1?=
 =?utf-8?B?SmkxNytKcTM2WkVEVFZDYzFMWUg5a0lSWFh1MW9hd0VucUJjVDVpekh4VDRy?=
 =?utf-8?B?czNqN3pXa21Ra3IzRmh6QSt2d1hSR0V1NEJZN0hvM3B1S0J5OGV6RWpCVS9X?=
 =?utf-8?B?V1lHQnI2UXdmMWZQNWxhTWt3S3BWRlZTN1A5aGZ4MGhnZ0tSZ3YwNU5RdXhG?=
 =?utf-8?B?L2F5SW1JWUxEelNRRjJRMG5qWE90TWRJSTAyMFlyUFNZUmFHNnppdU51TXEx?=
 =?utf-8?B?ZUpzdzBqSDlXTkwzWjhMRFRlM05mRFdjRll5WTFxNWFMMXh3dVYvTzkxVGtB?=
 =?utf-8?B?eFpnRHNvMkhyTVNRWkcvV29sUXhvdys1MnhYSU1wMW5RazVoeHlmc3lhRFhN?=
 =?utf-8?B?bUp6N0RoNFJyNDY5TkFkQjBjTnFGMUtwbUNEVnBsN2JPY1AzSXBMOHRwZEdW?=
 =?utf-8?B?bm52VTVKUElES3JNRVpwcU5RaXZGYzliUzdtTjVOdzNiNVozSm9zaloyclE4?=
 =?utf-8?B?ajI5Szg4eDIzUjJGbmtrcUVmemllZGdwY1Qvdm5wUHArUEVhdEh6UXRSMloz?=
 =?utf-8?B?VDNsVzY0ZUtLNUJxRmNlVXJESkpVckQvempUMEpsUUQ1WU5Oa3FDK1hESGlE?=
 =?utf-8?B?Mk1SSHpheEcyc0xscmZJTEg5azlmTG4rckk1SUdzVWdJbTlqS1l0REhkTTBR?=
 =?utf-8?B?YWtVd3B1eVErSkZGY2taRnJlcVIvaEUreXZ3eEZKVE1FUmluWWdWdHFENkFo?=
 =?utf-8?B?TVRYZDFRMUgxT25LM1BnYlMxQTUzakt1RTE2b1FCOC9wdHV0NmNCOEw3cThF?=
 =?utf-8?Q?dNJFjsJcUPwyONGHaxUW+GhZd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c5ee18-8da1-4b42-c482-08dd8268818f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 13:12:32.0067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XER9YSMNaOTI9eJnXs1N1F6VOhGzGWqYIZriZXONftv1PQerXJ+xziaq7p5dVMmC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7953
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

On 4/18/25 18:42, Tvrtko Ursulin wrote:
> Hi all,
> 
> Recently I mentioned to Danilo about some fence lifetime issues so here is a
> rough series, more than anything intended to start the discussion.
> 
> Most of the problem statement can be found in the first patch but to briefly
> summarise - because sched fence can outlive the scheduler, we can trivially
> engineer an use after free with xe and possibly other drivers. All that is
> needed is to convert a syncobj into a sync file behind drivers back, and I don't
> see what the driver can do about it.


Yeah that topic again :) The problem here is that this is not a bug, it is a feature!

IIRC it was Alex who pointed that issue out on the very first fence patch set, and we already discussed what to do back then.

The problem with grabbing module references for fences is that you get trivially into circle references and so basically always preventing the module from unloading.

The decision was made to postpone this and live with the potential use after free on module unload until somebody has time to fix it. Well that was +10 years ago :)

I discussed this with Sima again last year and we came to the conclusion that the easiest way forward would be to decouple the dma_fence implementation from the driver or component issuing the fence.

I then came up with the following steps to allow this:
1. Decouple the lock used for protecting the dma_fence callback list from the caller.
2. Stop calling enable_signaling with the lock held.
3. Nuke all those kmem_cache implementations and force drivers to always allocate fences using kvmalloc().
4. Nuke the release callback (or maybe move it directly after signaling) and set fence->ops to NULL after signaling the fence.

I already send patches out for #1 and #2, but don't have enough time to actually finish the work.

If you want take a look at nuking all those kmem_cache implementations for allocating the fence memory. I think that can be completed completely separate to everything else.

Regards,
Christian.


> 
> IGT that exploits the problem:
> https://patchwork.freedesktop.org/patch/642709/?series=146211&rev=2
> 
> Different flavour of the problem space is if we had a close(drm_fd) in that test
> before the sleep. In that case we can even unload xe.ko and gpu-sched.ko for
> even more fun. Last two patches in the series close that gap.
> 
> But first two patches are just shrinking the race window. They are not proper
> fixes. This is what I want to discuss since I understand reference counting all
> the involved objects has been rejected in the past. And since the problem
> probably expands to all dma fences it certainly isn't easy.
> 
> To be clear once more - lets not focus on how this does not fix it fully - I am
> primarily trying to start the conversation.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Tvrtko Ursulin (4):
>   sync_file: Weakly paper over one use-after-free resulting race
>   dma-fence: Slightly safer dma_fence_set_deadline
>   drm/sched: Keep module reference while there are active fences
>   drm/xe: Keep module reference while there are active fences
> 
>  drivers/dma-buf/dma-fence.c             |  2 +-
>  drivers/dma-buf/sync_file.c             | 29 ++++++++++++++++++++-----
>  drivers/gpu/drm/scheduler/sched_fence.c | 12 ++++++++--
>  drivers/gpu/drm/xe/xe_hw_fence.c        | 13 ++++++++++-
>  4 files changed, 47 insertions(+), 9 deletions(-)
> 

