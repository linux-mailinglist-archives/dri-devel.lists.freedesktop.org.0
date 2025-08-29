Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B601B3C1D6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92BB10EC17;
	Fri, 29 Aug 2025 17:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="msLkZskb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3EE10E1E0;
 Fri, 29 Aug 2025 17:33:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quEkAS6wOTd4w45klJuf9Zypgd+RV0Sqyb4dlrBSUfrVSakzXy29ozn7QFg+z+5qIRegAXR+CrLnJRQebT+zcoM0FkkLSAPRwVKWJgC84QJHFxMzZSn530OwllQ8aFYN9Xbo+JeRfbjadvOomzPymM5ILAgODFdLRZch7UDCm0ntUC3iSq49DbNhYGduRmRr6qSFb6jgrcD8oJ8jAE/vQ6HxsSccqW+dyq0oKC6iXnVEEjwD1b6Dx339+hE7EffYq+tatZv3baENSC0KbxBVySmICuxqUUrglvF6YucnVPDzBRRSn31gKq/VN2mNzDuvnE0OgvDqWBKkuILbtWES1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HWz7Ba3XHEHXCt+GAJ2BxPsKjgyIL8Kwv/vmS0SAC8=;
 b=XHzsE4PtmJvGNw2nrCZQZsCx+8l0/mouIpp+IWddAJnyfqB4IsgzwBwtYj/GcjBfcUu2MNs51kAYkOG47umN+WiTablOj27a0Ca52R2kPBFc2nbqISxWJGXOsv5MuQ0hGOmU5F+nd/N8fCy5KK17PdnZU4EzUEsoHhw5Pa2AgE5Mb930i8SJN9Lqg8/JLuXuSGbR2MispYxMYg0iJwP86l9jadDBxhpHil1TWlElk3z3tce0TtBut1tGXuF1IjqKrXB/OQWfPSJPDeAuFRCOzvW6+Tzr+71Zx2Nr5MaBe9r93vX8yVHY9JQamJ2QeahU9DlO/LtiifHLK5dveI2zCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HWz7Ba3XHEHXCt+GAJ2BxPsKjgyIL8Kwv/vmS0SAC8=;
 b=msLkZskbIL3f6PdOHyJWxzMlosAm6dvSEcG1wjNss/9i/MaeUV2Prb/ROjniSSwolT4VMYvXGAYa4s4nGlYAlmmwnIUZtbJyHFzgPSR4AoJ7UZZ8zjXUdxgmkYPd7nJXrf8quW/EGqxyGW9Hj9hHihK27TYqPNVMeu0HhNPIaB4pXmPyEUYNyJCfj3ZTV105HpZHfN3V6uYqPMeO0Fepv5RkC49JBgFVx/LpazgwEXdjOT5dZBUuOr3JY/Oyrl876btqDJL3aZ0x2sxYTa3lx3zXORg5OIYNwXBx0vs53CGPBq0tFXlJMos4Y2Hwus9OkwkwtQa2vI/ulMExEudmIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH2PR12MB4069.namprd12.prod.outlook.com (2603:10b6:610:ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Fri, 29 Aug
 2025 17:33:36 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 17:33:36 +0000
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
Subject: [PATCH 15/17] nova-core: remove unnecessary need_riscv, bar parameters
Date: Fri, 29 Aug 2025 13:32:52 -0400
Message-Id: <20250829173254.2068763-16-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829173254.2068763-1-joelagnelf@nvidia.com>
References: <20250829173254.2068763-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::18) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH2PR12MB4069:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f229b3a-711e-4b9e-78bc-08dde7222f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dqoZ35AN3FlnRPb+nBowCAcZoyv6ClfcM4cGnI8PNe1GP3jpgl0OciUXAvfR?=
 =?us-ascii?Q?tw7vTy2nJrnjcafkNNhyj+9nzTj//NYTfjuVu0p5z3auhpZ7GWs29FJgYmAs?=
 =?us-ascii?Q?B27CRIgwzafZap4L2AnuRIoB8Xpwmhxr0yUsKYM+lcXD7re5unibuk7eKejX?=
 =?us-ascii?Q?fChkkMRV9nyWosmNY0s5ubqKYuZ0u1jjRQFcSSLsRykiUw2Yu8hSCAZOal3G?=
 =?us-ascii?Q?cEKv4g0/jhm4uN2VibvNZXvNzKGkJ+cIsQHBdRY9qwMRdgrsQiNMq3bJnTbA?=
 =?us-ascii?Q?mu/mTEmKvTbgXyEQxDoooiLRY0qXIkdtvUjrADzcyFuhFcPhvuLA+IsW5P3t?=
 =?us-ascii?Q?k6Fryu4F54FqyAWRschpSm8JUz0T0rhSrAi0hU9efzyD8BThRpoQs384VgF+?=
 =?us-ascii?Q?pZ6+Ya2q4r40rr7/X5wtHqAvh22NJ7y+3gDx2Eh5rOxVjcIMLvzT24IH/nj9?=
 =?us-ascii?Q?GXah+OA6tRCDxUh/imyfTgj1XjjDomsqfvr0KgXjrExfKdK/+AWYXMatyK2z?=
 =?us-ascii?Q?zoltOJ8Vu0iIQc4l7IVHCZr+XLy3fh7cfWOlNqnk+n19dl2PcfnKXYPRUjWE?=
 =?us-ascii?Q?vRa0tWMThGlnxBVySvUF1HPpuKVThuLJ04iPh6jckf2SUEA9VltLQZx5tSiC?=
 =?us-ascii?Q?mvNubJYEgU/CL6emWjTv/yXbvtlc0M4bhbrj+M5+0JMEaWyF/M/qAPoro62P?=
 =?us-ascii?Q?1k8EFKdTO4yEWhqOR+zVv2DwARaB4soCSbronByQbbELBj/INFDr4NlTBdVl?=
 =?us-ascii?Q?cwpo790GaMdZXZwOYNqPlCbl2XG4ng5uWr+h/LFEKxBXjMLIBDl4vqu7LBEr?=
 =?us-ascii?Q?O+tUNQK42cWC+Tr0H2xEk/nejn3QhegH5XtMS41ID4OISlZMjLrPKZcFgt/s?=
 =?us-ascii?Q?eu1XJ2+Q9ysxdKY6aNp8Zk7fSp+0jsBbFPeZM04loGUjgaNflbT5mBTTgQ27?=
 =?us-ascii?Q?rrXfIF5KxI5IKfc+UrM3PIrFky/1Svnu6uRW/WGZtTzE4ucy82R8UCGY3Ck9?=
 =?us-ascii?Q?LpC2QsqW4gU5T/J070C4N1cwIm3tbbah49nKEtmAAl0atwmZ+DLcyohkBC7m?=
 =?us-ascii?Q?SqD4wlXgQz7XhEs26w1BHv5BPsQwkt0HymGDpjt1Vxy0t4NP+td+LuwR+JBQ?=
 =?us-ascii?Q?BcfOqopHi2rOlEpFUKFS4R25Nez3uWIanyy5JWUcdtQqAxg2x19TJonOlMKW?=
 =?us-ascii?Q?oc9WArxghHWBVfxYkD7jI+ONiot0iLJ65VLHYeEbLLxoluqoritB4Qa5BXOV?=
 =?us-ascii?Q?HnJ3Q0lfzFkQeg8vIHRIUtyGoQQIQKycNlxeeIVYliDfTl0mGP+d5DNF9ygN?=
 =?us-ascii?Q?ti62OaNpFW6gYLXydbWX1tK6fvoiVtQ9bUh4yYqx1kZqtAC1+kcmLEmh9J/t?=
 =?us-ascii?Q?tu0Y+D0zme1swwdg+fNL0sQjgmZ+IMW0NSmob8L1vp6OcNsCqw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0uLihs5Bb4HBPXL8DfR63Y7fsE0qrcubRAs2DJOjrne7hWs6rizHwS7tm5qE?=
 =?us-ascii?Q?mxNxxtigeUtbYm7+6nBZS/lGzij8/TWIvCHDwbrEgNJh2fJ8bKCg4qK3hAnI?=
 =?us-ascii?Q?mwI0+ABoRUG+vER9VbAKfg9BnEb/gqGzPueJmPi5mBqKzNTaC9uBfw7NCFJT?=
 =?us-ascii?Q?Xwf7NZP73sfVKLGBGJZ93B4w0Zg4CvJW2AinNSCeAEj3s9sQbGYePi/YgTnv?=
 =?us-ascii?Q?uChNQVWxk3HFZwmG+oprPbaybGVpSI06lLdWXeoKbPJaGZaO0Dmem3Yf1du0?=
 =?us-ascii?Q?n3L0JVpS65x3Chh21GbpjIs8WM55AYqvbxqMRw6q8iOKt2jXTnIBlx+Eotfk?=
 =?us-ascii?Q?gk+lgfGszsj5cR9ZVSV0sVEYegWK2/KBHizs8OXYV6gmcw1Nk2e43l7J4trR?=
 =?us-ascii?Q?alJG1YkSB7D67IOCUN7DikuG51tyPsDjQqtd/tyeycG8E9oSPUVykgMPBuRU?=
 =?us-ascii?Q?vzujeDDGOo1ZPiyUyvaQ7fNWgdJIvQk/p0RntfeUxZoqxiu3mUr9y6xqgR77?=
 =?us-ascii?Q?NwAWo/a04lKObfg3JfZQzdMhxjMQhWgUBCW+INejILVMrCwaw9hF5DQJrAJq?=
 =?us-ascii?Q?KEkp4Qyrfwq3NxxRd3zVQ5Pcub0LDmpn9HGHIoCo9NeJyt1dG8dsgrt5i1GN?=
 =?us-ascii?Q?h1nOz/Ubr8iv3TGkJ7jgVvucNxrwHebX0oa/4ffE0I+yCrkCq4MTAW46gfV9?=
 =?us-ascii?Q?SZOOtHFKLNGshZFkk4tWcvFteJNjaU3wPYJdxqED8wL7YgE0QQ7Wpi4SjDAf?=
 =?us-ascii?Q?Mxm80zqeDHDG0oXLH4/mSaOJwvGkG6HYJHUqSc07DjDNz8c6DDttKlgOGi5i?=
 =?us-ascii?Q?ZjvaBFB0DObNixlklsew98S6DKWwstSPrjWz0iU4HHYJHLDDKDW8P6ma8lNt?=
 =?us-ascii?Q?bCg0WU0zNNJMMSJirliGODgGANkyErdRtJc8+nLkXWDA0JJna3gPuNO+iieU?=
 =?us-ascii?Q?X3ZUVLNbEE3rYUpX1lnOpb18gBMYmmpCRnr8+a8YhPurJm0zUOP4SZpSG8J7?=
 =?us-ascii?Q?Hjo1vwKuvxRO1DgL2hz1NlMCGEZACQQ/4jnKrM8FevTgZpRqqLqdMOemSdSf?=
 =?us-ascii?Q?5EyBG6FJfc+jyiGQFmbBRpVIcVy9GiBK/kB7Vox2O0wcKNkHyvbQQ9sRXAM1?=
 =?us-ascii?Q?G3T7EcL6eD3/QcT3wfONvUYBR2b8OLaTHO80h3tcD8J9ElRDZzfGrL8+PT1h?=
 =?us-ascii?Q?UZEY+POkl9Eje07Edf6vR8ofFO+S9fRwXnfOuTls9A+NeINvkQwaK3E1mPtX?=
 =?us-ascii?Q?wJVX6uSQfv6Ie+oPURDpdmOj7I5I0zgkam0M21XrqZT6Jzf753yu9eZ7kFCE?=
 =?us-ascii?Q?ljHZwZSgXlSCoqJOSqNjHyr+1QCVj24vg4+l4PyrXPlq4weGfrbRzFJm23dm?=
 =?us-ascii?Q?1sa6NYn81z0h/OWKur+3yxFckzBa/3Ft/2P0CzSLJWfRc+ZRLGcRa4nqbgKl?=
 =?us-ascii?Q?Hm2Jcev4JbOSTLEHByBpVMyyJUyjuRIA9ZlYoD0PvK88emlRkg16dWnZTc9O?=
 =?us-ascii?Q?xaPvbm9YGzhaC4nJ/ZGv7I4aYXAhqbzSxhG0+t565FRFHcXGlAdRus1iCDfR?=
 =?us-ascii?Q?VSFFZnwqK5dGiZ1rnC98zDmrtVq1u3uBnL+gB43t?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f229b3a-711e-4b9e-78bc-08dde7222f07
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:33:36.1551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DYa2pcdgt8+YxsJPqger7S61qEFMcfZFg1qzjFsgGOP7ZSItwFQCGNe/tecLhbjADFlMPZCACPhQKqeSnHttw==
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

From: John Hubbard <jhubbard@nvidia.com>

The need_riscv parameter and its associated RISCV validation logic are
are actually unnecessary for correct operation. Remove it, along with
the now-unused bar parameter as well.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 21 +--------------------
 drivers/gpu/nova-core/gpu.rs    |  9 ++-------
 2 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 023f9b575a5d..938f25b556a8 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -346,26 +346,7 @@ pub(crate) struct Falcon<E: FalconEngine> {
 
 impl<E: FalconEngine + 'static> Falcon<E> {
     /// Create a new falcon instance.
-    ///
-    /// `need_riscv` is set to `true` if the caller expects the falcon to be a dual falcon/riscv
-    /// controller.
-    pub(crate) fn new(
-        dev: &device::Device,
-        chipset: Chipset,
-        bar: &Bar0,
-        need_riscv: bool,
-    ) -> Result<Self> {
-        if need_riscv {
-            let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
-            if !hwcfg2.riscv() {
-                dev_err!(
-                    dev,
-                    "riscv support requested on a controller that does not support it\n"
-                );
-                return Err(EINVAL);
-            }
-        }
-
+    pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result<Self> {
         Ok(Self {
             hal: hal::falcon_hal(chipset)?,
             dev: dev.into(),
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index bf670f6b6773..c2a9cb32837f 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -287,15 +287,10 @@ pub(crate) fn new(
 
         let sysmem_flush = SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?;
 
-        let gsp_falcon = Falcon::<Gsp>::new(
-            pdev.as_ref(),
-            spec.chipset,
-            bar,
-            spec.chipset > Chipset::GA100,
-        )?;
+        let gsp_falcon = Falcon::<Gsp>::new(pdev.as_ref(), spec.chipset)?;
         gsp_falcon.clear_swgen0_intr(bar);
 
-        let sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
+        let sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset)?;
 
         let fw = Firmware::new(
             pdev.as_ref(),
-- 
2.34.1

