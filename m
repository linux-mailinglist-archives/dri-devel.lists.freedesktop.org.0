Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0376ACD06A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 01:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A1B10E25B;
	Tue,  3 Jun 2025 23:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O3o8g+g4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073D310E0BC;
 Tue,  3 Jun 2025 23:54:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aU0mXdVerbeMolav5gGtwH2Heej+QXNWZBCmL+jGNkOoxUW4toUJfAlz//slrnD1apYqYX6SOCVaNDLfSRGo1wY3u552LxH09BV9veWiCCbVsMWF/KEltmRYlNQA2l4mBblilxw6rl1a6Em1MQqnw1H7Lm5EWRmFQQtQDTyhASw/c3ZFnaUAslq2rPrxYRnA9oCYMrHTzBBTPDocnGR+o1txEKR5Ikc8G6s71Mbcw5HJRyJtaYGtaC3vfH9fQJ9ZpuMUw36GQECTAmakpMtPThaN8w/rdPOSkw+PBTATyvx4k9R7XcNcBPIHPtGx8lL0xKPSku7LK0i4ZfcuklV+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vpa4SD/lp1P3HOw9BYkEtucwavH7HwBJyVzkf46Yfzg=;
 b=ZM+w+cjBG6Tj84i6VDN5d8F+3UEMrQb76ycRc8vaSejRPKQKoKTIZUFO6ITkIgkiJYzCrxqy1QRwXeXJ6L2koybL1XzaEtjXJe4BPjMRJHxUj8InmWJaRAdgw8vMLTdYjaRxxVD3BIcWbYDupT+R4VTw+4K05fgZXbgUi6gdcy+tZ23eVzp2KvZQfNTLFytRQoyG2prdHCzBuFH/SeTFgqhLYRvv1Geo+YFGS9vtyU+dekwqJXR7a5tySGFi1Avv+02m0v9l6BFWPC9WQ4FGKObG+TU2DWzvHPa8lRCwiI7/bS7cJh5AUdDcLuBOg3blTlZSg41C9+esbU6CFNwAqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vpa4SD/lp1P3HOw9BYkEtucwavH7HwBJyVzkf46Yfzg=;
 b=O3o8g+g48bXbKVtf8Fw7WNI25Rdb8jYDW2DRbWa1QrVq5fDRr3VV3J/9KaVre0huOPx1edUrlpv/6aTf8xPXb84vfhKHLbB852WkYkYt+Gf73Kayrmx5fTvDvK0s06gJ5Qd3V8HLN6SckUbl/RzuD+XyUag3cOCCt3+C6DOKvzqGxbp5CIIP9Fc43nU+papejHoejxu8GWT5rI9rASr28gSEnTZt4TOb8VFa7Up5a5I81C7iQLPGzqMIyTD9HWCxqrS+eo0xpoMjHTLYYfhQovVxcpjEVGaKLI2xY79Ca7PobuA4ryxJ/up3z0k1nJPe8Fwk5RNYbg2f5Gl2vL8t8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6456.namprd12.prod.outlook.com (2603:10b6:930:34::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 23:54:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 23:54:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 08:54:06 +0900
Message-Id: <DADAXGJLZ4LP.27P0GIQB2DKD0@nvidia.com>
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Benno Lossin" <lossin@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
 <DA82KFLNAOG7.R7YT4BHCLNZQ@kernel.org>
 <DA88YHU4AZT7.B8JGZHW9P9L9@nvidia.com>
 <DA8GTD7LT7KO.1A3LBQGEQTCEW@kernel.org> <aD1xVkggDrCvA7ve@pollux>
 <DAD9NDFY2RXV.3LDMFVUYN0IKD@kernel.org>
In-Reply-To: <DAD9NDFY2RXV.3LDMFVUYN0IKD@kernel.org>
X-ClientProxiedBy: OS0P286CA0073.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:b0::6) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6456:EE_
X-MS-Office365-Filtering-Correlation-Id: aac6157e-4aed-41cd-59a7-08dda2f9efb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|1800799024|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFNVNGl4MVpROW43R1I3QUgwUkNwelZiaTA5REI5aWU3T2ZpWnVneERMTzVw?=
 =?utf-8?B?ZEZURk1yamZXUnlWZW1qRXR1VU8yWWxPTDFMaVlWVDZQQUtJYW4wT3VtWXpp?=
 =?utf-8?B?c2NUSThWcFpFVVpjUE5LdEk1cGFFNmZRS3lnWmtOV05zK2ttWlFIMktpam9h?=
 =?utf-8?B?RVNHT2RNcjB5TXkwZEJPeDc0T0h1ZXp1dFRadVVPK2lKUCtPRXp5ZjNteUhR?=
 =?utf-8?B?ZjVKNGdUM0hLKzFqMEdrZkl3NTVZUFlBTDRMTUQ2VXJrdExnUXhVblg3SlBU?=
 =?utf-8?B?THQzdDVzN0JaZ0RIMWhQaitlTE05MVJTZ3doNEw2a1B0R00rQmlibE9GNi93?=
 =?utf-8?B?OHd5ZjRISFk1UWpuTDd1NVBvc0FRQXlkUDVUYytPejNLdWdFd2t5dDVDZTlI?=
 =?utf-8?B?Y0hDeFBvRkRvQ3gvaDNqMGh6NDNxTCtlUkdBSlhmMkkzVzFsS2cvTEJjeDRt?=
 =?utf-8?B?bXpLbko1R3o0TlFrdlU5SUtwSFJvUFRsMlQwc2dXc0JiTTB0WVFQUm9pRk82?=
 =?utf-8?B?RG5GTXhYTThHT29FWitZcVNpY2c4YXRxaWhVM05wMXFaL3lrV1JPNXk5SFZa?=
 =?utf-8?B?M3dqZWd6K094VEFZMFltYlpaSXMxcnFRc09QQlFCUmxFM1FqendHOTZZeDls?=
 =?utf-8?B?cVBmYVJKL2dGeWwydnRNRjZRYnNPS1lFMHZkUGF4U0QwQ3U5bStBQjJVdHZT?=
 =?utf-8?B?T2FGMHRZNjV6R3R1MGZDbk5IZWpzTHQ3RVF6NFJPVUZTbUlJZmZkOEpYblNW?=
 =?utf-8?B?YkI5c0kvZXp5ODllZC9Hc29nUXMzM0xtcTd1T0pRSDkvTWE1bUd1VTN2SHQz?=
 =?utf-8?B?dS81WlU0RUNRTER2SVc1VUVvVEl1NDgzaFEzeTdiNlEzVmNEVHlOSjhZNkpC?=
 =?utf-8?B?MTJTUDJUcVdJTlRtV3dEQ1c4TmF2enlWenh3dURzTCs0dVRwalJRSFZVVzZ1?=
 =?utf-8?B?TnRPZWM5RTRqb1FSaFVkNzRVYW95R0RzQTdaUEFhd3JKU0QwaTBLNjlpeVZY?=
 =?utf-8?B?cFBnN0oyVlFkdS9XbkFTcytCdG1sZTV3T1FoWHRsM1hBV0R0LzhYWUVrdkds?=
 =?utf-8?B?S0xCVysvSnd4WnJhWFhFWVR4ZVdaOWhMcVpQUVo0ZUtNVjFnaS8yckJsUGwr?=
 =?utf-8?B?NmRTcno5cU5va051b3VYMVVnbTljN01DOUJvMWx0SnMrZ3JyMzFnZnJMeTU2?=
 =?utf-8?B?VTJ1T3lDOVhWRnhxV0xTNE5aRXJ1bkV1bGQ0Qm1PckFGKzh2Wnpua0ozK01H?=
 =?utf-8?B?YnFkVWNQVFYxL0owOHI5MkxJRjc5b2NPelR3YWNieWdBVFc2TGx0WjRaT2lU?=
 =?utf-8?B?ZEltMVdlWDZ4VzJDdjdqb3MxUWdWWk55Rmo4Ky9CKzV3MnFvRVhTb2I0OERO?=
 =?utf-8?B?MXFKSlNvMzVKWDd5dXYrTzY3QUhYVk03RGNIZlZlUk0yY3p5RzUxNWdIb2ZT?=
 =?utf-8?B?M3J1NWloVm5Dc0JXNWhzSTB1eGVzWnNzTXhlTnZDQ0F0UTJYZWRhSlpnUFdo?=
 =?utf-8?B?eUNaWjdYK2J2RDlPVzhUU2Y3eG9NeE9lcVQ5TTBiaE4xdjZPOWFlRDlDdkto?=
 =?utf-8?B?dG10UjVJMm1NN2YvVlhCRWd1MThGNmVFUktuNlR5NlUrQ2JJUkdFMHZyY2Fi?=
 =?utf-8?B?MEJ2RUVyZFlnT2kvR1NYRkZZSy9ld2VVbTNFMTQ5VWx6WmRoZ0lPcGVvVVZ1?=
 =?utf-8?B?cUEzRjFSa0NpZlhIQThScGdyWURnVXZUbFdPNk40TkhTV212dVFZc2N4TC9y?=
 =?utf-8?B?bTNSeUxINnZFelJidXZNVm00dnZiWFdKeUhZQU9lOGkrK003ay92N2VVcXFh?=
 =?utf-8?B?M0duTEVIZmNwc25LZTU3bGZmdHJjK0xxZEJkU1I5QkxZU05uZldPRDM4QUpx?=
 =?utf-8?B?NXhCUGkwcVhXNGhFS3IwNGZ0ZjAvRGFGKytSZnpERXdGSjRXdHBSS2Z6VC9w?=
 =?utf-8?Q?pkjqvQlsjtQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFJHOTBSc1NUaWRLQ3E0RTg3c3JXS25OUUJTVVlteDVFSzV1dzZZeWN6dWxE?=
 =?utf-8?B?bGlwY29YOHVVZk43WUpKYVIzQllHY3NzWmV0Q21peld2VUs4QmxuMG51cXE1?=
 =?utf-8?B?TmtCT1NoNzNFdTVvd0dqb2F2aUprbG8rM29nVzlUWWVpYmRTSytYMXBkdDY2?=
 =?utf-8?B?dmZXaHJqWmZFZXQzV2NIbE92K1BkSGt3Q1lxTjZGLzNFV3RZbXVzQS96R0ZB?=
 =?utf-8?B?emNRZnB1STZSSGVRRlNLaHhrWEN2Rm95MVhsVmxDdkdsNTh1YUo5Vk9WNXFq?=
 =?utf-8?B?VnJJWlFEQTUwTzczS1NnQXdUSk5SZlBYWEtqRHI2NVdFaDdxaldlT05LMVF3?=
 =?utf-8?B?RnFvSGwzWmVNN3JHYWRMbVIrSTdOdUJKMFNqY0oxVFdWb0xwZG1Fdlh1THZI?=
 =?utf-8?B?dG9wbWZTWUVsZnd6TS9CWW91dktrM3FXR1ZtdHVCT3pGMis0RkdJaVlFMGpL?=
 =?utf-8?B?ZVZVR1ZWMW1PZlVUYVJsYm5nOWp0U2pZUG9mWVA3OTYyMFI3ajdPZnlNMHNY?=
 =?utf-8?B?NW5jYVRuaXgrSm9KbTJOWTZESlJ0amovZXY2Q21mblBMQnQra3FjalNSSVlL?=
 =?utf-8?B?TXNDN1pUUWx0Zkx1d05XZnV5VHgzNTh3OXhydUtONDNmeXVHM3FmRmtlZW01?=
 =?utf-8?B?OUVzakpMMUFtUk8vU1UzVTh3WHhQdVgxZnJmUmR1b2pQVXRTVW0vbVd0UDR1?=
 =?utf-8?B?M1VUQXBuYWt1WVk2aVMwb096bEJ0RTlwbmhZdHVWMFNJSlRzRW5RcFlVVm81?=
 =?utf-8?B?VWZTNnQyNmJZQnFrRkZ6NDNMeDZ4Snd2R25pbjRhUkF1dlV2aUZRN1BOVHA4?=
 =?utf-8?B?ellXWDh1RGZoTU1ZeEdscUhDSUdkemloSm9qaEROaElUY1JJTmVXSXpjalFt?=
 =?utf-8?B?V2o5eDQ4YjRqY0JacWFtb3FMYWNYcUxjQXBBajE3OTJHcmYvNEdMeUF6emU2?=
 =?utf-8?B?MzllajM5cG02dEIvZ251K3NQKzhyazJUMnVabWhKRDJSeFBmNml5ZjlwQ1ZC?=
 =?utf-8?B?cHNvMEVVd0ZqcEF0cGhGRW1mL0JHbFRQeGNwb3U0NzFEbkxSK0FwdGFUYS9C?=
 =?utf-8?B?MEs5UFJOS1REcDB4c3F1TFZOTFFrVXI1OGhJYXlxSVZMeDVsZExqdjdPL1ZN?=
 =?utf-8?B?bUI0bVoyb2lFSndFVnExWlNIUS8zeHBndDNqQzJjbzM3R0ZtR0luMWtyNGFm?=
 =?utf-8?B?ejNuWVVmdnhtdUljb1Era2RKYXRqMm9xWFUvaW9MWVZpYlIxcXY2VWlhTldz?=
 =?utf-8?B?ZFd6UEEyekxuaTVuQWhQY3FxcElhUEtQdHlWNkE2TnlDZkhDa0tsV3NTQy9B?=
 =?utf-8?B?Rk1Qak9SUENGaWtDTmdpQW5pTUVKdXlPTTViWDlod3VKby91OWlTYkhnRkJ1?=
 =?utf-8?B?Q0FnZVU4MjB3cERRNDJHVDlIcjM2cU1zdzZiYzN4emw1Zjhkd2kyU3hnQnVV?=
 =?utf-8?B?MnJLNlVZWTBwOGNaY0J3emorVkQvdzZtaGszbUJtSDBQeEVLSFFkeHVkMVN0?=
 =?utf-8?B?Q2VYblJWYnRtWExldmhkd2hraHVrb2REMzdLMy94RjFNSTZIcmsxWUkxMmht?=
 =?utf-8?B?S3lYM3R0SE5qNktOMlRpU1h0VWdZS0h5MDQyMGp2YVRsaC9LakNoUGxNaS83?=
 =?utf-8?B?a1JOK3Z3TzhLanVBODVHVFpRQUJMWnRpb2h5anFyZVliNm03cVhhRFJMVDRG?=
 =?utf-8?B?Q1Vob3dKRm9MY3pyT0tCQjMvZ1dnZHhOTytWc1VqUlhEcWJxdWxzNnduN1o5?=
 =?utf-8?B?WnM5SmQ2eGxDOURNS1pHSk9jY2czMTlkK0V3ZVdjS3c0dFRPMEFlbnRRVThL?=
 =?utf-8?B?OTduN0FiYjJxUWl3K3EvelJIRXI0eFhMeElIVEt2N1FKb0ExdjJiZnd3Yk82?=
 =?utf-8?B?clM5b0ttaG5UWEQ2T2ZpMUl0Z291T21RajBzdG9FZUJUTjE5ZisrckVicUV6?=
 =?utf-8?B?K0YyT2NTeG9XazIvSlhYZEtnZE5zYXJsYnFocTdkSWlaK3BDTzUxZEhvdG5B?=
 =?utf-8?B?OFZoL2J2YkRBQ3lTeTJUT0ZVeXk3cUFkSDg0aXhYWHNUSUVjME5pUXhkK3dv?=
 =?utf-8?B?alZ5QXRnd3VKYjU5YTJsWmZVNnc5a0hXTWI3Q2QreTlLcEN3clJzS0YvaFJs?=
 =?utf-8?B?R1NBY3pHd0d0cTFZRFN6dVhSZXJFMFFCczltKzZlVjg1cDQ3cnNDY2laK1ZL?=
 =?utf-8?Q?Sxjk4OpwHGm/FQvQIjSc8yMdxxcTH8WLeZ/CCzfvEbSr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aac6157e-4aed-41cd-59a7-08dda2f9efb0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 23:54:11.4806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J06aPJNqT5hXDmlBPWRS/g1dEkYWjhb/4BYqa49yuWQb7pBx5wtsQviidm5WfPDEUZptoE+yX+Pt+TxNOdcEXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6456
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

On Wed Jun 4, 2025 at 7:53 AM JST, Benno Lossin wrote:
> On Mon Jun 2, 2025 at 11:39 AM CEST, Danilo Krummrich wrote:
>> On Thu, May 29, 2025 at 09:27:33AM +0200, Benno Lossin wrote:
>>> That's also fair, but we lose the constness of `next_multiple_of`, so
>>> you can't use `align_up` in a const function. That might confuse people
>>> and then they write their own const helper function... I'd prefer we us=
e
>>> all functions that are available in the stdlib.
>>
>> Considering that, what's the suggestion for this trait?
>>
>> I don't think we should have a trait with align_down() and fls() only an=
d
>> otherwise use next_multiple_of(), i.e. mix things up.
>
> Agreed.
>
>> I think we should either align with the Rust nomenclature - whatever thi=
s means
>> for fls() - or implement the trait with all three methods.
>
> The longterm perspective would be to choose the Rust one. But I'd also
> understand if people want the kernel's own terms used. Still I prefer
> the Rust ones :)

My understanding is that so far we have tried to match the names of C
counterparts as much as possible when reimplementing stuff. I don't
think this particular module warrants an exception, which could cause
confusion to folks coming from the C part of the kernel.
