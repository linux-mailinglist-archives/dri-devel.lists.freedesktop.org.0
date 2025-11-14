Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE38C5F1E4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 20:56:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E35C10EAF2;
	Fri, 14 Nov 2025 19:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lLITvGk/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013011.outbound.protection.outlook.com
 [40.93.201.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B96B10EAF0;
 Fri, 14 Nov 2025 19:56:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOcQSZwU2vpREvgRvmPz0vf7UWWNJ2SiFMWaOTIaUolDewjKskoDXfcJeYtU1SY/lpp8J4VQgF1+xRoOVSaEliWqsPIA7aUop/50Aw8x9izYFFDfFQJ1Cl+nnXpXRjmmCOyM3pvt+e81UgHLe9mfb4mLCvCpWeGPMQ3Bb28ZwvJ38XaX45Vagldg/nkxEK1O/v//0L3ojsLWpDO2ZjznoSydTTA4gfOuryhtQM917GAOHKR5+1s0NcweiTk61lkgmA8ihHPJdkCTfwI3vdnHgtp8cIiv+a3AH9xfu4WLKFMQuyUvcn0tQ0sEq24IrIaRGZiRsFJaIqkdlFkIZoNdtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9Sm4f05w4dXFe1sVDxeq2+xSJfAl6LpI14i0xO6U1M=;
 b=jrwpXa3+cSQIOgwiY1R7ectXys3D5PoacZp4NWzwoo4bUatKvwoQ3ObCoK7n8nIDeqscNhDPYD0PoJj18RSXTZgOa+VK/uaCwg5jKv6sGyaHrQ6VA6O8b6NxBLwoQkagH6Hs5q8PYnWEPY/+LULnrW/nAPb3CfyRE9Le5CwqGMXXgz3pLZJ49y+b0pKcE11TbBOGysLHIy1SKcYiOVlPaAPFUz0rjChtt9+KYe3zeAww8TiyLkmq4SniGzBmWcQGv55oWf7HNSL5pxn8u9g0DaOt7irpK3//F97FYegRhuf5aXxSfkeOyQCbSnta9m8lHU34BGHODc+xwHwOY1fmWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9Sm4f05w4dXFe1sVDxeq2+xSJfAl6LpI14i0xO6U1M=;
 b=lLITvGk/8AQzXORO0Xeenhd9e6NdLCnBNmAqmmJthxztc/JsXLj1XM4G1ay5QERBYitP2jV0jJ4e0OAsupqYJFSq6b/ykjz8g5NdsxEcOZuIjk86ri/lAdSjJxqJwoNpLxT2QD9TmNp132NmJNQGSN67Fw3Cp9cffNbWeIc9flZQ8waOQBV5f0n6zMTYHDHHGL9wXNsYW6cECIQQDDq8qFlNKbmhxajQnPONCdL2l0jLTWWJGs0ON9rRCbYNnsBY3YE+C6KJcx52cFB2nUCrMk8UG2NAumaMca0rbLo4qojegR4RLFCbwfi7Gq81IOkgqsGkpYT1pOn3CkM6x7bJlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB7742.namprd12.prod.outlook.com (2603:10b6:8:102::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 19:55:57 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:55:57 +0000
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
Subject: [PATCH v5 00/13] nova-core: Complete GSP boot and begin RPC
 communication
Date: Fri, 14 Nov 2025 14:55:39 -0500
Message-Id: <20251114195552.739371-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:208:32a::24) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: b4b43c33-b3d3-4385-1b10-08de23b7d3dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TF5QLSweGebPB0fy1+1btzxYDf5SGr4AKjqtZqi5T9NvbgnZ+YbBcukxgL+R?=
 =?us-ascii?Q?st0NLhQXRXzE8FKcDGwOWy7J3EQtrsG5sY4lfD1lQQjRhYfs5/j93rWxQ9B2?=
 =?us-ascii?Q?jqDKp8P92M+RCkkqDwo4oIDWuzwzAkXlf9xhjr8lXInIg9N92xCiI2GRaRT3?=
 =?us-ascii?Q?lSkNVnf/jmqPsIBDMOPxY3T5EGuNWLxAuc1HHs2TUjNfc/fELQbZbj8G2Gg7?=
 =?us-ascii?Q?LY+aG9dTMP8vIgBLnRH1jhUAc4niUGKdsMquLZ5Asq14XZAPFxs9Lg3YGFr5?=
 =?us-ascii?Q?QgGOUwWL6asotp2AMeDBEu2FLr1jeyJFGfwup2mf+B86047UEonCgFk2L52U?=
 =?us-ascii?Q?76kaSHEZS33Gcik9mQ0DT9I39bN7Qv8mU/02hfhRw+4nN9ESNQeDecUEgYRg?=
 =?us-ascii?Q?FonJS47GcPxHX/Z7poLljB03iPg8mLACLupGSki3RFfVrEU/z/lLTgI9uL1W?=
 =?us-ascii?Q?esGlSB4r5Xe9q3ZHXeddQWB42lyAAVCx4QoBqfVPyOVMeCMF3Fb7Jx0WFdqB?=
 =?us-ascii?Q?NbbQsSC56Jl2LSMmRNWgkj2SH3yjRehWZYck02E5PTKIaZeqPjqjWfeiqTrC?=
 =?us-ascii?Q?PA6hCgBA6MkLWpz4SL/hRCu2lR+63U3LyFA5aq00q9js7U7dQkqJwdRU1jYf?=
 =?us-ascii?Q?0hkynKYtWQPw55Mcqx0snKHdsKhrSUdZX5GXFMZmynyIjja1P1rVGOhwrsIH?=
 =?us-ascii?Q?OSxN1Z+drnsbXrgd8Y2CmgMeFD474LMjBMkE5X9kdhuzmqAVX/3pWRUPktBd?=
 =?us-ascii?Q?/hSprKOeF9+C6CiquKTMFphvFtpBJ0mhYymB6jbvAspCOPl06Nq0pg1XzUwn?=
 =?us-ascii?Q?uXOPDv5KMrF21EHGTfzG23uh/sZW+ICcFCUoOfQgksuWg+L++0MJ/dRYPgFa?=
 =?us-ascii?Q?rAmbuLMdszqgi2cdsMIG1rm4kTlhgnjTfMGj5cfB0eitmxf8Jrj7Bl1WOqnt?=
 =?us-ascii?Q?lXj8taTmfe/q2qwdLOtvJ0lCnoldB8bY8CWinjSsZTChWh7Jjcmfl93NhzO+?=
 =?us-ascii?Q?2Yw5101mqjnxAkaGr+CdG+ixmHE64P0XWB8jU165UdqtwXeHOQZRpXKCg+wf?=
 =?us-ascii?Q?sUzH8EU7hDGCfEdQBo9fFRikDTD8ZGAWdjxs9VzGU9Zn5vfM2Y8arkXbnA0H?=
 =?us-ascii?Q?2AhgYMDFoMD1+6rcSR24desSoAls4NsDZXlv8bhXfKqU09LZNZPb4yHLaQJU?=
 =?us-ascii?Q?/p6svP1EowZ08hlrH7aS7bzBHxSDuL6ivs+uzrCw7INpLRjUAa7qm1qhag7k?=
 =?us-ascii?Q?cQ7v0gb3v+SIJz6Mr0ox7bpHbjUlwSJLzEXpa6hHq+k06ZO0JQn/Me4p8S+s?=
 =?us-ascii?Q?WprMSWqlf927WJjs8h0tEe0JSxWq+pcyUsw0txCs/W6xtUWBPHYsRqd7SyE7?=
 =?us-ascii?Q?4yFIyK6Ck7TDH/DmPBFLVjVCP2tqjznSuYrp31TYWRm5VvcPFsDz9ypQJcOV?=
 =?us-ascii?Q?KGQMeApCHj6zvSAFUmmiXOsjbdOi3SnqW2kzNryssNPdT9roOJ+Dmg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bm0N68NWkWi3EQXz609wxMV9XFEslirimIy2rlfnXQu8PftvcqmormlwSZKj?=
 =?us-ascii?Q?iZp7hB0Ww1iV/kktnMKyAo35fN0E0LsBXUkDUCxNDhdFTNEEvBpcKDVdLxRV?=
 =?us-ascii?Q?7mRl2acRXDQ6g5+ahRf901pmXzdWw6XQ4j15f5zCukmlRWZTBr/v1HvYrPGo?=
 =?us-ascii?Q?2VeRIoFnJKUWsdwiWR4D3+2iPgRhW16B396d+5Y3j1P5CjgcnxbIeucAEy8T?=
 =?us-ascii?Q?0dz2Qw0TsaGZhe7DldehIZnqFoxACLJJhoGbhkbeSw+41KXnYMQIRhrVTtLE?=
 =?us-ascii?Q?rzt1WqGSjfV9jnnEkqsRRGDEI4Hi3OPAlbpg5fr4INqmU6acSaYkeak+3J9I?=
 =?us-ascii?Q?WptwQ3y+bv24K9paT/z3hkd+6xYDndjgKUTdrM04Npqg8ILsvsQoOVl0fBjf?=
 =?us-ascii?Q?L1KJKlW7Nkd8ht4zUXE3EWcLbmVkii+tcDpY2v88oq8IwRUmFCFhr4dMEHl7?=
 =?us-ascii?Q?xOHocAYatW/pEasMWaZxTDlsU2K8UwBJl2gaXycjcJ9ijywhFMaMboDHKCx/?=
 =?us-ascii?Q?1gWSwYQTLfI8Ll+Fax+QxO5C0cu12h3a9neY4rIlbGVyy8qiTlosinWTfSV8?=
 =?us-ascii?Q?BVWeCbHRbslClyWL+B41K/qoe16eQF7v7Tw+QBn6hYJb8/1E5EXr/jQ8xMXA?=
 =?us-ascii?Q?6rA4qyVlpUq2KxxjWNs75ZQdEBbtOeFtYfj882CWpz2728DflnAF6+Ai9U1k?=
 =?us-ascii?Q?UQc7K38RCDG6gFNkd3Rl2GtwmSHE9sck3uZtPhQAWNIPOyD2rwtzLPXjgJdT?=
 =?us-ascii?Q?Qaug8HjHmNjOJEOXFeTxeJviyfHeUi/qiUqm2VmH/re5wsE1osXPnnUtt/Oz?=
 =?us-ascii?Q?O8iGFT03R26P1V5Effip5xc26T7r+ArknmCarOpkKe+w6gv+o1Pq4VK94yzD?=
 =?us-ascii?Q?DP1lNXcF7oXkRRgZooNcOI07ylXAOVQo8MxtFxxV/KIBoYKinfvH2WWz3FxA?=
 =?us-ascii?Q?S3URKGh8oJkgWYIkb0QyOoIYaE+B98Dsn5bmUlGPueQkRv8EaWFp3t1TVIOB?=
 =?us-ascii?Q?QzA3IHBSyp/nm1n8dsoeeEByiZBWsAZEJ76+RmjbAvYHK1qUGH7dwzB57rIx?=
 =?us-ascii?Q?tDE81fFeFQqedkKwOOxjxGDv/zhvXYtXvwKFQAWLsPOShBnrssjIpHhA5pDA?=
 =?us-ascii?Q?Cf+GxIDi3a9hJeMyGtHudaGSg0IAOda9SHvlxCEv8QdjbpEkIJPZikn+rIeX?=
 =?us-ascii?Q?h5WHekgl9ckzlLslJXI9DTNszx1YSFbJgPx9yvHDmNcwrWG9X5ciEULipqO1?=
 =?us-ascii?Q?H1R28MTc/yGjSO1kVAk8iTWP2uK031grfGGVqqu+tz79HOM19ktRLdlN5WFk?=
 =?us-ascii?Q?Y2scy0zHeLEOVLwflbssQO9rygJ6cjCBYEcExlQ9PPv51AxTVn8M+MvQAQ/b?=
 =?us-ascii?Q?Ba5bHEVJKz1vKNZJAdoCTmpbKSwCvIkyWJHMmFi8rjK/VuodlkF+QDPFgvyi?=
 =?us-ascii?Q?5hmcPemVhbXJ/E8712SU2EWDrQ711LMMwQzidHuoi/TpQDBzp/W7krEz7ehf?=
 =?us-ascii?Q?JiCocX8+D+x15fUP2mciTYHsCyOQOdcNI1UTSYl2K8BLYFuJJKoeZLzNzRbH?=
 =?us-ascii?Q?kzdila9+P+9pAA0LfLA13PJxma/Aq0viZwB7CEq6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b43c33-b3d3-4385-1b10-08de23b7d3dd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:55:57.4844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OiaRwpnsMtUybbdmDkJuGjqOBeYgs8GCEbe2DUDjJ9r8yOqgMzLJFBLYe+3VsLmOdnxwx1NtiuX0i6TuGG56Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7742
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

Changes from v4 to v5:
- Fixed 2 import nits.
- Squashed a fixup to adjust GspStaticConfig (13th patch) to use wrapper instead of directly using firmware bindings.
- Rebased on drm-rust-next.

These patches a refresh of the series adding support for final stages of the
GSP boot process where a sequencer which inteprets firmware instructions needs
to run to boot the GSP processor, followed by waiting for an INIT_DONE message
from the GSP and finally retrieving GPU information from the GSP.

The entire tree can be found at the git repository:
git: git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
tag: seq-v5-4

Tested on my Ampere GA102 and I see in dmesg:
NovaCore 0000:00:07.0: GPU name: NVIDIA GeForce RTX 3090 Ti

Changes from v3 to v4:
- Several changes to adapt to Alexandre Courbot's GSP boot v9 series which
  had changes to the RPC command queue.
- Several changes based on feedback from Alexandre Courbot, Lyude Paul.

Changes from v2 to v3:
- Added several tags.
- Fixed commit messages, style errors.
- Added GspStaticInfo patch.
- Fixed bug found by Timur in the sequencer code (related to ignoring messages).
- Removed excessive dev_dbg prints in sequencer code (John Hubbard).

Previous series:
Link to v4: https://lore.kernel.org/all/20251113014119.1286886-1-joelagnelf@nvidia.com/
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
 drivers/gpu/nova-core/gsp/boot.rs             |  24 ++
 drivers/gpu/nova-core/gsp/cmdq.rs             |   1 -
 drivers/gpu/nova-core/gsp/commands.rs         | 113 ++++-
 drivers/gpu/nova-core/gsp/fw.rs               | 323 +++++++++++++-
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 248 +++++++++++
 drivers/gpu/nova-core/gsp/sequencer.rs        | 403 ++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs            |   1 +
 drivers/gpu/nova-core/regs.rs                 |   6 +
 drivers/gpu/nova-core/sbuffer.rs              |   1 -
 drivers/gpu/nova-core/util.rs                 |  16 +
 13 files changed, 1218 insertions(+), 37 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/sequencer.rs
 create mode 100644 drivers/gpu/nova-core/util.rs

-- 
2.34.1

