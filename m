Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBF3C4F35A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 18:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D877F10E627;
	Tue, 11 Nov 2025 17:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nt9TlU8f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010063.outbound.protection.outlook.com [52.101.46.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D616710E627;
 Tue, 11 Nov 2025 17:13:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggizad6XhUbKxRqsB9VFRTe4YR5SfNvw5z3I8KdbjlU+5J/U5QrhlOGSq3/awlTROzLEX17KZfMjnA3B15A8A8FtcORQlVU5y0g4XGmct/wOYmgU9ctcaUlucuufrQRmB4hyWjb4ZonyUKjpRXmsBLjflWaXXvInUKEYMe5vsTaHiV3oj1x1fL7SU8x7zk2TywHv0RufOLOJI9j6yPwvk91k4YidBjlKQZVcMl7Co9LsOuHAaHVcHDzEetbbO5a761ArF40Q3mZslP6St/L73l0uE6YEoyQn7tENP9o8alaPBwVobMJL5WevmHsDEHahPrS4LkPkgPpJiKv+wQcpOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUge8niCSvUJ30zqIGQ6ey3YPiluCxo0M01sp1xQ48w=;
 b=QQK5ZbGDfY1FEBEYrkfwtHEpYL5vdKiTb27P67KBNMT0DX1s5giI7iAD3vKVP3cRqWbBa2wItD4OZJK2C1m6NtMvbzLOouYFTTrD/QW/NFo4Fm1HHGyerAUD7VP98wwv8aj1sQMvNDGERaZDU748P5nf9zpMKBnxObCZVYYs+PxGmVZspcfVcIvZ8YJzGnUWmtYjam+/AQNLAqeAA/i7xKInGcZr4PagJ/Ai41gFMfX+NofDr89UFee7XSM2pXf9fNwr0aMylJSEXYVmVS0VSDso8Lj17tlc9FFhmIfo5dzXHGvLnHTKMpBC89vCkm1zoLknus9f+575cwZvdGUiqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUge8niCSvUJ30zqIGQ6ey3YPiluCxo0M01sp1xQ48w=;
 b=Nt9TlU8fd9yMDaduCXVmcqD8AlHhmAKwanVijvwgpOd/uoTI/wTHcXLFNO6h1HRLh8nfYzHa4fH7sl6Ho7cSxj4EahMkCPK393hdVLNJAG/QK9Z8Wj+kSH2xq3M33bojM7U+41vVtBaOqI6nW+6D+A33vIVr60zuy+CvH8p0M7XFB/HUCL2HykrggtKEpZKpVLgWGfwCZ2opYgbSyn9x8zMokOiic6w7rrg/RsjxpL3v0LTvJHeBu2qLiDG5ZUKIDHizg8WheMtfmEk7gVkN2uy+1m3BXEl1GlxUiXFzpw0qm4OnN7dbR4+ZblNxk2G6m6yuQsO3Y8e6DLHNylh9NA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL1PR12MB5730.namprd12.prod.outlook.com (2603:10b6:208:385::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 17:13:29 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 17:13:29 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, airlied@gmail.com
Cc: acourbot@nvidia.com, apopple@nvidia.com, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jhubbard@nvidia.com, joelagnelf@nvidia.com, ttabi@nvidia.com,
 joel@joelfernandes.org, elle@weathered-steel.dev,
 daniel.almeida@collabora.com, arighi@nvidia.com, phasta@kernel.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v2 0/3] rust: Introduce support for C linked list interfacing
Date: Tue, 11 Nov 2025 12:13:15 -0500
Message-Id: <20251111171315.2196103-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111171315.2196103-1-joelagnelf@nvidia.com>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:208:91::37) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL1PR12MB5730:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f55c52c-1d1f-4ca0-7902-08de2145a226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kEE5O7m/cU3VweaGj49L9GSle7DSRgHbDc2kim8PER5ElLi9QCFTh7nmQvev?=
 =?us-ascii?Q?3I+rWewcZH4M4/RDyHc+FRCyW8bc84LZhvWXGj8yUvotrh6qdOxaoICFC/W+?=
 =?us-ascii?Q?gRgV2jyCFjkN9oaNVi4PIFypFFY9lZkHzdwNNVbDPgoD4uyVyceMFYZCBuYH?=
 =?us-ascii?Q?O6tlkxdmLrQ5u5TGt1GEt+fq9uw4Z0/4XjQz19j09M9TzrRGNF95qNVgH19u?=
 =?us-ascii?Q?uUL8mZ5jc3xXMK/XB/uf5b/xzFL3jZSxwAYFGxozC7pJe/4C9NWcTFCNT6PV?=
 =?us-ascii?Q?5zGeSwR2k6jyqDDuF90vK6bJLBrXWmo74EQ1NfxXCKmjnps/FI930+UnU58M?=
 =?us-ascii?Q?A1SwpeLp+WbxSeVO+0Sh/MEiYMp7MNLMXyEigdzfq97LU/0EZZ2n/4TkCg8G?=
 =?us-ascii?Q?pkwz2z2Se3oICjD8mHj7+e1VYHvmKlcHAue72GdPaYLt6liGL5Z5pzywQjUr?=
 =?us-ascii?Q?SSZbymHLkbro1TFRTYNRn9bOq2VCRp4JUs4yCkWQYkgq9jaYztDz2emd5geN?=
 =?us-ascii?Q?9gkn1aHQCCXXVAzacEBTL+3cRYsy49bm7+qyX1NzO8QxALTBdlJfKqPzm4sl?=
 =?us-ascii?Q?HX2v6EQ5rrxHTAA1+efpnkg8kORwEe+QDHcDoN3faIMauRpzOVC2dbXuHlhC?=
 =?us-ascii?Q?fTZ5WHUHJQm9Krl3NZf2tVbg6jhfL9nJNQmz+Nc5C1PzcSvXr28mA9wA6FcU?=
 =?us-ascii?Q?3v8W1VzDnmb3XfwqJskQyf1nvwpBaGZPNOBVoS4qFm+Av4Spq39kxlgnqZ7H?=
 =?us-ascii?Q?cSBGpPzmzlsa0XQHFv3tW0w1i1+tRWHwhvBFNj9HRhPm31ReF5iWXeoCw0yc?=
 =?us-ascii?Q?VJEeRtbccA1F5WNhsUi8HXj93LSGqr0kK6H66sF4YWvNimHCkMdHireUWhBt?=
 =?us-ascii?Q?INgFeb2LlQ4qKadjyDoNwaKhmijQaFwsfxoJZVU4QbeSHUuosW36xisyJtAR?=
 =?us-ascii?Q?QoMVjvkNyRibt0F87w0hRoNFnE2YyqCi9tH/qE+i/9ca6Rp4CuneW8EZLZgj?=
 =?us-ascii?Q?e/31ixqhp8YXb57Qwoj8RJ44s11VRkQSKteoRkgZN2kewGG587kGD/P9dUGV?=
 =?us-ascii?Q?xJr7uFIvX3kO1MMVvRGsfieEPOQ7bro6D/mm5foKrcR/T9HjzcSNwG8gkioN?=
 =?us-ascii?Q?lKn0AfShYvHQhh++DSgd1BKHo7Sssml5iSrXTYHcMBUlvGZM4oeOBEILm5Nr?=
 =?us-ascii?Q?OdmQ//zlu1Y4TdegcluMqe9gQ1LKOPywtto7/bRmrmjxdIrD4ZepG+DLQW+4?=
 =?us-ascii?Q?wYOcJEBQAwLR9enbus6grtPVqkAZqtVjOVBiIm9DYXFeI7Mn5wlkRggYTufS?=
 =?us-ascii?Q?SAKwbyGkEwot6bgC6g9Z7yiN7alDcDHSNwZNQUkrSm41POuRx9HMit2XdP6h?=
 =?us-ascii?Q?15dmhg/p+w7tbJa9yhCcbonvo+VuZ6L96O9Cn/oz2/DDLLVJ/par8fBpVf8b?=
 =?us-ascii?Q?RTjl/jNjV9eqjfCXefFjNBIgTdyU7oe70JOzkqmgeWmNtjRg2hd1mA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QjoAUOigYejFO+4rG4Z6EU0QRLiGq6PxY/Y/t5NpJmwoREsYAUcHm/sMkuS+?=
 =?us-ascii?Q?1gQN0NESyFvA2npIUZV2HqaTE+kdlf60ThTJvYlQuIIvSHC6vYhDtHl25YBT?=
 =?us-ascii?Q?RLjrL/1VvpY8on054T4ERDSaCmVZboC+td3NwL4Vb5flQYtXwXkrMQd5mSmy?=
 =?us-ascii?Q?p16JQ0+ho9MqvAEVUYmPeDu/jfsBN6oOCkuFB2dgqpyMoreZsUNBA4hDL94p?=
 =?us-ascii?Q?itHRgbuozbrKaHaqwu8QeFOJsNuxxgLqhteFFSbkgoESwZUdocBvubbfHDNO?=
 =?us-ascii?Q?1Bsol4khI9xThyuoJnc8d/3UUj65FZWxEthNXtz6wGN3gUikLksTLC7Vah4y?=
 =?us-ascii?Q?5fOjNaxQM4N1fSQaL+KfHadbkivDfGeM7LMVM9HTqUCEj6JmnBn6TrFoByt0?=
 =?us-ascii?Q?n0IBP/wYljwdeWLRoe4r0YVFQH5zwnGxrBcFQMeIIHJcgfqcW4D1CERyzWhV?=
 =?us-ascii?Q?/p5jxpgIF8bUtVllFv3sIXlln9vl64Uawucnjymi8dKoKzOI/wNTSlOkMOSs?=
 =?us-ascii?Q?MRmIvMVldJbnlzgk6pklYh8BSzgssN0C8gRRuuXPisvKU2n1HaYnt/riptOE?=
 =?us-ascii?Q?NW6a/0ifKncjm+CGNuyX+l3aXeT8W5t09Hpz1Q7tgsUKl/doP/PyNhwtFNeN?=
 =?us-ascii?Q?YKKdHJXHPmuo3KNuajc7K69Fa3rVlLuUNRAPDWUIOUK/k4e6QQflSHPYQAYz?=
 =?us-ascii?Q?2bSgk7OEcwTu+OBjvkq+3e4fZq4u3wbJxpBTTEYFLMFsDyj5+fUQ8AcMlByy?=
 =?us-ascii?Q?hhexk78ZngRF6wHb4qUFESknthUelhlyDpAKj3+3SGGkmjHo43G4/dFUPryB?=
 =?us-ascii?Q?Zj4OjudI63TZbxzIjo79/r14ZIyC3qQbNU8lIodDSrBPFHi574T1mPiOZXVp?=
 =?us-ascii?Q?TSQ9BQ8PugTA9sQlwXiFDRi5RdCkpJSoYxy2Q7FIzgA8lPvfaqmi2qavkqTp?=
 =?us-ascii?Q?ctNmvylHTb3m8/tbTBRZqP1B0WIeAUzAm9Al51P5GvMxldTtr2dhdPC4A1nc?=
 =?us-ascii?Q?j2l8yHyXx42XePMwrZKm/DYgqKEOdECdjzK27DKwTfRdo+v1m8SOscAPNHe0?=
 =?us-ascii?Q?7BATi9GNshwfMAOxHogzFtKPaVUTZMOkTDm11mV1qnh1VCNyoNceUCsAnoWN?=
 =?us-ascii?Q?lkpq1UqPtpggwQO/I47d1QTOTgDeDS9tP0qglTM3akz0QTI3DdufRgwPEthq?=
 =?us-ascii?Q?rU0+40YIIz1pZskNROhIV8kPGmn1b2NEFF6YUxxHyHL9pwWC3YwtoFZqXrAv?=
 =?us-ascii?Q?SjBBvPENCiQRH6v+AYKauGkmdZi0A9eqp1JPA3jI53CMuk77x4f8JH3incfX?=
 =?us-ascii?Q?ecBb4HwbsEM+zWyR1uoWq1GPJK7kijiGiCw9Rz6mhXSM+gdvqjZTC3Nwjhdo?=
 =?us-ascii?Q?XLzIz4L8g2HJTa8ic2kfzBifEbTGOifYZAKd4nczUH8s96C2tdC4/v81Guj4?=
 =?us-ascii?Q?JEUCQr1e4hCUZsFiAxJGuJx1k7BLXgv4NxyN5S5mu9gVjWbJAnTUaJHeJ1EX?=
 =?us-ascii?Q?R7iwot0j9cozC8yNXNB6XTyY40japHwxgHDtGx2zN76DkeQNv9KSkPCYOCeZ?=
 =?us-ascii?Q?fe/1VowIWelxaCNoh5B8ybYsOsYdeDLXKbbv4FwU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f55c52c-1d1f-4ca0-7902-08de2145a226
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 17:13:29.1642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: reHRHpBlXRsWPbiLcqEStY+mnsu+ENF4fcpQr6yaanFB3mVNCTqTTQWj0ybp0Z6hQ4NGo6ijYkMesde0p5a9JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5730
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

Changes from RFC to v2:
- Dropped the DRM buddy allocator patches from this series. This series now
  focuses solely on the C linked list interfacing infrastructure (clist
  module). The DRM buddy allocator bindings will be sent separately once
  we agree on the clist abstraction.
- Dropped samples and added doctests.
- Added proper lifetime management similar to scatterlist.

The git tree with all patches can be found at the tag:
git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: clist-v2-checkpoint-6)

Introduction
============
This patchset introduces an interface to iterate over doubly circular linked
lists used in the kernel (allocated by C kernel code). The main usecase is
iterating over the list of blocks provided by the DRM buddy allocator but there
will certainly be others in the future.

This series introduces a new rust module called clist with the necessary
helpers and abstractions for safe iteration over C-allocated linked lists.

Notes from earlier series:

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
I already presented the idea in Zulip and it seemed it mostly got agreements
there. I rebased the patches on linux-next. I can also add MAINTAINER entries
in a future version, if folks agree this should have its own MAINTAINER
record.

Link to RFC: https://lore.kernel.org/all/20251030190613.1224287-1-joelagnelf@nvidia.com/


Joel Fernandes (3):
  rust: helpers: Add list helpers for C linked list operations
  rust: clist: Add basic list infrastructure and head iterator
  rust: clist: Add typed iteration with FromListHead trait

 rust/helpers/helpers.c |   1 +
 rust/helpers/list.c    |  32 ++++
 rust/kernel/clist.rs   | 394 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 4 files changed, 428 insertions(+)
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/clist.rs

-- 
2.34.1

