Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD58C1736C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 23:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC08810E693;
	Tue, 28 Oct 2025 22:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="J3FTcXLu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012054.outbound.protection.outlook.com
 [40.93.195.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E5D10E692;
 Tue, 28 Oct 2025 22:40:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+wXyf/46XLgBEW6WOV7bPVHkt2RIzjVX/TcDFZuVMjDGshiiA0JBpgvuQ8nUELdveZoJRHM7Sak3dtx2ETommxtHqZ6mWcpRIFiIvf2MXncf71BsGan921REquxzuxmJ7zBohH3nawKON/qdafxulATpMefAdqmcyPGiDhRLO4vwqWHbFlU6e2D1sVlgkgvAxi+5zEbvFfzEW/n6dHKTtjjYct+4t+Yt7o87S30fVDHS+oeNmLv0tV5AbSBNQ/IWz5QIVrD1WVaGpkEkPnkgdXrhEVudIXjrMP8AVw5BSEZNXLy5iPQ1DMuMYusGb2gm3YomHXNT21YQqVgYpZOsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4GgA/jW/3AALWk/lt46Iu4GQJIynFV0u3+g5EbTsQc=;
 b=cOLbTgSUbw6eDK4lMm6CikINXzgyTgSruS4K+yB7Y4GGk6zzZDyb+kE4DeSd6lyVZJoNlDB7fubtbSaQKcj21ZRTlz4BgTRzCF1XCTeNHeYYE1DARD4DmqcxullMq/lMgLmHsWVV4md7NRqvmsy3jysbbSE4Dc8+U5prpehuPdfZtUuO6l78sTcL92b3k3boUdoY11pIyXwLvysM8Vh1B62wpQrp3ax0cA+JWubH+dIK2cZr3tQ4hGw6rpMFDbQvsBVQqCsCnT6YXL+r5MICCj3ut/RbRpoh7XoVmbWxfxGdj1PfvBNurt/N2w1sQtfE03SpZdX0W+nDRRT2fBEV7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4GgA/jW/3AALWk/lt46Iu4GQJIynFV0u3+g5EbTsQc=;
 b=J3FTcXLuhqhKhSJw5zo9C7JqGxhfVv/xG3kUkujIaMDfLHmKwAkHXuOKFt9IPuB+6EvB1CjLOYvzLcYrECDaVukyBp27zgTjh3GZbELY/95YHYFDKSvEkaQt1LQLrervaNE2/fjh6StVsiJI6jf9GMN44QQzsMQZhPEl/SFcTfqBUp0DrF4OKAu0c0mytNh0w3UJaQ8ezIGkUI5OhofUAJUNGnqctBuiBjVT0aut+HdRlnjkb/vzVW12wk2YxJE6bBRFSIe3nLVvKb8nnp66IV4WkmDu2YehhHEiK/dbEpEVsnO60e2IiWwqt3kMSxWqUodNoM+ck9vXrFHVQklAyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by SA0PR12MB4480.namprd12.prod.outlook.com (2603:10b6:806:99::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Tue, 28 Oct
 2025 22:40:08 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 22:40:08 +0000
Message-ID: <69ef237f-547e-42e3-af8c-63e698c7d05d@nvidia.com>
Date: Tue, 28 Oct 2025 15:40:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] gpu: nova-core: add extra conversion functions and
 traits
To: Alexandre Courbot <acourbot@nvidia.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
 <20251026-nova-as-v1-5-60c78726462d@nvidia.com>
 <CANiq72mgoW_TyWf9Nv=5t3Qij_dsDjicNpGsa=F1t+sg23vxSA@mail.gmail.com>
 <de796658-ed1d-41f1-b153-f3d1089656ba@nvidia.com>
 <DDU1AQDW78QI.1CBHEW03926H0@nvidia.com>
 <1772ce29-c84c-42b3-8c77-e92355fbee53@nvidia.com>
 <DDUB9FJY8IRH.1M5GHVSOFCR3Q@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DDUB9FJY8IRH.1M5GHVSOFCR3Q@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0134.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::19) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|SA0PR12MB4480:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d849b32-300d-4534-9fbb-08de1672f2ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmlIcThYS0lhWTFkSlhzQzA4b0lxYVBEMEJjb1BiYmc1RlJVWmgyK2hST3N6?=
 =?utf-8?B?TVVDdmxIRWZ4TkRON2V4Z0c4SkhIMHo0a3BoMXFOcXBiUnFER0F4ZmNIN0ls?=
 =?utf-8?B?NXk3OUIzcG40aHRBellNWlJSVlNFZzBBTWZWY2tRQzlEbHQ3YzRkNEZpVisz?=
 =?utf-8?B?WnJBT0FSS0VTSXN0NGc0dzZSMVNnb0xrRElERDMyaXRSeHBkWGVXbWlpbEpB?=
 =?utf-8?B?MGlnZ0ovd1VSNjd2SUowSVBSdCtzdDhock01V0Z0UFZ0a2cvTkVkdWhUL0N5?=
 =?utf-8?B?YmRMeXo4dEIxaks0aGlETHh0RzZ6a3o4WDRmdjhtenVzL1dvdE1FMmNZcHd5?=
 =?utf-8?B?bjJmWjF0Z1RnSTVDczhDRVFPNzYyNTR1K1cvT3RHYlVkWTEzaUM2MGNuWUZi?=
 =?utf-8?B?aGtQM0ZFRTcyd0ZydWU2V1h6N25KRW9UMDZGY2xSTWd6Z0QrSXduZWJ1VEtM?=
 =?utf-8?B?Vi9HcStVaXpZQ2hUeCt1bzJvYVFOVGh6c3RibnMyS0RxS0xUaXByUkpES25i?=
 =?utf-8?B?cVVuVWVON2IyTmtwZEllM2Z3VnFlUm1KbnRiR0VSVzlpQUpsMVJGUGU1akFp?=
 =?utf-8?B?SHo2TCs4V0pDRk5ndHVEMTc4bDBYTSt6cFB3SG1LNm5SNEdrMWFpUU1ZR2po?=
 =?utf-8?B?VVdiRzFjeUYwYUdZalF2V3pWWldYNWpWS210QzBrY3dKUnhxZ05la3g0RlM0?=
 =?utf-8?B?OGhXN0lYcXUwYkR1U0JXQnlDQ1dkRDR4SDlCZExnUGhrNjRrUFdiTmRrRC8x?=
 =?utf-8?B?WU15YXh0clg2YXQwL0o5ZmFyZG45Tlc1aGdHNWNaK3NuNWE2MG1pczRuTHVR?=
 =?utf-8?B?TklHekw1bEdBeCszYzVBOVhzN05Pb2k0aWRGYWdEZVgwRS9uL1Jna1lweTNB?=
 =?utf-8?B?emNqUUVsNll6d09TWC9YQ2o0NGJIU1RiZ28zdlVOYW9CbXlCZktUelQraTUx?=
 =?utf-8?B?WUh6VlV6T1hFVzVLbU1ENWxNVUJzZDhXQTFRQzRHRjI2UDVpYzZNQm9tTFEx?=
 =?utf-8?B?OWpXL2pJMUhMN3JhWDg5eUt1eEtzdmdxb1lqSldyUG1zb0NIcVVidXpNOU9F?=
 =?utf-8?B?SStwU0ZzSXRQWnpib1RWbTQyMjFZZGhKZlkrcGJCckxwcDgwbC80Wnk4S1Ny?=
 =?utf-8?B?bXhzZzlxYjBEZnVFWU1OTlptdlZnVm9RTGF3bUo5M1BENHBxQlptMnJDU2NR?=
 =?utf-8?B?VVdpRVR5T0xEajN6c0N4elh5MmE0TUU1YWJGL3FuVlVZQzlza3NXQW50aVps?=
 =?utf-8?B?MTNJV3hYUG5RQk5sTWVIMjRKV200Z2huZ3JyeGdKQ3VoblFheWxSTk5MdXVP?=
 =?utf-8?B?NU9YdFgwR2oxU0F4cCt6OFZtUGFXaDBoempUV1l5UTNBN1VXMmZQTE82QS9Q?=
 =?utf-8?B?YzkyT3JNZVRGS3EwRlVHQk81dUdWWHhNYUlXRC8rWXFBaGpPS2ZvNGV1Ukp6?=
 =?utf-8?B?czErU2xuSVNTSUJKWnk1NHNJNDZXM0QxR3ZrVDBCdnhac3lQMUwyTWdwbGVR?=
 =?utf-8?B?SnV1REp5Y25iaFlqRDBpVXp2VmpsMXE2Ui8zUWptSkRrVmdLRThpbERZTjdr?=
 =?utf-8?B?T0R3YURlSDBnWnFxNVY2T3M5R2Z1VGo1UnFWR0VYZVVXT0NCMXhORTBQV01v?=
 =?utf-8?B?NDNYZ05ZTUNZcEw0Mm9kQVRtWm01T2Q2RHVUckRES0daWGROMlBRSTMwRm1G?=
 =?utf-8?B?dWxZTHZEOUlnWFZ3TWtqakR3M25mZjlqakQyaHVzKzlESHdDeUVtQ2ZpcDZB?=
 =?utf-8?B?Q1ZFeTBWb0dPS1dCMU9HVGZNTlNvM2x2SXYrcEFuZTcxdUI1TlFwZndNYTU2?=
 =?utf-8?B?OWVCd0lveTlCTUc0T082Vm1IWTRIRnBuNVhyOEVHOWkrbTc4dFRlMGk3QmJx?=
 =?utf-8?B?ZjU1UEV5b3k1RWYydGFQVWlla1pGaUppWnNkaWlOSFdvMEw0MXNTRUN3ZVIx?=
 =?utf-8?Q?fM5w36fhSY8wR2br4hUZmguk7G6HfC7y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjM4TVJTUUhTcjlMR3Z3SjkzRnIyYVIrS0tUN3hTWk5IL0ZIak1qRnJvV3Fa?=
 =?utf-8?B?NWZ4RDFNTTVkdnVtdTR5M3RaVGhTQ0VXeFIvV1ljbHBJVVdJeXU5UmJaQ0hz?=
 =?utf-8?B?a3NPSFZ5ZUcxaXovRFFldGpaZUxuREI5Slo0Sm1jaWZyK0h6bHhReGU3VzlI?=
 =?utf-8?B?U2V1b0hFcFQxdEpQWTFIS21IV0VEbFRyV0JrSFJhclUrNFVaZ3lPY2FXUEVp?=
 =?utf-8?B?VEpZSGh0d08wbWEwOXZzUXREeHBoSmVjeHRhVVY2L01ncFhEMmVDUXRoN2Q3?=
 =?utf-8?B?R0R3QnRqUnFJQkhoOTVZNUYrQnJaVGpDT1JsckNEcWV1VlI3cDdOckFFakF2?=
 =?utf-8?B?YmV3YVpueEZVZk5saG8xazlPMVgwR0RqcGZvM3lFaXRwMmxWMnFJNGVVdnEz?=
 =?utf-8?B?c1dtdXg1M1lrTU1uOXZwSVErTUltUi9CUGtEcVBvWnRNYyt4czBSRlRJM2Vj?=
 =?utf-8?B?eGRkbWk4VC95Z2M2S2RidUxoOGZyRDNZRWlGNmRMemt5QTBGN002RS9QVDZD?=
 =?utf-8?B?VUc0R1ZwaTUrcnR3UVU4dWVUdW1tekliTGdRSDR5bGUwbVl0OE9aQWtHODN3?=
 =?utf-8?B?aXpsUGRIZzdINDMrRWFGWGQxcUllelFBWDM4MGlVZlF2SHh4S0N2b0xLN3lj?=
 =?utf-8?B?a0JVVlJWeW5BTnVKYm5UeUpNdlBOQUdEbW9zVk9BZE9xdWtCeFVDQndGbmxl?=
 =?utf-8?B?WExreTgzVXg2MUl6RmNvV1AwSG03TE1GYmR2V2dDOXE1eGZiWjJMS05JWlNQ?=
 =?utf-8?B?Q3c0UmNYV3FxU3phQnFyenI1Ty9lM01xQVBteHYxMDN6RzE5TUNFM1pxeU4r?=
 =?utf-8?B?UUt0UDExdUk2UnNjVStOQmtRcFE4RGwxd05UUnQxQlhJMDFkQlo1bkxrb1VM?=
 =?utf-8?B?YTZtOUdZU2N0dkVnRlMxcklzbm02ZHZzK0dYdjBiRDVlSng1ZnhSZ0czL2ZI?=
 =?utf-8?B?cUdsUytjYWo5NHlHSnJGQXVWTjNLT29iNzE2UFdLMC9UNDdBc0R4V0EwbDdT?=
 =?utf-8?B?WWZCTGxNbmxDUEV3VUVHS3Z3Zkd1MjZwN0JhdHJ2QUt4Z1NLZjRnRlZJLzNK?=
 =?utf-8?B?UGdOV2R6NXJuOXJwbnA1cUVUajdRTnZRak5nUEk0Y1JvYU5CTzBwNkJiSjd2?=
 =?utf-8?B?SGY5d2o0T0IraVlxR2haeDgzcTJkclE4VjVPeWhjelVmZHlsbjN3YVY4cVpO?=
 =?utf-8?B?YVMrUFU4RFRXdXpWRVpaYzhnQ1ZqR0hrSGhjUnFKUElJUVN0SElaYklQZUgy?=
 =?utf-8?B?VlNVUTJEdUU2V3N5dDhLVzg3M05rd1JqeE1DMFIwdHpha0wycCtPWjB6QzhS?=
 =?utf-8?B?eW5rSmJPSnJMWFZqSWJ2akg4RG1LYkxxZUZRZHQ0OXJRQllPM0EwcDlnNDN3?=
 =?utf-8?B?emc5Q2R6WjF3bk03MVRTVnVRd0tuM0kvMnowK2FqQnZsR08vWCtlZHpXTUI3?=
 =?utf-8?B?NUd3K3RiZWYzaU9tdmJPby9iVlRNNWRjVXhwbERuM3gyTytORjM1NDRFZXJD?=
 =?utf-8?B?Y3lWbmFCZkI0enRyV3hqWXBmS2xxSXpEYTI2VGgzdjVnN3VOVHVBM1cyM0hI?=
 =?utf-8?B?NlM5TGlTZlBSS1J3VURmV3BhRi8ydVlvTGVlTU9VMHdnTHdmTzB0NmQrNzZQ?=
 =?utf-8?B?VGtubkFvVTZWTDluQU4wMHdKalRjWm9kU2lqbHY4NXBBYWVLcENjRDZOWXhN?=
 =?utf-8?B?S1U3LzZTblhXZkNHTGNhaUloakNFd3RLdGtoSGcrNjN6WVozait2MEhTTy9D?=
 =?utf-8?B?bEdUdm1KT0pvSEY3SlNIR00xUElPZ1VjZEdGYm90UG9JcVJGeGVJVGtINWQr?=
 =?utf-8?B?RWsydzdQRFNOejcrYzY0M1dnYzBPaVlLcEtodDcyVys1Kzl6VmxmaXFFb0p3?=
 =?utf-8?B?UmNsOHFJSWhFNGlPNTZDcHBqRExlMkY5WjdDdDBIWjR6c3NuMlJWbG82QUIy?=
 =?utf-8?B?cHdIUW0yT2hFTDNIdDRjeVdnK0hScWovd0FHMzE3UE5Gbi9sL05QNkNEcUxI?=
 =?utf-8?B?eE1aeU94LytxN3RGWm1HMFMvamN6M0VIby9RLzZxUHNxNGNudktiNXU2V2F3?=
 =?utf-8?B?TDVsd2tvR1d6cndURklXd0g5N1h4ancxVlllRXo4NllLNWlSaTNVVnh6NWtr?=
 =?utf-8?Q?Mer7ooT/o2Ijqk2O0aT5WmVrO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d849b32-300d-4534-9fbb-08de1672f2ac
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 22:40:08.8029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rfucqDUr879h72iLZp8j5ymO42lLmcRWic38IdT0It2dqCHojlkaMp6IwUgGHzYV2nErHoUjghC7pHIounXFMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4480
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

On 10/28/25 3:32 PM, Alexandre Courbot wrote:
> On Wed Oct 29, 2025 at 2:18 AM JST, John Hubbard wrote:
>> On 10/28/25 7:44 AM, Alexandre Courbot wrote:
>>> On Tue Oct 28, 2025 at 3:46 AM JST, John Hubbard wrote:
>>>> On 10/26/25 9:44 AM, Miguel Ojeda wrote:
>>>>> On Sun, Oct 26, 2025 at 3:40 PM Alexandre Courbot <acourbot@nvidia.com> wrote:
>>>> ...
...
> I think we have reached the stage where any responsible adult would
> shove this whole discussion into a LLM and see what it comes up with.
> 
> And the candidate is... `FromSafeCast`/`IntoSafeCast`. Which I have to
> say sounds like a good middle ground? :) The intent is definitely to
> perform a safe cast here.

Ship it! :)

thanks,
-- 
John Hubbard

