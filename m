Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8473C55494
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 02:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB8D10E7CE;
	Thu, 13 Nov 2025 01:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VbVLIOfU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010014.outbound.protection.outlook.com [52.101.85.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A7310E7CB;
 Thu, 13 Nov 2025 01:41:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDQ71PK/IbRMqMymUgXVZc8dHlXGwUnbwnBZ0vIn0CiANhj7NQppco+/SAM+QwrEIY4MYcLA62tHst3kUu2yZHeKrKUzuwXmZJs7owoSawR88ZE/pXM+9MnbdlpppzoBRftfN7AnZrzleKFLRaoCbHEMExiXrhbxjUEjGTB8oHHTNGe5q7rQpMS2M/Ahy17LNpKpaExa7vL9RQZy+J5jl7fWpXX/KIghshwg0z5eeFJfZ41JYfb5eOreAvItO05Vx0UHbJBQMVrBTsM6LipqxwSODPjDoWQ+l97bvL+oDk+EnyuONyuApr+BbTfGBrcgbQV1kA0yOEO5i8jd7pbkCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEBi1k5SgLHkTKuoOqb9XpFTy/pWVE9M3JAtmRSOuB8=;
 b=Nkko0xy+pX3ll1MnIqV1yyRUtu9ivvmcDyItP8w6A1NqZNspiBy/B18prhUY6oZweb7m0n4TQGd1B9aAEcSU0YaX/uiwiBnaFGy2hUp5DjwkD7q0lAWPWIg5Q0qFKZYLCB7J9xMgGwUc0EsZ9rHkxkZoU/XtDkT1QEwnal40Bc63h2FoOkJwb6Qs7bn2FaVs+wbPzhojr1OQs6ngOySi449U72gEdOl2uwl07XPftC789/I+ZOC127GQRjoLJE6S0UKAMwmJAGcUhG2TdSXNgL/Lok7t79GRGQ9n2Nlo/0ZrcEgoMYrjzR+zm8C66zIoJjlQZ35WuUK1Pu00DrbRCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEBi1k5SgLHkTKuoOqb9XpFTy/pWVE9M3JAtmRSOuB8=;
 b=VbVLIOfUFWGEgJkHtL2OO3xFg1a5OQmfE2S+H8tNULItu6dnoPTTxvWNrPmNpQVVZ38/4d2/V+ZQBE/iQxKZ63wqA2K0u4E4W4I4vZPWZeCdjPTBVtm3fI+I8dQGHDkevhgmFkb3CviZFU6iWcVVcOZI/NHxKQDZabC8YUChKKzz/k8HFP9bfatTAo3ooK6oLaunjP5M7jOWFoY1jGb7OgTPlxBr+SGQf/rviIg1iqAocGBIPHqeSCwtZ9gfF3SrExZN842fEo41kjfKir6aCrYCrPQclyyQbreSQUhnpKQiNMel+QFw9omGBNvW9wWgBXSwF5ddUNj6NstXB8OMkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by MN0PR12MB5908.namprd12.prod.outlook.com (2603:10b6:208:37c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 01:41:29 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 01:41:29 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, Joel Fernandes <joelagnelf@nvidia.com>,
 Lyude Paul <lyude@redhat.com>
Subject: [PATCH v4 04/13] gpu: nova-core: falcon: Move dma_reset functionality
 into helper
Date: Wed, 12 Nov 2025 20:41:10 -0500
Message-Id: <20251113014119.1286886-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113014119.1286886-1-joelagnelf@nvidia.com>
References: <20251113014119.1286886-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0261.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::26) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|MN0PR12MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: dab5d00b-7269-4624-f535-08de2255c42f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xWkzvH1KzECEHDyz/FSPLxb1avOKv1alN4dVyH0PG8wXPcNGAPIPaJZJefPh?=
 =?us-ascii?Q?kmqb7o5kew4xVyhkQ6xvBdrwY4Q8i5A2hRdftXJuIi/utQ0g0LdapDCMRLxk?=
 =?us-ascii?Q?tzYgH+7HVRg5BH/CkfFEU/uGwtE1ZuWY7CTjTPjXHSjcE0xNU5bRVOqS02NV?=
 =?us-ascii?Q?M85e5MvY2Yohi62qJ5W2o2LT9PvMEAmYr6g6TOm85HM0EAcPb5mXl4XuXh2N?=
 =?us-ascii?Q?NisOyGnhiNxBUM28moKg8+3fdc/FTzCW19p1cmzT0pyhhMhL5hSZahk6pkZf?=
 =?us-ascii?Q?FNUhAqfHNBhTzB/ADdPEbVHWIP7hd3p4QogStaHGjqNhheI1Fzn8gHYxDRyR?=
 =?us-ascii?Q?om1mrDr7a2RB9p8qLKj5U3hJ6LD8sOrUgd63oQAznwMmXCo/5+pqovhRnTgl?=
 =?us-ascii?Q?cnSPtW6B6PLLj8r369ACj/NCSDqAbgbzOJauFjORmnKcQ1ekQAJziXl2yCat?=
 =?us-ascii?Q?u+FQ0dy3V/fscUBzmgPKAYx1/pnWO8uCrpJsZp5daNuaCmgwrPIFj5PUaiqq?=
 =?us-ascii?Q?8YRvgZ9zY2OF+e7ceLC2RojrIT6r/E9G20Y1cRKXC9XHnraS1daKwuNxKnMC?=
 =?us-ascii?Q?RlplUNEVOBLF6R1FU3J98YTubwoRuuvgAzBvchwqcxmro0IWrjpNiqiHSR2W?=
 =?us-ascii?Q?IJpaV8i0zDxJfCpMfrEwOjn6J3ysmvQKOI3+6quPKHaeUpAXYupySt7Is/Wk?=
 =?us-ascii?Q?5Yp1HoTugHupTqd9EK8Bg6+XH+mvNipaGGPKqpst5DKrnW9vy9a4G7spOseS?=
 =?us-ascii?Q?d8+LFNPqj9lb8nbMouXmo/XufdCF2PuScOO2K/pptszxX14c2g8nsYN5Py7n?=
 =?us-ascii?Q?tXmvvW+2OmXiyNuED+jyKGV1z7d/1Z52zv+IQ6b16KJ5LH31Hh/Pcl3c+NfW?=
 =?us-ascii?Q?sUkHbBJQQtiKnuIU1Jqtcfp1tq79wsmpIzP/KlfeOwW9e5IMsL5H9pEsxQjJ?=
 =?us-ascii?Q?BGPTceFJzcawTUPgChk3lbAxAYoV6ZfM3dI6gRrUAgrtjAwYGhv6NsLVlYH7?=
 =?us-ascii?Q?IiZpXv56kNZ+y1bhPXLD4/2K4YFnZ5qXVPOY0lSNQuxz6GQvqCB8dr3W4UuQ?=
 =?us-ascii?Q?Y9Is2HzxK7QOe+isU35qnyL0Tx0gVXYXruDs4SlB5CXsMhMWUOxWvnINnGJg?=
 =?us-ascii?Q?oAgxd5p9sNPJT4xznES27VK7L23Ojp/if04oeNHVvYeW+UM7BlPxK/oHQ8ob?=
 =?us-ascii?Q?ljesUzd1KiNGu7Bilh4V7oicJ0n9CxTeIr3Jj+CKWekDf9O/cXdMT+8w865j?=
 =?us-ascii?Q?KRlNn5bqvQ8NvhMdD6QeVB4tP7jZOznO0ezw6qy2TSt8DF2PXekGTnU5JIxa?=
 =?us-ascii?Q?1mMxNJZ3AijT0u7aNv30D1NcwSVL3B7lav/N6x9k6wtKzZC72bkf2Gv4vuWE?=
 =?us-ascii?Q?+NcIu2JemZ8/aMzGl4vc6A9j/iyeyrvXy72ggw0/95mdauhCo1GEcSBQV8Yh?=
 =?us-ascii?Q?gQ/NCHWPTTaPR/8wCsUN4L1vKtDQhXDG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EH05V8ugDFMTEAO5Xf10bMlCtmg+sPph98co7IxUA4XtMCGGxrt/cGND/1TC?=
 =?us-ascii?Q?0BL9FS3Jb9AuDMyXtzFrIXime/++x+YNv0ugThzs8zqw0vy6aB0QOjovzbM6?=
 =?us-ascii?Q?Nz+xd6LNH9fMSNPoFLlV4VRkMXpq49xz3THuFt3uA0iYbD79X6BTtzYoTEAL?=
 =?us-ascii?Q?AdAZ5Jw0JtPEFlAXcs2fTAkm4xQVakyYsjqIKAdVM2sZwRPQjEucb7FSF7MA?=
 =?us-ascii?Q?OteEul4I0nuJ3sQTza49kln+wvmqCpbYklxJ6IK8KOIkeB8dZ1VnckPRg57/?=
 =?us-ascii?Q?5d7VLByAtg8RxW8bDZ8GZmPD5DHKL5V8/90WoLXbiKm5vvh16V6JYhUXsEQH?=
 =?us-ascii?Q?vdTHRRx3H9VsuEBOaPEhQC6GwYPJhvu71DjQUVjPpv/9m+L8wQP0DWDgyzqq?=
 =?us-ascii?Q?3T/CeffL7evRldlFJVR4wjB2dbRCCjvbk0Lkz9Kyh1iDzhKsmxop2tnQ+Gvz?=
 =?us-ascii?Q?sIGy19W2u3JamCPO0SfhSWsOTAvl61xT9AqWvr8L9xiBiA0PQqWD1eEXwsXx?=
 =?us-ascii?Q?ZoSRhgGA4vyee6l2NK1Wh1+d+yja2Ecx0R7YCGPoq3aq1ClBREADBDa3Y9Eq?=
 =?us-ascii?Q?9QeEVKneXRLGsxAFz6hfWt4B6TRR00rLer84FHz7/MC9gn+eTmAKQVHFS8+L?=
 =?us-ascii?Q?zjCMk+V9cRilsxWJ8xk2WE/IDeEZe+gY8WIioDCKokWT/8bXw/RM0JZEBu2x?=
 =?us-ascii?Q?VUqiI6akW//SYWsBpjt3DhdE6BijaJ05xTex5Z1whOvdLliOIV+7D6eD0ka5?=
 =?us-ascii?Q?m80wGEVxdP0Pud27VQfh70W2fESZHeLg21Kt5EIMkFSiNkNDgCs1wkyiK+2o?=
 =?us-ascii?Q?I4lC7szDxr1LecoWaS14Q4SFELcMzMnd4qw/cWq8P0HockwcJfhNiS4StFjP?=
 =?us-ascii?Q?KTD+wEwLbofq/Zp0rEL0QKsiqoaF8/USDVZP7z13t1wdyyYmHw6lgivRDB3J?=
 =?us-ascii?Q?TIqhnJRLYRplaEcF6BYxr8e1GlQQY6P5JCAREvvpKoyIOLTXwJ2jgrJ4vJ2m?=
 =?us-ascii?Q?tvNK/cTL9aEx217IMCG9GB9yyLEHEacLlDt1wmQrLeoYzu3A2OsFO7uR1zti?=
 =?us-ascii?Q?0eI9hICmeyYhdYCh7QWe6rmxw+yIdvzJMXGVyrdv4C3jYsmR8aLcuh2/iSYm?=
 =?us-ascii?Q?J6W4RnBx1VIL2AwYw2KQARKtF2geuYBHiRjTGo+aZc3X2hX1Qh8HcT2uKQV5?=
 =?us-ascii?Q?fuVwMUjKXHMAXV6IsrNy4w2I6teFdwCssI6eAUyK2RPmBCCIoN75Q0P1qAAi?=
 =?us-ascii?Q?gSyy3iYZ/o0tcgysx0dzZ9uysNuwy4AGCYrERwnRas3HD/VL3SL70enDzSfd?=
 =?us-ascii?Q?bxqVWv7FJLExWWfQAPSKHyrb5SrU3BH0j0SHQEDWAGH6LT10VFJoHIovniK+?=
 =?us-ascii?Q?3seZuoUXk2sLRIhIuCoxdFukT+fk1LgAtsJ53GN+LP3XgQ/RZ6mkekLaAzcU?=
 =?us-ascii?Q?8PoFts7VCBeiuexMkdupT7/6aq7b300ZF8cIchIb9HdWmTSeIF44ozN/TGaw?=
 =?us-ascii?Q?c6mdPwxj1BUIQ1gjRBxiRdbsntL0BfoBViGrEwY48J2SscXG//88c7X+H1Fi?=
 =?us-ascii?Q?cybxjTSslm5lkBwdR7TjjJ03vjnQdWGpPK+fqAXZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab5d00b-7269-4624-f535-08de2255c42f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 01:41:29.2967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/as3IkRNoLai0S1rXc8otdYZaZnlPMQsftjZaO64EFP3U0evz4rBX6vaVZIjBPU7y0iwQ9JhVzWT71c9yRhJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5908
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
index 5c9f054a0f42..695e87370cc7 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -382,6 +382,12 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result<Self> {
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
@@ -531,8 +537,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
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

