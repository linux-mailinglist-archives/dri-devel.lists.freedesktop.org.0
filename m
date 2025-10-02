Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB6ABB23F0
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 03:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A4510E757;
	Thu,  2 Oct 2025 01:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rwrNN8oe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010042.outbound.protection.outlook.com [52.101.56.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DF610E753;
 Thu,  2 Oct 2025 01:17:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiJaTnyIfmK73ejeRyulnJC/q96ZoZfJbgKov9psL7SDumKYJppPcUCyF0cBtWh2k6lH0RkfTnlT8M+c9T9Md6lEmuYSYTg+3yjfxHGDVopmNaLgUQb6Dg2d2uSTPcOiydNdR+zgmqNDPScu+LBfroRmeV1ZyGd0kJ5XRPKOHdvIR0dW+zW3s4O4+eK9fw1itammx2eCe7xrA9NeZSui/QPdlbkxi71HTgDQ7vPwRGj7AgWNAPL5p1902mkfhzFLPCfcnhnVEVt5cCwjD6eCEEbvWEGQ4b9vGsMAPZVVwMNCTJhVDXmiwfy5IBzIti64xtW2YYh8NvY61cOgNWeybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeQrkGgtnBKyjfw+4hAHDnKPl2wAbStSJqB1pJO5/l4=;
 b=p4qMLIsQhb3R2a9PrDPlUOXMfO6uwWCpfVDNooL2AqrbuqsCoGPEqUQF/DvBe228GKiEDLyUssrfv5GDjhGnJNxEfK+TxMSqL8i1+Id+GU51zjDe9XwNCc1Dyx76S5QCmMXtpFCBYQ/DXgDB6zDE6fJZldjWM3OAfvXB/mehyJgzsscg5y5nimwXqQpgH8JyMAl7il2OYhkrU/kaTCV6kh6to+FqrmYgmoGqLB2ZEVPdkGXjJdcTXDwknkNmnVsfIZ2f/9/5CGzur9esJykMzbJuJJ8qBO7hHPBLG0pJlT8eLKwgppIvaKwAy7yY6QTpriFhqrpyAvZFKAzRrNcFCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeQrkGgtnBKyjfw+4hAHDnKPl2wAbStSJqB1pJO5/l4=;
 b=rwrNN8oezOI21xg6VrT6h3kin9ZdvQRY/7A20WybiOfLgbjM/XIvrVgjFVrCOp4BfzHsrT3QjpBb3eNyjlkczwvPxjMhY/zAuFCAJyWmVZJF9HT9T7MZppgqjKnu8tfMtmPXhLAAeEZKOecpBwRtfnipmsqBsNHXY2+DQVW3LP9lKP/gl0oMPUS3Pw4xrVikahO6SKqhcx45gXoWHjYWEKRf+12Z7uhfMRvqadCq3K2g7Z1AQtrN2dj0WTmbSFE2Ke/KUVsR5iifhB4/qCza3u3E+uRoO5qGMvvhL/czUvoFddCR6H9PL3HNXCuSd86DWP5awXFvnKrkGP9prDRzSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB7476.namprd12.prod.outlook.com (2603:10b6:a03:48d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Thu, 2 Oct
 2025 01:17:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 01:17:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 10:17:28 +0900
Message-Id: <DD7FUNWXX7K3.2EB5P0BR82JQE@nvidia.com>
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
Subject: Re: [PATCH v5 2/9] nova-core: bitfield: Add support for different
 storage widths
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
 <20250930144537.3559207-3-joelagnelf@nvidia.com>
In-Reply-To: <20250930144537.3559207-3-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0057.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b75c60-ce19-4088-8f96-08de01517612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFBPSDVSbUN5ZTEyaE56cXI1eis4a2dxTENneldZSE1IRUQ5eWZmVmdpQXBP?=
 =?utf-8?B?OXpUODVjcU9LQ2RSTVNWVW4rOEwxaXBuQUFDRnFiTndnM1pnZjVvVkR4cW9z?=
 =?utf-8?B?Q2xUd252WXZIUGxsZVQzL3BPWmQxc2xyNVZMeXpnUzZ0UjV4UVBwQW8yL0RI?=
 =?utf-8?B?MU1ybmthc1J3WktJejd2NmZlcXFldjVDN3p0cFV1N213ZDd4MWxZRnFBZkRa?=
 =?utf-8?B?eGY0SzlPdER1by9JeEsxVm5FVjVFbXowZnk4dW4zN1ErQVFZeFgwVU1QblpO?=
 =?utf-8?B?R0lFQThsZHhQN1FTSEhadUVWZHpuR3RZcHZTR3M2MEZWVFM1Y0ZxcUgxQVhN?=
 =?utf-8?B?R0lBa3JUZzN3Y3JuM2NpYzdrMUsrMkJONnJBUjIyajNnTlU2OVlOZkFmL3M2?=
 =?utf-8?B?UHZlcE54Mng3emRsaFNDS0NSQ2xUT01Jcm5wMHVrblRaOFM4UkwzcUNEQmJo?=
 =?utf-8?B?L0NzdCt5aXl2S2pUQnA0RDMyYyt0aW83WjRPNUVkK3ZTU2lSWkN1OXJmMEw2?=
 =?utf-8?B?Um5obFJWU05CUnJzbkVzYWg4TDgvMncvQmRqN3NnYXZiUmJ6Z0kzMVk0ZGZ1?=
 =?utf-8?B?VjVnQzNMQk4yaXIvbGJCR3A5VEFiaDFTSXJsMFFsL2FETG9EM2lIekVmRnow?=
 =?utf-8?B?NXlxSlRDQ3dsMUJxbUgzSGNNMGpGVTJQR0Nmc2lxV2l0OVRVZk5OVXpoNFRz?=
 =?utf-8?B?ZEZhWlgzRVJGWXBFTEZoSjd6dnl0Y2MveTZKMmlKZFJCaTZIMTNraDI0TzFj?=
 =?utf-8?B?aTZOS3IyVHhhWThaaUYzOHRsWlg5czV1cFMraTVUbTdaakk3UEpNS2JxNmtw?=
 =?utf-8?B?bEM3S2lEaU56KzhZck16dmh4Qjhrd01QdGtXY0FEWFN4d28zZzlSYjQ5UGtO?=
 =?utf-8?B?cHo2djV2akgxVnZ0ZHZjSFJxMGYwNmZrUE5Fek5pUUVMWndYNERteWFIbnNG?=
 =?utf-8?B?SzhodVFBMkc4SncrdnJlK3FrRlpFNnRDamlqay8vRTUrdkI0VXJsdExCdVlz?=
 =?utf-8?B?bTcveWU2YkFYTHZVNGxPVnhBQXg2NTN1VGF5UHM2Z2EzRjVENUd5Q0VmNFhK?=
 =?utf-8?B?N0R5WGxaYlpYdG03Q1dZTG9tVFBUWEhDb29oTnFMc0RqUUU1S0NjdVEwLzhB?=
 =?utf-8?B?WDlQWVo0SmgvbDVaMUpVYW8wTm85akdxbHpsZzFuemE2aEpOclp3WjVkVlFL?=
 =?utf-8?B?UUwwVFJYN21GTGQ1NHRWbXdEZXFSZXMvWjR6SlZQcmk2Q1ZvWDFYbDRFeG8x?=
 =?utf-8?B?S1RPbTB1SjVOaTJzRlR0ZkZ2WXhGUHA5ZVRTVk0ybVRieFN3SHNRK1hKbjZn?=
 =?utf-8?B?YkpSRitOdE1MeGJxaVdGTHBkTnFCT0VHdEVnMWk5Q09RZjlMSWNzWFBtRStF?=
 =?utf-8?B?NU9BdXFKZHoyVVY1amVIR1FZMVhTYWxja0ZxMjVyMEVVdDJ2a0NQOGh3aUF1?=
 =?utf-8?B?aGVWckk4dDR2MHdOaDdPMlh3b0xoWHVtU2pNaWZmRTd0eHU4VzR5WHFPdUVn?=
 =?utf-8?B?UjY0TjJvdmM2eGlGQnUvS0VCMmM1cWx0eUQzY1hqeEVodndNZ1FkVDE3THZ2?=
 =?utf-8?B?VStLRmZhblZMUmJCQVNRS0dJZUlxamQwanpaOEZqeEVoaGNhUHZaaS8vZkpF?=
 =?utf-8?B?VzR2dEg2bGVsVllxK2dQY0ZSMG5BY1J3VWY2MnVDN2dldEM0T0o2c0ZPSHZY?=
 =?utf-8?B?VlpVaFo4dmwwa3Y3RWVpaWp1eVZ4djJIaUxlb0JyREZpQ3NSdENzdm92QnpK?=
 =?utf-8?B?TEV6REV2Y25iSGNyMW9GT2Uzc0tnVmg3Ump6eUNzUmpFeXNIOWc0UnBIMW1t?=
 =?utf-8?B?Wk1Fd21ES3BkeWxMZ3BpMzJDVGRadjdVUm8yQUpVTVgwbWdpQ2V5dGpwL2dR?=
 =?utf-8?B?V01ydzJibXlrQVN0ZE4vdmpGZ0lmMTRoTEdPRE5NNWFWM1RDRGp3UXVXdEdx?=
 =?utf-8?Q?zdy8w55y7sNHLRPd6FtGUz8SncP8qF44?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEo0NkszZEgxcVl2eGZFaW5RUDE3cytvUEhqb2dta09KK0Y2Z09ySS9Ecmw4?=
 =?utf-8?B?RWVha0tRYUZXZkpWZ3RKWFdxaSt4bnl4bHFIMnlwbGNBNUE0UjBmR0pZQlhq?=
 =?utf-8?B?MnRSbG5hQWhoeHdINTN5eUluR25lYTh1VWd3dTk5SW5walcxcmRJQktzS1Y4?=
 =?utf-8?B?ZGl1LzhHTnY3dUgwU25TR3RCaUlVWEpjcnV5V3kya2IwWlJxNjJDUGIwRWNl?=
 =?utf-8?B?VVlqbnlYQUhjR2JCKzY4R0kxcTMzZEVSM1czUW1UZ05PeVh2WUR3R1FoWXBO?=
 =?utf-8?B?NUYxaFFwRXY0VDVpVENKRTd3UU1Jb2huNCttdmVvWEMxOVR1WGRRRlNvd2lD?=
 =?utf-8?B?dHZXZTM5VUFRWC8vOFdDRU56RGlXY0IzQUNuRkNRV25XMTVKblNzbHNVdkJW?=
 =?utf-8?B?bG1vazkzSE5qNnFqV2toenFjWDE2alFkMXRhL2FQbVErcnc5aHJ2Y1NzUGVR?=
 =?utf-8?B?MTJxeEFLOU1QQlFYZENLWCtDUkN5a2JEenZkSVZJd2sxZTJCaXByeGgvUC8x?=
 =?utf-8?B?eU0wbWlTWmJwQUhhdzZKRjNLVXIyRi9Pa00wK1UyVWV1alFPVTJkWVk5aS9n?=
 =?utf-8?B?b1JWZXRCdnZiK0ptRThJMm9rdTErUG9wNytxL2ExSU1wd2VGK01mMmI1ZnRJ?=
 =?utf-8?B?c0tWVmMvSlhhbW9jdDdsMTQ5NmFLMVllaFo3by9JYnhHOFE2SXN0d0Zyd2VU?=
 =?utf-8?B?UTgzMGkvd0s3VVozc1ViTXdWRVlub0pyZm5uVUNMY3hkTUk5alB6UXVJMUpp?=
 =?utf-8?B?dk1TSG8zSnNvdHVSVHBFaU9sVzNzRkFwL3ZRK0pPem9GSENIU3N3YndMSDZ6?=
 =?utf-8?B?NkdKd2J6cWVDSXhDOXBvZVRLZXNXNmw4QWVBSjlwcFE5NmcvMGhxa05NOTVl?=
 =?utf-8?B?clhOcEVkTVpjVlIwK2Z6aW85Tm8zNXNzTU5nbE91ZzA5b2FPTG9wcVQraTJm?=
 =?utf-8?B?bmhVY3NBNHc5RjJ5TDQvclJCckZQeUlxeVcvOVlhQWRzSDFHUHIzMjRoYUpH?=
 =?utf-8?B?bm9iWStyS0FUbDNSM0pabmRxYkw1a2FGTjZ1RUVhWWxhTXorSUJwQlFsai9L?=
 =?utf-8?B?SGlCdmhnRmd5QU5ob2I2R2ZnVU1oTDV5aktpSUw3UC9PQ1ZuVzhlYy9VS3ZS?=
 =?utf-8?B?UlJBMkZ2K3UxOUUrQmVBQnJKSUdpa2pZME1MRU8xd3dWUGY4Tjdhbk1LSHR1?=
 =?utf-8?B?WXkrSFlpYlRCT1A2SDJ6bHJwcWViemc1clMrV3V3b1NxdmEydk8xV1NRNFBh?=
 =?utf-8?B?Y05EYnRhQkgwdVdDOHMwczlGNHlOeDNOUWNKRFBqUUJGcjV6UHhzY05BeEt6?=
 =?utf-8?B?M29xM3dIUHhIa0hRaUJ1NGlvSDhaYklKdmVUK0hnM3BQNHZEclZkOFRZNkpS?=
 =?utf-8?B?c1JkU0FtYUY1Mm51TWF3V21HTXdOd0kzT013bnZpU1daa2ZxSjZ0TlVnbElJ?=
 =?utf-8?B?WEszV0pXRnU5T0lmZm1qSkF6TTFaQ1dma2EzSVJEb1RteUVQaUFhbFV0UWxO?=
 =?utf-8?B?RVEzOHBHb1phVW9pMUtkUWZHdkxkTVBDemE3U05nQ2wxWHlvYzkrY2JUUm5q?=
 =?utf-8?B?QkFoVCs1Y2hRejlEUDRnd1JlQ25ENU1YdkdzZnFjWjBUZTJUSFlPd0NYbnhx?=
 =?utf-8?B?K3F1QzdEbUNOQ1ZwRDY1Y2JoUmRrN0l3UkFJaCtZN2xjWXgxN3JEdmpOdG8v?=
 =?utf-8?B?SjRpSm9ucU9uS1dNeU9VN01HV1JxdS9LbWh1bHRNTnV3V3hQazlCVXo2ZnZT?=
 =?utf-8?B?MTJGU0IrREdKdE1zTUlIQkJ5NkNDMHZhQjlqckY2NCs1dDRtTkJpckF0MUh6?=
 =?utf-8?B?WVhSMTNhVE5scElhL0d6S0I5L2xWR2NFd094c2w3YWtJWHhCUGFyZkVzQzRC?=
 =?utf-8?B?T1o3U1UwVVNKQTVLZGE2am5BMy9NbDNibmN2RW15NTdLTzhsVFlESmtmSU5r?=
 =?utf-8?B?czFKTXd4b0lMUks0ODJYUEJJT2N1anZTVDNWdWRlV2JWUjdSTWpMUXJQOUlW?=
 =?utf-8?B?ZlArSE56T0htWTV2akZ2WjQrT1ZjMnByem45VE9lemtkNzBEd2ZabkFYSktk?=
 =?utf-8?B?V0dIVU85eDNOYWFubFdXLzhpT2ZWRTN1K29SOFpRV29vMytPbkw4TzliSjlm?=
 =?utf-8?B?aHg0RCtDdDVCNU1zREl4RXJZWG5KRGEra1REZFlvdUh4T2NTTzQwSDlNOWow?=
 =?utf-8?Q?YFL5V+v9DeeoqlGOQaf+b59KXz+gePWIEdZLXB17Y/3R?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b75c60-ce19-4088-8f96-08de01517612
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 01:17:32.1721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gp47KklEn35aS+CFpozCrQEkZZq1CGhYy8Ii93YyzAkoe0om8c/+TuvfbQqxjDpN4T9x7tdRSYChKy1fyIntmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7476
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

On Tue Sep 30, 2025 at 11:45 PM JST, Joel Fernandes wrote:
> Previously, bitfields were hardcoded to use u32 as the underlying
> storage type.  Add support for different storage types (u8, u16, u32,
> u64) to the bitfield macro.
>
> New syntax is: struct Name: <type ex., u32> { ... }

With the to the line above mentioned in your reply,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
