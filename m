Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343F224944A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 07:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799856E162;
	Wed, 19 Aug 2020 05:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700087.outbound.protection.outlook.com [40.107.70.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E96889B12;
 Wed, 19 Aug 2020 05:01:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTDDcykzmg4kHgAef+SxB7BZFs8iEPoMspwOfBIcj7xk2AeMWC9qm3MBUvkcGYtwp1vNN/XJoL4wu03ZbzjyBaDflvuS+xFtilbVfa2YgDzWc2C1YHASUNvu8yhN2T/IsCjIrnghTcBv8VSNQ8eFuHX+sZE45kANXu7XhRliJXcq/92z/v/5r3tdtGhovxN8qZF92LQxmJduSZUf7hmu3Parthtblp+Vv5D90851OE4urNtN5zq8Elez8T8hadWQyvc10tPTAXPGHwlaGrQG19A/NvILV3b4/5sOExm2jXw+YCTk/FQ3gwIpL7oovWZ0zc0iPyKSPxbrrChWZW2i1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO+P6b2XBwGIWmJUl1kRvCptkIeVzEbddqRvHyPdinE=;
 b=ehxO1Cdu6Kxbl6GXrcrnTgNAfyYdLe94pNc9ACO5GxLPA3G6efNBw/FvGu80CouiPGyY+kWHIPrcLME2sohTL3EMRkSsV4tyoVHZr6m2pbVmHQMwW882tlHZOMSQfFaLdcD1+WWig6Ej4DDobCvo79YyKOeTZs45n2sCMkfh35+AES1Unnv0jhXs4yg0pnpmihKdpTgsMGLKCvgbfNYTE9IgqwDaBjT4eXsgKRwbkqSX1jqJRkYZIhrujn32wPomMS14G54qnSka0NQLyz5FV4JHuPifpu0FQ6KxR9A3Kpt2iRlVPGvJmOZrQwoiuPmkrb9v2oP7pBQXQVdKulquPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO+P6b2XBwGIWmJUl1kRvCptkIeVzEbddqRvHyPdinE=;
 b=cBFUKyCv28aoW8RehzLqkS+iCMlWrPlLT15SVIuice9vEcw6lPu8QKDAfaNzNwe5g+/J9hvXTb3vOKlkZt9UqLM5nloxaxpNQMdiDo6fGt/GoziOe+Hr53meMC7695z60+taOZhgczgjyty9e1sYPWbybgyYqCkygsyQEwofLg8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB2618.namprd12.prod.outlook.com (2603:10b6:5:49::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Wed, 19 Aug
 2020 05:00:58 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 05:00:58 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amdgpu: drm_device to amdgpu_device by inline-f (v2)
Date: Wed, 19 Aug 2020 01:00:40 -0400
Message-Id: <20200819050042.7370-2-luben.tuikov@amd.com>
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
 15.20.3283.16 via Frontend Transport; Wed, 19 Aug 2020 05:00:57 +0000
X-Mailer: git-send-email 2.28.0.215.g878e727637
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6face228-9479-42b2-364a-08d843fcdc44
X-MS-TrafficTypeDiagnostic: DM6PR12MB2618:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2618463E3B47BE726783F5BC995D0@DM6PR12MB2618.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:113;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GI0NdxuJLtzmOMRxTO/ynkkkxLfVhzT6G/ywgMRdmks5VrwnsfhRezsZVQLEL9JLxwcuq90YqUHwkbJdTvsd3llD9lUQAkqpDXFupCxp0GrpHOxJa7TffamHTVta+NwKK7wZ7bBXXbdjdTVAglVhb6/EJO/lxPPaimqyveM2PASKVsl2e6vZt1Nt7v6i9O5RxwwdtmryOMY4CK2utTd60HSlqILxUUpq7y1COX7qCEsQX673LEwoxFcyhQ38F06UfAX6INVZcpV7zq2KjYFkMR0GBSfUeyNgrMh6l1EQcIqCL8+1gP2eurIQBnCruqZwQpqjOJWQQTtN438N7l1mOSZVDBs/1MWybd9pV/xmp4I7ld5BlGyEcO/O2KULOSqSHfy8sdRaFBkPYxs4P9ugJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(26005)(110011004)(83380400001)(16576012)(30864003)(316002)(2906002)(4326008)(36756003)(54906003)(8676002)(1076003)(478600001)(186003)(66556008)(66476007)(6486002)(44832011)(66946007)(5660300002)(52116002)(6666004)(8936002)(86362001)(956004)(2616005)(21314003)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: rYhxVIQxMyPp+Vl3SwZij84WDPeiAgRTnJUsSWEbO3p2gXHcXa1azQfT/HscodBTmwRj3+vG+emDtmV2V6mf9RrwcS54a1fDRPC/lIs9luN+Y1AN3CZhiJl8RNRGovHJBKqGTWy3kMp+m5rJqoVVjoDJkGrLzQFwA9JWYTtsNlEZUZHx1/l7naV27/INXAe+XzYIByVoEsrD+jx30R0gf64IULUHjrS4Jerro8BR+fj4vDsGRmT7z8o7mHtW7fIcHBBk3fpsD6/gC4vKjB2+p+lq/vurS/GCeX704Ym49immeAFHf6Gcqk7cbIa6AZPwcT2mZvOfwqgv+y5iAmTITzxcBTxAdKz3GV+sdOSL0aVfDHS9G9zP1r1XSM0Cu+kWkSZKQSs9bzOBUSAQaJ5S+Lyiqjj7LJJQO2fHqiruqKQ8zo/JWJbZ3GpVJVY+wu2yf/XaiKJt7vR86stZ187ZJBM0QljLfo7TQRBSG4YNGptCklkepjrl/K3udcLx7Wy5o031x7YaRw11AQ0rARTbmsjOwAVa13cK88OZAZmSKMuWXS5UKfezqbWDyJaMrp4DYH1Xy+eoxifH6H02D4+OGjhB8uEWeH3rgy7DLP3JgKaYIT6CDXiyKyoWpMG6/gpWj8XNkxJeCWZwc3vEShka4g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6face228-9479-42b2-364a-08d843fcdc44
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 05:00:58.2570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vzAzTepVNoQTN6mT+tQM6GCC2c17aeJ0UZcUv2KjlQuCncU4TFHYs3h903O0sPG
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

Get the amdgpu_device from the DRM device by use
of an inline function, drm_to_adev(). The inline
function resolves a pointer to struct drm_device
to a pointer to struct amdgpu_device.

v2: Use a typed visible static inline function
    instead of an invisible macro.

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  5 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |  2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c  | 10 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c   |  2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 18 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 20 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 12 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 10 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       | 12 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 16 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 10 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c      |  4 +-
 drivers/gpu/drm/amd/amdgpu/atombios_crtc.c    | 22 ++---
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c      |  6 +-
 .../gpu/drm/amd/amdgpu/atombios_encoders.c    | 34 ++++----
 drivers/gpu/drm/amd/amdgpu/atombios_i2c.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        | 48 +++++------
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        | 50 ++++++------
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         | 58 +++++++-------
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         | 48 +++++------
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c      |  4 +-
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c          |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 61 +++++++-------
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  3 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  4 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  4 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c            | 80 +++++++++----------
 44 files changed, 304 insertions(+), 301 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 9c6fb38ce59d..d75f6a29a0d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -988,6 +988,11 @@ struct amdgpu_device {
 	struct ratelimit_state		throttling_logging_rs;
 };
 
+static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
+{
+	return ddev->dev_private;
+}
+
 static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
 {
 	return container_of(bdev, struct amdgpu_device, mman.bdev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 0effc1d46824..b74846fc3933 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -483,7 +483,7 @@ int amdgpu_amdkfd_get_dmabuf_info(struct kgd_dev *kgd, int dma_buf_fd,
 		/* Can't handle buffers from different drivers */
 		goto out_put;
 
-	adev = obj->dev->dev_private;
+	adev = drm_to_adev(obj->dev);
 	bo = gem_to_amdgpu_bo(obj);
 	if (!(bo->preferred_domains & (AMDGPU_GEM_DOMAIN_VRAM |
 				    AMDGPU_GEM_DOMAIN_GTT)))
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 7e2394b50fbf..b1ce0d4e94c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1674,7 +1674,7 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct kgd_dev *kgd,
 		return -EINVAL;
 
 	obj = dma_buf->priv;
-	if (obj->dev->dev_private != adev)
+	if (drm_to_adev(obj->dev) != adev)
 		/* Can't handle buffers from other devices */
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index e33f63712b46..662cc414ceec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -1882,7 +1882,7 @@ static void cail_mc_write(struct card_info *info, uint32_t reg, uint32_t val)
  */
 static void cail_reg_write(struct card_info *info, uint32_t reg, uint32_t val)
 {
-	struct amdgpu_device *adev = info->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(info->dev);
 
 	WREG32(reg, val);
 }
@@ -1898,7 +1898,7 @@ static void cail_reg_write(struct card_info *info, uint32_t reg, uint32_t val)
  */
 static uint32_t cail_reg_read(struct card_info *info, uint32_t reg)
 {
-	struct amdgpu_device *adev = info->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(info->dev);
 	uint32_t r;
 
 	r = RREG32(reg);
@@ -1916,7 +1916,7 @@ static uint32_t cail_reg_read(struct card_info *info, uint32_t reg)
  */
 static void cail_ioreg_write(struct card_info *info, uint32_t reg, uint32_t val)
 {
-	struct amdgpu_device *adev = info->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(info->dev);
 
 	WREG32_IO(reg, val);
 }
@@ -1932,7 +1932,7 @@ static void cail_ioreg_write(struct card_info *info, uint32_t reg, uint32_t val)
  */
 static uint32_t cail_ioreg_read(struct card_info *info, uint32_t reg)
 {
-	struct amdgpu_device *adev = info->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(info->dev);
 	uint32_t r;
 
 	r = RREG32_IO(reg);
@@ -1944,7 +1944,7 @@ static ssize_t amdgpu_atombios_get_vbios_version(struct device *dev,
 						 char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	struct atom_context *ctx = adev->mode_info.atom_context;
 
 	return snprintf(buf, PAGE_SIZE, "%s\n", ctx->vbios_version);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
index 85b0515c0fdc..0f40c179e2cc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -265,7 +265,7 @@ int amdgpu_bo_create_list_entry_array(struct drm_amdgpu_bo_list_in *in,
 int amdgpu_bo_list_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *filp)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_fpriv *fpriv = filp->driver_priv;
 	union drm_amdgpu_bo_list *args = data;
 	uint32_t handle = args->in.list_handle;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index a1aec205435d..3bce625189ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -41,7 +41,7 @@
 void amdgpu_connector_hotplug(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 
 	/* bail if the connector does not have hpd pin, e.g.,
@@ -279,7 +279,7 @@ amdgpu_connector_get_hardcoded_edid(struct amdgpu_device *adev)
 static void amdgpu_connector_get_edid(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 
 	if (amdgpu_connector->edid)
@@ -463,7 +463,7 @@ static int amdgpu_connector_set_property(struct drm_connector *connector,
 					  uint64_t val)
 {
 	struct drm_device *dev = connector->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_encoder *encoder;
 	struct amdgpu_encoder *amdgpu_encoder;
 
@@ -834,7 +834,7 @@ static enum drm_mode_status amdgpu_connector_vga_mode_valid(struct drm_connector
 					    struct drm_display_mode *mode)
 {
 	struct drm_device *dev = connector->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	/* XXX check mode bandwidth */
 
@@ -941,7 +941,7 @@ static bool
 amdgpu_connector_check_hpd_status_unchanged(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 	enum drm_connector_status status;
 
@@ -972,7 +972,7 @@ static enum drm_connector_status
 amdgpu_connector_dvi_detect(struct drm_connector *connector, bool force)
 {
 	struct drm_device *dev = connector->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 	const struct drm_encoder_helper_funcs *encoder_funcs;
 	int r;
@@ -1159,7 +1159,7 @@ static enum drm_mode_status amdgpu_connector_dvi_mode_valid(struct drm_connector
 					    struct drm_display_mode *mode)
 {
 	struct drm_device *dev = connector->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 
 	/* XXX check mode bandwidth */
@@ -1311,7 +1311,7 @@ static bool amdgpu_connector_encoder_is_hbr2(struct drm_connector *connector)
 bool amdgpu_connector_is_dp12_capable(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if ((adev->clock.default_dispclk >= 53900) &&
 	    amdgpu_connector_encoder_is_hbr2(connector)) {
@@ -1325,7 +1325,7 @@ static enum drm_connector_status
 amdgpu_connector_dp_detect(struct drm_connector *connector, bool force)
 {
 	struct drm_device *dev = connector->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 	enum drm_connector_status ret = connector_status_disconnected;
 	struct amdgpu_connector_atom_dig *amdgpu_dig_connector = amdgpu_connector->con_priv;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 1921e61a37b9..1cf28bfa1e88 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1288,7 +1288,7 @@ static void trace_amdgpu_cs_ibs(struct amdgpu_cs_parser *parser)
 
 int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	union drm_amdgpu_cs *cs = data;
 	struct amdgpu_cs_parser parser = {};
 	bool reserved_buffers = false;
@@ -1431,7 +1431,7 @@ static struct dma_fence *amdgpu_cs_get_fence(struct amdgpu_device *adev,
 int amdgpu_cs_fence_to_handle_ioctl(struct drm_device *dev, void *data,
 				    struct drm_file *filp)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	union drm_amdgpu_fence_to_handle *info = data;
 	struct dma_fence *fence;
 	struct drm_syncobj *syncobj;
@@ -1607,7 +1607,7 @@ static int amdgpu_cs_wait_any_fence(struct amdgpu_device *adev,
 int amdgpu_cs_wait_fences_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *filp)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	union drm_amdgpu_wait_fences *wait = data;
 	uint32_t fence_count = wait->in.fence_count;
 	struct drm_amdgpu_fence *fences_user;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index ba243cc8f585..59032c26fc82 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -385,7 +385,7 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
 	enum drm_sched_priority priority;
 
 	union drm_amdgpu_ctx *args = data;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_fpriv *fpriv = filp->driver_priv;
 
 	id = args->in.ctx_id;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 35fed75a4397..0e01f971b027 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1232,7 +1232,7 @@ static int amdgpu_debugfs_test_ib(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
 	struct drm_device *dev = node->minor->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int r = 0, i;
 
 	r = pm_runtime_get_sync(dev->dev);
@@ -1281,7 +1281,7 @@ static int amdgpu_debugfs_get_vbios_dump(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
 	struct drm_device *dev = node->minor->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	seq_write(m, adev->bios, adev->bios_size);
 	return 0;
@@ -1291,7 +1291,7 @@ static int amdgpu_debugfs_evict_vram(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
 	struct drm_device *dev = node->minor->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int r;
 
 	r = pm_runtime_get_sync(dev->dev);
@@ -1312,7 +1312,7 @@ static int amdgpu_debugfs_evict_gtt(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
 	struct drm_device *dev = node->minor->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int r;
 
 	r = pm_runtime_get_sync(dev->dev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 415e1a32b98c..ba83c9c9c674 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -132,7 +132,7 @@ static ssize_t amdgpu_device_get_pcie_replay_count(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	uint64_t cnt = amdgpu_asic_get_pcie_replay_count(adev);
 
 	return snprintf(buf, PAGE_SIZE, "%llu\n", cnt);
@@ -157,7 +157,7 @@ static ssize_t amdgpu_device_get_product_name(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 
 	return snprintf(buf, PAGE_SIZE, "%s\n", adev->product_name);
 }
@@ -179,7 +179,7 @@ static ssize_t amdgpu_device_get_product_number(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 
 	return snprintf(buf, PAGE_SIZE, "%s\n", adev->product_number);
 }
@@ -201,7 +201,7 @@ static ssize_t amdgpu_device_get_serial_number(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 
 	return snprintf(buf, PAGE_SIZE, "%s\n", adev->serial);
 }
@@ -219,7 +219,7 @@ static DEVICE_ATTR(serial_number, S_IRUGO,
  */
 bool amdgpu_device_supports_boco(struct drm_device *dev)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if (adev->flags & AMD_IS_PX)
 		return true;
@@ -236,7 +236,7 @@ bool amdgpu_device_supports_boco(struct drm_device *dev)
  */
 bool amdgpu_device_supports_baco(struct drm_device *dev)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	return amdgpu_asic_supports_baco(adev);
 }
@@ -3455,7 +3455,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
 		return -ENODEV;
 	}
 
-	adev = dev->dev_private;
+	adev = drm_to_adev(dev);
 
 	if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
 		return 0;
@@ -3543,7 +3543,7 @@ int amdgpu_device_resume(struct drm_device *dev, bool fbcon)
 {
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_crtc *crtc;
 	int r = 0;
 
@@ -4624,7 +4624,7 @@ static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev)
 
 int amdgpu_device_baco_enter(struct drm_device *dev)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
 
 	if (!amdgpu_device_supports_baco(adev->ddev))
@@ -4638,7 +4638,7 @@ int amdgpu_device_baco_enter(struct drm_device *dev)
 
 int amdgpu_device_baco_exit(struct drm_device *dev)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
 	int ret = 0;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 5179d5ff2259..719cb1a9c055 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -152,7 +152,7 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
 				struct drm_modeset_acquire_ctx *ctx)
 {
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_gem_object *obj;
 	struct amdgpu_flip_work *work;
@@ -292,7 +292,7 @@ int amdgpu_display_crtc_set_config(struct drm_mode_set *set,
 
 	pm_runtime_mark_last_busy(dev->dev);
 
-	adev = dev->dev_private;
+	adev = drm_to_adev(dev);
 	/* if we have active crtcs and we don't have a power ref,
 	   take the current one */
 	if (active && !adev->have_disp_power_ref) {
@@ -823,7 +823,7 @@ int amdgpu_display_get_crtc_scanoutpos(struct drm_device *dev,
 	int vbl_start, vbl_end, vtotal, ret = 0;
 	bool in_vbl = true;
 
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	/* preempt_disable_rt() should go right here in PREEMPT_RT patchset. */
 
@@ -953,7 +953,7 @@ int amdgpu_display_freesync_ioctl(struct drm_device *dev, void *data,
 				  struct drm_file *filp)
 {
 	int ret = -EPERM;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if (adev->mode_info.funcs->notify_freesync)
 		ret = adev->mode_info.funcs->notify_freesync(dev,data,filp);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index ffeb20f11c07..cf467586f43e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -420,7 +420,7 @@ static struct drm_gem_object *
 amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
 {
 	struct dma_resv *resv = dma_buf->resv;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_bo *bo;
 	struct amdgpu_bo_param bp;
 	int ret;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index c1219af2e7d6..38023c879db1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1167,7 +1167,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	} else if (ret)
 		goto err_pci;
 
-	adev = dev->dev_private;
+	adev = drm_to_adev(dev);
 	ret = amdgpu_debugfs_init(adev);
 	if (ret)
 		DRM_ERROR("Creating debugfs files failed (%d).\n", ret);
@@ -1201,7 +1201,7 @@ static void
 amdgpu_pci_shutdown(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if (amdgpu_ras_intr_triggered())
 		return;
@@ -1234,7 +1234,7 @@ static int amdgpu_pmops_resume(struct device *dev)
 static int amdgpu_pmops_freeze(struct device *dev)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = drm_dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(drm_dev);
 	int r;
 
 	adev->in_hibernate = true;
@@ -1270,7 +1270,7 @@ static int amdgpu_pmops_runtime_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct drm_device *drm_dev = pci_get_drvdata(pdev);
-	struct amdgpu_device *adev = drm_dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(drm_dev);
 	int ret, i;
 
 	if (!adev->runpm) {
@@ -1321,7 +1321,7 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct drm_device *drm_dev = pci_get_drvdata(pdev);
-	struct amdgpu_device *adev = drm_dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(drm_dev);
 	int ret;
 
 	if (!adev->runpm)
@@ -1357,7 +1357,7 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
 static int amdgpu_pmops_runtime_idle(struct device *dev)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = drm_dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(drm_dev);
 	/* we don't want the main rpm_idle to call suspend - we want to autosuspend */
 	int ret = 1;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c
index 61fcf247a638..af4ef84e27a7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c
@@ -35,7 +35,7 @@
 void
 amdgpu_link_encoder_connector(struct drm_device *dev)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
 	struct amdgpu_connector *amdgpu_connector;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 58d4c219178a..cfccd3d33341 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -700,7 +700,7 @@ static int amdgpu_debugfs_fence_info(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
 	struct drm_device *dev = node->minor->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int i;
 
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
@@ -749,7 +749,7 @@ static int amdgpu_debugfs_gpu_recover(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
 	struct drm_device *dev = node->minor->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int r;
 
 	r = pm_runtime_get_sync(dev->dev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 8c64d8d6cb82..4935585ee91b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -216,7 +216,7 @@ void amdgpu_gem_object_close(struct drm_gem_object *obj,
 int amdgpu_gem_create_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *filp)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_fpriv *fpriv = filp->driver_priv;
 	struct amdgpu_vm *vm = &fpriv->vm;
 	union drm_amdgpu_gem_create *args = data;
@@ -297,7 +297,7 @@ int amdgpu_gem_userptr_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *filp)
 {
 	struct ttm_operation_ctx ctx = { true, false };
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_amdgpu_gem_userptr *args = data;
 	struct drm_gem_object *gobj;
 	struct amdgpu_bo *bo;
@@ -586,7 +586,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 
 	struct drm_amdgpu_gem_va *args = data;
 	struct drm_gem_object *gobj;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_fpriv *fpriv = filp->driver_priv;
 	struct amdgpu_bo *abo;
 	struct amdgpu_bo_va *bo_va;
@@ -710,7 +710,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *filp)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_amdgpu_gem_op *args = data;
 	struct drm_gem_object *gobj;
 	struct amdgpu_vm_bo_base *base;
@@ -787,7 +787,7 @@ int amdgpu_mode_dumb_create(struct drm_file *file_priv,
 			    struct drm_device *dev,
 			    struct drm_mode_create_dumb *args)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_gem_object *gobj;
 	uint32_t handle;
 	u64 flags = AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED |
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index bc01a06546aa..ba3027c1d7a7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -47,7 +47,7 @@ static ssize_t amdgpu_mem_info_gtt_total_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 
 	return snprintf(buf, PAGE_SIZE, "%llu\n",
 			(adev->mman.bdev.man[TTM_PL_TT].size) * PAGE_SIZE);
@@ -65,7 +65,7 @@ static ssize_t amdgpu_mem_info_gtt_used_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 
 	return snprintf(buf, PAGE_SIZE, "%llu\n",
 			amdgpu_gtt_mgr_usage(&adev->mman.bdev.man[TTM_PL_TT]));
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
index 70dbe343f51d..411c84194f97 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
@@ -40,7 +40,7 @@
 static int amdgpu_i2c_pre_xfer(struct i2c_adapter *i2c_adap)
 {
 	struct amdgpu_i2c_chan *i2c = i2c_get_adapdata(i2c_adap);
-	struct amdgpu_device *adev = i2c->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(i2c->dev);
 	struct amdgpu_i2c_bus_rec *rec = &i2c->rec;
 	uint32_t temp;
 
@@ -82,7 +82,7 @@ static int amdgpu_i2c_pre_xfer(struct i2c_adapter *i2c_adap)
 static void amdgpu_i2c_post_xfer(struct i2c_adapter *i2c_adap)
 {
 	struct amdgpu_i2c_chan *i2c = i2c_get_adapdata(i2c_adap);
-	struct amdgpu_device *adev = i2c->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(i2c->dev);
 	struct amdgpu_i2c_bus_rec *rec = &i2c->rec;
 	uint32_t temp;
 
@@ -101,7 +101,7 @@ static void amdgpu_i2c_post_xfer(struct i2c_adapter *i2c_adap)
 static int amdgpu_i2c_get_clock(void *i2c_priv)
 {
 	struct amdgpu_i2c_chan *i2c = i2c_priv;
-	struct amdgpu_device *adev = i2c->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(i2c->dev);
 	struct amdgpu_i2c_bus_rec *rec = &i2c->rec;
 	uint32_t val;
 
@@ -116,7 +116,7 @@ static int amdgpu_i2c_get_clock(void *i2c_priv)
 static int amdgpu_i2c_get_data(void *i2c_priv)
 {
 	struct amdgpu_i2c_chan *i2c = i2c_priv;
-	struct amdgpu_device *adev = i2c->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(i2c->dev);
 	struct amdgpu_i2c_bus_rec *rec = &i2c->rec;
 	uint32_t val;
 
@@ -130,7 +130,7 @@ static int amdgpu_i2c_get_data(void *i2c_priv)
 static void amdgpu_i2c_set_clock(void *i2c_priv, int clock)
 {
 	struct amdgpu_i2c_chan *i2c = i2c_priv;
-	struct amdgpu_device *adev = i2c->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(i2c->dev);
 	struct amdgpu_i2c_bus_rec *rec = &i2c->rec;
 	uint32_t val;
 
@@ -143,7 +143,7 @@ static void amdgpu_i2c_set_clock(void *i2c_priv, int clock)
 static void amdgpu_i2c_set_data(void *i2c_priv, int data)
 {
 	struct amdgpu_i2c_chan *i2c = i2c_priv;
-	struct amdgpu_device *adev = i2c->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(i2c->dev);
 	struct amdgpu_i2c_bus_rec *rec = &i2c->rec;
 	uint32_t val;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
index dcd492170598..2f53fa0ae9a6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
@@ -445,7 +445,7 @@ static int amdgpu_debugfs_sa_info(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
 	struct drm_device *dev = node->minor->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	seq_printf(m, "--------------------- DELAYED --------------------- \n");
 	amdgpu_sa_bo_dump_debug_info(&adev->ib_pools[AMDGPU_IB_POOL_DELAYED],
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index 0cc4c67f95f7..508cb34a9142 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -151,7 +151,7 @@ void amdgpu_irq_disable_all(struct amdgpu_device *adev)
 irqreturn_t amdgpu_irq_handler(int irq, void *arg)
 {
 	struct drm_device *dev = (struct drm_device *) arg;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	irqreturn_t ret;
 
 	ret = amdgpu_ih_process(adev, &adev->irq.ih);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index b4a9e0478f25..47cd3558f9c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -78,7 +78,7 @@ void amdgpu_unregister_gpu_instance(struct amdgpu_device *adev)
  */
 void amdgpu_driver_unload_kms(struct drm_device *dev)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if (adev == NULL)
 		return;
@@ -479,7 +479,7 @@ static int amdgpu_hw_ip_info(struct amdgpu_device *adev,
  */
 static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_amdgpu_info *info = data;
 	struct amdgpu_mode_info *minfo = &adev->mode_info;
 	void __user *out = (void __user *)(uintptr_t)info->return_pointer;
@@ -992,7 +992,7 @@ void amdgpu_driver_lastclose_kms(struct drm_device *dev)
  */
 int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_fpriv *fpriv;
 	int r, pasid;
 
@@ -1077,7 +1077,7 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 void amdgpu_driver_postclose_kms(struct drm_device *dev,
 				 struct drm_file *file_priv)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_fpriv *fpriv = file_priv->driver_priv;
 	struct amdgpu_bo_list *list;
 	struct amdgpu_bo *pd;
@@ -1142,7 +1142,7 @@ u32 amdgpu_get_vblank_counter_kms(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	unsigned int pipe = crtc->index;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int vpos, hpos, stat;
 	u32 count;
 
@@ -1210,7 +1210,7 @@ int amdgpu_enable_vblank_kms(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	unsigned int pipe = crtc->index;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int idx = amdgpu_display_crtc_idx_to_irq_type(adev, pipe);
 
 	return amdgpu_irq_get(adev, &adev->crtc_irq, idx);
@@ -1227,7 +1227,7 @@ void amdgpu_disable_vblank_kms(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	unsigned int pipe = crtc->index;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int idx = amdgpu_display_crtc_idx_to_irq_type(adev, pipe);
 
 	amdgpu_irq_put(adev, &adev->crtc_irq, idx);
@@ -1264,7 +1264,7 @@ static int amdgpu_debugfs_firmware_info(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
 	struct drm_device *dev = node->minor->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_amdgpu_info_firmware fw_info;
 	struct drm_amdgpu_query_fw query_fw;
 	struct atom_context *ctx = adev->mode_info.atom_context;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index aa1e77c60c0a..6d28313dfb3a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2604,7 +2604,7 @@ static ssize_t psp_usbc_pd_fw_sysfs_read(struct device *dev,
 					 char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	uint32_t fw_ver;
 	int ret;
 
@@ -2631,7 +2631,7 @@ static ssize_t psp_usbc_pd_fw_sysfs_write(struct device *dev,
 						       size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	void *cpu_addr;
 	dma_addr_t dma_addr;
 	int ret;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
index 9581283a4c78..0da0a0d98672 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
@@ -123,7 +123,7 @@ int amdgpu_sched_ioctl(struct drm_device *dev, void *data,
 		       struct drm_file *filp)
 {
 	union drm_amdgpu_sched *args = data;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	enum drm_sched_priority priority;
 	int r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 0b3c813bf8b8..0d56eb9ff982 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2139,7 +2139,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 int amdgpu_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	struct drm_file *file_priv = filp->private_data;
-	struct amdgpu_device *adev = file_priv->minor->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(file_priv->minor->dev);
 
 	if (adev == NULL)
 		return -EINVAL;
@@ -2320,7 +2320,7 @@ static int amdgpu_mm_dump_table(struct seq_file *m, void *data)
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
 	unsigned ttm_pl = (uintptr_t)node->info_ent->data;
 	struct drm_device *dev = node->minor->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct ttm_mem_type_manager *man = &adev->mman.bdev.man[ttm_pl];
 	struct drm_printer p = drm_seq_file_printer(m);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index 183743c5fb7b..860edecb0198 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -408,7 +408,7 @@ static ssize_t show_##name(struct device *dev,				\
 			  char *buf)					\
 {									\
 	struct drm_device *ddev = dev_get_drvdata(dev);			\
-	struct amdgpu_device *adev = ddev->dev_private;			\
+	struct amdgpu_device *adev = drm_to_adev(ddev);			\
 									\
 	return snprintf(buf, PAGE_SIZE, "0x%08x\n", adev->field);	\
 }									\
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 71e005cf2952..e9ac64d3fa7d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -3209,7 +3209,7 @@ void amdgpu_vm_manager_fini(struct amdgpu_device *adev)
 int amdgpu_vm_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 {
 	union drm_amdgpu_vm *args = data;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_fpriv *fpriv = filp->driver_priv;
 	long timeout = msecs_to_jiffies(2000);
 	int r;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 9b03fadc42fb..8e3b94e45ded 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -46,7 +46,7 @@ static ssize_t amdgpu_mem_info_vram_total_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 
 	return snprintf(buf, PAGE_SIZE, "%llu\n", adev->gmc.real_vram_size);
 }
@@ -63,7 +63,7 @@ static ssize_t amdgpu_mem_info_vis_vram_total_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 
 	return snprintf(buf, PAGE_SIZE, "%llu\n", adev->gmc.visible_vram_size);
 }
@@ -80,7 +80,7 @@ static ssize_t amdgpu_mem_info_vram_used_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 
 	return snprintf(buf, PAGE_SIZE, "%llu\n",
 		amdgpu_vram_mgr_usage(&adev->mman.bdev.man[TTM_PL_VRAM]));
@@ -98,7 +98,7 @@ static ssize_t amdgpu_mem_info_vis_vram_used_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 
 	return snprintf(buf, PAGE_SIZE, "%llu\n",
 		amdgpu_vram_mgr_vis_usage(&adev->mman.bdev.man[TTM_PL_VRAM]));
@@ -109,7 +109,7 @@ static ssize_t amdgpu_mem_info_vram_vendor(struct device *dev,
 						 char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 
 	switch (adev->gmc.vram_vendor) {
 	case SAMSUNG:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index cd6e6eb7d966..a9acc747b31e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -229,7 +229,7 @@ static ssize_t amdgpu_xgmi_show_device_id(struct device *dev,
 				     char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 
 	return snprintf(buf, PAGE_SIZE, "%llu\n", adev->gmc.xgmi.node_id);
 
@@ -241,7 +241,7 @@ static ssize_t amdgpu_xgmi_show_error(struct device *dev,
 				      char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	uint32_t ficaa_pie_ctl_in, ficaa_pie_status_in;
 	uint64_t fica_out;
 	unsigned int error_count = 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_crtc.c b/drivers/gpu/drm/amd/amdgpu/atombios_crtc.c
index 213e62a28ba0..159a2a4385a1 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_crtc.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_crtc.c
@@ -41,7 +41,7 @@ void amdgpu_atombios_crtc_overscan_setup(struct drm_crtc *crtc,
 				  struct drm_display_mode *adjusted_mode)
 {
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	SET_CRTC_OVERSCAN_PS_ALLOCATION args;
 	int index = GetIndexIntoMasterTable(COMMAND, SetCRTC_OverScan);
@@ -84,7 +84,7 @@ void amdgpu_atombios_crtc_overscan_setup(struct drm_crtc *crtc,
 void amdgpu_atombios_crtc_scaler_setup(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	ENABLE_SCALER_PS_ALLOCATION args;
 	int index = GetIndexIntoMasterTable(COMMAND, EnableScaler);
@@ -114,7 +114,7 @@ void amdgpu_atombios_crtc_lock(struct drm_crtc *crtc, int lock)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int index =
 	    GetIndexIntoMasterTable(COMMAND, UpdateCRTC_DoubleBufferRegisters);
 	ENABLE_CRTC_PS_ALLOCATION args;
@@ -131,7 +131,7 @@ void amdgpu_atombios_crtc_enable(struct drm_crtc *crtc, int state)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int index = GetIndexIntoMasterTable(COMMAND, EnableCRTC);
 	ENABLE_CRTC_PS_ALLOCATION args;
 
@@ -147,7 +147,7 @@ void amdgpu_atombios_crtc_blank(struct drm_crtc *crtc, int state)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int index = GetIndexIntoMasterTable(COMMAND, BlankCRTC);
 	BLANK_CRTC_PS_ALLOCATION args;
 
@@ -163,7 +163,7 @@ void amdgpu_atombios_crtc_powergate(struct drm_crtc *crtc, int state)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int index = GetIndexIntoMasterTable(COMMAND, EnableDispPowerGating);
 	ENABLE_DISP_POWER_GATING_PS_ALLOCATION args;
 
@@ -192,7 +192,7 @@ void amdgpu_atombios_crtc_set_dtd_timing(struct drm_crtc *crtc,
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	SET_CRTC_USING_DTD_TIMING_PARAMETERS args;
 	int index = GetIndexIntoMasterTable(COMMAND, SetCRTC_UsingDTDTiming);
 	u16 misc = 0;
@@ -307,7 +307,7 @@ static u32 amdgpu_atombios_crtc_adjust_pll(struct drm_crtc *crtc,
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_encoder *encoder = amdgpu_crtc->encoder;
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
@@ -588,7 +588,7 @@ void amdgpu_atombios_crtc_program_pll(struct drm_crtc *crtc,
 				      struct amdgpu_atom_ss *ss)
 {
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	u8 frev, crev;
 	int index = GetIndexIntoMasterTable(COMMAND, SetPixelClock);
 	union set_pixel_clock args;
@@ -749,7 +749,7 @@ int amdgpu_atombios_crtc_prepare_pll(struct drm_crtc *crtc,
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder =
 		to_amdgpu_encoder(amdgpu_crtc->encoder);
 	int encoder_mode = amdgpu_atombios_encoder_get_encoder_mode(amdgpu_crtc->encoder);
@@ -818,7 +818,7 @@ void amdgpu_atombios_crtc_set_pll(struct drm_crtc *crtc, struct drm_display_mode
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder =
 		to_amdgpu_encoder(amdgpu_crtc->encoder);
 	u32 pll_clock = mode->clock;
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
index 9b74cfdba7b8..cc2494671f9d 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
@@ -60,7 +60,7 @@ static int amdgpu_atombios_dp_process_aux_ch(struct amdgpu_i2c_chan *chan,
 				      u8 delay, u8 *ack)
 {
 	struct drm_device *dev = chan->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	union aux_channel_transaction args;
 	int index = GetIndexIntoMasterTable(COMMAND, ProcessAuxChannelTransaction);
 	unsigned char *base;
@@ -305,7 +305,7 @@ static u8 amdgpu_atombios_dp_encoder_service(struct amdgpu_device *adev,
 u8 amdgpu_atombios_dp_get_sinktype(struct amdgpu_connector *amdgpu_connector)
 {
 	struct drm_device *dev = amdgpu_connector->base.dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	return amdgpu_atombios_dp_encoder_service(adev, ATOM_DP_ACTION_GET_SINK_TYPE, 0,
 					   amdgpu_connector->ddc_bus->rec.i2c_id, 0);
@@ -702,7 +702,7 @@ void amdgpu_atombios_dp_link_train(struct drm_encoder *encoder,
 			    struct drm_connector *connector)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_connector *amdgpu_connector;
 	struct amdgpu_connector_atom_dig *dig_connector;
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
index 1e94a9b652f7..a7466f3562bc 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
@@ -70,7 +70,7 @@ u8
 amdgpu_atombios_encoder_get_backlight_level(struct amdgpu_encoder *amdgpu_encoder)
 {
 	struct drm_device *dev = amdgpu_encoder->base.dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if (!(adev->mode_info.firmware_flags & ATOM_BIOS_INFO_BL_CONTROLLED_BY_GPU))
 		return 0;
@@ -84,7 +84,7 @@ amdgpu_atombios_encoder_set_backlight_level(struct amdgpu_encoder *amdgpu_encode
 {
 	struct drm_encoder *encoder = &amdgpu_encoder->base;
 	struct drm_device *dev = amdgpu_encoder->base.dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder_atom_dig *dig;
 
 	if (!(adev->mode_info.firmware_flags & ATOM_BIOS_INFO_BL_CONTROLLED_BY_GPU))
@@ -152,7 +152,7 @@ amdgpu_atombios_encoder_get_backlight_brightness(struct backlight_device *bd)
 	struct amdgpu_backlight_privdata *pdata = bl_get_data(bd);
 	struct amdgpu_encoder *amdgpu_encoder = pdata->encoder;
 	struct drm_device *dev = amdgpu_encoder->base.dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	return amdgpu_atombios_encoder_get_backlight_level_from_reg(adev);
 }
@@ -166,7 +166,7 @@ void amdgpu_atombios_encoder_init_backlight(struct amdgpu_encoder *amdgpu_encode
 				     struct drm_connector *drm_connector)
 {
 	struct drm_device *dev = amdgpu_encoder->base.dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct backlight_device *bd;
 	struct backlight_properties props;
 	struct amdgpu_backlight_privdata *pdata;
@@ -229,7 +229,7 @@ void
 amdgpu_atombios_encoder_fini_backlight(struct amdgpu_encoder *amdgpu_encoder)
 {
 	struct drm_device *dev = amdgpu_encoder->base.dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct backlight_device *bd = NULL;
 	struct amdgpu_encoder_atom_dig *dig;
 
@@ -319,7 +319,7 @@ static void
 amdgpu_atombios_encoder_setup_dac(struct drm_encoder *encoder, int action)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	DAC_ENCODER_CONTROL_PS_ALLOCATION args;
 	int index = 0;
@@ -382,7 +382,7 @@ static void
 amdgpu_atombios_encoder_setup_dvo(struct drm_encoder *encoder, int action)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	union dvo_encoder_control args;
 	int index = GetIndexIntoMasterTable(COMMAND, DVOEncoderControl);
@@ -573,7 +573,7 @@ amdgpu_atombios_encoder_setup_dig_encoder(struct drm_encoder *encoder,
 				   int action, int panel_mode)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
@@ -762,7 +762,7 @@ amdgpu_atombios_encoder_setup_dig_transmitter(struct drm_encoder *encoder, int a
 					      uint8_t lane_num, uint8_t lane_set)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct drm_connector *connector;
@@ -1178,7 +1178,7 @@ amdgpu_atombios_encoder_set_edp_panel_power(struct drm_connector *connector,
 {
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 	struct drm_device *dev = amdgpu_connector->base.dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	union dig_transmitter_control args;
 	int index = GetIndexIntoMasterTable(COMMAND, UNIPHYTransmitterControl);
 	uint8_t frev, crev;
@@ -1225,7 +1225,7 @@ amdgpu_atombios_encoder_setup_external_encoder(struct drm_encoder *encoder,
 					int action)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder *ext_amdgpu_encoder = to_amdgpu_encoder(ext_encoder);
 	union external_encoder_control args;
@@ -1466,7 +1466,7 @@ void
 amdgpu_atombios_encoder_set_crtc_source(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(encoder->crtc);
 	union crtc_source_param args;
@@ -1701,7 +1701,7 @@ amdgpu_atombios_encoder_dac_load_detect(struct drm_encoder *encoder,
 				 struct drm_connector *connector)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 
@@ -1751,7 +1751,7 @@ amdgpu_atombios_encoder_dac_detect(struct drm_encoder *encoder,
 			    struct drm_connector *connector)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 	uint32_t bios_0_scratch;
@@ -1790,7 +1790,7 @@ amdgpu_atombios_encoder_dig_detect(struct drm_encoder *encoder,
 			    struct drm_connector *connector)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 	struct drm_encoder *ext_encoder = amdgpu_get_external_encoder(encoder);
@@ -1848,7 +1848,7 @@ amdgpu_atombios_encoder_set_bios_scratch_regs(struct drm_connector *connector,
 				       bool connected)
 {
 	struct drm_device *dev = connector->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_connector *amdgpu_connector =
 	    to_amdgpu_connector(connector);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
@@ -1999,7 +1999,7 @@ struct amdgpu_encoder_atom_dig *
 amdgpu_atombios_encoder_get_lcd_info(struct amdgpu_encoder *encoder)
 {
 	struct drm_device *dev = encoder->base.dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_mode_info *mode_info = &adev->mode_info;
 	int index = GetIndexIntoMasterTable(DATA, LVDS_Info);
 	uint16_t data_offset, misc;
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c b/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c
index b4cc7c55fa16..09a538465ffd 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c
@@ -40,7 +40,7 @@ static int amdgpu_atombios_i2c_process_i2c_ch(struct amdgpu_i2c_chan *chan,
 				       u8 *buf, u8 num)
 {
 	struct drm_device *dev = chan->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	PROCESS_I2C_CHANNEL_TRANSACTION_PS_ALLOCATION args;
 	int index = GetIndexIntoMasterTable(COMMAND, ProcessI2cChannelTransaction);
 	unsigned char *base;
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index e38744d06f4e..0d0b73e846f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -504,7 +504,7 @@ void dce_v10_0_disable_dce(struct amdgpu_device *adev)
 static void dce_v10_0_program_fmt(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(encoder->crtc);
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
@@ -1209,7 +1209,7 @@ static struct amdgpu_audio_pin *dce_v10_0_audio_get_pin(struct amdgpu_device *ad
 
 static void dce_v10_0_afmt_audio_select_pin(struct drm_encoder *encoder)
 {
-	struct amdgpu_device *adev = encoder->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(encoder->dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	u32 tmp;
@@ -1226,7 +1226,7 @@ static void dce_v10_0_audio_write_latency_fields(struct drm_encoder *encoder,
 						struct drm_display_mode *mode)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct drm_connector *connector;
@@ -1272,7 +1272,7 @@ static void dce_v10_0_audio_write_latency_fields(struct drm_encoder *encoder,
 static void dce_v10_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct drm_connector *connector;
@@ -1328,7 +1328,7 @@ static void dce_v10_0_audio_write_speaker_allocation(struct drm_encoder *encoder
 static void dce_v10_0_audio_write_sad_regs(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct drm_connector *connector;
@@ -1483,7 +1483,7 @@ static void dce_v10_0_audio_fini(struct amdgpu_device *adev)
 static void dce_v10_0_afmt_update_ACR(struct drm_encoder *encoder, uint32_t clock)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_afmt_acr acr = amdgpu_afmt_acr(clock);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1519,7 +1519,7 @@ static void dce_v10_0_afmt_update_avi_infoframe(struct drm_encoder *encoder,
 					       void *buffer, size_t size)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	uint8_t *frame = buffer + 3;
@@ -1538,7 +1538,7 @@ static void dce_v10_0_afmt_update_avi_infoframe(struct drm_encoder *encoder,
 static void dce_v10_0_audio_set_dto(struct drm_encoder *encoder, u32 clock)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(encoder->crtc);
@@ -1569,7 +1569,7 @@ static void dce_v10_0_afmt_setmode(struct drm_encoder *encoder,
 				  struct drm_display_mode *mode)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
@@ -1749,7 +1749,7 @@ static void dce_v10_0_afmt_setmode(struct drm_encoder *encoder,
 static void dce_v10_0_afmt_enable(struct drm_encoder *encoder, bool enable)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 
@@ -1822,7 +1822,7 @@ static void dce_v10_0_vga_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 vga_control;
 
 	vga_control = RREG32(vga_control_regs[amdgpu_crtc->crtc_id]) & ~1;
@@ -1836,7 +1836,7 @@ static void dce_v10_0_grph_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if (enable)
 		WREG32(mmGRPH_ENABLE + amdgpu_crtc->crtc_offset, 1);
@@ -1850,7 +1850,7 @@ static int dce_v10_0_crtc_do_set_base(struct drm_crtc *crtc,
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_framebuffer *target_fb;
 	struct drm_gem_object *obj;
 	struct amdgpu_bo *abo;
@@ -2095,7 +2095,7 @@ static void dce_v10_0_set_interleave(struct drm_crtc *crtc,
 				     struct drm_display_mode *mode)
 {
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	u32 tmp;
 
@@ -2111,7 +2111,7 @@ static void dce_v10_0_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	u16 *r, *g, *b;
 	int i;
 	u32 tmp;
@@ -2250,7 +2250,7 @@ static u32 dce_v10_0_pick_pll(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 pll_in_use;
 	int pll;
 
@@ -2285,7 +2285,7 @@ static u32 dce_v10_0_pick_pll(struct drm_crtc *crtc)
 
 static void dce_v10_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 {
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	uint32_t cur_lock;
 
@@ -2300,7 +2300,7 @@ static void dce_v10_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 static void dce_v10_0_hide_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	u32 tmp;
 
 	tmp = RREG32(mmCUR_CONTROL + amdgpu_crtc->crtc_offset);
@@ -2311,7 +2311,7 @@ static void dce_v10_0_hide_cursor(struct drm_crtc *crtc)
 static void dce_v10_0_show_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	u32 tmp;
 
 	WREG32(mmCUR_SURFACE_ADDRESS_HIGH + amdgpu_crtc->crtc_offset,
@@ -2329,7 +2329,7 @@ static int dce_v10_0_cursor_move_locked(struct drm_crtc *crtc,
 					int x, int y)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	int xorigin = 0, yorigin = 0;
 
 	amdgpu_crtc->cursor_x = x;
@@ -2503,7 +2503,7 @@ static const struct drm_crtc_funcs dce_v10_0_crtc_funcs = {
 static void dce_v10_0_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	unsigned type;
 
@@ -2557,7 +2557,7 @@ static void dce_v10_0_crtc_disable(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_atom_ss ss;
 	int i;
 
@@ -3345,7 +3345,7 @@ dce_v10_0_encoder_mode_set(struct drm_encoder *encoder,
 
 static void dce_v10_0_encoder_prepare(struct drm_encoder *encoder)
 {
-	struct amdgpu_device *adev = encoder->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(encoder->dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
 
@@ -3385,7 +3385,7 @@ static void dce_v10_0_encoder_prepare(struct drm_encoder *encoder)
 static void dce_v10_0_encoder_commit(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	/* need to call this here as we need the crtc set up */
 	amdgpu_atombios_encoder_dpms(encoder, DRM_MODE_DPMS_ON);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 0a6be88ebad9..29407ae183a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -530,7 +530,7 @@ void dce_v11_0_disable_dce(struct amdgpu_device *adev)
 static void dce_v11_0_program_fmt(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(encoder->crtc);
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
@@ -1235,7 +1235,7 @@ static struct amdgpu_audio_pin *dce_v11_0_audio_get_pin(struct amdgpu_device *ad
 
 static void dce_v11_0_afmt_audio_select_pin(struct drm_encoder *encoder)
 {
-	struct amdgpu_device *adev = encoder->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(encoder->dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	u32 tmp;
@@ -1252,7 +1252,7 @@ static void dce_v11_0_audio_write_latency_fields(struct drm_encoder *encoder,
 						struct drm_display_mode *mode)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct drm_connector *connector;
@@ -1298,7 +1298,7 @@ static void dce_v11_0_audio_write_latency_fields(struct drm_encoder *encoder,
 static void dce_v11_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct drm_connector *connector;
@@ -1354,7 +1354,7 @@ static void dce_v11_0_audio_write_speaker_allocation(struct drm_encoder *encoder
 static void dce_v11_0_audio_write_sad_regs(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct drm_connector *connector;
@@ -1525,7 +1525,7 @@ static void dce_v11_0_audio_fini(struct amdgpu_device *adev)
 static void dce_v11_0_afmt_update_ACR(struct drm_encoder *encoder, uint32_t clock)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_afmt_acr acr = amdgpu_afmt_acr(clock);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1561,7 +1561,7 @@ static void dce_v11_0_afmt_update_avi_infoframe(struct drm_encoder *encoder,
 					       void *buffer, size_t size)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	uint8_t *frame = buffer + 3;
@@ -1580,7 +1580,7 @@ static void dce_v11_0_afmt_update_avi_infoframe(struct drm_encoder *encoder,
 static void dce_v11_0_audio_set_dto(struct drm_encoder *encoder, u32 clock)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(encoder->crtc);
@@ -1611,7 +1611,7 @@ static void dce_v11_0_afmt_setmode(struct drm_encoder *encoder,
 				  struct drm_display_mode *mode)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
@@ -1791,7 +1791,7 @@ static void dce_v11_0_afmt_setmode(struct drm_encoder *encoder,
 static void dce_v11_0_afmt_enable(struct drm_encoder *encoder, bool enable)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 
@@ -1864,7 +1864,7 @@ static void dce_v11_0_vga_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 vga_control;
 
 	vga_control = RREG32(vga_control_regs[amdgpu_crtc->crtc_id]) & ~1;
@@ -1878,7 +1878,7 @@ static void dce_v11_0_grph_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if (enable)
 		WREG32(mmGRPH_ENABLE + amdgpu_crtc->crtc_offset, 1);
@@ -1892,7 +1892,7 @@ static int dce_v11_0_crtc_do_set_base(struct drm_crtc *crtc,
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_framebuffer *target_fb;
 	struct drm_gem_object *obj;
 	struct amdgpu_bo *abo;
@@ -2137,7 +2137,7 @@ static void dce_v11_0_set_interleave(struct drm_crtc *crtc,
 				     struct drm_display_mode *mode)
 {
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	u32 tmp;
 
@@ -2153,7 +2153,7 @@ static void dce_v11_0_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	u16 *r, *g, *b;
 	int i;
 	u32 tmp;
@@ -2283,7 +2283,7 @@ static u32 dce_v11_0_pick_pll(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 pll_in_use;
 	int pll;
 
@@ -2364,7 +2364,7 @@ static u32 dce_v11_0_pick_pll(struct drm_crtc *crtc)
 
 static void dce_v11_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 {
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	uint32_t cur_lock;
 
@@ -2379,7 +2379,7 @@ static void dce_v11_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 static void dce_v11_0_hide_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	u32 tmp;
 
 	tmp = RREG32(mmCUR_CONTROL + amdgpu_crtc->crtc_offset);
@@ -2390,7 +2390,7 @@ static void dce_v11_0_hide_cursor(struct drm_crtc *crtc)
 static void dce_v11_0_show_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	u32 tmp;
 
 	WREG32(mmCUR_SURFACE_ADDRESS_HIGH + amdgpu_crtc->crtc_offset,
@@ -2408,7 +2408,7 @@ static int dce_v11_0_cursor_move_locked(struct drm_crtc *crtc,
 					int x, int y)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	int xorigin = 0, yorigin = 0;
 
 	amdgpu_crtc->cursor_x = x;
@@ -2582,7 +2582,7 @@ static const struct drm_crtc_funcs dce_v11_0_crtc_funcs = {
 static void dce_v11_0_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	unsigned type;
 
@@ -2636,7 +2636,7 @@ static void dce_v11_0_crtc_disable(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_atom_ss ss;
 	int i;
 
@@ -2706,7 +2706,7 @@ static int dce_v11_0_crtc_mode_set(struct drm_crtc *crtc,
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if (!amdgpu_crtc->adjusted_clock)
 		return -EINVAL;
@@ -3471,7 +3471,7 @@ dce_v11_0_encoder_mode_set(struct drm_encoder *encoder,
 
 static void dce_v11_0_encoder_prepare(struct drm_encoder *encoder)
 {
-	struct amdgpu_device *adev = encoder->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(encoder->dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
 
@@ -3511,7 +3511,7 @@ static void dce_v11_0_encoder_prepare(struct drm_encoder *encoder)
 static void dce_v11_0_encoder_commit(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	/* need to call this here as we need the crtc set up */
 	amdgpu_atombios_encoder_dpms(encoder, DRM_MODE_DPMS_ON);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index d05c39f9ae40..d6ebeff41677 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -401,7 +401,7 @@ static void dce_v6_0_program_fmt(struct drm_encoder *encoder)
 {
 
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(encoder->crtc);
@@ -1114,7 +1114,7 @@ static struct amdgpu_audio_pin *dce_v6_0_audio_get_pin(struct amdgpu_device *ade
 
 static void dce_v6_0_audio_select_pin(struct drm_encoder *encoder)
 {
-	struct amdgpu_device *adev = encoder->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(encoder->dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 
@@ -1130,7 +1130,7 @@ static void dce_v6_0_audio_write_latency_fields(struct drm_encoder *encoder,
 						struct drm_display_mode *mode)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct drm_connector *connector;
@@ -1174,7 +1174,7 @@ static void dce_v6_0_audio_write_latency_fields(struct drm_encoder *encoder,
 static void dce_v6_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct drm_connector *connector;
@@ -1235,7 +1235,7 @@ static void dce_v6_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 static void dce_v6_0_audio_write_sad_regs(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct drm_connector *connector;
@@ -1392,7 +1392,7 @@ static void dce_v6_0_audio_fini(struct amdgpu_device *adev)
 static void dce_v6_0_audio_set_vbi_packet(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	u32 tmp;
@@ -1408,7 +1408,7 @@ static void dce_v6_0_audio_set_acr(struct drm_encoder *encoder,
 				   uint32_t clock, int bpc)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_afmt_acr acr = amdgpu_afmt_acr(clock);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1446,7 +1446,7 @@ static void dce_v6_0_audio_set_avi_infoframe(struct drm_encoder *encoder,
 					       struct drm_display_mode *mode)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
@@ -1488,7 +1488,7 @@ static void dce_v6_0_audio_set_avi_infoframe(struct drm_encoder *encoder,
 static void dce_v6_0_audio_set_dto(struct drm_encoder *encoder, u32 clock)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(encoder->crtc);
 	int em = amdgpu_atombios_encoder_get_encoder_mode(encoder);
 	u32 tmp;
@@ -1522,7 +1522,7 @@ static void dce_v6_0_audio_set_dto(struct drm_encoder *encoder, u32 clock)
 static void dce_v6_0_audio_set_packet(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	u32 tmp;
@@ -1566,7 +1566,7 @@ static void dce_v6_0_audio_set_packet(struct drm_encoder *encoder)
 static void dce_v6_0_audio_set_mute(struct drm_encoder *encoder, bool mute)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	u32 tmp;
@@ -1579,7 +1579,7 @@ static void dce_v6_0_audio_set_mute(struct drm_encoder *encoder, bool mute)
 static void dce_v6_0_audio_hdmi_enable(struct drm_encoder *encoder, bool enable)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	u32 tmp;
@@ -1616,7 +1616,7 @@ static void dce_v6_0_audio_hdmi_enable(struct drm_encoder *encoder, bool enable)
 static void dce_v6_0_audio_dp_enable(struct drm_encoder *encoder, bool enable)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	u32 tmp;
@@ -1645,7 +1645,7 @@ static void dce_v6_0_afmt_setmode(struct drm_encoder *encoder,
 				  struct drm_display_mode *mode)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct drm_connector *connector;
@@ -1714,7 +1714,7 @@ static void dce_v6_0_afmt_setmode(struct drm_encoder *encoder,
 static void dce_v6_0_afmt_enable(struct drm_encoder *encoder, bool enable)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 
@@ -1788,7 +1788,7 @@ static void dce_v6_0_vga_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 vga_control;
 
 	vga_control = RREG32(vga_control_regs[amdgpu_crtc->crtc_id]) & ~1;
@@ -1799,7 +1799,7 @@ static void dce_v6_0_grph_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	WREG32(mmGRPH_ENABLE + amdgpu_crtc->crtc_offset, enable ? 1 : 0);
 }
@@ -1810,7 +1810,7 @@ static int dce_v6_0_crtc_do_set_base(struct drm_crtc *crtc,
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_framebuffer *target_fb;
 	struct drm_gem_object *obj;
 	struct amdgpu_bo *abo;
@@ -2033,7 +2033,7 @@ static void dce_v6_0_set_interleave(struct drm_crtc *crtc,
 				    struct drm_display_mode *mode)
 {
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
@@ -2048,7 +2048,7 @@ static void dce_v6_0_crtc_load_lut(struct drm_crtc *crtc)
 
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	u16 *r, *g, *b;
 	int i;
 
@@ -2148,7 +2148,7 @@ static u32 dce_v6_0_pick_pll(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 pll_in_use;
 	int pll;
 
@@ -2177,7 +2177,7 @@ static u32 dce_v6_0_pick_pll(struct drm_crtc *crtc)
 
 static void dce_v6_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 {
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	uint32_t cur_lock;
 
@@ -2192,7 +2192,7 @@ static void dce_v6_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 static void dce_v6_0_hide_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 
 	WREG32(mmCUR_CONTROL + amdgpu_crtc->crtc_offset,
 	       (CURSOR_24_8_PRE_MULT << CUR_CONTROL__CURSOR_MODE__SHIFT) |
@@ -2204,7 +2204,7 @@ static void dce_v6_0_hide_cursor(struct drm_crtc *crtc)
 static void dce_v6_0_show_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 
 	WREG32(mmCUR_SURFACE_ADDRESS_HIGH + amdgpu_crtc->crtc_offset,
 	       upper_32_bits(amdgpu_crtc->cursor_addr));
@@ -2222,7 +2222,7 @@ static int dce_v6_0_cursor_move_locked(struct drm_crtc *crtc,
 				       int x, int y)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	int xorigin = 0, yorigin = 0;
 
 	int w = amdgpu_crtc->cursor_width;
@@ -2397,7 +2397,7 @@ static const struct drm_crtc_funcs dce_v6_0_crtc_funcs = {
 static void dce_v6_0_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	unsigned type;
 
@@ -2447,7 +2447,7 @@ static void dce_v6_0_crtc_disable(struct drm_crtc *crtc)
 
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_atom_ss ss;
 	int i;
 
@@ -3146,7 +3146,7 @@ dce_v6_0_encoder_mode_set(struct drm_encoder *encoder,
 static void dce_v6_0_encoder_prepare(struct drm_encoder *encoder)
 {
 
-	struct amdgpu_device *adev = encoder->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(encoder->dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
 
@@ -3187,7 +3187,7 @@ static void dce_v6_0_encoder_commit(struct drm_encoder *encoder)
 {
 
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	/* need to call this here as we need the crtc set up */
 	amdgpu_atombios_encoder_dpms(encoder, DRM_MODE_DPMS_ON);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index ad0f8adb6a2b..48ebe6a786f4 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -444,7 +444,7 @@ void dce_v8_0_disable_dce(struct amdgpu_device *adev)
 static void dce_v8_0_program_fmt(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(encoder->crtc);
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
@@ -1146,7 +1146,7 @@ static struct amdgpu_audio_pin *dce_v8_0_audio_get_pin(struct amdgpu_device *ade
 
 static void dce_v8_0_afmt_audio_select_pin(struct drm_encoder *encoder)
 {
-	struct amdgpu_device *adev = encoder->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(encoder->dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	u32 offset;
@@ -1164,7 +1164,7 @@ static void dce_v8_0_audio_write_latency_fields(struct drm_encoder *encoder,
 						struct drm_display_mode *mode)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct drm_connector *connector;
@@ -1225,7 +1225,7 @@ static void dce_v8_0_audio_write_latency_fields(struct drm_encoder *encoder,
 static void dce_v8_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct drm_connector *connector;
@@ -1278,7 +1278,7 @@ static void dce_v8_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 static void dce_v8_0_audio_write_sad_regs(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	u32 offset;
@@ -1446,7 +1446,7 @@ static void dce_v8_0_audio_fini(struct amdgpu_device *adev)
 static void dce_v8_0_afmt_update_ACR(struct drm_encoder *encoder, uint32_t clock)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_afmt_acr acr = amdgpu_afmt_acr(clock);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1469,7 +1469,7 @@ static void dce_v8_0_afmt_update_avi_infoframe(struct drm_encoder *encoder,
 					       void *buffer, size_t size)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	uint32_t offset = dig->afmt->offset;
@@ -1489,7 +1489,7 @@ static void dce_v8_0_afmt_update_avi_infoframe(struct drm_encoder *encoder,
 static void dce_v8_0_audio_set_dto(struct drm_encoder *encoder, u32 clock)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(encoder->crtc);
@@ -1516,7 +1516,7 @@ static void dce_v8_0_afmt_setmode(struct drm_encoder *encoder,
 				  struct drm_display_mode *mode)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
@@ -1678,7 +1678,7 @@ static void dce_v8_0_afmt_setmode(struct drm_encoder *encoder,
 static void dce_v8_0_afmt_enable(struct drm_encoder *encoder, bool enable)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 
@@ -1751,7 +1751,7 @@ static void dce_v8_0_vga_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 vga_control;
 
 	vga_control = RREG32(vga_control_regs[amdgpu_crtc->crtc_id]) & ~1;
@@ -1765,7 +1765,7 @@ static void dce_v8_0_grph_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if (enable)
 		WREG32(mmGRPH_ENABLE + amdgpu_crtc->crtc_offset, 1);
@@ -1779,7 +1779,7 @@ static int dce_v8_0_crtc_do_set_base(struct drm_crtc *crtc,
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_framebuffer *target_fb;
 	struct drm_gem_object *obj;
 	struct amdgpu_bo *abo;
@@ -2004,7 +2004,7 @@ static void dce_v8_0_set_interleave(struct drm_crtc *crtc,
 				    struct drm_display_mode *mode)
 {
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
@@ -2018,7 +2018,7 @@ static void dce_v8_0_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	u16 *r, *g, *b;
 	int i;
 
@@ -2140,7 +2140,7 @@ static u32 dce_v8_0_pick_pll(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 pll_in_use;
 	int pll;
 
@@ -2188,7 +2188,7 @@ static u32 dce_v8_0_pick_pll(struct drm_crtc *crtc)
 
 static void dce_v8_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 {
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	uint32_t cur_lock;
 
@@ -2203,7 +2203,7 @@ static void dce_v8_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 static void dce_v8_0_hide_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 
 	WREG32(mmCUR_CONTROL + amdgpu_crtc->crtc_offset,
 	       (CURSOR_24_8_PRE_MULT << CUR_CONTROL__CURSOR_MODE__SHIFT) |
@@ -2213,7 +2213,7 @@ static void dce_v8_0_hide_cursor(struct drm_crtc *crtc)
 static void dce_v8_0_show_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 
 	WREG32(mmCUR_SURFACE_ADDRESS_HIGH + amdgpu_crtc->crtc_offset,
 	       upper_32_bits(amdgpu_crtc->cursor_addr));
@@ -2230,7 +2230,7 @@ static int dce_v8_0_cursor_move_locked(struct drm_crtc *crtc,
 				       int x, int y)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	int xorigin = 0, yorigin = 0;
 
 	amdgpu_crtc->cursor_x = x;
@@ -2404,7 +2404,7 @@ static const struct drm_crtc_funcs dce_v8_0_crtc_funcs = {
 static void dce_v8_0_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	unsigned type;
 
@@ -2458,7 +2458,7 @@ static void dce_v8_0_crtc_disable(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_atom_ss ss;
 	int i;
 
@@ -3233,7 +3233,7 @@ dce_v8_0_encoder_mode_set(struct drm_encoder *encoder,
 
 static void dce_v8_0_encoder_prepare(struct drm_encoder *encoder)
 {
-	struct amdgpu_device *adev = encoder->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(encoder->dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
 
@@ -3273,7 +3273,7 @@ static void dce_v8_0_encoder_prepare(struct drm_encoder *encoder)
 static void dce_v8_0_encoder_commit(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	/* need to call this here as we need the crtc set up */
 	amdgpu_atombios_encoder_dpms(encoder, DRM_MODE_DPMS_ON);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
index d5ff7b6331ff..5bc784531e65 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
@@ -132,7 +132,7 @@ static const struct drm_crtc_funcs dce_virtual_crtc_funcs = {
 static void dce_virtual_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
 	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	unsigned type;
 
@@ -697,7 +697,7 @@ static enum hrtimer_restart dce_virtual_vblank_timer_handle(struct hrtimer *vbla
 	struct amdgpu_crtc *amdgpu_crtc = container_of(vblank_timer,
 						       struct amdgpu_crtc, vblank_timer);
 	struct drm_device *ddev = amdgpu_crtc->base.dev;
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 
 	drm_handle_vblank(ddev, amdgpu_crtc->crtc_id);
 	dce_virtual_pageflip(adev, amdgpu_crtc->crtc_id);
diff --git a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
index 0aa1ac1accd6..2eab808fffeb 100644
--- a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
+++ b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
@@ -251,7 +251,7 @@ static ssize_t df_v3_6_get_df_cntr_avail(struct device *dev,
 	int i, count;
 
 	ddev = dev_get_drvdata(dev);
-	adev = ddev->dev_private;
+	adev = drm_to_adev(ddev);
 	count = 0;
 
 	for (i = 0; i < DF_V3_6_MAX_COUNTERS; i++) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3f86a482f2a2..41e6e146e1b9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -544,7 +544,7 @@ static int dm_early_init(void* handle);
 static void amdgpu_dm_fbc_init(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct dm_comressor_info *compressor = &adev->dm.compressor;
 	struct amdgpu_dm_connector *aconn = to_amdgpu_dm_connector(connector);
 	struct drm_display_mode *mode;
@@ -586,7 +586,7 @@ static int amdgpu_dm_audio_component_get_eld(struct device *kdev, int port,
 					  unsigned char *buf, int max_bytes)
 {
 	struct drm_device *dev = dev_get_drvdata(kdev);
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 	struct amdgpu_dm_connector *aconnector;
@@ -625,7 +625,7 @@ static int amdgpu_dm_audio_component_bind(struct device *kdev,
 				       struct device *hda_kdev, void *data)
 {
 	struct drm_device *dev = dev_get_drvdata(kdev);
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_audio_component *acomp = data;
 
 	acomp->ops = &amdgpu_dm_audio_component_ops;
@@ -639,7 +639,7 @@ static void amdgpu_dm_audio_component_unbind(struct device *kdev,
 					  struct device *hda_kdev, void *data)
 {
 	struct drm_device *dev = dev_get_drvdata(kdev);
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_audio_component *acomp = data;
 
 	acomp->ops = NULL;
@@ -2050,7 +2050,7 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 		return;
 
 	conn_base = &aconnector->base;
-	adev = conn_base->dev->dev_private;
+	adev = drm_to_adev(conn_base->dev);
 	dm = &adev->dm;
 	caps = &dm->backlight_caps;
 	caps->ext_caps = &aconnector->dc_link->dpcd_sink_ext_caps;
@@ -2239,7 +2239,7 @@ static void handle_hpd_irq(void *param)
 	struct drm_device *dev = connector->dev;
 	enum dc_connection_type new_connection_type = dc_connection_none;
 #ifdef CONFIG_DRM_AMD_DC_HDCP
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 #endif
 
 	/*
@@ -2372,7 +2372,7 @@ static void handle_hpd_rx_irq(void *param)
 	enum dc_connection_type new_connection_type = dc_connection_none;
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 	union hpd_irq_data hpd_irq_data;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	memset(&hpd_irq_data, 0, sizeof(hpd_irq_data));
 #endif
@@ -2793,7 +2793,7 @@ static int dm_atomic_get_state(struct drm_atomic_state *state,
 			       struct dm_atomic_state **dm_state)
 {
 	struct drm_device *dev = state->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_display_manager *dm = &adev->dm;
 	struct drm_private_state *priv_state;
 
@@ -2813,7 +2813,7 @@ static struct dm_atomic_state *
 dm_atomic_get_new_state(struct drm_atomic_state *state)
 {
 	struct drm_device *dev = state->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_display_manager *dm = &adev->dm;
 	struct drm_private_obj *obj;
 	struct drm_private_state *new_obj_state;
@@ -3460,7 +3460,7 @@ static ssize_t s3_debug_store(struct device *device,
 	int ret;
 	int s3_state;
 	struct drm_device *drm_dev = dev_get_drvdata(device);
-	struct amdgpu_device *adev = drm_dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(drm_dev);
 
 	ret = kstrtoint(buf, 0, &s3_state);
 
@@ -4857,7 +4857,7 @@ static inline int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
 {
 	enum dc_irq_source irq_source;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	int rc;
 
 	irq_source = IRQ_TYPE_VUPDATE + acrtc->otg_inst;
@@ -4873,7 +4873,7 @@ static inline int dm_set_vblank(struct drm_crtc *crtc, bool enable)
 {
 	enum dc_irq_source irq_source;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	struct dm_crtc_state *acrtc_state = to_dm_crtc_state(crtc->state);
 	int rc = 0;
 
@@ -4950,7 +4950,7 @@ int amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
 					    uint64_t val)
 {
 	struct drm_device *dev = connector->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct dm_connector_state *dm_old_state =
 		to_dm_connector_state(connector->state);
 	struct dm_connector_state *dm_new_state =
@@ -5011,7 +5011,7 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
 					    uint64_t *val)
 {
 	struct drm_device *dev = connector->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct dm_connector_state *dm_state =
 		to_dm_connector_state(state);
 	int ret = -EINVAL;
@@ -5067,7 +5067,7 @@ static void amdgpu_dm_connector_destroy(struct drm_connector *connector)
 {
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 	const struct dc_link *link = aconnector->dc_link;
-	struct amdgpu_device *adev = connector->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(connector->dev);
 	struct amdgpu_display_manager *dm = &adev->dm;
 
 #if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) ||\
@@ -5253,7 +5253,7 @@ create_validate_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 				const struct dc_stream_state *old_stream)
 {
 	struct drm_connector *connector = &aconnector->base;
-	struct amdgpu_device *adev = connector->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(connector->dev);
 	struct dc_stream_state *stream;
 	const struct drm_connector_state *drm_state = dm_state ? &dm_state->base : NULL;
 	int requested_bpc = drm_state ? drm_state->max_requested_bpc : 8;
@@ -5530,7 +5530,7 @@ static void dm_update_crtc_active_planes(struct drm_crtc *crtc,
 static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
 				       struct drm_crtc_state *state)
 {
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	struct dc *dc = adev->dm.dc;
 	struct dm_crtc_state *dm_crtc_state = to_dm_crtc_state(state);
 	int ret = -EINVAL;
@@ -5902,7 +5902,7 @@ static int dm_plane_helper_check_state(struct drm_plane_state *state,
 static int dm_plane_atomic_check(struct drm_plane *plane,
 				 struct drm_plane_state *state)
 {
-	struct amdgpu_device *adev = plane->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(plane->dev);
 	struct dc *dc = adev->dm.dc;
 	struct dm_plane_state *dm_plane_state;
 	struct dc_scaling_info scaling_info;
@@ -6377,7 +6377,7 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 				     struct dc_link *link,
 				     int link_index)
 {
-	struct amdgpu_device *adev = dm->ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dm->ddev);
 
 	/*
 	 * Some of the properties below require access to state, like bpc.
@@ -6632,7 +6632,7 @@ static int amdgpu_dm_encoder_init(struct drm_device *dev,
 				  struct amdgpu_encoder *aencoder,
 				  uint32_t link_index)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	int res = drm_encoder_init(dev,
 				   &aencoder->base,
@@ -6817,7 +6817,7 @@ static int get_cursor_position(struct drm_plane *plane, struct drm_crtc *crtc,
 static void handle_cursor_update(struct drm_plane *plane,
 				 struct drm_plane_state *old_plane_state)
 {
-	struct amdgpu_device *adev = plane->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(plane->dev);
 	struct amdgpu_framebuffer *afb = to_amdgpu_framebuffer(plane->state->fb);
 	struct drm_crtc *crtc = afb ? plane->state->crtc : old_plane_state->crtc;
 	struct dm_crtc_state *crtc_state = crtc ? to_dm_crtc_state(crtc->state) : NULL;
@@ -7354,9 +7354,8 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		 * on some ASICs).
 		 */
 		if (dm_old_crtc_state->active_planes != acrtc_state->active_planes)
-			dm_update_pflip_irq_state(
-				(struct amdgpu_device *)dev->dev_private,
-				acrtc_attach);
+			dm_update_pflip_irq_state(drm_to_adev(dev),
+						  acrtc_attach);
 
 		if ((acrtc_state->update_type > UPDATE_TYPE_FAST) &&
 				acrtc_state->stream->link->psr_settings.psr_version != DC_PSR_VERSION_UNSUPPORTED &&
@@ -7386,7 +7385,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 static void amdgpu_dm_commit_audio(struct drm_device *dev,
 				   struct drm_atomic_state *state)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_dm_connector *aconnector;
 	struct drm_connector *connector;
 	struct drm_connector_state *old_con_state, *new_con_state;
@@ -7478,7 +7477,7 @@ static int amdgpu_dm_atomic_commit(struct drm_device *dev,
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int i;
 
 	/*
@@ -7525,7 +7524,7 @@ static int amdgpu_dm_atomic_commit(struct drm_device *dev,
 static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 {
 	struct drm_device *dev = state->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_display_manager *dm = &adev->dm;
 	struct dm_atomic_state *dm_state;
 	struct dc_state *dc_state = NULL, *dc_state_temp = NULL;
@@ -8499,7 +8498,7 @@ static int dm_update_plane_state(struct dc *dc,
 				plane->base.id, new_plane_crtc->base.id);
 
 		ret = fill_dc_plane_attributes(
-			new_plane_crtc->dev->dev_private,
+			drm_to_adev(new_plane_crtc->dev),
 			dc_new_plane_state,
 			new_plane_state,
 			new_crtc_state);
@@ -8597,7 +8596,7 @@ static int add_affected_mst_dsc_crtcs(struct drm_atomic_state *state, struct drm
 static int amdgpu_dm_atomic_check(struct drm_device *dev,
 				  struct drm_atomic_state *state)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct dm_atomic_state *dm_state = NULL;
 	struct dc *dc = adev->dm.dc;
 	struct drm_connector *connector;
@@ -8950,7 +8949,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	struct dm_connector_state *dm_con_state = NULL;
 
 	struct drm_device *dev = connector->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	bool freesync_capable = false;
 
 	if (!connector->state) {
@@ -9164,7 +9163,7 @@ static bool amdgpu_dm_psr_disable_all(struct amdgpu_display_manager *dm)
 
 void amdgpu_dm_trigger_timing_sync(struct drm_device *dev)
 {
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct dc *dc = adev->dm.dc;
 	int i;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index b321ff654df4..5df05f0d18bc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -308,8 +308,7 @@ static int __set_input_tf(struct dc_transfer_func *func,
 int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 {
 	struct dc_stream_state *stream = crtc->stream;
-	struct amdgpu_device *adev =
-		(struct amdgpu_device *)crtc->base.state->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
 	bool has_rom = adev->asic_type <= CHIP_RAVEN;
 	struct drm_color_ctm *ctm = NULL;
 	const struct drm_color_lut *degamma_lut, *regamma_lut;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index eaad9099bc0b..d0699e98db92 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -101,7 +101,7 @@ int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
 					struct dm_crtc_state *dm_crtc_state,
 					enum amdgpu_dm_pipe_crc_source source)
 {
-	struct amdgpu_device *adev = crtc->dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	struct dc_stream_state *stream_state = dm_crtc_state->stream;
 	bool enable = amdgpu_dm_is_valid_crc_source(source);
 	int ret = 0;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 84360f3a0162..1d7b6ba0defa 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -2147,7 +2147,7 @@ static int current_backlight_read(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
 	struct drm_device *dev = node->minor->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_display_manager *dm = &adev->dm;
 
 	unsigned int backlight = dc_link_get_backlight_level(dm->backlight_link);
@@ -2165,7 +2165,7 @@ static int target_backlight_read(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
 	struct drm_device *dev = node->minor->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_display_manager *dm = &adev->dm;
 
 	unsigned int backlight = dc_link_get_target_backlight_pwm(dm->backlight_link);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index fcca4759667e..41df8128125e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -235,7 +235,7 @@ dm_mst_atomic_best_encoder(struct drm_connector *connector,
 			   struct drm_connector_state *connector_state)
 {
 	struct drm_device *dev = connector->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(connector_state->crtc);
 
 	return &adev->dm.mst_encoders[acrtc->crtc_id].base;
@@ -331,7 +331,7 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 {
 	struct amdgpu_dm_connector *master = container_of(mgr, struct amdgpu_dm_connector, mst_mgr);
 	struct drm_device *dev = master->base.dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_dm_connector *aconnector;
 	struct drm_connector *connector;
 	int i;
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 5fc6a9a13096..d01675bf83b4 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -117,7 +117,7 @@ static ssize_t amdgpu_get_power_dpm_state(struct device *dev,
 					  char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	enum amd_pm_state_type pm;
 	int ret;
 
@@ -155,7 +155,7 @@ static ssize_t amdgpu_set_power_dpm_state(struct device *dev,
 					  size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	enum amd_pm_state_type  state;
 	int ret;
 
@@ -261,7 +261,7 @@ static ssize_t amdgpu_get_power_dpm_force_performance_level(struct device *dev,
 							    char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	enum amd_dpm_forced_level level = 0xff;
 	int ret;
 
@@ -302,7 +302,7 @@ static ssize_t amdgpu_set_power_dpm_force_performance_level(struct device *dev,
 							    size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	enum amd_dpm_forced_level level;
 	enum amd_dpm_forced_level current_level = 0xff;
 	int ret = 0;
@@ -407,7 +407,7 @@ static ssize_t amdgpu_get_pp_num_states(struct device *dev,
 		char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	struct pp_states_info data;
 	int i, buf_len, ret;
 
@@ -449,7 +449,7 @@ static ssize_t amdgpu_get_pp_cur_state(struct device *dev,
 		char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	struct pp_states_info data;
 	struct smu_context *smu = &adev->smu;
 	enum amd_pm_state_type pm = 0;
@@ -494,7 +494,7 @@ static ssize_t amdgpu_get_pp_force_state(struct device *dev,
 		char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 
 	if (adev->in_gpu_reset)
 		return -EPERM;
@@ -511,7 +511,7 @@ static ssize_t amdgpu_set_pp_force_state(struct device *dev,
 		size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	enum amd_pm_state_type state = 0;
 	unsigned long idx;
 	int ret;
@@ -572,7 +572,7 @@ static ssize_t amdgpu_get_pp_table(struct device *dev,
 		char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	char *table = NULL;
 	int size, ret;
 
@@ -617,7 +617,7 @@ static ssize_t amdgpu_set_pp_table(struct device *dev,
 		size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	int ret = 0;
 
 	if (adev->in_gpu_reset)
@@ -763,7 +763,7 @@ static ssize_t amdgpu_set_pp_od_clk_voltage(struct device *dev,
 		size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	int ret;
 	uint32_t parameter_size = 0;
 	long parameter[64];
@@ -863,7 +863,7 @@ static ssize_t amdgpu_get_pp_od_clk_voltage(struct device *dev,
 		char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	ssize_t size;
 	int ret;
 
@@ -917,7 +917,7 @@ static ssize_t amdgpu_set_pp_features(struct device *dev,
 				      size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	uint64_t featuremask;
 	int ret;
 
@@ -962,7 +962,7 @@ static ssize_t amdgpu_get_pp_features(struct device *dev,
 				      char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	ssize_t size;
 	int ret;
 
@@ -1023,7 +1023,7 @@ static ssize_t amdgpu_get_pp_dpm_sclk(struct device *dev,
 		char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	ssize_t size;
 	int ret;
 
@@ -1091,7 +1091,7 @@ static ssize_t amdgpu_set_pp_dpm_sclk(struct device *dev,
 		size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	int ret;
 	uint32_t mask = 0;
 
@@ -1127,7 +1127,7 @@ static ssize_t amdgpu_get_pp_dpm_mclk(struct device *dev,
 		char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	ssize_t size;
 	int ret;
 
@@ -1159,7 +1159,7 @@ static ssize_t amdgpu_set_pp_dpm_mclk(struct device *dev,
 		size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	uint32_t mask = 0;
 	int ret;
 
@@ -1195,7 +1195,7 @@ static ssize_t amdgpu_get_pp_dpm_socclk(struct device *dev,
 		char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	ssize_t size;
 	int ret;
 
@@ -1227,7 +1227,7 @@ static ssize_t amdgpu_set_pp_dpm_socclk(struct device *dev,
 		size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	int ret;
 	uint32_t mask = 0;
 
@@ -1265,7 +1265,7 @@ static ssize_t amdgpu_get_pp_dpm_fclk(struct device *dev,
 		char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	ssize_t size;
 	int ret;
 
@@ -1297,7 +1297,7 @@ static ssize_t amdgpu_set_pp_dpm_fclk(struct device *dev,
 		size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	int ret;
 	uint32_t mask = 0;
 
@@ -1335,7 +1335,7 @@ static ssize_t amdgpu_get_pp_dpm_dcefclk(struct device *dev,
 		char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	ssize_t size;
 	int ret;
 
@@ -1367,7 +1367,7 @@ static ssize_t amdgpu_set_pp_dpm_dcefclk(struct device *dev,
 		size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	int ret;
 	uint32_t mask = 0;
 
@@ -1405,7 +1405,7 @@ static ssize_t amdgpu_get_pp_dpm_pcie(struct device *dev,
 		char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	ssize_t size;
 	int ret;
 
@@ -1437,7 +1437,7 @@ static ssize_t amdgpu_set_pp_dpm_pcie(struct device *dev,
 		size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	int ret;
 	uint32_t mask = 0;
 
@@ -1475,7 +1475,7 @@ static ssize_t amdgpu_get_pp_sclk_od(struct device *dev,
 		char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	uint32_t value = 0;
 	int ret;
 
@@ -1505,7 +1505,7 @@ static ssize_t amdgpu_set_pp_sclk_od(struct device *dev,
 		size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	int ret;
 	long int value;
 
@@ -1548,7 +1548,7 @@ static ssize_t amdgpu_get_pp_mclk_od(struct device *dev,
 		char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	uint32_t value = 0;
 	int ret;
 
@@ -1578,7 +1578,7 @@ static ssize_t amdgpu_set_pp_mclk_od(struct device *dev,
 		size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	int ret;
 	long int value;
 
@@ -1641,7 +1641,7 @@ static ssize_t amdgpu_get_pp_power_profile_mode(struct device *dev,
 		char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	ssize_t size;
 	int ret;
 
@@ -1675,7 +1675,7 @@ static ssize_t amdgpu_set_pp_power_profile_mode(struct device *dev,
 {
 	int ret;
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	uint32_t parameter_size = 0;
 	long parameter[64];
 	char *sub_str, buf_cpy[128];
@@ -1746,7 +1746,7 @@ static ssize_t amdgpu_get_gpu_busy_percent(struct device *dev,
 					   char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	int r, value, size = sizeof(value);
 
 	if (adev->in_gpu_reset)
@@ -1784,7 +1784,7 @@ static ssize_t amdgpu_get_mem_busy_percent(struct device *dev,
 					   char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	int r, value, size = sizeof(value);
 
 	if (adev->in_gpu_reset)
@@ -1826,7 +1826,7 @@ static ssize_t amdgpu_get_pcie_bw(struct device *dev,
 		char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	uint64_t count0 = 0, count1 = 0;
 	int ret;
 
@@ -1869,7 +1869,7 @@ static ssize_t amdgpu_get_unique_id(struct device *dev,
 		char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 
 	if (adev->in_gpu_reset)
 		return -EPERM;
@@ -1900,7 +1900,7 @@ static ssize_t amdgpu_get_thermal_throttling_logging(struct device *dev,
 						     char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 
 	return snprintf(buf, PAGE_SIZE, "%s: thermal throttling logging %s, with interval %d seconds\n",
 			adev->ddev->unique,
@@ -1914,7 +1914,7 @@ static ssize_t amdgpu_set_thermal_throttling_logging(struct device *dev,
 						     size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	long throttling_logging_interval;
 	unsigned long flags;
 	int ret = 0;
@@ -1964,7 +1964,7 @@ static ssize_t amdgpu_get_gpu_metrics(struct device *dev,
 				      char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = ddev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(ddev);
 	void *gpu_metrics;
 	ssize_t size = 0;
 	int ret;
@@ -3550,7 +3550,7 @@ static int amdgpu_debugfs_pm_info(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
 	struct drm_device *dev = node->minor->dev;
-	struct amdgpu_device *adev = dev->dev_private;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 flags = 0;
 	int r;
 
-- 
2.28.0.215.g878e727637

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
