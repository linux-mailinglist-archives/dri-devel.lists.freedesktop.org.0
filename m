Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFJwFynpb2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9E84B994
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5CE10E693;
	Tue, 20 Jan 2026 20:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xvlz2wRQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012000.outbound.protection.outlook.com
 [40.107.200.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED0C10E225;
 Tue, 20 Jan 2026 20:44:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aV5bKx+x6U8EllYwf/hEka8agksGrmaeh92LgOtN/NWyHl2z2jdsfRNRm6ukR7BJL8gtoK8Vx+YrjSvuXrxIoX/MuxBYhBB+QHofliqJE6NHbHoaaBQMEZDqDA0ZdQ4DPL5Ykfz7iEeZFOX5OqlkFvl6iyB8hSy5osStVYFkrr0IlKtN8sirtTGGCqgYHrRfuGKnM1YsCDr6RpHWt7bSUS1OX+WfrlzmOHBPnovVX3MmjXAcApItNcCbkJOd95xMYQQw8r3Wiq9MObIvpD5yNyAxNXE6CvP3CZZCPDruxQEEMJHyXuNDDXg3GoEKwkb4MXwmGLht6cFwGxxU5ewHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44qTBUt9Cx8uYWv4QLH+KpMP1qQDvX/8gMFkojo8AJc=;
 b=k76VQ8Pz7ZxJrH4DD85ZcA82BFgUw6V5VYhUgCBTd/NdDoZnRxQua+Tru1kO0t5L1Axy4cuyc+kYOv/5VaY9IHpmOYQW4nzgRovF8CdSw1gGq13MfQ87h0P3P2zcVkBNxCMy/uALVzxiLhuYNfo+ZZgrzhxCW/v70tUCNFd6VgtYKbEqOMz0MmyarzJDB4vDTDU57Ij6A1/rh4eLBlDD6b5solZwk+3JXrdYdkvCeKGhmpvnzUJSCUq5NUDg9sMOfiIs46YFhd1Z3/AY1NaJdmhW35bAHi/fUn8+A/WGYGS+YUMJM2kR1UgmhRaZkUubJ4UNFz1wVgbbL2beHaiYAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44qTBUt9Cx8uYWv4QLH+KpMP1qQDvX/8gMFkojo8AJc=;
 b=Xvlz2wRQb6ZoGqodTpDYi3N8IMSMW3IWCEEB9txY1MHphnTKjqDCl7aqIQsogLNm4Rwg1Z6uhXMP0HpEHlbGaB3VFOrPI0UCDIuX0dwQbIW6Y4FfVEBkSDXD3eJerRzueGWSu10T2rQC8Nrv7F+9/HRaol8VAnNcM6H5Sru4hvyeCxvbqMOMUF+ElkXF4tdRhtYK2CD4bL+RweNgycVFpcosnJzHV+W+ln50Y8hvCcrrLcBJjrihvX5hFDnqwmWGasUxcr8gEZzTC3vMFSrIeK+0Rc0+kzH6cb3haWeS4emGz6nJShANWNTlvuBAkjus9lgEK1VP7IatnC+Erx/0TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 20:44:08 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:44:07 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH RFC v6 09/26] nova-core: mm: Add common memory management types
Date: Tue, 20 Jan 2026 15:42:46 -0500
Message-Id: <20260120204303.3229303-10-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR14CA0017.namprd14.prod.outlook.com
 (2603:10b6:208:23e::22) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: a5a8239d-75da-4005-e4e9-08de5864a7e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NfOJqJNtTiyvlDrvdaLNsso4lR9cvHtX/ouzgsQjcbZoxeYnxQWxMFCqjIpZ?=
 =?us-ascii?Q?Y4X7TB0nD6EfjDr3RuzGSHJAcNnZSsvE1eaPEFTw2MFK2S8w8JOwoMz3wU/j?=
 =?us-ascii?Q?FcIGHpmga7HAwW8gMo5hbXtPXY0lRrnNg/mvEyXU7lf74k9dguxFQ8dSXR0D?=
 =?us-ascii?Q?YTbsDfORhhUuEjtBR0iFwROXf1zMM60XcG28Iqz2huVb/H55SxceOoEHcyHi?=
 =?us-ascii?Q?JrFlqYUpdyc6kPILV9YaFayi/J1bcmjONZVXnpH9ZDx6MdOrUfZqUUFQJfEF?=
 =?us-ascii?Q?SeNlA561RVMINjSHX1hCh6qFecAUQBPXcdKOw3M7ro01qJvqaVofV2u9REIm?=
 =?us-ascii?Q?c2zKfvO3biwQTGWvRmCW22t6SRr7Z26zzt8suOBCxR8Q1rbImFB+uJe3ZC4c?=
 =?us-ascii?Q?IpbGuqEHuvb9PSRUNyP9k6Hn7JozUdg7NFJBGBLm04ESiG7aDl4pKJcv/AO5?=
 =?us-ascii?Q?d0PwfTiRq/n/R21hPix4PoLiI3DC02iN/3qqTZNlGqPaGWSc5OBdLY+aKRre?=
 =?us-ascii?Q?lsFz0liOtdl6Kf9ykaD+gKAFXZCLRSIRaNnAD5skcgHhUTqyPX938uTNvS2D?=
 =?us-ascii?Q?rjB15rCCBkumNFwpNnyNAaDLyXBms2gJ7cH2MFPe+z6Felf0/fHVddOLEFiI?=
 =?us-ascii?Q?3+wLG9fymJXTHohz76JYXqU042HsWH21uOO857slDmNo8GiWzaof2fp84KaP?=
 =?us-ascii?Q?AQrF7acc6xlTEkVv4Go+hX86cfCES2ihmf3u22zVyoqXfKKUm5dbNsheBFQp?=
 =?us-ascii?Q?lSjJcunkPJQzChJqE0BefobAnX8VKP94uk0f+4HD9kCRxzWyj4ygE1Gps+vk?=
 =?us-ascii?Q?8Vbpceu7tUH/tH6bgKeQ/Ikk7hyjR5pLlHfBlAlJyKD6AHmW9n1YTtLiaw5F?=
 =?us-ascii?Q?psYLagpYOO4vufcj4pMJWnlz9/lxluqm6Lu85gDyESYfFpPPbOnHfd/x2dHy?=
 =?us-ascii?Q?HliOp51SRSdHqsYJW4VuLXLnJfAw9OT4rUW0aBTOwQYQQmbzZY4D5jxZFAfS?=
 =?us-ascii?Q?YDCqeG6lVuOY50nNlhvEUuv8T4PnIcs2mhQP0NyaRaBKnOaphJKGJaO9RxbJ?=
 =?us-ascii?Q?4zC+tTbf8MmValuI5rngEiug7g/q02QTor+vUzKjkxel+dYw4sAKVBXZgSuz?=
 =?us-ascii?Q?tr5KpwQxvyhOL0litMsXODVTf/GBSa4CmbSKVu7kY4lrj7SSgjoEGpM5csvb?=
 =?us-ascii?Q?FNBsLxNWKk1Iv/P85b+/VfenQ0JWg9LMMAB+YpznshMcCIVNwTR6badyPGdC?=
 =?us-ascii?Q?Qs5qDajH/Z58123EafBtEoKRZlzj6xYmGY/jhl2AU5JO3umJd2fd8tlcT7SW?=
 =?us-ascii?Q?dWkvLUsI7ShRbfrIQSvaUWa5WuwVUUlXksb2dxvGibgEa60EIyQMf+nShve3?=
 =?us-ascii?Q?r3I0FGJ6nMOF7cHHrspl8wkdazgfu+BoqP2gqNsfuSdfCkuNWDS4oGd0M52x?=
 =?us-ascii?Q?M4W52M7cxnpFBjRfm4XpsGbXuDYLgJofiDptClB5qJvJRPNUM5/BLUD18NII?=
 =?us-ascii?Q?VAw4jlRsXRHELm6ahsLbeLr3w4tnTWS4Dn2Vj5rHxf6VWIu5vSXq3+IURUua?=
 =?us-ascii?Q?FzNQT8VnnnD7simzBN0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8fwn+V9kaX9F/ObJFvE6WGKFWv2VuYSUtxklaBwlX/HgSfNazz9BVOshCocZ?=
 =?us-ascii?Q?tWOWmSIfsxj76JCAUJKnzigoK4iP5CAHD4LBNinVqYrmJ7lrldZPmoZ9YdEg?=
 =?us-ascii?Q?TJAQtcrxC3+OFICMP9H+jhHpJh5Ks/NwwJ+zALeNv7B1pEkPeUzmZMJvmlXU?=
 =?us-ascii?Q?lOrxhPmpyhkxwkfQqeOfEbVX5VhkjwMLcgcKxhDsyu3rEYYbobVqC6tKvsMM?=
 =?us-ascii?Q?bIP7FarRgmISbaqugPWn2Vsp3s8crO3VTQEd3rq6NoalIbZqUaS7OQmcrYt2?=
 =?us-ascii?Q?JafCr+d6Rx6DZezVE7BFLFHaPjYvtEyOzt9K16ONBL92vHeg2QM752lB9XHe?=
 =?us-ascii?Q?RVj9DY5QJ0KKPUN37fRzbEoJ1ast9APvi/BG/b16x3FJCFpT5z0JQIewTcqi?=
 =?us-ascii?Q?eQ4xOYsMV5JAkSSPx2+MudSeo+CqqKWobxqyVn93uiR/pWlD4U9S4AB2Y3xZ?=
 =?us-ascii?Q?p47iqq2QUFv1w1MfWPXs3Pg1ChuwHPyLTDsmzsD0Cu3I305zFKJLn21VjCpc?=
 =?us-ascii?Q?ybC3S9OTvckzS8LAT9pYi6TcQFdjqkzgo0YjnYmM3RMEK+l9tgC1LgHo2I0v?=
 =?us-ascii?Q?okoEnJireXmm4F5bO0JSgzX+Mpsj0rujb3Q6wuG2ErZWUUVpD8isVCVEYfJB?=
 =?us-ascii?Q?ZgB/u9YUMe1mADll4Cs4qAuO/1BngU9aj8fwH6Q8l56Z1cSGmSANp++iLS7l?=
 =?us-ascii?Q?NYASo3LbebM3hS57RvJRx2Z5s0C8s2ejg7sqGV20qTI7JT64U1PpULGQZZBx?=
 =?us-ascii?Q?UHsw4g6LkNvIzgSP3JGtiMH15LgoXD/Pm+Q9pMcLEDyrPiFWM7plMKKdIHJ+?=
 =?us-ascii?Q?riy040KuQmSt75m/4mJuU9fqFdCPS6Ox3OBMb7Ued2A7eAGQRFd76ryWROUS?=
 =?us-ascii?Q?DsnCFbtMqdwTHbHfhm0Je1OEE3NsvQapG21d107C5xD+e8wvLh+S6Vr8CrkS?=
 =?us-ascii?Q?NLIJXkvYPKtqZ8Mt1QIAaNWvVxGXpmJOGmihljZPt5gueJkC5Dz4HRn4/c8Y?=
 =?us-ascii?Q?Zsm9RiA7vjUtaHCEc9oZ2Ueg6h9n0uN3N4/YYxGyNVFmr8GunE482I73kvoM?=
 =?us-ascii?Q?fKEBfp5bAEqZ50LPNlrBwp48IYDDPmyR7pWbH7jp6ftpVf+wp/PsV/lY8ytk?=
 =?us-ascii?Q?QOi6kKHdrG1Z7FieOIpaRBNEOhmljsu6kSIx2VEWsGAlZDAyZ7T8DqA30Moq?=
 =?us-ascii?Q?UEV03MI5mnLmb6ndywFTkQk5mDZkrJENf6DDpYfXmwBw0UauBfTNidfTdqDt?=
 =?us-ascii?Q?3Gu2tRJvgynoDjclNJqIeMcW2p8pPKRKh52q0IVfdHSotdq8jgPVkXln/wln?=
 =?us-ascii?Q?FB54hpkmuPcj+VqlKdN8eX6oaSF18HppTPRabumCGfPbx5mZBIrBKqhu2vR4?=
 =?us-ascii?Q?gbsgXHZtxaL2NKi94O9c8TvKgdE/xW3n9yfhY+SnFTfgJgHvo3lHITjAInRM?=
 =?us-ascii?Q?0RWAqSWkI22WDai3OI056ZXq4XH5Dk5jBBLUkg46R2kYkFCnjPSR1O8plv9T?=
 =?us-ascii?Q?7Eje8J/pp0LwGiJsdhqLC6GbovC4Y0HcvEwINCK5jq0ICu9TLNpQXOVTuoJ1?=
 =?us-ascii?Q?brN2alrZk+S4MSruoDVcLfMNPcdtMhdcWkiAmy4OAbCeY9nVISFUlnRK0M2Z?=
 =?us-ascii?Q?sYV6kEN4SMhbLUZqO6F8PTYYqfPZSYTI9pF1v+RmYMJ0wDjLDWXZUq0/xraq?=
 =?us-ascii?Q?rN+dW7FzwoFTuhdpZl5+BC9hfrgkR6t2DI9GmBgPr7qbwRcjkffirwLqsK02?=
 =?us-ascii?Q?NJ3v9Wwpxw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a8239d-75da-4005-e4e9-08de5864a7e0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:07.1485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s5bIZ3UwQTeShk3O1acIcn66p5kkwcb3C1V+yFL1ZjDDW5vm74qWFOkpkuwPO0oZb+Sih1gYu02/TWV5QEzVXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6809
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 0E9E84B994
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add foundational types for GPU memory management. These types are used
throughout the nova memory management subsystem for page table
operations, address translation, and memory allocation.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/mod.rs | 147 ++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
index 7a5dd4220c67..b57016d453ce 100644
--- a/drivers/gpu/nova-core/mm/mod.rs
+++ b/drivers/gpu/nova-core/mm/mod.rs
@@ -2,4 +2,151 @@
 
 //! Memory management subsystems for nova-core.
 
+#![expect(dead_code)]
+
 pub(crate) mod pramin;
+
+use kernel::sizes::SZ_4K;
+
+/// Page size in bytes (4 KiB).
+pub(crate) const PAGE_SIZE: usize = SZ_4K;
+
+bitfield! {
+    pub(crate) struct VramAddress(u64), "Physical VRAM address in GPU video memory" {
+        11:0    offset          as u64, "Offset within 4KB page";
+        63:12   frame_number    as u64 => Pfn, "Physical frame number";
+    }
+}
+
+impl VramAddress {
+    /// Create a new VRAM address from a raw value.
+    pub(crate) const fn new(addr: u64) -> Self {
+        Self(addr)
+    }
+
+    /// Get the raw address value as `usize` (useful for MMIO offsets).
+    pub(crate) const fn raw(&self) -> usize {
+        self.0 as usize
+    }
+
+    /// Get the raw address value as `u64`.
+    pub(crate) const fn raw_u64(&self) -> u64 {
+        self.0
+    }
+}
+
+impl From<Pfn> for VramAddress {
+    fn from(pfn: Pfn) -> Self {
+        Self::default().set_frame_number(pfn)
+    }
+}
+
+bitfield! {
+    pub(crate) struct VirtualAddress(u64), "Virtual address in GPU address space" {
+        11:0    offset          as u64, "Offset within 4KB page";
+        20:12   l4_index        as u64, "Level 4 index (PTE)";
+        29:21   l3_index        as u64, "Level 3 index (Dual PDE)";
+        38:30   l2_index        as u64, "Level 2 index";
+        47:39   l1_index        as u64, "Level 1 index";
+        56:48   l0_index        as u64, "Level 0 index (PDB)";
+        63:12   frame_number    as u64 => Vfn, "Virtual frame number";
+    }
+}
+
+impl VirtualAddress {
+    /// Create a new virtual address from a raw value.
+    #[expect(dead_code)]
+    pub(crate) const fn new(addr: u64) -> Self {
+        Self(addr)
+    }
+
+    /// Get the page table index for a given level.
+    pub(crate) fn level_index(&self, level: u64) -> u64 {
+        match level {
+            0 => self.l0_index(),
+            1 => self.l1_index(),
+            2 => self.l2_index(),
+            3 => self.l3_index(),
+            4 => self.l4_index(),
+            _ => 0,
+        }
+    }
+}
+
+impl From<Vfn> for VirtualAddress {
+    fn from(vfn: Vfn) -> Self {
+        Self::default().set_frame_number(vfn)
+    }
+}
+
+/// Physical Frame Number.
+///
+/// Represents a physical page in VRAM.
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+pub(crate) struct Pfn(u64);
+
+impl Pfn {
+    /// Create a new PFN from a frame number.
+    pub(crate) const fn new(frame_number: u64) -> Self {
+        Self(frame_number)
+    }
+
+    /// Get the raw frame number.
+    pub(crate) const fn raw(self) -> u64 {
+        self.0
+    }
+}
+
+impl From<VramAddress> for Pfn {
+    fn from(addr: VramAddress) -> Self {
+        addr.frame_number()
+    }
+}
+
+impl From<u64> for Pfn {
+    fn from(val: u64) -> Self {
+        Self(val)
+    }
+}
+
+impl From<Pfn> for u64 {
+    fn from(pfn: Pfn) -> Self {
+        pfn.0
+    }
+}
+
+/// Virtual Frame Number.
+///
+/// Represents a virtual page in GPU address space.
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+pub(crate) struct Vfn(u64);
+
+impl Vfn {
+    /// Create a new VFN from a frame number.
+    pub(crate) const fn new(frame_number: u64) -> Self {
+        Self(frame_number)
+    }
+
+    /// Get the raw frame number.
+    pub(crate) const fn raw(self) -> u64 {
+        self.0
+    }
+}
+
+impl From<VirtualAddress> for Vfn {
+    fn from(addr: VirtualAddress) -> Self {
+        addr.frame_number()
+    }
+}
+
+impl From<u64> for Vfn {
+    fn from(val: u64) -> Self {
+        Self(val)
+    }
+}
+
+impl From<Vfn> for u64 {
+    fn from(vfn: Vfn) -> Self {
+        vfn.0
+    }
+}
-- 
2.34.1

