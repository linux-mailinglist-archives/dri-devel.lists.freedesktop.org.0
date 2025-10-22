Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F133EBFE409
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 23:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A9210E848;
	Wed, 22 Oct 2025 21:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ALZgTmvI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010008.outbound.protection.outlook.com [52.101.85.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FB810E847;
 Wed, 22 Oct 2025 21:10:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJ5OWPHeztCn+N9W5OrbMXW0OXBJKV/GT/0fSsvztrRi8XgSZqYJviGpOSLwdcD3iQxQvA3BHH2F4t4Zhoflp0yY1YQSxEc5yGyNahvoV31Eq73QHqpnXsqyOX0pKfFnc49di5UWe9usM32SVyx1jz4mCxkF7PVyvAwOHR9Vbs7aEBShnNCkFqahuXLvL8q3HtQ8aW5M+JC5C16m9HbdgVeQfOrXOmAF38pC+O0mhdCmGgp0FkEG93WlGlE9c9nNgOHkFuum34ehFrlFVLmM5J0ONzlLGBWpySY2K5ysxw1sdI34+Juotxvwan0Yu+IR6U7SgZrMY1Az0jCydKZUfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jtolnvknLZ8301HqFjC1svXE9REGRAKYuHQ6Jq8vLc=;
 b=ZVBeiibj2O7Jj2Uauh1h2WQN7bI36nDz0pfGae4Niu6eNm+lCx7Da+Dbje6C1i/C/X7h4lnavhar+0oOCM1Bi9kSw1FA1noWBVmwkMD6rsWldRe916e/wN3wDj2lBVDxxYEY77S5jYm7feksojpKy6uwHZT4ZEC/WAK8GaWB3mWGwyOrlzX22rqeWL6aJvAtKun8kI9PRHRfs3ufcx3WOJTMn8JormjScF6uWUJJdlapA1CMXWB7i9UN9f1DZ/CMq3PH/8/l1+4otr+A0nu+hMl1+xlZyE/0wfsDUmabJ3QTqTsZ8fgfBJQaeAAmgpeeHR6Mv7gHfh2HmX013Y2u0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jtolnvknLZ8301HqFjC1svXE9REGRAKYuHQ6Jq8vLc=;
 b=ALZgTmvItxl0cIbpGe9p09bi+zr2hBilcoXUd+kUzLbRiFd/hDZUA+0oraRDCUBx0CAIcCQGHX++pEjEQOVSvhhhbxZZIajSi4jt0uWqg39GVDqPSoNR+VEGnBkh2IL1KAwsgsqMDputKPxREl/v+aCUcN+tD2b5J6WTuekpAYcIehknN1VsNF0FeBJe0irPjK/wAZRxDc1itEFDo4KTfqMSbWf08pmZo9JLppACsfIF0W/6slp8CoTrz0GLslDn4C1i8VS3EwfYtMqz/SsJ/oAJO2fJA3rGW3r7KKL+Bz3tqUknunfCJEhsJrafMGPmc4vPWlzb15W9kdBnQ9TYNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW4PR12MB7431.namprd12.prod.outlook.com (2603:10b6:303:225::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 21:10:01 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 21:10:01 +0000
Message-ID: <8fe3f616-27d9-4251-a753-1b2698a82870@nvidia.com>
Date: Wed, 22 Oct 2025 17:09:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] gpu: nova-core: Add support for managing GSP falcon
 interrupts
To: Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-6-joelagnelf@nvidia.com>
 <4553a31a-fd13-41c4-8bcb-3b830cd7b661@nvidia.com>
 <DDONF5MY5Y8F.1LPCBN4MBL5RZ@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DDONF5MY5Y8F.1LPCBN4MBL5RZ@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0297.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::32) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW4PR12MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: c1cc8771-18bf-4a79-adaa-08de11af5d03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STlnWmd1UWgvVVZLeDhHKzVoSXd0TDVveithMjhiNHMweG5GSXZJTVNPOHlw?=
 =?utf-8?B?NHZkd0U5U2FqVUM4R3V6T0p2eml0Skdkdzk1R0tNL0hYNnpoK3dBWVZpYW8v?=
 =?utf-8?B?RzRERCs3dHJDYm45U0MrbnQyYlZxeTNqT1Jlek9mTjdtQWNERjlvaEdoMnNQ?=
 =?utf-8?B?UTBzRmN2Wkd3Q2F0dFkwOFVjcXVOTGkyR1VXUi9MMXMyL3F6YU5jbG81UHR0?=
 =?utf-8?B?MC9HWk1SSUhRMjBMZ2w2dUxyOFNOd1JRT05oQVkwZW5Yd2x5blY5SzdmSjBR?=
 =?utf-8?B?S3NtVW5kNTQycnFNL3VZM3A3MlRnOFNMYkJNbHNTWHBIblFPdnFLaURzZmIr?=
 =?utf-8?B?MVVtUStDb21TdlpuNUV6YmV0Umw0SytuZWFDdEMxUTRCQ2dWN1UxMlh0aFJt?=
 =?utf-8?B?YUx1KytaZ25rUjJXQUtDd082U1hNYUZrSEFqcVg4cmxMd3pvYll3d2Y3Q21P?=
 =?utf-8?B?ejdpV2hmQk9BQ0RvS09Xb3FqQjBUWEZyVkhtaVc3dnN5OTBRbGMzcXFyd3Zy?=
 =?utf-8?B?RUJKR2ltenppSkFpaXQwbUFuMCtyc3NQOG1TazI3NzgvSGtCTVV0L2NlZEFx?=
 =?utf-8?B?S1Bpb24vcnIveVVwSWljSHVEaDYwNnRnUE02VTd0WjdYcjZUdXZueDVobGxj?=
 =?utf-8?B?QjlCbVE2Q0dxU2YxN09CTllVTkVaemZicGdJcnZTVGM2dkxEam5OVVFQd1gy?=
 =?utf-8?B?SXpRdW9DWENEUW9ldFQ4cDZUVXVRZ3hjVWMvMmUrTndwTXNQLy9PQmdzcTUx?=
 =?utf-8?B?bFdKYmE1Y0xmajJmS1c4cXNiV2RkVUVCblpYZUxJdHNmWWY0TTlxYTdWYmF0?=
 =?utf-8?B?MjU2V3VUNzBOeUpYYlFYWnYwL1VJSW9JNmtudS9id3lKT2ZuTG80RTZaSmh0?=
 =?utf-8?B?VVNWTFZjR3hlUmcwUFZLekRCNzVGY1pQazc3SnhtZmRnOSszaTlibmFtbFNR?=
 =?utf-8?B?L29jQnRxWWlyS2NtZXhzME9Rd3pwWHNEaGRkWklValdFOGw4V2x0c3dabkhG?=
 =?utf-8?B?Mnd5VXJ2ZzRWM0xNa1pxRG1oMWNETVYvUzROSHcwM3BaUUs4WFduYTZ2aFhz?=
 =?utf-8?B?MnVvejZTRWc4bnAvSkV2SnhaeU5DOFUremI2MnE1SE5xU2hiVTZkVm8vZUJr?=
 =?utf-8?B?VGljWmJIWXVuYUdzTHQzbGJscGh5Z1p1UzUxeFNxVC8wRTNnbWxSYWM4NENq?=
 =?utf-8?B?UXR6NHovdWJ4VnArQloyM25CRThneEk4Vk5kWDFnOEZIY2ZkWlZqSjRqVWxD?=
 =?utf-8?B?Y1l1dWJieTN3UDRpd0VybUUyK3hjeUR5azVxdkVjNW9ESXJqdi94dS9sU0c0?=
 =?utf-8?B?SjhkZGxZSWVOazFFYi9OQ3lqOEN0b0IxVlFiU0txeWdvLzAwNWFnUkdQenA5?=
 =?utf-8?B?UUFKb3AxUXppMVZVcnVuYmNaZmlVdnhIdWpHalZVa1c0c3dtS3lvRU9KcWIx?=
 =?utf-8?B?ZHJiSmJpY1J0OEZYRVI1ZE1PUks4d29NWVVVZTUwVEtzc3FLQWVOQ29URDI4?=
 =?utf-8?B?dzh2eG5GOTBYV3h2WkhBRzdGM0lLNWFSVU5oRVV2Y2FOM3RkMTBjVFBQK2Vu?=
 =?utf-8?B?ZzUyZmFPYTNoQmlEZ3BrRytkbHhXemQ1OUpYVFBOZyt5VEpJbVh0dFdjTHZ6?=
 =?utf-8?B?T2ZVM0p1VlVrZC9STTA3eHpGMHdZRFFpdDYrRGRvN3k1Y0YzazhRNlU5ZFZr?=
 =?utf-8?B?WWVzTy9hYkVtMVdiaC9MeVgwanRDQzJZSDRIU1Y5T0hYMm5EK2puVlpDQzg4?=
 =?utf-8?B?ODM5L0ZmWUR5MzNJakdXTkFVV3RxbStYdWV0aExHT1YxMWZuYjFLNUJRUndo?=
 =?utf-8?B?WHdYLzB5SEtRaWJOL0tYWTRzQVIzem9XRmhnYkh2WHlyZit2ZFRqYkdHUDJG?=
 =?utf-8?B?OTZucVpnYU9ZanBvRk1iWTZUNFhOWmpCQU1QRFZmSGVXelFyLzJDQ1NYN04r?=
 =?utf-8?Q?9Q/8aYYAvrNVD8w6+Hf88fMQwDkYfaFd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGtYY0VTaFdXN3A5MjB2dzRTQ01Gdnd5Z0toOWVqYkswTU1xd3lRODdGbUM0?=
 =?utf-8?B?MkpoVEcrZXVBU05tRGJ0UE8vSCsreGVQcUIxK1l0MEw4N2RFZXpFZDNZZFRY?=
 =?utf-8?B?bUs2Q0xjT3l4YkpraDVXUElTT3BRM3p5U09vbWFTQVhxaGhJVHVUakJnY1NZ?=
 =?utf-8?B?MGczb0JwL0dMWkRKZ3dxMW1IRnAzaGx1RzFHd0dzeEk4alJxalg0VTA1T1Bm?=
 =?utf-8?B?TkpzTEFXQjc5TnRLRzk1MUE3WWw4eXB5SWk1dkxNdzBVZkZncWduQUlMNGtK?=
 =?utf-8?B?YURua1Z6SC92NDZxTStxZ0M3RHBvUXFUTHZ2RGViM0VIZVdVdTJPd1hjbVRE?=
 =?utf-8?B?SWpYU0FlNVFpc2Y3bUFCWVNsM3hWYzB5c1NDaFF0UlNoUDRJdis3Zm8wWmsw?=
 =?utf-8?B?dmVBcFh2OENNcy9YVVc4eTRxRHlIalNPYmlmZ3JiM2pncXkraGxaK0F0VkFW?=
 =?utf-8?B?TWZOWTVuV00vY2JhVDIwMElSM3ZBdU1SNVNoL0JyU1lSaVc1NnpoUnd5QzEy?=
 =?utf-8?B?dUc2ZWVkTzZ2cWNQckVmVzJLSkR2dG5CZ2dzVVgxcnpRSFdVSjQ0WERtMlRq?=
 =?utf-8?B?YUc0NVllaHVoRThQMW9wQ1hoOGdUaFRlUm93eGN0VGVrdXVuaDBWT3pBa3J0?=
 =?utf-8?B?dzF2M0JlNHFWcnJBTUIwYXE2TXRNVG9OY3FjNXB4OEZldHo2MHlsdEJOS3lk?=
 =?utf-8?B?djhqLzdkbWtrMlUvaklzQkpCK0wwUHZtd2JiQi9SYUtWUHZDSTgxRlhIRlp6?=
 =?utf-8?B?ZG9VdVJNYlRQUzRPckRjKy9VNU83MHdJZXp5NFFPVWZDK3ROVHRIMXN3OUdr?=
 =?utf-8?B?L3FocVQrT3E1WFNsWmhYVEowaUpQaGZwNDBXU0tPbDR4N0cxYlBhNnlobUZq?=
 =?utf-8?B?SkJFM3hsVUZNdTc5ZWFsaHJzckpNNERMT09Nek5xR2t3YVVDMndCYWZydmtK?=
 =?utf-8?B?c1dlRkZTMG9tbk1EYjl5cllTa3pSRXFETnNCaHc1V3N3NzBzVnA2bDJKZCtN?=
 =?utf-8?B?NUdZaW1DcVkyQWFjOTJRTlI3QlNGM2JZei9XdS9ZZjYwR2pnQ2Z5cURHV0lP?=
 =?utf-8?B?OVhKdjJQcXpWQkdwdXh5STBndnRUVnNSaWlwNDBCUWo3OERaZWpRUWIwOVRh?=
 =?utf-8?B?NVZwMFZFaUxwWTJaSm0wYzhZMG1JQVdUeUphM2RXbTZiMjAvYWNtc1JDUUhh?=
 =?utf-8?B?eFN0MjhHNFE2bnpzOGZrV2pZbFp5dXN2VGJIOVllNW1UK0RQUnVhU01sc3pT?=
 =?utf-8?B?dTJ2RDR6ajYxZTFiOVoyUXRtMzl3M0gyUmRYV1JLMmhKdGpJU3NnU3kvRDlG?=
 =?utf-8?B?Rldsc0NzU2VIeURTTDYvVUJWdHRjR2JHeU04OXY5Mm1pblpKNjU5Mlp2Wmdo?=
 =?utf-8?B?anRRMVJRSXBQdTBqUld5T0FsTUIweTdwdkxEUjg2anE5N1JVaStzN0crTVBN?=
 =?utf-8?B?dHljekJNcjhQNGxFNnlOMTlHUFlDVVJwU0F2eEl2TDdnWitPenhveE9WWkN5?=
 =?utf-8?B?ZTBCSFBiWWhVTzloMnpjYWw0UURSVUtzQ09SSXFNL25VemlRdHZwS2NYZTRz?=
 =?utf-8?B?QVplMUlYYitxRDVxSnQ4UVBHakFlY09jN0grSzdpaGtNVmNWRW94bVFheTBk?=
 =?utf-8?B?dUR1OUNJZkJidUpxR29xRXA1YUV4Nng4OEpFV1luZzE0YTBHaGh2R05udWlu?=
 =?utf-8?B?NlpGcEdZM1V4MU5STVVXcFVucFFCb3hRNXE4QTZKdzh6RW8xT1Noa3ZWenp3?=
 =?utf-8?B?SFEzbU52Z0VuK3lPWEpac1htUEVISjR6S3IvVjJMdlJOZlZnNk5ES3FnWll5?=
 =?utf-8?B?cVRuakowcmp2R2J0RkZIZG9NdHBSYzZEbU1pckhDcTlSYVR3NUhqRFRFVFdk?=
 =?utf-8?B?ZnB5cHdIMDk3M1Q0dVNucjY2SFVOSit3ZTE3S1gzZjRvZC9Xci9pWUltbjVm?=
 =?utf-8?B?Y0kzNnpSK0xRbXQ5REtDb2JPUEZUeGJpNWllTkptS3hGRGM5Z3FFT1JPa3Bj?=
 =?utf-8?B?c3NuR0ZrOFNaNzFQRUhQcWwvdk41ZlpEb29jVTg0Yk05NDYzWXowdlRvNDJ2?=
 =?utf-8?B?VmF6RnNRbVV3NFEwY051WmlHUFhDSVNDV3VNa3YyVm1PZEE4VXU5T0padjRO?=
 =?utf-8?Q?mgbjCT4kPFVhEoQGAz+znud2V?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1cc8771-18bf-4a79-adaa-08de11af5d03
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 21:10:01.2308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e78X5DLA4YoBvVAsN0mLSZddyTftoGQB58p7d4FGewHjBjVdxaWOx0hXdCZkcwPLWs3IrJNBtjn0iix2rnBFSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7431
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



On 10/22/2025 2:48 AM, Alexandre Courbot wrote:
> On Tue Oct 21, 2025 at 7:35 AM JST, John Hubbard wrote:
>> Alex, this ".alter" method is misnamed, IMHO. Because for registers,
>> The One True Way (or so I claim, haha) is to have the following methods:
>>
>>     .read
>>     .modify, also known as RMW (read-modify-write)
>>     .write
>>
>> "alter" never shows up in this naming scheme. I'm going to claim that
>> this is a bit jarring for old hardware/kernel programmers.
>>
>> But it's not too late: these are only used in a very few places, and entirely
>> within nova-core, too.
>>
>> Can I *please* send a patch to rename "alter" to "modify", perhaps?
> 
> Oh yes, although I was just thinking that this should be renamed to
> `update` for consistency with regmap.
> 

Either update or modify would be Ok with me. Update does make it sound more like
a total write though for some reason. Perhaps update_fields ?

thanks,

 - Joel


