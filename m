Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA66BFA367
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 08:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D7710E6B4;
	Wed, 22 Oct 2025 06:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eyawHXWk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB9810E6B3;
 Wed, 22 Oct 2025 06:25:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcxSEbUXvyk4yGR0O7561lv++1PaPTw0yOfmbXm+Z/lDOBPJOsC3pXGIVCYPv2sx4W+TuIY+cSV3qEoAnAX/AOdMt3Z8ziKZYhRxti0afSLuuaBdPfeMAGvD1EfSSd65kjNd+dIZvuG8yTtYa8lDB10PokmUd5I0fqWrMghpTLg6tEAemvuMzGnjvdWR9wY+KnInNegoenW3Fx+E5mLhp69k99fiYThFp7Wyt3B/PJZL5Hmp46Cx4McQVlxIYJNK3xrLBkYwuSYcRz7mQKNRhkwd4eOAGlaNTWnSs/NSzfphfUit04aqoitv84Tkr0NazqNlVvbTZ1gTInTeiLlhcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0z88HpzITfCFgDDqZkZftzgITp3XZ9Q0xKt1VyY40wY=;
 b=lii9hJ5+X5t2HH4cdDcTzbAfH4TlCcoyRcwTyzdeUIfkLdX4ODXg4OfoCgFSHT7F24Cyp5nuQ9j8f1ZpaVq8ivs7R72SFwYbrmURgA4+Dx3tQW+VLfK63qt3PcoIERv2QnY4gbD7XSohMYQVdYuMtdBvCSqZaeacNTBymvNqQx55ViQvRExCDOGij3c9IfD4xU7FeZMduIhD1VCD5KAphJrxV/M3SC7Lv5ZdNdrgnWpSUWnVCa8h0MjFUssOyHKXH6L/nxppJM5PxCxBsrxExAVFY6SRMlKdLtiGL4D4Rs9peJFE7ylumdQdatyLz4/v8Pv9IJ9cSxCPfu6IaQMH6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z88HpzITfCFgDDqZkZftzgITp3XZ9Q0xKt1VyY40wY=;
 b=eyawHXWk+kPuNANiMRwWog2MGF+HykoOSECf3o8cP7mDwJMjesekt4MiZY2hEImVV6izRvR57YNcBQEmSqloopvzuDMeBhPa2ZsTPqHl7T+nKbdoF0ITwCOolkLpInLVu9XUPP6fxdBYK9UArepB96h4HoPL1XBP+ufgTer95Zstk60u7IYdJCwEIuqI0Y5h+NYDWBqoSUl+QlIuFEX4gVxdekzVo/9AbflXVIz0XgQIFoApfhgQR02ZHxCb6+kylVtYounKUt16aT3cdFIiLpKnKraKeHDeT1X/xdQeIkIX7x+6JMCT8KsJoMdoOuIC5oY/3nroTbshhpnjXxh7rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB8103.namprd12.prod.outlook.com (2603:10b6:806:355::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 06:25:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 06:25:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 15:25:28 +0900
Message-Id: <DDOMXDDVNHSE.1KA62KDD8JOZ3@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 2/7] gpu: nova-core: Add support to convert bitfield to
 underlying type
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-3-joelagnelf@nvidia.com>
In-Reply-To: <20251020185539.49986-3-joelagnelf@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a56f65-bbd0-424a-96db-08de1133ccfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|10070799003|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnJuWjZSRmJ1b3V0RWEvcmpaaEZiSVJxWENkV0RKQ2t1ZDlOSnlwZnRUNG1l?=
 =?utf-8?B?UG9VbjMxSnZZcld2Ym1DRnN5K004UmwrdU1vQjVYQzFSeGNpS2taOStzbEpz?=
 =?utf-8?B?cFgwM09lQUJvdXVFakdvM1RVMEhCWmxMcGpuQlhRNEVmRndIRHZVUHFMK085?=
 =?utf-8?B?V3BKaDhVcnRzWDFYUWM5dHRPMEhpb2JndXhoT2pEb0hSZ01lWS9vUWVmZUxX?=
 =?utf-8?B?NU83Y1JOUEVFbGowUHRXdUVkWGpubDdmK1p5OE53QUlkZ2NUeHJ1cFY3Rit1?=
 =?utf-8?B?SjJNNTNIRUVtUjlGOVhCZXBhUC9hVjF0WHdFN1JHUkhvSE9VMFl3N3FOemgr?=
 =?utf-8?B?amxMQTQwQTFvNkdNR0FJcm42MGEzTFlCV0dXa2lZSGc5bml4OXhrWTV0Y1g2?=
 =?utf-8?B?dVkvRzQwL3hXeDZoV2hERjNsZ3ZCYll3UURhWm9lbHRSajRlZktTRmZQMTFy?=
 =?utf-8?B?V2x1VURQaHVHcmNXakZvK3RmSlM3b0J3dTM1WGNaNUlMRVd5TWtKaG14ZEx2?=
 =?utf-8?B?K3JFNnM3ZHNNSDBFZ2FXbkE2OTREbnVnbG5TZ2Naclp1SXgybUJZRkcvZU5T?=
 =?utf-8?B?RFdYOHJONjVpdDV1TlVFRVNpbDhjV2twZ3JvWUZMaHR4VWsvdFU3by8wa3RG?=
 =?utf-8?B?dXlNQVNFcG14amE4Y0ltNGZRVnZaaVBFVzU1SUV2Z0FCTzRIRHZYd3hqeG1X?=
 =?utf-8?B?ZlpzeTRFeTBkNzB5a3hPYldjL0RyMlh6RXRQeXdENzFuTndaZnpPWXlsK1pR?=
 =?utf-8?B?S1l5SzJ4WFFubmc1TGw2dFF6dm5saUZoQThrckhibTZrcVBKcjRlSkJobUlU?=
 =?utf-8?B?d1Vjc3p3ejR1dmFJUmZMVnZqakFiM2dRaFQwa3dUTjFsY09sWG5mbjJMclUz?=
 =?utf-8?B?SGR1SE9yay95QzRsWTdMYnNLckJUV3l0YnFkQ2liZVdYZk44Zkh4dG5xSllL?=
 =?utf-8?B?WjhBQS9rVVVSRTRDK3lUTEZIMDFDLzN3VG84STFmQlZLRVBOekx3b2cxbDJR?=
 =?utf-8?B?UDQ1Sjdvalg5RGkrS2hNcVE3RnMyMlhYV1Yza0U1VlVPN1pzMStydktQSHVk?=
 =?utf-8?B?eVUzVC9vRkw3U21UZEhxbUpjY3ZFWDJCNUVlMks2VTZOKzk4em13TW1SLzhs?=
 =?utf-8?B?a2dtN0NiMjZtdkNTMlpRUVVSM1A3bmNsYWRiVGwzeXZCWWtScm5IMmFCQ29l?=
 =?utf-8?B?ZlBjeEF0d0NRZjVkbWJkYkpCRzZOcjBnbjZRWWNOV2NVODlpemRCaGZudExB?=
 =?utf-8?B?blF2akQ3RXBXU1RkejkvRmRNVW9tQkJHN2l4MHdSeGVCbVdkYjkwMjAvNEMz?=
 =?utf-8?B?VEl2U1pvMTVFM0gyd0E3a09wM2wvSE0rd0Z0elRTNVpITmk5QVFHOTllNUx5?=
 =?utf-8?B?SHpKWitOaWdGay9YbnB1cTVFZkhpeDVob0VlVS95MDdjN21VNlowQ2I4dlNX?=
 =?utf-8?B?YWUrNEFNa2l3UzhISDdGM0lDTHVYRDhIanF6cHhRMks4YjJ3aEh4SUpPbjRG?=
 =?utf-8?B?RmlydWtKNFRpMnJBZkZJK1JkMkZUUmYrSjVoOUw3Y3greU5BVUoxY28rNnR4?=
 =?utf-8?B?ZXNOZHd1d1pMcEFiNE1FY2JNSG8vaHliWjJ1VHNqNjZnZWVIbzV3TEpxR011?=
 =?utf-8?B?ZGd2SHFaUmQzOW1mdG5pUlRPVUx3RUhqdE1pVjYrd01hc2QxR3dQSzJoY1FV?=
 =?utf-8?B?WGJXaWJnYnhHL29idDFDRTBtdHZxdFp2dUlBVUsxcmJwUWtuRUQ0YjhrcWh2?=
 =?utf-8?B?K3VmSUE0ZmlYOHVjQ0xGdjZFUkVNQWFrRktBVFRsaDJ6ZTZPZm1MUnNlZGRM?=
 =?utf-8?B?b1ZmcTg5eFpNbFFhL3I0b2QvdlZ4S1luYjVMQklGY2NOZzhON2llbUg1empq?=
 =?utf-8?B?WFlvQUtXYncrZG9JbmVkTWlRSDEyQXRaWGJCNzNVQXI4Q0V0TklydEF6b3c5?=
 =?utf-8?Q?+8qdeO4khspCfk90odcYYmQwkpbM/NBx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(10070799003)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3pjYlFvNDF2NEZXaDZPalRwV1VOVU8wbzh4dGJQRGJjbFErWlhiTHMyY3I1?=
 =?utf-8?B?Y2JJVHo0bFMrUUl0V0phRUVXMWJQaEwyYXE4UHpIQkJqeDFkZzEzU1VFQkx0?=
 =?utf-8?B?dnZDQityLzB3ZS9nckdES0V4aDU2OWpmcUZnS0w1Qzk5Y21GSW9WdUM0Y0NS?=
 =?utf-8?B?K0t2MGt1eEVXdnY1ZjNKa2ppMFVuZWZhaHoxSEpyYWhTaWk3WkE1SHJ0YUJU?=
 =?utf-8?B?NnduUG1MQk9lSVA0bGhMM0Vxc3NKeU1FM2pUZUdGeUpWcFc0UHpPSzZwV2Qx?=
 =?utf-8?B?cXBzVHBCV2l3KzBLVHRpWmROVUpXZllaSjY4NmJ4M21RdXV3OGVQRVRKSkNG?=
 =?utf-8?B?cUR4am1vUktKRllYWXhoTHRoQjU2UHIweENVdzJCOFZQWU4rdCtuTC8rU2tO?=
 =?utf-8?B?dS9lNVRER0pMcUJxdmNpQUVxRlBsMUpqM2dZR0c1M3dIN2g5cWwzblhFN1FN?=
 =?utf-8?B?c05kOXhTdnFKMEM1Y0ZvNWZUUHp3T1M2ZnpLcy8xdTFObnpsRnh5WmtKdTEw?=
 =?utf-8?B?UVdRVGNSVmkwSTF6bFRxaFhUb3Vud3FyQVlYdmVQL2pYL20zVldBOURmZmFl?=
 =?utf-8?B?L240bEFOUWYzaCtwL0JVZFRxbGpKLzd2L1REUFArQ3N4YWV4U29ndFBGTG4y?=
 =?utf-8?B?WjRmZ2o0NUFYUjlKcnAwRDVNcXZlREVtSmZSQ2kwRjhKZy9CNytnSUYvVm1O?=
 =?utf-8?B?YXVMUGppNUN1L0pjaWtzWlFBZlBqVVIvcUJ5UFVFRWRNMmVDZWkranRUQU91?=
 =?utf-8?B?dEdXbGJoNWErQk5LN3NLZG9SKzg0L0FXVUZxc2ZacURUMStKa3NJdWR2Ukkw?=
 =?utf-8?B?bTJ2N25lTU1wcS81c2JTSVRsQXAyQjRiT2twc2UyblpRWmExUmIxUEtEeElv?=
 =?utf-8?B?Sjl5VklraFVNZ1o1R0FvRmp6RVZ2RE1WL3N3NnhRRHYvdXhHOGRLTHRBL1Mr?=
 =?utf-8?B?ZHRjdTkzMlMvc0h2Wkphdi90VU01SFdUbkJNTXY3NWthWGZscGJYV2VrenV1?=
 =?utf-8?B?QjhXd0ZmMTRGYkN4NWVRa2ZJcDFlOTlETnlzTS9JK3ZVbWNobnR0ZjJkVm1H?=
 =?utf-8?B?dGlUdjRHdC84UkwwaDhoTWVWQ01idHF6Tk55ZkJSOTFuYmlRM2NUQUF6WVB6?=
 =?utf-8?B?Tzh0K3pnWE1mYUdXZWxDVzBhYjc0MVIxQVg4Qll3eEFFY3lDV2l5c21XWVpQ?=
 =?utf-8?B?Y0tTMTV4TlQ1VTJ5VExZMDNXZ3ZwRE12ZEZQbURpVjZqYzQrL3A1NTVOcmNW?=
 =?utf-8?B?VUVubFV4UWx1N3N0OExOSUtGNWNqWHNNY05NUHVGSWI1UTRvSGlOUEZrVCs0?=
 =?utf-8?B?WEdGU1FHcHRzQUs2M2dZU1dlMkxubDdMWm5yN0pxN1k0UlFKMWR1Z0JBSGcr?=
 =?utf-8?B?ZFRGL1RidVM1cElvQTRhQ3YyRXFqd1V4MmVKSTlvUEgrZmc1Z25ReUtjZWFY?=
 =?utf-8?B?L3ZBQTBqbmNJSlp2VTh3YW9oU2JmVDRpYml4K3pUa3F1SXpqYUVVSG1PYVly?=
 =?utf-8?B?bUVOZldySHkvODhNRHU1K2JVdEJjODBVMDJhdXFPclpTNmN5YlV1ek1iZVpQ?=
 =?utf-8?B?REJiOE55ZFIzR3lHa0NEbkZnRUN2cmZmQmhDTnlka1hDRC9uWVZjRithQmVl?=
 =?utf-8?B?QWRVYldWRW9qTm5wK1ZhckJUMStsUEFEQ3A2N2RDdHA2VjdOd2RBcEFTWU5h?=
 =?utf-8?B?NEN0RWZBVVk5ZUdZc0FPQlVTUCtBTlBMZkVSWWxmY3ZDQ2dJdGhhTGtielU2?=
 =?utf-8?B?TE90L2dnWUw2NjRneWtPWGQ4Zm9VM1lZOWwwcjFaMXkrZVFmLzNLU0VGS2Yr?=
 =?utf-8?B?N1NaOStzdStMNVpoY3E5Y3RqZHlsc0VXdWF0WEUzaWthbXl6WmVaMVJpZWkr?=
 =?utf-8?B?dG1hVTFMWnFpVHlKYmpUNHQrQzF0RkZjMlQyOWhpb3NVS0I2SnRxSk90Z3Q1?=
 =?utf-8?B?eWljcFV2UU5pRVp6K2JSRjNyMzIwTHRMeGRaSzJ1eHRjVDVubzhiRFlFRXZl?=
 =?utf-8?B?Y1p0Q3JDUXFDSUNFbnNtY3J0S05aZmVlYk1hWkVQeFQ5akJtOGhyVTdKVWxT?=
 =?utf-8?B?UWd2aWJsZlNhbTU5YVNvM3lXbjJXMitZYmsySExGOXlTa0c5L2J4bFB5Y0U5?=
 =?utf-8?B?L29GSzVoSnplNmJkYUlReEpoYWFpTnNTV1lpS0VyRG9KZlh4Y20wYlVVZFZD?=
 =?utf-8?Q?TfmTSsmq9s6cPyKDDrnDAk/nMXUJXjZImzLffSwJ3xBe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a56f65-bbd0-424a-96db-08de1133ccfe
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 06:25:31.6197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BE/TJwRw/0LLF9/kn7KjbCWaLVLaz66V77+mVOqwA199t/LJ0jxZiY1JMzjXjbTPsMOHYG3TWW5UC/RARaVA0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8103
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

On Tue Oct 21, 2025 at 3:55 AM JST, Joel Fernandes wrote:
> To support the usecase where we read a register and write to another
> with identical bit layout, add support to convert bitfield to underlying =
type.
>
> Another way to do this, is to read individual fields, on the caller
> side, and write to the destination fields, but that is both cumbersome
> and error-prone as new bits added in hardware may be missed.

Shouldn't the title be "Add support to convert bitfield FROM underlying
type"? Since this adds a `From<storage> for Bitfield`.

