Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C95A947B8
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 14:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EC510E320;
	Sun, 20 Apr 2025 12:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="q9SsWIon";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C71D10E2EE;
 Sun, 20 Apr 2025 12:20:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2S3EnevqhyZjXs+5IDghwrrBIAzWw6b0VtHX6vdv2xk590X5O7X7zUSmfNtUx6FJHMvWGIxDtb+Hv2m8ybbhHvIhKRpeqIhii+eDMLhfq95zl1n7LyEk9EzIQ9V6tmuJltDUqbDwBdn1GpwYPOXJZk9x7AduM073CeshrcJ984/3qKRGcQujH9iLkCm9Q8UsKN/LogiYDaoMZHFdTAuigJ2YelVtSmnU0yzLX3IMkBncE4xKUydNgxB4GhYFH/zaxDe3v8qo0VqJG/s3VQBx27GhO+sjLH7W0cxsD0h7FdSF+voTqCH+rAGwg7CwXhMmzlDgFrRrBVgyf+r8XUtsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXypyvq/81TokM/x8hQlINagJBU7Jy1oy8dIFtqX0ZY=;
 b=enANoc5WRilVyyDE17rahq1pm4zQUg5fD1kB/oH5UCitMAW0jr5y8wDm922FOD881nLY95ZxxKHy6UWo2Gh2IFFZJas42AS96pbBK2IyP+TzcuEZySp4L4knuKPMzoImWzNTixZ6rpiw3kQK8I3gnjRhrxy+ud6jwJwMoDSpH58h0mQNbbEOIzFF56gNyOwuu4U27a9A0LTHNJZOZO/FEgVwv0Xq5QjFuu/5NYT8FJh1OF5EPCkxIa1UuU8A8fcuk0TRPeH4i8K5/+bccdkwKMQQz9yoM+1sSw2IJh6++n4aNsxwWjOfuq1Ia2u+oyjv1XuAYEtI2guWXZVzWqP5Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXypyvq/81TokM/x8hQlINagJBU7Jy1oy8dIFtqX0ZY=;
 b=q9SsWIonCkX0HGnAI9+B4f8FhgC3hhxISJYIr7h9XK5mQeWzzc8ypsCNV0nQjQp7T7N5Sq29xeQQCuiEiN9m3IFF4oyBTEOnoMSwtshUHcQ7fdolQJv7uXfpWvxuap3XBHN+JlPHh4u7Oo7WsjXUgmuv5Vt+ssmHgwMeWs5N7sIcOJVA93WodNrseCxqpmlHtS5Jgkt5VyRneDFQptrO+mBniwYCfoYOm74BZd0EWMsfKkKbvoExvLvKl8UQ/L6f7dWZxNEH/g9jXSflOprs94pwCtHtusmv3ZdXHl8xYQTtsZveRtqtbY2ZrkAFrH6tFSH+IB0IFW3EgDPHaDqRqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Sun, 20 Apr
 2025 12:20:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.025; Sun, 20 Apr 2025
 12:20:24 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 20 Apr 2025 21:19:42 +0900
Subject: [PATCH 10/16] gpu: nova-core: add basic timer device
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-nova-frts-v1-10-ecd1cca23963@nvidia.com>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
In-Reply-To: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0124.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: d2eb29bb-3f66-4bcf-dc8b-08dd8005b9e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2dtZER1THhueTNzSW9KRUlidjhqaDYrbmlzc2ZZK3JvN3NJOFNRNjRFVmtw?=
 =?utf-8?B?WXRybkxPbFZrMHRoYjhhWlZxUUJHbkVSYTBMQ0RTQXpscHp4Yk5ZMFoxVm1o?=
 =?utf-8?B?SkovT1c3UTRpTVFIcjYrY21DRWc3ZHorb1ZVcGYwSldPbWNpUHllQTU0b0dW?=
 =?utf-8?B?VmcyM2I4eDVYSitpM3VoOGNhM2Roa21TOTMwUm12anNJKzBCQWM3RDBKajFt?=
 =?utf-8?B?aEt4R09ncG1qZ3ZkV2daZk1zQk9SYUpSS2w3S2FVV2VXdGhJTmhwc2NBcmNO?=
 =?utf-8?B?QkpwVUFqSTQ2TUJOUlljTld4ZGFubzBRNm9yQVNLSHU2TUljczdjUjgrZUhJ?=
 =?utf-8?B?TDZsZzIyNFVSOHVVTnJZcXpJKzBYdTlUU0NWRDVKTHJFYXYvZzl2VkxCMkk0?=
 =?utf-8?B?S3diR3ZtWnJRWWpNVzdldmJBZ2pIN0VTSXhod25JTDFDQXZOTldaazZQaFhO?=
 =?utf-8?B?SFlRUDdTVHdJc28xZCtKc3NTOHVWQ250UTJEaW5VUG5Hc3hzSXJpTHlNU0I1?=
 =?utf-8?B?WEFDampiTkZrVkRoTFQzeHRUVzMvdlA0dVQ5cFNYcDBJaFlZRlNJMFRWZE1S?=
 =?utf-8?B?ZW5VQ3Uzd21aUmd6Q2dZMTFvR29mVUxJL3M1R2c4TzU0ZklQMHpwVzVQdGNK?=
 =?utf-8?B?cm5VcGNXMkdGL2xaQWpibVNKaGhiRktnQnBMV21xb1dTOVJkZVFTRVpjKzV0?=
 =?utf-8?B?enhzcCtVRmZwQWJsQjdsVVJJeERrTXNJckwwMU9nR2ZmL0ZqemdkWjBGbXJ6?=
 =?utf-8?B?WWpDN0hMR1kzSGNvNjNYdTVhODd5ZlFrK2hXNGlNeldLeXAyalJKZGd0MkJ3?=
 =?utf-8?B?cTIwVFQ1RTMrR21NaDd5Z25xc25IQWZqRmVXSkdYcFM5ZFJ5TWtrOUZoRXNq?=
 =?utf-8?B?cmlUNldwSThxckVUSnMyL2lMQXNDcWx6cjI0Y0h6cThsOGV6MDhCTHU3UzB0?=
 =?utf-8?B?QXo3QUdMcnAyQzVPNG9ReG9Wc2dhYzdhb0JKUGpIOUpoK2pzNWNCQjBYd1B6?=
 =?utf-8?B?cXJObXp6bElJN0krOXJrajJPa2JxZnJSWXBxeURsTGh6L1RPSUZzejA5c3I0?=
 =?utf-8?B?T1NvSGpnaGlGbXF4ZG9JVUVDNG1VeVZGR0pTRjBrMGE5dkJGQnB1dUVRVXF2?=
 =?utf-8?B?bDQvOFpSQmNvTmovekVGZDFWd3FvU3RkeTBWQnpONU1GOUxUTFJybVNCVVVx?=
 =?utf-8?B?VDNkaDBndHlmQVdITEluQmJBb2EvN1VnS1ZlU3d3bWdORnVHMnhyekZaeXlR?=
 =?utf-8?B?U1dkb0M5TFpLa3djenNHVTJHTWNhdHg1azZWQzUxR2lrTzdIcU92aUUzcndK?=
 =?utf-8?B?ci85cVRlSHZ4QitrTFhyQXkxVW1MUUl3K3BlTDlhWWlQaSs3NVNJSW9KWnRF?=
 =?utf-8?B?UGpIN1hFbVA1Q003UDhaYjRpVU91UHdvTHZUNGhDUWIwWUpUdVlyVlFudnBP?=
 =?utf-8?B?VGY4ZVZ4amUvODVFN2RCK1pOazJEb0tBdk5KTTl5MUxYdGdJRnFKblJEUjNj?=
 =?utf-8?B?dUNIZlYrbEJSSXU3Qnc5UE53c3NhUnJSRW1ubVR4RHBvd2pVYTRhbDI0dGtp?=
 =?utf-8?B?U1JpOWdxMTNndjBZL3g0SlJsUW13bEtvN0JwUFNtUkQyMElwSVFDeDBydzZn?=
 =?utf-8?B?K1ZCNjBETkNSa2E1YVlVS0pleVZ2a2tKV3VsVDdyTWE4cHJRa2I4VFg2a2gw?=
 =?utf-8?B?MG9UMXIwa29qOWxZT2JVclhJaHhaVmt5Q2JjSXJyM0t0RmJYT3JnQ3NsQzVS?=
 =?utf-8?B?Z2ppR215bHZWbHRqY1VkbnYwZzIyNG5PUm8xcmd4eUZDbG41NDJleGtZb0hw?=
 =?utf-8?B?NW90SHN2SnpxeW5waUxtc2s3dk5sSTkyazVmMXdTcnphbG10TUFEanhWVlRl?=
 =?utf-8?B?bUxyc1k1Tm5vT3ZsaUNQdXNLTFJSRUtFZ2lIbU5xM1ZDSnpGaVZMTVc4QW82?=
 =?utf-8?B?OVYvcHk3RGUwalBYcWdqV3hTZytVbERLMCswSm93TnVLbGl2NlU3cWJxTi9a?=
 =?utf-8?B?TTE1ZG1MWTdRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWdqTzBiTWlUTllhWDJJZkhlVjVDQ0VQcXg1cXpsazEvdGhUYlNvKzBiUm9q?=
 =?utf-8?B?cVZhQjQ2LzFraW54RXFtbE5oc3FSZVAyTlhtQU1JbWx1UTFTcDljclhRMTdl?=
 =?utf-8?B?WjdpV3llQ3lhRUEzbHVjWEh1ZzFHZGlIcE0zVmZsbWwzNjcwU0FJVUt6bDBY?=
 =?utf-8?B?MjlLNFc0YWhuNDZoZnN4MEUrUWtudEdqUkpobjBadHl6S2EwTkhsVzRVUTln?=
 =?utf-8?B?UWdmMGc0ZnQxbldPV1llWFM5ZkVlQUFYWkl4SUFXMnVWRlNMclN3THA1c3Zu?=
 =?utf-8?B?a1YzWW9DWFNmc2NTM0ZVYVpuZk9HNzZtWUIyaElEZlpiWTdkSCtIcTAzYVI1?=
 =?utf-8?B?dmpXeHFXdTNJQUhJbnc2aTNZd08wODVNblhiZG14LzFZYWhwMDFRNEJuRURx?=
 =?utf-8?B?NEQ5OTdLWXRLcHU3aGJBUTZVUTJFbGZibWd2VU82cHBxWkhxaUZrMlAzcW9G?=
 =?utf-8?B?Q1h4K0JzSk9pVzFmMkd3YUlTWS9HdzQvZFpHUEVhY3dzU2RJV1BRK25YRU40?=
 =?utf-8?B?UTIwa2FZWU0zcjdrMlBlcXg1Rk5uQXlWYTByRmxvVjFHd044dmpZMitqeXJS?=
 =?utf-8?B?Z1l0WThOL1hVTVppMTRoTkROby9jdjVBZ2ZBNjVmNUNwZ2ZpNzBkb1BOMExa?=
 =?utf-8?B?eDZ1bHg2Yi9FRXRHaWduRW02a0dzejVvK3lKNlhjYVU2RHhSTzhEa2Y0cE5v?=
 =?utf-8?B?T1pKNDhUdjJhM01JeDVoWUlqV1pjMU5oTXVrRTVZb3BNUXdjSGVTUG9INUlL?=
 =?utf-8?B?cjNmV2FNZG5XS2Fwa1g4SnZGTklRTzZ3bjVqMGZaOXhXT013b0hCdGdOYjVx?=
 =?utf-8?B?L05GUkIxb1liRXZLbS85VW81dnlDc0dJVHhrWXQ2OGs5bDRCYVlkK1dMLzZD?=
 =?utf-8?B?NE9uV2VFL2FpRkRpR250Um5ZMXZPcEZNWHo0TlZhbS9RM2tCL2ZPTjVsdllq?=
 =?utf-8?B?N2JiU2lvRDRXZU43M25wNjZVODNRc0pLRUpCSktwbTM5OGtTQjhXNnh6SnQx?=
 =?utf-8?B?dHp6eTNIS25ES0ZKdzhIU3lxb1RsajNJYVVWQVdITWlTNzZyd0hwNHVjSmRy?=
 =?utf-8?B?VE0wdTBJcVN6ZFZmZlZkT1pXMlhINFR1MldHTGsyMHYwbDBhdjZRZTRtUCtI?=
 =?utf-8?B?VE1scjhGc2VtbzFsYVpqYU9WYUg0R1dURXhhQnIwci9rNVBjZ3JzaWF5Nkow?=
 =?utf-8?B?c1J4bkxOOUVudVBzM3g5dEErNEU1WlhpWEZwUktST0xqTHB6T25ldnNESHRo?=
 =?utf-8?B?Q1NJc05lbi91aURTenFZLzFXWXdTYmVCLzhFa25VZGtFdjZ2VHJwcUVJaU1R?=
 =?utf-8?B?VmRiaVJaRG9XWDR6RmFhS2ZBYnVCajhMTWh6MnYvWHJuUUdRSzVZRHJYelZn?=
 =?utf-8?B?US8wSE9INlZFcVR3R21KZXM5V1FRQ0VadGlvWCtWWVFsbjdKd1g5dW9DTG9O?=
 =?utf-8?B?OE4yUWYyYW0xMkt1OXZ3MHUzditnbGdXRm1jZUN5WFNzZ0hMeUtGeDFWUDNa?=
 =?utf-8?B?L1laWnZPdkdEd1k2NmoyamY3c1V3ZVRlckpIai90WVNKMWRwSXBteW52Ui9o?=
 =?utf-8?B?NmRIcjhDa0JEdkNWY3JnZWplZkVWeVpWU2pwdFA4cUxQRFpiWW83MTNXaUk1?=
 =?utf-8?B?ejQyclZDb0tkV2JLUFh2bk02M1Z4K3A0U0lvUjdhNkdVOEtjNTl1azhtem4z?=
 =?utf-8?B?M2RXQVFweXRXaDl0aDNCUUpNZ3lGRXdUb20vRnYwc1FlNkhETVlHaWlXWmRY?=
 =?utf-8?B?Njk4YTdOdDdzSWRsZlZWWDhjemRqOEl3Y0RXVXVsVlBvY0FhcWx6UU9ERkxn?=
 =?utf-8?B?Y1JucWliWGE3SE1JTjExV21hSG91bVB4MmVMcVRtclNJMFh3VXRsdThQUXNU?=
 =?utf-8?B?WW81YWgwSkZVWkVaZFdYaHJqNU9HMTlHMmZrOCtiZGpReXROak1YaDdlcUJE?=
 =?utf-8?B?SjRJTWlobWNTZThzMjY0d0NyaHpySm50QjFaTEZ5ZXc2TXk3OE5nSjJzU0Rk?=
 =?utf-8?B?cWtTbm9KUmtSVW0xSkhOOGk5WmxWdVVWSkttZkJWZHhKZjdQamhyUFFDOWpy?=
 =?utf-8?B?eGMwTDVyL2JHOVMyRGE4dGJNcFhneFpneWVQb3RLbVRtMlk1VitGV21MeE9G?=
 =?utf-8?B?dlI2aFArVTF1bFl1VmpLd0tGM3ZxczNpdVZXZERqVGVhZUcrM0NkekxWUDA4?=
 =?utf-8?Q?vMcM/AA/fKtXb+pCLf+vFQ+3pEsemerWhvuWcoqbrlnG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2eb29bb-3f66-4bcf-dc8b-08dd8005b9e5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 12:20:23.9648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VMxJ77jturibU7y++ipi68ujmmCw5lKp91eeQUfJb561Rk43EvXduxTDeyjpvDVgh8KWGRdRJDy6uTlwrRgHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175
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

Add a timer that works with GPU time and provides the ability to wait on
a condition with a specific timeout.

The `Duration` Rust type is used to keep track is differences between
timestamps ; this will be replaced by the equivalent kernel type once it
lands.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs       |   5 ++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      |  10 +++
 drivers/gpu/nova-core/timer.rs     | 133 +++++++++++++++++++++++++++++++++++++
 4 files changed, 149 insertions(+)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index d43e710cc983d51f053dacbd77cbbfb79fa882c3..1b3e43e0412e2a2ea178c7404ea647c9e38d4e04 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -7,6 +7,7 @@
 use crate::driver::Bar0;
 use crate::firmware::Firmware;
 use crate::regs;
+use crate::timer::Timer;
 use crate::util;
 use core::fmt;
 
@@ -153,6 +154,7 @@ pub(crate) struct Gpu {
     bar: Devres<Bar0>,
     fw: Firmware,
     sysmem_flush: DmaObject,
+    timer: Timer,
 }
 
 #[pinned_drop]
@@ -217,11 +219,14 @@ pub(crate) fn new(
             page
         };
 
+        let timer = Timer::new();
+
         Ok(pin_init!(Self {
             spec,
             bar,
             fw,
             sysmem_flush,
+            timer,
         }))
     }
 }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 37c7eb0ea7a926bee4e3c661028847291bf07fa2..df3468c92c6081b3e2db218d92fbe1c40a0a75c3 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -26,6 +26,7 @@ macro_rules! with_bar {
 mod firmware;
 mod gpu;
 mod regs;
+mod timer;
 mod util;
 
 kernel::module_pci_driver! {
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 1e24787c4b5f432ac25fe399c8cb38b7350e44ae..f191cf4eb44c2b950e5cfcc6d04f95c122ce29d3 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -14,6 +14,16 @@
     28:20   chipset => try_into Chipset, "chipset model"
 );
 
+/* PTIMER */
+
+register!(PtimerTime0@0x00009400;
+    31:0    lo => as u32, "low 32-bits of the timer"
+);
+
+register!(PtimerTime1@0x00009410;
+    31:0    hi => as u32, "high 32 bits of the timer"
+);
+
 /* PFB */
 
 register!(PfbNisoFlushSysmemAddr@0x00100c10;
diff --git a/drivers/gpu/nova-core/timer.rs b/drivers/gpu/nova-core/timer.rs
new file mode 100644
index 0000000000000000000000000000000000000000..8987352f4192bc9b4b2fc0fb5f2e8e62ff27be68
--- /dev/null
+++ b/drivers/gpu/nova-core/timer.rs
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Nova Core Timer subdevice
+
+// To be removed when all code is used.
+#![allow(dead_code)]
+
+use core::fmt::Display;
+use core::ops::{Add, Sub};
+use core::time::Duration;
+
+use kernel::devres::Devres;
+use kernel::num::U64Ext;
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::regs;
+
+/// A timestamp with nanosecond granularity obtained from the GPU timer.
+///
+/// A timestamp can also be substracted to another in order to obtain a [`Duration`].
+#[derive(Debug, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+pub(crate) struct Timestamp(u64);
+
+impl Display for Timestamp {
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        write!(f, "{}", self.0)
+    }
+}
+
+impl Add<Duration> for Timestamp {
+    type Output = Self;
+
+    fn add(mut self, rhs: Duration) -> Self::Output {
+        let mut nanos = rhs.as_nanos();
+        while nanos > u64::MAX as u128 {
+            self.0 = self.0.wrapping_add(nanos as u64);
+            nanos -= u64::MAX as u128;
+        }
+
+        Timestamp(self.0.wrapping_add(nanos as u64))
+    }
+}
+
+impl Sub for Timestamp {
+    type Output = Duration;
+
+    fn sub(self, rhs: Self) -> Self::Output {
+        Duration::from_nanos(self.0.wrapping_sub(rhs.0))
+    }
+}
+
+pub(crate) struct Timer {}
+
+impl Timer {
+    pub(crate) fn new() -> Self {
+        Self {}
+    }
+
+    /// Read the current timer timestamp.
+    pub(crate) fn read(&self, bar: &Bar0) -> Timestamp {
+        loop {
+            let hi = regs::PtimerTime1::read(bar);
+            let lo = regs::PtimerTime0::read(bar);
+
+            if hi.hi() == regs::PtimerTime1::read(bar).hi() {
+                return Timestamp(u64::from_u32s(hi.hi(), lo.lo()));
+            }
+        }
+    }
+
+    #[allow(dead_code)]
+    pub(crate) fn time(bar: &Bar0, time: u64) {
+        regs::PtimerTime1::default()
+            .set_hi(time.upper_32_bits())
+            .write(bar);
+        regs::PtimerTime0::default()
+            .set_lo(time.lower_32_bits())
+            .write(bar);
+    }
+
+    /// Wait until `cond` is true or `timeout` elapsed, based on GPU time.
+    ///
+    /// When `cond` evaluates to `Some`, its return value is returned.
+    ///
+    /// `Err(ETIMEDOUT)` is returned if `timeout` has been reached without `cond` evaluating to
+    /// `Some`, or if the timer device is stuck for some reason.
+    pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(
+        &self,
+        bar: &Devres<Bar0>,
+        timeout: Duration,
+        cond: F,
+    ) -> Result<R> {
+        // Number of consecutive time reads after which we consider the timer frozen if it hasn't
+        // moved forward.
+        const MAX_STALLED_READS: usize = 16;
+
+        let (mut cur_time, mut prev_time, deadline) = {
+            let cur_time = with_bar!(bar, |b| self.read(b))?;
+            let deadline = cur_time + timeout;
+
+            (cur_time, cur_time, deadline)
+        };
+        let mut num_reads = 0;
+
+        loop {
+            if let Some(ret) = cond() {
+                return Ok(ret);
+            }
+
+            (|| {
+                cur_time = with_bar!(bar, |b| self.read(b))?;
+
+                /* Check if the timer is frozen for some reason. */
+                if cur_time == prev_time {
+                    if num_reads >= MAX_STALLED_READS {
+                        return Err(ETIMEDOUT);
+                    }
+                    num_reads += 1;
+                } else {
+                    if cur_time >= deadline {
+                        return Err(ETIMEDOUT);
+                    }
+
+                    num_reads = 0;
+                    prev_time = cur_time;
+                }
+
+                Ok(())
+            })()?;
+        }
+    }
+}

-- 
2.49.0

