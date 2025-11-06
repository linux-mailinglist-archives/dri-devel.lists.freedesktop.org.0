Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C18B7C3DBF6
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D6310E9F1;
	Thu,  6 Nov 2025 23:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BDWOwFve";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010017.outbound.protection.outlook.com [52.101.85.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5C910E9F0;
 Thu,  6 Nov 2025 23:12:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOqXl74qr7sEE52G49FBySIrkJzOGcjxiKzC2jR53K/zdImW71YOYaNm1v66a6Rrfz+8S1h8QxrFhhXmhSRlzwNUHDbquHibBGw2raGofZCsokrMHGq8X3QaF3E1nEVDIbn7QxmjBpHdqvLIZHooVv7SWkJJ1WLSvGSHADhdRfrESbYo1PzZ5XylkFqIDD/UjjZwNVAzeVVf/bC5XHXLnZNF81VnvurZ27bVKtbGRYcrY/wBk08jzj2Jznvkyn/VzEQKkPQ7P3WEeVdgg2SYGRapoeXqKZRRtpCm+50zrI0X7OHFjkebF2K/HTiyhEV6/lGr5wLj2n5R49AHFhL0kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTVpQvybMtDc9QmIeCrOhBkg0OB+tKPgr98O2xMsdAE=;
 b=PJpGYyrBeRMV0ZVk4meVxn1w/RMspXQ2x9ITv0xFIq0Z/H31pA1gvnG7LBjHY9+IHeEf7a+LgBdl2ebIOwGrFNv2b5K0Bvysj89fMSgewkH74rb9CJYcxjaw9ZQYNXJ+OKxACdJ5mRnEPJjVwBnzIWkuNle0ncp1SpntkO30KNnfPEjHl/mq0K4XIZXOWO5h5w9W1RR+Ow+4tkvgyd/0Lem6/K9nLDZ7/17GLKUhr4v2B9d4hCd0du3mLm4kRBoWdfj333s5tvUDaU2OhV5gLMjF+UKur1yO6VUCihAjzGWc2EaQRmdgtydu+B7G5dX0si04mkiont1HusJ1JpCWIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTVpQvybMtDc9QmIeCrOhBkg0OB+tKPgr98O2xMsdAE=;
 b=BDWOwFveBp2LDEp5tGjPU5Ny1Ehhc+uDseHBElvRC4sR/hsq8dvuJuQMl7/dwdOunnHHbmS9Eg+qgtwB1BFmDZecATzKFK2Bo/kkhK5XMuPYV5VyngOrQYGT9fCyMXI8zORvTSEO3Ph9i6ZK8kVbaWTj3RexLcue9+mrlldiQerIkdxVzP+IngjbaCxZbjunaG0L58LkvtGlj2G/Y48/t6at3a0gpR1H0FNWHxoEc+ASqF8VuyFZK4JeXLdDzY4BlLctfxwJ2DA29OvxIZLlT6teQRCx0OdXgzGAYaPM07yXhat3+0evewY91jcBEbSw6yXWx2iF7X7ntJ4us7MlTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB8014.namprd12.prod.outlook.com (2603:10b6:510:27c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 23:12:03 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 23:12:03 +0000
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
Subject: [PATCH v3 04/14] gpu: nova-core: falcon: Move dma_reset functionality
 into helper
Date: Thu,  6 Nov 2025 18:11:43 -0500
Message-Id: <20251106231153.2925637-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106231153.2925637-1-joelagnelf@nvidia.com>
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::22) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: cd472e91-c44b-4703-de97-08de1d89e554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kYM2ut9eOABgUri1HK8RwiT91nMU/1G2n/9Iiv4z3b5eSl6Y3m3jk+99B2+Z?=
 =?us-ascii?Q?wm96F75G7qiWvJGA06Iwb8fS27/oU8V+et7s7lQlZZOwbkNl94kvJRcXB/Fi?=
 =?us-ascii?Q?YnGyfC4cAixaVy3Y3bxaEVTo/alGHr5+ZlIm/y+lNtplDJSD2N/uU9FeugCA?=
 =?us-ascii?Q?Fc07t0Qr5D1hHN9lobH2txjhM/kcCjRA0UUApRIxKZpGRvRob8HYRQrFeYAD?=
 =?us-ascii?Q?55b5sxT4SdGfxVMAtbmDfN7AbHhYqWjQNFmoCz33Q1LGkvyfROcEECRad8Kh?=
 =?us-ascii?Q?9bDaDi6Ce6NJuIchHH+7V6u/cGZI5oOznnGe+S9Xaie0AoDgReE3KeosmcAA?=
 =?us-ascii?Q?daIDdJjNZObecrsN8hXhkNSeDhtvsy0IF1XtHce02P/SYlp51TWYXZnjKib+?=
 =?us-ascii?Q?FKWKUpzwo3RoW7IZxtvg2s2UT/iiXO7swVcPgyURVxf0d4wPkoL1wd4MADLT?=
 =?us-ascii?Q?Ele0yvB+SHN+HYltx7FDX6GMwomOLRr4pehkoHv6oiMbxWDBpESBOJA7No7P?=
 =?us-ascii?Q?wUBZrV2M/y3xL6IbxfhA+SmdgH8JKRqn50+IWKF6j5v1d13+wwTZSybZd+RP?=
 =?us-ascii?Q?C2t8oBAR4DgiGRsbXK9E4KQnJkcrgCznZSMXGRKMz9uWT1a7SPQXXNGbSM6Z?=
 =?us-ascii?Q?B8QdYJXdwSzFQoHCKE+leLfBdyo3r2TOR35dWVJyxOTSAJM701ZD4bIwxn0a?=
 =?us-ascii?Q?CN9NXFJfP8/CI0BABYqelllJFEsZG7DloWsY+TdUoXvQrysKV7luRO7sVS4c?=
 =?us-ascii?Q?JnvBCaRgEKdPfGaDH1nUpsld752uQu+PGMVFurLKyPRpcnqdmoovzN/4oCB/?=
 =?us-ascii?Q?p1IGJ+iluHyPwpFXL//b/gW+LQkxCROFoYu5dmVjoOOu3CSxZgRdgKfJWJ0x?=
 =?us-ascii?Q?O6zsqXmistp74iyAzDvTf6RUalBCzFmTPQ0aOeDF1wW5QnVsIrEDo0fGveDi?=
 =?us-ascii?Q?v2OntiR/dUb6Op9Eoy+4ob24Vclzc6JnVLK6H166i+mI3WKgNeobYJyVfpLa?=
 =?us-ascii?Q?Kb8lioetL/GnGr8fuMsj/LoqC9RUk/9pl2VFefh7k/kZ70bUfvOGDn1221J4?=
 =?us-ascii?Q?N8EtVrGwM3RMKjc2L6XYLH8R5WPFwGhagWRmuLI7tUaBKusVfRhLK81i6zkc?=
 =?us-ascii?Q?W0bwBYHJ5ScxpOKdDFIRpzyugXE9SxbKwCO9Gb+iI9WWZKaGpekn0ANHCgmh?=
 =?us-ascii?Q?jw5X0BJS0xXnEpiEw3P2tBDmZ0LmqPHmUrkVk631Tr7R6Op4OafAJvD/xksQ?=
 =?us-ascii?Q?kZD0iRbbEHAiTOE4xe1tclb0slz4meopK3LvuhEweZEjc6AXQXgfo5ShjYlV?=
 =?us-ascii?Q?Zc9MgTocZtOdaj/vgpVrHAwoCbfxB3SbPA+hV6WCslwHgs74z2V5M9LCBsBk?=
 =?us-ascii?Q?0yhGYdb/VhSlfi1Z2jf/jKfgCo3mm8ikGDB4MJ/MvRucgGiIsSurjTIVnTqy?=
 =?us-ascii?Q?wLMPu6lVF4OW9Kbwr8tppQjqzG6HtQzq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VRT/LDdAvid8sOkY8cmTJFU+hCjpYIZDDzNo+aquLDYPYmjWG5lobADYrRey?=
 =?us-ascii?Q?IvJ6B6jQyU/kEZjYCjw/gRl3ToDI4wx3iJZYW1AQMtvwlFWltyC+m/NmKgpd?=
 =?us-ascii?Q?gp0T3Tvz7hlWfRKisMJrIkJXgEtSLMTIzJvjy8OVCGlqETbzFw7X0U3wpSQQ?=
 =?us-ascii?Q?lDdcFmIEUR3DPyONW6y0c2VnrgmrYV68U/cXOnbvICqvZ9OchhTYMMZrzIw+?=
 =?us-ascii?Q?0g1+ov6P1cgS3ogJHeNVjo5f7tAk2Wq0pYN9OBdZo378GhWcptYAhOV8LmS3?=
 =?us-ascii?Q?vAnWr81RvgkpEaS+cQY+iUIW8yHMmTMtn9bNMJhrm2ttFLzDJ5U8mTaQDNlL?=
 =?us-ascii?Q?y6kzD0ThVSWhQ4h+hq4vtFvsUEoNMKzWaXAEjuR6cPE3sQEWf9aJXGFb8F0c?=
 =?us-ascii?Q?Mv394ZeUwsbgVs3fykY1ghOKyXMOdh4Mf2i1b1XnuBC7Yqzp4WlX5hbuknis?=
 =?us-ascii?Q?0IcftuRztJWc8MPLB1Hk/Soc8pPs+DgS1OUKr1ieG8r2GRaRwfguhskdKpiX?=
 =?us-ascii?Q?MVnWechKSjRGtY4POmD8pzKWT2ZYS52fBeVbeG43DYUcHxv/++Cil7Y6m2l7?=
 =?us-ascii?Q?T0vBNfSM9ThYhYiBtLO9JZD9zEtdFBWeGJjzcA3hc4sQ+XB+rDbssUILW73F?=
 =?us-ascii?Q?5d0jza7uDUlwAXS8IAh/cJrt5R7KrmrOwWKRZ66635/T5p4lO0HkLbod4FEn?=
 =?us-ascii?Q?4c/3w/mQFRWDtRKleXbLlsg1xWU9OfTB5Ef0hN00nF31xRGVNzcIaZIEfFuu?=
 =?us-ascii?Q?0O6cnjiwUFsY+oQlZ1npuujb1ibroNf88ntO/jIow5PLkGMk8t72eO2PnH2o?=
 =?us-ascii?Q?aTrj0v6kHIIU3SPNr+AHlNmyI3XF7eFd6VdasFFWmm8W4R6oSzt+rAIXmUSv?=
 =?us-ascii?Q?gtpSLZwTUByLE8aJdGANhBYU2pygR/shdDW2ak32OoD4ZkjDOip4h4uIpH7D?=
 =?us-ascii?Q?hoQEgmhTxTqNjuVsgb/y5dFWOdw7c6A2WaCYTZNnSxjjPxOCx/uS85AOgSWJ?=
 =?us-ascii?Q?4uTPwGNNh4jM08Zh64GqBGSjFbfk4xx4FP51UMddkWwQ5YFVuZa9d2RweMii?=
 =?us-ascii?Q?VvCQfbEHbYsn1pRNVXIslCTsTKeYxoXfumPyCczZ7mZVUzgU7lAMG7a7iVT4?=
 =?us-ascii?Q?IPdiSvxSCYworipZZRZ/Ysozf2gkQkbUmfaD3XDUSQauhFfjQTRzzr2NIP05?=
 =?us-ascii?Q?k/rd0OgIc3LHGL5QTEFtNjye7nOY5Td1C5pr1c4XsaAUAdSE0GC2hGIBrqey?=
 =?us-ascii?Q?8w/j6PTnvcmrxEyprS+zVitrjxuTbAb7VrxGRNH+n5JtK4pU+a/NLR35+ndZ?=
 =?us-ascii?Q?ToUx2qc9PLKGUHglB7A9v4w2MicDWP4hUEl8t9gcuXhdboSHpllKlAM29cwR?=
 =?us-ascii?Q?htmFmWa9u8Lyazk45WNcRu2+f63StQHPETvSp2gCPFVUOSVeeqsFC73Nr925?=
 =?us-ascii?Q?KwyexDEpvhxEjDSGmwfTgmkkwDhnK86tcfp5cTW+b8DK14TB4W5tN7rzEkvH?=
 =?us-ascii?Q?fWxzVolDUYySKTrUDOC3asqd7/vI8K7jKDj/iX0ImweyMbpZx9WSZyxBsmKP?=
 =?us-ascii?Q?OGbIsSRJDQnND/Bg7lqofx8/2HIn40GrBDlJ2k6K?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd472e91-c44b-4703-de97-08de1d89e554
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 23:12:02.9652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dam+4Kn+vw3nphZy+l70VTH3HU14dXn06qV7sc8Ttyzgllxcv63yP3WJypXxlPRUdqx1D3ilHQYLqzDFh5Cp0g==
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

Move dma_reset so we can use it for the upcoming sequencer
functionality.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 181347feb3ca..964033ded3f2 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -371,6 +371,12 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result<Self> {
         })
     }
 
+    /// Resets DMA-related registers.
+    pub(crate) fn dma_reset(&self, bar: &Bar0) {
+        regs::NV_PFALCON_FBIF_CTL::update(bar, &E::ID, |v| v.set_allow_phys_no_ctx(true));
+        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
+    }
+
     /// Wait for memory scrubbing to complete.
     fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
         // TIMEOUT: memory scrubbing should complete in less than 20ms.
@@ -520,8 +526,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
     /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
     pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
-        regs::NV_PFALCON_FBIF_CTL::update(bar, &E::ID, |v| v.set_allow_phys_no_ctx(true));
-        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
+        self.dma_reset(bar);
         regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 0, |v| {
             v.set_target(FalconFbifTarget::CoherentSysmem)
                 .set_mem_type(FalconFbifMemType::Physical)
-- 
2.34.1

