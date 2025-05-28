Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BB0AC62D4
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 09:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BDB10E582;
	Wed, 28 May 2025 07:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2SIOZjF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457C410E57D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 07:20:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKEr9y7ztq14dioVgnjk8ngMfJLPg3wO650pn98c7w6VH4epmHIBUqhY7YRrAUCRCEooTnRK828MM53zaLt9g7+L+u/CihMgcek5H97mprZiQ5TuxFzVavrYDI7+W/kDLgqSy1YELR1GQepcPNEyrBclCVnwb+Y07/6wL3dIYA6lkpS+Qjr8I6P0yuwrjaSIfomPtt+RVrHoUuLVbcvyz9vnBHkN6rME3myf+ggon2m9hL22485ZkGattMR3oZ21llxNkAi1s/nWiPLQvHVw61ajUoXRayeRZoQBHgDJ4YILttH/d/vGJl9neWpCAxRxHlKSWnlPZ083J5pmBIUVpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88TvapPnD3vqTlTjEab8E5IxtG5Li/I/8Q+mON8LJfQ=;
 b=nyc6ItGvGsNoIaPJeJNHDygYY6Xqt9HM444jbTU4LZN+xjJw2HuJYDC0EcMgqxpZbkUXe6bp/9w1atpeC3pHKGIOr3bsv04/D1xPyXPjHxmOsvGUi8B0lYOLnMfJyQoCeiMrT6LrVPjfw8XsunTR+2DiKtqvqqyRhKhSVrUjY/dI6jAj1gutf7W6jEGhySNRjYp9EfJURceAhfc2MTYWirKkzJNL2qkaJR2ND+Iyf1sh+6yxBCJGbxsIkBm2UrcpCz5lJZQvWGtri771bDEVqtkl7Fm790QBGZ9vA0N/+KL8QmERU6LiUG+1YASn5PAe2YdtYfqUlz1gZ9g4L0dHeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88TvapPnD3vqTlTjEab8E5IxtG5Li/I/8Q+mON8LJfQ=;
 b=2SIOZjF8ifmbqXlaUhPww1U0YZwaa01tQ/hJpjqX5RgxpPk/iBCdaMJCmd6u4LfafC+cxDg82xaDfDVLwwPl3qE0Fvf9cXKs5GVB0BoAj4AYhRfw1lpNHx5VBYtB8McUnGmrCCvErsfhLmrn0MXjDJ7ZVLaB8ZmHAGYe8ZyvmZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:222::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 28 May
 2025 07:20:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 28 May 2025
 07:20:41 +0000
Message-ID: <b20606e9-fc73-4f8c-91a7-e059a9fbce1a@amd.com>
Date: Wed, 28 May 2025 09:20:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: list_lru operation for new child memcg?
To: Dave Chinner <david@fromorbit.com>, Dave Airlie <airlied@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kasong@tencent.com,
 nphamcs@gmail.com
References: <CAPM=9tyJgHPp5N6XpauFRL1hZDLCG8L+9Gmi7RCLRaK4BN4tzA@mail.gmail.com>
 <aDTmUw-CQYuZ1THd@dread.disaster.area>
 <CAPM=9txBdeJmAhZb1XW=3m-uxPxfDdQgb=PCBvssoJkQQDAdFw@mail.gmail.com>
 <aDT-B0EqqDeqXYFh@dread.disaster.area>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aDT-B0EqqDeqXYFh@dread.disaster.area>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 75643b40-1b17-4380-089e-08dd9db8273b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEFnZFh3eTFvTFM1bDlORHgvUXBnMVhjVlhPUXBwcFArL2lHRFcvQjFKKy94?=
 =?utf-8?B?SHdSZmRxRGIwUlNOWjJsTjhUaWFQS1pRNHByOUNKcHFVMkNNV2tCdFY0d1Ja?=
 =?utf-8?B?YStYUVY0MURCem1nSXlaZDZqdFhwM1UyYzJJR0N4anh1TXV0emh6c2hESmll?=
 =?utf-8?B?WmsrUTlsZGxQTFhDMXRoeXFPbW5TQUxHanN6ZkpVdm9lTWx6Rnpmd2IySVBy?=
 =?utf-8?B?TU85ektPUDhmWUVLUXRGM3ZvcjFDYnd1eTlIZy9oaUl0NVhWenJka0lSTkxK?=
 =?utf-8?B?YzFoaHJJOFVGYVBrcTZIVWtRTlJNa2pSbm5NaUlSbVRXdzA5WWMrNWxUemEz?=
 =?utf-8?B?WjNMSGFacEhZTFdtbXo5Q2lrMmNsWFBRdUVQUGJFSEFWU3JRNzdKd2ltUit4?=
 =?utf-8?B?aUZoeGh6ejJ2dUd3MkFPbWUyNTkrazZuVGwvQkpDTFRpejV5S1RFQ3pyelp2?=
 =?utf-8?B?M0Vma1R0T0ZldFpudVBlalNlTzJpRllZTXU0QzEvYWwzSHI3S21wSXdweFdk?=
 =?utf-8?B?eHNrVGZnVldkYmhLQkhuZlRUTHhCUW51dEpBd0FVcEZKWDRVVDhrMmFGWEhr?=
 =?utf-8?B?azhHVXp0SjZQWFFNdnVIeGVpd29NMm5oaW9ySDh2ci9YTnlkSml6ZFFvY1FS?=
 =?utf-8?B?YWphTzBWbWdOUG5MQmJUUWFPd2h6OUtCL084Q2pOSUFocWllQjhySVl6cDZ6?=
 =?utf-8?B?TEk1a2NhZHpVajBQaU1OcklnUHdqRCtnejR0cTI2R04wUTVXajZIUnYyQ2kr?=
 =?utf-8?B?OXVJdEtIZlZHQzVqd0dWbjF4NHpTcjRFelR4RHU2QW00TDhWRXI2UGhOamds?=
 =?utf-8?B?OXFoMDhqcFE0SENZeXBlUTlkbU8rM2lQNW8zeTZ0VWt3dHdjVWhGc2xWL25U?=
 =?utf-8?B?UlhMM01mNkVmT29tTjlVVXBzQUpRRUxXeTNjb24rNjJ0N0plZ3BLNEI2OGhm?=
 =?utf-8?B?WDY0LzI1RlhsY3NlQXdJMXJCeWtXeGx1dUMvT3FpcWdSUXZUQ094ZzV5eC9N?=
 =?utf-8?B?TzVNTFVLTHJkTld2U05xanlCYXNNeU1JSmFFcjVubERiWGtqcnp1UmlXZCtW?=
 =?utf-8?B?amdRU25lS0pHUzJ4ZHU5NkNxbVUxL0o5RXNRRFhqZlhQc2FQQUFJcVNtT1Fr?=
 =?utf-8?B?dUIwMUJZbFRhandLa2pHT3g1M2hVQXFhZzJ6SDBRQkdNOWhrSG11OThRK1JW?=
 =?utf-8?B?Nmp1UGZaaDFXcS85L1FMUC9jU0VoR2EyY3p3eGtlcXlSRjVoUWI4Z2dUNE5M?=
 =?utf-8?B?eXI0L0ljVXpNNkJydDNzN3JHQWRXOFJJMWk3RG9yTnRvWEZTRWxRMU5QNGw1?=
 =?utf-8?B?TVExZENqdjVyUzBwVytmMk9WYlpTclJyaUR4TU5lc1pFM0JHVEdydXRSSTBQ?=
 =?utf-8?B?VzFuUzRMbUVKVjhKUThOQVZnWWVlcmdCL1pRSHFldkgzVGkyOWFxOC9FTmF5?=
 =?utf-8?B?N29kTUlwQVVFN0xpT0JjUlMwZC9pNGxYWE9KV0t2eWhBbXY4WTJWMjhmSHJX?=
 =?utf-8?B?R1JhMTV3c3BHSkIzL2sxVit4d3RWSUQzcWllRTUxYlFLYUkyZTl4T3VvWi9u?=
 =?utf-8?B?VEQ4YXUzRC96ZVB5VkV3VXR4YlNEQVZNVERFbWZNcDB5NVZiK0JvYURrVVBH?=
 =?utf-8?B?dVFxQXE3ekxzNjJ6Z3U3L0xhd3hSVnNuU3ErUEhPN3RJWFE2alVpQlQ4Rno2?=
 =?utf-8?B?NFZ0Ti9ZSDc0K2N1UmZGU1pPK0cwZ1R1akNrWjNyRld4RHp0bG1nUWhuMW1N?=
 =?utf-8?B?bkc1NHUxbjFVLzVDMExncFZqRTZUaXpJQ3poRU56S1VaajNJcmdQZTYvS1Uy?=
 =?utf-8?B?YnpEaXluTlpiMG5kUDdZTmxkK2NOT1dHdGwvUVI3NzhnRktqcGlyVVJpMk1y?=
 =?utf-8?B?R2RUdkZVVkliMkZYOHdPQklDYVBXaXhmWEJXaGlDUjlUU3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0tLc0pPY3JaejVaMysrR0pTVWI3SVlLYkdIZEhIY2JIbklxd2d4KzdOZU9Y?=
 =?utf-8?B?RkdLL2pBY09jb2NPTXVtYjN0ajAzZ3FGY0MybGEzTXJHTXZBVUhXWWYwSXhZ?=
 =?utf-8?B?WUtzNlg5VkRIWXlLa3QzL3drQ0dUNml5YnQxWFJ5NmI2NFhqWEM3ZnJYK2pJ?=
 =?utf-8?B?TXZZUEFVZm1vV3RESUcwOVhwZHZmN3MwQ3NGRFZKaUF5cEZjQnZJTTZzUjZr?=
 =?utf-8?B?SzdOcUtnQVMrTTR0dml5V1pZZ1JvZUFDMUZiTFVDeTNtVzhNanpmcG8vS3pM?=
 =?utf-8?B?aHBvQ3FuRmN1eTdSUkxKYVhZQ2RrcjBlRXFwSUw1ZXBYRG0zczdVVnJWVU9T?=
 =?utf-8?B?eXExQ1FkVVpVN3o3bFhXTnBsa2NYN0tYdFNiTDlUZ29jNGptQXI2YXFtRWdT?=
 =?utf-8?B?NUdoRU9WQUg1WXJXUzlzbzJ3K0xJWmRkM3QyT2hJS000WEJDN1ZybXlvOThX?=
 =?utf-8?B?Q1ZXdUIwMjIxUThQallYV1p2ZGZJYmc1N1hFVHJCT1F3Zk1pTUl4U09XMExG?=
 =?utf-8?B?Q1lxV2YxdWNPOGV0QUVDc3NIRDNQSVhFWmk5L243OFVtTWtzSXFkRjVjV3kx?=
 =?utf-8?B?ZzNCaDI4a0ZUMW9hUldvVzM0OWUvVit3QjRXOUVvRmVZY0FzMjlubG4rTWp0?=
 =?utf-8?B?TXBWVEtkMkl5N1o2ajlJZGRFNndLMDJCQkg4anpOVGcyenhnTW1sQTBRTTRQ?=
 =?utf-8?B?NFAyWHQzRlRWU2wvTmNVN1VUV20xK1c5NTRrSHpQUmlsbUNyczlBbmJWWEkw?=
 =?utf-8?B?RGNGKzZCdFg3U3Y3aktTQWlPM05HZFlLS3RXRm4zY21xWVhkaWhteDEydXdq?=
 =?utf-8?B?aXNBdXVKK003bmp2Tnd0b1NFTjNFMmljdnptRGN3VDYwb1VucFRacUF6YTRs?=
 =?utf-8?B?MzFZZVU4REdwVVJFTW5wM09oSXhBSDNDaVJXUnBUR3A1WVlhaFA0M2Q5bCsz?=
 =?utf-8?B?K2hPU0JOUkc0bTRXSm9wenVrVEJnQUJVNGpJMHFhdytObVY2YVVDU2tqOXBZ?=
 =?utf-8?B?Y0tMSmVBZWxsL3huNTUxNDlWZVlFWFBKMzJlNTBURmVDSGVCWjlqYVlrdWtk?=
 =?utf-8?B?dHpYemRWVEZwWFZoUVgvRURleVUzS2tPVklNNWJCR1JwbkcrOFpuU1Z4NE1H?=
 =?utf-8?B?eVFrZEhOS3k4RHZUdlkrTGNHaXo0MENTNXIyNUxINVh0V1M3RzR5aldJOXVB?=
 =?utf-8?B?aFZKaXl5dHBXdWJCOG9ZMU50cWhJSllxU2FFd3JGMDN0U1BVeVIvK1R3dG91?=
 =?utf-8?B?eHA0bjJ5RmdhWUpCNWFIQ3A4U09jSnp0K1NpRXc5MUpvLzVmT3ZCVlFadmYw?=
 =?utf-8?B?YVVuMzFqVHo2bnB5c2lkaUp3VVJpQjR0ZUtXSWVYeG94MG0weU9NY0hFaXpK?=
 =?utf-8?B?cU82QURJTENLRHJ5eXJPdVVlcHZYclIxYnBVY1Yxd3cvUC9ENmY0NGtJUUJw?=
 =?utf-8?B?SjBaMFBhYVVubDhIZ05DeFpFNHdHMXhESnlnTlFrTEpZTG4wQzBjNWV6VEhw?=
 =?utf-8?B?SEtlYjVUeHJ1U3A1b2s3OEZPN0czRVBPMkVsdS85RFNnYnAxelNHaVBET0l3?=
 =?utf-8?B?TDUvNm9mODNYaE85VjdHam9hZ3Y1b3ZsZXNmbWwvd3RLdFJLQ2dEZDM1S0lR?=
 =?utf-8?B?RFNpR3NnSjR1QTdhNkROMHhtS3B6U2tyK0s3VTJvUWduci8wYktmdW9qdXFQ?=
 =?utf-8?B?V1RIWk52TnhWcmJMOTVEVmJobU9wZS9raUZPcGxQMkx3ZzgyY0gwZnVNSG0y?=
 =?utf-8?B?Z0FiTGZ0b2VqcFdTVFYvMmhnRUtCNmJKd3QwdGtTaXk5bjRicGxDUlpMK2VT?=
 =?utf-8?B?Ykh4WHdtNy8wR3drbVkvRXpKVURCVmZPN2xaWGE0YWFpVE9RcmtoVXFscW1n?=
 =?utf-8?B?VDRsYU9PU0ZKQXhuUEQram1HakNpaE13alIwS01aTGN3c3dlVlZPVUsyaDBo?=
 =?utf-8?B?ZzdIdldhR2V2Um83M0hzd05BL1RiL3JTalM2VW1GYytNVDZOR0JRMWxKN1NZ?=
 =?utf-8?B?ODdaRkIycEZhV1FMZVo1TmJYSTFzNGgzQzBtSWl0RmQwUnpDUmJkc2wrakRP?=
 =?utf-8?B?T0ZiQjUrS2xJeUZxNmlCZmNjeG5GVVhFSEx6NzlvaHhxQ2duUVRSdHl6ejFE?=
 =?utf-8?Q?a51C3o6BlGH/FHpprtf8rQ5+i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75643b40-1b17-4380-089e-08dd9db8273b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 07:20:41.6723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VCyF2qfEakortDeU2kN7iDIr4hbgUuqeLd187j1riciPAfV4yLOSy+8iRy+P3ar7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7359
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

Hi guys,

On 5/27/25 01:49, Dave Chinner wrote: 
> I disagree - specifically ordered memcg traversal is not something
> that the list_lru implementation is currently doing, nor should it
> be doing.

I realized over night that I didn't fully explored a way of getting both advantages. And we actually don't need list_lru for that.

So here is a side question:

Is it possible to just have a per cgroup counter on how many pages a cgroup released back to a particular pool? E.g. something which is added up to the same counter on the parent when a cgroup is released.

Background is that the pages are not distinguishable from each other, e.g. they are not cache hot or cold or anything like this. So it doesn't matter which pages a cgroup has released but only how many.

If it would be possible to get such a counter then it would be like just a few lines of code to add the isolation and still get the advantage of sharing released pages between different cgroups.

Regards,
Christian.

> 
> -Dave.

