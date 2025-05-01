Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10B3AA5EB2
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E94E10E81B;
	Thu,  1 May 2025 12:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LGYqHWR6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B72410E242;
 Thu,  1 May 2025 12:59:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ww2dvClBX5sJgsK4HBTiXV0utxOt7XovAkyRVdBnMeTZR9M1Uy/OhsKDylCUsBFwbuCUrgrJp+eSS1Tq5kmPdQh8XF0hXt2mvsjyX9AQTjNdTqr6H2x33R2HQvts35rDz0SzCdEG7kkX2q5YA5PQJeeBh9LlKCvLJcBBv5S2tgqRcs21kwzGde1iTbCgQ6ep6xJHz7B4rCyoTHY4v9YeUQ3VV9E3ycpdUQEV51eE/n3sej3w19UpIVi10DfFpK7+Gc7+kOjXKdF6PfmqdMJ1dtr43ch97N/nxLIbAoT2rXtrzPBrV/R7HU4eGxyzaETKqzSHr8Bbmmb9Ke00D8I+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPuSpD/3gYl8VrxUUYxvEowDDER/xGsyRrD6CiA/elk=;
 b=R1nIjS+rv7nQOqsPoimcgVQSNj+1i+iRk/4AeDFvSx2My3vOlrCZHZxpZP2KYSNgh/WC+X4VRIZ5S6NO5ERHkyMw9ClvUWKsXEYj7bkiAY4mRhyJXaiOMH84XqzfpsQ89UIoYzoVTQyuZMNo5wbpiJSKYNzLJqlV7/atXP5vgme5PC2BJgGPcq0orlz0tgb1KwHsfYOHehEQO3hMiFJjhO2NGJG8BFQJFOnnFyHd6qG4AQaNMhk3/m9AAlfZwCXFwY6kgeDWApLsH2Ckf9ZQVF9zqEfO8wUBcI1WGWLtp1k28rDav1QM3yRJ62P/5SsY5chJqvoDyIImbfp3nKCLoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPuSpD/3gYl8VrxUUYxvEowDDER/xGsyRrD6CiA/elk=;
 b=LGYqHWR6I+twJyk2fjgeMT47BpvvC4t8YpWL5sAH+K739vbg4S4pLIla19UfxZSoaTtZccsA3CI3krwmkpo8J2+iR/cdHR1z68yGrwPOdDrw46ruBdn2h21ZEdOWwgv/t7aGzML6/LdRfoz3FCGu0NVWyKGapw66AmHfissm+CZansHEFkJQdwvsTKr0gpWiRlqOou+gxmPTyJ8DFIpvmxei/2ffM1uEdClKvU7lMB1qpU7OtCXUb9676B5RSVhU6ywhrmdn7QzWkbNuCaInkxDnjZV2lm+XYz+eAKdo4iMHCi++G2alfsnaFgtJWxmW+dHmlT5O058Jk3nBTivHVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Thu, 1 May
 2025 12:58:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:58:52 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:19 +0900
Subject: [PATCH v2 01/21] rust: devres: allow to borrow a reference to the
 resource's Device
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-1-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
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
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: d9800344-5704-4c90-cb47-08dd88afec6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEw3ZlV2VXNTZUZncW9CTFN4TVphMEVyVmZjQjZvSUpnRlpVTWhPeXM4Umc5?=
 =?utf-8?B?ZXN5SWRWbzJWQzVVSTF1TEdzTVpXMGl0WnVVMzVUcTd1Mm9ySmk0VGRzOXNq?=
 =?utf-8?B?aFFRc0wxbGVRamNNNjlJZWE3WVlTOGswelI4dkNMODc4MDRVNzdialpCQVQz?=
 =?utf-8?B?QiszK3p5a2p1QkZPQU9jNVEybHM5L09CR09WQ0JJNlhFZEhybEVOU3d4ZTM0?=
 =?utf-8?B?V1BjTHY5eis2N2RKeUhnWjJwSW1TUUQ2YWcrL3pMSGg2K1ZvdnpJeW5IN0hN?=
 =?utf-8?B?K1V1ZGt5eGJibGo2SzVKOGhDOGF5OVFFNklNRHhKWVJWWnRsNm1veUJjc0pp?=
 =?utf-8?B?WHBlbXJWQXZOWVNqUWZPUVVSOGRIY3hoeUwvTlZYVWUzaG1Ha1kzV1VxSXp1?=
 =?utf-8?B?YngyVEFTMTFCU1dtMUxlSDdSZkJnOE1xcmFmcldCSGI1YU5hWVhsZXE0Q1dq?=
 =?utf-8?B?S2cwZlp0SE5pN0FDOEhqRjhyWmtKbEdLejVUaVpJOEQzZUFKcU90SHpyamFN?=
 =?utf-8?B?SFpDTDNNdytKdXBab3FJUWN4RnBZSlZURjBCclZTL1V1QmdlTThrVld6ejRp?=
 =?utf-8?B?YnZSS2ZQWDJ1V1ZTYWNXVys4WDd1Z2VzYVFUWTg4MVd0a1NuNEgxZmw0UEZP?=
 =?utf-8?B?YitBUVFJT3lPQlRFa1A1bFh4UW92dGFLcFRGWXNsM0JQRXJ0dDIzNHJUSlhX?=
 =?utf-8?B?NVRZN2pGbGFRdmJVOTZlYVpUdG9zY1hIZ1FpSE9CVzV0NGoxN2RFaS80UVJG?=
 =?utf-8?B?UGVPYWNsRk43TnQxb2FIU21WVHRKcmhPenhqTmhHeENZNjdJM2JTNlZqRkU1?=
 =?utf-8?B?QXl3bWZwT3pZMEZ6ZksyNDlNNkd1L1ZZK3BIM2R2OVA2c09pTEg1ako3Z2lL?=
 =?utf-8?B?dlJYL3QzL1diZVpSZjFlZS8xNWJGVGt0M2NHWi84UW8yb3AzV2ViYW5LaFcv?=
 =?utf-8?B?QXJTMndwSnhjNjRzQ2VDdUZvRVY0SmJORHVpQ0hzTW56dUpSc1NvMlE5cDZY?=
 =?utf-8?B?U2dHdXhaeitQYW1TVE4wK3lUQUpXcnlValpHdk5EZFJ0QXFjNGdzZUhoV0xL?=
 =?utf-8?B?NGgvcHdRaVgydmdZTGdYMlB0RlZvMXN5cVIxQXorTmJFSXcrUXJFSnpncVI4?=
 =?utf-8?B?bDd1Zk5pcXRVK29oLzVLL2VRNTl1eEFqaitxMGxRRG9IZER5dEQ0cFhtU1dp?=
 =?utf-8?B?RXM1RERRNmFRaGhOQ1RYSVBRVk1rcHpaQUU1amZVWGZqbFc3cHBEM1hXUWNv?=
 =?utf-8?B?MFFVbW5XdjZRajduVmcvT0c4bDZkUExFUDQ2NXNpc0hHOEtTVm9UcDJTb3hU?=
 =?utf-8?B?dk9oMyt0dUJzK2V0RFZubEg5eXc5azh1R2FVaTZaVmZ1V3AyMDVZY0VtOVNF?=
 =?utf-8?B?N3FGMkFlQWFKLzU0d3c4cnAvRHFPd1VDZE1RR2Y1Qnh1Q3pwaEREaU5vZ292?=
 =?utf-8?B?U0RVVEMvWHU2ZFFVd3dXUy9HRW00UWFTWjJKdDNiV09WYVZYU08xMDBkZ2Rt?=
 =?utf-8?B?Z2NPUmlxOVliS2NPSXpJT2I2RHJrRmkxNzhaa0Q3QnN0UG92ejZhaVYwR3F4?=
 =?utf-8?B?Y2VwVjdFZ1FCSUpsdFd2RVZVVUtvNmJvSmdRVVRJRWZyQkVTdEQrcjV6Z0d0?=
 =?utf-8?B?cUM2UnpVK0VUMkcwdkxDRUphQ2J3alVMYXhxSVJrTzFxRTFaM1E4M1JWRkZK?=
 =?utf-8?B?Q21wRk52ZkhaSlFCWmVxY24rRkMyVlNCMUI1dDUzdVEyTDlpalZQT0tBL2RD?=
 =?utf-8?B?Y3EyTVhDSVRVTWVoc0FLVklQUk9HZ2RqMWhVTkpiVFdoeEhJQ21haU9qc3Vl?=
 =?utf-8?B?Ui9iNDRsQzFrRlliT1Qza1dZVjJIWC9lMVJHN1pmZUpNcDFIbjZHc1I2YUkv?=
 =?utf-8?B?aXV4TEhsSXprclhBd0tZVndkb29KclFrMkJZaTlGNWhRMk0venFNajljbFZT?=
 =?utf-8?B?R0ZrNDlKTFBGV0U5ZVltSzdTTnNBWEovVW1tVmRyVWFLL0xWL0hHZFMzbFFQ?=
 =?utf-8?B?dTJtVUJFcWdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWRpTzJwb1JyL0pOcDhBSjNWV05tcGtBbDZQbXo3b2liM2c1dk9hYkRrQXBH?=
 =?utf-8?B?MDBFUGhBWm4vSWo3N2p5ZGIvYTI5Q3FmQlVYKzFlUys0VVVITDQwM3lhdVRp?=
 =?utf-8?B?VHpGck0wMGVDTVRabkJXNjZPeVRBeWFvbmt6RkpDK29yem1GYTlvcXQrWTFv?=
 =?utf-8?B?N0NnRTYrbWdsQjZ4N0xwRWRRbnF2dTVtaG9maFErL2IwdE9na3pXZVNkbnRM?=
 =?utf-8?B?eHNZdWViUnJ1bHBucGh2NGpzVFIzeEd0eDRKdGh3K1VGa1lkU3hxMnlHbVpU?=
 =?utf-8?B?WGZpRlExbWNnZHdmYWV2ZjIwUkZVdTlzYVRLdmc0Z0pidHNhL3NqVHc0VWQx?=
 =?utf-8?B?QlZwM25OcFNkTVh5MEZYYU9oU0Z1ZDBSTXRNTzQ5OFRoTVM2NEJBTll2LzBr?=
 =?utf-8?B?L09KcGJDSmhsbGE0Sm5oQzBkaUVGakxGQVVSRlB0eFkxckdIMStSMWxoS1gr?=
 =?utf-8?B?cFcrRGRaWUdjaWEyaThKYURRZFR4WjlXUG45cXZ2dm5aMllRV1N3VkIrbVAx?=
 =?utf-8?B?d0NXQU9ZU1pNOTRybHk0Q1JsL0wycWlZSWo4SGRaenVwR2tlTHVUSzM1eC9K?=
 =?utf-8?B?WlE4SXZQYVpFbUZSYU9kcWdVNGt1dk9MZ0FLU1lHZ0R4eENWV041aTVZVnhy?=
 =?utf-8?B?aFpqMFlTWmcxL2tQSzJLaUtTaHdjeHM2V1VmTUlJOS9RZWkzNlB5OElxV2c5?=
 =?utf-8?B?R3NOVFFaS2QyTm04SkRqTit0MmgvZS9KQ0tXTklHdll5WVlvQUgycnFkWW9G?=
 =?utf-8?B?SU1sZkIwaEcxN1g2TWsyK3lmYm5hU3FsUW1NVklLQWF2Y3BuYVJ1YjU5SjFa?=
 =?utf-8?B?U0d4UWhvRXlvUTFGaklrTjNZVTFNNXd0UnFnQ0dFaE56Z1cxdWVnS3BieHVn?=
 =?utf-8?B?UlNlb2syeXNwc0orK05HNmhYWi91ZDR1T1c3N3hLUmJlQUh3MmZQWkt6SDd4?=
 =?utf-8?B?RiszSHAwS0U5LytkTDlrRFNYZTV0aWVpOEZoUlNVMnR6Uk9nQXJlTk1jYlJL?=
 =?utf-8?B?UFAxYjU0YjRqZVVjbXVTSEZVZm96V1VvT2NHS2VZTFVuM3NLMElaaks2b3Ru?=
 =?utf-8?B?N2ZrOFBQVnh0ODQ2d2hROWUrUW1venJxK1VuZ2x5TlFPYzgyOW9QS0ppUVU5?=
 =?utf-8?B?ajN5Uk4vbnFENWhMdk4wdWZpb3NmQ1l4bmdYeTBVcGlHSEpuL2pwR0tFY3Yy?=
 =?utf-8?B?TTFKdlpwcjZjZzRPVnRjMndEN0hUczQ4Rm1lUUdieng4cFFzQTJWUUh3RlF4?=
 =?utf-8?B?TWlsYTBQZjY0dXF4aGFqSk1zS3F2czZBRW9FVUFnb1JUcUJ1eVYvbnJ2VnJy?=
 =?utf-8?B?cVN5VlBtT1Vqbm1TbERhOXdTYlNSZG5hK0xlcXVQam96cjVpQUk4Q0djSjVC?=
 =?utf-8?B?aWN5N1BucGhyMFRTSWdDZU1ITzEyRk0vcFk5U2lmeTN5V1BWVjUwSnZhNllV?=
 =?utf-8?B?Y3M3emJvQko4RFhCODlFemFTREloU3ZvUFA4dE1YTFg3bFVJWUN2ZlVaM3dv?=
 =?utf-8?B?bmlibGVJYlNNeUYrdmtPdWtzbVBWeTV5b051cC9pNk5CUTdEMmlkeURrb0hE?=
 =?utf-8?B?N0hGdHczZnpoVnBrb3FyTGtqaElkNHFaZ0QvZGsvRVJiMG5Ma2NKVEtURE12?=
 =?utf-8?B?MzBHZXVxdHJ5RHkvVE1iWWxBN3llcnVGelJ6MW1FeHExQTY2aUNlTEpNMEJ6?=
 =?utf-8?B?d0NOUkJCS1JWS0RPT20wUmlvSVp0VC9OaDZLT09GK0NFdjRqby9IZWZJSmNr?=
 =?utf-8?B?MG45MC9FeHg4NWVkdG5VS3BQNy9iOHg0SzJqTkVhUWJUOWMwU3FzSGJ2UDFp?=
 =?utf-8?B?TXVhREFhNjRWMlgrTUZwdlpzZVJ5TGJ0NzRxbUY4OEwxTFF6ZlVEeHd3VjJF?=
 =?utf-8?B?cUJsWGM3K2FQZ09ZL1lKdkpxRDNiQ0t5WDlqUDNxYkg4ZmpIVlp6OWdpQlRv?=
 =?utf-8?B?cTNNcDBmUmtGamVRSjVha3FLMDFYZFc0dXRlTkNQRmlRMStSU25PSG9pdnVD?=
 =?utf-8?B?L25tNlk1LzFwU243VHV6b2pvalcyNnZsVnpRWTNrZk9EUko2enNtS0tYRnNI?=
 =?utf-8?B?V3BQVk50dHNCM0tjdU92V0JXSXd5OTYrQ1BQeFB3bEx3VGpWU05tV1R0SzZo?=
 =?utf-8?B?M2FaMUQ0Q3FzNVdaU25xNnlwZmlFUEVFNE1Nc1Rib21rWWhVb20zNXRuTGx3?=
 =?utf-8?Q?rgRIhjtma2f0tY1iTP7qh+ybqf57WDoYYaDtS/+uQoNT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9800344-5704-4c90-cb47-08dd88afec6d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:58:52.5584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikJ+ifdqXPPAr3mjLqHlWIIgdDZDxRuQFxyZs+5/scox0r3EJZwTqIh1igSMSfLFkWIT/adQGjUQbaxo/npZdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442
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

Functions that take a &Devres as argument might need to print error
messages related on behalf the device. Providing the reference here
removes the need for drivers to store their own for that sole purpose.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/devres.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 1e58f5d22044192449658a5a763c972ef11f1790..cc9702e31e8c60999ec873d9290c69be7843e774 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -196,3 +196,9 @@ fn drop(&mut self) {
         DevresInner::remove_action(&self.0);
     }
 }
+
+impl<T> AsRef<Device> for Devres<T> {
+    fn as_ref(&self) -> &Device {
+        &self.0.dev
+    }
+}

-- 
2.49.0

