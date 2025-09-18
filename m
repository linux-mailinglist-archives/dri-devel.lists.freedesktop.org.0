Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76622B84BFB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 15:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B89010E75A;
	Thu, 18 Sep 2025 13:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RNdYQ2zD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010042.outbound.protection.outlook.com [52.101.46.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A2010E75A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 13:11:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OhVtaI6ZcSfcxtW3MGJXpS+dCNg9WHIg6b7PzuJ2vpAVPDDYrjxA7sFwJX3DKv4MAGkMT6McYwKiXTMAiPQQxQ4eiglyI8jwhZJJNIVNtgIy91RaK1mNr8QcA6q6zigcLgA3BAc5d49gX6W/6Xg66veIc/IFSlCm0cxmvtPnRH60bo2krxAcXiXG4YQpwUBuqHCgZLPoHz7zxOl+TmqMNNvkOnPq901W+ayhM23nwd1+etE5eBeL8TkeyB6iv6R1uU+fRADkZq3wx4W1DjdKrXu70Mx9+rEFFmNwODwJQq7unifvToIxwoMdmc9Wf2Mo8ddXJSYQqhwOaV5VfZ35Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwIyVjhTRHrxZu5TvSbkXsyZKfMFc+E8gGKruV8Mcww=;
 b=IMaSMU+GaWUDAjjSs/srFQV0HpFwkC/rEM7y4W8HwEdaYr9OzueM44GLnSvQYtFCUU7nFlTpzO9SYwsv21n9k0rLkxW0dPCNQFPsezq7u271iUNzqukUYs/Qka6DgIS/r0N9u9J7A3eYWBXFwFf4hRWztVBPgwOGVI/EdSlnzpjlyIAAQX3wAJiEdoxXEpfBdtpl+4eL0mnS7oY8s1bo8VvWop9NEayL/Nz/5b3LALeifOnkL/PqWkuc3xFMcVfEakjrH3cUEWT8hJj4ZlLadCso2qjB5Rn7Wu14HnIrkF8zzLVYc2wie4CY/gq7E4qnPxL5qj57BJTkfKlH/FdE+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwIyVjhTRHrxZu5TvSbkXsyZKfMFc+E8gGKruV8Mcww=;
 b=RNdYQ2zDQEzRwOYqH5FPYcvDXnQcSkCj7XnJ2DJoFwvafJmeAVcWFkYfhi+BBHnDCDN5GLDsqln7/J2Tyf9tPpff6/vDPPBJOllRsgzG4InMfY3e53zBxNTKGxbUoVEcSdfZ/Tb2K3OpHiIf+R46Ztpi8VSe2jhNcU5k5fUkZgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6651.namprd12.prod.outlook.com (2603:10b6:208:3a0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 13:11:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 13:11:47 +0000
Message-ID: <6d37c0a8-5066-4012-96bd-8d37df18312f@amd.com>
Date: Thu, 18 Sep 2025 15:11:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] rust: sync: Add dma_fence abstractions
To: Philipp Stanner <phasta@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, Lyude Paul <lyude@redhat.com>,
 Mitchell Levy <levymitchell0@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20250918123100.124738-2-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250918123100.124738-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR01CA0027.prod.exchangelabs.com (2603:10b6:208:71::40)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fd6da79-9018-461f-718f-08ddf6b4ebcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnMybHdsbkpScDA0ZVJQZ3dwTTV0SnJqOTRBSUEzcG5NYzFRZ2xSM3Z0L0NC?=
 =?utf-8?B?aFV1dlF3bENrQm9QdmhiVThOTTNpS3FIK0Jybmhyd1ZvdnR2NGZPU29sMi9U?=
 =?utf-8?B?YVUrWGhUOUZ0VUxWQVpBNmFHSGl2NUtOZ3JwZnBwa1AwQ3o4cmZyNHZWM295?=
 =?utf-8?B?cjE2VFoxOG5SMW8xY0RqczFNL2FWSmxEai9XWXZNMVNyUEFlL3dWN2E5dlJB?=
 =?utf-8?B?L0IrQUtVVW9XSkhXSVplOVd3QWxpcGJnSFdNMldacmNxcGZEeGp0S2YwRURE?=
 =?utf-8?B?V1V1ZzlCbXlvN3czODZTaXBGamk3NCtqZzg1MlMyUVhmcWd4am1sb3BjU2ZF?=
 =?utf-8?B?STQvbnp3ZlhkQmdoUS9iVUM5a1RTK3dsNUV3WmEwalZPSExzOUE3bjgzSHlQ?=
 =?utf-8?B?cUNQWGR3bnJyZ1pNUG9GK21RS2U0ZmtCNTdkYVpGYnpHOWpHblErRnQwL3dU?=
 =?utf-8?B?M0NWdVQxOElUdTZrbUpmRjE2d3hTYzcvUG5rUUJKcHpmKzN0RHhvTHEwRHFD?=
 =?utf-8?B?SFV0ZFlHZGUzUW9nNE1abVc1elg2SUltWmp5STdQMFAvbXlVOGlFQW5MN0E2?=
 =?utf-8?B?TGdPb3V1UEVwNzN2VDRIamhnOVBEOU9nd2xnL21yMWkwVXBBN0VFMXoycGda?=
 =?utf-8?B?TmNrMTFDRGNBajBGOE4vWjhmR284bC9PTHhNWFhubzdSa1FOdFpJQ3RLSHlR?=
 =?utf-8?B?QmNkNzBmblQvcS9sREs0L3BJdDhKZmFWTUgrMXpDWVhWWWJxYWx1VEF2bmU5?=
 =?utf-8?B?QmcvcDA3dVA2NTB3ekdoNlo3NUdEQ2ZDa3JLQzdpa1RSVk84ZVNJMm85bXlm?=
 =?utf-8?B?bEhWaDFTT0JDQ1Q4cDQ0R3llYWtobllqZnRqLzVzSW0rY29kWXRqRmdMZ3FO?=
 =?utf-8?B?MldRSk9aQnVhK0huQllDQmZnb3NnSGR6YW1taUEwUlJHK01DQmh2OVdKY0ox?=
 =?utf-8?B?RUN3N1duZFNGdWF6ZG1JbkJsWDBBVkNSTDUyWXhmb3NueTMwRUl4UzdEV3ps?=
 =?utf-8?B?UWtkZTJyYjZsSnFlQUFpTUVPaWpDajJNZFMwUGxXK1U5b0RTNjBLOHhLSXlI?=
 =?utf-8?B?SDRhblFpaXR1RXhTSmU2T2FTTGxYZml2MVJZZm9jZHp3djd2d0hnc3RoSGE1?=
 =?utf-8?B?b2tCYjNncnFOVXc1TlU3cmtmQWNkeG1PdVBXOGVoc2tTU0tYemhPY1NDZThE?=
 =?utf-8?B?OUZxZGpSakhhdkJYaUF6YlpQYlpHSVhDTjVpQldWNmJaL0tDRDJIVnV1MnJF?=
 =?utf-8?B?R2lTQXBTcnRWRS9BSi9taW9MR2hRVmpzRHA2V0c3T2lWK2FpdDUwb0pBd3Vv?=
 =?utf-8?B?L2g0VDhXYjFBdm9nckxJak14VFBGODFyeEZ5N3dsUXovL3NXSFZzUlFLNjFO?=
 =?utf-8?B?eUpHQTFNVXNEQ25LZVNrTlhJTkp0UGNMV2xlSk8ycUJROEFZanBSWFVaTzlG?=
 =?utf-8?B?aTBmSFFWWDJiSkUzaENqb3pJdnlOZkRDNG16NjBSNmIrRllWL1RyRzV0TW5M?=
 =?utf-8?B?eHo0dHdyN0hCYUZBSHFPSzAyVzNFcXFrcW1UWlVueVZxeG1oaUk5L0IrdWZl?=
 =?utf-8?B?eWJPbVpBUnFvRmVkSkxoS2xLYStpcUVGR2lRN3pMMlhXalhxSThwUXg4Q1NI?=
 =?utf-8?B?M3hpYUdhOTVnYXlKV0NaaVR6endOWHRqNTBFVWEvc3VCWjV6QWlUUWVuWkFC?=
 =?utf-8?B?YnBmOXY2U1Z1dVVXY2dXNjFwZ3NqczcyMHk2RzlFNWN3a21WYTNQWlZRTXJ5?=
 =?utf-8?B?TXJ0YkNERG0ya2E1bzJmcTEzZnJwT043bHpUbTl6RDdhd2JZRVJnaUNIcUdF?=
 =?utf-8?B?cURLenNGMmF6UjJhdlhDZlVmakVjU29rNHFtU0FqbnJTVXVwa0g0dzduMHZF?=
 =?utf-8?B?MGNzMnBQOHM3MldOSVNqZCs1a2JSa1lBTCtEZHNTV2JPR0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmdhOFY5RzllQWdrQVAxa1JlUFBaNFZTd2JIczhtWitMNXp2YU5aWFVnZFI0?=
 =?utf-8?B?KzdmZklYTlRGdFR5eFhMeEZtVUcwNlNuVnJYZld5YnZtRXJhTWh1eFVPL2xt?=
 =?utf-8?B?NWNZVGNBMU8vVmtrTmx5NWw1U1JqQmdmdlFrUEltZzlZdmVVdFF6MVk5cHhm?=
 =?utf-8?B?Mmk0TDQ1Q1dzWVY4eE1VdXRHL1pxNTNCZklLU2NlUFVaemxqZ0ptbGxiQWNq?=
 =?utf-8?B?Y2RSSmNONVRUN1RadGNqeGVES3cxc25pWW03UHRrOUFwRGJTVmJuNnY2ck1j?=
 =?utf-8?B?bkxSejZaT3RBZFFSYzFGY0l1bWdsUW01d1pzMEQ1N3diNlQyM2NBd0xPMTZ6?=
 =?utf-8?B?NVN1MHcxZVRITVRFMnI5ajdxSERPb2pQeVpnbk9mZFF5UVZndkU5VGMrNzAr?=
 =?utf-8?B?dHVjOWE0YXNQM2w0UElCZjYxS3BYQWk4bEFjbHZ6dDhlS2c1VFZGRTU0OVhI?=
 =?utf-8?B?UHB1NHB5a1VldFg0TTBEUkRGMVJlaDJMeEJ5ZmZseStpRWR4NUEzY3p3VEZS?=
 =?utf-8?B?ZlNrV2poZk1hWTg0dWVMMlp0cGNETWkrRjVPT3hRcWxuWXkyNExqczkyUXRw?=
 =?utf-8?B?cGRoRmpZNmkzQWRJS3BIRk1mV0R5ZjFoVVd5WnlJVVVqSlpOeTBnaTFOMXRu?=
 =?utf-8?B?ZmNMM29vcC91aDJRMFhSUnU2STVkVy9UcHlBdng5OHRJb1RYc1RDNVdqdnND?=
 =?utf-8?B?WlJIaVVFL1RtMEN0UUtRa2lCVFh3aFl0Y08vT2JOeDZkSDZKRXRVTWR5aW4x?=
 =?utf-8?B?QlM2dXhYeWk5a2RiNUx4Ynhvdzg2eTRyTkFzQWJOM0lCL082ZmVOTDQxcGZH?=
 =?utf-8?B?Y1hSQ2JSdkhnWjRROUY3Q0RYZ3pnS3ZReXpKcFdtTy8rVHI0L1BmdW4rd3l3?=
 =?utf-8?B?eUF2cTJROTAxZmF3amdYUi9HMmdVUEhFZkF2MWRaT21Dem0rNVdTS0R3cnhE?=
 =?utf-8?B?U3ZiVGgyWlVyVHpOM0d5aExwalVqQlFaS0czMmZPVWYyaENsUGpTb09OVVF4?=
 =?utf-8?B?L1JNZFBIMjlaSzA2K0FqS0JyUUtGSEpaaytrdm9hQnJEaStmN2hPcjMwVXlS?=
 =?utf-8?B?NDVLNjFsSE51NVViNFJQbmFmcERMUFcwaWR1Sk1PY0UrYzdFUmlSZ21GUWty?=
 =?utf-8?B?bmVTWFp2WVFMNlcwbW1SMFZEL21VV1FFOW0vSHZjZXhDa0NlZWw2YjNvS2xF?=
 =?utf-8?B?c3BrUHpjRVB4SW5Ld0hTL3NCbHEyc2oxeGhEZExrTmV1RklaWklzbFEvWTZx?=
 =?utf-8?B?MUs0VlZhdVVJTzN0K2l6dDVsRU5KWEhIR1QrOVkyNXhyTzdwMjhxck5uSHRQ?=
 =?utf-8?B?c3RhdkRWdUczZ0ZKN1R5VnBFVnVGRCtNbm95b3RkN0VSVmtsdmtkRk40MVpu?=
 =?utf-8?B?WDdHa3MzNjc0TUlCRldBWXgyUit4NjE3WkptN0tvaXdlS0xWVnNvRTMvRlRI?=
 =?utf-8?B?Q0NmQStscU9RbWFvaGkxQjkxcHJSc0szUVcwcTl2N0lrUnY4bGIveWhDeEZC?=
 =?utf-8?B?Unh3Ry9nam5XUGk1TjcwRnNFK3lBemk3bnl2YVZGTkFDRG93ckJNMGdFd0RL?=
 =?utf-8?B?VkgzLzZXT0w5UVdLZi8vVnNybU1xbXg2eW9JSXFBVGhmUnk0TVVGY1pBTEY3?=
 =?utf-8?B?cVUvUHNYWHVNTG9oU3YyZ2l6ejByaEI4THVQZ2d2bmlsOXdJMFoyVnA0b0Va?=
 =?utf-8?B?S2NVSE1rLzZ4L3d6MHNtNU12bjVpaUR0YnA0bVhIYk5pMFRwWFNpZjNseXFp?=
 =?utf-8?B?ZXNOS1FUTXplYlFTZ2dCZ2JWTmxBampKZEwzNVljM2R0RkEyZXliQ3ZKc2JQ?=
 =?utf-8?B?TFJrRkdhY1cySjk3TFdXVTgzOVZFTDBsTDhZVE0vbEtleng0K1E0YWEzL2gr?=
 =?utf-8?B?bTBYOE9Fd0RLSlB2dkFRZ1JaNjdzcWhIbkNIZXRRMUpDSWZHbEtGYUJzazRV?=
 =?utf-8?B?bk5oakJINEE0WmRTRnRhUHd4RFFaLy9zNHRWTnczWi9tNXUvQ09LYnNVeGly?=
 =?utf-8?B?cUgxcHBDUzZ0QlQ1ak9DR0lXR3ZQRVd4ZjgwZEZZV3U2WThtdXRDTVQwelVB?=
 =?utf-8?B?bFdLUGZ0SUQvVkRWeFovQzZGS0xGeTYydDRiSVRxT3l5S29EcWNIbjRVemFW?=
 =?utf-8?Q?7hewhm2zhlzMEba2V25dToQfF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd6da79-9018-461f-718f-08ddf6b4ebcf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 13:11:47.0461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJzSXvPIu0fYSW3WNtGXp2yOT5PB0XZogeJXaRX8JMmqCWdFm4KP+piS8BhvtYyZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6651
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

Oh, now it gets funny.

Adding Tvrtko as well since he recently looked into making dma_fences more robust regarding context lifetime.

On 18.09.25 14:30, Philipp Stanner wrote:
> dma_fence is a synchronization mechanism which is needed by virtually
> all GPU drivers.
> 
> A dma_fence offers many features, among which the most important ones
> are registering callbacks (for example to kick off a work item) which
> get executed once a fence gets signalled.
> 
> dma_fence has a number of callbacks. Only the two most basic ones
> (get_driver_name(), get_timeline_name() are abstracted since they are
> enough to enable the basic functionality.
> 
> Callbacks in Rust are registered by passing driver data which implements
> the Rust callback trait, whose function will be called by the C backend.
> 
> dma_fence's are always refcounted, so implement AlwaysRefcounted for
> them. Once a reference drops to zero, the C backend calls a release
> function, where we implement drop_in_place() to conveniently marry that
> C-cleanup mechanism with Rust's ownership concepts.
> 
> This patch provides basic functionality, but is still missing:
>   - An implementation of PinInit<T, Error> for all driver data.
>   - A clever implementation for working dma_fence_begin_signalling()
>     guards. See the corresponding TODO in the code.
>   - Additional useful helper functions such as dma_fence_is_signaled().
>     These _should_ be relatively trivial to implement, though.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> So. ¡Hola!
> 
> This is a highly WIP RFC. It's obviously at many places not yet
> conforming very well to Rust's standards.
> 
> Nevertheless, it has progressed enough that I want to request comments
> from the community.
> 
> There are a number of TODOs in the code to which I need input.
> 
> Notably, it seems (half-)illegal to use a shared static reference to an
> Atomic, which I currently use for the dma_fence unit test / docstring
> test. I'm willing to rework that if someone suggests how.
> (Still, shouldn't changing a global Atomic always be legal? It can race,
> of course. But that's kind of the point of an atomic)
> 
> What I want comments on the most is the design of the callbacks. I think
> it's a great opportunity to provide Rust drivers with rust-only
> callbacks, so that they don't have to bother about the C functions.
> 
> dma_fence wise, only the most basic callbacks currently get implemented.
> For Nova, AFAICS, we don't need much more than signalling fences and
> registering callbacks.
> 
> 
> Another, solvable, issue I'm having is designing the
> dma_fence_begin_signallin() abstractions. There are TODOs about that in
> the code. That should ideally be robust and not racy. So we might want
> some sort of synchronized (locked?) way for using that abstraction.
> 
> 
> Regarding the manually created spinlock of mine: I so far never need
> that spinlock anywhere in Rust and wasn't sure what's then the best way
> to pass a "raw" spinlock to C.

I was hoping to remove that anyway. Maybe it's time to do so now.

Anyway I will need some time to look into it deeper.

Regards,
Christian.

> 
> 
> So much from my side. Hope to hear from you.
> 
> (I've compiled and tested this with the unit test on the current -rc3)
> 
> Philipp
> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/dma_fence.c        |  23 ++
>  rust/helpers/helpers.c          |   1 +
>  rust/helpers/spinlock.c         |   5 +
>  rust/kernel/sync.rs             |   2 +
>  rust/kernel/sync/dma_fence.rs   | 388 ++++++++++++++++++++++++++++++++
>  6 files changed, 420 insertions(+)
>  create mode 100644 rust/helpers/dma_fence.c
>  create mode 100644 rust/kernel/sync/dma_fence.rs
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 84d60635e8a9..107cb6b6f4a4 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -48,6 +48,7 @@
>  #include <linux/cred.h>
>  #include <linux/device/faux.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/dma-fence.h>
>  #include <linux/errname.h>
>  #include <linux/ethtool.h>
>  #include <linux/file.h>
> diff --git a/rust/helpers/dma_fence.c b/rust/helpers/dma_fence.c
> new file mode 100644
> index 000000000000..a9fc4829bbae
> --- /dev/null
> +++ b/rust/helpers/dma_fence.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/dma-fence.h>
> +
> +void rust_helper_dma_fence_get(struct dma_fence *f)
> +{
> +	dma_fence_get(f);
> +}
> +
> +void rust_helper_dma_fence_put(struct dma_fence *f)
> +{
> +	dma_fence_put(f);
> +}
> +
> +bool rust_helper_dma_fence_begin_signalling(void)
> +{
> +	return dma_fence_begin_signalling();
> +}
> +
> +void rust_helper_dma_fence_end_signalling(bool cookie)
> +{
> +	dma_fence_end_signalling(cookie);
> +}
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 7cf7fe95e41d..99a7f7834c03 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -20,6 +20,7 @@
>  #include "cred.c"
>  #include "device.c"
>  #include "dma.c"
> +#include "dma_fence.c"
>  #include "drm.c"
>  #include "err.c"
>  #include "fs.c"
> diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
> index 42c4bf01a23e..017ac447ebbd 100644
> --- a/rust/helpers/spinlock.c
> +++ b/rust/helpers/spinlock.c
> @@ -16,6 +16,11 @@ void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
>  #endif /* CONFIG_DEBUG_SPINLOCK */
>  }
>  
> +void rust_helper_spin_lock_init(spinlock_t *lock)
> +{
> +	spin_lock_init(lock);
> +}
> +
>  void rust_helper_spin_lock(spinlock_t *lock)
>  {
>  	spin_lock(lock);
> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> index 00f9b558a3ad..6e59526020bc 100644
> --- a/rust/kernel/sync.rs
> +++ b/rust/kernel/sync.rs
> @@ -12,6 +12,7 @@
>  mod arc;
>  pub mod aref;
>  pub mod completion;
> +pub mod dma_fence;
>  mod condvar;
>  pub mod lock;
>  mod locked_by;
> @@ -20,6 +21,7 @@
>  
>  pub use arc::{Arc, ArcBorrow, UniqueArc};
>  pub use completion::Completion;
> +pub use dma_fence::{DmaFence, DmaFenceCtx, DmaFenceNames, DmaFenceCb, DmaFenceCbFunc};
>  pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
>  pub use lock::global::{global_lock, GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLockedBy};
>  pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
> diff --git a/rust/kernel/sync/dma_fence.rs b/rust/kernel/sync/dma_fence.rs
> new file mode 100644
> index 000000000000..a00bb10b2208
> --- /dev/null
> +++ b/rust/kernel/sync/dma_fence.rs
> @@ -0,0 +1,388 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! DmaFence support.
> +//!
> +//! Reference: <https://docs.kernel.org/driver-api/dma-buf.html#c.dma_fence>
> +//!
> +//! C header: [`include/linux/dma-fence.h`](srctree/include/linux/dma-fence.h)
> +
> +use crate::{
> +    bindings,
> +    prelude::*,
> +    str::CStr,
> +    types::ForeignOwnable,
> +    types::{ARef, AlwaysRefCounted, Opaque},
> +};
> +
> +use core::{
> +    ptr::{drop_in_place, NonNull},
> +    sync::atomic::{AtomicU64, Ordering},
> +};
> +
> +use kernel::sync::{Arc, ArcBorrow};
> +
> +/// The C dma_fence backend functions ask for certain name parameters at times. In order to avoid
> +/// storing those names in [`DmaFence`] (there can be millions of fences at the same time, wasting
> +/// much memory), the driver must provide associated constants which the C backend will access,
> +/// ultimately.
> +pub trait DmaFenceNames {
> +    /// The driver's name.
> +    const DRIVER_NAME: &CStr;
> +    /// The name of the timeline the fence is associated with.
> +    const TIMELINE_NAME: &CStr;
> +}
> +
> +/// Defines the callback function the dma-fence backend will call once the fence gets signalled.
> +pub trait DmaFenceCbFunc {
> +    /// The callback function. `cb` is a container of the data which the driver passed in
> +    /// [`DmaFence::register_callback`].
> +    fn callback(cb: Pin<KBox<DmaFenceCb<Self>>>)
> +    where
> +        Self: Sized;
> +}
> +
> +/// Container for driver data which the driver gets back in its callback once the fence gets
> +/// signalled.
> +#[pin_data]
> +pub struct DmaFenceCb<T: DmaFenceCbFunc> {
> +    /// C struct needed for the backend.
> +    #[pin]
> +    inner: Opaque<bindings::dma_fence_cb>,
> +    /// Driver data.
> +    #[pin]
> +    pub data: T,
> +}
> +
> +impl<T: DmaFenceCbFunc + 'static> DmaFenceCb<T> {
> +    fn new(data: impl PinInit<T>) -> Result<Pin<KBox<Self>>> {
> +        let cb = try_pin_init!(Self {
> +            inner: Opaque::zeroed(), // This gets initialized by the C backend.
> +            data <- data,
> +        });
> +
> +        KBox::pin_init(cb, GFP_KERNEL)
> +    }
> +
> +    /// Callback for the C dma_fence backend.
> +    ///
> +    /// # Safety
> +    /// All data used and cast in this function was validly created by
> +    /// [`DmaFence::register_callback`] and isn't modified by the C backend until this callback
> +    /// here has run.
> +    unsafe extern "C" fn callback(
> +        _fence_ptr: *mut bindings::dma_fence,
> +        cb_ptr: *mut bindings::dma_fence_cb,
> +    ) {
> +        let cb_ptr = Opaque::cast_from(cb_ptr);
> +
> +        // SAFETY: The constructor guarantees that `cb_ptr` is always `inner` of a DmaFenceCb.
> +        let cb_ptr = unsafe { crate::container_of!(cb_ptr, Self, inner) }.cast_mut() as *mut c_void;
> +        // SAFETY: `cp_ptr` is the heap memory of a Pin<Kbox<Self>> because it was created by
> +        // invoking ForeignOwnable::into_foreign() on such an instance.
> +        let cb = unsafe { <Pin<KBox<Self>> as ForeignOwnable>::from_foreign(cb_ptr) };
> +
> +        // Pass ownership back over to the driver.
> +        T::callback(cb);
> +    }
> +}
> +
> +/// A dma-fence context. A fence context takes care of associating related fences with each other,
> +/// providing each with raising sequence numbers and a common identifier.
> +#[pin_data]
> +pub struct DmaFenceCtx {
> +    /// An opaque spinlock. Only ever passed to the C backend, never used by Rust.
> +    #[pin]
> +    lock: Opaque<bindings::spinlock_t>,
> +    /// The fence context number.
> +    nr: u64,
> +    /// The sequence number for the next fence created.
> +    seqno: AtomicU64,
> +}
> +
> +impl DmaFenceCtx {
> +    /// Create a new `DmaFenceCtx`.
> +    pub fn new() -> Result<Arc<Self>> {
> +        let ctx = pin_init!(Self {
> +            // Feed in a non-Rust spinlock for now, since the Rust side never needs the lock.
> +            lock <- Opaque::ffi_init(|slot: *mut bindings::spinlock| {
> +                // SAFETY: `slot` is a valid pointer to an uninitialized `struct spinlock_t`.
> +                unsafe { bindings::spin_lock_init(slot) };
> +            }),
> +            // SAFETY: `dma_fence_context_alloc()` merely works on a global atomic. Parameter `1`
> +            // is the number of contexts we want to allocate.
> +            nr: unsafe { bindings::dma_fence_context_alloc(1) },
> +            seqno: AtomicU64::new(0),
> +        });
> +
> +        Arc::pin_init(ctx, GFP_KERNEL)
> +    }
> +
> +    fn get_new_fence_seqno(&self) -> u64 {
> +        self.seqno.fetch_add(1, Ordering::Relaxed)
> +    }
> +}
> +
> +impl ArcBorrow<'_, DmaFenceCtx> {
> +    /// Create a new fence, consuming `data`.
> +    ///
> +    /// The fence will increment the refcount of the fence context associated with this
> +    /// [`DmaFenceCtx`].
> +    pub fn new_fence<T: DmaFenceNames>(
> +        &mut self,
> +        data: impl PinInit<T>,
> +    ) -> Result<ARef<DmaFence<T>>> {
> +        let fctx: Arc<DmaFenceCtx> = (*self).into();
> +        let seqno: u64 = fctx.get_new_fence_seqno();
> +
> +        // TODO: Should we reset seqno in case of failure?
> +        // Pass `fctx` by value so that the fence will hold a reference to the DmaFenceCtx as long
> +        // as it lives.
> +        DmaFence::new(fctx, data, &self.lock, self.nr, seqno)
> +    }
> +}
> +
> +/// A synchronization primitive mainly for GPU drivers.
> +///
> +/// DmaFences are always reference counted. The typical use case is that one side registers
> +/// callbacks on the fence which will perform a certain action (such as queueing work) once the
> +/// other side signals the fence.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::c_str;
> +/// use kernel::sync::{Arc, ArcBorrow, DmaFence, DmaFenceCtx, DmaFenceNames, DmaFenceCb, DmaFenceCbFunc};
> +/// use core::sync::atomic::{self, AtomicBool};
> +///
> +/// static mut CHECKER: AtomicBool = AtomicBool::new(false);
> +///
> +/// struct CallbackData {
> +///     i: u32,
> +/// }
> +///
> +/// impl CallbackData {
> +///     fn new() -> Self {
> +///         Self { i: 9 }
> +///     }
> +/// }
> +///
> +/// impl DmaFenceCbFunc for CallbackData {
> +///     fn callback(cb: Pin<KBox<DmaFenceCb<Self>>>) where Self: Sized {
> +///         assert_eq!(cb.data.i, 9);
> +///         // SAFETY: Just to have an easy way for testing. This cannot race with the checker
> +///         // because the fence signalling callbacks are executed synchronously.
> +///         unsafe { CHECKER.store(true, atomic::Ordering::Relaxed); }
> +///     }
> +/// }
> +///
> +/// struct DriverData {
> +///     i: u32,
> +/// }
> +///
> +/// impl DriverData {
> +///     fn new() -> Self {
> +///         Self { i: 5 }
> +///     }
> +/// }
> +///
> +/// impl DmaFenceNames for DriverData {
> +///     const DRIVER_NAME: &CStr = c_str!("DUMMY_DRIVER");
> +///     const TIMELINE_NAME: &CStr = c_str!("DUMMY_TIMELINE");
> +/// }
> +///
> +/// let data = DriverData::new();
> +/// let fctx = DmaFenceCtx::new()?;
> +///
> +/// let mut fence = fctx.as_arc_borrow().new_fence(data)?;
> +///
> +/// let cb_data = CallbackData::new();
> +/// fence.register_callback(cb_data);
> +/// // fence.begin_signalling();
> +/// fence.signal()?;
> +/// // Now check wehether the callback was actually executed.
> +/// // SAFETY: `fence.signal()` above works sequentially. We just check here whether the signalling
> +/// // actually did set the boolean correctly.
> +/// unsafe { assert_eq!(CHECKER.load(atomic::Ordering::Relaxed), true); }
> +///
> +/// Ok::<(), Error>(())
> +/// ```
> +#[pin_data]
> +pub struct DmaFence<T> {
> +    /// The actual dma_fence passed to C.
> +    #[pin]
> +    inner: Opaque<bindings::dma_fence>,
> +    /// User data.
> +    #[pin]
> +    data: T,
> +    /// Marks whether the fence is currently in the signalling critical section.
> +    signalling: bool,
> +    /// A boolean needed for the C backend's lockdep guard.
> +    signalling_cookie: bool,
> +    /// A reference to the associated [`DmaFenceCtx`] so that it cannot be dropped while there are
> +    /// still fences around.
> +    fctx: Arc<DmaFenceCtx>,
> +}
> +
> +// SAFETY: `DmaFence` is safe to be sent to any task.
> +unsafe impl<T> Send for DmaFence<T> {}
> +
> +// SAFETY: `DmaFence` is safe to be accessed concurrently.
> +unsafe impl<T> Sync for DmaFence<T> {}
> +
> +// SAFETY: These implement the C backends refcounting methods which are proven to work correctly.
> +unsafe impl<T: DmaFenceNames> AlwaysRefCounted for DmaFence<T> {
> +    fn inc_ref(&self) {
> +        // SAFETY: `self.as_raw()` is a pointer to a valid `struct dma_fence`.
> +        unsafe { bindings::dma_fence_get(self.as_raw()) }
> +    }
> +
> +    /// # Safety
> +    ///
> +    /// `ptr`must be a valid pointer to a [`DmaFence`].
> +    unsafe fn dec_ref(ptr: NonNull<Self>) {
> +        // SAFETY: `ptr` is never a NULL pointer; and when `dec_ref()` is called
> +        // the fence is by definition still valid.
> +        let fence = unsafe { (*ptr.as_ptr()).inner.get() };
> +
> +        // SAFETY: Valid because `fence` was created validly above.
> +        unsafe { bindings::dma_fence_put(fence) }
> +    }
> +}
> +
> +impl<T: DmaFenceNames> DmaFence<T> {
> +    // TODO: There could be a subtle potential problem here? The LLVM compiler backend can create
> +    // several versions of this constant. Their content would be identical, but their addresses
> +    // different.
> +    const OPS: bindings::dma_fence_ops = Self::ops_create();
> +
> +    /// Create an initializer for a new [`DmaFence`].
> +    fn new(
> +        fctx: Arc<DmaFenceCtx>,
> +        data: impl PinInit<T>, // TODO: The driver data should implement PinInit<T, Error>
> +        lock: &Opaque<bindings::spinlock_t>,
> +        context: u64,
> +        seqno: u64,
> +    ) -> Result<ARef<Self>> {
> +        let fence = pin_init!(Self {
> +            inner <- Opaque::ffi_init(|slot: *mut bindings::dma_fence| {
> +                let lock_ptr = &raw const (*lock);
> +                // SAFETY: `slot` is a valid pointer to an uninitialized `struct dma_fence`.
> +                // `lock_ptr` is a pointer to the spinlock of the fence context, which is shared
> +                // among all the fences. This can't become a UAF because each fence takes a
> +                // reference of the fence context.
> +                unsafe { bindings::dma_fence_init(slot, &Self::OPS, Opaque::cast_into(lock_ptr), context, seqno) };
> +            }),
> +            data <- data,
> +            signalling: false,
> +            signalling_cookie: false,
> +            fctx: fctx,
> +        });
> +
> +        let b = KBox::pin_init(fence, GFP_KERNEL)?;
> +
> +        // SAFETY: We don't move the contents of `b` anywhere here. After unwrapping it, ARef will
> +        // take care of preventing memory moves.
> +        let rawptr = KBox::into_raw(unsafe { Pin::into_inner_unchecked(b) });
> +
> +        // SAFETY: `rawptr` was created validly above.
> +        let aref = unsafe { ARef::from_raw(NonNull::new_unchecked(rawptr)) };
> +
> +        Ok(aref)
> +    }
> +
> +    /// Mark the beginning of a DmaFence signalling critical section. Should be called once a fence
> +    /// gets published.
> +    ///
> +    /// The signalling critical section is marked as finished automatically once the fence signals.
> +    pub fn begin_signalling(&mut self) {
> +        // FIXME: this needs to be mutable, obviously, but we can't borrow mutably. *sigh*
> +        self.signalling = true;
> +        // TODO: Should we warn if a user tries to do this several times for the same
> +        // fence? And should we ignore the request if the fence is already signalled?
> +
> +        // SAFETY: `dma_fence_begin_signalling()` works on global lockdep data and calling it is
> +        // always safe.
> +        self.signalling_cookie = unsafe { bindings::dma_fence_begin_signalling() };
> +    }
> +
> +    const fn ops_create() -> bindings::dma_fence_ops {
> +        // SAFETY: Zeroing out memory on the stack is always safe.
> +        let mut ops: bindings::dma_fence_ops = unsafe { core::mem::zeroed() };
> +
> +        ops.get_driver_name = Some(Self::get_driver_name);
> +        ops.get_timeline_name = Some(Self::get_timeline_name);
> +        ops.release = Some(Self::release);
> +
> +        ops
> +    }
> +
> +    extern "C" fn get_driver_name(_ptr: *mut bindings::dma_fence) -> *const c_char {
> +        T::DRIVER_NAME.as_ptr()
> +    }
> +
> +    extern "C" fn get_timeline_name(_ptr: *mut bindings::dma_fence) -> *const c_char {
> +        T::TIMELINE_NAME.as_ptr()
> +    }
> +
> +    /// The release function called by the C backend once the refcount drops to 0. We use this to
> +    /// drop the Rust dma-fence, too. Since [`DmaFence`] implements [`AlwaysRefCounted`], this is
> +    /// perfectly safe and a convenient way to concile the two release mechanisms of C and Rust.
> +    unsafe extern "C" fn release(ptr: *mut bindings::dma_fence) {
> +        let ptr = Opaque::cast_from(ptr);
> +
> +        // SAFETY: The constructor guarantees that `ptr` is always the inner fence of a DmaFence.
> +        let fence = unsafe { crate::container_of!(ptr, Self, inner) }.cast_mut();
> +
> +        // SAFETY: See above. Also, the release callback will only be called once, when the
> +        // refcount drops to 0, and when that happens the fence is by definition still valid.
> +        unsafe { drop_in_place(fence) };
> +    }
> +
> +    /// Signal the fence. This will invoke all registered callbacks.
> +    pub fn signal(&self) -> Result {
> +        // SAFETY: `self` is refcounted.
> +        let ret = unsafe { bindings::dma_fence_signal(self.as_raw()) };
> +        if ret != 0 {
> +            return Err(Error::from_errno(ret));
> +        }
> +
> +        if self.signalling {
> +            // SAFETY: `dma_fence_end_signalling()` works on global lockdep data. The only
> +            // parameter is a boolean passed by value.
> +            unsafe { bindings::dma_fence_end_signalling(self.signalling_cookie) };
> +        }
> +
> +        Ok(())
> +    }
> +
> +    /// Register a callback on a [`DmaFence`]. The callback will be invoked in the fence's
> +    /// signalling path, i.e., critical section.
> +    ///
> +    /// Consumes `data`. `data` is passed back to the implemented callback function when the fence
> +    /// gets signalled.
> +    pub fn register_callback<U: DmaFenceCbFunc + 'static>(&self, data: impl PinInit<U>) -> Result {
> +        let cb = DmaFenceCb::new(data)?;
> +        let ptr = cb.into_foreign() as *mut DmaFenceCb<U>;
> +        // SAFETY: `ptr` was created validly directly above.
> +        let inner_cb = unsafe { (*ptr).inner.get() };
> +
> +        // SAFETY: `self.as_raw()` is valid because `self` is refcounted, `inner_cb` was created
> +        // validly above and was turned into a ForeignOwnable, so it won't be dropped. `callback`
> +        // has static life time.
> +        let ret = unsafe {
> +            bindings::dma_fence_add_callback(
> +                self.as_raw(),
> +                inner_cb,
> +                Some(DmaFenceCb::<U>::callback),
> +            )
> +        };
> +        if ret != 0 {
> +            return Err(Error::from_errno(ret));
> +        }
> +        Ok(())
> +    }
> +
> +    fn as_raw(&self) -> *mut bindings::dma_fence {
> +        self.inner.get()
> +    }
> +}

