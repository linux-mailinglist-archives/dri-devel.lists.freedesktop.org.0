Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B868AEEEBF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 08:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F1B10E4FC;
	Tue,  1 Jul 2025 06:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DYmhiMFw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2072.outbound.protection.outlook.com [40.107.96.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD11910E4FB;
 Tue,  1 Jul 2025 06:29:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CiYvpvwrAvX83OFNtL8ctQdD09rwLxcRQUo13g+38adklvCcbgXtTAcafftQ+mn8XlHAlBDb40NDGXByd/HumwTeb8sWObapMoXII98MRq3TZ5EBQrGxz6PQTBMwmFGNNJqWDWKtSJ89LotSe2gzhPwL/riWPogjGYdRt7/8UCcChGOGvB1v7v+Yml+H6hP25yP8cbgiL/Y8GmH3gZ6NPGJ4Nuk3ALC2FecDFiIgeqAii0BJcD9fnZlE5fsxmz1Zcwvu/XqHCxxQel3A4jBTsFLLB8cu20ToAWGBPEgtId7Rdf/ziiKxVO/fjJ5QipT6CBY8XJVF8cGcVFjlc5GtDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MiLlwxJRREU1csTeg+3hmuUfyuFBIbXbx2+BmPYopc=;
 b=IydqJeRd06U2apWmIAdnC3O0VuT9LaPPk4Y/n6mu1emYo6AJyC9kVR2LG0nYwloOa15RRWRRSyWBjcIYROkUXLGmkQJQwfd15xdro6+Uvx9VXC9jCx55Ji2uQT7PK8MOf/aWcNbV39zA/F1vzhe2x4lmJMB5krHhyrR3D1kXYZdGF2RN2CdBC2xhYaKlcoFa6dq4gVj4iY5y7T4wnOtmxOSOXAjSDs5ku9GFVN3cPkWNXOeEWcE4St2YhkyBAA48CAVZHJ2XoZ9AytiVnza+X2/AwGuk791po2SQYoAFte2oBS4SAxIbikvLKyWfinzd+ziCLi/Lx2d5KOJ/sLicIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MiLlwxJRREU1csTeg+3hmuUfyuFBIbXbx2+BmPYopc=;
 b=DYmhiMFwwXVZmogt0IcVf/6Ba8jM5pGdVzNNMKZdQJWS0aa/9oeSxyTwcSyhOkN5OmweH8jXqN+ag+bwgxeEsEZGDVB9jJxTs2nAzQ2qPs6tdSVxlpl5BJq/F1K5sGQ2MyjFHNImvKo5wEOaO0S/2Ptya4TQQKc41Hx2ENdl5r/bYZGK+AvLJR3lyDQkmgMp/FcTGqp1jmgkBmmnGwHl0yrtL8/M8jdLVXve0xZErdcDqwvdgizPXrxdGfFovjMsKgjnMrc19rEQP35QXG0rAjUmv6x0/yO/L0UgSxTxGr2dmw5g1s3Lle+SrqJ3VjuZmDIxwAJp9ydF0GT0tW85Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4449.namprd12.prod.outlook.com (2603:10b6:5:2a5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 06:29:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 06:29:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jul 2025 15:29:29 +0900
Message-Id: <DB0I8WAH970B.25D3S59AYF85P@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Benno
 Lossin" <lossin@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>, "Ben
 Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Lyude
 Paul" <lyude@redhat.com>, "Shirish Baskaran" <sbaskaran@nvidia.com>
Subject: Re: [PATCH v6 00/24] nova-core: run FWSEC-FRTS to perform first
 stage of GSP initialization
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
 <aFnArVIFkHCUzNqe@pollux> <DAUFC932W5MR.Q13BFD3CYEKJ@nvidia.com>
 <324c842b-e110-4e15-b058-9238a9ee598a@kernel.org>
In-Reply-To: <324c842b-e110-4e15-b058-9238a9ee598a@kernel.org>
X-ClientProxiedBy: TYCPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4449:EE_
X-MS-Office365-Filtering-Correlation-Id: 16dce5d4-bdc9-4708-0813-08ddb868a44b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1hScEVkSVZjcTVLWHFTRGI1Qnkwc2hZTEx3V05qazhYdXRwdHB3eXlIYjhi?=
 =?utf-8?B?Z3JyVE10OUpoY0VGUmtEQlhzWlNNcGo3MEFGY28xeUk5aFRSOFhEZVJtVmwr?=
 =?utf-8?B?OVQvV21BcWwyVk9lVTl4NUFLRzFsN3h2WFFtUFNNZVVRMGFPOWhhVElNTFZU?=
 =?utf-8?B?cjJ0cTNVMEFlaUtvYVVEajJWNkJreEF3UWtwV0h0ZXNrRnNzQnNLTURQTEhJ?=
 =?utf-8?B?SzhmMGpseWZvV2FMTkpWdXNKUGpSM3ByTHhtTUJEUExQSWNhT3VVSlNqQjZ1?=
 =?utf-8?B?ZjdtOE5QcXFjQldmSkx5SUZ1YzEvVWMzekhnZHRaQ3BJTnAwUTN5MGZCeXpz?=
 =?utf-8?B?TXBiaVRSZjNkd0tzdVZraXY0WWdaaGxsM00yMmhMeklVSHhxOUdLb1pkOGRQ?=
 =?utf-8?B?VWlrazcvTkMwN29zZUxyTlM2WjdXa2l6ZVVxbnNzTjk4N0lUZmJKSnMyWFcx?=
 =?utf-8?B?alk1MkxGU3F5Vi9CekF4eEpNbkdMRDVzZmJQZVU3ZFNkQ1BPVlI2VmVHVE4x?=
 =?utf-8?B?d1VUMzZVRUthZTFZUVY4VnlQV2tPUkJNU0ZhbmFwdXdPMkkvdmtzekdqcWxh?=
 =?utf-8?B?K2pmaklGTGJKRlZpcFdMSXNLMEdFcEFEcmk3d0I2cUJaNWkvckcxQUlBZjM1?=
 =?utf-8?B?NTc4M3VFTUphcXhROFMyS0xXU0JVZm9XUzV3aEdmcnJoS2NQUWwxdUJlVTYy?=
 =?utf-8?B?Y1F5SmNMak1nVWlUOGNJZGZIM3lOT01uSkV2b3NERVcycWdRdVBFUGtySFNM?=
 =?utf-8?B?ZWNkcnJDeWVJb1l6RFUyamM0SzM3bDFJOE1VeURRd2ZleEJ1akd6aGwvY3FZ?=
 =?utf-8?B?V21YOWorZXU1VWtCdGtGL091eFVyaFJaMTBsQnYvY3QxWHd1b1RwZitJRHIw?=
 =?utf-8?B?S1VuWkpEMUdxT1RFNEJNV0FWdE9YTWZZYXMzVFVZN1FPbSt4cnorM3NrTll1?=
 =?utf-8?B?QzNkWW5JZjY3Q2FuSjVINDA3TG9kQWFqeC9rcm9Qc2FMU3BDVzkrY3VPR1NI?=
 =?utf-8?B?Sjc3cnVTWjlRait6THRQUWNwMkRiYUhqTi84MzdnVnpWdks1cWZQWjJJK2s0?=
 =?utf-8?B?Tm5TRWl1dWVaTHFzaG9MaENRYWM4MDV3ZkNxVEZJVm1HNDZIY3ZSSUM5S05o?=
 =?utf-8?B?eVJCV04ya3FkNkVYa0QzcE9DejR1ZHFpaFZPNFpqQmZZalhoMmZVU05pc0Fk?=
 =?utf-8?B?b2NDV0xnRzB3SnZ1WUdoUFNETW5VbnpCZFRZMDN0ZmNiNXFHT0lmdGQzODFI?=
 =?utf-8?B?WEVucVZ1UzVyVUUxVitFNkE5Q1dKK1dWbVlrTXA1dDNHdndURHdxamlKODRz?=
 =?utf-8?B?QjRubHZKWVZYSm1FZGpmcVhlMFpvRTNURXZYRWJUc3JacWVEODBtYVo5Z3Rk?=
 =?utf-8?B?VHNEWHRBMGVDWUdNK1MyMkZxaGUxS2FWRGdnQ1hzK0t4eTB2cWdxZUhqMkNn?=
 =?utf-8?B?UmYyKys2aGZYcXhUTjAvMmRGdWRlZ2g3eVZWNnRpdEdNd1NmMDFnOEVPaFIv?=
 =?utf-8?B?L1djRkg4K2ZZNEVPN0RzWGt5OFA2OUVvWXE2d2FIaXEzUE5TOHNiV3g2aDNn?=
 =?utf-8?B?TGs0enN5ZGZWenpIRGYwK3JCWXhTNWZqN0pMeGtSZDRlR2hLU0p2UlFYbmdG?=
 =?utf-8?B?VzBPZXAzYlY3ampKc2RUSldCK3JkTXF0dFpCQWJZNEtyT09oc3pWNG1WSlpl?=
 =?utf-8?B?SDZ5WUkvUDZtNTRDS2xLelpUUm5hM3Nra3l1aXVUQVRMRlZrVU9xLzc1bGRj?=
 =?utf-8?B?UFA4SW1xZ01oVy9SOVoxRWVCUkpsendUSnVOem4zU21mKys2cVFLeHJXVHVY?=
 =?utf-8?B?dVVBUWE0MDZEWEVaQmgyenVCdWhldFFobGhFbnRKVUhKOGtvd2t5TnNMMVhK?=
 =?utf-8?B?cDRyVW5ZK29NdGVuSEh4VFhxZW1wNS9QK0dXTUJndnhrc0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0tXMXRWdy93b0M1bU84MVVaOURlVGs4YzRwZWF5UUlYUS84QVZnZjNURGp6?=
 =?utf-8?B?SUZuT0RZc3oydnF3UldpWGoxNWRPdm8zdm0zelFNRTJ3QWtHZkNYSUFoUk50?=
 =?utf-8?B?Uk01cnhzWmJHNVJYaUd5YVplYjI4M3o1ZlVvckpOOXhGK0QxdDhJbitQRWkr?=
 =?utf-8?B?bGFuaXN3OWI0MXRENDE4c0E5QlRwYUdGVFRlOXZ6M3Z6czVCQ3FCdG1Pd2ZT?=
 =?utf-8?B?dDNOZ2FDVGErbmtMWDAva1ZMYU9FMThwUFdFVGJ5SkF4LzJ6TVJhUjd5TFYy?=
 =?utf-8?B?WTl4N0M5NkdCbXAxVkN6YXpQSGpKVlI0Q090OUlVUzErWHoxZmR5bEVjWmlp?=
 =?utf-8?B?N2JidVhTNWp1RzNXYXFOSzJ6QWt5bXN3Rmpad2dSUENxNFVYelBnRTYwY1kv?=
 =?utf-8?B?T29BcU5aZ21pdTFXSHpyVjRHR2xHUU0zOTAxVnpVMHhvY2JFODZqK252WXRE?=
 =?utf-8?B?a0gxZG92UEhQMU1jTWtyYStKZlhCVHZ4Skt2Q3VFTVBzRTJLWVNFVW9hS0Js?=
 =?utf-8?B?RGhTL1ozRDd2Zk1pajR2R2tJZGV3enZ0c1ZPYTV4OG1aclU3ZUxuUllOc2dn?=
 =?utf-8?B?aHhjSjlnQTVHNmhWVEovaUVMR1IyOStWK2xPMEVrNGROeWNKK0orbmFkK3hQ?=
 =?utf-8?B?ZDlrTkFjSTIrTk9menZGNUFmaTNMM2RTQ1Ryd1NxS2ZPQWlhcjVucnprcS9z?=
 =?utf-8?B?YUJ0Qjliem5kMzdNSmlLNy9UMGMzb0lyakF2K0k4blpjcEs3UUZXcFBGOGxG?=
 =?utf-8?B?UDd6enZZRVV4c3g5bzlEeEJEcnFJbmVWdGNOc0txaXVHdENFc0NaS2lXSjdx?=
 =?utf-8?B?a2lmeXR6OTVtb1V4ZEJWb2g0dGVmNzNUUFM1bWJpZUtNaDhkQkgrZEZtSzFI?=
 =?utf-8?B?Q2Y5NGhUc0hoa2ltTVVzOEs2aTdGR0VwV1RRMHV5YVZ1WWRRR3lyS0pRTm9F?=
 =?utf-8?B?Wk1kNnJ1eXI1YVpNZ3lQT2ZWcjA1ZGdCVDQ4bTBSbHowUDF4Z3J6aTR2SEdy?=
 =?utf-8?B?TGk4OE1UTStUcGtIc0VHYnR1L3pTRjJjOGRZQTJ2UFZnN3laajAveHVUdDNW?=
 =?utf-8?B?U1ZiaE5iYThlRno5WGRmV3MvcWdkelRhSkkwb1BYMWE0QWFNRGgwU0xHd24x?=
 =?utf-8?B?N3JIT3d2dXNkZzZIa0tCMEVKK3kvS0FuY3lRUDFIN3BDcnVFdFJMTmp1K0w1?=
 =?utf-8?B?RUc1UHgxcGU3UVJrdFZKR2c5ckNoSDM1SjJJejBlM1BwMGl2Ty9mejhib1c4?=
 =?utf-8?B?dDBlQ25kSWxHaHhEOHpPNWNidHF3SWEySEtHWHYveFpkK0JDdWV2cjFHM1Zl?=
 =?utf-8?B?N1FpVG1oNTJwTHJVSEpuUHdKUXl4Q016eVlnS3I5elJSdC9QUUdldUNkUm5S?=
 =?utf-8?B?aXZUdVNsQzE1dkp6a3JyVHpVYnVmclFmNG50TlBWNFhLUUR1WUlTeGpHSXZv?=
 =?utf-8?B?UUxzU0dXenArcFZmemZabXVMdURmNjVaZTh0RDdOL2pKdThBS2tKK1QwQlMw?=
 =?utf-8?B?bzgrd2VydGJhWTFQWGpCd3NOUzd6MWo4czZ3MEp5TkFOYnRyTVQvWXBaS3hq?=
 =?utf-8?B?NDFGMDBXSk84aWlycFE2RGxXME9kRjhWSnVZWDBxVmRVTmlrTU5VVWUwK01R?=
 =?utf-8?B?d00rRlV1dWtlR0Vmb0t0V2t5YkE5d1RFcmxOcFg4bDBvc1A2NE9KT1FMZk5z?=
 =?utf-8?B?eG9HTUxNa0hVK3U1VHFZakxwSTRxeVlDcFZEd0RXelZtZzErdUFyUUJnVFN2?=
 =?utf-8?B?bjAxd0ZwNml2M0g5ZDZEczZrSTFhbURGNkxMR1Z3eUxjTi9NUWJpQjlnOThy?=
 =?utf-8?B?dmRaN3g1ZDhWSWRaYmVCaHFkMERnbDErWFFReU5wdDVEMk9zdWZvL0pCS0FM?=
 =?utf-8?B?Tm0vM0U2SlkzVHZyMklzZVRNeC9zUkltZ2lkdGpSZ2VZL29pMDZKNVg1Qlpv?=
 =?utf-8?B?RlZDTTIxWTkzUkxqckNVTVZxWmJSRHdtZzlHc1FRRC9pckpWcGdvTHRTV1E1?=
 =?utf-8?B?L2FEc1VXZmw3Mm94WjdlOWZuMGRmSlVQT0oxTE5zYnlOaHBSWWs3MHQzVmJw?=
 =?utf-8?B?TTB3RGtrNFYzR1Z3Mi9zdVhnWVJCM3JWQjdxekUyNUtsQVg5K2VzRmJ1VUpw?=
 =?utf-8?B?NXRDREpJb29YTHVJUXViWlAreTBFb2ZGSHA5R01BRW1Wd3lHMVpUV1drUmo2?=
 =?utf-8?Q?sn2COesWIUOxS9se+Bwl52yx9lbtCAI5KdMTq9/dR8dR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16dce5d4-bdc9-4708-0813-08ddb868a44b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 06:29:33.1104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWmAn9uVI56mMeMKFkfBGMj8N8mqd4eQYZMbmbgXhRwMiFQDVJx6233IXWDYXSjmU3xD4Ig6ke2hNuut/sIrEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4449
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

On Tue Jul 1, 2025 at 12:43 AM JST, Danilo Krummrich wrote:
> On 6/24/25 4:56 AM, Alexandre Courbot wrote:
>> On Tue Jun 24, 2025 at 6:01 AM JST, Danilo Krummrich wrote:
>>> There's one thing that would be nice to fix subsequently, which is prop=
erly
>>> resetting the GPU. Currently, it needs a power cycle to be able to prob=
e
>>> successfully after unbinding the driver.
>>=20
>> Yes, what I usually do is the following after unloading Nova:
>>=20
>>      echo 1 | sudo tee /sys/bus/pci/devices/0000:01:00.0/reset
>>=20
>> and this allows it to probe again. Maybe we want to add some equivalent
>> programmatically in the driver probe function?
>
> Probably -- how are things implemented on the GPU side of things? Is the =
GPU
> firmware surviving a FLR?

After a FLR all firmware is cleared and the WPR2 region is wiped,
meaning GPU initialization has to be done again from the very beginning.
