Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B89FC46E9A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2662D10E3A3;
	Mon, 10 Nov 2025 13:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ums3ohJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011023.outbound.protection.outlook.com [40.107.208.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D784810E397;
 Mon, 10 Nov 2025 13:34:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUwAliz70BF3V/EYfE4xsyQkpF1nV+mENQSrA5sSyujYtqSY/rDCdmqoR+tm2LtoNKjXczLm78pGkeAxXONpLUA7gQwuwNnYuc6OryC4ThgDPgh4Z85hMXs21oiy7KnYRkiEnGOB3CQaP5LqwOfRdx/EDbAg0eot/9YR2r8qqON/kIhYRW4260hYpAree3J3hvks+Yj+UZrv6NfHvb2nNJGR/T0deIGhB6NLDR32QEik1nX3agHIRQpplHC32p8wpjB60kkZlrWiC/MKZiJAG3fyG7ZcDaAv+WLm8ZdUV4sxFPg5lLCZx52gg8yj9+P72S5xX7h/KhxBB6g5yEl09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KAmJ/T81yk4Z1Xf0pHsuk+ezYPyAOmE1I30zFSlO+k=;
 b=i+fzcN6CcVSTBHj82LuiHWLK9LC3qQq9rOwr0gjwkIa2POmH73I+loueTba4S/EeIUP1VdafqsdXNR9kfWM5WUgYUbPw3jWhEDUoM3KAls4up7gwrgU9te70S3GBrPH2kvcktNu38ZaYKndP+HxTBgPUho+UBH9yQL9Dp0Pbgn2CwGW7vHIpWGr3RL+krImxb/w88/1n5iwCTmIoFeSVxgovoqblVwpfokPSS3kB4Jnh9Cv4/aWPhJGdGv4IwMB9BMbgnmya7Rk089WBslIe+jTo4FQGbdGc/LlE/lwSTBnq/gERrvAvY1+Lhl9tBzWeDIQWaHsL3zWjBle0ij55oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KAmJ/T81yk4Z1Xf0pHsuk+ezYPyAOmE1I30zFSlO+k=;
 b=Ums3ohJglSH07Iu0DMBWEfXd3DmtjVijnyai/h4X8jFnGSEKbbTEIltR9MKHx2HYoaQkEzH2heVnswS73fFatBc6mJd6F1NSDXasstPQwA9dG+ZiDAZ4y9vh/Tpejbc9HWmzO6L3jI61bM6++bxB14afkTz5oHI3UJM4zg3yWkmvWV60j81QCaz81tRtzzv7CfsIc7fQTZmY+gprsBvAeVDNWvqsvQRkJNAJv1xce3GhiEXvgi/Y4o42/3z1bELVgymizck4dljEcQbSp8uUr4um6cmNlRuMiBZpcP0S8TOaDIy24uaA180TqpRjh+0dCSVUQ+WVi5OFAzMHvjTGpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:34:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:34:23 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 10 Nov 2025 22:34:09 +0900
Subject: [PATCH v9 01/15] gpu: nova-core: compute layout of more
 framebuffer regions required for GSP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-gsp_boot-v9-1-8ae4058e3c0e@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0128.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 92bc884d-e100-442a-0a9a-08de205ddc42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkJSdzUvMHFsQ0g0U0dUMXlPdmFCdEdhWnB2Z1pyQkZIdzltRVE5S1BkUGM4?=
 =?utf-8?B?cU56UkdtbVY1M1VTdS9OM0l0T2p3eitycVduNDBGcE1ydUR1bE5ZRjdnSm1n?=
 =?utf-8?B?ZVpmdHI0V0JPRDhJVHV2a2orTDFGdHlrM0dxY01nSDNoTHhPSG8wUWxYcmsv?=
 =?utf-8?B?QXFzU0VDSWdRYmdhL0dqa2hqSVE1Q3JuZDFpNUdDcjZuZkZhditoRnMwUDZl?=
 =?utf-8?B?VXZaOVJRSnRHb1NUVFFMSUtTVlpoUWlMRGxNZlk2VElRcTVQYngrZ3lVdWFt?=
 =?utf-8?B?d3VLSVgwdk1aMHUrVDY0VHp0bXJycTE0YVd5KzA3T1BvV2xVWDJCWnc0NFJK?=
 =?utf-8?B?K2tyeDlxU0xnRnBENFgzRTdUUFJMeTErSkFLdHRVemprOHYwT2V5blFHdGhX?=
 =?utf-8?B?aWtWMzhqVk44dmFOR0prUnprWXFpanZ3cmdvTnl0c0llN0VjaytrUzI3QWtD?=
 =?utf-8?B?SEoxMGpqSkZJaTRvZnlNNjZsN0d3WjBmeVBFbFdCTEdwTTd6emhmc2Q3dlRz?=
 =?utf-8?B?UDFRV0xUM0RXWi8vdDF6MDVUTlczbWdTUGxQLy94UzFQSFVpcnFjZ1VSdEJy?=
 =?utf-8?B?NnFPS1NUekx3SmRIcFBHSVBHaG1XeVk5T1pTTGJQdFVtVFNKdmtxU05vVWRt?=
 =?utf-8?B?Z1VRczBEK2lMb1hDNkZBSDZsRHJyeTBSa2I5OEEvendMM0JLMjVqRWd4VTFW?=
 =?utf-8?B?RHJmUFYrKzRWckVZbFo5OG82SGRYWHdOemxGK0YwQXUyYk9Pb2ROeGJNNUl2?=
 =?utf-8?B?TDNqU1NiNnFjNWtiZ0pUeHRTb1dWYXJOR0NzclNUY3p4NDMxdVVUV1ZxTmFF?=
 =?utf-8?B?d0dLdkNlOTVLRElVdDViQnhoS3VaRzRNdGllUVdsUkQ4Sjk1dXdpVWN6NDFD?=
 =?utf-8?B?cytwV2F6NnluSFNrQU0rM2d4d1J6N1htN3dUbU9JbGFFTXBJS0hVM1hGSFla?=
 =?utf-8?B?ZTJ4STlqVVdUS3c4RkpCSFdSWEF1dFRTMlZMeUI1RGxocnNYT3pBUlhnR3Fi?=
 =?utf-8?B?M1RFMnRzQXlYRVdZSCtoUXcvZFpXOHdUazNMZTlhNGRoNFpKallySGNlTUM1?=
 =?utf-8?B?YWRDcWoxc0RkUXZLTGRseWlEWjZYVHJVQjdsRWI0T1dtU1NuSGtKeVRuQy9B?=
 =?utf-8?B?aFBEVGtGV2s3RWdvOGc1SHVnM0xtYjFZdkJnWmdsRlkvUTV5c0VYbEtQRDNj?=
 =?utf-8?B?T1E0bG9iWTFkcDVZOStJRFJPckZSMngxU00zSVF1S2dudDg4YlNFTmNPYzNi?=
 =?utf-8?B?WHgwUnpJSG4wV1d5ZTg2aEdHQWRVOGNjWlQ1TkVWT0FJN0dCQlY1c1RIckdI?=
 =?utf-8?B?U0pmYWZDdFllNmsxMnFiL24yaWM2UXluZmxJdzdObzR1SGRRTlp3Qmw3RHZ3?=
 =?utf-8?B?Sm1XajIvajY2NDBwNzhueFRVQ0xkQSs2K2xwUFZkb3Z1NG1IYmE0OXR6RU1W?=
 =?utf-8?B?VVFPY245a1VBcms1RHVoQ0VxMk5vU29IZEY1Q3R3TWpZck91b3NXbUVWM0l4?=
 =?utf-8?B?SG1CSVF0K2ZOcXVUUXZIUEdtWDZuU1Jlb1A4b0IzdksvU2U0Qjl0bXlHYkg1?=
 =?utf-8?B?c3oxbWl3V2M3cFcwK0FVTVVzdnVkU2VnN01aSEFlWEMvWTUvcUhnTDBSZWU4?=
 =?utf-8?B?emVIVmloM2ZSSndTZUtIT2M0YmNpK1JyZURGUVQ4V2xxRUNYYWx5cytneEQv?=
 =?utf-8?B?b0RrVjd0L0MwRWVQbWk4bWNCTG5oUm53dEVZVXBnQlU2TUhLRGNuTnhqRVJm?=
 =?utf-8?B?RWZhYmhNMVEzVmZQaG9UNU1GaDE5RVByOFBxK1IzYjJoNkMrSnlYQWZxZHMz?=
 =?utf-8?B?c3VlV0kyZE9GOTN6Z0F2NUlGOTNqK3FuRmZsdTZoRysxdGRLcWVveS9scUtt?=
 =?utf-8?B?QlBCNFprM0IwV1FlUGlUeDZacjVSUmFGVDlCTjNqV1p6ZFVFaVVmaXhoS3N3?=
 =?utf-8?B?UFhjclU1dk85VUVwWDZaTndhOVJjKzUvVHhUc1plK3ZxaW54MXcwdjFsc1VW?=
 =?utf-8?Q?2H9/kCUOjAIqWV0r8H2aqiyOziIdTU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjB6NGZTeW1nTnA0VDBjUVd1UHdmbzljUVpiMG9VOWs2WFl5R0N2a2hlK3My?=
 =?utf-8?B?N2MwM3pmdENJMFBubEZ1VnUvZHlSUE1WUmZqSkR4Sm9rcDZwYXI3ZTNVc25P?=
 =?utf-8?B?dGdrWlRsVlRrYy9nU1lvdHN3Szc1VzRRcHVYS05VZ3JXWC96R1VNcTVaRUxq?=
 =?utf-8?B?TnpPQlVmUFMvZCtaeXE2UEY0ZG9DNGJXVGVxUzlINVN0cGo3UDZCMXBRTUJN?=
 =?utf-8?B?ZUR1dkprcDNZTFh1ZDltMys1bkU2OUw0NHpLK3lxL3d4cm55ZVlLVDkraXZZ?=
 =?utf-8?B?cHFUcXJoK3RrejVXRjVrSXRsZ0FSWGJwamF0UFdpcWs4TlFOYnNPbVlCTjh5?=
 =?utf-8?B?dkZVeWQ5V0JMaU5nRUlCckpmcHc5MHF4L1NkZksvdHovRGFFajAxSjd5SGJ4?=
 =?utf-8?B?cFVsdndBZjFsVzRlMzN4WDU1VFNkdWtXY2pNTi9Jamt0UGgrMVgzTnJudFd3?=
 =?utf-8?B?Rmw3NjdPVUkrZWJROFY0b2p1N29uejF4ZWlPTER0bmZFQldhQzlIQ2thZEZL?=
 =?utf-8?B?RDIrM1owYjE3VmRoWjdjZzNzZC9Pb041M3ArTWNqZnRyMmVPOS9RUm4yVExX?=
 =?utf-8?B?K1dQZ2ZFdnFwZ2JjVWRYd1h1S01NVUdjaThFMTJPSGdDTEY4ajVRT3c2V1c1?=
 =?utf-8?B?MXp2bUtEQko5MkMyZEphVXowUE00bis0NGhkZGZyVWVKaXIyZUJoMmU2czZj?=
 =?utf-8?B?cnRnRGJjTEtjZm5ZS0ZwTGhLTjBWdzgwWEt5QUZUY3p0K0J4bmc4aTgrT3Bx?=
 =?utf-8?B?K1NCd3pGTk9hZUZab3V5VWZlZTdyUHV0RGlETEt3Z3J1NWpUK2dIQWJkVElO?=
 =?utf-8?B?TWlURkpDZ3hRWWtyVk5rTVZmamU3L1lzbDZhbDh5QnZydVFpU0NjbGRoMTI1?=
 =?utf-8?B?a3I3SEE1SGhXbHBxcm9kbFJ4MXNrb1FKeVJURkoyVTkrVEhPeExBbFJiSjlp?=
 =?utf-8?B?SXZtYVNTWTZWNTZkYzUxWER0NUhUalFMNUxnOFQxek8rWkdCdXdmNkdNNzBJ?=
 =?utf-8?B?bmxiRmdNS1l6cC9XcldleEV4emxNZzNxQ2FCcDZLWDIxS1hOWDgrUmJkUG8y?=
 =?utf-8?B?NFNwbzJUMVVBdnM0MTI3NTZYeW1YN3FjcS9rVHFZcnltWXJaZGFWSlB0d0pL?=
 =?utf-8?B?bDJzSk9MMzUzaXNDZSt0RUxSYXJWTG85NkR4akFGMGFyUXVwZnhHNUFZTUdS?=
 =?utf-8?B?NjB5ODFpbmtRb2ltbmR0M09QTDVOWTJYeTZtRWxoUGJnMnZTSllnQVEwQmM2?=
 =?utf-8?B?RGtPdmttZTJIMzFGMFFUOTJ2aDB1ZU80Q214SGtYenJYaERIZ21OT1FsMTBj?=
 =?utf-8?B?V0hodnRuRURFSEpjSmpDZE1lbFlvK2lGai9zQ283Z0NhVG92QnljSnZDcnlx?=
 =?utf-8?B?akZvUXB5Zis3bUpOWWdlL1kvbThIY1k0YXZBTk5lY2trOEdMSjE2UVBUcjlE?=
 =?utf-8?B?bXdVczB4VUM1eEV4OCtyTEtDbzFiaVBGOE9mVVR3cEhLZWtmOWlsWDFJcEdt?=
 =?utf-8?B?MUpDV1FnQ0wyWS9GR3ExbnZwSytialJ1bjdUeTVmSU1VLzhOdmZ3RkhEbnJP?=
 =?utf-8?B?KzBHQ1R0Q0JYZk4wMlR3ci9IRHhTYk13T0VDdGdmMjNKLzl1cEtWYkt6VTNl?=
 =?utf-8?B?K2tpUUpZRUdyNitsTGMweEZRZHdIR29PbWRpUG1ZK2ZtUFZBN3FNTEZrN0Nv?=
 =?utf-8?B?QUNFemhCOVVqVDZ2OUpVTlB3bFoyWWVCNkU5dW1NRDRjVU9oeUpYUXhXdmpK?=
 =?utf-8?B?WWFOOVFjT3FQMENKUjdvY21ueTBReGhYSXRjeXdNWmVOc1VZWDRzbGNETFVB?=
 =?utf-8?B?akxmaHlvMmFMTmEzZ0loTFI5Z3pSMnZTbUVaMi9BQ2N3Qzd1cWNUR2EzMjRu?=
 =?utf-8?B?VVJzVmRFL1laS1FacUZIejVPN3YySEY1K1hqT0hERUxpZFAybGlnUXlISVor?=
 =?utf-8?B?VDRDWk5NUFRmZFIxQTBGNWdqZjRkRlI0WEJ5eW9NbFZiUlRDaTF5TTFGWWMw?=
 =?utf-8?B?N3BIczBEQ3V4MVNEV0tSYS8raHBKRmF3N0NDZktLR1NyTGZyWlBvUFFVZDMz?=
 =?utf-8?B?ck8yV0VZclUyWUhLeVBGZ2pSNGpCcFdBVDNhYTBYUE1qamdJUzVkTFRUOFJZ?=
 =?utf-8?B?VzA0S2JOb29HRVdKNTRQSUhCajhET0ZxMDZESDRreXRTUWxNbjEwN2ppRS9l?=
 =?utf-8?Q?SZpbey4grUlcwgVXequSsHyPIpP52io/1DvgUloNppfR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92bc884d-e100-442a-0a9a-08de205ddc42
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:34:23.5416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VONu4BBTd+SrD0Mlt0M9O+oc4jCkrINM3auoO2MMysIFYBpXdDJsIKNzahEqZP3/gwqszlYFeYi4wYVpVWvWxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784
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

Compute more of the required FB layout information to boot the GSP
firmware.

This information is dependent on the firmware itself, so first we need
to import and abstract the required firmware bindings in the `nvfw`
module.

Then, a new FB HAL method is introduced in `fb::hal` that uses these
bindings and hardware information to compute the correct layout
information.

This information is then used in `fb` and the result made visible in
`FbLayout`.

These 3 things are grouped into the same patch to avoid lots of unused
warnings that would be tedious to work around. As they happen in
different files, they should not be too difficult to track separately.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs                       |  71 +++++++++++-
 drivers/gpu/nova-core/firmware/gsp.rs             |   4 +-
 drivers/gpu/nova-core/firmware/riscv.rs           |   2 +-
 drivers/gpu/nova-core/gsp.rs                      |   5 +
 drivers/gpu/nova-core/gsp/boot.rs                 |   4 +-
 drivers/gpu/nova-core/gsp/fw.rs                   | 113 ++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |   1 -
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 125 ++++++++++++++++++++++
 8 files changed, 314 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index a99223f73367..156d9bf1f191 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -16,9 +16,14 @@
 use crate::{
     dma::DmaObject,
     driver::Bar0,
+    firmware::gsp::GspFirmware,
     gpu::Chipset,
-    num::usize_as_u64,
-    regs, //
+    gsp,
+    num::{
+        usize_as_u64,
+        FromSafeCast, //
+    },
+    regs,
 };
 
 mod hal;
@@ -95,14 +100,27 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 #[derive(Debug)]
 #[expect(dead_code)]
 pub(crate) struct FbLayout {
+    /// Range of the framebuffer. Starts at `0`.
     pub(crate) fb: Range<u64>,
+    /// VGA workspace, small area of reserved memory at the end of the framebuffer.
     pub(crate) vga_workspace: Range<u64>,
+    /// FRTS range.
     pub(crate) frts: Range<u64>,
+    /// Memory area containing the GSP bootloader image.
+    pub(crate) boot: Range<u64>,
+    /// Memory area containing the GSP firmware image.
+    pub(crate) elf: Range<u64>,
+    /// WPR2 heap.
+    pub(crate) wpr2_heap: Range<u64>,
+    /// WPR2 region range, starting with an instance of `GspFwWprMeta`.
+    pub(crate) wpr2: Range<u64>,
+    pub(crate) heap: Range<u64>,
+    pub(crate) vf_partition_count: u8,
 }
 
 impl FbLayout {
-    /// Computes the FB layout.
-    pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
+    /// Computes the FB layout for `chipset` required to run the `gsp_fw` GSP firmware.
+    pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<Self> {
         let hal = hal::fb_hal(chipset);
 
         let fb = {
@@ -146,10 +164,55 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
             frts_base..frts_base + FRTS_SIZE
         };
 
+        let boot = {
+            const BOOTLOADER_DOWN_ALIGN: Alignment = Alignment::new::<SZ_4K>();
+            let bootloader_size = u64::from_safe_cast(gsp_fw.bootloader.ucode.size());
+            let bootloader_base = (frts.start - bootloader_size).align_down(BOOTLOADER_DOWN_ALIGN);
+
+            bootloader_base..bootloader_base + bootloader_size
+        };
+
+        let elf = {
+            const ELF_DOWN_ALIGN: Alignment = Alignment::new::<SZ_64K>();
+            let elf_size = u64::from_safe_cast(gsp_fw.size);
+            let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
+
+            elf_addr..elf_addr + elf_size
+        };
+
+        let wpr2_heap = {
+            const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
+            let wpr2_heap_size =
+                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end);
+            let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
+
+            wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN)
+        };
+
+        let wpr2 = {
+            const WPR2_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
+            let wpr2_addr = (wpr2_heap.start - u64::from_safe_cast(size_of::<gsp::GspFwWprMeta>()))
+                .align_down(WPR2_DOWN_ALIGN);
+
+            wpr2_addr..frts.end
+        };
+
+        let heap = {
+            const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
+
+            wpr2.start - HEAP_SIZE..wpr2.start
+        };
+
         Ok(Self {
             fb,
             vga_workspace,
             frts,
+            boot,
+            elf,
+            wpr2_heap,
+            wpr2,
+            heap,
+            vf_partition_count: 0,
         })
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 72766feae36e..471ace238f62 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -143,11 +143,11 @@ pub(crate) struct GspFirmware {
     /// Level 0 page table (single 4KB page) with one entry: DMA address of first level 1 page.
     level0: DmaObject,
     /// Size in bytes of the firmware contained in [`Self::fw`].
-    size: usize,
+    pub(crate) size: usize,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
     signatures: DmaObject,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
-    bootloader: RiscvFirmware,
+    pub(crate) bootloader: RiscvFirmware,
 }
 
 impl GspFirmware {
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 270b2c7dc219..3838fab8f1c0 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -68,7 +68,7 @@ pub(crate) struct RiscvFirmware {
     /// Application version.
     app_version: u32,
     /// Device-mapped firmware image.
-    ucode: DmaObject,
+    pub(crate) ucode: DmaObject,
 }
 
 impl RiscvFirmware {
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 64e472e7a9d3..55a1ad90a373 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -6,6 +6,11 @@
 
 mod fw;
 
+pub(crate) use fw::{
+    GspFwWprMeta,
+    LibosParams, //
+};
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
 
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 19dddff929da..979d3391e58c 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -127,12 +127,12 @@ pub(crate) fn boot(
 
         let bios = Vbios::new(dev, bar)?;
 
-        let _gsp_fw = KBox::pin_init(
+        let gsp_fw = KBox::pin_init(
             GspFirmware::new(dev, chipset, FIRMWARE_VERSION)?,
             GFP_KERNEL,
         )?;
 
-        let fb_layout = FbLayout::new(chipset, bar)?;
+        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 34226dd00982..436c00d07b16 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -3,5 +3,116 @@
 mod r570_144;
 
 // Alias to avoid repeating the version number with every use.
-#[expect(unused)]
 use r570_144 as bindings;
+
+use core::ops::Range;
+
+use kernel::{
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+    sizes::SZ_1M,
+};
+
+use crate::{
+    gpu::Chipset,
+    num::{
+        self,
+        FromSafeCast, //
+    },
+};
+
+/// Empty type to group methods related to heap parameters for running the GSP firmware.
+enum GspFwHeapParams {}
+
+/// Minimum required alignment for the GSP heap.
+const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
+
+impl GspFwHeapParams {
+    /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
+    /// and including the first client subdevice allocation).
+    fn base_rm_size(_chipset: Chipset) -> u64 {
+        // TODO: this needs to be updated to return the correct value for Hopper+ once support for
+        // them is added:
+        // u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100)
+        u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+    }
+
+    /// Returns the amount of heap memory required to support a single channel allocation.
+    fn client_alloc_size() -> u64 {
+        u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
+            .align_up(GSP_HEAP_ALIGNMENT)
+            .unwrap_or(u64::MAX)
+    }
+
+    /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
+    /// `fb_size`.
+    fn management_overhead(fb_size: u64) -> u64 {
+        let fb_size_gb = fb_size.div_ceil(u64::from_safe_cast(kernel::sizes::SZ_1G));
+
+        u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
+            .saturating_mul(fb_size_gb)
+            .align_up(GSP_HEAP_ALIGNMENT)
+            .unwrap_or(u64::MAX)
+    }
+}
+
+/// Heap memory requirements and constraints for a given version of the GSP LIBOS.
+pub(crate) struct LibosParams {
+    /// The base amount of heap required by the GSP operating system, in bytes.
+    carveout_size: u64,
+    /// The minimum and maximum sizes allowed for the GSP FW heap, in bytes.
+    allowed_heap_size: Range<u64>,
+}
+
+impl LibosParams {
+    /// Version 2 of the GSP LIBOS (Turing and GA100)
+    const LIBOS2: LibosParams = LibosParams {
+        carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2),
+        allowed_heap_size: num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB)
+            * num::usize_as_u64(SZ_1M)
+            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB)
+                * num::usize_as_u64(SZ_1M),
+    };
+
+    /// Version 3 of the GSP LIBOS (GA102+)
+    const LIBOS3: LibosParams = LibosParams {
+        carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
+        allowed_heap_size: num::u32_as_u64(
+            bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB,
+        ) * num::usize_as_u64(SZ_1M)
+            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
+                * num::usize_as_u64(SZ_1M),
+    };
+
+    /// Returns the libos parameters corresponding to `chipset`.
+    pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
+        if chipset < Chipset::GA102 {
+            &Self::LIBOS2
+        } else {
+            &Self::LIBOS3
+        }
+    }
+
+    /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
+    /// of `fb_size` (in bytes) for `chipset`.
+    pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
+        // The WPR heap will contain the following:
+        // LIBOS carveout,
+        self.carveout_size
+            // RM boot working memory,
+            .saturating_add(GspFwHeapParams::base_rm_size(chipset))
+            // One RM client,
+            .saturating_add(GspFwHeapParams::client_alloc_size())
+            // Overhead for memory management.
+            .saturating_add(GspFwHeapParams::management_overhead(fb_size))
+            // Clamp to the supported heap sizes.
+            .clamp(self.allowed_heap_size.start, self.allowed_heap_size.end - 1)
+    }
+}
+
+/// Structure passed to the GSP bootloader, containing the framebuffer layout as well as the DMA
+/// addresses of the GSP bootloader and firmware.
+#[repr(transparent)]
+pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144.rs b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
index 35cb0370a7c9..82a973cd99c3 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
@@ -12,7 +12,6 @@
 #![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
 #![allow(
     dead_code,
-    unused_imports,
     clippy::all,
     clippy::undocumented_unsafe_blocks,
     clippy::ptr_as_ptr,
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index cec594032515..0407000cca22 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -1 +1,126 @@
 // SPDX-License-Identifier: GPL-2.0
+
+pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2: u32 = 0;
+pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL: u32 = 23068672;
+pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X: u32 = 8388608;
+pub const GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB: u32 = 98304;
+pub const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE: u32 = 100663296;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB: u32 = 64;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB: u32 = 256;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB: u32 = 88;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
+pub type __u8 = ffi::c_uchar;
+pub type __u16 = ffi::c_ushort;
+pub type __u32 = ffi::c_uint;
+pub type __u64 = ffi::c_ulonglong;
+pub type u8_ = __u8;
+pub type u16_ = __u16;
+pub type u32_ = __u32;
+pub type u64_ = __u64;
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub struct GspFwWprMeta {
+    pub magic: u64_,
+    pub revision: u64_,
+    pub sysmemAddrOfRadix3Elf: u64_,
+    pub sizeOfRadix3Elf: u64_,
+    pub sysmemAddrOfBootloader: u64_,
+    pub sizeOfBootloader: u64_,
+    pub bootloaderCodeOffset: u64_,
+    pub bootloaderDataOffset: u64_,
+    pub bootloaderManifestOffset: u64_,
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1,
+    pub gspFwRsvdStart: u64_,
+    pub nonWprHeapOffset: u64_,
+    pub nonWprHeapSize: u64_,
+    pub gspFwWprStart: u64_,
+    pub gspFwHeapOffset: u64_,
+    pub gspFwHeapSize: u64_,
+    pub gspFwOffset: u64_,
+    pub bootBinOffset: u64_,
+    pub frtsOffset: u64_,
+    pub frtsSize: u64_,
+    pub gspFwWprEnd: u64_,
+    pub fbSize: u64_,
+    pub vgaWorkspaceOffset: u64_,
+    pub vgaWorkspaceSize: u64_,
+    pub bootCount: u64_,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2,
+    pub gspFwHeapVfPartitionCount: u8_,
+    pub flags: u8_,
+    pub padding: [u8_; 2usize],
+    pub pmuReservedSize: u32_,
+    pub verified: u64_,
+}
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub union GspFwWprMeta__bindgen_ty_1 {
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1__bindgen_ty_1,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_1__bindgen_ty_2,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_1 {
+    pub sysmemAddrOfSignature: u64_,
+    pub sizeOfSignature: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_2 {
+    pub gspFwHeapFreeListWprOffset: u32_,
+    pub unused0: u32_,
+    pub unused1: u64_,
+}
+impl Default for GspFwWprMeta__bindgen_ty_1 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub union GspFwWprMeta__bindgen_ty_2 {
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_2__bindgen_ty_1,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2__bindgen_ty_2,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
+    pub partitionRpcAddr: u64_,
+    pub partitionRpcRequestOffset: u16_,
+    pub partitionRpcReplyOffset: u16_,
+    pub elfCodeOffset: u32_,
+    pub elfDataOffset: u32_,
+    pub elfCodeSize: u32_,
+    pub elfDataSize: u32_,
+    pub lsUcodeVersion: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_2 {
+    pub partitionRpcPadding: [u32_; 4usize],
+    pub sysmemAddrOfCrashReportQueue: u64_,
+    pub sizeOfCrashReportQueue: u32_,
+    pub lsUcodeVersionPadding: [u32_; 1usize],
+}
+impl Default for GspFwWprMeta__bindgen_ty_2 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+impl Default for GspFwWprMeta {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}

-- 
2.51.2

