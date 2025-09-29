Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A64BAA73E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 21:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5530289612;
	Mon, 29 Sep 2025 19:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VRQsZ1Kt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012068.outbound.protection.outlook.com
 [40.93.195.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91D089612;
 Mon, 29 Sep 2025 19:27:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFODLN2YjONY8171vxsX21qixtB32fOxHf/BiYyOwmKgDJufy6/x/9plEs0ZFCqss3ExAKdSIZM7aErqQlVC24wLpub0jzZ2ZmFbLEfNYns90B0YYqBj3lBe3ylQ50lUdZy24XkU291uyi2c8+rvBTMXgcZkEzIxphp8PGBcTaAykYtX0mo8XoSYwpoHv9u6XMzsapj80zja+q+YNlpiXy09kuOkRbcLirq6otc6xxaLln11DXbR4AeHlmYdyVCg38Q24AdqCf5tc3lRx6ijN+eZEWDvTgOuRnEuJkz50SVRkeqkP89RR9e9FY7eCnbFTcKD/lWGyS+dJa6lwNrXMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bi0s6bp1SO+REMz2m0e55sLpXoVghqSK4dR2cHA58/s=;
 b=p1BemMVbnBMjmxOHwSdisIAstJoQs8Lc/ZEJf9iXi3zdP/RlCdPYFTDisi230nwAewE5Z7Xbqr8XA75spJuSNDW/trsZd2LCBviIitAFe5z8llWTvLmUZ8Ko0j6JFDG4VN12+xdGmvg46W9+Ecbc73raAMzzEP2l1jZGpEBMBhI6Dwy5dTT6TMCD79whdmLV4+ZdbD7szODv3V6VTdoXLKgXFlVrSMb4FCLtQEauQlIe3mAgdcr1ZIo4rK6/oCuTbKdUNO7cYF1a1dEJA5C0mpMXtr/Bxf163937gkckrHI52Z685ssUgGafpaD2YIdLzo2GQ/D4ENEiym5z2NrDkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bi0s6bp1SO+REMz2m0e55sLpXoVghqSK4dR2cHA58/s=;
 b=VRQsZ1KtvgaW7d4ZfJOpCx3utwdBKMU3syO2gYwcmnej5JrNPgRiZrGBzzILGLTkPHJ/nxgpuy8HW6qDP1dD1xp1LvHh7FYP+fKc0sZNmqaCSkdCgN7S6pEcD03LiBUyrwAdjxBRYVaZ5Otzbbs3wJArGD4n44Kx4jKge3CHjZvQSPCFbRHHk5OxrDszhcbTKN1GU7YQ/R6ssYTEstY9gjzVE6CLWpDqOUl4xl26uuDcBMwQa8JVO/XWERoz2To1WREWaZgGAAtdjgp4kXfmev6aG6+oqrPay6leGcmh/6tutKDRF8m5ISWk1jhv24ZQmh27cT9vUMXF4GvW+6IXfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB7607.namprd12.prod.outlook.com (2603:10b6:8:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 19:27:00 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 19:27:00 +0000
Message-ID: <76f87707-17d8-4cb0-8c81-e67ebf62984a@nvidia.com>
Date: Mon, 29 Sep 2025 15:26:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <2025092157-pauper-snap-aad1@gregkh> <DCYHCLM67KRZ.366VS9PDKLYKY@kernel.org>
 <2025092125-urban-muppet-1c2f@gregkh> <20250923222434.GA2479829@joelbox2>
 <2025092425-sinuous-playoff-3618@gregkh>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <2025092425-sinuous-playoff-3618@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0367.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::12) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: 758b5d82-46b0-4a57-fab0-08ddff8e2970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2pZNHNpSGJSNTlyWWR3cFVlL1hmaHlhNnB2R2pMZEY3ang3emhINmVJZWtO?=
 =?utf-8?B?Z3hFSVlQUm5xV1pTL1lDYXdQWHFZSkxBRkhPZ1B0L3JUL3k5dXBUS3p1bG1V?=
 =?utf-8?B?bnNTeGtmQ0VFY1kxbTg1MHkzN29TcTRUYlNIeGV2aVhlaW1GTXp1cExEblFN?=
 =?utf-8?B?N2tuT1ZDUVcyR2cyVnFSZXNsQU1TL21QYVhtY2p5TjU1T1V1SHJjNE9aOVRw?=
 =?utf-8?B?eXg5eml1MmpzdVZoemhkaVJNVHk0Yy9NSGFXdjZVdWtRU3g1V1o5b3l6Zllr?=
 =?utf-8?B?MjVldWUxQ0w5cHZDUXU3MkVNNXlFUGluQ3RiSFlzT3hNdGlzZkFuQnowQnlO?=
 =?utf-8?B?WHhqdEtFNEs5cmtWMUxYMUNteHd3RjZTZmpqODhMYUNsWXNjRVNwNEw1TVl1?=
 =?utf-8?B?bmpvZ21qT1NDSUIvTThNazdIem9pV0dib2VxOHpRQ3hNYTZBTGJJelFxRVha?=
 =?utf-8?B?dFlzK2JNMy90czBCUnBYbFpSUGVFMW9wRGJzYmEzQ01ENWZ6VDNta3l4RGZx?=
 =?utf-8?B?YjNacHhaR1htN2tHd21XYXlMLzRIbVpnMFRCc2tIQ09VQjBGSGltS0NXbnlx?=
 =?utf-8?B?NW56b0JQZGtiQVhsZkJ6UjIrL0Q0TjZ3aUpZanBrT0ZyVmxwc0tkeWg2UEU0?=
 =?utf-8?B?RDU5cDZ5bkhVc0dTVExUSzhHMnRmK283UWZ4TmdnVndmZklYV1YzZjJUNTZP?=
 =?utf-8?B?bld4YmsrWGE2L0dpbkZVd2xVUFlkYUFoOU1kZFpLbjZzZHZSUnJESE1hYXZJ?=
 =?utf-8?B?U2Evdm8rb2pJSkVObTd5bGV4OXVRa2FxMk8vdjJDZUpmSmNXVVY0T2didWQv?=
 =?utf-8?B?RWYyeHh1cGV0TVluZnAzbkoyQ3R1N1dpdmVOQTFEb2FvNDdPMGtxK1JaTXRV?=
 =?utf-8?B?amh4N3J2aGV0eVlUcFFKcUVaN241VFllUGZydFVVK24xY1hrOUI0TnYyd2JL?=
 =?utf-8?B?YTZKOGRvNUt0QnBheUszRStCN2JDKyswQ0NhdVJNOTMyZk1tQmlJZDIwTnh1?=
 =?utf-8?B?b1pQblhBcnlFd3U3L01hc2pqRXFNaUZLZWJhZlpuOU1SY0F4SHE4ck9QdGVM?=
 =?utf-8?B?dU9DUGRLK3h2dlFVVVcxS2JwckJJQmFlbkFUamsxaHhnRDhVV0Z6MWthWjFj?=
 =?utf-8?B?aG1tbmlKREMxcC9yaEsrZzU3NTNPdm9OTFdOblY3YWZkSmdNM0ZGZmxCcDQw?=
 =?utf-8?B?dDNDRTZkaUt0eS91MnhyVlVhWmgrTmluN2p5S0pwemx6d3V3V3J1VlhOblJs?=
 =?utf-8?B?SlplN0NlRTBXZTlJK3dyYWJ0NndQOHk5Zjl5cFZYNXVtKzJpZ1lZZDdsbzdW?=
 =?utf-8?B?S1g5MTFCV1FQWnZWU24xWmxFR0tlUG1uVEZRZFEvTEJjZ0JpUVdoNEFpaWlx?=
 =?utf-8?B?azJEZWNpY016b2lTTlVCL1ZvMnRPd3ZCSVZnRmZxbWQyZnovMzdhY09GMzdZ?=
 =?utf-8?B?UkVLSWo0YTIxcUJmR2JUeTNOaWVkYmpIZnllT2hpOWw5SytOVkdLN2hReEZz?=
 =?utf-8?B?bllpWDROSEVzZjBORjRwRUlDTWE5aW80NUxBbVFwdWg4cm5aVUcvR1lQVmdW?=
 =?utf-8?B?K095WjR2TlZPK3hGK21IdVJBeFFBVjBVakRLcXVTV01Xc3JCWmt3L3NJYXZK?=
 =?utf-8?B?TlRzU0pZRXltNTR2WFZFbkVhM1dSaHZjcGhvODNJQVc0dGJlOFBzd1VyLzUx?=
 =?utf-8?B?bVF2aVphUnUvZ3Q0ejRjblgydGsrd0JiRFlmZkw3R2lXbkJZZTRCWkFyUXMr?=
 =?utf-8?B?Sk05elZPcHBta1JqY3o3QkZ5VTQzVGJDc2ZGYUxQZ3J4WDVvbTZEVG9xUml6?=
 =?utf-8?B?eVlCWVlUTjBhdXdkOW1iZkYxYjR1WWQyeEF2dkNTRkFEeUZnRnN2cFh6RmpH?=
 =?utf-8?B?SXlYS201aDVkR2NmQVVyTER1bFpzaHpRRHdZeVNXQnhlMU93cnRBYmxrZmRQ?=
 =?utf-8?Q?xLBR+r/DEJ0DufdLk3bTUrufQjFAIqlx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXFoTGxPVHI5eHJtazVRTWRoOFVHRlg0Y2JBeTBOV1RzODJoNWttU05UZUFN?=
 =?utf-8?B?OFpNa1RKRFp6RDdDSjFMcjRoWHU0eFZCd0JUVFNTbGd6eUkwOUd4bDdRM25C?=
 =?utf-8?B?TWNBNU0wVFkvNjN0NzNvdVkvRkw2cHBpZVBGZDBjbWxHOTNkYjZJZjYyZ01a?=
 =?utf-8?B?NFMxZXk0Wkc3c1Jockp2ZGxHZ1JCVnMrbmpKa3lnb3NablE0RzlGUmZIdzVJ?=
 =?utf-8?B?SGIyaTNnQ2E4K2FSSXY0eXRkbDg0NnVoWTVQOHZjS1JpWTdQNFFtZklONC9n?=
 =?utf-8?B?SGRjTHJQWEllMDBRSU11TU5FdHptQnZUSGtKYXBwckM1UjFORUNVT1A5cldq?=
 =?utf-8?B?ZFJWR1lLazNNeVROUGRGUlJIN3RTcDNNMlJGT1ZUSVBrR0x2QnFodHM4ekZa?=
 =?utf-8?B?NFZYT0lnT0NWN214Vm5Zei9ZV1ZsSStjYkhFbm90OUNxQnpWWElEY2R0cG53?=
 =?utf-8?B?RWhrWjJtWm0vOTcvaytJaFpxN3dwUnA5aWdKOTNjbkV6b3IxQUI2RkxmcUNF?=
 =?utf-8?B?b2dFYU9TMGE0MU5tcmI0MmJnSnJCZit4MHdVeVRJTThQZS92YVRBbFpRNVo1?=
 =?utf-8?B?aUlHZ1NOMXRxSUM1REZPMGFsWEZaZWVGVG1YUFlQLytCZFdWMVQvVnhSaWx6?=
 =?utf-8?B?cEs1Vk1qYThBNm9FNWkvdVJRUXZIOUVLdmp5UHBBQ29zQmxDSDJ4ZlJuelI1?=
 =?utf-8?B?OWRwbVFhdklIRFJlQno1MHhsZHgzbktWRkxFS3lic3dmTXR5Mk9UK3U3UndE?=
 =?utf-8?B?eVdYVWF5RVVHYm9iZ1hudzgwcThYbDJKTXZET2ZUV08xYUpNN3piNFVNSW5j?=
 =?utf-8?B?SnppMzNqSERMcDE1Y3RZT2xZSmlvMXZQay9tdjNySHgvTVQxYTErbG5IaFRx?=
 =?utf-8?B?OXN2M2lxRDkyQTZIOFdoNGN0VWFiRzdzZVlxU0FRakJHTmJrdGRvOUIwSmN6?=
 =?utf-8?B?RXRxaFZtYUtFazQxMk1iWVd1c2djbVFXb0lkc1Rxc2k1WVh6blY4UnF1TlZS?=
 =?utf-8?B?NUFqWjNlWE80NG8zcGlGeWNCNXRkOEVuREJHTXgrNlpGNmNxRGdTWDlBQUdD?=
 =?utf-8?B?ODJSTXVCQzQydXEvQUhLeG5EaWttNkwrVTdPT1dQQUdPVkJvelE4bkI3SW1R?=
 =?utf-8?B?dDJEZHJEMDd1SGtHSTZLQTEyTnBYWlp0dlZxejd3SE1xZ3JneGJ1UzlwWWhz?=
 =?utf-8?B?VnhYSlNLYkN5emxiRHcwK0FHZndHMVdtZ0lmV0RGQW1uOWJOaHFNOXI4SXA0?=
 =?utf-8?B?bDZaUHhVV3V2bGVrTjFkV3pNR0gwSVRVdFpieElZTEU2MU1HMGVyd2pFRFNE?=
 =?utf-8?B?NkY4UE1zM0RnZzRrNlF6MG1tL3JTdlE1UkdjdDhVRy9qOUtPTnB0V0xFa0NM?=
 =?utf-8?B?UjY5ckFGYWdRdUdjYTdqWUZycnpzZjlEaVgvVlBNaldacUthdDMxSEVzeVg0?=
 =?utf-8?B?UGU3c1FVTUdDeGgrUEVjMUhrRWsxWm4rYUNTQkJhN2NjTEY1Sy9XemFFSWQ0?=
 =?utf-8?B?aE9EQzl6ZkEzWUk2V3JvZFpDSlhteTZCQXM0NlJHRkhqeWtLa05mVkM3T2pr?=
 =?utf-8?B?b083bjlEcklKdnVoRWNTMkhzc0xudHh4Z0tmZTIydDJGYUlVK01NRUI5bE4y?=
 =?utf-8?B?TkJUdmFGelF4c1Z5WUptTW5vNFVVMDRmSEFLcys4RXJSY2ZjdE5zYmJjT1k3?=
 =?utf-8?B?S3Y0ZlJWSUt2SUJBaEFnMllXT2Q4UCtpK1RQQnVHamgzaHpTMU5nUkxpY05v?=
 =?utf-8?B?SnNvZjNoRlZmbFlieGVzNEhOVndNU0hFalo0elRNYWJRbEYzNkZDWGZyUjFB?=
 =?utf-8?B?ekU4ZzMzR3J6c3JxeWdWNVk5S1hEdmJKR3U0QUpSOEFTTUJLSWhacTRYdmlH?=
 =?utf-8?B?Y2YzTE5rSzM3bEN4VWU1SlpjNlc1ZEZBTVpRYjQ2NllOdTNwQ1BDVFp0dzdC?=
 =?utf-8?B?a3piY2YyQm9Sd2JTYkFheVpKV3FnYlNsSFM1WWpwYWNMK0pzWWNld2h1WXl4?=
 =?utf-8?B?STZlQmx1U3BMNHJDa0RaUklXUW84Mzh5RjlSQXAvWVBwRGJ1U1Q5UVVZMExx?=
 =?utf-8?B?UTBPelZEL0dqQ0I4alRaMitHYVJNSVpISXlKZnlMUVVEWkdZb1RIeE1rNWNY?=
 =?utf-8?Q?qeXVmhSJQF/3spP3JBdSJQPn7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 758b5d82-46b0-4a57-fab0-08ddff8e2970
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 19:27:00.4277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFg8StzqKdE+BrADC/YoCSQOnxRGs6iMwphrgsHkTVClDCGbxO17CTJEC/PhVCo+ZcS2TRcev0aryC4nbOJEeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7607
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

On 9/24/2025 12:40 PM, Greg KH wrote:
> On Tue, Sep 23, 2025 at 06:24:34PM -0400, Joel Fernandes wrote:
[..]
> 
>> For the separate issue of enforcing endianness with respect to (across)
>> multiple fields, I agree with you that if the user's backend (the consumer of
>> the data) is not doing such conversion, say via regmap, then that becomes a
>> problem. But that problem is orthogonal/different and cannot be solved here.  
> 
> But that is exactly what these macros are being defined here for, so to
> ignore that is going to cause problems :)
> 

If needed, happy to add endianness support as needed by providing additional
options to the macro. Based on this thread, it sounds like we want see if that
is really needed here or can be solved elsewhere (?). The mental model I kind of
have is this macro should only be dealing with CPU native endianness, much like
bitfields in C deal with CPU endianness. Hmm.

Thanks.
