Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 261D5C29ADE
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 00:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A7D10E1EE;
	Sun,  2 Nov 2025 23:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sjNPBBnm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010027.outbound.protection.outlook.com
 [52.101.193.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1142710E1E8;
 Sun,  2 Nov 2025 23:59:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfUc0rwdwE7tcMqIS3ODWUjiQNy+NnvbRgU0pQaPs5qYnMZijNv36dxpt/lAN1jNpX/RCpXdTQH2c/XaD4SdQe0HeyiV0RVmSsfDSr4N1HzRscqw7sJIsNGewseJkqBgRuZlEgN5O08Jctwk6IQzcqwsJJP5JtXiZRpBo2bnHh5Qe+aNTeer0slzwZ0DnIYBflmQskKI0Ps4jpjYMGr+85KkbezFInoY09h73UZ8FqIECl7m8qqaxD/JjL4sSPufmrAX/D/hdNdyupKC1V/K2eSqJjZDGwO5fePUFD0/m/aj3/8S2V2NogYaYJEAf31smSAWqmWpyGiHdbgENVd4iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2KmCIYYEL+nluMa6EQTzVD1/kG0sFwS8rOkFVqMKVE=;
 b=FZ3GnAmJBwyvt7K72I+rwjdSkR+AIyR9mVZPWupPvvNcck7RBc8x6RZj4aO6X7kuPNy+GQ+jhWnv7r1ThqbHWMz4tjYwo9qnGz7NgWumRvtZN1lDMiWABqXypNm0CEFeaHRGiYh+1ERtKhJAClKVXUvkFZZlYUNCUWALh0c1K1AB/2JsLOaynkUwd85d4QjboouIOWsLG+tNl2XlOuLAwY3lDMUZTO8q3f0p+myKRtcfvS3bfaDttSxdHjXZwv0103+9bIdoa4Vgs5lkdNuxzmkllRIdVzaae7Ge7XPi49v4mOKA5s2NtgQkYyhJ9FqcB9NZys7c2VLCvOb99M578Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2KmCIYYEL+nluMa6EQTzVD1/kG0sFwS8rOkFVqMKVE=;
 b=sjNPBBnmtwZG55Pe8bXYyIoMvTpaGaQ/+2wfWqP8ahoXyHJEHH06Bg7Or8hzCUHC/HaiGcVrLK/C8KbM/ID+CYXZNyWTFLPAXaVuIrJiH+WpRAMZ0Mkau1+DQ2cnVo+FyI0k+VIum3quvolVbNqz73+vfqkTEg/P3/fc7t42W8VHTi3HUgfmxHujmWanSJPVdd/G6EaFrcQNyrZQ6AhENfQZfHZAOC+tk4kaC5aAZhAab130jK36C45UN2GaAIm1N4Ovwt4pc+rnFntQVb2CZNvlGc7Q+xkdLui1x7Us/p9vr4m7S5AXNVFQhRqZBuU+A5vleVB8uGIphfqlWLeaoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 23:59:44 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 23:59:44 +0000
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
Subject: [PATCH v2 10/12] nova-core: sequencer: Implement basic core operations
Date: Sun,  2 Nov 2025 18:59:18 -0500
Message-Id: <20251102235920.3784592-11-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251102235920.3784592-1-joelagnelf@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0124.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::9) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb7e42e-ab2d-4d4a-f804-08de1a6be515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zQ9qtJhQlXxw+JnjLL723+J1e2IQDwcQodxUG1UjtcQrOFwtEOtjfqZwLtba?=
 =?us-ascii?Q?zR/oYLrUHQ/PkFuWSKsX+ehluFC4zmoWTeyfxaVCvPmGdCeP4gmUYXRDl6tN?=
 =?us-ascii?Q?aKXytC5nX7TR7fh8F6hunr/1BAMkmbqZLFQiEauvd1jI0LZY0iKun7EAT/uG?=
 =?us-ascii?Q?/FS9G3KkD4jCX04zPecaQCAEAu2beySCTn7OfFC7z1b6OwDNAhKP7KmogYsR?=
 =?us-ascii?Q?F+qCTchO4PgthvJW7aRG6yPY01ImPUrEEA0AFoWJ+65ZoeyGJ1S+nPz5xMe0?=
 =?us-ascii?Q?8vUfuGZAg0Ziw9Qaqxe3egIrdmc5j6aPuHXJ7ui9afbPDCtajPhxrmsERlfZ?=
 =?us-ascii?Q?IUqbLXWrvtyWKVhT3eUvOj0d0ISFW/+QhjO017L7a4v/zr04HEfjlCNrIq+x?=
 =?us-ascii?Q?F1ftPZW58otvJpzpVSUOdU9cdgC2rjxydQ0cmG53BEBa15iTXwzeR+iXm0ef?=
 =?us-ascii?Q?1Szu6nBGdS/DOnE2I/D0K4+nhRfiMYFHEdC5xLGy/nDqZ0yf1IUwlQP34JDa?=
 =?us-ascii?Q?TFW3i9tq8vdnUN3RCVJkSWYzO7pDzkXupLTZ2ga2UkfmenAw89SUmSBY6b2E?=
 =?us-ascii?Q?4MgiXcyjz0sLYAuxUR5iGf/85XYGnBjR5itrA5ltrYx60J3b7WdpE92TS6jB?=
 =?us-ascii?Q?xJbMiWCWkouMWa88osnb9ch1Nc4H/FIG0Gi08BUHX7GS+G8XMA8mhwO57B11?=
 =?us-ascii?Q?TlsZ0QCmrul+sgs/1Tm+Vh3S9fi3gWdM0s4lOXP/+7pky9VTY1z1GuWnxUkz?=
 =?us-ascii?Q?4y59HHWGxChddn9sWBYP18rIRvLvWCRyi8YBKLdoXur/Y3p283HNZBEt3Dys?=
 =?us-ascii?Q?tsD8jSSF0wnzUh3hnTEpIGC+nlwqizy/0RCFbshxMm0JjGHf5Tq1sDuIfIcN?=
 =?us-ascii?Q?h5ImEM+4bbYVIodgLcLUkVfpycOEIGeLZP5LVOWrySnHMzjDttzSuXH96SPi?=
 =?us-ascii?Q?2VOIEiSBezdO32LBAS8TfV2STb/wRo2mAa0V9hZOYX8Ff9UAs0NRtA6juLC7?=
 =?us-ascii?Q?WvtVqc6dLlk1B6pCMAFuYP8MUjnsHULcVb7c6EZ3jl+YrPdQKZlhnt8bw2Nn?=
 =?us-ascii?Q?OWw89ODobnAkw9QVvEcRTrHhOXTI4UZxCMjwp345pBCTH/M9oupFWpZgliLN?=
 =?us-ascii?Q?WSZIHtOuGVsnpKHns43V08dZPe+YNSNRzIkR6kFTU4it/IYW/ktVprxkG6Xt?=
 =?us-ascii?Q?Mb3UsN3/JT2xdsHHjZEnCqRzc4nviC7j0lEbEigEFUHnn3908UaDxFZXykLX?=
 =?us-ascii?Q?8ZG/adaRJeAk2A8te4acIH9yN08ejzt+QAZEjyvE5NZrrLcl0GqaZAVDMv50?=
 =?us-ascii?Q?b0KPbS+dvK2xAM5cohJ7mqigccMkf04kfg4ncG+CsiPds1zKXCYHlz5e+bSn?=
 =?us-ascii?Q?XSgVX1tw8RevELeOrqL1i0BAyTI852j2XcRajwUCWWmy7pbggg5/e4UvPO1k?=
 =?us-ascii?Q?ij+6utOn0MjzJqaYrhVrNuY+JpEkU7zQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GkxuX1vGXxLzhzkGyBYWuRV4b7ABQGWWd7fjv5w8gUmCcUASLINA/PLmtQEF?=
 =?us-ascii?Q?+pGvI+EnRiVjGq85vhk3BUnNp0dp/9whtYw0U33V8t3TcJ1glbLaToH+OPok?=
 =?us-ascii?Q?SwhpHLacmkN8Ndlczut+WeoeemnjKPVh/cPiWy+fqogPoQ971VyaUduj/qVf?=
 =?us-ascii?Q?iw5jMol98x3WkOunMTcfmGYcc8xOOf263dfel2/0dLR7TfaMdfnbcWV85Egf?=
 =?us-ascii?Q?vAF4xNfJzanQKuHDeaB56RhT9pkuLNYMSLj7jHWjFQrIJ1FqZ5ZFt+107/IM?=
 =?us-ascii?Q?3DftxbJFi/G0RaDdgR6j3ODNU99K6G/OmRTgM/wKyPyrPqt8FbHdZwi4NlSq?=
 =?us-ascii?Q?BkAZuKeh4D0e4FrQHH2EzwCCmddYxmq+PGO7TqAreFnm9LXdxzHJ4Pw4+BYg?=
 =?us-ascii?Q?NBsdqHDWC1xEQf9v/KsJ3p63rD50pNohYBVVv6f7SsRmGyTONif4U5k6/YRD?=
 =?us-ascii?Q?/AmswmGfj2i2bRVEXFa1s3jMBriKemAZWHAts+FIEwh7Zh4D20U7V4M2uLQO?=
 =?us-ascii?Q?wHKZQz/kqF2x7Az0ZHXmXRQB2qS2xhJN1j8FPTYi/1NBICH2YZj0oXNnB7eA?=
 =?us-ascii?Q?Y4S4Z/obRF+RzqL/8rr+uFvvzSMMQtC83WJ85uVitWY2EW4pslfVYvhH+47V?=
 =?us-ascii?Q?84aczH/xDIQZWd5/weHaqRw1RCJaYRoUyOuTLxsZBTEvhiBv9LFatLt8suQt?=
 =?us-ascii?Q?rBcF3fPcBwG+7yOnyRluEG7X8XWPj661R4MYowxWg+BO2BAZ2kbHcr5SIDwA?=
 =?us-ascii?Q?vcj9BhMDXN6wpInORRh2uwU/zJnC1/LHNMua8ISlw4ZS8vGTEOBpV0NZpF3Z?=
 =?us-ascii?Q?qAOynr6NyMQCxAc5Hd+MpTaLVoYqM9jjmmVoOV4PyOZ27EDd3pbp0SGo0B0K?=
 =?us-ascii?Q?5fXcjaWdZlLvJhwWGgd90KQ9QbnC93N2sTEpCMuxyzeIFZYHM5Bi3RmeEQIK?=
 =?us-ascii?Q?UsyteOtRYk+vrJRQbm33+wOEijNFNfWNFlMVGbmW+sm6n/UOYc0CB4vCg8sg?=
 =?us-ascii?Q?g7IZXHtnYRXrd58D1bMBem+V8PS00SrqrWbgXX3KPO6LYhcxKr8iP87wqMYp?=
 =?us-ascii?Q?49tYbLyFjG7ZqKEWY/lrMO411WckbvHRuN1VOdFL1oaUr/TeCyzs/1LixYBb?=
 =?us-ascii?Q?HomKVW/Dwn36XvaeCexU7EGNbgkln+Q5yMee2NOiHmHJf6Cb+F0yJ6uU7d/q?=
 =?us-ascii?Q?10AbOa1xJecsCPZrQhKZ4L5+Ep2tVhMNlA3gSczaYXLs3fbqgqVFChB4gdSC?=
 =?us-ascii?Q?EXXjrqY5kvu13CcmgVqbV2ZwNKhwaCjNDV0f6ObntrluqtmUG8ppNHwQqyto?=
 =?us-ascii?Q?B9m82CVqtSUkKu5vuQxS1+ocO9/1/y6MoFH0CXipkgnLjl890kFXehOd01Jp?=
 =?us-ascii?Q?RbHVekOYvz5XSaB2rCUDnEIlHZ6FsYcBxAcwcfBiQP1iEot20mq8xCLDjlVi?=
 =?us-ascii?Q?Y+yVdVjJV5cgMDTS2OwEPJ+tcZWxT5RO88Y1zcp+ZDfm9LCMBPKcBTVO04I6?=
 =?us-ascii?Q?jCu6K0XAHSSzgYNgXDJ+vgJ4m/w8A/0vhIj2juNa2ujk/2ti8n/05BDqYFqL?=
 =?us-ascii?Q?41rveEsJR8Jm68UAKc4DKIR3TtyzTmscm49Grp/b?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb7e42e-ab2d-4d4a-f804-08de1a6be515
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 23:59:44.1409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ry/HLZIrKivA4a+t+r97H1v4VtcjME0TbcYqn6PG/wEFXFQ7TKdFKWjfLJyo1SkC68ZPzBasV9LQS+SI1h7DtQ==
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

These opcodes implement various falcon-related boot operations: reset,
start, wait-for-halt.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/sequencer.rs | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index d08664044506..127b293a161c 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -49,6 +49,9 @@ pub(crate) enum GspSeqCmd {
     RegPoll(fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL),
     DelayUs(fw::GSP_SEQ_BUF_PAYLOAD_DELAY_US),
     RegStore(fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE),
+    CoreReset,
+    CoreStart,
+    CoreWaitForHalt,
 }
 
 impl GspSeqCmd {
@@ -75,6 +78,11 @@ pub(crate) fn from_fw_cmd(cmd: &fw::GSP_SEQUENCER_BUFFER_CMD) -> Result<Self> {
                 // SAFETY: We're using the union field that corresponds to the opCode.
                 Ok(GspSeqCmd::RegStore(unsafe { cmd.payload.regStore }))
             }
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET => Ok(GspSeqCmd::CoreReset),
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START => Ok(GspSeqCmd::CoreStart),
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT => {
+                Ok(GspSeqCmd::CoreWaitForHalt)
+            }
             _ => Err(EINVAL),
         }
     }
@@ -96,6 +104,9 @@ pub(crate) fn new(data: &[u8], dev: &device::Device<device::Bound>) -> Result<Se
     pub(crate) fn size_bytes(&self) -> usize {
         let opcode_size = size_of::<fw::GSP_SEQ_BUF_OPCODE>();
         match self {
+            // Each simple command type just adds 4 bytes (opcode_size) for the header.
+            GspSeqCmd::CoreReset | GspSeqCmd::CoreStart | GspSeqCmd::CoreWaitForHalt => opcode_size,
+
             // For commands with payloads, add the payload size in bytes.
             GspSeqCmd::RegWrite(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE>(),
             GspSeqCmd::RegModify(_) => {
@@ -232,6 +243,22 @@ fn run(&self, seq: &GspSequencer<'_>) -> Result {
             GspSeqCmd::RegPoll(cmd) => cmd.run(seq),
             GspSeqCmd::DelayUs(cmd) => cmd.run(seq),
             GspSeqCmd::RegStore(cmd) => cmd.run(seq),
+            GspSeqCmd::CoreReset => {
+                dev_dbg!(seq.dev, "CoreReset\n");
+                seq.gsp_falcon.reset(seq.bar)?;
+                seq.gsp_falcon.dma_reset(seq.bar);
+                Ok(())
+            }
+            GspSeqCmd::CoreStart => {
+                dev_dbg!(seq.dev, "CoreStart\n");
+                seq.gsp_falcon.start(seq.bar)?;
+                Ok(())
+            }
+            GspSeqCmd::CoreWaitForHalt => {
+                dev_dbg!(seq.dev, "CoreWaitForHalt\n");
+                seq.gsp_falcon.wait_till_halted(seq.bar)?;
+                Ok(())
+            }
         }
     }
 }
-- 
2.34.1

