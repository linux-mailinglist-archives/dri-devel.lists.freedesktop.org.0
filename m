Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5768CB31834
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 14:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A503C10EAF3;
	Fri, 22 Aug 2025 12:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n2P+SxDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5E610EAE8;
 Fri, 22 Aug 2025 12:47:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPMAsClHTc9Io0PnpTQkJSvmpFXccoAbWH+5bCUH/T73DmBnsd+KPcaonWTDb3KS5T5niC6DKhPSw96ABORRzXy6zHZ0Ep98PCO96mrLphKYy6eQduL9qrlqTxiub1FMKnjeEvrf5X8s+Dt3CvGa8DtBAD4oDCvowH+bHSD9xwf5F98POSHHU+d9lw6wT42EN0sNi6qpryw7XoBtZCPtpYrKhjbOE4IuzFcn/I2b+eKeMBPKS530jJ19NgFKxarFNrsmzIEwOCIeBox7GzPXbUESLpvbqol1pexP71oM429nu2k6poSOfs7H803In1peBlLSadkA1d1kug+hVmqgTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrYqeTPiMwfaR8Z6zutaLPf1nxcxfFq303ew6rs6llk=;
 b=w/lnQE8THV4aVZ/cRPMmASnXiIRhF5GWOfX9IHwe8BGQ8482sfzWKJ8BMogN2l8gy71tViTRTI0J2BAGnbBryd7nYvm/6Uc/qOn2RRZmWECCnZg9AV5HLZg0/MI2xJKHL9n0FtKD/SsliqwE7tq7IgELql38VbxjWtjRBuZz1YVyNxaYdzNwR0Hc27UpH6rNKBlj9QDC+X7Yu1NvON6ATiNovVrUSjjqTfngW/JGly8u4LgWIJ8KLdrP6wko89bAldzcvCcGFqSRpidczYbN7gZMFVjBvpxQR5+xlchiVwUKbUXl6rPjaSnxBFGxN5Z/s6B8wWUslowE+DMwJMoSVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrYqeTPiMwfaR8Z6zutaLPf1nxcxfFq303ew6rs6llk=;
 b=n2P+SxDyMx+dGTeWdsI5/bic0qOhk2ej0pPt8ZWl4FSw3xIZmYPXbwdUGJKfjy59AxKKyFR89qP5oMys5L7O/A/zfkvmN0KUXG5X1mgaBirQl4aXTVtLqmt8QX+nTAi0k272RXKhjaxzKzSgI8ml88WUBsxZk7UMKxFi5Yd/37pWgOQInF3RfaQqOkGyqJDsl+ndHj2g7bhCMwcc9mkTbkwI36PBSvdXiZrAZqJwDWx16dUGblOhZExByzHW7G89j9n8CG+t9cnP3RJZE2nVnVY7nlGToQiydbw5m6HS8IGmiCdexxo9NQYbT/FcAeMstow6aKyDaI0I8TheyRIRrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by LV2PR12MB5823.namprd12.prod.outlook.com (2603:10b6:408:178::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 22 Aug
 2025 12:47:49 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%5]) with mapi id 15.20.9031.023; Fri, 22 Aug 2025
 12:47:49 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 22 Aug 2025 21:47:18 +0900
Subject: [PATCH 3/5] gpu: nova-core: firmware: process Booter and patch its
 signature
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-nova_firmware-v1-3-ff5633679460@nvidia.com>
References: <20250822-nova_firmware-v1-0-ff5633679460@nvidia.com>
In-Reply-To: <20250822-nova_firmware-v1-0-ff5633679460@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::7) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|LV2PR12MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: bda67405-3c5f-468c-780f-08dde17a19cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eCtNRXhBY29VU2pRY1RyN011dml6Zm5oMnJPelgyUi9MNncyQS83eitzSEs1?=
 =?utf-8?B?bGRHblRxZUpyMVN0ZElCNmRqaUFtdjBsNGdhdDdSbmNsZGgvZG9yU2tIbFdm?=
 =?utf-8?B?anhaVmx2UGxtYlNERkF5ODI3cEFyYVd6SWZkZHpvWjgrbkxnL20wVzlKU3RU?=
 =?utf-8?B?K09HZE5tYVZwYUlHSkFpN1F3dTl5M1dQUHFPS2ZhTWFjcU8wM2wweldhcWg5?=
 =?utf-8?B?MFJKTEg4R1VMbnFaT1FrMGRwamJGaUVUcXc4WGJOSTdWMVVHSWF5ZXhzb0lM?=
 =?utf-8?B?Qk50Nk5NelhyZjQwaUVxR3NJblhjOU83dlNkUUJDS3JmRC9mUC9WKzVJWlMv?=
 =?utf-8?B?VXM3U1dueUdNUHNJNzdkNEppRWlzblBaYmJITG5NK1NtZTdBbWJHczVISDEv?=
 =?utf-8?B?dWIxVUJEUThzeWVlQmMrTmNzVkQvRWJJaUJScHRGTWp4cVZrRGU1NzZ3Qzd5?=
 =?utf-8?B?UHU4YnpUc0FrQnRuWnp0djdwclRQNDE2S0xvR1VMdTJNdUNkamoxT24zdy9E?=
 =?utf-8?B?S3lsSVB0dnAwNXp5Y0RMWm5WNTlUeFo5Y0dIREhJNlFzU0hzRkxGNnJwdVRH?=
 =?utf-8?B?T3VyclJHRjZzcnhhUXBHb1ROSnZIWmMyTTVURDZKV2UxeXNmWTJvRk5KaExG?=
 =?utf-8?B?Q3JQeUtpZ3pvdk1aSm5RYWxDOEdHSENYSi9JbzVWb2s2c3l1SW10NnF2RGVv?=
 =?utf-8?B?VVRDM3hEbXREVnZwUUU2UU5TbzR4VHo4OER0UVdOK3M3RzQ2eHhub2dSaXp0?=
 =?utf-8?B?SFg1ZytYMVB2aGNyUkUvMlFhRUZTRExaVGc3LzA5WXZoYytRelZ5ZWViMmpx?=
 =?utf-8?B?OXh6YUlsWGxEVFRuRTBaaWRBRzVsZjh4TW5CWndBcm8vUDNQN3ZKUXJhd3gz?=
 =?utf-8?B?Z1FJZkp3MGVDUVVwZXFvd01YQ2hUY0x1SHNXZk1CRUpPYk85TDhsMTB0NlFG?=
 =?utf-8?B?NERnZ09POVF2VWp0TERLZDJrOUVJRkhSWnI0VWlkNGxxcmVWbzQ5VENPSnJm?=
 =?utf-8?B?Um8zQjZId3A0SzBDSU5IT2FCczdKbGZqYXV0WVV6ZmhoSWJFMUplNUVZMysv?=
 =?utf-8?B?UCt4c1ZjZ0V3MThoaUpDNHBnRE96YTJZMWlFL3lHTnFaeERaUlBZWkZ5ZFln?=
 =?utf-8?B?WFJDNDJMaXlwWlpQL2VuVzJIMXJzRFVnaXErdFQwNms4dGZOZGxWMklzZHlx?=
 =?utf-8?B?a0RKY2Vwa01oSW1xZE9KdDlhZ0llamJremw1R1NDQ1Z3b0g5Q3RoQzBKcjk4?=
 =?utf-8?B?Tnp0S21RcG1TN2Z2NHZnNjBJY1NNUWlST2dzNWpvWEsvTUljUGw5OE5TVnpa?=
 =?utf-8?B?Z2YxWWRuMExpS1oyaFREcG51aU5aUWVob2JHMW1YRERqYVp6cEFNWlB5TEsv?=
 =?utf-8?B?eFV6bGNUMHRaRk53blhwVGVONTJmOFFaTERqWllYWk5rOTRqV0UyVVdzTklI?=
 =?utf-8?B?NU1xSTNETnVGZHFZWWpVQTlVMUpqZ25tSGdEcWdEcmpZOU8zZ2p4TkJKUVUz?=
 =?utf-8?B?Q1IrV1ZDS083SWkxV1JGeGxYamovUUdxOTJHM2xoNHVaM0ZHRCtzOVFtdkRu?=
 =?utf-8?B?S09GTi9CYjcwd1J0SEhaYVJCaWgzVDhtWm82eWI3dmQyOEFRRlFZbmg4Tm5S?=
 =?utf-8?B?VVRqYVdEVUJRdUhTZXd3SGFabXJNVGQySTAvUzFDNDFvR2I5K0ZFaW54SzNH?=
 =?utf-8?B?ZFV0UE9pcGZPL0wyMk9ZYXlaaGZ6M2lRNXhNR0t2OGdaM1R4VFZSRFQ1d21Q?=
 =?utf-8?B?MlB2WG5CdFNDZXBZTnNzcXlLVHdSUWNTTzFQbzhkN3ppWWZWOE0xUlMrcFE1?=
 =?utf-8?B?VXAxZWx3c2wwQnYrZUM1aStSY2doVkhxa2p6YzJxUCtRNENqVFIyNS9UZDZO?=
 =?utf-8?B?cnBEdFhkOWU5KzlPUXg1M2Z0aG93eHQ5UXdpT0VQWExGYnJSQ0hER3FjT0xH?=
 =?utf-8?B?UkVsc2pBZ2xaREpYT2NFOU5pendvUkZ6QUFwekN5cFVIZzJSUUlsR3RueGcw?=
 =?utf-8?B?dDQ1N0p2YjVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUZObUxLSWI4OHlMQVZpbkt1Rlhoc2ZIcDdOM2E0cHNqcjJLS0JPWnIvUC9H?=
 =?utf-8?B?azZYajFNajZ3U3l3Rk9NL2JGako5MDVIU2Q4SXY4SXdvb1RrNDcrbVZaVjB5?=
 =?utf-8?B?N2R0d1BJa0FodkxaWmNobTJxM2owbGE5aFllK1BWNlIzMU9ZSGc4aHNHVVR5?=
 =?utf-8?B?VEhwS0VHSzBvM3pNKzJMb3lCUE9adlM2UWg2Wm15VDUzZ0VSZVA1TGc4U1Vm?=
 =?utf-8?B?MGNHMGRVSmE3bTdVcTlFVjFYOUN3SUlvQmRHQ29lQWZFSERqVTdjWWY1WUEw?=
 =?utf-8?B?UFFIbm1Hc213SGIwbHkrcmtSTjE2dTE5b1RnSUdDNnFOVFFuZlRCS0c0aU9X?=
 =?utf-8?B?YUJ0NzA3N09mUTFFNC91VHNPYk1KbGNjbk9QUVZkWTBhS2RZUEhFL1loMDlW?=
 =?utf-8?B?b1BJRk5LMUQvU1BIMGQ4OVJXOXdWYVV0S2hqRWY2Yk0zVTN0cXkxUmN0aWhP?=
 =?utf-8?B?UXBrYko0b2w3UjlzQWhUN3BodlU5TzN4c1h1VlU4Sm1VVmhSc3l2Skw0VURL?=
 =?utf-8?B?dTBhWENsRkI2ZFlsY0x1R1R0emJiR1RrRmtZak9hSjBEdnBwaXIwVndacW03?=
 =?utf-8?B?MzQ5dnhIZ2NoMmh6ZVhXRStRUEM5MEFyRHZlb1VweVBqWHhoVVJXVlVxd1ZZ?=
 =?utf-8?B?a2k4allUOFd6S3hOYU9ibkxBeGsxVitvTFAyZVFFZDZKSEZ6QUxjcCsyckhF?=
 =?utf-8?B?cVhhVVREdTcwUENiYkNDMlBhOWRqS1BCUHpJRnVEZ1JaNTFNRjBGZlRGNnk0?=
 =?utf-8?B?eWs2TVFxVVdKcGF5Q3p5NTFET21mTUN4MVd5R0FLMXM4elN3Vy9ldE45bWRF?=
 =?utf-8?B?NEZvNGRKdUxNOHpJK1pHK2paOGx1ZkRCNFEwV3lvcXV5Y0ozN2NwQ0F5Wndh?=
 =?utf-8?B?ZHk4NXJkTUZXWFVINWJVbitIWi9lckJ6bFFDUG5WdjhmbTlSMEg4M21ORDBW?=
 =?utf-8?B?UUZpQkF4bndTcDZmd2VOZ3k0cDVuT25PZVlRb2tXL2M1RzBwdHF1aU5uQlV4?=
 =?utf-8?B?Ti9hTFRPTE44eTdLc3RlYjh1TzhsRjlxRGQ1b1Y2ME91TkQ1SStNWFN1MEth?=
 =?utf-8?B?enQ2ZkJ5WitpN01Wamx5bktMWEZWK2lWR29Ubzkzb1BLbWQ5M0Z1VzNjQ3RZ?=
 =?utf-8?B?dXM3T0FkODA5NlBJT3VreDB5Z3hzYzQyKzBpaTJwQVJtY3U1R1NXNWVKUU4x?=
 =?utf-8?B?QUhxTDVKRnBvRmpPMWQ5OGE5NjhDR2IrS3hlUCthMTE5M290VTdMMnphR252?=
 =?utf-8?B?L3JrMm9UVU5NNFQ3VC9sTnpqcUdQcHROL2YvbmUxQW52bk9ZYmtFOXUwZXRT?=
 =?utf-8?B?YkpoRWo5VVg1WDdVd2M5Q3NFN3VIekJiMExONFZaNjJVUTN4UGpQOW5ZTGFu?=
 =?utf-8?B?Z29wdzZVdkpPbkFBM0tRWEl2V096RnRVb2FMckJaMGNvb3hTSDVzV0gvYklW?=
 =?utf-8?B?NEg3MlZxNDlubDdHczlMT3lYaW1VZ0V2REYzclBvc1dKYkZCSWNGSVhGTzNY?=
 =?utf-8?B?VkxPbG40UG9CdE9LbCttSTk0SEd6L3VFTVVmdjNVQXgxdVhjeVFqcEQ1cExN?=
 =?utf-8?B?RFVkWVZRVXZNNEx3YksyYTZSMWlDYUFmNEZqcDhwaklCM0JTMUg5Smo5U1Ns?=
 =?utf-8?B?SCtSc1pleXlZNnI1cFlJTlc4N0NtYmtQZWFJT1d3bkhNRHpSeHBpbSttdi9D?=
 =?utf-8?B?OXJqYkdQVjZhNGVnd3ZhWVpoQXVZY281TWd3Z1IyUmplS0ZEb01GMkZGODVv?=
 =?utf-8?B?YmlyM2hZTk85Z2Mvc3FoRFZLeW9jZDVmKythU09hbUw3UVN6ZUxxUzFUcVdQ?=
 =?utf-8?B?Nkk0U1dDRnF6QmxHaDRzYXc3ZDhkcjRqVk43MWUxV2RKbkZNcVhZWU1KV0JH?=
 =?utf-8?B?cVRFaU02WkFaUlI4emo0ZG1VejI4LzFHZWtpZC9VWjRuWGRmWmZTRXE4RDBQ?=
 =?utf-8?B?SzMzaW5FNlVxbUdiYnl2K1FJdXAxV0VaQ0dPVkRYRU0zN1A0a0NJK3lJa0xX?=
 =?utf-8?B?akVqRUtQdVpZZ0diZ3dJMHZGbFJ4MmJTOEtBeFc2dTZuMnZiZndPdXJpWlZm?=
 =?utf-8?B?UDBMK1dndGZwRm5KVkhxV1lYS3luK1p0OGFaczc4TXkyVmk2TzYzeWk3dm1h?=
 =?utf-8?B?aDdRejdjZ0lvNkF3Ym02ZmdPSGN6b2xEeUtLOERzcGwrL1hldy9RU0x0R0x5?=
 =?utf-8?Q?TdJPfGV4pTqcgVPdd7Lv0MWBynGp1nOwh+MBgRlmxAl5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda67405-3c5f-468c-780f-08dde17a19cc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 12:47:49.5128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h98zhm+Pb2Qx4dopYtB3WFs5wb/Dzj9A/jg6mf9fTAzQVgRQWFJKSnyjdqvXowzVOLR83INEVkv64nJxsD/MIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5823
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

The Booter signed firmware is an essential part of bringing up the GSP
on Turing and Ampere. It is loaded on the sec2 falcon core and is
responsible for loading and running the RISC-V GSP bootloader into the
GSP core.

Add support for parsing the Booter firmware loaded from userspace, patch
its signatures, and store it into a form that is ready to be loaded and
executed on the sec2 falcon.

We do not run it yet, as its own payload (the GSP bootloader and
firmware image) still need to be prepared.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          |   4 +-
 drivers/gpu/nova-core/firmware.rs        |  25 ++-
 drivers/gpu/nova-core/firmware/booter.rs | 356 +++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs             |  11 +-
 4 files changed, 386 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 2dbcdf26697beb7e52083675fc9ea62a6167fef8..7bd13481a6a37783309c2d2621a6b67b81d55cc5 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -293,7 +293,7 @@ pub(crate) trait FalconEngine:
 }
 
 /// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM).
-#[derive(Debug)]
+#[derive(Debug, Clone)]
 pub(crate) struct FalconLoadTarget {
     /// Offset from the start of the source object to copy from.
     pub(crate) src_start: u32,
@@ -304,7 +304,7 @@ pub(crate) struct FalconLoadTarget {
 }
 
 /// Parameters for the falcon boot ROM.
-#[derive(Debug)]
+#[derive(Debug, Clone)]
 pub(crate) struct FalconBromParams {
     /// Offset in `DMEM`` of the firmware's signature.
     pub(crate) pkc_data_offset: u32,
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index ccb4d19f8fa76b0e844252dede5f50b37c590571..be190af1e11aec26c18c85324a185d135a16eabe 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -6,6 +6,7 @@
 use core::marker::PhantomData;
 use core::mem::size_of;
 
+use booter::BooterFirmware;
 use kernel::device;
 use kernel::firmware;
 use kernel::prelude::*;
@@ -13,10 +14,13 @@
 use kernel::transmute::FromBytes;
 
 use crate::dma::DmaObject;
+use crate::driver::Bar0;
 use crate::falcon::FalconFirmware;
+use crate::falcon::{sec2::Sec2, Falcon};
 use crate::gpu;
 use crate::gpu::Chipset;
 
+pub(crate) mod booter;
 pub(crate) mod fwsec;
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
@@ -24,14 +28,22 @@
 /// Structure encapsulating the firmware blobs required for the GPU to operate.
 #[expect(dead_code)]
 pub(crate) struct Firmware {
-    booter_load: firmware::Firmware,
-    booter_unload: firmware::Firmware,
+    /// Runs on the sec2 falcon engine to load and start the GSP bootloader.
+    booter_loader: BooterFirmware,
+    /// Runs on the sec2 falcon engine to stop and unload a running GSP firmware.
+    booter_unloader: BooterFirmware,
     bootloader: firmware::Firmware,
     gsp: firmware::Firmware,
 }
 
 impl Firmware {
-    pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<Firmware> {
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        sec2: &Falcon<Sec2>,
+        bar: &Bar0,
+        chipset: Chipset,
+        ver: &str,
+    ) -> Result<Firmware> {
         let mut chip_name = CString::try_from_fmt(fmt!("{chipset}"))?;
         chip_name.make_ascii_lowercase();
         let chip_name = &*chip_name;
@@ -42,8 +54,10 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<F
         };
 
         Ok(Firmware {
-            booter_load: request("booter_load")?,
-            booter_unload: request("booter_unload")?,
+            booter_loader: request("booter_load")
+                .and_then(|fw| BooterFirmware::new(dev, &fw, sec2, bar))?,
+            booter_unloader: request("booter_unload")
+                .and_then(|fw| BooterFirmware::new(dev, &fw, sec2, bar))?,
             bootloader: request("bootloader")?,
             gsp: request("gsp")?,
         })
@@ -179,7 +193,6 @@ struct BinFirmware<'a> {
     fw: &'a [u8],
 }
 
-#[expect(dead_code)]
 impl<'a> BinFirmware<'a> {
     /// Interpret `fw` as a firmware image starting with a [`BinHdr`], and returns the
     /// corresponding [`BinFirmware`] that can be used to extract its payload.
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
new file mode 100644
index 0000000000000000000000000000000000000000..108649bdf716eeacaae3098b3c29b2de2813c6ee
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -0,0 +1,356 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for loading and patching the `Booter` firmware. `Booter` is a Heavy Secured firmware
+//! running on [`Sec2`], that is used on Turing/Ampere to load the GSP firmware into the GSP falcon
+//! (and optionally unload it through a separate firmware image).
+
+use core::marker::PhantomData;
+use core::mem::size_of;
+use core::ops::Deref;
+
+use kernel::device;
+use kernel::firmware::Firmware;
+use kernel::prelude::*;
+use kernel::transmute::FromBytes;
+
+use crate::dma::DmaObject;
+use crate::driver::Bar0;
+use crate::falcon::sec2::Sec2;
+use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadParams, FalconLoadTarget};
+use crate::firmware::{BinFirmware, FirmwareDmaObject, FirmwareSignature, Signed, Unsigned};
+
+/// Local convenience function to return a copy of `S` by reinterpreting the bytes starting at
+/// `offset` in `slice`.
+fn frombytes_at<S: FromBytes + Sized>(slice: &[u8], offset: usize) -> Result<S> {
+    slice
+        .get(offset..offset + size_of::<S>())
+        .and_then(S::from_bytes_copy)
+        .ok_or(EINVAL)
+}
+
+/// Heavy-Secured firmware header.
+///
+/// Such firmwares have an application-specific payload that needs to be patched with a given
+/// signature.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct HsHeaderV2 {
+    /// Offset to the start of the signatures.
+    sig_prod_offset: u32,
+    /// Size in bytes of the signatures.
+    sig_prod_size: u32,
+    /// Offset to a `u32` containing the location at which to patch the signature in the microcode
+    /// image.
+    patch_loc: u32,
+    /// Offset to a `u32` containing the index of the signature to patch.
+    patch_sig: u32,
+    /// Start offset to the signature metadata.
+    meta_data_offset: u32,
+    /// Size in bytes of the signature metadata.
+    meta_data_size: u32,
+    /// Offset to a `u32` containing the number of signatures in the signatures section.
+    num_sig: u32,
+    /// Offset of the application-specific header.
+    header_offset: u32,
+    /// Size in bytes of the application-specific header.
+    header_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsHeaderV2 {}
+
+/// Heavy-Secured Firmware image container.
+///
+/// This provides convenient access to the fields of [`HsHeaderV2`] that are actually indices to
+/// read from in the firmware data.
+struct HsFirmwareV2<'a> {
+    hdr: HsHeaderV2,
+    fw: &'a [u8],
+}
+
+impl<'a> HsFirmwareV2<'a> {
+    /// Interprets the header of `bin_fw` as a [`HsHeaderV2`] and returns an instance of
+    /// `HsFirmwareV2` for further parsing.
+    ///
+    /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
+    fn new(bin_fw: &BinFirmware<'a>) -> Result<Self> {
+        frombytes_at::<HsHeaderV2>(bin_fw.fw, bin_fw.hdr.header_offset as usize)
+            .map(|hdr| Self { hdr, fw: bin_fw.fw })
+    }
+
+    /// Returns the location at which the signatures should be patched in the microcode image.
+    ///
+    /// Fails if the offset of the patch location is outside the bounds of the firmware
+    /// image.
+    fn patch_location(&self) -> Result<u32> {
+        frombytes_at::<u32>(self.fw, self.hdr.patch_loc as usize)
+    }
+
+    /// Returns an iterator to the signatures of the firmware. The iterator can be empty if the
+    /// firmware is unsigned.
+    ///
+    /// Fails if the pointed signatures are outside the bounds of the firmware image.
+    fn signatures_iter(&'a self) -> Result<impl Iterator<Item = BooterSignature<'a>>> {
+        let num_sig = frombytes_at::<u32>(self.fw, self.hdr.num_sig as usize)?;
+        let iter = match self.hdr.sig_prod_size.checked_div(num_sig) {
+            // If there are no signatures, return an iterator that will yield zero elements.
+            None => (&[] as &[u8]).chunks_exact(1),
+            Some(sig_size) => {
+                let patch_sig = frombytes_at::<u32>(self.fw, self.hdr.patch_sig as usize)?;
+                let signatures_start = (self.hdr.sig_prod_offset + patch_sig) as usize;
+
+                self.fw
+                    // Get signatures range.
+                    .get(signatures_start..signatures_start + self.hdr.sig_prod_size as usize)
+                    .ok_or(EINVAL)?
+                    .chunks_exact(sig_size as usize)
+            }
+        };
+
+        // Map the byte slices into signatures.
+        Ok(iter.map(BooterSignature))
+    }
+}
+
+/// Signature parameters, as defined in the firmware.
+#[repr(C)]
+struct HsSignatureParams {
+    // Fuse version to use.
+    fuse_ver: u32,
+    // Mask of engine IDs this firmware applies to.
+    engine_id_mask: u32,
+    // ID of the microcode.
+    ucode_id: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsSignatureParams {}
+
+impl HsSignatureParams {
+    /// Returns the signature parameters contained in `hs_fw`.
+    ///
+    /// Fails if the meta data parameter of `hs_fw` is outside the bounds of the firmware image, or
+    /// if its size doesn't match that of [`HsSignatureParams`].
+    fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
+        let start = hs_fw.hdr.meta_data_offset as usize;
+        let end = start
+            .checked_add(hs_fw.hdr.meta_data_size as usize)
+            .ok_or(EINVAL)?;
+
+        hs_fw
+            .fw
+            .get(start..end)
+            .and_then(Self::from_bytes_copy)
+            .ok_or(EINVAL)
+    }
+}
+
+/// Header for code and data load offsets.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct HsLoadHeaderV2 {
+    // Offset at which the code starts.
+    os_code_offset: u32,
+    // Total size of the code, for all apps.
+    os_code_size: u32,
+    // Offset at which the data starts.
+    os_data_offset: u32,
+    // Size of the data.
+    os_data_size: u32,
+    // Number of apps following this header. Each app is described by a [`HsLoadHeaderV2App`].
+    num_apps: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsLoadHeaderV2 {}
+
+impl HsLoadHeaderV2 {
+    /// Returns the load header contained in `hs_fw`.
+    ///
+    /// Fails if the header pointed at by `hs_fw` is not within the bounds of the firmware image.
+    fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
+        frombytes_at::<Self>(hs_fw.fw, hs_fw.hdr.header_offset as usize)
+    }
+}
+
+/// Header for app code loader.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct HsLoadHeaderV2App {
+    /// Offset at which to load the app code.
+    offset: u32,
+    /// Length in bytes of the app code.
+    len: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsLoadHeaderV2App {}
+
+impl HsLoadHeaderV2App {
+    /// Returns the [`HsLoadHeaderV2App`] for app `idx` of `hs_fw`.
+    ///
+    /// Fails if `idx` is larger than the number of apps declared in `hs_fw`, or if the header is
+    /// not within the bounds of the firmware image.
+    fn new(hs_fw: &HsFirmwareV2<'_>, idx: u32) -> Result<Self> {
+        let load_hdr = HsLoadHeaderV2::new(hs_fw)?;
+        if idx >= load_hdr.num_apps {
+            Err(EINVAL)
+        } else {
+            frombytes_at::<Self>(
+                hs_fw.fw,
+                (hs_fw.hdr.header_offset as usize)
+                    // Skip the load header...
+                    .checked_add(size_of::<HsLoadHeaderV2>())
+                    // ... and jump to app header `idx`.
+                    .and_then(|offset| {
+                        offset.checked_add((idx as usize).checked_mul(size_of::<Self>())?)
+                    })
+                    .ok_or(EINVAL)?,
+            )
+        }
+    }
+}
+
+/// Signature for Booter firmware. Their size is encoded into the header and not known a compile
+/// time, so we just wrap a byte slices on which we can implement [`FirmwareSignature`].
+struct BooterSignature<'a>(&'a [u8]);
+
+impl<'a> AsRef<[u8]> for BooterSignature<'a> {
+    fn as_ref(&self) -> &[u8] {
+        self.0
+    }
+}
+
+impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
+
+/// The `Booter` loader firmware, responsible for loading the GSP.
+pub(crate) struct BooterFirmware {
+    // Load parameters for `IMEM` falcon memory.
+    imem_load_target: FalconLoadTarget,
+    // Load parameters for `DMEM` falcon memory.
+    dmem_load_target: FalconLoadTarget,
+    // BROM falcon parameters.
+    brom_params: FalconBromParams,
+    // Device-mapped firmware image.
+    ucode: FirmwareDmaObject<Self, Signed>,
+}
+
+impl FirmwareDmaObject<BooterFirmware, Unsigned> {
+    fn new_booter(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
+        DmaObject::from_data(dev, data).map(|ucode| Self(ucode, PhantomData))
+    }
+}
+
+impl BooterFirmware {
+    /// Parses the Booter firmware contained in `fw`, and patches the correct signature so it is
+    /// ready to be loaded and run on `falcon`.
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        fw: &Firmware,
+        falcon: &Falcon<<Self as FalconFirmware>::Target>,
+        bar: &Bar0,
+    ) -> Result<Self> {
+        let bin_fw = BinFirmware::new(fw)?;
+        // The binary firmware embeds a Heavy-Secured firmware.
+        let hs_fw = HsFirmwareV2::new(&bin_fw)?;
+        // The Heavy-Secured firmware embeds a firmware load descriptor.
+        let load_hdr = HsLoadHeaderV2::new(&hs_fw)?;
+        // Offset in `ucode` where to patch the signature.
+        let patch_loc = hs_fw.patch_location()?;
+        let sig_params = HsSignatureParams::new(&hs_fw)?;
+        let brom_params = FalconBromParams {
+            // `load_hdr.os_data_offset` is an absolute index, but `pkc_data_offset` is from the
+            // signature patch location.
+            pkc_data_offset: patch_loc
+                .checked_sub(load_hdr.os_data_offset)
+                .ok_or(EINVAL)?,
+            engine_id_mask: u16::try_from(sig_params.engine_id_mask).map_err(|_| EINVAL)?,
+            ucode_id: u8::try_from(sig_params.ucode_id).map_err(|_| EINVAL)?,
+        };
+        let app0 = HsLoadHeaderV2App::new(&hs_fw, 0)?;
+
+        // Object containing the firmware microcode to be signature-patched.
+        let ucode = bin_fw
+            .data()
+            .ok_or(EINVAL)
+            .and_then(|data| FirmwareDmaObject::<Self, _>::new_booter(dev, data))?;
+
+        let ucode_signed = {
+            let mut signatures = hs_fw.signatures_iter()?.peekable();
+
+            if signatures.peek().is_none() {
+                // If there are no signatures, then the firmware is unsigned.
+                ucode.no_patch_signature()
+            } else {
+                // Obtain the version from the fuse register, and extract the corresponding
+                // signature.
+                let reg_fuse_version = falcon.signature_reg_fuse_version(
+                    bar,
+                    brom_params.engine_id_mask,
+                    brom_params.ucode_id,
+                )?;
+
+                let signature = match reg_fuse_version {
+                    // `0` means the last signature should be used.
+                    0 => signatures.last(),
+                    // Otherwise hardware fuse version needs to be substracted to obtain the index.
+                    reg_fuse_version => {
+                        let Some(idx) = sig_params.fuse_ver.checked_sub(reg_fuse_version) else {
+                            dev_err!(dev, "invalid fuse version for Booter firmware\n");
+                            return Err(EINVAL);
+                        };
+                        signatures.nth(idx as usize)
+                    }
+                }
+                .ok_or(EINVAL)?;
+
+                ucode.patch_signature(&signature, patch_loc as usize)?
+            }
+        };
+
+        Ok(Self {
+            imem_load_target: FalconLoadTarget {
+                src_start: app0.offset,
+                dst_start: 0,
+                len: app0.len,
+            },
+            dmem_load_target: FalconLoadTarget {
+                src_start: load_hdr.os_data_offset,
+                dst_start: 0,
+                len: load_hdr.os_data_size,
+            },
+            brom_params,
+            ucode: ucode_signed,
+        })
+    }
+}
+
+impl FalconLoadParams for BooterFirmware {
+    fn imem_load_params(&self) -> FalconLoadTarget {
+        self.imem_load_target.clone()
+    }
+
+    fn dmem_load_params(&self) -> FalconLoadTarget {
+        self.dmem_load_target.clone()
+    }
+
+    fn brom_params(&self) -> FalconBromParams {
+        self.brom_params.clone()
+    }
+
+    fn boot_addr(&self) -> u32 {
+        self.imem_load_target.src_start
+    }
+}
+
+impl Deref for BooterFirmware {
+    type Target = DmaObject;
+
+    fn deref(&self) -> &Self::Target {
+        &self.ucode.0
+    }
+}
+
+impl FalconFirmware for BooterFirmware {
+    type Target = Sec2;
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8caecaf7dfb4820a96a568a05653dbdf808a3719..54f0e9fd587ae5c4c045096930c0548fb1ef1b86 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -269,7 +269,6 @@ pub(crate) fn new(
     ) -> Result<impl PinInit<Self>> {
         let bar = devres_bar.access(pdev.as_ref())?;
         let spec = Spec::new(bar)?;
-        let fw = Firmware::new(pdev.as_ref(), spec.chipset, FIRMWARE_VERSION)?;
 
         dev_info!(
             pdev.as_ref(),
@@ -293,7 +292,15 @@ pub(crate) fn new(
         )?;
         gsp_falcon.clear_swgen0_intr(bar);
 
-        let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
+        let sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
+
+        let fw = Firmware::new(
+            pdev.as_ref(),
+            &sec2_falcon,
+            bar,
+            spec.chipset,
+            FIRMWARE_VERSION,
+        )?;
 
         let fb_layout = FbLayout::new(spec.chipset, bar)?;
         dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);

-- 
2.50.1

