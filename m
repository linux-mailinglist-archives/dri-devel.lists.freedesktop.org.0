Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D54C99738
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 23:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE61B10E4B8;
	Mon,  1 Dec 2025 22:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DksLH5cg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012036.outbound.protection.outlook.com [52.101.48.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7767D10E4B7;
 Mon,  1 Dec 2025 22:54:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WowzyPC6yDjUDgCVCEpjOvHyQ6nsJ/LtU+t8wrpwH42EJmETWY9ZY0/+YGw7T0buZgmMlIULwFw99HjiCuy5kTTtYqRhdTHPAf8mCJYX0PEOWdf4jNDwjcSqRTMdgTKYMXrmPltU0EQUf+oeUOj4DhklgskJIrVl4PhXIllfpGEy5Nf7TjwARJbyP3nSzpDRfWtX0I7zqG081spV5TXrE8jEjn6kbaaFoaUg15rglMQtcJ4gmwXYRG3gdlW8OEmeQJyigdqMGUxuA7elS4LQNzx4GYs+R7l5tnWiMC1WYl28Xt2hhWdqGwHNbaElDIJlXIWFvzHHAzZmA0nRR7jJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYXiwrF7ObhxBD5JiiFmg7pEqDSw0uGjcrzjNUYy5PQ=;
 b=oo+01EBfYHWySXb9LcTFWGxIYX+dxF2OYBCi7wT0cziSANGIk8lyx/280vh6mnmsvulnPW/3xJgN96gObUwFCcbC8La6y73qLN6YLpeF0ASFWxHiiBWFxcrOx5Ka7xmiohBAygPzsdJAUSH3zMNysPpJIUVjoeBM0W5pgWLbtHrZbaydh3FDyUKijUhLwdr8eVvoZSdEx5dVcohCQLJpGTnHpzqLw2ymZbih+FTYN4U5ejxNgWO1pg1O3JMvpTauTPK25LCQXa+BUp7K/nuh2+k5VmGORNt11IRFxRyfcH7YSGwOyhPNwpIIebk45JtSAwk2D5710fJivDo4fv5LvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYXiwrF7ObhxBD5JiiFmg7pEqDSw0uGjcrzjNUYy5PQ=;
 b=DksLH5cgoPe8Sjpo70B0Df9zuBOQ7i/ZCvRM+vVEGI9xDC2lun/f9dWMH1aW/n/EURy1MedYjqSg0aQ5kkEEQEXERci24hzwj989wZN8nlHqRLPt9SABUyy8fQH7MMVmEg7jyRmvsKpMKnicp1Q7CaCvkOe3urOcT56IMF/+CeblsTUx527mvZjp5fgcsO1rt3lFIOQFsKlayEhjwBMj7cK8w8qGPK2hspHMrWdCa6jkw2M4NwYh2gS5UFzLV65am7Lt32ObQewvDTLapQrX8+7DcZEEGX9d6fYaJLtn8UOSWqpKABCm0V2tGOtfvyUatij/ZmyTPz+cWu+a7ulpUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6471.namprd12.prod.outlook.com (2603:10b6:8:ba::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 22:54:55 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 22:54:55 +0000
Message-ID: <ddc0c618-095d-417d-a52a-4294d692022d@nvidia.com>
Date: Mon, 1 Dec 2025 14:54:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <2653abf6-5cd4-4385-b7c2-f377a9503160@nvidia.com>
 <7a88da9f-c67b-4a68-b8d6-a66f9096bab4@nvidia.com>
 <497c91a2-ca6c-4e05-bc5e-7c3818302c7e@nvidia.com>
 <CANiq72nhkOMGGb7evGn441J-8nX=jSWeDTASn0gj+TCa692B+A@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72nhkOMGGb7evGn441J-8nX=jSWeDTASn0gj+TCa692B+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6471:EE_
X-MS-Office365-Filtering-Correlation-Id: ddfa0eaa-e13a-47fd-f96f-08de312ca522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVhxT0NFYVIrbkFlM3dJTXltcmNiRnI5dGFGRyt0S2dUczczb1Rod09SdEdi?=
 =?utf-8?B?a3lPMncrdVhDRjVCUGVZYWdKKzhtQVc0M29sdk9CZEJWemJsVVZZUkpySlRU?=
 =?utf-8?B?UU9HVkNXYm5BZGhxMFEvK25HZDRPMTNPN3RNVGdvNTNnSnZaRDNneXV0T1Er?=
 =?utf-8?B?elFuOGdXU0NkUGxYbGpsd09jd01oZkRxenpzR3pEckx6Rk44N1VqbnRVblE4?=
 =?utf-8?B?TXNJaThVTWNDRm8wcjNYOVp5ZnVlZzVNajV5N0M1azZCT1JkNTVWdGRYZTZn?=
 =?utf-8?B?RFlvNlB3aDFXV29qM2ZmeFB1Tk9tWjF5blBEeVNJN2o1clIvcC9VQTN1WVA0?=
 =?utf-8?B?RTlBUklBMHNtS3hrMEgzbmw5b0JpekdZQjBoSWhJUjJYTjF0VlVFYm5PYlZI?=
 =?utf-8?B?WWxrZmhlS0VQOGpYdU1oRjdMbEVGRXU5QWxEYjdHZFJ2MFo5S0tiYzJpeHE2?=
 =?utf-8?B?OTRsNjZRL3RhZkJQYjJGN0V0RGtUNzQ5eldHcUsxZlJsYWFTc04vUTlvbjVq?=
 =?utf-8?B?U2dGOWZaVkxLQlYzeXdPVWlDdlFhckd6WlhlOTA3U0VVaXhUVEIrTzRKMTFU?=
 =?utf-8?B?VWF1cWJKLzA1ZTdYTFN1SmlxdXJxZTdCRlFqeUIyWFI2VFpZUXROWlZyZVNS?=
 =?utf-8?B?YlhNVDhOU2gvYngzUVI3alBJdWIyQUxiK0lkNmlxSzBmelJqS1BCeXhmS0R3?=
 =?utf-8?B?MUcwdFM5c0dKYVR3UWo3dUxIdWY4UU1VWHFYc1JPWi92UURoZldJZytGaDJo?=
 =?utf-8?B?eEhnNTA4dEZ6SEtGMnh5TWR6VyszOUNLUExyTHl4dmdKMFBDMjIrckYyRjNo?=
 =?utf-8?B?VzBKUUY4bnIyRWxtcjhQQmlicjNPV21kSlpqMlhoVkRWd2tTbDVtaVdyNy94?=
 =?utf-8?B?NWRGNGQ5T0wzSXJmbUdCcDUyYk1uNUtZUWpJQ3o1cFZJMzJkWVJkMFlvZzZl?=
 =?utf-8?B?a0ZLZG1vN0pUQjU2T0JJUjRRUTdwS21UVktyQVlGRktwOTNBVlAwL1F6ZzhY?=
 =?utf-8?B?MDdiZUM1VmVwd0pjd1hSdFpxcW1kSEFlQlFMdTQ1NFpEMDI4WHovZTEwc3Mw?=
 =?utf-8?B?S3VhcmV5eFdHVWxXR1lzUHFwSmRsaVlibldGZlNFMlFoZ0tuWmlGUGNWdHdw?=
 =?utf-8?B?d2JwQjhyRWh2Sms1N2oycVVPd3ZQWkhvZG1hejJlQ0paQVBuTjZIaWx3aXRk?=
 =?utf-8?B?UENwUm1BOEtJdEtKN1R3MWc3bDhRWDZVcTJEWmk2bjJRbFZjdFRyMGprMVpz?=
 =?utf-8?B?NHdNWlMrczlpTGNlS0wvdk5Mc05Fak9kV01hZnlXQ2txaVVGN25wM3B0WVgr?=
 =?utf-8?B?WXpUL3pWQkI2WFFDZ2l2MkIwaFJMYjlJUXVIOXEvSzcvSDNvK0FhSlo2YWJm?=
 =?utf-8?B?SFBBY0l0enR2R2kxcW5PK1FzR1JCbWI1bmk3cHY2eHg0WitYdUxEaEVDK2c3?=
 =?utf-8?B?NnFqY0VuUVltVGpGbHZGbzV6RGRIKzl6K0Z6dWMwZTNha2R0ZUpDRjZFclVV?=
 =?utf-8?B?WXRhMGk4bUVuT25PK2xRazE5U0hEcjJwUnNSQ0N4L1c0UVFpWFRINzFJQ2ph?=
 =?utf-8?B?aHVwM2w4UXV3Q2VTQWNOU0FZTjhWNS9JRnZneFdpcHRtdm0zN2xXazZoMVdG?=
 =?utf-8?B?NDUzNm8wLzRzeTlMcld4dnNMTllzRWhpUUZNT0R5c1lMN3N2YURGUXZxaG1Q?=
 =?utf-8?B?QXEwTytwOWpBMHg4V1JHQ3g4NlpTV09BazloSjJYZ2JFcnJVMzJjaDBkQ1Jy?=
 =?utf-8?B?ZGswd0tHNmMraWthZGZmV1A4bCtpM1NFeWpLeW0rbFdRSkFDQTN3TjhDSFBS?=
 =?utf-8?B?bkF3VVNyc3JKdUJSWEVndXI1QnFnOTB2MDZhLzA3c0pqczRiTDRZcTlsTmhG?=
 =?utf-8?B?dFJzQ3FQRHB1MEhTTXdmcnpVQWp6VmliekJjTGtTZjlhY1dJUW5rY09FaE1i?=
 =?utf-8?Q?gX7yk6oWtafcPdy2oNSLbuaWR8LlxWhz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUg3bmtxMnErb0Z5V010dHV6ZWp0WVJkQndIZXhYRGd3eVBEN1J3RFlJZkxP?=
 =?utf-8?B?WGd3b2d1Z2NnczJwT3lZQU9MM2l3QlErR2twYWNkK1pyMld6ODhoQ0oyMFls?=
 =?utf-8?B?L0VGS05KMW52d1VFUUFlK0NzbWZ5Tms2dWx3K2plVWNHd0h0WUZvNmFqVmpS?=
 =?utf-8?B?bHo2dFlQRFN3Y3htQXI5L1l4S0lZWmViSFV0WUttdUp4NjJ3WWFQd3E1aWla?=
 =?utf-8?B?MjNaYytxaW83dWpQUFRzeXgxYkJ4bW15Z0QzYUVNdkp5cnlia2tVS3BJNHU2?=
 =?utf-8?B?aG81YTJaYzZGNzJnNUxZWFdhMVVUQmdnazJOck12bEZwODNVckpkaWZmaFFY?=
 =?utf-8?B?MnFUWktoYzVjaTkzcDQ0Wjk0bGRKZFFzUE1GSU9sTkJaeE1GOHBWckowM0tP?=
 =?utf-8?B?ZnBWdXZTMlV0bHhYVFRUbmZyeExPMjNSblN0UHAvd1UrL0YwK1l4cHpqVEpt?=
 =?utf-8?B?VHZ0NDY4SFIrL1FDNHd3ck5TcTBJa1pLakJxcWRVcDd0Ly90OGFRNzR5a3Jx?=
 =?utf-8?B?M0pCajRxR3lUUWVDMGYzR3Q4Rko0RVFYY2dkNzcvb01qRDZadmdQRGN0bjFo?=
 =?utf-8?B?Tlo2Rlc0TGszeFg5ZmViM1pyODB2Y3VrNHhzanMzNTJWU2pwcDZLa3A4bWp4?=
 =?utf-8?B?dUJzSFVhRHVwT0NudmlMZW9RMFJhdUhLWEc2UElYNkZUWU1yOHVGOHpWdDVo?=
 =?utf-8?B?S0N2UnQ2NVVFa0tVUk9sYXNpQSs1R24reCtsZEZBMzI5WmQ1RFB6L0JXbFpz?=
 =?utf-8?B?ZUVBNmJuK0RJMXdlcmQ2amZyN2hyS2V0MlBGK01ROUJGOFplVVVkeFJ5K2Fv?=
 =?utf-8?B?V2U1RVM3RjlKSlYxOGQ4dFh4UDBWSVRkZy9OUmtSVEtUa0Q5NytPSzJ2WUpS?=
 =?utf-8?B?TW50ckdaWDB3blNpbkhab21pRjRiWmQ0Z2pndGprbFBKcVFXbUdlYVNTYUtZ?=
 =?utf-8?B?d1Q1bXpjYWd1MFZkMWRYbjc0ZWdybm82UUdzMkQ4QVRVc2pTV0VaY1FYTW9p?=
 =?utf-8?B?RnRUWmp2UFAvbDJqOGxZKzJLK0hBVllvU0EwNW5CRTR3TDBCZkZqTktlWk51?=
 =?utf-8?B?b3J4ZythaUQ2Y0tZV1FWelFUbHlOQThXYW1LM3JyanJJUXN4VDh1SlY3MXU2?=
 =?utf-8?B?bFhySTVKQUxJbElqdFV1Zml6R3hRWlhOSzFiRHUxb3M3UVB5aG9DNlQwYXB1?=
 =?utf-8?B?b2RLaVV3SWs0NFlFZVlhTHpFZnEzVTlxbG4vQ3dyUWw5ZjRJK1hyN1dFUmNk?=
 =?utf-8?B?K0RnV24wdFBFRHlzOGZvVzV6L3R5dy84ZlFzM1RMWGNseXpBb0ptazg2UEsv?=
 =?utf-8?B?QlFpZWIyVzRGT2NrVHRrcGdCRDg3NDJ4OWpWN1NLV3k5Q05FS2xEZTA0MXRr?=
 =?utf-8?B?VVVETDY4alBScHpvZDcwMnM4MXFaQ2J3clAyN3hRa0ZaQlk5N2JMOFZHTnkv?=
 =?utf-8?B?VDBZL1V6emc4eXNoZVg1THl2Q0pDQ25JNnZMeWdTd3l5WVJFaFZRTndGTHJm?=
 =?utf-8?B?Tzl4TGJTQ29TeGQ5cmZrb3grVFplbmh1UUNkRFV1SUpmcWVneWtLcWJNaG9n?=
 =?utf-8?B?ZUtXeEpHL1h5YVc0SHBTTVIxbm91UUlBdkk2RGdHZFZMN25tTEVld1EwNXJk?=
 =?utf-8?B?QldzNmRPemlSK0VpY3I3akVyMWYxV2RyUzBoWC9NdXFIYUZ0RzQzM1haVUVp?=
 =?utf-8?B?dkhiQ1YxLzFLSXBOa3A5cUxUc1hkaEhuVStuL0g1dStvUXdBMGRubER4czhX?=
 =?utf-8?B?Mk5qT0dibFJYcE1vNXpXeTBvUkVCRmg5aVdINzNMbDl0ZmNjWnQ5Tnc5L1Vt?=
 =?utf-8?B?RitjUldUQU8zSGpETVV2eGhpRmxEL1ZaUmN2RU5YTmJTVXVybUdSWDBEZHR2?=
 =?utf-8?B?bFgxVC8rKzZ3c0VhNDJwanJnYnpPaGdMUkgrZVliak1JSlgyTW03dGs3UFJp?=
 =?utf-8?B?QnY0bmgvcnh3VnJMOFR2Tk9aTHp4eHQwWWlCbnRqWGZKZzdkQmxnd2pjUmF0?=
 =?utf-8?B?clMrSm01M3NPYXNudmRXOFdXK3lwL25QVUtXaDVVRTFaUGEyd1Q0NTltSXJn?=
 =?utf-8?B?KzFJbWNmRHhTdEwySDFFcGY3clN5NjFUVmNENk9OVkRENnZucWNVZVp4bFRT?=
 =?utf-8?Q?rfWs/MqLgtAYEgH6Kx6DajOdC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfa0eaa-e13a-47fd-f96f-08de312ca522
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 22:54:55.3969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dd73CwmMkxNy+ByCiUYEqMs8mwVD3jyErMvJC0JlLDm+y6mnMbMqiv1zoeOmrmoYZ+El2kCDpXorgUV2ATTVig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6471
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

On 12/1/25 2:50 PM, Miguel Ojeda wrote:
> On Mon, Dec 1, 2025 at 11:18 PM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> But for API developers, the problem with doctests is that no one has ever
>> actually *run* the code. It's just a build test. And so critical bugs, such
>> as the kernel crash/hang below, are missed.
> 
> No, it is not just a build test. Doctests are actually transformed
> into KUnit tests automatically, and `assert!`s inside them actually
> report back to KUnit too.

I somehow failed to really internalize the connection to KUnit (or
to even remember it). Joel pointed it out too.

> 
> It was a major hack to implement, but I am proud of that one :)
> 
> That also allows us to build them with Clippy, to e.g. get the safety
> comments right, which is something normal Rust doesn't support yet.
> 
> We are actually getting a feature from upstream Rust to support it all
> in a stable and nice way!
> 



thanks,
-- 
John Hubbard

