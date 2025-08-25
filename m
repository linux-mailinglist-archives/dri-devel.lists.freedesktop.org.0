Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C4CB33DAC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 13:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A2C10E43C;
	Mon, 25 Aug 2025 11:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cNNXjI7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2431F10E43C;
 Mon, 25 Aug 2025 11:07:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lgz9kr1N7rN8DK/eYCsJa7raoAPlpfxjXJjQ24OQXKUdJC8Vvyj/PosMBLhTqCNAJABulxic+hyTaUYO8LHWGIV2AeoHwOOt6yIuA7Ie8zevldWBt8NScJ+tJEe5j5OaIsfnf4BQdlm6xQigbX8vOt6uklU3rOY4zSTBBNSh5T2nzkrpOwCyI7eqbGlhyHxfGGAiWMRIR89w/xVnSExhJlmalS3l/e5/0Z3AmJf6PH4MUCRpPg4/t9LVJ1O5mwVRUBezdu/FohgjHAi6XjXzUBvI/OEVOuynwdP6SUCNPAX5Rrmr+QaSQbEaFdRHPCrwX6nhod0+4EkKz34Euz3JAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNylrfAZ2TP1p0k+vc1bZUY6NBj99Eq2PStQQnjo324=;
 b=Tln5lUu8gI1tsF86Fd5WqEyh0JsTwG1v8DvlZaPRmt4eYed1A0Axz6o5SUV13H3g04M/w+bmPC310neodXfDCmUarJmV9BRfxF0fckQEn2C/w54IHfxHLAqd3FUJwGWaY0vbAqEedBjio1kY9DJX01Eai+07Tu9lxuHbAwdam6ZOwvr3xMJBrQWnW1OJL8sN4vstgQq2LFPYWLZnu8m76fMuQ6Ff688GLCzkCY4UmmMmU+oq7j2QtpbjV3/LllFWN/svkSy+9p1V4O7dcZOidtrXvrAnyShEjnCfZOf5KYQoSwkkDzDpLZEEpMwVPhmePUsFvo3Ary0uE3qG1ylChg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNylrfAZ2TP1p0k+vc1bZUY6NBj99Eq2PStQQnjo324=;
 b=cNNXjI7vVuZlMJ+LKV659OoAlnK0Wf5MOyVIF9Wz8tRjGq9UmXnGdtpwCNc36VFTyA7DUsYzD9SlnfoEO4WUq7ErZ20r69g9dLNwz0ldYaUx4oFe4TMTTr4TBfJvaGDmb/gJI0bFA4SWf8LTAsuz2sa11gbxJtKZpHRt6NSC0CfLyUYRgQDclSIJZ87cln8SX8LrSFvelhB0jYA4sZZjv1cK9TOb+REndtI8u524QsDgl6x6bUWYk1bnKB6RP7gWlXA75p0eQSOzSMJkNaPZhnP6AznioiUcweDNr1zmllA46hROcDbqRnCthRiV1IadYiv0ljzr/LXZuADjMKbtHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7184.namprd12.prod.outlook.com (2603:10b6:510:227::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Mon, 25 Aug
 2025 11:07:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 11:07:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 Aug 2025 20:07:01 +0900
Message-Id: <DCBGLCQVD1RF.6V5UT0NQ4GLB@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
In-Reply-To: <20250824135954.2243774-1-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYBP286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::35) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 57db365e-d5f4-4736-461b-08dde3c78700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U09hNG1qM2g5MW1ZeU1vRzBlRC9KNS9CMS9XdWo3RmtVUXBMNUNGQ3FIUTdR?=
 =?utf-8?B?RS9sY2pUbzRWTmIvSFFqYm5BTldsamRuaWU5bzdsNEU4N0k1L3JvaGNNWjh3?=
 =?utf-8?B?WG9WdTVjbzNEWnQvSnBKbytMUUp5OGF2VWlBeVlNWGNETVloOXR4MElhNGRK?=
 =?utf-8?B?M0VRS2F4Q0Fnbml5bzVNbWMwRXI0Z01EQzJ4aGxERTdtVUI4bVNienNGMXV2?=
 =?utf-8?B?TVdpdzFUY2lNTFFQeW5zZ1M4emNCWW8wOW1aaElWMlF4dGVMdjUwUDNLWkV2?=
 =?utf-8?B?YnIydnk3Uk5OWHNDaXJ0VmpZUGhlMythWno4SGRzN3habkFkc1U4N3Z3QmN4?=
 =?utf-8?B?VDVKS0xpak40djNNZi8wVTIwbWc1Z2ZOSTZTSVZ4cUVBMWErckxPM0RTb1lI?=
 =?utf-8?B?TWJiZCt6OXNyZkZqdVV0Y2EvR1VnVHV1cVorNXpZemIzNXRZS0Y3L0RaVWpS?=
 =?utf-8?B?c3Izems0aFk0MHcxQk4ycVBGMU5waklRK2Zqd0ZRYllpNytPL2tNZ1VZaUFr?=
 =?utf-8?B?aWpqL1VGeFhHcUJIQmtodFB0dUMxZUMvRGN3UkxNbUIxOGdkMWdLNG5yemZZ?=
 =?utf-8?B?dnhVUllMZjhNejdzSE5jNUpZcjVuZTdPMDN5RGljRTB5TWxQeWJ5QkVzTjcy?=
 =?utf-8?B?MnpwektnUGtTRml5UC9IL0RiVnRheUtnMlQybE81OHNOOGxKUWhEbTk2MEtE?=
 =?utf-8?B?eURQdVhQTzhlNzB0Rm9vY2xnM2hTRExjN2xrRzVlNlNZZlRIWUE0ZkxBR3F2?=
 =?utf-8?B?RStuMW9PSzFhcHhtamx0aERBTnVYTDYxRXJKMDV5M2JSWU1Kak10QnUxbWQx?=
 =?utf-8?B?Z3ZqcTVQOWkzV29qNUZKZkFvbzNUbCsrcWdDTmVuK2JONzVPb3luUlA0U0JU?=
 =?utf-8?B?ZkIzMk01Um9uei9DZFZsSStjYTFKbWd2SFFyeXBYbW96a0FFSEcweWNFc0wv?=
 =?utf-8?B?YkprV1FnRFJFYlI0ajQ1WkJHVVNIQnphbk1rV05YQkJiYnhlcHBpRVFBam4y?=
 =?utf-8?B?S08vOFdhcS9GZXpzVlY0VDdXUHVNT00yOHd3UHJEVWR2SmxBMmFyNVJwRHFy?=
 =?utf-8?B?b1BtcXg5ZjcxK3pPdU5pOHh3UWhQNVhUMDNWZ0xMVmlPYmJGZnB1ajg4cnZF?=
 =?utf-8?B?MHEzNll6dGlWcGlESkVuYVNnRFp1WTE2cEQ5Tm1kSHdscDJDcnZENENQaTJH?=
 =?utf-8?B?VjBVQ2hJVlMzUGxhWEpJWUhwczZYS0x5OHh1R1J1MUhtTDJFdjd5V2dPdjhF?=
 =?utf-8?B?ZHI0a2EvRGViMlJjYjNKYmRkeWlCeG9IdmE5a3h5aWxXa0tZdVg5Qm5Nc0Jz?=
 =?utf-8?B?Q05zZGNidk1HODVIaDZzcTM4cHZmcU1acmkvTElkbGpxSlZST3JQS3ZNWWZT?=
 =?utf-8?B?djJHdjljekcvQ1I0L1cvb3kvWkFUWU94NzhUZUZ3OEFJcXhGVG5ZMTNhRG0r?=
 =?utf-8?B?NFdPSVRZT1dvWU1FOHlCL3JJVFBOM3pyWUxRbGVXRys4bHIvOEdVb2RsNmdr?=
 =?utf-8?B?MU94NDAxaXpubEJteWxvaDFMbW9qVi9xVlpBYkJaL1FKcXRZYXUvUWxMUVBT?=
 =?utf-8?B?QlBqK1Rzanp3THVHbFBYRitOS0ZvdGhMU0pjM1BVQ3FXVVI0UnVwdWV4TGhN?=
 =?utf-8?B?dEtLZ0daMHk4RnRhK29DdDVIRlVQWnlIcXplUEhXTVFSQlNMZFcvd005VEZ3?=
 =?utf-8?B?UkVQVWNqRjUzaTlibWFTVEFZdTlsMnpRbTJnOEhVUXNydGhTU1FiUGxmaHpa?=
 =?utf-8?B?dWRLaUFuNXluMFVndE1NS1RrM0RZVS9kVHB5U0RwZERFZGdnUFlSN01kSlFP?=
 =?utf-8?B?TTBOOXNIb2U1UkdpVHFKVHJpQkwyenBVQVhaMDlaNEpZRjg3UmRzczM0YWF5?=
 =?utf-8?B?UFpjb29Gd3VScWRXa1pZaks4N0x3SHRWQkcwUllNV1RpdTE2aW5TcjdtYlYy?=
 =?utf-8?B?Y3dTeXVwT2h4cTV4YkJkNXhJcEZaK3BBZFhVcjE5aGpDWlA4N0s5MVN6eU1V?=
 =?utf-8?B?Q0ViZW0vbHdRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXI4RlIwdWdmeldrNzNsemZ0R1RGV1cwRnlEUWJ0MWxiRVgxajVxaThPRHJq?=
 =?utf-8?B?dWMxdGJZRmw5RjY2MURkekJkN2Q5M1BuK3hGbWY0Z0RCRkJYMkxaMm12RTB3?=
 =?utf-8?B?dTJrSHozZHBWeGlONXpPWjhHTTkzYmFTdmZLN1NnYUNHaWFlb3psMWZINEFE?=
 =?utf-8?B?YmNsS0tUeUE0UDBmK0xPWGp2dmdVWnNhTWJzQ3RLZkJ4N0xLUzUxQjIxQnpD?=
 =?utf-8?B?NkIralZJNEZqcm5IWkpHSTRhVnJzcTFNb0FKVDZua2k3MWl4ZTF0cVpjK21P?=
 =?utf-8?B?V3JSR3pYN3hZc0c0aitjazlFMEhmL3ZhaUtyZFpWSVV2bkx3cjhzbEpCNllY?=
 =?utf-8?B?TkhocnpMN3VNODZKb0VKZ1NibC8zOGdjakNGWVVnWnJUVkQ0WHNKblV3ellL?=
 =?utf-8?B?QnVZMDU5UHlVcW83eUtBSDcxcG16VTU3aHlWbXBwK3J2aHZ3TG1PYXhJdFZr?=
 =?utf-8?B?OS9tYTZvcmJsNFJsTzcveGdrY0pLdndVd2FWRDFsZEVwY3RsMHlKUTgwYW16?=
 =?utf-8?B?QVF5eEpVbzJmYnVCMFlxZll6Ulg5dVgyVUxmTEhRSEZaRnQ3SnRxOGNqaHZ4?=
 =?utf-8?B?OGRSbWk3RzRrMHBzOEd5R2g0YUVPT3E2RjBLZzMvNHBybGFYbEF3Ry9hdzBm?=
 =?utf-8?B?QmJPYit6U0Zvbzd1WHdBUHdJNWU4Yi9TU2pjQTN6OFhPdUROUEJmNzUyMCtL?=
 =?utf-8?B?Sm9tSEtGZ2hzYW1nUGFXZnN4RVdGWXBSVk8rcmlmNXIvOTFNYlFPeW9VTDJK?=
 =?utf-8?B?OUxKV1JHcmgrWFZod2cwOS9pMFB4L251ZEdpcTBRMjZHSzBDUGc1akx6QXB5?=
 =?utf-8?B?L00ySENOZ2dsWGJ4WnBsOW5HUzJCR2U5c2ZQcXlPZkV4TWJZMmt2eUxBd0lt?=
 =?utf-8?B?Y1FodTh1SE5DWHZjdmRSR2tCQzMzOW50VkNQMkF4VDVEWjRuMm1JQ2tnSzdp?=
 =?utf-8?B?MVNUWnZZMWNKQ00xeERxSVNDTEdIVUR6NXY2UU00VmgrQmlXZUVqa2xMMXB0?=
 =?utf-8?B?NXpFMDRaeVlIZXJRMmdiajZQUXRaUVh6QTRoM01uR3plbFZFSzdYcTBBVzZD?=
 =?utf-8?B?a1p0ZDJvL0ZSQXMyMUEyd0FYTk8rK09LNlJrRTRUQmdtbUhLeFQySFZucmVU?=
 =?utf-8?B?YklRdC9NTDJWNFRXRnV3SmkvbWpBMGtNMnRBRFRXaHpOZ1NrUERXNkM2aVd4?=
 =?utf-8?B?MGFlTUxIQlNockxGcVQrNkp5Yk1sNk5SV09NTW95a25sTlcrSmNkeW45RVBH?=
 =?utf-8?B?U2MwSVlibkR5SHZWM3JGZHNtc1JqeHdOSVNYcDBDcjdPUUdCcDAxUEt5UTJm?=
 =?utf-8?B?VTN5WTVBUk4wMHQ4bmJUUCtCZGlMb2FsbVBHbmF5L3FMdFpUQzR3OFR1Yk41?=
 =?utf-8?B?RjQxUTE0OW5ydkdjdmdGWXluY0JtMjlBOGNCUktnVXMra2dMa1NNYVRJc2x0?=
 =?utf-8?B?TkZveDBBeGVCNURaenU2Nzk2K1dWYmNkZldVUVE5VW1McDJVVEszdkkvQWl1?=
 =?utf-8?B?UFF3NnBSU2xSZStKVGEycDk0SnhTbHVONnZGanlTTzB0V0FJWVQxa2ZQSEp0?=
 =?utf-8?B?YnVONkZUaHA4THNYZkFFT2ErdmljOFlxSG9RNThkUnYyNlI3RmhUKzJZWGRv?=
 =?utf-8?B?cFMxZmtxbmpGR3dCbEc0Y3dQb2FWZjI2akh4by9GY1c4N3AvaStwR3JsbnFT?=
 =?utf-8?B?b0VrYm1tczEyVGxwdUZYQ1NUV1hUMmhHUTZXTk1TWkpOYVMrN08yN1MrTW9E?=
 =?utf-8?B?ZDREcStYOHJWUmRvR3VmMHBtYndsRmhLTzVzTlNxemdGbEVqRS9nTEYra3Bz?=
 =?utf-8?B?M0NscU0zSTdLSkREWEV4TVZQblNpL2dnTUtGU1I1NWg5RGREV1dmU3BmN29w?=
 =?utf-8?B?M1J0UGF0eTZUN3lvL2RGRnZTazVtUFJkZER1ZHJtaHBqdC9KZVhQa0hNa0hO?=
 =?utf-8?B?TEJxQ0NZWHB1dVpnY1hLL1dBOFFodHlmcjNvWWJZQ1BjN2oxL2Vob0V5SWR3?=
 =?utf-8?B?bEUxYTh6aTRVMUp3Q2srYmJTQlQ0Mm11M2VHTXI3RFRUL09MYWMwejBVTW9M?=
 =?utf-8?B?dnEwclcwcFFSN2REVUN0eU9nWDJNYVNpRWN4Y1dRTTVhUVB2VnBpQkpHT3lv?=
 =?utf-8?B?WVRxRU83dmxtaW4wTjlYQWYxS3N0eGN5VkZmTEp3aDhYTS9aNUlhY3FNUmU0?=
 =?utf-8?Q?spnQebYUYKw3pj5sYcD/ttcnwB5ionJsj3OB+YLbVLPX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57db365e-d5f4-4736-461b-08dde3c78700
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 11:07:06.1336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4/hFsNIXejVI81M+2/TjsSZZ3uVE2Fdg+b2rfGAzcNzI4sRUnKmoCkfBp070VipwgWFdS8U0CQDLHd3l1qjyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7184
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

Hi Joel,

On Sun Aug 24, 2025 at 10:59 PM JST, Joel Fernandes wrote:
> Add a minimal bitfield library for defining in Rust structures (called
> bitstruct), similar in concept to bit fields in C structs. This will be u=
sed
> for defining page table entries and other structures in nova-core.

This is basically a rewrite (with some improvements, and some missing
features) of the part of the `register!` macro that deals with
bitfields. We planned to extract it into its own macro, and the split is
already effective in its internal rules, so I'd suggest to just move the
relevant rules into a new macro (as it will give you a couple useful
features, like automatic conversion to enum types), and then apply your
improvements on top of it. Otherwise we will end up with two
implementations of the same thing, for no good justification IMHO.

We were also planning to move the `register!` macro into the kernel
crate this cycle so Tyr can use it, but this changes the plan a bit.
Actually it is helpful, since your version implements one thing that we
needed in the `register!` macro before moving it: visibility specifiers.
So I would do things in this order:

1. Extract the bitfield-related code from the `register!` macro into its
   own macro (in nova-core), and make `register!` call into it,
2. Add support for visibility specifiers and non-u32 types in your macro an=
d
   `register!`,
3. Move both macros to the kernel crate (hopefully in time for the next
   merge window so Tyr can make use of them).

A few more comments inline.

>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/bitstruct.rs | 149 +++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs |   1 +
>  2 files changed, 150 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/bitstruct.rs
>
> diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/b=
itstruct.rs
> new file mode 100644
> index 000000000000..661a75da0a9c
> --- /dev/null
> +++ b/drivers/gpu/nova-core/bitstruct.rs

I wonder whether this should go under the existing `bits.rs`, or be its
own module?

> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// bitstruct.rs =E2=80=94 C-style library for bitfield-packed Rust struc=
tures
> +//
> +// A library that provides support for defining bit fields in Rust
> +// structures to circumvent lack of native language support for this.
> +//
> +// Similar usage syntax to the register! macro.

Eventually the `register!` macro is the one that should reference this
(simpler) one, so let's make it the reference. :)

> +
> +use kernel::prelude::*;
> +
> +/// Macro for defining bitfield-packed structures in Rust.
> +/// The size of the underlying storage type is specified with #[repr(TYP=
E)].
> +///
> +/// # Example (just for illustration)
> +/// ```rust
> +/// bitstruct! {
> +///     #[repr(u64)]
> +///     pub struct PageTableEntry {
> +///         0:0       present     as bool,
> +///         1:1       writable    as bool,
> +///         11:9      available   as u8,
> +///         51:12     pfn         as u64,
> +///         62:52     available2  as u16,
> +///         63:63     nx          as bool,

A note on syntax: for nova-core, we may want to use the `H:L` notation,
as this is what OpenRM uses, but in the larger kernel we might want to
use inclusive ranges (`L..=3DH`) as it will look more natural in Rust
code (and is the notation the `bits` module already uses).

> +///     }
> +/// }
> +/// ```
> +///
> +/// This generates a struct with methods:
> +/// - Constructor: `default()` sets all bits to zero.
> +/// - Field accessors: `present()`, `pfn()`, etc.
> +/// - Field setters: `set_present()`, `set_pfn()`, etc.
> +/// - Builder methods: `with_present()`, `with_pfn()`, etc.
> +/// - Raw conversion: `from_raw()`, `into_raw()`
> +#[allow(unused_macros)]
> +macro_rules! bitstruct {
> +    (
> +        #[repr($storage:ty)]
> +        $vis:vis struct $name:ident {
> +            $(
> +                $hi:literal : $lo:literal $field:ident as $field_type:tt
> +            ),* $(,)?
> +        }
> +    ) =3D> {
> +        #[repr(transparent)]
> +        #[derive(Copy, Clone, Default)]
> +        $vis struct $name($storage);
> +
> +        impl $name {
> +            /// Create from raw value
> +            #[inline(always)]
> +            $vis const fn from_raw(val: $storage) -> Self {
> +                Self(val)
> +            }
> +
> +            /// Get raw value
> +            #[inline(always)]
> +            $vis const fn into_raw(self) -> $storage {
> +                self.0
> +            }
> +        }
> +
> +        impl core::fmt::Debug for $name {
> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt=
::Result {
> +                write!(f, "{}({:#x})", stringify!($name), self.0)
> +            }
> +        }
> +
> +        // Generate all field methods
> +        $(
> +            bitstruct_field_impl!($vis, $name, $storage, $hi, $lo, $fiel=
d as $field_type);

Maybe use internal rules [1] instead of a private macro (that cannot be so
private :))

[1] https://lukaswirth.dev/tlborm/decl-macros/patterns/internal-rules.html

> +        )*
> +    };
> +}
> +
> +/// Helper to calculate mask for bit fields
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_mask {
> +    ($hi:literal, $lo:literal, $storage:ty) =3D> {{
> +        let width =3D ($hi - $lo + 1) as usize;
> +        let storage_bits =3D 8 * core::mem::size_of::<$storage>();
> +        if width >=3D storage_bits {
> +            <$storage>::MAX
> +        } else {
> +            ((1 as $storage) << width) - 1
> +        }
> +    }};
> +}

Is there a way to leverage the `genmask_*` functions of the `bits` module?

> +
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_field_impl {
> +    ($vis:vis, $struct_name:ident, $storage:ty, $hi:literal, $lo:literal=
, $field:ident as $field_type:tt) =3D> {
> +        impl $struct_name {
> +            #[inline(always)]
> +            $vis const fn $field(&self) -> $field_type {
> +                let field_val =3D (self.0 >> $lo) & bitstruct_mask!($hi,=
 $lo, $storage);
> +                bitstruct_cast_value!(field_val, $field_type)
> +            }
> +        }
> +        bitstruct_make_setters!($vis, $struct_name, $storage, $hi, $lo, =
$field, $field_type);
> +    };
> +}
> +
> +/// Helper macro to convert extracted value to target type
> +///
> +/// Special handling for bool types is required because the `as` keyword
> +/// cannot be used to convert to bool in Rust. For bool fields, we check
> +/// if the extracted value is non-zero. For all other types, we use the
> +/// standard `as` conversion.
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_cast_value {
> +    ($field_val:expr, bool) =3D> {
> +        $field_val !=3D 0
> +    };
> +    ($field_val:expr, $field_type:tt) =3D> {
> +        $field_val as $field_type
> +    };
> +}
> +
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_write_bits {
> +    ($raw:expr, $hi:literal, $lo:literal, $val:expr, $storage:ty) =3D> {=
{
> +        let mask =3D bitstruct_mask!($hi, $lo, $storage);
> +        ($raw & !(mask << $lo)) | ((($val as $storage) & mask) << $lo)
> +    }};
> +}
> +
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_make_setters {
> +    ($vis:vis, $struct_name:ident, $storage:ty, $hi:literal, $lo:literal=
, $field:ident, $field_type:tt) =3D> {
> +        ::kernel::macros::paste! {
> +            impl $struct_name {
> +                #[inline(always)]
> +                #[allow(dead_code)]
> +                $vis fn [<set_ $field>](&mut self, val: $field_type) {
> +                    self.0 =3D bitstruct_write_bits!(self.0, $hi, $lo, v=
al, $storage);
> +                }
> +
> +                #[inline(always)]
> +                #[allow(dead_code)]
> +                $vis const fn [<with_ $field>](mut self, val: $field_typ=
e) -> Self {
> +                    self.0 =3D bitstruct_write_bits!(self.0, $hi, $lo, v=
al, $storage);
> +                    self
> +                }
> +            }
> +        }
> +    };
> +}

Yep, I think you definitely want to put these into internal rules - see
how `register!` does it, actually it should be easy to extract these
rules only and implement your improvements on top.
