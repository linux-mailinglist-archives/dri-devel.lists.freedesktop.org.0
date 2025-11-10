Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B02D4C46EE8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2149A10E3A9;
	Mon, 10 Nov 2025 13:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EPlT6z/D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012015.outbound.protection.outlook.com
 [40.107.200.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E44610E3A9;
 Mon, 10 Nov 2025 13:35:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZcotsUJ1uggoxu7eiDnNwrtz+1ZmOUxo2gBF7g/x7zs2gJGwg+RbKQawg6vo8lpQ3kLsoMP3oy1Ie0u7ZczcdT2R3MiQCqYA0EuB0gORMgK5WYwfmkw2aijTpqt+xaXlQq/IcBN0y+rapfUaNGWDluk9ocDfPTR5l9K1HpdFOGX7eWRA8GC+zQ42+xVDaLwKwkmLxm80Z4iITDXn6gokXE9u1w888xPFX1p7Yt6J7pyXQ4f1xjdLJ+qn7Tnh9htoyZz0/wQjdCwQm4DpXGPDmgZHzzMZRH+JIOuNgUcpglM7NzHn1JwIO4Miqc0D98E7am9pEhg2py/Nsa3PPQbCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sti4JhCwNOEwNz9kE0ux8kbioE5TVOgoLHyy4UXMzBs=;
 b=tcYUBvv3E4mGJYlCwoiKf4HtVv1aaxKB5sJykUHAjsFNhsKfbQahmviTksRyNV/vPhtGjR8uTUtzzNRS1CeJoRkh9odG8onjYLNuAVe+alMHWGC4QXxmzNm+uvl+TReIwWXfv6/kKqE2fmqGElYvetCP5rVk5TiRUQxwBjxwcfXgPgcgajh1JOe/52smXe9VmTcytEt6cCkJGr7TL8xU0EkNt9r3Xte2lIJfnKkwWFJM8EIc10MTbLDwr6sth8rPbtSiv7Afdwe85KBP0LUXSHGnjlbTIubsNhP3cOeeBoz4UWlH5xl5D60cNKQgqedWOPHiJwuUhmi/kLCqE+iuWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sti4JhCwNOEwNz9kE0ux8kbioE5TVOgoLHyy4UXMzBs=;
 b=EPlT6z/DhzobXBXxIHG5IeZYdMGqdjoideT1519fb1cfW/wyii7EEEpVwqaXHvYQptxxOzb2O9JvsYiS+LMV3zftPpTlQqi1FPeW7tPSUQLW2pNyKXXcgWa5XR+o/3kW4nMK5t3ZMCZM8bQ9dR6VBY/Y4pkVqS/Va/7YbeZ/SNrQp6HCH9EjdRixE2uB67e/V9hZtfbgDLsYy1Yu6inTzCDeIjySlpDkB+IsoKXN0a65H64TKGqVcb0DC+iZHMRNrJurql2pzLt0cwfJvrpQ9i7CWdgsUqKENKLfMqZX1oxpJZ33t65uA+gP4L9yRmm9tOQwFf1X03DWY+ZGwzvgTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4055.namprd12.prod.outlook.com (2603:10b6:610:78::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:35:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:35:15 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 10 Nov 2025 22:34:23 +0900
Subject: [PATCH v9 15/15] gpu: nova-core: gsp: Boot GSP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-gsp_boot-v9-15-8ae4058e3c0e@nvidia.com>
References: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
In-Reply-To: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4055:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c15d4f1-5789-48e3-b318-08de205dfb7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eU05RzN3WGlLdUhtV05wSFUrWWRvQ0lWWXlldzNSYjBEVnl5SGlaWjhGM0NW?=
 =?utf-8?B?Rzc1Y21kbVUwSGppMklRTHI5S2pQTlluOVB5MGtjM0V6NzZlbFJSdGx5Y1Bk?=
 =?utf-8?B?MFp3SDFiZ1hxVG5TcHQrbW9MMW4yMU5acGZ2cUFOVWFLcTFLd2ZwL3pPb0xP?=
 =?utf-8?B?Wk5NYVJvc1B5YUQrMlF2ai8zWktZczJLWUlyd2FOcFlsY2lzbTFCdnB5T3gx?=
 =?utf-8?B?NnA5VnVNbll4eTQ2bldmWC9HcFpNZWVGTzQ5S2pKcGZTTG83OEJQSk9tbHdt?=
 =?utf-8?B?L3N3ZHVnbUtSbmUxak5LZnRlVmU4Ulo1KzhiWjJtdU5iWlpPSmVzQWY2bnpR?=
 =?utf-8?B?dEVMMW5zNGtjZ3pwL2s1eDdmVEtyc3N1RHRPTndybzJWcjdYR0s1bHBSRUZD?=
 =?utf-8?B?U0NLWVVqOWthYW9uWWF1R2lyaFl5TjBXd1hqd0lYcUoxcmZaSVRYMG5OQitT?=
 =?utf-8?B?Mlc0RC8xRzNFNlErWWxuRER3TGNaMXpyUDR0WFdZSEhaSUJFVW9lVDRxNngx?=
 =?utf-8?B?QUpUOUpPWHI2Wm05U2Z4Z2JKVFJJR0VvWkRuZzVKRk9xUjlGdXVWM1BqOU5E?=
 =?utf-8?B?UnJXaHVSMisrM29kUnpQTktEM01TcVozdUxwYUtZM1ZNa2kwcEIwZG8rK1VD?=
 =?utf-8?B?a3ZFdHhVUkxWNjBRTDZJaGZmQzNMd3ZoczM5aWs0UW16ZXN1NHJhSVBiZ2Js?=
 =?utf-8?B?d2tVc3BpeGd5ZW1qVFE2QWRNTEkzWjkrUHcrMHd5YSsySGxJUHBBWVNVK0pw?=
 =?utf-8?B?R1ZDNXRRL29FZGg5MEpuR3lialJ6MVByaUZkVHNONDA2WmhUMjVzL0xCclRy?=
 =?utf-8?B?NWFRNVhaSUNYZmxId0h5QUdtMHhJY3JaM1p6d1FPeERzVGsvNGhqaDRSRzdu?=
 =?utf-8?B?T2FBOUMwR3pRL1E2dTRzbGxmWXlPWXdkNnRNdkF1M3J5ME8zaFNWcTdVcmtC?=
 =?utf-8?B?MjJuVklTc1lEQVJ3dmNHNVBOWTI4ZndlTWk5VS9JZnRUb1YrQk15Q2VDWUJF?=
 =?utf-8?B?RXR6TFJqR2d1TVpkSVlWUEpXUTR1OWQ1azBaMU1qYXIvK1lsS0NaMFZUL05h?=
 =?utf-8?B?UmtocFpHVE1wYXlTVmRwM1ZwU25xQyt0dVptaUxPZDF5dUNBY2pEb1VEVTlB?=
 =?utf-8?B?L1J6TnV0dUFqSGh3ME03QXc4cHhXbU5GckVleDYxSkxHbmdhYWNDUUE5eGZS?=
 =?utf-8?B?YmRXMkoxK08xMVQwc1p5QTJnaUpxVWFMQUY1a2MrWVVaVVBpT2J4QmI1U0VZ?=
 =?utf-8?B?Wk9lTnJQOVFKa245OTdCR2N3S3BEUllIRm02dXRNU2p3ZEZLV0dsaldhdE8r?=
 =?utf-8?B?dUozMm12Tnk1TVAyV2NXaWYrRDljVUtNWG9SUnFLSnhyOUE5WFp0SzFZTEt1?=
 =?utf-8?B?bFVOcThxOGk2SnN1c05iZFh6SjExa25tQU1rckpTL25tQVprRk5lbkYyNUpD?=
 =?utf-8?B?NFRnRGgrS3YvamcyL1lFa3VsTjZvK0FhSHFKTmV2VnROZjRyeGsrT29DdkRz?=
 =?utf-8?B?U1RTT2ZrTWRWRnd2a1JaVHhzTFJNc2dYS01LbEFMQ2xVRzQzcFRkaEd4YWNO?=
 =?utf-8?B?ZVFocTNuY0RhNVIzMFptRll1TXdWS2pCTUlJVWdabUxNRnNkNVJZV0hsY0Vx?=
 =?utf-8?B?UFFJcDJuLzNzckVTa1hEaVhheDlYaDM4bDFCU0VTNjdGZTgwTTh6andTcWVq?=
 =?utf-8?B?TWdhU1o3TTc0V2tsa1pOa2t5STcybGdQVURzODlrdkRJU0RyMEJ2OXhiaHZ6?=
 =?utf-8?B?eTJPTjFKQ1liaW53S2NxalF3TkRQczJQa05lazNpa2g4Z29lTCtsTlM5Wllw?=
 =?utf-8?B?TFI5bUFtSFQxV1FCTmFvbFd3MUJxQkFpMVoyRXNYZS9TUkwyQlRET3lZQVo1?=
 =?utf-8?B?dWcwQWJtMzgwRHJZbjIxRitsTklHWHplbDZqTmxra0NFcHBaR0Nlem01THBw?=
 =?utf-8?B?bWswWmhtSXJ1QmJ0QXJ1YXNtUWtRLzJBaWt6VEMvTUxPUlc5UTJ2ckFrREN1?=
 =?utf-8?Q?PnvViBIyRPnSbme3RZCP1cxQggDm8Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ynd2RWxVeC9FRnRubnBDWXdOOFFSYkhKa3Q1YUR3YlJnUWFqSGlGT0dldU15?=
 =?utf-8?B?ejd2KzF3bkJ4c21xZkIrK0VSZ2M1RWhBZjdJOUtNbGlhQ1pTbHE4VXNYQ08z?=
 =?utf-8?B?VDYzMXhtT3NlQ3RPdzFUQjVtcXArQUxxcm55eWlPSFdnN2U4UmM3bmk2aDFk?=
 =?utf-8?B?UFdldkxQazNJaytEZkdSazc2c3pNS3NFYWVkT3F1a0FiQXoyT2NXQ1JPcnk1?=
 =?utf-8?B?bDZsWTY0U1hhWnpETTJqanB0T3l0T1g5OXlVcWU5UmF5d1ZVcUZmQkg0MXdl?=
 =?utf-8?B?eHBPcDhpdG5aZ0lnNnc1T1dXKzRGV2cyNTk4OTBHUGttOXJBZjFnb25jQWlx?=
 =?utf-8?B?OTFkMjVaSGQ0ZFFjL21LNDdWcEpjNmZYM0tvN1htc0ZvR09WbW10UDUwYVNy?=
 =?utf-8?B?T1VacjFwbmlOd0NqUVNUY0t5RHBhQmlnb0lGQVJORHVKa1BxcXlpdGR2bVNh?=
 =?utf-8?B?OHJ5UDJPZWVQOExNVTdsc2c4TDd6ejkrOExIY0dkbkNmVUFJak9WS21rRUJ3?=
 =?utf-8?B?K2JDeEw3ZkRabGxCZmZaZEUzYStzRTlnNUF4SlBWNGRiQ29lQUh3ZzhkS2FM?=
 =?utf-8?B?ZEJhVk85YXdyb0lUWmtIemlVVzlxUXk5cmZVU2RDQWcyZHJLdmNQbFlZRW82?=
 =?utf-8?B?TjdRTWhuRHNLckFhdVBzbGFvQ09pMC9YaWk3aTYrT1FhSGVFWlJlQlQ5K1Nn?=
 =?utf-8?B?M29rQ0EzMXRVS0lVMFY3YWJZWHFTeUlOeE9tcDB5aHd5bGY4b0dXRW5uRi9u?=
 =?utf-8?B?dStNeXgrbnV5dTZ6b3docnluTlhEUGoycFpiOG9HdVhnQ3dzQ1QwZkxhbkMw?=
 =?utf-8?B?Rm1qNW42M0k5N3RmSGFsZUhwSVcxN3hldnFXRDZZLzVpdUhvcmJoMmlhMlBG?=
 =?utf-8?B?VWt1b25OUGlBM2wxR3ZMTlp6VXpreDJHYlV6dDJsMHR2dVRhNmlFZkJMVFY3?=
 =?utf-8?B?bGZ1MVpHVkNrNkJqYXVaSC9WRmpkZ2pZOWtWc1EwckdiYUw0a29zQUVNSWQ0?=
 =?utf-8?B?a3BPckxGaHByYXJGSGtPNHh3SkpjWEU3dlc5RDhSaTR2aFNiRUxVcGFUVnVi?=
 =?utf-8?B?QnpKd3M3L3d6K0RiNXg1QXJCSXlKQ3pPY0dNYXZyN0o2a2QxNnRjcVptazRF?=
 =?utf-8?B?dHBERmNHNUwyVDd5TFN1YXdOMzJFZXJTUFN5RWl0M0RsVUNrRDl6em1QMGtW?=
 =?utf-8?B?dmJZYlVWeW1Yc01ZNHp1cVNTcmRibXBHd0w0R1g5OFRuT0ZpZHd4K3FVbXc4?=
 =?utf-8?B?QW11clBwcGkvYVVOTmxWUkVEaGJTdXc4bW01ZkR2aktIWU9ORC9LVVhYWDFY?=
 =?utf-8?B?VTkyaFpBUUZRZ28zaGZ2ajNTVThKUGt2czJZdXpwNG4wQmxBZEd3em82SWJ4?=
 =?utf-8?B?Zlo5bG5DVE8yMEJzNVFWeFRUQ3FMS1ViZHE2ZEM2RENha2crMU1iM3RUMGxy?=
 =?utf-8?B?ZGlEQk5Xa2ZibmovbVBKVG5ITDAyak9vOXMwdlk4L2ZKemwvbVduOTJIUDJp?=
 =?utf-8?B?QVlicEtrRGYvdGREV3UycS8xUlhPNWc3a29oaXFpUHNRcWVHcXhuZzRYK214?=
 =?utf-8?B?OGhaV3ZmM25zWDBmaDJROUdKVytneU5wbEdkbGQzYWVUeENmdVNnVWVYZ0c3?=
 =?utf-8?B?TzZpVGdJZ2IzYmVmSitEZExGcEFHcXg4VjA1d1RTUHFnQ3Q4MkNqMk5Ga2pE?=
 =?utf-8?B?K2tiNzI4TXM5REhoeVY0ZzhYMGNmTGVEUk1EU2NiWndLWU0vMUQvczQ0N2Q2?=
 =?utf-8?B?RzBYcitHYmdTZCtaa2ZLOWNuNmVPNkFTUHpiWTNHSXZVNlZwOEVYcG1ld1Nq?=
 =?utf-8?B?a3U0WWY2aWFGU1NROGVXNEU0ZS81QTU2Y2xLODlJSy9BcjY2aERtcmRYNVVY?=
 =?utf-8?B?bXdtWFNwUFZ0bXJlQ3ZDV2pxZXRqdmZSdHVQUGMxOFozUXcxREpTT3o0VWs0?=
 =?utf-8?B?Z1o0Y1loejJxOENqblBVYkdFa1N2a3lTbThGN0MxNU55N0JYTXArRDJLRzBy?=
 =?utf-8?B?cmlOdVZaZHdpMUEySG9SYy9CR1JIY1JCZzg3Qjlhb0lLandxVkg2Q2tiSkQ4?=
 =?utf-8?B?c05KVTdKU0RJaUVCb29lTkc1REY0bTJrS0dwMStHUHA5eXdSR0hNUGM0c0k0?=
 =?utf-8?B?bnhnbHhhelB3TDNTTTdyeEJoR09iRlA2SXFNTldrRWY2Q1FVa1lnMUNremx0?=
 =?utf-8?Q?2ZbYSpahvo8fZL9gQ1PSi44uEhSTLKncOt+G2YcHG57+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c15d4f1-5789-48e3-b318-08de205dfb7e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:35:15.7792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fb8R6XuSDq9ehwzILwzQIZ7e5Nf13zBpQDzHIgiYv++W3icy51COZOzDKtG1ocjRxXUjrS0vHAZrmN99IrTi7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4055
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

From: Alistair Popple <apopple@nvidia.com>

Boot the GSP to the RISC-V active state. Completing the boot requires
running the CPU sequencer which will be added in a future commit.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs         |  2 -
 drivers/gpu/nova-core/firmware/riscv.rs |  3 +-
 drivers/gpu/nova-core/gsp/boot.rs       | 65 ++++++++++++++++++++++++++++++++-
 3 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 31904e1d804b..05b124acbfc1 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -616,14 +616,12 @@ pub(crate) fn signature_reg_fuse_version(
     /// Check if the RISC-V core is active.
     ///
     /// Returns `true` if the RISC-V core is active, `false` otherwise.
-    #[expect(unused)]
     pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
         cpuctl.active_stat()
     }
 
     /// Write the application version to the OS register.
-    #[expect(dead_code)]
     pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) {
         regs::NV_PFALCON_FALCON_OS::default()
             .set_value(app_version)
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 7d82fb9876e8..28dfef63657a 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -57,7 +57,6 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
 }
 
 /// A parsed firmware for a RISC-V core, ready to be loaded and run.
-#[expect(unused)]
 pub(crate) struct RiscvFirmware {
     /// Offset at which the code starts in the firmware image.
     pub(crate) code_offset: u32,
@@ -66,7 +65,7 @@ pub(crate) struct RiscvFirmware {
     /// Offset at which the manifest starts in the firmware image.
     pub(crate) manifest_offset: u32,
     /// Application version.
-    app_version: u32,
+    pub(crate) app_version: u32,
     /// Device-mapped firmware image.
     pub(crate) ucode: DmaObject,
 }
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 770731c3eb89..eb0ee4f66f0c 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -4,8 +4,10 @@
     device,
     dma::CoherentAllocation,
     dma_write,
+    io::poll::read_poll_timeout,
     pci,
-    prelude::*, //
+    prelude::*,
+    time::Delta, //
 };
 
 use crate::{
@@ -143,7 +145,7 @@ pub(crate) fn boot(
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
 
-        let _booter_loader = BooterFirmware::new(
+        let booter_loader = BooterFirmware::new(
             dev,
             BooterKind::Loader,
             chipset,
@@ -160,6 +162,65 @@ pub(crate) fn boot(
             .send_command(bar, commands::SetSystemInfo::new(pdev))?;
         self.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
+        gsp_falcon.reset(bar)?;
+        let libos_handle = self.libos.dma_handle();
+        let (mbox0, mbox1) = gsp_falcon.boot(
+            bar,
+            Some(libos_handle as u32),
+            Some((libos_handle >> 32) as u32),
+        )?;
+        dev_dbg!(
+            pdev.as_ref(),
+            "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
+            mbox0,
+            mbox1
+        );
+
+        dev_dbg!(
+            pdev.as_ref(),
+            "Using SEC2 to load and run the booter_load firmware...\n"
+        );
+
+        sec2_falcon.reset(bar)?;
+        sec2_falcon.dma_load(bar, &booter_loader)?;
+        let wpr_handle = wpr_meta.dma_handle();
+        let (mbox0, mbox1) = sec2_falcon.boot(
+            bar,
+            Some(wpr_handle as u32),
+            Some((wpr_handle >> 32) as u32),
+        )?;
+        dev_dbg!(
+            pdev.as_ref(),
+            "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
+            mbox0,
+            mbox1
+        );
+
+        if mbox0 != 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "Booter-load failed with error {:#x}\n",
+                mbox0
+            );
+            return Err(ENODEV);
+        }
+
+        gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
+
+        // Poll for RISC-V to become active before running sequencer
+        read_poll_timeout(
+            || Ok(gsp_falcon.is_riscv_active(bar)),
+            |val: &bool| *val,
+            Delta::from_millis(10),
+            Delta::from_secs(5),
+        )?;
+
+        dev_dbg!(
+            pdev.as_ref(),
+            "RISC-V active? {}\n",
+            gsp_falcon.is_riscv_active(bar),
+        );
+
         Ok(())
     }
 }

-- 
2.51.2

