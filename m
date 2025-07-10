Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93643B00153
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 14:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2401910E20D;
	Thu, 10 Jul 2025 12:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4/vf8rH7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D386810E20D;
 Thu, 10 Jul 2025 12:13:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3TRvrfZjwmjABf/isMKaMOkYiNLpJz2XAj8s9uZSw0y8yg/2EgNeEzwGmHnG1Ijr8kCU85Edaj4pAYU1hhe24Ju/a6XBQ4KnxxzU7/96hiwIKMAy7rRd3BN3g+0vbKsCthOHBBv2lqPPPwWF3LS6/5l/wNCwRHBWkRvQ4IiW/d4cdjRkcevdZJSjj5SZMf5a4ijHjAx4ctkIf4lFCV8fCKIvQyZgFHwYbLxy7KkxjqO1IozvlJ/T57P19WtmKpl1iKsYvEtaCU52OQzXFWpM5dVMm02L1/IkQa8eivcigZdEC3jryescbvqElsbGRmRJnwwvHlswzUOfdLrnPLd7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jJDCRk2EBGz3xUg5fBFS9YTq+3Vr+RW0MaQE2/oXKA=;
 b=dtmd5NXyEhg82aV8rGhB6w6jZv36GLGYL3KCQNH0QtvBCfbXrDWF/OXLEx3Me6lx+7fSgjSsSt4mmDQ1g1ZfJps6XA1WzJ9x2Bq3yH/gNEBfax79TgCrFpcscMPzwDEK9yisjFeLN6TGRajtghDKtA0lQ9vS7y+jw9wlz5RWjSD3VgkVrDnOUeue5xSbzO4Ap6BFWZII6RYuJdLTDj9/LEjNoh/9be6HMz2nV0F5kQJib6TCSGeyIzrcWZ9pV/BJZzFAIDiCvCPwZdGDi2uds7n3DBL7zEG7KJn4ay0C3PEIhCAbEpYIesx/wP3XLfkAnzDAbHzQTvcFNsZGxnRvTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jJDCRk2EBGz3xUg5fBFS9YTq+3Vr+RW0MaQE2/oXKA=;
 b=4/vf8rH7tEdtu1k1Guef1mBNR5GYTVL9Jf9qrbWExE0p3XuHwiDCh2rXzcKl89JQvgefjHpy6PwLsVxWQAG6Qt/EHFPCF9RqKJ0XjVON8uYOaomykQLWQ6pbV0E8s897tuUkBKiXvalD98B6eAQpDiOzMuNLk0OrtGd3mY5R9+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB7663.namprd12.prod.outlook.com (2603:10b6:208:424::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Thu, 10 Jul
 2025 12:13:37 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 12:13:37 +0000
Message-ID: <b9bb9865-8bf4-4d9a-9bfd-945d38a7698a@amd.com>
Date: Thu, 10 Jul 2025 08:13:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] drm/amdgpu: do not resume device in thaw for
 normal hibernation
To: Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, rafael@kernel.org, len.brown@intel.com,
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: lijo.lazar@amd.com, victor.zhao@amd.com, haijun.chang@amd.com,
 Qing.Ma@amd.com, Owen.Zhang2@amd.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250710062313.3226149-1-guoqing.zhang@amd.com>
 <20250710062313.3226149-6-guoqing.zhang@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250710062313.3226149-6-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::32) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e436dd2-86ec-4076-fa2f-08ddbfab32b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXdoRDlHYU9waUFRVGlEZnE2dEtEdVIwd3V4WWphcGczZzdKN1ZGb1Q2UFhP?=
 =?utf-8?B?RTkvN2NqL1FmSDVDODRjRHRKbWlZL0FUK2pyK3pQL1ljbkNpM0Y1WUhST3E0?=
 =?utf-8?B?Njh1QzFNYnZCUzBCcklMVExzeGNJNDNLU2h3MUdEYjZLeUtvcmtlRk96Ly9U?=
 =?utf-8?B?K21sZDNFQWNkbWFhbXB0d3FaeVVoZ0pGMTA1MTZJR3IxS2IvRkQ4Zm80Q2t2?=
 =?utf-8?B?bnUzVXRJZTg1dlp2OXFJVUNrZXdqb20ydzVXWk90cytxOUpSTkVJd0x1WDZy?=
 =?utf-8?B?WWJhbHpGOVU3K1hpT011bXVrblhpdWQ3TzVBZVdYZWtDSXRJMGRYTDRKdCty?=
 =?utf-8?B?UUdlSEphTGFFY3JtU2FteDd0dWlaVnMxc2lPTUJ1SFF5K2QyTWk0LzV1b1Jr?=
 =?utf-8?B?YTUzWnBDengvU0F3clhCQlVwZlRMcjBDdXlIZ2g0b283bVlLQ1F0S2o1VGNU?=
 =?utf-8?B?eFhFRHU2cUVreUhTanQxZEkvRjB3YU51TVlaOVRZbGFpY3NnVlcwOUJjc0x3?=
 =?utf-8?B?dU5pSngrcUhwaEFUZVBlRFFaR0FIaVNORkpqTXFxUyswbGJRQWhnZmZ3aW9r?=
 =?utf-8?B?dTBlYWVWMHVtN3dDcXRlUXAxaGd4d09PbENidHR5UzhzSXJxQ2lwVzhSL2VW?=
 =?utf-8?B?b3Q1RHJrN2k1Q1U3Q1UrVFdyeTE2UUY1LzUxUWNvUk9WUWJoMWpFVFl6U25h?=
 =?utf-8?B?QkJlcHgyb2p1VVBjekM2cjl0WFdTV1AxQ3dieUNCTlRuaWpseHU2ZFcwNjdL?=
 =?utf-8?B?dVBZMjNwMm1HaFlrRDRYaEJUNGxydGt1NnZZRGtGNUNaMmlDT0QzeDNOenMy?=
 =?utf-8?B?UGVXN2dSMi96bTNrZWtEelVNUTNVMVBlR09nS2VMbS9Gd0JCamdMMW5jNXBT?=
 =?utf-8?B?ZGJNNFd5TkxJdUZyaUlEOHhiTU1qdXlIL2IvTmlHbU1wU0IvSkU4dEZJREdU?=
 =?utf-8?B?akdjanZ0MmwrUlpTVDB3NHNSemhFbDdELzJuMEdPQUFqazk2U2Yza0JaWWZM?=
 =?utf-8?B?cFFDY2tMTnp5V0x3eDRRS3ZCNHdPOUdGeUR6TGIwRHJrRnU2bm1pUHp3SHJt?=
 =?utf-8?B?SmdDVDlvN0VNMWl0cTBnNG9IUzZRQXQ1b2lVVFExaFg4aXowbGtxbW51dEYr?=
 =?utf-8?B?ZExrZ1ZhbXNUSUFaRENRK3dRV3dqUnJVNXlsckpWNzc0VGdLK2JYQkRpTHNE?=
 =?utf-8?B?OVpQdDU0MkF1NFF0ay9KNkRnZXY2ejhyNHZ0ZDRlK3BwYTRhWjZlN1hJYjdQ?=
 =?utf-8?B?T3dSM1JhQWFqbmhNMS82OHU5OUl1QkVtOEhnUGNjSUUxQkFhVnY4cFBzaFRv?=
 =?utf-8?B?MjFIOG8yc0Q0aFVyVHpReGI2c0pVYzB6UTc0ekJvcWlzbHpUVUd2bHphZEFC?=
 =?utf-8?B?SWxINk5ETXQwSXE0MEY5SyszRXpZckhHZS95TjVFRVFDNUdNQ1YrVE5kalE4?=
 =?utf-8?B?KzZtZmdEQW95TlBDcWw1czQ2OGNKTTMrN1lzeDJlQUxmYXVLbTFGdWMxaExC?=
 =?utf-8?B?M3dFTGFrMzNJZDh2OC93TXRJZ3kvVXJMODNzTTJWZndhWkRuMDBpWHJ0dGth?=
 =?utf-8?B?VXA2MXIxMzlVaDdGcitGTkcyWXpVM2dzd3hHcTRuOHU4cmVRT2gzajdZQ1h4?=
 =?utf-8?B?VDBMekM4bmdOS29CbEhHMDN1dTlXaXoxSHJKREUvR1J0Z2orNld2Wkg4am05?=
 =?utf-8?B?RVQrQTc0WFozclN4aGg4VERIVEpXMWdab1dUNVlmK1ZTeXIyWGdJRi9XZGtP?=
 =?utf-8?B?ZjRxd0RkZHJCQWhleUxYZjR0VG9BajMzaTRRNjFYbDB6c2ZYSEZJWjQzVkxu?=
 =?utf-8?B?cERjTDZiUVNnSGprYml6U2QwU050QVIzVHZVWmE3ZDFaU3QzdE1MK2lHVWxm?=
 =?utf-8?B?MTAwUkpXOENlNWhLZm1BODY5MEJzNVFsTHdHbm1oaUNhdnc2ODc0bUtXQ0VK?=
 =?utf-8?B?dTlJeXpzTWd2bC9TY2dWUHMxM203TWZhb1pwNkJSb2wzNzlJK2lvR0dncGp2?=
 =?utf-8?B?VFFhRmhJMGJnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFBuVXBUeExyckJ4NXlXNTN6Qk9wbENqWXpPbitnYnhtSkdQWDU5dkRacHlV?=
 =?utf-8?B?SWVWUmJPV3Vxck9INjZmdENjT2E2ZWI5NUVGMjBDUnV6UnVtNmJsaEZvTkMy?=
 =?utf-8?B?NU9Id3ViYnY3TGZBVHhDb0VtOXg3VFBua0xhZWEydE9qVngxY1NvSmtIU0M4?=
 =?utf-8?B?VWZyeWRONFRBVkpURXI0b2RGS0NxSkJhNDd0aWdBTTlCWVVGUHAwRDc3OVpn?=
 =?utf-8?B?TWZGUTFOWEM4ektyZEpZZ0ZrSmNiS2MzZktGSzVzaHBQUWVjTm45YXJZUlVO?=
 =?utf-8?B?eUZmUjBINE92ZzlZTlRTTU1VM3h4UkoxZWhrQk1Ic3dERDRLYml1WTJjMTdP?=
 =?utf-8?B?elB4bVZ5QjJWenBudGpyRk1mQURVZ2lTTjFTU2FtUHMxeXczL1FOSzVmZytj?=
 =?utf-8?B?RmMyV3ZsNHhGWFBIZ0dxRVJTb2JDSG9HMTJOQ2NQeDY0RHdXRno2dTQrRksv?=
 =?utf-8?B?eGowK1pEekhZS3NJQklDQmVPN2EvbFNNVkJOaHJUZWVYSU9CT3JKUERIdVZN?=
 =?utf-8?B?RjJlcGg0S3ZyL0NPZEhlRGlRWUwwTWRhSFp5U0hXY1hNM1NFKzNLWlF0RDdO?=
 =?utf-8?B?SHY0Q0FjckRUTEJWVjRZaDVVdFRPNUxENll0L3JmMHZBMVBRM0NyVmhqeWda?=
 =?utf-8?B?Rkl0Y0FpMUdwR2o0Y2dLRzZCV2M3MHh1NVM0ZFpCbU5Dd1BpOTJXZC9Cdmxy?=
 =?utf-8?B?QWZPTnpTSnlWMUxzcVZqNUJsbzRzSEV2cG5FZSsyRkwrc3IvcUJlaks1d00v?=
 =?utf-8?B?NG5kSTIyZXFCMVB4emZSb0xjY2ZDY0ZkRmlMSWZmUjN3bVp3b1NHMUpRRVZJ?=
 =?utf-8?B?cU1ZREtoWVVZNHVXTlB2VFA1M1ptd3E0ZU9hVm1sdThHRVc4K2EyL1V6QXpC?=
 =?utf-8?B?eFV2bHJ6dFdrNndSL2RveWFDcFlWYk9OeHJwY2hEb2tMZlUwUXM4N05VckJ1?=
 =?utf-8?B?VUZsQUZCeXh1ZnJldTBWWXpOYkw1dXB1R3dGaXd3amFaMHRUK3E4VGdGVTQ3?=
 =?utf-8?B?WHE4cnphVW41UjhRVXV4MlM5OWpISXZQNS9nUzRKcFM1VFg1RVZ3L0FERTQ5?=
 =?utf-8?B?eEZ1MnZGMDZkZ21EUVpHR1hSenFJUk0vTEYxdWg1NmMrc2tKR2U1OXBkY2Fo?=
 =?utf-8?B?VkcwWGZwM2NrRFBFWHN5QnpyVEhLTWFWTnNySng2b3NJSVdjdS9sT21kUENV?=
 =?utf-8?B?dE1RWmJSejlMZ1VIYUQyd0xhclNoWFVyclRBaHBYdytWMjJGeU1iR0lsZEJU?=
 =?utf-8?B?Y2VWblBCQmlWMUlPanhVSDI2Nk91SXZmUVoyN0Rldi9CT2QvNVJ3aWMvUE1a?=
 =?utf-8?B?T1htQW1TNDJabUJsTnZ1b1BoNkxWNnI1ZDZMQnFtTGcwWTltcUNLS2lUNE11?=
 =?utf-8?B?b3NKZzVrQWhONVAyTFNnMjRJTUJTdGNoOGNHL3V2TGpjTmtJN0pvMFJndlky?=
 =?utf-8?B?cXM3aDRtY2l5WEptMWpSSEpGNlMrNW1IaURKeHEzNEx4OFBscEdoV01CQlJp?=
 =?utf-8?B?d29KdktzTU5vSnRYQzg1WnE4NG41ZnF3Q2s2LzJiK2xyUzMwWjkyWFR1ZnB5?=
 =?utf-8?B?WGN5Y1hGWk9QTlF2aVBLNTM3aFQvMzVVZmZoZWVnSTRoKzNTMDdpbHo4UGU0?=
 =?utf-8?B?MFhhYjUyN0NORE1iN1pRSEdPMnFMNUlpYjJQbENtdks1TEFIRmNpYXBwR2tC?=
 =?utf-8?B?aXVOZTN6elAyaUpRd2tDelFIWUpvQ0wxOUxtLzRoQmI2WXdSNHcwMU9PUCtt?=
 =?utf-8?B?UWo4QW8xUUdwOXZiVnozb0Y2Y1VBTFlyS2xueEhML0hGSUc1eENNWUVWaUo1?=
 =?utf-8?B?aUNFSmROQnUwdzNqYlhqejZKc0RCNEJPUmFzR1hiai9wTGNhL0VmK2VYdUpW?=
 =?utf-8?B?Y3Q2V1Q2cjVOR3AxaUZaQk95WlFBRmZmNDVRaDY1dVdYd1MyT3A4S0VLMDF5?=
 =?utf-8?B?a2l2TzBoeDgrNkdrSE5MMUpRMFlETVdMU1pod0E2ekU5d1N2bXhrSkhjYlpu?=
 =?utf-8?B?Wm9QakdvVVlWZXBRUHM4V0lLQTAzbkZreFl1VFVqclQ5RzhHWmJ1UHBKUUZ6?=
 =?utf-8?B?c2hGY012MTkrR1JBWkg2dVl3ZVFIKzZGcldSS085VWs5V09pZC9mWDU5WnlX?=
 =?utf-8?Q?wbGkWWqGxp2IqxqDsB8nawpPj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e436dd2-86ec-4076-fa2f-08ddbfab32b5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 12:13:36.9341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2dlCNRfGZTjCGuTYSDiNtlKSGf78bmwQV/8uvjfGG2biY7j8XYa+lArJnkdI5RDWg7ijEz7dw1kkDbZd2lqUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7663
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

On 7/10/2025 2:23 AM, Samuel Zhang wrote:
> For normal hibernation, GPU do not need to be resumed in thaw since it is
> not involved in writing the hibernation image. Skip resume in this case
> can reduce the hibernation time.
> 
> On VM with 8 * 192GB VRAM dGPUs, 98% VRAM usage and 1.7TB system memory,
> this can save 50 minutes.
> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> Tested-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 1c54b2e5a225..021defca9b61 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2541,6 +2541,10 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
>   	if (amdgpu_ras_intr_triggered())
>   		return;
>   
> +	/* device maybe not resumed here, return immediately in this case */
> +	if (adev->in_s4 && adev->in_suspend)
> +		return;
> +
>   	/* if we are running in a VM, make sure the device
>   	 * torn down properly on reboot/shutdown.
>   	 * unfortunately we can't detect certain
> @@ -2557,6 +2561,10 @@ static int amdgpu_pmops_prepare(struct device *dev)
>   	struct drm_device *drm_dev = dev_get_drvdata(dev);
>   	struct amdgpu_device *adev = drm_to_adev(drm_dev);
>   
> +	/* device maybe not resumed here, return immediately in this case */
> +	if (adev->in_s4 && adev->in_suspend)
> +		return 0;
> +
>   	/* Return a positive number here so
>   	 * DPM_FLAG_SMART_SUSPEND works properly
>   	 */
> @@ -2655,12 +2663,21 @@ static int amdgpu_pmops_thaw(struct device *dev)
>   {
>   	struct drm_device *drm_dev = dev_get_drvdata(dev);
>   
> +	/* do not resume device if it's normal hibernation */
> +	if (!pm_hibernate_is_recovering())
> +		return 0;
> +
>   	return amdgpu_device_resume(drm_dev, true);
>   }
>   
>   static int amdgpu_pmops_poweroff(struct device *dev)
>   {
>   	struct drm_device *drm_dev = dev_get_drvdata(dev);
> +	struct amdgpu_device *adev = drm_to_adev(drm_dev);
> +
> +	/* device maybe not resumed here, return immediately in this case */
> +	if (adev->in_s4 && adev->in_suspend)
> +		return 0;
>   
>   	return amdgpu_device_suspend(drm_dev, true);
>   }

