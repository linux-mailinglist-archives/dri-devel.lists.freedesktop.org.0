Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E00249441
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 07:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BB289B12;
	Wed, 19 Aug 2020 05:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700087.outbound.protection.outlook.com [40.107.70.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4845B89B18;
 Wed, 19 Aug 2020 05:01:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJvwUpQ4d0OFZN1XBwJ8xMoqNoJwm1q7zpqLdnIpidRGdITpM6wVw32GeM8F2EUWuKZsxIZgrZhcl88s1LjFVT6acR6L9N0MOxKK3PqH3PAH2FJjKmlBqXcYn3ojc6qCut92GD8GY58YEaNbiYeW99VbxUGcEnc1vimQrrMdXKyUdnqzB20fKSUUwf2VOozdGOCnuTQ/J7ii4fvKx5Fg9LmgzhbLwmhN8sSwLN2zcHDlaR+k8w0FKGYFx0kGPsJPT520RK6mRG6cdd6Vhz9FGaQwM2UOWwvfwbaMDOXuUEYdmo/S45skkPBUW9wqL0YgY8FZfEpPAH7A5wK57Kch7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOtVYHQ+IwAD0+sK2JkU+3v07JnhsAAbvemtZnsLWzE=;
 b=is5xRaWr2t9rW+6xl7J32U9ovZnG8xidlrITTUsDaaMEchuIojQ3dBVDtu6tv/UdF5RaD2wIPU9roqp03fAg2GH/8wTJtN77UfJm2/wFcdih5JLCo8W0iitGORk1UuKp24jkX+2SRoggy0K4hRypB7VNyDWM5JlQmCcOMMAl99BwiTJHrlpTVttttsup0bO+NMxM4lz2Mg+4Fvu2bMBEnODlgMGYvstqoKETuvegkA06RZuRWUoghJX2KFCcWPW3NfQuRCdS0gTrkktzLnKxlNSZvl3XQ/lfWM0oAaA71Kwldap/Pfu9Oe/EPcS+DWp6I29kbOrln/7btXYiviZ3ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOtVYHQ+IwAD0+sK2JkU+3v07JnhsAAbvemtZnsLWzE=;
 b=R3GMbZFYG6IQ6h2L3m35aU0QflReXdETC82wBgpFFMXUTMgAHWJQd38AC4U+VxMr564b1QaRQYSgd37QlvNe0IBmzLIFySWYilhOgg0zB6uylr83jmxkNCRjbSqMKeM+ilPKHXZEZafExsztU6hU47Y1qegBGW4+GrdmAHWgTzw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB2618.namprd12.prod.outlook.com (2603:10b6:5:49::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Wed, 19 Aug
 2020 05:00:59 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 05:00:59 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amdgpu: Embed drm_device into amdgpu_device (v2)
Date: Wed, 19 Aug 2020 01:00:42 -0400
Message-Id: <20200819050042.7370-4-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.28.0.215.g878e727637
In-Reply-To: <20200819050042.7370-1-luben.tuikov@amd.com>
References: <20200819050042.7370-1-luben.tuikov@amd.com>
X-ClientProxiedBy: YT1PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::29)
 To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 YT1PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Wed, 19 Aug 2020 05:00:59 +0000
X-Mailer: git-send-email 2.28.0.215.g878e727637
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1a8ddffc-a655-4c79-dc6b-08d843fcdd2b
X-MS-TrafficTypeDiagnostic: DM6PR12MB2618:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB261890DDEDEF46DD1B05DDF4995D0@DM6PR12MB2618.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zKboyuUcVcRFu38K1j2eeWh8wuF267jh4hGRpiSWoYRaTufDxuzgbNtkm78hDADyvsQ7fr0oOYT+2K1h1edmz7Lws5tmch0TPhN/FkHVCGTQjKy9o+9OJWSV1FnrIEg8bgM/7Bz/BGFUESCAs5Xuett5bR+bQk+E9dvbqBI/YD1MwGhVQGuy2dduC2dmjJ37RtgHudV5p7GGqT5+O3FdK4s/e+bi2drp/6qvhvy5WQuBq5kh26Kg8uhaH/vPymV7NefNDLNQXKrkkSsRgz9ypKfxWwp9t3YEXXQSucqXNeMH75yDUEuwUGl5DbUEIYxZaZ+sqPEKDYkcGl1HW2arAUvfdVa4PD0U0DiLcslsFsvn4tIvDqInGyKnE3SUJDyY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(26005)(110011004)(83380400001)(16576012)(316002)(2906002)(4326008)(36756003)(54906003)(8676002)(1076003)(478600001)(186003)(66556008)(66476007)(6486002)(44832011)(66946007)(5660300002)(52116002)(6666004)(8936002)(86362001)(956004)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: MOYhn+RBYr9aumSBUaSomKX8KG7/qjYpQyVjbPlQ+DR7mTnTASrsyhgLDhKsIoro84azbJasd0I132ffc6Dg4iRCas1Jeg95rFeZbkxrhKyvKMJZKj5gRjUDEL6ywnA/JWtdnOLdr6++RCiAJTbjU817C573F/KLD0UcZw4Rg2bYb8s9TiyU6si+oYx0EuyCj8ZyD3kDbfzKhM6RymusidQjEiRof/zN4BfMjQY+lVOMQw5AbJ8AEXJVvSaHztjNRolL33EBF1K6EnnREgiyk81+P8ytGZu0BSOLKf7Xi6/XevEE1zxLM1IPxXHfTeLdNQ1AQGmtrEA3eegAqJY7w/rrC1o3RAacdzn0wz++SCWJruffHM/hpI3BMFM9f32AEJ1xPtuE2Ef6ni/A7vFwP6CNAjy5yy9sB7G1hgmsaLZUTIe85+tpYoi2yGrvjuodp+OEfOWY9RhkJyLOwYuaHorwYyo71s0+TG/GtmLB1phsDo2esPxidxxYd36gMNDb7PLdTFMLzQ2Pb7CU3NRpQFYL/w8HX+hz0jIewSWKMmZQxWqi/SiaSZyNpqJ7G/Cz775la76ck2avoDrJuPDESPc792w7y1wX0azIWMSc1RkGxdFNZf2hj1ARHxjQ7ItmfOiFsMnP5cDWoNN/WJwjXQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8ddffc-a655-4c79-dc6b-08d843fcdd2b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 05:00:59.5773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEJ91C0tlxzGpDJnITpxg3CnyfUWbpg3Z+88qdelwEKPsjm8LLdrJchO95jWPtxX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2618
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

a) Embed struct drm_device into struct amdgpu_device.
b) Modify the inline-f drm_to_adev() accordingly.
c) Modify the inline-f adev_to_drm() accordingly.
d) Eliminate the use of drm_device.dev_private,
   in amdgpu.
e) Switch from using drm_dev_alloc() to
   drm_dev_init().
f) Add a DRM driver release function, which frees
   the container amdgpu_device after all krefs on
   the contained drm_device have been released.

v2: Split out adding adev_to_drm() into its own
    patch (previous commit), making this patch
    more succinct and clear. More detailed commit
    description.

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 10 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 15 +++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 43 ++++++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 20 +++-------
 4 files changed, 43 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 735480cc7dcf..107a6ec920f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -724,8 +724,8 @@ struct amd_powerplay {
 #define AMDGPU_MAX_DF_PERFMONS 4
 struct amdgpu_device {
 	struct device			*dev;
-	struct drm_device		*ddev;
 	struct pci_dev			*pdev;
+	struct drm_device		ddev;
 
 #ifdef CONFIG_DRM_AMD_ACP
 	struct amdgpu_acp		acp;
@@ -990,12 +990,12 @@ struct amdgpu_device {
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
 {
-	return ddev->dev_private;
+	return container_of(ddev, struct amdgpu_device, ddev);
 }
 
 static inline struct drm_device *adev_to_drm(struct amdgpu_device *adev)
 {
-	return adev->ddev;
+	return &adev->ddev;
 }
 
 static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
@@ -1004,8 +1004,6 @@ static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
 }
 
 int amdgpu_device_init(struct amdgpu_device *adev,
-		       struct drm_device *ddev,
-		       struct pci_dev *pdev,
 		       uint32_t flags);
 void amdgpu_device_fini(struct amdgpu_device *adev);
 int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);
@@ -1195,7 +1193,7 @@ static inline void *amdgpu_atpx_get_dhandle(void) { return NULL; }
 extern const struct drm_ioctl_desc amdgpu_ioctls_kms[];
 extern const int amdgpu_max_kms_ioctl;
 
-int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags);
+int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags);
 void amdgpu_driver_unload_kms(struct drm_device *dev);
 void amdgpu_driver_lastclose_kms(struct drm_device *dev);
 int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 07012d71eeea..6e529548e708 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1216,7 +1216,8 @@ static int amdgpu_device_check_arguments(struct amdgpu_device *adev)
  * Callback for the switcheroo driver.  Suspends or resumes the
  * the asics before or after it is powered up using ACPI methods.
  */
-static void amdgpu_switcheroo_set_state(struct pci_dev *pdev, enum vga_switcheroo_state state)
+static void amdgpu_switcheroo_set_state(struct pci_dev *pdev,
+					enum vga_switcheroo_state state)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 	int r;
@@ -2977,8 +2978,6 @@ static const struct attribute *amdgpu_dev_attributes[] = {
  * amdgpu_device_init - initialize the driver
  *
  * @adev: amdgpu_device pointer
- * @ddev: drm dev pointer
- * @pdev: pci dev pointer
  * @flags: driver flags
  *
  * Initializes the driver info and hw (all asics).
@@ -2986,18 +2985,15 @@ static const struct attribute *amdgpu_dev_attributes[] = {
  * Called at driver startup.
  */
 int amdgpu_device_init(struct amdgpu_device *adev,
-		       struct drm_device *ddev,
-		       struct pci_dev *pdev,
 		       uint32_t flags)
 {
+	struct drm_device *ddev = adev_to_drm(adev);
+	struct pci_dev *pdev = adev->pdev;
 	int r, i;
 	bool boco = false;
 	u32 max_MBps;
 
 	adev->shutdown = false;
-	adev->dev = &pdev->dev;
-	adev->ddev = ddev;
-	adev->pdev = pdev;
 	adev->flags = flags;
 
 	if (amdgpu_force_asic_type >= 0 && amdgpu_force_asic_type < CHIP_LAST)
@@ -3451,9 +3447,8 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
 	struct drm_connector_list_iter iter;
 	int r;
 
-	if (dev == NULL || dev->dev_private == NULL) {
+	if (!dev)
 		return -ENODEV;
-	}
 
 	adev = drm_to_adev(dev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 38023c879db1..6866c515f00a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1082,7 +1082,7 @@ static struct drm_driver kms_driver;
 static int amdgpu_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *ent)
 {
-	struct drm_device *dev;
+	struct drm_device *ddev;
 	struct amdgpu_device *adev;
 	unsigned long flags = ent->driver_data;
 	int ret, retry = 0;
@@ -1138,36 +1138,42 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	dev = drm_dev_alloc(&kms_driver, &pdev->dev);
-	if (IS_ERR(dev))
-		return PTR_ERR(dev);
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return -ENOMEM;
+
+	adev->dev  = &pdev->dev;
+	adev->pdev = pdev;
+	ddev = adev_to_drm(adev);
+	ret = drm_dev_init(ddev, &kms_driver, &pdev->dev);
+	if (ret)
+		goto err_free;
 
 	if (!supports_atomic)
-		dev->driver_features &= ~DRIVER_ATOMIC;
+		ddev->driver_features &= ~DRIVER_ATOMIC;
 
 	ret = pci_enable_device(pdev);
 	if (ret)
 		goto err_free;
 
-	dev->pdev = pdev;
+	ddev->pdev = pdev;
+	pci_set_drvdata(pdev, ddev);
 
-	pci_set_drvdata(pdev, dev);
-
-	ret = amdgpu_driver_load_kms(dev, ent->driver_data);
+	ret = amdgpu_driver_load_kms(adev, ent->driver_data);
 	if (ret)
 		goto err_pci;
 
 retry_init:
-	ret = drm_dev_register(dev, ent->driver_data);
+	ret = drm_dev_register(ddev, ent->driver_data);
 	if (ret == -EAGAIN && ++retry <= 3) {
 		DRM_INFO("retry init %d\n", retry);
 		/* Don't request EX mode too frequently which is attacking */
 		msleep(5000);
 		goto retry_init;
-	} else if (ret)
+	} else if (ret) {
 		goto err_pci;
+	}
 
-	adev = drm_to_adev(dev);
 	ret = amdgpu_debugfs_init(adev);
 	if (ret)
 		DRM_ERROR("Creating debugfs files failed (%d).\n", ret);
@@ -1177,7 +1183,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 err_pci:
 	pci_disable_device(pdev);
 err_free:
-	drm_dev_put(dev);
+	drm_dev_put(ddev);
 	return ret;
 }
 
@@ -1197,6 +1203,14 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 	drm_dev_put(dev);
 }
 
+static void amdgpu_driver_release(struct drm_device *ddev)
+{
+	struct amdgpu_device *adev = drm_to_adev(ddev);
+
+	drm_dev_fini(ddev);
+	kfree(adev);
+}
+
 static void
 amdgpu_pci_shutdown(struct pci_dev *pdev)
 {
@@ -1491,6 +1505,7 @@ static struct drm_driver kms_driver = {
 	.open = amdgpu_driver_open_kms,
 	.postclose = amdgpu_driver_postclose_kms,
 	.lastclose = amdgpu_driver_lastclose_kms,
+	.release   = amdgpu_driver_release,
 	.irq_handler = amdgpu_irq_handler,
 	.ioctls = amdgpu_ioctls_kms,
 	.gem_free_object_unlocked = amdgpu_gem_object_free,
@@ -1525,8 +1540,6 @@ static struct pci_driver amdgpu_kms_pci_driver = {
 	.driver.pm = &amdgpu_pm_ops,
 };
 
-
-
 static int __init amdgpu_init(void)
 {
 	int r;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 47cd3558f9c7..f2a4fdcd542d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -86,7 +86,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
 	amdgpu_unregister_gpu_instance(adev);
 
 	if (adev->rmmio == NULL)
-		goto done_free;
+		return;
 
 	if (adev->runpm) {
 		pm_runtime_get_sync(dev->dev);
@@ -96,10 +96,6 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
 	amdgpu_acpi_fini(adev);
 
 	amdgpu_device_fini(adev);
-
-done_free:
-	kfree(adev);
-	dev->dev_private = NULL;
 }
 
 void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
@@ -130,22 +126,18 @@ void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
 /**
  * amdgpu_driver_load_kms - Main load function for KMS.
  *
- * @dev: drm dev pointer
+ * @adev: pointer to struct amdgpu_device
  * @flags: device flags
  *
  * This is the main load function for KMS (all asics).
  * Returns 0 on success, error on failure.
  */
-int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
+int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags)
 {
-	struct amdgpu_device *adev;
+	struct drm_device *dev;
 	int r, acpi_status;
 
-	adev = kzalloc(sizeof(struct amdgpu_device), GFP_KERNEL);
-	if (adev == NULL) {
-		return -ENOMEM;
-	}
-	dev->dev_private = (void *)adev;
+	dev = adev_to_drm(adev);
 
 	if (amdgpu_has_atpx() &&
 	    (amdgpu_is_atpx_hybrid() ||
@@ -160,7 +152,7 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
 	 * properly initialize the GPU MC controller and permit
 	 * VRAM allocation
 	 */
-	r = amdgpu_device_init(adev, dev, dev->pdev, flags);
+	r = amdgpu_device_init(adev, flags);
 	if (r) {
 		dev_err(&dev->pdev->dev, "Fatal error during GPU init\n");
 		goto out;
-- 
2.28.0.215.g878e727637

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
