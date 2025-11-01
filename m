Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B946C276F9
	for <lists+dri-devel@lfdr.de>; Sat, 01 Nov 2025 04:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8CB10EC44;
	Sat,  1 Nov 2025 03:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EtfoPlTR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010070.outbound.protection.outlook.com [52.101.85.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294B110EC23;
 Sat,  1 Nov 2025 03:53:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFiRm0UEPciisayVsPP688GihtDiM82aYgPRXlbbdJtwha6nn5vvGEEQ5lQ4q+BBBn9sDQjL7sOjymr3AabX8onf2dJDdZRGO4pz+xWoKfE7lU+rmxWUCLSEQ9nyhz53cMIYU7QvmLh6XTyTI8dqoRssbKgISveBsJ0k0ObBxWg0UMUxgZ5XpGjot/nG9HF2A+90cjlGi11D/WG6PhVqWip4Cd07doiZEl87DQlC3NxpK0U7tuNmEo9b2pzXWqgoZvYm2lvqF920Ndb6XAzdeTWD2uh8rAiAEi1uaYNEcAzkkzNZZiNI/ZsNc39rg+G7RjhHhD9Ab2yrGxoVrPXziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVPPbtSRqkSIkrzoBqzr3jOctjx926LnR8NT+yoLKaE=;
 b=A3aas6Rx8AlqRVPdo6o1d/fhCcRa2CuXNOQT3tpDDUJFDvD2EOBqevkCa0oIJRUHwVTMn5qPXSw5oaNiED7KRjzviezc0qblr2UeV/eqLZBQqT1gHYFSiORY6te92+b2t9xcJlAu92mj+NHxFmIeK1yweR59LeKHV7hd92wBHXNdDJRSZxiTeThUOwgQGote8zHWIGpbwyCpdXVEqckgxjdgvdEc08qrC0bFTzuM/RXnxopTfm42jX1SeleCBC61TY858SSnRxTWKuU+8xt/schbSuBbZtUm3mszcL2VYJOLv20vEmAzZ1ljazBK4KQG0Bx08GUEZHV3kREFY8mQ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVPPbtSRqkSIkrzoBqzr3jOctjx926LnR8NT+yoLKaE=;
 b=EtfoPlTR2wbHQnYY3cP50vLOF5o/isbxjJkLuPbzVsorx4VLOlIhn0JzSIEsthevPgKmCfs2kA+4irA1AhhSPikMKfG5xeoDLYI0EMpQcaSPoNMZuKPVXmVRlK0lQC9RINgksOH3h/1qSrJ7WcizXDl27l6cWMrgnXvVa25oVotamNnaMIN8n5xUlwRI++WvDXzJdKS21MY5r7NP6K07f9jMe0lP2srvaRSI+T7RznwfQ4l2YkMev7l9Bxly7xcg6j7slSstpd9XSJtyHlFUTsxGqfOTgG2A+jFhBqicui/OHH6fv4vPM5EAvbLoNP30RB8rP2PPBqoT4AEhb/PnlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB7483.namprd12.prod.outlook.com (2603:10b6:303:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sat, 1 Nov
 2025 03:52:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.013; Sat, 1 Nov 2025
 03:52:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 01 Nov 2025 12:52:54 +0900
Message-Id: <DDX1Y0EUNNPR.1KQ7OF9H4T81E@nvidia.com>
Subject: Re: [PATCH RFC 2/4] samples: rust: Add sample demonstrating C
 linked list iteration
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, "David Airlie" <airlied@gmail.com>,
 <acourbot@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-3-joelagnelf@nvidia.com>
 <DDVYVKDW8WG2.2STCJ4ZU00MZF@kernel.org>
In-Reply-To: <DDVYVKDW8WG2.2STCJ4ZU00MZF@kernel.org>
X-ClientProxiedBy: OS7PR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:604:24f::17) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea91413-32ea-4c58-ad8a-08de18fa2584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2VJaEtCQVZmZ21INEdhQlV2aExSRndsZ1Z1aWdZWDdkRFYzd0F5UWFSUUM2?=
 =?utf-8?B?ZTVSVktLZVNuemRlemlhREUyRk8xUzhpSGU5UkxhR3BRR1VQRmFOaFVobEF2?=
 =?utf-8?B?RUQyQTBlZkh2WkkwdHJZN0h0U2hWY1BHeTJTOXVNNngwUzdmU0VKNW0wV3JQ?=
 =?utf-8?B?TUdhcXp2YnNRa3c4TzBhbXRyb2dkVG1lWmtrK0t0K0pwMUlFZHZ4YnVJV0la?=
 =?utf-8?B?b3ZiM3Z3b0VzaUhxNGlvVGwrWVRWQUJsa3A5T2ErME9DMC9rMUVKaXUrY1Fk?=
 =?utf-8?B?UnRHS1NuQzZOd0tTZWdkdlkzbjZES0NXRmdsYkxZdWdjbzM5Rmh2dGUwQkNH?=
 =?utf-8?B?TlBYS040cnNNL2FDT2gxZGZjalo5NVpuRjY3cHV6WVFUNnh0T3R0UzRaT2po?=
 =?utf-8?B?cmpIREs1RXpPWERocXRaRXpvdVpVOXg4M25qa3ZXNDkyd3NnVEsxVnpjSHpQ?=
 =?utf-8?B?eXRxMkZoZG03d05YU21Vc0x3MWpNQjkzbWpwcGZ1VUZ4bXdkQ2Q2NXBGMko4?=
 =?utf-8?B?WWMwYW96alZmRklDM05SdXFVMjUrTWpLazJxVU1RbXRhZFVueFBtcXBZTkU2?=
 =?utf-8?B?ZFZPZHJwWmdqdXRGbk03Ylh0aEFTM3YrSG9XcWNKS1hhWUltc2d2RzVUbDNx?=
 =?utf-8?B?dWNVeFA2djJ6eERiMnllaFRpRUVxajB0eEVkL1NydnlCYTh0Ri9Id1FIZ2JN?=
 =?utf-8?B?eUFmYkpVQ1p0R3B6b09PcWplbkIvZGsrU1BPOWc2OU9JS1R1MmFMV25WWGov?=
 =?utf-8?B?WkRQcElCM2dnaUhGU1UzSTd6ZGFrSWZRUGtvSEhkMmQ1R3o4bzlSQ051b0JP?=
 =?utf-8?B?d01KMnBVZjUyZVpwWkIxM0xwVU5JZVowVEpmR0JMd2Zhc08xWU5uLzZETnNC?=
 =?utf-8?B?SWVLbmxkVXBFMlRkNVpzSVpDQmdZdC8wV2dyd0J0c2ZJaEhjblBVckJsYW51?=
 =?utf-8?B?QVNMeDlMNUtldTZ0OW9vdW0vQUs0TFM1Q1A1ZkRvT0VZZDhBNVJ3aUJSbEkr?=
 =?utf-8?B?cVlhMnRmNThvSjIrRlJyaDZRcmVGMWJ3UWtWbjNHTFhVc2JnWkNwanhMcjQr?=
 =?utf-8?B?dlA5RWw2aWNLQ3dvZXRxcnNuNWI3UVBybzFKblFJejN4ZElJcmUybDV2eXdU?=
 =?utf-8?B?UFFQcHR5dE4rVzYvWGg0LzNhVy9oMUF2dUlnNWQ1WXptNTNlK1ozRWk4cGFK?=
 =?utf-8?B?YzhSdWVKZklaWkd5S3ZHVStrd2xNNVM3NmZtZ3ZPdFdnT093RG93cWo3d2NU?=
 =?utf-8?B?Z3YrNlFackVzbW5iVXVOVG5HMUdvSFFuM2dPRDhIS3ZneW0xY25KYlAveUlL?=
 =?utf-8?B?dUd5ZVZKMEhkdFcrU1FUcGhyTlRwa0wwN09YY3RvdWpRaDdrU3o4L0RBcnpX?=
 =?utf-8?B?Vm5wVFRHMjM3eHh0T3VhMjFYNDk1ejFqVUZWZjYvWC90bTFXblRtTWhGZXln?=
 =?utf-8?B?MlJOQ0RJYXhhOHNWd25mZlBNTjhaZHFRZjJtc3JrdXpnblRDR3IzcnZxVjdS?=
 =?utf-8?B?MlBLL2NZQzIxVk5XeGhlYUh5L2dJQ1VjeDN1am5YU3JxUlFGQ3AzRlN3eFdw?=
 =?utf-8?B?bXo0U3FRbjcvNzI5MlhoNXBrSmlTWGFzTmJ0NDFaQkY2cFpWdkxlVFBUMFhK?=
 =?utf-8?B?RGt1cDYwUDVxWmNLOHEzNzRZOVdGNjQyaFFraExlc1dQVTY1L09ZTkx0cThJ?=
 =?utf-8?B?ZUhpT25UeGViQ28rRzJRaHM3U0twVzFGWVlpNnNwcWdxUDJGTlM1cEZpN3Qx?=
 =?utf-8?B?Um8wdlVGRjZpVXgwRkEzTkRIeVlpOHNzUUZEUjNWWVhnbW1yYzZpNTRiVThN?=
 =?utf-8?B?U0N3QVordTRKclFFOGk0YTBXUVlVTmpwR1RjWXNxaUVUQ1llS21pS0RNZk1G?=
 =?utf-8?B?clF1WWpJZXlaeHhoUDVlQ2svWjZXRHZBeVV4bUs0NjdEckRjQjFMQ0tKeVRY?=
 =?utf-8?Q?cTAzNA//v3/Ft62zMq0FcxgeqZ2h69Ir?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckI4OVE4VlpZeHYvemhndkdjTzFMNzgyNmZiUVpvUWdGNGlWSGlPaXBiS0JZ?=
 =?utf-8?B?eFU2RmlPWVVuU3VQYXB2ZElTc0Z4UFBrWnEyNUljeFhBelhXNmNZK3p5OW9J?=
 =?utf-8?B?UmNFR0I5UCtoQVNEWFVDbXVkR2V5TGtDVmdCVlBZV214R0VtOTdaQmpsdk9j?=
 =?utf-8?B?OXlaZzFCdU5pRnp0MGdDVktQRkJGTlBIL2tSemc0ODVzWjhRclNiSjFTcVBN?=
 =?utf-8?B?N0UrL3BjSDlBVjJ4dFp3YkszYisyNFJRRmtMUWFJYnhPVEpsc01NbFUyYUdR?=
 =?utf-8?B?S1ZTQThXMUdxdmVYSm54QVM4Mm9pUGNjRS9GVXlzVFVSRnc5eG5LWWJjdE9G?=
 =?utf-8?B?N3Axdm1nNEYxRGZaT082b2s0cllyNjY1d29yMXFPeVhxL1VYWSsrNmJzY3Yw?=
 =?utf-8?B?UkJTVTdqSHQzSVV4WGN3YUUzcEFQcVlLQzM4d0pFTlk4RkNodnExVTh6bUZs?=
 =?utf-8?B?VXFQeTZBR3FvODMzOHhCV0xnVWdlRmxKSk5pV3c2Z0c0MUNueEkzRE5ZbmpJ?=
 =?utf-8?B?MVREQ3MvZzZ6MFVlUHdvYWdUVHBrOVAxbmttK0F4N0J1a3VKbE01MVR2aklO?=
 =?utf-8?B?Q0VhazZoaEVINmwrcnVPeG5IcTUzbmYvTk93SHE2NnpRbjNHTnRvK3hZajRG?=
 =?utf-8?B?d1Q4L0xFUTJicnE2OTVocTJzWXA3UDVZZForV0FGK1FhdWM0NXcwZzErQWVj?=
 =?utf-8?B?QzFZUTRURTIvTXFsOHNkUFpsWGdXbklXZVZoSHVVVk9JaER5SFd4TUNJbTlh?=
 =?utf-8?B?aWtNQi9ncS9ZTWZQZUdrZUJkREhRYjlNYWJOM2hMMUdLNGRBdm8vWkQxS0ZI?=
 =?utf-8?B?UnVicUdkR3lvNnBySDd1YkZvNU9VNmdPNWtORHdRaUJySElCTDdHUlZQT1ky?=
 =?utf-8?B?UlYzNVN5NkFzQ1NQZWZ3dE9KQ08ra2Q5UjduSHlhNjRhakhEQVRNM244SmxG?=
 =?utf-8?B?U3pSbHAxV1R1MitLV1YrN2Q1T2lWcm52dWVGK1NEL3QyejVWWGZXVS9mSnRN?=
 =?utf-8?B?QVA3RTRaaGhGSVUweVgxWFdsc2RIaWpGblUvdkR0Z2g4QjFJUDFuL1hMcUMv?=
 =?utf-8?B?dDJwYUlQSjR5TDluNkxHdUxHRTRhWFVvOXNaK1lpaUNDVWNDdzJlVG8xZHE4?=
 =?utf-8?B?ODRNTkhVRWZTMkdCWWRrZm1NMXVKQTV0OWN5UGFNVmUxakc0SE5iRDNDR3BL?=
 =?utf-8?B?eFQyaE1qa2V4bVZtRTk2ek1Yb1dtbFN4Nk94SnRKVHY0TzJGTjdkSkFFdW02?=
 =?utf-8?B?N1lrZ0NqUkIrb2NIcGxwSXUyK2hPVlM0eHExMkRzclVheno1NmhuNEgzU3Z6?=
 =?utf-8?B?S3d0N043VFZNK2x1OEQ2aTJMV3lEb1pQcFZ5Q1BqTUVMNXptZE5ZUXhnR2cw?=
 =?utf-8?B?N0hGT2pxdVM0STF3Ukh2aWd1Qi90MXNjQUxSdC9nMWtZVHQycSs2RFZ3TmVP?=
 =?utf-8?B?a3prS05rampDR1lSQllWN2M4R1BkcjloVXNNcTlBL044a2JhU29iTkttTmZu?=
 =?utf-8?B?dG1qRUlaYkdzbUNkSVc3eHJYU29Ndlp5ZlRrZ3o3NFhLZ3hXSVkwTFp2UUJz?=
 =?utf-8?B?cE9zRGtjVGh4ODZsNmM0SWJWbmhzeEFHSEhYb2gzeXgrMDRwRCtHazVmTzJD?=
 =?utf-8?B?Zlo1RVZrdnBQeUowNktJUzdqUFl0WlNmbmE2K2wwVGg5WFB6amxoNGxRS3lM?=
 =?utf-8?B?OGdzM1hNeGw5UHJoWHROam85ZHR1QWM3eG9POUliTk40Ly9ia0Iyaks4elN6?=
 =?utf-8?B?R2s5eHQzU1RFY0kwRU1FWmljWGp4NVIrQ1J5YmllN0RSMGEyaFZOT3hJdXR3?=
 =?utf-8?B?eEQ2MHZUYkQxaTY5TzA4SGtrbUMxZFB2K0ZGR2hqYUp6NFFLOXJiK1pJS1Bs?=
 =?utf-8?B?QkpDc0gzUFZpb2ZVUU1tMzA3ZmRpV2UvQVR6Ukx3RlVybkFISnVZOEhzQi9P?=
 =?utf-8?B?Zk5jRE1HUjBvTTU2Uys2VFJVelBHQlYzeDluS2czTmhzNy9wRHFPVklPWDgw?=
 =?utf-8?B?Vlk4R0RPNHFpZHorMHJIZVdMWGZUZjR0TmFZMWpIU0N4SENzcGJneUViWDJP?=
 =?utf-8?B?TkZRNFFVQ3QzSTdBMFowMDBSOE5tTGVNVE84cFh2d1NPWWJmVldVS2NBS0lK?=
 =?utf-8?B?bHNUOU1vdzVKYzgxdEJseVN6NHBHb0xYcUdMMzFPeDdSMFRxZzd1d2JGdS9l?=
 =?utf-8?Q?rAamvgteiB3/NP4AcwzTBpnJxkTenO4pCkgqZaILVdrN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea91413-32ea-4c58-ad8a-08de18fa2584
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 03:52:59.1193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k78TXy5AowheUQCMppZVREFZEfbIlSdEcgZIguU285k5zXsCbLWrsRsSKBLCJBu8NbvKXlh4CSP+I95Wo+7a8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7483
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

On Fri Oct 31, 2025 at 6:15 AM JST, Danilo Krummrich wrote:
> On Thu Oct 30, 2025 at 8:06 PM CET, Joel Fernandes wrote:
>> Demonstrates usage of the clist module for iterating over
>> C-managed linked lists. C code creates and populates the list,
>> Rust code performs safe iteration using the clist abstraction.
>
> I don't think a sample module is the correct choice for this. It makes it=
 look a
> bit like this is an API intended for drivers. I think kunit tests might b=
e a
> better fit.

Yup, we can probably move this into the doctest examples and have them
serve as examples as well.
