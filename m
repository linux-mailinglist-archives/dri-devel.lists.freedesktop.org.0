Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC9FC0DB35
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CE310E475;
	Mon, 27 Oct 2025 12:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gsrWfPlJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012036.outbound.protection.outlook.com [40.107.209.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB4510E47F;
 Mon, 27 Oct 2025 12:54:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLogTrMrT1koGkY9E1FVcY206W1xy6EAtX7Iyt92Qh/REWW4ztlNCQI/P7AdT+KnnimD3Y8c9qSzj8Emisx2KqJQWtWtTWb3vTy+FbbzEkLIzsebwMdYC5wH3WBqd+Pa0yVQ7m21Q0CnctRmUA5KmSOsRrV1Y/ouIgF6NCk04u20M9Xtm6jmCNwFo6TfrKv4Aa1gd29rKym7GIchYB10kgD+gCqpLc6CFofU3LRVRjuJX+2bMIL6r32/cDLX/OXeN3f0WoMUKLTxxc2YPS2DcuRoqzvTLlALd/CxwWqJELouyY4Vq09Bt787ZnYxeBC+FjFRazlEPmeKzNzCL8a0LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSt2DKukHYXYQUxyvdrEx8vyYfLLdzKD2ID7ZDD2KYs=;
 b=KCEKX2ZVzAnUcdwEx6VUrQfXY930eYbnDLNgeLGAR86rjfgbSn6JfN/h1B+jMEsaEAK9sIMVe86C0gix46e7z+f27GpMfsTkB7RqE5tPpi78LeXWKimgGimxICtPSJaOgXPqTrhstbk1y0rsjSMbW7I6w9u1/QV/b6fdSVz91kJOCcuQu/1AuHGllqAorkPGqbkw0ZBH7oBAA+A0fBUc/XARUDZ0rgxNmHmM/0kaqBeJm0bu83sYpWV+22GHHfxBfDU+DGEptmDvGeyhGo+xKq4n4PvQC75H4GHMwaRXds2tywB4JGX+s0gjlyYeKgLa6zP+O3lUFt3V2L1LOOmg8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSt2DKukHYXYQUxyvdrEx8vyYfLLdzKD2ID7ZDD2KYs=;
 b=gsrWfPlJSt77aKelzobsFpBC2osx6aMNhb7fjxMDLwfViwDh/1Hg3EpYd0X8VWFpl9WC73HWvT8aDOW5usy5MiBY+xPwMs+Xrv0mjSf+tEBuAXpNf2b5MCP3NIT0kOdyzvLxSPXvkIbEfAqyWXAhrRlWOnUwBff7dPx1nWtOtcOdm3nGbTSQeb/WX1oSLXME1h6+gZiVuwQV4zB4pB7kWAsyXIcVoqOvmKJq2icuSyUle7q0XYp/XiEqxIahNEYbhGQ3vmW8PRu5VFEqKzP8qluwdhTugjP7OdmcbfNFHDnvckV9QxiQGlmw4i6t9Fh0QSTAu7sh0Zd4xNQeb8br5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 12:54:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 12:54:50 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 27 Oct 2025 21:54:41 +0900
Subject: [PATCH v2 1/7] gpu: nova-core: replace `as` with `from`
 conversions where possible
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-nova-as-v2-1-a26bd1d067a4@nvidia.com>
References: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
In-Reply-To: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
To: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 68415e14-1821-4a4d-b9f4-08de1558040f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTl5UlRKV08rMTJaSk8yUnlsUGRNTFFLZThFOXdTSmFES2NJR3dMWm9peFdR?=
 =?utf-8?B?bFprQlk1NW80cy93Y0xaQTFZYk80b1k4U2dWcFZ0djRsWVZ5SXFWai9hWklw?=
 =?utf-8?B?Q1hRcXp3NUIzSUkvVC8xZ1I5ZTR3YXNUSndDbWd0MXFSa0I3RXhXd3U2cjBU?=
 =?utf-8?B?NkY1WEF4WlF4TDI3VEdOeHRhQzVaZ3NXSnZNNEMvc0tiM1ArQnBIM0ZyY09r?=
 =?utf-8?B?UGVaZmFiVHRiN2FINWF1SURsTHRndWc4ZmxMekI5eXExaVJFZ0Y4V2xoRlFT?=
 =?utf-8?B?aU13dGdBeXpsdjFZcVlnRzByNlQ3VEpZdnIvY1BNM0FBbEVtZ05vRS9VU09x?=
 =?utf-8?B?N2hRMTZUQnAwdTl5djBBQVNMYU96UWdTcXZOMWZDUEZVTmdIVmxLa0trTEdn?=
 =?utf-8?B?ZFpXdkVzSnlod2oxbHRWaTNYdGNHTGp0YzJGajgzWFQ4SjZjNTVIdW9FMENG?=
 =?utf-8?B?WjU3TUdMeUF1QlhKbmdqYkJsYmZtZlViQ1R2a0tOcUdCWUw4b21POWdOUndX?=
 =?utf-8?B?KzBoV1BYYmF0eDEra3ppVDFWbTJBQWRxYlZRUG1LdmtseS90RkkxMm8wdlgv?=
 =?utf-8?B?cWFheE1mOXpZM0pUUGFkOGZrbm91bzI1TDRCeGxhVXoxZk5lYWNKZllPVVUv?=
 =?utf-8?B?S0JEUzcxNmp0ZVR2eHR3bytmbnJVdjVXRjdpMVdJbGVNd2FqSTdObkdQMlRj?=
 =?utf-8?B?dCtZWjBQSnF2VGs1eFIwRVZtanBFNGZrZklGTVp1TE52eHhqMkppK01hbHI3?=
 =?utf-8?B?K25xa1NiZ1NOTmV2M1ErZGFFUVMrZlVkOS8rRWFHWnpCL0tRWkVMNTFiYlJ5?=
 =?utf-8?B?eWZFWkhzSElXYlNhMWJnM1luSUR6b1FpY2RxMll5YTFQMmVTZkFqdWZ2QVk5?=
 =?utf-8?B?MDZZNFl5UjU1ZlBaK2JPSDR3cnVqSVg0bnBHMzhHRE5WbndkTVlnbTN3NFNO?=
 =?utf-8?B?SEMyQm10TjRpWS94T3JjM3lKL255TnBmc0VxM0lKcW5IczBYN2E4VWNMQUNv?=
 =?utf-8?B?Y3BjbG9LdjFlT3JtV1o1RVhpMURYMk9SNnlMeVVRTzR2bUNROG5hQzRRUXA1?=
 =?utf-8?B?L3A2eUJqY2xjQVFuckxaMWdpT1NNaFg4L3Q2Z0daQWsxeS9VTTFoVUVuNzBV?=
 =?utf-8?B?ZVVid1h6NEdlOUJheStpdGxtYStWSWJadHpaVzYxakVOd090bXFCRTNpa2hO?=
 =?utf-8?B?UFFkNW9SY2RTNHorSmo4WWVEL0lTWHJqSmFObUlCM0hTMlUzVEZodE9YcDZn?=
 =?utf-8?B?R3VpbzZVdkRYU1M4SjNKajhGbzE0UndNYjB4VWlDa2JUY1JraXBOVjVpK1VS?=
 =?utf-8?B?a2RZbUI4NUZZNERHdEs1NkdaQkxvTlBNWTlScXRoQlk0Z0pheXdzMzQ1VHhI?=
 =?utf-8?B?QUV2cXBnTDdBK1pXWEVSZ3RpNVB5UW5kWnpOWnFXQzlpZmhiV3FvVUQ3TjMr?=
 =?utf-8?B?NWxiejlrYmp1QVFuNVZJVzNacHdhZ3JxN20wUVViZFFjT0pzU2tjdDhocHVK?=
 =?utf-8?B?R0YwckNwN1ZOWE5ReXdLNWg3OXM4aS9RUTRrK2gyRkdWa0FEUTRBTEp4YTJF?=
 =?utf-8?B?Vk5KTW5ud3BIcms2THJVcGQ1dGZlTWx2ckpIbVo4bnp6OFdMajBYeG9uNWdn?=
 =?utf-8?B?UnNKcmttZGV4NlpWOTZiaEIrbFBQZlhxbzRjTTBVYUVTWm1nOWc3Mzc0Y3FZ?=
 =?utf-8?B?cGUvUUVIVVVqV0s2ME1CL1FZeU9qUGxITFR3NndBOVpuN1FkbzcxR0VkY2xn?=
 =?utf-8?B?NFQwYTMvQzk1aWJSOFQwWHVNT0p2b1dnaFp1cUJFRndBV1RXYUY2YS9hUzdv?=
 =?utf-8?B?R3FaK1RQdmpIOVVDVGlPcUtFL1BUSjJ3aVpNTU9VdzNKeEtPNkxmd3F5OVo5?=
 =?utf-8?B?NDVFdmtNRmpyRVBoZld3VnlzNnZMQXFVVzh0MDVlRHJET1c3OFBlV0M0WEF0?=
 =?utf-8?B?ZWY2VGR4YVFxOGtOVUZnNXp4MlVFYVpHaWs0WjVPalhyS2NYaEo3QUtuejcr?=
 =?utf-8?Q?7hPAPt/jCnK2RK2ngbBD4gpHuM/Kug=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1FCMDg3REY1VW1NeEFRSy9EZk01QkkvMXA3M2Z0aEpBdnZhUTM2SzZsNEtk?=
 =?utf-8?B?OGhQSkhaMXIyd2J1bXNkb2g2RDZlaXN2QUVkZ2hoeU9zQXlQcnFGSEZPQU5C?=
 =?utf-8?B?dmpaSEJ0NDlWcGxHeUxZU2VQellDTjVPSTFCNXpQM1lUYXRaQmg4cVVWNE50?=
 =?utf-8?B?dy9MSHZiQW1BUURLbXRtTjFLaEQ1anVHZ29vdS9xczhFUCtRbFhoM3VoVGtU?=
 =?utf-8?B?MDVQelR1NXh4OUZNMkRQOUZaQzdNTWZaR3EyaExhbXl4aStvd0VwTUkrUE1B?=
 =?utf-8?B?Uzd3R0Fha0pHNW5rUmROQ0NabW16Z2xoUWdWUjhLZWp5d2lUblQyN05ZaUF0?=
 =?utf-8?B?UWVPR29pYnRiZ0E0ZTJKM3R3OHhjTktISGlTV0x6b2FLMFhYWU40WWQ4NU9P?=
 =?utf-8?B?aEM1bmlySG81dmI3OVV4RGw4NVRHcDVhYWxYcm5peVJyK1YxYnIvYXhqLzlk?=
 =?utf-8?B?c0NSZFYrWHVmZVM2TmtCUFQrZ1pJcG43cHBDT1pPZWd5SGJUWHhMY3hGNUV4?=
 =?utf-8?B?UmhxUW1xRUtkSTNPZW5UWHgzcE1McWk2cS8xbzdISkdQbXhCYzBLSW5TZ3ND?=
 =?utf-8?B?NG1rMUI2V1RDTGN0QnhXNjRVOW9OWEVWN3VvNHdjWXV4a2x2dDdXWkpWMTd3?=
 =?utf-8?B?ak9NZ0lUZ1VUNjBUMnpaRTVzaUVVbG1nZHJJUCtReFptbExwUERhYXJGNDl4?=
 =?utf-8?B?bWRWSVpLelV0cytvNWxiZUgvbmF5WmtQbnlZL3dJaFNjZERkK2RaMlpXOVdJ?=
 =?utf-8?B?dVFCVm5aZ1VVRGlmOWhyTTJkbGM2aHFaVkhmZ1V1RjJzZUZZK3g2djlDRlFI?=
 =?utf-8?B?d09yNW5KWlV4MzNtY1k5bk9OeGQzcHJvM2xIaHArd3pjSnN1aVhCcXpvRXNS?=
 =?utf-8?B?U055NVhOUFVCckswWWNLNGh3TU1NdmZ0ck5hdE1HRWZSb21PWGJWTllyaDky?=
 =?utf-8?B?RE5lb2Vkdkh5TmdSTmRzRTN0aC9MQVB6N1FIdUpFVXJwQWw0WjUybkJSTnpJ?=
 =?utf-8?B?aThBOVdjWlZlOER3SytQS1lXYjFQYi9Ud1oybGUyOU5ocTVhdHlOSndQSEtN?=
 =?utf-8?B?RWQ4ckZncVp5WFZtdzJ2c2dIWjdvRURnZ3hiTHdkQWlDTENFamYvdEVoYTdQ?=
 =?utf-8?B?Q1g5WEJqdUFnUjdjLzBkT1lHY3JTM0FEa3A1YTZ3YWlDbWY2NnRSVEVFNWR0?=
 =?utf-8?B?OUs2dUJOaVVQbXJ2QXpzK3pVQVdwT0Z1OE9RS3B2OW1tL3JOLzVpM3h5dlFH?=
 =?utf-8?B?WGJjckhKSlJYTDMvMnkzRnpraTRqR0ZZU2hoeTJ5WW1ySWI3THcyU2VuUHp0?=
 =?utf-8?B?b1I0OExJT1ViSlNYZ2hpMk9XYlVEaU9UZFVzZVRVWnlETG9VdURDUFF0TXlG?=
 =?utf-8?B?aDlTYXpLZTdwN2pOYTVsYTE3U3RwUk1obmlEeEhOODM0SzZMVTZ2OVNZR1hE?=
 =?utf-8?B?eGVVTlBnODUrdFVJcUhQRTJNKzhUczVUcmp6Nk9haFJaT1JSSzFuVVV4S0JI?=
 =?utf-8?B?ZmlzY1dRZ2VKZ0s1OG40QS9lZmdxamFLckVKU21mVldHdllMVEZlOWlIQTN1?=
 =?utf-8?B?QjNNYnNyYUZ3NjhCZ0pwemo0eStEYkwvWXBCU2NubW9sUzFQWVRab1Z6ZW9Y?=
 =?utf-8?B?YXV2aGVQdWZxdlE0SmxKV05mRG9oZ3BNU0Y4bjhnWDY3VGt2dVBXL01nTzZZ?=
 =?utf-8?B?bURsT0xLaVhiREk1VWFRQWVVZU5tVkNkVXlhSEJmYTZONEJWZXJmdFFoWG1j?=
 =?utf-8?B?MitEN1Y3Y09raGVhMkYrRHpTaGF2aDk5dFYzMGk1a2hadGMreGlqMkl3OHJW?=
 =?utf-8?B?c1R6TkRNV0RQbHpaeGNmWkw1RXRUcnNXZE5SeHlQUDNkSFlaUDFoMTRVNDRU?=
 =?utf-8?B?MDJtSUp0aHNNMTZCaEpoNGxaWGJ0cVVjbXd5TnBFdTBBMDl3TFdRTzRuVzFW?=
 =?utf-8?B?ZFpobEc2MVozYk91dmFEOE0yV2w0NGdJTG9tblF0SDh1eXFlTGlwczA3N2VJ?=
 =?utf-8?B?OUtLOVlnREF6eFp4dlVtb1hFbG85eUJoVFVTMjY1Ui83ZmxIYTllVHdtREdk?=
 =?utf-8?B?allOUFFuaXN6TlluZWt4aml5L2wzUm84Y0ttajFOY0hDeENyVDEwOHZoVVFZ?=
 =?utf-8?B?TDhxY2RPNHhBcjY1YnNxVTdEK3JmNHJFNTVubVkxaDE5cDhtSzJXVG01VGlp?=
 =?utf-8?Q?WZK9cgF17Sbi7Z+oX0H56yMpJfZ1D9vUM0otZ4VK/QtC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68415e14-1821-4a4d-b9f4-08de1558040f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 12:54:50.4202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+s7H3unUy8P8ato0dgBq5kQKpaPmGpM8j6So13SRf2RHpZU4SaxSh3LH8VL9XiKK7iFgc7opM6T6a9/GonN/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863
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

The `as` operator is best avoided as it silently drops bits if the
destination type is smaller that the source.

For data types where this is clearly not the case, use `from` to
unambiguously signal that these conversions are lossless.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  6 ++---
 drivers/gpu/nova-core/firmware/fwsec.rs   |  4 ++--
 drivers/gpu/nova-core/vbios.rs            | 38 +++++++++++++++----------------
 3 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index f2ae9537321d..afed353b24d2 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -40,11 +40,9 @@ fn signature_reg_fuse_version_ga102(
     engine_id_mask: u16,
     ucode_id: u8,
 ) -> Result<u32> {
-    const NV_FUSE_OPT_FPF_SIZE: u8 = regs::NV_FUSE_OPT_FPF_SIZE as u8;
-
     // Each engine has 16 ucode version registers numbered from 1 to 16.
-    let ucode_idx = match ucode_id {
-        1..=NV_FUSE_OPT_FPF_SIZE => (ucode_id - 1) as usize,
+    let ucode_idx = match usize::from(ucode_id) {
+        ucode_id @ 1..=regs::NV_FUSE_OPT_FPF_SIZE => ucode_id - 1,
         _ => {
             dev_err!(dev, "invalid ucode id {:#x}", ucode_id);
             return Err(EINVAL);
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 8edbb5c0572c..dd3420aaa2bf 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -259,13 +259,13 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
         }
 
         // Find the DMEM mapper section in the firmware.
-        for i in 0..hdr.entry_count as usize {
+        for i in 0..usize::from(hdr.entry_count) {
             let app: &FalconAppifV1 =
             // SAFETY: we have exclusive access to `dma_object`.
             unsafe {
                 transmute(
                     &dma_object,
-                    hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize
+                    hdr_offset + usize::from(hdr.header_size) + i * usize::from(hdr.entry_size)
                 )
             }?;
 
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index ad070a0420ca..943b0dac31df 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -361,7 +361,7 @@ fn is_last(&self) -> bool {
 
     /// Calculate image size in bytes from 512-byte blocks.
     fn image_size_bytes(&self) -> usize {
-        self.image_len as usize * 512
+        usize::from(self.image_len) * 512
     }
 }
 
@@ -439,13 +439,13 @@ fn from_id(image: &PciAtBiosImage, token_id: u8) -> Result<Self> {
         let header = &image.bit_header;
 
         // Offset to the first token entry
-        let tokens_start = image.bit_offset + header.header_size as usize;
+        let tokens_start = image.bit_offset + usize::from(header.header_size);
 
-        for i in 0..header.token_entries as usize {
-            let entry_offset = tokens_start + (i * header.token_size as usize);
+        for i in 0..usize::from(header.token_entries) {
+            let entry_offset = tokens_start + (i * usize::from(header.token_size));
 
             // Make sure we don't go out of bounds
-            if entry_offset + header.token_size as usize > image.base.data.len() {
+            if entry_offset + usize::from(header.token_size) > image.base.data.len() {
                 return Err(EINVAL);
             }
 
@@ -601,7 +601,7 @@ fn is_last(&self) -> bool {
 
     /// Calculate image size in bytes from 512-byte blocks.
     fn image_size_bytes(&self) -> usize {
-        self.subimage_len as usize * 512
+        usize::from(self.subimage_len) * 512
     }
 
     /// Try to find NPDE in the data, the NPDE is right after the PCIR.
@@ -613,8 +613,8 @@ fn find_in_data(
     ) -> Option<Self> {
         // Calculate the offset where NPDE might be located
         // NPDE should be right after the PCIR structure, aligned to 16 bytes
-        let pcir_offset = rom_header.pci_data_struct_offset as usize;
-        let npde_start = (pcir_offset + pcir.pci_data_struct_len as usize + 0x0F) & !0x0F;
+        let pcir_offset = usize::from(rom_header.pci_data_struct_offset);
+        let npde_start = (pcir_offset + usize::from(pcir.pci_data_struct_len) + 0x0F) & !0x0F;
 
         // Check if we have enough data
         if npde_start + core::mem::size_of::<Self>() > data.len() {
@@ -737,7 +737,7 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
             .inspect_err(|e| dev_err!(dev, "Failed to create PciRomHeader: {:?}\n", e))?;
 
         // Get the PCI Data Structure using the pointer from the ROM header.
-        let pcir_offset = rom_header.pci_data_struct_offset as usize;
+        let pcir_offset = usize::from(rom_header.pci_data_struct_offset);
         let pcir_data = data
             .get(pcir_offset..pcir_offset + core::mem::size_of::<PcirStruct>())
             .ok_or(EINVAL)
@@ -805,12 +805,12 @@ fn falcon_data_ptr(&self) -> Result<u32> {
         let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
 
         // Make sure we don't go out of bounds
-        if token.data_offset as usize + 4 > self.base.data.len() {
+        if usize::from(token.data_offset) + 4 > self.base.data.len() {
             return Err(EINVAL);
         }
 
         // read the 4 bytes at the offset specified in the token
-        let offset = token.data_offset as usize;
+        let offset = usize::from(token.data_offset);
         let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
             dev_err!(self.base.dev, "Failed to convert data slice to array");
             EINVAL
@@ -818,7 +818,7 @@ fn falcon_data_ptr(&self) -> Result<u32> {
 
         let data_ptr = u32::from_le_bytes(bytes);
 
-        if (data_ptr as usize) < self.base.data.len() {
+        if (usize::from_u32(data_ptr)) < self.base.data.len() {
             dev_err!(self.base.dev, "Falcon data pointer out of bounds\n");
             return Err(EINVAL);
         }
@@ -886,9 +886,9 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
             return Err(EINVAL);
         }
 
-        let header_len = data[1] as usize;
-        let entry_len = data[2] as usize;
-        let entry_count = data[3] as usize;
+        let header_len = usize::from(data[1]);
+        let entry_len = usize::from(data[2]);
+        let entry_count = usize::from(data[3]);
 
         let required_bytes = header_len + (entry_count * entry_len);
 
@@ -923,7 +923,7 @@ fn lookup_index(&self, idx: u8) -> Result<PmuLookupTableEntry> {
             return Err(EINVAL);
         }
 
-        let index = (idx as usize) * self.entry_len as usize;
+        let index = (usize::from(idx)) * usize::from(self.entry_len);
         PmuLookupTableEntry::new(&self.table_data[index..])
     }
 
@@ -1092,8 +1092,8 @@ pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
     pub(crate) fn sigs(&self, desc: &FalconUCodeDescV3) -> Result<&[Bcrt30Rsa3kSignature]> {
         // The signatures data follows the descriptor.
         let sigs_data_offset = self.falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
-        let sigs_size =
-            desc.signature_count as usize * core::mem::size_of::<Bcrt30Rsa3kSignature>();
+        let sigs_count = usize::from(desc.signature_count);
+        let sigs_size = sigs_count * core::mem::size_of::<Bcrt30Rsa3kSignature>();
 
         // Make sure the data is within bounds.
         if sigs_data_offset + sigs_size > self.base.data.len() {
@@ -1113,7 +1113,7 @@ pub(crate) fn sigs(&self, desc: &FalconUCodeDescV3) -> Result<&[Bcrt30Rsa3kSigna
                     .as_ptr()
                     .add(sigs_data_offset)
                     .cast::<Bcrt30Rsa3kSignature>(),
-                desc.signature_count as usize,
+                sigs_count,
             )
         })
     }

-- 
2.51.0

