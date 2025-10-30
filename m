Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CC0C22844
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 23:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E9110EA4D;
	Thu, 30 Oct 2025 22:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mYP6TE2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010027.outbound.protection.outlook.com [52.101.61.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A6610EA4D;
 Thu, 30 Oct 2025 22:09:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfjneYmqoHZkbjExbXQz/Jb0Ef/KUF6Kli6tWmLCRSQZRad0oasIGvPP+Les0ofWCqxqVcwRspq+Ct9W/jczIGkMJhNwxiL4lX/2+Ja3p0h7rws6OKUTs6oGGUfqbC/uK3ZHxhznWwb2yuFKIkelOK4f+Zt9qFlywrtZ5yuDnPgxRs7gmxNrfMBlDoFC5MGfFOhIcJoILkmN7osybUqkYOnRKwdFumYUJCcQ2L33QNoysFEa/kHlr7WSjPo2Er0g3sBeVYyUg2TOOyWZXavXC6S8N1aWx8P9X+B7bUoLLgagyDS+HJNz0e+LNGwxGFSwb/u7XxDA5OvaIyJhY0WNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEi6LCeextNjmkvTPhqU5JBmVJMrBmK3fUOeQz5WYdE=;
 b=piA6gAyggN7WOpVqX5PeHVhrwZ8AwNBlnHdnW9fdtJQbPtxV4J1rdTzGejMXqkwE8KCyP3k5kEuvyFpkn6SyvOdO5YSWDm4HKPrcP8kLmuk7HPDql2Fl/u1FU4vGyWvywa9yxa+h7ayedCKeQc5zTa9/BoCBWY4HTvYitudG7blCgkYkYQVqvJ6+f2URfwrGEFg66NV62fVbpAofzb6OAay3fc/IeaG7ZLG2LousTqNV/gGS6badlmeSrGeypQO2zpUIq7/a53IJAV7l9FaEygHhp8OsCkmQZs2o+twDH4i/4RCHrMaMTLsaNAVWEUYGz1io4RxU7SRzgtRR7xJp4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEi6LCeextNjmkvTPhqU5JBmVJMrBmK3fUOeQz5WYdE=;
 b=mYP6TE2rB7cv76Txe2dBdeWHvKmdyTbXrF5Xoday6WIuKHBnSqtsf+r3feYyTGsCDfth5d18f/Wn1zLVZFuZkebHPFTVxzsNsiCruZV87viIvj+iiG94HAV74cOnh1cUhVsjmOjCvkoLxDNRLWmQRpzt9gpVpsKLhkzBR8JrDo85yuXb40FBgstsw6MRy5zu4u+mn0WGfAFIDg/FByKd05QKn0tSrCVs/TBblVTgYkWBBzT/kTfjnadd4i2cwOn0Ey09KzR9ZHOECSj/h1FfFDF5o9L/nmy2WAdSfamMxSpu3e6UuhcGZjrhz2vCkd0DT/ri01sFxWopoqcz2bvmqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BN7PPF34483F4BA.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6cb) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Thu, 30 Oct
 2025 22:09:33 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Thu, 30 Oct 2025
 22:09:33 +0000
Message-ID: <a56b54e8-1184-4e56-92d0-bd4cbc90122b@nvidia.com>
Date: Thu, 30 Oct 2025 18:09:30 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/4] samples: rust: Add sample demonstrating C linked
 list iteration
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-3-joelagnelf@nvidia.com>
 <DDVYVKDW8WG2.2STCJ4ZU00MZF@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DDVYVKDW8WG2.2STCJ4ZU00MZF@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0208.namprd13.prod.outlook.com
 (2603:10b6:208:2be::33) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BN7PPF34483F4BA:EE_
X-MS-Office365-Filtering-Correlation-Id: da733f5f-07b9-4719-43fc-08de18010161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZG1HWHZWUnlhbzY4UFRzS0hHcm01akRJTXdFSDRkNE9KcHVXU3Y1K2RQNEdM?=
 =?utf-8?B?TG5pd1FCcGpWVkx1SElGLzZrU3FZenlIRStKMFRsSU9kc2lEVHlIVGNLYzk5?=
 =?utf-8?B?SlM2NmZ0V3Rwb2d1cmlFYVBWUnRGYVpnbE5Ub0M4WmVXN0dlSFc4RXUrUGVn?=
 =?utf-8?B?KzMzK1hpTU9PV01SYjBydGtTQjAwdjY4dGgzYmJLdzZmM2l4N2hKcHpZUWhx?=
 =?utf-8?B?UDlReDlkbHVIYXVBNnRQTlBmNi9PV3JSV0FGdHk4UGgxcDZ6YjEwMlZHcmdL?=
 =?utf-8?B?YTZSWjl2VkIreFZYcVFTQllPN0RKSC9NTG1FSjBNQ2pKWEVWakhUU2xmNWdv?=
 =?utf-8?B?TmFmR3ZacU5qR1ZYL1laNmttMndqRks4U2dMVno2U1ZTTlphWDVyeGNGelZX?=
 =?utf-8?B?NWlPL2cvNGY3cFNhbFRMbCtKZnBLb0RwRkNBa1owN3pkVWVJdVcxQ09UMEJG?=
 =?utf-8?B?S0NQamFTOTYwQnU2dnFyQWxXWngwWGtmdS9MTjZBbUZnb21PR01lTUFDMjlt?=
 =?utf-8?B?aFl2REFNbGdoQmtMcUliMmhDczdmTmVmbzY4aVJqUUQ3QzBab2drTVlDejdk?=
 =?utf-8?B?RDd5WnhSdU8zR01hazVCNG42WnJtdkc4OFRYeFlrWGpTblBtQ2JNQm5VdzJs?=
 =?utf-8?B?bWYrMUIwU0NHUE1yYXZIVFRTeFEyKzlHMCtNT2RtUXNHRUVxRC9vSEJWbmpY?=
 =?utf-8?B?R0hCcVNIR3VPOUJZZ3Vock1QLzJlZXQzSDhiYjFvQjVjR2phaFdSVFVTeE1P?=
 =?utf-8?B?bW1vdVdGdGJMT2EweGtjbVpGWXEzVG1FY1BJdGZxeFpaYUhDSmJHSFEvM2RC?=
 =?utf-8?B?S3dXcUtoL09rQnZudk01RDZjbHJYOXZiS05NVnNncCtNdVZ5RmpqVTdaYXhW?=
 =?utf-8?B?YzhHb2Y3NjJQWTN4SmtoQmJHU01HZUtXZVRtQ2VpUmpUZWpjYTRDMkIxVmUw?=
 =?utf-8?B?Z3N6N25RNUgzcG5xQVdpa1Rlb0ZCaGN4blprbmxyT3hZNnpzSFFDYW5Pa0lC?=
 =?utf-8?B?VE1QK29jOFlzYllwNGVhRjErQytkY3htVXpNakp2dk80MzNaVHhQK2d3YTUr?=
 =?utf-8?B?Y1JvZlIvaExNMXljSWxTSnRaNTV6ZU9vaTJZS2VlVEw3VUZST2NDdWkyaHE1?=
 =?utf-8?B?MFlnQkljcmdlOGwxYklqUlFVNW1YS0N4TytuSVRRZ0tyWmFpYnVwN1JRTlJP?=
 =?utf-8?B?Kzh2cW5idmhKMDI0WktSLzFJUzI0L2d2SFpHb3JPN09PREpRalJJem15Q3Ix?=
 =?utf-8?B?bTlhQ0oyV0Y3YnJuWlZyRDJ2VGthUG0xQk1Ud2YwSjVCZHdTaVRHM0IrRXQy?=
 =?utf-8?B?OUpaMTFDWXNOZDdsdUNpdWxOcStOaWhwSzJSRXhuMytodWxaNXJRdFkvdHkx?=
 =?utf-8?B?Mm8rL1pYSThzL0NXd0VpWk9IYTVaeU1ibnBCampxYjF0SmN0NFB4OGREcGts?=
 =?utf-8?B?Qkc5b2xXV2xuVzJ3NlNVSDdaa3RnMUw3NHBTYW9FcHppUFRCSStVaWdBU0ZJ?=
 =?utf-8?B?eEJ6d3dFNmRneUhBKzhYenZRMDJES0NqR3hBUGN4d0EveVBjYWZtSlQyRlVu?=
 =?utf-8?B?M0NDS2w4Z3pvTkY5dlFmZ3h6TGUvOGN3Sno5aVRoU2k0ZGpqNkVBTXNFYTFK?=
 =?utf-8?B?TlF6N1dwd05CcDlOdk96OU1hejA1WmhaY1hqeEg4alNVbWZGL0Qxa281NjBq?=
 =?utf-8?B?bklKWWZjMlh6cXdlMkg2VS9ScFVzc3VKQ3ptTzJ2TjdPUlpaTzYvQjJ3VGk0?=
 =?utf-8?B?Y2E1RVdLR3c4MU9waWJqY1ZpOCs0QkFKVFdLdVZ0ejhhQUd5TVJZZTZCOXQ1?=
 =?utf-8?B?VVV2QUpUeElvWmhQTGVZUGcveTVOVWhzaXYyUUZTZUV3d0k0TXpKanVjS3ND?=
 =?utf-8?B?QlBCUldlbVFSZ3AycnhaZXJER3JZNFczT1JyOFBnbUNoc0JtMGViWjZPMko0?=
 =?utf-8?Q?bZOxBQRpx/GNqqOhTDNPU7AeBqnQc1Gy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVlrREhNTkxwdHRuME9hMkI0YWlUWmZCTG1SaEhLWnVhQW5adlpBUFFiV1dP?=
 =?utf-8?B?WUcvazhGenJDZGw5VitIMmlnaUNUWFJIOVphMEg5a1djMVFxbmx0WVNOT0ov?=
 =?utf-8?B?ZzhncHBTaFVPV0ovRVBSL1ZqY3UwdE14UGdjVnB4TUM3b2UrUk9DSzRTN2hs?=
 =?utf-8?B?d0ZFKzJnVGlyVkJnNzZzK0dINk1UcWhXSWdjc3QwU2ZuWXdZSzh0SjR1Y2Mx?=
 =?utf-8?B?b3JVZnF6a0dKMjVnZkZXank2cnNOb0FQNjhjZ3FJbnFGbUUwZm1xM0U2WTEv?=
 =?utf-8?B?Zy9KMlR1RWZ1MnVRMEZkMjZUTzZ0M3FVT1BXQjBMc3hQcjRVcS9TaGUxVW04?=
 =?utf-8?B?YVVqQUF4Z09jMVdCKzRpa0kwWXdBZVNINURoZW5ObmYwWEt2bk9FcHVwMVM3?=
 =?utf-8?B?SnJsOURQM0ZwZEU0bTZxcWJlcEtScGsxVkRhKzFYdHNqM0RhQTRZcUtrd1Rq?=
 =?utf-8?B?ZlhOMWlPbzcvaDV6NlNUNDJGQWY1R2k0RDlzaVNiYkpFN1NURVdVVXdZRmh6?=
 =?utf-8?B?Vy90a0Z3MXF5T3MrL25Ra3ZMUkdBUEtjaE91UGhyUDJuUmVqUFVYNnpOcHQ2?=
 =?utf-8?B?emVwRHlubXo0NUlPanRCOGV0YlhZbzB4cmtoUGNIbCtCdFU0VDI5WkozSXVy?=
 =?utf-8?B?WW9KelV3dkpVcGkwYkdqcUkwWVJONlVxdE1iQU1rQnVZOGdGRFlydUw3Kzdh?=
 =?utf-8?B?eDlDcDhwdkYzbXA5dnQzNFZybm8vTjlPZGM1OGFYamdib2tSTWw0QWw1VVpM?=
 =?utf-8?B?NnViOTErZENIWXRGQURpRm9DRWlIQ2U3d0FrbUViT3MzQnd2am1MSmZ1T1VM?=
 =?utf-8?B?NXJlaXY5WnpyMXVHcFRobDl1eU9uYy9SOGhSWWxKOGErOWlOci9udmZML0ov?=
 =?utf-8?B?YnBIU3dZS0NlL0dORkthQnhlM1UrbExtN2dnQ0dCakRHRWczYm9qZVBnK24x?=
 =?utf-8?B?Ynl3QWFxL2piM1RvZVlIWUJYUmFrVFU5bytFMnZRVmRWYlJ0ZlJxRDEzZC8x?=
 =?utf-8?B?T3BBL1kvamFlemxMbm1QdFAvSFJhMEQvNWZueHRrcWthK1RaSm01dUMvL2Vo?=
 =?utf-8?B?WWVUS0hmY094bVBDRGRxb1A0b21MMG56RXFTY252R3hEcllHTFlMTXlpeU4r?=
 =?utf-8?B?d2taWUtCSmdxcmtxNDVqL3BXcWtkc1VIMEN3MGJSQVJTM1dnRTNkWmtqMXpm?=
 =?utf-8?B?RmpEL3k2eUo3Y1pFaTE1RXpoQTJ4Qmd0T2ZYQTkrNk9YTHQzSHFCUUlDWDl3?=
 =?utf-8?B?cVdPVG1tSndxeHVrcXd0dllUTCt4dGNXU1YxZTBUTmE5TlpyY0c1L3ZVUmw2?=
 =?utf-8?B?WGNZbFBEN29XU1RUanUvSzhyb094VC85MWNacGY1TmwrNWFJR3FXcmU5aGVF?=
 =?utf-8?B?US9BKy9yVmE4Yng5Zm90TmFVZzJQbTlvTUtzYWxTNmhiYjRESWltdUx5Q2NS?=
 =?utf-8?B?dWlhYkt3YllvTVBkZG1rS0EyTHBLS2h1c21vd3RqZXFzY3JYNml3ODlXbnFw?=
 =?utf-8?B?ZjBZK2dzdTJFSksrYlBtN3habmR3elNWWEhjelZUWkxoajNWMVFFQ2tuTEw0?=
 =?utf-8?B?TjQ0VUdobzU3ODJmU2dRNCtpUmNaUWIzakpiQXgxVUh5TjFHc0NYVzM0MXFB?=
 =?utf-8?B?UFdicXpzSjBieVQyWnNmMUhUd0NNVHlMa1NuODZlaGhlRy9IS3o3a0JocWl2?=
 =?utf-8?B?VmZJem5pa1V3OWNIQU5kMEZmaFAweElTQWNEaXk4QVdYZks1VkJnSk9adGFo?=
 =?utf-8?B?WlNId2N3U1l1MW9nUHRiOTB4NHVldEYvSTlqdTdVckxobzYvZ1h2czc0ekdN?=
 =?utf-8?B?eE9VTFBDc2tkTDVvaFdPbXpTa2toSVlDVnJReGV5b3F3QTRQcEpENUIxUyt0?=
 =?utf-8?B?ejZvbHRZbmpYUWJad3ZxaGRoNDF4STZEUG10SEhKMGM1Vnp5M2UxQUg0cVNp?=
 =?utf-8?B?cFl5M0JiaTMzcXVYSE1sSDVEVVBPdklhMXZIbGZmLzRuZE0wL3V0S3VSSmYx?=
 =?utf-8?B?K0w3MkxuUGZna3lXZTIzYVZUbkpsNm0yb1B2bnVFT3QzRkFaL1E3QUt1aWh3?=
 =?utf-8?B?MHRlNUtLR0s5ek5aakVocjl2dG5xbEVPUERRVXJmQ2xWaUhqS1h1Y2lYenhU?=
 =?utf-8?Q?d55ZO0kQIH2vWxpGBbzdqm//t?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da733f5f-07b9-4719-43fc-08de18010161
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 22:09:33.2086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 586U1OJx9IgOyVFIBI6UOJMlLFVbS5UqO7DWsG3yVhzzp1wxGdrsNk6gV1RdVMM2NrFTlXrrJiiaQZ+jrC8DAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF34483F4BA
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



On 10/30/2025 5:15 PM, Danilo Krummrich wrote:
> On Thu Oct 30, 2025 at 8:06 PM CET, Joel Fernandes wrote:
>> Demonstrates usage of the clist module for iterating over
>> C-managed linked lists. C code creates and populates the list,
>> Rust code performs safe iteration using the clist abstraction.
> 
> I don't think a sample module is the correct choice for this. It makes it look a
> bit like this is an API intended for drivers. I think kunit tests might be a
> better fit.

Sure, kunit tests indeed sound better. I will convert it over (this and the
other one). Thanks!

 - Joel

