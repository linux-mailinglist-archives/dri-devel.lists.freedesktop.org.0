Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 828FDABEC42
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D964010E690;
	Wed, 21 May 2025 06:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ddIZ8AW6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A170B10E68B;
 Wed, 21 May 2025 06:46:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJFmEn+qw93tUBJeLEPjK3i7fqRuI8on1JfGMTg8F/06JFPiGRT8WUIa1nBwCgV074wU6XMgir0gHB1N9W8WhY3b84qKG5Su60o8MVPOTNYDozVneZD28HAcymesOiiE118jP/DVd11pJoAQzJu9+QAhrDJczfAVEvUSgb1SebzRILFvyznW/S6w2Yp4w/Zf/JDr2Y6SoEwARVHQF7yHJYajultFvFSkGIxfqx2AMOrSifQDMEJtAasf1J+Ah/vIvkCFsiOItgyReVgtuficuktZHHlN62A0FROztkQtmdlR8vphWZlwa3Tu2J5zkkP1l7Eq5kbkmU+g+XeNU3Bj1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnVhgaBBPcU/DqstXsV/yMgOjn0OKMrpKmG2mH2GYhg=;
 b=Y90OFt7hL71x2af71uWbO7f4Bsl1tod97u446ei+rrq/nmnn8UbuRvKgTFKo50ypLPdjluJ91ObHHcgygFAqTxtCwWoi5TOTOum02yfOmNDsPHVKB13OuQJLuMdF5gvOYI4La4yZda0/txQJAhs8zcXtbn3kt50lDRWXJO5DbYGFS/jDEJLsvTGqWuAKPQzEKLwHgx6HnbGkvpv/+Jdy2M/udkAErrKJ9yXCBmavgNAyhanheqyjn+lg4AizdeXljlbe8Tux/PLKhuRavXFS3Egasipd1PhKXQYZsYu98jUvvTCkIgnfbzXeGO/Yk560YkbXI3bmvbV+VWheVIJ83Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnVhgaBBPcU/DqstXsV/yMgOjn0OKMrpKmG2mH2GYhg=;
 b=ddIZ8AW6l+xsnLrIGgel1iFouNGwrrSVcNhA2C+HZhelFL85uNlp1ITEasBKN9hunjFOUNYAAkGjai4uGU9XHEqtJesgphihkAccSIe3AiHtRExjSIYeAl9uAdcTWtaMkUVRD5OIKtO5zzg97EZAGSK9Wu1Q4VuUlPaMUZDaomRgeJNgKtOB0dFC+Od4Epq4s8SwA4jfSpOljgdsWfgqJqa0mkqLeYwuER6yy+eR3YTmmZHe9ABM5SoghHeNeZTuljljA1rSblE3YLeSPcjDbL1tUGWWKgKtYdtpVfygDbryFsbLM0puor5lEIGIjm9IyMlBl5lD1ZElw4eftVHk0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:46:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:46:13 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:45:14 +0900
Subject: [PATCH v4 19/20] gpu: nova-core: extract FWSEC from BIOS and patch
 it to run FWSEC-FRTS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-19-05dfd4f39479@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::13) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b9e170d-82a1-42f5-68e0-08dd98332d9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHg3dTVZdmlNY1VtTWZZbkVSWWtlZXplQmpBalpOOWtEYWJVd2g3aTBOZVJI?=
 =?utf-8?B?dnMrMW5BM2wreDkrWnAvTm5HMmNxaDZtajdDSVNyOTcrcVhQRFRrc1VaTVRw?=
 =?utf-8?B?SmF1MWdxMjVjQnVNNXdWZElLYU1tYk9XSEdySmNZcmdzRFZablNlNFBFMEha?=
 =?utf-8?B?dWVVUlhMazZSU3hUNmJiWFNkbVdRRnVvT08xSWpPeUJWcVZzQTFBUE9zbDRv?=
 =?utf-8?B?OWVoVC9yZmgrZDBTZFlHOWtvOGsvc1hKWExBTVEzZlR0clEzaDFmZjVRWDM5?=
 =?utf-8?B?eUlJYnBocWthMTRsRU45YitwNHhNK3htczFTdjVLaU5jZlZoYWtZQVk1cXZH?=
 =?utf-8?B?ZXRjNkVVOTBtSTM0SFl0eTlWc3Bkc0ltOUxTNVFSY0dLUys4YUE1TlRHQjhG?=
 =?utf-8?B?aTluenltcEp0cStFOUlhcmE4eW9zeEp2QW5OVHFIU3hpYW9TdDJzQXM5TmJ0?=
 =?utf-8?B?REJta2xFa0czSUhrNTZRSUdHT2hTRCt4akhodEVjT3NoSWRUMm45cDRjNVFp?=
 =?utf-8?B?ZEpWaDhaTlhQcy9yTWFDZ3VrTFp2RVVML2ZST0orMkpYZDdQZDhIVHEwS2JV?=
 =?utf-8?B?ajVoZS83OWw0NS8zZjZicXVTU0lYUEUwdG93VG9XUmtUTEVPMGhkaTZDckgx?=
 =?utf-8?B?d2x3V2RxTGxWQlhsNW9PSkZlZXVJQ0tVVlVaTEhoUWNyNUlNbkFxQ1dTNWVL?=
 =?utf-8?B?S2VHWWlGNEswSkphdG5WMWZmUmhlelQzcjlyUWcrdWlZZGRpbW9WQTd4K1g1?=
 =?utf-8?B?aEd3MG1pTmMvQmpLMlpSdXFFdUViMG5Ld2k0SGg4QVo5ZGN1VkpQL1ViR0Zj?=
 =?utf-8?B?WGpFRk5zc0dra0g1ZVN1b3FCYUlER3RqSmVNNTcwTHNIdWlyRHpTM0w1TUNs?=
 =?utf-8?B?Z2NDMUs3L3NyeVhabjZ0NTVkNDMzb3c2T05ZYWcxb0xvbFV0NzA2QUx0Mk5Y?=
 =?utf-8?B?NTFVbUdIbUpRMWx4Ri8wSVNneVYxRE5vbnppYTF5Rk5sRlJxL2R4U3ZiRGtS?=
 =?utf-8?B?K2xVQWJCZExwT3QxNlJ2dTdZK0tLYzdaaEJzemwxbVg4a0VHalVBZThJRVhM?=
 =?utf-8?B?TUx6MDNRbm1tdWYvOVNsT0poWmxhTDh2U3NFYy93SkQ5Z0hQL1BTcWZIc282?=
 =?utf-8?B?SGVQbzFHSnU2RXRycnpYQkFCLzJaQjZ5T09ubFhZOUlGQldQLzBHQSsyMWtT?=
 =?utf-8?B?aFREaTZXbm9VMzl4ay9BSzY5bDY1VEdiNXlLdllLVVVIY3RtdCtXNTdYWi9m?=
 =?utf-8?B?Qk5TaWhGL01xYS9tbnhUcStoc3llVklQQnpKZEZRNmtzTmhZdGJJVDdrT1dk?=
 =?utf-8?B?RzREOGNqOTdRZC9ENWY0UE9Mc0ovRk9SVmFPTTdVYjkwbWtFaUZXczJiWkk1?=
 =?utf-8?B?RUcvSzhPSFppcWhmTkdYSHhVdkdpU0Q4cUtQaDlyKzNFUFU3Wk1MUFFLSG1Y?=
 =?utf-8?B?THdBazlEaHZMbm5Tekw1bEY2Yi9sbVdmZ0lzZURWV1l3dWVUM3hNOUZ2V3Rv?=
 =?utf-8?B?MWUwbnloUGV0eUpyUW5pZmRBVDI4VmFqUlN2RExBN01wTTlwSjN0R0VQN2Jk?=
 =?utf-8?B?ajhNSGZ2WGpxRFFDZ3JXbXkrc2tJWkV6THIyYzZ3N3M0L3lmMzFXS2dpS1Iz?=
 =?utf-8?B?RUd3SjkyN3M1M1lwSkJOWjdsWnEwTXN5Q0NHYlc3U3FGc0xBQ2hJMzZCckw3?=
 =?utf-8?B?WFYxM1lmRi9BLzg0eDBmSHZyMjk3UC91RFdJUVRYZ2hOM1EyK3hMZnc2QzE3?=
 =?utf-8?B?UFRIWEZQS3JQbjlVT3V1T3A2ZSttOHBtd2dMeWdxS0Z4cjNvZ1IvZ2tjcEhF?=
 =?utf-8?B?ZFJGTkpxR1NHbStSUEVaeGR3SnhRNklFalZPR08zZE1LdlUwMGc0czR6QUND?=
 =?utf-8?B?NUZhQ3hzOHpOV2owWjcrYXROS0taSm1iTG1xVEhhRGNDM3RTSlJSYlk4Uko1?=
 =?utf-8?B?Ly9CUU44ZDFRRHA1OTdmWjFlbWd1bk1hS1o5aXV0cU1uNkhPSjVkMjg4S29P?=
 =?utf-8?B?RnRIVTBWVkh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWdYMlRRbEprbi9RZVR2bWR0dVEzRy9PQXBYVyt5MHZSVFB5bzRHMURmVU5I?=
 =?utf-8?B?c0RUMHFMa3Z4M0RSZXFORVRiY0xrOXhRdUgvUm4vMkFNeEphTXJ6WTdEcVdX?=
 =?utf-8?B?dHg3Q0xxN3kyMTNSbzNaaVU0YUI1bWhUV1plY0ZIQ1ZmWWhybm1VNWM5eTEw?=
 =?utf-8?B?dlhyVC9HSm5VYlkwSjFlYkpVZnR2aS9HU1pHaUJOMWRkT2ZvdUJqL1dtWUxT?=
 =?utf-8?B?NFdwVGZKdnhEZGEyOUZlOWVZejhkL2taVHlkYmc3UmI4a2pabU9mZGovOXJQ?=
 =?utf-8?B?WCtmanNObWlFaWtqckllWm1FVUw0aENwTDg3Ylo0aEZJbm9NeGxFNmNubXpC?=
 =?utf-8?B?K3JSODkxVDdKZzhVUFluQzR0d0FsSHVRQmpPRk42YXRUUWhuYktqSmlNUGJo?=
 =?utf-8?B?K1FwQU42azBYbnpKd3JLeFJ6S0ttdDdrRDFSYjlTZjlRcVFsejNYdW5qckFW?=
 =?utf-8?B?VlllMFozNHpCYmJZcW9OcEJZZlY1L0xOSCtkYWlyV0hacTRabDdTdS9QKzFt?=
 =?utf-8?B?RzFVYVJiYzNFeHQ4V1NIWkRaMzNOdUNUNkFhbWpYWHR2UTF3Ly9ZOFpPbm5j?=
 =?utf-8?B?VVh2YkZLWmpkdXo3ZzZhYkh1bktLSEhBM2hubldWZVB4RzgwK1Nsa05seE5z?=
 =?utf-8?B?dUtBYTlHYnF5OVV2VmJmYVlja2JsLzlSZFgxZHQzUDJDaDZtNzFGREh5S0NW?=
 =?utf-8?B?RkN4bVhEU0tQYzJXOXVFRy9qMGlqZTE4Qm9aSVhzbXRuSUxjdzhHSzh4RnFn?=
 =?utf-8?B?RldIZytydW9JMjdFSngybkdEN3BQMDd0T2NTaWJxRzc2Y1hyMEpNZm92MjJZ?=
 =?utf-8?B?Z1U0dUhVYTFqa2EvSXJaU29wZWxHSGJJNWlOYUlYMTRDdGgrWGxyMzlVU2pB?=
 =?utf-8?B?NUdmSXVJMkx1aEZvbTNRQjFYSU5UK0hpdFh1cFNiSDNzRzNqVGptZW9MQ3FH?=
 =?utf-8?B?NVV2azB2TmhHR2YvbklmblRvSVlLdFU1Y0JTSDNLNG5qQVNieG95YW9xZ2kr?=
 =?utf-8?B?eVJ0RURLNWlHeHFBMW1sZSs4dUVneWZCVHE4Y3dnRjIwd25DMHJPeW9LaE9q?=
 =?utf-8?B?NnhlOVhibDRnc3Btc3ZVZVAzNWdJZnVxYUs4RVg2eFB5cERKd3VqNzNEVWlG?=
 =?utf-8?B?cVRUVkNPSWxzTVFDeDMyYnlMTGROUDlZL0ptakRkazhNN3lYTGJYb3E5eExG?=
 =?utf-8?B?clJjaGtBR0lLcENRZ2UzbUNlL2g2cFAxS3JpNG1zeXVwS2NBVktJYzh6T1c3?=
 =?utf-8?B?ZXFzTWFWLzRKd2RwTWZxbUlWNlkraWJWQjdoSGppbUluVzR4Uy9hN2RRUlR3?=
 =?utf-8?B?cDRpWmlmbXVhQTRET2tEc0hmU200aWFQTTQ3VDlGbFk3M1A1bWVxRUw2dmdV?=
 =?utf-8?B?ZTZocS9CVldJb1h3SHNXWW8xWVR0d1FrcEFqUEV6TlVWU3k1Sk9ZQzdTUEU5?=
 =?utf-8?B?UDMwUjFZZ3BUZzlicVlvZ1BIckU5V3pwM3dZM0lqQ1V1cGhYbjE0Q0VqRWNO?=
 =?utf-8?B?eXdMYStQQW5GTUFhQXpDOWJTVm5DeXlTZDJyR2FxNjZ6WkRydU0yL2x2aVBC?=
 =?utf-8?B?TFJNenNHekFXMnQrYlpIT3RhMUNPeTM5eEJzOUhET1JhMklCQjRLbHdIem53?=
 =?utf-8?B?M1QveWQyMWVNVVl4Z09WQnZzSEdDbkJEOHA4NEFNZDBFdVMyaXBZTFQxWnU5?=
 =?utf-8?B?ZEJ2eTFpdlh6VHpIUXZxNnVLUFNvak4zM1JFSVRpUis4ZGcxYldNcDVzZHNJ?=
 =?utf-8?B?azJNVkJjbTBpeEpnYkphR3M1dU5QclJ4UEh0UHordXgyRERLak5XK2JUMUlj?=
 =?utf-8?B?a3ZzM1ROZW1DQjA5Q3hmRE9UU3NNSzFBSW9jN1hBUHFzcFVEL0N1MURXZ2ZD?=
 =?utf-8?B?M0E0ZktZZmsvZDZ5S3ZNekp6SW5rY09kVFFxa3dFMW1MWE9QMnlLaHJZR0tx?=
 =?utf-8?B?K3BsS0k0aU05WW8rT1htTmpnbGk2TVVXNkIxcXArKzZKbU5LdForbU4vS2hB?=
 =?utf-8?B?TjVDS1RlRjZvM1BGVE50YXRYQXNLaWhIZDlIWVBVV1pTUjFLQmZWVlFlSnNT?=
 =?utf-8?B?S293SnJxcUtJTkpwM1U0dVRvK0EwRExET05TRnhxS2dnd3lQakVMV3dDSUJ6?=
 =?utf-8?B?eTJRakNEMC91azhyUkFKRlNtQ1FCcWtIRjdJQWFXTTZyUWNVQmpRZHlLVXd0?=
 =?utf-8?Q?zN+Tij0cjTaLny+n4IJnDq51LHT5uCKrRowy1UMd83Mi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b9e170d-82a1-42f5-68e0-08dd98332d9e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:46:13.8242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCONSDiOL4hgADuRwD5KpumvnQHJJ/8LAGfjFHVdFQ2tRjoThxfMaaOya19DEpBar2HBXv5Qu0QDWMYVLRzj+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

The FWSEC firmware needs to be extracted from the VBIOS and patched with
the desired command, as well as the right signature. Do this so we are
ready to load and run this firmware into the GSP falcon and create the
FRTS region.

[joelagnelf@nvidia.com: give better names to FalconAppifHdrV1's fields]

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs       |   3 +-
 drivers/gpu/nova-core/firmware/fwsec.rs | 394 ++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs            |  15 +-
 drivers/gpu/nova-core/vbios.rs          |  34 ++-
 4 files changed, 432 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 3909ceec6ffd28466d8b2930a0116ac73629d967..7fceb93f7fec5b8eebc04ae1fc09cc2e65adb26c 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -15,6 +15,8 @@
 use crate::gpu;
 use crate::gpu::Chipset;
 
+pub(crate) mod fwsec;
+
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
 /// Structure encapsulating the firmware blobs required for the GPU to operate.
@@ -96,7 +98,6 @@ pub(crate) fn size(&self) -> usize {
 /// This is module-local and meant for sub-modules to use internally.
 trait FirmwareSignature<F: FalconFirmware>: AsRef<[u8]> {}
 
-#[expect(unused)]
 impl<F: FalconFirmware> FirmwareDmaObject<F> {
     /// Creates a new `UcodeDmaObject` containing `data`.
     fn new(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
new file mode 100644
index 0000000000000000000000000000000000000000..1eec9edcc61caf32c3b4ea2e241bdf082d06aeaf
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -0,0 +1,394 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FWSEC is a High Secure firmware that is extracted from the BIOS and performs the first step of
+//! the GSP startup by creating the WPR2 memory region and copying critical areas of the VBIOS into
+//! it after authenticating them, ensuring they haven't been tampered with. It runs on the GSP
+//! falcon.
+//!
+//! Before being run, it needs to be patched in two areas:
+//!
+//! - The command to be run, as this firmware can perform several tasks ;
+//! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
+
+use core::alloc::Layout;
+use core::ops::Deref;
+
+use kernel::device::{self, Device};
+use kernel::prelude::*;
+use kernel::transmute::FromBytes;
+
+use crate::dma::DmaObject;
+use crate::driver::Bar0;
+use crate::falcon::gsp::Gsp;
+use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadParams, FalconLoadTarget};
+use crate::firmware::{FalconUCodeDescV3, FirmwareDmaObject, FirmwareSignature};
+use crate::vbios::Vbios;
+
+const NVFW_FALCON_APPIF_ID_DMEMMAPPER: u32 = 0x4;
+
+#[repr(C)]
+#[derive(Debug)]
+struct FalconAppifHdrV1 {
+    version: u8,
+    header_size: u8,
+    entry_size: u8,
+    entry_count: u8,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FalconAppifHdrV1 {}
+
+#[repr(C, packed)]
+#[derive(Debug)]
+struct FalconAppifV1 {
+    id: u32,
+    dmem_base: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FalconAppifV1 {}
+
+#[derive(Debug)]
+#[repr(C, packed)]
+struct FalconAppifDmemmapperV3 {
+    signature: u32,
+    version: u16,
+    size: u16,
+    cmd_in_buffer_offset: u32,
+    cmd_in_buffer_size: u32,
+    cmd_out_buffer_offset: u32,
+    cmd_out_buffer_size: u32,
+    nvf_img_data_buffer_offset: u32,
+    nvf_img_data_buffer_size: u32,
+    printf_buffer_hdr: u32,
+    ucode_build_time_stamp: u32,
+    ucode_signature: u32,
+    init_cmd: u32,
+    ucode_feature: u32,
+    ucode_cmd_mask0: u32,
+    ucode_cmd_mask1: u32,
+    multi_tgt_tbl: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
+
+#[derive(Debug)]
+#[repr(C, packed)]
+struct ReadVbios {
+    ver: u32,
+    hdr: u32,
+    addr: u64,
+    size: u32,
+    flags: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for ReadVbios {}
+
+#[derive(Debug)]
+#[repr(C, packed)]
+struct FrtsRegion {
+    ver: u32,
+    hdr: u32,
+    addr: u32,
+    size: u32,
+    ftype: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FrtsRegion {}
+
+const NVFW_FRTS_CMD_REGION_TYPE_FB: u32 = 2;
+
+#[repr(C, packed)]
+struct FrtsCmd {
+    read_vbios: ReadVbios,
+    frts_region: FrtsRegion,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FrtsCmd {}
+
+const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS: u32 = 0x15;
+const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB: u32 = 0x19;
+
+/// Command for the [`FwsecFirmware`] to execute.
+pub(crate) enum FwsecCommand {
+    /// Asks [`FwsecFirmware`] to carve out the WPR2 area and place a verified copy of the VBIOS
+    /// image into it.
+    Frts { frts_addr: u64, frts_size: u64 },
+    /// Asks [`FwsecFirmware`] to load pre-OS apps on the PMU.
+    #[expect(dead_code)]
+    Sb,
+}
+
+/// Size of the signatures used in FWSEC.
+const BCRT30_RSA3K_SIG_SIZE: usize = 384;
+
+/// A single signature that can be patched into a FWSEC image.
+#[repr(transparent)]
+pub(crate) struct Bcrt30Rsa3kSignature([u8; BCRT30_RSA3K_SIG_SIZE]);
+
+/// SAFETY: A signature is just an array of bytes.
+unsafe impl FromBytes for Bcrt30Rsa3kSignature {}
+
+impl From<[u8; BCRT30_RSA3K_SIG_SIZE]> for Bcrt30Rsa3kSignature {
+    fn from(sig: [u8; BCRT30_RSA3K_SIG_SIZE]) -> Self {
+        Self(sig)
+    }
+}
+
+impl AsRef<[u8]> for Bcrt30Rsa3kSignature {
+    fn as_ref(&self) -> &[u8] {
+        &self.0
+    }
+}
+
+impl FirmwareSignature<FwsecFirmware> for Bcrt30Rsa3kSignature {}
+
+/// Reinterpret the area starting from `offset` in `fw` as an instance of `T` (which must implement
+/// [`FromBytes`]) and return a reference to it.
+///
+/// # Safety
+///
+/// Callers must ensure that the region of memory returned is not written for as long as the
+/// returned reference is alive.
+///
+/// TODO: Remove this and `transmute_mut` once we have a way to transmute objects implementing
+/// FromBytes, e.g.:
+/// https://lore.kernel.org/lkml/20250330234039.29814-1-christiansantoslima21@gmail.com/
+unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
+    fw: &'a DmaObject,
+    offset: usize,
+) -> Result<&'b T> {
+    if offset + core::mem::size_of::<T>() > fw.size() {
+        return Err(EINVAL);
+    }
+    if (fw.start_ptr() as usize + offset) % core::mem::align_of::<T>() != 0 {
+        return Err(EINVAL);
+    }
+
+    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
+    // large enough the contains an instance of `T`, which implements `FromBytes`.
+    Ok(unsafe { &*(fw.start_ptr().add(offset) as *const T) })
+}
+
+/// Reinterpret the area starting from `offset` in `fw` as a mutable instance of `T` (which must
+/// implement [`FromBytes`]) and return a reference to it.
+///
+/// # Safety
+///
+/// Callers must ensure that the region of memory returned is not read or written for as long as
+/// the returned reference is alive.
+unsafe fn transmute_mut<'a, 'b, T: Sized + FromBytes>(
+    fw: &'a mut DmaObject,
+    offset: usize,
+) -> Result<&'b mut T> {
+    if offset + core::mem::size_of::<T>() > fw.size() {
+        return Err(EINVAL);
+    }
+    if (fw.start_ptr_mut() as usize + offset) % core::mem::align_of::<T>() != 0 {
+        return Err(EINVAL);
+    }
+
+    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
+    // large enough the contains an instance of `T`, which implements `FromBytes`.
+    Ok(unsafe { &mut *(fw.start_ptr_mut().add(offset) as *mut T) })
+}
+
+impl FirmwareDmaObject<FwsecFirmware> {
+    /// Patch the Fwsec firmware image in `fw` to run the command `cmd`.
+    fn patch_command(&mut self, v3_desc: &FalconUCodeDescV3, cmd: FwsecCommand) -> Result<()> {
+        let hdr_offset = (v3_desc.imem_load_size + v3_desc.interface_offset) as usize;
+        // SAFETY: we have an exclusive reference to `self`, and no caller should have shared
+        // `self` with the hardware yet.
+        let hdr: &FalconAppifHdrV1 = unsafe { transmute(&self.0, hdr_offset) }?;
+
+        if hdr.version != 1 {
+            return Err(EINVAL);
+        }
+
+        // Find the DMEM mapper section in the firmware.
+        for i in 0..hdr.entry_count as usize {
+            let app: &FalconAppifV1 =
+            // SAFETY: we have an exclusive reference to `self`, and no caller should have shared
+            // `self` with the hardware yet.
+            unsafe {
+                transmute(
+                    &self.0,
+                    hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize
+                )
+            }?;
+
+            if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
+                continue;
+            }
+
+            // SAFETY: we have an exclusive reference to `self`, and no caller should have shared
+            // `self` with the hardware yet.
+            let dmem_mapper: &mut FalconAppifDmemmapperV3 = unsafe {
+                transmute_mut(
+                    &mut self.0,
+                    (v3_desc.imem_load_size + app.dmem_base) as usize,
+                )
+            }?;
+
+            // SAFETY: we have an exclusive reference to `self`, and no caller should have shared
+            // `self` with the hardware yet.
+            let frts_cmd: &mut FrtsCmd = unsafe {
+                transmute_mut(
+                    &mut self.0,
+                    (v3_desc.imem_load_size + dmem_mapper.cmd_in_buffer_offset) as usize,
+                )
+            }?;
+
+            frts_cmd.read_vbios = ReadVbios {
+                ver: 1,
+                hdr: core::mem::size_of::<ReadVbios>() as u32,
+                addr: 0,
+                size: 0,
+                flags: 2,
+            };
+
+            dmem_mapper.init_cmd = match cmd {
+                FwsecCommand::Frts {
+                    frts_addr,
+                    frts_size,
+                } => {
+                    frts_cmd.frts_region = FrtsRegion {
+                        ver: 1,
+                        hdr: core::mem::size_of::<FrtsRegion>() as u32,
+                        addr: (frts_addr >> 12) as u32,
+                        size: (frts_size >> 12) as u32,
+                        ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
+                    };
+
+                    NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS
+                }
+                FwsecCommand::Sb => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB,
+            };
+
+            // Return early as we found and patched the DMEMMAPPER region.
+            return Ok(());
+        }
+
+        Err(ENOTSUPP)
+    }
+}
+
+/// The FWSEC microcode, extracted from the BIOS and to be run on the GSP falcon.
+///
+/// It is responsible for e.g. carving out the WPR2 region as the first step of the GSP bootflow.
+pub(crate) struct FwsecFirmware {
+    desc: FalconUCodeDescV3,
+    ucode: FirmwareDmaObject<Self>,
+}
+
+impl FalconLoadParams for FwsecFirmware {
+    fn imem_load_params(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: 0,
+            dst_start: self.desc.imem_phys_base,
+            len: self.desc.imem_load_size,
+        }
+    }
+
+    fn dmem_load_params(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: self.desc.imem_load_size,
+            dst_start: self.desc.dmem_phys_base,
+            len: Layout::from_size_align(self.desc.dmem_load_size as usize, 256)
+                // Cannot panic, as 256 is non-zero and a power of 2.
+                .unwrap()
+                .pad_to_align()
+                .size() as u32,
+        }
+    }
+
+    fn brom_params(&self) -> FalconBromParams {
+        FalconBromParams {
+            pkc_data_offset: self.desc.pkc_data_offset,
+            engine_id_mask: self.desc.engine_id_mask,
+            ucode_id: self.desc.ucode_id,
+        }
+    }
+
+    fn boot_addr(&self) -> u32 {
+        0
+    }
+}
+
+impl Deref for FwsecFirmware {
+    type Target = DmaObject;
+
+    fn deref(&self) -> &Self::Target {
+        &self.ucode.0
+    }
+}
+
+impl FalconFirmware for FwsecFirmware {
+    type Target = Gsp;
+}
+
+impl FwsecFirmware {
+    /// Extract the Fwsec firmware from `bios` and patch it to run with the `cmd` command.
+    pub(crate) fn new(
+        falcon: &Falcon<Gsp>,
+        dev: &Device<device::Bound>,
+        bar: &Bar0,
+        bios: &Vbios,
+        cmd: FwsecCommand,
+    ) -> Result<Self> {
+        let v3_desc = bios.fwsec_header(dev)?;
+        let ucode = bios.fwsec_ucode(dev)?;
+
+        let mut ucode_dma = FirmwareDmaObject::<Self>::new(dev, ucode)?;
+        ucode_dma.patch_command(v3_desc, cmd)?;
+
+        // Patch signature if needed.
+        if v3_desc.signature_count != 0 {
+            let sig_base_img = (v3_desc.imem_load_size + v3_desc.pkc_data_offset) as usize;
+            let desc_sig_versions = v3_desc.signature_versions as u32;
+            let reg_fuse_version = falcon.get_signature_reg_fuse_version(
+                bar,
+                v3_desc.engine_id_mask,
+                v3_desc.ucode_id,
+            )?;
+            dev_dbg!(
+                dev,
+                "desc_sig_versions: {:#x}, reg_fuse_version: {}\n",
+                desc_sig_versions,
+                reg_fuse_version
+            );
+            let signature_idx = {
+                let reg_fuse_version_bit = 1 << reg_fuse_version;
+
+                // Check if the fuse version is supported by the firmware.
+                if desc_sig_versions & reg_fuse_version_bit == 0 {
+                    dev_err!(
+                        dev,
+                        "no matching signature: {:#x} {:#x}\n",
+                        reg_fuse_version_bit,
+                        desc_sig_versions,
+                    );
+                    return Err(EINVAL);
+                }
+
+                // `desc_sig_versions` has one bit set per included signature. Thus, the index of
+                // the signature to patch is the number of bits in `desc_sig_versions` set to `1`
+                // before `reg_fuse_version_bit`.
+
+                // Mask of the bits of `desc_sig_versions` to preserve.
+                let reg_fuse_version_mask = reg_fuse_version_bit.wrapping_sub(1);
+
+                (desc_sig_versions & reg_fuse_version_mask).count_ones() as usize
+            };
+
+            dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
+            let signature = bios
+                .fwsec_sigs(dev)
+                .and_then(|sigs| sigs.get(signature_idx).ok_or(EINVAL))?;
+            ucode_dma.patch_signature(signature, sig_base_img)?;
+        }
+
+        Ok(FwsecFirmware {
+            desc: v3_desc.clone(),
+            ucode: ucode_dma,
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 7e03a5696011d12814995928b2984cceae6b6756..5a4c23a7a6c22abc1f6e72a307fa3336d731a396 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -5,6 +5,7 @@
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
+use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
 use crate::gsp::fb::FbLayout;
@@ -243,8 +244,18 @@ pub(crate) fn new(
         let fb_layout = FbLayout::new(spec.chipset, bar)?;
         dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
 
-        // Will be used in a later patch when fwsec firmware is needed.
-        let _bios = Vbios::new(pdev, bar)?;
+        let bios = Vbios::new(pdev, bar)?;
+
+        let _fwsec_frts = FwsecFirmware::new(
+            &gsp_falcon,
+            pdev.as_ref(),
+            bar,
+            &bios,
+            FwsecCommand::Frts {
+                frts_addr: fb_layout.frts.start,
+                frts_size: fb_layout.frts.end - fb_layout.frts.start,
+            },
+        )?;
 
         Ok(pin_init!(Self {
             spec,
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index d873518a89e8ff3b66628107f42aa302c5f2ddca..e56f769bd18ffa73be0f26341d6a700a3ef2d192 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -2,10 +2,8 @@
 
 //! VBIOS extraction and parsing.
 
-// To be removed when all code is used.
-#![expect(dead_code)]
-
 use crate::driver::Bar0;
+use crate::firmware::fwsec::Bcrt30Rsa3kSignature;
 use crate::firmware::FalconUCodeDescV3;
 use core::convert::TryFrom;
 use kernel::device;
@@ -258,7 +256,7 @@ pub(crate) fn fwsec_ucode(&self, pdev: &device::Device) -> Result<&[u8]> {
         self.fwsec_image.fwsec_ucode(pdev, self.fwsec_header(pdev)?)
     }
 
-    pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> Result<&[u8]> {
+    pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> Result<&[Bcrt30Rsa3kSignature]> {
         self.fwsec_image.fwsec_sigs(pdev, self.fwsec_header(pdev)?)
     }
 }
@@ -1137,18 +1135,21 @@ fn fwsec_ucode(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<
             .inspect_err(|_| dev_err!(dev, "fwsec ucode data not contained within BIOS bounds\n"))
     }
 
-    /// Get the signatures as a byte slice
-    fn fwsec_sigs(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
-        const SIG_SIZE: usize = 96 * 4;
-
+    /// Get the FWSEC signatures.
+    fn fwsec_sigs(
+        &self,
+        dev: &device::Device,
+        v3_desc: &FalconUCodeDescV3,
+    ) -> Result<&[Bcrt30Rsa3kSignature]> {
         let falcon_ucode_offset = self.falcon_ucode_offset;
 
         // The signatures data follows the descriptor
         let sigs_data_offset = falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
-        let size = desc.signature_count as usize * SIG_SIZE;
+        let sigs_size =
+            v3_desc.signature_count as usize * core::mem::size_of::<Bcrt30Rsa3kSignature>();
 
         // Make sure the data is within bounds
-        if sigs_data_offset + size > self.base.data.len() {
+        if sigs_data_offset + sigs_size > self.base.data.len() {
             dev_err!(
                 dev,
                 "fwsec signatures data not contained within BIOS bounds\n"
@@ -1156,6 +1157,17 @@ fn fwsec_sigs(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<&
             return Err(ERANGE);
         }
 
-        Ok(&self.base.data[sigs_data_offset..sigs_data_offset + size])
+        // SAFETY: we checked that `data + sigs_data_offset + (signature_count *
+        // sizeof::<Bcrt30Rsa3kSignature>()` is within the bounds of `data`.
+        Ok(unsafe {
+            core::slice::from_raw_parts(
+                self.base
+                    .data
+                    .as_ptr()
+                    .add(sigs_data_offset)
+                    .cast::<Bcrt30Rsa3kSignature>(),
+                v3_desc.signature_count as usize,
+            )
+        })
     }
 }

-- 
2.49.0

