Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B11E4AC755A
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 03:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DC110E1DA;
	Thu, 29 May 2025 01:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qGVnR7Y7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765BB10E6D7;
 Thu, 29 May 2025 01:21:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8BjzHbEqh9A9g1sl7YcsrnFZuAVRmIvvMxxV0V9LZTvFsRH1tWW2+f0jF3AZAPs8srLBgwrP4K/OJ30geXyfcrex+aTJAWyVQvKJjc/zC2Z6+DJBwcneJGnj9kG4Mm07GhpBa+Xiqlpeo0Bi8sdSgwngkZQP/xg4DUeV/DFLeDrpoJ8ukPjnkCs9KIUdSPkh7ePBdLk79rzUKyURCLAQDV6q2U8uysFNPWVF/pDIg7VyZyGxwJDAc+rIZLCpA3lr7+bkb5r3pSUNLD/CwWH0Ik1E/dHWi3T+proGtuqU7UcXxEqJi1vwFybRRrNWxRhQs0WkZ22d8MkPDbdci40Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNnEAYP1G0JJ/1rxclYeZTN7LVGW5xNU70sN9MXZKtk=;
 b=vf9JdViKFPdSHlFFraY4J2jJWb0IesujhvpcQb7UrZi+6/5fSccldr4KZdKFGhJY4/7t4mTEPgnvgv4KgC5qheZaHl8vlsgVWz39NJ/7NoChn7n0/yYVWdPI9G74uxXpCWObjIkcWwEQpoxMssy3k/ffWlHIEZovwCbYsSOab3W7UEImiZ3tdEBduFqVh3WH1qMeEQkaxPF9H7/5bghjo3L9ifhPiAXb7KQqY4Hi+0NexBiiN3CLyShWYGEUmeHnErImCdP69IweLbTLiSDyRCPiOAR0BETCVuRzwqAyHZv/MurSubpFTDyQcoz4cGvKcdGWPrD2+ePZ6fhOY+ZNjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNnEAYP1G0JJ/1rxclYeZTN7LVGW5xNU70sN9MXZKtk=;
 b=qGVnR7Y7eHRK9UwYYeoH6qiYRXMHJhD52ACJFJcfpXG9BgSpcpQD6eSxgrK9FLDn5kI8BL9lEl7I6H/BX0NUh3b5sgjqwmO3LMT11Uz3OLm+sk/dOyHV7yifKzdnSOa5facpYeUAUQLDrmYkRbF9MSMOeXtag282e7vsJVEgS6aSjy6ArPqUPNWsxriewbhWXn+QMwf+aFof58sNZBR5Hh1OFZFOW5ywZzfcBNM3/xvGXUOAoQR5E/U0dacDEFv65hx+4yncvUoktuPj7LQl/S6oURiGLlpCOnyes8/wBF56GaQ2fUXMLl8HCCrQ0WqGtx42Yj9YQ+KprxYYCZBlwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7208.namprd12.prod.outlook.com (2603:10b6:510:224::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 01:20:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 01:20:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 May 2025 10:18:06 +0900
Message-Id: <DA88YHU4AZT7.B8JGZHW9P9L9@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
 <DA82KFLNAOG7.R7YT4BHCLNZQ@kernel.org>
In-Reply-To: <DA82KFLNAOG7.R7YT4BHCLNZQ@kernel.org>
X-ClientProxiedBy: TYAPR01CA0215.jpnprd01.prod.outlook.com
 (2603:1096:404:29::35) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7208:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b2d198-6adc-4d5d-2a1b-08dd9e4f0d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTRiM3pjRkxFbTNrUFk3b1hsa0pxTXdRNFhtYUI3WkV6dWtIRCsyRkJRWkhK?=
 =?utf-8?B?N0lnRlFuSVgybjU5Z3BRWXIzaFpETEt4ZlZFdVlvaTc4YzdaWHp6MHR0cmhD?=
 =?utf-8?B?M3AyQnEydFdGd0tFRVlBUFJkUFAvMXJaQnVzdk1wZzBVZk9sN2NhRGdGdDZt?=
 =?utf-8?B?aUJNZHpyd0N5bkdQUzNCZzRDSjRCcHRmMHRoSUpBeSs0eTFFK3dMVWdhdk80?=
 =?utf-8?B?ZENjWFZPU0pvbVpqV1VkZWhhczZtcW1Da0Nzc0xiRzE3cDNXc3dUWXVyUEVZ?=
 =?utf-8?B?R1ZqbE85TUtnMGQzM2ZTWWY3K1hjc1M1MHN4bGhUSjE5VGNlS0loN1pBK1pR?=
 =?utf-8?B?UEYwWlA3Y2NSWk9adk1tOFFtSDRVVFdiT2l1cFgwOFEwb2c4c2JybnNpeFhN?=
 =?utf-8?B?bVFpbmlWc3Bhd2RwU0Jjcm9FNzlBeVlkTnFRRUhIMFNYL01DZmlpREJ5ZEpz?=
 =?utf-8?B?c0RvK0FmSFJSTGtvWk8zbHdzQ2VlR2k3M2M2SU5iSXZpWGszYUlYSVZnL3c4?=
 =?utf-8?B?R0w4Ymk5Z2swWXZGcUIyUjF5NVZaZnpLMEM2RFBKekM0dE03ZXZ2dGpVWDFN?=
 =?utf-8?B?R3gxR1BVZTkrc0diMElzRC9LNSszU3ZHOFArVTdzbXF1cGhhdDloOGRmVmpP?=
 =?utf-8?B?S3VqUzc3V1pxSEtaY0ZaNEl3eWtENlgzU0Z0VVoxUE0xd0ZlQzQ5WTdITVdt?=
 =?utf-8?B?MGovV3dmYzRsdm5EbVgrMWJyVzZHZUN5WUdNeC9VNWZ5WEhTU0IyODJpeUh4?=
 =?utf-8?B?Uzl5b1g1eVllYWZpTHNCL2dlSFY1elFVa2VFTHdSZmgva3RRdHFjNmltM3F0?=
 =?utf-8?B?d0J3N1VmYkM4MWV2bS8wOWJVdk5MWHk0bDU4RTZ5VzY2RnZjT3ptNkY3aERF?=
 =?utf-8?B?Wkt6ZENwK2krNzUzc3Z2VGhxcUpFOHhYYzBtVHAxWVV3dkZBcTQwRk1nVHVV?=
 =?utf-8?B?MEtNUHZlejJZdEM3SndCaUxzN1lna1FPejJZMGpxbW1pYWNWMFNzL0JDbXQ5?=
 =?utf-8?B?SGZnVE9oMURXY25kVWdSZXlMaTBHRi9vazZJQm9veUNNNHp3MDhKUFpaandV?=
 =?utf-8?B?dHZoYWF6cExWNld5ajdvSjRXQXFmMFJFVWVkeG13amV3NFRjdndKQ3NBb3pK?=
 =?utf-8?B?ZW1McFJwRlJOQ0IrZXRPeWQrSEVaUlpyMTVYaTdTcFdjbVlLbFJkWmVCKzlq?=
 =?utf-8?B?akpjNGFzMlpZWWw3cGlvaThnYzczT1hZcU94VjNOa3VYNUVFNW1uWXRmMW1u?=
 =?utf-8?B?UXc4Vjh3RjNsRC9YOUpVNzVLeGdEMCtIeDVtV3ArWmdSeklDVXJtRVhYRllh?=
 =?utf-8?B?T0d6Y3Zab2pyUEZlWmcxcFRFdGkyWlNabDJhUitwTUhTaFNqc2FpbktwQjh6?=
 =?utf-8?B?NFFGMHVIdlRaL3FjY2ROYUhEWWQ0NjNMejJzRlNUTWdSOEJ3TjQ1bUlUQnR1?=
 =?utf-8?B?dXhkQlZ4aDBZV0kzSlFSUk9sOFRVNWxYQ1preGZuRVdtc1d2WXdiR1U4T1Jw?=
 =?utf-8?B?b1Z1Vi84R08zMkNwR0Vqb3BMN0tLd1JjQ3RnSFJ4MzhkMTc5YTFqaHlka0Z6?=
 =?utf-8?B?SWFhMHZqcEFqM04rblIxbWVCSytDMjgveEcwcysrSi9HTXVXOWYxcXA5VXJn?=
 =?utf-8?B?MW1leXZhYTV3KytSYlJsNlVNaG1hdGF1RitMNkVrdDQzbEt5K1MzTmxZTE5l?=
 =?utf-8?B?MTJaelA3Y0lSTW9jamMyN1cyeU52V0d0K0dDVElEbG52UWFNKzdHVURMT2Er?=
 =?utf-8?B?d3g3Z3lyZHczcU11cHZQeFp5N1lrK3ZpNkJzcUpBWk9JUlpyZGpIQjIyK1F3?=
 =?utf-8?B?VXhmVG5XMkVOR243a01oelJTMU1JY0dVM2d4Mm9lM0ZUV0JNZWFBS2RGem8z?=
 =?utf-8?B?VmdFTUdNbjRFUGxRZWlaeUg3d3NXY0pLYnlhSHdWT1lsRWpWV2MxSzdyT2gx?=
 =?utf-8?B?eUM0NUNKUUZ3akFsTlZVVDMwcmdiUnp6UUJ1L09qenBLZFQ0THdUTWhOVDhC?=
 =?utf-8?B?Sytvd21GRi93PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkFvVHdUdlp5QVNJMGRvWEFuMEdac3IraXdITVEvenRSOTJCUnVkVEJWSUN2?=
 =?utf-8?B?VG1uOWwzWXZlMWI4cVJSamE3aS9aQmJwaytGWmVqQklFRW5HRHdua2l2RGE2?=
 =?utf-8?B?RzRUTFdyay9FLzJmQlBuekFaUWM2Si8xeTg0ZzNZcjk2Y0ZTaHdyaU1MeE9Z?=
 =?utf-8?B?OFRtSWgxRnVOWjNMaGRta2NtRUZnSUVoQlJRdVM4TXBqazhKajNhSWNrc2dJ?=
 =?utf-8?B?TU43dWN0K09rRExhYmt4UnBBa1B5aDJNajJHWkZyYjl4NlkzcHAvRkFXTnJ5?=
 =?utf-8?B?TzBlSkdyeXUzMmZib0JHa0p4UmNxQWt0UnlFRjBjd2hxTmFVY3EwUSs0UkEr?=
 =?utf-8?B?L0VGS2RVNUJMaFZiNXVJcXpQbnYzNHpQcnVBN0w0OFppNUZHQ0FEa01WYk9D?=
 =?utf-8?B?SUxyVk8rYkQvWU9NaGgvWW5tdFlXZElEajFxa2IzZTViSTJXd0Mremt1dDR6?=
 =?utf-8?B?Wk9GbHBzR05FUUxDL3paMS9lREhDd3EyaGxPUmU1KzV1VVp6RHNUUEdxZ3BF?=
 =?utf-8?B?Wk1SMjFuNENVaFhUSytWeGtjOXRsZytZZ2pmaHlKRzd5YkI4SUg0aUNoMzJG?=
 =?utf-8?B?NlZyWG9LRlh0TTdBKzRwUERoU1NpM0ZwaXZYOHl2T2RTL3ZVWWE0RW5OMWpa?=
 =?utf-8?B?WGNPeGFHY2U4OHNQbE55R2pZV2V5N3lhbjBYa0k2dzEwVVBiVWVrTjlFL3lz?=
 =?utf-8?B?Y3B0aFhyU3dLZGFJemZsdXNwTWdjd0s2N1ROU0lSZVFmc2hRZzZRWTkrcUMv?=
 =?utf-8?B?eFhWWjhiRG1nWHRVN2xKZ2lXeVE1eXpVcnVENnZsTzE3QTY1c2xyMk1tTDJx?=
 =?utf-8?B?d1hWNVdqU3diY01maVFNVWRnTGhxaVRuZEV0K3Y1QVk3QVVWeGxhbU1Yd2ht?=
 =?utf-8?B?QjZEMmxCcFUzcks2Zm5qelI1VS9DVzBmd1QvQkk2WFlQUDU4L1AzV3FQWUho?=
 =?utf-8?B?YXpkcGR1YS9qaWVyOU96eFRNRTI1bCtXSUlDY1RPUlk0WEJsUlE0N0hxS01k?=
 =?utf-8?B?SWxFYVVhYlFoY1ptaC9aOUdxOFNnbFlLQ1hTK045K3RiaUhPcVpGc1pDekV6?=
 =?utf-8?B?RGE4RmZRaGZZUUo0WmFJWW9RaXcyMG5jcnF1d3B6RUlnZ3BrRU1vSHZsWk91?=
 =?utf-8?B?L0IycFI0aHh0aUY1MG5VU3M1YkQ2cWJOdnBoSGd1QlMvVldyMGgwYXBCTzc1?=
 =?utf-8?B?UDRpamprd1ZEblVxUHR1alNhZ3JyWVVBcS9LVVlTQ3REaFE0Q1ZYWkhWZHVJ?=
 =?utf-8?B?Mzk3OFhnVHNhSzZBR0hldHRjN09pck9VTzltL0JmL2xJdmh3YzBmTi9ISWto?=
 =?utf-8?B?UXRrbkpDZ0VjV29pK1ZPcFpyMGFFZW51eCsyekhxbU5DckZmL1doWkpaZUlz?=
 =?utf-8?B?QzloVUUrMFV1NkhSeG1TUWpCM1V0djQrMFMwbCt2L09ISjM0c1V1OUpzM2tr?=
 =?utf-8?B?bEF5eEIxcDh0SWptREsvdWY0WUxpM21HcDBDN2NaYW9LZWl2WUdSTjc5dk44?=
 =?utf-8?B?TU84V0RUR2ZDaGwzVlNFZXNmMXpsdXZDMUZ6U1dUQTA4emlNZzI1ckZabSth?=
 =?utf-8?B?cENoejZKeGVuTUpTekhkTmR4WHFGUks4TXN3emp5dm8vTjhFMWd0dmRhUlcr?=
 =?utf-8?B?cFhXai9lZkd4Y0JBdEROQ0dyUy9KTGdhSE12NE9HamFjaHN2bXNYZUp0NlFE?=
 =?utf-8?B?Nk95WnZkSnkrUXhVOTc2QnZkcG45VGl5WVpRYjhmd0RVZmxCRUFoakRuREh0?=
 =?utf-8?B?SUhscVRacUxUa0hUa3NvbzVtbjV1Q3JyUWxKemZ2ZnVvTDArQkp4UFRaaXlI?=
 =?utf-8?B?UzhsR0FXZ3pOL1pTUjc2NnhZK3A5eDZCNXl6ZW5ZdFhYZHhYUHIvVEZPc0Rr?=
 =?utf-8?B?aEtnZncxY3NyeEVqNVRUSWR3VS9xQUFPNmp6UW9xNEVJeWtTWW9yT0NxcVNY?=
 =?utf-8?B?US9HdVZ3TEs0NisxZ2lscllKdGhUdlY0WnZDNmRjM0RVY0VtZnh6RmdWQzh0?=
 =?utf-8?B?elBWUWFqazhVWXppWktLNHpvTGUxWUxvV1EyWkN2cjVtYUxKek1WeTE0ZEs5?=
 =?utf-8?B?ZFYvWlduRE1YVm9LR2dTRTlQdW5pY2wwa09Ub1Q4cy9FWFhhSEh4WXcxQlMv?=
 =?utf-8?Q?trO6unq2zt3+BOFAJR1J4YInu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b2d198-6adc-4d5d-2a1b-08dd9e4f0d41
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 01:20:53.5281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OrTfE14Y68oIBNBAb/gYVxoCEkJW9PO+SxQIZoaS20DeiGnGV1gk5kXupzkMYNPiR9mMW0kv2IqhVuaQkZIfRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7208
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

On Thu May 29, 2025 at 5:17 AM JST, Benno Lossin wrote:
> On Wed May 21, 2025 at 8:44 AM CEST, Alexandre Courbot wrote:
>> Introduce the `num` module, featuring the `NumExt` extension trait
>> that expands unsigned integers with useful operations for the kernel.
>>
>> These are to be used by the nova-core driver, but they are so ubiquitous
>> that other drivers should be able to take advantage of them as well.
>>
>> The currently implemented operations are:
>>
>> - align_down()
>> - align_up()
>> - fls()
>>
>> But this trait is expected to be expanded further.
>>
>> `NumExt` is on unsigned types using a macro. An approach using another
>> trait constrained by the operator traits that we need (`Add`, `Sub`,
>> etc) was also considered, but had to be dropped as we need to use
>> wrapping operations, which are not provided by any trait.
>>
>> Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/lib.rs |  1 +
>>  rust/kernel/num.rs | 82 +++++++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  2 files changed, 83 insertions(+)
>
> Have you proposed `align_down` to upstream rust? Not saying that we
> shouldn't do it here, but if we haven't tried yet, it might be a good
> idea to just get them upstreamed. (if you do, it should probably be
> named `prev_multiple_of`)

I haven't yet - haven't ever contributed anything to upstream Rust, so
I'll have to look that one up first. :) But I agree a `prev_multiple_of`
could be useful.

>
>> +    /// Align `self` up to `alignment`.
>> +    ///
>> +    /// `alignment` must be a power of 2 for accurate results.
>> +    ///
>> +    /// Wraps around to `0` if the requested alignment pushes the resul=
t above the type's limits.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::num::NumExt;
>> +    ///
>> +    /// assert_eq!(0x4fffu32.align_up(0x1000), 0x5000);
>> +    /// assert_eq!(0x4000u32.align_up(0x1000), 0x4000);
>> +    /// assert_eq!(0x0u32.align_up(0x1000), 0x0);
>> +    /// assert_eq!(0xffffu16.align_up(0x100), 0x0);
>> +    /// assert_eq!(0x4fffu32.align_up(0x0), 0x0);
>> +    /// ```
>> +    fn align_up(self, alignment: Self) -> Self;
>
> Isn't this `next_multiple_of` [1] (it also allows non power of 2
> inputs).
>
> [1]: https://doc.rust-lang.org/std/primitive.u32.html#method.next_multipl=
e_of

It is, however the fact that `next_multiple_of` works with non powers of
two also means it needs to perform a modulo operation. That operation
might well be optimized away by the compiler, but ACAICT we have no way
of proving it will always be the case, hence the always-optimal
implementation here.

Also in the kernel we tend to use the `align` nomenclature and I think we
should preserve that for clarity.

>
>> +
>> +    /// Find Last Set Bit: return the 1-based index of the last (i.e. m=
ost significant) set bit in
>> +    /// `self`.
>> +    ///
>> +    /// Equivalent to the C `fls` function.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::num::NumExt;
>> +    ///
>> +    /// assert_eq!(0x0u32.fls(), 0);
>> +    /// assert_eq!(0x1u32.fls(), 1);
>> +    /// assert_eq!(0x10u32.fls(), 5);
>> +    /// assert_eq!(0xffffu32.fls(), 16);
>> +    /// assert_eq!(0x8000_0000u32.fls(), 32);
>> +    /// ```
>> +    fn fls(self) -> u32;
>
> Isn't this just `trailing_zeros` [2]?
>
> [2]: https://doc.rust-lang.org/std/primitive.u32.html#method.trailing_zer=
os

No, `trailing_zeros` counts from the LSB up to the first bit set to 1,
whereas fls does that from the MSB. For instance, `0xffffu32.fls() =3D=3D
16` but `0xffffu32.trailing_zeros() =3D=3D 0`.
