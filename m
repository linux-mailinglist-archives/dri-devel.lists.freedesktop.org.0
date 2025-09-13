Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99911B56161
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 16:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53CC10E1EE;
	Sat, 13 Sep 2025 14:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JetPokkY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8F110E1EE;
 Sat, 13 Sep 2025 14:12:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZM6Ao9l4Vc+urjf9LTkcO52qbuXRCxzNRkrhH4HRBlcxXSi6libMWcBtVQkWODN1ITAwrniVYEEjVdDhr8RFW7/xY7zSZ86ywi7ikPJzYGaonDKAuLumzDQ8oNhNxtzD3SCXYBxyaMwEk5WYGoIFmOb94FlzbS0YvQU3c8/LbiHvPvfJKzMO2YvUUoaU72bX6Cca5g6sejaiflnKv4Mvy7AXwH/H9b3nXrnHxtzVp4QuUebkieh06pxmvu5SOAhoTwYrRA89Ddxwdn3SNZPvelTxqtjyE92SAK2Z7cTHNeQZNpfE/pvaeaPe0wArbQaIQIf6l6GuG5xBZ0+qiEXRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1oHW0wqp9KGXCrCQfKn+84GnXBVKObyeZlvB6YSDsUQ=;
 b=mbhrOoz/evGqOe1W2H7ZfiuiRYt+YiBnIcgkJlvtvA6YHgckacDypiuwoqkZ85kS8mhZVy+J/tyQCRSVpZEUtsFS8eR9WzUia1B2nIJJuHaeMCPV9ub/lt77GyPRYOq04IeAg04O6Jb0P4cv8RsykRAmhHmMDddCDYv/l5JWEoMCchxy/93URVzhEIkL9xEy7hTKoJ5scqCVsBR3gX8BlErFGEtoNiMhsB8vCzCUvFM+qwNb9/8cTZidEhkRbEvhF00wmZEIBGHQ7Wj+gznjwpC1Efsk7bUs5gTb6RHJLfTpRo3HFiBXuLTgrN/ZjajQ4VaVQDxgSxzgekhcwykTzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1oHW0wqp9KGXCrCQfKn+84GnXBVKObyeZlvB6YSDsUQ=;
 b=JetPokkYq398Ae0D4dwhKNsdO+d/CqlsJhqJvrGpKWoSsT4jMkxUH+n0S5lHxKmIi9Iry97m9xWKS7mdDm3XcKmN51lUdNICxe+dL55L+zYA+deSTyKlkzy7k2tFUwclGC7I480VoZd+xEsDLbkRE2yXJzdOve8HZBH/OSk55RMDOdcd+Y3ASQkZzvFVXrat6ZCtfFwtQnsBooOp/jvP3NzLSBl9tR3bOr0KCSgJ0Um60NdS5ohdPcYQmWKqVUBTYpM+J+ZmHjRcJWSR4s1iEv68rz7DQFn9T098hcdkudpHk2ehlSwHoz05wmKp8GUjXZFS4VHZ8wRd8dzxcVB95w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY1PR12MB9583.namprd12.prod.outlook.com (2603:10b6:930:fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 14:12:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 14:12:28 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 13 Sep 2025 23:12:15 +0900
Subject: [PATCH v6 02/11] gpu: nova-core: move GSP boot code to its own module
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-nova_firmware-v6-2-9007079548b0@nvidia.com>
References: <20250913-nova_firmware-v6-0-9007079548b0@nvidia.com>
In-Reply-To: <20250913-nova_firmware-v6-0-9007079548b0@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY1PR12MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c56ebe-067d-4151-2d1b-08ddf2cf922c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWNhR2FKN3ozMEwra1BkaUxibUQyYWUvdEhjems5dlhJVnpSZ0h1bjU3a0NU?=
 =?utf-8?B?ZW4zOUYyV05CTkZCZjVydXBMRGlmbEQvY2J4VmR1RFVkUjRsNjlBNlVSYVBR?=
 =?utf-8?B?K3RvL1AyUjhwU0pDRGFjMjc5L3hjNHNLNVhyazJaRzU2TVM3akMvelNsU0V3?=
 =?utf-8?B?T05FakllTzQwbW9xa0dsNkNOUENTNG9oL3JxV2hXMmpXS0ZIWklaSzBJUTQ4?=
 =?utf-8?B?WFlhaEh1WjNFVHJlUFJhYmJabWlMTWpUZUdPOElrSGpzS3VHcXJJUjYvOXpM?=
 =?utf-8?B?Q0R3QmNlUi8wemNRRndnenczUmhyNUllZnNJdjhQSkNDU1diOUNrbUp5aG1y?=
 =?utf-8?B?cEFLS044V0Z2cE9hbUlsSmpJc0VPS3g0TGE4WW55S0Yzd2JxNWRmTnBXdGZB?=
 =?utf-8?B?Y2hRbllYUGN0WTV4STZiMHU0YzRrYkZFZlNHcHkwOW44R09USkNiWXhEVmlX?=
 =?utf-8?B?QWgyaE9yc2x2ZTJvQjd1TkJpbVR4S3pHNzRab3ZFaVQ4VG5oV0RXWGlvK3Bw?=
 =?utf-8?B?cW84YUhBTjBlRCtaZXlKMWdtQkpNeFJKUzJLcWx3T3JSRVV4NC9ZZ1lBdTZm?=
 =?utf-8?B?S2tndm1zaU1VbmdHeWNiWXlLRjJ6SVF6a0Q4aFNOaXJSMllSNUtmZkNONUpJ?=
 =?utf-8?B?eGc5Tytwc3pQZTFoWHh3V2gwTG1EU2pvK0ZXTkNzV01vdkxCV3RES05JLzla?=
 =?utf-8?B?OFQ4RWFBZnVvMGZoYTlDSWM5MDc4UHQvR0lWUG1JQTVoSXVRWW9zT3dvd2lR?=
 =?utf-8?B?ei9jWjNHVDlzN1U0eFUxSG1EMzBaM3FpV3VNUU8wMTlmdWtacWcyUmVmUGlY?=
 =?utf-8?B?NUZqQTZhYkJiY0ZrY0pSZHd0U1d6NnlDdHRLTndrM1ZoOXYvVmpCVGpscGx3?=
 =?utf-8?B?aWtmcCtBY0R0anZweGtwdnFXZlJvMnJVNEpRQ294ZnFCakRkNUd6UTBNU2Ix?=
 =?utf-8?B?UzNId3c1OUp4ZWdSUGxGdXpIaFVOMHNmMy9rSWtnQmdGWmlZZWVKbmxobG1U?=
 =?utf-8?B?NnlKVHJZamxYeTJOcytrT3B4QjNPcGFXVllRdk9wRCtJcXFEYVJxQkxWNXI5?=
 =?utf-8?B?dVh4N3FjMjRrTXZlc1hqWWNiVjcvU2R6eVB3QTVEVVVrZHdkSnFERFVOUm52?=
 =?utf-8?B?UFowaVFBRUNmWmNNY2tqKzFUaUpzajhCS0xPVjNOMVFiaE43aDU5VTV2UkNt?=
 =?utf-8?B?UG94ZmZlWnBoRHdnNTZKNm15K093Qm1QNkNUTjRTaUczdExwcWc4aEswdWNC?=
 =?utf-8?B?Nmc5dmpVQWh0dDlIaWtxQnAvR01oZkk5MlQrSmN5WXdBYjRwd0tGMHVGQlJ4?=
 =?utf-8?B?aUFKbkpZcG9SK1J6SGtpb2h1UzNYVGY3MFYxM0cwcENacWQ2YnhZM2V6MUxy?=
 =?utf-8?B?THRsUldJTHJESU5ObVB4cnJjUVNIdWwvSmllWk1hRUI2MGlraHZ2ZWlqazdm?=
 =?utf-8?B?NThHaEZOMER1NE1wVHZwenlhMTJJUWJubGhIM2J1OVZRajZRcksxRTFYL24v?=
 =?utf-8?B?RlNGSXVDOHpCWGRaMktQQnovM2t1SnhqWlIyb1pySTBXcUdqS1Z1N3lMbUVL?=
 =?utf-8?B?UzR3WldEYjd3NE5lK3FCUTM3cUExOWhLWjF4enNQK1BNbFVHY0p5bm5uQkU3?=
 =?utf-8?B?RVEyOW5VaVVSZWFqOFRmaTR5QjFidU52RW43ZFZmejlaOVBTNVRnOFArYklR?=
 =?utf-8?B?QnY4ZzEvbmRBQVBSeGorK3pZYkZFNkhxcDdJa1ZTNStkVFFTL1k0YVIxb2lD?=
 =?utf-8?B?QUxvclNEa3B2U3M4WlhoRXV4RzB5cWlHTHNmaE5FdzJ3cFlvRXA0bDZzSXFU?=
 =?utf-8?B?SGYrQ2R3RERuVE4wNU9mSDNHZWZ2LzZSMUZtTjZoQVFLNGU0TG5tN3NJdjZl?=
 =?utf-8?B?TUZlcUI5TlNNcWIzNXlPblRGcVJxVmh3ODFwTWZ3cUhGQm53VFJ4UUtiMVEy?=
 =?utf-8?B?dDUyVWVNM0VmMTl4MHpMeVQ2MEZOa2Q5YzRsQnA3ZmpYTkI1V1RVaDQ1dkw4?=
 =?utf-8?B?cWlLTTBtbkJ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGFmbXczVXZOeVVoMTlmWjlZdk1HeVhvbmNNOWlZeFMrdER0NVRXY1dqMG5N?=
 =?utf-8?B?RmcwV2RDYWVlamF5NmNkdTlWOUlvRjhMY3FPN1JiWmdhcGVqZXltZ1FlNUlZ?=
 =?utf-8?B?TFdwMHYxMFNuTzhGNzdOdGRsZGRQUXdOYU1tMlB0N1d1SGNFV1EraFVkWjJr?=
 =?utf-8?B?VElFUVlpY0Nicy9LdE9PWk5tRldoOFVubHI0REc0WXRLenFwelRWWFZ3YXBu?=
 =?utf-8?B?WXZLTHJNditFN0pxR3kzQUhDVDBodmdMd3M1d1c2REZ3UFhCUEh0Z1cyR3lJ?=
 =?utf-8?B?eHVIUTM2a1FQZXYyVUxDRm5RTHhYSTVQUDZnYnRXZWowazVOR1EvNGF5TG1j?=
 =?utf-8?B?N2xVb0dKUjlCcERNWFM3Nm5CcDdKK2dKTDlZMUk3YWVtNmpZWlR6WkxQOGg4?=
 =?utf-8?B?bzZhbGpFcEp6bkpIM3VuRlZPRG1BV2R0c3k2eWtRbVJXMUxvUTdMOFVFazc5?=
 =?utf-8?B?ZVdQOURQbllHNXppaVc5TW56NEhHN3NzRlI4ZDZscUVtd0ZiN3o2ZUpxaHFa?=
 =?utf-8?B?c0pWd0tmcWUwelJaSGdBS2UvOUEydkFZWkgyeUNJbWxwQ3RFMmc1Q1dJUVdh?=
 =?utf-8?B?NWRPRkEvQVIrWFJtM1NpMWtPWENscHRWU3VsOXFtZDRFbGpqNWZraldIWmM1?=
 =?utf-8?B?UTJOaDZja1pyZXNGeDRmMlA2NjFNY2ZaQzF5bThDZGlpbmhObFhTTTFKclZj?=
 =?utf-8?B?U3k4WGdkVHk0eDRRS1RtY3pURGZrYlBWNUl3cTgwZWFucjArWGZacWRjdnll?=
 =?utf-8?B?bFNBbkluYklyZ0dzTk9rZS9tTi9uSE41ZnhxRWFOVHBtRy9TN2t6MnI5MTEv?=
 =?utf-8?B?MVgrZ3MydHQ3R1FKZllBZ01kMkkyMUFpdGhEYlFCTGpmU2VkYjd0Nlgvbllj?=
 =?utf-8?B?bUkrSEZrWVRHN1cwMmVhWEx2bnFrd3BTU2NrK1NRblFLUitWY2F2UUhEK283?=
 =?utf-8?B?R0RGN0k2YXBHVmNnTG1kRjY5Szc4ZWFvcjVHczl1Y29nNjFxVVNYYjFlQUtK?=
 =?utf-8?B?OWpNK2wvZUhLM2Y1eWxrSlhuVXcrUGRXTDA3b2sxZzJBaFdUUzRrOS9BWWpt?=
 =?utf-8?B?Qm84N1RQeHJKL1h0Vy9kR0ZRamVMS1JIZHlzcncrZmVHQ09HS09MWWZMR2dT?=
 =?utf-8?B?RHhTZG0zSFRiM1JSaFZyOHJQQ2I0QnlJenBKNDVCd0llS2pKaGdidW1JaWZZ?=
 =?utf-8?B?SXE5UlBlcHlaSUFwWnFQRWRJUDJWcnJhN2luQUdMZXgyUC9nZ29zWk9XZ1Mw?=
 =?utf-8?B?Yi9abkZtVVJtK1kyeGZuVi9vNWVSK0JRWjRXUWRMNzdYa25udHZGQzFORUpY?=
 =?utf-8?B?c0VkcXVwVVpHMXd2Ynh4dzFTZmhURktZZ0lpUGtHQkhjVkp1Z3JBUlltSnB2?=
 =?utf-8?B?MzJCNkZJd3VQRUxLcWNFRHIzdzZIV1VDYmlYSmZPemIxdzR3S2pWVENiMnJF?=
 =?utf-8?B?cU9uenMwQ0o0Z1gvc1VlVTNXaEJzZ05uTTQ3V2NuQzcwR2pSZUF2aXdSZUJZ?=
 =?utf-8?B?Um8wSnBwTnJ6VDRPenFob3cyaUNvWXc2R2Q3a1J0MjRqU0I1QTZjckdJMXQz?=
 =?utf-8?B?VlFRU2xOWnhtWTRpYUVDZE4rdFF5Y0JWa0RsUkdZOVZFL2QxSHlNQnoxVjds?=
 =?utf-8?B?TXU0S2JtRlpRaHArNFJscTRXNXk3SlpaNGltMEJYbU5MRWJwZEpvYzZFMmpO?=
 =?utf-8?B?NlVUNHpHWlFkZm9BdjhQUGhzQ0lTbXdJRlgrb2RrdlJmTHpHZit0WDFYeHVo?=
 =?utf-8?B?ZlkrWkNLVHpRM25qRm51Wm1TM29NOVljL2dGQjY5Vkk3RW5ibzU1NkpybUJ2?=
 =?utf-8?B?T2NTNHJzOXRVYVZWMStlUW1pSk5oa2crL3lWeG16THpwMnlaNzd4YTYzdTJ4?=
 =?utf-8?B?RTIzWEViSldxQ0ZkWHBxME81UG1RLzNRalRRWmc0dmdIMytDYUY0cTZ4c3A2?=
 =?utf-8?B?S09lWHlwWTNvMTJXY0h2ZUtsckNuc3NPRWV6RXNUcGNieWZnSFJVVDFHUTJj?=
 =?utf-8?B?U2ZHN2o1UzNhN3V4aENzTlpnV0Q1dTZPcnRXaGtsQ1Zha1pnYzFJNUtBM0ps?=
 =?utf-8?B?cmp5MzVYeUsxRVVDUDZ5TDFCK3VtbnpPclNPcERXY1JGVDJqblBvV2pVNUxV?=
 =?utf-8?B?Q3VDcUVySHpHY04rUC8vbjcrV0VKRFhWdUFkTzZnZU05dFBnZDg4dUJ6Ulkx?=
 =?utf-8?Q?wStGGA7UUssxDJ4M7g53ZGMaIU0SwW87x27eMemNbril?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c56ebe-067d-4151-2d1b-08ddf2cf922c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 14:12:28.2341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hbs2A1SlhSuxmrjjOuFfizWkv9T7VgRoOvczxW4/cnSf5jQl2TfDDLo+lQWplLqBvxDrr4CL63UuRh+DBD1Pvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9583
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

Right now the GSP boot code is very incomplete and limited to running
FRTS, so having it in `Gpu::new` is not a big constraint.

However, this will change as we add more steps of the GSP boot process,
and not all GPU families follow the same procedure, so having these
steps in a dedicated method is the logical construct.

There is also the fact the GSP will require its own runtime data, and
while it won't immediately need to be pinned, we want to be ready for
the time where it will - most likely when it starts using mutexes.

Thus, add an empty `Gsp` type that is pinned inside `Gpu` and
initialized using a pin initializer. This sets the constraint we need to
observe from the start, and could spare us some costly refactoring down
the road.

Then, move the code related to GSP boot to the `gsp::boot` module, as
part of the `Gsp` implementation.

Doing so allows us to make `Gpu::new` return a fallible `impl PinInit`
instead of a `Result.` This is more idiomatic when working with pinned
objects, and sets up the pinned initialization pattern we want to
preserve as the code grows more complex.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs    |   9 ++-
 drivers/gpu/nova-core/gpu.rs       | 159 ++++++++++---------------------------
 drivers/gpu/nova-core/gsp.rs       |  17 ++++
 drivers/gpu/nova-core/gsp/boot.rs  | 118 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 5 files changed, 184 insertions(+), 120 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 02b3edd7bbdccb22d75db5999eb9b4a71cef58c1..1380b47617f7b387666779fbf69e6933860183c0 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -34,14 +34,19 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         pdev.enable_device_mem()?;
         pdev.set_master();
 
-        let bar = Arc::pin_init(
+        let devres_bar = Arc::pin_init(
             pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
             GFP_KERNEL,
         )?;
 
+        // Used to provided a `&Bar0` to `Gpu::new` without tying it to the lifetime of
+        // `devres_bar`.
+        let bar_clone = Arc::clone(&devres_bar);
+        let bar = bar_clone.access(pdev.as_ref())?;
+
         let this = KBox::pin_init(
             try_pin_init!(Self {
-                gpu <- Gpu::new(pdev, bar)?,
+                gpu <- Gpu::new(pdev, devres_bar, bar),
                 _reg: auxiliary::Registration::new(
                     pdev.as_ref(),
                     c_str!("nova-drm"),
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index a0878ecdc18bc9e9d975b9ab9c85dd7ab9c3d995..3c019df01d303529ea67f1ebf8ea84ebdb1ed813 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -3,15 +3,13 @@
 use kernel::{device, devres::Devres, error::code::*, pci, prelude::*, sync::Arc};
 
 use crate::driver::Bar0;
-use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
-use crate::fb::FbLayout;
+use crate::falcon::{gsp::Gsp as GspFalcon, sec2::Sec2 as Sec2Falcon, Falcon};
 use crate::fb::SysmemFlush;
-use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
+use crate::gsp::Gsp;
 use crate::regs;
 use crate::util;
-use crate::vbios::Vbios;
 use core::fmt;
 
 macro_rules! define_chipset {
@@ -172,133 +170,58 @@ pub(crate) struct Gpu {
     /// System memory page required for flushing all pending GPU-side memory writes done through
     /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory-barrier operation).
     sysmem_flush: SysmemFlush,
+    /// GSP falcon instance, used for GSP boot up and cleanup.
+    gsp_falcon: Falcon<GspFalcon>,
+    /// SEC2 falcon instance, used for GSP boot up and cleanup.
+    sec2_falcon: Falcon<Sec2Falcon>,
+    /// GSP runtime data. Temporarily an empty placeholder.
+    #[pin]
+    gsp: Gsp,
 }
 
 impl Gpu {
-    /// Helper function to load and run the FWSEC-FRTS firmware and confirm that it has properly
-    /// created the WPR2 region.
-    ///
-    /// TODO: this needs to be moved into a larger type responsible for booting the whole GSP
-    /// (`GspBooter`?).
-    fn run_fwsec_frts(
-        dev: &device::Device<device::Bound>,
-        falcon: &Falcon<Gsp>,
-        bar: &Bar0,
-        bios: &Vbios,
-        fb_layout: &FbLayout,
-    ) -> Result<()> {
-        // Check that the WPR2 region does not already exists - if it does, we cannot run
-        // FWSEC-FRTS until the GPU is reset.
-        if regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).higher_bound() != 0 {
-            dev_err!(
-                dev,
-                "WPR2 region already exists - GPU needs to be reset to proceed\n"
-            );
-            return Err(EBUSY);
-        }
-
-        let fwsec_frts = FwsecFirmware::new(
-            dev,
-            falcon,
-            bar,
-            bios,
-            FwsecCommand::Frts {
-                frts_addr: fb_layout.frts.start,
-                frts_size: fb_layout.frts.end - fb_layout.frts.start,
-            },
-        )?;
-
-        // Run FWSEC-FRTS to create the WPR2 region.
-        fwsec_frts.run(dev, falcon, bar)?;
-
-        // SCRATCH_E contains the error code for FWSEC-FRTS.
-        let frts_status = regs::NV_PBUS_SW_SCRATCH_0E_FRTS_ERR::read(bar).frts_err_code();
-        if frts_status != 0 {
-            dev_err!(
-                dev,
-                "FWSEC-FRTS returned with error code {:#x}",
-                frts_status
-            );
-
-            return Err(EIO);
-        }
-
-        // Check that the WPR2 region has been created as we requested.
-        let (wpr2_lo, wpr2_hi) = (
-            regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO::read(bar).lower_bound(),
-            regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).higher_bound(),
-        );
-
-        match (wpr2_lo, wpr2_hi) {
-            (_, 0) => {
-                dev_err!(dev, "WPR2 region not created after running FWSEC-FRTS\n");
-
-                Err(EIO)
-            }
-            (wpr2_lo, _) if wpr2_lo != fb_layout.frts.start => {
-                dev_err!(
-                    dev,
-                    "WPR2 region created at unexpected address {:#x}; expected {:#x}\n",
-                    wpr2_lo,
-                    fb_layout.frts.start,
-                );
-
-                Err(EIO)
-            }
-            (wpr2_lo, wpr2_hi) => {
-                dev_dbg!(dev, "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
-                dev_dbg!(dev, "GPU instance built\n");
-
-                Ok(())
-            }
-        }
-    }
-
-    pub(crate) fn new(
-        pdev: &pci::Device<device::Bound>,
+    pub(crate) fn new<'a>(
+        pdev: &'a pci::Device<device::Bound>,
         devres_bar: Arc<Devres<Bar0>>,
-    ) -> Result<impl PinInit<Self>> {
-        let bar = devres_bar.access(pdev.as_ref())?;
-        let spec = Spec::new(bar)?;
-        let fw = Firmware::new(pdev.as_ref(), spec.chipset, FIRMWARE_VERSION)?;
+        bar: &'a Bar0,
+    ) -> impl PinInit<Self, Error> + 'a {
+        try_pin_init!(Self {
+            spec: Spec::new(bar).inspect(|spec| {
+                dev_info!(
+                    pdev.as_ref(),
+                    "NVIDIA (Chipset: {}, Architecture: {:?}, Revision: {})\n",
+                    spec.chipset,
+                    spec.chipset.arch(),
+                    spec.revision
+                );
+            })?,
 
-        dev_info!(
-            pdev.as_ref(),
-            "NVIDIA (Chipset: {}, Architecture: {:?}, Revision: {})\n",
-            spec.chipset,
-            spec.chipset.arch(),
-            spec.revision
-        );
+            // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
+            _: {
+                gfw::wait_gfw_boot_completion(bar)
+                    .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
+            },
 
-        // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
-        gfw::wait_gfw_boot_completion(bar)
-            .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
+            fw <- Firmware::new(pdev.as_ref(), spec.chipset, FIRMWARE_VERSION)?,
 
-        let sysmem_flush = SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?;
+            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
 
-        let gsp_falcon = Falcon::<Gsp>::new(
-            pdev.as_ref(),
-            spec.chipset,
-            bar,
-            spec.chipset > Chipset::GA100,
-        )?;
-        gsp_falcon.clear_swgen0_intr(bar);
+            gsp_falcon: Falcon::new(
+                pdev.as_ref(),
+                spec.chipset,
+                bar,
+                spec.chipset > Chipset::GA100,
+            )
+            .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
 
-        let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
+            sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset, bar, true)?,
 
-        let fb_layout = FbLayout::new(spec.chipset, bar)?;
-        dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
+            gsp <- Gsp::new(),
 
-        let bios = Vbios::new(pdev.as_ref(), bar)?;
+            _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
 
-        Self::run_fwsec_frts(pdev.as_ref(), &gsp_falcon, bar, &bios, &fb_layout)?;
-
-        Ok(pin_init!(Self {
-            spec,
             bar: devres_bar,
-            fw,
-            sysmem_flush,
-        }))
+        })
     }
 
     /// Called when the corresponding [`Device`](device::Device) is unbound.
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..33cc4f2011c1f08931efa540fa10493478018721
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+
+mod boot;
+
+use kernel::prelude::*;
+
+/// GSP runtime data.
+///
+/// This is an empty pinned placeholder for now.
+#[pin_data]
+pub(crate) struct Gsp {}
+
+impl Gsp {
+    pub(crate) fn new() -> impl PinInit<Self> {
+        pin_init!(Self {})
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
new file mode 100644
index 0000000000000000000000000000000000000000..6625a11ccc8837d1d3b1d764fe69b19aeebaa2ec
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::device;
+use kernel::pci;
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
+use crate::fb::FbLayout;
+use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
+use crate::gpu::Chipset;
+use crate::regs;
+use crate::vbios::Vbios;
+
+impl super::Gsp {
+    /// Helper function to load and run the FWSEC-FRTS firmware and confirm that it has properly
+    /// created the WPR2 region.
+    fn run_fwsec_frts(
+        dev: &device::Device<device::Bound>,
+        falcon: &Falcon<Gsp>,
+        bar: &Bar0,
+        bios: &Vbios,
+        fb_layout: &FbLayout,
+    ) -> Result<()> {
+        // Check that the WPR2 region does not already exists - if it does, we cannot run
+        // FWSEC-FRTS until the GPU is reset.
+        if regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).higher_bound() != 0 {
+            dev_err!(
+                dev,
+                "WPR2 region already exists - GPU needs to be reset to proceed\n"
+            );
+            return Err(EBUSY);
+        }
+
+        let fwsec_frts = FwsecFirmware::new(
+            dev,
+            falcon,
+            bar,
+            bios,
+            FwsecCommand::Frts {
+                frts_addr: fb_layout.frts.start,
+                frts_size: fb_layout.frts.end - fb_layout.frts.start,
+            },
+        )?;
+
+        // Run FWSEC-FRTS to create the WPR2 region.
+        fwsec_frts.run(dev, falcon, bar)?;
+
+        // SCRATCH_E contains the error code for FWSEC-FRTS.
+        let frts_status = regs::NV_PBUS_SW_SCRATCH_0E_FRTS_ERR::read(bar).frts_err_code();
+        if frts_status != 0 {
+            dev_err!(
+                dev,
+                "FWSEC-FRTS returned with error code {:#x}",
+                frts_status
+            );
+
+            return Err(EIO);
+        }
+
+        // Check that the WPR2 region has been created as we requested.
+        let (wpr2_lo, wpr2_hi) = (
+            regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO::read(bar).lower_bound(),
+            regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).higher_bound(),
+        );
+
+        match (wpr2_lo, wpr2_hi) {
+            (_, 0) => {
+                dev_err!(dev, "WPR2 region not created after running FWSEC-FRTS\n");
+
+                Err(EIO)
+            }
+            (wpr2_lo, _) if wpr2_lo != fb_layout.frts.start => {
+                dev_err!(
+                    dev,
+                    "WPR2 region created at unexpected address {:#x}; expected {:#x}\n",
+                    wpr2_lo,
+                    fb_layout.frts.start,
+                );
+
+                Err(EIO)
+            }
+            (wpr2_lo, wpr2_hi) => {
+                dev_dbg!(dev, "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
+                dev_dbg!(dev, "GPU instance built\n");
+
+                Ok(())
+            }
+        }
+    }
+
+    /// Attempt to boot the GSP.
+    ///
+    /// This is a GPU-dependent and complex procedure that involves loading firmware files from
+    /// user-space, patching them with signatures, and building firmware-specific intricate data
+    /// structures that the GSP will use at runtime.
+    ///
+    /// Upon return, the GSP is up and running, and its runtime object given as return value.
+    pub(crate) fn boot(
+        self: Pin<&mut Self>,
+        pdev: &pci::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        gsp_falcon: &Falcon<Gsp>,
+        _sec2_falcon: &Falcon<Sec2>,
+    ) -> Result {
+        let dev = pdev.as_ref();
+
+        let bios = Vbios::new(dev, bar)?;
+
+        let fb_layout = FbLayout::new(chipset, bar)?;
+        dev_dbg!(dev, "{:#x?}\n", fb_layout);
+
+        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index cb2bbb30cba142265b354c9acf70349a6e40759e..fffcaee2249fe6cd7f55a7291c1e44be42e791d9 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -9,6 +9,7 @@
 mod firmware;
 mod gfw;
 mod gpu;
+mod gsp;
 mod regs;
 mod util;
 mod vbios;

-- 
2.51.0

