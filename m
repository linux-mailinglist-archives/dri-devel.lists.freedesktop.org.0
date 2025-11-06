Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B34C38E62
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 03:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91BE10E7F2;
	Thu,  6 Nov 2025 02:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z8WweTmX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013052.outbound.protection.outlook.com
 [40.93.196.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD5E10E7F5;
 Thu,  6 Nov 2025 02:41:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wG1EgAxMe1aZUCj9ueikG1XWc1Ny8kw9UzrTA9EJKwGrn8lRBFDmq0ZApRo9a1i4wOMYG02qRis6SVd/gEqpRzpP+B5gvH24FBrpA9QxIsaS/kYv3ySW8wyOt7pzsiih6BLKZ47zHZ5IWRSU97CDN7sla81Va5b7La9KHPaRVMo2/aIBPEgDFdM8gOr7h09f+WRijp1czis3B/nfiCTcUQHNrzJpGJOkqyJZY+kqd+Ptg1NLM7zZtv16ZjVBz7YiForcEhZt8LXoRCwu4O6+UdCgi0rp9TNUSVFMpwmRr8plh7WAnmo4fww9BgkX1Q6+sFBT0CMvLyd0feIo+p9FPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgpTM4UUJG9Mo1/w7ZqOqGqIm+b+j/aIs5b7qof7XUc=;
 b=LVCBiJqG2CiDt5u09m/9iVknO/vkYdR2k7B7lIp2r7W/NWmbZdvf8/rZKbm+sw2b4o2e8YXGtRkXeoPDcjrgww/2qNHgnCojGxqo7M6bur5toD4g+wRonKaGcNXqvASxBdhZ1QFI4ia7yD7B7PyON6NxTktY24Es5nvzf1YizuwRJR7BKNw33lmKRcY/ozlL66msrxo0NYK8i7lpSnUyYXhRFOXZCtnduCs8yFIVlTUq2E+JgkiWqalO/yfDEgkT7767h0+FfBb9BaJpBjML+t0R6SUjbYJCzTOGdOj2FqB9VZnhRxooWHzObecWmcHCPrUxu2SLEyxtL2LDeg84SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgpTM4UUJG9Mo1/w7ZqOqGqIm+b+j/aIs5b7qof7XUc=;
 b=Z8WweTmXbHeGgP/ZCh3xGSdJMDv6ztFecEvxMMyKkxmsY2RQkp4i5jWY9dQ8gn0DVi7aClBeTQUNsLsAlNj/B4nDHrrXxZ06kBr3BjHyPNgdA5wwqWxptxWEgY/YGsUupv8lNjz4DirLmgar4gke2cF4pp16X/pRf4NSEtF0cAfzMwaiCZ3PIhVZ+cfeQ6Tvt5KhIKhbmZR+BzwIQFiF1X0eyU/ergPnF3KqdLfiAe9v2PjxnAHZDVC0NtC4q4Oe0JAfvtI5ckMxMWSrBp6Zm9MIJn+KC7W/7/Nu9ZM/8UNtM1jxn4clbn+ARq5q3IMZ/eE8frPeUkzOGWXug6a0Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8330.namprd12.prod.outlook.com (2603:10b6:610:12c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 02:41:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 02:41:11 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 06 Nov 2025 11:40:56 +0900
Subject: [PATCH v3 3/3] net: phy: select RUST_FW_LOADER_ABSTRACTIONS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-select-rust-fw-v3-3-771172257755@nvidia.com>
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
X-ClientProxiedBy: TY4PR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ca58f4-51e2-468a-fb4a-08de1cddf275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|10070799003|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWszRXZveWpRL1YrcHhER0hCMDVMTnFGQldlUWEvTDAyd3Q5YVdrbkw4Nm9J?=
 =?utf-8?B?bjB6YXZIWG9lMXNXUTZ5aXFubjlLbXB6bXMzYkxSOHJqeVFmNVRuQytOL3Zx?=
 =?utf-8?B?a3htUTMwMzZTTXZjbzlVUTZJamw4RjVpcUNtMTkvMVFqV3BySkZUckttYlVa?=
 =?utf-8?B?aDlObzdPTUpVdkJWbVB3ZFZpL2V2K05CY3FCQVZkMUtIMlVaNmpPemFHWXll?=
 =?utf-8?B?VGJmcC9Dak1IYmlvTlFsbGFubnc3TlpVQ3JXZkIrckpzNVltU3V3aEtMK3V2?=
 =?utf-8?B?dkZFdU9TMHl0QU01eDlhd1l6U3RTRnRKckU1dFBBS1F4UU9pSDFMSHdob0Jn?=
 =?utf-8?B?LzJNblhObmc1RUczYVpQYnhYOEIwWTJQK3ZiL0JoWUg4ZkN5Y0tDLzhEeEx2?=
 =?utf-8?B?aGhkUkRZSlNMcEtFZSt4UlllZFRiY1FXU1VoSGx5NFFBbjBmWGc4b21vbkdm?=
 =?utf-8?B?dzlXc0hYWUtCQ09XK3UrNUdWSlpLK2hyQUhGcm1uUit5M3ovSEtJRmh4YWkx?=
 =?utf-8?B?T2h0VEtEaklxSnZqMVV0WnA0TTlnak9ucjlPYTlQQnFJUHNwRG9GTTA5ZW03?=
 =?utf-8?B?NUJSbWhLRXBiWHE3WjhHZFZiRTE2bzJOWXYvWE9aSzd6UmY5Q3FMTFdXSGQz?=
 =?utf-8?B?cEJtbkw1TWpwRlQwS0FjNWorRzA5Z01DWW45Ym9FMktYVkhlb0FDYytleFpr?=
 =?utf-8?B?UjAraEIrVm9GREJrNmJwRXJSbjVkWG4rYUxHT3JIQng1SGVFbVNZQk1aUW83?=
 =?utf-8?B?UmNTWnhrbjlLQjNVbjhYZTFpRHl2Z3I2T3JpMFZGeklFWVd3eHhWWm91SW9K?=
 =?utf-8?B?cFhKT2RaRVAxbG8vTzgxVWZoczlFSG1LdlM3R1hrWUc2M1IzS1UySDBDMUV2?=
 =?utf-8?B?cXR2RTNjb1RhN1pIaFQ5b3VYM2xtcm1INEljWndPL1hyR1ZiUVI5eDNHMGRH?=
 =?utf-8?B?eEMvVHlpMGgzNlMxTTNKTEpZU3NqNlp1em4vaEprS3g3UlBkenFjMUtUWGxK?=
 =?utf-8?B?dUp5MVJJRDJBZjNCakFsMVUyY2dGeG1mbVZ0Vmd5MmJpOUtXaE1jZEwxY0Z5?=
 =?utf-8?B?TG5TYW1GQTJ1M05SSVZRdWpwdTlBcmxFdGREMjhxa1VvT1h0d1ZNWFNYNHdj?=
 =?utf-8?B?SlN0NWpPWnFBd0ZWTzNRdlhPTVJnOFRkdW1nZ2JaeEZVclNHNk9ITUM5eUlL?=
 =?utf-8?B?OFpLbjM1c2h3VUkwYXh4WUM4bjZGVGpyYjFuK3NJcHdEZjBkRTVBM0RibzdT?=
 =?utf-8?B?MFBGWFJIYStmWmxNMTc1ckdDaStReEROS1RXaUZaa1lCeVZsYUxZOUpjNFMr?=
 =?utf-8?B?UitFTnlWRytjRGlPOStIWG1WL0ZLQTZjSjllMm9KVXBKOExyOEZORERpd2xz?=
 =?utf-8?B?ck84VE9CQjZycVRQbi9YMU1qTmdEWTh3TTRaNjloSWhBdjcxSlNZaDZUK0dz?=
 =?utf-8?B?c0IrODJ0aTd2cXoxUXdiMnpOY0Jna1hsTy9jVnNDWWJMWEtLR2tCUzd1NGVl?=
 =?utf-8?B?TkNURDNYaHdTLzlVMS90K0FVTFdlYjFkNWNaQWdXVUZUUTU4TVpCdk9pNXdD?=
 =?utf-8?B?WFJEZ0NLSFBjVDJEbExlR1FSUEx4SlRQam1yQUxBcG5FRE55SHhyR1poaFp6?=
 =?utf-8?B?VkdRQU9VcDcwemNReUpreUV6dDlRK0QvN2FITCtmWE1DMjV3RVFtTXlFM1hQ?=
 =?utf-8?B?TW1zTW4zNjlvOWMrNHdwemlXR3RHVmZxRXR4bnRNeGJLTnladmVrMmZ0eTk3?=
 =?utf-8?B?VDA4NXBwUGpMcHhyYlVJSlFwakZ3WFZFZHJpZENNeG11UEdkaUZDTDBuZG8y?=
 =?utf-8?B?TjB1OVBxRjNPK2FpY2ZTT2JZRHRzSHVRRXArQk9nSS9kWmtLMEFkSjRmSFJQ?=
 =?utf-8?B?ejdkU2RBTXFHb2N5aXh6OEN5RlVDbDE4NlNEa1FVeDM0Y2RQSk5maWI2UHNF?=
 =?utf-8?B?Ty9kcmNyWk02cTlYVXFHS0RWaGpUeGIwWjd5SzdZYm5UUTRPa2tpS25WMHBn?=
 =?utf-8?Q?F1bYNNIVYuCYKhhdgmjyVKO52YTCZ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkZoUFh1b1lZSkNHUnh4MmpnRk1aL3Ewa2Myd0dRL3h4bjhVSVkxa09PaDFV?=
 =?utf-8?B?Y3UvU3JjdnF0czIrWXYzQTR6andDNjNON0w1RUttRmdFTVNkckRHU012ajgr?=
 =?utf-8?B?VXhNUlZZU0hKZHlITm56MFZOb1dUVDdrZnFMeVdUNTBQOU9ReDErQkdxWkQz?=
 =?utf-8?B?Y1ZWaVpHRHZIRHFNSllDVXFpUFVvdVIxZjdhSDBIV0ZQZmJ3dHVjT2lKUzV2?=
 =?utf-8?B?dHprMVVTUjNGMkhOaElLNWgrZk10OHloT3hUWlF1cmU2bzZzUHNpUGJFTEZU?=
 =?utf-8?B?czE5bHJuL0Z5MEhXb2VWZVI2TlNPRHNncGFiK2N1b3h0ZHA4SXB1akRlYW5O?=
 =?utf-8?B?ZmNhdWkvMFVLNGwrcHh0M0VsY25UdGNOMnYvTzF1UGpFVjJnRlhwUVd1QnlU?=
 =?utf-8?B?UmtlYngrNDZEQ3k0OFBVVFJ4dGpBam5HUDkvUnR5NGhEUmJtZDVrN0FHN2Fi?=
 =?utf-8?B?azJ1UnB0YU1FS01hZXZReXFvKzROMmMwNVlhbytqOUhLODZtVlNjZkpvTVUr?=
 =?utf-8?B?VTBMVlVLNDFzU21FWmdobFBYL0NzSjdLY2lGeHFUSjhBbkNOVkZhMVNNYmUz?=
 =?utf-8?B?cXJZNHJ6bE5WYW1Ub3hlM2hkMVJRUUpoQ0hNb2lLNzIyMGVxRVEwVlpTRUIx?=
 =?utf-8?B?NXFoQnE2dXlVeGRyTTkraVV2UThQMk9DRlFRUGJFazRNYUZSQTA4bXB1MVBM?=
 =?utf-8?B?WlpReWFmRHNObWxsMUNhNldVaE1iL0NGSXN2dnVvdFNuNjlDNi9QS2NYSlJj?=
 =?utf-8?B?NWZmUzFpWUJMOERqa0ZyR2lIMFpBcnl2WWxSdFc5WTc0WXQyL1Q4VjVldyt2?=
 =?utf-8?B?blNHUFZVeHY3Q2FZWlVPS2dFbXBHQkRlTXhBdloyd01NQlR4aUJsMHBoUGVK?=
 =?utf-8?B?TUNvb1RpLzA5MUNEcnRIQ2MrZmsxbE9JTGF5UUhnNUhiOG9KTk1wUDF2R0U2?=
 =?utf-8?B?bUtKYlMzb2xGelJMREh4OTBIRnpzRHl2UkxlWjk2dXNUMWtBOFh2UUJiY1Jh?=
 =?utf-8?B?TTJrNWxDL01wbVVaWnhjcFFyYld1VHRtc3dGZ2tPZzlNWmI1QmpjQzRVMGla?=
 =?utf-8?B?QzJtSEtrR2kxOTRjMmhMMWpVbThiMGZnMUFXeGFpUjdUeCtaelM4SEFiQ2R4?=
 =?utf-8?B?SUoxY2J0aTlEOW5VVi8zUlg0VUNac3VaRzBMU2V1YkdueFA5U2NiZmYwYmd0?=
 =?utf-8?B?bHczT1VGa2RSVUpiRDRROUx5V1BUeEcrK1Fmcm0veFpJZTBXT1d1bktMVVlu?=
 =?utf-8?B?MFlORE10bDlRU0M4RXFyakg2dnFCd1AxYXZPQTZta0R0UERnMXVRVU5rRTh6?=
 =?utf-8?B?cXdDbjRuK1JENXErKzVpSFhtN0tCanhKUlBPT2QzRk1hYlRRcm9pWGtCcG1W?=
 =?utf-8?B?MWJKREpHcG13dTN5OGVzOG1saXlmQVdGanY2M0ZjRWY4c2tNNmV5Zm1Ja0VG?=
 =?utf-8?B?N0hhWWhtYmU3WDZpYjhKWmdDY2JqSzdkWVphalptUFpJR0hCc0VFdENEckhv?=
 =?utf-8?B?UU5rNFF6WjE3VTRVTWxaamlLM3drdVAwRUJoRWF1U1pOVjdIWVlEUWlkVGsv?=
 =?utf-8?B?dnkrV3c1WnFiVGxNcU9BTC9KaTRpeWJVTWhhVUwydDFlQnNsdk1GdjI2b3lI?=
 =?utf-8?B?VDNzVnRlZ043YTJIOVpvOFBWUytkVzhjT3k0UzhRK2dtKzdwTjF0ZHNLdzlx?=
 =?utf-8?B?ZWtPZGN0dVZzeWhLR1ovRjFRK2duQkozbzFLbHZDNXRlaFRLc1FHOEFqMVVV?=
 =?utf-8?B?ZXhZclRzMDFXTTdtVVd3ZzFQR21wWTZwdU5acGR6WHJEVG5qTUc3bUw4eFJT?=
 =?utf-8?B?V1RxWG5ZRW9VbnBrL2NTd2lpKy8wbTIzRU83WllsVUZSamk0b0tPd1RKT3lB?=
 =?utf-8?B?em8zcncyMUlBcHBiVmhpYXVLQVNnSXVacndkeGlMcjNrTWtDZWoyVm91UlhZ?=
 =?utf-8?B?djBtT2pNaWJST2RQOW9DRFJLWm8rM3BUalNPd0pnTllzOUJjSkxYaFlNdnNm?=
 =?utf-8?B?VmtBeUg0bTRBY1V3QlRLR2lRaXJ1VzcrSFZNbW9iMlpRTFpiVWNhTjgyWVI2?=
 =?utf-8?B?M3NJeWx0Z0c0SGRXajFvbUhHOFg2RjBRLzNyZEJLZlpxdHI0ZzNpd0N6Z0Vj?=
 =?utf-8?B?UWF2Tm1wdFlUc1hmNWlWNDZ3dkpxcjg1SGRWdHJ2RmVsMko3NXdqL2ZjaTVp?=
 =?utf-8?Q?ColBxerLh2ysX5d6nykzb5bVbSmEsHwNZ6YdbzXS8qSP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ca58f4-51e2-468a-fb4a-08de1cddf275
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 02:41:11.7027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5XBAbuoX1EfzSDr2JVeV4ewrlRIWYu5QRh0aCp6X2+bTIVLrsYiEQlEE9mLPBQa0jBGjMnug9C9iroaqBtSzA==
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

The use of firmware_loader is an implementations detail of the driver,
so it should be enabled along with it. The non-Rust option FW_LOADER is
typically selected rather than depended on, let's make the Rust
abstraction behave the same.

Fixes: fd3eaad826da ("net: phy: add Applied Micro QT2025 PHY driver")
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/net/phy/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 98700d069191..d4987fc6b26c 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -132,7 +132,7 @@ config ADIN1100_PHY
 config AMCC_QT2025_PHY
 	tristate "AMCC QT2025 PHY"
 	depends on RUST_PHYLIB_ABSTRACTIONS
-	depends on RUST_FW_LOADER_ABSTRACTIONS
+	select RUST_FW_LOADER_ABSTRACTIONS
 	help
 	  Adds support for the Applied Micro Circuits Corporation QT2025 PHY.
 

-- 
2.51.2

