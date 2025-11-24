Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ED8C806CB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 13:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063CF10E252;
	Mon, 24 Nov 2025 12:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CdAgS/8f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010032.outbound.protection.outlook.com [52.101.56.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2BB10E238;
 Mon, 24 Nov 2025 12:16:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wIDkRCrQWoF4Rr5ezkQXn/iLISKhOfg4/9auF9NsMp5owRCXM2UY3s3kZDoIB2cqbQFphqMNigAyoFQKaFdcqp3a5GWZfh/XfOW04au/V9HpyDnNH/DuRFCggAPLP4RXKyGmIW1fpxH9SeU5dxYbyBDp7Y8R9DBdO7b27bBR0J/mdB1BLlAw4Fh8JgoSnfUFRuXGNsVwRjmTP3jiZjyCqsfvEesnXBGqssLXpanbZ4gEhbVS5s/ZyphKUT9i/LWmdL4PnDQf1RYvd1FBuHgxxyUptwdESXh0F2jdHuvKSgIGoMvHDID/2ghu1WwItrNCz445FObBg3SLsD3NOQMzkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7o1/qRD5e1I6JquabbK31FOdHSn4QWnEmzAelocSps=;
 b=jUzBFMA6Ke+oqLbTcuJvXAM1RZxJaTXXLhb8nXBn1N0K9I3t8dtMBtcyegBHnL/KUqOKey9ulr1E4G51qasvCiSP4Hdmn9+WMDy+2XxEKoJdaVzi2bkrS/u88ImCMTQ2Kp1enlpgyBPlzzN8YpN+SLOOJTvbRK7VtVdDoplzCyvL3L0q4QWawdj8mNupBF26hJaD4VxxRPiRxtZDBwADQroJ8oaITITnUXeh07DzaNgNtn03MTT4lJAVZji6RdyY4nZCusjew/A/WdBm83vKt0NEwoy3A3/Ju5ZYiuPk8KW9SJ0DzZjXDjtFxDn5EZLRaTy7a6j9rs7VUU3LdWNnnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7o1/qRD5e1I6JquabbK31FOdHSn4QWnEmzAelocSps=;
 b=CdAgS/8ft5DbjWCVER6NbOomEGh+1ps/Pdn/2pzXe491T11kG+Ht0A68dknG4s8o/xYTlJrDSQmpckRnGuM4g5OqExnooJ+Mv7cG+3Thw74xiEIXfR3cthlKBwlmIhosM83ByXpxUoreWctLaptjBOnboIBYVFnyCgxLHz7Jb5UlOhwJYeZa/COBafL32PtpJIWB6SEQgx+Pm44slVCn02Iul+9Jqzg4jYROw8/YVSZ6dYRw2MviYF8dXtjjsTgASI4bFKZ7Myb7a/QWIOV2RfmtguXLhnPG5xVWUw+6v/mOqj8K7koDm2LjYWAXlqOxWjSU05q6ySAJ9cGhZwJSjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB5892.namprd12.prod.outlook.com (2603:10b6:8:68::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Mon, 24 Nov 2025 12:16:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 12:16:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Nov 2025 21:16:36 +0900
Message-Id: <DEGX27A60AQ5.56URYVPGG57H@nvidia.com>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Robin Murphy" <robin.murphy@arm.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 02/10] drivers: gpu: Update ARef imports from sync::aref
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Shankari Anand" <shankari.ak0208@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=
 <arve@android.com>, "Todd Kjos" <tkjos@android.com>, "Martijn Coenen"
 <maco@android.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Christian
 Brauner" <brauner@kernel.org>, "Carlos Llamas" <cmllamas@google.com>,
 "Suren Baghdasaryan" <surenb@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Igor
 Korotin" <igor.korotin.linux@gmail.com>, "Michal Wilczynski"
 <m.wilczynski@samsung.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
 <20251123092438.182251-3-shankari.ak0208@gmail.com>
In-Reply-To: <20251123092438.182251-3-shankari.ak0208@gmail.com>
X-ClientProxiedBy: TYWPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: bb16b649-5cb2-45de-c099-08de2b53535d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|7416014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3c5MzloKzV5TTYya28ydEJHd1ZRcmNKaXl4K25RS1hIZEwxMkV3Wlk5ZSs1?=
 =?utf-8?B?eGFHcEpBTTJDQmwycHI3eVdsVmp1eXhqM3FHN0J1dUNsY2U5djRoQ0h1NGJp?=
 =?utf-8?B?czZzcXk2K05Wb3lrWG1LOFhaNjBoRytVUGRtVHluNFRjNFlJczlrekQyV29U?=
 =?utf-8?B?RDZDL1B5ZWtZVmw0RlhHSzhQZFFGZDFXR1BTZk44aE9rdm0rckVoNnZiMTJF?=
 =?utf-8?B?M003TnJCRTcweTN0ZkRZWTMwQ2M1WmtkWmVFTDU1ZDNjQUY3OXVqMGU3blFE?=
 =?utf-8?B?SVIyYzF5dXQ3azlTZnBGZVpycmZmVU9WNFk0Tnp2am9uTTRmMmxhR05LTkc0?=
 =?utf-8?B?R0Z4cW9QNFJRMmVCNlRTdXNSNDdGLzdiQ0FlMWZhZHhKV0dzK09UMHFrRGdt?=
 =?utf-8?B?R0tHZHE2MFk2ZnFheDFhYWhvcGZTSDNNQWV0dU9tVGlVa1dNTFU5c1htMnpT?=
 =?utf-8?B?bUdhL2Z6ajBpK2VoWG0rdlBXVXpORnpIKzgwcWttZzBjMXM1aEQrZ3ZKUmlz?=
 =?utf-8?B?WW84dkZsYTlzdWp1SURkRlJHZ3U5cERUQXR6WlRoV2hBZGZVcWVJK1ZiSjc1?=
 =?utf-8?B?dmdOdW40Y3NZOU1TSWhRL2tPNGZ1eDNPa3h1N3dmbm1yQklBVFFXclZDeFAw?=
 =?utf-8?B?aXhoeGkyb1FnQW43cjRSbERzN3pOa2NLc09qUHhaUGkvUlNvcDA4b0xZL2Fw?=
 =?utf-8?B?QzJMNmxVU3BNS1QvOG5iZEdEM2s4R0lFbzYwOWp1OE50d2IzVlczRmVMakpw?=
 =?utf-8?B?RGNqS2R2bU9qQVU3QzhCQVRsNzBkV2dpeGZjYVhOMFhKZnpadS9iMXV1eTZq?=
 =?utf-8?B?U014V3lLZm8zYTJkQ2U4RmN1ZHcvV1BvZFdxbHhJMStuM1lOeDI3S2FhSEZw?=
 =?utf-8?B?UUpyNXluSUR0RGExT1UxeHpHUDlIdm9kVGZlbktBM2NiM2dzWFI3OGh2c0hx?=
 =?utf-8?B?eFAwdDQxbFpkVVlWL1NNa1RtVW9ZVDBCQUtoTUhUOHdzL1E3U1NDNWpyVEEx?=
 =?utf-8?B?LzVSbnFsb3pUK2VVazlpTnhycWxLUFQ1M215VWc4TFpNZW51Qnc0bVJiR2Nh?=
 =?utf-8?B?U2duenpUaW1FWEFvWi9CR1JHVnNoWExNU1JsalBVQS94NmJBNFlGdmJxZjUx?=
 =?utf-8?B?QlNsaERiZkswWVI4Y2I2N21yNFFHUWJwbWdKQmRxWmpDSUJmb2lCeUhBbWFz?=
 =?utf-8?B?am1KS3JrQVR0NGtPelUrdjMrMDdUSksvUG9jZGk3TTFiRk9pL2xuWllJQVhC?=
 =?utf-8?B?bHI1UmR6aTFIK3FINm00dmtpR1YvUlVRSGhEZnRidTgwQjhTOFRqb3ZYaDlI?=
 =?utf-8?B?YXlGbU9FbnRvZ3JQZHFHSjF5V2dvRVg2M1J6SlRvb1JjeEZaTHVWeUp3dG9y?=
 =?utf-8?B?eHhFNVVZNjRuNlJIV2xnbG8xQ2M3ei9xRi9DK3F1WHNXYVM0TjF6U3JDeHBn?=
 =?utf-8?B?RFhNQUNNRXZRZ0dlbDlBUEt3dzB0MG4yVS8wMGlTbkduV1JPV2EzWnpYQzJv?=
 =?utf-8?B?WXZjTlFLT2REWmc4SzdQY1JWdnJkbEpKVFlrc2I4dUQwUHNxMHZnbk1seGln?=
 =?utf-8?B?QnY5endaMXM0cDI1VTNCVHRlWk52dDVOL1JEdEJMRjNwcjJ2T09BdFVsVkFx?=
 =?utf-8?B?dlk1SjdXUFljWUR4Y3dCeFB4OW1LQkE0MnA2cGxGamZuc2dNWXhZbG9ZRmlY?=
 =?utf-8?B?SzRURnFac2JUMVdvbjVzdTFiQjBnQksxYXNFOWtvZGhSR3pXZzJiaEg1TW1J?=
 =?utf-8?B?OUxjb2N1MUhiNzJDdjUyTnA1MVFZa1Rxdm1oWG55MFI0YTV2SXNZZlhnUk9G?=
 =?utf-8?B?Sm5kUEx1aDRSd0wwd0xRZUZMTlJhdmNDWUhSWU84aDV5OXRkVEYzZDNVeEgx?=
 =?utf-8?B?ZGlqY1V5TUJEeUgrdk9EamIvU0ZXNFczSUE3YVdxUHpiYTg4VE81UXJLY3F5?=
 =?utf-8?B?R2dOSjJPYTZRWXgrc2Y1bXZQMGRGMFo2akdCSkZCQXIzZllHYThLSlVFS09i?=
 =?utf-8?B?V1E1VDRDaGJxU0ZvK3BYNzNMQjZoM1k0eWV3cm4xdERQa2lOT2hXSVNUZ0Zl?=
 =?utf-8?Q?M6bZgt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7416014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3NqK1BoeXI2U0xNRVI3MjlHRmxlaGRxUC9kbHQrcEg2ekNLTXdJVE0wZWlF?=
 =?utf-8?B?Q1ZGaGwyTUlMZGVoMUtsQ1FocGFhWWswZUdPWmpUbWRhU1RKM0Uwc2tRb1N2?=
 =?utf-8?B?cG1sTzlHYUlTWEl5aFZGS0taL3MraUVWRDBGSGx3SGZhdFpqOCtRdUxkWVVP?=
 =?utf-8?B?OGFINW5rK0ErNXNZUnpPYXFROUZJUVQvNmhTbnk2NWtvYXJWRHJFa2xDK1di?=
 =?utf-8?B?akpvb3JuYm01YmhhcE1GVTlBWEdjV0p6c0lUSkJiZGhZeDBUVnVpaUNOU3pU?=
 =?utf-8?B?eVEzZTlLYTkyTm1BWHZVTmJaejk1STJVOTBWc0I1a1lPYzdWWU5yWnpsdU9C?=
 =?utf-8?B?UTRuZUxsRDdIWUp3b005Um8yYnlHVVllQ1Q2WDJNYnFnN3JnbERENXYvYXZ2?=
 =?utf-8?B?L3llbnR6TTQzL3cwSkZyL2xmaUVsNmM1M2x5SW1LTy9PTEhXc1plR21nS0lj?=
 =?utf-8?B?ekRwRWs0amFSSm9NRGFtT0FvS0FNd1psbExScjhnVGhmNFBpOFZlT1RvZmpv?=
 =?utf-8?B?Z09qWENVN2dOemQzblRrT0dLYzRJYm1yNExsd21BWms2aGZvYUJrMWtPR09T?=
 =?utf-8?B?bEs0N21weVhGd2NnTXdBOVJVaUpJeGtCSTFyR2VNbHVQeEQzcS80bU9iMGli?=
 =?utf-8?B?b3VVaHp2N25LSWU5UVgzcFducHBrRVRRYm54aGliY29RcUU0L2hXTmVXU3Ax?=
 =?utf-8?B?VFZiZTlITHBPTjVhK0ppeE4xcWVpU2pOSXRhRnBBbjJmaDZHUFo4Y1ZzL3NB?=
 =?utf-8?B?UUhwbTdJK1NpR2dYYW5Kek43RkwraXJHMEoxTjhkRDNYS2JoYXc3S3RxSGZm?=
 =?utf-8?B?d255NDNCYVRHNjBJbVBacE9MYlhPbzluRjFtaVRzbmlkNUZ4YW9Tc0RZTEkv?=
 =?utf-8?B?NnppR0xHTUNldko1ZFBBeDY2Y25sK1YrUnFHb2k2ZWZQREk2NVRCNldON0dx?=
 =?utf-8?B?d2FwbWJrdGgwdDQwMVZmdi9Jd3JOZTVxckt3TjJaeTU1VXExcHpQNmlGaUZk?=
 =?utf-8?B?dVpvNU16RnNTV0d0UkNrU2NnSTJxNkZCV0ZIWDlmTm5xaDdrT01GWVhCdUls?=
 =?utf-8?B?M1J5SzA2WFhYeGg2NnBYMVYwTjhpVld3blZ5K2tRcGwwRWdDZVF3Qy9BejJr?=
 =?utf-8?B?MmkyZlRqUDV2elIwNDhvUHpkSStIQTBYWldpQjFwYzFuRzNzdWtrOGxyRUtP?=
 =?utf-8?B?eGliYzJKdVFGVGNkdHQxRU5YVkF1RGxrZ1kwbWNQdFB4cEZMZDNsd3JxSWpI?=
 =?utf-8?B?SmFuTGJuajIyRjV1K0t0L0doSFpGVTFGRGRncG4rdHE3dTlUUWV1cVg3YWxC?=
 =?utf-8?B?aXA5cTRKY3pBSCswVjFSVVpQQVk0ZEhCOWs0YUxkcEFhaS9UQm5MMzJDT3Zu?=
 =?utf-8?B?TlBNdURhS3h0ZzA2bG16TE9qNTFDU2tzelVpdHY1NGFVeCs0S2dZVHlzMkQ5?=
 =?utf-8?B?eGxHUVF2STdhNEhUdXhvc1pONzBXdkNJdlZGUFBtaDZmZkx5VWVVSDVueUFD?=
 =?utf-8?B?WHVlSE1FSGNLd2I3OXc0ZEs4cHhuWnptYXEvanNaWnlyQkREcWxJYjM5VmlX?=
 =?utf-8?B?S1o2SXh1c09FNWFZV0JoYXJjc2pUZTFZZGVmMnpqNFlFS2szTHdiTHFnR1R3?=
 =?utf-8?B?RitKK1NFN1NPdCtpdDd0L3B2ZUoydlVzM001Q0Zva2k4ZWNocmJnVm55ZmR0?=
 =?utf-8?B?N0VLTUxTZnVCUUNRdXN4K0FIOG9pSnBuYnlwVHJLb1R6UmhPSDJwNXM5ci9a?=
 =?utf-8?B?SUNmVmF5WmpwcG9zYWE1eDlCbHpKbXRPeXNQbHV6d05OQ1hnYWlXWnVQa08r?=
 =?utf-8?B?TzNROEVpaHpHclliLy93cDF6N1ZWcE9tUGpxdGhhQzNrYUhLTjUrd2VBVjdu?=
 =?utf-8?B?eVd3elpUU3pBSFlsdTM3RDc3VkhSQldDcFlIRWNKcjZJSWQyS2xLNzN3UVJw?=
 =?utf-8?B?K2RVY2lXNXRrTjA5Z0FmejVtcC92RnRvOFArQUZaZEJVYnBuSS9Eam9uakJa?=
 =?utf-8?B?WDhyVDlSU3hBWGRpRk0rc0VrdmpkaytEOU8rTTQxc3NxVFlhY2dPZGxPRDly?=
 =?utf-8?B?QlZhK0ErZitpREF6dks4YmhQOVZ3bTkzcmVJSlFRMWJMSlhaN252VDN4eXBV?=
 =?utf-8?B?c090Z3h3SGVzRnJER1M5UDIyZlIxQW9aK0Y0N3lFamFMSlVRdE1TQ2E2YTVr?=
 =?utf-8?Q?Va7ZstZndhNA5bfoTZ2HVHttJ4jHSo1nmS8MpI28/41j?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb16b649-5cb2-45de-c099-08de2b53535d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 12:16:41.6952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTAubXQ4cyHPCI6CYFCKlWJ9VZLqXqjTwRiHO8+flsxlM+rPvJXTKFxFdvTEQ9umfie6AYNgkQCjUmGuizPvxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5892
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

On Sun Nov 23, 2025 at 6:24 PM JST, Shankari Anand wrote:
> Update call sites to import `ARef` from `sync::aref`
> instead of `types`.
>
> This aligns with the ongoing effort to move `ARef` and
> `AlwaysRefCounted` to sync.
>
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1173
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> ---
>  drivers/gpu/drm/tyr/driver.rs          | 2 +-
>  drivers/gpu/nova-core/gsp/sequencer.rs | 2 +-
>  drivers/gpu/nova-core/vbios.rs         | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.r=
s
> index 0389c558c036..264c2362237a 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -16,10 +16,10 @@
>  use kernel::regulator;
>  use kernel::regulator::Regulator;
>  use kernel::sizes::SZ_2M;
> +use kernel::sync::aref::ARef;
>  use kernel::sync::Arc;
>  use kernel::sync::Mutex;
>  use kernel::time;
> -use kernel::types::ARef;
> =20
>  use crate::file::File;
>  use crate::gem::TyrObject;
> diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-co=
re/gsp/sequencer.rs
> index 2d0369c49092..9c689f0b21ab 100644
> --- a/drivers/gpu/nova-core/gsp/sequencer.rs
> +++ b/drivers/gpu/nova-core/gsp/sequencer.rs
> @@ -14,12 +14,12 @@
>      device,
>      io::poll::read_poll_timeout,
>      prelude::*,
> +    sync::aref::ARef, //
>      time::{
>          delay::fsleep,
>          Delta, //
>      },
>      transmute::FromBytes,
> -    types::ARef, //

I think you will want to move the trailing `//` to the new last line instea=
d
of carrying it when moving `ARef`.

With this, for nova-core,

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
