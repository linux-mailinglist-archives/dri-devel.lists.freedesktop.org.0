Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFMDM8UmgmnPPgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 17:48:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D5BDC39F
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 17:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D70310E712;
	Tue,  3 Feb 2026 16:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="Rv05WgbL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU008.outbound.protection.outlook.com
 (mail-ukwestazon11020078.outbound.protection.outlook.com [52.101.195.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B70E10E712
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 16:48:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjkYsx0bpiJDtS88XnkzUozQuTp9FuF7xgSBSmtSMOUCJTSb2b8Mv5kh6v2r5te/EfyKIqCz6ygHCfelhr+9Are5c3uoAPw8qGs6hG8DvdMMGuirHGMTCtuPG8cVq4UIrUdFnmoPVexGDGrLIXvLpT8H9Xac5UROf/e9NuNn7WhXpzZRVFtkCEdsiNTZvuP+v6tAt8JBEqMaWKYgy9A+qK0HlwtqTrc52c1HBw/WTZP2UMyiSlgOf2inVp1XMYgLh6YR267NHl1ddkj7ny77fzWxzNd7eng05AqxYQvCmqxR91ouB+aUes3CPqQrCPmePIDZjuLzC52cdSrmbKpJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZNtAePVcnt7FBVqYpZpFSc8sQiWBp/LXd+TCx6YPxE=;
 b=lrFv7AsQ1uH29AzJwq8s6QpY3k/dFmbHp7N/+x4uYX2vrvXWrkmxFu7Qk6AKoMwyEwUGBiMuoJ3JSsucHsWCC3GYmgSUoXiMrP41AAr/r4setRK5ijNggV9mKbDntNFRXZYzTjtYKgsITJ6aJIhq7WAcLt8l6lIWCWVLobzh6xbdGD39nSSnf/yo9ySKOX0mCSHmycpAtExZLayPK5Zi2LIzFRsbe+yuyXRUDrZ3+rc8mnrL4MAFLNFniyt8rlRKaOTY8U6IpCKwV8GGyS1wBSUL1iWVcsI52Ul2gTD6HhJ/a5tuhVBP4jfdyBmrAHe46XWJxVO0tmZhjP1WNXludw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZNtAePVcnt7FBVqYpZpFSc8sQiWBp/LXd+TCx6YPxE=;
 b=Rv05WgbL1ADbUQWMgIUxRZmX+PAqrn8RQ6YeveZHMCO+IQrNxCawsYHfLtJnwDwMIHar1Mwj0+yz2zPEi/lMfqUkwlVpnPrjRHL/eVkcXeuE2WUo+Rx7rRAAemkJ1UwMG/gV2VsmtLNhhogEsm3ztRMPlyCxLg3L7q/8RzDiIXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3578.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1b7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:47:57 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 16:47:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 16:47:55 +0000
Message-Id: <DG5HAM6F5QYE.1ZFO7GD3SL9V0@garyguo.net>
Cc: "Trilok Soni" <tsoni@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-pwm@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] rust: debugfs: Allow access to device in
 Devres-wrapped scopes
From: "Gary Guo" <gary@garyguo.net>
To: "Matthew Maurer" <mmaurer@google.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Satya
 Durga Srinivasu Prabhala" <satyap@quicinc.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Michal Wilczynski" <m.wilczynski@samsung.com>, "Dave Ertman"
 <david.m.ertman@intel.com>, "Ira Weiny" <ira.weiny@intel.com>, "Leon
 Romanovsky" <leon@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-5-d6719db85637@google.com>
In-Reply-To: <20260203-qcom-socinfo-v2-5-d6719db85637@google.com>
X-ClientProxiedBy: LO4P123CA0663.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3578:EE_
X-MS-Office365-Filtering-Correlation-Id: 79efb792-99f0-4e43-1c92-08de6343fb3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|7416014|376014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXk1cmNKVG5wTEpxcVVQY1VQYjdtLzNFbkxNSzBucjl2UVg2V3NYQzR6YVc0?=
 =?utf-8?B?TnZ4QWtGZWszMFJYOWlPYVpCQXNkZW53TEthK0p3NkxpLysvTkU2bkJNNlBx?=
 =?utf-8?B?dmdQMm4wZFRBUXVpUW5TZ2cyQ3p4ZStCc3dDV2dIak1PbHlTZjhqRWdLLzhQ?=
 =?utf-8?B?ZDdFWU02YkZRekRHbkVkNm5tclZac0prMExUakdIcHhsN1dvVDNTTzJHdnJI?=
 =?utf-8?B?N1o2Wi9xTkJndWRDaVg4YmhOSHBSTmNxN0dnc1FxWFlUNkRLeHRJNEtKbEZK?=
 =?utf-8?B?NG96Zy8yZlpjaDhqQVdpcE95NnNIMFh5aHdWOGtZd1Z0Z3ZreHFRTkIvSTNE?=
 =?utf-8?B?RGlVRk0xaW9oM0F1UDFwRGxaRVVnQzNMMm4yVnFhOEQ0Sk5yOVpCczFRbDIw?=
 =?utf-8?B?b2pXU2EwYTY2MG10a2MyU2x4ZjZwWVdKL1ErSERDNVIvR05OWW9zaURSVmho?=
 =?utf-8?B?R2NDRGFic1V3WlhTalhsRVh5WUpUZ0pLb3pPSFQ0aFJtWml2SU42WjRDTTd1?=
 =?utf-8?B?VTB2YmVYcWhkOWw2Y0loeXUxcUlzSUl2clk5aWx2WURMdG1VSGhFNzRCNHVP?=
 =?utf-8?B?MU1BdGpLSUhGRFNUbGlBcFgyN3hwT044L1JzL0VKekxiOUF3TU1iVFNDU3g0?=
 =?utf-8?B?MFpsaXlYNlpvWXFCTU4xY0dHSm5PWHQ3cDg1U09qWmhqeWM2clpjczNLWkx2?=
 =?utf-8?B?ZDhVdkd0VExtbEk3eFlEUDRKakZ4eGVXL0lNRTYvdktTdGxFdUZaZU9GaEVl?=
 =?utf-8?B?MzVZRVprVjBPNXgrL1d6OWtDS2JqUElCYStmRjF1R0tibFp0eHF1MTJPaHhQ?=
 =?utf-8?B?MTREd0tpdFowSWxXaVZjV1phM2ZwT1EvaEtCOFBCczdrMUN5aVliRXMrNkFi?=
 =?utf-8?B?RkR2NDBTUzZwYnlkaDl0YW9wR2NYWEdObEM3dFNHa1ZsM0J4M2RrOUIxcWc3?=
 =?utf-8?B?ZW5IZytneXRTUjFHRUIrdml3SXNuK3hnT1NkMW1SZWZ3UjNRUlpVS2VLTjNT?=
 =?utf-8?B?SzR3VWhmTmxVU1pZbFVhS1BiekJJaVo0L0wyK2kvYm5SWFMyWEJWOC9nbG4w?=
 =?utf-8?B?UXhac3I4Zlp2NU5WdXM2bVlydVRzZ3FVRVdETG1tVVJDbE1aeDBRVEhvN3NV?=
 =?utf-8?B?T1kwWjFnUzFEaUFUSmFzL3d2cllFOWJzQ0NPM2xGRExpUXJMazJoK2NzQkJv?=
 =?utf-8?B?MHJsR04zSFc2aEpLTW5NazN3N2lld2pqQ1RNQWFmZlIrenlKMUlVNjZrMGpq?=
 =?utf-8?B?d2dQRFZuMDdFUGdJZExMVHovdGtQbllrLzdZdVQ3dGdvbXBQVThZZGErL25t?=
 =?utf-8?B?eDRGMmZiclduNFk0TndsK0tjcjV4U2NVeU04dlM4anZ4bGRqY2ZpR0N5bGds?=
 =?utf-8?B?aXRKYkhHRFBHeSs1NEJFaDhJQVVLbk91d01ncGpVWjJqS3ZzVkoyQUFpVSt5?=
 =?utf-8?B?OGM1ODhGT3N4MjlYTW1SNWlOL3FBOG4rVTNlWUhNem1UYlFNeGNuNFJXTksv?=
 =?utf-8?B?ZzFCeW9ENHZaaC9jRm1FMEFLTVVsTWxwSEx2ZFJlRG9GVG9OSC9kRXRCdlU5?=
 =?utf-8?B?a3Nqayt0K29GZThlSkJJem9tYklCdldGRVZvTWgvdnF1MGFoU0k4WGJ1cHJN?=
 =?utf-8?B?aFJFSHFqRURuSXVmY01nV1gyTGp0ZkhEdCsvSjlhT203ZGVxV01qSlhacE8r?=
 =?utf-8?B?OGt1bU9hV01ZUHB3S05XZmk3bkxoUVFQMzhybDMzdkZIRVRTeGw3UWJaRHpI?=
 =?utf-8?B?RVpjRmhKUHBMZVExbm5FcmwyT2ZYSTdYSlR0MEo0YlQ1NG1sZWMrY1EzRFVP?=
 =?utf-8?B?YUlsQ0FXaG5nK0doaXFEZUNsalBoUEN0ekZaNmNzdEM2aElzaUp0Q2JlQnhM?=
 =?utf-8?B?NVZUaTNvVlhtZTlFMU1qanJRcldRclhKNXBZR2g4T0I0YmV4M2RlRm9YdjNs?=
 =?utf-8?B?N0Y3VXVsaHBaZnBMUkZ1SmwrZE0zY1RiVDMzMmg2c1BadEllcFN3TUNvUU1D?=
 =?utf-8?B?SzFCQ200RGFqSTA2RjNBYXNQNVZOSkc0UTN3b2RMYlMxcGhidzBpWmlPSmQ1?=
 =?utf-8?B?MWpUS002YnR5enVERDVwV2YwaEFTUVBqS1lmS3dwZDlUVExoVC9mTlM3dTZ0?=
 =?utf-8?B?SXlRQTM5Y2RQU3ZMSVhqbzh4eEtkeTZTS3JVYS9DWkJsUUpITU1MbEtkRFhS?=
 =?utf-8?B?YXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1dWVmRpT09vMzkzUjMyWnAyMEhzZDMwdExQZTRiSjdZZkdhdzNMVmdvckdw?=
 =?utf-8?B?b1FpaFo1RmtKS3k2OFVhRkJDOE5TejZBSmNLSXRRSUtpZEEzTVFlVC9aVm1V?=
 =?utf-8?B?Skl3MFAvd2w4aDFUQUx6enN4UFFCcGNnZmRMNkFZTGVnT2p1MCtNMVpmMmNl?=
 =?utf-8?B?aHpuZnBBczJKeFZ5b2pJbUFXS083N2E2KzJoNng0S3NxQmV5ZUpSVERTQ3Ar?=
 =?utf-8?B?Q3ZKT2Q0dEFOcEoyTnBYNnY4YmxYK3VOaVBuSEdUeE1tK3hqa2czSEZCZEJU?=
 =?utf-8?B?QlJmRWxPcTNiaG45b0RoaklUUzBra1FRUi9jai94Q2hZeVFONFpOb2V2aFJQ?=
 =?utf-8?B?SXp4U2JPelFhRmNNV3NHN0tkNFU4cUF1enpYanptVnQrOFFMeWxONm9Pd2M4?=
 =?utf-8?B?NlNwN0FLWjZ0c0tTbUpmaEMrS0s3Nkl2RUxpekVTempENjExbkwvVTlzekFT?=
 =?utf-8?B?OFBwdnhXU2NiTnBaOStob3F2Y0F3ZTQ5T0FWRkdrQU5RcFNJbXNLOGt2TjY1?=
 =?utf-8?B?Q01INlRVR0dVdlVJWmJMR1BscnJjNjZBWVhXNW45NkhHNjB0RWF3THpDWmdE?=
 =?utf-8?B?OHB4bWJValcxSGhneG0xNzByNnl4NEZMbld1akJoczRNeUR4eEo1S2ZlQWVG?=
 =?utf-8?B?alNVaVpuWGl5ZDQxQzB1Y1N2TG1Mc3F6UXdTbi93THoxZDU4NGdOSExOb2R2?=
 =?utf-8?B?Z2pPRnpiWk5rVTk1dEF6Zm1oNTV1bFN4UlNLamNkc2pldkI0VnRsT2krQUlD?=
 =?utf-8?B?R1B2eUxtaWxPVVZhK0tZdlB4a1V4THFxUnlYU3JtTmY2VXROUTV1c3RQTWlh?=
 =?utf-8?B?b0ZKZXBhVkp3ZFpVQkx5WjJxV1NSL1J6T0MwUk5Qd2hlSnhPY0c4UHd2VnNn?=
 =?utf-8?B?Sjd0Y3E1VW1mWGNyVUZrVlhGNmRqenBSMkY4MWplYVNQMXhFd0h3SlFWeUV6?=
 =?utf-8?B?YlJYTyt0dEhOZnBOOGY5bENHUEpEYW5RMGZkTjQ3aTlhTkJPempjelo2RDIy?=
 =?utf-8?B?VFlBcmlPanBUMERNY3o4Z1BNaUxJUTIrQXQzbWhhSFFhMkhwN1NKRGw0aS91?=
 =?utf-8?B?dTc0cXlGaUVIMmRTQTdQbzNsNzBXcDJUM1RvelRiZWxiUDNpY0NJL21oL0lw?=
 =?utf-8?B?Vy9jemZ2aVdZTFFrcHdiVU82UEVLNDVuWDVKK09nTG1LdFNmWXdhOU9PVS90?=
 =?utf-8?B?eWVFQmpIcFUyTUthYUlESEQwUWxVQkpyYmpBNktQQlNGNnJlYm1zMzJPS1dq?=
 =?utf-8?B?ZGtnYStyc1FObUNTQi9NZWVSMi9DbUdqWThjcXpyUmVqQ0NhTkJIWFZYVXpV?=
 =?utf-8?B?Wkswb05udktYTGdaKzNyUWtzbkUzMDFyY0FTK2t6Ym9Gai9nZzRDa0FzcUxN?=
 =?utf-8?B?MERZWUJqWVNmcEJxTGE0SlJEYkdmQkpncGlETzd3WWFVemdCN3M3bVFpS3Bo?=
 =?utf-8?B?Zko2WUo2Mk9BMTl4WFkyT3laOWdZS0RpYTdUOGJZc0Q5WmF6UGl1ZEpFeExn?=
 =?utf-8?B?WG9lRUtDOEtFbHBHRm1SU044eUxYVWl5NWlNYnVMZEZwVkhrYkNPeFlvOXJq?=
 =?utf-8?B?NXYxNHRnWnBSS0hDSnUxRXREWEpmNUFOZVpnQklGQm51RE9HYUxmY0pSRUFz?=
 =?utf-8?B?YU5YSjBzdlVmek5lSS84TEYrQy91UjFOc0lWeUVEOE5FVDRhb2NlemljNkd0?=
 =?utf-8?B?c0lKYjdGY2Nmd0dmaEpvc25QUFIzdXhReDk3U1J5L0dDd05SQk9vMnlrcEt4?=
 =?utf-8?B?cERQMVlMaTN3elFNYmpaZlh4MVI4TW1XaDFLekh4RUFZcEt2V2Y4TEE0ZGpu?=
 =?utf-8?B?aGFNTVJRZFV0c2RFMERabmFONE9ITGh4bUJCbkFMRCtRM0h3U2xJa0ttM1Iw?=
 =?utf-8?B?K0wzZlFwcDV5dWFMdGdxN3NOSVcrODdWWnJxLzhtb09YNHYzZHpDVkZzbDEz?=
 =?utf-8?B?TUNTaDRwQVg1M01EeXRlT0pmaFdEd0VPU1RWa2JRM1pTeUE5dnZyb1FHbE44?=
 =?utf-8?B?S3lSWnI3RnBSeU9zT1lrRGo4RGllaXFvMm13MlMwYmNqeXM3NitIdTlwVERj?=
 =?utf-8?B?QXJ3dUE0QmVIWjU3eUUwU1d4UllETisxY2hOWjVwU2lqL0gvc3lzMEd3NVVs?=
 =?utf-8?B?eFFDZUF5UzV3NUxCZHJNNlJWUFdQcHNkWWZQMVN3VlNqRHVCaG04WDlSa0ov?=
 =?utf-8?B?U2kzdUhlelhZdGJCMzRFK1NydjY3V052V3RUTlc0N0thdndaNEQ0ajNPbXdY?=
 =?utf-8?B?M1h6emtxS1A4MjdJakJORDdSNk42QlF0eGdGMUp1STdMYldZYzJBVU0zS2VS?=
 =?utf-8?B?a0VZOTRFcElldjZ6ZloxL3ZzZlk3TFpOcHNpT2FBRSttSkd2b1hzZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 79efb792-99f0-4e43-1c92-08de6343fb3d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:47:56.3199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fERNXrm7IHmZp7UhyVoYe0FBC6fP7SGL/QmtUnosoEgoA4ThU5iSZI5E3ty6n3wjX1DyHRoUTrU+N/OIHvtAOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3578
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
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[google.com,kernel.org,quicinc.com,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,linuxfoundation.org,ffwll.ch,samsung.com,intel.com];
	FORGED_SENDER(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tsoni@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-pwm@vger.kernel.org,m:mmaurer@google.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:satyap@quicinc.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:m.wilczynski@samsung.com,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 04D5BDC39F
X-Rspamd-Action: no action

On Tue Feb 3, 2026 at 3:46 PM GMT, Matthew Maurer wrote:
> This adds support for creating a DebugFS directory which is aware that
> it is bound to a device. As a result, callbacks under that directory
> have access to a bound device which gives them efficient access to other
> Devres, ability to use dev_err! and friends, etc.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  rust/kernel/debugfs.rs | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index d7b8014a6474698235203f2b7d8fec96f2bb43f8..ac614d693fa73929d095b669e=
9ba61958bec609e 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -11,6 +11,11 @@
>  #[cfg(CONFIG_DEBUG_FS)]
>  use crate::sync::Arc;
>  use crate::{
> +    device::{
> +        Bound,
> +        Device, //
> +    },
> +    devres::Devres,
>      fmt,
>      prelude::*,
>      str::CStr,
> @@ -722,3 +727,38 @@ fn new(name: &CStr) -> ScopedDir<'data, 'static> {
>          }
>      }
>  }
> +
> +impl<'a, T: 'a + Send> Devres<Scope<T>> {
> +    /// Creates a new scope, which is a directory at the root of the deb=
ugfs filesystem,
> +    /// associated with some data `T`, enclosed in a [`Devres`] for the =
provided device.
> +    ///
> +    /// The `init` closure is called to populate the directory with file=
s and subdirectories. These
> +    /// files can reference the data stored in the scope. Because it is =
stored inside a `Devres`,
> +    /// the init method is granted access to a `&Device<Bound>`.
> +    ///
> +    /// This can be used for cheaply accessing device-protected data ins=
ide DebugFS methods or
> +    /// accessing device-specific methods (e.g. [`dev_err!`]).
> +    ///
> +    /// The entire directory tree created within the scope will be remov=
ed when the returned
> +    /// `Scope` handle is dropped.
> +    pub fn dir<E: 'a, F>(
> +        dev: &'a Device<Bound>,
> +        data: impl PinInit<T, E> + 'a,
> +        name: &'a CStr,
> +        init: F,
> +    ) -> impl PinInit<Self, Error> + 'a
> +    where
> +        F: for<'data, 'dir> FnOnce(&'data T, &'data Device<Bound>, &'dir=
 ScopedDir<'data, 'dir>)
> +            + 'a,
> +        Error: From<E>,
> +    {
> +        Devres::new(
> +            dev,
> +            Scope::new(data, |data| {
> +                let scoped =3D ScopedDir::new(name);
> +                init(data, dev, &scoped);
> +                scoped.into_entry()
> +            }),
> +        )
> +    }
> +}

I think it is a big strange to have this on `Devres` (in patch v6 it has `D=
evres::dir` doesn't make
too much sense). I would suggest that we domsomething like

    impl<'a, T: 'a + Send> Scope<T> {
        pub fn devres_dir(
            ...
        ) -> impl PinInit<Devres<Self>, Error> + 'a;
    }

To me `Devres` is just a generic container type, just like `Arc` and `ARef`=
, so
the assoc functions should be defined on the concrete type.

Also: is there a reason that this needs a special API, and by

    Devres::new(device, Scope::dir(data, c"name", |data| {
        // use data and device
    });

?

Best,
Gary


