Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DC8C8A951
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 16:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2639910E65A;
	Wed, 26 Nov 2025 15:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SpfUEvde";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010035.outbound.protection.outlook.com
 [52.101.193.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5681310E010;
 Wed, 26 Nov 2025 15:17:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvljQI9Ln1HCd38TN6kc9JJweH4/AsA7GpumlrJ2UT98hnRTwEMZXpjJGK7JvCwUQpSZ+pHAbYqH9Fme3UnlE8LfPhU82dKqvUePQl7X/6yBRLy+Qjn69az4+3WZsEnGXPdulnYRYqXMZC0UVpr4bE/BG7c32O4UfNffkwY+Zy9X4XXncbT5mt7lAY9yI+milZmoQ3etzGGQjMUruUgoPRpRydCW8R9sH0Q++Y8DHACcL02kIx0LSjBOm1KiJj/Sr0On9XWozBULRz9zfFnvOE7eGhzabwzWrqDAFANUgAKsbRKMjNIyT+St44icbnHf2+1zGebE0S7dYgiABxRJaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QiwUTwZ02EzofwNI3a+x732i6LgGSwvHLgDyOmYTH5U=;
 b=YONB+dcNh37q3BpEZteArAdLbYIaIC2SBCbTDlemDPNU2jTKj1YnzgUqNwCWhTws75/GkVQwneYoFmryLTOv8RiST0YFx1LqY9S5VGYQ1xKKscDg43DCLWtG+3DdbTpjpZ1KDpVAQ5lswKDz28+muRXBXU2hZJ8Y96b8QZz+ox3hf0BwYSRbl93TAYvHtnfaBIba4cUrb/90366Q/dllk5EImEknfjNP7fTYIlP6+D0wxRgjresE8ItOmgsqf1YdXb5TY40c/qsBNkEv8vl8tvk62f6ofu9z/WvWEJ6gdxrVHiTyn1ASM8LDaUj+36YGm9ysOWL2/Hih0zUkrgYmwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiwUTwZ02EzofwNI3a+x732i6LgGSwvHLgDyOmYTH5U=;
 b=SpfUEvde3oZ1t6NWIe5/YeDahIYWgYaihRZZ0k+FrwgCQY/gHfE3UB7S38hI1N3umz6k80D8rlj4jDMetUNTkDDyepVYYx0JeBubv3ih3naUsLXZLMlNIMhIHytJCUYKW1V8toNlCRH4oe1w8olMUpzAZ4bIp4Yq9rXggjX3I6gulb8cwGXcdLSCz+uUFCWXctHA0cB2w9+6sd5RIATVjwK2YU7KfIgwk0C6wOEUDLplv5igK9GLJS3KZBtvDqYeGHaKZrTH7lMpaK/+JOroBUhHCkSXzd93ZrOGbSBYjZIXr9C9rZn56Q+iHDJNDY7cHu4PKM/CdrIXwctJYdi6Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB6481.namprd12.prod.outlook.com (2603:10b6:208:3aa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 15:17:43 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 15:17:43 +0000
Date: Wed, 26 Nov 2025 10:17:42 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: Dave Airlie <airlied@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] gpu: Move DRM buddy allocator one level up
Message-ID: <20251126151742.GA3028@joelbox2>
References: <20251124234432.1988476-1-joelagnelf@nvidia.com>
 <f73e4536-ec89-4625-96d4-6fa42018e4e4@amd.com>
 <CAPM=9twe3xcVBgrNCT+1_pGECPL-ry_aA2dxBwbKVeai4+S7AQ@mail.gmail.com>
 <24d4f02b-8ecd-4512-a1f0-ba41684ede1d@amd.com>
 <dfc50417-66ce-44ce-b607-917d678c5631@nvidia.com>
 <9f433dee-7ad9-4d0f-8ac1-e67deb409b70@amd.com>
 <CAPM=9tyN_A3oEyQZCOWaLO1orO6oKX0ZukJHR7cFy12Go+7d=A@mail.gmail.com>
 <cc0db376-6cff-45d7-b3a3-d13be664700f@amd.com>
 <CAPM=9tx5neQ=TbmK+2eAO=O-XW_67VhOGO-791kqyVDJEpTA+w@mail.gmail.com>
 <20251126094412.23373c13.zhiw@nvidia.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251126094412.23373c13.zhiw@nvidia.com>
X-ClientProxiedBy: BL1P221CA0031.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:5b5::10) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB6481:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ab3c41-a2ed-43e1-8d08-08de2cfef273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?nkruX8d5D3pqeFhUwISfYqtXKYq0/bpC0pQSu1R/RM1WgiaoIuO2Y20cxE?=
 =?iso-8859-1?Q?N7fV7Kn8knuBOY7dQEArLoUmmG1TwLycoBRakfSfLzOroIJgtTLfC4eLrV?=
 =?iso-8859-1?Q?Ys1SUZ78uuRmjB4Pd9h6XxIguZjwrSV5f72FAJE4FRJTINu4ciE5Qlsr4p?=
 =?iso-8859-1?Q?4ttyqjubHDT96c98NhTuYIroP2QWiNKl2qlTxx3kZpR+6kGpdImQnGTAfY?=
 =?iso-8859-1?Q?mrH5uq91qbRjhuEMYOc+bkTYBcLulfN36G+Agce1o8oLLdpBAsGNwCXrFf?=
 =?iso-8859-1?Q?Ll3MNbwYud98fGpCU383C2bSiGXrrE+Uaf7kpqvEmSPgfABGf0buc06TWM?=
 =?iso-8859-1?Q?ItOTPWSlY8pPpiwWzre4eQO01rJdyz+yLRw1tBEHWz+Xm8JydOQcR2DbYs?=
 =?iso-8859-1?Q?HWFdbIr08q5cTVMO43i9B6i37oLs7byU2djHk96hBoWX+E3nyGrMcv9zXi?=
 =?iso-8859-1?Q?2uKe0ccGcAjlZSudnE58DCrD7kOsSi2ZSvWt5mY0k0qbie9mAhKiRwFhsF?=
 =?iso-8859-1?Q?6o7YwQD1nJSnN3rW60G9lIMQ2yElwRwNPV7z2ghKA163iK/R6xi8EhsM7W?=
 =?iso-8859-1?Q?MvPvdKvghhEkTpGl0RAD6uztKx0oFVeMZ4ZZKvPBHQJBBIbTWGr12xpGYf?=
 =?iso-8859-1?Q?PRibVPwJXVwgdB7Dls3l0TAswA5jOauK9N1CNyJvFNEJ1nLApF6hq+UYMI?=
 =?iso-8859-1?Q?OqNQe9PFQA8GKz6PqbOVZUqa0Fu22/gxeo6/ZyPrxCBkc7FImTVkNAIvz2?=
 =?iso-8859-1?Q?HMa1vhSVjAHL9bVjIUEq73HpyWAG2W0ru6R5q0jB9jLHFxcyWWGSKTwCvT?=
 =?iso-8859-1?Q?AIbFT0TM3/2TFjVeYmdFJnV2Ba/JEP+xWZyNasbd/emaPygtgAy0K1SsBm?=
 =?iso-8859-1?Q?32bo3MKRLxYmN2Bi7bIHbRu3zH/ZutSNXH7Bq4gbagZ5HmQZXR1Ev+bTC9?=
 =?iso-8859-1?Q?2JzTT7TiIHpk7YnBlVx9vLq0C/aznSTCOwdouRnNmtjYqfykPmmIZPLnuv?=
 =?iso-8859-1?Q?sp58BXQjVSyu4ZUc774FMQRldNM0D0OyX0VW4I8913bOG3qAzlvHgZ1ZTj?=
 =?iso-8859-1?Q?sHX2g77Zbt+4V97vufl9pBdrfhV9M+3DuPVv5FdBQ/xjZyhEaRrpGqi2k7?=
 =?iso-8859-1?Q?GzWyPme/Tyic34jAWMxIW1OF8xyZ7nhhwchig14bD+cJaZWtjIFQZ80VnJ?=
 =?iso-8859-1?Q?Q5mQxXbjv/qr0NtIx8+R+RxuVz9YA2NSy6aec7AzVsDefRuHP4tZteC0aW?=
 =?iso-8859-1?Q?03gRnJTZs6tnJMzAexpDyJd87RK7QbC1TLthry68zFn2i5ZWHjq/85O0ia?=
 =?iso-8859-1?Q?c7/b7SePsL4L3LPwVzG7+BSCuDDiTOIKpJPq1zXV++Ml6XrqiTbsMYY7OU?=
 =?iso-8859-1?Q?VQRGZ0aKb7OWgWAPCR7Db/xe5syv44KmcJAil0Co5hkCH99nfWkzv1OG2G?=
 =?iso-8859-1?Q?IA02vm+A1P8tna+YCgQoOmT+D4V7Cc2iim9ABEQGMtV2yras2l/d6IEfqS?=
 =?iso-8859-1?Q?bn9+BOxqmSTsAwB5PcSKC7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tdzFpLTNuGSX9LdKH2oXzkMMv3I4SdwShh7FMp7cq4JwBYBODFQU70cSdX?=
 =?iso-8859-1?Q?NA/AINiPmtKZH6S9Ha/qXLrcLAlP8xZ/2SpwnGeWuC5rC8AWPZiC0Z56ny?=
 =?iso-8859-1?Q?ZufihrgQ3KJiiBvlMLP6I58BIpJyQTPSn/VRVCJNrW8AVSD1dwDX1I6Qao?=
 =?iso-8859-1?Q?aq5Dutjy3Ns2D/WE84fJecDmQbPdRv3MNVJcC32lO5E8wjytUbce5LH4Ud?=
 =?iso-8859-1?Q?4L67mHz/hFoDl9VaTIxk5f/9nG+T1KAqRTSLrBYl2oDycts0Hm7s3XJ0nC?=
 =?iso-8859-1?Q?m44dqEcXRj4GMvLSHlKLoxrl+tx6SZ3v9FSr+nHlPJizxcycywz0OzTDov?=
 =?iso-8859-1?Q?VdwgzJaje3DeVcIzDGFbpIjk7isAlFfEcaYn8NBj/wmHVQatZbtQ/NZwPh?=
 =?iso-8859-1?Q?+nYVhVLGGAeWxhcfnveJlqhvSAEepxBdsmtejamRfOk67tVzzIWOyw1igM?=
 =?iso-8859-1?Q?7DckaqkeHdh6n/OEr2QcGrpHHtpSGvjTP/pgxuEtGgQoOzwj1voq6t/3YL?=
 =?iso-8859-1?Q?yQu93RpjdcDfm+E0KtGOY9BnQXwBAHdheD/wp7tw+aCxlmxkjllN8AwQer?=
 =?iso-8859-1?Q?s2Oldi057K/UEuRd+cTGVBe63pQ1UgRTyvMohGcrLH9df4MyVkUcnkWsnv?=
 =?iso-8859-1?Q?WuDRaOuKfJtwk80AWaYIEDqjBkQJx4iKiO664uIdQAwCVqFtZhOjAl8NLj?=
 =?iso-8859-1?Q?9sbaEFoEuA8mWobhW6eFUP54b1meom318awcdQXwpNsvwSPXeMBB7jyHgy?=
 =?iso-8859-1?Q?SwkGoT+Bz8eSM+vcZjeJvozhQSFSRrKSOQUkwr2+hrT7mBhpsEacsncdyV?=
 =?iso-8859-1?Q?OtjojXScotfcOQFIpVojLeYQ9OylmLrZOQi0jLMkBGlFRr054TrPtv4Mew?=
 =?iso-8859-1?Q?+vPIirXy3K9yh6UiNYtj72OxXmREPHzHQ9zVq+qy8F9bKBEA+3sFJ9fR0x?=
 =?iso-8859-1?Q?68UDVM5eviCNKS91BMs/NQOd8XsRPXBE+MHGF2WDJpSJrouyExPezlRk5l?=
 =?iso-8859-1?Q?OohW2cX9rOqXGW2IpgVZT2PlGvz5CXPY70Imx6OmSGbjyLIx1v4paQ2VYM?=
 =?iso-8859-1?Q?rCSGKrlrkhyjFX1Px6NxxYRhS/hLsHWcdycdE2ccfQtAbgZuqffu3UZBMe?=
 =?iso-8859-1?Q?84Xa/xBHW4NoX+NTbaMqd8UdbUPuuzzYWexqFCzutIrM1tdx/6ZAdSUpjB?=
 =?iso-8859-1?Q?RfzouuSZLQVyVur8JY6IEctCwYQbevVHJ0mRcxSwlewQy6QvnEpjt0KgV6?=
 =?iso-8859-1?Q?wakGRkhzFc5k3A7+nShEYyG9D5nUoVr+C2e98k7NX5q4Jj8VMbyr5FR52G?=
 =?iso-8859-1?Q?0aY4ZyEof4LHEZj3uIKEqdg9uaEFfJq3DTE1clx5JFDnsNQjYYcq//NUG/?=
 =?iso-8859-1?Q?pFjUkeIhFyi0iAKr5kobqfSbQ45r82mnw5sXJ4QGgYLn6w3RC96EUqwnCw?=
 =?iso-8859-1?Q?eycsuTJaxHANNZ1IZXRF63ZlrVag5V9DcCeNItaQA2sIsHVRiJfjkNoAEm?=
 =?iso-8859-1?Q?jUX6vb8+lCIpg4XEA53v61TMexOTdgYcijHYLmWIz4UquUO83uOuYbpinJ?=
 =?iso-8859-1?Q?lX61S4OptRDlTXlaESQ0b7ZBt2Tbg6Pw3ycvAvAKzTmOtktTrj+gZfy3ib?=
 =?iso-8859-1?Q?ZnPynUgrEmt3w0HlmZNmhBWOBmmBFbjN6E?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ab3c41-a2ed-43e1-8d08-08de2cfef273
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 15:17:43.5724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhIKFgoCzSHJXM0Okdr3oDVxh/NhNk2qO9++hjARWoTe7qerNHVWLuwMDz3p3pMoMR/CdsGOjfRvfPWTp6qzhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6481
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

On Wed, Nov 26, 2025 at 09:44:12AM +0200, Zhi Wang wrote:
> On Wed, 26 Nov 2025 06:17:25 +1000
> Dave Airlie <airlied@gmail.com> wrote:
> 
> > On Tue, 25 Nov 2025 at 19:15, Christian König <christian.koenig@amd.com>
> > wrote:
> > >
> > > On 11/25/25 10:08, Dave Airlie wrote:
> 
> snip
> 
> > So far I haven't heard anything about needing dma-buf interactions at
> > that level, and maybe Zhi has more insight into the future there.
> > 
> 
> For VFIO parts, the vendor VFIO driver relies on the core driver's support
> to export the VM's framebuffer to the userspace either as type a)
> VFIO_GFX_PLANE_TYPE_REGION, framebuffer as a region or b)
> VFIO_GFX_PLANE_TYPE_DMABUF, framebuffer as a dmabuf, which is usually
> backed by a GEM object.
> 
> NVIDIA vGPU uses VFIO_GFX_PLANE_TYPE_REGION, so dma-buf interactions
> are not required.

Good to know. Also looking at Nouveau, the "core" part of that driver (nvkm)
does not use dmabuf, it is only the DRM parts. It is unlikely nova-core will
have to deal with dmabufs or gem objects AFAICS. That's a DRM thing.

thanks,

 - Joel

