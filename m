Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA14C46EAC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF97210E39F;
	Mon, 10 Nov 2025 13:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z+4LxkF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010009.outbound.protection.outlook.com [52.101.61.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D715410E39D;
 Mon, 10 Nov 2025 13:34:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSttfu8GJRGEy/j9Mpi67zid7g4RGGlno9aJGbM24ExK9Zlq8reJVolWN9FpTtpmXSYpyiZF7SQCEpr+XPu3p3F+xqFuAa7LHpxXQ1umzozLBb1QcYNZ7mB9h/pDQg2G3+6l4bi4ewG6jy2+LV+WRlvgXcK/AVjvlrbYL+l44rNGG8GyIZODmV7QY/bW/qlpTCvysskNYH3poRkIAUMrGS13M78d6bVPWpTBa0o2FY9VZ98Oj2NeECbAikNSer+E8qNGtXCRneQB1spZIDm7ApfC2FqD6Gpc1bfUPqB3HajF0NOu3EMDsj+LedSfx/KpG7WDyVEFO0BRxoZ1U4HzMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twU0uvWtQf+HwZ6J1R7S3p+GVcDRZrZpVrlDulgM3ww=;
 b=QvH5mdyUObWIYKsSKr6Y41UBORP2yQeiDdpF/6QqNJhoyVDPMCkvxT6n4qAyClSvb1xqx7YNDDM7SlgI5AYNWCWQfnHIh/52l09oBSe8EJYs8aS3fdESth4ZoQjof4Alh2fFYmw+jNj+2pC2qQGWc89PERZKdUXYFtXalExE6tS2Z4V+Qmc4Fl4gvB9NJu13bQrjX5XRxg1Fo/5mlMk+OsU1BeQ/wadsiKEXTfVMujDBoKajBcXrc6JcTg0LiPltmFCppE1GqEPJZv6rqkh6DGoNDpvS71gb2TmtBQb884IqEUzfCkj1nhnm1pjK6HUMmEjqCWoABG09TonezYIU+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twU0uvWtQf+HwZ6J1R7S3p+GVcDRZrZpVrlDulgM3ww=;
 b=Z+4LxkF8SchzWhi3/pvJxbfezKvc9a5/tqYojqEQWiTP2dcobsqFTbnvpIWrnDm9UbvUx3OEs792+XLKcE0wV1PpupR6njbCvg9sLZqxjd8CtRYV3GwKyFQX1esdWc+qBaNp6LURBSnmz+14mqxLy9W9Ulla3jNqEEOwy3QfQvfeeynpfKl3J/PKNp765vq0ypUkFQdRszUQ1N+E+DSAv4763YMCBUVPaRBb9K1+hKN2NlGOaMhdrTbSsOHSBBF8W7DNtzYMUbkNjPJSiWpjDpHqcGN1ee9Ff7jz+ffYApwZilVpNXulOz7aPi3s7FR1KtwB63WZ7yKyxJD9t5CKaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:34:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:34:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 10 Nov 2025 22:34:12 +0900
Subject: [PATCH v9 04/15] gpu: nova-core: Create initial Gsp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-gsp_boot-v9-4-8ae4058e3c0e@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f2c113-1211-464a-773a-08de205de357
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1N4cm5UWVZGb3psQ2EyVllreHY1YWI0VzROa1ZDOHFKeXB0R3o3TlFoRmhY?=
 =?utf-8?B?Qy8rak5VMGVSb2NJaXpyeU5vQklTd2R1MDJmSktHS1M3bDA3L3ZvNTRTaUZm?=
 =?utf-8?B?QTJMZnBQclA3VzZQaWNZaEZ4VmcvVGl4QlBlb1ZpRCtRSk9XM3pUdHlBMlgr?=
 =?utf-8?B?ZlI4TVBCMm4xU1J4dmdDbGh5cHZiWW4yaStmLy9jN280V1VWdDVuU3RWb3Vl?=
 =?utf-8?B?WkhRWXdxY3dXbXRRZGY2ZWwwTkxyRlJXZGdRZ3gyM2hhQXNVWkJhdndpekxP?=
 =?utf-8?B?YVRaSUtqNmExVmR0Q2lmRXc2Mit2bXVnVi9LUXdkNjZ6c3NBdEhEMng2MTNR?=
 =?utf-8?B?clUyMVI1WCtUUE9kdVBsVnNRcm1xc0k3M0h3MmZyRS81dGt5TnRjSUd5UjE4?=
 =?utf-8?B?T3ZFSjcxL3QweVYvR1d0Qi9rSFlPQ3pDN2dkTnpCQ0dkMEpnN0ZCM1NTaEg0?=
 =?utf-8?B?UDJnc2N6M2RQVVkwSXhpVXQxN1VWL1I1NGlveUhRSEpoZ0FvV1RTbjg2ZU50?=
 =?utf-8?B?MEVuWjBreGIxN2k4bVM4NHZyRHJVOTEweCtaMnhqN0lEYjVWMmRBN0lkZnpQ?=
 =?utf-8?B?VEM4NzllNmVFRHh2Kzk2UFhjYUtoSHd3THZLV3doUWNsMUJRUmM3M1c0VlFR?=
 =?utf-8?B?Z2RURVNuVDRxaWsxUE5XNG5LaW9ncEsvc0JFVmtmc3ZPeUpQdHN4U2NwQmlk?=
 =?utf-8?B?Y2ovamlTeE9NR2hrL3J6ZitMemg2ZWlHeHJWZlQyT1hEeHEzaWJrMTkyaENi?=
 =?utf-8?B?a25kdnJSNUd6UXgxVzV2Qys5WDRVWVZzU093bVlPYkRtMXlhQ0VhRm9pdStX?=
 =?utf-8?B?djN5elQ4dm9NWG5PdEtZa2dKSnkxOHNnZmxWa0lVa3VxdS9ndW1hdDFmeW5M?=
 =?utf-8?B?eWlwSGNPeE91OHJFZE1lTlRGajBIU004dmJ6YmRJeWw1QUpFQnlLTDdYQmVB?=
 =?utf-8?B?VzJCSCtQdEF1UmVpNW9tU0Njcm5pTWxZcXpLWnJTZUVnUnJRMXdMTEp0bDRH?=
 =?utf-8?B?STBQcUp5UVRsRHArMEdFTHFOaXg1dHNienhCVTQ0TnNIM3l1dWQvU1BnaTc5?=
 =?utf-8?B?S0I0RGFCRDkrQkkwM1hDWnJkVXpjTEVLV0pCREg4cXJPTkI3MVFMN25ub08w?=
 =?utf-8?B?WWdmMEEzZTN0T2dlRG5mNXp0ODRwS0N5UjEwajRDVVdheUNGV2dyMHMxYjF3?=
 =?utf-8?B?Tlg3ZmRHbElKZTBaVitqRFZHb2Q1alV5NGY5bTVPM3JBYTdlSTBIUmM0R3ZF?=
 =?utf-8?B?Q00zU1J6VEZsQjZtMzF4UXNaV2xOVHZzbzA0N3JBZGNRa2JmdStjNVh6bzF2?=
 =?utf-8?B?dTFFcUwrWk1zZnFrNExGVkJTa3IvSHZIN1JnWklaWnlyYU1qOW5pYjJWRVlh?=
 =?utf-8?B?SUxRUlRFTEo0TG9NeDVBYXM5WEZ0cmRKUUVuVEVQSE1kMkRacncydkZVWmUv?=
 =?utf-8?B?cktPaGdYMTk4Uk1GU2F2NjhWdTBQNnA4OC96ank1YTg1cFVUY2lpWDdYMUpC?=
 =?utf-8?B?SWkzV0pWemt1dStnYnB1dVl0VkJzbjFWOG80YnN4bzZZc28rNFdqZFRrT0Z5?=
 =?utf-8?B?ZFFpZTJ0cVlsNi9Ja3V0RFZ2UHZ5YTRtM1BsTnFEV0c3c3lxdmV2c3pQUnd6?=
 =?utf-8?B?ekp4aU44NGpMVzZQbWtGM083Rlc3Uk1xcXRwN3NBbFp3ZG1Vbm1WelJJdmtM?=
 =?utf-8?B?K0ZGL2JSb05URmZuTEo2dnhRNDBlQ3EzcTVSaXExWXpJYXd4NEthRmE1UHZT?=
 =?utf-8?B?Nkdld1FhMDMwSFJid1laZmdRV0tOby9kSmdsUldNN0lZTUg0MmQxbHhENGZq?=
 =?utf-8?B?MW92WmdrbU5HMEVVc3BlMmI4ZTVCK0M5ZkpXUVFVaVBvL1dpSTJ5ZXE4bGx0?=
 =?utf-8?B?R1gySWFVZXJJTEErbGNuVHJqUnRtcWtWSElZbWhBSGdtdm5uYUhZcHBpM3Nz?=
 =?utf-8?B?NTFyckhDS1VVYW9pTWEzVWhMYXZUdUJlQSt1N2R0VXU5UWRySWlJcXMxSjg1?=
 =?utf-8?Q?L86tTIwSEnnsLVC3Uex0D66naaaii0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXdaR2VqbTlkUEpNZWFtcExpbU9EbkJPU0JxWTIrdHVUZG5qK0Q1ZmtBeFNj?=
 =?utf-8?B?SDFNaVFtWWY0UytxdG90dkxyMGxEdXRoWW1TTk9XeHlUMWliR3ZISUVGcHFs?=
 =?utf-8?B?QzZEeVcwZ1BtQ3krZERCVzhXS0NLU211N2pXZmM0bng5N1h1eDBxbnl1dGxj?=
 =?utf-8?B?cjFMZVgzWDdXcE9HUjJlU2tGcEV2dzg2L2dDQkFBV0NMYWJ6SWs0S0tPcUFh?=
 =?utf-8?B?Y2JsWU5zYk43bzNZcEtuZHM4TkY2YVJKUys4VStmL04vQTZTcS9LZkg2Smdl?=
 =?utf-8?B?VjB4cDZST1lmSitZUHovL1N0Vy9NZXMySHR0ZVlZdzBtNzhKeGJHekFkTEJV?=
 =?utf-8?B?WHRuMk4zU3R6TlhsMEpNd3ZxWnZKR1JwNmk2RzIxMkdkZWNReENFQzhOR0FS?=
 =?utf-8?B?cmJBR1RBZDBuaG44a004c2JTOTRhZll1aTl4TjZGaHlxL2o5dE1nTkJKMllo?=
 =?utf-8?B?NTh2SWhqNXNzM3hsbzJIcTFNOEFKN29jQmx0R1llVUNSQXh1OEN0YVVWamxy?=
 =?utf-8?B?MFo0TU9EUFl1SjNodklnYzZOeCtUcEN2NHQwTlg2QzZvcnJSUENkRkt5SHhj?=
 =?utf-8?B?K3o2WUw4alVqQnVsYml2WmNJV3ZIeUxIeGY2SGl6OWcrdzJQaG84c2puMVE5?=
 =?utf-8?B?TG5rMFZ5M0pneXIweGtwY05qTmIrNUxJNG03aW43OFJPVCszU2g4ZlM4VTN2?=
 =?utf-8?B?UTloaGtrV0lKQzlady9rRU1iVTVYb3g3V0NMQjJZRS9XV2ZqOFg1aUtSaHVp?=
 =?utf-8?B?S2RmQmk2MDh6dnNxeHk2NlFqek5FZk5mZ0kvMDNMU004YXhQRllpMGxYZGJM?=
 =?utf-8?B?R3U2YzBGTk1TOUExMlhEdG1heEFyZm91YlREbjJDVVJ2Y2dJMnVkMjlCeUhq?=
 =?utf-8?B?L244b2ZrYmxReEhlSHR0RjVpYUliVGU1MSt3a0ZKZTRjYnRGRFRtN1RuSFdB?=
 =?utf-8?B?dHpKY0ZvQzh1bHRjS1VRbE5GQTYxWXVOdTJrYnNRYUN3cWt4NXRVQ1ltVS9T?=
 =?utf-8?B?ZHlMOFZ4VURMcnpROVBtQzU4TzFKeWNtRTJTVW01ek1TMGNFRlhQNUZiUVpI?=
 =?utf-8?B?U3JwclRvd3dGdzJFZEVVRWpPRFd2NW4rd0dtK1cwdVYwZFlSUHRNZXQweE1D?=
 =?utf-8?B?UTVWZWhMYk1YQ01jdk9adjRzTUlBMEM0R3gvUEUrWVVpRmxycko0bW9taVFG?=
 =?utf-8?B?YlU3K3B3YlU2d1hTeFc1VXJGYmJ5eFNqYUVBZDVXNERxMmQvUlVybXZGdDEv?=
 =?utf-8?B?SkV4QTVGNDF6cTdiQkMyU3FXREY2UU5GYWw3cE1TNFB6UVBGSzNjQ0E5R0dH?=
 =?utf-8?B?YjNDWSs4Zk1KckdLdlRZSG9KbzFoaUN5R0psNEMxK29Sa1VraFBJOVFSbURr?=
 =?utf-8?B?OXdlS3ZLcG9NRTE3dHZtSW1oOFd3VlZITjZrRjB6c3RPa0JyQ1kxRU9OZzRV?=
 =?utf-8?B?a3RuSDZqejN3WTZXVElCQThLN3Eyam95anZ2RFlHTStOVkYwYkxFRUpsT2M4?=
 =?utf-8?B?K3NNVWxiTnhTWk1uVXR1MVNkNUFUSGl3YVdKOUFabVFYTlJ6bFI0bHZNRS92?=
 =?utf-8?B?RENtK0xTNE1tZUgyMkxjU2t1WUZ6dHlpbFd4RCtEMmNOWWN6RVVKaEFManNl?=
 =?utf-8?B?bS9JNDRuUWF5QWtyVW5EOVBQYWVoK0xYSm8wQjJWeEt4WHg1bUVYcnJrclVm?=
 =?utf-8?B?Q0txQjBNaFp3YkxOSkc4dVp5MTl4UFc4NERjcVdqRG1wQnp1d1JxcVBPTWpq?=
 =?utf-8?B?UktTUEdCR1hhWG9OK2Q3Y2ZwWXI0dGN2UWhVd0FpRGNzS0lXaitZZERFdlUy?=
 =?utf-8?B?VGxJUDlTNklXWVMyYlRUVmgzMXhoZlc0ZllvZ1V1RmpwNTZtQW90WXVzeFFH?=
 =?utf-8?B?RzlBWmJCTXErZkVLUDgvdjVpTEpENGxVaVJNZVM3eTZjQlJKYXl5Tkc1djl3?=
 =?utf-8?B?eGxWTU93b2pIdHlKZ1hiM2I0ZDFCYnpFVW1aalFMOUVHNFFqMHhHaEdNQk5l?=
 =?utf-8?B?NWZTbVV3eG8rQjVnb3RVSUlhNWVRN1c1RDhGN1luZUliY3RnSXlpNUZsdWs3?=
 =?utf-8?B?MHRBaWd4c0xPLys3SWlBeVNUSGMxL1luN010eWo3cXNqdm9tdG4wYjVxTzkx?=
 =?utf-8?B?QXJQSmFaOWlNUVRGNEsxWFN6Tkw2Nmc0Q3VRWm1ESGVUejQwMXdudk82bUU1?=
 =?utf-8?Q?Z3792V28cG86vH1kADCJ7I7kwgyhFjuQuVghbhaLY6VN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f2c113-1211-464a-773a-08de205de357
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:34:35.5110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGwEO/MbsDcQnZ7FZj6eGBRSLrM7JiB0qANOvGC0tkAcL/MazLAQ741P0NVW8pt8z9HJcHocbHQBTLsOyPw8KQ==
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

From: Alistair Popple <apopple@nvidia.com>

The GSP requires several areas of memory to operate. Each of these have
their own simple embedded page tables. Set these up and map them for DMA
to/from GSP using CoherentAllocation's. Return the DMA handle describing
where each of these regions are for future use when booting GSP.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs                      |   2 +-
 drivers/gpu/nova-core/gsp.rs                      | 129 ++++++++++++++++++++--
 drivers/gpu/nova-core/gsp/fw.rs                   |  60 ++++++++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |  19 ++++
 4 files changed, 200 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 802e71e4f97d..03dae437bc37 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -231,7 +231,7 @@ pub(crate) fn new<'a>(
 
             sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
 
-            gsp <- Gsp::new(),
+            gsp <- Gsp::new(pdev)?,
 
             _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 55a1ad90a373..ec053395694b 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -2,7 +2,17 @@
 
 mod boot;
 
-use kernel::prelude::*;
+use kernel::{
+    device,
+    dma::{
+        CoherentAllocation,
+        DmaAddress, //
+    },
+    dma_write,
+    pci,
+    prelude::*,
+    transmute::AsBytes, //
+};
 
 mod fw;
 
@@ -11,17 +21,118 @@
     LibosParams, //
 };
 
+use crate::{
+    gsp::fw::LibosMemoryRegionInitArgument,
+    num, //
+};
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
 
-/// GSP runtime data.
-///
-/// This is an empty pinned placeholder for now.
-#[pin_data]
-pub(crate) struct Gsp {}
+/// Number of GSP pages to use in a RM log buffer.
+const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
 
-impl Gsp {
-    pub(crate) fn new() -> impl PinInit<Self> {
-        pin_init!(Self {})
+/// Array of page table entries, as understood by the GSP bootloader.
+#[repr(C)]
+struct PteArray<const NUM_ENTRIES: usize>([u64; NUM_ENTRIES]);
+
+/// SAFETY: arrays of `u64` implement `AsBytes` and we are but a wrapper around one.
+unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArray<NUM_ENTRIES> {}
+
+impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
+    /// Creates a new page table array mapping `NUM_PAGES` GSP pages starting at address `start`.
+    fn new(start: DmaAddress) -> Result<Self> {
+        let mut ptes = [0u64; NUM_PAGES];
+        for (i, pte) in ptes.iter_mut().enumerate() {
+            *pte = start
+                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
+                .ok_or(EOVERFLOW)?;
+        }
+
+        Ok(Self(ptes))
+    }
+}
+
+/// The logging buffers are byte queues that contain encoded printf-like
+/// messages from GSP-RM.  They need to be decoded by a special application
+/// that can parse the buffers.
+///
+/// The 'loginit' buffer contains logs from early GSP-RM init and
+/// exception dumps.  The 'logrm' buffer contains the subsequent logs. Both are
+/// written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
+///
+/// The physical address map for the log buffer is stored in the buffer
+/// itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
+/// Initially, pp is equal to 0. If the buffer has valid logging data in it,
+/// then pp points to index into the buffer where the next logging entry will
+/// be written. Therefore, the logging data is valid if:
+///   1 <= pp < sizeof(buffer)/sizeof(u64)
+struct LogBuffer(CoherentAllocation<u8>);
+
+impl LogBuffer {
+    /// Creates a new `LogBuffer` mapped on `dev`.
+    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
+        const NUM_PAGES: usize = RM_LOG_BUFFER_NUM_PAGES;
+
+        let mut obj = Self(CoherentAllocation::<u8>::alloc_coherent(
+            dev,
+            NUM_PAGES * GSP_PAGE_SIZE,
+            GFP_KERNEL | __GFP_ZERO,
+        )?);
+        let ptes = PteArray::<NUM_PAGES>::new(obj.0.dma_handle())?;
+
+        // SAFETY: `obj` has just been created and we are its sole user.
+        unsafe {
+            // Copy the self-mapping PTE at the expected location.
+            obj.0
+                .as_slice_mut(size_of::<u64>(), size_of_val(&ptes))?
+                .copy_from_slice(ptes.as_bytes())
+        };
+
+        Ok(obj)
+    }
+}
+
+/// GSP runtime data.
+#[pin_data]
+pub(crate) struct Gsp {
+    /// Libos arguments.
+    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+    /// Init log buffer.
+    loginit: LogBuffer,
+    /// Interrupts log buffer.
+    logintr: LogBuffer,
+    /// RM log buffer.
+    logrm: LogBuffer,
+}
+
+impl Gsp {
+    // Creates an in-place initializer for a `Gsp` manager for `pdev`.
+    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self, Error>> {
+        let dev = pdev.as_ref();
+        let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
+            dev,
+            GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+
+        // Initialise the logging structures. The OpenRM equivalents are in:
+        // _kgspInitLibosLoggingStructures (allocates memory for buffers)
+        // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
+        let loginit = LogBuffer::new(dev)?;
+        dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
+
+        let logintr = LogBuffer::new(dev)?;
+        dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
+
+        let logrm = LogBuffer::new(dev)?;
+        dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
+
+        Ok(try_pin_init!(Self {
+            libos,
+            loginit,
+            logintr,
+            logrm,
+        }))
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 436c00d07b16..458b5610061f 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -8,11 +8,16 @@
 use core::ops::Range;
 
 use kernel::{
+    dma::CoherentAllocation,
     ptr::{
         Alignable,
         Alignment, //
     },
     sizes::SZ_1M,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
 };
 
 use crate::{
@@ -116,3 +121,58 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
 /// addresses of the GSP bootloader and firmware.
 #[repr(transparent)]
 pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
+
+/// Struct containing the arguments required to pass a memory buffer to the GSP
+/// for use during initialisation.
+///
+/// The GSP only understands 4K pages (GSP_PAGE_SIZE), so even if the kernel is
+/// configured for a larger page size (e.g. 64K pages), we need to give
+/// the GSP an array of 4K pages. Since we only create physically contiguous
+/// buffers the math to calculate the addresses is simple.
+///
+/// The buffers must be a multiple of GSP_PAGE_SIZE.  GSP-RM also currently
+/// ignores the @kind field for LOGINIT, LOGINTR, and LOGRM, but expects the
+/// buffers to be physically contiguous anyway.
+///
+/// The memory allocated for the arguments must remain until the GSP sends the
+/// init_done RPC.
+#[repr(transparent)]
+pub(crate) struct LibosMemoryRegionInitArgument(bindings::LibosMemoryRegionInitArgument);
+
+// SAFETY: Padding is explicit and does not contain uninitialized data.
+unsafe impl AsBytes for LibosMemoryRegionInitArgument {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for LibosMemoryRegionInitArgument {}
+
+impl LibosMemoryRegionInitArgument {
+    pub(crate) fn new<A: AsBytes + FromBytes>(
+        name: &'static str,
+        obj: &CoherentAllocation<A>,
+    ) -> Self {
+        /// Generates the `ID8` identifier required for some GSP objects.
+        fn id8(name: &str) -> u64 {
+            let mut bytes = [0u8; core::mem::size_of::<u64>()];
+
+            for (c, b) in name.bytes().rev().zip(&mut bytes) {
+                *b = c;
+            }
+
+            u64::from_ne_bytes(bytes)
+        }
+
+        Self(bindings::LibosMemoryRegionInitArgument {
+            id8: id8(name),
+            pa: obj.dma_handle(),
+            size: num::usize_as_u64(obj.size()),
+            kind: num::u32_into_u8::<
+                { bindings::LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS },
+            >(),
+            loc: num::u32_into_u8::<
+                { bindings::LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM },
+            >(),
+            ..Default::default()
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 0407000cca22..6a14cc324391 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -124,3 +124,22 @@ fn default() -> Self {
         }
     }
 }
+pub type LibosAddress = u64_;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_NONE: LibosMemoryRegionKind = 0;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS: LibosMemoryRegionKind = 1;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_RADIX3: LibosMemoryRegionKind = 2;
+pub type LibosMemoryRegionKind = ffi::c_uint;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_NONE: LibosMemoryRegionLoc = 0;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM: LibosMemoryRegionLoc = 1;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_FB: LibosMemoryRegionLoc = 2;
+pub type LibosMemoryRegionLoc = ffi::c_uint;
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct LibosMemoryRegionInitArgument {
+    pub id8: LibosAddress,
+    pub pa: LibosAddress,
+    pub size: LibosAddress,
+    pub kind: u8_,
+    pub loc: u8_,
+    pub __bindgen_padding_0: [u8; 6usize],
+}

-- 
2.51.2

