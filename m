Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE0vOMN1gmm+UwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 23:25:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E9BDF359
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 23:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF8710E0A9;
	Tue,  3 Feb 2026 22:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L5D9QAbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011067.outbound.protection.outlook.com [40.107.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E58A10E0A9;
 Tue,  3 Feb 2026 22:25:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrBTKR7RnLY380LK5ARY3cbDWuAc6RekGhy3cPOgSd6JIZg0oP6sIPFB7Mzr05FXXjjycqKZOi3IeIY5qLPfJkqzF6kZCCLrnVxvwyK3WYrwXksx3sroMx6Be9lm9rNXY+G4dQFcVJ7XjqpjXcbifDBlQEqFg69bJAga58h+oWJ5MsLkceV4JpAyqFjHcIw1rIkjkXllW+ntLnxTG3LH0l9nw5gIa/OUvaf2C/m+HCAYzbhFnxKQKJbyseTlizDCmvdLID+TcC+5Pm6qG9S4A4WsXdo1IKjy2bouC+UqiwujUzyzWlToWneE/ZBZouByuFq2tpNymJRegrFPyTR6dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qayp5xQ1qIfmM1qpHQ8v0tmaEPUJT3zkTTWuImbq3Uk=;
 b=IDNa8A+Dh81ygZnElZySqbsyTA6EgAFo6FZ0l1Yw/GT+3SxIKWd7StEEuSiJdkwyCDCRYJj3bU8OSCcAaiprJFBsNE6fujY043izCMdznzaKNaZPTdTV46QLQepsgGHFXVXbmOURqcOSUe+OMP8NdMDwVutxh4b+r3hh3KXaJh6ViM0bvKxzX2oCRgbkTREehV2rmsm8YYa56ZvgdkQO1UUfOWc/Rrf0HdVxxxmgq7ncqmapb1HVsPcbWs0al/WkE0Q5NgHZ5QDU3ltWgVypUwAcTeeSp6KLU44+BW6qVq1ViuoumQj8VLG4D5LYmfQyYwGrkwwKaveRjhQy7lwcZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qayp5xQ1qIfmM1qpHQ8v0tmaEPUJT3zkTTWuImbq3Uk=;
 b=L5D9QAbZ8jtsnLIVAFvuZnPcIJrwtIlJ0NUOBDn7ePRNPcMXlH5K8TLZoapVsbEbHoaJfMsFkhTdfk6ZNnzKJklXGcSHHU2UD2K8spViSF8y25QauTrHZjhiWJR56Cejs0aDPhY8Lg7aGikviJOPu/FRuN2Z8cAHe92jXrETHhvltIAQXE+K0mRFnCkhcFON/4OBHOTfkJQFDh8KAl4PF/eOL+hcxFylX1GIxhrzFVuv9g7dPEcbcz0hufBz14mDzEbNNOEu+OVgz8gcNebDYyMnkZlQA3JzzsMfxR+u1unhApQHwHDUJd2ojmulzhvLv44SpPSbd56KLeIjFHQ09g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by CY8PR12MB7659.namprd12.prod.outlook.com (2603:10b6:930:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 22:24:59 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 22:24:58 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 07:24:51 +0900
Message-Id: <DG5OGLH0BHNE.2XSVBQHAAXHGI@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Alistair Popple" <apopple@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Dirk Behme" <dirk.behme@gmail.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com>
 <DG0607SU943F.1FDOPYPN38FCS@kernel.org>
 <259bdacf-d16e-4fff-9f6b-f860feb40aa8@nvidia.com>
 <DG0N5PNS1ZQ0.13WMT4XYDXNUS@kernel.org>
 <8859d68f-ca38-469e-8345-84059573ac97@nvidia.com>
In-Reply-To: <8859d68f-ca38-469e-8345-84059573ac97@nvidia.com>
X-ClientProxiedBy: KUZPR03CA0019.apcprd03.prod.outlook.com
 (2603:1096:d10:24::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|CY8PR12MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: 440d9985-fbdd-4c74-27ac-08de63731005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzFjMmVJbGFlaWJ3Rzl0b3RyS1dYVURCNExYb1NwTjF2SjdNSWJGVXA3dCtM?=
 =?utf-8?B?bDgrbzJDTWhGczd2Z3pIQkRjNlFoa0tsdXBsMUJJWmFhTk4xd2oxMEh1dFZY?=
 =?utf-8?B?UVVJT2V5TVoxQXdHUFZDWVpWWTJzSEtYaWlwaEdHZEN5S0JpNzcyd0JQUVJR?=
 =?utf-8?B?M2R5T1BqWEd1SHhvL0ZmdDF0UnVtRzc0djJtVXNEYjErOFhnZFB4cmhCc3U1?=
 =?utf-8?B?K2FUSWZmRDVjckM2dzJaNnR6anlISURHUDdQNUY3NHY1MXk1cU9qaDRaV3Zv?=
 =?utf-8?B?aVJFbjdjMTlXeUFNa3pJQ0JQRk1scVZZNVJYWE5jQzJWMDlLdmVSYWhXYTBy?=
 =?utf-8?B?YU81Tk43b1VPZFVDb1c5VkxlZU0wQndKTythWE5teGVNTG55L2JPbU56WlJ0?=
 =?utf-8?B?dFZnVEc2MW9NNytvQlVGU0xGbGRaTDBvRGd3a0ZEL3NDUmFmajhXNlc4Tmlk?=
 =?utf-8?B?Wi9HdVVYTGFITkZaRFNMam96ZkJabU5WcHJtd2wwdnFQSHFJVjd3NWlVQzNV?=
 =?utf-8?B?Zyt2U2lXN2ExdDNVM1hjSkdhUDVnSXVwZGJDQlEwK2hINW42MXJkc216bzFB?=
 =?utf-8?B?djQ2U0RuajhENG55eE9JRXdKRmtPNU44QlNCY1ZhRGNocGk2YnZEZm96TWs4?=
 =?utf-8?B?bmRWRXF0VjFoMmNWUHRycFR2eUNESUpObytkYlVUWXBJanhFWThpL1lSTGNo?=
 =?utf-8?B?cEx3RkNxTlJFa3gydytPeDUxckRNU0F3Z0tXaXBDc3RsRXYwaUo4Rk5waHJG?=
 =?utf-8?B?K29jTGFIV0dEazZ3TVMwdStHR2NoVUI5WHptbGFobDU3bExFRzhFYk1uYWJL?=
 =?utf-8?B?QWtGd0J6V3UwcWd1WVBNbit5ZTRJK3ZoU3dhRmNpRHZ1aTArTHVsbW1nL0F1?=
 =?utf-8?B?Y1NZVTlRY2N2M0duOW9IcmFsRUZ0YlA0MW5jZUR1SzI1Qm5XNE1CbkRTTGVu?=
 =?utf-8?B?bVhhbEhURk95U3ZXTXpSYUNvNjVndHpXSy92NklDN2t6SEovZDZCekVTK0M2?=
 =?utf-8?B?UHRtNk90YnNZMkt5bVhXemozeHpZLzVNVHVaSzhHNlNYMlRHdEc4U09Ob3pB?=
 =?utf-8?B?UDRjbTE0elp6K2JGTnUvRWZPZTVJcFpERjcrbTBHVUhsVjRtNUJvcllzeW12?=
 =?utf-8?B?bUVJY1d5MndZUzVudVZXUEdTR0JIYUFBakFlR3lxeHp0QU4zWFdlZmdkV1ZS?=
 =?utf-8?B?blR1WkVPWjgvc2RxZlBybkdsVVB0RGg0S205NW9ZdjhNWEVWOUFScERaL3Ey?=
 =?utf-8?B?S3lmb2tXVnlkRk45S0RhS3BpYjJSWkIvL2dNdC9mbEVoSUVsVHFJanBMcUF1?=
 =?utf-8?B?NWhwWU9MdGFpRkhodmhFdWJ2SWlLNUttTDZTOVl3UHhoRnBFRnlDUTRCWVdr?=
 =?utf-8?B?YUV2b0FtVWhmaENZTXRzSURCamR3V0Yvc043dDcrS3lxaDRraW04L1E4amRo?=
 =?utf-8?B?T0FhbDJhR0NpWWNUOGhpdU1vSDVid1JsdHRjWHgvVGtrS2FteUV5MnMzQmlt?=
 =?utf-8?B?cVR0dTkrYzZGS28xU2w0WXNZeWVuVzNrTmlFNzdjTWIwb2t3NDFERG4veklh?=
 =?utf-8?B?WFdvT3h4V3I3TkY0UlR3V1JHbnpueUp0UUZ6d2pEUC9teENxc0FEOU5MVmN3?=
 =?utf-8?B?MjlZQWdpa3docHNhaU5jbWFxaXZUS3YxcWhCa0JWZDBCa0l1a1RYS3R2NUxh?=
 =?utf-8?B?Q1pvUktESEN4MzJocmlPOVF0SWlTOEJHU1ZLQlYyMjBzUjZEOG1xekhhU2ls?=
 =?utf-8?B?bjVXWmw3eDRPemdNL0dUYUI2dGZobXRZZEJBdmJFZE5aRHFodG82YlhHUS9h?=
 =?utf-8?B?TU53R3hybkF1SGlvVjJxV0F4RTl5cHljSFJXakpKR3hwYkZUWnZXN3RoLzNX?=
 =?utf-8?B?djE5MDdaR3lmVkE3em1wdWFyeXBOc3pEcW1HNzlYMVM0dkRiMldqNVhPNjBF?=
 =?utf-8?B?V0VDeHo4YkpSMmtNajMyQkQ3ZTVxeDF4Z2VjOCsraEE3Qm1lN3o2a3BWd0Jq?=
 =?utf-8?B?bGp2dkc0SEJtdDBQOTBOZGs2UDJ2SFB6TUlXTHlnL1lwYldlcGJpdWFVaDVm?=
 =?utf-8?B?d0lCV1N2TDZSSG1BUjlBMGxHYlBPVW51elVValROUXhvcFM2N1VrNDRqaHFE?=
 =?utf-8?Q?UfbE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajdMWW02akhJQXRtWkIxKzUvZk1KSms2aERVK3hqRU5HZkpacGsyNUFaUGVa?=
 =?utf-8?B?Tnp1QkdVUHJ1dnZDekY5eWJWMWxjT2JqT2prWlZ1aURrR2IvbnNMaHBXbVZO?=
 =?utf-8?B?M1NZQU8rd3RuRUJLSUtFZEpWR3Rmd3FVQmhkK3BhZU4zeVdUVVdMZzFYVFlz?=
 =?utf-8?B?Q0Vva2NycXZMWWJhWXVPbmJyZGNkeCtZZFUxUFkvdGRaODh1UllIOFNmbnRJ?=
 =?utf-8?B?V0ZSaG8vdkk5MFpxTU8rL1BudGtIWDNYS3FtZERxOU5PSlZaY0IrYVpsVzkz?=
 =?utf-8?B?b0s1VC9FMFVNSDhDN3FzWm1iSmdiTmtkTEhlQXZtbmk3cVdhSjVVOEhuMWpp?=
 =?utf-8?B?Z2ppT0lFbWNBRHZtT3ZNeGpJUHZXR2tucW16emhOUmFIMlp2ZTlYaGNzUUl6?=
 =?utf-8?B?dndTamhWcGFGbkFzcGRmTEpCbUZoOHc0L3lkRGRmSzBMOG1hdnM5TGd5Z05v?=
 =?utf-8?B?eFg5MDlOR216NVh5cUhaWEFCQ2NKUmZtQTJCZ0NJWndrZkpLR2o3QUV3NGV6?=
 =?utf-8?B?d1BqeWwydmY5TGQzWDdNMmo2S014dVhiUVZrZWs5SVh1RS9Vb3I4OWRuay9B?=
 =?utf-8?B?bGtBSWJpNWlMVWlrTlM0TU0rYUUwa25QY0FtMEc3TWsyeUJiWm5mYjVJWUZw?=
 =?utf-8?B?SzRNMllodnZxWk5MSi9OY09VcGR3dEZ1STdQMFZhZVJqUjRBRlpyckFINXl5?=
 =?utf-8?B?TjJrL3UrTW5iSnhqV0dCT2pURnUvN1BVZGdFYU9qNUQrSnl6T2pGQ1A3YjdU?=
 =?utf-8?B?WFZLT05QT1VvNnc5VXUvZWhCeXFwU0gveWh0Y1ExMlRQL25ZanVyR0hnYVlM?=
 =?utf-8?B?WGoyRkszRFlMc00wWm5mV0x1V1pReGp5Y2Z5ZjU3ekpyaUR3TnBlTjl5dWRJ?=
 =?utf-8?B?Zjdrd2o2NFBER2NJcnFjUlJtM0FhL1ZDS0hrdDAyS09rdVlHWjNvRnhHMjFZ?=
 =?utf-8?B?OGVTNFN2WWhJRlh5VmYrbVIrUEJLbml4cEUvQ21TMm5NM0cvY2pQZDNJeUdp?=
 =?utf-8?B?anBFbGloTmFNOXdMT0tGeWdvWVJ3Z0FVTXR6aEJZaW1DbVBjeU4zRENBRm5L?=
 =?utf-8?B?U05IZDM1ejVNdlpIMTM4bkdCT3Y0bzZTOHFydHFGTVdRMlNLcDJHOUZnZUJT?=
 =?utf-8?B?bVpvR3JuU1FLUFIvSXFJTndSV2lGZitqOHgvMGVPQk01bEpJckMxSUhpOHFO?=
 =?utf-8?B?QmJleGgwSnlMdnhJNnZYWXU2NDBNbGQzdHUzVUVxWEF5dUF3ZVpxbUpxSEhM?=
 =?utf-8?B?eElhTkoycGNFVEt0YjZXaWNSRS9KL1RtV1pLU3N4TkpUSTJKYUJ4QU13eTVV?=
 =?utf-8?B?UnhUenVGR2pvdzdBRmdyek9KTkZISm5VZ3JQaWU0cFhMaVdhaW9YbFVpcUp4?=
 =?utf-8?B?OE9CZ1NWdzJSaUVBb0VyNElyWTBENFFpeXBrVlhxZ1V3ZmtlT0FKRXAvWEM1?=
 =?utf-8?B?ekNEMXRvdkFGQm1Na3JMdVFRS0tlWWlkZnZpdSt0RXA3azQ0QjRvSWZQeWVt?=
 =?utf-8?B?eTQzaXFyQmtlQmNCMmZtQTBQalVVVGNWWTZKMzdVcjFyVXk1TDZtUjdIL2Ew?=
 =?utf-8?B?K2h2M1hwZGN3TE1ubHlDRmNYbmYwRFBtZlZ3c29idEVSVXptY3NtNTQxcXhH?=
 =?utf-8?B?MmMrY09GRUZLRDFMV2RiZzZzVXcyLzFtZ2xmdXViZnV6TUIyaVMwOTZHaXlF?=
 =?utf-8?B?US8xVGpRWlhMdEQ4aDJOSFZXQVNjNlhENUFXUU9Va2NPYldtRlFTeGNHYU9v?=
 =?utf-8?B?WmFvTENrNmc2RnI5ZER0TE9ycDh6NFNNVko2NXlSVmp1SDBtZ1VyMkxoOTMx?=
 =?utf-8?B?NC9VVWgvRlZ4T0htLzlWcVNYUS9nam1pci96K1RRamsyTk9DUVgvK0REMDdT?=
 =?utf-8?B?bW43MFpseUZFb3JXU0dSNFR5WVFrYnZ4dTJqZWFuZHVxZkhGV3hwcnZmR2gy?=
 =?utf-8?B?c0RvSDllTStjWDN1UXVLUnBDRVh4QUdkd2k2VFBqSzFCTHJUSU1PaFZVRCt2?=
 =?utf-8?B?d2Myb2xnR2dzUTRSYzByN1QxTGcrR1pmaHhTeXFvNGE1NUs4ZDVya0pxMm9i?=
 =?utf-8?B?WktZWTJFL3czNEVuU2hKbnp5Z0hWVFRVZlFaaXJOL1FLLzEvSVlZQWtBU0FB?=
 =?utf-8?B?Q1EvcnA5QTFabGptamJZeXNOLzZvd0pJMGpkc3lYK3ZzNU1meXFCU3hnRHUr?=
 =?utf-8?B?VEVTK1NyMjZaNGhRVGZiRFo1UXg1VTJKVHVZWUNFYTdER1VibXkrN2R2cW1w?=
 =?utf-8?B?aFpybmlSV2dQc3N3bTQxc2R0SkZoWUxmRUlDejBrVFl4T2lEa1BuK2ZyY3pv?=
 =?utf-8?B?ZS9XOTVBM1FxQ2kvekVxZnJZMjhTTEd6K0JpNTJIRVVoTmhMTGNYdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 440d9985-fbdd-4c74-27ac-08de63731005
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 22:24:58.5342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MzRmxZ8Qx758aoxCArpf7DAzSjjk9AOghGoDmiVnzDfvhCPhL5j2WNRn49YkgAW3G88Tohtc5dQ7+xpmmT7FUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7659
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,vger.kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,ffwll.ch,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 42E9BDF359
X-Rspamd-Action: no action

On Thu Jan 29, 2026 at 9:58 AM JST, John Hubbard wrote:
> On 1/28/26 4:20 PM, Danilo Krummrich wrote:
>> On Wed Jan 28, 2026 at 4:14 PM CET, Joel Fernandes wrote:
>>> On 1/28/2026 5:53 AM, Danilo Krummrich wrote:
>>>> On Mon Jan 26, 2026 at 9:23 PM CET, Joel Fernandes wrote:
>>>>> @@ -267,7 +264,12 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: =
&Vbios, cmd: FwsecCommand) -> Re
>>>>>            let ucode =3D bios.fwsec_image().ucode(&desc)?;
>>>>>            let mut dma_object =3D DmaObject::from_data(dev, ucode)?;
>>>>>   =20
>>>>> -        let hdr_offset =3D usize::from_safe_cast(desc.imem_load_size=
() + desc.interface_offset());
>>>>> +        // Compute hdr_offset =3D imem_load_size + interface_offset.
>>>>
>>>> I do get the idea behind those comments, but are we sure that's really=
 a good
>>>> idea? How do we ensure to keep them up to date in case we have to chan=
ge the
>>>> code?
>>>>
>>>> If we really want this, I'd at least chose a common syntax, e.g.
>>>>
>>>> 	// CALC: `imem_load_size + interface_offset`
>>>>
>>>> without the variable name the resulting value is assigned to.
>>>>
>>>> But I'd rather prefer to just drop those comments.
>>> The idea of adding these comments was to improve readability. However, =
I
>>> can drop them in the v3, that's fine with me.
>>=20
>> Yeah, that's why I wrote "I get the idea". :) But as I write above, I'm
>> concerned about the comments getting outdated or inconsistent over time.
>>=20
>> Besides that, it more seems like something your favorite editor should h=
elp with
>> instead.
>>=20
>>> Do you want me to wait for additional comments on this series, or shoul=
d
>>> I make the update and repost it?  Thanks,
>>=20
>> As mentioned, I tend to think we should just drop them, but I'm happy to=
 hear
>> some more opinions on this if any.
>
> Yes, please drop the comments. They were just echoing the code for
> the most part, so the code itself will be easier to read without
> them.

I agree that if the operation is a simple `checked_add`, then comments
are not necessarily useful.

However, we also have stuff like=20

  let entry_offset =3D hdr_offset
      .checked_add(usize::from(hdr.header_size))
      .and_then(|o| o.checked_add(i.checked_mul(usize::from(hdr.entry_size)=
)?))

Where the order of operation matters, and for these I think it is safer
to have a quick confirmation.

Thus for anything non-trivial, I'd like to keep a `// CALC: ` header
describing the intended operation. I also noticed that LLMs check that
the code is in accordance with comments, which provides an additional
layer of checking.
