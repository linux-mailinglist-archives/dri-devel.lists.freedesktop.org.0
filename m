Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48B0C554C7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 02:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0D710E7DC;
	Thu, 13 Nov 2025 01:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hR8H1lzh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012014.outbound.protection.outlook.com [52.101.43.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392A110E7D8;
 Thu, 13 Nov 2025 01:41:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYHG/6TVEPVfzP9R4MesMqZuGHj6OcnEIshb0vSuYMJB37uiMCYMMJ1qqDqZOa5H9eOyhFt8vDP5irUuxEmW2lAiM1/g1bAWmlREks287IrJrxnda+uG8b4mxz/bescN5AMr58vkBD2jWhkDmUnXhcbA0fUzJ8SONGrWbc0rIzpLxsc0ORJFnh9F8yLX5ITYKoj47KnW1YTdyTY3XRA1ZcsBOuPlnZWerLXyRiSe4wSMjhEGhRpaIkWwIse0Wmv2vKQ4zte9Jreh/aNjtsGGRIRXFcU2lLlHWZAj1I8xj0jZ8K/G14pufYDMqPYJj4l4z2LQepUpkSLh9FXjs4tLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtwYgIbgoGgteX+Qot2C3R83ESfTueZX8TrYabxZtUQ=;
 b=TyDIs11Ha4VsE0sHNXjHulmPaGffWyEeo4EsoMsPgDJEF8Vw9p0v5f9cEEFgF5KpeOd/VLLtVmskVDc+zwAutiyHxHN4evdDbyMKjmt4USzc5JRicHIJZv77fOxTcdA/C9X7jFNG/eBgSfBZthjC8jAOHoPlpGSORoM67wzhIeGj5DsF7Q0ldsAfZOAabqWRDfj25saQuDCVBkG5o3GnkDGvdXun9KQ4LB4PsDfL7okSihEUpqwOPkpRC96CaNzksXb43RSpJWU2GGLxwXWYKR/gSgBlnjj4z8jJtfRg56CpVlhPwv1PQU+AK+vySJX2PJDiGzCrovxc0MDsZ+Qj2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtwYgIbgoGgteX+Qot2C3R83ESfTueZX8TrYabxZtUQ=;
 b=hR8H1lzhikI/oBoGLan7c1XccWwkufmY+prXlSfExX0QkIMBAc04tjus0ia3Rn+IrcN2vfFFcYRjmm+OUPNyyR0UkKas1Ran7wIvjQPsIz5u/X1eEptKYBJrxfNpw0pwf7P4SnT2bGMbPo6ua/eNhYM8NMFnGBlVfSbBaoldV9lheMq5sMHejfiHFSgeMTIHt/1tnbZ3NGLfLQ5pg/suPeqmSwBXjKfo2qfjDAVhBOOl3VkW3zyJRBvjr+YYqlrn93GXtsRKLWSd2ixcfjUzU1znSwb/9J256SrDyTNNmkcd0zt5fvE1YWWX30DRdNrEsIT8HwtZcAiP3FrKtTDUCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by SA5PPFD8C5D7E64.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 01:41:40 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 01:41:40 +0000
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
Subject: [PATCH v4 11/13] gpu: nova-core: sequencer: Implement core resume
 operation
Date: Wed, 12 Nov 2025 20:41:17 -0500
Message-Id: <20251113014119.1286886-12-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113014119.1286886-1-joelagnelf@nvidia.com>
References: <20251113014119.1286886-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:208:256::28) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|SA5PPFD8C5D7E64:EE_
X-MS-Office365-Filtering-Correlation-Id: 81cab5d6-e1d0-4874-40d2-08de2255cae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IgSEse3QGvQtGEolmDS6leGZ5vOXCAOT/6JGwd3tpBbM2eUKxpGwv/bQC0OQ?=
 =?us-ascii?Q?nX7waQRT+vqOUuKYcdl7zxBiNsUl/Pf9wVAW+VHDPwHwAgdYfcNSFd69c1RI?=
 =?us-ascii?Q?btpYLS7lYRZ+ZnZoFaawmw2bXTL34UF2gKjhOfujbypNw7BidvWhwvBWOJCU?=
 =?us-ascii?Q?IUstjxcYE1YstwpRmhKZInWefpvcGpAvcv3FZIwG9kotSjUnFxzH7GZccfSP?=
 =?us-ascii?Q?oLU+llJ4S+bgKF2WYJ5Zsag+0V/bjMl2zvAMn5sqPCpxbX4v2hGKr9HmRx1j?=
 =?us-ascii?Q?ftb93Gac6XULFtiIb/o+Qp0PN/epuaCljpzBTm9Gu9MmIGIltambxhYM1bmu?=
 =?us-ascii?Q?cTzUU4PrCzOV8ex/XTIdWgplD9nqm4/B/jJf2Lwp755jer+5AzDntswX85CT?=
 =?us-ascii?Q?PxPz1QC+a4APQX9kKwxGoPXutQHRE4x2smYWisimWOddsRiYuNBlC5gB68OW?=
 =?us-ascii?Q?istOn5MvojKFLcg7e9DatuXzsZk4gih0oUzHuqkxZmPSXaXFIdhavwOQg08X?=
 =?us-ascii?Q?kF3ch/tqaZZiwy5YgvMyG14h/ZWhoTxVbypmtDigQMrTqY16mDPxdkeU8wyE?=
 =?us-ascii?Q?IK9+edTAYLeJXi53EnHX9YYNRV14l1h9pyY60Ak+rcSVzRY5kYvNAuV1Fw4G?=
 =?us-ascii?Q?Vz0IbRMG6qbhL+SmqZ11ZJ2FGDjI7IYQ4Fr0ovZvhp6yJKR08z7Efi3GnqGx?=
 =?us-ascii?Q?V0xaT9QjWBcszu2hHiSYyu0+PpL9SjHB7y+BkwWPuO/6HHQpY113fH0UWDt0?=
 =?us-ascii?Q?GZwsz1BBu63N1sG89Rgy2+/V12yXbd76qNU0w4DIlwRqCBfsmVWiNdpAaTc4?=
 =?us-ascii?Q?N9vxgbULl+4mIeyKhTb42VlYXeI4dcfkXnrroW4NQFkSw9I5zLpbaWYQVLle?=
 =?us-ascii?Q?L7G74QPqz3fUfzzKSOvsPGhllIK/13XXw2qBlbXyBSR/YuVBtMQgs+NJrbuc?=
 =?us-ascii?Q?mtdOPPVWxiVN79epprZR+eIGR54t5OyXZKX3arZSQmjM/JsMgLtm2rDD/QSh?=
 =?us-ascii?Q?+yz/jH4ALNEvjPCsGTbeCEwYPWyA1xVfu6IgXyi3pgqA2ZvdR1Ifb5Y8EnwG?=
 =?us-ascii?Q?VKFuVtoLJCWB+djX5C6Dufp4YipPqaTk+JtnIUtOoYchp0wKm5pQh/w9Xafl?=
 =?us-ascii?Q?BJFNlev92c9POLSPVh2C8fZDzXhFGMie5XT36ZDKk4tmDXHQxiC7+VAIPSoY?=
 =?us-ascii?Q?+r48QWSzndZnH2QEDNuSFTJYuAJDrfZsmO02Ab6w5JBgYEKDOal9f+61wGpL?=
 =?us-ascii?Q?4ctYzi4qVYMGKPhsxTJTBFRvle0FjGx28oonV6SEex4Hgb3Et6hTP5Ntn8NQ?=
 =?us-ascii?Q?HaS5/m0BTwlPSQazWKLt1/EC/3il3C7xjBnf9LRwUPmxvFKAPFgQZKe3nq51?=
 =?us-ascii?Q?SaTYqJ/o0kHGgSvYE8yB/rs8XBd5i9qoLnkGMLkEg1RBZS2BTvUocF1bgf3l?=
 =?us-ascii?Q?UzCmXp3n7ndIbsehsc0LbKPLEUNllIAt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ib90MPP/FQbJybtUyUbFcJ8cfacHdwOvl3cn8SjEKFjlYu9J3RP1slk2Z2pG?=
 =?us-ascii?Q?UxZ1OXXl7shnTuBtwmYSAQMGpenJ2Gh5CtTUhXlf7h7z2ZGkMbrkOangKSrZ?=
 =?us-ascii?Q?uKMIsav1Bb/spE7VbHN7fwh/McreVwnVj+xA12dYG++m92aoVc6qr+C0BmOT?=
 =?us-ascii?Q?7+jQONepnzAD0MJaUq+Fd8QvkOSdxb1wyqK4H8ZaTifu1slXQ1wQhOgpJrgi?=
 =?us-ascii?Q?lrujf7/9V5MnbAQsQ6j3D7OnBjV9vqGxSyML/sQGlydgXXPwtCHC+rMv9vpw?=
 =?us-ascii?Q?1zMvQkLUmCmRbfoxOMQMvHpSNBCqqunxnRs19ddVTON563AvquwjdNy82eFy?=
 =?us-ascii?Q?V6+9kuXHAeh6jzZhhFt0uoXFj2rpezceuRE+B4Q3a1D1GK6K9cML3avcSHFR?=
 =?us-ascii?Q?g0il/rxXo/mCcxjl9q8mvadVm5Wbp1xr1nYx/n9WR4CfTtcODoY8H9z3eZ5U?=
 =?us-ascii?Q?g67WNvxPHG52iC2Mh7wi+rGj+rHz0brMmOwCc7xmMmp2+VsN8+AqhPGOR3e7?=
 =?us-ascii?Q?MyAavzCe4SQHj3M9JHvBPLD+OKDHCs4Tf0hj07H7yGPM1ctu16rF+QerPbb+?=
 =?us-ascii?Q?tNQ2C0xxRsUlIcjEOUuqYehVVF53ckwtduqLZy6vOvlp3GzSFpcD5MYivPkG?=
 =?us-ascii?Q?+vDnFxg1RkT+U3iFJ6DGnx84PK7jeHOYusauPe/Y8JQqYFEkPPa3OMT4a9cN?=
 =?us-ascii?Q?a9SEloOefqTFNdT/UYKkabtvYriI9hxK+yxXZ33msngHpcgUvOvTSNad9qtX?=
 =?us-ascii?Q?gpRigV02uMu3bUD/Es2WVbcvpfLoXfKUefl0uBsKbq7QZCU1yWZwo5ExBxOz?=
 =?us-ascii?Q?nB3SfRNQ4kZJedN+BpedT7q8J3EYjvj9Fs39vHdpQmOII9rFn+QTJcNkS+7P?=
 =?us-ascii?Q?7x5gE1fxvGxrRq4QaCFm919j/PYW8cKDkx6iT1UQ6EDguFt3w86t9eHqyoSF?=
 =?us-ascii?Q?QwcStKM2viUThmczIWMMDx7dQyksMVQAa0+IcuwQKyC/S69FtvWIM6bJkCiL?=
 =?us-ascii?Q?nPhxnomY/mLqMJ2lDBK0vDtmULtY/xGbfrruzSev/6GttixjrmnzqRoTcX4a?=
 =?us-ascii?Q?ZnmSf2RduwNUxgsYiXTykXy2ITU1shtWywnQ5ihSSJPYUvRPYz8tZ4q7UrS3?=
 =?us-ascii?Q?gyZ+pwVn6dJlfZgUFQ4Eg4i4u6hTutUl9mv3zqP2+kLv+vjTFl9bojiKrWI3?=
 =?us-ascii?Q?aE2Frph5uceXcNewQZL8Udw69aGMpTCo+azvNluRNu6PhQCVrrZaOOY9qFoC?=
 =?us-ascii?Q?jAJxJRfIojtnYQwvXttZ2LrVqcxpI7wFjcqsRQBM1EZX6VMzjY76Bzc5awu/?=
 =?us-ascii?Q?jb19xQY4P8rq+dH6XtRJ2MfRd8ZAsCALBz5pr+dztOAjpTyKQql3CtSFMrSQ?=
 =?us-ascii?Q?plb9FLiHPHB7BpH0KVAu3cH7xFQ5OXOGGeeMHm/7gt5c0mBQgcmRkQwwantt?=
 =?us-ascii?Q?cvmI8AsXB5QKkb0G8IY8cclDJor7YqM8Y2a+ku9DtCNHM8u/XHCCNH+F/E2e?=
 =?us-ascii?Q?evuJ74nMKXSRdQoPCRo4BGACseDcEP1mZJ0EsosDD3EPYANZSAi1voj9PkuP?=
 =?us-ascii?Q?3/bQPQd3bjWND9wDHwUB9a2At9G9kgr/pwHWIDYZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81cab5d6-e1d0-4874-40d2-08de2255cae5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 01:41:40.5929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZN9rMWTcMo8fmRTR8JIKPKecy7XPwFurwgvZori2UqfHZzcF3DO94Mgc4mdYX/3rqDpcASXbuWkEYPpFmSfqZg==
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

Implement core resume operation. This is the last step of the sequencer
resulting in resume of the GSP and proceeding to INIT_DONE stage of GSP
boot.

Reviewed-by: Lyude Paul <lyude@redhat.com>
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
index 93c8f84e032b..a10758ffa5e8 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -93,6 +93,7 @@ pub(crate) enum GspSeqCmd {
     CoreReset,
     CoreStart,
     CoreWaitForHalt,
+    CoreResume,
 }
 
 impl GspSeqCmd {
@@ -130,7 +131,7 @@ pub(crate) fn new(data: &[u8], dev: &device::Device) -> Result<(Self, usize)> {
             fw::SeqBufOpcode::CoreReset => (GspSeqCmd::CoreReset, opcode_size),
             fw::SeqBufOpcode::CoreStart => (GspSeqCmd::CoreStart, opcode_size),
             fw::SeqBufOpcode::CoreWaitForHalt => (GspSeqCmd::CoreWaitForHalt, opcode_size),
-            _ => return Err(EINVAL),
+            fw::SeqBufOpcode::CoreResume => (GspSeqCmd::CoreResume, opcode_size),
         };
 
         if data.len() < size {
@@ -143,7 +144,6 @@ pub(crate) fn new(data: &[u8], dev: &device::Device) -> Result<(Self, usize)> {
 }
 
 /// GSP Sequencer for executing firmware commands during boot.
-#[expect(dead_code)]
 pub(crate) struct GspSequencer<'a> {
     /// Sequencer information with command data.
     seq_info: GspSequencerInfo,
@@ -251,6 +251,46 @@ fn run(&self, seq: &GspSequencer<'_>) -> Result {
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

