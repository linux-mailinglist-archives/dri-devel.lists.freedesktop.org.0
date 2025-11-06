Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CD3C38E56
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 03:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A8910E7EC;
	Thu,  6 Nov 2025 02:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="opvyvvyD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010005.outbound.protection.outlook.com
 [52.101.193.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362EB10E7EC;
 Thu,  6 Nov 2025 02:41:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLNokvt28EyRPPI5ShK8DJhAnSqwCBy67HpdIAhoEGOMkE1Z0VHCB+bv5UKxBjY7KOMPZw9aUsQBO5JsXFAm0YIdR2fzbmc9tsNPFbNUye6NNlgyCE+GB0kPhLCgyi6gCrSMwH+8etBTWRQuMdBvHfbfTV1+XSdrtr7Pc8Sr31ZZIjcseU8lDSTdUk+9si2/QnpXw8dxiGk/cbkbLhh9LcQ/H0Ajp2SYHJ3UmJ/RAzulkhX7h5/ZfBoNI3cqRgFB6tU2Yh0jOYNOjzfzybeDbpx/57k0MHn5VyHuhWfQVqr3vquxI1UKJFbVB4HEqmCDiOzplKMHeH/oOKCt0NjPDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTc1umty7kBsPDT7Y8qL6bEM4GRnEvtemtSwWT54Cfg=;
 b=Vl1ODooZikkMTXmNjQorway43D9V4I7PDtPAj4r6BA6Wr0LnRo+1FtzATPDboOSIvL81h3evyMUgmHyV6V0GejE3bTEU8GH02Da1EB5t/v3sfu7bb5LEFdhMC+I6pBVsF8sW+nasnV35+CtbPTHC8sO/Buzt4DC4LXRpW7fTDxRhsxr1/qEqtkm/jb6zICIKhMf7FvAxw2NUS+vrLqD/DpHF3DjwDCGlDNa5COr+7dDAUVhERdP1ngIyz3JmX0U4Laj304vTlzdAiSh/mwjai0naDR5YY3a4v9kyn6kal0DZJKuw+5krlAPGHOGOw3XNdX3Jkb/G5mg9Pg+FRDxjdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTc1umty7kBsPDT7Y8qL6bEM4GRnEvtemtSwWT54Cfg=;
 b=opvyvvyDL3drH+V/+YdloNQ+IdB3j0c1343aZqGy088/1OPUI4yNEtikalGUvRzRxHzJpZXwsRpJcpYzLwkJUSHkSku0vZW/ZTruw7U1JQbAnyO2pWbIwHRL0WzEn7viGJzlu0AgNLfp1oi/AXpPI8yhb4RgewgoL3CGAjoBsX0mvK3FPYy42+YzEPpX+fBFNJ6jrF7aaxc2r3W+lxdDl8cjFBC/UdgP3nfufU9wrvqWZpSk41RvojoF3q7DjDXmCVA9YEqJNBDiM7CfjlfXxj8tGABOQcAGB9IatQURV3we6kuVy3AfFQLkmXeQOBcQRVxzKQb1t7Nuoku8kz4s9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8330.namprd12.prod.outlook.com (2603:10b6:610:12c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 02:41:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 02:41:04 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 06 Nov 2025 11:40:54 +0900
Subject: [PATCH v3 1/3] firmware_loader: make RUST_FW_LOADER_ABSTRACTIONS
 select FW_LOADER
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-select-rust-fw-v3-1-771172257755@nvidia.com>
References: <20251106-b4-select-rust-fw-v3-0-771172257755@nvidia.com>
In-Reply-To: <20251106-b4-select-rust-fw-v3-0-771172257755@nvidia.com>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0028.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 5be8fe31-07c7-4490-52a3-08de1cddedee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|10070799003|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHU2cHZPbmFuSitwVGNUUVFob3hSS2MyZ1JWNWdHdm54RU9jaDYzejVWSHp2?=
 =?utf-8?B?ckFPOUZCdmp6Zi9hdzhMUEp2TkpNbDBGMlJZaUg5VFVOamtqUTZZTFNXWlhU?=
 =?utf-8?B?ZHBESTBwSnRQa1ZlRWxkZWNQVnczRFJTTUJBRjlCMWJLWkFEVjU4eUkxSUNv?=
 =?utf-8?B?b2JuN0dUOTRUM3hjdndUZjkxQXFERndkb3F3Qm5Palp1c1ZvcGJnWEhleGVB?=
 =?utf-8?B?dnlNb3VRbTRJK1V2VVFnYzhKQTQ3aFFNcXRRNE50bUdpZVVyRVo2V1UrQVpx?=
 =?utf-8?B?c0NwUUxUVFNKN21JbHlsOG1Rdk5PNnl4Rmg3dGxGSkNQaTdKMmhzWHBqQVBm?=
 =?utf-8?B?YWJIRHl0RlZmN1FDVWY1T1FJUk9yRU05NmNmRGtIU0RKNnZzN0FmQU4zZ0d0?=
 =?utf-8?B?YTY0WDc5aWJubVJPVHh2VkhPNHRhSHFqbVdBdEl0RnFEY0xYcU8zdjFQQTYy?=
 =?utf-8?B?bk5CREc0bDZYNjlHMFFDRWxKL3BzL25HZ2UyYzg3Mi9Xd25sS0xxWHRZdW9M?=
 =?utf-8?B?THJoMUU5N1NWVG5RWHhIREpYV3RvajU1Mm5sdFBoOXJSbEU3aXg0YVpFcmE5?=
 =?utf-8?B?ZS9IQ1dNd2dXalRnaU5yU2xLc3NGTkxJdDJpRkRZTXVjOHgzbTlTQWc3Lzdk?=
 =?utf-8?B?SG5HbXBudVlqb0h1WkhYSEZYdFF1UXdzSDZMUld2WnQvdWtYRk0vaWkxcHNH?=
 =?utf-8?B?YlpzVHRlbk1weFRqV0pLRkR6NkFzWG9sdlJlWWxFMUNCSkFNVVRuOUliMkVJ?=
 =?utf-8?B?VmpvUWUvQVU0MzdSN0ZiejJCVk42MGZ4Nnh4ZFBKMmwybzdxRTBhR3R0Sm4v?=
 =?utf-8?B?K2lZdzNNSlV1ZGxmY1Rqb1lNVzhGS2l2Nng5Yk93SmdzZlpLZFBjbzVsd2Fn?=
 =?utf-8?B?aWduMHNaM2FsTU1tQkp4SGh0cnZ0eTVWQkUybnFvbEdBQVcvVEJ0NFphY05P?=
 =?utf-8?B?YU1hMXpibFlwZHM1WUV3MGU5b3phNEdGWGlvVzhJcUFlVWQ4OUhtRDZKZW9j?=
 =?utf-8?B?eStYdFBCdjJlY1hpQldjNnFLY1ZhRXpoUUdnd3BYK0Z5bExQVU9lVmJ2MTFp?=
 =?utf-8?B?OEViRUx5Q3BSL3VLUm41Yi9sWnZrRG5vN1YyL0dBaHVlL3QveHVqV0VwMFlo?=
 =?utf-8?B?ckhXb2d4ZTQ5ZVJUZXFpYkFTNGJYZUZWeFl0QUozaHhkUUFGbERGWk9EejZn?=
 =?utf-8?B?SjFBN2ZJOWluc1lVd1crZ2NEVU5rWXdCYjdMa3l4UUlDUkFFOHJpUDVMNStC?=
 =?utf-8?B?ZmhhVDZIMFk2RGZMYzQrSmlFc1JqbGdMWkFNMGVYOXlQZnNnWGhYU1VsQlJE?=
 =?utf-8?B?emh6blpBNGgvNHJlNEJkMlpVUnI2TWQrdGdZNlpYT0hqMkJJOEJ2NHR4QlJ4?=
 =?utf-8?B?TmRHSVFIcUF6dDZoUEc2K1ZaRjVrcmU1YkNERHh6SkdqQW9wS1FDNjRyL2Zm?=
 =?utf-8?B?ZWRIa1BMcVo5QWFZd3M5a1NVVTRLd0M5RW1Nbms5OUZhVW5XdEpkQ3VRakpX?=
 =?utf-8?B?ZHljdjByRnc2N1E3NTJiY0RCaXZzUHBBUnpSS3YxMkxDR0ZXaHdrdEF5VlRq?=
 =?utf-8?B?UFZnVnZsS0t3S0RWcVpWQXY3VHJ2ZWJBTGltVDFLSWJSQkNkSDN2VzlpWkp2?=
 =?utf-8?B?Uk5weWwwazlZSTdnVXo4MjZiUUVNeDQ2RmcvUC9PTDVyV1MxaXRRR1dwekhI?=
 =?utf-8?B?K1BKRTR3WGxzZzJVWklXN2Z1M2x0ejdocVV5UmZ5cnFOeDZiVkpOUUZBQ2Y0?=
 =?utf-8?B?Q1NQeXpqa2I3TkNaZVFRNUNDV1ZnczRudnFNYXA2d0NVL0pXYkpmbVErakZq?=
 =?utf-8?B?eHJlVUtIWFpMNEpBNXZsdi9zNGFkL0J5WTJOcG56OEpMQlVETmhkVW5GdW1l?=
 =?utf-8?B?WDNvNlM0ckRERnlGQzJ4M2lsNVdOMWo0bmgzbFNqUjZNNzkvenJ5cnNUZzdU?=
 =?utf-8?B?VmU5UmZTSXB6SEtTQzNoVi9sWHpCeHlQMkhZMHNJTHNhcFZBaEplUTlhbUNU?=
 =?utf-8?Q?Z0MVlOZoDJlprRd4Fi8dcaG8+im5II=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L05hSEE4a01UdzZRRnB6QjlBTDEwS1hFQXFqZ01nZ2htSjJkTTFrWXhtSlVN?=
 =?utf-8?B?ZTZacWVLSG9lOU1ZWGNYRUxpTTZob0NuR0dTMTZxTzBsLy9oZkNxdDJjRkhD?=
 =?utf-8?B?cDVzMGM5Rnc0dW9yTnNpK0IxeHYyL3V1a1h3L1FjNFkzeEcydGhnWjFOR01u?=
 =?utf-8?B?L2lIai9NWk0xcU5oazdQU2dMTUl3UFoyVytOa1VqQUhtS29nVTh3eFVRdkx5?=
 =?utf-8?B?NkZvOTBPNFFpYWhPbi94VUJOckd0dkYxcUYwUHFtQVFaZ29FMVFsWHdzWjhL?=
 =?utf-8?B?R3ZMa09uWDVTejlNUUxQeGNPSDdFUTcreU9ZMExxREFuOVJXdGhjNis3WmRQ?=
 =?utf-8?B?TFM2aWZYSW56YmVSVGMxeDhkelBBaGtIL1lPSUN2SGM3RCtTR2lURGhUVE9B?=
 =?utf-8?B?TXNhY29CYm9Pek14YjFHeFI2UytqV3l3ZmNZdzJwU3RyZmp2eWxYSzYzRGpj?=
 =?utf-8?B?dFhyU1FDVWJ1M29WMnM3WGVLOXpXRjZmeExBMW01ZldFalNhWGFrNVhjTlVy?=
 =?utf-8?B?d3N6clRpdERwRjZtOTBVbm9kaTY1UmsxMkxUSEdQR0wvRUp0OEhobzBiMGN4?=
 =?utf-8?B?QksvSnF6OHR3TXV3encxOHI3enFzMzNNU2dzOCtuN0N1S1hMUmQrR1FqRG1J?=
 =?utf-8?B?SkRibTRiR2NrUGhram5QR0h5eVRoait3L2MzWVdDREcwME9ZcnQxaDhrUUhj?=
 =?utf-8?B?VmhXT3hqbWpxaWNMUUlUSUhDdSs3VWVhUnZtZi9mZE5tZG9rRUQzbGxRUUJQ?=
 =?utf-8?B?Q0dmZy8vQTBhNTFGTDF5QjRQSHhEMkxIMEFndVU5WnZhcE1JR0RGT0dEV3pF?=
 =?utf-8?B?R3RJbUk2Y1BFaDVydG9yWXNTVXJzWWQ5UFhiNmpUQnJyK250Qk51dnZ0UXZX?=
 =?utf-8?B?VFNoOW9ZWXI2NXV3SngxTWJjQzZWZTZ6eVlRZHRNSU9FQSswZUVTM0x5aE1J?=
 =?utf-8?B?ZWxNSjErNjNpUFJvd0xBZnFuTXYxdHROdDQwcTkxcGxxeDJXaDkzR3ZYbm1K?=
 =?utf-8?B?YTlLUDVwcnNyTlYxVU1GOUVsZFMzM05vWm9Da1NLTEMrTEVYb2o0Y3IrYTY4?=
 =?utf-8?B?M3FRbHd4dVE4T0tCY3Y3dCtINVBXZ2lJdVp1eVk5UHRzWWd5UkFITGJac2Yy?=
 =?utf-8?B?M3hFSFp5RTZyTFB5U0l6dm5rREN0M1hGYm9wazl2NkhXalYvTUh6c1BuekRF?=
 =?utf-8?B?OWxuY1NmVzE4SEpEYTQ0MFJqQlBDaEZPZFo1SnBvcXhkWHpNQTlJUWFYenNz?=
 =?utf-8?B?My9WQVFNbHA0dWluaGJTakxxVUNrYXV0OUt3c3g4T2lJdTczK0NoZFQ3eGRT?=
 =?utf-8?B?ZVl5MFgrcENIeTlTT25Wc0pCV2FkVWdKM1BsNWNwYk55dXVoOFVnSUM4WWl2?=
 =?utf-8?B?YlZZUFIzSW9sM1V1eDZmUXNDellqWDdPSSsvbzFaT3lRSzd6R3pJeEd2cjdZ?=
 =?utf-8?B?Mm9tb1c0Z0Q1RS9JK0tuczdtK2lPN2pFT2xoUnlFTHQvL2JBVHlWRnZQKzlw?=
 =?utf-8?B?ckp2TVlHSitoaEFDL0NrSnN5dHREdE1sY1NzdzgvSFlEdnRBOEk0Q0c1Rjl4?=
 =?utf-8?B?ckpXTTZvamgwU2FYOGNNNVdyZWJpTUUvS1NYcnU5cHV3c0hCWDhnbHN1S1Ni?=
 =?utf-8?B?emphZFZiMjExUFJnYXRDaGtHNU9XV1NhUTJJQ243NGUzaWFmaWZKLzFGRmpj?=
 =?utf-8?B?c0tmclBDVE4vYnltQXJtdXkwREs4L2NtR29RelhhZ05OSEZ5eVdnY1hqRWNZ?=
 =?utf-8?B?ZW9nZVlqQjdEc1RMQnJIK3pSNHR2akVlZThQWkRScGdDR28vckZydklBVHU3?=
 =?utf-8?B?NUpvcG1tWnluY2JqeWpzdXRjZktXbG80ekczVU5ycElRYVhtM1k4K25KQlNr?=
 =?utf-8?B?MHhLZ0RwV3IvMEh1TUxJd21oWFFlNjVRWTJiNGVSd0JsK2t5djkvakhBeHFB?=
 =?utf-8?B?aUFmRmdyM3VNdHRRclgvTVoyZ29CT2FFNFRCRGZMUnhhMU0rS0NKQTN0dmpw?=
 =?utf-8?B?Y0FGWHJMRFJQcUxncFFtZWhDWU1FeTEzeDRWYUp6bmJOUFdQKzhMVXZmL1ls?=
 =?utf-8?B?amxzRWxMbUs1WWV5Rm42N0N5WnZOeXQrWGw3TytGcTNleWN0blhPT3NteTQx?=
 =?utf-8?B?Ni93R0NlMEFySjRrTUxGd25UOXY1K1RReWV6U1B2WHdWWmlCN3h2MWFVUW1n?=
 =?utf-8?Q?WDh3b5MG6qxSMYgnJ55mH8EFjKEG8pT7h2ss0cU5Zm1r?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be8fe31-07c7-4490-52a3-08de1cddedee
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 02:41:03.9879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1mu4UXWRLcRewEBQGxeoPuoHCVEw1bHSzDu6O3t8Ny9eE9o+PyE4rfTyElBCCgBX+BoIcw07qQZXi/34YPkcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8330
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

The use of firmware_loader is an implementation detail of drivers rather
than a dependency. FW_LOADER is typically selected rather than depended
on; the Rust abstractions should do the same thing.

Fixes: de6582833db0 ("rust: add firmware abstractions")
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/base/firmware_loader/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/firmware_loader/Kconfig b/drivers/base/firmware_loader/Kconfig
index 752b9a9bea03..15eff8a4b505 100644
--- a/drivers/base/firmware_loader/Kconfig
+++ b/drivers/base/firmware_loader/Kconfig
@@ -38,7 +38,7 @@ config FW_LOADER_DEBUG
 config RUST_FW_LOADER_ABSTRACTIONS
 	bool "Rust Firmware Loader abstractions"
 	depends on RUST
-	depends on FW_LOADER=y
+	select FW_LOADER
 	help
 	  This enables the Rust abstractions for the firmware loader API.
 

-- 
2.51.2

