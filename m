Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B62B09C7F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6198910E920;
	Fri, 18 Jul 2025 07:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kTmGC77h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2089.outbound.protection.outlook.com [40.107.100.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FD010E915;
 Fri, 18 Jul 2025 07:27:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVW6cE+tj4Moa0fn8zCcXpz5kZyEK3U+uI42CT5AjTiSqTaiBxQf000IZqLw77+bI1mhQX6qMrRFh/6QWy7iiErPE8wKe8O7etTF9yJIkIHvkjadB5TycoTgdvBMGfOOfu8qbYynY4lqeQjFaYcjH7iunRb6WDEoD29ltWgHjMMFKlXEN8SiH/AHS54Bi7ly1FohxF8sDl3C8ZX6q1sXlsA9MAGoV643FF5PMfbYt1a8Wa+T8BUQxtaHjR8qRj/UZZE26AwrWLtX4NlAUopRp06E7GmelPPKkkBAoRl90SxUW4FkHCfp4WJLhA+hy4IadBrSXEnWhm4apwzkjoipRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDGPw28ukkl78vMQAQ+PBmps3XPY1IKPoGAzXHgTQvw=;
 b=cu/mEreYzuTJQEZjE9dk5I/KR7opoJrkcyFlfllohJ7DYPaivCPyBlyyLFJyKjXWyTKK5Fk/OXeoelpLG3dI4/vQXZ9yHaBKAcbfa+DnIkOc6hz1GLpqY6Xa985Og0iGIjzcnSQUBfKlGexUDhWmBy3vz3kYlQJhtycMGAvWpHio0LUece2hFHR/iqh1umtY4SLmdYb84qeerpgM7aMZQJcUWIoLXsOtrWvfo5rlx9tMdsflid7OjVHeiZ8r2JuhUWqFpqyZJTBsLNvcnwUZwW2n/w9IVwCzk/lEBk2fdXoRwtBUzcfQkKOl4UO5FYT6I87gtFLOnRe3nnQQOBDV7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDGPw28ukkl78vMQAQ+PBmps3XPY1IKPoGAzXHgTQvw=;
 b=kTmGC77hmRVrmDz7EVA2JxLI9SMTD/wwb3JpnlYnK2ptKgQTKwa9JYX35t+X7EEH9EvUgzcKYOiNn/sSf2gnhFCW8cV/zMdG8a621F6zYyW5VRoK+4SMsPPRtpaq8rZ6djLrZFDYldgmb+JIeegyjMsboaxhg7MSw7GzX6N0Ssyb0SoxtaYL3yxDX90oJVkgnX7wmtAXVFxe68S16HHJldrVmLXdKoygY0Ike78OpnRfT+9d7I86EqAIDL/f7/MDIUJNPvi/22f2Lk80g61hoDxRRV3EDlRYHslqaKAPwpY4G2cQHYKldYQ6eDFR1zcyfVfZyV+WMcdIWxRFR62ePA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW3PR12MB4427.namprd12.prod.outlook.com (2603:10b6:303:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 18 Jul
 2025 07:27:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:27:21 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:23 +0900
Subject: [PATCH v2 18/19] gpu: nova-core: falcon: use register arrays for
 FUSE registers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-18-7b6a762aa1cd@nvidia.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
In-Reply-To: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY2PR06CA0028.apcprd06.prod.outlook.com
 (2603:1096:404:2e::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW3PR12MB4427:EE_
X-MS-Office365-Filtering-Correlation-Id: 45189653-79f5-4836-473b-08ddc5cc8885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tkx5Y3p5ZS9GaFpjZk1lYUhza2E0bk9sRTJOcnVsRU4wbEpGbndZcWdHZk1D?=
 =?utf-8?B?TFdEaWIwNHZBQlNhSFhtVUEyQThvaWU0Z0dSVm82RTdtRXk3VUIxRlJFL1h6?=
 =?utf-8?B?ZXMyMTlBclU0ZklvRWpma0RyUWcxaDR6SHBmQWtWeGxBRndPYkF4N04yNFUz?=
 =?utf-8?B?QVNGT0FTRzRycFBLTXlpVkFjcVRWdGhIbjd0S2I5TkpaZURzWWJ3dnFUcjFi?=
 =?utf-8?B?UFJmZzFYYzZyYU9hQmpNRnNjb1R4ZnA5eW5PeWVsWEpjbU5qSDVmcHM3TXFG?=
 =?utf-8?B?Z1NnZFBZRTM2aFhwb1gvZ1BiT2h6YVdrbUV0ZGtHa3U5RGZaV1FUdnFYWld2?=
 =?utf-8?B?b2F4STk0RXBLT01iL3ozd3RPYlBsa0NTSW5TWnlLcHpRUTRDUjVGUmhmTjFn?=
 =?utf-8?B?TDE0TDQzUXNBWGQwSENLdUtHNEhJWDVIQnBPcFdyTDlKVm44N0QyMzFBVE1Z?=
 =?utf-8?B?MmQwb2RIWXVwaHRJc01XUUtLOGtFbWZzVjJqei9nL3RWY21TOVpQSWRjU3gx?=
 =?utf-8?B?c0JreTYwMjVuV3Nram9Sc2U4VGk3aFVVNXl2N2NuZ0JNYTBEYXEzVkZVb0RZ?=
 =?utf-8?B?Z1NIWERTV2xRbzdqQzB3S29NTDdMUlk0YWlsK1R1UE1SZVlhSjlHdnltQXRT?=
 =?utf-8?B?OWxXYUxSdkNWSjkzOFhyL3p1eWh1b1F2b3RHRkZ5TEdOYTVKMkVNTVBieTZn?=
 =?utf-8?B?OUhVM1VOUHVhcDFhT0JoNG90cEJsWE1LcExKUXYvUnR5VHA1aFUvN29ITUZr?=
 =?utf-8?B?TWNzb0hvOGJLYnZ1WXdMTVB0eEdkSXhsNTlMYnRMYk5OenM1empjSlBKdkk2?=
 =?utf-8?B?bjdyTE9GYmNSbElmWGpFb3VOVU1jd25rWDFpVUhsWm03RmNLd3hyZTh0UTl4?=
 =?utf-8?B?QTc1bE5uQlg0VzZQbU9RdDJwSFRxTGdRc3g0RzB6NklWbERxUXVnS3NKclNq?=
 =?utf-8?B?aEp5WDZXT1JFaDdPa0pyMnFPWGNLNTNSZlZFVXBVMXE5L3Z0aUVJREtZYWFU?=
 =?utf-8?B?SjhMRnJENkRObmh6MThwQ2YrOVBrb04zYzdSN25kbDk2NXNOVmE3S3B3ZDdR?=
 =?utf-8?B?RU84enh2TDNHYi9DeE9xOGd0VkJpYllZYkNBanNCcWpPUUMxMlRTZFlHeDZH?=
 =?utf-8?B?dDBtdzJHdy9vNHNESkJoSDdCV0RRYSt5MkZQZVd0TDJNc1FjcXlGUHRRY2E1?=
 =?utf-8?B?eVVxQ1BQYllUMWpzL1BPL1VtdWt3elRDbWFFRjBRbHlZajRubGxMMytKekpw?=
 =?utf-8?B?d0haU3RyQkNYenNCNXBmSm11bUx4ZFRPV0MvL2tWdDUySGlKNzNOMzhUM2Jv?=
 =?utf-8?B?OEY0SXQxditVRjBXNUFNQzlmTzRDdzB4MTFXQjZJRm5mbHJScE4xUjNnQTdR?=
 =?utf-8?B?TFZ5eXN1SjBvM1NiTU1La1V1NTNOQXhVdENPSVBjdkpDeTlMWWg2OGFxeDlx?=
 =?utf-8?B?aWovL3E4YjJTRHJJSjYyeU9NR3NPOTNFVTIxSFlWTjNKYTB4clNVdDBLcUZ5?=
 =?utf-8?B?OWdrOTVyRm96SlZFeFBHRkFYcnJ4bktxZXJESWI2Yk5IU09KWEQ3a2x0S1JX?=
 =?utf-8?B?Sk95djZyS0hOMkFRWFZ0Q2Jjbm1DWDI2UkVubytqdExvUkVtV2p5bG1zd2ZD?=
 =?utf-8?B?OHQ1QU5sSWhQYU8wSmJSeks5MnZxcUk0VldZOWYzWlZVZTRYcW42U1U3MUM1?=
 =?utf-8?B?Q1VhVkozMGZVVzM1S2IrbUkwbFo1bDBBeW5CeDA2R0ZJdFZna05uaEg5UDJ6?=
 =?utf-8?B?dW1leGx3ejFMczREbnZNd2EydFJ5Q0VWUE8zS2g3SU5hR1FhaEovQmlQajZu?=
 =?utf-8?B?UEZTRUtDZllhL09oVi8rWW5iU3JJcElyeW1UeE52SDJTODFielloaXNXVHNl?=
 =?utf-8?B?ekhrTDJHVmRRZnBFdjJrbUY5NDdvakdjdWEwRXA0Ym0xVk9XR2tRRzNYSVND?=
 =?utf-8?Q?cq2FCLOCe6o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1h6NlVGNklEWjczcndyR2hIT0dkQWhRSTBTRjFaaGhMSFR2aHgybU45L2dE?=
 =?utf-8?B?WmxuajFBRGVVT01oV3V0K0FMNFJ2RXZJdUZHWisyS0ZzbWtCUlg4K2YzL3Zi?=
 =?utf-8?B?cVNjeEFaOXFZd3ZHdTFqQlJLMktQRE14UkpDd2tsczZpKzRxd1FLcGpTTkFa?=
 =?utf-8?B?OTZ5VS96czBjaFVQYUpBM0o0dDZKcE1BV1NMNFhEZDBDdG1mWnlRRDVTa1Np?=
 =?utf-8?B?TlJlSjV4eVZxdzJqTmhuR0RIZGFjRGh0cDcrY0twREQra3luZ2tmYXlnQmxE?=
 =?utf-8?B?S0RDenB5WEVKTnJqZjRBajNTdXV1QTNtYlY3NHJZK25DWnlLaUd1WFJGV0o0?=
 =?utf-8?B?M0pRZGlNeFFvZzVEaFIzTjdJWFEvejNDR05LeVBRWFBMeUQ4cTNqc3p6ZTAz?=
 =?utf-8?B?cUlqamt3TFloTXExSk93SDF2clBoaXM4SGI0WjNWN2ZuUWxlN0VyVlNSTHJL?=
 =?utf-8?B?NjR4VndNOHZSd1hLK0FwdXFmdGFRZkxRcHdkVlZsL25hRHhGYjNLTk5hdnNk?=
 =?utf-8?B?c0VCZ2RlY3VkTm9PbkVNak1ybm8vdkdpRzlaSC9mVEJ2dEpBclNsM1VzUjFq?=
 =?utf-8?B?akhVVHVhSmxQQTArOERIRnh1RktrdEU0a0FmWXBDT1ZDWDZwcFJxaFZvUE9X?=
 =?utf-8?B?VUZneDI0V1NqVllhNGVnbHNubkpqN1lVNkd0NlNaVkVvUDAva3ZHWkRYdTk5?=
 =?utf-8?B?MXJGd3BZVXNGdnRWQ2w2RExwb0VFb1BYSm9qQlZpWWhRZHR6OCtBWUptYVZN?=
 =?utf-8?B?RW84WXhua0JPNlZKYk5ScnQyZERhY29xNmc2ZGRXVmpFODNwaWFVL1dvUDA5?=
 =?utf-8?B?bFhYODY3ZTJkREx3RVVFdGZTQUNFMHRXcytxelFHVXM4VUhUdTVjRjU4eFdQ?=
 =?utf-8?B?ZzV1WXFObGl0M3hkR0FsZmVOY0hyTWVwY0tGdC82WUFiNW5sQlZLSHdXZGx5?=
 =?utf-8?B?dUFnVThDd3A5NFhHVFlKalNIc210bWtrQVh4OEpqQmplVEI0YzhJRjcxRU0z?=
 =?utf-8?B?T21mbXlzRlFUeHphUW5DKytpTUZzbFlVYVNyM3VvRHhpalBGQWZ1dTVSL2ds?=
 =?utf-8?B?MUZZWXdTbCtiR3AvWEk3MlpkQXpEVUorc3Zxc0l3VjdmT1VndVV6by9pZEJM?=
 =?utf-8?B?SWhMWkpybjdQL0w2RldRQ1M5Y0kzOXpRVS9hdXhFRXR1a3ZFSUxxc0NhSHlq?=
 =?utf-8?B?K1IwMnZVaDBGeTBFa2MzQm1HdmkrQ3hEWU9naWl5MkJGcXd1aVNTa0hxK3Mx?=
 =?utf-8?B?TXFLM251bTNQdXlibVlDbStwbEdNdEozV1FDQjRTTU5oOUZuNjdRRDBaZ05M?=
 =?utf-8?B?MU9yQ296OFVxZEZMUlFmcFcrNnBuektXR1pvbnRzZ3lCRFhEQ2pjZVlwanlp?=
 =?utf-8?B?UnkrOGJ5ODBsZ0lJY1N1TGUyTWkyby9tRTlZaGNUamJ0UDJha09ITFh6QWdU?=
 =?utf-8?B?VWxyKzFmeE1Ca3I4WGRUbTc3NzE3Ykp4Y0x6YWQzUk9xRUp0Sno5MVpMVVdn?=
 =?utf-8?B?RzVTdG5TVzZWUmxocWN6MWVWVXNRa0NQdDZ5SHlnL1ZaWjNSaEduTmMzbXg5?=
 =?utf-8?B?OWpRcXpRSDQrMC9GQzJxY3dqTUhBUFYzV3JIcWxsOGVPNitFNHBYVnA2czJM?=
 =?utf-8?B?MThlT3JLZUd5OWxXajk5UmlIdERoK2RscnkydWtXWllxVnI3ZVpQT0h1Qktp?=
 =?utf-8?B?STFNQ0Y3U21JcFhEdlg4OE5Xei9FK21TdE9NaTRKV244WTNBampqLzJ2RGlT?=
 =?utf-8?B?YTJaU1lSSXhhRW9LQk5SYVM4eDduVXhXSElJR2Y5bFJHWUh1Nk81ZzkrNEVm?=
 =?utf-8?B?SlZ1bU9kdkUrb1QvTzY2M21jdi92YndrZVZWSnRGbUs3VytLSG1rOHVGdksv?=
 =?utf-8?B?NWxwNFVlOTZHUlZOVVJzcEwvZlcrdSt1MFFJczdQZ3gyZHIvYjM3Vi9vTFUy?=
 =?utf-8?B?cW1aZ3Q5eS85dlE5dU5YSFhlajJjUysvWXhEWEYzWEk2MGU5TktGUjNCeUZF?=
 =?utf-8?B?eEN6S2hmRldzODY0NXhob0l0RXJQc2hDdW8rdnZqa2p3ZnZZcDVDU05DMjhn?=
 =?utf-8?B?ek1wQnhMRklTbDArWTlmZEl6WWVCT2w2bzFtZkQ5UUtIK0xvMXRxTnZXdEtT?=
 =?utf-8?B?MnhLZXo4Z0h5TytESU1mb3ZGVEdWeEFZVmYrOXNJYXk2M1llcnlpQWY0cFpr?=
 =?utf-8?Q?FD+CEGtkQD/JiPl5QRp21P9qQYBloETW8XVMB5b0XaKe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45189653-79f5-4836-473b-08ddc5cc8885
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:27:21.2005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zfkrrf/aASgzaQyMoksitFbuOX5dL8+yYRuWrpP+zlbZOdQtR3Ip4ajH7M+y9RHabKdwcz+upSOMIV5jRVveOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4427
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

FUSE registers are an array of 16 consecutive registers. Use the
newly available register array feature to define them properly and
improve the code using them.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 33 ++++++++++++++-----------------
 drivers/gpu/nova-core/regs.rs             |  8 +++++---
 2 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 3fdacd19322dd122eb00e245de4be8d1edd61a5f..13c945fd6d6b7b1acbb466678af0bf18da506265 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -42,35 +42,32 @@ fn signature_reg_fuse_version_ga102(
     engine_id_mask: u16,
     ucode_id: u8,
 ) -> Result<u32> {
-    // TODO[REGA]: The ucode fuse versions are contained in the
-    // FUSE_OPT_FPF_<ENGINE>_UCODE<X>_VERSION registers, which are an array. Our register
-    // definition macros do not allow us to manage them properly, so we need to hardcode their
-    // addresses for now. Clean this up once we support register arrays.
+    const NV_FUSE_OPT_FPF_SIZE: u8 = regs::NV_FUSE_OPT_FPF_SIZE as u8;
 
     // Each engine has 16 ucode version registers numbered from 1 to 16.
-    if ucode_id == 0 || ucode_id > 16 {
-        dev_err!(dev, "invalid ucode id {:#x}", ucode_id);
-        return Err(EINVAL);
-    }
+    let ucode_idx = match ucode_id {
+        1..=NV_FUSE_OPT_FPF_SIZE => (ucode_id - 1) as usize,
+        _ => {
+            dev_err!(dev, "invalid ucode id {:#x}", ucode_id);
+            return Err(EINVAL);
+        }
+    };
 
-    // Base address of the FUSE registers array corresponding to the engine.
-    let reg_fuse_base = if engine_id_mask & 0x0001 != 0 {
-        regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::OFFSET
+    // `ucode_idx` is guaranteed to be in the range [0..15], making the `read` calls provable valid
+    // at build-time.
+    let reg_fuse_version = if engine_id_mask & 0x0001 != 0 {
+        regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::read(bar, ucode_idx).data()
     } else if engine_id_mask & 0x0004 != 0 {
-        regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::OFFSET
+        regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::read(bar, ucode_idx).data()
     } else if engine_id_mask & 0x0400 != 0 {
-        regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::OFFSET
+        regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::read(bar, ucode_idx).data()
     } else {
         dev_err!(dev, "unexpected engine_id_mask {:#x}", engine_id_mask);
         return Err(EINVAL);
     };
 
-    // Read `reg_fuse_base[ucode_id - 1]`.
-    let reg_fuse_version =
-        bar.read32(reg_fuse_base + ((ucode_id - 1) as usize * core::mem::size_of::<u32>()));
-
     // TODO[NUMM]: replace with `last_set_bit` once it lands.
-    Ok(u32::BITS - reg_fuse_version.leading_zeros())
+    Ok(u16::BITS - reg_fuse_version.leading_zeros())
 }
 
 fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) -> Result {
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 0c857842b31f9ca5d842ee5b1e5841de480d1f1f..05a728e9c9881ec315aac8448d11035501eaa559 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -181,15 +181,17 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
 
 // FUSE
 
-register!(NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION @ 0x00824100 {
+pub(crate) const NV_FUSE_OPT_FPF_SIZE: usize = 16;
+
+register!(NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION @ 0x00824100[NV_FUSE_OPT_FPF_SIZE] {
     15:0    data as u16;
 });
 
-register!(NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION @ 0x00824140 {
+register!(NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION @ 0x00824140[NV_FUSE_OPT_FPF_SIZE] {
     15:0    data as u16;
 });
 
-register!(NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION @ 0x008241c0 {
+register!(NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION @ 0x008241c0[NV_FUSE_OPT_FPF_SIZE] {
     15:0    data as u16;
 });
 

-- 
2.50.1

