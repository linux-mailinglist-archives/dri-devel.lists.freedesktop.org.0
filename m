Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D73BC30F8
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 02:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A305010E72F;
	Wed,  8 Oct 2025 00:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="K8uOotr/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013032.outbound.protection.outlook.com
 [40.93.201.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE0510E72F;
 Wed,  8 Oct 2025 00:14:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9rhDIGltxm4Ggiu1F7mCXEVsoEj47KMSxfTG8i5r4wiCMNoXgZ+DEeZ47tdzV7wihWsA9cIBoQLYR4Jpta1qZsOSReYwcbZCQzvrrgkuA1MBhH5fJSqbAfwCd5ZlOw3lmk9hwr2z+X66d+I9J+PtN4fzMogukTEYOvPl1OL2F5nfBiOd5yfii8swB9Ws44HV96kPdC3r2BvS3mtHxTFzerkhloeA1drDUibZmSVrc/D5AmtPJ29WiJSrula+1geDSVbTDowsQBdgc0Ht9R2I7Fo4FKtReIZjO0BeioDAYXT3NrfARhaP5hKuv162o3t/XtRTqK5Z5fMsUnTh8fCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PjBBS88kesQUItpxF3PEFBp3u3sENX38cl6NSTghgs=;
 b=NXuwndQ3T5xvalsw99gzYmRcSbCpOqAj8B7l8KtCzePscjBZ4ylF/iUB7jUi3hN5CA0cAt3Q4yjX+ul5MI1B9omotRwMusbqhf5uO0Csl4w4YwbNFJDzRB69xpXeerK0X10NoWweVzTyCZM7mgm5KqmM7SGrr9ZlbFMjmE0t5NxdL+tSkSCzZ5jHmpBGt9dJ5s4W8iGtezJyrtUKf07fo7fwW3aPfSGl8kGuMf7/4RUP0oBSBHcnz91sHYZtYzwHoZjs4fQpXBPU+pgHndHJ35GF0t16xHXEht7Nl3JDRP4/GLCOUIMTpD6HI/lhTTr8HHd2Wj9FHr6hkt2SoptgzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PjBBS88kesQUItpxF3PEFBp3u3sENX38cl6NSTghgs=;
 b=K8uOotr/N2O5FGM4AF9dzLQyALC1h2UXhGi1uzTV+v1/SCqgnWdrAxfFmDGghkJRgHR7v5mbX7EFYqxX+DudB7Hb7UVP28uf9XF+C7klHb8lAj+16KiOeiVDMscz2wORlLlCcfDncX/V8yiikgFM1q1ADYohSKl1u4VZA4+8NDE4n3WQF9nkDTjmH7oIE5Kx+VA0ECSmrEyUzgLVPN6mH876MJCTfK2rNANwkIkq+5phH8ekUjBCGvuaJr/9QtBqqcG8/uGZUOGqW+zppYJYESY3CzfMTyXsqFVWcbAVzJWcsAO3o7wlVlhzSvV77tGesAbBpP6PGEMrf9DtaOq3/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9; Wed, 8 Oct 2025 00:14:05 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 00:14:05 +0000
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
Subject: [PATCH v4 12/13] nova-core: falcon: Add support to write firmware
 version
Date: Wed,  8 Oct 2025 11:12:51 +1100
Message-ID: <20251008001253.437911-13-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251008001253.437911-1-apopple@nvidia.com>
References: <20251008001253.437911-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0128.ausprd01.prod.outlook.com
 (2603:10c6:10:1b9::8) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: 39186b0b-b327-4332-84de-08de05ff975d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4o3NcR2+h1xkBt42mnDSTNe6lqLVK2pQ9QKZpHiqsc7G/Xjb9JpM4EDUZj/M?=
 =?us-ascii?Q?1wfnaatRJSF+Rrgt0/06orYDLoe1LLmBhaiqPBU2uLzrpCnv9RrthVuQNJKu?=
 =?us-ascii?Q?Sf5efrBpbMrK7AxmAZ7/pxsj8Kv1mM6bdH8+FYdAEQm4Zv/mWaInniIgex8k?=
 =?us-ascii?Q?hscuT2xS+Io9lH60IzPUnIQ45eafydZbPDzLqLni/owPoLbZ7o95Hph5SmYR?=
 =?us-ascii?Q?Zh4VWlFjKmO9aV24NcPu4Edgoz0uLEV56ui9zed0m5yRuAk6H09Di5MGl5D/?=
 =?us-ascii?Q?6Y+Cbqpik3W67GBA3Ar5IoHe3JhJ6rMq3H1e7uiSV870uWC7ir8pK7neDN2/?=
 =?us-ascii?Q?XIrdwYtVZQLLr8e9SEWeVQO9JlebudlT3nh/nJWy5MliOSTqFHhm/XGX03nW?=
 =?us-ascii?Q?Hhd10cWJNh/9r1VGOT81ih11forFBouFX3+kGXyrKmrhV9gGvPeTjp+j9XZj?=
 =?us-ascii?Q?T5SBIhMjqgy+SBzDkfzQ8X4HgC0s43jLj2KBBTCQ/JYMiSQt81Npqmi0lEtA?=
 =?us-ascii?Q?DH1Pk3G3rt/wELgD18rV2mJS7FKzqQO0Xp/vW4m3Cg/HzKBUAcB3cnXN7LzP?=
 =?us-ascii?Q?3Qq8Ls+VT8AnEqtR8MSzFWOLfVoWT9+X+FZHyuLQwIDYx+jT2uQChW/j5r7q?=
 =?us-ascii?Q?XRgOfkc7LhqBjrfsVgd9NAMwbMRe5O3OSMvo2W1EsFKK8PshHAewukT6tHET?=
 =?us-ascii?Q?xCzBd44XrG/b2xQIjecpyaw8dbfqXh+Q333Rwfh8y3jPcgZSQ665Fk/p8UA5?=
 =?us-ascii?Q?PA+YXaUYY53WVIU7BGFlDWuQgHtgTnMxZ07fhyQrM2Y0vXFH8qysPMOWIj8J?=
 =?us-ascii?Q?cb0apjiiio+5SLby9vTMugbdlZ1h1IiFBWssdS/pOHszzHeFvt+4m7iQ2+60?=
 =?us-ascii?Q?6j60vyXUo+88L4LgPmh8X6PcUOXD5X3clQTry3wQwV9DuxkjrTkdywsNAv1L?=
 =?us-ascii?Q?YHgEwUF9vXD3hpWiabGFGwR2RLOmkCViUTR1ax3217WYTWpqHCjpf/EHVfgR?=
 =?us-ascii?Q?86ImVqVwvvXtUQrJqOFeXc+V6ttVF4EZ63uLXd4kcsfCrNfwGW/bYz4oBXvl?=
 =?us-ascii?Q?BPoqtR18sachS54wVXo9E1gWAM25jlBit6xTWG+qLGtaV3yZSA4CmpT9K+3G?=
 =?us-ascii?Q?pRPSWNcIE/YxRacDIXTQTt7GnRdxguAsubCNmaCXROUKx8Dud+KPg2s2LAAI?=
 =?us-ascii?Q?sEbVWlrJYuwP7K6osnjaHMccUaPDkgX1PQi/HPp/tvbO/CcbNbXEtVHBqOUp?=
 =?us-ascii?Q?8NCcpkrydU7Lt/dz8vBl4/2C7lD/VPPmWLg4hL823QlDYWUS7pEG88idKYO4?=
 =?us-ascii?Q?IN963eutG/LmlitjRaayLNfhdR8PzTsMb6AHlEo1wtgimJMMEhbhssKkRb0Y?=
 =?us-ascii?Q?soJR7HZDueZEb7aQuC7d7Q/p0rk+HxVvaFebi6A+GKVJIJ9xMmBUypDrZaXI?=
 =?us-ascii?Q?3xrg8KxnAXaRv4W2QnTOQdZJlh0Fpb3O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M/NtYtdWlSVCbk2tj4a0pIxV77GbeSkZQeELenkvhzkx2qq6FTMQ5XCBRWN5?=
 =?us-ascii?Q?oPCPN43JIzmzcgRSrgoSNnPGmyxU73T5h2vMdeCWRAer7cQduKP2doBP0UxI?=
 =?us-ascii?Q?kulc/af97fc33vyuvnM2dZfMij3nN0jvlbrrwIn/FUcGSVJe88skUdM54JvK?=
 =?us-ascii?Q?TB3fO2m3KSeX1z7kRjlDWNcgKazSB9rz3yeg+sX1g5q4GmUon0HPNmZj9phj?=
 =?us-ascii?Q?yOFoYPcP+m1vkg4Mu+B9WwBdq8PZCFsHHIEbB0ddF6TyK9n5Qxr7S3Fy28E1?=
 =?us-ascii?Q?r+wQyrTYhfYUzCprT+jnUKWeoEAkf/jjKk2tkLsyRnr/b3mfeZfFRBhuVYxI?=
 =?us-ascii?Q?EE819BGNe5lP4gM6X0ZU/TF69HajbMhfOQSxrI7HrHFNShys/mH8HQ9yPZnE?=
 =?us-ascii?Q?nPEOQ9Er3ndUmAyddWkA3Z1jRcQyLXuFrlV9uptI/Bs+tc8tILL7NoxrisGC?=
 =?us-ascii?Q?7TqQryZb2vVinCMxXZkAilS1M5UmUQWz9ykfOg3MPWr1aEaPDPilPRbuYYva?=
 =?us-ascii?Q?sHl4Q8+iyT9g7p1zMn5r2Vtjqf9wVLgUPdT8bS9vtznu7V2fOg5OHxKg5WLs?=
 =?us-ascii?Q?Bxl+ATytXg6hJYx5O4nhtma5mffd1TLyey5CHNX5r+IoaoQn1wIRu4ZEn6ry?=
 =?us-ascii?Q?//jaeDOcyzfUqF0ooUo2A4DJ3t5wO10n6W8RC2CaHQBvQrQf3nJuFyGgj35p?=
 =?us-ascii?Q?BVfVMMZKuOtajVqLxZPOerh4fVfXr9WqSzS182zFeeHvV5iNR1b19WPh57uG?=
 =?us-ascii?Q?C5fWXqYARMvPU/rQrHS8FlSRdOqVePAciBqQDDfx3QilU6eQeoclxApVv3Mt?=
 =?us-ascii?Q?B6QDzXFjqa9Mx18jLGcjNZl6DVVifhAhijwopw+d2QrbqNt5Jz3C+MQCCVdy?=
 =?us-ascii?Q?vpPCstBCTLRSx9NkXwa3AJ+4K/AKqkFnkwFJw+Qe9zRLO2MKpjhnqJ4EZA38?=
 =?us-ascii?Q?wuE0UrUgn/oHqCktXHe7Rj/01Z9UlaMfILGoih/6npRoANSyB2GVGNJYMvOg?=
 =?us-ascii?Q?S17JaONISIBeO+Pt0M9ujMhbSDeFS3GUrsWhClnZmkUUg9KwwpCoAijDDCwA?=
 =?us-ascii?Q?F1teB/u/1e9NO7PRQqSBACVV/p0QtJcjYwBw6IVJMCbAO0YHXj2evCAYcyWi?=
 =?us-ascii?Q?naa3gef9KLOZcglshGwUxYkIhMNc5cVy3zBERck1DAvBYxJDrzmkqdcN/7T4?=
 =?us-ascii?Q?nSG7fBLqsPr/a3fKQGQep4nuryKbVm36OknGVvhBSH1pRzCkRpedDRJ47p4X?=
 =?us-ascii?Q?N60r8i758GZ/BoAt7oYlBCbVE6IKha4mAVDEFAYQITAMI6jfRbdqV5g8zQ6o?=
 =?us-ascii?Q?dPCJ0R7tZJMvCnPJkcIPfv9mBM/mC6t1wjU2zrMRr+quxlK/lZjzsvfHL/QS?=
 =?us-ascii?Q?MKV1tdbeam2NAxiCAvJDP02LPYRVpNs6byU6k3GhbKVnozZYRKSCSrMmShjx?=
 =?us-ascii?Q?Myv5tYXLenBe/9+y4ZfdJiMhjxgAllvovZQpKOV/vDvR8llhr6wug/Qtpehl?=
 =?us-ascii?Q?fV252KOw6ACBx7QGjGhbddNPQ1h2uz3kVrt079Tc241cuQlohvZ3liF0QAPZ?=
 =?us-ascii?Q?8WWllH2GKC7OxcjWNeiCSlexuEW6akBszEpqMg1y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39186b0b-b327-4332-84de-08de05ff975d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 00:14:04.9351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTHqNSa+nzdbo6BTNrqyomx3CYM3LelwYtib0XeY97a7pI1+AUdA+jAG/MHVjynzvZyW/iL3Oi1+8BzK9jbdsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071
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
 drivers/gpu/nova-core/falcon.rs | 9 +++++++++
 drivers/gpu/nova-core/regs.rs   | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 185ed6d1cfb8..01869b8deb8a 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -515,4 +515,13 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
         cpuctl.active_stat()
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

