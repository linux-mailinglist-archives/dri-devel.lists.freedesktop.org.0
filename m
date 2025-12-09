Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42153CB08DE
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 17:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158FB10E60A;
	Tue,  9 Dec 2025 16:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oQXALrDA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011009.outbound.protection.outlook.com [52.101.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4623D10E608;
 Tue,  9 Dec 2025 16:27:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJvbNA4YuuFMdivCp6rvzRBsi62fUBQYjQNhRdklhEHg5dcaNhQvztqYs4Vz6PWPkQqah8W1/Uu2oB+PcY2lAMEjIYLp9Vm46ufkMQJVxq+6LR9/TlDanEbuti5A+pn6OwcdllErxIpQ+6Wwpw3scOuRAOSV+bzSOs2U4aOcnDFPUYoNPw5COHMWs6hubcAwNfHLp1cehDNY9CiSW2cUBolh90lJV25sRyYLkhATN/vYokMe4zVNCHscoQ0R9uYgryHc0y9LoDeO9GML0H2fax3JPRM2TwlSuVQJj97tpHTVGZbAG5oQtcN8uHOW7xJuL02imGvIq0G4yCPJtBsDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LH3ywLf+dIQcLnHVXDVhs5ha7DEU3pw+C0hc5Q7kT4M=;
 b=A4PxLMXVkLCESqzV0Qt3X8q4CnqF2ICXeYxgpjN4Xle6Q7PMcSiL8+AaHp85A4VOo6Q/+JoKVMdF+GD4Hx6k7pA/h6loMjiQ3cgTQSr3ylBnoU8do9UYaIzIg2a17pBo4nOEJE/NfjV4f6X4kILwt9wqvsHZ4g/BygN2vD/cIxrbOTNBcJO+xvCqCgOdBoRqEEWXco63Lt++BXtA6bPy+u2vSMePmrCoQeIjVlwNvwol9lhwaVZBWDrr3fqCSWQUvx6Lp8ULxNj5s0Hq9Vpl/864Kfy3fhHhh8N/PHYhX86NAD1fwKmZK8bdPN5gKusB2ZyOgpqH2esrWB9ZldPCUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LH3ywLf+dIQcLnHVXDVhs5ha7DEU3pw+C0hc5Q7kT4M=;
 b=oQXALrDANwJpQlJTIoWnhDmFPxa0oKAo3f62XWwSeU90HzvQ3MoIL1g4aU3ttPPHZE847YBywQ240t8ksXmoea1p6Y6+0USPcD54Bwu/mu6ZzV2+w4E6Qo0gLfLHXaZfOTkMvvVQp8JFug8IDy11amNl6mGA2p3TvCLc3z9WNLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7764.namprd12.prod.outlook.com (2603:10b6:610:14e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 16:27:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 16:27:31 +0000
Message-ID: <6c46e3b3-c324-487e-8c14-4742c323c8ff@amd.com>
Date: Tue, 9 Dec 2025 17:27:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>
Cc: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 dakr@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 Lucas Stach <l.stach@pengutronix.de>
References: <20251128182235.47912-1-vitaly.prosyak@amd.com>
 <cdecd1e2-de0d-466f-b98b-927b2f364f79@amd.com>
 <c56ecd19d7ddc1f1ed4e7e9e13388c647de855b1.camel@mailbox.org>
 <49de5988-ea47-4d36-ba25-8773b9e364e2@amd.com>
 <aTMW0UCGQuE+MXLk@lstrano-desk.jf.intel.com>
 <21699026216379f294d6597ed6febd187229ffb9.camel@mailbox.org>
 <aTcf4o0huubgUPIQ@lstrano-desk.jf.intel.com>
 <aTcguvAQCZ07xD/C@lstrano-desk.jf.intel.com>
 <212ecf88-b175-44cc-af3f-7371340ed480@amd.com>
 <aTdFgVM5s/H5tc4G@lstrano-desk.jf.intel.com>
 <b0781c7fd90c51394ec60faa71222fc3af06bb0c.camel@mailbox.org>
 <e99a2e97-3058-4501-ad22-457ede493a59@amd.com>
 <3e780e52dc0a7f1267e814c895e9d5e840a8c913.camel@mailbox.org>
 <d846a1dd-a705-410a-a043-ffae43bada57@amd.com>
 <fb93bfa5f32025ce187153d0eeb47c43ec8cec7b.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <fb93bfa5f32025ce187153d0eeb47c43ec8cec7b.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e43b717-bcaf-40a9-692a-08de373fd9ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzlSN05CVFJOOUVkbDJlZnUxa1NqdnowR0NSNkZOOWNMMjRuYkpGeEpoSE4y?=
 =?utf-8?B?eDVNYjQreUpPVzliWHg4c0REY1J2Y3RKQjN6S29OQldkbkkxRUV5ZERFMmY0?=
 =?utf-8?B?clRPdFdpSXVlejRMWnBBa3BpQlNsS2YwTUZicE4vZTI1bWVlS2U0V29CYXhp?=
 =?utf-8?B?Zlc5bjhxT3FpTmV5VEFuQ2hvOW1NVDg1b3lEM3ZEaUVqNEVwSlk0cWd5NUlF?=
 =?utf-8?B?eiswRnJ6MGFaVG1YUTBLNGFRQjdCSHZyZUh3UjVMU2tSUnFTZEZxbktxekRr?=
 =?utf-8?B?bnA0OG9oZWNlTzIrcXQya3cxNEhVc2cwRTBxdnZvTzFyQ0JuTENqdmM2dUNV?=
 =?utf-8?B?bDVPTnBUOE10Q2J0cHZyNUYrK3FBS2lTemdkMzFKZ25nOHprMkVPeXl6L0tK?=
 =?utf-8?B?WEg2K1F1SXpKRmx0aXh4cnlRTmszeGFhbUR2RmUrSHN2OUx1dkNaSkozVFd5?=
 =?utf-8?B?MjZyeUNhVW9tV3ViN0IzYmlFcW5URVU3a2Q2Ym1TdlA0dzRJOEtNWWI4OUhx?=
 =?utf-8?B?OXZETVVsZGVqVFd2MVljdERDM0FlRXBXSmVGSDVmVXd3Nkt0R2VHTEtRQWxj?=
 =?utf-8?B?eVJXWGJ2dVU4ZWdxbGVVcUZsQ0ZKSWtMKzdnSUNHbjZQd0dXM01iTHBNK2ND?=
 =?utf-8?B?MjJnRnZNQm8yeCtveW51UkFwRi9SQW9ydTdvWEUraitTc29Fci9TVTVobVAz?=
 =?utf-8?B?MXB0R1lESGJyMUxEdHFzNVR2QzVUWlRSUTRZWHc5R0lGMFZjdmVJR29BK2M0?=
 =?utf-8?B?Mnd5K0tCcURvQVprS0ZIZW9wQkpaNk10T1B6SWRXcUJiSWlSb1UwS2QraDlk?=
 =?utf-8?B?alhOZm9taGZIYjR4UTh2UFZzeTFFY3VJRlBNNlNRU3graGxubGpJQzNNSWgv?=
 =?utf-8?B?SHhtUHB0OHVEKzUzVGZHTlhZZnlXbHRKQmMweXZKNXlJTjQ4TzVNMzZUS2lZ?=
 =?utf-8?B?dng0YzJmcnZ2S091NXY4Vk1tK0hrSXBhcjFJd0VSblZOT1Ryd0hvNkFZS2dN?=
 =?utf-8?B?eHhwcENqM2w1VUZkR0w1S1EvNVRoeHRSZnQwYlJvQXVib2tpUk5TbHFkblQ1?=
 =?utf-8?B?WkxZdXRlT2xnc3M5N2hBQ1ArUGNRZHNwRFpONGovUmdmSEgvUlNhOCtacDZ2?=
 =?utf-8?B?ZEIzQXVleVFpaWY0dG8zZ2MzNkRxMmhiVUNlOUJSTlRySExEZUFQTzU5VEZv?=
 =?utf-8?B?bmhaQUdhbkFmUjVrWEt0QXQ2S09KdHowUFJPcTRuUTlUeGtuRUp5NTQxYXh0?=
 =?utf-8?B?Y3ROVlAvSDVpekV2QW9ia01DVTFKelNSaVY1dWtPRUYyWDVOYUdiekJSWVNS?=
 =?utf-8?B?a0RSTU5taTJhazlYcVZKR2QzOGNiR2hxWGVsU2pHUkFhVkhZODVGeWNSdmZy?=
 =?utf-8?B?cGRid3B5RDdLaDdrbGJCeHVxZEFRZ3g3TE5nWStPbXVvUTZmVGdvd0o1SFYx?=
 =?utf-8?B?N3BydDliU25weHVBWDVBeUJVY3VFTXVlWUs1Tm9LblRmMy91RnJwVlRTRHkz?=
 =?utf-8?B?d1ZVZmdsNGNXVlVGZW81dnVoZHk2VXc3QnRVaGFMdGFjNGY2Z2FzaE5uNU9a?=
 =?utf-8?B?aTZldjFuZHp1NjZ3MzVLcFdUVWNCSS9vRzNxZ3ZXTmEvU014R3lQMUMzaEUr?=
 =?utf-8?B?czdZSDdVWStNYUd0UGYrSHU3SG4ySHM5RHhpN05Ec0ZrMkNydWtFc3YxRTBL?=
 =?utf-8?B?TEpxeXlvVGhTaTFUWGE0ZWlhSllSSXdLVzdaK09yUmJGelQvL1ZvdG1uSWZY?=
 =?utf-8?B?YjVKV0dmMmRrTzZDaU9FLzU5WjIzTUpVMVhRVXpkd3plZHNyN3RKakkwSzRU?=
 =?utf-8?B?cEFuQ2Z1azhNYUFCMlI0QXloSnpZVjU4L1BnaFc4RE00Nms0S2xSeitxZjdj?=
 =?utf-8?B?ODVpdDhNeEs3ZW9WYWkyaktlaVQ3b2F0MTBselBOSVVKWGdEaU0xbUlXc2p0?=
 =?utf-8?Q?d393wm1k7Snqr+7837q0HW9sVZvD+KKJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGk4L25VUElFaUpRQTFTd2hPZU5TaUNCRFdNVGIzTXhuU3EvSG9LVzBOK1FH?=
 =?utf-8?B?OEhkWnRLTzN1QVZOaWJVeWVsb3FPZ21zc2xac2JHWTZsY0dieGhybDVxb2c3?=
 =?utf-8?B?c00wZkxsS3Z3YnUzdGk1WHZoV3dTd1RPWFYxa3J3ZDJvb283d1B5Q05rKzI4?=
 =?utf-8?B?RnVFSENIZmJmaXdrK0c0VS9kdmRiNnZEK3dYTjdUZDBxTWh5M3BwdWxyZ1Av?=
 =?utf-8?B?U29RZ0FJS2ZmdjdqUGxhNlpwd3RyZXdUckNHWWRsRW5Bazd5SSswZ1ppKzI1?=
 =?utf-8?B?ak5keEZPcTRuMkFESEt2dkNwU0lIQzFUdngyN3hpQU5PSFloUi9JQ25VTGZa?=
 =?utf-8?B?allzcmJ3NmhORkVBZXNBaFViTmlTazV4M0NUQ0o0a05Qc3c1VTAwcnh5U1Fy?=
 =?utf-8?B?WWtIVG95aTQ5NkR3c0xJUmsxRG1saFkreDFCTm9rSzFSV3V3NE56Z2ZNTU1w?=
 =?utf-8?B?NHN5OEpBRkJvQmE1R0hrUzNmMmY3dk5uVjZaQ00zNDNsUkh6cEU0MmRZdnBt?=
 =?utf-8?B?WG1vamI4bVRucWFQMXpsRlZvbGJXUkdqTDQ4L053UURnWnA5bkJla1RFaXpO?=
 =?utf-8?B?dy9BM09lVC95c1hORVcwYitVL3hrMGFQaFI4bEMvb2tmNy9DdTBXUkxhOGNE?=
 =?utf-8?B?eFlNb1dQbWdvdDRRUzlRdDZhQ2hwWTN6SGhtenZxcG5DV0IyV25ybXJDKy9a?=
 =?utf-8?B?NUdXNEhBUnB6ZnZHTjZRdUc2ZVg4MituaExSdk83bmxvUmVrQmxxNGdOQVRo?=
 =?utf-8?B?UUI0U0hPUmdjNThlU25NWDdQTkVab0ZaQ3drams4RWxFMkM5cDJXZTNDdTNL?=
 =?utf-8?B?VFgvQnlZS21kNzRzbjJLczV1WW55NkVGcjNQZ2pPL0x6SWI5eVplK3k1NGpX?=
 =?utf-8?B?b0RaY2c5OE00NW02dldPblp3Q2QxV216cjJORS8yQ2hkSG8wTHp4Si8zWGZq?=
 =?utf-8?B?WWFWTkcvb0FuQTc1Yi9LRzFrSVRuZlBaV0xna3BhU2ZnQStVaDNJbnloSzBB?=
 =?utf-8?B?NmRuVkgzc01JUm4zUlZKWFE1VkREL25MOWw1emltdGNGc2VVNVoyMTI1YTA5?=
 =?utf-8?B?RVRkYmg3ZnkzUjhOb2Q5ZzJiUzVxZ1krVFF5dzZvTWlTbGMweE1sTm5rZDFB?=
 =?utf-8?B?WGQzNkFQTlVTWE10WUVzS3ppQkpKUjk3cnd4bUs0UlZHTDhRbDdzME1wVE1F?=
 =?utf-8?B?cEh6MW96aWI2NGZoU0pFTzluWXJyQUJYT2g5ampMK0ptdHlrM3hyYjdGNjdJ?=
 =?utf-8?B?VnFtWk81UGQ5cEJzNVAreDRPeFlJcWlvZWZnZTJpNVpzb1hiL1FwTytWa05q?=
 =?utf-8?B?U05xMTQzYWo2ZGVJK1Y3aUZ5MnNRYUM0MUppMVcvdGk0OHNxVWwvVFYzbUdL?=
 =?utf-8?B?blpRb0FZd05wMmhDekdPNlpySXdiajdGZzJZQXZxZGxoRHBLVFFnRi9Gd1BX?=
 =?utf-8?B?ZitpM2g4VnpGRFEzV3dFNkMwdTRLQ3Vma0pkODdBb0NtT1dnZ2tQcTBQU1pa?=
 =?utf-8?B?ekRZbk13NWJkeWdaVmZQaWkzVDBzc3Bzdm5nU3lrV3cvUHBnU0VkMGFSclpw?=
 =?utf-8?B?NjFNU2NoeGFnekpVUXh5QWg2cE9Rb3VxRGZWcjJZdUxoODQzR2tBYjIydmla?=
 =?utf-8?B?cTA3YU92M0NzVXFIdmJFVzI1dUVXUER6RFJaRUZGSk1ad0grZ0c4NmNWdmpY?=
 =?utf-8?B?OWx2SVpmTFNSWTVHMHZkSThtQVR6S3JMNFVzQnNXZ2NDYllXclBpQmYzWFB5?=
 =?utf-8?B?ckdXL0h3WXAxbyt5WE1YcnQvbHgvZUR3WFBHMWdRWHNEbzY3RktLaGhFb3Vu?=
 =?utf-8?B?dytQZ0g2cDliRGxPVnNVZ3NucmhpZkdLdE9MdXBVbzNJNnEwdlg0WjBTamRW?=
 =?utf-8?B?ZU1CN2s0TnpPQm5tcnpJaTVIVjBjR3NSdkhzeUpaeEZISkMvbHRtajE1Q2hj?=
 =?utf-8?B?eTRUblFRSlZic3ZxSUtCOTRLU2ZoL1o4KzRUbVk3LzhTSVQ0eloyVE5vZCs0?=
 =?utf-8?B?RVVoNHR4cHdGY3Jkb2VLYjFqbHlQMXg0MUVvbzg5SEJndFM1QnV0MVdOOGhy?=
 =?utf-8?B?QWdOb2xvejNEbWVIWWJLMm83OTZIVVg0QlB0T01aOWRzTnBPRWtEaUMwVm04?=
 =?utf-8?Q?DNfsCao/n8Leh0Zjd7ElV3ERx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e43b717-bcaf-40a9-692a-08de373fd9ae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 16:27:31.0504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbJ7ZEdU278xi7Xuu4oLRM55YTlPkxO0QBRztu8BsIdh5cfxFjxp505QRMphM+gd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7764
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

On 12/9/25 15:28, Philipp Stanner wrote:
> On Tue, 2025-12-09 at 15:19 +0100, Christian König wrote:
>> On 12/9/25 14:51, Philipp Stanner wrote:
>> ...
>>>>>>>>>> How can free_job_work, through drm_sched_get_finished_job(), get and
>>>>>>>>>> free the same job?
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> It can't.
>>>>>>>
>>>>>>> But exactly that happens somehow. Don't ask me how, I have no idea.
>>>>>
>>>>> *Philipp refuses to elaborate and asks Christian*
>>>>>
>>>>> How are you so sure about that's what's happening? Anyways, assuming it
>>>>> is true:
>>>>
>>>> [  489.134585] ==================================================================
>>>> [  489.141949] BUG: KASAN: slab-use-after-free in amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
>>>> [  489.151339] Read of size 4 at addr ffff88a0d5f4214c by task kworker/u128:0/12
>>>> [  489.158686] 
>>>> [  489.160277] CPU: 11 UID: 0 PID: 12 Comm: kworker/u128:0 Tainted: G            E       6.16.0-1289896.3.zuul.0ec208edc00d48a9bae1719675cb777f #1 PREEMPT(voluntary) 
>>>> [  489.160285] Tainted: [E]=UNSIGNED_MODULE
>>>> [  489.160288] Hardware name: TYAN B8021G88V2HR-2T/S8021GM2NR-2T, BIOS V1.03.B10 04/01/2019
>>>> [  489.160292] Workqueue: amdgpu-reset-dev drm_sched_job_timedout [gpu_sched]
>>>> [  489.160306] Call Trace:
>>>> [  489.160308]  <TASK>
>>>> [  489.160311]  dump_stack_lvl+0x64/0x80
>>>> [  489.160321]  print_report+0xce/0x630
>>>> [  489.160328]  ? _raw_spin_lock_irqsave+0x86/0xd0
>>>> [  489.160333]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
>>>> [  489.160337]  ? amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
>>>> [  489.161044]  kasan_report+0xb8/0xf0
>>>> [  489.161049]  ? amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
>>>> [  489.161756]  amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
>>>> [  489.162464]  ? __pfx_amdgpu_device_gpu_recover+0x10/0x10 [amdgpu]
>>>> [  489.163170]  ? amdgpu_coredump+0x1fd/0x4c0 [amdgpu]
>>>> [  489.163904]  amdgpu_job_timedout+0x642/0x1400 [amdgpu]
>>>> [  489.164698]  ? __pfx__raw_spin_lock+0x10/0x10
>>>> [  489.164703]  ? __pfx_amdgpu_job_timedout+0x10/0x10 [amdgpu]
>>>> [  489.165496]  ? _raw_spin_lock+0x75/0xc0
>>>> [  489.165499]  ? __pfx__raw_spin_lock+0x10/0x10
>>>> [  489.165503]  drm_sched_job_timedout+0x1b0/0x4b0 [gpu_sched]
>>>
>>> That doesn't show that it's free_job() who freed the memory.
>>
>> [  489.405936] Freed by task 2501:
>> [  489.409175]  kasan_save_stack+0x20/0x40
>> [  489.413122]  kasan_save_track+0x14/0x30
>> [  489.417064]  kasan_save_free_info+0x3b/0x60
>> [  489.421355]  __kasan_slab_free+0x37/0x50
>> [  489.425384]  kfree+0x1fe/0x3f0
>> [  489.428547]  drm_sched_free_job_work+0x50e/0x930 [gpu_sched]
>> [  489.434326]  process_one_work+0x679/0xff0
> 
> The time stamp shows that this free here took place after the UAF
> occurred :D

No, that is just the way KASAN prints it.

E.g. KASAN detects that something is wrong, starts printing the current backtrace and then the backtrace of when the memory was freed.

>>  
>>> @Vitaly: Can you reproduce the bug? If yes, adding debug prints
>>> printing the jobs' addresses when allocated and when freed in
>>> free_job() could be a solution.
>>
>> We can reproduce this pretty reliable in our CI now.
>>
>>> I repeat, we need more info :)
>>>
>>>>
>>>>>
>>>>>>>
>>>>>>> My educated guess is that the job somehow ends up on the pending list again.
>>>>>
>>>>> then the obvious question would be: does amdgpu touch the pending_list
>>>>> itself, or does it only ever modify it through proper scheduler APIs?
>>>>
>>>> My educated guess is that drm_sched_stop() inserted the job back into the pending list, but I still have no idea how it is possible that free_job is running after the scheduler is stopped.
>>>>
>>>
>>> And my uneducated guess is that it's happening in amdgpu. It seems a
>>> sched_job lives inside an amdgpu_job. Can the latter be freed at other
>>> places than free_job()?
>>
>> Nope, except for error handling during creation and initialization.
>>
>>> timedout_job() and free_job() cannot race against each other regarding
>>> jobs. It's locked.
>>>
>>> But maybe investigate Matthew's suggestion and look into the guilty
>>> mechanism, too.
>>
>> That looks just like a leftover from earlier attempts to fix the same problem.
>>
>> I mean look at the git history of how often that problem came up...
> 
> If that's the case, then we don't want to yet add another solution to a
> problem we don't fully understand and which, apparently, only occurs in
> amdgpu today.
> 
> What we need is an analysis of what's happening. Only then can we
> decide what to do.
> 
> Just switching the workqueues without such good justification receives
> a NACK from me; also because of the unforseeable consequences –
> free_job() is invoked extremely frequently, timedout_job() very rarely.
> Drivers will not expect that their timeout_wq will be flooded with so
> many work items. That could very certainly change behavior, cause
> performance regressions and so on.

Yeah, I was fearing that this could be problematic.

Regards,
Christian.

> 
> 
> P.
> 
> 
> 

