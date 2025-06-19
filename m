Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59213AE06F1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2487C10EA28;
	Thu, 19 Jun 2025 13:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sn5OJ9+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2048.outbound.protection.outlook.com [40.107.102.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242C110E040;
 Thu, 19 Jun 2025 13:24:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nThEn15c4rY1fAg1zb8yMF94wGXrUneGypwqOoiePMK9JqUr9n/qyN1YMMgV94crUUxL8INANvUEQoNuXcOv9NBYVmCtjQJtaMf6V4M8l6K20Mc8p/37yY5Y2cKYLY5/Bn9jVsEnTE8xiHVWeNDeFJjC6zU2v6ql9Cl4Hoh9MuQ+IvqdjsxPIVlS8jnQc/Sjj7DceJCQ3E6E/zcU1iprp19a5kP9jg0bGBvyjBoM8nGCSvMxukraHzvO7P3o35cr5x4iAL91ZPyleEYLt7Pegx7AAHAhBeCwEAJuVCOqdM4iZxSjacYHXzEm+AS/Et8zYbNvPaiM8yw1JKUbIWvvXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aO3/c2MuXk+EmpEfB9DIeDUnI+q3evo/ImvQ4dB97Gg=;
 b=y6qqfLYWM87QBWOwHx6fjI7bBD+RHGEE+qoyPNzdWGNkPzHmFYohVvHjwB9xQXcaqCTUT/69cYlwJSZWsnm16dl3wbW8Ldqy/woOon9WCvgq2LX2R1s60tuRp97y08xaLRHN9iexmwbZfNO2fpRhyC3KhmDr3AV8x4G3e9DvWRwvnpehm7GDl3kj42Rlk+wkhbFJPm03QRCLOu3qv5bD+0cDvbUrkyljAWORKq0f/4LmwTOsnNaoWtBeNvfqxsxSGD//wIcc4laniO6xc7LisL53ZtU7JQ3uQJn1xjoAXGxifLMbFhWm113FVIY1mwAuT/rNJrnu+f4VRyEDKlm27Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aO3/c2MuXk+EmpEfB9DIeDUnI+q3evo/ImvQ4dB97Gg=;
 b=sn5OJ9+OkvNTyrtgMWvyKqkvsNQ65oy4pkoBYyDfDchLBJ+iBgHCS7D56tm6hh9XMP5+tYvGOYmQCL/6upX3kw85cZtD7oluLcKWZt1si8BYG01ZgR4Mr9YwZ7+RkEEQRaK1z7pLUiQJVkEMu7u1B4NTiQBJhUHz2AN7JcjA0dUv2MsMVgqBCOexSby0byyhlOk+JugCOHEW0/umwdEXaWQF4lDnbi19BtsJTR/UqEzu6sH5/uN2vHSS3vYTYV/iD7dQsRGjI8KqqKaIFS3hUmCaMRLyOTpAOITkOubjBNwVksNJHOwf9isVw3HC8CWbdSV74bC9vJfDe12wWSJikQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8122.namprd12.prod.outlook.com (2603:10b6:510:2b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 13:24:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:24:27 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:23:45 +0900
Subject: [PATCH v6 01/24] rust: dma: fix comment
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-1-ecf41ef99252@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
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
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0234.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f587ca5-82b6-4a6e-73a7-08ddaf349d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTFKVFZweHlqUlNBNGNUd0lwcW1tYWVSUlRmVnlmRktxVEI1YW8ra05ieTg0?=
 =?utf-8?B?VWgxUFJLYXk5ckxUTkpCb2xKUmt5SzhteFpzdHNjaTBSQnhnTUcrL2VGYktn?=
 =?utf-8?B?d1k4eVpPVXhJQWY1dVNrelFNVkhDajNpejVaZzdkMGh5UDlTc0hzNTdlUFBS?=
 =?utf-8?B?Q1M5VEhTMEVSZlNMTkFNREZpNzlmenFzdjlpcGsvaTRNQUQ1Q2tlbDEyNmhP?=
 =?utf-8?B?THZmUTdheG56OWpZbHRWU1l3U25hc0thNXl4STJLQ1c4SXY5YnFaSkMzbnQx?=
 =?utf-8?B?OVkyb0hZbUhZMklwajRRSmM5eDhkby93QzdubWFNWk9IWERENXRQbVQvR3or?=
 =?utf-8?B?NVdWU3ZhdFY0YmFveVlmd0xzV1FyRVk4cEJGbW5iRXBldTV2a2ZBVWhDQjR4?=
 =?utf-8?B?RWJDdVVGZjNnQVJMVXBpNys0c1JZYVNkMGVoUVZBU01mSDN1dWRHTXRJNUFr?=
 =?utf-8?B?WHF2RkFyRjdySGtZMFdIN1VPV0FjN0pneHMxeC9zYkFtLzFTWG9ScTRZUzlr?=
 =?utf-8?B?OHZXMkNOaUx1YnNpdy9rY2FWRGJQUzhvbXREWTNjOXRPOHpoRFRFWGcwMXNP?=
 =?utf-8?B?MGIrU0JHQ2dWdUROeS90dDBnZm1tRkNQLytzMmpCTVJodGNXL0pFR1ZnZFMx?=
 =?utf-8?B?NWFLTVlMU0NISkNhUjhEYXpTYmhxY1Fic0dpOFhJYXA2eVplREhBek14Z1I5?=
 =?utf-8?B?U1dmb1Q0Q29sTk1uU0k3Q0lnclR1YXd6Y3RyNlZydnMxeDhTVVEwMVNjMHZV?=
 =?utf-8?B?cnZoRVlpOUV4RTNtZUF1emlFaUh0aXcreE1LbFA5Qk5vdlVUQzdyUzQ0eGJw?=
 =?utf-8?B?cUZJMjdNVE41TUJ2SkNJdTc0LzVEWVhMV3RyU2JTMnhnUjg3TVRISUJ1cGRZ?=
 =?utf-8?B?ZXVBelpKNGIydGRFU1ZmaUpTcFNOZ25taU1PZXJiZGp5LzNDR3lZd05BRFZx?=
 =?utf-8?B?bHNFTERPWHJZTzdNL05xbU9IaGc5OGJpa1dIdFc0cS9OaTFEZlNsMUdQOHFL?=
 =?utf-8?B?RTRURGZmRnJaVXAxbUxyRWdGeWx3RGx1YXNKZnhVRE5vVzllWXhNN2VtR29S?=
 =?utf-8?B?bWR3NjU4UFdWZ3N1eEFBNFpsN3QzZ3VlN2RmZ3N5dXRKbURaUENuejJzck5I?=
 =?utf-8?B?dzVIYWd0cHVjb1N4SmZsRHI0VS9jY3lBUjZXWm5aZXdyOHArNmVGdmVONVN4?=
 =?utf-8?B?UG5lK2FLaHRwcVg2YUhSdVNiQVBTeHl1U3h3aklpV1JXZERxaCtDTmZQS3hR?=
 =?utf-8?B?L1JjSnh0d1h5L3BpMnNGRmdZcW5hOTU1WWorckJGYmFLY2dMZ2thU3d5ZTkx?=
 =?utf-8?B?ZHdDSFV1Lzk5K21WazZkblhRVzdmdVREblZnZDNlOU05SG1uczFEVzBMaDZ3?=
 =?utf-8?B?NVlOVWgwK0hMQzRTSllXbTMrM0diVHoveEtKdkpkbE9MWDFhbG5sTWxTWFFH?=
 =?utf-8?B?YUtPY0xCS1lQV1ZPL08wLzJTOXRwUjFaaFE5VTExeVh3ZlkyMWNvVGUvdzkz?=
 =?utf-8?B?WUpNc1VsWXhzQVlxYTB5YVVoa2ZzTFhTSndvNWkwWUx1b1VlaXdRTTFKRDNj?=
 =?utf-8?B?NzcxcFdUcm5jMTQ3dE1zb0M5OGFXUUVlMThJZDdydis1OXh0ektZbHFXQlpI?=
 =?utf-8?B?dzJLR2V1VWNORXp6V29LblVFZkpoa2FxcjQ2VTdEU09leU9zOHZsTHFueWZG?=
 =?utf-8?B?RjdvMDNKVGVZTUd3d1MrVW9LNjNVMkNEZGlkVTk5bkZHVnJxRzVTTGFhSmYv?=
 =?utf-8?B?aDlKNFdVdzE3UkFENzB6c21RSzhzQVk2TmVaN3V0bkR3Qm83aDBXNnhqMzY5?=
 =?utf-8?B?TkhUdnZ2cVAxSUowc2pnYVptdDhJSjRGWndlc3hKb2ZiR3ptY0pGbnlmOXY0?=
 =?utf-8?B?cnErbXcvNURZRjF5ZGhDUU5CUTByelcxRXM0ZkhrVEI1dnNRNjZtdHdXbERW?=
 =?utf-8?B?ZUJRUnFDZE1KaXJIRFdrWDc1UTBCb3Y5OWJEZGF4UnZ4SW5Rdjd3UFlRRmZI?=
 =?utf-8?B?cTF6Zm9HSERnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em1TNnhPaGRPL2gzdExJUEJZQmRPRjY3T3hpa3YrSGZOdm1Dd1BDaWZaMmMv?=
 =?utf-8?B?TVpSaERCeE5weVpIOXJxYkFPSEZXQ3hNbndFUXZtMk50d1lMYVBQOEwrb0do?=
 =?utf-8?B?R2JseHBFbEkrZUhIWFFlZHVNTlcwMjlBVGRDTHhocUs2Ylp3U0pMbUlkMnpa?=
 =?utf-8?B?SDNiV2N1MXJZcjFEdi82c3FIbVFxd3lQUkJYbVFoWTBRSStpaFZwSGk3cVhs?=
 =?utf-8?B?bllZalF0YTR6TUdrYVFPcDM1K1VPV09FZVNCOU9NcXlyS21mRFQrU0ZISzdP?=
 =?utf-8?B?b0VNZ0ZrMG9QOEJVSkRnczJyWkVXRU5VdW50QzlJN0JnYkd3UHp5SnFORnVu?=
 =?utf-8?B?Q2s5ZDdMcmp2UnpuVUNjbG11MUZ6SktKT2dSbDNpd0RXMkNPZ1R4QjltR2RP?=
 =?utf-8?B?ejI0dlpOdW1hU2Rmd3pOUk9DNjBNbzNzcFJKdFl1MVEwVEJmT1Z2NEpiQTRQ?=
 =?utf-8?B?enp4NkVOYStOWUhTblBydVczK2lLcjFsYkgwSnhQUTBxdWdyUS8xVThsUm1W?=
 =?utf-8?B?OVdWTDNDeW40SUk1RHF4bFg5NmdCckZXM1FHaURpNDhRK1RadG83bFFFMzVx?=
 =?utf-8?B?M1luYUFMMmEvTG0rSXByZkh6WHRyaXdWOVVVZ083SzJQS09zTmR1WHZxMk4y?=
 =?utf-8?B?UkFURDNEQzlHcCtDR05kZmhrQy9DbnpoY25Mckx1Mjh4OG5JZjcyczBDUDJj?=
 =?utf-8?B?LzFUTnpOc0hBamNUWTNMWCsreWtVZWEyTE9iK05SUDk4dFFWRC95RmczZVNY?=
 =?utf-8?B?YllEaTRhQXpHSnM2em01bE5Rc21YTUZOUGRoMDcrdHNlcTdWSTBZZitjU2Nx?=
 =?utf-8?B?K3diMGJjVm92bldHbU5wL2ZYdkl5VVZKY1NHUjVpYXZQZll3L01wSm9mbzNn?=
 =?utf-8?B?ay9BQjBIU2pBUzRDeGhjNGgwTHBhMXVBK3dKQ3UvZ0tFckU4RmdZSisrbzlH?=
 =?utf-8?B?Vnd2Zk42TVE0czFkUTh2cmV2T3lTbjBBb2ZNY1lEYnFyY0ZwcDdnNEVVaDRX?=
 =?utf-8?B?SzFFTWZsMkVjcFYrajZDMVJrK0ttK3ZYWU9vL2UzL0luWHE5RytGcS9oTmV5?=
 =?utf-8?B?MzA2M2JHYUQweXBNdzNaVGhGUVlqUXhQanNGT2RJYjd0TElKbHZyYjlRWjdh?=
 =?utf-8?B?S2VLNDY0aW9pemNiZ0pCenMrVTJhcXI5dHptZjE0UmdsRHNTaUQ1WGM0cWxn?=
 =?utf-8?B?WmVxeTVSU1M1UldEcGp2RE1Ua2N5c3NBM2FBcTN6enRDeWlJZGx3TWcxaWVN?=
 =?utf-8?B?TGN2ZjRob2tRMk9uZVBIT1NlblpDdFNkc0E5TTJqdXFGR2pPY1llS3JtV01a?=
 =?utf-8?B?cGlWbGNaV3IrOU90VnlFc0l6clZKY2ozOWtBTnFQOHNzYWYyNEVjZVBZN0Vk?=
 =?utf-8?B?UVVyQUtWd21RTnIrSHliaUNTWTlMc29nWlFKcVJsNmFRT05pMWhhZDRuMzly?=
 =?utf-8?B?d2loVkZYazFmZHhpSU9zc21VWnFUcEl5Y2ZWb1VMY0JUdXo4am9rc0VyT0Z3?=
 =?utf-8?B?TXNpVmtuM0lYS2lmekhiNXp4cVNCeDJuVHcyN29YWTBLUTVFam1DRlpHeW1V?=
 =?utf-8?B?N1Eya0xQREtDZXJySm9FSUs4YzFsNFNSSEdMMFBPdDIxYjVzVFdJbzdFTFhR?=
 =?utf-8?B?UlZYcTJ6SGJjK3FOdXl0VWhPRVBsN043VEF6eVNSYm5tc2xGQWd3SjVZbzVW?=
 =?utf-8?B?dE5sWEpwZEk3MWxOZEo4dUUrTFBvQVQ3eFpocHNYdmV5cHpUcnJSc2k3TjQw?=
 =?utf-8?B?ek91SjVpdEZ2aEJYdGY3S2ZKaDRNY2lMNU8rL2Foa2J3Qm5QWEJqSzY4UDZO?=
 =?utf-8?B?eFY3eDdNV1lzalQ4VkFpeC8vQ01tUFJ4NEZyNGx4NEp1UUpDQm9pQWJrUi9B?=
 =?utf-8?B?emhJVjVDbGdSRVNaR1R2cFZtd0VYMzZ0VFllVUMybDNTeDZhZHFFTnRpVkFy?=
 =?utf-8?B?blBqMWhFbFQ0RXYzcnU1ZnkvYnhYd0Q4V2JlUjY4b2trY0pNTGNEbGwySUFZ?=
 =?utf-8?B?bi8rNGR0YzBodlI0aEFlTmphMVQxY252OVpaNThkbkZia2Vha0tKNVVZb0Zr?=
 =?utf-8?B?VUVuUmthcTk4THVuSWZnWVFrbkwvVFZsUVFIdy8vaEYrRTdONDNzR2NOZ3hC?=
 =?utf-8?B?Wjh6L3ZMSjNoeDJOUldaekF5d3pkVHZmUm5QSkJuZXl2ZHRRQWdOZFRaa2Iy?=
 =?utf-8?Q?oG/Kunu4bLFp1OmRMc5G0Hm3jcYds+O8b5/9IeQorDMr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f587ca5-82b6-4a6e-73a7-08ddaf349d50
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:24:27.0601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itxvSxy6UvI0+vuw1o+vXlfFDNE4wAlFH9Ji9O7V7hYI8pMgPm0Xl6Vw1h7WJVljRL/FvtzSIfQLwndoQwg5SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8122
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

A word was apparently missing in this sentence.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/dma.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index a33261c62e0c2d3c2c9e92a4c058faab594e5355..5fb54714a1600d97b30b24f344081f5558d43452 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -212,7 +212,7 @@ pub fn start_ptr_mut(&mut self) -> *mut T {
         self.cpu_addr
     }
 
-    /// Returns a DMA handle which may given to the device as the DMA address base of
+    /// Returns a DMA handle which may be given to the device as the DMA address base of
     /// the region.
     pub fn dma_handle(&self) -> bindings::dma_addr_t {
         self.dma_handle

-- 
2.49.0

