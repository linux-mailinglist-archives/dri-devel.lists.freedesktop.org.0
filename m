Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA9DB49F48
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 04:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDF610E224;
	Tue,  9 Sep 2025 02:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="D+n66EC8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BFD10E224;
 Tue,  9 Sep 2025 02:37:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQreQfxk71WRZC0V6WdS7sCeb7TMZmihbXpFRP6zkP8Pbk5PKN+DxnnAu7QNEgNfDTYvfBkezn1dytne0Yn+6ZZHfqmfJLunucalER76jgLoo5jPVlkLHFtoqWuBJC+ZQa/UMfuxV9Y/NGGrxtlzbSgJY9+SFP9kXWXZVy+ta695MW73IllN37am1qlGOGTqJjA+pkpkd1Uk+lUAoIs6sKmQyM5drFRY7iGaau76vjwiqMnSJOCz7CCVJgbFhE3htDhD6rA0gB9MNgxwM0gTeC561Rje4PY3G3WaQsPTohRaQv1hJaBFFX6M5mbujCAhkdQvhuIQZ1F3ylpJDIITSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1X314vZYGN6ib3CTCGhvqGHaPnaltbJCUkT2kDY8uFM=;
 b=QwlSp3RMkrWqVFqLpT5Kv6f9lnq1Gh3/yBLEvwvPJDMjae5Sl1y2D7Oh4Dwp7rjJGbo5XZbcN0Su6sTBk6MDIO/9FZ7bAzT858AgOchMN1U7j5sEbAKIF7wax4ifktq2aNO63uj8u86tseVGwNTMLlmBva3fe87hp7vpLaVduGx/y2mwmx0HVrZMjJp+rl5Bpx5S1ON6fCq0xyLNrofrj/bPvTw74mu7pTWRGlDspOv0fvtLSt1Lvx/dFyAERy2BMqQTGdtwshoALCfoHD4hQ/XgcUfSVzqflV5QpvVlMtcdrwKxGEf65jQdxEDvtf19l1/JREwdc7MSpjQAnQfSvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1X314vZYGN6ib3CTCGhvqGHaPnaltbJCUkT2kDY8uFM=;
 b=D+n66EC8KUD0U5gmsVNW9agKF7CmqZls+AwLS3gGdMdOHn41OaSrazqxb19AMRJSosxyPafc84hQRAspPAhn3Uul3kC5XMByt4GlSwUyJzFRuTB3QkxfVmqkewlomoxpy/fVrs8qv+++VYa8UAw+tDIEuh3cUcTnhsQcJBvxVGlfwn7ioYqNyy0AJYCcNXg7dQCnkL5ehqt88pR1cFCPO0mmnfRH6RmW9fGfgxG/CxYLRmLI2CoiDUx3SuGJUFK10o50khjvyDZfqdyA8Ugtkk9dIy0H4fbYUbzr5gfAWsMF/DlFb9w+2Ms4JsSKhF6aImVPPxDem0/yTSIjNMb1QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB6286.namprd12.prod.outlook.com (2603:10b6:8:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Tue, 9 Sep
 2025 02:37:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 02:37:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Sep 2025 11:37:15 +0900
Message-Id: <DCNX57PKVO6C.2MYEGBZ26OQ59@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] nova-core: bitstruct: Move bitfield-specific
 code from register! into new macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-2-joelagnelf@nvidia.com>
 <DCN39JCF1DIJ.3JESSN7N9WJBP@nvidia.com>
 <3ef9e2c2-560e-4b58-96f8-a6db4236fe0e@nvidia.com>
In-Reply-To: <3ef9e2c2-560e-4b58-96f8-a6db4236fe0e@nvidia.com>
X-ClientProxiedBy: OS0P286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9c::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b059eed-095e-4992-2e6a-08ddef49cbb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnkxdE9qdGp6RzBQTnZEOXR0WCtnSHNUUHBMTjI3WDNXbEpVVmYvWFlQS09R?=
 =?utf-8?B?YnBYZ3puOWRkelRZWVc5cDZ5My9KWTJKRW9CbTMyMVpMYUxTbkN2TW5oa3k4?=
 =?utf-8?B?VFpjR0hiQmx0b3JPZVd5dncrR3B4RmdIZzcwT25iWEdYRE9xckVXdjdQSUJN?=
 =?utf-8?B?b1ZySm0wZTFodElodGNxbHlPRmprbC9HVDI1ZFJWS2p3ZUYzaFFKSGFleUJj?=
 =?utf-8?B?cG13WnFVSWZNb3FGTXVOdXlOZTlKM2E4ZXRlYlNzNTRWRFFHL2R1QW1ibnlR?=
 =?utf-8?B?bnVHc3hXMEZNcFBmR2g1RjVpZ2xVME5oTm9wOFV3djA4cTZOVjc1ZGR0cWNk?=
 =?utf-8?B?Ty9FdzJCSnpkSkorcjJEMmhycm9INHBVVzl5RUNPRVdwbDM2S1Nhb1IzdzVk?=
 =?utf-8?B?ZHpxYmtJTUc0ZWtYQm5UbGNnUTdFbnMyVkIwZ0ozYU5rN0pwdXIvQXN3d2k1?=
 =?utf-8?B?VXdHRnlEZ08wRzV1SkdZVUFmVE1wWUxCTVA1WnZJaXhHd05KSlFvK3JiNXh3?=
 =?utf-8?B?bEkrRnNjUitwSW1jdUVoRWhPMGNtREdvcTZSRnlUdmVhRFQ0L29HM28yck1v?=
 =?utf-8?B?V3FZNjJybVBkaTYwTUZVa0w0OStnMXY2ajArenl4ZmtqazBHendNM29MZE1y?=
 =?utf-8?B?SUc3clZpbFhwSXZ6SnBwRjNjaExiamR3TGZMY29kUlBkQktPenE1d1lRdVVD?=
 =?utf-8?B?bm9lZWkyRWdQaVQ1a0ZvQXI0d0FzdHlHbHgrSmJ6TXkyNkVvM1A2M1B6Y253?=
 =?utf-8?B?OXJYQ1liQitFOHVJUFJJNGNDN0R5T0djMitSR04ybnd5eXNIUDkzMkttSlky?=
 =?utf-8?B?ZkF5REJBaFpoOHhHOXJEelZTZERqRSsxN1pmeDh2U2ZQTGJEMGJKb2FQT3RW?=
 =?utf-8?B?L2lqYmlpVXBHRFkwUEVQdmxHdTJ5RGRuOHZTOVVLeUFQT2ZYVk9uLzZsMERX?=
 =?utf-8?B?SUJFMVNJelJteGNzdG4zamlLYTVwY3N4dnEwTGVGNW9aMEdIZUdPeVM2eXhi?=
 =?utf-8?B?Qk0xdzBJNVcxUXlXU0JSV2hEbWJoWi9SSG9hM054VlU4ZXNkRGp4TG9Dd1Nj?=
 =?utf-8?B?bUx3TEI4QWtaS1I3Y2hoZ0M0azJMbVdLOVhyZzVzY2poaUF3Z3h5TE8xNm5V?=
 =?utf-8?B?OWlROENhM0pvaXplcko4bEptUVlkSTVLTTBMbEVrQk1XQTRReEx5N01rcjhj?=
 =?utf-8?B?aG1VeVJlT1BBeTlIM2I4bHp3QVcwNjZUSnRXUDFLcEoxcUxyeXRseWNxNTB4?=
 =?utf-8?B?aXJFSkM1TGx2Z2ZNY2tieHdYVENmMGM1bExBUHNNNWowM2ozajF1SGJMQjFw?=
 =?utf-8?B?OGxVYm5pRXU1VjBiTFhMRkhJdldIa3ovMkdlZGNxcWo5eGxtUHphVGhjeTBU?=
 =?utf-8?B?clFRMHBnaWJFeW1UK3lnL1hXZ0hUNkJRSlQ0bktqRTNrYytjVmNlUHBhMjVV?=
 =?utf-8?B?cTd4b0VhRFE2RGVKSmtxQ0QrTHdWVGwzbHVnSXFNM0lYYnFlUEdnWUNVbXN3?=
 =?utf-8?B?dXJGVTRYeEpEVzlsUDU4MEtLM29OR0VwWnllelNGTVNCWElzK2dWM0ZDaHNx?=
 =?utf-8?B?MjMza3JDNmJqaUpuckU3aGR5NmgyNTdMWmF3TnNFdC80bTllUldyZFlyb0Qv?=
 =?utf-8?B?N3dDa3NNZ3Zwc09XenEzRWY2bUdiNzZXTkRJTXNoWE5OMHFvcFVBdEdrL1Q1?=
 =?utf-8?B?OVJxTEhuaVZLeTZJamNGZit3V09Ibnl3RTUyanJoSjRwLzFzd0pNRUNHVVA3?=
 =?utf-8?B?Z2lvbXM0dWpiOTZmekZTdDdHRkFjVHpQQ0xZZUN6YmZybUNBem1JZnhFUEFm?=
 =?utf-8?B?V2lVcy9QUUx0VTJqN0x1WUpBaFdmaVFwUmhTS1NpbXBjNGhWYnNPaXc3VmNw?=
 =?utf-8?B?SWtGUmJSOVl6aUw4dVYvcE9QdmxFYnJ0UUlaeDlIY1I3MDc5cTNyeUUzVDR2?=
 =?utf-8?Q?fgjt+0TAJzE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVh2emRyMms4SjUyK1I5S3loNkxtMUV1RzBkVmY0eElsRlpZbmVXRVYzN0M0?=
 =?utf-8?B?UEhTZ0p3MVRvYzNoSUMzMDhZMGUvd2JNMjljY2dGTkxnSW84QmNPT1lrSnAx?=
 =?utf-8?B?d2hRbFUxV3RnQXdKVk1oQTJ1a0NrdFZTS2VGKzNVL2FXTi9aeHFDWEVuNHNQ?=
 =?utf-8?B?K3VMd3FIRk0xTEtQcDdCanFwQU01b0ttcDdzUWZtZnVYNUY5bVFaMXp5WHFo?=
 =?utf-8?B?SllPZXFLM05QbmxpalJZSzMrMjk5U2tBZ0NmMU0rajg3YUdTVGM3R0NXKy84?=
 =?utf-8?B?Ym5rSThobFZodVNmQnFwSWEvdzlVaVVEdTVnaDhsbTJMQUVYdVRvQUlwL2xo?=
 =?utf-8?B?RGxacDViV1VhY2pTU0RMK2VpaGVpaUVuTHdRdXZSdWtMSWQvMEp5dlJNdW8v?=
 =?utf-8?B?d2hOS3dQUFY2WUJwelhPK243Tk9hU2FrR2VaZE8yM0RrN3pmblF6NVRNOHhj?=
 =?utf-8?B?NUxORnQ5WkNkTWZtSm9RVjdBeTFBS1N1ZGwvUVVObFpNNi9ZOTBmKzVXUk4v?=
 =?utf-8?B?UzFPMEFnbURJZ0lKRkVGQmJOMEJ0V3dTa3N0WkpYaTd5bUN6ZDZTUmZIeWJ0?=
 =?utf-8?B?Slh6M0dRbDZWWTZvbXFhVWN4QzNrODRveEpKNFZZZWNwcWpzRTduRDAreS9E?=
 =?utf-8?B?RmMrU1Q0Y0J5aXQ5MnZyZHRkRThySmh5SHRDOXJycXE3SFZNSVVIb0hOWGJX?=
 =?utf-8?B?dCtYUEdRUmxxc1dwdEdKdEp3YjBrYmcvOHJsRFNrSlFMU0xpc0NiaUVVdi9V?=
 =?utf-8?B?d0hxS0NyK1NHQU9kR0o1TnpHWG12OStJMWovQlArdDNtR0pBallKNGxZQktt?=
 =?utf-8?B?V3YrSmxZSllUYXJBb1JGWnFUVkp2T2xqYXhwUzRCeThPLzlVMDVQaDh3WU9P?=
 =?utf-8?B?R2tpT1J3YTdVUnFBZVgxS08vb1dUdURXdWY0SHpDZ3ZPUVAxbTdBL2RkNkRm?=
 =?utf-8?B?U2lycHlXSWFicVJHbERXRENZZU9xZmV5Mmt5R0lKeW4xODg5Ky82cXUzZkhW?=
 =?utf-8?B?M0hKeElZa0RTalRNNlBIK0hFL2QrQUhvRWR6MnFNMk5ZbVk4WWxKWGdNOXJ5?=
 =?utf-8?B?NU0xLzRMcXIyZFdDOHVxM1FtVDZNMVdsOWhjWkczWlFYVTR3Ujc0QzAxbjdT?=
 =?utf-8?B?NUsvVWc2OS9YVUJaOG1objMvbHlpc2kyMSs5QnVyZzBTSU5iNndBUzQ1NnR1?=
 =?utf-8?B?ZGRVdkVaa2tPTHNhaXRZNWZUSVhLdVp0UVRXYkp4NURpMFRxV2hLTXBTbFhX?=
 =?utf-8?B?bGI5Rk5rcm9QR1lwbkVjTUZnRmxZbzYyTUF2Y1l0QXdRNTRIbzQ3cmJsQ0hK?=
 =?utf-8?B?R2pHaGNQbkhrYWdmNVc0RXpROXBTVmFrN1ZPaElaai9pekxDMFFDekNiV2Nq?=
 =?utf-8?B?a20ydDZaRjFlV29HT0o5WFhqeE9xbTRJY0Vlc2ZoV3ZvQUtyWEhkaytPUVB3?=
 =?utf-8?B?eEZ0cjd4Y1A2dE9pN01MNHlLN0lubm1uSWZSUUJuNW5LRmQxSTh2ZXBEV1NF?=
 =?utf-8?B?SmM4UGoxRHlJRkI3V1JPVS9sNld3OHRybWs3S0RtUHZFZGs1ejhnNEVadFAy?=
 =?utf-8?B?ODFhMUg2REhoK1FzT004cGozTTBjamdIaXZUTXpEQ1QrMWxxN3A5NktkTlF5?=
 =?utf-8?B?YmgzVnNGcExSdkhUUElVY01CNWxPRUtlV2dFUllhdE9RZlBhM1V3VlFYMnVN?=
 =?utf-8?B?QkxINzlHWnhnQzl2dWppOXk0a3VHTW1hdU1ENFNMaHF4ejNUOVFzbHhEbmdl?=
 =?utf-8?B?cG5ENnorbEgxVHlHQ2tBZVRabUo1SHhZTGN1YXJxdHBndjZaSU9zZFJwV0lk?=
 =?utf-8?B?YmJwMW03VDdCcXZXTkdSTmtKTE5URWFPKzhneFZrRjgwLzFQNUVxUE9zTU1p?=
 =?utf-8?B?MkxocTgwVFppQ2R3ek9TMVNTMjIyQ3phelE2SHIvVXVtZGcxR09ScjdSa0NV?=
 =?utf-8?B?Q0wyVHd1azNLRlFmY3B1TW9GZVliak16WjgrK2RNQ3pCbTI5SHk5bElIb0sz?=
 =?utf-8?B?ZUNuaXkzTTl0a1h1cHRqNXk5bEs0djVaY0VqOVdaWVZCZnhDWEdxajhodTBX?=
 =?utf-8?B?bDZxNm1KcU5lWW4xUjdnUXlab1pEN1VCL2ZLVm1QY3ZoQ2p0QkNQZGVMaHBS?=
 =?utf-8?B?K0tjY2VLUmF5bDlVSURCNDFQMjFFd0RuK0gwenJuSk5LRDRtd29DN1MzNUd4?=
 =?utf-8?Q?LqEB/7N+a7/Xn3Vh4sGp1qyemQnHNsTvVlokh1kzbUXz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b059eed-095e-4992-2e6a-08ddef49cbb5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 02:37:18.7872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oBGKS7rjhp07i90xXRdRQvclFmJTW7JytSpKRHId+xhckCZmJmUNB2BIjX6JGCXncQYnWxJZ0HJWgARIzX70g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6286
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

On Tue Sep 9, 2025 at 2:16 AM JST, Joel Fernandes wrote:
> Hi Alex,
>
> On 9/7/2025 11:12 PM, Alexandre Courbot wrote:
>> On Thu Sep 4, 2025 at 6:54 AM JST, Joel Fernandes wrote:
>>> The bitfield-specific into new macro. This will be used to define
>>> structs with bitfields, similar to C language.
>>>
>>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>>> ---
>>>  drivers/gpu/nova-core/bitstruct.rs   | 271 +++++++++++++++++++++++++++
>>>  drivers/gpu/nova-core/nova_core.rs   |   3 +
>>>  drivers/gpu/nova-core/regs/macros.rs | 247 +-----------------------
>>>  3 files changed, 282 insertions(+), 239 deletions(-)
>>>  create mode 100644 drivers/gpu/nova-core/bitstruct.rs
>>>
>>> diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core=
/bitstruct.rs
>>> new file mode 100644
>>> index 000000000000..1dd9edab7d07
>>> --- /dev/null
>>> +++ b/drivers/gpu/nova-core/bitstruct.rs
>>> @@ -0,0 +1,271 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +//
>>> +// bitstruct.rs =E2=80=94 Bitfield library for Rust structures
>>> +//
>>> +// A library that provides support for defining bit fields in Rust
>>> +// structures. Also used from things that need bitfields like register=
 macro.
>>> +///
>>> +/// # Syntax
>>> +///
>>> +/// ```rust
>>> +/// bitstruct! {
>>> +///     struct ControlReg {
>>=20
>> The `struct` naming here looks a bit confusing to me - as of this patch,
>> this is a u32, right? And eventually these types will be limited to prim=
itive types,
>> so why not just `ControlReg: u32 {` ?
>
> This is done in a later patch. This patch is only code movement, in later=
 patch
> we add precisely the syntax you're describing when we add storage types, =
and
> update the register! macro. In this patch bitstruct is only u32.

My point was, is the `struct` keyword needed at all? Isn't it a bit
confusing since these types are technically not Rust structs?

I agree the `: u32` can be introduced later, the original `register!`
macro did not specify any type information so there is indeed no reason
to add it in this patch.

>
>>=20
>>> +///         3:0       mode        as u8 ?=3D> Mode;
>>> +///         7:4       state       as u8 =3D> State;
>>> +///     }
>>> +/// }
>>> +/// ```
>>=20
>> As this will move to the kernel crate, it is particularly important to
>> make sure that this example can compile and run - so please provide
>> simple definitions for `Mode` and `State` to make sure the kunit tests
>> will pass after patch 4 (in the current state I'm pretty sure they won't=
).
>
> Good catch. This will blow up the example though. I will change it to no_=
run
> like the register! macro did if that's Ok.

If you reduce `State` to 1 bit and change its type to `bool`, and limit
`Mode` to two or three variants, the example should remain short. I
think it is valuable to provide a complete working example here as the
syntax is not obvious at first sight.
