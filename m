Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA60B5186D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 15:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D3010E303;
	Wed, 10 Sep 2025 13:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Oc5skglq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7644310E2AB;
 Wed, 10 Sep 2025 13:55:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAosGQirJHvS3gGDb68ScTY6eib0OmzABRF34Ygz6xZO3FFT7YYsIHxB5Y2MrGjg5wsYXLpgsAsuAbL0A3KVhMSCVSfKntGn8724NyJk+aq3umalTDZ31HHy8xuQhGmuylFgeCXQcEjmDM2SDv86fqEYWvmf3y+V2oiMAeVybB8L1Y47ZsxSo/r2Lp20KzRh9Y61g4SqInqWBBJD3HLO5FYjbbUMNwBTwqUq89hcZesD3vdAmQZBjcSjPqoQAkDae8eHaqc3IljjYwnOe3hAUcRBm76P9OfU8KdztanpP09fO+zKtkozspb25u3hmGqIGR5wCu57V0utjpBFXOj5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwSvwm3+snzVFVrdC+zQKaoPypX04MPCTh2v4OjnRvs=;
 b=q+ztXMaKWULNrln+cBRM7EXvJzTpwE5BLpb137lyA3UOzbYodDSIZRokE95rHN1Xf+88DuJrq+uDjpxoK7ruMXBoBfQ3HoHhXSApN8fLRy2G/xBC9amDbyEdwl5tBRp/OVnsTu1HtjtC0ei5c0sLhyjr9d6wqLrJNn+J/vwbhF591W3JD5dafqm6vrpi0bHcgR7lzwc2zhVuFX12cWyjA6I0wn8TnW4FgNz/1a70r9SR274gsjj2r8Lqk65thoSFEh5xvnMqHG1ExPuzX+S/qYDigaeYhK3wLgQZIp7vaRJqG4qQo4cZc9yuTfypJ8YC1Qva5FuerLlGnb4sgJWa1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwSvwm3+snzVFVrdC+zQKaoPypX04MPCTh2v4OjnRvs=;
 b=Oc5skglq1N5CALIVS++ASJmvLP/BVWOaxWizGehTNui+u/zURnzyZqcEZSu0fZ7OEDOIoXEhJfe3UCheNizqS/s9M+AFIXlyUYUCJw3D1cBavO1GRpyTuh7zqBdVaqTkmM9UWhwsNXIc5FRN+PQ6BMFfuC8RNT5Rtau1R1sPTsKhlNQ3yDHbih2wFRJmGah3+Ko+iC3pFPfXsYeYePSjbL0CzfdGUzXg4ySIpvqmvxmk7yPOuZNlijJBgFVe754R1IQBMoUpMClH659GhEGQa+CjvBvXlv7GS/+V+h+KYbcbR4GwCTntiQvMVSyhXYk0OLDJjyD60SvQR7BQf1Dw5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6647.namprd12.prod.outlook.com (2603:10b6:930:40::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 13:55:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 13:55:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Sep 2025 22:54:59 +0900
Message-Id: <DCP66O4WE3CE.3P5ZHC9P62LOZ@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Alistair
 Popple" <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: Implicit panics (was: [PATCH v2 2/8] gpu: nova-core: firmware:
 add support for common firmware header)
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-2-93566252fe3a@nvidia.com>
 <9adb92d4-6063-4032-bf76-f98dcfe2c824@nvidia.com>
 <DCD2VJ1WJW2O.VM7E4PD3DFYO@nvidia.com>
 <CANiq72=nGbziZCKt=AneE_vXw76i=+td0dSVfbOJ8kJ9eYHw9w@mail.gmail.com>
 <DCOVRI3TVJBN.3OGDSK8HW74LL@nvidia.com>
 <CANiq72n-q0vdzp=Tb=brue+BMoNYdCTKsqcMYUsvKgvu9ZqGoQ@mail.gmail.com>
In-Reply-To: <CANiq72n-q0vdzp=Tb=brue+BMoNYdCTKsqcMYUsvKgvu9ZqGoQ@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0130.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6647:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f4b5c4-5c9d-4406-876e-08ddf071a3de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|10070799003|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eThtRGUremVEY1JhVjJicndoNER6RHQxWmppbzVIWjVyQk1YMnp4Uk1tOEor?=
 =?utf-8?B?TEhEWnd2d09qRlcrZ0haODFvd3oyYUR4clhlYmJuTnRGNUVTT1JuZ2tTVFFF?=
 =?utf-8?B?c1ViZndEUEpQakJZOEo4UEdXYjBuWkk1ZFdSeGxmejMrc0RaUHdOR0huQkJt?=
 =?utf-8?B?Zks1L0p0T0xnT2xNRHF3YXlYK0UyTnN1Z3RqM1BDbDNGUnE0NlBkN0RGenlY?=
 =?utf-8?B?R293c3g3eHhDdmo1SmovTE5oMUQyck1LbEQ1OWxhYjRGNFoybTlKd0RpMHJZ?=
 =?utf-8?B?a0VCd3B4SWRheXRjTDAvMkw5MXFVSmhCTk4vZUVDSkdZN0ZwZ2FlN01ZR2tM?=
 =?utf-8?B?QTNVMzA0aVAwbEFMZWhqSDZOU2pXSmxyaXdhMjJjOTlTa01oMTZuQXdaZ1dh?=
 =?utf-8?B?MkNBK1dkZjk1V0w0TnpxcjBLMmV1Ukc1SGVsTFRxZXZsdkR3L1ZDUTVST1VT?=
 =?utf-8?B?R0xVcFJFaDM4aFdzaWZOVWZUZkNPbHkvZTIrOEJqTFhnZTB2Tk5xcWNtY21H?=
 =?utf-8?B?OENOK1M2cjUzakgxNVIvQW82SVdyODlPT1JnTTBtUlA4ZXQvdWxMN0ZNUzY2?=
 =?utf-8?B?NDgzL3lPN2FDM0d2YlhvT2FRa2JiRjVCUWN6V2J0TDFnYThld1FrR3Fobm9T?=
 =?utf-8?B?ZDBOdytPSzBtN2N1M3NKbUpoNnBCRnFFcjVuY2d2VjlaS01aVFNWVEQ2b2RM?=
 =?utf-8?B?ZmFHYnlsRTRUa20wMW16dmRFQ09xU1dOdFg0MXVEUC9HbEdOVUxycVEvOE9k?=
 =?utf-8?B?UXNzV2o2R1cydzlTL0JENEM4dEoraEROUjd4R0xqVmorUVVDbWNGNW41SUF5?=
 =?utf-8?B?UXdSTmtlVmMvNjJER0o1NkNCSWRCNGdOdEowTlhFblhGLzJ5ZjFla3Z3QVZF?=
 =?utf-8?B?SHE0VldkcXVkaUwrSjBLY01wc2JxRkVUaStjY3pZQXpSdjd5MmJoZjFTb2xD?=
 =?utf-8?B?Z0xmdTUxT2xIL1I3Mkw3QzA4Y1dDWjZmNTJnWG5aUGFXR3NaREtJWm92K253?=
 =?utf-8?B?akxKK3I5anN6V3hOc3IreTRXNUVsUHhzNkh6VlVsU3VwR01sZHp1SXFoRUIz?=
 =?utf-8?B?QVkzTDA1dVJRNndibHZobjNyRGpLRmZsbUNFcW5SZEJNVEtnVHdwa3gvU3BM?=
 =?utf-8?B?RTBVUXNMcFZjS1owQ2F6ZXpXYlBhRkRCWTJwMC9sak9jc081aVIzQ2ZvMito?=
 =?utf-8?B?TEEvTE5DczRaSEJ1M0wrQVp5OFVPMk83UkprZCtBd21PSHBqWVBBNE5PV1Y4?=
 =?utf-8?B?THFkdW5QYVpkYlBKNTAxdG1CbzhpY0l6MHUvMDFZcTRZeC9Td3JtdnRSSFlW?=
 =?utf-8?B?YnE4WDYxdHpxRjIrWnZ5SWgvZ21FTjNZT09mdnNJTm9CVEtkZzlQYkR1WEgv?=
 =?utf-8?B?NGlDbElGd25PdGdXZjhtbkd4VVhwczBFckZETmVLZ3Zja3pyR3V4Ym0xbjV3?=
 =?utf-8?B?YVEydjQyVlhydUxNTzJ3V1BZUjZWS3FUamN1bUIxWkhSRzJsRFhlVnc4RXNQ?=
 =?utf-8?B?cmxQQXM0cm5hS0ZKa2EzT0lFanBaTEFEQTJPUUVmVmhxa21EWm9TckQwM05P?=
 =?utf-8?B?MEIrOVdOYUUwSnY5UVN3T1hKYStDNmFDNE1pNThlREdwZk9pQXh0SmswV2dB?=
 =?utf-8?B?UURLQnpuTFlYVzBqTmFhRkpTbEtaM2NDQTYvcTdDdk5mVlk2cXk4TWxoTTZM?=
 =?utf-8?B?Vmtjb2lOVG01OUV4RFRoMThudDI4TE1NRVQvMUhCMitBRHQ4VlNleUV5bVdl?=
 =?utf-8?B?bTBMR1grN0ZQLzFjZ2w5OUxqVHpyZXl4S09ZblJVdE5lOWszYytwa29xQXBt?=
 =?utf-8?B?bUdmS2hMS1lMdHUxdWpmWmVuVVVOOUNHRFVhaURBNlBPSDluR3NpaVliNjBj?=
 =?utf-8?B?aVllOE0vb0tIZDBqNWhEMXhCeHY5UWpzSW9ZV0o0bUVFY1hiZE9Ja2hzMk51?=
 =?utf-8?Q?vlwb0uMEbM8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(10070799003)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUQ2dUhrd29UZThpWi9GejZRYndXUDQzM29obTB1cTJMcFM5UjRCdnRqczNK?=
 =?utf-8?B?aGtqQnhDR0M0aDdrUTdwL1Q4Vzg5RnEwYzZoNjhkbUhXQ2xOaGVxck4xWVNn?=
 =?utf-8?B?SlFnaWwvTDFqUy83N3FUbGdDTUxwU0trQ09HR0dPa0gvdEhmazZKTUZTV0li?=
 =?utf-8?B?QmJ2YW5BYjVnbGhQWFpCTGdMUkowbGNjcHcrZzJUbG5TSGdTcEw5eVUzN3ZV?=
 =?utf-8?B?MmxHVEJzUHF5a3hRR3ZDejhldWg5eW5xZE9BdU9iaFo2VGlrdXlCLzVPV3Uv?=
 =?utf-8?B?UUJmaEJtVHlJMDFGZG5xZjBPaHRzWDNVN0gxQzM3VU1kL3dqbzBEZ0VOTkZP?=
 =?utf-8?B?WXphZmNIYzliU0ZZYm1RTnZ2aDdlV1BRbFlKMDNwWWgzQm1TMnhyeW1SeDZz?=
 =?utf-8?B?dzViUWZEMDl2eERZREdKSU03VmY3Ymt1ZlZGSlhrNVBXeVdHOFg1Y0tkYUd5?=
 =?utf-8?B?Z25kcGhGMTYwci9LR1pNWEVFQlYrSDh5clBXcUtnRzZYTGltaGx2TGRHWXc2?=
 =?utf-8?B?MkNTOEJ1aXp4QUo4MVBFWFJsd3dmWlc0MjNsVnZEQk9COHphRmVoVEdSQU1i?=
 =?utf-8?B?RlViWXI2TjZOQkk4Z1R6VWwvRGhXL0pXK0xzaVljNlZPanpGMVFQek5WNmxI?=
 =?utf-8?B?VCsreEovQktURVVHV2hRUG5OTUN4Vm1nb0NzYmlQK2o5N1VPMGtTNzBTaEU2?=
 =?utf-8?B?eU9GN0YzMHRzdmZBS2NMYThHN045dVpuelNnSk9ZdHgvRERhUUZ3My9KSExx?=
 =?utf-8?B?R05SRDFNTERjZXoxWUlDZkcyYjBvYzl3Q3A5NXpOb1JpbmxzQlY1T3ZRZ1Zz?=
 =?utf-8?B?Y09ISEZ5blNxQXllK3VjRER3YmhDYW1CUS9KSFVTWUFRWmE2LzFhZWRlVGx3?=
 =?utf-8?B?Q1lBeGh0ZGNxMUxpSnVwS01tT1hYZEIrb2Nzdjg3dENLUmVvcWpJL0tJbEtY?=
 =?utf-8?B?V0t0d3BwQ1NuWFJpdTNzTk1kYW1CTkNFRDlaek5SY2QvS1M2S2NDRVZQZzU5?=
 =?utf-8?B?Ly84WXhnK0FEVm1KV2pvY2NjdXZZTzBSeWhtcllFaUJQTy9UWjNXWGZHcGJw?=
 =?utf-8?B?UDllRThBY0FVNVMxd2tHR2NLYnBFMU9xQ0kyTWhMMHNMcytYb2c0NVpjQmJz?=
 =?utf-8?B?WnBheUZ5UTZQTTEvaURobHcyWXVYUkRWMitDK0YrOStGamxjZ0x3ci8vc2x1?=
 =?utf-8?B?MTE3WExjVjl0Mmo3M3pocGg3dnowSVR5OHJFSGE3QnlGWXRkVHp3VTQ1SVFx?=
 =?utf-8?B?b3B5YzZwNktOZk14Yjc2U2dCd2lUTWVIWmFSNXArbVJSbTk4N2RIbzFzOG5E?=
 =?utf-8?B?Tmh5VEl5dko1ZDVNZHNNUUtHdDBhZGdoUVc0MGFRUm8vNUpjOUdlRDZzTStL?=
 =?utf-8?B?UlFjTkQyd0ZNZHd6V1dENmlwR09SMTZoN1pSRVFpQnRzZlJQZmdRRFhIYytz?=
 =?utf-8?B?eDIzanNOVE5wMGg5Z1h4M0Jzb0I0Vm0rSVhXdmk5RmpXcW9Vd2ZQalZPMWc3?=
 =?utf-8?B?SXp4WmVEMWRZeWw1QVdaUDNvNko2TzVDelhNRndRRGRwN21RWTcwMkVYOHdw?=
 =?utf-8?B?eEJWUUxvUHgyMEgvMzVtN0ZYOGF1QUJuNnViVDIzYUFiMGpCS2dVK3pFcm9a?=
 =?utf-8?B?VnB4VnhMZzVQRzNyV1JRSnNZSGluMTNpMjlXbTVxY0w3Tzh0bUQrTDJLeksw?=
 =?utf-8?B?WnlnMmVWN1BqeEhjMytNQVdVYzlYNWZQWVlwNlppTW40dzdBdGxDQ2pkWEdj?=
 =?utf-8?B?ZzRvLzJjU24zTmpPNWZ2OEp5cWlQak9iWmRRZnBFMGFCQVFPbVdVcy9OU2Nj?=
 =?utf-8?B?TFFZalErbUFCbkZtdGhtd1o3QmdtZGZwby9iRHhrUGlHZWZaMWdSRGhYSEkw?=
 =?utf-8?B?bnlIZlp0T1Z1aUE3VElKQVZlaGhDOTRRSEEwa2V0U3R1Vk5pazAwOHdQanZj?=
 =?utf-8?B?Zit6YUIydFgvbTVpblFBREY3NGlBMTJ3TXZiMVBwN0dWVXZXdEE1ZVFoblJB?=
 =?utf-8?B?QzFnUGN0VEdDTHpyQ016Sll1NThITUpzWnIwYTZZaWxzTmJjSzVEeXZQRGd4?=
 =?utf-8?B?dEF3QjRSUTB0dWhkZGVNRkVBVFJmekVMODBNZWcwTHZweWJMZGdORnkwUFdv?=
 =?utf-8?B?TjJMQ3BPSUVlQmhXU0dYdElmanpneXVLMFVmY0dVeTVMaHRuN2piUmhNeTNT?=
 =?utf-8?Q?FNEpq2NoTNorpN9MoKtfSX5VHSVyv6hKGOxxDCN6sNph?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f4b5c4-5c9d-4406-876e-08ddf071a3de
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 13:55:02.9528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZLrv4fX52b802kInIP3M0eZzwisjDge78FrVrF1wQi0QjnGSKxgQcUWUUpZG70b2LePN87oaHJ9zwRb4mdcSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6647
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

On Wed Sep 10, 2025 at 7:00 PM JST, Miguel Ojeda wrote:
> On Wed, Sep 10, 2025 at 7:45=E2=80=AFAM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> That would be nice, but also wouldn't cover all the cases where implicit
>> panics can happen, like out-of-bounds slice accesses - we can't have a
>> "report-and-continue" mode for these.
>
> In principle, it could cover OOBs (even if it is a bad idea).
>
>> But perception matters, and such crashes can be damaging to the reputati=
on of the project.
>
> Yes, we are well aware -- we have had it in our wish list for upstream
> Rust for a long time.
>
> We are tackling these things as we go -- e.g. we solved the `alloc`
> panics and the ball on the report-and-continue mode for overflows
> started moving.
>
> Part of Rust for Linux is about making Rust the best language for
> kernel development it can be, after all, and so far upstream Rust has
> been quite helpful on giving us the features we need -- we meet with
> them every two weeks, please join if you have time!
>
> (Side note: the "safety" that Rust "sells" isn't really about avoiding
> panics, although obviously it would be a nice feature to have.)

That's right, these panics are actually the last line of safety to
prevent a program for doing something damaging. It is just that the
consequences in a regular program are not as heavy as in the kernel.

The only two options are either allowing user-space to crash the kernel
through a module with a missing bound check, or letting it tamper with
data it is not supposed to access. While the first option is terrible,
the second one is unacceptable - so at the end of the day what we likely
want is to keep the panic behavior and limit these occurrences as much
as possible through information to the programmer.

Build errors on such panic sites insertions, with the option to relax
the rule locally if a justifying SAFETY comment is provided? And as you
said, what do we do if a panic can be removed through a particular
optimization - does it become mandatory to build the kernel? Is it
applicable to all architectures and (in the future) all supported
compilers?

I suspect it will take more than Plumbers to get to the bottom of this.
:)

>
>> Writing a uC topic proposal for Plumbers right now. :)
>
> I see it there, thanks! I can briefly mention the topic in Kangrejos,
> since we will have Rust representation, including from the language
> team.
>
> I don't think the discussion should focus much on "Do we need this?"
> but rather more on "What exactly do we want? Would we be OK with a
> local solution? Do we need/want a global one? Would we be OK with LSP?
> Would we be OK with no panics after optimizations, e.g. a link time
> check? Or do we want full support in the language for guaranteed
> non-panicking functions? Do we need exceptional carve-outs on such
> checking for particular language constructs?" and so on. And, of
> course, "Who has time to write an RFC and implement an experiment
> upstream if an approach is decided".
>
> Getting data on "in practice, how much of an issue it is on the Rust
> side" would help too -- those with actual users running Rust kernel
> code probably can tell us something.
>
> What I would personally expect to happen is that, over time, we
> understand better what are the worst cases we must tackle.

Thanks, these are great directions to explore. I see that some thinking
has already been done on this, do we have a bug or tracking issue so I
can catch up with the discussions that have already taken place?
