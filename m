Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E11B9061A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 13:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA2010E444;
	Mon, 22 Sep 2025 11:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h7U5oe3I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010023.outbound.protection.outlook.com [52.101.201.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC1B10E44A;
 Mon, 22 Sep 2025 11:31:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkm972cAa8xdKCVOLkFcP3gRS7yZEcyLTLUKK0lh44coHj414HSCSW2pNUlxDSdaSQhI4qoxcgcsDGoQcdg7yRyjtdxNYe6MLLamC8TEdPGgCLcXv7sbEEkrCLBrfJERKq3bAKb7a76jJ+Yeal/oRWaO+pOk7d/+iQTa7awxCI1NdMeZYhPLULnBkHV1QZRc16jXVfZZHYvhH3BV3GSxIq8aGne+oiqnKlkfJSEzQY6nptsp3MuoaWcbOx3tr3UG2bPkM/NBKN2STDHi6QxPqKOjb/C+tfIZ3Pcs2pEBV43kbklHZmlPQskDcI5kuFSQM36W84GDQgtacsYa/+epAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrnYCDSvBfyzt8LZfoY4QTUTPBSB5q1l1zY9XtsEx+M=;
 b=fowz5Bq/uMkfKIdPcFEGsb0Fh7e9bjH1SbT+MEkeQ1DBOxhzBXa6V9GMuBljdcOiLS3MkyujMl/u032r2G02bPUBkFHMb4a2jIh4asE28XJHT2sOQNtmYKE5Fz6+toGUZ3WdJnVGD4RpIbtOWVwHv7jRzpElq9xDea4DOp8gkrx1CJOaDRj2HOWzdv9WIHMvC60/NiNSVSWQv0IhURBLjGCJvf4rjC07GK6GBuegp3SGOgTsTJiNj163CXl8EBsCJ2V5MW6LYmHP846ld+hujypoA7l5AB7w+BoohyxqWvjwDcCT1AmcQLTHpqj2AG5Wzzz4p9fe0B+rKx1ge0Yowg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrnYCDSvBfyzt8LZfoY4QTUTPBSB5q1l1zY9XtsEx+M=;
 b=h7U5oe3IP/GElPdfujZv7Xw169JdAflVrtSrEuxHB3/YnpJRvtFnX75NboWim27EVmohrKptoI4qw1I5kV17VUGwo/trFt5/1G3A6oWYrF4RhZK9r5acjUaQWzO3e2o/qKXsay9Q1SPX2lqugFHejECxKHZUHIeT73aBS3IGNCyaIzu34q7rCnGszropuwzZPx6lyfVZRrCQG5R+umXEf2G54weeWlA4D7rRgsnAGNJoTm/UPOL0Kxh/ZyFTWmmo20CngyZ0R1XrkY94IKH/uJacw92g1nrSvfb2Z2CVpUFI9osg7UZ2xsL2PP9gMDGDuKN3O7sSIubf/yOBvhHpfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY8PR12MB7683.namprd12.prod.outlook.com (2603:10b6:930:86::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.14; Mon, 22 Sep 2025 11:31:29 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 11:31:29 +0000
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
 nouveau@lists.freedesktop.org
Subject: [PATCH v2 09/10] nova-core: falcon: Add support to write firmware
 version
Date: Mon, 22 Sep 2025 21:30:25 +1000
Message-ID: <20250922113026.3083103-10-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250922113026.3083103-1-apopple@nvidia.com>
References: <20250922113026.3083103-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0032.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:206::11) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY8PR12MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b7c2bf-c439-49fb-5cb8-08ddf9cb929f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WUz2P1cdBwnyMA3O2m9PpTByQ4Bk1aM0BNmgQbE1cwng/0tHU1xixNPKgO2M?=
 =?us-ascii?Q?JuYzSPw0QyoJ+PdX2gy3EbQZ5SmQG30ntCOOVNjryo7B3zPz7jewsmPGAmyD?=
 =?us-ascii?Q?23BkCsAlf14sbmXRud37YRgsgMnOQ/lwrJ595RqCP1qNGYmFI2ZHcT0IPwTu?=
 =?us-ascii?Q?zhZXewujycnM1JA5oSyDe9VdQbMsZ3D3HqP8JiqaVWVhCQKQEYbVM/w4+eqQ?=
 =?us-ascii?Q?1IPqfzYrWy2wyWYCE0k92dJU+CjI+E79gzUTsZhE2nRZIqfaP6i0VtVw7f7z?=
 =?us-ascii?Q?KCNvYaAJO90PExhuIRUcNPXJ8eZjXPNLvJ01M9ViDQ7bChNl+cSv69n4fAyH?=
 =?us-ascii?Q?IgsiYZ1a9USCAXVgiE+Hm+ZRsUxNcxFesZUkykxqi2YB6JaHJ5Mo0PCtNlv3?=
 =?us-ascii?Q?WRgi++xhREL95u+MfYiiuzQGf2ISr9YgfE/TARwupBZfmq0JGWcg8Uxmpe67?=
 =?us-ascii?Q?HHu6eiz1RZa0gP4Y8Rpr1Zms1hYIIJj3IyULNCJcNodXKeFumETbBp+O3TZm?=
 =?us-ascii?Q?B6YmBwOVGOknvNEeOy1ce00tQr+PkuuTN8KA2qRoADxjfT/vk8axMbhz4u6O?=
 =?us-ascii?Q?Ga35o/c4UAzX93SlYRzIzOQ0bp5214PykJuASDSDpQnucX6VNu87GN2+RBf6?=
 =?us-ascii?Q?2Y8WJ283wDkyLa5yZh5WQ2hFQaiKTQiYuQJPcJDXr7JtUDlvNiPisXc+sJo7?=
 =?us-ascii?Q?xpArubqnhc36Pm/zTDhvWFBKS/WDgOdfj/5+tDH11cC9EIhd3L9/IQ4F5CG6?=
 =?us-ascii?Q?5cIwQVfAVZBERJTNQH5LVSWIFg7vMUi5AdH2tAjJnOw/MaDhe/O4Z/+MNrp9?=
 =?us-ascii?Q?F1JiN8vlv+l2ZbRZSADA8gtSIPbBerHDk3/Pmlc2qusSONLfrIxgRZfaqaAv?=
 =?us-ascii?Q?CQenUfeEeclnq6cfgP+Vz2sg0b9KRMjcJ/r/T4fc5pVoYYfgKSUurP1+c3y4?=
 =?us-ascii?Q?AvrYeIkZ+VcC6YBDA4xKCaQbD7fk6UfWn4sDnV+rWhNf2khJZyPYnf2vOLLC?=
 =?us-ascii?Q?c2MayDFbBpvogE7An+Iwz8MGgzrw19GNhq+CyNEZ9kLrS9uneXGpCEebh+GB?=
 =?us-ascii?Q?F7d4nORz3An8XUPpKFdHIjF/Zfh3WzWYIJnhVzYiy3DLEDYs4wCwqd85CeV+?=
 =?us-ascii?Q?TQ/ZmmxH40vTc5rMOuzQNwpRr/Jk+qZLGuLG/T4qntpCl/VBbNCLTwMHj7rX?=
 =?us-ascii?Q?gBnFWCUCoq0xse9bEbOLOTf4q+qRhp9Pb/Ezpsky0j+An/zb1mh7Ee5HCUTC?=
 =?us-ascii?Q?7PNCk70CT5EtyCBbwQe4+CbRWlBVFEck/c4oVjiAaHjz7koDH1vl8Yty7MwY?=
 =?us-ascii?Q?p4aHKjR7pHSNJ3hEXYM0dpG4jjEyeoEb0/Bj9vwA25DYC5c0FQJN4x2fSd7G?=
 =?us-ascii?Q?DeFa5mpu0L+efHL/S9V73NlZrOrlBu9rs34c+yFgfikJl86d1A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GHcsxjv6duKV4Ym2HkuDk3eTO9y8M6/+kYxXY/Bwf8T9+UWE8f9txBm+H7vi?=
 =?us-ascii?Q?D6UmMWU+vnPrXrhGo25kHP2rCxJy2xTvPB4UWsCDOL9Kkm8waZEQxfOi07in?=
 =?us-ascii?Q?wk6b1zyzEG1pZ+HS4XWWGYMOBo7oM4vOsdmDV6mW29JUMr/nJKn1250Si2CN?=
 =?us-ascii?Q?Ifh60T03pcyC22vbRnu+PnLXEjoaon6uXCbPCZT/Di3KcFzxz+LXv5GzpCoD?=
 =?us-ascii?Q?wixrxQQhMQnjlWx48O995Ywg/uu3vpR38fTw3BK9Sn3azNmsxJozVPlvgv1z?=
 =?us-ascii?Q?STKScC33ktKKuVzlEkesd8msW/yRxq4icZL7YvsTQloO/pfLVjx4pQWVa+DB?=
 =?us-ascii?Q?dZvSy2nM0Z90jEZnNXkPr8lPzvK0zAmKksxqXcjB6B9j1JM/JOG6OpRfEe/u?=
 =?us-ascii?Q?Liw/VBlVpkhEZ8sD4TJVmLHNrMVbYhfLo+KA24/goSZTQBhIKtkD/9E1fR6X?=
 =?us-ascii?Q?4boRsJHXU/kcm8mbwntFogmYf0v6YQU67vERapl/YPkkUtF95wY6VfLXHweF?=
 =?us-ascii?Q?2Bm5CBjnmZCXU+HrM8Ouf/XnWnAM5XbcfeZRGryauWwyxyOb9yzrUoDaQQKI?=
 =?us-ascii?Q?b+c3JdB4cIXbrCFP8EE2D0sfcKG5qgujCLvm3IaDnbBtqa40+i1OUQZ2CJaf?=
 =?us-ascii?Q?uvJeZiIVOAVT9AdNHcN1SEto2CLOmoR+Ee+qg+x3vRW1kRBx2Hb6EpKcs3sz?=
 =?us-ascii?Q?3RDR4GZFKLCBD2oJxZk1h1H4+gUTlhmzaDPMcaB5NRFljHp4myu0OQjMmBtc?=
 =?us-ascii?Q?yDmaYu1m+OmEzA+AiaLjHWM2IkHQ4tup6+krrFtuWf/ycfaLab+tM3d2uLt9?=
 =?us-ascii?Q?16OiWetpM8rq/0MSYXKi4C3C3oDPbvGmuyqtAgt8wgm6iP6sIlvYyvk4FLp0?=
 =?us-ascii?Q?f9n61Q5EXBUtudxGV2l0I76EwzxFxlkzGq/uRGTVHTzbA0NWpceihiGIPfAG?=
 =?us-ascii?Q?TuHhmOtUb8diqz0JsQd8wHQEYnO+iLsdGHO8f7AhxCjrkCU3zaw5P0vQQ0Hp?=
 =?us-ascii?Q?ZItGzSs/Y8lxuF2VkpEWcLyzC8eOp+fLO98QuFy7bZL9QXL97SjDVc8cw82v?=
 =?us-ascii?Q?3IhQ5e8KkbVGTFWAcnzpd2NSHsBl58L8f5A62GiWG69PqsQ4aQGsue1kPi4N?=
 =?us-ascii?Q?e8ej8MI5aNnVVVaMTQCY3OOb1RAmnquMyRFG+YRA5B2wa3ZNGMpuEZGxPffX?=
 =?us-ascii?Q?qC5oET1GSuHLvlfhWadT0vs7E5HJtNB5zAaslTMKwfLcWkBzJEzdVMWp+joM?=
 =?us-ascii?Q?/BvQuYU/vTMr4Zr32Mk7mYC+cw8piTDVbo4ip7dJEXeiOtlNSOAqkPAA8Dzh?=
 =?us-ascii?Q?tjXdXE17ErBjReBubX/TuflVGIc3AuPtqKPoFwz3s1AnFRs6S1m+sWGFRZVx?=
 =?us-ascii?Q?c8i8frab3AUW4EeEiweNshninwN1X4fU8PC3mLagjxiWQCHIDCC1PnzZ7/zf?=
 =?us-ascii?Q?0SEFiLft7GqCr0xBdu/nghd7LjC0QkTCfR5Tlv7gszlWI2tAPBmsTXx6u0q7?=
 =?us-ascii?Q?bjdsV2dhnxscQlKoale2vI7VeW67YBdF2PVwTBA3Lvtzrl6lWgeJb/igWs1w?=
 =?us-ascii?Q?Y2uYcR+a3CnZDdtbxj56Gbf9ROWbIAU19uTZVs/W?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b7c2bf-c439-49fb-5cb8-08ddf9cb929f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 11:31:29.1823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3wFl0Ho6p9OXK/Phi4+Lu1P0zTHSQfgy5JTNd01GX0f0AFlKOGZ6f4MhLR+Z9V9Peo3bFIfL/ausa5rtIL7AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7683
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
---
 drivers/gpu/nova-core/falcon.rs | 9 +++++++++
 drivers/gpu/nova-core/regs.rs   | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index c7907f16bcf4..0cb7821341ed 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -619,4 +619,13 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> Result<bool> {
         let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
         Ok(cpuctl.active_stat())
     }
+
+    /// Write the application version to the OS register.
+    #[expect(dead_code)]
+    pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) -> Result<()> {
+        regs::NV_PFALCON_FALCON_OS::default()
+            .set_value(app_version)
+            .write(bar, &E::ID);
+        Ok(())
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 5df6a2bf42ad..d9212fa50197 100644
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

