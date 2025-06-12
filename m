Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F55AD72FD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874F610E868;
	Thu, 12 Jun 2025 14:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HyvFDSiU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694A910E868;
 Thu, 12 Jun 2025 14:03:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AkkTVNK5mcre8emhtoy3Q8CiXm54i4vwF+2upKmh5tKYSwS6eMzLfyt/hIrGPIQp7hPUuqRgIaBfWdf2+PrJbxIs/IdlIFxaJB4mslWBVn2XdPUpxTw+d5BEXEzkkZZCHsB6SFaHYnWaNhpHbet+cV9BpSdgqQb1A129gsJQnHqiNg7+GNuF2Iz7o5gd0PVjS6GfstsKfejwpf/7PxFuplhOYY2tFRTfJwkyPL1o73rsF6jZeFVlg0bCVy3ny7hSxj6wMrxzvdj/mWO1RwdOEKBlA/mywwrKV01rC+i5+wQicLzzLpEmcVOqHaGa9ry0nuZ0s6Y5+hsn2uncQUBLpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6yTjpDroaT5nGI0XT2eUccaJm8x7UTxPF6Wr0TULYg=;
 b=QB1IEgZ/Cv+KTsVfl0pf+DotyRObTAWNnoZ1ym3BdBCKnThE9NXVvnEcM4oOv7ODq8kEB1MIUTLr4AOie43ucnGzVw/sXy0a4WoNfmH/lPU2S3aJDLzqxOoS/WR2MHvsweQa06/NE0rl/kqk5rnE1lG6NX3A9cntrR26fdT2ytOSUKwOGv4GaL4ktwtLVPtO3C/AZJhDtP3YUMCJ7PCG3PUsw7x7robHcn2gyTGoZthoIxRvQIQGVPtQ+rMXMgHjGHWkW6Ta2cAozxVYl220Lvn4e7/NfmzXAiNiikATKWq6pP7q+UjnE3QxKr8gLOIrBiqTEvH+CGNdGMfFIblZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6yTjpDroaT5nGI0XT2eUccaJm8x7UTxPF6Wr0TULYg=;
 b=HyvFDSiUAfno9GC+eq8dS13DbeBBpcZ0YzGiuziJfBnUuYzUb8UsFmNEFAcz+P8tIIPR/wreWaaT1lX6CH/VXALy03npmikH1ntJHoz61KWxoWFnhnDjQGkkK0IJLWjVKlK8/dMNESxnrnn7Cp3IwgBGH2ikgkTRJM9nVWa9InoJEpsytD7O8PFom5mn2IWV5u3P9++m2TSnhSDI/HZVRCm3xgQJivVWjYyeTNF/ZcN6d3EG2PehEvy6cay878Thyfhh4UyxTGSVcWwsN82i5T/G2HH41JQaBv+Y5HgT8RakPU2kM6lW+j3oOTFJpboJDj94BE7H26CxZ3VcpNP51g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 14:03:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:03:07 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:39 +0900
Subject: [PATCH v5 11/23] gpu: nova-core: add helper function to wait on
 condition
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-11-14ba7eaf166b@nvidia.com>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
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
X-ClientProxiedBy: TY4PR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: bed1dabf-07b4-4bf5-8564-08dda9b9db1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0VObUtEVDFFSzFNa2dJVnhTNml2Ly9wUktDU2gyZHZtU0IvalR2T2hVYzNS?=
 =?utf-8?B?MVJRdzlaSmVkd1BMMDU0TFJrTEZwc3JzUTdLUml1SnNMcGhYSHNGcHVMOVM2?=
 =?utf-8?B?OGVIQTQ4dGN2bm1vWnE0NVlIL2FONHdjL1V4R3JmcXhpNVhrZEx3d2lLSko1?=
 =?utf-8?B?SUFBNmxsU3V1a2tIRlQzTGlPTU1VMjlrRVB3MkZwUWJ0WnNna0oyTlAxQldP?=
 =?utf-8?B?UkZVQ1pPcW16TnM5VFUxLzNmR1c2Z3lxcFcwWk45RHA5N2dBZ1VwS2kvL1pN?=
 =?utf-8?B?U01iQ2pQY2wrTDFwYjR4ZHlxVXdQSW5GSjZOaEg2OXN1Y1RSajRaS3V6bU5X?=
 =?utf-8?B?MXBlUzE3OFltV3c3L2Vub2ZZUncxMkNYTU5YT2w0NXk0aFBtRS9tVWgyQ083?=
 =?utf-8?B?eU5OUkt3Q3NuTDJFMUptemRra0x6OHNuZ0l6SEhXeXN5c1ZUWnBoWkRBaVZm?=
 =?utf-8?B?eUJISm5jQ0tDY0xGdEtUa1BIV044bmJiM1B2OStyV1U5RUFUSDZyZU9kdVgw?=
 =?utf-8?B?c2xxY2c2bko4SjE2S203cG1sb2xZREVXOCszR0dGYVhCT3hIb0cyZXh3aDVP?=
 =?utf-8?B?WFJjVVRhVHV2NWhuNEs4azNkZ2pJS05vLzYxOC9lNDVpNDQ0ZzR3ZkRzTmp0?=
 =?utf-8?B?c2FLa05KMjg0VDRuNjRJQVJvQ1pxZjBnWkNTdTQ4c21DVWdOUEs0VGNZem03?=
 =?utf-8?B?VElheEhUckRzNEdwdVJOSG90ZW10N2wxdmZNQkpqTEFjeGw4YUNKUjd4elNm?=
 =?utf-8?B?ZC9GMzhCeFdrdEdsNS9qN2Q5ZEtFZVR1VkJZMlVnMlpFT0ZiUVZSQTVXL0gw?=
 =?utf-8?B?R3NxMC91TmV4eDgvL1IxVDdRNWZsUXNMcC84TUdnaHNLcmFCTm91YVRzN21S?=
 =?utf-8?B?YjUzT25Sa202QzV5dFh5S0kzQkwzUlNMTENaUExGTktHUFlvOVlvWUIvWEti?=
 =?utf-8?B?Y1dBUzQ2QzA0czJyU1lHQXFrWlJLbDVIdVo0WVVLbXRXMithU3l5T056UWxm?=
 =?utf-8?B?V1pOZng1aDhLNysxWklMRUFDQ3ZXUTRNenNQSnRrL3JncmJxTXlmbnludk9l?=
 =?utf-8?B?Y1piRFhrbVI0c1FjK0dhVG1BSTd5RGwyK0tVZmlPeUVRMlpybFZNdGh5a3Nu?=
 =?utf-8?B?NFVuZHEyU2hXOHo0Q1VNam8wK2NzMkpXNjkrcStSc284TUVQV081TWszWG8w?=
 =?utf-8?B?K3JOSXZ3V05LeWtROUhDbEF5cW04dVk2Z3pjWUE5TXU5NWVlRVFnNzJMbldr?=
 =?utf-8?B?MVBobDVZKzdubXlLaHJIa3FiVjB6SGIzK05PenZzRTlvMDNwSFJVVDM2bkox?=
 =?utf-8?B?ZDBpbjNNem9nOUF6UW1KeGdvVE54ZWszNEJEOGNrTjdXODk2eVZ6VFlpQkNV?=
 =?utf-8?B?UXEvNGRQaVR5cjlDcjlpaDdaWlk2cWR4Ti9sSVVzM3hsQko1aUw3MjhnakF5?=
 =?utf-8?B?bk4vRVhTcWRxenJrb1JCZFBhWGJKeUVqWldoSGFMbDZ2aHlkMHRsQ2l3N3dk?=
 =?utf-8?B?RCtqN2p4NE5HclBBRFlIYUdJNW1zaTlNQ3JLeTBRbHZCZFBTMHE1STdHOG8z?=
 =?utf-8?B?aGh0TjBIMEwwZXdualJBWG9rZDQzdGQreFJsdmtDM1dEbjc4T0VrSnczQXpi?=
 =?utf-8?B?TFE5UjM5QXI5UmprT21aMDdZRktNVjdEcmJtSHZjb09Zc2hyc3hCVkdCQm96?=
 =?utf-8?B?L1RRZmFHMW5PeTJaOWtsZGNIOUd0bmtLejFrOTBUdXNUM21pRkI3bkRYWS9y?=
 =?utf-8?B?ZVRGOEF0Vm9kOU0rMk41a2dLMWFoWmFkdHIrNUlkelJuTkgrWWN1d0hMdCtv?=
 =?utf-8?B?Yk9WcEhoZVV3cVZNVWpLUms0eUMyT1htc2ZTdFRZV1dxTVY5MjI4WElaZDkw?=
 =?utf-8?B?cXN6cDNNWmcyU04rQWlSenpIUndiMEYxMXVsU2lpM0sydnBCYUtOUXlYcmNu?=
 =?utf-8?B?WjA2U1hJYUljWW84SUV6QXB3alM2Sm5WSTJWdzFSczdBdk4rajF6Z0JRaG02?=
 =?utf-8?B?N2hTMU9vSDJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUl5MlAzTHorN0hjUWY3WW41RHhyNG5FVHU3dWFnVTJFSHphL21WbkU4VUtP?=
 =?utf-8?B?UkhiYUR2c0xQd1MydTUyTkFLR2R4c1hNUkxraVE0Ny9TL1dicXUvN1VKQ3N3?=
 =?utf-8?B?ekZTUFJ2eHM5N2pYWVFnOXQvblpJSis1VEo1MVA2YlNvM1RUbEhrS1FBQ1Zm?=
 =?utf-8?B?M2IzTzV5NWY2bHlqbmY1dmZ1eWZ1RDdwK3lLM09CU1JaRU1rQVNjU0RMTllX?=
 =?utf-8?B?VkFjaVExOFYwbXprZzcxL0w1QkttWWQ3cmoxTXNRWTNaRms2eVhFRHlrVHBM?=
 =?utf-8?B?WitkQ1ZxVC9ySTc1YllUOGRlcGpDYXY5bWdYM3I3RDlOYW5oOTZQaVJOQ2pC?=
 =?utf-8?B?ZlF6NkZqNXlWcng2S3N6dGRtNmVCUTR2WFdsZTlOaml4TWRKbnAwVVM1RWJU?=
 =?utf-8?B?Q3JLUlBTQW5WTjlJZTlHaHNCeTkrM0x4ellvQXBVZ0EwazFmS1VMUkhUZGsz?=
 =?utf-8?B?MzdvbytIZUVUc29BclFqNnlVUGgyV0pBaWRaUVZvWmI3Vit2VndlUHFmZVhL?=
 =?utf-8?B?RDdyL1cyc2JBMW9GZDBUNzhwTUpCNDg5QWpPVTNlZ3FMOEpiOThVSHJhZDIx?=
 =?utf-8?B?NE40TUFaYWtIM1RpUzIrV0lFMytROEdZTDVZUERyZFdDeDlWc28vRk9RVTBj?=
 =?utf-8?B?NVV2eW9vU1FJYUVqMjN2aDhHVkdaTHJiVi9zSzBTWW5Ic0Z2S2tMaHVMdHNO?=
 =?utf-8?B?Yjltb3VVY250QmJZNStvQUR5dkVVM2x5TzR0Qk1ncmtLVjF6eDBDMGptOW0z?=
 =?utf-8?B?bjRKV0RWajY2cUt5OHFoZkV3MkI2WjRmYU5wUFhzeEhxVGE4M2xhckptcmUr?=
 =?utf-8?B?VWxVbHdNQVdjUXZSeGxZTlJRRExXeUw2cE9wWCtBUmJNR1hZdmRoQnZ1WkxZ?=
 =?utf-8?B?ZDJhRXpqZGZic0ZJSUVxNVRZTDdxeDhYMXJNazNoTG5ST2g5NXYvQTA2cVN0?=
 =?utf-8?B?c1JvTmwyT3JQTkZYOUZ1SXkyZ0hXckF0T2xTMktxSEVBWjZzK0xKMlB3WTM3?=
 =?utf-8?B?d2kxM2xEcVBWc2c4MTdqKzVtZzNzTHZNWEtpTyttZmlGQXg4R2QvQUw1S3ox?=
 =?utf-8?B?WU83Mk5hcmpscUE5RUIyS2dVMHRPY1Q1Nm11RktDZnNVeHNqSEFRNjBVSHZ6?=
 =?utf-8?B?U2xvNFNLckJZV1IwOTVsRUo5cFh1TFQxU25MaitJQmZSNit3cHN1UExYbHNk?=
 =?utf-8?B?cE1HYnJYZ3EvZk1xR1ppM1daZzM3ckxCQS9ZM045TXBUVXljYm1FeWl6aE9R?=
 =?utf-8?B?VmFZcFhiODkxbTNiMm5jOUFKNTg5RU81bmJBRmNtWVZIYmw3T3JKajhBY2Zl?=
 =?utf-8?B?UityQzJEOWxQNi96akFRakMyVUo3ZjVoYndNeThHTXlZWjVFSHQxV3hicTls?=
 =?utf-8?B?aEVIS3dTR0FKdjdRaEpZOCtJYURJRGlrQ3QrTnNFTUY4cERwbVlvUDNDYWlv?=
 =?utf-8?B?MUtvSjhGYlJGTmlTWDZGTU84dkt2UGhlcUlTZ2xuMnJGdS9ra1cxSEFOTm5H?=
 =?utf-8?B?dThRbGppVlNaQnNRajBtdC9pNHpmZm4xTFNEbnNOS0FRWCtTMXBXMGl5djVy?=
 =?utf-8?B?OVR3N3NNazQ4WURQbU9wLy9sS3Q2MEJVL0h3T1dGZHRCclU3K2xkTERVY0Fx?=
 =?utf-8?B?bStNTzd2T2FmSXcvVXJZVGJyWkF6clFHRlA0VmlLUG1QV3JUKy9rZC9YSjJI?=
 =?utf-8?B?ay8wZjNOSzVSeFY0MDRGUGkxc3loMG1BOGZkSERVRmMyR1JOc0Vjb1RNZ1pV?=
 =?utf-8?B?QVJJNDhxYjZpU0QyRzdDZndhRGZ3dmtTTVF2VHl6eEk1cUlxQkdUQjh6eUww?=
 =?utf-8?B?UGxYdndnQkE3bFdxNHE4aGhaQ3JqOVRLT2Erd2dGZXlZS0dKRXRXQllrbFJZ?=
 =?utf-8?B?Ni9HU0VWbi82bGxjRk9JRXRkbXkxTnlCbDJSay9MRFN1OUVERmJ6YzYvTklp?=
 =?utf-8?B?VUI1emFyOFBici93enMyc0FuK0FYbjhoZm5EWUk4NVpQYmZ4Y1BhbFc4TGc1?=
 =?utf-8?B?N1pUU01JMVRFNHhRL3g2NHBtODJRL3lOaHUwMUVtSWthNmJod2N2eWhaNVk3?=
 =?utf-8?B?NTdNQmJSTkI2YWZLRStVcUZWYWRPVHg3SHlFdG0rbTNVZzd2WTNSdmdXTXN4?=
 =?utf-8?B?TWNpYUtEWm5nU0RlaUUrMllxTWJJQWVaZEdlbXdxc25WeDZIUVU1N0ViOHpG?=
 =?utf-8?Q?HZOCn6R8kU0AEw5ZqMzh+OjYzmHEWMvQuOFHucykziTf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed1dabf-07b4-4bf5-8564-08dda9b9db1b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:03:06.9507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDBsrKEZ5KIVJWCFgtDfSySoO0xPDyjAA/eIQGMISfAgIB1XZqMYYUugq/9qOO7GImTDB0FuqmoaR7qGgO7gcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458
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

While programming the hardware, we frequently need to busy-wait until
a condition (like a given bit of a register to switch value) happens.

Add a basic `wait_on` helper function to wait on such conditions
expressed as a closure, with a timeout argument.

This is temporary as we will switch to `read_poll_timeout` [1] once it
is available.

[1] https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/util.rs | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 332a64cfc6a9d7d787fbdc228887c0be53a97160..c50bfa5ab7fe385fae26c8909ae5984b96af618a 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -1,5 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::time::Duration;
+
+use kernel::prelude::*;
+use kernel::time::Instant;
+
 pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; N] {
     let src = s.as_bytes();
     let mut dst = [0; N];
@@ -19,3 +24,27 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
         Err(_) => kernel::build_error!("Bytes are not valid UTF-8."),
     }
 }
+
+/// Wait until `cond` is true or `timeout` elapsed.
+///
+/// When `cond` evaluates to `Some`, its return value is returned.
+///
+/// `Err(ETIMEDOUT)` is returned if `timeout` has been reached without `cond` evaluating to
+/// `Some`.
+///
+/// TODO: replace with `read_poll_timeout` once it is available.
+/// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
+#[expect(dead_code)]
+pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: F) -> Result<R> {
+    let start_time = Instant::now();
+
+    loop {
+        if let Some(ret) = cond() {
+            return Ok(ret);
+        }
+
+        if start_time.elapsed().as_nanos() > timeout.as_nanos() as i64 {
+            return Err(ETIMEDOUT);
+        }
+    }
+}

-- 
2.49.0

