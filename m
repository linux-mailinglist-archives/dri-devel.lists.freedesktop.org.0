Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FCF37BFFA
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 16:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B996E529;
	Wed, 12 May 2021 14:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2081.outbound.protection.outlook.com [40.107.102.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1226E079;
 Wed, 12 May 2021 14:27:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qwf5r8AfWrRbfO0kWP9Z3w8tP55sHFPhLqGDcbohMp+jzONLHzbCS9jBtPViP5BZgtzyKMFh936Qr2TEGpcxhm8/W/wOqk2i/PA6U19R8vERL8JKCNwXA1QiHanTQ2IWeky972pD+i4i8cjzIuoQxhgX6Z7yAozQ3jzjJUeT+Hrbg/WFsKRacWUW4IxhtPZJnzXxeBpkO6XVGR2tY33gxCj0oS9jXyhll/SgV/TolY8/AXXXMnHpcIjCeWC3/U8nUQr7BguWSeK3dO/Ztnkx/5bJLvq/FRHqRwfZzwnIUGj1VW44SJkxVagD9DH1PBZghspawgcrdUAfrypdIAcq8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4f76bDjmlOpO1JyP2h+5eU+QH8A/4mNsiKFTRoZXVXM=;
 b=L0HTceAVIYPoSOgcP0SamgoUazIyguYMCkCC2mpBgTmejK7ankvtEE035z8fFBy892Cfe1CSMwHZdk7m7Ff1yb1Av0s449et6RFzANLGYEgjrHkO3OhNagyL2wRXRp0EddC+Ho04BgOhpA9h8rx/sPuNFQIr6uasAA9O3H14scpRqu0ritQIG0DRorDWP1q1E+Yat9DhaydHa46u4Yam024VYt4lUkUzPQUDHqxWU+oHY5E3mTD3UHVDlPOuVd+JfW3wByw2cvX+DGvbGkSoUA3B+uPmlsII0edKZ0ZAjwxV2RRKlcZAcW+sewi4D/7gg54SePjXT3/YGa9ct2uQcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4f76bDjmlOpO1JyP2h+5eU+QH8A/4mNsiKFTRoZXVXM=;
 b=1hkQt4g3bDxNe3an6O7ZbvX4PCX8YOw7/a/4xupN0RkJ4KXfNxS3duWx1pP3BAm6BVbZa59uPViFrglbn5rTqRdC6djZJ6wTawo6smnUa7+GOciuKDktw4ap63JuTc+VIQodbixvzQUgfPnztPPf1DtJgVz6BvP9ziTJNUZdzP8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4576.namprd12.prod.outlook.com (2603:10b6:806:93::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Wed, 12 May
 2021 14:27:15 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 14:27:15 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v7 04/16] drm/amdgpu: Add early fini callback
Date: Wed, 12 May 2021 10:26:36 -0400
Message-Id: <20210512142648.666476-5-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:7576:4f76:97d8:1487]
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7576:4f76:97d8:1487) by
 YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Wed, 12 May 2021 14:27:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9392f4b3-d6d9-4062-2df4-08d915520a42
X-MS-TrafficTypeDiagnostic: SA0PR12MB4576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4576891F974AADAB30BADABEEA529@SA0PR12MB4576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UFHUdEwcyTwLchxUswSHmi1j6WFGVrMRTJi4PnqCwCNZLAgRZl+JbFPbLhoeX2crB47CQgIaYHThMZrTjg1kyyv3gNSkC3MydPKkELX4pm1KsVYUNlNyZwUUU0DIPImE8ulpkfOsr7vAtLQ4uVTS9/l7PXXvloFuX15RTVSZD5URfAfPNwzscvttYRcs2E1wX7ILqUByPyRLJXwcVFlYwWZEfUvALbWmmjce+5nskBV5V9/RhUtppQG6rrgB7QxfZfH3aVzm/EeWRAeQFwHUiyposg3FQ4YaYsYXxd3yP43nzjWOzLQExIjWPQk8ABqy7U/8yh8Zp5YAJwWTbGijeLl1ZjSOFC0BNfgOrfxjIiKSPbdcKR4BpRhRfG9zLyQGEmMWhVPZ08bBwsNNawg0iqlSMLrQ70o/k/tPwkO4D5HJ2zZHzGts/xwZBdV3WBEiw9/AoSC8r8zNL8utBZmyTWBxlO3jmVgttKiAu11V/3eulXUhMZBLmloqOMgzPSKQ9bJI+3WDssyprQ9exGgylvQUmHWS6aAh0W5j8K8L0BeacsDlz6WscYGFl0r8h4yNBwID2oTWgSjhpWTJiQjayw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(66574015)(38100700002)(5660300002)(1076003)(6666004)(186003)(316002)(16526019)(8676002)(83380400001)(66476007)(2906002)(6636002)(86362001)(52116002)(36756003)(54906003)(2616005)(66946007)(66556008)(8936002)(6512007)(6506007)(44832011)(478600001)(4326008)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aWptWnhudDAveGY2ejZzUmt1WW5vR3IyQ0JUcnZNSmd2OHhEbDlJdkwxMTVj?=
 =?utf-8?B?cGd0ejZyQmI3cjg3bk5Tb3lSV3NQNGp0bDgwclpCMUYrSmVuamIweDc2VjRw?=
 =?utf-8?B?RndZZ0grK2pUZnlTczdmcjNmbGFrSml5N1dybVp1TXRIbjhhQXBKU0k5WGVv?=
 =?utf-8?B?OEFjSHBZMHFPZUtkcWg0N1RqVThCdWlkQ3l1cnArODdzd2hQUjlhc3VPZ1BD?=
 =?utf-8?B?emdVY1N5a0llaGptT0cyckNKZ081d3QweFFiUWpWVkN0VlYyTDVtSnQzeWha?=
 =?utf-8?B?NUpsWTRGYXBZY1p2MldiT1p6N2JRRWdZV1VFcVk2WGpYbFZmZUdSRTkrOG5M?=
 =?utf-8?B?ekwyZnNtVXhWaGxwYy9JbEh3U052dU12NDBOcGlxcU1rcm5MU1pMZ0VGNGJw?=
 =?utf-8?B?ODRuVDE1RGprNmlkSFJTMTRzK1J0K3FXUGJqNE15Si9VVUsydExKbVhJTnRy?=
 =?utf-8?B?bXduWEF1OGlRZGdCQXcvQkloYnpXcWZWQTg5R0JoUHJpbFUyT0JUMXpLQ3dZ?=
 =?utf-8?B?b2VmeVl2YUR6RlVnaG5tbHh4Ti9Edlp5ODdtSEhzVVRjbC9XdHBNSmVuRndK?=
 =?utf-8?B?UWg4MW5kdXMxdXQybm8vZC9PaWZ6bUVBeFA4NUY0NGVKc054eHlxQlpOa1d5?=
 =?utf-8?B?a3ZwSTV4OFJOc3FrUi9IcncyOVJON3BYTmIxckNLQ09EYjVzeldGbVRKNUZ3?=
 =?utf-8?B?ZU9SQkV2QUFCaW5HQzdRVUtaanhZNTVrY1QzOGhzMDhZUE9YZFBtRFdZQ0hH?=
 =?utf-8?B?aDlsejRjU0FhN0VoVXV3c3N0OXlHK2JjU1Z3cmtybmZyRkUySEpaY0VlYmlE?=
 =?utf-8?B?bndZSk5UaEhRSkhZamZIa2pkdjBHVDAwd2oxKy96RTM3UzRNYjhJOWJFVDBj?=
 =?utf-8?B?RnVNMCtoR3hQMVBWdlhLNmR3ZDVsMDYzMTd0SG52ZlI5MkpVWS9lRkpia2xN?=
 =?utf-8?B?RXNvRFpOdysrdTZ0VkF3c0p4cFllcmVzUW5XMTN4Ky9SaUUwdzFQaGVRN3p0?=
 =?utf-8?B?ZHcvYXpoTk5ZeVc4d0FQbGE4Rzd6VkhvZ21yMVdIbjhPS09pbmt4M20yNUFD?=
 =?utf-8?B?N0FEQzM0QndYQ3AxN1Z1QzV0cVdIcm5QMnM0Q3VNSEhlY0M2SjZ3WmxnQThG?=
 =?utf-8?B?YmVFQXlXTXRmWUZUMk10a3E0VmwzRW5Qc0RKaHYvS3gyMUl6WVFHSzFoSkw3?=
 =?utf-8?B?OTNDWEo5OWV0Ym1lOWNSc0h6d0Vkc2szZEtWS05BaDJWdWZZNEt2K2x1VjdD?=
 =?utf-8?B?VE0xNDhYdEwzMUkyZHZNSXR1cmdlWmVCUUw0cCtSK3VBN1ZIL3UxYlNiSEU2?=
 =?utf-8?B?N2h1SXZlOEZSU0RJcUVERUxuZGRLZGI2TG5NVlp6UUdEQ3RubmZsTFlKa1dp?=
 =?utf-8?B?ZW5KdzhrSnBISjZlUVg2WHQrRVRoamY5TTRzWGozM2JJbFB0Z1lYRDVRRTNn?=
 =?utf-8?B?eW9qMFdJZ09BT2FGaGZpdURqYmIybTl1dVphU29uWHMzYmc4dk4waGlBcU12?=
 =?utf-8?B?WnI1UUpuMjF1VnFBTWswYnZCUDRyRDFEL0pQVTNqaFpUQWFXWk02UnZvSlN6?=
 =?utf-8?B?N3NYckY1OXlHeS9WS0tTVDZlMUg2dVRQWGZkR01ZZ2FiV2sxRE1kRno3Ris2?=
 =?utf-8?B?OHBaTDdOYWV4Y0hYci93dDBlRzBSZFF2U3NIeURuenI2OTZkRmJ4cnAxWGQ3?=
 =?utf-8?B?QnZRZ3luYlpZaGVoL1NpMjRWVG9nRjI0b1VxMVZMQTZyK2JMdnZSYVlZZnVO?=
 =?utf-8?B?TFkxYUpYaS81U3FDM0hjR0p2V05ESWhuQ1Y5L3RPbTBYY1lVSFhkWTRoaUkw?=
 =?utf-8?B?ZEloSmcwSGViNE9YSGwwZjF5NnBvRzJqeTNrZUZ3NU5HU2lIbllxMmFMVi9Q?=
 =?utf-8?B?a1RtRndlZVRJT2RtVkw3TndPcUtFWmhURHhzL3NBZnAzTHc9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9392f4b3-d6d9-4062-2df4-08d915520a42
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 14:27:15.4885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: liFYfae1W6+s8/aIwfxYDzjFQSW5hCvgMd17cUKymWclMlydyqDz4/6rAhmhL9ZeOwG8Q1tLnq/uByJjuLgvNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4576
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
 Alexander.Deucher@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use it to call disply code dependent on device->drv_data
before it's set to NULL on device unplug

v5: Move HW finilization into this callback to prevent MMIO accesses
    post cpi remove.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
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

