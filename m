Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AC5ABFA63
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 17:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D280210F9E1;
	Wed, 21 May 2025 15:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dwot1npt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F172210FB82;
 Wed, 21 May 2025 15:57:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CaX8kyRKLI0EXrYxPxLsdbQYOYEK1s9S7DSbzzPE/I4sWvVhRCtEpo1A3fEv0QlYPT5O4KQmOW2yFIi/cGJuGlVJKe6ksHN0yy3sRpN+sSdQ0Pb1tshsS62qb9IcZSpPexLacSelh+GLUR/enzy+mSB3EhpHTj7M1O7MreQ5w6cMC3vhXAjX0nNx8V81hFb8c64A5z0ygjtD+Kj/cnDTMYF8zKLvp7QUx4jG3iVse/EGlz1Y8qf3W1FJr7rDY93cFHTHxW/zrzzdomX1Bh1zxLnq4HB1wwS0qrBdPhXeJKcZSdLjNm/cP9FoVG5we9E9JN0V8XBNm790Ew9Ie9Jzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJZfDRBxLAskRg2z2v0qVIYkaMVohtNGxga+8f4YHP0=;
 b=DMjHvLDynsVmjuLn5el4bkl6hMt+XWOL+22bbpM0VKEI1x78OhykViwaaCk9pLX0jZq4y/5r3D3JMlzcUM7UgOhyGaP4ZjawtxxEGhdZGOslupk5GoYQhomIP1lAbWGIS552q6W2Nkwjn29X0XrHlCHEuYoHWYydcSoVK8NoyhHO7XyP/v5W3eJPSu5LwniYU3mb53jPKLpCa19DecMeFi6wQL0NEgf/qzkcm8AQx4KGhTWR2qmqaQ1knSPnJ2+DdexUcJwsZh0tiX+nfxnhnBC4j8O/zEuPtgPCMRzVqHPHKjZ7K9EaIDAnqiTWOuW50J8dbUMHrCR4jCFRAV5MAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJZfDRBxLAskRg2z2v0qVIYkaMVohtNGxga+8f4YHP0=;
 b=dwot1npt/31pezk1vD/3tLnVe+Jk5cVm6Lo0/+RHLrOAr/K7LJStlrJtBImhGTC9x8ToauykJmbgjBo3jwkwXW2kKtuHQ5GiB0IsITBWoZA/DIEizQPqFFM0wBao8ykajPjl213h1yFtB0P508ZG2RtIKN9S0ByxI9SIOXh1w8mD7SAYnFLaKuFSxPcmyISfpz432K8yUSTfeTS1N+NNck7Mird9V2xczDJB+xry5uLMlrfFf+rg2F6AXBz3tHUoYFGeG1bthS88JdRaiRJhX0Hlc5Ce1fdAS1o9Nb9HYnwGjNC4yeXlHeRqcdhHUh6SjvnZpq+Hk6ktJEp0+kL/MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW4PR12MB7481.namprd12.prod.outlook.com (2603:10b6:303:212::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 15:57:28 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 15:57:28 +0000
Message-ID: <0d5a71b7-92d4-4052-93a8-ed61bc9ebb67@nvidia.com>
Date: Wed, 21 May 2025 11:57:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/20] rust: dma: expose the count and size of
 CoherentAllocation
To: Boqun Feng <boqun.feng@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-1-05dfd4f39479@nvidia.com> <aC3KbKeEVlHggi5l@Mac.home>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aC3KbKeEVlHggi5l@Mac.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:52c::32) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW4PR12MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: 54fe45cc-e24d-4608-fb8e-08dd98802fc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjA4K2tzeGYyM0UrWnloYnIxZ3psT1hZUko1Njgvb0Q5dTBweXdVZTYxVUZ4?=
 =?utf-8?B?UkRkTVlOTkh3UE8rbE94cWxHdklVa0RacjdDVUdpSW1OY0RVRVNiM1ArL2Jv?=
 =?utf-8?B?dHdJdC8vam1WSCtFU2F5S0g2eTVqaTJrSmRvNTl1Rmh2dnhCbzRva2xudmt1?=
 =?utf-8?B?K3ZvSHR5N3F5a2N4Vm1OZTg2ZTFpb05pL1BzaGZrS084TjVvWVZlL1UvMGZ6?=
 =?utf-8?B?b1p6Q0NZZW9NL0JtTlRmMGlYeHNyMGpMQkhDeUx5eFgwdXdITldHSEpkYUVr?=
 =?utf-8?B?MWRsd25LdGI3MWRUMEpibHJWR0JGMjR1UVhRcXEwMkpUZHJaZmEvbC8vdWhJ?=
 =?utf-8?B?VG9VaVdXOHRoM2IyaVloSkZrdVRpZm5kMStEVmRqSVI5WmRuYU5hYkJzNzBv?=
 =?utf-8?B?VXJZSENHTGRPUGhQQWsyeFdxOTdFR0xhSURDcEJtQVB6Q05uRXRVdFNyMXpm?=
 =?utf-8?B?ejkzMjJLcTN1TjErazI3b1NPSnhCQmZMTnI4SW5mOUNQYTRJeHlrbHlPaUh3?=
 =?utf-8?B?QklYcXY2SXpMaTBRZmU3VzhJZU00QndIZlliek5MeGg5dXVpRjAzdHhHZUx4?=
 =?utf-8?B?TkV4K1FXYzljbjVTamJ3L2ZYeU5nYUF3V3ZtMVBESC9kaSt4WHFxN25lUVJ1?=
 =?utf-8?B?bC9SUnI0eHA0WnlQeUpFamlQdkYzSGpnc2xDOU11VTlZSDJzYlhzQkhqOEhP?=
 =?utf-8?B?LzhBMDlDUW80aUlNVlhzY3lKeU90TytIUC9GaGhQZXE2ZjFteml6RkVVemZq?=
 =?utf-8?B?bTl2ZkZMSTZCakxXYzBjZFN1aUxuQjVVa051Wm5XSU9QWmhjSnErZWZqZERn?=
 =?utf-8?B?V0cwUmtQeTNVMGdGb1FrTVUyMEltcjBrS1NzeDF5Qk1xVVBZekt0SzVTM2k4?=
 =?utf-8?B?VUh3VFdBTzhpMjRuWDFUd2owWkQ4OU5wRHpNQ3dZaWZkdm5PaDcyY21CS0tL?=
 =?utf-8?B?ODZPU0o5ZXFoQjhyYm0vd0hXak50SEZ3RXIvR3o5OHhYYjlqaitISjFGbGEy?=
 =?utf-8?B?NkpHTDZ0TUt0aHg4NWE2QU5ldkd3eHFmZVRmMmhkVzVtOVFTYm5zOGxGMnZk?=
 =?utf-8?B?b3ZZR1YwNVFJcFNDbWZWQURwbzFmbXZUTmljZXFZSHU2NERVZUZONm1Da0dU?=
 =?utf-8?B?YkdsM3F1aXEvSWd0U0xJM3pWRVNucEFtbE1lTnBHNUJyQ290UnQ1OWoxMzhT?=
 =?utf-8?B?Rlo1MkVyc1V6YW9CTWlMYlN6SjIydHN4NUIvaUlzdXJlV2J3QkY3dkZRRm1V?=
 =?utf-8?B?bmh4NG52RlZpMU0yanZkVVMrOFA0SWJ1cTFxcG1aQmoyUXpuK002SjhQaWVK?=
 =?utf-8?B?YTVNZlpsOHY5U0pRT1hnQWFzSEJvd2NrUWVDclp1L3A0dFE3NWZlNWVKcWV4?=
 =?utf-8?B?SExINWNDWDh4MUY3REk4aDMrMlJHc0VSVzhWVnV4RWJCSEZXY2YyNFFBWjlm?=
 =?utf-8?B?Qm94d1dXelZMTzROYk0ybEtiYW83R1U0OGw0MnBneXB1T2dtZFExbDNwOGQx?=
 =?utf-8?B?N3A1ZXlPdzAraUgrVzMza2s1UFZlZjMxd0xYVkQ4YlFZL3I2UWFqdldZQjk3?=
 =?utf-8?B?V1hZb1ZzMUNPamVXMUE0cUVNWCtJMm9ncjZXNmdseFA5dW5nMjhmSjlNRXpa?=
 =?utf-8?B?T1F3R0hVREhhR1lCdmF6L3FKUjhSNS9La3RZZHQ1ai9kQ1czZlFNNEFzRStV?=
 =?utf-8?B?MTg3elRnYmVuQUdtZWNZbXdOWVJ6OG5TWVplUXZ3clJHeXpzUVVQTnhkenJS?=
 =?utf-8?B?TmF2a1V6RGtXQjJVV0lEVzRBK0ZHRDFSSHBzK2JFTE9mN0hhcWNnMEFpdzFr?=
 =?utf-8?B?ZmpmN0pabnN5a25LV0trU0E5bVVrRndaallyS2s2OHUwVUZFYUlDK3lFNCtL?=
 =?utf-8?B?aTVyR3pzQkpSaG1uNWprajVyd1JmU1JwTis3OU1MalV6M1czVktUMGhNU3lY?=
 =?utf-8?Q?bR8rscXmSRQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEQzN3JMbFBkWFE5MXpaNDM0L24rSEVvWGl6NmhIVktPTzNrWjhUZy9wTHZX?=
 =?utf-8?B?OWt0eXl6Wkk4RzFueS9IVytwRysybzlibXF5Sk8vQnpiYXU0dmQxdEdKNVZI?=
 =?utf-8?B?cUF4cnVWZHJzZlo4VlVOZTJoOWVtWm1hOEJHYTg3a09aQ2x6ZDEyMGVCbiti?=
 =?utf-8?B?MmRvNlEwekVPRTRDL3Z4eGc3ZDBuVTQ5WCt0bDJCSU15VGhDV1FrZXhxRUVa?=
 =?utf-8?B?REtUczl4OVBkQlk3Z1dKN3F3NmZNZDlGS0JnOGgwSmZuSW4yWVdocW1DSkhy?=
 =?utf-8?B?L2lBRzFhRWJ3cnE1OFBVMFc5c0RqZjdJLzh4MFJhUnRBZ1lzSFZ5aFR4N2NG?=
 =?utf-8?B?dWltOCt4WFZxazVtWWdaOGVOd2R5eWNYOVYweGJicnJua2xad3kwN0lHRDlm?=
 =?utf-8?B?amREK0JrUXNIWldrdVc4NkJKOTZRY2tLN2VoeHNXaXBaaWJaRWVPbFpuN3VH?=
 =?utf-8?B?TG1RcStTQ1d1anRMdjlldmpOT1F4MUJ2QW1oZGxNd3cvWkVSSTRLVksxVER3?=
 =?utf-8?B?QkFKcXpWMm5qcXhLOVBFR3A4UStSRThWQkFqTE9sZC9rcmpPcUI2dURDb0FE?=
 =?utf-8?B?YWF3S213bW9HdEVHRXZFa3NCVUF6NmpWaHNmUWpEYlpYbFIwYUtLVE9mMFVo?=
 =?utf-8?B?RFR5cXZiN3VTNnBtN2tQMCtFZk4xSDNRZEExd1BPTHFKUFhaWnRWT3hDbThY?=
 =?utf-8?B?Nm5kSXlldkJLN1A0aUY5V244Mm1LL1c2TG5YWFdYNnBicXgxeXk0V1BUb2x4?=
 =?utf-8?B?czB3OFdKd0pyY09pOXp0M0piVjgyelRwM3Fyb25vdk53eGJhZVM1QnNtNG1p?=
 =?utf-8?B?VU96cDNMY2s4UVNzRk5zcllzajdnNk02UmU1bk04Wkl5MUdFOUpXM0ZYdm1Z?=
 =?utf-8?B?RlJjZ3VETTMza1RhcCt4ejJ6NGk2ZTRpSnRoNkl2S1F2Zmd5N0RBbVY3dzNE?=
 =?utf-8?B?QXNLWWpkcWpPd3BBZlBLV0JVdU1kUXpqRkx2M1RJVmpFb3F4VjJTSHZvWDl1?=
 =?utf-8?B?SGduREgycHFQTXlyaVhHU1hBaTljbk05cDFnYXhUMzRoOW9meGh1NVNnN3Nk?=
 =?utf-8?B?bWVhOSsvNFNJWDV5NDRhZUZOaUttWXVzbSthVCtkT1BZS2syakVHSmR4UGNh?=
 =?utf-8?B?RkFnTGFhLzFSdFhZcVJSUytMT3hFSG1yR0FHT3VLSnpOczQvZko2RDlGMkJp?=
 =?utf-8?B?U2xwVklFWGdsVjQxTzNYUkUrYzlNdU83cVFmczY0V3NZYUovZFdRcWJ2UkFH?=
 =?utf-8?B?MlJ1aW5CNnFPdVdQVjhzczVtNWM4KzBPUWRpSlp5NFFYR3RGQ0pKc0NpN0h4?=
 =?utf-8?B?TWZVcjRXdVM1Q3lnRmN6UFlSU0c4bnBKbE96dlJVSEF3L3FxM1Nhb3pTM2Uz?=
 =?utf-8?B?QlE4ZDdJMDBKMjFSckYwWHlOM3ZlNVNyUkdNaTNnaDhYNWZlSHhvaU9KS2dN?=
 =?utf-8?B?ZXhzU29oOWlaaGJRY21ES2Q1Mm9uSk9TRW5EcWRGSGwyRWxZQS9jL3JsTEYw?=
 =?utf-8?B?Q2xESnovUEdwR0tQNHllNkE0SnZ2N2lvVkFydkt3L1pCR05ib2J1cm9kNlpy?=
 =?utf-8?B?YVVnRUFJaVk3alV1bVlvQU9ZQmdFQUxFY2l2ZXJmR0RDdzJmRmZOdnYxN0RW?=
 =?utf-8?B?Y3QzcitPNTFFUGppWkE4Tjg1WEtUVXJCUm40SUprY3VGUDdpdi9iU3IvcFFT?=
 =?utf-8?B?SDlPYXhlakJwcjJsYVZBQitrbDVqMFVPNE50QXpaQm53dDYxd1hYek95T3Zu?=
 =?utf-8?B?ak5mdDRBVlZuSU1lQW5sbDdRRkk3ME9iSkpaZkw3cWVYenhIOFNvc3J3am03?=
 =?utf-8?B?bC92TWFrVUxUbFlIajhDZDIzUVM3OXpqcDY0Vzk4bm1SVnFlS2ZaUnlpU3dP?=
 =?utf-8?B?U0ZQT0lDM3JkdmV3clR1WWJseUMwU0tYKyt4ZmF5bzF5djZ6TXJNUXVBSHFY?=
 =?utf-8?B?d2s1MXgwZnFtV3FnSXBkejZoRjdseVpnajVlREpuWExsVmhiOGRZbkxicllj?=
 =?utf-8?B?cXVDWUJxd1U4VWRWanRscU5kZzhSS0plMlF6QWNqOGJxNDVTaHEvT2hxTzRL?=
 =?utf-8?B?SDdNYlJwcjRrR0Y0ZmJBRTRGdFlNMnVsTFlTTGFGNGtrVFB0Tmo1TmJCR0FR?=
 =?utf-8?Q?3A3V+rCuCrWU+iBccAUT/rwM1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54fe45cc-e24d-4608-fb8e-08dd98802fc5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 15:57:28.2559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMJJ0KSRE0WDhKg6Ci9QAwZFFg3WoCmj3Oh4B3TND6oAufZy505wwgo/wgl/lEuJLJ/uUOr2JKZ+h+pddKmveA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7481
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



On 5/21/2025 8:43 AM, Boqun Feng wrote:
> On Wed, May 21, 2025 at 03:44:56PM +0900, Alexandre Courbot wrote:
>> These properties are very useful to have and should be accessible.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/dma.rs | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
>> index 605e01e35715667f93297fd9ec49d8e7032e0910..2a60eefa47dfc1f836c30ee342e26c6ff3e9b13a 100644
>> --- a/rust/kernel/dma.rs
>> +++ b/rust/kernel/dma.rs
>> @@ -129,6 +129,10 @@ pub mod attrs {
>>  //
>>  // Hence, find a way to revoke the device resources of a `CoherentAllocation`, but not the
>>  // entire `CoherentAllocation` including the allocated memory itself.
>> +//
>> +// # Invariants
>> +//
>> +// The size in bytes of the allocation is equal to `size_of::<T> * count()`.
>>  pub struct CoherentAllocation<T: AsBytes + FromBytes> {
>>      dev: ARef<Device>,
>>      dma_handle: bindings::dma_addr_t,
>> @@ -201,6 +205,20 @@ pub fn alloc_coherent(
>>          CoherentAllocation::alloc_attrs(dev, count, gfp_flags, Attrs(0))
>>      }
>>  
>> +    /// Returns the number of elements `T` in this allocation.
>> +    ///
>> +    /// Note that this is not the size of the allocation in bytes, which is provided by
>> +    /// [`Self::size`].
>> +    pub fn count(&self) -> usize {
>> +        self.count
>> +    }
>> +
>> +    /// Returns the size in bytes of this allocation.
>> +    pub fn size(&self) -> usize {
>> +        // As per the invariants of `CoherentAllocation`.
>> +        self.count * core::mem::size_of::<T>()
> 
> I think we need a comment or even an invariant saying this multiply
> cannot overflow.
> 
If there is a coding error (say large count passed to alloc_coherent()), then I
don't think it can guaranteed. Maybe use
self.count.checked_mul(core::mem::size_of::<T>())?

thanks,

 - Joel

