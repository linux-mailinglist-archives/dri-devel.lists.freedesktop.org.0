Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEFCC9575D
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 01:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38D110E299;
	Mon,  1 Dec 2025 00:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZOtxu8K8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010047.outbound.protection.outlook.com [52.101.61.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4636510E073;
 Mon,  1 Dec 2025 00:35:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVJhBfA3RoGNXAXVVuuO5yvAsiVNqHJyPnGI9VL0d5eWXsW2ZEpJQAhRqPpI51Tc0ep0C7Vos6r7LdVyD/JyFE0Q/eBMHPSOxWn2b1uCfQe8SSkDVOJh85YlOZMv1k4cuTfGYoI12Z6nh6vB7lJWDifBpHH02NybUWJrgDMD40ZjyhNFsfv6dXxCEjzTfXsHlJ8jd440P08TjRTV8Yj7Q0nRu/3CelsmmV/RLHyOoE38mETdfPN5d9EFwlu9gY7YL1mw4Ar0a6ghS/ctTKIKkfvVzIV/plZU5dq+BQ0+zDQJffeaawV9EM2VlAIoJyiOZSwq7IFJi/JtxqnLLN/Uzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0aRmft/sIWPemH1a0D76AnHXhiPbYF+xAPwgiMuY4g=;
 b=PJqGZicWGKyRaZY8P8R0ieQsRLOMvh21LvfN8ftHvmAoUV0G77R5cvjJ2ng0OYnnNMhjlglBIRnP/qeQ24tp99G83ImMi/L3pjWsdvMzJTbkXfhrY8WTE5OxFO4wDN1DgE+jiXO2tLnbcuuaLfTXnqfRrZUjn6/IYN2NoWhaP4uqVptmQMszYnSaWPD25I9kQf9GhaDId7vUeBsN7ZpHcQV3mSWUW9iKuk9kavJFks+aiTUbQslGefXP6mpKFSpr9Y3D67D/Lid/wSnUe3Y5me3wSt9fPnclICFIR/j2soDP41g3/aOvzJp9kb2X2gT7y5qFnk25v3VBnHbSVp+iDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0aRmft/sIWPemH1a0D76AnHXhiPbYF+xAPwgiMuY4g=;
 b=ZOtxu8K8OKNXV1luiSUGw2oxbfwXKt2JNoBDCwdhQoI8hmDFwm7eyCTsQcbDARH5Y5fJi/r2W8te/EzOCxDwMiJAfTX/Yvof5CEwyXaV/ePhi7zUTrstwmXdqJLdxebGqYaODCOrlCcC0LPSBPs4sbUsewWiGRa/GsIANr2vEoeR1Drc7oV9aZ4DJomtmf+p3FiLyBUt7JT0wN2jgIo3RY/Hx13C8+1BR4fd1p3NpLBbmY0bPsH7gLITSZQPRjf2AzZsjUk4Vavd8wpfy33vs6SCeAXWAazmneBt3WA69dYfs2IjpI+nRvezrCwaMZmwJqlNa4FPXLTEVYgQIhYd9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8227.namprd12.prod.outlook.com (2603:10b6:208:406::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 00:35:13 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 00:35:13 +0000
Message-ID: <2653abf6-5cd4-4385-b7c2-f377a9503160@nvidia.com>
Date: Sun, 30 Nov 2025 16:34:24 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251129213056.4021375-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0078.namprd03.prod.outlook.com
 (2603:10b6:a03:331::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 25a267ce-ad79-4075-5799-08de30717dd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3JZc01IeHhiZ0FQMHpZb1hkQ1NYcVZqZm54MnZ5YkpEeDA5NUQ0bWZTZG5P?=
 =?utf-8?B?bXpWUjh6amh0bmYyU0I2KzV2Nm1ybHBPUEtqYVRYS042eFZUQTVDOFlzNFBE?=
 =?utf-8?B?aWV4SUFUUmFTdWc0SWZadmhManJJK053bDB2aHplRW5tUUd5czJLMzNOMnlT?=
 =?utf-8?B?Wnd6NWoxQ2Qvd1Z5alg0MlZYREd6QkdRNXhyZmkwRGo2b2FPZDAvSDd6eDhQ?=
 =?utf-8?B?UnhvZVVCcVROSGtEUU5DOFVhL3AwR2xJbm1ZNW40OEIyMFJLcnRJSENBSnhE?=
 =?utf-8?B?RGlKWS9RZ2o2YnhwQ25FY0lKTEZjakhIMi8zNkR3clpMS3cyd3ZGQWRpYXNz?=
 =?utf-8?B?N1l0S3RXUGhDMGpTRXorWXJBQ1ZvbHVBYlVLVzJLK0F6QXFmTFlwTVF0VHRY?=
 =?utf-8?B?ZzhWdWRGSUIvUGFYa2V0c2ppYW9nMVVqa2FlSXgzSktFNWhxTDBwelNLQWRG?=
 =?utf-8?B?MVUwakRNWVFFZTUxQnRrUm9aR1laQkx2aUNWeitRbDlOSDRDc2hzc3h6YUZn?=
 =?utf-8?B?V2wxNW1WbTBMcmZhVEpmSWlJVFFWR1NTOEFyWGhnYy9ra2xWY21wZUtZeDN5?=
 =?utf-8?B?TDBySWwxbFpzcmxOWU9mT0RwTnY3YitrZFNtdHdmeG1WbExFdXJDT1o3dmxa?=
 =?utf-8?B?U2hQeG51YzdGWVBZdytERFFEYmlBZFNUWWprTDFkMkdvcmRjYVFBWWxTTmQv?=
 =?utf-8?B?NlNoSmxtTUsvclltS0Rtby9GYWMrTi9OQWtibkJhRkt6am9pZERUZkJMVnVO?=
 =?utf-8?B?UjBrVlptQk5hS3NISUN0aisxbk0wRmsrYUtaWnZCMFNZZ1B4L3R4RkxxUU5q?=
 =?utf-8?B?WHVUN0JkZE1MR0g5eERCT3pTUE1sSTNhSms4OXVBNnhLYWhYa2ZyYXF2U2x6?=
 =?utf-8?B?WFp4WFU1OHppVWJkTWw2MDNOVCtiYUcyVFNHTEIxOUg2WHJzVnFPN3Awb0U3?=
 =?utf-8?B?NjJhTURuNUNVUHBYUERuVFkzNWVMbVoybkcvcldxbXNVNTRZOGpUM2ErZzdK?=
 =?utf-8?B?QlEwMitYS20rcXAwTmp2WjRpN1N6ZEg3dUFXRlBKQlUyK2M0TUsyU0MzT1ZQ?=
 =?utf-8?B?WVpWb1FtSDNkQlA0SHd1dlhramo0bHZPQ2hyZzRVcnpFYXM1UUdUUEdXS1Np?=
 =?utf-8?B?QWxRWTJOQno0eEdWQnRXQ1dGS2VoTHVNZmg0ZEgycGhxVlpvbDkxeG1pbE1L?=
 =?utf-8?B?Z2xMaGZjanJRRkgrMThKV04ycGJmWTNScXc0ZmpZY1BIYnFxV2ZQZ1cwRnlq?=
 =?utf-8?B?QzdldDB5dkhCN0U5UDdmU29RdEdKY0pUaW5NV0dtSDMxREJkSHJQQ1o0ODJ4?=
 =?utf-8?B?K3pXaHhvMTMzNjl0dDI1UGxiMkd2cHhROFhVVEhwMmVnTXdhT3I4WTVDOUgz?=
 =?utf-8?B?Z1B2bFQycW1XWjAxN21TRkxzelNPQTJnZS9lZ0pqL0pVY21BODlBa0tld3My?=
 =?utf-8?B?dkVMSnFMVGgxRFYxSUxIeUFqTzFYMkMrQm83endRNk9YOEtJVWJ6S1FEVnRF?=
 =?utf-8?B?WW1rYWpLZ0l0QUpnRUxCdmZCdUxxL1UwR09RTXc5bEpMT3IvQzZZQWJ5MDZt?=
 =?utf-8?B?L1J0OUhZSDFvREV5elNuc2dneDZFWXBXNFZJUlBPTVo5NDk4dXB5OWRIN1lk?=
 =?utf-8?B?VzJnQ0NDVTlTYUtYR3pWa3EwSEFiTmZiVzZRMDVMSXEvVUZFZURGWjgvSU9v?=
 =?utf-8?B?emZ2SUFXUnRoVmxacFByaGQzUUY3QVNqalAyeW1mRFI5SjlOZEpra0cxaEhZ?=
 =?utf-8?B?WUt1L0Vmalhvb0hXRU9CT3h6czZjVmw2cHFwU3Y2VXlUTFZIL1p4QnUrR1Vx?=
 =?utf-8?B?UWRqbWZ6aW9LTk5WTWxUY0t1akd4c09sUGt1VXZhc2NBdXBQeTdRaTBhMHZU?=
 =?utf-8?B?b3NNMVFTK3NZeGtHZVhzRDRHa25aaXpNYnJDRi81Q0lIQnU2dWVFSktpenNQ?=
 =?utf-8?Q?jYty3gEmNRK2BV3I9kzCGnbBnJeRlKNR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXhZSVpTcG5KZ0ZIZW1zNXkxR2d5QkxjWVNSL1czbGRSeDhrQzdTaUFROEZ6?=
 =?utf-8?B?UmJvV3RlajdmY1k5Q3NtT29tMlJLcGdmSUt3a0NGUUFjdGxoZGRCWmM4N2po?=
 =?utf-8?B?bExqNC9IbzhUb0JXZkQyRlB0ZTVwS1dycHNoSGxDUUtvN2lZWENyU09MbTg0?=
 =?utf-8?B?cFhCTlNNNVVUUi9yOVBaNUR3STZDdXc0ZUJYaHhOY0FuZ3VOSnJzc25sRHZY?=
 =?utf-8?B?WnZvQ3pRK0RTNk9MdnErK1k0eVRlK3FJV1lXTTluTDdUSW5jZ2JibkRya3VO?=
 =?utf-8?B?M1psTHJhKzBDUVFpekxhRzZjRUZnMmM1TmVxSVljSEFwUkFQZVprL2h0Mzgw?=
 =?utf-8?B?UlcyRVRUam5Sd2hTZlZJQVNOa2NvV0pDUWp3eGZEU3FUekVhRE51UXhDSkJu?=
 =?utf-8?B?VklNMldJTTd0d011VERYRnFCVzZLOW14cGo1K2tZSUROZ0ExYW0yb1FSc3Aw?=
 =?utf-8?B?Z2Q0aFFsY3RDM1JtblJwY0k3NGsxZTFtUlA5Sk9YS0h0Y2xQRTh6VytWeWR6?=
 =?utf-8?B?Q0cvTnVLbnMweUx5eXhsVUtWdERMNmZ6NDQrcndzOXFYZG1kR050a2RKOTU5?=
 =?utf-8?B?aFJmV0EraEQxazJuZVFvQWhvRXQrbnVxYjNDYUVFZGdQMnlyRm5Rb1BSTHZM?=
 =?utf-8?B?OEpLSWdYVkFhWFNlK2d6eGFDYzdmN1RXYjVrVjE5NWZxL1lad08rdEp4Rmk5?=
 =?utf-8?B?V290Ykd5ei82OFJTQzhBY1NiN0syVkhNL3BzM2xMZXR5bHpLQTNrQlE2OWRx?=
 =?utf-8?B?Z1IzQXkybUlYMXljNTBQWllCbitIb1FwTk5IRUpndlQ4MnU3SzFPbHM1cTZX?=
 =?utf-8?B?S3lMWGx6VjBuWVNZcC9hcitza0JJTGFmK3M4VTRrbklMZXBaMjJpM3NsYnpm?=
 =?utf-8?B?Vk5yRDF3UFYzZWt2alhjSDJNRGVFdXVzc3dTOVEydGF0U2hWNUFEYmFzbVhX?=
 =?utf-8?B?YkIydk1ocktxWjhLenN5RzJyR0VaMXZsR2hUL0JkU25VN1VWdml6QzdiZnA3?=
 =?utf-8?B?YmQ5Q2tPNnRNcnZONmhMVXNETHh3N2k5UzlOZlF4cjVWTHBjREU5QkNhcTRG?=
 =?utf-8?B?UlNNUjdSTmhvaFpQT01aMUdBczdVZHhGbFZ4K3FxUEUrRlhQZGpNOFRrUlMw?=
 =?utf-8?B?dDRXWTFBSFh0aW1ZcHBoVktTb0JYckc4ZHZiVzZuMzdjQ1FpbGwwQUMxRXhW?=
 =?utf-8?B?NGdFRm8xU2tvbERuNHJCb0VxMi9BcWI4ZnVOMjlOY09HTWRMN2o1eEtLdWVi?=
 =?utf-8?B?K2VGVlI2UUNER3BTNTcyMVMvVmNZcnJVNEhORWhPWDdLWjdiOWdTbFNvK0p6?=
 =?utf-8?B?RjVhdFdBMUF0eTUvTk0rSkZCam55emhtbGRKZkVSekRjeHJKMHhkaitDSnpU?=
 =?utf-8?B?RVljQVJLbko1TC9rcHRzeWxwQ2tNbWRtcXJBNnk3VTJTRzVFVWNBY2JyQ0No?=
 =?utf-8?B?Z0cvd0pKcjYydUpqRU4xTDM1UDlaYWNYZW1vbGl1VGFoOThidm5lSWNyQjZN?=
 =?utf-8?B?VVJLRDdON1MvVWU1Nkg3UElHZUphQ0JIdHBpTmErUzZ3NXlrM2kyaGxSSWdH?=
 =?utf-8?B?bGpqU2dkMktPZ0dCTDY3a2dlQ0oyY0MwNTBkbnZZR3JuOXdaL1hSeVlqVy9R?=
 =?utf-8?B?ODlndXJhN2U5TUJMMEYvckZ0NE1QMWVPOE53c2VjcDdRR0pjU3J1RHlBWUwz?=
 =?utf-8?B?bUViazVXa3NQUnllTFh1ZGs3cnlxaW1vL0Q4a3hMdjlIMG90dnIxZG5UdHpj?=
 =?utf-8?B?YUp4N1VLclE1WWhnaG5SbVcrRGY2Yk1ZTXczMTRqYXp5QUlsbGwzRkk3OWlj?=
 =?utf-8?B?bWk1YjU4VTNRamh0bDRUOXRFaUpPMVV0MUNCUm43YnlVTllkQnNXdWZodnNi?=
 =?utf-8?B?MXBPSG9hQ2hscUlwQTdpN050MXZOWmsvRHltWnIvdmZmZGEwR3BkTjRQUHNv?=
 =?utf-8?B?QS82ankxQW04MUxNRUNEcnRpVUQ3RjRmU3g1WHB2VkEwWFphTXhZeHFqMm41?=
 =?utf-8?B?YmFUeGprVHUxblFpemsvWkcvTUN5eG1yQXcwemQ1M2ltVmFueXUveXlLY29K?=
 =?utf-8?B?ZGUvWXBoa21KcFo4RmpQeEROME9Gemd6K0JvQWtISDFPaml2Y0NSc3BzNzhP?=
 =?utf-8?Q?K2slp1L3bebb4rMfR41XKFe2J?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a267ce-ad79-4075-5799-08de30717dd5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 00:35:13.5657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ue44zn/GeE9NfR/SmLRFrCSZ/SxAfa7YPqozO4GkCpBs0TIZa6l/TvmE427dKx+TjGim1OBFtTH7vVf8WuMLuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8227
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

On 11/29/25 1:30 PM, Joel Fernandes wrote:
> Add a new module `clist` for working with C's doubly circular linked
> lists. Provide low-level iteration over list_head nodes and high-level
> iteration over typed list items.
...
> 
>  MAINTAINERS            |   7 +
>  rust/helpers/helpers.c |   1 +
>  rust/helpers/list.c    |  12 ++
>  rust/kernel/clist.rs   | 349 +++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs     |   1 +
>  5 files changed, 370 insertions(+)
>  create mode 100644 rust/helpers/list.c
>  create mode 100644 rust/kernel/clist.rs

Hi Joel,

This is sufficiently tricky that I think it needs some code to exercise it.

Lately I'm not sure what to recommend, there are several choices, each with
trade-offs: kunit, samples/rust, or even new DRM Rust code. Maybe the last
one is especially nice, because it doesn't really have many downsides.

Rather than wait for any of that, I wrote a quick samples/rust/rust_clist.rs
and used it to sanity check my review findings, which are below.

> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5f7aa6a8a9a1..fb2ff877b6d1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22666,6 +22666,13 @@ F:	rust/kernel/init.rs
>  F:	rust/pin-init/
>  K:	\bpin-init\b|pin_init\b|PinInit
>  
> +RUST TO C LIST INTERFACES
> +M:	Joel Fernandes <joelagnelf@nvidia.com>
> +M:	Alexandre Courbot <acourbot@nvidia.com>
> +L:	rust-for-linux@vger.kernel.org
> +S:	Maintained
> +F:	rust/kernel/clist.rs
> +
>  RXRPC SOCKETS (AF_RXRPC)
>  M:	David Howells <dhowells@redhat.com>
>  M:	Marc Dionne <marc.dionne@auristor.com>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 79c72762ad9c..634fa2386bbb 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -32,6 +32,7 @@
>  #include "io.c"
>  #include "jump_label.c"
>  #include "kunit.c"
> +#include "list.c"
>  #include "maple_tree.c"
>  #include "mm.c"
>  #include "mutex.c"
> diff --git a/rust/helpers/list.c b/rust/helpers/list.c
> new file mode 100644
> index 000000000000..6044979c7a2e
> --- /dev/null
> +++ b/rust/helpers/list.c
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Helpers for C Circular doubly linked list implementation.

s/Circular/circular/

...but:

> + */
> +
> +#include <linux/list.h>
> +
> +void rust_helper_list_add_tail(struct list_head *new, struct list_head *head)
> +{
> +	list_add_tail(new, head);
> +}

This is, so far, not used. Let's remove it, until/unless you have some
code in this patch(set) to use it, please.

> diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
> new file mode 100644
> index 000000000000..361a6132299b
> --- /dev/null
> +++ b/rust/kernel/clist.rs
> @@ -0,0 +1,349 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A C doubly circular intrusive linked list interface for rust code.
> +//!
> +//! # Examples
> +//!
> +//! ```
> +//! use kernel::{
> +//!     bindings,
> +//!     clist::init_list_head,
> +//!     clist_create,
> +//!     types::Opaque, //
> +//! };
> +//! # // Create test list with values (0, 10, 20) - normally done by C code but it is
> +//! # // emulated here for doctests using the C bindings.
> +//! # use core::mem::MaybeUninit;
> +//! #
> +//! # /// C struct with embedded `list_head` (typically will be allocated by C code).
> +//! # #[repr(C)]
> +//! # pub(crate) struct SampleItemC {
> +//! #     pub value: i32,
> +//! #     pub link: bindings::list_head,
> +//! # }
> +//! #
> +//! # let mut head = MaybeUninit::<bindings::list_head>::uninit();
> +//! #
> +//! # // SAFETY: head and all the items are test objects allocated in this scope.
> +//! # unsafe { init_list_head(head.as_mut_ptr()) };
> +//! # // SAFETY: head is a test object allocated in this scope.
> +//! # let mut head = unsafe { head.assume_init() };

This is a bug that leads to a corrupted list. I have the test code (and
the kernel hang/crash) to prove it.

The problem is that any move after init_list_head() invalidates the
list: the next/prev pointers still point to the old address.

The fix requires two-step initialization, like this, for example:

//! # // Two-step init: create uninit first (can be moved), then init after.
//! # let mut head = MaybeUninit::<bindings::list_head>::uninit();
//! # let mut items = [
//! #     MaybeUninit::<SampleItemC>::uninit(),
//! #     MaybeUninit::<SampleItemC>::uninit(),
//! #     MaybeUninit::<SampleItemC>::uninit(),
//! # ];
//! #
//! # // Step 2: Now init after they're in their final location
//! # // SAFETY: head is in its final stack location.
//! # unsafe { init_list_head(head.as_mut_ptr()) };

> +//! # let mut items = [
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! # ];
> +//! #
> +//! # for (i, item) in items.iter_mut().enumerate() {
> +//! #     let ptr = item.as_mut_ptr();
> +//! #     // SAFETY: pointers are to allocated test objects with a list_head field.
> +//! #     unsafe {
> +//! #         (*ptr).value = i as i32 * 10;
> +//! #         // addr_of_mut!() computes address of link directly as link is uninitialized.
> +//! #         init_list_head(core::ptr::addr_of_mut!((*ptr).link));
> +//! #         bindings::list_add_tail(&mut (*ptr).link, &mut head);
> +//! #     }
> +//! # }
> +//!
> +//! // Rust wrapper for the C struct.
> +//! // The list item struct in this example is defined in C code as:
> +//! //   struct SampleItemC {
> +//! //       int value;
> +//! //       struct list_head link;
> +//! //   };
> +//! //
> +//! #[repr(transparent)]
> +//! pub(crate) struct Item(Opaque<SampleItemC>);
> +//!
> +//! impl Item {
> +//!     pub(crate) fn value(&self) -> i32 {
> +//!         // SAFETY: `Item` has same layout as `SampleItemC`.
> +//!         unsafe { (*self.0.get()).value }
> +//!     }
> +//! }
> +//!
> +//! // Create typed Clist from sentinel head.
> +//! // SAFETY: head is valid, items are `SampleItemC` with embedded `link` field.
> +//! let list = unsafe { clist_create!(&mut head, Item, SampleItemC, link) };
> +//!
> +//! // Iterate directly over typed items.
> +//! let mut found_0 = false;
> +//! let mut found_10 = false;
> +//! let mut found_20 = false;
> +//!
> +//! for item in list.iter() {
> +//!     let val = item.value();
> +//!     if val == 0 { found_0 = true; }
> +//!     if val == 10 { found_10 = true; }
> +//!     if val == 20 { found_20 = true; }
> +//! }
> +//!
> +//! assert!(found_0 && found_10 && found_20);
> +//! ```
> +
> +use core::{
> +    iter::FusedIterator,
> +    marker::PhantomData, //
> +};
> +
> +use crate::{
> +    bindings,
> +    types::Opaque, //
> +};
> +
> +/// Initialize a `list_head` object to point to itself.
> +///
> +/// # Safety
> +///
> +/// `list` must be a valid pointer to a `list_head` object.
> +#[inline]
> +pub unsafe fn init_list_head(list: *mut bindings::list_head) {
> +    // SAFETY: Caller guarantees `list` is a valid pointer to a `list_head`.
> +    unsafe {
> +        (*list).next = list;
> +        (*list).prev = list;
> +    }
> +}
> +
> +/// Wraps a `list_head` object for use in intrusive linked lists.
> +///
> +/// # Invariants
> +///
> +/// - `ClistHead` represents an allocated and valid `list_head` structure.
> +///
> +/// # Safety
> +///
> +/// - All `list_head` nodes must not be modified by C code for the lifetime of `ClistHead`.
> +#[repr(transparent)]
> +pub struct ClistHead(Opaque<bindings::list_head>);
> +
> +impl ClistHead {
> +    /// Create a `&ClistHead` reference from a raw `list_head` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
> +        // SAFETY:
> +        // - `ClistHead` has same layout as `list_head`.
> +        // - `ptr` is valid and unmodified for 'a.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Get the raw `list_head` pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::list_head {
> +        self.0.get()
> +    }
> +
> +    /// Get the next `ClistHead` in the list.
> +    #[inline]
> +    pub fn next(&self) -> &Self {
> +        let raw = self.as_raw();
> +        // SAFETY:
> +        // - `self.as_raw()` is valid per type invariants.
> +        // - The `next` pointer is guaranteed to be non-NULL.
> +        unsafe { Self::from_raw((*raw).next) }
> +    }
> +
> +    /// Get the previous `ClistHead` in the list.
> +    #[inline]
> +    pub fn prev(&self) -> &Self {
> +        let raw = self.as_raw();
> +        // SAFETY:
> +        // - self.as_raw() is valid per type invariants.
> +        // - The `prev` pointer is guaranteed to be non-NULL.
> +        unsafe { Self::from_raw((*raw).prev) }
> +    }
> +
> +    /// Check if this node is linked in a list (not isolated).
> +    #[inline]
> +    pub fn is_linked(&self) -> bool {
> +        let raw = self.as_raw();
> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe { (*raw).next != raw && (*raw).prev != raw }
> +    }
> +}
> +
> +// SAFETY: `ClistHead` can be sent to any thread.
> +unsafe impl Send for ClistHead {}
> +
> +// SAFETY: `ClistHead` can be shared among threads as it is not modified by C per type invariants.
> +unsafe impl Sync for ClistHead {}
> +
> +impl PartialEq for ClistHead {
> +    fn eq(&self, other: &Self) -> bool {
> +        self.as_raw() == other.as_raw()
> +    }
> +}
> +
> +impl Eq for ClistHead {}
> +
> +/// Low-level iterator over `list_head` nodes.
> +///
> +/// An iterator used to iterate over a C intrusive linked list (`list_head`). Caller has to
> +/// perform conversion of returned `ClistHead` to an item (using `container_of` macro or similar).
> +///
> +/// # Invariants
> +///
> +/// `ClistHeadIter` is iterating over an allocated, initialized and valid list.
> +struct ClistHeadIter<'a> {
> +    current_head: &'a ClistHead,
> +    list_head: &'a ClistHead,
> +    exhausted: bool,
> +}
> +
> +impl<'a> Iterator for ClistHeadIter<'a> {
> +    type Item = &'a ClistHead;
> +
> +    #[inline]
> +    fn next(&mut self) -> Option<Self::Item> {
> +        if self.exhausted {
> +            return None;
> +        }
> +
> +        // Advance to next node.
> +        self.current_head = self.current_head.next();
> +
> +        // Check if we've circled back to the sentinel head.
> +        if self.current_head == self.list_head {
> +            self.exhausted = true;
> +            return None;
> +        }
> +
> +        Some(self.current_head)
> +    }
> +}
> +
> +impl<'a> FusedIterator for ClistHeadIter<'a> {}
> +
> +/// A typed C linked list with a sentinel head.
> +///
> +/// A sentinel head represents the entire linked list and can be used for
> +/// iteration over items of type `T`, it is not associated with a specific item.
> +///
> +/// # Invariants
> +///
> +/// - `head` is an allocated and valid C `list_head` structure that is the list's sentinel.
> +/// - `offset` is the byte offset of the `list_head` field within the C struct that `T` wraps.
> +///
> +/// # Safety
> +///
> +/// - All the list's `list_head` nodes must be allocated and have valid next/prev pointers.
> +/// - The underlying `list_head` (and entire list) must not be modified by C for the
> +///   lifetime 'a of `Clist`.
> +pub struct Clist<'a, T> {
> +    head: &'a ClistHead,
> +    offset: usize,
> +    _phantom: PhantomData<&'a T>,
> +}

This discards build-time (const generic) information, and demotes it to 
runtime (.offset), without any real benefit. I believe it's better to keep
it as a const generic, like this:

pub struct Clist<'a, T, const OFFSET: usize> {
    head: &'a ClistHead,
    _phantom: PhantomData<&'a T>,
}

> +
> +impl<'a, T> Clist<'a, T> {

And here, the above becomes:

impl<'a, T, const OFFSET: usize> Clist<'a, T, OFFSET> {

...etc.

I've tested all of this locally, and the diffs look nice and all my tests
still pass, of course.

> +    /// Create a typed `Clist` from a raw sentinel `list_head` pointer.
> +    ///
> +    /// The const generic `OFFSET` specifies the byte offset of the `list_head` field within
> +    /// the C struct that `T` wraps.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure
> +    ///   representing a list sentinel.
> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> +    /// - The list must contain items where the `list_head` field is at byte offset `OFFSET`.
> +    /// - `T` must be `#[repr(transparent)]` over the C struct.
> +    #[inline]
> +    pub unsafe fn from_raw_and_offset<const OFFSET: usize>(ptr: *mut bindings::list_head) -> Self {
> +        Self {
> +            // SAFETY: Caller guarantees `ptr` is a valid, sentinel `list_head` object.
> +            head: unsafe { ClistHead::from_raw(ptr) },
> +            offset: OFFSET,
> +            _phantom: PhantomData,
> +        }
> +    }
> +
> +    /// Get the raw sentinel `list_head` pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::list_head {
> +        self.head.as_raw()
> +    }
> +
> +    /// Check if the list is empty.
> +    #[inline]
> +    pub fn is_empty(&self) -> bool {
> +        let raw = self.as_raw();
> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe { (*raw).next == raw }
> +    }
> +
> +    /// Create an iterator over typed items.
> +    #[inline]
> +    pub fn iter(&self) -> ClistIter<'a, T> {
> +        ClistIter {
> +            head_iter: ClistHeadIter {
> +                current_head: self.head,
> +                list_head: self.head,
> +                exhausted: false,
> +            },
> +            offset: self.offset,
> +            _phantom: PhantomData,
> +        }
> +    }
> +}
> +
> +/// High-level iterator over typed list items.
> +pub struct ClistIter<'a, T> {
> +    head_iter: ClistHeadIter<'a>,
> +    offset: usize,
> +    _phantom: PhantomData<&'a T>,
> +}
> +
> +impl<'a, T> Iterator for ClistIter<'a, T> {
> +    type Item = &'a T;
> +
> +    fn next(&mut self) -> Option<Self::Item> {
> +        let head = self.head_iter.next()?;
> +
> +        // Convert to item using offset.
> +        // SAFETY:
> +        // - `item_ptr` calculation from `offset` (calculated using offset_of!)
> +        //    is valid per invariants.
> +        Some(unsafe { &*head.as_raw().cast::<u8>().sub(self.offset).cast::<T>() })
> +    }
> +}
> +
> +impl<'a, T> FusedIterator for ClistIter<'a, T> {}
> +
> +/// Create a C doubly-circular linked list interface `Clist` from a raw `list_head` pointer.
> +///
> +/// This macro creates a `Clist<T>` that can iterate over items of type `$rust_type` linked
> +/// via the `$field` field in the underlying C struct `$c_type`.
> +///
> +/// # Arguments
> +///
> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut bindings::list_head`).
> +/// - `$rust_type`: Each item's rust wrapper type.
> +/// - `$c_type`: Each item's C struct type that contains the embedded `list_head`.
> +/// - `$field`: The name of the `list_head` field within the C struct.
> +///
> +/// # Safety
> +///
> +/// The caller must ensure:
> +/// - `$head` is a valid, initialized sentinel `list_head` pointing to a list that remains
> +///   unmodified for the lifetime of the rust `Clist`.
> +/// - The list contains items of type `$c_type` linked via an embedded `$field`.
> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compatible layout.
> +/// - The macro is called from an unsafe block.
> +///
> +/// # Examples
> +///
> +/// Refer to the examples in the [crate::clist] module documentation.
> +#[macro_export]
> +macro_rules! clist_create {
> +    ($head:expr, $rust_type:ty, $c_type:ty, $field:ident) => {
> +        $crate::clist::Clist::<$rust_type>::from_raw_and_offset::<
> +            { ::core::mem::offset_of!($c_type, $field) },
> +        >($head)
> +    };
> +}

Unlike the corresponding C container_of() macro, this one here has no
compile-time verification that the field is actually a list_head.

How about this, to add that check:

--- a/rust/kernel/clist.rs
+++ b/rust/kernel/clist.rs
 macro_rules! clist_create {
-    ($head:expr, $rust_type:ty, $c_type:ty, $field:ident) => {
-        $crate::clist::Clist::<$rust_type>::from_raw_and_offset::<
+    ($head:expr, $rust_type:ty, $c_type:ty, $field:ident) => {{
+        // Compile-time check: $field must be a list_head.
+        const _: () = {
+            let _check: fn(*const $c_type) -> *const $crate::bindings::list_head =
+                |p| unsafe { ::core::ptr::addr_of!((*p).$field) };
+        };
+        $crate::clist::Clist::<$rust_type, { ::core::mem::offset_of!($c_type, $field) }>::from_raw(
             $head,
         )
-    };
+    }};
 }

> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index c2eea9a2a345..b69cc5ed3b59 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -72,6 +72,7 @@
>  pub mod bug;
>  #[doc(hidden)]
>  pub mod build_assert;
> +pub mod clist;
>  pub mod clk;
>  #[cfg(CONFIG_CONFIGFS_FS)]
>  pub mod configfs;

thanks,
-- 
John Hubbard

