Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBCAB24813
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 13:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358B710E03F;
	Wed, 13 Aug 2025 11:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pA06+ZRo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFDE10E03F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 11:11:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2c/hp2UfCFFSuowYUEYL/UMCUX0NnsRxP+bFXvqe7QHxruNw2XdKWroxOdyOlqRuqpRo1gGtBuY9mA66zbmeQL0KbBBeABQNatP1Ksm6JjkoIElzS+iOZxxXGeQzuC+6qeXdNVBxshqNT773W9xypkMzBo2w4zB3FZHAT8aC6T+EZI4GWMiHfgoTOcmVJYyPODlMak6N4nuxSpWIiXaDkLv+hNKULllXTEdidcnIYUKJMdtlLOm2skdkIvz9TYKrs85jpZn/Tw2YVbi2nIYXLJ1S4j1u7CSo3Zu0n1Gg9PUN50BYl9DFMSSXMvud6WjF2c2d/afb0YUv1lmrkNKqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqdbBcwnFW9vAq0oHSaGGP33usj1jvwqLMZUGThB4wU=;
 b=PylGLkvO2qJ+lp1KeaSjpySCiuOjp7aC8yjfMTLi6kgnVFYX0wEUz52V42G3zZeutxuofcz3mE78AXztREGwA2vpHuuQO+xr39iXpii1eaSB3uTowucrDxcZSK43Iy7NNiYBtnzoAImrrPoatT0jFWHhb8AZvuyoTNOVPWtm7kKe4b7gIUB7lZUD+YSMZZgVHy84fDiqYJZoyZHAqyQul0J9tjzpifF3L97y20BN3nXk7d4alHxgyvd0fUcySU5dxRX+pwv8/xdP/cPU0YxmuwrtjkfCsOYrRr2ODvQowSIQk0MAeCWPXVsnQAAF3FAMabaYrn/S38Grr3uMJbCH1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqdbBcwnFW9vAq0oHSaGGP33usj1jvwqLMZUGThB4wU=;
 b=pA06+ZRol/Z753W9IB/lP7L8ZThF0ZuqRMTPhpykAs9VqhriMhNBmFHe4BWD7LNQQNXJE2b8lPBJ/rPuzEtboEFkjk7cZK2Fe5BZcD4+muz1b/c8DtRtdMn0gB3/YH/Xj0Ay+raeMdiDCWKDUXCWwAaxKaCzeeOCO0Q8MbiSYok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7285.namprd12.prod.outlook.com (2603:10b6:303:22e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Wed, 13 Aug
 2025 11:11:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 11:11:06 +0000
Message-ID: <0a381201-3a73-48e9-ad5b-550abf141022@amd.com>
Date: Wed, 13 Aug 2025 13:10:59 +0200
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
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <125ecf34-4f9f-4310-8f87-586da9a78977@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR06CA0008.namprd06.prod.outlook.com
 (2603:10b6:208:23d::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: d15ff140-de38-4cc1-cbfe-08ddda5a1984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0JCc0dVUzI2Mjh5MVpCc3lqenRuaThLMHExTWJyWE5COHZjNnc3Q1duS0ZS?=
 =?utf-8?B?THgwOGdUWXkzaGNmTkN0UUFXS25SS0UzdmI4dWN2Qjg0SXRKREJPdDBWOVky?=
 =?utf-8?B?OHZSYzE2VzN4cDgzckt3Q3FTd2MyUmV4Q0ZodTYxS2E3aGo0cndnNGFadm42?=
 =?utf-8?B?ZWhXVk5CL3FrREJNRldXRVJDQkdxOE0xVmJXK0dUdXIzQWUxbnFhcklRYUov?=
 =?utf-8?B?YkRaUG5SeUYzZ1MyaFY4U1B5dDRTU0NlditpSGl1RHNUbjZkQnBHNTQzYUtk?=
 =?utf-8?B?dU9ZVVN3RWpoSlN6Z3ljbHR2eGN2NXRXUk0wRzJISTh4b0Q1bTl6K2xPdjFr?=
 =?utf-8?B?RlJldThWbTZNZnlBZ0tzNm1Tc285Q0lJS1MwdW5rQ1dPenJud3V1bHlnQzBR?=
 =?utf-8?B?SXhzVFdROXpmaUtDN2MyeXppdEYvdGtsU0tuSWhaMnduODJzeHRYVVpPSHZL?=
 =?utf-8?B?dWhweUErdlFVaGVoUUlmSTRrdkRDQnFNNS9DNW1JbTRFNWhsQSsyWklvQi8r?=
 =?utf-8?B?Si9KMCtSYThBTmE2bTNOT05HOU1sTjRoYUhjcnFDSExSMUdVa2IwRUhuQ21u?=
 =?utf-8?B?SWVOWHF6cTV1Q0hwMkEwUk0xL2pTN0duNGdJSDN5NHlCVEk3WGFKbmtlNExt?=
 =?utf-8?B?YU9OYWpVQitINXRyUUNldXI1cElWbDV3TXpwYjlDU2grZHdvTnlWeWlxS3Vz?=
 =?utf-8?B?R09sNzB2a2ZHbFF6RGFhVG1kKzlPZCtONnJxcVMyczE5YW00MGJuejFqVzRZ?=
 =?utf-8?B?WGpFVUhLY3kzbmFieXo5OWkzL29mYzJwODdqRFN3NHhodkx2YmpWRnFuN0pP?=
 =?utf-8?B?UHNObUZ6NlBHRGdhUmJUVVRycWM5amU3VlZhNmZCWm1GUXdGQklQUmU5ZFlt?=
 =?utf-8?B?K2JHb1lITU1tQWQ5U3JoQVl1Vit2U0tQSnZBU3AvVDJ2aExjMzhTaE5Ld1Rl?=
 =?utf-8?B?NitQOWdjR0NVNllyQnJlQmFvRk5XZXk4UzBoSldWT0xJcmd4dWIvR1JMcGx0?=
 =?utf-8?B?S3JpRW9XbGJLcmI4NWpKS3hQcVRVdFlKdDlBMVRqL1lTSUhCa25BWUhXTXdW?=
 =?utf-8?B?ME41WVh5MUJmTmlHMHNaRFo2YjJqOFRUNnZDSEFjSnVWNmEzV013MWJEdHMx?=
 =?utf-8?B?SnlieHRqZG1TZHlFRGpCTk9LQ0NuSHZYSmFiOVpxTUxwaVk2NzBUWFNZd1hR?=
 =?utf-8?B?QlJlamxob1gvK2VlL0pUOHVIMUFYdG5HRDJ1ZkJ0OUUrYkpVSUJ5cnJXb2Nl?=
 =?utf-8?B?OHM1QnFibldDNER5OXY3UmkzZTg0b09lTVN6Y0hIVG5PTlUyZzFPT0JCd1c4?=
 =?utf-8?B?aUlEZHcwbGUyVHNUTHBPVGlRc1g3WGNSUEhraVNoM0p0M3huR2Z5amZqS0J2?=
 =?utf-8?B?ZkRMM3cwMElNYlNwbmY1QitkOXBTRmhmOFFaTnZaRk1pSzU5Wjg0M1RGaEFa?=
 =?utf-8?B?OGgzSGZ5K1B4THFXZDY2QWQyL1E5SGluTTFqdWQrVFlpS2k1bjJNT2tBem1o?=
 =?utf-8?B?c2N5amVzM3U0NlRLOUJ1cnhvNXlBQW9ad1ZBMFpoRmtzL3YydllNSTFjak1a?=
 =?utf-8?B?dlRGV1FlSGwwWmJzZ25QU1IxYXNKQVEvWEZMTlNkR3MzZ3VZV1lubGFSWTA4?=
 =?utf-8?B?aktZS24zV1ZleFZGVndNd3pzYVBSSklpSE5UbEs3dUkvU0JjN0JYVGZoOHln?=
 =?utf-8?B?aWZsZVJPUitKQk1pTkpDU2QrZC9kb3MyNFQzbGQyK0dTdDdwRTVCMFdGenc2?=
 =?utf-8?B?Y3JzM3FIZEZpeXdDOU5NeThkSElPSkV5OUhLS05BbWJtWnNFa0haU2dHSXVo?=
 =?utf-8?B?VVVZNUZBdjcvOE1jUWZVTVYzelZsZkcwMlZSakhWeDFrM0cxR1Yyd3FqU0VO?=
 =?utf-8?B?WFZKTjBQTjAveEJ4V2dKaldYSFVoNk9FdnJEMUhnR2pkWGM0bDVHMlB6NDRy?=
 =?utf-8?Q?RA399xbwF3o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkNtNVNyemhwVyt4bllOckFBYXNPSWpaTGxPNDYyMFZNak5HczlvaHRTcnc2?=
 =?utf-8?B?dm9lWHg4RUNDQlZzdWFSMWVNc1RPeHpJNVVWOWh4WiswK0d3TUMrYWZlNFF5?=
 =?utf-8?B?UUFzb0xhK1RjOHJod25iS1Q4YkVld2JMemVOa0FQL0I5WEhjNG4rTnpydVli?=
 =?utf-8?B?NGh1cklUK3YzTlcwdVVqMVVmNnI1bWJpSTE0cnM1dEc4MG9Eemh2MGhNR09m?=
 =?utf-8?B?T1FOZjVxVlprNXVaRGZQQ1ArZzJ5cDgyUU8yRlBIdFdlcVlhdUYxTTRoNXZD?=
 =?utf-8?B?UTBnVi9iV1ExUXkwTzNMV0E0ZFhiTHRiWDdiaTE1Z0xtNTRWa2tWWWoxb1la?=
 =?utf-8?B?S2pjS1dmV3dCK25ieERPT1pxSk5JVmRuTHVYdjBNdlQ5Y1NsYWIxWm96enVp?=
 =?utf-8?B?cHdsTTZJWXl1d1FIQXQ4ZW14a1VYV0VFOEdiZE5OUXBMYS9aUlBKVGhSVTcr?=
 =?utf-8?B?R0xsUFM2Zkk5L0E5RWV5VVk4ZHZXMTZ0cWlnZmovUGZaaEd5SkVWbDV6N3c3?=
 =?utf-8?B?Z1A5VjdHVWxOa0F1d01ISFFLL2ZNejdPZDdMcmQxT0lvbUxNd1pja21KTDR1?=
 =?utf-8?B?V1NQOGhzVExzbGpES3pzV2tPUTYwMm0yN2hYTDZiclBuT2lHaHZEVGEvMG5Z?=
 =?utf-8?B?UW1PTGZ4SXZPZWFIUnlzRXhvQ0Qxb0ZqNjhPU2haVmtORzkwVlB1MXlDK3Zt?=
 =?utf-8?B?MEZmSy9LWUc1T1ltQmo3MS9KdGlOWWJkaGJmVTlzdzAzcTBXUm1rQkI5ZVU1?=
 =?utf-8?B?L1FEWGNmYzVSa2xEakR4Ry9YdkpRK1pRa3h0eEFVZzhqRkxDU2I5L290dURu?=
 =?utf-8?B?bW1QWmkwTjJFY2NWR2gxdlh6aXR1bHdyRkNyN2xlTVU5NDlaSUZyNmpFZnN4?=
 =?utf-8?B?dWg4V21NdzAvUVBEVmE4eDhNL2ZGVHNwNkp3ajQrWHpxZTBQcUlpNTBzQWJ6?=
 =?utf-8?B?ZWF0a3FoTS81WVlIVTBBM0VMVERPakpNOExFVVFBYU5pRVUvc0NoUTY3TzlK?=
 =?utf-8?B?MS9rZmo1MHpLWmpqK1VpUi9SS1BxckxBSFMzSld4MllGNk1LZ0N3OUNpQWVX?=
 =?utf-8?B?OVJRRmhCbXg3RjdDaTd5OFJCYmNJODIyRmNvVU1icTBZUjVvQUxYTlBya1hh?=
 =?utf-8?B?QnM1cFFlaHlMME5hS0U5VmhGVHB2NFpUT29wTWMxVE9zRnlQajhLbWVJdXJM?=
 =?utf-8?B?N2RQVnEzUEwyTE5YSjNwTEd2THBhT1dHQjBNZjYzYXkwUEdQUUgwSHRFb2c3?=
 =?utf-8?B?WXhxb0dDbm92Wk5oNml0V3I3WW9xc1doZk1lREZtMkMyUndobzdJdEVOK1BP?=
 =?utf-8?B?aWkvSVRIOU5hQmR3a0xScFFQZTJIK29lWUg5TWJNY1dOeW81S2JtYkJBZE1N?=
 =?utf-8?B?VVJ0RWJlRU5jWlZ6aFdiZFd5bzRYRGxiNm9NQXlSak1UNGtzSG1DVjFVU2U5?=
 =?utf-8?B?QnllSStEQWZWbGZDakpXSmsvQ0N1YnBxMnJFRW4xUU04cHRyOEpHcDRmb1JJ?=
 =?utf-8?B?a1diK2VqbVRydlBvVW8rajR5ZlJRM0kyTzcwTitiQWRMN3gxb1lTVzNrMEhK?=
 =?utf-8?B?ZDUrajByNVpESGZrZUQ0NTJNK2JZU0RCTnoxdHRpWUVDNkt5ek5PcDVuVWg2?=
 =?utf-8?B?aFMyekZZOHdCSDU3bE8vN2tEdFZSNVpWcFM1bkFRRW1mbGl0KzdGcDFrbnc5?=
 =?utf-8?B?M2Rya0x1dlhUaHg4K3hDUVpZdWVhS2hZVzZVdGhhU3R2a0tBNytNK0lITGU1?=
 =?utf-8?B?VWgxTEYwL2p0UE1PbldUdlhFMFNaMnVxKzhEMVRKL0xCU3lVdkFOWDkvbHNG?=
 =?utf-8?B?SWEyTjVOMS9Pek8rbENSUWMrRUlmNytBK09jOXowMk5ZYzJHSFQ3ci9OYlJm?=
 =?utf-8?B?cktXSkxzMkJVVUlCUkl2Q2h1Y0JSbi9KSjAwOXBYVVNHYXRNV1ZuVldjem54?=
 =?utf-8?B?aHNTWDNDM2xnN1Z6cWxOZENrR280aHhLOXoyd1RBUHFFZVJXcjVkN1BxQmlL?=
 =?utf-8?B?NUtRODhYSGppdUVxWk9ZWHoyWC94Y2g5TnJjUmNyTWlhQzUyVStMKzlsT3Zi?=
 =?utf-8?B?UmkvVUlXVG4zL1NkZ1hjNmxjR1llWkVweS9ZUFkrSWhpVWF1TENQVTZrWUZa?=
 =?utf-8?Q?4PyXYtfmGu2pal6UJi+z9sXi5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15ff140-de38-4cc1-cbfe-08ddda5a1984
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 11:11:06.8373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcnxZQPJ/d1ubOGps462uF+rmkBEK4w0IyzNWmY5GmxJdW5pvFhp5IfCWIH7UEfl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7285
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

On 13.08.25 10:20, Tvrtko Ursulin wrote:
> 
> On 12/08/2025 15:34, Christian König wrote:
>> From: Christian König <ckoenig@able.fritz.box>
>>
>> We have the re-occurring problem that people try to invent a
>> DMA-fences implementation which signals fences based on an userspace
>> IOCTL.
>>
>> This is well known as source of hard to track down crashes and is
>> documented to be an invalid approach. The problem is that it seems
>> to work during initial testing and only long term tests points out
>> why this can never work correctly.
>>
>> So give at least a warning when people try to signal a fence from
>> task context and not from interrupts or a work item. This check is
>> certainly not perfect but better than nothing.
> 
> I lack context as to why this should be disallowed so strongly (maybe cover letter is missing to better explain it all?)

See here https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences

I was hoping that this problem is so well known by now that it doesn't need more explanation.

Going to expand the commit message a bit.

>, but at least if feels overly restrictive to for example exclude threads and thread workers.

Good point. Could be that someone is using a pure kernel thread for fence signaling. Going to check for that instead of a worker.

> 
> Even the fact opportunistic signalling needs to bypass the assert makes it sound like there isn't anything fundamentally wrong with signalling from task context.
> 

Opportunistic signaling can happen from everywhere. But when an implementation tries to signal it from an IOCTL that is certainly invalid.

> The first patch also feels a bit too much if it has no purpose apart from checking the new asserts would otherwise trigger.

The sw_sync code is is only used for testing and debugging. See the Kconfig of it:

          A sync object driver that uses a 32bit counter to coordinate
          synchronization.  Useful when there is no hardware primitive backing
          the synchronization.

          WARNING: improper use of this can result in deadlocking kernel
          drivers from userspace. Intended for test and debug only.

Thanks,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>> Signed-off-by: Christian König <ckoenig@able.fritz.box>
>> ---
>>   drivers/dma-buf/dma-fence.c | 59 +++++++++++++++++++++++++++----------
>>   include/linux/dma-fence.h   |  9 ++++--
>>   2 files changed, 51 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index 3f78c56b58dc..2bce620eacac 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -345,33 +345,23 @@ void __dma_fence_might_wait(void)
>>   }
>>   #endif
>>   -
>>   /**
>> - * dma_fence_signal_timestamp_locked - signal completion of a fence
>> + * dma_fence_signal_internal - internal signal completion of a fence
>>    * @fence: the fence to signal
>>    * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
>>    *
>> - * Signal completion for software callbacks on a fence, this will unblock
>> - * dma_fence_wait() calls and run all the callbacks added with
>> - * dma_fence_add_callback(). Can be called multiple times, but since a fence
>> - * can only go from the unsignaled to the signaled state and not back, it will
>> - * only be effective the first time. Set the timestamp provided as the fence
>> - * signal timestamp.
>> - *
>> - * Unlike dma_fence_signal_timestamp(), this function must be called with
>> - * &dma_fence.lock held.
>> + * Internal signal the dma_fence without error checking. Should *NEVER* be used
>> + * by drivers or external code directly.
>>    *
>>    * Returns 0 on success and a negative error value when @fence has been
>>    * signalled already.
>>    */
>> -int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>> -                      ktime_t timestamp)
>> +int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp)
>>   {
>>       struct dma_fence_cb *cur, *tmp;
>>       struct list_head cb_list;
>>         lockdep_assert_held(fence->lock);
>> -
>>       if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>                         &fence->flags)))
>>           return -EINVAL;
>> @@ -390,7 +380,46 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>         return 0;
>>   }
>> -EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
>> +EXPORT_SYMBOL(dma_fence_signal_internal);
>> +
>> +/**
>> + * dma_fence_signal_timestamp_locked - signal completion of a fence
>> + * @fence: the fence to signal
>> + * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
>> + *
>> + * Signal completion for software callbacks on a fence, this will unblock
>> + * dma_fence_wait() calls and run all the callbacks added with
>> + * dma_fence_add_callback(). Can be called multiple times, but since a fence
>> + * can only go from the unsignaled to the signaled state and not back, it will
>> + * only be effective the first time. Set the timestamp provided as the fence
>> + * signal timestamp.
>> + *
>> + * Unlike dma_fence_signal_timestamp(), this function must be called with
>> + * &dma_fence.lock held.
>> + *
>> + * Returns 0 on success and a negative error value when @fence has been
>> + * signalled already.
>> + */
>> +int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>> +                      ktime_t timestamp)
>> +{
>> +    /*
>> +     * We have the re-occurring problem that people try to invent a
>> +     * DMA-fences implementation which signals fences based on an userspace
>> +     * IOCTL.
>> +     *
>> +     * This is well known as source of hard to track down crashes and is
>> +     * documented to be an invalid approach. The problem is that it seems
>> +     * to work during initial testing and only long term tests points out
>> +     * why this can never work correctly.
>> +     *
>> +     * So give at least a warning when people try to signal a fence from
>> +     * task context and not from interrupts or a work item. This check is
>> +     * certainly not perfect but better than nothing.
>> +     */
>> +    WARN_ON_ONCE(!in_interrupt() && !current_work());
>> +    return dma_fence_signal_internal(fence, timestamp);
>> +}
>>     /**
>>    * dma_fence_signal_timestamp - signal completion of a fence
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 64639e104110..8dbcd66989b8 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -369,6 +369,7 @@ int dma_fence_signal_locked(struct dma_fence *fence);
>>   int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
>>   int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>                         ktime_t timestamp);
>> +int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp);
>>   signed long dma_fence_default_wait(struct dma_fence *fence,
>>                      bool intr, signed long timeout);
>>   int dma_fence_add_callback(struct dma_fence *fence,
>> @@ -422,7 +423,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>           return true;
>>         if (fence->ops->signaled && fence->ops->signaled(fence)) {
>> -        dma_fence_signal_locked(fence);
>> +        dma_fence_signal_internal(fence, ktime_get());
>>           return true;
>>       }
>>   @@ -448,11 +449,15 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>   static inline bool
>>   dma_fence_is_signaled(struct dma_fence *fence)
>>   {
>> +    unsigned long flags;
>> +
>>       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>           return true;
>>         if (fence->ops->signaled && fence->ops->signaled(fence)) {
>> -        dma_fence_signal(fence);
>> +        spin_lock_irqsave(fence->lock, flags);
>> +        dma_fence_signal_internal(fence, ktime_get());
>> +        spin_unlock_irqrestore(fence->lock, flags);
>>           return true;
>>       }
>>   
> 

