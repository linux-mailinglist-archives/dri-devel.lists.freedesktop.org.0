Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBrCK3RJnmnXUQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 01:59:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F138518E714
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 01:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D8C10E012;
	Wed, 25 Feb 2026 00:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b/KTuonr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012024.outbound.protection.outlook.com [52.101.43.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBC410E012;
 Wed, 25 Feb 2026 00:59:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5PMCvZ8bnC7JO97LR9HO06BpHG5cFP6QD55L458kepjG/F2zMw1Ajh4HDhj8z8DyPqBuzQJjf5SiOyd4JIUdnJqpn1V1Dx1ppELWV1xqiZfM1/3d5h2x76g1Bl9LngrNAPJFt/77Ezw+PJyvgXmKPNKtUWbIirecwJbMb3Zt9Y23ozqg/FKXaWdUleysOU52Ge3PtiT2a2/2QH7bO5fAtrsOBY6IqY1qbAAYEHdH2YIvpRYzTUVOEVNWVe0xME2rJXHXFrH7WxCn1wDTcd0rGAjvvc2JzayrW3zzSpkeolqtDRW8L8umfSNGRWlaC26fQBsV2PRxCaZryon8RFhwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIZ1ToEx94aFqPOIcv1XCBaJT7OCYbS+Mc0+I19D+dY=;
 b=sWZajhuGpEFe+DDVo7iriR47YMLLFcNlht3sgaSqAWmGWlBkJbrC+Y2Yk0YOEuyb6WyqDDBRhvb3l5tQyx9frKrCBYqPex0+iWyEZVMXQv3oAFaIULf6UurSNq3sY8brzmOLhQ43fhTb3qg2Yk9fu6nT/TRS/q6NKDQjak7b7lxs4kLhQPCNXQ14j6cikHqHFA7sgv873CavGNvdwb28pVIJyabyAeKsuCgy1oXqx1frF/0A1/RcDNzG9fT94O7nlM2Hd7rzYt27vjkfdk3YZrYxvC2r6qL8Mb8ogswEWuJGTtPCf5SSD+FUn/5aUey2dh42tIfuv9ZehsC/rJBt5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIZ1ToEx94aFqPOIcv1XCBaJT7OCYbS+Mc0+I19D+dY=;
 b=b/KTuonrP2ZA8tFzwmgbqkmweq/nMlwsnhS8oVRFwEIdtWo8aaWdkhU9F5Y/cxBdbqA/B0KpeZyOvceazuPgmUDL4HmjV+4eETDa4/hTeLM1La1AS/iIMesT+gMUlxNLgNPwGq4EU9x6HyIMdAqwq/XGaDMM9JpkiGq2K22Lj1d+OS5kWHiAG18Se5RhDHnsS7eafdWJPNy0dOnJN38V7hBf6xeJULGZiQEmAhbkKJk19yBRoJcwvh13AJylM+Z89wpgdAW7FPN8Mg2wqJk/nwT6SxC427MF23BNABVIK3auZf6+Wnp1w6WaobEjakvVYAy5UOgWC/wAn1UT5yg5tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB5631.namprd12.prod.outlook.com (2603:10b6:510:144::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Wed, 25 Feb
 2026 00:59:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 00:59:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 09:59:17 +0900
Message-Id: <DGNMWA08KSTQ.32N5GJNLIWK55@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alistair Popple" <apopple@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Dirk Behme"
 <dirk.behme@gmail.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 0/5] gpu: nova-core: use checked arithmetic for
 firmware parsing robustness
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <DG02AXMZMOLJ.8HNHT4KH8O69@nvidia.com>
In-Reply-To: <DG02AXMZMOLJ.8HNHT4KH8O69@nvidia.com>
X-ClientProxiedBy: TYWP286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB5631:EE_
X-MS-Office365-Filtering-Correlation-Id: dd705ec6-259a-4172-837f-08de74091caa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elVmdTlxWGM1Tm96YnFUblA0ODN4V1o1QzBKQU5CaXpkTzR2OVNjQnRMN2k3?=
 =?utf-8?B?c0ZncmdXOEdRcm1HU1lvZ2duQ2RFUXkvbjB4Z3c3WVhuMHMxaXpLSXdWN0Va?=
 =?utf-8?B?NUZuZisrbXA4UlFNUGx3aFB6Skc1QmtvaldTZEExdXZFbCtoNHdJU1pWMFhE?=
 =?utf-8?B?TzloWGNMS0xwMjBkT0hueUYvMjRyUytwOUd5bFZSSFFPNTFYSHU2WVlYUlQ4?=
 =?utf-8?B?aWV4d2hsdE8rbWRyTWFNUTFuSEs5SEVwVERHbkJQcEhMWE9yWE9qcENJTm8x?=
 =?utf-8?B?T3RPZUV5K1RGQ0hDbGlKaE5rN3U5Z2lha3YwYm5WT2wyWS9RNWlZMkJkRnd1?=
 =?utf-8?B?Yi8vR3hpM0RNRXh2ajFvc2w1c1lPVFVRVGFMVFNWWm02dEFtQjJBQWp2Wjha?=
 =?utf-8?B?WFpHWTFWK2thTm1kaTNqaFI2UVF3aXdnYjFlYWR4L1A5aWthZU05RXRxejlm?=
 =?utf-8?B?WWZLY0o4QXJ2QTFKSjh3MmRIcDZLc1RaNExyNGRtSGN6dXJtaFRGSzBDc0J0?=
 =?utf-8?B?UnpVQ3AxQmxldDRXclphZEh4MXFUWXRWOU4xZ0VCRGpKd3pmeWY4RWNicVEz?=
 =?utf-8?B?SjZIbFY4clFwWGF2ZC9Jc2ZLcXZlRGdnWkdoS1NhYVdOTk5GQ1dYU3VNRHpF?=
 =?utf-8?B?OW1mWkd0bHJTTGJZc3YxYXI2S3FpZ3pDR3FqV2ROVzVMWUlHOVdPOVJHeEp6?=
 =?utf-8?B?eVBkMThOcWRFWk1UTjEzUlAydE9aSFN0TVpQTlBXUG5hSjlCaGs1WGN4bVRE?=
 =?utf-8?B?aFQ1QUFFbWxveGJVaEh5Rm5PV0kydW94aHpESXBRcVUzakt1VE5nZnREbnNU?=
 =?utf-8?B?bzI5a2ZpNEJEQ0J1YllGTkxheTRIVTUrTmluYThXRjNnZjlFRHBrdEtHelBW?=
 =?utf-8?B?Ti9oRUFFeXBwOTJMK3JyT0ZZcHRSbEx2bHBiSDQxc3FJL1RUbi9uYmQyWUtX?=
 =?utf-8?B?ckltYi9oMkY4ZnpqVWVkcysyZnU3SnB4M200VUFpeXdVbGdtallodVlTdEQy?=
 =?utf-8?B?OVlHOTBRUnlNRTJmWVlFbWtYS0gwKyttU0MwdHh2dVlBZGo4NWFPU3p6Q05a?=
 =?utf-8?B?YnhqWWcvNmRZYlRKNHVQK0twTTFsVkNCNnhuUTVqL3hzZ1RlcDd0QndHWmMr?=
 =?utf-8?B?NG5ZS2p2QXRWSlZWWEtsNHErL3MrQzl5WlNOM1lLbUF0SlNEMGt4a2VBSnBz?=
 =?utf-8?B?MHMyVTFFRFN2bW02bEh4b041UGRiTkI3VitqUVdjd2hWdjd3UHc3bVBqeDFB?=
 =?utf-8?B?WisxN1MzTUtrODZOdEprQkdhdWMvcWMvSnZIL1hzRWNkenB6NjJsSXV5aWll?=
 =?utf-8?B?bUkwTWx6bDRCMVU1WXZHeDhKTWRXaVhXSys1VWlkSWN1cVZ1OTJ5VzFmbG9v?=
 =?utf-8?B?SFhWNVAxa1JBLzlKZlVsakFvSlQyWHhiM1FzendjU3hwUzlseWIyN28zam1I?=
 =?utf-8?B?OXR4Ky9mNzNYSjB5VzNMY0JtTS84akRJT1ptQ3N3bWNvT2p4WVdValJRaHpD?=
 =?utf-8?B?NXovSW5uWWIyYnRkbXpYYmFOTnRzOHIwMS9XcGZQeld6QXl1T1M1eU13b3Fp?=
 =?utf-8?B?VTByeURwOGxPc0p0azAvYi9jRWY2dTVPNzV0bWJaTmRkKzZqR2lVeHEzalZ6?=
 =?utf-8?B?TUlVRm5JYVRRckVFMWliUGQrZ29nSXdzQjBOU1RRdmJQd2t5bmx5TGo5WTV0?=
 =?utf-8?B?WnlEVkVEbTV3eGhEcTF6SzFOSlNuVUw0K1VJU3l0MUZjbkNtVWwwNWMxL2w3?=
 =?utf-8?B?K2dEQk9WVWsvbWIxRnZiTVhReHMvVmZQS2FibUJaZ0RndVNRNURWVVU5N0Qz?=
 =?utf-8?B?Zk1WRW9YanJpR0hxUVJQOW5Qbk9weW5BdGpzd2Znc3FXSnhsMzNEbnlCSVRH?=
 =?utf-8?B?NitDeCtDeWtpb0xzMlorTEZRUmVSaDZHUGNlbExYSjNQcTRob2VGc01tdkRM?=
 =?utf-8?B?RDdRZVVOMUZWWEUzVjJyVTYvVkVLNXNyRG0rQUNzSGNpVklBOVdWTTMwNm5F?=
 =?utf-8?B?QW90Wi9BQWdrRjZBeFpVZVE0MTdKbW9jdWMwTlR1RldFVDhCT2R1dUJoWEZj?=
 =?utf-8?B?VjIwcnE5ZGg1S1dSc29HTVVKTUEwUzNWUTRENldiNDRTdFpCUkhVZXFuU0tQ?=
 =?utf-8?Q?67ek=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVNlTURnYy9tZWpTRFFaUXo5L2lId3lJaUNKNU5KWUVZeUo5Q1l1TllDSk1G?=
 =?utf-8?B?aC9DVis0UUw4NjZnMUFIaUMwZktYREpFeWdYM2o2RUt5TjZkaHZvd1I3YkVX?=
 =?utf-8?B?TDlydHFHS240d3pVU29BcjRTa1hPQ1RDVUZqekE2eURSSHRKdUtJbFFqNzNv?=
 =?utf-8?B?Wm9mT0dvdkI5ME1HK29YOUQwNGpLU0V0ZHU3ZFUxN2dScnhUdVI2QVdVQ3Mx?=
 =?utf-8?B?Qkx5eGlpU3RyRi94ZmtzZEhJalFDbDJQSmNua3NXUHVwQkEwVWZEZEs5c2I2?=
 =?utf-8?B?emZGemlRK1UwQUFjSDdPL0svQzVvQ1I1V1RSNnNBZ1JVeU9raDZPY2VRakcv?=
 =?utf-8?B?L0hkaXZtd3hWem9qQ3hLVkJ0YUN0aUhGVkVOci8weWY0N0QrNTcwQU1wUVha?=
 =?utf-8?B?M2xnQ1luZmdRZWhuT294VUFPK0srY2ZGakYvOGJHUFJnZmlwYUtSMDZ4eVRJ?=
 =?utf-8?B?U3gvTTlBSjg4dkRBaURlS1VkakUzRXlEbEpsM2lyQ1hCc3MyWHdSM0t2cmND?=
 =?utf-8?B?SFp1YXAySzFGZGJtM3RWL1NRaU51WDVla0cybi9ONWVCZFJPMFUwV24wdFp3?=
 =?utf-8?B?Q1BTWFdsK1orK21PVGhCdi8rekpzTC9jMjAzZmlwRnVSUzQ5Y0llRlhERk1W?=
 =?utf-8?B?ZkF1bVNXQ3NZQVlJRTZaVW5kQ1NMOGM2TFAvWnVlYUU3UWczcUhQK3NtNVlq?=
 =?utf-8?B?d2tDek1jS3hCL09leUd2ZDZKb0t0bVdGQ0pCWW81OHd6RjByMWxVL3lZbG9L?=
 =?utf-8?B?alltZEFUSnF3N2NJY2YzTS9zMzNqNEZqODUzbklsQXhUTEwydFYxeUdYM3M4?=
 =?utf-8?B?Z3Y4Ykw1OGpxMkVzVGFudFpzWjZuSCswVnB0R2hBaFVKNVhJOVlSWDVkTVQ2?=
 =?utf-8?B?YmhMM1V0aVppajVGT2hCc3JFZWVHU1pBZE15d3V1clVkTENXbkF5T0VTTi9s?=
 =?utf-8?B?YkpPR1ducTlwSUY5b1psVmxhWExHT2pjNWZ6bjNlWWFqb28yN1ZxM2JTRXUy?=
 =?utf-8?B?NzJQYm9zd0l4d3llelhLR29RZ1BwMmpySFQ1Nmw2em4xMkxaZ2FYMDg1Mi9M?=
 =?utf-8?B?cnJ5UGl1OTRpN1JkazlscHlXTW5mTWhDZzdZeGprQ0JRSUp3NDlKRytIanJJ?=
 =?utf-8?B?QjZpUHdYWnRrUGZmcTZ0VVhaaDU3V0NEVWlGdnY5T2UwNHRENDdGR1k5ekFW?=
 =?utf-8?B?SFF5R05JakpUM0ZiaEhRWHRZbXNuZ2pSY3hCNlVjR21JWmMzN0Z6bFhsVWJM?=
 =?utf-8?B?ZG9XNmMvYjlvZldHMm1MVk5WUnFhUVhoaUk0dFQ5ZmZSTlZsaWRJczRpa1pX?=
 =?utf-8?B?cHNPcWRGQ3V1WEhPYjVZVCsyV0FRWnNRQUJiZlk2WjUvdHEybC8xRDE0SDZi?=
 =?utf-8?B?NWpKUzZQdlZYTWN2T1pTZHhPdXZ0TFRqL1M0QkNQSEQ2S01yRlYraFFTUis0?=
 =?utf-8?B?bWhzcllDck14WUhMcHY1U1RVRDRZeDc2U0l0U1RoUXJpaWptbGM2YmhhTGEx?=
 =?utf-8?B?YXFDNDJZNjBXT1Q0UkdBRmRRNXNrcHNlTVY3Q0xuelhXRW5zbmJJeUQ4MGRl?=
 =?utf-8?B?NFBNQzNOOE52Wk1QOGdjUFNaVDlZWE41V2psbGFWdS9lSzhhNHNRcXZmQjVU?=
 =?utf-8?B?T05IRWJZaVluYm44M1hHeTA1UHlIZHJMVHU4bnNzNzFYKzVlVkF1Sm51dkpp?=
 =?utf-8?B?UDlCQXI0SDNZY2lOMVlrbDJFMFVYTDIweHRpV0RNVlMxYlRiSTVNRWVFZExL?=
 =?utf-8?B?UkR3VGp0cHVBSDQyTzNvTHI0UlhFTFptVXBmUUJsYVhqOHFodkVDYzA0Q2xO?=
 =?utf-8?B?MVhXN3R2cW96M2RzMTRCc29kNTF6K0xYczA0ZDlUWDdwUGFEOFJSaEdwNnQw?=
 =?utf-8?B?MlllZVZOWWZvSHBnOVVxazFiWitnTWhITnR2WU9qMjE0TjBaOGFLc3pKZW1x?=
 =?utf-8?B?eXJPcDZlRGFMcjd6b3laUjhGamNxSUVGeUZtakkzdnN4ck5zQ2p1WVNrSTZY?=
 =?utf-8?B?THdkb3lVdTBMSVgzWnJoM2M3K2grV2NzL1BEY0tYZERsUnNOZnUxUjFDSThM?=
 =?utf-8?B?eW9VNVpIaGxxa3VmWVpBYmhmMndUSFlQMnNRdWVUVEROU3F1amhsM0IxYjVK?=
 =?utf-8?B?NXVKSkpseU9OMzMzQnR0a3BNYkFMb0YycjhXaGRuQ0Jab2VtQ3FDU0NhdDBk?=
 =?utf-8?B?RnVVK2NoV1FvZGErRVhsNys1TWN0MXF5a01jeC9WUEJ2RGVkRm0vRkFqc3Rw?=
 =?utf-8?B?Z2MyOGJaQ0JhcE9ZSFlKL2FFcjR1dk9hSGVORmIyNFhqNE9WSGN3N0Vtd0Jj?=
 =?utf-8?B?VlJyUWpXcmUzcUhnbW96NWFtZ2dZUURGeGhIM3hxNXlxckdKeGNnemdkNktp?=
 =?utf-8?Q?WoYB/eoigDwMvxrniZn0lcOpDxh5WYT1PSYZqrcsDVWVh?=
X-MS-Exchange-AntiSpam-MessageData-1: 2e8dxAHiPDHLYA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd705ec6-259a-4172-837f-08de74091caa
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 00:59:21.9689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Dtg3Zv3GoNHgrHD/jyq9E77q8A4eZBIfGWf8bef8/X6i6BbMh4+nwPVA9R635NbLHwK+UY1pTok62iZ/P+4Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5631
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,ffwll.ch,lists.freedesktop.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	NEURAL_HAM(-0.00)[-0.969];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F138518E714
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 4:59 PM JST, Alexandre Courbot wrote:
> On Tue Jan 27, 2026 at 5:23 AM JST, Joel Fernandes wrote:
>> Changes from v1 to v2:
>> - Added Reviewed-by tags from Zhi
>> - Fixed comment formatting nits raised by Dirk/Zhi
>>
>> This series adds checked arithmetic throughout nova-core's firmware pars=
ing
>> code to guard rust code against integer overflow from corrupt firmware.
>>
>> Without checked arithmetic, firmware could cause integer overflow when
>> computing offsets. The danger is not just wrapping to a huge value (whic=
h may
>> fail validation in other paths), but potentially wrapping to a small pla=
usible
>> offset that accesses entirely wrong data, causing silent corruption or s=
ecurity
>> issues.
>>
>> This series has been rebased on drm-rust-next. If possible, I would like=
 us to
>> consider merging for the upcoming merge window to avoid future conflicts=
.
>> Tested probing with GPU name printed in dmesg on my GA102 (Ampere).
>>
>> The git tree with all patches can be found at:
>> git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: nova=
-checked-arith-v2-20260126)
>>
>> Link to v1: https://lore.kernel.org/all/20260124231830.3088323-1-joelagn=
elf@nvidia.com/
>>
>> Joel Fernandes (5):
>>   gpu: nova-core: use checked arithmetic in FWSEC firmware parsing
>>   gpu: nova-core: use checked arithmetic in Booter signature parsing
>>   gpu: nova-core: use checked arithmetic in frombytes_at helper
>>   gpu: nova-core: use checked arithmetic in BinFirmware::data
>>   gpu: nova-core: use checked arithmetic in RISC-V firmware parsing
>
> Looking good, thanks! I'm staging these into a local branch and will
> push as soon as `drm-rust-next` reopens.

Pushed into `drm-rust-next`.
