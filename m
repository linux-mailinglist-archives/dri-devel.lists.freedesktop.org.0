Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6F0B406D5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876E210E75F;
	Tue,  2 Sep 2025 14:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fNsiiuZH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6048B10E75B;
 Tue,  2 Sep 2025 14:32:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cB456S9w5M2anIzib+7dKREFHW2taeqfjDrHLOWcDfW/7fUrILFjSNplLZ7tCcgsM3nCj+0RrX3JzKIQ36BjoTOjrzHs7XFZT7ptck8FWQroxmy7J6HIl+r6Uv6oAlHbUk71zxM7kcvt3Z4Iaaq7GIZsQnO9HCftf4MFervYLfIE8bi2HxcBhzgFi7HtlxM+L6/PnthT6NNH0O5s5t2MOSfEeg5+qm1PIe7cJQ7zDYWryO2pwlyreIEtibB7NK+inVcKcJ3NejSgbHhnXoZc1oWP7HqxFj78L1eEFh/Mq1xFnWaLia3L8nzIiCHkbNHEDH0lzKmORLdRb3XoCreWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uj1iQoLOMGKlTVs6OYtI38cfc60EehrVcLNm2SBa4oE=;
 b=mrNfAaYzuUsYIRAzQzFQ4k/stNgFfaDq8QbWvnnrb/k3oQBgPLxlnYgO3g59PqQWrgiih5UTCsD4zlz4Yer+rKT9aAwFbSsDhqcaZdNfIldokfNYGjZyC4mUf5+dbcWreILd7xJ4jhLjhQOd30EK+ZifomqnFWbY069Z2S7n0rsz8DTwnz88Xsz/J4l06XUxzxe44hlCYAoOL8HgULhD+q4r1NI+wYx4xCnEQONYDAAZLQww1Zysyyt0l99ODGrYQYFAqmwh2LV/HxlfF/3x3BWJUl79hKo1/8tLICsZ4ih448EArbqpMOUhAsI9Wy8B6bxESMNNRyArSzoEMHA89Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uj1iQoLOMGKlTVs6OYtI38cfc60EehrVcLNm2SBa4oE=;
 b=fNsiiuZHRBVlvxvSOSrhUBVzB+PGUQTIvOwstw2DRIbEXLwYhuKuzUU1uvl95jNN2lA5eoNEqatAgn/Cwvsm6QQBqhGZorjqB7WE5uCCe3hanOvRJS3KBJZuisDAmqaOEG/wHVZm7OQJ6am8ma4/4ZmKwgrQ+aq4mJADPAW/1kHLdC34MVb5xn/S6zbMli87qBcM7UMc1E164PCOG6RzRUZ6zqxSVMF2wFQZ/Ey1qd3OSPb6pBXfKNdl2/QNpTt+px/r7eQXOOEKX7KAr1P2o3c0H2HfPfCVh8HTOz3a+fk+q2YTwgEpyuhLjhCqfAr8c6emmYSbOtCOBXTHsuv+SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8955.namprd12.prod.outlook.com (2603:10b6:a03:542::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 14:32:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Tue, 2 Sep 2025
 14:32:05 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 02 Sep 2025 23:31:55 +0900
Subject: [PATCH v3 01/11] gpu: nova-core: require `Send` on `FalconEngine`
 and `FalconHal`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-nova_firmware-v3-1-56854d9c5398@nvidia.com>
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
In-Reply-To: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWP286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: 774eb66f-e59e-4a41-acc3-08ddea2d7d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amdTaG9scndFZVg5WWhLVFE3ZTgzd0IrTStCNi9FSWNsMFljaU1sdjhIbUNV?=
 =?utf-8?B?UVRaekpDeDlmenBXeTFGTW1Uc0NRSkUvazk3Y1ExaCthbzU1b050NUhNeWp2?=
 =?utf-8?B?WXBoTWtJRHY1NDdoUGY4UnpYYnJ2V3VDYWI4QzhFUlFkbGJjdDRHekR2ZVFt?=
 =?utf-8?B?RHhVU3FjMVdubzVoRXcvdHI3NTk4cU5jam5yNUFTUXZvSFNQOUlxdldQQklB?=
 =?utf-8?B?WGpuVWhFdzhpM0hXSlpEUmhQa3lGZW9NUnVTTVIzOWxNeGZRbkxFOTB5aGcw?=
 =?utf-8?B?Mk1Fa3dUWGFwcS9MQnpHZllWNmkzSDJPUVVQYlR2UXpUTXVHQ1lpZWxwOEFu?=
 =?utf-8?B?dnQ4WTA2Y3VsRnh6dDJFTnA0K2t4SlJ3K2U5RXNmVXUvSVY2SnVjNENreVNy?=
 =?utf-8?B?b3BWRVR3YWcvWjdwOHhBQWUxVjgyVnFrKzNjVzQ0NFQxbXNpMGkyR2Z4MGMr?=
 =?utf-8?B?Vms1TlA1NU43TEpkVjdpWWNUYjNTOWZxVklOc0F2blp4TW5YOHlndGNQMjc3?=
 =?utf-8?B?UXlDR0NmeXFBM3Urc1l4R0Qza3F4MjFyT0RWQVhOaTRPS0thdDNicE5kdlNr?=
 =?utf-8?B?eDJuUGdkcS9HYW5RaFJ2QytrdlUxYjJMRDI5Q215QUVYcnJ4dVlWODg5ZGlj?=
 =?utf-8?B?dFVrYUFjT2hIK0xzS1pLYmc2M2ZWd3lrTXNnVkNia3pUYzRSMTBRUVBsYW1U?=
 =?utf-8?B?VEVoRlRJOWJUTGRnVlpNRE0zTUJ2MWZQNVZVa3RnVUx3OEcvcnZMSzFJbmpD?=
 =?utf-8?B?UVVOeitpRVhROGMwRHRlalBMRkpPczg5R0F5ZEtmWG5kSWpoRW1iVGFhdTdE?=
 =?utf-8?B?OGx3MGJGUTZEUXJxQUZPTXNuNVJ1UWlUZCtUL2J5NkVmVjBDcVVMWGhxdTl1?=
 =?utf-8?B?T0hmRzJ6MjVCR2hkcFNPRWdtRjVvUlRoSU5iNFlXckpyeEoxa1pUWTVXV0FN?=
 =?utf-8?B?eklUbjd3VWZHWTFPNkozcXBFdEZJWm1VUHpDUzVpb3d2WFBvbmM5eXJ0TnlJ?=
 =?utf-8?B?a1dDRDE3WHllTkV5aExVQXJlNkRLSWI3VFdJRGdDK2JzWFAyamtNR0U5cUNt?=
 =?utf-8?B?VTF3SEZFbjR6aEdiaUttbWIxZHRuSmFSMW5oNUNCaTlnNUpVaDZ6UlRTSysz?=
 =?utf-8?B?eXB0UmZlRFhnM2U1T2NidjhlbkJ5ZTMxWGpzUlo2SEVtSDE1eTZFeit6V1Uv?=
 =?utf-8?B?WGJKMU5RY3B0WUh2djQ0enRENlNsa1cxY0R6WHNLQkFubVFyK1dYaElVNFA1?=
 =?utf-8?B?THg5Q3V1MWpGWlEwOUhmVVNpMkZiekw2aStSa2ZHOEtuTWVzcHhzOTYxaDJL?=
 =?utf-8?B?L1JsUm9NeHd1cUUyMVhNVXU4Q2V6dzB4Zm9DQlc5aTZCek03T1dXVktHTkJk?=
 =?utf-8?B?WFBjMklsUVpjSkdsdldvUHVRb2dZUURKUlJseTJLTVVaY1YxVDNmRUxOTWJ4?=
 =?utf-8?B?WkFhQ1d4MkZnR2V5VE5zUkhZRWhPclNwNGdVQUpaTDZkQ2pna2lYb1p2cUFK?=
 =?utf-8?B?RFNuR0xxV3pBOFF4aGlRR3FqQzBGUFZIUjFETk1ZNlRmSjFock4wZEJtVVRl?=
 =?utf-8?B?MTVLS0hMN3QyclhQcWQ3NllJYmkxNnpVTjdpOUNKZEFIMEdjaC8wSEN1MnI2?=
 =?utf-8?B?aDlLMTczKzdRdlZCOGNyRGxXRU5Mak5PTUViU01OUXBXRjF5Z0psNWxzbUNG?=
 =?utf-8?B?K2E4S2JpbXcvL2gxQURIN2d5bGVlcXZDa3BVMEgrN1NVR0NBdlg2aERKOUY2?=
 =?utf-8?B?RU9kSWdlQTZrVGN5bzVFVWY0dTAzL3c4TzdLSkJOSStoa3VESTJCUlM0dS9q?=
 =?utf-8?B?WDlWNW9SU2pTeFA5TUI4UVNNdnZGK2IwNmNmTXJzakNrZ1d1VnJpZ0N2VnF5?=
 =?utf-8?B?MzhpWVNkdWNWOWdJK1ZGV0gwR2IrM2lUZmszK1V2WVpPeDZsNXJVOGFnNUMy?=
 =?utf-8?B?RE9CN1NNOWJYU28wbFlaeEtLRzVyQXN5ZmNhQXo4dW9jbE1sZUdVQnVoc05p?=
 =?utf-8?B?Mk5WY0RNMS9RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWVvVjhyc2k0cXY4U3ZpRzRManB6eGdtQXNzTUF0NndYZmR6d296NGZzRFJY?=
 =?utf-8?B?cUp1SlJHbk8zbjhDMzFXMHlmMGpBMVhjYmlqWjBSYnBoWlFXclR6L09GNG5R?=
 =?utf-8?B?SWIxNUlIMG5yQ1pYalNSZk5KcmREaHR2b29tODhBYzdZZVdNU3h3akNEUG1S?=
 =?utf-8?B?SWF5aG04Zzd3eWh0MDlicFB1THFRTVUraDB0SVZPUllKdTlJcGduMGtFbjVN?=
 =?utf-8?B?STh3ZDAxaGtnMXl1WUJjVUNUUEVldjZTcFd0YXRCZUtEWnpXNzhRSjFBRUJ2?=
 =?utf-8?B?c0pSaVdZb044b1BYNzdBdk85T3hXMVc5M0RmdUhGZUFFUlFybGxpRE02NktG?=
 =?utf-8?B?Z3QrVXlFdEhiSDRBcjZLZXh0MmliK2FFMHBYTU43OGlwWVc4Y3M5ZnJ5UStM?=
 =?utf-8?B?dTJTUHBYUmxOSEZUYWkrU0NyRmVLeHo1N08xNWE0MW0yMHhjRll1dTBzZWZN?=
 =?utf-8?B?K04wZ1dKTkN2aTVGbk95ZHpKZW9PdTBWbmNFSFQxUkJRekJsOGowc3lyWUdW?=
 =?utf-8?B?SlY0bUxvczFPTmpaTmIyZmlxeS9yWXRFT1V0dmZxQlVNYzRMK3BZemNoQ2Jq?=
 =?utf-8?B?YVh5V1NJRW0rZFlwRndNdkNRMVR6bHpNUnZ0cDRCZldLeFFBcEFFelNwUi9Q?=
 =?utf-8?B?RW5JOXBTblNDbUFCbnJrdng4VHpkWHExQyt2NVJFNWN5M3F6dkgzczNOanZY?=
 =?utf-8?B?TktFaUdXc2tDTjNPdU4xM2R0Y2hoeWRJRzdqZERiaHJaTWp0ZkE3MlFOeWli?=
 =?utf-8?B?YVIzQktMR3I1L1VEZzBnMXdIQ0s5WSs3MXZpQ0d0cXZhWnVYV0wvMFpTaUFw?=
 =?utf-8?B?TTNrNVZleW8xazVtYTExYkx3clRvSklXcDFEYnJObjRtZUUySXlHSjExK2R4?=
 =?utf-8?B?aFVhL3JPZ2JEejNtTDc3Si9TWWtha213RUdTd251Z0ViV2tjb0ZkQ1ZXaVZD?=
 =?utf-8?B?TzhnNmNINzJ6d3VuYTBZdVB6VVFvWFI1Vm4rUml4SUwwVzVMc3gxMmlsME1J?=
 =?utf-8?B?YXFHV0pIMXlDK1lKZ0ZOUHZHclk3UzcydlBKM0JXRm8wb2l0NnR0bi94c3k5?=
 =?utf-8?B?YUlWQnJqMkpIRHlramcwVGNvcWdadnJLUUFVVUZOZDliOGVlNDFTaHZIUmJ6?=
 =?utf-8?B?cldYeDNjZGJhQ2ovTzc3UGJENHY3eGE0VDk2V1VDdXBtWXNTRWh2bTNGNDl4?=
 =?utf-8?B?RDRDMjN4M2s1ckpoSFNadk5HL3R0ZHVKVFltVVN4VXNKc085RmFDR0dyQngv?=
 =?utf-8?B?N0RjZHBSbUdocnIwdGd4TzJ0L2N4Y2cyOGVYcHFJV1Mwb29EamNWQ2EzTEdF?=
 =?utf-8?B?VVVOaWg0V1NXNWpBbjdKcFdQd1BjUzgyY0VhaDZrK01wb0h5TWxzM0hjMkI1?=
 =?utf-8?B?d084T01XRlJrRGpGOFR6ZTNSZk5OZitzcjkwbEJOUzFpZFpSSlhUOUI0OUw5?=
 =?utf-8?B?WmowYnAweFpMdTNQbEUyVDYyaDMydFRBWFhtajh3S0pWUG80U1Y2R2pTSlRD?=
 =?utf-8?B?VW9DeU1LVW1hKy9CODVTdFYxNHJMTmN5UUdHYnl0U1lDbHExTWJoQ0ZMYUVS?=
 =?utf-8?B?MWoyNnRLTUcvRzYzcWdsOXQ5Wmh0bXVISHRzS1U3aXUxa1FJTk5MVnpaYnNz?=
 =?utf-8?B?cGF2bit4WG9LTWw0d2V4RHc1ODlJUTdkZklDVE56MXRxNUpNOEh2R1RKNjhV?=
 =?utf-8?B?ZDZzdEpCL2hKQTV1WXpKbnlIditQYnBxaDdCVFFuNnZ3RmdTejdvWFlFWDcz?=
 =?utf-8?B?SjkxNFZkaHVzeXRrNnQ5WHJLOG1UR0R6Yit1MHBoWGNOT1U2K1FUUi9BdHRE?=
 =?utf-8?B?aitQeGh4Q3R0eUc2SklHT0VpaVowcDQzL01xcjByY2tMQ3FxUGhoU0U2OHVX?=
 =?utf-8?B?VTZ5YlJoZ2h2U0NyK2Zva3M0Z2V3Y3NjTTZMQ1dGOHBaU09mWEUwVTJHSFVw?=
 =?utf-8?B?bm56NGR6SzR5cFVwZjRVY2JKTTUreHBLRVhPYnhJdjZHWndDTk5rQUxKcnVu?=
 =?utf-8?B?M3dyTG5Wb1U3N1JqSjlHbXNWVlpzYndaTlRra1F1Nzc3VkYvaThBNEh6VmNU?=
 =?utf-8?B?QU1PM0RsM3daUjR6NXhGanZoMnZyVGxYOG1VaHJ5VlNNVXpiUm5nNzMxRm4w?=
 =?utf-8?B?WXM5NCtsaGVZZjdicndHZzVhdk04U3F4WHk4TytORTJuN1k2WThwSEVqRGoy?=
 =?utf-8?Q?61kWCqVwRQtotpVfqtfDw2yMU85nUeZSHAlYzzioRHJ/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 774eb66f-e59e-4a41-acc3-08ddea2d7d52
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:32:05.6510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIyFmruSQ1kFY+klRADbtIzy/7c/1NgdpZDHC2wTheC6dSTG+kw5/TZvi9d91XKcx2NIwKBQuwTfwDAuiq1auA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8955
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

We want to store the GSP and SEC2 falcon instances inside the `Gpu`
structure, but doing so require these types to implement `Send` for
`pci::Driver` to remain implementable on `NovaCore`, which embeds `Gpu`.

All implementors of `FalconEngine` and `FalconHal` satisfy the
requirements of `Send`, and this traits also already required `Sync`, so
this a minor tweak.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs     | 2 +-
 drivers/gpu/nova-core/falcon/hal.rs | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 2dbcdf26697beb7e52083675fc9ea62a6167fef8..b16207e7242fe1ac26b8552575b8b4e52f34cf6a 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -286,7 +286,7 @@ fn from(value: bool) -> Self {
 /// Each engine provides one base for `PFALCON` and `PFALCON2` registers. The `ID` constant is used
 /// to identify a given Falcon instance with register I/O methods.
 pub(crate) trait FalconEngine:
-    Sync + RegisterBase<PFalconBase> + RegisterBase<PFalcon2Base> + Sized
+    Send + Sync + RegisterBase<PFalconBase> + RegisterBase<PFalcon2Base> + Sized
 {
     /// Singleton of the engine, used to identify it with register I/O methods.
     const ID: Self;
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index b233bc365882f9add9b6eab33b8d462d7913df37..bba28845561795914e9a4dba277d72bbac0b37dd 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -13,7 +13,7 @@
 /// Implements chipset-specific low-level operations. The trait is generic against [`FalconEngine`]
 /// so its `BASE` parameter can be used in order to avoid runtime bound checks when accessing
 /// registers.
-pub(crate) trait FalconHal<E: FalconEngine>: Sync {
+pub(crate) trait FalconHal<E: FalconEngine>: Send + Sync {
     /// Activates the Falcon core if the engine is a risvc/falcon dual engine.
     fn select_core(&self, _falcon: &Falcon<E>, _bar: &Bar0) -> Result {
         Ok(())

-- 
2.51.0

