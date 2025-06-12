Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830CFAD7318
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09AE10E86D;
	Thu, 12 Jun 2025 14:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LSvvJBe7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4326C10E86B;
 Thu, 12 Jun 2025 14:03:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGoU5J4eGsPm0QowAr03EdVqgH4lKKFN8nAlcsBDhqqtSmIBodBPAe4GRXlwFOfw4w8V982uasXalYun1KHYIvdAgcjnXWPjwwXMjEWQEUMDlgWMook41iFEcqgj0fsLpQ1+ydN4X1iHWXTJVDAh5fg64WwYj/KqYmtDbYP+VjK03PTbbAFdXAR+WqNTT9Ssyw1YztAn4oMSc8EbYpgUZgjqex9OGAFpSGBkNg49eNM2f9ZGi7jLpJGbo5lJYrGQpefGXRg+VgDNvEkTvogxAuPDz7LegpNddzk8fKtk0tCF3ZKnEJeXE/Zou67vWVnbUBZCzP7Spvwg+X190A/Mng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cn71A6BMUxf7/gDSfzp168xz4mUjAEkJ+8fgfbnL82U=;
 b=xoBRSjVG1Z05haF3ZmSH6HfcZP08NfgnvnpwXcIEGCW0R1OKeIn9DRqZVEymBtgU8I+8cFU2J5vfnDtlSFnPxkCLHQLcAcUES2kOtRBY/Gb/A47nnHSJT8uPmhNH4CnvJ3MWhBdxdJ0+P4I4xjPUuIhg+DK2KvxX/GXLhkeGkUNQQz85Gn9c1X16DCzDKSW9YojD3rjKBKrsTBd7NRiLl0q9Ip2cp+uf17oy+oKfvsXgjxsi6sN6gnhylqvI2wU1NF69ryCxr4ocSVPeuiluxN0E3RPMh90EZssYxy09yo1ruTHMHZACBfxFdmW2CV5W3zHnf0yYxodrvPDjJpn0Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cn71A6BMUxf7/gDSfzp168xz4mUjAEkJ+8fgfbnL82U=;
 b=LSvvJBe7pCVSxnyTRSxVuK1jq4gMm1VNGtjCi2EG6PDUg920yhTdlhuWR2vInYahRVKGL8PcPzbOf/yRITDeqxGOCxcTUbupTnMwRJ1NSTP+h79zanKbudg2O11enQwQnvZjVUWkiqthj5NUBOi1MCjHnlDY7Lrny8pz/UTbJ3GI1iOPcXxr/S9HEiJJXYDokRA9ICisU4KxKO1xcJO/W2hmbnp3i3Q+CqX3CXSqVSyvxXeNhlaKzlbGN2QHEPZoFuib0uGW+BP+PEbBiLdvAnttvXRLlP1rbOAhAKCiddzqAzIgEKCjqtfVXNsGRHfbI+6M1rCe7ypGIoS9eY4DNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8598.namprd12.prod.outlook.com (2603:10b6:806:253::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Thu, 12 Jun
 2025 14:03:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:03:41 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:49 +0900
Subject: [PATCH v5 21/23] gpu: nova-core: add types for patching firmware
 binaries
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-21-14ba7eaf166b@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0326.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: ca282fea-423d-40cf-8a6b-08dda9b9efab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0ZjdzdkOW0vaFF4V3Y4NDVxeHJGTHdUN0FiTVdQT1k0OVJlUE8yM09sNFd0?=
 =?utf-8?B?UVJMQkZWUHFlNlV1aG5mTkRnSmFWK0ZaQXdOOXMzdHRFZ0c3ekJRMHRmNmpu?=
 =?utf-8?B?ZVdaYThQam1ISmFwUUI4YldDRW1PTFRPOEpFMERKMnpxdWNBSzYrOG9KWDIy?=
 =?utf-8?B?blRWMG4zZHVqN09xVkpFYm1vZXJERU1OZ01RMHQrMXRPSStoa3JzNlUxQUxX?=
 =?utf-8?B?NDZTZU53WmQwZWpPUUtiS0Q1L0FxUnRtRUZxZXo5TFJlL1I3U2R1WDgxMWhV?=
 =?utf-8?B?OE1xS0t1WUtrR2lqbFhlRVJBVEZwMiswZWlFZzRNYzh2ZENYQllqbUJjN21u?=
 =?utf-8?B?cUhkcnhaOE53a3ZyRGxsbnVaS3FnZVJvOGw5SktlanlxQWhuV0d4S0kwbllU?=
 =?utf-8?B?SnUwWnlxanU1dzc3dnZXUmp2NHZ2NlhpYy9qMTlTZGZuOTRKSWh4MDJsdWFh?=
 =?utf-8?B?REI2dWFWRVN3R2JNaDhnZmovT1ZRRlVTRDRsVTVTRTJ2blVscWpuZ2hpaHBK?=
 =?utf-8?B?K0Exck5mUDlsOVBqZjV0NC90TGlnbWZZQ3I0U2wzMGl6WGtUanVSdlBVQ05U?=
 =?utf-8?B?a3M5N0dmakFnSUpiOFhCUnpKSDd6UnJlN0RHWm5tNTkraDdBWStRL0tMdnZT?=
 =?utf-8?B?TGVBVDlaUVZJVDZtVlovMVBwOVB0a05ITGtNQWE3OGxScS9TUldsRnFMb2M2?=
 =?utf-8?B?YW5FbFZQOW5vL09SZ0JxcXdIS3N3QXVlZDVKWFFBWWdBWUlYZCtWVjdDM2l6?=
 =?utf-8?B?VFp6cWVWYzk3TjlTUENtY21Sa2FKbDVlVUlWaUVEYVZJWWx1aUFzOWhvVnJr?=
 =?utf-8?B?Yzh3WlNrV3FSN0VpQkJEOTZEMTRKL29TZm9zNlUxSFlueFZPcXhsR1BSa2dm?=
 =?utf-8?B?U05DRmFUWngwWDdaK3hhSFc4NVJNMFFnTmdqaWo5VlNjaDJtdlRrYVZoYU9O?=
 =?utf-8?B?UnpHZDgvQmpCK1ludGJhRGtZbXB5bGZvQ3pwSnZLWng2NEtGUEFhY3BTRzM0?=
 =?utf-8?B?OGt4UFl6MkF0V1FlZ2dMbVora0prbE9HaEVVWHBuYXBQa1NRZkIwYXVNYm5H?=
 =?utf-8?B?azNaTkI1ck83Y2RiZCtYSE9send5MWErdHVvK0lLbEZtSlczeldVem9kbmZx?=
 =?utf-8?B?MkJwZno2TDlVcUZXMWpwQ3NVWEtZRFNEZlVkdTJZcVV4NUJqbG1GcHY2Q2Ur?=
 =?utf-8?B?anBRSEhoMjl3OFE2OGFCc202UmRnRktIZ0Z4YjZYYnU3dEd1bUZjYTRiUjk2?=
 =?utf-8?B?Zi91NmU1L1J3cEcyN0kzSDhmUXQyaE1NZDVQNGtjQXJTM2drLzRpb1hnL0Nw?=
 =?utf-8?B?RVlWUVJqRUNtUTF4TmR6YzhmWmdzN0pibkNJbUhBZUU4elVqbjJhaGVPSUFY?=
 =?utf-8?B?Z0xFYXNkYzhkVG9oVzFBeEVTLzhnV1o3SjQ2UUYzVHU3cW5PK3I4WFBCNWh6?=
 =?utf-8?B?eXNDWS95Y0tndFYxbTlTV2hhQ3BqZXIvOE8zM1FLejkwSWYwczNzQWVad0FD?=
 =?utf-8?B?Vzg0THVXS3I0OVJ2ZXF2U1RSanJzVUdjeTMxNjRVdi9qcUZsMjZudnFiMk9x?=
 =?utf-8?B?OUtsVUNFbVBwNlRTVVVydldyZjhnL0M4R1c1cFdySklZT2NXajNmM1pMSUl0?=
 =?utf-8?B?VHJML05RUkZlRGtydml0TUdpM2tHZEcvd1o3WE5KQXJsbmtibTRCZksybm1r?=
 =?utf-8?B?bWlNN2g5b3BudFc0cmxNZDFnOC9Ldko2bklQNW9XaWM3R3g3dDFoSW5WYytS?=
 =?utf-8?B?SXI4QkRKZjJ3Mjd6dkNKbGdsSGRiZHVzeU1uTmRRZWgxeU5ZOEZmbE8wemRO?=
 =?utf-8?B?QUE2NjhpSTN6SzhrTXYyZTN1bXQ5NWhjcjRMcmVoaVFQa0NKcU9Gd0N1Wk8x?=
 =?utf-8?B?UTZ2SVhRK2RxMW0zMUxOTVhFS1BKQ2NNdndwQ2ZGK1lvei9TMUl4YlNKRTk5?=
 =?utf-8?B?V1pnaXJwc29jeGpMZ083NmlrYURCNVV3VXB2NEQ5VUxqMGNZV1N6Zlp0KzdK?=
 =?utf-8?B?eGtnNEl3ZUhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGxjUkNoUk5CVHVjVStxM29RR25IUEZBT3drRVBXYkdxUGVnZFVFWkRrWlcx?=
 =?utf-8?B?SGpYR1l0QTlLOXVsRHlKTmpONUYrNXp3bXZ1NmhiV1U2QUorL3lsM0k4SXpu?=
 =?utf-8?B?NlhWV1lIVTFBbTFOTVpaSXRpOTNJYXJydzdzSldYbC94cWlIKzhKaFZpTmJD?=
 =?utf-8?B?dDF0VmFKUXJUS2ttWldTcGErbHl6NGhYRlJDaUZaMDVsRWlnelhaSFAvQlhO?=
 =?utf-8?B?Skk1blFyTFdkYWVUZHVuLzVUWXMxcVMyRUxXSGZCa0hHOEdkZDM2dU1SVll1?=
 =?utf-8?B?bndmSzUyZzE3TjBWVkI0eWE4OTh3ZDhqVW5MVW5MOWl1TmlrU2krc3dQS0Ru?=
 =?utf-8?B?NTJXK0RNWFY1bVVNVEFtSFRtUzl1VFJwRzhoUHgweC83UzRxaEtzbnZscHFp?=
 =?utf-8?B?VmRkaElic3IvRzN6MEp3WWcrbkRmcmQ4dWpodTFSUzlaSVBjeHdILzlWd1Ix?=
 =?utf-8?B?d2lFRWJyd3BTaHkzK3ByM2s2R3J1YWlVRVcwVzE4WDJNdW1tODhxVWVaTEFL?=
 =?utf-8?B?N0NjRld2T1ZRWmF3WnNzcnRVNHBWMitXSXoyeDFKKzNTNjc2UXlxVzRydzlR?=
 =?utf-8?B?blh3RlZVQ0gyUXo2TDZLbzl6bWdlMnlHKytWTDViNTBueFc2dndyNVZMQ2F1?=
 =?utf-8?B?TTQyUEtlRW9Pa1lPMFBuYTJBeGhzY1dzaFRDcmY5eSt2UkdONE5NaXVDbzRq?=
 =?utf-8?B?VnJWVlVYaTdiOHEremUySFd5K08rcjVwaFBaNmlBeWpTS3ZQVzZMcC96Z2Zn?=
 =?utf-8?B?OXNyd1dOV0s2RlBrelhBVmhrMjVVSnN6UFEwei9lczllQjljRE9SZFF3c2tn?=
 =?utf-8?B?M3FINHFNdWFHZm1LMVFiSHN3eTU5blZBR2g4ZVFXbnJsMHh3ZEZGaTY1WDRN?=
 =?utf-8?B?aGRoVElDaWJMd0RwTHMrODhhL2FsYlBNZDdaZm1xSDNKMUZldTZNRXplSkZV?=
 =?utf-8?B?Z2hsRGVYdWQxSjdSaFkvVW9zVGZaQzBXUEFqK3h6VVVCT1lTUkZGa1NHVnZE?=
 =?utf-8?B?RHlEZ3FIRFMzM0tWQ3hPUy8wSFFaRmxoZmRhRzZ0akRYdVZ5TWpZVW9zWTF2?=
 =?utf-8?B?cHJhM1BqOTk2NmtzL0JrdjBQS3RrSXU1VjNTUVBmM1FweEVUREd1MlVxTWh1?=
 =?utf-8?B?ZnVmMG9rUVhHU3dJK3FUR3p0amFSTjZRbmZwYkEreW1BSEQ2TjlzZVgydGx0?=
 =?utf-8?B?K3VOdTFhVFVBbnhnL2piMDhJR1JTMU5rMDgyeldwdFVUSWwyTGJkQ1RyWXpn?=
 =?utf-8?B?UWFSbk5NdkZQSTM3TUNPWmt3ZVcvSW5HSmxIV3doWFRIN0tMdFVOWVhYRU1x?=
 =?utf-8?B?RndiRlVsZzY1bnY1V2l6WEdHcnJyZG5yR2pEOTlMS2xGSEJLTlhadHZsTzBx?=
 =?utf-8?B?cmN3YlV3bGpPbDNvQXBubG03ZG54ZzU2WExrc2Vnb3lRTHlmQjB3WHBGajVN?=
 =?utf-8?B?MjFkL3l1eFEycHFTYndxM2kzRGxZRlFvTFZnMU0xVEExVS9NVGtGUElxT09H?=
 =?utf-8?B?eUU0RGh5czZtcjNPdGR4QnRIRE0rcjB0R2ZqMEY0aW91OVR1L3BESXNQdFl2?=
 =?utf-8?B?TDltaGkxWFJ2S0xjMkU4QSt1M2IzdzdJNnBZWFhkRnZWQlJaaVVWSmNBQ014?=
 =?utf-8?B?OXRLSDN0by93T1ZYeWhqTmtpRFc3YWxkV0U3RE1jdE1JUTNHWHdPMjc2dmE1?=
 =?utf-8?B?SThwRHpBanZhS0ppVmVnMjhuREMxcU10OGJoOTFWTVEydndzNkFnQ1V1MU41?=
 =?utf-8?B?bnRjMG1aWUUxQUY5VjVTVDNqZ3kyenQ0R2M3RGczVU1Da0dZaHcrR3d1N2VN?=
 =?utf-8?B?SEczWDZCcm1yYmp0V21STXJiYnM5eFNCK20ydjI5OG5jVExENENpZkVUNlZv?=
 =?utf-8?B?VVNxa0x1TnpKQ1NYWU02QlpVL2hRTm8wK00xeURLRithYk5keWhJYzFUajNs?=
 =?utf-8?B?N2RkREdiT1JkRDByeHdGK0k1aGpYd09INlBWeHcvSjlvUndZYXZGTWtsNUx5?=
 =?utf-8?B?M2dDRTZ0YjBrTmUzblVzMnBQSTdDNXdyNEltbmhKbS9QMGt2NzU5RjFDNkdy?=
 =?utf-8?B?WllzQjV3aUFWK3EvTUgwaXpyNTlkeHZNQSszQVBkeTVCaVhtV0tJZ3M1dXJF?=
 =?utf-8?B?T1FLV2IyRkhMZy9BY1hPYVhDQkVLbDRmVDhzbWgwSlhXOUZnSmpXMC81bGRp?=
 =?utf-8?Q?jr64Fiyjhf/m8evdZ7ZAqHohNfTgWKTcayLMuZuvS8PW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca282fea-423d-40cf-8a6b-08dda9b9efab
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:03:41.2743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1Pw0Mv6kgMB1fUDz6mWO7Uxdt5Gx1okvXHnWZhorKZA1cwjSlEVHoTRnQW3EK8l/m3lId33t507nHPggHorcA==
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

Some of the firmwares need to be patched at load-time with a signature.
Add a couple of types and traits that sub-modules can use to implement
this behavior, while ensuring that the correct kind of signature is
applied to the firmware.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 64 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index e5583925cb3b4353b521c68175f8cf0c2d6ce830..32553b5142d6623bdaaa9d480fbff11069198606 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -3,11 +3,15 @@
 //! Contains structures and functions dedicated to the parsing, building and patching of firmwares
 //! to be loaded into a given execution unit.
 
+use core::marker::PhantomData;
+
 use kernel::device;
 use kernel::firmware;
 use kernel::prelude::*;
 use kernel::str::CString;
 
+use crate::dma::DmaObject;
+use crate::falcon::FalconFirmware;
 use crate::gpu;
 use crate::gpu::Chipset;
 
@@ -84,6 +88,66 @@ pub(crate) fn size(&self) -> usize {
     }
 }
 
+/// Trait implemented by types defining the signed state of a firmware.
+trait SignedState {}
+
+/// Type indicating that the firmware must be signed before it can be used.
+struct Unsigned;
+impl SignedState for Unsigned {}
+
+/// Type indicating that the firmware is signed and ready to be loaded.
+struct Signed;
+impl SignedState for Signed {}
+
+/// A [`DmaObject`] containing a specific microcode ready to be loaded into a falcon.
+///
+/// This is module-local and meant for sub-modules to use internally.
+///
+/// After construction, a firmware is [`Unsigned`], and must generally be patched with a signature
+/// before it can be loaded (with an exception for development hardware). The
+/// [`Self::patch_signature`] and [`Self::no_patch_signature`] methods are used to transition the
+/// firmware to its [`Signed`] state.
+struct FirmwareDmaObject<F: FalconFirmware, S: SignedState>(DmaObject, PhantomData<(F, S)>);
+
+/// Trait for signatures to be patched directly into a given firmware.
+///
+/// This is module-local and meant for sub-modules to use internally.
+trait FirmwareSignature<F: FalconFirmware>: AsRef<[u8]> {}
+
+#[expect(unused)]
+impl<F: FalconFirmware> FirmwareDmaObject<F, Unsigned> {
+    /// Patches the firmware at offset `sig_base_img` with `signature`.
+    fn patch_signature<S: FirmwareSignature<F>>(
+        mut self,
+        signature: &S,
+        sig_base_img: usize,
+    ) -> Result<FirmwareDmaObject<F, Signed>> {
+        let signature_bytes = signature.as_ref();
+        if sig_base_img + signature_bytes.len() > self.0.size() {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: we are the only user of this object, so there cannot be any race.
+        let dst = unsafe { self.0.start_ptr_mut().add(sig_base_img) };
+
+        // SAFETY: `signature` and `dst` are valid, properly aligned, and do not overlap.
+        unsafe {
+            core::ptr::copy_nonoverlapping(signature_bytes.as_ptr(), dst, signature_bytes.len())
+        };
+
+        Ok(FirmwareDmaObject(self.0, PhantomData))
+    }
+
+    /// Mark the firmware as signed without patching it.
+    ///
+    /// This method is used to explicitly confirm that we do not need to sign the firmware, while
+    /// allowing us to continue as if it was. This is typically only needed for development
+    /// hardware.
+    fn no_patch_signature(self) -> FirmwareDmaObject<F, Signed> {
+        FirmwareDmaObject(self.0, PhantomData)
+    }
+}
+
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {

-- 
2.49.0

