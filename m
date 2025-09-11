Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A303B52F22
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C46310EA76;
	Thu, 11 Sep 2025 11:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BvXAQLQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2040.outbound.protection.outlook.com [40.107.95.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833B510EA76;
 Thu, 11 Sep 2025 11:04:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KSWV1kIyac2ooOtOXDyZUthRznNTi8shI9xjjDsKfEg7R2axmzXE3kBZzNrpuk2NTpibkEpRwjRcFnYjX7UBK2kuR35EyB9ovt20B/L2uc8HVoVmaUNuS6lZMVn+U4u2vbyb9Kb6aTzyoHvJ/+qM5meprPM4mKDaVGLosXl7iGOgUCjV19VOcYX/F5RJNimhr4J5tndTGR3vTjk79z5816DH1+xIqyFPQLt9nWSWsJleqduWywDfqK0xMXlOMOw00dmldxjo//NMxWTMWusK7zkO+srL1CXMmNplmFWVkFPrIr29Rm8tZ+59ntRPzz6XnFjLfYM3t9He+/uA+d+gvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+eEpcnMwzBIkI0EoKzKH1AJFepxOnkVSkQaZ7Tn2C0=;
 b=rOuvRq6bPW8ZevVOFJqMiyoWrgowSbmQBb7PRXreYISgeKbHNToAWUzCoZclOiJ9gfqzkJ1/JYBe/CBChs3hKXCu6ChG5ChJqZ1ygVtB0T1nUYsYOiqNBhyK39AfVO2FB9vt4TvgBCB4JH7wlJsm8k1AQKLRuWbnm6hBW/U908BOy3spl5FcnPcIDp0vAd7ocu1wonBM5N/wVR+sw2+dRvEQOX0K2+JUHCYQTs5/ThYmsViQCFiuGfMdIIU7kQbymW/JywEXd1vTVNbZwAF5X2SXBA2KXQMq+zWFtg2Jel4zY97UECEtQcbn9+xWYNoE50AhurBCVCILpFspHXPD6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+eEpcnMwzBIkI0EoKzKH1AJFepxOnkVSkQaZ7Tn2C0=;
 b=BvXAQLQVHheEIRADixAceYInR8QeDp4AV3VTv21lBe9dahKdpYXO3fjxmd2Jwtiu68/gFVgkhi3jJDdJHWzkeUiUfxkk0qfvULG1WMTsKRFjMGBq5FciohjF8jzRPJeNPj6/uHEmW6mNwvf+5mZspPZwIvpjs99Mf0E27H3PihTrYKGIFYZ2Y49DYO/4FB7nqLptX9vaTFQmhzMDyXWEBixy9Dk+jXle7fkaKBBEGiT5Zbd6hwEsX1rfyf6TGuRp8VCtE1MmHtNOOScT4gozN3ducb5JQyI4hgsAXg/a37oeHpeGHAz5HWpwtc98xtpBCr3bqQRjSpgV8mrYUUQLXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH8PR12MB9840.namprd12.prod.outlook.com (2603:10b6:610:271::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:04:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:04:39 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 11 Sep 2025 20:04:27 +0900
Subject: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a dedicated
 method
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0274.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH8PR12MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: 206df90a-d8a2-440b-a68c-08ddf123005a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUZweE9MMStOM1E2aE9BTDlFZVh5YWRLQklabndnTk1KOHFjcWlxRXdxNkZ5?=
 =?utf-8?B?VFdZT2t3M1lZZXpydTZXSHVrZG4yeDUyRENZK3pzY05UUTkvS1lIeE5PcUU0?=
 =?utf-8?B?SkRmM1V3ZFZrRDRJQldzemtad1lvbHJXb1ZPSVBhakE4eEY3Skk0b05FZmZW?=
 =?utf-8?B?M1lvSk54UlNGS1A0QjAwc0hoeTcxTis4SEtlQzR1bm9PbjNyc1RWa0QwNVdF?=
 =?utf-8?B?dkZVUXJFNHhrMEk3c1VTTnFBRmpXQmErYm0vK0lSaW95TWJaVk81WlNMY1dh?=
 =?utf-8?B?WVEwT3dmSi9lRE9Hd0FJbC9aRDk4eENBdWRHTEhRVUZ5UGRpNXFYRlhnOWU0?=
 =?utf-8?B?OWExS0RWci9RaHpNZlEvaVVNbW1HTU0vQjZqS21ueWJoZGFWSEE2ZDNVWStI?=
 =?utf-8?B?N2VHZ213L1NqY0dZMHE2Wk9PcXROYVgzOGlrbzFlVThiWUhMdExrSjJCUDM5?=
 =?utf-8?B?Wk5tTVMxOUVCckJnSkwwK0xxeE92RzFCa1J1RHdybTBDZFdYa2JFaHlPZm9u?=
 =?utf-8?B?V3dsR2pxRHM0UEpmMEdWN05GcmVKdlJ6UW5wRi9OVW00eUNaV3pDOGs1M2pQ?=
 =?utf-8?B?ajM4S3doSDJERStCL3gzMmFZWE55SzVkK2dWMDErK1hYTFB1SithRXc3bVhM?=
 =?utf-8?B?aFZlZEhaL1lXMGpyMmdaT1RBWGlKVm9EakcyZCtuK2wvbWhPd0NzV1RIb3M0?=
 =?utf-8?B?TDF4TklwOGp6QitXa0xEbmZqNG9oUU5ET2k4VHRzL3VsYlVwMVZWRGE1a2JD?=
 =?utf-8?B?eDRKWGV1SldDZWplcUgzYlh3SzlyU3lZMmp5LzBaT2trSldRb0hKc3A5ZGls?=
 =?utf-8?B?YS8vWjVZVFRDbkJBTzQwTVFoTExKQkkrRTRJVFJFbEk2NzEzeFc3WVBHRVZ5?=
 =?utf-8?B?ZDhyNFVBM1NSazVrb1VCamQ2WHU0TmhOdlJXTWhUOEx3VVJ2N0FmTGNWN1Vr?=
 =?utf-8?B?elpzSzBnMGVDcXZaVGJNWm05ektET3hBL2ROdUsyUkN1NTVOUldzaUVqaGls?=
 =?utf-8?B?TWlGa3RKZGhFMmRVZ0YxOFRVUzhOQVVtTTNHSHl5OUVrcmJCMys4TkhMeUVx?=
 =?utf-8?B?b3kvMnEwMmhkVlVVcWdKM0h0MWRqN095aCs4cUhwMEJESlRkL05kR041VExn?=
 =?utf-8?B?amViZHJNK2wvUVB4Nm02RmIvaDBwemYwbjBhdnlOOEhGdmVTMHdhWDNuZmNa?=
 =?utf-8?B?OVJjUHpGSDNDbmdnbDJMbThqb3IwNFJOSWFVYUcrZlA4d2lHaFNwVUozTEQ1?=
 =?utf-8?B?eHE0R29DK3ZzWk8xQ2VXc2lqcmM5NmhrdVJ2M1pOOTlkZmlNb1ZBZ0NLcjlS?=
 =?utf-8?B?b05jZWdZSUVvV29zaEFId2RWRHRUdnY1SGw2MXBHNDVKK2Evcy9ic3ZpTHJ4?=
 =?utf-8?B?eUpKVFZZWTZVWkxZTDZ6amF1WUR6czNhcFFlc1pVUlVOZlFBZGcwWFRIczdC?=
 =?utf-8?B?VUoyc3IwZkp5WmJVd0dNbW8xMTNxVWpIQkxWN1dUTjhvb0NpVGtqaDluRkp3?=
 =?utf-8?B?MDN5aGRYRVFPU2hmeUFkaWRYak4rZDZwMS9zUkNsN3VHQnpkWFFiVFU3K1ly?=
 =?utf-8?B?eDQxM09xMmNjcFgyL01PY0FNUkJ1enUxWHUwSld5RkNRMEhocllyM0dLdFpD?=
 =?utf-8?B?aXQ0cUwyQ1JLdVFDWmlGVENYUkdRTmtiZE8wZHUvVHlZbWhYTFd0aFdZRnFN?=
 =?utf-8?B?VmI0WGpmZy80R091blVJSHdvc01ZMHc3Sk81Uk0vbWh3Ymt4encraEJBK2VP?=
 =?utf-8?B?cXpIVktWbE1aQ2tjT2NLYzhVdzRkU25TYXBaZE1iTjNXcGdIVEhLbzd3WXA2?=
 =?utf-8?B?ZnNFbkZCNEZMUjJaRDRIQ09NUGJzZmZZdWJrRmFnY3ZJWGpqTTkyMFBLMjNC?=
 =?utf-8?B?RkNXUXN1TXVDSGFuUVI2OEVXUUQ3Y1V0bXkyZGNLWVVIK29xc0FYTktXdEM2?=
 =?utf-8?B?MllKQ2JyM0lKdWJrcFJzM3VabjhscGdSek1sdXJMSlhDR2xUYVlTMXI4aGNs?=
 =?utf-8?B?d0xQU2I0cGVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGYyNWU1aWJvL2RJazhwNWhNYmRXeVNXQWZhaWVBalRlRXNOVzN1b0NBMVVF?=
 =?utf-8?B?c3JKWnVQcWtmWXp1Umw5NGs3RGM3YzlhbzF6dGQwZXZuMnFOS1piK1haNWFU?=
 =?utf-8?B?K3RuU0poYi95L0ZvaU1STUJiaE52eGZKa1ErSGMxbEJ5NXFHamhxM3hjZUtr?=
 =?utf-8?B?MTd0UjhNVGg2V01tTDNPWm1DVGUzZHlrMS9SdFBoTUNoV0k1S29MbFJ6bWox?=
 =?utf-8?B?M011UGFFdnRpZ1Y2aU9FcFIwdDhNUW42OHBZb0RFSzhCODZERXJjVG9NYk5h?=
 =?utf-8?B?Ky9SdjdkNTViRUpzUS92UVVBTCttM3U5cXllZHZyaGFSWlNxSnRva25tbkNZ?=
 =?utf-8?B?MU5CYUFoRzI4dXpvMjIvd0E1dkJNNkVhbW5Vb0NoQVBRUHhCdDBuUjhmUDRi?=
 =?utf-8?B?UFFIWjJOdVVsckZScEl1b3VVeHYwMjJIdVAyYVJ4Q24vNWRmbDgxOUpOdkFR?=
 =?utf-8?B?WnZ0Vnlla2h1aGtRQnJ0SHQ0L1pQV1lpbGl4UDhBRnpoN0Y5VEZSVm5mcldh?=
 =?utf-8?B?OUM1elo3bjYzc3RrVlZ4TU0wTVYxTzkweUJCVGJTTW9aK2xILzd3MDBLQURF?=
 =?utf-8?B?MGFIQ1RiWktWSWlKV1hQOE01MWMveWNMUTJJc1h5QXZVRFI1MUlHSFNmb3dz?=
 =?utf-8?B?c1BIeWF1RHc2T3hiYWpESWQvQnZEZlUrZWREeERLejl4SUlucWpFejNnMzJs?=
 =?utf-8?B?dGtEZmxZbVRNaWFmc24wdDdWSEpBNS9FcFhiYk5ibzRpR2d1TTVMRldraGQ1?=
 =?utf-8?B?MytRcVc2by81SmRUeDEwSDBQQldXR1lzc2RHdjE1V0pVZ0trcDJmZ05vd1VI?=
 =?utf-8?B?aVpiRU1tL1Z2T2V2NXNRSGhEbldJVUJaQkxSakNQejZxSS9CUE5ERElWM0RZ?=
 =?utf-8?B?NzFzSFNLeExEd1BQZUtlQlcyYnNhRVR4RXVlSVhyTmNMNHVENFgxcVZuRTZH?=
 =?utf-8?B?cU1lOXFwNkJzSGlHcjBONFZRR21hT1liTzFKMFQ3MDkxUGpIYmM0U3JPQXQ2?=
 =?utf-8?B?RTBHZHRiS1pXckJUakVoeWZHdklFL0F4UURVZXNBWkxVa2xhT0VWUUkxMmEw?=
 =?utf-8?B?dGc3eGw3WDlSRFkxUTJQbTREMjhBdUhpc1lwL0gvYU03UEJWTGNCUGw0RHRH?=
 =?utf-8?B?NGdJM3c5UHJIblkrVTJpQ1k1TkVNV3N3YXBldVBwSjYyU0ZidVphVGt0Rzh6?=
 =?utf-8?B?TzVPMVpjcWRzbHRWR3BtMXBMN2FDSFR0MFhOSVlvdXR4eXVtamNMMlZCQUxE?=
 =?utf-8?B?dDk1aGswam9Pb2VCWFk3TmE5RTMvS1dkTi9hRzAwTXhObU8xd1FpaXd1V1Vk?=
 =?utf-8?B?VFZvU0ViL2Fvd3RvUTI5NEVZS2lxYzFhNi83bVc1eVJKYlhQRWFWbmFaUEFy?=
 =?utf-8?B?VjJrM2JQZnE5aXNNckJyT284SXRJd1ZrTDlnczNTc2lKN2R3NGVURTFiTUI1?=
 =?utf-8?B?dUpmNjB0b2RVbFBFZ2c4UkllaytZcWJrZkVNYXI0QzgybjlnZ3lqVElXZW1r?=
 =?utf-8?B?VTUxczROODFjS3JxNUZaYy9lMFU1blFhVTcwTm9LanZlU052c2UwckVKMTZr?=
 =?utf-8?B?ZHNBMkZGZGVpU2krSFJyZGtEZDRxbEh0OHNhdHRMWFJkK04yMEJhMVFGaXFl?=
 =?utf-8?B?M3VocllKNVhnZytZcVBrOU9KTHd1ejI5T1Q5TS8wb3d2VnVpK0lGTXJ5YWlC?=
 =?utf-8?B?VkNZS2dlL1IwQ3JPZEJlWGJEVHowWVg2OVFQRkhrbGg3ZjUyOS92V1BvS0xv?=
 =?utf-8?B?N1ZVaGh5VXdkWnNCaUlsZW96U1JCTG51L0lUaFRVamFVbVkxZk9xOTR1cWNm?=
 =?utf-8?B?NUhHQUh5dkRRSTk2VlowMk13MFF1VmUrbHhJNXlOOHZzVGpxZlBwWFBCcW5Q?=
 =?utf-8?B?dkJYRmNtKzdUNjRQYm1SQ3ZXTUFpdmFSb01pcmlZRkswU2p6NUh5eWViVW03?=
 =?utf-8?B?SUF6QjBsdlo4S3VualRFVzdYRGErUU5BaUsvRERGamxERlpRZTJtNnkxOGdE?=
 =?utf-8?B?OWVqN1Vob1lkRzZyU3dPNzQzano2WHpCMTdZVnA1ekJHRVFlVkY4TkxCRUZs?=
 =?utf-8?B?b0RTNUdiSmdRYitOcDNlbmFVN1JTU1JBVDZPM01oMmFtb2w3T05PVExoL3Mw?=
 =?utf-8?B?RnhrYnFhcVJBRTZURVVjdjNUM2NuNFpzeXlaZDFYL1BCclFuQ3dQU0Nlb3M3?=
 =?utf-8?Q?wiqtZQ0Rswg/0PpZqL+u5wm4hOKTZYzdV6sd7I9gue45?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 206df90a-d8a2-440b-a68c-08ddf123005a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:04:39.0241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNQwEZDywL6+0lo6Mp3PVKKTQZZ4MoV+ExY2vfK3ZhnwluokyMja1M7W5AuENYlwOIQP5LujbqMW8DNaEbKruQ==
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

Right now the GSP boot code is very incomplete and limited to running
FRTS, so having it in `Gpu::new` is not a big constraint.

However, this will change as we add more steps of the GSP boot process,
and not all GPU families follow the same procedure, so having these
steps in a dedicated method is the logical construct.

Relatedly, booting the GSP typically happens only once in the GPU reset
cycle. Most of the data created to complete this step (notably firmware
loaded from user-space) is needed only temporarily and can be discarded
once the GSP is booted; it then makes all the more sense to store these
as local variables of a dedicated method, instead of inside the `Gpu`
structure where they are kept as long as the GPU is bound, using dozens
of megabytes of host memory.

Thus, introduce a `start_gsp` static method on the `Gpu` struct, which
is called by `Gpu::new` to initialize the GSP and obtain its runtime
data. The GSP runtime data is currently an empty placeholder, but this
will change in a subsequent patch.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 43 +++++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index a0878ecdc18bc9e9d975b9ab9c85dd7ab9c3d995..c8f876698b2e5da1d4250af377163a3f07a5ded0 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -172,14 +172,13 @@ pub(crate) struct Gpu {
     /// System memory page required for flushing all pending GPU-side memory writes done through
     /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory-barrier operation).
     sysmem_flush: SysmemFlush,
+    /// GSP runtime data - temporarily a empty placeholder.
+    gsp: (),
 }
 
 impl Gpu {
     /// Helper function to load and run the FWSEC-FRTS firmware and confirm that it has properly
     /// created the WPR2 region.
-    ///
-    /// TODO: this needs to be moved into a larger type responsible for booting the whole GSP
-    /// (`GspBooter`?).
     fn run_fwsec_frts(
         dev: &device::Device<device::Bound>,
         falcon: &Falcon<Gsp>,
@@ -254,6 +253,33 @@ fn run_fwsec_frts(
         }
     }
 
+    /// Attempt to start the GSP.
+    ///
+    /// This is a GPU-dependent and complex procedure that involves loading firmware files from
+    /// user-space, patching them with signatures, and building firmware-specific intricate data
+    /// structures that the GSP will use at runtime.
+    ///
+    /// Upon return, the GSP is up and running, and its runtime object given as return value.
+    pub(crate) fn start_gsp(
+        pdev: &pci::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        gsp_falcon: &Falcon<Gsp>,
+        _sec2_falcon: &Falcon<Sec2>,
+    ) -> Result<()> {
+        let dev = pdev.as_ref();
+
+        let bios = Vbios::new(dev, bar)?;
+
+        let fb_layout = FbLayout::new(chipset, bar)?;
+        dev_dbg!(dev, "{:#x?}\n", fb_layout);
+
+        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+
+        // Return an empty placeholder for now, to be replaced with the GSP runtime data.
+        Ok(())
+    }
+
     pub(crate) fn new(
         pdev: &pci::Device<device::Bound>,
         devres_bar: Arc<Devres<Bar0>>,
@@ -284,20 +310,17 @@ pub(crate) fn new(
         )?;
         gsp_falcon.clear_swgen0_intr(bar);
 
-        let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
+        let sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
 
-        let fb_layout = FbLayout::new(spec.chipset, bar)?;
-        dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
-
-        let bios = Vbios::new(pdev.as_ref(), bar)?;
-
-        Self::run_fwsec_frts(pdev.as_ref(), &gsp_falcon, bar, &bios, &fb_layout)?;
+        #[allow(clippy::let_unit_value)]
+        let gsp = Self::start_gsp(pdev, bar, spec.chipset, &gsp_falcon, &sec2_falcon)?;
 
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
             fw,
             sysmem_flush,
+            gsp,
         }))
     }
 

-- 
2.51.0

