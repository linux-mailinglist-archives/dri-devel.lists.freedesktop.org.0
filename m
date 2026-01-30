Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLJTKWZtfGkqMgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:35:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B572B874B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E9C10E954;
	Fri, 30 Jan 2026 08:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="stU6yBWi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011062.outbound.protection.outlook.com [52.101.62.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8179910E967;
 Fri, 30 Jan 2026 08:35:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkKOTW55XpeYNxL6COYyn0oBAES3adPc2AlxIHYHGESi4Ji1lim0RUIHFprWyV/pCoZJZc5VU+L/s99T2NOIvzCkICyk0pkJutvljZK/6y/FyeXDPuqKbYY9bMBwOhECoSWXLOwMiKlPtf1oUibzVjD+3mhbeWmPkX20MB89uNjGy8vtx63QdlFhlrslSKarJheXN3QgIx+rzxR3H60ieBoblQCHgKKE5NmXEH08sDir9FGgO/T1s279afmdRB+MAIH3OP1FyeUDXxvckxdUgG4DojLhx1Mp8yu2AO1YaWdHU9JkQmai5g0kB5ZtTwMFf0EGCx1/HBUwRyRmycEaHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVoiJdbnxUYzw6TIPr0BSTyC5M9MJM6Z3zq76CCkcNY=;
 b=RB33+wC8xVxCKAIbF5zHFg+rbWXhD07iBJN/LUEG2tzURG1ECe0Q5CBX8bJeNjDd5STwsae8AVSQwihS6ocUfN+agZQdmyXsQILdDqNuhZrC3Q5Oj+r5HnMfiXeXlMLNpOtsrQ406M8ad2A07HGfDC6qn98BwASNEPNmhP2nyjB/zu2ulMi/Fq9dt2U2ihrssPF3uvbiQOBR/QQgM2YIufOYXCIdictC7EkQJVjtMkWFNP++ZnJ/UkMaIoxXCDa55RvF1svwxGs/8Jv3yU9c0b7rAICr7SXBJFghi3ts8awCg/IeLgLjZXaSNG/vRARr108wg6DTcdGYgGc7zxh03w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVoiJdbnxUYzw6TIPr0BSTyC5M9MJM6Z3zq76CCkcNY=;
 b=stU6yBWiT+PlERjr/IETYxmrgB9dX+BT+uNvZibaaVb/w5lvbBYkXTi6LoppCZA4pkFEF/bUGa5jHuFPVav6TI2bWDN2EvsOVCVRfcqc6K9UodC6Sj3lVoOHzI38uVyTR5X7G/9fLR4IeNKg8BcmW842gBq7veAWGV+/rmGLvtnbXvydh1iU4bmJselMNPPbxMjWzd8sPi4mLsW2Rp0hp4xUO6ThVmn5ybNprSf2VrlzwD1s8XGpKXM5k2/bPftzi562gdUXJH2PPQUC7z7aMqdfR8XeLOuBEaqYhrbanWFj550BIAwoso2DHuSCi5SC6RUSfdTC/+BpHSMj53IF3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS0PR12MB9400.namprd12.prod.outlook.com (2603:10b6:8:1b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 08:35:40 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 08:35:40 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 30 Jan 2026 17:34:07 +0900
Subject: [PATCH 4/9] rust: dma: simplify try_dma_read! and try_dma_write!
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-coherent-array-v1-4-bcd672dacc70@nvidia.com>
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
In-Reply-To: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0011.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::7) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS0PR12MB9400:EE_
X-MS-Office365-Filtering-Correlation-Id: 40afdc99-7daa-4454-2c70-08de5fda8c98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2Uvbk1oVDYxWHBueVVER1BQNy9QUUNTQVRKY2FzQmxQUUVvQUxkMnhYcGE5?=
 =?utf-8?B?V0RSNGo2L0JKaHRCOGdyTG9Ba2ovK2RCUjN2L3IxODQ1UmoxaWNoZXRFMUhp?=
 =?utf-8?B?bC92SmZWT3hDS2FMUTlMbG04VDRtSm1GUEc5S2NFOVhuZGQ5UjV4V0dKRnNu?=
 =?utf-8?B?b1RkVFlnQWRneWVsMVZObEhaUEVPMXpTWjYwclp2OUtqVy92ell3cm10Q1hp?=
 =?utf-8?B?dDhJS0V5MGlaYmFBeUZwcENtQnErMWVOWEZqRU5HTlJ5amdLYkhpVFhYcGtD?=
 =?utf-8?B?M044bEhGWnZuaDNNM2wzeEk1K1B4cmtSNStiRjdOVlZCU1lRL1Y0ZENadTI3?=
 =?utf-8?B?ZHR6eXhRQURJWVdvQ0dhMmlGUnZCWGhkQzJGRmNxdnB5YXZMQW9xNHQxV1R5?=
 =?utf-8?B?djd0TC9LMm9wM2h1Y1NNSmY2d0ozMTFRWnZkNTVOeHczMmZTcnUvSVdwRjlE?=
 =?utf-8?B?eHdCUjJiajF2anI4bEFuZjZxWlZKdFVLZ0Q4LzBYOHk2a1dNczB2SFdNd2Nv?=
 =?utf-8?B?Vnk5RlhGOERqUnVTa256YUt1ZmZGOFJYQ0hjWWhFYXJ6NmpjSDkvazZ1Q3A4?=
 =?utf-8?B?UC95RU5vaTc5MDRxY0l3NGJqNmdmTElVZkcvWjlpSWQyazdjOThtR28rcjJR?=
 =?utf-8?B?aERrQXkrNGFDU0srd293Q3B1Ujc3ak1xWm5NTjRBL1BTMEFnN2FmbURnSUdS?=
 =?utf-8?B?RXVxVVNkZ244djZuQUpuNGJxWURiUjVBUmorVGl5aEliK0xGbEdXbGRFbWwv?=
 =?utf-8?B?TFhaTmRQcVJ0ckttNXVyODNwbFk4cWI5eVhjblh3S1FROWFKKzQrMUR0eFk4?=
 =?utf-8?B?a1JQSTlZWlBqQjlXTGtOdE5sa1ZlR0lWMGJ1K0dQMVhPSmlTV3F0MVR3dlMx?=
 =?utf-8?B?L3Bydi9yelh5U1gvbGxPNE0waHE4N1NmSU5SZW5YZC9halR2OVdkTmM1WEtK?=
 =?utf-8?B?N0xvS1RGczJmUk1MRDdpNkUrVXRnL1pxVWJ4VEdJdWtUd0Rqa3FvVnRKS3Vx?=
 =?utf-8?B?VjNjdkdhS3VCOENpR3hYb3F3SGdtL0Y1MVRLNGVpUkIzWTFZRDh0dVRkdmJt?=
 =?utf-8?B?WXdyak9CSzdqYTU4TWVPZzJBOS8xOWhYeTRnNkxsbE9pRk5qQXFnMnU5cytG?=
 =?utf-8?B?ZVpsV2RZdDlJMVdoc3djY0poQWo1SUhHa2syZXJBRGxvL1p5UTl5NVhFVE0x?=
 =?utf-8?B?WnRzR2IrcW9ubVFWcTJrNlJQR0dyQzZMQ0Q4ZkdvWVpxT0JpK212V20vMm9Q?=
 =?utf-8?B?d3d4OVdmZEFER3NPZXhJa2VXSk56dHBTMlEwaDJ3WWFRdHNzZ0hNaUJNSnRl?=
 =?utf-8?B?azR0VXRnK0J2ZHUzZE1EdW1ZcVFDbm5oSGRXWW5TVUdNSFpMY3I5di9PejdO?=
 =?utf-8?B?MEtGTjlhYkVXa1lqazVYTHc5eW9iTGdsYWFkOG9EZ1F0WUpYeVhPRVgrMlpO?=
 =?utf-8?B?N3dsWkpkeXN1QzBOS0MvTWRUS2VtNG8rZlpzVmNISVg2cUVsUmx0dUkwRXZl?=
 =?utf-8?B?T1pnUHRUQ0R2RDhpT0FENG94ZDFkTkl5VzJvQmUwZzRDVjBxZ1JZMnZ5WDQr?=
 =?utf-8?B?ZDZ6cmM0OVpzZ0JJTmFiMG1ha2phWExFeW9aKzU4Ry9JZ0RXOW8xSHNvY2M4?=
 =?utf-8?B?dWVuS2IzSFdiVkJQSkdzSHRSMG5pNXltUW1Gdk1ENkNZOU9Ea0lTWnpFZCtY?=
 =?utf-8?B?Y3hsSWJ0TDNMMTlrY2EyazNadDdXQTBxVE4xWGZlSjg4L0V6bGFOT3VtcXJ0?=
 =?utf-8?B?bm0zSThpT2R1NFJOQVQ1eWRTRk1hSnoxNmEvalB3Yy9raHpmM3JPbE1ZTlBC?=
 =?utf-8?B?NE9icjBDTG1hYTFXak40Vnova3dZVm5QSTl5U0UvMHcwZDdQNE0xc1ZRczJ4?=
 =?utf-8?B?YWZHQlg4VGx0YWxnNFJRVjlDUU1mMHkzeHNQTTVaaHpZNlJGOEdLU1JOSi9h?=
 =?utf-8?B?OTB0L0t3NVNwVE1pQnJ5d2tZaXhqM1Z4azYrUjJSYkQ2Mlo2ckF5bnVtdHVM?=
 =?utf-8?B?NkQ1UjJiQTloRFFoZUFRK2VNajRMaTdVVDd4dzJ6Z3JtZkJJVXYvRVVXQi9x?=
 =?utf-8?B?cm9FS0ZNZ3FNMUFpYlc0RHZaemdKbmZaTW9JSklOdldDd2dMMnBCOG9tQXBh?=
 =?utf-8?B?M0dQV1dmcE91aWRZOW43SWNBbXdhQnJOV3lHMjlNS0FqMUZ5WW9valNtRFlk?=
 =?utf-8?B?SWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTg4R2RjeHIvTFY3THZiTkxjdjlwWDRtd200dEZCZFBES0Yzc01jMEZxdWRN?=
 =?utf-8?B?M1JzektyQkE3VzBQMFE4eWxta3JQY2VHY2lHRStmeFZyRjRzREdoMUFYa2xS?=
 =?utf-8?B?UURweERIZE0vWWNETkpEbnJYTWxjeFpLbnBLR09DN3d4T0YyYWFNb3QrMUMv?=
 =?utf-8?B?NlJFM2VNMGZBMk1jdlBwV3A4c2c0MjdyYndYbUJVcTBkTlhaVTk5OWk1RkF2?=
 =?utf-8?B?VmErNmluYVVZZnBXUW5POHNmZ0doNkMvUmJOMEVVdXcrd1N3bzZ1UVYya3VK?=
 =?utf-8?B?WkdhYjNIb2ZwUDJuTk44NGc5Mko4dFVLWlkwWStRbVVnM3FOdWxzOFpmUzJO?=
 =?utf-8?B?NnJDMnptOENWTWgrblRoUTZNbjdYK3JJbHp2SzZFVWlXSVVpVVZZNW1reUhz?=
 =?utf-8?B?TUZTc0JocjZ1Vm05OVExYWxCMXJBYTJRK1BsSUNmVEk5clcxcktkdG84RjJN?=
 =?utf-8?B?Y01OMUlrTEt2OCtXbXZoZDUvcTF3aUdxTDVyUC9jdlFsWGxDK21aalltWkdm?=
 =?utf-8?B?d2FrbDN1YmJrOStaYUd4RXAwdzVEaHc1QzI1VWtWVThndGtQUGp2SHFweGdR?=
 =?utf-8?B?Sk9mV2d1K0YrL2lxWEFiQnQ2NDg5MWgwYXByTFhGakR2UGpPd2prS3haVDdO?=
 =?utf-8?B?ODlmOXVVTzd2WlZRdDZ2elVSSHMwL2FVczl0VHh5MHh6MXg5aXRXZlVCOU0z?=
 =?utf-8?B?M0NXN04rNWVRcERxQTJjUFpKOEpIVkxjMnoxWUxYR2puNHdFRFdOUnpsd1h6?=
 =?utf-8?B?V0RoVHU2eENWSUNjdjNkQ1NQT21wK1JYREVyTm9lanJnamdnWEU4dGs5d1lz?=
 =?utf-8?B?N3Jjc3JXUGFMTW9nY0E1eHVrQTNEczM3cmNyQWdzK1dyZ1hDeFZiZWMzbGli?=
 =?utf-8?B?dGcxV2dKKy9UQ2FYdUV4b1ljV0VHVWN2VGpOYWxoNnJMRFg0Q3Q1UnV0c3Yy?=
 =?utf-8?B?V3NVRXNmWXUvM2xtc1JvNTBGSE5zcE5KZmZZR2lwbVA0NGx3Q1l3VkdRTDFn?=
 =?utf-8?B?a25CdVFWeS9PUGsrZ1FFWjVLK2lKWkpYaU9WOXlEbzNOWjhUUENEbWJSenQx?=
 =?utf-8?B?NXc2VkxHTnMyWlE3NHc2MFpjZEtwcE5BYW1zTGJYOHNQNkordXZhT1QzRmx0?=
 =?utf-8?B?K1N1elNJZnp6VTI1N2lzWm92aldKYiszQVAyVHVIYi9OeGxBbm0xWVd5SXE4?=
 =?utf-8?B?YUFZY3hVTVNWQzROMlZ1QnlxOXBndHUxUlFRb1Npblp1MVlMWklLNHdMMm0y?=
 =?utf-8?B?OGF3RmRlTlNPclp1ejJqLzJaa0NHU0hwY01ldms3K3pZK1dxSHVEaVpLZVhS?=
 =?utf-8?B?VWgrTUJPVDREQXUzUEE2OWE1N2p6eDdqRnJDbWU1Q2MxR2YxRC9tbE5YcVNF?=
 =?utf-8?B?NlRhYmlnVmZvVkxreUNYd2FvTmpnVXFaOGZBL1BYbkdGR0dVK21HY0VKOWdM?=
 =?utf-8?B?QW1IeDRvbThxeW91c2NyWmZNUW9TZkptOWgyOWlJT2YvbmhpRjZCdVpqaG9p?=
 =?utf-8?B?Rkc4MUU4cnBMMVp5K29rbkhkeDN5Z00wOWRzNUxhNHVvN25GcGFDOFNYbjQx?=
 =?utf-8?B?MTFyN1lISDlMSHRuVDBkd0o4SUNZRXQ5cTBXaVMwbElUcExiNTFNa2NwaFFX?=
 =?utf-8?B?dFRZU0VXbENlVzE3SXQ3QVFpQklWbnBZZkZ5UGJsTnhkdGR6NHhTZ2VvRmhQ?=
 =?utf-8?B?MTA5WUZOcm52ZVlLemg3YXE1SEtqazcrZzZvT3VMM0txWWNZSDN6WlJjQ2dZ?=
 =?utf-8?B?TFV5b0xVcUV6NG4xNVBWZm4yeVEvdGFvMHlSU1BOcnUyWUR0NTBjditxTE1U?=
 =?utf-8?B?ZHg5R25YZE5aeVptbEJoZ3c1Vk4yVjIxQXJ2ekhFOEJqWjJnVUxQSXdTbkh0?=
 =?utf-8?B?d29JTEhvbU1hVUQzOHJYMHpmMlgvM0YxL1pmbG5jbE5sY083UW5mVEhIMkgv?=
 =?utf-8?B?M3FYN2RGU2pNY0tIVWU1UUVSekdyM1IyNW5SclFZWWJEL25xQmUzYVRtVVMv?=
 =?utf-8?B?K3g4MFVhSnRrM0phOVJBb09QMFFRa2hpMmQ2TW9STVFDSVcycEtkcVM3Mm1i?=
 =?utf-8?B?cjd0NWt3L3dMOWJtdDA5bjRGZ1dZdmx2dWQrR0owaHd4TmtZZGhyTGJzT1FD?=
 =?utf-8?B?V09GZEFMNXloL3U3N2Vwbjl6cE5RNXpHditlbENGNTZWb1pnSEFjeEZmZXMy?=
 =?utf-8?B?bjUxdWord0I2dkxBYmFtYTNtQ1lIRTlndnFiZTdISjdFTUJYL1NCNkV0SDEz?=
 =?utf-8?B?bUZZZVJvZkR3WVp4Ni9SQ3ZkbUFMcjlRWW5WWHRCM0RtOGN1Z0hUSWMwOHdO?=
 =?utf-8?B?RlJzYmZvOVFqOW1WeWFHZm44RnAxcElhVXFjZEVwK3p6c0tQZmY2WlBWeWds?=
 =?utf-8?Q?R9S8zdocEJV5SN3F1EP8wOCtEuJmBKCHywzqP+wxo1sAr?=
X-MS-Exchange-AntiSpam-MessageData-1: OIVugtY6QO4NzA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40afdc99-7daa-4454-2c70-08de5fda8c98
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:35:40.0733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWVcvTiJFSNid0ejDlGfV5TijfAVTryHEdz5Muh/Ms35Ad0H0Y5QMOTFt3D5I+t65L1j2x7BbYN9IJZ0u9hgkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9400
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch,collabora.com,arm.com,garyguo.net,protonmail.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SUBJECT_ENDS_EXCLAIM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5B572B874B
X-Rspamd-Action: no action

Remove unnecessary branch and unify branch order.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 rust/kernel/dma.rs | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 43ed0dfdbc08..03fc001eb983 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -875,9 +875,6 @@ macro_rules! try_dma_read {
             }
         })()
     }};
-    ($dma:ident [ $idx:expr ] $($field:tt)* ) => {
-        $crate::try_dma_read!($dma, $idx, $($field)*)
-    };
     ($($dma:ident).* [ $idx:expr ] $($field:tt)* ) => {
         $crate::try_dma_read!($($dma).*, $idx, $($field)*)
     };
@@ -905,13 +902,7 @@ macro_rules! try_dma_read {
 /// ```
 #[macro_export]
 macro_rules! try_dma_write {
-    ($dma:ident [ $idx:expr ] $($field:tt)*) => {{
-        $crate::try_dma_write!($dma, $idx, $($field)*)
-    }};
-    ($($dma:ident).* [ $idx:expr ] $($field:tt)* ) => {{
-        $crate::try_dma_write!($($dma).*, $idx, $($field)*)
-    }};
-    ($dma:expr, $idx: expr, = $val:expr) => {
+    ($dma:expr, $idx:expr, = $val:expr) => {
         (|| -> ::core::result::Result<_, $crate::error::Error> {
             let item = $crate::dma::CoherentAllocation::try_item_from_index(&$dma, $idx)?;
             // SAFETY: `try_item_from_index` ensures that `item` is always a valid item.
@@ -919,7 +910,7 @@ macro_rules! try_dma_write {
             ::core::result::Result::Ok(())
         })()
     };
-    ($dma:expr, $idx: expr, $(.$field:ident)* = $val:expr) => {
+    ($dma:expr, $idx:expr, $(.$field:ident)* = $val:expr) => {
         (|| -> ::core::result::Result<_, $crate::error::Error> {
             let item = $crate::dma::CoherentAllocation::try_item_from_index(&$dma, $idx)?;
             // SAFETY: `try_item_from_index` ensures that `item` is always a valid pointer
@@ -932,4 +923,7 @@ macro_rules! try_dma_write {
             ::core::result::Result::Ok(())
         })()
     };
+    ($($dma:ident).* [ $idx:expr ] $($field:tt)* ) => {{
+        $crate::try_dma_write!($($dma).*, $idx, $($field)*)
+    }};
 }

-- 
2.52.0

