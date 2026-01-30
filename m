Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EOlCnRtfGkSMgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:36:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2AEB8781
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B61410E95A;
	Fri, 30 Jan 2026 08:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="q2+cUFzo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012048.outbound.protection.outlook.com
 [40.107.200.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE0810E973;
 Fri, 30 Jan 2026 08:35:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTZglbJgh9+M8SR9iHkNKt9dvxh8LBCgf4i17Ouf5I6Z+M8N8w5mWKLMZmHJotKzDQe9cBGBJIH5YaBwsCEgkyuYEhS/UmEq6Yg3IfiIqI6yaOIrSmp1+UEVeEaIi3UOfcrgSqyAGO1IFAIBYLJ6Hx2LkiAjKJlGLdRBUOvPUb7W2lklCbN9lKbotVPEZ/mlGQzLYDgWqWZvT9xqo8r8Lgw3xqWa1FHu6BFfEo3ym1Lh7gE4lMChML6cijleZmUS5RvmT1PqyZJ8Xxz/z7XqbYJlnk1mqahKC2Zv/bl32ZCDAbPCrtaS3zc7OtlPoTtbQTG/mNw44GP3dOTQEDnJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wm7gE6s35eb7zMseO055nM8/YUBt4jNGijgXAN+Np/8=;
 b=vNChFcDttWi2+ponhvg+A6VrU0NnPxLCeI6Ln4b39t5luKKUDLfHiyF2L+1Mh0Tnpi0D5jfkm4USRChFcMbuf9fR0nP56Ip0WL3h0Q8c9fMtXSDfor2DMeE+Jfzw20ffrkoPei6GWvte6Nv7m5YP1xXpZUKVifYcwX9LLiuqMuADTAcGbMxwvl8P89u78xZE4ZiMt61vAIzWxqecWwiIpWOVH2/I/WUGZFswHqeOuevl62L2/Qe5UNkQSsb66KDSTLj9qVBo6lhGK3tcY6nE5HCyGSpRR1XU+lnO8rtoqL9dtqYUoyZziq4fRSULIf8kKOCLZdbi2KPUDiw/QkCmfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wm7gE6s35eb7zMseO055nM8/YUBt4jNGijgXAN+Np/8=;
 b=q2+cUFzoeu0VYQDSJTNjrYa1dNVTg3OvK0x9KhFQxwFKRGpzsYf1uJlsql4fqECTIVW4pPniJClOku0KTVvL1zMGsgxJN9zeU3Fwao2iJyLZoMTBPUT9996sam0tZbpRbPN1f6mu5OBKYpKzWv7rlnzvBc00K7+nzPba/QsbM3QT5Fiw7UBoZLqA6GRqS1NFuVT+LKdO9yGci63kyUr04+0sBv9dynlm0yT0CcYE7txli36uhnlzOh9KyKCMme6gbWHmQunELe/ef2D3cQXULHF3mjxXbca+708FwTifiCun2XWO2+GYEL9zXBBWyw+EWFwrCCdNqZYfwzkNojnO8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 08:35:51 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 08:35:51 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 30 Jan 2026 17:34:10 +0900
Subject: [PATCH 7/9] rust: dma: implement decay from CoherentArray to
 CoherentSlice
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-coherent-array-v1-7-bcd672dacc70@nvidia.com>
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
In-Reply-To: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::13) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH7PR12MB5757:EE_
X-MS-Office365-Filtering-Correlation-Id: a4fa958c-ff2a-4f3b-76c1-08de5fda937d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZCs2YkZ1ODhEZlpEV1ZOTnJIbTJLUFN4ZVp4Zi9yQ1BYT0l5TVV0cUFEbmFU?=
 =?utf-8?B?WjBuYmZYWkQ2ZVNhSFdVRERlMjhUNVZFcnJtWTJLWEE3YmduV2ZGNUZyK2pS?=
 =?utf-8?B?a3Q2VUdmWTBNWVI2ZFJsSkM2M0dFRUVBQnV0c29DVnBQKzdMNHlMTmpZNlJz?=
 =?utf-8?B?Z0E0ZHBZRTFGUmdyS1laMlhzY1k2NVRML2M3Y3hjeGJPbS93WEZRK2ZUcHNE?=
 =?utf-8?B?NnBOTTd2THB2WHk5Z2VmTFJIVExOejgyd0Uxa05uWUttMStWS1FhT2xETkp6?=
 =?utf-8?B?K1pKYWxHL0x2c0Y0cnpmaTRIbzZqQ0xwWW54bFF0WDcwcVYrcXpoWDBjN0Fh?=
 =?utf-8?B?ZUJDMGpPa0xKU3ZrUHhISjFyVE9zYW9ncCtLTUp1bHpNNllmQWVzTjFWUWhV?=
 =?utf-8?B?eUtLRDZMcjR1eHpubzhRTkVrSUhWUGkrSGt1cWIyNlFkazhMZThzQVRsRVBU?=
 =?utf-8?B?TGwwcVFKdTVNeGRORlpNcW5QOFN4S1BqTHR2L1lZbmNJWDdlMlRzSFp0M2VL?=
 =?utf-8?B?SXB0QllyTlNrUEh2QW01dUpyQ0I0bmZ4WmI2SHhXNzBteWRQb0V2b1Jtdy95?=
 =?utf-8?B?UVZTSjlBUGt5Z3oxREZkcVpKQ1JwTWVKUjB0ajA1a1ZUUGMvaUNmeDFnMytO?=
 =?utf-8?B?QlAwdENKWWZZMnpSS21ZWXVlUlY3MnRNbDM0SEk0QWNSSXZOaUdwZk9uWjd2?=
 =?utf-8?B?SXpRZ0FFdjVVeXF4YTQ2dW1YTU9CU0dRRVo3LzZ6QnMzczM5NEdKQkp2ck90?=
 =?utf-8?B?QlNTUnhTYW1mdENpUC9CdVM1Y2V3dlJzTWlEY08xQlhmb0JPaUppUDdqN2Qv?=
 =?utf-8?B?cmE1NG9TY2tIOVZIalpOUUM0SjJvQXNqSDBuV0gzbVltYnVBYk03R1JHOUhV?=
 =?utf-8?B?bmptUHQreTZ5QlhJcjRWR3FlWVVianFTVkpjUGZ3SUJlbDNVUFV0V2VzMFVM?=
 =?utf-8?B?aUYvV0hYaUM4MXJXRnV0dWtaRVJDMmJnU0twOG0xU1NGNDE3eXlXYzdTSU5n?=
 =?utf-8?B?d3JJQjJweURGTmRiemZxcmt3S09LUXFFNUFuNjBYRjFkU0tvU3BqTW9halJP?=
 =?utf-8?B?RXJsUmlKZEdoR01OUGJZU1ZwL1BlMS9LdVFlTmc5YlpLTXdFMnNNMVk1SG04?=
 =?utf-8?B?cEViYjU4NDZhY2VoRTFibVlYcXVnS2oxOFRhSVFQRG14K3NyZmx1U2o2MUF3?=
 =?utf-8?B?allLQTVTL3FPaCtJOHZrVFhSWnVxcnFtcmxzelFva1FIdUZJODRXd1Z2V2lj?=
 =?utf-8?B?YzdkaXNSWTRUVTdRZ3NRSHBUakdFRFhmMnZ5L01tdnNhZVEycnllNTVGbFJy?=
 =?utf-8?B?T2F1d3RqKzZuaXh0amRhVXFURk1HOHpGcGVLcnZQcE1XQnZrdi9DRVNkUVlu?=
 =?utf-8?B?VytrZzJ2QlBFR2RZNEZDb2o4Z3RsOG1hTHRLOUphYnpKVXlsZzAzbVVDckNl?=
 =?utf-8?B?MW5nYU12QWVFTDFEUk1PWEwwOUNJQmtxVmhSdjcvMFo2VjV6Q3pKVFBTYVpV?=
 =?utf-8?B?VDlpMHhKT2RGZGM2NVIyNnd3L1JhQ1ZzckJnQXlab3NteXhTM2g3cUx0TlhY?=
 =?utf-8?B?S2h3VDZ0UkRQeUgyWTN3L2M1RFJWZ0dDVk5NcXVSZ3JhM3UwRjRwUDZwa05p?=
 =?utf-8?B?ekFwK3JNY3FSUUIzVDE3Z1k5Y2w5TE55OGEvS0taTXFSQmViV2NONlhrdjZZ?=
 =?utf-8?B?WDdLQnk5S2xwT1BWYk1Ya3dqUVI3U0I2b21ndDMyQXJXS1JOOXc5cDdkeHI1?=
 =?utf-8?B?cGVVY0MvY3R0b254WGtJMFZ3bmxQelgvcmVna0dyNUVFN0tuZFlILzVYV2xk?=
 =?utf-8?B?ZXRSVk5sZGxkRmVQMDNzeEt6dWZNRmsxQVJ2Ky9rWUNCN0lyaWx5ZEFlSUIw?=
 =?utf-8?B?bm5DQk5UYi9ZQTN4bjE0eU9LbWd4RGFGSTFsbHNTTFVDVjl0M3paWkZzL2Yw?=
 =?utf-8?B?ODIya2pzNE9rcVh2enQ2bHpmaXFOdDFwOGluYi9DdFZDQ2xCOHVMR3ljcitT?=
 =?utf-8?B?aDZsamdRbW43UVRKbUkzckFwYi8zelZuOWJSenJnQWJVenhOTDBCdlpJamhh?=
 =?utf-8?B?dW1Cc050QlRsWjE5THRrVk0zYnhmS051eWtwek5Ka3diTFhzSjdXK3JEcDJn?=
 =?utf-8?B?WmZBYlZNM1hDc3NQYWVnL2gzZDltSnlabWExSWR6N3RNdFE1UUZtcktNTUFv?=
 =?utf-8?B?REE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEZiaDFYUHJZaFp2cC9hVGgrQVBqMEplT0xDMzFBZlFGU3pnM0pQV2dab09Y?=
 =?utf-8?B?S2FwUXhLVWNDMmJMRjdCQ1lpUWJkalYyc21CYXh2QkFFQW9hVjlTVkxvdjFW?=
 =?utf-8?B?SkcvTE9GOWlzcmtJeTNFdXR0Y2FzNXgxUHhKZVk5MUhwQzNtS29ta0gvWVd2?=
 =?utf-8?B?bWE4MVkrZEM0c1ZIRk4xSHRDVnpIeTlFc2JONlBGWGkzOGJIdGFlOHFrUnZ4?=
 =?utf-8?B?RVNiRFFpRG5XaVVoSjUzREthTDhndmJFMHVsbU0rREZXbzVYUjRKNjk2cTl4?=
 =?utf-8?B?WXNib2FpZElJanBXRGJxWnh5WVJIS2ZJU3JDQ0tOSnFhbzFZUlFEUU8yY0o0?=
 =?utf-8?B?aWE2a1FQT1RqTHRuRERwcjV3dU5EYmlVMDBac3lkTHUrWklwQkhxUkdpRk5r?=
 =?utf-8?B?QW5zRitzZWxCS2NCeUt6MEFQMlIzQ0tHUitEN2IzaUNuRjhZMThhNDhaTXZ0?=
 =?utf-8?B?eU41Y3BSSytvT0M2VEl0WkZwSjlZL2c1K0tMRVJWcnFSdmhGRnZKbyt2aFd6?=
 =?utf-8?B?Q05pbk91TnZqdUk0cW5OekVGekFsZ3ljWjJwUnlqcFpMTFFQK0JsWkVJZWNu?=
 =?utf-8?B?QTR1bUs2UXBWVlJKcjl5S1BKcXBnU1lqUnRFR294WlhFN0xpTUEyV2U5V3Z1?=
 =?utf-8?B?N1hySm1GSzF3Qk1ZdVB2dkVteGdPc1Urb0FrSzB4dzVhZWw5d09MdXgxcDhl?=
 =?utf-8?B?NHFIUnpQaVNQZXRRMDcxY0JzN1RreEF0YXhaZzZ6bVdneENjUTBmS3lQRnVO?=
 =?utf-8?B?TGw1RXVGZHN2b0JBRktnVkRWcktCNFZ2NlF5YWJaYTlCaDcyaWs5aCtLVVMr?=
 =?utf-8?B?T0diNlBsdXBqUDF2VlVJcnREVlhoZnpsVDNwTE1XcDRuN1RKbHU2blo1Snpj?=
 =?utf-8?B?MDFHczJBcnlOaHkwVVpLQjJQSGVLZEZIc2NNSjdJNHc5SnE2Y05wVy9QMGZo?=
 =?utf-8?B?bXBpMDFMWFpWUXZscTFuMWUyb2NtZUIwdFRtTHd0SXFzbWo5ZHl3bUhDejEv?=
 =?utf-8?B?anlnazhNZWd6cWl0clF4VmFoN1JyS090b1pnTlVvM1hIZ3BvLytlSkZNdWtX?=
 =?utf-8?B?SnM5YmthbnR5TG10OTdzblRxQVc1ejV2UWQ3YmhPZlUrOGR3YTZ6RU9JUFIy?=
 =?utf-8?B?TjRYbEJUdkwrOVBabnE5SXNIQzZ0ekdPbGFwMGJQeHIxWWJCQ0wxYWZJLzM5?=
 =?utf-8?B?dVNPUUc5WmgwbTBITnBkN0wxak9sLzNyeFpUU2E5SVdHSzQwbWFZSjRJNWpB?=
 =?utf-8?B?bWR6cG9rSGFZNzhqeDV4RTNHVkM5WXh0Wk1YY1cxSHNvNEt0RE45eUo4ZE40?=
 =?utf-8?B?ZEYvcURqN0hKUUFZNEFzSmlQb1d0K0hFZkhoWHlaWmJSN0pSRXFSN2NsS0h2?=
 =?utf-8?B?R3pNNVROcVpiUGZId3E2OHBmNHJVZWxsQUswUHozQklHa0c1ZkZKbWtnemVS?=
 =?utf-8?B?S0l3ZUVqSGxpNzA4TldjV2FNcVdIdVNjdVBCM1U2Q2dkdExrcHMvZzBmYzF3?=
 =?utf-8?B?amgrancrMXJMRlgyOU1WNys5Q2wyd1hhcEdiZndBSi95ZE84RGJ6cnpQUVg3?=
 =?utf-8?B?T1FQOEEvMDk0QVBVempucEJDL2hLaVlqT00yTWdHUmYxbWgvY05Ld3F0KzZV?=
 =?utf-8?B?THRZT2lNK1BVYXdiRHZEN3hBYmlIT3dmd3hVZkZ1YTc3N3JaZnhsc0NCbWl3?=
 =?utf-8?B?NGVHdmRQUjViMzVrWUUxcC9JbDFKcWFaTmZhaE1nZFBXajZIM3U0YlNUckZC?=
 =?utf-8?B?OFZReWg5RWxObGZ6c0FjRWp1S25kS25qUkx4YTgvZU1zN1V1ZmxIeUFMUXJj?=
 =?utf-8?B?a2V1cExZS2k2TG8weGJYbFZDeVk3d2Q5a0VKcVFVTStyN0FmMURaQm9sSmN3?=
 =?utf-8?B?SU03UHBHZVhRdUNtTGpNTUUzd0o2b3ZUcTNWSzRYVzhHVDJYZ3hkNU1VT3Ax?=
 =?utf-8?B?bWtLNS9XbDBIQ0tyMFBzQ3JDblpFdU50a011Q2k2VWlFTTFsK3J2YitDa1ho?=
 =?utf-8?B?cTg0czdmNHhIRWRwL2hGczY2MnV3aFJ1WDdTcWVGY1czd2hGSWJ5OWk4cUtv?=
 =?utf-8?B?UDRZL0NjemNTRE1qUFArTDVRTHZHYkpjT0NLSXFGUmp6aXdBWDQzd1MxMkFh?=
 =?utf-8?B?alFVaTA4Wi9kOTRKNmRqOTB1WnJia2xSaEQ4N0V6SXp5TjZvMmlqVXRjUjhX?=
 =?utf-8?B?NzFybXhMVTJ1NC9MM3ViUlJGQ01CMnVxRlVOcCtpQjlOTDNtU1VydkxYZ2Vj?=
 =?utf-8?B?T0xiOWcrY01kU3hoMm9iUG9Ba3FFaDJ4VHM1ZzgzTmxRMnpWelVmTk9WTmRa?=
 =?utf-8?B?WkV4c1VweDZDaEk5enlhSXRMbWdmRWxjcG4weW5zQ2t5WUJmS0JvSDJiSnlX?=
 =?utf-8?Q?CAwnKqoX8SOjT0AmfAB+DYSWVWgRw7sCdmKA/BHmYG4K9?=
X-MS-Exchange-AntiSpam-MessageData-1: ExEOlUFlNde2pw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4fa958c-ff2a-4f3b-76c1-08de5fda937d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:35:51.7381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXksveCiodlzXoBj2RGJpdh4rxFGg8r1QM6QI+hL6IgqKr+d0o7Ir11REaowXd1sDTKcEeRHCq1ClkIEh2Z0Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5757
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch,collabora.com,arm.com,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: CD2AEB8781
X-Rspamd-Action: no action

Implement Deref, DerefMut, AsRef, AsMut, From for various methods
of decaying CoherentArray to CoherentSlice. This is so statically
sized CoherentArrays can be used as if they were CoherentSlices by
code that doesn't care about knowing the compile time size.

This also helps avoid having to annotate static sizes on types all
the time.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 rust/kernel/dma.rs | 48 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index f3920f74583a..25da678c863b 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -12,7 +12,11 @@
     sync::aref::ARef,
     transmute::{AsBytes, FromBytes},
 };
-use core::{marker::PhantomData, ptr::NonNull};
+use core::{
+    marker::PhantomData,
+    ops::{Deref, DerefMut},
+    ptr::NonNull, //
+};
 
 /// DMA address type.
 ///
@@ -389,7 +393,8 @@ impl<const N: usize> AllocationSize for StaticSize<N> {}
 /// # Allocation size
 ///
 /// [`CoherentAllocation`] is generic over an [`AllocationSize`], which lets it record a compile
-/// time known size (in number of elements of `T`).
+/// time known size (in number of elements of `T`). A statically sized [`CoherentAllocation`] can
+/// decay to a runtime sized one via deref coercion.
 // TODO
 //
 // DMA allocations potentially carry device resources (e.g.IOMMU mappings), hence for soundness
@@ -402,6 +407,7 @@ impl<const N: usize> AllocationSize for StaticSize<N> {}
 //
 // Hence, find a way to revoke the device resources of a `CoherentAllocation`, but not the
 // entire `CoherentAllocation` including the allocated memory itself.
+#[repr(C)]
 pub struct CoherentAllocation<T: AsBytes + FromBytes, Size: AllocationSize = RuntimeSize> {
     dev: ARef<device::Device>,
     dma_handle: DmaAddress,
@@ -857,6 +863,44 @@ unsafe impl<T: AsBytes + FromBytes + Send, Size: AllocationSize> Send
 {
 }
 
+impl<T: AsBytes + FromBytes, const N: usize> Deref for CoherentArray<T, N> {
+    type Target = CoherentSlice<T>;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: `CoherentArray<T, N>` and `CoherentSlice<T>` are both `CoherentAllocation<T, S>`
+        // with different `S: AllocationSize` marker types. Since `AllocationSize` is only stored as
+        // `PhantomData<S>` (a ZST) and CoherentAllocation<T, S> is `repr(C)`, both types have
+        // identical memory layouts.
+        unsafe { &*core::ptr::from_ref(self).cast::<CoherentSlice<T>>() }
+    }
+}
+
+impl<T: AsBytes + FromBytes, const N: usize> DerefMut for CoherentArray<T, N> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        // SAFETY: Same as `Deref::deref`.
+        unsafe { &mut *core::ptr::from_mut(self).cast::<CoherentSlice<T>>() }
+    }
+}
+
+impl<T: AsBytes + FromBytes, const N: usize> AsRef<CoherentSlice<T>> for CoherentArray<T, N> {
+    fn as_ref(&self) -> &CoherentSlice<T> {
+        self
+    }
+}
+
+impl<T: AsBytes + FromBytes, const N: usize> AsMut<CoherentSlice<T>> for CoherentArray<T, N> {
+    fn as_mut(&mut self) -> &mut CoherentSlice<T> {
+        self
+    }
+}
+
+impl<T: AsBytes + FromBytes, const N: usize> From<CoherentArray<T, N>> for CoherentSlice<T> {
+    fn from(array: CoherentArray<T, N>) -> Self {
+        // SAFETY: Same as `Deref::deref`.
+        unsafe { core::mem::transmute(array) }
+    }
+}
+
 /// Reads a field of an item from an allocated region of structs.
 ///
 /// # Examples

-- 
2.52.0

