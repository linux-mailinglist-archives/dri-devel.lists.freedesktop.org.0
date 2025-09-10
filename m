Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56848B51557
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 13:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8575610E8DC;
	Wed, 10 Sep 2025 11:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lTHbTCS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F4410E8DC;
 Wed, 10 Sep 2025 11:22:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCzNWQLhffad+w/qoahebvfQ7+Bus5+0Sn6rUIlndGZmrXXdxYVlG24wY5lfVKJ/sgUQRS8PQeXc6wLZdSEJkc5eksCwzVIQzmaT3QTdOeRhWJfrk4iiKQdqFPkbu78JOYVwgwkVh6RUVBFSDSOjI9ZbA6hzkWWyEkiZmbfASEuvtiVsr6x67RL0KWsxWIWXdzETA/aCXGPaJn4Wvts1N5juAJxjldEJ6V/rFxPe4Py8zy9WRbILtetSb+6fZA2F61eL1B719ScCL3JZX/E8utrpZYp/dqwPwWBoHFpNB3AUZFHlYO6oaTlVk/tghag9sUIybdNDvKk1xA4Ylshx+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T61tmPyn5I66m/+cLlvqTZ0pjRx3aEVURHlEYeJzrhU=;
 b=KMyK3Y5pxKB1yj68UpoQdAEnr9+Mr/nsaAbMZXsQvDMnCxgAUVAH1/+Chh+BatVunFkWhkXDe/3JRry5uXfGY7sV/W7tzYr4e3L8UHeBRPeyU1LpV0oWRiy2W2+hO8yWsP+WbYKkamXlaC9VC7PUSbSneTBM9IV0v6oiarEoLRm2PcfnmL5bjHW0L2kmT5ktG/8a/N+hvgQzV3cF2PEzsMpG9879bQ4yLCZ6VRu4G833RQ+9bZtYky7zUg/kU6Mh9v01HEqf8hnvoBbwyVrHKKnfUabAw9n7OCz/LkHtafDWYOLYkqKOoLX+kmnsjAmXrg4vA2XiSwRVc9AUCN5QMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T61tmPyn5I66m/+cLlvqTZ0pjRx3aEVURHlEYeJzrhU=;
 b=lTHbTCS/kvDD2ViGOfLd+8dw1m9kv/psGo7epkpEw45GDwWe1qjToIVyCE1/GRmgkeSKSFEQqU+01ziojqLbu7//Oke7ER443QkQsIm/LjSe5LrfIG/RfGfGPn+BuNQgHOppRsB7zKDfAbp4KXNIHcBQtOn4iasq2boL4u06xvOyUUFTexFh3jJPDzaE1EaFQZxHgzV/BJj8TAk4olSdOycE3NG1VwaQptW8X8DFViVFiNHo1a7aNGKc8U3QjH+OnMdYaoxA9Ui/ZNJBizZKKr5cgwFnnav7KyrdTXPPEfhiL6n9iiRpkxxcS07nlwaTxmLDMUns6EK7FppJnUdcJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB5734.namprd12.prod.outlook.com (2603:10b6:510:1e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 11:22:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 11:22:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Sep 2025 20:22:02 +0900
Message-Id: <DCP2XKCMMOV0.2VHHLLY7C8PSY@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 02/11] gpu: nova-core: move GSP boot code out of
 `Gpu` constructor
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
 <20250902-nova_firmware-v3-2-56854d9c5398@nvidia.com>
 <843554b1-f4c5-43f5-a23b-583339708bea@kernel.org>
 <DCIZ79KKSSF1.25NJT5ZWR3OOS@nvidia.com>
 <DCJ0UA7KM9AP.OGO7EJB4ORQP@kernel.org>
 <DCOBWF0EZLHF.3FFVAB16SJ3FW@nvidia.com>
 <DCOCL398HXDH.3QH9U6UGGIUP1@kernel.org>
 <DCOUK0Z4YV6M.2R0CFE57DY5CR@nvidia.com>
 <DCOYNWXYKBOK.XCRA4Z34RUXP@kernel.org>
 <DCP2UI9NGTQ6.3O0ARTPL4WCA2@nvidia.com>
In-Reply-To: <DCP2UI9NGTQ6.3O0ARTPL4WCA2@nvidia.com>
X-ClientProxiedBy: TYCP286CA0106.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d0389cc-b259-4c4a-0ec7-08ddf05c4696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGdrQnVwVzNJdUV2WkllNjdZRlA1S25KcGlHcVRRMDEranNWS3JCQTQxaDIv?=
 =?utf-8?B?NFdDMENVZFRmY3pONUtSUlhWVjN4MzdlSHl6aFgrUVlWQ29sRnAyMnV3SHZD?=
 =?utf-8?B?amR0OEcyd1JKZkdNaXoxT1lFWXZaNVQvR21pc1lySnBOOTQwZHRjT2VLVkd1?=
 =?utf-8?B?eE1lc1duTGZ6VU9sVGg0NjlMR0RJZ0k3T2U3MmU2cDFNMnM0UWZ0V2I0L0xp?=
 =?utf-8?B?eGs0UmNiV2lOTGhRbUg3MVhtL3B3eUYyQ3d6dTlOdXlYd0Q5MVFEajU0b1hv?=
 =?utf-8?B?b0IvaDlialpiVEdMOFMrRDhMN3ZsYndwY29HYzc3TUw5UnRYOGJhRkdNbVhU?=
 =?utf-8?B?aGNjenMyQjV6Q05ISjVJK2J0MGJlZ2tYTUxKQUpBMDdDc3RvMTVUeEF0bFJD?=
 =?utf-8?B?NTBLUkthSklnN0dTZ0hpSzF2TzNRUmJMWkVoa0hucmprMm5mS3Z5c2VYTWFs?=
 =?utf-8?B?dWxBb2pkZHFabTNxcXVXQ2cxV2lLUFhFTmRQNTBLNUhWQzZpYy80cjlaVTUx?=
 =?utf-8?B?VmsxaWtwRTg4TDNrczUwU3lGOUhTL1lkZWRWL3RYME82aXFES0Y2Y0w0bmFF?=
 =?utf-8?B?WlRTaWxPMG51Ujc3N0pGYmYxcHRIOFA0L2FtTXNJN3pkK25DTStPRU9nWldv?=
 =?utf-8?B?cG9Wak5BY3VkVHBuSkR6RmFvdml5L3RrTkNvYVpRYmVvYjNONXNCazdxWVRU?=
 =?utf-8?B?aUM4eWI4cUR0QUNRMDhvK2R1MytFYVZxWk1VeExzdFB6ZWZSTDJvbXRjek9J?=
 =?utf-8?B?akllUzdrdVhUdGp3T0hJM2JObVhFVnMrYmVxUU8rakhlbVpxa3pTUzN3MWxT?=
 =?utf-8?B?d2l4Slk0Q25OZVNuODFKbHBuWXV0VCtWamNDNk1FWlJweGZZUzBnMXRMR1NV?=
 =?utf-8?B?eXNrVTRCMXQvTGZPc0J5bHBOWTc4OTc0Vjkwb0l0d3lSTGZTYTVOTWt5b3lu?=
 =?utf-8?B?QTVENi9Xd0VrbkRpVDBOM1hxc250YzJwemk0OEsrNWtpWGs3RWtFTy9hQVVP?=
 =?utf-8?B?SXFNUnRKNUhxWU9qWlhtK1pYNXdpNEtaTjl5Tm85LzcxcExtdHNZRS91NWZi?=
 =?utf-8?B?UGNYSE9WcTEwU2NRRDZhd3RTWjhVYmFNRW9teVR5QyswRmF0VmdHVjcwbFZk?=
 =?utf-8?B?NkpUbjNyQy83QXdZVGlXai9rM3hJZWZLdndrSGNtV2JrRFRWdGl6aU9LV1pl?=
 =?utf-8?B?cUltcXM5ajVrZTZHd045TGluRFdKTVU0REE1S0svTGJ2aThtamtPSXV1MDZN?=
 =?utf-8?B?WXhxeHE3enFiRkdjMHRlM0c5a2ZnQ0xJZ2dMSUR6UHFTc3UzaWFTa2ZQR0tU?=
 =?utf-8?B?U0NSS0NzSXhld21KNzV0RFo0VDJmSzVpN29SMVJtc3MxcHAxVmorTTZBbXlT?=
 =?utf-8?B?a0RiSHNtMzc1eFQvUitxRGljRE5MTjFkbVdGZEtTUjJsZk1pL252T0dhclRv?=
 =?utf-8?B?YmdnVEcxRmdCOWdoYlZORkM0cGdqUmhJazdPaG00MXhOaHBTMGE0MmdLNVNP?=
 =?utf-8?B?SENsRlV6RXppNHFjdElqeTM2LzNzR2tvWkZPKzc2RSsraTBFU1dvOXF4TThj?=
 =?utf-8?B?V3pGZFJ0dFMyRjJNUXczdTN5aFZDZWF2OUJMdVpyVXhsenlIcEdjRW1UVEtW?=
 =?utf-8?B?SEkvWU5aU1RXajhHdjdQNVQyNE1zYWJqSWFQYlI0ZEZJVkd3RVM4VFV2S2xQ?=
 =?utf-8?B?aFh2ZDVyUG9ONmhJdHplK21VSVNhZUpoOUlVRGxaWklxTFRzclVmU0YyUWpV?=
 =?utf-8?B?SnpodVRDQVFGT0Z5VWRId2U5UjNaMlhGM2ZKYjh3dWlNUW9PcWlISnltQ2h3?=
 =?utf-8?B?aUx3Mmd6OW1iTG4zYnVVcjNra3ZFOWtRdHh2R0pTaU1GZmlaRElTaXh0VHpZ?=
 =?utf-8?B?eXpFNUZhVnhCVHRURC94OWVTTUt3c2NRREdtWFdJUnNkdUU0NFlKUE5PRUNl?=
 =?utf-8?Q?5bXVu+XPo4Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1Ftd1c5SStWSkZuMlE1QVNxVENKYXpTcDNCUkI1TlZzZC95KzNuc2tDd0dM?=
 =?utf-8?B?Y3YzejlpRlVzcTg3S1lxNmJZV1ZjNWdwMm1JZUlLVUZSSnhWQytVM0wyL1ZG?=
 =?utf-8?B?QzVFb01SMDFGYnVEKzNPWkM4NEVyc3VoZXIxRE91M2RXZWMvUnZYTlNFam1E?=
 =?utf-8?B?a09xOVRJSjZ4MTJwUU9hd3AwR1RvMUZwcGVUdm9QeEJmOUE3dmtmNmdoYWFy?=
 =?utf-8?B?My9jdmtKNXRwVkhhM3pFTStMN3Q3ampYRmFDRFc5K1NEL1ptQ2NoZUtJbU5x?=
 =?utf-8?B?aERDb0ZxSWx1WlQ4RXNCbjVzK3Q1NGVaYWRoMWJXb2hKWThZUFN4b3Y5ak9Z?=
 =?utf-8?B?aUx4QTdFRTNNYTJGV1Q0bzhFOFdlZnRLMG80d1h4S2FpUzdzU0N2bTRVTVY3?=
 =?utf-8?B?Sm9xN1lVQ0I1NGJ6eFpoMmwySnJ6UmMzakRMb2VFVTN0VUszRjNkRTVUTWN5?=
 =?utf-8?B?TkVPckJITzhZVitiOUpTa29mdk9xTHpMcmlqWXNXR3BNRGdjUDJ4UEJvMUpG?=
 =?utf-8?B?THE3dW8rZThSYTd5Mi9zMmxDczFVTU5RcTRkR1Y1bm1PSWg4Mlc0L3R3THU1?=
 =?utf-8?B?bWd5VXV4MUpyL2RRTk5tbkRhcmQ0S0dHU0hoczFnTG1vS08zbHlCSGhNcHox?=
 =?utf-8?B?amwzL3JwRWlCRy9sMzV5S2lqcnVOcTRGWGdKaWZhMGpQdkd5MlF0Uk1VVEJD?=
 =?utf-8?B?SFZKR3B5YkZiQmFiZ3pxMUpvMlM2OGFkaXdSYURzNEI4OTZFTHE5MGJ5S2lM?=
 =?utf-8?B?cmV2Q3h5SVVMN0dmd25PVFpkZTcyRzd3R095T1NaUWhrdkx2NEEydW1yblZk?=
 =?utf-8?B?dTZ3K05aZk12TE1ab3czcWU5V1BzSXpXY0ZRNldLVWFhV1JEbTRYUVFMYnRy?=
 =?utf-8?B?MVpLRVdLTDhTS0FTQlpxR2NNS3d0YWl3VWxEbmpUbitPTkVYRFdSS0tSWmpv?=
 =?utf-8?B?QzZEVStpZzFydXo3UUJSbUlNMTdFdHU4MUdUSVhCNVpHSzBMaXRxVHhHakRr?=
 =?utf-8?B?MU05WUR6T2dmYkcwWS9FZGxReHc3ZGUxUzFWblRYdnZnWmdadWVjODhsZCtT?=
 =?utf-8?B?RlNPY281d3dtSUlybFVLeDgrVkVDbXVJeDVvdk1mN2Y0V0NjUDNLWURaRDdC?=
 =?utf-8?B?eHBKZnZPMHhocW5ySjNraVc5Y0NzdnJub1k5MmsycFlYZTVmSXE5L296ZGM4?=
 =?utf-8?B?cDJFYVVXTWlPWm53TVdVSkkwalV3YXpKWkk2MVNSMDhHM1RWZGt2LzhWSFpl?=
 =?utf-8?B?b2NrczZZVU9oMjJwRkRQUVlXS0c2UlVyOGdGbTBYWExmU2FNcDA1Z1UvajVw?=
 =?utf-8?B?RmtNWUJqcHVSazVPSGhvYitvcnJsNGxJVXE1cVg5N2hKbVA5ck8xODhJQVB3?=
 =?utf-8?B?ZlJxYW1oZmxBVUNIVFc5VWUrQkdHRjUza1dXVHFQUCtLMldOTUNKR0V5QmJD?=
 =?utf-8?B?WVp0VVNvQzFVSTJIcjhsWWM4TFlqaFVqczF6UEtkU1IwV1FJWHlpUVJHYVFm?=
 =?utf-8?B?ZEg3NXZEcDNkZ3Y0d3lkZjZvUExkWVAraVNrQVFoOEI0UC9rblBsdjRSRkN5?=
 =?utf-8?B?Ny9VMU5meDB3b2RJZCtwRVdiNnlvTFFLalgvSDhxSUIrRE5GVC8zZnVPM2da?=
 =?utf-8?B?RUFra2NTZ0hqQ2MwVlI1bEMrOGRzemErNktoaDhFUVJSVUdTWlFPcW0xblJw?=
 =?utf-8?B?SVJ6TjRxT0xQNCtRRTZoTE53dENmbG1WMzlGbUo0UzYwajdRUzB6RDFDN2I1?=
 =?utf-8?B?QXlPZ2NXWHVXdXZHM2lXcGlGOUdvZFhTamlnZ2RzRGxtb0x2ZG1Xb3owTXhL?=
 =?utf-8?B?YmZYTXRQZEx4enJwZ0hIL2tISzZXV3VjQ2VuWGlxMExhY1g5eXJ3TXk1MzM5?=
 =?utf-8?B?UDBCWFhFNm51czRBTHZrbFJxQzJzSlhmNUUvRXlSZjdJODUxV0JKVENRdnU5?=
 =?utf-8?B?YWlSS0ZCVlp2ZlNnNE9pazJhcGNvN0Vqb0pkbDg4MHJlVWZJQXRPQW5ZUnVi?=
 =?utf-8?B?cVV0SGw4TmtpRmptTjRCSGx0aTBPbW1lbmEyQUtQcWtLK2dBeXppQ0E5ZHJC?=
 =?utf-8?B?TzdUdEdKNmVHN3lUR2hYQy9vN0JnS1lEMGNMM3dNQWFlcFR3WUtyejZyOGpS?=
 =?utf-8?B?U3A0dnhTQ1NaeE5DczVnUUJORmlDY0ZaVnBHQ0QvOHVONmtESTZPTDFKbEVH?=
 =?utf-8?Q?+Ql8hEX9DNsvQD7wvyszzfnobvGNYBj20ovOa11qrkcC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0389cc-b259-4c4a-0ec7-08ddf05c4696
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 11:22:06.9638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FvN/ri7t+gIWn2ZSSAlWJVzP5asp0BgpL7JcF4PRJw0XgPvX/jDlmHTAnUmqLMCSXacshtH1jwfAR6q5QgaH7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5734
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

On Wed Sep 10, 2025 at 8:18 PM JST, Alexandre Courbot wrote:
>>> here is what it looks like when I got it to compile:
>>
>> This looks great!
>>
>>>     pub(crate) fn new<'a>(
>>>         pdev: &'a pci::Device<device::Bound>,
>>>         devres_bar: Arc<Devres<Bar0>>,
>>>         bar: &'a Bar0,
>>>     ) -> impl PinInit<Self, Error> + 'a {
>>>         try_pin_init!(Self {
>>>             spec: Spec::new(bar).inspect(|spec| {
>>>                 dev_info!(
>>>                     pdev.as_ref(),
>>>                     "NVIDIA (Chipset: {}, Architecture: {:?}, Revision:=
 {})\n",
>>>                     spec.chipset,
>>>                     spec.chipset.arch(),
>>>                     spec.revision
>>>                 );
>>>             })?,
>>
>> +             _: {
>> +                 gfw::wait_gfw_boot_completion(bar)
>> +                     .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot=
 did not complete"))?;
>> +             },
>>>
>>>             sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spe=
c.chipset)?,
>>>
>>>             gsp_falcon: Falcon::<Gsp>::new(
>>>                 pdev.as_ref(),
>>>                 spec.chipset,
>>>                 bar,
>>>                 spec.chipset > Chipset::GA100,
>>>             )
>>>             .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
>>>
>>>             sec2_falcon: Falcon::<Sec2>::new(pdev.as_ref(), spec.chipse=
t, bar, true)?,
>>>
>> -             gsp: Self::start_gsp(pdev, bar, spec.chipset, gsp_falcon, =
sec2_falcon)?,
>> +             gsp <- Self::start_gsp(pdev, bar, spec.chipset, gsp_falcon=
, sec2_falcon),
>>>
>>>             bar: devres_bar,
>>>         })
>>>     }
>>>
>>> The wait for GFW initialization had to be moved to `probe`, but that's
>>> fine IMO.
>>
>> That's not necessary, you can keep it in Gpu::new() -- I don't see what'=
s
>> preventing us from that. I inserted it in the code above.
>
> This one didn't work for me, but maybe you have a newer version of the
> internal references patch:
>
> error: no rules expected reserved identifier `_`
>     --> drivers/gpu/nova-core/gpu.rs:323:13
>      |
> 323  |             _: {
>      |             ^ no rules expected this token in macro call
>      |
> note: while trying to match `)`

Ah, just found out about this, neat!

https://lore.kernel.org/rust-for-linux/20250905140534.3328297-1-lossin@kern=
el.org/

