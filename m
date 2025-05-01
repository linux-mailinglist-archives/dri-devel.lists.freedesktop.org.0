Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A69AA5EBD
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1325A10E836;
	Thu,  1 May 2025 12:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NhhOmijd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3157710E82C;
 Thu,  1 May 2025 12:59:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BK4VCRVpYrt69e4hevEaPRh5oIlS6Pj7jONkEp87kdpCLY2XRZJaXamWUscNTYl0zbaOZlK4ddSXeyvsnUjsi4nEHtJbs3JCqm29fUHOUf8fif24rDnTzTy/JF6LCzoO2ViRA9ISaji2Vm+KyQ/i4agnCfMeX28Ka6Yz7SSOk5HH08Cb+5q3wN5h+0vDGyRmt1ghPU6tizFlH92r3a98UUSYpuiEAY2va9fPzl5+zOP84v1Xs94AE4OTum1tsaxpv7JLS5fS+rfB4L4VZc2MILab0Ykan0b+a+GbpiyVFCDQRzcuxa72Pb2bqUzXu0P2T/59YeoOuf5jJ/eI+AUbrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+khIAyvAiPEvMaZZ/EiJ+iqrEdghV5ApYljcaOwHe8=;
 b=itRRMn2ra0Qr3Xf40Qy8bOBtnB2JhXlH0yl85GxovyaXkEWRe4Xfcro58g5yd8EogVprXPPWRDKVxS8ErcsBd37HHIMyGs7+DICNkNcLrHJD7u9YW3wJgF23aIOv/CI0q9qpHpTVI1rSXm4YLlJDWE144mNC+4M6x7Mo2Nyb9RnBr54mkFjHrPQ4aq9PlBXN0LUcxK98mV97rDbLkTFhItttSQ1FMN+Kyw6ptgxTr2cPGksDCViwNo/XF+6xeB70YBFTDIMMc0GWvYtDLQ+E+Baq4ZmXuypz7qkQ0RXHVOKYFrUNpG0PvP0G1q/awnQs4ddxibIM6iKMDfUoPtcJ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+khIAyvAiPEvMaZZ/EiJ+iqrEdghV5ApYljcaOwHe8=;
 b=NhhOmijdLbv79yKMpM+xKSfmVB/U7nAQ6luEPvwB/BmXmDa1aTM4MTxC6P22F/ey2zzjGJhpaZJMt45NIn1k5NeJE3V2zp7u8kGGboMcuTV1GZFz2z0Ey8JHO6JrHi7OR0ACdYXQbxVcuJz9jK7Xd4zb/l3pY/yqqXr9m/BMGPoBU5obS9d1yYhpqXgTo9Av8MklhKLJ2B/jUOK8OMSJAhmJ5cI4A2Q8EQZnOHKTbcw1p2IJAC0SbhSqnyXLX/8/pVR0527Eidncy+ZZss1ZIP7uN2+qFb26rCWqJMzDLg2Vcw5FVSyluioCOLe2CsFtkIcxlUu1rwHo+JKm+yXh9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Thu, 1 May
 2025 12:59:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:59:13 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:25 +0900
Subject: [PATCH v2 07/21] gpu: nova-core: fix layout of NV_PMC_BOOT_0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-7-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0204.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 46056842-67a0-4c3d-d057-08dd88aff8cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1VkU1d3NGloZmRHYitrTlpMZWJiakNqbUF3Vk81QTNzTlZKTmNKaFcycElG?=
 =?utf-8?B?RXF5S2p0VTFsS3FXSXFIaTk1NUdpbXFURUpEUnp6d3c1ZUN5N0tUd3habFl1?=
 =?utf-8?B?clhCTFpzM3RTbFRzMytlakx1MitmQldJQlNVL1Zqd29LVEd5d0JZSnY5TUpw?=
 =?utf-8?B?Sm9ielVVcit4UXZZaWtXSXR6bVRsWWlwTHN1MG81R1BDRE5NZldOakpBV0Rp?=
 =?utf-8?B?b0c5b3RQMmRTbTlHUWNoZk5BZHkzN0owZG9BOHpkam16b3NZYkRNd3BJbTZQ?=
 =?utf-8?B?bGpCejZhd052MmphM3JHM2lmV3JWN21oNURaRXY0UHozZEE5dERyNDhuaFkw?=
 =?utf-8?B?OFNqTzUweTF4dktPV3RYY0hNVFVtQVRJTGIyRzBIaFFuS1VQY2g1Yi9Fbzk1?=
 =?utf-8?B?UWRWTlRuQ213Vm9ZMGIrVDVEemxXWVo5Y3JVRjFxQS83NVZTR0RidnU1QVMy?=
 =?utf-8?B?bk10SHUyYktobXJpdlBqUnVHeFNoVm9aVS8ySTRXUW5QU0xYWGZxQk5HTTdo?=
 =?utf-8?B?YlZMY3NhamxNSGlEd3c3UTlZUTNER3RGMFQvTWlSZjRWNW5GeUVEY3dTT1pI?=
 =?utf-8?B?VGlGSllvSzJmbll0WTFEc3JWZXVGakhsSjRVSXBYUkd5Nkw3cTlSYmhNK1pI?=
 =?utf-8?B?TVBhdGxCRE82TE1yUUxsN3hlNEFGV1VtcUJ1NmQ1ekNqMittc1hTTVl4TUNm?=
 =?utf-8?B?UWdna21kVDI3RERyRGhaSEcxZnlObGloZDM0S2RvbnAxWWZucVUwZG1UQkgx?=
 =?utf-8?B?MzhDQUZJaXRWQ1d4dG1NR0NoWjRxNG5nYlcvSE1Hb2VhbE5wb3RZSHVMdklC?=
 =?utf-8?B?dGM0WW1wU21qQUtEcXVsb01nY2Z3QVZsV0xkdnJVcHVLVXJ2OEpmcGxCRU9Y?=
 =?utf-8?B?Y1BGcHo4SUhVVEgvdm5EbVUrV0c0NzNjQ3pPNzMrQ2VUTXN0RGVzYmU3NFA5?=
 =?utf-8?B?M1JWcG1XdGxuSkFNeGZIenVQbkd2K1orVGlpeWdpMWR0KzB2V2RveU90L2Zz?=
 =?utf-8?B?RktpaUQ5QnVSL25wdGExTWtjOVBwYzMvMlV6Y3NoTFpRK2toTGc5bGowUWt6?=
 =?utf-8?B?TmdQekl0cDZ0aFkrVUZvNnhqcmRSdmZaYmlaU2Q5UEgvajRJS09ONGduSnFU?=
 =?utf-8?B?ZzJoSHlsVW1YTnZLaGdpVjVKcFNwcmNjd3BLc0w1MU1Gd3JmWEN3MFNpc3NK?=
 =?utf-8?B?VWJkV0M2VTBza3pOTWVHQjltNFYvNTZGdm82MlFaOFdDVXhoZzFrRFFZWjdI?=
 =?utf-8?B?Ym50aTJSSmhyWFU1WWovY3l1V1hKWlVjWVg3MkE0c2NLMkQ5TWRDRXhzZXJ3?=
 =?utf-8?B?Z1B5d3JvNDMrWTQzcDdpSHpRUjRoUDdSWE9wWitkNDU4U3lzbTdYOFVpblZj?=
 =?utf-8?B?d1R4MjdNeGthL0Z5cWNJVElzUnZRWUp1TmJwQWJhTE82RkswczEyL3RHd1Vu?=
 =?utf-8?B?cFFIU2dzRTZqRjI5WFU3YUg0NVIyMEgxZnRNVnZjM3luaXdPakR1dU5ManZX?=
 =?utf-8?B?N0pEelprSkRoTzlOSUNBekZKSWcwNzcxMnVUUXNTTVhQR3lnSmpJajdOcTZP?=
 =?utf-8?B?ekNQT3pqUlQ3Ylg5MmtpU05nd1d0Q3JET0JNUDB5NVllNmFtQlptMkVjbW9E?=
 =?utf-8?B?SWNzbVBCTlo1dFZ2Ukt4bXlNWVAwUmhkWGxKRS8xbFdCemtYUVpxRzIyeFdi?=
 =?utf-8?B?NzU4RWM2S0pkcUVSbzhMemlVQnJiRGQ1T0NTTFNqcVhGZmpFVTZIbnNpWnFO?=
 =?utf-8?B?THRvd2R0OXhKY3h2WWtISWU1UFR6bXhRcjlmdUJ3VmtCS05EeFdnSnVER0Mz?=
 =?utf-8?B?dHFSckFONUg5VjluOHlvVnpqbDBHOU8rVUM4eHNYNEhpelFuVkxoYVpDWEtn?=
 =?utf-8?B?cUZqZzBwdS9PMjhoUHNRVWxzc1V5VHdyUE1FN213OENwL2hLaHFPVGcxNmVh?=
 =?utf-8?B?RlR4enVvSmY3V1NwUVJnRy9XTUo1amRPQ01ldmF2cDhtRmI0SlIwdVFFWkxs?=
 =?utf-8?B?c2pjNkFMaFVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFJIRWF3c080QmduWlI2b3g5YVdNSk1hb1NENlQrRHgvb1VLSmFEWHozSjll?=
 =?utf-8?B?eUtmMXdGeDBDWU5WL0VXY0JqWWlHMlE0TnNhZUM4MlFBOGwyQ01ZMkE2WTVp?=
 =?utf-8?B?UDNXT2pXNWNYRnRPcTcrZWszanFQTTcvQkxjbCttZHhOeFdBS3ZSdGpYby9s?=
 =?utf-8?B?bUtlNDdnSzVCWjVNeTF3RkZmTmU0K2cxamExV3RqTWVRanVYRjF0T0hob0lx?=
 =?utf-8?B?NXJUOFNrSnRBcnBDVnEzcU1HMVJ4WGhVZG1lQkJmMGUvb00wbzVLdkt6Tndt?=
 =?utf-8?B?ZTdCaVRsR01yUjhjV1FNMDkvbEFzbVhnbCtaZ1EzcFVuQllLSDB5LzQ4V3Av?=
 =?utf-8?B?MUFlMENlQ21keEdZRmZJWm9iVDB0OVZBWFVweUM5RjhPbEphQlJVYnhQUmZM?=
 =?utf-8?B?M3hKSUNjbkdDNmRBdHJqQWZRS3ZpdmY3eTA0TmZjRlQzS1l3M2gvNTRqTGRy?=
 =?utf-8?B?YXVOK3lGakxJQXNyVFhFSXBLek44MTAvd1NzSWpQcjBOMGFyb1NLSTJiNWti?=
 =?utf-8?B?U2p5SjhSZGFsMTBrSGlobmdDMU5qdSt1TmNuUm12bUtONkhENi9lL1p5ZmYz?=
 =?utf-8?B?TTYxaVpXM1RmYjdWTG04TDZLZXFsTHFURUhtaFpKd3M0dUV4UHNZaVpXaVZP?=
 =?utf-8?B?T2dONFRPV3BxM2FNQlpyeTcxV05JMXZWVUZleFlUbmlDMHRuRVlTaWhDRitC?=
 =?utf-8?B?aUVYMmFaY2ZwdlJNYkpFTVcxeHBvOHBwSUg4dWE2NFFtS0NpcDhkS0xiVlJP?=
 =?utf-8?B?U3pLYmRROW9MeGlNRk1neHJQZjNldWNLMlBSN2tKNkdDbkFydXVTdDBsVDMv?=
 =?utf-8?B?STMzQlJtdjE4TmR0YjdBejVvOUo5MTlTZldWUHVWSE92eWVSaDlyN21TSGFN?=
 =?utf-8?B?UHhxOXRnV2wzaEw0UjBBZVRaazc0L1V2cU5nQnhtbWZuaGhJS29uNUNLcW4z?=
 =?utf-8?B?NmJVY3FBRVZmak40S0FZZ3JTKzdMY1ZtR1kwNFQzNkJuWlczaGlGZVhTMVVW?=
 =?utf-8?B?ZTNMN05jY0liNkVySi91RGZqbkpqcjUxQzNzcSt1NHNJSDczb2xUS0RqVkZM?=
 =?utf-8?B?MTVuVVlYM0xRMmtYZ1VHclIvUjFvRkNtand3Nm5kZEVObjdVcFJnc3A0OVlP?=
 =?utf-8?B?bk00ejQ1Z1FUK3E5QUtQTEhTUEx1cWI1VzdXWXhKRG5NL2l0UzJhekRWZE9V?=
 =?utf-8?B?NG9tNVo4RUZPRkhOaldad2pVYzJTajBYTXRzVi8xZXhBbnpsUEVNTWtsYVRv?=
 =?utf-8?B?ZzZ6TnRrMDZNWDA0SjZ4WjhUazBRQ0VlN1QyQUhRL3c1RDk0Zit1Y0JaZVNp?=
 =?utf-8?B?aTRwaHFtSjZWRWtPWlZqbXZWUzVUWWs3Vzh6RGtjRXJjdDlyNTRvZWJXOGVo?=
 =?utf-8?B?RE1tQ24wMWpQYThPY1NsVTBCVThHTnJjR3NoTi9FQkFHd2tSd0EveE5vZDN2?=
 =?utf-8?B?Z2NNeTRReVNEZ0dpUENSRldCaGxIclF6cGpORHoySGdCSWQ2L0g2OWdjbXJU?=
 =?utf-8?B?U2luV1pPWEpLSnB3MFRiZE13TDExS0w1L1ZlWTJTaWdQNm9VKzdET1dvYUQz?=
 =?utf-8?B?RkUvYUEwMFRXY3pEQ09wSWRUNWtFd0FzU2tNNnlML3d4K0Vmci8zaXpxVm91?=
 =?utf-8?B?TVFoOGNxUlRYMVh2UXpGQk5DbTdaNlBrSm5TUWtKbmYwcFNUdEZDQlV3ZG5v?=
 =?utf-8?B?ZXdwU3NvSVEweFN0bGp0VFFUVGNMY1hkWkk1UFdSTG8wMmpxdFZ3MXJvai9n?=
 =?utf-8?B?Mkk3UHFGMnNOZDBjVzcrR240ZXdnOXphUTY3Qms4WGhRNnZMRnAzNm1yMTFK?=
 =?utf-8?B?UnRVdGZWZG41ZVlGbXVrUWw5SWRkM2I2RkdZWFQ2U0lmaWgvMDdxU04zS25L?=
 =?utf-8?B?cVdzdFczWEtJUUs0N0dENVJFL1hZV0xzZFVibFRiUXJqUWF4TStUdjJMMW9V?=
 =?utf-8?B?dCsraHJCOCtYZEViWm5iRXJVQk5UQldQMm9ubGtWQ3JEVmZNN3BjdmRJTnZE?=
 =?utf-8?B?M253NnpJTzVWM3IyNDdzMmZzV29Sem5XM2tqWm0zMjl1SFJyeEdibzRYOU5Z?=
 =?utf-8?B?bUlTdVR6MitlQ2RUUENER215VHAzZXF2NXkrQVpoNU45RnpPb25VMUR2UVNU?=
 =?utf-8?B?Z25qUFVCMGIvVFhzTXpQT2hUSjJzb1hOM3VRcTJjc3dJMVNXWjJ3TVJRTk94?=
 =?utf-8?Q?Mw4h+EZ9VRS0EgNpgKyUOUKFgn2F+JJDwvdHywORMIJL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46056842-67a0-4c3d-d057-08dd88aff8cc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:59:13.2658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASzwNeKorDr2mF1bJijHldTx7kB8AK5vlFwuUvwkPpFFtsclqjt17ie9/FJy+DASTCm/QWL5Va3yc6p745QZmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442
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

The layout of NV_PMC_BOOT_0 has two small issues:

- The "chipset" field, while useful to identify a chip, is actually an
  aggregate of two distinct fields named "architecture" and
  "implementation".
- The "architecture" field is split, with its MSB being at a different
  location than the rest of its bits.

Redefine the register layout to match its actual definition as provided
by OpenRM and expose the fully-constructed "architecture" field through
our own "Architecture" type. The "chipset" pseudo-field is also useful
to have, so keep providing it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 19 ++++++++++++++++---
 drivers/gpu/nova-core/regs.rs | 26 ++++++++++++++++++++++++--
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index f95f095baa68c9f7ffe3b1e615548aac5c2a0c6c..64c38425098c19360a7c938f2b86a55ca3c48880 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -101,9 +101,22 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 /// Enum representation of the GPU generation.
 #[derive(fmt::Debug)]
 pub(crate) enum Architecture {
-    Turing,
-    Ampere,
-    Ada,
+    Turing = 0x16,
+    Ampere = 0x17,
+    Ada = 0x19,
+}
+
+impl TryFrom<u8> for Architecture {
+    type Error = Error;
+
+    fn try_from(value: u8) -> core::result::Result<Self, Self::Error> {
+        match value {
+            0x16 => Ok(Self::Turing),
+            0x17 => Ok(Self::Ampere),
+            0x19 => Ok(Self::Ada),
+            _ => Err(ENODEV),
+        }
+    }
 }
 
 pub(crate) struct Revision {
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 498fefb52f33bf01518f19d32287962f1fdc3224..bfb9555b203ff880c0fc373bb22e5ce6048015d4 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -4,15 +4,37 @@
 // but are mapped to types.
 #![allow(non_camel_case_types)]
 
+use kernel::error::Error;
+
 #[macro_use]
 mod macros;
 
-use crate::gpu::Chipset;
+use crate::gpu::{Architecture, Chipset};
 
 /* PMC */
 
 register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about the GPU" {
     3:0     minor_revision as u8, "Minor revision of the chip";
     7:4     major_revision as u8, "Major revision of the chip";
-    28:20   chipset as u32 ?=> Chipset, "Chipset model";
+    8:8     architecture_1 as u8, "MSB of the architecture";
+    23:20   implementation as u8, "Implementation version of the architecture";
+    28:24   architecture_0 as u8, "Lower bits of the architecture";
 });
+
+impl NV_PMC_BOOT_0 {
+    /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
+    pub(crate) fn architecture(self) -> Result<Architecture, Error> {
+        Architecture::try_from(
+            self.architecture_0() | (self.architecture_1() << Self::ARCHITECTURE_0.len()),
+        )
+    }
+
+    /// Combines `architecture` and `implementation` to obtain a code unique to the chipset.
+    pub(crate) fn chipset(self) -> Result<Chipset, Error> {
+        self.architecture()
+            .map(|arch| {
+                ((arch as u32) << Self::IMPLEMENTATION.len()) | self.implementation() as u32
+            })
+            .and_then(Chipset::try_from)
+    }
+}

-- 
2.49.0

