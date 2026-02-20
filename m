Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNJIFeu+l2mm7wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 02:54:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C985164272
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 02:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE24B10E077;
	Fri, 20 Feb 2026 01:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OP7g726f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010033.outbound.protection.outlook.com [52.101.56.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3F110E077;
 Fri, 20 Feb 2026 01:54:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHKah8W0uCJMqUPrHKGUdMW8CciRxgT3u8zg7qvQlJBLZYn1rKT9B/xZqozgknCFYKJAFskuYAQXb7zeT9idoyEbfsfCQ6kC0txYqebuXYqzzqJmo3EGvG7fnvf9CiUtIDH5AiErL0/wmX0JcBB3s9USWCPIcNWzU8UxzVIEYGeNYfWvXsqkD9g33qx/KyTFHd8xJ3xQxhJdqwprBfvp109Y2IjrFqy7p1hd9uJgCqLIzkXu5gUWHvhwGyHqen5nE8GYRkAz4NMe6vefUbKpQ7n6xhs/U6eu7F6TqdRduV0hhz1fcLFowdyl6+F8xTADrVxNlCylJletG23Thy15HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8ZnDFAa4ZsW3x90+f3g90Ue1vwsXusK2vL0SICVrqY=;
 b=ceBOvdIRatSC1jvcjsd/41Ak5tlTpflG/5d7Vw0i2Me9gU0weksncXju3Xufoc+8BbwWwxYr7fc8PBMpc3BEE8/H+NJMVlG9rYF9c5i/Xh9c6JQb/VhWxyPkFCrEmJ0QGz5y/kCKi6atHDkWzP1gh4Qz2RR17bTLrIPwBq9mv6Fz3rdKkNbll9tJj02BjIuWyVUpuUfURlS0PGG00CAGcq60xiDkgohuBqLkdlNEokVDxw5RDtIKaSQbVi8dARWiVnrFOhprHFfLM36IlIBUCEt6M8dcmG2ZCoSAOMwbwCaAv5K0SHIWjfcLeypaH01LfdHV/J/Iwv9YF4BA7us1Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8ZnDFAa4ZsW3x90+f3g90Ue1vwsXusK2vL0SICVrqY=;
 b=OP7g726fIMH+bjkCrrr653GyN6r7SZR/Qrti0HpdODA08Bc0MY2DUCmkqbqb6ND0ja/+KWllrrXPV+oYMMntqvFXEM/yqaTs5H+oB0LD+Bb4MxBTCHuREzuR4Ockbkd0Vezwa6rbEJ1Mq2syxr/pcUDV64sqyo6N3FawvHs4vPiI9nuYIYYW+zINDdAkeq0tF1YQFbaXJ9SKHQ0Ip3fLovMFrea05JpT54CnsGLIbWP00mKQ7CZQ8fvZRV5t+i34T8+LSEtoRMvFlmT9+inZHoxuSB3T8rwLw55N9ZiwieSijYsdWBlclf/EiBq78ZXDPLA18LmROdHRyhIGRwelHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6181.namprd12.prod.outlook.com (2603:10b6:8:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 01:54:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 01:54:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 10:54:23 +0900
Message-Id: <DGJEXQNHH071.2R5DB7HDXDP63@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Alistair Popple" <apopple@nvidia.com>, "Andrea Righi" <arighi@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, "Elle
 Rhumsaa" <elle@weathered-steel.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <joel@joelfernandes.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v7 00/23] nova-core: Add memory management support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <DGJ1G3D32OMK.30HANB1W46XVL@nvidia.com>
 <20260219194838.GA1013545@joelbox2>
In-Reply-To: <20260219194838.GA1013545@joelbox2>
X-ClientProxiedBy: KL1P15301CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:6::14) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: 62766cf3-ebd6-498c-1546-08de7022fe87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFNsRFB3dndRb0VUZFZkeDFOYTZpS3dGdk5DRjRnVklKZUxGMlpYSk9yQUR5?=
 =?utf-8?B?T1BQOGNOMXg4b2I5RDdySFV4QlBRbjQ2LzdrUW10UThuK2ZOODdvbURnRHNI?=
 =?utf-8?B?MzJHOFVmM3FEZ3Bqbjc0dlcvNmVSM0tGWGVQNE5ta3N0QlllWFFyQXRWUlJU?=
 =?utf-8?B?QVFIL0RiRE9vNzR1TzdRbkdncC80UHJKSmFRbEF5WVlzRDdZMTFBUUZzRDk2?=
 =?utf-8?B?V1dsSkxxRWljOGVCZEtyampIOHlVblRTdEs1T1d3Qmh3bVVuMDZ6VSsyUUhB?=
 =?utf-8?B?VHJKWWd0bExJVTlKdXBvb3BFaVlsK2pmZGNhdFVBRVBoclAxWE5Nc1FNZGxR?=
 =?utf-8?B?VWd1YWlhZUh3bXR1eWVyeGswcFJHR1dDY3pCRmhhdmRpR04zQSswbmYyU2hE?=
 =?utf-8?B?SEFOellRaDlJYnZhbFY0MDJlWXcvTHU2Vk1oNnZkeWJZUjloc0duQjdZMmp6?=
 =?utf-8?B?ZUl0MlFOQ3c1VTVvVUtOTlYzWGpINndyMzBCeTBNN2dRdjIzQjlCdmNXWGxU?=
 =?utf-8?B?REN4RGp4b1k4d0hvdUFnSVF2VVZXMXhwM29TUE1wVy9pYjlOVlJlbU1wQ0VH?=
 =?utf-8?B?d1lvV084TDc4YUw1N2J0Wmk2bmwwMVIxNHRRbmlxdldoZUx4cGxLU2dWdFZj?=
 =?utf-8?B?aGRSTVppWThrT2RBRUVQMTkwb0pOTXZuV2d0UnRMTldPSEp2NEN0c3pRNEZK?=
 =?utf-8?B?eHFsbzhTai91SW9ncHgyYmFKN1AvOTAvNjRVR3BFVlh3RDFOZGs0ZXF6WE9R?=
 =?utf-8?B?bVlqc3hkRnZ5czFQZTlTbzNPVytNNzJyY1pCcmxpUi9FZWYrQzZCZjlReTMw?=
 =?utf-8?B?RElxbldmSGxFVWk4SHBITmVtTGZXV3RmcStkaDk0VzFDeWpJTGpJN0d1bTR5?=
 =?utf-8?B?SFYva0xqd2diRmo5UmZKY2dEaXlzeXRaaHByUThidDl1YmNGVW5aNFE1Mllk?=
 =?utf-8?B?aE9ETjlSR2U2UVc3RnZla1A1eVdvZFNycjVEZEtDSTFzNmtqUEdMa1EyaEIy?=
 =?utf-8?B?QXlTTzU0MEZQamJ2SGhaKzRhRjRRbmZaZWZPWURWMEJkM3VvS2Iybi96MWRQ?=
 =?utf-8?B?Si96V1pnaTJQUDA2TDMvWk9RL2NqZ3hNazNuNk9FcjBmcE44cnB0L0hKbGZz?=
 =?utf-8?B?L2tlbGVSekxhZnhlZEdxaXRCKzFpOUFZMGp2UEl0d0hQdTlIdS9MUk1oaC92?=
 =?utf-8?B?WkxBTmw3T0ZjZk5nT0hGZENkNS8vVnpKWGNSTXoyU2Z3WSttd0k1Q1QydzI5?=
 =?utf-8?B?bTUyb3dQd3N6T21sS0hma1owV0Y3S0h2RFk3ZDBYSHVhRDVPb2FKY3liUXJ0?=
 =?utf-8?B?U0NzNXJzWnhqVEY3QVUrYkU4VHdKNVdxQ2Uxb3VxN01lQnEyMUZwNFRobTFG?=
 =?utf-8?B?WG5oUzNFSzF4ZmhsY20xSm54WnR0SFNza0huQUxCaG40OVNkWHVzb3ExRkE2?=
 =?utf-8?B?ZjdSSWF3aE14RFA1RFU5TURjVmwxZHUwK3BacTZ2RHRpTUsvRXRhcVpZOGx5?=
 =?utf-8?B?aHVpZ1dtMmtkMWdLN0dxTjVIQmpaejNEdk5CdmI1Y1Fla3dOaEZZem1MVkNI?=
 =?utf-8?B?a0pxT1NBdnlwMkppcG9lRHpXMDdSMEtaZ29RcVY5c01lQ1MvZTV6U3VBN1M1?=
 =?utf-8?B?V25mS29FVnV5N0Zrc28vZ0s0UlprMUd5ZUZlQUpLMHlvNjVtcTBwdmg2cW1h?=
 =?utf-8?B?dDRhQXgvRkYwTU4raW9HQ05BdzNIVUlUOGIxL2lTUHgrdEQ5Q2ZQYzZhL1p3?=
 =?utf-8?B?ZWxWVUs2dE5pZHZibDV6M1YyRWZwTjRYbHVIbjZPY01Kb0NwamtDTHYyUEVq?=
 =?utf-8?B?MVE1Rk1rSGUvd2gxMWZURXVZUFdCOHBLa0JienNQbGJzSDBqVjZBU3R3TDdw?=
 =?utf-8?B?Ynhjd2NQRUdQdHNZMFk0WVNwbDZGY3RnNGNuWktaOUhySUoxaFlNdlhocWUv?=
 =?utf-8?B?Q293TUFmazd5QmhSNTl1ZS9pZlJPQVFWVmFrTW9yMWxZUUtpaW5GczNPRHFH?=
 =?utf-8?B?dkcxejhkQmFyN2tiN2wzVU9xaE5HTkIxSU1qcU9uMm44cGJGL0FqUUZ0SjJa?=
 =?utf-8?B?Q2VCcFVISFFjb2VCTHJOTTRaNmM1YnVCYTArbU5ReTdjTnBtckZxdVc5S2cy?=
 =?utf-8?Q?H+UE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MllIUEx5WlVmRUpoWEZaQjRsNWhnVkRaZUgzbkQvakpVanVWMHBldXBVVytx?=
 =?utf-8?B?TjZwMXlDZGpMeURDKzQ5bUJlTTNjc200dVN5S1cyZVZ2cG1QWGFtaThza2R2?=
 =?utf-8?B?WG94dWs5REVUY0hzYS80NmJHdi93Q1V0RlFQMmZIOWI2MnRFcUJxWVVRYmFU?=
 =?utf-8?B?d3BCWjFQR0xkKzNqSllyQThzclBrV0pPV3pKeElTOUQ3Y0YzbTJtd3ZnZ1ZD?=
 =?utf-8?B?NGNEU3RtTDJ5UmhwY2ozenJsZG13YkdHYXpFeWV3WnBEMWZzRjhsZWhyOEVK?=
 =?utf-8?B?VVdrdEtPamhnR2VWMDBVdHlES05RV2FnYTVrcjdtdHhMYkI1NmtKZDZ2czFz?=
 =?utf-8?B?QTNYK0U3MlNkbUxFc29LT0tsZlZVZ0QzMStyNEU4SHMvcHNzSEM0YVFzYzJ2?=
 =?utf-8?B?cm5RYlRqQUVvK2hVUnVuVzF0bUpCTjg2c3pmK3ZhS2NLbUFtZzRLTzhCdVJr?=
 =?utf-8?B?Z1BoWHNEQXppUWpISkluSVlEZTR2OEJ5WnVsNWpPTjJsVWl1Z3l3dkxySW5V?=
 =?utf-8?B?RmZ5a2ZpcHdnV2xRUGJyQjhINUpnSnF5MU0rNjBzcDdnMnIyMkM3QzFubCtv?=
 =?utf-8?B?b1NJeFAvK3ZES1phVjF4dVRmQWlxQ3ozNTE4QU5oSFBNUmovZ2NWaEY0RjQy?=
 =?utf-8?B?ZzJ0LzZkN3VoTnFSQjhWNktrdDVvVlBqZ1gvY1BHbmtOZ1laM3hQMklSclBn?=
 =?utf-8?B?RVhUKzFMQjF4Uld6a1Z4WXdHUFBvVjhtY0xyWG0ycUVaTnZzWTN2cEgwYjYw?=
 =?utf-8?B?YWg1RlBYdWN2Z20xNEJiaXA4ckF6YWtYQlkyd0hBR3JEa1crVmh0VXdjalda?=
 =?utf-8?B?ak9jNmM3QXp4Z2t6NUI4NnhUWWh1Q0YvR3dORlZFaFl5TURRTW82MnhqUHFK?=
 =?utf-8?B?VGhFQm9FUmRrTlRWOU91eDdISnEzK0trUTNRZ3dhd082NHQ2WmlDUjg1QTlT?=
 =?utf-8?B?b0M2YWU0NzVWOHJ2YzkxN09jVnF6MnB6RXRMdVp6YTNoejhlL2JhZzR5RGpQ?=
 =?utf-8?B?aXNlS3E3OEVGZnRUdG9SMk5mLzZHcmtFL2JFdm5HK2RtV2Exa0ZibWtNeHdo?=
 =?utf-8?B?cU9XSGRqMTJIWmpUMzZuRk14MmIvYzduSkFhSWhBai9tdjM3R2VZUStNcHFC?=
 =?utf-8?B?ZDNxcnFkNHcyQS82ZmZZb0FtRlBNc21PL1BlVWs1WVdjT3ljVy8vbUVwT0Rz?=
 =?utf-8?B?bXo2RzdPWHFnQ2lmMndVSFBKUlA5NEhWWFEyTE1WTXlOaTZjTkJ5bGsxTEUy?=
 =?utf-8?B?WGliRDBDaG9FOWdYQk9hZVJHZjNtYzlSbmZub21nVEN1dWE1MXAyYzZYdURn?=
 =?utf-8?B?bEtoSTFzRXpYR2ViREVRQ3pKWmYyOHZYVllQcFZ1Q3FGWVNjQThkY01zR3V3?=
 =?utf-8?B?ZkRCbjYwWVB3OTFsR2pNVVFBUW1zSDhXWG42VFArZ0lLNXlyLzd3Y0MzNnlI?=
 =?utf-8?B?bmc5THNFK0lENUIvMXdPd2NBblZVZDNNUFBwZ0dsY3M3U3VtRnJPK2dDMnJF?=
 =?utf-8?B?WDliQ0FmeGJNSzZPck5MRTZjS2h4UmkxUXRsbjVibnUyWG1mQmdDWVlUL2ht?=
 =?utf-8?B?MEFMN2xsaXRCa3pxeWplbDRMMlBlT0NxQ05HT3J1SXV3UUJjRFcwRndtN2JR?=
 =?utf-8?B?Skh1V0tXeks5c0hmNU1iaVF0ZjN2UzlpWnRhYkZ1T3FkT0VZMDZ2aUdOd2l6?=
 =?utf-8?B?TDVtU0tWSXdzSDMvVXJ1QUpUa0xHOG1WR2xDZmxJdzVYT2QyYjZKeXlKelVC?=
 =?utf-8?B?UTZMQ29TYWtRVHUzcmN3aldMdmNQbFR4MXRFRkIrcHlpNGYrSjNYR3dqWEZP?=
 =?utf-8?B?emxCSG5QYU90aWxrOWxaeExiM0VkdzU4STdFTlFlQ0pHWS9yWU1vM0xXbVlG?=
 =?utf-8?B?N1lZSGtQWTBqS1IySGxmYmtrckdmVVpYdXVrdldRcHNXeHB2VGlQTmcrR1NT?=
 =?utf-8?B?UTZWcjVKeHpTUStBVnBNR29Fbi9XK1pKOEVhNVMvcFU2SUgxOVl3VVNQaDhZ?=
 =?utf-8?B?dTZCUkdZRkdkMzZSTVBFYWxoUzdBNks5QldKTTRISWJwcnIyUzFSaktGMlFV?=
 =?utf-8?B?cUU1K3R6R0ZjaVp0S08wRVl0dFVEemxZNmNnNVprUHkvZjlhTFlRdHBUVkMz?=
 =?utf-8?B?UUlBa1dlMkUyWUphcHJMMVRwWEhlcTJlMTdiRzRkNG5kanlnY1YyeDM2Nno4?=
 =?utf-8?B?b3lrZ1hIS3M1UlV1QkdTV1NjRStsdmR0b2pxVElRY0Fsa0pUUFdPWkpVNm1I?=
 =?utf-8?B?YjhEQ2pyWGFHNVFpS0NDMUI3dmxmeityYmVDQjZmdnJpWEVpUkZSaHpJMk1X?=
 =?utf-8?B?NVAxcTZoMDJiUkpQekh4cEhKamhyaUpMVVdaaU1lc1l6cFZVQjF1dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62766cf3-ebd6-498c-1546-08de7022fe87
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 01:54:36.1879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CePQAmQoj+TMD4fLSh4pt3Znltygj0+5jEe5PHoOyEhqVdVZwlY89+60a708bOuaCo6JqMhmkCbvlmMx3jzWEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6181
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7C985164272
X-Rspamd-Action: no action

On Fri Feb 20, 2026 at 4:48 AM JST, Joel Fernandes wrote:
> Hi Alex,
>
> Thanks for taking the time to go through the series and for the effort
> of doing the reordering. Just to clarify, do you mean I should be
> sending each of the phases separately for review instead of in one
> series?
>
> By any chance, do you have the tree after doing the rearrangement that I
> could take a look at? That would be very helpful so I don't repeat your
> rearrangement effort.

Sure: https://github.com/Gnurou/linux/tree/review/nova-mm-v10

I have rebased it on top of your `nova-mm-v7-20260218` tag, hopefully
that makes it easier to pick.

The top-of-trees of both my branch and your tag are identical, and I've
tried to limit the changes in each patch, but you will want to quickly
check them. I have fixed the transient build errors, but not the
formatting or clippy warnings to make sure my top-of-tree stayed
identical to yours and I haven't introduced any regression.
