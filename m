Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3483A9B887
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 21:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8C110E05C;
	Thu, 24 Apr 2025 19:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VUfusL8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F62810E05C;
 Thu, 24 Apr 2025 19:54:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWBxTWYS3jA7B66PhTJxDrPF3So0mK34ASjxFrqQSynWRk2rZ1+9cGhqJeiuXPrI+EqHro0RLFb5fVqX7BRb9ldE/Jlqo2OxCyOB2vjRlbwspPSZNr0Xg4jVLz6Cid3Z3jDdQaSQJxAscuvSJbR3KeShw5D+TnzhDDxXWDV+oOAEcL0BFcGeuS7UFsGfEZ4nJES33YDS5nD/xnWhNC3UWjh3b2WXoC1ENUPvSAcE0qSgX7WrJB+CzUOCJSx9kydaR7p4FbhognUNK7VJMdSfeqAt6/PKIPrmQS3LZsqpq0YHmuBWgt7TYid6KfV2t2ptyXd4fzcALptjecP+iax1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yScPl8rR31awUNdgnBm/42yk6JHIIKG4+lxA3V+iOO8=;
 b=jiAF6pp2tckkH8b8ud30YrotAxdLNHdDiOTNMUgDzzFyMdNLK3XTn94MVqslkzbiw9RNFeNALUJpkBIJZVfKhSLrCQZbY5PUidhRk8QOi0NHcNnPfIiDXCCmbeyY4QCKuDcyXWo2aLY/Xfl+ecmxbkIOFOEG2ONG3EpU1S04cl0GOWV0bME6uHHc9Zqjop5F61PszPET1EOV+cBFmBCtzzMFKoFDXWoRfwl5qfkvmuedUDuYty9gWejdmxpqArN4WMYuPK2xRu0fh0E6syNL4O+MxxWRkBb4Uc3/Gv9bsWPEH7b2g0AZBRWb083tx4KpOu0+yZq1nyNP+krHrlE08g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yScPl8rR31awUNdgnBm/42yk6JHIIKG4+lxA3V+iOO8=;
 b=VUfusL8PtS84ZBKiCFoyQxl6fu33a9FP+uoKgfgCa3OWuj3IFRu5XawTUMQvgHaZfkU5q9ANv2H0NXnZHYe8oenvQu9CFSCdYGPNQFMaNwWRWnaRZz+KZRsb7y5WzY/e1KYlNIxkvvuA8urzXyMun7rKenZmZkE92vTO7Vb1UveOgwUXSl/pc9fE5Ic9pJvT2kgoX4HrnaMy710czyD3ToFv/HkOrnY00u1G6c4VfEdXp+ACotCGpwh+Bmm5hl8oCxRPR3rGS0RJOatGpKL2is79uKcFb8WQmICbOLUCbSyNbIacmWjD3/3NeS48yPngTm+PApw6eWtV+afeZ+Hpig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14)
 by MW6PR12MB8868.namprd12.prod.outlook.com (2603:10b6:303:242::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Thu, 24 Apr
 2025 19:54:50 +0000
Received: from DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::f250:7fd7:ce23:a0fb]) by DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::f250:7fd7:ce23:a0fb%6]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 19:54:50 +0000
Date: Thu, 24 Apr 2025 15:54:48 -0400
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
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 13/16] gpu: nova-core: Add support for VBIOS ucode
 extraction for boot
Message-ID: <20250424195448.GA182914@joelnvbox>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-13-ecd1cca23963@nvidia.com>
 <aAjz2CYTsAhidiEU@pollux>
 <88937e2b-6950-4c9d-8f02-50f9b12c7376@nvidia.com>
 <aAkBIvfTkKVNbdnm@pollux>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkBIvfTkKVNbdnm@pollux>
X-ClientProxiedBy: BL0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:91::15) To DS0PR12MB8044.namprd12.prod.outlook.com
 (2603:10b6:8:148::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8044:EE_|MW6PR12MB8868:EE_
X-MS-Office365-Filtering-Correlation-Id: 64035453-ec63-4600-a479-08dd8369df92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4vJTa/E/eoqC0q/hdF86upDvJzeP8ye3lwJz6H5CyuAGsAHNQugRs9pVc4i4?=
 =?us-ascii?Q?wzswhxWxCjpZHnXptGFHD6tWphjPVEToTLClijbx+iwO05lkUI3sZQU+aydo?=
 =?us-ascii?Q?nzrPwVvzeVjzwYnWHB1YrS0eo/RcXjJoxeCsWSeYxQFZxORTFS1E+Z8Azmvx?=
 =?us-ascii?Q?jT6A5E0VGtdc4wMNgXuGoRK+a4NlFabnU5d++molBf3bnBf2PXRPe5Idj1vM?=
 =?us-ascii?Q?tQ9dDOgvIe7YZkW9bTZ58aJiTi0cMngifuvZqg05UI4a5uayHT+sgEcd0Gv5?=
 =?us-ascii?Q?lK3AJE+uVuRhNKBakULKyDHes9p3ups49KSWNlU3cTkVsEohy7MReK89ysZ0?=
 =?us-ascii?Q?pfV3h8f/TngZSZhYifmbhh5dYYbLQQilSlJG7wAZv82cNhIuEZ59TPFsPdSA?=
 =?us-ascii?Q?SdnBe8qQkETE9lgVzQcjPmd4gNoTwkVrnCQQ5eTy6mAZ7ImHj+otXRHYsWT4?=
 =?us-ascii?Q?WD/n+9HE9Cl9iCiUwvCUd0hb39QlgTh1jCObkyI6XzlSdS3Ldr4RHt4Uo2a0?=
 =?us-ascii?Q?1t7frQ5zvGBEK1ORxGlYRBc5fxE4YG/4vdPH2r3WfjdtMYU2eTQUOLy/Hbt8?=
 =?us-ascii?Q?x9fPj+uJe79q+/qXPGuFtUNXUFCEz+G/wgYg9of0KZpZS8glkTVHRZSaZJG3?=
 =?us-ascii?Q?pRBwpGpkRcw8oUmINlNd7WdM0ylisDiSVOFLExfIR+1xfiAkH/z+gMAp4YQ9?=
 =?us-ascii?Q?BaUyFy+kgIqUj8u7+vrb541Fbg/dALHLygFqwYfZrzljE4PGUu8oy2TonvJM?=
 =?us-ascii?Q?7piPfoXCiq5Dk8RtH0toFOmPO7z5pJJpg9rHv7Co4yNnpVS9mKum2sq2hgEy?=
 =?us-ascii?Q?bZHUIgeYRiOnZLSzZBrY13oRjHsSV30xgsiLVpbnXMvTH0066yFF1h6cbjt1?=
 =?us-ascii?Q?WNlT1eiU8toDdNEVObMGMNa9hRErImef18QmEU3AHaRqHvBZbPVSTEu5D5YT?=
 =?us-ascii?Q?mV8Wo8MOnMGnEXpeKJVbwuSfJJjp7VJXp+9dSIYRT9JhMcfqMxkYJtx+hyEa?=
 =?us-ascii?Q?FFoDdnzSV2y/DqqahaFet/MEHJwMWdUVoInyiaRL+asJ4AkGyqc613fKjNW+?=
 =?us-ascii?Q?ECpPnkhwrwJoWoi+g1bAYM8VD8am5rligPtzvQ+r/K4IjUO5JtaZ8Quhbt5V?=
 =?us-ascii?Q?+GQwDiCmiqlW1jRKDXCbGcCs9nGAb+Z0Q9ca1Cgyb2/+pMZFvorIeN/Yn4an?=
 =?us-ascii?Q?lQnyLwQq7uYQ5syHEP6sY1M4hFFOm3Up978FBraYWh3SZF1VASIhxM79KGC3?=
 =?us-ascii?Q?u9b9DgdLHOWpZmL7lF/rBE3VfC2iCTFuvPqANN2NIYR9MFqGlB6ydJ6cpH8O?=
 =?us-ascii?Q?OOHjL/5a+b2HfFAV7mqzGT64Ku+EoOA0huFdRpbU6d3PBSY02jo3I/lzMGtH?=
 =?us-ascii?Q?GpqgIxQ3VSeZNkELkjmyBApVfzOHAsLg4KV2kYdLOZmqo3LkUc80S+rtwGzt?=
 =?us-ascii?Q?QtryzqYJ23o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB8044.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jw8LA6W1Wrp2YQ1Ur2a77GJrdW6VuJvVNaX9NAHT2Fa5gcUNiUMqJwsebtz+?=
 =?us-ascii?Q?JZ4rqe7hgn0rZbH5PIwmRjZKvfOD0UmN7cb3yN2SgygjRaQLFUqrjpgeLCJz?=
 =?us-ascii?Q?EsyfWKY/QYlT4ubVIgvP+PTl84ubE263YMt2sx9+tEMIhdCYe8ReZFTnJX7F?=
 =?us-ascii?Q?fd2Ny25Wa/ovGfrfs7Wst87/CD9v8OF9thO5uRaNWqiXFNQzDzZ7icB2ZUJK?=
 =?us-ascii?Q?EweQgkB6nrfym/lqqMlmjGSKq9OYlM0pm4vrk1HavMpIT8ca+Cjpkx/3vLYN?=
 =?us-ascii?Q?v+AoXZoMBWrz8q1sBd/z7k7EF1WMoMcAHvFkP6KSAO84euiwGSzVm1q5sZ+k?=
 =?us-ascii?Q?zduHBRUpR7Eg1MbKMybxO3eBJBoszGjfi+iuJcl8fW+1Lb79kwNN063u5RBp?=
 =?us-ascii?Q?bqxM2AQCIAvhgpHDa0GB9E5GXAxN8TWiR8vTVEawg9rQGZ1CS56E7QRqt1rY?=
 =?us-ascii?Q?UjdKQk6niLJyUKOd0maAqTBYW1xhs2d3LQ7bMhJAbk476m7oQ/KFoGwhXBcu?=
 =?us-ascii?Q?k4GogskWusWZnBa94C+9X+mN+H45tMXJdLsmb/hgki2hpN1oYgl6u6J2zA54?=
 =?us-ascii?Q?2Urc1/Lp3putV/gBi/xyotmZC7HzzpRl+Hn6X5xxxxz6Q5M2as02zYo60LJ2?=
 =?us-ascii?Q?+VlHTc1MVsLEfGPWpDOfYlEJA4k8CV++/BaAf1oLdiha+HR/ltv9+aCb+oxj?=
 =?us-ascii?Q?wqHQSSfz39U8+8B0pRHuBRirKVx92yxubM+FL75sY7nAUb7kQaSUFZj8M/t1?=
 =?us-ascii?Q?B5/ZcAGMxDLVu/Pa8f1vA6mVdkduwWu3k1/zALGs9o/sAkuXbrgvwB1JgN0w?=
 =?us-ascii?Q?birk1EhWzwTcPhpzHmQXilpvrc/MYHBrR653oJV68hfuW3asdQhNjl0Nc5HZ?=
 =?us-ascii?Q?AX/6/Ou4Do5nsplacgW2njXYvTJySF9qX4nH1PRTtWliMoIJIRZVpEFmyx6q?=
 =?us-ascii?Q?imR5u5l6X1bqUx4eJtgEYq/mvJRTTVQZXxCdgV33WCvPQpLFAwDeUHo4Gcce?=
 =?us-ascii?Q?WkNHfH3L152xyFfxuTq6F90ZkJHao1LeiY9Eigqgv/gvNnYYw0nhvF+P8SG3?=
 =?us-ascii?Q?9CvJRskQ/cZwhSZ7hxpC6W3lmSBuSJicWL2jKUW6C8K9YC2YHEzp5Wjq6UE8?=
 =?us-ascii?Q?beeeSbVzurRBUJmDMcqnPL3deCHvCZ8vt+sizZYSPQxjDr61UcktqC1uA4Sv?=
 =?us-ascii?Q?SWqON3uqr+/TNgdU2RwVch8D9ulf6e1BFNHb+6/xV19Apu14HlLYfl1BD72d?=
 =?us-ascii?Q?A2KnoC6NWWnhIvSK4wqBEPGdEwLGk08s/e4w86t0q9UhtSG266INQRYTe4qN?=
 =?us-ascii?Q?Xghwgo0TNavLaCUGc+wu0o+JTF7FEA6F8hkic5Pi5tSj+Isj5cPqEoflTfu9?=
 =?us-ascii?Q?jGfip47FHqJMbOwDs9W/om/4yX7XrXOBnijmHdO5hXw2GiRpNs4z7pDP+2nP?=
 =?us-ascii?Q?NQijW2OCInBCMte8ud7Zw0X2F0rbQw4hEXLPbedtwvX1fS3QDgLH8Fx2zdnj?=
 =?us-ascii?Q?Iokzmw2B5/u4Tg/Q7EpcgZfHgh3fNOe6Ca92bkrPYFWwaQhoFQ+S6GYQYhIg?=
 =?us-ascii?Q?pNfvTBKlExB4oQQft/YDVHEQ/I0LDFM0+jQZBsjp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64035453-ec63-4600-a479-08dd8369df92
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8044.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 19:54:50.6427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhhMrq11Iwtj2J0KkPw8tXCCrG8yfEICNBE/e8XgKpnY6uFyZpnxFkEe4Xrgh0TtkMyqw8vW1elrhdv223tIJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8868
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

On Wed, Apr 23, 2025 at 05:02:58PM +0200, Danilo Krummrich wrote:
> On Wed, Apr 23, 2025 at 10:52:42AM -0400, Joel Fernandes wrote:
> > Hello, Danilo,
> > Thanks for all the feedback. Due to the volume of feedback, I will respond
> > incrementally in multiple emails so we can discuss as we go - hope that's Ok but
> > let me know if that is annoying.
> 
> That's perfectly fine, whatever works best for you. :)
> 
> > On 4/23/2025 10:06 AM, Danilo Krummrich wrote:
> > 
> > >> +impl Vbios {
> > >> +    /// Read bytes from the ROM at the current end of the data vector
> > >> +    fn read_more(bar0: &Devres<Bar0>, data: &mut KVec<u8>, len: usize) -> Result {
> > >> +        let current_len = data.len();
> > >> +        let start = ROM_OFFSET + current_len;
> > >> +
> > >> +        // Ensure length is a multiple of 4 for 32-bit reads
> > >> +        if len % core::mem::size_of::<u32>() != 0 {
> > >> +            pr_err!("VBIOS read length {} is not a multiple of 4\n", len);
> > > 
> > > Please don't use any of the pr_*() print macros within a driver, use the dev_*()
> > > ones instead.
> > 
> > Ok I'll switch to this. One slight complication is I've to retrieve the 'dev'
> > from the Bar0 and pass that along, but that should be doable.
> 
> You can also pass the pci::Device reference to VBios::probe() directly.


This turns out to be rather difficult to do in the whole vbios.rs because
we'd have to them propogate pdev to various class methods which may print
errors (some of which don't make sense to pass pdev to, like try_from()). But
I can do it in probe() (or new() as we call it now). See below for preview
diff doing this for many prints where possible, does this work for you?

Preview diff (give or take rustfmt):

---8<-----------------------

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 43cf34a078ae..808e8446ac79 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -236,7 +236,7 @@ pub(crate) fn new(
         falcon: &Falcon<Gsp>,
         pdev: &Device,
         bar: &Devres<Bar0>,
-        bios: &Vbios,
+        bios: &Vbios<'_>,
         cmd: FwsecCommand,
     ) -> Result<Self> {
         let v3_desc = bios.fwsec_header()?;
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 0069d6ec8751..aa301e2a7111 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -259,7 +259,7 @@ pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<
 
         let fb_layout = FbLayout::new(spec.chipset, &bar, &fw.bootloader)?;
         pr_info!("{:#x?}\n", fb_layout);
-        let bios = Vbios::new(&bar)?;
+        let bios = Vbios::new(pdev, &bar)?;
 
         // TODO: should we write 0x0 back when we drop this object?
         let sysmem_flush = DmaObject::new(pdev.as_ref(), 0x1000, "sysmem flush page")?;
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index f0c43a5143d0..c5a8333f00b2 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -8,6 +8,7 @@
 use kernel::devres::Devres;
 use kernel::error::Result;
 use kernel::prelude::*;
+use kernel::pci;
 
 /// The offset of the VBIOS ROM in the BAR0 space.
 const ROM_OFFSET: usize = 0x300000;
@@ -24,7 +25,8 @@
 const FALCON_UCODE_ENTRY_APPID_FWSEC_DBG: u8 = 0x45;
 const FALCON_UCODE_ENTRY_APPID_FWSEC_PROD: u8 = 0x85;
 
-pub(crate) struct Vbios {
+pub(crate) struct Vbios<'a> {
+    pdev: &'a pci::Device,
     pub fwsec_image: Option<FwSecBiosImage>,
     // VBIOS data vector: As BIOS images are scanned, they are added to this vector
     // for reference or copying into other data structures. It is the entire
@@ -35,7 +37,7 @@ pub(crate) struct Vbios {
     data: Option<KVec<u8>>,
 }
 
-impl Vbios {
+impl Vbios<'_> {
     /// Read bytes from the ROM at the current end of the data vector
     fn read_more(&mut self, bar0: &Devres<Bar0>, len: usize) -> Result {
         let data = self.data.as_mut().ok_or(EINVAL)?;
@@ -44,7 +46,7 @@ fn read_more(&mut self, bar0: &Devres<Bar0>, len: usize) -> Result {
 
         // Ensure length is a multiple of 4 for 32-bit reads
         if len % core::mem::size_of::<u32>() != 0 {
-            pr_err!("VBIOS read length {} is not a multiple of 4\n", len);
+            dev_err!(self.pdev.as_ref(), "VBIOS read length {} is not a multiple of 4\n", len);
             return Err(EINVAL);
         }
 
@@ -73,7 +75,7 @@ fn read_more_at_offset(
         len: usize,
     ) -> Result {
         if offset > BIOS_MAX_SCAN_LEN {
-            pr_err!("Error: exceeded BIOS scan limit.\n");
+            dev_err!(self.pdev.as_ref(), "Error: exceeded BIOS scan limit.\n");
             return Err(EINVAL);
         }
 
@@ -101,13 +103,14 @@ fn read_bios_image_at_offset(
         let data_len = self.data.as_ref().ok_or(EINVAL)?.len();
         if offset + len > data_len {
             self.read_more_at_offset(bar0, offset, len).inspect_err(|e| {
-                pr_err!("Failed to read more at offset {:#x}: {:?}\n", offset, e)
+                dev_err!(self.pdev.as_ref(), "Failed to read more at offset {:#x}: {:?}\n", offset, e)
             })?;
         }
 
         let data = self.data.as_ref().ok_or(EINVAL)?;
         BiosImage::try_from(&data[offset..offset + len]).inspect_err(|e| {
-            pr_err!(
+            dev_err!(
+                self.pdev.as_ref(),
                 "Failed to create BiosImage at offset {:#x}: {:?}\n",
                 offset,
                 e
@@ -117,8 +120,9 @@ fn read_bios_image_at_offset(
 
     /// Probe for VBIOS extraction
     /// Once the VBIOS object is built, bar0 is not read for vbios purposes anymore.
-    pub(crate) fn new(bar0: &Devres<Bar0>) -> Result<Self> {
+    pub(crate) fn new(pdev: &pci::Device, bar0: &Devres<Bar0>) -> Result<Self> {
         let mut vbios = Self {
+            pdev,
             fwsec_image: None,
             data: Some(KVec::new()),
         };
@@ -137,7 +141,8 @@ pub(crate) fn new(bar0: &Devres<Bar0>) -> Result<Self> {
                 vbios.read_bios_image_at_offset(bar0, cur_offset, BIOS_READ_AHEAD_SIZE)
                     .and_then(|image| image.image_size_bytes())
                     .inspect_err(|e| {
-                        pr_err!(
+                        dev_err!(
+                            vbios.pdev.as_ref(),
                             "Failed to parse initial BIOS image headers at offset {:#x}: {:?}\n",
                             cur_offset,
                             e
@@ -148,7 +153,8 @@ pub(crate) fn new(bar0: &Devres<Bar0>) -> Result<Self> {
             let full_image =
                 vbios.read_bios_image_at_offset(bar0, cur_offset, image_size)
                     .inspect_err(|e| {
-                        pr_err!(
+                        dev_err!(
+                            vbios.pdev.as_ref(),
                             "Failed to parse full BIOS image at offset {:#x}: {:?}\n",
                             cur_offset,
                             e
@@ -158,7 +164,8 @@ pub(crate) fn new(bar0: &Devres<Bar0>) -> Result<Self> {
             // Determine the image type
             let image_type = full_image.image_type_str();
 
-            pr_info!(
+            dev_info!(
+                vbios.pdev.as_ref(),
                 "Found BIOS image at offset {:#x}, size: {:#x}, type: {}\n",
                 cur_offset,
                 image_size,
@@ -195,7 +202,7 @@ pub(crate) fn new(bar0: &Devres<Bar0>) -> Result<Self> {
 
             // Safety check - don't go beyond BIOS_MAX_SCAN_LEN (1MB)
             if cur_offset > BIOS_MAX_SCAN_LEN {
-                pr_err!("Error: exceeded BIOS scan limit, stopping scan\n");
+                dev_err!(vbios.pdev.as_ref(), "Error: exceeded BIOS scan limit, stopping scan\n");
                 break;
             }
         } // end of loop
@@ -212,9 +219,9 @@ pub(crate) fn new(bar0: &Devres<Bar0>) -> Result<Self> {
             {
                 second
                     .setup_falcon_data(pci_at, first)
-                    .inspect_err(|e| pr_err!("Falcon data setup failed: {:?}\n", e))?;
+                    .inspect_err(|e| dev_err!(vbios.pdev.as_ref(), "Falcon data setup failed: {:?}\n", e))?;
             } else {
-                pr_err!("Missing required images for falcon data setup, skipping\n");
+                dev_err!(vbios.pdev.as_ref(), "Missing required images for falcon data setup, skipping\n");
             }
             second // Return the potentially modified second image
         };
