Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B43C9DA57
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 04:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E8510E035;
	Wed,  3 Dec 2025 03:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="D4MFNsh5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010047.outbound.protection.outlook.com [52.101.56.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4553310E035;
 Wed,  3 Dec 2025 03:30:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=II5BZIdLxR8QcgotBFZM/hwaEiZu3Az6zBNVOKPd1eQwUa7dva6GD9EPl0VkIt0TKhZflHnNT030GGVZxVCFEa0Ir7asRygeFcrCVyFf7jFTMoHSUdTE43X8SJtkyfL4Y0Agdisk+KFa1QzzJ/iYavSuGKmUIu1Vy8x9sHs3udIAwXS8rNl204qszMbsdqQ3sPJVvk1RX2D3vA4QYspie4TqNSSIa16EIPSr3gnL8s2Bl+/P6vj/Duq8S81kohxoY1ivvN1L4b9AAeHiskGe+EB7mTyJQXr9OzxXWMBE4/Xnm2jcEyC/DmE5D7dThAmnMsgx1laADc5glDA4euvf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dA+6dQrVPjuqtoYIM5BoHHzpXPVNbA/bUzIvVZyB/N0=;
 b=NVFfq+8D1M7AwaPWmy5QkYuzPsY3jc5/JATfCnPi7BsEXumBgnTKszvh8v0UmteIqm5zKL1ad+lZJ5nG87uT02MBgX2wT8e5RwML2KxkW0znO7iy7Bcvzy0bo1TWUBAjBZddm8NmWna3tXpo0ay2mk8wpsVqspezTtSEiYYn5CuG4XiVmu1Gq6osy32LlCYVCodH4xQqnKATC40y07bzxkQmqIs0ha+SEE3ve6eMEf3GC8i+FIHGe/Xq8ci3kcn88kPmzrv4dng4ViIRhH/03qEcE2Nzbgx+rkvfTn4p3v2qHq44LxKAM87hGmf5G6I9Hb+Qx8L2Eva9SXAjLo7WhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dA+6dQrVPjuqtoYIM5BoHHzpXPVNbA/bUzIvVZyB/N0=;
 b=D4MFNsh5BnUV86uM9/ZyjatrFVAUblhQIpcUofdEtT2TOqJlqxtBBCqaLpAGJJ30Y/NambEXsU2g2B9+VYj0h9wVmyJ0H/bxjWnCmZzoLJ8UzayqsscTuX9cSUPx159qdY+3fpDbLDZrjjy6iuAuHLX97W36OHO7bGYZuEOXVYwrsnCo4ipj6cCXBSOgChpkqnd8rVNYVZGDIoiE3sftvsQkDxaCHz9s2nS37PJQ9IeoEmp4aPMVELCywJ0ENSMfqkUB8NaK+JPF4vSX03qz7e9NV1iMJBN6zN4AUdDmfGCkUYmKKPMtUZ78802tlFnCdrj1/1uuHQXpQtKyxdHPaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5715.namprd12.prod.outlook.com (2603:10b6:208:372::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 03:30:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 03:30:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 12:30:11 +0900
Message-Id: <DEO9I1XCK1ZF.3MX7M6OVB9GND@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "Alistair Popple"
 <apopple@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "boqun.feng@gmail.com"
 <boqun.feng@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "John Hubbard" <jhubbard@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "elle@weathered-steel.dev" <elle@weathered-steel.dev>, "Andrea Righi"
 <arighi@nvidia.com>, "phasta@kernel.org" <phasta@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked
 list operations
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
 <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
 <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com>
 <5F21F7D7-D0E7-4B25-AC3E-D21331EE4A1F@collabora.com>
In-Reply-To: <5F21F7D7-D0E7-4B25-AC3E-D21331EE4A1F@collabora.com>
X-ClientProxiedBy: OS7P301CA0022.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:26b::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ee7ea3-0a19-4da6-b445-08de321c465a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THR6bWNBeXpwMnNFdW1uSDYvbmlqeldUY0ZKbDNjOE9reEwveGh0QnM4bzYr?=
 =?utf-8?B?dWxNaUM3U3hpZTZOcDBoNEx3Ym1LclA3NHhtSVNsZlZNYTJ1bVN6emFLZmRl?=
 =?utf-8?B?aTRYNWZ5MEhlWTFYc0FJc3lZbUF6V25NZTBxRGp3dTEvZ2Nsd2xoeUVJUDND?=
 =?utf-8?B?M0g4N0NXa1BCdFc0cDVXSEg2azJTdE5IYzFMSTZTc3krUTFLK1JNcmFtcFpB?=
 =?utf-8?B?S0lNT2pBcXN6cW9YWXcwcTd1MFd6SlhKZWZZQVM3U0tPaDZUZm8yZ3VVemdC?=
 =?utf-8?B?SUFYdUxuSjY1R3dxTExERU1mcUprZFNsK2txLzgxTkZFdWZkYm14dUdCajRK?=
 =?utf-8?B?a3F6by9XNzZRMVUxVWUzRVI0Tk45TU9DK2ppUUxIazNxaFRYV3FwWDRqQUlw?=
 =?utf-8?B?dlBQTUo0amcyMURQKy9FYXRsOU5sRklMWXZuV3lmZ0FKbkVUMEhmSk93cGhJ?=
 =?utf-8?B?Q2NPOWdBYWU3TnpoOU9FSkFEdUdBVmZvY1RqMXZlc3R2Vkd6N0NaakdnNXFG?=
 =?utf-8?B?V1BkRGE3YTNZM2JvYzFDelVpMys1VDVyc2V4NXB2Y05jTjZvYUVoTGRoSUVO?=
 =?utf-8?B?Z3JmV0F2K1Jkc0ZJajNNWFB2MVk2dlFOZGtJbS9PSGNDZHdVd0RNNEo0cEtj?=
 =?utf-8?B?OVZ0K3FZVDBLLzJRdFNpSjZXbU9VT0hQb3cxeDl0UEZNNkEvbURraExsMHZW?=
 =?utf-8?B?OURHdC9YeUwwOE5qRDdIeXFWN0dodG5BR2V2MFBOMFlua2xTVHAwaFgrUFZL?=
 =?utf-8?B?RFEzWUYwS2R1WGV6TnpEdUN5UjlyUmY3b0Y3V0dVN1h1a3ozbStURlNKQUlo?=
 =?utf-8?B?dkxmYnREUVhXN2NzSTNXRE9SNmtKbXV2dTFRT3NPWmhFYWZIZGNFVW9mNlN5?=
 =?utf-8?B?VGVmeHZFekZOQWJvczZ6OGczUHFOVlJVTlFDblBtcmRtWTZuUUp1TW14R3R6?=
 =?utf-8?B?cyswamVDSmU2Z2lCeElmalFBUjc3d3NsMTdxaHBTTTJlZXgrSkVCN2dES1ZY?=
 =?utf-8?B?NzFsQWhIMnJJZUdSTGN2Mkk2amQ1aTVsWEI1dFBzU0sxNTdyUGg1N3U0OGYx?=
 =?utf-8?B?RHZFMFdhUkp2M0hHSTg1M1BRQ0ErQUFHWm9LMHJzV1djWHNCblJIR2UraXN6?=
 =?utf-8?B?Tmh2MXJmS2o3enp0WU1raHl3ZkdnOGk0S0dleFdjeEFrY3UvbFJ4bXM1R0Vw?=
 =?utf-8?B?SFl5WlVsdmh2MmxSZFF5eHlydVEvL2ZMRjBpS0VFZHJWSnlURWRVNWtDTmtj?=
 =?utf-8?B?ZEhSK09CVXQ1RjZpaklXMTRxZlVUdFBvYTkyMSs1N21pUVJXUDNoK3VXTTJ2?=
 =?utf-8?B?NytIRHpmaXdLdURtQWZkZXJWSjg4T3RiTkRTMUgreDZKU0RYUHdBZHc1eE1j?=
 =?utf-8?B?QmZlN2R4S1BZMnVoWjhKZXlRMUNMN0c4UXd0bTA5UkprWktTSlQrYWtKZTNF?=
 =?utf-8?B?MlNnTFI3Y05seTloMEtIdDJTWFhDYkZseG4zWEdjcFV1WUdWeHg0aGsvMjNl?=
 =?utf-8?B?NUVqcTZ6MnVWcVY4d1JGRGVYaWFERVdDTFZNUzBwaVJSWjNibUJOYkxvZzhv?=
 =?utf-8?B?RGZDL1hzSzlOWEVBbDFzOHJrNTkxMHRUYlRNZzl0YlJ0ZmhPYW5zZ0F0Rkt3?=
 =?utf-8?B?aTRYL1I5emJEVGwvUlRuOHIySFFORlNoT3lLOG5hZlIvZkNOOHordzBaMklk?=
 =?utf-8?B?NFQyRGY3alRPQW1uWllWaC9RaFlCMlVpWHNXSjhnV3JoamEzMkFvWGM2eHFE?=
 =?utf-8?B?NnZkSHE2VG1yY09yTXhUVzZSVW05Vmk2SXVSd1Q4NmZYZkN3aVR6UDNKUkN6?=
 =?utf-8?B?eDM0MjZKNzRYVWwvb3VzaGNNUnhYb2JFM0NaRjJPUm9HKzNDbHJqYXBydkdN?=
 =?utf-8?B?aHVkMlFrTHYxTjBOamVaWXd2SUpJdjZoS3lCMkxjaHVzT25YUUUwRVJLUjAr?=
 =?utf-8?Q?MP107jDg2yAQTpP+G1RjsFw25afQGhPh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTdWZUJabStyR1c1WGMxd1NmcDJObDV1ZUMwYitwU1JjbGF2TlVhYzNBSWF2?=
 =?utf-8?B?amNSdTlEWm1WZzN6STgrN21laEI5NjhvRUVaY0VYNHc2Y3MrTHpvTndGRkFk?=
 =?utf-8?B?WlBNNWpBZlpnZGIwa3RIdE1qWTU2ZzJhWSsxMWdCOStIUURkS2JnL1FWUzFS?=
 =?utf-8?B?Z0ZSa1M2WXI0ZllBTk8xb05RZ3JIdTFuZlc3SEIzVFVoRVVBNytENmFpTTBG?=
 =?utf-8?B?SEw5ZEh1N21WQ2VBN3VkMTBKZUtVMUNqSkE0OHRHcVVYSlhYOHkyNCs5Q1kr?=
 =?utf-8?B?d1UwZTRNd0FVTkEyM0dPNTNXTDJGaW5SNFlvZk9KRmppNXNLUGQ4L2VWNVFk?=
 =?utf-8?B?OXhvQUs1cEE5Rk1HREpmaFcrcU1hOXQ1MkVDaGY3emFMZ210L1RaQWZpbGYv?=
 =?utf-8?B?UVg3WGFKMzgzWHFSNzlUR3lLblhWUTJab1NOcFFyOWtVdW4rVU1mMjVwODI3?=
 =?utf-8?B?c3pqU2pQclBQcGJLTVBJZTJybFlIRmpUMU9abW1PK29JZE5odWFQcUpCVnJ0?=
 =?utf-8?B?MDVmRThZRlUyTW1YVFkwR1UvbW4vMzFYc3lCS2xGeWp0NzhrZVZTYVpSZmIz?=
 =?utf-8?B?QURkMjF4RmdIMGVRSytSUHppcE1Kb1NXbWlIVkwwbktGenJIQjBzeDd6bUI3?=
 =?utf-8?B?SmE2WEhKU3ZaeHFLQjhtOG5zS1k3eEE4eDQxaDNrSXdSVHl0U0cwTldBMXdG?=
 =?utf-8?B?RHFzQ0FZckZmTjVDUkR4NVN0WjlZd2tYNkRoOTFKMnAxczZUUUZINWRvNWRw?=
 =?utf-8?B?a25lZ2tDVFo2VHNNVFRtUUwwOHJpNVc3VTl3VTRqcHMwdWY0VzdrZDF3dmox?=
 =?utf-8?B?eVQyWE1sUFJHOU9DL1NBQkVwSG1XRElxMmhwdXNjOTlVYjR6S2ZyQnFPZk5F?=
 =?utf-8?B?TnlZcU1zejVVdXF0VlJ4a3E2bFgxS1hhblZ5NnJVMTZUWjlSS1FObXB6VVN2?=
 =?utf-8?B?eC81RTNpQWhrSGo5Um9IUlJQTVlJS2F6aDhtUHgxVHlOSDZ3SG9taUp6emRm?=
 =?utf-8?B?eGFUdFJ4SUMzcmtkM3YwaCtaeVY5NkZtNXcrNis2TTJnazNXMi9icVZsd0gz?=
 =?utf-8?B?T0JSMFBKdVY4V0I4ZFU2SDNIanV2S0FmSmM2Q1FtZk9pZWc2L3lLRWRHdUlV?=
 =?utf-8?B?RU5sWWlpM1lEdng1KzVnTVVDMTN0N0tKNFowZ2VaWGU2K1QxdUw4TGs5cmlz?=
 =?utf-8?B?VEZWUVI1VWp1S01wdDlyZ2hOVng3ZmwzUkdpRlF4ekpSckdLaHlWSGFVK0Zu?=
 =?utf-8?B?TFFlN3F1OUpTV0dXUERWMytHVC9QL25ndnhTODlpYVNlT2NaMDUwazQ0emZN?=
 =?utf-8?B?TURScHJ6SDdIS0pRNDRUYS9uNkJRZXBEMCtsT1BmYXFBcHBwRHcza09Dcldo?=
 =?utf-8?B?N2JJdU1TRVpSbzNsUTNMSVRsYmFGeEl3clEwZ0hvU2YwdFdoVmlvdXlwT1ov?=
 =?utf-8?B?Tlo3UUdyVC9aMnZWQUZSaEd2Y1FvSWcxcG13RXpieHRFc0VXMi9JbU1aWTFR?=
 =?utf-8?B?dWlBT0srbjBKK3lLTXJXYXlpZ0MwTEpKZktuWnN0aU9uWm9KRzAraklnOU9o?=
 =?utf-8?B?NHBhdW9kNHRDcHZUSkxYYVQreVhzUVNwNTVMeHBGdjNCWEpjeU9pZFg2M3RD?=
 =?utf-8?B?QjVVbi9oVlhOeW5IS1Nla1RWOHpFbjZETFVEeVNtWnlGU09LSDV5V0RyV3pE?=
 =?utf-8?B?UEZSaTBTYVlCWEF5Q21jVVBLSXluUDNVS291M0toR2pSQW9rc0tTQlJvcEFo?=
 =?utf-8?B?cXFxVWtUZ0lOSU5LeVRvelE0N2drTzZmVmhlNHRkcVVnZUQ3dDMwSVM4NkZp?=
 =?utf-8?B?Z1VYdFIwS3N1NDlRVmJWbE9PdkxKaUpaRWpDUkJIaDdNUjljRnRRcWVoZFBV?=
 =?utf-8?B?ZU1CNEVDZ0pvR3FGN3Y4QmR3MkZsYzZ5TGk0aElReGVUdVNMQXdxVnRSZ3NM?=
 =?utf-8?B?WnB3S0x5dWVCaWxHbC9ZSWZCR0ZjMGFkSjB5eHc3OWVwWWxxM2NtRXE2ZjNj?=
 =?utf-8?B?K0J5eGlMbGQ4NXhUaDBjRTFORDhGRmFRL2kyZU5GQlpBK3piOVAwNDVQTzFF?=
 =?utf-8?B?U1VoL3BCVzU4Z3F1cThvRDE4MERjQzVJVzFqRkdiRFp6dmlQeHpXRjBjeVA5?=
 =?utf-8?B?MEt3ZDgzdXpWa05WNXpudStUclZiYlZCOENVNFdDZEJMai9VdzA4R2o1cXFW?=
 =?utf-8?Q?wPnCAqY3XXyyOchsKWuM4lgtTXvyGhVOakmI4R2g+mdq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ee7ea3-0a19-4da6-b445-08de321c465a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 03:30:15.6121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQSIcIq23Zb3wuITjRRkmDmHAMrsqDTWGZMISNsBI1czWw+HbkovcodzHT1hJoDLeynFHMSraAno8szKQLay3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5715
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

On Sat Nov 29, 2025 at 3:17 AM JST, Daniel Almeida wrote:
>
>
>> On 25 Nov 2025, at 22:16, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>=20
>> On Wed Nov 26, 2025 at 3:16 AM JST, Joel Fernandes wrote:
>>>=20
>>>=20
>>>> On Nov 25, 2025, at 9:52=E2=80=AFAM, Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>>>=20
>>>> =EF=BB=BFOn Wed Nov 12, 2025 at 2:13 AM JST, Joel Fernandes wrote:
>>>>> Add Rust helper functions for common C linked list operations
>>>>> that are implemented as macros or inline functions and thus not
>>>>> directly accessible from Rust.
>>>>>=20
>>>>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>>>>> ---
>>>>> rust/helpers/helpers.c |  1 +
>>>>> rust/helpers/list.c    | 32 ++++++++++++++++++++++++++++++++
>>>>> 2 files changed, 33 insertions(+)
>>>>> create mode 100644 rust/helpers/list.c
>>>>>=20
>>>>> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
>>>>> index 79c72762ad9c..634fa2386bbb 100644
>>>>> --- a/rust/helpers/helpers.c
>>>>> +++ b/rust/helpers/helpers.c
>>>>> @@ -32,6 +32,7 @@
>>>>> #include "io.c"
>>>>> #include "jump_label.c"
>>>>> #include "kunit.c"
>>>>> +#include "list.c"
>>>>> #include "maple_tree.c"
>>>>> #include "mm.c"
>>>>> #include "mutex.c"
>>>>> diff --git a/rust/helpers/list.c b/rust/helpers/list.c
>>>>> new file mode 100644
>>>>> index 000000000000..fea2a18621da
>>>>> --- /dev/null
>>>>> +++ b/rust/helpers/list.c
>>>>> @@ -0,0 +1,32 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>> +
>>>>> +/*
>>>>> + * Helpers for C Circular doubly linked list implementation.
>>>>> + */
>>>>> +
>>>>> +#include <linux/list.h>
>>>>> +
>>>>> +bool rust_helper_list_empty(const struct list_head *head)
>>>>> +{
>>>>> +    return list_empty(head);
>>>>> +}
>>>>> +
>>>>> +void rust_helper_list_del(struct list_head *entry)
>>>>> +{
>>>>> +    list_del(entry);
>>>>> +}
>>>>> +
>>>>> +void rust_helper_INIT_LIST_HEAD(struct list_head *list)
>>>>> +{
>>>>> +    INIT_LIST_HEAD(list);
>>>>> +}
>>>>> +
>>>>> +void rust_helper_list_add(struct list_head *new, struct list_head *h=
ead)
>>>>> +{
>>>>> +    list_add(new, head);
>>>>> +}
>>>>> +
>>>>> +void rust_helper_list_add_tail(struct list_head *new, struct list_he=
ad *head)
>>>>> +{
>>>>> +    list_add_tail(new, head);
>>>>> +}
>>>>=20
>>>> Just noticed, but of these helpers only `INIT_LIST_HEAD` and
>>>> `list_add_tail` seem to be used (in doccomments).
>>>=20
>>> Correct, but it makes sense to add the most obvious/common ones (also t=
o make it clear that using these are supported).
>>=20
>> "It makes sense" is subjective, and in this case I am confident it is
>> not the right intuition to add dead code just for the sake of it.
>>=20
>> Each of these helpers adds a potential breakage point from the C API
>> should the latter change, so we should only add them if they are indeed
>> necessary.
>>=20
>> Actually, some of these helpers are not used when they could have been -
>> you have a `is_empty` method that rewrites the C function instead of
>> calling the helper. The only helpers that are unjustified as of now as
>> `list_add` and `list_del`, and these are easy to add when they become
>> necessary.
>>=20
>> But this raises an interesting dilemma: these helpers cannot be inlined
>> and add the overhead of a function call. On the other hand, the
>> definition of `list_head` is so excessively simple that manipulating it
>> directly is virtually as intuitive as invoking the helper - and doesn't
>> bear the overhead. So should we double-down on these helpers, or just
>> drop them completely and re-implement the list functionality we need for
>> increased performance?
>
> IIRC, there is someone working to fix this overhead by working on LTO sup=
port, or at
> least I remember this talk at some iteration of Kangrejos.
>
> If you use the helpers, you=E2=80=99ll be covered in the future.

Looks like the series has just been posted:

https://lore.kernel.org/all/20251202-inline-helpers-v1-0-879dae33a66a@googl=
e.com/

... which I guess means we can/should use helpers whenever they are
available then. Joel, please ignore my rant above (except the part about
unused helpers) and feel free to use the C helpers whenever relevant. I
think the argument about the structure of list_head not changing can
also apply to the helper API.
