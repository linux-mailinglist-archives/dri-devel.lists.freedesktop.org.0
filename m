Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167D2CB73B4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 22:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC51010E300;
	Thu, 11 Dec 2025 21:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xmxbc1RX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010018.outbound.protection.outlook.com [52.101.61.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBFF10E300
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 21:49:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNfgLwZmof2EgloOvYP6isBLxcZLM32fMOmDnCQw+XPXxTte3AaiUuev3cnzSWIamnFYZEjCIRXXwb06dpO6vgndMqmsBz4BAA4tawHmb0lHlKBEMK74IXS7vL5E5OitCOxYEo6Pea5qIqCd698AvVXFbUjoYg8NR8omq7FsTW0rYsqmTQy+UWra/7XO/7KB3mzFePk2DYh9hMEWQZJnMoUhnCbx3QeOrLKpi1i1kxFmBVsKEjCAnWSS/DeAJGmouMsCIu9Pu1/LjhMNWzTVIXSlJ1KvLPUHGspH8wXGLEJvGHYdvWXQVRyBKIjhCOMd+KsrNIEp7jbb4nz5xnmYzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dm6kfhE03KFpIunOmpOYj5iU3zN3LZlnjtZAu9H3bg=;
 b=Qs8AZtqkDBZO13o/+NjYBuNOXsApzeDhFMPQfItTLQPw+H+dzUg6KcWRhi8EM4ixYbnAu8ev77LrL50kzpEKcS3tFqj3gacbjIYvStdT7Y/LDEkj+s5B+g2Ku6X52r1VUHk0aQdd5eSPjc6T5CkGhHHgBQN2gPU5bfheMcSQwWB4iOfAehkSAsJnPFzhpyiqU9BbQrBgNYCJElXq3f9blAkrK3QqLwLb5vkMT96lUxsiAh454ne9LPhnjSSMwfg6cGjgV1BvHAXlErbQ7wiHbbywLSWZ+oNIKAHOXlvX3mQulvZLC6MWpZrUdN8eW2ipRsS+xCSSeDxHkFU50ddEKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dm6kfhE03KFpIunOmpOYj5iU3zN3LZlnjtZAu9H3bg=;
 b=xmxbc1RXa5vhWQHMdIkcSmVm4I2zShMWuQUxpzViwEFc6DaNGCj6i9cMdy7/ultOBAJNTTbpRQAFmsqFZftdRuwt/oWlWlbN1urhnyq+ghPjQOe6krMx2DMxZ4OFG/JEhRP5ouUHFU+qttdiQsjBHhgEsjm3YYvV5xsWWd5DGpY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB6607.namprd12.prod.outlook.com (2603:10b6:8:d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 21:48:58 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 21:48:53 +0000
Message-ID: <b6286dcf-d9a4-4dbd-b8e4-5b0640c7dae5@amd.com>
Date: Thu, 11 Dec 2025 15:48:00 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix race where send ring appears full
 due to delayed head update
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251211045125.1724604-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251211045125.1724604-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0121.namprd11.prod.outlook.com
 (2603:10b6:806:131::6) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: 928dbf3c-1c0b-411a-1585-08de38ff13d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGhkclB3Z0Z3R2tRMEQ3ZnMwKzFWZHovSE0rdHM3VXhVZUNBU1lRSXJuMXE0?=
 =?utf-8?B?djhaYjduZXJxVFhIRWt3bGRJcXUybzlaOGo2T2xmbGVyUXh3bUQvZk1TKy9Y?=
 =?utf-8?B?K0VKQWZVbVRUS0VZU04vdHN2M2trTEF1THQ0dDVhNi9OWWdRbFNjdkZWWDRR?=
 =?utf-8?B?MHpHVU9RL3ZrU3hqM29yUi8wSG1PSFZVc3BSQmZ5SDFTRGkrKzBkcW9ydlZh?=
 =?utf-8?B?ZkFlV2gySlBiektrNkRkWXRxZzRhWHNNQWZsNmY0NnJVUlFkdzlnaW5kdzcz?=
 =?utf-8?B?RnhtUml6V0tjZ2Z5NkpMZmN5SXNzdmxxR0RoeEVsS1NZMmlJN2k4V1R1dnBa?=
 =?utf-8?B?UkVLT0pkT25jRUdFUUd6NDhobHFJNFpocmhZQ3VvRm81cG1mODFUbHgwaVNm?=
 =?utf-8?B?ajlkM09uKzc3M2czWDVNVE0vdU9KYlNLb2NHc2F1M3lTWHo0VzV4eVVqcHQ0?=
 =?utf-8?B?eWwzSjhjdks1ZWR6a29nVWFBd2lWZlVVcks0YitsYldQeWROYkg5RDVwc2Va?=
 =?utf-8?B?aVJmNVNUb3JEZ3RuT00vU05LOW9jL1hLbkZ0d3FKV210UzdRc0E1Q1oyelBs?=
 =?utf-8?B?MEhSU3lWbE1MajR1eXdSTmM4bS9FRXZnM1RhVDJjV096N2x6RmJlMzNhcEtJ?=
 =?utf-8?B?dm9PM2Z5d3dEYUJDMFpkdmlqS0tjWkhFYTlSR3U1WG1nSHl3VVR5N1h5bUNH?=
 =?utf-8?B?SjRFMFpJdGJiS0x1Y3ZhOVVERVQ0bnNIbFZtV3RqbmRCbktKQjZidWxnSzJ4?=
 =?utf-8?B?bHNJcklLUzhUMzNzMGcvaTVLZUlPSW9YTC9uaWlqUnBqQkJJQ3ZwcTZrVnFo?=
 =?utf-8?B?WW10WTRiSDg0V2psakFrYThESHNmUzZ0QTc5ZEk1VWQ0eWRhcElqMld5N2NR?=
 =?utf-8?B?TDQwMDRHUGsvQ1BVWXVYZ211cDd3SUhLMWt1cWJrTHhPYVdHanI1SUNNNjN3?=
 =?utf-8?B?U0NpTG5hUWg5VjA1L0NNMG82Z2xZS3gvNURTazVYK3pnYUpIQm1hSUhRSzdM?=
 =?utf-8?B?dXZvK1RiV0JJNUpTNjBNU0lpQXg5dUZtSGxSSU45Y1NrZElvUEYwQTc5VjE5?=
 =?utf-8?B?Vm9XZG5leTJpYjFFdGloY3o0aDRVTXJoZnpMeHZZN2paTm9teFVWUENWdUp2?=
 =?utf-8?B?TTRLWlE1Rldmd2owZDNwM1VOTm1JZHB0ZTJPVHFUMUtVWEM3NmFrN2hPOG5D?=
 =?utf-8?B?UTZWaVJpc0RteENGTFhUT1pOSm9uT2Vud1NBSlc5MTVDMVpLNUdYZmJSdjQ1?=
 =?utf-8?B?aWo3YXl4M1BMVE9JandkUU1rMTNIdkhWSUw3UjdRRnpHa3RtSHJWWWN6RjA5?=
 =?utf-8?B?ckhWSGhCWWRRQ1AybjlYQkNjRVFLNFZUYUZSMkYxcEZwaVVITFdENHAxdk1H?=
 =?utf-8?B?ZmhQeGo1Y1F1Z3A5V2RUSktza3o4VmorUEt1UWV5Y3JBSXFyUkV4OEl6Tml0?=
 =?utf-8?B?YTFOd0hlTHRCRzYxVENiN3hpdklSSGlrUy9ucTcyM0t4bXF6eksrTDByYnBH?=
 =?utf-8?B?Z1JLNVBtdFl2ejd4V0pGZFNXeHhVSnBhTlF5WFhuUDB2MWovVDByVTljdmJt?=
 =?utf-8?B?S2xkTGNkQ2VaUjdLQjNyTFFHbnBHbGdUQUI1SlNIV3JDSHpCTC9CVkRkY1ho?=
 =?utf-8?B?Q2JZYjZrNEtJUnYydW9EV3gzbENOSXZrem9rcTIwdzNWeGxSclh4cWZjVk5X?=
 =?utf-8?B?SENOM2pjVkEweHdzVUdZTk4razFqYzhnbFB3WGFGSUErckVEWUlqQ2FCaUVG?=
 =?utf-8?B?d002VHYrVTlLdm9kT3J0eU5MNGVuV0UvdDZ5MWlncXBzTWFQcTI5WitsMy9S?=
 =?utf-8?B?eExhbC9BcGt2amhENitMb3h2SXJZRGd5SG0ybUY4NGpodVRmejRhUzUvQktK?=
 =?utf-8?B?OUcrTy9HZGk5VDMwSzlTSWtaK1JUSkhZYmo2bWRJbFpUWVhEYnVLVTU2b25R?=
 =?utf-8?Q?uc89KdPDtu09qdXzv1roIY8ELAuXcpvE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1ZUemRzbXZrVXczT2RpU1Q0TVBINEMrK2RsMmUvUUpsdHBlUnVWR3U2WXdx?=
 =?utf-8?B?dXpmT0xwQWNrVkZ0eEJuR3hUSmRVa0pWc25YUkY0bXhxUnZER2lOK2FDc0ZL?=
 =?utf-8?B?ZW9PMnhNcnZPNENzK3NPdXExbTNiZG56emltdzczLzR3K2FmUVR5b0dLZHVG?=
 =?utf-8?B?Vk40NVlSdTV4QzNrMllMSDBSbm42MWJTeGFFT1BWeEdLK24rQ2NTQ290a1l4?=
 =?utf-8?B?TmdvSjJ2NHRtZjhMbVFpZTV5bEMvWHVZbVViTjYrazNZc3FLQzZlR3dyQ0xW?=
 =?utf-8?B?bGNCdHB0a0R6YXJsWWRiUDJtOWUydXVLR1FHSGxTYi9PWlZtNGgrcVFTZnZ1?=
 =?utf-8?B?aEd3QitReExtTkY3Skh6VGVMY28zR0dsTHhlKzhpM0I1d1BFTE0wTGhkaDh3?=
 =?utf-8?B?RTZEdkdFZGNXR0lDYmpFai9IUGtlWFdKMkk4TTQwM0VmVFkxa2Fpb2Y5QjBi?=
 =?utf-8?B?TjdQeE5sKytUUmlPeURNQU5takhqZnEvbmxFQ3o0dk5GQlFPTVdMVU4vbHZJ?=
 =?utf-8?B?Z3JvczFZZFVvTXBWNzc4SFE1aXprWm9LOVNmRWxvYnJYZW9KcUdEZnpoRkxn?=
 =?utf-8?B?WkFubFJOWFc0VDc2aHFucmJYRnkrZ0dFbm1XT2Nua1lMN29oMHM3SlplT1V3?=
 =?utf-8?B?NFlmTlZGSDhNTHJlQStDQktmSGxpYXpvZ1RQRmZiTGVKL3RBWGgzVElBTlYy?=
 =?utf-8?B?Z0dVUTFNWlQwV3Vra2owQmVsNVhzVlM1SjJvQ2J1STFBTUF4OWt1emdFSkZU?=
 =?utf-8?B?aHE3amRrZ2tKQ3BYeDBWdTM4aW12c0RzSWkvRWhVN3JXTEVaL2c3THYvREF5?=
 =?utf-8?B?WHoxYUx6cDBJQi82YjNua2hhcHM5WTJlNy9WcENtbSswQVliM3Faa1BsY1ZC?=
 =?utf-8?B?V2pFYzZIamxOb004eldibTVPQ0JjT29HM0NyemFwYnplYTdSQVJZMkE4S2Rn?=
 =?utf-8?B?U0taZ0NoUU96MktiV1diSXVnWGFpSjNwd0FDcGE0TGJzajRQeFVmRUIxVlpK?=
 =?utf-8?B?RVpaT3JTVHhpQXFtODFIaG03d1Q2aHpVU2cwQ1h0N1ZZajlNQnpSemFlTmRJ?=
 =?utf-8?B?TWxlcFZ5azRuY2trLzFxS2RzdGNxM2pkdDhTbU1FbVlpS2tyTEQzWW9JYXUx?=
 =?utf-8?B?aVR5YUhVSmMyQlRJdGtnOHZ4NVUwYnJmcXJibnJzVzQ0cWgrK08zQXdLdzV6?=
 =?utf-8?B?UnRsZmswT0NsTS95ZEc0Zmx5cmdXL1FlbHNPZk93VmQ1bUo0QW1tZXFWR25F?=
 =?utf-8?B?K0NRTXp4dDFuUzlpNzV2OVJrOHF5VnFRbDNWSDdKaTFNOTlTa3lzOW12NTNq?=
 =?utf-8?B?VlR0cTFNMHg3NzZUMDBBL25KSFRkVGNWQVZHWkgzM0JLdS9BckVPQ1BnMzJi?=
 =?utf-8?B?WHg4VUFUZkx5ZHYzYW9xaUFWUFVnNmNnUzVNQlVTSXhSK2kwUmR3SHFsN0NU?=
 =?utf-8?B?TzhyOEhRNmFtTGYyVElGRkZ5N1phOVkyRWZONXk3VlJmdHA2aXY5azBva1VC?=
 =?utf-8?B?U2lXb0VvU2xzbVFFVGowR0JmdW5yWnFxN1R3Z21xandVYjlMSnp6eWR5SXZQ?=
 =?utf-8?B?cFFXc25MdjFMQlVmUFljeWI2L3lOZGJUSjFoQXpaZW10QXZJTWlTeHdsYzhC?=
 =?utf-8?B?NFFwZTQzYW5ibkpQTHlaL3RsUlFYZjdtT3I1SU01ejUvK0s0eEtXK2k2M2NL?=
 =?utf-8?B?QkNIWXZIMjlEbG5oVk9TUGdXa3Z4djlaZkVEZDFOM2FSQmJSYU5xamhUNUtw?=
 =?utf-8?B?NzJsNkFlQmRvMHIxejRPenJUQ1NYQkpKVG1PQ2J0MWhHcUhnTDBiL2JvUHBO?=
 =?utf-8?B?UWZURDF5THZQUVdVeWFGYTQyaVdQbGpOdUxXZjNxRXErQkJSNWlCa3JNeWZ6?=
 =?utf-8?B?K0xZendJTUlRekZGbllUWHh6Z1cwYi80SURPTElMeDBTclRaQnB1TlRiT2Qv?=
 =?utf-8?B?cVF3RVNqRVdOWjhMak0wd1R3Q09EMlo2M3NoNDdpZW9wSWNWZVJ5d0s2NExT?=
 =?utf-8?B?a0hKbk9MY2dkNTNpUDFuQ3Y4cm1vU0pVSkgvRGlKc04zZm9BeERuWGdFUlBj?=
 =?utf-8?B?M2puOVRGNjlEZk0yUEFiK3JoaytqaWFNYXY0NlRqWFVueW5TOHFRdnpwQVE1?=
 =?utf-8?Q?yMhrnKwQAN4RaGGakzXa8oalq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928dbf3c-1c0b-411a-1585-08de38ff13d5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 21:48:53.5639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBij9gTLg7OMn3+eEYa7oZk7gLo8wU0yi3qj+fY2+IsxHt4709YH8wn6V+wUYr4SKGZqwQO6tHhnV6g/avrt8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6607
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

On 12/10/25 10:51 PM, Lizhi Hou wrote:
> The firmware sends a response and interrupts the driver before advancing
> the mailbox send ring head pointer. 

What's the point of the interrupt then?  Is this possible to improve in 
future firmware or is this really a hardware issue?  If it can be fixed 
in firmware it would be ideal to conditionalize such behavior on 
firmware version.
> As a result, the driver may observe
> the response and attempt to send a new request before the firmware has
> updated the head pointer. In this window, the send ring still appears
> full, causing the driver to incorrectly fail the send operation.
> 
> This race can be triggered more easily in a multithreaded environment,
> leading to unexpected and spurious "send ring full" failures.
> 
> To address this, poll the send ring head pointer for up to 100us before
> returning a full-ring condition. This allows the firmware time to update
> the head pointer.
> 
> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/amdxdna_mailbox.c | 27 +++++++++++++++----------
>   1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index a60a85ce564c..469242ed8224 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -191,26 +191,34 @@ mailbox_send_msg(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
>   	u32 head, tail;
>   	u32 start_addr;
>   	u32 tmp_tail;
> +	int ret;
>   
>   	head = mailbox_get_headptr(mb_chann, CHAN_RES_X2I);
>   	tail = mb_chann->x2i_tail;
> -	ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_X2I);
> +	ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_X2I) - sizeof(u32);
>   	start_addr = mb_chann->res[CHAN_RES_X2I].rb_start_addr;
>   	tmp_tail = tail + mb_msg->pkg_size;
>   
> -	if (tail < head && tmp_tail >= head)
> -		goto no_space;
> -
> -	if (tail >= head && (tmp_tail > ringbuf_size - sizeof(u32) &&
> -			     mb_msg->pkg_size >= head))
> -		goto no_space;
>   
> -	if (tail >= head && tmp_tail > ringbuf_size - sizeof(u32)) {
> +check_again:
> +	if (tail >= head && tmp_tail > ringbuf_size) {
>   		write_addr = mb_chann->mb->res.ringbuf_base + start_addr + tail;
>   		writel(TOMBSTONE, write_addr);
>   
>   		/* tombstone is set. Write from the start of the ringbuf */
>   		tail = 0;
> +		tmp_tail = tail + mb_msg->pkg_size;
> +	}
> +
> +	if (tail < head && tmp_tail >= head) {
> +		ret = read_poll_timeout(mailbox_get_headptr, head,
> +					tmp_tail < head || tail >= head,
> +					1, 100, false, mb_chann, CHAN_RES_X2I);
> +		if (ret)
> +			return ret;
> +
> +		if (tail >= head)
> +			goto check_again;
>   	}
>   
>   	write_addr = mb_chann->mb->res.ringbuf_base + start_addr + tail;
> @@ -222,9 +230,6 @@ mailbox_send_msg(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
>   			    mb_msg->pkg.header.id);
>   
>   	return 0;
> -
> -no_space:
> -	return -ENOSPC;
>   }
>   
>   static int

