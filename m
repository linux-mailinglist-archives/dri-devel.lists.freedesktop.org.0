Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60D7AB7DF8
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 08:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F54A10E767;
	Thu, 15 May 2025 06:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iJRpjgzz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5503D10E761;
 Thu, 15 May 2025 06:26:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6aCurl/alVcHrEuuRKn8RQBfKR+zSuAxttQqbYID6b4o7D8rv0fGZKnWsNkdjCe1iM+U5upDhbnmHCjKu+610zvXlw3izDSSdwSf9buM3RRqAaDcUAiUaBvH6XdNEK5u6WjMQAo61OYgnNCRzgee9TR4HbYyWLFXbSMb3TDsikit++IqNCNjY8tUb7PYuGi5w7FhAX0IJ/BsF5zFnVNvX2/UVTBxo+3rLWK11O6RZDV7OvBYQIIQcbqHMlyppx9F8gBkzVq1p71QKOhV2SRWlWvBUmdouCK6SkJwofJx/22Cu7moE9UmJIOlkarvENf+ZqX1LYg1NoPEM2ze6r+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P542YcblM5xCUmtExOF8DjwR1/Mkbaz+5zuM0Ddpqts=;
 b=P75jop1Ys9B1x8lJoeSvbV3BWtk+ZScZaptDXx+M1m3LEJehFwa6WBLG0om1h9vo228ZAhlYbx+U/Sv1Mhwkiy6Uixc4+NFXmNpxZIwKEfpsULQMsM6WI5EtJCID3wB+jGDg+KgCTb80BwBGChIQOBm5llFoniQs6u7dffL4y0BkvuLqGMdpqJ6pUcbGS03mgnqgVnfgLW+i/HxWztX2zQyypIduBQBIfnrvLVEiDAWBpTZtGlPmWqdh1dhziEVlZlgdgClcFZrCfZYbglcykHcu9AdTjYttXFYshlv0A9Pi8Z5dycbQEpQTa7GBNzHs9bgmsMltRBFQkR+fbE93/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P542YcblM5xCUmtExOF8DjwR1/Mkbaz+5zuM0Ddpqts=;
 b=iJRpjgzzFDasns3Z0dtnTYpPew21Lj2lWozMJE125C39m38+1uZG2g6e/Sm/Zq2UsKUoRyi8I0ErOXvKmAZCIp4eVCIYUkS6AqOPYTQEWVuFZ5R79/1cfFVsFlBghNSkBzWkjd0cB7gD1eBa+hRXdj+f33PHykQORZ1C4tJpy2b+iwmJP257cfGuFhfW1YA7cblpSK7fE6Wnymirb66txmedcFzalRYSX6gIoVJZw8PtBcPM32XAigizwa6T7mAZzZOgyhG26XdX6OYdGWHZlO23v2+VKIzgR0qZqgQyWHXK76V+b19kaNzvBxnL7tMb+0x6gUlCmzaYgR2Sm9rojw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8709.namprd12.prod.outlook.com (2603:10b6:610:17c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 06:26:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 06:26:24 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 15 May 2025 15:26:14 +0900
Subject: [PATCH 2/3] gpu: nova-core: select AUXILIARY_BUS instead of
 depending on it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-aux_bus-v1-2-1781b54424e4@nvidia.com>
References: <20250515-aux_bus-v1-0-1781b54424e4@nvidia.com>
In-Reply-To: <20250515-aux_bus-v1-0-1781b54424e4@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0041.jpnprd01.prod.outlook.com
 (2603:1096:404:28::29) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 096e3fc8-826a-400e-5bd1-08dd93796abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2dvRWlHbjBBWjBtT3hLVVdqM3NZN0dvUXF2NGZuZHdnWCs4OVExd2QrSGNv?=
 =?utf-8?B?L3J1ZkxwemxxM3ZDUUVXc3dFckdINTZURko1MVI4MzczMG1FRkhET21MUnhz?=
 =?utf-8?B?MDBkdHFieU1JSVRWRHM5b1RjYzNiZGpob3daUmNWOXB2cFo3bDZuZ3dBL1o2?=
 =?utf-8?B?UzlNNld5amFwcmxGdU14OThmZ1ZqVERtendMbzczZ3A1TnRTck1HVE9DM1FB?=
 =?utf-8?B?TXkrNjFiRXJ6Vk9mOWQyZTQ2N0tBWDBvbUxJMldxNlJ0cnBMUWZjanV2ZFkr?=
 =?utf-8?B?azM3OHBuNzNzaWY1SlorQ0Z6Ni94YXZORmJEODVHU3F4eVBUSzI3VnlOS1JE?=
 =?utf-8?B?ZHMyNUZoSkxBcitSZVcrS3lzRG15MFowdERVK0NyV0pIT1FPQlp1U3FrTXlR?=
 =?utf-8?B?Nk5XR3BLN2FLYW4zSDRiUHhzU0t3a3Zib2ZJb0xvNDRCWWJBYlJRN0ZSMTVh?=
 =?utf-8?B?NDFZaSthWEZxNEVWSjhZc0hkcFhKT0hoSmc5V2I4VnQvWmRsZUtQaStLeE04?=
 =?utf-8?B?bWpQMjZpemlLOHBPN2xUYlg1dlpBZU16M3NiY2JvUXhWc0VJZ2wvWFZWMEVS?=
 =?utf-8?B?YVlubmRTSDlBMjlnQi8rNUhWR09peG5vTS93ZmNzbTZQSTRrS0wzaUJQUDF2?=
 =?utf-8?B?WTNmL3RlS1JoSXdTekkzMFdEcWovS2lOL0YvNHJMa2pXaHBrdTZDaWlORXZs?=
 =?utf-8?B?dW85bnA4R3NiUGxOZFlJOXNvc0IxRktzdTYwYlpJOGFIemNYUmdROFhXZDZw?=
 =?utf-8?B?OUpHazFaSTV2UHJqRThVRUtsMkJJUFBvMzlwSjZreW9XUzhsSDgvOGlxa3ZQ?=
 =?utf-8?B?SXc4ZXVqbmZUOE1TWkpHSC84cWlNcy96SHhYVWJENUFwa2VrTWxOekRzb3JG?=
 =?utf-8?B?Mzd4YUxnbUVLRFVvTUZxUG1WL2U5ZEszc1FmMGw2bythSFYvLysrdmlWZ0xV?=
 =?utf-8?B?T1orMXJ0RXpkQWM0ZE5abDAyZUhHUHRjRzNYb0FnYTcrQUVsUjRmZzNKSUVN?=
 =?utf-8?B?bithWmQ2NnUvMVZ2WWhrdGlEU2lDOVhXcHBUbU1VZUdmcEZ6N2hPYnp4RkE1?=
 =?utf-8?B?ZjBXU0VBZFFTc0JqZ2FIcTJlMlZxRjdFaVp1eWQ1WHRRZXlCbHNaZEowZkp0?=
 =?utf-8?B?WlluVi9FdnlzQ25UdEp6Q3N3ZWg3bEpaNmk4WWpaY1I2WmQzbjUyVHR6aGtL?=
 =?utf-8?B?SmRnN2o4UFlzZmJPazc5M2VXRHJaSk1jVXJxYmI3RXlEOXFrV0JSZXlWZEM2?=
 =?utf-8?B?Snc0SklxdUI3bzQ5WWZZNURsY3UwcFBqK2hwYlYxN0UzQ25uamx4UTNQdWlj?=
 =?utf-8?B?RFFNa3NGdnlzeVJoaG1tdVB4Rk1TMXNxRkF5VnBDVitHdGhDY04wZWNxKzEw?=
 =?utf-8?B?a3RLVjRNMk9iUEdTSFhLb0dxNUhyZ2xvY3BsYndIVlFHUUZZNXhHZW85aXBS?=
 =?utf-8?B?T1VmYktFSHdZbk0rMDYwc1RPc3BZaCtsUnBQYlVZN3N6S2x4UEEvaGdkNjFn?=
 =?utf-8?B?aHJGakQ0VGRKY1FhYnRONzh1bWw5K0tONVI0NnNqNG5yUVU0b00ydTNlbTJW?=
 =?utf-8?B?TUs5OXJwVTVPTlUyL2xaeWVFdUNtNnVaWjhFd1RGYTZ0a1BlT1FOR3pQUTdV?=
 =?utf-8?B?a2xQaTQreXE1bFE1YmRoSCs1QUVFaml5Wk9IaExnOEdoWDR2VEFncHNETE9r?=
 =?utf-8?B?cmwrZW1ONGh0d1hiNnpKZEZ6cWpYUzBXOUU2MWxWazYyS3g5a0tYR0lNZzQr?=
 =?utf-8?B?eVNDZlhMUjEwZlRJYWNDZHN2MHhDZlZnUThhdWxOVFl1OEl1WDBLSTc4cGNR?=
 =?utf-8?B?K21FRWxORlRkbWU1b0RxelFiYkpKeHBFbE5aaUFUVEpHM1FYRHNkNGRCZW1x?=
 =?utf-8?B?RjFXVHgrM1RBUjVraGx0QUhCSThkTzliZlRHN1orRXk5NWJ5d25IaXJ2dFdQ?=
 =?utf-8?B?SnhhbFJoUFBRSm8xZ2JxbHhkcWlweWQzb0NYbUQxV2poT3hUN3ZRUE1INElE?=
 =?utf-8?B?VS9FRVFlU1BnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzVxQzZrNEx3ZlN5SndoQkhPRENUOW5qKzVTb0lrVTlKTFo4eUZzOUo1SWlU?=
 =?utf-8?B?dVMyWFQwTExQSDRjT2dIeU1ETVd6Z1pqWGovRnJqbFh3b25LbnVCQWpta2Vo?=
 =?utf-8?B?czV2Q3F3SThSMU5YZnkxSlE2YUsvejhtTDU1VEpaNzQxKzZXc0h4NmxaR2hi?=
 =?utf-8?B?YlFRUnJGN1E3RVVIQWVFZTZRL04xb0FrQS9ZektGZ2RYM1ZFVFNuenlIdjd2?=
 =?utf-8?B?T1RraEJzTytNang4ZndvSFZZcmRYVXVJc0JtekFqbzZEOVRhVVFFRElmTzdr?=
 =?utf-8?B?dkNWRllUeHJMTlpnaFh0dnp4OEtRSWd2UU9OcmFFdjV6U3NBdkEzSHhST2JH?=
 =?utf-8?B?Ym1zVTF6VkJGeEcxNmVwQ0hMU0tRYWZRdnA2RE83Y2k1UU5rbTNlZ0xmZUkv?=
 =?utf-8?B?N2srNDRzT1VsOHVBNExIV2dpYmhKRFpTZFBsc25UWjB0c0h4Wno3YlpabHFY?=
 =?utf-8?B?UVpSaVVneFZBK0VVaURqVG83SUN1Szg4a2c0RzFCTkZwRUs1WDBDSDhYYU1v?=
 =?utf-8?B?aFIwMThhMWZiOCtPMUxGdmVFSkJCOWVYNzBJZ2pGNXA2OHE2alA2blAzNkZX?=
 =?utf-8?B?a1paeGo4Z2ZxOVA2MDRSeExSVXRCdGEwcWI3US8xT1g1My9jZzc0NFRSQmVv?=
 =?utf-8?B?Q0JKSjZCdFBWcWhSNUc5Ym5IU3FidzhmQ0lwb2F0Nkp1NUc3WFdRTk5qdHFi?=
 =?utf-8?B?bDcrWnliTzFyTEVpdlVRNFVZc0xUZ3AyZjE5TkJ0RUJwb0dsYVVKK1lMSitT?=
 =?utf-8?B?ZTQ0cFlhd2laYUVZMm4xS2VuVVIwZE5VRWFLRHJ0aW4wZXBSMWhvSCsxN3Vy?=
 =?utf-8?B?bFpUaWF4UlkvSWZzWkNTcW9Kdlc4L3VINnFwaFl6Wkh3UHlWMGJTMi95MmU0?=
 =?utf-8?B?K1B4dzYxRHRJUlQzMkZZZHkrbEMveXdOUUFhd1h1VHg4N2ptT2kwcU8rMnkw?=
 =?utf-8?B?RU5iS1BqM01Vckx2Z25PRytyYjQwditGOTNVellONFpGMEFEcnFzbUFxZ2tX?=
 =?utf-8?B?TWVocHE5Q0R4ZGdEMGo3R2xFSGxoRTdOSHpqSlZnaTc0cHZ2Skt4NGlLc2RX?=
 =?utf-8?B?Skk5TTlJby9TMXZ1Ykl5bXRuTysyRUFhMnRIRzhNcWxCeGZBMWJFTDVxNGc3?=
 =?utf-8?B?dEozT1JrNHJXK2R2SWtPZUpOZnd0S2JtQkdNYVVEcnE0cXM2RHRFZkJZNWNy?=
 =?utf-8?B?OHlrYVNMRnVKL1dTcWJoWE1BZW9lZ1NsQkZDRXdhcXgrU2o0djVUeG4xeVh1?=
 =?utf-8?B?Q3E1V1c0eGFrdHNWS0MySkQyMHVtKzBQVDB3c29aNjlCZ3dkZlk0M1N0bUs2?=
 =?utf-8?B?c1U3bUxKL0s2MmE2MFNQOFhldm9RSFhRZnp5Zis5dVFaa1hZTHJiRWFya0Zo?=
 =?utf-8?B?ZSt5WG1qcUNMdTlITXJsQWRBUk9EZzlNTEhaWkNIcFIwTXNCRnlCQWdjWmda?=
 =?utf-8?B?TW1CQ0s3YXF2RjFpZkU4Z2NZSXUxblhCd1JabzRyN01vTUdwNG9vd2dRY2ZJ?=
 =?utf-8?B?ZzdwcWlYMXdSSEdaSnVpUXBJVjZjVUpYZEVZL2lCRXhaOXhuakNWSXpRTFB4?=
 =?utf-8?B?b0ZocXZpMisvM0Qvcmx2WFRDS3dMdkdqQXhrOVAzWjVyd1d1N2IxamNXUUFT?=
 =?utf-8?B?eGVwVFdBaEdrOWFtai9LS1BVTDJFT3VsaFlVK3k1TFJBZ3hZMjhQU0lmdWRh?=
 =?utf-8?B?ZDU4bGhhdVJyUVFJRHloU1NkNkFVZ3RLb3ZUSDR4TDI3UG5QSmt4Tm9RZjlP?=
 =?utf-8?B?dW12N0tKT1h1Wm1lclFkRjJoYmQxenNYa3crd2wvQ1E5N3lvTmtrQ0dzVnFO?=
 =?utf-8?B?VStSWEVNQXZWMHI2N3c4d0orVFFOMTRJTWZFa0pCN1dkdXRwcXJhM0EvUUd3?=
 =?utf-8?B?Ym45djVlYnZVUWJ1b0pSdWdIeDY2NHZ3K0FSa1J1UUR5SS9uVjZPSFJYS2tI?=
 =?utf-8?B?T3IvY3NNamxWM09KcElzY3pVd2lwR0Y3TUJiN005OWRVaWhTdWQ2cDVpTGV2?=
 =?utf-8?B?NUYya3Z1VUpYK1pSNlFFZE1SVHNqQnkrckpjTXNpMS9kdllvaTExeUl4YWxh?=
 =?utf-8?B?cngwMGIzdGVva0kvQ0hFdnlPZEtnMmQ2eUpnZUppZEhyaHBFODZtdS85SWV4?=
 =?utf-8?B?NW80alQzYndFbXdaazdLOUVoMEc5UEdPck1hYVdadUM3ZmZ6cjJ2ZGhER1A0?=
 =?utf-8?Q?eHMx1BGy7ORFugTbcpshiOehHbs5zjGgnJ5P5Rmg97FE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 096e3fc8-826a-400e-5bd1-08dd93796abb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 06:26:24.8618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: coBDbxX5WOQ+sI+5TXAW2eych2yCRYbLpOk0WNvwnt5BPbttVLW0gstXvcV9YW3s2/Em8Oby6Rb/U0GrMzTrAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8709
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

CONFIG_AUXILIARY_BUS cannot be enabled explicitly, and unless we select
it we have no way to include it (and thus to enable NOVA_CORE) unless
another driver happens to do it for us.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 67f99b6a023a5706bc809de18f9142938d1d0cd8..8726d80d6ba4013d84d0e6194ccaa9b41a6e4af1 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -1,9 +1,9 @@
 config NOVA_CORE
 	tristate "Nova Core GPU driver"
-	depends on AUXILIARY_BUS
 	depends on PCI
 	depends on RUST
 	depends on RUST_FW_LOADER_ABSTRACTIONS
+	select AUXILIARY_BUS
 	default n
 	help
 	  Choose this if you want to build the Nova Core driver for Nvidia

-- 
2.49.0

