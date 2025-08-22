Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD58B31832
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 14:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A5E10EAF2;
	Fri, 22 Aug 2025 12:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SP6ZpnA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5424310EAE8;
 Fri, 22 Aug 2025 12:47:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLcjs6/Kq5swT7bHG+/sMD7CLInX1figM+v3zHaJlO3TOBBGjSgtHLYnyNc+NKvh0N1Dw5Lf9FsGT+I1atL4IoEBPjh/hXo/m+qMHo9rfubdkOVUbqfKxelxKf/Kg2+6XWhKIFPHBgTw2nT3UwLhZbdYMlX3CdSd9L8hOHB2uaDOZMyk27rkVjHMW/nQoODJClvcsbKTjU4nJxr8UIPmEUJBXJAA7DBmW8WUVicW27uT9dmkTAOkGAhTpXPfK7kXmSd+c+R9bhRRM/svz/1TTmtOMWnxXKAdZ/XBpWRpWxtLqlskwX62udWr/UTQkarDG3GsNl1p42GGQtPSablpiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vikp+lOYdjtOSDWpqzGjRJMVd42DJ0J0DAJNTgHKTJY=;
 b=sx8AyIGSx27wa+OdW2clr3MUrrCFDZrUEx3ZT0b3BB+rjsUYNWpmtMJLORf0Wer4COciHmnhg4jGmoAQiBSj2kYpm0IaOnbxshj2nS9Eo/7L2U4GTKn9K51ydMwTnWfBqPQ8b9J93WeBPAAwrCsUl5X08+jwSO7PfRKfLHusxeuckcsGI9E7RlID4i7IzJrgwaaDtz3t90ohUQspBzJm5Ubdfy6jC5WDc/bx3CorppPsfVC2KAxNQIWTzrVQtPTs0/bBdzEk4czKBCPsVhZMuVi1Gu65DoxEEFEzYCqjh5Ce0bhy/t6Hl7fi9fe+MKwW9+kSn8iWj+yGfDQMuy8wjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vikp+lOYdjtOSDWpqzGjRJMVd42DJ0J0DAJNTgHKTJY=;
 b=SP6ZpnA7Of4+N2JNAvovIuu5r0T6wn1jES0r0K59ULBkp/kxspXv1aAS7uOXxEpf7Ed0RNpkCNE1i7G9zKB3p9qzBWOvhZEkCP9sr+4sZ3cMR8fP+aq/FEjQ0NUjXz5fvwyZReiU+/rpdfuUgvxe7ikkLpXFZ4keCC/PjLxA0nrIH/KZwHgsb1aaSa0/k11FOiKVvMm812GUwF+/riT+nd2o+jWZcmGjQYbxcEpTQ2EiZa8WcSP12muo59wR+bD2ZkRx3Rfm2s7H0RtS6XbMEMAqmtjzLXmEcofHWURwbP7W2JldVJupGl0Jct+ztKxfhGL4QWixrFgCuPkLDKWicw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by LV2PR12MB5823.namprd12.prod.outlook.com (2603:10b6:408:178::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 22 Aug
 2025 12:47:44 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%5]) with mapi id 15.20.9031.023; Fri, 22 Aug 2025
 12:47:44 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 22 Aug 2025 21:47:17 +0900
Subject: [PATCH 2/5] gpu: nova-core: firmware: add support for common
 firmware header
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-nova_firmware-v1-2-ff5633679460@nvidia.com>
References: <20250822-nova_firmware-v1-0-ff5633679460@nvidia.com>
In-Reply-To: <20250822-nova_firmware-v1-0-ff5633679460@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0212.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::16) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|LV2PR12MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: c2cd8948-2e2f-4bbd-c0f3-08dde17a16cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVY5aEJPdXFyQmxGVmxQZ3RvTkhUeWhPL2lISWpBeVIydzJnVUpmNHB2WlQv?=
 =?utf-8?B?dEhVRUZXb2Q5UEl6ZVdnRkQxdXhSVWxKSi9CcE4ybUdjSlM3NHd0WDM1N0dL?=
 =?utf-8?B?SGZDTTdBc0FtZXlIWVhiYU5STVlGbHUwOGgvWHlPSFJQNjNNZGFuc1VmeUtY?=
 =?utf-8?B?TU5FT2hHbzRrbDYyWXYzN2tYVjNUK2FVaXBKZFRFbGJUemdPd3VETlJpK0hY?=
 =?utf-8?B?ejZBNTd5UnhUb28yQ3NLdkhSWDFBc242WjMrM09CanAzdDdNWjJOTG5YSzJP?=
 =?utf-8?B?b0g5RG92bEQ3MDQ1T3pueThmZm9LRUVMdmZDbmcvZUN5eWRQS2NTVGxwbTdR?=
 =?utf-8?B?Q1VTZU0vaWZvRGdranlTSWk1WFRtT1JGUllybCt3S0xaeTdwRDEzNGpVQjRP?=
 =?utf-8?B?eFJnVUxRVlUwUk9UTDVRQ29EalJVbURWNHdOQ3E4bE5VQnU0S1MrQXc1Znh2?=
 =?utf-8?B?RVk4NEhHbHZ5a0ppMWhKOTAzNVFaNFpveEJpS0xkVzE3aXIrUVYzeE94TFRV?=
 =?utf-8?B?QmpLcXI1djlIR1F5UmhUYTNWS2ZneXdKNHhDU0gzZEJEVUl1aGRIRVJ5YUpu?=
 =?utf-8?B?Uk9hMjhBY0RlVld4TFNEbnZWcEw3czkwTXM1QXUvUXluN05pb0NTNjE2bU1j?=
 =?utf-8?B?eFRocmQzZ29oK3BSbzZtamVLUi9SamcwQmtPSjJCVjRlaWl6dXluOG1oT3Ir?=
 =?utf-8?B?Q1hKRnhXOWIrSVRpZ01DKzZvejAraHIzUG1CUVE1TW45b01oc05HSjZzVG1l?=
 =?utf-8?B?cm9BeHR4MW1pam13V2JRdE4vbnA4TFpxUHZ6Rm1OYTlvbkY1V2NOZXZWaFZV?=
 =?utf-8?B?NFJlN1F2UHdBdGI4amh1ZHg2aFMrTzBwSk5zaFp6ZzQxdFNhKy81RHI4cVVN?=
 =?utf-8?B?L1h5V1QxcWtWTzVMQWdPWHpDbWUvQmlab21xZytab3hMTFAxTFVVaGY0cnkw?=
 =?utf-8?B?S2pod3Joc2F5RjZXRmlXN0hYaVluZmxiNGZDMURuVXJBZmJkN215U2hGR0lY?=
 =?utf-8?B?bGxma0JCY21KV3JEKzBMbG1iUW5NL0VzVWt3K2dDeVd2V2EzMG1MTUNEelZi?=
 =?utf-8?B?ajBMVFhwT0pYSmVQOEt0TytPY1Z6RFBoTDdqZUxOcjR0RjFiQ1JMRWNvb3pv?=
 =?utf-8?B?MW1OekVOR2FWcTM4VEtwdHVNZUZVMVF0dmVZZVBxQWZkZ3dxbUZnVzJFNkRx?=
 =?utf-8?B?dmU4RkhVRnoyWVkyZDdUQ2hacUhNemdHZTd1RVVxZ1JSNnlaVzFGU1UwRFhX?=
 =?utf-8?B?amZrL01OYW5PallSNEJKVmJYNHl1bVJiNEVkd2EzT0t5YVJYUS9hNXYrbHBt?=
 =?utf-8?B?N25pamR0TUdMSkNZNDA1bGxLbXI4U09JTDE0aituaHRKOVY3NlI5N1k4TkNm?=
 =?utf-8?B?SFdnNmt3ODYybXFkbS9uOCtJUTA5WG1tV0Fla0pkckdxWnVwbFBoTjhUek9m?=
 =?utf-8?B?QU5ENjZPVlU1VURtbjIyVHBQUVUvellORnE5L2lHaGJ6UHZ3b2k5R05JaDNW?=
 =?utf-8?B?Szh1dUhRTG5VMHArQUVnM0thZWh5YTVYME1NeXB5K2JVVG5DRE5lNTNQUzky?=
 =?utf-8?B?VGN2QlNDWm9VdE1IY252QUV4ZnVmaVp3Y3VIVVBHdXJDeXNhWCtYcXMveTA3?=
 =?utf-8?B?ajJ4TXFpb3RxazZpMDV0M3Q0RXQzZndrb1h5b3d4NDF4VkJtSENudTVkbFUv?=
 =?utf-8?B?d1dDOHkyL0tja1Rqb3BLMFFrNXdENi9VVjFSb0pmZEx3SkFOYkVBd25DdnJO?=
 =?utf-8?B?NW9lbzA4aVlyS1FvOTQrdUdYMTJjR01XOGVXY1RxNmxYWVFaSk9ZWjkzRnda?=
 =?utf-8?B?ZDY4RkhsdTg5RlBJc3AzKzVlMnpLRmM3TGFTakJYWjVkck5vUUVtQkZwcDFX?=
 =?utf-8?B?SkY2UnhKOVB1YkFFdjlaL0FEanNvZmttWGNlRFBXVzdoRFo4NDkxcnJORi9v?=
 =?utf-8?B?NmdrbVJocVJEaytwdlVuRHVDNDN6UzNQUVc4dzFRbkUvS0pjVkNVK2p1SkFt?=
 =?utf-8?B?NVRuSUtHMHV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmVoa3J3Wk56NjNxNm1vTTRCQ2J4bURkcEIzei9kS0UxM3F0MGlRc2JFbUNH?=
 =?utf-8?B?SUlyQXlKcDcwakwwTXZ1Y0R0MlEvUGFRU1pidmRkM1BNYVI2ZXgvUWFXemJw?=
 =?utf-8?B?ZThYWnI0N2NOUFdoeHEydGhrZ0FteWZTQ0dXYVBnZlA3LzlIamtUT3RQT1pr?=
 =?utf-8?B?eXlqYk9NNEM2cWYwUlVEWU1SVWlxQWdKNzZMbnFrWjZXR2YxeUE4QnVkZWpq?=
 =?utf-8?B?TWNiVk5KZThIM2toK3gxemxOUkw0SFFSRUlwSWoyRUVKYjNIRFdUbXFhM1F0?=
 =?utf-8?B?M05jcFZ2ZTZpOWp0MGtpRzU2cW5objNqd2REZWVtSHI0UStndk9ScElraXpl?=
 =?utf-8?B?TFQ4T1dnN3FraDQ3UitocDNuOVdxV2FiMCtnTU9LT1NpNWQ3WWhiR2hJdk5D?=
 =?utf-8?B?dkdHZnF0cm5ZQmR3UEpNdExzNEJ4WGt2UjgxOVJOcE1zZjVsTDhJOUJITjJ6?=
 =?utf-8?B?WHd5M1JmUHRXUVd0T0x1di9wVjhUdjlWNGVkU2R1OTVCdjRmQXEvN3VPc2xH?=
 =?utf-8?B?eUJEanFwM3NpUXBLd1B0YVV0dllKVFh6clNrdzRlSkt2V0R5aEx6Q1V6Sjdr?=
 =?utf-8?B?RnRIZC8zL0EyVjQxVEdrMWl1Mzd6d2RPM0twVTNHaWp0VHFDbXdmMWEveGNu?=
 =?utf-8?B?Wkt1L2p1UWZoNk51c3dQSXFlaVFWeEtLb2FlcW1TZHZhTWNIUVhJRE53bytl?=
 =?utf-8?B?VjdGaGdKcS82QitYYUdCR3JMb2duME84dUlUbW5IeU9wSUgrTVVmZ3U2dmpz?=
 =?utf-8?B?ZjRhSjBEdWhyTjIzM29KVWFzSUExOUdiUU1jOHB6SDNGaVBuMTFwT29yOEhZ?=
 =?utf-8?B?Qmk3cUNldE9WUFBkL3hCVnBHUEJyZXpGVzJKbE1uRnFvNUcwMkxnOXFseWIy?=
 =?utf-8?B?eElpcmErZVhPOGhYYWpVbnhaM3RMa1p4TXVYc24yTlJTMnNydjZxOGRDci9W?=
 =?utf-8?B?K04raFpKbzhnaUhqRC9hOTV3OEZrUDh0bmYvWlloMzlEaUNjNEdWQ0RsL3RO?=
 =?utf-8?B?aEJ0TXhIWndPTHRsUUxlSEFIYVBrRFJSelZOZVlVZDR0THhmcHJ4dHhVVVhB?=
 =?utf-8?B?NDYwanNmajRVTG94d0V2aGs4WTREeEFzd3FKZ1pYSVYrQytxamtlb1BQejFF?=
 =?utf-8?B?aHc1VXU0bW1YSVlTaXg3dnVFRmdXcFdMbitsR2sxL3Q0clRseC9XRmJLWEt5?=
 =?utf-8?B?TExVNlBiUCtXWHVIc2duZDJjdk1DNjlXMlZSbXVRL1U5b3Y3TW9QcTdVYUhp?=
 =?utf-8?B?Yis5MzNBQ3FJblFkaWxRdjd5MUx4WmdhdkxmS25xSHFWV0ZicXZjUGJEUk50?=
 =?utf-8?B?S09pZWlUUllnNW95dEFoa1Q0bW8xejg4c3NpUWZWOWdDNEczN3BiTFA4VGdW?=
 =?utf-8?B?ajVIbmNyUzRBM1VQMHhZSjdLRTN3QVBySjJKcmdHSzdGd1FkYlpIUXV6dUoy?=
 =?utf-8?B?M05WZDdrQXkrQ3Qwc3lWNnJxL2pMVnBlU3JNa01sU0JTbXNVZ3l1RVAvVmJq?=
 =?utf-8?B?OVgzUlE0NnE4TjJ3NmxEdFZpNHpsRVJyYUFvdXA5bUZNalI3Qjc1S1RyVm9K?=
 =?utf-8?B?dVNaZkpaWkJrb1E0SEMzQWhZMnAveEt5RUZXWWQzNFNLQmZBc3IvM0h3ckw5?=
 =?utf-8?B?b2xlVFVwcEUvWDkvbU0zZmEwKzhaTzR4em80QzNFcWNIT1JtWXFVY0hSeWp5?=
 =?utf-8?B?TGk2L3RQSElMVEU0M2ZQNW9oOWxUYXBkR1NwbFNzNjNFNW5MWDVYMTI5QmR0?=
 =?utf-8?B?aHlKRS9DOFYyd1pZd0xqeHNJTGpHYmd5MjZSRVVLRStTWEpDVW9QazZ3Y1pO?=
 =?utf-8?B?N0JFblhpT0wwTWx2ZDN6M3JZSFlrMGVLeTc2d01wVytLcXhzYXVISE9WdVZH?=
 =?utf-8?B?blpwcXpHZVhyaDIzUFpPSGRTZ0x1Qkh4QjJla0ZBeGM5cW4wNTI1RTNOa1Ar?=
 =?utf-8?B?a04rRHNWM0xydnBWcE5teUMvSmhaOWVnZ3JIRU4xOTVwL28zVndHQmxUVXZl?=
 =?utf-8?B?TGVXTm1pNGZJV21zUVZIelNBM2NwWkRPWFVqWE5ZR0hLYllqZ2JDSkFXSWNx?=
 =?utf-8?B?TWNoVVFXTWI1L3F2ank5RnRyYXlMSnNtNm9IbFJ4RTU2RUowNHQ0QVNvZnV3?=
 =?utf-8?B?L3FKQXdNUEhReGQyamx3QXhlVjQ3NGdRSUNtc3NOYTZCTko1ZW1ja2lwVDRu?=
 =?utf-8?Q?yaVq2QexQu6ju/L9nAzTdJ9ZnLav+HrEQ8cQg64pqUv0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2cd8948-2e2f-4bbd-c0f3-08dde17a16cc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 12:47:44.8405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vY2KglAnc4DvbV+HPZJBcZdRf7grEQOXZOLYw3j+up1ICsDSn9dg9bjL3VEuHPLaWhNd2i09p0TNEbi0wdOhAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5823
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

Several firmware files loaded from userspace feature a common header
that describes their payload. Add basic support for it so subsequent
patches can leverage it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 62 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 2931912ddba0ea1fe6d027ccec70b39cdb40344a..ccb4d19f8fa76b0e844252dede5f50b37c590571 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -4,11 +4,13 @@
 //! to be loaded into a given execution unit.
 
 use core::marker::PhantomData;
+use core::mem::size_of;
 
 use kernel::device;
 use kernel::firmware;
 use kernel::prelude::*;
 use kernel::str::CString;
+use kernel::transmute::FromBytes;
 
 use crate::dma::DmaObject;
 use crate::falcon::FalconFirmware;
@@ -150,6 +152,66 @@ fn no_patch_signature(self) -> FirmwareDmaObject<F, Signed> {
     }
 }
 
+/// Header common to most firmware files.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct BinHdr {
+    /// Magic number, must be `0x10de`.
+    bin_magic: u32,
+    /// Version of the header.
+    bin_ver: u32,
+    /// Size in bytes of the binary (to be ignored).
+    bin_size: u32,
+    /// Offset of the start of the application-specific header.
+    header_offset: u32,
+    /// Offset of the start of the data payload.
+    data_offset: u32,
+    /// Size in bytes of the data payload.
+    data_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for BinHdr {}
+
+// A firmware blob starting with a `BinHdr`.
+struct BinFirmware<'a> {
+    hdr: BinHdr,
+    fw: &'a [u8],
+}
+
+#[expect(dead_code)]
+impl<'a> BinFirmware<'a> {
+    /// Interpret `fw` as a firmware image starting with a [`BinHdr`], and returns the
+    /// corresponding [`BinFirmware`] that can be used to extract its payload.
+    fn new(fw: &'a firmware::Firmware) -> Result<Self> {
+        const BIN_MAGIC: u32 = 0x10de;
+        let fw = fw.data();
+
+        fw.get(0..size_of::<BinHdr>())
+            // Extract header.
+            .and_then(BinHdr::from_bytes_copy)
+            // Validate header.
+            .and_then(|hdr| {
+                if hdr.bin_magic == BIN_MAGIC {
+                    Some(hdr)
+                } else {
+                    None
+                }
+            })
+            .map(|hdr| Self { hdr, fw })
+            .ok_or(EINVAL)
+    }
+
+    /// Returns the data payload of the firmware, or `None` if the data range is out of bounds of
+    /// the firmware image.
+    fn data(&self) -> Option<&[u8]> {
+        let fw_start = self.hdr.data_offset as usize;
+        let fw_size = self.hdr.data_size as usize;
+
+        self.fw.get(fw_start..fw_start + fw_size)
+    }
+}
+
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {

-- 
2.50.1

