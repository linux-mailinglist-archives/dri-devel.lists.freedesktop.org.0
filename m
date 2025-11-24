Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ED5C7F239
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 08:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366C710E1D3;
	Mon, 24 Nov 2025 07:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="euvDcV+i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010059.outbound.protection.outlook.com [52.101.46.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DFF10E1D1;
 Mon, 24 Nov 2025 07:01:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZcKtu/PtVIJ9UqZPGDwA+OEqU43wEmqzJCN8X5ia+URDKzb21KKkIXB8z17iH59WO+R0+mgzR6kZQPzB3VH6d6IPkF0k5RDt7hke9uE4qC8vETP3RCQ1U9WJiNW2QqbKSPrMZ9El4gLqVDMv2vr+H3xDHb1qUBYmD26v4sHWwlYV7TEBsBNtmVH2IyRToVTlQqOmOexzILAPWj2zbqWc6ny+WLOfI8Y0/X/V3syLh0pt6MrsuswlJ/+juax1JJ2fJGurUbyYpqyWRkP2/ZQeokzD3WwY5yOMV0L3SePTeiy1fyEVpvfElD+8cLeFKP3RxHmmRDnJ+Ek53N/cL2kvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V14oUz5k7iCKu4HSvDRk9UsDBRvxu+aorQBun2uDqJY=;
 b=apH/NUuxOxI1FgG2h7GAeJMD4FfbKrYWQ4nN29S+MjDgwJIVe19c6MzMSoIWFqlyBKWUlJSsu8gB8o9kztPcDkdLOkdcnkwBVqW06U848IOSCb36uK3zboGGBjB4bx/YZgCygnSGCjeJHfkS0gb3w9/X1ihj1biUTXwGMrNJDcZ/LQyTM9cvyairLrtE5CqYfswWDqYlWis0NVFmRFPV+xtP9cqppRhqG5710KcSch3PpHuWDWtnpRFI//2gmiK2dvV2RLDWnNLmtQRwMV/hUmwhnzBUDPpZvYBqOFNCGAqU9g24ulreD9IpIWo8pyP1hFxm/+o0mxoRTFVY1eIFRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V14oUz5k7iCKu4HSvDRk9UsDBRvxu+aorQBun2uDqJY=;
 b=euvDcV+iwCIpvN6sQ3++UbUugLsY1jrlMsR1e7A6XI5HIbdH7H5aXn1RF/OX2IVfch5/69JRHsq5gaEffnU3Di+o3oUnFc/gFW6wKexQACEY1VLRJ2EJPxygy9w2S3w+FmMsg5xlslHoRzffCs/8/x5N9m+6JCEvaKOvIGqc0jOwkIkxqHFgrnT5k3dQ5YXi1dTh68jMeDlft+JZxknbGcJqGRm/hD0GsgGHNO8AuYKC8TsmZfcFw3qzdOmA5/mo21OOlu65jCYwE6UhTvpzPpIiO3x56uu4TaP5ZxSRk06zGb4eKESIIdgzmykMRnxzih+wEynfiIaWq916N3KDNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB7483.namprd12.prod.outlook.com (2603:10b6:303:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 07:01:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 07:01:10 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Nov 2025 16:01:06 +0900
Message-Id: <DEGQCMSX1SGZ.2NQDPG5KUNA9D@nvidia.com>
Cc: <acourbot@nvidia.com>, <apopple@nvidia.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <jhubbard@nvidia.com>, <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, <elle@weathered-steel.dev>,
 <daniel.almeida@collabora.com>, <arighi@nvidia.com>, <phasta@kernel.org>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/3] rust: clist: Add typed iteration with
 FromListHead trait
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <airlied@gmail.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <20251111171315.2196103-3-joelagnelf@nvidia.com>
In-Reply-To: <20251111171315.2196103-3-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0002.jpnprd01.prod.outlook.com (2603:1096:405::14)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 368ce577-c815-429f-22bd-08de2b273f27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkM1VTFiZEZ5emtUZDJ2Q3Y5WllTSFNINFQ3RHJ0OGlMdWdDL3JkRkVSYStV?=
 =?utf-8?B?UEZ3N2dBN1I0aUxxWFNaZThlUlVJSThwaVYwQVVBSTJ6UmwyK0Q4Wm5BUG5l?=
 =?utf-8?B?OUNpSXpRdUpTb0psMjRFZHJwVnBZSXNEMVdocUVmUk5acjF6VzhRMzVVZXRI?=
 =?utf-8?B?Q0t1ajVkVEo3UVFaNXVHaDRZYXpPWmVwR24vY2hsM2x5Y0hLK1ltamc3RE1U?=
 =?utf-8?B?QmMvU3I2OHpUbktyaFdtSkVpUzR2MnVGV2VBbzZTSXY0R1ZlNUxYM203dGxI?=
 =?utf-8?B?b245NEJwaWhCZ1UyNnhDUVdpRG9KeEh4ZFRtV1kxWklzRVZCS2pWQkVjelEr?=
 =?utf-8?B?NU5HZktmbXM4TkhMK0MzdVBYU1hZQzFFYk4xZTl3R1dFOU5tNXltdi85cG9U?=
 =?utf-8?B?cEVkNzNVSkNIRmNqRlA5SENPMXd5M1pMeTZTNXQxNEsvWll6bTdXMk1XNHd5?=
 =?utf-8?B?K1FDVTNtNnUxRHhNblc2KyttSTc5cEdLaXNtc3BUc1U4YlNCYTA2L09XYkY0?=
 =?utf-8?B?Z3NxV2tmcnB0UTJIRnJIUEtFbUdUNHZQc1k5NXNmaTkwWnE5dG9aeHpEMWpP?=
 =?utf-8?B?Mm9iK0RNcG1sd0JsNy9iKzhPSEhrVFFKY0pPTUM5eG5hQXBjdHBJbkZUWW93?=
 =?utf-8?B?N2p2WU1XR2E2MjgyL3BlVHJRc0xOd1BwNGdnbXhrY3VoNFdnVVQ4VnI2TFVP?=
 =?utf-8?B?N1RMK1dldVBvM09maVNqNXp6YkZ3bC93Wk1MNWNTNDRTSkp1d3ZRek1ycWZ4?=
 =?utf-8?B?OGQydjN6ZUk2eXIyTU80aXlvSzE1QzJZYy9OTnRSRXFvaHErY2hEbTdPS0k3?=
 =?utf-8?B?LzVaSHBTbnRVaDhCRGF4aUhyTWZqdldMTkJZZkR0TWtoWXF2eXpaVGs5VGlF?=
 =?utf-8?B?MDhVVVZWSHo5YS9KOEtrK1k3anlBSWsvQkMyTzREWkxrd2h0bWU0MHUzaVlw?=
 =?utf-8?B?RFREZ1dpMmk2bDN3a1RWVmZRTW0vdUxPbVJuRHBFeWlFblAzRmxKWWVnQlpC?=
 =?utf-8?B?SXRMdHdXWHFDRElocGFQcUlLOUtlY3N1OXdWZWI1N1lwYm9UcjUySWxxamRZ?=
 =?utf-8?B?Vkhvb0lGYnFKc1U5QlE2bnpKOUY5Z2hTUHBTVE5CRnNaTjVuczUrVVhvWUUx?=
 =?utf-8?B?eE40elV5NW0wbzlXN0U5SHJyRUtiVGlnL1NPbGNnYWg0Ty9PRWRHK2I1NEwz?=
 =?utf-8?B?MFZhTUcvKzE0dmdSV212S1h1YjVOejFVMkdRTGY3ajZCc3A4U3lIb2VOelJm?=
 =?utf-8?B?emtpb2FzVU5jUWNvVlZ3UDVIdkd3ZjBYUjJwTEVjTlFTNW12RVUrNGpmWmVp?=
 =?utf-8?B?aE5Rd0xVK1RPelYxekl1NkEySGFhTHhTVTR0ZlNEWkVSbndaNGlCVWV2bk5Q?=
 =?utf-8?B?THJMZTIya0xRRnpyVUFkMnZENk1PRDQ3TUZScmR5eEdXUTdsaHErcktnTmUr?=
 =?utf-8?B?cE1HdXphNnJIcno0TXpmbzV2YTdpanpnVndCeXQycERvUWNkYUZaTm0xM2ho?=
 =?utf-8?B?c0tMS0h1M3FBNGQzLzRoQXFTQS94WEozUEdoN3VYcFRHa3ZHbkcyMGFMcWE5?=
 =?utf-8?B?anNqblgyY29pcFF5QW5FZWU5ME85R0x3VGgvUUZUTDB1SkZSUXpLVng4NENO?=
 =?utf-8?B?d3hYTFBYdEpxZEljVnhGNytYQmVRczBGVmhWNVU0TEZwczA1UVR0YjBMSmJ2?=
 =?utf-8?B?MmJEU0gxWVhKdGQ5YjNrZ3RQaTY3OUhLcDFaVW9DRjhuMExzMEQ3K1ZJUEth?=
 =?utf-8?B?djRjSFJUdzBTVXFxZ0pYVmRHNmhwRkhEWDY2MkVoeWlkdzBxUnRzbDdkZkFm?=
 =?utf-8?B?WCt2UzYxYjZJSVk2M3ZGZDVsb05DVzF6YVlyeDNZTGxYVWFiMHdxQ0JOc1B2?=
 =?utf-8?B?eXU2S0pyblJMM0NFNEtlMng3Y3lXT0s0MlI4eVRLc09RWHd6T09uYmNuOFVW?=
 =?utf-8?Q?nPzty5ZAsYErqJdmzM+6CF+N42ijBXMx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2Nqd0FXZzNpSzA1cGg5dEtIRnh2NXJldFZnTWtOaVhscHdUUUNHRmxKS01X?=
 =?utf-8?B?UDJ3anFkd21Ga04rT1drSzFaaWtmRFVLYzdDSmtwRmZ3VGdVcnBKTHFHS1o3?=
 =?utf-8?B?Z0FsWVM4ZG9lcEhKRnRUaWo1MVNGa3NzdVNCZnBYT0V3WXBSbXB5Tm9EUGJ5?=
 =?utf-8?B?MTMzQjE1ak9wUTFCcnVHangxRW1rdnYzSnkxUWFwS0xrWndsWFN1allkWGtE?=
 =?utf-8?B?SzJFdXcxTVozZzdLRThUL2pjQmJFbmRzaVc4OWZCb1VocGxaT3h0VFZqZ1E4?=
 =?utf-8?B?ZEYyKzc0b0lvT3Y5ZmUwcGxWR3dCNlMzbXByejV1c3FEZVNtdzBqem5Db0Jh?=
 =?utf-8?B?NlBqTlV5K3hhNlJFd0g2czZYTitqQ0srdTR4MlFEYlgvYUdIeXVYU2tVMURU?=
 =?utf-8?B?OXZnSEZSNGltSVpidGVIakkyd0tYM015RFM5L0hoZDF6c2xvMGk1YStSQWpX?=
 =?utf-8?B?cElXenBhUHppZFkwd0xvRTkvYitocjFhZVNtSDEvSWNXVXNTL1IwWVEvMTNx?=
 =?utf-8?B?N3piRmREKzI2UkZ2U0tGUTMxU2hhKytrSTQrbVNKbTdvR2cwTHpkR01BS0hM?=
 =?utf-8?B?VXFKM1lCV2JhVWZuR1RNSW43VjN6ejlIc2RidENKeU1NTFFqMmlBdi9OdEd6?=
 =?utf-8?B?ZDRyTlpCNmJwZ1FBZENKT09rVHdyanhFVm5qd2NNMUtnTUZpNy9pNHhoOSts?=
 =?utf-8?B?b0JFUXpySlRpSDg5TjQ5M2lOVWUyUDNucWE3dGdmNXJicmw1NitsUyt1bEt5?=
 =?utf-8?B?b1E2ZHgxZkZKMGp3K0xnMk0xMHFoNVVhY3NJRURNbkRvSHZIZEZ3VVNaZmc0?=
 =?utf-8?B?TTFSVElTdzRyS3VOWTZvMEwzY0hKRzNTeWlGbHB2UlBtN0ZDOHplQjdDTFRy?=
 =?utf-8?B?cGlDeW9IWkgyUk9VanRDb3I5REZTVlI4b0xFbW9oeDdYQk1VdnZRYnViVm52?=
 =?utf-8?B?T0RCbFd3UTdUWlFURWpQNytSMXlSWmt6Y2pxdXFueXJPaUZoVC9iVTc0ckg1?=
 =?utf-8?B?Qy9iQnR0emNGNGR0MDBSaDFnejNjMEd0QjZBTGlHQUxZaGdXT0JKd0J2Wnha?=
 =?utf-8?B?N1BBdEo0U0tGa0dpNnFGTEFjYkRtaW1rZHBQbkVuM2R6dVprT2tvcjJQV0ND?=
 =?utf-8?B?MFRTU0FZODRDN0xGSzkxOFhnVUI1YU9ZOWwzTGJWcEpJUldQZzFkamNQN1RX?=
 =?utf-8?B?dlV6OXJsbC9TOFdLZGQ5TXlPVGYvby9mcExkNjYra0RXU1ZDdExvTGZoUGdj?=
 =?utf-8?B?MWpUaURJVmtWNDVYU1B2UXRucWhGbWp6aEcrNjg5dzh1RGVTS1lJb21aTUN3?=
 =?utf-8?B?TnZidzh2NXZnTU1sRGpNOU5MR1V1WmNXSEhJNlNUNjcvYjRLNThQaWx0M0o4?=
 =?utf-8?B?aXNNYVJaQ0xYVTBRdUVlMkFDZ0s3cWpucXViTzN5eHBoaXUvSVNQdHB2VTZM?=
 =?utf-8?B?VURDZFdyb2tJRXdTK3plVmdYK1FZdXJ5TnNaZkYzWlFXSzVmL2RsRGIrUnN5?=
 =?utf-8?B?TmJ0ME9EVFZmczJueW1LZU9OTjQ0dmxSeURCUktiVVh3MEJ4eTEzdG5XSnBs?=
 =?utf-8?B?MjN5N1hKOFVUYjFIYllsYWJtOGNVZmtaZzZ2SmcwTzl4TG9XSFM2TCtYWUxP?=
 =?utf-8?B?dTBPTXh6Q0xVb3g1dzcxVS92ZVNKbVIwOElndFI5TkJRMkVYdFV6WDJFVHhl?=
 =?utf-8?B?Ums0N2pEanpXaEthZmptbFNOeXg1WUhPNVFOWG1IZ0FacTI2WkpkaldHSXVo?=
 =?utf-8?B?ME5ieStvZ3N3STlWSC82WGszRnRFOFpPYURPQ1BmamlvLzRNa29pbFZOSEpq?=
 =?utf-8?B?ZWtoMHhpTkQ4WE9VVmNhUndpSHpnY3d6dGZyRkNYd0RiZDh0VGJqbnJQcmlF?=
 =?utf-8?B?Slc3RGppeXJSQUVBQWpVRDRTaU45TnlmYTFrbUNDRzBlVUdMWTA2ZEMyK2Qx?=
 =?utf-8?B?QlJXcE4wVHdVWWhHL0J3a2JacmpvL3B6R1hhcnh4VFk3ZExMU0d5c3FOUXU0?=
 =?utf-8?B?Q1kyU2pJdHNmbDVqaDNEN090REdENWdqd1BXSThxa0JhM1lxUk1NWk45UU45?=
 =?utf-8?B?VHNBVjRYZE9DUDVEMVpXNXZwMUljNWZJbVRlaGwzMHFNaXFvZitFQzZFQ0s5?=
 =?utf-8?B?QWk2L0p4blgvV3AwTHVoNWE5T0pKMUtJbmNEVm5ETFgzclM2ckJaQzA0dmlO?=
 =?utf-8?Q?/FcMyvTs9+CJaopLGmTCFROGHQLx+GVC3lA7QRdjVzxW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 368ce577-c815-429f-22bd-08de2b273f27
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 07:01:09.9943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yM3zTmpBbls4/1+UQCUY9Modjyl7bAEm9SPB1FGkK6ct8ZPAYKl/GuKLgU21ibbYrqqB3nZE37oB1g/b9CX3MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7483
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

On Wed Nov 12, 2025 at 2:13 AM JST, Joel Fernandes wrote:
> Add an iteration layer on top of the basic list infrastructure,
> enabling iteration over the actual container items.
>
> Enables users to iterate over actual items without manually performing
> container_of operations. Provide macros to make caller's life easier.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  rust/kernel/clist.rs | 210 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 207 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
> index 5ea505d463ad..01b78ba157a1 100644
> --- a/rust/kernel/clist.rs
> +++ b/rust/kernel/clist.rs
> @@ -2,17 +2,104 @@
> =20
>  //! A C doubly circular intrusive linked list interface for rust code.
>  //!
> -//! TODO: Doctest example will be added in later commit in series due to=
 dependencies.
> +//! # Examples
> +//!
> +//! ```
> +//! use kernel::{bindings, clist::Clist, clist_iterate, impl_from_list_h=
ead, types::Opaque};
> +//! # // Create test list with values (0, 10, 20) - normally done by C c=
ode but it is
> +//! # // emulated here for doctests using the C bindings.
> +//! # use core::mem::MaybeUninit;
> +//! #
> +//! # /// C struct with embedded list_head (typically will be allocated =
by C code).
> +//! # #[repr(C)]
> +//! # pub(crate) struct SampleItemC {
> +//! #     pub value: i32,
> +//! #     pub link: bindings::list_head,
> +//! # }
> +//! #
> +//! # let mut head =3D MaybeUninit::<bindings::list_head>::uninit();
> +//! #
> +//! # // SAFETY: head and all the items are test objects allocated in th=
is scope.
> +//! # unsafe { bindings::INIT_LIST_HEAD(head.as_mut_ptr()) };
> +//! # // SAFETY: head is a test object allocated in this scope.
> +//! # let mut head =3D unsafe { head.assume_init() };
> +//! # let mut items =3D [
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! # ];
> +//! #
> +//! # for (i, item) in items.iter_mut().enumerate() {
> +//! #     let ptr =3D item.as_mut_ptr();
> +//! #     // SAFETY: pointers are to allocated test objects with a list_=
head field.
> +//! #     unsafe {
> +//! #         (*ptr).value =3D i as i32 * 10;
> +//! #         bindings::INIT_LIST_HEAD(&mut (*ptr).link);
> +//! #         bindings::list_add_tail(&mut (*ptr).link, &mut head);
> +//! #     }
> +//! # }
> +//!
> +//! // Rust wrapper for the C struct.
> +//! // The list item struct in this example is defined in C code as:
> +//! //   struct SampleItemC {
> +//! //       int value;
> +//! //       struct list_head link;
> +//! //   };
> +//! //
> +//! #[repr(transparent)]
> +//! pub(crate) struct Item(Opaque<SampleItemC>);
> +//!
> +//! // Generate the link type.
> +//! impl_from_list_head!(pub(crate), Item, SampleItemC, link);
> +//!
> +//! impl Item {
> +//!     pub(crate) fn value(&self) -> i32 {
> +//!         // SAFETY: Item has same layout as SampleItemC.
> +//!         unsafe { (*self.0.get()).value }
> +//!     }
> +//! }
> +//!
> +//! // Create Clist (from a sentinel head).
> +//! // SAFETY: head is allocated by test code and Clist has the same lay=
out.
> +//! let list =3D unsafe { Clist::from_raw(&mut head) };
> +//!
> +//! // Now iterate using clist_iterate! macro.
> +//! let mut found_0 =3D false;
> +//! let mut found_10 =3D false;
> +//! let mut found_20 =3D false;
> +//!
> +//! for item in clist_iterate!(list, Item, link) {
> +//!     let val =3D item.value();
> +//!     if val =3D=3D 0 { found_0 =3D true; }
> +//!     if val =3D=3D 10 { found_10 =3D true; }
> +//!     if val =3D=3D 20 { found_20 =3D true; }
> +//! }
> +//!
> +//! assert!(found_0 && found_10 && found_20);
> +//! ```
> =20
>  use crate::{
>      bindings,
>      types::Opaque, //
>  };
> +use core::marker::PhantomData;

IIUC the typical order of imports is `core`, then `kernel`, then=20
`crate` (here crate =3D=3D kernel though), with a space between them.

> +
> +/// Trait for associating a link type with its container item type.
> +///
> +/// Implemented by "field link types" that are `list_head` links embedde=
d in intrusive
> +/// C linked lists. Each link type is unique to a specific item type and=
 its `list_head` field,
> +/// making it possible for an item to be added to multiple lists.
> +pub trait ClistLink {
> +    /// The item type that contains the `list_head` field linking to oth=
er items in the list.
> +    type Item: FromListHead<Self>
> +    where
> +        Self: Sized;
> +}
> =20
>  /// A C linked list with a sentinel head
>  ///
> -/// A sentinel head is one which is not embedded in an item. It represen=
ts the entire
> -/// linked list and can be used for add, remove, empty operations etc.
> +/// Represents the entire linked list and can be used for add, remove, e=
mpty operations etc.
> +/// A sentinel head is one which is not embedded in an item.

This comment changes, but its substance remains the same - let's get its
final form in the previous patch?

>  ///
>  /// # Invariants
>  ///
> @@ -69,6 +156,15 @@ pub fn iter_heads(&self) -> ClistHeadIter<'_> {
>              head: &self.0,
>          }
>      }
> +
> +    /// Create a high-level iterator over typed items.
> +    #[inline]
> +    pub fn iter<L: ClistLink>(&self) -> ClistIter<'_, L> {
> +        ClistIter {
> +            head_iter: self.iter_heads(),
> +            _phantom: PhantomData,
> +        }
> +    }

This looks very dangerous, as it gives any caller the freedom to specify
the type they want to upcast the `Clist` to, without using unsafe code.
One could easily invoke this with the wrong type and get no build error
or warning whatsoever.

A safer version would have the `Clist` generic over the kind of
conversion that needs to be performed, using e.g. a closure:

  pub struct Clist<'a, T, C: Fn(*mut bindings::list_head) -> *mut T> {
      head: &'a ClistHead,
      conv: C,
  }

`from_raw` would also take the closure as argument, which forces the
creator of the list to both specify what that list is for, and use an
`unsafe` statement for unsafe code. Here is a dummy example:

    let head: bindings::list_head =3D ...;

    // SAFETY: list_head always corresponds to the `list` member of
    // `type_embedding_list_head`.
    let conv =3D |head: *mut bindings::list_head| unsafe {
        crate::container_of!(head, type_embedding_list_head, list)
    };

    // SAFETY: ...
    unsafe { Clist::from_raw(head, conv) }

Then `conv` would be passed down to the `ClistIter` so it can return
references to the correct type.

By doing so you can remove the `ClinkList` and `FromListHead` traits,
the `impl_from_list_head` and `clist_iterate` macros, as well as the
hidden ad-hoc types these create. And importantly, all unsafe code must
be explicitly specified in an `unsafe` block, nothing is hidden by
macros.

This approach works better imho because each `list_head` is unique in
how it has to be iterated: there is no benefit in implementing things
using types and traits that will only ever be used in a single place
anyway. And if there was, we could always create a newtype for that.

Also as I suspected in v1 `Clist` appears to do very little apart from
providing an iterator, so I'm more convinced that the front type for
this should be `ClistHead`.

>  }
> =20
>  /// Wraps a non-sentinel C `list_head` node for use in intrusive linked =
lists.
> @@ -188,3 +284,111 @@ fn next(&mut self) -> Option<Self::Item> {
>          Some(self.current)
>      }
>  }
> +
> +/// High-level iterator over typed list items.
> +pub struct ClistIter<'a, L: ClistLink> {
> +    head_iter: ClistHeadIter<'a>,
> +
> +    /// The iterator yields immutable references to `L::Item`.
> +    _phantom: PhantomData<&'a L::Item>,
> +}
> +
> +// SAFETY: ClistIter yields `&L::Item`, which is Send when `L::Item: Sen=
d`.
> +unsafe impl<L: ClistLink> Send for ClistIter<'_, L> where L::Item: Send =
{}
> +
> +// SAFETY: ClistIter yields &L::Item, which is Sync when `L::Item: Sync`=
.
> +unsafe impl<L: ClistLink> Sync for ClistIter<'_, L> where L::Item: Sync =
{}

These implementations should also be automatic.

> +
> +impl<'a, L: ClistLink> Iterator for ClistIter<'a, L>
> +where
> +    L::Item: 'a,
> +{
> +    type Item =3D &'a L::Item;

This is going to work well when we want to parse lists read-only. But
I've also seen in some comments that you were considering supporting
addition and deletion of items?

In that case we will probably want to return some sort of guard type
that derefs to `Item` (similar to a mutex guard), while also providing
list management operations. We will probably also want distinct types
for read-only and read-modify behavior. I think this can be done later,
but better to keep this in mind when designing things.

> +
> +    fn next(&mut self) -> Option<Self::Item> {
> +        // Get next ClistHead.
> +        let head =3D self.head_iter.next()?;
> +
> +        // Convert to item using trait.
> +        // SAFETY: FromListHead impl guarantees valid conversion.
> +        Some(unsafe { L::Item::from_list_head(head) })

More idiomatic proposal:

    self.head_iter.next().map(|head| {
        // SAFETY: The FromListHead impl guarantees valid conversion.
        unsafe { L::Item::from_list_head(head) }
    })

Note that since kernel lists are bi-directional, you can also implement
`DoubleEndedIterator`!
