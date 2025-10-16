Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40EABE4254
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 17:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BCA10EA03;
	Thu, 16 Oct 2025 15:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="D97y5IqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012028.outbound.protection.outlook.com
 [40.107.200.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF9C10EA02;
 Thu, 16 Oct 2025 15:13:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjMN+peo9mDmF4tfzEmmAtJ/k6OurIfxnj7cshOAbOBn9fteFLL8GkJqdKCwgI30HSTqzLrWI26l9oNmB6a5AbmTAVWNuhoEALJMCQrqMXCfbs1WBefBL0j3eM8hdclWLVi4r9EQqEG81MYNHQOWAg+7X50U2otIvEMw38RVOkCrZoxfxUVV9ilqT6BOAKTmCRP0T6hIdFcNkpEmeVH/JBJ2RCzYBUmCw/6ubKJL2RzI0ksaatKDCWuxxwiwbV4Yy1ZUMDMF3q9DGxDiB3UhSlMJ5fOMXEelxEdiwyWj7LIiVnD5bymHXjH6l+6rRQyuhdEmu7khYRCTTYfjnD3bXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjwQFDfkGNEmj1wpoduUMYhVhhfkIjEyov15v6bWrm8=;
 b=I1rIlwfVkpmAwnVw/gn/m7/BZPyc1Fsvzg+LHYS+Uzj0bdq7Mm7P3q9twTbTmDCXBlQd+MFeE5hvIerBg4E5V5IlFjBmRTHvI30XgOTjl6EbY4g0nad4+wtNZL9gQIoMhBCBsaSN+ETU1nMfZZcCG0huNPt4WaUfhsI21uoAX4kIUYNjBstGEHlu0XklHADYWCo+IUvseVinFRRNUFTliKNwRHm8m+tkEcVJCO8wkp5chPJKMAwg/9hERRd5M+aB59HKTvhvcdv5ooZnzsm1Zi299FTFeIe4COLkL6wTnnOuaWvyQ3iyVw4Fgw93tbP8gnvnJD9jCzfM56PYnvkY3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjwQFDfkGNEmj1wpoduUMYhVhhfkIjEyov15v6bWrm8=;
 b=D97y5IqYBJFwWnt58BM/2O0F4LoCfOxmpuf0E/WEw6wGBz3aWZTSsKZ5ut9Itz6k1kPxUMpdNDq7ua4fMeZlrD8wdq1H0EdDQqabDfdxZQFMrREq83uON/WRKXKq9VkY0wMilZLEbDCkj94/lCL3KDu44If6kuaZEXBOYsQx9gulMHUDduPVo2uZpT2VUL3JkghhPIhD1LBGs1LCLAieZlYHHserIuCemJARgJoVlQ27Pc6k8AzVz1gqaqdocc7NUbPhC99QgZb/eJzivb2MjcKM0Bwc9whayBwaLaCak8fxyoiN1ng6lLDliK8AwO/XCNWRzfTG+MedyTH4y6lD/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB6205.namprd12.prod.outlook.com (2603:10b6:8:a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 15:13:27 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 15:13:27 +0000
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
Subject: [PATCH v7.1 0/4] bitfield initial refactor within nova-core (RESEND)
Date: Thu, 16 Oct 2025 11:13:19 -0400
Message-Id: <20251016151323.1201196-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:610:52::36) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: a6da7bcd-8f0e-40ae-4f8e-08de0cc68ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NbcyPr5rxjLT/N5EJ554k/ioW42K+hKKDNqhNF3jcgsTj3Oc6eU6BijfJIDv?=
 =?us-ascii?Q?/t1jxbBWOBvQX2ohzMh6YLQ8ZjfvovQq74f5aWy6wERpsGNQTtBix9M07OWY?=
 =?us-ascii?Q?iW/WxedA2NO5cPL6FlLEKCj3hh1lBeC8OnJJ9H9ZZHdxu1qe0qgqoHJSDF4D?=
 =?us-ascii?Q?eX9p+LI48HspT5NYG7U2tzErDV3AoXdzqMtfgD1fCjjcW/6KxV5DrE6HImr6?=
 =?us-ascii?Q?W/jn0JV61GBJTcS7pAOWQdMpj2Tg0WCslR/54YaYmumUSscYjYxBqYv+mXN5?=
 =?us-ascii?Q?FfHL7e2gJBRE3hYUNCK2UCYgPjbHMN/z+i3vB20qwQ5SLkzhntIv1dQMoM+l?=
 =?us-ascii?Q?bYor7cJtO4GuNOBK9tExzsPh5SIOs2plYqrFWR9HsFQZRXaOeMwR5RFeBd72?=
 =?us-ascii?Q?0lKLCbF2C1kvULi1aLfm7AKLQ5YjvzvqkZ/eEc6IHasATk69TS+R7dXDmn78?=
 =?us-ascii?Q?a7kKgh8qM7qxeWwTp2ezHL58r3X2Q2wxglGgwvYOD6osA2JOTg7vuUHDCu58?=
 =?us-ascii?Q?YN+ZxNBuzcJqLPUzvL7psLz88H1xJmh4fcO2JQLWXhplBgudKz58tYJzwkuG?=
 =?us-ascii?Q?mkBG/a9uLrZFmB+xjmxLahWHCbnUaJjKq2Id+KG4QpZYdx0ARXbBEN1neswD?=
 =?us-ascii?Q?OxoZWcIV6N39Ik9h37eavefvVujUY3PHmoTmENifpYo0CojzgbN5riJqmIFi?=
 =?us-ascii?Q?4jbKhLvKRZb3uCMMw4BfX/8i/wleBIpHxA3Hap4NyA/DyTSDlEg8gQTD9px2?=
 =?us-ascii?Q?6bYkc9tKnJDEgalmj/tse+LdMAVhGzUkzkN1h0blTDKUwYgrFVd19w0nXxXB?=
 =?us-ascii?Q?2T1dZikyUmYsb2qDZDp1zfwV9GIK7tyQMMFW1BLddh4AWX7R3AtGW9Njfs3Q?=
 =?us-ascii?Q?NF92anEEb2R8CQg8wyZlNFjI9Rw/4cMeKiBpt3AQNvrrCEutxHatA/TsVn73?=
 =?us-ascii?Q?wHovbAnr/XlAJFnHaSyew9CwZbs9qvoF7bemt6ILmEWn6Kf+sqkysow0duG5?=
 =?us-ascii?Q?0ZCIWqzhQ12eReeyVFyL1f6My423tzTnzU/w6sK03AFrY+Tj3IZChHqhddyv?=
 =?us-ascii?Q?nQN9CCB4mdC9PGVTUXH1aC+kOTeb7TxAr0gIEfVIPjkaS3hNSf96CWARXka3?=
 =?us-ascii?Q?/xXfUhcKjh4Blh2uzczMFI2kZzDWjJvaft8eWkYbhDV3aoIh6c5zXUJCymNK?=
 =?us-ascii?Q?FXNbIRkd63fAx2OtGnG08G5QoZ7urC7uiCb8TeztmsgYXdHvtAJenXCBhv5B?=
 =?us-ascii?Q?+kiR8Gv21KxdKjHLSkYuxnlmbfvV18p75NaZy3yqHz03L97dtnSbsYYSg9Pl?=
 =?us-ascii?Q?gE2V3gmWrCBkulctFENUq75QM3fNqOGCHtKCl6EjJnsUoUs1Pbia1yVKWW/2?=
 =?us-ascii?Q?DNyPwJAEQtcD7ABOBWSTTfbbM6emOCHjAruvqUivHWxZ4k9bm6VffvZmF8Q5?=
 =?us-ascii?Q?yzAmniBvrmiKril4F+jyO81mPYF2TgKo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vURjHLerpJZz756jzxly8LyikzNe/mtE2xMEDwH8x9xWdQ9sJX27bNrzpPjT?=
 =?us-ascii?Q?/pF03yg/MI+wYgkNylw10NucHBDG8Q4ENdeguhx0vzRjtSdY7bSN7Qavzdmz?=
 =?us-ascii?Q?XxRs17U4nRYlqn333T/IfllWwR+d5s9GawttzW9gA76FiS0FMivOmx9l+NxS?=
 =?us-ascii?Q?RXUN7/zAAA0pjIHBc0uWWD85t/DKQI4/9uieyxQr5synPTKncmWP2OTswf2r?=
 =?us-ascii?Q?nZotHcxZ8FwsXNaQmfSRYesD07jykPAYQzgqtKHWNppa5NQmmMaxdNph/PyW?=
 =?us-ascii?Q?2Nr8Sw8G9FjLH4VMUwVV7NpnvrhwC+v1xRhYOM9RDgqvUZ8eRGsLoKiIf76/?=
 =?us-ascii?Q?8qjbcTe0HewCDntgGhRrDn2UakQhIpqhDO9HQM5YtiqM8CNC41dGs/6HTCkY?=
 =?us-ascii?Q?gTPU28tkt+r/kUVu64mYwc6f4rIV0n0711Cp8f7N9wKx8BYRJmgjXInd2ufa?=
 =?us-ascii?Q?2ebYp7qGfVVk8GemcsiOsZrDIbc/wYmZln+LP1kSdAFV0ZDc8Sm+GTtIAcdO?=
 =?us-ascii?Q?0wVS7OuqDCTC5GDywKL3O5wqPkDhCw4O4skDgO8lFUgM3CjueN56GSwDAoWw?=
 =?us-ascii?Q?9ty/cXgaDyMD+m55B5zuhdJIQu0l06yWKnFXo0lZHbWZ8Txw7MpSaA7+xHWW?=
 =?us-ascii?Q?vS/1RhKuFcCn8AsQNobUuj4FBPfRydkphYrwV8NRDWD0zic0j29cMiOHdbfc?=
 =?us-ascii?Q?aZDQB40cXivJCNL1izdwn3Mk5pB7Tnm5jobualtE/sJ7kgaJz2qAgBox0mBR?=
 =?us-ascii?Q?Ls6MsmaMjHS1+ggy2YhtRWcG8znvnIi0US++0sVJRhqfrhHwhnAn2JnGmejb?=
 =?us-ascii?Q?Ze98OlQ8yR8HgnKM9GgJiglO/EAiZP5rFT0rsnlIG8xAMsnGOx38iIcmn2BK?=
 =?us-ascii?Q?xBS8ePXkyQGwerSquJ8/JgZU7zZtIMaeKt4MXHr017LHGDeNQohtQupkZTeF?=
 =?us-ascii?Q?lR+/iQjWrHoNWHEEHlykAV9Bvg7bFsKTDqx1aVX27Zl/82nawsclCUkrbelk?=
 =?us-ascii?Q?nPyFJYCfM6o7lZFTPCTI+l020xYgcGNvkRcEdWN5tkqj0VNGKe047NwRShIV?=
 =?us-ascii?Q?SB0t8TJgaNMUjlwfNYvC7EHTzXFZICBMequGw7bd5W6Nianw9orDsEomF34x?=
 =?us-ascii?Q?aesX1gHrLH1xnouGkY+P+D0YNTjKsfwLE/I/wDCyrNIVY5Xp/5s7/8NXmgif?=
 =?us-ascii?Q?9O6hSGnCp3YFSMmFGdL9Hv4vTmNvsOyfHklDSTnhdnfFKu0WLOBeTBenyTjX?=
 =?us-ascii?Q?FnlMiQsSGziNpp1NDmjwTsSNAKZ8EnPvpYvaiGALMJj2aqNIMPjHiDw0wwRH?=
 =?us-ascii?Q?QLZCMVW4zc3iysY4315lrjfusQtge1jK0X5gmOGltLjcvpT2dfoiCbvd4xPg?=
 =?us-ascii?Q?itdu75By2o1/EnGKxqb/nK8ystce7zHFmBidiL8QvlOQtC4sHp6wDXJ4PGRI?=
 =?us-ascii?Q?VlLsEpUJXbLS4NFIoWhlqkIxXbkwo9TdJJA7/C8RerP8pZQmh3EMQ0SUDwx5?=
 =?us-ascii?Q?HAMVovUrgpWi1NWV7LUTSrjxe0pEaKGkOjTmK/zo3kPzUWaOn/Gtn8N+qc32?=
 =?us-ascii?Q?QdNEAuQ9ESl6ylODgiMX+MtApy6mhoy9C2ccLb2z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6da7bcd-8f0e-40ae-4f8e-08de0cc68ef9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:13:27.6479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UX7LzlTD3wIdTMvkkOgzeITyHYrANZr4CylKa2D7ntGLvbFzUaVSRsZuXA5fs7N7K/TYeKvHCTiXJKLVP1X2qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6205
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

(Resending due to some commit message mistakes (missing SOB etc). Thanks!).

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

