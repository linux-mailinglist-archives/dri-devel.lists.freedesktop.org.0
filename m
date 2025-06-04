Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A42ACD505
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 03:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F5B10E17A;
	Wed,  4 Jun 2025 01:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CoOOVCfO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2043.outbound.protection.outlook.com [40.107.95.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99C110E064;
 Wed,  4 Jun 2025 01:37:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTfhgiX7m3As0CN9yXwfStFELZ+KqsTER173DPKzO8GYkw4GBZi/+HdWzs2PWNKleb/KJ6BPcmmzMhAT+YMTm8z72Z7Dl81fWzjrTaRn0pqSPEgv378bPihhGBGbKuqo71sw9I1c+biE6bY2QLpb4V8pmYNCP2eCQaB4VDU5hdkoU42GpDF8Z9J1CQZPMS57Wg5iKP0ADNGo4zNXqEr24zEzDjBSwjJ2MNOLMoVNoqbYdwhI2PFblF9NDw2nAWgMrUfy0mKjQVkD6QRfbBan2SnQKho8Moncxu5I99s2kl5BfHM4MTapTSGc7FJGSauLAznodAmuni7iyqkrOxP0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEZNeiatN03LaMuMgXRzI1n/P5yzS1m766XO1h7yYjM=;
 b=CqqeoRejJZPkYxNG4jYGjTOH4OX2TKNSdZTx6GyYLXdcowaMxDwH4/EU/TRJ/xXyEuHPgdiqnELtlYOJ7B5pcnep6hd3HzKUNxz+XrzI39JQG/cUhEjxo3tgKw6bhrmc+/lV+TiiU92FWnQgswDZAzcPIX9Mz2TXsHKoYrbXO6z/O4wBFOTImVOietNW/yE2mL0SRTw6azhOxyRMS9Vi044Il/o1ssKWIOwuXctfXgiwbwRO+OEOamjbQBq2bUKGNUcIZLs1e5qcNuMua/rHDeowt4QKgxRawn0ANkWr379OzTeLpNnN4lJ78kfRTZgTqfGUBhCvOflLGmgiVeA+BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEZNeiatN03LaMuMgXRzI1n/P5yzS1m766XO1h7yYjM=;
 b=CoOOVCfON6bVfqBMPiGtnK50NOrl34LoGCqgRqx3uoy2c+neLU2mqCdOEzP0dFi6hxmcbGt44mFLgqiVWQDp0uG8B17KQcfcSMKIVCd4izhtJq0WpvECR9NqDPEaUoJfkzonlokK9taswnyeTSHmy1+7X2AviZkYgZ/+E/C9kRdKnHAN9OYqfxlyTM37TE91zdhIbakank+lHo8HICCJEaQbWGmlq021aG9HxSbGbiKYZWw4jXAXb4cGR5tLLTai+leRCPex0gkUVKFjlTzfiVg0hO9sMWazlgRqhk1jumfMUAhF6gc0KNqO5btRmhY73eSOQfg07z2ewN0hbApbOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9101.namprd12.prod.outlook.com (2603:10b6:510:2f9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 01:37:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 01:37:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 10:37:45 +0900
Message-Id: <DADD4T7HM4G7.3Q0CFL6W8J64U@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "mripard@kernel.org"
 <mripard@kernel.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "benno.lossin@proton.me"
 <benno.lossin@proton.me>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "gary@garyguo.net"
 <gary@garyguo.net>
Cc: "Alistair Popple" <apopple@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Ben Skeggs" <bskeggs@nvidia.com>
Subject: Re: [PATCH v4 20/20] gpu: nova-core: load and run FWSEC-FRTS
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-20-05dfd4f39479@nvidia.com>
 <31707e2b49015e52f5b1fe185ea6791538c4034f.camel@nvidia.com>
In-Reply-To: <31707e2b49015e52f5b1fe185ea6791538c4034f.camel@nvidia.com>
X-ClientProxiedBy: TY2PR06CA0032.apcprd06.prod.outlook.com
 (2603:1096:404:2e::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9101:EE_
X-MS-Office365-Filtering-Correlation-Id: 970bca04-2370-4220-c2e4-08dda30869ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHRHZk5pVk5RMkNyTTRkT0NnYVhTUTZmTlRZbmkxdG9qdExXUk5EV3padXkx?=
 =?utf-8?B?NlpXVTJuU1VtcGMzaGtMNmpGNDliTUdzWTU1YW5Nb1ArcUZqaGFBM1hDNEJz?=
 =?utf-8?B?MFZ0YkRHbUYrN1JvN2NyS0ZBNkN2THBZTVRwY2xSSW4yNmt2UnJoaEE5SUFM?=
 =?utf-8?B?QkRYNlUrKzJNWStJaDYvbGhXUWlzSVMrZ0JvNTh3VzdhRGZieFhoNlhGTEVB?=
 =?utf-8?B?SFp4U3lHR2FmQ0o5OWdMTWhwYzB2VU5Sb2JIQk93Rmx0cXpYOGNTeEVJdTVJ?=
 =?utf-8?B?S00yb2NIK2lzWUtxM3Zuem1zdWxMM3h3VjZ2QVJFRVdmcm9LTG1KSVhZenNT?=
 =?utf-8?B?TURzMVNWWTVNRTNOakkybjgvaU9iTkpiUVRPbWpDcmplVXc2M1BnTXo1bU5G?=
 =?utf-8?B?TUF4eWIydWRkaGtUNVhpbVd2Z1lTTVppQ2daU3ZCa1FSbEprSzJKc21nRWJt?=
 =?utf-8?B?Z2N0VVJrZloyeHlHb0E0UTNRNnpVSW82RllMQmtXMWttUm5vNFJSQ1lhUjBU?=
 =?utf-8?B?ZGpGYjAxOWR6eTA3S3JYUXpzVWYybUN3azI2SGhkTVlnZXVCdkdaWStncmdT?=
 =?utf-8?B?bDI3dHZxRUZvdUo3Z0c3TjNFQWJWK2lXaGlMYUJYRXVLTnh0ZXN2ZjliblZQ?=
 =?utf-8?B?STltenl4Zm1tK1Vsc3FaZlBGbVFBTXF0YzJGQ2p5UzU0MTV5VmVRUEdLSjJa?=
 =?utf-8?B?d2xkaXNqSFNPb1hqYlJOUjM3MUpSUmRwMGJrcUpmRkQ3WUJuNUlWNldYd2lP?=
 =?utf-8?B?ZFVlSlVzNTIyK2s5aWNpS3ZISVdEYkVhNG1Nam02eTJMQjB2UjdEN2k3ZSsz?=
 =?utf-8?B?c2pnY1d6Q1VqK3ZVc3VEakUxbWY0a3JDVVc4UlFPV2wyNzlGMlFDUmxFTVlW?=
 =?utf-8?B?cFhwOU8rem5oMkVkYmxtRWZxWlFmNGZ3N1pwVzRFVm5TRTcrUEEvMk1uSjc1?=
 =?utf-8?B?ZEhmL3JHVWpYYVlGbUtnZ2R0SXhNMFBUUXJndEY0Rko1YmtTTDIwcFBPaEh3?=
 =?utf-8?B?VnVUZ1hybGovemViZzVJeEhVKzFVdUVLejkrTWZZdXRiOTVFM2ZhVXMwUWQ0?=
 =?utf-8?B?Y1dxcDBYVU8rZ3NjdHJnTEZxb3o1cGs5QnM2aXVORmFwK2dFU2xMOE5lT1Z0?=
 =?utf-8?B?UmFNNElxQ0RYclFiNXFwcEJDU1FNVkE1ZkdpOUFMSElVcWFJR1luM2doeUJp?=
 =?utf-8?B?S0FzVXdKUEtQU0d3SmxmS0dwcGNpVzk3ZG5WZEh2Q2UyYUJzNWJJUkJUWnVl?=
 =?utf-8?B?TGMwVDdIemlrY3pLMTNRQ2xra0xaYisycmE3UkJuaVFRWEQyVHZNVlR0R3dU?=
 =?utf-8?B?VjVOa2FYUnlxSFBtd1VwbTNPckRsem0rL0pENDM2bnROMGtSSWJJZm5WMncv?=
 =?utf-8?B?TkFHNkxqNHNqVWwyTFRDbzFJNXJGazFHa1gwUXVWVEZkM2tIRDB4MnhzcXNM?=
 =?utf-8?B?ZUhQTlFqS2NaQklOckVUbjNpWk4wek85aWE2aCtQM29iUzM1c28ydVlhc1lE?=
 =?utf-8?B?YWU1djRnMk12MFo3bGlXRFg0YWxadXpFL0VrM1NVWkZINWVqVTVDVVFOMUtV?=
 =?utf-8?B?SzVhczVPY3krSE9vOEZrQmd3b04wZmtiVWszVVRaNk5IcExjd3FqZlNMVm4z?=
 =?utf-8?B?d0xSQTUvVlhEc24yWE5tRHBPK0M4OVE5U3gva1dFSlFYS2dkVUxUNkpXT2ha?=
 =?utf-8?B?dktzeWUwTWhtYUlZWndVQk9mTDg4a0RKR0VPeVNFeDlNNCtNb2ZoTENLQURh?=
 =?utf-8?B?bWhMSytxWm1uSTh5RXEyMWFZVWcrL0QzTjhSQWtxOHZRS2hWYjAzZU9jT0U2?=
 =?utf-8?B?ZGZlQUs3bmNvdHBjb2ljZWlTd3RPc2R4cVAyS0RFVjFGU1lNVEsxUW9qblpk?=
 =?utf-8?B?ei9mVmhRQTQ4LzhHK0VQYWVacEtrMzVHNWZRdGd6QUhDMmtUaWRRTFk3R2s1?=
 =?utf-8?B?elN4MjZjT3duTUppK05vRWs2MThxZnBmZ1FFM0pmaCtscjRNeUduRVNLdHdN?=
 =?utf-8?B?L1hOVXpuL1NRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjVNV0xrVlBSTE1zQ2pKNWFhcTIzS1Z6NkpFdXdhNGpocXEwZFIvdmQrUWdU?=
 =?utf-8?B?ZjBBYW5WSmxLc05YOEdUZStlcGhNTkpNV3k3cUxHWHNHNTNGYTZ5ZGRHZThp?=
 =?utf-8?B?ZGN5V25aKzROMzBhQU5DUU1PVU5MaU1EcTZES2VWWElRaEV0KzZFWWIwdXV0?=
 =?utf-8?B?WVFXN1oxYnI5bHZRbUVrb0hqNzBsaTlmUnBTTWk3bnF4VnJWVWhyL2tidVlV?=
 =?utf-8?B?K1VhWUJxQ2xmaHJOVzdjTzNTWGViWFZzVzVoRjlNb2s4OXNJeHp0K3krUTV1?=
 =?utf-8?B?NjkzeFJXaHZ0eXk1bXlBNUErUksrTFpxUWI1bHFOUE9ZR3ZLSjdXSTBvNU1z?=
 =?utf-8?B?SWV1NEFXQytUbE1aN0pSMlR3SnFQaWI2QzFnMzZqaGlIM0hhZGxLZFE0a3Ar?=
 =?utf-8?B?UjZJZVRmNGhrVytDOTlodUZIZENEM2pDeUw5c0dhdG9yUDY2VVdDbWU3N2Zt?=
 =?utf-8?B?ZEZ5VGs1KzA2WGljYmVZVlRRdGV0VW1sWUVObkk5TzJJWE1lN2c2a2U2YUF3?=
 =?utf-8?B?QXYrMEY3V3dMZzIwRXgyRXJVMEgxTXlqMjNDRWtkS25ZdnVFUGtRdk10ZzZo?=
 =?utf-8?B?dFYrNlJhRWVBY3BnQ1d1TFM3bHJCZmo0MVBRUWxGaGVlZFBVWFdmT09tcDY1?=
 =?utf-8?B?ZklQQldMZmRRVDYySFhiMndjTkM2ODVSNlNVTFFuTVZvdU5nNHpIOURCWjky?=
 =?utf-8?B?cDlYbmtNb0dMYitsaVowdmIvK2RRMW1Sc1NOUUFiRkUxYVJCakdwM3pHNG5w?=
 =?utf-8?B?NEVVQmkwbURoL3dVR2J3T3ZZS0Z0OVFwbHhFWHdtajBLWWkzNk9sWlZqem9L?=
 =?utf-8?B?MVdkYnJGMko4TG9uRHlUZHNWQUI1eFc3RnZpd3B2czVzSlBQenFZeW1GWWFv?=
 =?utf-8?B?aHFWcXJ4WS9STWZMTEU5K1daeENiZTdQRFNuQmZ3QmhsOGwydXIvYzNGQUpN?=
 =?utf-8?B?THV6QmVCaTlRMzU3YnpzV1BGZGxwUENPL0ZWbGg4YnVOdHE4bnlsc3pxNWpG?=
 =?utf-8?B?SWViLzJnOGhPMENtVzkvMVVnZ1ZSTjJKLzYvR01HaTdpVjBaR0hCNW9Nelgr?=
 =?utf-8?B?NlQ2dURJeGFOMXVHVW11MS9tWCtvWVV3T3V1L3U2MXR0VGpULzZ5dXhqSXJR?=
 =?utf-8?B?akJhZHZNeUxpWXZ5UFZBempqdXF1VHlJNXFZbEo2RnlWMHFENGVJc3BVNStT?=
 =?utf-8?B?eldyMXV3TzlEZ3JaRUJxWmFidnFBS2F6a3N6RjNmL0haUFV0N0xXbXQ2TXZF?=
 =?utf-8?B?RElNekplcUZKK0VjL3BlR2VGalU5K0R2T3FGQytjWDRQTlJhVzdZYWlWUW9L?=
 =?utf-8?B?NHFhYjdBRG5lV0Z3VkFDWGdVdWZ1ZGpJUERHL2ZUb3ZkTXRRT2FVcnYxc0xV?=
 =?utf-8?B?L0ltWjBjckpGV1RNQTNoQlJsN2ZCOFBDVzFJZ0RDbG83WVQySWdtU0NXNkRH?=
 =?utf-8?B?cUIwQTZXcS80ZUwxM0NXcXBhdG1aM3k1SWxaUVRXbXZTaE9nZHVMVmhJTXp1?=
 =?utf-8?B?MDkwUFBMT0ZSb2lzODJyYzhTd05sZHZBdk9TaHBUYitoVlRVMkZrU0t6UlEy?=
 =?utf-8?B?OGc3YnhXcGlBOUNuSWpjRkQ0SU05VG9kSnJ2ejFDaDZ6Tk8vVXd1d0dQY2lC?=
 =?utf-8?B?cThiamRxZFc5ZDF5Y09SaXZ2TzFNcWlwR1J2Z3JITHRLSlhwc2F2VjlUYkFF?=
 =?utf-8?B?VkZlSzJOVlVTZmhjL2FWNEhjZ0YzQldBV1c0OWRGSWR1clFnVUlRZDhmaWZ2?=
 =?utf-8?B?SzViTHVKMG16Y2dBdnA4d2JMS2k0MEdzMnVKRTBwSVZvVEpZM3Z0bWJLWFdC?=
 =?utf-8?B?eGNvSGp0RjJlb2xSdmFsWlpzZkRiMlVBNHZLRmQ1MmlRNEtUaUpLNVVwUjRa?=
 =?utf-8?B?d3B3QUZCM09kTzZSQTMzZVJsK2x0UnhvRk5ITEdEMVRjRWRYRmNaYUJSTG9O?=
 =?utf-8?B?dnN1TXNpd0srTkJkU3RLVTlCajR6ajRGWUFPMkdKOGVwWVkvRjFXVFlHcXFw?=
 =?utf-8?B?Z3QvWDVpajRxQUNkQXhzL3RNQ0xvVE9WZVlPV1MxZ2xiQzBHT0NISzJBUjVT?=
 =?utf-8?B?a0c1cmJtai9EclJGdWxzaGx6Wm0rbmhmZWJUUndQdHZzeGYxNVRhQ0J0WjM4?=
 =?utf-8?B?WUpEN3RZN0xrcVYwU1MyZWVqZzRUdVVRcEkzcFViMllBZWdQY3pVbmY2Yi8x?=
 =?utf-8?Q?D5vDFIqVLgtATlsXY4LQruD4bKzklD46zocEyggQWXwm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970bca04-2370-4220-c2e4-08dda30869ae
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 01:37:48.8923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mabpujq4NPwPvIFtrhmg0zcGyUp7v78fFUw9cWl0N4wM9Zv2Jv1Vh5AvWZ6SwcyenkD9jLV8rutUqQ68TxxrMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9101
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

On Fri May 30, 2025 at 6:30 AM JST, Timur Tabi wrote:
> On Wed, 2025-05-21 at 15:45 +0900, Alexandre Courbot wrote:
>
> I noticed something interesting in this change to Gpu::new().
>
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Check that the WPR2 regio=
n does not already exists - if it does, the GPU needs to be
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // reset.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if regs::NV_PFB_PRI_MMU_WPR2=
_ADDR_HI::read(bar).hi_val() !=3D 0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_=
err!(
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 pdev.as_ref(),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "WPR2 region already exists - GPU needs to be reset t=
o proceed\n"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 );
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn Err(EBUSY);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>
> You have a lot of checks in this code that display an error message and t=
hen return an Err().
>
> But then ...
>
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Reset falcon, load FWSEC-=
FRTS, and run it.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gsp_falcon.reset(bar)?;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gsp_falcon.dma_load(bar, &fw=
sec_frts)?;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let (mbox0, _) =3D gsp_falco=
n.boot(bar, Some(0), None)?;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if mbox0 !=3D 0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_=
err!(pdev.as_ref(), "FWSEC firmware returned error {}\n", mbox0);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn Err(EINVAL);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>
> There are several lines where you just terminate them with "?".  This mea=
ns that no error message is
> displays.=20
>
> I think all of these ? should be replaced with something like:
>
> 	gsp_falcon.reset(bar).inspect_err(|e| {
>             dev_err!(pdev.as_ref(), "Failed to reset GSP falcon: {:?}\n",=
 e);
>         })?;
>
> This feels like something that would benefit from a macro, but I can't im=
agine what that would look
> like.

This is because we are checking the cause of the error (unexpected value
after firmware runs) in this file, so it is the correct place to display
an error message. If the falcon reset fails, the error happens within
the `reset()` method which can display an error message if needed, so I
thought it was adequate to just propagate the error here.

Now doing so would not tell us *which* falcon failed, and this sequence
is so important that it is a good idea to understand where is fails
precicely, so I've added a few `inspect_err` as you suggested for
clarity.

Ideally we would have something like the user-space `thiserror` crate to
manage errors nicely and have custom error types like Lyude suggested.
