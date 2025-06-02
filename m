Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0282ACB635
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 17:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCB710E54C;
	Mon,  2 Jun 2025 15:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YTi/mp0V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6882D10E54C;
 Mon,  2 Jun 2025 15:15:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwRwj2SguyWg3G3j1K6onukxONpTmW5/0RJo7SbkgCQhVoxcQsJ4A9PAro7qwTlkxCPTLOj5u9hV1s8D7DUty8/IsiQ2Il7ylTpDYiJVfy8lbTtY29uYogvbQZLJGGCKpvg95Kf6xT9xfi0DobstaesstLhlK7zDacyYlKqk3PA0iJ5eGuf0FDB/xCrMr1BAB2NQMiX62dL6vqCPEdAMH5zY/twSmwawE3s5/kVsuRJ78hmRnPI375lKApOePKDuzPvI5YztC/WW+BDW8lDhhBXTtewdb2ugfkxXjYAKI94ubkE0G5iEBdJY349Tm5r4XO9pnYfrXpc169Gw4NUjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THPh+98VGzLRgm3mWakkQkGqPM5/Dkr6FSpKv9N52UQ=;
 b=ZUNe9Bz5MmElU2rU90T9CLAUC9Ni8bdITMselM8reQdFmq4pdnaOST66aNZzTiEInFV3qFxE9hd8ayCbLh7bLX6BlCEy8yR6F7LzTb+aeDv2vbwo5crVsOfU7tuluuJeZV40E96hGsF6KQXcXUWVuKDVcbLysAs5YEgSp8ipyFvM/vJLSxoUUvqjLdvn52e9HTR5XHK01cvz4MnUjfKxeZeCVVuNTGiKNN4DUxuFgGCJ1CZFRVpazIsx/Y+9cbzgPZyuj+JQ9Ay44wuYTxv0Qz2/7dMd31t5ddpY1Bb2rMozOzPXwCR3zWU1c1J6dC8AQDc1KU3wF2qr6sFuDC3RfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THPh+98VGzLRgm3mWakkQkGqPM5/Dkr6FSpKv9N52UQ=;
 b=YTi/mp0V1XwxW/kh0D6awSKfadkB4FQIzCKcSTEY0xF5YdPUbRkO1cevKsNCGCZQQXZvcPNWbP8J1G5KTMM/bP/yPJZIaxiWDautglWq+XrHA6eiWyENqqdw+Tu2d8/Z02JyM8R8kZLYGRIkKQCO6RwdT7oCuC7vWQd6HQbt6Z1B+oMcVznTu2MlVEMSAB6tIde4QxcFJO5KLan0oSM9dJA2+joy2vAzQfAAhw1R1ydPMzuH62FK6kiEAPAAR7FBs9ILTLSpDixyHUUzJMzbw+dJGtDDisJovBwK3Zg42/gowTpHO+IkU/TZUerYrY/p/I/fI8etjNUoyuAZAmdBJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA0PR12MB8352.namprd12.prod.outlook.com (2603:10b6:208:3dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 15:15:09 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 15:15:09 +0000
Date: Mon, 2 Jun 2025 11:15:06 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Shirish Baskaran <sbaskaran@nvidia.com>
Subject: Re: [PATCH v4 16/20] nova-core: Add support for VBIOS ucode
 extraction for boot
Message-ID: <20250602151506.GA779285@joelnvbox>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com>
 <aD2oROKpaU8Bmyj-@pollux>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD2oROKpaU8Bmyj-@pollux>
X-ClientProxiedBy: BL1P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::12) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA0PR12MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: 949fb489-3c52-46eb-6479-08dda1e8431a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VD+4oPpPenWHU+1686iwIkfq5pu+PcwjDIoazpLBl8+ZvFjMofIScb9yerzB?=
 =?us-ascii?Q?05ieBLnMqTY+84ESIrEJj/OWmeTPF1KTk7zjV5lYheecknBLQrLhkggFc7q8?=
 =?us-ascii?Q?cYmc9jdzQLh6WAn7Mae7XPQG/UAmrEJzoRZRpQdPyMzVMXBvlCf/9Fkp/eXv?=
 =?us-ascii?Q?pxsqVMhHmLj+EKyu8o/gmZT5pWict9iIVllegCCKrSrdPYFYePWo3JXTeQ+W?=
 =?us-ascii?Q?u3M8wUhlurgPxkgcqmixjcxO2qhm1yYHn+JFp2wcF0RW+yp7sqcwQXHraThS?=
 =?us-ascii?Q?/HvVMbB8JmbsKtQzjwuloPLLDLvf53DpzDo4Q1UR1famj7yhJwA1ZaRXztpT?=
 =?us-ascii?Q?ID5cW/npB3fzqbA0QzQnDnnfvpWTAzkzmu0U/RKCOxiETdIdS8nXy5qchbTy?=
 =?us-ascii?Q?oVWXub5Jy9Uj70jv9tAxCote5DSJg797tFhQjlYEWaMgFoVJuwmpfRR/CCUL?=
 =?us-ascii?Q?a/dUj79KUG3qP2CsHBQvKYBA+Ko/oWkrdSi6IymOQk5wB7PxnYdD+P2Vmseg?=
 =?us-ascii?Q?tnS6vTO36y63z6zX4H6r/buEvngZQgh2WOHL35w4oOtK6fcPyjc15dt2olsD?=
 =?us-ascii?Q?KPB8Y5v72UYiJwcdL2nJi2bsulLuVZF71nROXmlO+JqCAADfnh0MRPEhKDf9?=
 =?us-ascii?Q?+6LZZUZpiotR0pw26T8hvfzQC2BssneugdbV7srevTAMJPup5XdpEtM4thAA?=
 =?us-ascii?Q?4GT4ckS91nBhDm9UPJQxvEF5ZABQsViMsXKhseTb5ImNybMip2vrbo0K9I2T?=
 =?us-ascii?Q?mDxNSc17e2ykzSRgfSKnI6vQwmrL7OMnoV3WwYqUX3MxlW/4jRRxJvGVvOtb?=
 =?us-ascii?Q?q2iZl0Itu2CP7fYYqfLOL4hRJxjEniD+kAHAtQcV0s9zaB1OefIZc/ptJ2h0?=
 =?us-ascii?Q?j6vE9yl0Y+nxMuuPLaYZ9VzWmk4HmplsGBY81QV0uEbfTCsGFDYWwcAOTgp8?=
 =?us-ascii?Q?9+hjb+oW7JeCVN67To16UBJCmFHJ6OQPX7FZmuK8IuC6HRPB02pkjYYXrej/?=
 =?us-ascii?Q?G1/8Xos56c4fogSXL7o1AecZq8IuRRLNcLva1oRkpeIU9J+8oYIel+WEsN1d?=
 =?us-ascii?Q?E2pYZQkuPhsmqGTrbVF8zzxbfIKcelPcOj379TYqQF5XwR0o4AML/CeTluxV?=
 =?us-ascii?Q?XWsGPbgSpMs+fi+twYnWyES29GimEH8eqYHWruO3tfeeeTQovDJfOs9yXhrE?=
 =?us-ascii?Q?JcRXu1mNWb5ym/QQ+XO3kK34jkgMV7XK854bTUvF73fAieSTLCzfSSkcDHQf?=
 =?us-ascii?Q?+mAF2bPo8fGniYTdYx1NreEMr1kOJhHVrnlwYwXhZNN4T+mvptSCMDsib2Cf?=
 =?us-ascii?Q?oxW/eRptWf1+YIgu/FrjszDGOzpvP4XQuwhoJeteabj5FqybwbDq0FAxNXHC?=
 =?us-ascii?Q?quRHWTJpUZpWUGVtO1oquqxAVKx9dFn4xOpBzCzJ7q7kKhnSTWFbzHNv3wm7?=
 =?us-ascii?Q?UieZEA3KQdI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MzNPDOVVvj3GOcOyHTg7j99kBNORlV7qedpXGrOFHBKeSyCLVqz/M7vwBj0u?=
 =?us-ascii?Q?DthXqYgsTahMuXmsPqQgZGV3qEMqhRHq4bYnHiqAYswAGKyAfHgGlN5HeMEC?=
 =?us-ascii?Q?RdUjbav2khUPf7efsRufb5P+phk9Ue/QEJMQJkQd/710WmWMVLsQEwQaDQAJ?=
 =?us-ascii?Q?nlaHCFxoDQKPj/GZ7CDfmDJXw8FwZnbMCoVcV4/P9LL9BqEKE0wMaKwwYmRM?=
 =?us-ascii?Q?IPdyPvjlPS/858oILPY4vl0mTV4wb4qcxVj5ERknnHJEK63lHNjVEACaVPOC?=
 =?us-ascii?Q?SpxcXp1Q7X+sF0raPqMejHn1++FKqn3XcCQqZbDYcrksy+PctgYQUHwy6j+S?=
 =?us-ascii?Q?YlOV242dcVycMzW2vjVV5qGQRsskWwvObHvMXyQUZJX0DU/6HFo7ZtsRuyp+?=
 =?us-ascii?Q?mj0TBCWPzvnF9JYBFFeHTyOr9LZqCbLBA+zU7Wt1DoHS7fVmBVlOg0TYXRy/?=
 =?us-ascii?Q?s50RQzq/QmU52ppbwUOZbCkInSsXXn+EGgvFaR1dkJBOY8VDfa650hvzTIDU?=
 =?us-ascii?Q?JIvTVqlmL2EsTsCQAfkf3n0jm10WCBKSEx0J19H5jvMKaoBIGstlhckZshaj?=
 =?us-ascii?Q?NBoqk+AVBMbHdtkPk06ibf4ebmB9XPEAA/QK40t1E7DZg9+xu3pWu0YGuZ/B?=
 =?us-ascii?Q?W0G7j959xHd9rGSwlxEiE5yjlqIfclVV/nmr9xFUEmXfN3OHbydrf9J5QrEj?=
 =?us-ascii?Q?Nc8j4hUMev0ZjbtNo/Tu4Ly+aU9UBUYI9MiQn0ey3niyZqQuvJDApl3swGzi?=
 =?us-ascii?Q?NV0Pu3Wmzi3ep0JtDGk3NR3VvDJ9xNOP9xs650id3S4xOMWuaUK/kmtL4iSp?=
 =?us-ascii?Q?h606kDDdTX7oxTEx/fhOVetVJ+RyyAZlbyTrmY10GGg5HfTz/eaXeMy4b0OV?=
 =?us-ascii?Q?RtbNXkGS8G/aVuw88I16u627tekELqYNm5fVBnGzYP9E0fgijhrfDWJfrQnA?=
 =?us-ascii?Q?bleXB+qO8nxVzjlJK4tijUOd4i5T/1rIl8fyE3b1WXMkJA7JTT6BY5LyY9c0?=
 =?us-ascii?Q?Ws+6563sWNYgWXULd0x68+y2lRCa+mdGS9UCyl4gQloY3qkYV7DaKcEL1Dt6?=
 =?us-ascii?Q?k3k31+sk4rcmtdgOx2q2NjNbsY1y/pFahFH16FHrHWB0zMdPC1vAT/KyuYZl?=
 =?us-ascii?Q?FjqML90ssJrsV46i3Boa/EquvbkKYqG9drCkx4UhG+CdD4UolIFWQ+//FBJe?=
 =?us-ascii?Q?sPbYpRLKjjihHEooSEBF05MJXUgIELKDwZrIIgKaWTEN5YKwl5WYTPI61bw8?=
 =?us-ascii?Q?Waoud6MVs25j/92o5OCuAhwW+XkSRe/ncaVQU9gJaiDcFZqMQLm0sVWMwZWt?=
 =?us-ascii?Q?+sDtCnD6pPh+5ckT082dLv4II/2JCRpENEKjPFAmNv7n35oAcPdd10W8ywdD?=
 =?us-ascii?Q?8J8JyNcQ0jqyRM+wsYRvFM0egvOKbYDl9FB9Mbcg3eY3FGDV+gIWnWcDX2iX?=
 =?us-ascii?Q?SIe43wjn3CEYO0mrGhTUSjVMDzplnAKPed4deyWFBbAC6hTENizMKP5lczh0?=
 =?us-ascii?Q?8Lmp4qNvpNnS5wGctX5moyXo5yJcEliUWvQdtc0wHlTAXiVE/+N7M0tKxYK1?=
 =?us-ascii?Q?8KS/hUwxSILcoVkZyx3WFhXZeVruWkUcVpmkFY1C?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 949fb489-3c52-46eb-6479-08dda1e8431a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 15:15:08.9351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJRiq2Ox984LiNllrhWqTJN6BbBZe+QTodZL1xTiQnxdxSRwjOFjYP6K9m2aMpAOSnde1drvON37URwa1kAYbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8352
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

On Mon, Jun 02, 2025 at 03:33:56PM +0200, Danilo Krummrich wrote:
> On Wed, May 21, 2025 at 03:45:11PM +0900, Alexandre Courbot wrote:
> > +impl Vbios {
> 
> <snip>
> 
> > +    pub(crate) fn fwsec_header(&self, pdev: &device::Device) -> Result<&FalconUCodeDescV3> {
> > +        self.fwsec_image.fwsec_header(pdev)
> > +    }
> > +
> > +    pub(crate) fn fwsec_ucode(&self, pdev: &device::Device) -> Result<&[u8]> {
> > +        self.fwsec_image.fwsec_ucode(pdev, self.fwsec_header(pdev)?)
> > +    }
> > +
> > +    pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> Result<&[u8]> {
> > +        self.fwsec_image.fwsec_sigs(pdev, self.fwsec_header(pdev)?)
> > +    }
> 
> Can't we just implement Deref here? Why do we need this indirection?

We could, but it seems weird to deref a Vbios struct to an FwsecBiosImage
struct. Conceptually a Vbios is a collection of things and it could have
future extensions to its struct.

The win with using Deref is also not that much, just 2 lines fewer since the
deleted functions are replaced by the the impl Deref block. But I am Ok with
it either way, here is the diff on top of this patch.
Or did I miss something about the suggestion? Will respond to the other
comments, soon, Thanks.
---8<-----------------------
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 346d48c4820c..ccf83b206758 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -6,6 +6,7 @@
 use crate::firmware::fwsec::Bcrt30Rsa3kSignature;
 use crate::firmware::FalconUCodeDescV3;
 use core::convert::TryFrom;
+use core::ops::Deref;
 use kernel::device;
 use kernel::error::Result;
 use kernel::num::NumExt;
@@ -247,17 +248,13 @@ pub(crate) fn new(pdev: &pci::Device, bar0: &Bar0) -> Result<Vbios> {
             Err(EINVAL)
         }
     }
+}
 
-    pub(crate) fn fwsec_header(&self, pdev: &device::Device) -> Result<&FalconUCodeDescV3> {
-        self.fwsec_image.fwsec_header(pdev)
-    }
-
-    pub(crate) fn fwsec_ucode(&self, pdev: &device::Device) -> Result<&[u8]> {
-        self.fwsec_image.fwsec_ucode(pdev, self.fwsec_header(pdev)?)
-    }
+impl Deref for Vbios {
+    type Target = FwSecBiosImage;
 
-    pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> Result<&[Bcrt30Rsa3kSignature]> {
-        self.fwsec_image.fwsec_sigs(pdev, self.fwsec_header(pdev)?)
+    fn deref(&self) -> &Self::Target {
+        &self.fwsec_image
     }
 }
 
@@ -735,7 +732,7 @@ struct FwSecBiosPartial {
     falcon_ucode_offset: Option<usize>,
 }
 
-struct FwSecBiosImage {
+pub(crate) struct FwSecBiosImage {
     base: BiosImageBase,
     // The offset of the Falcon ucode
     falcon_ucode_offset: usize,
@@ -1091,7 +1088,7 @@ fn new(pdev: &pci::Device, data: FwSecBiosPartial) -> Result<Self> {
     }
 
     /// Get the FwSec header (FalconUCodeDescV3)
-    fn fwsec_header(&self, dev: &device::Device) -> Result<&FalconUCodeDescV3> {
+    pub(crate) fn fwsec_header(&self, dev: &device::Device) -> Result<&FalconUCodeDescV3> {
         // Get the falcon ucode offset that was found in setup_falcon_data
         let falcon_ucode_offset = self.falcon_ucode_offset;
 
@@ -1119,9 +1116,11 @@ fn fwsec_header(&self, dev: &device::Device) -> Result<&FalconUCodeDescV3> {
             &*(self.base.data.as_ptr().add(falcon_ucode_offset) as *const FalconUCodeDescV3)
         })
     }
+
     /// Get the ucode data as a byte slice
-    fn fwsec_ucode(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
+    pub(crate) fn fwsec_ucode(&self, dev: &device::Device) -> Result<&[u8]> {
         let falcon_ucode_offset = self.falcon_ucode_offset;
+        let desc = self.fwsec_header(dev)?;
 
         // The ucode data follows the descriptor
         let ucode_data_offset = falcon_ucode_offset + desc.size();
@@ -1136,17 +1135,17 @@ fn fwsec_ucode(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<
     }
 
     /// Get the FWSEC signatures.
-    fn fwsec_sigs(
+    pub(crate) fn fwsec_sigs(
         &self,
         dev: &device::Device,
-        v3_desc: &FalconUCodeDescV3,
     ) -> Result<&[Bcrt30Rsa3kSignature]> {
         let falcon_ucode_offset = self.falcon_ucode_offset;
+        let desc = self.fwsec_header(dev)?;
 
         // The signatures data follows the descriptor
         let sigs_data_offset = falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
         let sigs_size =
-            v3_desc.signature_count as usize * core::mem::size_of::<Bcrt30Rsa3kSignature>();
+            desc.signature_count as usize * core::mem::size_of::<Bcrt30Rsa3kSignature>();
 
         // Make sure the data is within bounds
         if sigs_data_offset + sigs_size > self.base.data.len() {
@@ -1166,9 +1165,8 @@ fn fwsec_sigs(
                     .as_ptr()
                     .add(sigs_data_offset)
                     .cast::<Bcrt30Rsa3kSignature>(),
-                v3_desc.signature_count as usize,
+                desc.signature_count as usize,
             )
         })
     }
-}
-
+}
\ No newline at end of file
