Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK83EX+icGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:55:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E748954C09
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F243C10E730;
	Wed, 21 Jan 2026 09:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DM1Fq1jx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010028.outbound.protection.outlook.com [52.101.61.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CF810E166;
 Wed, 21 Jan 2026 09:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSh8BgZXfzA1K+hOWPVPtCXknXs2aHe31UwViPGmJNXKMVA0iBjmO21ZfOOKxi1sdmllVXj/UjploiqFJEgt/SluTztictcolIPCCikPzfZmuyvtZO0iEEoBjjJjfXGRJAsk+S4LK9lJcot9j1zuCmd0t7w33ZypxH71/8CNXujBAz7stw8E8JQTcQE3eRwuprRyGBLL15ddpccRJ6rxz1GGLipAk/lHq8ssRxYrGeUXdIPj8rvO+rea9sDUJPpUz9rt5Z4Lbwfm48lmBTyulsuFismEYcJv7Lblmbz3TxuTtWBemB1PVCp2SirIT5TlUqsQ73tYSNa1SZaMI33jJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfjaO8rLX6OnscGNkcc9LBgeJjOZ4fSgjTrxS/oKuHw=;
 b=c7xbIKfsvmte5GloY8NOWIA+wypqVUZTVy0Tp+qf/n5Ln07hVKNLvMGnqQuDF/qCL5byt/atmUm1VCRJ8dT/Rh+YIh0bFsRi2W5J8sqka9oXvAJpZxF4BiHtBR6yFlfn+lI1UaI3j1zv6EXNOOgfyyLiP9L13UaIO6Igoib3Kl1z2o5D7BxTSB3AjU9SrAz6qHtLTMCYIekmy4OUbhwygzGpQAuOH7SUrBFPUSFa5IDvVk3v8XDv/Gra/mtzyxN+ccIuTkgt4xYHPlajG53UufJaMrHpCzlHS257OkFscHun07F0nXlj6RBsI74MRT0MQGzpKb/xOVpau0DzHoCZZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=protonmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfjaO8rLX6OnscGNkcc9LBgeJjOZ4fSgjTrxS/oKuHw=;
 b=DM1Fq1jxvgX2xfmIwtQPWQk0dTp2rckEUhYwVvw+B1YACffrS/nALeU1GcETff5Uyj4TJnKu8ojV9n5UZpzP8opiezAnAvoqFj2lET8fXc5dRb6UGaOuvrkP7FQQ10mE8p+mwMgimlw78oxTDaibXVYtT9iGWQ4Hm0+Ib80Pz6ds30zQLup3cHSWntGvUUw/9NMObQWhajojlKd4ZwpqR4Czky5j7FzmDxWcRhrhrQCgWOFS3xc99h4QzrAzjjDrzUHSDwdTsl7PVmxFNBoNksmh4QSNmPWmZoiy3LgUrLWJN22XtHgtLLx+gMXLPEQ+c59Z8jZDF6dB2y3zr5ULdQ==
Received: from SJ0PR03CA0288.namprd03.prod.outlook.com (2603:10b6:a03:39e::23)
 by CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 09:55:01 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::62) by SJ0PR03CA0288.outlook.office365.com
 (2603:10b6:a03:39e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 09:54:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 09:55:00 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 01:54:47 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 21 Jan 2026 01:54:46 -0800
Received: from inno-thin-client (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 01:54:37 -0800
Date: Wed, 21 Jan 2026 11:54:36 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, "Alex
 Deucher" <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Helge Deller
 <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 "Alistair Popple" <apopple@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, "Andrea Righi" <arighi@nvidia.com>, Alexey Ivanov
 <alexeyi@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <joel@joelfernandes.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH RFC v6 13/26] nova-core: mm: Add unified page table
 entry wrapper enums
Message-ID: <20260121115436.45e174d3.zhiw@nvidia.com>
In-Reply-To: <20260120204303.3229303-14-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-14-joelagnelf@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|CH3PR12MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 13692daa-06af-4a4b-a34a-08de58d32486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BfFD3JixCOQrWeO3dToJjYMBti1Mba6PdFGRHDccfZwBAGCuvTmfC0B6o6E9?=
 =?us-ascii?Q?aLr4CRAXDjQWgJKXlzmPqghHsyAqgz/pH20xzV1NVI8K5K2+rWBoqxOcGfd8?=
 =?us-ascii?Q?BCBLGx/7CA9PEi9cpC39LA7vhkQwVgDl/QgNd4nH27trSuXZkaQ6pNAooNHL?=
 =?us-ascii?Q?iDbjjfUIWBLxb8nNUBuE6c5rRRBqAVlYhjLYduLjE4hiXIJNqzmb9Y4GBUb3?=
 =?us-ascii?Q?boEcNwnFXXm3sKU6yUzWgOI+Zhpy+aHjjiqknPc05ATuDgaodQc38JLZR/KM?=
 =?us-ascii?Q?iGwOpgIUyqjsmhKp8nVvNKsAh9ZxoBSmvn5bxeHsAFu/9b7GFQHf1WiGkcrE?=
 =?us-ascii?Q?CE996EJAg0khnZfBz1nTQeHrygQIixqIRjfJEPyyngI0fYZkAz+hghsfM5pV?=
 =?us-ascii?Q?MHvchPd18bJE9LVx91VJPzK+w2z5pnEbgacIiP+YKI4d9S5ckQO1BPVKfAlm?=
 =?us-ascii?Q?rXlPr0+mZtvGIev263eyoTBEcSmDkjcIANsbEotpA0dDSBXxsk9ecf5zG8ux?=
 =?us-ascii?Q?+A9B4jnF/SlWWNeebTAKlgbV9wcM3RO3ATXte4nI2DEeMKhlu3/o8eG6gpqa?=
 =?us-ascii?Q?izvIKyI6sxCrLZsnjeNsxJEUb9utqQmpa8h7jNXEH57o5XCnWccKvR8oZmHQ?=
 =?us-ascii?Q?lSHuGDVNtOGtB5Lmv9PSJYEtcOGWPyJ6zNWSamm3yt/ASxpmQffQ2SwWc0XI?=
 =?us-ascii?Q?dZAaLXAfni7Wd+FM1pivKysOMX7i9AXYvg6js8wNlYwzMoxFaxMQVzBoo8nW?=
 =?us-ascii?Q?ELM8SUTO/50GIh7RnLJ1vo5LdWVF2opqZtoYi2upOJIKBOO9tKpdmhFj6ccA?=
 =?us-ascii?Q?FLOh/TUEBvYAQzUar+kmaemFgQMTactA5oGsSgwdghnslF2pR8NTaqTTwdVF?=
 =?us-ascii?Q?H3cqqrmSVh0slWTRQB347oGmmbcWEiZloJikmCrBXhMkHV6y40ZFN+f0iUFC?=
 =?us-ascii?Q?rgjRZSgEhSb9dLwLf+8hzGKv7LesCJAObidAe5btUSu1IxRpvCx8hBZ9SMbv?=
 =?us-ascii?Q?LiY8rYmDhAg53DpBgWMlQZyU84RiYHbJT1X9QVxTMYSsTZlViAO/Sf91B3Tz?=
 =?us-ascii?Q?N+mGleW56le7lvWa6k0lGXfstTsCmgHYYlDSqKhPEG6ctGVyrkzQMZ3aMkWl?=
 =?us-ascii?Q?WBp6yyYrnOKKqtqvla0mf07ETkxnkm4FouxWqqwbbHLEbxRw7r4WdAMtWU61?=
 =?us-ascii?Q?Mb5Qqc8FG9dMBZZslyVBmTB4JrCus33ng+lsfu2vFdRcpIC8Pq+S8hN0WE6L?=
 =?us-ascii?Q?b5+hRkJJYxkHMrcDN25z3Bzu4zeUIYeOLyQd2L0QpJ5vFPPfWiAvVM//eJWl?=
 =?us-ascii?Q?t0mahh0a9tijJTH1Hsv3gT3poRjdXMMf1yfvaq9k4M5R7FYc4OzLZp3xXVkM?=
 =?us-ascii?Q?PYU7/H+Of7sC+stbFAV7GVi6I/Gh6fYWeBVFknofB+EF+QsgnHECuiXB1TiP?=
 =?us-ascii?Q?QsfIfVB8UrXtUCxigTbGikiDpp1GDqVgfPzf3XXavCq0IRmIyV7LNOCn40aj?=
 =?us-ascii?Q?hJ+ak9vS180fhD7AqIilrgZiNWJpQcFTiloJvMyokORSW+YBsD7ZA+8zLEKL?=
 =?us-ascii?Q?lMKuECOiDCIV2wVTpzaXFQT7mae04T+J8EwUMQl78TajBOpmGns9Leu1FNdP?=
 =?us-ascii?Q?Cmkfe+4LCFbW2TkRRz85i7GrrEYVdODR9fjRVpnqWcIG/H05GZV+ZOQZyuvj?=
 =?us-ascii?Q?tLF6Mg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 09:55:00.6781 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13692daa-06af-4a4b-a34a-08de58d32486
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8658
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:email,nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhiw@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E748954C09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 20 Jan 2026 15:42:50 -0500
Joel Fernandes <joelagnelf@nvidia.com> wrote:
> Add unified Pte, Pde, and DualPde wrapper enums that abstract over
> MMU v2 and v3 page table entry formats. These enums allow the page
> table walker and VMM to work with both MMU versions.
> 

snip

> +impl DualPde {
> +    /// Create a [`DualPde`] from raw 128-bit value (two `u64`s) for
> the given MMU version.
> +    pub(crate) fn new(version: MmuVersion, big: u64, small: u64) ->
> Self {
> +        match version {
> +            MmuVersion::V2 => Self::V2(ver2::DualPde::new(big, small)),
> +            MmuVersion::V3 => Self::V3(ver3::DualPde::new(big, small)),
> +        }
> +    }
> +
> +    /// Create a [`DualPde`] with only the small page table pointer set.
> +    pub(crate) fn new_small(version: MmuVersion, table_pfn: Pfn) ->
> Self {
> +        match version {
> +            MmuVersion::V2 =>
> Self::V2(ver2::DualPde::new_small(table_pfn)),
> +            MmuVersion::V3 =>
> Self::V3(ver3::DualPde::new_small(table_pfn)),
> +        }
> +    }
> +
> +    /// Check if the small page table pointer is valid.
> +    pub(crate) fn has_small(&self) -> bool {
> +        match self {
> +            Self::V2(d) => d.has_small(),
> +            Self::V3(d) => d.has_small(),
> +        }
> +    }
> +

Should we also have a has_big here as well?

Z.

> +    /// Get the small page table VRAM address.
> +    pub(crate) fn small_vram_address(&self) -> VramAddress {
> +        match self {
> +            Self::V2(d) => d.small.table_vram_address(),
> +            Self::V3(d) => d.small.table_vram_address(),
> +        }
> +    }
> +
> +    /// Get the raw `u64` value of the big PDE.
> +    pub(crate) fn big_raw_u64(&self) -> u64 {
> +        match self {
> +            Self::V2(d) => d.big.raw_u64(),
> +            Self::V3(d) => d.big.raw_u64(),
> +        }
> +    }
> +
> +    /// Get the raw `u64` value of the small PDE.
> +    pub(crate) fn small_raw_u64(&self) -> u64 {
> +        match self {
> +            Self::V2(d) => d.small.raw_u64(),
> +            Self::V3(d) => d.small.raw_u64(),
> +        }
> +    }
> +}

