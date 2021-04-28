Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100A836DB13
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8FE6EB93;
	Wed, 28 Apr 2021 15:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5252B6EB7D;
 Wed, 28 Apr 2021 15:13:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ciiqqan7NJLs4EJH1m9DvSun83r5Fs/zysZEpq1dFi/XtlO1lLHJ/y4bsEaJh8hJpnNBqOJ9k3RvoZmWpU08qaGcRgyzD278/giPZILCTTU+lYsVockb/FdFWc/zT3Pyz+t/Nlz6k0hDCavLRSi4sdFdKugrvzx7M/C234u1SfyxvvPxoRc+KjXMsoRzDaqq4HDiLhsNOy8PriXr8qA3AbUwYYsJ2Wa2b9xdydL29oZHGebugXdZQwklsEbkAbl4+V+f8dUrPFU2lUv2TW2uT2IGwjxEbyl7LJlH79yglOTxBcnnmpEGS94ufoyn/Nl4990QJKGAghfIgSkKLvjxxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1bAhGv2kWYW8LlbDT5BH+iVENuohJgwHeQDo0+fR6E=;
 b=UUBSPwZzn6F18Cut9KjLK6kmTib4KpnKY7mrV2UArJm7tjE4B4S/Yk+4d1paZOtqWe2bAB8tqx4JXVf6P12JWtvB3nn4+tegbDWwoh834sc88XJHHoSghm/SC/lfZKbkvvJhi2VRrQqcwEW8zmWbITJCCEm/lDNGXhbnFveM3gXXu1fdBWj2hAoAmy1e04/nt/Idhcwf34q1X6sc5CeGNUXoNSAV3jfr4l6CsDZz8za7DmDkM2eoo9HnAERS8qfTj3+XcYkDuL17ZoDf2HAu7HBINpZA18SibXzrQWG3ccPU213+gO6mqTlQqKXErbhgb7gPhMyF0gZqOcC8INdM3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1bAhGv2kWYW8LlbDT5BH+iVENuohJgwHeQDo0+fR6E=;
 b=5GiMn0bgMG0jJCXXXMd1pfobgUaoRYJjp4RbiPn6p/ETCf8EDawYkKBR7X2kRY3Mcd7HZLhQRPodktnUZrP8VEyQoX1etfwQrw0EqLqJDcj3ffHFreIBcAq+tESaqzG/girz4Sv0Z2II+adf1uXKqAeh9I5YawaZQ/VgMmxYmAg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2749.namprd12.prod.outlook.com (2603:10b6:805:6d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Wed, 28 Apr
 2021 15:13:17 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:13:17 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 25/27] drm/amdgpu: Scope all amdgpu queued work with
 drm_dev_enter/exit
Date: Wed, 28 Apr 2021 11:12:05 -0400
Message-Id: <20210428151207.1212258-26-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:13:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63cad74e-bf15-4fc6-5073-08d90a582665
X-MS-TrafficTypeDiagnostic: SN6PR12MB2749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB274988ECFF05FCB15D21DC3AEA409@SN6PR12MB2749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mtAPMZ28dSDSvU8fs+OHMK0RdHsg4e3ixwPEnT6ctujX9K33ybH7oViJj7SzfpsmNA3OyE1bKKPI2Of7W7e+VI0lQPl80qhERan/xwBiMdagIzvP5aHt+XNTK5oYFPvpZipDLIUcY2estqVcwIfONuu/I/qQtfJM0w2bBB5avRKPmmvOaUYl6C15WgGxwy6N/2tfI7h6hTLEf2UUzM/tO/2QKIXYo45qQQZSwhxG55ZcYl1njlsD+wW6BxWDN2PGyM4a1C+K60Hf0C7qKd92lq9yTesfHvMD1DSN2wBaRBd0pdXVCK4VKQnVV4WyGxVB+xmz2dJ1vi/2C+PK5ltU2AndsO9CmN7LTnCQDBScM4c29sKXPzQWzBmNyvHopXsI9d2YRfETaDc9VG32hSO7jpN3BXuL38v/PWGkX3ewNtjXCw2JJxp672oTrJ5hFRzi9RjIJ9oHKl29NOAXfwJRr5pdmfZHc6X3AEBu0J2Y1O8Y3zaA1u/D0K4k05IzRFcTgwmngtzxMKRvx0rGZ24xwEdQZr/UeVber80cIPuKkwADa9kr4HaeijOR3rdfiiEIJglmaBz6osLWpxnRjt9gwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(16526019)(6666004)(6512007)(2616005)(1076003)(2906002)(30864003)(6636002)(66556008)(186003)(86362001)(5660300002)(8936002)(83380400001)(6486002)(478600001)(44832011)(38100700002)(66946007)(52116002)(6506007)(66476007)(8676002)(4326008)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?px8v/VbXivvcQlXeFlAcA46sthe5KYjJbgCFvyzFwQi2oblc+K9LQGss6fwl?=
 =?us-ascii?Q?8vHvrpJYR1/Kg0T94LAkSopkaZlEKtpHdcu9nR1hqc2ER6PFjQLS9DmJDKOo?=
 =?us-ascii?Q?OSQjJtOTZh0xfTjzmQ+Wlz4GuODZJTRHHv4aQraN2MKMjcRXRQ8yHHmPDIiq?=
 =?us-ascii?Q?K3PMvLC6pBQyvWbOBWhidS59w19/VIz+xl71rQrdWSCP4Ijv/g/lR/+FLuSn?=
 =?us-ascii?Q?0VsYS4fabj1Sj6Rvm35TVQPHU3Pfk1w2Fbm2oT23kAxs523eFfE4wHxyNuNk?=
 =?us-ascii?Q?CUNReA4LE+CpAItcFu1wLR98TqQDJP80um9KWghjWHgOS2ofzXM0rEUCxGmR?=
 =?us-ascii?Q?QisDtwo7Q/Q1xb8Sj20fjmYVSF0AO1lENXq+EQrFKhJUwQddeem9Of/NZYWM?=
 =?us-ascii?Q?ckWO7a9900pTJL7tRVvY+uAg9tpT19hVNzo+n+/EvWuMdQvi5iU9QZ/YfAaL?=
 =?us-ascii?Q?IJ0q2jOodXaobP19NpaI6H7FpjC0o8VbKIANHAT085+tsTmeaMemX5540V0h?=
 =?us-ascii?Q?Mc/UCvsTPo5x35R4pyFkcmAvXShokhCS1I/pNs+WoMFScmfo5iTxPtv7PFXb?=
 =?us-ascii?Q?RVjKhWJatfR3QOqLcEphgsP5fV922HZ6kOYlS0aRnHOEU2Hs1oMxOfDqb5b3?=
 =?us-ascii?Q?MNWXMSOrCkTSjoFhRW1FGhpPo0eGyrI9Q4rPu6jay7a0JQnCImq7GuiVF30g?=
 =?us-ascii?Q?AF9Co+4XEGnhgqGstbRbpVNuAoCrmMZSr414U/PMkxBdVFref5lvBnr8AHiQ?=
 =?us-ascii?Q?pkFQV07rCL6NPM2T+BaeQZP0Mw7gFVU0uRRZhvVhmiXapz1zgARm/Hf05cey?=
 =?us-ascii?Q?4m9BoIVE5njim528ojMcHnhFOzTHc9SXs2CJWy19ImnfZDmtLiuHV/AWWvsg?=
 =?us-ascii?Q?rrEhH/abi7SCj9vX09r5WWud3JCp7yCDXr1v8A2tAkJECVsbulxB/5YoMNo7?=
 =?us-ascii?Q?A2so+aBjVYWnRJ/tXxIuOioL8ysHXlnxKwhqxqxlXzKflO/PwRCyTrk2TUUW?=
 =?us-ascii?Q?8blRqpHRMfF90wOPhKAAarLkaANL0fzMmgXvObqj5mbz1j1oD8DtqrcBmcxS?=
 =?us-ascii?Q?J86WlpRXfYLX0i6Tp13Wk5SpK8jNCkPcTyX6jEHmNwGAYN/xLqNuT2S/y5FZ?=
 =?us-ascii?Q?u7145U0hmXzG87gHfDuZf/w4qh4anqCl6GiNO1n0FPQrWjUQbEdG8ASv5gtk?=
 =?us-ascii?Q?rwJ2TkcgZAbd1+cdL3fxCsX0PRdOvrezGGnRVSo5iBKBT83xuKQscbshRLJ0?=
 =?us-ascii?Q?ukpKdeoFQhkY1twFa9vKXnOU/OCzbrWZ6hx1FHCJ8oUitVcC/p0vEGBoiEsd?=
 =?us-ascii?Q?KjbPssHihFCps4SymwMpegdaGHZOBOYaWn9vOT/Q/xRft+3bWRmbC94jU4u4?=
 =?us-ascii?Q?td4WLlk+2010moN5xt484cxl564r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63cad74e-bf15-4fc6-5073-08d90a582665
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:13:16.8838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ceq+4tNQ8FWDgtIMolQZqjUO9VQGDRiK04kAhy/Mavc0ivZmXTQZWUc6FuPw1oxBry7JCOuIREc5Po/KGkyb0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2749
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To allow completion and further block of HW accesses post device PCI
remove.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 11 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 29 ++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    | 26 +++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c   | 28 ++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c    | 55 ++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c    | 43 ++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c    | 30 ++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c    | 61 ++++++++++++----------
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c      | 10 +++-
 9 files changed, 189 insertions(+), 104 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 9edb35ba181b..f942496c2b35 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -30,6 +30,7 @@
 #include <linux/dma-buf.h>
 #include "amdgpu_xgmi.h"
 #include <uapi/linux/kfd_ioctl.h>
+#include <drm/drm_drv.h>
 
 /* Total memory size in system memory and all GPU VRAM. Used to
  * estimate worst case amount of memory to reserve for page tables
@@ -223,9 +224,15 @@ int amdgpu_amdkfd_post_reset(struct amdgpu_device *adev)
 void amdgpu_amdkfd_gpu_reset(struct kgd_dev *kgd)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)kgd;
+	int idx;
 
-	if (amdgpu_device_should_recover_gpu(adev))
-		amdgpu_device_gpu_recover(adev, NULL);
+	if (drm_dev_enter(&adev->ddev, &idx)) {
+
+		if (amdgpu_device_should_recover_gpu(adev))
+			amdgpu_device_gpu_recover(adev, NULL);
+
+		drm_dev_exit(idx);
+	}
 }
 
 int amdgpu_amdkfd_alloc_gtt_mem(struct kgd_dev *kgd, size_t size,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 55afc11c17e6..c30e0b0596a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2674,24 +2674,35 @@ static void amdgpu_device_delayed_init_work_handler(struct work_struct *work)
 {
 	struct amdgpu_device *adev =
 		container_of(work, struct amdgpu_device, delayed_init_work.work);
-	int r;
+	int r, idx;
 
-	r = amdgpu_ib_ring_tests(adev);
-	if (r)
-		DRM_ERROR("ib ring test failed (%d).\n", r);
+	if (drm_dev_enter(&adev->ddev, &idx)) {
+		r = amdgpu_ib_ring_tests(adev);
+		if (r)
+			DRM_ERROR("ib ring test failed (%d).\n", r);
+
+		drm_dev_exit(idx);
+	}
 }
 
 static void amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
 {
 	struct amdgpu_device *adev =
 		container_of(work, struct amdgpu_device, gfx.gfx_off_delay_work.work);
+	int idx;
+
+	if (drm_dev_enter(&adev->ddev, &idx)) {
+
+		mutex_lock(&adev->gfx.gfx_off_mutex);
+		if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
+			if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, true))
+				adev->gfx.gfx_off_state = true;
+		}
+		mutex_unlock(&adev->gfx.gfx_off_mutex);
+
+		drm_dev_exit(idx);
 
-	mutex_lock(&adev->gfx.gfx_off_mutex);
-	if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
-		if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, true))
-			adev->gfx.gfx_off_state = true;
 	}
-	mutex_unlock(&adev->gfx.gfx_off_mutex);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index a922154953a7..5eda0d0fc974 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -188,8 +188,15 @@ static void amdgpu_irq_handle_ih1(struct work_struct *work)
 {
 	struct amdgpu_device *adev = container_of(work, struct amdgpu_device,
 						  irq.ih1_work);
+	int idx;
 
-	amdgpu_ih_process(adev, &adev->irq.ih1);
+	if (drm_dev_enter(&adev->ddev, &idx)) {
+
+		amdgpu_ih_process(adev, &adev->irq.ih1);
+
+		drm_dev_exit(idx);
+
+	}
 }
 
 /**
@@ -203,8 +210,14 @@ static void amdgpu_irq_handle_ih2(struct work_struct *work)
 {
 	struct amdgpu_device *adev = container_of(work, struct amdgpu_device,
 						  irq.ih2_work);
+	int idx;
+
+	if (drm_dev_enter(&adev->ddev, &idx)) {
+
+		amdgpu_ih_process(adev, &adev->irq.ih2);
 
-	amdgpu_ih_process(adev, &adev->irq.ih2);
+		drm_dev_exit(idx);
+	}
 }
 
 /**
@@ -218,8 +231,15 @@ static void amdgpu_irq_handle_ih_soft(struct work_struct *work)
 {
 	struct amdgpu_device *adev = container_of(work, struct amdgpu_device,
 						  irq.ih_soft_work);
+	int idx;
+
+	if (drm_dev_enter(&adev->ddev, &idx)) {
+
+		amdgpu_ih_process(adev, &adev->irq.ih_soft);
 
-	amdgpu_ih_process(adev, &adev->irq.ih_soft);
+		drm_dev_exit(idx);
+
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
index 8996cb4ed57a..1e8fd66c1e43 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
@@ -29,6 +29,7 @@
 #include "amdgpu_pm.h"
 #include "soc15d.h"
 #include "soc15_common.h"
+#include <drm/drm_drv.h>
 
 #define JPEG_IDLE_TIMEOUT	msecs_to_jiffies(1000)
 
@@ -78,20 +79,25 @@ static void amdgpu_jpeg_idle_work_handler(struct work_struct *work)
 	struct amdgpu_device *adev =
 		container_of(work, struct amdgpu_device, jpeg.idle_work.work);
 	unsigned int fences = 0;
-	unsigned int i;
+	unsigned int i, idx;
 
-	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
-		if (adev->jpeg.harvest_config & (1 << i))
-			continue;
+	if (drm_dev_enter(&adev->ddev, &idx)) {
 
-		fences += amdgpu_fence_count_emitted(&adev->jpeg.inst[i].ring_dec);
-	}
+		for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
+			if (adev->jpeg.harvest_config & (1 << i))
+				continue;
 
-	if (!fences && !atomic_read(&adev->jpeg.total_submission_cnt))
-		amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK_TYPE_JPEG,
-						       AMD_PG_STATE_GATE);
-	else
-		schedule_delayed_work(&adev->jpeg.idle_work, JPEG_IDLE_TIMEOUT);
+			fences += amdgpu_fence_count_emitted(&adev->jpeg.inst[i].ring_dec);
+		}
+
+		if (!fences && !atomic_read(&adev->jpeg.total_submission_cnt))
+			amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK_TYPE_JPEG,
+							       AMD_PG_STATE_GATE);
+		else
+			schedule_delayed_work(&adev->jpeg.idle_work, JPEG_IDLE_TIMEOUT);
+
+		drm_dev_exit(idx);
+	}
 }
 
 void amdgpu_jpeg_ring_begin_use(struct amdgpu_ring *ring)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index c0a16eac4923..97a6c028ac74 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -27,6 +27,7 @@
 #include <linux/uaccess.h>
 #include <linux/reboot.h>
 #include <linux/syscalls.h>
+#include <drm/drm_drv.h>
 
 #include "amdgpu.h"
 #include "amdgpu_ras.h"
@@ -1334,7 +1335,15 @@ static void amdgpu_ras_interrupt_process_handler(struct work_struct *work)
 	struct ras_manager *obj =
 		container_of(data, struct ras_manager, ih_data);
 
-	amdgpu_ras_interrupt_handler(obj);
+	int idx;
+
+	if (drm_dev_enter(&obj->adev->ddev, &idx)) {
+
+		amdgpu_ras_interrupt_handler(obj);
+
+		drm_dev_exit(idx);
+
+	}
 }
 
 int amdgpu_ras_interrupt_dispatch(struct amdgpu_device *adev,
@@ -1565,31 +1574,37 @@ static void amdgpu_ras_do_recovery(struct work_struct *work)
 	struct amdgpu_device *remote_adev = NULL;
 	struct amdgpu_device *adev = ras->adev;
 	struct list_head device_list, *device_list_handle =  NULL;
+	int idx;
 
-	if (!ras->disable_ras_err_cnt_harvest) {
-		struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev);
+	if (drm_dev_enter(&adev->ddev, &idx)) {
 
-		/* Build list of devices to query RAS related errors */
-		if  (hive && adev->gmc.xgmi.num_physical_nodes > 1) {
-			device_list_handle = &hive->device_list;
-		} else {
-			INIT_LIST_HEAD(&device_list);
-			list_add_tail(&adev->gmc.xgmi.head, &device_list);
-			device_list_handle = &device_list;
-		}
+		if (!ras->disable_ras_err_cnt_harvest) {
+			struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev);
 
-		list_for_each_entry(remote_adev,
-				device_list_handle, gmc.xgmi.head) {
-			amdgpu_ras_query_err_status(remote_adev);
-			amdgpu_ras_log_on_err_counter(remote_adev);
+			/* Build list of devices to query RAS related errors */
+			if  (hive && adev->gmc.xgmi.num_physical_nodes > 1) {
+				device_list_handle = &hive->device_list;
+			} else {
+				INIT_LIST_HEAD(&device_list);
+				list_add_tail(&adev->gmc.xgmi.head, &device_list);
+				device_list_handle = &device_list;
+			}
+
+			list_for_each_entry(remote_adev,
+					device_list_handle, gmc.xgmi.head) {
+				amdgpu_ras_query_err_status(remote_adev);
+				amdgpu_ras_log_on_err_counter(remote_adev);
+			}
+
+			amdgpu_put_xgmi_hive(hive);
 		}
 
-		amdgpu_put_xgmi_hive(hive);
-	}
+		if (amdgpu_device_should_recover_gpu(ras->adev))
+			amdgpu_device_gpu_recover(ras->adev, NULL);
+		atomic_set(&ras->in_recovery, 0);
 
-	if (amdgpu_device_should_recover_gpu(ras->adev))
-		amdgpu_device_gpu_recover(ras->adev, NULL);
-	atomic_set(&ras->in_recovery, 0);
+		drm_dev_exit(idx);
+	}
 }
 
 /* alloc/realloc bps array */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index df47f5ffa08f..19790afd2893 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -1234,29 +1234,36 @@ static void amdgpu_uvd_idle_work_handler(struct work_struct *work)
 	struct amdgpu_device *adev =
 		container_of(work, struct amdgpu_device, uvd.idle_work.work);
 	unsigned fences = 0, i, j;
+	int idx;
 
-	for (i = 0; i < adev->uvd.num_uvd_inst; ++i) {
-		if (adev->uvd.harvest_config & (1 << i))
-			continue;
-		fences += amdgpu_fence_count_emitted(&adev->uvd.inst[i].ring);
-		for (j = 0; j < adev->uvd.num_enc_rings; ++j) {
-			fences += amdgpu_fence_count_emitted(&adev->uvd.inst[i].ring_enc[j]);
+	if (drm_dev_enter(&adev->ddev, &idx)) {
+
+		for (i = 0; i < adev->uvd.num_uvd_inst; ++i) {
+			if (adev->uvd.harvest_config & (1 << i))
+				continue;
+			fences += amdgpu_fence_count_emitted(&adev->uvd.inst[i].ring);
+			for (j = 0; j < adev->uvd.num_enc_rings; ++j) {
+				fences += amdgpu_fence_count_emitted(&adev->uvd.inst[i].ring_enc[j]);
+			}
 		}
-	}
 
-	if (fences == 0) {
-		if (adev->pm.dpm_enabled) {
-			amdgpu_dpm_enable_uvd(adev, false);
+		if (fences == 0) {
+			if (adev->pm.dpm_enabled) {
+				amdgpu_dpm_enable_uvd(adev, false);
+			} else {
+				amdgpu_asic_set_uvd_clocks(adev, 0, 0);
+				/* shutdown the UVD block */
+				amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK_TYPE_UVD,
+								       AMD_PG_STATE_GATE);
+				amdgpu_device_ip_set_clockgating_state(adev, AMD_IP_BLOCK_TYPE_UVD,
+								       AMD_CG_STATE_GATE);
+			}
 		} else {
-			amdgpu_asic_set_uvd_clocks(adev, 0, 0);
-			/* shutdown the UVD block */
-			amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK_TYPE_UVD,
-							       AMD_PG_STATE_GATE);
-			amdgpu_device_ip_set_clockgating_state(adev, AMD_IP_BLOCK_TYPE_UVD,
-							       AMD_CG_STATE_GATE);
+			schedule_delayed_work(&adev->uvd.idle_work, UVD_IDLE_TIMEOUT);
 		}
-	} else {
-		schedule_delayed_work(&adev->uvd.idle_work, UVD_IDLE_TIMEOUT);
+
+		drm_dev_exit(idx);
+
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index 833203401ef4..81ad937936bb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -340,22 +340,28 @@ static void amdgpu_vce_idle_work_handler(struct work_struct *work)
 	struct amdgpu_device *adev =
 		container_of(work, struct amdgpu_device, vce.idle_work.work);
 	unsigned i, count = 0;
+	int idx;
 
-	for (i = 0; i < adev->vce.num_rings; i++)
-		count += amdgpu_fence_count_emitted(&adev->vce.ring[i]);
+	if (drm_dev_enter(&adev->ddev, &idx)) {
 
-	if (count == 0) {
-		if (adev->pm.dpm_enabled) {
-			amdgpu_dpm_enable_vce(adev, false);
+		for (i = 0; i < adev->vce.num_rings; i++)
+			count += amdgpu_fence_count_emitted(&adev->vce.ring[i]);
+
+		if (count == 0) {
+			if (adev->pm.dpm_enabled) {
+				amdgpu_dpm_enable_vce(adev, false);
+			} else {
+				amdgpu_asic_set_vce_clocks(adev, 0, 0);
+				amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK_TYPE_VCE,
+								       AMD_PG_STATE_GATE);
+				amdgpu_device_ip_set_clockgating_state(adev, AMD_IP_BLOCK_TYPE_VCE,
+								       AMD_CG_STATE_GATE);
+			}
 		} else {
-			amdgpu_asic_set_vce_clocks(adev, 0, 0);
-			amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK_TYPE_VCE,
-							       AMD_PG_STATE_GATE);
-			amdgpu_device_ip_set_clockgating_state(adev, AMD_IP_BLOCK_TYPE_VCE,
-							       AMD_CG_STATE_GATE);
+			schedule_delayed_work(&adev->vce.idle_work, VCE_IDLE_TIMEOUT);
 		}
-	} else {
-		schedule_delayed_work(&adev->vce.idle_work, VCE_IDLE_TIMEOUT);
+
+		drm_dev_exit(idx);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index b42db22761b8..0e7404653ac5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -342,42 +342,47 @@ static void amdgpu_vcn_idle_work_handler(struct work_struct *work)
 		container_of(work, struct amdgpu_device, vcn.idle_work.work);
 	unsigned int fences = 0, fence[AMDGPU_MAX_VCN_INSTANCES] = {0};
 	unsigned int i, j;
-	int r = 0;
+	int idx, r = 0;
 
-	for (j = 0; j < adev->vcn.num_vcn_inst; ++j) {
-		if (adev->vcn.harvest_config & (1 << j))
-			continue;
+	if (drm_dev_enter(&adev->ddev, &idx)) {
 
-		for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
-			fence[j] += amdgpu_fence_count_emitted(&adev->vcn.inst[j].ring_enc[i]);
-		}
+		for (j = 0; j < adev->vcn.num_vcn_inst; ++j) {
+			if (adev->vcn.harvest_config & (1 << j))
+				continue;
 
-		if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)	{
-			struct dpg_pause_state new_state;
+			for (i = 0; i < adev->vcn.num_enc_rings; ++i)
+				fence[j] += amdgpu_fence_count_emitted(&adev->vcn.inst[j].ring_enc[i]);
 
-			if (fence[j] ||
-				unlikely(atomic_read(&adev->vcn.inst[j].dpg_enc_submission_cnt)))
-				new_state.fw_based = VCN_DPG_STATE__PAUSE;
-			else
-				new_state.fw_based = VCN_DPG_STATE__UNPAUSE;
+			if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)	{
+				struct dpg_pause_state new_state;
+
+				if (fence[j] ||
+					unlikely(atomic_read(&adev->vcn.inst[j].dpg_enc_submission_cnt)))
+					new_state.fw_based = VCN_DPG_STATE__PAUSE;
+				else
+					new_state.fw_based = VCN_DPG_STATE__UNPAUSE;
 
-			adev->vcn.pause_dpg_mode(adev, j, &new_state);
+				adev->vcn.pause_dpg_mode(adev, j, &new_state);
+			}
+
+			fence[j] += amdgpu_fence_count_emitted(&adev->vcn.inst[j].ring_dec);
+			fences += fence[j];
 		}
 
-		fence[j] += amdgpu_fence_count_emitted(&adev->vcn.inst[j].ring_dec);
-		fences += fence[j];
-	}
+		if (!fences && !atomic_read(&adev->vcn.total_submission_cnt)) {
+			amdgpu_gfx_off_ctrl(adev, true);
+			amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK_TYPE_VCN,
+			       AMD_PG_STATE_GATE);
+			r = amdgpu_dpm_switch_power_profile(adev, PP_SMC_POWER_PROFILE_VIDEO,
+					false);
+			if (r)
+				dev_warn(adev->dev, "(%d) failed to disable video power profile mode\n", r);
+		} else {
+			schedule_delayed_work(&adev->vcn.idle_work, VCN_IDLE_TIMEOUT);
+		}
+
+		drm_dev_exit(idx);
 
-	if (!fences && !atomic_read(&adev->vcn.total_submission_cnt)) {
-		amdgpu_gfx_off_ctrl(adev, true);
-		amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK_TYPE_VCN,
-		       AMD_PG_STATE_GATE);
-		r = amdgpu_dpm_switch_power_profile(adev, PP_SMC_POWER_PROFILE_VIDEO,
-				false);
-		if (r)
-			dev_warn(adev->dev, "(%d) failed to disable video power profile mode\n", r);
-	} else {
-		schedule_delayed_work(&adev->vcn.idle_work, VCN_IDLE_TIMEOUT);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 84d2eaa38101..4799290e5625 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -57,6 +57,8 @@
 
 #include "ivsrcid/ivsrcid_vislands30.h"
 
+#include <drm/drm_drv.h>
+
 #define GFX8_NUM_GFX_RINGS     1
 #define GFX8_MEC_HPD_SIZE 4096
 
@@ -6793,8 +6795,14 @@ static void gfx_v8_0_sq_irq_work_func(struct work_struct *work)
 
 	struct amdgpu_device *adev = container_of(work, struct amdgpu_device, gfx.sq_work.work);
 	struct sq_work *sq_work = container_of(work, struct sq_work, work);
+	int idx;
+
+	if (drm_dev_enter(&adev->ddev, &idx)) {
 
-	gfx_v8_0_parse_sq_irq(adev, sq_work->ih_data);
+		gfx_v8_0_parse_sq_irq(adev, sq_work->ih_data);
+
+		drm_dev_exit(idx);
+	}
 }
 
 static int gfx_v8_0_sq_irq(struct amdgpu_device *adev,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
