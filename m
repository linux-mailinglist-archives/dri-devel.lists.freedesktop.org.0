Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C847FD563
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 12:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF16B10E050;
	Wed, 29 Nov 2023 11:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C2610E050
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 11:20:49 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AT8U2co001754; Wed, 29 Nov 2023 11:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=15cH5W/m1zoDqYBNMBF2P
 j4GMYyE9KjG7SMz+hqdXuo=; b=jtVBQdnjW8oAreBR7V/0RZr+fDmJYbMJmRzvc
 nlqbkB4AIF22pwx6yb/7L/f/5gZ/ZXqwEBR1419x+CoehbEYJkrkxEzJeR3acRp0
 Qq3qPVho4iO4DXSEwLgorZw+h8fjSv37tf0c7LIe08tz7rl+LUHlyl+LtLgN9lvY
 K0c4NtRcGq/9sOOpGg2cqY6VAj2rGOE6uo5Z6CNu7dObdFd0uem6vdqJmnd6ad09
 eK4fenDBbQIYhYDDgjj/GUWEpt8bXThSUItn1qBwXRPj/qC/SgxO6el9uD6h1hUi
 4mVhpkkflr9z3tkAPFm5Vm0L4jXf7iYR8BlXzjHp/u/efglBw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3unvk1r8gj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Nov 2023 11:20:26 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 29 Nov 2023 11:20:26 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 29 Nov 2023 11:20:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1MUXi1/SStWadj0hfDPJr8Xr++WbsfidTe4YbvoWr8SI9dTKdA/8oIi3xvqgO3qqT+UYQVXl8e+EZbJWdpgmeS6yWDp1SMhMnlk2slOyDB/mhyHxpfHsSeVVWtB/3BZaj0Jz6yM0adWcjscnZuPOeQh4JKqCUGWT4txbSBNLYGANb77P0SJ6VWJEcGxEuf2COVbFKFesAX9YTVeWOmWanOkNmDKmtzrcsoIK6X76jOlUAd+CWV098UibWlpj6CUoXpS2a3/b9JiHFLbJQlJxQ6/xhkx3WfiyEl8MmDJ/0FbVXoR/H2+6DeCwu4hGNHI+jGHVTpaYc3983mtXyqCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15cH5W/m1zoDqYBNMBF2Pj4GMYyE9KjG7SMz+hqdXuo=;
 b=b1mEDOEAcmsZX0QskqTqh7rspldvG1fhv/gVjV9jTBqnvdUnYfnmlHGdxszPhsAc7Wbz3MTsbDNVV/ETB1XkY2cSsWfAT8PotmM4B7k+D1XtEXOfxC+e8J3Q+2SGoAWYHJ7iTjEn1VqjugYjIsBuajkxonBx5X37jRe3vbE6sfEcVmcf0l+GsoD0yVg5rUmlHxMXIaMVfewWfAeagXaPPRUazCNkn+bbZUrrTUASwbvyKlBxtEnsqdtDYOZUzcFIz0wDKhX+lDGXu2jfxRpQGp8A5bwF8e6wrmGGRjCGZ1PMi/x0ApWc3TZPBCGfMon441d5xDTtAuxF6XmFIVTPyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15cH5W/m1zoDqYBNMBF2Pj4GMYyE9KjG7SMz+hqdXuo=;
 b=UVdnNU7da852eknbXE9Ssu0CukneDZ3Ksu4N0GGZyye+/+vFjVreIxnI75n9jObCRftMdXeTNzHAJsX8iACZrjQBRWhjclpdg+xrm7zcljyfWys18Pys99uanwWV6Rk3xsH+7wFnHbfKw4+Ds7QqA04Dzhl69kuq0iuQrGwLvG8=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO0P265MB6113.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:24e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 11:20:24 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 11:20:24 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <llvm@lists.linux.dev>
Subject: [PATCH] drm/imagination: Fixed clang warnings for initial upstreamed
 patches.
Date: Wed, 29 Nov 2023 11:20:14 +0000
Message-Id: <20231129112014.137407-1-donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0056.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::20) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|LO0P265MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: cda186df-7b76-4f1e-8d66-08dbf0cd2ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sd3MIoEIwq3LaPF4WiBM2aiKkqic/MQPNS79GtYROeADrO43HXHjnAv1mMoCxy9GV3FJiJDyvftgqOJ7KOJ+/CaCiTbwfMYEks5cCbLKqdF7LzT2ZCGJci4UsFcnLnsosWu9Cxy8b8+CFvyMyr1uxF1s/2z8FimB6UDY+G+aee03n0mFeGWjlKCFWUNmlVWYLv4CIXy16ywJfU2s0umzJG8M5zu1HBBK+RsWYFk06AWfkjEJ1H2ZPR3Tj/waRZ+Nk6XcmO4KycQ0NtLiLcP7G7HCKi7fybWsjmrLtRIIQ/qy+cjbGt9O8gK8iLNlssqQFiFdHO8g7eOSSW//yyAMVsuZmyqwVQdyfGsQKK+AvDs5/walEoWLmmg2tpoS3hJNKUYHP94DGuKfanwY/HWficdz2mzp55mNEV6/FPIxHFgKx2mxRlixbTJ2S8o11VdnNnC49GcX25Ek/+ztj8j0y8PGjBgWNcxB8Tz9bprsofs/LzUfWiVDqh8yB/6aQ9IeAQMN1N/t6joSfSXtHdk0pc6vZtDbP2TaM4EEOfxOD7GPSQ8d/MtCRkPFtcU0dcNUNLqq3XjixwApkoX4wEBdsWfuonQBkF1m4eO5I3h2WxT4s60wS5k0+mVV53zCLeGnYYGXsjiES/CgmL5B43ECOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39850400004)(136003)(366004)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(83380400001)(26005)(1076003)(2616005)(38350700005)(66476007)(66556008)(66946007)(7416002)(2906002)(4326008)(8676002)(8936002)(5660300002)(86362001)(44832011)(6506007)(6666004)(52116002)(6512007)(316002)(478600001)(41300700001)(966005)(6486002)(36756003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IUxjkFt0pkBYqiRRGQ7wNRGVlln8sCV5RfGncYUXzMKrvt4KbVEzPeSAexwg?=
 =?us-ascii?Q?/uHlkl19GHx1dkhTEPCdNukO0CipAJk6spJK+U9/rh2VnvPU9bIQGG+fm6I+?=
 =?us-ascii?Q?YS2ahhb4GzMYcGLOU+o7WKPKFn6MZHpFXvsjZcdaubvqxot6cAUdronptvMJ?=
 =?us-ascii?Q?374pBnyw45Vaf0Hs8M+7xI/9q9V+BZPo6IfEMDzSs+D/yV5x9Snl6vvgbs/F?=
 =?us-ascii?Q?xbDe1n9x0aQGAmQAX03Qf2C/o3s50+FgL5BPHNc1FOyDt1S010rbDVqnh7nt?=
 =?us-ascii?Q?U8i5h5qgmtI0cG7sb8pdTF8h/qQde6pCBTbfJ7C4eLT6odTrsBLKALBXwv/1?=
 =?us-ascii?Q?bAW0iydZC36CHbTgchFVNhfjC2M7Nii12fscBDDn5YAIlwcEWZJdYawHLLJ+?=
 =?us-ascii?Q?8M3loyHi/ZbVu1SpZdbbo7K9nXStZMM0tVpmgNqUZI0Lc3ZqcRsNOs86qTW6?=
 =?us-ascii?Q?hLmdkxt99KtiJZrZTV7E08V8pTPk+Lna9U4CJY/D3617lM6IIyJ6mK8sIovx?=
 =?us-ascii?Q?Aynok4Z5fy8BWubNzwNicWAnhJWaAMKpsgUDOEMQBB6SALnQUAWqAQlDmwtw?=
 =?us-ascii?Q?3G4pFOBtKORpHNTaH6JwqQGhlVrcwwoWzfDd8hbo8Sk7UvsvnYucKo3EP7Br?=
 =?us-ascii?Q?496FkHPMdVL4JiAgOc+QoHyIP7A2kjwFmzSFrF559a121VwmTwQPPjmkE85F?=
 =?us-ascii?Q?sDkrh4OXP+u4oDiWXAM4IhIFV3lD6cWzKLVNfdL529KiZ5FgFVqWG8apaZY5?=
 =?us-ascii?Q?d4MhbudZefAIjaMPhHv/I9Dd6joYHJwMRjoNvzmnxkSBVZUr5KOjWwYi7BEk?=
 =?us-ascii?Q?IqBo2HwdJxPIP/xF6pWXwZDHYfuhMZFqM6F3DpXUhM3cTdUT0vtDJi23bqlf?=
 =?us-ascii?Q?IsZV+j0Ldp9qj+HR9cbPQIoF27a6WhKFw94z10ztf4UmOkHxkraK6A4beY/9?=
 =?us-ascii?Q?U/dTJftHCCOhJGWbIdjmpq1CGhcBAXXjxYWl16lm3oceOT6ZYV/CTaGJJ8QY?=
 =?us-ascii?Q?aW2rfxIHqqiUMKyzR6/Y9olXzoQ60zedRMNsi3/JVBIMOdMUapLbIikTWSJ9?=
 =?us-ascii?Q?5b2YHDNvBxmAUh7k57uJ/aYU6aGHyEmpjSlVIPf4d9mcEtjyDcCBUFqPWd+X?=
 =?us-ascii?Q?qg56Vlhe8eeFqL+seHtQl/qYQqlNPKNnHpNcC9rEhI8nHFo6c9O9oh/Bweef?=
 =?us-ascii?Q?ibcv9qKmaEtJC4Rdd1MhWwmpiL7GkWA4qhE46oiL51Y+ZUah12X5A4gQU1xv?=
 =?us-ascii?Q?g/LuKAlBMOTGIToFpKv/1bGP7UZKUsFXiClZCbc4yhru9slvR8glPgVnvLrE?=
 =?us-ascii?Q?b7O683Xh/91JPnejHg4eEdxUM5kDmbtQ1GHCgDVdo+6q7MlAxWtoJNR2vxhI?=
 =?us-ascii?Q?8p2r/DtOT4SJZsE/sYdEhV+XvI4u/q3sWnq3gxleTT9aUNBZHWm+Ve5DYXKw?=
 =?us-ascii?Q?KkUHZQW06v04Zbz8GwYE4hi7rgk4UveXKTwsArLk83SaNkwTXLbVGloPKUSQ?=
 =?us-ascii?Q?7eFrUOruEBenNzfnMsF95qxJ0Igb1Ub29sr33mxe2fTn8RlHsu9oEDS9YuS7?=
 =?us-ascii?Q?hel5AwqOT01co5CY2TXv2lp9RL/Vz9Vod4Ir4r4VWsEfvJRuDHSMPDP5UPhi?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cda186df-7b76-4f1e-8d66-08dbf0cd2ea4
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 11:20:24.5902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7H3unJaClP0Bd5zBUEYuYoIvI56Z9Q3ns+eXiqScGhOOOdNmOuR+mOAzD9ejHQ1v5sY4XAPFjlIn3vfHxetf15lOp7yBKRkb1SWa4TQgh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6113
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 0IrFqjJtDUtC4c6ytEYp0JcMW6zxB19K
X-Proofpoint-GUID: 0IrFqjJtDUtC4c6ytEYp0JcMW6zxB19K
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
Cc: ndesaulniers@google.com, mripard@kernel.org, nathan@kernel.org,
 matt.coster@imgtec.com, donald.robson@imgtec.com, tzimmermann@suse.de,
 trix@redhat.com, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311242159.hh8MWiAm-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202311241752.3iLyyFcA-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202311250632.giVEx7MU-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202311250226.Da2yiSKp-lkp@intel.com/
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_device.c      | 2 +-
 drivers/gpu/drm/imagination/pvr_device_info.c | 3 ++-
 drivers/gpu/drm/imagination/pvr_fw_meta.c     | 1 +
 drivers/gpu/drm/imagination/pvr_vm.c          | 8 +-------
 4 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 8499becf4fbb..048eba776cf2 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -127,7 +127,7 @@ static int pvr_device_clk_init(struct pvr_device *pvr_dev)
  * This is called any time we receive a FW event. It iterates over all
  * active queues and calls pvr_queue_process() on them.
  */
-void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
+static void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
 {
 	struct pvr_queue *queue, *tmp_queue;
 	LIST_HEAD(active_queues);
diff --git a/drivers/gpu/drm/imagination/pvr_device_info.c b/drivers/gpu/drm/imagination/pvr_device_info.c
index 11e6bef52ecd..d3301cde7d11 100644
--- a/drivers/gpu/drm/imagination/pvr_device_info.c
+++ b/drivers/gpu/drm/imagination/pvr_device_info.c
@@ -227,7 +227,8 @@ int pvr_device_info_set_features(struct pvr_device *pvr_dev, const u64 *features
 	/* Verify no unsupported values in the bitmask. */
 	if (features_size > mapping_max_size) {
 		drm_warn(from_pvr_device(pvr_dev), "Unsupported features in firmware image");
-	} else if (features_size == mapping_max_size && (mapping_max & 63)) {
+	} else if (features_size == mapping_max_size &&
+		   ((mapping_max & 63) != 0)) {
 		u64 invalid_mask = ~0ull << (mapping_max & 63);
 
 		if (features[features_size - 1] & invalid_mask)
diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
index 119934c36184..c39beb70c317 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -4,6 +4,7 @@
 #include "pvr_device.h"
 #include "pvr_fw.h"
 #include "pvr_fw_info.h"
+#include "pvr_fw_meta.h"
 #include "pvr_gem.h"
 #include "pvr_rogue_cr_defs.h"
 #include "pvr_rogue_meta.h"
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 04f7d0cf4188..375a03707f4e 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -108,12 +108,6 @@ struct pvr_vm_gpuva {
 	struct drm_gpuva base;
 };
 
-static __always_inline
-struct pvr_vm_gpuva *to_pvr_vm_gpuva(struct drm_gpuva *gpuva)
-{
-	return container_of(gpuva, struct pvr_vm_gpuva, base);
-}
-
 enum pvr_vm_bind_type {
 	PVR_VM_BIND_TYPE_MAP,
 	PVR_VM_BIND_TYPE_UNMAP,
@@ -528,7 +522,7 @@ pvr_device_addr_and_size_are_valid(u64 device_addr, u64 size)
 	       (device_addr + size <= PVR_PAGE_TABLE_ADDR_SPACE_SIZE);
 }
 
-void pvr_gpuvm_free(struct drm_gpuvm *gpuvm)
+static void pvr_gpuvm_free(struct drm_gpuvm *gpuvm)
 {
 
 }
-- 
2.25.1

