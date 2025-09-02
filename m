Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28716B406D6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6FF10E760;
	Tue,  2 Sep 2025 14:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sJHn/39w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF17A10E75C;
 Tue,  2 Sep 2025 14:32:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsQa2RtjJSXiKI8KVsrfJLjDldgfIXqxZv2QE7J7i4nV72EBM1owCgoKLKYu5hq0jOrZfZ6XDbeLyjo0d2wlLemFMFtWQbgkuV9h63QyvfBEZe1K5VOajd5MkhwMJPC7Ht+lVQxcDlCE9Aj1SZuKjgfhGluXVCw/il0blKS0yTzVVFk7CAQrbAh1R+uBa1htGjomU8TOQ1qvfxP8R8MfbWNndhG7TlyaCVTog8QNpdgO332zMv8eEzkBLOFAcJX5cYlmLwfTssqHTcIV04bdBXyAooZP72tst5mnGYXPac1VJzRPQ0Wyv1Nv2JJnoR+RyQ+1UrfQo9jN9HurPJGhjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0w8Aeh4KrTU2nFzefZxU+Bz1RAJ+EBJs6l/wRzqbVM=;
 b=nNmdVdorz3Ptr/gXq/UFow9mrAt1YoOOi9NUq/hEECwzP/KAsm8KzeiSRgAlRE41TMSsHSv+jsjnVVFZclwc5jXZVnJeib2KOlbZslr2sQfBmmOJ6KHthI+hF5Bx6ulxTteeSUMTaT3xm9tEcqf9wyYsvA3lGjDoG6RmTZ1xp1Y3cWiCuNNZsN8hTB+bN3aUHVoluBsM00x6rj2GLZwdbKjJ9e0++q4Tlrf/gAqHTC6pmTA7zd/Dg0Lj8aFFuScJeQYregwvE8knTiVeOty7PFcYmTLeqTcJBXgjBAoHMGGXnSzoUu1Bb03RAFS56GNNMHrXGKY8mQvqENntSxhIyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0w8Aeh4KrTU2nFzefZxU+Bz1RAJ+EBJs6l/wRzqbVM=;
 b=sJHn/39wZ3NSfCfgaYIfmsDfJqnMjycjGxZwbe6qUJgJAWCmMS5ypp7FKWqmF3owLFk48fChmwk27H/42JaQfjAL0E86k4fpx3fe/BEItPn5774W30TNBCMfhaEOSjSmMqOciAoa9sTE0St4ZLsC6kJQakg8ufhUmBdZ+P4JRJfV/M3b9wkXxlpVFoxDyJcVF4cR67uhsrdmg3yYGR0MkJvnqU08YA8+YJgaJ92AOJlHcf0WdjEp20X0eHbCWmq1nYxVcYJoWuHcWyfR4sQFdfksktPOPPb6coPOz20VCA9Gv1keC0/mQgO497OQzO+v+W0CqIR7sb3FpOT6WY+BGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8955.namprd12.prod.outlook.com (2603:10b6:a03:542::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 14:32:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Tue, 2 Sep 2025
 14:32:10 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 02 Sep 2025 23:31:56 +0900
Subject: [PATCH v3 02/11] gpu: nova-core: move GSP boot code out of `Gpu`
 constructor
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-nova_firmware-v3-2-56854d9c5398@nvidia.com>
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
In-Reply-To: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: 575c7d21-b39f-410a-f677-08ddea2d7fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmtRK2Mxdm1YMmpIZFVnM3I2VkdrQ0NrbmFBZThuRG9idGMyU2F5SzFGRnJH?=
 =?utf-8?B?TFFjRmMvMVdxNlRGQmFVMEJVTysySVBLT1dDZDhNWGd0TzVKWnVwc3Rrd3RX?=
 =?utf-8?B?a2pCUDlYYnpsM0J1MEJIdVY0NWhVRml5TGdUd0NFODBpVGdyNE9CemZPQldp?=
 =?utf-8?B?eDN2aVI0OHBSNGhnV2U4VTg1dFVja3NlNjRPMnZCcGZKQW9NUVJzYnJOWEcz?=
 =?utf-8?B?clZyZ3UvMWRqL2llazFiMFVvQ2djUHBPT09ybnQ5SS85Z0lNTkZZZm5Rbysx?=
 =?utf-8?B?RXNHeDRsTnErWG9DWTczZG9zeGY2a0toemZ4akN6UkNTZXk2NmhxT01iVG1B?=
 =?utf-8?B?V3lzRU1Tdjdvemc4dTd5ekRpVXVGeDJIbFB6S1MvYWNHYTRHWTlOMDU4cmx3?=
 =?utf-8?B?YlNrN2Y4WWVuY2g3UW1pM1V1QjZNMkpJc0pBZFpLd0NnNXo4Umc5aGVhVGl6?=
 =?utf-8?B?OUhuRnVNdmtmVFZtbExVdGlSQXFnKzZkK0pSL29HNnRQbUFXT1ZFb21aSXBY?=
 =?utf-8?B?U2tFMHpETnRDZmhNUlBlWnVRcWZiYUM3WUUyK0s3dHB2aHpya2ZXMmsrcnFa?=
 =?utf-8?B?RDBRS21KYy9EdDh2WUgzUURpclR1K0tkQ3B3RnJiU3grUVpSN1l6QndYN09u?=
 =?utf-8?B?NzVyS2JwZjFrSmpZWjRiUFcxWis1MzFKcVk1dE92NWdCL0pKLytvTlNJbnlE?=
 =?utf-8?B?K3Z2RVptTnNQd0Fqa3QrSlNKUUxLVnlkRGhiN1FkRU1EdnpQVmFMRlppWWtV?=
 =?utf-8?B?Z1phelZYVXFxbUhndFVjWVk5dDFFcituREVBUStUM1o2VzRCcDY5U1V6YmVU?=
 =?utf-8?B?Vk85OFJQSTBhdUp2YjhDSCtLK2oxWS9hSUhIUDExenpFTkZQVGIzOGNlQUFX?=
 =?utf-8?B?aXQvKzhHeCt5OXppQkVqN2hXUk5tS3ZTRjl4WXBteUthUmJKTUk2MHpld096?=
 =?utf-8?B?UHVnbU1FelZGbEVpL2J4ME1VOVQxL3hpVmFsYlZGOWsvVzREU3BQM0doU3V5?=
 =?utf-8?B?Y3g4c2VFclVQVlVtQk9MSmMvQ2VYOFlKZ2NuK0RFUzNRUVRETER2OWtVSUdw?=
 =?utf-8?B?U01KVWYwbGgza0hYNWZQVEVVK1FTdjJ2bDZVRDh0M3hKcnVmT3FVcDVqaVg2?=
 =?utf-8?B?RDZMeDdiQUo3dnkzSExkTXUxUCtWM0FVcGRSekZpZ1d3bmxSYkQ2dnlMOTZF?=
 =?utf-8?B?TWtlaGNlWUVGNFdVb05LNGxkNk9jaVQ0bTR3YlJXT1ZqZk9sL2VxUW9qYW13?=
 =?utf-8?B?SDJrR2V2em5CT2srTFR4SVZ3bEFuc0FXaUpRT2lDVDFsQWswdlJMcit5SStS?=
 =?utf-8?B?OXJyamMxRU4rbklBbnhSM1BKQmZHMDQ5Q0l0MG9WUXVmZEt2eDJjYzFZUnJS?=
 =?utf-8?B?SEdBTGpteEJGemx5QmQ4aVpDSFM1WjBuMGpFK2s3NEdGandGdkFhb3BRZTVF?=
 =?utf-8?B?RFFEYUZEanN3cEFDbWlrQVNHN2JpcUlGY0JTYkoxdGlzV3RnYkhEZnl4SjJ2?=
 =?utf-8?B?cTVXQU1tVytEWlMxRnZTd2UwUjNwSXpqalJ0MXljeTFaSEdyNUgvOENNd3l6?=
 =?utf-8?B?WThucUo1aUdWK1pXZUpsbjYrYUttTE9uUUFvVzRTNHIzSDcvaUVlNE1pQWZr?=
 =?utf-8?B?RkJuUTZzQ0MreU5RNXdObXFmdGJhNHhrRkRPemFKYnBRdUR1UXJKSTZvN2lJ?=
 =?utf-8?B?OTNmZUFuY3FHU3lVZlRGN0pDYVFYeWwvSmVGZk94Wmx1OXJCdE5QdmVZUS9E?=
 =?utf-8?B?cTBndVBjUkdLMXdNRnNESEQ0K1RjcTdZL1ZkZTlxdlRZaWU3UXhudWp5emJo?=
 =?utf-8?B?TzYwQk1iUndwVkIzSVBXZjN4NzZraEZhWk5PRDEwMWFXVm8zUkVIdFNraHkr?=
 =?utf-8?B?RlFFbkg5OTg4bE8rdUpCcWphdXUxaEZkcTNQeU41QXorL0d0bDd4MWRUSk1q?=
 =?utf-8?B?Qk1VcDBjOU5qQkJqd0cwa2Nzb1p1Zzc0VGw3UzZweFR3c2FKeXlydm1BMlNW?=
 =?utf-8?B?SFhHdzZUU2lRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkJUZkRxbEhxK2xUZm1NeDVsajZ3SGZHbnEydnI2VG1QVTl0Z0paLzZicy84?=
 =?utf-8?B?KzFocVV3ZHpoSDJHRXkvUmZwY29iZTlScVIvMVdCMmpuYWJqN2MxS0NlZTA0?=
 =?utf-8?B?UXB0WFN4NXM0YlB3LytRdklBeFhKNXkxOU1WNmZhbkIrWmpEN0hCMVFWbXBJ?=
 =?utf-8?B?VkM5aU9lUCtYS21HU09xWTBXYmpLc3ZiOFEvT2MvbDhxU3dldGZHRWhZSHBT?=
 =?utf-8?B?UkRqNFk0L2lNT2FrOUE4bXRpNkJmcHBneCtXQnUyMXF5dklNakg4a1ZlTUR3?=
 =?utf-8?B?V25ydUp4NDdVOVd5WU83L0UwQVM0L0UramNmZWJzaVZSZUszSmpNSVBScjFx?=
 =?utf-8?B?eTNCZEFtVzgzbG5seWtRTDNMQ2tPRW94ZzR6a1VMa2FQWmJ0aXN6U0ZlVUJ1?=
 =?utf-8?B?WXNzRndvQVJjVkltWnJtV0Z4Z2dCTEFrWTVtSC85cjVhS3BTQkhGRGN4OUpJ?=
 =?utf-8?B?Zi9pRWtmdmV1d28xWDdVZnlwYjFEL0tPSmlzYzR4bjBmWi80NGF0SkQ5SHFq?=
 =?utf-8?B?TUlKV203OEZJSDNjNWFKSUZ6NmNya0JTeVdieEhGeTA2TWZ5SklXU0JUNWpt?=
 =?utf-8?B?MFhpKzMzNXpNalpRajFJOUMyNUxDekVYYUEvOEtTR2R1YU1sQUdIdWIza0FP?=
 =?utf-8?B?T0ZVRTJYTmxNOWlreHlrUWtibUFaUStDaDJ6UkZ6bXpXNkpUNFNiVWNWV2g4?=
 =?utf-8?B?ZUxVaWtlbkk2eFV0YXhFM2RTOUpxRklUQ2pCNER4QmI4K0RXWWIrZTVPU2Fl?=
 =?utf-8?B?Y3h6MmFoYXloaXA5b1VVeG1pMHFNcitoL21Nd29GaStzeWgweTVJZWRHcXJ4?=
 =?utf-8?B?VzNpbDZiSHMxK2RERmgxQzJNdmtDZjU4M09GZjRCek4ySGJTNEhITUl0S1BJ?=
 =?utf-8?B?M2xTcXZubHpXci9ucUhPbFJWUmZmaFFCM21kZjc4WkthSTU2cUh2TC9FazJ4?=
 =?utf-8?B?d2lXU2txRjMzY0d3UXQxNFV1elQ5bm1MQWQrUFhHdjVvbzl6dFVMeXdoS0tQ?=
 =?utf-8?B?b3JJeUZmL1Nad0RvWFlzY1VMYWhXVDY3L0w4TzJFSzRhQlRKYmYrN2JmVXFH?=
 =?utf-8?B?dytqbDZVQXRpTmxMLzRHSHpSaGtib3A3UGR1eVpUUVRaZzl5end3Y1JVQitm?=
 =?utf-8?B?ZzBvejBGVkRON05xMXc0KzVINFVaQmhqN056dngzN01DYVlWQjhhU2pZRUNW?=
 =?utf-8?B?SG9lb2V0SVRVVVNUVjdsZE15QVN4U082YnJ0VitoNE5yMUZxNXpJLzhBZ0xO?=
 =?utf-8?B?dk4zdEdRUTkzYldHQWRUWDRlenh4TnVGVlNXdVhvQ1A4cVBwNEdJL0ZlNlRR?=
 =?utf-8?B?d0wrU0w4ZVEwOGdmdFg0T0MxMEdUMjZhZkZ6TjB6dDRnY0w3MW5mTnBtNVRx?=
 =?utf-8?B?eFFIQ0V2YUVqMklUTDJGV0xIZ25YRTNXQXF0NEZlcDdKNGNWcDc3ZzVFcWxS?=
 =?utf-8?B?aW5CazlvSk95L1d2TEpab0xDZ0d2NjgwT1o5ajEwNFNzQ0NIY3F4cHB1YWhF?=
 =?utf-8?B?SjdLb201Z3NQTmRIa0pkdWZzWHZEaHI2L25abnNaeWZtaFl0OVdhWG4xUUQ5?=
 =?utf-8?B?ZnNwaW9ONmtDNm94NDVadTZYUlIxRG5STTU0Z2hEczl2bjlObW1JcytUL09R?=
 =?utf-8?B?OVBTZ3BnRG5qU0RkbE10aHdSNVR0c0hhN1NXb3JDRitLcFFZWm5BZ0xtTU1N?=
 =?utf-8?B?bUppWm5wKzRscm9wOW9iMzI4Sk8vZ1FWSlgvZXdlUmIvR3JHTkp2UDV0U2NF?=
 =?utf-8?B?RitQb0RlaHBQcUwxSkF4M2x6UW9iaWdJRmkwR3Q4SjlhTXRMRi8zcUtBcFph?=
 =?utf-8?B?c3B6elZFMUxwM1pycHV1UEdGQXNtZUc0ZmI1d1FnUmwvaTd0UkgzM2oxc0NI?=
 =?utf-8?B?QnRpdXVXZG1lWlVHM3RyRWRqMUgyNGcrWW5Ib2pIYmxobHU5SllITXZOQnAv?=
 =?utf-8?B?enY0bktkSTBIcjlPL2ZGWnZEYmVoRFF6VWdxbndXR29TdDJoUmRwNDArT2o2?=
 =?utf-8?B?VGU2alVjR2RESklLdUVUSkJrd2ZLVVlQZFpFQXdSQ2U1TG04WnN3RFc0YzdY?=
 =?utf-8?B?RmpXZUFqNmhZQmN6V2dKRkJrMGF4VC90QlV2T2R1Sk9sanJodklyYlFYVUFW?=
 =?utf-8?B?QVlvZ3dxMUd4TFY4U0JCT1drcVZCelJnWWQyc3haTTQ1dTMyWjhiUUpUMWFs?=
 =?utf-8?Q?NS8NkKHgGoxsGCTLA0ooputhjpnbKzfsb2pOtykSzJXZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 575c7d21-b39f-410a-f677-08ddea2d7fc2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:32:09.8842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VilwMPRJOAnYGYBx+t2Kw2cslJ2x2D1OM8zI2ueNRgUw3G9Kzzvgbt4em+C+HK6EkRse+KkYcHNbwLSod2TptA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8955
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

Right now the GSP boot code is very incomplete and limited to running
FRTS, so having it in `Gpu::new` is not a big constraint.

However, this will change as we add more steps of the GSP boot process,
some of which are rather cumbersome to perform on a
partially-constructed GPU instance.

Relatedly, booting the GSP typically happens only once in the GPU reset
cycle. Most of the data created to complete this step (notably firmware
loaded from user-space) is needed only temporary and can be discarded
once the GSP is booted; it then makes all the more sense to store these
as local variables of a dedicated method, instead of inside the `Gpu`
structure where they as kept as long as the GPU is bound, using dozens
of megabytes of host memory.

Thus, introduce a `start_gsp` method on the `Gpu` struct, which is
called by `probe` after the GPU is instantiated and will return the
running GSP instance, once the code completing its boot is integrated.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 10 +++++++++-
 drivers/gpu/nova-core/gpu.rs    | 41 ++++++++++++++++++++++++++++++-----------
 2 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 274989ea1fb4a5e3e6678a08920ddc76d2809ab2..1062014c0a488e959379f009c2e8029ffaa1e2f8 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -6,6 +6,8 @@
 
 #[pin_data]
 pub(crate) struct NovaCore {
+    // Placeholder for the real `Gsp` object once it is built.
+    pub(crate) gsp: (),
     #[pin]
     pub(crate) gpu: Gpu,
     _reg: auxiliary::Registration,
@@ -40,8 +42,14 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         )?;
 
         let this = KBox::pin_init(
-            try_pin_init!(Self {
+            try_pin_init!(&this in Self {
                 gpu <- Gpu::new(pdev, bar)?,
+                gsp <- {
+                    // SAFETY: `this.gpu` is initialized to a valid value.
+                    let gpu = unsafe { &(*this.as_ptr()).gpu };
+
+                    gpu.start_gsp(pdev)?
+                },
                 _reg: auxiliary::Registration::new(
                     pdev.as_ref(),
                     c_str!("nova-drm"),
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 4d0f759610ec6eb8a716c039a2e67859410da17c..8343276e52e6a87a8ff1aff9fc484e00d4b57417 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -172,6 +172,8 @@ pub(crate) struct Gpu {
     /// System memory page required for flushing all pending GPU-side memory writes done through
     /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory-barrier operation).
     sysmem_flush: SysmemFlush,
+    gsp_falcon: Falcon<Gsp>,
+    sec2_falcon: Falcon<Sec2>,
 }
 
 #[pinned_drop]
@@ -190,8 +192,8 @@ impl Gpu {
     /// TODO: this needs to be moved into a larger type responsible for booting the whole GSP
     /// (`GspBooter`?).
     fn run_fwsec_frts(
+        &self,
         dev: &device::Device<device::Bound>,
-        falcon: &Falcon<Gsp>,
         bar: &Bar0,
         bios: &Vbios,
         fb_layout: &FbLayout,
@@ -208,7 +210,7 @@ fn run_fwsec_frts(
 
         let fwsec_frts = FwsecFirmware::new(
             dev,
-            falcon,
+            &self.gsp_falcon,
             bar,
             bios,
             FwsecCommand::Frts {
@@ -218,7 +220,7 @@ fn run_fwsec_frts(
         )?;
 
         // Run FWSEC-FRTS to create the WPR2 region.
-        fwsec_frts.run(dev, falcon, bar)?;
+        fwsec_frts.run(dev, &self.gsp_falcon, bar)?;
 
         // SCRATCH_E contains the error code for FWSEC-FRTS.
         let frts_status = regs::NV_PBUS_SW_SCRATCH_0E_FRTS_ERR::read(bar).frts_err_code();
@@ -263,6 +265,28 @@ fn run_fwsec_frts(
         }
     }
 
+    /// Attempt to start the GSP.
+    ///
+    /// This is a GPU-dependent and complex procedure that involves loading firmware files from
+    /// user-space, patching them with signatures, and building firmware-specific intricate data
+    /// structures that the GSP will use at runtime.
+    ///
+    /// Upon return, the GSP is up and running, and its runtime object given as return value.
+    pub(crate) fn start_gsp(&self, pdev: &pci::Device<device::Bound>) -> Result<()> {
+        let dev = pdev.as_ref();
+
+        let bar = self.bar.access(dev)?;
+
+        let bios = Vbios::new(dev, bar)?;
+
+        let fb_layout = FbLayout::new(self.spec.chipset, bar)?;
+        dev_dbg!(dev, "{:#x?}\n", fb_layout);
+
+        self.run_fwsec_frts(dev, bar, &bios, &fb_layout)?;
+
+        Ok(())
+    }
+
     pub(crate) fn new(
         pdev: &pci::Device<device::Bound>,
         devres_bar: Arc<Devres<Bar0>>,
@@ -293,20 +317,15 @@ pub(crate) fn new(
         )?;
         gsp_falcon.clear_swgen0_intr(bar);
 
-        let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
-
-        let fb_layout = FbLayout::new(spec.chipset, bar)?;
-        dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
-
-        let bios = Vbios::new(pdev.as_ref(), bar)?;
-
-        Self::run_fwsec_frts(pdev.as_ref(), &gsp_falcon, bar, &bios, &fb_layout)?;
+        let sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
 
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
             fw,
             sysmem_flush,
+            gsp_falcon,
+            sec2_falcon,
         }))
     }
 }

-- 
2.51.0

