Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3DEBF3F6F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 00:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBA610E536;
	Mon, 20 Oct 2025 22:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="drHvVIzG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012051.outbound.protection.outlook.com
 [40.107.200.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17E710E16D;
 Mon, 20 Oct 2025 22:50:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNklZsYP8OeCUG+WV29mZkk2dPVRXB/OdZFPlfaofGs8I/DTKEG/BtncyWmcQcDhXib1Gwekp6qHjauQrvTqlYR/QpEr7v7HgIYk+/0BgG5WG1XAbjWjUjTDU6s4ffkE61Kx0PF3jhHR2oMsZcR9ZCHk0wVMRKeg/tkKWqxYJCaus56WdeQ1dOdG2CDGa9EzYGr5HeTzilydP9bS8s2nmP16tUYiKInrJNHE2JpXn2xgvKzhDp5i+rNb8VljQacuFhNaK44W16s3ql+JoL+u4bdEBntk+LIzVKY+pNCtOBtH524wTdBGOzY66vfT+HgGsX52lsqzkuhNIy6OiehY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrZU3ldagL6SrILdq/y3chirL+Rp5AaNkSZ/8B4dT9g=;
 b=fN0rnFv8ZlD6CArya3X1OjROTUiBkQJl+XetBIn01uJTRZ5b24+Um/aSv+42BjfzP7bz20F96bSZUUZ16ZVlWLaehw+2St1vHaJnGpLUUPWUnvNXqQ75jwgCZJOJJz0mHrba0UcGpsBhSAO8anACVnVpgWTfJa94cmh6Lh5cMjnNbz0iIiNr81uVtYnottTQmzpMwV3GnlJ7XSHsbGxuihNgVJ38ydT4Vtb5uhUjQbdAKBgEQGCTI+rqHNZ0k/U6qnNliUEe+xu0gsurYCGWl9k7ftfL1Ydr/JUGKPAch/D+MDzmMdzyLtq6rcsQc8I5BJSoKYemZqs3pF9Agz5wzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrZU3ldagL6SrILdq/y3chirL+Rp5AaNkSZ/8B4dT9g=;
 b=drHvVIzG1SOEoPs1Z3XDM7S+9pvMnCKhIUyyMX+uzpuxygZ3h19CzvP9Bs4qwj4v64sdvN+Tyehyp5WXh+CKxAwIjkcvW925UYHIay5HfO7ay98WjSmh8+Tsl9+idz2AwBb3NkLGbeTzZa12iv7grLDzxF+7GDSSud6sYuQcVTyCHLr4Wy9C0SUf6DE+ImGzVzw68GLHDlxRKMr4be1R2E/Rn0/BUULZQcXMPckiXf5SoQQ6ZJ1CqeET/mneoDrSktk0hacb/afNUe6MaEwky/mrLGfcr3Wn5jAmDzjqu005j6igL8WVkjaMi55i5NnougNqZo0HSNom1XvM987wAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by IA1PR12MB7662.namprd12.prod.outlook.com (2603:10b6:208:425::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 22:50:45 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 22:50:45 +0000
Message-ID: <aa3b4ebf-12c9-4ffd-bfd9-bcd920970309@nvidia.com>
Date: Mon, 20 Oct 2025 15:50:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7.1 2/4] gpu: nova-core: bitfield: Move bitfield-specific
 code from register! into new macro
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Edwin Peer <epeer@nvidia.com>
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
 <20251016151323.1201196-3-joelagnelf@nvidia.com> <aPEv_UO4vViOcOvN@yury>
 <2CF462DB-D2C8-473F-9D70-522E6AFEDCE4@nvidia.com>
 <DDJZY40SO5EF.2066SEKKQ4U8I@kernel.org>
 <e4f5ca12-bf67-4b48-97a1-7ab2c771056e@nvidia.com>
Content-Language: en-US
In-Reply-To: <e4f5ca12-bf67-4b48-97a1-7ab2c771056e@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0078.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::23) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|IA1PR12MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: ba04b4c8-9bae-4610-4879-08de102b1aa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjhvZGJpZERWakhvUVNLREJrUU84VE9GTGhibVpCUjVud2Y4OUg0OC85cnp1?=
 =?utf-8?B?SVBXMlJ3UDNtWmxkTXMrdC9qMkk1dVd4ei9VY2x1Y2Y1TFg3ekRGMnVxZ0pt?=
 =?utf-8?B?ZEdDK3E5Z3YvcnJ6YTBJT21zSFhCclZ0Z1dqU3dHcDdzWU54WlZZaW55dE9I?=
 =?utf-8?B?amNWQktlTDlzd0RlWUVId1dIbjdhTlNyWXNUSy9obTJLckszRldhL2VES2h6?=
 =?utf-8?B?c2lab1IzOC91NENUR3BzNlFPMWxwQXlwTkhDU3krZEYyWVJpNUhRQmJhZjVB?=
 =?utf-8?B?UXJoTnlrK1gxVWRpQndSOTBkZEVnRjVhWlNKa3gzdk1iNnJBZnpxYlhPdElm?=
 =?utf-8?B?cnhhdi9CNnpEeGtDckxBZDFNeDI2ZFQySDBWUkphRHNMRGZPYUtQUXVtTGN4?=
 =?utf-8?B?eXp1WEpFREJRb1BheE44Z0VwY29qUVRVMHJsZGFKRXcrNzJzRUhjRTh4cEF1?=
 =?utf-8?B?QWp0NWZuU2x1U21TYWU3K09ZengvYVFVbEZWNWNCelVmQ3lKV216Y2xOQlJa?=
 =?utf-8?B?M2FoT1JKcmUrVlg4L20zL0RxVzczaWdpa0NheEF2bGNFdWJrN0NpTmsvT2tG?=
 =?utf-8?B?L3BuZG5EYWhDeG9KQVZkclZCS1dmTVNLOHVhdFJkR1dkNkJ1dUtRNWRTa3J3?=
 =?utf-8?B?N1o1ZlU5YmxSSm5YZ28zZnM4NWJqZGxyK3UrdGYxMUZVdXUwNys0L2FFZ2dQ?=
 =?utf-8?B?L0x5Wk4xc253NmNTMWI1MDh4L01xUVZYUFdIUHR2NHJ4bFNHS2hVLzRQdWhu?=
 =?utf-8?B?S0hCSGs5RlVKeFU0cFNyaHlaMTlpc01KODdWeG1idnF1Y1dWQ2FmT0ZnL2pR?=
 =?utf-8?B?TVlFYkdLZ0NHNlUrVTkwUXBXd0ZhQzM1WHFsRHMwL25lTUlZUExrZWVmZnc0?=
 =?utf-8?B?Y090QktDamlGdmlwOTVGL21YMFdYNFpvSmZPaVZxT29CZCtZREhsMjgyRytv?=
 =?utf-8?B?OVI2Q0pmelF6cys0elZKS1dCUy9VeGIwdUFHRkttMG1oYWJjdnc0OHh1bkNt?=
 =?utf-8?B?UFhKMFNoUm9kSEJzV3F4ZEFZcmZNNjRZejFKdWlOR1AwMWlwSTBNNzNXckty?=
 =?utf-8?B?dERjdWx3TEw3Z3ljVXRwODhyM20vMkFURHA2Zlhld2pBbk9uNVJaWGZxRnRF?=
 =?utf-8?B?Qmdqb3c2RWZaMk9lOWswdzBxejJwU0pRdlY5SG01K1VFWjI5akZVa25DaDQ5?=
 =?utf-8?B?VFhEU2QvL2dEbUVFVnNVaXZlU2Y1Z1Y1UlhvYUtaUkR3ZE5KSWg0UnNYeTdi?=
 =?utf-8?B?SkhsdFo1V3B5K0UyV1l1dGtwUkhUaUdGYzgzQTFVZnBXK2lWdUxnY1hhRlFn?=
 =?utf-8?B?WnZKUS9DV0VFTERFS2REUUk4OW9acUo4ci9uRFRneVF5Nng1c3Z0WlNyQXFJ?=
 =?utf-8?B?MmdvcFpHNXpZQ3JYK1JlM1kzMUE4ZjVPZHlmdXp6TlE0Nkx4dmZXL050WXZz?=
 =?utf-8?B?WDE1WWpxWllHbkpKWjJYcHZIa0p6MmdndUU4N2RGTi81ZTIzQ0R0c0N5cEMz?=
 =?utf-8?B?M2c2Qm81R2hQUTBUa2YzNkUyOVFOenZ6d0ZXaUlYMWxkWElPc0hNWUlPVHFW?=
 =?utf-8?B?NUZKVkZkZ0ZoWlJONnYvbVdwdWVjaWNoRVdQcGVwSG53Y2JhbWhNb3c3TjNB?=
 =?utf-8?B?T2RWSzE0R0I0L0NRc2ZvQnlkdE1URlFnNlBTakhMbHY0Q2thenYzeGtUV0hi?=
 =?utf-8?B?dUhZKzBqbk9rd1Zrcmd1RTZRVDRJUWx0U3pjUFd5TDJwdzhmKzQvenplK3pj?=
 =?utf-8?B?L1hZSFlrRWxncUhXanJhMWlpZGFPcFk0enlMVmFKcG9kbVhSKzJ1TWxHczBJ?=
 =?utf-8?B?S2RsZUR2Qm95UktCaldoRXRsRkhEU3ZTS0ZSRXVmcitKOWVLaHlrRUlnb2VF?=
 =?utf-8?B?VGJFVjNpUjA5MFRRclhpS0ZUMldDd091UUt5QXhuQjdoKzhoRm40azhlVHRh?=
 =?utf-8?B?b2xjenp2RXF5cVhrdUtZQVVWQ1NJMWVIaXUwUGIrWEkxVE5aVG1RNU13MnVE?=
 =?utf-8?B?LytsU2VvbjRRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGdjSllUS3BWa0orQmJNY05Bd0Q0UGNSbmNBbDRyZWx0a2Y1MGwveWI3eGNW?=
 =?utf-8?B?ZDFSUldFblVmWXEvT05HTFdXTTZYLzduR3hxNXRmd2NKNmZHWDJpeGdZamZJ?=
 =?utf-8?B?UitMZ1dtZk9FVUVFNkdDL1Z1bjZKd0IvTmJ3b1dadytVcmxPTU56YlhydGh1?=
 =?utf-8?B?dnlzUXJCWVRSYUNuY0U0Wi9XSlpqUHVmVzFBN0FvREg2WjJmcVdjU3VuUjcr?=
 =?utf-8?B?Vld5RllwUE9TWlg3ZmY0UkQwTFYrdXVJOXNXRitDMFlUajBVR3VEUGFkNFRE?=
 =?utf-8?B?UzZldHpWQ084dmZwQ1ZydE9CSkhORzh1VG84dytURmZ5M2VPNWxSM3lKNGNO?=
 =?utf-8?B?YU00VWdxenkwTWpWY2hvS2VVZFJpQ3dpUGlhZUdOYkVlSW5CQzQ4aE12MmxW?=
 =?utf-8?B?MkRlVkZhTk1ueTg4MTVJUk1DbFlMN2hwSXpzVVlsb1QxQ1ZkSkg4S1hid2xm?=
 =?utf-8?B?TVVJWDVFV1NZSndQNTY2VnlpcWhwWldldE1SNFJVZTdZN3lDSXlUdlFMOFIv?=
 =?utf-8?B?bTdaVHBpdjYzNDBzNGJvY29IUlM5QXNUVG12b3FEU0dkd3ZGRGhzdCtKbksv?=
 =?utf-8?B?S2JSTDFtWVBiR0s2RHp4WW92dG5XOGJKbU1ZN29nYkVKTWpXR0sxUGpMdnJG?=
 =?utf-8?B?K0I4c1RYa2VsaUVpS2pRSmNqV0o4dGtGd21XdVNDU2QwdW12Q2tiMVFDYUg2?=
 =?utf-8?B?YjhWQ0twVFBMK1VQUHJ4RGhPWDlvMVBBZWFuaGd2T2xNSDlJMEdXbWVDSng4?=
 =?utf-8?B?aVB3ZVNZRU1mb1VWMWNCWkF4VDFrQkYyVEVhUmtlY3dEVEFHSDhZcGt5aU94?=
 =?utf-8?B?OWVtNC9sdjJ5bWNnbjVRTlgxei9KVW4vQ1RoTHFCQ2RVQ2lIUE93WTF1MFVq?=
 =?utf-8?B?bnpkSm91QWFqdFFvNXRiT1hRL01VZ0VQUUJQNVFzbExvS1JVNHN6YkJyQXlJ?=
 =?utf-8?B?cVFjbVliWmRBbjJWdkp2S0xDRlFQUDE5QllKNUIvMzZoeVNxTExJVXJnU2dQ?=
 =?utf-8?B?T0JJOHZZSGZ4dEFTenI4dlVxU0ZyVHNvd29jajJDY2htQy9YWlpaU1pkM0s3?=
 =?utf-8?B?V1YyZzZYVyt1L0IwTUFEMlVYTlhST1lLWER0RlVwaE01THVuQ2U4TjJrSFV0?=
 =?utf-8?B?Q21qK2grdEFEYzdmK3FzaFE4eEwvL2dXR3U4VXVLdXlmNUNWcXh3eU5EWmFM?=
 =?utf-8?B?bytuN2l3Um1DRWIrNjRkcFI2UHlOQzcyNVpWV2J1VERSV0huNlRKTDJ6a0pn?=
 =?utf-8?B?R3pITDNpUXdIYWdqaDRhaS9ZdzRYeUFHTGJYQUkyT1JUOFQwREVlTGljZFlp?=
 =?utf-8?B?VE5TYXh2YzB6cUJPR2FaVTdmZmQvUDRoUk9zWUhIYVVjcWNnZEVKT0tMUSsz?=
 =?utf-8?B?VE1YR2djazI5MXhvL1kzZm9LOTNPK2dGeE5BZExDbXlIRDJkUGVjNWhVOGMz?=
 =?utf-8?B?K1BFQ0VZUXpYQjlmQmF6bUZ0RHRnTStQeXJNVVA1anRFdTFDSFE1cTlLQkN0?=
 =?utf-8?B?SjZwSXUxSk01NU14VjZteVRESkFQczRiZGkrZzUyZWlyNE9DUDU2V1ZockFC?=
 =?utf-8?B?aWpyOG5tVmJLU0NTZ2Jrbm5lblZ2eGtJVERJeGFOUlFIbjFNNGgzQmFoU2lR?=
 =?utf-8?B?WHg2Qnh5aGUxYmRWS3NpblVXS2pzaytoRWpjR3FSMTdiWEJwNmFMYTVjMEVQ?=
 =?utf-8?B?MGc2VUJQRXB6NSsyM3RUeEJqMVU5TDBIZE1uSHppb0JvVGF2QWkxQm93VnFY?=
 =?utf-8?B?aTY1S2cyTE9Teitzekh3V0ZHV3c3Ky94ZkcvTWlYbnNHT2g5NlRLSmF3V2FE?=
 =?utf-8?B?Qjl1Z2w0em5jakkyZ3hLUFp6K1JGS0FIbDVESEJKZXRDOWNRc21nZUFsVWhW?=
 =?utf-8?B?TjBZRm1pdlhOS3hreGhGekJ3dUVtQkNMZ0tTWlJFalI2THorcE5DTFcvSm8z?=
 =?utf-8?B?U3JtRWlBbi9XeHhCZ1B1ZHZYeGZsSFl5L3dPR0RIUitEbFNSaUVJQ2dhU1lS?=
 =?utf-8?B?S2pjUHUzelZyOWc0K2gwdVNHTFJJQ2lVMVlkSGd1SHN3aWNMMVVEWGhDeFF0?=
 =?utf-8?B?N2t4K3BjSThMRVUwWmIwRm53QlMwWDdzUi9mOGFTZldaSkJNcUdLMHRyaFJF?=
 =?utf-8?Q?AN/fGP9sOpF10Z1ieXot2ffsW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba04b4c8-9bae-4610-4879-08de102b1aa4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 22:50:45.1407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZGBcb/Ylp5tkk91Eqt+5MZbTdVUNo2BaY7HFdC2nlvLYPxJWcMGFPLHaG/C9lFe+49n2ciFZNW9ItSoVhRcwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7662
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

On 10/16/25 12:39 PM, John Hubbard wrote:
> On 10/16/25 12:34 PM, Danilo Krummrich wrote:
>> On Thu Oct 16, 2025 at 9:28 PM CEST, Joel Fernandes wrote:
>>>> On Oct 16, 2025, at 1:48 PM, Yury Norov <yury.norov@gmail.com> wrote:
>>>> ﻿On Thu, Oct 16, 2025 at 11:13:21AM -0400, Joel Fernandes wrote:
> ...
>> While I'm not super opinionated for general bitfields, for the register!()
>> infrastructure I very much prefer the hi:lo notation, as this is the common
>> notation in datasheets and TRMs.
>>
>> However, if we use hi:lo, we should use it decending, i.e.:
(restored from the email thread):

	bitfield! {
	    struct ControlReg {
	        7:5 state as u8 => State;
	        3:0 mode as u8 ?=> Mode;
	    }
	}>>
> 
> Sure, descending works.

Oops! I need to correct myself. After reviewing most of Joel Fernandes'
latest patchset ([PATCH 0/7] Pre-requisite patches for mm and irq in
nova-core) [1], I remember that the HW documentation is written in
ascending order.

For one example (out of countless hundreds or thousands), please see [2].
Considering that I actually pushed this file up to github just a few
years ago, it's rather silly of me to forget this basic truth. :)

We really want to stay close to the HW documentation, and so, all other
things being (nearly) equal, this means that we should prefer ascending
field order, if that's OK with everyone.


[1] https://lore.kernel.org/20251020185539.49986-1-joelagnelf@nvidia.com
[2] https://github.com/NVIDIA/open-gpu-doc/blob/master/manuals/ampere/ga102/dev_ce.ref.txt

thanks,
-- 
John Hubbard

