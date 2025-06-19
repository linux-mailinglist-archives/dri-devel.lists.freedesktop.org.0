Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CC3AE0718
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4400F10EA4E;
	Thu, 19 Jun 2025 13:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N9P9rGNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB0010EA50;
 Thu, 19 Jun 2025 13:25:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+8LFnwe/GkYQrVY7PjKgfAAFXH121TuekJDi0XyfymN6sUIhDiH81k5lMXN8xEIFXa37TRss/FbNAF8OHxuF5PjsIr+63siu5VLD0EUXXYeAfSpqEUNoBHaawCCSR+3gESJMGXNdmhmbyXPRQ/aL65LJf5Tm2nz0NdkoW22kCPdYqnilT72BQEk1Dorru3QBFZEW0DSUIh7TL2wBeQTYdqpToKgwujb8pDFLlbARRCC4WbdjBqSFaJISh6pq4BmTsG1GoPN40brgYgHN+O9dSDypDjdhihxBimTSkeLsyur+TNFHqzey0wyj5KjIhUz1RV2xat1GAqXEEyalUJdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtbIo8HRnGfKIPHWX8bUs0Smsv9wHob/4rY28xV0QbY=;
 b=nu8lbwYk5ARoT0TdpgS5Fj1NXMpX0gCtRtMhBCe1viSgwfhO2ahcJpzCS1KlMySiI08zjzMNPnurvQoGag4nZdWTGaCCUYsh67ijZTXNAtc6877i35hP4j2vvCGaAmfwI2um9V16H888ZMJTiySdDh0g5pu26li7DfYOFL3fxloqYGo6ukWyra3K62wyYQnvk7VIJ75/AjJ+ADq2XdainNm7xx+YkAi0JyKT+1aAtCF1uIrj9R/HPDxmYzVYDIfYCGzp6yknT2vSQe0FuS9Tqf5Fpts0GWXVt4YUU62Iu0fXlj4m9Mw5KemOVTflV300O7wRKbe2HLHUUWdPIMs48Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtbIo8HRnGfKIPHWX8bUs0Smsv9wHob/4rY28xV0QbY=;
 b=N9P9rGNif6cXNPhFkv5vrMc+qdaXNeu0E03Li1niijzcfZwvgg93VNqK6c4XddGuAw6CVFB+kk3tunPEGmgVtWs7hR5Gt0rnltaja5hX1nw1gq/rMKz+hdRvY+NJRTUo2b/jKFDz3/P00xx3TfcwQg7WASUMzVlTPxB27hCk3f3J0DVQtN6vonijUsAo7LuhKVOla5JXpDn5a/ZpbyzvJT54+YbucJHHTma4wKcC115LQjS/epGzjTaKSGs+bp1iHSf+86XCfL6oGLdjcKbA4KLQhoe+ZDUsFuGjXa04wsx1cKGYmmHYrnSwOZHAG0W/FsClaFSOwSXCWNAjErEt7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 19 Jun
 2025 13:25:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:25:25 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:24:01 +0900
Subject: [PATCH v6 17/24] gpu: nova-core: vbios: Add base support for VBIOS
 construction and iteration
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-17-ecf41ef99252@nvidia.com>
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
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Shirish Baskaran <sbaskaran@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0292.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e1aee85-6bcc-4ace-0985-08ddaf34c015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTZhZVN0cU1nSndlZEpCRDhDUHBYNUVoM0JFb0JsUkdueTB5WGh4a3RBYW9w?=
 =?utf-8?B?KzNVOWxpRWJvQ1JTVXNPb2RTVVpCb3hNc3p6RVppWEIrZE9obkEwMTM2UzZR?=
 =?utf-8?B?RVZhbEFhdVZVeWpyOGdnb2l3dnV4cDZVVk5YejhwcUdFdkFVb0creW5lSWt5?=
 =?utf-8?B?YVlZZXBCanlyRWxVL1M1ZWlrOUg1cEhKUlg0WWI3VXpvMFIySnhRMGRWNmVM?=
 =?utf-8?B?Qkg1UFhDQnV5b2VqSXFGeUF6SlN0V3ltOW1JejAzZi9LY3lIeC9PeUhIZXJJ?=
 =?utf-8?B?TTFuNEVrZ0lRQ2E2OUtpRThidUx5a2h0WnpHRnlNeTlnMEtsNlhvZGZpL2Fw?=
 =?utf-8?B?a2oreThlMHNHT044dWRRU2xpeXdQb2hHQUU1bWVPeGRzRUhyQldZOXZVbE9n?=
 =?utf-8?B?MmQzZGVlT0FlUWNPRDBrYkU1NTl5ZmtBaG84UXRrelcwSDFlbDFhbGF0Y0d6?=
 =?utf-8?B?Y2EzQ0lobWZDdWpYRW5ya3kvLzg2bmgxZFBoZW93YjhBRytNVm04d2NYMkRR?=
 =?utf-8?B?RkJmTFlnaldKYjJlMytIZlpXYXBodVR5d3VxWUM2cHBscisyWUxYODZWVEZD?=
 =?utf-8?B?eTNHMmtoaTBuTURRRlBqdUhoZU41RDF2QWZ5cGo4U0xzbURFdm5wSTdqVUNM?=
 =?utf-8?B?c3VnczJLTEdLa1lHTElsUWFWZ2FMWXpjR2dpUXFsVUM2cXBMU1dPSTRaU1R2?=
 =?utf-8?B?SE5lbFJDMS9XNHVLOWFUVlFyNSt3aURTTVlZM2NTMXhOU0pHejhWUlhxL215?=
 =?utf-8?B?TVQvd2RRYUhERTZTbURpLzFFbUt6dmlQUjkzUytBd1I4QnJxazM2dG1CN3Yx?=
 =?utf-8?B?ZnJYdUZQUlN5d1NiaFJ3MFltV3dOZ2JuMTUvQnMrSE1DaTQ2YXZIcE1nZFVU?=
 =?utf-8?B?ZHA2S0NOSmFsdU9NRHJLczdXMU5vZnZvYUpmVGVsU2ZHZTkvdXFGQVlRbnV4?=
 =?utf-8?B?VVQ2L0VHWHNzbTZXNzdjNnNPM2xlZzRnVzNXTitoNTVjVjJDdkxNMWxiRlJ5?=
 =?utf-8?B?S0tHeXgzTTJ5T3U2NGtNWGM3WnFNYUN3WGhhdCtaaUZudTRCVzZ0dDI5UWxZ?=
 =?utf-8?B?b3VJMWtjUWlHMitCODR6TmMrZWtrYi9RVUFaUWtyY1NYbTRBYmlkMDFlK0ZW?=
 =?utf-8?B?R0tKbVRnWGRFbW1SM2FhbWM5Zkw3Sm13eDRQNGtHY3Ara09FZGJSelI4dmNG?=
 =?utf-8?B?K0o3WWxhN1I5ZWpjYTQ2b0IvL1lpbTlzYVZwREgzdW9lbTA1Y0FOZzhXMUJ5?=
 =?utf-8?B?SHJBSWtueHNLa1NsOW9tak9HUnNMZjdvWXVKODltMCt6SG9vUmJvaXNGMUNK?=
 =?utf-8?B?WElCTUtFTS93YlZ2ZjNKYzAwWlZVNFFVM3VuYjl6ek44NVFJSDQ1YzBxNEZw?=
 =?utf-8?B?TzNpVTZNT3Bob1FNQlozYlRURFFtMVdnWEhGcHdUaWhUTFRnN2RxeGVRT2ZX?=
 =?utf-8?B?QlJTeXRlYWxaNE91ZDg4amJvcUNPaUl4MFFUUmtGd2hBYkpmclZaWDVaZUxz?=
 =?utf-8?B?N2NMK3E0aWJ2TWNIQnd6ajJOUGUwSEowOC92MHZlN2JWR1hlbXlkTEJIdGNS?=
 =?utf-8?B?N0VsVHMrZnhXQUdPZ1U1UWZqcmdNODNCWWRnVzBwQk9QLytYMjJjL0licDRk?=
 =?utf-8?B?NkFIUzhCUkl2VEtxNFVzby9vZnMrMmZsZXM3OVdjWjdGY2VBZ0d1OEdJRDJh?=
 =?utf-8?B?VDI5SlY5YlhRRjlqVWJ0ZmNXb0xOZUl5SDlQbUlkM25DbnJRNUh0L0Q1NTA3?=
 =?utf-8?B?OC9HazdCZS9rQ1c4L2M0MG1zRktreThpbVcwYmRqUjVna3VGdnZwNmlpU1Y0?=
 =?utf-8?B?WlB1azdmRUdwZUZVQmJBaFlpd3cvZEpTSFF3L2txWnh5cHRmenZOZlhHWWE5?=
 =?utf-8?B?VEk1RFFPS3B4R1lGSWFmeWxVYzBJclo4WURZb092UVBKL0JPelJ3NFlWbzBM?=
 =?utf-8?B?UVZ0SkNNa1ZhNm1ZV1BIMWdKMHJOdEh5aEUvN3VDVmQva1dheUF4eExmbjEx?=
 =?utf-8?B?U016cDBVUDRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3hqaVZBSzJ3TVQxaGVCKzhvYkRLQVFSK2pkZWRzNmNQazlVTXJlU0dHcHRm?=
 =?utf-8?B?T3NvbzkvTUVnengzdjllUXR4MXdGK2dhV3BKSVNXUno5bVpMUmNZNWtsZjhs?=
 =?utf-8?B?UU5YbDZVdG1SWXlzN212NDFRNk12Q3JaejZKZWtmelpWckg3cG10RHVrdFlH?=
 =?utf-8?B?UFp2dG9XbS9vMTBGY0NvT2hVYWJlK2dXWjVicys0N3VZc3EraWZLZ2JRL2JU?=
 =?utf-8?B?NWJxRVBNV2hiK0QvL09tUTlaWHdQNkl5U05vaThFSnlOa3ZqQWZCZk9peUFa?=
 =?utf-8?B?UzVXNHFONFlFV2ttblovdzQyWTI0RDRxVnV0dTVrdVpDS1FkU3hneTBJSHJw?=
 =?utf-8?B?NytQOERuLzJCdFdOOWRCNGt6SmxJN1dqK2VhdkFmWTF4L3Q0Wm9wWkZDbUR1?=
 =?utf-8?B?TXBualplcnNTcUdrMVdRRnFlZVZzbndZN21RcjBYVCtadUJPcFpMRWkzdW1t?=
 =?utf-8?B?RGdWd0VGYUhGTTZCM3JFZEhnejFiSklKdkZGYWxEOGtlTnJGMjNkd3ZxQlMz?=
 =?utf-8?B?S0xud2liUjhyQ3ppYklYY3g4UDZKNGphZTZMcTBlaG1WWU93SUxYN2poNC9U?=
 =?utf-8?B?dmRrcEk2Ujg0K3ZyS2svZ0hkR0Q2OUw3OG05TnVkTWN2NmZpWnZlMUZrMWYz?=
 =?utf-8?B?NkpJelkxUUlWUjNjYlhJMVJiTlBweHJHcURQMGNvd0JlenFTQ29oRVFsYkVC?=
 =?utf-8?B?S2xiTnhnbkNjeHZzaEJwTEFMZ251L3krU3FTdm1NVWdDcnZpN0lBWC9QQ2FZ?=
 =?utf-8?B?cER3TWd5RUdMRUZtVU1zeEVaZTFib2dKc1NINDlqMlE2VE9mQ01vbU5oMlNG?=
 =?utf-8?B?L0x3VUZ5T3ZYZ0U3NWt4NlE3SWZBNmRCeFFPcWZ0eEY4a25tY0tJa1J4aEZ2?=
 =?utf-8?B?WDIxQ0ZNWUorVHZPRE1yR1hkV2FKRUh5REprZElFMGRzVHVFQXdFbVZ4RGx1?=
 =?utf-8?B?VmFoRGV2eVRMZTY2aUNzemh6bnNRKy9hd0dRdy9PRkdCUWhnWDVNNWVrWjRV?=
 =?utf-8?B?ZEhWMjE4VEo5bnpFeldZZ3dEZWR0Rk8xbHY3TGRyczVWOHlvbWRmL09PeHlh?=
 =?utf-8?B?djliOGxFZ3gzRWRtOUpmS0NsZ2RHSUd4eDJwWFp5d2JQNUlxdy9EaGhsYWdK?=
 =?utf-8?B?ZGZoYWNPaitJdDVLTWJTeHEyQXV6a0VWaWowRlQwVmVEblhNS3Q3VVlIeFlN?=
 =?utf-8?B?YkQ0b1BQdExnSVFUZlhUMXlORHJrZDFVeGRZWVF5VWZvemtsbmZoVmVLb0Fr?=
 =?utf-8?B?dXVLUVpVWFBFZjRycWJYV04waDhsRThodVNpK1lBcWMyNnRCQTMzUDh6L0dv?=
 =?utf-8?B?ZzdUWmpxa3BQN3FxN0JsWFo4S1VXeWtpNU1VMVFZWmlzZ25vdXB6eUxNL0ph?=
 =?utf-8?B?Q09uRVZ4WEs1TGc1OUZ0WjYvSWNhK0VxQnI4VjE5OGZzWkRqdzB0TWJPRFpu?=
 =?utf-8?B?MlVBelpQeVpsVzAvWnk5Qlg1dUUrdTFlTnhXbVNnOXhEOGd2ckdadFRWalNa?=
 =?utf-8?B?K2VwNml5RGdaczZRS3FIMkJ0RTNMWUQrL0xPQ3hZdnpzNUgxTUJWWDZUUjBk?=
 =?utf-8?B?aStXV0Q5NncvTjc1Z2plMWg1MFNJVGxSN1hlWDhLWktvQjY4eEVic1pHRExz?=
 =?utf-8?B?UEduY1ZQeStQazBBQ0srZFFqM3JTTlFSaExBT1A2S1RZaXFmbWVhY3orVnE0?=
 =?utf-8?B?b29PQ0xLQVFmTUZqWmMyaW83RFNINkdnK0ZWbWNUMHVSNnFLZzVxeStITlBy?=
 =?utf-8?B?OHo2NU5IaHZJcDVqalNlUmwwN0pFRFdXcmV2NU5lcmN1NnVKcDNHZGc3SWUv?=
 =?utf-8?B?OGhjZFFnUllkbEVNTnNoSmtxbGxOWEwrYzQrUTZHSnR6NXZMODlZUFJMQkd3?=
 =?utf-8?B?ZENoYkFIbm83K1V6dkN5UTUvTE5GL2lVeWVxYnBSKzVWRVBMc1hrdWRiUEhE?=
 =?utf-8?B?UE1zdnlMbUdzU2xXMjFwVmRPOUZWdFBEbEFVbU96QWhiL3UyallrS2UzeGRM?=
 =?utf-8?B?TFJHc3lScjNsLzFWUjY2Qi9EZUU0SnhCVDFWdEJlanBsc0E4VEhwazJQMkJU?=
 =?utf-8?B?NEVEdVhIVEdVODdpeHplMlgzdUFrZmJING9WbnFEdWlwV2tLTFpGYUUwbEpV?=
 =?utf-8?B?Slc0SDRwcGhDVTYzN3N4SFN5bjh6NThodVVRbW9VRmE4TXJXZzBDblRxTHVE?=
 =?utf-8?Q?uQ5j+RII7HA+xVBrIcaB+0Ul6aAHIAva93R1WKc3/x5S?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1aee85-6bcc-4ace-0985-08ddaf34c015
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:25:25.5087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CcIoQW4TJec5QcwFfDqIaOHaefYvcIkX+MJ2XX9+tFeIPVaQdWdeSfrY3saPco0iwi3i1QFSInpuEFRhzrTcQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Add support for navigating the VBIOS images required for extracting
ucode data for GSP to boot. Later patches will build on this.

Debug log messages will show the BIOS images:

[102141.013287] NovaCore: Found BIOS image at offset 0x0, size: 0xfe00, type: PciAt
[102141.080692] NovaCore: Found BIOS image at offset 0xfe00, size: 0x14800, type: Efi
[102141.098443] NovaCore: Found BIOS image at offset 0x24600, size: 0x5600, type: FwSec
[102141.415095] NovaCore: Found BIOS image at offset 0x29c00, size: 0x60800, type: FwSec

[applied feedback from Alex Courbot and Timur Tabi]
[applied changes related to code reorg, prints etc from Danilo Krummrich]
[acourbot@nvidia.com: fix clippy warnings, read_more() function]

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Shirish Baskaran <sbaskaran@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: Ben Skeggs <bskeggs@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs  |   4 +-
 drivers/gpu/nova-core/gpu.rs       |   4 +
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/vbios.rs     | 681 +++++++++++++++++++++++++++++++++++++
 4 files changed, 688 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 2f4f5c7c7902a386a44bc9cf5eb6d46375fe0e5a..41f43a729ad3bf2c4acb6108f41e0905a6fac0df 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -44,6 +44,7 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<F
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone)]
+#[allow(dead_code)] // Temporary, will be removed in later patch.
 pub(crate) struct FalconUCodeDescV3 {
     /// Header defined by `NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*` in OpenRM.
     hdr: u32,
@@ -74,10 +75,9 @@ pub(crate) struct FalconUCodeDescV3 {
     _reserved: u16,
 }
 
-// To be removed once that code is used.
-#[expect(dead_code)]
 impl FalconUCodeDescV3 {
     /// Returns the size in bytes of the header.
+    #[expect(dead_code)] // Temporary, will be removed in later patch.
     pub(crate) fn size(&self) -> usize {
         const HDR_SIZE_SHIFT: u32 = 16;
         const HDR_SIZE_MASK: u32 = 0xffff0000;
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index c9f7f604a5de6ea4eb85f061cae826302c1902c3..1c577d3eff8b32bbc45d7d2302c3e2246bef3b44 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -9,6 +9,7 @@
 use crate::gfw;
 use crate::regs;
 use crate::util;
+use crate::vbios::Vbios;
 use core::fmt;
 
 macro_rules! define_chipset {
@@ -218,6 +219,9 @@ pub(crate) fn new(
 
         let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
 
+        // Will be used in a later patch when fwsec firmware is needed.
+        let _bios = Vbios::new(pdev, bar)?;
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 808997bbe36d2fa1dc8b8940c1f9373d9bdbfb69..de14f2e926361a4f954b1a8d0b95b0e985e54eec 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -11,6 +11,7 @@
 mod gpu;
 mod regs;
 mod util;
+mod vbios;
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
new file mode 100644
index 0000000000000000000000000000000000000000..b9879590ae3aae6517683a6ed02f7f639055598e
--- /dev/null
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -0,0 +1,681 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! VBIOS extraction and parsing.
+
+// To be removed when all code is used.
+#![expect(dead_code)]
+
+use crate::driver::Bar0;
+use core::convert::TryFrom;
+use kernel::error::Result;
+use kernel::pci;
+use kernel::prelude::*;
+
+/// The offset of the VBIOS ROM in the BAR0 space.
+const ROM_OFFSET: usize = 0x300000;
+/// The maximum length of the VBIOS ROM to scan into.
+const BIOS_MAX_SCAN_LEN: usize = 0x100000;
+/// The size to read ahead when parsing initial BIOS image headers.
+const BIOS_READ_AHEAD_SIZE: usize = 1024;
+/// The bit in the last image indicator byte for the PCI Data Structure that
+/// indicates the last image. Bit 0-6 are reserved, bit 7 is last image bit.
+const LAST_IMAGE_BIT_MASK: u8 = 0x80;
+
+// PMU lookup table entry types. Used to locate PMU table entries
+// in the Fwsec image, corresponding to falcon ucodes.
+#[expect(dead_code)]
+const FALCON_UCODE_ENTRY_APPID_FIRMWARE_SEC_LIC: u8 = 0x05;
+#[expect(dead_code)]
+const FALCON_UCODE_ENTRY_APPID_FWSEC_DBG: u8 = 0x45;
+const FALCON_UCODE_ENTRY_APPID_FWSEC_PROD: u8 = 0x85;
+
+/// Vbios Reader for constructing the VBIOS data
+struct VbiosIterator<'a> {
+    pdev: &'a pci::Device,
+    bar0: &'a Bar0,
+    // VBIOS data vector: As BIOS images are scanned, they are added to this vector
+    // for reference or copying into other data structures. It is the entire
+    // scanned contents of the VBIOS which progressively extends. It is used
+    // so that we do not re-read any contents that are already read as we use
+    // the cumulative length read so far, and re-read any gaps as we extend
+    // the length.
+    data: KVec<u8>,
+    current_offset: usize, // Current offset for iterator
+    last_found: bool,      // Whether the last image has been found
+}
+
+impl<'a> VbiosIterator<'a> {
+    fn new(pdev: &'a pci::Device, bar0: &'a Bar0) -> Result<Self> {
+        Ok(Self {
+            pdev,
+            bar0,
+            data: KVec::new(),
+            current_offset: 0,
+            last_found: false,
+        })
+    }
+
+    /// Read bytes from the ROM at the current end of the data vector
+    fn read_more(&mut self, len: usize) -> Result {
+        let current_len = self.data.len();
+        let start = ROM_OFFSET + current_len;
+
+        // Ensure length is a multiple of 4 for 32-bit reads
+        if len % core::mem::size_of::<u32>() != 0 {
+            dev_err!(
+                self.pdev.as_ref(),
+                "VBIOS read length {} is not a multiple of 4\n",
+                len
+            );
+            return Err(EINVAL);
+        }
+
+        self.data.reserve(len, GFP_KERNEL)?;
+        // Read ROM data bytes and push directly to vector
+        for addr in (start..start + len).step_by(core::mem::size_of::<u32>()) {
+            // Read 32-bit word from the VBIOS ROM
+            let word = self.bar0.try_read32(addr)?;
+
+            // Convert the u32 to a 4 byte array and push each byte
+            word.to_ne_bytes()
+                .iter()
+                .try_for_each(|&b| self.data.push(b, GFP_KERNEL))?;
+        }
+
+        Ok(())
+    }
+
+    /// Read bytes at a specific offset, filling any gap
+    fn read_more_at_offset(&mut self, offset: usize, len: usize) -> Result {
+        if offset > BIOS_MAX_SCAN_LEN {
+            dev_err!(self.pdev.as_ref(), "Error: exceeded BIOS scan limit.\n");
+            return Err(EINVAL);
+        }
+
+        // If offset is beyond current data size, fill the gap first
+        let current_len = self.data.len();
+        let gap_bytes = offset.saturating_sub(current_len);
+
+        // Now read the requested bytes at the offset
+        self.read_more(gap_bytes + len)
+    }
+
+    /// Read a BIOS image at a specific offset and create a BiosImage from it.
+    /// self.data is extended as needed and a new BiosImage is returned.
+    /// @context is a string describing the operation for error reporting
+    fn read_bios_image_at_offset(
+        &mut self,
+        offset: usize,
+        len: usize,
+        context: &str,
+    ) -> Result<BiosImage> {
+        let data_len = self.data.len();
+        if offset + len > data_len {
+            self.read_more_at_offset(offset, len).inspect_err(|e| {
+                dev_err!(
+                    self.pdev.as_ref(),
+                    "Failed to read more at offset {:#x}: {:?}\n",
+                    offset,
+                    e
+                )
+            })?;
+        }
+
+        BiosImage::new(self.pdev, &self.data[offset..offset + len]).inspect_err(|err| {
+            dev_err!(
+                self.pdev.as_ref(),
+                "Failed to {} at offset {:#x}: {:?}\n",
+                context,
+                offset,
+                err
+            )
+        })
+    }
+}
+
+impl<'a> Iterator for VbiosIterator<'a> {
+    type Item = Result<BiosImage>;
+
+    /// Iterate over all VBIOS images until the last image is detected or offset
+    /// exceeds scan limit.
+    fn next(&mut self) -> Option<Self::Item> {
+        if self.last_found {
+            return None;
+        }
+
+        if self.current_offset > BIOS_MAX_SCAN_LEN {
+            dev_err!(
+                self.pdev.as_ref(),
+                "Error: exceeded BIOS scan limit, stopping scan\n"
+            );
+            return None;
+        }
+
+        // Parse image headers first to get image size
+        let image_size = match self.read_bios_image_at_offset(
+            self.current_offset,
+            BIOS_READ_AHEAD_SIZE,
+            "parse initial BIOS image headers",
+        ) {
+            Ok(image) => image.image_size_bytes(),
+            Err(e) => return Some(Err(e)),
+        };
+
+        // Now create a new BiosImage with the full image data
+        let full_image = match self.read_bios_image_at_offset(
+            self.current_offset,
+            image_size,
+            "parse full BIOS image",
+        ) {
+            Ok(image) => image,
+            Err(e) => return Some(Err(e)),
+        };
+
+        self.last_found = full_image.is_last();
+
+        // Advance to next image (aligned to 512 bytes)
+        self.current_offset += image_size;
+        // TODO: replace with `align_up` once it lands.
+        self.current_offset = self.current_offset.next_multiple_of(512);
+
+        Some(Ok(full_image))
+    }
+}
+
+pub(crate) struct Vbios {
+    fwsec_image: FwSecBiosImage,
+}
+
+impl Vbios {
+    /// Probe for VBIOS extraction
+    /// Once the VBIOS object is built, bar0 is not read for vbios purposes anymore.
+    pub(crate) fn new(pdev: &pci::Device, bar0: &Bar0) -> Result<Vbios> {
+        // Images to extract from iteration
+        let mut pci_at_image: Option<PciAtBiosImage> = None;
+        let mut first_fwsec_image: Option<FwSecBiosImage> = None;
+        let mut second_fwsec_image: Option<FwSecBiosImage> = None;
+
+        // Parse all VBIOS images in the ROM
+        for image_result in VbiosIterator::new(pdev, bar0)? {
+            let full_image = image_result?;
+
+            dev_dbg!(
+                pdev.as_ref(),
+                "Found BIOS image: size: {:#x}, type: {}, last: {}\n",
+                full_image.image_size_bytes(),
+                full_image.image_type_str(),
+                full_image.is_last()
+            );
+
+            // Get references to images we will need after the loop, in order to
+            // setup the falcon data offset.
+            match full_image {
+                BiosImage::PciAt(image) => {
+                    pci_at_image = Some(image);
+                }
+                BiosImage::FwSec(image) => {
+                    if first_fwsec_image.is_none() {
+                        first_fwsec_image = Some(image);
+                    } else {
+                        second_fwsec_image = Some(image);
+                    }
+                }
+                // For now we don't need to handle these
+                BiosImage::Efi(_image) => {}
+                BiosImage::Nbsi(_image) => {}
+            }
+        }
+
+        // Using all the images, setup the falcon data pointer in Fwsec.
+        // These are temporarily unused images and will be used in later patches.
+        if let (Some(second), Some(_first), Some(_pci_at)) =
+            (second_fwsec_image, first_fwsec_image, pci_at_image)
+        {
+            Ok(Vbios {
+                fwsec_image: second,
+            })
+        } else {
+            dev_err!(
+                pdev.as_ref(),
+                "Missing required images for falcon data setup, skipping\n"
+            );
+            Err(EINVAL)
+        }
+    }
+}
+
+/// PCI Data Structure as defined in PCI Firmware Specification
+#[derive(Debug, Clone)]
+#[repr(C)]
+struct PcirStruct {
+    /// PCI Data Structure signature ("PCIR" or "NPDS")
+    signature: [u8; 4],
+    /// PCI Vendor ID (e.g., 0x10DE for NVIDIA)
+    vendor_id: u16,
+    /// PCI Device ID
+    device_id: u16,
+    /// Device List Pointer
+    device_list_ptr: u16,
+    /// PCI Data Structure Length
+    pci_data_struct_len: u16,
+    /// PCI Data Structure Revision
+    pci_data_struct_rev: u8,
+    /// Class code (3 bytes, 0x03 for display controller)
+    class_code: [u8; 3],
+    /// Size of this image in 512-byte blocks
+    image_len: u16,
+    /// Revision Level of the Vendor's ROM
+    vendor_rom_rev: u16,
+    /// ROM image type (0x00 = PC-AT compatible, 0x03 = EFI, 0x70 = NBSI)
+    code_type: u8,
+    /// Last image indicator (0x00 = Not last image, 0x80 = Last image)
+    last_image: u8,
+    /// Maximum Run-time Image Length (units of 512 bytes)
+    max_runtime_image_len: u16,
+}
+
+impl PcirStruct {
+    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+        if data.len() < core::mem::size_of::<PcirStruct>() {
+            dev_err!(pdev.as_ref(), "Not enough data for PcirStruct\n");
+            return Err(EINVAL);
+        }
+
+        let mut signature = [0u8; 4];
+        signature.copy_from_slice(&data[0..4]);
+
+        // Signature should be "PCIR" (0x52494350) or "NPDS" (0x5344504e)
+        if &signature != b"PCIR" && &signature != b"NPDS" {
+            dev_err!(
+                pdev.as_ref(),
+                "Invalid signature for PcirStruct: {:?}\n",
+                signature
+            );
+            return Err(EINVAL);
+        }
+
+        let mut class_code = [0u8; 3];
+        class_code.copy_from_slice(&data[13..16]);
+
+        let image_len = u16::from_le_bytes([data[16], data[17]]);
+        if image_len == 0 {
+            dev_err!(pdev.as_ref(), "Invalid image length: 0\n");
+            return Err(EINVAL);
+        }
+
+        Ok(PcirStruct {
+            signature,
+            vendor_id: u16::from_le_bytes([data[4], data[5]]),
+            device_id: u16::from_le_bytes([data[6], data[7]]),
+            device_list_ptr: u16::from_le_bytes([data[8], data[9]]),
+            pci_data_struct_len: u16::from_le_bytes([data[10], data[11]]),
+            pci_data_struct_rev: data[12],
+            class_code,
+            image_len,
+            vendor_rom_rev: u16::from_le_bytes([data[18], data[19]]),
+            code_type: data[20],
+            last_image: data[21],
+            max_runtime_image_len: u16::from_le_bytes([data[22], data[23]]),
+        })
+    }
+
+    /// Check if this is the last image in the ROM
+    fn is_last(&self) -> bool {
+        self.last_image & LAST_IMAGE_BIT_MASK != 0
+    }
+
+    /// Calculate image size in bytes from 512-byte blocks
+    fn image_size_bytes(&self) -> usize {
+        self.image_len as usize * 512
+    }
+}
+
+/// PCI ROM Expansion Header as defined in PCI Firmware Specification.
+/// This is header is at the beginning of every image in the set of
+/// images in the ROM. It contains a pointer to the PCI Data Structure
+/// which describes the image.
+/// For "NBSI" images (NoteBook System Information), the ROM
+/// header deviates from the standard and contains an offset to the
+/// NBSI image however we do not yet parse that in this module and keep
+/// it for future reference.
+#[derive(Debug, Clone, Copy)]
+#[expect(dead_code)]
+struct PciRomHeader {
+    /// 00h: Signature (0xAA55)
+    signature: u16,
+    /// 02h: Reserved bytes for processor architecture unique data (20 bytes)
+    reserved: [u8; 20],
+    /// 16h: NBSI Data Offset (NBSI-specific, offset from header to NBSI image)
+    nbsi_data_offset: Option<u16>,
+    /// 18h: Pointer to PCI Data Structure (offset from start of ROM image)
+    pci_data_struct_offset: u16,
+    /// 1Ah: Size of block (this is NBSI-specific)
+    size_of_block: Option<u32>,
+}
+
+impl PciRomHeader {
+    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+        if data.len() < 26 {
+            // Need at least 26 bytes to read pciDataStrucPtr and sizeOfBlock
+            return Err(EINVAL);
+        }
+
+        let signature = u16::from_le_bytes([data[0], data[1]]);
+
+        // Check for valid ROM signatures
+        match signature {
+            0xAA55 | 0xBB77 | 0x4E56 => {}
+            _ => {
+                dev_err!(pdev.as_ref(), "ROM signature unknown {:#x}\n", signature);
+                return Err(EINVAL);
+            }
+        }
+
+        // Read the pointer to the PCI Data Structure at offset 0x18
+        let pci_data_struct_ptr = u16::from_le_bytes([data[24], data[25]]);
+
+        // Try to read optional fields if enough data
+        let mut size_of_block = None;
+        let mut nbsi_data_offset = None;
+
+        if data.len() >= 30 {
+            // Read size_of_block at offset 0x1A
+            size_of_block = Some(
+                (data[29] as u32) << 24
+                    | (data[28] as u32) << 16
+                    | (data[27] as u32) << 8
+                    | (data[26] as u32),
+            );
+        }
+
+        // For NBSI images, try to read the nbsiDataOffset at offset 0x16
+        if data.len() >= 24 {
+            nbsi_data_offset = Some(u16::from_le_bytes([data[22], data[23]]));
+        }
+
+        Ok(PciRomHeader {
+            signature,
+            reserved: [0u8; 20],
+            pci_data_struct_offset: pci_data_struct_ptr,
+            size_of_block,
+            nbsi_data_offset,
+        })
+    }
+}
+
+/// NVIDIA PCI Data Extension Structure. This is similar to the
+/// PCI Data Structure, but is Nvidia-specific and is placed right after
+/// the PCI Data Structure. It contains some fields that are redundant
+/// with the PCI Data Structure, but are needed for traversing the
+/// BIOS images. It is expected to be present in all BIOS images except
+/// for NBSI images.
+#[derive(Debug, Clone)]
+#[repr(C)]
+struct NpdeStruct {
+    /// 00h: Signature ("NPDE")
+    signature: [u8; 4],
+    /// 04h: NVIDIA PCI Data Extension Revision
+    npci_data_ext_rev: u16,
+    /// 06h: NVIDIA PCI Data Extension Length
+    npci_data_ext_len: u16,
+    /// 08h: Sub-image Length (in 512-byte units)
+    subimage_len: u16,
+    /// 0Ah: Last image indicator flag
+    last_image: u8,
+}
+
+impl NpdeStruct {
+    fn new(pdev: &pci::Device, data: &[u8]) -> Option<Self> {
+        if data.len() < core::mem::size_of::<Self>() {
+            dev_dbg!(pdev.as_ref(), "Not enough data for NpdeStruct\n");
+            return None;
+        }
+
+        let mut signature = [0u8; 4];
+        signature.copy_from_slice(&data[0..4]);
+
+        // Signature should be "NPDE" (0x4544504E)
+        if &signature != b"NPDE" {
+            dev_dbg!(
+                pdev.as_ref(),
+                "Invalid signature for NpdeStruct: {:?}\n",
+                signature
+            );
+            return None;
+        }
+
+        let subimage_len = u16::from_le_bytes([data[8], data[9]]);
+        if subimage_len == 0 {
+            dev_dbg!(pdev.as_ref(), "Invalid subimage length: 0\n");
+            return None;
+        }
+
+        Some(NpdeStruct {
+            signature,
+            npci_data_ext_rev: u16::from_le_bytes([data[4], data[5]]),
+            npci_data_ext_len: u16::from_le_bytes([data[6], data[7]]),
+            subimage_len,
+            last_image: data[10],
+        })
+    }
+
+    /// Check if this is the last image in the ROM
+    fn is_last(&self) -> bool {
+        self.last_image & LAST_IMAGE_BIT_MASK != 0
+    }
+
+    /// Calculate image size in bytes from 512-byte blocks
+    fn image_size_bytes(&self) -> usize {
+        self.subimage_len as usize * 512
+    }
+
+    /// Try to find NPDE in the data, the NPDE is right after the PCIR.
+    fn find_in_data(
+        pdev: &pci::Device,
+        data: &[u8],
+        rom_header: &PciRomHeader,
+        pcir: &PcirStruct,
+    ) -> Option<Self> {
+        // Calculate the offset where NPDE might be located
+        // NPDE should be right after the PCIR structure, aligned to 16 bytes
+        let pcir_offset = rom_header.pci_data_struct_offset as usize;
+        let npde_start = (pcir_offset + pcir.pci_data_struct_len as usize + 0x0F) & !0x0F;
+
+        // Check if we have enough data
+        if npde_start + core::mem::size_of::<Self>() > data.len() {
+            dev_dbg!(pdev.as_ref(), "Not enough data for NPDE\n");
+            return None;
+        }
+
+        // Try to create NPDE from the data
+        NpdeStruct::new(pdev, &data[npde_start..])
+    }
+}
+
+// Use a macro to implement BiosImage enum and methods. This avoids having to
+// repeat each enum type when implementing functions like base() in BiosImage.
+macro_rules! bios_image {
+    (
+        $($variant:ident: $class:ident),* $(,)?
+    ) => {
+        // BiosImage enum with variants for each image type
+        enum BiosImage {
+            $($variant($class)),*
+        }
+
+        impl BiosImage {
+            /// Get a reference to the common BIOS image data regardless of type
+            fn base(&self) -> &BiosImageBase {
+                match self {
+                    $(Self::$variant(img) => &img.base),*
+                }
+            }
+
+            /// Returns a string representing the type of BIOS image
+            fn image_type_str(&self) -> &'static str {
+                match self {
+                    $(Self::$variant(_) => stringify!($variant)),*
+                }
+            }
+        }
+    }
+}
+
+impl BiosImage {
+    /// Check if this is the last image
+    fn is_last(&self) -> bool {
+        let base = self.base();
+
+        // For NBSI images (type == 0x70), return true as they're
+        // considered the last image
+        if matches!(self, Self::Nbsi(_)) {
+            return true;
+        }
+
+        // For other image types, check the NPDE first if available
+        if let Some(ref npde) = base.npde {
+            return npde.is_last();
+        }
+
+        // Otherwise, fall back to checking the PCIR last_image flag
+        base.pcir.is_last()
+    }
+
+    /// Get the image size in bytes
+    fn image_size_bytes(&self) -> usize {
+        let base = self.base();
+
+        // Prefer NPDE image size if available
+        if let Some(ref npde) = base.npde {
+            return npde.image_size_bytes();
+        }
+
+        // Otherwise, fall back to the PCIR image size
+        base.pcir.image_size_bytes()
+    }
+
+    /// Create a BiosImageBase from a byte slice and convert it to a BiosImage
+    /// which triggers the constructor of the specific BiosImage enum variant.
+    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+        let base = BiosImageBase::new(pdev, data)?;
+        let image = base.into_image().inspect_err(|e| {
+            dev_err!(pdev.as_ref(), "Failed to create BiosImage: {:?}\n", e);
+        })?;
+
+        Ok(image)
+    }
+}
+
+bios_image! {
+    PciAt: PciAtBiosImage,   // PCI-AT compatible BIOS image
+    Efi: EfiBiosImage,       // EFI (Extensible Firmware Interface)
+    Nbsi: NbsiBiosImage,     // NBSI (Nvidia Bios System Interface)
+    FwSec: FwSecBiosImage,   // FWSEC (Firmware Security)
+}
+
+struct PciAtBiosImage {
+    base: BiosImageBase,
+    // PCI-AT-specific fields can be added here in the future.
+}
+
+struct EfiBiosImage {
+    base: BiosImageBase,
+    // EFI-specific fields can be added here in the future.
+}
+
+struct NbsiBiosImage {
+    base: BiosImageBase,
+    // NBSI-specific fields can be added here in the future.
+}
+
+struct FwSecBiosImage {
+    base: BiosImageBase,
+    // FWSEC-specific fields can be added here in the future.
+}
+
+// Convert from BiosImageBase to BiosImage
+impl TryFrom<BiosImageBase> for BiosImage {
+    type Error = Error;
+
+    fn try_from(base: BiosImageBase) -> Result<Self> {
+        match base.pcir.code_type {
+            0x00 => Ok(BiosImage::PciAt(PciAtBiosImage { base })),
+            0x03 => Ok(BiosImage::Efi(EfiBiosImage { base })),
+            0x70 => Ok(BiosImage::Nbsi(NbsiBiosImage { base })),
+            0xE0 => Ok(BiosImage::FwSec(FwSecBiosImage { base })),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+/// BIOS Image structure containing various headers and references
+/// fields base to all BIOS images. Each BiosImage type has a
+/// BiosImageBase type along with other image-specific fields.
+/// Note that Rust favors composition of types over inheritance.
+#[derive(Debug)]
+#[expect(dead_code)]
+struct BiosImageBase {
+    /// PCI ROM Expansion Header
+    rom_header: PciRomHeader,
+    /// PCI Data Structure
+    pcir: PcirStruct,
+    /// NVIDIA PCI Data Extension (optional)
+    npde: Option<NpdeStruct>,
+    /// Image data (includes ROM header and PCIR)
+    data: KVec<u8>,
+}
+
+impl BiosImageBase {
+    fn into_image(self) -> Result<BiosImage> {
+        BiosImage::try_from(self)
+    }
+
+    /// Creates a new BiosImageBase from raw byte data.
+    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+        // Ensure we have enough data for the ROM header
+        if data.len() < 26 {
+            dev_err!(pdev.as_ref(), "Not enough data for ROM header\n");
+            return Err(EINVAL);
+        }
+
+        // Parse the ROM header
+        let rom_header = PciRomHeader::new(pdev, &data[0..26])
+            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to create PciRomHeader: {:?}\n", e))?;
+
+        // Get the PCI Data Structure using the pointer from the ROM header
+        let pcir_offset = rom_header.pci_data_struct_offset as usize;
+        let pcir_data = data
+            .get(pcir_offset..pcir_offset + core::mem::size_of::<PcirStruct>())
+            .ok_or(EINVAL)
+            .inspect_err(|_| {
+                dev_err!(
+                    pdev.as_ref(),
+                    "PCIR offset {:#x} out of bounds (data length: {})\n",
+                    pcir_offset,
+                    data.len()
+                );
+                dev_err!(
+                    pdev.as_ref(),
+                    "Consider reading more data for construction of BiosImage\n"
+                );
+            })?;
+
+        let pcir = PcirStruct::new(pdev, pcir_data)
+            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to create PcirStruct: {:?}\n", e))?;
+
+        // Look for NPDE structure if this is not an NBSI image (type != 0x70)
+        let npde = NpdeStruct::find_in_data(pdev, data, &rom_header, &pcir);
+
+        // Create a copy of the data
+        let mut data_copy = KVec::new();
+        data_copy.extend_with(data.len(), 0, GFP_KERNEL)?;
+        data_copy.copy_from_slice(data);
+
+        Ok(BiosImageBase {
+            rom_header,
+            pcir,
+            npde,
+            data: data_copy,
+        })
+    }
+}

-- 
2.49.0

