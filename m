Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8DFB5154D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 13:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE57E10E8DE;
	Wed, 10 Sep 2025 11:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="proBvEk/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A4910E8DE;
 Wed, 10 Sep 2025 11:18:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwI5EAf5pzbg8dQtg3k9idcspdmw8YLiaHy0BNzFt/Pvgl2dLRgYeMj/tFwAkhEp17QwKdHejJ5A8gYV6EmIApQwF/dkiojFEXRH2HRiJehpeR8WvFVnEsc2lomAttEzF/rp3i7w0agVCjT8dbOMxhiK6oIZJMpA9XcUYMpUWhlvU9JH7jXm34w7v8e79BADz//+UIOantF1aqXXXOBWcUwRK4AJbwTJ4un+Zyg6fX/CCeo2GIzlyMbnwVYyze8mXCtZdnAVNTc7mOkKG7hqp0vJ9+l7Yh/4LsmgTnFSAlF5WNVCmZtYu9h6SIjQJCD6BLsxL3rPbifnU3fQXV8UAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YS8lWMP16RyyrdgtEDEABYCTwvt1h2alYjROlxZgEeA=;
 b=kdBRvvgqaV3mgD6wre3MkDWZIh7z2AsQNYSfS9pjW8Vo/S94v8jwjb96BDOjSSEYPCGWbPBOUOCPFmGTtw4q5FR0jdVImEUfIUL+4ZNvPRNkwUS3WhfvXC6fVze+WrfLlXokBnVK1Xdw5bZ6JXBH/eJbhXQkuPnAnThD2DZVCvtCs/7uDcq0DlgxovE2MnQ2o9QxKml/yf/m3dsn8DKN//4IbqZ8MI8pwn5BwCybKPN4joiPTh+uqGQrPZJg0wJ1B7ikB+UrXFfNYWhqY3H0w0twSP+h2E2va9LjnMKEabV7HRPBz4rGnGn0D7njyxZ63f4gMxQAwpbBnA+zS/avnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YS8lWMP16RyyrdgtEDEABYCTwvt1h2alYjROlxZgEeA=;
 b=proBvEk/gK2HkFmMXd9pcfpMw+/oAj3dOfr5SbaEuV7WumxTGESFKgTIFZEVHOokMniCeAafm9zaYSyIKZrXC+mnfwn4WwC2oTBH4r0lP0nRpOQ8rSX+wau3vcz1ICDBbKP8WIXcWeD8792n8Q5o2jnJlCcNhBntmplf6Agnf72D6a8CDQ3eHB8QwIU7q5uGH5n+9aT7rFoytqYCTJwj+fQ12Iz7s+EG8nvHJZt7u8LMLkPC4dhARPDVGQTDO+uHMt++ImsiwEmMDUswk+vCHJ5lzHawWv3DLFl3OxeHG0Y9ExaeOFsQ6C02YsF4YR/prsPf+Y2CxhM7XPxoXS4Clw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6628.namprd12.prod.outlook.com (2603:10b6:208:3a0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 11:18:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 11:18:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Sep 2025 20:18:03 +0900
Message-Id: <DCP2UI9NGTQ6.3O0ARTPL4WCA2@nvidia.com>
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
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
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
In-Reply-To: <DCOYNWXYKBOK.XCRA4Z34RUXP@kernel.org>
X-ClientProxiedBy: TYCP286CA0072.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6628:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c28487f-97cf-41f3-6ea7-08ddf05bb7ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NW15L05VV2Z4dUxVQU9ldWR4cVRxM2xmWEY5d3JTMWV1bHNYVERHZFBtWlgy?=
 =?utf-8?B?dG1Rb3JjK3dnN2JTZ1VHTmx0RkJlK052ekd0OWIwRlZRYXZsQnc2c0VsMTZ2?=
 =?utf-8?B?T2VPRlk2N1hvRDJlaCtCclVXM25IUDlzRHduSWwvU2NvM25WTkhUWGM3Skl5?=
 =?utf-8?B?Zkh0MVR4QXFodU03VDNoNW9kaDU5cFNEQktITWtyL1I0R1RyY0g5c1NGblpM?=
 =?utf-8?B?NWQ1Nllxd2NXMnpFUTQxQVJ4QmE4RjBPL0RXSVdiMVpZTEFGRWFpMGFmODBm?=
 =?utf-8?B?dUl5RFJVYm1IcHZXaW5WTUtPdDVVWkpkbStsc1YrekFZWjlwK0Q3VVRmRGkw?=
 =?utf-8?B?RHAxRmI3Wk1LWGhDN1Btd0puMm9VOWtDcVZTUEhIbEdYQnN2U2c2dzdJK3Rt?=
 =?utf-8?B?REZDRkdDRXo2TkM4U2U3RHNCa04wNnI5Yi8vcVgyY0daNnZwYVpxcjZ6dkZ0?=
 =?utf-8?B?djBDcElWUUMzUWRaMCtVbzFJM21uTmdQcFJ4d2JmOE9sbzBGWHJuWFNUakRW?=
 =?utf-8?B?SUpBTExFc1BEK2hudlBENUE3WWRGSGxoNFp2bFNjeWJGZGt1VlJQRVQ1b1E4?=
 =?utf-8?B?V2RjREZaaURKa1YvU1haVFJjVjdodzU2YnkrWVFPRHBFQkJtZTN2bExwcnpH?=
 =?utf-8?B?b3ZRdmxOQjBtL3NBTGRPZzVZa3FqbWtsSFE2UVNxc3BvaWV5cC9ScDQ5cG1l?=
 =?utf-8?B?YXpVTElqbkNDOVNocDBUY2pmRnlXWnBBbjZJR2JIOVBPckpDR0dOUUhLbXll?=
 =?utf-8?B?aENVOHFJZVJEcEtQSUcvYTFVT3N1bU01WTBSdjI3bDdEV2gvUXVHK1Vmcnpn?=
 =?utf-8?B?alZSNzlybG02YVpNUE13R200UHFqOE4xR3VkbVAzQmhZRFdOR0VLSFdORENk?=
 =?utf-8?B?ZVNJalNyN2dnVUphc2Fhc1RzRksxd0tTeDBMUmVsODlXY2ZIWm12aWEzUlhJ?=
 =?utf-8?B?MGFzMkZnLzMzN1c2aDZiNWQ0bTFCS3lWTWZlck16cUxjVVcxcG05UXVybGVn?=
 =?utf-8?B?YXRuSTlmZFg4WlVSM3NnT2c5SHloZ2Y1QVZSSS9xOGRDdFkxK2JhNSt1MlFi?=
 =?utf-8?B?VjM4dHpYOGgxZGpRV2dSWitaYzZydmRLVUM2a3ZTRW9USVdyazE3MUhlWEhP?=
 =?utf-8?B?WkgxY3p3VTA3K2dVQ2RZZVdWb2c4UUZBUzI3MWQwUExGVGV0cXFvd1lxY3VL?=
 =?utf-8?B?ZDB4QWZhSFBWenBqVUxoS3BoTUYwOE42R24wZ2oyYjJjdlNQL3B2Yk03dm8x?=
 =?utf-8?B?NC9ETC9kYmx3WUJVY284MnhjWk5pbnRsN0RTbDlmbjh1cjVHZmZpOTNYVGF4?=
 =?utf-8?B?NVI5TENqQjlMdnBOUGNXa09rMWlyZk1naVJvMldJTVc5ZFI5bjN2eTR3QTE1?=
 =?utf-8?B?akpVTW1LWm1ubCtZTGR6VGpSejVMWW5oYVlTSmNhYVo2OUQ0WTh6dHJld0Yx?=
 =?utf-8?B?a3hobnF1ejRVWWdpN0Y2cC8zdVhwRkg4SG5raEtKcVZZd0Y3L1ZwbkF1TkFZ?=
 =?utf-8?B?NHRpUDdpR0JCQmNGTjNjWnpjamRYT1l2Y1A4UWsyVnpmMGRDcC8wZmJFT0xv?=
 =?utf-8?B?UVZ3QUhwcmRwNlBuMDE2QkEwZVBRalFVWWl1T3NoUVRvY1NaMXN0bUxtLzR1?=
 =?utf-8?B?Smt6WU16K1Z2NEtXcFFyZFJLeGx1S2VwdGt1WDNNWnM0cFRCNTcrQ3Y2bzNB?=
 =?utf-8?B?SnhmcWM2YmxzNStpbXp0L0M2SHg4R1cyM0hpYnZpYkhEaEpna3dkejBLRHJv?=
 =?utf-8?B?ZzFuYm5ReGtvbk16TlNwUEhHNWJ2OFVuVk01c2s1U3RpM2MxVnllaTNBRXN5?=
 =?utf-8?B?VGFGeXN0SU5CNjNMVEppZWwzbnpCdUp0VlYxTmJpMkdtdzFHUUk0SmkzNG5C?=
 =?utf-8?B?V1k0dUxMeVBCdk5VVENYajNxbzR0dFN4V1YzQ2UweU0vZWQzclZuaGUrbGdR?=
 =?utf-8?Q?a/FxQxK+UtA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWxQWW1PL1VaVTZISkJXWHh4UXlhL3BmV2FDZzJnQk5JdHBodEcwbW1JU2lv?=
 =?utf-8?B?d3cyUkgzcVNXaW5kamR4c05EdklzanJwRDZMc2pBbnBUc0NqeFAvbVI5b045?=
 =?utf-8?B?OFJFbDZiKzFuck9LZm9BMU5aNlZjOGMrT0VIMFBnVUF5cXA2bXkvSDh1RWpX?=
 =?utf-8?B?OWZzcDV5TTFhcElodmhDV0NJVkNib25XbnJCMXNKa3lMVUkxWXhTcnM3VVZx?=
 =?utf-8?B?eDlVdG5McTdQVE56eU40ck5qdjZuUjZXVEJ6Ukk0VlNSMlg1ZFlndC94RmRk?=
 =?utf-8?B?UTlheFVjU09CVVRVMFJzOUlIbTc5Y0Z2Sit2Q1NzTW5KS1d5S2NBQVA1VDlq?=
 =?utf-8?B?Ukpyb3ZyclN5M2U5U1FTRnBUdWwxUlJ6QWsxVnFlMkJzdjJVTjdPckVWM0xa?=
 =?utf-8?B?Zkpjd3JKd2d6OVlYQnVGaVlrTWFIS0o3aXpTSUQ3RlF3MGZ6cUJCcm9nOHJw?=
 =?utf-8?B?SmllVGp6QWo3ck1udWJBNStRUDFVc1EyaFBYWWpJcWQwNUlWTm0xenRFV1dR?=
 =?utf-8?B?SDZONFZnUm1WcjdnaHBOaWJxRXVhQXNzVHBnT052bW9xYVFBR1NWY1BWZ3Vz?=
 =?utf-8?B?WjJzN3FDclNZYWJXbmRlL0NnVWV5L29Ma3BkL016YStJYkxaTHdlcGZHSjZo?=
 =?utf-8?B?VFdKam1rZnh2RkFmMHJQclBOWHE4b3B6Y1BaZFI0bUdFbllScUxYelltaHZQ?=
 =?utf-8?B?SUhIR0J3N0QvM2ZlMGlGaCtvODNkSVVWREx5UDVBUU14S0ZWNGphUDlqT0NZ?=
 =?utf-8?B?MEZ4cGFUOWpKNEk4WjRpaVlHbXlickowS0tjSUp4Y2hjeXhDUCt0NUFVckRW?=
 =?utf-8?B?Z1JmWXVaTG5wMkZ5bjZwdWlIeU5JeFZHMGR6UjYxN3ppbWhGam9OTnFPWVFj?=
 =?utf-8?B?Yk9mMmZZZzczdk05dHU5SnR4WXFFMW52WjNaYjRDTXA4RVN0U2packdzUmRH?=
 =?utf-8?B?dlEwb3ZuK1ppUDhXRFBncXRlQm9la0ZGOWxLYUF0amR3WTZSVVFRallyd0ds?=
 =?utf-8?B?bVQ1WGo1K21BSjY1RkRlRWxrUUNGVTRSYiszVFpUQ0VuZzdHUUN0bmF4Q0F6?=
 =?utf-8?B?K0laUGswUVVCOWhEblBpVkZiUGViMlZaeWxoOGxzVlVPVkZBRjVpelk0L2Rn?=
 =?utf-8?B?RXljRGR5T1pyT3pwd1RsQk5hR01DeHZoZ2dxa0VFUXJIZndFYXhpRHJQVlpo?=
 =?utf-8?B?STJaNWVwNWZmRzJjTWM1VDVQTFhzMVJUWWwvT3JVeWV5Z1U0WGlRL3ZRcTl5?=
 =?utf-8?B?WnVqbE9oazhzNXpZUE50Q0tySk11Vmk5dFVFekgyWjdHbTVVZVpMTXM5dTdZ?=
 =?utf-8?B?U29ZaEdJRjgvK2pwaUtBNDJEWTF2RDF0OXNHT0VnREN2VVdJbmxIUVhrdWNv?=
 =?utf-8?B?RjhZdUczZGU4WkRXbmZCNnZ5aFZ5bkhCd3FnT3ZheFZzM3AwK2dWdmNBdW14?=
 =?utf-8?B?bS9oRUZJbWdOaDNHWi95a3BXZ1NQemVCeHRreDM0MlJSVjNVMXdBM2xsdzRN?=
 =?utf-8?B?NEFQeVRpYlZoRGlHUE9KaEZldG1HVW1xRmprZldsSUFXOXB4RlNHeTZhUlZj?=
 =?utf-8?B?YnRrWDVhR2g3RlkxNWZWTzdxNFBxTlNya1IyajMxK3ZlT0FEcDFjcFVSMjRN?=
 =?utf-8?B?OXRjWVNRYVMxRkJKaTZJWVZGRXBqcEpZTmdJSEx4NXVSYUpQWE5xVkEvdk1Q?=
 =?utf-8?B?VHRsbVZQVWZSdTRUWkx6a245NkR6QzI2N0tCVWpjZ2V5OUNIUVBuNEQxKzU0?=
 =?utf-8?B?OU5zRHdlWWl1V0l0VE8rek4rdHB6RlQwVjhlTVZEWStNZzJLYUdNNkZ2T3Uw?=
 =?utf-8?B?TXJKcXRHbnNWUElidWZLTWxtc05zQTNzdUN1V0s0cWE1V1k5c25FWERVRGlB?=
 =?utf-8?B?MjFFU1pVL1BNMmVKMkJDVWxHT0VBZ0FLb05aN0xiNDlFTkNkbFUxNXlpaEhO?=
 =?utf-8?B?alBQTlowNnUvazFXbkZkMzNGZHIyeis2MGRIaS8vNVdDcDgzL0xZU3F2ZVdw?=
 =?utf-8?B?SXBoc0t3dnMxdWFYMGdhQlZRZDhnL21jdEk0dy9EK2MycnUzTmcvQ3RPeHBi?=
 =?utf-8?B?T3RURU9vU1Vib0JDaGZCMGhpZGdrVnRlV2ZSR1hRTlpZQmRsbU9lMW9WRWlF?=
 =?utf-8?B?Z1IvNi80MDI1R0FROFNFZWxoeFFvU2pNMlVEb3NjQUM1RVdscEJubTJpaW5k?=
 =?utf-8?Q?/TYnZ3MTmfSmd4UTel0vEOLuHPeVQHgixik+4/YSCvCy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c28487f-97cf-41f3-6ea7-08ddf05bb7ba
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 11:18:07.6247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Irizhk1snB0PaNbzscTt30A7FNGXmiV6iNx+OX8qWaGtEoECVUGWJ8QR9YQhjH+jZwANMVO+VU8vmvXJI0Puw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6628
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

On Wed Sep 10, 2025 at 5:01 PM JST, Danilo Krummrich wrote:
> On Wed Sep 10, 2025 at 6:48 AM CEST, Alexandre Courbot wrote:
>> On Tue Sep 9, 2025 at 11:43 PM JST, Danilo Krummrich wrote:
>>> 	impl Gpu {
>>> 	    pub(crate) fn new<'a>(
>>> 	        dev: &'a Device<Bound>,
>>> 	        bar: &'a Bar0
>>> 	        devres_bar: Arc<Devres<Bar0>>,
>>> 	    ) -> impl PinInit<Self, Error> + 'a {
>>> 	        try_pin_init(Self {
>>> 	            bar: devres_bar,
>>> 	            spec: Spec::new(bar)?,
>>> 	            gsp_falcon: Falcon::<Gsp>::new(dev, spec.chipset)?,
>>> 	            sec2_falcon: Falcon::<Sec2>::new(dev, spec.chipset)?,
>>> 	            sysmem_flush: SysmemFlush::register(dev, bar, spec.chipset=
)?
>>> 	            gsp <- Gsp::new(gsp_falcon, sec2_falcon, sysmem_flush)?,
>>> 	        })
>>> 	    }
>>> 	}
>>
>> It does work. The bizareness of passing the `bar` twice aside,
>
> Yeah, but it really seems like a minor inconvinience. (Especially, since =
this
> will be the only occurance of this we'll ever have.)

It's definitely not a big deal.

>
>> here is what it looks like when I got it to compile:
>
> This looks great!
>
>>     pub(crate) fn new<'a>(
>>         pdev: &'a pci::Device<device::Bound>,
>>         devres_bar: Arc<Devres<Bar0>>,
>>         bar: &'a Bar0,
>>     ) -> impl PinInit<Self, Error> + 'a {
>>         try_pin_init!(Self {
>>             spec: Spec::new(bar).inspect(|spec| {
>>                 dev_info!(
>>                     pdev.as_ref(),
>>                     "NVIDIA (Chipset: {}, Architecture: {:?}, Revision: =
{})\n",
>>                     spec.chipset,
>>                     spec.chipset.arch(),
>>                     spec.revision
>>                 );
>>             })?,
>
> +             _: {
> +                 gfw::wait_gfw_boot_completion(bar)
> +                     .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot =
did not complete"))?;
> +             },
>>
>>             sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec=
.chipset)?,
>>
>>             gsp_falcon: Falcon::<Gsp>::new(
>>                 pdev.as_ref(),
>>                 spec.chipset,
>>                 bar,
>>                 spec.chipset > Chipset::GA100,
>>             )
>>             .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
>>
>>             sec2_falcon: Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset=
, bar, true)?,
>>
> -             gsp: Self::start_gsp(pdev, bar, spec.chipset, gsp_falcon, s=
ec2_falcon)?,
> +             gsp <- Self::start_gsp(pdev, bar, spec.chipset, gsp_falcon,=
 sec2_falcon),
>>
>>             bar: devres_bar,
>>         })
>>     }
>>
>> The wait for GFW initialization had to be moved to `probe`, but that's
>> fine IMO.
>
> That's not necessary, you can keep it in Gpu::new() -- I don't see what's
> preventing us from that. I inserted it in the code above.

This one didn't work for me, but maybe you have a newer version of the
internal references patch:

error: no rules expected reserved identifier `_`
    --> drivers/gpu/nova-core/gpu.rs:323:13
     |
323  |             _: {
     |             ^ no rules expected this token in macro call
     |
note: while trying to match `)`

>
>> I do however find the code less readable in this form, less
>> editable as well. And LSP seems lost, so I don't get any syntax
>> highlighting in the `try_pin_init` block.
>
> Benno is working on a syntax update, so automatic formatting etc. will pr=
operly
> work.
>
> Otherwise, I can't see how this is a downgrade. It represents the initial=
ization
> process in a much clearer way that the current implementation of Gsp::new=
(),
> which is rather messy.
>
>> Fundamentally, this changes the method from a fallible method returning
>> a non-fallible initializer into a non-fallible method returning a
>> fallible initializer.
>
> Yeah, that's the best case when working with pin-init.
>
>> I'm ok with that, and maybe this new form will
>> encourage us to keep this method short, which is what we want, but other
>> than that what benefit are we getting from this change?
>
> The immediate benefit is that we don't need an extra allocation for the G=
sp
> structure.
>
> The general benefit is that once we need to add more fields to
> structures that require pinning (such as locks -- and we will need a lot =
of
> them) we're prepared for it.
>
> If we're not prepared for it, I'm pretty sure that everytime someone need=
s to
> add e.g. a new lock for something, it will just result in a new Pin<KBox<=
T>>,
> because the initial pin-init hierarchy just isn't there, and creating a n=
ew
> allocation is more convinient than fixing the existing code.
>
> This is exactly what pin-init was introduced for in the kernel, such that=
 we're
> not doing worse than equivalent C code.
>
> 	struct Foo {
> 	   struct Bar bar;
> 	   void *data;
> 	   struct mutex data_lock;
> 	}
>
> 	struct Bar {
> 	   void *data;
> 	   struct mutex data_lock;
> 	}
>
> In C you can just kmalloc(sizeof(Foo), GFP_KERNEL) and subsequently initi=
alize
> all fields.
>
> In Rust I don't want to fall back having to allocate for Bar *and* for Fo=
o
> separately.
>
> If there are things to improve with pin-init, let's improve them, but let=
's not
> do worse than C code in this aspect.

Maybe I need to get used to this way of initializing, but in any case I
can definitely live with it. And it we split initialization into proper
functions the code should remain readable.

I'll try and slip this into the next revision of this patchset, or as a
follow-up if there isn't one.
