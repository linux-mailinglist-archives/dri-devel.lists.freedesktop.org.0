Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28793B56177
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 16:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E55110E200;
	Sat, 13 Sep 2025 14:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LfzB0I9t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8099610E202;
 Sat, 13 Sep 2025 14:13:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sb905I892vS0m/FFLz2HaSmiW+1tYFGFhaCBy+WlecwoRJbNtvaNUHOkG9EPKfUaZzOuoOMgBY1Xd45XJutjeJAoeCDTte+boSxISV9Uy0f2nj/wC9/OtzXYwCwT4lcGJZk3F9RoejYT07tEPnzxhzfs90xCLEl79Ue+BY3zMnIt7iL9pmpZhtPRzIk4RKFDRoPThfgerap/Rqt/KS2NIwdXSEyRlmKpFF16jClddCgz/csF8YpCgJSou5CSq0K8yoJgzLrwH0nbtToZ9Yk91AfZ7H9Yq1H37y3nt2FqBs7GoiY0KIiMpZ0Lnr0khDpw+2/HD+SNtjj0ARVetpxbMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaHJjZDWWIiSGIiknCZCBf8ppzN54X1OPGmlCUMZv0A=;
 b=bnEjp8hRXeDD2Y4ra9jbwUKh9EZKajrdD1PgAl7xTXifVlkqWRqyDcQpGaD09JHnmIEEq0LnICEfdcHmvx7Fa95SqivFaVVSgkZcyrA/yoDlakFVu4p8WwJRqHzyQ15RgZx8bkLuDTL8i9rmEaIGIVFdxMHDcKXgV1hCzJOdQ5AcYhwe43giYlLuOGRqJc4X3WNROmpxwWIA/EK8yNyaQPBi4+K4N8+BodzjPPzlvjd4yqa5BZk5/vNLINbKqZcaGg16l2+LA5fz7gNqcLrLj4hU4Gqa+3rnZF9lkeGj+MqRoZaqOyCDxrcKvsXYx/1+kPdAIGKedcUdc0JRSMHenA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VaHJjZDWWIiSGIiknCZCBf8ppzN54X1OPGmlCUMZv0A=;
 b=LfzB0I9tB+ZTahbFUshsQDSP/irvHJbkRCBlt+tsJADa4P0r9oJz6kTfGWpN/9uydsaqR/QKMPmmsKBVaxRWHu9XaD5eln4rond1Q5eLsVXXXMb/Of/gzIYMWm1dk3wlW9uNpFyF1mZII53zwC+6Q/O92OddFqcnjXBhVhLDiJ9zSkmkQumaN7EsyxbT1fl0qh4SX+SkFTYECzwangjIU92/bjcDoCTh5IS3IGPkC778xbGbZ8Z2ejWZETCZZc1excbx/XlgM51Jds9nzrZnMzkZR7VGw+HF6sZgU+vB02lGU/bK0tz7Ms33NgsfcoWUm2tKUBfx3Hlop5liUbDIVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY1PR12MB9583.namprd12.prod.outlook.com (2603:10b6:930:fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 14:12:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 14:12:59 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 13 Sep 2025 23:12:24 +0900
Subject: [PATCH v6 11/11] gpu: nova-core: compute layout of more
 framebuffer regions required for GSP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-nova_firmware-v6-11-9007079548b0@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0044.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY1PR12MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: a5711f43-8b1f-4015-0051-08ddf2cfa4ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFJIV0R3d1BTanhuTGR5ZkJQRkJhbzZFNXFoTnNqd0xWY3R6Nzk5M3YyOVB0?=
 =?utf-8?B?NEdlR3JHK0tWa1NNcldoZitjcEIwRDlVbGVqZWQvOHIzSWx1NW15cDNRN3R2?=
 =?utf-8?B?VG9aUnpDdmVOSE5kMjRxTzF2Qmo1bXFqQStQbHl2SS9lam43S3pzUWJTNUNC?=
 =?utf-8?B?L3hWYlk1UDNTYW9xZXFaUUh2b3JXbG9Idm9oVThNU1ppQmhIUHpiTlJZL0o1?=
 =?utf-8?B?cnphZ1E2dVZqV0QweUJ1U21UVmY4d1R6SWNra0pVQVdFKy9QV0lpdHpmVlZi?=
 =?utf-8?B?ZVhrMXBoOHhwbGwwS205VkxWeVJ4aDhBZUpGK1lka0NHZmoxRHE3NVkrTUtZ?=
 =?utf-8?B?a1RObHd0d1Y5V3U2ams4N01Ncjk5YkJxQ09PS2QwQjB1NUNvK0tZUURPdzFT?=
 =?utf-8?B?L1RYcXdwMThFeUNqQmxwdEp2K0tubkhnYlZkTXdieTd6clpSOTloRE5pR25T?=
 =?utf-8?B?bjZRY1J2YnM1a2wzK3RwNnc3SEk4US96cnBJQ0tuMFM3UXRWMXoySlFMRkp0?=
 =?utf-8?B?TS8xT2xvWjlqR2FDUDFOb3J3R1lWV3pYTEVCUVZ3TzJPSFZ1MTlyZHhrQkEr?=
 =?utf-8?B?VUdnczY0ZExOV1ovV1VsVTd4T2x2bnFPaGZ5NFNhNWNpUzZKNlRIUDBjb3o5?=
 =?utf-8?B?dk80U0ZrSmNpamF3djIrSzZHUXMxMGRCRmN0WEt4U2dNT3V0SlhYY0Q2Yk03?=
 =?utf-8?B?bmVMWmpwYTZBYlVXaCtpSktQbTNRQjVFcWUyVUEwMUZIWDZUbGh4b09jK2Qx?=
 =?utf-8?B?bi9KdkZ4WVZob3ppZXZjY3BHWktCdlJmUTRJTWxxWDIvOHBFNFNJdDVBbmp1?=
 =?utf-8?B?d3ZTKzJvVFAwbzBLTzZTV2VzeEI5SFVMdytyYVZYZHByUEd2ZTFBZXl5NU80?=
 =?utf-8?B?bFhLSExJT0V0ekRlVnZSZWx4TnRvNjFKbFlQeHZTK0MvSm5pMEVaQkR3OW5s?=
 =?utf-8?B?TUNWUmFTSThjTXp5UUNUZnhNLzlvdzhTdGIzWFg1R1Jmd0M4dUVsK1FBcW1L?=
 =?utf-8?B?R3QzUVpvVVVyengxemhoL2JsaDRMWlVMVjMydm00L1REU3N2YmQ5Qk94MTVj?=
 =?utf-8?B?K29yVnNHM0RrRFFFQ2ZXNzhpcCtBdWhha0E0bjY4VnU4R1pzSmdtOHJ2MUxL?=
 =?utf-8?B?czViK3RSVGRVb29WaTA0aGw4cld3eTN1aVkzUTZDejJDTGxDeFJ0M1JPUWNt?=
 =?utf-8?B?cE5DT2pTKzVGQlpYRm9XSW11cS9mTjdZVDlGbXhZOGEvcU1BSDhlOXdORzRz?=
 =?utf-8?B?SXVMT3c3NlFKVDdsc2J5YzRqVm9lN2VLaGI5RStQQW5QalhXSTFES2FnclRJ?=
 =?utf-8?B?ckJPLzFCVGtvaWNpd2NTSTdWTCtLYmpVcGV1R1hSZ0JOczVxWmxib1RmY2xZ?=
 =?utf-8?B?dGRIbHdWMWQ4Qkc4UmRuWVlaaXpXdkdGa0FVVVIvZVJTdHI3REFIdE0xblhh?=
 =?utf-8?B?TzBGYUtXUEpSa2IxZnB1YmZVSkpUKzE2NHVxN2N2ajJUbldPOTMzWnRBcVZX?=
 =?utf-8?B?ZCs1WVBEL0x3enVXVkZ4QUE5T09Dd0xzQzJ0dHFUd0RkN3hIK1VVbzdzbGNO?=
 =?utf-8?B?THBKQVpJYjRTM2RiNEtBU3V2WUc5OFJpY2ZRNVNIMXpnbER2d1VYeGJ5VUdP?=
 =?utf-8?B?bGVNNHZORFJRVkFnOWxidDFVQ0RkbmhHMlVyT0xZU0F6VHU3NTUxY1NiNzdw?=
 =?utf-8?B?UXFVZTR6ZFNQU3kvWnE4Z3NVZDJReDVFUVZhdzFiSGVQa3RiUXJmRTBYampy?=
 =?utf-8?B?RGM3alpmV3R6eCs5eW9BQkxDLzhQWmRaMUNoV2wzeUlBSVFHa2NhaWlzUGpI?=
 =?utf-8?B?c25IYklZd3V3TkFBQ0VpTzd6a2EvcGxLNU93RE9JL1FVRy9SbVBTaDFuTVhl?=
 =?utf-8?B?dVpiQ0lvU3BraDhQV0tLWjRPUGNuSVdKK0VrMHBmTGp6OUxDVCtDM0N3VG1V?=
 =?utf-8?B?a29Pbi8xY09NSHBTL1FVYjMxYTdDRjEwSDMxNzVLQjFDTUE0YmtRMFBzYVM0?=
 =?utf-8?B?b3BDTXlwbWlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zm5VY3UzbFFNbmhkd2xSR0xaWndIcmNqYmtMeWdscWdLZmY1UDFqa3lFbzNs?=
 =?utf-8?B?RGh5Rjk2czVxOVBUSld2b3g1UGE5SGh0RzVORWN0b3NvY0pIOURPcTZBTWh3?=
 =?utf-8?B?MGNyVXRlZU1yc2FBcTVQWWRMMXN2aUF1OUNpVnBmSG1UWkFvdWc4UXl3MWFp?=
 =?utf-8?B?Rk04MytLMWhHK3BwUWtoVkl3RFdlOXZ6dWZla2NDd05EczNtZ1o5RW50RjhL?=
 =?utf-8?B?RlRjK2s4MG5URmV3bXdNYmpCL29xZXB3b25HVllxVFVTZStnRS9lNUU0OGFa?=
 =?utf-8?B?aCtDbkk4SEdQaWtXbG5kc3R5ZXExdU1iS0lXQzlENGRJQk1VQmNxZjVuMjdh?=
 =?utf-8?B?dnhwRittTnduNzg3R3Z5SmtRZjlTWWZUV1hwOWU5OHdPZnI3YlBxdm9lNGZM?=
 =?utf-8?B?VUpBRS9UVzFMeTlGSUZqOXlQd2ZKV1RyVUdFamUwTVVVMnZsZmlqWkFwcmkv?=
 =?utf-8?B?K3ZlemVSdjZPK1ovanJBWEF0ejFEa3dBOXB0U1FuR010a0p4cnVmZmZESVd6?=
 =?utf-8?B?Y0NCaHRmb3hDWnJ3OURRdmlRajVWY1JiRldQc0NBMnErOHE0UFBRSDRheENz?=
 =?utf-8?B?OXRCNGdqMy9BMkNLOVpRblhUSnNqaFlVVUtIM3VkNFRXbGtBMldqWDFzNm1R?=
 =?utf-8?B?ZUlFb29OMk5iTkdpa3FFaWljM044ZU5abDJOSjllcnJmQTViTFFnZlYrNkRH?=
 =?utf-8?B?REJON1FtVC9yY01IQnprUFlKd1dpOVJiV0xULzNtOXlYS0VvdGhIR25DV2FQ?=
 =?utf-8?B?S2hyN1lVb2MxWGV5Y1dPU2FneWZjcXFXREZSZmFPMHZHRHh4SndGdHg1Wk5a?=
 =?utf-8?B?WFEyL3ZRSUFNYzltdWU2VVU0aDNZTThYSTVzMG5XQWhReDRXbjczZmRZRFRm?=
 =?utf-8?B?TE9sdkFRUVdmYkk1bkVWUWxtMFl2aXBmZ3JoOEtDcGZYcnJCNU41UWMxeGt5?=
 =?utf-8?B?T3BLbFZPbnRpVlNxQmVZNWtWMW5mOE10SnFlZmNiMjl5ZDdMSDdzWjhnejlE?=
 =?utf-8?B?cEs0a3cxTWRiS0FicE4vUHBOWFE5b01aY0xnNUVBSER3aWVWS2ZFRGhnS3pB?=
 =?utf-8?B?bWwvZjAxTmtpdGVkYTZsdnRYcE4xcm1yR0p6LzVENjllWkNsVkFqdkI1L24v?=
 =?utf-8?B?dkdJQkVCalZuaXkrNlpsMEVIMngxYithWi8yV2M5SXB6akd1dW9reTJTWlli?=
 =?utf-8?B?TDN3cXFuR3VtUXRYWWphZUc0Uzc5SCtXNC8xRXk4ZGpDL2JuVWpENndxQThU?=
 =?utf-8?B?RzcrckZXY0YvalFBMFVpOXJ2azNQYktaR2JjcFlPVklWTlIranFSNFk1QWxw?=
 =?utf-8?B?Sk1ENzQwanRoMkZoWDdPd205TDZzRU5EbnRkbTlsQThpZ1NKTWd5Ly9zQUk2?=
 =?utf-8?B?QlV3dnZEQUhheVQ3a2ZMWWl0c1NyaEtqV3V1YjZmY0R0ZlB3MnJCTkZYTnhP?=
 =?utf-8?B?Wi9Kbm1OOUlvbmdwMTd5OWFMVS83eDRyNjlLQ213Y0ZNc2c1V2dRK21HMi9n?=
 =?utf-8?B?SjhMY0Q1blFsejhMaU9pN0ZENFdPcW1CZUFxdk1IRkU4bXdQOGpHL0hpV1JF?=
 =?utf-8?B?Z0dtdnhhT0JxM0ZMOUgrbmg2ZjFpaWtROHNjSUVrMWQ5eG9vN2N4dWtEaldV?=
 =?utf-8?B?Z055NHU2RUh2QmpRR3lsT2dGdmxFZm5xTWMzY1pzamFINE1BL2lmcThNQTE1?=
 =?utf-8?B?dENnMGlBcjRoRVI4b1RBdFZua3I2c0J4REFtcG55TFhXTEo0c2o4OVJIZ0hh?=
 =?utf-8?B?eE9WZjQ5OWMzMDZjeldVQ0U0M2U4YTFIUE1IMjd4SkZJOW9iZmkwcjFTWEZE?=
 =?utf-8?B?eXVONEdUMkRHN0FzQXNUbldCQlFBMEJqVWhEU3RsZDZGbEVHWlNEaDEza2Qx?=
 =?utf-8?B?bzFRbXZkdDdZbWlMdlN5MWplOVhrQkJSQ0NObXpVVXFOTkp5SzJVbGZJZzVB?=
 =?utf-8?B?TDFRSDlWZlJFR3R3dGxnR3JDSjVRQk5ZZlJGaUpaZlpXNklaUnhBcWExRkNs?=
 =?utf-8?B?YVVsSmFaRThPRXJOL0VUbEJZK3dXaW4ybS9aMm5uaTJsMmpGUTVzRVk5K29n?=
 =?utf-8?B?elNqQjFreFV6ZnRlUDR0MXNVRnVYMFA3L3N6RnJuWVU0N1g2TEVDZVN4dk82?=
 =?utf-8?B?MUxQWVQ2UE90cGNOaXgrc2lGVy82Ung0ZnBwWk9RY3Q1MnVveDJDM2IxNndU?=
 =?utf-8?Q?v08kQMFRK27YISaP0m34w4Re2Mv8YWYqu9bzM6HnDpKR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5711f43-8b1f-4015-0051-08ddf2cfa4ab
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 14:12:59.2813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWWJ89gcYJO3hZe5pgW4Gv5KyVAy4xeV9w1MkjBXj9jU+0Pkxiwd4syJgfMiozdPnY0MvyDGw8J2FLhSUpjsiQ==
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

Compute more of the required FB layout information to boot the GSP
firmware.

This information is dependent on the firmware itself, so first we need
to import and abstract the required firmware bindings in the `nvfw`
module.

Then, a new FB HAL method is introduced in `fb::hal` that uses these
bindings and hardware information to compute the correct layout
information.

This information is then used in `fb` and the result made visible in
`FbLayout`.

These 3 things are grouped into the same patch to avoid lots of unused
warnings that would be tedious to work around. As they happen in
different files, they should not be too difficult to track separately.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs                       |  65 ++++++++++-
 drivers/gpu/nova-core/firmware/gsp.rs             |   4 +-
 drivers/gpu/nova-core/firmware/riscv.rs           |   2 +-
 drivers/gpu/nova-core/gsp.rs                      |   5 +
 drivers/gpu/nova-core/gsp/boot.rs                 |   4 +-
 drivers/gpu/nova-core/gsp/fw.rs                   |  96 ++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |   1 -
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 125 ++++++++++++++++++++++
 8 files changed, 293 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 27d9edab8347c5ed3be104d62a9e32709238bb92..4d6a1f45218368dd3c0e79679f2733b5a15725e0 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -10,7 +10,9 @@
 
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
+use crate::firmware::gsp::GspFirmware;
 use crate::gpu::Chipset;
+use crate::gsp;
 use crate::regs;
 
 mod hal;
@@ -87,14 +89,28 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 #[derive(Debug)]
 #[expect(dead_code)]
 pub(crate) struct FbLayout {
+    /// Range of the framebuffer. Starts at `0`.
     pub(crate) fb: Range<u64>,
+    /// VGA workspace, small area of reserved memory at the end of the framebuffer.
     pub(crate) vga_workspace: Range<u64>,
+    /// FRTS range.
     pub(crate) frts: Range<u64>,
+    /// Memory area containing the GSP bootloader image.
+    pub(crate) boot: Range<u64>,
+    /// Memory area containing the GSP firmware image.
+    pub(crate) elf: Range<u64>,
+    /// WPR2 heap.
+    pub(crate) wpr2_heap: Range<u64>,
+    // WPR2 region range, starting with an instance of `GspFwWprMeta`.
+    pub(crate) wpr2: Range<u64>,
+    pub(crate) heap: Range<u64>,
+    pub(crate) vf_partition_count: u8,
 }
 
 impl FbLayout {
-    /// Computes the FB layout.
-    pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
+    /// Computes the FB layout for `chipset`, for running the `bl` GSP bootloader and `gsp` GSP
+    /// firmware.
+    pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<Self> {
         let hal = hal::fb_hal(chipset);
 
         let fb = {
@@ -138,10 +154,55 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
             frts_base..frts_base + FRTS_SIZE
         };
 
+        let boot = {
+            const BOOTLOADER_DOWN_ALIGN: Alignment = Alignment::new::<SZ_4K>();
+            let bootloader_size = gsp_fw.bootloader.ucode.size() as u64;
+            let bootloader_base = (frts.start - bootloader_size).align_down(BOOTLOADER_DOWN_ALIGN);
+
+            bootloader_base..bootloader_base + bootloader_size
+        };
+
+        let elf = {
+            const ELF_DOWN_ALIGN: Alignment = Alignment::new::<SZ_64K>();
+            let elf_size = gsp_fw.size as u64;
+            let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
+
+            elf_addr..elf_addr + elf_size
+        };
+
+        let wpr2_heap = {
+            const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
+            let wpr2_heap_size =
+                crate::gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end);
+            let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
+
+            wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN)
+        };
+
+        let wpr2 = {
+            const WPR2_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
+            let wpr2_addr = (wpr2_heap.start - size_of::<gsp::GspFwWprMeta>() as u64)
+                .align_down(WPR2_DOWN_ALIGN);
+
+            wpr2_addr..frts.end
+        };
+
+        let heap = {
+            const HEAP_SIZE: u64 = SZ_1M as u64;
+
+            wpr2.start - HEAP_SIZE..wpr2.start
+        };
+
         Ok(Self {
             fb,
             vga_workspace,
             frts,
+            boot,
+            elf,
+            wpr2_heap,
+            wpr2,
+            heap,
+            vf_partition_count: 0,
         })
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 9b70095434c61f30927463d0c869fbd666e7ef7a..463f64d83b44b2317496690f839c97bac6ba6ecb 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -129,11 +129,11 @@ pub(crate) struct GspFirmware {
     /// Level 0 page table (single 4KB page) with one entry: DMA address of first level 1 page.
     level0: DmaObject,
     /// Size in bytes of the firmware contained in [`Self::fw`].
-    size: usize,
+    pub size: usize,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
     signatures: DmaObject,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
-    bootloader: RiscvFirmware,
+    pub bootloader: RiscvFirmware,
 }
 
 impl GspFirmware {
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index afb08f5bc4ba87a30a8200706391426bda85ff50..04f1283abb72bd58fb295f1972a601d01423260f 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -63,7 +63,7 @@ pub(crate) struct RiscvFirmware {
     /// Application version.
     app_version: u32,
     /// Device-mapped firmware image.
-    ucode: DmaObject,
+    pub ucode: DmaObject,
 }
 
 impl RiscvFirmware {
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 64e472e7a9d3b3a600cbe45b5d18c2f12861750d..503ce8ee04209f702825539ed6b014a2a9eaf168 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -6,8 +6,13 @@
 
 mod fw;
 
+pub(crate) use fw::{GspFwWprMeta, LibosParams};
+
+use kernel::ptr::Alignment;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
+pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
 
 /// GSP runtime data.
 ///
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 2800f3aee37d05e4d24b4989d2ce418ab2549596..fb22508128c4986d7591688dbdb906a98dd660cc 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -113,12 +113,12 @@ pub(crate) fn boot(
 
         let bios = Vbios::new(dev, bar)?;
 
-        let _gsp_fw = KBox::pin_init(
+        let gsp_fw = KBox::pin_init(
             GspFirmware::new(dev, chipset, FIRMWARE_VERSION)?,
             GFP_KERNEL,
         )?;
 
-        let fb_layout = FbLayout::new(chipset, bar)?;
+        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 34226dd009824c1e44d0cb2e37b43434a364e433..181baa4017705c65adfc1ad0a8454d592f9c69da 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -3,5 +3,99 @@
 mod r570_144;
 
 // Alias to avoid repeating the version number with every use.
-#[expect(unused)]
 use r570_144 as bindings;
+
+use core::ops::Range;
+
+use kernel::ptr::Alignable;
+use kernel::sizes::SZ_1M;
+
+use crate::gpu::Chipset;
+use crate::gsp;
+
+/// Dummy type to group methods related to heap parameters for running the GSP firmware.
+pub(crate) struct GspFwHeapParams(());
+
+impl GspFwHeapParams {
+    /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
+    /// and including the first client subdevice allocation).
+    fn base_rm_size(_chipset: Chipset) -> u64 {
+        // TODO: this needs to be updated to return the correct value for Hopper+ once support for
+        // them is added:
+        // u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100)
+        u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+    }
+
+    /// Returns the amount of heap memory required to support a single channel allocation.
+    fn client_alloc_size() -> u64 {
+        u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
+            .align_up(gsp::GSP_HEAP_ALIGNMENT)
+            .unwrap_or(u64::MAX)
+    }
+
+    /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
+    /// `fb_size`.
+    fn management_overhead(fb_size: u64) -> u64 {
+        let fb_size_gb = fb_size.div_ceil(kernel::sizes::SZ_1G as u64);
+
+        u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
+            .saturating_mul(fb_size_gb)
+            .align_up(gsp::GSP_HEAP_ALIGNMENT)
+            .unwrap_or(u64::MAX)
+    }
+}
+
+/// Heap memory requirements and constraints for a given version of the GSP LIBOS.
+pub(crate) struct LibosParams {
+    /// The base amount of heap required by the GSP operating system, in bytes.
+    carveout_size: u64,
+    /// The minimum and maximum sizes allowed for the GSP FW heap, in bytes.
+    allowed_heap_size: Range<u64>,
+}
+
+impl LibosParams {
+    /// Version 2 of the GSP LIBOS (Turing and GA100)
+    const LIBOS2: LibosParams = LibosParams {
+        carveout_size: bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2 as u64,
+        allowed_heap_size: bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB as u64 * SZ_1M as u64
+            ..bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB as u64 * SZ_1M as u64,
+    };
+
+    /// Version 3 of the GSP LIBOS (GA102+)
+    const LIBOS3: LibosParams = LibosParams {
+        carveout_size: bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL as u64,
+        allowed_heap_size: bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB as u64
+            * SZ_1M as u64
+            ..bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB as u64 * SZ_1M as u64,
+    };
+
+    /// Returns the libos parameters corresponding to `chipset`.
+    pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
+        if chipset < Chipset::GA102 {
+            &Self::LIBOS2
+        } else {
+            &Self::LIBOS3
+        }
+    }
+
+    /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
+    /// of `fb_size` (in bytes) for `chipset`.
+    pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
+        // The WPR heap will contain the following:
+        // LIBOS carveout,
+        self.carveout_size
+            // RM boot working memory,
+            .saturating_add(GspFwHeapParams::base_rm_size(chipset))
+            // One RM client,
+            .saturating_add(GspFwHeapParams::client_alloc_size())
+            // Overhead for memory management.
+            .saturating_add(GspFwHeapParams::management_overhead(fb_size))
+            // Clamp to the supported heap sizes.
+            .clamp(self.allowed_heap_size.start, self.allowed_heap_size.end - 1)
+    }
+}
+
+/// Structure passed to the GSP bootloader, containing the framebuffer layout as well as the DMA
+/// addresses of the GSP bootloader and firmware.
+#[repr(transparent)]
+pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144.rs b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
index 35cb0370a7c9b4604393931f9f3bf72ef4a794b4..82a973cd99c38eee39a0554e855a60e61dba2d01 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
@@ -12,7 +12,6 @@
 #![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
 #![allow(
     dead_code,
-    unused_imports,
     clippy::all,
     clippy::undocumented_unsafe_blocks,
     clippy::ptr_as_ptr,
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index cec5940325151e407aa90128a35cb683afd436d7..0407000cca2296e713cc4701b635718fe51488cb 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -1 +1,126 @@
 // SPDX-License-Identifier: GPL-2.0
+
+pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2: u32 = 0;
+pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL: u32 = 23068672;
+pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X: u32 = 8388608;
+pub const GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB: u32 = 98304;
+pub const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE: u32 = 100663296;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB: u32 = 64;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB: u32 = 256;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB: u32 = 88;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
+pub type __u8 = ffi::c_uchar;
+pub type __u16 = ffi::c_ushort;
+pub type __u32 = ffi::c_uint;
+pub type __u64 = ffi::c_ulonglong;
+pub type u8_ = __u8;
+pub type u16_ = __u16;
+pub type u32_ = __u32;
+pub type u64_ = __u64;
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub struct GspFwWprMeta {
+    pub magic: u64_,
+    pub revision: u64_,
+    pub sysmemAddrOfRadix3Elf: u64_,
+    pub sizeOfRadix3Elf: u64_,
+    pub sysmemAddrOfBootloader: u64_,
+    pub sizeOfBootloader: u64_,
+    pub bootloaderCodeOffset: u64_,
+    pub bootloaderDataOffset: u64_,
+    pub bootloaderManifestOffset: u64_,
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1,
+    pub gspFwRsvdStart: u64_,
+    pub nonWprHeapOffset: u64_,
+    pub nonWprHeapSize: u64_,
+    pub gspFwWprStart: u64_,
+    pub gspFwHeapOffset: u64_,
+    pub gspFwHeapSize: u64_,
+    pub gspFwOffset: u64_,
+    pub bootBinOffset: u64_,
+    pub frtsOffset: u64_,
+    pub frtsSize: u64_,
+    pub gspFwWprEnd: u64_,
+    pub fbSize: u64_,
+    pub vgaWorkspaceOffset: u64_,
+    pub vgaWorkspaceSize: u64_,
+    pub bootCount: u64_,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2,
+    pub gspFwHeapVfPartitionCount: u8_,
+    pub flags: u8_,
+    pub padding: [u8_; 2usize],
+    pub pmuReservedSize: u32_,
+    pub verified: u64_,
+}
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub union GspFwWprMeta__bindgen_ty_1 {
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1__bindgen_ty_1,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_1__bindgen_ty_2,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_1 {
+    pub sysmemAddrOfSignature: u64_,
+    pub sizeOfSignature: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_2 {
+    pub gspFwHeapFreeListWprOffset: u32_,
+    pub unused0: u32_,
+    pub unused1: u64_,
+}
+impl Default for GspFwWprMeta__bindgen_ty_1 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub union GspFwWprMeta__bindgen_ty_2 {
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_2__bindgen_ty_1,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2__bindgen_ty_2,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
+    pub partitionRpcAddr: u64_,
+    pub partitionRpcRequestOffset: u16_,
+    pub partitionRpcReplyOffset: u16_,
+    pub elfCodeOffset: u32_,
+    pub elfDataOffset: u32_,
+    pub elfCodeSize: u32_,
+    pub elfDataSize: u32_,
+    pub lsUcodeVersion: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_2 {
+    pub partitionRpcPadding: [u32_; 4usize],
+    pub sysmemAddrOfCrashReportQueue: u64_,
+    pub sizeOfCrashReportQueue: u32_,
+    pub lsUcodeVersionPadding: [u32_; 1usize],
+}
+impl Default for GspFwWprMeta__bindgen_ty_2 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+impl Default for GspFwWprMeta {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}

-- 
2.51.0

