Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1D4BD1A34
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 08:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117F610E3C9;
	Mon, 13 Oct 2025 06:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pqvjp0yE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012070.outbound.protection.outlook.com [52.101.48.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B70D10E3C5;
 Mon, 13 Oct 2025 06:21:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIj66bvcmwutusYxwXQo3vuhorNyISwIzDETEAlmoeepkLwIQ6Rra3t4/jj7hC7Op05isqqrv2yj7gjAVVpXVCGcsbPb11+UAoeoVw64A8AZNNHitW1ssGmfjleTyvPVis0jNiIIqOuyrThIa6ssExKWlUoZRilTjWMgHpRKySGQnMnOA0ArXvz50pmzKb4yJiMLuskIwDSFJLePFyU3nc1J28IN4QBsg0cp88NuTUSkLiN9pH50yMkn9XXcJ8gU1ErOiOsOE1xZn/828Pnqb5jW7uDkChvefyzhlWlpkXlv7cVyJ64D1Ts6f8BsMvtTau7r4qqNzcKiXYJ+xOyWZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3nsjbEkKoVp5jBs9GfKhKdsdGUwbzFbJJD531mQDtk=;
 b=cLPDHklN9rUaQaJvE9I27AOyHifWyV5b03E1QystiUhD//jUFpnXlWX9NLB5w6xT16DPS1sgQKBrXVgGl+tGR7ikXfzuTtxqRm2xTn5LCdriIAh8dd4Zscze2b4u0Z6MhMOI9J5YHGoXodxp4LIgJAHrw7FQz1pVVmlVmyqTnz0ZHSG+hA4kjJpfTMAbvuToQosiDAbk05UUObJR6f1WY5eRbUkJJnB2sMbqYpAPxwsnEc4CWvh8VMeXDujshFEXJviJyyCLz9AiQJKUh9YVrBjV89VM/5FeuauIQwjOP5tjvIzh9fxc+Nb5iv99bXQ29Z5tipW+wDHk4rpad4okxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3nsjbEkKoVp5jBs9GfKhKdsdGUwbzFbJJD531mQDtk=;
 b=pqvjp0yElMdrFVmN+qOf2FCIIdexnrsnZMGMuLDejsp0DSKU/ZlTM/8LN37ZHewsm2ZAKN2u93zBs+lIgcBqL4ghpynJIWCvtm4b0irSyQL3ljKesbUY1yOso7RDPxlGxxBMXriFpcHrdbt7/QbL2uYz9YXETkBHFG9btI4/hyJgT6SEtYpmDsW4XadpKj+xg1CORRH8i4fzSnrv0qo7OjXsdLBJbneX74NNr4VKatcWgKrmLA9JaDHg4LOY5ZkPsjsNJ9yvDtrxp3vqgRF5erJGsPSvrHIWVyMH1JQirlplEOCjfuZoWRxr2AxiGEV6rN/3owBCLcwGPmyQOYp/ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB8218.namprd12.prod.outlook.com (2603:10b6:8:f2::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Mon, 13 Oct 2025 06:21:50 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 06:21:50 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: [PATCH v5 13/14] nova-core: falcon: Add support to write firmware
 version
Date: Mon, 13 Oct 2025 17:20:39 +1100
Message-ID: <20251013062041.1639529-14-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013062041.1639529-1-apopple@nvidia.com>
References: <20251013062041.1639529-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0096.ausprd01.prod.outlook.com
 (2603:10c6:10:207::15) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: b49e4e86-88c7-49af-0c02-08de0a20cbb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fH7ebhRlqRZ9tDdX37X/8tjTGTZM5otxQKscNs2NCjEUC1VL077cpphjmvl5?=
 =?us-ascii?Q?JOylRrV0AIw7lsF61NEpQX/xYdxc+hgThHRdOI3LrcjSJk9Pv/3mXq30f+tm?=
 =?us-ascii?Q?jj+2pJLRbhmJDPmK3cgnITxMRQMoyrVwPRyMicr8SSd2O67yxhENpTwcWd+o?=
 =?us-ascii?Q?+wNtu6i7qkOQll+agpCwD+nuLPcuv/d8W6lCfu1raMmW3/rg+EjnADsf3wdT?=
 =?us-ascii?Q?hrQT8nDhHZxlEHWV7K2w1UnLsAoOXuLSIP04ClAj8Bmo05FciH4WuJnPqR7y?=
 =?us-ascii?Q?uQZpBHVL+2W4JANsxGliRrBtBJS32KcpG0QKkTI9ob9XMjoH+/EP8f7RkAFJ?=
 =?us-ascii?Q?Dm/tmwOpbVwAQFhwlM41XGrXZEjL6QhiWs9ckap75AHRNmmx+3gj4w+nO+jv?=
 =?us-ascii?Q?5Ej49AzCBik9gsf3PkpK6GLtWXto0bl+iuuPJ4cUWuZkJn2Dzktg5tj/Bjh+?=
 =?us-ascii?Q?WdQUpDJzdD2vLDPRXnd9pPdVIi/q8WHZ1/u2I1LdyGjSObNgC2LZGE/AkO6S?=
 =?us-ascii?Q?g2OS1AIa4wFQFa772tIcJZ+J+33WK6H41+YqOOWKd/WJfkgBPm60iIgVWt1n?=
 =?us-ascii?Q?LfMoIrJU+VDq1Gjo7IKWdU33c2aQIPtXWlPBPYiWrJifPUjCaUx10eALo9hg?=
 =?us-ascii?Q?/uAKiyQ49Nknq5uCxZJC2apVgWEqEgVTv113IAm7p+Zx8vxk+xQXnl2YecyQ?=
 =?us-ascii?Q?MVg2MCoLmpb7U4cZWQqLUwLOUsUwBaQ/W0n7cIIFLaUpQiuh9VxzGmSu4K4O?=
 =?us-ascii?Q?yaiC1rg//IaBy9JtSPrxlFzHE19UIMQ3PhViafiXPy5pFR8Kri4PgbLIdK+r?=
 =?us-ascii?Q?R3S6+q8KCqcIhJ2BbFcB2m3lMicfkAkhxNUHa1UrvcB3LFwzEAlseiAWJEdm?=
 =?us-ascii?Q?9GASFsZTMV8GsrxgHP3uC25mwH9PY1HTKjTPe9x08tbqhm8R6O3tPgZETsEX?=
 =?us-ascii?Q?I52lsfkYkvg5XV/ZUcIVwsmapsmc8PXNZp14nAqqcIJBimApkuAuOzYVFZ4U?=
 =?us-ascii?Q?fhfQoRb+AybrZDIPLsMFvSKP4pEI2d8yMLBs9e/pdLhufaHPDFOk6Ag2s9UD?=
 =?us-ascii?Q?p5FORadjnM1xbIg6iuhkwNoNXUND1i2PRen18dLds5eV2J9yNwcUSkgslXnX?=
 =?us-ascii?Q?/COFJK1eqPs5YQZ7GZ87+EPbQNhNRR5UB1Hs+DBnVeaYFVd0TYYe31ZLe+uO?=
 =?us-ascii?Q?OIvlq5MOKxa9zD3MusUsn2w32G/Cth6AIjEiNvYaNUKcOn8264PwxzegWv6w?=
 =?us-ascii?Q?Ur2j+KGqwLsKcYK+RG490q3CjxZP8KywqyBBUTDGd8RqTV9m2c2YKjvZaPQ+?=
 =?us-ascii?Q?97BBf4BQ8fjDG3ckiLxIBxKi8QEarHhlhReRP52wK2pSOTldZGNHpru3fLdl?=
 =?us-ascii?Q?UpmaCfpchE+1FXpINQeuF3Sb+jgSX+OpqQtKPEBt7AI3tKITivmnR/DDsU/d?=
 =?us-ascii?Q?Y9aoMtMxcNnJHcnSvBdsx0Ts2P45fYQy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/TOBYkuNO92Nq3V3fvRs/fs+05aetBgt/Rxwybt4KLMP/RPM5x5r4k1IbvkH?=
 =?us-ascii?Q?JmqFDdxnp9x05YW9k+liZPI+INTPDngdSiPBj+MkqcC1gNkZlhboeoesvltt?=
 =?us-ascii?Q?NF6n9HIdXXKjaetUu2h1jpPD/GKwK5y9NLyUuofIbW8p0tUQ5dtFpw10rbH6?=
 =?us-ascii?Q?DILm5lqjETNUBqUeLMesv0ByUp0tc4yYMImuTt2+TwgvNBvbIaXJBwAR7vhx?=
 =?us-ascii?Q?0lecpb9o4a2vZtoR1ULaCBCI4O1m5ax1qfjr7fRRwJY0t4ssb1RwF+x1KU8O?=
 =?us-ascii?Q?F/M9jxrd4LxEURyVyUORVsJI47ApSeCec3ATJJJRjBJU+gdQ+1+ImxBd0FPv?=
 =?us-ascii?Q?ccLdKM3V8ldl1Hi4g4nGTSVbNF07cASGimTZLVX5rmFiKzQ1N1gMJh69JhaS?=
 =?us-ascii?Q?E/l+9Mae7lG8BGhEWMM34lNAzyrxuHm991V3jrgA4nRSqxHQ+qMNojVR6838?=
 =?us-ascii?Q?W43g3b1V9rxt8fjpiHmocmTzAh6lNE0U9DQu48jFh/rQHs+14RDr5hYemoEO?=
 =?us-ascii?Q?A6kOsTGIDgck6/opwgJpW77GERp0o9nm/E2lgTU4psmTBP2IfJNtFwsxLbPU?=
 =?us-ascii?Q?d2fLlQUqXMbMddY6G97P0rvKUquxjspaxcP1oL0gmj7Jo6jfFCTYloXpDd/8?=
 =?us-ascii?Q?KgSSmwQWevAokJJNB2SPELpwupl5md15hDZJvfclDCet5XVXenAODRSQRTWo?=
 =?us-ascii?Q?irKewiG/FTCcOhTM4Qw9DxRKKj918G3z9RLZLYk7MfTQYniDyrz+Z5qZGkoA?=
 =?us-ascii?Q?uDBg9ECwDa1BvwVo5q4s50p+ydXTT/bQzjg1JVNNIMq9Ef8bF2i5Hi13ANFy?=
 =?us-ascii?Q?sYZltejOCVskwMCZS87Yystwl3csRjmEvOOeF4iQOmZG7lqZ6+EOGhxbLycS?=
 =?us-ascii?Q?VbyJr49w2X1uLSDkgK6w56o3nOPDonWcL04BcaHizJCj/nV6aySK50T7G/Wy?=
 =?us-ascii?Q?wHxDowpnFbYtNvb8ulaoMMiNEe53UdNmO93WGA+BWoFgxsCDWCFpHFSo18ad?=
 =?us-ascii?Q?qu3C/Y+gvgwVwJ+cZyzj2wh1yBsoF2j0aZPufcXJGYJhT9HBkZWPlESxkZoO?=
 =?us-ascii?Q?WmoqspytJYq8RmhTYGA/ZwWC+nkHSDCiuSWCc1jeLpV0NNT/J33f/Gc5zXzq?=
 =?us-ascii?Q?wbF3Lm+X1gUuFOdbmkYKj3exrV6P6cCuLUxmrBTSQKqeIh9IG30zyzNSXi0F?=
 =?us-ascii?Q?EwYnWnUqXoze1pg8mxY+PyNp9FY3XwtGXM/rR7uZG34oxkpH4N/297JYf5fS?=
 =?us-ascii?Q?DGPG+MxwGuG1W9zi7Q16V7BJCpB5slWVcE+Ip6uSAFSMjb23pTL+51RMW/mp?=
 =?us-ascii?Q?tPQG1oEPWrABYzuOY4nEoGOIz58NxAEytIoQBWp340/AF0fUshvflhWI6hNl?=
 =?us-ascii?Q?MfkdN/Y+XNOdKw44YsJVP5Ej5XD696ed/sS5mrtnJXEvicXmf6PiCwhqPBwC?=
 =?us-ascii?Q?a5OLAeTw71NkECkzF8b509ma6X3iX9Ua4qey8uOxR6nZE5DB9XqApm09Wqtq?=
 =?us-ascii?Q?sHX85qzC7e1kf9px23TrhKH84qSysltjuRlbMrxpvekw71eszyxh+RlFY0OR?=
 =?us-ascii?Q?XUInoTV7UCT6RG417ihuLHVS786tTYbe2MVM2APR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b49e4e86-88c7-49af-0c02-08de0a20cbb9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 06:21:50.8035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3WVWlseKszE9L5O+N3npCFTh5+NAwtcOnwgb9y1kQ4V/3iT3vItCdBuBZOf7sGmwcZnGZTIqNM+uJ4XAdaPlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8218
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

From: Joel Fernandes <joelagnelf@nvidia.com>

This will be needed by both the GSP boot code as well as GSP resume code
in the sequencer.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>

---

Changes for v5:
 - Make it infallible
---
 drivers/gpu/nova-core/falcon.rs | 8 ++++++++
 drivers/gpu/nova-core/regs.rs   | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 185ed6d1cfb8..c871fd061987 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -515,4 +515,12 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
         cpuctl.active_stat()
     }
+
+    /// Write the application version to the OS register.
+    #[expect(dead_code)]
+    pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) {
+        regs::NV_PFALCON_FALCON_OS::default()
+            .set_value(app_version)
+            .write(bar, &E::ID);
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 3bd1bddb16bb..6eda5c44c599 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -215,6 +215,12 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     31:0    value as u32;
 });
 
+// Used to store version information about the firmware running
+// on the Falcon processor.
+register!(NV_PFALCON_FALCON_OS @ PFalconBase[0x00000080] {
+    31:0    value as u32;
+});
+
 register!(NV_PFALCON_FALCON_RM @ PFalconBase[0x00000084] {
     31:0    value as u32;
 });
-- 
2.50.1

