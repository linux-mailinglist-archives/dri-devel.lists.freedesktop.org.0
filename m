Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B295CC46ED3
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F9E10E3A5;
	Mon, 10 Nov 2025 13:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eJDrF1tU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010033.outbound.protection.outlook.com
 [52.101.193.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CFC10E3A5;
 Mon, 10 Nov 2025 13:35:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sg+bxajiM+mbbdZNtaqg41fpt61/DUUUvWJRWuCLGAqOsIR+ZOZq9x7OeAQJ7AcIC60tOMW9HDNwufAkG5ZHfpNsuvUrreVbN/GLibDkypdRfJuEFoB5Vis4ydKnrYfvAEK7LjYAOIB0wGHeIJ8v+i1ZX1315nGIyXSwG0iwClykMMd8eTUYYfuV9ltH3nAl68E+7bGiukUXvse8/nrIPj03JIX5P7n84st188ERjU6ipRtyHV5kFfFI0JqHnm+nOiXZP6S18X+Sm26X/ivODuePG7IzpWL2grzpbCJh34yab6PwOvyddN9oMvSpSqRH9aSonyVxW5r8ugLFEQtwbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ut7yQ29trA4QMY/AtUjAeRzN0e8tmdohmMFxBRmpxI=;
 b=UYDEts8Xz/BgeDhaBLJQA/cotApcJVzrs3ZkcBzZbx1qGqu6DhwdDU0SQmAS426cv8xlMGeLDaLceMcm/xS7Z1wVxKDplfl8na9nNIqhqb78h+xv3kdFR/0Ep0H8eH/PMKy+yS7tjlxKwC89kg2UWK8Aig/KbYGzAxcn5dzF50CziUGv39sG0F9rSMzuW7/KHokYX5upltkogGGwmZp5mYJvrgc5TcgFGRShvIBBwF3DRZ6YXftI57OeCtR+JWd5hjFGAtFwA45RfmFJWxhNWwbpyNlgetBM0MAMMVsX0MW5+J8enBkDnoc3ovw2o1GNRhuN6p8mRuCEZLf32Za0Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ut7yQ29trA4QMY/AtUjAeRzN0e8tmdohmMFxBRmpxI=;
 b=eJDrF1tUJmXLC0/QvwR/VwGYNc30XvK2gqcra3dph1oujnQoEXeaNCWAmtS8pqaGlX7AsYXXGqWz0zBG1utMiYZh33qJuOqNBmQtLWI0scOQMvVnY9FQ2b6WXUIhY0nAJQo6RWFVYVSjKL2XhHvhx2qKJzQ68hDEwQHElMdQPm1MwEjeC4Z6g+AURF3//2B8F6aBp9eEdNS37/wu9VlNfQ+YPvG582gLyF0JeFHLmpxVkQwqibLKuAx8kEZ3AYykf1UBj/WK0jsUTasu9/FeDLTOZZeQlIR8Zqmhvtl1+MxwrPXoGOUYUsyQabbvpU8Ke3uOJh77SAjozaZR7kmTLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4055.namprd12.prod.outlook.com (2603:10b6:610:78::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:34:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:34:58 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 10 Nov 2025 22:34:18 +0900
Subject: [PATCH v9 10/15] gpu: nova-core: gsp: Create rmargs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-gsp_boot-v9-10-8ae4058e3c0e@nvidia.com>
References: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
In-Reply-To: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0098.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4055:EE_
X-MS-Office365-Filtering-Correlation-Id: 704524d0-95d3-4851-bf3f-08de205df104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkV6VGNFQWxrbFc1ZlVBK0FiNXpmRFZWUjcxTlg4UHJFTDBOUGY2K0cxUlN4?=
 =?utf-8?B?ZVU5ZlZXdVB0UjJKUHpITnMzSzRCVDBkU256dVcyak1PMU1hNFJtUGgwOTk5?=
 =?utf-8?B?OVMzV1pGanFEUjBaOXhCbmUvMEJTUzNVVXRPbG9ROEIwR0dRdUhjbWxTNkJu?=
 =?utf-8?B?OHVFRUNkaVNIaWsyZ2hPREdtOGRtMDNhUy83VnpLaFJkS1FjbUFXNDdDUndv?=
 =?utf-8?B?L285bWgxWmRhWmVLT0RwNGtibkVmdmkxdmdyTmxXT1RrcUtqaWt5UFM2Vmgr?=
 =?utf-8?B?eFlqdGdoWmZZd29iL3lmMVVmQktlM3E0OHYvckJtejh5WmkxYVI2aHZSSHl6?=
 =?utf-8?B?bERXL01zclRzV3QvTm9obG1aK1FJN25BVDRqc3dTdTZacHhmemVMeC8vZVVY?=
 =?utf-8?B?b1d3ZnVjTENqZVdTTzJGWTV1RGdtN3c5eCtXZkMrYUVSK0VlVS9YRGNIZmpk?=
 =?utf-8?B?a2FQeEg1K2xaT1VNOFNSakt4VjJySVZvdDFNZFRNTUU2QWh2TkV4WDJLWmZR?=
 =?utf-8?B?eDRoWnZDdS9LSnM1SFI3MC82V1JSQmhXVlp4ZVU2djhUa1BZZjBGZ0wyOUZ2?=
 =?utf-8?B?NDl3bW5pbEVsa3ozVWp5NXBlOWJEWnVvVmNhMzBmdFRhM2ZYRC9mUks0UzlR?=
 =?utf-8?B?L0lrRUNvTm9qUEJyWUlWZjRMWUFZRW92Z1p5clc4N0V0OTkvaXFheU1PWmZr?=
 =?utf-8?B?SUtKSzczTFo2WDEwVGNkYXB1S0pNYlRmMGVndEFYOHkxbWdwVHlVTW5IVGZK?=
 =?utf-8?B?bittWGQ2QktoNnVDRTM5WFRsdTJhN3gvZGhvbzZMN3JNUFVpejRkaWhFODBp?=
 =?utf-8?B?MkI0ZmovUmNmS00zV2U0bnZJdXpVOTdlK2N3emExTjlFbW9SRm40SzlrWGNl?=
 =?utf-8?B?TG45RkswTHY0blNJMHZXT1pPUDlFYTlmS0UyV0ZRcGhVOEUwYXlYRzNFN0Nv?=
 =?utf-8?B?bmdLUXBpcXFFQmtscHJlNnlUZGdMRnRacjcxWmlmenNwYm5CRUY5UHZ0OURv?=
 =?utf-8?B?QmZPcGwwR2VRWWlqV0xBeFZpd0dYdVJJd3RJWno1WVNpdEhUeHFXaXM1Y3g4?=
 =?utf-8?B?Y3phVDVGek1KMSs4VG1YZnZqRUpNK3lCdXBVdmdobWFZNXdRWSs2Nis5VzFS?=
 =?utf-8?B?TzhkRDNUV1lkVGZQT2JFRjBYN3dYcnYzYWpjN0RVaUEwMSsvK29FVkt4cjJM?=
 =?utf-8?B?d0RNZHNmMFNyeXc5a2VoL3hvUjNBQnBEY2VmZkVwWG9TMmJuSWZuaGlPVEF3?=
 =?utf-8?B?cmxEcU1mNU91SWFZWGlHMjgwNGFUejBhYTJiODZ1bC9QVVRub2QyRzFhTVdC?=
 =?utf-8?B?SnJWTGprOFptbUh2TVQ4c3lyYkpDd2dqcHhrNUZnSmRZL2JhVXUvNm5jUGtV?=
 =?utf-8?B?cXlXejVBWXBmUWZ6a3RNbEVRVks1KzRyRVk1QllRQzQrUldTd04wS3cwVTdK?=
 =?utf-8?B?NFlHL1NCRW1qVkRab25ucTM3U2lxbE5ObG1iMGVacFgvK05PYVI1Tmh5T1lE?=
 =?utf-8?B?dnV1clVIQzRCdm5QQlU2QjFVOGY4MTM3K2VBQjBHR0VUYU9vYjRTZ3kxODdy?=
 =?utf-8?B?ck5wYW9LbGRiQWdVUVFqOTJvVmtYNTVOVGlqbUF4RzFYUGpGaWt5TEpQb0w3?=
 =?utf-8?B?RENDQnRrMXhoL1dQa1VjTVFTQ25Ba1krTlp0UmJxeFZwRU5PV1o2VlF1YmJk?=
 =?utf-8?B?VWNJNHJsY0NXTDloMnNwblhUMy96Rk93UnUvQWt6a1JNZzhtaUVmVHNuQ1cx?=
 =?utf-8?B?UVU4VUx4Rm8xUTFCR0xwZmNMYk90SHprWXZqVkJaVC82ME02THhOQkEyVi9V?=
 =?utf-8?B?M2FZZGUwVEtvVWxIYlhTU3RJcTlaRVdVM0dXcXF6bmpNL3ozM3BabW5tMUE0?=
 =?utf-8?B?WGllSWRkRUZhOUxwYnJaOFVpM01TTjRtYUVEdFNNaUxtU0ZDaDJzMmVPMGVh?=
 =?utf-8?B?WmovdmV4bGhhNEhjVThOVGlmc2crQTZFb2pHRDN0aFR0NHlwaHdwL20vZnVR?=
 =?utf-8?Q?+SiCPXLGIshj4Y0np84t0PDFsn2xu8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3pwTExqc1MrTHVlV25BdFltV1VGM3V6VlBtb3hXK2JUeDZQQ0xSRzBDZW9q?=
 =?utf-8?B?SUdYdUlWc1R5U2ZCMlVnQmVteWJBVmlpOE0vNVIvNXBrWTlmZmFaQlBWU28v?=
 =?utf-8?B?NWZ2ajNCL1cxODlmbjZ1Y3RYZ0xwZzliMnBFWlpjenNOQW9ld1U3Y0dmeDM2?=
 =?utf-8?B?b2JyYUZwWnRGLy9LVFVNSDI0QTVVOVdRYVNXejdOejdVQmNwc0ZtQ2tZUWRP?=
 =?utf-8?B?YTg4MzZiWEpId2t4OWQrUDV3ODNCdTlDaDlUUDVzV2I5cStCdjNLWDQyZWFj?=
 =?utf-8?B?TDNaK042dmEzMTdxcXFNRWZOd3lxaUNMWXo5TUJPd09TMDY0bXE4ZGQ3cnA3?=
 =?utf-8?B?MGQwMjd4djhQUGJRRnI2aVUva2VOYk43M2hGN0FtVGdyTmQ2ekEzUnlEV1lP?=
 =?utf-8?B?YUJBQ0ZyeTdzWWN5WmR2UWdwcSttWWp6SXZGQmNkUHZuRmFkTjZiOFIvMjBt?=
 =?utf-8?B?SlJSRUxNdm5WbTc2Z241ZTA1eFJXcG5TWnpMVnA3THBZek5UdjdvSCtHUE9p?=
 =?utf-8?B?VXBjNTNXSUJiWG9jQlEzUjY4Z0ljU0RaVjRvM1Z0N0lPaHJkanJLSktEK1pJ?=
 =?utf-8?B?L3V3Um85R1g4OU9BVEpJTzRDTnpmSTlsWWdCNzR0cmpNQ0Q2TXFuZlBuZkRN?=
 =?utf-8?B?cXFqaXYxL3FadTFWc2s2SkxuRWhQeWx6N056MVhrSUlKRnpiWE8xMHcrTzM0?=
 =?utf-8?B?WTZXUnFIVS9SRmJXZFd3SnV2Lzk4aHo2NHU5VlV6ZU9UdDZXdTQyTW9Hendt?=
 =?utf-8?B?cHpYVHYvREs0dWYwZjIvajNDWHRuUGR0Y0txOUppVmhmeW9CODhPVmZDKy8z?=
 =?utf-8?B?R0NwV3NOb0o3b2FFb29kaElicU1GdUUyQk1vNWZLeDN6cFZib0dwL0hUVWJT?=
 =?utf-8?B?SXkwRUc0VFd2WXB4R3RSSjhiVE83dEFTYm1rOTZoSFRoWjlsZGhsWENDcnht?=
 =?utf-8?B?WU0zaStoZWt2UjI5NXJIRmVOYlhVdy9oSFpUZmhDMTFqNDFMcGdmUHF4WXNC?=
 =?utf-8?B?K285R1RkWEJrcCtpbU5Xc2RNRG9rd1lXbEF0aWpzaFdIemtSaWtTRythT0VF?=
 =?utf-8?B?bzg5bnE3ZkpZVVRtSUdZUlFFR3hGd0MrRnI4UHdYaDJtcHVnRWJSK1VFWFF1?=
 =?utf-8?B?Qi9ZWVFOS2x0Ym1QdjFKWE9QTFpjRTlzbkwyS1ZkMWpZVEUzOWtScHlXN1dv?=
 =?utf-8?B?UDhoL2VnVmJPR0RUT3ZMcFVXZVRlbUtnUXhOUHI4ZDV4NGo5cVFFOG43UXlL?=
 =?utf-8?B?L0tUekx6bnF3eE9Rejlsb2p0NlVaRlhBTjIyaUNaR0E3NVJoY3VZbE9kaFNW?=
 =?utf-8?B?dHQzRlFVVGlnSEw1ZDQ0Ulo2MVhmYlpwTjA4TnVQbWkwa1VGdVpGTWFGYVp6?=
 =?utf-8?B?dncvdnNLZnNMdTI5dVVIb3E1VWRjM3lSZnNzVDNEeE85RlBtWDRFMUY4WG5J?=
 =?utf-8?B?dnE3N2dBTXhEcXhhV1JnUkgwcnNtd0ZJVVA1OXIvWTdXbThyak0vNEdRckpW?=
 =?utf-8?B?VCtzRExyUDczNkVpQnZkQVY4M1A1MURPaWVUN29DUm8vQmNwcHBDeVQ2b3Z1?=
 =?utf-8?B?QUFxZHFiQXUzR0lsUEFkdDM0WDdSMkVxYTg5YTlESnpWR2hvaUlXU2huZnpz?=
 =?utf-8?B?UGR5bFpaclJkZHIvSDdIaTM4VElsd0htRm9SUGQzTU5qRUJaT0xPeWZxTWx0?=
 =?utf-8?B?MEllQWVqQkppZmdtQzNrYmxwTE1jTWdMUmI1Wm93MHNueVdBdEs3dEUrdlZ3?=
 =?utf-8?B?UUhRRkVDTHYxNlZJN1ZaK1ZITnpIMkd4YkFnMG9ZOVdHSnF1SFNYalpwOEdM?=
 =?utf-8?B?ZzdnOEJDZWdDekREa1pETEFNeHZWZEY4dDRCSlR2MzE2WGxLb2VZQllWeEZj?=
 =?utf-8?B?Nkt6TzdyVE5mQWl3RCsyM2lVVDhJSmovYnVLS2Y0UUk4SmRndVhBeU94ZGRw?=
 =?utf-8?B?eFZPWGh5bUVScVloamdYdnZBaXpxcXg5aUI1KzZXcDVGWVluOFNycUl3MXBX?=
 =?utf-8?B?d2xkK3cyK29ZcGtISWg4b1dydmFMcmVmWjhnbFh2RWdnTUNNd045dTM3RC96?=
 =?utf-8?B?eCszUGJSRk45ZzU4SUdCVXUxL3R6NUJXMFpCU0daS1I5ZWxRSlNkbmQ2N3hs?=
 =?utf-8?B?bElwaUVHVVlkaGRQaU9wUEhEc0R1T0RSVGJoUHZHSEFZeFB6R0ZCMW0rOW1y?=
 =?utf-8?Q?67gta41blbK3vfkxIF+dGuMLcWhh9K3AAr15SSVcYNK+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 704524d0-95d3-4851-bf3f-08de205df104
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:34:58.2494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Od2lkXxHhoCJH2w6gcMbag0iczSWmVzA8+MakBF0v1BKlZily3//pqO5BSlhoXuXkk1QT3fdoHfbZPv12zqCZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4055
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

From: Alistair Popple <apopple@nvidia.com>

Initialise the GSP resource manager arguments (rmargs) which provides
initialisation parameters to the GSP firmware during boot. The rmargs
structure contains arguments to configure the GSP message/command queue
location.

These are mapped for coherent DMA and added to the libos data structure
for access when booting GSP.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs      | 18 ++++++++++++++--
 drivers/gpu/nova-core/gsp/cmdq.rs | 27 +++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw.rs   | 44 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 85 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index f9819a04bb40..609f8e5f2dcc 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -24,8 +24,11 @@
 
 use crate::{
     gsp::cmdq::Cmdq,
-    gsp::fw::LibosMemoryRegionInitArgument,
-    num, //
+    gsp::fw::{
+        GspArgumentsCached,
+        LibosMemoryRegionInitArgument, //
+    },
+    num,
 };
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
@@ -108,6 +111,8 @@ pub(crate) struct Gsp {
     logrm: LogBuffer,
     /// Command queue.
     pub(crate) cmdq: Cmdq,
+    /// RM arguments.
+    rmargs: CoherentAllocation<GspArgumentsCached>,
 }
 
 impl Gsp {
@@ -134,11 +139,20 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
 
         let cmdq = Cmdq::new(dev)?;
 
+        let rmargs = CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
+            dev,
+            1,
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+        dma_write!(rmargs[0] = fw::GspArgumentsCached::new(&cmdq))?;
+        dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs))?;
+
         Ok(try_pin_init!(Self {
             libos,
             loginit,
             logintr,
             logrm,
+            rmargs,
             cmdq,
         }))
     }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index c00d9fa9b79b..295903c28922 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -11,7 +11,10 @@
 
 use kernel::{
     device,
-    dma::CoherentAllocation,
+    dma::{
+        CoherentAllocation,
+        DmaAddress, //
+    },
     dma_write,
     io::poll::read_poll_timeout,
     prelude::*,
@@ -33,6 +36,7 @@
             MsgqTxHeader, //
         },
         PteArray,
+        GSP_PAGE_SHIFT,
         GSP_PAGE_SIZE, //
     },
     num,
@@ -429,6 +433,22 @@ pub(crate) struct Cmdq {
 }
 
 impl Cmdq {
+    /// Offset of the data after the PTEs.
+    const POST_PTE_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq);
+
+    /// Offset of command queue ring buffer.
+    pub(crate) const CMDQ_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq)
+        + core::mem::offset_of!(Msgq, msgq)
+        - Self::POST_PTE_OFFSET;
+
+    /// Offset of message queue ring buffer.
+    pub(crate) const STATQ_OFFSET: usize = core::mem::offset_of!(GspMem, gspq)
+        + core::mem::offset_of!(Msgq, msgq)
+        - Self::POST_PTE_OFFSET;
+
+    /// Number of page table entries for the GSP shared region.
+    pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
+
     /// Creates a new command queue for `dev`.
     pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
         let gsp_mem = DmaGspMem::new(dev)?;
@@ -653,4 +673,9 @@ pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Resul
 
         result
     }
+
+    /// Returns the DMA handle of the command queue's shared memory region.
+    pub(crate) fn dma_handle(&self) -> DmaAddress {
+        self.gsp_mem.0.dma_handle()
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index ceda61c99b92..b083a6a5754c 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -31,7 +31,10 @@
     fb::FbLayout,
     firmware::gsp::GspFirmware,
     gpu::Chipset,
-    gsp::GSP_PAGE_SIZE,
+    gsp::{
+        cmdq::Cmdq, //
+        GSP_PAGE_SIZE,
+    },
     num::{
         self,
         FromSafeCast, //
@@ -568,3 +571,42 @@ unsafe impl AsBytes for GspMsgElement {}
 // SAFETY: This struct only contains integer types for which all bit patterns
 // are valid.
 unsafe impl FromBytes for GspMsgElement {}
+
+/// Arguments for GSP startup.
+#[repr(transparent)]
+pub(crate) struct GspArgumentsCached(bindings::GSP_ARGUMENTS_CACHED);
+
+impl GspArgumentsCached {
+    /// Creates the arguments for starting the GSP up using `cmdq` as its command queue.
+    pub(crate) fn new(cmdq: &Cmdq) -> Self {
+        Self(bindings::GSP_ARGUMENTS_CACHED {
+            messageQueueInitArguments: MessageQueueInitArguments::new(cmdq).0,
+            bDmemStack: 1,
+            ..Default::default()
+        })
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspArgumentsCached {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspArgumentsCached {}
+
+/// Init arguments for the message queue.
+#[repr(transparent)]
+struct MessageQueueInitArguments(bindings::MESSAGE_QUEUE_INIT_ARGUMENTS);
+
+impl MessageQueueInitArguments {
+    /// Creates a new init arguments structure for `cmdq`.
+    fn new(cmdq: &Cmdq) -> Self {
+        Self(bindings::MESSAGE_QUEUE_INIT_ARGUMENTS {
+            sharedMemPhysAddr: cmdq.dma_handle(),
+            pageTableEntryCount: num::usize_into_u32::<{ Cmdq::NUM_PTES }>(),
+            cmdQueueOffset: num::usize_as_u64(Cmdq::CMDQ_OFFSET),
+            statQueueOffset: num::usize_as_u64(Cmdq::STATQ_OFFSET),
+            ..Default::default()
+        })
+    }
+}

-- 
2.51.2

