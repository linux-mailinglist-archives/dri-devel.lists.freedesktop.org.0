Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 449DAB52F1E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDAE10EA78;
	Thu, 11 Sep 2025 11:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OyPqVKcc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2082.outbound.protection.outlook.com [40.107.96.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C2010E0AD;
 Thu, 11 Sep 2025 11:04:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WY/5x35g05sV8QEoymsl9Jo0WVHZazn4RP8hP4Hgu6f1sOoz832s4MAyIr99RotlJftBgHnyP8hc0SoCecNzoB7cJXDV7kW6PJQpc1wum/liht2r9EmOe4ZFzd9u7Z8KSXvJumlhADw0H24Sg38FBiq73n0NxEZGx3bkBM3Tc90+E4Nj/hUyoKYgF8V/KAhnui7x/SOQzOt+bofCszdFXuHi7YQzB+91pcjCGY22aEkyrfAW+aVDQuW2kSGL27W4F7ql09yObc+fFu+B1qbj5aThdG2csEPhrZBkuZHebBtS+znC4P04bTar5FH2azW8XtKXwk8QF6DcepQ+K5QaMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07l9fu5Y+7C4wfHUOIxcgeYiDuL+j8v+juMUXHm46CE=;
 b=e7tqAekzBm7pu42deofUGKbB0hhLI31k+FPhVstgTr6nT09kouS0KOtHqbvp/IHLD80VWDRbQN5osDdDkDp76TuWth11DPIORoXMxeCqWNp3DFy8PyPLabSUzvfOCx6ggRAGoX69ThcuOw+kmMgJVsFwJznOCZwaikRx10iy0H7bUML94Xg78Lv4AE7AZPbQ4+3Oc7IObHa5OGYbPnbeBlZThnpm8dAraxYb47SX+JrtC/qjOKRRi1Yna7cW1rmSJiyhaUjOoqGEFzG0EHtyw02lUBRsDSVU6tH+tCCfC9DDCUsp5Ghmb8XXgLH0fc6wFFE7iRnraKZsiam3I7s/Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07l9fu5Y+7C4wfHUOIxcgeYiDuL+j8v+juMUXHm46CE=;
 b=OyPqVKcclD3IXdqtAQn2/NGTczw1Fsfo3b5XMYBK66ZBdd8wq25AM834lsz604jWZ7ayRtIgB4eN3DJQokP/eTt8lPaWjHggTW72BVVCTs17wPP2uah9NCsomodGE2N5I8gMdWWvE02aiz5qRxP3BiW21UzQmWlX7GWEpluSARS271QghpTUPky0mnbpG9js+vxLOPW9re1TfWp0VTt0FCppJ/9OyDNUc0kfhzkQtCob7fY3BE8auJ1JSgVoejtmzBvIXXxJRvIvD2p3aYw076iPqmj1ztNiN++8Kwv/X25fhXkWxNcSOye+4OerH0Ql9vZvtyD4ZLRwJvVXz6gREw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH8PR12MB9840.namprd12.prod.outlook.com (2603:10b6:610:271::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:04:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:04:32 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v5 00/12] gpu: nova-core: process and prepare more
 firmwares to boot GSP
Date: Thu, 11 Sep 2025 20:04:25 +0900
Message-Id: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALmswmgC/3XOwU7DMAyA4VepciYotRMv2Yn3QAiljcNyaAtpC
 aCp707oDoxVHG3p++2zmDknnsWxOYvMJc1pGutg7hrRn/z4wjKFOgtQYJQFkONU/HNMefjwmSW
 rGDvtoPNoRDWvmWP63HqPT5c589t7zS6Xpej8zLKfhiEtx4bBWKVb9BbJqkgH55T2ASL0rffky
 NkDaXLip3VK8zLlr+3V0m6xf74qrVQyRkOINalJPYwlheTv690tVeCa0y2Hyh0aIjAQGf2O4y9
 3ancdKzdkjQ6uN+jsjutr7m65rlyHvtOIwUTmP3xd129rvhR8tAEAAA==
X-Change-ID: 20250822-nova_firmware-e0ffb492ba35
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
X-ClientProxiedBy: TYCPR01CA0080.jpnprd01.prod.outlook.com
 (2603:1096:405:3::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH8PR12MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ce067e-fdef-47a4-33ac-08ddf122fc0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RSt3dEtWK3M1T0lURG4zMjFlMXRPQjNHK2VlbVQrbk4xUkFFYUEwTDg0V1VE?=
 =?utf-8?B?eUo0TnRBeTNMZVVQM3ZZSUphUHdnNDg0U3BUT1hvRi9QcU1HRFlHSThRbkhK?=
 =?utf-8?B?WW55VlRkMlI0OXQwQ3duU3NVVGZGOVI1VTNJalV2Y1FjM2ttVnVmR3JhTTNl?=
 =?utf-8?B?cWFQb2NTb0R5b3ZuN1Q3Rk10WFpXRVJCQVVTWTNCQVk1eEFyRC8vdmNzSGV0?=
 =?utf-8?B?ZVFoRmsvanRUT0lwc01ycFVzbWNwamlNeEg0ZUpYcElpQ2w1Wmd4cmRRNWF5?=
 =?utf-8?B?MFRzOVd2OEtOTVlUWk5tQmFKakdPQzRhYm11UXpEcE9sMUdHNng5TVNEWUd0?=
 =?utf-8?B?QmYxVjVYdmVGaXBGQ3Rhc0RLRTBmbGZoKzdmWnJkczUxUFVneHBKVmRRMTNB?=
 =?utf-8?B?aHlLMWZ0aE1QQituQjlCWS9SOENEZ2doTjdWVWVpU0MzbC96MW15TDF6cVNE?=
 =?utf-8?B?VlRBdWZudWVsWEFqZEZnWkFtWWZzd2xRNUNOMmRidlRQYjBxaStjZmtwR05O?=
 =?utf-8?B?c3lLVy9nR25qcGtaMEJ0SVBBakhJeUE5bnpCTUFMQS9GRDN0ZEFSWlZZWDRQ?=
 =?utf-8?B?MmhkTll2L203VjVBTjJISk42aENTbGw1TlYwNm1pRHNsU2sxd0ozcXlidjV0?=
 =?utf-8?B?b0lKV0RBcy9KUnJEdjZsdzh3VUgrRFBkMGgrUHE0QXFtZThjM3dMd1U0OThi?=
 =?utf-8?B?T1ZOajZTVFRCaWlNMDlqSDQ3N2szc0JIRWdkT3hPY2FlS3lDcGJNNEpwWjRa?=
 =?utf-8?B?aUNDVDdLV0VGWmYvOGswK1lKZHV3dlB5a2ZLSGRyWVZYK3JDOCtjdUovUVRF?=
 =?utf-8?B?S0xwNnladUpxV1Z1Mk56Q0crSmMvQU1Ob0hxMFl2Z09rdmRFSERtelljMUlI?=
 =?utf-8?B?bVhnRTFmeEhMYURjRFcydlRuSFIwN2dUdUV0WnNQM1V0OERvRnFyU0NtOFJP?=
 =?utf-8?B?c1VYQWl6TTg1aGNuWWplZ2UxNm01dmN3UWNnN2JWcWRNV3NyYmJ1Y09Oemh4?=
 =?utf-8?B?T00zMEQ5bXc2RlRQeXdhemQ3TVppZ2dtSnBJaWpTSmd0Z0djYzBiRjhzLzVy?=
 =?utf-8?B?UzFZMzRLdWc1dU5GUm8rekpVWk93emJzZUxiUnpFTE10d3h5eUh1R3k1aGc0?=
 =?utf-8?B?RWQ5eDFoRW1mQnRJY00reDU0eXhvNFVQUTh5N3VkQ2FPSDRhY05MK1RLNkRt?=
 =?utf-8?B?MFdRRDRsTnZoRGJqUDlrR3l1NXJ3Q1hXVFpneHFadURIV0gwa1hmZkJwQlRu?=
 =?utf-8?B?emUrQkw1eGRCZU1iVC9TZnU0WXM3YVpRQXRrOVFQaTR4TC9odXpmNmZlSTVG?=
 =?utf-8?B?eEt2UThqbjE2dzcxbFJ5eGExQjkxQVorUkNWZ2lmUmlWa2RKdDBLSVNzenNh?=
 =?utf-8?B?eWNRakJWU0c4elU5ekJ2NVJuakNEOGtuckxNRS8xTU9pNlpzN3hsaGE3RmJy?=
 =?utf-8?B?bThEVWx5c0dYNlRpRzJoazBCQ21iSktjeG10TGx2cGhFekhMS0dDeDUxM1hI?=
 =?utf-8?B?eTFQRGtjQUd1VEN5enFxVnVpS1J2V3BlamU1VXhieXhmMnVKQTVuekRlZGdE?=
 =?utf-8?B?cERwZkJ4TXBoMzk1UGpKcEFEMGlWUURQYmlQMkFBMEtPM1hnTHdFcERycHVB?=
 =?utf-8?B?Zm1uUzdXVmtaNitwdncrM1ZHT0c2cjJueWdjNXB5YjFJL2xLbGliTWVYdzZO?=
 =?utf-8?B?emJvSFZkZDVpelU2MTNSWnRKanNQa0tBVXBMem04ZjRYWTFBd3pQcDhnc0Uz?=
 =?utf-8?B?R2ZuS2hWZW90bFJBUk1FdjhYTDROUVBCejFXUXgyM2ZhOFpEOW9mMWFSMG44?=
 =?utf-8?B?YjN4Tm9qZmN5WVVlcTNHbWhwV2xYRVp4QzdqcUFlR2dvNXJvc252bDBPbTRZ?=
 =?utf-8?B?M0p3aEZYd1V6a1FOQVZSSmVHRkdBK0NLdUhBbnF1b3V0QXc4UGMxT1k1NHZV?=
 =?utf-8?B?c21lb0NjZnNMa2o0TTZUcXgvRXBjWE1XTkhlZDFBcTRVTkF0MHJDdzEyWS9v?=
 =?utf-8?B?MFZoWlc3YVlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTlxWW5KbVNPUkp6bzkrV1o2RFhBd09VR0tkV3pST1lCaHByZFYvRklwbEFx?=
 =?utf-8?B?ZUdpVmZMVVpGYkdrWUxTQmtkSi8wWkp6NG8yV3dpdjd3Yjg0RllYejRrTGZi?=
 =?utf-8?B?dmhKaFZ2WVNzZ0Uwbng2a2NWNDNyMlF0anlXaUQvWDdQamM0YXd0Y0tTZit3?=
 =?utf-8?B?TFh0bTRkaEZ3bmdrR1pMQTU2aWdwdnpzRTYraGlJbVl2SzNPU2ZqWm40SS8r?=
 =?utf-8?B?S3NvRERtb3J5SytleURsMVdWeXd5OHVQZHJGUWh1UnJIYVZDNzlkNW9DTlFW?=
 =?utf-8?B?RnZ0YjVxb2IxVVJURzhnL2hhODRTMDJIVFlZQ05ueVJVWDRZQ295cU9rMUxj?=
 =?utf-8?B?UjREaFpta21ibjZMT0taZ1RHWm9ac2Zvc0czTGcwalYzcEswaHM4MHlrZWhJ?=
 =?utf-8?B?SzdjdXlzWERwbGxpb3lFOTJoeTlvWkMxNlJSTWFkUG91bXJBVkw3NUx3Z2V6?=
 =?utf-8?B?Tkt6NHREeitIOFovT1BGYXFxSytiYm9JWWFRKzlJT2JlS0F2YzFHazZmcUxD?=
 =?utf-8?B?YXMycGtaSk05QURHaUdqSWJJNERYdDVKWkxobVVHaEdEeUZOdFNRU1dNVnlz?=
 =?utf-8?B?UU9pZ2xhbTA4cG5jUWEwa04veXhzakl4bllOenkxWkZyUkFKQ0c5a000WStu?=
 =?utf-8?B?NHhzZFNwSlR3d0s4UUtqbU4rcGd3MVdQQlM5Tzc2RVB4ZENGMzBTc1JhREpM?=
 =?utf-8?B?Skd3R0hnd1dqeUxOQVpaNlJTMzMzb2wyM0xSdWd4ZHVxQ3FJRmtwVFBQbXBK?=
 =?utf-8?B?cnRCR0dzVW1XZ1pWOFdmVXI4WnNxT2hMZDYxK1dlaG9VZUJBbFFzalliQ1FW?=
 =?utf-8?B?RXlhUDBiT0JtcFp3M25BWnNnUGhpME5uRFVzM2sxWkNDVnBUYUdzeHhzOWFE?=
 =?utf-8?B?WUdhZlJmZVRpcFZSRmF3MjBtTkVORTkzWkRUcmY1ci9rNHJLNnBmYk1XTnlL?=
 =?utf-8?B?aDBtZFg0a0tqTllLaWVzZ0xQRnZpd1c4VlpNS0JCSC8vZUgwM1pjOWRaYk1N?=
 =?utf-8?B?bjJKT0kyVGJKMVdCVndPV1hLNGNmT1dwbTJUZmJDVEJsUGJKeTRnb0l1d0o0?=
 =?utf-8?B?bFoxV2V3T1BJWE1JUUh1YjJvK2Q1b2ZnSTBRSkJOWCtOREpSMm82UEpqWnlF?=
 =?utf-8?B?c0h4cUsvTzBXS1VheFZBWktPUTRCc2x3NEdFeUg0MzlDTUJIMjI3clh4T1Jv?=
 =?utf-8?B?Vkt6eW5xZG5BOEdoeWUzcHRYNUNSK2RKeFNSUU1zRFQ4OFlOKzJ5L1V4Q0tK?=
 =?utf-8?B?Q084N3RUdmx4ZnhneUVmR2NmZFJKcVE5TTJYYUcwWS9wUStHR3pnZFAvbkFy?=
 =?utf-8?B?VDFPK2NSSGp4cmFLWVhqOGxnd3dBV0NzY01aT0FJSExDZTBiV3RGTlpRR1Jv?=
 =?utf-8?B?UnRRbFlYck9MUTY5bmNRbE82RS9laTJMN3hsdk5MdFo5Q2tWN3czb05taGZw?=
 =?utf-8?B?NDg5R1ViT0RPdGdYSGxWTEtoV3VMT0xVZ3RGNENTSG9RTTJyOXdaSDVtVkUr?=
 =?utf-8?B?QURiS01OKzd1dHFnaGVLK2FRK1pMb0lmZ1U1ZUZBRlBoSjg4Q0hnTUc5Umcr?=
 =?utf-8?B?VG00UjUwK2kzdzJTdGY1QndOeHhlVStJZWU4Yi9YZnlhblJ0V1Z5VGZOZ1Z4?=
 =?utf-8?B?ajVtdUhLNEJtdmFFc250dFVkRTBlQjNlaU1SNFhwcGtyT0Q3YmhoRUZEemR0?=
 =?utf-8?B?MmU4OFBhcTQwaWI3ck8vWDdZcERKVHZuck5sRlFtdTk5NW15WGZuTzJjTmlp?=
 =?utf-8?B?dTN2KzVETjZ3Z1MxMkFTdjN1bWhwQVM3WU1zSWxDTmF2TDNrV1czTU9UV2du?=
 =?utf-8?B?UlEzUlYyV2NNN295VVd5UmxSOWQzc25TTG4xczlhMXdodDRUdjJEWUJHeUwr?=
 =?utf-8?B?RG4yU3pvalNaRVJ5c3dGbUxtYWVLM3dBWWplMVF0N1NXS3ZmcCtCUlI3Tk12?=
 =?utf-8?B?UWVwWEltamJsTnNXUFNGU21xUHRyck9odU9HZWxGQUdJanNaaTFRZUkreUYx?=
 =?utf-8?B?RE1GOFZ0OU5KMHA2RGdWM3gzdytGTFAycjk4WVdjakpMYWF6dDJqbFEvQ05W?=
 =?utf-8?B?djJpWXNqUzJMUE5EeExFYmt6ZzR4dEs1dHRQRFRDVSs1cGc4dXpzY0xNM2JH?=
 =?utf-8?B?bzdRZEZvdUQ1SWM0N1gwaWEwTHAxbERuUVdxVlBSaXZyajlCQXI0Y1J0czVT?=
 =?utf-8?Q?xYCNfR1hIukDAmrkMudkESjZMUVYbxM4qeeYGPi+fTId?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ce067e-fdef-47a4-33ac-08ddf122fc0f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:04:32.1996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p87ipy4eJ8W7b7TwZMYnWQy9wcOkddBdtSSN0rUyU4a/vS26i0upqJ4FZ7wKALU4AGBf2VMq4mBeuL9zLJcNng==
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

This series makes more progress on the GSP boot process for Ampere GPUs.

At the end of the previous series [1], we were left with a WPR memory
region created by the FRTS firmware, but still far from the GSP running.
This series brings us closer to that goal by preparing 2 new firmware
packages:

* The Booter firmware, which the driver loads and runs on the SEC2
  falcon;
* The GSP bootloader and firmware, with the bootloader loaded by Booter onto the GSP RISC-V
  core to verify and load the actual GSP firmware.

There firmwares are involved in a rather complex dance that is made
necessary by limitations related to the level of privilege required to
load code onto the GSP (doing so requires a Heavy Secured signed
firmware, which is the role fulfilled by Booter).

The first 6 patches perform some cleanup and preparatory work for the
remainder of the series. Notably, the GSP boot is moved to a new method
of `Gpu` to get ready for the additional steps that will be added to it,
and the `Gpu` object is now fully built in-place. We also simplify
chipset name generation a bit and move the code requesting a firmware
file into a dedicated function in prevision of the removal of the
`Firmware` structure.

Patch 7 parses the Booter firmware file, queries the hardware for the
right signature to use, and patch it into the firmware blob. This makes
Booter ready to load and run.

Patches 8 and 9 prepare the GSP firmware and its bootloader, and keep
them into a single structure as they are closely related.

Patches 10 and 11 switch to the 570.144 firmware and introduce the
layout for its bindings. The raw bindings are stored in a private
module, and abstracted by the parent module as needed. This allows
consumer modules to access a safer/nicer form of the bindings than the
raw one, and also makes it easier to switch to a different (and
potentially incompatible) firmware version in the future.

570.144 has been picked because it is the latest firmware currently in
linux-firmware, but as development progresses the plan is to switch to a
newer one that is designed with the constraint of upstream in mind. So
support for 570.144 will be dropped in the future. Support for multiple
firmware versions is not considered at the moment: there is no immediate
need for it as the driver is still unstable, and we can think about this
point once we approach stability (and have better visibility about the
shape of the firmware at that point).

The last patch introduces the first bindings and uses them to compute
more framebuffer layout information needed for booting the GSP. A
separate patch series will pick up from there to use this information
and finally run these firmware blobs.

The base of this series is today's drm-rust-next, with a couple more
dependencies required:

- The pin-init patch allowing references to previously initialized
  fields [2],
- For the last patch, the Alignment series [3],
- The following diff to make the aforementioned pin-init patch build:

--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -138,7 +138,6 @@ pub fn new<'a, E>(

         try_pin_init!(&this in Self {
             dev: dev.into(),
-            callback,
             // INVARIANT: `inner` is properly initialized.
             inner <- {
                 // SAFETY: `this` is a valid pointer to uninitialized memory.
@@ -160,6 +159,7 @@ pub fn new<'a, E>(
                     data <- Revocable::new(data),
                 }))
             },
+            callback,
         })
     }

A tree with all these dependencies and the patches of this series is
available at [4].

[1] https://lore.kernel.org/rust-for-linux/20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com/
[2] https://lore.kernel.org/rust-for-linux/20250905140047.3325945-1-lossin@kernel.org/
[3] https://lore.kernel.org/rust-for-linux/20250908-num-v5-0-c0f2f681ea96@nvidia.com/
[4] https://github.com/Gnurou/linux/tree/b4/nova_firmware

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v5:
- Perform construction of `Gpu` object in-place.
- Link to v4: https://lore.kernel.org/r/20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com

Changes in v4:
- Rebase on top of latest Alignment series.
- Make use of pin-init references to initialized fields.
- Remove all uses of `unsafe` except for `FromBytes` and `AsBytes`
  implementations.
- Keep the GSP placeholder inside the `Gpu` struct.
- Move GSP firmware bindings under the `gsp` module.
- Get the firmware-specific information from the bindings instead of a
  HAL.
- Link to v3: https://lore.kernel.org/r/20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com

Changes in v3:
- Move the GSP boot process out of the Gpu constructor.
- Get rid of the `Firmware` struct and discard loaded firmware blobs
  after the GSP is booted.
- Consolidate the GSP firmware, bootloader and signatures into a single
  type.
- Make firmware bindings completely opaque to the driver.
- Improve firmware abstractions related to framebuffer carveout.
- Improve comments and naming throughout the series. (thanks John!)
- Use alias for bindings module in `nvfw` to avoid repeated version
  numbers everywhere. (thanks John!)
- Fix inconsistency in naming of members of Booter header. (thanks
  Timur!)
- Link to v2: https://lore.kernel.org/r/20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com

Changes in v2:
- Add some GSP bindings and use them to compute more FB layout info
  needed to boot GSP,
- Use PinInit in GspFirmware to avoid several heap allocations,
- Rename `bootloader` to `gsp_bootloader` in `Firmware` to avoid
  confusion with the future Turing falcon bootloader,
- Link to v1: https://lore.kernel.org/r/20250822-nova_firmware-v1-0-ff5633679460@nvidia.com

---
Alexandre Courbot (11):
      gpu: nova-core: require `Send` on `FalconEngine` and `FalconHal`
      gpu: nova-core: move GSP boot code to a dedicated method
      gpu: nova-core: initialize Gpu structure fully in-place
      gpu: nova-core: add Chipset::name() method
      gpu: nova-core: firmware: move firmware request code into a function
      gpu: nova-core: firmware: add support for common firmware header
      gpu: nova-core: firmware: process Booter and patch its signature
      gpu: nova-core: firmware: process and prepare the GSP firmware
      gpu: nova-core: firmware: process the GSP bootloader
      gpu: nova-core: firmware: use 570.144 firmware
      gpu: nova-core: compute layout of more framebuffer regions required for GSP

Alistair Popple (1):
      gpu: nova-core: Add base files for r570.144 firmware bindings

 Documentation/gpu/nova/core/todo.rst              |  17 -
 drivers/gpu/nova-core/driver.rs                   |   9 +-
 drivers/gpu/nova-core/falcon.rs                   |   6 +-
 drivers/gpu/nova-core/falcon/hal.rs               |   2 +-
 drivers/gpu/nova-core/fb.rs                       |  65 +++-
 drivers/gpu/nova-core/firmware.rs                 | 107 ++++--
 drivers/gpu/nova-core/firmware/booter.rs          | 375 ++++++++++++++++++++++
 drivers/gpu/nova-core/firmware/gsp.rs             | 239 ++++++++++++++
 drivers/gpu/nova-core/firmware/riscv.rs           |  89 +++++
 drivers/gpu/nova-core/gpu.rs                      | 143 ++++++---
 drivers/gpu/nova-core/gsp.rs                      |  11 +
 drivers/gpu/nova-core/gsp/fw.rs                   | 101 ++++++
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |  28 ++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 126 ++++++++
 drivers/gpu/nova-core/nova_core.rs                |   1 +
 drivers/gpu/nova-core/util.rs                     |  20 --
 16 files changed, 1216 insertions(+), 123 deletions(-)
---
base-commit: e2580413a83680f679904ad2f2c1aa6969876469
change-id: 20250822-nova_firmware-e0ffb492ba35

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

