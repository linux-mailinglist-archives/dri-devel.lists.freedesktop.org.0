Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FFDAD72F9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEC910E85D;
	Thu, 12 Jun 2025 14:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="awiDZgpH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1063F10E85D;
 Thu, 12 Jun 2025 14:03:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LdLdicO8W2Yp9IDXjvLmIcipWvzPTyFUhgfFPGGdEa+Tcwz/BxrMoGPOzf/3RfzE+cSa+AKukSccC0bWjUmnemD9ZL7mxa/zXQs59tQir5MNoeAkmzd990uhIbO04tcQUKYSUDCO2ZogGIH/qTMqPbJ3MTnKy7lscquNV6UD+spl4oJtnELEhXhh7Yo5V7GXiM/xaqHW1fo560UMz919aE7Secmou7SvTB/pcnxTkfGXsnSi/91WjWKruzNRXPT1sILmUp4UAMbO3dZve1+LP9AI2rt/C1wAATOAKFmin/U17nitbEdbkKcUIBGSlo0k7cLh3mAfBeWT/GpS3y530A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1t4RRkGZ6r72flCGa5XSSMQ3GK7dWXFbXCAHMRGTqE=;
 b=V+kI16RUJDSPrZ2qQwaN4DYOUSfqAMKDA/ufXgoglBy6uclfoCg/i9qICBzO6+FVA09FnfOI3B1LM7+5tbVC3txOJ/FSVX+7gG97g4ln0wr1Gn/wbUKgJVk3RDiTmnY+7r5gNgf1E/lCJnard4JxAL05ZEW4BlMCMTLOzQsBc286r0od9KnYbHSllehM24nlXsMMe6cyFIL4v7YyK+vEGajUeF7TZlIb0HzlJKgwnL4lOpZFWzNamAzdqOA3vsUmL+xQYUBdswzABm60QPZES2JtyQggLEyaizO5eymdLKPcukaypez6tOz7hFwIyO2k4LFuW7thCsdcPw/l248JoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1t4RRkGZ6r72flCGa5XSSMQ3GK7dWXFbXCAHMRGTqE=;
 b=awiDZgpHWn/88tQIgy2mb4u7LkhGIlLEtAkxwC3nlWVpmik5C4G2oN53Rp2glvjVNf9PAF0o1/SObncJgjHVYxDxcOYRI2REl/9u2Mq1dvsypTrgX5zwKtK+PXzEUoOaHyWP7bkDP46tZKN8Q4N1vaRY9cwpmZHFHnr7Tx8fcRpV6H6+kOporLprC4TBEAtkgj0pNCg+GDs0Y8+8KwLP3rPeX1Ap5Cz88faj4jf3nkQsxiJ+mC8dzwnm5hLZB4Wx2kGul44iBOfQPHriN6aPG0N4vqEidfYGg458qnMK3j+rviSCPdcF4/kKi+vkOq3dXjwefvRHcIHhYVgzbPfLsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 14:02:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:02:59 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:37 +0900
Subject: [PATCH v5 09/23] gpu: nova-core: allow register aliases
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-9-14ba7eaf166b@nvidia.com>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0281.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 779d4e5d-1f4f-4df8-0fd8-08dda9b9d677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFkwZjk0TXFJNTA5RFNFRVBDSVhTNlpFbmdremFYV0VSNHVqaDIwRkcvSDdr?=
 =?utf-8?B?R055N0YxTlhhamhWdmJXdTVRWTEwZHhoUmZGMkV4TVI3SkhGVGYyd0FRNkdR?=
 =?utf-8?B?bS9WYWMyQnFidVVjTGUwWWR4QVAwQWlMcWdqR2pHVEpoRnB3Y0FLRGlIbEpy?=
 =?utf-8?B?UitLWFBxR1JtT09INFJ1akJNUkVHaDVLRDNBOFVHWnJrT0RCWlVQcnlNMk01?=
 =?utf-8?B?VUx1M3JacmRMTFEwWWZmaGNTYmZMc2o1c2UrNVNVbHNTZnJhdWJBUm9qTXNI?=
 =?utf-8?B?RG84bmZNb0YwZURMQTVQenYwTXhEQmYxTDFVeldtV2N4blUrSE5PNGVaeURI?=
 =?utf-8?B?eGdxclRpNG9DcnZ6WEZjN293MlpXZEcxVXJoTnZRR2d1eTVycUQxOE9RUjFy?=
 =?utf-8?B?eTJ5MmgxYytjQ3A0Y0NvcC93TXVxakJqSks2UGxqZ2lidFZxejNiOFhWbW9w?=
 =?utf-8?B?bVZ5WXRtU3hUKytuSDhSMXN4eDIzbXFUbnNHK1NpOXZpUmRWYU0zUnlvaVZP?=
 =?utf-8?B?Q3dudkt6NHdab3dxVXM1dndHTFloMkJKQXZSZGlpNVZkekoyQWl5SERUam1C?=
 =?utf-8?B?Q1ZZRC9RMXYrZk82NVBpTDhha2JzQXBuTENodTZGWFcrU0NRclRWMFVlQXhk?=
 =?utf-8?B?anlOYTNVTjlmVndHNVZUdWp4U2tYZjRjWHBVcTg5MkUvdUNPTy8ycXQzV1JW?=
 =?utf-8?B?RVM0c0VNU1RIYTFJQ2ZPcWJ2TERRcXkwV1ZzbUZ1Z3JpMFpFUUdJeTMzSnJG?=
 =?utf-8?B?bVVTOFhWTzJ3T2xDNmRRNVQydUo4UXIzNm1BNTJBZTI3bjJsY2lJZEd0Vm1J?=
 =?utf-8?B?LzNpY0ZRdVY4bm9lckdwMmNycnRBY0xNYzBBa2wyQUVSQ28xZUo1QmdTeThZ?=
 =?utf-8?B?eU5jNkhIa3U5aHNQak5oYVA5aU9rWDc3eFhiTDRmUFFZbHBGV2UvY1BCOUhM?=
 =?utf-8?B?bFo1UzR5NzFsYzFEVGdTckIyaXV2YTBER090ZGdXRkdUTzZNbHgvUjBKOVZ5?=
 =?utf-8?B?c3ZySXhTYThicnVtWU9wVHkzUjZFUytjakQyNkJBY2dJays2UXpqTEIyN0N3?=
 =?utf-8?B?NWs5WUREMTJOTHdMczRlbE9SSE53YmhCajBvaVIzWk9zRm9vWXBqaXdKaGZk?=
 =?utf-8?B?WUhlRXV2NlB0ZU9BZ09LNXNiNnVkVHFvSkdVQXBacVRXWHJJOG5QeGFnRU1y?=
 =?utf-8?B?em9PY2RqbDlCNnJ0VUFoRnRtci9HbnMwaXB1YkZGekhkSWY4MmJpdXordkRa?=
 =?utf-8?B?WitWalBMdFdZSGVnVHVheGlPZEhBa0tFQ3NYWUVKN1djajlEc1ZkbGZqV01r?=
 =?utf-8?B?V25SZUtiTmxiYjhTMkZGUnc3UEN2SHgyeG9VRUd6dTlPTW51ek5ZZXlBb2ha?=
 =?utf-8?B?ME1jTE9nNVk3emVsNlRITU9acXE0b0liMXdoL1M5OUwzUG1mc3A1NzdDd1c1?=
 =?utf-8?B?T2F1dUZqY2hqdzVMR3JCT3oyeGw4aFVxTEZUSXl5V1dZV1RVVVBHa3QxZ0tL?=
 =?utf-8?B?bzA0NjhqSlYyRVVKQnZUT2NGSzRjcnRpc0hMQ1phRnhsMVArUzZNRVByajhh?=
 =?utf-8?B?YVpkSVQ5ekpVQy95cnhHRjhxYVdWU0pJQzdDZHhpRlg4SUlLZnFDdCtVQjIy?=
 =?utf-8?B?b01IYko3cnJ4ZmJkU1pHQnNMelZwWStUWThxeVZVbnRrVFBFcGlBNU4wV1dN?=
 =?utf-8?B?cE1KSTN1S1oxVlhaeU1hZ0Jzdjd2Tk1kbEJMRmVRK2VOZ2cyaVhCY2laUlZP?=
 =?utf-8?B?VnIrMllJQVVBZ1NNS1hadTBqZTBhQlRHZlNyNWVwUk1rc1BBYUtML0VnVlli?=
 =?utf-8?B?NEpmR0dLZXQ4cEQydlFSL3Y4UGxVbDBYb3RDMnBPM3BzNms3VVJlenFTNGpE?=
 =?utf-8?B?L0xBakNyc2hFUm1kL3VTRlRWY0h4K1FGZ0IvS0k0eWEzNCtaR3g5bmsraUdM?=
 =?utf-8?B?RFEyRHp5ekt0d3ZCbjZQMHA3OURhV21KQ1MxYks3RWszSHMrekNiMGhVandV?=
 =?utf-8?B?dldCakltdUF3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUJTbTNrMmlaQjFpczErby82T2NzRjdRdWFCQnkvRlExUGlYTVIrMDM1Q1dJ?=
 =?utf-8?B?aXpvVkhKTHRRNGN5M0xMYlZSOW1sZlV2VFJueGZDN2hwR0VLbEZ6NVBhaUs3?=
 =?utf-8?B?YXNyVlBpT1NITlNwYzA0cHhoY1o1QW5NRzBlZHVwTGdtVnM0Z0xnWFZRYjVq?=
 =?utf-8?B?RVBYY0JucE1YK0tSUDhobXBhS3RLUEZCRFkrZTdkMjRDMk5DakR0SW5rUFJy?=
 =?utf-8?B?UzdFSUwxZHNmbndTN0FCKy9INlZsWnNidVkydGpSeHpJbjF0cHl2S0poNGVN?=
 =?utf-8?B?TTJ0NklmT2cyMFZjRENYTWFEaHR4ZGg2TDI0VmlScXp4aCs4WGZXQmpnYWk1?=
 =?utf-8?B?MVdpSThKZjRGQ3RXd0Z6bjRYRkJ2WjdHS0c1alc2RjdLZTJRRW1waVpCbkww?=
 =?utf-8?B?TVlYZUk1YXZ3V1hpelZQekQxMStlMlVDWHNRZFFXcmNjQVVmQXU5RHZLSnp1?=
 =?utf-8?B?L2NycnFyYnY0dEIwSzlqV3BVblZtQnRSWnN0YzhjZnl1akRNbURxVlNpeUtX?=
 =?utf-8?B?RVc1T1gyL0ttTERXalo3ZHhsZUZ3T2RHOS84aE9BNGVxMkhsODI3NXQwMDVT?=
 =?utf-8?B?MnpmL2YwUXdPMk5qRFgwNDFBVHFRSWxzT0FXZmNZVEx3TXNTYWV4d2d6cDd1?=
 =?utf-8?B?b2Q0alBHTlpvckZna2MxR2RJZEc0TktwTlFaaFd5b1JTcGVpQktzekkwMEtM?=
 =?utf-8?B?bUZDeXVnQzhLMzQxb2h6RW9ob2x6RzZwWm9ja1FWZ3hTZnk0Y1g1TEh6bTNW?=
 =?utf-8?B?bHF2cFFrNDh4TUNyYXdmc0ZMaWUvMWxFd1NVUTd3aTNVcXNNai9FcmVxemdn?=
 =?utf-8?B?QVI0UFFiNkYwaHlaTUYvemRQZTVBVWJtbTlYNHl6anhWRUtFRFVZNUN3Y29J?=
 =?utf-8?B?cWVmR25valVrVTNPZ29LT2ZicHdpclJhdUh5RXV1WXpaSUE1YlFOR2VPbnh6?=
 =?utf-8?B?ZEdDaGd1UVRVZmhncmxwaWlNd0pCOFNyOFA1RHRURXpaODU5K3ZUWkt3Yk9K?=
 =?utf-8?B?eUc5NkJSa2t0WCtteFNDNHJyRDJlQXBvbFp5UFQxVmxRNDEveVBBVUZoOTdp?=
 =?utf-8?B?OXhhZEVCQ0lDY041Q3pJSHdaOHM1RjEwRXpSWUk4azNMUEdhQ2dxRm1tejRL?=
 =?utf-8?B?UkpXeXpiY1BWS1NIeElZck1udmV5NVJqR294Ny9QdnJJbytGTVZrWEhnMGJW?=
 =?utf-8?B?VHcvTGRJYUR4ZTZrY1psM1RLOHpMTW81V29kSkZqbEh1WHlRREFaRFlIbmdq?=
 =?utf-8?B?MENGQlR6QTkyeHBhL0YvaHlGWnZha2l3aGt5dkZXKzBvQitJa1JSNTYyQmVO?=
 =?utf-8?B?dXI0QThGdm96QUFaeG9sRjZyQ2k3U2RJV1lDdXJlMHJTYk9QUnBGSHpCN3Jt?=
 =?utf-8?B?SXZOVWw4ZmNEcTBYYmF4NXdSVnNFaVVsOFphTnZaVjM3MmR6UWJMdjc1M2I1?=
 =?utf-8?B?NmdVQm9TWWpUNk9ya2pYN01TL01iNFZuVGloaEpoK2pTQTFrSXM0ckdVT2p6?=
 =?utf-8?B?Z2d2YmlZcHhHQlRWZlFFUlFWTEpQTGtoMkkyN0F1U20zdVRlRnJUQzg4T2ZX?=
 =?utf-8?B?TlB0NjNiVEJrSVptOUtlcVN0STluR1V6NnNORzZWeFkwcXdVTE1SRWlrZzhk?=
 =?utf-8?B?cjYwY3JRZlJoNC81eko4SW10czJjT1Q3REhvTmNlaDY5RXkxZkt0S3VtL3p1?=
 =?utf-8?B?aHZSVFhZWlYycUgrZ1lFNWVUdU1jZVNkNmJUT0N2S1gzZjJKUDJLdUNmRGFM?=
 =?utf-8?B?TFdyYmp3N2NJQ09hYXh1V1JoWHFlSlFTbG5hQjkvcVVtY2Q0Uk9GYkhEWHlz?=
 =?utf-8?B?ZlRwUDErL2o2UGlqb2VjUjdBNG5uRHRhMjZCQlNVWHZMNGpvWmxLa0J5WHRn?=
 =?utf-8?B?bTBZc25iSHZBaHZ6RjQwaUJnamFUQ0czVlk2L1I3Z0pobFBUUGNEM3h2L3lW?=
 =?utf-8?B?WEFGNzA5L0FhZHJIV0JsVm1vb1hRTEdNNkg3UWt2VDFjMEhITW1MbTJxR3JB?=
 =?utf-8?B?M2JyVWxLd1VaYW5oSzR1dWpRN0RMd3RjdFZLRFlrLzJERlNCTHRKMFAzYm12?=
 =?utf-8?B?cmVIVWNUbDMrMnp1c1gwSFg5UmFuYTRONXF0TmZRVVNzZTIrQ2ZrdzJoMjh3?=
 =?utf-8?B?L2R5M3g2YUhHVUZlek1LTWVBMUFUN214YVN0SjcyZnR4TmFSc3ZRQUU5T3Aw?=
 =?utf-8?Q?cRjCg+NpUNwIk7DkaJzodF6UxtGM+ENCRmSIppeJ61eN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 779d4e5d-1f4f-4df8-0fd8-08dda9b9d677
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:02:58.9910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Im7bkiGBLVLuOpyIeQgrmXaNWSczkDzia1syP4UuMNXq04BJdkj8N0LmPxEepOY0eW8mEzi6zwCw60uYgPB6Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458
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

Some registers (notably scratch registers) don't have a definitive
purpose, but need to be interpreted differently depending on context.

Expand the register!() macro to support a syntax indicating that a
register type should be at the same offset as another one, but under a
different name, and with different fields and documentation.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 40 ++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 7cd013f3c90bbd8ca437d4072cae8f11d7946fcd..e0e6fef3796f9dd2ce4e0223444a05bcc53075a6 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -71,6 +71,20 @@
 /// pr_info!("CPU CTL: {:#x}", cpuctl);
 /// cpuctl.set_start(true).write(&bar, CPU_BASE);
 /// ```
+///
+/// It is also possible to create a alias register by using the `=> ALIAS` syntax. This is useful
+/// for cases where a register's interpretation depends on the context:
+///
+/// ```no_run
+/// register!(SCRATCH_0 @ 0x0000100, "Scratch register 0" {
+///    31:0     value as u32, "Raw value";
+///
+/// register!(SCRATCH_0_BOOT_STATUS => SCRATCH_0, "Boot status of the firmware" {
+///     0:0     completed as bool, "Whether the firmware has completed booting";
+/// ```
+///
+/// In this example, `SCRATCH_0_BOOT_STATUS` uses the same I/O address as `SCRATCH_0`, while also
+/// providing its own `completed` method.
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     (
@@ -83,6 +97,17 @@ macro_rules! register {
         register!(@io $name @ $offset);
     };
 
+    // Creates a alias register of fixed offset register `alias` with its own fields.
+    (
+        $name:ident => $alias:ident $(, $comment:literal)? {
+            $($fields:tt)*
+        }
+    ) => {
+        register!(@common $name @ $alias::OFFSET $(, $comment)?);
+        register!(@field_accessors $name { $($fields)* });
+        register!(@io $name @ $alias::OFFSET);
+    };
+
     // Creates a register at a relative offset from a base address.
     (
         $name:ident @ + $offset:literal $(, $comment:literal)? {
@@ -94,11 +119,22 @@ macro_rules! register {
         register!(@io$name @ + $offset);
     };
 
+    // Creates a alias register of relative offset register `alias` with its own fields.
+    (
+        $name:ident => + $alias:ident $(, $comment:literal)? {
+            $($fields:tt)*
+        }
+    ) => {
+        register!(@common $name @ $alias::OFFSET $(, $comment)?);
+        register!(@field_accessors $name { $($fields)* });
+        register!(@io $name @ + $alias::OFFSET);
+    };
+
     // All rules below are helpers.
 
     // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`, `BitOr`,
     // and conversion to regular `u32`).
-    (@common $name:ident @ $offset:literal $(, $comment:literal)?) => {
+    (@common $name:ident @ $offset:expr $(, $comment:literal)?) => {
         $(
         #[doc=$comment]
         )?
@@ -280,7 +316,7 @@ pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
     };
 
     // Creates the IO accessors for a fixed offset register.
-    (@io $name:ident @ $offset:literal) => {
+    (@io $name:ident @ $offset:expr) => {
         #[allow(dead_code)]
         impl $name {
             #[inline]

-- 
2.49.0

