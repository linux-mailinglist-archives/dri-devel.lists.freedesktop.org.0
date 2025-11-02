Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EE7C29AAE
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 00:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A88D10E17F;
	Sun,  2 Nov 2025 23:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P52JbIPu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011000.outbound.protection.outlook.com [40.107.208.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205DA10E17F;
 Sun,  2 Nov 2025 23:59:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uP/LuYb1DhqRidyq1hOiZOyqzekbZsSaNXnTY3867ReUdY/vUgfAV6GzCNH1nXb5sWrJ+mtFDydHeKhoUxD3DL3CT98Z+F7AODf6YU0Fx/5U2iHCMrLey4eOQ1k5GyhxjGWzrKlqT7A3RKhGhOLuy0EyS8Pl17KIo4AjUab6IdNlSjTpN2YXWZ1YG2iM3si9cw8oplpRwbCQyqhDst0EHdJQhYISdYZ3Ig589WhqR76oY/cprKEOQml5iZAXKOCFD9YAIaO0R0ozg/mJwigsFJQWQNdSahqW7W4ym5UKB4G4XUd7kzpKbaOt48/0M9xX9C1iqhFHDZrnKkBSOzNdeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8P8RMm0AZYw67O2qNwQxfvTCeNa9JKKoJmBq0Vg2LBY=;
 b=kkhxn4ECxvvFmdXYnOcsU5bdBC+pCqj18iLkgNAgvC22SJhlc/rubjwp7dHW8WsOj9MkIqkT3xdVObH08nrqMbRNnes9ySx2Gscn18AfpiwSq/pHDTodAjqVFoMFwxxbeYji54lJVmW2Jp8sCe5/SxP1ZeTUPUNWXKzrbOWnDJItBR0H72Pua6Uv/pvQNF8VREhAA5n2f6hClMx9LpshRtL9TAmAxHeIfXOh5tuT4tnFGmoPtCxqZrB6zMM0rm3iRcJn8mZeESTHzr1mF7EnU+bu6W48ptiNQAOmFY4iXRsumYW7+s2PtPBZ+88HVxzDXN696vhvPDyGXM5fj1mGQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8P8RMm0AZYw67O2qNwQxfvTCeNa9JKKoJmBq0Vg2LBY=;
 b=P52JbIPu41IG1GZo46Eusx3IPuM+Kqm3ZwvhzOCmtc3Kyx4NJaoexTFm/IxUO5liBSE2qHR5VzyYUm6ZKIqXj2iWZvulxzOI9/je35dd0gFyyzw/SDHnbiHVMLjL5eFrdepEEQ6itwVfIXF5njHKCaEkA6n2/eYXPY5kmqJ7IWkCg8NpKUMjsijuWuCbjWDaGJrJVopJu4ZdiPtxCk5mXPGPQJ4e21MyOv2HYMgoQAsw0wMCYWJS4WNKrSNv7BsSx2TeA+kQCNSvIfudNWnTXvw4Gj1SRtyRVx+JU1GQS0MdR2KbVUUxK4Agxcv37c6EczHEVa5kStX2kH+jPlJ3SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 23:59:33 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 23:59:33 +0000
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
Subject: [PATCH v2 03/12] nova-core: falcon: Move mbox functionalities into
 helper
Date: Sun,  2 Nov 2025 18:59:11 -0500
Message-Id: <20251102235920.3784592-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251102235920.3784592-1-joelagnelf@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:52c::21) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d091c0-1f9e-4e4a-79e9-08de1a6bde9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?35kkAIgIPH+1HFauquyyibI9cFAXA0lbAiol8PQaM22ObCCK4ZGEUhICuFzb?=
 =?us-ascii?Q?ZpedMJBws8zLY1TfGLikZS5sHIwYVbwqjosx8oXpx5PnfQ6uKBdRclzqJlRK?=
 =?us-ascii?Q?tTCza1AENkNSHB9lUbhV5pIlQjCqyiK7H/xJVERJaiCLXkWjwCV5r7yjEulW?=
 =?us-ascii?Q?ZfXXYO361ALl8tyO2AjSOxefyb+pedxXT9YaUQUAWgUwFxFGoD3wgGBNWLRf?=
 =?us-ascii?Q?64CbQXr3KMpO7q5WlXNVbhVbi/ry1+itdGdrh3ervUODQOz5o0/a1fjUcUJ0?=
 =?us-ascii?Q?ccDlNAp8+D8Kd7bRKTbEozJxBYsnGlQHFvOHGPgUxtnfRL79DhxLshoQg5Ut?=
 =?us-ascii?Q?4fnaD9tCBtlBW8122YDIc2ghCK9PIn4mGZGftF5EGGZD7t5N/7jRR70p0/6e?=
 =?us-ascii?Q?Uzba6TugPFi3Zu7K0e0W32V5yku0fBdzusxNf9BncK5bwIQ6bJSq0uPq8+fx?=
 =?us-ascii?Q?JZ+Xd6eD+f+21Dt1B11wra/pKQHGuol82937rX9gmfS8E3MJL02UHaoLcLmw?=
 =?us-ascii?Q?vV9qcU2jGmnWD2WU9FPur0vZDWv5snz/N40oNt6MoGQFiXQk3hzY/gZW7q2b?=
 =?us-ascii?Q?BWV4d6vCwM68SwB3l+ok5U9Nl8XXzoJKfV5rMAe7C77JxxPNAD16m1CKZncs?=
 =?us-ascii?Q?Xb+2fy8fIZek+HJjEL54dhVgCOeh/9gssO3s4zP3Kz4pzCnP7v55KGLiXRsO?=
 =?us-ascii?Q?OI7dTgyw40pnVxs2woT/2echGw+S+NzVNZhIzZBKxxtcpij6EniQ9ULKy61b?=
 =?us-ascii?Q?GlFxeHxJhxqRAXEBuwcSyOJFCHgjrtnXM/toq53Vk9okUjSEEdjrH3cpv92I?=
 =?us-ascii?Q?cs8qZkA6Qy3Y7CBnogW5q2xdgLkK4bBJLsPNJIimwHx9pkhYXsKr7SvXQVjo?=
 =?us-ascii?Q?mBB27MacPlu/FdFYDcA73HAy27p5H/ZTGKIIbiBMuhOrYlByo+sKTo0hqnWR?=
 =?us-ascii?Q?EAVwTu3nzKY7tR7xRUOu6ePVSvt67qJo+KmUIByqqbAOTNB2w8owCSB1dwv9?=
 =?us-ascii?Q?BMR8nnM2plESSLa02ksots0qSowBpGXk0irk9W3/HH97UEqkrhgrE0qaX79C?=
 =?us-ascii?Q?J+17TzhJrE3SiYfiL7/3nvZpM5BKzmGxr+T9t0A4msM4fUeJF7m8iQH/LHx0?=
 =?us-ascii?Q?TBxv1mYETlhDf5pqXDiLTmCFOjKuumAC3SF9PE5vQYNOoTEfNnew+jhcy5uQ?=
 =?us-ascii?Q?oM4SzqAszPIEGNSJ3QwjUVtYWwEcC7IK64XGfNK/vZ0RJku4fjJoYR09wPku?=
 =?us-ascii?Q?5i0XWpqTJL0r4cOTKZ41HX2H+L06GM1/7iUa0rRrmM95gWCbINg768sQTUvx?=
 =?us-ascii?Q?LQ9liP4ZYH2RPvj40hd3rQUu1FcEkB3c1ydOd0eorVrr2Be7YWMKsEkCdidc?=
 =?us-ascii?Q?WHx6y2P9pS67q+c0Px7A8qC7fYKKn1uKyD6MXUwpnTVO8i567F3nJZlbGOJG?=
 =?us-ascii?Q?eQlRUn7zw3sApyi04GWrPqRmB8RatTbk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a4xFWaeFGBGY8eyMSHc72Gc/F0S/ykynTCJeRDFf4SOyopI9q7oURp1e+Xno?=
 =?us-ascii?Q?TuAvmpgV6U8PF5wE4hk4qx82FY07nx1K+LMmYFxJY/PWMIVJWfAMbVazvgmM?=
 =?us-ascii?Q?h78NbQy84cvP7tBuMY/6ydLFNOxTY5C8nxb2m8umLPnSvuz7MzH92h4dnLvW?=
 =?us-ascii?Q?ElPPwk1uVG7Qr5G7I0Stu3UB+A1gJZqJVRnK/m5to1fHgeJgOug+oqjjDQ/l?=
 =?us-ascii?Q?iuD8VyA5cc7zIZPQp/+D7tZWOMQTf5uidGcBljaCU78NE2/roOzOjJLtXUWu?=
 =?us-ascii?Q?LgcWl3ekpiYdrPqg9wprGmZ0jIDNWmvuGKX4/9QEX9G1QVdfpLDJ7chphdb6?=
 =?us-ascii?Q?q5P/C63+XAhV40eFlZp4b9ic34wyjy8rzNXWgx37yVkZJ8bqOpW7GDDviVkG?=
 =?us-ascii?Q?gpU4L1/Z/sSUxgahNbK8dXzCJp2HlmpvuTOka967p3hxZLVcJdYp97GqDXQT?=
 =?us-ascii?Q?Fh1xSY/BQ+3yt8ZeeKTcp+lYqd2XJUkGzExF7TmyXiHXBSviXTdt569qBkKM?=
 =?us-ascii?Q?tZDO1BIubfD1B4f0fA2M8yo7QJVidDGIRR5ViWJRmTIVA8PHSR/13gdTZyEY?=
 =?us-ascii?Q?qrD/2c6MhW6qtQyzPJBQXxwAcxv6IpSRrgepLoAHM5elu+8SKIulj/ytvPVg?=
 =?us-ascii?Q?w0lX4sTZT1X3JcPMq4GpujjbqExcRSi5upsSDcouYlCqDtVxJ5clqBYRcf7S?=
 =?us-ascii?Q?edQrFvZ24IjhIsC9WfpD23a3JKKfz7TdeHiJ227nqyNCxsPwpRtP00qOHwut?=
 =?us-ascii?Q?Ff8W3XoHTz1WdIjUz/kefvPNeDoCzk8Ej7UST8qF04vZvgBesBmrI5tYEboj?=
 =?us-ascii?Q?BCy460PGoUJj3SHXyv8y6/hIB51kibK0KMfpWfaJXgEhemaLCccYXKuly6CF?=
 =?us-ascii?Q?snLuYtYnhhpVCFdAmaTM/hA/TnFy++iMC/pfUe+mnJwi/ZQZAcDS/MnpFktL?=
 =?us-ascii?Q?nqmtH32xrVcQNBPsLwmeblIJhriTgSmmp5Nj24jznGnwyZb1QLFLT98gNPMn?=
 =?us-ascii?Q?vKpVHp1Rfmh8+PqCKGR/6YXjQU1DI1LvHvkBI6fSCBhTi6yJ/Hs50gUMMDiH?=
 =?us-ascii?Q?r/VpVqFDhbi5lVLHMtR3tir2LFfojnj9cAC9h1wW+wqRjgBMUL2Oj8uKjVY1?=
 =?us-ascii?Q?teqWPeZULrfu5EE2pN9We2u4xBLeBX3vc/2iaZjhlYb6Cm6/CkxTL8nG7Fez?=
 =?us-ascii?Q?FGVqJAe+ECEahubs0w5WjhECSrO8gp8v9SMpCPclLTT60NrBFpsCXMllyBh1?=
 =?us-ascii?Q?p6cO6JwBt27u4wrz1hNa2qIMMY9gsvmQHlL7wDUaOehLbvPzmxNP1DgjVV3q?=
 =?us-ascii?Q?aA342tOsAXwh+nNoh/+N+VA35hZAj8YhuYP9o6FFbJy9zmqKf2ru4Wu1XagA?=
 =?us-ascii?Q?baDtmUOGt7BHTtwnGm2vL82brozJi7I8WDxpXES1Aje2SEstWfmDBbHQ8ccP?=
 =?us-ascii?Q?dNmVJPqBQ66/RK53vkDYx6QfRFpQnH8MU2Ck3WD9bvIK9CVPE8B3LyoeANLu?=
 =?us-ascii?Q?WaHd/yb2u8Id8tVwEvKoceFj6kW/FW532iSncHbxA5vTiQzQjjgPJ74uAPUA?=
 =?us-ascii?Q?BeOA0351YMxYHvTMdV/lCXQFYbT/xMJuw6Y0uq9q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d091c0-1f9e-4e4a-79e9-08de1a6bde9c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 23:59:33.2656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Q1k9cnfa6M0KmnPQlr3voAeqZHeU5seQqsJQ23Hu892cYhJMKMZ8l1NcFqSyzmuRilEGBZr3ZMO9YgMrFN7Nw==
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

Move falcon reading/writing to mbox functionality into helper so we can
use it from the sequencer resume flow.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 51 +++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 1bcee06fdec2..181347feb3ca 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -567,19 +567,13 @@ pub(crate) fn start(&self, bar: &Bar0) -> Result<()> {
         Ok(())
     }
 
-    /// Start running the loaded firmware.
-    ///
-    /// `mbox0` and `mbox1` are optional parameters to write into the `MBOX0` and `MBOX1` registers
-    /// prior to running.
-    ///
-    /// Wait up to two seconds for the firmware to complete, and return its exit status read from
-    /// the `MBOX0` and `MBOX1` registers.
-    pub(crate) fn boot(
+    /// Writes values to the mailbox registers if provided.
+    pub(crate) fn write_mailboxes(
         &self,
         bar: &Bar0,
         mbox0: Option<u32>,
         mbox1: Option<u32>,
-    ) -> Result<(u32, u32)> {
+    ) -> Result<()> {
         if let Some(mbox0) = mbox0 {
             regs::NV_PFALCON_FALCON_MAILBOX0::default()
                 .set_value(mbox0)
@@ -591,18 +585,45 @@ pub(crate) fn boot(
                 .set_value(mbox1)
                 .write(bar, &E::ID);
         }
+        Ok(())
+    }
 
-        self.start(bar)?;
-        self.wait_till_halted(bar)?;
+    /// Reads the value from mbox0 register.
+    pub(crate) fn read_mailbox0(&self, bar: &Bar0) -> Result<u32> {
+        Ok(regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, &E::ID).value())
+    }
 
-        let (mbox0, mbox1) = (
-            regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, &E::ID).value(),
-            regs::NV_PFALCON_FALCON_MAILBOX1::read(bar, &E::ID).value(),
-        );
+    /// Reads the value from mbox1 register.
+    pub(crate) fn read_mailbox1(&self, bar: &Bar0) -> Result<u32> {
+        Ok(regs::NV_PFALCON_FALCON_MAILBOX1::read(bar, &E::ID).value())
+    }
 
+    /// Reads values from both mailbox registers.
+    pub(crate) fn read_mailboxes(&self, bar: &Bar0) -> Result<(u32, u32)> {
+        let mbox0 = self.read_mailbox0(bar)?;
+        let mbox1 = self.read_mailbox1(bar)?;
         Ok((mbox0, mbox1))
     }
 
+    /// Start running the loaded firmware.
+    ///
+    /// `mbox0` and `mbox1` are optional parameters to write into the `MBOX0` and `MBOX1` registers
+    /// prior to running.
+    ///
+    /// Wait up to two seconds for the firmware to complete, and return its exit status read from
+    /// the `MBOX0` and `MBOX1` registers.
+    pub(crate) fn boot(
+        &self,
+        bar: &Bar0,
+        mbox0: Option<u32>,
+        mbox1: Option<u32>,
+    ) -> Result<(u32, u32)> {
+        self.write_mailboxes(bar, mbox0, mbox1)?;
+        self.start(bar)?;
+        self.wait_till_halted(bar)?;
+        self.read_mailboxes(bar)
+    }
+
     /// Returns the fused version of the signature to use in order to run a HS firmware on this
     /// falcon instance. `engine_id_mask` and `ucode_id` are obtained from the firmware header.
     pub(crate) fn signature_reg_fuse_version(
-- 
2.34.1

