Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4B0BE678A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 07:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B904A10EB0F;
	Fri, 17 Oct 2025 05:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L3Qmqoo9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012019.outbound.protection.outlook.com
 [40.93.195.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0D710EB0F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 05:48:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDDHaulHgZ4izqzVykhBAxU6UpXFClgN7cy1BoVhJbqBIr1RDJFj4TMZlnlHsFhsLii7RYO5WbPditqNzMdyabp3cD/DZZb/Zwfx5KbVBxA1Fc0Hd3P3H1dxHPZF9eIlSRUwmxMuV7eHqnbu6D0rrfeobhjYuWi8Ww1l4n5K0mBH2p6dol7NTTAvdVI7q1yP2SCh2ltdWpmuTigdSYV8Y5KRU81A5C59aMZt59nQViBmsjwz1exU4kjzQZqHkzsANGP6rb5drjhpFl10WFkeE0z+RQeEiEBULwiH9R+F13NhveKwdthYnSJ3DNLSbCWMpS7tIiMRlYBZ6cBCk45Thw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3nsjbEkKoVp5jBs9GfKhKdsdGUwbzFbJJD531mQDtk=;
 b=GWcIHlDJmIdSic49bbA3sELq9vr3fB2rir7RzYiqjLrO6e2OCgZ4idRMIstnaeZ8mtAHzC/K/wJwSaIQRPdXGXEA8n27QUGEl4CqLuzJUQvbwKNSXuV5CKN5HHBSXz64UtJQXIH3AdOzTx3649ISnvu/zXAec9k0WHgK4PfyN6xUmij4ipWzt1lKfcq+PuzHZDMkSAcZt89YHqmqxDshQDn9cxzGXz/5g499qdEu1DIQj1EG/1RpmNlMHydTvQCDQDVoy7WN50h4OUt0Az2K+9MJspcVNNO72E/dy9UM5c6O03I+Lhimq6RebAYhCunmW3hy47qEryATjl2b8b/Dvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3nsjbEkKoVp5jBs9GfKhKdsdGUwbzFbJJD531mQDtk=;
 b=L3Qmqoo9hYtXdIe7rosn8tbsbzlPdqn4szo2DN0uPjiGAhKxy34XUbgspDn4+ewYpSS/P9n6TEiMqj3EsZWN2QwS178wB7DjAwkO4RmEpHaeY4WMqi9n+uNX8M2WsNnQ10JDakrS10qjxrS/nviysKeb0Zypi+IHyWOW8qmFKEnSman7P8P6qFVdh5QFS5RsNzqqn/nvusTTIhxofkUNdhvw+EiGz58csEmiiQ70JJeiWdkGYCHevNGAF6Gf9rwzyTj0kkv1ZB5YiyjX/fHqcUm06TqFKtc2Rb4aKhzo80MCG9QJ0sghuqyaOk3vCaqzIelS6VLnzDjlQui07FUJhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB7819.namprd12.prod.outlook.com (2603:10b6:510:27f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.12; Fri, 17 Oct 2025 05:48:37 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 05:48:37 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Lyude Paul <lyude@redhat.com>
Subject: [PATCH v6 10/11] nova-core: falcon: Add support to write firmware
 version
Date: Fri, 17 Oct 2025 16:47:35 +1100
Message-ID: <20251017054736.2984332-11-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251017054736.2984332-1-apopple@nvidia.com>
References: <20251017054736.2984332-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0041.ausprd01.prod.outlook.com
 (2603:10c6:10:1f8::16) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c86334-681a-4fd0-a29f-08de0d40d0e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CQQVW9dttwSf5QdTvifZhOJm9+a6wuxO4FZg2tyZoYVNoztGcHXHfbWljiSq?=
 =?us-ascii?Q?EsTKrJE4FhEoJVuG22qUwKWlb/Ir2Nz4/hSZqS5UJHaoREDH604svmcWGjQt?=
 =?us-ascii?Q?xTJ6Pn/176eG8FmOZmckbqCZnatZ7ayTLEHQL9wdjk5gYh4mk/Y09kjFGTS+?=
 =?us-ascii?Q?xafZX0SmEEcZ8rNJpF+vdfgYPtuBXnGRab97hRD288SaCB4hMoRQNEzs3cPJ?=
 =?us-ascii?Q?2/gJiK7nbI1jYKoYuFN0ICjjLIl2LJr5cKFGra1UIbfHb/zYCdvLPNPVGLgO?=
 =?us-ascii?Q?AOMyB1IFSpPNybuYFG2XQeY4C5DBhLuVE/hkAK8hOyV32hUG55iA3E0PORpB?=
 =?us-ascii?Q?tjt2EfjUuYZKN3aeUVAzVSkH66IcT0zJAUv2JWJ4WPCe3gV+h4WXezVbvEbv?=
 =?us-ascii?Q?ateTRZ79FbT4zMSF+IuU+T7kzuMMbCfEOw3dEmivLLq1KMuYgU8FpTN7vW6+?=
 =?us-ascii?Q?BmvafrK2PNOF0R1wjvn6AYxE59UpLh99x+MalLw9AS1Z2OmdNCSlHwoD2Mqk?=
 =?us-ascii?Q?298fcki0dd2ZWXZVUVPQxVYkBWZ2IEbDQkZHFKqIJJWwPFVlqhFzmP9XIbU9?=
 =?us-ascii?Q?LDOQWDWA6f56s57YWI2CikIbJ6Cyx3aEPpC6XF2poRo2fTcOXAlfAzdhEEy/?=
 =?us-ascii?Q?OuKwxPXmnX9or0JcpjYWRyOCPUB1Bq/AAnKn8Px72iQpZVKZURu0TT2fMAOc?=
 =?us-ascii?Q?9hglRNT/6o/o0OSzN5+F2ONpeZmtXADefUswBUQxuXFDreo7aPwae5Ygqz69?=
 =?us-ascii?Q?LThJkmlua6h9Tbk2kbV1PHMqB+i7JYC2fBRl9h7nrEknmZ2pifaMgc3HIL0N?=
 =?us-ascii?Q?CDcGmS7QzJpIpbU9+Kacm5wPHjKB3jMAVNmYe6n6Nw2/EtuRR1jHCC4Cg33t?=
 =?us-ascii?Q?W5XRTypb95Ulz+Mg/vrbbyYCo0qzmTjb32yn9y/DzZEYjij73LHXlZYAjdIW?=
 =?us-ascii?Q?zKE49+6UiDGRbG9Vb1zCWM6upGDB7wH3yTT5AWcQ/QJiO5JFP1eN4U5Uox+1?=
 =?us-ascii?Q?I8y5YCCUSDf9grmsV1u8+xa+GdtIbYbdLf3Y6hU6eudXwHWYPfazSnQeKdzb?=
 =?us-ascii?Q?g992Bmj4HwqwKif7rKjiiUDr32Uy1MMbRugMw5nX9ekfB/KGk98PoPgLXHWP?=
 =?us-ascii?Q?Q0B9eq7OdKZOe8Wz6xVhDn8geqJdVZuVs5i5f4voQBAwJPbXkN9HRSfLkBwZ?=
 =?us-ascii?Q?8pc9mJWbK0+9ge2z3oRJf4Q5yYHSnWJ2m1f5hLTc81ZAms7a8lnBQZapofRw?=
 =?us-ascii?Q?/Xeaq4VsrnbEm8msXS/28gbHKbJSI5+gfbN3k9ucr2XiB6U6v3dX4LO3L0u5?=
 =?us-ascii?Q?29mxRbIMOjK2WSFTHpEf/kEmleney7teI/aBsvbDjplGccWkpTRP3BqhNS4v?=
 =?us-ascii?Q?lSvHIGN62Uw/8wTTgcTdJ98lJhfyEGkMFOEV6B1oHImdswdRHqLWTgH1dx4U?=
 =?us-ascii?Q?nAIDrd+0GVHvhKvbjXjShdpAmP4htNsM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vCaHrhq3ozAr8uxQkS2OiC1JMUxOVyIiQvmJdSYKWgDbSyHSChqjqNlxfQW6?=
 =?us-ascii?Q?hHHe/ON6PF+peE6kHFHR/CcupovIQdx5OUPga7p37Zo4B7+N7KVbDMPMxkSi?=
 =?us-ascii?Q?5Wo+1MyIBvO3umvPBrdCujGMY2MW6/UEpQDdwbV0px8hnsUl2rCHMSmH5h1F?=
 =?us-ascii?Q?ageHQOq4f+7k2+iD2HQ108vPbjDzcU2A37vRZySjN6COXdX63kRXUQl1WNwl?=
 =?us-ascii?Q?veBEJ/4aci2e+GXaRPkI0qaUv6eB4vAcvOV+3LNfxZpQBi108mQq6G+PMbJi?=
 =?us-ascii?Q?o53Okz3q+0pRbHbKqnuT5M43QNllIxJ661kzsUShf1psCRJst9Ac1Wjcol/6?=
 =?us-ascii?Q?R+1Cy5Jaw7o9e6Y0Yoae9Ft9tL7WyLJUuEYI8MNN2EjYiFKR1EfyQKEzD+Dc?=
 =?us-ascii?Q?7EZQYyLB/VsH1TcYXjWwAHsVC3G35bIKR2xGSe7afN4yNzSiAdp78FLnTB5S?=
 =?us-ascii?Q?R6YD8tLIeO+w+VkqV1iOGSPqs08SW377+7Kumgo36k8S6ONXHZlhtM8wv2vO?=
 =?us-ascii?Q?gEmy/DC89FgjfapnfHAvrx186BIDszMGs+zczv1Pxms1A7TL6/sTJvTgsPu+?=
 =?us-ascii?Q?hogMj1Ltrl6YoBBUbUQcvL+C/6sy+fxBMzDLbgYOV9cBdG9nPwhoshSFLK6L?=
 =?us-ascii?Q?1lHsWB1QtH4HSZz4rVE2f4QIQkjWw9nLI3Rt0levajIUFqJY9e1EgXV6nj88?=
 =?us-ascii?Q?FV8zxBSvnvPp6wilAu18ZyGOE05WXGCMwqxUULD9n2d5I75HbSBdmgoojlzK?=
 =?us-ascii?Q?EZMwwS0fHIpvaUFPa4rnMZcJm6ZXcC4AZ9wGFKGRUSNtuXgQhcJTQTJcSS68?=
 =?us-ascii?Q?uxJvBFAKhf0Sr+fF6CdSil8zfVbw7whk5wBDPWbYVGL3voWj6Rnm9E1xTZZ7?=
 =?us-ascii?Q?o4+Wmbvh7duk4gH94Z4z4OkZIPJ4vkG6OwUrQV9PW/ff8x7DOil+hbpGkS1t?=
 =?us-ascii?Q?YH8juymO4gpMrZhcYbt42bQhGNdX/2iFACtU5c+HER2YQfqRkGi/XXzlv7bo?=
 =?us-ascii?Q?zI0Jjr8Pl1jiYPVaPU0x2SU85racOR1tOCQHfdRmaBZHtNdfr/lvyAM9RkR7?=
 =?us-ascii?Q?3/cFzXDI8aJw8tQcz4I/opS1X2CbJSE+SpYobtJ6di//sUvqcStMWdgP7kL1?=
 =?us-ascii?Q?Ai9KkIP3+/1aG52RtJRijhENEiaMhEjXf3Obtu8PcBNm/VElRtw7CQvHi6r4?=
 =?us-ascii?Q?OCT6bC+wH9mNeEqYhcutKT9QsO8RgOmo7Uxze6A90+K6tzHVocUGx3bdCHQy?=
 =?us-ascii?Q?RvB/CzsueroPUp75YyEZypsN5S0UsxeapL3L+AY4OLE0G9GLasY/8Xwgxlv4?=
 =?us-ascii?Q?DUly98SNq48H1k7sMRE51NY1Ou9tfdsanXlfZSt9NepXBKE5qS0brNcN1GRv?=
 =?us-ascii?Q?kbFdJZKL7kUvUOmlr4yVsFr5zZU0w5/foVXjxOBgOK/gxUjomfsGRIrS+i+z?=
 =?us-ascii?Q?s0u0LdB2PzkHKlrMfS3PB6AKLbHMRVL+PrWkgiVO9vGRTHjO0OKZLLnOpg/p?=
 =?us-ascii?Q?olmNolqKfORuUZYMRrX9Og2E5Sk4xG1PmxWd1Ct0gDL0cv0TiexTdbzDvvFU?=
 =?us-ascii?Q?smzWbm1YfJHmw36nSII8rBNFnAxpj7p1KFAqUCLn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c86334-681a-4fd0-a29f-08de0d40d0e3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 05:48:37.0837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvdKEEWBzhbjoSup2JnmTHK9/vMfPZAYR8wjjBMy3fhxmuXgDI+cu2z7in6EOI0jNNZntLyz6BKUvEJ9DJT4ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7819
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

