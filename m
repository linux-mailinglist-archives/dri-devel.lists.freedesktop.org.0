Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70A1C842B4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 10:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6793010E395;
	Tue, 25 Nov 2025 09:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZBXnAqO1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013053.outbound.protection.outlook.com
 [40.93.201.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C3410E279;
 Tue, 25 Nov 2025 09:15:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1P6xviS/wUTuLDTU3EJ2OCD03OTBqaeLgMmRcK/XgbcPq+ZvGP2YjrBeh4Th8cPnB3fIJR1cCcCB+B6V0sfCdq/OEmvVnBFOWxroGZTqF65zuyC5HMAm1Q0X58Ew0kNNAnw0fSeT9ZD5ziaFqRtUAXwHLrq5l1Q/aTlMcD9y0tkDi8bHE/CvVELHhwOYahSER702D7wZquPdFAbMv+xOprBkzbeTtrOon98Y4BTfu9DzLYpeboNlr0OIjRzZn6LfDQkYGobN1MYr/XyN6ipQmwtaP4vfQfPMJ18qIa3pbz6BbkKrn/p44N6p/k4rwPbwGqVZclryY+Z88AAzM6D0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Xpk+I2Hgnvq8ObO2/3+0eVLHo6YnN08T5IJ2QBmG9U=;
 b=lKNbpDGrAXOcQzhFExAGTJKh6iSmtgaPFC858DLjh8kUye91jkwuPFEdEDzLOccBqLop/BXz6zTrfkKiXkBhNr8iSGwLoGazfWhGZk4UimxKDL/CAZbbAoJ6Bsm/6U32gKWfzYaFk+PKK7OVzVJlf/5KVIEqmu7Urm7TADPuqlUQ6qrOhr/b8IWyP/MUZ+BlT5iiNeO+0Zy8d4eaKgNzmyDY0v1ouIjFnvRIIPEksuyt1i5DQuFS5Q4RC4MNS4Gef0lss2hCARoGX6sO0oy0uDzTr1kgcnMCRU3h0p6AMCcf4XOxLQWnfWvYJnvJoqNsbch0AD901MtR4zZSY0ARfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Xpk+I2Hgnvq8ObO2/3+0eVLHo6YnN08T5IJ2QBmG9U=;
 b=ZBXnAqO1o+8XETaNquKDMJEDmuiiluOiPAFXKscoaPNt8yrEjbLAVwoaAhy9oWTN5H+vHg3/QvTde1kd03CVK6BtDxTNU4a9/AbVyTV+iWNpmWHqAKs+cvDpjv9SYtUrDJfTpG4vY8SSgY/oJZEVZJeJdFonY7LyGiNeaFQZ9YU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB7495.namprd12.prod.outlook.com (2603:10b6:208:419::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 09:15:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 09:15:06 +0000
Message-ID: <cc0db376-6cff-45d7-b3a3-d13be664700f@amd.com>
Date: Tue, 25 Nov 2025 10:14:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: Move DRM buddy allocator one level up
To: Dave Airlie <airlied@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20251124234432.1988476-1-joelagnelf@nvidia.com>
 <f73e4536-ec89-4625-96d4-6fa42018e4e4@amd.com>
 <CAPM=9twe3xcVBgrNCT+1_pGECPL-ry_aA2dxBwbKVeai4+S7AQ@mail.gmail.com>
 <24d4f02b-8ecd-4512-a1f0-ba41684ede1d@amd.com>
 <dfc50417-66ce-44ce-b607-917d678c5631@nvidia.com>
 <9f433dee-7ad9-4d0f-8ac1-e67deb409b70@amd.com>
 <CAPM=9tyN_A3oEyQZCOWaLO1orO6oKX0ZukJHR7cFy12Go+7d=A@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9tyN_A3oEyQZCOWaLO1orO6oKX0ZukJHR7cFy12Go+7d=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dbbc355-7ff1-4f97-0206-08de2c031f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3ZQUVFYdHVpY0svOGdtU0dEeFVuNURSWDhHWVNKeWFFOXAzMnd5aWlZTmtH?=
 =?utf-8?B?SWlTUTlhUUNlb2lpNmt0UlJsZGgyVGJ6R1JsMm00Mkx6NFRIQzgwQW5zMFg0?=
 =?utf-8?B?OGV5UUtYekgwMnhqMjlaZXk3WWRkamRDZDduOVpyWjhpVGsxSmd1cE5mYUVv?=
 =?utf-8?B?aC9vMFdkaVJudmFKWDlxOVNjYldqUThVYWd5UDJlRFhMdFlwQXBVM3RvNWdx?=
 =?utf-8?B?YzIxbFdSaFZJS2ZQd09NZHhYaGtoSklQdGJoVG9McHRqbEZ6UWd1aXBHeFpr?=
 =?utf-8?B?QW5YcjRjaHl3T1ZFV1QxMFpUWnlPK1dxa09hbjNvNUlPMld0OTBZMDRBMnZ6?=
 =?utf-8?B?NGVyNGpla1NUaHJFS3VaR0twUFdPVSs2V2t1bTZ3S1FOVzYzeDlqejhraThk?=
 =?utf-8?B?Z2hOMVhGQWhZdGhheXlGbVl0YjhQVW1LMGRQbUdjVEFRSXQwUDZOSkwyZDZF?=
 =?utf-8?B?Mmhzek9Vb0xRbHNxdUJ4cDR3NGlwUDJhSnJ2N08wemJrSFZQMXJHTjY0Qnl3?=
 =?utf-8?B?R2FITld5S3AzVi92MllaR1EvN3psQ0J0NlBoY1dLQ3J0TUxGUkJaTnFCQTgx?=
 =?utf-8?B?Tkl1cCttUHlUaFF2Qnc5aDBuM0ZUVE5ZRERmaGh2Zmozd2hoWnBPR2ZlSjNs?=
 =?utf-8?B?Umk4TzRxUDZ4elhldUF4OG1vVGkra2xyczhpanVRNUF5WU00V2d3K0dWWllG?=
 =?utf-8?B?S3VodDZaQjFLSHVMSW5mWEMvcDlOczV5bU9GaXFrOHBxaW5mK1B3YW9RekNw?=
 =?utf-8?B?YkZTT0VTWGxweWQydVRzT0N5U0NWQXFzRDY2MHVUOEd5SzVPZVJPQncyblBG?=
 =?utf-8?B?VXlCcWhpY3pQU2s4N3Y0VUJiN25vbkUzWHp6anlwWXB5WmpxWUpGV2FuVEY4?=
 =?utf-8?B?WCt0QTlLOGxDYm1OM0ZXcU1TeVB4c2xCOXRBUG16VmpZS3pzNTFhck9jQ21J?=
 =?utf-8?B?T3hHellzdnNrWWVNb2VPb0I0b2NNWnNMWU9sWUYreWZobGFuZmxjRDRGRm1m?=
 =?utf-8?B?MVlsYmJQN3RwdE96Z0xnVm85L3loZm8wNlpScVVyK2xUb3FiNEh3YlE2KzhH?=
 =?utf-8?B?bmpRdVhaZlNvalBMZitwZFlwVlhILzVNUXFsYUVOVGdRS25BZFZmejFUeVhR?=
 =?utf-8?B?Z1RVWUpHWFE0NnNwV01RQ09tcXFiY2IydGJLOWU5bFdRbTZyN05LeUI5dVBR?=
 =?utf-8?B?ODkrY3pJZS9obGZtYmdFRFNiMjAwVFNpdFlhQmVJYTZXbEZPYTFCUVVraVRk?=
 =?utf-8?B?c0g0Z1VicHBzcXRJdmg0eDdaY2NlSnpWT2ZUcHA4amZ2UXBKcWhOWlIyakdE?=
 =?utf-8?B?ZXo3U0RmMzdpcVVnUVNJMmxNNkhoQTAvdGxORmh5Y3FDZ0lBa2VGNHpKQjFB?=
 =?utf-8?B?bHJDWm1rbG10TEVjR1puWms5dkkvTEk3VTRRM3dTR2ZwQVVuS28zOHFZQ1JW?=
 =?utf-8?B?TnBUKzR3c1FnVWpCMXlqRWZFRnZiNVcrT2k4VkRoYmgvSjdNbUV6WmxIVUhG?=
 =?utf-8?B?UElZU3V6WVpoK3lIUmhVT0tDVVdjL2hiOFhvU0lNaWFHUlM5dnJhdVpUK2tL?=
 =?utf-8?B?WEJacGxsRTVPNkY0YStvL09MbjhyVnJQQzFKSzJJdmRjS3AvNTRKYngrcVFV?=
 =?utf-8?B?eGtWOWJhOVBFQ096WWVpQW5Ga1VHUjhsYmU4WkZtMHp0dmZNc1o3Uzg0ZzBZ?=
 =?utf-8?B?SXROTW54WUJnWDdxTVNXVnkrL25zUlVjZnNPZUxOSlBPKzR3SUJsK2JJaVhR?=
 =?utf-8?B?Zk4yOC9NbVF2MVJzRDkvMGN2TU1WSFZ4QkNZNFlGV0t2Qy9UY3ZEU1l2Y2F5?=
 =?utf-8?B?emFNNzNKNGZoeHdGQ2ZHVmpjNnNleWVVQXRKbWN5VzBzc2thbGo5Tm83OExC?=
 =?utf-8?B?UHQ2SzFMUm0vdUM4S2ROeHNpVE5TRUg2RStRNGxPam9idkx5K3Via3lid3pN?=
 =?utf-8?Q?+G3qrs/eHZkj+YOdT4COoeTrjuhCKvJC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzZrMG9YWHpWeG5pVitpdXdJRzVZQm1hZ2h4T29jYnVzNjdQTWo2TW5kaU1y?=
 =?utf-8?B?S1E5SDBJZy9HT2tEOU5Na08vVjJPMHJFYThja093Q0duUnhsQ09EbDE1NU9V?=
 =?utf-8?B?VmI1aTV2VkdmT0lBOVFzY0FvVmZWdWErdzhsZExWM0FMbHd1dHgzd0RmUStN?=
 =?utf-8?B?U0VRNWdQNWcxOGs5U290YWwzZGdqSm1LbUtLTzdrR21MY1hPMnlNQS9reUJh?=
 =?utf-8?B?UGd0ZTNSQVhHd2tRa2x3b1ptamdaZzZzUEVKTHl3VUtVa1kyUTJOaWxZOWU0?=
 =?utf-8?B?a1JLeUNsTmdTaGFmS1JTSFNOTE55VUhyeEtJeW9xbEt0NlNwS2tiRERQSWtT?=
 =?utf-8?B?MlFtOEI4SXFOOFVrWDlYaGpCdUJWclE5M0xQQjc0VHEydlF5Sk5IWFdZbUls?=
 =?utf-8?B?c3ZWQnpnR1dpQmF2ZGlHamZBU3FuRnNGVEVyWWxLSGJyRGpPVjgrcUpJNEJ4?=
 =?utf-8?B?T0xmZkZCaGYrNnhLYlg2a3RKM0dQSU9yVjNEd3orOEJyd3FFcU5oYzlMS3Bi?=
 =?utf-8?B?Z2FGUlVGSDdGTWkyZDlmd2ovejM2OUtvSGxlRlkwbE43MDRSOVMvcGxVMnQy?=
 =?utf-8?B?SWNkT25ITnkzVU1XUXZSajZJaFowVTd1anBkMnl5SDIrcE9MUjVpM0ZpamVK?=
 =?utf-8?B?YnF4d2FXdzJpOEo2Sm9odjc5ekpVMG1XbU1OM3NtL2tnOXBRMEw1YVZUQ2Vq?=
 =?utf-8?B?NEYvUmNUeXZyckJkUktWcnZxaHcxTlk0ZkhzMzhZR2ZuOHRqYktRSzFMay9K?=
 =?utf-8?B?TmxiMjREd1lTRVk3VlptampldlNXYStUdG9qK0JEMWhENkFXSXAzRjhvL01D?=
 =?utf-8?B?ays0VXFyNjlOU0pHNFFMVytWL3FHT3EvYWd0MUtPa292SmwxMS9pSjNwem1l?=
 =?utf-8?B?cjBGUWtjdzJpbVlzejJFYmdtR3BqY1dLWDlNRDhFUU1BVVBJR2dXeU56NHQx?=
 =?utf-8?B?WmlFVG5wN2hNUk1aV1ZRY0tCSUUzZGJXK2ZMMk1ETmpJcDA2WUdPUGl0UjR2?=
 =?utf-8?B?RUEyREI1Q08xTmdxTDlRQ09XOW1vWk4zTllldHdqZ3RSVGdweWdvZ2IwTlJO?=
 =?utf-8?B?eFg2RC9lMXVSTEdxZmJEQnRJVkQ3cmtKdjYyellyWkJ6SGtCaGhtQVkzckUw?=
 =?utf-8?B?d256OTRmd2kxU2pkUlJPTGlyTmpjQWNnTThDUDIzYTZzOUU3d0VzaERKUUZj?=
 =?utf-8?B?MlJjWnJHMk4vMWF5Y1lHM0VReWx3RlRqNUpza2hNbnFpTmtleElWUTFWOEQ5?=
 =?utf-8?B?SmJTTVZXK3gxckFXa3FRMkRQRitrTmZGZVV5TmJGb3I4UTZBMm1rRkpZVW5Q?=
 =?utf-8?B?d0l6TzFjb1RaeGkyU3ZVYUNJMzcwS25YY1FJOVhYTGZiM2FJWGxKTVo2MmxR?=
 =?utf-8?B?cGRsckNFVTdBRDZvK1dOL3F0SWZiOCtDbTB5dnVQKzc4bFNoVXJidGphS0M5?=
 =?utf-8?B?Z1F6VnBxQUxQYnVnZXFWZ1czVG5PK0c2U1hLcWdjQnJzRW41T1hiSHNmVk8y?=
 =?utf-8?B?M01KTGNpVm9ZZEtETTRzQnpqQ1F6MGIrZVIrU0dPRUZrR3ByRU9ESmVNVmdv?=
 =?utf-8?B?NHRuV1d4NkNSbStPcXNnRDhMby9CVGY4T0tlTEVpU3B5WE5tNnhENG1ObmF0?=
 =?utf-8?B?eElsTG9EOGlEUW1aOXAxc2lNTXZjd0lndTEzNDJpRlVVUE1LWEJkVEtPRXdp?=
 =?utf-8?B?UjUvQWZZZWcxOUJIMFowOVEyRUtBTkJJZzdWby9FWitubEt5SDliZXVrLzhq?=
 =?utf-8?B?c2tNVmQ1YzQ0ZDhnL2s3REpiS0h1VXdBUVM1dWdseXhPRDM4SWozK0QwUUE2?=
 =?utf-8?B?VjIrWnpGa2R5N21ySG8xWUVvckR1LzR2a20rQzdGRnEwNFBNeG90SjFvSjFa?=
 =?utf-8?B?VzhxNG5GRlBBNFpIc2I2Nm1pYjU4VlZuSGVYZXFOeVRUcC9sbDZKeHZLQ002?=
 =?utf-8?B?Q2t4V002ZE5xVmlUNVp1R2lGMTYzQzN0OVpua0svT294M0d2VnYrNGhTOWZ1?=
 =?utf-8?B?ZjZpRy8yZlpPM1VBc0VUejVMWHVubEpGV3k0Ymt5UkFkZDVvbGVCakVyRW9z?=
 =?utf-8?B?SHNoRmpJQ3hNT3VjcXE3cnVOVGZWMkhCMWhrZDRReEF4SGUvdG95N2pWQTZS?=
 =?utf-8?Q?awW0nBhtNwwtSFa2+9qnMdQrn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dbbc355-7ff1-4f97-0206-08de2c031f7c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 09:15:05.9602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0Eh8Jn3xZM9MmCA/PopmWBwpACAbpQEcFiAyZzWQqo8FjPLwZ6p98H7phoKvEBO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7495
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

On 11/25/25 10:08, Dave Airlie wrote:
> On Tue, 25 Nov 2025 at 18:11, Christian König <christian.koenig@amd.com> wrote:
>>
>> On 11/25/25 08:59, John Hubbard wrote:
>>> On 11/24/25 11:54 PM, Christian König wrote:
>>>> On 11/25/25 08:49, Dave Airlie wrote:
>>>>> On Tue, 25 Nov 2025 at 17:45, Christian König <christian.koenig@amd.com> wrote:
>>> ...
>>>> My question is why exactly is nova separated into nova-core and nova-drm? That doesn't seem to be necessary in the first place.
>>>>
>>> The idea is that nova-core allows building up a separate software stack for
>>> VFIO, without pulling in any DRM-specific code that a hypervisor (for example)
>>> wouldn't need. That makes for a smaller, more security-auditable set of code
>>> for that case.
>>
>> Well that is the same argument used by some AMD team to maintain a separate out of tree hypervisor for nearly a decade.
>>
>> Additional to that the same argument has also been used to justify the KFD node as alternative API to DRM for compute.
>>
>> Both cases have proven to be extremely bad ideas.
>>
>> Background is that except for all the legacy stuff the DRM API is actually very well thought through and it is actually quite hard to come up with something similarly well.
>>
> 
> Well you just answered your own question, why is AMD maintaining GIM
> instead of solving this upstream with a split model? the nova-core/drm
> split would be perfect for GIM.

No, it won't.

We have the requirement to work with GEM objects and DMA-buf file descriptors in the hypervisor as well.

And my suspicion is that you end up with the same requirements in nova as well in which case you end up interchanging handles with DRM as well.

We have seen the same for KFD and it turned out to be an absolutely horrible interaction.

> kfd was a terrible idea, and we don't intend to offer userspace
> multiple APIs with nova, nova-drm will be the primary userspace API
> provider. nova-core will not provide userspace API, it will provide an
> API to nova-drm and an API to the vgpu driver which will provide it's
> own userspace API without graphics or compute, just enough to setup
> VFs.

Ok, then why do you need nova-core in the first place? E.g. where should be the vgpu driver and what interface does it provide?

Christian.

> 
> Dave.

