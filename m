Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2C8C38E50
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 03:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0D210E7EE;
	Thu,  6 Nov 2025 02:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="g4NQMzEy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013034.outbound.protection.outlook.com
 [40.93.201.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A788310E7EC;
 Thu,  6 Nov 2025 02:41:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPwgBmt9Z6xbBumy3Jg8nZ4sTg9cAUb/Qwh6Sv54W9XqFlVhZv7/hhTFcjF67oHA+Yj9xQBrg7DAcO9oQ3pU1fGCiN9LDYCZXTtTEBSz7gJnEaYnN6wx3kf4XGddXM7vcJZsuILw0KpOTdPm9QBX4DiubjC9dTRzlu+8Z9dyWsQnuGURSjTtAyGUxxWMP4V2E1IlGXQk7vTpmRtpT2kFhwoatV1ds1VNyls1mUJvx3JMfWp5FDAio1RLytbIt1ksmD+KRYazKONsU6kk8vPuqEKw80jKBeMo9juyqRxKm+6vVCCHWzMkJpNal40YeFteAJ3hN3tIqf1aOnsTgHhgeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZLsaGD4E69ZTswx2qTdKcwY8JL0bkcPr6YHWaDvvh4=;
 b=ZOhJaeEB3sAcJYClSJDlOUfvksaQn/My4t3WWsU6SEnC7pWZyocV/iqTkdgxXItjqnlQsZV91rf3mjKzf8cMszxsvSDbW+V1NvNTrZF7LLF1cNXVwUgIb4m5NXzviDLgKqHszhaSL7iUY+kzMdxq083IdD2wsw2MHeprDHYEXhXdqedWiUXkQBIVwWBKs7x0Ac0HTc3eckaQ3UXT5URM1C6Z7KV22Pz6Pj4r4VohlA86wQgpZUCS3kXkt7fyPaZBWTe9TJUuJZBgb391mPxocAYAGKOOl5T1v2GTLTEnTsUsjvKyFMs3HVCytMPuQeRq4joNMFkdqOaad7BwiVg4wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZLsaGD4E69ZTswx2qTdKcwY8JL0bkcPr6YHWaDvvh4=;
 b=g4NQMzEykeJ2gFqfnaFLSITrlK87d4QkMvA6J2Vv+muOAUs5BDw93Teu1951/gFRpNUM7kAuadwdbQLYr7vXJfrhFv6XWkGws3/NzLXySGS+keDNnYMU3KsGcR9w95l04P2jkPoJhywkQe2ptQ+lHerPnLmz4LL/mKZJWw9OKtogM+SE0P4vgd2uIWbW1czM8J1lFPIyUVIWyd3+h+UvMFexMo/eEqR9/e7zqEkDwSE88QjR9xt1CRM8wTHvoBXKU+QJ9tGJDzHedQeNJr4hs4cF4XbwcoehIAflaMr1bJDpfoKgUnQtbWegakqwwujtwbYsichHmaHkzlbj7Sfkvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8330.namprd12.prod.outlook.com (2603:10b6:610:12c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 02:41:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 02:41:00 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 0/3] firmware_loader: make RUST_FW_LOADER_ABSTRACTIONS
 select FW_LOADER
Date: Thu, 06 Nov 2025 11:40:53 +0900
Message-Id: <20251106-b4-select-rust-fw-v3-0-771172257755@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALUKDGkC/33NTQ6CMBCG4auQrh3DlBaDK+9hXPRnkEkUTItVQ
 7i7hZUmxuX7JfPMJCIFpij2xSQCJY489DmqTSFcZ/ozAfvcQpZSI5YKrIJIF3IjhHscoX2AIYu
 kauuIGpHvboFafq7m8ZS74zgO4bW+SLis/7SEgGBaMrjT3hopD31iz2brhqtYuCQ/Cf2LkFAC6
 to3JSrylf0i5nl+A1D0xET2AAAA
X-Change-ID: 20251104-b4-select-rust-fw-aeb1e46bcee9
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
X-ClientProxiedBy: TYCP286CA0063.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: ea650dbd-d367-46f3-86fc-08de1cddebe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|10070799003|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTVuM25KWktBSDVrc1ozWVN4MWlpNXBnd2ZSVUYzSnVmZCtBUGJISnFpc2lM?=
 =?utf-8?B?UzhDanlIV0ZsSW9IRUlMRmhac3htZDNoaUlXUzRKVlpNeW5YTGRneVhMN3I0?=
 =?utf-8?B?UWxwZGNJOXdWZE1GQXlTTCtBQVl3ZjdnUDhqWmYzeitqa2gxV3ZwMTc4dnVI?=
 =?utf-8?B?SGI2VEd2dVMvSW5MbDF6dG0yMXgwVm10VVpHeG9tS2lUY0tTV0NJOGhLRXg2?=
 =?utf-8?B?WHY5a0Y1eFZCM3lBVGVhL0FqeHNYbzJTM1dkWkFZdGo2d0J3S2V1c3VjQ0cx?=
 =?utf-8?B?aUU1YU5xUlYvWDFoT0p4SEhuTmdSeVZJVmkwc3B0Y1NLbjZveDFZRlBxaElN?=
 =?utf-8?B?dUpIcWJydHNReDZsZXBJQTdjaHJmcHF6OURxY0VVTy9KMFNabVpieDd5V2ty?=
 =?utf-8?B?aWFGK3FvREd1V2I0VzFmaUhDblFQbldXYzF3VFFzZTRPeG1ITjkzSEpneW95?=
 =?utf-8?B?K2lxZ1RwQzZpZERhN3M5TkdmWWVkS2hIVTcwcVExYTdjTlY4UC8yb2x3K0lW?=
 =?utf-8?B?dUJ2UFRSWE1saHRBVHFhT1piNVhQVnV0amhodTZSRmhpVC9pN1NSU1FEL0E0?=
 =?utf-8?B?aVF0ci9xT1VYTVBxMmN3NmM3QU91WnBNcGU0ckxZRDBHL1lBVXBLazdGOTND?=
 =?utf-8?B?SkN4OCthR2FIQ2Ryc0NjOWJXYjlBQ2tKWEk2NXMxSmZXWVQ1Z0VwYTZ0VlI2?=
 =?utf-8?B?cHZpaWFlZFdNbFY5OVRabmlPNHVKQTRnUzdHbDRjbytESm5CYmdKK3V6dWtz?=
 =?utf-8?B?d1NaOVh3dnRaK292UmdBRGkzRWhQWjlVMXNTdTJsMVJIUUFpR0xCbW9tOGtt?=
 =?utf-8?B?ZUcxUlQzVU5uS2wwSWowdmxvaWl3bmJLOVF1TDI1RCsrNlZzWjR2dXV3aE92?=
 =?utf-8?B?ZFJodnlRKzFlbW1OR0ZhQXBNbGNXS1lQVVB1MG1RZmVqMHRadlh0ZkNBK21s?=
 =?utf-8?B?N3g2K0FrTUdTZjhBQjhFa3l5QzBudjdxUjVRRXhQeE1JRm5qSFNZakV6ZnE2?=
 =?utf-8?B?d3ZOaHgxd3hNcFdzV0VPWUJRL1ZlUWZXTG0wMmNhcXJqMy81VlBNaExjQTZr?=
 =?utf-8?B?Y2V5QWlrSFhKUXJKR21aMnFZakFuK2JZVWNYYkllVHVRYzQ4RW05TU1HZkNP?=
 =?utf-8?B?dWZPL29NL0l1cUhDWnljVVhWT09HM1g3NDI1M2VkQjZOTS9KMmZnT1RleFlP?=
 =?utf-8?B?VXZONFc3N3R6RXdiaHJja0svSlZnc210Rkc2OGo4VVFzT3BJVVZ3WDJIZkVl?=
 =?utf-8?B?TjNLSFozSlVGNks0V2xLa1dDYXEvdzZSQVFkSjBqTHhKc3lKNzNiMFBDQ0ho?=
 =?utf-8?B?M2FjbGduVkdZWHZ2ZTg5bloxTUdtVkR6ZHp3NlUyNlo5ODlSc2lIM0VTMDFs?=
 =?utf-8?B?Q1p6Z3hQWFE5R1pYY3J0Um5BZG42NEJaU0FYNVlwTTZaRWlMaW5PRUlmcjdM?=
 =?utf-8?B?cHdKVlB3Mlg5Y21MR1FUclRFdVlkTlBtajZ4Sk41N2JMUTg2bEJtUzQ5Nm80?=
 =?utf-8?B?VUpRenVoc2MrRC96a2hoM3pQem5ZUUp6bFNUMkprQnZQd21qM2pNT3lmdUN3?=
 =?utf-8?B?Tm5sbHhHdHJGV3RQS1M2TC9EaVkrdmVsVms5enI0eHJpbGllaXA2R0dHcVZi?=
 =?utf-8?B?bm1veDVQNVJNSE9IUXJXTkJzellkMERGV2k0QmdiZDBHM0NINndyTzBCZ0xk?=
 =?utf-8?B?d0d5Z0o3TktYVEFNM0NOY2ZWS2VyTmM5QkZhNjBKWE9ob0c1cUYveWxwOHI5?=
 =?utf-8?B?VzlDWDlhWi9GZ284dzlnL1doZSswdmx4bjdWeGgva3VyTGJYT0dqQ21wdVM3?=
 =?utf-8?B?amZpL3ZJZkg1NENFanl0YVZlQklDVDBHMkMzVERweTZKbFRDMmRaSmdlRnlL?=
 =?utf-8?B?MHF3NzJ0SUdvL1dVZWxiM2swWTBJM3dYZnd1SWViMlNRWFdHS2hJQlUydzVr?=
 =?utf-8?B?L1NSUlNEczN1bW5hUStwUzcwNE1iRFBqbXZteWtpUWU0WXMzSWIvNU1vSE5z?=
 =?utf-8?B?bWtRYUs1U25vQmdGM1o2Ym5iUGd6QzQ4Lzd3aE1ZdEtwbUJtUGlINzRDRGxs?=
 =?utf-8?Q?3+1/YY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU41ODBxTEp0ZUd3N3FLY2taaTlGM3o0USs0aWlyTDVFL1pZRnM1dnJMMytN?=
 =?utf-8?B?UnRubElqalBDUytzUzhVdGJ1bnFabjNINTBxRTFJZmZUa05jT1JrZ2Ewd1cr?=
 =?utf-8?B?azZKeHlRRVVBWVBJWEd3NU41OXgrMG1zczJ2bmkvRDJoclJSTmNVT21NK0JE?=
 =?utf-8?B?a2lhaTNXaG9ycnNzQUhPREljZk1Lc2dEN3JJWmY2TCtNUzJEdTEyeHRVRGpQ?=
 =?utf-8?B?THBwbXBZcVpPZnRzeStIM0NybDlGY0Zldk1RNDJjVklBWkE5eVE3c0tlMUFw?=
 =?utf-8?B?ellqdGY5WWRSTEp6Vk9mVnRYWnAyMTBVbkVyeGU2Q3NPMU9MTzBKMGVwd1M0?=
 =?utf-8?B?c1NJNHJ2TDZLa0ppbU1lNWFyWnhubU13c0U0MHkxTUVINXRyLzV5blRvV3Nq?=
 =?utf-8?B?SXJjRGl6Q3lCRzlBSE9lY1c3Qk91b091VlJENWk4T3VudjNaWEQzQnF0T1Jz?=
 =?utf-8?B?TVVMRCsxQVYyejJWSGJvK0tGbU9KZm56dnZVUmNNOGFaZkhaZnRxeXdDamFF?=
 =?utf-8?B?OW1HTktiRnJBZDhhUUxCNjBlNWlRRE1tZnRrMmRITklBaHpFVG1TTnhtd3F1?=
 =?utf-8?B?Q3o5MWxMQlg0Tjk2Q2EzSlh5WGsxd3ZaSHdaOG13WVNPZmtXQkVkczlTOGpH?=
 =?utf-8?B?cmxyNzFwYy9sb2tscjV0R3BjWXJFbzdLZUtTWENYS3Y3RURRdzlCV2xHZlNJ?=
 =?utf-8?B?TlB3RG5QTnNLc3JFb2lBejJhZEYremJvK3FRcEYvUXBrTHZDMnl5YTRkckpq?=
 =?utf-8?B?a2MyOXgyWmFJd0lpRHAzUFZEU2tUWDdWdnczUTJ6RHFMOUQ2NTFEVmkzck1M?=
 =?utf-8?B?eFRvR0ZmRWsrVU5ybi81bktST2tmR1hFOThyeVFuZFhPMUdMVXMrT2F4N2h6?=
 =?utf-8?B?NkFoYTV2WFc3TWM5a0QrZHRxVHJ3dE5iUWdFMVdXbWJ1R1dGWWtpUXpvOW4y?=
 =?utf-8?B?KzdTdFg1K2U3OGVrQmc4RG42SWdNbHg1TUJqbjQ4TTNjU0dvRHFjbzRreWpo?=
 =?utf-8?B?L0pOTHVUc2JJcGR5Yjh1OCtSbWtJaW1VNEE2aTFib2w1WFFmanh2U3NuTmdh?=
 =?utf-8?B?N3FZM2RqZk4wRlM1UnVDVFl3dGJtcVQzREp2UGNSbTVOa3IxT21FLzhWekJi?=
 =?utf-8?B?b3ZpZ1VoOVBtYkM0RkZJSUVIYTNHMUxhUjRSNCt0d3I2NGpGRW1ZNlFmR2pW?=
 =?utf-8?B?WitQbDRnRTNPK08zbzdKblVKaHlPdXdDbTZKUzhFQTdkODAwWVpkZFBhV1Zh?=
 =?utf-8?B?S1ZjVk1wdE9SZDhRT3RQLzdLY0FaNHNDamtlMUcyS0UzU0x3cWpqMnQzQXlN?=
 =?utf-8?B?ZlhUZE5nWldSUTBmMzVzd0hLVVVpWWFoaFEyUG1waGo4aVZ3OTFhMnZ1NVBQ?=
 =?utf-8?B?ZW9CekRMSWZGZzRsdzQ4RVNVQjIyTXkxK1REOTlZTDdwcStmMDZESkREdEdv?=
 =?utf-8?B?YnJFczYwZFoybG05OWhNOTBhK3BDd2dqcXhGYjVCRnNFWDJOS21rVmlWU1lP?=
 =?utf-8?B?R0srd2l3M3FKUDVoL0VOQU51VDhjdExoOHpFUTZ4REluWTFBQ0hOdDA4c1k1?=
 =?utf-8?B?Skg3RFkvdTEyRDRPZlUvQ2RQbi9vbWlkRjJ3dWFscFR0Y0lQT3ltbnhjUC8x?=
 =?utf-8?B?Q0dWZmVtVWI3MlU3aER6S09ObWt2R3l6RHJOZCtEeVgzZ296bjRpNXp6Y1p4?=
 =?utf-8?B?WTZXZVpkSytFMWhNbHo1YWNwUjZmUE9ycWdHaExHbWxOVFVXcXM3RytLdy9a?=
 =?utf-8?B?bTMyNWdFcFJ3enVBdUR5VjQ2aVMxRlByOWQ0UlpTYlc2NlI2MlVtOCs4aGZK?=
 =?utf-8?B?RDVSMHo5eGZJSGgxUTRkeUI4eUFaWFIrYlpURHpPNnp2VHpkbER4QVZYaTNy?=
 =?utf-8?B?MWNNVkttNWlPOWd3Z0pyR2RaSnRvbWVjclZrV1VRbDFSNUFaS3M2WnJBT3hS?=
 =?utf-8?B?a0FVWjNBOElMSTZEWXVRbDh3M3dVNVJ3MndqNGlnVXN5MWJwbDc4dCt4TVNM?=
 =?utf-8?B?L3lCcmF0eGhqdUw2a0hUVC91UzJUMldUNXg1Z1ptdDg5VUVhQ2N6OHlPeWEr?=
 =?utf-8?B?Q3lpUHlYdHZPRmxINU83dmllWDR6Tk0zb1BGYnk3ai9FdTlMTXlPZlcraGVp?=
 =?utf-8?B?TDh2cXBZTXVyUGliN0EyMGNlYmJDejE1SU8zalNpSXRwRFgwV0pNMTJaSkxr?=
 =?utf-8?Q?cd365cOlOit/ubVJWYH0iZBjSgQYSfOs7yxVtYYXu/X5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea650dbd-d367-46f3-86fc-08de1cddebe7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 02:41:00.6033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZdLMW4Kj+KJYh1T7BKN6k8ZjF46qrvZM30+jzFcMN9EegLJrEqG6tXnP2xS7X9JwtMEc7NfmZauL4ZQMdP5+Q==
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

I have noticed that build fails when doing the following:

- Start with the x86 defconfig,
- Using nconfig, enable `RUST` and `DRM_NOVA`,
- Start building.

The problem is that `RUST_FW_LOADER_ABSTRACTIONS` remains unselected,
despite it being a dependency of `NOVA_CORE`. This seems to happen
because `DRM_NOVA` selects `NOVA_CORE`.

Fix this by making `RUST_FW_LOADER_ABSTRACTIONS` select `FW_LOADER`, and
by transition make all users of `RUST_FW_LOADER_ABSTRACTIONS` (so far,
nova-core and net/phy) select it as well.

`FW_LOADER` is more often selected than depended on, so this seems to
make sense generally speaking.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v3:
- Remove `=y` in select statement of RUST_FW_LOADER_ABSTRACTIONS.
- Link to v2: https://lore.kernel.org/r/20251105-b4-select-rust-fw-v2-0-156d9014ed3b@nvidia.com

Changes in v2:
- Split into 3 patches.
- Link to v1: https://lore.kernel.org/r/20251104-b4-select-rust-fw-v1-1-afea175dba22@nvidia.com

---
Alexandre Courbot (3):
      firmware_loader: make RUST_FW_LOADER_ABSTRACTIONS select FW_LOADER
      gpu: nova-core: select RUST_FW_LOADER_ABSTRACTIONS
      net: phy: select RUST_FW_LOADER_ABSTRACTIONS

 drivers/base/firmware_loader/Kconfig | 2 +-
 drivers/gpu/nova-core/Kconfig        | 2 +-
 drivers/net/phy/Kconfig              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: ade19c5060dfa39b84a9475a4a6b05e2a8a2b3ac
change-id: 20251104-b4-select-rust-fw-aeb1e46bcee9

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

