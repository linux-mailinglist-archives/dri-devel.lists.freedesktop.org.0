Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEF1AA7E5A
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 06:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025E910E324;
	Sat,  3 May 2025 04:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LzO6Y6qz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2042.outbound.protection.outlook.com [40.107.100.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9A510E324;
 Sat,  3 May 2025 04:08:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvCVDcnNubOCKo2tuJHVKFjtO69Hsie+hh0Qqz1hVCavRoGYS8r+HhP0N/9b6C1lXUkHTIKxRYeakyd2hTBoYhuaBB/fdCGDd/B21MxdfbHUFROycWmHaGAZ0opl+zY9p17cbxhUinoSwB5epiYv+Pe7QDofo8ihl+hXEP9nhbJTAJwSUfGPRmnT5eSChekGbv7txGapv3twK5SSjc5sfqLVXRzRmH5HxI62c5RDA1DyBka1ZeGaH2LxEK91h15mGDQb73vMYp3fICVWmwepTEHVQJ/sLMOngieWwjCxZ3XhgynC9NvMdgTcEqDFueXsrRPG85lCczu/RTunBE/AYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlKV0K8/f5ZEHh/XHSiMpp9C3gpM8l40A0/ZCVjhKVk=;
 b=aSSGJyuF4JWM0fHwbDPO/JTY90oGIfleLxXHnzxv6FgxKe4psJMUAmWMTmW6AXxCpOSPWp4wG/nmHJzY5Ys4TpAvFogtFkbw+xHGo6N5pN7nDWT5mtpvxnGNBamIkSY4lxJUDhvzXTB9JloDcFjuKk/R9xmidPPgQGClJQoCyKGUdtDJHGu4ghYtz9OUo5JU9ke6HsGCQ7r6PBk9gja9/4ejwecKBtie/+UEdmrfiM0sSAHLWFzHAhbyWw1DIDTEbyKzYhdUQp5k3gbp7Vk9oXexB9izQl+QO3lw3lSpKxShAspCPsd9/JXpjICKflJw7Mu1vhTdmuwOR5PjHExwkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlKV0K8/f5ZEHh/XHSiMpp9C3gpM8l40A0/ZCVjhKVk=;
 b=LzO6Y6qzvlt83eNXFMFEoAnfWcqaMFQb+01yuPPTqh0c0dUQo2bFQfGWsEUWINP8hCsP+WGyCjg2Dqahh0EOxIOmX4WoORdXrznO+7e7f27iyzs7Wg861Q80h6BktqhY6WnqlsO6cgUBFD2fEo1hlt7ogHahYHY+6m1YchvgWVanNOV8rJpUT8lg1T89E5LNm5qqwy9hYeNxj4SVJBQAf/0TxcAynN8M481Qev4yVRgut8GpEem1B6zf5i2rjTJz9ED6cUqhT8+5SCjGglxqdHDpy/6ZsWJ2NaQ+YaVZ0os7aNfkLmrQBlJvvBav2FuC0vJCAMjqRV/l3acxjAj7xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB7713.namprd12.prod.outlook.com (2603:10b6:610:14d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Sat, 3 May
 2025 04:08:12 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Sat, 3 May 2025
 04:08:12 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v2 2/7] nova-core: doc: Clarify sysmembar operations
Date: Sat,  3 May 2025 00:07:54 -0400
Message-ID: <20250503040802.1411285-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250503040802.1411285-1-joelagnelf@nvidia.com>
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:408:e6::12) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 902ca1f2-18c2-4913-565a-08dd89f81ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LPox3/EnVOvNlC3L7hT4n7n1A0a6ZMVLwcIN+Rjw7VBF7+sIs7Soe7QgSSg5?=
 =?us-ascii?Q?MR76/BZYR7r3QpZ0rnPrNzXkR0plkqMRQRzf+gEaUvuTaOpuqrQscYQZOesa?=
 =?us-ascii?Q?v9/w9+A8fGKStccw70eUxpJragQDOxAKx8VsyRLd3orwQU3ds7bZ8YwbqhvH?=
 =?us-ascii?Q?i+bc0HvWLi/f/2ayBiMfD8+SCIKFlbf+ygLFEUgxCERVl0v4YWgMskEx+3vb?=
 =?us-ascii?Q?nWfD4lQocna53NvMeCJkhhSsONvJY+Jyi+sQf2G93ZeQT6hu7HgNhnmxP5Ou?=
 =?us-ascii?Q?s4Vlqs78mbA/gJTs3b8Kb7aWrEv7CXUazWQ4zCGeJaS+0bhs2nAxL08mHa/Q?=
 =?us-ascii?Q?80X5b1ha0DkqUX8QS/uGwgktHLWN/mdgaX9lVQliOf2xsRAYuKia9RlVmhjD?=
 =?us-ascii?Q?qb7JXSHQ72ue4nwgGxPTZsywplZYYQ7TPviF+mNovqngvhnIcMz+qzU6wOlo?=
 =?us-ascii?Q?FsIMSWb8zcR9YVeFmhr8Mis35XWi1JXrN5+WD2jLm+1nxsoI30tceufvG+3u?=
 =?us-ascii?Q?ZVY4EKpPvg+uGxK7ZVd8qTv6pe8dwujjTYe7NTRS7PQZHwT22fPxUFvdCD03?=
 =?us-ascii?Q?HTw5vdz/Z7gXLcncDBC1+TP23HeD0mKw9OIj5bspaXy6y1f6zVK97/HqtC8V?=
 =?us-ascii?Q?zJSOkjHrKBpHd1CvqH+oCHLinT6eY8TkUQMjuBHGwjJ6YF/yMCwB7e5jDWNF?=
 =?us-ascii?Q?fa1QfL4HA8x/s3RBueGuCilJgkcqqQoPfFehnE8hjyMLbV6KXZFbzOG6fDy4?=
 =?us-ascii?Q?qhmJK+Ercy+8K6hXK0si517GeU8bsKQj3SzU9qkvB0iFRPJnzgQiKJAJaBcI?=
 =?us-ascii?Q?BMAusa0euBR2kyGhxjbdvFYJGXcPsGOHMOiYW6KvZ9BnbK7KX0u0CwNvz5X/?=
 =?us-ascii?Q?gFYFE9Z943W+XuP+X/juZ8/0rX6bhGkFWrvFS6oLgDI0lOmxWczU9Ue+vy6b?=
 =?us-ascii?Q?FMbHRfmvMGi7ztRkACKQ+3hbSN6qOYBWGlSt9VvktWjGr8maBLLRgZHwOTLm?=
 =?us-ascii?Q?1NdMr1+/I6aWFveae40H9wIS5zIGknexjNviNfT+3rZAG7Aq8Y7rgA/YiF2e?=
 =?us-ascii?Q?S28dJZ7ntXyH4lsGj4+rSru59oC9Blc702CrjymSYc9xH1xuPj2OnTaEuGfl?=
 =?us-ascii?Q?ucpHK7ohFk5Ghf0VeCRuCvm3Ei7b6R8jZUwoejMSgeFT5WUpdb/fT4mgmzyt?=
 =?us-ascii?Q?c6b3DvHo+zg7NbwRqPedOf45T70Ckp32M6wyDwrzPDv3FBnKYGS9V1PdE0wK?=
 =?us-ascii?Q?IjCK+GkD09t1oKsL+cQJ4tLef34PDX7Pf8uqWJ14j18H4zoMEtVfn8BldJfq?=
 =?us-ascii?Q?O4ZDKt02/Gf095eUhY7zdu+eRxXCLbEWvCsLOrpbW0oBR9NIlk+AjBQozfEB?=
 =?us-ascii?Q?p/WFsOo1h31oCGwjj0H7iyGQxc0byYVGiYYzHS5ddzY7kNNe0F0UiMYjWqbw?=
 =?us-ascii?Q?dVg6pLUmX/s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CzR5W20atZpVPbWPF+m07M/9u5/Cl04CI7h92wLg69djyofUnHaA+QHcg3m/?=
 =?us-ascii?Q?Rhq/kE6spXSt4RzMsZjJp5Lkg3VCwIgMk1PLG14W7hPCov6Dt23i5j0ni1II?=
 =?us-ascii?Q?VyAuiAxPeNIH2aneLZ/fZ3xDEDVp/QauveWKkkRP6NHI6Xp3pMcGlUiluEVV?=
 =?us-ascii?Q?pGqQ57uanPGtSnIhtwRPfKICJi7PzFQAm7uvCG5KQzLuhfMhGlQBcJoo9nIh?=
 =?us-ascii?Q?v7svshFuTbTYqrxyuIMKWb+skaTPltlgb+vdTjf4zlb/tRnTUlRbYOa2AjPz?=
 =?us-ascii?Q?Ik7lukdvFawT51FrFv09NbyNwZgRSogi3TN2R3Y6S8/cWO9sZm8bL0wvsgWr?=
 =?us-ascii?Q?EBIaUuR7XX+fjFkrdw1OxOXfM1WtjVMrx1XA9IoCkG7H4QLV5pj7RlcuWfUX?=
 =?us-ascii?Q?xb7ArqHC1yrTzfr9L0XxcVk5N0b6CqEbv9+E5oqXgd8urAaQNMBbxd+vzX1X?=
 =?us-ascii?Q?DWqaMdqqmjwZdUOCrmAAt3z0lP2HMnt5CwXGj4GkpRAOOIfbezUwU3RLDJlE?=
 =?us-ascii?Q?NvHCIhR4rvVGThtGFSu5CGp1f3WPfv5M0XtSmoWqCZ7pIzbsGx5lzAMHrxQm?=
 =?us-ascii?Q?tI5DCoXyuu9jYGRtUQrqwqWVpGiW7XjOx5HmGdUllra+vaZ8ZPRLQUNpKMqb?=
 =?us-ascii?Q?TxwKW/If0WdtwWDokpd2EnOc3ByJxzpgwMKzBRESblOcAcbqNGZCLL5Q/FY9?=
 =?us-ascii?Q?Nm0v++j8hVNqLA927QjhCyqm5zjW6ZznCbFfOdA/edwkEA7dDIQXKQquPgMl?=
 =?us-ascii?Q?cdM94f5K/CGN8rI2XnoYGMjsPgdJeLAH92vrsRdOfMO7P81IoMEH52+i5Qkj?=
 =?us-ascii?Q?SeWv2EE0NG9COW9IEngOgLVf+mTyk25wwwxYtK6IDlMo5Vn2XWT+5u1anUuQ?=
 =?us-ascii?Q?s4Sk5NyA+zXLJhMv3M+g52Pivl/F8q4qlSXHX8SP/PQoheKQ10sqQIjYQnu+?=
 =?us-ascii?Q?rnFOHn2Oai8oYgB9ZYvlJIK3nBTpY2nRUhbIgG5b+DrTzJO05XYMmuBaS7Z4?=
 =?us-ascii?Q?1B5lxtbV6WbwazeVu/EHX8GRMmeFmH1vlvDnRcliliD6bDns83obSPhRrp7R?=
 =?us-ascii?Q?gK71uFXf3VMQvSElL0HODhEUfYRcrYhUyepOyKzYlaWOAEnRrJGv/uAW4ZsA?=
 =?us-ascii?Q?vWF+B7akjSI+7z63yhHVWZUF2Co7E4ZP5F+QUyQ1jW4ScmKLh0t6HArQ33Kw?=
 =?us-ascii?Q?e8igpP0k5o30n7ORU45xBjpmUZn/+DHHYcmTSZ/FRsw/BJ4z2lkrOXLHzN90?=
 =?us-ascii?Q?b8QwBnWfPUBV2wWAMFQBZWFHoOD6Z8rSlZxSPFzIH+B330t1NL5QXHE0q0hq?=
 =?us-ascii?Q?Jnv7GtsXFcbJRqXPhbCNw2HlBfIrfYX9pHTJ6L4xUCgsj4zfU4FOBWealcdn?=
 =?us-ascii?Q?xF4KPz8jAw57hKsuDqRWX77q/Y+RxXcU1EIAn1WRZyTTtiQhGkkQvsGkx+gI?=
 =?us-ascii?Q?+bP/GdlzTbHaXfWaJgVIta+cWV9TjV2M5rKrZVoJJbK3D9WPMKnwTaktkPQ4?=
 =?us-ascii?Q?8kECpkTntW/AofZI7KOjQZo844eJaKsipQlOujTTd0Xi93xYhuLdiIgB0/5Z?=
 =?us-ascii?Q?TaR9rGVLoLkw78vc6ZSzS8jwpULf2f53HPX8Gzqx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902ca1f2-18c2-4913-565a-08dd89f81ee2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 04:08:12.0418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgv3wc7RX8ttMgrRMd1oQVlCbzwbaZIk0J7J2iGRraVP8Rs7Ii3MV9y8pj2lgVO8Ma7DOtlH2VxTpNV6XLa7tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7713
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

sysmembar is a critical operation that the GSP falcon needs to perform
in the reset sequence. Add some code comments to clarify.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 12 +++++++++---
 drivers/gpu/nova-core/regs.rs |  2 ++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index a46768d18ac3..9bd73755c466 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -169,8 +169,8 @@ pub(crate) struct Gpu {
     /// MMIO mapping of PCI BAR 0
     bar: Devres<Bar0>,
     fw: Firmware,
-    // System memory page required for flushing all pending GPU-side memory writes done through
-    // PCIE into system memory.
+    /// System memory page required for flushing all pending GPU-side memory writes done through
+    /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory-barrier operation).
     sysmem_flush: DmaObject,
 }
 
@@ -215,7 +215,13 @@ pub(crate) fn new(
         devinit::wait_gfw_boot_completion(&bar)
             .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
 
-        // System memory page required for sysmembar to properly flush into system memory.
+        // System memory page required for sysmembar which is a GPU-initiated hardware
+        // memory-barrier operation that flushes all pending GPU-side memory writes that
+        // were done through PCIE, to system memory. It is required for Falcon to be reset
+        // as the reset operation involves a reset handshake. When the falcon acks the
+        // reset, it writes its acknowledgement into system memory, but for this write to
+        // be visible to the host, the falcon needs to do sysmembar to flush
+        // its writes and prevent the driver from timing out.
         let sysmem_flush = {
             let page = DmaObject::new(pdev.as_ref(), kernel::bindings::PAGE_SIZE)?;
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index a2b506883654..dcac7ab4619f 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -52,6 +52,8 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
 
 /* PFB */
 
+// These two registers together hold the physical system memory address
+// that is used by the GPU for perform sysmembar operation (see [`crate::gpu`]).
 register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
     31:0    adr_39_08 as u32;
 });
-- 
2.43.0

