Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AF8C46ED6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAFE10E3AC;
	Mon, 10 Nov 2025 13:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RCbgBeTp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012015.outbound.protection.outlook.com
 [40.107.200.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AED10E3AC;
 Mon, 10 Nov 2025 13:35:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCnE1thGe0EwZBKqo9oaEPS2d9z8syVABrESY+GkYQp88pO4bXkiEYfcvBWep5pOkEtjJToWIF9izmpXbY6Ii2k23gSP9nNBHpv+Iw1sMIveVYpUczXXldxIc0Z+ybeigCUaA+SyOjuBlcTrV4jv9ARQ3Tc25c/bJ/oWtbwx4TNXAOY0Sn3IEBj491avQlJFAbBDfSXeLLCaB2w7I3axCQ3298cBY7Dt3Dmw3yCftKZCzjf3QeBGdd6lrgagIepXsGccOyNuH7NrED2ye84YjMGIE1M3xH+vzZylqSFn2neNZ39tJVa1r9rAJydzA7fKS5Z2fX0CjLhJGWkZwSsK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJwU1EdqfSdWxA+eKP+3eUVJRKIglNafRZq8nqh7JvQ=;
 b=bL3QlZ6p4Nw7rTp8XNIOc8pDzSV16swVssZqwfsZqLkd/DfdYWSS67zFHcBMCKPjjIJnRYehiEXqJTWtnT16uW+ak8haZaQkoCFPNtQC9Am4JnZU7hJszkaoAWEMMyyw39gXCEa+XNDJTXuW7oDn52IhzI5eyMD6Ly6E1uzl8rWwEorgvpEfYLIpWixNsSqQAN9BFSJSy+VT6WfpGk9ZPGzz71rUMCsHivPqgPs/lVk7vcBLnc+Zl6kEQg98ZhEGXbnAIaBQPApWZEgyNTy3iwI7mBh4cWqwmEz3Vwf7dQuERnSt55WwBOnrbZ8GZdWJPyIBnXAkUouAwl8yohEKrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJwU1EdqfSdWxA+eKP+3eUVJRKIglNafRZq8nqh7JvQ=;
 b=RCbgBeTpLwH/4OnwcIhXW7IKzcg9OlPJIwmW5x+aX0JhQZchvGRsbocoPegDVixS6raXsJdU74j+7nRtM5gfjXIyO3IckGkigWOg+fIfKHYxrfFckHrLhTcvZqIByqlNtKHp0h+3MxRKL3/B88Feeg8+OYUrvdLV/yvcfapntT3RTVOtmWm75fN/qVKFEwfG5YZbiiou0gRPRLXJXb/LOKb2zGgXrkbgvQcAWb5Yv83Pw6HXIeXW26MLR4usfNzJkdbrbjtdLiGNsjWsQ0eFyn/jZeAgdGo/La2IOFKKOe9zUjlI0zJSX7CbOMlcT+vRLE9BlcM7aGUuVp1gcqrmSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4055.namprd12.prod.outlook.com (2603:10b6:610:78::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:35:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:35:01 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 10 Nov 2025 22:34:19 +0900
Subject: [PATCH v9 11/15] gpu: nova-core: gsp: Add SetSystemInfo command
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-gsp_boot-v9-11-8ae4058e3c0e@nvidia.com>
References: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
In-Reply-To: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0246.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4055:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d5f6d8-9d33-4af8-f525-08de205df2ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qm1nRVFML2VPQm5pZFlleDkxbGZNOVdkTG5QNmluWHVDWXU1NEpQbllOOFNP?=
 =?utf-8?B?cmZZUXd1SGttNVZ0UXBNNVJSc0dZZmhlejZ6TmVSdkRSMERiQ1A2ZXVsMUVS?=
 =?utf-8?B?NS92T0l3MEhsQUdwKzU2enk1UXZqRzJiQjcyVnVGME9EVkVweVdpNjBlNC9i?=
 =?utf-8?B?ckhpRE8vcEw4ODBVV1RmTGM5QXVCYlNDWWhGZTA1a1plZlRNc2dFcFJYMHpz?=
 =?utf-8?B?OHRJblBVcTZKQTF2T2lZOVVVc1RReFU5cGgzRndSVmV5Zi8rdVlLR3ZpU2s0?=
 =?utf-8?B?TEVJVFdYYWxkamF6QWx6cTNsT3A1K2hRSVZxaU9jeFVQWk9Sc1hMbS9Vd0dF?=
 =?utf-8?B?S0NSZEJ5b0UzdUI2SjZtS2JvWGdENjJnZ0lUZFJnRU1Rc1YxV1lpVzNnL3Ev?=
 =?utf-8?B?akZVaHVyVUp1c1MrMjl1a0k4dUNTakYxcGdvYU5LUHZjY3NaSjB2eVNrT3JT?=
 =?utf-8?B?c2RpZmlQVUJvNDJtZ0xwSFhCTEwrMm9KYVM1dGluTjI4T1YybC9lbjR3c3VT?=
 =?utf-8?B?S0lvUENQSXRSTVRIVEJxRTg4NGlnS1IxTmhRUk1hSWo2bXRLOTZham5ncjZL?=
 =?utf-8?B?a2xEa0kzNExJVDRyRElJVmp2TC9JL2ZOdXFYaWRhMjdwbXNzNWR0Wnp3eklq?=
 =?utf-8?B?UkZMMUpEMjVLN3E5M0RJN0M4MXFkdVduWGp4ejhHQ2FZVG9iK2JvUTNjcWR5?=
 =?utf-8?B?bmV1MlduNmozSkJ3YnRWWlM1TkZWL1FCcVN2TWlxQWsrc1NKRExKeGJnSENC?=
 =?utf-8?B?TmxHcnBwNit5d0V4R0tRWVhPdjNnSmhIbksvWTBhcjE5SHRheE1OMHBNM3kx?=
 =?utf-8?B?ZkZzUUN0M1RnU09aTTR2RkFmL1RPSGV6M00wcFFmc0lsSm5MbXBaTjZ5ZjZz?=
 =?utf-8?B?YmUwY21pRnlndzFZWVh6dC9wT05Ka1RUV0JnQVJ5K08rUEl6NDhycHRDdFYv?=
 =?utf-8?B?VUF6NVVSS21QN2tLWVF4MUVmMW41SDB4RkRSNnRDTG9oZ2lPbzVJRHVPbUxS?=
 =?utf-8?B?UThURnVSNi9OMDNZQ3BLU2lxcmNNQ0h0R0pDRnRyWHpaOWkwRmJUSzR3SmlJ?=
 =?utf-8?B?dkY4Vm5kZFN3c0x6VFZQeWM4YkR6Y0l2bzJxN1BrWVNsWWQyaWVKTmR3a2pG?=
 =?utf-8?B?RTRiaVdJL0J5MmJYNFloSUVBYkNkaVNTYndkNEpQeWhpa256MDA2OFJTbjZI?=
 =?utf-8?B?bkh3VlpZTEs4TmJzY0NLblIzMU5udFR6bytiQTd0SE56N09weUVCdjJPWk1q?=
 =?utf-8?B?WFh4SUtEazlwN2NOb2F0TzBLaGVzTnpGS3c2STV3bEdQa09jcDB0alVPdVEx?=
 =?utf-8?B?MURDNm1QWDlmZW5WM043RmZWSUZxaUhTb09nejNwRDRQN3g4c1VBdjdDYUpM?=
 =?utf-8?B?T0VqUHliQWZoL2xpMmNaNkJid0p0K1YyeTFMZG5tWWVmZ3EybXg5U1F3NXJi?=
 =?utf-8?B?MWRPUXN1OGRRUmhFVHRub2VuQ2hWMXZXQlh4Wm10cUZtL1BhVFQzdURiem4z?=
 =?utf-8?B?bmVjWFJ4VkhHOFlpNzhuZHVGMmhPYk5STkdlSlRnNGJMdE9FLzU1eUlPN0Jy?=
 =?utf-8?B?Y2ZEMS82Y215Y0RiTndrSC9LQklkVThCelFaVHNnVGZyUHhEekgxNDNZWmp3?=
 =?utf-8?B?eTVsbFZOOWUzM1h0dTkyWkNWN2U1WDVHR3NJZ29tdFc5TDFCVmlmZkYvc0NV?=
 =?utf-8?B?WDMvMUU5S2ZDWW1HcGN3am5DQU15NVBhT3hGYWN0WGxucGpZeE1YbExWdUdm?=
 =?utf-8?B?SzZMMHpzbHVWcS8xVEF0VkNrV1ptM3dBRkdtNk84NkFrZlFkbEdSR0UxclJH?=
 =?utf-8?B?OUNLdWU1MkZkNllyUHk1ZTEzS0x2a3VRaTdDMDlZVGhQbTFmajBLamdGSjEy?=
 =?utf-8?B?SldZT1hPeldteGFlYmxYYmNOTlBsUUQ0R2xtSWVHM0xaM0RVVk8raTN6Q2pl?=
 =?utf-8?B?Nm95TTFSM09YU3dRSE1RbnFLaWNJaXJSSG9BTEVSeC95VHUvNHIwcEljdUFq?=
 =?utf-8?Q?OvCz6j9GI+FaE/2NBofwPF8bb31Bbs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmJZdGFhZjhVeFFWZmRsRVU2UzZLa1dDUVM1SldSRmUxQmY0bWkveEtONFo5?=
 =?utf-8?B?aW5HNFZUb1RMYjRCVEdoZGRXei9LUC9BUXRoQURNVE90MW1qT01HUDE0SDhE?=
 =?utf-8?B?WkZkZzM3RGJTQSs2TkFUN0I1cldwOGVNYktGVWpUS3FoTktENnRFYTJMSklC?=
 =?utf-8?B?Q3NNTXROTXdZU0J1TTdhemsyL1Fnbzl4NTdXSEVTZUtVbG9kK1psdUtHNzlL?=
 =?utf-8?B?c2pPbWttTmgzZzYyd0FxYlJqVTcxb3ZvT2RNNmNIb1ZWa2lGalRFV0dRNllB?=
 =?utf-8?B?NHlJWjVWbUwwMkQ1MFErU0J0T2FTR2ZYRGl1bUZOc0xoNFhWbyswOW1TRzhZ?=
 =?utf-8?B?T2pCWjBaQjZkdXlxdHBqV2ZvZUo4ZUhhcnl4Z2VSTTVTejhMYytUYUdXNlN2?=
 =?utf-8?B?Q0RJQm9naDZ2bERUOE1EWS9ENGJUbFJpaGswazlGZkdDVlFjY3ZYcGtIbjRF?=
 =?utf-8?B?aW45UDhVWGIvOFdJSGtPdnF1Ym14RCtnWUV0b3lFcS9QRjdRWFQ4RzRwWGMx?=
 =?utf-8?B?SFpRa2dGdXBlNUZPM3hSQXF2RzFTYzJhalZseVhwZWh1WVFyU0N2R1lyUUlS?=
 =?utf-8?B?eWxGZ0Z6UXNXOUhHT2lXeCtONCtQL3drdkxGbWlCNHFvdnJpL01BeU1MejNV?=
 =?utf-8?B?a29kWFVaNDZrSzAxOUQ1QUMxekN6dVIrSnZjRE5INXkyU1d0bzRDL09saEtS?=
 =?utf-8?B?c0tYTHNIeVJVL1NVb2R2M3VZOXVOTUZzSTZzOHpieVc4R0k5bWkrS2M2TjVJ?=
 =?utf-8?B?dlAwVWRHc3ZMcHNzSmU0WGo2TTNOWE5FVG5nRlFQajhxSjhDWnFUYjBrMFJB?=
 =?utf-8?B?NkhEWFZ4U0poUlhEWVNVdWJRV0Y4SXJEQkZmcEZWek11bFZzNTlQbVhNblRT?=
 =?utf-8?B?QUdWc2s4VDRMYXAzL0R3aWU4NXBpMjd1NS9jR084SlBTSE9veFdrVWN5OC9B?=
 =?utf-8?B?dTlPRUZhWUZyL2FPWkVuQzFHcVNHYllhQmlGMDlnUFFaNGh4M0JyMzZyK1ZB?=
 =?utf-8?B?cjQ0dkNpaFVSTm96V2tDVndpOGlweCtQbmNXV0M5VU9xdDU5WGE5bHdnaVp1?=
 =?utf-8?B?M2RsSEwxZ24vRzJ0NlRBMnU3dEtPY3RPZWxma2d3ODh5U0VIOVVlR2U4Z3M5?=
 =?utf-8?B?TCtKY1BrYmpadFc0bWxFeXBQU2ZuSGpTYTFKY1l3d2pPNURxdTRXRFpDS01U?=
 =?utf-8?B?NE5ReE9lb3RLRDdPWERGN0NnRU1DR3FLb1ZCNUtyWmUyamRndmV0cE1Tc2Fm?=
 =?utf-8?B?Nkk4NU1NVFJsNXJQQVZNb3ZCaVBkVFZITHhmQTVsYk5HRm1pQzFpM0tOU21Z?=
 =?utf-8?B?MHRHb25EQmxXSU1rR3RuQWRSR1BRQldKTFdCNXVNcnBXUElUVlIzOTNSY1BW?=
 =?utf-8?B?V3A1akhNeE5MNHZTSUM5RkNhaGR4OHd3OGJRSXJTQVJPTTg1bG5QeE9Id0Jk?=
 =?utf-8?B?V0xDeFkzSjNlVktSTGtFRjBCaFBQRXZwaE4yQjR2RHNQYXRaREV6SGdlL1pE?=
 =?utf-8?B?TTEvbzBpbnZaNDd0eXdrc0J4NkRHWWg0dG1XTEp3RlI0QlNmb2xmM21wREly?=
 =?utf-8?B?eTJxYTVLaFRQUHo5K2llcGt0QWtNQXdsMyt6R3NjMy9rM0hKd1ZqaXc2a2Fi?=
 =?utf-8?B?a0ptdTc4Z2NoQlFvUkJTUDFHelptREg3Slh4WGMxRTRLSXBHR0dBMmNrZEVy?=
 =?utf-8?B?OXd5RFdYcGZwMElwMFAwU2JhU3JtQnZqa1JVbUlkRGdudEFTYUZad3hUQk1z?=
 =?utf-8?B?N1V4a1k4UXVzQ25vV0s2aG1zVGtsVXE0bmR4U3dnZFJRY2pqdGFjNnllYTNC?=
 =?utf-8?B?YUZOcHNOY1dES0NpVkUwYUFSamp3cldKN2lIQjlCMXhpZHhGZG5HR0xUU3pP?=
 =?utf-8?B?NEVpdEtRTEY3K2dLNEJmd1lacFF6SnJaUkcrQlVCczVOYk9oQXdjenhHTjdK?=
 =?utf-8?B?RkZyZGNPN1VDT3JtYUF5K1YrcDhUSEUvcU9kSjNVUmxNamdzOGJDT3lKSGFN?=
 =?utf-8?B?M1FjdzRJMFk2eldlbkpPR2MrVm1vdnVpM1dmQzJ1VU5jK1lEdWdQeFc4MUpR?=
 =?utf-8?B?WFRiOTdNN1pFeGJ4QjRUU2VRSm80YlV2aVZTL3F6SDFYM0lzRHBvTFlVVGtz?=
 =?utf-8?B?UElIaGM0d2ludVdxLzZSeXdzYVdXR3R5SVZ1UFJ6U0J0aDBvTWZxbmtrV0VB?=
 =?utf-8?Q?s2A5s0oWPP4nGLVbDII44D5PlUz+Wj6hALSoB4Jyzuua?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d5f6d8-9d33-4af8-f525-08de205df2ff
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:35:01.5364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4bGyOuzkFseDvZot2Z1CFj4uFcN6P7e750o4NLRRJuH+NJemZfnX3OBxSJrCFr0wARHLfUcygLbtqjX/FBZNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4055
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

From: Alistair Popple <apopple@nvidia.com>

Add support for sending the SetSystemInfo command, which provides
required hardware information to the GSP and is critical to its
initialization.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs                      |   1 +
 drivers/gpu/nova-core/gsp/boot.rs                 |  10 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                 |   1 -
 drivers/gpu/nova-core/gsp/commands.rs             |  37 ++++++
 drivers/gpu/nova-core/gsp/fw.rs                   |   1 +
 drivers/gpu/nova-core/gsp/fw/commands.rs          |  56 +++++++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 132 ++++++++++++++++++++++
 7 files changed, 235 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 609f8e5f2dcc..e40354c47608 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -15,6 +15,7 @@
 };
 
 pub(crate) mod cmdq;
+pub(crate) mod commands;
 mod fw;
 
 pub(crate) use fw::{
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 5ea53250bf37..56c9950b742c 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -29,7 +29,10 @@
         FIRMWARE_VERSION, //
     },
     gpu::Chipset,
-    gsp::GspFwWprMeta,
+    gsp::{
+        commands,
+        GspFwWprMeta, //
+    },
     regs,
     vbios::Vbios,
 };
@@ -119,7 +122,7 @@ fn run_fwsec_frts(
     ///
     /// Upon return, the GSP is up and running, and its runtime object given as return value.
     pub(crate) fn boot(
-        self: Pin<&mut Self>,
+        mut self: Pin<&mut Self>,
         pdev: &pci::Device<device::Bound>,
         bar: &Bar0,
         chipset: Chipset,
@@ -153,6 +156,9 @@ pub(crate) fn boot(
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
+        self.cmdq
+            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 295903c28922..c0f3218f2980 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -489,7 +489,6 @@ fn notify_gsp(bar: &Bar0) {
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    #[expect(unused)]
     pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     where
         M: CommandToGsp,
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
new file mode 100644
index 000000000000..305045e25693
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{
+    device,
+    pci,
+    prelude::*, //
+};
+
+use crate::gsp::{
+    cmdq::CommandToGsp,
+    fw::{
+        commands::GspSetSystemInfo,
+        MsgFunction, //
+    },
+};
+
+/// The `GspSetSystemInfo` command.
+pub(crate) struct SetSystemInfo<'a> {
+    pdev: &'a pci::Device<device::Bound>,
+}
+
+impl<'a> SetSystemInfo<'a> {
+    /// Creates a new `GspSetSystemInfo` command using the parameters of `pdev`.
+    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>) -> Self {
+        Self { pdev }
+    }
+}
+
+impl<'a> CommandToGsp for SetSystemInfo<'a> {
+    const FUNCTION: MsgFunction = MsgFunction::GspSetSystemInfo;
+    type Command = GspSetSystemInfo;
+    type InitError = Error;
+
+    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+        GspSetSystemInfo::init(self.pdev)
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index b083a6a5754c..cacdfb2d4810 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+pub(crate) mod commands;
 mod r570_144;
 
 // Alias to avoid repeating the version number with every use.
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
new file mode 100644
index 000000000000..0d3c46f793dd
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+use kernel::transmute::{AsBytes, FromBytes};
+use kernel::{device, pci};
+
+use crate::gsp::GSP_PAGE_SIZE;
+
+use super::bindings;
+
+/// Payload of the `GspSetSystemInfo` command.
+#[repr(transparent)]
+pub(crate) struct GspSetSystemInfo {
+    inner: bindings::GspSystemInfo,
+}
+static_assert!(size_of::<GspSetSystemInfo>() < GSP_PAGE_SIZE);
+
+impl GspSetSystemInfo {
+    /// Returns an in-place initializer for the `GspSetSystemInfo` command.
+    #[allow(non_snake_case)]
+    pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, Error> + 'a {
+        type InnerGspSystemInfo = bindings::GspSystemInfo;
+        let init_inner = try_init!(InnerGspSystemInfo {
+            gpuPhysAddr: dev.resource_start(0)?,
+            gpuPhysFbAddr: dev.resource_start(1)?,
+            gpuPhysInstAddr: dev.resource_start(3)?,
+            nvDomainBusDeviceFunc: u64::from(dev.dev_id()),
+
+            // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
+            // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
+            maxUserVa: (1 << 47) - 4096,
+            pciConfigMirrorBase: 0x088000,
+            pciConfigMirrorSize: 0x001000,
+
+            PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw()),
+            PCISubDeviceID: (u32::from(dev.subsystem_device_id()) << 16)
+                | u32::from(dev.subsystem_vendor_id()),
+            PCIRevisionID: u32::from(dev.revision_id()),
+            bIsPrimary: 0,
+            bPreserveVideoMemoryAllocations: 0,
+            ..Zeroable::init_zeroed()
+        });
+
+        try_init!(GspSetSystemInfo {
+            inner <- init_inner,
+        })
+    }
+}
+
+// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
+//         that is not a problem because they are not used outside the kernel.
+unsafe impl AsBytes for GspSetSystemInfo {}
+
+// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
+//         that is not a problem because they are not used outside the kernel.
+unsafe impl FromBytes for GspSetSystemInfo {}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 17fb2392ec3c..1251b0c313ce 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -321,6 +321,138 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub type _bindgen_ty_3 = ffi::c_uint;
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct DOD_METHOD_DATA {
+    pub status: u32_,
+    pub acpiIdListLen: u32_,
+    pub acpiIdList: [u32_; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct JT_METHOD_DATA {
+    pub status: u32_,
+    pub jtCaps: u32_,
+    pub jtRevId: u16_,
+    pub bSBIOSCaps: u8_,
+    pub __bindgen_padding_0: u8,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct MUX_METHOD_DATA_ELEMENT {
+    pub acpiId: u32_,
+    pub mode: u32_,
+    pub status: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct MUX_METHOD_DATA {
+    pub tableLen: u32_,
+    pub acpiIdMuxModeTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+    pub acpiIdMuxPartTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+    pub acpiIdMuxStateTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct CAPS_METHOD_DATA {
+    pub status: u32_,
+    pub optimusCaps: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct ACPI_METHOD_DATA {
+    pub bValid: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+    pub dodMethodData: DOD_METHOD_DATA,
+    pub jtMethodData: JT_METHOD_DATA,
+    pub muxMethodData: MUX_METHOD_DATA,
+    pub capsMethodData: CAPS_METHOD_DATA,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct BUSINFO {
+    pub deviceID: u16_,
+    pub vendorID: u16_,
+    pub subdeviceID: u16_,
+    pub subvendorID: u16_,
+    pub revisionID: u8_,
+    pub __bindgen_padding_0: u8,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct GSP_VF_INFO {
+    pub totalVFs: u32_,
+    pub firstVFOffset: u32_,
+    pub FirstVFBar0Address: u64_,
+    pub FirstVFBar1Address: u64_,
+    pub FirstVFBar2Address: u64_,
+    pub b64bitBar0: u8_,
+    pub b64bitBar1: u8_,
+    pub b64bitBar2: u8_,
+    pub __bindgen_padding_0: [u8; 5usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct GSP_PCIE_CONFIG_REG {
+    pub linkCap: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct GspSystemInfo {
+    pub gpuPhysAddr: u64_,
+    pub gpuPhysFbAddr: u64_,
+    pub gpuPhysInstAddr: u64_,
+    pub gpuPhysIoAddr: u64_,
+    pub nvDomainBusDeviceFunc: u64_,
+    pub simAccessBufPhysAddr: u64_,
+    pub notifyOpSharedSurfacePhysAddr: u64_,
+    pub pcieAtomicsOpMask: u64_,
+    pub consoleMemSize: u64_,
+    pub maxUserVa: u64_,
+    pub pciConfigMirrorBase: u32_,
+    pub pciConfigMirrorSize: u32_,
+    pub PCIDeviceID: u32_,
+    pub PCISubDeviceID: u32_,
+    pub PCIRevisionID: u32_,
+    pub pcieAtomicsCplDeviceCapMask: u32_,
+    pub oorArch: u8_,
+    pub __bindgen_padding_0: [u8; 7usize],
+    pub clPdbProperties: u64_,
+    pub Chipset: u32_,
+    pub bGpuBehindBridge: u8_,
+    pub bFlrSupported: u8_,
+    pub b64bBar0Supported: u8_,
+    pub bMnocAvailable: u8_,
+    pub chipsetL1ssEnable: u32_,
+    pub bUpstreamL0sUnsupported: u8_,
+    pub bUpstreamL1Unsupported: u8_,
+    pub bUpstreamL1PorSupported: u8_,
+    pub bUpstreamL1PorMobileOnly: u8_,
+    pub bSystemHasMux: u8_,
+    pub upstreamAddressValid: u8_,
+    pub FHBBusInfo: BUSINFO,
+    pub chipsetIDInfo: BUSINFO,
+    pub __bindgen_padding_1: [u8; 2usize],
+    pub acpiMethodData: ACPI_METHOD_DATA,
+    pub hypervisorType: u32_,
+    pub bIsPassthru: u8_,
+    pub __bindgen_padding_2: [u8; 7usize],
+    pub sysTimerOffsetNs: u64_,
+    pub gspVFInfo: GSP_VF_INFO,
+    pub bIsPrimary: u8_,
+    pub isGridBuild: u8_,
+    pub __bindgen_padding_3: [u8; 2usize],
+    pub pcieConfigReg: GSP_PCIE_CONFIG_REG,
+    pub gridBuildCsp: u32_,
+    pub bPreserveVideoMemoryAllocations: u8_,
+    pub bTdrEventSupported: u8_,
+    pub bFeatureStretchVblankCapable: u8_,
+    pub bEnableDynamicGranularityPageArrays: u8_,
+    pub bClockBoostSupported: u8_,
+    pub bRouteDispIntrsToCPU: u8_,
+    pub __bindgen_padding_4: [u8; 6usize],
+    pub hostPageSize: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
     pub sharedMemPhysAddr: u64_,
     pub pageTableEntryCount: u32_,

-- 
2.51.2

