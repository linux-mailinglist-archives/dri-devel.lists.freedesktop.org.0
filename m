Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 459BAB52F39
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A625610EA8A;
	Thu, 11 Sep 2025 11:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I92waIfd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2057.outbound.protection.outlook.com [40.107.96.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FB510EA90;
 Thu, 11 Sep 2025 11:05:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUqst1Wr4k/UoFtxlkXBFlO5BaavI8qBsQqzkZGugprjCsUd6dA+g+RnjRdWQHttu6Hq+tMU0ffhaqb7HNnT/FVhZAJhnhXETGnAREWwth2UXfKgCEWAiBXMGP1EJNkpx4Fbpi9QFqujPNWGjB7lOzkg7l059vhAB9z64zFYAUG4gWPBkeHRKnHgi6/2NVdHJxcSV9aSuckocqSLRb/Plv+YgkumTsGOiJk0F0H0aKTyXlwXrBe9hopoFwkekzc9joaQe050LKgEQx+SeKHvUA600c1/C5l+5Jwyto69rMNUFEH+GCQ1V9LqBn6s+sKLvfq9IcfsZvLoGii0cpTA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWIv5PWf0wG2UDAvghOFy/oPmPtgWy7aJP+/t52vCtc=;
 b=caCCqwP29mubt8baDUxA04Bmr3qjtAMRulMioQXV/W7qRRIez+dFB597iPfcDkQEbbxPVBZx9aLy5M6E67JXNYvQk/rdgfR/7/qywpxj00RHYEgMCd/ugAe1C9ExYt8dqd9/jchiymNY0T5d5GwK44UQqX9H8GImQDdukiGrUWZuW5djO+RjYZDzIBzJHKj9JLYt7CvRSLPmTqxFO078RBG0/ctl1RuWjiTNwsVkajsmwD8qG/eNBpAlBOtUaNMVPdI3/RetDXYarlHKdNrkBQN5nzzwr2kgRBrW+NfvFnhHqaFBFxJZtUvmf5uGzeRqxCulphIZOIwwLIBO64lDvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWIv5PWf0wG2UDAvghOFy/oPmPtgWy7aJP+/t52vCtc=;
 b=I92waIfdwrPrKePAEktX0EDxUBxZxNyjqV+tJcja8lHGDdEqKxoNzwXxbNvRtmKD93zluw0l6SWVOsSL58KdOwTGX+3at6+Oi9Xt5l6WUSw8Mg1RnsuxmSdBs1TjSuZMGAiqwun6eKvp+3vWWtBpF/BBH72ly9nT4/cBpBbuQtmO0nSP6JIWk0Fm7VTRCK3FHCm/JHtLNNTZ+qTzYzO5V/JFnm9pWrZ8Z8nd76aK/ss9idIMiipJItaVw76Xdl1OqvYXZmABVHrV0SJKRN5wTcdFHnm1nh/98Pbv4kYiiC1c/z2Vx9ejX0t6acntiYJpf+7Xul+XWIQkBd9+098gFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH8PR12MB9840.namprd12.prod.outlook.com (2603:10b6:610:271::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:05:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:05:14 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 11 Sep 2025 20:04:37 +0900
Subject: [PATCH v5 12/12] gpu: nova-core: compute layout of more
 framebuffer regions required for GSP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-nova_firmware-v5-12-5a8a33bddca1@nvidia.com>
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
In-Reply-To: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH8PR12MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: 0970eb45-8f79-4a8f-5379-08ddf12315a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L20yaTJIR2hsd1VJdlFsajB2dHZiNEpHcG1QTnU1VC9qY0lSTVdVYzBtQnZs?=
 =?utf-8?B?dldBSjl4elRUYmkxbCt4WUpqNk9uMHc2RlNjQk5pckxQaTZxYUpDUTVFOXBp?=
 =?utf-8?B?SFNOYzdmOU54U0p3bzVVMTVUM0UzL3VpS0Fya09vcmNueWx5Mm1MVWhzNEhN?=
 =?utf-8?B?NURTVVUwcUdZM3orS2JyVGxENWZrVmozWjRNdTlMSGhpS01EbjNLUXdTcmNU?=
 =?utf-8?B?dzFTQmsrOVpBRkxpeFkveGJoYVJkZ2tId1BCaTNVVUxoY1R3RXBsa1FkZ1Ja?=
 =?utf-8?B?bFNnZjVVVzhCdE1IdUk2bWZPK2hxVGVVcGVsUzZNYUlwODZPbjBBczVyOThT?=
 =?utf-8?B?elp6Z29XUDNKTEJTT0JuakxMcW16MWtYOEsrYTlyRXV3ZVJBUC8rOE91UzZW?=
 =?utf-8?B?ZEJaSHdaM1hOT3JUbCs3VFF3eTV2bFRHYzJXZEU4eFM0a2ltcXRyZmVSZmdn?=
 =?utf-8?B?NXRFWDEvenpUQ2xOakZUQ083UmJXUEJta0dCOUtTN3pjTW9iRFJ4R1FuWUpJ?=
 =?utf-8?B?RUJnR2s1eFFpdXFqZ3JWelBJS2N3VjlpUTV1MDU0QU1BVDE3VzdPOXhZMVFB?=
 =?utf-8?B?dW11M2F6RGFGVkp2azFJUlllUjVhb2hwRmloRVV3T2xnR25iYUhGT0p3KzB5?=
 =?utf-8?B?OEF4clRPMmNKUFp2WTdicjF5bHpOMmErT3cvem96d1lzYndHMktUVnc2MGZ4?=
 =?utf-8?B?R0JRa0NGdUNBUytYRW80REFKeHlPb2dBeThOeitBd2R0WmRNalMwV1R3ZFk2?=
 =?utf-8?B?WTRSaXIvT3JyZzZIR1hueGdXQzVkUkhvelk1Z0pBOWJpNktJVkhIRUd4ZFNo?=
 =?utf-8?B?TTdKQVRCdDBkTS9NZGl5QU00WTJBaVdxcnF5YVVpZWpNMjFLUTZaclZkN2JM?=
 =?utf-8?B?MU9uMHQxYVFGNXRvVjFTNTBwOTFOOXQ2TC90eEtBT3VzcWJadVVHcExtb3Ro?=
 =?utf-8?B?am1nV2cxKy9GU1ZFUHZVeWZ5MkduekxDZ0pVcTV4TmlxcVVkb3JNU1E4bXhW?=
 =?utf-8?B?Z0JQUXlpbUEyYTJjVDNPajN2Vm9iZzZvOGI1QWRpeHhyNjJSbHlzdWVud3c5?=
 =?utf-8?B?bEpVZGpTbnBUL051QXdtemJwQ2hmQy95cjdWOUwwdHVLbGd6N1BRblpPZlNl?=
 =?utf-8?B?cXZSYWIySXJwSEtYb2lQallIV3oyTVBMNm5TcGtYMWNxZWlQRDBvaXloa0w4?=
 =?utf-8?B?Z3ZqV0tMWjlqbG4vamljcWIybVZFVHB3eWQzaGg5WlltUGJjMGt3UEhVa1NF?=
 =?utf-8?B?eEhXdHNoR0VZbXVKTS9HcXUvZ015NW8xcEFOUk0yQnFMaW9mRFJGUDYyaHVB?=
 =?utf-8?B?c1J0aXhJWENHTUJsNmFYS0JLZG1OZ1NLbEVqUXk3RklSdlFXVmhCampua3Ri?=
 =?utf-8?B?djVDUWpmamdSakFkdjUyZ0NiYTJwNWxuWVVPamttNjh3SWdLay9sNmMyeUhk?=
 =?utf-8?B?cjNxSFJmcjZvVUFvOHA5N1dIVFBQS3Q4R0JyWGpDUFJvdFZOOTRxbWFxUFVz?=
 =?utf-8?B?bUZqekJuNThoaFJpK0p2RlFiUGoyVi9CM2kzaC9Wd3NUdWVPYU93SEtlQys4?=
 =?utf-8?B?QS8rVXRyelBoWnlBT01SOFF6UzZwODdEcEtBYWZiY2xpVEx0R1BIWS9tWk0x?=
 =?utf-8?B?NUxPN0YwTnJzTDJ2QjFodnh5VWt0NDdRM2tlL1M4QWl3bFlRTzhaMG03aWF1?=
 =?utf-8?B?UGo3enVDeFp2SVBHd2lHU3pCVGJuVmJ5dXhnTlVOcXJsMVRIaXhscnlBNDF0?=
 =?utf-8?B?d256Szk3SFdOdXdGUUx2b0U3RlpqWTNOMTUycmxIYmdMRWE1aDI3cFdUWUJO?=
 =?utf-8?B?Z1JKNzJhWkUxckpvZmx3bWJDSnllMURZUTVqTU5xZTdnd1phM1NNYmE0dVk3?=
 =?utf-8?B?RlJJWk9TZ2hKcmpacnRSeVJZNjdxcENkMzdxd0hSKzdPQTVYSk1jWk1CVjFm?=
 =?utf-8?B?T2tVOW9oUkZldkNvN29PT2JuMGhDalR4OUVGdzFZY2dHelIrWWFBK0xCL0JJ?=
 =?utf-8?B?d1UwRmNQZ0xRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHcxR0tDRGFZMVdJVlo3MGtMdVlpcFV3TXRLam1EVStabnNUbkkvQ1VIWEpl?=
 =?utf-8?B?aFY4RnkzZjQ1NURNanhrV0FFcTNUSDVGM1pKRDUzV0h4UVNlM2NKNy9ZaWxi?=
 =?utf-8?B?TEJWU2ZVTWFTVWZDdmdxSGltOHlGVGUwaWJHT0oyVmM2b3RnZXRYMGJaeExw?=
 =?utf-8?B?ZjA2Sll6Qzk2ZFp5VzBuWVZDUjZTcklKMDRmRVJ0VkZTdHd4Tnh2RmZqV2RQ?=
 =?utf-8?B?VXBoQTRHOUJ6TGlqRWRSVmZHVzEyM2puRW5kSm1icDZTQ2dKZ05qMzhjL0JZ?=
 =?utf-8?B?UWhRTHg1QTIwYTB1V2tLTENOdFF0eXlmTk4xdDdUWHF0bk40ellUK3JYUEZ5?=
 =?utf-8?B?cVg3SmNqVHJaaTNnSk5RZnBieDVrV09QOWFlS2xRU1RGdHdtRENNQlRVSHJF?=
 =?utf-8?B?THkxblllRVVmM1czWUxOREd1Nkh6cUFuSTZaK09EUUZIMTl2OFVndG5aTDc1?=
 =?utf-8?B?VDcrNjk0b08xTmp6N29lVjV2NUY1SFFBUThwU0V3ZXBIdHhZcm9ZUzFnT0Fr?=
 =?utf-8?B?bzJPRXFJWE1BbVdPY2VvT0plbHp4RUxGQTNEY2pIS2JjaVlYaWJnK2lnUWYx?=
 =?utf-8?B?NmlVTGNsa3k4bnNlYXRnMDVQeWtHRld0dk5nV3J6QktDSFkrVkx0SWJtTzJL?=
 =?utf-8?B?ckowYXJidWdPUk5ic0t6N1lHS0tRUmpiMi9CeUg3RmhTeG9qdEhpdHBIV1F4?=
 =?utf-8?B?SDZsa0o3R2N1bWx1aVo4c0tKN0sxQXFKcDZwNzRlM28zMU5FQW5yY3hiNHlR?=
 =?utf-8?B?NmIzZ1hkOFV3eFo5QnYyR3NwSVE2QUZsazVWbERtdTBVc3hydUlFSTdDTmMz?=
 =?utf-8?B?WFVsRm94V2RwM2VKWjJMUEh4Z3BCdnNZckZQdU9lVk1UMGF2aGpjajlPblM3?=
 =?utf-8?B?bGlVZitOcEVzdk81RzZiaklJWVVSa01pcktXcmY4YStjOUh0Wmp5K3BkZkJw?=
 =?utf-8?B?cTQ3MGtBSC94NUdhUjQyS1YwT2VSaUxxWU8yK1pFa1VWQ0w2Umd0N1BSZnB1?=
 =?utf-8?B?bzEwb1llQURwM1JJTjNQTFUrSWEyZ1hmeVZuV3BPSkIxekIzZkMwVzk0Q2pt?=
 =?utf-8?B?OTRjNlhqOFNRSDNQSTZXRzQ0ZVpmQWdPaVRBdUhaZ3VpOHp0RUgxMER6M3Fz?=
 =?utf-8?B?L1JCZkpJZHZDaWwxeXZnZ21UcDlYY2dpdTNEZWNZeXB1M0VkNGRiNzJzZDNX?=
 =?utf-8?B?OFh0a3FJZGtuQ2lpSGNiNkp6SG1xaTFZVEUxWWJWVnlQdnk2aFNiNlRrTEt1?=
 =?utf-8?B?WGx0bWN1dFNYYmRkSG9oODRRNzdJWDU5anhUdUFCb2kydi9JTzI3NDFoQ1FZ?=
 =?utf-8?B?b3R3ZGxUTjhWWmsxblptdTRiY2hFMVdIMC9xNEcwL3VUcUFybXRDWTlHNWZx?=
 =?utf-8?B?NFlpRHp6am5tUndlNkMza3VFYnFRcUY0d2lDZENxWnppMWxKc3h4c1N3YnNK?=
 =?utf-8?B?YjlvWmgwVmlwT3p4UGpTVTZXWUM2YUd1SXZWOTNkMWp3Vzl5djdsV3JUSC9H?=
 =?utf-8?B?dU12UTA2NHVRWXMvSGN5ZHdKM2tsNWp3dEMySXlRaFZYYlVSblcremhFUitU?=
 =?utf-8?B?d0U5cFZ5aGtPTis0RGN0eGFhdFU4bitGdExwNmZXb1RqbklHM1oxODllcFo0?=
 =?utf-8?B?b3M3blJ4NnoxcHhJUGMrTmJUUjZ2dlB6cEFwQzkrekpTNHJLK1NNTmUvZnJu?=
 =?utf-8?B?TDJwZmlMK29TcEljL1dFU3g2VytITjVqdEs0S0NOWFF3UHFBM205azQ1T21P?=
 =?utf-8?B?cTc5U1ZKRy9NVFcvaVV4QTZ2a3I3SU5BZ2dnelp2ODhFelcyZUhWdjZYeHE4?=
 =?utf-8?B?UnkxQ1MwYThBYWxONHZmc0plc0NCbEFBN21ZZXN2a01QU016NzE1NGtoeDY5?=
 =?utf-8?B?OElZdVJ4aHZydHJjMnNxbGVCNzNYcHFsOW91bXNsdzBuK1FpTG96QWlzWGxK?=
 =?utf-8?B?aUpGWGxsYUFUQkVKQ2w0eTIwelRWbm5ZbVg4RmpVNEVwOUxxWm5NeGM1anRx?=
 =?utf-8?B?cWdrT2tnNVVhNHpteGlkRjY1bVUzcytHdE05bGtKcTJ5QVFxK1hKbGI3ZlIr?=
 =?utf-8?B?NkRjVHlaQXNjTmhWL0JidFZXenFGbkt0bUZxNnRhRkpyOHNGaWZ2SW5STk00?=
 =?utf-8?B?Sk5FR2xXTmxUdlF3SmhnTW5nZjFzZkYxTnVIajZ4eFBPV0VoMmJXcUptQzZ2?=
 =?utf-8?Q?E8g6CR2dPlJb6Tn+HHBk39Qpo8/g5khZ7QQSk7OCAK9W?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0970eb45-8f79-4a8f-5379-08ddf12315a9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:05:14.8356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwwtG2jCUTzqdjOK7a5e/ZYuT3BEqm7+4fMgvUO0Gk87CR885+mn6cEnKRMALHmELA2l0ZIszfa0A19a5XsfGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9840
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
 drivers/gpu/nova-core/fb.rs                       |  65 ++++++++++-
 drivers/gpu/nova-core/firmware/gsp.rs             |   2 +-
 drivers/gpu/nova-core/firmware/riscv.rs           |   2 +-
 drivers/gpu/nova-core/gpu.rs                      |   4 +-
 drivers/gpu/nova-core/gsp.rs                      |   5 +
 drivers/gpu/nova-core/gsp/fw.rs                   |  96 ++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |   1 -
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 125 ++++++++++++++++++++++
 8 files changed, 292 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 27d9edab8347c5ed3be104d62a9e32709238bb92..4d6a1f45218368dd3c0e79679f2733b5a15725e0 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -10,7 +10,9 @@
 
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
+use crate::firmware::gsp::GspFirmware;
 use crate::gpu::Chipset;
+use crate::gsp;
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
@@ -138,10 +154,55 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
             frts_base..frts_base + FRTS_SIZE
         };
 
+        let boot = {
+            const BOOTLOADER_DOWN_ALIGN: Alignment = Alignment::new::<SZ_4K>();
+            let bootloader_size = gsp_fw.bootloader.ucode.size() as u64;
+            let bootloader_base = (frts.start - bootloader_size).align_down(BOOTLOADER_DOWN_ALIGN);
+
+            bootloader_base..bootloader_base + bootloader_size
+        };
+
+        let elf = {
+            const ELF_DOWN_ALIGN: Alignment = Alignment::new::<SZ_64K>();
+            let elf_size = gsp_fw.size as u64;
+            let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
+
+            elf_addr..elf_addr + elf_size
+        };
+
+        let wpr2_heap = {
+            const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
+            let wpr2_heap_size =
+                crate::gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end);
+            let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
+
+            wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN)
+        };
+
+        let wpr2 = {
+            const WPR2_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
+            let wpr2_addr = (wpr2_heap.start - size_of::<gsp::GspFwWprMeta>() as u64)
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
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index d25a21b42fc8b3987c861965e6ea56d929570b70..46b21385cbd623b5feea37a3ab5dfe0a90258155 100644
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
index 507af10502d5d3a073f220cce0a2e5fd0cc938b2..76e8953d70637cc9e27165fd0d97e715934e10f2 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -285,12 +285,12 @@ pub(crate) fn start_gsp(
 
         let bios = Vbios::new(dev, bar)?;
 
-        let _gsp_fw = KBox::pin_init(
+        let gsp_fw = KBox::pin_init(
             GspFirmware::new(dev, chipset, FIRMWARE_VERSION)?,
             GFP_KERNEL,
         )?;
 
-        let fb_layout = FbLayout::new(chipset, bar)?;
+        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 6933848eb950e97238ab43c7b8f9e022ffe84eba..6db9892b711bb5f6de29c8e0a6bc5c361827ee4f 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -2,5 +2,10 @@
 
 mod fw;
 
+pub(crate) use fw::{GspFwWprMeta, LibosParams};
+
+use kernel::ptr::Alignment;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
+pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 34226dd009824c1e44d0cb2e37b43434a364e433..181baa4017705c65adfc1ad0a8454d592f9c69da 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -3,5 +3,99 @@
 mod r570_144;
 
 // Alias to avoid repeating the version number with every use.
-#[expect(unused)]
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
+    carveout_size: u64,
+    /// The minimum and maximum sizes allowed for the GSP FW heap, in bytes.
+    allowed_heap_size: Range<u64>,
+}
+
+impl LibosParams {
+    /// Version 2 of the GSP LIBOS (Turing and GA100)
+    const LIBOS2: LibosParams = LibosParams {
+        carveout_size: bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2 as u64,
+        allowed_heap_size: bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB as u64 * SZ_1M as u64
+            ..bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB as u64 * SZ_1M as u64,
+    };
+
+    /// Version 3 of the GSP LIBOS (GA102+)
+    const LIBOS3: LibosParams = LibosParams {
+        carveout_size: bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL as u64,
+        allowed_heap_size: bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB as u64
+            * SZ_1M as u64
+            ..bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB as u64 * SZ_1M as u64,
+    };
+
+    /// Returns the libos parameters corresponding to `chipset`.
+    pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
+        if chipset < Chipset::GA102 {
+            &Self::LIBOS2
+        } else {
+            &Self::LIBOS3
+        }
+    }
+
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
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144.rs b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
index 35cb0370a7c9b4604393931f9f3bf72ef4a794b4..82a973cd99c38eee39a0554e855a60e61dba2d01 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
@@ -12,7 +12,6 @@
 #![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
 #![allow(
     dead_code,
-    unused_imports,
     clippy::all,
     clippy::undocumented_unsafe_blocks,
     clippy::ptr_as_ptr,
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index cec5940325151e407aa90128a35cb683afd436d7..0407000cca2296e713cc4701b635718fe51488cb 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
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

