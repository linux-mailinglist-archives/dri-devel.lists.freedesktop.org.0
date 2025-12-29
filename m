Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D5CCE9301
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 10:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910E410E87D;
	Tue, 30 Dec 2025 09:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.b="sbV3LBaW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from YT3PR01CU008.outbound.protection.outlook.com
 (mail-canadacentralazon11020139.outbound.protection.outlook.com
 [52.101.189.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0687110E749;
 Mon, 29 Dec 2025 22:25:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/zuVgK2QxxGVwOKvLEFDJm81+NAAmOrxrfizm7cinPYnpiLARqhjFHSxV8Dgxtm0TBsyQ0GJoONggwMz6fQ2XpN3Ua4q+Wi+F0Uz1AEqAumO9RIF/Oe7MJRwcKPmm24COh4M+jEhraS0IuVEoUwLVymCkrZavIuBF9A+EV7FveYDc2OAKRjB3PiO58IxdE82wt9DQnZHkoy1zf2tGJfRLoYjJ58164l7EZwwWAnEBLQvt5SB9RdxXGzATo+I6zqjxHbZusYAeJYwY61QViOEu69DUj87frzdLehssMHm285UnJTwZaAIAe6zzYZbuSsaUE+JKqE57wRzMGcqDwD+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdfzNniktmm84vSXAoAbLkf7UZlF2yvswvw/7jKLYkE=;
 b=DsjIJmO4IVvc8oUiPoDiSRco4Vfd/SiiykEnFNmSWphdkLgwgDwZjCIH/dp2ue0HgNnj+4y36cUutJ6tdydDv11am/7M7PCUyBTTdmX9rWBCpwUBYfBrD709Kve3iV2iWHgwjYb2obOiLQQng6A7f48FuHSZ/LYe1hXZOJ8UiyHe/UyfByXBRfmXMr8yARcisPlTKk2Rh9JDBDzUUPWu115SUrB1Ncu5E5jgqvgr8G5Wet8wihGcr4hZNz516UeetyP7+liwt0i97lvca6tlg/13J21LNH3a+Nv6V0W76MMVHU3qEBU6UcyawGTkdEOFvL26flcbGISeXzequAO41A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdfzNniktmm84vSXAoAbLkf7UZlF2yvswvw/7jKLYkE=;
 b=sbV3LBaWquBKzKXKbQjS7OZK6G0hh1PggMs3L0LMSfBenI2FEeAnTqfzJtFL5pYgK1Y9nT72gtpMXuXGEcKtgQHmA8b7z3Fm7lD8pXkP2kSOSk7VPTtUUDC0ORE+/Ncysoo7PQWLhBMjCL3b9H0WzFtiOjBptQhqv43lPz/UQNi6RKff0J53LLnNTsjmTLCdXztFYFtb8wAIqWLwfFvW2ipt2nOJlEE5fMY5tbf2rBLF4SgRKjEx3VvrGoIcCRYI9GJjlehQv5LcUqDTquk1iNYoqDET9G7EzwMm3qYuPSUPU4uFvsVVAxgGUdXDQP5RGmPdAOvxXsxyFK7Zipjm3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT3PR01MB10750.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:fa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 22:25:12 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1%5]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 22:25:12 +0000
Message-ID: <9833cb61-1ec5-4cc1-ad9d-3e07f3deff80@efficios.com>
Date: Mon, 29 Dec 2025 17:25:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
To: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20251229111748.3ba66311@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::23) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT3PR01MB10750:EE_
X-MS-Office365-Filtering-Correlation-Id: a21f8d98-8aef-43c0-e3fe-08de472921b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2prTHlFZkNLWGg4OWhyc2swK3dNU2N2QU91NjBPMUc0dWx0UnFFaU52MmJy?=
 =?utf-8?B?TzY2WkRERmd5SFlxRU5pZHlHbGVOcmwvSmVxMStMbXVCQ08vemlSR0xKM3M2?=
 =?utf-8?B?MmNaOVFNQ2c1cmEvSjhDRXlFOU96NHdzVlFhMEFiT01ydGUrSk5hN051REdr?=
 =?utf-8?B?NitNSDRzTnpCVWtRajEzYVNPS0FNUHdMUG01elRJWUFTQnFWZVZpbUxycmUx?=
 =?utf-8?B?VzNvMWtEeUlUZkFaN3ZJTGZNeExRRnhYQ3FFSzFhbm5yYzFTUVJ1ZkVIM2NN?=
 =?utf-8?B?NWRVcnc1S0Q5ZERuNnJycHNITjR3SzRFdFVvL0JpN3RBT0NqL3JIMnRyYWpY?=
 =?utf-8?B?TVpUemxYQmxsZnJtaXA4WEY4QzluRkRuS2t4SFlqTzdLMjV2UU1xbUNteVRL?=
 =?utf-8?B?NnhTMGxLK016RmV5eGhXYXpRTGRERHI5RXBYVm5rU0JhcDIvcU9DZEs5L1VC?=
 =?utf-8?B?MlI3WnpvbTZYZmU2NjNUNVhTcEJ1UUxNQWExMTYwNXczdjRoY3IwUFlCWGk5?=
 =?utf-8?B?OTBxbWs4eDRFcWpESWtYTkdlYnYrcjlaY3Zic01WR0VvMUg2OUpXMGcyZEYv?=
 =?utf-8?B?dW5McWMyd3RPQTg2TUZMdXJDVWJxOGwzVjRIclAvNk0za1NJRGFZcmRxT01C?=
 =?utf-8?B?UXIxYUduSTY3ZFdraU5JSlh3b1J0UHVuUjdjWDladnNpTUN3ZVZNTVR5NTdJ?=
 =?utf-8?B?T1RmSGN1anJsNVpRaFp3ckZXWE92Z280TVVneWFYMU5hMjZtbHd3R0Y3cERt?=
 =?utf-8?B?U25oWFJQd09DV0JPa1pDWGlyNVVINlUveFhRQzA4ZzVCa041NkNFTnRoY25C?=
 =?utf-8?B?Z29UMTAxbGtqYU1HMklwZWpTak05WFdBbmVQZ3Q0elBlcU1zQ1ZlV3c1eVp4?=
 =?utf-8?B?TThrOVV2YjRWbkVqUHhNTE4wQkpPeGs2RCtaVmpVdEwvOFNPNGVmeGVWdkEw?=
 =?utf-8?B?WDM3OWpTSDBzRFJSVDZJOEhuK0lTVkZMR1pPRFo3dFB6L2srRVNoUHVVTzli?=
 =?utf-8?B?REZINzIvcW42ZDIrdFhhYWh6MHN6SzNNU2lsTFRXUDQ3VnpwUHViTHN4OVdr?=
 =?utf-8?B?SFdWYXVKSHRGMGx2Q01vV2RjRm56SHJjc3A1MldMb0FDS2JZODJIcG1uenRu?=
 =?utf-8?B?QjMvWWRIMi8zak5NSmxrb0RacmFvWHVMdVMzYW9aczBJVHlzYnZOVlpZZk9z?=
 =?utf-8?B?c0Z5MW9yalh0YlhJQW84M1JpeHMxNldqS3JUZEE5YXVJWDhNcVpNWGN3Q0FE?=
 =?utf-8?B?R3NlVzd4N29NcFYvWHE0MG0rUEQyV0tlOGI1aGljUDQvSXovL2RxRFZ0TDEy?=
 =?utf-8?B?VnZkSkIwUitVeUZkOE90cjA5bld6UGJ3QmxUWUxOK3hNRVVaQWIxWm43TFc5?=
 =?utf-8?B?TGZCUkwwQUZMbXRDK3VaUndTSmQxeWFCaDZzZTBaWThwUndoV0VYRFhiZGE3?=
 =?utf-8?B?dGw2djU5eDltRzdwSGdOd0tUWlZNaUtMNmxmazB5cm5UUmROUC9OZGhtNEJZ?=
 =?utf-8?B?TnpiSXR3VEZZMUVleFFvZ3JXeU9vdXZGU1I2UWJrZGwyOWVZYnFPaU5hSEpC?=
 =?utf-8?B?ZlVXOFk4UGpBVkpOWXIvalE2NzRyM0dKdFFDeExKMHNXOVdMUG9RbklLVUhZ?=
 =?utf-8?B?eEsxeUNxdTNrRkRFWDBEV2gyNHlaWDR6d2RzOUlQZXVIWHk1cEVTS0hQWjJw?=
 =?utf-8?B?NW5NZVMyS0VnSGNWdkYrcy9vSno5NU5jRFNLY3QxYVlvTE9TOHJhUDFWYXI5?=
 =?utf-8?B?ZjJNeUJleG14QmdYTEFEOHdXcHpoRG9tdG1HaHAvcVNFalUyZHgxUWU5eHV3?=
 =?utf-8?B?NkhOU01QYzV3WHhiSndMRE9LRTZGMEN6NHpJeDRtZWtORlN4bHFFaEhUS1ZP?=
 =?utf-8?B?N0pEbXFHR29TMmxnbGd0U0FTQmVZd3VMM3Q1RDRKdGZ1V2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEJmeDhPNENpa21RSExJcWlSb3FDdlJOckR2ZXlDRU1XOU5EZFBtVFR0TFZD?=
 =?utf-8?B?eWp1dkRBUDdDMkNJMUk0aFdyQm1sTU01Rlh0cnhGNUVvK0ZXVkV0R0xqSTds?=
 =?utf-8?B?Si9EeWlHeDdCTkpDalAyL3I3VFAvcDFVQlFLdlF6YnhXZVUzbXNvWFdSZmdn?=
 =?utf-8?B?K1FaeWVveVZHWnlPUk03OXU1R2Z3cGNoVXVYWEhvU05YMUxBSW9kaUlWVW9X?=
 =?utf-8?B?RE90ZVM5ZkFHTENoUXVmM3lJVS9pNGFoZDhVWnl2Z0RPQmpFOXdSNThCYVZU?=
 =?utf-8?B?RTRoSmZRN1Rodlo4NVJDQWhPdUhMN3Y2VklNL3cxUm1HaU5LNzR1Sm8weWpJ?=
 =?utf-8?B?b3BlN3Ria1U1TysxMkRqZ1lFaFIwc1VwNUUwRFlJTkNSdmFLeXVnRVNETWRF?=
 =?utf-8?B?b1lhOGdQTTdBWWVQb0gycmt5TldHOWxiMUR1NnRza2hFRG81Ym5yMVNkOXRL?=
 =?utf-8?B?c1o1ZDd1SUxsV2hSZ2NRbDhPM3ZVK0lZZTVtUVFFbFp4UVhPbWdWL1lMSGx2?=
 =?utf-8?B?Rmx0Szh0TWtVNjgrM2VJTmhvZXFyampFaE02VDJwODd2R0F2RU5Ub2IxMEpT?=
 =?utf-8?B?SDl4aVNLSXdsWGhWbUJJVDkxU2Q3b2w4YWZBVTA2djdwS2RXYmZsOHUrbG5t?=
 =?utf-8?B?T0VxbzcyamFJRHh0RVpoUlNpYkdETWczMDB0VzFEWHpWbGRLMndrMVFhOXl5?=
 =?utf-8?B?YUZDbzB3V0QxTDc4bFMydnZRbndMYWJQSXdLOXk5cHNERnJTRmVoZVlnUS9E?=
 =?utf-8?B?RDNsOWdnOElJdXJpNFg0c2NLSjNqdk1oMlluZjFjS3RFU21nWVMySlAwSE1u?=
 =?utf-8?B?M05pRlpkM3hVNjY3ZzVGMjhEdzdNTE92NFo1NE1ybHd5OWFXckM5MG9vTkVH?=
 =?utf-8?B?QzdhU090cGFSVzc4RGh5YWFQQTZmcGF6WFdicjVwWldXckJTL1ViVHpjakdQ?=
 =?utf-8?B?aVpjL004Y1FLWGJaaWR0dVpVZU5JMzAydm9Cc2M1ZU9xUkJDMkR1L20vZGtE?=
 =?utf-8?B?TmxaMU56enZKdit3WTR6TEIxL1YzQTFOUUtaekluM0xJNlYvQkwyMGZ1cG0v?=
 =?utf-8?B?QTZhSlpTWXFGZ01JZlVBVEl4aWlJeG1xU25yVkxXeWFyTENXNm90Q3FDSXpq?=
 =?utf-8?B?dGRBZGtUZzB1OHM0dEp5TlFHRnpQakdDNWI5NytPQmsxS1dtbmY0ay9YeW5u?=
 =?utf-8?B?em1WeEhxWWozRGVpLzNLeFNpQytid2ZNeHRTZU12MVFNUVNhZFZMVGNsTE00?=
 =?utf-8?B?b2pxT0liNEV6YnBMa1BNdXdsWEpPK0Y1OFNzbldSakRVMFN2U3RsQ2kxcFlQ?=
 =?utf-8?B?TndTNjVPQ2F5NjJYWGhQeXJsRkhpYjIzZmw5dERhQVhKRkJVQWh3NlJWOVVE?=
 =?utf-8?B?T2l5UGVHc1FVY2VidmI0Q2s4dkJET0IvS3hIWW5qMU8rQi9rSXJqSjlZZnRk?=
 =?utf-8?B?NmM4U1RlbXBwSnVpN1piTVV5VnZTQ1phMS9IaTVCbXhpSTVhakNuWE5SeUd1?=
 =?utf-8?B?cndrYVgzbEhJenRVS2FOM3I1TVJvSHFPWm5mZno2TWUxeFczajdmVGN4ejNq?=
 =?utf-8?B?aTBabWVsUllFOXpJQS9DMGZmMWFlbW1MZlNUdTNGTWhBeEF2dnpNQVRuZkRx?=
 =?utf-8?B?MzcrbmMxVnNZNVdrZ0NUMWQreGtxejBhV1FLWDdhcUNuQ3BOL3FMY0dmUGNW?=
 =?utf-8?B?WGQzcnlsKzFLRXltU1hVZTlUWGJPYVRVd0hMYmtMcm92U0gzWG04V3JTd0JO?=
 =?utf-8?B?WWFiaUlXaFVBV1R5L0Jmd2x0TVg0amUyTXJURUpzaEFrU3RacWVueGxHL1No?=
 =?utf-8?B?UnFLQ2dHZEp0Vm5LbmlrTUN4ZmxhdGxkenA4T0lpYXZlWWY5K284enhSeTBo?=
 =?utf-8?B?SWp2ajFpcmV2d3dxbmF1ZUpGNzRKWHByc0gvUTk4WGZrcEdBa2Jnc0YzcWc1?=
 =?utf-8?B?VmYyckFObTlLaFhHbDIrNndpcyt5b3RKRnloZWk1aCtaRjhFdG9NU3JUTEo4?=
 =?utf-8?B?RU1xSUIwUEVCUFBOS1JZRGJWdlA0VlNuRHJpWGQrV1VsOVdZV2FMS1M4c3U3?=
 =?utf-8?B?Z3JKOC80cEphdDZsdEdYOXJDNTlpdmJoMUxRMDUxOGgzOWp1ZDNrZmgyYzQ5?=
 =?utf-8?B?Q052QXI2ajZxWndtNU5Fa2RCRW56SnFnTENlbE1vczVVOXh0TTBoRUM2b2l6?=
 =?utf-8?B?YVRvTk8ySVhFaWo0cTJJQmZ0amRrVFBvZUdUZllYWllqcjN5aXpwaWtwSUUx?=
 =?utf-8?B?cXlGSWxwSHk0eVRwa3l2aFhkdFNiK0xzUkt2SEU3TzZvUzQxYWN2eDltTGFZ?=
 =?utf-8?B?ZTlVSWpWcVdkT1RNVStjOGhmK1FYZitjZE9iYTk3c0hyUW0wODM2a1I2d0lR?=
 =?utf-8?Q?prXIs2Nuu7cNjw+k=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a21f8d98-8aef-43c0-e3fe-08de472921b1
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 22:25:11.8952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOidrK1PWjkSOjp14R3tx/6AQ1BfeJRX3yg4dFxxA06rhIdzodXiTITYRazZGHI3e7QnsZmYowpZTOFYATJL58GxdQ4Xgb0JOoBDiMUC/AA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB10750
X-Mailman-Approved-At: Tue, 30 Dec 2025 09:16:07 +0000
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

On 2025-12-29 11:17, Steven Rostedt wrote:
> On Sun, 28 Dec 2025 13:31:50 -0800
> Andrew Morton <akpm@linux-foundation.org> wrote:
> 
>>> trace_printk() should be as available to the kernel as printk() is.
>>
>> um, why?  trace_printk is used 1% as often as is printk.  Seems
>> reasonable to include a header file to access such a rarely-used(!) and
>> specialized thing?
[...]
> Yes, it's not in your kernel, but it is in several other people's kernels
> as they develop it. And adding a requirement that they need to include a
> header file for every place they add it (and then have to remember to
> remove that header file when they are done debugging) is going to waste
> more precious time that kernel developers don't have much of.

I agree with Steven. trace_printk() needs to stay convenient to use for
kernel developers. Part of this convenience comes from not having to
include additional header files by hand. It has been around for
16 years and documented as such in kernel documentation [1],
LWN articles [2], and conference presentation material. Changing
this would lead to confusion for people trying to use the feature.

I personally use trace_printk() to sprinkle temporary debug-style
trace events in frequently executed kernel code I need to follow
carefully.

One possible compromise would be to move it to its own header file,
and introduce a CONFIG_TRACE_PRINTK Kconfig option (default Y) that
would surround an include from linux/kernel.h with a preprocessor
conditional. But please make sure the default stays as it is today:
include the trace printk header by default.

Thanks,

Mathieu

[1] Debugging the kernel using Ftrace - part 1 https://lwn.net/Articles/365835/
[2] Documentation/trace/ftrace.txt

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
