Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F9FABEC1C
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC59910E62B;
	Wed, 21 May 2025 06:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uhnbFPoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8103710E5EC;
 Wed, 21 May 2025 06:45:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLjIFT4O1+ltAB2hzuDLbjXOzRVPE72yz9mEWur5WTzveWAOMU9+YNgwda5uXy2e2KJEvmGFEGRUm/1v92XTFmYlsOW126ImCME8Sebv0jR70lUCNeopcYaB9oMCh9vYzEYdPG7pjmATTjGwA0Rsx3D4Vv8L2WP8aAr0DYOL4zTKA5HGrw0GrTD9ZSm6qETs3s+tNMV3fDwfZkM7AccKLKsY2FL4olcc6DeWVyefdDJQr6MOU3E8cnrxQs1SMGuvemqcwJTYwg9A0XeI7L9U2ouO/7iBwJsATuM/hNWZI9NGBzBiSe6MS4JJ+s2z9FDIUkX0uaekN9TaVlLi1j63iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNdIUZOGUBA8bqX743RV4RAhbdDpl/1y5DCmOIqKFOE=;
 b=ra3UpJiVIRKvIQzDcQ4tK+Km/biLInBv/cmXOznX1g59eM8GtFoBH/KiNfrtoAG4K/mTaFj5gRMgg3W7YpuNQEZarZPILH+wpKSD4zrL4CwavkXOY97VpswsNg2hXkXU0Q5pYTMGPvFP1oiEgLHAlk3vdzVl1Iqz6976Fmq2TGm/PKqb9mqpwe6NpVZUeeelRA1KHjCH00uHC923yTcMQGkNN3EVT3+q1UsQ9rT25c5/95a8f22ldF21GihWwG1q19wHXuuQ9WQwsmTnAEp+SndOI4TgRWbTwAk0dsKejlKisebfMGT0u7LrebPBzL98iRprCPFlHNLyxUnjaC5LXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNdIUZOGUBA8bqX743RV4RAhbdDpl/1y5DCmOIqKFOE=;
 b=uhnbFPoZUs4kt6IIFJio8NFx1tyBEMhVvJONexjNwX3rgSdCE6G71SsZ3xgyCTjVmVByqSRgZFvBqd/Kw9O7ljLiIqgA5W8kGOWMjiAHAaWTC0H4s5tfkjMzJ+IJXoiUKfJfB66DIJNcTb0J6xcOZHyHPrh6iV//sFABE3RMSacJsDiSxdkvQGjIpf+wwypdBasZ6KC8kGbdi0dI8haTqVEhC9ZZNp+YKfigCTBsun5rYZ4+yNGHDhai9iySBDeI1Iq61zm6Xm/l3U48BfkVsWje9nMlZ31E7HepKKjXNe/RCJyBO9V4P4GupY3nShKroZ6qGCPzOfJE/vTBAgeUzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:45:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:45:10 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:44:57 +0900
Subject: [PATCH v4 02/20] rust: make ETIMEDOUT error available
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-2-05dfd4f39479@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc36a2c-466d-4579-66e6-08dd9833081d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHFkRkNrN25lWDAvVmJ5T3lGUjV6TkJ3UXVvTFZjbVBrL0pwRFBsaFRtTFVS?=
 =?utf-8?B?Vm9QU0NTcUF1K3k1Q1hDR0NlaE1iZHVqeEhTaFMvM3pVbDdZSU9KUm1obG4w?=
 =?utf-8?B?aEtsZjQvV0lnQlZ6bitMMkdjMis4dmFPcjBjRC9sajBQd0RlUVE3K1cwWktY?=
 =?utf-8?B?Ti9tblZGUXVKQVFHL0JhbEV2Tks4VWM2SnhqdW9PNVU4MG9mQldXcm0zKzJv?=
 =?utf-8?B?YjBia1VQR3BpRldCRktqQTNDdW9ObjQ0aHJKK3A5QmxiOUhhNG55b0VqdlpV?=
 =?utf-8?B?R1ZKMzFURU1Sc0J3MTdVT3lKV0YvNUIxL1E3UVFzbDBkckRtYWdpVWxCaWRi?=
 =?utf-8?B?Y0xnM203bmtHMjhsdDhmMTBSejJkWlRUNVd1ZkpkRXp6clFKSWI5NUJpYUM1?=
 =?utf-8?B?akd0ZUVXSXREdEVWWDlSNUg2TGsrOGhIUUJweVVMYmVwTC85eGtybkhMam9n?=
 =?utf-8?B?aktPbVFXaytPQ0J5Q2NhalpMOCtMcVdkMTNWWGIzY2JNeGw3RGp0UmtnRGpr?=
 =?utf-8?B?VmhkSEhNeUREQW54YjAzM2JQNDlOSytoZUQ4QVR1M2krcmtrcmVqcVJwQWQ2?=
 =?utf-8?B?ZzJ6YTgwZzlBV2kyMXZIRjk3Ly9Lb1l6K2ZvQnFtb3hzc2lsMDArVFdJTnow?=
 =?utf-8?B?emFxckJ1NTV1a05mOExDaVV6SFdBUW5hTThCUGhkcUtqK3VSbFBHVmJuK2NH?=
 =?utf-8?B?aCsySHZpeS9QM1RjK21GcFBBalBsOHMrdEJBajU3VkRTT1JaTWwxWUVIclBH?=
 =?utf-8?B?UlJXeEpWSnlaN1ViWEJwNlRiaUxoL3Z3RGZVNHJudFZaMWl4cTBSV3lxVmhX?=
 =?utf-8?B?K1FMUTFTTThTbDExTDhOQWhXc3F4bFJ4eUYzR2RPM1AzWGtrKzZUZCtlRVhm?=
 =?utf-8?B?ckFzMDZRZVVqUWNkdmhYT1FRUXJLQmx3U0dpMm1ya1BSWGlYVkw0RjF6K05r?=
 =?utf-8?B?VHJOY0tCTVRPMzJHcjVDN0RNRlU4c29sRk1hZWJ2NDhtbzZpL3RVMVp3NHRH?=
 =?utf-8?B?cEV2c0xsd1VkNGRIaWRYNnMxOHh3aWtxRDljMUVORGlKWFZ5bVIxQ0pCT0da?=
 =?utf-8?B?bnh2S2lHeXMrb21ZVzM0a2hDOTFZcnp2djBGbGtYL3FIR1piZ291WUJKbUhB?=
 =?utf-8?B?Vi9Ic0dyNTNQTFdPTGoxK1c2RnpwVU4zTzlvY3dqVFRrWkRtQTlDSFNZckh2?=
 =?utf-8?B?V3oxOG9ZQXV2blQ0T2NhM1dsL2xWbU5YS1F4alJhenpvQTNBZld1ait2ODFt?=
 =?utf-8?B?MzBLUjRjeEI0ejEzZSs1V2hIMGU4SUVYcWRoTktpY3RhR2d1WmZHbitmTHVr?=
 =?utf-8?B?SGk3Smc2ekFtZlord0xXSDZVK2M3T3R1VWRNRE5BdHBHMDJET1lzNFRoT0Fr?=
 =?utf-8?B?eGVzS0NGOEUvR3JFNzFIbmI3eGlxQzNkMUlod1pKOHB3RlFTN0xHclpZdk5C?=
 =?utf-8?B?L2Z5UitDc1d5T3RhcXZmNmVpNFJYR2tTcTFEUkJVT3pkd0NPU2I5OTNKTDNV?=
 =?utf-8?B?K2NuWGllZGJiaDNya1lLNTdpMlg2SEZrM28wWmI1ZDZHcXNpOTN1ZDJaYzBW?=
 =?utf-8?B?Mk5xMnlJQkg3VkRjcWxZUFJJR1kyeVcwRjZ2YkpKTll1bUpkR1BhOUZiZ2FJ?=
 =?utf-8?B?UlNjL0pRb3R3TmhSSnppa3NTaUhpTy9zSXQzaFhLeC9FL3c2bStsQ2V0d08z?=
 =?utf-8?B?MlhmRG8vcHplMHVRZGhCaWV5ei90b1FIQmt0T0RxdWw5ZUtQSEdGRkFCQ0Uz?=
 =?utf-8?B?aDJvbnF4c1VMdU5JdmQ2RCt4NktXSFNvSE1tZVVNWVVmMVZsa0MzNjllRTUx?=
 =?utf-8?B?QkxDc2l6NnBZRm4zTmRaODVRSEYwSFRLWldoYlRrU0F4MmZiYjNiellQeG5j?=
 =?utf-8?B?MUtyWXF4ZFI5V0JpUlpTZno3aGUxZ090a0ZZeVFVZjRLM3FlTnhncVVzZ0VI?=
 =?utf-8?B?ZkFRT0c1bXN0YjJwakIxZ0FubVgzMUpDZzg1TXhFcXZ6bFFURFZYS0VseGhu?=
 =?utf-8?B?Zmdoa3pwZkFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWRxWXJlMzZhOSswZEh1Qk1JT3RIa3R2VmhZclA5Mm9Hc0R4OUxHNlBmY3E1?=
 =?utf-8?B?OG1FMWpIeHpxYzdMUEFYaWRlck01Vjl2SExhSXBPdjFTbi9PZk91WGgzYTVR?=
 =?utf-8?B?TG50RWhiRjNuWUQwVTZaRGJoaFNDeGxEQTN1QjFQRHhxY0c3RzZ3TmFMSVh0?=
 =?utf-8?B?dVVYOGhyZkxyZTd3OTNhWWZtWno2VUFoN3cwUVdBNHBOTk93YVFXa3dQTTJw?=
 =?utf-8?B?dWFoaVlySnQvMEFiclY5T0plelBqVmNFclhDdUJkazA0YXM0bktVUFY5RFRy?=
 =?utf-8?B?cENEcC9SczhNZk8zaG5OUUtPMGtnS3l2R1REOVU3WFMzcVZaRmZmOGRjbi9o?=
 =?utf-8?B?MzlkNGczekNJcElPQU1YeHB5dGRUSEhidUhBSk5QRkUvL3p0WTkwZiswVHNM?=
 =?utf-8?B?eWh0QjVHSnBiU3FNVWpXQ3FNaVZISk04SWpHWm1UeElRWUcrdTJ3cWNtRUI3?=
 =?utf-8?B?dWJJTnpodHVjanBmbGNoTTZCNHJwU1VYblQ4V2pLaXhVZVpxaHJqd1VnK0hU?=
 =?utf-8?B?aUdrUDJxbHZ5M2gyS3RqVEsvVDFyS2FHclNKaHRERnN3NVZ6Z2FkMlVkQVBF?=
 =?utf-8?B?TG1ORytvbmZtMU9rNUFEU2t0eFpwUkMrOUJpRmZKWkJpSkVqeXl1UXlFd2o1?=
 =?utf-8?B?Z2Fwekx2RmNTYXFGV0VqVlg4elB4NTErVjk3QTcwV1Rld3k4MWVuRmhwRzNh?=
 =?utf-8?B?OVMzR1pEeFZFbU9HWmxobis1YWlGL3o0ckUweGJYVDJCOWdBb2x5V3p6S2Fz?=
 =?utf-8?B?OURNTFdRREx3Y3dQdHlYbjh0eWdPSFo0cldkdlRHcHRySGQrZEZUQkNCcDBx?=
 =?utf-8?B?OWJVbks1ajVjSFl3WG55SG9RREo2akpsd1ZYUEtNN2dEWFdDd01yb05GZitH?=
 =?utf-8?B?OE1mSmt4dFBSNlBMVmlWaWtVZ0dzMXFXWm9NY043KzdJajE3cURsVy82eWtQ?=
 =?utf-8?B?VHBUMkpFMWo5RzhsT3ZXSDN2dUVSOHNUbmE3SFVsSTJtQ1JrSEo2RU5CWXZC?=
 =?utf-8?B?Z3AxN0dKTVBhSjczR1RGdXh6SnpvS3VaM3RxeHR3NERPNGV3dUZVblVvbUti?=
 =?utf-8?B?TDYvVExEOWptUFRsRlk3aGxyUzNKejUvYzYwcFJ1TEV0YUhaYUFnQ3VwOUl5?=
 =?utf-8?B?a1daRnR3QStYcnhsZlVtTmQ4VzFCcGdvWWxRVGpQNEhIVlFmQjZFWWlXUUo5?=
 =?utf-8?B?TjJmelhOZGZnNEVCV0JKNjBGOUU1cThkSFQ0WktFSlNsLzlFMTVUVGZwOWpk?=
 =?utf-8?B?SFo4Ui9UQW10RnFOaHB5Mk5BeWxwWkFPbHQ3VStWTlFEbERydWQydlNqa21k?=
 =?utf-8?B?cWJRd2xHdlVuOVYvRS9sWmZBSDNJL05IUHVVWjJCb1B6ZnJRSlQvT3dVZElY?=
 =?utf-8?B?L1dUWHNQWm02REtMZ3NtRDhyUHl6K1MxUUUwK1VTNmVxTE54OUNDaG56eG0r?=
 =?utf-8?B?dTZLSXRLUlZLRnpFRUl1VGE2TFhxNEtBVC9wdTYxMldPVS8vR1J3aFhhekh0?=
 =?utf-8?B?QXo3MS9QbG5VRWhyZnowWEFaK29iZjNWdk9YTEV3VkZESW9lY3o1R1ZUYkZP?=
 =?utf-8?B?TEJEcVp0TFd0VDlJaUY4V3VZWncza3FLQko2UVg4VjVadUJvQnF4NkFMbUVz?=
 =?utf-8?B?OG5KOVlZSFpIMDNRQURjMGhEcElBOUc4bDI3UWxJY2FUVjg1UWJlbStaaGo5?=
 =?utf-8?B?ZHRkT3dZUzlRTDdCOGMyM3FHcW1SMnZycS9OaGV1TFIzTWpuM25FNFpoeEQy?=
 =?utf-8?B?blg1akVtTlVwV2pYcnhyWnRaRWN3Y1dBMW9jY0l6N3RvNGdkK0lsYm00SkdR?=
 =?utf-8?B?dHhZQ3RZZ3dNWTN2YmZROGNLVmZScUZZY3owdzlMb2Z0TzRSazU0Mk51dUtz?=
 =?utf-8?B?U3RJRldBdituaXhqV1dkWUVMbjhvMlo3WncvRS9hdVUrTXhKeDRXaWxoK3h0?=
 =?utf-8?B?V1l0WnJ6dnFvWTkyaWFMa2dGbmQzOTNlTFVVSHlqZHlRTC9reGZnOHE0dU1B?=
 =?utf-8?B?S05VZHVvUzh3RWNsaEVIcVNocUdvc1J0T3VVak1WN25mWHJ2NSttWG5LSWdE?=
 =?utf-8?B?a0lyMnU3YzdGaExOSTE3RGE5MXZWekhNZ1JjMnBONWVXTzdWeDhJSWMvWVpt?=
 =?utf-8?B?aWs3MVhtdlVFT2hsSHJETndxNFV2Z2sxS2xYVnlQTTdJM3llTU1jcDBQVWtQ?=
 =?utf-8?Q?oTrZ0E2uboZe1fYOH2/y32AKRgNhu6mvASXBY94Wyzxp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc36a2c-466d-4579-66e6-08dd9833081d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:45:10.4870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBw0LcYmuS0FjPPmvs8oIDnxIdHSH2qygOSSvBTmFCAPFH3YXI4UmUQd3M0DnbJWD5q/46CfDgzyP++3HvbfRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

We will use this error in the nova-core driver.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 3dee3139fcd4379b94748c0ba1965f4e1865b633..083c7b068cf4e185100de96e520c54437898ee72 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -65,6 +65,7 @@ macro_rules! declare_err {
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
+    declare_err!(ETIMEDOUT, "Connection timed out.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
     declare_err!(ERESTARTNOHAND, "Restart if no handler.");

-- 
2.49.0

