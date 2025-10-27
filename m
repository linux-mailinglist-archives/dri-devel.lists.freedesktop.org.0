Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB1AC0E149
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019F910E49F;
	Mon, 27 Oct 2025 13:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DlmdvC+q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010061.outbound.protection.outlook.com
 [52.101.193.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BCD10E49D;
 Mon, 27 Oct 2025 13:36:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKwk74HnLzJ23d8NJhIIf1MktzfxdMS4VEKbA0FMYLEhXJoVNartlCgloMX1GkrYJBVqa0yUrfUsjaI9UDS4ROgTCcFsCQTNxt41UkzXyepZho0d8vDLymi7oAom6E5jPIjhEb1/KMGlN2PoiQIsC5mAUFdMi0tUmj3Ny29jNyjYLH97RsUJyTt38+UtJ4fRGSuPUmaObXj+sGxyigHgeg5XQufZRa4sUJtR0dv7Uy9/YbW3PnsA75NML+sbWb0KinXr39IxE9whlS3ia2kOprv+X9BDyL0qr7nIFFv/aDGjnLdXBvf3jz1bwYLECxuY2rqb5LAOE5TZW3/+n/5dIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xx7slpf3KQbb/dGSdgVTsHTZ6khyd6NCKiRgOYPiF3k=;
 b=t0IinbWiYg36yf3vB7pwuB6A7IycF7d0sOKkNP/5mJsOQ+7ZoaF9YFH1UySx6E3oLQScTkJvvp4hMIwmzCevruFwcAsdfdc4QRbb7me6ZDKkqpYnTy9RrvCeZe3H39mrJro1s9MjejDu7Z4snBFJfZvKXE8qnPNQy53TgJ9cDMSBdtjnIxNH8EgO9QAFD6a2ibTKsA03XTee6AZKCCauOm5a8AfQqEQ51p+shCFn2ja2KXKTv75e18mWF4XUMFQpITkF3SkmPb++PyaGzZ0V6OX3Idg1o0gVziK+Ph+afy4yB7f3f3pDcs5tCrr5RHJMUfObuNjI07hvaITiKu92AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xx7slpf3KQbb/dGSdgVTsHTZ6khyd6NCKiRgOYPiF3k=;
 b=DlmdvC+qpcej14dwwRcYxyQ2p/WPOeZL6Nr1dVFRUsxQiwV0FpcRjkiM8a+TFZtvDrz6WwA9H2VaXLpuRfFvFWaXgMlUQoAjLSXlxWr1iC9wJHURPfwNM2w1oGWQDzD1vlk+5lU4DaaHNo3cjWfrjMaVUl1mE58DJkeFjUTmg3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB6410.namprd12.prod.outlook.com (2603:10b6:208:38a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 13:36:19 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 13:36:19 +0000
Message-ID: <d93da523-f3dd-44d7-b9b4-b85b469aa628@amd.com>
Date: Mon, 27 Oct 2025 08:36:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] platform/x86/amd/pmc: Add support for Van Gogh SoC
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Antheas Kapenekakis <lkml@antheas.dev>
Cc: Alex Deucher <alexander.deucher@amd.com>, Perry Yuan
 <perry.yuan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Sanket Goswami <Sanket.Goswami@amd.com>
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-2-lkml@antheas.dev>
 <3792db59-7dc1-4e34-9436-84df4b6c3e10@amd.com>
 <CAGwozwFTDD2QrHy37axhanwQYv6ty9K_hfhxS05djKpv8HfY6g@mail.gmail.com>
 <2684d3ab-d7cf-4eab-acd4-91bdd5debb6b@amd.com>
 <058eda7c-ab93-40a5-b387-54f7a18f3922@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <058eda7c-ab93-40a5-b387-54f7a18f3922@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0082.namprd13.prod.outlook.com
 (2603:10b6:806:23::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f466a7c-224c-494e-0943-08de155dcf6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEE1ZDRnWWtSZFhkQk9jdUwyd1Fnenp1TGtQYXZwTVFBRjlESkFEbXkybFBM?=
 =?utf-8?B?QXJSSFI0QndqWC9VaUEvMjhvNzRONHpHbEZTQlR1Q0lISWN2REgxVTVpQWxI?=
 =?utf-8?B?Yk5FK1RSTDJiM1JhSTdrWkNKdXErRTVsajMvL1RkVkcvSCs5MzZybnFjYkJy?=
 =?utf-8?B?WWcra0h3bGJ6UW5XamdBZklkUlhIdzNkWnY0eXVvaDJmcXA5Wit2YmJ5ME5W?=
 =?utf-8?B?ajhKdVI5QXRxdjBEUkU5SjFWSyt2MmxnNkhxaGRxVzJ2RTVSZmRuUGM5cFhz?=
 =?utf-8?B?SmRhb3ZUQk9XN0grTXBWR2RUVnBCZzRVVjBvZVNJS0NCY3RzblVHV05FdGVP?=
 =?utf-8?B?TGczanlGSktXRXlIYk91ZHRFUk9Gck9IMm1HbThlT2RVL0MzNThPbGlSS3R0?=
 =?utf-8?B?T1BOZG5oT1VhWXd2c0FPc25Pa0RQZEJoNlNHTnB2VE93WDlham1xcExqaGNh?=
 =?utf-8?B?RitkdVEwcTBySCtLYTRzWGdiWjVXamhQQkt6N28rWmdIM3AzNElVZmlITDFS?=
 =?utf-8?B?czFNcG9oclE4ZTNBZFJCWUNHU2tqc2srZWNOV01MV1NRMWl3dWM4ZlVyMXp6?=
 =?utf-8?B?MjN2TjBBRWJERVFaOHdZbmo3aHpyT0xtSllPUHBEVGlwcnkrMDBZa2NhWWty?=
 =?utf-8?B?a3NvK2pGQXJ0SVU2TXNpNU5rR0tsMHBTV2J0RXRteG5YR0tEZXk5ZHlYb2RG?=
 =?utf-8?B?ditOUU13T1FNWHkxSWlyNENWMm92T2dKSG82eDAvT1FvZFY1ekZCVWRTYk9j?=
 =?utf-8?B?dU1hZ3V6YjFVLzVoOEhMY1pKdGpUYTY3dk1pUEFEZWk5QU1laExxZXNCSE05?=
 =?utf-8?B?aWxLR1RWSWlyU1BkRnZxT3UxbmhnS085SEpUN05QOU9vOHcxWFJYbEFVUUJV?=
 =?utf-8?B?N0lZMTFSK3ZTSlB6emt4RDIrc2JrN2QzL3NLZytUV3ZrTE9mTGUyemZVYU9O?=
 =?utf-8?B?VEpJQ1pRTkpEVXdodWxHeEpPUEhtSFV0cFhna1FZVmcvQy96d1NTcmxZUUNt?=
 =?utf-8?B?ZGdMNGRIc3VLdkZkMGtWN1pVOXNpMkV1UGNNV3hKYWdRelhOVjNmanJ0RGZN?=
 =?utf-8?B?ZjJ0U2p3QUhmV095ejhoRko2anU4bW81S3lrczZBOEttZUlIdXR3SzJXa0RK?=
 =?utf-8?B?QmVtclREdndaQ3dSZm5kN2xKWW53U2dFZmc3bm1GbjUrRGdIc2d0RlA2dDRt?=
 =?utf-8?B?TlY2NTBsVzRtL0ZCVVJ6SGRaQ1R5dnFpL0U1RTduQm1DNDNicG5IeGllc01z?=
 =?utf-8?B?SU1sYklnQkh4cWIrcUUxaHloUU9BSUlJVXIwL0NPK0lhVi83MlozdVBQQ1Vh?=
 =?utf-8?B?dWJYWmgzTFRRUmNseVFZMGlEQVNyTzQ1SnQ2bFhqcVgyUGJxS3RWVGdmZ2Iv?=
 =?utf-8?B?Sndjd2s0enc5STkrYjc4amtqZHlLR2g1M2RucnJsTUlIZGZhamlUQ0g2WW5I?=
 =?utf-8?B?OFpHMWN6NVdYMENMeitLZlk4MEkxU3lWYkVkem9tSXVxUW9jUXV4dm9PeXdk?=
 =?utf-8?B?VnMraHEwS2o0UlVaM1ZQMVR4ZGJwR1JkeEFUWHU1b2dsYWczbmdBMmtrOWdN?=
 =?utf-8?B?YkJqTmhKYTZ5eGxZTE0zbTRyUFN5SWNsZEk0QXFENHZ4Ymt1dHYvM0VBYkpm?=
 =?utf-8?B?eEtEbTl0M0V5MXhpMlQrdzlLMVlmVlpIa0IxV2tESjhzc3ExN2FuTElhejhD?=
 =?utf-8?B?NHV2ZnRFOU4vZ0kzMUI1dGFFNnA2aHNnTTJVMm9Gak5QWnVLWHBNZTBmM2U4?=
 =?utf-8?B?NHN5QmZidUd1TWR5eUxocTBUMnJrNDk0bGhkVk5ORmdRcS95Ym1jYU5Edkd4?=
 =?utf-8?B?YUhsSzJLTGFXdWFtVFFCNjRPWlBQSmQyaHFUZUZvRXJseVNUYy8yTWtvN1U0?=
 =?utf-8?B?b3NUUHRiRStIdDB6U1dvZnArSllkaFJ3bUR5NkdYaTI1dkVYNVR3SFVDanVM?=
 =?utf-8?Q?H5HRDjpv/On+XIECvMFs98ECkJO4dq5a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTVjbGoxaktNMlpMUXp4dlBFUEpGUTlWenIwL3lYT3cvUFNwNEc5VmpMRXpt?=
 =?utf-8?B?d1ZKdkNVOS9NaHNUMldaWEsxekFMaHQ1dTNyNkZHQWY3SThuSmlmZm9WbTls?=
 =?utf-8?B?UTQ4NWxaM3Bmc1ZLN3doNmdLWGRLeFFBMk82MHR2WlN2bWkrNlBaWmtFbzNR?=
 =?utf-8?B?TUFIZmM5U2dmRG1vWHExZks0SU51ZVE5Wjc1L0dSMDdKVFl6SXZ1dXFWS2U3?=
 =?utf-8?B?RE15cFY4SVdGVE1Vbis1SnlVWTFIUUVFMTdQbE9jSUVTdGhkUW5QdnE1V04z?=
 =?utf-8?B?NFZSYnI5TW5UQ0VRNURWUVcxY0ZoTE56SHRVSTBQZlRmMmJCVFdEeXBUTkc0?=
 =?utf-8?B?b2NvR3lXWnRzc1B6YUFhSlArOVRQVVdsWjA0NFdhMnVNZ2J2ZjBQR0F5VGFE?=
 =?utf-8?B?MzJLSnlKM1NhcklqOFRDUlQ4NjNSVkR5eitGVExvcFhBQklGYmFmNU9qd24v?=
 =?utf-8?B?TjdYbVZtRGx3UWlxOG5BZ3FFeVpmQkY2R0NEencya0cvM0NpQTM1OWFtZXl3?=
 =?utf-8?B?am9MekNiVmxWZkJsbjVRNjc1cGkyc2RvNnQ5WUpvNjdxbHd6dXMyNGxHMW0y?=
 =?utf-8?B?eE1LYnZRbFVnczdGNGhTU2pKNkRnVFNEVHlUaXJ2a1EzR0xwSlNXcTRyLzI0?=
 =?utf-8?B?OFFkK3BHWWkwQXJNOGpNZFAreEtMS0ZtMjY4cHRzdmJuM0JmelVocU9hSnBs?=
 =?utf-8?B?bC9jZ2pUMDlsK29uamFQY3NZT0N0S3ZwdllxL2pWMjZydTJZMUs4VWNORjlK?=
 =?utf-8?B?QWcxVmp0YXppYUpZWi9oU3dPRzlqWEpiSzVHM2M4Z3VUeXpLTll4RnkyRXV1?=
 =?utf-8?B?VnJEUGsvOUVvQkNUZ081Q3VLNlpaK21PV1BLYkl5TWRENGFiK2tFZUwzOEVt?=
 =?utf-8?B?Vnp3VnVubDlPTlUvVmJVUUZjVTlvMzZ2ZzdwNENuRmE4UXJ0eXZtMWdScm11?=
 =?utf-8?B?YXFCUTZ6RnhSYnJxY2dwNFBIWHNVb1JwRVQydXc5dE1ZbVlNVTdWMG92Z0VH?=
 =?utf-8?B?N3FtVCtlQkErK2RrZ2FyTlhTUGg0ejVabmg0aVNNWC9qWjM1Q1dNbDYxNjJE?=
 =?utf-8?B?MHpveTVSMVI0Qk9uUTVpei96V0pWaGVIWEpDZnZBNEwwL0JPQmZpSXVSM3N4?=
 =?utf-8?B?SndkaXVZMnk1L2wrclpEU1R0OHJDUURrWWt3ZzBMdkRMaUl0Q0pCQ3lZOCtS?=
 =?utf-8?B?Q1hKelI0dE5HdzFUbU9iY1NIb2U0MElmUWsyRmxpWk5UYkRYbERXem1UNTFz?=
 =?utf-8?B?OXE4NGExUlhGL1NnaFF6TzdrVjJ2VVB0RFJWTTI1U2tmZkc1czY0NTdiemlp?=
 =?utf-8?B?Q3V1Z2szbGtaOS94dG41dC9pWjl3ZUFuTngzblc3alVsRjQ4cnB0Ymp3SEp1?=
 =?utf-8?B?MW1ZcWN1d0NjQ0RoNGxrcmNCUVNGdlYxcDVqTUhYYmFYQUdISGNDM1lqWEg5?=
 =?utf-8?B?WGNreThka3ZnQVhkeWpNdG02UTJ0K0piTitKWU5heG1aZkpBU245bU1HRHhR?=
 =?utf-8?B?V1ZjTzhJT3Z3OFlzbnBYWG5wdnBVVTBFdmtFbFNSWjkwR1BaWHpWZnBnanZG?=
 =?utf-8?B?QldRWE5rN0ExS3BRcXZ0dXdkZWlMMmJ6U0QwWWoyc2M0MXI0amw3cEhOb3NS?=
 =?utf-8?B?dGF1MUh1dVplUkZ2aU9qbS9OOEFqdHE1ZnNBSE8xUTR5Tm5XVlliT1poMjdM?=
 =?utf-8?B?TGthVmsvcnAwMXB5UjVvY0p2d3E1L2gwWGZ5Nms0NzBySGJRaUt5elpyZHhC?=
 =?utf-8?B?TnJCSElQTjdTcU5zN2VGNzFUWW42L1g2MEJmR0VLenoyNlJBcXVRU1RiYWkr?=
 =?utf-8?B?VnY3QnJZcHV3eTJ2eDJ5aXlTK2pFN0JjWHc3cTRwRFNvOG5JbFhTU2Z6aG5E?=
 =?utf-8?B?UnFFMm0yUE1USTFXeXFLUVlDSW9uUlgvdVhsd3lGWWk4V2VnamE2eDh4UXUy?=
 =?utf-8?B?V2oxYjRBOFlhc0F2amt4SlMxQ3BUdUhyV1I5bFhXanliWjRRb1dBVE52NC9h?=
 =?utf-8?B?UU9NWVExdkY0WlZZcGZoYjVlR3VIVlVYWkQ4K01FNjhMRjQvMExCZFFvV3kv?=
 =?utf-8?B?MGZud0JpR0FsbUN3VXpweWVaY0NrN0tjNStjSTBuS0xvK3NNc0V6SWdJUmJl?=
 =?utf-8?Q?6BnnseIRlNTSwKYIPNH2nooR4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f466a7c-224c-494e-0943-08de155dcf6e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 13:36:19.1791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOsKjXHCABP2FZ/nvr9iprZETPInllSY4cmuOYixGmbzV0Q54bg9hnDWXFfqMmnZqhhKKu0MMhz5MuY1NlC7jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6410
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

On 10/27/25 3:22 AM, Shyam Sundar S K wrote:
> 
> 
> On 10/24/2025 22:02, Mario Limonciello wrote:
>>
>>
>> On 10/24/2025 11:08 AM, Antheas Kapenekakis wrote:
>>> On Fri, 24 Oct 2025 at 17:43, Mario Limonciello
>>> <mario.limonciello@amd.com> wrote:
>>>>
>>>>
>>>>
>>>> On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
>>>>> The ROG Xbox Ally (non-X) SoC features a similar architecture to the
>>>>> Steam Deck. While the Steam Deck supports S3 (s2idle causes a crash),
>>>>> this support was dropped by the Xbox Ally which only S0ix suspend.
>>>>>
>>>>> Since the handler is missing here, this causes the device to not
>>>>> suspend
>>>>> and the AMD GPU driver to crash while trying to resume afterwards
>>>>> due to
>>>>> a power hang.
>>>>>
>>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>> ---
>>>>>     drivers/platform/x86/amd/pmc/pmc.c | 3 +++
>>>>>     drivers/platform/x86/amd/pmc/pmc.h | 1 +
>>>>>     2 files changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/
>>>>> platform/x86/amd/pmc/pmc.c
>>>>> index bd318fd02ccf..cae3fcafd4d7 100644
>>>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>>>> @@ -106,6 +106,7 @@ static void amd_pmc_get_ip_info(struct
>>>>> amd_pmc_dev *dev)
>>>>>         switch (dev->cpu_id) {
>>>>>         case AMD_CPU_ID_PCO:
>>>>>         case AMD_CPU_ID_RN:
>>>>> +     case AMD_CPU_ID_VG:
>>>>>         case AMD_CPU_ID_YC:
>>>>>         case AMD_CPU_ID_CB:
>>>>>                 dev->num_ips = 12;
>>>>> @@ -517,6 +518,7 @@ static int amd_pmc_get_os_hint(struct
>>>>> amd_pmc_dev *dev)
>>>>>         case AMD_CPU_ID_PCO:
>>>>>                 return MSG_OS_HINT_PCO;
>>>>>         case AMD_CPU_ID_RN:
>>>>> +     case AMD_CPU_ID_VG:
>>>>>         case AMD_CPU_ID_YC:
>>>>>         case AMD_CPU_ID_CB:
>>>>>         case AMD_CPU_ID_PS:
>>>>> @@ -717,6 +719,7 @@ static const struct pci_device_id
>>>>> pmc_pci_ids[] = {
>>>>>         { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
>>>>>         { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
>>>>>         { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
>>>>> +     { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_VG) },
>>>>>         { PCI_DEVICE(PCI_VENDOR_ID_AMD,
>>>>> PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
>>>>>         { PCI_DEVICE(PCI_VENDOR_ID_AMD,
>>>>> PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
>>>>>         { }
>>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/
>>>>> platform/x86/amd/pmc/pmc.h
>>>>> index 62f3e51020fd..fe3f53eb5955 100644
>>>>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>>>>> @@ -156,6 +156,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>>>>>     #define AMD_CPU_ID_RN                       0x1630
>>>>>     #define AMD_CPU_ID_PCO                      AMD_CPU_ID_RV
>>>>>     #define AMD_CPU_ID_CZN                      AMD_CPU_ID_RN
>>>>> +#define AMD_CPU_ID_VG                        0x1645
>>>>
>>>> Can you see if 0xF14 gives you a reasonable value for the idle mask if
>>>> you add it to amd_pmc_idlemask_read()?  Make a new define for it
>>>> though,
>>>> it shouldn't use the same define as 0x1a platforms.
>>>
>>> It does not work. Reports 0. I also tested the other ones, but the
>>> 0x1a was the same as you said. All report 0x0.
>>
>> It's possible the platform doesn't report an idle mask.
>>
>> 0xF14 is where I would have expected it to report.
>>
>> Shyam - can you look into this to see if it's in a different place
>> than 0xF14 for Van Gogh?
> 
> Van Gogh is before Cezzane? I am bit surprised that pmc is getting
> loaded there.

IIRC the first Van Gogh parts actually came after Cezanne.  Around 
Rembrandt timeframe.  But nothing used s2idle at that time.  So I wasn't 
sure whether idle mask support was present.

I think that the Xbox Ally X is the first Van Gogh based part that has 
s2idle support.  My wonder was if idle mask reading made it into the 
updated PMFW on the Xbox Ally X but the offset was wrong.
> 
> Antheas - what is the output of
> 
> #lspci -s 00:00.0
> 
> 0xF14 index is meant for 1Ah (i.e. Strix and above)
> 
>>
>>>
>>> Any idea why the OS hint only works 90% of the time?
> 
> What is the output of amd_pmc_dump_registers() when 10% of the time
> when the OS_HINT is not working?
> 
> What I can surmise is, though pmc driver is sending the hint PMFW is
> not taking any action (since the support in FW is missing)
> 
>>
>> If we get the idle mask reporting working we would have a better idea
>> if that is what is reported wrong.
>>
> 
> IIRC, The concept of idlemask came only after cezzane that too after a
> certain PMFW version. So I am not sure if idlemask actually exists.
> 
> 
>> If I was to guess though; maybe GFX is still active.
>>
>> Depending upon what's going wrong smu_fw_info might have some more
>> information too.
> 
> That's a good point to try it out.
> 
> Thanks,
> Shyam
> 

