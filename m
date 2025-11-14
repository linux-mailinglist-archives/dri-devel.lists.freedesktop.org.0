Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1E5C5F220
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 20:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF0110EAF9;
	Fri, 14 Nov 2025 19:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rWuZu6rY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010002.outbound.protection.outlook.com
 [40.93.198.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3647910EAFC;
 Fri, 14 Nov 2025 19:56:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IulFgBdjvNwKhunnspf4yeQ8K5owWzlLlvKBQww6R0a1ziR4jNjGHkTR/H5i+ZkZSDZhlDqSF1DHTjwA7Nx8BkaGHURmrAg1pbgcAzCy8UR8jl9AtnGeIRtYoOGU3pnfLGKWyC43RbHsRGCxeffFbXYBY6RerNv2rZWFNnLaDxwbxiILrfm07m7XjCNVplqsFUujQ4pIPEJE/acT13lhcqaQ6/MZNoeOdYWZsBVyowfQOg+7UuLgwPHgbdBaH5zkX5ojFAMuUPTbltTMLeqTeurXEsYSW06WVrsT4f3WL8FwzGpqnhRjvIAQUJN745ilpXV4yueWmkotXHfCRPzzGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoZ89fUGIlc4kCxRIZxSNEO/Wy3PRrTO7DMuE03srFM=;
 b=XjIGhp1ENO8xkWunJlVw4QG9r7Wq6tYInK8TiNvBsUbrvXQBRFtanEKZGQS33Nz8Ozgzb8R14S7tc1+ta1LPPPl82/MwZwXQgnAiS72b2nRMP1Zja45Ic6YvTseAn3W7DQ2soFCaCxflVZkZ3VOzQbnPAGPmYh1DDzqrEeoUQ0jFmCYyADaoEoEwNaXPia+CD9R6uTWDpH+j/1iN/imwQlA7m6nrODScligyzw0TE+P222vaUZau1JkXxqNfiU9eP2qKHjWgywDPHgrbtDSrPBdzTwEBB0W2mKjBsDs/q+WpuqYuuJO17fwER/FKWlEgPtMZmMjc20ftlDs0aWd88w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoZ89fUGIlc4kCxRIZxSNEO/Wy3PRrTO7DMuE03srFM=;
 b=rWuZu6rYMIacZhDZvwUzcRRSCaAtn4eEqDuKTO2raU5HXoaD7FTDHNLdEyBMTO7lQlwzDCwpyqVbCDyeLInqi4FP90UmkRJn6Zrm/TTyLggu+Uz0DqelO+RSZtKOl5V++cmY5TBYuGlfyGk9Vo6fUAT2JS/WT2/g5m2jZ2Bt+3AJl+9/O18dZSDqwq4sG4YNY+V7hLLDIDa7aN1s1vN2NKaJ6cWDmtHQ50xSvj8/W+wGJkEnVF8ZMywBUl2Y59uBjyKNGC7cTolxFxelVPcmrkWadXIL2dGLjED5UYJ0QmKHYDDvoU1MQxBO9dEFahGr/jjBxvOrtR2mWvQDjH4FKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB8340.namprd12.prod.outlook.com (2603:10b6:930:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 19:56:14 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:56:14 +0000
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
Subject: [PATCH v5 11/13] gpu: nova-core: sequencer: Implement core resume
 operation
Date: Fri, 14 Nov 2025 14:55:50 -0500
Message-Id: <20251114195552.739371-12-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114195552.739371-1-joelagnelf@nvidia.com>
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0441.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::26) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: 395117dc-cb96-4ccc-2971-08de23b7ddb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ca40MjQUit21p+wHQYEyzR18jFCh2qsRMHKTsWRPQX3BRiyW4/1Dd0g7eYNz?=
 =?us-ascii?Q?S3/3N+cu7/nUaJ3VN8PrACrDf68BBsvkZDMRSu/X9gslxCZlkBNi8VoPv29e?=
 =?us-ascii?Q?sqo7saaaSsfD5ubIz7mjJknPfhNioGCcr178UKwIIZ7J5SqKkQHqzp3WmBmG?=
 =?us-ascii?Q?FoEnOhYgJk02S166tsiwzM+uw224iGIYej6Ss3MeSbjV7EtI9kV85/CSeEqJ?=
 =?us-ascii?Q?Q0dHFObUGVjqVkBjzMPnpCdUZFgg2XoimjE+A3TpkzqruUigeMgFCz4TWXyg?=
 =?us-ascii?Q?fj9Apgyiajf8SnhtH3ThQiqzHR7Xt+dCwTsM1mcVQmyehQyW1mrHk6UOOqSe?=
 =?us-ascii?Q?Oc2qk22mUWYleUlXMHmCtGLWXR09ekHzSZGSqRK4pPyr/KQuFCjqyvf2ENZt?=
 =?us-ascii?Q?IKolR2VVGC/qSGeRqjGFgL+Vt+8sf+hcLRK9eOKcjJLABNwxzOE+kFS5i3rN?=
 =?us-ascii?Q?Ysud/gopBrmJlU6s1N2p/gYM2csmPCNCKnUYV9L2Shn7XCo1pfKidcnrrIJ1?=
 =?us-ascii?Q?IP6drMf2Ra8o5DsVGOl3F9xMh0gvQXZjslzw1YCLTXsei0WEaTjLVMMks67v?=
 =?us-ascii?Q?/5gJUVAyZBgPjJcosXLOC76AAb6XA6JLAoXNK0epUs2sejHPvZUlu8IYQls4?=
 =?us-ascii?Q?hLA8xA6MQPXTCmaVTkjZfeLGldZwgxPhoeapBJd8p9Fql3o/5B1pRibyyskk?=
 =?us-ascii?Q?HUk1EdMENIYdsw56ei7Iwh7ITOPjuLVlnWYQK3MJ+QmVIGwHnkjCbkmbkdX7?=
 =?us-ascii?Q?ZWFCTaF3U65denEzV29wOTmVyUlSTx7pBtTat1iAA+Gr9trweXIWKl1Lns6l?=
 =?us-ascii?Q?Lq++tmAV5cUEm1xC3PSY+mhUXV5gLs9mzDU5tj+atM3BTlN2dkZ+vCWI/sxz?=
 =?us-ascii?Q?A15kpP+uJBBurFpOUjLfr16OpIkenSfrydOeLqqu8fID4pX584pFwxiJZffm?=
 =?us-ascii?Q?wCky31bunX5jC/0XDuRSOrxtsIYGCjwICOpx8cRj3w20UpvyJe9STtmENzLn?=
 =?us-ascii?Q?05ziQFBabh1gtThODxpyFunizLZJCWDO1910Yo0xDEfCDLpMK2IZqDKJBlLr?=
 =?us-ascii?Q?DC8WloYXcuLAclVqVKK83Ri1iUmQxYPTWrkWH9nIV/h0ApXgstPqEbVJm2Op?=
 =?us-ascii?Q?m02QkEkMjThKBqTsCJzAzIYZdPNUUFGl3Rw7ziFei24klLf6OOx5K3HEsygZ?=
 =?us-ascii?Q?s6s7L9L/j5zgJw1EEiOP5YUuy74c0yAybT/VPCSRtjkFjmPAdcwAz+lUu48I?=
 =?us-ascii?Q?A3nv+D5OGYJuN+3zu+EuOvOJMZdBqpFet90vk63v37jygIfFHwbwErXa9X1W?=
 =?us-ascii?Q?tHLSU+8oNK8l5pbp25fXgLJgg+bGnrMysDLIL4qjK64ebOnuXOx1IhTNjPCM?=
 =?us-ascii?Q?yvHskqy8A/DR2mTsycdqDbVY0Bt10o+wwRVO4RFcEgFPUniaTlYOoperHKJe?=
 =?us-ascii?Q?7LEUtvMrWpFO1T1iZNCrzuKjLZcDWmGh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Dxmn+Yvl6J5pA4ZVzTHaVn4GR5NCEYS07nEz2xcKLW53XLmIttWPt1kaZ9E?=
 =?us-ascii?Q?TLnmeYn+LdrwckytTuinHHdDjFB49Ncvb9+nyJoVyajZZRE++NCi4QTLR3DR?=
 =?us-ascii?Q?6qcgCf99pkD/PhJulA1wBoIe/LmHp4h54000ze2vzFUAgVqvXP/KIzrX7enk?=
 =?us-ascii?Q?BiNXFk0v6IXZRFMOupM+ykYQugK2kG286intGLzlMHo2iR5CHXknduGFFpdK?=
 =?us-ascii?Q?Bz2S8h8T3jiLwyMrGrTzuvs4EC3FIaKYW/nVLa62Nr0SllO0OT+gpbribQR3?=
 =?us-ascii?Q?VPKL8jO3raTpPF+Elr1q6AhVUnd23I/G3kFgjL/Lqj2dO6nHAXynWCUPzlXK?=
 =?us-ascii?Q?F4hT3BhaRwR+czAYuLCqsFA2D/dPP7FQPoqyYwbjD8Kh16jps1FvKiO7G8no?=
 =?us-ascii?Q?i/2j19KDnec+e+8MwNniz+K7qNy2ANpixNQ51/y+Hflml9F4gvj4G4EOkQU4?=
 =?us-ascii?Q?F6uACib1xHmyMjVyKvev5bIry2LCwVy7AJSgQ5ZEc/MOotdJeSSAZT0CWu7E?=
 =?us-ascii?Q?DJO+7THLFigMnZ8joxNySqvjUINK0j99Tk5j6fIO92iPh4rsQYopByq6NjK9?=
 =?us-ascii?Q?i0igzG+P66pWZEjzR5ACQLe5VUvqFJeoRec+/73D9QdVDtJYp62C9fD7ide/?=
 =?us-ascii?Q?skmGXuMMl976dRVfm2iCB5It2gmuBXSPWxv8Lny3fWkeSpSt0tluYt1OT0Q8?=
 =?us-ascii?Q?RTwO5b19CTgnAJfgxe9iLJtaBqPPRHVGV8jEP4gK2eludRuxTM+wiy87Sf+t?=
 =?us-ascii?Q?m/u9xGatyWX6hz64kW3QmYg5sr3jOV9prW+U+YTvAUtllT0GH5uXRcr9mqj+?=
 =?us-ascii?Q?14RPU0RSu5mcNAuRlWC/sV5Quz9NpaQwGn28+hx3IRG0K8PcaBxiXitFnztA?=
 =?us-ascii?Q?oOzp58wHd9TtsVlXjjZMMLM62sy8kNS7uq9KSSHf4ywvA3P4LiGHKuCwH/NA?=
 =?us-ascii?Q?FyVzQW8G4XEAWaEQpMcATNuREh2uZbnOBSC1xxhBnNs3ACLmlw3hWKyFcjyX?=
 =?us-ascii?Q?KyB5t83RIVYjll/uyUSFRe6cDF6/d3cnKxQw4oSgruOCwYn00Ch/qZVlwtZ8?=
 =?us-ascii?Q?sv9oMZBT7PXzYElIiWY7WUjRQBzIYikp6klCHsvgFW3klHdPs/9yh12MIbzv?=
 =?us-ascii?Q?RdY0sQgRr92jOlDcv+FmQS+w58eZ6d/HLlzAKkB1ZmZsgddZbV5/PbjKuy7J?=
 =?us-ascii?Q?EvUQ1yg1U7Qzso9IGlJ2zi6oPVImelb3AQaR0fTwfpXliLHdSDF0FJY2qh19?=
 =?us-ascii?Q?VjeQk3iyoId9zAFs8ij5i3+MK4hY3WR7nDV9iUL2+H574CGjJhij0LA4Ww/Y?=
 =?us-ascii?Q?dMHB4VeVdXBLYHP9Hl/2Gz2ciAADgSua8A1KpkwlsA6Osms1PE7iWAgNlyAU?=
 =?us-ascii?Q?KhiCBqm5qK9ZxSC2d+wKsbX7tQCgRuqTYcgOeVUboqmO7MKJbRls24EgCRGw?=
 =?us-ascii?Q?zItmDk9a4miDZL4FHsWKj8t6QQvOvDSR554sMn85FkVqJ01OBeNeovwRYHsB?=
 =?us-ascii?Q?g9YyuO6zZAnaWPNe+fmmY7PkUNvbKZiPu055dppD9tZ8Rxi7eidxfzU0MVu6?=
 =?us-ascii?Q?tiOIayMVW+Bo4QU8TrWR+cpjiKli3D1IQW3ITA6G?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395117dc-cb96-4ccc-2971-08de23b7ddb7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:56:13.9733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/WZT7ApMJtCqlyjmudryHyvPtaZ6uZMcKyWji244w8j0eG00Ijn5sphNaxElhM+/mGkYDtFov8lihy9F1afYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8340
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

Implement core resume operation. This is the last step of the sequencer
resulting in resume of the GSP and proceeding to INIT_DONE stage of GSP
boot.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon/gsp.rs    |  1 -
 drivers/gpu/nova-core/gsp/sequencer.rs | 44 ++++++++++++++++++++++++--
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index 9ef1fbae141f..67edef3636c1 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -45,7 +45,6 @@ pub(crate) fn clear_swgen0_intr(&self, bar: &Bar0) {
     }
 
     /// Checks if GSP reload/resume has completed during the boot process.
-    #[expect(dead_code)]
     pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Result<bool> {
         read_poll_timeout(
             || Ok(regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar)),
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 8d996e5e71c3..c414561576f8 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -71,6 +71,7 @@ pub(crate) enum GspSeqCmd {
     CoreReset,
     CoreStart,
     CoreWaitForHalt,
+    CoreResume,
 }
 
 impl GspSeqCmd {
@@ -108,7 +109,7 @@ pub(crate) fn new(data: &[u8], dev: &device::Device) -> Result<(Self, usize)> {
             fw::SeqBufOpcode::CoreReset => (GspSeqCmd::CoreReset, opcode_size),
             fw::SeqBufOpcode::CoreStart => (GspSeqCmd::CoreStart, opcode_size),
             fw::SeqBufOpcode::CoreWaitForHalt => (GspSeqCmd::CoreWaitForHalt, opcode_size),
-            _ => return Err(EINVAL),
+            fw::SeqBufOpcode::CoreResume => (GspSeqCmd::CoreResume, opcode_size),
         };
 
         if data.len() < size {
@@ -121,7 +122,6 @@ pub(crate) fn new(data: &[u8], dev: &device::Device) -> Result<(Self, usize)> {
 }
 
 /// GSP Sequencer for executing firmware commands during boot.
-#[expect(dead_code)]
 pub(crate) struct GspSequencer<'a> {
     /// Sequencer information with command data.
     seq_info: GspSequencerInfo,
@@ -229,6 +229,46 @@ fn run(&self, seq: &GspSequencer<'_>) -> Result {
                 seq.gsp_falcon.wait_till_halted(seq.bar)?;
                 Ok(())
             }
+            GspSeqCmd::CoreResume => {
+                // At this point, 'SEC2-RTOS' has been loaded into SEC2 by the sequencer
+                // but neither SEC2-RTOS nor GSP-RM is running yet. This part of the
+                // sequencer will start both.
+
+                // Reset the GSP to prepare it for resuming.
+                seq.gsp_falcon.reset(seq.bar)?;
+
+                // Write the libOS DMA handle to GSP mailboxes.
+                seq.gsp_falcon.write_mailboxes(
+                    seq.bar,
+                    Some(seq.libos_dma_handle as u32),
+                    Some((seq.libos_dma_handle >> 32) as u32),
+                )?;
+
+                // Start the SEC2 falcon which will trigger GSP-RM to resume on the GSP.
+                seq.sec2_falcon.start(seq.bar)?;
+
+                // Poll until GSP-RM reload/resume has completed (up to 2 seconds).
+                seq.gsp_falcon
+                    .check_reload_completed(seq.bar, Delta::from_secs(2))?;
+
+                // Verify SEC2 completed successfully by checking its mailbox for errors.
+                let mbox0 = seq.sec2_falcon.read_mailbox0(seq.bar)?;
+                if mbox0 != 0 {
+                    dev_err!(seq.dev, "Sequencer: sec2 errors: {:?}\n", mbox0);
+                    return Err(EIO);
+                }
+
+                // Configure GSP with the bootloader version.
+                seq.gsp_falcon
+                    .write_os_version(seq.bar, seq.bootloader_app_version);
+
+                // Verify the GSP's RISC-V core is active indicating successful GSP boot.
+                if !seq.gsp_falcon.is_riscv_active(seq.bar) {
+                    dev_err!(seq.dev, "Sequencer: RISC-V core is not active\n");
+                    return Err(EIO);
+                }
+                Ok(())
+            }
         }
     }
 }
-- 
2.34.1

