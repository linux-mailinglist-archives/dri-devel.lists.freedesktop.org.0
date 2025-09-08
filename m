Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483ECB482F9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 05:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF6A10E450;
	Mon,  8 Sep 2025 03:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FBZFn3h9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2067.outbound.protection.outlook.com [40.107.95.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6A610E443;
 Mon,  8 Sep 2025 03:47:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uw/zTR1cPlBHTMyUfAd+K9C7ClR95dlglSA+bpYomVfvcTlAPxY90qLlNgKguM5VNQasV8TiHY2FUsh1kt7xdu7Ewb0G5Ob0Ms0/3ZUWlLChSw3scdx+GCiQAx0xwnfykM6P4iCW21aFTzmG8bDSGpfSdh+amVFCHienTKJfq0yI6wlHCbKCGQgRUaM10IaKrNPRAbBHX7mdfLWL5FOJACtEArRqrg9cFAO+bsuPRicBnLVqA66qIuI82EIB/HqB9FLgadz9YYqmXJGZTcmON7TlRbmx97Brl5U616CyTFUvQGXpWmOkrWDzRwfSH80d9zMzKMw8h1Hxw7Qt8vOVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYgeqCIP1FaLhzvFWn0oCwM61YgoBzcOqf9VZ++meAQ=;
 b=D6axwNvBql/Vc0x8YXD33X7j2VvNW+q0Kjv6Qd9Jd4nmXA3EF8++qtCC/lfjVKCrERkdiVbgHKaXAGfW7Wg4ubi8a5VfZAwrR04/L+FO3cvUyaxHTeYLxIW17FlyHbH9SSSN3kV67FmIcA3NrYxMe7O2ERkExhYfcqx97LMuW+/9yezEPkUlyo4zeCid0W0dAWqOz65NdNVe6xZ/5XqXP+NNdGn33GEDPy2D+Iyo6G58B7qbQVpxzQLsD3T9fYzP+djSM4FSkm0XTcRDiTJl9A5O2k9FqMoKcJu2ZXg05cq4/knbAuXsO0JWAsYuwpnjvINWUZFTB9O9m1DL7bCD+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYgeqCIP1FaLhzvFWn0oCwM61YgoBzcOqf9VZ++meAQ=;
 b=FBZFn3h9iIvs2QlFJgw110xccshSU905//3VOtLF2b13T7Ao5iP8Zcs9HwRgwO/3Q3zkWnLu7RvDCXKt9oBNNxcbAmZQ3oWo3/Dg3Q0LPIaYNn6eD58o03m7ZGEFRhN9GtvzbQrnSKmPvyJ1BndWu+K12EdYQOtEVj0TtPF9v9WF7YYBqyt9QT9asTTrzb0s0DPTrb32A+eNxt3C8cRWE94HjqJj88deFdpuBb2TDUW61tXNp0DMxdqrpBBseA7dMjQ/xDgyWT+CQMb/j6ZR9x3EbLZYDxz7HsQbgYXIJ7ti3Ys2Mqfv1WbDfAtSArZ2MCRHuuPZkjV3mB/wgCBD4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8751.namprd12.prod.outlook.com (2603:10b6:930:ba::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Mon, 8 Sep
 2025 03:47:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 03:47:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Sep 2025 12:46:57 +0900
Message-Id: <DCN401FF9MY4.EPGZDZIMK1VI@nvidia.com>
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
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] nova-core: bitstruct: Add support for custom
 visiblity
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-4-joelagnelf@nvidia.com>
 <DCN3UXK0EQ1Q.KWGM7NKTCS13@nvidia.com>
In-Reply-To: <DCN3UXK0EQ1Q.KWGM7NKTCS13@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0168.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dbb9ef8-1e53-49db-2f5e-08ddee8a5e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTlHc3BZLzVoWnBRcGxUam5lYWNuS2dxenhFRDl5SDNNSFRCTVQ0Qm5mMkg4?=
 =?utf-8?B?UlNKa1I4SEk3UlZyMHpxd3FhK1RybXM3YnhqVFNKRTZyL1NGbnhnZzFFNk1l?=
 =?utf-8?B?OUd6ZFhBaW9VMDRkNysrdFgxK1NqbTNGY1Y1UjBBWlkwYS9YNWxmaEV0cHhW?=
 =?utf-8?B?MmdTWmdRSUlZV3dzZ29VRlc5blB1d0VYTzlpb0YzcTlVRFJEOUlxUXdtbzF2?=
 =?utf-8?B?S2JVVmZyZVB2eDRvYWZpVEhNaDJBQlN1OGlmRzljSXNtQzJCRnhjU2t2UTNj?=
 =?utf-8?B?WDlTb1JLVUh6NU9KM0lXYUFsU3FjTlpkbjJXNExvdWdqRkpEdWl5Zyt4eWFZ?=
 =?utf-8?B?TkpKSnMzeDNTcEhFaTl6TFM1UW1xTzZiNC9iMTJsLzJFTDljcWwxM0xQMTZ6?=
 =?utf-8?B?OU5LeHdKaTNHSTVSbmZMVGZidWxFZk5BTi9sWFRReGxxM2dwOXBoZVpPQTU0?=
 =?utf-8?B?L2szbzdXS0Z5elMxZ083V0RlcjRINEZHUjBVYXlCcnBWbDdYa0lESjAyUE1H?=
 =?utf-8?B?cTFCNHYzcC9DT0gyY1BxbHlVWUlLb1cwNUJCZGkzV09BNzlIcWptdDNvMEtK?=
 =?utf-8?B?WTNzSmFPZzdPSkpkS0QvS3ltRFNhcEptUUpUSUFBYkhIWCtxUEVpcktpczdw?=
 =?utf-8?B?UkVKOWF3bEZNUTI1eDJIVTV6Vnl1dXc3YmtxK2dKM0JDSFdGRk9CakJFald3?=
 =?utf-8?B?dkNTY1pqaHJnSEhUKzNwME9vdTdDVGwzL2d0YllXMUNBdFQyVWtuNU0rL21k?=
 =?utf-8?B?WmxHZnc4SFVUc2VZSTJhYXI2Mk5xangrdXNjbUJqaHMybnkvMHJLRjdnc3FT?=
 =?utf-8?B?bjYySHVhN0pqL2thWXZSYXlpMzZlMCtCemhyVlJ1aXVUcmozbllNNVc5ZkNa?=
 =?utf-8?B?Q0tUcFhuMGVJZmQ1OFdNeW1ZRVlmcEhzMU9RQitWT3MzTDhQcVpFZE9CWEZJ?=
 =?utf-8?B?bm5tOW9oRmszYlFSM3FjdHBlWGpyUnowR3pyWWk2emo3WmVFc29pKzF3SEFS?=
 =?utf-8?B?QWZ2bHEyTnp3azkxazFSSG5DRjRrWm0vNTFaaW56dytLRDRyWTdVOFVHUVFo?=
 =?utf-8?B?MHA3NXNEWk8xWWhVUFNqTHBObXlTRVdVVVRtb3lGTnZDQjBhcXpzbFY5ckF5?=
 =?utf-8?B?N1R2ZmlMdlN5dGZ4Rm8wZWhMRndrZlBlUmpCOXJjOHpzanFIUENSVnpyVFFv?=
 =?utf-8?B?QXdyaDQrWmNDWk5ZQzdwK2FJeVNjb0I3eFEwelJjTmdxNXBzOGZlWUdhMDhL?=
 =?utf-8?B?My9xOUJjZHoyd05mRmtuZmdxQStHS09TWmV5Nmx5NFgrblNNeXVYZ09FZ3NZ?=
 =?utf-8?B?bGFBUDVqMzFzNi8yMmIwT3RqQjdMWkVEazk3aFJ5ZWlTRDlDMC9WaXROY1lZ?=
 =?utf-8?B?TW9UYkcra3d0WmI1VE1Gc2hITGs1NFMwN2N3cURiUHB4QjZjanhJYkpWWkVI?=
 =?utf-8?B?Ky9GUm9XZWNhYjJiVmdCZ1VCSFdEU2hCVVByTDBiYUlaTENtZnlYTk45S2ZV?=
 =?utf-8?B?cGZjRTVUMm1kcCtlaXVUSjVEL0hmR1FSUEcxaXNGc0Z0bmMyNU9BNW9xMDR5?=
 =?utf-8?B?MVNHOGZ2MFF6WENrWldRUWhEWHJyRHV3aUNua3NwZHNFaC9VS0RCRjVPWWpE?=
 =?utf-8?B?cmFIdnJZdUJzVWJFQ2VPaHpZNHdOelRGdFBKRzJXb25ZOUVTSzNwNzVhQkZ2?=
 =?utf-8?B?LytYZGhxcGtMbDZBMW9aTEhMYi9mT2hGQTBsU1NLa293TC80TTlDMktJWDc5?=
 =?utf-8?B?NmVRRncrSWh1N2tsbCtvUVBST3NUMHNwakJidS92eHdaY09oSUtJVExCTXA4?=
 =?utf-8?B?L0J0RENBUkV0TG9sN09icDRUUm9VcS84ZkpiQkU1Ny9ZYVR6NG04eWJxcnZ5?=
 =?utf-8?B?OEZrVXBHUktBQmV0endkSzhkUVBnM1FMU05MemlUT1NMcjA0VXV6OURITjl0?=
 =?utf-8?Q?svERjOJz7MU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVVkdnBHL3dvQjZOTVBoZXpobFo5WkVYKzBQdXlDems0T2lrL1l4NGpqbEhh?=
 =?utf-8?B?b0l2bnA2dk03eVdtUndocnR6ajBaOXF1azhiL0laV0Mxa1o1L1R4VVpNenkx?=
 =?utf-8?B?SG5ObmMwZW1aOExRTlZRL3RHZ1d6cHVFeGgydEFYUFhuYjh4ajRZOXI4OVBl?=
 =?utf-8?B?Nzc5azllNEN1YXNHcFcvWHdpdVFuT2tBb3RrVlNYckQvamwzYXd1NnhZSFNE?=
 =?utf-8?B?UGVTK2RreVI3ZkM5WEhoMUZteU5iNytndkhFVExNYmhpMjVDV055N09BMzhB?=
 =?utf-8?B?K2VhclR0R2hFWXh6UXdrZXRPV1hBZTRYNFdxcFhNRUxsNVdBZEFaVWZjZWd6?=
 =?utf-8?B?OTJXUUNxUWpUem9jU1NTdFVwTVIycC9tTGd2MnMwcE5EUUxPenFZTFJPMklz?=
 =?utf-8?B?alk5dlBNOURGT1RGM3pnUFlzYVB6eFlwcjF5b1JqbUZNMlpuTG0vM2lBMGJW?=
 =?utf-8?B?TW1ab3JzNE5LSUNQYk5kcXZnRzlCME80cEN1THhDVVQ2WGEvOGpPdk5ML1lH?=
 =?utf-8?B?bEFNUHIwMjI3V1N5N2hmK1dIZHZpWk5RMXNDbXBkTi9zN3M2ZkpVaW9rRmFO?=
 =?utf-8?B?ZlVvMUdIK1lRbjQ2S25ubmhCMnRSc01hU0lWWmhRZnBCdzQ3T1ZoRExFYWo5?=
 =?utf-8?B?Yy9vSTlKK0RDVy9DNUxDUXpUcHR2TmttaDJSRisyQnFEbnFOMWdORjVxaGs1?=
 =?utf-8?B?OXNQV2pKaEhZOHhiQkxJMldOLzl5SyttZS96ZHllaUlycVBYRlh4Z2dBRTFn?=
 =?utf-8?B?MjBZend6MVU1amNRSHg5T2dDUXM4WTRreExqeXJOT0dENEJ0TUhvSWJpNmpy?=
 =?utf-8?B?bThXT3IxWG9MbGlxVmF1ay9ZNmNmRDlPWjh2WEpNSzI4QStjYUt0WnRHSXBK?=
 =?utf-8?B?WVdjdkU5TWV5eWlWd2o5TjlqTUtkQWFtL3c3NE13eGErMk9KNEh1S2FoYkpF?=
 =?utf-8?B?c1AvS05GcGVGRXdKVytUeGFDMEZtTktwK2lCZ0V2ZUNtdkhpNC9Xb0NON084?=
 =?utf-8?B?bkgrNHduZjZBOGNDS0xtRzYvUkFNMXNMYUdORUtDTHJFRFBBU0hyK0E5Ylo4?=
 =?utf-8?B?K2R0MndBYThNajVHdkpJK2hCODJ1VW41Vk9HWXVrVkdWUnNwOU1jSG9jWGRO?=
 =?utf-8?B?aTNDMFMyOEJDeUxEanJibzlVUE1FUGV6V0M4Q1ZlNW5GMDJBdFdKaW03QWlx?=
 =?utf-8?B?cmpxMFcrWElHWFU2bW9EZXBOYWppZ0lMdGJ1TFJGUjFMeXZ5eXh0OEZyTXp3?=
 =?utf-8?B?SlkvYnJPWHAreW9WbW5SYkROSC9HeDU2K2FkcnErNlE3WnRwRDFSTGxLM1Fu?=
 =?utf-8?B?cFFrMW1uTmZMdWNGT09iR2VlaDAwR3N0M1FuaTFZeDFyN3ZOYUJSazdtTjU1?=
 =?utf-8?B?MFJZcWU5TTViTXhSY3hmcnN6TFBQdVF2Yzl5NXkva3hpaXVGZG44TmNLRWh1?=
 =?utf-8?B?SWUyN0pmejBJNG1ZUzhLYUhON0VrTDJhNll2UHBmVkVOK0xoQmNHbkZTTy93?=
 =?utf-8?B?cFZ5OHVIV1R2dkNaRXh6a1orYlNpNE5abnY3eTByUXlkUjZZMlRwbnEzZUxs?=
 =?utf-8?B?VHVrbE5lK2htZVZxQ25KdE50eHJYMjIyRS9QSkJBTkFpZndZdGVVbTBubFNm?=
 =?utf-8?B?NXhIZXBlZms3U1g4b3E0aXpXNnlWVnN2TGJTM1p6b2lXa01hMGNTRW51RUFD?=
 =?utf-8?B?N2VVSXgvL0srV0Y5a1NWNG40NTZIM0FPM3AzZWh6NDFWcnhGbEMrNnNIOUJh?=
 =?utf-8?B?aFFEL0JTZnNmOWlEd3dKRHJieHJhTTF0ZU1zU1NLbDdHNitjU2hhNStUK2pF?=
 =?utf-8?B?SmZDR0dQRFVhbzFlRFlnVnpDSVdWZ2drWURWNmw1eFdlN1g1VCtkaUdrSzFX?=
 =?utf-8?B?aU1iMGlUd2NrcENPMVFZZzVabEw4ZzhsZVc5RU5wYXNKRm9KVkNXODB4ZHEy?=
 =?utf-8?B?RzlHQzlmbDJTbXhjTlJHMk43OVlqcFRicStscXdxejFMT1JlYmJpUU91TWpp?=
 =?utf-8?B?Y2RxdXNZUHJjU3NzZUJObWpzZjFrVFZRNzJqSlZPSVVwcGhMY3FnZkxGVXRO?=
 =?utf-8?B?a1JFYzNxQ0NIWDhIT1ZMeDR5dllLd2t4WVE5Mk5seTZDTHRBYkdQOGN3anBo?=
 =?utf-8?B?bVU2MXVoWlkzUUVzZTN5aFRoM005bTd6RzNqN2E1cXN6aXo1Wi91NGhjYTAr?=
 =?utf-8?Q?Yt53yhU4GI64kj1EPZOvYwJAsM3U0h5+ir3aAxBANjaM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbb9ef8-1e53-49db-2f5e-08ddee8a5e08
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 03:47:00.8947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYR7nmStjo8pFJJf+RFHqpu5gE+Ct2cJVSNR1tmHWyuFRe3K+DRwQHrREJSRdjmmkh30ZRDerXAVKxzC+t63hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8751
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

On Mon Sep 8, 2025 at 12:40 PM JST, Alexandre Courbot wrote:
> On Thu Sep 4, 2025 at 6:54 AM JST, Joel Fernandes wrote:
>> Add support for custom visiblity to allow for users to control visibilit=
y
>> of the structure and helpers.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/bitstruct.rs   | 46 ++++++++++++++--------------
>>  drivers/gpu/nova-core/regs/macros.rs | 16 +++++-----
>>  2 files changed, 31 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/=
bitstruct.rs
>> index 068334c86981..1047c5c17e2d 100644
>> --- a/drivers/gpu/nova-core/bitstruct.rs
>> +++ b/drivers/gpu/nova-core/bitstruct.rs
>> @@ -9,7 +9,7 @@
>>  ///
>>  /// ```rust
>>  /// bitstruct! {
>> -///     struct ControlReg: u32 {
>> +///     pub struct ControlReg: u32 {
>>  ///         3:0       mode        as u8 ?=3D> Mode;
>>  ///         7:4       state       as u8 =3D> State;
>>  ///     }
>
> Maybe mention in the documentation that the field accessors are given
> the same visibility as the type - otherwise one might be led into
> thinking that they can specify visibility for individual fields as well
> (I'm wondering whether we might ever want that in the future?).

Answering my own question: it could be useful! One example is
nova-core's `NV_PFALCON_FALCON_HWCFG2::mem_scrubbing` field. It turns
into `0` when scrubbing is completed, which is misleading. So to paliate
that we introduced a `mem_scrubbing_done` method that works as we want,
but the `mem_scrubbing` accessors are still present and can be called by
driver code. Making them private would force all callers to use
`mem_scrubbing_done`.

Another related feature would be a way to make some fields read-only or
write-only through an optional parameter.

I'm just mentioning these for the record; I'm not suggesting they need
to be done for the current series. :)
