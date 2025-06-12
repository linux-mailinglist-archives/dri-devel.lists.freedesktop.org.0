Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5C9AD72E8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C3310E83B;
	Thu, 12 Jun 2025 14:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IYtUKFbM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D4B10E4B2;
 Thu, 12 Jun 2025 14:02:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yef1nAJXolVc6IheWzkdBAneSztAVsO+fCDok5vgWAQg6aTydPEBM1sA0GAGb5zpi39Q1HoenBU0ZIHpUMFngMqQVNKjPsB0Lr2+Rn1kXbB80WBZCiKJP1tQIVG0pbWl3MiJ0Qc2p/IyavAjTWWyUrX6z7RDWjPa5K2Letg2wuL67l5m5D42XKclydqIp4FGy3g4UoUiMIkzxQ29WKnor5PDdHhkLe3k0FhdGycOhZHvvJY25I1aicmfpt60us79AdD6PQu6mrKjgajFueALpAs/ZQ0F/pH/YHpOSw/9j20khz2t7gw7Lkbo4vbTz1qMAZw9eymoulitJQcFHBIdPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEuVf8ba764vp3/Ai+DXZ+XY05tF4LD1XFBSkLqR6dQ=;
 b=IYx2L/8g45DOw8z0o3Xoas4kyZGwFfyyy1o92XZy1agHkzMTGjNW4gt2eYIlMP+K2M5Q50NfY6qSMLKkH2IAtCU47wwEtX6KX9bYC4A7KNUv0TouGBa9S0yHJFACdPFEwO5W8M2dl+t52Tf9mxnhBWwKGMaByLJWsrTvn47Rfv1kuIGLRWPv+sgKX1ZzW5UUOJlTkYbXZEhFp2KgUB3GFLYFBRpMbYTkSJcdUbgSEDTpL3fQS54wpWBBcWB/IKtwgwORL5E0g4N7BHiiE1nRZpPFZVH1yje0y+ckmUtjoqc4EWdBupUqc8ZweIbN+wW715u5bLiIYZYfnWbyiJ7U6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEuVf8ba764vp3/Ai+DXZ+XY05tF4LD1XFBSkLqR6dQ=;
 b=IYtUKFbMIRxlh1jVv+MfYsy25SmKqKXU9UbH/wpfhcIXJWNcyHATFR+chBiWGiHTnUVY+0Koyw2XzjvCB+GpRq9Su2P/Ufm+Sx1ck2srd9OpsnNmAt9eXULmId5EcjK0gAYdi6vNeSVqjbkh/Jw7Mes+H4YRIFN/B93GJ5/zI7tkQrKpVmnV7rmFxbwfJCbyaCTeXBNkT0+9mfLLRDBECxV9QthJP+enUgqH4egb9ARLlWun0nDBjYrNC/IwJBDxKwMU1H5QCRiBjuLrdGpOfikUTkiOTyLTDnZ6jQhQxHJ5eFAtn/xwj4I5r397Fo5M/3/lpYl4dEkpcAtFv9xebA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 14:02:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:02:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:30 +0900
Subject: [PATCH v5 02/23] rust: make ETIMEDOUT error available
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-2-14ba7eaf166b@nvidia.com>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Benno Lossin <lossin@kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0052.jpnprd01.prod.outlook.com
 (2603:1096:405:2::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 213d9aec-e7a3-4c63-1fc8-08dda9b9c81b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXhIbHFUTXR3MDhsZ1QybklOTXpIc2NrNmNzNExOdnQyUHhoNVd4MkkvMENV?=
 =?utf-8?B?WTdEOE1lOExQbGVkZjZlcDdrZkt5ZDVpck1qNUV6VlFWbTNnTCtjRGtUMU5a?=
 =?utf-8?B?T0NwUGZFckNVWGtGM0JJQWVjdkV5eVYvNWpDSWZvaU05ZitJdmNLT3NKT2p1?=
 =?utf-8?B?RHZaNUE4NHVpdysyZFhDYjlBS3p1S0lDbHR5NW5XcGtBZTlGYkl2YUZWdS9O?=
 =?utf-8?B?a1VRR0U5a3pKS0Rmb0Rud2dXc2Z0OHBpbEFoRXk5OUU3TGlZcU1tUzVnRUE3?=
 =?utf-8?B?MmJycDlrTitQS1ZuUTlYNm1rVDlWYVRIOEFhb2E1QlY5VFExcWxuSDZnQkVX?=
 =?utf-8?B?cWxYVmpGL2tSOFY1ckhiVVJBZnNuQW1QRWRiOGo2WVpaVVpKWFo3YVJISUNF?=
 =?utf-8?B?MHRlUTJVN3dBTnN4TTYwM3BSZkVnQ0I2c01hTGcyclk0SW1xRUZYMTNoNkVK?=
 =?utf-8?B?TjZSa285R2Z4djhsTUpJSE9hSGs4TWdkYXNQcHVQSUo5eFpvUFVNM1h6bk1t?=
 =?utf-8?B?M2NFWEdRcExEelZFN0haV2s4VWRmRk1ZVnpmdVBNSWlmUlBha0M0RjNvNlVW?=
 =?utf-8?B?Rm0rakgwNTdKWVMyWi9EY21PMS9mVjdjay84RkROSm0xenZRalhoTzBvOUxl?=
 =?utf-8?B?TkMzcG9NNU5rWm52UU5yWjNYRXlWNU9VWXE1T3lFblNtclEzQjJLbXU3NDNK?=
 =?utf-8?B?Mkp5NTdMUWFyZ0Y3WWZxdEI2VVgzZU4rUjA2VDZmS0RMbzRCME9QTGFpa0hp?=
 =?utf-8?B?UlUwWG1idTJuRk5nZDV3WXB0MzJ3V0laei93QVlHNml4aVpzZkY3cXV2RU1l?=
 =?utf-8?B?ZVFBTVlJUGhQa3lOanljNG5QaWhjSjhXM3MwV3ZQZG5FWDZOb3ZwZVBYVlY1?=
 =?utf-8?B?OUVUOFZ1cWlRZklMdllFWmVJeFZoelZMTlNnRUZtdkx2SUI1djZ4YnJNOTNa?=
 =?utf-8?B?WTV1TGtod1BjMUg1T0FUNUU5aWsvc1pYdzYva2NEamlnMk5hMmNKYWFTdzlE?=
 =?utf-8?B?SjVNZUVhek1sNllDcjhNYm16NnNOQ3FUWmtvMk0rU0hHSC9GMmVOTmx0Risw?=
 =?utf-8?B?Y09RbnRXNUlaQnJnSEhnRHBiWjE1QkI3M2ZvMTk3RCtJRC9yS3hUK0ZqaXlB?=
 =?utf-8?B?OW84NGUxd09wOEdoRVg1c25MOWowRloxRDQ5RmVjTlIyRmtIZVZtSThvUnlz?=
 =?utf-8?B?ODU1cXp2R0dic0pMRE9XemxwTGJqR1N4VzV1MVBicXpQZzF3SU9QbzdLMVR3?=
 =?utf-8?B?ZzNEaGtBc1dCQ2o3dzNLaVlQWUt1Z0FmY2RWRy9hY0NGU2RBaEJ4K1dpVVF2?=
 =?utf-8?B?dG1TdDdkUjNGZk1iTWtha2l2MDcrUlZrK0F4MDNVUERZUzl5MDNkcFA5NFY0?=
 =?utf-8?B?VllvY1dGb3NTUU1NaW9PQzNkTWs2ZFRsZU1JWjZiOUo2V2RlSzJQVDZFaFor?=
 =?utf-8?B?OFNBKzYwWEhsT1BibGU5VGordDZ3UnhOU3VBVURSeDJLZENERVppMkhNUFFL?=
 =?utf-8?B?QWZwQWp0WjNVSG9vUHhTZ254SFFFRzFxVzNmbk9tNEhDdDN1VGZBcmdBQjJh?=
 =?utf-8?B?NHlnMERhQjdhMVVKNFBkUzBJUlJxRGNhdVpYaVQxNXNnVmZTdXFqVHlkdHdD?=
 =?utf-8?B?UGVLekh0MGtRTXN0cEpvaGdPeGVPL2hDcm1CZ3drNmpBZ3RuaXFRem55OHMz?=
 =?utf-8?B?RkluTW1HbDhXSUl4ZWJRSnpHTVkrd3BEemhsNWt2anZUTDhRQVZVc3lWS09m?=
 =?utf-8?B?NWZiTDFrUVpEcGxZS0RhZUdkc0lMUXVJVVJkbEpzTnJENEVoU0dPNC9JNHFX?=
 =?utf-8?B?RDNpNmY2Z3RYbTdwTE4wQU9sdjB3VHhnK3pZRHlyajlPR3B6NGtlZEdTdVFL?=
 =?utf-8?B?N1hmeXlFdm9yc05KVGQwYzRNVTVMaGVzMzh3blZuNnMvK3B3QVNLUWVRMDhG?=
 =?utf-8?B?UUthZjhRSW1Sd2htVU9UdHpaNm1xMDZENGlVaDFUS3RvWVZVQ2pBSGpBOGo0?=
 =?utf-8?B?bUFyay8yZ2dRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2RQS0VNMUwwWXlFVTJNSERCOHZnMHVSTHhsZEZqMmE3NzVKQWN3S0d4TVhB?=
 =?utf-8?B?ZWcyWW50VTIvOXJtUnJ3TUZtOU9QaTFSSDkxdVBlbG1oT1pQNENvaGh4b2JQ?=
 =?utf-8?B?Tzh2T3MwMFVjU3FVZllZelBTN2RJbEY4MGVHSUgrYUljYm9HSGNPTHdENnkr?=
 =?utf-8?B?YXROYkFXbFJSMXZ4UFI5b3cwVHNVRVh1ak1Hbm5hUHp0OTdaM1FScmdPZ05q?=
 =?utf-8?B?SmxzWWhWT2pQVUlac0ZMK3ZFUVF4MmJjcHlDZmJGZ0JNanl5VTVHeitjWHVR?=
 =?utf-8?B?ZGFzZ201Wjh4Slk0emQvUERnZk1VYUdsVDVzOUtyV240NXBuemZUZi9LMldE?=
 =?utf-8?B?NFViNEZMUHRQTWphdnF1MVF3Vm5TWGxiS1dBaVJ1eUlTQmRFY2tOaElLMzRR?=
 =?utf-8?B?VmFrWVljTi9DSmtJQzlmOGZpaCtsUFhDK2Y1VWM1QmRlVGp0T1RjUElvZGJy?=
 =?utf-8?B?S0FOWWhyVklhQVJiRzhlQUVuVlBnaFpkZ0NiU21GOG4wTDJab0tPemsvNzI1?=
 =?utf-8?B?K1hsMWxvWDBKSFZIMnBnMjFQanNGMytTdTRuSVk5K0toSDhkS3RyRm9XVTla?=
 =?utf-8?B?RnlpRE4xVm5JRnlrNFAxYXdVVHAwWnUvMHZ5T2lqVExJMTE2b1N5MDVKRGUw?=
 =?utf-8?B?WjNuMnEvK05Ycm82RDNyQi9iclJvcVNaOC9tbFhPcWxCeklRVzkybzM1WjZV?=
 =?utf-8?B?cFdjbWFxNkxGYy9scVh6SjdLSjRGajB4ZGM2RnBGWXlzS1IvVy92cjVYN0Mz?=
 =?utf-8?B?V3JabXMzcWpVSko0LzIxM2RncGtSby9qNE1XTis1Qzd1dXNIM2ZLNm5WSndS?=
 =?utf-8?B?WkRCQkxCeGt2UXV2L0ZuTE9DbEFld050NGY3emhqYmNYMFV6MGkyV3F1SUdS?=
 =?utf-8?B?a0xHZnVnSHByNUthdEVJWDMwdjd3R0pmSGtYMExyT09jc001T2ZYdE4wMlpR?=
 =?utf-8?B?bEYrVzJNSDhFVHpsendpL3ZVQU5nemwvZkVZSVNGaGtHMHhEb1FyRU5vWTZ1?=
 =?utf-8?B?VEJid2dTS0Iwc1B4djlBb2VORDRDaHE5ODdlMDVYMmpOQmx6Z0x5SktsNmdS?=
 =?utf-8?B?cnIrRE50eTIwb0VqK3M3WVJqYkhDdlRPL0NWSWcvOUlHQVFPZnQzMmwvaTdQ?=
 =?utf-8?B?R1o1UllDQ2JlVGRhc3ZxT2ZjYnZLb0JpeEJwVXErTlhHRE9rY2ZKeXAwL25P?=
 =?utf-8?B?cGF1bE9sTDBmeElLVkQ3UE9vNk9raXhnbnc4YlRDTUhaYmdNNGhEUWo3R0ht?=
 =?utf-8?B?dWcxTE04WmxEVHQyNlJzRnJzRkdKZXFIWVpjYjFpQnovSC92WXZ1L2xPL0pY?=
 =?utf-8?B?eXJUSGdlelgxd3JLTUVHeDYybDNrRnEzNzdZUHdPbkpHWHdoMEt6aU1KTHNR?=
 =?utf-8?B?bDVYVGVsTHJ4ME00Tks4YXVqSkZnN1dwS2hHTDZwKzluYjJHaWQ3WlRRYmpu?=
 =?utf-8?B?KzJGNkR0cHFVQ2NqV000YUt2SFJtM25hOFFES2R5UGh1Q0ZRc1hiTWx5ZGNO?=
 =?utf-8?B?VGdnYWhkbkxWR3dyQVkxcG9zREJZcktNUS9tUXVVTzJuSXo1TGhiRHY2WE0z?=
 =?utf-8?B?OG9uWHRhWUdYWU8vdElOUWF3ai9JWDhEd2lqNWppOGswalBrTTJ2SlRVVEEw?=
 =?utf-8?B?MkFGQlJITSt5M2hLQXdYdm1SMFh3MkZkdDhVZnZvUDZ2SWVhSzZLeDR6c09L?=
 =?utf-8?B?bktyNnBKWWJhK2o1a1JuSVhrVzMwekV5cFRYMlpqTWtjWERzcFJUMDdZZy9G?=
 =?utf-8?B?bk0yc2JXaThlaXlya3cwVkhCTHZValViMWFEYmFoSnRKOHgvZDgvOWlaZjlJ?=
 =?utf-8?B?aWxHeFQrVTFHWjhteGppYzJuWXNRMHJUVVBacDFEMllnMklKdjEzd1o3Q1BN?=
 =?utf-8?B?U3FyRCtrRG5sQ3FjTjFqV3Y2eHBqTU41b0VTY2RzMmdJRlpMRXNSU2RqRFVk?=
 =?utf-8?B?eVhvaGk5am5DeGRvNmhUUmxyUmR4Y1JBdDdsT2E5QkgwSlV6MGxvTjBTNkRB?=
 =?utf-8?B?blNMU00vKzBRTnlYU3k4YlZsTFdLYkZzNlZHL00wRWRURW9kWmtvY1gyd2xT?=
 =?utf-8?B?OWJ4OC9zN29PV2IvT3RWUTBmRVdVOXh6Q2R4eFVXWS9GRUl4OTQ3WDNweGpG?=
 =?utf-8?B?cXIvUWFLS05ZUm1rdGsvampBQnRBblBUTGIrMU1taUsyUytWY09uUmpSdHht?=
 =?utf-8?Q?DxURE22/H43Bl67wAdQegN6MUxhQ/oMzLDCqFGn8qdHG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 213d9aec-e7a3-4c63-1fc8-08dda9b9c81b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:02:34.8984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4t2DVqjofU4ND1Myusf0r9QVfmiD9oHfcEpoqjhFWWJ4UCQsr9aIp6SHEqMCyDGjmKGx1LtTZqlWhS1pLp0FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458
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

We will use this error in the nova-core driver.

Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 3dee3139fcd4379b94748c0ba1965f4e1865b633..083c7b068cf4e185100de96e520c54437898ee72 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -65,6 +65,7 @@ macro_rules! declare_err {
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
+    declare_err!(ETIMEDOUT, "Connection timed out.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
     declare_err!(ERESTARTNOHAND, "Restart if no handler.");

-- 
2.49.0

