Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B649C3DBE1
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43B710E9E8;
	Thu,  6 Nov 2025 23:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="a+o+6XT4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010013.outbound.protection.outlook.com [52.101.85.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E299A10E9E8;
 Thu,  6 Nov 2025 23:12:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEIx9tvJLhsHSKtjQWHDWvjLUXrl+Qg8kX+26PIVu0B7eTzkiAeWKte/L/JZ0N4K0yElL8wjgyV6TTPcb4mVUsN+S9wtSv7HR3mueMq4VTbUf+7gS8qgGVSP4Dx5jdzDhcn4guTtcnW0SSemARXPg3L2J9BSq8WbQgUlbF1NTDbCB97bs+/aqi9l4ZohuZw+8Lh9z38oOp1I+/oAi8/CdQN4sauLwuuW3Rxv/tvJ7Xp32E4mSM4aHzfW46juXhBwdLcIx7TpUshJMc93p1fRhRlyU5PPwjvItcFyPpIxuZgQs5ItfWoOgAXym4TqfM1B2LuNtOb0lqSjGIINWCbQRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lD99cxYv5Q2Td0PBk8Ww0dx8Gd0/NjBxgDHaVfkMI6w=;
 b=WZE6W/n5ksdtCFHiEwh80MDsGhE4euIKKSQ0bLSvUsxAama4j9TY8lsczdBtsBKE/9IRwRS464DTgJgLK2lXHGl5HlW0DvP8PCJzX+2VNCJ7PViXtkTeB+Q783mQKM51Vn/yx5Jd2VEZr7UJFfwm91cHU5xVO70ZEBMITxnJEjgL4bj7UBOXt6Z3kOCq/s3o636uyquSvRmruef+dK67up6eEMS6uJuIn7PRLK170Seo5jfLC5kpUCcUM4JRWbLkhA+HQy3Sr4R8QTYGMtkke+4tS2u+ll8VXVED3YPT1AsVX45k2eVjxyT5pThdHzRDwstHU5ff0/Imt/+4tN22ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lD99cxYv5Q2Td0PBk8Ww0dx8Gd0/NjBxgDHaVfkMI6w=;
 b=a+o+6XT4uUnVNrMOrw2xhs9PQdXB68FLyB5NEDreLJSQNmwa4p9aagMYZNKtkjmqWefSkNx6UyrEJY9+Lzlmzg3lwh14qP2Ofk+FunShJ5JWmJV4MMk1I50n3cKs0EePI29jSBoPlIbERUagtJAATVTKxfSSrchoXVrNvAuxzWpaxVs5HSrc9/4/0TeIiSAYjQC/+zpWpW5O5o3qflRhKnppzBTgGzEIozvMOBFv67Xs1wAaD8mguYAerRJU9iXaxAHix5Vx1ROWuBKZS+Fw1XgZhquF0+GLglhj9HkhHrGD6kYGN4sp6FXZWWeM113LzU5Y1mCzyC9AIoiT55T0dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB8014.namprd12.prod.outlook.com (2603:10b6:510:27c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 23:11:57 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 23:11:57 +0000
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
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH v3 00/14] nova-core: Complete GSP boot and begin RPC
 communication
Date: Thu,  6 Nov 2025 18:11:39 -0500
Message-Id: <20251106231153.2925637-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0175.namprd03.prod.outlook.com
 (2603:10b6:208:32f::14) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: 0602212f-3458-47ca-2ab2-08de1d89e1bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QxdqJ2Ycgc2ip5Ohq3QMjSpf2j1Z9kEuqsznryptvHH8afqQUBdSfQsXVvp1?=
 =?us-ascii?Q?NVkFZyg3y7cPYHNErgeo7wNTC+YcikR7EIHFwzfRnkAIR4HAzenRkrTWYY6+?=
 =?us-ascii?Q?sPz0A8DiuR5x5U5wWKeKj9qjiV6s2DFvG54Xg1cxwCHVQunMskZ4lbSPphKC?=
 =?us-ascii?Q?6r0VNoIt08jjP4VtpYq//MOIzbONxX0vFfu+NJuMmpFQuGpaswHMe6VRtp14?=
 =?us-ascii?Q?5KGz8ebFHHI3ufoN6g7gZlAvqV4UZcFiRcNDQNzjlgJAzAHNZRZTYO0CWTQp?=
 =?us-ascii?Q?cTo2o/qUf4CMqmhkhgitdCTH0MdUWTvW0W2dx8+N86jqvkVmFAtdDYY/EwKB?=
 =?us-ascii?Q?SXIKSKpPFERFCHdptTf/46DK4Y7t+V731I0UUr2LwYsoHVZfxMy9I9VTMSw+?=
 =?us-ascii?Q?1GGrrqkpOYW99zieV65ZZnngJi+lUEx58yyKROKtbgpZ4zCVswI28jgLgyFA?=
 =?us-ascii?Q?p7RvHR1FUHwrFMmwo5K7laEJk2AitiRUqnb81bxjVWH8PbwQ3L+O/Szpgey8?=
 =?us-ascii?Q?eU6WdWQ1xeC/9f7dG4O3DIvPrk1GSxaG4N/8oqdTXHINlTGQaCyuDh5cGYvM?=
 =?us-ascii?Q?v9w8jNcMX/eiGI2Yxq4xEJPzL/42qEPXtuhxQwFUOVBL1kHQSS5ud6hahrm4?=
 =?us-ascii?Q?QS86XAWRH9A57BMrO2No8/xbKtic9vddV6OgQSnkKMjP7tQeBV4xgsUIj/YH?=
 =?us-ascii?Q?tmcbZ+4jYnvlyRIR5beLVhNhvRpJGhlBVaOJqTIRGW6bVcDmXuqt/QyM+Cc0?=
 =?us-ascii?Q?Yrw7OcvbJ3lJrkFR4BJcqA8U5CIdP1l6WcavEw3ibHgTgLcCEiCoKNY2Ho1a?=
 =?us-ascii?Q?wxrRaRNxQo/jliHKd+pw1d2w4bQ/JBwMpX107qIUyP9mWPcALoWA6mijB5Zk?=
 =?us-ascii?Q?N/mJw6vRAwhAISumBYTp5RnGKFvzairvhAQ9z0chRM00d8tPKkF1akzAdPV3?=
 =?us-ascii?Q?aXuzAFU0kowfMMGjgJT+B1AIhBHnz0Yg2QhaH/WrovbvnC5znDxhqbFsZoPs?=
 =?us-ascii?Q?vrm3gnVeRKZqsmb8crREpVS7GBNnFAxg9TPX8jKw1t6gwYoR1V+SYeoc9qO1?=
 =?us-ascii?Q?AwfxEEpTdXfsyd6ThF4HgreVp16xzIX1fxBDtSFjkFoofUwOw7Jt2eQLq2ak?=
 =?us-ascii?Q?dT63qLk9W9qS1SLEAopcA5j+O1INir2P5tGfGGD2uvEYr5eiByd+XcWggCwq?=
 =?us-ascii?Q?UTisEiZdHpF3cINEs7pyrbLSzdCb5Z3YKKyRcJSf8ILMrwmko3biWyydgJKf?=
 =?us-ascii?Q?4YzRfHY3pZLogIKYye49V0P6A0GbVS/jOltxabIAGQHvoQchrX7laWmt2Vzt?=
 =?us-ascii?Q?bAWTsuTM6OvJYFJ06rxTpbKrtMO/wgnxGZ/mIZN9YCnjk7Tnl5KW0gfeIV/w?=
 =?us-ascii?Q?KsHWPHsQUkq4vGKdfeqfzC5xGKu6xacHEPo7wO9KZg4uccZ6Vbd+dnEyKgQ1?=
 =?us-ascii?Q?6TyPCAjESvaQw0cgbiUyj68LUiIP3EQ4Q/KkBm7J1LAYvVZVt5PXsw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?grh3Nko0x/A8r+AhuUPT5KOxU4PnNUXHUsWLoefOcxd66ltZphyUM/P83SBG?=
 =?us-ascii?Q?AyAfvUUJZ3Io4xuYs/FEa08vSMOuo0W+EQdm5bB1QxgO7h1N3Z2vlDt2K45u?=
 =?us-ascii?Q?7PZF5/NGqvzbrcxPBy95LKtoPQ0/lnTdEbW7PmjtfRoidel9qndMZ3pq9ekv?=
 =?us-ascii?Q?HdOFvZKGYtkTbajgU0WlPqGc/vB8zYjTE7nHTXkUcQ3hsMeFefWjlMpGGRNu?=
 =?us-ascii?Q?ABM1xWAYK1xo9b9uFqOmtBkmFsAlmvhXdAnomMLt70xGLfPGGneDQvazfi6J?=
 =?us-ascii?Q?DMoq2lx4nQBumvl/GzgdRjRV/woFo+HTVbvnluiryy20zO2fi3sHZym88gB9?=
 =?us-ascii?Q?Wf5ACxXfCH1ntdJXp7+Tx36YI1DZUv/p3XDu8lTXrKF5Jok7aWaTHCuBqGHY?=
 =?us-ascii?Q?hLL9Xt3To4ubs+RTSGeBIqQc+JM8RIHZ6kO+AsBFPgcQZLCZeYeT+uoK0GYN?=
 =?us-ascii?Q?9AAY3W57kgp3t1RmfbXtDRCCLCtmbUt78UlTo0UnVBhX9vYH8iDz7GMVSiTb?=
 =?us-ascii?Q?HnxoUo+GhXhWlKEL1Jyw/YN70it3e96mmn0Jdu0KX8xcGj1NS9ihzNfsGhiR?=
 =?us-ascii?Q?8c3q4/Jds3rOgVuU5RJ7vlKzgnRNGxh953jXyCBZ94C4LM5eadrlhH29M95o?=
 =?us-ascii?Q?Wk86QbK8m+oIfQO6hPAAzEuQOnooNb8YBUiAJX+BRIM1RNjF6TX6pFBRln7Q?=
 =?us-ascii?Q?GUMLcMchK6xRTh1S7ggNBWFlACHvrdSUH9NewirFNp12RzKBZRim5Sd3SjIv?=
 =?us-ascii?Q?ZdwkHj4NutyViDQnV0u5DOZt8rmqD+j3sodwZtOHpFFbJa821yk6bn+GrWFY?=
 =?us-ascii?Q?CzFxk5Jj1QYGK8716H2DMlgf0c4ROLHgLhbE3CTYODiwbXGag5A2etgeywve?=
 =?us-ascii?Q?241D+PsC/imKYTES+4AwxC3oZRBAxRS/Ft+JtVTY1uMN9PJDzNU918yJ3SXu?=
 =?us-ascii?Q?3R2iKBSlUvZlEoAeZkIOx0ueKjXz4WZ8KGwHcrAUhRpffd5MOPuOtWKCkT2i?=
 =?us-ascii?Q?Tt6pzXkPI4FXUNbHWNyptzdLIjc/zRUc2ZsvJYVKqOync75EWeIVUWF59nMr?=
 =?us-ascii?Q?MOlLjmJq348Xa8PldQk1BY4T2nh5rhi+tDHpad8L0fZhZFN1Zy5SMWgG7XD2?=
 =?us-ascii?Q?iPZcVlok4mG2PlvSXKRB1dgyYr0nGNDpz77n+E+lkKJjdPF4ZUwED74hBc7t?=
 =?us-ascii?Q?hpcVB4aQrMqYVl7C9IMK/KIdHFF9te5IsKWphXB3k7CRvV59rFLvoYMITDqq?=
 =?us-ascii?Q?yZDYZRE4QqqqO56ovvzFhEXNA1YTI7qdkK1VtDWHtpcMiQmn5kVQbX87FABz?=
 =?us-ascii?Q?OdvWnBsP+Uv1hqman+UwsW/YCPjECauVbiHhfDlzUHY6VmhuUo1qZIdAHAQs?=
 =?us-ascii?Q?xAGThQkHED/M8ufWFdwM4E/1myl68Wu/0mrzb8ReDbOoKLv8d02w5ggvBBI6?=
 =?us-ascii?Q?iXVb6DSJvBgS6tcMT6M+SH1HvS+e+DkRPin8sIvEgGbo7rpjzAfxZUOrJMOl?=
 =?us-ascii?Q?CHNhuvHLZVkCkXPIfiKqXitI8h8xD0BWMuq3FuGIT0Rpx5xVc2chaH7+rCcZ?=
 =?us-ascii?Q?cKLPnYaPWMiQTD+9aohWKX7+aOErsR7g3k4vKwGB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0602212f-3458-47ca-2ab2-08de1d89e1bc
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 23:11:56.9497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uk2KGHTz9lDoV+kEv7SThrABilYpw6tv5WwjfD0RJcdUrxPu7WI+e9GYKVWVXwE+hpDUUs/0vHjB/qmAixCSXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8014
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
These patches a refresh of the series adding support for final stages of the
GSP boot process where a sequencer which inteprets firmware instructions needs
to run to boot the GSP processor, followed by waiting for an INIT_DONE message
from the GSP and finally retrieving GPU information from the GSP.

The patches are based on Alex's github branch which have several prerequisites:
Repo: https://github.com/Gnurou/linux.git Branch: b4/gsp_boot

The entire tree (these patches + patches from Alex, Alistair, John) can be
found at the git repository:
git: git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
tag: nova-sequencer-init-done-v3

I also dropped several patches (mainly from John that have already been
applied).  Tested on my Ampere GA102 and I see in dmesg:
NovaCore 0000:00:07.0: GPU name: NVIDIA GeForce RTX 3090 Ti

Changes from v2 to v3:
- Added several tags.
- Fixed commit messages, style errors.
- Added GspStaticInfo patch.
- Fixed bug found by Timur in the sequencer code (related to ignoring messages).
- Removed excessive dev_dbg prints in sequencer code (John Hubbard).

Previous series:
v1: https://lore.kernel.org/all/20250829173254.2068763-1-joelagnelf@nvidia.com/
v2: https://lore.kernel.org/all/20251102235920.3784592-1-joelagnelf@nvidia.com/

Alistair Popple (2):
  gpu: nova-core: gsp: Wait for gsp initialization to complete
  gpu: nova-core: gsp: Retrieve GSP static info to gather GPU
    information

Joel Fernandes (12):
  gpu: nova-core: falcon: Move waiting until halted to a helper
  gpu: nova-core: falcon: Move start functionality into separate helper
  gpu: nova-core: falcon: Move mbox functionalities into helper
  gpu: nova-core: falcon: Move dma_reset functionality into helper
  gpu: nova-core: gsp: Add support for checking if GSP reloaded
  gpu: nova-core: Add bindings required by GSP sequencer
  gpu: nova-core: Implement the GSP sequencer
  gpu: nova-core: sequencer: Add register opcodes
  gpu: nova-core: sequencer: Add delay opcode support
  gpu: nova-core: sequencer: Implement basic core operations
  gpu: nova-core: sequencer: Implement core resume operation
  gpu: nova-core: sequencer: Refactor run() to handle unknown messages

 drivers/gpu/nova-core/falcon.rs               | 101 +++--
 drivers/gpu/nova-core/falcon/gsp.rs           |  17 +
 drivers/gpu/nova-core/gsp.rs                  |   1 +
 drivers/gpu/nova-core/gsp/boot.rs             |  35 +-
 drivers/gpu/nova-core/gsp/cmdq.rs             |   1 -
 drivers/gpu/nova-core/gsp/commands.rs         | 102 ++++-
 drivers/gpu/nova-core/gsp/fw.rs               |  47 ++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 248 +++++++++++
 drivers/gpu/nova-core/gsp/sequencer.rs        | 404 ++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs            |   1 +
 drivers/gpu/nova-core/regs.rs                 |   6 +
 drivers/gpu/nova-core/sbuffer.rs              |   1 -
 drivers/gpu/nova-core/util.rs                 |  16 +
 13 files changed, 943 insertions(+), 37 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/sequencer.rs
 create mode 100644 drivers/gpu/nova-core/util.rs


base-commit: 8adec6f12a71641402fdc77e7d514ceee019312b
-- 
2.34.1

