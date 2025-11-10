Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E02C46FC6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:43:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B2E10E3D0;
	Mon, 10 Nov 2025 13:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="W/5XgENX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010009.outbound.protection.outlook.com [52.101.61.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D0310E3DE;
 Mon, 10 Nov 2025 13:43:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDNF/TUxzZqUzFNur92Rsq1zKQtlhO5J4DVueuB4mxLYU3KFB/aQsw2Jf17vG/h55dnFhRoEN/5ZUF1jBCzCJn4HSyxyXEGWav2+YfgQAtSR8Pnvjxsgc8eWbkksNQc7u/EHNssnffAz/zqPMDbO6Yf5bdIEd9Q40ZtUM4DID22LzEatuR+h7QG7lQg4SZjjLbCNaGz5JKlZzrQRkCOm36Kj6Zz+OGbDqhx5vZNQcXo4dnBGvgw7eq9FDc2v8CScXAlWBULX11Twf7O8laOWe/qK7mCGHd64hiF9OHVZPSGi5sWFNRjBPaf9bpTxvC7ZZIIVGBUlrNDg01Y7BsNCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fa+uDcmeS38N/xQ2jdxuFWwZdeghyJx8d6Gs+8++eCM=;
 b=eRfjxB7B/uHF1j20Ro4pItG+aKx0UMHtA1cobRIlsIEde3uj4c45WPIyUVl9qZ1858iwAPBiLez3llfUEBEHGW2QXLxmHIjiWMU7VaAXlB0YtI1D44y0IIj0QSGCKTLr+fOJTBG+DjwgPaFHhGlrDKGYRSC2y30UGh1feArCIrN75+ZGKhfnnAazMV1iXsQDOSoIGCeVwz5ycSh3z2suKrf2KkxJQjBSAkaz4aTs7Q52Wlusuf8Acs1uBXBu2wb1nB8bWxOYXz0cQvxAC9DS4fNqHdG25dqrLjoiUWEl3is1g6uuDYQUzr6TNuiZo7WrkiwCN9eGEPzYd0DBFukvXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fa+uDcmeS38N/xQ2jdxuFWwZdeghyJx8d6Gs+8++eCM=;
 b=W/5XgENXLN+kSox9W56kcJhHX8jPUffEhuie+AgPaBSze7qryA1UGJR8l91DhtKUYDYYrzuOpDXYawvqqT6vKivtyPNwpM9ZH7qO3XtvrOr0u5+97e0GAvlc/l45mqU75uGOkosFnTS7BxVRz+efOWSmOerirTQs5QOCKHyelCwB6twcTJc4m6NbSdmpfUbeFcHOu4ZehOHH9qETvp26bBLIEjAC426oTcdMCwL/icWRJEwdSHooiN2BKLkRBaDHSUgmGi2y1XETRd/NkmdbBGkO8zNgpTrXxOKsGLpOaD7RvlRRCH/SYFwZRTXG3uGnhF+VTVUnJ7EILmYVAL5EQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYXPR12MB9340.namprd12.prod.outlook.com (2603:10b6:930:e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:43:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:43:40 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Nov 2025 22:43:36 +0900
Message-Id: <DE5256UCJHXU.27RS8A445Z1XN@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 07/12] nova-core: Implement the GSP sequencer
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-8-joelagnelf@nvidia.com>
In-Reply-To: <20251102235920.3784592-8-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0208.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYXPR12MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f7aad33-8ab7-4776-945a-08de205f280b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1RmREN3TDI0cFhpWUZWNHYxOW9URSsrK1UzY0hsaXk1Sm1zUmZIMTlXNHVo?=
 =?utf-8?B?ZmZiOFR0b1YvVTBnSVlLdUh1dG9qaENNd0xwTERESXhqeWlYNzExMTA0QVkz?=
 =?utf-8?B?TXppK1M2UktvWTJYUzZ5bW55eG1KSHVnWVVmWU9zZk1qNSs0MWVKOFAyV0VR?=
 =?utf-8?B?UitIak5CeEcxazZlL0Q1bzdGd3AzT0FsMXNQeU10UlNJVmhHdDJPaENYejhm?=
 =?utf-8?B?Wm9ZMEtLYWxPRUQ4L1JXMUF3ZTVoeTE4b21wU0hOU1lzd0Rxemp0QklPT1ll?=
 =?utf-8?B?cjRSVEdCTEEvREE2YWovd2tHejVGTmpPU0VpemRkbHcrRWJxWTJwL1ovOFlr?=
 =?utf-8?B?MlhEaGRJQ0dnc3dBK3hpbCtUc2ZqUE5jMHNncE9rQklvc0NJZFQ5MzBmajN6?=
 =?utf-8?B?SmlxYTRIZzlPVG5maUdUcTJsQXBMSkFNTkZmVzBTbEp3VzhLK05VMkxNeldE?=
 =?utf-8?B?N3Z6dFE3S0I3OTdnVjNtSGhUWkR6cHAzODF6dC9Wb2lJKzYvZXQvUjdqeWl1?=
 =?utf-8?B?eGJVYmpTaEFCQmN4RVFtYTdndHlxcjFhMHVZblR4c1o0WFZ2ZEdQem9KNW1O?=
 =?utf-8?B?Rk1VRVo5V2g4cWdQVDdQVFJBMlZza3N0Qm9ud1E5MTBiaWd4bHNpTWQ5dFJL?=
 =?utf-8?B?TVBOcUg0TlNUdll2OU1DOGNJNEwwUjQ0dGU5SWlHQmxUSGZ3Z1JaTEk2dUJw?=
 =?utf-8?B?ZlhldEtMdlNOV2E5a2xZWUgxMzlqY1lScjRJNEEwVUhFbUErVzhEUXUyTzFu?=
 =?utf-8?B?QWxmblpFbzBSUzF0U1NKVnpobVJnZUtpd1NnRUNCWUVyOTBEMDhOeE1HMHdh?=
 =?utf-8?B?NEJ6WnY0cnNnWWVRZ0p5Vi91Q1FVU3RGSW5janlPSGNXckFScndNOXZyeVZK?=
 =?utf-8?B?cXMzUytvdTZGYTJjMXNFeWNURjBVODVQbHN0M0RQTDEyVjdCenM3bnBINXZ6?=
 =?utf-8?B?dlBxZWxkWDVES29EdzRvOE93a0t3eVpHd1FJL3dVQkJoRnNzblNjZmFtTTN4?=
 =?utf-8?B?eXpoY2FrWlBPY2FWM2VRZE0wTlZwOFk1RDVyQytkZENtN2RMMXQwUUE5N2lW?=
 =?utf-8?B?Z29Cc1Naa05CMXVVY3RDWDYwNVozdk9Gb2ZGVldUSkZnR2oybU5IeFgxZ3ZV?=
 =?utf-8?B?M25yUWJWOVZ1d3pZOEF4N0krUkdlaFRyQkl1aHh2SkEwRTh4RStyS3VZb3Y4?=
 =?utf-8?B?TUZXQ3d0bHNkK1liK21pcFFYWDY5SFI2WXFFeXhEYXIwTzJ5ZlV6UmxSdGFv?=
 =?utf-8?B?YWwvRkRUUHBRZ2NEazVRV1lMVDdDblZEeEF6Y2psSWZScDZpdlJWUlgyQWtr?=
 =?utf-8?B?UGlCenFTSEpyS3Q0UlppN3E0Qkd2V3dJeFhnQjBkZVZGN09LcnpsRmM3V3Nt?=
 =?utf-8?B?MzNrNEF3aktwNm1DR2JyUVdPNktCRmJjTEE4WkNzdUU2M25XZjJtYXBuMW1N?=
 =?utf-8?B?NjZvUFVySXc4Vk50V0NyRmtkVDdvZExqYm5yQnMvUTVoUEg5OFNnZFUzNGxT?=
 =?utf-8?B?TWZ6aWlpZVdDZGF0V2ZzSDFqcGN2ZVg2b1ZBRGxTY2Z2VGdGMFZ3aUFTR2o3?=
 =?utf-8?B?enVnQ2RVYWtTRHhja3FYWlhwV05KOGN5Qk51NmVhV0o3M1h6M2tnRGh5dXlO?=
 =?utf-8?B?WGc4cHdMbUxNbVJ5SnYxNWdEVFIvVkViVFJaWjBzTW9LeVRwSkpOaTNiUUxC?=
 =?utf-8?B?QlV5RkNza0FKWnJQYWxmWUVOU2xSb0c5V3J6QkthKzNkWnU3dlR6bzNvaDJn?=
 =?utf-8?B?S01QbjJXNkVsNXQ3eXlNVWNUeGtTR2dMc01oa2FnM0lYYU00ZmdwNndKZTBI?=
 =?utf-8?B?TnlFOVFBWTM3SjhHaEplaEgxcFo1UkVMemxWT1hUa04zTEg0a0hMRlFHcDJO?=
 =?utf-8?B?UDRZd2hrWFB3NnZ5UDFVZnhZWkVmTXZVTTV3TTRmbWVTcHdDTjI5a1ZCY1VJ?=
 =?utf-8?Q?0ZCjuHiHIXzM4t7ZD6Y+BlfPiqecqq6U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFowWjZFN2pqZTBxZzJOeE9vdW45ZmZ0bG1xUVJGdmdQMU1yZFZNMVhpMTZN?=
 =?utf-8?B?V24vRmJ1S0VvY3hFazF1L3FuajR6KytNWVZyQTNGNVROUnliRVFzd05ITzJp?=
 =?utf-8?B?aVNQekowK0t1ZnZldmVxM0NEV2VLYVhlM2UyRzB0cE1mK0VNcFpWazVUcncv?=
 =?utf-8?B?NWl4NVRSd0liSnhyZHZFQ3V0a2xuUjh2MEhlTWVMQ3hzME1XRGJscGVJY0RJ?=
 =?utf-8?B?R1ZVTnFrN1lRWVN4bERvUHNQVEF5T3dMRTY5MWVsSTE5clFkNGFSOGJwNDlz?=
 =?utf-8?B?UW1lTmJzaEgrNktKcHdWc3g1cit6RUo1Q3FIcFZWd2F0aEhZME1PY0dGYlBa?=
 =?utf-8?B?ZVRJOVJiUEVONXJaVGowMDQwVTVQa1VGS2RpYzZVb2lrcFdJVUphQ3lvOHFz?=
 =?utf-8?B?VWVlZVdVWURmaVRRUk5QTEw2SGszOE5TZ3VNSE1BRVlHU0p4V1hTZzRBWDR0?=
 =?utf-8?B?NTV2SjlXQkkwR29jNm1yQUxGMFZPU2huNStvS2hoR1VOdjdjeWRuTEQ1SUJH?=
 =?utf-8?B?Vzl5TEtSRmhXUVptdllSWEZ1WkFLbmRXMDN6cDB6VjFHVjNpUkJ3NUJ3Sjhr?=
 =?utf-8?B?SUx2NFlWenhFYkZyS3ZhWGF1OERTNUJMb0FYOVFjUS82cjJ6bzlCbmFxNlBY?=
 =?utf-8?B?NTNJOENwWkQxN0lhQXFQK2lBc25SbGpZQXBudmZpNTVVWEgwS1YxL0RYcCtT?=
 =?utf-8?B?UGhjaEEydGZCME80eTJnVnNHRmxBci9udmFLQ29XSTBUcEM0V1NOdHRyaGQr?=
 =?utf-8?B?WFYxSUgxRGhDbmRKSnRDZlNPVEhseUxWODg3NFZiZm9qWis4SzNJTkZxQmJm?=
 =?utf-8?B?ZHdjZTlRQWdmbXp2UnNrbXZTc01lNGFwZERPdmxjWmkwZjU2WWx1cVhJZEdZ?=
 =?utf-8?B?Q0s0ci9HWWZEZGR3TVZpdE0xcTlhYk15OGdVejkwdm01T0p4cmYxaGhqbXpQ?=
 =?utf-8?B?QkpJRk8wN2pWV3Q1VjB5Qi91djNTWXJpZUZadjdhcUZOSG9mb0dxc1c3Yjhw?=
 =?utf-8?B?QnYyRU1CSzZpTkNUdEVUNjV1bmdsRGZtMGoxMjltNFZxRnBucEN5dWR2ZzlM?=
 =?utf-8?B?RkNmcHFIcWV2ckU5MmhIUlF5N0hEQlhJU1RRYzZwOVV0N2hpSzQ5bVJrK1VX?=
 =?utf-8?B?NldJNzU1eVpBSE5TRCsyUEJROGNzRkhHNUw0M2ZYblVCNWFjTzV0NmZkOUdQ?=
 =?utf-8?B?MGdBT05vZU1hSVJ5bkozNGtCZ1Q4U0hrT2ROeXZ3b3NpUkpFOHVRL29rb0lF?=
 =?utf-8?B?TXdzRm5TQjRiU0tTcU04SFdsSEFLWTNSNEF1dHdQK045ZzV1dHhZWHU4NjVV?=
 =?utf-8?B?VEJidSt6RHhJVkZ1T0pESVN3SHVzcGNvZ08rNVhDNHZBTmpmWXpoa1dnVjJ2?=
 =?utf-8?B?a0FBVWlFUUlrTnlOWFJXZGFhZXFON0UyN1NwZWtycGVEWHZtSDZOWUpVN2ky?=
 =?utf-8?B?NG5SSGFTajlzN2g5MTcxSmNnUzBJZTAyaVZaSnZlRFlZS1UzSHhVQXRWQ1Ns?=
 =?utf-8?B?UEI1NG83blBQWExlMUJEcGZGR3B0Nk1RRE0vVHJTMnd1VWE4bnAxSnpsVm80?=
 =?utf-8?B?enRiY1pIN1g3NW9TakRrc2kxdTZzNFRYNkE5WURDWk4xK21peENacVpYYW92?=
 =?utf-8?B?Z1FaWThIaTMrd3dHMVZLQVpRbys1T2xRdEloajRkdEFSVVVYdVVveFF2d1dw?=
 =?utf-8?B?YXZ5djZ1MVIyOUgyRU1EdURIQmlIeGcrcVlDVDVZUnpFcGw0bHYzVjA5WnA4?=
 =?utf-8?B?UHB1VGw3azc2NS9yUThRa1RocUI3UmEvVmlqaXlyVEdaNlU3eUZrRE5sOTlS?=
 =?utf-8?B?K3l5Y3NXaER5Mm1CYVhHMnFoSVBlVlpnNCtGbk04a0NnSDliWG5tb1VzelZy?=
 =?utf-8?B?L29vcEc0aU1xUFl3UG5kalhDUHRFM3Qwb1ZZdk4ramhFZUVXNkswbzdLWEk2?=
 =?utf-8?B?ODNOVzRSNzVxYmxUUk0wZjdJODBPY21Jb1poOXRnMW5oTjB4YVA0SVNVdnlj?=
 =?utf-8?B?S2dqWGhNQUVtK1g1VUtPN1R4K0tuck40NVErTk5DbEMwNkhEc1JUMm9kcjkw?=
 =?utf-8?B?QkpZTnBtb2N4UDdmbWJLY0VqMGNOL1gzelU0UEpPbVZYOWNYMkEzc0VnTEls?=
 =?utf-8?B?UFdMMEVONGZHL3RqL2lIcG9vOTRKcHEzSERDQ2VGQ2xPUkVValBNVDVOOUpC?=
 =?utf-8?Q?fbh9MUSC4wNaxo6kqQXYHRsnz8FIW1MocejhFLk0RziT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7aad33-8ab7-4776-945a-08de205f280b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:43:40.0671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEfiMLzEf01Mp2t7+wscStij80Ru0U3BpdiQcB3l+5mxLuo9YXI1xYAa9R4mGh6AYhnHomVMl+G3ksmPA+pfeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9340
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

Hi Joel,

I guess you will want to rebase the series on top of the GSP boot v9,
for fixing the conflicts with the imports, squash patch 13 where it
should belong, and also because it adds a few things that should
simplify this patch.

As a general comment, the structures and their members could benefit
from short doccomments (thankfully after this review there should be a
few less :)).

On Mon Nov 3, 2025 at 8:59 AM JST, Joel Fernandes wrote:
<snip>
> diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-co=
re/gsp/sequencer.rs
> new file mode 100644
> index 000000000000..48c40140876b
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gsp/sequencer.rs
> @@ -0,0 +1,208 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! GSP Sequencer implementation for Pre-hopper GSP boot sequence.
> +
> +use core::mem::size_of;
> +use kernel::alloc::flags::GFP_KERNEL;
> +use kernel::device;
> +use kernel::prelude::*;
> +use kernel::time::Delta;
> +use kernel::transmute::FromBytes;
> +
> +use crate::driver::Bar0;
> +use crate::falcon::{
> +    gsp::Gsp,
> +    sec2::Sec2,
> +    Falcon, //
> +};
> +use crate::firmware::gsp::GspFirmware;
> +use crate::gsp::cmdq::{
> +    Cmdq,
> +    MessageFromGsp, //
> +};
> +use crate::gsp::fw;
> +
> +use kernel::{
> +    dev_dbg,
> +    dev_err, //
> +};
> +
> +impl MessageFromGsp for fw::rpc_run_cpu_sequencer_v17_00 {
> +    const FUNCTION: fw::MsgFunction =3D fw::MsgFunction::GspRunCpuSequen=
cer;
> +}
> +
> +const CMD_SIZE: usize =3D size_of::<fw::GSP_SEQUENCER_BUFFER_CMD>();
> +
> +struct GspSequencerInfo<'a> {
> +    info: &'a fw::rpc_run_cpu_sequencer_v17_00,
> +    cmd_data: KVec<u8>,
> +}
> +
> +/// GSP Sequencer Command types with payload data.
> +/// Commands have an opcode and a opcode-dependent struct.
> +#[allow(dead_code)]
> +pub(crate) enum GspSeqCmd {}
> +
> +impl GspSeqCmd {
> +    /// Creates a new GspSeqCmd from a firmware GSP_SEQUENCER_BUFFER_CMD=
.
> +    pub(crate) fn from_fw_cmd(_cmd: &fw::GSP_SEQUENCER_BUFFER_CMD) -> Re=
sult<Self> {
> +        Err(EINVAL)
> +    }
> +
> +    pub(crate) fn new(data: &[u8], dev: &device::Device<device::Bound>) =
-> Result<Self> {
> +        let fw_cmd =3D fw::GSP_SEQUENCER_BUFFER_CMD::from_bytes(data).ok=
_or(EINVAL)?;
> +        let cmd =3D Self::from_fw_cmd(fw_cmd)?;
> +
> +        if data.len() < cmd.size_bytes() {
> +            dev_err!(dev, "data is not enough for command.\n");
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(cmd)
> +    }
> +
> +    /// Get the size of this command in bytes, the command consists of
> +    /// a 4-byte opcode, and a variable-sized payload.
> +    pub(crate) fn size_bytes(&self) -> usize {
> +        0
> +    }

Instead of having this (which involves another dedicated match
statement), how about having the `new` method return the size in bytes
that are read, that the caller can add to its cursor?

> +}
> +
> +#[expect(dead_code)]
> +pub(crate) struct GspSequencer<'a> {
> +    seq_info: GspSequencerInfo<'a>,
> +    bar: &'a Bar0,
> +    sec2_falcon: &'a Falcon<Sec2>,
> +    gsp_falcon: &'a Falcon<Gsp>,
> +    libos_dma_handle: u64,
> +    gsp_fw: &'a GspFirmware,

`gsp_fw` seems to be only needed to obtain the bootloader app version -
let's store that information directly instead a reference to a whole
structure we don't need.

> +    dev: &'a device::Device<device::Bound>,

Since this is only used for logging purposes, we don't need a bound
device. This can be an `ARef<device::Device>`, which removes a
reference.

> +}
> +
> +pub(crate) trait GspSeqCmdRunner {
> +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result;
> +}
> +
> +impl GspSeqCmdRunner for GspSeqCmd {
> +    fn run(&self, _seq: &GspSequencer<'_>) -> Result {
> +        Ok(())
> +    }
> +}
> +
> +pub(crate) struct GspSeqIter<'a> {
> +    cmd_data: &'a [u8],
> +    current_offset: usize, // Tracking the current position.
> +    total_cmds: u32,
> +    cmds_processed: u32,
> +    dev: &'a device::Device<device::Bound>,
> +}
> +
> +impl<'a> Iterator for GspSeqIter<'a> {
> +    type Item =3D Result<GspSeqCmd>;
> +
> +    fn next(&mut self) -> Option<Self::Item> {
> +        // Stop if we've processed all commands or reached the end of da=
ta.
> +        if self.cmds_processed >=3D self.total_cmds || self.current_offs=
et >=3D self.cmd_data.len() {
> +            return None;
> +        }
> +
> +        // Check if we have enough data for opcode.
> +        let opcode_size =3D size_of::<fw::GSP_SEQ_BUF_OPCODE>();
> +        if self.current_offset + opcode_size > self.cmd_data.len() {

`opcode_size` looks superfluous as it is only used once.

> +            return Some(Err(EINVAL));

Should probably be `EIO` as the data is not the expected size.

> +        }
> +
> +        let offset =3D self.current_offset;
> +
> +        // Handle command creation based on available data,
> +        // zero-pad if necessary (since last command may not be full siz=
e).
> +        let mut buffer =3D [0u8; CMD_SIZE];
> +        let copy_len =3D if offset + CMD_SIZE <=3D self.cmd_data.len() {
> +            CMD_SIZE
> +        } else {
> +            self.cmd_data.len() - offset
> +        };
> +        buffer[..copy_len].copy_from_slice(&self.cmd_data[offset..offset=
 + copy_len]);
> +        let cmd_result =3D GspSeqCmd::new(&buffer, self.dev);
> +
> +        cmd_result.map_or_else(
> +            |_err| {
> +                dev_err!(self.dev, "Error parsing command at offset {}",=
 offset);
> +                None
> +            },

This looks a bit redundant: we are processing errors here, but then we
also have another error handler in the caller (the one that says "Error
running command..."). I'm pretty sure there is room for simplification
here.

> +            |cmd| {
> +                self.current_offset +=3D cmd.size_bytes();
> +                self.cmds_processed +=3D 1;
> +                Some(Ok(cmd))
> +            },
> +        )
> +    }
> +}
> +
> +impl<'a, 'b> IntoIterator for &'b GspSequencer<'a> {
> +    type Item =3D Result<GspSeqCmd>;
> +    type IntoIter =3D GspSeqIter<'b>;
> +
> +    fn into_iter(self) -> Self::IntoIter {
> +        let cmd_data =3D &self.seq_info.cmd_data[..];
> +
> +        GspSeqIter {
> +            cmd_data,
> +            current_offset: 0,
> +            total_cmds: self.seq_info.info.cmdIndex,
> +            cmds_processed: 0,
> +            dev: self.dev,
> +        }
> +    }
> +}

You can do without this implementation by just having an `iter` method
returning the iterator where appropriate (in the current version this
would be `GspSequencer`, but I suggest moving that to the
`GspSequencerInfo/GspSequence`).

