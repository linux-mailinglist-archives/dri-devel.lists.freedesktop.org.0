Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FBFB531E9
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1337710E0A8;
	Thu, 11 Sep 2025 12:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="p/tZ20Uv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2056.outbound.protection.outlook.com [40.107.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48AE10E0A8;
 Thu, 11 Sep 2025 12:17:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3JAi8U8lRaxx2Klw+EwV2xb6nhu1FPl1aXTVdzBtdyYx1hH9RL/6k4g0cdHA62mFRCK7JsRfziXH4S4aMDb4+DdIINg22rSYYF9Drwy/gZ0jmpf/hLSfrOk283/lzI8cPyzX6PU7wATIW6498N1FNt2LwbPQ9pBHxIoQyukM0GzHf9dn/H6q2IePxFMBMHae0A/+RmbPQOLTyF4WOj11/elf7QrRv10GkgjZndeVxAqUN3oU0jRQTP4CgkCEJNExtRC2V27t/bMhy7Dy/AiPqStHGtLEERdLrwm2kaqQBkW0N25m1W5+5fX0OTMLDHCR1DaZhuMnqbrxFddm7e3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHkCVCABVwqnky8hiNLGo78uOBRO27Z9dnx+hyf6Blc=;
 b=E6VR7YYxfpULrK+LmKpN/QUJ6gGwOHeBEJiAKcr7meZT1NPMIjuOEPChdr50VA7VwcW975Ql5jd9/fPKJMGNRVhMygO9jxeRQ4/EIqWKoplT05cam2oYvIokq/jQBEc6jpjsmexInc5i52xLniNkz4H3nn1JcRWsvgWPnacjAyH1gjMjdelXcjoJZ1PsN7FwL1yKQaI2JR4Of/MOlx8jA403awthiR3rxVnjx+wiOGWtQGE6VrUI3o07ODQxtR0ZJc5we+z+PdHxk2Vj8ciqYL8gS27ydHDbapRMHPJq3I08nLQnf9XuUFNMb6+UU2nODRzmxpc6B3SsyKjZ/a8LCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHkCVCABVwqnky8hiNLGo78uOBRO27Z9dnx+hyf6Blc=;
 b=p/tZ20Uv6iTM51nwuHUapFgxXZ46Oz7OgFkshv4Fk6yGBq6I9Boy+3B5LX1tQcHWz6U5+6LRgTxxcn0eTZeDcj6pdMEHfvf3AXHtx6OoZCKDy9kSJPAwFvN38+56kKskNQKmLqncAZNmE7jWvEzEsspIv2jWjxZQRPqA6fzGHGuxeyNrsWvTKEbgMCz2qOAY70sYSjo4yzaMzQWwXKleUF4NisgfAApZ3OHr2czMjzZzVDaUrY0ZJgmXerE/wC2iXys+CI4zFdQ2hsHy7k0LyJY/ja+9tsd9FiygyTnvUN+lnTpmHN+6fvqiLdy2O9O+HgiYQ8HysRgWeb0fuKRgOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9341.namprd12.prod.outlook.com (2603:10b6:610:1cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 12:17:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 12:17:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 21:17:37 +0900
Message-Id: <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
 <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
In-Reply-To: <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
X-ClientProxiedBy: TYCP286CA0270.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9341:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dafe217-ceef-45b6-f723-08ddf12d3409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZElZYUplSXcwbktwTkJISXE2Z1p0SGpqajFMZ1JKSlFRVHZqZnVGRldwRUZM?=
 =?utf-8?B?ZUZjNVA3NEV0bGxjZFlwakx0ZjFUYlN4SHhzV2hTZTFnZ3FxOUwyTDdvWjk3?=
 =?utf-8?B?ekUyTDE2YkZVZHBCMDdFN1NzM0p0dnArRXgyVTFHcEI2Y28yRGNQcEc2SnZk?=
 =?utf-8?B?ZHlwbEQvUTRDQ1pZN2RJWWFTY25mUHpveUk3VEJjVnJjNHNFL3dGVXVXa1Nw?=
 =?utf-8?B?ODlnbUVMSVBsenpHWUVaS0tycVpud2dhZXQwYS9xRW9CWDBybEFRUW55d0ps?=
 =?utf-8?B?Wm1DYUdQL0JWbEliNThsNjI0SGVpRlBTanhTWlhhK2NXVFhUbzUxdmMrZW1G?=
 =?utf-8?B?WHhObHhUVUpLMU5qWDJMai8wenRRTEx0T0lqZzVQU1hjbkVUMnpvdlQwOWF4?=
 =?utf-8?B?c2txakxDS3VmTVV6ZC9ENW9SejJJQ0pvRDUwM2J3TU9pVzNaR1NLS0FBcFFs?=
 =?utf-8?B?eXV4b2ZLclBMc2JmbWJZRGdwRlBndzVDcXI5VVBzOTdxODlJYU9EbFpxYmto?=
 =?utf-8?B?cEZHRkRGQVhzYlNwVTVkL1d4ellwUzhOUFNsV1g2dlp6RmlPZ3VXbm1aSUFB?=
 =?utf-8?B?cWR0UmFIZTl1R0V6MGRhOEJHTkpENnlhUHRucWZSY1RETURXMDgwQWFMNVgr?=
 =?utf-8?B?RVdGVVhzdXU5b092aGg1b2srMzE0ck5aUERWUGtoRHFscTNIdFYwTUlpK0F2?=
 =?utf-8?B?cVdxdFRFVE1yeSs4U0RyclVyVklFYVBlOEtscjkwWXJWcU9teEMveGpXUFZo?=
 =?utf-8?B?ZU9VdjBxcmpTZVp4SVdiM1pjVHhMS1h2eldXNWU5aW5GajU2S2RmZS9xNUly?=
 =?utf-8?B?ODhCTEozNVV2ajhtQm1YV0JlSCtrQ1RsRlNxTXY4dEdtMEhpYjdNL0ZlK3Rh?=
 =?utf-8?B?aG56cUlISVFsaE9SQytOUXdZSU9NLzhhdk5JaU15L1dXRlhYTW5wdDQxY2ZH?=
 =?utf-8?B?SWUxZlVFVWcyMVJRV1JFbHltMnFEYmdsSVZuenpGMHp2UzNzMDY0YUx5SWky?=
 =?utf-8?B?TXIrR1JuRHdhN3UvMS9HdjV3Sm5hTHJjRnlxMzZqdERrcWNTQTMraGdiSGEr?=
 =?utf-8?B?cW1CaUZRVDBFdk0rVlhwTFFZa1lDR1ZGa0JDa2VjRk1adnMwZ0RaSkMxNWV3?=
 =?utf-8?B?Ym54M2NKT01rMkREaDBRK2NvQ0hmVXFPTFBEN3N4bVlsWHVsRHdudW92eTdi?=
 =?utf-8?B?d00zRlNxRUh3SXlLclJiMjZBVi9iWElQN1JBVzhpTTFOS294WnFxSjB2SHVa?=
 =?utf-8?B?THMxSC91S0NvVHhmc2M2UDg1ZmJocnUwQ0JvVExrYjNrRWUwL2V6UlZCSERP?=
 =?utf-8?B?NFRpcGpqRzEyS29rWHNHMzRnZ3NsdzJFRlorOHVIejNlVEF4SVhXcEM5TG1r?=
 =?utf-8?B?RnloTlJENUFhV0N0QkpRNlp2VllHak0xUm85dDg3Y0FhaVhEenE5cDZKNHhk?=
 =?utf-8?B?RzlINTVMdmlaRFNJYzU1bW0xVk02R3RWRmI2QjhMSUFjUFNOT1RpS3BNRm1T?=
 =?utf-8?B?Z2Qva3pCMzh2Rk1ObmZONjRIUmFhQkNDbzNxK2tWMXI1Q1lnOTBtWlpFTGxD?=
 =?utf-8?B?ZnVBL3lyTE9KMFRBKy9ESWtVcTlKREJjQVVzVk9MTVllK1lSc2IveENoaTIw?=
 =?utf-8?B?ZzBxTTFxcHhtdHF1NnR4aDlZd1cvVHVkTldXV2VQTnl2U092R3czL1cwd01n?=
 =?utf-8?B?dGhhWXlGaWpuQmIrdS9rTXV1eDNRcEJmQzdYVFB2dzREQnNwZkRlbVJaRHhB?=
 =?utf-8?B?UW50blRYRk5rWU1DQ2NoR1UvLzAyYnBYN1RLaGtLejlUN2x1ZGxXNTlHZ0xC?=
 =?utf-8?B?S3A5OU1wN1c0SzN0STFrNjd6cUpBRFIreUdlc2FVYnhxcmFybFVnOWZvRXlZ?=
 =?utf-8?B?MVNjYy9Bb0hiYXdGRWdUZkxMSVlKUUtsNWJWVzE4d3o2VXBjY3VWY3RxNHhP?=
 =?utf-8?Q?jeDoftTBz54=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVhmWTdCR3Z0VFg3Y04wUGk5L1RhYjBIaGtoSEFjcjlhYnhYak9XSzYzZ2FH?=
 =?utf-8?B?WFo4TFRDNlViRjB5UUdOVkRNZk52d2N3eVI0d2pLSmRxNWxzT1YxcjZkQ09R?=
 =?utf-8?B?OElRR2RHKzBSZittbnNHNkZPTGd5MFkzanl1VXZ4M2dscUQ1dUVBcnFxVFFT?=
 =?utf-8?B?WG04WGladFZkdGVCUnBqdXg4dnI5VysyOE9KOEN3K3hjb096ZlpNaE9RVzgr?=
 =?utf-8?B?VklQelFLbnpYWUN1cTRKaFRmMUlmdkUyeHptSE5GVzJxQitzaU16OFBod0ZK?=
 =?utf-8?B?Wk9VQS9Za2hEMVZmNjFQVGtrdWhIUjZsRmxGVEhldFMxZDE1NldOUGM3RHVk?=
 =?utf-8?B?V1F0OWlIcHpxNjI2T0tubm9XMExGT2x1eGxIakFQVFpUdTRnRjUyb0dJRms0?=
 =?utf-8?B?OWhQN1dXQmQyQzBYSUxieVkybEdiOXRBSHF4SXRjWWRpRmtxQ0FJcTFZRWJQ?=
 =?utf-8?B?eHZyWSs4Zzcva3hMVExRZE90bG4yRzFBTlRZa2JUbUY1L2pHY0VBdVQ0Mmlz?=
 =?utf-8?B?TFZka0QrMXdoZTUrZnFmTktQMHRhTEl4Y0dwdW1DbkVzRjM4Z200YlkvOEdj?=
 =?utf-8?B?dzB4blJMMmtHRWdka1dFOTJrTEhsYjFWb3FBbVB2aUR3VTcxQWVYRFJGQk9x?=
 =?utf-8?B?Q3h1bjc4NTVpTGJ2WjVtSVZEcGN4M1ZRdDRRWG12VGRQMWZpSnZXby9sTmxI?=
 =?utf-8?B?WW1icWVjdkJ5V2I5Z2g2NGFWV3RPcWF0em1XWHV2RHpGVnBzeW5HYUJIaXNO?=
 =?utf-8?B?MTh5OEZvV2J0cGFMTnFFZUR2Y0hrZEk1VE9EMklwRHQybEdVSFpPNDR6b2NK?=
 =?utf-8?B?NTZVMW1xUWxQd01wZWh5c092UUlMQm51ZmRJZy95azV0UHpCTkJCMnVwV1Jp?=
 =?utf-8?B?YVdmS0cxOEpFY1dKUFNsR1lNVkR1dTh1THlqS2xLZ2RvaFFqYUYzbjhyeUk1?=
 =?utf-8?B?Wm84bE41WmlOWndaNnljczNhdmQ1cVRxV0ZqRFFDZTRRZUV1UExpNnFOYVVq?=
 =?utf-8?B?U0hhTUo2Qi8zMW0wQW9FSjVYYm00TkQ0N3NMRDVvZUxNQTkxbllyNXAwSUp4?=
 =?utf-8?B?dksyQjVhTWxSR2pSMkJlaUFmbWtoMUpxY2U0NHcvL3ZrSnIzQ2I1S0NkL1I3?=
 =?utf-8?B?bGxPOXBNUmVHWm8xQU5BV013L3haMTlDM3JYVmlrd2t5OGVUQjVYR3dHazE4?=
 =?utf-8?B?VzJSc3RIanJGYm5RQVY1YkVOTG1JY0o3NElYekdUYytNSVAvWGtJT3o5YmFB?=
 =?utf-8?B?WGg4TDFxZ2pvY05yd3VuS1FFMVpDSnlwb25zT2pwT0MvckVMYlg5VE5XL3Ir?=
 =?utf-8?B?eDc2VzZkWFhSeHdSYUwyTWFFNUE4UStOWXVHM0o3eVYvNDYySStzYXloRGh0?=
 =?utf-8?B?SW83Z3JzUlZoV2s3YWdKTHN5bWNkbFBNaWZEYmxOcksycFJPV25KbDFSSjU4?=
 =?utf-8?B?K2FBby9QTXVaSmVhNmpxNjFPZlR4YTY0dHliQzB4NDh0SXpUekwyYjErZHVl?=
 =?utf-8?B?cDgvUEJ4NW9FT1E5V1dEK1M2WkFqZUs4eXIvZzNCYnNIdG9qaFVDc2sxREpE?=
 =?utf-8?B?L3h1SFZyQTM1UnZpTWo4SFRpczI4K2MyVWFuV0hwQ1FnYnMyQzBoY3ZLRUZ6?=
 =?utf-8?B?QXdZdnJRU3dqcVF6MkNVeitISzdFa0p5NEQvSEpmdldndFBRNmdmVXlqTWNs?=
 =?utf-8?B?Q214M3hkUnNyS1Q1Q28xbkpZSC9lU3BxMVhreTlLVWpod0ZKUWtmcTVHcXZu?=
 =?utf-8?B?bDNqMlZzQzJqejZNcEpWRG5xRTJRUGFDZVRGZjNoK29ZRkZnK0xWN0hjNHU2?=
 =?utf-8?B?b2w3K3lkMHo4MFRNRFU3Yk03dnAzZXZnaVRDTUpDTVpVb2h0bTR6em0vVDdS?=
 =?utf-8?B?anpnb1FlWElkc1ZqWDY5YWxCSkdvYUF0VzVKK0llMTV0aVByajZxeGNZWjZk?=
 =?utf-8?B?MjJFYzgza0VlbXVVZWFHTWxBem9xdjJGcFFIL1dsWFQvL004RzRjSU5jbEJT?=
 =?utf-8?B?S0N5cnRGMUg3NFpaSnpEYTNOV1ZmSEI0K2tqOVdoUytaTHNuQjFLY1dqb0NT?=
 =?utf-8?B?cGRiWi9VeXlxc0dIK2dUa3hZMENUcVVFNXZ5L0dPTXV2ckZJT0c5M2N6c1VR?=
 =?utf-8?B?SUVzNDRJU1U4dVBlTFEwaXVuUU1yZ1cyaisrMDVseGJMbUtUYWdaREcyUnR5?=
 =?utf-8?Q?c5rA9FfFrRVZw1flm4pmPwqqQpWHWG8wTWvmNaYjdiHC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dafe217-ceef-45b6-f723-08ddf12d3409
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 12:17:40.9166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRO/dYd/9pK+XrJG2RreSZ6Z6eMtzSzZaLBl1EhyYXIcgQ20hGhMld3Gqy2d83V0MLO38S+YCUaMr1jVK+8WtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9341
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

On Thu Sep 11, 2025 at 8:22 PM JST, Danilo Krummrich wrote:
> On 9/11/25 1:04 PM, Alexandre Courbot wrote:
>> +    /// Attempt to start the GSP.
>> +    ///
>> +    /// This is a GPU-dependent and complex procedure that involves loa=
ding firmware files from
>> +    /// user-space, patching them with signatures, and building firmwar=
e-specific intricate data
>> +    /// structures that the GSP will use at runtime.
>> +    ///
>> +    /// Upon return, the GSP is up and running, and its runtime object =
given as return value.
>> +    pub(crate) fn start_gsp(
>> +        pdev: &pci::Device<device::Bound>,
>> +        bar: &Bar0,
>> +        chipset: Chipset,
>> +        gsp_falcon: &Falcon<Gsp>,
>> +        _sec2_falcon: &Falcon<Sec2>,
>> +    ) -> Result<()> {> +        let dev =3D pdev.as_ref();
>> +
>> +        let bios =3D Vbios::new(dev, bar)?;
>> +
>> +        let fb_layout =3D FbLayout::new(chipset, bar)?;
>> +        dev_dbg!(dev, "{:#x?}\n", fb_layout);
>> +
>> +        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
>> +
>> +        // Return an empty placeholder for now, to be replaced with the=
 GSP runtime data.
>> +        Ok(())
>> +    }
>
> I'd rather create the Gsp structure already, move the code to Gsp::new() =
and
> return an impl PinInit<Self, Error>. If you don't want to store any of th=
e
> object instances you create above yet, you can just stuff all the code in=
to an
> initializer code block, as you do in the next patch with
> gfw::wait_gfw_boot_completion().

I don't think that would work, or be any better even if it did. The full
GSP initialization is pretty complex and all we need to return is one
object created at the beginning that doesn't need to be pinned.
Moreover, the process is also dependent on the GPU family and completely
different on Hopper/Blackwell.

You can see the whole process on [1]. `libos` is the object that is
returned (although its name and type will change). All the rest it
loading, preparing and running firmware, and that is done on the GPU. I
think it would be very out of place in the GSP module.

It is also very step-by-step: run this firmware, wait for it to
complete, run another one, wait for a specific message from the GSP, run
the sequencer, etc. And most of this stuff is thrown away once the GSP
is running. That's where the limits of what we can do with `pin_init!`
are reached, and the GSP object doesn't need to be pinned anyway.

By keeping the initialization in the GPU, we can keep the GSP object
architecture-independent, and I think it makes sense from a design point
of view. That's not to say this code should be in `gpu.rs`, maybe we
want to move it to a GPU HAL, or if we really want this as part of the
GSP a `gsp/boot` module supporting all the different archs. But I'd
prefer to think about this when we start supporting several
architectures.

[1] https://github.com/Gnurou/linux/blob/gsp_init_rebase/drivers/gpu/nova-c=
ore/gpu.rs#L305
