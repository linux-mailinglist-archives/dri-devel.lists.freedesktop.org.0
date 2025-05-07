Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C648AAE157
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E5B10E7DC;
	Wed,  7 May 2025 13:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="obFf4NJU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79D110E7DD;
 Wed,  7 May 2025 13:53:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRn1tujab+IQ7B9TeVHLLLHoderCkznSPqwB/6Lk/xYOmzZ7YJDuQ4h6ZfnV2Byr0fpCrRhNv6eAQ3CzBQ7TrUqTBud/i2YgxMtyXrbw0A0/ggMnf+xtomU2yKN91ItoXhKwzVor6L+vqeE3qM+ksvprF918hmqcphLuem5dj94K5slLyoLPzB0Fpylqj1r1OIwZixVA/gRGCwIZqj/b7qgDCcmSY+WZHupqKIDpNRRDj19bzgFjq+zdZr6e/3xdn1JrnFYLNqj2nEYRGlBeYSdTJwZjRP9RovRVL7ZL35j6oFDCrJ4urnxAjAGdyz01FygQDaA5cLCSMaIb7x92Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTX4wK5VpcgqJoFp6ud9ZaPieQFH0IOUpxCq20BWy1Y=;
 b=w9Pn/BWmE7yYPdeuVux9wfb+W6/AaWHtQfVb92sZDRAcvJ52BK0eTjRx+KaxQwHbPqTf+3SCZm92PCJduMOhjBxEfN0E9O3KZNxPUhMZV89EHDokywYsUBboGFQnqFW8TWvcr0tHcyoEahQ2No48JOz3dJjz9Loehriq2U0gsOsQODfUH8KMKaUBR/vO5vHf3cYcOlQ7AtlEIBF/1tvCLG0daRRQKfJC5YzJ5+JL1aCEFyppA32uHadMYCPEOuk+FcDb5ztzn3xv23sJ5wmDXiOsQ/utIZuSgxbOfmBwlIpeX/ESyrIqqv4DNMVl3mQZ2SPICqs8NIXodduwpQZKSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTX4wK5VpcgqJoFp6ud9ZaPieQFH0IOUpxCq20BWy1Y=;
 b=obFf4NJU535jBGWMlE255e0t6DygmHwWeReOQSt+O/+DNA5jp7XuAp4GGjP6kRapKxo7s8TKXNbBPLPPjkXfh9cMIm+UctcaH29+qF5yHvmvpvVlL0G9yC87LgGIA6hagsvoN94SPM9XbqNJ3uCaOU4ii/ljWsX4gAFV8j1/913iMOf+83lPgFwMK7TVhJw35WQdOaCuHkpZuS7nZ6xW4FccjXJ1csj2bbTDhy1sj2L4vgYNf9OBQkNGQvnC5ATyz07/wBe35rxENc68auDOlD4T0pbTPKkX7vJJE+hN6D5ZYoVrX7dV7ALCOpWRHSZnvRz5VSFE3KRGYvxHRvRBEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 13:52:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:52:59 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 07 May 2025 22:52:32 +0900
Subject: [PATCH v3 05/19] gpu: nova-core: define registers layout using
 helper macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nova-frts-v3-5-fcb02749754d@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0087.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::27) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 208228ca-5df9-46c2-0c72-08dd8d6e7a24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUtkSTY3Z1YvQ05tSmZSQURDYVBpRFo5RS9sc1JsR1pzVlNzcmZZbzVXNDVX?=
 =?utf-8?B?MmNwQ0JBYlBqU09Bamt2MERIY251eWV2YVdTQU1PZVZWem1qUzRnWWpWand3?=
 =?utf-8?B?MWI3MFNkM0xKUC9YTFhlaHRaY1RRVmNvUmhYOHJ4L3hlMXRUUWx5SzZXKytw?=
 =?utf-8?B?V2RNVVNUY0w5U0RhekUrYW9nZzl1N01uZFRuRCtOaW5VSVJnL1RXcXEvYVRP?=
 =?utf-8?B?QjNCMm1GbXNFWGQzRmFmaDladS9uNmFVVm9wZG93UXNqTjN1NnpCQ2ZqeVhj?=
 =?utf-8?B?Sm02QUhYdDVvRUhsQlA5R3k2VUFjWERIUUE1NFNJdDFYeHd4SGJidDBGOVI5?=
 =?utf-8?B?bEN1MFRRZ0hrVGJ1MmVFTXVIYkVwSnQrclJFaTFuZlRNTVZGQ1dLRXJYeDc1?=
 =?utf-8?B?YlFLbWFiemU4MkxpLytVRkk1MXJGb3BJTzRETHlHN09PbTZ6N0NhVGZpMXBE?=
 =?utf-8?B?Rk5mQVJOWFVPOGxIaHJGNmk2eTkvK3lEQU9OYy9QeHJmVkpNN2tZT0VwVkZT?=
 =?utf-8?B?b1F6MGtKNld6Ylh2OEFteGh1aVlhVmRjTFd4S0JFMEw5aHhSQ0w1cndtcFJ4?=
 =?utf-8?B?RVZWSXZnNHFMZlcyT1EwMk9hbUZVRXJ3UFdQTEk2N1A1dDFMRkY1YkFjTTlC?=
 =?utf-8?B?NW1rUzJsbVF1bUNlbFdjaGtYRW9WcGZUUkpueUg2TXRmbkhtaVlwaGgwZUJI?=
 =?utf-8?B?WktvL29TY1U4V202R05uSWNRb1VjcmtyYS9Pcm5namUxcWk5OTZDRzNNek85?=
 =?utf-8?B?cTdkd2RSYWhCMTlDc0NvM1daOUZEWjgvNW9BQ1NTRzF4LzVFcGxGdXdlVTIy?=
 =?utf-8?B?dEo2b2Yzb1FDQkRFcEFoRVd0OUNrUFlhaGFHYlY2WnFnYUs4aU9aeFlndmtR?=
 =?utf-8?B?THlWUVZOcjhPUUFNODZTWjN0eUdGNzgyelpvOGxFOXN1UFArR25jcUppTkFE?=
 =?utf-8?B?UGRndklXc3A3Y0YwSE04QzdWT0w5OWtTZytKZEtZWkR5bmVreTk3eEN0RFQ5?=
 =?utf-8?B?bEdhdEU2TTZzMi82d0dHdHl5d1h0MnlNYUpMdU1Mayt2YjBrazZIR3lydU9i?=
 =?utf-8?B?QWFQWnBhWCtKUG92WDdRNzRQai9KSDR3ang0WFd0bXd0ZzVoUm5ZNWs5b2Ix?=
 =?utf-8?B?dGhsb0JRbUQ5RUUwTitIQnZTRm5wYmM5Y1V6UmxKTi9ZTEQwenJoOVJSdHhr?=
 =?utf-8?B?NjJucks1MlM3dnRvRjVkU1hnUGdQZm9GZno3MFZFZFUyaUFYTkRkcVZ4YU8x?=
 =?utf-8?B?MktzMENsbWMwYWZFSmRVNko4ZExnQ2Z5eWpGT0R2T3VoZk9GQSthUG1OYU5E?=
 =?utf-8?B?VjdNdnJrMjJvRzBGeGU5dlpCNDlDNUJkUkI1Z1FCNFplcDRYRGhsc3JqcE9G?=
 =?utf-8?B?VUE3MnhBS05QMWJMeU4zTTdGU29yTmozYm5UckN4TURHNUoxaG1TQ1d3Z1F5?=
 =?utf-8?B?ZDlIdzYxMHBSdndZSk9jaFMvRzZaSGJZdHFFVjdySE9VbjdEQ0I0bFVDSm1x?=
 =?utf-8?B?V0lzTytoSVhTRHNkWldHWk5UMWxlbDYyMDlSa2ZHMG9qaVVWL0ZQRTIrNFpq?=
 =?utf-8?B?Q2NDMno3MGF0ZG93cnF2YTBsZlg5eHYzUXl0ZUVBQmVLTkdXdjZSVDNmd01G?=
 =?utf-8?B?b3EzTUFoQkVRZjZvQlBYUGE3RjJwYTJDcjUzblhaMCtTS1ZURE1zcndNd1Bw?=
 =?utf-8?B?MDdOeThuWFJqTUw3VTU2b2FMazN4dmkrYVRHa1NrZjBJZE9pd25JUDBIbDFZ?=
 =?utf-8?B?U0t3Wko3K2NEbUhZQlN5QUEvZVlPRDZUaWpFSFlNenFhSU12SktaTnF5SlE1?=
 =?utf-8?B?enNod2lyQzBmL2VSZHBCbFp6ZjdsV2xUWFlNaFQrZkp1UTRCSkl4Q2hZQlJL?=
 =?utf-8?B?b1l3MnZIK2xWSnBRVjdCSFVrN3VUbXduaksyRUtWT0NlU0ZjQU1GVGM5OFVQ?=
 =?utf-8?B?NENJazNZQUwyallXQkZ5OUlaRjZycS9qb3pHanZFYlM1NzYvamxLMVhjNVVs?=
 =?utf-8?B?UlRucVNPV1F3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlhiRnVWbmJiUXlURDFxZ2N6ZiswamlGN3VkSjlvbExvVWFhcmk5dXI3aXZO?=
 =?utf-8?B?SDdnRlYwTEVnQWh5b1QvRDlBbWRzaG5rTDY1a3c3RXowSEF0NjBwQ2Fva0JD?=
 =?utf-8?B?bGxoN1BoUmJwdVEwZ3kzbEJFMmtidkwyaDBGY1VZSFc1WEVuMXJrMU9FdFNI?=
 =?utf-8?B?dFFFc1g2RHZ3d1Q5dTl1anlobDVsWWZmMitaYWM0YnYrVmdmektTdUhNeWFv?=
 =?utf-8?B?V3FON0tWVStFYVN1ZTNublRyT0FaYWNlS3JNREQ3cFBFejNIdlluRi9mU0ly?=
 =?utf-8?B?TmJOMWNDVFlOTXFwUlgyenJDMUg4T0R2S0pXN3Rhc25BZlNXczlCaEYwWG5o?=
 =?utf-8?B?TGFJN25hRS9nY09aY1QyNWxmenB5TzV2bGZuNzB4WjM1alBKUmtheVF2ZEQz?=
 =?utf-8?B?bEdCQUhGMGloMjN5eERsdmhDcTIwbEVsTkNFbFhJVTRiRk9Wc3I5ZWVmczBh?=
 =?utf-8?B?QUFDOWVMeFpWN2dNbGo1ZzAwWHBOSlRwblVzRDZJbm9yaldOUmVpSnN2bDU1?=
 =?utf-8?B?L3hscnNlOGlQK3RLSVhHYTVCMUlrVGVtZE5CR3EwenRTYlJNTG1sanJqZCtN?=
 =?utf-8?B?azRYWFFMUGM5ck05SDVnSDExbEd3Z0ZvWEtyb1ZFcjJ4ZHp0N05id1ozSFYr?=
 =?utf-8?B?UzVqZWJxTTFjdWRXWE1ZS01FcDBQR21IS2ROQzBZZDZqNGxPZ1pKNVg4eEpV?=
 =?utf-8?B?cy9TSTFZMUlWL005bVVJVzRQaEJPUG1rL1h1VGg4dDdNa0V3OW02Uk9taGNZ?=
 =?utf-8?B?dkpQL1dINWcyQkRRaUxibHZ5OStRQWRFYjRYajd4SEp5c3lVanNGbUR1dnl3?=
 =?utf-8?B?V25jZkxlMzRPWk5uZ3plamNLT3pOMW1GMXF2SU9CdkhhQUF1ajRTTTgxaVo0?=
 =?utf-8?B?Y050VWVvckg0L25VRitnMGRmTkpGMWtuYzRpRVVsOXI5VndJUTFXeXdkbkRa?=
 =?utf-8?B?dDdmUk9JdlZWU2pxemt0YWdDZzh1S2VHdmIyeHNsVTZpRjN4eFlSWXp3aTN5?=
 =?utf-8?B?WWFTVlY5dUxvREZLckdwNnk2RVBIbWFhTWxnSUZsbklvcDAvN29TTjVMc1ZW?=
 =?utf-8?B?dUFXQ1RRK1dYS21sOExqSmtLVTVYdWIwSUtCbGhvVWZrVStEVnVWN21BQklj?=
 =?utf-8?B?TDBaVWNrNVd1TUp4cXFsZ282cHMxZExFS1N3NGFXa3pZY1hOZGhiWkxmbVR6?=
 =?utf-8?B?bXZkQTBRUXdDYkQwNnhZdmFvemZWM0xCMDY5c0NhaEw2NEh6SHdhMEl2QjUy?=
 =?utf-8?B?OTQ3RGtEejdDWWlhSXhtZk1sUWpkc3QzemF1Z3JaOGVSaDBFb2FWZkVRNXQ4?=
 =?utf-8?B?ellPY25IbFNZWkFNejJibll2U2hCdnlwVVZpZHZJdG1RS01TTHN5bHJDdHJT?=
 =?utf-8?B?enpHcG5hUEU5b0VoTWpwYkhVQ3drOEhmWFpjMzFrM1oySjd1SXNVMWpvaG1y?=
 =?utf-8?B?VGJkMUo0Y0V5K214KzY3THUyREw3WVNuRmc0THpRN3d5VndpUnRGUzdMcjE3?=
 =?utf-8?B?QVovd3BJT0RvOTBBMDU2aldBazFYcU5rSE1pcG9PczIzVWJ0TEplNTlpcW4y?=
 =?utf-8?B?RkNtMW15TjdqeUV2UXdKd3dOWWo4TjhValFicTM4a0V1bXFjYzFxTkpYaVYv?=
 =?utf-8?B?dytGcHRZSEg5TDBQWXdvWmRxN1grK3MvSmtIUmVlZzhBNTRHUzNsTFVNaW5n?=
 =?utf-8?B?L2x5dDk5MUxzbFJwbTFyUllwY3RnVUFkMHlmQkdvbStlcVc2MlNsdk5TZWZv?=
 =?utf-8?B?UDhqVmU1UFVSSERTeHVycER3cURVbFR6YUMvaE5JRmVIajVwdXdHckxzZEd4?=
 =?utf-8?B?MU5vbFl0TDdRQ3NrcE1RM3lxSDl6Ykg4MWs0MlQxa0N4WFF3dlZBTUFmWlJ4?=
 =?utf-8?B?RE9rSDAyVlNOSVZ3V243bTFMdWVhOFBKeEE4NHZIbE8yWE5tMUdxM1lZYnV3?=
 =?utf-8?B?Q1ZvblBnTStlVk9PYXBGMlhubGRjQzVGVE8rcVlPTGk5Y0JITm1qeGRDOTN1?=
 =?utf-8?B?NVVDd3BqK1dJaEdBMHlGeEZ2aUxUNVlxenBDK1BLSkM3MlJHTG5vRU9IakFW?=
 =?utf-8?B?QVc3NnZJU2VGOS8yeXN4TkJzUHlBOW1reXdHbHppL2hWOTlPNjRxWkRTUmc3?=
 =?utf-8?B?eTl2VGZlbS91b0drdldPQ3hJOUFlaVRaMDdacWJXTHI1ZFUxdjVEU0syaHAz?=
 =?utf-8?Q?kHGhrZD7NIZpvN2ikOFq68wpAA4uAQ4Nu3PZIOZhYLSj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208228ca-5df9-46c2-0c72-08dd8d6e7a24
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:52:59.2965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IkTkpEIos2pjCzFMRcMkGvZU6j+QxK0Ac39Ac94t1s8O40zq7y3Lx9J45YZ7L2KL/d5decr50GkSMTH4QzZRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761
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

Add the register!() macro, which defines a given register's layout and
provide bit-field accessors with a way to convert them to a given type.
This macro will allow us to make clear definitions of the registers and
manipulate their fields safely.

The long-term goal is to eventually move it to the kernel crate so it
can be used my other drivers as well, but it was agreed to first land it
into nova-core and make it mature there.

To illustrate its usage, use it to define the layout for the Boot0
(renamed to NV_PMC_BOOT_0 to match OpenRM's naming scheme) and take
advantage of its accessors.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst |   6 +
 drivers/gpu/nova-core/gpu.rs         |  10 +-
 drivers/gpu/nova-core/regs.rs        |  61 ++----
 drivers/gpu/nova-core/regs/macros.rs | 380 +++++++++++++++++++++++++++++++++++
 4 files changed, 403 insertions(+), 54 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 234d753d3eacc709b928b1ccbfc9750ef36ec4ed..8a459fc088121f770bfcda5dfb4ef51c712793ce 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -102,7 +102,13 @@ Usage:
 	let boot0 = Boot0::read(&bar);
 	pr_info!("Revision: {}\n", boot0.revision());
 
+Note: a work-in-progress implementation currently resides in
+`drivers/gpu/nova-core/regs/macros.rs` and is used in nova-core. It would be
+nice to improve it (possibly using proc macros) and move it to the `kernel`
+crate so it can be used by other components as well.
+
 | Complexity: Advanced
+| Contact: Alexandre Courbot
 
 Delay / Sleep abstractions
 --------------------------
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index a64a306e0ec87f96e7aab47cfe00a5c280c95a64..43139b527fac35f5f33facbc0be50b9715044245 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -112,10 +112,10 @@ pub(crate) struct Revision {
 }
 
 impl Revision {
-    fn from_boot0(boot0: regs::Boot0) -> Self {
+    fn from_boot0(boot0: regs::NV_PMC_BOOT_0) -> Self {
         Self {
-            major: boot0.major_rev(),
-            minor: boot0.minor_rev(),
+            major: boot0.major_revision(),
+            minor: boot0.minor_revision(),
         }
     }
 }
@@ -135,10 +135,10 @@ pub(crate) struct Spec {
 
 impl Spec {
     fn new(bar: &Bar0) -> Result<Spec> {
-        let boot0 = regs::Boot0::read(bar);
+        let boot0 = regs::NV_PMC_BOOT_0::read(bar);
 
         Ok(Self {
-            chipset: boot0.chipset().try_into()?,
+            chipset: boot0.chipset()?,
             revision: Revision::from_boot0(boot0),
         })
     }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index b1a25b86ef17a6710e6236d5e7f1f26cd4407ce3..498fefb52f33bf01518f19d32287962f1fdc3224 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -1,55 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use crate::driver::Bar0;
+// Required to retain the original register names used by OpenRM, which are all capital snake case
+// but are mapped to types.
+#![allow(non_camel_case_types)]
 
-// TODO
-//
-// Create register definitions via generic macros. See task "Generic register
-// abstraction" in Documentation/gpu/nova/core/todo.rst.
+#[macro_use]
+mod macros;
 
-const BOOT0_OFFSET: usize = 0x00000000;
+use crate::gpu::Chipset;
 
-// 3:0 - chipset minor revision
-const BOOT0_MINOR_REV_SHIFT: u8 = 0;
-const BOOT0_MINOR_REV_MASK: u32 = 0x0000000f;
+/* PMC */
 
-// 7:4 - chipset major revision
-const BOOT0_MAJOR_REV_SHIFT: u8 = 4;
-const BOOT0_MAJOR_REV_MASK: u32 = 0x000000f0;
-
-// 23:20 - chipset implementation Identifier (depends on architecture)
-const BOOT0_IMPL_SHIFT: u8 = 20;
-const BOOT0_IMPL_MASK: u32 = 0x00f00000;
-
-// 28:24 - chipset architecture identifier
-const BOOT0_ARCH_MASK: u32 = 0x1f000000;
-
-// 28:20 - chipset identifier (virtual register field combining BOOT0_IMPL and
-//         BOOT0_ARCH)
-const BOOT0_CHIPSET_SHIFT: u8 = BOOT0_IMPL_SHIFT;
-const BOOT0_CHIPSET_MASK: u32 = BOOT0_IMPL_MASK | BOOT0_ARCH_MASK;
-
-#[derive(Copy, Clone)]
-pub(crate) struct Boot0(u32);
-
-impl Boot0 {
-    #[inline]
-    pub(crate) fn read(bar: &Bar0) -> Self {
-        Self(bar.read32(BOOT0_OFFSET))
-    }
-
-    #[inline]
-    pub(crate) fn chipset(&self) -> u32 {
-        (self.0 & BOOT0_CHIPSET_MASK) >> BOOT0_CHIPSET_SHIFT
-    }
-
-    #[inline]
-    pub(crate) fn minor_rev(&self) -> u8 {
-        ((self.0 & BOOT0_MINOR_REV_MASK) >> BOOT0_MINOR_REV_SHIFT) as u8
-    }
-
-    #[inline]
-    pub(crate) fn major_rev(&self) -> u8 {
-        ((self.0 & BOOT0_MAJOR_REV_MASK) >> BOOT0_MAJOR_REV_SHIFT) as u8
-    }
-}
+register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about the GPU" {
+    3:0     minor_revision as u8, "Minor revision of the chip";
+    7:4     major_revision as u8, "Major revision of the chip";
+    28:20   chipset as u32 ?=> Chipset, "Chipset model";
+});
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
new file mode 100644
index 0000000000000000000000000000000000000000..7ecc70efb3cd723b673cd72915e72b8a4a009f06
--- /dev/null
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -0,0 +1,380 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Macro to define register layout and accessors.
+//!
+//! A single register typically includes several fields, which are accessed through a combination
+//! of bit-shift and mask operations that introduce a class of potential mistakes, notably because
+//! not all possible field values are necessarily valid.
+//!
+//! The macro in this module allow to define, using an intruitive and readable syntax, a dedicated
+//! type for each register with its own field accessors that can return an error is a field's value
+//! is invalid.
+
+/// Defines a dedicated type for a register with an absolute offset, alongside with getter and
+/// setter methods for its fields and methods to read and write it from an `Io` region.
+///
+/// Example:
+///
+/// ```no_run
+/// register!(BOOT_0 @ 0x00000100, "Basic revision information about the GPU" {
+///    3:0     minor_revision as u8, "Minor revision of the chip";
+///    7:4     major_revision as u8, "Major revision of the chip";
+///    28:20   chipset as u32 ?=> Chipset, "Chipset model";
+/// });
+/// ```
+///
+/// This defines a `BOOT_0` type which can be read or written from offset `0x100` of an `Io`
+/// region. It is composed of 3 fields, for instance `minor_revision` is made of the 4 less
+/// significant bits of the register. Each field can be accessed and modified using accessor
+/// methods:
+///
+/// ```no_run
+/// // Read from the register's defined offset (0x100).
+/// let boot0 = BOOT_0::read(&bar);
+/// pr_info!("chip revision: {}.{}", boot0.major_revision(), boot0.minor_revision());
+///
+/// // `Chipset::try_from` will be called with the value of the field and returns an error if the
+/// // value is invalid.
+/// let chipset = boot0.chipset()?;
+///
+/// // Update some fields and write the value back.
+/// boot0.set_major_revision(3).set_minor_revision(10).write(&bar);
+///
+/// // Or just read and update the register in a single step:
+/// BOOT_0::alter(&bar, |r| r.set_major_revision(3).set_minor_revision(10));
+/// ```
+///
+/// Fields can be defined as follows:
+///
+/// - `as <type>` simply returns the field value casted as the requested integer type, typically
+///   `u32`, `u16`, `u8` or `bool`. Note that `bool` fields must have a range of 1 bit.
+/// - `as <type> => <into_type>` calls `<into_type>`'s `From::<<type>>` implementation and returns
+///   the result.
+/// - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s `TryFrom::<<type>>` implementation
+///   and returns the result. This is useful on fields for which not all values are value.
+///
+/// The documentation strings are optional. If present, they will be added to the type's
+/// definition, or the field getter and setter methods they are attached to.
+///
+/// Putting a `+` before the address of the register makes it relative to a base: the `read` and
+/// `write` methods take a `base` argument that is added to the specified address before access,
+/// and `try_read` and `try_write` methods are also created, allowing access with offsets unknown
+/// at compile-time:
+///
+/// ```no_run
+/// register!(CPU_CTL @ +0x0000010, "CPU core control" {
+///    0:0     start as bool, "Start the CPU core";
+/// });
+///
+/// // Flip the `start` switch for the CPU core which base address is at `CPU_BASE`.
+/// let cpuctl = CPU_CTL::read(&bar, CPU_BASE);
+/// pr_info!("CPU CTL: {:#x}", cpuctl);
+/// cpuctl.set_start(true).write(&bar, CPU_BASE);
+/// ```
+macro_rules! register {
+    // Creates a register at a fixed offset of the MMIO space.
+    (
+        $name:ident @ $offset:literal $(, $comment:literal)? {
+            $($fields:tt)*
+        }
+    ) => {
+        register!(@common $name $(, $comment)?);
+        register!(@field_accessors $name { $($fields)* });
+        register!(@io $name @ $offset);
+    };
+
+    // Creates a register at a relative offset from a base address.
+    (
+        $name:ident @ + $offset:literal $(, $comment:literal)? {
+            $($fields:tt)*
+        }
+    ) => {
+        register!(@common $name $(, $comment)?);
+        register!(@field_accessors $name { $($fields)* });
+        register!(@io$name @ + $offset);
+    };
+
+    // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`, `BitOr`,
+    // and conversion to regular `u32`).
+    (@common $name:ident $(, $comment:literal)?) => {
+        $(
+        #[doc=$comment]
+        )?
+        #[repr(transparent)]
+        #[derive(Clone, Copy, Default)]
+        pub(crate) struct $name(u32);
+
+        // TODO: display the raw hex value, then the value of all the fields. This requires
+        // matching the fields, which will complexify the syntax considerably...
+        impl ::core::fmt::Debug for $name {
+            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+                f.debug_tuple(stringify!($name))
+                    .field(&format_args!("0x{0:x}", &self.0))
+                    .finish()
+            }
+        }
+
+        impl core::ops::BitOr for $name {
+            type Output = Self;
+
+            fn bitor(self, rhs: Self) -> Self::Output {
+                Self(self.0 | rhs.0)
+            }
+        }
+
+        impl ::core::convert::From<$name> for u32 {
+            fn from(reg: $name) -> u32 {
+                reg.0
+            }
+        }
+    };
+
+    // Defines all the field getter/methods methods for `$name`.
+    (
+        @field_accessors $name:ident {
+        $($hi:tt:$lo:tt $field:ident as $type:tt
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+            $(, $comment:literal)?
+        ;
+        )*
+        }
+    ) => {
+        $(
+            register!(@check_field_bounds $hi:$lo $field as $type);
+        )*
+
+        #[allow(dead_code)]
+        impl $name {
+            $(
+            register!(@field_accessor $name $hi:$lo $field as $type
+                $(?=> $try_into_type)?
+                $(=> $into_type)?
+                $(, $comment)?
+                ;
+            );
+            )*
+        }
+    };
+
+    // Boolean fields must have `$hi == $lo`.
+    (@check_field_bounds $hi:tt:$lo:tt $field:ident as bool) => {
+        #[allow(clippy::eq_op)]
+        const _: () = {
+            kernel::build_assert!(
+                $hi == $lo,
+                concat!("boolean field `", stringify!($field), "` covers more than one bit")
+            );
+        };
+    };
+
+    // Non-boolean fields must have `$hi >= $lo`.
+    (@check_field_bounds $hi:tt:$lo:tt $field:ident as $type:tt) => {
+        #[allow(clippy::eq_op)]
+        const _: () = {
+            kernel::build_assert!(
+                $hi >= $lo,
+                concat!("field `", stringify!($field), "`'s MSB is smaller than its LSB")
+            );
+        };
+    };
+
+    // Catches fields defined as `bool` and convert them into a boolean value.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
+            $(, $comment:literal)?;
+    ) => {
+        register!(
+            @leaf_accessor $name $hi:$lo $field as bool
+            { |f| <$into_type>::from(if f != 0 { true } else { false }) }
+            $into_type => $into_type $(, $comment)?;
+        );
+    };
+
+    // Shortcut for fields defined as `bool` without the `=>` syntax.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
+    ) => {
+        register!(@field_accessor $name $hi:$lo $field as bool => bool $(, $comment)?;);
+    };
+
+    // Catches the `?=>` syntax for non-boolean fields.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
+            $(, $comment:literal)?;
+    ) => {
+        register!(@leaf_accessor $name $hi:$lo $field as $type
+            { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
+            ::core::result::Result<
+                $try_into_type,
+                <$try_into_type as ::core::convert::TryFrom<$type>>::Error
+            >
+            $(, $comment)?;);
+    };
+
+    // Catches the `=>` syntax for non-boolean fields.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
+            $(, $comment:literal)?;
+    ) => {
+        register!(@leaf_accessor $name $hi:$lo $field as $type
+            { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
+    };
+
+    // Shortcut for fields defined as non-`bool` without the `=>` or `?=>` syntax.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt
+            $(, $comment:literal)?;
+    ) => {
+        register!(@field_accessor $name $hi:$lo $field as $type => $type $(, $comment)?;);
+    };
+
+    // Generates the accessor methods for a single field.
+    (
+        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:ty
+            { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
+    ) => {
+        kernel::macros::paste!(
+        const [<$field:upper>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
+        const [<$field:upper _MASK>]: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
+        const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
+        );
+
+        $(
+        #[doc="Returns the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline]
+        pub(crate) fn $field(self) -> $res_type {
+            kernel::macros::paste!(
+            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
+            );
+            let field = ((self.0 & MASK) >> SHIFT);
+
+            $process(field)
+        }
+
+        kernel::macros::paste!(
+        $(
+        #[doc="Sets the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline]
+        pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
+            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
+            let value = ((value as u32) << SHIFT) & MASK;
+            self.0 = (self.0 & !MASK) | value;
+
+            self
+        }
+        );
+    };
+
+    // Creates the IO accessors for a fixed offset register.
+    (@io $name:ident @ $offset:literal) => {
+        #[allow(dead_code)]
+        impl $name {
+            #[inline]
+            pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                Self(io.read32($offset))
+            }
+
+            #[inline]
+            pub(crate) fn write<const SIZE: usize, T>(self, io: &T) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                io.write32(self.0, $offset)
+            }
+
+            #[inline]
+            pub(crate) fn alter<const SIZE: usize, T, F>(
+                io: &T,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io));
+                reg.write(io);
+            }
+        }
+    };
+
+    // Create the IO accessors for a relative offset register.
+    (@io $name:ident @ + $offset:literal) => {
+        #[allow(dead_code)]
+        impl $name {
+            #[inline]
+            pub(crate) fn read<const SIZE: usize, T>(
+                io: &T,
+                base: usize,
+            ) -> Self where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                Self(io.read32(base + $offset))
+            }
+
+            #[inline]
+            pub(crate) fn write<const SIZE: usize, T>(
+                self,
+                io: &T,
+                base: usize,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                io.write32(self.0, base + $offset)
+            }
+
+            #[inline]
+            pub(crate) fn alter<const SIZE: usize, T, F>(
+                io: &T,
+                base: usize,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io, base));
+                reg.write(io, base);
+            }
+
+            #[inline]
+            pub(crate) fn try_read<const SIZE: usize, T>(
+                io: &T,
+                base: usize,
+            ) -> ::kernel::error::Result<Self> where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                io.try_read32(base + $offset).map(Self)
+            }
+
+            #[inline]
+            pub(crate) fn try_write<const SIZE: usize, T>(
+                self,
+                io: &T,
+                base: usize,
+            ) -> ::kernel::error::Result<()> where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                io.try_write32(self.0, base + $offset)
+            }
+
+            #[inline]
+            pub(crate) fn try_alter<const SIZE: usize, T, F>(
+                io: &T,
+                base: usize,
+                f: F,
+            ) -> ::kernel::error::Result<()> where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::try_read(io, base)?);
+                reg.try_write(io, base)
+            }
+        }
+    };
+}

-- 
2.49.0

