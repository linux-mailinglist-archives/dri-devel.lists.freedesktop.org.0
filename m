Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDMTMUm6rWk+6gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 19:04:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D44B231897
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 19:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B41F10E47C;
	Sun,  8 Mar 2026 18:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZdZjz4nQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011037.outbound.protection.outlook.com [52.101.57.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0EB10E476;
 Sun,  8 Mar 2026 18:04:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+abb4oYkq9fQ5uwzZY3DumTNV7tdgynWsd4vEg0x7/0eGCOYwgG52cYwPPlpNxHjiq5DKfg6gxSBrpqjYewneBfyLvi3Lg88PyedK4tNmBNbBdYHMr+Zsm99fG/uYOnN4tGgUnQsDkkKOEkM768bZGMApXyuklsbi61b0MQSgcFgjRJ5a9vGaF3mt/9yjT6R/u7XjR2BmU1mGQy9y02zMYATyCIoi0XICrpyzTzpnuBJqTYqhrqKuINK6OmQxSVGMU0RRZp/hhxxXtdiNt6knE2hKvlZBTYG/S1Go55Qbox8RN74pd92mW2u7yvvrbesZ5C6bDRoZBQTlhL2fCJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2JCnLZYdorlHwgUXnY7ChSLmWjRLeDOiGyp+jKRf24=;
 b=DMtwPS34uGhYzsbO2anSXyb2V0AWy5DjBBvNM6LIKQfUHIOHKmvSWvkpS9TBGx31ZdboWhgl7azY2ufiVFO7s6GcCRXLPRrBNc4ZDMq8rVLSu4Pfa/ihXcLK/RhMna8pSjxh45P0ZbWNrZ1gkciRd4+X4ne1lpjrPM8SBwXrb3xOVU7bB7YbptuSdy/6oL23xeMoIrWAKvghtq+hpD1Od5l80lNytzCJMD4/diBZ7ayR8VuSCCQlALqrtHsJ0BWVPC9I6j4hv3XnPRiTSaR+9qYsbSuzOytreUr6yUNszCJpiKI1NyFrcwCB49ljhelB5L/R6AUmbcZy5HhBjjLNiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2JCnLZYdorlHwgUXnY7ChSLmWjRLeDOiGyp+jKRf24=;
 b=ZdZjz4nQ2cRA5r6Sn4XOgdZiGNFDzQDZcOzwWtRKILIjOGtfvK/pCTW38cu0mL+TUusPFW477q3G7R6idcuoIrezqyrhnJv3lYSzokm4CfaKDPRh+3NLmwRDLz2T+4OyxKnWafvIiClx1ig2vfv/fI0wtfgkKuty5JDGJ+NsrA3itpkBpZe2ZxzyCq7VRyJEdE3XvsBvahQ6DHJeshp54KPpT44fmUFmThs0R/xhe0Q4o3iTPWxv+xWvi+JpJKUNtFG5GrsO1rbpW5RNQ9mHksK46/k1UosfuBVto1267cww7NtJp2FF/fMOpgTaD46AYLt54aCLmwvtueDeoPusFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DS7PR12MB6022.namprd12.prod.outlook.com (2603:10b6:8:86::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.9; Sun, 8 Mar 2026 18:04:41 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9700.006; Sun, 8 Mar 2026
 18:04:41 +0000
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
Subject: [PATCH v12 1/1] rust: gpu: Add GPU buddy allocator bindings
Date: Sun,  8 Mar 2026 14:04:07 -0400
Message-Id: <20260308180407.3988286-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260308180407.3988286-1-joelagnelf@nvidia.com>
References: <20260308180407.3988286-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0052.namprd15.prod.outlook.com
 (2603:10b6:208:237::21) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DS7PR12MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: f1cae475-c4f8-4434-5931-08de7d3d2b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: 5wLbYxSyiRzntAUdPPORtTlpyYy/v/MKATOrAMgjH0HRhAniOkpwwcqiIPuXh3YHy+XohgyQ+yLEUAFIBeKRgl+9SCbNpNh9LUp0UY3gjrifUrF5VZCyXwXRU3o2g7E4rE/OluWVUBjDCPuIT8dL+MUPS/qCiT60ysUy/ASaHwf8AXtIBo0JkQu+WdyGM0D8RjDjyEWXxDSg6VdrEhDvub3f+y/j8Yz+vU7jsplb/JQzD3SFq9iZTKGUAaQIA61u+WJaaiyhEEWDIuKngL2jniPzMdUYLTfo5w306F/yriaUS+wyDR/UEWPh6obaP2GkeqUZCFfJuKSo9k8lpn8QVdBzG3ewHMQPrZRS5M2wbSHseHJZQdSwNqkvX/Lv+wvrfCfn62AXnY9CegUFMJHACWPKzc3zIoM30hMS+uM9CEUsK+eCWcgXPT6Ja+Wp4Clgi+9XNlgcuXpbyj+5Usx0fzRjHDMU/ECYGSniikgT/anCsvuTegq34BJkW3KYinz/Oux7YQGuv5K2w85BLZBmyhhSMT3pWZ0gcJlnuLYff+lu8YMCGoxWh07RSlQWq40DJ2Uc2fWQJ5PeViEpfofuMYNLBWJFUfVkpz4rTbdHvjMqCAv9XNI9uXV0KrT5zc2zzADGgY3Ngzb0STp3we0LsGJbvlFk7WeFisozzQQo2Hn6sZuch+Mkl5W88u+2bNIPgCgUX+1hDohPk4dqn4dpzLUnR4QYinm6zBNUBApDgbU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5EOc0c/gMeFLj3Tx+M+DB+lbRUuaTsEzXJEKbXKCcgea3JqfGLuxkSD4KJq/?=
 =?us-ascii?Q?wBS/kiwneDAMvDsddGu7FIVcF7AhxMW8y+dV4RNTw2BUsrFZZZEVg2HyvNIA?=
 =?us-ascii?Q?Pi6B+BgNn5OaymDvyGx9E8UVisgLi+ceYkXJVnscMBff6Llvru1LTW93R7Nn?=
 =?us-ascii?Q?afprSuoOGyEOthlkDooE8RbOqJ+HbEEdLRewOLFcBWsO1XJffEI85IxF7USX?=
 =?us-ascii?Q?Uxx3MAMD5rFZvSOlvWPWg165VoDYsLKOz48+Q7GOqrXh6LJxDdbZBkRnL7ms?=
 =?us-ascii?Q?NhYSrU7zWBtJsBJ9IuV9CtDHPVTCwXRkwd3plqQzapGXbLtM0LM6F11SFogC?=
 =?us-ascii?Q?a0/wKrSaRvzBzNgV0GCu6vTP0tIOWEYmvJzLYtnz6WK/JeGtfK7EaI/12Su7?=
 =?us-ascii?Q?LDX6gHxJoB4lggNC5VHwLmEHbvf+miWmp8q9SieVNt392H17ewm5J+42/z3I?=
 =?us-ascii?Q?zx8fm/RoAwEpRPWVWT6fMseDQrFJ34gWW5cXKAq0kriwbHaTEfe3uKe6P33+?=
 =?us-ascii?Q?qV4Pbnb5qXuH2EWh+9Stc+J6DEg+M7az84zUf8FDrqJPzHQ4VLY5kG+iOhkc?=
 =?us-ascii?Q?0po/qe+XkXBPyMUUwe3GAIe3Lm90v1FrLLf6k8oyub1KxYytvi9pcoKOmaTL?=
 =?us-ascii?Q?FLUHC2utU36nRZYv5qGmaQmR2UECLfmdQMC8/thouYX0Xjo8lcUPkFn7llF+?=
 =?us-ascii?Q?S1pX0g5cIAH4YV183RuDt9HNPMENFVJA69m6KBstfcA89OH7agjkgjoj/rHX?=
 =?us-ascii?Q?6BZw4020kKSkEUWornMpGdh97+Grp+sacDHBgPTGGJ223v1wAtNSRGKO885g?=
 =?us-ascii?Q?tWYhvzo04EnPOIzJ6uvEd4seVbWuxFHm2rEZtkiAZDZ4fGAgWNRCVlzXaWKu?=
 =?us-ascii?Q?0CQVzByR4c83hPT2PIuHTyJGTtON/HJg8qx4mJmysQcAextSQf1vYr3PbP09?=
 =?us-ascii?Q?yODYxxtAykKK/U9hU5zQ2Lhtrx1cw0OVrmvzxY1rb37ZbwkyjOGvW3Kb9ziq?=
 =?us-ascii?Q?EvyN1Q/yX2vqpY7rH4S0YtRbnnExyW/60WmK7L1Xc9+0MDAbss3hS34jBgo5?=
 =?us-ascii?Q?y4LJrwct5fq7GiVQB6nVu7bGVMyPS4LhmfL/C22krVCDTxM2Nj5o5XfY84BD?=
 =?us-ascii?Q?mI+3H2+BY46dpArHNCPAtu04dcCTOWybVgOqdbGPaEg19F2hXoMb5yliGJUX?=
 =?us-ascii?Q?QuCHxQ0aBH24aRloLSJ9hBSy6PA1s6elJCOE12Dul9zpGt2s8q7WpfOSFZwV?=
 =?us-ascii?Q?IEzQO9clirJCQzmgQ14+dk0dCDru+lGOXPS0N1YzDCcXmYWPowggOBWBfuk9?=
 =?us-ascii?Q?lmrb3v3BTe93WRlDmfPxvoZhPYClShRv+Sj84eitVtQcZOW6LjLql5yksX3V?=
 =?us-ascii?Q?Y5oEhCTpQAhHY86utk7cWTlwKZUmcpT/Ko98KvWVXoZdCofWj5v6bruImZT0?=
 =?us-ascii?Q?+QphT8ur3/wI8TpNBsaduX0qzDdpfzReHlfTFqT3vuR6/RIk5Rc4jkg2uhu2?=
 =?us-ascii?Q?Z1MYrBY2BEDCs7MyYrxjEHJ+09n8rCNfJSIVH6lH5By3e9apon2jy0iFgSsZ?=
 =?us-ascii?Q?r441yxx4MRHN4atieYMXd6yY+8aUn3vQZ2xKfZ359247S8ExUOpURn18VS51?=
 =?us-ascii?Q?l7RzziA5cVFn6jMEz9T7w9Edn4OOHgU4bCS0ysSsYKyAPfdUVH5p+eTEx/n7?=
 =?us-ascii?Q?kY4/nXAwq40qLzttmWb9i6iuzAh/WI6s72VhMsJksibkaOB6Z68fUnrX7V9r?=
 =?us-ascii?Q?SJJq0ssGfA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1cae475-c4f8-4434-5931-08de7d3d2b9c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 18:04:41.3731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iR6al7t/YrEXAewVCbRw2CZjU1uadQ5ku+zDgG12Njw+FvHnGKfiZfbC9D2JbOd0FRMCC2lse3/TpFNEzrYN8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6022
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
X-Rspamd-Queue-Id: 6D44B231897
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
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Add safe Rust abstractions over the Linux kernel's GPU buddy
allocator for physical memory management. The GPU buddy allocator
implements a binary buddy system useful for GPU physical memory
allocation. nova-core will use it for physical memory allocation.

Christian Koenig mentioned he'd like to step down from reviewer role for
GPU buddy so updated accordingly. Arun/Matthew agree on the modified entry.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
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

diff --git a/MAINTAINERS b/MAINTAINERS
index 4c66f8261ff2..b2600dd05fc2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8513,7 +8513,9 @@ T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git
 F:	drivers/gpu/drm/nova/
 F:	drivers/gpu/drm/tyr/
 F:	drivers/gpu/nova-core/
+F:	rust/helpers/gpu.c
 F:	rust/kernel/drm/
+F:	rust/kernel/gpu/
 
 DRM DRIVERS FOR ALLWINNER A10
 M:	Chen-Yu Tsai <wens@kernel.org>
@@ -8926,7 +8928,7 @@ F:	include/drm/ttm/
 GPU BUDDY ALLOCATOR
 M:	Matthew Auld <matthew.auld@intel.com>
 M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
-R:	Christian Koenig <christian.koenig@amd.com>
+R:	Joel Fernandes <joelagnelf@nvidia.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
@@ -8935,6 +8937,8 @@ F:	drivers/gpu/buddy.c
 F:	drivers/gpu/tests/gpu_buddy_test.c
 F:	include/linux/gpu_buddy.h
 F:	include/drm/drm_buddy.h
+F:	rust/helpers/gpu.c
+F:	rust/kernel/gpu/
 
 DRM AUTOMATED TESTING
 M:	Helen Koike <helen.fornazier@gmail.com>
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 083cc44aa952..dbb765a9fdbd 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -29,6 +29,7 @@
 #include <linux/hrtimer_types.h>
 
 #include <linux/acpi.h>
+#include <linux/gpu_buddy.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -146,6 +147,16 @@ const vm_flags_t RUST_CONST_HELPER_VM_MIXEDMAP = VM_MIXEDMAP;
 const vm_flags_t RUST_CONST_HELPER_VM_HUGEPAGE = VM_HUGEPAGE;
 const vm_flags_t RUST_CONST_HELPER_VM_NOHUGEPAGE = VM_NOHUGEPAGE;
 
+#if IS_ENABLED(CONFIG_GPU_BUDDY)
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_RANGE_ALLOCATION = GPU_BUDDY_RANGE_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_TOPDOWN_ALLOCATION = GPU_BUDDY_TOPDOWN_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_CONTIGUOUS_ALLOCATION =
+								GPU_BUDDY_CONTIGUOUS_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_CLEAR_ALLOCATION = GPU_BUDDY_CLEAR_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_CLEARED = GPU_BUDDY_CLEARED;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_TRIM_DISABLE = GPU_BUDDY_TRIM_DISABLE;
+#endif
+
 #if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC_RUST)
 #include "../../drivers/android/binder/rust_binder.h"
 #include "../../drivers/android/binder/rust_binder_events.h"
diff --git a/rust/helpers/gpu.c b/rust/helpers/gpu.c
new file mode 100644
index 000000000000..38b1a4e6bef8
--- /dev/null
+++ b/rust/helpers/gpu.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/gpu_buddy.h>
+
+#ifdef CONFIG_GPU_BUDDY
+
+__rust_helper u64 rust_helper_gpu_buddy_block_offset(const struct gpu_buddy_block *block)
+{
+	return gpu_buddy_block_offset(block);
+}
+
+__rust_helper unsigned int rust_helper_gpu_buddy_block_order(struct gpu_buddy_block *block)
+{
+	return gpu_buddy_block_order(block);
+}
+
+__rust_helper u64 rust_helper_gpu_buddy_block_size(struct gpu_buddy *mm,
+						   struct gpu_buddy_block *block)
+{
+	return gpu_buddy_block_size(mm, block);
+}
+
+#endif /* CONFIG_GPU_BUDDY */
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 724fcb8240ac..a53929ce52a3 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -32,6 +32,7 @@
 #include "err.c"
 #include "irq.c"
 #include "fs.c"
+#include "gpu.c"
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
diff --git a/rust/kernel/gpu/buddy.rs b/rust/kernel/gpu/buddy.rs
new file mode 100644
index 000000000000..082dc79ab247
--- /dev/null
+++ b/rust/kernel/gpu/buddy.rs
@@ -0,0 +1,611 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GPU buddy allocator bindings.
+//!
+//! C header: [`include/linux/gpu_buddy.h`](srctree/include/linux/gpu_buddy.h)
+//!
+//! This module provides Rust abstractions over the Linux kernel's GPU buddy
+//! allocator, which implements a binary buddy memory allocator.
+//!
+//! The buddy allocator manages a contiguous address space and allocates blocks
+//! in power-of-two sizes, useful for GPU physical memory management.
+//!
+//! # Examples
+//!
+//! Create a buddy allocator and perform a basic range allocation:
+//!
+//! ```
+//! use kernel::{
+//!     gpu::buddy::{GpuBuddy, GpuBuddyAllocMode, GpuBuddyAllocFlags, GpuBuddyParams},
+//!     prelude::*,
+//!     ptr::Alignment,
+//!     sizes::*, //
+//! };
+//!
+//! // Create a 1GB buddy allocator with 4KB minimum chunk size.
+//! let buddy = GpuBuddy::new(GpuBuddyParams {
+//!     base_offset: 0,
+//!     physical_memory_size: SZ_1G as u64,
+//!     chunk_size: SZ_4K,
+//! })?;
+//!
+//! assert_eq!(buddy.size(), SZ_1G as u64);
+//! assert_eq!(buddy.chunk_size(), SZ_4K);
+//! let initial_free = buddy.free_memory();
+//!
+//! // Allocate 16MB, results in a single 16MB block at offset 0.
+//! let allocated = KBox::pin_init(
+//!     buddy.alloc_blocks(
+//!         GpuBuddyAllocMode::Range { start: 0, end: 0 },
+//!         SZ_16M,
+//!         Alignment::new::<SZ_16M>(),
+//!         GpuBuddyFlags::default(),
+//!     ),
+//!     GFP_KERNEL,
+//! )?;
+//! assert_eq!(buddy.free_memory(), initial_free - SZ_16M as u64);
+//!
+//! let block = allocated.iter().next().expect("expected one block");
+//! assert_eq!(block.offset(), 0);
+//! assert_eq!(block.order(), 12); // 2^12 pages = 16MB
+//! assert_eq!(block.size(), SZ_16M);
+//!
+//! // Dropping the allocation returns the memory to the buddy allocator.
+//! drop(allocated);
+//! assert_eq!(buddy.free_memory(), initial_free);
+//! # Ok::<(), Error>(())
+//! ```
+//!
+//! Top-down allocation allocates from the highest addresses:
+//!
+//! ```
+//! # use kernel::{
+//! #     gpu::buddy::{GpuBuddy, GpuBuddyAllocMode, GpuBuddyAllocFlags, GpuBuddyParams},
+//! #     prelude::*,
+//! #     ptr::Alignment,
+//! #     sizes::*, //
+//! # };
+//! # let buddy = GpuBuddy::new(GpuBuddyParams {
+//! #     base_offset: 0,
+//! #     physical_memory_size: SZ_1G as u64,
+//! #     chunk_size: SZ_4K,
+//! # })?;
+//! # let initial_free = buddy.free_memory();
+//! let topdown = KBox::pin_init(
+//!     buddy.alloc_blocks(
+//!         GpuBuddyAllocMode::TopDown,
+//!         SZ_16M,
+//!         Alignment::new::<SZ_16M>(),
+//!         GpuBuddyFlags::default(),
+//!     ),
+//!     GFP_KERNEL,
+//! )?;
+//! assert_eq!(buddy.free_memory(), initial_free - SZ_16M as u64);
+//!
+//! let block = topdown.iter().next().expect("expected one block");
+//! assert_eq!(block.offset(), (SZ_1G - SZ_16M) as u64);
+//! assert_eq!(block.order(), 12);
+//! assert_eq!(block.size(), SZ_16M);
+//!
+//! // Dropping the allocation returns the memory to the buddy allocator.
+//! drop(topdown);
+//! assert_eq!(buddy.free_memory(), initial_free);
+//! # Ok::<(), Error>(())
+//! ```
+//!
+//! Non-contiguous allocation can fill fragmented memory by returning multiple
+//! blocks:
+//!
+//! ```
+//! # use kernel::{
+//! #     gpu::buddy::{
+//! #         GpuBuddy, GpuBuddyAllocFlags, GpuBuddyAllocMode, GpuBuddyParams,
+//! #     },
+//! #     prelude::*,
+//! #     ptr::Alignment,
+//! #     sizes::*, //
+//! # };
+//! # let buddy = GpuBuddy::new(GpuBuddyParams {
+//! #     base_offset: 0,
+//! #     physical_memory_size: SZ_1G as u64,
+//! #     chunk_size: SZ_4K,
+//! # })?;
+//! # let initial_free = buddy.free_memory();
+//! // Create fragmentation by allocating 4MB blocks at [0,4M) and [8M,12M).
+//! let frag1 = KBox::pin_init(
+//!     buddy.alloc_blocks(
+//!         GpuBuddyAllocMode::Range { start: 0, end: SZ_4M as u64 },
+//!         SZ_4M,
+//!         Alignment::new::<SZ_4M>(),
+//!         GpuBuddyFlags::default(),
+//!     ),
+//!     GFP_KERNEL,
+//! )?;
+//! assert_eq!(buddy.free_memory(), initial_free - SZ_4M as u64);
+//!
+//! let frag2 = KBox::pin_init(
+//!     buddy.alloc_blocks(
+//!         GpuBuddyAllocMode::Range {
+//!             start: SZ_8M as u64,
+//!             end: (SZ_8M + SZ_4M) as u64,
+//!         },
+//!         SZ_4M,
+//!         Alignment::new::<SZ_4M>(),
+//!         GpuBuddyFlags::default(),
+//!     ),
+//!     GFP_KERNEL,
+//! )?;
+//! assert_eq!(buddy.free_memory(), initial_free - SZ_8M as u64);
+//!
+//! // Allocate 8MB, this returns 2 blocks from the holes.
+//! let fragmented = KBox::pin_init(
+//!     buddy.alloc_blocks(
+//!         GpuBuddyAllocMode::Range { start: 0, end: SZ_16M as u64 },
+//!         SZ_8M,
+//!         Alignment::new::<SZ_4M>(),
+//!         GpuBuddyFlags::default(),
+//!     ),
+//!     GFP_KERNEL,
+//! )?;
+//! assert_eq!(buddy.free_memory(), initial_free - SZ_16M as u64);
+//!
+//! let (mut count, mut total) = (0u32, 0usize);
+//! for block in fragmented.iter() {
+//!     assert_eq!(block.size(), SZ_4M);
+//!     total += block.size();
+//!     count += 1;
+//! }
+//! assert_eq!(total, SZ_8M);
+//! assert_eq!(count, 2);
+//! # Ok::<(), Error>(())
+//! ```
+//!
+//! Contiguous allocation fails when only fragmented space is available:
+//!
+//! ```
+//! # use kernel::{
+//! #     gpu::buddy::{
+//! #         GpuBuddy, GpuBuddyAllocFlag, GpuBuddyAllocMode, GpuBuddyParams,
+//! #     },
+//! #     prelude::*,
+//! #     ptr::Alignment,
+//! #     sizes::*, //
+//! # };
+//! // Create a small 16MB buddy allocator with fragmented memory.
+//! let small = GpuBuddy::new(GpuBuddyParams {
+//!     base_offset: 0,
+//!     physical_memory_size: SZ_16M as u64,
+//!     chunk_size: SZ_4K,
+//! })?;
+//!
+//! let _hole1 = KBox::pin_init(
+//!     small.alloc_blocks(
+//!         GpuBuddyAllocMode::Range { start: 0, end: SZ_4M as u64 },
+//!         SZ_4M,
+//!         Alignment::new::<SZ_4M>(),
+//!         GpuBuddyFlags::default(),
+//!     ),
+//!     GFP_KERNEL,
+//! )?;
+//!
+//! let _hole2 = KBox::pin_init(
+//!     small.alloc_blocks(
+//!         GpuBuddyAllocMode::Range {
+//!             start: SZ_8M as u64,
+//!             end: (SZ_8M + SZ_4M) as u64,
+//!         },
+//!         SZ_4M,
+//!         Alignment::new::<SZ_4M>(),
+//!         GpuBuddyFlags::default(),
+//!     ),
+//!     GFP_KERNEL,
+//! )?;
+//!
+//! // 8MB contiguous should fail, only two non-contiguous 4MB holes exist.
+//! let result = KBox::pin_init(
+//!     small.alloc_blocks(
+//!         GpuBuddyAllocMode::Simple,
+//!         SZ_8M,
+//!         Alignment::new::<SZ_4M>(),
+//!         GpuBuddyAllocFlag::Contiguous.into(),
+//!     ),
+//!     GFP_KERNEL,
+//! );
+//! assert!(result.is_err());
+//! # Ok::<(), Error>(())
+//! ```
+
+use crate::{
+    bindings,
+    clist_create,
+    error::to_result,
+    interop::list::CListHead,
+    new_mutex,
+    prelude::*,
+    ptr::Alignment,
+    sync::{
+        lock::mutex::MutexGuard,
+        Arc,
+        Mutex, //
+    },
+    types::Opaque, //
+};
+
+/// Allocation mode for the GPU buddy allocator.
+///
+/// The mode determines the primary allocation strategy. Modes are mutually
+/// exclusive: an allocation is either simple, range-constrained, or top-down.
+///
+/// Orthogonal modifier flags (e.g., contiguous, clear) are specified separately
+/// via [`GpuBuddyAllocFlags`].
+#[derive(Copy, Clone, Debug, PartialEq, Eq)]
+pub enum GpuBuddyAllocMode {
+    /// Simple allocation without constraints.
+    Simple,
+    /// Range-based allocation between `start` and `end` addresses.
+    Range {
+        /// Start of the allocation range.
+        start: u64,
+        /// End of the allocation range.
+        end: u64,
+    },
+    /// Allocate from top of address space downward.
+    TopDown,
+}
+
+impl GpuBuddyAllocMode {
+    // Returns the C flags corresponding to the allocation mode.
+    fn into_flags(self) -> usize {
+        match self {
+            Self::Simple => 0,
+            Self::Range { .. } => bindings::GPU_BUDDY_RANGE_ALLOCATION as usize,
+            Self::TopDown => bindings::GPU_BUDDY_TOPDOWN_ALLOCATION as usize,
+        }
+    }
+
+    // Extracts the range start/end, defaulting to (0, 0) for non-range modes.
+    fn range(self) -> (u64, u64) {
+        match self {
+            Self::Range { start, end } => (start, end),
+            _ => (0, 0),
+        }
+    }
+}
+
+crate::impl_flags!(
+    /// Modifier flags for GPU buddy allocation.
+    ///
+    /// These flags can be combined with any [`GpuBuddyAllocMode`] to control
+    /// additional allocation behavior.
+    #[derive(Clone, Copy, Default, PartialEq, Eq)]
+    pub struct GpuBuddyAllocFlags(u32);
+
+    /// Individual modifier flag for GPU buddy allocation.
+    #[derive(Clone, Copy, PartialEq, Eq)]
+    pub enum GpuBuddyAllocFlag {
+        /// Allocate physically contiguous blocks.
+        Contiguous = bindings::GPU_BUDDY_CONTIGUOUS_ALLOCATION as u32,
+
+        /// Request allocation from cleared (zeroed) memory.
+        Clear = bindings::GPU_BUDDY_CLEAR_ALLOCATION as u32,
+
+        /// Disable trimming of partially used blocks.
+        TrimDisable = bindings::GPU_BUDDY_TRIM_DISABLE as u32,
+    }
+);
+
+/// Parameters for creating a GPU buddy allocator.
+pub struct GpuBuddyParams {
+    /// Base offset (in bytes) where the managed memory region starts.
+    /// Allocations will be offset by this value.
+    pub base_offset: u64,
+    /// Total physical memory size (in bytes) managed by the allocator.
+    pub physical_memory_size: u64,
+    /// Minimum allocation unit / chunk size (in bytes), must be >= 4KB.
+    pub chunk_size: usize,
+}
+
+/// Inner structure holding the actual buddy allocator.
+///
+/// # Synchronization
+///
+/// The C `gpu_buddy` API requires synchronization (see `include/linux/gpu_buddy.h`).
+/// [`GpuBuddyGuard`] ensures that the lock is held for all
+/// allocator and free operations, preventing races between concurrent allocations
+/// and the freeing that occurs when [`AllocatedBlocks`] is dropped.
+///
+/// # Invariants
+///
+/// The inner [`Opaque`] contains an initialized buddy allocator.
+#[pin_data(PinnedDrop)]
+struct GpuBuddyInner {
+    #[pin]
+    inner: Opaque<bindings::gpu_buddy>,
+
+    // TODO: Replace `Mutex<()>` with `Mutex<Opaque<..>>` once `Mutex::new()`
+    // accepts `impl PinInit<T>`.
+    #[pin]
+    lock: Mutex<()>,
+    /// Cached creation parameters (do not change after init).
+    params: GpuBuddyParams,
+}
+
+impl GpuBuddyInner {
+    /// Create a pin-initializer for the buddy allocator.
+    fn new(params: GpuBuddyParams) -> impl PinInit<Self, Error> {
+        let size = params.physical_memory_size;
+        let chunk_size = params.chunk_size;
+
+        // INVARIANT: `gpu_buddy_init` returns 0 on success, at which point the
+        // `gpu_buddy` structure is initialized and ready for use with all
+        // `gpu_buddy_*` APIs. `try_pin_init!` only completes if all fields succeed,
+        // so the invariant holds when construction finishes.
+        try_pin_init!(Self {
+            inner <- Opaque::try_ffi_init(|ptr| {
+                // SAFETY: `ptr` points to valid uninitialized memory from the pin-init
+                // infrastructure. `gpu_buddy_init` will initialize the structure.
+                to_result(unsafe { bindings::gpu_buddy_init(ptr, size, chunk_size as u64) })
+            }),
+            lock <- new_mutex!(()),
+            params,
+        })
+    }
+
+    /// Lock the mutex and return a guard for accessing the allocator.
+    fn lock(&self) -> GpuBuddyGuard<'_> {
+        GpuBuddyGuard {
+            inner: self,
+            _guard: self.lock.lock(),
+        }
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for GpuBuddyInner {
+    fn drop(self: Pin<&mut Self>) {
+        let guard = self.lock();
+
+        // SAFETY: Per the type invariant, `inner` contains an initialized
+        // allocator. `guard` provides exclusive access.
+        unsafe {
+            bindings::gpu_buddy_fini(guard.as_raw());
+        }
+    }
+}
+
+// SAFETY: GpuBuddyInner can be sent between threads.
+unsafe impl Send for GpuBuddyInner {}
+
+// SAFETY: `GpuBuddyInner` is `Sync` because `GpuBuddyInner::lock`
+// serializes all access to the C allocator, preventing data races.
+unsafe impl Sync for GpuBuddyInner {}
+
+// Guard that proves the lock is held, enabling access to the allocator.
+// The `_guard` holds the lock for the duration of this guard's lifetime.
+struct GpuBuddyGuard<'a> {
+    inner: &'a GpuBuddyInner,
+    _guard: MutexGuard<'a, ()>,
+}
+
+impl GpuBuddyGuard<'_> {
+    /// Get a raw pointer to the underlying C `gpu_buddy` structure.
+    fn as_raw(&self) -> *mut bindings::gpu_buddy {
+        self.inner.inner.get()
+    }
+}
+
+/// GPU buddy allocator instance.
+///
+/// This structure wraps the C `gpu_buddy` allocator using reference counting.
+/// The allocator is automatically cleaned up when all references are dropped.
+///
+/// Refer to the module-level documentation for usage examples.
+pub struct GpuBuddy(Arc<GpuBuddyInner>);
+
+impl GpuBuddy {
+    /// Create a new buddy allocator.
+    ///
+    /// Creates a buddy allocator that manages a contiguous address space of the given
+    /// size, with the specified minimum allocation unit (chunk_size must be at least 4KB).
+    pub fn new(params: GpuBuddyParams) -> Result<Self> {
+        Ok(Self(Arc::pin_init(GpuBuddyInner::new(params), GFP_KERNEL)?))
+    }
+
+    /// Get the base offset for allocations.
+    pub fn base_offset(&self) -> u64 {
+        self.0.params.base_offset
+    }
+
+    /// Get the chunk size (minimum allocation unit).
+    pub fn chunk_size(&self) -> usize {
+        self.0.params.chunk_size
+    }
+
+    /// Get the total managed size.
+    pub fn size(&self) -> u64 {
+        self.0.params.physical_memory_size
+    }
+
+    /// Get the available (free) memory in bytes.
+    pub fn free_memory(&self) -> u64 {
+        let guard = self.0.lock();
+
+        // SAFETY: Per the type invariant, `inner` contains an initialized allocator.
+        // `guard` provides exclusive access.
+        unsafe { (*guard.as_raw()).avail }
+    }
+
+    /// Allocate blocks from the buddy allocator.
+    ///
+    /// Returns a pin-initializer for [`AllocatedBlocks`].
+    ///
+    /// Takes `&self` instead of `&mut self` because the internal [`Mutex`] provides
+    /// synchronization - no external `&mut` exclusivity needed.
+    pub fn alloc_blocks(
+        &self,
+        mode: GpuBuddyAllocMode,
+        size: usize,
+        min_block_size: Alignment,
+        flags: GpuBuddyAllocFlags,
+    ) -> impl PinInit<AllocatedBlocks, Error> {
+        let buddy_arc = Arc::clone(&self.0);
+        let (start, end) = mode.range();
+        let mode_flags = mode.into_flags();
+        let modifier_flags = u32::from(flags) as usize;
+
+        // Create pin-initializer that initializes list and allocates blocks.
+        try_pin_init!(AllocatedBlocks {
+            buddy: buddy_arc,
+            list <- CListHead::new(),
+            _: {
+                // Lock while allocating to serialize with concurrent frees.
+                let guard = buddy.lock();
+
+                // SAFETY: Per the type invariant, `inner` contains an initialized
+                // allocator. `guard` provides exclusive access.
+                to_result(unsafe {
+                    bindings::gpu_buddy_alloc_blocks(
+                        guard.as_raw(),
+                        start,
+                        end,
+                        size as u64,
+                        min_block_size.as_usize() as u64,
+                        list.as_raw(),
+                        mode_flags | modifier_flags,
+                    )
+                })?
+            }
+        })
+    }
+}
+
+/// Allocated blocks from the buddy allocator with automatic cleanup.
+///
+/// This structure owns a list of allocated blocks and ensures they are
+/// automatically freed when dropped. Use `iter()` to iterate over all
+/// allocated blocks.
+///
+/// # Invariants
+///
+/// - `list` is an initialized, valid list head containing allocated blocks.
+#[pin_data(PinnedDrop)]
+pub struct AllocatedBlocks {
+    #[pin]
+    list: CListHead,
+    buddy: Arc<GpuBuddyInner>,
+}
+
+impl AllocatedBlocks {
+    /// Check if the block list is empty.
+    pub fn is_empty(&self) -> bool {
+        // An empty list head points to itself.
+        !self.list.is_linked()
+    }
+
+    /// Iterate over allocated blocks.
+    ///
+    /// Returns an iterator yielding [`AllocatedBlock`] values. Each [`AllocatedBlock`]
+    /// borrows `self` and is only valid for the duration of that borrow.
+    pub fn iter(&self) -> impl Iterator<Item = AllocatedBlock<'_>> + '_ {
+        // SAFETY:
+        // - Per the type invariant, `list` is an initialized sentinel `list_head`
+        //   and is not concurrently modified (we hold a `&self` borrow).
+        // - The list contains `gpu_buddy_block` items linked via
+        //   `__bindgen_anon_1.link`.
+        // - `Block` is `#[repr(transparent)]` over `gpu_buddy_block`.
+        let clist = clist_create!(unsafe {
+            self.list.as_raw(),
+            Block,
+            bindings::gpu_buddy_block,
+            __bindgen_anon_1.link
+        });
+
+        clist
+            .iter()
+            .map(|this| AllocatedBlock { this, blocks: self })
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for AllocatedBlocks {
+    fn drop(self: Pin<&mut Self>) {
+        let guard = self.buddy.lock();
+
+        // SAFETY:
+        // - list is valid per the type's invariants.
+        // - guard provides exclusive access to the allocator.
+        unsafe {
+            bindings::gpu_buddy_free_list(guard.as_raw(), self.list.as_raw(), 0);
+        }
+    }
+}
+
+/// A GPU buddy block.
+///
+/// Transparent wrapper over C `gpu_buddy_block` structure. This type is returned
+/// as references during iteration over [`AllocatedBlocks`].
+///
+/// # Invariants
+///
+/// The inner [`Opaque`] contains a valid, allocated `gpu_buddy_block`.
+#[repr(transparent)]
+struct Block(Opaque<bindings::gpu_buddy_block>);
+
+impl Block {
+    /// Get a raw pointer to the underlying C block.
+    fn as_raw(&self) -> *mut bindings::gpu_buddy_block {
+        self.0.get()
+    }
+
+    /// Get the block's raw offset in the buddy address space (without base offset).
+    fn offset(&self) -> u64 {
+        // SAFETY: `self.as_raw()` is valid per the type's invariants.
+        unsafe { bindings::gpu_buddy_block_offset(self.as_raw()) }
+    }
+
+    /// Get the block order.
+    fn order(&self) -> u32 {
+        // SAFETY: `self.as_raw()` is valid per the type's invariants.
+        unsafe { bindings::gpu_buddy_block_order(self.as_raw()) }
+    }
+}
+
+// SAFETY: `Block` is a wrapper around `gpu_buddy_block` which can be
+// sent across threads safely.
+unsafe impl Send for Block {}
+
+// SAFETY: `Block` is only accessed through shared references after
+// allocation, and thus safe to access concurrently across threads.
+unsafe impl Sync for Block {}
+
+/// A buddy block paired with its owning [`AllocatedBlocks`] context.
+///
+/// Unlike a raw block, which only knows its offset within the buddy address
+/// space, an [`AllocatedBlock`] also has access to the allocator's `base_offset`
+/// and `chunk_size`, enabling it to compute absolute offsets and byte sizes.
+///
+/// Returned by [`AllocatedBlocks::iter()`].
+pub struct AllocatedBlock<'a> {
+    this: &'a Block,
+    blocks: &'a AllocatedBlocks,
+}
+
+impl AllocatedBlock<'_> {
+    /// Get the block's offset in the address space.
+    ///
+    /// Returns the absolute offset including the allocator's base offset.
+    /// This is the actual address to use for accessing the allocated memory.
+    pub fn offset(&self) -> u64 {
+        self.blocks.buddy.params.base_offset + self.this.offset()
+    }
+
+    /// Get the block order (size = chunk_size << order).
+    pub fn order(&self) -> u32 {
+        self.this.order()
+    }
+
+    /// Get the block's size in bytes.
+    pub fn size(&self) -> usize {
+        self.blocks.buddy.params.chunk_size << self.this.order()
+    }
+}
diff --git a/rust/kernel/gpu/mod.rs b/rust/kernel/gpu/mod.rs
new file mode 100644
index 000000000000..8f25e6367edc
--- /dev/null
+++ b/rust/kernel/gpu/mod.rs
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GPU subsystem abstractions.
+
+pub mod buddy;
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index bb741f1e0dfd..63e3f656eb6c 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -98,6 +98,8 @@
 pub mod firmware;
 pub mod fmt;
 pub mod fs;
+#[cfg(CONFIG_GPU_BUDDY = "y")]
+pub mod gpu;
 #[cfg(CONFIG_I2C = "y")]
 pub mod i2c;
 pub mod id_pool;
-- 
2.34.1

