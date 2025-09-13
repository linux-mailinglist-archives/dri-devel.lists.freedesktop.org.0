Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1465B56311
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 23:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C450310E179;
	Sat, 13 Sep 2025 21:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GR04+D1V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D416110E179;
 Sat, 13 Sep 2025 21:16:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCxDCRbQX+SZu8OWmMGfCFJlKrQQYS3GqFqS8tmLX4d64AFd6F7gUbyN+E6BQ0J3vDesVT8n1VRc+MdydE/jZhBNwfiTnJBXXmayYl92uRX+rztRIgES8PrRy7XKeFiv2B8Obh1PJCCAIv1Poz73t68Xt12bYN0xugZGr54cejDx/tbYa44kVRxj0y/+UKn7wvWLEldmHRkCK6+d1veDYoMitVWFLSo2XmCDC+yQWV+NamS9NHXHDWcHiVGl1vvBmq7u32+Xjlu0pmufipXoSx7U/s/BFPUOl+qIpHeEw8nkPqNwMV0a1mVKqYfiBaYdo8nTIDyH/WrAVROT5Gileg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRR7VHdMHNA0X5ja8wEVID2aJWfqZt3ztnXrB0QDkVA=;
 b=RK+ifIKHNHwc8C1z/yPBmvdlsMK7X+KWCrbayB4NeaRtSzq0L2CGSAQaeb7WXTwdKys7vyz8QTPHTAWsgewoSDoqds+P8cntOh//Wn+BpchHYWtZSrLy7BJaAtGNsDnal7y4Rtu700ZLuz/feq4M5fWKYlVkDq50pBgz+BQCincvToOA1C08LpayYsKCVcGKx2p/zt4eP+rUolsk2CqglZ0JnNhfvaJS6L/54QSCGYahq30oEnJpDwUwL9dXAeiZ3O8eYoN9LxeU9edRfiO7w7Luu6JXVU3Y05NxiAlo58quqRo1fmi3jL0jtXfcIjCdprU83r/R2ihvtjsvk+HmOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRR7VHdMHNA0X5ja8wEVID2aJWfqZt3ztnXrB0QDkVA=;
 b=GR04+D1Vw8XcxQC620e5CJ+YJjlFuPvpm0dtIvz5ewUplZrt7Eiz3KlKDV+pS2E0grCvfLk2ba8jvZHC0xRnH1xtSW64tnkpsMV0kY9fh/LxU2aT4LlNg71E7iDLTmbaa4GT0iYqJRrRm+w4N6WlOW2aHcFVcfquz0ln1O+x0FSZCSsDaaL0aKfij52/zOqBZUMZmffM5h3BcXQ9EQ/f//Uy/XKBQmoIwWVwStXNm7SD1cmJ3eS831DmdFAia0L7PZGvRKwROxULwUmfAtu6SWgkE7GFko4fQsigFKd63EivOxiQdQFOewOlk9ngsaPcDMKnZNKkAOWmQLz4+Jex2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB7690.namprd12.prod.outlook.com (2603:10b6:610:14e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.18; Sat, 13 Sep
 2025 21:16:35 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9115.018; Sat, 13 Sep 2025
 21:16:35 +0000
Date: Sat, 13 Sep 2025 17:16:33 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
Message-ID: <20250913211633.GA1562398@joelbox2>
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
 <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
 <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
 <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
 <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com>
 <20250913010226.GA1478480@joelbox2>
 <DCRPJKD0UHDQ.IOWSOB2IK06E@kernel.org>
 <20250913171357.GA1551194@joelbox2>
 <CANiq72n50MaMXeWdwvVOEQd3YEHbDRqeeRzbdY8hPnePtq-hnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n50MaMXeWdwvVOEQd3YEHbDRqeeRzbdY8hPnePtq-hnw@mail.gmail.com>
X-ClientProxiedBy: BN9PR03CA0727.namprd03.prod.outlook.com
 (2603:10b6:408:110::12) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5769ac-e0cd-4805-c341-08ddf30ad1e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjdZNks1aGw2NnY4aUNQM2ZYcEIyMXRCckVQWUN3dkpiQndyVTVVNVFobWVy?=
 =?utf-8?B?SnUwd3NFNHpJNWNTRytkWXd0VnEzV3BjVHVVT0hFUTN4b29pcmRBays1TVVj?=
 =?utf-8?B?NlkvRjJuVWF2WjM0U2cxVmNrSDI2eGlRMitlbjRNY0JvelpXaHZQOUozQ3FT?=
 =?utf-8?B?WXhUZ2pOSjFXUVBOVHBPQ0VzTmRCbkszVmlhZys0SGxLOEFEZWhFeGFJb05k?=
 =?utf-8?B?ZUNPL1g1a3ZBRlVNQmVnSVRGM1RwRldQTkdUM2kyRlhCRGJ3N00zcEFYQTNM?=
 =?utf-8?B?K3QrSGRJWHhMRGxnR0d4NEc4aUN0YnlvWFZnWG5nU0hKR09sYnlzSnAyejJM?=
 =?utf-8?B?ZnBVNWhLQS9YbDNXaDdoamdqNGtRWkdGak5BMU1LRTFidGgxbVVLSWtBQkZN?=
 =?utf-8?B?Yno2dG1nZERvYUp4NjBqRm0yTjdWRjcra29tS04rM1VaZ0VPT3FsV0ZUREtG?=
 =?utf-8?B?c2RJenJjaS9JVitZZ1Q0VEN5eDJSR0xYKzNTSVRVeXBOVUhFZlB0WDRxSHRP?=
 =?utf-8?B?Z2dXbmYxcTBRTjhhWlFZZmU4aEwrR2pDamNjcHpKY1VLWmhRdGhKeWgyZXFo?=
 =?utf-8?B?Y2RyN1lTUG1XUmlmOEJXeVlLVzN3Z0l5L1F0THEvYjQ1K3lFVElEdnhndGlF?=
 =?utf-8?B?bzVod1NjSXArRVA1THBmem5OeUZJM3U4eHFxK0R5Q3YrOU9xQ0xGNGxscUhQ?=
 =?utf-8?B?NEVGRFVuRmdjTWtSMW9kVFZIM3RLSzhhWEdYQXBFNjFpbkkvTVBWQXhXZzJp?=
 =?utf-8?B?RTF4d0hsNmFhVWdQOXluam5JOW1LR0NCc2ZQVndEVG9Zb2FGemlMKzVIeXNR?=
 =?utf-8?B?Smlja2ZpQmVzWVl4S2FxMXMwMC9NSjVxcTFrb2Y5U0IvRkprUXdLLzJsSzhQ?=
 =?utf-8?B?c0s2bXpPQytHSmhPd0hyOXB0bGhlSGJEdUZQRTdtN3IzZ2w4cWxZS0EvcTRL?=
 =?utf-8?B?OERVMHVEa0o4SHJjNWpPWCsrbEJVTnhJNnNFdzNCNGNYckMvaW5yUG9yYzho?=
 =?utf-8?B?R041TGVleGhlYVN1c2FXUldSRk1FTTdqdXMyS1dVVjFjTzdOTUZPNktodDVm?=
 =?utf-8?B?WXFWUlBHRVMzamFBM0ZzSGdzZ0tQRlAxenozS2M1L2lJZ0w5L1RRS2JQZ1Jl?=
 =?utf-8?B?amdqa1RvV3ZOWXUvZDhZMUxuSFoxcGMvVWZUMGE0Y0NqUUkxNEwzZTlCM1JB?=
 =?utf-8?B?S2JtYW85U3lzYmR2ZXpGMlgzUlVBYk1OaVlwRzU1dHdhOVljMFN6YnRpdFFG?=
 =?utf-8?B?bGplTVVTZSt5WmFWVTA2cmhyOGQyeUZKd3NwZ2d0elYzVnRSZCtMTTZjYmxM?=
 =?utf-8?B?c3Zob25sSTJMZm9XRHdwY25oSUJjOGNBWk5jS1lGQU5lTlpXUGZFZHUrb0tX?=
 =?utf-8?B?UkRUV3p3aUNabWtmYVJlLzl6b0J6TDlQSDRnV3BWaHd6QnhWS01FVFVXTmtI?=
 =?utf-8?B?N1Zxdm5vN0l3R2VPMkNoQWwzS2xNWW5ObzNBVzRHYlhGbnI1QmxIbjVobDdl?=
 =?utf-8?B?SzN5VGFkbUMrSEFxTCtUU1E3K29EdUtLdllJemZXUFdKRmxGdXRQaFNvU0dW?=
 =?utf-8?B?Yjl4bUMzMnp0c3dpWndrT0ZkbkozMi9aRFp1WnpocUptemEwV3JjeXpuQ05o?=
 =?utf-8?B?UXZWdG5xRDVqcFgyRXhuSERUb3VGQTd5MTJJejg3ZXcwZ2JnYXlVV01pV1JO?=
 =?utf-8?B?d1pLdnJQTEhPTjZyNm54S3ZQR3N4MFlkL1QwdHpHczVQclZrc1krNDRUMkNO?=
 =?utf-8?B?ZEhWNThSNGlIcjVVNnYwbVVxQ0xUWlpIODdrVXlaa05YVENDbE51V3lwK25n?=
 =?utf-8?B?bGt2V3ZRZkoyOTFHWmdEV3dzLzZKbVRDZGdneFZoVzdVcElGK2FvZE9QRXAv?=
 =?utf-8?B?NmxWNkU2QW1nNEFiUDBON2I1SjhDMUpwS3hkV3pNNjFpd29SbXBmT0NhZVp3?=
 =?utf-8?Q?J7YD89XdC9M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVQ4RmNSMzlNamVNMGhSR3VXYXhiTFcxazZicG5pS0NndVhLcnA4MDJLN2pK?=
 =?utf-8?B?YVlueW5WVlZJZFMrY1IzU3VRd1Z3cGJObXd2eVg0V1JvelU5bzFLZWVTbWV5?=
 =?utf-8?B?Vk1zUVplenB6VHRMNGxQYVJVdS9IMFVqaVQrNlFHU1llRFhJVjMzZnRUZ0hQ?=
 =?utf-8?B?bEFkQ28rNlpGWGJWd2JNeGJzdDNZQ0g2UGtKVkJkYmFEaGpjeXI4QTZNSnNh?=
 =?utf-8?B?N3dLUWFuTDBkTXNzcXc4UUFWMHpHTkZuVkNzSENCak1PRzFPT0FoRU5rMDBI?=
 =?utf-8?B?QXo2MHhDb2QrMzhvVG9vWC9kRGhmYzUrUHFxdFJXOW5LYjAvZUxCTk0yRFpY?=
 =?utf-8?B?dHBYcTVycDVPcmRsckprdmFWd1NkQytySC90NTNaY2xmcXRVcDJ3aHR0QTBH?=
 =?utf-8?B?clhJTS95WjRJVWhIWDYrbWdBR0l3aDlHRHlTQ1FxT25IVnVpaDZYNGFmZUE5?=
 =?utf-8?B?SSs4NEdFMUF6eDFJQVA1L09ORk5XdGYrSS9UdklxblVXSWJmMVREWjU2Ris3?=
 =?utf-8?B?STQ5cFBtMkM5aTMrYmJTT21jdEM4dlVkL0I0RXMvOWxGeUtoaVlxci9RTldI?=
 =?utf-8?B?UlVLTXo2M2s3Tmx6Nk1qbnlTMG0wcTIrMG80dTVSVTVYZEdrZXM5U1h5UUY5?=
 =?utf-8?B?cmJJTkpmQWx5dXdzK0R2cHVrNDROWEp5RzRaamV6T1crTmdCYUdXUjd0OEV1?=
 =?utf-8?B?Snc2eWtBYWkvaStUbGV4ZHRzU0tCaFNRYVZNQlVDcDVHVFpYT2xZcW81NzY0?=
 =?utf-8?B?S2h4M0dQL0JWTkVHM2s1eXhuMy9aTXhwQktlMXBubXR0SkFqYytNdFRzZlZJ?=
 =?utf-8?B?M1BPNGlYN21MSVNySlNrTlU1OExwcEd2RnpQRVpiaFVITjBiWTljdkw5MnRv?=
 =?utf-8?B?Qk1JS3V0d1lrektuc2pEbXpuMlBkc1huWmpCNjNLLzdDN0JZTGNwZFBGdGRu?=
 =?utf-8?B?bDczL1RaRUVUN1hFSDlzdEVQb3F4TmZsbE5ZQ2loY3BFOVdpbDVmZ2QvaUwy?=
 =?utf-8?B?ell2RXNSL01wOW1JVVBUVVZUSmtYRmt3T291blFkUEFMcEpMbUtOdFhHUTBa?=
 =?utf-8?B?U0JWZXQ2SUd6dlpFNXRlK2V0RUxRVjM1cDBNRzFPT01xaCtUT3d0TmV6WVJa?=
 =?utf-8?B?clpqaEgxMVJScjg2OVpNNGtQbHREVFRWUGV2alV1aE9SajFnY2RkS0FFTzVI?=
 =?utf-8?B?VzdmamkxRUlXaGV2NndSRVlJUXZyNXJJU3dreWZkV0R1c28yVWdBTnRteGEr?=
 =?utf-8?B?cTJuWkhRai9WaFN0OU45M0owUjhFYm5HcWgycWU1V2trZ3FDRkE0NFJnVElI?=
 =?utf-8?B?NTFKdjVBeXdpaG1KSUtMamRXamh2RU9UamozTGVxY1dTYTlHUUJ3dHNLQlZH?=
 =?utf-8?B?NWdjMWNzd3pXUlVoUEJ3S21hbldPUmtQbEowSzNHUnZubUNmdnZjaXY4VXQw?=
 =?utf-8?B?UEN4eWdPL2I4R2toWExsbjlwVy9MN1RwM1JNazJ2ZkNUZGVzZjR3YTVQMnpn?=
 =?utf-8?B?U3JGNUhjUTFCeEdLY1NSWkxaSVAxV1h4SXNuSEhycmh1aDhtZzViNFNjVzBE?=
 =?utf-8?B?dGl1MmJBMDIyR2hpQ0craEJtYUtjdUNuNkM3S0EzRGpqQ2U2bHFESExQL3ZW?=
 =?utf-8?B?WkZvRWZ3S2cwVk8yb2dSdHYwM2tkczh2UUFaMHhtOGl1RURFL2gyZVVyZ3FV?=
 =?utf-8?B?c2Fjd0xKRStCcXoxRWRwWjA0aFdYUEdPWVNxV1pkL2svSVhYUmo4MHhyTUpj?=
 =?utf-8?B?eE9mbUk4WFVGdk1oV0hHN050YkUyNnB5RWZJSFM4TGREcFNrNXhVS0pNS0Iv?=
 =?utf-8?B?UU80M0NFT0Y5bVVybCtwNHkycUs1OFlqVFI4OE9KUG9qUlRmR256TWdyM3l2?=
 =?utf-8?B?aWJWdjJvV3Y3UUpZSmRydzVPdHJ5VTMyZVp0dDNaZ2FFZmZYTlp4VlRIUnZ5?=
 =?utf-8?B?TXJZNWUxbzhWd3dGWHFZZzUrYUMrRHNTVjBvR3FrS1BMMFpDYVJvUytzRnlS?=
 =?utf-8?B?V0k4alRobVNxN3VwWUJIT3pIQXYwNWVwblJkVEdkYXVxNDJRQi9RUUxiTmRl?=
 =?utf-8?B?VW1WWFlNWkw5S1pmVEg2ZjNDdzVTbzVZRGdvbHNqOHR2QVNSMlZ6clRadFpj?=
 =?utf-8?Q?LhGTR2axaON25P/Jx+PpAtnAv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5769ac-e0cd-4805-c341-08ddf30ad1e5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 21:16:35.4647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikAbdaxShsK8dD/MRDX+vjNBVbKYXMOmwh1rdimKmUIXQld+aN8FQl68vqy1yptqHIC5R9lyWgCiJoaHmBSvIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7690
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

Hi Miguel,

On Sat, Sep 13, 2025 at 10:37:34PM +0200, Miguel Ojeda wrote:
> On Sat, Sep 13, 2025 at 7:14 PM Joel Fernandes <joelagnelf@nvidia.com> wrote:
> >
> > I am not alone in that opinion.
> 
> Hmm... I am not sure how to read this.

I don't follow? I am just saying that pinning seems to be a rather odd thing
to do explictly that we don't in other languages. I know why Rust needs it,
but it is even more strange that Rust requires additional macros in the
kernel to further implement features required for it, when it probably should
been a part of the language design from the beginning (and not require
changes to macros to support usecases, like we saw for Nova).

It is possible that I don't fully understand pinning - but what I do
understand (and please correct me if I'm wrong), pinning is required mainly
because Rust default-moves data which wreaks havoc for stuff that unsafe code
(C code) exposes (spinlocks for example) or data hardware expects to be at
fixed locations. This also arises because of mixing unsafe code, with safe
code.  So it is required mainly because Unsafe code (and hardware) does not
break, due to "safe" Rust's default movement. Is my understanding wrong?

> > This should be first-class in a (systems) language, built into
> > the language itself?
> 
> I would suggest taking a look at our website and the links there (like
> issue #2) -- what we are doing upstream Rust is documented.

Sure, thanks for the pointers, I will study them further.

> (Danilo gave you a direct link, but I mention it this way because
> there are a lot of things going on, and it is worth a look and perhaps
> you may find something interesting you could help with).

Sure, thanks.

> > except to satisfy paranoia
> 
> Using unsafe code everywhere (or introducing unsoundness or UB for
> convenience) would defeat much of the Rust for Linux exercise.

Where in the thread did I suggest that, though? (using unsafe everywhere).

Also note, I'm pretty much a Rust (and Rust 4 linux) newbie and don't claim
to be any kind of expert in these. But I have studied Rust for about a year
now and pinning for a few months :). I don't mean to make noise, just
discussing so I can learn more and help in some way :) Please don't be too
offended by my ramblings.

thanks,

 - Joel

