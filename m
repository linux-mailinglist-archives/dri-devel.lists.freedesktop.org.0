Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6296ACAE9D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 15:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC04110E522;
	Mon,  2 Jun 2025 13:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="H9r2vgVn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2065.outbound.protection.outlook.com [40.107.100.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC99C10E522;
 Mon,  2 Jun 2025 13:09:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5x+7l3lCBrnLjkV3bJWE8as3+FdnwSDvTB3UKCLvgRMTCVsmny1Olc1Aa5pl667AjyssJEpUPfTVWq0xLKdeKOFxFp3X+mWxgU8mzt91SyrZK0k8bNsCeCcvQmAyEqYRHP3QobJl+YWxSoLcQFQGvwWDxJyQfi4c5cxi4joFdEs8FR78Dk6i//OoTWTnG48rRP0te7E9pSNibr/CkKprt3i974gMzkMgdGysfImAf7o4GETBvrMz63dIwEEkOiymGqNhs+9J7gwzvnS7NhxKBS5qK2/HBQGkvZDvBT1dzcJmnTkiOYHHfG2ZCWBN65WsbDFSPJM41w1ngSZKScZMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TyY+odJSqDnPAT9RxDbwH02wyrjrnMqUGm1rhVmyrs=;
 b=zCzXTwo89G4G7rDCgnTYwiv1GIm0TZd2bRQ0QKBOtkGvKBhS5HMTtdnY4YQFd36pBbzdScRhXBrG7pNAG0pvETL0OB9HsmAyCvdgR+4xk6zH+M7uFxZ8LVC5RegNw5cS3oHWcwkPrIlnHPKQJyCj+fN5kcQkt7vxQqWhZRkVJmoUSJRCWmtHqQtK0am+sGb1rgGtL4K9rRaxlQ3XJa9r/qsqZoAC9MSrByxOPO3rgTm9tEwrUr5RGn7xta+8qrf4rvIZAyoZDYxP6v5WjSpeB+hRtoUEnqZ1qhXGtD8fxqFg+veF4IeGB0rgoboDHtKj6W+yiMpmz7Tq813UWL5OQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TyY+odJSqDnPAT9RxDbwH02wyrjrnMqUGm1rhVmyrs=;
 b=H9r2vgVnox1xidPArMGTARzCFj6km/ZEhbGGJ+bCJmvOykN3P/JGRI2czQoA4qjsGFir/VZ684Hcg1wfLvGfcnpfukhrkp5EeTbWZurJJe6K1L9BGB2PiLtG7wb7Ji+kBevzMYFYqTrGfGR8jHeGTSV2AsaAaALPm6//IznehS8VdpxhGfsJJs9iD2bbxe3yPdILeq8H1W6k0CU3RPrjEPH2sFbaDJ5E3nPasLNb74fozUZEPRK6GJvcvg+m13HjHlo8leonI2MMahl4sI862iLM031HmlBU+7T7+kZ8TD9C8Yl+hC8ti6v51+nS44ghn98qCmHoL/uoU0rff+nUBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PPF1D04084C7.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bca) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 2 Jun
 2025 13:09:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 13:09:20 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Jun 2025 22:09:16 +0900
Message-Id: <DAC2L6ZKR6U2.WOMERUJIOENK@nvidia.com>
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
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
 <DA82KFLNAOG7.R7YT4BHCLNZQ@kernel.org>
 <DA88YHU4AZT7.B8JGZHW9P9L9@nvidia.com>
 <DA8GTD7LT7KO.1A3LBQGEQTCEW@kernel.org>
In-Reply-To: <DA8GTD7LT7KO.1A3LBQGEQTCEW@kernel.org>
X-ClientProxiedBy: TYCP286CA0069.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PPF1D04084C7:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e11ceae-7a41-4e1e-dd79-08dda1d6afbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mm01YjY3SGd6TWxEVnFZT1ZkTjZKY2FsQ2dodmpXTDdTcFlBY1ZJVG5BRHor?=
 =?utf-8?B?cHdpdldzUVBxdXpWSkI2Z0IyRllNajRpL3dxYVQ5Yll3ZEdtaWVjRXF2Rk1C?=
 =?utf-8?B?NTI0TE5LMndIZmFRWWZseERja2tNRU1OOTFlbi9EcjJIZ1ZCY2xOZ01IRkw4?=
 =?utf-8?B?YzdaajYzeUV6OURxVUsvTURVdUJPSjd5TnpEZy9vcWc0YlRhZDFHejJaUDlD?=
 =?utf-8?B?aWVzL1hFdU9OMHNPYjRkcDVhRkNoRS9Nc2VGQm9lSW9jdWk3V3VTRS8wMjR6?=
 =?utf-8?B?QkQzU3VCQ3NHZkE5QnhNWVZSYWFsK0o1TE0yU0lWTldvY3diNFhDRW84bHZk?=
 =?utf-8?B?TDduMi9ZWkl5VlJxWkV6UGV6VWtQWW1zUzcxa0tEUUVlWTRmazhTYVQvOFBV?=
 =?utf-8?B?c1EzSmoySjBmSjZzOTRzdUJoY3dGZ0VIcUJNbVg5YWM1Z2dNd2Z4Qmp3Y2pl?=
 =?utf-8?B?Y3VCeVN1cktrNU1WYlBjemlKZXBRSWQ3Tmh5K0szZFhNenRzYkE5TFArTm12?=
 =?utf-8?B?YmluS1AxZ1dJdmlaL0l3Z0U2Zkx5M2xRa3ltMk52NzRLa2YxanZidTlWbk9L?=
 =?utf-8?B?bVd6T1RZdnFqMEVxK0lqcWV2bXFSVU02Y3NTenRzWDBtaTZwVjJOM0JtR244?=
 =?utf-8?B?SUVhNGc0L0dWUVliNkx5MFZCSTdSODVuN1UxUkpvNWg0cXdlWXZzY1NUbWkw?=
 =?utf-8?B?cktYN0FFemk1NW9OZ2tGaG5mMlNqOGdxYkhTakJYTE5QTEpGaFdVWmVSU1Vl?=
 =?utf-8?B?R2pTd083bjBIbjYyUHlaS0xrMnV4M0ZQeXZvdEh5dkVxNGlGSGdyeVZaU3Zw?=
 =?utf-8?B?dHVHUWxFaVRFdHQ0ZU4wMy9zYmswS0gvSzR0OXJnZ1p1RG9LeTVPT0RnY3Vw?=
 =?utf-8?B?RmpuTWNTdGwxcGZHMlNPdVdERW1CdWgvcGFaVGwxM3ZzazNXbFhPNjJETHNN?=
 =?utf-8?B?QXJtS2VGZDBGYzdkdWJCVFVDNHpyK3hoczB1NjBDZDFKMjVZWEpWYm9nYktH?=
 =?utf-8?B?L0toaXBSNlhzbVZZSHA0NzArc3U1cTRsUjFhM2ZSYWs2YXA1SmUwdU1pYjBD?=
 =?utf-8?B?dlhYK05XWGtoVWN6Q01OdkFHc0dmNy9qUkU2TmJ1SG1Nb0RZNVhDVEhKdkxO?=
 =?utf-8?B?SmZMb254QXcwWmJ2b2t4a2FPUVR0QUFRWHpzZlhBWHhoeEFPbkRUQi9GdVRa?=
 =?utf-8?B?czhvWWZqZU9SNHVUQnU1Z1J3NVMrMFVEOEV6MUtqVzJhY0lnUXZDT3hncFRs?=
 =?utf-8?B?YUk4RzVnRElQWGlIdE5rRkJyQjArUkI0ZjF2SzFmWVJVUjkwN0lhajFJRFFs?=
 =?utf-8?B?NEFvNWM2STRBRlUrN21WamRSM2gxS09JUHpEYUErNlVxdWQzNEhwWDRQNFY4?=
 =?utf-8?B?eUVOeUhPbjhVVnBaZGlIOFMvTVhHdVpvdUN5OFI3eTZXTXB4bFpoMjdxVlZa?=
 =?utf-8?B?MFRrNCtqNVdObG4ranR3WiswdFcwK1ltbHRvNTNOYjIrdEFSRFlKMHF6RkpF?=
 =?utf-8?B?U08zcVpMalF2N0pXOVZZQW5SajlwbFZLK2NZN3o5S1FYWnNFU1lKR09xRU5D?=
 =?utf-8?B?TFZtUnFpbW9GL2xsOWkwNk9aYWRYbE5EVjRaNEV5dVE1ZDBVTFZtYS9oZ0NU?=
 =?utf-8?B?Um5MWWd6UUNIc29qaFZlc3FQSjN1WUtaTlJZUHYxdkVoUnNEMjgwelBraTJz?=
 =?utf-8?B?RTlrQ1NqOXJCTjV3UVB4MzZvb3RkQSsxU1pLUVVyUUIvRU9aSFgzQkNqNUNr?=
 =?utf-8?B?a05GeFRZUmF2dzNFWTUwaE5tenpjb3cwMkxadFhMeDc3NEtGQ3piTUpCdk5N?=
 =?utf-8?B?bUszZkxSdHpUZXVKSlpnRURZdFJYcnpXQmFOQ3ExMnJnem9oNmdkUjZjWWFO?=
 =?utf-8?B?ZWVCbWRGNmdmVUg5SG1qZ0JZaisybVdpUXNFdEpaUjNVY2RyMGlSNm81dHpN?=
 =?utf-8?B?UFhaVUJxbFgybW5rYVBaLzJxQjB4VG0rUTFIdkhWMDUzQ0FGekFmQmRJd09q?=
 =?utf-8?B?NXNGUktpR2lRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UitpSGQ4UGd3dnFZdjJINkRFKzU1dXk1UkJZYW1IcHJBZHI1d1BnQXIzRnVa?=
 =?utf-8?B?TFIwcUFSQU1lQlNYbUpHemZEblZOTU9BdnFDTzdSMHZ5dTFHaldEVE1DeFlw?=
 =?utf-8?B?ZTVxVkkzK0xTY2c4dE42SnhNbzJwRmpaeHlUM3NZYjRtMFl6anBXcFltS1R3?=
 =?utf-8?B?a3JlTnlJSXRUQS90RUVRZkRBWWxzZG85SitXVnptb1JzNTlSU2N1VGJwRDVj?=
 =?utf-8?B?SU1TSUFHeHBmODNQc3E3WUNIZWwvbDZwb01aWE8ycWpuaTVXNWFwRUxqaXJn?=
 =?utf-8?B?WXVaWWIreUp1UThmVXBGbDV0Z2pvQlZTbUF1cjd1NHFUVkNCUkdTVlh1VWp3?=
 =?utf-8?B?d3hTeUxLVWZ1dnIxL1FodWJQbEJhRkdkeEI0bXRuSUoxblE0ditBYlRZd0g2?=
 =?utf-8?B?dEg5Y2x5N2N2eEZiR1JMbTJlY3J0ejNUMFkzMUNibk5FSXNid2Q0VklVYy9Z?=
 =?utf-8?B?WE1MU3hnVWlJclFtRitCTHFmS2pQdWtvbVphYklkRHV1dWZqN1NDYXNDT2dx?=
 =?utf-8?B?b2dEdjNyYUtENUFWYkFjRFFwdWVsUnRadWs2endENEN6VThRS1VZTjNidVFR?=
 =?utf-8?B?NFpOS2NhMGI5TXZjZk9qb3pvWFRuY1poQWhVM3FkcG1PUkpDWkw5ejlhOW5T?=
 =?utf-8?B?bTlsVFB3ZjAvQjc3ZCt6eW1oeFhlaHZzekxnVGYxQXJRckZlRXIxUFhsQi9u?=
 =?utf-8?B?SDZMcWdFVDR3Q1p6THQ1VXBoTXBiREpJbGFWRi9XVmN1MzJuWmoyREdHanUw?=
 =?utf-8?B?U2FNUFBaKzNhMnZQUTg5ZEpZUzZOZ3JyQ0xvbzB2ZTVPZndkRmlCOGd4L2xQ?=
 =?utf-8?B?Z1ovMHNHZEgrWFZ1Tys2eG9CU1BaWTAzSjRaeWJVOHZBK0xUSFA2U3Zvd3lL?=
 =?utf-8?B?RFA4MlhWYS9rT0hmKzhlV2RzM3kwbU1qZ1VPUkk4RFNISC9mdWJocmtWSXkz?=
 =?utf-8?B?ZXZBSElwTTBRNGlORWN6OEtZWjhwWkVpcGFrR2NCUFMzaVRiV25YcW5iUW4z?=
 =?utf-8?B?TnRsYTU4cS9NYUxielg2cDJJckVCd2U3OFNYNGkxemJhaENqSnNUOHNoVENP?=
 =?utf-8?B?VlFnMDJ3akFWbGZRMXdyWC9TaER4L3lqenJyRVM0TDBtUUdXWmV6b1hKQkRs?=
 =?utf-8?B?Z2ZUUnNhZ1g4WEVXU0xZZGRremxLKzNEeEIxL0p1QWlxbi9TSjdoUDc4MHl6?=
 =?utf-8?B?S00zenFZNGJkRVg3ZkRacVViUW9GS3Z1YVFYbTRmcnpOMVFlTHRtSmc3ZDRo?=
 =?utf-8?B?dThzV3REN0JselNPUzJ2K2Nvc0FuNDA3VnlCOTJ5TkljVmx1MWFoSndYMFAv?=
 =?utf-8?B?ZTNNTEtHaW9rc2lNZVVZUkJMaURtQVNkZE9BTnZHcUNNSkJjZ2oxS0tKL1c5?=
 =?utf-8?B?eFJ5enNYdDJ0dnkzSFZCOCtDNWNmN21WcU5WVzZ2bGtNZCtRYk5HeEdpYTVr?=
 =?utf-8?B?b29JT09UYWk3WXd5VG9BNzhMZUVkWnJCdGluK0MwNEVGVWJpelA5L2dKRUFH?=
 =?utf-8?B?bmxITU81SVd0TDlYV2M1WENnMElhQzMwSW5vRk94cGVzRmRxdkFIVWtzM0xG?=
 =?utf-8?B?dnRoYndaeW96MVlTYklFTTQ3UCtXTG5ja3FYZXVRaXhUTlBpMWM5OXp1RjVJ?=
 =?utf-8?B?Q1YwQmkwR3Mva1ZNZDk1anlMTUhpeE5TV2lraS82OHVxSlE4UDlmYmIxU0Mx?=
 =?utf-8?B?SmVRWnlUSGNXSmZRaDlzbjJuUWdSWXhmZHRMMDhYREhIVnZvNFNkZ0dFVVkw?=
 =?utf-8?B?ckhRb3NmdDVIblZnb3JZN0R3OFZhSHlqVnZWVURYbUhZOUpRWit4ZEs3VTJF?=
 =?utf-8?B?TzdRaVRyUzBCVXFULytoRWQwMUdHaWFOeFpUZWtjbUUwVTJyZDkxNU9tY01X?=
 =?utf-8?B?Y0lWTUFKWk9uZkdKUHZpVWFFUDdKWCsrck44bVNFVTRyc2lHQjdzcDZaaXpi?=
 =?utf-8?B?eFJqV0VIVjV1emNXV3cyQ2JuenpxZndheDZIekRjLzlGNk1FQUp2WlI0cjU0?=
 =?utf-8?B?NHF4M0tPaWxCY3BydE80YStrK3l5Wm9QQUxueUVlTk9PMlZOcHF1UmVsMzhK?=
 =?utf-8?B?NjkyaFBEeU1MMzU0c0U2dEJHWXJOUUFhUVpNSXNsMXlNMkV0NGxtSzlBVkN2?=
 =?utf-8?B?bFBpTnpZMTM1eXZYZ3RFTEV6RHd6RXVQS2cybTNidWJ1R2xCeERhcWtTYlBu?=
 =?utf-8?Q?AsWlkfLH5uKV8K5MYID15EHWKmOa1YFsbIRHZXuqd03q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e11ceae-7a41-4e1e-dd79-08dda1d6afbd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 13:09:20.2848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Q0Rl+dgyDcLdqW+YXAnWhvin2ZxqL0573gsZtL1iKTEauSix0ps5tmZhXH38ScGCXIvGz/bEz5UsWmP39RUPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF1D04084C7
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

On Thu May 29, 2025 at 4:27 PM JST, Benno Lossin wrote:
> On Thu May 29, 2025 at 3:18 AM CEST, Alexandre Courbot wrote:
>> On Thu May 29, 2025 at 5:17 AM JST, Benno Lossin wrote:
>>> On Wed May 21, 2025 at 8:44 AM CEST, Alexandre Courbot wrote:
>>>> Introduce the `num` module, featuring the `NumExt` extension trait
>>>> that expands unsigned integers with useful operations for the kernel.
>>>>
>>>> These are to be used by the nova-core driver, but they are so ubiquito=
us
>>>> that other drivers should be able to take advantage of them as well.
>>>>
>>>> The currently implemented operations are:
>>>>
>>>> - align_down()
>>>> - align_up()
>>>> - fls()
>>>>
>>>> But this trait is expected to be expanded further.
>>>>
>>>> `NumExt` is on unsigned types using a macro. An approach using another
>>>> trait constrained by the operator traits that we need (`Add`, `Sub`,
>>>> etc) was also considered, but had to be dropped as we need to use
>>>> wrapping operations, which are not provided by any trait.
>>>>
>>>> Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
>>>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>>> ---
>>>>  rust/kernel/lib.rs |  1 +
>>>>  rust/kernel/num.rs | 82 +++++++++++++++++++++++++++++++++++++++++++++=
+++++++++
>>>>  2 files changed, 83 insertions(+)
>>>
>>> Have you proposed `align_down` to upstream rust? Not saying that we
>>> shouldn't do it here, but if we haven't tried yet, it might be a good
>>> idea to just get them upstreamed. (if you do, it should probably be
>>> named `prev_multiple_of`)
>>
>> I haven't yet - haven't ever contributed anything to upstream Rust, so
>> I'll have to look that one up first. :) But I agree a `prev_multiple_of`
>> could be useful.
>
> I'd recommend opening a thread on Zulip before you go implement stuff.
> Then you can also get a more rusty name for `fls` :)
>
>>>> +    /// Align `self` up to `alignment`.
>>>> +    ///
>>>> +    /// `alignment` must be a power of 2 for accurate results.
>>>> +    ///
>>>> +    /// Wraps around to `0` if the requested alignment pushes the res=
ult above the type's limits.
>>>> +    ///
>>>> +    /// # Examples
>>>> +    ///
>>>> +    /// ```
>>>> +    /// use kernel::num::NumExt;
>>>> +    ///
>>>> +    /// assert_eq!(0x4fffu32.align_up(0x1000), 0x5000);
>>>> +    /// assert_eq!(0x4000u32.align_up(0x1000), 0x4000);
>>>> +    /// assert_eq!(0x0u32.align_up(0x1000), 0x0);
>>>> +    /// assert_eq!(0xffffu16.align_up(0x100), 0x0);
>>>> +    /// assert_eq!(0x4fffu32.align_up(0x0), 0x0);
>>>> +    /// ```
>>>> +    fn align_up(self, alignment: Self) -> Self;
>>>
>>> Isn't this `next_multiple_of` [1] (it also allows non power of 2
>>> inputs).
>>>
>>> [1]: https://doc.rust-lang.org/std/primitive.u32.html#method.next_multi=
ple_of
>>
>> It is, however the fact that `next_multiple_of` works with non powers of
>> two also means it needs to perform a modulo operation. That operation
>> might well be optimized away by the compiler, but ACAICT we have no way
>> of proving it will always be the case, hence the always-optimal
>> implementation here.
>
> When you use a power of 2 constant, then I'm very sure that it will get
> optimized [1]. Even with non-powers of 2, you don't get a division [2].
> If you find some code that is not optimized, then sure add a custom
> function.
>
> [1]: https://godbolt.org/z/57M9e36T3
> [2]: https://godbolt.org/z/9P4P8zExh

That's impressive and would definitely work well with a constant. But
when the value is not known at compile-time, the division does occur
unfortunately: https://godbolt.org/z/WK1bPMeEx

So I think we will still need a kernel-optimized version of these
alignment functions.

>
>> Also in the kernel we tend to use the `align` nomenclature and I think w=
e
>> should preserve that for clarity.
>
> That's also fair, but we lose the constness of `next_multiple_of`, so
> you can't use `align_up` in a const function. That might confuse people
> and then they write their own const helper function... I'd prefer we use
> all functions that are available in the stdlib.

We definitely want const variants of these, one way or the other (const
methods in traits are not available yet unfortunately). And yes, on
principle I am aligned (haha) with using stdlib functions when possible.
