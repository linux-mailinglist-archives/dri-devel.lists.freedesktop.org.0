Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9614CB5B74
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 12:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D288C10E769;
	Thu, 11 Dec 2025 11:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iFHmGYJF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013005.outbound.protection.outlook.com
 [40.93.201.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A4D10E237;
 Thu, 11 Dec 2025 11:55:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yB6tTBfPNqfkoUH87a6SY4eBt59guxFV6uDkyp9tpcmrpBOqjMiF0mVTUdH/GIMdrLFuIiArL/id5ejB3Yo1INSPYdS24MGDXCjcxbDKluzBEgWKETOhem37pkFw+tWHCAOwCcK+urhGOWhCGrpElG16l6ecNqa26OEQzv02lCnQ0UG2mm/cjf45kSmtdvIU11teHZ28vyhamJpik0cX+WzVY9SF007qZRiGHMgpKwSzb7Y+DtunZhWau9dKVTugtiDCtjjOruJM0eiaHK0YAfzvZ59aOdWsMAhOCsIXxBRLUk54G6lG/RPUHAxzwswlDHGVnT3ZWs798+N+9+tBBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuuFw4dXpidpJWxqvtoNQ5+imyfcXQrgrSHGOPPjjn4=;
 b=MrQ+dsJPctFSvj1IkRZiqmS3cXiLkbCjgNuutbU2x1HKJUeG/kkluFCMMF5zt/jRo7SU4zzbA2Yyjel1BNLFNYnkbc5A3OpNkE+B4yvtQeQmChTemQ7Jc5erXoAdyi4O7GVCR4lYcdqTbvmxsPbpAIoFbLS0u69wYdm34CBpcL6w/bL/OryQXmMGVt8iu1BQ/L4p6ydQtlRd2gPZRNmfXkGFTEtI1Qg/Cw6vgeJlfl3wArkb0zebbT2nvopBPn/uSWeX2Km3/30xEWEEdFNegU3T4F4AnGIsz50QLoqLIX/jRpmFbVxLberZpWOwoUYhzuC9hlsx6Po9j2BBVGNE4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuuFw4dXpidpJWxqvtoNQ5+imyfcXQrgrSHGOPPjjn4=;
 b=iFHmGYJFedniz2cVhvP788nDTGg2hxJtJwYFSgcLKEFiRLdrIPIdvci3B7GDtnLytiBvTXGFDxQKcufswp886ZE1bGgETRpsJsmQkw2k9p5EWrGcAuQUg/iYje0CLt/BYB1YbW7ePkhm+qDX0LQA5iYwyx+k6mPPvJqTjiLZh1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB9552.namprd12.prod.outlook.com (2603:10b6:8:24f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 11:55:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 11:55:11 +0000
Message-ID: <e4830223-23a4-45cd-940e-2dbad1036704@amd.com>
Date: Thu, 11 Dec 2025 12:55:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>
Cc: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 dakr@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 Lucas Stach <l.stach@pengutronix.de>
References: <212ecf88-b175-44cc-af3f-7371340ed480@amd.com>
 <aTdFgVM5s/H5tc4G@lstrano-desk.jf.intel.com>
 <b0781c7fd90c51394ec60faa71222fc3af06bb0c.camel@mailbox.org>
 <e99a2e97-3058-4501-ad22-457ede493a59@amd.com>
 <3e780e52dc0a7f1267e814c895e9d5e840a8c913.camel@mailbox.org>
 <d846a1dd-a705-410a-a043-ffae43bada57@amd.com>
 <aTjTucrVHe8TR/gN@lstrano-desk.jf.intel.com>
 <0508680962030eb0f858890a3183a545126614c9.camel@mailbox.org>
 <8ceb06b4-5f56-471d-91f6-a6ea6733e9a8@amd.com>
 <b0e9af12b924e09c0006f0a3068aca3e4ea6fc30.camel@mailbox.org>
 <aTmpFgeDsyq0a9vK@lstrano-desk.jf.intel.com>
 <cbf77a87f928cbeb3f05579a58919a44f3a40593.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <cbf77a87f928cbeb3f05579a58919a44f3a40593.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB9552:EE_
X-MS-Office365-Filtering-Correlation-Id: 0adf201e-43bd-4aee-c694-08de38ac2346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlVuUzVjYjcwRENacUJ5Z3JZNEd4alExVllwaTRBRG1Vd3VESm8vNGM2MGtG?=
 =?utf-8?B?Q3BBeC9NL1JRTEFsanBFNloyUk5zRlNYZzl4SmZodS9jcm1NMEpmTFp5aTVW?=
 =?utf-8?B?MTB4M2lZYlBUb1QyUU53NFNNNUtKaXpWd2tLL3RHSk5mbmw2UjVmaWdTSkFw?=
 =?utf-8?B?YmpuMy9nR1VaYys0MVd3SkJ3SzRDVGhtY1c0dCs5ajdrVEVQdTZFMGNKL0JE?=
 =?utf-8?B?em1Zb3VjRnBlK240QVZwTHh3Wmg4NUREYWU0S0QxZTE2MVpOOEo1bnRxZnZN?=
 =?utf-8?B?Q05WTC9NVHkxQTNlcGRiVFI1M2FOdzNpV0FpSUV6SE80Uzk0eHNWK3V0UDNx?=
 =?utf-8?B?VlJnanVQMUNJWXVDRFNmZWxuY2FhUjdxR0ZjOUNOMHdJNEZjdmlYMTQ2cSto?=
 =?utf-8?B?dW8yaHFBS2V2c08yS1ZaaHh1SDBtZHBLQ0VPdzRWUGs3UWQrQ2ZJMDk1Sy92?=
 =?utf-8?B?Qys0dU01QVpONytIWU1uWGtPalI1RWNGa2o0U2QzbFRyQ3FqY0k0Qk82d3Rq?=
 =?utf-8?B?YjRMb2ZYS1lGMHFoTndVUDdha1FMM0xTQ0FGc3paTk5ESnBlOFc2ZVZIRmps?=
 =?utf-8?B?cjdFYlJsOUgvcStGRlR4NDNpYTNpQ3IxOVF5TWFkNDBrQUNGRTU5K3l5dGZE?=
 =?utf-8?B?S09vMkt6YmFsVWFVcEtieDQrOEZiZG9MNXFCd2xZYzM1ZWw4ZkYveDNMaHNt?=
 =?utf-8?B?d2pKekZPRXVEejhkUjI2QStpUUxPSlJYRnpzQkM0NU1Hdi8vYmJjR2xuV2VM?=
 =?utf-8?B?d1pzalZxdXI3QUpxeWtaMm5MNHFsU0I0ZGt5MENSOFV1bjdpWGZTOWtkY1E4?=
 =?utf-8?B?K0JpOWlJNHhnMmh3Q09rNXlIVEVZVmY0R0FPQ014bDgvM0lJM2gycG1BYzNS?=
 =?utf-8?B?Z1RQL1ZrTVFiYzV3YnhSbkV5NDhObFNPUnR1UmkwTllNTCtRQ1Q0SWYrSDdH?=
 =?utf-8?B?eXEzTCtOZFB4VFlHZGVsWGdSaEw5Zjg1a2dGM3p2aTJmOUljOUQxTDAwdGcz?=
 =?utf-8?B?YVNtTE9jWnNHaXBVWlFSbndoTzBIbGRzVG5aWVFEdERwT0hUQnRkazhPZUpk?=
 =?utf-8?B?QkxHZTBhd2cwZVRVL0Y0bGZaQk5sWVdhS002SUlHMUFsTlBPYWJ1dmdrS2NH?=
 =?utf-8?B?b1ZKMUduZjZJUXVVQk5sdHd1eVoyUGFLNStndFVqKzJ2SWFyVkhXcEZXeDdQ?=
 =?utf-8?B?NXZ6MlhGamxscTg0TG11cS9EK25JbURlWEFvbGtxd0szUlo1R2ZIaVEydVhz?=
 =?utf-8?B?M3NmT3RpVjFoZFNIZVVhL0lmWXJERENXZEhlMU96dnlBSzlPNDcvQW5nZEVV?=
 =?utf-8?B?aFBvVmJsNHZyUWpnOVRDVk9YcmpuVXZ4b1ZWYVVhdzg0TFNCazQ5ZkpFdU56?=
 =?utf-8?B?ajlLN0JuZzdVbGRWT2pVNkRmZG4vWmt2UnBxdWFkelI4NXpTM3ZMU1pnMnpy?=
 =?utf-8?B?ZUVmWnp0Ri94OHlMcWJZTWVBakpvZnRKclR4ck5ud2Z4emNTYnV5WkhxRWdi?=
 =?utf-8?B?S0Z2ekh2ZnZhenRFWGcxbUpuaVRxTk0rYWp3YVpkTHBhR1JGbmhBSFZZNFUr?=
 =?utf-8?B?SVp1YmkvTWF4bVp1VEdKdnVwcmd6ZW9SN0RoSjlFL0dnTkhXTDVSQVM2RnRl?=
 =?utf-8?B?d1FVYnJtOUtDcnpGWnYvL0RML3dZVkhtay9GSlA3RnJ4U2h4WkIxZUowZnR3?=
 =?utf-8?B?TTQxSXN3clBBSk5oc3dGOXJPOGJzL1pOR2t0MHUzR2xVVDRnN3BwK1BKeWxG?=
 =?utf-8?B?QmV4WWRLMGZOVld3bUdQazNNWHdSaSt3V1ZXeUNjdERyMFdIRGJWc01YdXVo?=
 =?utf-8?B?SzQxNTNuN0c1djExVmlxOHJjSEVxaGVtcm4vWnZCb1Z0aXcxOVdXcTVxZ2pH?=
 =?utf-8?B?eTNseWFlbFpUVkNNQU9UYktxTytGSzRmdS9YaCtmTjFYaFZMd0JheHVhTmFa?=
 =?utf-8?Q?HoGZKyjbiP+ZRRcRoSk1zmj/4KNvDvHi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHIycTc3bTRHbnFwQTJhZHhkbGNybTh3UkUxWnNsUEQzVWZSOWk1Z1BwSVZs?=
 =?utf-8?B?VjdVdkkwSnJuai84UWJpMEpkRXBPWFJKcDZ3VGNGc0RnaWI3N1VOeDNWUWxC?=
 =?utf-8?B?T05EeUNDbXdSSG8rNDBxZkRaM2pNcVJMRjc1OGcyMjN5WWNSZnRnVEJIclRH?=
 =?utf-8?B?WEsyTVJtbC9SWC9leUozUVJPQkR3MUJYR1NOMGtVRnpKM2Rmb2l4WXU2dnd5?=
 =?utf-8?B?dnMzMkJSS25KeEMxb0ZWak9kUE4rSFI1OFBUckhoQlNFUllLc0kyKzNkK1Fw?=
 =?utf-8?B?QmRPSEhwS0xBNWxodlVYcTJKYmtjd1ZkVVVTeHl2SDh5T3ZKSXBUbDlwT0w4?=
 =?utf-8?B?U21OSWZmOXpBUDloekt4ZlY4UlpIbHZwVnBBTS91RXpHMmdhMlZKR1hKZHpO?=
 =?utf-8?B?eDMrU21iRE52bmlibE04RkVFRng0Uk1FRmpHZElnZDhFelVwUEl3UW4rNzdw?=
 =?utf-8?B?QzArdGF4MXRDZUVpSlZSYTU1YjFlSzljN2RFemc2ZG9lK0c2andYK2locncz?=
 =?utf-8?B?b3pCeDhBM2JOSXNaWG1jUmdzT2Nmb0pPMUNya01WUG9nckNmZ2IxK2xHT0N0?=
 =?utf-8?B?YUhlcjVCYVVmSEdtd3Z2bmVUeC9qRWhqNDh1L2xxakJDcDlrQ2Z1aHpwcHN0?=
 =?utf-8?B?TXJNYkpaNDV5TkNRRFB6KzhiQW5VSU1uMTZJOEtyYTJqdXRLNEJqSHU1aXkw?=
 =?utf-8?B?L2l6NXBnR0FYcy9INm9BTWJpUkI4WFRsTXJ0MEJDbmJEL0paTUtjb25FdTAv?=
 =?utf-8?B?c2ZVNmFmWEF6d0ZUeDFYWG4rK3ZkaUhvSUlmRGorenROdmlDVmdZMTB2VEEw?=
 =?utf-8?B?dmM5KzFjMGNJcUhUeFZ1L0owN0l1U0tKc2prbDdwNmI2L0VCQTlweHQrNlRC?=
 =?utf-8?B?NHBqbEE0SFNwcjNJM0V6ZUw0ZE5PMEtiQ0xMbXJDRFVzYXFFZk1BRTZZS1Rh?=
 =?utf-8?B?YzNQWko3aWNobjE3U2tjYnpXSGdwWW5idTB5MFpIcU9OeTJNUjFSWDNSRkQ2?=
 =?utf-8?B?bis4VnpTM3FsMGh4STBucGR1dVdGT1o5ZmdlbVJnWlNRMTNXYmF3MG9WZ1JL?=
 =?utf-8?B?RktpOG1lV0tOV1YybjMyWHNoeUYydHd0VkR1NEtVSC9nVUl5Uit3UDB2TGZL?=
 =?utf-8?B?UFJrb3NZSThSbS9BVXQydzgwRzg1Y2R6V3BpUFQyckpuQThueXlDVHJSS2Mx?=
 =?utf-8?B?SGVYYlVVRFlYc3o0aVJXemplUFJCS3QrcTdEU3VpLzN1eDNmYytEYzgrbUtw?=
 =?utf-8?B?eWQ4ankzUWJPYnZCMExiTm51Q1JjY2Z3RXpPZlVCRVI2YUJIbWJJaVg0YW9r?=
 =?utf-8?B?MWhxRHNrRVdDMENVSVNDMm5TUVpxUVRqQWpuN2RidmNvZnJremlUeDdDNG9R?=
 =?utf-8?B?eHpZRUg5MHQyUUliMGFYZjhKMlNhb3l0UkJOOW1DQ1RHVlRpWFpFejRpWHpW?=
 =?utf-8?B?bEZrSXB0NUxycUFBdnhaM2lOTmZTa2QzSWJvUFR5anlicDE1RGpXeUZxS3g2?=
 =?utf-8?B?MUFJOE03Z1doTFZNMGZ5eVZIb0Q2WkMwMDhWSDF3SlpVNHpzZStjTzR5NHJj?=
 =?utf-8?B?bHdTWm9FbUZYMHIwOVkyTU5yNS9pWjBtdUYrdXI1ZjJHWWZvekQycndGRjMx?=
 =?utf-8?B?L2l4VjVrRCtDdGZKUjJOcXhiVzJMNEVmS0VlcG9tSUUydHdoU0pjNTQxaTZy?=
 =?utf-8?B?ck1PWmJyMlZQWW1zTFJxd1NnRW5nMlRLZVAvWFh4SG9ybk9xa0srZ3V4cVZX?=
 =?utf-8?B?ZzRnL25ralBnN3o2YTYyTE1rTjVBOWFTSVdUaVllZFRKcGFmOGVCOVVNaG93?=
 =?utf-8?B?REtmUlFrMU1UVnFUMG1LZzVBckVxb3dqVmErK2tQaE5rTkJIU2NqU1JoSzBh?=
 =?utf-8?B?TTA5dGZuMkZZdXBWeEdXWUlrS2hiTnFMbVExQkF1dXkrdWNJTm1ib0ZBWWlK?=
 =?utf-8?B?M3BvekpvS0RvL2ZYYlhqRXNZSnluRWEvQzdhQ25DZzl1clNuTnVuOVJaR1VG?=
 =?utf-8?B?eHpQUXBxblY1dXlSZHNvN2xDdW1jT0JQTVF4b3Y5amhjZVN3eWxkWFlQWDc5?=
 =?utf-8?B?elBheXF5QnB1bFY5bGptb1REN0RVeHRjNXRDVlBXbmVDREtoc0kyVFoyUXls?=
 =?utf-8?Q?7KQ4i8flFMZGxBQ0+uULLt5KI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0adf201e-43bd-4aee-c694-08de38ac2346
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 11:55:11.2796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+jTaGNRcz89K9OjiVciZcLftKmdjEV6lFdN6uA1FXIGVQtHivq4EIcycjp14++H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9552
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

On 12/11/25 12:32, Philipp Stanner wrote:
> On Wed, 2025-12-10 at 09:08 -0800, Matthew Brost wrote:
>> On Wed, Dec 10, 2025 at 02:06:15PM +0100, Philipp Stanner wrote:
>>> On Wed, 2025-12-10 at 13:47 +0100, Christian König wrote:
>>>> On 12/10/25 10:58, Philipp Stanner wrote:
>>>>> On Tue, 2025-12-09 at 17:58 -0800, Matthew Brost wrote:
>>>>>> On Tue, Dec 09, 2025 at 03:19:40PM +0100, Christian König wrote:
...
>>>>>
>>>>> I can tell you how I design it in our Rust jobqueue:
>>>>> Drivers create jobs, and in submit_job() the pass ownership over the
>>>>> job to the jobqueue – IOW after pushing a job, a driver can't access it
>>>>> anymore. In the run_job() callback, the jobqueue either passes the job
>>>>> back by value (ownership) or borrows the job to the driver so that it
>>>>> can be copied (this is done so that the JQ can hypothetically do
>>>>> resubmits).
>>>>>
>>>>> This way there is no need for refcounting (in Rust / jobqueue).
>>>>>
>>
>> See below. If you need to resubmit for any reason, where will the
>> information for resubmission be stored? Likewise, if you want to drop
>> additional references on fence signaling, how are you going to retrieve
>> that?
> 
> Well yes, as I just stated, it is, unfortunately, always necessary to
> have a list of running jobs. The jobs inside of it don't need to be
> shared with the driver, though.
Actually the initially implementation of the scheduler didn't had a list of running jobs.

The original idea was that you just call run_job() which returns a reference to the HW fence and then the scheduler installs a callback to this HW fence which wakes up the scheduler again to push the next job.

The idea of the scheduler being responsible to track what's in flight on the HW came much later and to be honest is actually not a functionality the scheduler actually needs.

> Jobqueue could do resubmits through help with that list, by running the
> desired jobs again. While run_job() executes, jobs are loaned to the
> driver, who only needs them temporarily, not permanently.
> 
> One could have that loaning in C, too, but would not be able to enforce
> it.
> 
>>
>>>>> Maybe the core of the problem is not so much the lack of refcounting,
>>>>> but the lack of ownership rules. Why even would the driver need the job
>>>>> still after it got pushed? It should be fire-and-forget.
>>>>
>>>> Yeah, that sounds sane to me as well and is exactly how it was initially designed in the drm_scheduler as well.
>>>>
>>>> The job is basically just the information the driver needs for the submission which it gives to the scheduler on push, and the scheduler gives back to the driver on pop.
>>>>
>>>> The full execution time is represented by the scheduler fence and not the job. And the scheduler fence is reference counted exactly because of the reasons Mathew brought up here.
>>>
>>> Would be interesting to hear where Xe would still need the job. If only
>>> the backend_ops give a driver access to a job again after it got
>>> pushed, then it should be safe.
>>>
>>
>> Xe needs a subset of the job after submission to handle tasks like
>> resubmission after a device reset.
>>
> 
> the job or the jobS?
> 
> Because you get the job that caused the timeout by the scheduler,
> through timedout_job().
> 
> And the rest you need will soonish be obtainable through the new
> iterator. So what else do you need?
> 
> 
>>  It’s questionable whether we need
>> this, as it shouldn’t happen in practice—only individual queues should
>> fail with a working KMD and hardware. It likely doesn’t work anyway if
>> queues have interdependencies. This is really an opportunistic approach.
>>
>> However, we absolutely need this for VF migration resubmission. Again,
>> this requires only a very small subset of driver job information. I
>> believe it’s just the starting point in the ring, batch address(es), and
>> a pointer to the driver-side queue object.
> 
> In Rust, I borrow the job to the driver. So if it really needs
> something about it permanently, it can copy it into some object with a
> decoupled life-time.
> Or maybe have the job-struct's generic data-field contain something
> refcounted, IDK.
> 
> 
> 
>>
>> We also build a reference-counting model around jobs, where the final
>> put releases other objects and runtime power management references. This
>> assumes that the job’s final put means the scheduler fence is signaled.
>> Again, this is really just a small subset of information we need here.
>>
>> So if we add hooks to store the subset of information Xe needs for
>> everything above in the scheduler fence and a non-IRQ, pausable callback
>> (i.e., won’t execute when the scheduler is stopped, like free_job), this
>> could be made to work. We really don’t need about 90% of the information
>> in the job and certainly nothing in the base object.
>>
>> This would be major surgery, though. I suspect most drivers have a
>> subset of information in the job that needs to stick around until it
>> signals, so this means surgery across 11 drivers.
> 
> Not sure if that's worth it. My hope would more be that interested
> users with firmware scheduling can switch to jobqueue and start over
> with a fresh, clean design with proper memory life times.

That sounds reasonable to me. I was more than once at the point of wanting to nuke the scheduler and starting from scratch again.

>>>> I'm absolutely not against reference counting, what I'm pushing back is abusing the job object as something it was never designed for while we already have an object which implements exactly the needed functionality.
>>
>> Well, oops. Having free_job called after the fence is signaled is how I
>> arrived at the implementation in Xe. I agree that if we can move driver
>> info into the scheduler fence, this could work for likely everyone.

Ok in that case I'm going to give that a try.

>>>>>>>> And my uneducated guess is that it's happening in amdgpu. It seems a
>>>>>>>> sched_job lives inside an amdgpu_job. Can the latter be freed at other
>>>>>>>> places than free_job()?
>>>>>>>
>>>>>>>>>
>>>>>
>>>>> […]
>>>>>
>>>>>>>>> It basically says to the driver that the job lifetime problems created by the scheduler is the driver problem and need to be worked around there.
>>>>>>>>>
>>>>>>>>
>>>>>>>> My POV still mostly is that (with the current design) the driver must
>>>>>>>> not use jobs after free_job() was invoked. And when that happens is
>>>>>>>> unpredictable.
>>>>>>>>
>>>>>>
>>>>>> This is somewhat of an absurd statement from my point of view. I have a
>>>>>> valid job pointer, then I call another function (see above for an
>>>>>> example of how drm_sched_start/stop is unsafe) and it disappears behind
>>>>>> my back.
>>>>>>
>>>>>
>>>>> The statement is absurd because reality (the code) is absurd. We all
>>>>> are basically Alice in Wonderland, running as fast as we can just to
>>>>> remain on the same spot ^_^
>>>>>
>>>>> What I am stating is not that this is *good*, but this is what it
>>>>> currently is like. Whether we like it or not.
>>>>>
>>>>> The misunderstanding you and I might have is that for me jobs having to
>>>>> be refcounted is not a reality until it's reflected in code,
>>>>> documentation and, ideally, drivers.
>>>>>
>>
>> I agree this part is badly misdesigned. In the timedout job callback,
>> you’re handed a job, and if you perform certain actions, it can just
>> disappear— even all the way back to the caller of timedout_job. That’s
>> not great. Then we have this free_guilty mechanism to avoid it
>> disappearing, but sometimes it still does, which is horrible.
> 
> Who makes it disappear, the driver callback? Because that free_guilty
> mechanism is what frees jobs in the first place.

I think so yes.

> The more you think about it, the more astonished you become how this
> could ever have been designed and merged that way. There was no clean
> design anywhere, neither with APIs, nor life times, nor locking.

Yeah, which is exactly the reason why I said I'm not going to maintain that stuff.

I mean I still feel guilty that it came this far, but yeah.

>>>>>>  The safe way to handle this is to take a local reference before
>>>>>> doing anything that could make it disappear. That is much more
>>>>>> reasonable than saying, “we have five things you can do in the
>>>>>> scheduler, and if you do any of them it isn’t safe to touch the job
>>>>>> afterward.”
>>>>>
>>>>> Yeah, but that's drm_sched being drm_scheddy. Before I documented it
>>>>> there were also these implicit refcounting rules in run_job(), where
>>>>> the driver needs to take the reference for the scheduler for it to be
>>>>> non-racy.
>>>>>
>>
>> Yes, agreed. This is my fault for not being more responsible in fixing
>> issues rather than just backing away from these really scary parts of
>> the code (e.g., drm_sched_stop, drm_sched_start,
>> drm_sched_resubmit_jobs, etc.) and doing something sane in Xe by using
>> only a subset of the scheduler.
> 
> It's a bit like writing C++: no one can ever agree which feature subset
> is safe to use.
> 
> That's why we want to do a fresh restart for firmware-schedulers, since
> they allow us to drastically simplify things. Timeout? Close the ring.
> Job-pushing is fire and forget. Resets? Rings aren't shared.

+1

>>>>> It also wasn't documented for a long time that drm_sched (through
>>>>> spsc_queue) will explode if you don't use entities with a single
>>>>> producer thread.
>>>>
>>>> That is actually documented, but not on the scheduler but rather the dma_fence.
>>>>
>>
>> spsc - "Single producer, Single consumer". So it is in the name.
> 
> Ah, NTOTM.
> 
> What's obvious for one party is a mystery to someone with a different
> mind. I recognized the meaning after months, after work one day.
> 
> But don't get me started on that queue……
> 
>>
>>>> And that you can only have a single producer is a requirement inherited from the dma_fence and not scheduler specific at all.
>>>
>>> What does dma_fence have to do with it? It's about the spsc_queue being
>>> racy like mad. You can access and modify dma_fence's in parallel
>>> however you want – they are refcounted and locked.
>>>
>>>
>>> P.
>>>
>>>>
>>>>> drm_sched got here because of gross design mistakes, lots of hacks for
>>>>> few drivers, and, particularly, a strange aversion¹ against writing
>>>>> documentation. If Xe came, back in the day, to the conclusion that job
>>>>> lifetimes are fundamentally broken and that the objectively correct way
>>>>> to solve this is refcounting, then why wasn't that pushed into
>>>>> drm_sched back then?
>>>>>
>>>>>>
>>>>>>>> To be unfair, we already have strange refcount expectations already.
>>>>>>>> But I sort of agree that there is no objectively good solution in
>>>>>>>> sight.
>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Let me respin to my documentation series and upstream that soonish,
>>>>>>>>>> than we can build on top of that.
>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> P.
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> 2. Move reference counting to the base DRM scheduler job object, provide a
>>>>>>>>>>>    vfunc for the final job put, and document usage. Medium invasive.
>>>>>>>>>
>>>>>>>>> I strongly think that reference counting the job object just because the scheduler needs it is a bad idea.
>>>>>>>>>
>>>>>>>>> With that we are just moving the hot potato from one side of our mouth to the other without really solving the issue.
>>>>>>>>>
>>>>>>
>>>>>> See above—I can’t say I agree with this assessment. I think the lack of
>>>>>> reference counting is exactly the problem. I don’t really understand the
>>>>>> pushback on a very well-understood concept (reference counting) in
>>>>>> Linux. I would sign up to fix the entire subsystem if we go this route.
>>>>>>
>>>>>>>>> If a driver like XE needs that for some reason than that is perfectly fine.
>>>>>>>>
>>>>>>>> Nouveau doesn't need it either.
>>>>>>>>
>>>>>>>>>
>>>>>>>>>>> 3. Move job (driver) side tracking to the scheduler fence and let it
>>>>>>>>>>>    control the lifetime. Very invasive.
>>>>>>>>>
>>>>>>>>> Thinking about it more that is actually not so much of a problem.
>>>>>>>>>
>>>>>>>>> Let me try to code something together by the end of next week or so.
>>>>>>>>
>>>>>>>> The hero Gotham needs :)
>>>>>>>>
>>>>>>
>>>>>> Are you sure about this one? I think unless the problems around
>>>>>> drm_sched_start/stop and free_guilty are fixed, my feeling is this
>>>>>> entire thing is still badly broken for anyone who wants to use those.
>>>>>>
>>>>>> To sum up this whole email: I strongly disagree with option #3, but if
>>>>>> that is the consensus, I will, of course, support the effort.
>>>>>
>>>>>
>>>>> I would like to discuss those topics with Danilo, too, who returns from
>>>>> LPC soonish. Also to get some more insights into Nouveau and our use-
>>>>> cases.
>>>>>
>>>>> My suggestion is that we pick the conversation up again soonish.
>>>>> Christmas is around the corner, and I suppose we can't fix this all up
>>>>> in 2025 anyways, so we might want to give it a fresh re-spin in '26.
>>>>
>>>> Since we finally found the root cause I'm all in postponing that till next year.
>>>>
>>
>> Ok, glad we found the root cause. I’m not as opposed to option #3 as
>> stated—this was a bit of angry typing—but if we go in that direction, we
>> really need clear rules, for example:
>>
>> - A job cannot be referenced driver-side after the initial
>>   drm_sched_entity_push_job call, aside from a single run_job callback.
> 
> That's what the current code and documentation demand, yes.
> 
>>   Maybe run_job is actually replaced by a scheduler fence input?
> 
> fence input?

ops->schedule(job) ?

>> - Drivers can attach information to the scheduler fence and control its
>>   lifetime.
>> - Drivers can iterate over pending scheduler fences when the scheduler
>>   is stopped.
> 
> That sounds as if we're about to make a mistake with the job-iterator.
> 
>> - Drivers receive a pausable callback in a non-IRQ context when the
>>   scheduler fence signals.
>>
>> etc...
>>
>> Again, this is a pretty major change. I personally wouldn’t feel
>> comfortable hacking 11 drivers—10 of which aren’t mine—to do something
>> like this. Refcounting the job would be less invasive and would make the
>> existing hairball of code safe.
> 
> See my firmware-scheduler comment above. The issue is that getting
> systems with lax rules back under control in hindsight is 10x as
> expensive as carefully designing strict rules from the get-go.
> 
> My experience so far is that a maintainer's primary job is actually
> keeping APIs consistent and forcing people to document everything
> properly.

I would rather say that a maintainers job is to reject bad ideas and push for good ones.

Christian.

> 
> 
> P.
