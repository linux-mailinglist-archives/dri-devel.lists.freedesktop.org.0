Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A826C29AA5
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 00:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4395E10E13C;
	Sun,  2 Nov 2025 23:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jtR9TZGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010061.outbound.protection.outlook.com
 [52.101.193.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70C910E04E;
 Sun,  2 Nov 2025 23:59:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9lRGjIPgamLRxhXBBeSWrZg+gRNozeYhe2AsPtoC++GdxprPBnH02OcHRs/KgQGLIHgr/nVv7UeDFOM+7LCiv+2nXhCodqhY0hFRWgBUhfyC8Z1ea9PxsSLZUBwLPw28/j+m9MS3+Cv97uL+V5NpsWcumOJxxZ62OJ4Uh5Wj4NepfUrAQnpQffNHFmrwxmpZvK/y3CRsLr/53JMJe7F5bqEQts2EHhwOfpD9nQxwMj2yhZSGvH0HI2QjYDFk3NaszY+Sy9PD6V6hmPNBed4wmoPUMihpV0kKux4s/U6SUAvQYAf7hHfj9PclUNxVHl29SkfKggKwPJ3DfaNIa+1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQf540ABvoaQFFyzV6U/T0+g6se5dzHoynFnONLItys=;
 b=mLuFOMz+10Iwm4FO2p/7/RmsnMSLg5nJ0Maj+qqMVym91STy2pw+2kmKZXzSHtqrKHaatZX+3J65DN095DaejTTxH+/az6yRJ0bu1pVeutzD1hlkuMMd++Ky2PWW5MmJedJMcRXv4Bnk52L5iYimTCj0AfpTxy1z5k/2CsE9JeRbhiKxcsrp9loISE/nlasj2KVdp9rqgVCWqCxMgEK7iBzq8UI9Ffglq8KdUVhV6Pib8+OpbS7Y9q1iEPwcc4YkuFrsFvhVeHN3LtSQnHvBRogTuo99lZ+54XQNolSNM8VmYCASKJKO3fwhejhfNG0IKByFcDo4DXb5AIyaFJXItA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQf540ABvoaQFFyzV6U/T0+g6se5dzHoynFnONLItys=;
 b=jtR9TZGgfyr3iTy1uPT3cj95jIMdow1zweYdoEKiMUn6rE90AsC6cuP88WU1KvyhWOGEfwyIHRhC0QTyAh3SwBxu0OMGreoauh3A/fdWzbCokkdFVdhD/ELry3Ze+PNGcrNV4RIc55kMhMBAlpGlnXmqeJMMlccVoiFZoKhFLF49T/Q2O/Wg63xDYZqssmfujCnR8wlaXYha7smDNWIXEuhtaISmmAUrujF1S13t/epa8beb4JuMPc6SaM6I2TwLMlMFFl8FhLnY0fDvg+BpDkSVUAMA9vUZaW7Z0KtucUhsJSSIkvshKeR9aY+/fC+vQXXVydHW4+P2gLpnE1TmKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 23:59:30 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 23:59:30 +0000
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
Subject: [PATCH v2 01/12] nova-core: falcon: Move waiting until halted to a
 helper
Date: Sun,  2 Nov 2025 18:59:09 -0500
Message-Id: <20251102235920.3784592-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251102235920.3784592-1-joelagnelf@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0023.prod.exchangelabs.com
 (2603:10b6:207:18::36) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: 474f4267-733d-4e78-ba0c-08de1a6bdca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VGmHbG+4v8kiOSsKewpmUN5VEBE8EJLZN36QpkgoZeb3lfvmYU+S2yG/3Tdi?=
 =?us-ascii?Q?EpnStyVJ62ZL5UQdVJNpcztfJfFlqJmCRe+NnEUZAlCm4LjU7gkV3KdU9KJm?=
 =?us-ascii?Q?Im8St3byr/ZXJlgl6jrzVTD2HU2jXbXwz/yJudVIRTyxwN9FsI6dQ0euoUXD?=
 =?us-ascii?Q?QK9Z5oa6nRuA3skDOqJXWex3DqWQHcpNGxPnOkV9B60h4gmkKMysxw7isWkx?=
 =?us-ascii?Q?zxP975bEBUa6n0q7BRV/+5oRyp4KeXFf597KK1/n1cCCm8dh/Ddc/sC+3tsy?=
 =?us-ascii?Q?fZl36iFiGBFmZq3UsOFhhYQVGsXl8g/r1nPD4j37SEpx4V2/F9CI1ovfuIS/?=
 =?us-ascii?Q?U0py7uxFI1n/TWGHfuce32IdhDwhfMenAYK6kbjkIS1NQX/4cya3YQ/MdmuS?=
 =?us-ascii?Q?FXPTk5GEqsaoBM1NIJpTH7Rc0YP3KzNZsp0xh9LASqVFzLD6ndop/OWKPBNW?=
 =?us-ascii?Q?XEYrba5tqhlH31bQ6KkHHCGjLZEKGEOkb+exJKJkW9jojyNYRIEqBHZmFspq?=
 =?us-ascii?Q?zxJ/mxhkdWdTNvJfTBpgUReLD+cDmja4kbSQU4qAzE0QPQKF76QAGYVsxC3a?=
 =?us-ascii?Q?K+zkQas0K5dt5+qWCZwXZrrx4Z0uf5w2rM8AVbEOU3IliMHa12JBCRm2hig1?=
 =?us-ascii?Q?3bOJtO0RZD3VgxhVK+v7J/UokNuF9D7jWmWPKrw9aO1v8yhnYc8w4suIHHoA?=
 =?us-ascii?Q?Waf9K/fyEnM/eAtDqKVvNIXD4i9xyiTvVX2zLj2MumGudupG4Lyh0RivxMAL?=
 =?us-ascii?Q?vstjzoy8gYwRQQynr+NGd3IYVIRT8U+lNNihkfU6byE6hBhD+HWU77Qrof81?=
 =?us-ascii?Q?llKs8HniMjqwgS8AioLr+chS1eSmE5pKdSUnBUXP6jzz6xC7aRVXmPOh/jly?=
 =?us-ascii?Q?zmJ243cFOQWrku+EwtZrh/Q5IqPFoq0HRAeQG/+3kpTWdtNjZTkkIUUAcsoQ?=
 =?us-ascii?Q?MCcNFycgPO08hD/+7u6dmpxRYVCnNZaEDsmvVBlxwdRKBVQGaJtsLAaCqMZl?=
 =?us-ascii?Q?U4+BQvYILoEm0pbSjRaqMIN2vYKhEwKe6BkmA+ir9m1Rc6FdcnT2K3CI3xvc?=
 =?us-ascii?Q?IJY+12F0MJjkoi35+gemR42iOyeYy892XMG5utpvfcidnbyBRvZpWuo5wwmk?=
 =?us-ascii?Q?Xqdl6zHfN34OJG0NNQHNxkT4LlXp5QUI7LskUx/jdPtRASlB76T+1uN38DeH?=
 =?us-ascii?Q?vKzaQfciEDIVs32a4bj2kcfWLBCITyeYcvmVTG9UiSCSEBAOQjvnldp3QCeY?=
 =?us-ascii?Q?TT5KAbnebnCHVoPF1kcKygRsMsWdnUufgkhnwxWhwynQr+wPh6cctPHlmj90?=
 =?us-ascii?Q?ilPVqFxlUD7zxHiFi8inAHbGmqkeMCInqLiOEzXK/UfSUuKqQy+orPDc4mBW?=
 =?us-ascii?Q?k/qrr1e8CWDVyoZkO6EPfiFcqX97blhT80mvx79X4jEgplD14QmKNszXJUAp?=
 =?us-ascii?Q?sCBYAyXfDg1JZ2XOGHlaj3x2q/CfxvbB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yLe5anqiA+fi2Fcw7HrSzVZjh523DMsYoz6EjxO1UtciUP50ipA/BM5AztmR?=
 =?us-ascii?Q?gGBVY4VtVqo/qNZw2SmtbOrBuiiUrPXNrMuAl16Pe2azZeDS2lPTLMk/tpvO?=
 =?us-ascii?Q?lzDmFK/EfxO9zSz7KuWhfgIHzgXHYmDKW7TV89fNCFf3mMHNw3zZqhAhyOgd?=
 =?us-ascii?Q?AXG3ORGDPgIyrPMuTlXxTxTklQaGp9KPo7+fbeL4lHazob/hS0qKWL/SadTi?=
 =?us-ascii?Q?gbOiyYBmqjOXcYpKaQ66qbfguB8NqmNDe3ihesCcDeQ5W/pAAd/PHrB4WhX3?=
 =?us-ascii?Q?+U2+FYSX/VGWNYrTynHcAMd/IMDbok4z6JG1Rfia1w6BV8eJaAZZmYreNi39?=
 =?us-ascii?Q?TgdxdaZr8+/n6d+gtjW4D+yqQx33JnC4Lm0tslIjKDI4h00P+kqvG4xTH4G5?=
 =?us-ascii?Q?cTeNzVQ0x6xLA7G8K1u7ZUWlCCRs8BdRdRORkMCc5eG4FbA9b1L90863+nAM?=
 =?us-ascii?Q?Kln6bveVzSbweW/yYYwJ2ydPrQG7YtkCQtWXse/yjYDHH1Ib86Hgn+Sx7iNS?=
 =?us-ascii?Q?nsPw3YIfFa4WsbbgieQODIVgQqUxePar5A5LEMQz2O1EKbn2pktFOe3U0bA8?=
 =?us-ascii?Q?CBcGlDjtzfwZJswZ1Fc2raCBIc7LVniUB/yKbkGAt/ubYst2L226+GjCmnQi?=
 =?us-ascii?Q?PyQeUy9ycFWgcRVroqclxZumPCiFHUcfFPn+Dhd+PbJRirBnXNgZEb7eiX+k?=
 =?us-ascii?Q?Mmey0/fiZ91NSy98+cfRxa7GiIy7jAyEwZwLZmsTznvNlqJmgIlLmjVyuAPr?=
 =?us-ascii?Q?tTdLNUf6r1RChj7byNqoh2ozO93CryAzmmDMagevPvXcnGLs+WvlBV3PtVx8?=
 =?us-ascii?Q?m0vr0EoTVPOg3x7PO6M013iVs0ARHb4AV/XPFu+zX8okagebRq/NevXdB4gH?=
 =?us-ascii?Q?tq9F4K5A6zs0msdIL/jr0mf/DY5zKUA046Oh+D5TNKc/F69C6T7I7TVxpZbw?=
 =?us-ascii?Q?i0XtfOjkaV87l6pY+Ld9E3qPAUt7u9tdXRybQeDx1kliZuMGYDTO+pzkuPwB?=
 =?us-ascii?Q?9ZYJ5pPQmhJl2Jv+9e1XsSxl+9oBYCstwtX4tj10/JwOJ3yQyor+dVGwXc5n?=
 =?us-ascii?Q?FGTCkhydGCWf3IJjR/PGjHR/6qSF0TV5JpRsIOyW6sBxbbLiLhk8+TRjuRFv?=
 =?us-ascii?Q?MPQqipHnuI0V6dmQa+1MxBiasS9ByzPi6yL0b0NkiJLM7kZKQNPJ/siEipex?=
 =?us-ascii?Q?JpHYnNRebifB/5PCWEcqcxb2A/60STUFvHEsL8DgJCHGpbWLYVyOr33hSzJa?=
 =?us-ascii?Q?Khm3Jsq0aO+7IE4xNyB/uaofaEEeEJpLd+ccavCZK7RwTk5qRgVs1nE98wTC?=
 =?us-ascii?Q?ddOsjYRXWJueTXbatcSr6Pb7EB+l/tKUxUCXabyl30FPLOOphhPS1Z05LQZZ?=
 =?us-ascii?Q?sTzestbalacOPCBjTAPesttad0/UbpIbb54Wia5YJOK8WCm7xALYxEmDBpH8?=
 =?us-ascii?Q?LmZJI9aQrIh/gSvorX0TGT1HXrDxOzTBLwQOFKVJew0WMHCFICcYe7dAc3fU?=
 =?us-ascii?Q?Gh/rpHiAfk+s57DdciQJ3BvpmL5nZfWtsQPvrPF5kUAvyovWv5MDGiqCaT4i?=
 =?us-ascii?Q?MNjipdqtA5XN9FVZj1pW6iqAKHuuuU2FgOsNGGtV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 474f4267-733d-4e78-ba0c-08de1a6bdca5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 23:59:29.9838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MD4OF7dHYoQ4gcBXe21Qyg0dVjeS75ogFAcsCodZRIbNaFYGhJtnW0cy3wXR6r6x0JAuDhEXpq4llR3MOVHGNQ==
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

Move the "waiting until halted" functionality into a helper so that we
can use it in the sequencer, which is a separate sequencer operation.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index dc8c2179935e..dc883ce5f28b 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -540,6 +540,19 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
         Ok(())
     }
 
+    /// Wait until the falcon CPU is halted.
+    pub(crate) fn wait_till_halted(&self, bar: &Bar0) -> Result<()> {
+        // TIMEOUT: arbitrarily large value, firmwares should complete in less than 2 seconds.
+        read_poll_timeout(
+            || Ok(regs::NV_PFALCON_FALCON_CPUCTL::read(bar, &E::ID)),
+            |r| r.halted(),
+            Delta::ZERO,
+            Delta::from_secs(2),
+        )?;
+
+        Ok(())
+    }
+
     /// Runs the loaded firmware and waits for its completion.
     ///
     /// `mbox0` and `mbox1` are optional parameters to write into the `MBOX0` and `MBOX1` registers
@@ -574,13 +587,7 @@ pub(crate) fn boot(
                 .write(bar, &E::ID),
         }
 
-        // TIMEOUT: arbitrarily large value, firmwares should complete in less than 2 seconds.
-        read_poll_timeout(
-            || Ok(regs::NV_PFALCON_FALCON_CPUCTL::read(bar, &E::ID)),
-            |r| r.halted(),
-            Delta::ZERO,
-            Delta::from_secs(2),
-        )?;
+        self.wait_till_halted(bar)?;
 
         let (mbox0, mbox1) = (
             regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, &E::ID).value(),
-- 
2.34.1

