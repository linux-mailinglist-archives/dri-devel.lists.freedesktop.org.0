Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9C6B52F30
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4276C10EAA2;
	Thu, 11 Sep 2025 11:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CaCHga0c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2042.outbound.protection.outlook.com [40.107.96.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1372210EA93;
 Thu, 11 Sep 2025 11:05:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LtzZWEUnDpbrRfM+cAiCcqvOM/wjik2IjUehu9iyepTEG2x78j8EiH5ameML6EiuRE8Ws0MVEFq2bAgV9nLIAe/pLeO9D7TbYLZk7hiDVzSVu7ckZKO1NTohOWTYoBekyAjHezGbzUN4sPnDxCPwc3Twk/1bCi5lLTeSP4ZYxHoh+tU/VcOS6GLegiULmFUX6AEEfYWpo0fh00tbJ6fwSHgCRCVxCCQUzppsgM6KKuQZhMhtbAJ3hDFYCcyD8SydJ/AVVb0LefbEptxOnblvqM9jbVFIznir7oB/NGj30w9lmgSL+AqM5MDSsEPggH1i1LYayaOtkhR9MbVIeD6EeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2H8d2tcInkEVS4CC7ZdGIV9NPm2mXQ0V/LMKJifMmM=;
 b=TbH2eNGFISNyvW7mreSofqf82Qm0ySvOfs/YSrDfP9uy6WTFtsqzGGjQt6btRCIj4NnxZtzd+8lOLocjweInjui6kfJjVRKj3yRw3F+hWi4QFgcNOYbB4aRPvrjUMxY4iRysBOolCirBA5YbH9Ld5W2pOFZDcLOYahYWBHbrSuCvMU/udhPiUFp5kWNQeJajnk+koDVmQx0C9qwxRfl58gs4dJWl895cbkX91lepVOXTQgvgg/oTe2aUZC8yt5KHtTgAz5cNRgTtHjumgoKxrBd7/vwtDRoE/mBCj0g4490ZC8z37kN+4mKszDd/fFhGdW9xBaDoABF1KdHZYkrWGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2H8d2tcInkEVS4CC7ZdGIV9NPm2mXQ0V/LMKJifMmM=;
 b=CaCHga0cEmzMTUOlYqpbeMIDfHJao53cFG5J9vU9dlJGcxu24abjsT7KTgFMMD2vOnEXQix6ZB4U+xLKNO9kornRnVBaPSbAYKCI7/S0Ns6eqt+fSFTfYrvyR9unZ5Az7N68TTzTzmp4G7/5ZYyZc2+f3DuzaFvqudWuHHzGzkqtJa/8lZO8BgUWbrN0OZNiLgBiUzmi9Y/1eNIzn/Xc72Aer/wxHgFsY+uPuD1AA4JQARiDGoYKt/tVcJRq4aUQghp4tY0J4z9MnNkbCIIaJNv+o6+4a6+xBiynPviWOlLxKaPrSwnmZFxMKuR62JacBaw3SVCUnjS2iS2m2Q086Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH8PR12MB9840.namprd12.prod.outlook.com (2603:10b6:610:271::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:05:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:05:05 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 11 Sep 2025 20:04:33 +0900
Subject: [PATCH v5 08/12] gpu: nova-core: firmware: process and prepare the
 GSP firmware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-nova_firmware-v5-8-5a8a33bddca1@nvidia.com>
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
In-Reply-To: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:405:1::32) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH8PR12MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ba7a50-b129-471b-8d24-08ddf1230d2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akpxTmFEdjlvcWhqVzJCSjZLZXR1bWRkN2hubTVHWDJqNHl6ZXlGTmpqOEFC?=
 =?utf-8?B?dUd1U1VEUGVxSWNCTVlEV2RqOHBZN3NRbjdoMUN4L1NzUXZZWStXZWFhNGhG?=
 =?utf-8?B?N0JRSmZlK1BSS0FyVE9FTUhzNXNaUTMzYUlraUJyVG1DZEdqVmZHSUNwd3pa?=
 =?utf-8?B?aU9Sc0QvWjBvOWxBQVlHVElxbUwycUxVNEJKQlMvTVdYSmM1SGppS0J0VW8w?=
 =?utf-8?B?Wkp0U2tyTHRIak02YW9RemY0MXVaK08rVjdXa2E0RTdUenZTM09hK2ZzbGpy?=
 =?utf-8?B?SFlOWEdTVm53MDE3S2hnbUNNUmo1Yk5FamlZWGVlM29hNTlXbCtSMFlxZ0Ux?=
 =?utf-8?B?VXdNV0w4MzdmWDJrcjUxK242SFRwVkREUzB6RzFtamk5bmJvUTUwOGRhZ05P?=
 =?utf-8?B?d0dLL2U3KzNoZkJPb3grVHRKb3RqQ3Z3UHlMUzc0eE5xV3RhM3JhMTNqY25I?=
 =?utf-8?B?TjYzRzhNQlRlQUcrNEdjWTdmRThhbkFJMkc4cGE1ek9UTzBNQzM5a3FJSWR5?=
 =?utf-8?B?NzQwWEhndlRGc1JXNlNna3YzdGtVUm01NzJ4elNaZzBDdzBnQXorUXlETDcw?=
 =?utf-8?B?UHRRMXNyTTVLa3B2ZjFUb0VMMTFackVGSXpORE1Pc09HR0IyWGlKWjFsVTlw?=
 =?utf-8?B?SkZ0S2Q5Vlp6ZGg0U0s0NFRwRkRSSDAzY1hiZUlCZ0RESUZxaldvemx6TnRY?=
 =?utf-8?B?NzRkMklCalMvU1FLTWMrUVRleFZFOUxzMVdmdzd0QXZFKzlLbXBqcUxBbFor?=
 =?utf-8?B?bFJ6eDF3QUNYUzNQQm5HRUxKeFRNS0NqZ040ZmExcFZWRzdLVXpQL0xBSHlw?=
 =?utf-8?B?TSt6VFNseVp5SStCbzZjR0ZHR0M0VGtUVm94blRUbjEzdUY3bVBROGxFTVVo?=
 =?utf-8?B?MHZJcUVoclV5MHJiV0VFdWVDR3V5M3pFSm5ZL2lCYmtUVmZrSUdJYmwyMFAy?=
 =?utf-8?B?Q1B2ZjFRdU5sR0JwdUk5NSsyQWoyL2VJR3E5NW0xRUlvenFHL25HTU5hU2Fo?=
 =?utf-8?B?TUpTRC9ycXhoQkZDdTBFRmJJQ3puQ1F6ZllSV1prL0dFdXAzYlVsN1ZDNkVw?=
 =?utf-8?B?a0ZoYWJNVnJCRnpuNXpoZi9tY1g2VTJZQnVzbHRkTmcxcnlSUktlK2dvd3Z3?=
 =?utf-8?B?UjcxSGtVd091dmNNaiswZzhIcFBOMWFVRHd6YzI3Yjc2aVJaYVBUV2tINm1N?=
 =?utf-8?B?N1dVYU1vOTNHTldReGNMdm1CR09FdEpqWk90NkczMkR5bDRlVFQ2bjYzMDh3?=
 =?utf-8?B?TkMwMWFmYlJheTJ3dnpKbC9aNlI3Q3V4UlpiTzhucHNrNDFPTmRHRTU4T0tJ?=
 =?utf-8?B?RlNSMXpJTVNKbUxLTkxVYUo1aTFFRnlFMVphN0tXZTVtSFJHdlRnUVF4cXlD?=
 =?utf-8?B?UlRqd0t5TkJMUWdQNlc4cDRTODg2SkhYSW8rRWlYN1lrakxmY0Y0R2lvb0xi?=
 =?utf-8?B?K0ViRVNUTTZCaHpYVFo1cVVCWE5malFvS2hWUUlkZ1MrNWZveDFCellZeERU?=
 =?utf-8?B?UnBEdUg3MVUwLzF3dUFYZjRqWmpDQ2V6UWo3cWVkQVNYbVFTMWsrYkRSVnNT?=
 =?utf-8?B?U3NnOGJNYitobUpmNytDZHNHYlAralVVWDQ2bjNPYmdIUksyUjVHaUxBeDh4?=
 =?utf-8?B?REVLU1lKdGJRY1NlZWk1OHE0cHZlUjUyRU1JME1SZUEwSGdRd1JCcjBhT24v?=
 =?utf-8?B?aDBhV2xVVWEzaG1qREtzV0dyQ25GOUJNbVR6LzV5MC9GM3Bwazd2NC83WElv?=
 =?utf-8?B?TjZnRFM5QzU1VHJ6UmdGQ3FCNzRsSlFmRVlwUFg0S3J4TUtiQ2NYVVBGbTNQ?=
 =?utf-8?B?cVhqZFRuUllYQnQ1UVR5RUZwWDZVS1pWdS9HUEpyWTZwWGVFRXVWRmlIUk1i?=
 =?utf-8?B?cVZ0TmxndGo5YWYyRldyODVKZHd2T09iVHJGUFBGeGI4L1BhamdzaHAxVUlq?=
 =?utf-8?B?KzVzbXlNSDljYkUzSGJzT1l3cEZwUXZtT0NyOWFPY3lmTXMrUFB1b09keGRB?=
 =?utf-8?B?b2xPempEMitBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzVLN1J1YWdhMXlpdmE5QVFjbzZ6Sm1KSi9OejBaeTVXRGtNNGIxeGgwcjQz?=
 =?utf-8?B?dUxBVEtVdXFXYmZpOTYxUytZeUNZVHdpTkVmd0tPWWxPb3l2QlV3MlNZajk2?=
 =?utf-8?B?QnRpRE9hMTZQMUMvQnV3Y0Urci9zN1RXLzFpQ2RsdTQ0aWE5Qm1GanNZc1lH?=
 =?utf-8?B?TDlITnNKOUFCbzNnSDJpU0dtczBUTkkxelNhK0ljZysrODU0alI2cVdKcHpX?=
 =?utf-8?B?OG1UUExyMm9VamQ2eFM1Ry9PTkZlbVM3WWU3MmZHSDNoN1I1RFF4WVIzV3FZ?=
 =?utf-8?B?bnozVDVzTmRKQSs1SDBmc2tFcGMyRno2ZTZQdXNJMFNVTGJUOTU0WXRSN1J6?=
 =?utf-8?B?bVFwTHBHYmNvQVNRVDM5YkZLQzhUSHdXdnpReitrQTFpaU5CcnYxeXBKMEpx?=
 =?utf-8?B?OCsyb0wzeUtIQ3BWdnMvRXhYSnd2cyt0U0RBWHlHWE5KSVZ1eGM4YXNxRGN4?=
 =?utf-8?B?ck1EamZIQXVGSHE3bUtMbXRpUVVITmlkQ3NWZm9sOUh0RFFydndXTFpxRTh0?=
 =?utf-8?B?U2J2UWJIaVZ1TE5xaWxJOTY3NlNGSXRvSkhmdjlDM1pTazM5QjdJbGhiOVpi?=
 =?utf-8?B?QmdUYnZMRS9DbWRQb2hJb0RZQUNhRmpwSzFxVDdXc002RStpaHRxMDdiR3NZ?=
 =?utf-8?B?bmlEd05YMXNxaFhTM21GN2V6aVR4T2tvWUJEK0JRQVMwcGZwWG5KdjFBRk5D?=
 =?utf-8?B?bkNIZllkYjR2WnZ6emdOY0drQlBxNFVlbkF2SzI2VWhHd0pzdUo0VjZDeVZa?=
 =?utf-8?B?Sjh2NUZ6WUp5Y05GVXpMRlZMb1BpNXREUFZYaW00OW4rYW9rcWFLSVdaWjdU?=
 =?utf-8?B?RlFYRExocDBxMDNaYVVheXZycXAyOGZFc0FaS2paL2F2am12YWxGMjY5Z0JR?=
 =?utf-8?B?T0hGdS85QzB4enIvUlBUZlNkVG1uK042aGE1TlJWQ2dZNW1uNFNSREtPczBF?=
 =?utf-8?B?NFFrUnpPRjZXWWZGUWhuOS9NSDF2aGROUXdMbXlsS1JveGMrc2lKbFFCWlVK?=
 =?utf-8?B?Unc4Mnl6N2VTYlVCdk96NS9vNWt2c3ZYWktDcUR0VW9ZNkYwZldIT0U3d3pt?=
 =?utf-8?B?SHpvTGQ0ZVNueGJzeWhIcmtxd0xBVi9IaUo0Q2tFQzFNR2tkRlJod2NOM2ww?=
 =?utf-8?B?QVB6b01vdm9nZDlMWFdQY2RUSUoxTEJUT0JDdEtyZGQxeE56RFR0U0dWV0FU?=
 =?utf-8?B?V3ZjdStiai9MZ2w5TjNTMHpWUnZpRml4Zmpvd2J2UDQ3T3BwNEhWcklMQXJ1?=
 =?utf-8?B?Mmc4NkhWQVZacjZjT0tUTDgvZDh4UXBaZU1FNERpaGR2a2V6SFo4dE4rZDZY?=
 =?utf-8?B?enFjSkZ6Z1NZQ3Q4VXFCYkNyU1hjZlVDT3hyY2lSNjFYZkxkZkY5QUJZREhV?=
 =?utf-8?B?RFdlT1FGM1Y4UVF3cWEyQ2ZHaXFyM2NweTR0anhBWHJDemJDQmFmcXRDOE0z?=
 =?utf-8?B?dTJZWkREdmRDREhIWjd6OU1jd1BobUFTQ2EyVnhLRlhYaFlsalRmenhzZmh0?=
 =?utf-8?B?T2FwenFzaWFIblk3WjZibU00cncvcWwrcUdueHZuMWJLbmRsQmRqUVlEaFFC?=
 =?utf-8?B?L2Rnb2lua2Ixb1NuRmNBVEFRbnZyY3hQSk43dXNxR3pHUzNESWE4OEdVYnpP?=
 =?utf-8?B?VnRJNHlLVzd1aVNtOGNNYXB1dUkwSnBUYStVVXhlZE4zY0xPazI1UVd0M2dz?=
 =?utf-8?B?MEhSWjF4elNabHpvWVN6Z2crT2cxa3FBdTIwZXR4Zm90Ym9BZ2VQYk4zaVE4?=
 =?utf-8?B?OWk4eUQyTjRqQ2cyY3pmcWlQQlZsUEg0TzZlZXJLeFlLc0NKQ3h0cDkvYlBI?=
 =?utf-8?B?UWNMU1lzTUkrR3FQMGt6dGRmdjdXdXlMTVNqMTBMdXdVNDJxbnM4QXBmaDlt?=
 =?utf-8?B?MmhYLy9sdUpleVpBRDQ2S3pIcmtrRVNOZGVZSm5MdUZUaU9wbVIwamZoN01k?=
 =?utf-8?B?SWFuVTB2aW1jOU15Skc1THZ5cGgxNkFkdEJhK2hWRHZ0NThsL2hCZVQ5T3VV?=
 =?utf-8?B?QnRNQStEWUc1Yko1VFJRTW1Yd2xJd3FtQm52MHEyaUNsZmpCYU0ydWZzWmNF?=
 =?utf-8?B?am5mbnpDR2hVV2F2K1hEZmk4ZUpOUnNieXVLOTd3R2JoaUxQTTYxbTNkeU45?=
 =?utf-8?B?Q3Nxa1lJUlhvbFo1bFlEelhOQTIyWkRCdzBHbFBnWmEyNDNIaXNsRVJVR201?=
 =?utf-8?Q?fTWFZ7ArU7sESSrUzmJ+a+XTj5INyeCqGqlDvWYdR4sD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ba7a50-b129-471b-8d24-08ddf1230d2c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:05:00.5175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5YOCR8l37M2tgI2JX3+KYgcetOoY/Z35b5+tBZai6BFhSxkxU4haj95I0Ur4kFzgmi4hk371WRTphUOUmztgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9840
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

The GSP firmware is a binary blob that is verified, loaded, and run by
the GSP bootloader. Its presentation is a bit peculiar as the GSP
bootloader expects to be given a DMA address to a 3-levels page table
mapping the GSP firmware at address 0 of its own address space.

Prepare such a structure containing the DMA-mapped firmware as well as
the DMA-mapped page tables, and a way to obtain the DMA handle of the
level 0 page table.

Then, move the GSP firmware instance from the `Firmware` struct to the
`start_gsp` method since it doesn't need to be kept after the GSP is
booted.

As we are performing the required ELF section parsing and radix3 page
table building, remove these items from the TODO file.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst  |  17 ---
 drivers/gpu/nova-core/firmware.rs     |   3 +-
 drivers/gpu/nova-core/firmware/gsp.rs | 232 ++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs          |   6 +
 drivers/gpu/nova-core/gsp.rs          |   4 +
 drivers/gpu/nova-core/nova_core.rs    |   1 +
 6 files changed, 244 insertions(+), 19 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 89431fec9041b1f35cc55799c91f48dc6bc918eb..0972cb905f7ae64dfbaef4808276757319009e9c 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -229,23 +229,6 @@ Rust abstraction for debugfs APIs.
 GPU (general)
 =============
 
-Parse firmware headers
-----------------------
-
-Parse ELF headers from the firmware files loaded from the filesystem.
-
-| Reference: ELF utils
-| Complexity: Beginner
-| Contact: Abdiel Janulgue
-
-Build radix3 page table
------------------------
-
-Build the radix3 page table to map the firmware.
-
-| Complexity: Intermediate
-| Contact: Abdiel Janulgue
-
 Initial Devinit support
 -----------------------
 
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index d954b1e98fda82c44f87d2103e31fa717c392d79..cef910a7c2dc360139fafc2a01a050a9df40e45f 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -19,6 +19,7 @@
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
+pub(crate) mod gsp;
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
@@ -39,7 +40,6 @@ fn request_nv_firmware(
 #[expect(dead_code)]
 pub(crate) struct Firmware {
     bootloader: firmware::Firmware,
-    gsp: firmware::Firmware,
 }
 
 impl Firmware {
@@ -48,7 +48,6 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<F
 
         Ok(Firmware {
             bootloader: request("bootloader")?,
-            gsp: request("gsp")?,
         })
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..9242e8ef6a0183cbfe5e75a3d6552ff528a2cedc
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::device;
+use kernel::dma::{DataDirection, DmaAddress};
+use kernel::kvec;
+use kernel::prelude::*;
+use kernel::scatterlist::{Owned, SGTable};
+
+use crate::dma::DmaObject;
+use crate::gpu::{Architecture, Chipset};
+use crate::gsp::GSP_PAGE_SIZE;
+
+/// Ad-hoc and temporary module to extract sections from ELF images.
+///
+/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
+/// to specific and related bits of data. Future firmware versions are scheduled to move away from
+/// that scheme before nova-core becomes stable, which means this module will eventually be
+/// removed.
+mod elf {
+    use kernel::bindings;
+    use kernel::str::CStr;
+    use kernel::transmute::FromBytes;
+
+    /// Newtype to provide a [`FromBytes`] implementation.
+    #[repr(transparent)]
+    struct Elf64Hdr(bindings::elf64_hdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64Hdr {}
+
+    #[repr(transparent)]
+    struct Elf64SHdr(bindings::elf64_shdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64SHdr {}
+
+    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
+    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
+        let hdr = &elf
+            .get(0..size_of::<bindings::elf64_hdr>())
+            .and_then(Elf64Hdr::from_bytes)?
+            .0;
+
+        // Get all the section headers.
+        let mut shdr = {
+            let shdr_num = usize::from(hdr.e_shnum);
+            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
+            let shdr_end = shdr_num
+                .checked_mul(size_of::<Elf64SHdr>())
+                .and_then(|v| v.checked_add(shdr_start))?;
+
+            elf.get(shdr_start..shdr_end)
+                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
+        };
+
+        // Get the strings table.
+        let strhdr = shdr
+            .clone()
+            .nth(usize::from(hdr.e_shstrndx))
+            .and_then(Elf64SHdr::from_bytes)?;
+
+        // Find the section which name matches `name` and return it.
+        shdr.find(|&sh| {
+            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
+                return false;
+            };
+
+            let Some(name_idx) = strhdr
+                .0
+                .sh_offset
+                .checked_add(u64::from(hdr.0.sh_name))
+                .and_then(|idx| usize::try_from(idx).ok())
+            else {
+                return false;
+            };
+
+            // Get the start of the name.
+            elf.get(name_idx..)
+                // Stop at the first `0`.
+                .and_then(|nstr| nstr.get(0..=nstr.iter().position(|b| *b == 0)?))
+                // Convert into CStr. This should never fail because of the line above.
+                .and_then(|nstr| CStr::from_bytes_with_nul(nstr).ok())
+                // Convert into str.
+                .and_then(|c_str| c_str.to_str().ok())
+                // Check that the name matches.
+                .map(|str| str == name)
+                .unwrap_or(false)
+        })
+        // Return the slice containing the section.
+        .and_then(|sh| {
+            let hdr = Elf64SHdr::from_bytes(sh)?;
+            let start = usize::try_from(hdr.0.sh_offset).ok()?;
+            let end = usize::try_from(hdr.0.sh_size)
+                .ok()
+                .and_then(|sh_size| start.checked_add(sh_size))?;
+
+            elf.get(start..end)
+        })
+    }
+}
+
+/// GSP firmware with 3-level radix page tables for the GSP bootloader.
+///
+/// The bootloader expects firmware to be mapped starting at address 0 in GSP's virtual address
+/// space:
+///
+/// ```text
+/// Level 0:  1 page, 1 entry         -> points to first level 1 page
+/// Level 1:  Multiple pages/entries  -> each entry points to a level 2 page
+/// Level 2:  Multiple pages/entries  -> each entry points to a firmware page
+/// ```
+///
+/// Each page is 4KB, each entry is 8 bytes (64-bit DMA address).
+/// Also known as "Radix3" firmware.
+#[pin_data]
+pub(crate) struct GspFirmware {
+    /// The GSP firmware inside a [`VVec`], device-mapped via a SG table.
+    #[pin]
+    fw: SGTable<Owned<VVec<u8>>>,
+    /// Level 2 page table whose entries contain DMA addresses of firmware pages.
+    #[pin]
+    level2: SGTable<Owned<VVec<u8>>>,
+    /// Level 1 page table whose entries contain DMA addresses of level 2 pages.
+    #[pin]
+    level1: SGTable<Owned<VVec<u8>>>,
+    /// Level 0 page table (single 4KB page) with one entry: DMA address of first level 1 page.
+    level0: DmaObject,
+    /// Size in bytes of the firmware contained in [`Self::fw`].
+    pub size: usize,
+    /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
+    signatures: DmaObject,
+}
+
+impl GspFirmware {
+    /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
+    /// tables expected by the GSP bootloader to load it.
+    pub(crate) fn new<'a, 'b>(
+        dev: &'a device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &'b str,
+    ) -> Result<impl PinInit<Self, Error> + 'a> {
+        let fw = super::request_nv_firmware(dev, chipset, "gsp", ver)?;
+
+        let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
+
+        let sigs_section = match chipset.arch() {
+            Architecture::Ampere => ".fwsignature_ga10x",
+            _ => return Err(ENOTSUPP),
+        };
+        let signatures = elf::elf64_section(fw.data(), sigs_section)
+            .ok_or(EINVAL)
+            .and_then(|data| DmaObject::from_data(dev, data))?;
+
+        let size = fw_section.len();
+
+        // Move the firmware into a vmalloc'd vector and map it into the device address
+        // space.
+        let fw_vvec = VVec::with_capacity(fw_section.len(), GFP_KERNEL)
+            .and_then(|mut v| {
+                v.extend_from_slice(fw_section, GFP_KERNEL)?;
+                Ok(v)
+            })
+            .map_err(|_| ENOMEM)?;
+
+        Ok(try_pin_init!(Self {
+            fw <- SGTable::new(dev, fw_vvec, DataDirection::ToDevice, GFP_KERNEL),
+            level2 <- {
+                // Allocate the level 2 page table, map the firmware onto it, and map it into the
+                // device address space.
+                VVec::<u8>::with_capacity(
+                    fw.iter().count() * core::mem::size_of::<u64>(),
+                    GFP_KERNEL,
+                )
+                .map_err(|_| ENOMEM)
+                .and_then(|level2| map_into_lvl(&fw, level2))
+                .map(|level2| SGTable::new(dev, level2, DataDirection::ToDevice, GFP_KERNEL))?
+            },
+            level1 <- {
+                // Allocate the level 1 page table, map the level 2 page table onto it, and map it
+                // into the device address space.
+                VVec::<u8>::with_capacity(
+                    level2.iter().count() * core::mem::size_of::<u64>(),
+                    GFP_KERNEL,
+                )
+                .map_err(|_| ENOMEM)
+                .and_then(|level1| map_into_lvl(&level2, level1))
+                .map(|level1| SGTable::new(dev, level1, DataDirection::ToDevice, GFP_KERNEL))?
+            },
+            level0: {
+                // Allocate the level 0 page table as a device-visible DMA object, and map the
+                // level 1 page table onto it.
+
+                // Level 0 page table data.
+                let mut level0_data = kvec![0u8; GSP_PAGE_SIZE]?;
+
+                // Fill level 1 page entry.
+                #[allow(clippy::useless_conversion)]
+                let level1_entry = u64::from(level1.iter().next().unwrap().dma_address());
+                let dst = &mut level0_data[..size_of_val(&level1_entry)];
+                dst.copy_from_slice(&level1_entry.to_le_bytes());
+
+                // Turn the level0 page table into a [`DmaObject`].
+                DmaObject::from_data(dev, &level0_data)?
+            },
+            size,
+            signatures,
+        }))
+    }
+
+    #[expect(unused)]
+    /// Returns the DMA handle of the radix3 level 0 page table.
+    pub(crate) fn radix3_dma_handle(&self) -> DmaAddress {
+        self.level0.dma_handle()
+    }
+}
+
+/// Build a page table from a scatter-gather list.
+///
+/// Takes each DMA-mapped region from `sg_table` and writes page table entries
+/// for all 4KB pages within that region. For example, a 16KB SG entry becomes
+/// 4 consecutive page table entries.
+fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) -> Result<VVec<u8>> {
+    for sg_entry in sg_table.iter() {
+        // Number of pages we need to map.
+        let num_pages = (sg_entry.dma_len() as usize).div_ceil(GSP_PAGE_SIZE);
+
+        for i in 0..num_pages {
+            let entry = sg_entry.dma_address() + (i as u64 * GSP_PAGE_SIZE as u64);
+            dst.extend_from_slice(&entry.to_le_bytes(), GFP_KERNEL)?;
+        }
+    }
+
+    Ok(dst)
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 06a7ee8f4195759fb55ad483852724bb1ab46793..8505ee81c43e7628d1f099aff285244f8908c633 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -8,6 +8,7 @@
 use crate::fb::SysmemFlush;
 use crate::firmware::booter::{BooterFirmware, BooterKind};
 use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
+use crate::firmware::gsp::GspFirmware;
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
 use crate::regs;
@@ -285,6 +286,11 @@ pub(crate) fn start_gsp(
 
         let bios = Vbios::new(dev, bar)?;
 
+        let _gsp_fw = KBox::pin_init(
+            GspFirmware::new(dev, chipset, FIRMWARE_VERSION)?,
+            GFP_KERNEL,
+        )?;
+
         let fb_layout = FbLayout::new(chipset, bar)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a0e7ec5f6c9c959d57540b3ebf4b782f2e002b08
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -0,0 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
+
+pub(crate) const GSP_PAGE_SHIFT: usize = 12;
+pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index cb2bbb30cba142265b354c9acf70349a6e40759e..fffcaee2249fe6cd7f55a7291c1e44be42e791d9 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -9,6 +9,7 @@
 mod firmware;
 mod gfw;
 mod gpu;
+mod gsp;
 mod regs;
 mod util;
 mod vbios;

-- 
2.51.0

