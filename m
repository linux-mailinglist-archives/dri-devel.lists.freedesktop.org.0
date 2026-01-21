Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM+/B3UNcWlEcgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 18:31:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536F05A8DC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 18:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B6310E857;
	Wed, 21 Jan 2026 17:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="XPGR8wDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU010.outbound.protection.outlook.com
 (mail-ukwestazon11022114.outbound.protection.outlook.com [52.101.101.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7044610E0BF;
 Wed, 21 Jan 2026 17:31:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8vyKhBevr4Qmr8ZBYpj+Sjl3+oOCdEOw3SSi+GFGJZsis5vAh01toFku/u+Qqr3zqyNSKl8mM4Ihe4MTzdXYUmhY+ICbCOcHn1UHdpkFClgle3OZQ18Mvf1aRPO6bQik+5Mi6Kugw7MzV5DNcYjeS7BXji1WZLnlKwpt/vEdP6Sle1UM700l3vyZqCuh8YuygefAqziFSRWQeGivP1QDN+nCc9ZjJIC6n+f5f/vsMjMOoQjZtHkKL/hCL+z0RtpoUT5E/o4Bt+vpgBLHCkGMqsAp842+FOPn0uAIh7EuAu5ABqMUN8yBkmVuM6s6b8jOVcLoHfxCcZSgS1E1WtEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9P+pqLPSK/Q9brJpDt2S6JHm3SrThmYtk+/fl8qiQw=;
 b=Eh4bjB3WpQuryFLYf8tRLF3Aqwge4Mfi5PA9Bypdi9fZ/V6mHDjOSo62e7XFzTKaiFaygihr6WDGHW6qH8gnJs864ignS5H2vGZ92OHynnehI07Lzmfq/TRN/TM/RWcXj2xXpqRtwrWEFh5NshWCALILqWx9VjazYc3XL3EdYHlsf9xnZYUkHsOeIhF1lRU9Zl1GhzqsOObObMz9DvtCxhjfq2zXJTE6B62g2vyNDkrRfy3advYL/uye8R7rU5Kc9bpvUtsg9JyA4JZ9ujp7sfnOhCwtnTFq2etPXoFFL6ftVIZSm7FmokuRt/aBVtLSwvVDF6//WtHyIwOIOxD6Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9P+pqLPSK/Q9brJpDt2S6JHm3SrThmYtk+/fl8qiQw=;
 b=XPGR8wDyRlzBRsb4VFGviQ3kxQ385ljrlD0xXLPfUbfs8sfMGCSUzdI4+vReHadkizxa+lGCTo2jbmPcyLfBb99wf+cDaFzKBl09hluuJZc7k86X3yuEryEGUqE8Fa+ugqcqG/SATKuAKeobyz8f3CvtZ1CRFURT+q+5+mr8PFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB2206.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:114::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 17:31:26 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 17:31:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 17:31:25 +0000
Message-Id: <DFUG2U4PVVTN.1DVPXGJK735F8@garyguo.net>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/2] rust: drm: add support for driver features
From: "Gary Guo" <gary@garyguo.net>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boris Brezillon" <boris.brezillon@collabora.com>
X-Mailer: aerc 0.21.0
References: <20260119-drm-render-v1-0-8326e4d5cb44@collabora.com>
 <20260119-drm-render-v1-1-8326e4d5cb44@collabora.com>
In-Reply-To: <20260119-drm-render-v1-1-8326e4d5cb44@collabora.com>
X-ClientProxiedBy: LO2P265CA0229.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::25) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB2206:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d86216a-ce32-4f04-6453-08de5912e747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODk5YU80NjJPZWNxOWtRS0JBT25DM3AvSDF3VmxrNENWNEFZbThHTytOYWFs?=
 =?utf-8?B?anhsWnBZSTAySHJQd3k1T1ViajRncTNxRzF1bWVDOXQwNnMxbFJOMzhVZnRV?=
 =?utf-8?B?d2lPWU1vTHJxOFZqVEhaRmFOVlJ6VnJ2Zi9aVExBeFRyZGxhRGRHVUdPWEhW?=
 =?utf-8?B?NnlhampVekZpYm9Sb1hET3BPK0VOcjFpZHBJd2RoWEVBVjBkL1BmczhiMnFM?=
 =?utf-8?B?ZkZQTmQ3RGRMWnMybjhKMEtpeFFKQlBETXhGNGcvWUJ3bHZDZ3BUUkZKRUs0?=
 =?utf-8?B?MGFpVzhaMlE5WTNHb1JJWTVIbUpPUVgyVlB1Sk5SR2svSGcxOXVoZnFHREhq?=
 =?utf-8?B?SXJEYnRRRWVPQU1ibnQ2RnZVZmx3bitHa0FwWTJNTTRSdnhyMXhGNDBlbDMz?=
 =?utf-8?B?Mmxidkg0emdXWFh2WkZXa0ltdXlvUk1GU240cnFET1V3Y29ubkw5VHNRRWMz?=
 =?utf-8?B?MVpRd2hzajZWZnI2bitXdzdDdlFtWjExRGY3MExpOWRJUEg5dHdURTQxYzVI?=
 =?utf-8?B?bVhsVTh6UFZzLzMzeDdibFJTQUgzSmZEUHd6aE5obGpzTm4rNHhIaEhRYzhM?=
 =?utf-8?B?MWVHYy82VTFEQnpadzlBM20zQWwyeTJiTU5LL1pMNFptSjNwVXhLbHAvZmJv?=
 =?utf-8?B?dnRKUlNrdEdtWDc0Q3JPMmtxVFB0dFdiTVdyeStHN3NkOG1LWGZGcisxcm1x?=
 =?utf-8?B?WHppazhqU0tGOFhzWHVma2tMeG5wdmNRQlBGQ3NoeVVkNklTbExwYXZBS0Rx?=
 =?utf-8?B?SEIvZGRtelhEMnJ3V3dMRklUNExBQ2pjUElGeEhsZHdNMG1SSE90a1BKbW1M?=
 =?utf-8?B?alAwdTlRVjhxRmpxVmU3RGt0Z0ZqaEJGVmtUM3ZUOWRuNm9FUGRWaXZ6TUNu?=
 =?utf-8?B?cDNTVmE3Rng2c0RlYzlMelM0T0sxdFhjd054Q1orNkxHcitLRmladHVPekp3?=
 =?utf-8?B?cUNWVzNZOGRsZFV0a2JwaDVhd3FPL1lvNTFkelRPZ041QUUrcmhackNuN2Nr?=
 =?utf-8?B?WU03L2lvVEZzSjViaHdiRDB5K2Rvc295Q1htRkhqS0VEYm5WVUo3WEhneUN2?=
 =?utf-8?B?OWVKSCtwbTZKeTZ5ZWhtZ3Z4bytHejV0eDdJZG16OXVHV1JhRlYyRGNDbTJF?=
 =?utf-8?B?NHdaQi82MEdCWkFMNjdCdjNDMUU2TXE3endLK3dQYnlPR3NDWVBSWkZRazQ1?=
 =?utf-8?B?TkF0SlRaRXVJS2RzZmZseGFNRTE4bTM1dWFzaUZPWDdaQlJLNUZZV01mSlNU?=
 =?utf-8?B?cWxPeUdtd1ljY0lqK1hBRlpNMXVLZzZQQ3dRWWJ5SWV6bFJjYVAzRld2c1l5?=
 =?utf-8?B?WlF4OUZib2hvUXFTTlhZSVZCWDZQaGZ1TldTWjIyWU1sbUVsNjM2U3crM2k0?=
 =?utf-8?B?dmZDVGluSFFpeXZBeFZCUStnRXU4dEp2Z1hRb1ExNkdCUFdjRkZzKzRoRTk2?=
 =?utf-8?B?MmlYU3pPQzlNaFIrM3BqN09YMzR4TkRVck1zbXpsSEpZdGhjUXlsWXhJV2xp?=
 =?utf-8?B?Umg3YWE1RTNFTU4xNUdIN2dRRHZYVm1tMkRHZWo0UEJPcWNkOXJtUDhZNE1W?=
 =?utf-8?B?YjJKUEVYRTdHUGJPSmRTY2EwYjkya2dSMk1IeGFmR0pYMi9tSDNQOVF1RWhn?=
 =?utf-8?B?TEk3Nmg5K2xaS1AxbFB0cVNJd1M3YUUwUDZpRWhJdTEzMmYrQzlnUEtBbGdF?=
 =?utf-8?B?aytQWU9xRFdmZ3luNVhmeTd2MFVPRmFaaFhETkVyTUgxRmlLaFpnMi94bXMr?=
 =?utf-8?B?dzlzOTJwM0hIN2M2VllSeFlSSkQ0dnBnQUpqejR0TDNtQ0xhazJKVzJsWkt4?=
 =?utf-8?B?TUV4U2NkR3REd2xzYk0zb0JyNkdVZ09CVVFSRzVWRFFEUlZqcFFDaDhNakls?=
 =?utf-8?B?T1hINDNiODdzcEFJNFdUbnZac1ovUWhuTHR2bmJlUUVtaHdsUVlBS1p4YnhF?=
 =?utf-8?B?Vzd5OTV6QVprSEhWTVJlc1dGUE01WG1Ob3p2MjlVUlhBK09DSEhHSHIwTE9x?=
 =?utf-8?B?VGsxMlBseENmbFJQM2tkZDlmMWVEbHprSTRJdm5aU1hFZjRhZHpWeUNUa2lq?=
 =?utf-8?B?SWtEdURwN0JJdERJUThEZUtGcVZMdEpxRjM1dURlTHlmNlhtUHhLUnE1UEdk?=
 =?utf-8?B?NUxGNmMzTFlJUGVrWDJnSmN4SUxuT2xXRkZqSGRCOW9Ha2FSL0UwSTl1MDcx?=
 =?utf-8?B?OVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU9jVzB2dmlsSHk3QjhCN2FVZ1B6VVpYTmxMeG1TbnlJeWdIeUhtNm96SEZG?=
 =?utf-8?B?TmJMdTRCQk9teEpiSmNsYUpvY0kzL1MvbUx5bEVuRi80Tkl2RHpONUo0aEVr?=
 =?utf-8?B?SWQ1cEpyb25iQ25KQ1NJMDZQRk5yNWhtejFMbUo1R2UwamhKVmJ6TEcySXVB?=
 =?utf-8?B?V2xISEo5dVhkeFNIaWREWFhrNGJCcXVZNjZTdVVuSm5aaTE5enFMZ1d5Wnoz?=
 =?utf-8?B?MDkvV0pSdGJJM3JSMm5FM2xwU2pUcWEzbHNGSmN4dTdHeitOa0E4V1FjeXVH?=
 =?utf-8?B?cnBPTUZnN1U0MmZGSnFDZHI5Vk9sUW1hdnc1TUpVbXBLcVVmL2RFUWFhckF1?=
 =?utf-8?B?OXJpUDJXN1NJWjQ4T3FDWmdWZmIreS84cm1ZYkpPejBSWWl6Z1p1bCtCUmMw?=
 =?utf-8?B?K211OEN3VEcxZzhoRFNxZjZWdjIyVmw4clI4QVI2WWtaL3ZKZ0pNWThEN2Vw?=
 =?utf-8?B?a0RVRWdmNkFFL0JTQUMrckQ2V3Jla2ZTM3Y2STZueUZCOTRtd2lTczZ0Ny80?=
 =?utf-8?B?OGR5eU13bDRESzdaVERHMkhRMEdFRml3dFNyOWxJNGFBRHE4YlVDYjRmUGYz?=
 =?utf-8?B?TkR4TjBOdjk3ZC8wYXU4a29TY1dUUnpiUWRWeThybEkyeVFNOXUzWHU4dm15?=
 =?utf-8?B?MGJRTWZtdW9LTXE1QTh1RTh5OTVXOTB2SkRyc0M0R1VKRTBWWTl0N3BvNjVR?=
 =?utf-8?B?eHpOMGxneG91aVVBcGVJWU9SMGZFVDZUVXpkNlhpcWpWZmN2WXpMSWJuUWVn?=
 =?utf-8?B?TTVYcVVrcU5LcDhybGxwQVc5ako0b2I5ZzVvZlNZUzVtRzI4RlBmbVlqV3Uy?=
 =?utf-8?B?c3RLeGVxdUlzRzZhbkNPQ0Z5anlxU2h1T1cvNWdZaFFLVHdncUVvWlFXMlJK?=
 =?utf-8?B?UFEwWDFkNTZBU2NwQ2VDUEJYak9Ldk5NWVZkeHZndzBEa09Leng2L05GUjkz?=
 =?utf-8?B?K0J4eEVrRWFrK0ZXNWZ2WC9iU0tmam1tUzNyZmoxMVVLYVpZK1Z3bE9QVDBC?=
 =?utf-8?B?TnpqcU1sUk9nYTdFZjFVVUtTUGNtZEdHTlZOWkI0SkNuaGJoLzF5NXdxeHRX?=
 =?utf-8?B?d0hicEZoNVd2V0gwV3RKMmFBWVBzWWYyQ2dPMmNwTHZrMkdBOSt4YUt5Szdj?=
 =?utf-8?B?Si9sa2tITXh3TllDVGxKdXM5QmlBYWJNTnJvRG9rc0RpY2FURTR1amFGd2Y5?=
 =?utf-8?B?a05ZV0JEbW9qbnpmVGIxZ3diUXVGNUpSNzRmdWlpcmRINEFpSGYxVFR4MC9U?=
 =?utf-8?B?MzlSZk5HZmdDdmxVeUcvdVZQV3o0ODdqcG1CNkVUU3ZUdVBHam5KenhEWmti?=
 =?utf-8?B?eEs5bHlIdytVdGlKTG41SUJmVDdiVE9oelA3MGxrbytqM24zS3FhdnVkMGRu?=
 =?utf-8?B?WUttZEQwL2NuNEM1WkRtS2twMk13d3dFTU16eWNCUGxNbnRlNnhtN1krMGxF?=
 =?utf-8?B?UXFCYTRkSytnNjg5U1NJUHBkTjUzeG9kOGRrYnRBNWJvMkRmU0ZBaWlPR1py?=
 =?utf-8?B?d0Y3NHFPNk5VeldTK1RBYjJpanNpdkZLL3AvYTd1eGZ0R21WdURuRTVLOXg3?=
 =?utf-8?B?dWVkMGRXbjFOWUpBbVZraDl5dklmem1PRW52YTBRTTF0eDZOQlhBVU94VUMr?=
 =?utf-8?B?RlQ2M2pOamUvK2VIRE9BejhQaUNCSFkrWHNiU0tab21Pa3ZTZHJHenYzc0Vw?=
 =?utf-8?B?eTZwMWNKOUhtZ0JocDNIZG0ya0lFMWxxbGxJdXNPMEhqK1BPVFJibG1ScGxn?=
 =?utf-8?B?Q0xTWTNKOEgydlNFVExXRUxlV29GRUF4K29KNmp5SWNtaUFkZWQ3VTNpd081?=
 =?utf-8?B?Z0hhMzB1VFN4KzlNTmVIem1rS3JvYTdXeno2U0R4dU14OWF0OStNUG5OY2Nu?=
 =?utf-8?B?cUxhOUZtYk1laHhLZzRES1B1RkI2WnJ4QkNOdUxpNUVpZ0xoVmFaMzUzeEpX?=
 =?utf-8?B?RlBSeWJaRDZJYmNZRWZ2ZjBobThOdlNCcnpaWjd4RlRlMDVlbUUvUVVYeHdj?=
 =?utf-8?B?bnhkcjE5dmxvS3BMa3JCUHRvcDVNK2hDTHl3NjdaUks2WUd1SHRXR3NYNWN6?=
 =?utf-8?B?M0UxUmI1VXRWUHozRWJXdG4wMWtURVZYNEFzUTZkSGxXMzA0czYxcVRyM3pi?=
 =?utf-8?B?M3NWQWxtTEEzUFc4SGdpSVF1MlM5bzEwVC9QWnlRRWg2MzJ0cnJxdmgxbzZw?=
 =?utf-8?B?dXZQN0NuU2V6TERNalliMlNBOWRTMi9FRHExQ3dkNi9malYxbHM2VFkzc292?=
 =?utf-8?B?dERJNGFja2xOdEh4ZmRTMEttalU1dlZ1ZXRUYVgyTUkzanFualQvZ1BQdmV4?=
 =?utf-8?B?Q041NGFIMitzTVZzRENjOWtSeUxxa3c5WTkxL0ZOM2RHcmdPcG0yQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d86216a-ce32-4f04-6453-08de5912e747
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 17:31:25.8332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zm52v0ama9sEkpaj6Dotrr/WVOTA9K3bkJcRIxDrbucsqytMfpNXTCcIEnqf3ST0nOJOzLbod9gVcBV64s8/iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2206
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 536F05A8DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon Jan 19, 2026 at 11:34 PM GMT, Daniel Almeida wrote:
> Add initial support for drm driver features via the DriverFeatures trait.
> This trait is unsafe, requiring the implementer to comply with the safety
> requirements of each feature individually if the feature is enabled.

I think such unsafe requirement is quite vague and also very non-local.

Maybe we can use a single trait (the `ModesetOps` that you described) to do
this:

Something like:

    pub unsafe trait ModesetOps<D> { ... }

    // Maybe the never type in the future...
    pub enum NoFeature {}

    impl<D> ModesetOps<D> for NoFeature {
        fn foo(&self, ...) { unimplemented!() }
    }

    impl Driver {
        /// Reference the modeset implementation (typically Self),
        /// or `NoFeature` to indicate that the feature is not implemented.
        type Modeset: ModesetOps<Self>;
    }

When building, you can use `TypeId` to check if it's actually implemented, =
and
set bits in the feature flags automatically.

Best,
Gary

>
> New features can be described by adding separate ZSTs to encode them. The
> current design assumes two types, for example: FeatureFooSupported and
> NoFoo. As said above, this will require implementors to observe more safe=
ty
> requirements in their DriverFeatures trait implementation.
>
> A subsequent commit will build on this one to add support for FEAT_RENDER=
.
> This is required by Tyr and other drivers.
>
> Additionally, features can also require additional traits to be implement=
ed
> when enabled. These traits can add their own safety requirements.
>
> This is roughly described below, with some boilerplate omitted:
>
> pub struct ModesetSupported;
> pub struct NoModeset;
>
> pub unsafe trait ModesetOps: Driver {
>     fn set_mode(&self, ...);
> }
>
> pub trait ModesetRequirement<F: ModesetFeature> {}
> impl<T: ModesetOps> ModesetRequirement<ModesetSupported> for T {}
> impl<T> ModesetRequirement<NoModeset> for T {}
>
> pub trait Driver:
>     DriverFeatures
>     + ModesetRequirement<Self::Modeset>
> {
>     // ...
> }
>
> // `driver::compute_features` is augmented to include the feature flag.
> const fn compute_features() -> u32 {
>   if T::Modeset::ENABLED {
>     features |=3D FEAT_MODESET;
>   }
>
>   features
> }
>
> // In driver code, `DriverFeatures` can enable the feature via
> // `ModesetSupported`.
> unsafe impl DriverFeatures for MyDriver {
>   type Modeset =3D ModesetSupported;
> }
>
> // Required because `Modeset =3D ModesetSupported`.
> unsafe impl ModesetOps for MyDriver {...}
>
> Feature support will soon be required by upcoming DRM drivers. This
> extensible model lets us describe them in terms of either additional safe=
ty
> requirements and/or traits.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  drivers/gpu/drm/nova/driver.rs |  5 +++++
>  drivers/gpu/drm/tyr/driver.rs  |  5 +++++
>  rust/kernel/drm/device.rs      |  6 +++++-
>  rust/kernel/drm/driver.rs      | 17 ++++++++++++++++-
>  4 files changed, 31 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver=
.rs
> index 2246d8e104e0..247a05f7b3a7 100644
> --- a/drivers/gpu/drm/nova/driver.rs
> +++ b/drivers/gpu/drm/nova/driver.rs
> @@ -69,3 +69,8 @@ impl drm::Driver for NovaDriver {
>          (NOVA_GEM_INFO, drm_nova_gem_info, ioctl::AUTH | ioctl::RENDER_A=
LLOW, File::gem_info),
>      }
>  }
> +
> +// SAFETY: This trait requires implementers to observe the safety requir=
ements
> +// of each enabled feature. There are no features enabled, so this is sa=
fe by
> +// definition.
> +unsafe impl drm::driver::DriverFeatures for NovaDriver {}
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.r=
s
> index 0389c558c036..ec2aa30515a1 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -191,6 +191,11 @@ impl drm::Driver for TyrDriver {
>      }
>  }
> =20
> +// SAFETY: This trait requires implementers to observe the safety requir=
ements
> +// of each enabled feature. There are no features enabled, so this is sa=
fe by
> +// definition.
> +unsafe impl drm::driver::DriverFeatures for TyrDriver {}
> +
>  #[pin_data]
>  struct Clocks {
>      core: Clk,
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index 3ce8f62a0056..cfc2f34e8cc2 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -61,6 +61,10 @@ pub struct Device<T: drm::Driver> {
>  }
> =20
>  impl<T: drm::Driver> Device<T> {
> +    const fn compute_features() -> u32 {
> +        drm::driver::FEAT_GEM
> +    }
> +
>      const VTABLE: bindings::drm_driver =3D drm_legacy_fields! {
>          load: None,
>          open: Some(drm::File::<T::File>::open_callback),
> @@ -86,7 +90,7 @@ impl<T: drm::Driver> Device<T> {
>          name: crate::str::as_char_ptr_in_const_context(T::INFO.name).cas=
t_mut(),
>          desc: crate::str::as_char_ptr_in_const_context(T::INFO.desc).cas=
t_mut(),
> =20
> -        driver_features: drm::driver::FEAT_GEM,
> +        driver_features: Self::compute_features(),
>          ioctls: T::IOCTLS.as_ptr(),
>          num_ioctls: T::IOCTLS.len() as i32,
>          fops: &Self::GEM_FOPS,
> diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
> index f30ee4c6245c..fdfd083ba2b6 100644
> --- a/rust/kernel/drm/driver.rs
> +++ b/rust/kernel/drm/driver.rs
> @@ -98,7 +98,7 @@ pub trait AllocImpl: super::private::Sealed + drm::gem:=
:IntoGEMObject {
>  /// This trait must be implemented by drivers in order to create a `stru=
ct drm_device` and `struct
>  /// drm_driver` to be registered in the DRM subsystem.
>  #[vtable]
> -pub trait Driver {
> +pub trait Driver: DriverFeatures {
>      /// Context data associated with the DRM driver
>      type Data: Sync + Send;
> =20
> @@ -168,3 +168,18 @@ fn drop(&mut self) {
>          unsafe { bindings::drm_dev_unregister(self.0.as_raw()) };
>      }
>  }
> +
> +/// Marker trait for drivers supporting specific features.
> +///
> +/// This trait is unsafe, and each feature might add its own safety
> +/// requirements. The safety requirements for this trait requires the ca=
ller to
> +/// comply with the safety requirements of each supported feature.
> +///
> +/// Features might also require additional trait implementations to be p=
resent.
> +/// These additional traits may also be unsafe.
> +///
> +/// # Safety
> +///
> +/// Drivers implementing this trait must ensure they comply with the saf=
ety
> +/// requirements of each supported feature.
> +pub unsafe trait DriverFeatures {}
