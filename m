Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E39EAAE15A
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3659810E7DE;
	Wed,  7 May 2025 13:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c9y4arTI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A09E10E369;
 Wed,  7 May 2025 13:53:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXxg4hvV9pPf2wXnlMhkABCOY5tTpbTUXFNCGK9Gx8EgAPsodwflSBmbHkAnjGlaqJYBEg/QtoB1+cu8NzAtMfzPs2NGyBTZB+cwilbU8kYico3su7e4jPQAoH9f/HK+S0WQAVmWoktgKcs4Tn61BCJkrtoWRYs72PP+YUGD3Yxi278AYr+a3dG+KSUd2yeQboO1xmyeZXqT88aGl5hSXBiqbrqdYBhgI38nRq+eQFPT3cPnF40gyjdm8o5LGPdrPL5R2D6LNsWO0hf/4eJ98pyFDjpuK5YHTWqV+7vlCi6ETYMduox1cRyqRsNs5bs8ES5uJrW+UgmJYYrV9EI8UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLAS6IjsFBPjI/dL78R1Bxllo1Gu52UEaPOdhb7eHEs=;
 b=s/vlLuLU0lTVbzau1BgU1D/LOIpKcYZw0t97UIttHzIZ1Bp5Chv3zVKxKfVVeBZneNrGPARaFGS9sedJB2mtz8khSeusLXDaojniIp7iYTOCgDT1VzjeBYJs+xBZx6p9R0PXrwBa7TlGiPO3b4MbOnkwJ7/VeZ3oiR2rQuYM+2/+1TSx/SycqE7vp2fnrix5w9uzb3ebEfe3QLBagoh5B4JgREMfUw//i7PYqSA83EpA0leByioW76FGLeZMIfMJtTS8yLImJ9GJ+VPmIH5gOgrNkwGOOYQ9Esh9QHNJZVmIVKoFrvctQicDhAIh9nUfQZgSID6e5c9KKUZsZQWIkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLAS6IjsFBPjI/dL78R1Bxllo1Gu52UEaPOdhb7eHEs=;
 b=c9y4arTIjc44YBiB4f3XP8kxQOZV9U/M8g6MHM2IAwEyU7XRBlQXuIvvK5J/V87ylGUvmLhcd41rA5Idf/PfANV+wa0Z87ZJ6oPllxYFlwDh7NeMa/bayxOJKMyw1vx3IRhLMelgqxRcZmhCbm5PymLnt6WUna9lPiKgU0AOaTUsc1exChb6sO+FISKhpH98wCvMtBH6SfSIdoMXtAi3fumVK3bs4rFRRb96iMekH37O3kk8l8hLWOChPEL9/CwSwOE+NBwgtgMbBDSHYYP8cIFXi5eo59scYHdZNT9Xp2YsYPY7+jWQ4IkU0u1aSEv3GZVvkS5FV436Fbq8c/SQ2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 13:53:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:53:05 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 07 May 2025 22:52:34 +0900
Subject: [PATCH v3 07/19] gpu: nova-core: move Firmware to firmware module
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nova-frts-v3-7-fcb02749754d@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: OS0P286CA0110.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:169::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e30ca5-e828-41a1-d424-08dd8d6e7df5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEpYUGtubFdqWFg4VVlOWjZnREJIbTAyandoeXJnUGQyUmIxZU13bHNSU3A4?=
 =?utf-8?B?a2NZOGEyN1o1MDBQbTJHbmxqSmFEQmJoZGpETjl4M0ZMK29vZlBrWVlkL1hZ?=
 =?utf-8?B?M0UzWmtrdFZYcDluNUVvTVVQNWhNcVREclZiL3BDUGVzOTVxYXk3U09nRk8r?=
 =?utf-8?B?NU9DdlQ4Vlk5ZlpWajdCVGJPVmQ1U1orQ0EwUkpvUlVOR1M2SW1aUzU4OTVN?=
 =?utf-8?B?OFNKSWJVaDdRLzdSYjg3MWhWRlRFa3o3RW5SeC9RaUhyVE9HdHJyWm1iQzI3?=
 =?utf-8?B?NVRsVGxYU2xvOE5IcWdwVzQvM3FBNTE2VkY0NnVYWlliSEpjK3ZmdWlMella?=
 =?utf-8?B?NXROYjIzRXBqTHN3TEVXUW1GcVFoTXRucHErV0JtdkJPR0xQZmE2QlZZN0d6?=
 =?utf-8?B?cjJPMUJiUlpZTExtQStzbGdFYUpGWHEzQVVmTE9PQVl5bnlKYXlSSmJMRWRR?=
 =?utf-8?B?eHhGdFhKSWQ3WGs0NjVUYVFjemJOTDhPLzNjdFg2dU81MGZKODY4QTRxUGJj?=
 =?utf-8?B?RkdZV2tLNEJuczhqVGdITHY0V3NCNmUrMWtHUWVpbmlXN2l5Zy8wR3ZJbkhP?=
 =?utf-8?B?TFkwZVljcmUwNXBLTzJBa09vTW9IR1lMck1tc2c3U2RCNFlFWHdETDlWazhG?=
 =?utf-8?B?L0Zlc3ptbGFhQkFqQmZNamtOY1pkdk82QVE0U1MraGdhZkhPc25WeFhWT051?=
 =?utf-8?B?ZjhFeWtaUGFaZXQwV3RaMXR1Z3NQZ01FaDZxRXhML2JkVDBVZWlZTzRPcnM4?=
 =?utf-8?B?cGI3VmFPV1c1dEpoTEVaNThmNjZFS3cyck9OSmNmNkpZZWtCQTdrdTQwb3JY?=
 =?utf-8?B?dFB1cUhPZHJRMmxzbEtQaFRvVm53UzltM2wzYm1ET0FVWWI3Uzg5bnN2akRn?=
 =?utf-8?B?RlBUMXFKUW04QjFOZzV0WTc0UjZudEVMcGV3b01aVjFVZ1RpSmNmQlg3Umwz?=
 =?utf-8?B?alNHRXlEMFdpek9SejF2NjZTUENVUHFtR3VUMzZiRE1CcUk4aENOSThLQkhI?=
 =?utf-8?B?cGthekViM3Z3dlVZMTdrSmxYRU85SFduSlQrUFFDUTF6bkhJY0Y1ZCtRUHFa?=
 =?utf-8?B?OEgraEZWREplMkcwSXZCTWNIQWZsOWRteVVHZ3hDVE8zZENHNlhzNzlLbDc3?=
 =?utf-8?B?S25LWE56S2I2WXB2cjIwdHpnbGtBUEpyS3hXTjZtZ09tSmtxTEdQYTdlcU5y?=
 =?utf-8?B?UDBlbGNtNGdEVHpOZFZJSHRsOUFXSlp1VGpsMU1ldjY1ZCtkSm02bVg0bW1C?=
 =?utf-8?B?U3V3SllJaVM4QUIwdngyMXQ4OTVxN0twVnl4QlM1MHdQOHhSYkZjVjZCOXVN?=
 =?utf-8?B?OHF4MG4wcXM3OWN4MVgwK0VJUC9KNTVFd0ZBWnY3Mi8yOXg0dWdTR2tIVndI?=
 =?utf-8?B?enlwbm5ZZWZnRWxoVzNoMDNYdGhzVnBJZlg0REhQVXR6VHJLU3NxOVZqQlND?=
 =?utf-8?B?Z3lLMmQ0UldIL2JLZlBqUkVkdEhIa1E1bUVOdURKMGpha3pUMXYwQ21QNGJK?=
 =?utf-8?B?QUZGdGNtWGhBOHRUcjNyVm9KZTVRYWRFOE4wV3hKd0kyWDZoMlhwVVlpdk1E?=
 =?utf-8?B?MW1mN1hvMnFkVFhINEhUVEkyQVFvcjZsWVhHVkRqOVdVU0JIUXpCeFplR1ZQ?=
 =?utf-8?B?NldHTW9ic05sU2ZTOVh6UkQzaHI5YjNXSXF4Z0owQ1ZxVExCRi9DN2F1SXJH?=
 =?utf-8?B?YzVGMDJEUWxNSU5zcGxnQVRpcXoyaVB6TldGeERjSW9LakR3anI0a3k5Y1cw?=
 =?utf-8?B?SHNPcFpRQU5KUkhhOW5xMHQ5WWhkMWtScWtqTnRxQjk5QjJQQXNFb08xV0ZD?=
 =?utf-8?B?ODJYVmlNVVpvbVpiTzhnUFVrUnVUcEtjemtwcWFsTjEzYTZ0RFhxTU1pNWNj?=
 =?utf-8?B?MjRKbWd0RWw3MG9CZXhGeTVHMk55cTVXcVA5MEtSbjlMU2MvdmgrakhrQnRl?=
 =?utf-8?B?Q2djTHh3TmpQYjRRUHYvUWtTSHFTL0c2eU5neHVRaDcvVHROd3pHSGh3TGM5?=
 =?utf-8?B?a2xXNXdsZS93PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2lwOTFIeXYzOEd3VW5iOEVxczJRV0FZbno2V1VBNjdpaEZrMEpZbDFmWGlQ?=
 =?utf-8?B?ZkFxa0dNUE9aaW0wb1duRVUxRjM1MEhyQWY1bWttT0hEZWkyb1VNZk1PVmUw?=
 =?utf-8?B?azl5dXExQXFJazkrTDJqMzgrblkwMVpybE9NOG1BY0RLajFmamhKYzJZNUMx?=
 =?utf-8?B?NlR3SmZDdWl2MS9KZTY3T2o1TVZYb2MzeEozM2ZjZG1zTVpoWEMrRTBkQkZx?=
 =?utf-8?B?OThIT1ZWK1B4YmJVamkrKzc5TVJ4LzlhckoyblhxWjNaOGtjdms0STRZZkJp?=
 =?utf-8?B?WXJtT3BVTVFPSVcraEh5QlgyMUZycnVEN3o3NmZIeWdFaWI3NjZsdVluQTBq?=
 =?utf-8?B?Y0NUckg3dlg5bXJKMjBhTGRveXNWcEdSL0NwT3hhUVJHMmVVNzliQkNiWGNI?=
 =?utf-8?B?elpQU0hJRDVxU291UDNCUUV3NXZzZGF2WUd0aGJmQkN6ZGhtMGZHbi9Yc3RT?=
 =?utf-8?B?ZWV6QlNhOEo5UE5GMFpsQm1QTU1MZ3daZHZmaWdxYUlCazFnUlAxR1VSUERu?=
 =?utf-8?B?SE5BRm5OMlkrQ01WWXRKNzQyQWtJUWlBMzBmM1p2TkhqOVJwR0EvaU8vc1gz?=
 =?utf-8?B?RTJQWGdkVmRBc05Cak5mWnIwL2FLMFpONVk0b1VWb1M3U3dyUll3SGNMZm9i?=
 =?utf-8?B?VmJmYmhSYmhYckNNZlFMTnNiQlh3RWV1bVFOdGlqREtMNldoN2tpYnI1M28v?=
 =?utf-8?B?NVJqWU42L3piODFtcmJRd2RSSms4MUhtdHN5aTNqbnZacnV5ZmYwWGh6bTdK?=
 =?utf-8?B?UTFqbHMzN1l6MGI3aTNiN1ZQNkxJY01DYnZaVzdYVkYvQThHdVd3WXpxbWdh?=
 =?utf-8?B?YkczU056OFlaUzhzTzdnSHRtUEZEYjlOd0ZRV1pSd0x6Q0tQay84TnJkZTFV?=
 =?utf-8?B?bzd0ZTNTL0x0S0xZRzAvQTVIL2NNbHh5c2cremVhWDRZZXNFK3ozRFg3ZVdX?=
 =?utf-8?B?Z0Q3RlhoTGN4QWJnaXlNRkJvOGNyNkhxY0R0QTB1aTU4Zlg4ZVR1dDFaNTcr?=
 =?utf-8?B?SVhSdGQrblJrWW1IeVlFaHM2aFU4UkVvaG5wdnJtWHl5UE8rM1hkVWJZckFT?=
 =?utf-8?B?ZmwrQ1IvOXhuWEo0OXBWY0FKeTdwaWF5WkdKZDVLQ2xscGpvdGRiOWVOSjhh?=
 =?utf-8?B?YW42SWo4Qk4valB0aGpkT2hrZXdIWkM1OU0xTy9lMnNJaXFmYUZUZlJyeWxU?=
 =?utf-8?B?TmptaXVtckxYaXJONnhOWk5oVVZ2YkswWHJFV01lU3dEMVVWNXV1UW5CWWRZ?=
 =?utf-8?B?VWlGbEFYVkRVN0dDWUJWem13ZHMzUE1TSEVpeTl1RUVodGRCZGtKamU3Y0pY?=
 =?utf-8?B?RGVFdHZSUXkxd1RNaDRKRFliR1R1c0NNSGxuUEdKS25vem1kcGZ1QjRUb2k2?=
 =?utf-8?B?UFdxNGdJUzZNV3M5RFRzRlVzeVVpLzNteGFHMkZ5c3hidmlkTHVEenk2SEpn?=
 =?utf-8?B?Zk9ydW1qZERqZzZUbjY1UkRzdU1HTWtHWjI1V3RmUzJlR1pMdnd4a0Y4Mzh3?=
 =?utf-8?B?TDRFM203bnE3MkthNEM1Y0FvM2JaV2pxbERpcEdxZEhrRUNVd0QwNHlZbkpi?=
 =?utf-8?B?SzBlQ3ZqTloyWmF4Wk1rTXdwSnhqMDFZYmZsdW85M3VUTmpMaGUwelZiZXA5?=
 =?utf-8?B?NWRmbC9wdzBZVGZWV2JPaElaY2RJWGFHUHplWDhDUjcrL0l6b1dMUisvNGhE?=
 =?utf-8?B?STJzcjJoMUxSSWl0cm5SZ1JGNitTMVZOQXJUd2R6U3ZwRE10eW4rNG9IeUZN?=
 =?utf-8?B?Z1hyZS9TQnI0b1JOcmlhR3NqU0Q1RDNVMlgxTXZQT1pOY2htMk1ta0ZMSm1i?=
 =?utf-8?B?bm1Ja2N1Tyt0anlhNjc0M21nQ2pwVnhpUkVoU3ZRZUgrWHVBZFovcUV3UTYr?=
 =?utf-8?B?djNKODJ1dmdJV1lLN2YrUnZZdHE1VFQrSGdWZHNRWXY5UUkyTERxNnlrUEtk?=
 =?utf-8?B?TFcwWFZNNm85Znh6MllkYTRmbXAzUTZBWWlJVDhqV0p0VzBaYWFNREIzTTkx?=
 =?utf-8?B?NzIrdkR1RitoRUV2WHAyRFkvOVBLSE9iaVBDMWRkSDdtekFPSlJ1VEV0WC9S?=
 =?utf-8?B?ZWdNOW9ibzBITlVJWjgvcnhIRnJYVkVSRnpsdUV0cjBEc1FWQUxQbzlsRXFB?=
 =?utf-8?B?RkpzVzh3QmorOUk5eXppSURRSW0yMU1jRWkvWXhsTDZsZHdzUXBrY05ZWkVo?=
 =?utf-8?Q?rmbM0dPTKIb7lb5wz/KZPO1iqvCcmp/10w6ZnQ9KFIGN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e30ca5-e828-41a1-d424-08dd8d6e7df5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:53:05.6842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+VSug2ppJadQJCK6x6QNWq1njebF1M4oP5RfHM3/sw4X4KgDL5BS9s+cKmuSeO/URDaTkoREW7y7Im0lVgnyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761
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

We will extend the firmware methods, so move it to its own module
instead to keep gpu.rs focused.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 46 +++++++++++++++++++++++++++++++++++++--
 drivers/gpu/nova-core/gpu.rs      | 35 +++--------------------------
 2 files changed, 47 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 6e6361c59ca1ae9a52185e66e850ba1db93eb8ce..cb79d039948858e657c9a23a62ed27ff780ac169 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -1,12 +1,54 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use crate::gpu;
+//! Contains structures and functions dedicated to the parsing, building and patching of firmwares
+//! to be loaded into a given execution unit.
+
+use kernel::device;
 use kernel::firmware;
+use kernel::prelude::*;
+use kernel::str::CString;
+
+use crate::gpu;
+use crate::gpu::Chipset;
+
+pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
+
+/// Structure encapsulating the firmware blobs required for the GPU to operate.
+#[expect(dead_code)]
+pub(crate) struct Firmware {
+    pub booter_load: firmware::Firmware,
+    pub booter_unload: firmware::Firmware,
+    pub bootloader: firmware::Firmware,
+    pub gsp: firmware::Firmware,
+}
+
+impl Firmware {
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &str,
+    ) -> Result<Firmware> {
+        let mut chip_name = CString::try_from_fmt(fmt!("{}", chipset))?;
+        chip_name.make_ascii_lowercase();
+
+        let request = |name_| {
+            CString::try_from_fmt(fmt!("nvidia/{}/gsp/{}-{}.bin", &*chip_name, name_, ver))
+                .and_then(|path| firmware::Firmware::request(&path, dev))
+        };
+
+        Ok(Firmware {
+            booter_load: request("booter_load")?,
+            booter_unload: request("booter_unload")?,
+            bootloader: request("bootloader")?,
+            gsp: request("gsp")?,
+        })
+    }
+}
 
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {
-    const VERSION: &'static str = "535.113.01";
+    const VERSION: &'static str = FIRMWARE_VERSION;
 
     const fn make_entry_file(self, chipset: &str, fw: &str) -> Self {
         ModInfoBuilder(
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 29db6726a1f5196bd2d1778117313c987ccf343b..9c6a9270ffa374bd386af352f6ad9b857f9c5f8d 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,10 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{
-    device, devres::Devres, error::code::*, firmware, fmt, pci, prelude::*, str::CString,
-};
+use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
 
 use crate::driver::Bar0;
+use crate::firmware::Firmware;
 use crate::regs;
 use crate::util;
 use core::fmt;
@@ -157,34 +156,6 @@ fn new(bar: &Bar0) -> Result<Spec> {
     }
 }
 
-/// Structure encapsulating the firmware blobs required for the GPU to operate.
-#[expect(dead_code)]
-pub(crate) struct Firmware {
-    booter_load: firmware::Firmware,
-    booter_unload: firmware::Firmware,
-    bootloader: firmware::Firmware,
-    gsp: firmware::Firmware,
-}
-
-impl Firmware {
-    fn new(dev: &device::Device, spec: &Spec, ver: &str) -> Result<Firmware> {
-        let mut chip_name = CString::try_from_fmt(fmt!("{}", spec.chipset))?;
-        chip_name.make_ascii_lowercase();
-
-        let request = |name_| {
-            CString::try_from_fmt(fmt!("nvidia/{}/gsp/{}-{}.bin", &*chip_name, name_, ver))
-                .and_then(|path| firmware::Firmware::request(&path, dev))
-        };
-
-        Ok(Firmware {
-            booter_load: request("booter_load")?,
-            booter_unload: request("booter_unload")?,
-            bootloader: request("bootloader")?,
-            gsp: request("gsp")?,
-        })
-    }
-}
-
 /// Structure holding the resources required to operate the GPU.
 #[pin_data]
 pub(crate) struct Gpu {
@@ -201,7 +172,7 @@ pub(crate) fn new(
     ) -> Result<impl PinInit<Self>> {
         let bar = devres_bar.access(pdev.as_ref())?;
         let spec = Spec::new(bar)?;
-        let fw = Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
+        let fw = Firmware::new(pdev.as_ref(), spec.chipset, "535.113.01")?;
 
         dev_info!(
             pdev.as_ref(),

-- 
2.49.0

