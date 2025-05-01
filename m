Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE7EAA5FC0
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 16:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B126810E860;
	Thu,  1 May 2025 14:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SpCA9Ekn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC9510E089;
 Thu,  1 May 2025 14:18:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qv29jC6rHM7NHoB643SijA2aPRsD1mmuldyb1i85sLCTBsHRoHVXHPLwdov9bcsZOaDciZ5/iaMkt+uZNkFvqv4XiSsi7/e7gq2am+CS1uID7uxer57zYvYXUP8xDFlVRY28RCf9civF0auPBsMeoW5iHG12MQziuSE15aBmqGjdaC35ut/n06JwrjLYMvabmww4sZ2tWpeJXkApytVC+BoVqOLFtqz+e7Ay85o4c7jDbrGZr78TVgig0cRm/41WpvpsRRyVsFeVLyajDh1G9BbagLtA+WCjPn6DoS2N7RdOOyb0cVJ05VkNfjCO7Lmi6bAmbhRYtqYiN9zFn9BEAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLCmA2eTGwjLiKYHcr6BVoYS9LQdswvudv5hZ9n/kDA=;
 b=m50UdDxMpoDG7d+IcFImbjm0HYPcUoiSduJ/t0EU1sHFy4cfHzJ2NUAkPkL9nqJmN0HhSQqU6aYBOkI2gqZ+cd2UYwDmczH0pqSo73wPdJjuD/poN03lUb0QrnzanJxHg6U3hCCIny3/68Rn4E6iN6mCsIXbw8j30KhMsMOfkX0HGgNibwfW6H1fY7Jro1Oo0yIf8GW8mrdzOS73oQ+9AbXfacQsXBlSWt5dKZsMCs36Ni9WGsAwwv+IifcKZKBBUOqW5Rmd55QSK+lKBbMDj9diBYH8OY4SrK3yqmRgdVSnR88Abi70AuMEHKVouCSJZVOVqWzF1JIiP0lsPWPadQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLCmA2eTGwjLiKYHcr6BVoYS9LQdswvudv5hZ9n/kDA=;
 b=SpCA9EknoPXvkhwIO3sStEEro83KHt4FO5hoIkirhD8KcnBcBsNVpMItfkTWxaa30S0452My4ZDrMhiOWH7RBDO/b8Lc4FDGNP+EPpmRWv/ZxcUA+eHlKtiGUalf1fgSvQAppHzBJmm7dENlVWR/n98GjdbtmfDRhwTCfDZ2+N6M4+KFvvzSntDOCk2gC/wY8epT/zeXHsQdtIUVpgmxKeTf0wv0ctd8kYbEkpPmjMofP7+8RTz3P1q0PjwPXn8O03N4hr+ocinvBeVYGuLOKcwKO0AkjjkZ6k4IHpA+DPCwIKM4nB24P/Sv31epblH+oVp6vswSglKKwsdYyVtiVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB6671.namprd12.prod.outlook.com (2603:10b6:806:26d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Thu, 1 May
 2025 14:18:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 14:18:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 May 2025 23:18:06 +0900
Message-Id: <D9KW0GBF05DI.CYOUTQ2TD1XD@nvidia.com>
Subject: Re: [PATCH v2 15/21] gpu: nova-core: add falcon register
 definitions and base code
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-15-b4a137175337@nvidia.com>
 <20250501135234.GA687268@joelnvbox>
In-Reply-To: <20250501135234.GA687268@joelnvbox>
X-ClientProxiedBy: TYAPR01CA0224.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f966920-7365-4953-8c64-08dd88baffae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3ViVnowQnBjYWx1RVJCdUNzeEpPYlhacnczL21sS0hpWUNOQlR3aHc2cUVS?=
 =?utf-8?B?ZzVmTDhEeGFPZGk1Znk5dVU4OWVqTzQ5MElIZEMycGlsQ0wxbDN5VTJRVnJv?=
 =?utf-8?B?ckpGNjM1N3BCbG02UjNNNkJwRytMVXcyR3A5Mk5MdVE0dXFRL0g1dHM3VXFT?=
 =?utf-8?B?bkpRSWlyNElReitnNlJlWDFXZGZ2d0lJNFNNZFBQZFBkNEhMSGlQdDhBank5?=
 =?utf-8?B?MlcvQVY2RkRhcXpBS055ZG4zZFZlZ2ZCbkN6ekJ6NlhGNWQ2Y2t0bGZ5Ry82?=
 =?utf-8?B?ckJlWXZib2ZpckVUWlB3NkJLZjdKN2VvaGxOL1VFbzlMRzljWlc1V0Z3Kzhh?=
 =?utf-8?B?RXZubGR5TGZnTFdsaHZMMHM0STZWV2x0Y3FlWTFHOXcrbTRRK3R5eTluUnUx?=
 =?utf-8?B?bFFTc3lmcUNwaW5ReGVFdlRtRTVSQ3A2UmRCS0FkaERySkZoQW1GazF2Q3Zv?=
 =?utf-8?B?d0pGcGVZS2tEamFGVUxXaTZFa3E1cUpqTjhEczlCaVk1ODZPVHBWSmJRRkRV?=
 =?utf-8?B?WldkbUNVN0g1OHBLZlVBM1R3QTBCUkxvOHVqUHp2U3FxYzd2VnQ1aFRNQ0ZY?=
 =?utf-8?B?aE81Wmt4bE5PMjBhRnV5WVpzUUtQMXVKRVFWeThHVmk0SU1IKzhKUjZKNlo4?=
 =?utf-8?B?NEdvR1JBVDFXTG0xR2JSNHpFd3VpUDArd1Znb0JEa1NSTGltak9GYktQM2Vh?=
 =?utf-8?B?VmhZM2JwWTd1aXRoR0hUM0xXMTNUbVpHUE1acSswV1hVLzZoM3BkOVJBQ3Vi?=
 =?utf-8?B?L2NvRXI4TVFJcnQ3cTVFL0R2S04zU29ueWRJS092WHZxYXNxeml6RzdQUnMz?=
 =?utf-8?B?K0MvMU54cFRnbFAyY3dPWWVETmlURStMZlFBZEkvdlBwM2ZRQTMwczVYNEd6?=
 =?utf-8?B?NUlsdkpxU2Rselp3NXIwVFpuTU5abzFaK3FEMko4dFkwVVMzNzg5VXRRUWdm?=
 =?utf-8?B?c0FXcGhrM0hJSXZOeWlRcjVLQmtTSTBxYjRKSFptUXVQdktuSGZwVnhIUWU0?=
 =?utf-8?B?bE5JVWZuckhrckIwZXdFSVQ1RncxclVyZjVSbWdGb0hwRUpDU3h6RHZtUmxp?=
 =?utf-8?B?ckdrNFVKcjFNQUxLVGk4NUhhV1hCVUgwWHgreElSZWFGQUlxL1pLUDFkUWUw?=
 =?utf-8?B?ZUJYWktSU2Z5aVpRUStQYmllWDBKbDZvOUQ3czZlZ2QwVTdSVEZZcWpRbkpZ?=
 =?utf-8?B?eWM2UmM5UTJvcWorYmtlc1FDb3NSN3hlamJ5dHEydWhiSzZlSU9FUjlkeG95?=
 =?utf-8?B?Y05ZZUtMSjNWQmhNTFFSaU82bVE0ZkdFTlJIU3pjUFZ4ZFBoWE0zMDlKaFZn?=
 =?utf-8?B?K1dQb2lSa2x3aktXNmh2WFA4cnFsOTBxMVNvYmxhaGpQUDhwdW1XWGFtOGRF?=
 =?utf-8?B?S1VTK2JsQ2ZoTFZNZk92Ly9lVmU0bW0xR3p2V0NTNVNvN0k0RnVYRW5vN0pV?=
 =?utf-8?B?R3ZNbjZLaEMva05DbmhTb1BsMkZ2bytaNjM1WFVoSWw4SEFQaDhtRS9mNHNY?=
 =?utf-8?B?aWhzNHphWHNRbFIyVm9NMXE2Y2VKWUV0NkhqSmZSZW5Vb2QrKzM4RHRwTElv?=
 =?utf-8?B?NFkwdEFHMzNkTm9CVHFsOW1tY2pXMXdQL0hvSzZCLzM3WFJleURwKzJWRnFS?=
 =?utf-8?B?NHptcmRZaGZlYWQ1RWVRSXJhbGFwNGx5dXU5SlZmNjNKUTJBSEUrQ09acFZ0?=
 =?utf-8?B?S1VjN1dOOHVNV29TeHRrVmtlMExjKzFZVkZTTHQrTUVocVRmdjdwTElrOHpv?=
 =?utf-8?B?WnpVYWdNVVdIUENJRk0ybGNYWmlpdW1CUGl6TzJmeC9nYkFRS2U2S0k4M0JO?=
 =?utf-8?B?Ky9aZW1uZnM1bDVWREFWWWFNa1dzZytCa2tkWlFmVklad0w2TDNuRC9HeFQ1?=
 =?utf-8?B?TEQ2OWxHVGhWSHNXd0FmNExHNmJUTVZ1dVhuUTczN2x6b2ZEcHZtd0REcWpL?=
 =?utf-8?Q?YaiAGowL5CU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sjl3dHN0UkhsSzRWcWxUU1YxZWx0RWQrTWtBK0xHTWdaTWlSbHQ4NmtwczV1?=
 =?utf-8?B?QXJEMFcxcEVneCsvUUc2U211N1d3UG5mL2pwblBLTmphdURoeXlSenV6OU9x?=
 =?utf-8?B?dWFENkFlTGp0RGFkUDZ0RXM5U1MwOGVJek1pdXN5MndqQm5PZWwwZWM1M0ds?=
 =?utf-8?B?SjE5Mjhad0FUMTl0Z0tobTh1NjRJZVFYNUJMU2NJb0EybFJxUXN2SEQ1QWFI?=
 =?utf-8?B?cnkwN29vZGMrK1lFWnhkT05qdTNWcmRSYkFLNWMzRG5jaTlscFdiTmxJMUp5?=
 =?utf-8?B?U3FFNEpKRHIrS25kTmFQOHdvUlNFQXAyUnUwN1l1QTQwd21KWkdqMGE0aHp3?=
 =?utf-8?B?YlYxdzNtV1Q5V3JUb1pWc21IZlhKak1jeE9ON2FYQ0ltN0pZc1gwSEczcnBG?=
 =?utf-8?B?VDF0aHhZZ3FwSlJmeWxaZ0xnUFBJYzZ5czVxQ0ROTzFhSjdKVG9UR2pNRHFF?=
 =?utf-8?B?bEJrekJmeFdLc1Fab2E2LzM4cm1jaytBMU1BQlFvTXJ3eVJyeWlJc2l4YUJK?=
 =?utf-8?B?WWJVbHhiM0N4OHpnNjNkcnlCa1p5ZzVJU2xNK0toM1dOMmhycm9VdHdDaGcr?=
 =?utf-8?B?akxaa0czclYxaHVEdi83cXJLbGlKK3FNUmhpOTFzZkhDZ05yK0RXcUQ2RDcv?=
 =?utf-8?B?N1VEV1BsSEk5aFRIcE02MVpxVzJXYUVIRUhTdmZmVG40Wm5XMUE1WXdXbm1V?=
 =?utf-8?B?ZUZxVFlmVm1BSndIOUVBMDAvSlhKdjVYOUtwZHhRRXRSL1dZRDU5eUhOMGF1?=
 =?utf-8?B?N005eWZVWCtyS1RJYURFZW5XZXY3Q09abjRlcTczN2lWNVBXZUdISjIwS3dK?=
 =?utf-8?B?Sk1WZ2pmTDhhNGp0QkFkWmZVK2VZUjRNVFFHN3YvS0FOWXV3REZKSlVlNFlW?=
 =?utf-8?B?dEpOSUN3emt6aGJKVGZuTlJYMTMvTmtzQ3hubVRHdjdKckhhb3ArSnorV210?=
 =?utf-8?B?cnk2QnZtVlhKQW5abGZSejZucE9NMllEU2pwa2hZSDRPck80NnE0dHRWV2xI?=
 =?utf-8?B?U0NaWkpiOUg3YlZUcStIZ0NoT0VmN09qQng0eVVhL0pqdUZ0dURRbkthalIy?=
 =?utf-8?B?dlRSNGMrN2NNdS83Ty8rOHE3Mk9iUFkrMXlydHkraVYvT1JELzIxK1RIbE9a?=
 =?utf-8?B?b2lraGhORFA4YkgxRFdLb25iRVppaktFQlNZSFMvU0ZnMWxSR1R6RmlwMHB5?=
 =?utf-8?B?RnpmUnR4RFY3dW5NN1FJODNrNmRLZ1V6MFVFRnl1aWE4blVleTBLaWZtcStZ?=
 =?utf-8?B?UitYc1J3TERpRGoraGJENGM3VXl2MzBaVzdyaVJDTHVSa2FTVThQUHBuQ1Fv?=
 =?utf-8?B?cDZmNjJXeXUzNWtBTDVtZ1AzOU5YVUlUM2ZuTFRQSzFQclJYMDB3TmdqenRi?=
 =?utf-8?B?UlBjSkI4cktWK2ZnT0toMFllN2o5TnQyTUtFSFpXVVB1R0lzSXZvUFMvMDhG?=
 =?utf-8?B?N0d4SGowQnNVUGZBT3U1bkJhZXFsWExXOXVnSTdoWnVGcUlxakd5dG9wT3gw?=
 =?utf-8?B?V01JYUpocmZVSzJKSzJFOVpaUTVHVWlRVXM2Y3ZpZllwQUsyaXR4Y0ZLZncr?=
 =?utf-8?B?S2pSS2l4ZXg4M1RUeDFrOGhrWHE2U29ZKys0ek1hdXE1VTBCZy9jcXREVVpJ?=
 =?utf-8?B?M2xyTG9sWi84KytrL0NUMDIxdU9IL0RhMCtMemxtSi8xWHIzM2k1SGdINHVW?=
 =?utf-8?B?NWY2cjZETlhqaURPVDlRWnhYSXlocjBCc2dMYVJ3S3NpQzF1RkJ6dzUraEg0?=
 =?utf-8?B?VkN5cVliWnp3V1Q1eGhDaERlYks0a1Z0Si81d1Z3S2doaTlkNTNvYkRSczdy?=
 =?utf-8?B?Y3owTkVjaGVXNUxWQnFVVjltbHdCT2hEU2N2cnJJaytSektoaGFwQW4wYTNi?=
 =?utf-8?B?bGZ4MytsR3dnZ2RzazlSbXl3SS9ERXZCcjRKbFdaQXJDQndBNGRDb2xya2g4?=
 =?utf-8?B?N0hDcGpXbWRBbDhmVDVtb2ZmVEtlZkVxUDZZNVZlSlBiL2NsZERjcUdjQnZD?=
 =?utf-8?B?dGU1bkczR3ZjUmhVTWVvUUhCSC9CbVR3dHE3UldNZVlaK0dMZHFRRW1FOTlz?=
 =?utf-8?B?VkxscUl2TUx0bmRIUDhwVE9vNU5jdjBLbXZtVXQzY3N5cHliRzRKSlE2T2Fu?=
 =?utf-8?B?ZWZ1Tm9GRVFBcmZwbGRndE9YN0V2VkVrMDE1QUdkeXlia1d2dUxyNHc2VlRV?=
 =?utf-8?Q?+y9NC1phO2K4UwHuYK7eTvVwUXmfCuO7scvVT1lQsbLt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f966920-7365-4953-8c64-08dd88baffae
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 14:18:09.5291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OaMUWHFgJvFpAhX+6GLbIm2TvakXw3U6ka3O4j6VOg64Jc4AS5JX42LkGAKTw+YB7W3ElBbQVX6kP/E3QKg6eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6671
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

On Thu May 1, 2025 at 10:52 PM JST, Joel Fernandes wrote:
> Hello Alex,
>
> On Thu, May 01, 2025 at 09:58:33PM +0900, Alexandre Courbot wrote:
>> Add the common Falcon code and HAL for Ampere GPUs, and instantiate the
>> GSP and SEC2 Falcons that will be required to boot the GSP.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/falcon.rs           | 546 +++++++++++++++++++++++=
+++++++
>>  drivers/gpu/nova-core/falcon/gsp.rs       |  25 ++
>>  drivers/gpu/nova-core/falcon/hal.rs       |  55 +++
>>  drivers/gpu/nova-core/falcon/hal/ga102.rs | 115 +++++++
>>  drivers/gpu/nova-core/falcon/sec2.rs      |   8 +
>>  drivers/gpu/nova-core/gpu.rs              |  11 +
>>  drivers/gpu/nova-core/nova_core.rs        |   1 +
>>  drivers/gpu/nova-core/regs.rs             | 125 +++++++
>>  drivers/gpu/nova-core/util.rs             |   1 -
>>  9 files changed, 886 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/fal=
con.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..7cae45645e548bab5b85cb53=
880898cedbae778a
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/falcon.rs
>> @@ -0,0 +1,546 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Falcon microprocessor base support
>> +
>> +// To be removed when all code is used.
>> +#![expect(dead_code)]
>> +
>> +use core::time::Duration;
>> +use hal::FalconHal;
>> +use kernel::bindings;
>> +use kernel::device;
>> +use kernel::devres::Devres;
>> +use kernel::prelude::*;
>> +use kernel::sync::Arc;
>> +
>> +use crate::driver::Bar0;
>> +use crate::gpu::Chipset;
>> +use crate::regs;
>> +use crate::util;
>> +
>> +pub(crate) mod gsp;
>> +mod hal;
>> +pub(crate) mod sec2;
>> +
>> +/// Revision number of a falcon core, used in the [`crate::regs::NV_PFA=
LCON_FALCON_HWCFG1`]
>> +/// register.
>> +#[repr(u8)]
>> +#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
>> +pub(crate) enum FalconCoreRev {
>> +    #[default]
>> +    Rev1 =3D 1,
>> +    Rev2 =3D 2,
>> +    Rev3 =3D 3,
>> +    Rev4 =3D 4,
>> +    Rev5 =3D 5,
>> +    Rev6 =3D 6,
>> +    Rev7 =3D 7,
>> +}
>> +
>> +impl TryFrom<u8> for FalconCoreRev {
>> +    type Error =3D Error;
>> +
>> +    fn try_from(value: u8) -> core::result::Result<Self, Self::Error> {
>> +        use FalconCoreRev::*;
>> +
>> +        let rev =3D match value {
>> +            1 =3D> Rev1,
>> +            2 =3D> Rev2,
>> +            3 =3D> Rev3,
>> +            4 =3D> Rev4,
>> +            5 =3D> Rev5,
>> +            6 =3D> Rev6,
>> +            7 =3D> Rev7,
>> +            _ =3D> return Err(EINVAL),
>> +        };
>> +
>> +        Ok(rev)
>> +    }
>> +}
>> +
>> +/// Revision subversion number of a falcon core, used in the
>> +/// [`crate::regs::NV_PFALCON_FALCON_HWCFG1`] register.
>> +#[repr(u8)]
>> +#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
>> +pub(crate) enum FalconCoreRevSubversion {
>> +    #[default]
>> +    Subversion0 =3D 0,
>> +    Subversion1 =3D 1,
>> +    Subversion2 =3D 2,
>> +    Subversion3 =3D 3,
>> +}
>> +
>> +impl TryFrom<u8> for FalconCoreRevSubversion {
>> +    type Error =3D Error;
>> +
>> +    fn try_from(value: u8) -> Result<Self> {
>> +        use FalconCoreRevSubversion::*;
>> +
>> +        let sub_version =3D match value & 0b11 {
>> +            0 =3D> Subversion0,
>> +            1 =3D> Subversion1,
>> +            2 =3D> Subversion2,
>> +            3 =3D> Subversion3,
>> +            _ =3D> return Err(EINVAL),
>> +        };
>> +
>> +        Ok(sub_version)
>> +    }
>> +}
>> +
>> +/// Security model of a falcon core, used in the [`crate::regs::NV_PFAL=
CON_FALCON_HWCFG1`]
>> +/// register.
>> +#[repr(u8)]
>> +#[derive(Debug, Default, Copy, Clone)]
>> +pub(crate) enum FalconSecurityModel {
>> +    /// Non-Secure: runs unsigned code without privileges.
>> +    #[default]
>> +    None =3D 0,
>> +    /// Low-secure: runs unsigned code with some privileges. Can only b=
e entered from `Heavy` mode.
>
> This is not true. Low-secure is also (has to be) signed and the signature=
s
> are verified by High-secure code. I can/will go fix that up in my follow-=
up doc
> patches.

True, but contrary to HS code, the signature in the LS code is not a
hardware (or rather boot ROM) requirement - it's just that the HS code
decides to implement this policy and you could very well have a HS
loader that loads some code and switches to LS without further
verification. The point being that you cannot enter LS mode directly and
need to go through a HS loader first.

Nonetheless, you are right that in practice the HS code will not switch
to LS without due verification, and my use of "unsigned" is confusing.
Let me reword this.

>
>> +/// Returns a boxed falcon HAL adequate for the passed `chipset`.
>> +///
>> +/// We use this function and a heap-allocated trait object instead of s=
tatically defined trait
>> +/// objects because of the two-dimensional (Chipset, Engine) lookup req=
uired to return the
>> +/// requested HAL.
>> +///
>> +/// TODO: replace the return type with `KBox` once it gains the ability=
 to host trait objects.
>> +pub(crate) fn create_falcon_hal<E: FalconEngine + 'static>(
>> +    chipset: Chipset,
>> +) -> Result<Arc<dyn FalconHal<E>>> {
>> +    let hal =3D match chipset {
>> +        Chipset::GA102 | Chipset::GA103 | Chipset::GA104 | Chipset::GA1=
06 | Chipset::GA107 =3D> {
>> +            Arc::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as Arc<dyn =
FalconHal<E>>
>
> I am guessing macro-fication of this did not pan out? i.e. I think we
> discussed:
> 1. Seeing if we can reduce/get rid of Arc in favor of static allocation.
> 2. Simplify the chain of GAxx | GAyy..
> But nothing that cannot be done as a follow-up improvement..

Yeah, my macro-fu is still lacking it seems. ^_^;

> (Also it is a bit weird that the namespace for chipsets for > GA10x is
> ga102::GA102::). Example, Chipset::GA104 uses the HAL in Ga102).

It is a convention since Nouveau (but I believe OpenRM as well?) to name
a HAL after the chipset with the lowest number when subsequent chipsets
can also use it.
