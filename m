Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF36B3C1C3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B593B10E1B2;
	Fri, 29 Aug 2025 17:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gUZEVv95";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369E310E1B2;
 Fri, 29 Aug 2025 17:33:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpVQ76h4ZHPCD+CyO3agcr3sIFzooWmjBRmFN0DfhHTNgp5eiqkAxEZAMo83j+JMNPoqhak4E1N7nh5pyJ6zUOVLIseyPSWOZrN6919InpmJ84RF0PwXHkd3WiRLKNRjFf2drkir0LA+dGTM/3G+ryOi9nv85Q3zcdKOiVr3nnFC3uLeGWMmiU99dHWHuMNntvb/te0AeoF0/RnDgsdfIzqAtfOfzf6N2iyFdaq2wCW4NFixT3ZFihWOzlZjSEc1KJ0XuS2upRxcxleT60Zo3uxPj4VQqvatfhy4EDXptoQUV/FUYQhy9v4clowo0v2FxE5s4DkfGpl5wOht3QmrSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HVNbMYLNSSqRKUdPlvgzJSR2cNfIM4vDl1m8t+UMsU=;
 b=Bq9olxpS0/CRHARwcMNwE+eyBn1/pVqsr67NNHiQLAjS2pNl0sUvWX1FAyP1xpgXKwxCKKzTpCMucSzZ3R/Run09d1OiDde/j1AhxRLPXpb1/dcEK+WeSN1zpOtlqtDWkvXMbFdh50QLrnvQ0yvRTxSNhRj4pnhjj+7dCDOzF83TyoWbjxhMq1/a4fZptNlfXeVhVpI3VdFr8tPTfV1cP+dx7rCA6Wl+GNPmEaODIzOXqn5CPchk9u5l0jHPscqD+c4UzAC6IoDDhzBlMUNSKrhlC8jOX6YPWLVxuvOCR9NAU2JiuFFiryyCQjjyfzwNrkN6ypiCmBPDtlYosUi+hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HVNbMYLNSSqRKUdPlvgzJSR2cNfIM4vDl1m8t+UMsU=;
 b=gUZEVv953vvWEZiQ0jtkUQbjXIys/vt3U9GOFM3j10E4C1hCP9zSl9iFkidesAHihNZL1q5w6KtFvRGop9z7/Oz1+REyRBRvzjVvT+dSKNdQSvKC3uvgv8xQ8eI0h9EaSUi4SVsX1LNpxb4LeRoaR7lS6SafcpqMjLVKCN1ZxoaZqRtvHEOmWfVnytBMCiMXCDCxnHkS3f++206L9GX37ZoNCbwpDB1+PgWAZr0MyK/2OQt5zLPlMq5F4jJZRDXShuLFB84s/e1ultkbfbVejYzClrsiLCnLgXJM0/cQg205yATD32KnZUEz2adRabfJPO23noiJwq5ziPoP1fIZng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Fri, 29 Aug
 2025 17:33:11 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 17:33:11 +0000
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
Subject: [PATCH 02/17] nova-core: falcon: Move start functionality into
 separate helper
Date: Fri, 29 Aug 2025 13:32:39 -0400
Message-Id: <20250829173254.2068763-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829173254.2068763-1-joelagnelf@nvidia.com>
References: <20250829173254.2068763-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:208:32b::30) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b3712a-f7c6-4af8-af1e-08dde7222053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v6Z1x+Hm12vnkW6FmgBjP5xRlZp/FKmi2ZwmyAr5Lx5zGaD0/BiAIsdik6fJ?=
 =?us-ascii?Q?RUOuuiDcVm7vckEg4IB2vOuhVMM+DW6oMLZy9W41dXbyc0Pv7seXrSrnAclC?=
 =?us-ascii?Q?Dgmo1Q3oJP92gEwEdQhN2B/OtFppEKUZf/Q2sqfAJM6jB2y7bHE9C3O0547E?=
 =?us-ascii?Q?vgGA+PMoQHlnmBSpgV4JT++GeSCq3AEwrEJBcZLgrj0+kgENxbVXXpqGIly9?=
 =?us-ascii?Q?MMmaH9YVhzK7qudapFyyc6vhRFkhNaytw+9fW3xeq8QL33uegBVuFw3paG3p?=
 =?us-ascii?Q?YPcBZiTRrimOgQXwip+2RLvHGcS5Pw9ziuAGhs7zjbVKhc9OFdagDvfeuV4C?=
 =?us-ascii?Q?8hY44eZLkxtqPSft64oHl/aN7ATgzUqmt/jVdOG1A0R6QuBGIbU2wF3RvDzA?=
 =?us-ascii?Q?gUFPc4q5qB0j1bSOaL84xs+VFw8D5IQNsHEYibvPqAu6NOLf3YaVswAuweVW?=
 =?us-ascii?Q?d0J3I7RvYivDhZM8kQDqhPcQCLWeoAdVRxSJioDjBizlJJAx8zDOgJrMUpDd?=
 =?us-ascii?Q?TOt5ES0EfKZIRrDNlIUbaX8NZ8ozliXCn/pSdDfNWwtHfzHy3VjFu8d9tSRL?=
 =?us-ascii?Q?XsoFXA3Sr7CfCLa6BexT/l6E3GpkWLJws9slOfFpP1E+rbZMTa5kfyL9dFex?=
 =?us-ascii?Q?mS+WaVdha+VMwNCqwGsLhsTP9c9VqfHYnwhXSI9wmvp7PWWZb4+WnpJbWP9G?=
 =?us-ascii?Q?O23ORbVFuK3v9fZX+vV7LZE3H1/AMo35CSNzB1JfsgmVON2pd1nTQ6y8lGa0?=
 =?us-ascii?Q?8NBIA+JHbPDrqtmOZULEqY8JRASdcS6T1/LQ48Q0VJJ7CW+phvgwif0GN/Yh?=
 =?us-ascii?Q?6nmudqvHWs/ONDE+9NAEMh/Tmz+zE8RL1+cPHBbPvpvjKd27Z+tydhrJGbt3?=
 =?us-ascii?Q?kX6mXaaW2RUp5Nb5aKO9KrT6qH4yXpKuEAty92/FX/edV3uIw1CJG6RhmJqU?=
 =?us-ascii?Q?+b8XKAUrN1n9UA1XDzHQW5yN4SeeyPoPriVNjtwlrwyM2Kk8UzQn0gYZwQjg?=
 =?us-ascii?Q?Pn4/aXB5k4NB00kYPA7cT3WAJihebbuzVcCi9OBo65iLwByv+knrvNGmo/8Z?=
 =?us-ascii?Q?4+9t81eOCI/x5VgQNUS4EuaPo/agVDJ45HKbK7m2HY7WQPaz2pzBktN2tED9?=
 =?us-ascii?Q?IPHfKPTNyDB3x5uQtIpXcKyQp5jrJ7c2GAc0nc3pIIAR4gBDgi9XI1Jz7r/t?=
 =?us-ascii?Q?FhoUI7QPNH+zrjUjan7FChMkLJ77418wZ4U2SQK2K6bXW/5rFqH4bFnvt04c?=
 =?us-ascii?Q?M7PWuq+yhsOsx0ZE6MUZOEU13S2Zalz63lC7bwPmnAskzNWWZfp4ZPB1adP1?=
 =?us-ascii?Q?SrDkTStjBWzlz9wlHUMgTeehbSB3Hdgkme2o/aPviIp/Z4KTXgtDTuZUzx/K?=
 =?us-ascii?Q?OztTmTn6YUyLBG5+NEqKsEYDr4gxZPM5fdmgEUk/KJseZNWcXlixb6wYZJvt?=
 =?us-ascii?Q?lZxET9feXxs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ob2Mw7OM7pDDv5Yq5cBGBksLBubZ0V+SFmmRXJHOsGOvwQYLk3u2Iy7z/0HC?=
 =?us-ascii?Q?d1cS2l9S9XTAq0lyDg9NbUPJBkadZM432+wuNWBfRkYQC5W/c6ZNDwx27CCY?=
 =?us-ascii?Q?0KhGQzMQmxU7u9rCn1CFlR/oPh314jav5T7brFM/Dv7Q611ga39evWi4lu5X?=
 =?us-ascii?Q?f5u/uSgNuevkTiCe3IOKjQvNDyU2xFYnT9AmkduROl8NxD3zL2uiZVa2tDwE?=
 =?us-ascii?Q?VYtZDrLH5rLc/eLlfd+zJsNDbxAoJObg8kWg55WgQ6Q9qPyJ1QBQEGvnbmWH?=
 =?us-ascii?Q?4p3lmQPGBjA8s8G4urC9wxKGfxEhG400q7HVJPf/RYnhrf2rkNnohHvkRNGK?=
 =?us-ascii?Q?nBZTbTX7oGQTSnApp2QjGYPzG+0gWZrI0b81usSc5814T8ThRyAkaowAEtTj?=
 =?us-ascii?Q?t9VP7xV5/gQIDSN0XLCE5lRPld47Z1lYIgnIXCB+8xXhTVS2cFwKDNTfWd4g?=
 =?us-ascii?Q?c3Jat8GQ/GkV0EDL4szyt+hAkZ/yX4zq6LWZOmTIduuW2jWW4r7cbkiLGNSa?=
 =?us-ascii?Q?k+oZeZltUu5YyhuKFudstdgdfRx25gfrrw2c0eDOKpzghQmINZIaoB2YkeqX?=
 =?us-ascii?Q?/vfGe4Q1PVGkH04tWi1LnQ5bMOA35W8otkeeHqu0aSn7S/2x0qDFnoVcPXUv?=
 =?us-ascii?Q?tbYBtLPvdIHt7uz06G5ZX+wT4T7SrXX30sd/5BDDd5x5wzahgDVA1PrK/DmQ?=
 =?us-ascii?Q?Hn78q5QIsowU96Ld889WskbpxYGcsySzrnj+RWG8NpCBYty4rO6D0UmClRz0?=
 =?us-ascii?Q?OupKZaHyYFNkUPpcNRx+dyaiUvViEG5X9w0RTqK9Jb15sOM1IzNSLz8riRXV?=
 =?us-ascii?Q?iqZXl7pon+HDpV0vCDqN7pN5VLaDWc28MfWw+GFXkyziEfAZ+yNi2DVqTk0Y?=
 =?us-ascii?Q?x+aNICHvYjGqSsfvAmOhOcdDob0W2tsMsxaAd8ctsGVD0IC+Kvc+4NkOfR43?=
 =?us-ascii?Q?tqoTnjxqk1dr7o5Mpb9bckVfxryVHKJqucd0UhcvBjE6WgsVe0Wuz+15jbQz?=
 =?us-ascii?Q?iHwBnW1K6ZyId9QoVedgvxCEEBT1BC1zsI3914tBEOdlW0oRT1wWt4eADljQ?=
 =?us-ascii?Q?ZaY7UfhZeC4nRxjG5cbT5HrqbG5nQlKj2cccK8kkR1tB+fpTFBjykQ48+WsK?=
 =?us-ascii?Q?MCHTcxT63qM0XQpE4S+CrS/puqxj036PBM5FSK2OKe3HrgNoQfMuX9YRz2oT?=
 =?us-ascii?Q?MqUZzXJx68q8BhlLX5tp2TAcQBaSX/P9pitgC3gZh/E6+ywrdds+Arh3WfBA?=
 =?us-ascii?Q?pDGhcgXh0SFP1KHotCWe0+SQvAS2rNYIsKBKJja8cpAMeTbYSnBWIWW4nSrb?=
 =?us-ascii?Q?HhykEk0hxf4tWljcC3Yn4EphjrAHo1xfaVzQyo8v1ksj8FZxfbPEXDmzHmOw?=
 =?us-ascii?Q?dJp3BqIY00O9V+ktbEthiPX249OwCGW8ZCvGjE8tZ77SJL8++FN63Lb6IsVP?=
 =?us-ascii?Q?5hPyzQL8o2MhV8IRsx0DZIhxLuQpKY9qRe0VsaN8JjfDe/giBY7alDVKgONE?=
 =?us-ascii?Q?nd4Ci8hpAfk0U1Z7X/rTk5faFVhUSfqgL5Bmu/4RXOw684sRVFoW/EhY62TT?=
 =?us-ascii?Q?KOOoz5BXiqsG+PsfbAe4io8yASaRrKQBUGXm+oPJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b3712a-f7c6-4af8-af1e-08dde7222053
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:33:11.4789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3p2/cre522gydSKhBoLvNQJ7logxrlL61Uk6Si2Kt7jeF6IKBPL/7f3PkMoeMWOwWgWNhRAJGSYMwJnDV/38w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6017
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

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 83e40a7abde0..e51f4d7469c0 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -562,7 +562,21 @@ pub(crate) fn wait_till_halted(&self, bar: &Bar0) -> Result<()> {
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
@@ -587,15 +601,7 @@ pub(crate) fn boot(
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

