Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A33BE1034
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 01:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E51910E0DA;
	Wed, 15 Oct 2025 23:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Bs7UrSMP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012013.outbound.protection.outlook.com [40.107.209.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95E110E0DA;
 Wed, 15 Oct 2025 23:19:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1C8GKmQzFEw6CGk8Ly7p5Azu4kxWvbq+uba1wU8hpMEVDadYP5wqn/qccYs6FU+thNRdwgChZVhKQ56ZYHc9opm4kzXKmGYUpYZndF77tMO6yrBvkHgoD1wbWlNsAUl9Po2YqJGIxHwC23PMJDLznXcn/NIyu9+ryOuIEyP+6/dxzW/VaxD3JI/evHMpj6PwCDRv6nOqJq/Apx7Auy1T+saVkEG3zvM8qdtRO4Ea8EmQucOFqZcKqfbXSS3cTypC9GQ412Z1pkqt8zvHCEtIhp9LZaiJxTtyhj6YiBjVjpxZAAKaSnYw4gFCrTqUMg/B3vdNvYqu3Nn01PqR7JuEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jr8JiuGGSybDno7bNrtjRmTLIQ2ZJDgLbs/jwEY+sC0=;
 b=tmBs8ikovJLJOxQ2MJ8znSOaPANT9w2V3pLaSKM0zPKwrfD1K3aO6J1uSvZAE3gqarUCWZmpP2CJJKULU1R5Lxiz0o3Q5yScdm0nEjUo04p4zuv4RwaUciNDnYk47y28PoiPrAzX3iK5HrIWTkdTiBNmmLW7RW89oVMVnV0nPiCyg0FEeSCf19byZsrzJx2RpppR0HQP2bTDOCaGV0bHtTiSzJ80+/7kiFCJtPNivDcKNLgSaVLP9SbC5WduKy2SXGo5sy2PBERtObAtXq59ULZzj+bJzYsbMCQ1Gs7hm6RBNI+sTYsAKFXaXQnof2xmyxzpFmX6VjCU7RZxOfbTog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jr8JiuGGSybDno7bNrtjRmTLIQ2ZJDgLbs/jwEY+sC0=;
 b=Bs7UrSMPZapXGapEtdz0Px0zqRab3Qe2AvT6g5uylpVNd7ZAabRkIW+pPuyxMPpRwVSXoXD0groH0ajkRGV7U/YZC/9oysUi3aClIBcw0sEAUmyCnXzdjPi3j3GrlWdxIP/s+tq+B17fioXqdRI8o68ac/dOoE8N8sTYeFCnxd+YGFUkbm2TynMob6q2mwca16dB6uHowRpZA7QtyYWAHvUyp2w44QvwmdOIb0vhRTKJvwl3iPxudKAOVBbUZAE53gY6geLscoc0NTGTqjRX5i90vkY0hwSNccJmAfp3Id0Wu33ABHpgvphz9YD/SPI6qIUDJ/BEG4FHho2x9nFl/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ1PR12MB6218.namprd12.prod.outlook.com (2603:10b6:a03:457::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Wed, 15 Oct
 2025 23:19:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 23:19:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 08:19:40 +0900
Message-Id: <DDJA432ZT4VN.1OR5IBE322IAC@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
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
 <joel@joelfernandes.org>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v2] nova-core: vbios: Rework BiosImage to be simpler
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251009004732.2287050-1-joelagnelf@nvidia.com>
In-Reply-To: <20251009004732.2287050-1-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0190.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ1PR12MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: b0c4341b-d014-479c-603d-08de0c415315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uk4ybnZXdGFxSWRHb21KQzJFU0p4bVl0VGJUZzdXT0ZQbXFXRkVIV1RSQ2Yr?=
 =?utf-8?B?YXAwOUtYRHlLbStiSU80VzhKc1lFeDU4S3c5aDJGMWs1Mkhrd1Q4Sy84VlZF?=
 =?utf-8?B?R3REbjdwZ3liZzE0VGt4NWVZTkJhM2c0eUNPVlUyQ2Z5SGpsY2p2KzM0cGZ1?=
 =?utf-8?B?RUNaN2FqVVd2aVNjeWNzYjdOclpPQlJxYjRzS01DRGs3ODRqdjF0alpWbDRT?=
 =?utf-8?B?TU1GTWZvUkNXTDZIWGZsUmVNdVVpd0o3UG9CNVZzSXV5SXZuUWNVdW90WHpK?=
 =?utf-8?B?aEtwU0lCNlhudFpCa2tEV1JDVGdrRFdTb1JOTE9sc0tCYjdwV0Mxck9OVCt2?=
 =?utf-8?B?UkM5UlV2d3ZCNTR6bGJUK1VIV3BCUWdXOG4yVmd5WHo3T0xmQWNuMzlqMWJt?=
 =?utf-8?B?ZmY0WFQ5REtIN3F1dE1ONUw3ZC83eWpUdllRUERWcmVaS21TMkNudEVEbE9p?=
 =?utf-8?B?bS9LdTVlQVJFY2JFaWgrYTRLNFFrSDZYYU0yRkFJV2JhTFlwNUg0aG1mbERw?=
 =?utf-8?B?dkNYckxscCtLejhtVnJmMFJEbStoUjFXa0YvWXdMZUpteUVEd2crQkwzRmFk?=
 =?utf-8?B?NWRNM2FUMk5XV3l4dHh1RXQxZkphQUdiOVZkbm8yWG9ldTd3VzcyR2FUZENr?=
 =?utf-8?B?RVdLd0pVSm9BSUZQK3FRay8yV3VqazYxYkxlaEc1aklNcWZ1K0FZRHdwNURE?=
 =?utf-8?B?b0dIMXlUeWtSdmhYWSs3R2E5RDdGeXNWbEVZWDZFN3ZFWCtSWVVTOHp5RHl5?=
 =?utf-8?B?aGpuS29mNFFOV1grWml3NlVwVDhqWXlKdkdQMWNSSlp5L2lFY3BXYnZvZVpK?=
 =?utf-8?B?ZUduUFUveCtIT3pVWTdxQjJYdE5Ma3V0blNXMUY3ZTNDRXgwVEF6NGQwR2E4?=
 =?utf-8?B?NWNjZWlKMHl3ckI1aUpVQ1EyY0dUM1ovOU1EeVVNVkhXQXZnZ2lGeXc1SlM0?=
 =?utf-8?B?dXNnTlJET0ZCZVJzUU1rOU1Wam1udEx2WU0zTWxRL0tjMTVKZzRQcjd4c1B6?=
 =?utf-8?B?eVUxUlMvSFVZcjJxWHliSzIvYWNUa3BVRG9MTzR4NFluYUVpQmJyRmVpMzc2?=
 =?utf-8?B?OS9GeXJQSzZGS2xUR0d6Y3o4c0drdjVqMXM4d1BBcGp1TnIxS0NpaWhycW1U?=
 =?utf-8?B?T3VKUGpwa0kvU1dDV1RqdVhnWS9HMzBrNGcwRENJVlc0TzIwWmVNcUJicEl3?=
 =?utf-8?B?MkpHVlFURVRoVkcxQTczcVVCYWdwdDIwUjFMVFVmUUZxNnZscHNJai9lb1Ay?=
 =?utf-8?B?eXlXZHM1VERyR1dXQTBrQllRK05YSWFTbExZWVpBdzlUN24reVBpSk1Sb0xZ?=
 =?utf-8?B?WENXMTNoTllmcEMzczU5cHpyVEkwd29QQmYyMDVHd3VVc1QvTit3SFpVRzdm?=
 =?utf-8?B?NisvNXovVHNhak5md21QOXRyVHdkeHM4elFWWFNmcXpxNXJCYm1pWmN1eUtM?=
 =?utf-8?B?NnJ1eFlJUDR5TTcrYytrQXNlaHpwKzNsSXQwWHFCa0hvQmFyNGtWN3c2bUgx?=
 =?utf-8?B?ZGF6bCtQS0E1NDhHMDNmN3NSYlB4VzduNFVOVFpPaDNoeUc5M0Z3WkpwNWNu?=
 =?utf-8?B?TFluWEtUNTN2U1VNR3NFMzZYbGZZRGloemVLR25HNUQ1N3pGUjZVYloxeHVz?=
 =?utf-8?B?T3RMcWxsNFN5bGVISGh5cjNOU3FhK0Q3WmFNTTE4VU9uTDN5UnpNY3g1a3FF?=
 =?utf-8?B?NmEzRDdSNGtvRTFrR3JhakRHK0xSeXUrdnZoMU9oN2xZeStkdGd3SzlLV2gv?=
 =?utf-8?B?alQyOXZ1YXp0NkRaN0hHZVFhK2VUdmJxeldzbGpEYzUzTjl2eHFWTktjVW44?=
 =?utf-8?B?bGJUSHRoRnh6NXN1VUJoWWxyMTQyeFE2anhBaUpFNXVtWUxsbjVGMy9GbEs4?=
 =?utf-8?B?RXJzWlFWaEpOZHE4SUtIaGx2TDVUT3BmVnZuSUlEQmtwcC9RdzJwM3hVZlp1?=
 =?utf-8?Q?P0dPgP4biBneOJigtTVTrKIYx4WXYO+X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFdrZVFYZ2tjWjVTTkJlYUxORXBVUTNGWk4vV1ZKZm4wNGp2anpPTWpGV205?=
 =?utf-8?B?bWpxVWtEejA5WkxYalloeE1FRzEwcFBFaGV0bEtyUXBVdFoyUnJFTHV1Y0ZW?=
 =?utf-8?B?SDgzN21XNmdDRXd0cC90RFg5V3JmWFFLeVRqdnc4K2lUWDgydGRnY3Zob1Iy?=
 =?utf-8?B?NW9JYWNHaURFZHhwcmRnYnV4bExiNzl6U2IxQ1JGWUYyTEtRUVRKcHM2UmJD?=
 =?utf-8?B?ZWtPdyt5WGwvOHo3bnFNQktSanhScWxsSjdCREkzTWlWcUVoZXI3MGRid0V0?=
 =?utf-8?B?ZkZiOGNhc2pxcFRtRFZ0bitac09VVjFtUEVINVF3a0V6emFRT3FESzZ3WFhZ?=
 =?utf-8?B?TVNDVTJRekNTSjRZZnFNV0hhVVJ1WEhrdnJhYTVRNCsrcyt0SFdQdURiN0Ju?=
 =?utf-8?B?cFgvb0ZBc0w4bXh5Zy9oYXZ6djY3b3YvaHEybjBISVoxTFUxUEJTTnFzRlBM?=
 =?utf-8?B?bkNMbWJzQTUrWEtLN0tzZUZQUXo3cEZzZlo0aGRNNDZTSytmTDNhcmx3bFhZ?=
 =?utf-8?B?VjJleUJYZElvaWNIWUE0WGErcngyWTAvM2hjVmhtZE5Nd3RaT0JhWEJRbDE5?=
 =?utf-8?B?RUt1dUN0NjloTUJnL21wYTVjK2xkYklrYXRTdW1ZMFFneVdIUjM5ODRnMnZs?=
 =?utf-8?B?K1QxYjQrSnJQclJHUkJDcnFtbVhFZlE2dXNPV3QrSzhZblczdmlwdXpmMTJJ?=
 =?utf-8?B?RWs0bThwaEZHNjZzNFc3WTdKa2IxbDJySWwyOHc5ekp2d1hWQUIwdHpmOVBo?=
 =?utf-8?B?RDlMNlkybWJUa0l0b3pjYXZ0Z2pFZ2Fsa0xtTytLOTlWTFVuV1M0TkRkTzQ0?=
 =?utf-8?B?aFNqZHFsZ081elFNNlNMMC93YWpPU2xRQWRqY3l6dVNsYlpuVVIxVmlCTHB1?=
 =?utf-8?B?UlRMcm93dXlrVUZ0RG9IMUxVczNxNFcxUGZHd1N5QUk3WnNBR1ZSb3VyR3Z0?=
 =?utf-8?B?dzZ4Y1JNaTFMc1ZUak5QSXdaVmcvbVRBQVd5dnJkL2hZUzY2TXEyMUdOMmdI?=
 =?utf-8?B?RzVIZXhGeVlRVWs3bzh1bGFPSFJDeFEweXl2QUs3ckZjcFB1Z044NlFsZU50?=
 =?utf-8?B?emppdyt0OTd2SWRqN1V4bWU4RGc5QnhDMStJVmdxeTFNMThMVkV5VUtveXdl?=
 =?utf-8?B?LytwRkEyR01vVS96dVJoT2o2NklraU52OHdySEg1cnM4RS9SdFhlV3NPVVZr?=
 =?utf-8?B?UXpaaXlTZFFnaUV2VDg5bC9YclpkS1hiODVZQWE4WnZzQk1aYkJId294dGpw?=
 =?utf-8?B?cHNMMnNGYk81ODhSQXkwZzE0R0VlWUdpM0dnQUJ2amljcElHcEJDMVhuWHJU?=
 =?utf-8?B?TGxnYytkNnhYRnRaR1lpSm9QVDhzU21icDQ3S0NLT21rMW9yVklOME1WSGJ0?=
 =?utf-8?B?RXRpOW9zTlFqRUFFdVUzWVlCU1FmZE45UVhKbktPTE85TjM0OXArZXkwMG1j?=
 =?utf-8?B?TEs2WlhPRXJrZjlBSlNYQTNDN1VsZjdVY3N4UllqTlVzaHc1UVNTM3dTT0I1?=
 =?utf-8?B?STFXNG5WLzNmZHJmVUs5MGgzdzJZeTJ1NVNRbkQrYnNBNGUvNUdJUGNxT3Bm?=
 =?utf-8?B?UVFUVnRjUnBHcHBBdWYrc09VRWM2K09XWmJDOThwYjJnVFA4YUFwQTBsbTF6?=
 =?utf-8?B?bDhLZWViUUN0MENaczYxNjR3UU12UTFlM1JneHJRcHlTODVqN3VaTDRJekxI?=
 =?utf-8?B?RStGaFQ3RnE1TGlSMmZwRmlUYWF4SGgweWNBUUp1c3BhYnZ0VTV6eUFaZVZv?=
 =?utf-8?B?b2VXczl2UzZxZmREemNyTlhIWmIzbmxEc1MrbmRIcFJoOCtYeWJ1c0Y4OE4z?=
 =?utf-8?B?aWF4SENsMjVFLytJZ0l2U2tVUndMUzVsL1cxR1VmTkNpRHNiSFlIbE9scWgr?=
 =?utf-8?B?S1FlczU4QVZ6WExLelErYVVSSnJxR0dRbVp4dUt5YlF2aGx2L2JmenVISUhj?=
 =?utf-8?B?bWcrQk92alRDRjlXRmhDMlpzazFjMTFteW5JTEYySCtwRFY5ekkwS0ZoYW5j?=
 =?utf-8?B?RWtGeDV3ZDlIUm9HY1RKT01SQmVIU3Y4a1I1S3ZDbU1zQi9BTGRqLytTYVlM?=
 =?utf-8?B?MXB0ZXpIRXovOXN1bHBScmdpZjkxUW1XYXRTajNaZTJYRnpSKythL0JoMmU4?=
 =?utf-8?B?RzJoWXYyaVdoR3dCeFJaaDdESERqWlFnWEIrUnQxZHVlWXRiOWxlTDF4N3Iv?=
 =?utf-8?Q?H/VgO96VocQcCfijephFxE7kbqgaAxMY84k7LlXSbBeb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c4341b-d014-479c-603d-08de0c415315
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 23:19:45.3499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3XRv8kF1s9Qi++/3bZd5awtVG/CbOMMJKnutFynuhN8ZyaWZU2iy7aUj3gRWOL5sAGYvFTlwPObBXW2EA3e8gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6218
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

On Thu Oct 9, 2025 at 9:47 AM JST, Joel Fernandes wrote:
> Currently, the BiosImage type in vbios code is implemented as a
> type-wrapping enum with the sole purpose of implementing a type that is
> common to all specific image types. To make this work, macros were used
> to overcome limitations of using enums. Ugly match statements were also
> required to route methods from the enum type to the specific image type.
>
> Simplify the code by just creating the common BiosImage type in the
> iterator, and then converting it to specific image type after. This
> works well since all the methods common to different BiosImage are
> called only during the iteration and not later. Should we need to call
> these common methods later, we can use AsRef and traits, but for now not
> doing so gives us a nice ~50 negative line delta versus the existing code
> and is a lot simpler.
>
> Also remove the now obsolete BiosImage enum type.
>
> Cc: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

Pushed to drm-rust-next! Thank you.
