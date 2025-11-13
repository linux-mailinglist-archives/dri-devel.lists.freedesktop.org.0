Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F4CC554AE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 02:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443C010E7D3;
	Thu, 13 Nov 2025 01:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DIcVa6yj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010021.outbound.protection.outlook.com
 [52.101.193.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFE510E7DB;
 Thu, 13 Nov 2025 01:41:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNpR+KFOicaIsvp4BXjWaURw3GaHoLgwOX8RufNIVC1m+SFhcWSmRR1hcQU546LGitL/PZwyyd0IvQR079ZH3gJ/B5gIiWkG63qIHqGkpEJVyCgY+mySlAMFcLSU7NEBIysNEbOOOjLU7VoXseeAbcOrJvPmF2AYrOtLfgD19KMCP3x/U1g9tJNXVpUnG26iZfeapokJUcFS0vOxwJu3x8Wh/ez9D5W5UuPC6Izm4/LirFonmBykzqy/CjesbkupmtX1LrOEENoPl2UZbMWmU++EyXGokl3H+1Or5Y9uDC0vTeR1F7S+/0d1luKXNRoG3j4rB2t9hOmmTaq+JL57Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igiluqk0XUlv+f3LRdGTq6kmxq2YzbffhW7QC1nMqh8=;
 b=CbO32Sj4CgayO1G53WQQBow/DWSQfn4Ypo/tO6MujD3+W91leAZwD3ZIZ/klXTiygPOE+BtApnuGvwA1gJN9lKVoeRkHrIjYO1xix7+/Eplxo7x8uyWZU6Q0VQGi5yrUh4xYh7VPY5OPzhl5kkHtY5LqBflK20yO64lCKROlYgnpLcKbr5gVfvBH5ftIhnKFhtEv6q+fVN14JUQinjZf9Dxutb3rMG/A2RyXy/2ucptUk12hZCFEntfk8uspqroC8OsZBacE576h9Y4ZXTyeHMO60foWsq6vPAeTlLQJsuVSIqdHcAyvAfbr1pcCxS80Odr0g7c9tv20s6nERx1ehQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igiluqk0XUlv+f3LRdGTq6kmxq2YzbffhW7QC1nMqh8=;
 b=DIcVa6yjy9BcivN0ucxS3Bm7c9ul2xE7nSFyVuvAEQtohB3ROdGGAs8GK5Jkxg28MdSqomvQwdklRC0b6kWDY2GrM/AF6zijJoPcGYECZ2vNADrPG+4EMB2mgF4JeXqGiOOPJp/Q4PpnMmC4ZjYnDUuG2IAT7rFRGO1n/PI6WEODccau5EwHKQZTpfna6vroSEoK4hsUbxZ1S2howXNaZ0zi8Z22qwQKd7r7DdY7HsiQ9ptNzJO3YTsdPKypAd2XkKK6U6sX0yE7tT8M5AK8hNbfYxzB+r325kA4mSJgt81jhC+/uinCZiVycvUs1+5u5BwtGPdKYv8gvTb+q3HDzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by SA5PPFD8C5D7E64.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 01:41:37 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 01:41:37 +0000
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
Subject: [PATCH v4 09/13] gpu: nova-core: sequencer: Add delay opcode support
Date: Wed, 12 Nov 2025 20:41:15 -0500
Message-Id: <20251113014119.1286886-10-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113014119.1286886-1-joelagnelf@nvidia.com>
References: <20251113014119.1286886-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LV3P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::6) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|SA5PPFD8C5D7E64:EE_
X-MS-Office365-Filtering-Correlation-Id: e21c95a4-9208-43c0-2d6c-08de2255c8fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hIwJXnA1nDI6o4NWpdn6Rfn6R5a3pXY/vT7aKHRIfIBi77G8r908kn+z7mEK?=
 =?us-ascii?Q?w4psXk34h6AeWFe8UaEocNfVqhpHIM6dAJVSkX3/7B720/K9sC7uXKfhlGEP?=
 =?us-ascii?Q?fcYKVt9wxGhavRujBQy58H663520ienScZLKBeLwAUu1cv5hkO/3Yq2bZigK?=
 =?us-ascii?Q?bnYLLdXXN5ENIrkKz+qj5ug4jBGRHhxM4XM+/M2pjdgoAT5Dd0ypAlYTUWsw?=
 =?us-ascii?Q?xc4yJiba+T+0OcNR8TVE5Yf6ZYtb2CAlN+i0dxdjSDPTNN3d0Zccr9lBVgkC?=
 =?us-ascii?Q?H3t1T3deZ2xwJD99gAZKZA0CMTegOD5Rv4v9jUjOw9vDDWqR7Q7hFS/boKW2?=
 =?us-ascii?Q?CmvVF/N6nfCe7E9/TqXYRoymN7WfKg896FSMmRjuEyCanv2YI29jrqoxZLxN?=
 =?us-ascii?Q?u2KznihUx5chZizEoLVyApr3zknFX4X8uzGV2UExjGwZwz6aY1oDltLuF4lx?=
 =?us-ascii?Q?zpGykGKZ6kkWa8QX4qu+eerrz7/gaA1r0WEWySzEHAit1OzoQ5rstJdfSRsx?=
 =?us-ascii?Q?pyMvZHQtZW46skroJVAt6qKQzGMMAAqVF0zjv1oAFLQWyZdKBGVUZ0O5NRdw?=
 =?us-ascii?Q?y91gMoHTB+Z8NvQxW9kN3dfF7CR8JnkjB+fd23qdI1n4UAJGSCw1EoiH/lkK?=
 =?us-ascii?Q?d8mKHGh37+Zrr/yglHKVbDcGW9mu+ZzTNnOf9udrv+E+eyF2+CvHAFgwypqr?=
 =?us-ascii?Q?kWhODICG7qLjbWuoL7f4aTb38xe7H83P75o1GgNiqFHKPWJ+QqLCbsI5IabC?=
 =?us-ascii?Q?qfgfdq6NpWJe8PIcvDH7T37H9pMBbE8hFQeP+Y5mENF9Qr1FJsVHowEpRHF7?=
 =?us-ascii?Q?mfNtOEwWi4DXy1fBesJ6+uomsDMM26Wyknv9ZENlYwkybLnvmYQKr+avuF3R?=
 =?us-ascii?Q?gA4goMZXKaTtJbN7/b3rQ6PsKSV4hJNXiSCXuOBr1LEnQrzUDS9CCJdiCVlF?=
 =?us-ascii?Q?+KxHhPtztk/JELia1pzRV3m6lIRbXXv7nCledFvMH8XKyOPwE7LqoOY6hOy7?=
 =?us-ascii?Q?REu9ctIe5k8UWUkfMU4cu0758x2xaLVPVvrRBfHjak2xsxIaubjkHyBzaJq1?=
 =?us-ascii?Q?w7x+JNWHP+YxJMbyzOLC4+MQdeeIOexxzrK6c+H11XsY2EPWdhbST0uWrGLA?=
 =?us-ascii?Q?KfmKKQqsR56C2oTFhKU9dTl845in4lprAbMVd8S/7w9listwp24PXxZ44yqU?=
 =?us-ascii?Q?gJWFwdn4n+yRwt7mm202R4F8ISND1C/bzbif9+hnnmM3AO/R6bf3NpBHd1w0?=
 =?us-ascii?Q?jYw45vEupMgPFYoDkR139410Ge4c3vG3eg1iFtKZe92yHBv+uoVzJfK/+2gf?=
 =?us-ascii?Q?QQQ2TEfKKUAFPGjF++LsJkJ/Q28g4bOBtMS8MArDK6zIBluVks1z55in9BzN?=
 =?us-ascii?Q?XarSTWcJi6cOYSZOGUn+d0G/5Q9P9EMzyxBR/MYts9PTzppBYtoERtGI/29p?=
 =?us-ascii?Q?6BzwxNPNYpVw+p2pjzasa6vZW+Sqz/tL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GlmYCU0XmRA5T0PG7YFcnUwXgjguDf9MqK0fPYhIPfWHwGRgcSp+J4pcy1J5?=
 =?us-ascii?Q?c8lrbnlbQa/W1j3nghXHO/aoIw7XOnIQH2eO1dEq0GFACmX7UYiL6dI6xaoa?=
 =?us-ascii?Q?yP04FK7kptwMemHSOttDo8hbPe3XoP3ejMDERub1hNOXSEL9ct7QfAH4GMaG?=
 =?us-ascii?Q?r+CmZT0JmNriFg/619JdeNfF7RAKG+ICOac1G7yArMj96gIS4LBAia98qgd2?=
 =?us-ascii?Q?V77H1sgFlBeYIEVA7ervHCsT4hhLnoJ07Hlc71rtri/rk6Yufe5+5xpb/ZhG?=
 =?us-ascii?Q?tBUYknLdwqr8aJ+0pjVefje0dh/hLEJhTU8HPtCf1izsYZf49B/78BGXOA3w?=
 =?us-ascii?Q?fARqY/aMwxfyfCWAd/gLjCazXMpikJEP5bLQbPhhBbwnOhD3p48QGUw0v/Mh?=
 =?us-ascii?Q?H4WIK+JcoCkpC/EDbIKvAVK1LDvffN6xPDH3JAMEZOAoplqub/Gqzme2vhMl?=
 =?us-ascii?Q?h4ZF4REl529ACcWMy2hzX/I2TU9HIjkih7EJCz+QdjvA0j5k1gi9pUom1rXe?=
 =?us-ascii?Q?TzuFwGonAmnrqfqwvPe4orGQ2AZWzL8+WGFi7dyTGvd68R+gJwFvw6HGBotn?=
 =?us-ascii?Q?Mr8g5kgGHjAbtJIasHxfSQTo2cU5vZGxcDYAVRDniSEOFWlWE5VWYQAq8EbW?=
 =?us-ascii?Q?IH+H2dnciuSeg8RPzwsdjyBpX86Zg67r7b4lVKsDjsLTeqT/gbo8STZB/lsH?=
 =?us-ascii?Q?nlmvjChl9QyHUzC1w553tIoGpozDCwt26QPYJnmsduqGH8tQ7Bp6tHZsSxur?=
 =?us-ascii?Q?y4B7nkgJXf4K/T8CwvkivgDRYHd0UAKS6ezVa8GLIt4EnfC/+oTrMrv7WmEK?=
 =?us-ascii?Q?xdx34pYkmLCm4iIroXD2MC8srCqisAY255xG/bc5bZcJoFp6Gyr4pomzUmuq?=
 =?us-ascii?Q?aw0KMf4DwpV7JRkp7STqWOd6Ktdj9fZ+z0w1pw769rRgUgQi3rpzYFTaWYm2?=
 =?us-ascii?Q?fg5hMgn4/PTek1UEywQTXoENmULShtLEWIee6kRqM9tEMJAn7HoYcQX3LkBM?=
 =?us-ascii?Q?6ortZ9b2RyqwVq5sn6Uwv0/80J/m0nF1gS+2dwuB7hOHRqUG6PR4boFxqkw2?=
 =?us-ascii?Q?GrDU+c10UuoL7B2tLkNt94ihqat6I4BObiiG7GCpPGN/6cldhCK1n43jDvsK?=
 =?us-ascii?Q?hMEpaR9Q961TrRAJ8fslChU+DZmrsLweJlbJcDBjL1v5qMETHPHA0RMhSQmr?=
 =?us-ascii?Q?rrO8ct0frjZIV+vHgJHdTz2KE8pIT0oqRCbL1ejPw+5wRPsA0LxCgO70UBex?=
 =?us-ascii?Q?YkLVK4CTTCK5mC/eh054SHcyhXz+3YreQ8vYkssUuSaxPSHiVThqs+AoVgtb?=
 =?us-ascii?Q?aBT1KaethY94BAOfeuj0WPfSRsvaSfyyIuw9ojkC7Dv0jmjPeMpRitx/IVmv?=
 =?us-ascii?Q?uwDhjkCK5YS7uRqc2868uTU6HdIok2iPyT+FOmP1zdUr79xG/nPReUzUlwhA?=
 =?us-ascii?Q?VjM+CoYlmps+V3f/LZ96Xcmhj2JHy9+t7fEuHUVUZjxdUisxoVnQ+CBmPZmW?=
 =?us-ascii?Q?3ZVxlx7JZZpHp/wX+L/ASKilVhPtzu72YNNdvGKr7P2sTenDWO+nDfwgCoxO?=
 =?us-ascii?Q?nQygTvgiGcutjJIGuMPmm9BAYtItl3vaTG2fwiFn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21c95a4-9208-43c0-2d6c-08de2255c8fc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 01:41:37.4275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttWg5GqdNBm74T7tRR29Qy0u2wcxizfLPTeDrvJLxPrGPoruenNghiGwc9ikOrIJ0Ta/yIwYp87AtAA6WATQ2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFD8C5D7E64
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

Implement a sequencer opcode for delay operations.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs        |  2 --
 drivers/gpu/nova-core/gsp/sequencer.rs | 21 +++++++++++++++++++--
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 4717c12a8666..538bec7d7c2f 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -473,7 +473,6 @@ unsafe impl AsBytes for RegPollPayload {}
 #[derive(Copy, Clone)]
 pub(crate) struct DelayUsPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_DELAY_US);
 
-#[expect(unused)]
 impl DelayUsPayload {
     /// Returns the delay value in microseconds.
     pub(crate) fn val(&self) -> u32 {
@@ -514,7 +513,6 @@ unsafe impl AsBytes for RegStorePayload {}
 #[repr(transparent)]
 pub(crate) struct SequencerBufferCmd(r570_144::GSP_SEQUENCER_BUFFER_CMD);
 
-#[expect(unused)]
 impl SequencerBufferCmd {
     /// Returns the opcode as a `SeqBufOpcode` enum, or error if invalid.
     pub(crate) fn opcode(&self) -> Result<SeqBufOpcode> {
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index b011609c6804..787db395dd2f 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -29,9 +29,12 @@
     device,
     io::poll::read_poll_timeout,
     prelude::*,
-    time::Delta,
+    time::{
+        delay::fsleep,
+        Delta, //
+    },
     transmute::FromBytes,
-    types::ARef, //
+    types::ARef,
 };
 
 use crate::{
@@ -85,6 +88,7 @@ pub(crate) enum GspSeqCmd {
     RegWrite(fw::RegWritePayload),
     RegModify(fw::RegModifyPayload),
     RegPoll(fw::RegPollPayload),
+    DelayUs(fw::DelayUsPayload),
     RegStore(fw::RegStorePayload),
 }
 
@@ -110,6 +114,11 @@ pub(crate) fn new(data: &[u8], dev: &device::Device) -> Result<(Self, usize)> {
                 let size = opcode_size + size_of_val(&payload);
                 (GspSeqCmd::RegPoll(payload), size)
             }
+            fw::SeqBufOpcode::DelayUs => {
+                let payload = fw_cmd.delay_us_payload()?;
+                let size = opcode_size + size_of_val(&payload);
+                (GspSeqCmd::DelayUs(payload), size)
+            }
             fw::SeqBufOpcode::RegStore => {
                 let payload = fw_cmd.reg_store_payload()?;
                 let size = opcode_size + size_of_val(&payload);
@@ -197,6 +206,13 @@ fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
     }
 }
 
+impl GspSeqCmdRunner for fw::DelayUsPayload {
+    fn run(&self, _sequencer: &GspSequencer<'_>) -> Result {
+        fsleep(Delta::from_micros(i64::from(self.val())));
+        Ok(())
+    }
+}
+
 impl GspSeqCmdRunner for fw::RegStorePayload {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = self.addr() as usize;
@@ -214,6 +230,7 @@ fn run(&self, seq: &GspSequencer<'_>) -> Result {
             GspSeqCmd::RegWrite(cmd) => cmd.run(seq),
             GspSeqCmd::RegModify(cmd) => cmd.run(seq),
             GspSeqCmd::RegPoll(cmd) => cmd.run(seq),
+            GspSeqCmd::DelayUs(cmd) => cmd.run(seq),
             GspSeqCmd::RegStore(cmd) => cmd.run(seq),
         }
     }
-- 
2.34.1

