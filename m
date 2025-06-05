Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2094BACF0D6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 15:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EA710E8EA;
	Thu,  5 Jun 2025 13:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eOBJ+TVw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064AA10E896;
 Thu,  5 Jun 2025 13:36:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAHsYr+Hiik0uXWJWRtWBQPGDZl5UzyNYo+PEJOB7Mj2+qnesvCeOgDD4COu/397KKc2Oe8//jslQqo0fFCLKKovrQZTjJEFVVZ4e5jyTBrmxHE/PbIfotdvljGVeqkouiI/9Kk4f7Dm953N9kgrjf+0CBwX8UrfnpIKwQHUZQ7E+xqUym4BcRzLJSJQoLZwOLQmbK2kil2NBNm302pL5vMtAz/qWiXaijpmVehZa+2PlF14PCVdFuBAcmZ8SChvLEl87BZu0aPmwnDVl8y4m372J2U6+vlm297dwzj310Hcmf2ATzlDGXYmuDvKyWNKDskdharf26TKD1fddq8iqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCboVDASceDf4PvO+aBc+kJ7MjU+CDuyzjU1wC0LJSU=;
 b=QLitZ6BneruTxEWbet+amQrhP7XIy1ixVLgH8eojvi4uebZpRiHUE22dROD+B2fnaHs1/iQVA3N7SMJUZ/TJkgIohNzG1uFRtDPL4jCRDgCJoni3lnE0SEaEDjZHhJVgYnrvjC78/BD1BwgyarsL2h50a41C3pR6wn0zTXWAtP/kEUyEsZIIhhzuys2Lud2IldxpqDQ5eupN5zi4UcbdFIET6EeiNjDoB07V4w2+Jns6zUIushow9G8im++31nZdYYDurjYM6TM7EChonb/MDaR7BYF/MbXGZ9fgz86NlGgCm7cQ0pKe92N0X9kmrk6j0eBhQbZwEmQ0rXdQkmCiZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCboVDASceDf4PvO+aBc+kJ7MjU+CDuyzjU1wC0LJSU=;
 b=eOBJ+TVwjnSMSU0HKMaTR64v3u0/lyLYjX01+VGZDe3tdBLsZgdiHFVyMP/sM89c2JDEBGMgixXe+jcmg7IPQCxbCjZUB/S3pJiu3vpcWCbQzQe5phx0iOIB3D97qUxNkwe2qlQcmjFulo6xXo9vHrSE08Ig/mZFYr+pRpqnaAGW6BuCyG4bAQrEVUnHUlFoRW63JfmALt0+DNa4YqOqTfUkqFuLJfOqhl7hKjyX7vqOpC9RHjDDc/N35+7yxEH4hNgeSISl9+asTQ5yFxlrrLCSvRXQGqJEJcZMUtRWVd4cGMrCHY9FVI2ii1vsEMCqKfnopG4TdOCxRcGXCfbrbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7355.namprd12.prod.outlook.com (2603:10b6:510:20e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Thu, 5 Jun
 2025 13:36:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 13:36:20 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Jun 2025 22:36:17 +0900
Message-Id: <DAEN1I994XSK.OVMVL2MUZETX@nvidia.com>
Subject: Re: [PATCH v4 17/20] gpu: nova-core: compute layout of the FRTS region
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-17-05dfd4f39479@nvidia.com>
 <aEAeibsMAdlmIfch@cassiopeiae>
In-Reply-To: <aEAeibsMAdlmIfch@cassiopeiae>
X-ClientProxiedBy: TYCP286CA0240.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: 06182931-72a0-4d41-243a-08dda435f4bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGtuVG1FYmJrZVlyU04wLzl3WW1pcFZQR1BqNHlqckh1TkQyMjZKdHlDVlBS?=
 =?utf-8?B?OWpuNzlVZ2RXQjRzOWZiQmdtRlkyWHUrbFBwVGxKUWVVaW9iaytRNVR4TDhH?=
 =?utf-8?B?cTNSQWVROWhNTCtmbFZXaHQ3aFdHK0RMdituNXJPdXRVNU40WS9OZjR0cDQ0?=
 =?utf-8?B?c3I5eGdBOTVzL1VjVThpeWR3TlU1NVVOQVRRS0pBWGt0STdqaUNSN09JZGdu?=
 =?utf-8?B?U2FQdWVkNU5BY2Zmcis5blFvZkVuVk1NZXNFeEtuaHFPUncxSlNIck5XR0dP?=
 =?utf-8?B?NEtaNVdvbldWZUlGZndEdjVYNnFkSndRa1FpdnNqZFhEcWUveVFZMnV2aUJn?=
 =?utf-8?B?dkR3STB4QUc5OVlPdFZiMDhiNTJWazRpdVd0RS81M1ZkSzNiUFNUMjV5SVd0?=
 =?utf-8?B?Z0N2eFhYU0JxbTR0Y1BjdFpHU01Ma1Ayay9FTjF0elZ2cVFrYVN0djUvZUc0?=
 =?utf-8?B?cENxa0lwREgyNWdtNE9DSUVZdEpLU01jVnE4Tm9hdWErdG5pbEZPTXRFd1VP?=
 =?utf-8?B?WXpXU1N2ZDNMdGgyRVJ4WTM4dERCOW1ydm5kbUhpeGtVRG9oUjZPcXpwL0V1?=
 =?utf-8?B?TlRtOWVBaXBIUnFBcjZwTlZKTXZOb0cxNjNqazBQRkU5KytpTzFoeFRsc0I0?=
 =?utf-8?B?VldNOWNzTWJkK1I1NVBrSHZrWk9RMEJlT0plLzlVSUs5d1hLUHN2RjZCbG9K?=
 =?utf-8?B?NzdQWEttKzJsSWJJbUJGakxOOFJOaE5oOTc4NUZaMkwrYTkzZFdpVi9Ec0o5?=
 =?utf-8?B?TCtlY1BrWXYvMnd6QlVXZHhuSjdIR0M3Q3Nra0x6ZGN0MXBsNGRTamRTSnZa?=
 =?utf-8?B?dHhsRmZBVS9UNUpWRmJZakJCMEt6ekxTdEdpL1pRV1BCSUtCd0w3dTIyQWYz?=
 =?utf-8?B?dWx1M3Q2cW82QjN5NG5WVnp0NHhxZ1NsMzFneXp1ZDUxWUFjM0VmalorR1Mz?=
 =?utf-8?B?R0hURVpEckJFUWRiYjBjUnlXdXd6VWczcDNtUkR1VXhhWG5EeEsxVFRKbGVi?=
 =?utf-8?B?UG0zb2QzQzJRRkFIbnU5OXVuNDY3RkhJUGtBRCtocUxhOHVYMHBLT0piaURK?=
 =?utf-8?B?S1BCUlFNeDQybUlETWlDVWF0UzRWRm1ENmNtamRlNHJEbTZ1d3JzMnpNbkR2?=
 =?utf-8?B?elB3a0hSeFRsVEpKYmcrVld5K0NMVkh5bzlLQXUxZkdIUEJIYWVmL1pjRGZt?=
 =?utf-8?B?SXNzaktZY3ZhR0Q4Ym1SZDNyVUZBTkF4MGNyMDYzaHhid3NHMDZ4cnhkakYr?=
 =?utf-8?B?ZEQyM3RtVWRpUTlmUmdudHJ3VVh1OXR6bVhzT0F3ODNWL0NCNWdiVERSQ0Zz?=
 =?utf-8?B?eTlNVnhraXJ5R2ZVQVFGYlR1azg5UzFKZGVxelpqU0YybHErQnZBOThXMHd6?=
 =?utf-8?B?VFlmMytqVlRxSHNPdnYyZ0pvc2tuSi9YZ29iN2tXSFBkYU9XMDJxYm9KcS9v?=
 =?utf-8?B?WFZnN2pCdi9yOUtnd0UwR3U4UGIwc0ppdXFQeS9RbDh4enhUV3p2elR5U21L?=
 =?utf-8?B?WmdsNFUzamZHL3lRR05EWTBNY3NGU2syWTM3c1hTaUhRQmkrNzErR1o5TER4?=
 =?utf-8?B?ZnNLUDlQOERvSFg4L2l6MkkvZmdPN0MzckFxamhnalZUV01nTjc4UUMrcnlJ?=
 =?utf-8?B?OTZ5bzhTQXVBaGZFNU12aktJK0ZUNTd5ZUhkYkVyMGZta1lqSGp4bFVNZk5M?=
 =?utf-8?B?cXllRVJKYjF5WjFEWUhWb0c3MGdqaDhtcXJOWWtUOFIyd2ZrUWpZQXVrd0RX?=
 =?utf-8?B?RklMeWVTa01SbVJpeXN3VnlHN2pIVWFSNWUrRURlT2JJdWYrVmxNN2V6eHpw?=
 =?utf-8?B?aGZSMEtMdVY2cGZ3a0dWbzYrS0FIMTduNTlva1dUOWM3L3pvaUl0c1h1cG44?=
 =?utf-8?B?YXhtbU10eEQ1cVFaT3daeWVDTllJYUtiU21oUmZnNXN1dWVCQWdLQU1aUnBs?=
 =?utf-8?Q?InTL0/bQYHI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0oxV2M4SWxtNFpjU2JUK2xvQ0UvdlVDTVBZVlBRK281MVRsdnRuL2M3YkhH?=
 =?utf-8?B?V2hOTTVKMlArR3FUOEpmR3VhTE5lV2o3OFF6VXNnd1UvMUtQaGRkQTVpYzYw?=
 =?utf-8?B?czF3Ylp2ZWlrYVhhb3dBdnB0ZGZKNzNOZmV2Vnk4K1pLMVBmSEhFQy8xQ2Np?=
 =?utf-8?B?c2RJa0tmZUd3U25VMkJzby9CM2dGTHVMdGFnQ2dqdlIyZytEU2VyY1lzSHJq?=
 =?utf-8?B?V25BZHhpNGFzTUVKUmFEWUlhQ2J5cE9EWTdqTUU4VEdMYlNjVngvcUxRcEQ0?=
 =?utf-8?B?UTAzcXk4b3hJelkzYUdoQVQ3L25UaFczR29GT0JNbFZYdE1kOGZmaFhKeUF6?=
 =?utf-8?B?V2FjdW8yOXIzN1hZS0h4Z0hrSko5YTd5Zk0vQzVPbGJ5SG1KQzE4RTBtcEwr?=
 =?utf-8?B?dWd1aVFJaitpb3dYZEprMlFOS2RNRHN3Q3hxaDVFei9iNy9ZWnd1b1FvZjNY?=
 =?utf-8?B?cHZZOURuUGcrdmJrMG10NXJidXFqSzVmN3VRdDhxQnlKSlR1UFdmUTVVcnR1?=
 =?utf-8?B?WDRraW1LbHFRTWRsQU5yZnRUMmxHZlpwQTNpYWFZeGNXdXNLTVh3VTdVbnEr?=
 =?utf-8?B?MHhsUURtQmMvdUJkYTRFcSt5b3A0cDNaZy9mZk4zbWVxRHJWeUFnOXdiY1l0?=
 =?utf-8?B?VndyR3V2TjB6NXFwVDNXdzJhU0tkMTd3dE5OWkJIQXFwUUt2MGlsdFFUbG9P?=
 =?utf-8?B?eWRKa2xHOXNhaFJFRjd4a2NVSlFoRTFpSWY0MHZBZFN6SDU4bElCQWNjdTU1?=
 =?utf-8?B?NEZERlRuYmNFb1U3WnprMDUwWUNTNVhudzhEVWhEZkhOd1RuZXRMTElWMmZQ?=
 =?utf-8?B?NFhnaWZLbDRWS0xQOHBraVBFSU5PMUxhaGc3R2pQUUpRUU9uK3ovN3A3bDJa?=
 =?utf-8?B?azNvUGJDaHNsUG5hZTc0YnJ4ZXRFNjVxV3B6YXBCL1hXVDVJdTdmZ2Z0UHpF?=
 =?utf-8?B?M0NOazZOOEwyTXJtaGQzSDk2QjVyMGJMckY2RW1pdTdRbjVKaWxwU3NSZER3?=
 =?utf-8?B?T1JKT1dRS2ptMnFxeTY3akZiTjlWVHRyS3ljUzdIK0ZIVlhpZUZIRkFab1lU?=
 =?utf-8?B?UWRqVklRNHhMb25SQTYyWHROV1ZCWldrZ04vRS9zUU1MdEtIKzMxTVpOYjVs?=
 =?utf-8?B?NWpxY0VYY0ozbWpmVU4xSXVLd3FqK3lIWEczaHMyQ2RGYzVkZlJBUDdhb2s5?=
 =?utf-8?B?eEs0RTFWTFp1Y3RaWVlBUXBiOTNoWHlLZkpyVDZHTDhCRS9nVmw0Z1lrTVRB?=
 =?utf-8?B?QVFadk93eWJZS0pWamZtU3FCWWsyOGFFUnV0b2RQdk9FTTJKMk1JSTZVNzE4?=
 =?utf-8?B?UUVTVFA3SUVxamZETThQaUJGUUhGNnNEWE42aHNhSjZLaUxETXlaTVI0ZHVq?=
 =?utf-8?B?cVM0bW5pNG1RU09nc2Urdi84alQ1VmVxTDg3ckxaTnBOV3YxV3JIaVc3dFov?=
 =?utf-8?B?VHpXaVdZc0lKMGRTcmVqUGtKcUxRUzdnbjQxWUF3dnJJelQrOXVpM0EzVXhR?=
 =?utf-8?B?V09yekZDMUhxMkFwOTREM0I2Z2svKzJ0SHlQVzZ1QlFBMkZrN0tvV3FXbTBt?=
 =?utf-8?B?QTU2WklMODk2ZDhlN3ArcWFXbWlVMFBHd3lwcEdZcFRZVnRkVEVjeXo0ayt3?=
 =?utf-8?B?VEpjeWJ6b1h6SW85T0dBR2NvWmlNQnNLT1ZSR3BYbFlFTHkzZERZbHVzQUg4?=
 =?utf-8?B?bDV0ek9wKzZUc0lXRCtWMnZlOUl0YWJ0ZFJCb3JLTUw0MklWeE1KVGJKUmx1?=
 =?utf-8?B?R3BNbHhZNXA2SmxWRW1RSVUxdFBlUXlYSW9OcC84MkZvNUExci80akdsak5w?=
 =?utf-8?B?UlZ0UnhValpzMmUzbUUwYlFucFNzU3E1b2d0a1dkQWgxZkRrY0pqcEE4WGtI?=
 =?utf-8?B?anpNT2RYWlZSVWoxa3NyVHJPd1NVSWtkVXdSa0FoaWxIYnVLNnZxbmdOOTh0?=
 =?utf-8?B?TkRJUWxPSklIMDdtYWtGMHhNWkdpMzVVN082elc5NXdSMTNWN2hodnFNMThE?=
 =?utf-8?B?VEFBR1hLbHdnWnpLOGJOSENnd1ZvNGkyeWYzZzFaT3ZvVXpmM21PMWFKN0Zu?=
 =?utf-8?B?UjdvT01BL3NrZVJWSVlQNmFwZE0wTW1aclYxUnQ1WlF2ZHdtUHp0TkpTQkdS?=
 =?utf-8?B?aWErQUQ1Wm9SQWkrQ0t4T2tWc2pCOFRuUTVxL2NYUUJtdlI0MXJvMHNsSnR3?=
 =?utf-8?Q?jaWNK741bsv4DJ58tm30axqX6iZcQ1IdvxoDP7C2BTA3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06182931-72a0-4d41-243a-08dda435f4bb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 13:36:20.5807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUjtNX5gNLUFG9NWjCvOG5/LS0cWjQIyjEAOi1xDfQtAkv8rZ41KQE/6+Nm/IK4ZQgbIx+uNBzhuruwTfFGOug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7355
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

On Wed Jun 4, 2025 at 7:23 PM JST, Danilo Krummrich wrote:
> On Wed, May 21, 2025 at 03:45:12PM +0900, Alexandre Courbot wrote:
>> +impl Chipset {
>> +    /// Returns the HAL corresponding to this chipset.
>> +    pub(super) fn get_fb_fal(self) -> &'static dyn FbHal {
>
> Please don't use the 'get' prefix here.

Yup, I've fixed that after your other comment.

>
> Also, I feel like it's a bit random to have this on Chipset. I think the
> standalone function to create a HAL was fine. (Same for falcon/hal.rs, wh=
ere I
> missed this.)

Works just as well, also probably a bit more consistent if we need to
create HALs that depend in things other than the chipset.
