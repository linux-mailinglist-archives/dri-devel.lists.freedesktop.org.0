Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722FDB505A1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 20:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C08610E7C6;
	Tue,  9 Sep 2025 18:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OqpfVYqu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2BA10E7C6;
 Tue,  9 Sep 2025 18:55:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQDpDwtMaAnC6j6jiJq/lg2uJbtExNguOkL/S5RKBLA1s/kL5ALfQOo/iGKErhaRQu2XzRdmJJHVoXfHyozbRh2pGRvpuGUrUKmIsllf72SlfiyboRlMo3vWTWAW30mSZU01n1ywhFSW+RLpu1rV5ULclhyQUtcgTGLpoZDh+Y3BmnDa2m7FDRBaRBus5NyHsxl00wICjfxaLYXJL+2nL7fT+QWpFdFdNPlDxhTJnhD6ELZUf2OnhXpo79doWbpv7Yp3pHi17U1AP0QOJjTp1OKgFRlEt6STWOAhcn8+d8vdnwd2rel1glegU7wLnzw1eJPsqVWFCrVgSrs/xEig1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vReqUyvTo2HhCK/RasjZl1s/QjFGS+ED3m0E4cATpWA=;
 b=Wns/cI/w1099JD3GEkrb8Wgmk5Xd9SsiwiJRhPEnaZMYvrGrvhtstE5KVfWh5KAgRaL+/P8ME5YVgUrTsviHEe9mM5uQ08HkUYeBMrSt9s0r4J74Uy4tOZqABfQdkINdFO8PDgEBvZIRqzi7pGNlTldQ8tG5OUtKDwN9jB7Zrs/NLU4eqdocMt8WVWl7yzP7GpwrG5wZnRIz/wHNwM1fwGVWHLotPFJ1UM4vNQvT0qV2+tHmh2XGff2aS3Sd9vYy9Ewdb7FDGpNqr+ODMJYH8vbB10ZZqm0wMsQWQQyYmYk3EHt1qDE9NAUmxurraRDDtxIG9pYIMzAPKff6IitDOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vReqUyvTo2HhCK/RasjZl1s/QjFGS+ED3m0E4cATpWA=;
 b=OqpfVYquB+XvmsQpQJ1V5O1XKJY+YOeW7d/Lk2yyercW6uLLVPfxede7u+ZcFlWXmwUKmYsJ01WBGFwr2fMmoyeHyhY+/LgbYMXHrEBy1K9WlQPZZlnBNe4mq0WcYGS37DjzJnwkWZGrgB842mjHUtmGNXAZVT/JpB9l3093B1LaJbesGAU50FjRyci0Hbl23fDOUSvvCswCCmHR0uWZEqFppn7JI28HwfhmPmw9e70hrV4EN46lse95UmU5Ihumm9SUW1RCFpfqp79VjoHEBBKQ6Dhfew2j38XwrnSXCPCbdXbsVfic/yunvrhusIU6PwTx2IRf5tTR+Aoi5MALQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14)
 by DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 18:55:34 +0000
Received: from DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515]) by DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 18:55:34 +0000
Date: Tue, 9 Sep 2025 14:55:32 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/4] nova-core: bitstruct: Move bitfield-specific code
 from register! into new macro
Message-ID: <20250909185532.GA4167211@joelbox2>
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-2-joelagnelf@nvidia.com>
 <DCN39JCF1DIJ.3JESSN7N9WJBP@nvidia.com>
 <3ef9e2c2-560e-4b58-96f8-a6db4236fe0e@nvidia.com>
 <DCNX57PKVO6C.2MYEGBZ26OQ59@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DCNX57PKVO6C.2MYEGBZ26OQ59@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0799.namprd03.prod.outlook.com
 (2603:10b6:408:13f::24) To DS0PR12MB8044.namprd12.prod.outlook.com
 (2603:10b6:8:148::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8044:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f125959-4218-42d1-6184-08ddefd2752b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1pxSUp0KzczWWZnNEw1K2hRTzVxOFRLaWhRUjM3ZHhNUGk5NEtBR1pYSkdw?=
 =?utf-8?B?WFpyTWpKZzRBeTRnZGVpdUxGZVQyVDRqQzJhOUlpNkZFTXowR3kwemdtVG9C?=
 =?utf-8?B?LzAwRE1tWlBvbnFzYVplQmplWFdiUWdDazNCSFI3b3RZS2Vva1MyVkVkNEdm?=
 =?utf-8?B?Wklhb2ZWMTNJU0dwdTFpc2lORVVoNk9RY0xub1hVVkp6N3BaRG53cktGQnZj?=
 =?utf-8?B?QTdXRXVpSS9ZRG02NzkrSUZ6dEo1R3V6UmE0Q29JTXBOcnI3dnhCZFJTWEU3?=
 =?utf-8?B?cXh3Y09KSlpreG5CNjFvRC9oSUJKS1I2T2tCUlBBZ1FDbHRmcjlZaDhEZlpj?=
 =?utf-8?B?Tmp0RGVxZGVVdWZhVCtsL0pla3h2SitqNVpHcGplM3hjVm1sZytZdDhZdENV?=
 =?utf-8?B?aTBqbUZLUWd0SGRCTHlZcUF6cHJ5NTZNbmRHblV4V1pjTnJyU0lsRHlZdUF1?=
 =?utf-8?B?ZkxhUHZncUxrNk9ZbjRGYmxmNXYzeEZzL005TjBIaFZXbis3YVpvSzZIQXo1?=
 =?utf-8?B?UGZvSEJhL2N5NW0wTnJ4VHMxcC82NWE1UkdoTlRXb09FTmZYMlN0UlJpYVg4?=
 =?utf-8?B?VjF0djBnWlJqOHlQUE9ZSSt6ZEw4RFd2cGFjUmdsSU1hc0FLU2gzOXZKc3BO?=
 =?utf-8?B?YXFjRmFKM2w3ZmVNWEVna0JmYjBZZW9pQ0hVWkYzSUIzbkU5cjZxdUxYTTNz?=
 =?utf-8?B?RENRVGp5T0hDYkVjOERFbnBiTUh4QlhYUUd1V2YyZThyZjNqSFJkaDRuclVx?=
 =?utf-8?B?L2lYWVZSMUZJQmN1T0dDa0ZsR0dhS1dsYUdRWWhES09TUXluT3NoU3M4MWx1?=
 =?utf-8?B?Qks0ZEpWclBkSkVidXdXL1d1N1F3UzhUd3Q1M3U0SEtmeDZrRTFLMVFtWGJj?=
 =?utf-8?B?UXNXdHVNMW4wMGlWczNWdDE2SlhwOUkzYThNV1F5dTVtaC9uQnJlOVhtdnQv?=
 =?utf-8?B?SmZrZHFVZGw5cUxONE9OOU5ob2ZjTk1PczFxS2xESnlYTm41TWxRNjFjVXR4?=
 =?utf-8?B?M0lpM1Z2YkE3UEtSVW9NRG5SVHczOTRGSzc4c0ZXNnB1WVdIOVVadVZGUnVl?=
 =?utf-8?B?VHA4NW5UZE9ocTRiSGJpT1Y5RzRjNlloWFhDdWpEUzhpaElwNWVjekdZMWc1?=
 =?utf-8?B?L29nc0hRdkNZRUZkYTF3elJjY3U5ell2Q0Q5MG1odUttRzF4cmFPVm40YjhI?=
 =?utf-8?B?TFR6cFRhNzlmU3RDV29VVUpCWXRWTkpVa1V4SDk1cjFDMEVyYzlQUnFZVVRZ?=
 =?utf-8?B?SGpoUUhseGVQZit4TTRvNVE0NkNscit4MzV5ejZzVHFpem5wOTRZaEtxNXFh?=
 =?utf-8?B?eWpqZnl2eXhwRXdaY205SXVYUkE0VzFwVXBSdUxiUE11Si8rL2I0WFlWZFRk?=
 =?utf-8?B?V0dUVE5QK1doV1JUSmJGemhTV3lrdk5Ic0xiZXROdzJjOXpYamUwWlh5Zkdo?=
 =?utf-8?B?NjlzckI1NTdJZzNIZmJZbXpYRlNld29PS29nVzNHZGlIejNoK3l3QmpPNlZK?=
 =?utf-8?B?aTRnZEVsSWxTUXJCbnJFeHUyN3Z5akFQR1IwWWMrRXVFQ2tQSS81ZVRLUEVM?=
 =?utf-8?B?M1V5TWhTNERKc3d2U1d1aURIdGFVcWNpbU5Rc3RGcXVSeG80aVBscXN1TnRh?=
 =?utf-8?B?aklncjNhdFFETVAxN0VWUmV0MzkvMk12ZGg1a2ZramRieXc2WGVmbEFxSXI4?=
 =?utf-8?B?eUZCTHRXZDltQjJCS2RNQ1VlSldSUjlVdGZWblN0UmNkb2svTEhTV3VUOUNL?=
 =?utf-8?B?WnpQLzlXSGs4WWZZOERVNzNpeThidGhIN2ZzcjFJcElGaG5PRlBVTUFqQWx6?=
 =?utf-8?B?QVpBbWFWdXVQM0VVSkk1cTNvb3k3b0gvdkJoWmE3ZEJyOGRmdGRETVBKQ0dY?=
 =?utf-8?B?TWt6Y1ZPVE1UREd1bHhYelU2MXJFSEU3UmZ2SmFTTm5YYUw4T2JSZXRXY3l1?=
 =?utf-8?Q?HGvlGvpwrQo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB8044.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUp2MnNnakF4b0FmcTFiSkNqaXVJWGFsQ2lSWDFxS2NGR1JuSkcyWlpvSFdo?=
 =?utf-8?B?bldwcHpQUGlVSHJjOTRPSDNVRnp6T2NUU0FxSUlZbFFzOENLS0lrZWhXUnNX?=
 =?utf-8?B?OFluWGdqdERqcXZTZ0ZEWDI4ZTNmblR4VytVNWJySDR1Zm5pOHdSYTQvaFBD?=
 =?utf-8?B?ck05eVRSTWJ1aXFnNTJzZHlVcTA0QjNSK2VWblNRRnJMSk01Wk80NWM5Ukkr?=
 =?utf-8?B?Z2Z1MEpHZG4zb2xhdE92OTBRRTJ0MEpHRlVXWjhWc3pQak45SVJJa2VlOXlU?=
 =?utf-8?B?a1QvQmM4ODlOcWRFM2lzZExCNUIrUEV6a1ptQWNpRG5Cb3NFRERvVjBHTmMz?=
 =?utf-8?B?NXFOazNpZHZKSTZjMGhlOEFFVE9VMW9ReVMxNmgveXRpTTJheDREZ3h3Sk55?=
 =?utf-8?B?dHR2Z0gvSzhSZTVRNStUc2F0M0JJektuT2xKQTZKZkVraE9rVlQxeGlIQmU0?=
 =?utf-8?B?aXpCKzZ5djB3Q25WR254ODNGdm04eDFVR0t2REwrLzVRRWhzTHgwMGM3bUZi?=
 =?utf-8?B?Z1NpNCtZQTAvM0RJODdFOGUwbjdYclFwUXlQQlpxemcwaVBMdHJlUGQ2dGN4?=
 =?utf-8?B?V3drNmVFWHh4ZVBmY080dXVsM3RsMDN0bG9jK0g0bWpPbVlEZGgzZ2ZtajJZ?=
 =?utf-8?B?MWdvdWQ2SHZBN3RKL0N4aDFyY2I3WHFML1d6dUlTcUNPTGZwNzQ0eG5yVzBU?=
 =?utf-8?B?U1p2T0gvNnRxZmJwVGpwVkNGN0lwWWlkdU9mZGFzZ20vOE4vYy9WZmVQTUhX?=
 =?utf-8?B?N0wrS2FxMzZSN25CY0tUbCtpV3ZsdmYwR2c1QkZmYTBmSGZJTkhtVXNlTTFi?=
 =?utf-8?B?c2I2Ulh1aC91OVVMRGJYODBXRUkwbFJObEY3ejBzUkRuSFdCSTZjTEJHOElM?=
 =?utf-8?B?NjBDYThQSndyQTRvUXFsVmF5NEtHZk41ZUkwdWY1d1l2Z05XUVF0a1BGeSt3?=
 =?utf-8?B?eENGZnRVSWo0VG5sOC9BMkhYaThhV2FDaWdnckZBeTdaQWlIV1VPL0M1anNZ?=
 =?utf-8?B?WklnSmhKY1BKZHhwc3RhbDJvRHVTSHRHUmptYVduaGd2VUpBN2diUmNpY3JZ?=
 =?utf-8?B?aVpRQXJpUEsyQVVNcEFjZGYzL3k5SGRlWVNFVnBWSlBmL3ZmcXF4c2tCSmxQ?=
 =?utf-8?B?aVpGVVpSazNLQjV5TkJXM3dnQ1Z5ay9YeHU1a0wrcmMzS2ZhcVJ1RlVDcmMw?=
 =?utf-8?B?S0FDT3JuZlhYNW9yK0pjR0FUdUlLTXQzdXM2bWVQQzI3WklYdzNqVW9odzRR?=
 =?utf-8?B?RDV5TTVWU1hhTHRSTjNjVnNxQzNVV1lHS3h2QkM5VlVKSnJJY0x4WDJPdDJZ?=
 =?utf-8?B?SHFsVUNybmhtNlFLWmVRa3U3bzJiM2JQTzFkUFA0Y3p5NHI1ZklCN0VMYW5u?=
 =?utf-8?B?ajhGM1hUc0lVemx6bng2TnRaZnZDRlgyLytSamUyb3ZtMmJxek1oYzdOWEYy?=
 =?utf-8?B?dUowL3pUMWhISk9HQzlTdi9rL1F5QkJ1OXR5eVZwUURUbjVXYllyQ25ZbHJo?=
 =?utf-8?B?ajF4K2NZc0U0bUNEejlPaUVOVUhWUGd6Nmw0VzFKakk1cEExbFNRWmxJVkV0?=
 =?utf-8?B?VUpkcnRLVGhWbUh6eXRWdGFlNVNESkR2akNROU9vYWhOQUJUZjhGZzlnOEhS?=
 =?utf-8?B?QndJeUo5dlkwcmU4L25ha2ZSdG9Id3Y5OW5jRzk2ek1pNEpJakNnZkJNQzZF?=
 =?utf-8?B?N3pkZ1E4WkxRaU1JdkQ4UmY0VlE0Y2VWVDFiaGlmWmVGdEo4dkJKeGxYbWlw?=
 =?utf-8?B?dmpEcGxoTWZrbjNGclYxeG9EeVNMYW1pV2MrTnNFQUtqU082L3ZFdmMrNk1G?=
 =?utf-8?B?UkIwanNvVkxyZnhLUGtDL0pHbGQ3S25BOXRYaWlGcFpRUlNjOHpycnc2ZUx3?=
 =?utf-8?B?K1ErcHc1T0o3TFpOWW1CUWNzaXFpUnpVem9CblpObDJZeGJQUkQ2M2V5dTRY?=
 =?utf-8?B?eUliTkJidEI5L3ZwM0xYRkx1alBUYnVyWHg5VXVGM1dQTEVvem5CMWdZOW9Y?=
 =?utf-8?B?MDNrNXJBMmRvcTl1Y2JVQXM1M0xWcmJJSU83RmNXb2FKcUVVNmpOZnd3RFRU?=
 =?utf-8?B?MVRNNStab3VqYktEYXJlcnBGdnNIUVVKa3laN2p4ZTV0VGJMakY2RlFJS283?=
 =?utf-8?Q?GNSnHO2Lar18BTBVn6iKfOv3K?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f125959-4218-42d1-6184-08ddefd2752b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8044.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 18:55:34.5935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cV0mfGZPmtdRs5121QGsk/gHMK7O49Lui26NJMN5DNsEbRJQxyOwkoDuz6MxNP9/nAf9xRXmRDMMcVRgVs6msw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106
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

On Tue, Sep 09, 2025 at 11:37:15AM +0900, Alexandre Courbot wrote:
> On Tue Sep 9, 2025 at 2:16 AM JST, Joel Fernandes wrote:
> > Hi Alex,
> >
> > On 9/7/2025 11:12 PM, Alexandre Courbot wrote:
> >> On Thu Sep 4, 2025 at 6:54 AM JST, Joel Fernandes wrote:
> >>> The bitfield-specific into new macro. This will be used to define
> >>> structs with bitfields, similar to C language.
> >>>
> >>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> >>> ---
> >>>  drivers/gpu/nova-core/bitstruct.rs   | 271 +++++++++++++++++++++++++++
> >>>  drivers/gpu/nova-core/nova_core.rs   |   3 +
> >>>  drivers/gpu/nova-core/regs/macros.rs | 247 +-----------------------
> >>>  3 files changed, 282 insertions(+), 239 deletions(-)
> >>>  create mode 100644 drivers/gpu/nova-core/bitstruct.rs
> >>>
> >>> diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/bitstruct.rs
> >>> new file mode 100644
> >>> index 000000000000..1dd9edab7d07
> >>> --- /dev/null
> >>> +++ b/drivers/gpu/nova-core/bitstruct.rs
> >>> @@ -0,0 +1,271 @@
> >>> +// SPDX-License-Identifier: GPL-2.0
> >>> +//
> >>> +// bitstruct.rs — Bitfield library for Rust structures
> >>> +//
> >>> +// A library that provides support for defining bit fields in Rust
> >>> +// structures. Also used from things that need bitfields like register macro.
> >>> +///
> >>> +/// # Syntax
> >>> +///
> >>> +/// ```rust
> >>> +/// bitstruct! {
> >>> +///     struct ControlReg {
> >> 
> >> The `struct` naming here looks a bit confusing to me - as of this patch,
> >> this is a u32, right? And eventually these types will be limited to primitive types,
> >> so why not just `ControlReg: u32 {` ?
> >
> > This is done in a later patch. This patch is only code movement, in later patch
> > we add precisely the syntax you're describing when we add storage types, and
> > update the register! macro. In this patch bitstruct is only u32.
> 
> My point was, is the `struct` keyword needed at all? Isn't it a bit
> confusing since these types are technically not Rust structs?

Now that bitstruct has changed to bitfield, I would really insist on leaving
'struct' in there.

So it will look like this:

//! bitfield! {
//!     struct ControlReg {
//!         3:0       mode        as u8 ?=> Mode;
//!         7         state       as bool => State;
//!     }
//! }

Sounds reasonable?

> I agree the `: u32` can be introduced later, the original `register!`
> macro did not specify any type information so there is indeed no reason
> to add it in this patch.

Yep.

> >
> >> 
> >>> +///         3:0       mode        as u8 ?=> Mode;
> >>> +///         7:4       state       as u8 => State;
> >>> +///     }
> >>> +/// }
> >>> +/// ```
> >> 
> >> As this will move to the kernel crate, it is particularly important to
> >> make sure that this example can compile and run - so please provide
> >> simple definitions for `Mode` and `State` to make sure the kunit tests
> >> will pass after patch 4 (in the current state I'm pretty sure they won't).
> >
> > Good catch. This will blow up the example though. I will change it to no_run
> > like the register! macro did if that's Ok.
> 
> If you reduce `State` to 1 bit and change its type to `bool`, and limit
> `Mode` to two or three variants, the example should remain short. I
> think it is valuable to provide a complete working example here as the
> syntax is not obvious at first sight.

Ok, so it will look like this, still about 40 lines more, but that works for me.

@@ -7,11 +7,54 @@
 //!
 //! # Syntax
 //!
-//! ```no_run
+//! ```rust
+//! #[derive(Debug, Clone, Copy)]
+//! enum Mode {
+//!     Low = 0,
+//!     High = 1,
+//!     Auto = 2,
+//! }
+//!
+//! impl TryFrom<u8> for Mode {
+//!     type Error = u8;
+//!     fn try_from(value: u8) -> Result<Self, Self::Error> {
+//!         match value {
+//!             0 => Ok(Mode::Low),
+//!             1 => Ok(Mode::High),
+//!             2 => Ok(Mode::Auto),
+//!             _ => Err(value),
+//!         }
+//!     }
+//! }
+//!
+//! impl From<Mode> for u32 {
+//!     fn from(mode: Mode) -> u32 {
+//!         mode as u32
+//!     }
+//! }
+//!
+//! #[derive(Debug, Clone, Copy)]
+//! enum State {
+//!     Inactive = 0,
+//!     Active = 1,
+//! }
+//!
+//! impl From<bool> for State {
+//!     fn from(value: bool) -> Self {
+//!         if value { State::Active } else { State::Inactive }
+//!     }
+//! }
+//!
+//! impl From<State> for u32 {
+//!     fn from(state: State) -> u32 {
+//!         state as u32
+//!     }
+//! }
+//!
 //! bitfield! {
 //!     struct ControlReg {
 //!         3:0       mode        as u8 ?=> Mode;
-//!         7:4       state       as u8 => State;
+//!         7         state       as bool => State;
 //!     }
 //! }
 //! ```

 thanks,

  - Joel

