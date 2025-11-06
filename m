Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E150DC3DBEA
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2154510E9EF;
	Thu,  6 Nov 2025 23:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qn0f30n7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011068.outbound.protection.outlook.com [40.107.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B373210E9EE;
 Thu,  6 Nov 2025 23:12:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFG3NHBAik4sI/nAQUnMESw6SI0nduSZ/sdYFStl4oSqyjkBAvx+42nkHL71TQ5Vi0BF1ep5Ddr/Iw3/ktT87YMp9YYdjNc1mSBlxrseVJClNzEKD2j/lnWzR6LdCXH/3UAmA9KiUYC1cMIOLPohtd2PPcuQ/UUfb6VRdL0omKdpddNLXaMfQ8UzXObgUH0lmwiF87Dk3kqyz1mrxu97gCBPsEsCS2vVMToY0io/MmajcknXtxgONhfOa454A3TiXEhzFKdzIO89rmuV/7wGVeixd82wBNPLX2tMxPMR/EMJ+m3TekJ/U8l09a/EzGKO3jnu+t0sLQ5zcAKFkXmBFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXtaDiMwenpXE/+nTZlHah+JklsO2nSDnHgrNJtMEzc=;
 b=fgEV7MCCZcvhcngN4SRLJT9Qi8jhdCdN6XklT1zO8QXg3a2L92Gk/qYmacp1KMGxZpYcF1ZQd0PIIWPnPPPL2OQCGLSU+w07P35siW8mJLFvwDlmUqWVRkf0YZZeAodM3AJke4j4t3qLk1n2O3kJEKSEnWE3GIc67YrVUZc5coZ1BK/JNgPxt4t9/1OYO2LKdb8uUc8zUU0I/LAEulRCK1DhLOhjNwBrUwz4+IkptOODDc+JQkDSnMxs4MPU+rmQVR3mTluy8Lu/gDxQZtQCzksO1eRYNztGooiK9h0RgdcaN5Q55nf6wCMIx5u233W7hlV3da7YUeKafxw4IitNvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXtaDiMwenpXE/+nTZlHah+JklsO2nSDnHgrNJtMEzc=;
 b=qn0f30n7QKrTtQNnz7YaAZ1YPpgbA+E9eQxuIrB0KbaKBNJ5V6wXwnZPqfzAYOuu5xik5uZqvG3jrXPYuVe0ycnzow/EeHB7B1/q6EiSS4LEB+gl2EbM5xzfciKkxKV7Z8gBUAeRiIIzij5wcQfQUkxwZqOuLkLjq4CB6AaqTIZAIpSHQFavjT7qOYBtfuoMPVwdXjxvUBCqjdewjT1OPUi51yf2Dsli36bh9sDRgPVyX63Rhgohf3tl6qLXhlUp/8o2M0YJ+9x+RlvSMKE+HT473YvPWenvDj/UKDeCnHMgcUp2mmb+vOcXoSYShy9IKy7r3PRjBxHmrCGer1qAIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB8014.namprd12.prod.outlook.com (2603:10b6:510:27c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 23:12:00 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 23:12:00 +0000
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
Subject: [PATCH v3 02/14] gpu: nova-core: falcon: Move start functionality
 into separate helper
Date: Thu,  6 Nov 2025 18:11:41 -0500
Message-Id: <20251106231153.2925637-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106231153.2925637-1-joelagnelf@nvidia.com>
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:208:120::18) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f618fd-723d-4223-8a41-08de1d89e3ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DfDNmQWrJiMPbPyxmVhOkSslN9F3oqipK/mTi1CTONo6C4Q3nPLfioLKJHEG?=
 =?us-ascii?Q?Ek9RMiatd9uMuaOEI7m+oeZlfn6DI1nTuIYYwaCgvTiBWrsaOnxJ1/28M608?=
 =?us-ascii?Q?fbNbfbbkqZRqKnyyx/Uvr17QXG78GppYgjVaRT7ds+dmqIy+pyuEMsTTpXnt?=
 =?us-ascii?Q?JTvDa2b1fjX+jCAcdhK1+UieG5DOrJvQeMU2Y1pEFWUtU/P6vC2J8/e3RWLN?=
 =?us-ascii?Q?eOjYWZcUV6xQnxvBph8qk2/AsQQDKy3DboALYF1Jzh0kPtQPDPJSeXgP7/88?=
 =?us-ascii?Q?SkdTF+M1WAm1zu2ZWN3dJV5XD1b1G/9s28VoTuoqKQVox2EEEVsTs9l5acFR?=
 =?us-ascii?Q?uhy64Mr/LmORgeTaewQsBoI4NQfJM2oKo5khbXVQL0RBCK3mOP7Yus6vdvTn?=
 =?us-ascii?Q?Yaamc/CTUP931s8OVW+XoXyYZncpRftbilj1h732Awx6hy6mcT0Fz+0QFysK?=
 =?us-ascii?Q?YIVd7PnvDZu6xrzbz+vNu3vzF5juc0glEOBL1836vPVV6wzQYzLHUeo0C0PM?=
 =?us-ascii?Q?rXBphXXEYR0aB/wprLsdvq0Kvz5zGqMwKdqbBnaR+MnNbYVRQmbNQq2IwhA3?=
 =?us-ascii?Q?ld6I+U8H/LPl/bwjzDeMM9E+WJ1/y4YgCgx0jzyNDDtvq735qZW1pgz4tCQ6?=
 =?us-ascii?Q?B0GiCqG1yR6x8QzqT42KSnfUv2LPd/yQpnTqXQq/bppgb7AO4cASpzbZc/RZ?=
 =?us-ascii?Q?8HKRimkuxC7WKBBYxM0qdWLa7cZFcmKr4JnXhksf0YDNQf8qCBrW9qEh1Dwq?=
 =?us-ascii?Q?PG9T0hv3i+dMWPaQ7Q4ST41Iful/hSe1GT3t8Vr1vyMWqRXkCeyKj5924k3b?=
 =?us-ascii?Q?jugrTn5oMqR6AwuzmwfNyJiA3b0JvdRwylqbeGObrBrDjTcytFQdp2dBvfvW?=
 =?us-ascii?Q?9apwpWpO2y7cy7BGP2xYF9dU9D9E0j2VUMc+oR9lkYzrM1tbZQ73TWLHHarp?=
 =?us-ascii?Q?yAn1ZhGipXwDGdothAxTMa03ejyVc3qKECVnPfcJCSsPefSSkcvnCmHCQfdR?=
 =?us-ascii?Q?23rVJALsny7RlXreaTfYXUeRwTCdIP7+mhxcnbzaWGhPTGNNxTD5G7EIb12j?=
 =?us-ascii?Q?fDk5or2u8O3X2KfG5FZ/pZFJvwSqOyTuKBlcde5Phk0o5MEvLqel3dfOrZeH?=
 =?us-ascii?Q?MO6uiedf0fDj75AeyYZohqo+ebAE+DrEvcIdkMnAXmtdlAqLJMbxYLo44ELV?=
 =?us-ascii?Q?A7z7jc5v4bcYQfYKMpp0Ee908GqGhvUzHNtaP5sQ7neLqwVALmudgyMtBFGF?=
 =?us-ascii?Q?2bSHLrkVRGycnHY0UMT8F485NBtDX7vU3fyKbSsSuRqOADyc/rwYtFb/oZA0?=
 =?us-ascii?Q?TCRrdnvD9wAvPbFPVHvzxoDML/qOV5NWklhHO0Yox9l0yjiZ0iPczcq+aiyz?=
 =?us-ascii?Q?6bDvxRd4sZnnWGEU1qsVMWfDfDceNkgLJqVAjThO1Ec5Hhb+OfjQNcT3lq3m?=
 =?us-ascii?Q?/6jVhINWnRNYFZTksY6bk4nSjoYD9LvK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dfFQKDvTO7rO/eBAQUDzsPO6Fq/EdrMq+qpma7U53OS0LyQs7FJmyRIVyBQl?=
 =?us-ascii?Q?i4Ct/tuKt2xH1wt4mlkidpHcYF75chFQVRpoIBUoF6ZPGKhzgzD3UKcFCTon?=
 =?us-ascii?Q?iJmMc+jpIJmp9YbDH+f2LOXCN2ijDGA6LPUjqhb/v9ZFIayDd3LK5pldND85?=
 =?us-ascii?Q?5Q+u+zwcx4C2D62ePWikMxzSrqy9YBxk9s0FNU75tRvTwwt3OAqoFSSlAeLI?=
 =?us-ascii?Q?8ISW7Gs4Q89qOR/nXzfuVeCqeViQSPWZ7nCjGubSuVrCJ5Oc4RTHKz0dWmXk?=
 =?us-ascii?Q?e4hxODcXGossxR19deGysXMsyxRcA46pVB2ZQnlk77lv7frwxZwgWXbIgeXG?=
 =?us-ascii?Q?B9fXPgxmaMCMB/pp9tg0XxHSVJ/FZyA8ANtYn6iqcSyVckslC3tjV91stCfU?=
 =?us-ascii?Q?r8YY3eYO08IvThdTrBErse/PhsUpDfk3//tB84p8FsaWXxg0DX3Vu/nJ28EK?=
 =?us-ascii?Q?BPqj0oIL5dwGVKWI1M1+SbGqfmBRSPLqqLpY379pedGCurrIWFdX8WiS+Lga?=
 =?us-ascii?Q?g284foV6h70fTzPAp0aDssytM1PTUKHx16fdz1DZHAclrhFd3DImlAMZ4KuG?=
 =?us-ascii?Q?JCuA+O7/zl4Xe7nJU/eYSzGpf0Eila4H46q2Ik6Xm1wfYeYrFUShgl31huEv?=
 =?us-ascii?Q?tK9nK7gafzc6t6CG6XTKz7ococo6ERdwotfSW2Wc/81OUtdyKz6yw3/6vq88?=
 =?us-ascii?Q?zdVzrhv0DD3lV7uhopv7pmzDHRxEo3bSlVrNLvxs0Bul6PtbE0Scup/Qv+7S?=
 =?us-ascii?Q?vK8LeanCQWCSoYBt7DneAc1M2ZPAsGKz/dRouwo8GAqCjJMpOdEDW6uPLO/x?=
 =?us-ascii?Q?RyV7fXuqPNGXe+iyAWUxhwTKUR1Bdp/M7Yfe8NILQtn2I2k5NCY8OFIAjtrI?=
 =?us-ascii?Q?qUjuMLgckSVqiPmAZMRJmSCSkrf97JGNVGHzIUsFdjMsejyPsuOcfi2LlXGB?=
 =?us-ascii?Q?obYhQVhPG5imTRrZdKosuh9lmoX2rBXhil5ajVmOYWBEfRHsfM6Z45yVBQDm?=
 =?us-ascii?Q?DzuNJKWdexVyx2oI6XsUrBq4fAXrUJy9Ch2GQejUl+kstzQgbYfXCelfvoz5?=
 =?us-ascii?Q?T8pLxroRmDFAbwYvFepugtgIAxIyScljhDdmt6Hgsks6RFLFOJ1xMYL0scsO?=
 =?us-ascii?Q?teOYcMxseCHKAoJWbvWgCLGliKVV08fnkEqoPFozyL96oLUmzHNtDeO6eE7N?=
 =?us-ascii?Q?7yYdculCuDyQVYIM+wgtTrZYqMIsiMi+Mn/7BKvXq7nfvmNHVQkwgFBTqnbL?=
 =?us-ascii?Q?mOoyVKQj0lxPBVVIbIU2eVek7hY4c798asgT36DYn81rptbt0wZGln6NUcW5?=
 =?us-ascii?Q?fh2/UcJyEC9OPc+P53OBZiRCuy57WH7Dsoom9EgPWLfhKrVbomR5DY0Mp5WO?=
 =?us-ascii?Q?UM1M7nrHYtPkyZH1h+HOLKaXSZ1ROYXgYjh9siAIspyK05lTTJFArlkXzyRv?=
 =?us-ascii?Q?xIHgmgKhJOtxAmDul0f7p3tn1h9gWsMswdSjTgpDroAMTcDq5ZZMtpOJ5DT9?=
 =?us-ascii?Q?LSot//K3MGmAaYCFw5Tz3fBv6Pk8n+OxG/wNAmzbjIw2/tAJZC6mCdSNQSq8?=
 =?us-ascii?Q?uwBIkQM0royO+0vTxa3tUvZxLRM3xlyxZNOqvyPz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f618fd-723d-4223-8a41-08de1d89e3ae
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 23:12:00.1726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDU62T4pnDdxutBX1HIF0Lod1nxxU702Rza+bheqoyORkUykIhtfnXk76eiGOPxat8J2GF6IpUkpD0qpbcKzRw==
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

Move start functionality into a separate helper so we can use it from
the sequencer.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index dc883ce5f28b..1bcee06fdec2 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -553,7 +553,21 @@ pub(crate) fn wait_till_halted(&self, bar: &Bar0) -> Result<()> {
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
@@ -578,15 +592,7 @@ pub(crate) fn boot(
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

