Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMcxKPrQrmlhJAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:54:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D9523A17D
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB4C10E4F8;
	Mon,  9 Mar 2026 13:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iEngbn6e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011058.outbound.protection.outlook.com [40.107.208.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3342410E4F4;
 Mon,  9 Mar 2026 13:53:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vm6GdmmJNvguxP8sjwMOqV8V0VLvDBxjWz4QXlwXRBryP5b6xPU7ag3YgGYGUlJOwIUGLvVGJORfPoEka/Ei2naaa534q1ETot/mwl7nnho0vEIW76C/yrIBEIsEop/+4U/RGXZuAjpXTx7DBhatzSHjHpw8XAr+Y8ZouKiKM/Zkw3rJGLHKMCxYWv960XHimwfRMJvs6V4PdW3eAv5jfjClbsWtb8yoomh8kXl6Ivq4Ff7sSWIPZy0G33wsVrvv3kGwVNWIE4ofb1AIKCzG/YXtVZ1YZ3bLvJzcu+DGh34VuMqOGzGKLovSs2X6wdnOdKrCxoq6XTBWnFxnHfjhGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TKBgpRZ1LF+riKYp7m4qyYg6CwL4avNKoePBXwYvXI=;
 b=ptPCxw3HrqVnb9kGa9/OYUNtxbrFznBct0rzY9lZi313l172RJM5VpNqdU7ff1mQ65pSABwNG2dVLgZjJW3I8MeVIi3tL6q5EZY/LUF6a9hzS4wTjzBkBpTRCbNnGm3NgMw7/pAEzjHTz6BrSezmIxdYeNp1lrw5ROvqIQcvWTi27ojvt3kAo1V2RItJj+eCMlceKvkP28j0keA7XwkjGSYp99pjESt80N2rzExct3eV+mmLNwB4B00S2R7N6YPQTCpedi2cUamAMyTBBM0WkmC4xVaxT6rbyu24a1DDuqAr7w19WTlIhkYPLxitTZeodAGj2hrI/VFsVyFsPb5vlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TKBgpRZ1LF+riKYp7m4qyYg6CwL4avNKoePBXwYvXI=;
 b=iEngbn6eZ0cppiD5tykEGn06OAWDFQmI71sxcNjhNyCc+e72ftGr1ngIxmmssHRrxdp9JIOTpleGXe29El+FX7Hct3p4kAGaMyaprRMbjKx87lvFSfwWTrarbYlrPvs2/Nr69CnxRpuCE64cmMk45V+VwdCTs1HKd4Ek0ZLuDnYWlgwcW3X374q4FZTfPZJBgMa5HDuTubn2TReMOUsfrpYjuZbs0ykOer7etgCipsfcF4xCtGQphgDnf2HWDxNtTMZW6XssglQsoL7fqxgTVlNtW2NuAt77J5n9cAmeHGQ8woiMO95t3TCxG9hZy3fZ6oyMfzWPwEQtYl0f1QIcbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 BY5PR12MB4082.namprd12.prod.outlook.com (2603:10b6:a03:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 13:53:49 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 13:53:48 +0000
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
Subject: [PATCH v12.1 0/1] Rust GPU buddy allocator bindings
Date: Mon,  9 Mar 2026 09:53:37 -0400
Message-Id: <20260309135338.3919996-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260308180407.3988286-1-joelagnelf@nvidia.com>
References: <20260308180407.3988286-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:930:a3::24) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|BY5PR12MB4082:EE_
X-MS-Office365-Filtering-Correlation-Id: 597b2e98-dc76-4f2b-dc99-08de7de349cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: KYNmmuakd6CrA22J0broSzJgjvCoeeaX1OnUk3/zgg293mCMmvf59RjmmKMDvLiuFFHWbSMQEaz/ueoLHcscb3xMiTFBke54GRXUYhbLKscJR1GYFrbchpe4RNuXrI15G4KaXIlEspDfRG7a4ZgiJVTFL1QVFP1ofyfHFEZMhAwi7UsdwVKOYekUuqXB7OB2uVAltPf3SD7WtcRqNvwsI8Xd7quh90jIjPVxPjZB+gqnU+7JdHgUeiME5rHmL7OUkEdOif3JldgrI4WJsqHba5JeKPF4zOQtGGZ9FoDXMASj2LfWb26AgD+0Jodd123HSxL2lAPSdcp0iC8TY8L5gDdn4ut89oai+WVURwfZ/SQxSlgS24gt0LMTqKMVYhBEXwi5Q6lA8NrPf1hhYaA1mHlBYfPkC1C1xlcxY3PcZjQshyyTFtp6sObQqU5FeSpfbhOD12+idedcla0akvERX4NR3mzLnSNhtFZErdocBU3Ha0vloGvZRHmO/RPYRz5Ujfz7oec84ARNArhO6CaC8jFrWJKFZYE8t8gvJE+mSnZEtp28I8kcS4YxDMC6kDIPMWnVjGtROePAznoGwr+TWIMPuX9fUNaZhMwGiTwydZ38x9xDJKFvLdUt0Ra2I0ZxgJ07Y0DOrMFWzWH03lKthMz1sK1oDE23kPAvYYyGk65maAuldigLntWaUDcWLB3+5yyerltxRZIAjUoaPjBNOlXvdJXzh/SVixD3/AgGVx4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VRCdMjPMuU3PzfD4lp2NoNFYZqLRWvOUdM840gKiHmRbd80hYRYuXHKmmb1l?=
 =?us-ascii?Q?PvdLBA6mxBkKOOu5QiliOSaRjrTzQ6Wh1PzaG/+G/+g2GrHqsatZce7miV6v?=
 =?us-ascii?Q?GAmEnSYGE/aEByJHIK59PY+dQAbBjL9H7jsErw3yUF9/VUmQX/sUOofMVFoa?=
 =?us-ascii?Q?YxYSXulKpa8o8E4IxQyssPyCOA3HWs9JUpQ1rjA7KzFzseHoFLRh9kBhbR2t?=
 =?us-ascii?Q?R/gPzXt9BTTzFvEKAvB4OhCwY4cUWZhXU8D6rpF/5k8AW4XW9A0Itgj6GcyR?=
 =?us-ascii?Q?6VxsK/tWkPieT5BBs9CWskWcK2asqslNO3sA4SHRus9Vnv4ndT14q5m7m4zw?=
 =?us-ascii?Q?0ex2KO+NktiE/3IcIxFerqsoehZQZ5hvrYX6kRbkCPCw9J8OVxTwc7GVvLTV?=
 =?us-ascii?Q?v3sXioqgqq291P5l/n9L8OFP+Kx44rDB312MHMBb1Z/0uQKYLdYGrja+BvMp?=
 =?us-ascii?Q?j6+rkPtyvNQUh8laoXQRMvtChxprONG9g3dV669rKtmVE2AIWyJdbDznozcX?=
 =?us-ascii?Q?kOhoEgodbZwGwtJ9hBSrGANyLt8ROHZ4QcCQ1duS8mmw8eu7lA/NefJwjnne?=
 =?us-ascii?Q?4y/aHeS/can9JWXHUOth/9BiVQ0sgm1aXIJncP/i4x14YJlktqfXvbf/C5Qa?=
 =?us-ascii?Q?dYOiu4pxtj4eFO3iNUhaVCpeuNVJElNnnbx2fMOVqWX7/GSf8QNx7vAXogn2?=
 =?us-ascii?Q?M+h7YcLVrTfd2l5ZwKLj9OxaztspZZzzzE6hkvMm/1n/1EikTt/uBVxqK0+S?=
 =?us-ascii?Q?DD6BH3FTDLTn1V9ghReKxgvqD1K0TrK8/EOfufouPWKXALAQdyHDpY5INr2j?=
 =?us-ascii?Q?H5xoK6F1AyUndnbuyvhSIr9tqfxPmGSlm3IlvMJw7BJq5FMg1XE2DGyonK4L?=
 =?us-ascii?Q?axOl0RURhLX11lDm0CrUwzPSwxNh2mBo3rxZCYr6nlL1IDh4fOaHJ1i2V2ZP?=
 =?us-ascii?Q?hwVe6QBCJOfMT/+5CuxJqqkvw8i7iOOBS0KJj+egYsG8Fkvj2OQyZB/u/snS?=
 =?us-ascii?Q?p99o+9PqpB1BLHETBvxUornWM8uAovICbpUGJqGy8GQ7F4CstsoT2ajsiHI6?=
 =?us-ascii?Q?GLZX8ODoKtDHLZpGrvz+ZSyCeWHEV3jkyLfyEbkf0a7au0Bubc23MEvgCr+Z?=
 =?us-ascii?Q?UTLKUR/iT1l7e3wCgoCzyByU6Jlo13HR8TdzMcyRJBBjPRbExCXBJiDD0CiA?=
 =?us-ascii?Q?u74KgmRWPn7an9U9c9hJMlPM9cUC6PX8w/Qe1B/t9vIkMYnykPpYv1RyFwqu?=
 =?us-ascii?Q?ffj0cshyOGPE5TX7/cFuQjFvpJ9G/fD8ZEYuislkSi+mCZ5kB4l/wKG7vCZd?=
 =?us-ascii?Q?aZC6k7u+Nrj0iGJRki1okPihlygu4BUKWHx9m5CZlOTNwIEvDEse27ut18EU?=
 =?us-ascii?Q?1NU+Gn/s81c3iv+W50vmnhCUcw3vtJ5GHzoKYcU+Ro3TWYEGQ8fuQcnEcN0j?=
 =?us-ascii?Q?NproQ+SGbcya35ltmwYXLf06WXlr9tqo/iAhbr6cAUrpTJvCbF6D8GoqVT6R?=
 =?us-ascii?Q?ZJEctUyqNVtdJqjb5CNQrnsfv/44ZtqxxK9h2rPVbtHGhR3E4hE2HrMaOwpu?=
 =?us-ascii?Q?UzWNfG+ixQTCu5+idgEBHvAKu5k5yRB6O6A0Vbkx8kbQddBf01XxWlZWM23d?=
 =?us-ascii?Q?euPZEPhNGB7F/nF8rzH1FPgEw4mLKTCgJ4G678YNynrgias+1O/+JkT2UAIx?=
 =?us-ascii?Q?uplCjqMFBuYaopgDgMQ0ZUVT7ROgZupXvC4e75Gt5AAdErlhxLSMzlkJmLTt?=
 =?us-ascii?Q?PVMFdzfNOg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 597b2e98-dc76-4f2b-dc99-08de7de349cc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 13:53:48.4213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zPvav3Y915nfftHR466eibh/OJnuhUDUmPm2IIJVI9CIxXM0U3ABmrcPUC38bG9uv8Gs1SmKyhu3UZuUkX63g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4082
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
X-Rspamd-Queue-Id: E8D9523A17D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
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
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Action: no action

This patch adds safe Rust abstractions over the Linux kernel's GPU buddy
allocator for physical memory management. The prerequisite infrastructure
patches (DRM buddy code movement and the uninitialized buddy fix) have been
absorbed into upstream -next, so this is now a standalone patch.

The git tree with all patches can be found at:
git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: gpu-buddy-bindings-v12.1-20260309)

Change log:

Changes from v12 to v12.1:
- Fixed undeclared type `GpuBuddyFlags` in doc examples: renamed to
  `GpuBuddyAllocFlags` in all seven doc test examples (found by kernel
  test robot).

Changes from v11 to v12:
- Rebased on linux-next; this is now a standalone single patch as dependencies
  are absorbed (but clist is a prerequisite).
- Redesigned allocation API (Alexandre Courbot) for better Rust ergonomics.
- Split single long example into 4 self-contained examples (Alexandre Courbot).
- Several safety and invariant comment changes (Danilo).
- MAINTAINERS changes (Arun, Mathew, Danilo, Dave).
- Fixed `#[cfg(CONFIG_GPU_BUDDY)]` to `#[cfg(CONFIG_GPU_BUDDY = "y")]` (Danilo Krummrich).
- Updated `ffi::clist::CListHead` to `interop::list::CListHead`.

Changes from v10 to v11:
- Dropped "rust: ffi: Convert pub use to pub mod and create ffi module" patch;
  the ffi module restructuring will go through a different path.
- Dropped "rust: clist: Add support to interface with C linked lists" patch;
  the clist module will be submitted separately.
- Dropped "nova-core: Kconfig: Sort select statements alphabetically" cosmetic
  patch.
- Patches 1-3 (DRM buddy movement and fix) are included as reference only;
  they are already being pulled into upstream via drm-misc-next.
- Removed clist patches as those can go in independently (Alice).
- Moved the Kconfig GPU_BUDDY selection patch to nova-core mm series to enable
  it when it is actually used.
- Various nits to comments, etc.

Changes from v9 to v10:
- Absorbed the DRM buddy code movement patches into this series as patches 1-2.
  Dave Airlie reworked these into two parts for better git history.
- Added "gpu: Fix uninitialized buddy for built-in drivers" fix by Koen Koning,
  using subsys_initcall instead of module_init to fix NULL pointer dereference
  when built-in drivers use the buddy allocator before initialization.
- Added "rust: ffi: Convert pub use to pub mod and create ffi module" to prepare
  the ffi module for hosting clist as a sub-module.
- Moved clist from rust/kernel/clist.rs to rust/kernel/ffi/.
- Added "nova-core: Kconfig: Sort select statements alphabetically" (Danilo).

Changes from v8 to v9:
- Updated nova-core Kconfig patch: addressed sorting of Kconfig options.
- Added Daniel Almeida's Reviewed-by tag to clist patch.
- Minor refinements to GPU buddy bindings.

Changes from v7 to v8:
- Added nova-core Kconfig patch to select GPU_BUDDY for VRAM allocation.
- Various changes suggested by Danilo Krummrich, Gary Guo, and Daniel Almeida.
- Added Acked-by: Gary Guo for clist patch.

Changes from v6 to v7:
- Major restructuring: split the large 26-patch v6 RFC series. v7 only contains
  the Rust infrastructure patches (clist + GPU buddy bindings), extracted from
  the full nova-core MM series. The nova-core MM patches follow separately.
- Rebased on linux-next.

Link to v12: https://lore.kernel.org/all/20260308180407.3988286-1-joelagnelf@nvidia.com/
Link to v11: https://lore.kernel.org/all/20260224224005.3232841-1-joelagnelf@nvidia.com/

Joel Fernandes (1):
  rust: gpu: Add GPU buddy allocator bindings

 MAINTAINERS                     |   6 +-
 rust/bindings/bindings_helper.h |  11 +
 rust/helpers/gpu.c              |  23 ++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/gpu/buddy.rs        | 611 ++++++++++++++++++++++++++++++++
 rust/kernel/gpu/mod.rs          |   5 +
 rust/kernel/lib.rs              |   2 +
 7 files changed, 658 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/gpu.c
 create mode 100644 rust/kernel/gpu/buddy.rs
 create mode 100644 rust/kernel/gpu/mod.rs

-- 
2.34.1

