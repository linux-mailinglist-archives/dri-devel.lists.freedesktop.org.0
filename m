Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D19CBC466
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 03:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8EA10E0C8;
	Mon, 15 Dec 2025 02:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MPSzwtEW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011047.outbound.protection.outlook.com [52.101.62.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A8F10E0C8;
 Mon, 15 Dec 2025 02:54:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5m26uurtXQPAVPe4Zc7vq7KURz9IJtiK6TVVCAUL9iZsNT1/qZLCGeinB429BskHAAUqfVOpXZOBMOQoXLLlcTCbOYW8fkWUOgXo1DOUWGqETK7iJLtJJ3TS4Q/YvVdwwEFZzX/548W+r37M4/Mto/iKxxH6mzR/rKfWdAWvo+Vt7h2ssdBVhffFcHcDMeGWBKafT0UczfiheYfdwyRiBjrEjT7dGbSpDlXkMQMzhwkDopTj+J0kyqiK66qCNCaoczNrICkEANWXdzKIWLUZxIZnDHYLr+kr+6+Ao6Eq1HAZNQFDiGRr43u2CmYjoCWZivNig6Rd7zZ5Q4Mi+gzFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOJsZitpFrUVWpW/hNwLMzkue8GLKvYx5j7b7LrCd+8=;
 b=n0DgfM2VMmRvZUqHscwHWVNW6bPEOqqjb75hI2HKO5AlYzIVy+um8p6tebpb2S0JdPW3r3ud0G+/wqiu+HAfRHqR03nSen0yMrzB40DSesPqr9CP+ScnHiRMNKFz2JQ8AmyxPiLXXlWi/Qo9FY5cM5Js6gcnl6efzb9Ks2CYZiiPgG4/JKjlPJKz+NAP5WMcB+K3rJyvvE1YejCZo0lOZCKjFkge3jl5Vf6BIf6ePWALw+7TxfsjsKrYUU+fE7VhBHVUJu+SbSc+wD5IUv9uy1sWluy1QVDRA9PnATHpZ3zFwpFNm0G5WVlB3TmRyOuHM50dOLRev2fcRFHvmFJtMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOJsZitpFrUVWpW/hNwLMzkue8GLKvYx5j7b7LrCd+8=;
 b=MPSzwtEWrNmVynBUjPvoPRSpwgUu8LLJzXo84N7wU3nIj/OOYMOg+9nug3CfKZVSXpGNZpfgftgKj54G1t9mtg9JSnp3KKmjtiC3IRMnv2xdfG8UN3ge7o4fG26Qrs6Tx4tggW5ATqT2USxKWgR1tngM7ScxXmyLYDt4v2yQ9rbohgtICYF2wxOfPwI58qPcH/02FfkRk6KgqSn31ZdMvG+8L/jOxnWnZ6X3cPHe8hxhG9blMcBkTZgn2UsbLDuSBrbxsuGowEuM5kgs3hoPZXMle0Tc//T2v6B49POL8HWkuJdHCqPVsb+szyBYVQec5dLRxEVlESZwo3hFDFpZhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB5865.namprd12.prod.outlook.com (2603:10b6:8:64::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.13; Mon, 15 Dec 2025 02:54:53 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 02:54:53 +0000
Message-ID: <b046ae27-3d68-4b2b-9464-1d481a8b8faf@nvidia.com>
Date: Mon, 15 Dec 2025 11:54:46 +0900
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] gpu: nova-core: gsp: Fix length of received messages
To: Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Edwin Peer <epeer@nvidia.com>, "dirk.behme@gmail.com"
 <dirk.behme@gmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "dakr@kernel.org" <dakr@kernel.org>
References: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
 <20251122-nova-fixes-v1-2-a91eafeed7b5@nvidia.com>
 <504C636B-FB96-4B54-B9CD-C506026CCDB1@nvidia.com>
 <25aa90a7-e9f4-471e-9d93-c61b9a7a429c@gmail.com>
 <lgncc2k5klyqxzlz52dzia5v5ly3nfnjbv5if6esniulruahnz@b5fc5bfyltny>
 <B5724DA0-6031-4576-9B3D-DB67569711A2@nvidia.com>
 <37cc2302-6a3d-4046-b28c-605221a67329@nvidia.com>
 <7f80c6cfbcfb8097f79af6b95f10270743c5ab7f.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <7f80c6cfbcfb8097f79af6b95f10270743c5ab7f.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0131.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: f5cd47ad-a70f-4c01-1be7-08de3b855232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M253MWRVMEFlNU5xQkVBQ1E3cUN1Nmg3eFFuSjFaanpsS2Q0RHdrU1l3Rk1S?=
 =?utf-8?B?RkVtU3NEQksvWVE1ckdxSnlvN1Vqc1c5aWowRmlFNnhVTW1pVmk0eXZXY09M?=
 =?utf-8?B?NWRsMjdYL0lEV3VjUXo2bGZFaUdlNVFvdlJJRGUrUkpIR3JHME02UDdVcTN5?=
 =?utf-8?B?UjRzWHVZWVJERFdDMnpSU0NXbC95c0drZ0VpL3o5NnRJbEVzeFo4WFpBTlp3?=
 =?utf-8?B?VzNGRTYzSm9pMjB0UUZaSVU3d21hcS9PUTBBenpyMTB4NTdRc0tzU0xIYjlL?=
 =?utf-8?B?KzBZdzJRYWp5WXVCM0NwK0xTWFdLbHdpZlB5QzdmNm9EaWJqdHdMTW43VzNQ?=
 =?utf-8?B?N1cwMkdyQlR3TjF3TDlXM2ZCQm9kTWtHOUFHWTJsdE5vUDJ6N3hCVVVOSE5F?=
 =?utf-8?B?Z01tWlBwTzNKR29HOTV2WGZ6K0lxcUFreXJsSkRBd0RPTndiUzM3SmxBdHJr?=
 =?utf-8?B?L2orbXUwZE5MZUFQbUgrdWZwaG1PNGRtSWNMTWtxbFN1Y29Ld1NZdjlOczZO?=
 =?utf-8?B?N0lDeUpVOWs0OUxrMksvK1hmU1BjQkdWTGY2UUdQUWtqYkR6RnBzTjg2MnhV?=
 =?utf-8?B?bE54ZTJGUFNFcWg2VHRQTE04TkRDR3hCcDc5NTdINndNVWhORUpBbzhFQWtY?=
 =?utf-8?B?Z3lvZWJVTnJWMGgvVW9pS3JpM0p6dC9iUW5GNWo2RXFBQi9FM0k2UUl3ZW5h?=
 =?utf-8?B?QnlYa0FaTndyenVsTWpKcEF2L0pHUWYvUVlhdlFRTEpFOGZaQ0c4TGxrYWp3?=
 =?utf-8?B?TlVHOENYbE5jL1g3T0Y3N3BUZTQ4NXM4TVlNa0p3SzFqbi9md1hLWHdRdjF2?=
 =?utf-8?B?OE1obmh3c05taG44eWo5L0xGUjhkVG84aWlIRitKU25KVWdIU1pkUkJjYTF4?=
 =?utf-8?B?RSs0TnhPU2ttdGp0SHgxR0hJNEdCT3h2d0I5WEtPL1FPcUloTjVKU3drak40?=
 =?utf-8?B?T0svL3h5NXNnTFlEZnh0TC9nMUc5OU54a1kyd3VqNmxnanJBanBmSG1xM0h6?=
 =?utf-8?B?d2s5enhBL042WGZDSnJpelRmMlN2Z0EyR2E1cnE3cE5OUnZnTFRsRDI3UkIy?=
 =?utf-8?B?ejEybnAxUWlVN3dYTktmVW01ZXFYNEhwMGlRZTZoblk0Ums2NU9CdG9Ncms1?=
 =?utf-8?B?N0tiUnpLWnVBdlAvY25Oeko3M3lzMHZSTVc0dE5hbVJOTjQ4dW41b2dCS0ww?=
 =?utf-8?B?b1d0Z0tjRjMyUDNQbW9tRmpNbkJFNzJpZXpFYjNuTGNiZmxHc3hjWm9LRGRV?=
 =?utf-8?B?Mm95S0k1YndFNlMwcjZpSk1BclNoZ1hyRXp2VTV6TDg0T3Y1dGdCOFFad0d1?=
 =?utf-8?B?N1JFL3FyZUpGdDlHL3ZESW4zb3hsYWpoUGtCNVVlQ1NDVW1jYmpYRCtZQ3J6?=
 =?utf-8?B?eXRUSFdhTm8yMmhuN08wRDJvRHFWeWRiblhFRms2dWZabDhYNEVrNmpuNlNO?=
 =?utf-8?B?d3pSZ3ZlTmFiNzFzTkQxclIvekRENy9tdEVGL05FdHk0UHltNDUvbE5UODF2?=
 =?utf-8?B?V3dpY29iVEpFblRQNlVqWlhNbEFidEJXcTRKOUpFSERLQ0ZwZi8vSkVkeVUx?=
 =?utf-8?B?NjNXelU1cS9mdFN0MFgrMFhwc0pFL084Q1VzdHg1bkFwQllQeUlzb2oxcXh6?=
 =?utf-8?B?UDdNV0FvUFdWRlZYdFpvUWxScWlxaExlQ0RiNVE4dFJUNzlpU1NMelJ0Z0Vx?=
 =?utf-8?B?ZSs3WThaZ2JkRHdVVjlWQnY0d2hRYW93ZjdUaUNoem1MYUY3OHpzSk5rZU04?=
 =?utf-8?B?MW9OYnNWa0o0b3Q2QUMyMkxTYVRRcGMxMi9BZ2tFc3drK2dRd21KWHdzUC9m?=
 =?utf-8?B?QWExdkJham92OXQwWFJiejFkWHBrVUlSVEVGb3lOekI5aTJWeEFOZHV4WHZU?=
 =?utf-8?B?cm9JNHhwdnRGZURrTE9HZi9EWmRNWmxhMkt4UGhFZ3V6TExZOW1hM3R4UUZy?=
 =?utf-8?Q?s3lmbLM06jpeEYUiRJhZ4eMgcTWEe2bt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0c5UU1nWlEwckg1dG03dUNNQlBlT3BkQUVhUVVTS3dIK1hUd1Q5YzFUcmJU?=
 =?utf-8?B?ZkVCejA5S3duaDNOSHc3WXYzM3VtYWZCMjlycmxuSzdyU09XSG0yZG5yeTdr?=
 =?utf-8?B?QTk5SzBEWGY1UExSSnJmY3FoVXh4dWlrN2pTKzdQZXEvcEMzYVB5MGU1VWQ2?=
 =?utf-8?B?ZkhmWUpBdzF3T1crV0lzZFNKakVTSlNRZWFiaTEwTkNyZUxnV0tjSzJnTC9i?=
 =?utf-8?B?Y3RJazB3UmFNYmd5RW9pb0JKKzJIeUFyQzNhYXlpenFielBPOFB3K29nNlVB?=
 =?utf-8?B?em9CVG5xc0xNemI5UjdEaUNUT0Fza2o5aWxaQTNiU1I5dFZPb254YUgvTTBn?=
 =?utf-8?B?NXJHaVBYTzNTYzNXZ2N4Z043aWdxV2lwZnNiMkhjbFljbmpHSEhHVUY1Q0VX?=
 =?utf-8?B?WWxYeTJpeU9xYi8rZ0syUVJHcmdrQkZkMVNlVUNZcXplc1hONnZ5dkxSL3kz?=
 =?utf-8?B?NHRQdnpqYmh0ei9nTkMyc0FMTlRoUFQwZXlWY0U4VmRNeGZEeWVpbTgrZ2Vl?=
 =?utf-8?B?Q0lKRmtUU3p0QnorQzhrSVJlMzFQdmJKcytXdmQwRXVGbzVtY2VuMTFUdU84?=
 =?utf-8?B?enVuQ0FPNHBSN2tYR3BJRGRyVFNhWlRneHpOS0tsM0JLcGY5TGMvb2JVLyti?=
 =?utf-8?B?c29kc05YaUl4UC9HK01nZG5TZS9PM1NzRXlzdmt6M25hQ3E1Q3laRlh5Z01o?=
 =?utf-8?B?VXdUb3VzNG5DN0lJRWp5T3NiSG0yVFR2MEw0TGlBaFF2ZG9SMEpzOUNBcXp6?=
 =?utf-8?B?aWs1bG1JcWV4R1BJTlJVYjE2a0dnMUN6UFprYzBMdUQ2aktPSVVEQ2RzdXZS?=
 =?utf-8?B?cHg4QkkrSEhlSnBGeGpTMk02VTNyV1hEWEVvMGl3eHZ0UzB4eXhlcFFwdXJS?=
 =?utf-8?B?ZE1xVlh4RDJUa3UwN2FaVnlMRVRFRmNLeFA1RE5aVXBYM2FXaW9abVlrcUtS?=
 =?utf-8?B?ZHZZYkh6QmVleFJPalZXN3c5RjNTSzgrNFBES0VoeW1NUmFWenVraENFMFRL?=
 =?utf-8?B?MnFoektiQVQ0MXNBaVdPbjJOcVNZemIzR3UwRHhtczVJRVlLc29hSTd2eEhY?=
 =?utf-8?B?MGZvUml0cEo1K0xGRy9sa2JXNERNdkM5Q0xUdGx4MWw3b3owMUJlM0R2WCtJ?=
 =?utf-8?B?Z1g1NWVncXhMSEtMVzg1b2xONTczMk5OWkpoVG9kNG5uclpnYVNOQ0VlZkJM?=
 =?utf-8?B?elhIREtrK0FwbmkydUUzWE02YW54R2t4TVRNMldSNlpBY0l5UjFWWUowUjVq?=
 =?utf-8?B?MmxqcnJvbEhKWFBvektWK1hOMjN3NmJvV0w5NDY4QXE3aXB6bEgrOTc2SldM?=
 =?utf-8?B?cHVvZFNjREhpcDRsOGxCU1FpcmFLL1dnVmRTZmZvM0FhQ2d6ZHVmdWdXdVFx?=
 =?utf-8?B?ZGJXbDRxOG5mWW54VzFZam5oQk1Tcm5qMDY0cEx2WC9pR09YVFpPcTBCdjQw?=
 =?utf-8?B?bFZUT1hVbFM4Y0psenRPTnZPU2tKWWFWc3YvczR6YWpPOUNETzRLUFNaQ2xT?=
 =?utf-8?B?aWVLZEJZaGFIdnJtUXFTRG1Rd0Fac0VWSmY4dWQxYzlQSTZUT3RkYmV6RDN2?=
 =?utf-8?B?RnFmYjhVZVNRWkR2bWxyc1hxTS9OS2pNbm5yRmNiZmtXM2dnNmhjQ05ER0RK?=
 =?utf-8?B?VW9OYlFra1dWbUlXRk1KejJuVWtWeVVIaDg4cnlmbGI5M1dXSnZBRU1Ga1Fq?=
 =?utf-8?B?dmQwRHpFYUplZG12aDFvdkpzWnZjdjdrM0ZVT1RhU1FaenpIZk9mZ0FhbFJh?=
 =?utf-8?B?ZTBWODM5T25EMDlhQzR0YjRoQU8ybHVTM3N5QXNqOW15SHFnbk9RajBpV2xX?=
 =?utf-8?B?RStpMWRjcFk5TmcwTkg4dUpleWxDRVYxYzluTE1lVUZVbVBhYnZDSDFtaDNO?=
 =?utf-8?B?ajdIWVNFU0x6VWJySWwvL29ZKzZ2YzBFSGFESnhtOGJKT1NESmdwSEh1VGtn?=
 =?utf-8?B?dlorTHIxQlVGT0dWcmEwSHY0d2gzQlZlZ1MwK2QxcFZNaHpwandZQnRmUFlL?=
 =?utf-8?B?NzQ4SnRGbXVaeFg1Qi9RWjJQcDhwMUFyR0xsMVh4QXBHRGhRR2RpSCs1aGVQ?=
 =?utf-8?B?cHFEYVRuQ2UwQXFjU1JRZVh6VTF2WE5lLzZNMzVhYTVRa2FyRkwwbTluYmNz?=
 =?utf-8?Q?u/t+CjIS0nhFWZEiZifDoaypk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cd47ad-a70f-4c01-1be7-08de3b855232
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 02:54:53.0360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWsh7A0zLIMSHigW5roOwBm3vCWUgDZuWcZvKDaHW62EBhZ8yoBBxp0LywrV4OTrpivVmn1EGAZfqZ2qzXVdFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5865
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

On 12/15/25 11:47 AM, Timur Tabi wrote:
> On Mon, 2025-12-15 at 11:46 +0900, John Hubbard wrote:
>> We should treat data that comes from the firmware as not yet
>> validated, external data.
> 
> Maybe we should make it a policy that all data read from firmware / disk needs to be instantiate
> via a constructor that validates all the fields.

That's one approach, and maybe it will end up being the best and
most desirable approach.

But I'd stop short of making it a full-blown policy, because there
are other ways of validating the data that comes from the firmware,
and there's not (yet?) any real need to require one particular
solution, I think.



thanks,
-- 
John Hubbard

