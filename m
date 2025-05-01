Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B23AA5ECC
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCA110E840;
	Thu,  1 May 2025 12:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N8v18Ft5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC2E10E841;
 Thu,  1 May 2025 12:59:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q7HdLFxiCKrPLPU8NjA9BjqF06EbCxgoZ1vBcJfgMJJX5Qkt4fbTA0WqffIUZuQENSyCEhbO/x+F0CKKmxva0SCkq/X5YwEImFykuPBQXZwUWNAfI2R1jRjDfyGUHQB6D7ZOEVZrvfQofSZHAd7C8GNmL3gnq2hShvAR5g4V14yHmtqzav93lVmazYI1BznAYQwuVvZeBxF4RAlYox/EKQT2vbKCS6rwzuByAz5jIUOtCWpk35RPe0sHWMSZLibxGaAlg+nUo+SPH4VPgpVhY25JRea+xNtGrM3YBdF5BMnXyFqpxQpGT2DKojIHlh//KVdwe9htewDjKklygpj+mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xu1gCqKpjRNF7lXL4DddQp6G2VmfwhdeTAEJNkzZaoY=;
 b=j7JJO/o70haaNcyQsx1QqNChXr/rS2WeHJUpwiny6xnllFGoJH14najaH+52oFVYx83lV62UrQ6PX29R333OQEEklejf9AC8b3HPZZwf6zM/S9touPnaB+TqegBiSp77YZ/T3EnEG0M/i6CKREnuN6SIf+y0vRA+u+LD3q/rnuX3QEf3pJPYiudDbkE2N76Ca4nkGhH4PYIbfPv7fghJRhbbyxfmGV2sW6SKiXt5semIPB/XXvGTZLX44WX/O347VEhKCXrlFcicIR6aGyOsAa9BlSODP/djBMqvnYr7Vbf8B863kmoaHyeW2+/PJvGkqhNaOeN+tjOuuwfBOkXNPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xu1gCqKpjRNF7lXL4DddQp6G2VmfwhdeTAEJNkzZaoY=;
 b=N8v18Ft5Knv8mvSxrazT9w02XBfbz8xr/wmKJIBhdJ8mmq60nKEvO0LoX/fT185Y7mjlmH1bI6pVQPkN6LPPuzTKZTD46/TIfJEUwX4KbHi/2VDyQoHh8t1lsKDiYsAgXjFSSTvzn7yzUFQRzfysy+ZwML1FGs06U4cTgruZhjNKrRrBjU3I0vLlhCemyAgPWOLMAowEfwzTh1kHqw3WIr5KhZRFfAfzbMzfCpD1E7/CbSlzLQTiP2OE5PROtkftujmO8rfz0icsvXzwd+CmAD14eU8/Mta/yAwPRs7TIrx5um561tdvBrvfoY57IXuh8IUojM3OZp6p25Fxqh2Qcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Thu, 1 May
 2025 12:59:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:59:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:31 +0900
Subject: [PATCH v2 13/21] gpu: nova-core: register sysmem flush page
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-13-b4a137175337@nvidia.com>
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
X-ClientProxiedBy: TY2PR04CA0023.apcprd04.prod.outlook.com
 (2603:1096:404:f6::35) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 70571dae-3d02-440c-0352-08dd88b00391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXY0TUdDZXJ5N1lmcjB3S01wdEwzUTZVMHpsNEVnekpBTkxNc0YwYURhQUd1?=
 =?utf-8?B?a1hLa1lkUENnakJlWVBscHpqdjZuL2pZaXFKaGVSZ0UyeENZd1FON3hjakdL?=
 =?utf-8?B?b1V6RXNMOUZzSXFsYWJxdHhCc0JXWHZWaXcvRWNoWTRHNXNmbXU0Z3JWaVpI?=
 =?utf-8?B?MlZSbmp1TXl6R2o2WHd0NEpLWWhHbWkwY0QvVzFXeXlmYjk1cnFmUHd1Q1Nj?=
 =?utf-8?B?c21tTm9iQTZGWE9VS2w2NmVkdmJWK1NITXpiQ2hjL0RNdTBzcE5jZ3BoQm9J?=
 =?utf-8?B?TURuZTUyTSsvRm9BNklYaWszRzM0V3FBMGlnMTVZTm9RL1d5cWZDL0hkV0dv?=
 =?utf-8?B?UkxyOFRiaTkvT0l2NDJCNTc2eXBBM0ozdXJOTG1PZVVBMVVHOG1XWVRySnhZ?=
 =?utf-8?B?MlhrVm1JcHdKemFuV1pYOHNPd2pWa2dBWDBqL2I2ejFWejloZFI0QjUwcTBt?=
 =?utf-8?B?RUNtMnNVRDMyL0hmVFdKMkUzSTlrbUFLVVpWZUM1bEdKVHd0d2g1d1Y3N08r?=
 =?utf-8?B?UlZLcTRpanduWWZUYU9JVStud09hUVlFMXRGQTg2Z2dNeUxwNXZZeENVc2Q5?=
 =?utf-8?B?aTUxRS9Ebk5yNUNZa1ZYRTh5b2hnVysxMktidGtUb1FOMm5scndHTzM5TVEr?=
 =?utf-8?B?M0pGdEVxaWZkK3pDMkpQVm5RSlVheUlDeFZvM2xHQ3ZMVlYrK296S0IwTW1X?=
 =?utf-8?B?UUt0RlM3bVZkQ0pLbGxPYmRXemtDWkU4blB5ZGQxWDJKdldWRVovV3A4bXY2?=
 =?utf-8?B?czQzcy9tc0k1S0htTGtmUVNEcG1sMERuR1R2K3BneWJaVWg2UHFlZnpsZ0Zm?=
 =?utf-8?B?V2N3NUM4UG1rN3NtQlEvZkRKcEViMmlhL3hGZXl0L1lVTnYraUVtajZ0eElF?=
 =?utf-8?B?dWFpTFQ2cFA0ZzU3RTJtZlR4ZnMvRncwV05aaEpzd1B3cmhoZ2IxUVAwdjhT?=
 =?utf-8?B?eGpHTVNta1lZSVJGWFdZR0Q5RkxRcTBTNDhvZkI2clBSY1Rqak5Hajl6VHQ5?=
 =?utf-8?B?S0pZODlxUjkrNDY1UHp2MFo2eEJtaHlXemVaTkIzNEZkSTJvNFAyVFIxU0tv?=
 =?utf-8?B?ZXNIbFhHdUZNMnhUY0M3Q1JYREVjVHF0c21DZjJYZ1IwY1BPYlh5RTVCb3ZG?=
 =?utf-8?B?Q0VmdlhJdjdYcklER21iemlYcGdpYTV4VldKU2NGN1ozY0ZLTGc4Z0thb0dx?=
 =?utf-8?B?TWN6cmlLY3hEOXhlLyszZ0VvNzlUZ1R6ajJPUUhKSmFEQ2tQZDRaak96WUVL?=
 =?utf-8?B?ZEoyR1lydHhmWm04eUlXWUNZSTVabWwzV3AzRC85ajc5WkpKZVdtekczcDgx?=
 =?utf-8?B?aW15YWpLWXZMd29HOWlrODdRVXdIcU9WeDhnTWgrV1BuQVVXUVZ0ekpSSGxL?=
 =?utf-8?B?UnBXTTYyaXdERk9kM2E0b2NHT0NxV2FvckR2dWgrcjdsYS9nV09jUXB1MEtS?=
 =?utf-8?B?SUV3bnAzcUlvWFBhTW1sbWJFVUxGaytzbDN5REQyOHk3NkttVG8wL1FEdDRI?=
 =?utf-8?B?aWZaT21ZK0Fqa2lWODZYcWhkUFpyNXpFVEduUFc2VVVUdmNubDBFYjUrNU9Y?=
 =?utf-8?B?SGpBQ1ZlcjUwN2RNSXBYTkl6ckhTajY5ODFTYWhCVWtNTzZLTVZkMTlCZFNG?=
 =?utf-8?B?amdGcW15VGxNbVdLaXJza3UvQUJ3TEhRc2lIM2dWMlpKUTRTQjYxdjZ5eDZy?=
 =?utf-8?B?cHhNTGpiZ3lWb3ljb3J0YmJzZzUwc05CUHZ1WFN3SmxNeFpkVHpmNDBrS1pN?=
 =?utf-8?B?dklibDFvWXNnN1JBd1Z5eW5ib3pwRnV0TW8rc1JSMlBRb1ZNaE5zVTdjVE5E?=
 =?utf-8?B?TTYvU1JWZlF3M1Z4YS85NURyd1VDMjAxRzJsUi9uVXZWdjM1Smg1NWJRMmRI?=
 =?utf-8?B?OVNTTWNKWDhDcWZKQzhHTlM2dTMrMjAyZkNrbStEei9YQmJVczNOcUw4cVZR?=
 =?utf-8?B?QzRMZkJjQUQrZ0c1dzNocXhaNHhnSU1SdGFrN3Q5R0x1QzAwcWlKYmJlNldn?=
 =?utf-8?B?eVUwbkc4UFpnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXdCWlF3RXEzTTc5UHUvb01uZWtWRVhIRHJDeHhmS09PT3JXU2svWHJFWTJz?=
 =?utf-8?B?dkNhYkt4M1NCM01PaUNkUW5GclZmN1IwWEZFaWFlcWpLRDlQbUgzODVqYU1w?=
 =?utf-8?B?UXVLS3JxK3A1TlhQeTh4Sy83ekI2Vzk5RlVVeGtkaTN0VndUdFhjbE5LV2o3?=
 =?utf-8?B?eWVsaEE4OHoweFlRQWt6VHpOVjVoS2JJOG5Gd1hhUVVTd05VejhFRTNLbVZC?=
 =?utf-8?B?azNJVFh5QW5wUVBNd1o3QnROeHY4NFJvN0paZ0xIOU1Md3EwRGJDOVVIakpM?=
 =?utf-8?B?czA1Nk40TU9OVUhmRVh5aW9LMkR2Y3NNU3hycWtPTFRGblBkaDVxdWYvWmxM?=
 =?utf-8?B?K2xuNE1nWDBPb0NzZllpUm1hMHpid09ML0VXM3ZpcHJacFgveXJLL0lHYW5M?=
 =?utf-8?B?aFFIRTc4THZqejl6U2lyRVdobmFUK294blA2RzBpS1lqQW95eU9OVFE4eWZm?=
 =?utf-8?B?SWUwYlo5Wm5VMmNoZ29neEFHWDdkcFpzN0o1Q2pySFRlRm1LZGxpdmxVOGFS?=
 =?utf-8?B?dnR0UW8yWXJvMElrTDFra3BoUG5UMnczNElyMnE5MzQ5WnpjR29YcE9ydXVz?=
 =?utf-8?B?aFg1R04vK1ZZcVE1RndZalRYSTJwSUNJNVBnbDVGVWpSRlM0d05uMXZJVDJU?=
 =?utf-8?B?SFM1dzUwalJwMmNjRW5jUWtWWjQ0VXpjWFJLdHJLZ2FRb3JNVVBZcTJGNStp?=
 =?utf-8?B?ZHptdkZYZHE1NlBDUjYrK1hYVkRVbldxUFJWTHZkekR4aGd3ZUZJKzc2cVhi?=
 =?utf-8?B?OXB0enUvSjQzVTVobHFLTzRWeUNWUGtFbkFQR2JFR253Zm5CUmNWN3ZkMkR4?=
 =?utf-8?B?TlFWUGxTMHo4WTg3MENGck1YaTNnTm1aOEh5VkJnVmh2ditXbUx0ckNWNmJU?=
 =?utf-8?B?dkNBMzhQeUpYcEloUGF0U0xtVEN4RGlya3RITmZhRkVuTlJKcFJGejI0Z2dy?=
 =?utf-8?B?RWlnc2VjME5YbmczMzlOc2gzaDIvK3duNCtvVjlrRFJQRzlIMEJvYnIreFVa?=
 =?utf-8?B?NC9JbmppTmFUakVMSk91WEc1SWFoVE4yK0NBOElXOUpmemVlU1RmdjRlK1U0?=
 =?utf-8?B?ZG50aUJpVEtJZ2Zyc0pKZXlENUo0emcvQ1pkTG1oZHovVlFwa2E5bUNoVlBQ?=
 =?utf-8?B?bk8yR3liYkI4TzVudXV4UUZaTlIxYm13K1FEaGxWem5NNDBnUWprQVMyOUdV?=
 =?utf-8?B?WUlMUG1sQ3Buc1pCaGJtMnZWVXgzZ214NnZmc2hOTGFQaXJMd1R4MGVON1pz?=
 =?utf-8?B?ZDYxS0o0c2l3V3FGeHRqd1Z4ejcvL1BCT3dOUjJlRXFFN1hqWlZFWkcrRko5?=
 =?utf-8?B?dW5la1o4SE11V3l2eUFiblZDamtvOXlOUkZzVTNCbjV4b1g0M0pMcjkwcEx0?=
 =?utf-8?B?a2xXaWxCMm9DN2VmbGsxWmlZbmtIMGt6bGY4SEg2REtQVWR3dG5QamRORTBZ?=
 =?utf-8?B?NE43R1JQckU5L3dzbjhyejltekhySmtsZzM4citMN0p6eVFsU0JIWmR2Z3JQ?=
 =?utf-8?B?czhqS0pHakU2VnVMUGdjQ29pTndZclJOVU1BelhWSnBaUDVPZ0JEZk1iR01l?=
 =?utf-8?B?bUZUUmNqK0pjR0p3WTJyREVPRG9PdjBUSVcvZ3N1c3U2QjNCUWFTcFM1QzdY?=
 =?utf-8?B?REN0T2ZTZ1pjR3lkZjJDOFZ0ZmxTekZocHhJVXBldkhTdHZBalJncms3b3Zp?=
 =?utf-8?B?WlltM3BKcmllNmJiTHoyUENML3YwbXBVaUZBOTVBcE9IUUkzM0ZZNXBjUEhW?=
 =?utf-8?B?NGhjS3NQaHpZc2hienZTN1NvbHViWW1KbEdqdkM4NTR3RlMrbGlmUUpQRjEy?=
 =?utf-8?B?OEhUaDlvRmlkTnc0bU9IeGdMd2xkNXNhM3RvdHVmM1ZlbjJGRlM1M21XRmsy?=
 =?utf-8?B?SGQ3QTR5WUF6NXBQTDl2c01qTkhFMXo2L0JPT2NJbmpuUHg2R2ZJeld3dHVP?=
 =?utf-8?B?dldmcVVoQndWVm8rMWNBWHpzdjFUT09MeUtsMWxmVHlWM24yMERncktuZk9r?=
 =?utf-8?B?YVE5NU50NFVuVDFUTjVwZ0JhZ29DVUZFN2w3VENmdmo3b2xOY2hsektjZ2ts?=
 =?utf-8?B?SE4vbHducSs0U2pjQlJRMi94clk1NGJXdTJPWEJCT1o5MU41NzFiaGpSUnlu?=
 =?utf-8?B?L2hwT3p5TmF1amcwSmc0NXV0bVJ5UFhpWkNNZWlOa3RsUmp2QkF1T01DYkpF?=
 =?utf-8?Q?EGdOyAXNVoR8oZpWP0YkNSZU3+Dj42lh1127CAnuDoPw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70571dae-3d02-440c-0352-08dd88b00391
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:59:31.4602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k24Tj2f6//leTz1k3GW7YoHVg3Tx/8gksbUokI+gB1I2SzIlVGRvHnZGl716WI852FrwOsUzd4mWp4Gju6DC0w==
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

A page of system memory is reserved so sysmembar can perform a read on
it if a system write occurred since the last flush. Do this early as it
can be required to e.g. reset the GPU falcons.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 51 +++++++++++++++++++++++++++++++++++++++++--
 drivers/gpu/nova-core/regs.rs | 10 +++++++++
 2 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index ac246d08141e95927a25cada4ecb7e23156ac6b4..08302967375274fd88bb9b4fef4969e79e82f3b4 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -3,6 +3,7 @@
 use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
 
 use crate::devinit;
+use crate::dma::DmaObject;
 use crate::driver::Bar0;
 use crate::firmware::Firmware;
 use crate::regs;
@@ -158,12 +159,32 @@ fn new(bar: &Devres<Bar0>) -> Result<Spec> {
 }
 
 /// Structure holding the resources required to operate the GPU.
-#[pin_data]
+#[pin_data(PinnedDrop)]
 pub(crate) struct Gpu {
     spec: Spec,
     /// MMIO mapping of PCI BAR 0
     bar: Devres<Bar0>,
     fw: Firmware,
+    // System memory page required for flushing all pending GPU-side memory writes done through
+    // PCIE into system memory.
+    sysmem_flush: DmaObject,
+}
+
+#[pinned_drop]
+impl PinnedDrop for Gpu {
+    fn drop(self: Pin<&mut Self>) {
+        // Unregister the sysmem flush page before we release it.
+        let _ = with_bar!(&self.bar, |b| {
+            regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
+                .set_adr_39_08(0)
+                .write(b);
+            if self.spec.chipset >= Chipset::GA102 {
+                regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
+                    .set_adr_63_40(0)
+                    .write(b);
+            }
+        });
+    }
 }
 
 impl Gpu {
@@ -186,6 +207,32 @@ pub(crate) fn new(
         devinit::wait_gfw_boot_completion(&bar)
             .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
 
-        Ok(pin_init!(Self { spec, bar, fw }))
+        // System memory page required for sysmembar to properly flush into system memory.
+        let sysmem_flush = {
+            let page = DmaObject::new(pdev.as_ref(), kernel::bindings::PAGE_SIZE)?;
+
+            // Register the sysmem flush page.
+            with_bar!(bar, |b| {
+                let handle = page.dma_handle();
+
+                regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
+                    .set_adr_39_08((handle >> 8) as u32)
+                    .write(b);
+                if spec.chipset >= Chipset::GA102 {
+                    regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
+                        .set_adr_63_40((handle >> 40) as u32)
+                        .write(b);
+                }
+            })?;
+
+            page
+        };
+
+        Ok(pin_init!(Self {
+            spec,
+            bar,
+            fw,
+            sysmem_flush,
+        }))
     }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 401d885539cee03cbe732102f5e2233785a7b284..218cb6441eb0e5c6e5b52eabba006163eec0c8b4 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -39,6 +39,16 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
     }
 }
 
+/* PFB */
+
+register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
+    31:0    adr_39_08 as u32;
+});
+
+register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI @ 0x00100c40 {
+    23:0    adr_63_40 as u32;
+});
+
 /* PGC6 */
 
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {

-- 
2.49.0

