Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4070FC5548A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 02:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212F410E7C6;
	Thu, 13 Nov 2025 01:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mGM88M3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010061.outbound.protection.outlook.com
 [52.101.193.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB5A10E19E;
 Thu, 13 Nov 2025 01:41:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AxCqcgJvPgIKidX0cvXY/Fzw9iPwJ2NErWm4IIWClhI35px5rp0BiNAx/dWmPiukZYBvZYdEa5gYCvAvI8xYqNErJSJfLFFGAQo+Htu4yK6tZLo6yTbX+z6Kfaatr/ExhOJNOvBnMAiYQ+dQ/Sn544/GxfTT8B2HXE+VVMYywocyeRlf8Dm3EEe5X0Ei76oqJfa7taqrdjnsoSSlTJw7aypU+yHrriRXzC9wPFpY24bP8zqayIVhmyd49cvVs0/xoepW7CfHUx09zJlXO2BMDrcqFeq5gYPrHeFHxtyYnCf7HoTN3++Iy7jAeYFuzbOyIGbJPfxL/M2AjU7qYx6QkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/hvaSNHC4bPtuuj8lVto8lopzd5JopMTiTYLyMVd3I=;
 b=NTi9Nq5rCeU1/iraGldvSjKcYscPTIDmzapcx24m5uufq5FJh+lyzpBnTICFh5ip33b+rJR20f7v0S5dT9hGChDnYIb31M1+rI5ZvPyGO3fs/mGvTZe6KHghItz9bvXN4rLlym9I8lAIE6tsGHK2HWaVn+2AvIsnXrKavdyOsj2Yb+4bcGcBW6/F/Rab+uICf2jqU5lPtHuUu3/ijhz99TYnbrqaOdQUeEPxdXh1Nh8f7TSldVAYLtR7To6dJiXIuGnTFbznVL6zH6Oq5rctYXmWIG7JVA+GkeRyT5AVhnTpB7w4mDM25qJpKDo13NVzY5ypYJrs/WpX3wWd5l85mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/hvaSNHC4bPtuuj8lVto8lopzd5JopMTiTYLyMVd3I=;
 b=mGM88M3p+qJ9sktcijdpInPyVR2t6fW1vcw1cuxD+FkUjzWZpNhmH4snqnuzngMqIrSHN3eH1CL/UFBA+2uYPx66wW5F7RAnXQqqKWk9JA93JElIEs46kPhNHgaHo8BxC5Jgd5q2k7gDPGQik4y3iMaZouno8tdsMngGeF40+CkWC0QMBWQkWfwXKkNRnsZgCgNKr6Bm7zRCZagCvVAYTSrkJAoRqCIWtyQdnuMyBmsdb4eRV05A5tRrTX6XgBNw4L39NypLHUStomZTlCBvZOaajhYpLbqflXSSWVQsnzlNZgTGGVMQ4p99on+ADmfSISr/Srl8jxPSRktYE8XUsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by MN0PR12MB5908.namprd12.prod.outlook.com (2603:10b6:208:37c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 01:41:25 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 01:41:25 +0000
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
 nouveau@lists.freedesktop.org, Joel Fernandes <joelagnelf@nvidia.com>,
 Lyude Paul <lyude@redhat.com>
Subject: [PATCH v4 02/13] gpu: nova-core: falcon: Move start functionality
 into separate helper
Date: Wed, 12 Nov 2025 20:41:08 -0500
Message-Id: <20251113014119.1286886-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113014119.1286886-1-joelagnelf@nvidia.com>
References: <20251113014119.1286886-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR16CA0043.namprd16.prod.outlook.com
 (2603:10b6:208:234::12) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|MN0PR12MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: da4b423c-0cd3-4a3a-27bb-08de2255c218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?81IpFb9FKVwqPYL5P2psVusF/J0PGFjC2pCLMzNHy7Ump2/zKpllYa9W6rXF?=
 =?us-ascii?Q?gdd6ijWnnq6MmxBJgKLcPNRspFOUBz3RZllSgAkrN5jn60b7Ds7LQ+Y4SQJB?=
 =?us-ascii?Q?dew9YJuNWmvFjhQWlixY5PkGrCx+mdH8jd/HtXOByFq93ashJhDC20vb7hzo?=
 =?us-ascii?Q?2BJoh9BChkPygbrrF+Stl/cGBD4zEYHQv8rTJJ+6skVI4eyuGh782AXMrVsa?=
 =?us-ascii?Q?i8o4oSn++vDcIv24UgfI5Xb1smkmWqw++rrcn9E4sX76Xcf8ZWxvHrzChi+4?=
 =?us-ascii?Q?8vBcfBS3m7Bn4nXOO687r6FRABCfvB73g0TyO9BaQEDL3n6IXF/qU6TmHvp7?=
 =?us-ascii?Q?UpWon396HbR8LfmMUqiQF1IaNgsyt+CVmrfshW0rQqfFgt081lWInD98Z+jD?=
 =?us-ascii?Q?e5j/6ThsFetSJialx5kiOo5jahfYZhZePUFGqGBUokPRhPzRgFvJl7DKVk8Z?=
 =?us-ascii?Q?Cfa8E1St1ub+vDH0Xf0TdbVWJpq6uwm9LFg/3eds8jCJUp2yVirmq95/P5bl?=
 =?us-ascii?Q?3A02awMNA9DiGkLXdSLXBF9CgFWxm0F/75lvAHCvLw9Efig2JQ4WycDFQPl7?=
 =?us-ascii?Q?lb+mHl03eK+2ZMDpuicVQows0m11wvM0Ba+DDa4oS/W9yNkDEb6Nkzkx6t6s?=
 =?us-ascii?Q?QveGi/eKkN+pb+QnURpyg4mclpMk8Ay3VbutiwD3Ye1BSncG3sWuTZExlSuQ?=
 =?us-ascii?Q?7VaS+ZnfQaHceCYo5RDEgsN+Uv6Ci7s0jYTANkmKVaCaHfFh1+xYG60u3y1x?=
 =?us-ascii?Q?CcApD14is5g3m8H06xdNBhnTr78ghPPnsBHVEi9aahKB2wwn3xA1cTz8b7tL?=
 =?us-ascii?Q?OFW1Gl+sm/GNc9H1JlyH/FXS9ac4ObhlGhQR1XExKNtkLmkB46eaSKn2Iz8p?=
 =?us-ascii?Q?Kf9fd22DKFVOakKi7Be2JSUNaZ9OdGZOsHoGYIr/qG1T4zQR6rwcjpgME2fH?=
 =?us-ascii?Q?k3Cw5itZY+NE5w5GJ0EY+xwTmdm6Nt8x4iVW2nYhwfF8PggIth7N3Bw1lLd3?=
 =?us-ascii?Q?uk8NLlFhSLJ4BzebflKGZQ2BkvEAstxTpahORO5TLid2ph2JjrA01MkF1nqW?=
 =?us-ascii?Q?EayVJSM65Ax74fDuf77/h4hQlJouIGow6H0WjmlPqS6X1lsR4IL7j/xLyLSj?=
 =?us-ascii?Q?M6RPB2GkTcvRTI/EZUXz1TBSe1vW7VcpPI4ji7vuTSpxL1wqkLX8kpZ67lE0?=
 =?us-ascii?Q?mtR6v+hI5Jq61ZMV0NeKfETau3xEi4vv3l4NeA4bAckk1PBCTS1EauLL7+1A?=
 =?us-ascii?Q?ArgGUlH2eBNI6iWp1Xx0DLksx4BV+IY7nLThqzzLJ4M+ZY0kejI+PsqETq9y?=
 =?us-ascii?Q?1OOBbscV9grP3/8Nezvcf1E6jGS/ciHSpzY+TFLIXDjRy3qx2XhOvoKLO3z1?=
 =?us-ascii?Q?DuwCdFWiZTmbYu4oZ7xnZxu1iStQm3n9vEBUJZ6q8ojcRZkHVmZH5Lvlg6cc?=
 =?us-ascii?Q?1Xm9tE2kwLCNdo7Zkr8aEW1drB3q2MWZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jwe80xPyygR4NRYbVN1rU74fkHlqKJTFm9OyEKJFvMe1kB/y5Y0oXU6IgOj/?=
 =?us-ascii?Q?mlVGiQEp/cg1NmsX3C/8SpJgj+Df7MZt04FmBR5R1eqU769d3XJYYLnO1bZC?=
 =?us-ascii?Q?y1R2g3q5vpho7Fvhlc0AdsiBkoh1+tgR9dpgjhtkpGjlYa74wfE3x5aYDRJ6?=
 =?us-ascii?Q?biaPx4mbH6+baJohKpLfoduMHu1DZFAei+D2Nmm1I7P9wIeWSv3qzEZlHPGY?=
 =?us-ascii?Q?KXFd4L93jFTmKI/FABoEDJsqXajEvEjDvTKFEXN9/Xe7oWGmdjvCQQUTsnpb?=
 =?us-ascii?Q?h//alAYSy8nMVmXKAhbHAcRrsHoriqCQ4MPhFVz9SXMrOw8tEG8FuES9jpzm?=
 =?us-ascii?Q?in1ZO/LkLgKxCBf2tvdCpi5UScrxpfdIwx1u7zibmNUQWi4ryhQiea4giNok?=
 =?us-ascii?Q?uZslcSxsYCHupK/OOpL1ehRJOklII5oIW1lexIe4ZbQ+RU7dSDCFG6KG03KT?=
 =?us-ascii?Q?DoilGykl+2adVk2K3NtqMXISZ8xhC7wBENC++/VSxlY6op3Jwl/O1Wts3ddD?=
 =?us-ascii?Q?cNX0NiCFzAkDJ0Q79JmlYOE39vekgFmcx3XSl+ytxV5wNe4ILte/ft7lF1+A?=
 =?us-ascii?Q?cmkHr11wZabPNDkoFoP/vMLUpC5fME5Nx6YqqitPMPK1fvlfV2a4fgoBPYO5?=
 =?us-ascii?Q?hX1CELhfl9vvT2k9OERPRc/UgOdjH/AmMNQe7dr3AXCrryLyOCnUjeqCBUyg?=
 =?us-ascii?Q?QaESJk1s6TdW3bpEjrDJrL2SPFc8XYqcxQgX5sK4q7eICH3G2Dg7QYce/up8?=
 =?us-ascii?Q?aUrW400esBCj0KTxjI8ytgbR5bqozrHNVTJUfvl4+1qC2GR1CiLpIO23wfbO?=
 =?us-ascii?Q?rdzVX56nNft5SSGUllU2iPWzbEDJzNxw55r1jmJb3/tHw0eObTklU2GORo39?=
 =?us-ascii?Q?4XVx16CqdjvWLheAVrONLpAxjv/b8bFQueIWVjF6v0suHLz6FXKuCL2xf/ez?=
 =?us-ascii?Q?38GoZVY11iC4cNpr0UUKsrurE1KIQohvNNTygZBqT9zXSLNg7DrYTnESXBIO?=
 =?us-ascii?Q?NqiAbMfh6gegQxH8CGEbotIYQVtEzjVbc9SBB6Dzaf1SoFt3u6Nww9XX30x7?=
 =?us-ascii?Q?MMF4lvbPfb8fbL72FxnSioNliW9A3M7syZi7JKJDdshme+E61rMLZLVu9pmv?=
 =?us-ascii?Q?nvufxKM4W7pdO7Ep8TGSZjLjdwqQs+OyX2elAu5ewn75HgcWPueRdbR7ULn3?=
 =?us-ascii?Q?Rf0AnsB1zU2gmwTlk6ppAe+bd25Pb/xUH0esRu74H2YTHoUvVlijUmKXSPAW?=
 =?us-ascii?Q?2ZepH0AvkJO6vYsx0q73brC+gPk/TNyGGt904S2PPFCZS6Dx2GbEA1knZ9H0?=
 =?us-ascii?Q?muGOfvjbgnfeES3fHnn0Oqe3nUwNIGh5JTgnfro6ZqyhNfSpAo8TFrGkQycW?=
 =?us-ascii?Q?3IC7myGrKw56Ev6XINV80a+Rbe4gT/B38dY8ide1WjMCuwWOIcBCR5eVz9HS?=
 =?us-ascii?Q?S3fV2W3a35swJHzKI9Ym+sZ5wOpa4VwbfeobKZPZ4lb0oRi3YoWeVMiaFbdD?=
 =?us-ascii?Q?/1AbRWhaiTqkolOLsqjg3L8lMWk51c1RtOWBwsLgsUvMgm0r3UEB94b1fuN8?=
 =?us-ascii?Q?he7jNOzqsRTkwP+lxP7ghhgdU6wey6uC6qT3XQCh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da4b423c-0cd3-4a3a-27bb-08de2255c218
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 01:41:25.7878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0Dlq18qne9wzrNfqg1gvDTidOGDiho6iURf1/IxP8KQoEf1UWX9/DoGjOgPL2nPG1v91Kk3W8IETTX4/qeeeg==
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

Move start functionality into a separate helper so we can use it from
the sequencer.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 1e51b94d9585..30af7fc2814d 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -564,7 +564,21 @@ pub(crate) fn wait_till_halted(&self, bar: &Bar0) -> Result<()> {
         Ok(())
     }
 
-    /// Runs the loaded firmware and waits for its completion.
+    /// Start the falcon CPU.
+    pub(crate) fn start(&self, bar: &Bar0) -> Result<()> {
+        match regs::NV_PFALCON_FALCON_CPUCTL::read(bar, &E::ID).alias_en() {
+            true => regs::NV_PFALCON_FALCON_CPUCTL_ALIAS::default()
+                .set_startcpu(true)
+                .write(bar, &E::ID),
+            false => regs::NV_PFALCON_FALCON_CPUCTL::default()
+                .set_startcpu(true)
+                .write(bar, &E::ID),
+        }
+
+        Ok(())
+    }
+
+    /// Start running the loaded firmware.
     ///
     /// `mbox0` and `mbox1` are optional parameters to write into the `MBOX0` and `MBOX1` registers
     /// prior to running.
@@ -589,15 +603,7 @@ pub(crate) fn boot(
                 .write(bar, &E::ID);
         }
 
-        match regs::NV_PFALCON_FALCON_CPUCTL::read(bar, &E::ID).alias_en() {
-            true => regs::NV_PFALCON_FALCON_CPUCTL_ALIAS::default()
-                .set_startcpu(true)
-                .write(bar, &E::ID),
-            false => regs::NV_PFALCON_FALCON_CPUCTL::default()
-                .set_startcpu(true)
-                .write(bar, &E::ID),
-        }
-
+        self.start(bar)?;
         self.wait_till_halted(bar)?;
 
         let (mbox0, mbox1) = (
-- 
2.34.1

