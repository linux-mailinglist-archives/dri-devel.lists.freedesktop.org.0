Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 091EEC3DC2C
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DE610EA06;
	Thu,  6 Nov 2025 23:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WSgcbi1i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09A210E9F2;
 Thu,  6 Nov 2025 23:12:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9PGyUNp7p1+2lazPjLqx3zY7TjlRMUHCRrWwkzw6/0D7aK67JEIBN8CpoOqao8w43ceKlEor8kRbJ/B30ALwxR7PASrLn5CQHbw42WaSMCuWoJgOJTGKuKvI8nddx9vwLX7dESyatONq0TrOJVDtJIOaoUhiIh5HRarQZ13whyG1yd1cawrIF+buk7Y9QkU7l7M70rhCAM5mI62LhwztgtM38RTB31AgD8KAbswn883dm1HSffevbc9duAFOWF+tqfr6XtE+eFNlx3Qk/Rf0iGYU1op17iw9ITjsMY4PbKuGVa4VLsEwXZ4Ji8p/xPVRgIw+lRjlQ7eipwlWcVuOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ca4JmZIDvQmcF9Q89mx8WNFiy5po6lEZvuwSEmU7srE=;
 b=ZA+GOn2i34kmsVp9mQHlZzGKwOAf4MecURmYx5RqlibZ/h+Nl3E7hDTR+lU2KBdNF2hM1UZ05FetgueBM65ypVVbw8BQ8ZRHtEUBh5SQHj191usW7KPLZLFsjGBbXLgaYmdLDpW2ikkRNukRkIrJ4xD+uxX+eqLwOOmvgLeO/a+8ZsK32YnypADlTlx7IhdLcyi8D1OWufsvQc1qU5iAepYnd8t4zq0E67+UtAZOFfmVTdmzRWpNJ48yjaPaB13t+zC14hfjx8/zf7GXWh8vPNEgRSGRt0k8QMUYI4usXTQDlv/SPRFUO2eBeKS3btiUtzxXcn8qbhLR2AkjVDbY0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ca4JmZIDvQmcF9Q89mx8WNFiy5po6lEZvuwSEmU7srE=;
 b=WSgcbi1i9S9hfQsf8Q9ZrbgxRYFTAOd9OFX0jQoOD7/Bt7M+x1044p/2oDpI8dwptON43bqo++1oMyFPHhrMj+JyDqrQtrxomMHc+1k++p6vLMrViKv+xbW0krGavf2TJmXwnZrB0Vo5b4/iPprn2+yVekVatbY4KgiUQjEFFZt1DhbhTILPc3j9P+QXX1XCszb6UTSinS+RXnYWSq/o+x+VgnrnDCQwEY5MAa3wCuwkxgEmLqPyvbOT/V+biPymE15kxwpHCH4bQ+xVgv/tEeiPLnwspuWJJhgm/Ly1QRlUXxLs3eTZ0uE9T/i8Zu/ZYzVzAp/b7X2bJvBCEC8nJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BN7PPF62A0C9A68.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 23:12:16 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 23:12:15 +0000
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
Subject: [PATCH v3 13/14] gpu: nova-core: sequencer: Refactor run() to handle
 unknown messages
Date: Thu,  6 Nov 2025 18:11:52 -0500
Message-Id: <20251106231153.2925637-14-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106231153.2925637-1-joelagnelf@nvidia.com>
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:208:32e::7) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BN7PPF62A0C9A68:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b500801-2a20-4e68-2f53-08de1d89ed09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BeT33RbUDFn8RpILEGdNzFO2KEjf6i/XiMJWShVZlCotcOy9rrtcWKHg2qhQ?=
 =?us-ascii?Q?wEJsmqvHDSaL4xJfVRhf1SngU4j8GsxlLy7pfNq7fSmzCqaXD6+xbqOgXI6h?=
 =?us-ascii?Q?4yNHwjfquMQwx1iO7acm9/2iu2uGuDV+lE4hu6kR2xblZIHYC014g9dwNy5s?=
 =?us-ascii?Q?c3FRCtqhFKFFtlH0DWsXHR8y4gcj6K3Ztb2e1qCQQr89vQ1OTVsTOAILGXta?=
 =?us-ascii?Q?4482NN3zaa563VBBayIZvIbUXUJtVuLl0dLQntH0DzDJScr3TyhDy/N6U8uh?=
 =?us-ascii?Q?h7Bz74SzkcXdBoy1Tsoe069a8u/we31zhSTW3pDPS185ULnF+CPnK1000nhu?=
 =?us-ascii?Q?lK++cRe8dxFdVm7ZXM/NbaC0on8V9O0gF9td6LEJNCm7ZDBZV9LL4WRmZpuP?=
 =?us-ascii?Q?WzxVjyaormp+Q47vUaO9NbJTB+/txa24RJ3yUw8NAZ1zr0+CbwTL7jHUgfjK?=
 =?us-ascii?Q?zOrEHn+37yeWPyBDXYAD340PXaPdFMkvJi2r9Ddm0m44YG2KhzL8EWHJvwgL?=
 =?us-ascii?Q?0Y8ey8S5pb3j2RXWBS9LyntT4XCPD3B2nNeq5FWJNx5GId3xsvK+tAF/oEUo?=
 =?us-ascii?Q?/7qN3iZi0P4D0uZPXYZG4pIv/azqE5jsQfY/iQByXd/Q7PjlkVW+L9PPCzXw?=
 =?us-ascii?Q?Sz8mbKltLWmGaSkcvdAjJ8+BHLpzdt8zRxx3/xr1ObzNbhvCdsqsAy6fEYlt?=
 =?us-ascii?Q?GNo3mPeEnCisBcrajPHcrHlA6Q1yIV6iGeqlzfEokmEvbaTAoWAAoLSFtiGl?=
 =?us-ascii?Q?zpiD34+WQbdfnjY4tT9i2RQZF+oka1AhuuLZNTOrQz9y3dekgdGs1oeqQn4f?=
 =?us-ascii?Q?Lb2PQeW/ka2OAsqJAXM8sqctixDUyVf0DqHYqTQhdkIeGygiBps1yk6fN7JJ?=
 =?us-ascii?Q?QjHwI4db5qdN86AhULmp0mWKx4dhTypK7LVNOIr5/VnUtpExHsmdSwZBMhkX?=
 =?us-ascii?Q?xmZqUirnO3l0nC7TAh6ozr/KiggJpj7BXx+e4FAeGt6UowAGoVsFhBH+UT3Q?=
 =?us-ascii?Q?KiBLxWgZtCHJIpQfZE/+JpMCuxycC+oNDkKl86YnQvqbvNN5R0EDkW0eqPHv?=
 =?us-ascii?Q?hgw2KtvGBOJeh1d7lQsHaJSkPgzquN1xqP9aX0MzgoJBoyI7MfG9KvszJRfd?=
 =?us-ascii?Q?dnQqW2nCFL1FCkPNHd2KCFOL2QOLSDvzNdd0hsW76xvdZWkittRKSWQnlqNQ?=
 =?us-ascii?Q?Wmssa4UVeXS11y7k4DrCj06ayUhTgfMiBfzmX0WP2nNeF76mg7o20QiZw1Nr?=
 =?us-ascii?Q?RSIn+VTmJ0mkPovXknvXhtuoO9k1o+OqON3YqeobRSQl1fbNMVDeBEBkOvX5?=
 =?us-ascii?Q?F2POgyXSEzpKonKqEmvOLdMs1VBNbgc71lK0pYq/gKuyDMYKer7fwtk5v6y0?=
 =?us-ascii?Q?QHkbzR7k0qUifz5/fg5WvIFJX0/ri9rHJn6KuWsuEuq4kN54os0hp78KFIFN?=
 =?us-ascii?Q?AJg7S5MSrKaliquh2l31Zk5aCK20G+Oq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2dlSHG6bK4SQOkjDG2z4fCk/BcFz1KtP6oRI9qWat+lw+cS7xNB04k+niusj?=
 =?us-ascii?Q?qJ+Uk2xo8vZUZK7KQ9ilfsB2MLdLwcgfdqJJxiW9NoSAuPOZsdCat/twYKNW?=
 =?us-ascii?Q?hOD57Ex4H2xFsttaQekr/IqfrMnmjrmWf9Qd/u2hfFOT79oOSPICJcS37ibd?=
 =?us-ascii?Q?zPRJfVhrzzwmTHpr2ArfpCJ0noDySkRz4YDL6RGYzlefy5KUdY3XkYZ3l51U?=
 =?us-ascii?Q?9ejUn1n28aoYAeqNx0XA9s+7AwHv2iVHTEE/ZzpbUbZ19sZR/w2WwESqtii1?=
 =?us-ascii?Q?dIMHLpfVpqCpY4gJAg+jzkgXC9SbIvcVJja1o+3bWSLk7uFW+87rv5yce9jv?=
 =?us-ascii?Q?AutUIjlGMSQLDfmSHWaB9RprUP9PdAC/e6lxVt0XX8urW25aMGbnq+h9Xmyd?=
 =?us-ascii?Q?Bsjl7PV02z1SnAQjll38aNwJn9Q80Q/vAe46rECaS/6koTZpL69LbkJMIsFb?=
 =?us-ascii?Q?AtEbn6LVvev4vZKo8vHsC31IzQUbUWo/HfKSNfF6I8WjxqUbO96fh7JkEmcc?=
 =?us-ascii?Q?aKKy32kX8KydHoJHOl5EaK8EqbyjwZWyXNVBabfZbUeijBXmzyFJ1fksgaMl?=
 =?us-ascii?Q?Fc9u51JzxRghDSef5SRbDCQVO9/lyvtoCHb/sq4wUo4Wh1fbIjA3FQofcr2y?=
 =?us-ascii?Q?5XueoYjkIdz7tRzQXmt7+GvwXdj/21nmMwmMXHVkCgKDAXyPhE5rcAGeJX2F?=
 =?us-ascii?Q?uRsNZKe9nYffWKQ4PVEmBI8wWwmLJRE02HfJite6ksYDWQYQ2UJaMpZjqirQ?=
 =?us-ascii?Q?D8ebpyLExYD9lmb0KcOx/3JFaAZA3UY2plI/Wza6svgDQ0xOn7oAK8vQIcoB?=
 =?us-ascii?Q?V5YqFwTdhzIf17o28/J4Pcx+RSdAgjK1py13e39aWgBYSGVr4be3Vmvy/qBP?=
 =?us-ascii?Q?NujHq9fGnviMXHhen8gYD2GlbOPsgpKib/NK/wsWrABt3/RC/M65fttp4pqb?=
 =?us-ascii?Q?zR+qmE2vzpzURnktDS34cEyVM/dvdMl3VPwJtNpclAQJeteYnEevkWugBWVN?=
 =?us-ascii?Q?GgjFCXfyEo8sRYywy+EtxIziPR0DCMzm9u8HawZeS9p879Uh4wIgIwhdkL2Q?=
 =?us-ascii?Q?AnbCDRC77Zf/MKiS6NdyzuNz2ezND8ZCrqUhioMgQzT1pCzIwYaRspjF+X60?=
 =?us-ascii?Q?PaFbsEtPFfy8f65qNP7lzPiUzFtr0Mjcya8P/jC5VrtNh4rbyCPeMxIhG7TB?=
 =?us-ascii?Q?XEi6dH6TeVyG/E3wGKBl0d3b915mVzjRQZuFp2tqqSRKSPVuUd4NFBb9NFMU?=
 =?us-ascii?Q?tljTq1kCm37A4gb9OgflH/JhYCpDzV8qBFCFvxLHAe3Z8IM/dvURey5dSpWb?=
 =?us-ascii?Q?j3o5tCsoSjQDJJK/NoxAYdw0bOYRLSVIUxp2jAGz2nIymCKUQDO0lUHXygKf?=
 =?us-ascii?Q?tCNrUTg/hrf+SI1eLVC/5qgKe98QINHtDaFvdNiMrJUV6Ext1usDt5UTwkKD?=
 =?us-ascii?Q?9/wamcDc/ApORTTS7bsKMYdl8J2eT6Ddywd0eN2nN7axDbVCvhzbatn79v2Z?=
 =?us-ascii?Q?Njg3o/3KTExY8oJwkEVLGNBHlqS/8GJkKIdST9h+M1sK92ntxWZQZR53BJNL?=
 =?us-ascii?Q?jTXebbII0Ax1fMcpDRPmv6xuQ22AHMwSaakYKWQi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b500801-2a20-4e68-2f53-08de1d89ed09
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 23:12:15.9016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tN34yAs5P0fkpfLKMgtpu6ESvuopV1LwqgrNOrTK2Nw8MQOIoRQAu9G1ikncxJ+o5y5fBkH85D2PJhTbrnLHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF62A0C9A68
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

Refactor GspSequencer::run() to follow the same pattern as gsp_init_done()
by wrapping message reception in a loop that ignores unknown messages
(ERANGE errors).

Suggested-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/sequencer.rs | 80 +++++++++++++++-----------
 1 file changed, 46 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 3b4796425d0b..a96a4fa74f29 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -35,8 +35,8 @@ impl MessageFromGsp for fw::rpc_run_cpu_sequencer_v17_00 {
 
 const CMD_SIZE: usize = size_of::<fw::GSP_SEQUENCER_BUFFER_CMD>();
 
-struct GspSequencerInfo<'a> {
-    info: &'a fw::rpc_run_cpu_sequencer_v17_00,
+struct GspSequencerInfo {
+    cmd_index: u32,
     cmd_data: KVec<u8>,
 }
 
@@ -125,7 +125,7 @@ pub(crate) fn size_bytes(&self) -> usize {
 }
 
 pub(crate) struct GspSequencer<'a> {
-    seq_info: GspSequencerInfo<'a>,
+    seq_info: GspSequencerInfo,
     bar: &'a Bar0,
     sec2_falcon: &'a Falcon<Sec2>,
     gsp_falcon: &'a Falcon<Gsp>,
@@ -336,7 +336,7 @@ fn into_iter(self) -> Self::IntoIter {
         GspSeqIter {
             cmd_data,
             current_offset: 0,
-            total_cmds: self.seq_info.info.cmdIndex,
+            total_cmds: self.seq_info.cmd_index,
             cmds_processed: 0,
             dev: self.dev,
         }
@@ -355,38 +355,50 @@ pub(crate) struct GspSequencerParams<'a> {
 
 impl<'a> GspSequencer<'a> {
     pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>, timeout: Delta) -> Result {
-        cmdq.receive_msg_from_gsp(timeout, |info, mut sbuf| {
-            let cmd_data = sbuf.flush_into_kvec(GFP_KERNEL)?;
-            let seq_info = GspSequencerInfo { info, cmd_data };
-
-            let sequencer = GspSequencer {
-                seq_info,
-                bar: params.bar,
-                sec2_falcon: params.sec2_falcon,
-                gsp_falcon: params.gsp_falcon,
-                libos_dma_handle: params.libos_dma_handle,
-                gsp_fw: params.gsp_fw,
-                dev: params.dev,
-            };
-
-            dev_dbg!(params.dev, "Running CPU Sequencer commands");
-
-            for cmd_result in &sequencer {
-                match cmd_result {
-                    Ok(cmd) => cmd.run(&sequencer)?,
-                    Err(e) => {
-                        dev_err!(
-                            params.dev,
-                            "Error running command at index {}",
-                            sequencer.seq_info.info.cmdIndex
-                        );
-                        return Err(e);
-                    }
+        let seq_info = loop {
+            match cmdq.receive_msg_from_gsp(
+                timeout,
+                |info: &fw::rpc_run_cpu_sequencer_v17_00, mut sbuf| {
+                    let cmd_data = sbuf.flush_into_kvec(GFP_KERNEL)?;
+                    Ok(GspSequencerInfo {
+                        cmd_index: info.cmdIndex,
+                        cmd_data,
+                    })
+                },
+            ) {
+                Ok(seq_info) => break seq_info,
+                Err(ERANGE) => continue,
+                Err(e) => return Err(e),
+            }
+        };
+
+        let sequencer = GspSequencer {
+            seq_info,
+            bar: params.bar,
+            sec2_falcon: params.sec2_falcon,
+            gsp_falcon: params.gsp_falcon,
+            libos_dma_handle: params.libos_dma_handle,
+            gsp_fw: params.gsp_fw,
+            dev: params.dev,
+        };
+
+        dev_dbg!(params.dev, "Running CPU Sequencer commands");
+
+        for cmd_result in &sequencer {
+            match cmd_result {
+                Ok(cmd) => cmd.run(&sequencer)?,
+                Err(e) => {
+                    dev_err!(
+                        params.dev,
+                        "Error running command at index {}",
+                        sequencer.seq_info.cmd_index
+                    );
+                    return Err(e);
                 }
             }
+        }
 
-            dev_dbg!(params.dev, "CPU Sequencer commands completed successfully");
-            Ok(())
-        })
+        dev_dbg!(params.dev, "CPU Sequencer commands completed successfully");
+        Ok(())
     }
 }
-- 
2.34.1

