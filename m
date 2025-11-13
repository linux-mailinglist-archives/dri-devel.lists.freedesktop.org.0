Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE75C5547B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 02:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E515710E17F;
	Thu, 13 Nov 2025 01:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rAHTUUu5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011009.outbound.protection.outlook.com [52.101.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8558B10E13C;
 Thu, 13 Nov 2025 01:41:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmuTLOE74jUPxs/TTKzcoGsROjFHNP4c0qeqcUHLlUOmw5yIl72m0TlpuNFJ2z+FFBRYjbZVR75TDVWfRci/iCh5faLfQ0kb95WtPpBMj25VA7AbCFQy0gvzi/VpC8p25FBRLOXL2dTN/VM19UGYrVV02MTBqgH63jwykrPgvMS4mPV+pEf5liwptmgCbg4GpIjJ1qkroVthQZA+Mo9beLGUcFy9QCGO+2bAd+V9Awo/8vmhSKPjfGkvJTXKU+ewxTSd/hmPC4Re81y4/yhkyMAh+D4tuwfl8w6tzNtZr4+TgL+Gla5OtM+AJ6lNWuLaJesFsyQHUG5BRYm3nwzTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVo0ZsrGOsYJ9Xvt6rYPGeYk8/wM+In5gV3uQaKiMv0=;
 b=he5e2eFuyX12DRa+C3uvYr7OIxoGcQngJrPnsE+JelbthUDZlK9i2rY60+QvRrVUcQTVIysNDY2U1SmguDTRhyn9sinRqDdwIh9sD6uvl7Gj5L28X8FaWi8C8Jn9sBpOBhA1M6fC9fVrfDjNeI9FzYBVLPPfiyfOyVxIpecHC9YCejeSMbIY1iDaVwy/4WF+T0Qf6pqyrfDxH1PjzOgIQMBzcvWSDYT1WZUmS4oetKA9MWmfdJ+h9fVqEhuqprMDA2jNUCEoKJ3923iI2qoGXBvpLHACz+V/GMoJfhbYJte/JZsDvv7qNLGYA+XKGTLcqt4aUVsSUgf6cTUn9Wr7+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVo0ZsrGOsYJ9Xvt6rYPGeYk8/wM+In5gV3uQaKiMv0=;
 b=rAHTUUu5AHbgIKwr9Y5YbczzniB4c/2IMXrwk2qx6wzOnKfp6CeTbMLf0vXXnRqs7t2AfHHSHPKCpLeCW2ny6dajHhxBZ4dGkDCZC8J+uAAW137jJlQOETgnILtBNA4si26HF+IKS4Rl/HKwMjPeW7e219026ZGgsh88zcVOSwfhEPGSY5u9RlNUsuhHbckNzCVUidze7hHAuBTaZqmgQ+/DDZgoUPss5J9Ra1OarOZae6mQwMwdX9MuI8k4NJYdHuzLL3bATwb9PVmEVjTw5Y9rtUy2F2J8zwFOoS4kyNwtUwI2Piix9y5YNlxAeyNJcNmhfl7NCW96CNOmQCsdyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by MN0PR12MB5908.namprd12.prod.outlook.com (2603:10b6:208:37c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 01:41:22 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 01:41:22 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v4 00/13] nova-core: Complete GSP boot and begin RPC
 communication
Date: Wed, 12 Nov 2025 20:41:06 -0500
Message-Id: <20251113014119.1286886-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:52c::30) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|MN0PR12MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b1b03b-9d50-4adf-062b-08de2255c017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nq6ksiiUz2udf8jBtoOqGuFlmtnBSrq27KO80yfOaOuES8iVhFqwy84CrPji?=
 =?us-ascii?Q?eg9PqZ5BPpi62iCf5o9+XaJGx1FPpJuzsuJ266nSBJ5GjrpG3mBfjviuNrJF?=
 =?us-ascii?Q?O34/pfXY8gCcvJn3Xy3Hnr5f/5x1TL/JADJXZ7/fiTVBF7kiRPTK7aqJjWGs?=
 =?us-ascii?Q?rmz88tx3rZnhwWCp5ur+YnQTFvksVS+r3x90kwez10sVEkbhM0xP3i/teQcn?=
 =?us-ascii?Q?FtBysTKPTjEtZzX3uyFsAq3iY5TFF9jKztW3Qgmn0YuCCtFIJ04CKys9s50B?=
 =?us-ascii?Q?PXiO5ZNaax9Wvf8BLR8sUOcm7BNJPxMUkt79SsSKnUVnQRqNBqwOoYYNfy7W?=
 =?us-ascii?Q?/T14PD/YmgPzB+Ty3d458KMD/Ggll1f88FAICvhw0lW+EVD4AJrh//WZt0Ce?=
 =?us-ascii?Q?ZFk5yf/c160nr4ZlqT40Y9w2nLFvdCxBc+vuxmX6GYzJEEr8a2L1hsWwGu7c?=
 =?us-ascii?Q?VXaC3lvmTiewgArEfB+lOHd6+SkfcL7B16q+UleRD2GT9gStuuTE4VQuvQ9G?=
 =?us-ascii?Q?PMXfXJpv45cIya7BEdWFS8KO7xgCeOnXZlpFx735dVxEam8O4h54dAfkxlO5?=
 =?us-ascii?Q?VpPwWbd/r2WqT/duhOe6oolHuG6im9ljBp2qPOVKAtf/NlTFZBr8NzI5dR4H?=
 =?us-ascii?Q?kEszdftvXmKfRXB+2vUt38w7yHOzqK8Bna7ceiHMkiu2lF3zf6kB7KsdOQRb?=
 =?us-ascii?Q?DphJrI7gdoXwbqzcVNPg4193O7SpgiyuQFQYaXkU1Kw/QXHfqCDnZATDUwsi?=
 =?us-ascii?Q?J73mBKXfCOEHCSDEXvUNtytFtgzBiO2JS+Q7w/RxLngDjg3XXCWZfvE6JXT4?=
 =?us-ascii?Q?FEYhS1SyWH/m63yrupwfqxO9FAEDHU9yP4e70F3+vZuJFSe3wlltTBt5bofY?=
 =?us-ascii?Q?ooSZQqSINnYO4NTrr4EwEFvf/xif19bbsaeQ9k1067O3gm6EsaQKnc1+Nps4?=
 =?us-ascii?Q?ImtR6+moqSGCPcC63TTujAMhVYEv8BGZa3NPD1vY0zFpSnYTXLeoIoCJSyyF?=
 =?us-ascii?Q?Br87ytfQkdTBvoGGTEtlXHiP0p2R/E5ONVzsxaAdx1ugmKT4mV1M58c0HDbW?=
 =?us-ascii?Q?yyc/OKmfyqXdwdP6+7ofRDB3h17hRcSTemsLTNLnUdhzn0DtPzvX3PJW9+b1?=
 =?us-ascii?Q?67/4bGVV8X1NwkkNU01G9FJGrE4wCEQbTXACLSWS/W5Ewx+Y27GWitawW7P2?=
 =?us-ascii?Q?hW4NwY0RI0dHrJKEHKaQdpsBN7B8bnrWM+Zq4a5dwwVVwWUeWXmSdwOG3Tx7?=
 =?us-ascii?Q?giCJ5TcoXuOMexpgmfmcjDG3DH1GZqdDd6wIbJqsTi9KNhVZg2iECZskd+qx?=
 =?us-ascii?Q?iZTg1UnoSEwFX0YBqp1IR/xbVwvnN7S1RinAZo2xjCO0zWBb1Vrv73g1MdJE?=
 =?us-ascii?Q?/pkwZ21krtVHu/c1sKTmp9TxGwQJ0qT1JU6LT94Vuzq22/GnqrGKgUAPeViH?=
 =?us-ascii?Q?4eFvxcGOSIHs3hs675gNZxbqMAIBpjbAxkY6ZK/CNlZbD9ZmUk0ppQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wsEjYkEVH89prTNeApfNwx3XB9Di34NZc+Jp+hoUG639GcpRvJs8x88kRMj9?=
 =?us-ascii?Q?w+CSityfxgYrtp9EKrQ+tqEPAsT6uQe9GS8cdEgfQnQglq0H+c6a1U7hFlVa?=
 =?us-ascii?Q?yoiCSEi0LFEzhY6y/98kucUFGYsdrELmMbs1WVZ2SL1Eqoer3eJT1a7npHpl?=
 =?us-ascii?Q?I4sxkCe0DDdAm2Aq1oz5sBaO+c7ikYBX2bAOHS5q6B/idlIeebebWYtHoc5+?=
 =?us-ascii?Q?WwaLwRGHF6RH0Xl/+jxud+jG1ohgqNE8gBTjWEhqaLpBFwK4Pyc5+Hb1SFI0?=
 =?us-ascii?Q?TzknvSdpnlzjEqLIISgRmjaTLqTj4gE5iBY42bIIRW6kPIwDfUSdnuOoRc/u?=
 =?us-ascii?Q?kziGVCBm4Qqk+oGO7OqVV/Nhe9rol1BAA5C/dMMto8/DBawxx4HOMY4ygAsN?=
 =?us-ascii?Q?F5sxXdvWvwazGGXFcC/Vv1V69nmQUUrswPcvMa0InTYlI3TbWIDzwME1gp4r?=
 =?us-ascii?Q?W1GZPaYYoYBSWre/5izbtPN4jZ09AdS0HebekvqMr4NQdm6UqPx1orTniSUZ?=
 =?us-ascii?Q?sKoK2Xl+IrEl5jsZqiwqgNihyIwPz8yiq/x+J5wnRQae3sf61ckvEhvaMbsx?=
 =?us-ascii?Q?Qahx//K9xDMklioX4ljXyfg7qaHZ0xK1hCqz2VDgyphaI+PI80DlnLStl4tT?=
 =?us-ascii?Q?G2NdgKJZ1Xm/KhmyIG7fL0luLSAB9UO09zRwY68YVD2MivG18sFxvTMCcabk?=
 =?us-ascii?Q?ORGh08lF4vp9zwYFWkz26WIumF7U/YyOdbOR4MLav/tRqFpQPijRmSl07cg6?=
 =?us-ascii?Q?046KdtKG8517TuV6VKhXevKmbiZ812CWjQA54v3EphSA2imzLOp+COK75EjC?=
 =?us-ascii?Q?bcQqFH5v3XZUiskNZlR8ZPFx1WsAlTz916uuIYJcrwdklVx406NEqvNA5AFl?=
 =?us-ascii?Q?Atat5b7xBIENSUtfUYSATU45vV06z3gRQy0ApzJp5RVUF6amzhrKH4V5ixDT?=
 =?us-ascii?Q?99+rW+/KaqAwmskDi/NkZdT5Yvjue3UBMo42BSZ6dLMrn13hlZcALSbRGeHm?=
 =?us-ascii?Q?xG5GSGohgsiR322MXgU9rKksR4ub1yksGTGZQq5CCUuvBgIDmJLC2h6ByTKj?=
 =?us-ascii?Q?abmfEB2f2mF6ojcVIjIfpsEP75wSGXi8hw1isN94dKIjHrqc+JueXdNhkGGo?=
 =?us-ascii?Q?dhW8mcmmDv6Gx5lRXCumj1K/Qv1A9SXf1OENYlc/nZ3dInAu17pebR4Nnxdp?=
 =?us-ascii?Q?XUnIsySE06snvGEPY+Z5Yl6yclXZZCZbFIVLacZt0NxX7PJ0/PlJGl8bDw/E?=
 =?us-ascii?Q?Pxkqa5yJ69fJBWeRPT4pA0d1Z3ipBRTR+T8GchDieGde6mXrwbXO6UDu4a5a?=
 =?us-ascii?Q?FQ5lU+6ZUN++Dis2SqVkBDFniKDHKBzavIy/gFZMB8vNcBqx2HRiLREpLFYK?=
 =?us-ascii?Q?5d1dcIGITkL62YACKOnb2IrUyN8TyOwysKRGYlm67iFkqk3G1Mw/Oy3ieD0h?=
 =?us-ascii?Q?qMEB9JRJ9Hzva52G/PL0wtguQhMJ8uEZzbC/2lRE0m2zY0HJUFrdiNQvDYQW?=
 =?us-ascii?Q?1vWOile9OqqmA9LWCLq//TrRolPjPd9hiF9W/C/qQ3zJBUQE1LsQ/FNYski1?=
 =?us-ascii?Q?2twx737lTD80rarb+dmrZ71C65L68GlQjKJykhYn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b1b03b-9d50-4adf-062b-08de2255c017
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 01:41:22.4442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avmJDeaboD7ib2acVKuz0HP0+NOPhnOmYnHtRfcEwwgr3mZRpcbe4ag1yaeOpmh7BkAatK+ZVB7WK6oY1UO3UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5908
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

Changes from v3 to v4:
- Several changes to adapt to Alexandre Courbot's GSP boot v9 series which
  had changes to the RPC command queue.
- Several changes based on feedback from Alexandre Courbot, Lyude Paul.

These patches a refresh of the series adding support for final stages of the
GSP boot process where a sequencer which inteprets firmware instructions needs
to run to boot the GSP processor, followed by waiting for an INIT_DONE message
from the GSP and finally retrieving GPU information from the GSP.

The patches are based on Alex's github branch which have several prerequisites:
Repo: https://github.com/Gnurou/linux.git Branch: b4/gsp_boot

The entire tree (these patches + patches from Alex, Alistair, John) can be
found at the git repository:
git: git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
tag: nova-sequencer-init-done-v4

Tested on my Ampere GA102 and I see in dmesg:
NovaCore 0000:00:07.0: GPU name: NVIDIA GeForce RTX 3090 Ti

Changes from v2 to v3:
- Added several tags.
- Fixed commit messages, style errors.
- Added GspStaticInfo patch.
- Fixed bug found by Timur in the sequencer code (related to ignoring messages).
- Removed excessive dev_dbg prints in sequencer code (John Hubbard).

Previous series:
v3: https://lore.kernel.org/all/20251106231153.2925637-1-joelagnelf@nvidia.com/
v2: https://lore.kernel.org/all/20251102235920.3784592-1-joelagnelf@nvidia.com/
v1: https://lore.kernel.org/all/20250829173254.2068763-1-joelagnelf@nvidia.com/

Alistair Popple (2):
  gpu: nova-core: gsp: Wait for gsp initialization to complete
  gpu: nova-core: gsp: Retrieve GSP static info to gather GPU
    information

Joel Fernandes (11):
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

 drivers/gpu/nova-core/falcon.rs               | 101 +++--
 drivers/gpu/nova-core/falcon/gsp.rs           |  17 +
 drivers/gpu/nova-core/gsp.rs                  |   1 +
 drivers/gpu/nova-core/gsp/boot.rs             |  24 +
 drivers/gpu/nova-core/gsp/cmdq.rs             |   1 -
 drivers/gpu/nova-core/gsp/commands.rs         | 115 ++++-
 drivers/gpu/nova-core/gsp/fw.rs               | 326 +++++++++++++-
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 248 ++++++++++
 drivers/gpu/nova-core/gsp/sequencer.rs        | 425 ++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs            |   1 +
 drivers/gpu/nova-core/regs.rs                 |   6 +
 drivers/gpu/nova-core/sbuffer.rs              |   1 -
 drivers/gpu/nova-core/util.rs                 |  16 +
 13 files changed, 1245 insertions(+), 37 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/sequencer.rs
 create mode 100644 drivers/gpu/nova-core/util.rs

-- 
2.34.1

