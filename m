Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GvP0EsoGl2lWtwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 13:49:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D9115EB01
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 13:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122B610E14D;
	Thu, 19 Feb 2026 12:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NNiFOeEI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012008.outbound.protection.outlook.com [52.101.43.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF3110E14D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 12:49:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuNu9Ppl2MjKf6HWeCyEXk9LhCAWH8GvEVPhsB0tu/3HuH+//NIj3BYMEuEGEMLitP97rwesjt0dzvqGjyPWGtvZWCsCUupu8wOyQA7a1PIeSsqVB0fAjYWhXPO7Dj7DR1QEI3mNsD9sKtT0rSLm8gmQz8YTjQFKM3vAmIlbmcbM8ECbdvF2xxplZ40PJ8aFriYjHnSItWfWM5X1yx/ohEDg38zUKo5wMcdQPOlYC6jRM2LGMa4vpwVj58IKraJAu9MqtYLQ8fuCvnY+u+SMJkW9RWLPqaaC9lZrJtRkfkkTFsj67iLy42JZEulID4IxkS8wh9Sq5OE/dsianYHioA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omLmkGEJjmpqyWoUjKGDA6Oa1iQhSWT/QQDYkllHxwk=;
 b=eM2ywDQ1L4SIf4mSv2Y/boBLCX/Ii3X+yAOx6Z9SVmpE3raW+yC42UakN7fmSzUSe0yBJbFTRlhvNLR1OzSbh4+uzn3mS9hO61UQnTaF6tTu0CDkzvkE6QBvdRyilmJHAfhdTdnWt5hXYARO6ec2Lg7DLxs73O0xTCbp5vagDk5DxAGmVL8sFC7RGVkqD0rSHPXS9DP1bqi3QjQ2r5uddSh9jWITYxFJxNTFSbpIALulH4E/lsfq+MrZHbgHcbkmCcfB8zVKsnHxRtVgCcfksVvZw+deGquNCIoOWYtfdN093FO7ij6Hs/HlzTPGhSQQ9A+BJSLjAXH+iCQ41Uxvyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omLmkGEJjmpqyWoUjKGDA6Oa1iQhSWT/QQDYkllHxwk=;
 b=NNiFOeEI8QCyvDCHNtLqxbAxKepU91pr8ycy8+gdpWxBxHXzLfUCYOTe/30OaxdUT7Whi5v6hRr14fiaBvRIjaxCe5KOKgs0FuH4zhaBLT6PadgigvqpVAxZJY9He8AqM6ib/fx8uRAVXxTx1GRTaRJzxI4mnQov7ec3jpkFSdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB9541.namprd12.prod.outlook.com (2603:10b6:610:27e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 12:49:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.008; Thu, 19 Feb 2026
 12:49:05 +0000
Message-ID: <78a4d1de-0e0c-486a-8054-1a89d6db15f0@amd.com>
Date: Thu, 19 Feb 2026 13:49:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dma-buf: protected fence ops by RCU v5
To: phasta@kernel.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-2-christian.koenig@amd.com>
 <f1345723cc5a61cdec5a6f168f71a323b822b7e2.camel@mailbox.org>
 <f357c2fc-3c72-42ac-b079-849222de4c6e@gmail.com>
 <9f929535744546bcb4eed26f6c27b4497ebc37bb.camel@mailbox.org>
 <53a84ddb-9202-48bb-bcb1-e76ee3097eb7@amd.com>
 <4d5d718fb646f8723ab31452b906f9bfee029e9f.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4d5d718fb646f8723ab31452b906f9bfee029e9f.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB9541:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd009f4-7ea0-4234-c4ef-08de6fb543e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1RMOFhvUjdCQ0Fjc3ZEYUNZcVcxaytabS9aOVZDbU0wYXQyTzVod1djajBr?=
 =?utf-8?B?SW5hOHpBYVpnaVZrVHowalFLYzRDc0tTaVYyeithYjVPcnh6cmQreDhFTjdF?=
 =?utf-8?B?dExvbDVTcXYyS0FWQjhydFFxWm9vOE5HQ2tiTFBUWmM2YTRYdlJkejFhQksv?=
 =?utf-8?B?S1lLL2UvOVBrN2ZFU2FOQnVFc3pUZktCcEoyakNOaDdtZjRWNGZFc1VGWmVZ?=
 =?utf-8?B?dExzQXppTE5vVHk1OW9DN09VakFIMkpTbTZ6QjZabnJjR1dzOThhVXp6Y2U0?=
 =?utf-8?B?R1B6bzZuVS9nSHRHTmFKQXQ2ZWVQMWtZVU5ESVUvYUxJRnVYSFFqUXEwT294?=
 =?utf-8?B?K0VBWml3Z2dsZmo4TkJFdjV5a3hERnMxVjlqZytEbmdNVnRMWVNadUdZc0tX?=
 =?utf-8?B?ZjZhTldFTm1wZjFxVlVPc3U1ZUFLNEk1WjZpYlhSWXArMTdVU1NlSVhXYXd5?=
 =?utf-8?B?OHdZd2V4bk9xZmVJK0FBS3p1dWtHaElqWGpOanBsdVIreEVxNGhrMkJtcTg4?=
 =?utf-8?B?bVpYMks2b05EWjhZM3FvbmlhTzlJemJBWHBkSWY1N1FLSVJEMjF1eEpRNFRm?=
 =?utf-8?B?clNnayswazhNT05wZkJIWU1oazE5K3pBelU5K25KRk5nSmUrZlBZUkNoRXVW?=
 =?utf-8?B?SG83RUdteHJOZWVRZG4wcTl5UkJySlRsblBmU3NuVGZZb3EvOEIydU90cE8x?=
 =?utf-8?B?SGN2cjdNUGdWM1pLR3hGVFNpaGJLeWZ1Rm84T1ZDWXliajFkMm5PU3ZobnpJ?=
 =?utf-8?B?TytPQjFrK2Ryd3pXMm9xeUV6d1lac3Jxc2wwMno5Y1lpRDltaUpGaUN6dWJX?=
 =?utf-8?B?aXg5RTJMVmFYT3BIdHpPYnZWdjYwWDF1YU8xRVNjRHFqY0lNMG05MVpCRmRU?=
 =?utf-8?B?TExrS1FnOUpuajVNN3FLdGtzL0toL0htQ1duZ3F5RFM1eEV1NTJhcFFuT3VB?=
 =?utf-8?B?b09FU2NKRHNFOEUrN3Ruck1VS21xdFEwTmMzQVh2cDNVVHFHQk5abGRBQkVG?=
 =?utf-8?B?OEM1WTRVMGdiMVkwUWg5QWpaRWNvdTJpOVVsQjFKWUZJTkp6c0ZmWHJIUHFZ?=
 =?utf-8?B?UFR1NTQzUE5wRUxFQ2pjVGdNelRrSlBjUGJnR2dSRzZ6cE4ySzVLZWpVUHpH?=
 =?utf-8?B?WGZ1YURaTHoxUjFja1dZeDFWd3FTWGFMK2dKcGJuV01zSmV5VDgwbU5aY0dz?=
 =?utf-8?B?MFhIQnkzUkp1a1IxbWJtR3Q2WlB4M3hDWEl6NTdrVmk1eVdTNTI0ZWM3L2JC?=
 =?utf-8?B?YWZQU1JRRUZPaSsxajB2b2pzTjJ1YkhHT1E5b3NCWExlV3VIVTdmcjlHSGhw?=
 =?utf-8?B?cXJ6aWpBVnp3NXRVSlFsZWZCdndleVo4YWNmdTB1UDVqMGo4QzFFcEJZN2FI?=
 =?utf-8?B?MldWeUJNMTl6aDVsaURpU0ZNUTdXV1FoUFVWNnpZQmxVT2RJMlcvbkFyY2dH?=
 =?utf-8?B?M0FwT2dJU3BjOHA2bURFak0zb1Nmb2RaQ2dUZmNpcmtBaHZ4a1dGTUVkSkpF?=
 =?utf-8?B?WXBMcFVDb3FObDFjM2Q0K3FoQ2lLaVVkcnNMWlo2K1ZDaVcyZlU3bjRzM1Uv?=
 =?utf-8?B?V2F0SEVvMllBK3ZtUzJCRmxwR093b1FpK1czK3prREE5YXQrQTl4TmFySUxZ?=
 =?utf-8?B?N2I3TmVsVWsxbHFpYTk4R3UxUk5oZVdqYTlGRjZLbE9EaE14bEQrSnRtUG9N?=
 =?utf-8?B?amhlVXNFWVdXbzFNTWs1cklXam9YSEVlNlVIQ3grcTRRYnBWSzB3c2ltN3da?=
 =?utf-8?B?WlZSdU1OQStDVnhEZDY5aVVCVzZFdGw1MTM5Si85bE1UT0g1VVlGU1ZXcXJV?=
 =?utf-8?B?ZUQ0Q0hIZTZHSk9SYnU1MVpjRUxRdE1TVWhJVFpQQVoxNkVRbkJGREh0Q3NH?=
 =?utf-8?B?R1RwQ2NWa2t6c2tsVVhrVEM2L084R0xWYkhSaUFKbmtRb2Y3aWk2YlEyZmlB?=
 =?utf-8?B?TWU1RjRZMXZGdHo2MHM5TXljcmYwWkVIOW9WV1A2WHdUV0NTVmh4NVM1UGZR?=
 =?utf-8?B?VC9EUGJFL2crNDRIL2dNQU9UdDdSTFMzNEZvNm4yUFlHQU9yYzRkVHMzL3JV?=
 =?utf-8?B?OWMwdUlyVVl6S085U2dRTzAzU1N2blpSekxmK3p2QVFFblFRMkI2dlY3QTVD?=
 =?utf-8?Q?2Noo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkVaYk1yZmNRalAyV1pOSk0xLzdNREx6blNBMTV6N2IzaDlnNGliZEczT1hS?=
 =?utf-8?B?bXRyZzVZYmZsYVc3S1JEV3M2T2pyM2YyQzd5L3JYMmlEWDh1Wnk3azF1UVp1?=
 =?utf-8?B?QWJKeGNOQkdhRW4xR2FvTlAzczZ6QjRIcURHS3dyWEUzUE1xQVpDRzhWUS8r?=
 =?utf-8?B?Vk5sbExaZU4vbnA4MDhaOHpuaEhpaXdoMTRmL3QwRGo3eS9hQWc3WGplaGdV?=
 =?utf-8?B?MkpWM092dkR2R2F3QURhTWtsZWhQK2hLY1FwWUZoZXJjZlBHbUhBMWlZcHFR?=
 =?utf-8?B?YkpzYTlRTjVjOTdURUYxUTYzL2M5QUF1eldNbUNTSnVHL0JMMmd2KzU0TTJw?=
 =?utf-8?B?emIxa1pBOGc3ajZYbldFaW0wYVJQV05kQTV1QnoyU1JJMnp0NXlMSU1IM2Rm?=
 =?utf-8?B?OWZEYTMzQ2NJcUE5YVFPUjcyYlJLS2tVMmxHeTZLMmhJa3ExRzNBdzJMRVFw?=
 =?utf-8?B?SjBUQitMYWtWU3orejg5dGJBdWp1ZzIzS2tvM3J5KzJCNHI5dHpTYVpaOWNr?=
 =?utf-8?B?SjI4cXhGRGpRZmRJUmFGOVIzTnYxYWk1M2JyL25HZjlGUlFhbVJhemRBdDlv?=
 =?utf-8?B?TXFLRVdWTXFRYURaK010bEZNRnlMK2grV2pIeDYwRE9hSTRjK25HNkZtRWVs?=
 =?utf-8?B?a3N1UWJ0eTBnSjd4NzJXa0RWOEtNTjJ6T3pzT04xYVIrVm53ejBxZjdtMDVB?=
 =?utf-8?B?V1VwSnJGc2M5eGVtaEtzNDRSYW53ZHZ2R1VjTlcxbVBocDdxTnhPY1prUlVY?=
 =?utf-8?B?RVJhRkxReHJrUzBuY2ViMUNWUjdTV1diOHZlZkkvRy9qN0ZGT0Jlbm1jRy9v?=
 =?utf-8?B?WXNRLzczR0FyU0d2NXNNVFVQZTR5YUdmNGtSKzdSR0ZqVkVTNHJLN3JvS2I0?=
 =?utf-8?B?NmdmTi8rR1VTYjVCSFlzVjhGWkZNSy90UzVScERrSGZmM2RINzZ2QlJ1UWZy?=
 =?utf-8?B?QWxwaUFZYmk5T0tuNDFYUE1jZDVxZ2ZLdjcxYllnQmNVemJXdm13aktZQjBh?=
 =?utf-8?B?a0VreXo4NXYxM0xZcW4rd3NVNEtDUUhzaEZPUHhtbmErdjgxclkvQ0g3UmZE?=
 =?utf-8?B?MEdZT2xESUduU3RxSFhURllQS1BRUXRyaWxMWGFUN1A5MUhUejhENlk3K0ZR?=
 =?utf-8?B?a004ZUxzMEowMFFXTXdsRDFVOEVabVQ2OUZkZVpydG9hY2VIMXZWenNhKzlu?=
 =?utf-8?B?dGxFdUtqUDlLTjl2WlpIT3UwK04zYWFWYUtvTW56TzZpSm12VkZ2WkpWTHNO?=
 =?utf-8?B?ZzRPc2l5OEtDRnlheVdBVFkrZWFScHBQYjQ3alBLcWwzTDZMY3NPUXArV2Jt?=
 =?utf-8?B?akp1S0dUZnNyTXh3WWJackJoU3Z2dkhYQmpPV0tBZVZzbS9DejdoRnJTbEd5?=
 =?utf-8?B?ZGFOWGkyQUI2SU54bU1rd25YNE8ydTVZWDNUb0NwWVpKM1cwNXM2Y1hkUWlE?=
 =?utf-8?B?VjhaOEpPbk0vS2dTOHIvRVVPcmlsYWp5RGY0dmI2M1NnN0hIUi9tV2NZNXFq?=
 =?utf-8?B?ZERqYjFxUW1XSnRoR0U4dnRiMUxUUml0eTdoTTZRYTY3QVpDTlM0Z1J0VmpD?=
 =?utf-8?B?NnNrbHZzc2J4d1pNSHZVYUVHR05CcEJTYmVpdVE1OUZRYzZpOWtqMG5UTUE4?=
 =?utf-8?B?NnhIblZucEQrVS9WaDhHbHQ5dmxpMkRCMFR4U21aVnFRMTQxVWZ5UExsMHlL?=
 =?utf-8?B?eFZ5aUlxS25qekdwVmpxMDJ5OU51akJ1ZHJlTnJSQXRJeTcwTGIyRTlRR1U4?=
 =?utf-8?B?N2h4S3VJZDRqbUQ0YSsyaVd6T1hPdHcyNjBFZ0ZxMGN3a0dJTlhWcVBkTVhL?=
 =?utf-8?B?UEV4aDdjcmZiQUtyZEFEYkh0YmYyV1dPaktXSE5wTUc3MG9IZmdaYnhISk5u?=
 =?utf-8?B?aURybzFPdllJY0o4VkdZZW5waVpIWmdEejA3LzIwaWg2dTgxTWNhdjQ3dzFv?=
 =?utf-8?B?SjlQUDZvM3VuRm5EUnBaMmhCN2lZTVpHdFZEYnNrNDVpUERXRXViN3NYYlA4?=
 =?utf-8?B?aUNtR3NRWUsyVlEvTkZiR2NIVVJkM2VvZXhaUW9iVksrK3h5cGN2M0FwV2VH?=
 =?utf-8?B?OE9sRnBaN0NlRDhmZU1KWjJGQjdpTnN6VUNTeEdSWlJwYVdmWndpWjVITW16?=
 =?utf-8?B?SjZTblJPeDJuaTR6Ym5OWDNzSGV5QlFWM0tkTHkzdmNZZXA1Tm9jSGNDR0p0?=
 =?utf-8?B?MkFXaUhrUjh2aTBQQldoaVM5eTJ5bjRFaXhBTkY4Y0hvM2NjUWF5bGNzSlNB?=
 =?utf-8?B?THNFenlpRTNrNVJTZzRtL2M5ZHl5WGtIQVZ3TFRrY1R2dGFIN0hrQi9PSXZ3?=
 =?utf-8?Q?ZcQ2gY+HTrVFDjji71?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd009f4-7ea0-4234-c4ef-08de6fb543e9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 12:49:05.5661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKdWY1bXlMytcG6jqoaWcxBDF1Ex7+mY7O61cSRgX3pNGx/5Qtrz4y8PrkfgxqxL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9541
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 98D9115EB01
X-Rspamd-Action: no action

On 2/19/26 11:35, Philipp Stanner wrote:
> On Thu, 2026-02-19 at 11:23 +0100, Christian König wrote:
>> On 2/12/26 09:56, Philipp Stanner wrote:
>>>>>> @@ -454,13 +465,19 @@ dma_fence_test_signaled_flag(struct dma_fence *fence)
>>>>>>  static inline bool
>>>>>>  dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>>>>  {
>>>>>> +	const struct dma_fence_ops *ops;
>>>>>> +
>>>>>>  	if (dma_fence_test_signaled_flag(fence))
>>>>>>  		return true;
>>>>>>  
>>>>>> -	if (fence->ops->signaled && fence->ops->signaled(fence)) {
>>>>>> +	rcu_read_lock();
>>>>>> +	ops = rcu_dereference(fence->ops);
>>>>>> +	if (ops->signaled && ops->signaled(fence)) {
>>>>>
>>>>> Maybe you can educate me a bit about RCU here – couldn't this still
>>>>> race? If the ops were unloaded before you take rcu_read_lock(),
>>>>> rcu_dereference() would give you an invalid pointer here since you
>>>>> don't check for !ops, no?
>>>>
>>>> Perfectly correct thinking, yes.
>>>>
>>>> But the check for !ops is added in patch #2 when we actually start to set ops = NULL when the fence signals.
>>>>
>>>> I intentionally separated that because it is basically the second step in making the solution to detach the fence ops from the module by RCU work.
>>>>
>>>> We could merge the two patches together, but I think the separation actually makes sense should anybody start to complain about the additional RCU overhead.
>>>>
>>>
>>> Alright, makes sense. However the above does not read correct..
>>>
>>> But then my question would be: What's the purpose of this patch, what
>>> does it solve or address atomically?
>>
>> Adding the RCU annotation and related logic, e.g. rcu_read_lock()/rcu_read_unlock()/rcu_dereference() etc...
>>
>> This allows the automated statically RCU checker to validate what we do here and point out potential mistakes.
>>
>> Additional to that should adding the rcu_read_lock() protection cause performance problems it will bisect to this patch here alone.
> 
> Alright, thx for the info. Very useful
> 
>>
>>> Adding RCU here does not yet change behavior and it does not solve the
>>> unloading problem, does it?
>>
>> Nope, no functional behavior change. It's purely to get the automated checkers going.
>>
>>> If it's a mere preperational step and the patches should not be merged,
>>> I'd guard the above with a simple comment like "Cleanup preparation.
>>> 'ops' can yet not be NULL, but this will be the case subsequently."
>>
>> A comment added in this patch and removed in the next one? Na, that sounds like overkill to me.
> 
> ACK.
> But then lets do a normalkill by adding the info you provided above
> into the commit message, shall we? ^_^
> 
> "At first glance it is counter intuitive to protect a constant function
> pointer table by RCU, but this allows modules providing the function
> table to unload by waiting for an RCU grace period."
> 
> This doesn't reveal what the patch is actually about, just that
> something is counter-intuitive to someone already very familiar with
> the series' intent and the code's deeper background :)
> 
> "This or that about dma_fence shall be cleaned up in subsequent
> patches. To prepare for that, add … which allows the RCU checker to
> validate …"

I've already added the sentence "...As first step to solve this issue protect the fence ops by RCU." in the commit message to make it clear that this is not a full solution to the issue.

> *Philipp reads that*: ["Ah, this patch is in preparation and allows the
> RCU checker to validate everything!"]

Yeah, mentioning the RCU checker is clearly a good idea. Going to add that.

Christian.

> 
> ;p
> 
> P.

