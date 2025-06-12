Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 355E5AD7302
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770C910E866;
	Thu, 12 Jun 2025 14:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CO/XGRPt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2066.outbound.protection.outlook.com [40.107.101.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC0B10E867;
 Thu, 12 Jun 2025 14:03:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAMPexs0V6Ey8u6pN/QG4YXC5N5YM5vEAL9I0toOg5Ykfs6D9Zp78tnsfog8oBaz6+rOWHE72PVsPeSWhCQSUS4u8Zb0cf8kbInloaZag29hJJFei0J2WB5VTO+NGtcm7vfmrs4Ckn6tPu1cN3jG9qqDdrxiLOgTGJ74Q+9AJAX76F+RrlLQ5X7NPvjDb8XEHw1NIhnMwI5kdA+MpxtG1naNvgJsmLCBbhUvU8+v1iBfDUA7ys0nSdpovDs+A/Nh9ZGOjNTIMBXdIkg0WWyZq6o91zbty52UfNVnUwyGfzN36gcMeBIVUhCL/bbIOoqSGahDFqbxcr5lui/LJiVEkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfJbH/ZhGXwlZOxN0riKJtDHu6rs6f6W8vPOAcOauTY=;
 b=CYb7WHp/sgrQQk634QZwiFKayh/pgcvdREBkOZA+oPjlm0m6jyZWbe2DW+05QZyN/FlVbj4lUdBXnPU3dSXhAA2aPXCSamhO4fZm8jFw3mSNNKK6RQnKsFjOhkNciXdH89knL0S8nY5HJkeAFHm9mZlLoNPl5lJ94RA8xcJbsdtOovpcpyx+61741RKN+nuln1Q51O71DfPB+tQnCDGNZ825koiYbJdqwIbJkG0m5xeeUAbDGX5Dw3Z8dUJAOjF1pAmXtukwJYFNop4vnZ6h0vpxI40UvTaYdzOdPkB1B5fOlYu+/c+KnZgoupBAEtx1dVyUmat6zv9HcZts7mo2Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfJbH/ZhGXwlZOxN0riKJtDHu6rs6f6W8vPOAcOauTY=;
 b=CO/XGRPtTifRJ3Qr/Q/hsofj/5PtGRNWfoHOHCe38nrYbMqvS8q0U1Zi4G4YjiYh3jold+f8G1Sh9Isoi/XrNShbaxk+JTlsNfAJZOywNcD8beCMXDAH/C3ezzJ1RscX6S8nZMuwSq90lDHHJXqydN6p4P/+YEwn1T8qydz8/gidlYHTHLFl0bKunN2dNUKA8XOlgzX2JMV2JsLnLG4qO/28DFDXvM1tvru+xNL0IRHzaDx9wfVifFlqoAb5rH8CqTZYm7SvgpSHAXYGLWAAMPypLYFynbkVFUNoDHEQEQIIGEVwgvLiot2gEAglIqqe9uxanl3LTjALA99VQ7DP8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8598.namprd12.prod.outlook.com (2603:10b6:806:253::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Thu, 12 Jun
 2025 14:03:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:03:14 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:41 +0900
Subject: [PATCH v5 13/23] gpu: nova-core: add DMA object struct
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-13-14ba7eaf166b@nvidia.com>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: 030605f6-bcbd-47ca-1567-08dda9b9df73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkhURmRtalVybXdDY05KVlA2MFZGUDBXblF0TDFyQm1xSU40SUN2Qms1MCtw?=
 =?utf-8?B?Um5TMVJiVHN5b2lCaVU4cmQzTG1NdXVxbXVPaDdwdS93d2ljdGZwcVhQNTVt?=
 =?utf-8?B?T0RlcWNvR2ZpM1R3SkxRSzF1eVJ0Zjh3cWNxY0JIbWg1U1lBVHA1WjhGclpl?=
 =?utf-8?B?TzRLbG9EV1QrUXl2UXJiVUljem0rRmF4MmZPc3Z4d2hqUGNMTUU3cHdvejgx?=
 =?utf-8?B?L3lRRTdIVjcyRVRlZkFoWUtaR3lVTXhZY01WVnJMRVdiMGtwMG5vc20xUTBQ?=
 =?utf-8?B?Ti9aY3JUOElZVlNSUTYvOG94M3lsTzN4WUpMV1pHUi8wdXd2MW9wbm83RlNB?=
 =?utf-8?B?VUV2RTFyVzhjVjJsRmxydEg0VTVsV3NLRjNtRXVQTkx6Z2h5bytzRkZwUkJQ?=
 =?utf-8?B?eHhqalF4Qmg0a1QwSW9lWnM3WktJaThsR2ltTXYrbzNmSHBZTWZVdkZTZjhS?=
 =?utf-8?B?YkpUQlZldzlFbmowelhkSEFhZllzYjRGTWRPcmhucGJwbGlNWU0yNmFyTk1j?=
 =?utf-8?B?L0FsYkxCcG95ZDhhTU1FQWRnOVM2c1hzTHQ5UlJ3VG51YjNVcGZzcGpURHRs?=
 =?utf-8?B?U25PUGQ5ZElvbTFMa0ZHL3h5VERKRnFEdEhjUko0RWRjRGI3ejgyTWlES05O?=
 =?utf-8?B?WWtBTEpkTjJsaWx6OU9DU3dqQlJTZW92dklZbnBTMllsYUd4d1VNUndPVHVz?=
 =?utf-8?B?L0RJVmpoREJ2enF1NVhrQXVpYUtCblFERnpGeDdQK3QxQUlKa2piMEVIOUs5?=
 =?utf-8?B?NW84aVBpVzZNVjM1bWNrL3pJZFRGYmxiRlZRRFB6QVluWXBvbVY3ck5YVVp0?=
 =?utf-8?B?RSszV0IydTJXeGZuSkt0b0lUQXlicUFZczFIMjlDalFoQVNwSWJkdnhjaUlB?=
 =?utf-8?B?MGhsL1UzR0tMSUtYblBWNzJjdTNFUzkrWTE3YitsVFgvRmdaYm1KQnl4UzdH?=
 =?utf-8?B?MEc3bE5ldGNpU1grSU9MZHdyOGxQNjU2b0VxOWVwTWhpQ3lHcG5Cc2c3cW5z?=
 =?utf-8?B?eW9kTWZEYzRKSnNFMGtCY0lpbUlXQ3dzZXd0TlRlZ0xWZytrc0IvQml2ZDRv?=
 =?utf-8?B?bkcwNWdvenIvUDE2aDc5UktVQzUzYUd4R2RVVG5DeG5tUVk3Rnd5M3RoeDVa?=
 =?utf-8?B?c3pxa3RmRGVNS3Z5d3ZsSW96UklQcG5ucmorTTFXc1A1RjNESjAvWE5jV3Bn?=
 =?utf-8?B?VDRzNTc1ejhwbjJTRXhSSU5iYVMzTEJrZUwwZ0lhTmJzWTJHSy9uRFRRaDJp?=
 =?utf-8?B?cjVlQXkzakFxeDJWbkRVYmRkR1E1T0Q4WG50U0d1VndKWVllS3d6Rk8vMmZH?=
 =?utf-8?B?VWFVZFF2N3RDSkt1cGk3SkhpY0ZqWlR4RGdBY3pKQlJid0pwbnVydEdoWUQ0?=
 =?utf-8?B?TnY1L2Z3eDdNMDEwZXpKVXNFY01YSzVvWHZZUnpPMXJrY0R6bm1OWktBNmdq?=
 =?utf-8?B?OTlDZW5wd3FJWnBaVHhraFhyM1Z5TlQxZzFETndGekZzSk5wNXZMNTNuVHk5?=
 =?utf-8?B?S0c0c01yTnJzZWpVNWMvbGlZeGd4R3d1ZjBvRStWSTFJNDBFeDJweVBvbHE3?=
 =?utf-8?B?VHdlYmRONFdHeEdRcTZpVWdsbjRId0h5VUFNR1J6L3RmcUFCMnBRdm41YXVQ?=
 =?utf-8?B?MXhpSDFZVUxFdGJrYlJzNjlHUUZWU0MxUGY1RWluRWNaZEtIWTBFU1RpUTl4?=
 =?utf-8?B?WkJhSlFGZnNCTjB1cEFaVldLSUFmNnRNcmc4aHJ1THdxWkNqZi9kUUNkRXd6?=
 =?utf-8?B?bEd2aUZheFd6R1ZJRHhIYVhibG13aCtRNVJ5cGNmMVdlR1A1cXlqenVvOHNE?=
 =?utf-8?B?bDVQYVI3T0EzQjlTMzRMZ3RuaHExVkJXZS94RzNIaHcxeXhZQnpZc001Mk1C?=
 =?utf-8?B?LzZkcG4xVTdoelVyZDE3NGgyQXVQNlNvb1VSaTdvVzJ5cHFneFR0bnBZcU9H?=
 =?utf-8?B?MENpZzQ2VFhpcGtyUXE3QXhYNFBjaGtKTERKNjZqMm95TEJPaHRGZ3I1eVoy?=
 =?utf-8?B?aytzQ3gyOTNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUcwQzd2RG14UldUZ2lzTldGa2JiY1ovOUpEUThPWVN6VHlNS3FRWm1QTUlJ?=
 =?utf-8?B?SndRMTFoNUU3eWNLT2NXc1hub2hRTU5ibVFPUHZ1Nml3TExaSUZTUEtaeHdv?=
 =?utf-8?B?aXhleWZLMm5QQzhTN1Nod1BEb0xLZ0w1VSt1NFZiMzNPTVJ4NzU4WlZlSjNN?=
 =?utf-8?B?Vm93TDVoNEN0eFNYS1h1dlRzVnlYamtxRWN1cnR4UG1uRnNOUUUvaTEyWnNq?=
 =?utf-8?B?ZnEyYUQxR2E4UmZKU2c0LzVHOGtzSW9xdHpFbktpQXJvNkVJTGdycTBjc1BJ?=
 =?utf-8?B?MkNJaFB1L2VNdWtPTWIvVC9ieVVpR1lsT3NiNUl4WjRWNDA2SmQ2VXNWL2ZK?=
 =?utf-8?B?RmExK2JYVGtPNXJINFlaQkpSa2pQWGU0K1lETGJ6MmF1RlY4YkdrQnFWaXVK?=
 =?utf-8?B?bkU0ZWh0YTZlSEZQL3U4aXNWRDYxajlxZWZtQkpmbDU2TTJKWW1GdU5NZVV4?=
 =?utf-8?B?S3pnK0tRV1BwSlB4QlU2VThNUHl3Z3ozR0g1QWM1QVRBK3lQZHhlWE0rc002?=
 =?utf-8?B?RWhFbXp6RnY1VldmQURVWGpYTmI1alBKWHIzUUZhbDhacDVzSE5OeE55R1ZB?=
 =?utf-8?B?T1JINU1RTDRPNWRUZUs2NmtIenFhc2xYRGVtUFVRNjVzakx3a0E1RjRwa0lO?=
 =?utf-8?B?cis0ZUZOODRLU2tYUUIwcW43VWwweCszUTh4MW5HSE0xVFcrN0htdkRMb2FS?=
 =?utf-8?B?Y1hXYlhMNi9HdGJVMGJaWFdzODc0TS9YbzdKaGMzMFVBZG40UldDUHlLQzRl?=
 =?utf-8?B?RXF0ODZtSkZjVFhQUk84QjJBOFRTTFYrVGlLcytkZm1XYUNPWHlnSHJtZDJk?=
 =?utf-8?B?SUVvN3FEQ3dkeVFNNVNzWGRzVW83Q0t1aWlEbGd5U1g2MTZFa01ObzVETCt1?=
 =?utf-8?B?YzVFajZuMTl6K0xaRTlPVlFIdUxrRGtzTFVIOXk1bTVmc3RtMjdSdSsvbVNo?=
 =?utf-8?B?RE9CTGdxNm1HVkhGQzFBZWxETDZMM3VYQzBIcnhDelBpZ1gxdUUrSldPNlc3?=
 =?utf-8?B?aGVLelhxU1hwQWxhQ2ZLcHpmS012M09hMitCN1RKRjBzd3hOMFlCYTUwRHRK?=
 =?utf-8?B?M1VMNVBEYm5PdHRza0FMM3JQdkhMTFlmRUFTUWJWTmE2eFpLZ3NkNDFJU2xE?=
 =?utf-8?B?WG5QQUpaOXBtNzNYeTlFY29tVktjbVVUdWNyVEIxdEUrQVMvcVVYd2gxOTdN?=
 =?utf-8?B?bHE4bUtwRERjYi85ck5WNHhyT054OE1XK1B0TnlPQnRlUlFPbXJmVHgxTFVF?=
 =?utf-8?B?NklTaXVQODdoWG9FeWFVMTA5ZGQvdXNJb1owTnpreFV3TlBxSFJmUnBpK253?=
 =?utf-8?B?RlJDYlBhOUdoK3IyWDhRL20ydnllN1F5SjA2Y3ZxVE1rVXJuNWFMc3pTUDR3?=
 =?utf-8?B?cUtOcHZRMzUxdUpsZGF1cEpOV3NIODhWWkRBWS9INE9zV21Ib1hWTHViN0RT?=
 =?utf-8?B?emgvZ2VNOU00ckZaM3hrL0ozVW1FbUdGRm12dEN6OUVMdWNCRWdKb2NERHBG?=
 =?utf-8?B?OStKOUJvMmMwSUZPMmY3eENXUjVBMGNyVkhCZGsvbkgzMnNMbUZkaEdyM2lm?=
 =?utf-8?B?M0plYzZ2dXMxcUM5WGNoQ0pHdGVsNFdSVmdva0RxZ2duSnZpbkoyTW1paGFl?=
 =?utf-8?B?MldqUUJ6SWpiYUhpY09xQWF2Rm16aEdvMlRGQjFxZmI3MWFqRkJBekNLenJ2?=
 =?utf-8?B?VnBsZnFOaVVvWDlFblcybTNLVFBxYmZTTDkxOG9OeXY3MEpTME93MUlIRzhE?=
 =?utf-8?B?cjhkdm9EQzNRa2ZSbW9sMXZlNWhENksycHA2TVNTVHBqRzA4T2QrZmNHdTky?=
 =?utf-8?B?Z25NTnB2Q0lwNThob0s0eG15a04yK3dQT00yMmVuTHByUnlUM1BRSVJoa2wx?=
 =?utf-8?B?MEhPVXErVStweGVMUmJ6V3dRSEx1aVF4NVBac0dpRmFzSSt1a2N3TXFmdk9I?=
 =?utf-8?B?Y0Y4WndOTGxaL1k3Mm8rNHE2dHBybHMzL3FFdUtSaTF6KzY5eURWdS9odWhP?=
 =?utf-8?B?VXpIVUQ0cWlTaktUTGJrUGdKRUxxYnNaNDlDMU92RXpYNXJiM1VZNVBIRWxH?=
 =?utf-8?B?aW44bjZtUHNCRTl2SDgvb0VtYmliK05MSmhmVERXUE45dktuKzk0SmpsUGRn?=
 =?utf-8?B?elRxczhXUWtOOXVhbjJxUWRWeklPQ0MzNTJXSWpqZW9YQmwvOFlocFg5c3ZX?=
 =?utf-8?Q?7NDSK73nW9ZEVw96X+rnHbNmSOj3h8F+oR9AZCP6itL5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 030605f6-bcbd-47ca-1567-08dda9b9df73
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:03:14.1383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tinwnC2VX1ms4Kb+H5zi4h9W4MalbQMcqIjZWNAw5djtDzUDngj1K+6bkNjdGmdK0V6B5Uh4FVM/IBtpqwZpWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8598
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

Since we will need to allocate lots of distinct memory chunks to be
shared between GPU and CPU, introduce a type dedicated to that. It is a
light wrapper around CoherentAllocation.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/dma.rs       | 61 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |  1 +
 2 files changed, 62 insertions(+)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
new file mode 100644
index 0000000000000000000000000000000000000000..4b063aaef65ec4e2f476fc5ce9dc25341b6660ca
--- /dev/null
+++ b/drivers/gpu/nova-core/dma.rs
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Simple DMA object wrapper.
+
+// To be removed when all code is used.
+#![expect(dead_code)]
+
+use core::ops::{Deref, DerefMut};
+
+use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::page::PAGE_SIZE;
+use kernel::prelude::*;
+
+pub(crate) struct DmaObject {
+    dma: CoherentAllocation<u8>,
+}
+
+impl DmaObject {
+    pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Self> {
+        let len = core::alloc::Layout::from_size_align(len, PAGE_SIZE)
+            .map_err(|_| EINVAL)?
+            .pad_to_align()
+            .size();
+        let dma = CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
+
+        Ok(Self { dma })
+    }
+
+    pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
+        Self::new(dev, data.len()).map(|mut dma_obj| {
+            // TODO: replace with `CoherentAllocation::write()` once available.
+            // SAFETY:
+            // - `dma_obj`'s size is at least `data.len()`.
+            // - We have just created this object and there is no other user at this stage.
+            unsafe {
+                core::ptr::copy_nonoverlapping(
+                    data.as_ptr(),
+                    dma_obj.dma.start_ptr_mut(),
+                    data.len(),
+                );
+            }
+
+            dma_obj
+        })
+    }
+}
+
+impl Deref for DmaObject {
+    type Target = CoherentAllocation<u8>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.dma
+    }
+}
+
+impl DerefMut for DmaObject {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.dma
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c3fde3e132ea658888851137ab47fcb7b3637577..121fe5c11044a192212d0a64353b7acad58c796a 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,6 +2,7 @@
 
 //! Nova Core GPU Driver
 
+mod dma;
 mod driver;
 mod firmware;
 mod gfw;

-- 
2.49.0

