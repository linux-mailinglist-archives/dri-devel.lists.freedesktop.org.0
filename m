Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32814BFDB16
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 19:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2AB10E821;
	Wed, 22 Oct 2025 17:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fdBre+CQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013056.outbound.protection.outlook.com
 [40.107.201.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458B210E17B;
 Wed, 22 Oct 2025 17:48:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUcAc3JHH+ewW1YbadY91Fg5ZjqkR2dqfnTxL2PHXb+6HZJN9qKAPABxpG2EhGxXxLOcrc4U2HWyE+GcWtrlHA7apkMSDuCWIJsmkPaSQATnAedVdTNeOTPxtHRADpIM1qGdxXnQ4FvDQg38ahn45BkowAXDtQ2Liv31vDFsRVQYK3Jx2MvZ/abYxqUUow7RV16jHf6pctnzO+ahdgnOfInkaG0zE8NpF+bpfbfyStlPLhKBi7cnz8u6f7gL/kkEywrZq4YgP0lF/d0bLN6jHZpWGmuyIaspmQ/V54DV2HA/wBdT5ygTgviGlFW5GvdFRgL9wDFaTSVGs/d/G3h0og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVh34nPTZdnYt2fF6UHUQIL7AhTBMM5wIZNu7t/Z/Wg=;
 b=pBYHEm2SBg18rfDcxNpqFrkNYLzPM6Iyn0kyz5bJdY+r4j1nQj9Jmvu5VeFQmMDDcTQGmZ5IXpYEF8A+mcvNT2zKSTHMTAoNYv0ZTmHOkAhJ/dJHyQo44B3nJjkW3qjkcNQnUNkDBGhS0itvyzdVSxlsBgQ99od8Cv93x/eSfck4QDGfvjAWanQ8c+sEsgGODM/k0E5+wfmw1t4KXDRfl26u+94QJg2y0e3YWfB09dadh1vZWAab5+8rfid34jW9tbVR4C1zFYyMkJ4DHaNOXREsH0N6a8xLAUbhExgKGcduxCyfvD+1bELr13BFSx2m1GlDn6oT1XjjiJZz6lq9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVh34nPTZdnYt2fF6UHUQIL7AhTBMM5wIZNu7t/Z/Wg=;
 b=fdBre+CQYXlVLRUAsOHz9mZ+pCin0EYjxO2kRawwQ3yXp9Q4b63WLQYLN4lqrYd0IyxWqF0MtRiuAOSWWUaFwAqwXa1PJbapxXC3yMXjQlHiP9IrUoiuHHKqx7pnl3MvIwTETY0SZka75n7tt1VI2SRqO9PPi8AnJoaA+3y8zi+OlsAygFO+EL8b0th75jf03pXo/NM+sGOPVtgwdC/zxZdFMDpkMVE/n8cj5w/raPH3UEZvCty6eDiTbhVURLI0rPeP8vaWZIsB0YK98q4QoqFgHsfcMTdvbGJmebXfD75M1CxEEvR8t4C998XJYO2k03qYrZVYba0meKr2wmmwyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB7701.namprd12.prod.outlook.com (2603:10b6:8:133::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 17:48:48 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 17:48:48 +0000
Message-ID: <a8eeccb7-9586-440f-a12a-e877a9197652@nvidia.com>
Date: Wed, 22 Oct 2025 13:48:43 -0400
User-Agent: Mozilla Thunderbird
From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH 6/7] nova-core: mm: Add support to use PRAMIN windows to
 write to VRAM
To: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-7-joelagnelf@nvidia.com>
 <0cfdfc96-f98b-4ec1-9218-10f7344d6605@nvidia.com>
Content-Language: en-US
In-Reply-To: <0cfdfc96-f98b-4ec1-9218-10f7344d6605@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0060.namprd11.prod.outlook.com
 (2603:10b6:a03:80::37) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: ccaa6e86-5124-4732-5f23-08de1193410a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SThNMExqNDJPeWM4RFdOUTM5U3ZkdmdrUG5sdzFGdU5DS2dtNjFZNU9YSFFJ?=
 =?utf-8?B?TWJPU2lXU0pWdkdhdkQveEhwalYxRk9lTGdIR0VvVDBNaXc1SmdObUc0ZG0r?=
 =?utf-8?B?YWNQZ3Y2TVc4RkhZaktJRXdVaGh1VGYxTDdWbExmcytCS1VpcXVqcG9Rd05r?=
 =?utf-8?B?MmNya2VYNm4waFY4SHRib1laOC9abkhrdjh3TS9NYzJiWVFKSUQzRnFlTEpi?=
 =?utf-8?B?L0srZlFiS29sY2xSVndPRUphVVU1cHF4YzRCQTJMWGNJUENqYVdpbTFwbHZr?=
 =?utf-8?B?NGN3dkZGRGdkUm4zVFVTaUVkdWNGaGo5QUF0RnVIck82NnltQS85MllFZDgy?=
 =?utf-8?B?VnRJc1dSVlk0R00rVlJ2RExDbkxKR25OdCtOT3RmREZTSTUrWTYwVlNwbnNP?=
 =?utf-8?B?cWRsMDdNMllEWDdIUGlaOUlvZ2hkWWNhQzd1T2kzbng0bzNjV25mbDl4bkZy?=
 =?utf-8?B?WloyMzd0WkJ3YW1NbVFOOFhWSEdEd0NYMFp3eFhrSDN2VFZpb0Zqc0ZKWGRk?=
 =?utf-8?B?bER2QzF2YVZMbWZteFJDU1U4V2dTQWo0dGpvcnlEcGhlazlMdFVVaVBIc1Zw?=
 =?utf-8?B?TW5XaVEwZkdNL202Y0NNTlJFbXUyKzc1cEtUa0Z3VVBCR2lMS2lUdkNwTS8y?=
 =?utf-8?B?M1p6clc4L1BudENwOHRGMEpiR3pUd1hYM3pqNDVsR2hObVlPWGdiWGdrcEkz?=
 =?utf-8?B?NFYyOWlaOCt4VHJncE1vUnlZSHFLem5TbCt3WVVYQ1FFTU85RW9ORGFUTFp6?=
 =?utf-8?B?YVJ0bDJYMWNMK2VPQmEyYWs2aER5MTdhWHNLc0d2N0VYcThiYjR5cmROYW8x?=
 =?utf-8?B?OXlyZ1VGRlkrTmJLTm9JTE02S2poTEdIeURIanBlM3BqQlI5UTJJdTZmSEhQ?=
 =?utf-8?B?dUdvTnVzSTdkdWE5clBjVXdoMHcxZlF0ZVZYOCszUU14UTJsbXFvVFVrMTA4?=
 =?utf-8?B?MEEydmRPK1FkN2s5MSs3WklzeDJ6eHdUV09PZ3l4Y3FTczNPaFBUcWpyOFBC?=
 =?utf-8?B?Y1J3WHZOeEFtaGlKRDJndFVGN1NnV3VRVlh3anFMUDk3RW5kU0Zqdm92QnA5?=
 =?utf-8?B?VFBmVWIzeWtUNllBT3piMDVrcmFjWGlOeTMvUWY2MnRyYXVVTVpxcnI1TFdm?=
 =?utf-8?B?Z3pXdVR2MVZMN0JPT2RwRC81T0NtakRMT2lrZWhMWTRRaXdKZW5jYmMwY2FF?=
 =?utf-8?B?bGo1eVR3bG1lWjh1ZlpxNVhnK1dOQVF0RzZ1ZmhKaUVGNmR6QzhPVkJXQ2o2?=
 =?utf-8?B?MU94SVVKSDJzTFd0aGRXRE54SW0wOUtiWlpXOUs4dm1hYmUzaXhreGw3ZVhG?=
 =?utf-8?B?RDdPaDM3cXdQT1Mvb2FHbWFKeWJhNVdzOE9kbVUzVFhuTVg3ajRjc2VzRGF0?=
 =?utf-8?B?QlJWK0pCU1pyQ3BSYWExYmRRSHlrbXh5c1Eyc2NMZGpvdWwrMEE3eTJWVFVH?=
 =?utf-8?B?c0tSZU4zeVFNRGlJVnpvM0k3VnRoODBYVUlCSnR5cGl0TXljZC8wK3NUNCsz?=
 =?utf-8?B?amM5V1k4b1E4blJLK3JhTGpveXVlYytJNHplaElxVE9wOW84Wkc1bERZdmZ6?=
 =?utf-8?B?L3dyb3JadHRsK1VlQ3FrMnZPLzdYUEwxWjg4ckFwNTA4WVJaY3V2dURuN0Jx?=
 =?utf-8?B?QjVDbGUxVS9hTGRMRkVNYm5pY0RBVkhNZG9TNDdaTzYxOUwvbFpTRjduRTZS?=
 =?utf-8?B?NVhNTVV0eERYOGxGbXp3dDdsMTB6Tm5XQzEzTERNQnNYNk1KSkQrNE5QTDND?=
 =?utf-8?B?aHpidlBqTlFiNmlXTHQxekVGbW8ydVVYOWErRm5aSThoUElxN3dsVkNyRStk?=
 =?utf-8?B?TitFWUtIRWZpTU9jTkV3cTlNSkIwRHBBNWlFMTRDVDI0QitPNFJkWTNENXpV?=
 =?utf-8?B?dGthdE1KeXE0NVZmMitPOXBFTW14cVU2bSs3dnBua2tUMVZrNFZPaG5FYzh3?=
 =?utf-8?Q?FKvHS9icLl6eOs8VHlEvuNhF5VfnM9w2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE5IN3MxVTJ6MmkxVEVTVm9Mb2pTWjZnL1JNNmVORU1nQWFQU0RoSGNOOUx0?=
 =?utf-8?B?NGlSbHVnRjNwR0Uxd01rcmRjeUtWQkFIZEhaeXFFeit1WERyMFF6aG05dTI1?=
 =?utf-8?B?N1pid1hub2VGY29Mb3BDV3p1dDU2TTdUbWYrMWJaaGcwMlV4OGZBNmJ6cEJq?=
 =?utf-8?B?YjdpYmlzdzZCWnBnUzEyOWU1a004bVk3U245dHZZbU85RmRPUTVhTkNBTll5?=
 =?utf-8?B?dE1nVHpHRmtlMWwxeGZxdHp6OSsydkhLTHk3VGlFejE2d01BK0Q1Q1F0bnpC?=
 =?utf-8?B?RUhsd2xjM2N1dVlZSEUrKzhncXNhUFVaSmpoemMrU0tJQXpjUWJ5bXhvek0y?=
 =?utf-8?B?Z1NTVmQwUEphNUxNMlo2RmJuejNFNSt2TEN2ZXpEM0c3TUk5TGFIbXlGVVh1?=
 =?utf-8?B?T2VQdEo3YlU1cmxHNldtL2ZSR0dUcU9MWERBODZQM0dma0NieTdYRDBpclRz?=
 =?utf-8?B?ekdwUjRpYzRTdUk2NlFENXRVeUJtaXp3UTczOXZHaGNyUVhva0UwUDhra25M?=
 =?utf-8?B?YUlVTXFGaUVRNjJ6bEJ4ckkvT1lINEh0ZEkvMGxzTzZFbVdCQ3FDY1A4UVVD?=
 =?utf-8?B?bmE3T2Rlc2wzWGI4QW0yd2gweERpOHFRUEIwOWtjbFJzUjNnOHg5cnl2aG5E?=
 =?utf-8?B?MTBqbnBRTnFGT2pYQ2pBa3I4VGFvTThXeDRYbU9MUUcyZmtqeFJSUlZBOUsy?=
 =?utf-8?B?b0g3QUk5VlJHQm5EMllMYkxtZGZKWW12bndYWm93cmJOeE9yclJRWDArTmpr?=
 =?utf-8?B?VkZ3UU5pclFtUmROVXJPekFFU0gweTJ0OU5LeXozWnU0N2ZpdEZtRU01N2dl?=
 =?utf-8?B?NlpNZjRQYWJ3bHhMd2c1SmRHOVNqaWFuTEViUVQ2ckNUVkp2bFBkdXR3ZWs4?=
 =?utf-8?B?cVdBTG0wdzBiYW9pNDNFbGVwVkw5RW82c1IvUmlydVh2dmpjR1YwZ3lmUHdZ?=
 =?utf-8?B?RzI3MDlNU010NVJqV2RDQkJQUFNUYXJZdStCTGJCazB1aDVnbENiWjkzK2Jw?=
 =?utf-8?B?cjNhS0YwMThPVG1hdVFqNHprRGhMaGRnK3ZCR1hlK1RqTndwRm9WQ2VtNnBq?=
 =?utf-8?B?SEdnaytjTnY1TkdmNWltdFpsMVdYdlZNZFk2QUFiZjl5SUkwT0x5elUwcEU1?=
 =?utf-8?B?c0NxaDlzR3A1ODlSU0tGWFpsaTRwampoa0RCS25vZFh0bE1PUURZYzNXdTA5?=
 =?utf-8?B?U1E1eVhaR1oyMGduTis3UFpRS1BrdkdqZG54K01LeEFpa2tySHYvdWxRL0J5?=
 =?utf-8?B?bXFsY2pBRFJLeEZCV2NxOWY0S3FiMzJFTDFiVTBtTHB5YVBHNVAvYkpEcmpV?=
 =?utf-8?B?LzhyWXVtV0JiRUZ0ZThVT3cyOElmQUFwZldvVVVvaW1PTmE4SXEvOEVWNSt5?=
 =?utf-8?B?WU12VUtyaTBRU3FGakhKNVBpWkROUjRKa01naThoTE5DclZXRUhUaFl6OERx?=
 =?utf-8?B?blJGOThuRTU1Uk44TWZVUXdZNmdKalV4MnZZOGVHS2VKa1ZEdkhZSHlHYVg1?=
 =?utf-8?B?Vmp1cDlKaER0SU9WZW9SZkRxSG1MS2puT0RLdWhKVitKOHhvUk02Z21SeUxx?=
 =?utf-8?B?cjRvMkpTakUvLzJCbXZ1NWlUa0MvNy9peVl0dHNBQ2w3MmxmL0pQYTJ6R09r?=
 =?utf-8?B?V2pjY1hSai8vTkVOQitEWExIZWFyc21vWGdWeUNDREdGUk5semhjd0IzWk1V?=
 =?utf-8?B?UnVWWGRsODhuY3JMVkVnNmhWbUc3RERRMzFnbnQrZndudEVMaTRJaVRqblQ4?=
 =?utf-8?B?b21RM1dkbklFWDhPY2NTNUZWc2xuU3M5SDAxOElydnhiMkZxbkVEcnNDajMx?=
 =?utf-8?B?clFuR2RmTXUxMHB3TUhJZVNjTXlSME51NGZFbkQzUUNTeVdkc3ByZnEvRklu?=
 =?utf-8?B?QWhtZldLdFZ5ZXNlVHAwbklxcFphRkkvNnRKeDZQMXVEMkJHKzg5R2lpQXBU?=
 =?utf-8?B?enloMklYR0FKY2s0Zi9SZkpQRWNGQW5RTFpDck1HNTBHUmk4RDNLQkNadXZt?=
 =?utf-8?B?ZzNXM3RtMFUzMkl4OHd3VmZFci9qVDZkM0lKL2svVWE2U01rT2x3UHBtNlFE?=
 =?utf-8?B?d3V6eVZ4aEJBUDJVMmx4b0djUlE1SjZtNXRDM2liUGRvUFRENTAvZmxlY05v?=
 =?utf-8?B?Rkp3bzBQUzJSTzlMQVFibTZwSkNFYlJPOTBGbmc1allwTkJHclVac25oT3dx?=
 =?utf-8?B?dkE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccaa6e86-5124-4732-5f23-08de1193410a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 17:48:48.4215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftcIQfB6kgSwyNfnzUZebVBOGI4X6Pv1gNGMCxKJrCraKhN3iq0da7J+1hNKU1JCSgRFy8qIH4P30CrV1QL31w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7701
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

Hi John,

On 10/21/2025 10:18 PM, John Hubbard wrote:
[...]
> First of all, I'd like very much for this patch to be at the beginning
> of a new patchset, that includes calling code that actually uses this
> pramin functionality.

There's no code in this patchset that uses pramin functionality though, so not
sure what you mean? This is a prerequisite patch for mm as mentioned in the
cover letter.

>> diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
>> new file mode 100644
>> index 000000000000..54c7cd9416a9
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/mm/mod.rs
>> @@ -0,0 +1,3 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +pub(crate) mod pramin;
>> diff --git a/drivers/gpu/nova-core/mm/pramin.rs b/drivers/gpu/nova-core/mm/pramin.rs
>> new file mode 100644
>> index 000000000000..4f4e1b8c0b9b
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/mm/pramin.rs
>> @@ -0,0 +1,241 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Direct VRAM access through PRAMIN window before page tables are set up.
> 
> Let's omit "before page tables are set up", because that's an assumption
> about the caller. In fact, this can be used at any time. (As an aside,
> various diag tools use this HW feature to peek/poke at vidmem, as you
> might expect.)

Ok.

> 
>> +//! PRAMIN can also write to system memory, however for simplicty we only
>> +//! support VRAM access.
> 
> Actually, I'd like to say something a bit different:
> 
> For Hopper/Blackwell and later GPUs, PRAMIN can only access VRAM.
> For earlier GPUs, sysmem was technically supported, but in practice
> never used in production drivers.

Ah, will clarify.

> 
> This is why Nova only provides VRAM access: Nova supports only a few
> of those older GPU generations (Turing, Ampere, and Ada), and there is
> no use case even for those few GPUs, for attempting sysmem access
> via PRAMIN.

Makes sense. Plus we can also access sysmem from BAR1 if needed.

>> +//!
>> +//! # Examples
>> +//!
>> +//! ## Writing u32 data to VRAM
>> +//!
>> +//! ```no_run
>> +//! use crate::driver::Bar0;
>> +//! use crate::mm::pramin::PraminVram;
>> +//!
>> +//! fn write_data_to_vram(bar: &Bar0) -> Result {
>> +//!     let pramin = PraminVram::new(bar);
>> +//!     // Write 4 32-bit words to VRAM at offset 0x10000
>> +//!     let data: [u32; 4] = [0xDEADBEEF, 0xCAFEBABE, 0x12345678, 0x87654321];
>> +//!     pramin.write::<u32>(0x10000, &data)?;
>> +//!     Ok(())
>> +//! }
>> +//! ```
>> +//!
>> +//! ## Reading bytes from VRAM
>> +//!
>> +//! ```no_run
>> +//! use crate::driver::Bar0;
>> +//! use crate::mm::pramin::PraminVram;
>> +//!
>> +//! fn read_data_from_vram(bar: &Bar0, buffer: &mut KVec<u8>) -> Result {
>> +//!     let pramin = PraminVram::new(bar);
>> +//!     // Read a u8 from VRAM starting at offset 0x20000
>> +//!     pramin.read::<u8>(0x20000, buffer)?;
>> +//!     Ok(())
>> +//! }
>> +//! ```
>> +
>> +#![expect(dead_code)]
>> +
>> +use crate::driver::Bar0;
>> +use crate::regs;
>> +use core::mem;
>> +use kernel::prelude::*;
>> +
>> +/// PRAMIN is a window into the VRAM (not a hardware block) that is used to access
>> +/// the VRAM directly. These addresses are consistent across all GPUs.
>> +const PRAMIN_BASE: usize = 0x700000; // PRAMIN is always at BAR0 + 0x700000
>> +const PRAMIN_SIZE: usize = 0x100000; // 1MB aperture - max access per window position
>> +
>> +/// Trait for types that can be read/written through PRAMIN.
>> +pub(crate) trait PraminNum: Copy + Default + Sized {
>> +    fn read_from_bar(bar: &Bar0, offset: usize) -> Result<Self>;
>> +
>> +    fn write_to_bar(self, bar: &Bar0, offset: usize) -> Result;
>> +
>> +    fn size_bytes() -> usize {
>> +        mem::size_of::<Self>()
>> +    }
>> +
>> +    fn alignment() -> usize {
>> +        Self::size_bytes()
>> +    }
>> +}
>> +
>> +/// Macro to implement PraminNum trait for unsigned integer types.
>> +macro_rules! impl_pramin_unsigned_num {
>> +    ($bits:literal) => {
>> +        ::kernel::macros::paste! {
>> +            impl PraminNum for [<u $bits>] {
>> +                fn read_from_bar(bar: &Bar0, offset: usize) -> Result<Self> {
>> +                    bar.[<try_read $bits>](offset)
>> +                }
>> +
>> +                fn write_to_bar(self, bar: &Bar0, offset: usize) -> Result {
>> +                    bar.[<try_write $bits>](self, offset)
>> +                }
>> +            }
>> +        }
>> +    };
>> +}
>> +
>> +impl_pramin_unsigned_num!(8);
>> +impl_pramin_unsigned_num!(16);
>> +impl_pramin_unsigned_num!(32);
>> +impl_pramin_unsigned_num!(64);
>> +
>> +/// Direct VRAM access through PRAMIN window before page tables are set up.
>> +pub(crate) struct PraminVram<'a> {
>> +    bar: &'a Bar0,
>> +    saved_window_addr: usize,
>> +}
>> +
>> +impl<'a> PraminVram<'a> {
>> +    /// Create a new PRAMIN VRAM accessor, saving current window state,
>> +    /// the state is restored when the accessor is dropped.
>> +    ///
>> +    /// The BAR0 window base must be 64KB aligned but provides 1MB of VRAM access.
>> +    /// Window is repositioned automatically when accessing data beyond 1MB boundaries.
>> +    pub(crate) fn new(bar: &'a Bar0) -> Self {
>> +        let saved_window_addr = Self::get_window_addr(bar);
>> +        Self {
>> +            bar,
>> +            saved_window_addr,
>> +        }
>> +    }
>> +
>> +    /// Set BAR0 window to point to specific FB region.
>> +    ///
>> +    /// # Arguments
>> +    ///
>> +    /// * `fb_offset` - VRAM byte offset where the window should be positioned.
>> +    ///                 Must be 64KB aligned (lower 16 bits zero).
>> +    fn set_window_addr(&self, fb_offset: usize) -> Result {
>> +        // FB offset must be 64KB aligned (hardware requirement for window_base field)
>> +        // Once positioned, the window provides access to 1MB of VRAM through PRAMIN aperture
>> +        if fb_offset & 0xFFFF != 0 {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        let window_reg = regs::NV_PBUS_BAR0_WINDOW::default().set_window_addr(fb_offset);
>> +        window_reg.write(self.bar);
>> +
>> +        // Read back to ensure it took effect
>> +        let readback = regs::NV_PBUS_BAR0_WINDOW::read(self.bar);
>> +        if readback.window_base() != window_reg.window_base() {
>> +            return Err(EIO);
>> +        }
> 
> Let's not "read it back to ensure it took effect". This is not required
> by the hardware.

Ok, it was more for my ascertaining that the write to effect, but you're right
its not necessary so I'll remove it.

>> +        Ok(())
>> +    }
>> +
>> +    /// Get current BAR0 window offset.
>> +    ///
>> +    /// # Returns
>> +    ///
>> +    /// The byte offset in VRAM where the PRAMIN window is currently positioned.
>> +    /// This offset is always 64KB aligned.
>> +    fn get_window_addr(bar: &Bar0) -> usize {
>> +        let window_reg = regs::NV_PBUS_BAR0_WINDOW::read(bar);
>> +        window_reg.get_window_addr()
>> +    }
>> +
>> +    /// Common logic for accessing VRAM data through PRAMIN with windowing.
>> +    ///
>> +    /// # Arguments
>> +    ///
>> +    /// * `fb_offset` - Starting byte offset in VRAM (framebuffer) where access begins.
>> +    ///                 Must be aligned to `T::alignment()`.
>> +    /// * `num_items` - Number of items of type `T` to process.
>> +    /// * `operation` - Closure called for each item to perform the actual read/write.
>> +    ///                 Takes two parameters:
>> +    ///                 - `data_idx`: Index of the item in the data array (0..num_items)
>> +    ///                 - `pramin_offset`: BAR0 offset in the PRAMIN aperture to access
>> +    ///
>> +    /// The function automatically handles PRAMIN window repositioning when accessing
>> +    /// data that spans multiple 1MB windows.
>> +    fn access_vram<T: PraminNum, F>(
>> +        &self,
>> +        fb_offset: usize,
>> +        num_items: usize,
>> +        mut operation: F,
>> +    ) -> Result
> 
> This is far too much functionality, and the code can be made much smaller
> and simpler.
> and still get what we need. Open RM only supplies small accessors
> (8 thru 64 bits wide), and no "bulk access". The calling code can loop if 
> necessary.

The code uses a sliding window approach to reposition the moving window,
abstracting away the details of the moving window from the caller. That
simplifies the callers a lot as they don't need to "loop" and know when to move
the window when they hit limits. They can also write to greater than 1MB. The
bulk of the logic is in this function and the surrounding code is mostly
wrappers, which part is complicated or that you did not understand?

Just to note also, the PRAMIN moving window functionality in this patch allows
us to not need BAR2 to access VRAM for instance memory. That is a code
simplification then as we do not need code for BAR2 (the tradeoff being slightly
slower instance memory access). I confirmed with the team that this is also an
option. Abstracting the sliding window functionality becomes important then, so
I'd not vote for removing this functionality for that reason. And if we ever use
BAR2, having it is still useful because it allows us to have a fallback too for
comparison/reference.

> 
> We should do likewise, and avoid this.
> 
> Then we can just create things such as write_u32() or write<u32>(), etc.
> 
> And do we even *need* read?? I'm not sure we do.

We do need reads as we walk through page tables structures. Note that the page
tables are partially allocated by the GSP.

> 
> This is hopefully showing the value of including the calling code, as
> a follow-on patch in the series.

Unfortunately, there are too many dependencies as I mentioned in the cover
letter, so I would like to get functionality merged in stages. That's the
best way to make good progress IMO for nova-core. Of course, we have to careful
about design etc and I kept it as simple as possible out of that intention. My
pramin patch was written 3-4 months ago now, so I'd like to not keep it too
sitting comfortably in my tree. :). And this patch is critical for mm.

That said, I'll go look at the usecases and APIs again and see if I can simplify
anything more.

thanks,

 - Joel






