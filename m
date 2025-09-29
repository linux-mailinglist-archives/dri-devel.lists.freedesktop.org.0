Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FFBBA819D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 08:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB9B10E221;
	Mon, 29 Sep 2025 06:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lcl47TYQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010063.outbound.protection.outlook.com [52.101.56.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A40F10E221;
 Mon, 29 Sep 2025 06:23:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwVfSqA1tPWoJjSnXkgQefvNSx2tqA3wLDNn+iGeSBNoatB2ED8RIVMrPiM1j+3AC2qq2BFfTzkBlpIxk1GsmefPILtgZiozB6bOW6zn90eQVrJLc6D+XrLVX4Wigx1us8IzLoU7ThsB2alVZz8YM1HaBgMycWryD5CaDCs6RzGgkEL9KTjN4v02HIUEkiaX7edAwvwOM2rytd62sjAH+VUhGLQWUTvpwSe23kfLiYK3l025YVQ+RQT82IzdrxQeP2br4I6X5X62hPIhLGhTqW5LZrIJ6T3KaNipStfgTUhRgYP4qd2JppXCRi8Aj471/+G0uP1KMs6GCIMpd5zB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CZxoatCCYLQpFKC/zXHDcqfrFWeNdTF7Oq8UjC3dYU=;
 b=vXf+sTErIwko8iheP1OzqM9m5NRIvJiCderjcwexD4XKNEU9pmcxU1DSQz+QpdXvd9xksF1qXiJUCTY7flBHxhsQWBz8zx7SBanzNRUNmraIUA8qUtvmfueUtRHYnw5A6nOZInTZTRUOqRjSPYKwu5JmbUi8aYZ4z6Vb0gEKKtB0b1yhjFz0Z0uAK+rzg7NwvMQZfPLZKES5AYSnxW0f7C54IPv9MC09m5lFO9laVdXBIRsaPY5H9kFmepR8lkjDI4zuJzsjNJAtieQHl4ciE+ZfWuhgAah65cbU/Ni+6UDXEqmmgeaFqDhRXrghEx5P0n1Pr44cByFv7tHWK04Jaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CZxoatCCYLQpFKC/zXHDcqfrFWeNdTF7Oq8UjC3dYU=;
 b=lcl47TYQ5+h8ejIf4TwaSW2zUYcN1IOkHV7BlsAYARfBUsX4jQRqjgbxtzCoIRWE9rML00nCkbMaayWpzJPpFFXrcNKoW5SFmjDkQLe5B0R84OUxQL4selBNRT9jM8Zb2jtayZJ9JtnRVU3LN01jXlTytgwzlax/Qbg2wtUSbc3E0OG7n1cNuwEdnD0wGs/EO6fwlGlLEbEQlK5BNfiqSM4z1yfkscqCNthMJfAKVnPcW6S6smUt6XZZ29gjOg6/qTxS32l92e6h89g/byYW6SrkjCSRIjLQUZBHeA+Ra/5DYOXuY2lf/c15wNjzUkYtBnqdGFDQyrs2WdjSHVdkgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ5PPF28EF61683.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::98e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 29 Sep
 2025 06:23:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 06:23:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 15:22:58 +0900
Message-Id: <DD52GXPTVVNN.33HBTCY3RQ681@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/6] nova-core: bitfield: Add support for different
 storage widths
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-3-joelagnelf@nvidia.com>
In-Reply-To: <20250920182232.2095101-3-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0165.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ5PPF28EF61683:EE_
X-MS-Office365-Filtering-Correlation-Id: 721ce741-8d5a-4a01-98e9-08ddff20a45f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0RKQjBUQ2tYUW41M2dwVTFzTm9TSFgzNWJqMTViNTBhVS9iTkRsNE1kbnU0?=
 =?utf-8?B?emsxS3RtZjhJbTFWRmUzRFI3WmwvWGNvVnY1RVRzK1d2YzhLL3VkSVBUL2ZP?=
 =?utf-8?B?NHlzTVV6NHBsMGVoRlQxM1BjY3VnR3hGd0JwZ1Y3YTJ6VFFqZS9aK1M5NjIv?=
 =?utf-8?B?UVZuT2NlNk5hR2xmVFZqbDUyczlmclJWQmxTZzR5SnM1eDZsZ0s0WEdwZ0tt?=
 =?utf-8?B?TDczRFlvaDlCemQvMjg1cWJBKzNVR3puQmwrS3hKeHgwL3AzM3h3ckZjMUhQ?=
 =?utf-8?B?cTY2VTcyZHhxc3RpdDZjWnM1VkVsc0JCVjdzS1Q2K0ZMRXhPeTc0c2Q0TG1k?=
 =?utf-8?B?TlBqVEh5NjNLb3dBSDAxaGVwNlpJTXNBd2x4N1ZVNnlheTZCRmhlZ3hmRi9O?=
 =?utf-8?B?aFdodEJZZ3JxOENJNnR5OEdWalF1ZHd3V0Yzdk5wNTV6UW9uYnRJVVYzUlJr?=
 =?utf-8?B?NnhmaDVnSkZYQ1FHZEVxQU1XZXN1WW8vcHdYUEorNDEraHIrSWM0R1cwS1Nq?=
 =?utf-8?B?YldnTjQ3L0FwdmVzNklKalNVNHdBS1VFVVNrZHFTaTYxV0VKRTdDbmNvdTdl?=
 =?utf-8?B?MXpPNlAxWWZ6bFU0MkU0QlFUS1N4MVJMQTM4NDlqSTQ2NWdQRllESWpkUDRH?=
 =?utf-8?B?THVTbFlQRnJrT1BrMWE3TncxY0VqeVFPb0EwQ1BZZXpaK2lOZVBESXlWMmNS?=
 =?utf-8?B?RlM3aGJJelc0NWJlQ2VSdUxnZU9RNmk1VGgzam83eThwWGM2OFg5QU9CSW5n?=
 =?utf-8?B?UjZqdmM0bDFvb0tzb3NOSlhiaEhwRy9BRTV1SCtVTkxEU2l0eTFPSUQwVm5C?=
 =?utf-8?B?TFcvUCtVSVJYdGkycVhYKzJ2WXVJZVpCVXhnWTgraTVaUC9GOFk2QVFmZ3lm?=
 =?utf-8?B?ZVR5VTNOcUxXalBTWU9pdUJQMThBeFNQaUd2c0RCZkhiWjhLSmdReUxsZTlM?=
 =?utf-8?B?WFM0M2R0aTQxUFV4SDlVeVFGb0Ywc3o3TjlRa0tGQWlCQko3NmxpM0tTQ3M5?=
 =?utf-8?B?NEJ5a0lYbG5sdHFneEJpakZPd1hHZUYzREUra2c1SHFvbVdLbVpCRzVXRDZQ?=
 =?utf-8?B?TkdhTzV6ZWZSZTlBdEtOSU5KZlVFMGZPSzlxQUNReklkUHFNWndxYjgydzF0?=
 =?utf-8?B?aHlkVHRENDJMRXllLzA0a1EyVUtnVTE5M3lzUEFnR2hJbTBpOVhXQjdSTlds?=
 =?utf-8?B?d29pRUFvV2VHZzVubU96VkNVLzZESUtESlM4SUtTYndxeCtzMUNaNkFYME5a?=
 =?utf-8?B?dnk0RnJzNzVOWktwUjJqS0QxTnovbUF4VVdIK2Mrbm9GdklYUGI5OVZSNzl0?=
 =?utf-8?B?VnNzRzBMVVYrMG8zN1RPcUNyeHdKd3NhSVpMNW5wb3pKTy9JNUMwV3hlZ1Bk?=
 =?utf-8?B?SWZrSWR3UjB1WFlVZGVBV2p5WTZGRUErejZsdTYyN2NZT25RQXl6SVNhK2h3?=
 =?utf-8?B?a3M5RWdEZURyV0VGQlZsQ2JZYUZkMVpTWkRqZTNTSGU2SENTdFZHZjBQc2tk?=
 =?utf-8?B?T1JaZURDdDE1M096a1dnQUhueWZNTURjS1dVdjJaNG1kb1Q0Z25pZWpDUzZq?=
 =?utf-8?B?aTBBaUV0b09NWVQ0QVBzKzluVW5kNnRwQkhuODY3MUtvVU5vaVRBcUVuVnMx?=
 =?utf-8?B?MXVPeUY3eEJGZU9WUHlTRytSMDhMTXRKbWZTWE93Y1Noc3Q3cmVuMnFGbkF6?=
 =?utf-8?B?TUN0WFFWYkw1V3o4aW5HQjRmM2pMT25iZXVLZmZOK1JWV3RTWk44VERWNUdR?=
 =?utf-8?B?Z1hsQ1Q5MldCMng5a2dkdU9DVDZWZWRRTDJnSjByM1doNnY4OWs5dlg2cTZD?=
 =?utf-8?B?eXY5YVpPQzBtYnRqbEQyWnFBN1cvdjkwcWE3Tks5YXhoNGlQeThpeFJTa0sx?=
 =?utf-8?B?Szd1N1QwS1hFTWZXejB2SDZiRzJCQ0Mwc0wyaGVVR21VVG5OMFF3MnU2aFZz?=
 =?utf-8?B?U1J3ckpDajNkWjdrejZiRTlFRDFCQnBaNytPc2xTaFNmM3NJeEttbUZSUmxH?=
 =?utf-8?B?L0F3ak1wNGFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFJDcjIrdDMrZlBCSTUrVy9KZ0pLMnRqNHl1Y04ra0dwYmNMWHdtV1QyUHBG?=
 =?utf-8?B?UGJwdEVsRmtna0tUNlJzaGlJTmxmV2JTb2FRSGt6VGwzYWpVUk9mSHMvUU9Z?=
 =?utf-8?B?QjZ4M0tMaEw0WjBha3JCbHlsdGgzc0JtanFOSmtHU1Nrd1IzdFdMdStlMzM0?=
 =?utf-8?B?akJ6aUhYemNZaTZPUHQ4MGpENTZzZlBMS0pWcFJZemJBSkFzN2g5cm5KaUNM?=
 =?utf-8?B?Smo1S1hzaUFaSU9Qa2FwYXZLdXF2R0VhWjI4bjhIUVBUQlpHbmJ1bHlMUnJw?=
 =?utf-8?B?ekIreWNON3d3bjFZbGNVcXVrN3Q3OGJ2aE1YN250cDl3eHhsanR5SExHVVpr?=
 =?utf-8?B?NmlnZWN2OHNWK2lJeDJ3NjhXa0kxNTJ5b1ZFQlloZGFTY2M4ZjFzVy9OdWoz?=
 =?utf-8?B?bVg4R2NMVnRqWnZzOGxaSlZZTDg4dnlIQlRxK0JuRml3dTZSQTFxcW9BMGdz?=
 =?utf-8?B?Wkp5RWNnT0k1ZkwrRDA1NVNweGhySlJ4bmtjWW13b2xzQTQ5dmhHWVFubzdJ?=
 =?utf-8?B?MW9lRG9sVnBvOEU5QkhlZ2M0YlhzMCs4N3oxYnpGMWdXc0diZk1SamQvcXRi?=
 =?utf-8?B?ME9ScEVFbVpnMnBWOExxRkJxR3pnK2lONVVSbUEzMG05N1luSGNMVTdOZXFB?=
 =?utf-8?B?QW5JTkRibFZRL2NZcVdjd1BzT255cUFTTi81bCtaY0FIcmdoZ0dNMk50OXJD?=
 =?utf-8?B?Si9HRnFZbkJZbDJSNUhUbS9wRHp5aHZwYkhFTlQ0eXQvN2t6aVE0SXdXQ3l2?=
 =?utf-8?B?OTg3V0dNYmF4UktIR3cxS1M3WnYrZ2x5TWNHUkRiclYrektxT2oxeHFOcUFT?=
 =?utf-8?B?L1hhTWRZLzZiMk5KMmdGak11NFBNaytIbXNXRk5jUy8yRklhbld3OWtiK3Rz?=
 =?utf-8?B?b3NWSjhLUmdrZXJaOFpQbW5YQTZrODlsYlRjdmthV2dLQzR0bk8wRlVKK3hu?=
 =?utf-8?B?M3UwOUpBbHlpWWlxQWMzcTB1dFNuYnY1ak1mc1MxZE5YVWhyTjBxWU5Ua0ND?=
 =?utf-8?B?cDBORmJFWDlFVzhnOVY3alU1WlQvVldzVWhvN2U4UEF6UnJmNDRYWmJKT0h4?=
 =?utf-8?B?T1E2TW5VL2lLUEN2SkloS1NOd3BZdlZQaTRTU29kR25zUDJhVDNXRFlyUkNw?=
 =?utf-8?B?VEZka3F4TENUNXQ5RldHSGJ1WUxURERFamRUQ0ZUalN1enliWi9PV2xjTHhT?=
 =?utf-8?B?dndWSUhBbm43MGlueUZKdExTWFgxQU9ublhaWlN5cFJJTFNjK1Zwd3lTM3Nl?=
 =?utf-8?B?empjNEY1eUk2c0dLSnFmR3RqdTRXakJFMENrUkNWRGQ5OHIremdsQXcyS3JE?=
 =?utf-8?B?TWZaTnB2bnBQZm5xV0xYZGhaS2YwK1JibWlQTk5DQmVKbnpJM1F4blphK1pt?=
 =?utf-8?B?MDArcjNFUzBwSVhhSWdFMUdXMDM2dUlnc0dLQVRQbUxZVkVxWm9pTlUxVVdJ?=
 =?utf-8?B?VldvajNtbDE0dEROc3hCNXlKdHpGNkUrSS9JTHFzaWZCNnVTdnh4dlM5aUNn?=
 =?utf-8?B?eDdUVHJGdXNLb0lTN3dwWm9IalJySWlPN3o4cjVGdHE4ek1GZ05mMDhHU2xL?=
 =?utf-8?B?ZWRoaFJ0MHRHOFZqMTVESTFEeHBqT080aUhNM3ZFUWQwQ0hEYkRTYy82Tnlx?=
 =?utf-8?B?enRLQ0cvWUNLOTNBRGVFb1FHUjl2ejhIQSttSTVpM3lwemV2UnNadnBCZGEy?=
 =?utf-8?B?VzJPVEh4TC92bjdvbjVlN1U3SVp5RHF2d1BlcWpSZEFFdnBWUFJ1ODNxWjV3?=
 =?utf-8?B?VG4rUTU4SjJHUXl2WFFMbDlVTExLajhOYnpMT0FQb3d6aUtKSm9pMnk5cnJ5?=
 =?utf-8?B?MHdWclFFa1F1bmxlaHdCSENaTGZLNDY5SkZTcGRua2VnY21oVlY4aUp6T0tM?=
 =?utf-8?B?T01JSWZpMXIrS0plNXVjcTVWK2Jxc1dTejdTNGdOMzFTd0hVWHkvRno0ZlRr?=
 =?utf-8?B?cm81YzBYVWRHY0tRWFZSSW52cjhFckNWRnpXcUFDVzRic2FrZ2ZWc3NpbkxQ?=
 =?utf-8?B?SllGWmJwOWRDaExOZDhlc2NIL1pWaDQ4RkN6cU5paElEOVhzRzBwbVB1QTk5?=
 =?utf-8?B?ay9nRi9FeG8vZFJhRE1LUG9jaTVaZ2tKMThHQk9NSDR5Rm5ZbDloMWxIME05?=
 =?utf-8?B?c3FTelVONG1vZUJSQVNqejVKMEZQVVVkb2hnVnVOR09WVjNyOXkwMXRZYk9O?=
 =?utf-8?Q?mhHZ7Lhr620BYUWrKpxi1xHgnK27wOB+StcCfKA8e+5+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 721ce741-8d5a-4a01-98e9-08ddff20a45f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 06:23:02.0140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vW/2qx5OdWDMl+oZx2XShISrTlBFIwHSI4D6Zp8QW36HBcyeVDrHeJ74wkInfYRK1ZsLokhdgfbK4xoEy0zRqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF28EF61683
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

On Sun Sep 21, 2025 at 3:22 AM JST, Joel Fernandes wrote:
> Previously, bitfields were hardcoded to use u32 as the underlying
> storage type.  Add support for different storage types (u8, u16, u32,
> u64) to the bitfield macro.
>
> New syntax is: struct Name: <type ex., u32> { ... }
>
> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/bitfield.rs    | 71 +++++++++++++++++-----------
>  drivers/gpu/nova-core/regs/macros.rs | 16 +++----
>  2 files changed, 52 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bi=
tfield.rs
> index ba6b7caa05d9..687ef234be75 100644
> --- a/drivers/gpu/nova-core/bitfield.rs
> +++ b/drivers/gpu/nova-core/bitfield.rs
> @@ -51,7 +51,7 @@
>  //! }
>  //!
>  //! bitfield! {
> -//!     struct ControlReg {
> +//!     struct ControlReg: u32 {

Haven't we agreed in [1] to align the type definition syntax to that of
an actual Rust struct? E.g. `struct ControlReg(u32)`?

[1] https://lore.kernel.org/all/3814d6b7-7551-4e8c-b78a-4ac6236eb406@nvidia=
.com/

