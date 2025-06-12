Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB4AAD68BB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 09:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8396110E049;
	Thu, 12 Jun 2025 07:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="a/oYhjWT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2078.outbound.protection.outlook.com [40.107.212.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C081910E049;
 Thu, 12 Jun 2025 07:19:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdDQ95fL+0uayn/p0qPvKM6KC46BZfNFHLvvfgaWuuCdJwVF8D2IfQX6MkDBT8QP/w55v0E22V2KbTUGKtKg7bIME/Y16uM0xvFEF/IWpTglW3BbUC6E5zPa3Ux7sZSlp63m2y372WaCGrHDrJSe09jydJDFpB12dlbjMRavfaMb5SKJ0irdGieK9oV+9fOKJygwhXX+Q6e95xzRLyCv1tXAhOkOBJ7SGyUySs+Avt9xozNTplGJ5/PCkM2HBrD+Fyy5VbRi1uHHLdCQX9DNVUHssBunelF8TqIJPffa5y4Z+oIpxXBIQ1FAwb2zVKvtOLifw/+/5bbW1bNyiZ8MQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0i7c4swBpXk6v+pDT7ur5OOGAgWDr/CfHOnU6dcwcA=;
 b=EG39MSY1e/9aC9whJ9biYNOQTyIS2iiNNRSczfWPfk8a9MXs1CU2FiD0tJQOOE1kch3FpZdCNKw3xSsT2VqMasSQ+kmnfDWHBzjsfX/JGWhkluqx3BiJk47++ACnuX8g2pYN4qhKG+JgPpo9a/FD8+hSjnaPuLRJOVAzi6846+nBYqWsqI+1P2qGc0VW+POh/v07TWVzW89JehLSARH/Qc4Zw5jl2Y+9drO8tWi259B+EZv51eE3b0Qe9RSS5ZeVsnNXc0UvA/hfxhUqNWEG1dBemVYFO71fyGm0Cx25danWHAf/ODEGrUPB60ToiRzdOUiB3Gu10rTKgSxMoJqGMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0i7c4swBpXk6v+pDT7ur5OOGAgWDr/CfHOnU6dcwcA=;
 b=a/oYhjWTbVpNA/rzw846Ch7zMwkREa0Fn+UbJE4L1wrjbbrn1WE0c1VtkSf5f0OMyZytGl27x1RCw+oRy1364Wv6Q7JDDj6jAqUMcCbl8Z6UbCjq/pDy4dXUq9LCOtIvIJLAYD8InEzj3O1TKrE0toww01rIBqaqLDMMb1cZiQ+EjpfWGsJqN8WENUuwZLFfupWmd7Y6T2rQXOcPdkg9ImxWfjbfmc06/6bngAuniNJWfX0iUs6QBumf6jqnJRciAw1QZwTEcUXur959r/+QtfKAsRPZjJ850IbMjR8oJmMnbEZWOwf5YpT+QMHk7+WuUWInD6gnITej/gghoRhrjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7632.namprd12.prod.outlook.com (2603:10b6:8:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Thu, 12 Jun
 2025 07:19:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 07:19:33 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 16:19:29 +0900
Message-Id: <DAKDETL7I95F.31L41GTLYNBWO@nvidia.com>
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
Subject: Re: [PATCH v4 18/20] gpu: nova-core: add types for patching
 firmware binaries
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-18-05dfd4f39479@nvidia.com>
 <aEAf3GUUz5oxnuk9@cassiopeiae>
In-Reply-To: <aEAf3GUUz5oxnuk9@cassiopeiae>
X-ClientProxiedBy: TYCPR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:405:2::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b509496-1143-4ceb-4353-08dda9817a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnkyeGk1cWJtaThCb1J0aXZiRm82S2llWnhxNEhVdWwyVERTTlhqR2NaaFVU?=
 =?utf-8?B?aVNta2NBTi9KczF5cWUrRmJxMzh2eGkrYjhRb0tHTlhKUFRHcFExNzR6bGlw?=
 =?utf-8?B?bGxtckFlQlI0UmhxcHh6cGp6bmZaSG00MDFRR09LRE5PanNtUEJaT255cGNK?=
 =?utf-8?B?c0pIRW9XY3dyOXVLb2YrQU5Fek9iYlBCamhUaUtIQ1ErMEt6V3FEMHdKcG4w?=
 =?utf-8?B?dE5XOVFvOHFFTHNNbWNPWG5aTXoyNm1OWUYyYTJGcE1mWTFkdU55Qk9YdXR6?=
 =?utf-8?B?NzFINGJPN1ZDMEFkbTNUTm0ra00yd3ByS3kyZzRIL3gxL01iR1c2WVNEa0JE?=
 =?utf-8?B?cWJEZU1oN2c2bTZWWjNIYUdiN0ZwRW95ellkVE85SnpzUTk5Y2ovYU51dWt0?=
 =?utf-8?B?T2d1S0NCS1p0eVNvUDBvd1JPMXVseko5emlIeE1PTFhDWDVvNUtrSHowTWVD?=
 =?utf-8?B?dDl6RG1iM1E0NDJ3SmJiQzdyVXpkL1duR1FHSkVHV0FCTWwzOVl2eTVTWUlE?=
 =?utf-8?B?Z1E0Z3RIY3dGdkJXQTRSUkU0T2dpTFFuclo0Tml5WE55MllSQUZQcm5qYy9M?=
 =?utf-8?B?VXIwd1NTKzBjQ09zRngyT0FWQ2lXR3lBN1Zha20rYlIvdzFGLzI1dGxob3dO?=
 =?utf-8?B?N1N4SEZFSDRaanAyc09RalNaZjBpMlZWZTdxbW4rT05Td0NTdVlkamR6dTRM?=
 =?utf-8?B?OGdsMXFQVHBMMWE5MXg4a1ZzMVV1MHh6YnBEMWJHSzVMUTRkajVmR3FUamxJ?=
 =?utf-8?B?VXpUekdzSzZLN1N6cDRmSUxESGVHMkREeWFETHN3UXdITXZUNGU3VllpVmlJ?=
 =?utf-8?B?VXJEWHlxQ2gvY1cvVFZGdmh0RDNpQmYyTzV4OHNuaWUvMmx4SXZxOUVlV2Ns?=
 =?utf-8?B?bU00YXhBRE5hb2pQUGsrb0dRVm1nWXBpbWtlbXZIREJZNVl5TmpPSkpRTUlj?=
 =?utf-8?B?WSszYnhLZitwQmVvQy9WaFlJcDB6Q2VMK2huRFloZnc1RmZEbzlTdG1hVEVr?=
 =?utf-8?B?TEtaUzFlb1dEVDlSNTU2Ynk3NzZIcFhOU2VtMGovSUFqVG1Ja2hTeWhrZzJh?=
 =?utf-8?B?MTdVQWFNUXByOHpSQVJwZ2pUVjFUNGsvR0NJNWlzU2dmQ2NQNlFBRm5abnhP?=
 =?utf-8?B?NXQxTFZEbm5PK0IwT0VJUEtiTkozTWpUWkFHcEtaMkcwUVpYcjdHaWpXMExY?=
 =?utf-8?B?NjBDOG45VGpROWNIQ1pUY3RjL3FQOS9VTXlOWDBPVlRROWZuVE9YU3FmN2Rp?=
 =?utf-8?B?M1c5Z1ZxeGRwbk1SWkdQWDdZbkZsZzY4Rm9JaC91TjZtYW5hTlk5NW9ncFpz?=
 =?utf-8?B?YzhpdVhhQW1VVFNBVUFmTFZhaS9zMk5Za0RlM2srbDdkSjZhRlY2enFEQW40?=
 =?utf-8?B?clVoWnB0ZERGaUc0YjlrOEJPTXVaM0p6QVJMUCt6a3crVkUrUjU0c3lBdjkv?=
 =?utf-8?B?OGZFZVZ2MS92ek8zYi9VZElqZmV2SVhzWGkrMFlKaTNwcmpGYStYWFVPcm1a?=
 =?utf-8?B?dHJ5YmV1c3dyOWx2VWZYYVVUMXlaRWs0M2NyeU4xY3VzbXJXTElJUlBFV2FR?=
 =?utf-8?B?OXVaY2JJN1RnaWtqNjJ0YTdBbTRabldyQzhMNEZGL05lVXprdUpzZmVMT3d3?=
 =?utf-8?B?MG4yR3F5clNuMUYvamdpZ1dlWkNwRE1Yemk5U0ZQbXBQWUtTMzl6TERCVXZL?=
 =?utf-8?B?RW16eWovVWd0MmgzaFIxNUw2VDAvL1RTTnE2SHFOWVh5R2dlc3BVWFZ0VFZM?=
 =?utf-8?B?cXpWRzN5T21BRVpKU2VKbGhaclVsSE1DVG9WNStKYXhubVhLWTFBa3NkdDlJ?=
 =?utf-8?B?WTJFR0o5ek10MkJPcFJzUU9HK09HcU95TW0vWklkQmJubmxkbGdIR3NmcHh3?=
 =?utf-8?B?dGkrMTgyV3l6TW5RS1pGL1JQVFdzYXUrQnBYaG5LaEdwTmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1h5TnQySUR1WkJFUVJQcjFXRUVPQnhLSjk4K3N1cGFnaEpGT21KY2M4alBu?=
 =?utf-8?B?Y1M1aWkyQk9CeTdQMmJOL2NPT0VaUHNVQUVNOVhCcUVGZ1lGdDJEWEVPUlNT?=
 =?utf-8?B?ZXQwUDNuK1VLVjkxTXNjeEF0RUJIeDBDUjRieTdsam5NejRtNkozc00wK3I3?=
 =?utf-8?B?a29yM0VxdEtFS0p3V0RBSnVEK1ord0tQNkMxREp4ejhGUkZXS2p5RmRyQisr?=
 =?utf-8?B?aEsvRWhLZkZQSjFzMUh4ZDJDSkNCQUZHWU51VVFTNzRmNzBNTGdzTE1waHhM?=
 =?utf-8?B?S3kxeTB2blBqK2R5ZzZ3ZVY0RFFXcCtrSUJGYUlFYUNrM0N4bWtkeXhyeW0r?=
 =?utf-8?B?d1dkZ1dlbTEzamNTY21RcHJ3UlkxZUFUekExTkJtRVBOa1dORE9CTlY1NHF5?=
 =?utf-8?B?KzJ0RDdJUjdVVVpGdmdpZWlxcVlxeTNNS0xOeGh2d3A2U0NxRzhEWU4vUmFD?=
 =?utf-8?B?S0FpenB5dU9qdzlPVUZIdW5RcUdyc1JhZ2NBYXFkVU5UMkFkczl1c3B5UE1T?=
 =?utf-8?B?MVpFV3FUMWNPUWNlTmJVVVM2cXh4M3psemRyWHYya3BMU1FCbUNQRjJVVGJy?=
 =?utf-8?B?TDZhR1hGSVM0RnBGZVNZQ0JSM2pkejR5d3pWOUpwSTJ5ODNqclIvVUJNRE0r?=
 =?utf-8?B?ekRNS2I2cFZoUWhZMDRBbFNoenI3ejBzRnRRNFJiaHNpblVYTXJnaGQ0NFRs?=
 =?utf-8?B?Y00rN25RdFRkMC9CdE1GenkwK2VhWTVhVGh2MUZzSEkzREZTMkI4SExXYXBL?=
 =?utf-8?B?bkJiM1JwWTBuMDRzSXJlaHJqZy9WdjdXQXBmb3pXZ2x2WTZGYndqd3FMaGJu?=
 =?utf-8?B?VSttVmlzWjVRZXRmZWxITGlEWjRCaGVKWHIxcU13TVg3NmMra09aSy9CY3Zs?=
 =?utf-8?B?Q1V4ZDhuMFNRc1FTd1Y5bW1WTEJtVGs2ZmVaSFBOTFJGTmtGWnROQmQvZ01D?=
 =?utf-8?B?ZmtoZWtTd05OdGEvNnl1c002NUJ4YkNnQWJVYU5iOFVlV25uWHpHcVlVcVYw?=
 =?utf-8?B?UUNOQUkwTERIY3ZsWmpzSUtzMk9nelpZY1lRVXZYMFpkTVVNcWNWSjZEc1Nz?=
 =?utf-8?B?Skp4cDgxOFBRU1JEbVRIYU5JZzMvdStBdGJRdTAzR3MzZU1yR2EwbVQzdHU5?=
 =?utf-8?B?N1VDVzFIV1N2amJhWjk5U1V5djE0NER4ZjZuMXZJODlDVStJV0kwNWkwU2d5?=
 =?utf-8?B?NGlNMmpsVDNoK1cyZ2VqcDFObnYweGtJTkZJTHNmaWZaMkdXNVBkcXQ5MFVV?=
 =?utf-8?B?V2d5TitMWHlKMTE1RGVqbFZqdmtWU2J5RE40WVVRR0x2cXVNWGtwRFBkM2Ra?=
 =?utf-8?B?V0lYQUdCTHdWQUM1cXN5bExJM2RPd2lyUzRnTWxId2hNWEpqRms5eGgwNWpp?=
 =?utf-8?B?ZWVBOHc0UjZnd2d0aHpraGhER09vbXNIUWdSUWY1ZHUyeHQ5bmlKdGFBM2wz?=
 =?utf-8?B?aHJieEFvN0xXdTRkRnE3YkUzbDBrYk9lTjIyZFZwMXhzbHpSTU1NWmpFWUpt?=
 =?utf-8?B?VjdUQzd4c29WMVZOZUcrTWFSRHQyVCtLcUJpcnZCTDk0RUw1NTRpaFN3NFBy?=
 =?utf-8?B?dnc1OFpuQXNvQXNIUm1YT3YrZ215RmxKTEVMT2NJYmVKY3g4NGdJSmNwejRr?=
 =?utf-8?B?aVZnd3JJU1Fvak9pMFkwYTJsZ2RhOFRuYWpWWFBYY3lhV2NyOXdKZEtnZitN?=
 =?utf-8?B?WjFscWlvQ3pxQ2JFSEM5Z1gycnVLK2VGdmFScC9VTkxyODRoaHd4WWo1R2Vw?=
 =?utf-8?B?ZkJqSjhCZ3FKbDJyNDRld05YblhDcjBXNnFzRU9qU3kwVHVmbEtWUTFqU1RW?=
 =?utf-8?B?RWdTcGU2WE9qTHFXRFdUNWtIL0owc2QxaUpveHN2cHRvQkFuQUFrQW5QL1VY?=
 =?utf-8?B?VnR5TTQ3c2Q1cTFxemJubnh3Ty9XNVZNdWhHZTlHWE13SHJZdkpKbjRMdDZ2?=
 =?utf-8?B?VVAydTA1bkl6TjVOUUpnN1pGNmRnZzJwSVlRZmhGSjNXM3hFSTlUS0pDM0pW?=
 =?utf-8?B?Q1pYSHBVVDZaYkFnMHFPYnlZek9vR3gzZjhEWXJRaTV0d2VndDBKTEY3cUlR?=
 =?utf-8?B?L0tUalRnQ2dVMVg5djJ5azdGWmRTNC9vN2NBTHdRVFRDMURWRU9wQWhlVVg2?=
 =?utf-8?B?RW4rdVRLQkhudGJWNVR6MEpLeHZFdU13K1FGOUxFMDM5K21jZGR0ZmNIekhy?=
 =?utf-8?Q?/HbWSz3C195S1q11CYORWR2DzLxu/w02p/fWdPTA+jHi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b509496-1143-4ceb-4353-08dda9817a64
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 07:19:33.3473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95m0OQO2QmnknDlp1onwrTWhz3J2Tp9fjVSLnD6rGMLAmzMT/cG0PzA7NBDjBXc9IJjeuSW4wbVIqkK72N/cVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7632
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

On Wed Jun 4, 2025 at 7:28 PM JST, Danilo Krummrich wrote:
> On Wed, May 21, 2025 at 03:45:13PM +0900, Alexandre Courbot wrote:
>> +/// A [`DmaObject`] containing a specific microcode ready to be loaded =
into a falcon.
>> +///
>> +/// This is module-local and meant for sub-modules to use internally.
>> +struct FirmwareDmaObject<F: FalconFirmware>(DmaObject, PhantomData<F>);
>> +
>> +/// Trait for signatures to be patched directly into a given firmware.
>> +///
>> +/// This is module-local and meant for sub-modules to use internally.
>> +trait FirmwareSignature<F: FalconFirmware>: AsRef<[u8]> {}
>> +
>> +#[expect(unused)]
>> +impl<F: FalconFirmware> FirmwareDmaObject<F> {
>> +    /// Creates a new `UcodeDmaObject` containing `data`.
>> +    fn new(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<=
Self> {
>> +        DmaObject::from_data(dev, data).map(|dmaobj| Self(dmaobj, Phant=
omData))
>> +    }
>> +
>> +    /// Patches the firmware at offset `sig_base_img` with `signature`.
>> +    fn patch_signature<S: FirmwareSignature<F>>(
>> +        &mut self,
>> +        signature: &S,
>> +        sig_base_img: usize,
>> +    ) -> Result<()> {
>> +        let signature_bytes =3D signature.as_ref();
>> +        if sig_base_img + signature_bytes.len() > self.0.size() {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // SAFETY: we are the only user of this object, so there cannot=
 be any race.
>> +        let dst =3D unsafe { self.0.start_ptr_mut().add(sig_base_img) }=
;
>> +
>> +        // SAFETY: `signature` and `dst` are valid, properly aligned, a=
nd do not overlap.
>> +        unsafe {
>> +            core::ptr::copy_nonoverlapping(signature_bytes.as_ptr(), ds=
t, signature_bytes.len())
>> +        };
>> +
>> +        Ok(())
>> +    }
>> +}
>
> If we can't patch them when the object is created, i.e. in
> FirmwareDmaObject::new(), I think we should take self by value in
> FirmwareDmaObject::patch_signature() and return a SignedFirmwareDmaObject=
 (which
> can just be a transparent wrapper) instead in order to let the type syste=
m prove
> that we did not forget to call patch_signature().

This one is a bit tricky. Signature patching is actually optional,
depending on whether there are signatures present at all (it might not
be the case on development setups). So involving the type system here
would require storing the result in an enum, and then match that enum
later in order to do the same thing in both cases - load the binary
as-is.

So I guess I would rather leave this one as it currently is, unless
there is a better way I haven't thought about?
