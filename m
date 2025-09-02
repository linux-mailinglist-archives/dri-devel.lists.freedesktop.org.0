Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0A2B406EE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFCA10E774;
	Tue,  2 Sep 2025 14:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gz4I2Yt/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283DA10E773;
 Tue,  2 Sep 2025 14:32:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6RRBKJjeCA0jRDmtTXlLx8wXpbujv6Hf3MtjsgezxUHrE+fbe/IphMdmAsN+c2vICI+IXwOKoE7y36AJ+58H86CZqYcikubWOZU6gcWPoVsqTAWgKvag9AsuHJXUq8SS28jqqQA+jSglN5lC7Kqrj82uI4iJVvSse+aUxNk69MWIGAmtKmaLs36T76JySXNfvfY7fs0GPZWOKBHd82E3meaIS5HDP+6FyExO+5EQ8emppMt4aKVkLnEWUNblJz1i0je9XCx2T4THKwD2axEoUGTrVajhounepN/SZOy45Bw55ScMfEaWXCl761/Dhp19pflea2BVMIsoOAKVWS5BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKuP1xZEp8S7MTcHmXkB6YHwGWZSJSmFQMIlbbsNLRc=;
 b=xq+S6LJQsbCi8rMIF2Ew83tjHqOhlQj6MGO9eFJqUVD/uAi5iKQNOCXcIdKy9qqseyqN6Bo9bDxnEQVey7y8M7VfQeBYh88MrUzHBDANu5MV++wWqdytIw2PItAeE2xGTuYmoN3kCOSIOMQCIzJyS7suvug3+oOO2fywaJb+UFcPGGctNqHfkK7NsdtinZ4luFQm79Q6Ad/KbIzzJYSc+8DbowNgEJqH5wvpuhiJDZDkNWujNZ4Yl8dVB8RQn9hCgwAVJksFaygwqXxWzfd/qkALyUSH0B3JouH8CM0dZdhArPcyKrMGPhRsorKp0Rrp/UNiL3Xth0eOxnMZwTIquQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKuP1xZEp8S7MTcHmXkB6YHwGWZSJSmFQMIlbbsNLRc=;
 b=Gz4I2Yt/8Pif3cFRJajptMmDYTVq9VFvxqIRtUrHm4YNAzCX+QDY9TWKkUsZh8gKsNAwIA7F5OUPj6OWNvYyJpfd/4nZIx3zkroYCWnX7peJ79UP1xlUr6M6g6tYt2V1Q+zjY6B6Cejnb0sqQ7K0tXb0xveKuCIdOBdNdcsKW8pMS0E70PhYdBx8JmHJmm0iCqgzXHGo5azIG/ORlJCt93WUBa5tUDuhI5T/YrlCqYVIDpa0RwskrreSHl04Kdbz3/D9pg+6W0ecNovIiBRGarxewbK1IdJXzhWg2m/HVvX3eT3Ni2bQYIefklAltsX8Io7qTxcRXMAfrvvseQPECw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8955.namprd12.prod.outlook.com (2603:10b6:a03:542::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 14:32:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Tue, 2 Sep 2025
 14:32:43 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 02 Sep 2025 23:32:05 +0900
Subject: [PATCH v3 11/11] gpu: nova-core: compute layout of more
 framebuffer regions required for GSP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-nova_firmware-v3-11-56854d9c5398@nvidia.com>
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
In-Reply-To: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
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
X-ClientProxiedBy: TYWPR01CA0002.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: b1544472-735e-4c25-6970-08ddea2d93ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXI5cEExb2JIMU0rMFlJbG5ObEtidG5CVG5vc2hUWUxqS3dqaXoxUTZHdHR3?=
 =?utf-8?B?QU4rVTQvdDRsVzA4YWVQT2RTTEErbXJaczlDc1lwSUJOUVpoQnhWMzhoUUFk?=
 =?utf-8?B?T2tKQW9IT1kvdU1jaGZKY0NMa1EwL1FOVzBXNXE4aDE2c0pCdURxOTM5Sjk5?=
 =?utf-8?B?MDh3REdWR2pRWTdnYkQ4SUx0NzladmJwUE1zTDN6eForV05XVVhiK0I0b0pU?=
 =?utf-8?B?bzlZUytrNm5KZS9xSGdlMnlqaWZkd1E2dTN1c1YyYjRkdUFaV0xqclNra0tw?=
 =?utf-8?B?c3phMGxxeTJQYWgyU0hhYjJ4NU5aU1BDYS91dkc1WnpNeTR3N3FiemtTUEtx?=
 =?utf-8?B?TG53Z0kvb1RtTUY2SnI4SHd6ZGhoQXNqamRVU3dzc0lBSW12NlpNS3diM0Fu?=
 =?utf-8?B?bHZ5N09MQS8yYmhmQ0s4VHhMbUNxMlBXZE14Zm9hb3dOT3h1MjBoSjNrU3Vq?=
 =?utf-8?B?RGJpTGYycnBaano2TGFBVTBWOXR0VDZxOWFuQmQwZ2tpN1RYaFkwY3RqV0pE?=
 =?utf-8?B?YkJUdzJya0ZVbUI2cmRnTEVpc1BQbE5lT09xZHd3OHdFZDFjVGtYS3Jxa1Vr?=
 =?utf-8?B?UmRrRDNqUElrV1VlOW4wc1l1SFg3VzhZN1AyajRtUk02aVFVUmdhSDdKUGpC?=
 =?utf-8?B?UHNMdGUrTE9PUlE3Sk1rZUoyK3pzUzQweWY0SllPeWJSTDNyb2NRN2dqc2N6?=
 =?utf-8?B?aXQxTktoMnBNWUE0N2UzMzVHMGRtdlB6Snc3OVQwd1hDWkpXMFVpVzlGVDFL?=
 =?utf-8?B?SFhBdDF5cGNTODE0L2E5dDdjZUxrYjVXODBmU29nTTVBMlBOSnRWOG1ITENW?=
 =?utf-8?B?cU91YldueG92NnhZNFdvWjI2SHN3S2dObk9xaFROVjdXNWwvM1pTYndHMVBC?=
 =?utf-8?B?QS9HcEhIaXJNSkxwZ2l0YUdJN0o5a2lCVEJsbFdleDhnVDJlci83ZjBEQTc4?=
 =?utf-8?B?dngrR21pMXF3SUYzcG53cXlxRWl4VGVibzdJKzJwbmxqeXlQbW9oT05oaXNF?=
 =?utf-8?B?YmNKNzc3RjVRL2UrVEkrcnZaZnF4a0hpWS9hdkF2azZNTFhqTVRCWDJTbklz?=
 =?utf-8?B?c2Q3a1d5aHE0YnhOVlM0Y3FpRVlnazJYWkhreG9tYkhRdmFHaXBSYVFjQ0wv?=
 =?utf-8?B?QlZOMTFNWjU3RU1WUHJ6UmFaUk9UUElGNWJad1E4bHZiQUtSWFB5V0Q3eDBv?=
 =?utf-8?B?cUR3N0h3WEs3Q1UxNXRrcFZ3MnUrK0hqZ1pnYk1CY1NvcG9Hb09yQjBVK0Nn?=
 =?utf-8?B?TE83SkZEYlowaGd4RTZkQnJlR2ZyQVowWU1DWVA0aGYrcHd6VEZhM2ptZHNB?=
 =?utf-8?B?cEJkYnZjR1Q4aFN2bERMRnRMbEJ1d0NLdkF4VVFrcnFxZFlBNzlYZEVSbFR1?=
 =?utf-8?B?cmpYUWw3VWs0ejFQeEFBZUVnWERzemx3V0xqSGVkZ01PbHBiTHR5b1UxZUdW?=
 =?utf-8?B?TERkNmJKWEhqR0NrNHYvaTJBM1Zsbk1pbTliaWVoL09ob1Q3NVNodXJqeHZM?=
 =?utf-8?B?TkUzcjh0Z1BwS3VOdm5vT2pUUVp0TjZucFNyTWYxSHQvV0V3aWk0NXdTL2Zs?=
 =?utf-8?B?eVlLTmN3T3NuZEV5Zzd5eW1aQ0g3NTZtSEVHNGMxTDhYUVFDTkhjWUF4aDNZ?=
 =?utf-8?B?TmUvaTB5VTZ5V3A0WGFqQWx1MEs2N1NIRG5VTVZrakVyVHFQUWRsK1hsQVlF?=
 =?utf-8?B?OG5iUkJLSkxkZ0NMUFZ4U3RKV1ZYNVk0SGw2c2xqZTR2aFgybzAzSkZxYVAv?=
 =?utf-8?B?TWJjWTAzWFpMWnNINE83TlhmSW1ic0ZWYkgrNFp2UUhpSDZvUE5nZUdhNGNT?=
 =?utf-8?B?OFovRWpWMTNSeTZWUmdCbGpOeU9GeGRieVUrSmp0cFE1a0JoUnEyU2lrOGcy?=
 =?utf-8?B?OCtGZWhTeEJocmU2UFhYTGkrQ2MrWC82c0RnaGcrM3Q0ZThxdkk2YjFPZXVU?=
 =?utf-8?B?Tjl6aEU3d0sweVJJb1JwM1ZuUXVUZ3NiK0VUc3V4UlhaRDlSZXVNdEo1a1Ey?=
 =?utf-8?B?MlFzazVFWVZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEdkUUQ1d3pQTVlBa3VNMktRWG4zWVduZnFtckpxcExITjkxTCs1VFRzWFdY?=
 =?utf-8?B?UGpoZ0dpeWRiOWliM25hNVo1NEJTWVRGb1FzTHVKcEx5cllQSlpaaFp6aFh6?=
 =?utf-8?B?VmFVZnVpYWpzYUVtWlUybU1wZUY0SGZUSjIzMktpWkE1U3hmOUwrVTBmZmpS?=
 =?utf-8?B?VStHSHJkLzN1SUdCeDhHU01tMHlZV3BjWjg0MXhJWURtOEZ4QUxVOXM0UlhO?=
 =?utf-8?B?dWN3czUvZThNRHZhMVVPVVAvL0phWk1sNjI4NUdvNENGLzhITnc0TkV5YU10?=
 =?utf-8?B?dndsNmkyVEY3L3ZEbUd6Y0ExSW96aWw5MFRBTlQ0QVBpaFJvVms5akVyMXBv?=
 =?utf-8?B?OEo3THVnekFqd2pyQnhXVHhVU2VpR3dsamZ3ZGY0dmlCYUd1dHR2eVdYVmI0?=
 =?utf-8?B?UU85R2E1V0FSSDQ4MUdwUVlYTlQyLzFDUk5DNktqclRhcHZrTE41Z2VwR091?=
 =?utf-8?B?NWNZbGhUSTBuY3kwY25CYnNhVDZJQVB0a2tJQjFzcXdXWnJyQXU2TXZ5QWhE?=
 =?utf-8?B?TTdGWTJocUI2anpzcThNTkFxTzl3WnJTYmllMmo1b1J6aUNvcDRWWCtxNEta?=
 =?utf-8?B?eHBnNkV5dEdudDlGYy85MUhRU3FiV2FveGNtckRTUldQeHRvYW0zajcrTW9W?=
 =?utf-8?B?anJDVFY1SHF4UTNXUHNxVkVOamtHMGxIcEdvZnpOd1RsMis0QWhWNUkreVM2?=
 =?utf-8?B?RjRrMnFzazE5QXJQOUlpd1NGYlNjM2FCQ0JjZ2hZVHRuMHlLcnY3TThZWVM3?=
 =?utf-8?B?SldWY2ZPc1BQeHBYTHViMVNDZkJEdThSUks4aEIrQ3FxTGdDVkpUM0dlcmlj?=
 =?utf-8?B?SmdEbEUxWS9KUzQ1TkhlR3NZQU5BWVp1aUdSTU5WTDdmSFFMUGFVMVRzcmZu?=
 =?utf-8?B?RDd3ODQrTGs4OEovM3Q5QnhoVi9zZ09GTTQveEtwZUtzQnZVeUJWM2FWczBz?=
 =?utf-8?B?bFdVZk9CZWpjd3FVT09Ca25wdkkrbldyN2NnaStPTGtlZ3M0dE1PTkF0TTc1?=
 =?utf-8?B?Z056TGxkK2daZk1BSXg1VHdzMnZMYWExV2VsbkhET244ZmExQ0dPQmJORW9Q?=
 =?utf-8?B?RWM5YktyVVc3cVExTyszYytxc1JXd2hpb1poaWdka25oSHFTZmVqYTJaWXhN?=
 =?utf-8?B?QUhramJSaGt2Q0cwMkNoOVZHb3l4MnhVL0duaWNMUzlydU11Q3ZYcHpYRTBx?=
 =?utf-8?B?Ymk3eHVyKzBnQVQ5bVZYV0haT0xIbVFFUHUyYi8zUXBubmVZK3QySkY1b0t6?=
 =?utf-8?B?VTZMb1VacFJ0OThQdkw1QzIrY2Q2OENIN1JFREpPZGNlQTQvYTlFeVlpeEdt?=
 =?utf-8?B?ZkdnclF6R1RhWXhyYk5wVEFIYlRBUml4Rzh2empwbVZYSDVMRjR0MU9TdGQ0?=
 =?utf-8?B?d1IwOFljWFNjQjZ4UVF3RldlS2xrTTJwYStpK2E2RkFJWFNmMm1DMmQxemkz?=
 =?utf-8?B?cDhpeFYvbWNyUjVHVkRGdlk3S2xwR1I1NThvVTU2Y1RJQUQ0YkNtemRSalRK?=
 =?utf-8?B?dWdtWXBXUHFMMTZTbUpjS2Y2RmtQaDIrbmNvSEtrSy9ualVGVEtsM3lNNGNm?=
 =?utf-8?B?LzQ2TkhPZjN0TWdIVEtJVEd1aEVsRmNOODBJWE1aaGZRQzE3b1gySWc4M01L?=
 =?utf-8?B?dGUweXRIVHVrTXJ6YjM0OVUxQ1lWQmVsY203T20raDFwV0tIS2ZIVWwwVlEv?=
 =?utf-8?B?WG1RSWI5VHBjS09TdUZiUjFvMEtaYXpWYXM0aTk3Sm1hNWFSVzRONVFJTFpw?=
 =?utf-8?B?M1BSL0FMYW83a1IzdjVGWUgzS0lrS2NWTWtUWjNDb0luODFhWkVvWnFCcFhM?=
 =?utf-8?B?TXR6SUl0N0ZPZCszekhuT3A3NnNWOEdaT2V1ak5EMEtRajB0ZHFia3BqQ2Rq?=
 =?utf-8?B?TWxlLzM5cWh5aWpCMWk3elR2dDhVcEttMjNpODRQUGlZQjFaTkx6SVliZmgz?=
 =?utf-8?B?OVhLVjI5N1dXcDZRU0pUcFcxeERCS1ZqNVhCUStXNlJLTUZMTGFqZ3NINDZJ?=
 =?utf-8?B?YTNBUlpUZWZ1MjJISTF4Y0ZyOTQ0OWkxSEhoNEVaWTdDY0JUdk5RZFBqckkv?=
 =?utf-8?B?bDAwY3Z2RnZsU3J5YXYvR2syL1lLTkcxb09VNmROcFVtWWRTampva3UwTDJN?=
 =?utf-8?B?UkNyVGtKYlgvMzNZWXNHTllmRk9kTXZ4WWtoNWlaSGhwSTM2VzBHaHNKK1ha?=
 =?utf-8?Q?GEFZu1N7zIwK8BpOZnXszi9RLbAdzpM56+5R+jzHIlLA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1544472-735e-4c25-6970-08ddea2d93ec
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:32:43.5403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWs8lE/QzmgOFXQiwBxo9XuZ/K18FrTe0BhRzZee2bcBZMfBbSvKI/wKSNNV9ufQSY5VNRs5lUe4Y/aszSL2gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8955
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

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs                     |  64 +++++++++++-
 drivers/gpu/nova-core/fb/hal.rs                 |   4 +
 drivers/gpu/nova-core/fb/hal/ga100.rs           |   5 +
 drivers/gpu/nova-core/fb/hal/ga102.rs           |  10 ++
 drivers/gpu/nova-core/fb/hal/tu102.rs           |  11 +++
 drivers/gpu/nova-core/firmware/gsp.rs           |   2 +-
 drivers/gpu/nova-core/firmware/riscv.rs         |   2 +-
 drivers/gpu/nova-core/gpu.rs                    |   4 +-
 drivers/gpu/nova-core/gsp.rs                    |   3 +
 drivers/gpu/nova-core/nvfw.rs                   |  86 ++++++++++++++++
 drivers/gpu/nova-core/nvfw/r570_144.rs          |   1 -
 drivers/gpu/nova-core/nvfw/r570_144_bindings.rs | 125 ++++++++++++++++++++++++
 12 files changed, 310 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index b0e860498b883815b3861b8717f8ee1832d25440..8f75d7fff99f845cd6ba0d9c2734fc556c0097bb 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -10,7 +10,9 @@
 
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
+use crate::firmware::gsp::GspFirmware;
 use crate::gpu::Chipset;
+use crate::nvfw;
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
@@ -138,10 +154,54 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
             frts_base..frts_base + FRTS_SIZE
         };
 
+        let boot = {
+            const BOOTLOADER_DOWN_ALIGN: Alignment = Alignment::new(SZ_4K);
+            let bootloader_size = gsp_fw.bootloader.ucode.size() as u64;
+            let bootloader_base = (frts.start - bootloader_size).align_down(BOOTLOADER_DOWN_ALIGN);
+
+            bootloader_base..bootloader_base + bootloader_size
+        };
+
+        let elf = {
+            const ELF_DOWN_ALIGN: Alignment = Alignment::new(SZ_64K);
+            let elf_size = gsp_fw.size as u64;
+            let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
+
+            elf_addr..elf_addr + elf_size
+        };
+
+        let wpr2_heap = {
+            const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new(SZ_1M);
+            let wpr2_heap_size = hal.libos_params().wpr_heap_size(chipset, fb.end);
+            let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
+
+            wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN)
+        };
+
+        let wpr2 = {
+            const WPR2_DOWN_ALIGN: Alignment = Alignment::new(SZ_1M);
+            let wpr2_addr = (wpr2_heap.start - size_of::<nvfw::GspFwWprMeta>() as u64)
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
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index 2f914948bb9a9842fd00a4c6381420b74de81c3f..d87d285d75841134e58375772543344131d804b3 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -4,6 +4,7 @@
 
 use crate::driver::Bar0;
 use crate::gpu::Chipset;
+use crate::nvfw::LibosParams;
 
 mod ga100;
 mod ga102;
@@ -23,6 +24,9 @@ pub(crate) trait FbHal {
 
     /// Returns the VRAM size, in bytes.
     fn vidmem_size(&self, bar: &Bar0) -> u64;
+
+    /// Returns the libos requirements to start the GSP firmware.
+    fn libos_params(&self) -> &'static LibosParams;
 }
 
 /// Returns the HAL corresponding to `chipset`.
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index 871c42bf033acd0b9c5735c43d408503075099af..3ca46861ab4ffd267a50ffe04baad7e861fae04a 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -6,6 +6,7 @@
 
 use crate::driver::Bar0;
 use crate::fb::hal::FbHal;
+use crate::nvfw::LibosParams;
 use crate::regs;
 
 use super::tu102::FLUSH_SYSMEM_ADDR_SHIFT;
@@ -51,6 +52,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
     fn vidmem_size(&self, bar: &Bar0) -> u64 {
         super::tu102::vidmem_size_gp102(bar)
     }
+
+    fn libos_params(&self) -> &'static LibosParams {
+        super::tu102::libos_params_tu102()
+    }
 }
 
 const GA100: Ga100 = Ga100;
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/fb/hal/ga102.rs
index a73b77e3971513d088211a97ad8e50b00a9131f7..8f54aff4418316f7bdf873a64e695df97d0eda28 100644
--- a/drivers/gpu/nova-core/fb/hal/ga102.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -4,12 +4,18 @@
 
 use crate::driver::Bar0;
 use crate::fb::hal::FbHal;
+use crate::nvfw;
+use crate::nvfw::LibosParams;
 use crate::regs;
 
 fn vidmem_size_ga102(bar: &Bar0) -> u64 {
     regs::NV_USABLE_FB_SIZE_IN_MB::read(bar).usable_fb_size()
 }
 
+fn libos_params_ga102() -> &'static LibosParams {
+    &nvfw::LIBOS3_PARAMS
+}
+
 struct Ga102;
 
 impl FbHal for Ga102 {
@@ -30,6 +36,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
     fn vidmem_size(&self, bar: &Bar0) -> u64 {
         vidmem_size_ga102(bar)
     }
+
+    fn libos_params(&self) -> &'static LibosParams {
+        libos_params_ga102()
+    }
 }
 
 const GA102: Ga102 = Ga102;
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index b022c781caf4514b4060fa2083cdc0ca12573c5b..220e865242dcc11271d28860b2ea5834fbe00399 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -2,7 +2,10 @@
 
 use crate::driver::Bar0;
 use crate::fb::hal::FbHal;
+use crate::nvfw;
+use crate::nvfw::LibosParams;
 use crate::regs;
+
 use kernel::prelude::*;
 
 /// Shift applied to the sysmem address before it is written into `NV_PFB_NISO_FLUSH_SYSMEM_ADDR`,
@@ -34,6 +37,10 @@ pub(super) fn vidmem_size_gp102(bar: &Bar0) -> u64 {
     regs::NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE::read(bar).usable_fb_size()
 }
 
+pub(super) fn libos_params_tu102() -> &'static LibosParams {
+    &nvfw::LIBOS2_PARAMS
+}
+
 struct Tu102;
 
 impl FbHal for Tu102 {
@@ -52,6 +59,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
     fn vidmem_size(&self, bar: &Bar0) -> u64 {
         vidmem_size_gp102(bar)
     }
+
+    fn libos_params(&self) -> &'static LibosParams {
+        libos_params_tu102()
+    }
 }
 
 const TU102: Tu102 = Tu102;
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index a377c5138294c9cc70714cd18eed54d679aba835..61e664db38ad4f73d4a344ea3eeb944c486e24f4 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -129,7 +129,7 @@ pub(crate) struct GspFirmware {
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
     signatures: DmaObject,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
-    bootloader: RiscvFirmware,
+    pub bootloader: RiscvFirmware,
 }
 
 impl GspFirmware {
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index b7eef29956995c49ab1466bb6a71a756731bf78a..b90acfc81e7898ed1726430001d31ebbc976f9f1 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -61,7 +61,7 @@ pub(crate) struct RiscvFirmware {
     /// Application version.
     app_version: u32,
     /// Device-mapped firmware image.
-    ucode: DmaObject,
+    pub ucode: DmaObject,
 }
 
 impl RiscvFirmware {
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index b7798257e463a2a0e29e33a1e1076380de077bee..7bb0dc80d6e08c3c1b95ea13c5fbbee63153252e 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -289,12 +289,12 @@ pub(crate) fn start_gsp(&self, pdev: &pci::Device<device::Bound>) -> Result<()>
 
         let bios = Vbios::new(dev, bar)?;
 
-        let _gsp_fw = KBox::pin_init(
+        let gsp_fw = KBox::pin_init(
             GspFirmware::new(dev, self.spec.chipset, FIRMWARE_VERSION)?,
             GFP_KERNEL,
         )?;
 
-        let fb_layout = FbLayout::new(self.spec.chipset, bar)?;
+        let fb_layout = FbLayout::new(self.spec.chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
         self.run_fwsec_frts(dev, bar, &bios, &fb_layout)?;
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index a0e7ec5f6c9c959d57540b3ebf4b782f2e002b08..ead471746ccad02f1e0d6ec114ab2aa67b1ed733 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -1,4 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use kernel::ptr::Alignment;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
+pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new(1 << 20);
diff --git a/drivers/gpu/nova-core/nvfw.rs b/drivers/gpu/nova-core/nvfw.rs
index 779db25095892d6d88652fb7da243a8d2f7db047..1e0d134904fca3ac5a56b6828ff11894584029bd 100644
--- a/drivers/gpu/nova-core/nvfw.rs
+++ b/drivers/gpu/nova-core/nvfw.rs
@@ -4,3 +4,89 @@
 
 // Alias to avoid repeating the version number with every use.
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
+    pub(crate) carveout_size: u64,
+    /// The minimum and maximum sizes allowed for the GSP FW heap, in bytes.
+    pub(crate) allowed_heap_size: Range<u64>,
+}
+
+/// Version 2 of the GSP LIBOS (Turing and GA100)
+pub(crate) const LIBOS2_PARAMS: LibosParams = LibosParams {
+    carveout_size: bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2 as u64,
+    allowed_heap_size: bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB as u64 * SZ_1M as u64
+        ..bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB as u64 * SZ_1M as u64,
+};
+
+/// Version 3 of the GSP LIBOS (GA102+)
+pub(crate) const LIBOS3_PARAMS: LibosParams = LibosParams {
+    carveout_size: bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL as u64,
+    allowed_heap_size: bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB as u64
+        * SZ_1M as u64
+        ..bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB as u64 * SZ_1M as u64,
+};
+
+impl LibosParams {
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
diff --git a/drivers/gpu/nova-core/nvfw/r570_144.rs b/drivers/gpu/nova-core/nvfw/r570_144.rs
index 2e7bba80fa8b9c5fcb4e26887825d2cca3f7b6b7..bb8074797b550c7976a7432b41841c6bf61bf5f8 100644
--- a/drivers/gpu/nova-core/nvfw/r570_144.rs
+++ b/drivers/gpu/nova-core/nvfw/r570_144.rs
@@ -12,7 +12,6 @@
 #![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
 #![allow(
     dead_code,
-    unused_imports,
     clippy::all,
     clippy::undocumented_unsafe_blocks,
     clippy::ptr_as_ptr,
diff --git a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
index cec5940325151e407aa90128a35cb683afd436d7..0407000cca2296e713cc4701b635718fe51488cb 100644
--- a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
+++ b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
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

