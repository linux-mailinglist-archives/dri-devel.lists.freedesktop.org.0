Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67190CA58D4
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 22:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C8010E9CF;
	Thu,  4 Dec 2025 21:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uo61xScI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012028.outbound.protection.outlook.com [52.101.43.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C1010E9C6;
 Thu,  4 Dec 2025 21:53:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6SkuO7pXORz6SbJjMVm4YGsheQ63V8JaiK4BDNSMYJ3ghoS/w5g2+NktT+oMQ1rnWI00gDcTF1rxkHZeXuhTEtVZYp+FGhfdBNdHl2Nr8U7KxBsHqxWOlY2cUJSkeDKQHTpNP81te0PtMYEowlnzCjf/KlCjiKypzha/ddbsNfYpebrxIjIxinAj/Q2xmfevxZnaFMGIZorSFs3qUaaaPkMvwa7Yx2niTe7vtnIx20K2gMWSEHKNRc+d+gfdAt6m+k4P8EmfheY9b1+4MXVC660Zu62FGNml/P5fR/FCjcvhiUhkU68drmFD2h2Zy/55edqfKHsjGze+Xnh8RmELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ob6rPsBBlhCeQqaLlscWxUgKML1o1lmWwr4r+jKCpG4=;
 b=EjNKbFBsa1EDWg3+vWZQ6Bb/vjWUKPU0RLppavIfXvD/Ir3E7ogYqEOkjra0KdnEiMMj196/MLs3FKGFZMZiifLGXSSzUOXz6PCAbc+4fLB7wOXGrjv2aUUueNgjKvAmlSPqjP7pLqi/gJ4D6hYWo7Ym+dtCkwpXAk7AIM/B5HUhrek3Bf45flwWsoM15ztj1xMYERbDF19G/bl7Ut2VICivj/CWppdI8BLBZFFYuFdLm65JvKEY6s8wUf09iLrIQzLHz+hLh+QLdVDmegXgXFo5scDZQ9ZTvUFXSvE9DUVPoYXUun/5Pyeqp+3p/vAgU6tevx8OnLzN1x2mYaxpLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ob6rPsBBlhCeQqaLlscWxUgKML1o1lmWwr4r+jKCpG4=;
 b=uo61xScIVSKQTFdYbH2zOLUxSlsUPkkSJ2wRqHdS3U36m7QEJ/4rxz0phKe3Q7UTJkF1Uq8sS3MRmDWx69BGbJxz3n8Q0EL5VFajn9Ki8KdU9wXcN3PhEpPm1mXriiQb+A0vIQFISnBa8mZNtEFI9szQ4UcK6a6tAI+ywaodk9/zChcSaCuOfFoGiXmaWuPkUieOdzJQ8Ub+5qzCIOsVWanfxCqYYvoEMdzjluIQOvdIfFIfOOvRlgptl6OdEl2n2hcVrSbPer8bKxmYFgFN93mcORSrySFHz1iJNvJUJ/h4AfrL+xUrrZp7SFXDkjCF8I3G+j/j85ip4dtP4axK8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BN3PR12MB9596.namprd12.prod.outlook.com (2603:10b6:408:2cb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 21:53:12 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 21:53:12 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org, Zhi Wang <zhiw@nvidia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Edwin Peer <epeer@nvidia.com>,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v4 1/3] rust: clist: Add support to interface with C linked
 lists
Date: Thu,  4 Dec 2025 16:51:27 -0500
Message-Id: <20251204215129.2357292-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251204215129.2357292-1-joelagnelf@nvidia.com>
References: <20251204215129.2357292-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0054.namprd15.prod.outlook.com
 (2603:10b6:208:237::23) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BN3PR12MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: 8464dd2b-046c-47e3-246a-08de337f851e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+Tf77sgTWatMB/1MPeWoZdmrIYcsaqpWyWabBl4OJKt0P07t6aRAAuM8CDcO?=
 =?us-ascii?Q?vdUUVx6ZLGOUCjynntOFxNadSpv70SrMgGhRWMAXPwVFxWnbVZDOyApo/G1s?=
 =?us-ascii?Q?0DjQkEBeJ3FyJjPw8gaamCqKqIokiq2GWdiqpt4jCejaMVBuTVFirTc1mnFP?=
 =?us-ascii?Q?kLCyvvmBdK8G4REXEy6rXyIRj1S9j4jVMPfd4DWO1yfnbh7X/bXllY+dlkaC?=
 =?us-ascii?Q?EQnFSR5FT31+CBPwBs+KDFPzRKCvynKqA0XNEyUeIGIstvph5oYuI4ANr4Vh?=
 =?us-ascii?Q?dxwLK1CzdN+7oyeMU2RRTvTJ2vF8o7UeV5QpUmfqTL6U51K8uzZOEUIbKXHw?=
 =?us-ascii?Q?Cx1VTBLlXc6Rkf5oF+HomX1IjjptfiWhezcpuHgNrZPhaW1BUBwyY0K+lI8M?=
 =?us-ascii?Q?sPQi9RaI8iksFgqWi80bP4s3/lAOWYJ4gWg9LcPWMXTcyj+xaTUPj5QFtstg?=
 =?us-ascii?Q?hV51ZWHVWcnVapg8s6hEHWW0Tr5A9iJIZCyL5QFgWH9dYEEYd+zTZ8rrtc6b?=
 =?us-ascii?Q?uflSu5Fow7DPUwum/mee9eec1cBXzIqk4eTfCTsYNZiON0qK0QTD7DgqWtQw?=
 =?us-ascii?Q?bowDZdmsWmd0eUSM4mj762BsgQslEIiFgA/0r5ZptOr2VOxo+/zd0xh58j2C?=
 =?us-ascii?Q?Cc+tc8eNImP5zdWQasqAkqpOv9JuxIQep8fvmzAuQ0ID+AGF5CxdHtS37lAK?=
 =?us-ascii?Q?SXtOFPb7kqm/M0z4q8h3rUen5e7EixffcXimZ4JiCficUtqDmt84+suNvIeu?=
 =?us-ascii?Q?oN2msZYthKqPd+vvXD6Dj3jW8KaYFAGQ4iAmj0ZmADzrk0j/BQDmCLJBsyhP?=
 =?us-ascii?Q?59t5bDBoi7k6wkprSKlGINiEGFyYUCxnCF+cGMIQdxrCktQAvFN6ZlRJ3MlP?=
 =?us-ascii?Q?lifQ5uxAZsIeOHCwRmW33X1Uf6hOMBi/c76UNgxqGgPAdhjsRfBbvBKeud+e?=
 =?us-ascii?Q?OBcc2N6oTutrMQxNQ4ZAoYVy4jrV1vU/idVBZ5usOPp0ab6+v0ZT93BG7zNk?=
 =?us-ascii?Q?2TbxcyHHRP+4kw7YvonknYsKLNeClOTiL1tjA6dRBCsow+iG2pR0lzHByiwb?=
 =?us-ascii?Q?6mm30rY0b2ewbzOIsgvF3Nw4DLqof7LnQZRq3GHY/lo+UPMCWZeIDn+RDNm0?=
 =?us-ascii?Q?8hPadQPVeV/a+tS63ExoF1/dVzMy9//DXcSywAJlklol6K0fnvVxlILE+t4l?=
 =?us-ascii?Q?Tu8H/4tXAeloEXkdJcg1FvWQGbLuml2GEN+NM9V8HrXaS+OZ7jV5Icsit6FJ?=
 =?us-ascii?Q?sHLBuTKciukmcJe10hDAtTr9SiPw3d4XI6Mf9GkzOQauc6Je2WvB3Xau0VfS?=
 =?us-ascii?Q?uTdyEUtT/DBShBGWJoJfkSEs1XEn+o1bt4g0eenxt312/+oCdl2aSOPQF3li?=
 =?us-ascii?Q?18K7ZLTeYlnzDMVLM+/Fix6tCiwPGVzRfhKmJYeZQzs1nmG1NjOgwvdGfYGK?=
 =?us-ascii?Q?vVpAg+G23q4PS1x0fsDUYQpXT81rPWx8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MeUIoCdDlHL5imMVMGdeofV6ArSba5LwJaDWtgtgU1/5dinODeIYXqP7dXdW?=
 =?us-ascii?Q?52O4oOXxzchf8nHSKkSkfl5wZ17RG2S0bU6EUPYy2/4FKKksCUoKqCltOrVg?=
 =?us-ascii?Q?tmozgvw4Cm8ceZzBwGRB7YmvV6TfBizabtXDK5SpFmjiZ/WGw8v1gfRnpp7K?=
 =?us-ascii?Q?g/FatI4nkxaTZMv1Qw5FgEU2ydU1rINKf+2szs61LPuEb6xcZCLn8wkJoIy4?=
 =?us-ascii?Q?OM8SUZzhwPchjnd1ZPQ0graKhgL90xdldZpvqysJfjAZkaVcFHxqJ+mEzS4P?=
 =?us-ascii?Q?TkZq3zLbSYn/vC3Gxcolgg4NDHgkr+75Y9QSHmtRlJaOzyVb0n/3Ea3PoX9W?=
 =?us-ascii?Q?gMRa5LKsk5tiCRVmp+EsRGriP6ON6jtiCMz3Qmtqr9g6dGa42Sf6huPAi8W+?=
 =?us-ascii?Q?p/wZK6ddPRUqg0PkJuLLk/pjzKTSqo8BnBLKQakGKVsS44iaCnz/mE7eFoOC?=
 =?us-ascii?Q?9Ol391u0ipF9ES9JPQFwIBoJB09VUj/ZRJxbEZYpMCqml1xaXwa/4v3FWi04?=
 =?us-ascii?Q?S1r/FIABbGm5D7zpvQYccrgd/NltP7oFsmUai/B4IiZZltsfMpcR3nlcbL7Q?=
 =?us-ascii?Q?pDxs1d2BX0+FXq0b9pjpRTT9pEbTgBEMW1/TFplTZIopvxp6x603CI3Lkmrg?=
 =?us-ascii?Q?hxXZ7/YNqflb0ytw3U0T7cLftwhFi5+Ecv9bs8Mb5IkIYz6w6f/he4a+db0a?=
 =?us-ascii?Q?1kR78hQGOI7GEYy9MZsYW5Bedbxfmdk49ivJe2i7QHqufDQLlkagk3mPuwV2?=
 =?us-ascii?Q?/cyefMmlxlevChK9LHALp5NVoWwf5aV2zcTjWB7cdOtlAesYyRQfSTLPkSfR?=
 =?us-ascii?Q?9D7I7eLbFYFU05wTXKJCZGY4sXDlI1q4fKB2O9eSGmSO1rLf7cdQ3SurTZP0?=
 =?us-ascii?Q?RWO1A3Fhs/504bLC64EEjLvkrkp32CkTWeAFbJnnp+uetAV7xlsIvDmqpVFQ?=
 =?us-ascii?Q?eOApPTl2h4I5uE59auA5Xyb3K2UgV7pTgY3dLa+O6SDWFQb9Fo1P7bVNFTTs?=
 =?us-ascii?Q?Apit6c3iu7OLC23QkNZB3XEiMXaa2XO1GgguWY1Eb71+lgZvdJ8a+zdghFBS?=
 =?us-ascii?Q?r2JByjx4z8AlPI/JidM7NFipn1pa/btg8O3v8g5a520lA2eQIW252KB0XJ9d?=
 =?us-ascii?Q?pLpwWgP3npNkFCCsUPqB8FlAC0Rpn9EREOVkatJVirpydxPddx/fjjqxh7Rg?=
 =?us-ascii?Q?US+7zODARxzfz8q7U7lLr4GcHFvul2mTHUY91pMS3xCJ7lxhW4+PBg86SLPB?=
 =?us-ascii?Q?eX95PYZf8Fz7KyzH3k9hVJkFAFv9dXHKpImSbvyQkOwgiAiYYQYG5wCLhji1?=
 =?us-ascii?Q?+xeF22COX073dpHwCq2IaJoux/NsExQBq144zrosLTzgzR3sldXKVX93KWRJ?=
 =?us-ascii?Q?CetLsXZu/TJxsSjTyMevNUh+MV5rpW4LUCwK/lh1MwFJGUomW5tlcEqoeftC?=
 =?us-ascii?Q?KUIAUJI2zEpv52SJvfz2SeXvgEFcxrUwYTzYZMWXWQJfOdLYbrVU8avNHk+B?=
 =?us-ascii?Q?MNM+VfuIegGZUzcoGj0g08XxCF4Rnk14DnB2lrriCXA8A/TkwR2riA9QYtsP?=
 =?us-ascii?Q?otgZfG4eSvllBUFzg1quARAFwm5fiYs28P4SqrAY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8464dd2b-046c-47e3-246a-08de337f851e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 21:53:12.1403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekDeWj7ku9B7lNb+GgqhFC4XLn1tLis+KNHqz2L6wBlIC7NiTkBKHchOU95arCPpxTI1c+Vw0+2F3tmCHvCkOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9596
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

Add a new module `clist` for working with C's doubly circular linked
lists. Provide low-level iteration over list nodes.

Typed iteration over actual items is provided with a `clist_create`
macro to assist in creation of the `Clist` type.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 MAINTAINERS            |   7 +
 rust/helpers/helpers.c |   1 +
 rust/helpers/list.c    |  12 ++
 rust/kernel/clist.rs   | 357 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 5 files changed, 378 insertions(+)
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/clist.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f7aa6a8a9a1..fb2ff877b6d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22666,6 +22666,13 @@ F:	rust/kernel/init.rs
 F:	rust/pin-init/
 K:	\bpin-init\b|pin_init\b|PinInit
 
+RUST TO C LIST INTERFACES
+M:	Joel Fernandes <joelagnelf@nvidia.com>
+M:	Alexandre Courbot <acourbot@nvidia.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+F:	rust/kernel/clist.rs
+
 RXRPC SOCKETS (AF_RXRPC)
 M:	David Howells <dhowells@redhat.com>
 M:	Marc Dionne <marc.dionne@auristor.com>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 79c72762ad9c..634fa2386bbb 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -32,6 +32,7 @@
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
+#include "list.c"
 #include "maple_tree.c"
 #include "mm.c"
 #include "mutex.c"
diff --git a/rust/helpers/list.c b/rust/helpers/list.c
new file mode 100644
index 000000000000..6044979c7a2e
--- /dev/null
+++ b/rust/helpers/list.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Helpers for C Circular doubly linked list implementation.
+ */
+
+#include <linux/list.h>
+
+void rust_helper_list_add_tail(struct list_head *new, struct list_head *head)
+{
+	list_add_tail(new, head);
+}
diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
new file mode 100644
index 000000000000..b4ee3149903a
--- /dev/null
+++ b/rust/kernel/clist.rs
@@ -0,0 +1,357 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A C doubly circular intrusive linked list interface for rust code.
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::{
+//!     bindings,
+//!     clist::init_list_head,
+//!     clist_create,
+//!     types::Opaque, //
+//! };
+//! # // Create test list with values (0, 10, 20) - normally done by C code but it is
+//! # // emulated here for doctests using the C bindings.
+//! # use core::mem::MaybeUninit;
+//! #
+//! # /// C struct with embedded `list_head` (typically will be allocated by C code).
+//! # #[repr(C)]
+//! # pub(crate) struct SampleItemC {
+//! #     pub value: i32,
+//! #     pub link: bindings::list_head,
+//! # }
+//! #
+//! # let mut head = MaybeUninit::<bindings::list_head>::uninit();
+//! #
+//! # let head = head.as_mut_ptr();
+//! # // SAFETY: head and all the items are test objects allocated in this scope.
+//! # unsafe { init_list_head(head) };
+//! #
+//! # let mut items = [
+//! #     MaybeUninit::<SampleItemC>::uninit(),
+//! #     MaybeUninit::<SampleItemC>::uninit(),
+//! #     MaybeUninit::<SampleItemC>::uninit(),
+//! # ];
+//! #
+//! # for (i, item) in items.iter_mut().enumerate() {
+//! #     let ptr = item.as_mut_ptr();
+//! #     // SAFETY: pointers are to allocated test objects with a list_head field.
+//! #     unsafe {
+//! #         (*ptr).value = i as i32 * 10;
+//! #         // addr_of_mut!() computes address of link directly as link is uninitialized.
+//! #         init_list_head(core::ptr::addr_of_mut!((*ptr).link));
+//! #         bindings::list_add_tail(&mut (*ptr).link, head);
+//! #     }
+//! # }
+//!
+//! // Rust wrapper for the C struct.
+//! // The list item struct in this example is defined in C code as:
+//! //   struct SampleItemC {
+//! //       int value;
+//! //       struct list_head link;
+//! //   };
+//! //
+//! #[repr(transparent)]
+//! pub(crate) struct Item(Opaque<SampleItemC>);
+//!
+//! impl Item {
+//!     pub(crate) fn value(&self) -> i32 {
+//!         // SAFETY: [`Item`] has same layout as [`SampleItemC`].
+//!         unsafe { (*self.0.get()).value }
+//!     }
+//! }
+//!
+//! // Create typed [`CList`] from sentinel head.
+//! // SAFETY: head is valid, items are [`SampleItemC`] with embedded `link` field.
+//! let list = unsafe { clist_create!(head, Item, SampleItemC, link) };
+//!
+//! // Iterate directly over typed items.
+//! let mut found_0 = false;
+//! let mut found_10 = false;
+//! let mut found_20 = false;
+//!
+//! for item in list.iter() {
+//!     let val = item.value();
+//!     if val == 0 { found_0 = true; }
+//!     if val == 10 { found_10 = true; }
+//!     if val == 20 { found_20 = true; }
+//! }
+//!
+//! assert!(found_0 && found_10 && found_20);
+//! ```
+
+use core::{
+    iter::FusedIterator,
+    marker::PhantomData, //
+};
+
+use crate::{
+    bindings,
+    types::Opaque, //
+};
+
+use pin_init::PinInit;
+
+/// Initialize a `list_head` object to point to itself.
+///
+/// # Safety
+///
+/// `list` must be a valid pointer to a `list_head` object.
+#[inline]
+pub unsafe fn init_list_head(list: *mut bindings::list_head) {
+    // SAFETY: Caller guarantees `list` is a valid pointer to a `list_head`.
+    unsafe {
+        (*list).next = list;
+        (*list).prev = list;
+    }
+}
+
+/// Wraps a `list_head` object for use in intrusive linked lists.
+///
+/// # Invariants
+///
+/// - [`CListHead`] represents an allocated and valid `list_head` structure.
+/// - Once a ClistHead is created in Rust, it will not be modified by non-Rust code.
+/// - All `list_head` for individual items are not modified for the lifetime of [`CListHead`].
+#[repr(transparent)]
+pub struct CListHead(Opaque<bindings::list_head>);
+
+impl CListHead {
+    /// Create a `&CListHead` reference from a raw `list_head` pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
+    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
+        // SAFETY:
+        // - [`CListHead`] has same layout as `list_head`.
+        // - `ptr` is valid and unmodified for 'a.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Get the raw `list_head` pointer.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::list_head {
+        self.0.get()
+    }
+
+    /// Get the next [`CListHead`] in the list.
+    #[inline]
+    pub fn next(&self) -> &Self {
+        let raw = self.as_raw();
+        // SAFETY:
+        // - `self.as_raw()` is valid per type invariants.
+        // - The `next` pointer is guaranteed to be non-NULL.
+        unsafe { Self::from_raw((*raw).next) }
+    }
+
+    /// Get the previous [`CListHead`] in the list.
+    #[inline]
+    pub fn prev(&self) -> &Self {
+        let raw = self.as_raw();
+        // SAFETY:
+        // - self.as_raw() is valid per type invariants.
+        // - The `prev` pointer is guaranteed to be non-NULL.
+        unsafe { Self::from_raw((*raw).prev) }
+    }
+
+    /// Check if this node is linked in a list (not isolated).
+    #[inline]
+    pub fn is_linked(&self) -> bool {
+        let raw = self.as_raw();
+        // SAFETY: self.as_raw() is valid per type invariants.
+        unsafe { (*raw).next != raw && (*raw).prev != raw }
+    }
+
+    /// Fallible pin-initializer that initializes and then calls user closure.
+    ///
+    /// Initializes the list head first, then passes `&CListHead` to the closure.
+    /// This hides the raw FFI pointer from the user.
+    pub fn try_init<E>(
+        init_func: impl FnOnce(&CListHead) -> Result<(), E>,
+    ) -> impl PinInit<Self, E> {
+        // SAFETY: init_list_head initializes the list_head to point to itself.
+        // After initialization, we create a reference to pass to the closure.
+        unsafe {
+            pin_init::pin_init_from_closure(move |slot: *mut Self| {
+                init_list_head(slot.cast());
+                // SAFETY: slot is now initialized, safe to create reference.
+                init_func(&*slot)
+            })
+        }
+    }
+}
+
+// SAFETY: [`CListHead`] can be sent to any thread.
+unsafe impl Send for CListHead {}
+
+// SAFETY: [`CListHead`] can be shared among threads as it is not modified
+// by non-Rust code per type invariants.
+unsafe impl Sync for CListHead {}
+
+impl PartialEq for CListHead {
+    fn eq(&self, other: &Self) -> bool {
+        self.as_raw() == other.as_raw()
+    }
+}
+
+impl Eq for CListHead {}
+
+/// Low-level iterator over `list_head` nodes.
+///
+/// An iterator used to iterate over a C intrusive linked list (`list_head`). Caller has to
+/// perform conversion of returned [`CListHead`] to an item (using `container_of` macro or similar).
+///
+/// # Invariants
+///
+/// [`CListHeadIter`] is iterating over an allocated, initialized and valid list.
+struct CListHeadIter<'a> {
+    current_head: &'a CListHead,
+    list_head: &'a CListHead,
+}
+
+impl<'a> Iterator for CListHeadIter<'a> {
+    type Item = &'a CListHead;
+
+    #[inline]
+    fn next(&mut self) -> Option<Self::Item> {
+        // Advance to next node.
+        let next = self.current_head.next();
+
+        // Check if we've circled back to the sentinel head.
+        if next == self.list_head {
+            None
+        } else {
+            self.current_head = next;
+            Some(self.current_head)
+        }
+    }
+}
+
+impl<'a> FusedIterator for CListHeadIter<'a> {}
+
+/// A typed C linked list with a sentinel head.
+///
+/// A sentinel head represents the entire linked list and can be used for
+/// iteration over items of type `T`, it is not associated with a specific item.
+///
+/// The const generic `OFFSET` specifies the byte offset of the `list_head` field within
+/// the struct that `T` wraps.
+///
+/// # Invariants
+///
+/// - `head` is an allocated and valid C `list_head` structure that is the list's sentinel.
+/// - `OFFSET` is the byte offset of the `list_head` field within the struct that `T` wraps.
+/// - All the list's `list_head` nodes are allocated and have valid next/prev pointers.
+/// - The underlying `list_head` (and entire list) is not modified for the lifetime `'a`.
+pub struct CList<'a, T, const OFFSET: usize> {
+    head: &'a CListHead,
+    _phantom: PhantomData<&'a T>,
+}
+
+impl<'a, T, const OFFSET: usize> CList<'a, T, OFFSET> {
+    /// Create a typed [`CList`] from a raw sentinel `list_head` pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure
+    ///   representing a list sentinel.
+    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
+    /// - The list must contain items where the `list_head` field is at byte offset `OFFSET`.
+    /// - `T` must be `#[repr(transparent)]` over the C struct.
+    #[inline]
+    pub unsafe fn from_raw(ptr: *mut bindings::list_head) -> Self {
+        Self {
+            // SAFETY: Caller guarantees `ptr` is a valid, sentinel `list_head` object.
+            head: unsafe { CListHead::from_raw(ptr) },
+            _phantom: PhantomData,
+        }
+    }
+
+    /// Get the raw sentinel `list_head` pointer.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::list_head {
+        self.head.as_raw()
+    }
+
+    /// Check if the list is empty.
+    #[inline]
+    pub fn is_empty(&self) -> bool {
+        let raw = self.as_raw();
+        // SAFETY: self.as_raw() is valid per type invariants.
+        unsafe { (*raw).next == raw }
+    }
+
+    /// Create an iterator over typed items.
+    #[inline]
+    pub fn iter(&self) -> CListIter<'a, T, OFFSET> {
+        CListIter {
+            head_iter: CListHeadIter {
+                current_head: self.head,
+                list_head: self.head,
+            },
+            _phantom: PhantomData,
+        }
+    }
+}
+
+/// High-level iterator over typed list items.
+pub struct CListIter<'a, T, const OFFSET: usize> {
+    head_iter: CListHeadIter<'a>,
+    _phantom: PhantomData<&'a T>,
+}
+
+impl<'a, T, const OFFSET: usize> Iterator for CListIter<'a, T, OFFSET> {
+    type Item = &'a T;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        let head = self.head_iter.next()?;
+
+        // Convert to item using OFFSET.
+        // SAFETY: `item_ptr` calculation from `OFFSET` (calculated using offset_of!)
+        // is valid per invariants.
+        Some(unsafe { &*head.as_raw().byte_sub(OFFSET).cast::<T>() })
+    }
+}
+
+impl<'a, T, const OFFSET: usize> FusedIterator for CListIter<'a, T, OFFSET> {}
+
+/// Create a C doubly-circular linked list interface [`CList`] from a raw `list_head` pointer.
+///
+/// This macro creates a [`CList<T, OFFSET>`] that can iterate over items of type `$rust_type`
+/// linked via the `$field` field in the underlying C struct `$c_type`.
+///
+/// # Arguments
+///
+/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut bindings::list_head`).
+/// - `$rust_type`: Each item's rust wrapper type.
+/// - `$c_type`: Each item's C struct type that contains the embedded `list_head`.
+/// - `$field`: The name of the `list_head` field within the C struct.
+///
+/// # Safety
+///
+/// The caller must ensure:
+/// - `$head` is a valid, initialized sentinel `list_head` pointing to a list that remains
+///   unmodified for the lifetime of the rust [`CList`].
+/// - The list contains items of type `$c_type` linked via an embedded `$field`.
+/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compatible layout.
+/// - The macro is called from an unsafe block.
+///
+/// # Examples
+///
+/// Refer to the examples in the [`crate::clist`] module documentation.
+#[macro_export]
+macro_rules! clist_create {
+    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) => {{
+        // Compile-time check that field path is a list_head.
+        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
+            |p| ::core::ptr::addr_of!((*p).$($field).+);
+
+        // Calculate offset and create `CList`.
+        const OFFSET: usize = ::core::mem::offset_of!($c_type, $($field).+);
+        $crate::clist::CList::<$rust_type, OFFSET>::from_raw($head)
+    }};
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index c2eea9a2a345..b69cc5ed3b59 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -72,6 +72,7 @@
 pub mod bug;
 #[doc(hidden)]
 pub mod build_assert;
+pub mod clist;
 pub mod clk;
 #[cfg(CONFIG_CONFIGFS_FS)]
 pub mod configfs;
-- 
2.34.1

