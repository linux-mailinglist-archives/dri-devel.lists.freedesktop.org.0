Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57003CD1C47
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 21:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF8410F0AD;
	Fri, 19 Dec 2025 20:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HNMtX81W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010060.outbound.protection.outlook.com
 [52.101.193.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A8010F0AA;
 Fri, 19 Dec 2025 20:38:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lx5uZKy8u2GgHJaXj3hs8yDYgj9fERXWLrEA785kXHnIndJiDrbQdnYhtHqmr1QDmPcaz54L6Qpkt6hQxF0jxHISoR5t0zAfK8taeYUjAYAEb7U5U9DbnXcrV4puTa+SBLwcjcD/vZ1nBT5id6mH9O9HmqswcJk+Zfw11LGoLAvCD8qDP8dGZOXth7jVq0Pu3P04tmYAa/c/Dpehv7Rgu99WTsmPqPkZVbajbcUjeaXQXAosyTGpZM+HS89yelFfycoRuzBw+02euDuEdBkEkvrAXpL8N7uUZmHlZA3TcBrTf4lE5TcFV45mZdxDovGs3lZDyitHUhkEILbXV9K5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtGo4HQrJufygVNv+Og9Q6ag1tjCmrljK1Ejpojmfg0=;
 b=YU3nO4UMbaxi2Zhu9P0jzFlj301wzM7cRqJJjun126InwQQu2E+553vsIsclPVQPHvjghE5Ss13XzlowAaMEV9TnBrdglNIndeShrugpf49Or7FJrpMB4gqUM7kk3KvIOm4d24DidT+nRyL3NBnes722hN4eiyMoXMS7N/glAMjUdkKx0KeAKA0/WHuXOsqQjbfErbDo/9J+Qu9Koh8Cq7/9K0y5q5KUyvmQonA0AjFoinsRWVm8+Vb2DpKqOclbFz+byLGGc1xV5a1uPUC40qh9h6F4zSeWacuiWHj1PSzvukDkBRwxW3uilv+KN8e4xllZo2PADWyn4f29ymVs3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtGo4HQrJufygVNv+Og9Q6ag1tjCmrljK1Ejpojmfg0=;
 b=HNMtX81WRb8QMIKmY9NWX4WO6GB72oLrFyTIBwD3u9ysjguEX5EqLC9f9Dc347E7s070p3c8TMEqiaTKYz15wOT+SBOqKVPNHc4C+kIwVOo6sp4u/GklK+TEukIT/6tNvQygMPPiJ6MKrikHVww5O04nuitQPz9Idhfaw/f3u0mh6JzLdVBqxgKI02IiaokdHQwMBHjWH8RlCK0dSnn/YFiXVun/5GmU8TertfQJzOwdLIzlRg/plsVm+zVHMOBP5oaz+P5ouF+z+0EcHkBbHe6d8r2Imjeh/XeDXoSR/VmWSEwSizJ/Wnt0AVXDdXZqZjDIfPZD4L7gs8qulDw52Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH2PR12MB4248.namprd12.prod.outlook.com (2603:10b6:610:7a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 20:38:11 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 20:38:11 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 Helge Deller <deller@gmx.de>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH RFC v5 1/6] rust: clist: Add support to interface with C
 linked lists
Date: Fri, 19 Dec 2025 15:38:00 -0500
Message-Id: <20251219203805.1246586-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219203805.1246586-1-joelagnelf@nvidia.com>
References: <20251219203805.1246586-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0003.prod.exchangelabs.com
 (2603:10b6:207:18::16) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH2PR12MB4248:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cff2915-dfef-4b4d-1632-08de3f3e86c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aXfZGmJ+e/S2t3owlD64oRw+VxjCIVpoRC+nmSsLc+/Jw8hgMQHPwspg0aJs?=
 =?us-ascii?Q?5k8s3Q6VO9DW5dA0IEY3H/zfspphMM0TAJpcishHq/USVFHwzmzGEWUA7rVP?=
 =?us-ascii?Q?qLRfAG0MDgyFz1p1L5mS9KG393ZzGD7esqB93dg5StOIT+5Clyu/NMRdInCB?=
 =?us-ascii?Q?KuWdfHj7L8dGTg5kYLPaJDTEPQnCu9cG9IahA2DVz60VklHyACFrJ7TbpU/u?=
 =?us-ascii?Q?vL+w/TKWHsbgb6EDfETda1JElTn0gGFtjZUBeZr4xtHsEY24Uctln3x2A0uH?=
 =?us-ascii?Q?x0SOmAZnhZy8uYj0Hy7I5p08QKG0w787HKXo6f1GljX0S+rnaqKaqbtyzcYJ?=
 =?us-ascii?Q?JhZH6lyEN9C6Iki7E4NkwmN9WCdvABY/8t16nRDC1Ipar6fdM8INRte/xebb?=
 =?us-ascii?Q?oR114IGVQW8WnxRTeOcR/BTr8snitBBfCUtDHjPtr+mvY5wwBtNAYzCXb/oe?=
 =?us-ascii?Q?8fjg+B1yjSs9XuPa5OSnIwvMI2PxIEBehlljG1iGc9cdbIEuyjqzcNT01mLd?=
 =?us-ascii?Q?OoCZ5Tlw4BZ0NncQJCgxupCBSjwq21CxlvHesTkAs3iv6AUswWyBnE5CA4Q+?=
 =?us-ascii?Q?e/eoy50fxeO2GimzbZBmI+1D+KliXEHfTkqh27ZNmJljY9zVsD+r9huDuo8E?=
 =?us-ascii?Q?saqh3k3xHDucAHCabQY646VcSmjVfxkHezyL5VN5jj7SxFhhAaTqhLepQyfY?=
 =?us-ascii?Q?QcR3JVE3dCKCqRCX9g9GnS3BOUapj8N4PF4fIbNWjggogs/bypEACqOhX5yZ?=
 =?us-ascii?Q?SIAhYG4gBle6t03PtURJ7GBNZxt871ab+pv746IB40nJZYE9DCD0/UOHlXos?=
 =?us-ascii?Q?ynCGZjE3Ny2If1FuZzskq3ylMW9LOEiYw/LdnJlUbK1mPVS2uFNUzBUX8S66?=
 =?us-ascii?Q?lavwOfxSHavvsfDhF+iOI3vNVBBFZrEcYIJhQuGtpEQiAbSYAp0ltaxBwGRt?=
 =?us-ascii?Q?KJ5Yx6MVvY/rY2FNuxJY+JiIfYbJKKjOqLMGK5URg+pZUwQ1DK33zohVgllq?=
 =?us-ascii?Q?YMVtWdSgFs3EvYICe3RHLvEbjnGB+G4nnPl2rOKrM8yrVmunCgO3qMD1IXNe?=
 =?us-ascii?Q?hA6Ee+wuFlOvmiLWoY/ahrpcULN5NstYl4XXculnKbgmEI28U3aI/BqQnFUs?=
 =?us-ascii?Q?sY/wnXGmg+j9LVq5Ebx7iSgWyJ/0++u6qm0YHwo6Mq0XHKbvDpYckOAAYDxP?=
 =?us-ascii?Q?4IwzYna/5UaK7eo6pQt9dab9OdHM/8KAh/I49mQqYbxkXRa2YKEF0mTW2peN?=
 =?us-ascii?Q?2C9Wj3fSnSEdW1hTg2P7H/pdO1T7BTlZOlrurVef8FUTkgesjSyz5aV6HxjE?=
 =?us-ascii?Q?XnspmPAcOIeHBLZNPNg79odCjVi+gudQMoX4n4yoJsjRh5jOv7jZl1ooAtAR?=
 =?us-ascii?Q?Ezd8EUeCC/qoAgq4ZgkithFJk3+YPJpouRUzsSbxFHmLjOWzNmARDEQ9EMtS?=
 =?us-ascii?Q?oxn+IQGYiugqB+0idrkZPltOgEZBUmurAScjrxyrLBwAEXbQLupOaffoEmAV?=
 =?us-ascii?Q?UJ7z239kh7ggIYc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/+cVOJ1s6Bc77Kgo4DpMsRpsiXFL6B660KuuOeJUZSEFWIKCfTtecJ59E9L7?=
 =?us-ascii?Q?PJhwr+GAwoWREHlx3piAWgNMgeUpeJGMEn/ZH2basSCCysOI3aB2Rt3wRm1x?=
 =?us-ascii?Q?LQ1hKEciCJGyg2CdoZTkJ7Sk0uuTiHDy1obInYB+yq7vhmPp/GnKvuAzeNnG?=
 =?us-ascii?Q?9vR5/D6Zzpae5OIOpA1SG9c9bSoaBrd2fpYBHas9KSzRVE5P2O1twppYlOBW?=
 =?us-ascii?Q?N//L8i2WB9RfwvhtWfUhMprlk8uKbySbv7ueJ6pQ4C+/xUJJ75eOr60bqA0Y?=
 =?us-ascii?Q?61fKYSY+UScQ4ilrBI7FSaGIDtNk9GVV+VjvyjqM7I+qSbewe0LmPVOX/rU1?=
 =?us-ascii?Q?TDJ89g7mi0yge5XvSS4wLWJ74D7Bl9ISgxCxNigTy8o6KTFJuOg3FQH71xXo?=
 =?us-ascii?Q?ycuap7Dq33JTjN1gp1uA99yXDgbuTzuu5cct4jZyj9JS9I02Gi/sUVWGgbX+?=
 =?us-ascii?Q?DVABXHL9GUNcPsEfJYoEQyZODboVh6DlscOhV4zIPMGzmRvV6R4Gkiy3PYFt?=
 =?us-ascii?Q?7H/KM7G39JqWMPzXNIacC697uw5kGWnrW4mbsWcQkTnn6DsVVMNhmJU03SIc?=
 =?us-ascii?Q?Zz7mNv2PG/ES+hHUtJv+hgRNY1NLMtVY7RCvTDZXgx53rlRztRxqzn3gnEj7?=
 =?us-ascii?Q?1yzU8J+CDceInPhr+jVdVpiqF8heJPhoJkQO74zpVniC3+Jc7PoDARr/Difl?=
 =?us-ascii?Q?Km8KKh5xUKYhnF++4sDsqDHT8PGpJWFZ42NLEABaLAWWcGtyQU0xHCmiiU81?=
 =?us-ascii?Q?UkrXp71URuWpwX/KNZnPUOEXyX2kXLDxNMvQTMrkio0daNNafl0V+YUXPeRJ?=
 =?us-ascii?Q?j4UbUWtZh2iy3xNykUh3yFjk52vl9f7QK2JexRkXbwfOCYptrKCrWXAF7hRY?=
 =?us-ascii?Q?wUoLGYDzC0k81F2p5GP9ZcBL60+tZOGF14OCzovL/Gv5fRg3CYgDo3YZOpUF?=
 =?us-ascii?Q?HB9NGY+WM51R1h+A3OxpET1+GYvnSt6GZgq/eJznpJlCrXVjzLtdwn1bd24f?=
 =?us-ascii?Q?VZ/I8debfitTWfQK9KS/XCZJDHqr60zFl7VVbaf02KaSa/NK62qKBCrihpQN?=
 =?us-ascii?Q?rql1MIrnOMAjCFk7ZK2RXBEeYhDBYswUMSFALAWxeosbv6Dv5nteVpA8X12b?=
 =?us-ascii?Q?6e7HL1lFuHvI3jS7s/Oc6rYlBa8m8QSC720VjRiY8adkYzA0yDHcfMm8sHVT?=
 =?us-ascii?Q?AukJjwu5RpjMy0iW+YtJRT9O/ZMMxZQHZNOCzY3DGIqMeQmSbXor4krj9JUI?=
 =?us-ascii?Q?Krx/ShzJkCpJPmd9XteDM+6HZ0n2UUK4RIVe5AymvMi/vTgc/DVHWBKi5z/0?=
 =?us-ascii?Q?5Wfcxcyjax8k0tqbVbWud4bqblcsIPp4nuLm7SHKio1A1FUBiF0TaY5+YWva?=
 =?us-ascii?Q?GxLMX6s64+uRs8/DNGOOQ5Oop+71fXT+0XXUeb9ogOaXVP62z9mJme3BXNvv?=
 =?us-ascii?Q?GUPLgAijB7yhlE5/KQbk3kTnKRihi4CTP+qJajX+I9W/itr8SSPfLX3G0hqq?=
 =?us-ascii?Q?pAc+Bc3pawsbu1Fyx3A5U1itWU/S2n5KH7K1M2KZ4xTiESEoUVgss8Lo+5Go?=
 =?us-ascii?Q?8l0czkmRvAwREnzVL5A8MafvzFZVohzmvBghR4WGboNfUNu0O94y3cw5w+sC?=
 =?us-ascii?Q?gw00PV4seSjdzSAwgQgyZjPzLm1ZTma1vuWD44p0IKHA71baNUtNpGOqwT/H?=
 =?us-ascii?Q?cXHex978751iIlhyYRLS8s8SfA4DjE+MWuPzzHl/aTaCF3fMmuHJ5R9CL1+E?=
 =?us-ascii?Q?FiczH5Xp2g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cff2915-dfef-4b4d-1632-08de3f3e86c2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 20:38:11.6224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBP8bvQ90khjPyEaOxAvV/g0dIisaNdafst3d1jV+/0P52fzbJuoX0W7UQS/Ss+K7nk/1+ruebuMGNSQIGU3Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4248
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
index 5b11839cba9d..1b72e539ab34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22928,6 +22928,13 @@ F:	rust/kernel/init.rs
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
index f812cf120042..cd7e6a1055b0 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -75,6 +75,7 @@
 pub mod bug;
 #[doc(hidden)]
 pub mod build_assert;
+pub mod clist;
 pub mod clk;
 #[cfg(CONFIG_CONFIGFS_FS)]
 pub mod configfs;
-- 
2.34.1

