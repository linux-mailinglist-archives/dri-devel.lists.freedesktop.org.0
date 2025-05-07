Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329F2AAE176
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A820910E7D6;
	Wed,  7 May 2025 13:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PhERHzll";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB0C10E7E0;
 Wed,  7 May 2025 13:53:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEnozplCMwhoXYVBy05LSNJb4dtSFqiKi7eO7NTIBeU6XniFQd8M+v1U4/nHbO4fap2eIaCVs1ECt43/6GTffnsmRzPp+TgC8UBJgliM9/gjBVpEgRHdwSh4bGpqSm0jxULJWrCG34EYtr2R7RWsrh90BMWaBwB91lXveAKBlPJGNhBeb0Sp8UMUzQBMDbTMQ8Xo5cakkwPbvqSsKLna0ixTAdKN5pT7IdKjYrlWVSMicFALgA2K4uAS9gmWQ+fy0tFegJmO+Vy8Tzy32k8l3SUPp3dAcz1Qx1fJ49/eWQw3wpq8FPQJ7yx4P3JYpyNY+pJM6mjgnmicbSXc/s8mAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWNnuwtK+MY6dWhVkvtki7vG3Mvek9EraXPvSOWh5CM=;
 b=NFsFqR9Tqr/2weHrY1Au0HERKCG+OzDsJBIcPS6EfGISMgUilep9VMgkferoiNj3w+1wiW6Jd4hUzEBbfMCsW71h1ZDfPVi9Qpww55R0tu+TnSbn6sJDamUlUW8coP9k/2gY9I8VdMyGPKBpRTjjtL+wZUGXA7d+MGNxyPQkG3vt8W+c7SIfFWds8nrO9nQOnS7wQwrAsAQADL4QZ2kg8+wqQyeVbbz8s/3UcRb8ySuqf/yVy+seWHp1ETZGSwrnN9502X6eOzcItzE4yZhD6WBDv4DxkcsNuxtOBagPlVuTCnvjXStoFHlxNd1rinbIEy05aXbOSTRnr7nXOICjwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWNnuwtK+MY6dWhVkvtki7vG3Mvek9EraXPvSOWh5CM=;
 b=PhERHzllCme6dtH8AMIrONxKPbPCnz2o2eHTGJshqaPHDacb5NcYwW6ekMWkl4nazH2FmLAsQDBnXCPeGhbMgOf9q0gCH7MdtFAyZGVljnX4pMLcVNNEXQloefxqbeUvB2g06/DWcgj1GJm+qn3wPKKdoreATcmca4gxrwzGPJmcTN7lRlVqLjRa8zlf0j7qOBZLsU+j5mgwbYYDLUPCHI8rcIDy71IB9AULy/jnXbW7V8DtxCrcZgzZ+4e/NcBbmMANjtxz0/3k71y8bO+xi8wpslCnZDk19oUeGdEkVqsFyhbO7XTzdCaNNNSpOUfRexr2Gc7VX+uTyQdVzrWgFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 13:53:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:53:42 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 07 May 2025 22:52:43 +0900
Subject: [PATCH v3 16/19] nova-core: Add support for VBIOS ucode extraction
 for boot
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Shirish Baskaran <sbaskaran@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: OSTPR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:604:21b::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 0582aebd-51b8-41a6-2727-08dd8d6e93b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGJJeWZteFpoS3NpZG9NM1dqTTNSM1pCSDRTeW9xWDZYZjRVS3UyMnpaMHFH?=
 =?utf-8?B?Q1Q4ZTEvZEZkZkFjZlQ0VnhXcm9QczhDaVY5dlhFZnY1bVRIeWZicTlEUjFI?=
 =?utf-8?B?dno0Rnp1MUNNMjV6b0ZPSnZlQXBwV0xLd21qSUh1Qzc1eGx3V3BEa3VSSGRG?=
 =?utf-8?B?Uk9SNG4wOHZTTm85VU9ocDluMHdCTFNCck9ES3NTQ2RlWmd1UG00TGFrODdh?=
 =?utf-8?B?UURoRnZNSFl6QnRveWJJcEw0M2JPSFByVnc3d2R5UVRnWDZmMVovYkV6V0JZ?=
 =?utf-8?B?MnFSdllvL25ucGZoRHdhVVRWVkpiUVNtKzl0WXNEcyt4WWFJTXRCejJ6TlZq?=
 =?utf-8?B?dDBUQnRSWGltbEpQWDRRMW1JTXNJTWx5eE5mL3lyemUrcHFoNHcyK3JwSjlS?=
 =?utf-8?B?VjY1MmRGblZtcjl5OTZZazVGY0U3SURxdG8yZWo1QjFuOTJJU3BKaXBQQlR1?=
 =?utf-8?B?K29MMkRnMmQ5bVRaVWdkYThiRUxKSjY0dXNmanJGS3RHQVhFaWh4dWJwbUEv?=
 =?utf-8?B?bStaNHJjaFZLOEhOMVh6VHJWdzViWW9hTmMrdkVFZERIRjI2Yndwcmh3Q0h1?=
 =?utf-8?B?L1JCNU9sc3kvMzBDWlNma2pod3UvMytKckFUV1pMU0hIZzNLdUZoNkpsdFZG?=
 =?utf-8?B?Q01ZaENTakJhaUpWNmNXeTMvam9XZEwzZjVoTGNXVWxaNjRBYjN5V0RVKzYz?=
 =?utf-8?B?RW5uN1VNdFhta01yMUFKbHBFbERENGNXS1dYRWRUYmJLNnZhYndUeTZUV0tF?=
 =?utf-8?B?ckJoSktZQlZ5ZlM5dVhhYkV3ZHJMSmxPalBiSFNWQzlDVldrQU1PQUx1R3ox?=
 =?utf-8?B?d2hzK3RVdTlLK3pkOEJVMyt2ODlRZXZnSXpIMkhFRW5OTjBDVUJFbXZBVUhN?=
 =?utf-8?B?UGdSczR5ajBnMm5VR291L0hqNWRhWjV3NFlDNGk5WFBMTWNERVBZL0lPK1Fy?=
 =?utf-8?B?Q3ZaMGlDQml6ZnB6Mk9yNzZPTlNrS2didDBEWklqV05SZnAyTFRvekxqRXZp?=
 =?utf-8?B?QlF4UWJyZUlGVlF6ZzhpREI0R0NLUURHdERLalJuQ2hRbnRXaG85cVQxRHRu?=
 =?utf-8?B?UkxDMjd1Z3lUc1JPYkdHNVlRdytCOFVTQU5xRzBkNkx1RlUvcFhlU0s2ZXlx?=
 =?utf-8?B?Wkp1K2R4RnRuRWJoL3U3T0lyV2NwSFBKWEt3NGVHYTVpMUFEZ0xsckp4bXZo?=
 =?utf-8?B?cWtDV0Voc0Z4WjA4ekZTUklLY0JhaFkwN0RrM1lyUFpsMk5pbjB4eXdnVHpu?=
 =?utf-8?B?RUU4WC9oZk5PSVRWNUEvbUFvRlV0SEI1cE90R0U5M1JlR3ZtTjBVVk9PUzRy?=
 =?utf-8?B?dDhDdEx3eHAvRS8vdlE4VEd5RHZMUi9nckVKb20zdWVVZlRibUw5dHlKUXYv?=
 =?utf-8?B?L0xlVllLcGpYeDVqalFsMjlyNmFCMmRlN25manBGUnpVZ3RleGs0cHdTUVBQ?=
 =?utf-8?B?RDBFNHZDeHNHR3RITG9lQnN2Ny90dWtlcHZqdzk0ZmxKWXBzTkxjb3dhVEZ2?=
 =?utf-8?B?cndSSmgwUW05YUFhelBUSmpBak95NUFJT2lqSCtkc0xZNGJUNDBzNU9YakdN?=
 =?utf-8?B?cXFCREhMN1hYM2R3WlF1THFhcE1SQWlTczdhT0tSeGJCU2tZUm5HVUhLVHB3?=
 =?utf-8?B?d2FZbGFSelcxSDFneS9zME1STkdJTTR0ZXN2UGxka3ZyOW15ZEtFZVZhcGtP?=
 =?utf-8?B?UVIxNndFK0lOUGsyNjJYM1Mzb1ZGa1VlWTZBNm0vZkpVcTBLZDdPQVFMeUd4?=
 =?utf-8?B?Q0Faak5aWjVITEpvMDJzMG5VVEsrOWJsSGhUWWJWSVZETzJBemw2bUNNa2dP?=
 =?utf-8?B?RFFyRFQ3Rm9xVnRtUEhZQ0VETldzd1pvZ1BNekt3MmZtWEM0ZU9UaVR1MzJm?=
 =?utf-8?B?WUtwbDlYbE9YdmpNa0RjdlBzTG8zUjQ4WnQ4OGVKM1RjdEtsZmRDVmk4TStT?=
 =?utf-8?B?SEZSTVd2aklBTCtrc29JbytaNUhWanlNZUxOcHVTV0tyNGZ2elB4eTFNRkU5?=
 =?utf-8?B?cXlNL29HNlVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z09INWxjS28yaG82ZHZHYnJyZzc2azd4b1lPSWx6UWRnVUl5eTVkS1lGMlMy?=
 =?utf-8?B?QWNha25YZ3lnelpYcTVDak1PUjBjRUw0QWIxYTJqbGVRbFpjUkVBWkQ4SG8z?=
 =?utf-8?B?aXNzMHFZU2dZRi9ic1dDVUdQMGZoK3JKTHpuVWRCdVkrTThKS3M2VEZ4dTJ2?=
 =?utf-8?B?bEtPNDVHL1BnUElvdG5oa3ZaeXJTZlRDVE5xQzF5em5mMXUyak4wc3VSeTUw?=
 =?utf-8?B?c1F5ZC9RUS9WbmwrZm91MGJ5QWlFUU5McUZtQmRJY01tOGd6U3oybG4zcXFn?=
 =?utf-8?B?QkN0emVVT1RpVWRJT0RZR1hlM3FWRVBvUEMvWjFvWHVtRlpoa0hTMllGK3Z3?=
 =?utf-8?B?RHg3RUwvVHRFa0ZJU2xsQ2Vybk9oalJNTzNlNWhPdk53dU1JaFB4N3lTNWNa?=
 =?utf-8?B?MWJnUEJ5YlFaTHBXcGdHOVloT0ZWUTgzb2hQdngwMEFaUS80bW9EU1lGRXV4?=
 =?utf-8?B?TndMV09qeWc3VmRDWjd4OG16UlNuUmdTM2JtcWx5M2VJdVJucFNpcEQ1T3pI?=
 =?utf-8?B?bURBeHJlU0UvalpmcTBibStwbWlJL28yM0l5U3lCWEdzdmU5eUJKQ1NsNith?=
 =?utf-8?B?dDEzeGJjSXh5VzBzcjhMdUpya093bml5eTBEL0Z2NStIYm9TNEg0eDFZR2Mz?=
 =?utf-8?B?anl4OVN6VnBtSXVsSVJMUjZwd3lHT3c5UjI5bWZJY0I3MndtV015aitNditm?=
 =?utf-8?B?MUthcWVBNjZ0Q09NU1ZCRElmd2hHRGt5Y2dPUDErNkE4WUN2NUloSW5wK1pD?=
 =?utf-8?B?RzFkREljMXRSY3g2OWt6dXhWUGVlSEUzL1paS0lwVnM2YWJuYzZkVlBpZkFr?=
 =?utf-8?B?R1p1L0JzaDgzNStLamllSnlobERaNFNyZmdOYXFFM2tueHZZeUhVejRvMEkz?=
 =?utf-8?B?Sk0wSDBKdUE4ektEdnJyM1BtVVRia1A4ckYvcHJnQ09BZnVVanRTWnhCa0hI?=
 =?utf-8?B?VDllSFJvOVJVZ0dEMEhucXJEei91c1hKS3FiQ2FGaHkwNUJ2VXhTaHhHV2xa?=
 =?utf-8?B?NkpkQjIzRktWV2lNUTFIQStWZDZNWUlkeHcyNlhPbW52NjJ3ZUhVQzRaeHlv?=
 =?utf-8?B?ZGx2MktvcDd1Zmx2QzVmNnRGRXo3SEFOVWJZK3NKdjBuLzByZ0VVRlZadVhU?=
 =?utf-8?B?NnZSYUFTR0pOQjBsRE1VdTcvM0Z0aVBpQ3JTZmVWUU1DdDlqb0s3RlE3bC9W?=
 =?utf-8?B?b242emNaUFhrMlVUVjFNaFByeW5wa0dtN0ZZVFowdWRXdEpheG9GdkttSStT?=
 =?utf-8?B?WEw2cW1CM1c5OTQyTUNZa3I4NUpMN2RTaGxVU29MQllnM28wZm1xZTNFNFNu?=
 =?utf-8?B?a2EwTzJXbVNaVkRvcmlOVjI1VTJick4xNjR6OC9wVlJnRlNYVkJaUGpaWklu?=
 =?utf-8?B?djRQZjlMOUZHdDdZS2trZ3dlNnpOWFJtTmxqYmJFYnZnczk0WmJiMk84N0w0?=
 =?utf-8?B?MFcvTXBrSWR1a245TXk3UUtGWEpkSEFqNDFQaFk4U0FuOXR0NzllZ29yY0ti?=
 =?utf-8?B?ZmZtZFpuazlqaHZvU3lLdlVqQ3U2SWxjTmgzUklUWC9kb2hmeW10bHphNjl3?=
 =?utf-8?B?Ym9QZWtFYVJ5UUxjT3dhZk9peWh3bVE3eEtudW5VWGJGQkNNa0trZnVHUkxT?=
 =?utf-8?B?RnhuT2VUbDJKV1YrekFDcHlLQlQ3WWw4dDNrbjZ4Ums5VlR3VW50UVlHa0dv?=
 =?utf-8?B?cnB1TGU5c1l0WkljRElLOVRCdXRCN2s0MDF0WFozTk1BZVV5SngzTWVkQnQz?=
 =?utf-8?B?bUdtdnFHbHlmck5LaFBsdEpKTFJ3aThmVHE1bFZHckJuZjc2bG5wZ2NEU1JJ?=
 =?utf-8?B?cGZEUzljVUUyWnRIZWV0TWZPbmNSYlBFN2U5N3JZOE1zTUpDS2JOd3BwREoy?=
 =?utf-8?B?WkZGYUNLRjNaSUNhUXVSVmI4K2ViOFJ2clhiekpMc2oxVzkrYmlSWHJudXkv?=
 =?utf-8?B?elBlRlVreC80bXlTMEFGeUN5a0VyVGxDaVJ4NW95OFZRcndzTTdESWp4a00x?=
 =?utf-8?B?V1IvWGtQU2FzcW0rZTlHQ3J5emN6RmZIMTI1VGpoZVUwMjQ1Z1hwRzVmSWww?=
 =?utf-8?B?dEJvd3ZMZ3d3aDl0MFBxRUgrbkoyVnBYV29XRW50WnBrM3hmWHcwL3dYNFhy?=
 =?utf-8?B?dFA2RHphQkQwcHZOcllVK2UrZjMzR1VId3o5aWFMeWZGZDlmYmtwdFJ3Y0ow?=
 =?utf-8?Q?4+iEFpy9qAPkTlPRLt+Wlw6OqSqqCBoNi7a31TpziGiy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0582aebd-51b8-41a6-2727-08dd8d6e93b8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:53:42.3744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fEWwBKsuM4qMHlalGbkm+mS3UJua5GCVqKOgnjO3gmhkpSEzkrU4HLsF5s8Sia1RzA+Ubc92LJ9sdNLlPQEKsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761
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

Add support for navigating and setting up vBIOS ucode data required for
GSP to boot. The main data extracted from the vBIOS is the FWSEC-FRTS
firmware which runs on the GSP processor. This firmware runs in high
secure mode, and sets up the WPR2 (Write protected region) before the
Booter runs on the SEC2 processor.

Also add log messages to show the BIOS images.

[102141.013287] NovaCore: Found BIOS image at offset 0x0, size: 0xfe00, type: PciAt
[102141.080692] NovaCore: Found BIOS image at offset 0xfe00, size: 0x14800, type: Efi
[102141.098443] NovaCore: Found BIOS image at offset 0x24600, size: 0x5600, type: FwSec
[102141.415095] NovaCore: Found BIOS image at offset 0x29c00, size: 0x60800, type: FwSec

Tested on my Ampere GA102 and boot is successful.

[applied changes by Alex Courbot for fwsec signatures]
[applied feedback from Alex Courbot and Timur Tabi]
[applied changes related to code reorg, prints etc from Danilo Krummrich]
[acourbot@nvidia.com: fix clippy warnings]
[acourbot@nvidia.com: remove now-unneeded Devres acquisition]
[acourbot@nvidia.com: fix read_more to read `len` bytes, not u32s]

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Shirish Baskaran <sbaskaran@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: Ben Skeggs <bskeggs@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs  |    2 -
 drivers/gpu/nova-core/gpu.rs       |    3 +
 drivers/gpu/nova-core/nova_core.rs |    1 +
 drivers/gpu/nova-core/vbios.rs     | 1147 ++++++++++++++++++++++++++++++++++++
 4 files changed, 1151 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 1eb216307cd01d975b3d5beda1dc516f34b4b3f2..960982174d834c7c66a47ecfb3a15bf47116b2c5 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -80,8 +80,6 @@ pub(crate) struct FalconUCodeDescV3 {
     _reserved: u16,
 }
 
-// To be removed once that code is used.
-#[expect(dead_code)]
 impl FalconUCodeDescV3 {
     pub(crate) fn size(&self) -> usize {
         ((self.hdr & 0xffff0000) >> 16) as usize
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index ece13594fba687f3f714e255b5436e72d80dece3..4bf7f72247e5320935a517270b5a0e1ec2becfec 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -9,6 +9,7 @@
 use crate::firmware::Firmware;
 use crate::regs;
 use crate::util;
+use crate::vbios::Vbios;
 use core::fmt;
 
 macro_rules! define_chipset {
@@ -238,6 +239,8 @@ pub(crate) fn new(
 
         let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
 
+        let _bios = Vbios::new(pdev, bar)?;
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 8342482a1aa16da2e69f7d99143c1549a82c969e..ff6d0b40c18f36af4c7e2d5c839fdf77dba23321 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -10,6 +10,7 @@
 mod gpu;
 mod regs;
 mod util;
+mod vbios;
 
 kernel::module_pci_driver! {
     type: driver::NovaCore,
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
new file mode 100644
index 0000000000000000000000000000000000000000..cd55d8dbf8e12d532f776d7544c7e5f2a865d6f8
--- /dev/null
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -0,0 +1,1147 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! VBIOS extraction and parsing.
+
+// To be removed when all code is used.
+#![expect(dead_code)]
+
+use crate::driver::Bar0;
+use crate::firmware::FalconUCodeDescV3;
+use core::convert::TryFrom;
+use kernel::device;
+use kernel::error::Result;
+use kernel::num::NumAlign;
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
+        for i in (0..len).step_by(core::mem::size_of::<u32>()) {
+            // Read 32-bit word from the VBIOS ROM
+            let word = self.bar0.try_read32(start + i)?;
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
+        let image_size = match self
+            .read_bios_image_at_offset(
+                self.current_offset,
+                BIOS_READ_AHEAD_SIZE,
+                "parse initial BIOS image headers",
+            )
+            .and_then(|image| image.image_size_bytes())
+        {
+            Ok(size) => size,
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
+        self.current_offset = self.current_offset.align_up(512);
+
+        Some(Ok(full_image))
+    }
+}
+
+pub(crate) struct Vbios {
+    pub fwsec_image: Option<FwSecBiosImage>,
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
+            dev_info!(
+                pdev.as_ref(),
+                "Found BIOS image: size: {:#x}, type: {}, last: {}\n",
+                full_image.image_size_bytes()?,
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
+        // We need mutable access here, so we handle the Option manually.
+        let final_fwsec_image = {
+            let mut second = second_fwsec_image; // Take ownership of the option
+
+            if let (Some(second), Some(first), Some(pci_at)) =
+                (second.as_mut(), first_fwsec_image, pci_at_image)
+            {
+                second
+                    .setup_falcon_data(pdev, &pci_at, &first)
+                    .inspect_err(|e| {
+                        dev_err!(pdev.as_ref(), "Falcon data setup failed: {:?}\n", e)
+                    })?;
+            } else {
+                dev_err!(
+                    pdev.as_ref(),
+                    "Missing required images for falcon data setup, skipping\n"
+                );
+                return Err(EINVAL);
+            }
+            second
+        };
+
+        Ok(Vbios {
+            fwsec_image: final_fwsec_image,
+        })
+    }
+
+    pub(crate) fn fwsec_header(&self, pdev: &device::Device) -> Result<&FalconUCodeDescV3> {
+        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
+        image.fwsec_header(pdev)
+    }
+
+    pub(crate) fn fwsec_ucode(&self, pdev: &device::Device) -> Result<&[u8]> {
+        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
+        image.fwsec_ucode(pdev, image.fwsec_header(pdev)?)
+    }
+
+    pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> Result<&[u8]> {
+        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
+        image.fwsec_sigs(pdev, image.fwsec_header(pdev)?)
+    }
+}
+
+/// PCI Data Structure as defined in PCI Firmware Specification
+#[derive(Debug, Clone)]
+#[repr(C)]
+struct PcirStruct {
+    /// PCI Data Structure signature ("PCIR" or "NPDS")
+    pub signature: [u8; 4],
+    /// PCI Vendor ID (e.g., 0x10DE for NVIDIA)
+    pub vendor_id: u16,
+    /// PCI Device ID
+    pub device_id: u16,
+    /// Device List Pointer
+    pub device_list_ptr: u16,
+    /// PCI Data Structure Length
+    pub pci_data_struct_len: u16,
+    /// PCI Data Structure Revision
+    pub pci_data_struct_rev: u8,
+    /// Class code (3 bytes, 0x03 for display controller)
+    pub class_code: [u8; 3],
+    /// Size of this image in 512-byte blocks
+    pub image_len: u16,
+    /// Revision Level of the Vendor's ROM
+    pub vendor_rom_rev: u16,
+    /// ROM image type (0x00 = PC-AT compatible, 0x03 = EFI, 0x70 = NBSI)
+    pub code_type: u8,
+    /// Last image indicator (0x00 = Not last image, 0x80 = Last image)
+    pub last_image: u8,
+    /// Maximum Run-time Image Length (units of 512 bytes)
+    pub max_runtime_image_len: u16,
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
+        Ok(PcirStruct {
+            signature,
+            vendor_id: u16::from_le_bytes([data[4], data[5]]),
+            device_id: u16::from_le_bytes([data[6], data[7]]),
+            device_list_ptr: u16::from_le_bytes([data[8], data[9]]),
+            pci_data_struct_len: u16::from_le_bytes([data[10], data[11]]),
+            pci_data_struct_rev: data[12],
+            class_code,
+            image_len: u16::from_le_bytes([data[16], data[17]]),
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
+    /// Calculate image size in bytes
+    fn image_size_bytes(&self) -> Result<usize> {
+        if self.image_len > 0 {
+            // Image size is in 512-byte blocks
+            Ok(self.image_len as usize * 512)
+        } else {
+            Err(EINVAL)
+        }
+    }
+}
+
+/// BIOS Information Table (BIT) Header
+/// This is the head of the BIT table, that is used to locate the Falcon data.
+/// The BIT table (with its header) is in the PciAtBiosImage and the falcon data
+/// it is pointing to is in the FwSecBiosImage.
+#[derive(Debug, Clone, Copy)]
+#[expect(dead_code)]
+struct BitHeader {
+    /// 0h: BIT Header Identifier (BMP=0x7FFF/BIT=0xB8FF)
+    pub id: u16,
+    /// 2h: BIT Header Signature ("BIT\0")
+    pub signature: [u8; 4],
+    /// 6h: Binary Coded Decimal Version, ex: 0x0100 is 1.00.
+    pub bcd_version: u16,
+    /// 8h: Size of BIT Header (in bytes)
+    pub header_size: u8,
+    /// 9h: Size of BIT Tokens (in bytes)
+    pub token_size: u8,
+    /// 10h: Number of token entries that follow
+    pub token_entries: u8,
+    /// 11h: BIT Header Checksum
+    pub checksum: u8,
+}
+
+impl BitHeader {
+    fn new(data: &[u8]) -> Result<Self> {
+        if data.len() < 12 {
+            return Err(EINVAL);
+        }
+
+        let mut signature = [0u8; 4];
+        signature.copy_from_slice(&data[2..6]);
+
+        // Check header ID and signature
+        let id = u16::from_le_bytes([data[0], data[1]]);
+        if id != 0xB8FF || &signature != b"BIT\0" {
+            return Err(EINVAL);
+        }
+
+        Ok(BitHeader {
+            id,
+            signature,
+            bcd_version: u16::from_le_bytes([data[6], data[7]]),
+            header_size: data[8],
+            token_size: data[9],
+            token_entries: data[10],
+            checksum: data[11],
+        })
+    }
+}
+
+/// BIT Token Entry: Records in the BIT table followed by the BIT header
+#[derive(Debug, Clone, Copy)]
+#[expect(dead_code)]
+struct BitToken {
+    /// 00h: Token identifier
+    pub id: u8,
+    /// 01h: Version of the token data
+    pub data_version: u8,
+    /// 02h: Size of token data in bytes
+    pub data_size: u16,
+    /// 04h: Offset to the token data
+    pub data_offset: u16,
+}
+
+// Define the token ID for the Falcon data
+pub(in crate::vbios) const BIT_TOKEN_ID_FALCON_DATA: u8 = 0x70;
+
+impl BitToken {
+    /// Find a BIT token entry by BIT ID in a PciAtBiosImage
+    pub(in crate::vbios) fn from_id(image: &PciAtBiosImage, token_id: u8) -> Result<Self> {
+        let header = image.bit_header.as_ref().ok_or(EINVAL)?;
+
+        // Offset to the first token entry
+        let tokens_start = image.bit_offset.ok_or(EINVAL)? + header.header_size as usize;
+
+        for i in 0..header.token_entries as usize {
+            let entry_offset = tokens_start + (i * header.token_size as usize);
+
+            // Make sure we don't go out of bounds
+            if entry_offset + header.token_size as usize > image.base.data.len() {
+                return Err(EINVAL);
+            }
+
+            // Check if this token has the requested ID
+            if image.base.data[entry_offset] == token_id {
+                return Ok(BitToken {
+                    id: image.base.data[entry_offset],
+                    data_version: image.base.data[entry_offset + 1],
+                    data_size: u16::from_le_bytes([
+                        image.base.data[entry_offset + 2],
+                        image.base.data[entry_offset + 3],
+                    ]),
+                    data_offset: u16::from_le_bytes([
+                        image.base.data[entry_offset + 4],
+                        image.base.data[entry_offset + 5],
+                    ]),
+                });
+            }
+        }
+
+        // Token not found
+        Err(ENOENT)
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
+    pub signature: u16,
+    /// 02h: Reserved bytes for processor architecture unique data (20 bytes)
+    pub reserved: [u8; 20],
+    /// 16h: NBSI Data Offset (NBSI-specific, offset from header to NBSI image)
+    pub nbsi_data_offset: Option<u16>,
+    /// 18h: Pointer to PCI Data Structure (offset from start of ROM image)
+    pub pci_data_struct_offset: u16,
+    /// 1Ah: Size of block (this is NBSI-specific)
+    pub size_of_block: Option<u32>,
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
+#[expect(dead_code)]
+struct NpdeStruct {
+    /// 00h: Signature ("NPDE")
+    pub signature: [u8; 4],
+    /// 04h: NVIDIA PCI Data Extension Revision
+    pub npci_data_ext_rev: u16,
+    /// 06h: NVIDIA PCI Data Extension Length
+    pub npci_data_ext_len: u16,
+    /// 08h: Sub-image Length (in 512-byte units)
+    pub subimage_len: u16,
+    /// 0Ah: Last image indicator flag
+    pub last_image: u8,
+}
+
+impl NpdeStruct {
+    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+        if data.len() < 11 {
+            dev_err!(pdev.as_ref(), "Not enough data for NpdeStruct\n");
+            return Err(EINVAL);
+        }
+
+        let mut signature = [0u8; 4];
+        signature.copy_from_slice(&data[0..4]);
+
+        // Signature should be "NPDE" (0x4544504E)
+        if &signature != b"NPDE" {
+            dev_err!(
+                pdev.as_ref(),
+                "Invalid signature for NpdeStruct: {:?}\n",
+                signature
+            );
+            return Err(EINVAL);
+        }
+
+        Ok(NpdeStruct {
+            signature,
+            npci_data_ext_rev: u16::from_le_bytes([data[4], data[5]]),
+            npci_data_ext_len: u16::from_le_bytes([data[6], data[7]]),
+            subimage_len: u16::from_le_bytes([data[8], data[9]]),
+            last_image: data[10],
+        })
+    }
+
+    /// Check if this is the last image in the ROM
+    fn is_last(&self) -> bool {
+        self.last_image & LAST_IMAGE_BIT_MASK != 0
+    }
+
+    /// Calculate image size in bytes
+    fn image_size_bytes(&self) -> Result<usize> {
+        if self.subimage_len > 0 {
+            // Image size is in 512-byte blocks
+            Ok(self.subimage_len as usize * 512)
+        } else {
+            Err(EINVAL)
+        }
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
+        if npde_start + 11 > data.len() {
+            dev_err!(pdev.as_ref(), "Not enough data for NPDE\n");
+            return None;
+        }
+
+        // Try to create NPDE from the data
+        NpdeStruct::new(pdev, &data[npde_start..])
+            .inspect_err(|e| {
+                dev_err!(pdev.as_ref(), "Error creating NpdeStruct: {:?}\n", e);
+            })
+            .ok()
+    }
+}
+
+// Use a macro to implement BiosImage enum and methods. This avoids having to
+// repeat each enum type when implementing functions like base() in BiosImage.
+macro_rules! bios_image {
+    (
+        $($variant:ident $class:ident),* $(,)?
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
+    fn image_size_bytes(&self) -> Result<usize> {
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
+        image.image_size_bytes().inspect_err(|_| {
+            dev_err!(
+                pdev.as_ref(),
+                "Invalid image size computed during BiosImage creation\n"
+            )
+        })?;
+
+        Ok(image)
+    }
+}
+
+bios_image! {
+    PciAt PciAtBiosImage,   // PCI-AT compatible BIOS image
+    Efi EfiBiosImage,       // EFI (Extensible Firmware Interface)
+    Nbsi NbsiBiosImage,     // NBSI (Nvidia Bios System Interface)
+    FwSec FwSecBiosImage    // FWSEC (Firmware Security)
+}
+
+struct PciAtBiosImage {
+    base: BiosImageBase,
+    bit_header: Option<BitHeader>,
+    bit_offset: Option<usize>,
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
+pub(crate) struct FwSecBiosImage {
+    base: BiosImageBase,
+    // FWSEC-specific fields
+    // The offset of the Falcon data from the start of Fwsec image
+    falcon_data_offset: Option<usize>,
+    // The PmuLookupTable starts at the offset of the falcon data pointer
+    pmu_lookup_table: Option<PmuLookupTable>,
+    // The offset of the Falcon ucode
+    falcon_ucode_offset: Option<usize>,
+}
+
+// Convert from BiosImageBase to BiosImage
+impl TryFrom<BiosImageBase> for BiosImage {
+    type Error = Error;
+
+    fn try_from(base: BiosImageBase) -> Result<Self> {
+        match base.pcir.code_type {
+            0x00 => Ok(BiosImage::PciAt(base.try_into()?)),
+            0x03 => Ok(BiosImage::Efi(EfiBiosImage { base })),
+            0x70 => Ok(BiosImage::Nbsi(NbsiBiosImage { base })),
+            0xE0 => Ok(BiosImage::FwSec(FwSecBiosImage {
+                base,
+                falcon_data_offset: None,
+                pmu_lookup_table: None,
+                falcon_ucode_offset: None,
+            })),
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
+
+/// The PciAt BIOS image is typically the first BIOS image type found in the
+/// BIOS image chain. It contains the BIT header and the BIT tokens.
+impl PciAtBiosImage {
+    /// Find a byte pattern in a slice
+    fn find_byte_pattern(haystack: &[u8], needle: &[u8]) -> Option<usize> {
+        haystack
+            .windows(needle.len())
+            .position(|window| window == needle)
+    }
+
+    /// Find the BIT header in the PciAtBiosImage
+    fn find_bit_header(data: &[u8]) -> Result<(BitHeader, usize)> {
+        let bit_pattern = [0xff, 0xb8, b'B', b'I', b'T', 0x00];
+        let bit_offset = Self::find_byte_pattern(data, &bit_pattern);
+        if bit_offset.is_none() {
+            return Err(EINVAL);
+        }
+
+        let bit_header = BitHeader::new(&data[bit_offset.ok_or(EINVAL)?..])?;
+        Ok((bit_header, bit_offset.ok_or(EINVAL)?))
+    }
+
+    /// Get a BIT token entry from the BIT table in the PciAtBiosImage
+    fn get_bit_token(&self, token_id: u8) -> Result<BitToken> {
+        BitToken::from_id(self, token_id)
+    }
+
+    /// Find the Falcon data pointer structure in the PciAtBiosImage
+    /// This is just a 4 byte structure that contains a pointer to the
+    /// Falcon data in the FWSEC image.
+    fn falcon_data_ptr(&self, pdev: &pci::Device) -> Result<u32> {
+        let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
+
+        // Make sure we don't go out of bounds
+        if token.data_offset as usize + 4 > self.base.data.len() {
+            return Err(EINVAL);
+        }
+
+        // read the 4 bytes at the offset specified in the token
+        let offset = token.data_offset as usize;
+        let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
+            dev_err!(pdev.as_ref(), "Failed to convert data slice to array");
+            EINVAL
+        })?;
+
+        let data_ptr = u32::from_le_bytes(bytes);
+
+        if (data_ptr as usize) < self.base.data.len() {
+            dev_err!(pdev.as_ref(), "Falcon data pointer out of bounds\n");
+            return Err(EINVAL);
+        }
+
+        Ok(data_ptr)
+    }
+}
+
+impl TryFrom<BiosImageBase> for PciAtBiosImage {
+    type Error = Error;
+
+    fn try_from(base: BiosImageBase) -> Result<Self> {
+        let data_slice = &base.data;
+        let (bit_header, bit_offset) = PciAtBiosImage::find_bit_header(data_slice)?;
+
+        Ok(PciAtBiosImage {
+            base,
+            bit_header: Some(bit_header),
+            bit_offset: Some(bit_offset),
+        })
+    }
+}
+
+/// The PmuLookupTableEntry structure is a single entry in the PmuLookupTable.
+/// See the PmuLookupTable description for more information.
+#[expect(dead_code)]
+struct PmuLookupTableEntry {
+    application_id: u8,
+    target_id: u8,
+    data: u32,
+}
+
+impl PmuLookupTableEntry {
+    fn new(data: &[u8]) -> Result<Self> {
+        if data.len() < 5 {
+            return Err(EINVAL);
+        }
+
+        Ok(PmuLookupTableEntry {
+            application_id: data[0],
+            target_id: data[1],
+            data: u32::from_le_bytes(data[2..6].try_into().map_err(|_| EINVAL)?),
+        })
+    }
+}
+
+/// The PmuLookupTableEntry structure is used to find the PmuLookupTableEntry
+/// for a given application ID. The table of entries is pointed to by the falcon
+/// data pointer in the BIT table, and is used to locate the Falcon Ucode.
+#[expect(dead_code)]
+struct PmuLookupTable {
+    version: u8,
+    header_len: u8,
+    entry_len: u8,
+    entry_count: u8,
+    table_data: KVec<u8>,
+}
+
+impl PmuLookupTable {
+    fn new(data: &[u8]) -> Result<Self> {
+        if data.len() < 4 {
+            return Err(EINVAL);
+        }
+
+        let header_len = data[1] as usize;
+        let entry_len = data[2] as usize;
+        let entry_count = data[3] as usize;
+
+        let required_bytes = header_len + (entry_count * entry_len);
+
+        if data.len() < required_bytes {
+            return Err(EINVAL);
+        }
+
+        // Create a copy of only the table data
+        let mut table_data = KVec::new();
+
+        // "last_entry_bytes" is a debugging aid.
+        let mut last_entry_bytes: Option<KVec<u8>> = if cfg!(debug_assertions) {
+            Some(KVec::new())
+        } else {
+            None
+        };
+
+        for &byte in &data[header_len..required_bytes] {
+            table_data.push(byte, GFP_KERNEL)?;
+
+            if cfg!(debug_assertions) {
+                // Debugging (dumps the table data to dmesg):
+                if let Some(ref mut last_entry_bytes) = last_entry_bytes {
+                    last_entry_bytes.push(byte, GFP_KERNEL)?;
+
+                    let last_entry_bytes_len = last_entry_bytes.len();
+                    if last_entry_bytes_len == entry_len {
+                        pr_info!("Last entry bytes: {:02x?}\n", &last_entry_bytes[..]);
+                        *last_entry_bytes = KVec::new();
+                    }
+                }
+            }
+        }
+
+        Ok(PmuLookupTable {
+            version: data[0],
+            header_len: header_len as u8,
+            entry_len: entry_len as u8,
+            entry_count: entry_count as u8,
+            table_data,
+        })
+    }
+
+    fn lookup_index(&self, idx: u8) -> Result<PmuLookupTableEntry> {
+        if idx >= self.entry_count {
+            return Err(EINVAL);
+        }
+
+        let index = (idx as usize) * self.entry_len as usize;
+        PmuLookupTableEntry::new(&self.table_data[index..])
+    }
+
+    // find entry by type value
+    fn find_entry_by_type(&self, entry_type: u8) -> Result<PmuLookupTableEntry> {
+        for i in 0..self.entry_count {
+            let entry = self.lookup_index(i)?;
+            if entry.application_id == entry_type {
+                return Ok(entry);
+            }
+        }
+
+        Err(EINVAL)
+    }
+}
+
+/// The FwSecBiosImage structure contains the PMU table and the Falcon Ucode.
+/// The PMU table contains voltage/frequency tables as well as a pointer to the
+/// Falcon Ucode.
+impl FwSecBiosImage {
+    fn setup_falcon_data(
+        &mut self,
+        pdev: &pci::Device,
+        pci_at_image: &PciAtBiosImage,
+        first_fwsec_image: &FwSecBiosImage,
+    ) -> Result<()> {
+        let mut offset = pci_at_image.falcon_data_ptr(pdev)? as usize;
+
+        // The falcon data pointer assumes that the PciAt and FWSEC images
+        // are contiguous in memory. However, testing shows the EFI image sits in
+        // between them. So calculate the offset from the end of the PciAt image
+        // rather than the start of it. Compensate.
+        offset -= pci_at_image.base.data.len();
+
+        // The offset is now from the start of the first Fwsec image, however
+        // the offset points to a location in the second Fwsec image. Since
+        // the fwsec images are contiguous, subtract the length of the first Fwsec
+        // image from the offset to get the offset to the start of the second
+        // Fwsec image.
+        offset -= first_fwsec_image.base.data.len();
+
+        self.falcon_data_offset = Some(offset);
+
+        // The PmuLookupTable starts at the offset of the falcon data pointer
+        self.pmu_lookup_table = Some(PmuLookupTable::new(&self.base.data[offset..])?);
+
+        match self
+            .pmu_lookup_table
+            .as_ref()
+            .ok_or(EINVAL)?
+            .find_entry_by_type(FALCON_UCODE_ENTRY_APPID_FWSEC_PROD)
+        {
+            Ok(entry) => {
+                let mut ucode_offset = entry.data as usize;
+                ucode_offset -= pci_at_image.base.data.len();
+                ucode_offset -= first_fwsec_image.base.data.len();
+                self.falcon_ucode_offset = Some(ucode_offset);
+                if cfg!(debug_assertions) {
+                    // Print the v3_desc header for debugging
+                    let v3_desc = self.fwsec_header(pdev.as_ref())?;
+                    pr_info!("PmuLookupTableEntry v3_desc: {:#?}\n", v3_desc);
+                }
+            }
+            Err(e) => {
+                dev_err!(
+                    pdev.as_ref(),
+                    "PmuLookupTableEntry not found, error: {:?}\n",
+                    e
+                );
+            }
+        }
+        Ok(())
+    }
+
+    /// TODO: These were borrowed from the old code for integrating this module
+    /// with the outside world. They should be cleaned up and integrated properly.
+    ///
+    /// Get the FwSec header (FalconUCodeDescV3)
+    fn fwsec_header(&self, dev: &device::Device) -> Result<&FalconUCodeDescV3> {
+        // Get the falcon ucode offset that was found in setup_falcon_data
+        let falcon_ucode_offset = self.falcon_ucode_offset.ok_or(EINVAL)?;
+
+        // Make sure the offset is within the data bounds
+        if falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>() > self.base.data.len() {
+            dev_err!(dev, "fwsec-frts header not contained within BIOS bounds\n");
+            return Err(ERANGE);
+        }
+
+        // Read the first 4 bytes to get the version
+        let hdr_bytes: [u8; 4] = self.base.data[falcon_ucode_offset..falcon_ucode_offset + 4]
+            .try_into()
+            .map_err(|_| EINVAL)?;
+        let hdr = u32::from_le_bytes(hdr_bytes);
+        let ver = (hdr & 0xff00) >> 8;
+
+        if ver != 3 {
+            dev_err!(dev, "invalid fwsec firmware version\n");
+            return Err(EINVAL);
+        }
+
+        // Return a reference to the FalconUCodeDescV3 structure SAFETY: we have checked that
+        // `falcon_ucode_offset + size_of::<FalconUCodeDescV3` is within the bounds of `data.`
+        Ok(unsafe {
+            &*(self.base.data.as_ptr().add(falcon_ucode_offset) as *const FalconUCodeDescV3)
+        })
+    }
+    /// Get the ucode data as a byte slice
+    fn fwsec_ucode(&self, dev: &device::Device, v3_desc: &FalconUCodeDescV3) -> Result<&[u8]> {
+        let falcon_ucode_offset = self.falcon_ucode_offset.ok_or(EINVAL)?;
+
+        // The ucode data follows the descriptor
+        let ucode_data_offset = falcon_ucode_offset + v3_desc.size();
+        let size = (v3_desc.imem_load_size + v3_desc.dmem_load_size) as usize;
+
+        // Get the data slice, checking bounds in a single operation
+        self.base
+            .data
+            .get(ucode_data_offset..ucode_data_offset + size)
+            .ok_or(ERANGE)
+            .inspect_err(|_| dev_err!(dev, "fwsec ucode data not contained within BIOS bounds\n"))
+    }
+
+    /// Get the signatures as a byte slice
+    fn fwsec_sigs(&self, dev: &device::Device, v3_desc: &FalconUCodeDescV3) -> Result<&[u8]> {
+        const SIG_SIZE: usize = 96 * 4;
+
+        let falcon_ucode_offset = self.falcon_ucode_offset.ok_or(EINVAL)?;
+
+        // The signatures data follows the descriptor
+        let sigs_data_offset = falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
+        let size = v3_desc.signature_count as usize * SIG_SIZE;
+
+        // Make sure the data is within bounds
+        if sigs_data_offset + size > self.base.data.len() {
+            dev_err!(
+                dev,
+                "fwsec signatures data not contained within BIOS bounds\n"
+            );
+            return Err(ERANGE);
+        }
+
+        Ok(&self.base.data[sigs_data_offset..sigs_data_offset + size])
+    }
+}

-- 
2.49.0

