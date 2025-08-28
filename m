Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA045B39219
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 05:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C610B10E189;
	Thu, 28 Aug 2025 03:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LDd6hMhT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765F110E171;
 Thu, 28 Aug 2025 03:09:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCCHigbv4tPNWVWFVe/gt3m2ljZDsl2zeVDmUuvzI5aV2C+OXpnJYPZ5I5hI71RAl7yrHG3bBcIoOOwch1/JvCIHuZuQYNhZRODgiRst/uoosy5y/xk4E+K/yW9fqzFkOX92fJoXZOzNGZcOBR6x/s2rUF2hHkW7vNAWLfIQDjQqE/QEgoLC/HtulraySoPEDinlSBjZ8X5u/VSbSo8FFzVhk5x8rMQddgZPf2Yw7NyM5MAMg+319KdGxeUKmnmbUhG8VTWpT77vMMeh7LpIR1Y+PckbqWHzgqwxyCg0B9QVwac5sXxddokP9rlAfrQDDJCkiKZTfUQ1aubETR43Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIGiGK9zk7N3JZB3cSVCWBPo1qfB+KQXbhgDFM5o4bY=;
 b=NjHWB1xhgRSI80X2JtiBjNpXrZTUxazBlVCBxtcPkfurihXS4YJUUSiR54xlcXKVEzBdaKTs+YB60aR2Dx3Hm28CU5dMtOx106zNOzk5slvs/rw9vRSqy72jRHshdvS6CN/UBScQS2xSSqgUwwpWR3UapoIZ8XnpWC0WDp+PQxQE4qLsbupQGjZv7cxqxG2Qs5EwSCOsgyL2QY3XfKXIRN4mVx7ALJmrErQHc/lVbR7JgRSWSoFKJkVZHiJIpIH55aEVT6N0qYRmmrb+F7kbHN6ZxRaG30gBKQhV3o0k6ooHSvxek/ZjES+ffPKGYTs4a7CTqZoyxbWhYjCEHjNO2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIGiGK9zk7N3JZB3cSVCWBPo1qfB+KQXbhgDFM5o4bY=;
 b=LDd6hMhTdkG6tAKBBalS+sAkQZc5Gj0FDVG+k4uOcoaUYYA93/xIUVjbx/AqAkZS8QvqIT3r+u/PIGnzAzIOE7lVCibru/c4CdaEYHb8EWiJJgRoTna125XQ9cIZGvgB0FNLDtvFbSaVlzd0OnwsCv1Qpshrf0oSXn1ctLgptOj7wMwbLEM9XDKzv9KdoDVNB2mqTTibafEjftEnmm8CNbLV+PiCFv0SGbPw1bWFKtDCtMfeeM4btVIHCoztMRqfEqjo87J8/q94BKKmsXwcsjfjKoQUr3h232GRfzVq+h05P1HOoWE02KzOv8QzpxRXFJ2TXF0qJZZuk8P931mEpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by DM4PR12MB7718.namprd12.prod.outlook.com (2603:10b6:8:102::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Thu, 28 Aug
 2025 03:09:53 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 03:09:53 +0000
Message-ID: <8cb256a0-bf25-4d14-8847-9c5e8f02533a@nvidia.com>
Date: Wed, 27 Aug 2025 20:09:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] gpu: nova-core: firmware: process the GSP
 bootloader
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-4-93566252fe3a@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-4-93566252fe3a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0048.prod.exchangelabs.com (2603:10b6:a03:94::25)
 To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|DM4PR12MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 53675d96-4bb4-4bb7-4bae-08dde5e05c05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1R1MWluY3ZYS1NZN1pzYkVMd0FpNkR4U3dwS2VDNklFMEhFUzUvaXVNK25y?=
 =?utf-8?B?cEN2aVhndjFqL1VZajRRa3o4Mng0d3FPSCtySFc3ekp1c2F5aGxMQ1M1WXA4?=
 =?utf-8?B?S1VHV0dZRFBWMDZ1VTgvNkFkVFRzc1VPYWdYRE1sR1lVc3VKSTVJbXdpRlBN?=
 =?utf-8?B?VG9DT3E5Y01iZUdpaGJyaWRYOEFQNmZ4M3Z2cTBIRTlPMWhPb1FVaGlKaXZs?=
 =?utf-8?B?MDdlSElBcHFNelJCVnp1YkU4aTJ2NjVHMWU0cmw4V1paQTA1aFpqUlhNQjg2?=
 =?utf-8?B?bEpDNzhleUl1cXFhNTYwMFI5RHhsemJzd1d2a1ZmVUUzT0d4Sjl5TWRSWWNs?=
 =?utf-8?B?Sis0V3hSTGc4TGkya1hid0lJMnBUSDJOQ3UxSzExMlMxbmV4Wm1aKy90MlU5?=
 =?utf-8?B?SUFiQ0t0eW14eGxRS3RDMnpWUjljT25ldHhMR0ZZWFphd0NkR0o3VmFkUmlD?=
 =?utf-8?B?S0JzbXNZVy9ka1gzRnRaaWFXZkdPNHF1NzdVb0lYc0RGaHlZcGluRnJibThY?=
 =?utf-8?B?N1cyUlVFZFEyVUY2T0YySFNNUUxsMjQ3T3RuWnBZR01CMmpHZGF5dFFlQ3pr?=
 =?utf-8?B?cDA1RGt4ckNydU9ITU9ma1FXZzhPWUVOQXluOE5WcU1xN3dEaEd4SzJSVUtr?=
 =?utf-8?B?WDk4ZHduTWlqbGVzR1BvRkNDdkNQc1FadGNEeXlUZGV3SzFUUERkNnNHUWFD?=
 =?utf-8?B?Si9QSGVoM2NTRjgyTUlJcm9Falhkb1Fqb1FpWFJRdnBKdUpqNDZUWVdlUVR5?=
 =?utf-8?B?Vk9ZUC8xNk5lR1NQdFp1a3Zweks1ZG9iOEhpejI4dHp4bXZub2FzUEMwT1lq?=
 =?utf-8?B?amJHYm1KWGZDd21CeGJWamgwQjB6Q3JsaGdqamNnQnVha01ueUxoSHdiN0Nm?=
 =?utf-8?B?WDd5clIwM0dzNnZoYkVUTVpqaEVRejMrV0Q0L0RDZ3AxcUZSMmtFMFVtRUtk?=
 =?utf-8?B?WnRaQW0zOVJtWlFJamxGVEtpS2dOTVU0N0tJYVRDRWhNblE5UjFaakU5aDU2?=
 =?utf-8?B?RHMrU2luNjZiRzBmbnVTWXJoaVdyaUc5V3hjZjc2U1NQQmFYMTFlQnh3Y2Ru?=
 =?utf-8?B?emJnMytCS3dzZGo2NFNlcmh2Q0RhQWdtQjduLzA0VHk2SWdIVlhjUDB5b29W?=
 =?utf-8?B?RmlNcEpTY3ZMTkd5Wk5Ob3BVTEZkeHFLRE1JMVZ3b2J5eDlsK2hyeWJna28y?=
 =?utf-8?B?WkM4NUYycitvcGxpenEwOU4zSGRjaGZNc2paV2g2bGgvVEtQK1hZUVVieWU4?=
 =?utf-8?B?ZHZ2UEE4dnJmbnpteWYvamcxRThVbGlOcDVWYzRFWmZSSTJVeDNlTDlOb1VY?=
 =?utf-8?B?VnpUdjdpaDEyKzBTNUhoV1ZGYVVTaXNzUm15K2RXRnBlc0xCOG1hNlR5d1Q1?=
 =?utf-8?B?Y1V2cWZGS0ZTR2FJVm5EclA1bDJndUk0d2w5VXZRQlhteC9qQmdHcXJYK1VU?=
 =?utf-8?B?NUNYWjZTZlRpUktFMFBWc2VUaFJGQXRnNGdkRjJiNW9COTJuRzZvaERuMHIv?=
 =?utf-8?B?aWtRN0REaFk4eUlkVnZnUis3bkF5QmFlR21oR0NaSTRFc0NRYVcrUURtQ1pa?=
 =?utf-8?B?Z1oyd0xVRkZGeHViTWFJcllTS0wzdjNvZm5ONTg3a0hvSnBEb1p0TU9aQ09O?=
 =?utf-8?B?dXBFUzRwb0FLVzVydEFxd0lmMngvdVZ5eGNHWE9iSVdkaldWaTB6UnN1eWQ0?=
 =?utf-8?B?YkxoSGZuc3JOMkJucTJVVC9qeTdDZVdXaWptNGtqL2p0NzFaRGZvMHdtU3cw?=
 =?utf-8?B?RkhOa2dSQ3BZM0RUcmNVU0JuUHVFTU12VHRtVmFMOHlIZ2FETzBLV3ZTcWlL?=
 =?utf-8?B?R2xFSnNlZ1hySzF0cFcyOHNFbzhwQk9UZnY2MlNsVitQbHo2U2VuRHZ1bTdm?=
 =?utf-8?B?MXFjSHlRaG95N1VRYVBiVGlrVlVsbUd5UVhhSDlBdVlJZHRaM3ZKOUc3TEFT?=
 =?utf-8?B?TnVBWnovQWxkMjQycUZkUkovczh4TzdvR1RoNmoyYUZuSVV3Q25nUW5UZnVP?=
 =?utf-8?B?ZXR6NU5vNGVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm9KWlNvWlBxVEZ2SGpRSE1oS3MwdjhOUG9GaXhJZndFNm1SZzdxdVB4OHU4?=
 =?utf-8?B?TkZxY1JkME5CVmtiYjlIQmRlL0hjdFNSYnIxb1kzVFdTeWdhalRWcmxyVkJR?=
 =?utf-8?B?c0s4c3VLWHg0MnoxSWJLaDhub3FPeUE3eUtDVmRJYjJSWVNqTitLamUyeGY0?=
 =?utf-8?B?VW5QeWJGOVNSb016RFRlSGxKU01lMzEyVXBlWmRBWG8yYUxyZ3F6UUVXUitZ?=
 =?utf-8?B?ZGF5TzJsNGZrSHh6Z2J4eE9QWFMvVXNLQkNtQlBuT0RCWWhpSjNNeTg4Y2pp?=
 =?utf-8?B?NzFTK00zb1ZnSE9MdzYrZURnRWhYMXcxWXJuVGl2aWEzelhmRWVBT1h6c2pK?=
 =?utf-8?B?TjFJUmFkRnIvemNzRWdMOCtLRWtrWTR0azNYemZVZmhzQisycld5eE15QWhw?=
 =?utf-8?B?bzI2anMvdEx0L0h5SmpVaEl1OWtldk8vVkYzMlhHRGkvUFV4elhjcXRNc1NO?=
 =?utf-8?B?VFFuNDUzbW1aaXJLdnhCbks0MmYzWU9BUnJpWDRYWjdORFRhVDNKSERFNC9D?=
 =?utf-8?B?SnBkQkhHU3ErT01adWM4cDgzaUFDQUxRZFR5VTRNUTBHVWZ5Rmg5WGVzd1py?=
 =?utf-8?B?aDBFZWpvb1VNelRBaCtlaGhORm5JbVkrRjJ0YllVZUJsVHhrTEZOa3NUVXIy?=
 =?utf-8?B?aVZKWS83SUt0UXQ3eDFpZmlTQmQ1YmxVNEIxS3J5bjRFd1BCNjB1ZmU4ZnIy?=
 =?utf-8?B?aTBFL2E3UnJuc0paSUpQYktRNHF0bTIyb215MFlmYm16M2pvVFFWYyt0VWlT?=
 =?utf-8?B?VmcydWdxMDd3TUU0QTAzVUxBNWJ3UW5vT05pamhYbXRTQUpNbjBlRUhTV1dv?=
 =?utf-8?B?RkJmYm02N2FEYThmdVZ2WTFadFFOS1BHTlRKSjZDOFZib09VaUNXNDFJTGk0?=
 =?utf-8?B?MXVPc0dRS0t6RGxtdEdCL0lOd1RyNE9MOVNyVzBYVnNHbVR3R3NaUFRSeGFy?=
 =?utf-8?B?dFRFQ2VOamRLdEEybTRvamZvbmRQY0diWU50YjF0QXpaeDRtSWhKODRVQWpP?=
 =?utf-8?B?WVJsaXNjKzFuSWxYb1R6ODZiTnd6L3dLNHEzaGZ0YWpuQUhZVVgyRTBQU05s?=
 =?utf-8?B?dHlpdzQ3WG0yU2xqdEVJN2QwTVRzaTJ1b2gwcmNXWUFpMmRLbVZwRnhZc04x?=
 =?utf-8?B?TndGRXBqUHQrVmZHTnc1MEFidy80SUN1aTV4QkZxR09lTTJIa050Nm5vN3ZS?=
 =?utf-8?B?UENTeGpJWkcvakhvc0sxa0dHTE5NZUFIcEVZdzM3SjJWN3Q0bktVOFg1NWox?=
 =?utf-8?B?RkxKclF3SkVOMnVYY3VvRFMvM2lyRDV4Z0kzVW9jc3dJNmh5Y3pFbjFtYXov?=
 =?utf-8?B?aEJYTzcyZklhZEpqSmRtNmZTL2VQZ2d3RWFOWEZ3UUh2VTE0MFVvUDM4aTFu?=
 =?utf-8?B?UkQ0QU45YjRBeDk5UnJYMHE0Zlc0dThybkh5NGxBT3VSYitxb1NqdzRYbmtw?=
 =?utf-8?B?Z053VFRrVWpOdGp5RFNZMzlwUGUxTS93SmdNek1Sa3J4MTlyK1BlTmhsRnJZ?=
 =?utf-8?B?b0lNcnA1aXNmdXlZWWFDMUhqV0pUbmc1RDRYdEJnamRlV3ZGckhHV2ZrMXNE?=
 =?utf-8?B?U0ZRajZtVnJIaHc5bTF5ZHlleWVVQjJ6MCt4V2pRemhBVkFadys5T2lvbDJw?=
 =?utf-8?B?MGV3aUV5endyK0R5UXlrUGg5QUlQMUI5TjFUSGVTaUplNEtNcElxaG1xZVdh?=
 =?utf-8?B?WXZqUkxkek53QVRudXltNHUzRFRPMnBob0FtM2lMbWQwenZQVmNua09OVUZU?=
 =?utf-8?B?c1AxWWxNd3crUnlOSE1KWitPekpjM0JZdGZ1emVwVnFSdVRRZDNGdjJQd09j?=
 =?utf-8?B?SkpQa0FROURJRndKeStxNFhBVmJiTkdrM2VJUFZIcjZKM2FVS3MrZVFJZVcv?=
 =?utf-8?B?TWlpZTF0ZFlnYVV1VXRNVG1zZWNHZkhaU0diQTYra0xNeDFnNUZJbFFDcjJi?=
 =?utf-8?B?UnNqWVBGakFQN3Njak5qWU0vc29TeHEzOGVMWEdUWWc3NUFmRVpRcWFXK0ho?=
 =?utf-8?B?RjE0WWx6N3FmenlvM2NwTldwSUJ0LzBGNlE2a2VKcDBNczhHZjhiYzMxYmVF?=
 =?utf-8?B?a3hDR3hMSmY5eGpEcFJlRExadFdUKzJjOE04VFF0RUlDenl5R0xzZ3pHL3Z3?=
 =?utf-8?Q?nexigjWae+Yv7YxJ9/JvM9wYq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53675d96-4bb4-4bb7-4bae-08dde5e05c05
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 03:09:53.7703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKiiHC7s/XUJ8xPkekrjrc1dUsMUzlPADN2p3/gY/XzG6fs4SM/om+BWRDP9UErlgbrHOnFrmL5eKDgtgM3dNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7718
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

On 8/25/25 9:07 PM, Alexandre Courbot wrote:
> The GSP bootloader is a small RISC-V firmware that is loaded by Booter
> onto the GSP core and is in charge of loading, validating, and starting
> the actual GSP firmware.
> 
> It is a regular binary firmware file containing a specific header.
> Create a type holding the DMA-mapped firmware as well as useful
> information extracted from the header, and hook it into our firmware
> structure for later use.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs       |  7 ++-
>  drivers/gpu/nova-core/firmware/riscv.rs | 89 +++++++++++++++++++++++++++++++++
>  2 files changed, 94 insertions(+), 2 deletions(-)
> 

I've once again failed to find any problems with the code itself, and
have instead listed one or two trivial documentation suggestions, 
below. :)

Reviewed-by: John Hubbard <jhubbard@nvidia.com>


> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
> index be190af1e11aec26c18c85324a185d135a16eabe..9bee0e0a0ab99d10be7e56d366970fdf4c813fc4 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -12,6 +12,7 @@
>  use kernel::prelude::*;
>  use kernel::str::CString;
>  use kernel::transmute::FromBytes;
> +use riscv::RiscvFirmware;
>  
>  use crate::dma::DmaObject;
>  use crate::driver::Bar0;
> @@ -22,6 +23,7 @@
>  
>  pub(crate) mod booter;
>  pub(crate) mod fwsec;
> +pub(crate) mod riscv;
>  
>  pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
>  
> @@ -32,7 +34,8 @@ pub(crate) struct Firmware {
>      booter_loader: BooterFirmware,
>      /// Runs on the sec2 falcon engine to stop and unload a running GSP firmware.
>      booter_unloader: BooterFirmware,
> -    bootloader: firmware::Firmware,
> +    /// GSP bootloader, verifies the GSP firmware before loading and running it.
> +    gsp_bootloader: RiscvFirmware,
>      gsp: firmware::Firmware,
>  }
>  
> @@ -58,7 +61,7 @@ pub(crate) fn new(
>                  .and_then(|fw| BooterFirmware::new(dev, &fw, sec2, bar))?,
>              booter_unloader: request("booter_unload")
>                  .and_then(|fw| BooterFirmware::new(dev, &fw, sec2, bar))?,
> -            bootloader: request("bootloader")?,
> +            gsp_bootloader: request("bootloader").and_then(|fw| RiscvFirmware::new(dev, &fw))?,
>              gsp: request("gsp")?,
>          })
>      }
> diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..926883230f2fe4e3327713e28b7fae31ebee60bb
> --- /dev/null
> +++ b/drivers/gpu/nova-core/firmware/riscv.rs
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Support for firmware binaries designed to run on a RISC-V cores. Such firmwares have a

typo: s/cores/core/

Also, as long as we're here: "Such firmwares" is understandable, but
"Such firmware files" is better.

> +//! dedicated header.
> +
> +use kernel::device;
> +use kernel::firmware::Firmware;
> +use kernel::prelude::*;
> +use kernel::transmute::FromBytes;
> +
> +use crate::dma::DmaObject;
> +use crate::firmware::BinFirmware;
> +
> +/// Descriptor for microcode running on a RISC-V core.
> +#[repr(C)]
> +#[derive(Debug)]
> +struct RmRiscvUCodeDesc {
> +    version: u32,
> +    bootloader_offset: u32,
> +    bootloader_size: u32,
> +    bootloader_param_offset: u32,
> +    bootloader_param_size: u32,
> +    riscv_elf_offset: u32,
> +    riscv_elf_size: u32,
> +    app_version: u32,
> +    manifest_offset: u32,
> +    manifest_size: u32,
> +    monitor_data_offset: u32,
> +    monitor_data_size: u32,
> +    monitor_code_offset: u32,
> +    monitor_code_size: u32,
> +}
> +
> +// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
> +unsafe impl FromBytes for RmRiscvUCodeDesc {}
> +
> +impl RmRiscvUCodeDesc {
> +    /// Interprets the header of `bin_fw` as a [`RmRiscvUCodeDesc`] and returns it.
> +    ///
> +    /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
> +    fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
> +        let offset = bin_fw.hdr.header_offset as usize;
> +
> +        bin_fw
> +            .fw
> +            .get(offset..offset + size_of::<Self>())
> +            .and_then(Self::from_bytes_copy)
> +            .ok_or(EINVAL)
> +    }
> +}
> +
> +/// A parsed firmware for a RISC-V core, ready to be loaded and run.
> +#[expect(unused)]
> +pub(crate) struct RiscvFirmware {
> +    /// Offset at which the code starts in the firmware image.
> +    code_offset: u32,
> +    /// Offset at which the data starts in the firmware image.
> +    data_offset: u32,
> +    /// Offset at which the manifest starts in the firmware image.
> +    manifest_offset: u32,
> +    /// Application version.
> +    app_version: u32,
> +    /// Device-mapped firmware image.
> +    ucode: DmaObject,
> +}
> +
> +impl RiscvFirmware {
> +    // Parses the RISC-V firmware image contained in `fw`.

Should this be a "///" comment?

> +    pub(crate) fn new(dev: &device::Device<device::Bound>, fw: &Firmware) -> Result<Self> {
> +        let bin_fw = BinFirmware::new(fw)?;
> +
> +        let riscv_desc = RmRiscvUCodeDesc::new(&bin_fw)?;
> +
> +        let ucode = {
> +            let start = bin_fw.hdr.data_offset as usize;
> +            let len = bin_fw.hdr.data_size as usize;
> +
> +            DmaObject::from_data(dev, fw.data().get(start..start + len).ok_or(EINVAL)?)?
> +        };
> +
> +        Ok(Self {
> +            ucode,
> +            code_offset: riscv_desc.monitor_code_offset,
> +            data_offset: riscv_desc.monitor_data_offset,
> +            manifest_offset: riscv_desc.manifest_offset,
> +            app_version: riscv_desc.app_version,
> +        })
> +    }
> +}
> 

thanks,
-- 
John Hubbard

