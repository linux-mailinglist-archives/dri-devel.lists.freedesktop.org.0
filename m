Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF606B8CEA9
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 20:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDC410E079;
	Sat, 20 Sep 2025 18:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IFfNIqFC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010043.outbound.protection.outlook.com
 [40.93.198.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170FB10E079;
 Sat, 20 Sep 2025 18:22:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGxb+yrRy12PXD4kvurZWrfqOlZ7PpDwkVxouuNYwLrp2hQeThDGToiw3L1antShtI0rNTlC/K38tpNYfKtdqMb2D4zABCb//nimACQv+F8RKp5vVFIEwwb6bpj0zIH0OwwlcBsamoMSJcxl6mTnkKIcviaceEtMP8Sf74fzLN9ixdqSM9arU9of1LCVWM/cYl3rUnFsmtWr01D7py2zD6kM7jeoarGO3dS9IfVaYPqHTvWjqLh3RvKM3b5KSGYatyKQtN8AVlmb/hRpOJZ/bDvNmH8MhgSPi4XeDIsyfCpD+vQS/W6BcYdkPXcB8U4xleS0fRI9JU+6GNbg/YL5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTQoPFDDqfKQcZG5/1l4uhWRbjdiTDek6IN2LhofxNc=;
 b=pwKd5BrhiC8WDeqGIX6zT5hDSWrPV2zXKsmDQoR4UodoQWLGWezHLffN2T8nHGPx9PDVFcBxnkDRHh98/T9Zghr9jUZGpn3zbF4p2tduJ2AUCrgFaUAuyCWJf7vQXXfAjBHbtjPgdZYdelq/AqgTkdJ1vAFQD4DCQjaKi9T9S8GD2AU7bv5hPK7lZbiOapkW/ksJXGMOpZAK9AAkq6rlioymCaxyIA4FlT7X80aEkarSLPkk+lvUjxHujVLk6qwfRyks4+McoC8ngwQBZxksl9yfYdaAyJw6US1DMsR76psD/Vdv9Zlx0dtZa7ACS0R6lsihKcyd4miWP5yqzm48bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTQoPFDDqfKQcZG5/1l4uhWRbjdiTDek6IN2LhofxNc=;
 b=IFfNIqFCpAje26TFbfytzBEiRcX2HaX159pELu0OWlaZdwaERD1dO8ywrBmJoCJVzC8YDex85vQsH+mVa5S/n/6CX6SdKLtYQduNqPh8RYYRpixTNSFOZajb0qSmJ3+zKVzJw1WU+L8QVP37lb2m/mW/XxniCgWGsAF5AJBmMjEoaSf7aA/MROp3odxonUkpW3vbtBU2a4asBfudZR8ghDGnZ05nJtELN+NG2mzLvIEuAgXzB1cbqeqVASXte4U8g8KBH2/Smzuge8FNKvUGOAWfTrEB/672vj1fsXn8p/WcdTep4IP2XWm0wukwS8Am+PFh1sBLAY1GGY59rmuMVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB8913.namprd12.prod.outlook.com (2603:10b6:303:247::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Sat, 20 Sep
 2025 18:22:54 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9137.018; Sat, 20 Sep 2025
 18:22:54 +0000
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
Subject: [PATCH v4 0/6] Introduce bitfield and move register macro to
 rust/kernel/
Date: Sat, 20 Sep 2025 14:22:26 -0400
Message-Id: <20250920182232.2095101-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:208:530::13) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: 081cf107-7ea0-4617-74df-08ddf872b735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BtqTCNYCawBLZaGZm7JBs4OVn9zqNkgHAultcb/kpW+bFLKDe48hjFLm0W/7?=
 =?us-ascii?Q?iLlZK/AQH1Omnwh2O9nnavU08pymOU88J/cACyrkd6YDlwOL7uP/BBayn3G+?=
 =?us-ascii?Q?5pL63OTxaiQMwC6zNqHjQt1nQMqjyFejeIYLcbJYO5J62UhygfeagXywF/Dx?=
 =?us-ascii?Q?6INaY8p8IbIJ8oLfembT63SCPmo5bA3IO/+6FiDTtTRQG8KitaEntgOGe38f?=
 =?us-ascii?Q?uijrnXYL+23AiYFkQ58iQO63k/1ncX6Qie4gU21Zb36mLZgKZLPqudxerCMy?=
 =?us-ascii?Q?ylopGmxFlDgOiadDTrwcTcOOEBND41z1ZGyO93y1EDBEtbN5K+lI7LIqT6uV?=
 =?us-ascii?Q?3FV7orJo+o4liV73q/KrIS3zFgBLutq8nUmsba2QotFlMH8wLV+WAlnzJKaa?=
 =?us-ascii?Q?I655Wcl/Nw76ml2eucgjZNg0SDAPMJHftQh9nIjbTIFr8LQA1VlfozTYzC6T?=
 =?us-ascii?Q?u4/8HYQKaQilaM9Bhf0R+krwiIBZAkADBLFRnRRiscHmidR6v60GbZWwaanF?=
 =?us-ascii?Q?YPi7pobLA3lvVcfeUbcI561Z005h9U4Ki9kCZRJs8xcZk36wOJbkMaykHLxg?=
 =?us-ascii?Q?ihGFTQKfOTph1zjNQrCxXIda+ctDy6oQ6oBFlS9l38/NmKZ+G1C2GttfRvbj?=
 =?us-ascii?Q?aTd247fSj7olOdhOAJGWLBXWoTysK94RKPceyJNF/RJ85jO6wggNlPswM04N?=
 =?us-ascii?Q?wKQ7hht/kw6JJJuzR5pEdtb44ziuuQzfdwp3tDroij9PVGsOAx1bEgexWvKb?=
 =?us-ascii?Q?On+v6l67noKnnhS/hGi/CziZAjAG0V2qH/EO47Pg7XWGVwwwIGBfqe9/q2JU?=
 =?us-ascii?Q?jCNvRbRdEh2uWDE19mBQc+4P1kIdiODpUtT7jFBo3JnFk9+sldONkagSSadB?=
 =?us-ascii?Q?muvkrMgXEE3BrgiRy7VaZ+KTstgIgTvHfff2Y2p+6Ixcmr41DnxXHuM9fuNF?=
 =?us-ascii?Q?hJmQuFMo38Pw7Mn72CkbkPk04t+PfUAdy6x2vDlBxE1GICVjj6YeH2qzdNXK?=
 =?us-ascii?Q?uKTHusYeElyei0liboVFAKU/ke1h50uDcktL/fxVMyBvoU0Zwb1jXwe2/3CQ?=
 =?us-ascii?Q?WOvO5N+ncf7jbD0ZLRwXAzO8dp7t1LGUE3wVb0FRP9hXiWu3UHDpq3tOahDJ?=
 =?us-ascii?Q?T7xBZN9wv5juyD4hNEpDbDbRipJt84Wb7C023cq7NZxyvQlFOtSrHgo0nYsS?=
 =?us-ascii?Q?58d8C8/G4tQciMcVzHTW37zDVVnYsT2Xq1fdoMcPjkv/F9oa8dxak04Bq4KS?=
 =?us-ascii?Q?zXJqDU8onALSM1plRe8NwRTdRFkDtRvirScSdGfXSmfVDnW/PpJ5BsFBK6rM?=
 =?us-ascii?Q?29NMjlEdjsjfRe4y58rycg4NEaTiQBQv6YivPJWVFTYMoWeLWqQ4n22r+/6N?=
 =?us-ascii?Q?sY1QlrfvOfouib3DPsSBQEh3VRAfTc4TPgBF+E344kJtpglufBmU3GGZi3jq?=
 =?us-ascii?Q?JN/VeZi+qgmel9V5cKwxV2heXeXnF0vY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c30Pjvv7DH3sZX7daDx8nJpQcPCpjSVZlJYIlfYxGfKPYbrFQ6XAmdpTG8Ot?=
 =?us-ascii?Q?Jy3Z5r/oBNvDuzEH7jL6a7NJh9sxUBWCwoPKViyyw0dCi0Pvdr52YJcGJAHU?=
 =?us-ascii?Q?5F9jAC0qR6b9UnqYXQchGUXqfvJMe9aj3L9wuliQmftUOMVbVfOVOE1ctTBB?=
 =?us-ascii?Q?PJmEi2eOdNDQiVGNiD/S3xOOYb+sQ9ThvefeLzR5fsJc+ULtD43dLlP8vqcm?=
 =?us-ascii?Q?pbgPITExX50ZWocaP7tpcO7ebJkdPYHBRKGl9GuBfbbNDNMbYDgiJdN9wBL8?=
 =?us-ascii?Q?geFQdV/xpL+668mq6iNyDeoe1x+bFomzwX8UetUYB703Xfsqs63YIQDC6JIJ?=
 =?us-ascii?Q?0Uue69v6WeXZH/24bepYC1G0M9e+vpaGVWs+7lcXikckERt1PeN8fYvRi2RI?=
 =?us-ascii?Q?1dKHsTFRnLvSfiDs/yruofuZSL8eekmN5wq121ANx/WsJoaqF/4fq5JkO69i?=
 =?us-ascii?Q?T08qqcq8/c5uouV/s114OvTlWwlInPx5s57XewaF0fOmthMP1LwXL0p3iZm9?=
 =?us-ascii?Q?bAoRmk2Kd0/5OP6R1CGevf8gI3L9e43sPoUSQNAHKI33hiRH+4l3PEyAQ0gv?=
 =?us-ascii?Q?u4Wwu3Fk7Dm3iurEYM56tI3BmH0nvk6q2OLFeX0vbOaQC8l2qmTSrG8BNuwC?=
 =?us-ascii?Q?xBtoudUu8s/QFTTqPIqpXELyVQI7z+4jbajg4OyJ3aPci5TphG4nENdEZJd3?=
 =?us-ascii?Q?l70CI+93vmhj22Jid4rAPQIQa8jWBM6nN9mMn0/oBfFhrJp2FZ5FSorrGEv5?=
 =?us-ascii?Q?Gs8GqUsQTBRoWy2xy7vbTd18UHpYPguiuLCKwmucXEMvnnsxndQiDSKIEj6/?=
 =?us-ascii?Q?Wz7rcuF0EXpbIZuKpKIvPBBa91PVrq7yu4IR5GMWcsXX1wmrhVQvmQekxMgd?=
 =?us-ascii?Q?CATnVE7yvAxr/hwKzLPewNrnvLW5opxYEKHQ9Ikaw1rjGlF8L4D39rQNhz1t?=
 =?us-ascii?Q?3LT+uzvNJx8V8BvKl+AbS65G63wgAjxYU8cPzZM+2bt0ZuXHRp2Y06xC9Xh8?=
 =?us-ascii?Q?EPwTK1gb88A3VBRtL7FvX+7cVPGkAxl8AU56PYSDd3RKaqbiCoiqxmzyd4/0?=
 =?us-ascii?Q?NKWUTMpR444jU33PEr4Kc384icADINUkjDqUzRgDHBE9ro6azVhPum3U4TpN?=
 =?us-ascii?Q?zu2QmTgNDSddVzaj4Z3m1m3HcQDqYHc4sZqPa0TzjIgo1yNrBjVx7oXgKfzo?=
 =?us-ascii?Q?/sfRNP/7XzDZWCeqiAL67cySpTZpRTdjK6tPiRh4165RBaNoeJ4x4kf5OwiR?=
 =?us-ascii?Q?ieA2juCVRvamSJfEI9KXuG1zGLCcXvL60QgBbniCXPNTm3AqXu17RUV1h3MR?=
 =?us-ascii?Q?sxMA2//U2BTfvqmK/h5QBpxQIC+IA8r9yIMLFx4ZW1NelNp0LpkMABycqc9B?=
 =?us-ascii?Q?OT/PVBUdiDxmOL5JfegsKxkrPKEPBOv57hhO8uSRrtZ/jn7sPxZ3vSzv77kJ?=
 =?us-ascii?Q?7XOwGZ1hgE+9RGzSo5K0nizGn9RcsM38Oml3bdN96+pBubQDmpG1onNX125Z?=
 =?us-ascii?Q?IlJZfYJ1ckYcfURm44DDRoTQHw6EPL8Dr8aY7JI8VvqDts5EV/2fqommWhtN?=
 =?us-ascii?Q?GbJaD0Zo6KFKzmvNKSZNE4Aezv0cNktpyT6KZhWf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081cf107-7ea0-4617-74df-08ddf872b735
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 18:22:54.2761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/REi8I4zXL0yZb0iYnIvj2ftelr3NE8UDlbMxO2hbVxNq0aRukYb6b6eD7VEP9zLpIPO+LEeM1fpxP/6NuPMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8913
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

Hello!

These patches extract and enhance the bitfield support in the register macro in
nova to define Rust structures with bitfields. This is extremely useful as it
allows clean Rust structure definitions without requiring explicit masks and
shifts.

See [1] example code using it.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/patch/?id=76797b31facae8f1a1be139412c78568df1da9f3

v3 of the patches is at:
https://lore.kernel.org/all/20250909212039.227221-1-joelagnelf@nvidia.com/

v2 of the patches is at:
https://lore.kernel.org/all/20250903215428.1296517-1-joelagnelf@nvidia.com/

v1 of the patches is at:
https://lore.kernel.org/all/20250824135954.2243774-1-joelagnelf@nvidia.com/

v3->v4:
* Rebased on -next.
* Added more test cases.
* Added support for fields larger than the struct
  (ex, using 'as u32' for a u8 struct.)

v2->v3:
* Renamed bitstruct to bitfield.
* Various suggestions to improve code (Alex, Yury, Miguel).
* Added reviewed-by tags from Elle Rhumsaa.
* Added KUNIT tests including tests for overlap.
* Added F: maintainers file entry for new files under BITOPS.

v1->v2:
* Use build_assert in bitstruct
* Split move and enhance patches for easier review
* Move out of Nova into kernel crate for other drivers like Tyr which will use.
* Miscellaneous cosmetic improvements.

Joel Fernandes (6):
  nova-core: bitfield: Move bitfield-specific code from register! into
    new macro
  nova-core: bitfield: Add support for different storage widths
  nova-core: bitfield: Add support for custom visiblity
  rust: Move register and bitfield macros out of Nova
  rust: Add KUNIT tests for bitfield
  rust: bitfield: Use 'as' operator for setter type conversion

 MAINTAINERS                                   |   1 +
 drivers/gpu/nova-core/falcon.rs               |   2 +-
 drivers/gpu/nova-core/falcon/gsp.rs           |   4 +-
 drivers/gpu/nova-core/falcon/sec2.rs          |   2 +-
 drivers/gpu/nova-core/regs.rs                 |   6 +-
 rust/kernel/bits.rs                           |   2 +
 rust/kernel/bits/bitfield.rs                  | 736 ++++++++++++++++++
 rust/kernel/io.rs                             |   1 +
 .../macros.rs => rust/kernel/io/register.rs   | 289 +------
 9 files changed, 774 insertions(+), 269 deletions(-)
 create mode 100644 rust/kernel/bits/bitfield.rs
 rename drivers/gpu/nova-core/regs/macros.rs => rust/kernel/io/register.rs (73%)

-- 
2.34.1

