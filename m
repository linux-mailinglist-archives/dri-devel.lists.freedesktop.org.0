Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5894AC42010
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E25B10EB9C;
	Fri,  7 Nov 2025 23:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eGsC+qHW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013011.outbound.protection.outlook.com
 [40.93.196.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4C910EB9C;
 Fri,  7 Nov 2025 23:43:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ergxQZjdTz3LOp61ADY85kl1naEzt99C+lt3E77tvAnZ1tye2bC9UUOSC79x97FdUHc9elXeAqU8RZIiQngrx6AiJVYPjz4ULNE85qCe1rlYhILOTwsRBmkmjXuvwfwPydhYTeshemrjcuBju/umlej02ZDHbcK0VHIIyaeugVA0QY7Lm2+R8CWvWRYnz3UEJKlN8qNJkvAD73J5Pfm+VkbjvZ4wDhUehgAlO/jvn11F/ZtCOyAojs5lJqP8x8O0Gy4fHhCV1twL7hUcE8YpplXRAqOwoez8W/ugavIGzOBNNWv33zmDdG4DcA5bzUIHKkhCZuMVNrc11SCrmuKnow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AEAPDdoLPN0pkw4p/4udIpa/f++8fAD9VwIi4NUmUs=;
 b=W+4zLiXdYadAQS1+9XuNKK1UDqQLwCaPL17UxVaMuLCz/8hslwPJMDHHTCTJEFvgZCQr3bGcat4dRMald1OmKxoeJjLqD2sztc2H47l76WT3Eia/p2F3L3WwiLuCVxzGxbPEnUgOsD7TGaf62dvvZiX0/McYuuU7z5gx4P44UXM7ocqdmq31yIqP6aN/p1N56GKo4XKg5mkdsP6riiArkYCNmO64ni/Rjexw6Juqc8Cctypf+l/QUb+kG4N1IJ0N4awsW26oOyTsJe8q9kVn/RReRO3awKE+4CRFQSFdLCeWhw/Eh+gfiRBYuwnXU/TpumE9rdZNz/cUCgZduwRJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AEAPDdoLPN0pkw4p/4udIpa/f++8fAD9VwIi4NUmUs=;
 b=eGsC+qHWZKpsmjhG2jeZdDjK4xxW5RjPOsf2jnNfGI+2zCXzn4WvoNi5/RB9KGioVz1Qu1Jl+cupDdsHzrMLtJcXEOo75/WS1BF6raxw8gM3p9Y9/zHf3RjDurw1w9i3se5/RdQjx7HfOpbd3efBvpcOdx8Z17i6LAfrCI0wRWmR39oUjr+4hmGtHPkNCZH4f8NX8SPZCJ4rQWWJGI4T0Vk4F4P+zsY+jb80WIox2kN2n3tJYXz9vgSM08RAs5Sutzn1/0L/cJDEXn3wAtxexsjXYFDhWGxzQP2ype8t6Z+Q/E/QMfFohpESBIeysFjkAkjw4xQvn3LyX6VBM18gDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 23:43:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 23:43:43 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 08 Nov 2025 08:43:08 +0900
Subject: [PATCH v8 07/16] gpu: nova-core: Add zeroable trait to bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-gsp_boot-v8-7-70b762eedd50@nvidia.com>
References: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
In-Reply-To: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb9895c-53cb-45c0-4a1f-08de1e577c8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUFlL1lrNk16V3pKK1ppYzQ4QUpuV2M4d0hnVWVnOTRCTkZ0Vlh2YnIwOStQ?=
 =?utf-8?B?ZDB3TGM0UkdwTFowOHNic3FBclMrYXc0a25ueW8yeVVibWVMTGRJTkVVaFoy?=
 =?utf-8?B?ZEVWOUdVSFJmMGRNREJWUlZEbU1EMDVwU2p0NHNEWmgvbFo0N2QwcDRzTEt6?=
 =?utf-8?B?N2ZnU3RqS3pJbzc3S2VTTFBzWlJPWmVYVTVXQUpqWFN3L2x1MjZoTFJHL0da?=
 =?utf-8?B?WmJFclN6YTBLZ290WUpObjQ1Y3hteEdTMERRODIydVBtNW5SVzY5ODNJcU4w?=
 =?utf-8?B?NHNjUkJmK3hRRldvZ1Z3UlkzcmVzUVl2VzFkMVYzK1VSVC81T3VLbnhTU0lL?=
 =?utf-8?B?Mm9JTTBiU0ZYbnd2RXRyV0liWUpuU2piMExza1A0UUcyTjQ3aWJnb1A1eXJy?=
 =?utf-8?B?aXExTGlXVGJPRm1jY2NLRVZhWk5ZdFhYb1ZUR0FSR0F4M3FCVXhEWjFESlhm?=
 =?utf-8?B?NHVRUXBZU1dacG0vd3FaREZUaHl5ZVk0VzBrVSt3ZzVNREFaaHBSOFNmUEZu?=
 =?utf-8?B?VERtakUzOHZiYlpsMCs3KzZKZWFIc21MTGxsUVlSTWpqeXFiaEU0SEZiNmQ3?=
 =?utf-8?B?ci9nYnFMbTFYMkM5Nm5iUUFHWXRTaVR2d1BIN3dvV2lmVFg0dmNvUXBPa2pp?=
 =?utf-8?B?UkZHWk9YYnNyN3VwRGJuOFY3Rk53WTdPTDVCVjZlT0JVMTBpdTV3UFJSRnRp?=
 =?utf-8?B?ZndTL01XU3JYUGl1OVdGMEVncGNWMUJySEk4K3RIclgreTZmVGlZdzVmTll3?=
 =?utf-8?B?bkxITWVvNDFTK1F1MG14bTVqVm03eDB0SHo3eDZJUUQ3ZkNndnFaRHhCNU5W?=
 =?utf-8?B?OVlJV1JQclRwaGp4SlczZk02eGJPY3EzVnNJODhJN29hcmNKRGM1OUxjb3g2?=
 =?utf-8?B?ZkxFZUdoWG4wR2k4MngwWDNSNlg0NjJRUlNMWFFCNitoR25VKytKRXc3ell6?=
 =?utf-8?B?REZWNlNWdmFjdG5RRDVjdE00SDcvZEovelZ6SSs4RFlydTRvYktMRGxxTkxH?=
 =?utf-8?B?cWlDMi9nRk5oSzYwZTZTWjNNay9ueGY2N21LenN2Mm5ocm5jVlNzM1BxbjdE?=
 =?utf-8?B?TVdFazdFUTZvOHdNbTNPbHhzQTZaMjJ3aVJYcFJaWEw0Nm1yQWkwUTYyNmFn?=
 =?utf-8?B?d2JlTGM3U1Qxc3VCQWVjUlZIdnIvQndpTElQSSt3OFJkQUtKSmRjbzFqYjlB?=
 =?utf-8?B?ZjUwVWx4QkN5V1p0TDdCRmRzTm5LY28vUlFLWmVXZ0JkS3dsUkdUNGJRbVVt?=
 =?utf-8?B?Ull5Z2RPRzBBbU1SaWVlNG5SY2hQSklzNldaRWc4cDA0bU02Y0J0SkdWS0Vx?=
 =?utf-8?B?dmpuaHBveG5GRzl1SW5MTVEwTEtUKzRJajBxNDllUng1VWhDUmlnb0g3dWxL?=
 =?utf-8?B?ZGxNNEJKeFJkTm9mS2RxcmlMS1RQZURVYnJQYVUxNGVZS1o5NUVobkRHR3V2?=
 =?utf-8?B?Rm9NWGN6Rm05cis0QnpvNjJIVmdjS1lKVnU5UXFIRHhia0pFTGZkeklOZFN6?=
 =?utf-8?B?T1JjSERiY1RadUdXa2FCSnlqK2dxU0NRWEdQa3NRNnQyNU5zRU12Q1JRRUF0?=
 =?utf-8?B?UE5SdFlyTXBxZE4ySjh2R01WckhObmhJdXdiZDhMN3pQK2xIMXZ5ZWJPQmxr?=
 =?utf-8?B?N2pNUXJhUzdrT1p4bWxoZFFvV0RLVms2Z0VaZXhHNjMzZXUvOWIwNythdHFt?=
 =?utf-8?B?MmhvN3J0WWJUcEpZNzlseFIvaHRFaXl4bUQ3VjZWWlYvS2t3SHFtWHR0OUFm?=
 =?utf-8?B?czBTTTFKNDZhcm9vd08yNmdnMHh2MDBRbXdsWHNaV2tFcElrVXFSVHErMUx2?=
 =?utf-8?B?cVlBcHVkMjN3REFHekdFYUZudHNGVlNvS1lqSU1VeEI0NVJNSzVtSmVvQlpO?=
 =?utf-8?B?NEY4SkltYjAySHRXblB0Z1UvVzVqZzdLWGJEMHBFbEx6LzJoYlhSKzc2MTJ0?=
 =?utf-8?B?YW5KZ1BzQ0x3dytVUVA1TUx6eXhaTkNnZXczdStGekNPQURvbFhoRWJ3cHJH?=
 =?utf-8?Q?IyyLWXsPNf3M5IcoyrHzIFWvw6124I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXBkYks0MWlYc0VNR2N2bkJDSWtWcHlqTkIyNnRHSXRlMGlieGp2MkR0Um94?=
 =?utf-8?B?T2kzdDIwYUZpa0REemNhQlRuYXJqZ0VMRG83dVU0SWdXczhvWHgrSzJuYjJa?=
 =?utf-8?B?VXQvR29kZWlxT2x3SW81Q2RNRWlSdWxtUm5Ucm9ERnF4Z09EYUNadVlCTVE5?=
 =?utf-8?B?bWRwTVJreFB0RWMvVmxUYnIrUytsQ3U2dnVQaWVnMVRSZ0hPL2pPcEhxQWlQ?=
 =?utf-8?B?bElnM2F5NHFqbXpLNXdxUWMvWU15bDkrbURjcnhJODJ4c3BUZEY5QlJMYmNh?=
 =?utf-8?B?eVFQVkxmQXNHWkYyRTdndlBRck1WRm5vQ29RSG8vbTl5MnZ2SU5TUEs3N1VQ?=
 =?utf-8?B?Z0ptTnBGemxzc1hYdzg5bVpEeHY5alVKSS9pUEN5VkxxTC95eHVZS3VYOUVW?=
 =?utf-8?B?YWQxSUE1R3p5SXZiZmo3bkxyOXM2cjVFVEVYT3IzVlpENlZYajFBQkNhL2ox?=
 =?utf-8?B?dlV0d1RnaDVReEJFelBUUTljRzV0SHlyS2s2cVV4dDhTVnNBUzdCWFY5Zm5w?=
 =?utf-8?B?WUR2eUZwSTJwN0NEZGhwRGFPY1JUOVhFQ0d1SVVER3c3Y1ZVMjJ2OWVmTUR5?=
 =?utf-8?B?elZDZHk0RzgxQ09ncHg3Vi9jbWFaL1FSSis3K1hpdjIrSnVlOXUzTHdvL09H?=
 =?utf-8?B?SlVsNVRRenZscStFUjVVZWg1K0RuS1RucnVXZjZQemM3TGMwN1NQeElTNzFF?=
 =?utf-8?B?Y3UxRjFabkRXVWsvVDJVNEIxaUR6SGxxSUM1U0N2ZXVYcVkrSDI2dlVCRkR0?=
 =?utf-8?B?WVJlcHZLZmhqd0NXQWxQQTFjY0ppRzZLaTVCRFBIMzY3VnRUNWIyYy81Qzdt?=
 =?utf-8?B?dU8yYWVyTUxVMXRrZ3lITWhXaDJtcGNrRDRFeWplSmI4NW5xR2M5NTI2UVVC?=
 =?utf-8?B?T1NPUm53K3ArZDNad0dmTzMzY04yUjMwbGVkbnMvMmJ0MmZPeHM0SGdoOVhj?=
 =?utf-8?B?eitCWGF3QlZqTHVucFNXQ25yZEVvOU1BT2E0YmhsRlV5NjFvT2hSY0lTT1Fs?=
 =?utf-8?B?eE9LNk5YU2hhMVNoTzRtQVZ1M3BRc2oxeU1vQzNKK1Y3SlBOQ0xGNERLRHg2?=
 =?utf-8?B?LzU5VTBscUtYdEpCRWV1QzdzL0NDSTAwMjFPcm9iVWRsMGF4M2lBZEJrSWZG?=
 =?utf-8?B?QnljNC92R2N5VnBlT1RZV3h6K1ZFZWdtSkUyNmhsNmRIdFJWL3NDNytxK2lr?=
 =?utf-8?B?ejA5TzdOT2x1ckRidExSbjEvdmdOTlQyNlgrb0kzVExxbGRCWGUvallxZWVS?=
 =?utf-8?B?VWpiRVNWY3k5QzFNYkw1b1F3MWZCZ203THd0N1lZczJRWXgwS1FwNG1Ua0xv?=
 =?utf-8?B?dFd4bGtpenh5QXhaeFlvUnJNaDl4bUxvZ2ppQVEzR0tYb00zcFlwL1JIUjlr?=
 =?utf-8?B?UzVSK1pzTzBMOWVGTjgwNUNmNFZrbXdoMG0rVFIzZGcvZituMkNQaDRHUTM2?=
 =?utf-8?B?TGdGNHZnUldWc2xNOXRMUVhDalF3L1BKd2gxbmpVc0QwVlM5K2ViV1RzeDAw?=
 =?utf-8?B?QXRpQUJERXpKZmZibmNyWFhEZEY2SFhDYVNrbFNOUy9rM2RVMldPSXFYaVJu?=
 =?utf-8?B?NVdmN3R6emMvSlJNb0NwOWRwMHJONVh0ci9vSSt5aFF5SWpsYThrSVo1czdq?=
 =?utf-8?B?WXpmang5NXZRb0o4WEVCV3N0Q0dDZTdJVFZqWllkelk5QnFwTUs2TG1pc3o5?=
 =?utf-8?B?NUhGaG9TNDl5UkJRUFRCWEdFU2NkNDA5aEtQZVpQZ1J0UE5oTDBONXgweTZZ?=
 =?utf-8?B?TzBYdDF5NjhLSllPdnIyQ3dFMjRpOS9PQkxOY3FodUx2SzRPU1NIQmhtbi9U?=
 =?utf-8?B?Umh4T3dpaHZtTnNZL0Z6eUxHWC8rdEhBQ2hlSXlsVDZIeXZOK0dpWmkxKzdw?=
 =?utf-8?B?QnRZTkE4U01vU0JtR2V0ZmQzOFFKMTlhczJScDkrYnRBVmtTN0xBTjRqTUhq?=
 =?utf-8?B?S1JmSFVDbzIrMUJLWk90SVdVWTljQVZvMlZhNSs3ZVZzSnVlVU1adXlsYW9a?=
 =?utf-8?B?T3NoOW5ZZGRzK0VPZlphdzNwRmRyUnBBL3FyWWR3MVJ1VXQxQW5leDVpOXJ6?=
 =?utf-8?B?UXN5ejVCSnZNTTZxelhEWVhjVWZwQW5XYzZSVy9tY3hnOTdOcTgvbS9mSi9O?=
 =?utf-8?B?Nmd4KzU5akN2N3RPN1hyVTYzZFV4Rnl1VGpybHhucjBaTlFxMXZXNDVwdVlY?=
 =?utf-8?Q?TOLkuReKcUgNmctKrwOp1jTbL9NXe9rVGUbVIgUiOzAT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb9895c-53cb-45c0-4a1f-08de1e577c8c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 23:43:43.5058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tg4zxkA+d71sfqjD+6TLMtYCqjpdcTxeJjSIStvNP2Ip7e5IIOpj/YPo0wQjCrGVfqRvUZh5rH0AbcgCdH7cqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642
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

From: Alistair Popple <apopple@nvidia.com>

Derive the Zeroable trait for existing bindgen generated bindings. This
is safe because all bindgen generated types are simple integer types for
which any bit pattern, including all zeros, is valid.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |  1 +
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 16 ++++++++--------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144.rs b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
index 82a973cd99c3..4f5c65ac1eb9 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
@@ -25,4 +25,5 @@
     unsafe_op_in_unsafe_fn
 )]
 use kernel::ffi;
+use kernel::prelude::Zeroable;
 include!("r570_144/bindings.rs");
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 392b25dc6991..f7b38978c5f8 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -20,7 +20,7 @@
 pub type u32_ = __u32;
 pub type u64_ = __u64;
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta {
     pub magic: u64_,
     pub revision: u64_,
@@ -55,19 +55,19 @@ pub struct GspFwWprMeta {
     pub verified: u64_,
 }
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Zeroable)]
 pub union GspFwWprMeta__bindgen_ty_1 {
     pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1__bindgen_ty_1,
     pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_1__bindgen_ty_2,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_1 {
     pub sysmemAddrOfSignature: u64_,
     pub sizeOfSignature: u64_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_2 {
     pub gspFwHeapFreeListWprOffset: u32_,
     pub unused0: u32_,
@@ -83,13 +83,13 @@ fn default() -> Self {
     }
 }
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Zeroable)]
 pub union GspFwWprMeta__bindgen_ty_2 {
     pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_2__bindgen_ty_1,
     pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2__bindgen_ty_2,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
     pub partitionRpcAddr: u64_,
     pub partitionRpcRequestOffset: u16_,
@@ -101,7 +101,7 @@ pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
     pub lsUcodeVersion: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_2 {
     pub partitionRpcPadding: [u32_; 4usize],
     pub sysmemAddrOfCrashReportQueue: u64_,
@@ -136,7 +136,7 @@ fn default() -> Self {
 pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_FB: LibosMemoryRegionLoc = 2;
 pub type LibosMemoryRegionLoc = ffi::c_uint;
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct LibosMemoryRegionInitArgument {
     pub id8: LibosAddress,
     pub pa: LibosAddress,

-- 
2.51.2

