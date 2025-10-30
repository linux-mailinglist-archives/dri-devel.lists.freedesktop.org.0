Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47998C21DA2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 20:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1262210EA0B;
	Thu, 30 Oct 2025 19:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lRdinVFE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013035.outbound.protection.outlook.com
 [40.93.196.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E3E10E2C2;
 Thu, 30 Oct 2025 19:06:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANdEohIjQnf23Bm5t6suIBDxXWYrmfYhO8zV1m1ELiSL47kP0NXCbT3H+9z8dFLDprt7puaV0+AHfRFhXhchW25l1nVYGMFRb/Ijcef/Nlvy1OF4bh8lYNH5oMkkmQMeqWmBVLTdAz0TG2weS5KWA97m9au/8m4PNGyZNY9TizZtarw3joS7/aHCksvlW82Q6BMWvQtHd3auFVvmecn/CMSTZ3zZRD11TMaIj+VNSlrxnFpNWPU0RSe3UQhar50U1AndmZe9MIUFri3H5lAiXuR/kg5CB5W6JX7VKpiv8fJ1UTRZWv6pfj5cYGCuqRvfJui2e7nbpntjYDlOkkBYow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/U/wz2nsNtg2veZxqYtZnZlR+q7Bp3S9KMwCLU+5Iuo=;
 b=H3S9o/lJ5nPWjqdaR8L//GseazAuPVRxV2Ujc4hCPqpnOexKVV2j0JEVZus4MQZp6NsYdzaCycUjtiCIqIXRmUy2IKMBeKo6ddevymhUZDZoRFR/MvcXfEwhyoXZPhFRQXhZfCftXUqZxijVQyi3isrRajkSRrlJanM5ljdMvJrNh1AsXOB15Gaix0WwqfoJnEZ4IUsrazDteSu8N0LsUy1m8BhOxVqT3eXozRTsVtfQ2rhlX/RNQZ7lnxXscEexBn4EfWHT9Q/hYUCnGaGToXjywRC0haX3/Rz3nWSkYK0bhC9/czd4giyCqOtCLPn5/mwToGYITQ09SxseCHGSlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/U/wz2nsNtg2veZxqYtZnZlR+q7Bp3S9KMwCLU+5Iuo=;
 b=lRdinVFE4Hcg97qtLZahWrDilGJ/auO/lbIgLEbku4mraZwGD24Id4fDD3JlR5i+9YXzSnL8PpEs2edhT2L7Vj44r1PB6t8mdfZ6oO4PN0sYDXmpaduz79gWnJmiDsxbKia0BvDnEgdCaP9Oz+Usxrl6QV2HkWlIR6xEAMX0eB9DiDkB2DoPWL8p1uZGYRjV1CUxHkbFz0hpyFzPlmypx3ht9Ued75ZsgXeV9bPMT9gu56FdWRzykc/JW/w88m6i9ub01MYAlernqMs415lkvIrWSvQcaPON6XyqHMzae9BFI+eVGspj8y82KqPFl4GbimDKd6Kx+65OuYEAYdsCcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS5PPFBABE93B01.namprd12.prod.outlook.com (2603:10b6:f:fc00::65f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 19:06:24 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Thu, 30 Oct 2025
 19:06:24 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 David Airlie <airlied@gmail.com>
Cc: acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org
Subject: [PATCH RFC 0/4] rust: Introduce support for C linked list interfacing
 and DRM Buddy bindings
Date: Thu, 30 Oct 2025 15:06:09 -0400
Message-Id: <20251030190613.1224287-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:408:f5::8) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS5PPFBABE93B01:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b87a92-a824-4055-9464-08de17e76b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jhacrzpWUv1Y8IoyYYa0j8p3NuWvDvAyQJepfhyLA6jG3lLRh8ZreGq35fKI?=
 =?us-ascii?Q?/vnm5j9sT+31qZjbQu39KXczwr3wa1Byo3B9gsmkZXDnbKQJRi+UM6r4eCXn?=
 =?us-ascii?Q?9rqD55fIQnhEBoaQFTHcdDnnFC9gVUdUENyaJ6WMH1yqAVDHn3+3lZYH3XTe?=
 =?us-ascii?Q?w1yNgwvG/raSdasnnnug6t2MrDaezAG76vAu2E/YEMpZpWcUugX5nLOQpLPZ?=
 =?us-ascii?Q?lyUOtaS/WHvNrxIrhcPoh4QjCgVm99uubYErW45D4d22PTgsdFoMZnC3I4CY?=
 =?us-ascii?Q?NEzs95W8z5/Ym+WyhTWq+8iTbsir8yaUk8f2SpH3BbQPp0ZBTz6Hv/AxC4mv?=
 =?us-ascii?Q?1/uKBSbubJwDaeqTfuoGaM5tCoicB4i6N/XKIcKJxkXnPb2mz7cO0qIPHOuq?=
 =?us-ascii?Q?OJo2Vms3ADznBOyrQ+Qcea/CYtFF9EDqwwOATMhRTRyVZ+jicq/w/ba9Zyff?=
 =?us-ascii?Q?3NLYDMgeWHgVOLt2OY+NQjCK646r7shPn5pQrfgT4q2wmOsGND40EFGj/+Bw?=
 =?us-ascii?Q?66aUzhGlpitqmradNo0jUBfs3RUhdH+SB0aBWpC/NCTSv95ec5hwygZKv6N8?=
 =?us-ascii?Q?4SK4abkbDigL0kdQrvin2bgeLZbElBEvVFbhYwZ8Q6iVf+thBi7hH8VhYL6m?=
 =?us-ascii?Q?VriG4JR7OgOKBkgGVpWD/IFgJjRNNQqVOv1R8svU5APopBVynYIJWs2do84u?=
 =?us-ascii?Q?Pd86YKkykaxG4aOUXNgTVv0Q1oYkdyMpluA5Bd2Z8GM+h+ojGlnA0HZbUeF6?=
 =?us-ascii?Q?0vnXanavHAO3CyzG1E0uk2nUmwMHcgVcOq2f1G36p58Sh4R0Yu0/En8WLTar?=
 =?us-ascii?Q?MaR2K9GzWLyNE+jv3hN8WmhtGBmTI7mjEKdr4ZwIGc6AJ6VGBce2E598YQyY?=
 =?us-ascii?Q?QiNJ34whi9oscOMcPQsMb4sABIQdkTa/f0C0Fnl1pUE50VIdpXy9cb4fRnAg?=
 =?us-ascii?Q?JcPqsZuG1dzNKCjgxuszuIEJPobqqem3Hn70xxa9wCcwKytSENdRortqNB5W?=
 =?us-ascii?Q?mIB8NAtTk1rJzg32tjLI5kPQIhACdSHqueTCb6Jeyhq01sYWtRF4LRFGUfcE?=
 =?us-ascii?Q?3rZ9vYw/Ee8vnBZFtSOC0v1afLB7jOUHuO9wX1btWV5phdOl5cNxcMpo5Pj3?=
 =?us-ascii?Q?s0RRcdNaDx9eo24f0nEcdVekg5V94ozfO+8BtJ2qPBLq0lFZNwkuBCqv9Min?=
 =?us-ascii?Q?8ZSyZw3wZ0VFs0OPucr2K1zjYAc+YG0GLWuS9GQdmzaQ1GZxWpln/KtpyGtO?=
 =?us-ascii?Q?OZ8TRoTeEWVgEP9Nem/jJuBq1YWH3XAIhFtK3leAriqwcXCSbHSp7Dg2HZWO?=
 =?us-ascii?Q?OuxN0tWDxFEu+YxiXjJZbFjt6qqz8+ky7bgE0uCMlEFndKxCa2sb76HB6tzs?=
 =?us-ascii?Q?z0SOerOyvZXj0VLwCJw0pyhf1eS2LDKNjK/fxPwLBOyfyGNGtHoQDE9aCFOp?=
 =?us-ascii?Q?ompTdlMC3cM180yn2X1bKKhpM+GujTjL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lfmUluk/ptiefcM5FsrZExpaFroNhOxL7RZ4l4C7JrGAQsSqIH+HmJ3Atgpq?=
 =?us-ascii?Q?+gaCVNcbdd+vKvnZ6bN0R5/4Mm6IkQ7EDEzThYOqB553lgLV4bsEfrQ9AkNE?=
 =?us-ascii?Q?65qkmqD75hdMieVuz2umO4w0i1YWzurOFKqi2R/8jhIpaqMFW8a0IURI6pzR?=
 =?us-ascii?Q?Dg+UuBGJa6YRoZszmKAIvpOIRDUW55k3R2MNOoilZFnm89rRgDYPntkb6NLJ?=
 =?us-ascii?Q?gZmiDhZeuDZhaW77/gdfWS110ZNinReqGrWoTE7g5SxGy09t5GxyA7jGbqeW?=
 =?us-ascii?Q?8Ur+jmvYfZ1FbRu1gyTq/1gud680puR7OaaIFJYvIC41nna7F89C5WmlpK8W?=
 =?us-ascii?Q?s4xRYcCMp30aAsNuGD9ZCel7QzVKxCt9GGqtjtjvDwYsp/eTxKyUTnh5+iC7?=
 =?us-ascii?Q?/3ATLf2+I1MWGwXOtVgvdc+SOg9Jq7YE1H3PNo4IoQoMNBenEUJqjdHD/tN6?=
 =?us-ascii?Q?oqAUB8V4Ss8VdkuQOkprnAxTloZeY9IPew7lRrsRTfJ3NJnFjXFzAlI/ALwD?=
 =?us-ascii?Q?gImC4Gr/gSl41Hm5OErFtwmlH7mA5nSsIU2LveQQ4Mx9rLH63ZAF8PSev3Zl?=
 =?us-ascii?Q?AmaNhH2wvjjO2vbtZ+/Eygr56LYW/SxnHbLG0kYe+wEZoTiD6DrPlpF5J9Rc?=
 =?us-ascii?Q?HiIoe+wJtbybjomnGifBJu2fI7SCm1vIf0yX6qwFGSV/ZqzI7EJQHNYOdVM2?=
 =?us-ascii?Q?/8bzhZUFkZ3oidyV2SXWq4OJFKaUAFWvkfcAwqBACdZvWcO03JgRuPwgHkkf?=
 =?us-ascii?Q?5iR8dR9Cs2p/D4Loq919zUr1+whTPrVqfPCf75Vdwuu/ulWHBWBGp+Xcfdbr?=
 =?us-ascii?Q?W5W5Q8kndTeqHsLKi7pq0f8y46VWpks4WD+dTHqXETFGr/20cprsEkRWdQ+E?=
 =?us-ascii?Q?er92hPfQR+07rRZC3bzokyL18dg3fpeKfFFohlgYgPqgDo174hphqnn3DDqA?=
 =?us-ascii?Q?bHOFM3i4tVyRAcly4hzoPDeYxaYT0CkTMQtkF/nsEasrnLXnh4Ods1DsSiJq?=
 =?us-ascii?Q?rogI5ss+qqnBgrCtzztCmBCVVnpmHHv5iVkkrp5J4FLC7LdpLdACRCAg8hvn?=
 =?us-ascii?Q?fnVBi+3Uf5iadi37VFM5zIn7oGAJkApgmCYa1EZUPY8j1MC4ogvginOXCNx6?=
 =?us-ascii?Q?uU7xkpNWSq411D/OQtsVvx7K2wjDnHcXSFXKviQw77rl0aoJH4tiAM/UIRLM?=
 =?us-ascii?Q?4JzpQ0Wg5nLo+YZT/3oqmQ/9jR+9e3V8R5rhQcUZW0+gzgScm7IsqOn5yd9Q?=
 =?us-ascii?Q?YxrgXVhPu0ibIastsT10DhBDJ+Vh0vmMKcR58SkO3oGOLGF8S/1WXCXGnzVb?=
 =?us-ascii?Q?QGnveTMpqnuN4rjFUtvZ0sXcLk/8EjRww2S/RDEj7PZG87TyTi19uCpNj109?=
 =?us-ascii?Q?qaA4gGe5r/51ZaPpwdnm+Rjs6m1GAGNLFLeOryGmScW9zr6FBZobua4i+HdC?=
 =?us-ascii?Q?9v85HLhZYl4hwnqKH6TJOiR97TiWq96xwzKZ0XeHTlUMelvcmvL1hRogqc2X?=
 =?us-ascii?Q?Id3leA5WQHtj8o6MEpZWKju/BoERt3IQmGZ9ABBp3b7BK60SszIxGoSagyAV?=
 =?us-ascii?Q?/9s8g2K9rHK9Ev+ouu+W46pvK/CYD9XdAl+suDd4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b87a92-a824-4055-9464-08de17e76b67
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 19:06:24.1640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rv0aIRWt4Ge/61mnV0OnPx9aCbQgV9w5pSrGCzEBlLL3m0UFsDZo/Jr8TruCAtqp2rXiQ+jcb/zvRJ74AlpaDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFBABE93B01
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

Introduction
============
This patchset introduces an interface to iterate over doubly circular linked
lists used in the kernel (allocated by C kernel code). The main usecase is
iterating over the list of blocks provided by the DRM buddy allocator.

The first 2 patches introduce a new rust module called clist. The last 2
patches use the clist in the DRM buddy allocator bindings. Samples have been
provided to show the usage.

A question may arise:  Why not use rust list.rs for this?
=========================================================
Rust's list.rs is used to provide safe intrusive lists for Rust-allocated
items. In doing so, it takes ownership of the items in the list and the links
between list items. However, the usecase for DRM buddy allocator bindings, the
C side allocates the items in the list, and also links the list together. Due
to this, there is an ownership conflict making list.rs not the best abstraction
for this usecase. What we need is a view of the list, not ownership of it.
Further, the list links in a bindings usecase may come from C allocated
objects, not from the Rust side.

Other comments
==============
The patches IMO are ahead of RFC-quality, but I am still keeping the RFC
tag for initial comments and to get a sense of what everyone thinks. I already
presented the idea in Zulip and it seemed it mostly got agreements there. I
rebased the patches on linux-next. I can also add MAINTAINER entries in v2, if
folks agree this should have its own MAINTAINER record.

Joel Fernandes (4):
  rust: clist: Add abstraction for iterating over C linked lists
  samples: rust: Add sample demonstrating C linked list iteration
  rust: drm: Add DRM buddy allocator bindings
  samples: rust: Add sample demonstrating DRM buddy allocator

 rust/bindings/bindings_helper.h |  11 +
 rust/helpers/drm.c              |  23 +-
 rust/helpers/helpers.c          |   1 +
 rust/helpers/list.c             |  28 +++
 rust/kernel/clist.rs            | 296 ++++++++++++++++++++++++++
 rust/kernel/drm/buddy.rs        | 357 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 rust/kernel/lib.rs              |   1 +
 samples/rust/Kconfig            |  25 +++
 samples/rust/Makefile           |   3 +
 samples/rust/rust_clist_c.c     |  54 +++++
 samples/rust/rust_clist_main.rs | 138 ++++++++++++
 samples/rust/rust_drm_buddy.rs  | 106 ++++++++++
 13 files changed, 1043 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/clist.rs
 create mode 100644 rust/kernel/drm/buddy.rs
 create mode 100644 samples/rust/rust_clist_c.c
 create mode 100644 samples/rust/rust_clist_main.rs
 create mode 100644 samples/rust/rust_drm_buddy.rs


base-commit: 131f3d9446a6075192cdd91f197989d98302faa6
-- 
2.34.1

