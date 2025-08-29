Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF43B3C1D4
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FC610EC14;
	Fri, 29 Aug 2025 17:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MT288Sup";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A5C10E1E0;
 Fri, 29 Aug 2025 17:33:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GoqR6NeWBq6pW3qM7gBzjoINB1/0lIAHD2fSDjgLEQ5o7NxK9AlFPn/J+9Lxop5jAUMbUwg6SUPJHDNt80dX3JrxwH1NsJTKpBk9e7yvBC4PxXRyTGFmooPxpnAUHDxQ9sbFL7NnzmxhrDcDZEnjVE7uV4baw/2f/bAZ2yqsqKl7u8K8BfejYxG4VRk6Xdlxr6iMXJFNVpHFWBfPPU2EawMzZ2QMvnDXgETBmx4bjZcKXynvETP/amDeVvQLz1YtkBFcXQNP8j8HGSrQNrx4f2oocFTcl2TBJU8NrWA3lGBkglorBoGuoiVTN2FLfRS0a9WpkUPxSCEuiiLzBX7/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EISnD5lP4Kb+8PnQxiCtgMAly22hqG3fcTwESAN1fAU=;
 b=j0jq+b0e5eZlCZTSk1sZCy0p9tWkYWTxOW+/L+D2kMsGTE56cteDRrbJ+oP1tz7BBVsXvaTRo2nLfFciTnnZcmCLUCRPRxs2CRv7L7JZBBJKNr+wqy6e4i1dDjc9+UbKBeRNHll5W2ge87WvjDYzdkSErO9cg4uJ7K6tRsAOBH5FlqVgYw69W/mfUAZoclAPR6t7AkeoRAcL2b0+s01b2Pc7Andh7gMRctyyKsdMqzB1i+lmxo2Ir8UqvYm/8S+hWUCjtUZJ5LpBF1bCrKL65o9JG1VIYoyCI2UZMdkw2wBWP1XewkagYBcIfArE9Jk7z3B0uC6qZCrKF9GRepaFvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EISnD5lP4Kb+8PnQxiCtgMAly22hqG3fcTwESAN1fAU=;
 b=MT288SuprfOVCVccHFvuk3mI/Aa40LtxEd3X6bEwZUuTbCgTNstnh381ROJRrIhFk0HAlwCD7/gyxFQ4afOEo51tq3zh+Z7gWsPKw2Q6LMSI2EIRKZDF4iWv2nd9k4ra4LvbtPmGx1Aiau5dpRx+X5NSLQ0qCF4JHA3ij9J6du6/c4CAxyGY3lVothfQwBwnLrkeYxwrZFgRw/ykUYozxvotAAMjPAOUzqXnPUxPqgVbhageDc7uGCjdlSHAWRIsqJSx6KBDzC7GTploNizwnq5az9cZciXxgYqpImwNNlDCGoLYzz8OMVO3vYs5J87iMI1091723ieUQkLs5qwoIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH2PR12MB4069.namprd12.prod.outlook.com (2603:10b6:610:ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Fri, 29 Aug
 2025 17:33:29 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 17:33:28 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
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
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: [PATCH 11/17] nova-core: sequencer: Implement core resume operation
Date: Fri, 29 Aug 2025 13:32:48 -0400
Message-Id: <20250829173254.2068763-12-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829173254.2068763-1-joelagnelf@nvidia.com>
References: <20250829173254.2068763-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0256.namprd03.prod.outlook.com
 (2603:10b6:408:ff::21) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH2PR12MB4069:EE_
X-MS-Office365-Filtering-Correlation-Id: f0e0bcad-6be1-48e2-b60b-08dde7222a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xnT11xcvtW5B3szHdkOI9jxx6i8xjJBGSqdV/jNHrE7LVsaTc3JcV3P4mUO1?=
 =?us-ascii?Q?I/DIvCJtKmlIUvrK6z1v2q60OG3dj5ylq10IY2ijE0e9fvHU9urPKIExbChB?=
 =?us-ascii?Q?vAGM7tIO5cwoAw4+txIJTFaUKLibN+4pkIMxGxQfHuXbY0FoVQSSTOgyu1Oj?=
 =?us-ascii?Q?ujDc+6fUmZN7+tdmcLLvxRvrQp6R7JC2b2vKO4kRO0UDfn/16A9YUDOKDI3N?=
 =?us-ascii?Q?GGc0VrUipx7xnvaPmB6vGjxU0QeVQCFRdO+GwuHfAtgblLSzlvdt51frEjzl?=
 =?us-ascii?Q?OkQWydvDoakaA+1I9/xVEsiTaixAFX7yK0Gy5QrhgXsECkUi5NzGm9usAsEA?=
 =?us-ascii?Q?ETPRjOb0XCYzQcqDoeMAHXw0nq2geCx9BXuE+h0GlJyrIy+2RBmHhr86c9Ke?=
 =?us-ascii?Q?XVuKWEB0NjcIbuW5MpLzqKQI9wGVyic0E+LFsWpgOQiM3s0R/H9gukX+fcDM?=
 =?us-ascii?Q?r7QCXH1H8Cns+ZPH+3fCek4NilN2wtS4410EKACGUfAfk8YQ4stb5X0yXRsG?=
 =?us-ascii?Q?VDmb8r2h+RBni+mNhpCBZmqnBqqrKkFGAeivlAX5v6FKvSaYtttcHsMUM3lQ?=
 =?us-ascii?Q?r38v03UTJrFwIPPmjLQSWWpFJt1ewmGwY6+QNnLLASOo/EQ8AaQhkhmN5PSt?=
 =?us-ascii?Q?RtzDYUrGCNpewKs57GfDiV4ebbgN0XB7o95Y8dHXg3z5PcslXo6QDxGj2Wzq?=
 =?us-ascii?Q?MLCNbdwGE/bNB9ySlbaw3T0VnkddeXWthwW0+nofzE068oSD+6ziK4y2H+Ob?=
 =?us-ascii?Q?oICrnkF7UJtpqR+W4jAdAl3PbNxcSpGiv2t/0lFaTk/+U8z9dNKAfVUHmioo?=
 =?us-ascii?Q?03q9PUbPKhe1eJGEr8sGMQSATwSFeqtD3fPIBShXlf7fZpJysMXW1VZKZSuF?=
 =?us-ascii?Q?xSNQKZjZrGpjdI6tIY+yaM+nSz+hh4DKL1CV9r+Rri5NpMSGwDWpMH2ZQM0A?=
 =?us-ascii?Q?HmoqvSUCk3B9NPSOAnbYI9JCiavXjsVIouoHt8qZ/nmgmzawXeBcJH7yXhwv?=
 =?us-ascii?Q?qvqFTxBiAOMAIUWxwkOmhyREzeF9DVY/VVk0KVdYuoSx1ef6qHXpE5d242/k?=
 =?us-ascii?Q?VbrpDsP34h8C0eCONCLryYzTrGdoXuEOOll8T6bDW3BOj/tePTR8g00ZoCSN?=
 =?us-ascii?Q?m5Hlr98isLeUUCK2H6qdY1T30S2f3gZK58GXbaZoYeqRPoosBIzVq9whxhvF?=
 =?us-ascii?Q?r7J+8zNkUbGyAQ4ldWC+xOCqGfS5t4UfBO5T1JOgsFeVebGncoS++5yg9Yvh?=
 =?us-ascii?Q?CiqFtgRbNbMqSj4iIDGTji6+reW6lzpk6Z62nkGGAwvHxFj/VJ3qLnVCnGR7?=
 =?us-ascii?Q?SaBxlXUo5r03UwnBE1JTaFYVeM4f79xlUaXTipguz03KqrHv3z67/3BFtyfL?=
 =?us-ascii?Q?3cmzxa8WTpkEN9UCagsK2m5tRMP4j9NNxtjYBBaJcoJy4+Dq5He6t0NNTHST?=
 =?us-ascii?Q?lHuOLDdPHyY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fCl0xTTKbps1QDimBl0borph2aPssF4arTayWGeCdV/GKcNs6BypQdsRSQHl?=
 =?us-ascii?Q?tLVfUxqL7PRZC6Y5r7Nly2ngvJCjeLArTuRfx3sHUVAZG1Aw5jySZ6SCccb9?=
 =?us-ascii?Q?vAuzDWaGMzGmyA6Y6igN5tvtmjMFs4Y3mVafSS1DXks/JFdqKuj9zlO+Jhqb?=
 =?us-ascii?Q?6cBPACnCV/mJ0XanDn7A1aEE6+Ies9xpOotX9bA0bPTJB7Wn1xgn5jWKcyAi?=
 =?us-ascii?Q?NI+IrgmD6KGxpBq6OevectkrrZYpsONxdCxhqUuLssFmrfPjAqooUtBKYXgO?=
 =?us-ascii?Q?M67SIv2/L3OwWhmqk7jbAJZLMvhkwLePekbFmtIIKeP07ETdHXEdRhGBxPU2?=
 =?us-ascii?Q?MqIuoeI6OUeDvQX3iNIcgR+/nLgSniXLGTsI/s2aOF7QAeBLX3IZB/jiC+Ot?=
 =?us-ascii?Q?7fXV23dsrnLEASEfYn11JZHYFSbSlrvxEe2uiAMxGkAHJoEji/naZxWOfhqY?=
 =?us-ascii?Q?GHNlo/wWnPKpgTg2aoP+uP+uk8rwVhf2297+TXEnPZ5f1r8M+zfzg3t53rGA?=
 =?us-ascii?Q?9D/+e9jPUwabTR4x5PhRz4jiqY88TXnwUWfaQSGETLn+oD8CTT3es+RUc5GS?=
 =?us-ascii?Q?MpCXnJtAbB4tagxJuwT8TJg57Nu4OW6GfKdELmqPbr3FslYoymEfIYa9FJM1?=
 =?us-ascii?Q?/JXvqfesZ/hfN+8NgiLbfHI8Dp3TVkODpdQ3Ic7jPHXulqMCfGrgf7MJO7x3?=
 =?us-ascii?Q?maPsNeMi+uqoiqDwNXcvNdKgQ1x1K8Bx1S1Q50XrjFIUGCd4b/MQjeXCL8fw?=
 =?us-ascii?Q?6Pwicwb8armd7tx+0XwCkuuticqqlsBEepIsPGvgORFlZmaM8HMIve3jIEyI?=
 =?us-ascii?Q?wTu+59NhYp0QFB3NWdyoc+m8lpLKEdn16dqyO0QMoZYxDqHavVktiikE/Ndc?=
 =?us-ascii?Q?Onp1uIpRsv4F41HnHNcFn1xR3QxB8y/ZtahUfMeT8Nj1PcHes3uPK775+hDS?=
 =?us-ascii?Q?DWtjZ5+c0pZeIJNJ1+D8X4s4P2Xqw7oRauLZkO/OfV1HLqJsA+QFY4z5zlc2?=
 =?us-ascii?Q?VgtXpWtS1nAqrCnFjH7ozb+76kgzACGX2yvZYiIMgxuIkBA+Q8yYIRsEXf4m?=
 =?us-ascii?Q?dG/KUEmLcRNNT7OK0VflDkq6VX9gPCgo+xYUAISETKZHXkuGA9eo1SLVQxss?=
 =?us-ascii?Q?QaBEkbeXmSngFOTE58WfrUCNo3XDfJ73WWl+NFBQTGxz4lG7VZhNSoHJ2Q+x?=
 =?us-ascii?Q?sBGfHn8jR66aRw7vQifZLHKd1NLasbj+EJjDTfGWGzs74tO9rypgoX0Q+5Xl?=
 =?us-ascii?Q?oIxbqOy7MPBaWyk2YLqOtRJSbQaxuOkUqsxT3/njfX5rJ7Fs9o1tnwFw9Ag8?=
 =?us-ascii?Q?Fg0nvlpDbiCX615ezuBtmNs50EB3JEnjjyi4OnktAa/SxOIgaEfIZWROap3V?=
 =?us-ascii?Q?s833EDO7pPqpeaV4A28+UAypsKZ2KdugcGjIYGWtiHODN5pIvajpxO+C2rAl?=
 =?us-ascii?Q?w07wNr+/Xf99NlGT8ZFXuycR1hTXpX+sgOyYxMtY12EMBLLpO1AV3+Zk10og?=
 =?us-ascii?Q?KPisThnPaWLZFp85K+FfoJaFL4I0CWfSmrDfP1wiEVNyIm2PIhPmlHqv3Zmw?=
 =?us-ascii?Q?lgp+uqTNs1PGX43zXWsfHSmiOZ237PIAud128ne/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e0bcad-6be1-48e2-b60b-08dde7222a8e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:33:28.6260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EkTvRK5Ie3pSE2/WgpCa2gpFsRL/8Aj0ZD7JAngWWIEj3p8WhXu8fxi1R0NNM+cQuesmtIkRjFY8mTsosQftFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4069
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
 drivers/gpu/nova-core/gsp/sequencer.rs | 47 ++++++++++++++++++++++++--
 drivers/gpu/nova-core/nvfw.rs          |  1 -
 3 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index 58478ada6d3e..c9ab375fd8a1 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -35,7 +35,6 @@ pub(crate) fn clear_swgen0_intr(&self, bar: &Bar0) {
     }
 
     /// Function to check if GSP reload/resume has completed during the boot process.
-    #[expect(dead_code)]
     pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Result<bool> {
         wait_on(timeout, || {
             let val = regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar);
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 826c06041e41..cb21c060e09b 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -43,6 +43,7 @@ pub(crate) enum GspSeqCmd {
     CoreReset,
     CoreStart,
     CoreWaitForHalt,
+    CoreResume,
 }
 
 impl GspSeqCmd {
@@ -71,6 +72,7 @@ pub(crate) fn from_fw_cmd(cmd: &fw::GSP_SEQUENCER_BUFFER_CMD) -> Result<Self> {
             fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT => {
                 Ok(GspSeqCmd::CoreWaitForHalt)
             }
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME => Ok(GspSeqCmd::CoreResume),
             _ => Err(EINVAL),
         }
     }
@@ -93,7 +95,10 @@ pub(crate) fn size_bytes(&self) -> usize {
         let opcode_size = size_of::<fw::GSP_SEQ_BUF_OPCODE>();
         match self {
             // Each simple command type just adds 4 bytes (opcode_size) for the header
-            GspSeqCmd::CoreReset | GspSeqCmd::CoreStart | GspSeqCmd::CoreWaitForHalt => opcode_size,
+            GspSeqCmd::CoreReset
+            | GspSeqCmd::CoreStart
+            | GspSeqCmd::CoreWaitForHalt
+            | GspSeqCmd::CoreResume => opcode_size,
 
             // For commands with payloads, add the payload size in bytes
             GspSeqCmd::RegWrite(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE>(),
@@ -107,7 +112,6 @@ pub(crate) fn size_bytes(&self) -> usize {
     }
 }
 
-#[expect(dead_code)]
 pub(crate) struct GspSequencer<'a> {
     pub seq_info: GspSequencerInfo<'a>,
     pub bar: &'a Bar0,
@@ -252,6 +256,45 @@ fn run(&self, seq: &GspSequencer<'_>) -> Result {
                 seq.gsp_falcon.wait_till_halted(seq.bar)?;
                 Ok(())
             }
+            GspSeqCmd::CoreResume => {
+                dev_dbg!(seq.dev, "CoreResume\n");
+                // At this point, 'SEC2-RTOS' has been loaded into SEC2 by the sequencer
+                // but neither SEC2-RTOS nor GSP-RM is running yet. This part of the
+                // sequencer will start both.
+
+                // First prepare the GSP for resume.
+                seq.gsp_falcon.reset(seq.bar)?;
+                seq.gsp_falcon.write_mailboxes(
+                    seq.bar,
+                    Some(seq.libos_dma_handle as u32),
+                    Some((seq.libos_dma_handle >> 32) as u32),
+                )?;
+
+                // Now start the SEC2, this will resume GSP-RM on the GSP.
+                seq.sec2_falcon.start(seq.bar)?;
+
+                // Check if GSP-RM resumed.
+                seq.gsp_falcon
+                    .check_reload_completed(seq.bar, Delta::from_secs(2))?;
+
+                // Check for any errors in the SEC2 mailbox registers.
+                let mbox0 = seq.sec2_falcon.read_mailbox0(seq.bar)?;
+                if mbox0 != 0 {
+                    dev_err!(seq.dev, "Sequencer: sec2 errors: {:?}\n", mbox0);
+                    return Err(EIO);
+                }
+
+                // Write the OS version to the GSP falcon.
+                seq.gsp_falcon
+                    .write_os_version(seq.bar, seq.fw.gsp_bootloader.app_version)?;
+
+                // Check if the RISC-V core is active, return error if not
+                if !seq.gsp_falcon.is_riscv_active(seq.bar)? {
+                    dev_err!(seq.dev, "Sequencer: RISC-V core is not active\n");
+                    return Err(EIO);
+                }
+                Ok(())
+            }
         }
     }
 }
diff --git a/drivers/gpu/nova-core/nvfw.rs b/drivers/gpu/nova-core/nvfw.rs
index 0b44a922fe5d..39e5f3d5b432 100644
--- a/drivers/gpu/nova-core/nvfw.rs
+++ b/drivers/gpu/nova-core/nvfw.rs
@@ -41,7 +41,6 @@ pub(crate) struct LibosParams {
 /// addresses of the GSP bootloader and firmware.
 pub(crate) use r570_144::GspFwWprMeta;
 
-#[expect(unused_imports)]
 pub(crate) use r570_144::{
     rpc_run_cpu_sequencer_v17_00,
     // Core GSP structures
-- 
2.34.1

