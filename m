Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41553BE4146
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 17:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C40110EA07;
	Thu, 16 Oct 2025 15:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="o0E9lduN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010051.outbound.protection.outlook.com [52.101.46.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5996710EA04;
 Thu, 16 Oct 2025 15:02:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9DeLQtgDd9cJ3SOJ+x9DymOdvI0Vs8YrVR1bgkbL+vEc4XhWKs8miBDOA4Ru81dOAA/eJDv0X6Ovkd325k2KU3sQBibfNv6YDS/IsF32lvfgp2p5A9nCP/ldpafwiazPDNwJ/UyKTQyaxeATM+DTNZENMOaTB7wuPAIc5XYfH8P1K2XRiqqr6/N1u/XQqz1EsykHTq3WOP0fn7368urN++ApEqpMxzLQypxmzERUKrsDRLSZxxxqugG1wRanBNBpupEqYZTHYDg9oPP5mrxEY/p6lUYAeL6aQoHaIRyMmNJ5azwp4bRa99yXxwwf4BYIuGZD48hg6Z3CWNxJdOIUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9zHQ2p0LH/skIJv4HO48CdpfTs7HPz1SrOK+/OqErE=;
 b=yOy1x3FCAt/br8jB4Kri3U+vwrB2eYKLAz0jxt4KahqzkdVPmd/7jH/g7HG2+uJR53D+0SaJiRW5TeA4vmCImZZ2dlopjiNdGz8Cklk7FTiOpMtL4+Q+bHPQT7hJHcn+9lGj2tK+MkspqZFj/DatYTNBohsQ9CEKSivDM8fYHwMZ2vL6YwrXk9wmDkgVWjn4qw4BppTvQBZ47FRUEZFSFFrDsmgbSxfxZWKudEr+HFBXwpAooOzUXnD4mXBR9BJ4mF5Y69wOZPhnL1ZuEELxRC+Rl0OJd9fvJT2sfwcuW5631+VXTF56f1Ag04T1PMr8nnK8684v5uLiCIhUXvLBGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9zHQ2p0LH/skIJv4HO48CdpfTs7HPz1SrOK+/OqErE=;
 b=o0E9lduNqp/405PozYu5OVdD3XWd0N5jIkyHOfh0Acdu5j0tI9moitrxs7EKLr9rOUpumpslZL/uEtBIFdo7I/IZp4kmo58uX0z0alqFXFlTsaGQ4U7tYunHJXcgqCJXvcn/qhpssVs+z/PZjkx2/ReqVL5M/tjDxo30tadRU9wdlrclEHsJsQBrrwG0pMA2uhqq0r2XcYile10Czt/RDvbcP+heVC+QO0Q1GKdzZuYEB3dJnpalNkhBjvr+yPkdIzY34qDKe9Om8ojfawejFt8n3XAjyIOv85eRP+7q7mIsBAuXP0R+we7gIHGDwlaoFKJOyp7PTupkMQyGJqMkuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL3PR12MB6380.namprd12.prod.outlook.com (2603:10b6:208:38d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 15:02:16 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 15:02:16 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH v7 0/4] bitfield initial refactor within nova-core
Date: Thu, 16 Oct 2025 11:02:00 -0400
Message-Id: <20251016150204.1189641-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0585.namprd03.prod.outlook.com
 (2603:10b6:408:10d::20) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL3PR12MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 24689026-f704-4ccd-0cd3-08de0cc4fedd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0/Tf9m1S0Ee77WWe/Tsr1Fl/SVacJjIwIhdXC+SsVdTm7x5ZlZslw80Exdul?=
 =?us-ascii?Q?3ezVgEh0oI7y8azF6SDCqddWASADEc5amhc2FTjHO6UsItXatO+NwLPcagQ7?=
 =?us-ascii?Q?dBRqYx6JPeaniMKCeQmbXZmM8+F5mYtX98OzCd22S4nal9uoobgwFGeD3FI6?=
 =?us-ascii?Q?lgM99Uf8D0avx/abtXLxtSnfGd4bGB/gSPXQ9fLc1zUyVGO6QVQXai2Bb6oy?=
 =?us-ascii?Q?Eb6CBVbFJ3xercVJCqGkduQ+kCpTL2HQlBz158TGSD3JbdtqPG/irguGYNCy?=
 =?us-ascii?Q?BldCkR6PqWJ0bQ+Cr8aGfj1LijJoEfdGSMQGK8/reJsfxFscx+fHk7sLGWVZ?=
 =?us-ascii?Q?ECkg/Bz9vz5Pxch01S9CTRTwrhUCeZRb7qII6shtFjjyPgZPJho1/kyJvIZ6?=
 =?us-ascii?Q?pgoKzDGHLDnTC0DnkZ+q3F4b+bZ7jaN53WSsjh1Fqa99iAoOIiyJS6tjLoX6?=
 =?us-ascii?Q?UKHMbU0ube1CKIRYZ/t0qcP+AcaHJ1T77uihjQ6wp4vc0L4dJNl8avcME6iG?=
 =?us-ascii?Q?W1sjRo7ZbL613eGGWtuaKroq6JppuoxJ3jb/cxpPHtwxQujTLpakNQlinviH?=
 =?us-ascii?Q?ntwwOQ6uyjRNPtSMQ58kWSDi1f0peLnkWvzrVNFDNyrk9QkwYKck/8kmteF6?=
 =?us-ascii?Q?rh9BUs2Fth9MBrXdxMzonjdYca3LuXUiU5YFhlGF+vMWrSFvwDEPtD0B0zqN?=
 =?us-ascii?Q?U531lyXC077jl6gOpjJ1sR32RTtl71dO3ZQz9D7ydYlm6c1/sql54KJIPKyU?=
 =?us-ascii?Q?pStsKRndmo7LYRZ/+ZUeFDSIyPtNmW851TROkEbQJteoFd2Roby5XIzSm/eQ?=
 =?us-ascii?Q?tH+6ELsT2ZGE8psM/jfQfQyMerttdP7fIKi5l7OxZTLILO7yy8TVPVV8dU/I?=
 =?us-ascii?Q?QsUWq7yWqNRIIsMWWkbOhAzol8uRLotisjfZwFK3tem2RgcZiYElfpplDMH+?=
 =?us-ascii?Q?4GoTobUE229pG3Tmg5LtLsBsmwBFiEfKWgIQyPPcAxlBI49zkBCuXcuyZZeG?=
 =?us-ascii?Q?wlO7VBHmwYdfqmAdv+N0iRlnARnzkZ7cUeCg/0ueXxNGz0byZ26Qsye9CVoH?=
 =?us-ascii?Q?u3cPGH9IbeUKQcgQnJEsLpdJtp/PRVqEJzzIQGjBsddLEdbxYp9BRIuCJ8SK?=
 =?us-ascii?Q?PLSO6we3FwxaUiiq4NEchFVZHcY1yNDtThce2/8jw3PthAfTjAbIuLXGs1bj?=
 =?us-ascii?Q?mzsc54H6HbZgIOttYp+4F7u+z53gu8Ztryo4GYiBwMOa/lquv6gDnM2NMgOW?=
 =?us-ascii?Q?JmHlzRlS621ic3fQcEefTLS7f0I3nlVkZXcMXwt+qipmMAnnyksXNJh9RGo2?=
 =?us-ascii?Q?W+WEWLHpdjp8HLW6dQIEhJLEW50P0nO6jm8/DTmWhIP1oV1f76pz2k8rDQhN?=
 =?us-ascii?Q?cddB70KJvJfLV74vPk7YOn2LPyFPl2QWfAFi7zn3tTdirj7nqS48pJPvR/I6?=
 =?us-ascii?Q?NjU7iz2/VJhZnpX1Ak3IA+RgMvb9Fe3Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YTEBTIXGFw7Qa8CvIac3uCClaTQzXHtk0/gjZECgwk2uhEmfK9BoQBQoRsYj?=
 =?us-ascii?Q?DJzVlQXs2pdPSs8byHSTZjpqMAqrzdJXr+EGuWYcpdNmG6KDQ+b7uUjkZ8mr?=
 =?us-ascii?Q?MzpEV3NSDA0lALqdgVO8/Sd5G/eMjafJrjMA55AokeGVJ44N3s8Js0GZu5fl?=
 =?us-ascii?Q?dSI9HJ4OcbFqeXObr8D0H7IxsPX2AzLjNsPXzKhWGBRMnElcZ04+xK5WHrdU?=
 =?us-ascii?Q?i5kEcidhaXX0Iqc8EB3iKH+eh8mZb1blYkdO9h6aIfjXbSoWC94m7pxeTxAJ?=
 =?us-ascii?Q?cac5FN+BL8Rh1Bb7FY1E3Cm4OzqM8wmBhlxF8gNCbPiF3FTQyDExJiEjnqC9?=
 =?us-ascii?Q?Wn/W3emqigeZaPl+GiZxhkVkkhhn1SXjqUbcdpZhUs6801WmlKdI9hCFTUvj?=
 =?us-ascii?Q?FkPBUAOHEH9JNSTStJQAm7VioQUL56lApMbMWaprgeAB3tyDI5FCNcPwYfgd?=
 =?us-ascii?Q?lspwIfYac58e/HaGxCwrJ8GJAmCtokzjPoUJRlndjuxVqQ3xHUpyHIwoHlVZ?=
 =?us-ascii?Q?MFF7l1G2lcEVP9x7m3kuezI3HVdbEYbfN2ZVh05QZP9S65ul9jrxw+MVQCdp?=
 =?us-ascii?Q?7ADADJ/qfS0jl73G92kIK1Ham4cEdCaFcXuIYrRM7mJFmz8reBaEp5g4Y4j3?=
 =?us-ascii?Q?QauE28QWwXosLCo45VHys0tDwTdeL8sP/ptL3aCTmfAaqQzECEi9CiRm00PV?=
 =?us-ascii?Q?G5p5xd5FUKG5Q0HrNSsq4grpggHLl5GLiKQMBL4R12GokVq+gUYoA2Jlr3sy?=
 =?us-ascii?Q?7In3937qPiICPGXb5IdAEdqjnkUMkjIi+Nro+Q8aVBKeg+qjkDm1wSHrOQ7h?=
 =?us-ascii?Q?BVT9FsPJzaE6rv43nOLLFUGfn6fsOTyYYzadQjhpmszyzMlhHrLnpcWqPn33?=
 =?us-ascii?Q?KRBxA6WM9QIMYxDvBSb2reZDcj0hETnY4+IJC8snEMUUXlD0+kQ5Nc6lY8e0?=
 =?us-ascii?Q?x2pd1pRv0p+eXXhlalpKZNr+N2aPV0Z3tOWNiSUJystoInp0obL4/kAPHPip?=
 =?us-ascii?Q?mS+NQ/Ya4mx3NXjvXj0rAKiIYrGHa4itN59w0nSBMyrya1X1db2d9fu5ysuP?=
 =?us-ascii?Q?8z7pDm4e8CwWym6jkuOhVedVy2Akx1lWcK9eSFw4RmghyK0Teat9a4CMHwo+?=
 =?us-ascii?Q?02KUuBDiJsmif/FkGZYUv9EObv03RgFtUtfbMcEz8vKASd3mSV6i4IUamqP7?=
 =?us-ascii?Q?5J9x5f58w15es9U2zMPx9tmntux1z+QfhjKk2gdyspqJjAkj5Qbu6s0E0E8T?=
 =?us-ascii?Q?rcxvBS3C0Vrd/N2L2pBYy/m+meALLUdQRRqFLhIEKIOdb7kfO2UOtIoFqzaQ?=
 =?us-ascii?Q?ZbqZPm5kH0xYD3e9Yg9dWbDmbf8l/ngEffEqnCXn2HSgRAr+Tv6qynSdL4ie?=
 =?us-ascii?Q?7QSZ7Jg9K77CQPc1qXh9DctCBlbLnWUHaqb8vw+Xk6p78WN9BANyZnBdIYvl?=
 =?us-ascii?Q?nBr7x2t+/1e5uWE5aT04kVTjAXJMt8fyO9Nr9moUBWyEysxe0iYi1zYUAYX3?=
 =?us-ascii?Q?VU+lrKSP/54Th0Nb/ZVioHoFgjayxb/38XlsneTDHyiIcrzvvU/DhMpok5XH?=
 =?us-ascii?Q?41x3N8zkyMEjgLsSjvhhet0sk560rVX4HlpWQQRL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24689026-f704-4ccd-0cd3-08de0cc4fedd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:02:16.4385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mdpmp/jhbrzOQWXKz5/jrVf70efPgMvdyQrWoyxYldpiYU06Cz8Zg1lmyqeLwrKchjcZ/y5mIRdK+JYa/11lpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6380
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

These patches implement the initial refactoring and few improvements to the
register and bitfield macros. Rebased on drm-rust-next.

Main difference from the previous series [1] is dropped the moving out of
nova-core pending BoundedInt changes:
https://lore.kernel.org/all/20251003154748.1687160-1-joelagnelf@nvidia.com/
Other than that, added tags, resolved conflict with kernel::fmt changes and
rebased on drm-rust-next.

Alexandre Courbot (1):
  gpu: nova-core: register: use field type for Into implementation

Joel Fernandes (3):
  gpu: nova-core: bitfield: Move bitfield-specific code from register!
    into new macro
  gpu: nova-core: bitfield: Add support for different storage widths
  gpu: nova-core: bitfield: Add support for custom visiblity

 drivers/gpu/nova-core/bitfield.rs    | 333 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/falcon.rs      |  38 ++-
 drivers/gpu/nova-core/nova_core.rs   |   3 +
 drivers/gpu/nova-core/regs/macros.rs | 259 +--------------------
 4 files changed, 373 insertions(+), 260 deletions(-)
 create mode 100644 drivers/gpu/nova-core/bitfield.rs


base-commit: 1d5cffebd930d61588c32198f85fbe541ab97b8f
-- 
2.34.1

