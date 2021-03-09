Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DB9332C90
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 17:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163F16E918;
	Tue,  9 Mar 2021 16:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8F26E8AF;
 Tue,  9 Mar 2021 16:50:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBOIINa8eMiiClS/xo1wvms3qPGRJXvbaQszvcwN+5tvfZlgWpLueK+ZII1Yw9DwIUkDrqha1WlDQIPc9I2ryusHUfsOPyDdil7ZRvXD9SZjTEaDR3XAZtAKF4q6N1L+70ynx6VvRoAr6/MIh6qLcglhEbby5DjcxMuaTm4VC7U/L8O+WRifPrSOnO2rH1c1kkpNe5Vm90s6rTAEe+Qedd0b0+Az9GLV2bAo0e06QZTmaRepJSG3GBBiTMKZs89ox0tvzbfeB29x9Ub1xuFTJ5cQzrHZV1g4v2U8dyQPXBTA34bGLocuOz0vlmDzmCpbywjlxNuWtzyFyLp17Oi5uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SH1hprtVAekCCiy+NG2XyJ9KGAuMoXJVOV6KDuIRVk=;
 b=CpiAFF1ZaFXWRxwfau4LllWz41gHk1BV2ZedyunVMKfoXzJ3BJlOdIDRRngnVN7RkTJa331H8EE8DYFC7C/uGn5SMs1iOhc93gsMimxJWmhKS81rK9Vg9l9Y40Dlmkszlde5LMVRrXfU7nwvX21EdALe18FE7KPFBbHQJEoFl5X4SWI2H/Jen/P3IsQyiwSYuF77GzehWPIcXug9FWZfo8ut+fYlm0qobbbvjvyMqwPa9WaLUN51UOicHgpuSRrDAUn/7t4RqDxEw97DqYmpnCE8WIs2G77KAdnIhzBH0tQzrsUStcuf0cDuVPDQ+SW/A4XKaSg+oxIjgitVasqIzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SH1hprtVAekCCiy+NG2XyJ9KGAuMoXJVOV6KDuIRVk=;
 b=1ahvGXuvDAmvaYRisil59TYcxleuOxtHprGqlBWOiueZ7Mg/0CbF98DJSu4cHtvMYeTdbhXXhT6TjdpFH/LSJ6N0aLDabS0XOMZ50nxqdpOCXE83kJ+nfpNEpOqQv7bkxHPvKhhpTD6Kxn8yNTVheBlnPI1AJPQOXUsUyIGmoXg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4224.namprd12.prod.outlook.com (2603:10b6:208:1dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Tue, 9 Mar
 2021 16:50:42 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%9]) with mapi id 15.20.3784.031; Tue, 9 Mar 2021
 16:50:42 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: arnd@kernel.org,
	alexander.deucher@amd.com,
	christian.koenig@amd.com
Subject: [PATCH v2 1/1] drm/amdkfd: fix build error with AMD_IOMMU_V2=m
Date: Tue,  9 Mar 2021 11:50:18 -0500
Message-Id: <20210309165018.26213-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <4c692eff-9d57-278e-8da4-36bc2c293506@amd.com>
References: <4c692eff-9d57-278e-8da4-36bc2c293506@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::23) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0054.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Tue, 9 Mar 2021 16:50:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9a219696-5ac1-4927-ac2b-08d8e31b79b7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4224A8E2AD6A5225AAA6A81892929@MN2PR12MB4224.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J2ZDMm8sdSXirKFjH8uPxn1fWRKgFwkbJYj0bDJgkE0g5wFUhhxCFjt34nh19XACNKAIHO6FohXlBRcn1mwaLuDUtDDQU1lm4QH5wzjByY/aP0t0XR1EAHglC74wYX3dmMnP9+XJsuLFck9DQ3n7JEcfKagqPk7By13dMgr0uAaS56Jc0c4Ie5QNoC7k9gqrTg0Qg4dQrtPE7W91kh6wB66JnsaFcQSWWh/SeujJv14Jtnv/ltGK91X869AwAMoXLjxMn1WYmAVilWCdLzVxoVyqa1LumM5HtK9DuHxkGWRxdGIoZJEwoQRiU9y5uPHSw0Z2mtsLi5IXuMa+KIS2RqpXaLgHpKG1iV4/Kj6m8m5taE+08Di7iVNGZSmrj1TJwDIlwc4vCnVL+X4cYppFBj8v0cPJLnuT8t4xIKgaN3wk9cHYcXUpyNwH0SIu9GWH7/qtflhNREFxFthPCpVJNVw4kgTj627s1uWH/aSD+uRSQAr0kripIHcc8omi6kFgkYOeOKivpScoslD267KpKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(83380400001)(26005)(4326008)(7696005)(5660300002)(16526019)(66946007)(66556008)(186003)(8676002)(52116002)(6666004)(956004)(1076003)(478600001)(2616005)(36756003)(2906002)(6636002)(86362001)(8936002)(6486002)(316002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?U6nO768hT+BG1RFerGi72AAQhaxpGu9DCvGH+CApMY7rympNz8CgRvxqqVOV?=
 =?us-ascii?Q?m0ZPqUaI0XprOP6nAl/BV6blVauc1s0+NWWvq9MAtvQsDSLquBQhmvyqNRGG?=
 =?us-ascii?Q?ZbBtb+7jWtFL2bTHZPHUkvJvORnMPWim4qeKplBYTwRkF60aRPO41uuWS5Zg?=
 =?us-ascii?Q?/m+gQkCgS20LSrCgCNxC/8w2fw/FVpLTfcgHKItBkpePgQWO544DAwyHRhA0?=
 =?us-ascii?Q?JAWuzeJHiV/+a8vUZLvBHsF+yygVtbMXRGXnNUaVKzZoCnOlfCyY5v223UTM?=
 =?us-ascii?Q?0pbjnVLAUItou8EqGczRG+FzPnkCng5onnJEwkHq65xPRdmzA5WyGim1fFfM?=
 =?us-ascii?Q?3zQyCWYRJes0vOU/fwu+CxAWdMmrYMb5nDWwM8MY2v6qIJ3m1exfSsb9mMqZ?=
 =?us-ascii?Q?STzSWq9a/KoUEx+a9TV8tGAR/VgbobMfQLRwo0pJLfaxD/eg0u5Eqx1wBe+z?=
 =?us-ascii?Q?fxHMmfelRf+8KnkA6w22k81hpM1N8pqw6kCShLkTAJjLYb3JraRUIdE+x2by?=
 =?us-ascii?Q?/Ccq8E3KKIxEgZw0fInVgN4H0LUNFzkkqbyTNCIteZXKe6CP4qCEc7P38EhJ?=
 =?us-ascii?Q?lmclNgNYgIscB7PlThisESWsQpiLw4j2BHtrEum1ZGvXdWThsiFBuVAs36uf?=
 =?us-ascii?Q?qOkIPf0TajruFG+pqh3N4t6lDEaJ1eAK5eahjvyUXgHXMikFDSpMuhMr+EfF?=
 =?us-ascii?Q?d5KY9oeLjNx/dVJBU4rToDsR3K36LAt5c8ugbHc4EtE1lKstFEuO5954BzS0?=
 =?us-ascii?Q?pzUwAT8e1VIEWz2PBhzgv7LBQJ1d3Pox+G/yi1zlCj1Xrlg68z3gqHAdwMrq?=
 =?us-ascii?Q?PaJ5AuH1YYDYbrAsbPPyuCvdXlMclG482If7a9QwpnKkMuGgVeUBsVmcpMI4?=
 =?us-ascii?Q?cJPGqcSsx3sYveMIsXCjJXEntlK+/4toZBnPsPJm3EnIa/xJdJu3nzP5XV5F?=
 =?us-ascii?Q?Fx4jbLX/abyULV59v/C6CvdoXXHIsTpI4PM95Bez/QqzuvCZAAFNE8++4MwV?=
 =?us-ascii?Q?Zugk0cwvwUa53q1sFBtcfcwEH0enyW4RO7i3KP+kFkdMCpLyGS9dFpvyr8O0?=
 =?us-ascii?Q?XPQDfFfdi/uFpYU3Pio7lGIZgpjxXVJtFHYTKaonICzglLZiZYnADX7zi2Kq?=
 =?us-ascii?Q?tGolVMWKwv57sYRBdWbnA5ojbddQEDUY1D48TQRby1rIisvWioly1PkGybEp?=
 =?us-ascii?Q?rXPvc/JYV2jTwqvmjUhimzxExe9QCAgf+QXDE0vk/8QuqNoy4Uqarzi/6Du6?=
 =?us-ascii?Q?5THpxm5QYs7MaIaVKfMRs9BX4rZEmOgf2f1psJJp0AWT276id4mdvUEmOlPH?=
 =?us-ascii?Q?8AFo3PP76p74WxjOO/mrGR2U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a219696-5ac1-4927-ac2b-08d8e31b79b7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 16:50:42.0698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxS0bkn31NhLx87z4O68g/sfuF4EXyMWDmL8mpCpQ9CPxXe+F/Fr6yPLqSe1HY0S9zvtI54lw0IJgpzESqgNsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using 'imply AMD_IOMMU_V2' does not guarantee that the driver can link
against the exported functions. If the GPU driver is built-in but the
IOMMU driver is a loadable module, the kfd_iommu.c file is indeed
built but does not work:

x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `kfd_iommu_bind_process_to_device':
kfd_iommu.c:(.text+0x516): undefined reference to `amd_iommu_bind_pasid'
x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `kfd_iommu_unbind_process':
kfd_iommu.c:(.text+0x691): undefined reference to `amd_iommu_unbind_pasid'
x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `kfd_iommu_suspend':
kfd_iommu.c:(.text+0x966): undefined reference to `amd_iommu_set_invalidate_ctx_cb'
x86_64-linux-ld: kfd_iommu.c:(.text+0x97f): undefined reference to `amd_iommu_set_invalid_ppr_cb'
x86_64-linux-ld: kfd_iommu.c:(.text+0x9a4): undefined reference to `amd_iommu_free_device'
x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `kfd_iommu_resume':
kfd_iommu.c:(.text+0xa9a): undefined reference to `amd_iommu_init_device'
x86_64-linux-ld: kfd_iommu.c:(.text+0xadc): undefined reference to `amd_iommu_set_invalidate_ctx_cb'
x86_64-linux-ld: kfd_iommu.c:(.text+0xaff): undefined reference to `amd_iommu_set_invalid_ppr_cb'
x86_64-linux-ld: kfd_iommu.c:(.text+0xc72): undefined reference to `amd_iommu_bind_pasid'
x86_64-linux-ld: kfd_iommu.c:(.text+0xe08): undefined reference to `amd_iommu_set_invalidate_ctx_cb'
x86_64-linux-ld: kfd_iommu.c:(.text+0xe26): undefined reference to `amd_iommu_set_invalid_ppr_cb'
x86_64-linux-ld: kfd_iommu.c:(.text+0xe42): undefined reference to `amd_iommu_free_device'

Use IS_REACHABLE to only build IOMMU-V2 support if the amd_iommu symbols
are reachable by the amdkfd driver. Output a warning if they are not,
because that may not be what the user was expecting.

Fixes: 64d1c3a43a6f ("drm/amdkfd: Centralize IOMMUv2 code and make it conditional")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c | 6 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.h | 9 +++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
index 66bbca61e3ef..9318936aa805 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
@@ -20,6 +20,10 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/kconfig.h>
+
+#if IS_REACHABLE(CONFIG_AMD_IOMMU_V2)
+
 #include <linux/printk.h>
 #include <linux/device.h>
 #include <linux/slab.h>
@@ -355,3 +359,5 @@ int kfd_iommu_add_perf_counters(struct kfd_topology_device *kdev)
 
 	return 0;
 }
+
+#endif
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.h b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.h
index dd23d9fdf6a8..afd420b01a0c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.h
@@ -23,7 +23,9 @@
 #ifndef __KFD_IOMMU_H__
 #define __KFD_IOMMU_H__
 
-#if defined(CONFIG_AMD_IOMMU_V2_MODULE) || defined(CONFIG_AMD_IOMMU_V2)
+#include <linux/kconfig.h>
+
+#if IS_REACHABLE(CONFIG_AMD_IOMMU_V2)
 
 #define KFD_SUPPORT_IOMMU_V2
 
@@ -46,6 +48,9 @@ static inline int kfd_iommu_check_device(struct kfd_dev *kfd)
 }
 static inline int kfd_iommu_device_init(struct kfd_dev *kfd)
 {
+#if IS_MODULE(CONFIG_AMD_IOMMU_V2)
+	WARN_ONCE(1, "iommu_v2 module is not usable by built-in KFD");
+#endif
 	return 0;
 }
 
@@ -73,6 +78,6 @@ static inline int kfd_iommu_add_perf_counters(struct kfd_topology_device *kdev)
 	return 0;
 }
 
-#endif /* defined(CONFIG_AMD_IOMMU_V2) */
+#endif /* IS_REACHABLE(CONFIG_AMD_IOMMU_V2) */
 
 #endif /* __KFD_IOMMU_H__ */
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
