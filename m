Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112A2B439FF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 13:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC3110E9F3;
	Thu,  4 Sep 2025 11:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VJ2xwthp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBF610E9F3;
 Thu,  4 Sep 2025 11:26:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGZA1anPpB07LWwGdg35roOKB0CXJKu4py5h8XjN8haKRgkb+rB4LrNJ++pCS/hbexhEYp2cqEipdcInop3xA8QPsy2y/ygxF2qMhGY1BPuhcWfUwSzQghqNWXnXnyAvWTdCnYUxC5OaqZcyPekx5tJhaM+1UO12mtUhiT5MnaBdTt08T1Jq1qHwushKpx+5DKw7T8uBIneaOrCfIdfGNmrSi1e7CE1sbuisLeSQtmILR/jIF7yNOcZEpvCPc4TGMxfhcVIBt8ot6EFxxFXc5Csrdx6BP61xobeW6GPx1hrchwkQn8zFHk8D9CNMQJysEGWE+h/hzPbXlwjbp1MCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/u4x6WK+zFniixH1WEjTFdxr9C/9X28mlYqUCHTd2c=;
 b=I3s6ZApuiuNDLIt1phX/RKb1AmaJhCREsvh5Wu33x/JK4gh4myDIorMDVprkUHyF9ZRWyD3mOV6hUSCnt9nnXQ2moakT3aydDy0dmrkGl88hbZNIOGrKAl/+Z6gssanbG0G8Zucf0DufxGXA+dJenssSGEfe7emRW9iTCNi8BpxmHQRx114dBVX1MSXKguF09ZuuYe5f6fsfdFf9c/EJJlN/HIMkuzcTMhJZ50L7GDZGECmJ88pYlXZ6PGJ6Ig3mCJdafeUVlS3MIL32XSMBNOZUDiRqTes98RZLKH0jNlTBE6r5bxuG6/C4Ss6RUMiaf25YL6g0GO0lVLHSvJsF4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/u4x6WK+zFniixH1WEjTFdxr9C/9X28mlYqUCHTd2c=;
 b=VJ2xwthp05v6P4RSq09hWkzdP2K4PHhccQJCLhK9v4SGlTju1+ZJenrrc9Ih7pUjWZyTe5rNxaAbUUJxH78L7yR7gdb4znZ3vDsop249632RkBpD2cHkbjc9Sw8A4JPBB3XRJjGEBNEN58l5+zBQhYFtYWSSPoCQLMh0kuvmqIVAyVfaKSjgcucQG8yGlWTYipRJSXXh/nawTUVDeh7L6ypz7VUXyqnr++p+lktrLOuEhl0HmZBHSYwFwbQjc2xduHPHmUM5OZZiG4K9VJ3IKP/Pw2zmynvLjNXvIUNxFZlNmloYmI4kN70zqxfYRngIHNIGR4lxloZDIsHsTPWWeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6928.namprd12.prod.outlook.com (2603:10b6:a03:47a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 11:26:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Thu, 4 Sep 2025
 11:26:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 20:26:34 +0900
Message-Id: <DCJZ9RJMI55S.38IB570PFGM7V@nvidia.com>
Cc: <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 05/10] gpu: nova-core: gsp: Add GSP command queue handling
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-6-apopple@nvidia.com>
 <DCJQ1JPNP66D.237HVGM4L0UPZ@nvidia.com>
 <6vewssmsixzbghivrehmng7pyapmidh6nx5qjd2bzfr2orgeob@p2cni6gj75l3>
In-Reply-To: <6vewssmsixzbghivrehmng7pyapmidh6nx5qjd2bzfr2orgeob@p2cni6gj75l3>
X-ClientProxiedBy: TYWP286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 595642ef-3c64-4b19-fdc4-08ddeba5e9b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|10070799003|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OE5aV1RGZHRzZUE0eWRjR244bE15a1dZV290cmVLUE1NZTk2SHhuN2djd0dj?=
 =?utf-8?B?WHA3UENKbys2UzNwSkNmNDIySVM1V2pEbURnQmZ3N0lKVDFmTy84U2VyY0sy?=
 =?utf-8?B?SVFoN3FveVZ4akd0bGpRLzlZRTRVZXRyY0JqQkIxR1MrUFMwTWRsZG11RUUw?=
 =?utf-8?B?SUFLa2NMejRUc3M4eVpPQ0NTcFhIQWgwRUNONlBEZkp3TkkrSUtWWjR3TCtU?=
 =?utf-8?B?Z0FLQi82bVo3OXo4R2Z6S2tMaEhtVXJ5QzE5V3M1eWU5MC90cTk1a1JHQkFI?=
 =?utf-8?B?dXVkY2FOSU4zT2l4NmRwczVpT2RuTGhHQWdPclhsRXBjS0J6cVFrS2lOMCsv?=
 =?utf-8?B?Yjl0ZG5JamwwT01EWWRnQjM1NGZUYkNxd1BLQkt2dDdCY2tIRDZSSXYvOUwx?=
 =?utf-8?B?ZXZ5SWZBbk9mcmtyVHZwb1dVUWNLMXhtZlROOEY1Q0MvdXJiTGFId0ltc2tk?=
 =?utf-8?B?RG45RzRudXdyWW14cys3ZUN4ZXpBS0QwZHZqL0h2YkFNUjFQTU5YaVp1eUJI?=
 =?utf-8?B?WTEvOU5sMVlSdU5pRWR0ckh3VEtTbzMzWmkrTFk5RmNrZzAvTXNTUlROdFJE?=
 =?utf-8?B?dlkrelljQStGVTY1Sms4dTg5M3RkdmhMWXpYbEE0YzBHKzhJKzFhekRIN0Yv?=
 =?utf-8?B?dWZlYUw2YVpVL1BFRFZ6VFg4cUdyNzlRM25tNVlEWUpLK2V5RFR3cXRtK1RD?=
 =?utf-8?B?N2dGRlRpcDJ1WjVUS2hQUjhXMnRIT2xSNlhVSDZUdkJYbFNaWWdlekhZWTQ0?=
 =?utf-8?B?QkxCaXd6RlBoOEMzRElndGNVd2NoNWthTWFRY3pJcGppcUx2ZHI5VTNoSVRU?=
 =?utf-8?B?bElLODc4QlNkb3BqV3JlV2tvUHpoT2EyQmtWT1kxWTRpZEFlMU5OTTJXWk1y?=
 =?utf-8?B?dURYanppd3AzdFZuOW9NRHBOTU5sQXEzRXJHV25Fa05MMnRkSXRKM010UWJH?=
 =?utf-8?B?QXFtbHBaanhxcFk4cER1bXJIQjdmb1hRR1NIU0VwUlk4QnNZK0pjSEFqb1ZU?=
 =?utf-8?B?RDBNTEVDQzNHSEg0MXFhdHBNV09VUkIwZTltZzhsTy9QbWhzUjhJL3NRL28w?=
 =?utf-8?B?ZlB1WXdHdUUwb2ZXbjF4QzdoREhUMjJseUE2Ui9MWnBpWVFJUERBVU9ZTzZV?=
 =?utf-8?B?L1ZQUUUxZ0RGa0lLTmNyN2d3YnQzamJvSlU1eGhKdWd4SzhzeVlyL0pReHc1?=
 =?utf-8?B?ZXRtcFhaWWdYeFo5NkxRSnVjODl2OGRvU2N0Z29oL291ZXdLYmNxaTIrQ3Q1?=
 =?utf-8?B?WU5rOVByNGNESXdaNkV3RGNYWFdOQ2FrU0tXNzg4dUNYd0d4RWdnYVhGYnB1?=
 =?utf-8?B?cjNDRDIxUlp1YytRNXVqalhaOXBiU0NYY0JEZnU4U2loaVRFUjlLZU1lamdi?=
 =?utf-8?B?dVRud2FtcTJCK2ZCMFZVd0VlT010ZXlmd2Y0eHV3Sm94WEt2RGUxWDlDUnZm?=
 =?utf-8?B?Z3FkelFhZ1gvbVpRQlQvK0dWYU02TXVhTFhoR1dCb05kRjMyamROK09UNnBr?=
 =?utf-8?B?M2hwMGozNy8yNEZzMWZWS0xwTkpTK3o3Q1A4T3hHZ0R0VksyQ1ZmWVNjSmxD?=
 =?utf-8?B?M2trT0laZk10N2psbWorTWduOFhvcUVyYU43M25wUHBmSVhFdXBOTXJUUHdX?=
 =?utf-8?B?UGVhL3Z5QVE2a0lLNEQ2aWI2U3h0bUxBeEhWMGtzSVRydG10L1lMVkdqMUMy?=
 =?utf-8?B?cVd1dng5V21JelhDQzFLRmlYNlptWlovQkl4WWdpcFBSV1RhM0kyaExyY3Z5?=
 =?utf-8?B?aGdRNGlmM2syRzVxM1dMUzFRVHdrRnU2dkkxbXkwTWpNdFI5VXZHZEJMSWVk?=
 =?utf-8?B?T3pnSFBVU0xCSkdxdjhkSWNNZmF1UE5KV2JEd2J2ejc0VktzeWwxZWdySVcy?=
 =?utf-8?B?dStSckxpUE1TNVhmNUo2RVhMRWszVHhTUndub0YvT2tsZ1RrQzc0UHd2N0Fw?=
 =?utf-8?Q?h6swY4jwzXw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(10070799003)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2F0R1FLY2NpeXNaY2Foc0RtQm81UDVZVUgzLzNjWHhsazdnSUlkZWQ1Sm9N?=
 =?utf-8?B?d1AwSmljUElSQURPWVIweDVwTHZQSlRsOTlSVTVCcmEvNkJVZXlnd2R4aVRk?=
 =?utf-8?B?K2Jvb25OZTBZNzVSRWFrbFRxVk5vNjdCMkJ4VHdlVjBsMlhBNVlJNkQ0WGY0?=
 =?utf-8?B?Sm05bW5QR29UYUh4Y2tkTkNWMXNHN2NtMXR6aW85L2YvZGJFTU9sc1F6TzVW?=
 =?utf-8?B?UTVIMTNQR1BJR3lWZXhYb24zSXd3bkRPbW9tMkZNZS96N2dSZlRobVgzTnUw?=
 =?utf-8?B?VWhneXN3WnU3U1lybWRmVE05ZXJicWtmTVc3RjNRWUVONlN2TU1MRGpOWVVJ?=
 =?utf-8?B?US9FcG5oQ2ttL0dsVll5ellDcVFlOGorK0tzQ0VxNSs5TkxTaWNVZXhzQUFY?=
 =?utf-8?B?ZmtKNGo2clFkLzYyNkQ3ckhBc29PL3gxTmlhdmJRc1c4MytyZ0luSU81NDhY?=
 =?utf-8?B?OW9rMXB1TGNUVkd2Wm1vcEhJQkcvSm12dThaUHd1bk9IWFRzejJmdkxWR2ht?=
 =?utf-8?B?V0dmc2wzVGxlQXg4MmZCTlRIYUtHb2c2WkhuZSttQUFYQUt3ZC9nZEJYTFNn?=
 =?utf-8?B?R25Jbk1rWmkwbGp3eFRPVCtYUitNTEhjV0F5cUJwaGJ3REtvZHd0M1dyWWpF?=
 =?utf-8?B?dDE4TXVDMkNUejRmZG5YUStQQlBmbFJWU1hpSGp3UStRdVkrMWRUVUxOMXJL?=
 =?utf-8?B?b2hIamlnc0Y3MmpzQ3VCT0NWa3V6RWt6VXNuVDZOd3NtencvaUt2WnR6NXhx?=
 =?utf-8?B?dkJJeS9kWFZZc3UzWGlxa3o2akkwUjk1Y25yaEV2elBXRVdteGFaY3FvcCtK?=
 =?utf-8?B?M01DZ0dLTE40VTJPNTVRSEVhS2diejZSOFAvb2Z6Umw2Mmg2dDdlTVpiakFu?=
 =?utf-8?B?a2N5ZzlKUjYzYi9iTVBPQS8rWjVWb1lNMm1JY09HSnBEb3M1dEp2Rmhab1N0?=
 =?utf-8?B?M2dCY011QUp5QXJ0NGl0TjV3dEIrU1RyQmR5ay9yN1V3YkVsdnh6bFJsTk9n?=
 =?utf-8?B?ZVpDNXpjTkVsYWlUOUpRUUU0WEkzemR0ejhlSDFJNnpHNEk1ZmszcTM1L0Rl?=
 =?utf-8?B?QlFSWmxBbFMzRWdLWllWTHkrTTJGVGljU1I0djFCUkYzKzZIMlZCSXlZQlh2?=
 =?utf-8?B?Wjg5RXBPVmlBS2RsRmJmWURBeGlwM3FYQTJaU3BpaUxPZWsrQ3FWUVJvK3Aw?=
 =?utf-8?B?d1ZLc0dOb2tZUTJuR1A5TjdQYXV6QVpseThMVnlQU2U2SlNyTlc1d3cxQm1S?=
 =?utf-8?B?RXFBamlxVC85V2tWaGFqTndMWk5aR1k1NjcvRUZCa2o5ZUVMd21nS0s3ZnlD?=
 =?utf-8?B?K3VJRVpieERyeXM0dEtDekd2RXphV2dZa0dqeHltYkVrS0ZrS0Z1c2xLeWdQ?=
 =?utf-8?B?QkZjbTl6amhLbkY5c2hldDlyZWZDK2hUYzlrWUhiZVVuRURtZXRRRlFXbm11?=
 =?utf-8?B?c0VmeVN2TXZSZGpOcTVNWGdzVEJmdVVuOXZ6b2xXNXNLd092cjRIaWF0N1M5?=
 =?utf-8?B?cncwTVdWQjBEcFZxa1BDUUZ6bVQzeGJQeDFNUUo1bzdpOFBaZit1ZERTU0d3?=
 =?utf-8?B?OGdLdmZXU28yUWE2OXp6anUrL1l2VVJCa3piOGUrN1VSdlNXYXRCNis5c202?=
 =?utf-8?B?VCtxZ2VKV0xxckplbFc1MDd5YndvckMzTUg5RFhCMWgwOUsyQW0yTHBqOE1D?=
 =?utf-8?B?MThXdDRBVFgwTXBtUDZyQ1hBRDM1Nmt5TERTcXhKaGNId0MzR3FHUGx0S3Bu?=
 =?utf-8?B?a0M2bWVQbVFXMUIvb0pTVlpMZEZHVWdiVFJqODJEck1ScW5hSkcrSkVvRUNn?=
 =?utf-8?B?VUg4NXhpaHRIeno4bkd1OVY2MExXMUhucXJqdU4yQjJxVkpraERzZk1HdWo1?=
 =?utf-8?B?YldDRk83NW12TWlsSkFaR1JIRXU0eTRBZEdQZ0ZmTHBMQ1ozazFraHhQN1g0?=
 =?utf-8?B?b2YwSEdsM1RXN3dRZ2w3ZjZVTHBpNHhlWFhob2xDY0FyL1o0UGVvcXExUWtt?=
 =?utf-8?B?S0Rhd21GNWxURGlPZEtDWDdEUno5SzF0RTJUdXJKVUV3MW5pTERPYUp1L29z?=
 =?utf-8?B?Nm5NcTRxWFpveC9EelQxS0Fkc1VnNVMydm5CRVlvZG51RmtNTW80ekwvYnRL?=
 =?utf-8?B?bmFUbGhYcjN3Yy81T3RvRTBrdys4a3ZOOXRPcmloclBSdmMra1lPRnZVdHFa?=
 =?utf-8?Q?9ZhSg8jXII8STRCb/GkcsREolz7ZnNwH0fgNzpUIiNKI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 595642ef-3c64-4b19-fdc4-08ddeba5e9b5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 11:26:38.3778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Cq76Brir75xXoa/hoSs65/E4THuTqh1rMIfTpk4zogQgHi6Q6KPHnyQ6kjQc0/77NY0cHmgZmUBykm0fmDfWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6928
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

On Thu Sep 4, 2025 at 3:57 PM JST, Alistair Popple wrote:
<snip>
>> > +}
>> > +
>> > +// This next section contains constants and structures hand-coded fro=
m the GSP
>> > +// headers We could replace these with bindgen versions, but that's a=
 bit of a
>> > +// pain because they basically end up pulling in the world (ie. defin=
itions for
>> > +// every rpc method). So for now the hand-coded ones are fine. They a=
re just
>> > +// structs so we can easily move to bindgen generated ones if/when we=
 want to.
>> > +
>> > +// A GSP RPC header
>> > +#[repr(C)]
>> > +#[derive(Debug, Clone)]
>> > +struct GspRpcHeader {
>> > +    header_version: u32,
>> > +    signature: u32,
>> > +    length: u32,
>> > +    function: u32,
>> > +    rpc_result: u32,
>> > +    rpc_result_private: u32,
>> > +    sequence: u32,
>> > +    cpu_rm_gfid: u32,
>> > +}
>>=20
>> This is the equivalent of `rpc_message_header_v03_00` in OpenRM. The
>> fact it is versioned makes me a bit nervous. :) If the layout change
>> somehow, we are in for a fun night of debugging. This is where having an
>> opaque abstraction built on top of a bindgen-generated type would be
>> handy: if the layout changes in an incompatible way, when the
>> abstraction would break at compile-time.
>
> Argh! I guess I wrote that before we were generating the headers and I ne=
ver
> thought to go back and change that. Will fix these to use the generated b=
inding.
>
> I will sync up with you offline but I'm not really understanding the poin=
t here.
> If a bindgen generated type changes in some incompatible way wouldn't we =
already
> get a compile-time error? And if the bindgen generated type changes, what=
's to
> say the rest of the logic hasn't also changed?
>
> Whilst I'm not totally opposed to something like this it just seems prema=
ture
> - the ABI is supposed to be stabalising and in practice none of the struc=
tures
> we care about appear to have changed in the 3 years since 525.53 was rele=
ased.
> So IHMO it would be better to just deal with these changes if (not when) =
they
> happen rather than try and create an abstraction now, especially as this =
is only
> supposed to become more stable.

While I also hope we will achieve some level of ABI stability, I want to
provision a bit just in case this goal turns out to be too idealistic.

At the moment we are touching bindings internals a bit everywhere in the
`gsp` module. As the driver matures, that trend can only continue - if
one day we realize that we need a firmware version abstraction after
all, it will get increasingly difficult (and time-consuming) to shoehorn
back as time goes. It is much easier to do this from the start.

Also, having a proper abstraction objectively results in better code. I
will share the bits I have written with you for testing purposes, but I
think you will agree that this makes the GSP module much cleaner,
focused on the higher-level operations, while the lower-level code is
divided into easy-to-understand methods, right next to the type they
manipulate instead of being inlined as part of the sub-logic of another
function. Even without the prospect of multiple firmware versions, it is
worth doing.

<snip>
>> Doing so is valuable for clarity as well as future compatibility, as it
>> clearly shows in a single page of code how the header is used. Here is
>> all the code operating on it, in a single block instead of being spread
>> through this file:
>>=20
>> 	impl MsgqTxHeader {
>> 			pub(crate) fn new(msgq_size: u32, msg_count: u32, rx_hdr_offset: u32)=
 -> Self {
>> 					Self(bindings::msgqTxHeader {
>> 							version: 0,
>> 							size: msgq_size,
>> 							msgSize: GSP_PAGE_SIZE as u32,
>> 							msgCount: msg_count as u32,
>> 							writePtr: 0,
>> 							flags: 1,
>> 							rxHdrOff: rx_hdr_offset,
>> 							entryOff: GSP_PAGE_SIZE as u32,
>> 					})
>> 			}
>>=20
>> 			pub(crate) fn write_ptr(&self) -> u32 {
>> 					let ptr =3D (&self.0.writePtr) as *const u32;
>>=20
>> 					unsafe { ptr.read_volatile() }
>> 			}
>>=20
>> 			pub(crate) fn set_write_ptr(&mut self, val: u32) {
>> 					let ptr =3D (&mut self.0.writePtr) as *mut u32;
>>=20
>> 					unsafe { ptr.write_volatile(val) }
>> 			}
>> 	}
>
> Yes, this makes a lot of sense although I'm still not seeing the value of=
 the
> [repr(transparent)] representation. Hopefully you can explain during out =
sync
> up ;)

This type is shared with the GSP, so we must ensure that its layout is
exactly the same as the C structure it wraps.

