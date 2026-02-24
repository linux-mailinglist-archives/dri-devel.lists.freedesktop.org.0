Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIyWLQcsnmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:53:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696D618DC33
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C625710E683;
	Tue, 24 Feb 2026 22:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LzMtjjcM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011032.outbound.protection.outlook.com [52.101.52.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2546E10E667;
 Tue, 24 Feb 2026 22:53:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bl/h7cmr/qFkKyF4Dckvx/jZWE3p0giAP2kX86d6tiwtNG1aKHiy2CByyKTL3pHR6QC0OhBgn2atHX2i0Y8vpe5nlOaNOpUVg/nk+2tlgIcSyZiZSk6Z5gfiG7MMB1WoGX2TH6Ph8/DhBiWKDYNoyamykEbl+W67NotuifSRz4bWrFPKQYPKimKz5/GlHt4aEX0xZ4xrWKtk3y863FsWbxIZzRRYq9oOlX7LfKl4lVVKMwN6aMWrx5M73N2+kMpyrGXwaLLTpZitS/DhZgjs4NFSc1uk0qfF1dVsXSUyOSSWgr2YoWPo+g5Jtox4jC3q/SfLGCfH+4qapPEFyGTliQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F49cACl3HIGmeiyHiHJIq2FrsVqFrqeo3rTN1RQXi6c=;
 b=v2GCnoDkC/1D7J/m3ZM6NqTlGlOuEEcZC6mAt1FlQ1FMLXTX4YKvV9NOIlV9QeqNcysn1SyqjB1TJ4/5rs4tUwvBZ4qtOrbFMz5+zPf1Nl7MvlTwnn0RKAQppvJNT19eaEv3pf/nOWxFW79LNpvVB1ue9sVvjVDMJ9BGB5seceivzgqdU7xLfjr/IoIRYTG1pXXCP7QsNsC4MVl6k50eBjDpbE5IP7ZhoHVx2e+g7UJjD5F8YoTGoQw2we3D/2bCB4GnMEp8rejHQ+yBD1X31ZZMrnUCoeTgcl/NBjNDak2LGL3+ldQRfO8y5CwmIrhjrc8kXf1JmuIerF/LxSdWyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F49cACl3HIGmeiyHiHJIq2FrsVqFrqeo3rTN1RQXi6c=;
 b=LzMtjjcM6OW/FcnyUEF1RRynCAJ5N5mPYGU4l/wSuwJLYAFn9LIAVsBF0Fib57JkC/gr4o4pFhgRsZWqKipKPYKTwHbvuVd7iDff2jGOhP2aAJYM2kGucRF4y30Vg7t3B7yD5F7P6pXonQ58KBPxJZj3pddIs008bdRm+7E6WP5+EncMFvdw/xEUxRR3WttsfrnoAJDUjrh3UNKn0IynEBcqgulJY4OuV/vNrSh4FggVbgtn1Y2VEMTh13POx36aP7pGZOHUtGzW3kxQsTLoRnTQrichXtecuGPXW86g5Mb+RALCun82AcphRnNISL9oly2CUB5Aq+T2j+USBOuCJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:53:44 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:53:44 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 Helge Deller <deller@gmx.de>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v8 07/25] docs: gpu: nova-core: Document the PRAMIN aperture
 mechanism
Date: Tue, 24 Feb 2026 17:53:05 -0500
Message-Id: <20260224225323.3312204-8-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:208:32a::34) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cdd46c5-ec6c-4f78-c745-08de73f7901a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v7pMrKD5CkHBlMaq2YHIFtSFYRHMMt3Uobsy9nqhC1pB5oXA2HLQ84lH1zIM?=
 =?us-ascii?Q?H4KvR6BLDJd+wQOADamsNMaCWZoWWSOKqaXy5KJxcgkiLXXHnUQ0C7gudEkz?=
 =?us-ascii?Q?6/mMkGzeVdnm0Cq/rkJJy7dWcb0Rm+uQZjI5Ug1IFaAGXj0o9clOCDxmRvkH?=
 =?us-ascii?Q?wE8cqUpIxbYupUGYTSDw94+PPuYzdcKnX8o/4dugjRyJS7CjEB5pyaAQqGBz?=
 =?us-ascii?Q?Nfy6WAtodbva4C1OyjWOrTVUdzBva/K9pJ8O25D+KRTwQ3+0ZXaGvQ+ZvQRn?=
 =?us-ascii?Q?/PGT2Ksb8xVS8akF4lJIGkDBtFYUtjOrMUEbtD2ITy0Lmtr4lLIefcmjHGjY?=
 =?us-ascii?Q?5kAcGgSfsKVTUStqsqD+kVcYX6AjuinswU+anVvjmakdIX6HfGjoNRJFTOfB?=
 =?us-ascii?Q?c57C8KlwNvAQRB84aWiSkC641eUdyFlflFJ2IIoE/JUslAOg4wRD+BKvvpuY?=
 =?us-ascii?Q?r5lHyqko/bCls+U8+swaYdBl7imskvAo3t1UUPZ4NDsNCXGRs/GUuyq1FgQQ?=
 =?us-ascii?Q?LruXQ0P/nLSJZ/h4UfVrFvdPL29ZWax0l12zs+v2lvX5IIgkuYUEDkkqSEQg?=
 =?us-ascii?Q?NlfusmJRzkjMuuNG+1aqOueqrNcaoiF8nO6Juu3aiYsW/0w1VvM0DWyg8OAV?=
 =?us-ascii?Q?IOL3OQLI+7dxrlAOKp8iIbiabDDaRO+05Vc5aVy/TuZ8RHm3yYQkbkYztf48?=
 =?us-ascii?Q?SiP0T0NbCf+5Sqn1BYZsgKum/mVHguY0/zeUihuySgDNABGGFnIPbQwK1S00?=
 =?us-ascii?Q?eR3+ORibS+O73V2ilmrcGPcM93USmABOdQxsJFE0a0eYOJdgXutINU8Vtmdm?=
 =?us-ascii?Q?GWWPjqZevlVstW+LWzWyJLaIxBr+0ariNCEZEANHpbVAkfoHly7DQ0z7YxP+?=
 =?us-ascii?Q?An6EGXS12d7yHc9Me6RbjSu8WM9Xx1bXLLP7nDZV/FqDY/aolJxZJ4g7BpqA?=
 =?us-ascii?Q?9iEqgxlt69lg5cstpszaWxEMCenP1qWtRncSVZ1C5QY1d6y/o8iiZY1KVfzb?=
 =?us-ascii?Q?5kJxw9GDol9qaP7aPI9drn6u2CsTpQdY7ldi93pi5FIl4tLdZRMG2XH6hEY7?=
 =?us-ascii?Q?SpSmdzhGx+M3OWrds/F3+uS7z1R7hVVl86xiPlCcNwyBtWyLHrjLIdLuiWgB?=
 =?us-ascii?Q?o6ochc/cTa3+T37btMr5pwwSM9scV/uet1rmZzZfJW+dzc1jXOgDhutpAPmH?=
 =?us-ascii?Q?5l+A0qGf1V+E3bc3uXriMAThShhCNMqZ/MyqMryHbUgcTK7sK9UMmm+Uq3Wy?=
 =?us-ascii?Q?G/LRtu1JZ3qQhfFLhoNk7uDjk+NWIYhu/39UWm0nWWsRh2On2rp3gzJ+Rorc?=
 =?us-ascii?Q?lC15uSrBv9TAL9tQM4O2jk/4J7U9mPspItbUtw7X/9Oks2epfZjQHOKosETM?=
 =?us-ascii?Q?7zC5uAWHGI0btD7IzD3xkwu2oaz5KB8MaHpjEqHCbn4TRRtxcFhzbkR+FcWj?=
 =?us-ascii?Q?OId0C4w3nFsIhEoMsTbFUOUUfK2ixjCvOWFiBozfNAEB6jq29/GFObpNURxC?=
 =?us-ascii?Q?E82uowSB2B5v2wLalvhCHnz/HdBAqI/c1FYYLwd50u/SqVMyYCqurx+AE4b3?=
 =?us-ascii?Q?Br5lrfuSHdJuwD7zpTE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FA2AkK2bLVK/tuGDXoR5PGW1Qo6tFbhkpLvvpDVd8C98ktj4aqqPBh0JsqgG?=
 =?us-ascii?Q?sTjo1uzDahy1ZB9ealZY/nfm1ErHBR8u7CmWoQo4vmeJUd9yCePqlskWRe5Y?=
 =?us-ascii?Q?lLLSaIhsdSnX79SHC0FfbLFpOPjlanJxvtK+pPb7WqXirUWQ/VEUeIT9GP5V?=
 =?us-ascii?Q?dhZ8nl+x7VWPEPp5sAEK/8ZmFurnJD+bZN+ZHNfgQNKtVf9CbehXl1Nv3Dt6?=
 =?us-ascii?Q?wc4EgAnJwMG/6u/b7CjBMCX985lohLgGm9Yzlg1hyCSq+Y83vXBv8fHROC8k?=
 =?us-ascii?Q?J9kuCJd9jFoo3gn+q1kJ/XF/7h5+wfAJbWLlQFPzeVO05ItHu7BNUhjha1u1?=
 =?us-ascii?Q?0vLGXAq6XPCiUnd+I3rCaVSU3Iai0fiLcMDW7Olodq84usX8v9jHOXqikPGw?=
 =?us-ascii?Q?wCoA0TWeEqo3YM0w0lIIdeTYuVxet9cFSyHmETHABpysPusyDv99JhBUL6zA?=
 =?us-ascii?Q?eYrSCvEUDcNPCTdtVIWaBHaeNDyONqtb7LoYSXlUr7sf3MCOBuJoeLELrxjO?=
 =?us-ascii?Q?Yrta1owaVERMWzpaBsnD2vanBDIWy8mK9zJqHf8QbqB3CSWolFT1viwlfDTw?=
 =?us-ascii?Q?SqwwskN4WOyBmOCJ+uLD+stomP0Ae3aHgn6NP46omKmddF0hPTYlgdlzByHU?=
 =?us-ascii?Q?vn2m3D/9m4f6tvTSJ+ug9B/3AYbfJSUtGBmFFnaVzS+XFQEYYX24xes125z7?=
 =?us-ascii?Q?PkHV/1C2S9qipwuBzfgNtg1Byh8cX/4oYhutsV/AQhrgSXop8wxntWknFzBI?=
 =?us-ascii?Q?Y4stHOosFcdwb0Xg5eivlScSNehSHxUOMUwqniipuiQMLpCTmrFcFHntGW/k?=
 =?us-ascii?Q?7h44unp0pqXMjdqGld2kQPx2w1EFry6j5rzN/Us3DndoOkEExHPqymuD95un?=
 =?us-ascii?Q?rytX2Kkb0nnU1YXMGwlw6+qVgmAR5MSToprtIPEVEZljPE/8CxHDNPkyR3Rw?=
 =?us-ascii?Q?3BJlFH/YG2SW6U3lZ5F3jvHkxN2Toty0Ik+soy2jmYdSn14t+IE6v/X7yWIH?=
 =?us-ascii?Q?JotUp93lfeEX6dYKvfl2B6PHuav9OwU7j4g9HMdHxgTEEPl0TvZHnTbQoQgW?=
 =?us-ascii?Q?Uegx6EAh4pVg/ph6CdCxbJ5HgshmFDH5tt695jpG0pPY23d9OjpEtj5g+8kX?=
 =?us-ascii?Q?+61PVSPnvBs0Z2DyFWAwsmseWR27xuvc9AEoN++jtjwvmBRILJbaSuoLzq0K?=
 =?us-ascii?Q?e3lvsFDw/QotJuRU/arWhXQbSLHgtXFkiGYjbBRZaH6r8KDQlCdl8l3/JEcP?=
 =?us-ascii?Q?M6gLZHVsjp0R0Z3/q77Bw8ShkONxyYYU0NbiX/rId98iqZlFUxlTNySVzYCJ?=
 =?us-ascii?Q?45I/4vQmNOs/TkdhFm9Ei13xN62GJFwud53ZlOy3lsGuzMSJISMfcIJFX4kj?=
 =?us-ascii?Q?GiA1m7WfSFQgo1EWLh3S5aZ9mFjMJP/xbYHpJI7HluAGJbaTJh0F1M1OecJP?=
 =?us-ascii?Q?tUYeCoYtMZf6YQCfivntrTm2jYhttd3ZMt0nM8sUNvvQ+oIo9WALlPPErt6f?=
 =?us-ascii?Q?AiRSE3LHJHSmtcPYI2+IH99l00ButGPTgT2awHARtQJHF8mEbKnRXnMoktwn?=
 =?us-ascii?Q?VUP8KdxEWtRlnz3FtuySHwhwE5TNI0fdQOaU/CZ0wDiHyQAAtVOT0+lrOEbo?=
 =?us-ascii?Q?6H433FEBpu4QSVKoEHTFqRIGP7SeJy61OHi00tY2PCpb3asQJld9OwhKlQdS?=
 =?us-ascii?Q?TJofySpsWoeoFNX1qeUFFew2zOY+iFQS+70BsJ6qJeM+zW0CihaRfSy/rUBi?=
 =?us-ascii?Q?aLFHhlrp/g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cdd46c5-ec6c-4f78-c745-08de73f7901a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:53:44.6920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bsnGqCazWxWgySMwlnn8Ib0ow27jLWpJcT8fmcP/kAmnZY028MLV1Lvto6ys8mq4uvjX/poPuxXar1mgsSIDPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6885
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,vger.kernel.org,nvidia.com,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,weathered-steel.dev,joelfernandes.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[57];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.913];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 696D618DC33
X-Rspamd-Action: no action

Add documentation for the PRAMIN aperture mechanism used by nova-core
for direct VRAM access.

Nova only uses TARGET=VID_MEM for VRAM access. The SYS_MEM target values
are documented for completeness but not used by the driver.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 Documentation/gpu/nova/core/pramin.rst | 125 +++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst       |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/pramin.rst

diff --git a/Documentation/gpu/nova/core/pramin.rst b/Documentation/gpu/nova/core/pramin.rst
new file mode 100644
index 000000000000..55ec9d920629
--- /dev/null
+++ b/Documentation/gpu/nova/core/pramin.rst
@@ -0,0 +1,125 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================
+PRAMIN aperture mechanism
+=========================
+
+.. note::
+   The following description is approximate and current as of the Ampere family.
+   It may change for future generations and is intended to assist in understanding
+   the driver code.
+
+Introduction
+============
+
+PRAMIN is a hardware aperture mechanism that provides CPU access to GPU Video RAM (VRAM) before
+the GPU's Memory Management Unit (MMU) and page tables are initialized. This 1MB sliding window,
+located at a fixed offset within BAR0, is essential for setting up page tables and other critical
+GPU data structures without relying on the GPU's MMU.
+
+Architecture Overview
+=====================
+
+The PRAMIN aperture mechanism is logically implemented by the GPU's PBUS (PCIe Bus Controller Unit)
+and provides a CPU-accessible window into VRAM through the PCIe interface::
+
+    +-----------------+    PCIe     +------------------------------+
+    |      CPU        |<----------->|           GPU                |
+    +-----------------+             |                              |
+                                    |  +----------------------+    |
+                                    |  |       PBUS           |    |
+                                    |  |  (Bus Controller)    |    |
+                                    |  |                      |    |
+                                    |  |  +--------------+<------------ (window starts at
+                                    |  |  |   PRAMIN     |    |    |     BAR0 + 0x700000)
+                                    |  |  |   Window     |    |    |
+                                    |  |  |   (1MB)      |    |    |
+                                    |  |  +--------------+    |    |
+                                    |  |         |            |    |
+                                    |  +---------|------------+    |
+                                    |            |                 |
+                                    |            v                 |
+                                    |  +----------------------+<------------ (Program PRAMIN to any
+                                    |  |       VRAM           |    |    64KB-aligned VRAM boundary)
+                                    |  |    (Several GBs)     |    |
+                                    |  |                      |    |
+                                    |  |  FB[0x000000000000]  |    |
+                                    |  |          ...         |    |
+                                    |  |  FB[0x7FFFFFFFFFF]   |    |
+                                    |  +----------------------+    |
+                                    +------------------------------+
+
+PBUS (PCIe Bus Controller) is responsible for, among other things, handling MMIO
+accesses to the BAR registers.
+
+PRAMIN Window Operation
+=======================
+
+The PRAMIN window provides a 1MB sliding aperture that can be repositioned over
+the entire VRAM address space using the ``NV_PBUS_BAR0_WINDOW`` register.
+
+Window Control Mechanism
+-------------------------
+
+The window position is controlled via the PBUS ``BAR0_WINDOW`` register::
+
+    NV_PBUS_BAR0_WINDOW Register (0x1700):
+    +-------+--------+--------------------------------------+
+    | 31:26 | 25:24  |               23:0                   |
+    | RSVD  | TARGET |            BASE_ADDR                 |
+    |       |        |        (bits 39:16 of VRAM address)  |
+    +-------+--------+--------------------------------------+
+
+    BASE_ADDR field (bits 23:0):
+    - Contains bits [39:16] of the target VRAM address
+    - Provides 40-bit (1TB) address space coverage
+    - Must be programmed with 64KB-aligned addresses
+
+    TARGET field (bits 25:24):
+    - 0x0: VRAM (Video Memory)
+    - 0x1: SYS_MEM_COH (Coherent System Memory)
+    - 0x2: SYS_MEM_NONCOH (Non-coherent System Memory)
+    - 0x3: Reserved
+
+    .. note::
+       Nova only uses TARGET=VRAM (0x0) for video memory access. The SYS_MEM
+       target values are documented here for hardware completeness but are
+       not used by the driver.
+
+64KB Alignment Requirement
+---------------------------
+
+The PRAMIN window must be aligned to 64KB boundaries in VRAM. This is enforced
+by the ``BASE_ADDR`` field representing bits [39:16] of the target address::
+
+    VRAM Address Calculation:
+    actual_vram_addr = (BASE_ADDR << 16) + pramin_offset
+    Where:
+    - BASE_ADDR: 24-bit value from NV_PBUS_BAR0_WINDOW[23:0]
+    - pramin_offset: 20-bit offset within the PRAMIN window [0x00000-0xFFFFF]
+
+    Example Window Positioning:
+    +---------------------------------------------------------+
+    |                    VRAM Space                           |
+    |                                                         |
+    |  0x000000000  +-----------------+ <-- 64KB aligned      |
+    |               | PRAMIN Window   |                       |
+    |               |    (1MB)        |                       |
+    |  0x0000FFFFF  +-----------------+                       |
+    |                                                         |
+    |       |              ^                                  |
+    |       |              | Window can slide                 |
+    |       v              | to any 64KB-aligned boundary     |
+    |                                                         |
+    |  0x123400000  +-----------------+ <-- 64KB aligned      |
+    |               | PRAMIN Window   |                       |
+    |               |    (1MB)        |                       |
+    |  0x1234FFFFF  +-----------------+                       |
+    |                                                         |
+    |                       ...                               |
+    |                                                         |
+    |  0x7FFFF0000  +-----------------+ <-- 64KB aligned      |
+    |               | PRAMIN Window   |                       |
+    |               |    (1MB)        |                       |
+    |  0x7FFFFFFFF  +-----------------+                       |
+    +---------------------------------------------------------+
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index e39cb3163581..b8254b1ffe2a 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -32,3 +32,4 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/devinit
    core/fwsec
    core/falcon
+   core/pramin
-- 
2.34.1

