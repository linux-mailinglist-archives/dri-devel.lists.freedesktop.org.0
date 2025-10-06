Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73582BBDB4E
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 12:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41FE10E3EB;
	Mon,  6 Oct 2025 10:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hnO/NzcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013000.outbound.protection.outlook.com
 [40.107.201.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6897610E3E6;
 Mon,  6 Oct 2025 10:37:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNKjF/uHXzuPLBMCplg8Isu9tJSelNzSb4EY5+/HM/t2tBmqxX947mI2fziKt5SUKZ51Re5ZTcx1lxli+TvNw9GzUfujBh05lRTccmE7uEcjzJiZdmTxsAR9+JaegpXUR8fiz0moADtGYplXYKIFNLRLDv/n2sr13dD3QNJUKi/6a+RgDw0HaGbsQW7PyppT0s0lF248AZxdFi5dnEXiUmn1WjcqGET6sr52N1yCmCcTmDWlqXP7PhNNMIfwz/ikvqOwJDNN0zfJmoW0FeRhy1ebYcXodutcEPbwY1cdtNpsQr2tKRjM/Wv1zj8huST7SKyeS3sUQJWsBgcaebqTSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROzdjtrRp6v+qJkb7Jx0yVKzk6uKSgfNBknpm46Qic0=;
 b=Lbm6H0wogwqqUjYMyR5Zr/0bQeHjkmIj98jalrP8umNHldZvYWE49ZltvMwSquv51GHihAMz3/5eAM7c4AjJkwzuMHMU3bHpKSn8HXRIaTTKNWupaFRPtqWJiVIQ92QkGmSLd/TpHjn3mcOzXoORLuTo91wSWWsB3XKkfphUXcLWgd+ZT89Wb0q80Gah3v/Y6gnt9DQjK022qeMnWlvUJiwquwYfxPyX4tjhcGq+iwAPl/W/ni3DERjfRwgZWy2yckJjwY2FwNKkeRS88FMbWqnrsY7Qce2GjENpwSfyIFNP0zeLGCyktnHFOrdpYG0ozTetnS/7MWm7TNcC6e47Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROzdjtrRp6v+qJkb7Jx0yVKzk6uKSgfNBknpm46Qic0=;
 b=hnO/NzcJ4gv6uT4EGgah5Mp+wpTAJDX6M5TzNz9dPvVtJ/J0Zww8KyTPffUCcH56vz5vOr8U2Dag3qfOX4lIJR9PEEmH/0NiJ/0IjkJ9TG1P5qL+uwrnJmSKD01Pf2hJsubs7SVkp+eVRFGTEfeBhw/tcsFtyAU6wFGqlos9eUNnMeIygN8ZizXCoAxbBWPzg5jrB2/G6jOYc8NZ9eXEmEfmuxrmAXJNDsSwBzg37diSbMzj0+kiU/WcbeQmu4sLzxIHwuag2A1Mpbr8VMkKreavmIYQ6dN8x1NmIYlY5ZnFDz11GOLRwIsMev5nZqEYkmztf5nEItjujumkbJE21Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 10:37:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 10:37:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Oct 2025 19:37:34 +0900
Message-Id: <DDB69ONCWBEJ.1KGWC6H2VG2CE@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
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
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Andrea Righi" <arighi@nvidia.com>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v6 5/5] rust: bitfield: Add KUNIT tests for bitfield
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <20251003154748.1687160-6-joelagnelf@nvidia.com>
In-Reply-To: <20251003154748.1687160-6-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0200.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b07536-62d0-49c4-6b37-08de04c45e4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0V6RnRQaGFWUDhXZU5QU29zQjQrbGNKN2g0ZnNoVndKVzlFeFhpVkovSDBz?=
 =?utf-8?B?V0FrYWlzcG5FenBjQmZRaTJ3VWU4VGEzRENJMHdGNm1id3ZDMmxuTHNCN1F3?=
 =?utf-8?B?RGtWVTk0bnJsUlE1bVlDekpTUDhWWmdSRTRvbXpJSDEwK0JhU0tCdTA5RVFE?=
 =?utf-8?B?cUc2UWNjMGxQTFVEV2h2QzhpNFQrTDlzMUlaVjdFR1Mva1VVRTNCc2Y0RFV1?=
 =?utf-8?B?OE5wY0dWa09FUlZRYlJrZDY2djJ0dXRXVDd1b0ZiZnNiOWFSdjZ3Y0c4QXR2?=
 =?utf-8?B?SEhwZzNEUGRNK2VheEtyOFpncmtSUzhGZmlicHJtKzRFdVFYME81aGFvRmxZ?=
 =?utf-8?B?UXlDMm81TGxtMVZlNDNUczVDMWhTRW5vUXFTOG95UFRkODdFT21pQ0tOZ29i?=
 =?utf-8?B?b2hVMy9QVkRyVW55VEltbFRuNUhkV3FrSDNNVWprdW56ajVhRXV4bVNkS3Rl?=
 =?utf-8?B?MElGN0ZhRHRBNEprUEpWR1ZqNzZaejVob0FlRzE2YlBGY2ROR2tlcnozQ1JI?=
 =?utf-8?B?eUxsMGZLU2gzVW9DengzdEpoL1dOYVRXaHhZQlFDTERvdlNEcnVpNTA5QjVO?=
 =?utf-8?B?K2xucHE3dm1ScXVNb3dtYTF5eFV3VWw5dTJUL1FraHdhUnRqVjhjZlgwUXh2?=
 =?utf-8?B?VWR2TnpoUUkxZ0RBQzNoZGtoU2lKRWhTUXFQRGZEaE1kUUpQS3plZXFsYjY0?=
 =?utf-8?B?Z2Q0aWtjK1BFZkRHdUZOLzFpWUljcjRjTDcvam1rbjJOUDV2UDhyNllwRHN0?=
 =?utf-8?B?TGVvN3B6d1M4L1FxQmFRMGo5OURwZTlkMk1FQTQ0RGZuRjBxQjNiaVRuVmUw?=
 =?utf-8?B?Y216RnBuSXo0Nnc5aXhGY0VBSjExU2ZocklJM01FcEVGQmZtM1FiOGZXUFFR?=
 =?utf-8?B?TjhTdy81TGtLUkRFOEZFbG9nd0s1S0k5VE1MZXVuQjg1RlZXTVl6dWhrMkVW?=
 =?utf-8?B?dGJNVEkzc1BTMitBT0FZRGpQYU5hb2ZGSXV2ZEoyUm1zV2xINDlwY2lTcEtM?=
 =?utf-8?B?cm9VL05ITCtSN29VMHp2d1BnNEpXdmpxMUFmYW9zajdhSmRWUEtQZWE2czkr?=
 =?utf-8?B?d3hDdVZzUXZvOHR2dFMwS0krMXQ2OVcxUGNlWmd1bGh0WENJbDdjd0lkVS9l?=
 =?utf-8?B?MzdBeVRFZzVLbFRxdHhXeGJWai9zdHcxOXZYVlBBbHJEUjJaMURRWlU5UTJ4?=
 =?utf-8?B?OTcvc3hodzNMd2RXdlNsWnJ5U3VBbUNmTjJsZG0vTlV6MHZFYlN1ck80Yitv?=
 =?utf-8?B?Z1U5VG5XQWt3RGw3Z3NUV01ycG1vd3JMYWVDMTliRUZabUhwbnpOK0lIOVd6?=
 =?utf-8?B?TEV4ak9EUHVJVUZONndKRjVySlc1ZXRaa2JndmpERkRHRU14V25UWnJwbUV3?=
 =?utf-8?B?M25JVmRxL25yUkduV0JyZDhzRSs3RVVMQXBWdzU1eE9XSmRQR2pKK1hqR3k2?=
 =?utf-8?B?RFp4TEk0MU9YNVRZdWJ2VUxOUjd5amU1Q2EwWElnenRuUkprak9qWVVuUzU3?=
 =?utf-8?B?dXROanJ2RjhsRDNQcGwxc3ZZNTdNcGNQZkdxK2xmbFhNTW93dkszTStOUDJZ?=
 =?utf-8?B?eWFZZi8yZFNiMjg4UUYzWC9VT0JUd1NYc1lNRjV3SW5HMkVtaXllbFArdUdj?=
 =?utf-8?B?MGdPMVllQUU0QzdXNFNWSVZoZ2tBelRsejNDdTUzd3I3RjNJSjcvMldVM29K?=
 =?utf-8?B?Q2d4bERMK0o2Z0xYcE5rbGNxdmdNRGxzYlhoeXBMWVllRS84VEJiSHZjb3lj?=
 =?utf-8?B?L1Z2NXdraGVRT01TNlNLM00xbUxpMHNrOHc5U0lHMitVWWsxeU9uQlZyenM5?=
 =?utf-8?B?MDJXNUlGMGkxNEhReGRBVUozSG5PT2RMTDlwUy9CMEZTVExSSjQxVGhLOUpJ?=
 =?utf-8?B?cEtmVGhkNDl1YktCWVRQWkhLK1NpVHZiUUVQcW0wOExxQVNDd2VkelpZTVJU?=
 =?utf-8?Q?9zTkp0LLQtMBqcZp+ewghUG8QfbfkSFH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THJtcS8xV21EVytocExid2xzcFVweTF0NGtxZjdtcDFrYjJHM3dXZjU0OVZI?=
 =?utf-8?B?RDBaTnIyN3NaRkVyVGdEZXVlMDF1WEltUHVPZXE4R1R5N2llOHNuNmsxRzNY?=
 =?utf-8?B?NCtUTmh0SUlLVWtIOXU5aUREMHJoQnh5SFZDZXNmSVBYTXg4Qzh0M1hZd0hu?=
 =?utf-8?B?L3pSS253TzlDQncrWTRCOVhZeldSc1B6Zm9kR01vT1Y1aVFOZjAxbkRNTzYw?=
 =?utf-8?B?cEF6Ykl1cGh2MFhmWC9XLzFaTGFNcXlla3BLeG1GRFkySFh6ZHRJOFp4SFJz?=
 =?utf-8?B?WkJqbU1LRjYyOU4rZllCbU5tQ0ppSmNkRmVBY0pvR2pmZzdMN0xmRE5ROCtF?=
 =?utf-8?B?UGhQMXBINWZJK0didVkzTG9ST2tuNWRzeGt3b3gvOHRLOTBCTzd4TnR2YW0z?=
 =?utf-8?B?T1NrQk5DZWFRNnpGaGk2QW9mWFFWRkRZTzJGSlIveTJFWVFQQUZPUkwyVC9w?=
 =?utf-8?B?UE5naE0zcDFQQUdqS0RnTFkyOFR6a204ZlFabEQxVjV0RFUyd3VFTnhDeHlZ?=
 =?utf-8?B?V3VrSDF1RjUwQ0N4S3VlTHk4SGpjU3djMy9oZzZXQkJ0TFMwWmFZVnZkMHRM?=
 =?utf-8?B?aWhUSUZyYVYzdURodWtlZ3RDMEVHNzFFKzE3KzA5KzR6Tm5Bc1RLN0dwc0lu?=
 =?utf-8?B?amsyOFB0ZjJ6RGhQczg0bTdLdTNxdzB6RWdSMEpVVktZNE41RVJpR3pSaGhV?=
 =?utf-8?B?a0JGVDM1RTNGY0RXaVF3dk5UTlpabUVCZ0pjSFpzRFJwRmVwRVBHOGZhcGZi?=
 =?utf-8?B?TWZOYUptbW5BcEhKSXlTMUtmQmRYN1NLZGVtd1djck5tWjN0bUIybjRhVHdk?=
 =?utf-8?B?K1JTVnhkRjhQN1R0dEJRa2NSQ1dUU2E2Q3U0NjhZM2tpUmYxbVRKTEcrLzZL?=
 =?utf-8?B?R09NNFkzWjRwYitWa0g4WUI3N2JXNHgxTkptOGRBUFh1WEc2RzZ6S2NsZndW?=
 =?utf-8?B?Q3pOT1lhQVdxN2QzVEpuSkFRRzB1UTF6ME9iaktkWjdycHlwelFNdFRDcXJ0?=
 =?utf-8?B?dVIrdEIyamdqY3lybjhRY0ttVWtOSXYvZkcrR1ltMVdIVHB2c3BReTFZMmhP?=
 =?utf-8?B?WVJ0Y3hHRnBBdXZQalFNY2pvR0FraE9UekRDYmR0d0RtK29oZ1ZBN1ZTU1Vv?=
 =?utf-8?B?dkRXMDE3endxRDZNa0toT3RRUFF3UFFlSzV4alhPUkc3Y2k4bEhuRmZNZ1dY?=
 =?utf-8?B?Mk1CYXdXQVltTmNsUHVtbnY2NElLRXVEZnp3TE8rUXRTZ3VGcmNPdlZ1b0dz?=
 =?utf-8?B?RUk4ZitBR3laTE5lSE5EUGJKMWZONnQyaW5XaHRRM1lJWkhqTENhcnpJbEJw?=
 =?utf-8?B?UUp4c1p1d0dScjdmV3JVWm5oeEhMQ1hEdDdsVjFlM0M2Ynl4cFQzVzUxb3px?=
 =?utf-8?B?dmMrVVpYeXhIaDh5ZUFpckYzQytsaTB0bm5CcmFteTNVZFJURHJ1MFJlYVhO?=
 =?utf-8?B?MTJKa25WaFphb0JvUCtlenVNZWlsVGx3UU1yZExaZDBkS001SStlUUwyRTJ1?=
 =?utf-8?B?eE4vTWx0b3pBM1VWS0Mvd3NLd3RFeFlxUEZuSTZkV09oNWU5TUpNOUI0L3lD?=
 =?utf-8?B?MnVra0RSVmJvWW1UTUU3MUJydlZYNnFxU3R5Nmx2dWRIdzV0ekRpYnhLZ1Mx?=
 =?utf-8?B?ZXFPaU1PTURaVS9NTjI4dU1FNVRXelFwUmUxNVpxbHl3N25iQk5kMWRIdTZj?=
 =?utf-8?B?NjdXQldOaEF6cHRrbHRqMXB6MVM0OEdsUGg2cUhvOGVJeDlscHd3S3dyUndh?=
 =?utf-8?B?V1UvMFg2YjVnQU5nUnhzdXMvdXRPL09Ub0ZMRUVZMVhXbWdlUGUvK0M2THVo?=
 =?utf-8?B?OWIrNXV0Z3JrWnVaRUgzcE4wajRCb0NRR3FZWkJ3Z05IQWpRVkhkRkN1Z0hG?=
 =?utf-8?B?cGNDNFFqZVl5d1Y1eGVZcmFuMGxjUllFVi8wdFdoNUFBaCtpVUlqR1VhL3lC?=
 =?utf-8?B?OURXcklUM2RQSHZ4NVB6L2FBU0M5ZnJhMmNKT3QzOUxHTmhXazRqMDZVSTQz?=
 =?utf-8?B?VmN1N1NsZHN4eXdDUGdJTUFHZjVoOEpZNGVWbTFkamdwK1hISFcvRHlDZHhT?=
 =?utf-8?B?UjNCMTdrYThIdjJBOWpOUHFCb3phVXlTMTA0dm5zTXM2OUtmT0MrQy8zZFRq?=
 =?utf-8?B?V2cxbDdTNDNqMzJUMTV3M3hsYzIydGJEV3lGaWMrQWMvdHVLZkJHR1EycU1H?=
 =?utf-8?Q?GXSrBwW3xlmKB9jVARcBZvwHZ6WnJ7UqJ0ceJqeaLIVP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b07536-62d0-49c4-6b37-08de04c45e4a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 10:37:37.7328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+XFxAHNETYx/dbXukzDwUXMIwaqb0OCsOC3IunoSaOFnkoBaYSsdzQeX+Ngtpqp/tVJMkLRnrtJnfSjwiPr0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6526
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

On Sat Oct 4, 2025 at 12:47 AM JST, Joel Fernandes wrote:
> Add KUNIT tests to make sure the macro is working correctly.
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  rust/kernel/bitfield.rs | 323 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 323 insertions(+)
>
> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
> index 09cd5741598c..f0e341a1a979 100644
> --- a/rust/kernel/bitfield.rs
> +++ b/rust/kernel/bitfield.rs
> @@ -329,3 +329,326 @@ fn default() -> Self {
>          }
>      };
>  }
> +
> +#[::kernel::macros::kunit_tests(kernel_bitfield)]
> +mod tests {
> +    use core::convert::TryFrom;
> +
> +    // Enum types for testing =3D> and ?=3D> conversions
> +    #[derive(Debug, Default, Clone, Copy, PartialEq)]
> +    enum MemoryType {
> +        #[default]
> +        Unmapped =3D 0,
> +        Normal =3D 1,
> +        Device =3D 2,
> +        Reserved =3D 3,
> +    }
> +
> +    impl TryFrom<u8> for MemoryType {
> +        type Error =3D u8;
> +        fn try_from(value: u8) -> Result<Self, Self::Error> {
> +            match value {
> +                0 =3D> Ok(MemoryType::Unmapped),
> +                1 =3D> Ok(MemoryType::Normal),
> +                2 =3D> Ok(MemoryType::Device),
> +                3 =3D> Ok(MemoryType::Reserved),
> +                _ =3D> Err(value),
> +            }
> +        }
> +    }
> +
> +    impl From<MemoryType> for u64 {
> +        fn from(mt: MemoryType) -> u64 {
> +            mt as u64
> +        }
> +    }
> +
> +    #[derive(Debug, Default, Clone, Copy, PartialEq)]
> +    enum Priority {
> +        #[default]
> +        Low =3D 0,
> +        Medium =3D 1,
> +        High =3D 2,
> +        Critical =3D 3,
> +    }
> +
> +    impl From<u8> for Priority {
> +        fn from(value: u8) -> Self {
> +            match value & 0x3 {
> +                0 =3D> Priority::Low,
> +                1 =3D> Priority::Medium,
> +                2 =3D> Priority::High,
> +                _ =3D> Priority::Critical,
> +            }
> +        }
> +    }
> +
> +    impl From<Priority> for u16 {
> +        fn from(p: Priority) -> u16 {
> +            p as u16
> +        }
> +    }
> +
> +    bitfield! {
> +        struct TestPageTableEntry(u64) {
> +            0:0       present     as bool;
> +            1:1       writable    as bool;
> +            11:9      available   as u8;
> +            13:12     mem_type    as u8 ?=3D> MemoryType;
> +            17:14     extended_type as u8 ?=3D> MemoryType;  // For test=
ing failures
> +            51:12     pfn         as u64;

Is the overlap with `mem_type` and `extended_type` on purpose? It looks
strange to me that the PFN also includes the memory type.

> +            51:12     pfn_overlap as u64;

If `pfn` needs to be adjusted then I guess this one also needs to be.

> +            61:52     available2  as u16;
> +        }
> +    }
> +
> +    bitfield! {
> +        struct TestControlRegister(u16) {
> +            0:0       enable      as bool;
> +            3:1       mode        as u8;
> +            5:4       priority    as u8 =3D> Priority;
> +            7:4       priority_nibble as u8;
> +            15:8      channel     as u8;
> +        }
> +    }
> +
> +    bitfield! {
> +        struct TestStatusRegister(u8) {
> +            0:0       ready       as bool;
> +            1:1       error       as bool;
> +            3:2       state       as u8;
> +            7:4       reserved    as u8;
> +            7:0       full_byte   as u8;  // For entire register
> +        }
> +    }
> +
> +    #[test]
> +    fn test_single_bits() {
> +        let mut pte =3D TestPageTableEntry::default();
> +
> +        assert!(!pte.present());
> +        assert!(!pte.writable());
> +        assert_eq!(u64::from(pte), 0x0);
> +
> +        pte =3D pte.set_present(true);
> +        assert!(pte.present());
> +        assert_eq!(u64::from(pte), 0x1);
> +
> +        pte =3D pte.set_writable(true);
> +        assert!(pte.writable());
> +        assert_eq!(u64::from(pte), 0x3);
> +
> +        pte =3D pte.set_writable(false);
> +        assert!(!pte.writable());
> +        assert_eq!(u64::from(pte), 0x1);
> +
> +        assert_eq!(pte.available(), 0);
> +        pte =3D pte.set_available(0x5);
> +        assert_eq!(pte.available(), 0x5);
> +        assert_eq!(u64::from(pte), 0xA01);
> +    }
> +
> +    #[test]
> +    fn test_range_fields() {
> +        let mut pte =3D TestPageTableEntry::default();
> +        assert_eq!(u64::from(pte), 0x0);
> +
> +        pte =3D pte.set_pfn(0x123456);
> +        assert_eq!(pte.pfn(), 0x123456);
> +        // Test overlapping field reads same value
> +        assert_eq!(pte.pfn_overlap(), 0x123456);
> +        assert_eq!(u64::from(pte), 0x123456000);
> +
> +        pte =3D pte.set_available(0x7);
> +        assert_eq!(pte.available(), 0x7);
> +        assert_eq!(u64::from(pte), 0x123456E00);
> +
> +        pte =3D pte.set_available2(0x3FF);
> +        assert_eq!(pte.available2(), 0x3FF);
> +        assert_eq!(u64::from(pte), 0x3FF0000123456E00);
> +
> +        // Test TryFrom with ?=3D> for MemoryType
> +        pte =3D pte.set_mem_type(MemoryType::Device);
> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Device));
> +        assert_eq!(u64::from(pte), 0x3FF0000123456E00);
> +
> +        pte =3D pte.set_mem_type(MemoryType::Normal);
> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Normal));
> +        assert_eq!(u64::from(pte), 0x3FF0000123455E00);
> +
> +        // Test all valid values for mem_type
> +        pte =3D pte.set_mem_type(MemoryType::Reserved);
> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
> +        assert_eq!(u64::from(pte), 0x3FF0000123457E00);
> +
> +        // Test failure case using extended_type field which has 4 bits =
(0-15)
> +        // MemoryType only handles 0-3, so values 4-15 should return Err
> +        let mut raw =3D pte.into();
> +        // Set bits 17:14 to 7 (invalid for MemoryType)
> +        raw =3D (raw & !::kernel::bits::genmask_u64(14..=3D17)) | (0x7 <=
< 14);
> +        let invalid_pte =3D TestPageTableEntry(raw);
> +        // Should return Err with the invalid value
> +        assert_eq!(invalid_pte.extended_type(), Err(0x7));
> +
> +        // Test a valid value after testing invalid to ensure both cases=
 work
> +        // Set bits 17:14 to 2 (valid: Device)
> +        raw =3D (raw & !::kernel::bits::genmask_u64(14..=3D17)) | (0x2 <=
< 14);
> +        let valid_pte =3D TestPageTableEntry(raw);
> +        assert_eq!(valid_pte.extended_type(), Ok(MemoryType::Device));
> +
> +        let max_pfn =3D ::kernel::bits::genmask_u64(0..=3D39);
> +        pte =3D pte.set_pfn(max_pfn);
> +        assert_eq!(pte.pfn(), max_pfn);
> +        assert_eq!(pte.pfn_overlap(), max_pfn);
> +    }
> +
> +    #[test]
> +    fn test_builder_pattern() {
> +        let pte =3D TestPageTableEntry::default()
> +            .set_present(true)
> +            .set_writable(true)
> +            .set_available(0x7)
> +            .set_pfn(0xABCDEF)
> +            .set_mem_type(MemoryType::Reserved)
> +            .set_available2(0x3FF);
> +
> +        assert!(pte.present());
> +        assert!(pte.writable());
> +        assert_eq!(pte.available(), 0x7);
> +        assert_eq!(pte.pfn(), 0xABCDEF);
> +        assert_eq!(pte.pfn_overlap(), 0xABCDEF);
> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
> +        assert_eq!(pte.available2(), 0x3FF);

Maybe check the raw value here as well, although I guess the previous
test already covered this anyway.

With these points confirmed,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
