Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16BCAC792F
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 08:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A4B10E709;
	Thu, 29 May 2025 06:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fpCUidiy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B0B10E709;
 Thu, 29 May 2025 06:47:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7lWfAR9N0Mp9KT1TnBLia0YC3PYpWlGw8lN+WfanMmy/yarnRrA89tO/Hsmk236/Bz0WgTyCSkJauwRL4nWJCsOVuAKggwhGTNwl+BydScui1qU8CKvuAKv7N9Lb467AMkl+bbivGLutvRuXsnEWmflW+D9oynHA6mxUw6JndhtHIiMQtjFKmgZYs6LudBUA36PWZHfaXMEksJVYyWMMABN90XtrmjY6NHZfhCryJocxYuREtqZyvyorypsTnJHFU79RwJnub78qe2altAXogZSxUwOb5woRobmYD2nUqCX4hUHg1M9mQQULuqmVLkjgZm+d1ste5zdNmoWx1ltGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wWePqj/IN5FDmqc4USP385hgDJmJJpLmacoZy8CG9s=;
 b=nHIf2Odcfwa70lBHaALfkeXDeJU+9pc7HW/TfKzVxWZSexiYlX9XF1XnmnnVoOrY+AaHOAHQWJ8CS+8sYt1XQ7neiU6yx2g8v62GZHEsIrFIfFuUNuwYiHcZ6LNzei2txGo8iAE25VYez9MiWSK7Ya1sPTxmVqUwbYMr5LICYKerTNB56MAr71qt9vSfNpclyzBPwcYr9u8iBXjyZYVVvir4TaKgOqMJRbImDeXca0dgP3/xPG35Vv37uWi9SrzqZIcc+jtdi4gKwzcSne7BxNumWhvGbgpRaTi/FTtw2z9W2MCI+o8g1/8WowXrMN7oZx7xRXvDF0f7tnVxo2gzFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wWePqj/IN5FDmqc4USP385hgDJmJJpLmacoZy8CG9s=;
 b=fpCUidiyC+7zWnGWo6VePRRH0RJAyCd/kWr5gDmZK4T9cNCxPSnKcIst10A6Lwy75uGbu3jyGtJzpcj9rerbP33AAD015sc5n9YvaufypWjTvwWOANuq6tyWllj15wuFZTFlnEE8fCifXtBNXFeSAnlln/fINmR5Bw0iweZY/EPYgP6rUJgqSIVoBoWAyie3VLOruAkosDbYNHf5+GyoxpBjXlxp1gOVnCYkb5xqeqi/gRztwq6uFQjTs95zfzjga6YwbsDexECXC3O6l3sgcBssovLD3mV6I6GD0nVx0o3hs0WslhnVu3CAiQIbkVFYYSMgOpPs2pkKocWcO1/e0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB8694.namprd12.prod.outlook.com (2603:10b6:208:488::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 06:47:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 06:47:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 May 2025 15:47:11 +0900
Message-Id: <DA8FYGQF4SCY.71AZICX5QU9J@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Shirish Baskaran" <sbaskaran@nvidia.com>
Subject: Re: [PATCH v4 16/20] nova-core: Add support for VBIOS ucode
 extraction for boot
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com>
 <ab30d5f1-d2fa-4e75-8153-b2d3870a70a1@nvidia.com>
In-Reply-To: <ab30d5f1-d2fa-4e75-8153-b2d3870a70a1@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: 64950979-7788-4fb9-e082-08dd9e7ca5a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUpPRWl4VlE0R0NWSWRGOTkreEFlRVFzUzYzVWI5YUtzOFRSb0dXUWpONXNG?=
 =?utf-8?B?dVg3ZjVEYi93WnRmS2F5Y0tCdnVFUWFUeGRKK0xMSGt0L2ZvOGdQdFN2MWY2?=
 =?utf-8?B?R1V4RDVCTUN4TFppOWJJTzNVeGR1bEhvUzJCN3pkbytrR3JjMWZkQWdlVzkz?=
 =?utf-8?B?OEJhNEI5UjE3QVQ2QzZDZmJTTkpQU2JQSmQ3djg4dE95Y3pRNzh6UXBFdm1n?=
 =?utf-8?B?UGJQL2dIVkFoaW51dWZaTVA1M2dEQ3hIRzArU2tTbFNMZUFnQXJCa0ZPc2RI?=
 =?utf-8?B?UlA4UnNMNWp6RDg0MEZLOFlScjlhWk16cnFoUHhSZ09mQmYyYXNlWkxvZSs1?=
 =?utf-8?B?czBHSTBKaDRyUlZUSlRjY04ya3lLQmxUZzhHc0RsOU9NbUJhV2lRZUorMmNJ?=
 =?utf-8?B?c2ZrL1BRSFR3RXFzeGs1RGZsODhCZjVPZXhoOTZnckhUVTVZSHQxR3IyU1lk?=
 =?utf-8?B?N0VPd1ZYQVlwQ2N3MVlFT1VHWEVOR1JDYjBrR2hyUkdzSlppUSs5L3B3OVBs?=
 =?utf-8?B?QzlWVGhmQmtZc3Y3SFVsQUd4NTFFL0wvU2ZWNjdac3Nyc3JQcWZkREVjWkxn?=
 =?utf-8?B?bUd5OHRoc1ZYbGJmdjhCVmVDY3h3N0ZRaThPSTg1REd4bXdQZVdnUGRzSk5D?=
 =?utf-8?B?dHpQQWx4dFhYclcxMHZ5TmF0VjRhNStGSVVMaDY5eGdTRjB0cWpib3g5dTdQ?=
 =?utf-8?B?MTgrNDNQVEh4WFhOcXU2aDBJVkNYbmUxRWI0Tk44b3hjTzZ3UmNoNC8rSXNq?=
 =?utf-8?B?QzVzUlNoeDVNemZqZVVvVzFZWit2ZzN6ZGNhTlJ3dWtXZkQwbVhEOGV0eEZD?=
 =?utf-8?B?Wm8zSnAzYVdsa2VXdjdqajk0dHhYcXk0ZGoxY0pBclptdEpGS1I0MHN6c0l1?=
 =?utf-8?B?aXR6a0pMMzlYajR6dUtMVkNuaVlGOC9jK29KZ2ZyN08vQVNhYXA0WWhiUVNX?=
 =?utf-8?B?NXl2cE5LRDlxZ1ZQQVFVckEwazlyUUNNb25zR1J1NCtoTFY2L2xhaTZhbjR0?=
 =?utf-8?B?b2tXYmFjcTQrMTR2eVkrdnF3RFZhUThLOVVqSU1KaDRxNFdGZDhhZEppZlht?=
 =?utf-8?B?Ly93Tkh3ZUdFZEtHRjYvcE4xNjJjWXQreC9rL0VVSGtxQWg4blRiRVl1bSs4?=
 =?utf-8?B?SmRESFlzODdWaE5KejRMd0tNVDV2ZTdmTW1kZ3phRWJ6N1MrbHJMVGtKYnFr?=
 =?utf-8?B?akdKajB5ZXJIRTQ0N0hJNy8zTnNxelVTZFlIR004T2k0d0UyMkpmR0pqUXM1?=
 =?utf-8?B?VlpoaGxEOUhFazJKeSsxOGgvbU13bHkyU0ZSUmZjOWZVZWNIZTFNMUJINFdK?=
 =?utf-8?B?cFFzMisySnErb3h2cEQ1bjZ4aVdkMXJzWE9GNGh4UC9GeC94NzZhNjNwT0g5?=
 =?utf-8?B?RnU3cGJ3c0FLR1Z3TWFxOEJnSUdtdmMvNFFBdWwvdDcwKzU4L1pjdjU4d052?=
 =?utf-8?B?czdYb2VCbTRPVFF5ZWJiVW44N1EySE5sNWUrLyttaW0zdmNHYXU5SEZNUWFO?=
 =?utf-8?B?VmhJSjduQ0xmeDFzbjRSeVZqZ0ZGdnREMk1Pc2MyVTAvTTJ4N0oxUm5OcE5i?=
 =?utf-8?B?RklwOCtrT1pMQ1R5OUZ6WkJNODJsRTkxemIzZUovZncrSnVKQjU5akszMDVw?=
 =?utf-8?B?UExMZ3pCTUgrV2hyU3FhV1JpeTFXZ2dxMHlCb1I4VC9xYW1UOU05cVpHRUtS?=
 =?utf-8?B?bE1YK0xSZ3NLRStGRXlmcjUyUXBNNjVxMjZLUlF5VGJhNVM3WmJFbk1UQ1Nq?=
 =?utf-8?B?SlNHSXNFdUVyRmdQVFhjb1JtOTE3MkUwWXBYcVhwWlY0ZlJoQ1hPb04xcndM?=
 =?utf-8?B?MGdtOHVNVUUrMWVFWXAwRjBURE9nbGhENHB5TThNZnRhdis0WDc4c2NoV285?=
 =?utf-8?B?UGcySzhFVkpjRGlvZ1hZbEhES3BvOTVIU3RMNC85WHZoRFY5K1BueFJKUHo5?=
 =?utf-8?B?RHpISndUMjNOUXpJcVJPVG84OWxyRDV0a2tSRnBjWXd0OXhRejRMb3pnZUxz?=
 =?utf-8?B?VmxneVZnTlp3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlRHM0NHQmc2UjBUQURtOGRwc0lDRDJweE1vNE0wQzYrZzgzaGZOaG9qSFBK?=
 =?utf-8?B?OUN1WUxjRmxESXBvSDU0MTJoQVJLcEp1cUd1QSt4Z1NVcENFcXhTVHV3Wml3?=
 =?utf-8?B?aVpXMEt3enlrTkVhS2V5Y2lGWEFYaFh6eTRhdU0wd0dHMWQ4Ujg5UnRrNnRJ?=
 =?utf-8?B?QUdoZDhFcjVBb2JHRjl4eFkwTUdqOWdRMWdVRFA2Z0pSSXd1amI2aklvSWI2?=
 =?utf-8?B?RTdCU1FzQTV6YTFYQXoyNDk0N3A0MDIyQnJXQmkyc0p3cjdBdStvb0RaU3BU?=
 =?utf-8?B?dkFmZ2RwMHpNMy84N2I3VnZYTHEyUGcrSHY1aU5vNEpBendaS3dJc25xbVN4?=
 =?utf-8?B?b2JmVUd3NVd3L0p5elZBUlMxeC96WjdsMHhyeXZVU1lrbEVpdWRSNXF5eENx?=
 =?utf-8?B?NnRtTG9WVjdXb2dVdktxMjNobGlKWHAyRnhQd2dUK2ptaWZOU05rdWJPQTJt?=
 =?utf-8?B?bDVydVdpcVRsUzZoM2ZRRTBtbHlYOFVJYTYwM1RNaE94NHh3OCtyczhxMkpL?=
 =?utf-8?B?aVpFZWNCWGpPdERwL1FFTEVDTmFkOTdoY2JSbTQ3Wit1SFp2cnRXZHhxRm1w?=
 =?utf-8?B?Sm5YTlNLSldrdjNnQ2dxZStvK3Fwa2tHNi9CaGVHdTlCbnBBUUhvZUhWTFkr?=
 =?utf-8?B?ODN5L1dqQTY3R3UwUVZyd1JKMVl6VC9Pc29BS1BTNEdDMThVSlY5OE9nSG0v?=
 =?utf-8?B?T2JxOXVocVVCcmhmRlJXemdvVy9iMy9sOFJDdDVES0d3Uk15dmhFc09jVEZ1?=
 =?utf-8?B?ZFVUTTRwRUp0VWdQclhkS2t2MmJLWE9mb2NMWVV0c0dlQkRTTEFMUHZUYWx0?=
 =?utf-8?B?U0cyc3RqaFgybGJpUmREVm50R29SUktoNmNNeTM2M01hSGpicmQwM2pCQXBX?=
 =?utf-8?B?RHZrTkVyR3pFalpiWjM5SkNWZ2FuY0hvRkVtaUZnWnhWNzZ5VFVBeG9hQ0Rz?=
 =?utf-8?B?clpIMWZXTXZDOE5wQzc2QW1DRllvS05jM0NwWVdZL29xdWlHWWRwYWFNa2hV?=
 =?utf-8?B?Vi9VZnprbGRMbk5MNGNwSTE5ZVlQeHQ2ZzJLMEhrcloyTEhVR3R3T3VNcTll?=
 =?utf-8?B?ZVJxOHdXYi9lbktLZmEvdTF6bU9JelVLM0lKdzB0L2lQd2FkL1JJdmNuTkxx?=
 =?utf-8?B?Vk1qamlIMUt6R0RTNDZNbGQ3S3BpYVVseE1iK1B6a3pzTTY1R0hSaTBaMDNY?=
 =?utf-8?B?TzllSE83VWhuYnBPVjcramRleGw1OW5ZWll5S09wcXFnZWRhS1dXTUVMN0dv?=
 =?utf-8?B?MExhUW9ubG02V25kbGdGTlE3djBBdmNNbk95VzZyd090eTBuN0ExSFJPN3BV?=
 =?utf-8?B?UlV4RkZzeVV2VEF5R2g0QzZWNFZieVNCVmtxaEw5WjFKSEFrK2VwODU3aUJ6?=
 =?utf-8?B?UkRLNHZSeC9DSmV1Yy9RSkJ2VEZhWHF1OGl3amlmWkxlL3pWeUV1b293Sldo?=
 =?utf-8?B?M0p1blZuSVRqS25ob1pEM29PNy9LMkozdHpuaUpoS2o1RHUwVXFQYW12RTNv?=
 =?utf-8?B?cEU3NmNZM3BrTTdEMUNjRFZFelNSVUtsWHVwUVd0UkxVWWJTclB2NVl6bHdY?=
 =?utf-8?B?MmtPUHNEUHVYMVFVMHh6VkxIUlBzSUhNNFI5TnBpSEhBYnRwYWttVTZQaVNT?=
 =?utf-8?B?R1FkQjAvQ1FQbXRtRFhnNHRxQVJmQ1NRNk0xb2xGWEhXTlVrRE5qS2l2dnRo?=
 =?utf-8?B?ck4xV3JYYWt6enVIOHcyeVR5M3ZxUkhpRWdEejQ5eXNPUWF1bWRlMGNnNWpl?=
 =?utf-8?B?L2Y5RmVXeFp6SlMyaDhjV1lwaDJyMW5BOFlvaEZicjFTTFhaNXd5Q3RKOUcv?=
 =?utf-8?B?dDNtNWpkbDA0M2dkQ3M4T3RQQW9WSUhXa3RHVnpvVzNVOWJGaFhiTnlRSXBk?=
 =?utf-8?B?NXlTQndTelphVDUxQVpPQkVPbXk3YmlLcmlYQ2dxUXRST2dBWkZyYWJQUGZn?=
 =?utf-8?B?L0loYi9XZUFEbEt6L3doU3RTRG16M05jUm1PS2xFbytHN3RTV2pBSkg4cmR0?=
 =?utf-8?B?eFlyU1FOd0hpUVdlL3AvemxJZ3JscGgyR3lxOUEyR2RZaUoyVlZRU1NUQzU2?=
 =?utf-8?B?YnNjNXdWTFJKNUN6aDBNcjJSZU91WFI0MUhVcCt2NUhscWlpRW5ZNldVTW15?=
 =?utf-8?B?WmdkMngweGJ0dHRWQm5PdU9XTCtJY3hTNStYSVlBbnpicE90Nnh5VVk0NS9v?=
 =?utf-8?Q?ifxav1M06MO+mppAlWkKZnai9O/4rHpmzlbWrdyz+Aqe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64950979-7788-4fb9-e082-08dd9e7ca5a1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 06:47:15.2316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCIgpt44OOaAnbANGvNgnrSyqqNgEHdwdCriuqHutZAUXKyHQvtYVa3JOocf0ds5JtMC6QqAMTqH7Z+Mr7CVJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8694
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

On Wed May 28, 2025 at 5:38 AM JST, Joel Fernandes wrote:
> Hello,
> I split this particular patch into 3 patches:
>
> gpu: nova-core: vbios: Add support for FWSEC ucode extraction
> gpu: nova-core: vbios: Add support to look up PMU table in FWSEC
> gpu: nova-core: vbios: Add base support for VBIOS construction and iterat=
ion
>
> It is code-wise identical. Alex/Danilo can you pull these 3 for next post=
ing or
> applying?
>
> git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
> tag: vbios-for-alex

Took these 3 into my branch and will send them with the next revision,
thanks!
