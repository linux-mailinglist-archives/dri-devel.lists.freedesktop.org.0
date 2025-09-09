Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0839CB4FECF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391E710E78F;
	Tue,  9 Sep 2025 14:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NEEqDrgC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AF310E783;
 Tue,  9 Sep 2025 14:07:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjGFyye3TtKG4AQ+VFR4xPJZyU892Yk0nOuuy2naA951+6SEB23rZT12pvLNxDNp+V9sH/xc0WsuCaRC74mvFntHPXzthNdNhOFRC87K10aJslrNsUPF1WLwzBSpDxsRdTsKXOUNL9tk3DkT1b0ILSSaiviI3zyQvzdqvG4YZxk6wIlTQDtq+nH6+RHK+HU0q5H8lVu2VO6v0aUDKwIp74Yu08w6A5NBdSyHG/QP6KHWyHcNEtJrOELcAJTYB/b9yKNdQQ8b2cGKn+Ns0ckjpqOi6hpu1Jbc9RZBlUob3syVRMHAIO7VXhh8gkUYQsaqBPdwacwEy1Vn0VoGiEqBtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oh+MCP3875MldYSxvdo5/05LFIajcMliS+dvWdaVfr0=;
 b=TDG+IeIstKA1p2PhUOCQ3UD34BfxWhP64skX27jkaAqq7dIXhSi3Q2farVxJ0sbo4UGzMuVcBR5UgimhUJkToeUp7PL3tNw3DuOwze/FMPT3c0ZwWutiMaVMiY6xKNOjv31hMdw9+Vg6Scu6M9/yRBkDfoK8NSWpS564sb2s1R6QIITMPLqOmNDnnZzmo/zqIj2ql7w6vcqMBnUNbz2dBwQoeVk7GACS1gKuLqT4d+/RNTiesRoDCjHgu3292/EiTTi8H6VTSv2btTddkF0Xe3J4f5QZMGJimgR37LS+PQqzTGr6cMpemzH3Ea0Cpdtz6B5WUhXcSj/F4qOTDPsHFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oh+MCP3875MldYSxvdo5/05LFIajcMliS+dvWdaVfr0=;
 b=NEEqDrgCmhiX71HZ1XUB26uMf2kPgkTFKKozrOWhKXk6yzTpGnfRRHQDAGQqInsI5OhsE1pPn9UUBIeUe1yC4J1EomaoeYx8lvycDrDkENV5qzUlHV2UGKD1MkBbSabaqkJUTZpohdwW0Epi9yEnhfp3nVvilIWic73CxOyfeFDoazw92IW2LgF/Wig0kOLNst4CARTmNUIuzHYWpU7/08AocRMupl7afTe4ew7wSc+PUg8wNlFTe1y7Ib8nWwOLf9RCZIRLVnvko9E0o/cCQoJ8sddYPLTnCENajCeUhEGa6olRLsCIyFgZ1KxH+znHTn3/Jyntb+tDSTuK1G7KFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8653.namprd12.prod.outlook.com (2603:10b6:930:c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 14:07:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 14:07:15 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 09 Sep 2025 23:06:44 +0900
Subject: [PATCH v4 08/11] gpu: nova-core: firmware: process the GSP bootloader
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-nova_firmware-v4-8-4dcb433d5fee@nvidia.com>
References: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
In-Reply-To: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0034.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8653:EE_
X-MS-Office365-Filtering-Correlation-Id: 19fe684a-a32d-428f-886d-08ddefaa2e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ME56emh5OTZSeEtMeXVCWXE0MWV3R015ZllWeVNSSG93Y3lvemllSSszL2F3?=
 =?utf-8?B?aHhuSVJZa2JBZjhPREQ4aktjYmprcUp2enBQQkN2V3h3SUxBZVdGS2NmVVhI?=
 =?utf-8?B?QU5OOVV3Wm5WQWlBWk5ERmswQ2psNFkvREQvenZEc1BLeitkeldwaVVlT3VI?=
 =?utf-8?B?ekFiOFZyelRNcjh1N0lScXVOK3l1b3F2QlRKenlFUGM5UDRUeW5sQ1d3Tzhu?=
 =?utf-8?B?a01ERlFYb1cyejlwdlc4VmU5YlZaMno5akVWN05CNHJTTUczVi9YL3JWOExY?=
 =?utf-8?B?WDhMa0Jpb0R1aTR0ZmhYZ1Q2NitWVDV2K3ArWE5rZmxveHpOdjhyOHQ4bnBO?=
 =?utf-8?B?Um1qY3hya0JLbFpMZkxWS1Z1UVZtVXF5cFAwQXRIL0RwOElreTR5TndwWXVx?=
 =?utf-8?B?VnhHWGx4SjM1UC9vRWpBS2NxOTVxRHBnTlBiSU0vOUVPUGZ2SEozZmV3Q3dN?=
 =?utf-8?B?ZThpQVhTVGJPTEZuTlJCT3p0b3ErRURiK1JWWWNERlZrdnVGRjQ2T3loZzF5?=
 =?utf-8?B?K3IvZlQyL0pPa1ZKMmkxWUVFZ3FMTGRyNFRQQUhsL2twMXAzdDcwR3NFSytr?=
 =?utf-8?B?V1NXL2J6c08ranBoT2NKR0JlL0NvNVRLTkV3LzRlQ2x3eVFNWllycW80eVo3?=
 =?utf-8?B?QUhwOU5TYmhSSUUyWGJ2dnFvZjdCeWU1SzgxTFhJN0JzaXZmSlBaZ0F6dFFp?=
 =?utf-8?B?YUFyR3FORDcwdnZsamhLUjZqd25jbHhSWkJJMUFpN0o1eGVCenlsaUFkZ1po?=
 =?utf-8?B?eXl4dy9weVZ1WHB5VGhWUmZnWFdNcDA2SkZTVmZVM0xHdExUQkp0YlJybGww?=
 =?utf-8?B?MUcvcFpGWjM3b3JFUzhGZFRjako3QVBtMUx3d3V2dU9VWGNHSUxUcFVLcnYv?=
 =?utf-8?B?czRraXVxTHE3T3MvbTFRV0N2WjN1YkFtVkJrUTlQNzR3YTdrN3Rka2VjaVh6?=
 =?utf-8?B?ZDVvYTZCaXQ0VVNiM0FveUFiUlZDSlIzM3Vka2hyMS9Xb2FxODczVHoySFFv?=
 =?utf-8?B?czdUSzBLaUVRaVNwT1NsMy9RdzlUTFBaczhPZU5LaGl5VkdhM0RnM2lrRzhC?=
 =?utf-8?B?Zlhlc3RHRHlzbVk3TjYyaVhDUmhlR1puKzROZ3BGOW91THFycWJQZzBrMVVV?=
 =?utf-8?B?ODI2ajZ6OGxPYkRMSks0UndQZmFMZ1h3ekg1cjhHelZSaWJWenhzZE9PdjJ1?=
 =?utf-8?B?SXY0K2xPTjYvQ01NRHNHQnN3T2V2dStqUGNaYXE3Uk41cVlhdVBFeWdpVEQw?=
 =?utf-8?B?d3d6YVlRU2VKMk9NRnFTT1dVVWhRM3dESFZ1cmkvZlZEdlhhcklHY250c0lL?=
 =?utf-8?B?R2t3QjNYRkhOd25MWVJBTjVmS0tMOTJXWXJvOTljNWt3SURZNnpXSnEwaW8w?=
 =?utf-8?B?U3FoQWtGR09NZkhFZ2ZMRmJSZjFYR0kzSEVnY3ViZ1VEa2tnaHlqSC9oRXdK?=
 =?utf-8?B?V1Z1Sm5VUUxyVDZ1UFRXdkRJbnVrZ1g4Y0NMRTMyVVdmQmg3TFg1YkpWamNH?=
 =?utf-8?B?U3JaQXE0cURSUEEvREs3RGtOeFRpTUV1bytqMVp6MUxzS2dnSStNa01TYnVN?=
 =?utf-8?B?RGlSMURHK2lXZlpQbDE2b1FsdE1PdzJwZmJwS2JoZmk5aDZ0KzY0NENlVzZa?=
 =?utf-8?B?S3ZPbG00MWp6czNKZjUvWjFKSlZZYmNQanNZMk03ZGhOM3BBd1dTVkVFWXB3?=
 =?utf-8?B?dTJtOVJkWU9JNlh2SGZCL0VxSFA5YUNKTTR5TUFxNXZ1clAzNFYwTlNLVkgz?=
 =?utf-8?B?anI0cWZuSHp3d2tRRERlL1Z4bkhiekZVVXdBakVFb2FDZUo3OTVINTNibEZH?=
 =?utf-8?B?N3V1NG9YM0xSTk1Od2pHL0RUYVQvSjh2eCs1MVk0eVBJZzg1aDBPcW5nWElV?=
 =?utf-8?B?QmM0TXI0NGxFcHlJajFNbDdvOXdHdWNKbnhoTGZEZmpZd05VWVRobXhOZDBV?=
 =?utf-8?B?WFlLelp4YUpnNUFzdHQvYXBDeWliSjQ2NzVuSzNVSi9jWlljalhYNWVvZ2dh?=
 =?utf-8?B?ZUM4KzVVRElBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RERRZ1lBL1FkeVlzL3BZTzY4bzJMUitMVWNzNlNvTUQ1cDE1WHlQaE05ejU2?=
 =?utf-8?B?bU5RQ2V3RjNsbFNWY3ZKUFplMUp3VTRSMVFTV0pPWVdhU0p1YUw0emVuTFNQ?=
 =?utf-8?B?dUEvTjNtdnRqZU1RRnJuSnlUSi9taDFzVkZQMXdFYzRmb2N3dTZTVTFRQjJR?=
 =?utf-8?B?RVhmaXpXWHZzNTJCeVUyMHRXcmtQaVB1Q3pyNHZnNkswd1UybFM2Z1ZjSGha?=
 =?utf-8?B?a013OFhWKytKUTU5cngwUHFCc3F0ZTFackNKakJvelNUcVBFMkovc3pRSkdK?=
 =?utf-8?B?RHIzZnlKRVZVZW5maGcvZWtWSjk0Y0Q0S0RHVkZwayswUEpWV3pZdGlnR0xS?=
 =?utf-8?B?SjkrUjI0TFZhNmYxdzA4cmx0T2VUQjBDdUpvVGk0MHVSUTFCQzEzN05HVDhn?=
 =?utf-8?B?MnYzUEtjcjBYdnJBR1luSDVpOFpWQWxaYjZQbVN5blpvS2g2REFtOFNsWlUv?=
 =?utf-8?B?ZVY2VU8rOG5jVlZQeGhsRnd0REhETEFPY2RNR1pQVFg3dmpFNHpyallaSzlm?=
 =?utf-8?B?SFZaTTdjTVkyYnlSK3dmZy9TUFMrNGxURTJITmNnUHdGK0NYWURjblhaY3N1?=
 =?utf-8?B?YUh3Y3VhSTcrNGZ4UVN6ZGN6c3lEdHVNZ0lOUlB5L1NMbWRHWlNlUnp6Y2gw?=
 =?utf-8?B?MXpTYm5lajVVeXlHVWpsME9OQjd5ZUdldnhJS2hBcndudHRDZ0lIQ2E5TFlw?=
 =?utf-8?B?UHJmU2hqZ01ER3k4SWJwYXlrU0NSS01qUU53bUJoOEdwaFNQU3FINStIRUhw?=
 =?utf-8?B?TXZMdE5qVi9rcUNib0FTandhT3Y5QmhtMVZoUVVOandIdUovd1o4Y3lUTWlI?=
 =?utf-8?B?L3VZczNwL3N1cXlFN3BpNmZkZWxjUklVMVNqenJEb2VxWFJ1bkt5dW84VXAy?=
 =?utf-8?B?U2d3QkYycHJ1aFlKM2xZbTRqTmV1VEZ3bzBmaWNaYXhVYlVoaWtlUlVrRVNp?=
 =?utf-8?B?Q0JtTzFpU2VDQzJCUENUNVlQRENGWk1FdjVzVDFuRHArTzVVTHlKTVpINlV1?=
 =?utf-8?B?UWdyWEJyelFoRmVpN2lhdFF6cXUyTUVrQ0dXWmh4bzJqUDNlQmJTMm43Uk1t?=
 =?utf-8?B?cTZUNGUwSml2YXViWkZMTmwyQXdac3dUUVBrZFlXeXhHWGZWVDduN2NyM0VS?=
 =?utf-8?B?OExaaStaYUpGT0ZIVGgwMjBCYWJxTW9LbEtJQm5OY0pvcGdkc0xOczlWTkVC?=
 =?utf-8?B?R1VwOUF0NmV6SWJ0WXJVWENYVUpidGxGVVpBYmI4SFJrQXJzSVQzc3VUa3hy?=
 =?utf-8?B?aUY5ODAwQi9sYzNUOGExNUVKSXBUWlNsR0ZBS2RhQndkZi81dFdZMVVnc2N2?=
 =?utf-8?B?QUhaTm82UktMempJUzhWc3VPWEUrSUU5QkNHeUk4cmRFQ090cytGRVZyZVdv?=
 =?utf-8?B?YTJjOU5iS1pzS3RCWWNEcDRxY0ZPY044amluQThWYUszQ0FGWjRrRDR2RENa?=
 =?utf-8?B?a1R0Y09tYm1OS0NrZlA0akhtZkJTUlpkTFgrYkpHMjI4cGFPNVBZL044cUl3?=
 =?utf-8?B?Y2kwM1ZMZVE2T1FmZmxXY1R1dWZ1VWt2Z2p6V2ZDTkZyU2lUSUYyQTd1SW5D?=
 =?utf-8?B?S2VwYUw1WjdhSDdzN3hnU2l5VlpRZFVaeFFRTUZsZTFNNENMaTdqQ1RndFdX?=
 =?utf-8?B?czAzZklHR1dxS29vbC9PdWtnM2g4L0ZsbzQ5dXJXSXd4M0pCRXpFYkgzM1Qx?=
 =?utf-8?B?SFJSdkEwN3Z4elJVYzV0RThIazhyYWcyZlphSHlKQVZrY3BBREp5cTFON0Q2?=
 =?utf-8?B?aUpLUVlaVGF5ODc3K2pTVTBhTDkwQy9iN0kxaFRXS29TZHNFL2tlaU56cXdx?=
 =?utf-8?B?am5RS2Z5WWZkT1hueXI5YUlRbXVtUm0rYjY4anNFaHU0V1NSVEV1QzhvNkc5?=
 =?utf-8?B?WGozS244L2E5b2hXRzVpN3NCZGdWQ0JGZ01nQWcyYVgvbXp3ODgwN1Mwb0lX?=
 =?utf-8?B?Uk9HSlJMY2tsQTFleUhzbklRYXpLck05T0l5T1ZjaXlrTStkSDk3ZVpLcWdB?=
 =?utf-8?B?bEppLzZNT2lvd2NiejhTa3BSc0tBWnNRR0JrSWRwQjRTQVZtN3lob0FQRkhz?=
 =?utf-8?B?RFJxTnVlWUFvSTVPR282d0krdU84ZmNaeEpDK1J6ek5JSW5GQ0IrY1p4MkJ4?=
 =?utf-8?B?QnhHdms1bWRINkZKTmZaUzQ2WlE2NGVTSUVXSWNBQzlhNHlmbmt6VnJTVCtV?=
 =?utf-8?Q?mZznjhZaEmbVAcNQ/wu7nxNIJco+dq74e9X5N0XyM+xQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19fe684a-a32d-428f-886d-08ddefaa2e51
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 14:07:15.8553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gm0ZSFuMS7ohyVpJUs0GKDIDBebWObn/dOa765/ggx6byE3c3EHXPz+B8Qzjhm4pTpGiF/sVdCf15DaLp+CstA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8653
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

The GSP bootloader is a small RISC-V firmware that is loaded by Booter
onto the GSP core and is in charge of loading, validating, and starting
the actual GSP firmware.

It is a regular binary firmware file containing a specific header.
Create a type holding the DMA-mapped firmware as well as useful
information extracted from the header, and hook it into our firmware
structure for later use.

The GSP bootloader is stored into the `GspFirmware` structure, since it
is part of the GSP firmware package. This makes the `Firmware` structure
empty, so remove it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs       | 18 +------
 drivers/gpu/nova-core/firmware/gsp.rs   |  7 +++
 drivers/gpu/nova-core/firmware/riscv.rs | 89 +++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs            |  5 +-
 4 files changed, 98 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index cef910a7c2dc360139fafc2a01a050a9df40e45f..af7356a14def2ee92c3285878ea4de64eb48d344 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -15,11 +15,11 @@
 use crate::dma::DmaObject;
 use crate::falcon::FalconFirmware;
 use crate::gpu;
-use crate::gpu::Chipset;
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
+pub(crate) mod riscv;
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
@@ -36,22 +36,6 @@ fn request_nv_firmware(
         .and_then(|path| firmware::Firmware::request(&path, dev))
 }
 
-/// Structure encapsulating the firmware blobs required for the GPU to operate.
-#[expect(dead_code)]
-pub(crate) struct Firmware {
-    bootloader: firmware::Firmware,
-}
-
-impl Firmware {
-    pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<Firmware> {
-        let request = |name| request_nv_firmware(dev, chipset, name, ver);
-
-        Ok(Firmware {
-            bootloader: request("bootloader")?,
-        })
-    }
-}
-
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone)]
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 9242e8ef6a0183cbfe5e75a3d6552ff528a2cedc..d25a21b42fc8b3987c861965e6ea56d929570b70 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -7,6 +7,7 @@
 use kernel::scatterlist::{Owned, SGTable};
 
 use crate::dma::DmaObject;
+use crate::firmware::riscv::RiscvFirmware;
 use crate::gpu::{Architecture, Chipset};
 use crate::gsp::GSP_PAGE_SIZE;
 
@@ -127,6 +128,8 @@ pub(crate) struct GspFirmware {
     pub size: usize,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
     signatures: DmaObject,
+    /// GSP bootloader, verifies the GSP firmware before loading and running it.
+    bootloader: RiscvFirmware,
 }
 
 impl GspFirmware {
@@ -160,6 +163,9 @@ pub(crate) fn new<'a, 'b>(
             })
             .map_err(|_| ENOMEM)?;
 
+        let bl = super::request_nv_firmware(dev, chipset, "bootloader", ver)?;
+        let bootloader = RiscvFirmware::new(dev, &bl)?;
+
         Ok(try_pin_init!(Self {
             fw <- SGTable::new(dev, fw_vvec, DataDirection::ToDevice, GFP_KERNEL),
             level2 <- {
@@ -202,6 +208,7 @@ pub(crate) fn new<'a, 'b>(
             },
             size,
             signatures,
+            bootloader,
         }))
     }
 
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
new file mode 100644
index 0000000000000000000000000000000000000000..b7eef29956995c49ab1466bb6a71a756731bf78a
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for firmware binaries designed to run on a RISC-V core. Such firmwares files have a
+//! dedicated header.
+
+use kernel::device;
+use kernel::firmware::Firmware;
+use kernel::prelude::*;
+use kernel::transmute::FromBytes;
+
+use crate::dma::DmaObject;
+use crate::firmware::BinFirmware;
+
+/// Descriptor for microcode running on a RISC-V core.
+#[repr(C)]
+#[derive(Debug)]
+struct RmRiscvUCodeDesc {
+    version: u32,
+    bootloader_offset: u32,
+    bootloader_size: u32,
+    bootloader_param_offset: u32,
+    bootloader_param_size: u32,
+    riscv_elf_offset: u32,
+    riscv_elf_size: u32,
+    app_version: u32,
+    manifest_offset: u32,
+    manifest_size: u32,
+    monitor_data_offset: u32,
+    monitor_data_size: u32,
+    monitor_code_offset: u32,
+    monitor_code_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for RmRiscvUCodeDesc {}
+
+impl RmRiscvUCodeDesc {
+    /// Interprets the header of `bin_fw` as a [`RmRiscvUCodeDesc`] and returns it.
+    ///
+    /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
+    fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
+        let offset = bin_fw.hdr.header_offset as usize;
+
+        bin_fw
+            .fw
+            .get(offset..offset + size_of::<Self>())
+            .and_then(Self::from_bytes_copy)
+            .ok_or(EINVAL)
+    }
+}
+
+/// A parsed firmware for a RISC-V core, ready to be loaded and run.
+#[expect(unused)]
+pub(crate) struct RiscvFirmware {
+    /// Offset at which the code starts in the firmware image.
+    code_offset: u32,
+    /// Offset at which the data starts in the firmware image.
+    data_offset: u32,
+    /// Offset at which the manifest starts in the firmware image.
+    manifest_offset: u32,
+    /// Application version.
+    app_version: u32,
+    /// Device-mapped firmware image.
+    ucode: DmaObject,
+}
+
+impl RiscvFirmware {
+    /// Parses the RISC-V firmware image contained in `fw`.
+    pub(crate) fn new(dev: &device::Device<device::Bound>, fw: &Firmware) -> Result<Self> {
+        let bin_fw = BinFirmware::new(fw)?;
+
+        let riscv_desc = RmRiscvUCodeDesc::new(&bin_fw)?;
+
+        let ucode = {
+            let start = bin_fw.hdr.data_offset as usize;
+            let len = bin_fw.hdr.data_size as usize;
+
+            DmaObject::from_data(dev, fw.data().get(start..start + len).ok_or(EINVAL)?)?
+        };
+
+        Ok(Self {
+            ucode,
+            code_offset: riscv_desc.monitor_code_offset,
+            data_offset: riscv_desc.monitor_data_offset,
+            manifest_offset: riscv_desc.manifest_offset,
+            app_version: riscv_desc.app_version,
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 562ad162863fdad9275cb813d0586d074dae2c4f..52b856cdb2934ba1585ceec12fd9a219dc0034e0 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -9,7 +9,7 @@
 use crate::firmware::booter::{BooterFirmware, BooterKind};
 use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
 use crate::firmware::gsp::GspFirmware;
-use crate::firmware::{Firmware, FIRMWARE_VERSION};
+use crate::firmware::FIRMWARE_VERSION;
 use crate::gfw;
 use crate::regs;
 use crate::vbios::Vbios;
@@ -179,7 +179,6 @@ pub(crate) struct Gpu {
     spec: Spec,
     /// MMIO mapping of PCI BAR 0
     bar: Arc<Devres<Bar0>>,
-    fw: Firmware,
     /// System memory page required for flushing all pending GPU-side memory writes done through
     /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory-barrier operation).
     sysmem_flush: SysmemFlush,
@@ -311,7 +310,6 @@ pub(crate) fn new(
     ) -> Result<impl PinInit<Self>> {
         let bar = devres_bar.access(pdev.as_ref())?;
         let spec = Spec::new(bar)?;
-        let fw = Firmware::new(pdev.as_ref(), spec.chipset, FIRMWARE_VERSION)?;
 
         dev_info!(
             pdev.as_ref(),
@@ -343,7 +341,6 @@ pub(crate) fn new(
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
-            fw,
             sysmem_flush,
             gsp_falcon,
             sec2_falcon,

-- 
2.51.0

