Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25A0B3C1CD
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA3510E1E0;
	Fri, 29 Aug 2025 17:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UDMYymg3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1000610E1CD;
 Fri, 29 Aug 2025 17:33:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YacTp9NzsMaxkCdy/Wv5daX7EJAFuvQVqJu7diUkrsPnCQpwhrPlcnLYUT1spBKNAa8bd1Cu4FpAMPDqmpUQ2pc0pcnSwRKYHCdYdJFjYErVfLG0EJKYqdswTsEqrVhZLe1f+qAHri/pA8ui617cKjtEmxTa4R+DHQG+7CCeRPE2CBrU4f0aN7pVtAS+togrCQqQ46sG13aONWTxBfUAd7H/8dJiKGhsnlxdai4+FXIHC1xMooySLHNsKN58bmutJ+PQ3K2Pu8dCPMeNU9cGjGxj75AZjfUB9EYm7U8S1Jt1ZQuvq08xdnKayYX+MIzh1ZAq5kAdQLZt0tXRWIkjbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUuvUEJW/IPPDvG1DBZxSbU96B3DlCHtH5R3EZ67j0w=;
 b=NtI5M75xeq4WDPgd/SfdUNJ+dsEo/6I+g6XERU5lrwBRH3pT36ttcIUnvBzyj1abEv+d3qzHgyOMqQVFsZOOKKMXwu45eBl+jsmkyuoQ0lf8ftU6sxyd+YqC4v2szpb9F1nJbF583SwUUlr1+geoUHNd7Lc71vIxPWSGwfsN3OMoaolnz6TKbZ4SV0w2JeMq303Ml403B2pdjhxBs2jLUxNw+TQrcmYsPbqdUpsj5Mn2TURq1CuG/aDt9j9QoV063VemHWE5WJtJdIkJCnEoQ+/Ze4eXDJXBj1dHcfwSwUwSzwf99LhGE5d2RYPej3Ose0CkpOcFXiL27Y/6+gGaLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUuvUEJW/IPPDvG1DBZxSbU96B3DlCHtH5R3EZ67j0w=;
 b=UDMYymg3vqTy6MrKtAMDqeXVZqCESdEJQvVelOtSvPpRyl5KHWqoGeKV5G5p/155T4N+Qkp3UUs5Z4qj2CTqOThrj/UFBduNzi84o/VDfuLs5XvyuOOViOpRshM+JMnauft2OkcmHc6Hn1RVr7v2RJrxgs6YyV5CTZXDKli+Y9f8m9K8/jqoMPYMXCucjby+eUuHfa9642JPj+IQLo/tQtVoH5VYxIBg0Ebia2/Xfc6uK4JlGd7Cuag8wkpdEkXg43tLKNz0ctsjWsD+rTcl5YAy3dzPUV97usnkCjfZmgp6OVxgiFcnNThdaPvxIQsvgYUoiSGMJ88a8XngY1CJOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH2PR12MB4069.namprd12.prod.outlook.com (2603:10b6:610:ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Fri, 29 Aug
 2025 17:33:27 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 17:33:26 +0000
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
Subject: [PATCH 10/17] nova-core: sequencer: Implement basic core operations
Date: Fri, 29 Aug 2025 13:32:47 -0400
Message-Id: <20250829173254.2068763-11-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829173254.2068763-1-joelagnelf@nvidia.com>
References: <20250829173254.2068763-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::19) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH2PR12MB4069:EE_
X-MS-Office365-Filtering-Correlation-Id: 499eb199-f6a3-4641-5c84-08dde722295e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kxEBIEx10h0ck4cThAECnTJ0c+/p8DwLQXYDYZZOiJaQ9g2po2kXCNwh1gzS?=
 =?us-ascii?Q?VqJ86MDEsJMKmN055bdMBWB6G+qe9pmuy0cGeq7xZIv6DbnOQWtvynhN1MBw?=
 =?us-ascii?Q?z0FG5urQyXCmV9IZ3qD8FrKaKoA4t76NZPOLJZEzPEvBEV0nS6ru0uMgoE0Z?=
 =?us-ascii?Q?261+rNjmiWX7Nt6cWjdhbduZUpk7tjhD3G0EpOr/vGFoxk4nmdSNInjESu9c?=
 =?us-ascii?Q?rj13hegAip4JCkKM8dgHvOddJERPywZejCpwdMsKP24Nw1PSPAFcKaIsrabU?=
 =?us-ascii?Q?6P3DbhVGcnNL4WMScwyCeDbVMmRjmMOBBniF7EzwaphTfLBYiCx73mP1qj5F?=
 =?us-ascii?Q?nZh97s6vbbInHsoSpFsN+GnVz+t0ze5/zVwtIo0xFLZzsVCdaUYQSnk+zqsw?=
 =?us-ascii?Q?BlCuhcvJm0mY38mPoEKmaIekoH3BQfEVvE45hVO5w+7FaRQTshtcYyrzxLB4?=
 =?us-ascii?Q?xxpPDw5SxeizfaIMUUBgoXKKprlOBXMBXXgCYciex/8ggB0nyu9VYgh0GCnW?=
 =?us-ascii?Q?UtvBSQyRaBtdBVcuNGBtOQsgDn8TLkKsyO7QhMcMaVnwmMJetCLFfwq/2n8s?=
 =?us-ascii?Q?iOIJotYTg7tZMoZuZQyB/bYiegSlNXPJAeH32VJF7STQrRv13T+We30op0Kc?=
 =?us-ascii?Q?z/YTRtZkp4OeGq/qwFj0/le0MHXZ7fKfRR5nWVCT7Jn5sVbmodYCqTLefWwL?=
 =?us-ascii?Q?GK0aqTh14kQQnZS58QRPV+Fq0wka8n3xcuEgo1Mc8VxnlYc0z7eSu29tLoHA?=
 =?us-ascii?Q?L8EoyEFfrkP5rNokHqATl0xw5x62+3NK+79RP275xSXHV0Y5yQJl9DroyeMH?=
 =?us-ascii?Q?jwkKDJegpSlJa3UYefKNWjk+R+ToVRwnJLsuEm6eXcl7aNSbRAEKooitFMDL?=
 =?us-ascii?Q?rsnS8nYhr5pjR57r4s1mCeKGMCXpXU6Ech/FOlSNG6BiI2ga0WbHbsUymwmc?=
 =?us-ascii?Q?BwbbI9Yz6xTL2wjvO6OWTR4gm2g/Tu9Z+YjvxM5VW2S5euC8cKiCs9N6ClXA?=
 =?us-ascii?Q?hF/6u6+bdQihVJJfXFeeW5IYYa8/sCg4USaxCkWaefK1e++y5UCbXWmTppFm?=
 =?us-ascii?Q?XQJQQXeDyFH/TTHflBJeGNWy0MUgWoL6WlH8pehaCArNN7eooqycvb4TFILv?=
 =?us-ascii?Q?nwAbCQqiXR4pZd8kXYjuEbPK+ZbG+GGzLUt3qvXE6HkQnVgB+oNoswqIjEaP?=
 =?us-ascii?Q?Q/si5JieMzL1KghVRmhm5spobGJcsUr7OETlAsHxXfWiYeYvQoqdGoiB3Vjz?=
 =?us-ascii?Q?nvs7uYdXBt73XRkEvqrP+++2ULwLbLHvhgzxpndknyI9uZOXyNOblZXpqAyI?=
 =?us-ascii?Q?+SnloJuXmsCYVXy1o+Px5ghtwpK3uMqHoHtZCOkUByzHPXxTQUFISKzGJwK3?=
 =?us-ascii?Q?3ejaeu46f1cr9oNaaRKWQy+InNFFz30mtlWy2Dm+rOMJg61Ftp2na3tUHmuN?=
 =?us-ascii?Q?ZfvpU5AtLEA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wzKPKTG7HOkd9LQwB1RqBBC1ex2tz4lk5S/Q4ZYwRFfXaHILz5eLrEuWSIxb?=
 =?us-ascii?Q?TrDH6yRV+N+76yoCb7UAqf9MU4ks38LrDDXkqANKtsvWE3P0ynMd5LdemFjB?=
 =?us-ascii?Q?ORLWcfYuEsAQOkqF8lturL5N5UvkXFI/+zWynFR9mOGnscOyufBh21q1FY7A?=
 =?us-ascii?Q?CGUftJ6SPUPyZneszQarGPYyR0Udn6M0LTRWPg6jJQHOQWTsVXIamtlnwEYQ?=
 =?us-ascii?Q?TpAyge/7zVXTDnz1w6ll/WKwhemCUGAKxnvPqfC2JMnD+Zm37gXTiBWguFFX?=
 =?us-ascii?Q?mGWO2FQvUsUIbAThMiI5r54iHJYwPkzfpKOxu08gqElJRjfJrZSR49d/9zjv?=
 =?us-ascii?Q?iEVNmBg9MPhDQ1ij6+yqq33k0z8xChQeVlygckRFLXCqzoWha+lkWYB6C5bU?=
 =?us-ascii?Q?ZMHlSr5Gm+tU/IC4FIS76dwc86XLp56hMTPueFdeatP3fV1XdZ4UIJDclWP5?=
 =?us-ascii?Q?lflEHGiTh7maQ2lr+OnW+U0oIBEMn3DDRdmoOGYhB+1v815LlvJwpkYqPlOV?=
 =?us-ascii?Q?nyP6snbgMK7FbMLV5V6o5s3C9r8NEltS7Wn92FabWybVz5f/XpRnpV2F/XOJ?=
 =?us-ascii?Q?8gFAWDHyPkuyRC7Df1tP5S5UE2mQUIICEflP6My1AI/HmbkfpjYgAxyQK/5f?=
 =?us-ascii?Q?KQxt4Cw67FqNK2jJcnLnqatg7CH9hP0XZhp+jxRF+Kbdf2qklWw/+rnJXL6b?=
 =?us-ascii?Q?4D7jHWGoEvI4eg8qu0YTzhshcIxt0unBKerZ05xr2STLOyA36JOxpk9z/UuN?=
 =?us-ascii?Q?mmcX5NEgsOVQyucEVkP08vPxdafO3IgEmGj49MRoOex6JkmEazK0XckiLlwX?=
 =?us-ascii?Q?lF3titzKqRSJtCUawSktOBqyRqp+6kHMw8mZl1R5J6OabhhErw69gUASlEc5?=
 =?us-ascii?Q?sedLv2UXuqD2IW9OQ4XORJmxTHx1m6xwlHa3/BDVhTel7aXXcbZFVf8/ldQx?=
 =?us-ascii?Q?9W3W7mEhXM+TlQtSxqBMYSzdlrIdYCKkw/YwTOJu1q46g17f1Td9I7qvq9xY?=
 =?us-ascii?Q?UyoOTCoabVLgaBEO/hRc39Nai4X8jisLiOGqzDTUlmcGEalwqlQzpV6gF40j?=
 =?us-ascii?Q?6CpWXzXq87gtI/LNJbTx1kR3/9wZy5no32P3SRjVemeyQf5Ln1U6V31etifj?=
 =?us-ascii?Q?JaY7eAOSYKrFYRZIDVOyS1qvlQFYIu7GLYmfZLRpP1fRnKdX5Js31DPXqqHc?=
 =?us-ascii?Q?1Le7TQuYTB9zTPvUoGbLpLomiCZVFSuVaGseOKqrqBcKD6eE9ksQqsuRaNpA?=
 =?us-ascii?Q?6g7c8PpLFVGbPYNXrGDFmQWLrlJ6g9wpasd9V43XU1bwoRLBjN061G1qT6v8?=
 =?us-ascii?Q?DKirlilNl8U8qGUUGqkyolzHo2iMGKzMdUwyG+n9AusbWURMbMJC3Tk9gb+z?=
 =?us-ascii?Q?f/ErWnTSqOcHqctIJ0FVAr3cxrqRDXBS8Fk95uwPKgjRqo63qUMDwJwvVBEI?=
 =?us-ascii?Q?i1HCd/Fl1mMCN5gkkoIMpEx1fnDmM83+Ocs//+zIkVYGbVaMvhKBrS7IIue3?=
 =?us-ascii?Q?sG1Era6iZKSBxDwAnW+7hmoIb6QcVD0TSPsHJI1Yosx/FqrQ0RTdqSK2vQjG?=
 =?us-ascii?Q?6Zpd+IoqdcwTeEYtXJdWDkq8ybMPuMu0NdrOgr40?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 499eb199-f6a3-4641-5c84-08dde722295e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:33:26.6647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtvP0RjuaJmmRhA0MjGxXY+4etODlMfUHHbjYnYmd+b0hcUL3/9Ea4gFwUb03b7KePQPatT1Dw9F0P3gcEprWA==
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

These opcodes implement various falcon-related boot operations: reset,
start, wait-for-halt.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/sequencer.rs | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 803956a74c8c..826c06041e41 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -40,6 +40,9 @@ pub(crate) enum GspSeqCmd {
     RegPoll(fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL),
     DelayUs(fw::GSP_SEQ_BUF_PAYLOAD_DELAY_US),
     RegStore(fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE),
+    CoreReset,
+    CoreStart,
+    CoreWaitForHalt,
 }
 
 impl GspSeqCmd {
@@ -63,6 +66,11 @@ pub(crate) fn from_fw_cmd(cmd: &fw::GSP_SEQUENCER_BUFFER_CMD) -> Result<Self> {
             fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE => {
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
@@ -84,6 +92,9 @@ pub(crate) fn new(data: &[u8], dev: &device::Device<device::Bound>) -> Result<Se
     pub(crate) fn size_bytes(&self) -> usize {
         let opcode_size = size_of::<fw::GSP_SEQ_BUF_OPCODE>();
         match self {
+            // Each simple command type just adds 4 bytes (opcode_size) for the header
+            GspSeqCmd::CoreReset | GspSeqCmd::CoreStart | GspSeqCmd::CoreWaitForHalt => opcode_size,
+
             // For commands with payloads, add the payload size in bytes
             GspSeqCmd::RegWrite(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE>(),
             GspSeqCmd::RegModify(_) => {
@@ -225,6 +236,22 @@ fn run(&self, seq: &GspSequencer<'_>) -> Result {
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

