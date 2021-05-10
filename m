Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78063379412
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B566E8AE;
	Mon, 10 May 2021 16:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3116E8AE;
 Mon, 10 May 2021 16:36:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+xg8caui8Crz2ivL5gOhWTG9t00NCa8E4nSBLhAMVVQtQz1gUM8bDNX34FZQMGpbvEmJ9e6Kzu1eGy2kH+kvaLphlJtFmGAATTfwf1XHzwT+1mXXFv7HXdWh7kIugHMVtNeLnm8IkbUJKHB+BPtA++tYddXpuKI4ydxO/V6c42wL44e7NVH1DLKyMMgGMFCOWJO09iCqCr8kiRnlxt0yCTYhfUlnFZP9atVehyl7QKSP/51TvRjKuPh8rGNiSh7elON2/ZmjTZErpCSkbb3g9mmj4W8t1sps0aNezYpWOXnxjaJ+24FLhmfDTbB5RMQm7Ox17ddUqbZuqGD4/fSGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oboIsoonZokR9RC85cS+UAEHnSUecYlSuUIK9niN/Q=;
 b=BvXZ+v401Q05JPrdxez6F6KVg8Krc8KiCeF0zGbEyCukM13j+v81Cal/GObF78pnMd1fszfwWT/3f3cP6prBfu+GV5aoFDpzFqebQ4z7CzfC6HETRRAbAiNiXcNK+Qy05xgelELOo/u0Mo4gL64gbHcGOeTCvnpwAXa1H+s4V+97+oYgmfSQ08UgL4fNgqgDeCOo2JvpyZQ1r+Au8GC2YiWsAAMGF02E+bcpeQGHStke5zftHZ41mcMdt8+/svZDiLJaU9N6EMQ2Z2iQ070BvnNOOcs1rVp2KIZh6qXYmZ9nX0PUQgIllRY1ikx3fHnSDnxukQ22FrxJbSAdkm4Nfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oboIsoonZokR9RC85cS+UAEHnSUecYlSuUIK9niN/Q=;
 b=b8/gzU70HVoSFImEN3sHSl9rVdmhr/Oxai2QJS7Rz8I8PVKVcErBVrobb2RcFx/k5pv5I2cA8NE8DvccdBiZ3MDWZRA/MCz2S99iUzcZx1PKoywARL6/95NUaOMFkIO4zkduxKpUAcKH5+2gleGpktUXXVVxyVRxisbjHa1Jor8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 16:36:51 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:36:51 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v6 05/16] drm/amdgpu: Add early fini callback
Date: Mon, 10 May 2021 12:36:14 -0400
Message-Id: <20210510163625.407105-6-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Mon, 10 May 2021 16:36:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37f87a4e-35a4-46df-89aa-08d913d1d00b
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44626FCD162A60065414ADDDEA549@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WaTr+1ZEA2JBI2VTaScNLDsxs8sJKNGLh4s1yS4e0G6o5Kye9/iprTQMn/6/caF7hqLyveOvhJOEnlxlB4fwUJz3xgF/baYexmq4KyrIG4vkL/d3CwJWJBPnqXdOxlMCflBA1d7aS7829PTf/T5yy57WhzhWaMcmjmjf9vWGxWLOZXcxzZ4DAoUAhSrtF/BsTXAGYQ8GnN/AlWMzku3F+9w3FpAFaXAOu0cz7ioQa2K9jUoX2mi17vR/nLElyO6K3kYym8Xp/p0vLtXwmX8pws0/NqyyhJzomffgDW2Hi3pZxdylA5jaO4FFC6awSFsoqtYmeXIXN15O5x8V88FwKqu7k1iR/5vbfd8nPmI49HJh9fyAW65AX8XdPjERN3fCyh1t7mzK7S/rtOJ5rkoyLkCYWzxDc89BFqgvYGd2BMBByObLgOoUyxihIErlaKPoJ8QiBUdefZ2m7VNuLRPOoQGk2Nm6stzIfFpDhTptxWChHqFcseIjj8NVEJdvjgb3zE4OtCkPRuy6eQJzyPKdExcI/AgKCJ/nvQ99lpdw9eEPvW17w4xn+/UNFflaz1aHpUwdrFGsH7LLDkJbk8WOSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(86362001)(6506007)(38100700002)(52116002)(6666004)(44832011)(8676002)(36756003)(5660300002)(478600001)(8936002)(2906002)(6486002)(66946007)(2616005)(66476007)(66556008)(1076003)(316002)(6636002)(6512007)(16526019)(186003)(83380400001)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2RXdW5czk8FR010tgBz0mSaRPXtKiR5KD+aZ1B84vjpgEkLGYKJB/Eg4rscW?=
 =?us-ascii?Q?XGgoVSx++Lw2b948CIpPJ9yL9AyJ2qBHB7PQ2VuX64Nq+jtoDJFHdmBu+wN3?=
 =?us-ascii?Q?BRTze/nEG/ASBa6ADzhB+Ji/iWA60yuZPTXDVTZUQi0fbG5ErJeRVQGvCgit?=
 =?us-ascii?Q?I91mitc21D0IgmT5SWtVyjWd2usw10wO09DvkHvRY6IAWFMqd7irxHcpWFZr?=
 =?us-ascii?Q?ieDhFwgFoFxOxLCU3qJPWSd1tRBI/zwCbS5DHJvju6+IqQ+RNbjOlp/2aHCY?=
 =?us-ascii?Q?WiBwlJ3gPQGxTxoNckcs80qn1v10avYRgqr5ru0nN4nVrd7b6APXwOn+MSO9?=
 =?us-ascii?Q?aigCYOXR6S7uR+cqV4Mq9PmF0FajNPaoIaI3KxynrnLgjg9wr0bRqbQZB9ra?=
 =?us-ascii?Q?G9fVvfXhlYA6QnyD7ash5QwmBbURI2EKWZcoaEexKT8xeJ6K1vm+KnrgAEgV?=
 =?us-ascii?Q?7ncqXDG27qN5dkEB6ODosZSlqEzUTOk/PKRlf70AsHY47BBaUQQbyfMw5WeG?=
 =?us-ascii?Q?v6ZQsoWbpxIyVJ/Bxa2jx2/1EmVfGbzcYGELYzU1Z7kvr09BL7vqf4Fqb4cp?=
 =?us-ascii?Q?EyMOBUM6lCCrqYeATWHqbYThFNSDLodwzLmCcRKfXrn7mgh2GdDTIpKqxjNo?=
 =?us-ascii?Q?EFgnpCcCq+fTlIcGKP6f8EU49H4cnl0EaFg58s9wU+rGs21WJc/VVHoH9Jby?=
 =?us-ascii?Q?xE0K1x5O9Um1rE6dOeNbnPhUrspCDyaonJ9n9XGATu+J+f8bZE8s5puAUyoJ?=
 =?us-ascii?Q?mFLyip6c7iG0MJPYC7W1Pf2gEloQtm8x0b3PMtQeqakJu6eHQUWCddLG9uiC?=
 =?us-ascii?Q?lOPVe/+RMQGMY+NrlSL9apu4k1zDglc0YzBM3387y7hJLYAeBMYk7E4pZUD3?=
 =?us-ascii?Q?j/npVLQ+RcBwouDDmGBnolUaJxDBQpp05OlcEI81BrQ49UexN528OYVGEnlh?=
 =?us-ascii?Q?/nkMqyajNroGE+qX98JFzLqS3ApVlgINwzW6Mq1WLouwLFYj9oz6gzIe8V7G?=
 =?us-ascii?Q?8oTSClXdHIRAxKKgal600dmZL88/wdyod3grrR1cVpodSkeo4rrfI3nMau8c?=
 =?us-ascii?Q?kJGjiuJRBHfhiVyfMwbckI/Pg4sQAb6GJif4syQ0WLOq8TbNgVThNg/gVmmR?=
 =?us-ascii?Q?WhUPC8KKgchgdsNa1A5eog5ciCbWMXiUFoF+N8yrVAUMapoxP5wI/GEWhsFU?=
 =?us-ascii?Q?HrqrTwIhy4k/nF/mcbHtiYuDODNKnRL7gJ3EJzLk5Oae+NOOucdHnRCPLxZS?=
 =?us-ascii?Q?/xHwpxKm6q1rsCRK24EcDKNQyEuWOzNSBtHu4zhiILQa2HTjCpnAUhglPcrq?=
 =?us-ascii?Q?7aW//OeVLqzwihb4kPEKRsVldaPvegU8y9GQNjjNi7H7E0PGRc5kfJkJOciZ?=
 =?us-ascii?Q?hYVQoDK07n8p89KOJVAT9z9cVBeP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f87a4e-35a4-46df-89aa-08d913d1d00b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:36:51.0554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dp2eCxzcItBtix8hiXvxoyOAK/N7OfIXYfk5jVA7hoomdxMGuceiCrB1kFnPSjIk2VAMi6hwHSNXnt7dcL8vbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use it to call disply code dependent on device->drv_data
before it's set to NULL on device unplug

v5: Move HW finilization into this callback to prevent MMIO accesses
    post cpi remove.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 59 +++++++++++++------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 +++-
 drivers/gpu/drm/amd/include/amd_shared.h      |  2 +
 3 files changed, 52 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 3760ce7d8ff8..18598eda18f6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2558,34 +2558,26 @@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
 	return 0;
 }
 
-/**
- * amdgpu_device_ip_fini - run fini for hardware IPs
- *
- * @adev: amdgpu_device pointer
- *
- * Main teardown pass for hardware IPs.  The list of all the hardware
- * IPs that make up the asic is walked and the hw_fini and sw_fini callbacks
- * are run.  hw_fini tears down the hardware associated with each IP
- * and sw_fini tears down any software state associated with each IP.
- * Returns 0 on success, negative error code on failure.
- */
-static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
+static int amdgpu_device_ip_fini_early(struct amdgpu_device *adev)
 {
 	int i, r;
 
-	if (amdgpu_sriov_vf(adev) && adev->virt.ras_init_done)
-		amdgpu_virt_release_ras_err_handler_data(adev);
+	for (i = 0; i < adev->num_ip_blocks; i++) {
+		if (!adev->ip_blocks[i].version->funcs->early_fini)
+			continue;
 
-	amdgpu_ras_pre_fini(adev);
+		r = adev->ip_blocks[i].version->funcs->early_fini((void *)adev);
+		if (r) {
+			DRM_DEBUG("early_fini of IP block <%s> failed %d\n",
+				  adev->ip_blocks[i].version->funcs->name, r);
+		}
+	}
 
-	if (adev->gmc.xgmi.num_physical_nodes > 1)
-		amdgpu_xgmi_remove_device(adev);
+	amdgpu_amdkfd_suspend(adev, false);
 
 	amdgpu_device_set_pg_state(adev, AMD_PG_STATE_UNGATE);
 	amdgpu_device_set_cg_state(adev, AMD_CG_STATE_UNGATE);
 
-	amdgpu_amdkfd_device_fini(adev);
-
 	/* need to disable SMC first */
 	for (i = 0; i < adev->num_ip_blocks; i++) {
 		if (!adev->ip_blocks[i].status.hw)
@@ -2616,6 +2608,33 @@ static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
 		adev->ip_blocks[i].status.hw = false;
 	}
 
+	return 0;
+}
+
+/**
+ * amdgpu_device_ip_fini - run fini for hardware IPs
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Main teardown pass for hardware IPs.  The list of all the hardware
+ * IPs that make up the asic is walked and the hw_fini and sw_fini callbacks
+ * are run.  hw_fini tears down the hardware associated with each IP
+ * and sw_fini tears down any software state associated with each IP.
+ * Returns 0 on success, negative error code on failure.
+ */
+static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
+{
+	int i, r;
+
+	if (amdgpu_sriov_vf(adev) && adev->virt.ras_init_done)
+		amdgpu_virt_release_ras_err_handler_data(adev);
+
+	amdgpu_ras_pre_fini(adev);
+
+	if (adev->gmc.xgmi.num_physical_nodes > 1)
+		amdgpu_xgmi_remove_device(adev);
+
+	amdgpu_amdkfd_device_fini_sw(adev);
 
 	for (i = adev->num_ip_blocks - 1; i >= 0; i--) {
 		if (!adev->ip_blocks[i].status.sw)
@@ -3683,6 +3702,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 	amdgpu_fbdev_fini(adev);
 
 	amdgpu_irq_fini_hw(adev);
+
+	amdgpu_device_ip_fini_early(adev);
 }
 
 void amdgpu_device_fini_sw(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 296704ce3768..6c2c6a51ce6c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1251,6 +1251,15 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 	return -EINVAL;
 }
 
+static int amdgpu_dm_early_fini(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	amdgpu_dm_audio_fini(adev);
+
+	return 0;
+}
+
 static void amdgpu_dm_fini(struct amdgpu_device *adev)
 {
 	int i;
@@ -1259,8 +1268,6 @@ static void amdgpu_dm_fini(struct amdgpu_device *adev)
 		drm_encoder_cleanup(&adev->dm.mst_encoders[i].base);
 	}
 
-	amdgpu_dm_audio_fini(adev);
-
 	amdgpu_dm_destroy_drm_device(&adev->dm);
 
 #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
@@ -2298,6 +2305,7 @@ static const struct amd_ip_funcs amdgpu_dm_funcs = {
 	.late_init = dm_late_init,
 	.sw_init = dm_sw_init,
 	.sw_fini = dm_sw_fini,
+	.early_fini = amdgpu_dm_early_fini,
 	.hw_init = dm_hw_init,
 	.hw_fini = dm_hw_fini,
 	.suspend = dm_suspend,
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 43ed6291b2b8..1ad56da486e4 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -240,6 +240,7 @@ enum amd_dpm_forced_level;
  * @late_init: sets up late driver/hw state (post hw_init) - Optional
  * @sw_init: sets up driver state, does not configure hw
  * @sw_fini: tears down driver state, does not configure hw
+ * @early_fini: tears down stuff before dev detached from driver
  * @hw_init: sets up the hw state
  * @hw_fini: tears down the hw state
  * @late_fini: final cleanup
@@ -268,6 +269,7 @@ struct amd_ip_funcs {
 	int (*late_init)(void *handle);
 	int (*sw_init)(void *handle);
 	int (*sw_fini)(void *handle);
+	int (*early_fini)(void *handle);
 	int (*hw_init)(void *handle);
 	int (*hw_fini)(void *handle);
 	void (*late_fini)(void *handle);
-- 
2.25.1

