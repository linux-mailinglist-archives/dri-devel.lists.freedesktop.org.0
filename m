Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6876FB331A4
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 19:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6014310E1E9;
	Sun, 24 Aug 2025 17:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N4Fb64v/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45ACD10E1E9;
 Sun, 24 Aug 2025 17:37:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9yj+QhJnu6tvw5c+zKf6FtP/XRrXEerYLbQr0oI+O3SPcRf4OTjF1xSo6mNyhSwwU33wam7qg2b3V24Q3s90lGyVNys+x0vPvtoUQwwfvuuJN7FgmRNGVRwQRe8lVW4w/qtnMSsFEQohMgX4zdC0a1D732S3myjKEcyx/+w2pOyXCt8LO/Pk+zXybHoWIP19d3v9o3s1u5jXSAhOvUNlUHjYLOaYLKzjo6I9JGNoIf8WMQC6KGvUJ2N7JyfF5kJwavWBKcUkiPoCZjN+ClDLNHMdGGqNwlMnCyr0mp4Y8MZhPpMWGU588r42iZsNnCj3oKFi7v7gNlSyhSjGc0U0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXQf5ofNS3yDiaUonGYpzNxvYVVnxOXoD1tFGStLbhY=;
 b=kd8TAVToEnUpzrz6koCGeNoKzeMsZ6ZNI8XcaGQsV52wJ7vSkycfXmnmQHmRnl/u1oWSMMQ52+lb4M97O8V22MwI/gkmcnMnK+whahUWvBO0BqWT9Xq0B8c+FOm/haORnFbf8ym5anr+eH7XcnAWh/SLvlNLrZ3tjiZx+dDUL1l4/adOMyYTceEwEoX269Ub5LXR+dtXM5FHxT3fG6KZmthYFUHWljGVWDqWwHqGKISbUf/IN9669Bq+eTBMcpbqcF5US37tkRz2Q7zql2kgGBS2YdOk26dootOaO+cmmpUaqRHhWSGNql5qQ/UKKQOlUaisct8sdQgfOuDut1JG/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXQf5ofNS3yDiaUonGYpzNxvYVVnxOXoD1tFGStLbhY=;
 b=N4Fb64v/2aZ/cGRHdPebeOU+fMEl6X/yGMzNclIXWrnR2zmPAv6D9PyCqqHp22pV43BBNqd8y15SXUDzZkfSIqyrKWuXlvew3q5MWbbCxRMK37F0nZpMw/wnpCq/P8Tmi4RgTdxy6yZqm883/o+z3HDcVQ9XGcpTR92tj4A97bpmHUABbPahn3rGs5wHUXCI4MXf9hc/Fbd021o2Hn7MeD3tisZzMq01VvNqIxc0t0bV/qpECCQSDzRjfuO/wNjuNbXr0feGPWgTIqUCKo3c2t2dy4zs0XMmdePWUfGn55nOokmWqb/5KlJ97efQek2TcrSS3emM1Z9m1JTRVwNF2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by CY5PR12MB6549.namprd12.prod.outlook.com (2603:10b6:930:43::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sun, 24 Aug
 2025 17:37:52 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9052.014; Sun, 24 Aug 2025
 17:37:52 +0000
Message-ID: <d98248df-cb72-4530-9f94-a25e3713a56a@nvidia.com>
Date: Sun, 24 Aug 2025 10:37:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Alistair Popple <apopple@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250824135954.2243774-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0115.namprd05.prod.outlook.com
 (2603:10b6:a03:334::30) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|CY5PR12MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd9fd0b-9fdc-4b15-3137-08dde334f36a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGZOUzlQU1IvNEZLL2lzWGpRSmRNc1ZScHVRMmxWV2tHU3dnY2ZpTTlqZDJt?=
 =?utf-8?B?WWxWbWRwZjZkWGJYaEp5WDA0ZG1ZY0lvZUtJOFZneXpSbzN6alBaZ2o2bzR0?=
 =?utf-8?B?RVlZMlp2RzJtcVZMZ0dkWmVxVUE3UG16TDk0Q1l1bnRGUjhWQXZpUEhPRDl2?=
 =?utf-8?B?K29SQ3VycEpQKzZ0eUNvSVlVL1JCeVh6eHBVQWxDazdHQzRBVlFZcVFORVpi?=
 =?utf-8?B?b1ROUWtpRkZqOWcwS2ZOZU50eHFwMzc2M1JnZ3BQY0RpRVRJZTJrLzhXb2R6?=
 =?utf-8?B?SGluUVpBMkFPT2hpRnRCWnhiWjhJSUJXendtSnVUa0dpbXlRSzY0NTJBcW5p?=
 =?utf-8?B?cjltd3R5RzRVUWpqd3BiS3ZyUFNqQWN6WGhFdHhCZ3VWdlh6TXNSSmQzdFJl?=
 =?utf-8?B?a0JhbGg4UmdMcW1vdGhIVWtuZ1hUWnVzNlBqQVF2SFVvS290M2VZcDQ5S2J2?=
 =?utf-8?B?RUZhcUtCV2RNM0ZkMEpBS1J1dDBCSytVVDVna2tya09xR3gzTDVuVnFQQ25N?=
 =?utf-8?B?c0RoSjIyQ25zdEhWLzFEQTMwSWg5THlXam1BMFBIc0dyVlJDc1ZsUlJ1N0Nu?=
 =?utf-8?B?QUZPcXJsbURkbXY0YWg4Mit1SFNNRVY5NHlxRWxNYU53UXV5Qkxqb3BwNllU?=
 =?utf-8?B?a2tIOFJ4TjRZQzhQQlhzaHBTR29TYjU0RUxaY3U5dlFFcEY1MmcwQVpJbGpx?=
 =?utf-8?B?bXE0NUNQQ3h3MVpzRzFCcFhzWGtXM1dIR0NXZzJ2b1A0Q3E5SFlXVUZXM1gv?=
 =?utf-8?B?VTJNMC8yazhPcENVYU9ucWNFTlNDWmdkQU1OMVRKUXkxZWRBUVdCZXhjR2Nw?=
 =?utf-8?B?dmlqNzUzL2JoK0xrTk02YkNOR29tK0IvbzRVWTM4UW8zNktucnlqUHJRZWZ0?=
 =?utf-8?B?SXJVMW9lRW5haXY1RUViQUVSL1dIb0MzS1pubzU2T09KU09MYWZEUU1ieWRx?=
 =?utf-8?B?WkEwUW82Q0hqTGRpWlYxRHFReVV4MEQzYk5NcVBuMDFtSStXSGk4Z3d0Q05B?=
 =?utf-8?B?ZnZVcVdEZXU2NjZGa21NclIxcS9JTnpxWHdYVEx4NmFRczVIN0w5VHFsdmYx?=
 =?utf-8?B?akxpWWt0RFpRVWI4aDhkMTZ2V0s2aSt2ZWpaRkM4dlZZUlNzZ1h1MEpuU0c1?=
 =?utf-8?B?Q3pyYTBLZERiMm4yNjltOXhHT0dxQ2h4L0daNWZ2NXg4eEdQeUdlUlhJMXhG?=
 =?utf-8?B?UWFRaE1xczN6aU9GeTZLRnNITUFoeW8yZVVmcmppZEdEVnpKS3JxbHVHazZn?=
 =?utf-8?B?VG82VUpNQjBzdVZ0RVdmTG1nV1lWdFAxcWJKbTRXY0FlNlgzYlowVG5zYlI0?=
 =?utf-8?B?UGpFWUc1cEVONzdYQU85R3V1Y0d0Y1RVbVZRbHBRTEpNZjI2M3p0eldFSnpS?=
 =?utf-8?B?Q2ExWERNOFlONWJORy9FakNsb1lYNlNzMzU2eUlYLzNQRFRSZkFzQjIxT3lU?=
 =?utf-8?B?T0QzbFAyN2NkalZEdGlnVlFFOE43QnhueWtsVWpMTFZvaFMvUmlEK2IySFQy?=
 =?utf-8?B?WVE0ck5ya3JaN2tFZ2pXMXF1UzRZZmxHWWsxNHBPZHlOdHVKSmo3ZitQS3kz?=
 =?utf-8?B?c1pXS0Z1YmM2QTZSSW5LWHpNbFRLQlpOY3piOE1lSTl3WEFNM0Jyanc3aW1W?=
 =?utf-8?B?c1hsVmVnY0hJdlpNSlU2c1g0WnhpQnAwYmtIcFV4WmJDcXVZWkNZeVhSSnI4?=
 =?utf-8?B?SFh2MTVnYlcrVGxRb25laTBtVTBad3ByUkY1RnByMmlwYWFxbUJwTFo3MjRX?=
 =?utf-8?B?VTR4bGI1KytHQ2RTYWVKRXhsdXd0VnVhd3VwODQ3Zm9qVzFoZUdsY2JFaklX?=
 =?utf-8?B?NzZvUUhIMTY3aHVaZThyT2JhTDAxWDB5TkZlZldUTTJ6eTVYcm41RnVDTHVT?=
 =?utf-8?B?LzlscnovMVVrRzA0QUl5S2EwZGZweXBUcW81VG5FUWNXSXhEZTRYMUVlU0kr?=
 =?utf-8?Q?4S9EC1gVzD7NjXPU0tCZQ/EuU20Ck5qQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUlqdFRGdy8xWCt1L2c5aW1NV2RsQVBESzNLazhpVjhqSW9SUDgzZjdndWdP?=
 =?utf-8?B?aUl0RUF0UW1MeXdoVEdlOWxMcDNnRVNYZS9vMDduQmhvT1NmRVQwK0JXdVpx?=
 =?utf-8?B?M080dHMwYVFONXZSd3czTkRsc2pzS0VoSmc4QUhRbllFcVZ0R2lMVm5uclVz?=
 =?utf-8?B?NHVqUVoxaDhNK2ExUDJ0c0FMMDc4STd5aFJBZitJSEkvZW94KzJwZkp1WDZq?=
 =?utf-8?B?WDF5TTF6a3hQNVhpU2tNU3pCY3FDQnhYWFhkdVZBUjMreFlWK0pKM3o1emRv?=
 =?utf-8?B?RWxUeFVGOEE4aGx2Y2J4QWFTYzdrTWYxZzk0bEc3c214dEZJajJSbDdHUkh6?=
 =?utf-8?B?VWJWYUs2Mm5SYXBCRkdFTHEwM2RoVWt5b2lsd2p6YjNPek9OSytqNDVjMVdy?=
 =?utf-8?B?Wk5iQXA0amtYWHdUeEtBeVpSbFBoK3BiUkExRkpBMjFJTEg3M1dPWHMrcEgx?=
 =?utf-8?B?elNGYlR5S0xZdkk4ZlBTMjZmQnZGMUJkRXdjWDA3T2RhcGovdlREdzIyOEFO?=
 =?utf-8?B?MDdHdDZpNUVnNkVpbXZNWEFSK3ovWE9HaVAwSTZqMmw3dTd0bnFtQ3E1K0F5?=
 =?utf-8?B?SFQ3QWUxeUNBMnNyV29HS0FFZUlRdjkzV3RFd0xMdnIraWgvQXUwTDFnT2Nv?=
 =?utf-8?B?VU1pMUNRaEZqNVg3QXhPYkkzcGlleG1PcmlzdVBPSCtFZGYrMkNQeWZGQVZ0?=
 =?utf-8?B?OFNpV0J4L1c1U0NVMFUrNnU5WCtPZ1ZNUVhLcWdlamdEc1Y1TXR0eSt0Q1Fa?=
 =?utf-8?B?anlOVHVKUmNoY2FqUnFIQXV5RnpKaDc4WTNHT1ZpcUp5bTFPY2VIeDZha3Z4?=
 =?utf-8?B?YkQxYkZNbGw2dWpIV2JwMFhTWGxNRXVMYURHd1JObDcyYVArbW5MdVBnZVgw?=
 =?utf-8?B?ZDhiYXFDN0dTc1BmbTVUcFZuVzZHV2hucVphMVArTXBKOFZqZVRkY0ttSUpm?=
 =?utf-8?B?elhWank5MmJHaGtwWi9wMHdOdkg3eUF3VkZjSFVEMHdLaG9VT2VROHNkbS9X?=
 =?utf-8?B?UUlTWG1GS21KVDFyUzZtSDhFcUJvVXpsZjd3WkY2cHYzRnBtdG1zNlRiWnpP?=
 =?utf-8?B?QWRWckFlSWpsS3N0cWlNbWxUQVNpM3V3Sm10TXhlOXVUN1EyOWx3aElYZEVa?=
 =?utf-8?B?alhnNlFsZktWRVkwQmM5cTkwM0U5QUVIdVB2ZHpNS2ttb05rTEdPdFlWSXpB?=
 =?utf-8?B?Mk9BUmpXVGxHaUJ4RmVqUTdDNGpneGU4R3dUeG5WSW1ZWHlNR3NjUnZqVjJY?=
 =?utf-8?B?WVVsV2E5cGVSQjU1ajJPY2g3M256Y3MwdFBVMmFhaFN0bDhSWExZbXdmSVFY?=
 =?utf-8?B?Uk9rVnFBa3MyNVoxMGZWaHZqUGh3bmVzbkxTaG9QZGhTWk1VV1VDbWNRRTBn?=
 =?utf-8?B?MjY5ZnhmbFcwK04xQkg1RmhyaXhkNUNmVXpnTVNlT0MyRDJoNEdDNTRnRmxy?=
 =?utf-8?B?UkR4ZUVJeUZHQ3F5S2xXYWxzVGNMQzFvMVAzVkZtU0ltaVhGazVVR0xUZXZm?=
 =?utf-8?B?ejVaVldqZGJJVmxvRzRjZGR3eHVOM1pYcnNwbkF3bkFhb005cW1NUGlKRHNo?=
 =?utf-8?B?dkYwbHlFQkN2ZFIxMlVaSktIdHlpak00cXcwZTVHR21lY1FDallOejMrUVNQ?=
 =?utf-8?B?enFvQlNIdGtkbjZITnloNWRhMXllYXRYYkF2SXl3N0dOZENRNndpYXlOVmxF?=
 =?utf-8?B?c3R5Z2k5NC9Dc0poVWhvOC93TVdyOGd3WGVQaHlYbmYvN29aTkNmblB6UVdv?=
 =?utf-8?B?cFc5UWs4RkdqRXhkdzJ4TjdoT2c4WHlSOHo5eG1IRk1mZThpYWVXQWxqY2FS?=
 =?utf-8?B?cXkzUGk2T3Vjc2RQOVRHMFZYMlBIUG8wb0xCdkR0ZVREeTYxejNrcFNzaStZ?=
 =?utf-8?B?RDNBdTFBOE9zSStJZzNCbjRYOFRJRnYybms5SkFzekgrazRkck9Nd3pocW53?=
 =?utf-8?B?RkpDWjNka0xpZjM0VEtJbUtaVHFnYVFiS3FIdENsSzBpVDdlNlJRODdmSEFh?=
 =?utf-8?B?eS9JWEwzeWRvTHdBL2FCT3VlbUtHMWM0SUVHTldPLytIaXVzRzFZcm5HMXdU?=
 =?utf-8?B?TVVhRzJodVNUM0hVTTljaldnbURUK25HNHZyMktka2NjRlBWSTF3NXFtVThX?=
 =?utf-8?B?eE9jTmNSTktnZlcvUFM3S3R2bzNhcXNiTXgrWnJHSTJEdmFnZytoYUNVTDdr?=
 =?utf-8?B?ZEE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd9fd0b-9fdc-4b15-3137-08dde334f36a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2025 17:37:51.9816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhKKHstKt4cH8vue6+CJOaA0fpLtRR9S2GuZiqvqfSTwPOSC44ggpgx85EBoAqZd2sxIIKDIOBj7bXYbF+vYSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6549
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

+Cc: bitmap maintainer/reviewers: Yury Norov, Rasmus Villemoes

On 8/24/25 6:59 AM, Joel Fernandes wrote:
> Add a minimal bitfield library for defining in Rust structures (called
> bitstruct), similar in concept to bit fields in C structs. This will be used
> for defining page table entries and other structures in nova-core.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>   drivers/gpu/nova-core/bitstruct.rs | 149 +++++++++++++++++++++++++++++
>   drivers/gpu/nova-core/nova_core.rs |   1 +
>   2 files changed, 150 insertions(+)
>   create mode 100644 drivers/gpu/nova-core/bitstruct.rs
> 
> diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/bitstruct.rs
> new file mode 100644
> index 000000000000..661a75da0a9c
> --- /dev/null
> +++ b/drivers/gpu/nova-core/bitstruct.rs
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// bitstruct.rs — C-style library for bitfield-packed Rust structures
> +//
> +// A library that provides support for defining bit fields in Rust
> +// structures to circumvent lack of native language support for this.
> +//
> +// Similar usage syntax to the register! macro.
> +
> +use kernel::prelude::*;
> +
> +/// Macro for defining bitfield-packed structures in Rust.
> +/// The size of the underlying storage type is specified with #[repr(TYPE)].
> +///
> +/// # Example (just for illustration)
> +/// ```rust
> +/// bitstruct! {
> +///     #[repr(u64)]
> +///     pub struct PageTableEntry {
> +///         0:0       present     as bool,
> +///         1:1       writable    as bool,
> +///         11:9      available   as u8,
> +///         51:12     pfn         as u64,
> +///         62:52     available2  as u16,
> +///         63:63     nx          as bool,
> +///     }
> +/// }
> +/// ```
> +///
> +/// This generates a struct with methods:
> +/// - Constructor: `default()` sets all bits to zero.
> +/// - Field accessors: `present()`, `pfn()`, etc.
> +/// - Field setters: `set_present()`, `set_pfn()`, etc.
> +/// - Builder methods: `with_present()`, `with_pfn()`, etc.
> +/// - Raw conversion: `from_raw()`, `into_raw()`
> +#[allow(unused_macros)]
> +macro_rules! bitstruct {
> +    (
> +        #[repr($storage:ty)]
> +        $vis:vis struct $name:ident {
> +            $(
> +                $hi:literal : $lo:literal $field:ident as $field_type:tt
> +            ),* $(,)?
> +        }
> +    ) => {
> +        #[repr(transparent)]
> +        #[derive(Copy, Clone, Default)]
> +        $vis struct $name($storage);
> +
> +        impl $name {
> +            /// Create from raw value
> +            #[inline(always)]
> +            $vis const fn from_raw(val: $storage) -> Self {
> +                Self(val)
> +            }
> +
> +            /// Get raw value
> +            #[inline(always)]
> +            $vis const fn into_raw(self) -> $storage {
> +                self.0
> +            }
> +        }
> +
> +        impl core::fmt::Debug for $name {
> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
> +                write!(f, "{}({:#x})", stringify!($name), self.0)
> +            }
> +        }
> +
> +        // Generate all field methods
> +        $(
> +            bitstruct_field_impl!($vis, $name, $storage, $hi, $lo, $field as $field_type);
> +        )*
> +    };
> +}
> +
> +/// Helper to calculate mask for bit fields
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_mask {
> +    ($hi:literal, $lo:literal, $storage:ty) => {{
> +        let width = ($hi - $lo + 1) as usize;
> +        let storage_bits = 8 * core::mem::size_of::<$storage>();
> +        if width >= storage_bits {
> +            <$storage>::MAX
> +        } else {
> +            ((1 as $storage) << width) - 1
> +        }
> +    }};
> +}
> +
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_field_impl {
> +    ($vis:vis, $struct_name:ident, $storage:ty, $hi:literal, $lo:literal, $field:ident as $field_type:tt) => {
> +        impl $struct_name {
> +            #[inline(always)]
> +            $vis const fn $field(&self) -> $field_type {
> +                let field_val = (self.0 >> $lo) & bitstruct_mask!($hi, $lo, $storage);
> +                bitstruct_cast_value!(field_val, $field_type)
> +            }
> +        }
> +        bitstruct_make_setters!($vis, $struct_name, $storage, $hi, $lo, $field, $field_type);
> +    };
> +}
> +
> +/// Helper macro to convert extracted value to target type
> +///
> +/// Special handling for bool types is required because the `as` keyword
> +/// cannot be used to convert to bool in Rust. For bool fields, we check
> +/// if the extracted value is non-zero. For all other types, we use the
> +/// standard `as` conversion.
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_cast_value {
> +    ($field_val:expr, bool) => {
> +        $field_val != 0
> +    };
> +    ($field_val:expr, $field_type:tt) => {
> +        $field_val as $field_type
> +    };
> +}
> +
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_write_bits {
> +    ($raw:expr, $hi:literal, $lo:literal, $val:expr, $storage:ty) => {{
> +        let mask = bitstruct_mask!($hi, $lo, $storage);
> +        ($raw & !(mask << $lo)) | ((($val as $storage) & mask) << $lo)
> +    }};
> +}
> +
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_make_setters {
> +    ($vis:vis, $struct_name:ident, $storage:ty, $hi:literal, $lo:literal, $field:ident, $field_type:tt) => {
> +        ::kernel::macros::paste! {
> +            impl $struct_name {
> +                #[inline(always)]
> +                #[allow(dead_code)]
> +                $vis fn [<set_ $field>](&mut self, val: $field_type) {
> +                    self.0 = bitstruct_write_bits!(self.0, $hi, $lo, val, $storage);
> +                }
> +
> +                #[inline(always)]
> +                #[allow(dead_code)]
> +                $vis const fn [<with_ $field>](mut self, val: $field_type) -> Self {
> +                    self.0 = bitstruct_write_bits!(self.0, $hi, $lo, val, $storage);
> +                    self
> +                }
> +            }
> +        }
> +    };
> +}
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index cb2bbb30cba1..54505cad4a73 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -2,6 +2,7 @@
>   
>   //! Nova Core GPU Driver
>   
> +mod bitstruct;
>   mod dma;
>   mod driver;
>   mod falcon;

thanks,
-- 
John Hubbard

