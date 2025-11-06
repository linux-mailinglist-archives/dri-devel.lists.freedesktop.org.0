Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 051B6C3DBE4
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D8610E9EB;
	Thu,  6 Nov 2025 23:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="my3HMRSH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010013.outbound.protection.outlook.com [52.101.85.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111F610E9E9;
 Thu,  6 Nov 2025 23:12:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvE40SK7HuP6IqVk50h+fphPsgnWO+jHPbL/0JPys96LuhFDT1vxI612lmcO/tM1FZOgNYBpXo3YErkB4a8zXbwml7ZPT3HS1xQl17Pm5qPginMgTBnzlxBE6mSWHkQ7yiQFVSVlC3eRdIhnRMj8z3wZ55dfwQA21glvwArordP89pTwYNSHrnk+A0pEU34lz93UFV4x+WdCUgb8IHv3TeCHdz7YmfjwE/Iv11rAy+lUNpgm3a+1h5RuGaMi0OikHfSHOb6r9V8JXHZ0KJlrmEIKUlVVbGG2eI5cpIgB6I2XzFbx683Bipdo+/I6LLM84OJqo/v8M6COfmqDi+Sg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmLTQeJxdQhuU8LIHyX+gsWBvdoqe/m3vTcn0/8mJjQ=;
 b=F9c7fHw6WgHOlv7N21p1iDMcITmrJ1ehW+lekViqa9OdTV774RbG/MGIMWwGLNs8GHG+EE24OHEPizXEaa7DyvdGSt/IaNlAIMZFOXSTitoitu2foFP6eljr1k1f5Xw+EKd6mHe3mKULLtCfa769n1NpGaO9WTeLrie9KSPe9l/PTsmxqgUNgNRL6DMgvtwQW6O7Wrf+/cnVXNVtYBKkvw6eyduCi1wjg+ywT1y18lZgxi2Bb79CrnTvr+PlS3xPaonYGpYusmN18A+jYgY9e33Z5WANulQDf6FsQcHKs2Pt68eP1JR/qt+rOfJc775cQkEww6XtI0QxgMK3XkboFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmLTQeJxdQhuU8LIHyX+gsWBvdoqe/m3vTcn0/8mJjQ=;
 b=my3HMRSHpHYQYU3S/IVEH2r+Bi7+/ZupJONOnzwkIkxYghYRG50VZzHSnwwfn0eXyE1W2or1rZgVbGJgqhS9i96Wb9ZkoSPbFnbPBfeJzUlFupSEzwEtE8s+m1UboXsO/KMsyyENryg+222HLWx4EeDA2mh3HpX4uRMzZOLIPJtowcuHNmdynFv2AuComqULyE2ePs3pGK8Eoe+kCejXOrlYZR6Aj9wkFWl3bQyNJfEMZ6gUrEJ9uEoHeywcBlVtCrh1zCRfcpgEy0hNMmKMBSSkin/3MgdNXsBdpaR7nizS4r7aTYM31dlO/0aB9nutLX3AnYjKdIuMHe9p+iVBUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB8014.namprd12.prod.outlook.com (2603:10b6:510:27c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 23:11:58 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 23:11:58 +0000
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
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: [PATCH v3 01/14] gpu: nova-core: falcon: Move waiting until halted to
 a helper
Date: Thu,  6 Nov 2025 18:11:40 -0500
Message-Id: <20251106231153.2925637-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106231153.2925637-1-joelagnelf@nvidia.com>
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:208:32f::11) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: 25166dfd-dad7-4ec3-5d9d-08de1d89e2c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4S2fclYV4gDRmN4Y7IxRrWE654x7cubKvwYvJDMsRFljpnwMmKM/oqT4rIfK?=
 =?us-ascii?Q?wGyS1mTM10DEArzgMnwYWDATqOGNhS/DUj4Mva/zDBY3CKwa4Ty1ivFQF9uU?=
 =?us-ascii?Q?t31WXgAkrVemju7ttnp6/rMPX6ljZoTvoftEJcxNsubb4PDFHCdvzSPPVp+E?=
 =?us-ascii?Q?YUrVSsp5NTCOh1jk66j0QDuC15KPjCyZHCG1IEsj1mII3ZcpToWBO41Nzec+?=
 =?us-ascii?Q?ZL7TSj1ol8CoIqcvIRd/XV0W2EHH4HDAIHCWYZ623rKEqaJGrGDctQAYwFzg?=
 =?us-ascii?Q?+kDFSeotCMT/CbuRN7w4su54be9QqByvLJzLaPDR8UvB5uvAeynrWNpFQWMM?=
 =?us-ascii?Q?0bXAqCGjlqTjio44KGXL/hRmOANZ1pxE6Ds1e1uLe2BV2uHDJ9XzPrI0whe4?=
 =?us-ascii?Q?XqKlxPlZyd184ytjDpM0SLFtBX1P7u8dS9xPdIC147EB/yid0Oi4D0SYvhwU?=
 =?us-ascii?Q?m0DkqcBc6DIWfXgCrztIKcp8XjqbnMe/vnQIN9qInYQ2m9WDDs4Kd5m5Xjmu?=
 =?us-ascii?Q?liSFSV0xW0p+ygMOkGVWvjBWM00xOxTFBbKMc7Jfog59GEGlAnbdw1atLous?=
 =?us-ascii?Q?TfQlIIh/Q6W9J0Z2+1gxlnUcqR+D12ZEu8vcylVOCQ4CNESGXjxpEe87DNF1?=
 =?us-ascii?Q?KJtPCQf0gPL43U50g3esx+l5Kur4Z7i2UpLaMMWf+21nMJh4J31bGy3ND9yN?=
 =?us-ascii?Q?srbzntfHN0aC4hnMV6Kvt8iY/pEm1dxE1suc/g0T9fKzwSfKxwKCMLQ04xR4?=
 =?us-ascii?Q?sLuyYN8P1EnSZZwezro2Ww9z89NuwfSgn+1NYaSCOjUoG7RBIgqOBpWgemsi?=
 =?us-ascii?Q?U7AcQg4dhPZgz4XK9h2Q9L63TO8pf1IC7qFdFV9sNNtZZAHVNv4frbhsF0v5?=
 =?us-ascii?Q?7P/FfSgcThGSHRowccHT1Yj0Y5vzKMK9jsBlTigfkSFBRA/iDJ2wXPDDHI0G?=
 =?us-ascii?Q?gictVxSD6mDwAnNglwKvTgsOMU7A10fKyiSKUBlg3NxGrt3cEvu/z58dQJue?=
 =?us-ascii?Q?tSIqnNlGASPNgsrip9FaLONFcTwhqMbThv8D9//GwLjfv0UmMhjIw/qqSeX5?=
 =?us-ascii?Q?hljU8T9QXquuFkg6IwHEgfaDwYLxJ9k2Bmx0XWqGliI8f4sYdbQkiNZ/q9Di?=
 =?us-ascii?Q?IdyjLkPQUetnasVS6fgyXx3WnCpcXdTxySOv0L1OnzToNBHswFFOMeLjZHLM?=
 =?us-ascii?Q?Bgqz0rf3lKMp/gETEjmIwhmXVORM6ORSRsA4+l7hL67ysBez+n5W9pKSOU1c?=
 =?us-ascii?Q?ca3uwG1ChtwYgbMzSDqf4cTi4jHXBBOuk+RrHLy2/gPiFCEjlipi5OjPOsR5?=
 =?us-ascii?Q?pa6HKvncJ7B19zfOhbAdJqJIm5JS1kMTIPPsG98wAikUF1qZ6Mq5YQFCDNFd?=
 =?us-ascii?Q?xY1lBP3aEWp2WRI+GW9sPvjjO25Qe+JUdNoQygvqrrX//AHkI629NmjiFcqV?=
 =?us-ascii?Q?yyxQUgRCRrZaUN65YUBPNsrNnJJM2Kq5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9bkn1rJ660/U89U0iTjrVzDnhaPLNwOG6xPpZNApHsgtGqlUcMh4qdoQX1TU?=
 =?us-ascii?Q?5P/dwstoWy1VrzeGg8GFKXA4KZxq1oKJgGL5drCKSqF6LeACyv03bdx41Njo?=
 =?us-ascii?Q?SCjPRuvennUvOl8G8Ij1uWB3HXCV4FM0tUSav4d9blL9HBgRou3k72ezhYfi?=
 =?us-ascii?Q?qF5p0vc+UnR0BEA6Y94g2GITFbTglKhjZhAbkHBr4qoZ/n5R2OeS5F6C5O2J?=
 =?us-ascii?Q?20t4CtlxxaCUDrz0l6z3t1TVlwJflzoG8XLMQQdvlFEEcqAEqkV1t1hpoGi7?=
 =?us-ascii?Q?TFrK83fEKC9+vVioKgNAznmdV+/RJP/N+4UZvyB/TaR88GBcWQgKp2Z2+e1i?=
 =?us-ascii?Q?QiGpFsIURz8kdi1tW09g1HCFoQv9sZzNAh5YVM8h5vVUwX2Ag705LWMdxT6O?=
 =?us-ascii?Q?oCcrDbu7Z9UDBxx666z308zT/cgCKw/tk2BqYQOOPhsdLhOBmiXbcrUDvhvI?=
 =?us-ascii?Q?heV6jTT1Q2zSrk855NMZ1KZvyGMhIW2OmImHsJg8p8Ge0pr1SdnsCIqPXixA?=
 =?us-ascii?Q?z/ln/zULMQ6hpJvI2dVDJHoHvko0EoCQwcc2A63pt2vF/BJ2Zzn3bUs0mqYG?=
 =?us-ascii?Q?MsM7kAokh/sPyR42hUyWZMW6FTt7J87r5CO6mRDgNMfCYye/u2ztgUZ+i4S6?=
 =?us-ascii?Q?jxF2sDNeOJEFXHC/o6ofOZD07g8aPPNg+8EAQQKUJRa6iBAns5k/LKoE10L9?=
 =?us-ascii?Q?6heDpNLqmIONC/+Bh4/tiPAHdKQwgsPIK6ntrg6IF+XjTXTZKPV7fwZL8NBd?=
 =?us-ascii?Q?eePR7OMf4vo8PquyXWs+o6O4UQ3U3SrzxZuwep0gSxZ+V3i3ELExEjzMCeVq?=
 =?us-ascii?Q?F8uFxsoiaDqx8SnQScnNCjjn1JL1UOSVIqm+ZWKzMkUQvLiqAWmzpSZbWRSX?=
 =?us-ascii?Q?DyJAqdpTxdIr3+cWhWbWBAy2V1wkb/HR1iJJRsMb6/eU593GIdgAIoPKZwlr?=
 =?us-ascii?Q?B94KrO4Pc/UKzKQIRCSN+EyIElxfTV2hH0a1pc7GO5tynPg3ttdcJL96exyd?=
 =?us-ascii?Q?rusJkezLJdh9CLtjnfyRiqLBeCwrqxY2cbvX+mTOAiVchR94p0NLbwWtJ4Ft?=
 =?us-ascii?Q?IMa1eVO/nxNc2dfd5W10YUMo52QkVf2/ghGL7zb+OHMKhwkSJ+gWnbRLEauP?=
 =?us-ascii?Q?7m89iah79I4ZuAQIQrKWfQ+xK5Kh8NoGpChzbk+ZPznjHZbrz+gI5Y8OvCyR?=
 =?us-ascii?Q?P1SrF6OgIeDB9kTB3kmb3vTgIVk/D0LuB+6KBHpCZI/Q6xi+J1l2OHyHLgLi?=
 =?us-ascii?Q?QZr1adbJN7R9DYGR8fg/ThSFfU/CZRY6jy8K92olZHCQbwuU9z58ucys79yb?=
 =?us-ascii?Q?hz7gu4qBQPHMGJfH5KrDHyxNzk0epmja322GpFS4XRa9v3MSMN7fADkG9oQ7?=
 =?us-ascii?Q?eLI9HB85Px4hQt03Iiyq079ZfzH/fJkcqkrngm5+few+dPWfaGtEjVech/pI?=
 =?us-ascii?Q?EHxcIZC0Yj+c04uJglGVUMSt9ATNsgFuif2JJKQerl/mt2O9BVv6/iwHIG6g?=
 =?us-ascii?Q?kPoSqy/OiP6EVoYA3ojDXGMhFw+xnQTwyFyTz7OwMJ7D5fwfbbLP6ZSoVray?=
 =?us-ascii?Q?Qmj1cLHB0WjWx0d9iA+xk99WoC8w1CJbK4oLfJ7e?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25166dfd-dad7-4ec3-5d9d-08de1d89e2c1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 23:11:58.6939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sA3UktBL6vhvYXJvsnlu4rJd8T1zTzWZSSbUAVWBMyfkl3C7Y2cnlv3lyhWkefglZt+CvGVUJWlJHDMLopRItA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8014
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

Reviewed-by: Lyude Paul <lyude@redhat.com>
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

