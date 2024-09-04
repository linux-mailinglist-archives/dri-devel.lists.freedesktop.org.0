Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B163D96CAAC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 01:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC89010E490;
	Wed,  4 Sep 2024 23:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gNOVV2U+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6067710E128;
 Wed,  4 Sep 2024 23:06:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOWtMUSP3tGx5PjNuD1qAx+byMFqtHzand37j9eObqFxxHiFoueFhq6v7+g65f3RZaNj66/taklyVaIJMyF5OhZZPpOBU3Ak8jRaR4qFU87xUC/9BLSa/2Yeoe4ZpcmZNWVFzMmDOZE0nfbvur/e2ulLMX0aiZVvdchYBUkcxBhWF5tEL/XsKO2BgfuglnEu2+vHDCpbD+Fre4zql6YqmcaK6UQx8RsNyZ1StMarNKYfVcG4Rn4f9v92B5hylSkUV4/VUdGmXZSHARf04dXPP/0owovqCknaOeTDDU7CjqyxcPJZ9eq0LhOnMtZ4OcS1NeyLLi3CiN4MgQT6rxWK7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLgFgM55Huq6vGL7u7p/wBopXWFW8q6FpkTnl5gh/tY=;
 b=MR9W3YHxzg6nhpwCkZiuuNKtzLfqpWsawcYf/9HSgbyFixwO4uLY+eua11HeHCJ5n3i9mtLvkaj5XWgpzS31sav8C0WGVY5tW/1xWcIeBnCT0FtSuW/C4bT7AJ4CmQzyDRPQOv52kDuf2XWYkLw1jh6XSsfCUAtzWlHIvuiyYExXogfjj3QHkG8yYpv+ZV9mqu860BqKZ5c0PjRLY87bs4famFltqWg3B1rlTkUd2a5RIi+xPvrhIt4+73M5knv2aAOkFteVxFGUEt3vrLIVD1WNEgjq2o5p11ej6ajw8eFi97/YEkKqMoW4duvylr9FlRGbf5+NK0r4IOALrvsoyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLgFgM55Huq6vGL7u7p/wBopXWFW8q6FpkTnl5gh/tY=;
 b=gNOVV2U+awjqPLxkW4Uxs05QZrvoxKjgMjZo1fhdCYschFf2a3NF29oJNQuZXY1lKhRqzCa8LLGv6TF0ucvsqx0Sb5FGxYbkr7hFfHsejbj8yq+HlY5kvfSAkyKCu6SxJ36BZjMJNolBKHrk7GPGzmqo9GBILxcgjs0XMl2jtoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 PH8PR12MB6820.namprd12.prod.outlook.com (2603:10b6:510:1cb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 23:06:28 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 23:06:28 +0000
Message-ID: <f68020a3-c413-482d-beb2-5432d98a1d3e@amd.com>
Date: Wed, 4 Sep 2024 19:06:26 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: 6.11/regression/bisected - after commit 1b04dcca4fb1, launching
 some RenPy games causes computer hang
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Harry Wentland <harry.wentland@amd.com>, zaeem.mohamed@amd.com,
 pekka.paalanen@collabora.com, "Wheeler, Daniel" <daniel.wheeler@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com>
 <CABXGCsNztS8MLteq5=fcddwuQ1TCzeOM8TdVtpJ3crK=sV5PTQ@mail.gmail.com>
 <CABXGCsMdxHJ-MLkS0pm51Sk8g0PTghsuZxmowvj5t44bVN4ndA@mail.gmail.com>
 <ffd2c40c-1c2e-4465-b26f-88d5e08a80d9@amd.com>
 <CABXGCsOoL5vD0+FRALFQFr3ZBpb2z5mpGKzAD5RHoW9_sb5yaQ@mail.gmail.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <CABXGCsOoL5vD0+FRALFQFr3ZBpb2z5mpGKzAD5RHoW9_sb5yaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0448.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::22) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|PH8PR12MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: 3942e6c4-4144-4abd-852c-08dccd363553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjdLOWxTVmxzRjJ1ZGR0L0doMisxL1FLeFpUYUZyalRPNHF4SndKb1Nub1gz?=
 =?utf-8?B?YmZFVHFWMnpON2wxSE90amRrUDdrK2pKWDc4VHk0a3l1ZGZPRUZBdC9zVTU1?=
 =?utf-8?B?UnovSTc4dDBWNTU4VlpRSHBMdHd3ZmRjNXQ3Uzh5Z3BIT3lGQkx2MlhMZXdS?=
 =?utf-8?B?WGsvbEc1bnZ0VlR5MUdGQ3FNZGRjVnd0c2VPRFd5MElOTWlucGtoMzFOYVpo?=
 =?utf-8?B?alVNVTY4d24wdXN1cDg3SmJXZzdJNXErYk81ZzZZUGpndnluY0tUeXZJMWVL?=
 =?utf-8?B?K2FLZDZ5ZlhveEpsSWpJaWJRNmhFVmJjRTlZZXpBREdlQmdHSXNUYWpMWmJs?=
 =?utf-8?B?cVhEVFcrTnlUWVdrSWowZTB5SlRqdzFCMDBwOWtBNjBUYVNQeHpuZ21aZkp2?=
 =?utf-8?B?eXpaWjJoM0E1aXQ2emFYc29RZklrdXBVcXZsaWNjMU1NNEVBRVNkWC9NTS91?=
 =?utf-8?B?azllY2NNSjVXaDBmSmRyR2VKOWVoMzB1ZEd3Uk5lY1VuclJBdFdtcERBN011?=
 =?utf-8?B?c25sQURLK3NYTzlKU29Qei9xbkhqblhNMmVTSVdYQXI0cWhDZEZyYkk0bytM?=
 =?utf-8?B?L2ZBaDE2aXRvREdHZ3hZYWJuZmFXdHdjK0JETkVveXJZQnJ2V05vZHFaZUdV?=
 =?utf-8?B?bHpTSXNPUk15Q3ZhSzhRTEpxdWxtOFFlT3VFZVlLS1M5UnExdzNmTnVIejU1?=
 =?utf-8?B?VWNiY1NVaUhKV01EMkpUNTNpSGtHcGMxT3VxdmJvcUFwblJxM0dodzVjcG9t?=
 =?utf-8?B?L2JSRHgvWWt4TVlaOVNhUkNxaWU3OXRhcDQyd3BDOSsrcWNpbGE2d0V5Z3FN?=
 =?utf-8?B?Y21LZnUzZmRJeDdYMXRQcDVxdDJnd0Q5WlRxQWUwRnhtVmt1SG9KOTNiT2Nv?=
 =?utf-8?B?RURhVEdIdVBqcWZNVytaQkJPNWcvb3RocHhIdzNJbFBtK3JKOTRjS0FZOXpz?=
 =?utf-8?B?UC84WEFQdVhLajhSTmtYOW1hNTJ5YW1vRkdxVVE1SDN0V1VjT3lyTDc0MzFl?=
 =?utf-8?B?bG55YUU5TzdFdTh2U293SndDdmo2U002TDhFdkRoVTV4SnBZbmdIckp3OHlL?=
 =?utf-8?B?emlmRFhobjVQb0dLSjBOZ29vYStWbGhIelM4dENoQzBJWnRSSjZ5MC9heGcr?=
 =?utf-8?B?ZUhSYXBkQ3M5YUdNajVQcndqYnExajQ3UVo5WVUzS0dGd1p4WlhBdUFyOTlM?=
 =?utf-8?B?ZXRPbmtpT3BVZnZ4SlduemlaRWVvVEFmQUZ5QkgrWWxIWExrekF2dzIrUWli?=
 =?utf-8?B?N2pnU2FNTWZneUdqTjJzVUdwTFBQeVdjQnhkNTZxd2JZQklWWnBJNEdmT2t2?=
 =?utf-8?B?amJhTnZDelBxQTFOVm9Oc3hya1dHZGh0ZlQ0N2c3Qk1MdGNXWWZKQTN4dGUy?=
 =?utf-8?B?RXBYUVZvbDllRGhtSThFeWtuZUdlY0wxVnptNWNwYm1HVTlnZlZvYmsvQm1p?=
 =?utf-8?B?V2U2NXNsNksvR2J0ck5md05vTEFJRXQydDRMYUM3SVZ3b1paelRsRUJnLzNq?=
 =?utf-8?B?dE1XMGZkL2JhSzltL3pGSzVQWjNEaTA3ZkZhNDI1c3pzajlwRStnMHZWeE83?=
 =?utf-8?B?UUNEaXdvU1k0SVZIM01LTGl0bFUzMjlnZG1NMkFhK2NnQ3drc01ybks1M2lT?=
 =?utf-8?B?NzI5Q2xqcHd3cmRqbjh3ejcxRlpkaHJpUnFXSkJ6aytYZ0luMlB3YWl5T3N5?=
 =?utf-8?B?OUNMcFo3TU04TmV3bjdQNW9VZDdLa1BrYVN4OUVXY0o3Yk1lSG1tUzdVaU9i?=
 =?utf-8?Q?18bWiCpzGMu49rb9ImzdGMr05GSeg/zm1EFYGn5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXUzdEwxc0dqazBJTS9FNHdseWF3ZER5cUxwRytRbTJCSGsrcXZseXlxMEJB?=
 =?utf-8?B?Z0Z4S0gzbU9vRThQaXNUZkdCRVcwbWg0TFQzUGxvejlyV1lsVGY3Y1did1RH?=
 =?utf-8?B?R0JtQ1oxekpLRUQvVzQxRDN5VFFFUjVVZTdGYnR1ZXVPbXRUNVZzdzdVOENk?=
 =?utf-8?B?LzJRUzg1SDBaY3l6VUc3OEI4eVFWbUU2NHdzNGliRGljb1I5TFpoRTdYQ0pp?=
 =?utf-8?B?YTA0Y2dGdGpXTk9xZXZGa1JMOXBEYVNXVnU2dUhtWGRUbzcxZCtocEZKMVVm?=
 =?utf-8?B?VFB5WTlZM3VPazdhcXl2ME8waGVTWE1BU0xRZ1BFb1YzUlhCZzdtdWs2cFNY?=
 =?utf-8?B?Mm9TZ1MwZ2FldndrRkhHL0hIczJLaGVzT3hEbnpYZFliNFdCVUh1TUZxNkpO?=
 =?utf-8?B?VnRjRGNIMzVSbnU4T2xWQWNqWWhsU0FWUnFrejdJME9hZjFxaUg4ZTI5UnZs?=
 =?utf-8?B?TERmdjN4cHlvVGdEd0tubUpxRVN5bk0xSEE2QkZJOTA5QjZYOWY4L3diMmxU?=
 =?utf-8?B?RXZ4eXBPalBuV0FXaGZDdVozWVhyN3hacjJVT3pRTGQyMmZ0ajcyZHY0eTJp?=
 =?utf-8?B?QTZxZEkyM0h0REJaSUFHTEVybHBOS0hrWmNiWXRZalNDcnRKNm8wL2F5cWdW?=
 =?utf-8?B?cGlucE54MFZ3WUtwZjExanM3K293OTEwZUx2ZGRmQTlrTGFJRnVqRjdCYlVT?=
 =?utf-8?B?b011WkxBMjJoUjlmeTh6cmkrREFiMFNZVjBiZTlkYTFsOG1UNnNaYno0UkRO?=
 =?utf-8?B?UVprWWNVTW00TzNqaUYxNmlpVGpFaUYzK0k2cnhtQnZMczVQczJBaVR1bTBM?=
 =?utf-8?B?UUhiYTRHb3ZlZHA0ZEN6MW9jUSsxQUtHS3VmMlRMbW05NzJ3SmcwVVRzR1Uy?=
 =?utf-8?B?cE1SZ2phN2c2bzVpZnZvcXlyT2ZIRC9ndU9SWE5hM2U4eUhGank1WnMybGZj?=
 =?utf-8?B?Q2wvTUdYVFMyV2tlSEl3VVY5bWRyL2JUZmhXV1lpcTJob2podFJJd2JvcGNP?=
 =?utf-8?B?MUZsL01HVlRISTFRZTcwd01sMXMwZCs1WE4xT2FyT1JIM05rYjQ4c1YvNTFi?=
 =?utf-8?B?SkVlSHI4cFZWODA0L1ZvWnB3YXRNVHJlU2wxdTFSOFdhaWpJVUxWZVgzZ2ds?=
 =?utf-8?B?TitoNE9zbE9zL3Brb1pTZXN1OVN6dXpGMFdVZjVXSFlPeWFJdk1DZVZwd3dL?=
 =?utf-8?B?NmFpLzBYY0drK0F0eVhWTTZDM3pwZmRnbXpHYnFFMnlhRkJ6L0JtU2hUdkM5?=
 =?utf-8?B?N2hrOS9GMDk2VTlIVitEWENrVHhQdWhscTJDV0lWMmlJVTZ2ZVhCdTlhMHpY?=
 =?utf-8?B?cUgwQno2ZllTM01sSkp5MmE3cDB2ck9PY0VLM2s1UThtbVlCUnlwZTFUWm80?=
 =?utf-8?B?UXJKTUhLSzBwRXpqbjUzK1ZqeGRRMTBWaXE1VDZFZEN6bW1JY241QzloeUp4?=
 =?utf-8?B?Q3M1UW8vZmEreWlnY2tEN09Tc1AzaklDeGR0bkVWY3NkZlFvak5uOXYwMExP?=
 =?utf-8?B?ZVNhZDVBM3hCeXkrUkNiVWUrcy9Rd0ozOGJrTW10cm5XRXFqbnY0a0kxREpJ?=
 =?utf-8?B?YnFJRFVzQnVvMFk1SzFWT0J2cnlpejkzME8ydVdXM2lac3N1aGlqV2VsWnNM?=
 =?utf-8?B?aGxpRXNFeG1PblVmT0pRcFhFdUMvelNPVitYdkd5c3dXcUc3ZDRMSnRoMjB4?=
 =?utf-8?B?YjQ1NDZmR3BFZ3hnZm5RVk1oNVFPcjlrL05oNVVURUl0bWhtQ3YyQTdhSU5S?=
 =?utf-8?B?RGVGSlRSREZBNVlTRmsvODkvQlVGV0gwTFlWUkNVWGNCOTNQR3N5L25sZVhU?=
 =?utf-8?B?R2w2SUVjYnlTcXVQRmEwTktWQW1EYkhwNlVNU1hXbm54VmNobmFxbXliOWJk?=
 =?utf-8?B?Umx4OE4yc0h6TDlCNDJ6bU1TeEFDdVc3SWk5RHNNRE5pcGtGUjNqMXAxdG9q?=
 =?utf-8?B?dnJkQjlDUDU0QWdiaFB2QU9NdGRDZlRBNElJR0kxc3dvWTgvZ1laOHM4ZGda?=
 =?utf-8?B?VTlUWmR4SVJuQlRDR0p4NXlQckhTN0Q3U3I5MU01VGJ0am5UWFB2N3B6VlJP?=
 =?utf-8?B?VU9UdFFIVlRaZHdPNXB4cEtObjFZL0tudWFtMUgwakRxejY0Ty9xY3BiRy9y?=
 =?utf-8?Q?tIHQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3942e6c4-4144-4abd-852c-08dccd363553
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 23:06:28.7966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nsayRLAJQiG7gIMdvwObI/fUemXayp0csQFdOHe6vzSYOfSFXdwqUXTeKYPJfY5C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6820
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



On 2024-09-04 18:21, Mikhail Gavrilov wrote:
> On Wed, Sep 4, 2024 at 4:15 AM Leo Li <sunpeng.li@amd.com> wrote:
>> Hi Mike,
>>
>> Super sorry for the ridiculous wait. Your first two emails slipped by my inbox,
>> which is really silly, given I'm first in the to field...
>>
>> Thanks for bisecting and finding a free game to reproduce it on. I did not have
>> luck reproducing this today, but I am on sway and not gnome. While I get gnome
>> set up, will you be able to test which one of these reverts fixes the hang for
>> you? Whether just 1/2 is enough, or both 1/2 and 2/2 is required?
>>
>> I applied them on top of Linus's v6.11-rc6 tag, so hopefully they'll git am
>> cleanly for you:
>>
>> 1/2:
>> https://gist.github.com/leeonadoh/69147b5fa8d815b39c5f4c3e005cca28#file-0001-revert-drm-amd-display-move-primary-plane-zpos-highe-patch
>> 2/2:
>> https://gist.github.com/leeonadoh/69147b5fa8d815b39c5f4c3e005cca28#file-0002-revert-drm-amd-display-introduce-overlay-cursor-mode-patch
>>
> 
> The first patch is not enough.
> Yes, it fixes the system hang when I launch the game "Find the Orange Narwhal".
> But it does not fix the issue completely.
> Some RenPy games still can lead the system to hang.
> For example "Innocence Or Money Season 1"
> https://store.steampowered.com/app/1958390/Innocence_Or_Money_Season_1__Episodes_1_to_3/
> on the language selection screen.
> 
> Unfortunately the kernel is not builded with both patches.
> I have got compilation error after applying second patch:
> 
>    CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/chid.o
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In
> function ‘amdgpu_dm_atomic_check’:
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:11003:69:
> error: unused variable ‘new_cursor_state’ [-Werror=unused-variable]
> 11003 |         struct drm_plane_state *old_plane_state,
> *new_plane_state, *new_cursor_state;

Can you delete ", new_cursor_state" on that line and try again? Seems to be a
unused variable warning being elevated to an error.

Thanks,
Leo

>        |
>       ^~~~~~~~~~~~~~~~
>    CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/conversion.o
> ***
>    CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.o
> cc1: all warnings being treated as errors
>    CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.o
>    CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.o
>    CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ad102.o
>    CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.o
>    CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/clk_mgr.o
>    CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv40.o
>    CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_clk_mgr.o
> make[6]: *** [scripts/Makefile.build:244:
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.o] Error 1
> make[6]: *** Waiting for unfinished jobs....
>    CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.o
> ***
> make[5]: *** [scripts/Makefile.build:485: drivers/gpu/drm/amd/amdgpu] Error 2
> make[4]: *** [scripts/Makefile.build:485: drivers/gpu/drm] Error 2
> make[3]: *** [scripts/Makefile.build:485: drivers/gpu] Error 2
> make[2]: *** [scripts/Makefile.build:485: drivers] Error 2
> make[1]: *** [/home/mikhail/packaging-work/git/linux-3/Makefile:1925: .] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
> 
