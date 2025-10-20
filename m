Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5B5BF0ABE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 12:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A2F10E414;
	Mon, 20 Oct 2025 10:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RFgxqqv7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011031.outbound.protection.outlook.com [52.101.62.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A52C10E413;
 Mon, 20 Oct 2025 10:50:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3tLrdH3Kh/XgHVwQHQurgxHKsfzfaLE8H6M+KdyKtwNmPoC/oZ5o4hVjpS8lLXiDTCqahzKtE/iwABO2HpeyhPI2cg8NDXDMIXPju4mPiIeBOxp2Eo2EbC/+i6cEwDO3XMqd/S5j7bXCcM7kR6YFM6jzU1csePvodu2HNZLugNNwtp3f/i+unNwmR0QPXfYhZavpBd0er7d9SO+gbyhj2STo9BbW/1Re73XuFz2OUXmjO5KNkxCg8Ea6Y3eqzSZxbifp0Hpv78CiMSlJXkph/Fy0R+e0/fvJAxr1yoFoxvh/o0soGsTrMk2XkSvSqVqsU8YYbDjOOtAjrRJJiltyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rM7KlNFc19BP2sDerUTzCG/K5qxZzMpBCmqzV5xD4Ic=;
 b=yy/Msreyoctvour3G/8TY7IF+ZEN2IymTpQG8iI4zRCd0XfszHehgivAvv6P4wSkvqTq2KJm00YytPYJEASiyYfO52cFeZvMBt01N/xIKNC8CIsA6HL5f6iISVFwMGg+/c5xUQOooWkoJKVJg1FwVl8Krnmch+S05Ke/HLLkbEdVtw3dMi318hEASJoXE4eToIkv7bnfiSJZij5meFeSef5MP5656vmNUTXTejtgHbhWfrUoSoyC1iQLVUDD15vHudql5eE6Ekf9dhe4yywueDSn2ojJEwICRHuc3FBu3NDmUR1MwfjkTCH3XP+b4ytmwV04OGylBc+bqWNT/AtvdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rM7KlNFc19BP2sDerUTzCG/K5qxZzMpBCmqzV5xD4Ic=;
 b=RFgxqqv7v7SGgF8nDwJRVpsqMoycOZLBmQH3TpMVzZoFZZKzPYdyKEj5JUEOkJGl/IXQ0DRVQcteswbYN6X5rytl+LYWtnADDWKmY4gqvNewCcHK6rwZ+4wHUtiUgaGQwbfKMEx1fg7eie+zknqqpXXVcEyoBxDVPMUvZrB2tsuOuX9xNluh7kurxGjckbefY8nk5B2CX4zweXifp/Huoi97fc2qy6w08/hicDyUUhZXwlmn5BgLbqHcyRssc6LttYTBhS0eq8KS5wzimmVfIf8YnWZ02EmYhFe+dQMlTlzTK3+K0k4Sj0soaAe3k5f1qtgPXAQm42I8d2nbDe5vSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BN5PR12MB9485.namprd12.prod.outlook.com (2603:10b6:408:2a8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 10:50:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 10:50:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 19:50:50 +0900
Message-Id: <DDN3BGP9270Q.28ZV9MAWO3CUC@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 03/14] gpu: nova-core: gsp: Create wpr metadata
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-4-apopple@nvidia.com>
 <DDJJ4ECCSE2I.1EUAJRU9JBGNI@nvidia.com>
 <zwaefk62to77b5nyakeiboyj53fge3lysc3z7arp54tyyherdo@nsqhuig7bmbc>
 <DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org>
 <DDMWPMS0U5PK.3IW61GCOI3GZB@nvidia.com>
 <DDN2ITDOVCEV.50CEULQSFLVO@kernel.org>
In-Reply-To: <DDN2ITDOVCEV.50CEULQSFLVO@kernel.org>
X-ClientProxiedBy: TY4PR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BN5PR12MB9485:EE_
X-MS-Office365-Filtering-Correlation-Id: 230cf3e6-77c3-4e66-72e8-08de0fc68a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFI0UHdaTXdQWjBSYTVTUXZxMU94d1lOY1pRK3hkcEpyWityelpjWStUaDZ0?=
 =?utf-8?B?QzJ4dFVCS3hVQjE5bXhiRlU4c3FwWFRMVDF1bUNYOXhhTU04V2xSMDN6eUpF?=
 =?utf-8?B?akNobkcxRFZJbXFYZlg4VHczZktSTndyZFNGaCtHWm80bE1iUkZUc2hlRHFr?=
 =?utf-8?B?Q1k0R29PZE5wSnM5NlpVemVyVHRNQTBtbnZTZ0lnTlBaeGs3amRuc2xHVGJi?=
 =?utf-8?B?TzF4NjFjQXlaeVc5bzhINDFvU01Xb3g3SWh6VXJxMUs0eFExS2NCUTNCdW02?=
 =?utf-8?B?RkszVjRhbDYxNkJGR3VSZXMzNlhtbzJoSmRPV3Q1OHZXbjFOZjlLMjJwL051?=
 =?utf-8?B?Q0Y4OU9WaGoya3drNElhRWdrM2t6Si9GdWxpV0ZjNVlidTUxSndKY3Z0ZXlw?=
 =?utf-8?B?UTMzMmwxV0t6SGUyUkV2MUNkaEsyWTU2S2p2RXdqTUNpK0loOVdCN3djdDda?=
 =?utf-8?B?R29Jbm9UZEcxeE1Vak1OYkgvQzYwTU1nVlc5QUt5SXBnZlpmZm9oSGlxT0lK?=
 =?utf-8?B?ZXIrVWV2d0tJNXFpN1FaR3dYWWM2U3NBNnZ6c3lsTVF1cUlOWkJpNmoxdm1x?=
 =?utf-8?B?dHdUamIrNW41bEd5SmtaNXNjazJieWhFZk1aOE52TDU3S0xVdWdHOW9PQWVL?=
 =?utf-8?B?cWhiV1BrY0Zkd05uY2NiL3c4TFYyKzdsMDJteUNJOFgrOG93a3d3TENON1Vp?=
 =?utf-8?B?aXZ0ZXJhUXNibzY0eGk5Smp5L2dLUi9UazlQRzhOVWdZY3lvR0RTSnorNExa?=
 =?utf-8?B?Q0VsMnRjM0tqUDJVYlB2bjJlY1pHUVUySm1hM1dWOC94RFM5VGQ3cnFVM3Yr?=
 =?utf-8?B?cHp5YU5DdnBSSENhQTdKMG9lU2JVamQ4TUxsVFhiRTVCM01IY1RZKzQ0RWl1?=
 =?utf-8?B?Ui9hM3pHamV1NzAybmVCT1grME1MWThZbXJQNUVrTEJQeWh0Qk5YdXJ2LzZu?=
 =?utf-8?B?czA3N2lOSnlKNzExQkZtSjBTWG9hd3J0ZFA2TW1aeHpUc2hnRzBvMWFGaGhZ?=
 =?utf-8?B?T01QS1l3RndTM1JwRC9DRlV0ckpOdlUzcHI3d0hTQXh5b3pRQlFudC9iZCsx?=
 =?utf-8?B?OC9TMEh0K1VhSElVRm1NNFpxdVgwdFA1TFQyMlpvalNoZHVWSHR5eXBOZ3Q3?=
 =?utf-8?B?c3J5Sm1qNlY3eEZGNDkvRWRNWDM2eDBqU3dqcTVvdXpNZlhFVnE2UHZzY1Y0?=
 =?utf-8?B?QjVuVFBIR1ZzWWZJN2tlUFk3aldNZytjMTZvaUFDSldhVnBKbWM1a3dkR0dO?=
 =?utf-8?B?cDQya1FubWxiNENndHN2TWtnOXBsK3hla3FRMEYreGRnbjdHSUhKQUVnNW1M?=
 =?utf-8?B?Rks5d1QxVEVuQmNDZmJPUHV6VVhIdmNJZjNvdWJva0ZJdzFvQTI0Vno3c2dx?=
 =?utf-8?B?Q0FkM1Q0bk9Qc2NQbFZyZU9oK3M4cDJjWEcvTEc0ZFJoU1JxZjAvZGg2cmxt?=
 =?utf-8?B?V2RzZVdvSXBwVnUzS015R0VzbXdlS3h5T0RkZjlpVkNJZ1NsT2RXdkpoVGY0?=
 =?utf-8?B?WEZSNkxDMjVrRVJXM3dPN2Zqa1lGWkdzVGw1VmVxVS9teEtZRHoxb1lJSHZE?=
 =?utf-8?B?QThzczBLdFZnUmlVd0lmOENlY3REaUVNM3RRVE96eDNVbjhSTGI4YXI0WWtX?=
 =?utf-8?B?RE1aT1dzSGJncTZsdkVUa015WW1iU3BOVThrZHVPalI0eEF1bThHOW5HQnpj?=
 =?utf-8?B?cy9JSzRpcENkeHlldU9lRmo1eUdRWEJmV1RyM2JMOG1VSUxJLzFQc2RUZnRw?=
 =?utf-8?B?bGVNYTFLNUE2MHFvQzRlRzF0Sy9UcTNpMG5JVHhzQjA0ZHk0QzBlemxFMjA3?=
 =?utf-8?B?aXlNUXlnVG4wNWJFNktSbkVEMjlDd2pya2tmb0ErSjd4akdVRURqcVp3UUV6?=
 =?utf-8?B?cDlFd3o1SUt0M09Zbng2VldzekFJTnkzQitOUHR3eDlKcDlYdFJ0bk9paVJB?=
 =?utf-8?Q?yF/7RG0dlRHyPsQVfpi9MWYloHahnK5I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmFwU3ROVUUwSFlXTDVWWU96U3lsNkNxYmREbHpmdlhLVCtwajlVWkdJaTQ4?=
 =?utf-8?B?ZDJMR0oreXdQajhLcktQcGIxZXNrckJleFY3aWtBMm5hMU5qd2sxNjJMTVZi?=
 =?utf-8?B?OGs0MnNjNDFVQi9HSjNTdFEvTWdMaGVUU21VNkE4d2s2SGFHdUgvUlM3L3Rm?=
 =?utf-8?B?N1k5MndWaXNQeGpPY1lzWDg2UWZrYXk1L0svd3R4L1c1T0pHRnhOd2RRWHRL?=
 =?utf-8?B?NDRsYVBRcjJsNVNjaFo3a2xlV0hiL3BQZ2ZCQm53ZzFmODBoUTladndYNk9D?=
 =?utf-8?B?UWNwRzFnMUlzbzhHYzI2TktrVzRKZ3FBRDBRc1ZacmNSTU5DTzBoNHZ6bVVt?=
 =?utf-8?B?Nk14Nm1jMEZBSmVkK0o4eHVBMDAxa0hCaDFsNGc4bjZxZzRWT21TZytqajhJ?=
 =?utf-8?B?bmJaOHJsWUpwWTkraC9PazZFbGpuUjVmV1VqUVJEQlpXc3VwZzE3NllqdU5n?=
 =?utf-8?B?QjZuaDhGT2U5TjFneUVSSWQ3OHpKaWNaWVNOcFVRQm5DR2w1eTV3STZnem4x?=
 =?utf-8?B?cUM5Mmc0YVBLL2FSUk9KQkpmL3NScVNGYUVjMEdrMHF5eklSRElpVzlDc0Vp?=
 =?utf-8?B?aU82a2p6V0l6WTEzVXVZSTNyVzY3cFlnVXUrTkIzaHpKTmlvZ3lpTEUvcUNC?=
 =?utf-8?B?ejVxWndaZkZzRTJINTRVaFlsOG1DaEJzZFFweE5BRFMvd0xxNkhlQS9kNGpl?=
 =?utf-8?B?S25NYnc0VDFRU085THJsK1daaVRlM205OFNlT01oSmF6ZnJBdjBWWXhwa0NO?=
 =?utf-8?B?WENjc0RIU29GQk9KeWRqdXliMnFVOGFKbm5ocyt1OUFDc3dhV3ZUK2VxZURt?=
 =?utf-8?B?VWVQOUVNL3diRHBrak1zSCtHNGplZ2VvUUtOV0tpL0NvbUxjME5BQS8yblVa?=
 =?utf-8?B?MGNmNU9SaDJtckd5QVlmYTVydXJNU1JNNE5kdENKRkdva2FXay8xSHllSUdn?=
 =?utf-8?B?TE5tQXFKVFZTbVV6c0RJa0Y5UG5GZGNaMGRuc1dvQTFqNkxPS3NFVitTbXJO?=
 =?utf-8?B?bFVsNkh4UXcxSkNoSkM3c1lFSlNVTi9UNkR4eGJhRjU1UGJSNGxVcHFUY1k4?=
 =?utf-8?B?eDY4dDNmWGczaHNBT1p2Zm5reFlFenVERHlvRlRsOXE0Vk9qMGdCYzJIWVh5?=
 =?utf-8?B?MmJpeTVNeW5KTG5vbU83UTVqQUtRU1lYSm5WSEk2WG9lK2xSdWdPNDJCYncw?=
 =?utf-8?B?bTNocWtGTUM5czA2ckpIbjI0T3dkekRFRkNOandocmRmS0R2K3ZQdWxFOWtX?=
 =?utf-8?B?R0s4NThjazRmaHJlN1dBUENEbnF5NE8zT2NETDlPVWRsclYwWVdhdnN5NTBS?=
 =?utf-8?B?TTVBVFJkWC81L0grTXg4RzNjeWowZ2liT0dmN2xIck5SUWJjcTRtOTFSSStM?=
 =?utf-8?B?Z2Z5eWRuQVovZFkyQitPUHVLaldvZkx5Um1WbnE2a2t0SXF3VDVhK1p2ZlFM?=
 =?utf-8?B?UTRyWm1maVVndnpkd0QvUG1WdDRSYUFUM2JUVEsxZCt5cHk3OWhwV05Tak9J?=
 =?utf-8?B?aW5PeUJWVFc3WTdYdFI2cTJybW9PYTVZL25aOVJPL1ZMNjBhaUg0b3RPSlBV?=
 =?utf-8?B?VSs0ZlZuZWN0Z1oraVFXK3d6Wm1qY3RxWnVVRUZNNS9iTFhibjdiSFVMVnY1?=
 =?utf-8?B?YXZnMjFKeWpIL2FTcnMrWVhsT2MwdGtaRXNkaWpWQS9DMlU0YXlXUzVqTW5X?=
 =?utf-8?B?UDNoak1vY1VnV3ZlOCtVdWViSzZNOGYreE1RdFh2T09tZ0FBZzFMSXcyOFhN?=
 =?utf-8?B?OGhlczZoTDZoVGhxSG1FblVVRHJ4bVdLaXRuR1EwaXpQSlZBY1hTdVdaMS9B?=
 =?utf-8?B?ZmQvbnFLVnV1NDVDRzVJL3Nlb3JLLzRpSWdxZFdKQ3lsQmdOVVpvazVDVU4z?=
 =?utf-8?B?T2dBN3hLNXl3bEk2WXloOGxiWlRzZFgyYjE1enowZEJYMXZFNmt2cFpQbWNS?=
 =?utf-8?B?UW1PdXBHN2p6SEcwcXlMcll0QSt4KzkrTDVwMFBtTGFWYjlxTXIvMkt5SlEv?=
 =?utf-8?B?ZmF2UThtb3ZtTzhBQVdVdjZwUkgzRUNqQ3BZU1ora3c4a0dhbEcvRy9NWVRU?=
 =?utf-8?B?T3F3N1BuWmJLTFNhVUlIQW9vSy96QmxhQ3o1UGo3RmpOVy9jR2VaUEFPRUlP?=
 =?utf-8?B?SU9ORzJFbC9GUkNhL2NOcDV4RCtOZEtWVjUwdmNoVjBNM0Y0bGs2S21uYXJZ?=
 =?utf-8?Q?tKgybOCnF7Yv0CvY2VxqKuJWQlNi2IH1A31l+0W4th4s?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230cf3e6-77c3-4e66-72e8-08de0fc68a7d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 10:50:53.6412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3vLwYIWfeAmHyTD+C0vhn6vQxpLmS/g/PowIudXRd7RTz45RdlCIiveZ8LL1yM+lWCILVBmuXZ6zDsqiZh6lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9485
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

On Mon Oct 20, 2025 at 7:13 PM JST, Danilo Krummrich wrote:
> On Mon Oct 20, 2025 at 7:40 AM CEST, Alexandre Courbot wrote:
>> The alternative would be to have const functions like `usize_to_u64`. It
>> doesn't look as smooth as the extention trait, but can be used in const
>> contexts.
>
> That's what I thought of, exactly for the reason of being usable in const
> contexts (at least for a quick fix in nova-core).
>
> Whether we want an extention trait and a separate temporary const_usize_t=
o_u64()
> etc. can be discussed in the context of making it common infrastructure.

Thanks - so IIUC the idea would be to keep this local to nova-core in a
first time? If so I guess I can produce this fast (and convert our many
uses of `as` in the driver so far).
