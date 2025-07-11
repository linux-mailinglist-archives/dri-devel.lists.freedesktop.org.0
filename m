Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52872B02667
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 23:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306B510E2E4;
	Fri, 11 Jul 2025 21:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4Pai+Mj8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87E310E2E4;
 Fri, 11 Jul 2025 21:30:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aECZZOL3XQU5K51YA1BNSqUZ+TeTpgfyCjEt3hK6AiB93OfOam2D0hGqH+bNRQgJl7oqm++9IWN2RB5ODrY7XRD5tR/TDcoed4sLHrbeG+e66ImO4Lp7Ii2jioHpyiFbZMaVFdYB1hbJS2fkSKEM30gSw7TdG8rjXGi3Zl9u+MIiKs3vIXQKDt3Wz2AN9XWGU8UwYflRUxcIuUUi8pkWt9gnDk8JHjT5CfVKTLV4gYbau6XvWcURZ4ib58ibNjwkqKTUF2E/opaS686SAO/521jxqyLiQ5m/tocv81DcANo6BNoDGMqLdT0suX/2tERLbUYgqsLg8reo0JKcitaJTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rzDAzr1MBaXSOrtEoHbbDBbwwo2UfpfAhQWwYGA9BQ=;
 b=HaYYyTqMBRlko5Ax8Ytds34XtRmy2jW1Ka9hesBwNY4jJHLZCMQ60WL0lHWa+troYCRYDAN0kNPgJBsD3fkkqbHHauHCC1r211qBWSHRb0gXe9GSKC8zDgbF/rtDMtlCyO/qKgbHgrUAH1MpF3Jk9dmEujzq5xYBMT4csw5SVLWySj2vH4/nPO/O6wXRZXNaaIxyDSdi/irzko9zVfZqGs8xepHWTrfNgg8Zi/yB37r9N78PazHBmcUSQpAX7KebCuQcLSI13ZINHbamSyfNM/DCYKKZ4ZxJHyPp8u1rL5X04SR//ICVKSpj4f7Y5geOKu6ciXhLr4XlTX4CoeIdsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rzDAzr1MBaXSOrtEoHbbDBbwwo2UfpfAhQWwYGA9BQ=;
 b=4Pai+Mj8X4kAts6ty+AbDsk7btbhrAcmkUIcbaeC44fxAKUPRgMcI6skBHeQZDQP7lhxy2hinMjFQ2deC7KTDIKHGpiVSuXUtD3UhbEpE6G90W/mpVGdhlHE6X5LWwb1TtllbhqnYdwVWYf431AHXwKU7J0C/kdnXU1e+UQZdzE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CYYPR12MB9015.namprd12.prod.outlook.com (2603:10b6:930:c8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Fri, 11 Jul
 2025 21:30:40 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 21:30:40 +0000
Message-ID: <deafd2b4-0947-4588-bba6-81e5a072abf5@amd.com>
Date: Fri, 11 Jul 2025 17:30:36 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdkfd: enable kfd on LoongArch systems
To: Han Gao <rabenda.cn@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Xinmudotmoe <xinmu@xinmu.moe>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <ecedf70051b805c5cfdcc2b91f9304af24b3c3fd.1752043543.git.rabenda.cn@gmail.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <ecedf70051b805c5cfdcc2b91f9304af24b3c3fd.1752043543.git.rabenda.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0296.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::12) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CYYPR12MB9015:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dae64f1-93c4-41c8-9fac-08ddc0c22ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1hUdm9ZZS9VcG1rT2xXaEkrdHZDOHlNOWhhMHlpNnloREFWRHkwd3lmQTJ6?=
 =?utf-8?B?L1ZIcmJJeVd4cFRtbTJ4MkhqSGw2MG1LTlFJQUJkVjMwemM1cGVHU0MveEM1?=
 =?utf-8?B?bjlJNlZydkRpVTE1SkEwaVJ6bDc2Y01qejVKR3h1QVlxTHgrYXJOdEU2ZFpv?=
 =?utf-8?B?QlJTK3VVTHdRYkg3a1hJQkRHd2k4T25ZMkhETExTUjY5WFFLZVU2N01hcWps?=
 =?utf-8?B?OUdlQ00ydW5oNXptaWczY0ZYdEN6ZThFQVBPcm9uQi9Pd01yNU80cDk5NHpB?=
 =?utf-8?B?SW0xeGtQVzlIUFJoK1gxaGlFMnJrUVEyRHRPQlpQeWwrUU9hZWlhNGpzQWFK?=
 =?utf-8?B?TGlkOWx6djFkWjloS0d4Z1dyODdhM1Y0azNjYlBVcEkxc0dkb25vdklhUDd6?=
 =?utf-8?B?S0pBL2VvQTlnQ0RiUWgzdXREeE9teVo4L2x6aWRGVG5WczhwOXRZa0IzY3Ew?=
 =?utf-8?B?V2NUR21yRWxmOGVFVVp4ZUtDK1VqSFBlbzg2Vnc3R3BSaUlhQ3lLRG4zaExU?=
 =?utf-8?B?TVljUHdnVGdvL3FqbFR0N3MxNXJOMmpHZ0lTS1Qzd2doK2h6d3ZtbStmZEZ3?=
 =?utf-8?B?ZHUwVlpJbURrNDZCMlhMQk96cDFIYnllL3ZyOVZFMFZhREVZMlYyeFZWZjJt?=
 =?utf-8?B?OUlTK2Nic0VEUFMybHhoZ253T1d4NG1oeDZPVG5xMVBsRHJrUUpTMjc3ZG0z?=
 =?utf-8?B?R1h5M29sZEp6dGMyMkRsVU4zYU1JYTVjaHZ3WXA0R3ltNXdRNzFrZ2trZXFo?=
 =?utf-8?B?UWtXaEI0WFN2WWtFbUpzNVpuT3VkSzI2c1g1dDEySm4vZmFQc3NPbXEyMHls?=
 =?utf-8?B?bi9BWTBMeTMxL21YM2V6djd3TXFMRVRiLytCeDhCbXo1dENrQ1U5RlljeHlv?=
 =?utf-8?B?a2lQQjVlTVFSS01JTW1FaXFjQ3VDZUNlWlhDdDRuYTcxNkQ3REZvb3RpVmhK?=
 =?utf-8?B?WURYODlHT0ZCd0ZobjRReU1ZQlY3VitlWVM1cE1iSHF2M2VuMDJnQUprdzVH?=
 =?utf-8?B?b2pDUnU5VTgxNjNGUHRrMHVaNVdJdXRqcWVXNGdRcDFqWFp1U3ozSVhidmU5?=
 =?utf-8?B?VnpaVi9GRWNkTnhPMXRqR0hKUUgvSS9YcnJXOWJDNUZCYmtJNlNjMXBYSWZx?=
 =?utf-8?B?akgxZEFnTi9hYnRERy9GZWlFQjQ3M05uSWZyZWtya2UrSlpZaDRKMUpDTVpW?=
 =?utf-8?B?endDclUyZjVuTThzMlBOTGMyUDNUdzFjZzlnRGEyeWViaGdSUEk3TVdubEY4?=
 =?utf-8?B?UTEyclpmZ2pmVCt3YUNxRG5xREszdDlkbU82NzJiRzN4Q29weVNWS1cwQmhu?=
 =?utf-8?B?RHJ2eXJ6eVFCU0xCVGxVWWw4MkxwT044S3pRWC9NeGhaTmpLWHJUOTJsejJ0?=
 =?utf-8?B?cHpFSGZVT084bUg2cFlTbUdsc0locUxtb1V0WndwOWhQdUdtODBvR2g1ZzR6?=
 =?utf-8?B?RHJ0cFp5eGtmNzVVZ3JSMGRSaFpsMmlBZHF1R29oOTVzWDhKU29mdjFVU2h1?=
 =?utf-8?B?aWpJZk9FbXQrV25tdkFkbWIwQ3dwbWR5bDhqMmVmSlJ2THphc3E4Z2I3cXIz?=
 =?utf-8?B?dWE5bnZvdDcvbXdkWkpKUWdGcG1sbUJraTZGRTk1RXdQWlVoWlNGM1JlQXVy?=
 =?utf-8?B?Z203N0FiYmw5Q01XVUpIelZoVlJtMVJrTlh0eTExWU0xaEpFbTQwTzFLdHRw?=
 =?utf-8?B?TzVBSFVIU3pPalFydzRjbTZVbUhoTGZENVZUNE8vWXVERFdjbmUrenhNKzQ2?=
 =?utf-8?B?NndjNHVCL3g5cjNkZHFqdEpQbCtlZ1NVdERyNEUxMkZPY1I0NmMybUIwM2tG?=
 =?utf-8?B?SDhucVB2eHl6R1lQWU1uN2tCTmgvU2dMVGhOZ3hsdFhwZUh3N3Q1NHVDT1lz?=
 =?utf-8?B?ZEZCejZpaVI1TWg3L0UrbFRkeWRvajNZTFpUWmtBSmJnbGozVUZzb2tneDdF?=
 =?utf-8?Q?qcNy0Gxplgw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnNWMEJVeFJaVzluOWlqZTV5NWRIODNNcWNPcHRrOGhwNEcvK2VZMlc4Q1RK?=
 =?utf-8?B?UU9kcVRxVzI0czhzY2EzcXB1NmgwNjZjT2FDU1UwY09vRUdGS0pSK1c0OHpX?=
 =?utf-8?B?STJ3NkNFazU0SWtEcGd6TzhjK3ZYTFgrUTBvQ05YbjdCRkFtL1YydlR3SlNU?=
 =?utf-8?B?REhIWjUxT3R2VFlnTGwxdnlNWGtwQlFFeS9sak8rVkhpQ0UwMGhNaWpxaGJl?=
 =?utf-8?B?TEdhQUladHgwSERSUHpneFY2M1hObmoxR3Bhd001aUV6MjhlZ1kwbUJzaURQ?=
 =?utf-8?B?UWF0R2F5cGhSN2p6S1M0K2U0czFudk1CQkNqZkw2K1IrdUhJcC9Vb3BHWlc4?=
 =?utf-8?B?NFQ2cG5iU3NtMjNGRHprblhGRGJ0dHNybFNvZTU2Y2dna29aTnllWXh4bG9C?=
 =?utf-8?B?RDJSdHZUWDZISlNMc2pKUFQ1UTlnWmZmK0ZxM3cwdzZYVmpMcHFkZlF0bEVa?=
 =?utf-8?B?bEtkNUpteXhJbnJTRTV2MVY4eWtDNkhSQXh4Z0FyTmtTcTlxMGhKbEsvcG16?=
 =?utf-8?B?ejlia3NmaWN6KzAzZWpHeUpPemNaVUpOOEJHcFNnNjdHc05OdHJHNFR4bXNG?=
 =?utf-8?B?OEdxQlc4TjltL2lEdlQzNmYwWkNBaG9JZzZQVnZsZWlHRmdCekhtTlE3VzBD?=
 =?utf-8?B?OEFXa0hRdVZKNXk4Qk4xdWFXd2dEQnpUZmNsOEl3REgrWDFtZENZa3NSOXZz?=
 =?utf-8?B?M3drZ2hDZHJrdTREZXdCZzlwa2V4SGZ3L0JDc0NYc1IrVG00MkhtRkFWQWl1?=
 =?utf-8?B?VmRYZkNEd2N1MDBrMFNGNjF3TnZOQmwrWFRnaXJ2dHJNTmlmZnUxV2VMUVhQ?=
 =?utf-8?B?TEZ3eW5sQnlDV3haZnVCaENUMU1OUUNIQkNVWWI2bVVLNXJ1aHFzbExlS3ht?=
 =?utf-8?B?TVNKMUNvblVHTEVOVkJNQWdaNnQrTEJKZGE3aElYeU1Ra3ZpMmE4eHh1S1ov?=
 =?utf-8?B?TjAyUXlIZ2Uwb1N3MHZ5MmJLakh2OStIcWdnMlBhQTVzREpUM0IzS2xtUFdo?=
 =?utf-8?B?aGtDUExvTkhJd25PRTBkZnBJMXc5WDJPdnU0dTZCZkEvOTNZYlo5ZTJrNFlY?=
 =?utf-8?B?alRJVTJJejNPSzhMUVFsdXJYS3pjbnBreDllWlM5WmxEc0wxZXhhajRQRkpr?=
 =?utf-8?B?aXZteE14aUtQQnVndFB2UE9wajlwMTFya1hjQ3hkSzJ4STR2NUFrYjF0cDdk?=
 =?utf-8?B?R0pKSjVocjlqbitNSWMzMGU2bFBKU2MraEZlUVhGVE1PVTlqK0ZISE9CK2VO?=
 =?utf-8?B?YW4wOGIxM2ZINlh5cTY4eDI2RmZrWksyREVIelU5RzlXSUlNZDVIa3FuSjNP?=
 =?utf-8?B?eW5JQXZ3ZzF4YS83RjVYeVd1b2ZiQWVtWGdZL3RNZ3J1bWJ3UE5XVFRlWE1Y?=
 =?utf-8?B?ZUNzZnBoNHhvQ2NCSXFJVVNKZStkUDlWVm5EQm81d1phYjY5TWoxLzRHOC8z?=
 =?utf-8?B?cG5VVWVtODNhUDVxczVnK1preHZ6M3Z1ZWFhWVYrWjhjcnpvQnZJQkhEWHdV?=
 =?utf-8?B?WmI3azF0UWI2ZUNkRmYvaFU4NHlwVWs1ZTJvc0NoTkNpQnRBb2k5b0pTbVVn?=
 =?utf-8?B?Zk0vcGIxbVF2QUFJNEp0QXJ0Z2kxT3JnWWxvN2pkZFVURVdlN0hLK3NadVln?=
 =?utf-8?B?UDZZcUlnWlhDQ0NMaDZldHVELzlZKzluN2pjcDdSem40TjNkQk1TTGJaMWls?=
 =?utf-8?B?elhhTGc1SWhPRWNHK2hkWFBPK05ldFFlcmJDeEEwMitlU0d0QVVJTG1tbGVF?=
 =?utf-8?B?Rm51QzR0V1JobERHNC9zaWVNaXpMczM0Wmo3c2d4Ti94aS9ZdTNWdE05RjZO?=
 =?utf-8?B?MTBtMXlSLzFBMlQrYTI5TlNMa3pBTUd2MmtzQW9DYVRURU5aaUNQclI5RlEv?=
 =?utf-8?B?cUlvWkVCdjZjSjZoZFNmM1Q5ZFJMejRZWFFsWXNST2VxOHFvb29EYnk4VWly?=
 =?utf-8?B?bkJVL09LWVFZTWRVNDBYNGNROHVsWVpEcDlUdUtTLytPamdFSS9QRzBnd2FB?=
 =?utf-8?B?MHU1dk94NGpiMkxQYit3bis2Tks0MHhKNVFNK0JoWlJpY1dtTVp3UHNwaHpM?=
 =?utf-8?B?Qm1VZHVqcVhmdFlVdmFJdmJ3TDQzekFtN2JweTZUOUpMeDZPRXJFOUJ1ZWJO?=
 =?utf-8?Q?RTN9JdVlho6+j1geDBDYcLjNt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dae64f1-93c4-41c8-9fac-08ddc0c22ee5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 21:30:40.1031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YXmTL12GFF/+k2Na17MarVFSOVq8tLxPhUvgHomICvm5rToARWbwFRn5vOMw8D8dsANkwWxriTWODwiUc2lKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9015
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


On 2025-07-09 02:51, Han Gao wrote:
> KFD has been confirmed that can run on LoongArch systems.
> It's necessary to support CONFIG_HSA_AMD on LoongArch.
>
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>

Thank you. I'm applying this patch to amd-staging-drm-next.

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
>
> Changes in v2:
>    Add 64BIT
>
> v1: https://lore.kernel.org/amd-gfx/56e7ec54-9820-4e02-be97-2a9e1dedd117@amd.com/T/#t
>
>   drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
> index 62e88e5362e9..16e12c9913f9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/Kconfig
> +++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
> @@ -5,7 +5,7 @@
>   
>   config HSA_AMD
>   	bool "HSA kernel driver for AMD GPU devices"
> -	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 64BIT))
> +	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 64BIT) || (LOONGARCH && 64BIT))
>   	select HMM_MIRROR
>   	select MMU_NOTIFIER
>   	select DRM_AMDGPU_USERPTR
