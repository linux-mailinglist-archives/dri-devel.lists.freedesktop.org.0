Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64162C89C67
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 13:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FA710E5AF;
	Wed, 26 Nov 2025 12:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sd42DJhm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011024.outbound.protection.outlook.com [52.101.62.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE76310E5AF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 12:31:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3H5s/JTVxHoGM8o5UwRleJq0RD80vPBso2/gGE/wqbK8YjMvJJgMhjwmXKgQBa0hwE5G7rZk/e0o/9HUEzeUd6hytHUyB1Ur+wfq49gHkQyZc2cJQWJW42R9rU2pZ2roPKH3vy2l9b2rmhOL3EwDtTKFNMceHG/p7th/A0wn6iefqYSJ5BDfZqWYTgXSE9x838GcOE9XGG/hgv2mSyybNNb+njMvGXgpjkc9cHt7MsygIX6JyZhpYWKAoydm1iY0GnTb6jEH3TOVTgH5s3WV+pnQO5hndIXpGn6piT+Nz8OUlSkgDpS6VXkdUbDCrTWSk8jU3ak13gtIVn1re+OfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnf3hDC4TQZSjTLu2WaYZXNbBR1/F+a8GMm7QLrJbv8=;
 b=AIyWbhfUMXFRl4XS5Sx6YH1mY5qHItavTHPeKEUyIdUXnRox0gGeJonOhHKOqutLZAHE2/rC3ngzSUD7O8lDndIFR/ZbrOnCtDqipgg7EFRALp2NKZb5Yz8K3UXtf0R15+0i0ocDIJ1peCfE4mKSv1pm5QA8r49XkUzPCQRH2Xy9TfBZS1TzpphH5glI0/JvFGi/+0eBEstGI1Gl/usojD/cLn1tJtAha358zwKUu6AzkvZZt34uaTwDzfVFH5fRT6gcbse6n7AhBLNuXO9OOG849TL3IJ6Ip5SbEvoz3xcbQ8+m7JyW0xji0DpE2lvERFEm8BzrjnEL31ZMxK1DEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnf3hDC4TQZSjTLu2WaYZXNbBR1/F+a8GMm7QLrJbv8=;
 b=sd42DJhmQKzXHGPvK2t03KwjRUPIrCC+Ir3NQPiNKZHnonNqCS9tqZzIR7ReHu008lYht9W+fHPeaxe2p1Vkp69dRaWXIMENtzWBP4eJrgJGNHyu/AFgRBkGVNLuU8M1dP5Dif9mKkohLP1YM9muGEiofnJb9eviV5Ej6KynnfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7278.namprd12.prod.outlook.com (2603:10b6:510:222::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 12:31:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 12:31:27 +0000
Message-ID: <207d50fe-eef3-4baa-97a7-567598e56b55@amd.com>
Date: Wed, 26 Nov 2025 13:31:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dma-buf/fence: give some reasonable maximum signaling
 timeout
To: Lucas Stach <l.stach@pengutronix.de>, phasta@kernel.org,
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, faith@gfxstrand.net,
 sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
References: <20251120150018.27385-1-christian.koenig@amd.com>
 <20251120150018.27385-2-christian.koenig@amd.com>
 <380012b9d6f0e9ee3c2f125cfe2f37f65c1979e0.camel@mailbox.org>
 <b46913b6-fe61-48cd-a9ca-aa2fe3a12b63@amd.com>
 <1c1a14d42d0a4a25ebce26a2af0a61dc1b7813fc.camel@mailbox.org>
 <508ff709-0f05-4982-8e15-5fea3bbd12e7@amd.com>
 <c2b571a7e74f86c6cb95bebd11274447c3080df9.camel@mailbox.org>
 <52d484c5-6dfb-4e2f-9caa-a61cf1d94801@amd.com>
 <e2c006ca81081ee1afa00b1b52a035c28a267e0f.camel@pengutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e2c006ca81081ee1afa00b1b52a035c28a267e0f.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0385.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 520fe055-8a83-4c91-fe13-08de2ce7b87e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zi9WdVRzSUlVQlJ1ZHJOczV3Nk9lRDgvQTRVZmpPTmhwNGl2YThWNE5MMVUv?=
 =?utf-8?B?bUNCY3RHdVdWaG96NkRlait4OTlCRTNzaWd4ck1Bck1LNWZ6WXFueE9ybTBv?=
 =?utf-8?B?VjV0Q1J1dFJsMG5hUHR1SjNXUWY1NnlhUEE2aHR2MlhCOFhNemZya01yRFkz?=
 =?utf-8?B?dmRYTFBkbmgyVFI3U2ttam80U00wUSt4ZFd3VEpPamdCQzNlUkdmNUxEcjJO?=
 =?utf-8?B?UDVja095VGQ4NFBQZ3dtbWY2SFNNQi9pSURPTUlJVWFHZWhFV2lETzVQd0do?=
 =?utf-8?B?MlE3M3MzUUM2Q2l1RUhML0VTWTU5ZGxhVndaR0FNb0lndk5vMENMczZwdjh2?=
 =?utf-8?B?SHMxVHNtb3VLQ3pCckdKVGRKaGZWaEpQRXkzMElLazNFR2wvK3EvVzdUcGM2?=
 =?utf-8?B?WitYU01veVhiSjFzKzFQM21nOG1BRWpMWVpkRjlBeWZHWWtIT0wrL3MxaXZz?=
 =?utf-8?B?bGpsQnZhbHNqV1RseksyMXdzNEdNcmxTZml4bGRRYUVhK2FvNVg0V2VDQnkx?=
 =?utf-8?B?WFlEY2o2ekNiQkJyV1RucFR3amtRMkw1dDI4VFl6VWlTMHU5T1U1dVhrbXk3?=
 =?utf-8?B?VUp4TkZMV1RuRFdVUEJ6aHJ5NTgyVm1XcXRKdWY1c0ZPT3hVWlcxb1pDT3Bz?=
 =?utf-8?B?YnNqdytJWWpDTVhCbFp3d1RuSjlhSThMU0V4ODlkOUFodE1HUTltblpnYjdo?=
 =?utf-8?B?Z3JhTS9LUVlRRHlpazNHTksyWHJGWnh1V2oxNnBJM3pCNU13R0xRYTVteXNq?=
 =?utf-8?B?djBwR0dodlBKUnY2YVYwYTRZMVliYUF4Z01HdzNKUEhCV1lsM2JYYnFlakJ3?=
 =?utf-8?B?TTJ0WFVpSUJ4cUpIU3Y0Qkk5eDVBNldLS3Zsc3R5T2dlUGYrODB3cVdad3Bh?=
 =?utf-8?B?SzRUZmV4bkQ1NEt0dFRKc0FQbUFiSHlVSkU1Zko5Y3VnS0Y3b05sNlRPbmdX?=
 =?utf-8?B?TC9mN010Qk4xdjZ1WTI3eXV2cG9WenNpTVFWVU9maWcweWpKVkdWRW9xVlA3?=
 =?utf-8?B?R2s4d0NKSWtUekxXc2l4cStOUzJ5ZUZjWWQwSStFc1ZpMlVocU8rcFBUNm9B?=
 =?utf-8?B?WVVqYVY2VmhXeVZjcWhtaHY1OGpLcjQxZ1R0YmFBeGxCSWtuYjFxZENtQlhV?=
 =?utf-8?B?SnpEdGFQUGNBT0FtYmo3ZzZrNEpKOUFhVTRydUdRTXFQYmdvYWtXZDRVYjMx?=
 =?utf-8?B?dEdwZ0J5MjNiUTQxNGJpcHdvb1hHeTBlcVBleFRoMFY2bWRzbXlFeldNN0dR?=
 =?utf-8?B?WmFZa1h5bHlDSHV3YjJldjh1K1BpVWxtUnRsMkZJNGRQZy9oQzYwNXRmM29S?=
 =?utf-8?B?T01XNHlyTXkzRUJxazFiaG9pbG41NnlxWks2ci9jQnJIekw5ZG8rekF1cUhr?=
 =?utf-8?B?c0pTMDlmWmE0YWREUTEzWmw4cEhHcHV0dnlnMVNXTm94TGhDMHlzZGp3YWs2?=
 =?utf-8?B?aHdZWWcxUmplTm82dWdhNDQ5SDNtUEVqdTRYKy9kc0FuNTlJV0RqbkNIYzU4?=
 =?utf-8?B?V0xNZGNtaVZEQmd1U283TGx3TVMwek1WNWJlYmRJSnp0Z3NIdHJJQkt4dTJ5?=
 =?utf-8?B?anJ4cWk5eGV6Vi9qOGN0REV6NkV1NXUyeFhXKzI0ZTN1M0djOGFqMEZBZ09Q?=
 =?utf-8?B?S1h2aUxGci82ZjJLTDZzNWVEbWF5d3FWOWRhT1VaVlBoZ3hIczNJVkpJdEJO?=
 =?utf-8?B?S2ZoU1prdlVEejhRN3JhQUpIRE1FMUhSVDl4SGZTYzQ5bHBjaHNwaW5FQVN1?=
 =?utf-8?B?OWZtT1h3enI4akhMcU84QVpyTFErdkZnOUxYL3crYlozU3VseUpMOHN4blc5?=
 =?utf-8?B?SzdwKzJOdTBYRlZtcUc5S1Y0NTRKdVljVnNMS0hJVU1QNWlWczVMYkRWekl6?=
 =?utf-8?B?Rkw1TldaNzZ5ZVZhZ1dMYzRXNm5mQjhaNjZiakpPRGtUNlRJQ1RyZDRTM3li?=
 =?utf-8?Q?zltleejAlJuKdEavpONrqsQE+zR4welQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW1UQnBzNm5qZEFPUFFXZ3dFYnR5OEJ1aXBmYU1NUmRMdVQ3VHErUVhjRGJO?=
 =?utf-8?B?TzlKQUc1YVI3NmNqTTRwazIvKytWbWZEZzVXU3IyQUM0TjNBSkVpbTdUMVRh?=
 =?utf-8?B?b29wQnJnWGZRZWNSRDBlek5RcHRDNlNObGxvOGwzSDlpdUZ6amNCOWMzVWFO?=
 =?utf-8?B?WTRsWHB0Z1psZVNyMEFZWDlQMSt0U2ZJU2VDcGZpT056QnJwdlA4eU5BbWtV?=
 =?utf-8?B?cjdaT0R5a0ZSUkxqNGQzOVhkaWFQVExPWkhpMS9lbWlSK0VMd1FpbmdoNTNj?=
 =?utf-8?B?a256RFJ3aUp3dzFsUkx0eEw1V3dsdjNXSFRMbEREd3Q3Z2d6eWVLMjhHZWEz?=
 =?utf-8?B?QXNCc05OQ1dFR2dyRklwZE9CUU9lYXd4RXFSQ01RWXVEMGQzb21aS1Q1Mm8z?=
 =?utf-8?B?WEQ3MjBmYzB5QlkraUtyUCtHcTMzT2dOdzdqMy93WWl2NEZsV1BKc0lacXYx?=
 =?utf-8?B?UklHdDMyaVBad01RQ0N4Z0VZajdTbjl0SGl1aDFXMDJodzlxTkJtenIvcTB2?=
 =?utf-8?B?d3NJL0ljUzYza1JkZ3RFRDZlUFZacElreVBzbWFwQVhTdmdhLzVFSkpMbzNy?=
 =?utf-8?B?NFhGY3ZuOGQyMGNzYm5zdDAvWm5PTmhHd0s4ODdKcjhKd2hlV0J2cmlyMU5G?=
 =?utf-8?B?MzNlOVlhYnZoZzFIcXc3R1Z6L05wUUF0cFp0ellMM3V6a0MwK1YyRUo2dU12?=
 =?utf-8?B?UUZFNWwzYWxJRjN6ZXc3N25kbHREcEpEeUpOSVAvbTljdVBjQk9zUnFZUEFO?=
 =?utf-8?B?Ujg3OVptampOTE0xNnh3M2x1ditzNmFLL3c2WFd6UTFYVVNNUFFlSWxJMlY4?=
 =?utf-8?B?SGlJR1JZV2tkMVZmNzY2OUhlVkR4NDFEY2pKRjFkUnZWaWlLUUQ2ZEErT0hs?=
 =?utf-8?B?ZUFXb05Cc25PYmtEMXN5djg5Mnk4ZzlEYjVFQjM5TUgyWWtWMm03TUZsdGt5?=
 =?utf-8?B?Wm8rZE5HRWFrWVRnUHgxcDlYZm0yTmZ1YXR0ZzV6N1hFdXJFMjA4SWFONDJl?=
 =?utf-8?B?YW1mdzhBYjRNVFQvUHc1Q0xVd1pPMlJ5VUhqY1Blc1Y3UGFKTVEwQTEwUS9h?=
 =?utf-8?B?ZnBMNnBGOS9pZTcwNzFOdVhtVGhpeUpITE43K2tKZGhzVzJMS1NKZlRSYzZC?=
 =?utf-8?B?YmJuQ2FGM3RnZUgzcWlLQ0RiV2xXRlA5dVJ2TUlzcjY4L20xNGJuK2xOQnVS?=
 =?utf-8?B?eXlLTWZtdzJsTWN5VkwyV1NxUm1hcjBiZGM5QXRwNnU1V21mT0dGaDZmK3Va?=
 =?utf-8?B?OXNTb041ejNycTB1THVkenI5WWFtdGFRSlRwSzZZSEM4UzZEVGpNY29yRCtJ?=
 =?utf-8?B?Q0oybUhuNmt3aEVmT1A4d1Y0YjI3STNhcWJFRDZoYXhjT1ozNytIQ1dpeVhz?=
 =?utf-8?B?Tjc5VU03WTRtLzFDUWtic2lxUVNiM0ZwNWoyWkhMZUovcWlVak9lcmc0WFd5?=
 =?utf-8?B?anRMc01PdDlrdUFqV1hjUzBmdzdiRXN5M0dvNWVQWStjSHpvaDJyWVZRaGdl?=
 =?utf-8?B?U0ZBd2pxRkdGeWRyKzFiUXFYblZOc3hhaS9ydzFSbkpXT1NyeGxxRUZ3N2lJ?=
 =?utf-8?B?SFhyR0RPbS9VRTAxWllhWHFMZlcrZ0tkeWMwNFcwVHVhNzBldE56K3o2WTF5?=
 =?utf-8?B?WFFqYTdqbXlacVZyakF4aG9zcXFuQW5WQ1Fpdk52Z2RHc0Qrd2thaVZNbTBZ?=
 =?utf-8?B?SWp2MEVmZVFVb3JYL00yNlZXRTJoV2dDVWxtQWY3NXJDR2FaaG5CSTZUS2VJ?=
 =?utf-8?B?bmFkcTgwT2c4OTF0M3B4cWVVVGFlQWhZL1ZLcXZXbjlHK0pJcjN1dUM4MEl0?=
 =?utf-8?B?ckl3UHFYTUN5ek1uTC9OcXJiR2IzazBjZ1dsTEMweExBSzQ5aHpzNGVGNnFB?=
 =?utf-8?B?a3loMGxPdXFRN2svK0tXQzEwN08zc3Z0VmVLVjF6dS9oQk1ZSjU2UVdOVzh6?=
 =?utf-8?B?UmdGTW11MlhXSVY3Nk1hVDdkeTJseGsrQm5VNSt4aG9laVA4MUsxVVN1bU1I?=
 =?utf-8?B?RWF5QU15VE5xU1hZMGZhTlZmYUJnaVRXTG1YRkVNYXZBa0JPTHdjQStURVVk?=
 =?utf-8?B?cjU2UllZOFlqZjNVT04vWno2Z1BmUVdZQkpDS0RJWXd5NWMxWUQrZUdHWFZF?=
 =?utf-8?Q?DXDyWPJh6TVxhD/T8xw3tkJY1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 520fe055-8a83-4c91-fe13-08de2ce7b87e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 12:31:27.9113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmWgvtC53e9uvP1k2NpLAduIIuT7TGAJCG3MMFxQhtcrJb8448yGuubtQZ+1rmwh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7278
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

On 11/25/25 18:02, Lucas Stach wrote:
>>> I agree that distinguishing the use case that way is not ideal.
>>> However, who has the knowledge of how the hardware is being used by
>>> customers / users, if not the driver?
>>
>> Well the end user.
>>
>> Maybe we should move the whole timeout topic into the DRM layer or the scheduler component.
>>
>> Something like 2 seconds default (which BTW is the default on Windows as well), which can be overridden on a global, per device, per queue name basis.
>>
>> And 10 seconds maximum with only a warning that a not default timeout is used and everything above 10 seconds taints the kernel and should really only be used for testing/debugging.
> 
> The question really is what you want to do after you hit the (lowered)
> timeout? Users get grumpy if you block things for 10 seconds, but they
> get equally if not more grumpy when you kick out a valid workload that
> just happens to need a lot of GPU time.

Yeah, exactly that summarizes the problem pretty well.

> Fences are only defined to signal eventually, with no real concept of a
> timeout. IMO all timeouts waiting for fences should be long enough to
> only be considered last resort. You may want to give the user some
> indication of a failed fence wait instead of stalling indefinitely, but
> you really only want to do this after a quite long timeout, not in a
> sense of "Sorry, I ran out of patience after 2 seconds".
> 
> Sure memory management depends on fences making forward progress, but
> mm also depends on scheduled writeback making forward progress. You
> don't kick out writeback requests after an arbitrary timeout just
> because the backing storage happens to be loaded heavily.
> 
> This BTW is also why etnaviv has always had a quite short timeout of
> 500ms, with the option to extend the timeout when the GPU is still
> making progress. We don't ever want to shoot down valid workloads (we
> have some that need a few seconds to upload textures, etc on our wimpy
> GPU), but you also don't want to wait multiple seconds until you detect
> a real GPU hang.

That is a really good point. We considered that as well, but then abandoned the idea, see below for the background.

What we could also do is setting a flag on the fence when a process is killed and then waiting for that fence to signal so that it can clean up. Going to prototype that.

> So we use the short scheduler timeout to check in on the GPU and see if
> it is still making progress (for graphics workloads by looking at the
> frontend position within the command buffer and current primitive ID).
> If we can deduce that the GPU is stuck we do the usual reset/recovery
> dance within a reasonable reaction time, acceptable to users hitting a
> real GPU hang. But if the GPU is making progress we will give an
> infinite number of timeout extensions with no global timeout at all,
> only fulfilling the eventual signaling guarantee of the fence.

Well the question is how do you detect *reliable* that there is still forward progress?

I mean with the DMA engines we can trivially submit work which copies petabytes and needs hours or even a day to complete.

Without a global timeout that is a really nice deny of service attack against the system if you don't catch that.

Thanks,
Christian.

> 
> Regards,
> Lucas

