Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE31CC0A72
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 03:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0441910E666;
	Tue, 16 Dec 2025 02:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uMM9NLnP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010004.outbound.protection.outlook.com
 [40.93.198.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EE510E655;
 Tue, 16 Dec 2025 02:57:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=be9BfmWu/Af3naBHDk+YcLeccwghRpLaeoTvj9n7OWvKkEtQRIV8HFYjxVCpAee6cX3O51/1piKlXMS73dPLASEZOufn+ZWCCzEnkUhbfpxzI+LxglJGMZTPFsosc6M7YfWcvYB3Z/A9EcqoHBaEW7h16wk0902R2arx7oiyLPmYuNBuyGnwyTZdNmOr2AYNkhmvK4seCUuvES1wJuGewAYoqRwudT2g4lqk0RHJ1HC9SwAqko6rXTuJFE4oOxid+DmTAOZpvCPoTfoxkMvmSoU+1NCuZ512VdjTmouLRZaD9HBEqCrauVDawH1FtAVEopWMB55ZfjjXECKFyaifzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqQeGrUBT3zxoQup1x2seIa70udMiUDP2ZzztQAhFi4=;
 b=iolUywqPoFvewZA8XAaGmn0NXFTaJ7xCXgPu1itpQOZlbrb8cN1i8nQDXVv5Yl01n/N12attyM+rto3C3/7yBqd9uZ0JeG4ddwmqzJghK23sf2GNKt6+hF4B69RgSu6xkbxGCE85NDuTecajzpDjlKWkQf2bH7gVVonQczA4AfhudcxsRpc3iwY+kGypTkzAaKPknOxMjRphWobh/H8/ncZ8XpBu0bNYyesd/QZvSwbgqilODuw8L/NOusiRGy2i3+yMVgmPSL8YvOXn8ZWqmXj2d8QM8F3FPB/hCEQbm+9FXm1rflZaIICwEqoVqJWZwzW/DiDOdakQEeed8ElDNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqQeGrUBT3zxoQup1x2seIa70udMiUDP2ZzztQAhFi4=;
 b=uMM9NLnPPK1vGkB0CQr4Y0fWJ4Du1r2jTQpYwS5eMcNPheRhslRYH8qgUnl6b23OSAkH2Z/HNkc5GQhH7yutTtyNSJMlIKPaYjWFUjwQGVE8vOCdRFTbsoj5tNbI2XvbIiPAd16s+uSIdWbKf4Sg0sCAuBChroDsc7SWi8aNhMHPuPYdIC1h4hhS5XGqU29uQe4paR2OIwGrZMAAjlcc/OfcYeHj1iJxsi48TKG2U+q0ePmeXMhDJhgf13gfO6AGqxnERnHKtmVH4Qj6fG56Rlhg2LO+dFqOsLUzRYoBl+8PrW1qu4kwel64xfhWhElsSVHGxUJx+taoyA7I30Pmhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7158.namprd12.prod.outlook.com (2603:10b6:510:22a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 02:57:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 02:57:38 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 11:57:08 +0900
Subject: [PATCH v3 2/4] gpu: nova-core: gsp: fix length of received
 messages
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-fixes-v3-2-c7469a71f7c4@nvidia.com>
References: <20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com>
In-Reply-To: <20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0113.jpnprd01.prod.outlook.com
 (2603:1096:405:378::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 225e4c5f-91ba-453c-04c7-08de3c4edf6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1RlN2drV2FlQUxPQUQ4T1VJREMvTTk5WmxvVklSakR2Z1dVcENUR1ptUjVk?=
 =?utf-8?B?YWFqbUlJeDYzMW1hZlBJc3dGS1Y4enpHNnVPZjVUalAwa2ZZb1Vva3FBRVBN?=
 =?utf-8?B?eW82TDB0Z1ptVEhsUlZjRk1acnE1YjdYd0M0enNkZG1nSTdmdHJXRTFWRGpO?=
 =?utf-8?B?WjZNNCsxUTZJNlhvSmt5dGw2aHJlcFNpZjArUHdHTU9EbWNaUklNN0JTVFVq?=
 =?utf-8?B?UkFXdkVWNmdSZjZXVmV0NWVCR0E2NmxZWHZ5L1A5RDN3R09HU21Id0k0YVJi?=
 =?utf-8?B?MWk5d0g0d2N5eEdGNHo1R0hCdjZCV005bTJNSEFTcFhKTm1tSGNWUUpGY2FQ?=
 =?utf-8?B?d1lhNnBIR0s0Ym9TRjdyNlhPY0hPK04xNjFDQmtKaFZ0TW8xT3RKT0JaOEl6?=
 =?utf-8?B?NFFaN2l4UkFpd2d5c0MyV0owTDdSaXFLQkMvdXlGM0tCRUlwRFVSL2lSdVFP?=
 =?utf-8?B?RHBsb1FwQXoxVXFmaFdrWmh3Z1ZKMDY0dTR6VnVDL0FJOEY2bUtJb0dnTjhQ?=
 =?utf-8?B?anErRmlFUmcxYW1VdmV5VTB2V0ZYTU05dmVwOWdqKy9wcU4zaGtMQVE4QkNB?=
 =?utf-8?B?Szk2YmJSa2padWVZZTN0ak01ZGExdEtFN0syYnBPY1hYWERHb3M4Q2dQSG5I?=
 =?utf-8?B?bUM1bHAydCtOQ0M1cUd2SnUwK1FXZlJPaDgxQTJ5cndNbHExN3RqUFV4allr?=
 =?utf-8?B?V0FMTWtvY3lQTlJkSzFmeTBrMGI1WDdoWk5CelBHNXJSSXo2dDVZVTFONWZ1?=
 =?utf-8?B?aU1FKytqQlk2bWRNanprUWN1SldWVk16eUo4TEhIeWhTV3RwU2RYc2lCeHJI?=
 =?utf-8?B?Mm9ZeW93eVpjOE9BbVBNSnQ3UG90eHlGZ3J1MXBaaGkvbisyVlQzbXJsSUo3?=
 =?utf-8?B?cXJGM2hVRVVjMjZVSDNxRThUN2k5Nk1GU2xncURIcStPRWRQSlFDeis2eUJm?=
 =?utf-8?B?OGRNQVp1YzRKSTUxRk1jWUFUTzdRQ21VVGV6bTlmTXlBUnZWWHg5TDFyWkxv?=
 =?utf-8?B?ZHBwMnBpVm9QL3RSbWRUb3dZNEJld3BMa0tRaStFdkVqM09IS0pQYWtnYzFh?=
 =?utf-8?B?Qm9oNk44d05lZzBaSFRNbi9DT29jVTRBSFpZWG03ZFR1SjlkUGlpMldXaTVn?=
 =?utf-8?B?aFRHc1hVWjF6SlFNb0t4ZHRqWUlGdllYemdYUjgrWGpqZHFIYnluWE1TTkhn?=
 =?utf-8?B?YXpYYk5XNmZub0JlaEh1cnIzamoyZ1ZSdTBjaERQSE1OMkFVVnB1YmpMMkND?=
 =?utf-8?B?WG1aSlU1dURvNmxTR1NTRHBXSDdkaTRTOTl2WHloU0JhV3JWYTVwcUZDNitR?=
 =?utf-8?B?WVJjd0wwazlXN053ckF4djdlYWl0ckxLMC9sNkFKY2srL0hVd1pjaG5aRkZB?=
 =?utf-8?B?UXIvNXZrbDZLaThBRzhXb0NCOFkxOTFxYWRwTytnM3F5VktkeWRjaTh3WlN0?=
 =?utf-8?B?bE9QTHVmSFNUcThsdXN3MDdOdTdiYStyZGlMb2g5QXd0R2NqOTVSYlpZNWh6?=
 =?utf-8?B?a1RCNVVTU2QyQnYrMDdoSExhaUhhZU5ibVVYZnpXVWIwb2U5cFN6TzlHMmh5?=
 =?utf-8?B?WGV2TlR3b2NqZ2prWjB1ZzNJa1J3dmExVTljcDl3MkJxeEtyaFhQZTRrNTd6?=
 =?utf-8?B?RkRIYlpLYkNTVmdyM3NWWFdNTHNxY3Vmek9LUW8zckJSWTBKUFh2Z1U1SHhC?=
 =?utf-8?B?anRtU2ptcm9ZYkY3SFFweDJLVVhQV1BUMlN0WHEybG1WNkpOeFMwRG1pT1p0?=
 =?utf-8?B?RlZ0QjQ1aFlpSm5FOHhUSmkyYmU5Vm9jdXdLZWt1VlIwYVRlNzlyaHdjSTdy?=
 =?utf-8?B?UDBIeldZYnMrUVRKbVkzMVAxQXVuR2UwTVlkZlBheUJGWkxXMTFvd00rYzhy?=
 =?utf-8?B?MnJaNzJlazI4ZG5CSkQ5OUlRUXp1eDZhajY3VExPSEkwMTFDUlhxUU1veDdF?=
 =?utf-8?B?d2F4ekp1aFpQckh5VG1ZandBb2hhTktTYVRDUmlaSFA2NXVjSjZlTk9nNW0r?=
 =?utf-8?Q?qo5SvMmCziD2X+vpz0UVBk/aU0Tvcw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3ViUkZyK0RVMDc3a01PR0dGdXQ3VCtQL3JtSlBVOGlwWEtINS9SYVVSSExy?=
 =?utf-8?B?VG5ad1RXYUF2eWE2SDllRzhoVDVkTHA3L1JOdHppZkF1Y085WDVzeS9nWEhm?=
 =?utf-8?B?QUU2dUVuRVVaQzRQNFc0YkJQZFZrWEczRFlnT29lSzZrQjArME9LV2hJN0lF?=
 =?utf-8?B?aWE1TXN6Q08yT21VTHRZeTZvZzgyUTlYRkpJY0xXS3gxVlFRRkp4cjFYWklE?=
 =?utf-8?B?YlRTNFVHRjhSY3ZFdDIvek5KNlJieXA1SXRLQ3lJSVJ2S2V0OHgva2prSnE5?=
 =?utf-8?B?UjAzR1VDQ2puNXJ5aUp4VkZtL3V4bjg3bU05eHNzbnpaZkpjYzJhK3RLZ0xn?=
 =?utf-8?B?S3V6U1JPc1pLdEQzSDgrQ1lCbmNuNzdIUTgrQ3Ntc1NqQWFDck03SkV6MDQx?=
 =?utf-8?B?d21PdDRaTHNGMVNrV2k4ditidHpwUWprRFdHMjV2L3BCUEtqZm83Zll1ZFdv?=
 =?utf-8?B?Ly8xQVJGbEViQVg5U0dxb3h4bmlMRFhkYVNwOXcyVVhwMHBmazVqcG04aklX?=
 =?utf-8?B?VWsxdTVEaGQrcU42RUZsOEFsUHFzaHlwMHg0UFh3b0Qrdm80NVlZTVcvMW9Q?=
 =?utf-8?B?OVhORXlSM3pTVFdrbHVVMXJvRmQxQm9EM09yMVJyVjBLSWJrQmpyT3NsYjRz?=
 =?utf-8?B?eGRjZ3h2RlBlNjRhT0JyWTFITVQ0aFVnbzdmb05Bektqd001cHhIMFFTbFZC?=
 =?utf-8?B?eWhGTTBtWUpFalVpUDlwSlFUaGtrZXpubEtSTVpsVm5JNnZSOWhqRzFlOFhp?=
 =?utf-8?B?Zm5ydUpHSnJIZzQ2MnRNMkdPUWw2TXVsemZ3NUxQUXlFa29Bb0dEMlBtYWZF?=
 =?utf-8?B?dWRqNHZPUFhtWWlucXdnK2kyWnNOVy80V2hMMTAwT1YrWkQ3MmlMS1R6cHdP?=
 =?utf-8?B?ZE52aUdtVTFYWjFnODRUMFRDcHlGTU5KbVUzRC9qSk5mbkNISlNxdDIzckpm?=
 =?utf-8?B?cGNuc0tsSFZ4VzdGbW9oL28zQ01YNHBqWVNCYmpWbm9rdW5panAyeFo5WjlD?=
 =?utf-8?B?VFl2QXpjbnRpTkRpSU1YOEYrR1BuREJJRGo0UmNBcC9Cc1laK0JjLy9kTFpz?=
 =?utf-8?B?RzUyWkp4em5LUDN6dXlDc3AvOHdLWUg0Q0x6L1h4ZFVkNTZmM0JDQjFYbmF5?=
 =?utf-8?B?Nzl6Zy9ES00wdVpDSExxSTdPL2FWdzVydlpvZTlLVWpsaWh0Z3FiOXZIUEpp?=
 =?utf-8?B?ZXQ2Q1RLUjJjcmZ2WXJpZFkzcGwxUk83MzJKSU9oQ2w5OGJYdGlaWkRtT1JS?=
 =?utf-8?B?Nkd1NDZiUSt5Vy8vcWwwaysrNnZHMWNkZnF6TkUybHpJbUF4cDA4b1NxRi9L?=
 =?utf-8?B?VklyWjRZR1NVTlJBTUZiSWpyTHE2QlZIamJ3RlBMUXV1ZGZjZWFicGdlY1Aw?=
 =?utf-8?B?ekMrZnFpKzdXY1VuYmFxUmZMZ0UzdHJyM1MyWm1HTjZkUWVja3FFYlBOZ3dm?=
 =?utf-8?B?OTErY0tINlQ1b2FiZ0d0ZzdMblkyVHFyM09oNjNZTEUrWE9iQjFxUkpnZmxL?=
 =?utf-8?B?ODY5dmNYNlJvRTR5aVJQYWZjUFRTOWJCRWxIVjBCQ3NHeVFJcGRJeTUwTkVJ?=
 =?utf-8?B?bEp0c2F0dk9uWHNjbkR2TUtTRHJocVJzczh3UUIwaTVLNE9zSWprc3pLYUYz?=
 =?utf-8?B?RktYOXhjTWJoUFdLOTBGNEorRUFqL2M5L0l5ZENGd0taUTdHNklhWlVnbFds?=
 =?utf-8?B?dmdUM1gxcTFLcDMyWG1Hc0NKeHA2R05NN0xVN1RnaGxtSE0zVDg2ajBobWlY?=
 =?utf-8?B?cDdMMDNYVk0yVTFreXBYNHdPQmdRNVdQSzc2VlZnUk9EL3o5bEpHVTBlZG0w?=
 =?utf-8?B?dUVtcytONW5oclAzUGdsR3FVclJaUjVoY2F5ZEIvT3gyZ1dxd2tGTFhLL0lM?=
 =?utf-8?B?bnl0TXU0OXJSOElYOWUwOFN3QTllMTA4RU11bTVGVnFqZFMxcjY5N0FmeXVC?=
 =?utf-8?B?MHhLVFhmcXpyZG1ISnM3ZzVlUE92MDNheUJrenpWWFh3NlprWW9IR3FHSW1O?=
 =?utf-8?B?RDZFc2NKV244KzVjd0hSRXRBZXNvZ1NQajR1SGZzK3NTNmtnT3Jsd0gxSzdM?=
 =?utf-8?B?bzkwL3FhdjJoQmtNWElVMW93RjZZRWw1ZXJaSVRHaFNqSDJ6K2xxOWY1a2ZG?=
 =?utf-8?B?a2srUWpqVEltdVQyZzl2VTFRellsLzF4NDZLQTNNQ1F6WmgycnZ2NG1WbWpN?=
 =?utf-8?Q?Lsu07G0a0ZSx/hf1pUWBreP9mtTg6kZdom7QAgXtc2iR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 225e4c5f-91ba-453c-04c7-08de3c4edf6c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:57:38.7768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FmdVuAYUBWx7BLl7NOhNlW66K0xfo702Ws0jXDn+OEcWjyFC8HIpC88H12+c26/T6fWAU9gDOzIn0/gUW12Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7158
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

The size of messages' payload is miscalculated, leading to extra data
passed to the message handler. While this is not a problem with our
current set of commands, others with a variable-length payload may
misbehave. Fix this by introducing a method returning the payload size
and using it.

Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 10 ++++++----
 drivers/gpu/nova-core/gsp/fw.rs   | 13 +++++++++----
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 6f946d14868a..7985a0b3f769 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -588,21 +588,23 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
             header.length(),
         );
 
+        let payload_length = header.payload_length();
+
         // Check that the driver read area is large enough for the message.
-        if slice_1.len() + slice_2.len() < header.length() {
+        if slice_1.len() + slice_2.len() < payload_length {
             return Err(EIO);
         }
 
         // Cut the message slices down to the actual length of the message.
-        let (slice_1, slice_2) = if slice_1.len() > header.length() {
+        let (slice_1, slice_2) = if slice_1.len() > payload_length {
             // PANIC: we checked above that `slice_1` is at least as long as `msg_header.length()`.
-            (slice_1.split_at(header.length()).0, &slice_2[0..0])
+            (slice_1.split_at(payload_length).0, &slice_2[0..0])
         } else {
             (
                 slice_1,
                 // PANIC: we checked above that `slice_1.len() + slice_2.len()` is at least as
                 // large as `msg_header.length()`.
-                slice_2.split_at(header.length() - slice_1.len()).0,
+                slice_2.split_at(payload_length - slice_1.len()).0,
             )
         };
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index abffd6beec65..7b8e710b33e7 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -853,11 +853,16 @@ pub(crate) fn set_checksum(&mut self, checksum: u32) {
         self.inner.checkSum = checksum;
     }
 
-    /// Returns the total length of the message.
+    /// Returns the length of the message's payload.
+    pub(crate) fn payload_length(&self) -> usize {
+        // `rpc.length` includes the length of the RPC message header.
+        num::u32_as_usize(self.inner.rpc.length)
+            .saturating_sub(size_of::<bindings::rpc_message_header_v>())
+    }
+
+    /// Returns the total length of the message, message and RPC headers included.
     pub(crate) fn length(&self) -> usize {
-        // `rpc.length` includes the length of the GspRpcHeader but not the message header.
-        size_of::<Self>() - size_of::<bindings::rpc_message_header_v>()
-            + num::u32_as_usize(self.inner.rpc.length)
+        size_of::<Self>() + self.payload_length()
     }
 
     // Returns the sequence number of the message.

-- 
2.52.0

