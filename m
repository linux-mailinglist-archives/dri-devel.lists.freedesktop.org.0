Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EECC29AA2
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 00:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFD110E139;
	Sun,  2 Nov 2025 23:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Sb3+JGxC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010061.outbound.protection.outlook.com
 [52.101.193.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568CD10E04E;
 Sun,  2 Nov 2025 23:59:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAI24UOzYPR/d0BRHk39O0eBrkNrySsYvWd11UzL/a0vO9ez0zc5i5aUIx5v/b5JIul+N3GYdLgfEuakry8oKmiIjyqw70Nxs8VLHv+1q20KVN2SCTic/Wg0ocd40oKWPCEGVVd55mEKboELyaduxoKRI/LMoxGFFtkGPOEq5ojinNsCdixy8aeQDb5B2oOAmuhoyxxZ4TX3Q3lNT3nFzdbtSvJwJUIxJOgR2buNgqm/w4cLkMT2GVmMIfv8wR8KE/0U06l2SFbgQm8D0dG0u1wbGQsL6+Re7FC9i6842dLobikW26Yb2HZXq/PYI2sLiGLA6lv5jf+EK4lev2JQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lc41N64uPXk2q4dcAJ2bPrJW1WD8DpP0hwoqAIyJKko=;
 b=H89fDZlcN6UAOIB6ZATpDXXBR1QGtgiN6c0mDmv29l+ZSooSonPEd7gEdnFUFgaUfu3HOxthxRTdIMSPNcvwOThh4IfnqnyA+5ELsADJ6Ydep/3cr+BC28BzLMUYA/DSDm9Cx6RPSQvviaZqJywtSY4SLL12+V/ZDpBJuaHcXhn2qB9yFz0r+4YZy++62bZI/nyT7xxsKjOXHnoQ6uX1jIL8+PsZwsBUxPQgWg6uFxBcpuuyzXdIFzAAq2/uIKm9uAWhbK+2wkpk7iWL7Jo+PLguilRyPsFXFZ8nVaBLFXEqaZQWGuknJ370nsCpIs10VIiEtdqG7FdnLLkmgEzUcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc41N64uPXk2q4dcAJ2bPrJW1WD8DpP0hwoqAIyJKko=;
 b=Sb3+JGxCAmKtujvw9GzQB9f7aFCwL48PAfyoMUuBUP7ss9ZglY6emxRwKROUIabmiH8rpyrTSMPHjUgkAt5B3YyZEC95cKI8A/cDLKmS6LAjt8HLwV2/jXIow/X9t7dOjtd9NaLF4lxRZoAtPGTzs9H/FZgieb6EOZWLhCYNs3ax0Z37KXEISfTv1MeiOW0vIlSh0rSPrHNAZXfatRWh73P8hUDrkyrGSNCDFJO6q0sojDdUj0iOVW9BrP3/QFmoxolyCQs8yRMKeYQkKysBVtJrraz/ubYgD3j2BXTPQjgkD9paJEmSmqjXa5q2Lrz/db65xNhJc3fANLsOfK8plg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 23:59:28 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 23:59:28 +0000
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
 nouveau@lists.freedesktop.org
Subject: [PATCH v2 00/12] nova-core: Complete GSP boot and begin RPC
 communication
Date: Sun,  2 Nov 2025 18:59:08 -0500
Message-Id: <20251102235920.3784592-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:208:160::15) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: 31aaf701-98c2-441e-44dd-08de1a6bdbb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l1FDhbrJrq7oOSXmBsmgquFOJ6WAAtvzFMn6452iOs/dxiDlisTjUng8giPB?=
 =?us-ascii?Q?Kf9s64qSGVL94K1gtaa4Kwcma1+mBCeO3DCfHSRi4KupS/D+BKLUe277JJJN?=
 =?us-ascii?Q?+Pfsn9HD+UT8rAAPkJUSRjBDlB4BR6PpYJ3hkHkiero6hRVAhNldXUrXv5bw?=
 =?us-ascii?Q?cVksly5T9bVwQa1EqB/ItqyXSKKub/OblSsM4KxTNP/4oJe6unIq9x+rq7+D?=
 =?us-ascii?Q?eTsBL/Lrkusq4aTDQnblo9FcJfFiIzwVJSay8Bs2hSbmqMuaRr5QmVXiKy7e?=
 =?us-ascii?Q?cmsi43U5aT17ldhNjujozBOj5r7LcQSn8Zn9b1M9L9n94GAAAvnb7tr3l1dt?=
 =?us-ascii?Q?INZqUcnD0g0abaBmzpLaXqqQk1v57BIMcEDlSmKiKMbNmqWX2PS5KLu96ne+?=
 =?us-ascii?Q?rimgF42yNO/DUYeuuOZwa/liVC/fcgT5NsPrh7glhaHhMQN1zYKnpezVjnHL?=
 =?us-ascii?Q?AlBhEySHfJ0y7bCvbcjkElvb/FqJNvPV/+i2yThZyN/rStuHGioUZIyu6Grf?=
 =?us-ascii?Q?Sl2z4shDCeQi2qOtmoSPwgq5mXgCW8h4gPlPv+Ee4YuAQs929HeOB5hVHZ2/?=
 =?us-ascii?Q?Ysl7jLaEhHnwUP4t3wgoMIwDxLaf9qH5Y0pfr+zVGOtFAvXFFSfMNAFPhO5u?=
 =?us-ascii?Q?tNH7vna+/w6zxWYFzCIj2PZw1PP2/WTvyQA4Pav70bCS3GSBNDqd7ZnisXK0?=
 =?us-ascii?Q?thVFr74pDk08PbqVE2l543vb+qB+DfmjNkeBOFmL4Bkqf3ttF50s0N1FqYYE?=
 =?us-ascii?Q?yiPb0bDAzCoYXFXMmWZ/IKXnbxEdPfG6ifHaqaIFutyCE20/ShbzVYRsSo3j?=
 =?us-ascii?Q?u208vL6Jq7emDl4O7uH35ALAvXhxHwqzdRf6bZ7ITIN1ExmIw7EaiwiRNUHA?=
 =?us-ascii?Q?SzSg3bOUafR0r8i6/BBsanX9HZOMAr5vKAqeKhMjQyyN3zx1Jexp9dyQBST9?=
 =?us-ascii?Q?cZ1UlV9lKGhIH/ZPDZ7F/tvoBXaUlReh7aF/sPZpcCDDMJ/MosybKyTePPLo?=
 =?us-ascii?Q?RxcL8H7bteDkucKp6I7tK+p3QzwMMfsiAhWJQ4GnfgEV2pF/zHwoRTM7Kpk3?=
 =?us-ascii?Q?DAo/1lH2G8IEe6xQYGo5lAta1l9R+BDwkztAQiNvIlovicO5hIGm8YiSZeEY?=
 =?us-ascii?Q?oMVSED7ipwYlAJPhc7YDPnNs1TwEzNB1KSxLckQTL9pmnsoToleoBeFXeEX0?=
 =?us-ascii?Q?0Uymavp9FNvk440jfH0Ap/PBWdcUgYdpn2jxWR5QFd4x1tTXjChe2Ge1rAql?=
 =?us-ascii?Q?cKKUdD/sL02JmBfQoyVnHzK4GlhCuuT0WTMPE2JHFVglyUrCj54dKZVDv03B?=
 =?us-ascii?Q?FcdxAQ8v6UvJXHd8PtWNKsgr6uh7ZwytVwgs4FZ2QU5rGqScKr9YrW3Z0wPR?=
 =?us-ascii?Q?8TBFWIB/t94oB/dkKEhAgqHpANKO2kabDhFZPjt79TprHFoeTa6ynO84AUIN?=
 =?us-ascii?Q?bQhcfjzXu6Lov+b16rwRfUVufiRSHOTmB4Im4B8WAc/TG9H/7O9q/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1VWrhtuNpWw7Wfr/gKUU4aS+Jir3Pu/kdP+4TfyNgjb9jSoVxMv5SkrI71im?=
 =?us-ascii?Q?O3InZ+0O4RC10twQVe0PxdShQxFvBnsV+SAROui8YwJe1tgGd4f0bbZitGh3?=
 =?us-ascii?Q?PDq0KPxp9Q2eVcEp6rUd5iWgkkmhx70dyNZhEXa/6E9h7fnDl5iTUEIIlQRJ?=
 =?us-ascii?Q?yKcqrtssdueYgVbIWEwhUloRN0fXUEwXE5F7tGUyUZH5drcXRJ/dufXcCRWR?=
 =?us-ascii?Q?yzFWHnI3vxW5Qtk3BlpG9pm2NdQHHm+8lmdoPrsTlr31inieggfYLTPGklt9?=
 =?us-ascii?Q?sxDcK0HmfhbaCNoBLkEIPMhCCOy7WpRypD5pQ8Cv1BgIOb7rPBsyNmkGzdZq?=
 =?us-ascii?Q?E9/pjaFrQ925WA7ziE0/26SN8IE+yDXGEmUZNx1QnfOOaj85yGw8ucDl1V7X?=
 =?us-ascii?Q?4Vtgw9FayBq9q9KRDWIwdCkf4jVxH5LiZXjsfpPvjIuS3cgUYECVPpKIrhQg?=
 =?us-ascii?Q?S3tLF0LqE2AVqPGlHmwu6LOzil/pcjOUUSbLA49z4yJuWO7RqaaN0nRBxYbN?=
 =?us-ascii?Q?x3Ncasca6xQwqZkGqj/A94hNbcB7dh1HNPdbN1lq5LcniWpkZnXPQALXizA0?=
 =?us-ascii?Q?/dTFhucclLuM1AP9CbhGn8Y8hD++kok1gQZOExdpPhGmsIG6QSTf9A1xH9Pg?=
 =?us-ascii?Q?jNsJ00YyP8T/RuvJA4jQBI+9Vt28uu7v664UiYEfgLwjLLSL15PkLl9ckF5D?=
 =?us-ascii?Q?1Cm9MU5wAhAKWdM26BUNhN3U3zicbut0I5rTWC4cRy85uiRezdDXFCQPGNrV?=
 =?us-ascii?Q?iu6nt6e8/mkiwNdb29FSr7PLh9igr+ux9CBf1eNT0fpHJU8nsLwghAQFgYqP?=
 =?us-ascii?Q?BiMG0HrpL/OwIF/uOJFsm0N4Kbjo8nb8CWtnrdC1d7o3ON+qnWbzhFSwXbPp?=
 =?us-ascii?Q?LT731BltdIluQRpCiuOnTV9RmqcibaRDcregO8UcgwFUNbkVuCirGTV3o4af?=
 =?us-ascii?Q?vbyV5Y1fBoq7cEZ0s9JOgumn+B5zomU7eyVAcptimX+Ht1lho6Z8ATNsEAQL?=
 =?us-ascii?Q?uFowsNUBrWMNPKgP0JdnuCuxz5HWiMLAXVHFGP2j//WSy8EEiE2/8ZOjaOVI?=
 =?us-ascii?Q?E74GQy/WmSrH2K8J/wf/ZMjf/s3WfVAfeBxqKN41II5JULKEkHrsH/gKhdJH?=
 =?us-ascii?Q?r8oAja+XrMOglgyeQT5+aT3lXkGM56/SJLNx/Ejzf98A9ZN6cBr9LjwRxwSo?=
 =?us-ascii?Q?XkNiYmEB5Bt5+2PQjImu9fr12XmDqpXHyu81gLZ5mIz6cddjN6hakQGN2f/B?=
 =?us-ascii?Q?apk1BTB5EPEd7zAOgkdtkykpvF/pXWO8g/MAhZhAJd9qDwnKJUdIeCPCPVUe?=
 =?us-ascii?Q?swRt8fXy8WoMlBdWywswvVRLKDgYx5VTFwZgUSz/JJKNvyZKfLzP1qAX/s4V?=
 =?us-ascii?Q?1zrS1mXfhTGqNmIkXbZNWoYAjUA1sKZgc8DWmpqVSC2aNhwE5NUOW0dklCpr?=
 =?us-ascii?Q?FyATh/zAjoWD6d1aoLgpjoV2puPJ4mVaaZV/bvgETCREq/Ld9krOJr52NzI5?=
 =?us-ascii?Q?p2KLQzjFSiOLiuah96bUo6ESofqOBN00ZjnAAeBdjCDTeiuXWRrpetCY2lJ1?=
 =?us-ascii?Q?h4Yky9uN6J/9SaG9Os+xj6cb7iye4iCSyEu8BlkL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31aaf701-98c2-441e-44dd-08de1a6bdbb3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 23:59:28.4931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XLmpvRHVxc2gcmLLXKe+6cqF83oAMF6bPwKVRrZVi98YEMQwTdFiVMRr/4FQAx6DAAUlmnbXoghlZU6UlQGF/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9163
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
from the GSP.

The patches are based on Alex's github branch which have several prerequisites:
Repo: https://github.com/Gnurou/linux.git Branch: b4/gsp_boot

I also dropped several patches (mainly from John that have already been
applied).  Tested on Ampere GA102. We also need the "gpu: nova-core: Add
get_gsp_info() command" patch which I dropped since it needs to be reworked,
and it is not needed for GSP boot on Ampere (but John mentioned it is needed
for Blackwell so we could include it in the Blackwell series or I can try to
include it in this series if I'm respinning).

Previous series:
[1] https://lore.kernel.org/all/20250829173254.2068763-1-joelagnelf@nvidia.com/

Alistair Popple (1):
  gpu: nova-core: gsp: Wait for gsp initialisation to complete

Joel Fernandes (11):
  nova-core: falcon: Move waiting until halted to a helper
  nova-core: falcon: Move start functionality into separate helper
  nova-core: falcon: Move mbox functionalities into helper
  nova-core: falcon: Move dma_reset functionality into helper
  nova-core: gsp: Add support for checking if GSP reloaded
  nova-core: Add bindings required by GSP sequencer
  nova-core: Implement the GSP sequencer
  nova-core: sequencer: Add register opcodes
  nova-core: sequencer: Add delay opcode support
  nova-core: sequencer: Implement basic core operations
  nova-core: sequencer: Implement core resume operation

 drivers/gpu/nova-core/falcon.rs               | 101 +++--
 drivers/gpu/nova-core/falcon/gsp.rs           |  17 +
 drivers/gpu/nova-core/gsp.rs                  |   1 +
 drivers/gpu/nova-core/gsp/boot.rs             |  27 +-
 drivers/gpu/nova-core/gsp/cmdq.rs             |   1 -
 drivers/gpu/nova-core/gsp/commands.rs         |  39 +-
 drivers/gpu/nova-core/gsp/fw.rs               |  44 ++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  85 ++++
 drivers/gpu/nova-core/gsp/sequencer.rs        | 413 ++++++++++++++++++
 drivers/gpu/nova-core/regs.rs                 |   6 +
 drivers/gpu/nova-core/sbuffer.rs              |   1 -
 11 files changed, 698 insertions(+), 37 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/sequencer.rs

-- 
2.34.1

