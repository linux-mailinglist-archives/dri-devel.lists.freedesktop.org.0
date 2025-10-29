Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E769DC18F56
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F5F10E73F;
	Wed, 29 Oct 2025 08:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FT0cq890";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012069.outbound.protection.outlook.com [52.101.53.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6738810E73E;
 Wed, 29 Oct 2025 08:18:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVELv8uSahOEYIeDI4BXmsR6f6UvW6VdoBq6yIJWBW418CRhD77w5h8iwYDaHZT196waX/U2uG4lF+2Pec79P9/B3LQr1iSltj56V2uzyHwh8gByaMkbhCdihqVCOdDCO8CeOp6C2A95nrQesSJNrzs4ie3Sq4htk0geakifDaub9He84fFy9/fw7vHasVTivlWLDOx2zj8iLTvW7dPfw5Tnbq5yFE5h2FpwbjynkQT2/XUxZ34Va2jnv3WNZl6I50v1ctM8IvsUYhQbEjUb2Gpux5qxUQBY2StHMriU4NxwMWh9iyr3TEqNr89Kki+qmGA/vQ/h7bjFX+A0vyhglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEhzWtcqmgLDD7T96hXKCnh4vkZODdcp1BrqrT3N4hM=;
 b=dr6RFDeuvjFQnZEzVGGlTKsdApZ+yYQyzJCDqeWsKHHfq/BBgNbbyNw87sPhLh6YCowKJe3riifxZpUt8+pB+lzSy34NCgEprxup0RtcxiBT0Ndz06wt3XAPRcVdP9Zn6DvrN3ND5bkhB4vIznfHes9Lj+0kZaxkaapfquUa0sjDdXylYXQTvV7IUPnbQdjY3HeBq8wlLEfNOQkIUZ+eADpomyVlMQU5yrXnQX6iow0o02hbXB2PnMllCXonI5kZEZZ1u6TIVBzVN+Klp8TowvW64jqhG4wPqIW2f9BgcqFGMFh0cLXP4BJhzkYaaRDEcfrPxYE6VHLaoqtEROVDRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEhzWtcqmgLDD7T96hXKCnh4vkZODdcp1BrqrT3N4hM=;
 b=FT0cq8901Sb19Mox9GYrIpG8X1YuaeYPygOUyFoXG8cEWndONGkMOCSs0WgI60rQtRdpm/BvDUqqLDUYPcSz8BT5X7LJv7yq1fk7tUJC2e8rZgfUUWuW+ULGCUP/LNRexKqYuHK9tRquo5wbVk8fIq/AUA1QPoePhqkgy8FoQoRlMO015Q8rbyITUzJ5EAlgVESXe7fgeHl3wka0a8qXiXYLSuQ8C5j3iqbL6oVPBCyiOaSpjuyrDiB1yelkcXCmz/n8E+Yda21ZA5akzrybLpguZ4HJKMlZjNqSxdatIb631Mofhw9O15JFE5DpBoLDVWcnN6aTcqC6Z+Bf05JqSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by PH7PR12MB6785.namprd12.prod.outlook.com (2603:10b6:510:1ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 29 Oct
 2025 08:18:43 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 08:18:43 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 17:16:41 +0900
Subject: [PATCH v7 14/14] nova-core: gsp: Boot GSP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gsp_boot-v7-14-34227afad347@nvidia.com>
References: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
In-Reply-To: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0052.jpnprd01.prod.outlook.com
 (2603:1096:405:2::16) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|PH7PR12MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: a59f3318-27f6-43cd-2e4b-08de16c3c65c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1hQNmRBNG42TVIyUzQ4c0pwUGozbVJ0NEhtU2JXNTZ1Z2tOaXhXRjBabHVN?=
 =?utf-8?B?cTR5OFZsZjJMclM0czRieDdjVzNLbFArNW9yWnpBYUdnZW53VEFlTDF0RkVh?=
 =?utf-8?B?VW50RkpIMHNvb2k4TmtBRzgrWWExckJ1NzErWW1iU21CZ1VZV0xRaFV0a2p0?=
 =?utf-8?B?QnV6Mm5OcFZBbGFuSXAyb1FrWCt5bm45c1lOTitGS2lOUTc0eDBnV29iV1VP?=
 =?utf-8?B?VXNnSmlwR0x2dWdFN3FEYzBiRFp5REQyTUJHY0JnWGVTQjRKOXlGeDZjbkpK?=
 =?utf-8?B?SGFnSXBkS29aWmN4S0l2QWQxUE1wd2dXL1dLbFVKVDNPemR4eURKRlhSSUNp?=
 =?utf-8?B?bkNHOS9vZmJJd1Y1c0JvYk11VjVtaFRoNWE0RzkwenEyUnliSDlVZDZLY0Fl?=
 =?utf-8?B?L1I5NkZJejRkVmxiOXdNWk44dGFZbWZvaEpaTG9zdFlPOWIwWUNIOXNucXRs?=
 =?utf-8?B?R1BhWjZmREZVVW1JWjZvOXdzUUUvQ3VnOVI3T3V4RHF6RllXSFRMMDdNYzZ0?=
 =?utf-8?B?bUF2SUdkSTU4UnFxN3JqOW4vQUI4WlhhcytweG03eFJWcTdrQ1gxcDhYblRS?=
 =?utf-8?B?Z3pPRmsrQ2FjRFlTNjc4VllsY1FRa1RETlZzd2NQZm5HMG1kenhzSlh3SzhR?=
 =?utf-8?B?cXVPWFU5dzBJY1lDS0YvclArSExJaGZtMHlZY0c0SjUvQTNyUU5ENlFPSm8v?=
 =?utf-8?B?aFRpM1JWT0sxblJjRFMvTVIyMitlNGVtTUgvOTI3N2RsdkRBYVlVU3Z3OUhl?=
 =?utf-8?B?WElUVnBRaTg3R3NPaVZOZ2oxQ0lGeEJCMGJlVXdQbklaTVpGS05VNzJyZFpx?=
 =?utf-8?B?Q3VqTzI0SlNhdGFXNVNJaDZDcnNOTmtPb3BJR2taMG5wZEUvcVo0cEVGekFx?=
 =?utf-8?B?cWdwZW4rUWFMdWNTeHlhZW5MU2oyWFFET3p1MmVqbWhhaUtSaWNIbC9sTlZo?=
 =?utf-8?B?UkZnMnlFUHlUdFNhUDZ1bXFhYkNoMUw3SWVMMlNtOGl5bFdadzZ1ZlFUYXVt?=
 =?utf-8?B?UmZSQWhEWDdRVjJTQWh3VExZWFpsMG9BUXJVTW93WGVqYXpGenFKdkhJNEh0?=
 =?utf-8?B?ZFdLb1VicGZDN2MxRmhVNU9nbHRINFdCeFlnY2hjUko1WU8zMHR5WnBQOFN6?=
 =?utf-8?B?ZEVPVngxT28zQ0xhNnZJb1F2Wk1DQklqRkxhYmdScTlIL2laVHcrbXpPc1Qz?=
 =?utf-8?B?VlEwbllDeTJBYXBkWmpVakJxNUw1UUdqODZzUEt2WGhCdmswVnIxOFQ2QzBX?=
 =?utf-8?B?UW1EN3pZVlEva2VUOGo5Q290enBBYVdGSjQ4clFYNyszR0NlOWdONmREWkhZ?=
 =?utf-8?B?V00vdktYeDdHUlF6MFpvb1JkQ3JISU1KbG1JMEhBUnd2d0ZjdTJuaHdXNHcw?=
 =?utf-8?B?aWxNbU82MEdETFM4bkkvSmVXbHFnVllqNkJ1WDkxL08xVWZxSGpvSGE0R0tT?=
 =?utf-8?B?WDRxTURMWnpQVTEyREF5eG5iZERaeHUwWXlySkx2OTRjVWozYkYwaGZoNHFS?=
 =?utf-8?B?SS9uN2tRNmJKUjZ3a1lFcjc5NWU0Vzd0TmJWblg0eGdrYTdkZ3VGUTVNaE95?=
 =?utf-8?B?VGNzUmI5QzBOZ3ZSU0RYLzZzT0plRzM2SlE4aWo0UmxNVnRMSi9QTlhKRFdR?=
 =?utf-8?B?RlUzWC9oVVZJcSsyNlIvQkxCR2tiUXpmZThXeWxJaGlMUGtkY1B1M0pNTnhq?=
 =?utf-8?B?WW82Rk1zSXoxMDR0eXcrVnVtVkFic29FLzFQT25WNVdseDVTNy9ZbHBkMVdy?=
 =?utf-8?B?K3hMU2YxT1Z5Z2JqUUdSdU1Zbmg5Rit3Uld4YWhEQktVdXhPVzQ4Q0Q5Q1Fa?=
 =?utf-8?B?aGtHdyt0c01qV0dMbmRtVzhIUXdSM015MmwyTGRXUXdaTGJNdGIrMVdCN3lk?=
 =?utf-8?B?Zmd0ZlNEUEZLVzlaMVhkZDZPbVhJdi9Yc1dMR0xxR2V0cDZLM0dHK0RXQ0NC?=
 =?utf-8?B?V25HMmpmdU4wY2FtbzE5ZW9DbjlneFM2Nm9qbzJuZnNwUFBpeGFLL0VoMFVT?=
 =?utf-8?Q?QyKukYKAFThqp8SCL0nw0AmJItFTUo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2NxZFlESThHb1JYYkdHWVAyYmJ1TmlSNDYwWmYyQUdtSmpMZHBkYTY0MmZQ?=
 =?utf-8?B?ejZsV3hVdzM0dFFUelc0TlAwVG4xU1lRSTNqRGc5RHdGV1J0SERPOVB6d3Uz?=
 =?utf-8?B?am1hMFZtT0Myak5RaEQvU0s1QVFZYklMZU5uYkdPR2lMcGNib1kyQmhCNUlL?=
 =?utf-8?B?Q2JPYStlS3p2NkhndU4yd1hhZThKSWFPZmZZMjA5RmNqYk1aNU9uL3hPQW1q?=
 =?utf-8?B?OEZCZFhhK3pDOFdMVGFxNnhuYkdvaE96bTRMVEtEdlExdGhwL2EvVUdGbU53?=
 =?utf-8?B?Z21GM2x2SHFhZjRDYVpOMmRaSENxVU0wOEt2WnkzNzBsR3dDOXBhQ0FiUTdv?=
 =?utf-8?B?Uks5bVpUUm5MOVRQRXVxdjI4U3hRUFRJMGNZQzFtU0ovR2dpRXhiMTVJdVFq?=
 =?utf-8?B?YUprUWhXbUc2eWVzWC8rUFpnTnVnci80dmpTQWI0V2VZd0ZmVWNNVWtGbXVB?=
 =?utf-8?B?ZkxQdndNdkJQQm5vekVnUUZ0aE9kc2lidW5COXJwM2k5TlBCeWNTbW1idTRj?=
 =?utf-8?B?R3FKZEdiSVltb1RhakYzaXNOaStkcHhNdWFxb0lULy95SHdpTlNIUEdpQlpw?=
 =?utf-8?B?ZFUxTWE2ZjJpK3M3SUdhY01VQzA2OTg2am02ZDZZMkpKUThwbFR5Z284SXlv?=
 =?utf-8?B?RU4ycDEyQ1ZGRHRtcVIxbFFvcWt2bCtUb2R6d0RTTzQ3SFk1Q1NoQldqdDlp?=
 =?utf-8?B?ZzZrNEdnc0hjME4xOFpZZHVHbm91S2kwb3Q1MUx0RUUwdTM5Q2JReVlzWmJK?=
 =?utf-8?B?YkhucGQ3dGZNbHJvL01QcGJ6WGJSeURmRmhlWFVTTXVnY2NTQ2dqZEhlS0RJ?=
 =?utf-8?B?R0dDVmJITVVEdHNEUXRkcVpZeThGQ3VRZi9kcTIxZTZSdU54dVBETUQvUUJC?=
 =?utf-8?B?ZE5vNTZTUnpQdm0zSGJTZkRRcGdJR0RYU2J4NEFpenJ2TFk4bjhlcU9oUHlL?=
 =?utf-8?B?blhERGRlemNibTVOa1Rjb1NSdVRjakxYaW5WOElHRC9mbVJFUnE3YzI5dit6?=
 =?utf-8?B?S2tJMDZraXAvQ2ViQ0I2SHlxaVdjdXBSR2J5WGs1RGsxRFpmZlFRU1M5ODFo?=
 =?utf-8?B?aWY5bWZVZ2w1Y1E2MnA3ZkNxUVJuQ05NK1dmMGtrSVJhTTNJZC9YcEg5a1Ns?=
 =?utf-8?B?ZVN3N2xYRGRGTDZTYnpWb2RaK2tZSzFoVEJjcnFSeEpzVkhEa2dGdUtVYmk2?=
 =?utf-8?B?SGpDMmtnK3RiRHBpMzJaSkFZeGZyOE9waUhiTTdMVHo5a2w1TXlqenNmWS9p?=
 =?utf-8?B?TFFjODUydTdnUlU4RVcrL2NGM3hsUCtiRU9UNnM5cSsrVWdyQ1c1OGk4Qjgw?=
 =?utf-8?B?azl3YkFQYi8rSzVrenk4eDkzY2xNdnpXdnY3U3FYTmpsWUVSZnFYZ1F2aVZl?=
 =?utf-8?B?QzFBU3NEZDFOc3VHMy9neDVZalFzWnhsYUxIc3hmR0hSUUJQK285bUltR3ls?=
 =?utf-8?B?U0ZFRDd1eEcrMFlRbnBzV1BRa0VLd1dFbThIT3Mwb2VQUi8zWWN1OUx5WUNL?=
 =?utf-8?B?Kzl2Q2pRUTFuOFI1Zm0yaUxva0pjd2xjdHR3YStiNUV3UHNiZ2ZGMnBBa2xy?=
 =?utf-8?B?UGxRV1NhTDJSZ3AxWVMweURCVmVFWldkUjIyeUhZblBhQ2R1TUR0YW92SWp0?=
 =?utf-8?B?dloxS1prU1pmd1BFRnYwNkNrUjlkUTh5ZTVnSTBuQ3prNEQzMTVqS3RNM1g3?=
 =?utf-8?B?QnRrcGlSa1ErS3V6UnR0TVRDTFBYZWlrVjZDbTlOTUlhSkxtVWRxUlV1M2xs?=
 =?utf-8?B?bWdZVU1kdnkvcHBzeU5kend4S0lSQTNXcTZVRkozazBvUTNHaHpoWUUxR2VY?=
 =?utf-8?B?cStuaXltUEJIVVdSWENqQzlpNDU0d3BpR2pwTDBpUWhZZkxFTXZVekxIbzBL?=
 =?utf-8?B?Wnh1eGdZeUpYUCsrYWNZbWJsaTdZZG82amRTOE94b2tHTDlMZHhOdTQ2WHVJ?=
 =?utf-8?B?OXVFSUNJVUtKM0RKbkRjSXpRTXdmK2JCZStycGxBdEM2WFVqb2hkL2JzRzVi?=
 =?utf-8?B?LzBKeDRaTjZNanNlTGpkTXp1T2M3T2h3cHBQRUV0aW04bjdXZjdNN24rMzdE?=
 =?utf-8?B?VGx0d25hM0ZVZEVPK0JJRTdKclJOTHZnS0REbUtkcWJLWUhPVnNVS1ZHbkdx?=
 =?utf-8?B?ZWRTRUpFV2drbXFUOGJUci84QVQ2dDZtbldXZFUyOW9YNFFNbnB4a3c2ZVNa?=
 =?utf-8?Q?dpFxgdYzEagrnZEZvNhUK2uwSClpqgmwpgACLLNUQ9/X?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a59f3318-27f6-43cd-2e4b-08de16c3c65c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:18:43.8015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: auw0Js+1vBPakJJVq9RVyEqTx7XAZd6MZt6puZPQSK9lQcPInxTAzl5baXphluRugAGX1p7EhHsDqwKcPVeAjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6785
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

Boot the GSP to the RISC-V active state. Completing the boot requires
running the CPU sequencer which will be added in a future commit.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs         |  2 --
 drivers/gpu/nova-core/firmware/riscv.rs |  3 +-
 drivers/gpu/nova-core/gsp/boot.rs       | 63 ++++++++++++++++++++++++++++++++-
 3 files changed, 63 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index f23356bf3a2e..dc8c2179935e 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -605,14 +605,12 @@ pub(crate) fn signature_reg_fuse_version(
     /// Check if the RISC-V core is active.
     ///
     /// Returns `true` if the RISC-V core is active, `false` otherwise.
-    #[expect(unused)]
     pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
         cpuctl.active_stat()
     }
 
     /// Write the application version to the OS register.
-    #[expect(dead_code)]
     pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) {
         regs::NV_PFALCON_FALCON_OS::default()
             .set_value(app_version)
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 9c15cee3c0a2..afdf0fd67945 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -53,7 +53,6 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
 }
 
 /// A parsed firmware for a RISC-V core, ready to be loaded and run.
-#[expect(unused)]
 pub(crate) struct RiscvFirmware {
     /// Offset at which the code starts in the firmware image.
     pub(crate) code_offset: u32,
@@ -62,7 +61,7 @@ pub(crate) struct RiscvFirmware {
     /// Offset at which the manifest starts in the firmware image.
     pub(crate) manifest_offset: u32,
     /// Application version.
-    app_version: u32,
+    pub(crate) app_version: u32,
     /// Device-mapped firmware image.
     pub(crate) ucode: DmaObject,
 }
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 0b306313ec53..649c758eda70 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -3,8 +3,10 @@
 use kernel::device;
 use kernel::dma::CoherentAllocation;
 use kernel::dma_write;
+use kernel::io::poll::read_poll_timeout;
 use kernel::pci;
 use kernel::prelude::*;
+use kernel::time::Delta;
 
 use crate::driver::Bar0;
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
@@ -127,7 +129,7 @@ pub(crate) fn boot(
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
 
-        let _booter_loader = BooterFirmware::new(
+        let booter_loader = BooterFirmware::new(
             dev,
             BooterKind::Loader,
             chipset,
@@ -143,6 +145,65 @@ pub(crate) fn boot(
         set_system_info(&mut self.cmdq, pdev, bar)?;
         build_registry(&mut self.cmdq, bar)?;
 
+        gsp_falcon.reset(bar)?;
+        let libos_handle = self.libos.dma_handle();
+        let (mbox0, mbox1) = gsp_falcon.boot(
+            bar,
+            Some(libos_handle as u32),
+            Some((libos_handle >> 32) as u32),
+        )?;
+        dev_dbg!(
+            pdev.as_ref(),
+            "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
+            mbox0,
+            mbox1
+        );
+
+        dev_dbg!(
+            pdev.as_ref(),
+            "Using SEC2 to load and run the booter_load firmware...\n"
+        );
+
+        sec2_falcon.reset(bar)?;
+        sec2_falcon.dma_load(bar, &booter_loader)?;
+        let wpr_handle = wpr_meta.dma_handle();
+        let (mbox0, mbox1) = sec2_falcon.boot(
+            bar,
+            Some(wpr_handle as u32),
+            Some((wpr_handle >> 32) as u32),
+        )?;
+        dev_dbg!(
+            pdev.as_ref(),
+            "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
+            mbox0,
+            mbox1
+        );
+
+        if mbox0 != 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "Booter-load failed with error {:#x}\n",
+                mbox0
+            );
+            return Err(ENODEV);
+        }
+
+        gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
+
+        // Poll for RISC-V to become active before running sequencer
+        read_poll_timeout(
+            || Ok(gsp_falcon.is_riscv_active(bar)),
+            |val: &bool| *val,
+            Delta::from_millis(10),
+            Delta::from_secs(5),
+        )?;
+
+        dev_dbg!(
+            pdev.as_ref(),
+            "RISC-V active? {}\n",
+            gsp_falcon.is_riscv_active(bar),
+        );
+
         Ok(())
     }
 }

-- 
2.51.0

