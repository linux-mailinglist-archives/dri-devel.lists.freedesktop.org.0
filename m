Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94900A6A75C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 14:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5C410E61A;
	Thu, 20 Mar 2025 13:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I+FdNdQM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AB910E610;
 Thu, 20 Mar 2025 13:39:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAZ66ZRvUeLVWv7HSnVAeIvEQZCq8nh2bHBWGtlJeIf3UmreGiQyb5mkI+hfdDgEOKEqCbkqFBRKqhMqUUCwT2mwnI4XzUlnNLN2/rvsPN1T+IG/teT9MzmyYetd0I9QppPDGpMSzx41xLafcne6zMQd1xDhsnNfUQ+FnrFF0ybAkI+Twq34n7oV8yIaRf2zOVO3MqVSCnf/TuXIT2n0tGqut4lcMR33h1guXMTDVC9gRnZjx+JnbyljGvx+QT2P5qPoFMKSh/cRXgSvyRFF5L+wpBqTQ97XpHaQXH0O/L2msvtI3QNygLOJkMJKhcSkmPFppP/XHm0vgSf1NUDk2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCQBLx8WT836KTNFDDoP+a0DEM1d07JXH6GXg0wps/s=;
 b=e+knSdZJ6CPe4DVEqxCM0OQ3+O/o2pDiiH++ga2x3JG90A4L0IWuWVU46Cguu5It1nkxx5zGTt+2q7H+yxN/d9stSQCb9Esx1fX9aGZfbNa2FNXcv2iY9tBob+1NK3xTfwZm6c7aRppcAvXUJxDUzBDfnGVWJCsyJN6vQVCotlX32WP0zfofa3lwO97HjE/Kki2wlXlFT8mOhsW72Ihr2TUcR+W7rAzVrFDEWxd/MVumCRDFRhEX/P9STsv2R9Td8xTichyWf79OKt/BDxyKNgzHRE6ttiAj1hexBicFDjlygAb4IOn6J8u+8Xk4fmcvJ5XLKwjGfCMc24qyy9wC4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCQBLx8WT836KTNFDDoP+a0DEM1d07JXH6GXg0wps/s=;
 b=I+FdNdQMDdjcrPa4OKYDpnUpeWKaY9Aznyerj2Jiakb0qUE/aJfUNghXbGeK/Dj2neU54R2Tq+snWsFKD5pDQwbmVqfnzBZWcgEhnSbqGUeq9vaquak1DcaJ9pqs91be3Ty7/lRifPJuO39FUDHaR6vpCiXAXxtJ1+JImV8MLza64OrnnWCYYGBk7HEjzj6Mt5jG7BinnkZAwkEVM+N2ddkfBfeVGOM4Lez2ZVIO3lku/RuX9PO0NnAceH5KTFtKpl0iBFqMq+EbsP0mkib77LrJTVSHTPAx4VV1hoIdy2C6pS1lUUR/sD0U6d4UEbEtqbkPJwj3vOscG622zRWaVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6409.namprd12.prod.outlook.com (2603:10b6:208:38b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 13:39:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 13:39:42 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 20 Mar 2025 22:39:11 +0900
Subject: [PATCH RFC v3 3/7] gpu: nova-core: derive useful traits for
 Chipset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-nova_timer-v3-3-79aa2ad25a79@nvidia.com>
References: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
In-Reply-To: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0320.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: 464a6e35-d37e-4f13-8251-08dd67b4ab22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEcvQngxb1B1cng4Z29rMkU4QlpFaXZPeXYzcEZXR2l6OUE5Q2hoc3hSUGVS?=
 =?utf-8?B?eVN4RldyT0VKZm53cmxkWGNIOGF0SFU3bFR3S2dzNzRCQlR5YzdtV2tDWUVP?=
 =?utf-8?B?bHB4RG11WGU2amFEV0Rza1JYdGRLOVpVRmdjaWgyVVhZK0JBeE16WVkreVhV?=
 =?utf-8?B?RlZnTDZNanJPRjlXUzkyVUpJdmVWSy81TTN5QVcrZlFZOTVHaEpncTBjUmZi?=
 =?utf-8?B?RytwT1lrbjBBRGJMblNJOTZkb0RVazhCN0FERXYreG00TGNjTUZUSWY0aGhN?=
 =?utf-8?B?b1czTjNwMHlWUzVIOTRuQ3U1cEwwa0dTVWp4VVNFbFNRZTdCd0xsYnBXTGJZ?=
 =?utf-8?B?VWFkbENJbnVBSHFyU20vZllaQjFuWE9mVFp6aUpORVgrdER0US8xUzRFTkN1?=
 =?utf-8?B?ZHN6WVJhRC9lNXIvVXJzOU5YWFE3cFFwWUVxLzVDY1lpOHIzcHEweU1mQ1M1?=
 =?utf-8?B?ejJoZnNNSWRMSmQyTnhVVHBCamJYM1NPN0E4SUpQN0YxNXMvdWZoWkdyL04y?=
 =?utf-8?B?OXZOcWNveU5CazlWOGxxZGNSTGM2N0RHak01STFOeFN5ZjB1NHdZdCt1bldX?=
 =?utf-8?B?T253bWFZNU4wZ3h5L3NpYWNhNEZuQ1R3OCtORTNWaUI5cmk3R1VFcXkvRSs1?=
 =?utf-8?B?dFBqMVZXcWViZlV4YXp2WUtLenVhazc0OG1zcnFxVUJUTUp4R0xiN2tORkd1?=
 =?utf-8?B?eGNrN1dRSU5vNkp2d21aalk3WGUzclM2ejdRc1pvUGZzMm1YZWMvRDdzaFBw?=
 =?utf-8?B?Y2dsZTFyZWJXa0lHL01QSkYzQkJNeXZOcUZDNHcxY2QwUHVRMVBBUXFkUEw1?=
 =?utf-8?B?U0xrOWJuTzczajRwZVlmaEQ4RzhnSTFEOFBhcC9mKzNmZ2NpaHdGU1RLUUpV?=
 =?utf-8?B?T2pDWmY2U0cxRnVKa0hTTVhKOHFSQ21ZT0Z4SVpjM0U5YTNralQrQzVrRlNz?=
 =?utf-8?B?U2IrQWFZQXdkeEpDdlVtc0s3SlhCK0IzSGtYWEh6U3N5SWlxbXRBZEZQcmVU?=
 =?utf-8?B?TXp0QXR5K0JENFRZNTNnRzdEL3o5UFhLellabU5OelczYlZhQ0hzQ0NkQS9F?=
 =?utf-8?B?Rm1SaXdkMk54Q0dVUVlnQTM2TDZXL1Q4Nlhnbmo2MzcxalZMYVgwazNWQTAr?=
 =?utf-8?B?MnhZTGV3cDVEM2MyUzkybndXaGV0dEdVR21yMk1NdnZXQThEVGN1d3FGVUhJ?=
 =?utf-8?B?TVVFQ25TaCtqZmpYUm8xanVSTnIwMWVMVlR1OU92bzRIYXNRcXdSelAzV3JM?=
 =?utf-8?B?UmcyeCsvRUovTXRPa3dRQjcyTUxSK1B1TmdWbkdNa29lQ3k1bDZxb2poMzky?=
 =?utf-8?B?L0hoYlE5dit1dU0weTB3TWN0bHM1bWhaV2laa1dHbzNKQ1V1c1lFVE5WZDYw?=
 =?utf-8?B?WldYUXUyd3ladmxaeitNdkp6VnNvYU5hOEU0QzBCYkg3N0FQYmtWL2REWU90?=
 =?utf-8?B?cUN3OXhtQnA0czJuOTRSVk1aSXlWOHdtZmdOYUU2d051dEpVaW5GNmNSajNk?=
 =?utf-8?B?aHBtazUxSk1nTjk0K0Zxb2x1enRBS3FySGJ0clBoM0JCQnB0OThLbTlqL25a?=
 =?utf-8?B?cHIrTlRxVEZVWlVJaTExRDFBRjZ1MVdNdm5yeWI0NjhBL3NneEl5WllCMi9t?=
 =?utf-8?B?NmVIU3dyNXE5R0twK1FZZVBlckU1VEx5YUh2UGI5Z04rQzliaG9mODJPU0xQ?=
 =?utf-8?B?M0Ziam5HTFdlczVCN3RvYzNRQVIrdUlyb3NDb0xVR0JJMzM5cXBQRkxTZkJk?=
 =?utf-8?B?K1hPdjlFMjRNaTZ4bzZCQk44ZmhiYzlCSzQ5K0xJcnFxNXphZ24yM0ZOT0ZQ?=
 =?utf-8?B?VHpmVWdtbHhRRHVTT2ZXQjdkMStncXdoeXdLanIxMXpTcXJnNjFHbEZEZUsr?=
 =?utf-8?B?ckFUcjMvQWg0bUY4YVlrNzlMVmhQWmozU3dCK2ZBUU1BQmQyS1NnUVlwVm9r?=
 =?utf-8?Q?ELpdHB3i8Zc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGZHQUs4Z1hlNlZyaFZ0TlF4bGVuVTduSzNsR2dTbzhPMWRqdGZRSnNtNDdV?=
 =?utf-8?B?M0ZXaVhPQ2xRRUFabWZEajR0ZGMzWHlJbWE4WFhZbEw2S2p0OXZYeHZtZlh4?=
 =?utf-8?B?c3ExRk56NDNkOC9La1BwTlB1N1R6U1hpR1F0QzdBUHBCU2habnY4YytXR2FQ?=
 =?utf-8?B?cDdYS3dLSGJHTjZwOThVOVpzMjhoYjFFMjhWd09palFPWkVtbEs0TzVzNjE3?=
 =?utf-8?B?Slc4UDZxU0FDaGlKKys3TXpqTnltdGpHa1R6MHRVc1RQemRLVUJxaWpnSzhQ?=
 =?utf-8?B?OTA2bE4zVnRpV3BQMEpUY3NJRk55YW9qM0Zma01nT01YUnVjQ3MyNllEUEVt?=
 =?utf-8?B?NStXNXdCRWJ3Z1gxWHFHSEFQeHIzWC8zTWxwS01ZWXdtbGlUSC8vM3BnM0Vo?=
 =?utf-8?B?bEtKRk9XbFZkVU5GV3E1dCtIZWhzeDVRUWpHSHlVc0Frck5OQ1MweGtIYXVl?=
 =?utf-8?B?dUQ0Rlo0eFEzZXJHbkNJRHhCTTlibzNYaDF4OUtXQ1JsbkdwaE4vRE9vOVVW?=
 =?utf-8?B?Y1Vma1BRaUVxd1kzVTJYdDhvcEFNZzVJMzVZaFExOXc0emQ1b2V1QmdaakdP?=
 =?utf-8?B?RHgvdlFhdGNta1d3cTlHS3UvaERWSE5sbnBRaU5HS2hOaStkU1ptWE1QZ09S?=
 =?utf-8?B?SFVxOWR0cW5OeC9lU3Jyam1wOUcvOTY2Z1NtZVhhcmk2bkM1UWtqQlJYV0VF?=
 =?utf-8?B?YjBMNTB3Rk1BZ1FOUFNxYTVxNDIxc1JkOHorYVJQNmJjNVhYREtBZmVKYjVk?=
 =?utf-8?B?djRONDdZdVJnbUp6WjhMUTN3L3U0eWl4Y2VTaFd3WkdtYUtWT2ZwSUYwNEo3?=
 =?utf-8?B?N1FEWmRpMHh0dTJnZnI0Y05qWitHcWZNZVpiR0EwWmtRNHliTndodGFUMHFT?=
 =?utf-8?B?cG9ucU0rWkJvdkwrWWV0RUQ3M1MyTU1zS3NYRS9wN0FQK2Mwc1JDQlFkOURH?=
 =?utf-8?B?YW50WVdqLzREaW5tRkJUWFdqcEgySlJ3cCtrWFJ6S1ZDM1luTHlxMmtsblBU?=
 =?utf-8?B?clh6bk0zT2Rma3dCdktQL1dzS0VIcTlwcGMzcDBlQWUrcWlzSlNQQXF6U0hB?=
 =?utf-8?B?S0hObDB0MU5CaVhFeHpzcSthWjlWbkVualAxcEpQcFpsMjA1dkFKanlWcVJO?=
 =?utf-8?B?Tmh3WTZZb3Vwc3orTjAxbTdzbEpFLzJQc1puWFd3QW9ZTWhkdk5pV2Z0eFJG?=
 =?utf-8?B?cG43MjFsOHNUS3hLVldOYi9FT3pQNTVhWm5DL3FyellIUld6TzlaNkV0Q0l1?=
 =?utf-8?B?ejF1NFl1NGlaMzNvcmMxeG1Sczg2bk5jL1pIc3NrVUI3bk85SmJ6K2lwUHdO?=
 =?utf-8?B?RnlGUnl4UmhFME44bDFkcTdYUHlMNTRvWEVoY2xycndhMTNBK3o5ZWd6aUtt?=
 =?utf-8?B?UlJhUmNOQm1xVFdaYVliamVoTGRrNFl1eStyQ3hQMWVXQkcxWDRoQ1FzM2pN?=
 =?utf-8?B?cTRzL3ZGQ0UzSnNQZmpJanNzaFJOencxOGlST0ZVQVFSZCtKemd1T0tDOUpx?=
 =?utf-8?B?NENKM004MUJRSEFsQWNzWThNWmZER2ZxdEtHR2ZGSkxGNVFaQXQvdm90Wlhz?=
 =?utf-8?B?VnZJV3JnWkVNNW9lSUk0TmxkaTkzWVp2cUk2SWl3amxwNzRMMU81RU5HY1JM?=
 =?utf-8?B?cDNtL0JaSnhXMHkzNmtaUEpXMDM0Nm4xU3NiZGgwNjNyakpKaVlRb09FUHNI?=
 =?utf-8?B?NVJtdVZqZCtnOE56VC9KcGZ3MmliaVE2akNZcjJkM1VvQ3IyM1BLS29GZ21V?=
 =?utf-8?B?WTNLRVhENWdSaVlLTGYyalcwcjdBRzA0SFh1YVBhV3BtTGpZVWRLUHh0bU9Y?=
 =?utf-8?B?V2FaWmNweldpeGE3TDFQd1h4Z1o0ak1MQlo5V25VRlRObGVITGpmUkE4bkRQ?=
 =?utf-8?B?Qnh5SVVBNWs2ZlkzeWRObk45SnowUjNrSm1Nb1V6M29xcGNuWjZiUWtzMXpF?=
 =?utf-8?B?bVAwNnZubnFZUkVEWGxXUTQwQ2F2STNjUGExbHAwMzlrZys0TWsxRHZBTC9C?=
 =?utf-8?B?RkNlM3hzTUdHM3c3Uy9UUEU2V0cxbUpKdlpoSlVja2gyWGxoczVBZzFHNVkv?=
 =?utf-8?B?a2VTZkU1R01ERUNDRGFLYkRrU1pyVE90aWtRcUFTTEVtTFJPcUhMWDJZeGJZ?=
 =?utf-8?B?VU84MnA5enZ0QVV6Z3pmeFhSSHNrSzFoLzlYVCtSd2MxQVFDblh3TzNOYkc3?=
 =?utf-8?Q?L1uDMxeGhSLnkqxe6sSNTzbhd8at/2FP+zZjIgHncmrX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 464a6e35-d37e-4f13-8251-08dd67b4ab22
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 13:39:42.0599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RavFzI6PpXfbfcbZyYMp13jtlxiY/M5neqL4TdpMxTYavxbeRieyQkQWuIS9cYV15Zjxwwfbn+SdzHy3/yeEZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6409
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

We will commonly need to compare chipset versions, so derive the
ordering traits to make that possible. Also derive Copy and Clone since
Chipsets are as cheap as an integer.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 17c9660da45034762edaa78e372d8821144cdeb7..4de67a2dc16302c00530026156d7264cbc7e5b32 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -13,7 +13,7 @@ macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
     {
         /// Enum representation of the GPU chipset.
-        #[derive(fmt::Debug)]
+        #[derive(fmt::Debug, Copy, Clone, PartialOrd, Ord, PartialEq, Eq)]
         pub(crate) enum Chipset {
             $($variant = $value),*,
         }

-- 
2.48.1

