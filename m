Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8B82FAC17
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 22:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BDC6E5AE;
	Mon, 18 Jan 2021 21:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750044.outbound.protection.outlook.com [40.107.75.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4B66E5AB;
 Mon, 18 Jan 2021 21:02:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRzlpz+nQ60WgztlPl4NeNoIcRGx5tE6y49l/wofBoY0bwZ3PK2Ax2xrAG3uB2oZo2MwSghyFs04c/vHe8HkXQYIrvS5thf5VBg1ZhwGqGXl6sj5TEugb0g0l+nAfQlzJewIS107eIb7h5hka0+6WV02MhxW4jfwx96+Pk+Advq92hhuMVXHFPCZeMdrrp9lbzMRblTFCLY/M+YiBzRCt+Uv2dB3972ivjZ9P7dKoWrbBlkpqXGUO/3tq0AnzX3r5spjMQy7Mjm0VGn2Fc3tcTpVn5MQQq6KZFYcs5GZgdoXcIQ5bLLJ7DodJXV7ntE/IxHuhzAqAuC/LVAOwEVaeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LU/u1XRXyCv7y9tC+X+LdprijnnjsfvBr5Voq81hyEo=;
 b=hohpmb5e8AQmEbf0SHnxDSO0Puz4TIZr2KuaOKAj5F4EB1f307c8dx7UexHzU6jOrXlSZtDj3ddFlrOETd01kXFnJxEjBD0ykZHkBVsgPYZ4NcnJ/jUZd7TEBX9DR1W/XQT8sKjGeTYbp0+CRJBUbVZZX44rWbhO8zdes3LWkEl11ndmmsgbkHPJlBkN6llu9ju/rOpiA47VbYzymSJD88Gb6ZY2fk9kKgJBtSWc6/wwOMOU0VNMNtysz0DEi1R/jLAufaYiV9/OG5fAYLwQwGyAmqwdq+/ZZa/ZJIl/YiSiiOUprFZLMSyE8k4H6z5bCs4n+X4+HfXPq9Myg/p49w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LU/u1XRXyCv7y9tC+X+LdprijnnjsfvBr5Voq81hyEo=;
 b=I7Lp4MJ1n7CZVySUHv+R2c1C1VT4kVYF738ohyRtrcQRMF3eB9diEkRazvqvLgjnuDBAL1ufiaC+bsxGzQIjB1qfRlpYlbnG+Pn1gSKl6lo9/XUW2ddWZ6JDzK++G7RyfzaXKdI/6HYa9AzdAgqYF+IbPBp41+t+NAzb0picSGc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4767.namprd12.prod.outlook.com (2603:10b6:805:e5::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 21:02:31 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 21:02:31 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ckoenig.leichtzumerken@gmail.com, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
Subject: [PATCH v4 06/14] drm/amdgpu: Add early fini callback
Date: Mon, 18 Jan 2021 16:01:15 -0500
Message-Id: <1611003683-3534-7-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:84d3:21cc:478c:efa7]
X-ClientProxiedBy: YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::33) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu-1604-test.hitronhub.home
 (2607:fea8:3edf:49b0:84d3:21cc:478c:efa7) by
 YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3763.9 via Frontend Transport; Mon, 18 Jan 2021 21:02:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1757c35b-5af8-420c-0e38-08d8bbf45ed4
X-MS-TrafficTypeDiagnostic: SN6PR12MB4767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4767C894735E7F45090FCD9FEAA40@SN6PR12MB4767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hTaH+HSWt147dOlwzW2H5RT2NeLSug8cHEhCJtN4MFzXuK7gibbqinKaozsbB6bqcBmNKlbmxxx3uPIR5aSC/JO8UeYuJxtlsD4W+WJTELfEJ2lU/Lqewi2xAbRDiW5BOC9NDq18VuNNTJbRGnmewIkpe9GJfg9doe8XflJy20VCjwugxK9w5zkM+7ml5deO+DFKcGeJV0NITqjG+CBMyDknrJ3G7hTBkk8znvo8D4bwVOTQ8NVHjJI3+jkfJ2xPErST4UH6uBYxyZJ93pnGSzPphJbt6N/21dH3ZygmcJnlD2IPGQm2Ut2TJ9TMH+e+i8rACX6ohR9vhTMIk9x0SB705TRl4bf4Zy5TQaI7LhMSDRVvMaczY9topWOrEQjv56nX6jDie8GqBDsXmRjfpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(86362001)(66946007)(6666004)(83380400001)(44832011)(8936002)(66556008)(316002)(6512007)(6486002)(36756003)(2616005)(66476007)(6506007)(4326008)(478600001)(5660300002)(7416002)(2906002)(52116002)(16526019)(8676002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?i76KWX+3rmBQqjfgu3lN8boYaJEcH5r6wlsGpDtXe/Aw0MFo9PPQqkKTCDbp?=
 =?us-ascii?Q?tyokGZesDTjQ6pEFp2XGB82yP/8M2MOkeoNT+bHtAntPL1vZZM/jYE6FkMWa?=
 =?us-ascii?Q?amuuCWmw2EB2/it5vPo0HqENrmBqGV1iRPoHx29xMEg6mqgONS9PrNSRgzMS?=
 =?us-ascii?Q?MkxksH7bhqqr2iUPUFYRRAA12UYPLkgOene12YsoAk4LP3Y4YJoGam/zRPP+?=
 =?us-ascii?Q?sMOH7NuiL8c70jNPQlt/NRj+DO9amMNoA/qYTG+CAwOwTHxLk5AKFz6KIwa5?=
 =?us-ascii?Q?y2n7+87a1NDvD6LRF9Ah9uqx/sahJZlcmfRJJipv4hNEu83WZnEhY/1yM2Q9?=
 =?us-ascii?Q?VBejeucktdolnmv9hkoLydM40gdASR1DxyYoH3/VoQJtXbXBubDdcDOnI32I?=
 =?us-ascii?Q?X/vufHRqV4v2OLVLPEkfGtRrkwk6GpFoRP0S6w4VuNcV/ZmogqBlHc3N5uzi?=
 =?us-ascii?Q?Ij9DThuRxgWpp4gG0UoJJcjecVRmD0eYAj8+Kcf4nOjBrqUNkf7PcLbUfRSo?=
 =?us-ascii?Q?4QEAA9/KPbmJYW/l0s4Endj/oJXdgknQ8omSPbdbosEvViDHreXyc5IHgTUY?=
 =?us-ascii?Q?3d58mIoqfRJ7DDxIDNLcYSkczNV2m0rKLzRkoAP681yHuRvF3XSPrzj1kTBG?=
 =?us-ascii?Q?VV6TlRbQA4VAKiOq6dItgy/n/I1+wwbUnxISCezqyNs01VqktX//9CJEL5Cw?=
 =?us-ascii?Q?gwrPCEISAeUWqTiaBEU4ZalG9fGBN2kBkNlTFRavxpoxdt82WgyXJzCP0y0r?=
 =?us-ascii?Q?Y5cUxwXk8qj6Gq2ZpFyb0fNQcY4+cv5cOHxzwqvtiBV5Qj2UlAaGjKEb/6AU?=
 =?us-ascii?Q?DaL9g8Q+y2eJWuiKK6+imyvQICRy9jSg3dVK3EIWgkiYe7jJZMwp+H5KzH7T?=
 =?us-ascii?Q?d6N0alGDByhX0VfwAFxHnWmMc9oerS2rP8A9STr/nVZZAFSXamojlcT0zxrL?=
 =?us-ascii?Q?vRE+qb4qXp+gowChO9wk4rY5RjQ/TMSltOf2wDvbxwGblMuvsXTa2gJ1YQFf?=
 =?us-ascii?Q?YxAdP5JelenEax++kD5wxLkYzktvSdjRqTrbeSqxrmqUaKHpbpx41TPV/K+U?=
 =?us-ascii?Q?G5725Tk9UNRVFbSGBSsZZ5PYGAaVaJE+mvHrjV+GGUwHbB6LW5VzEohMtnYE?=
 =?us-ascii?Q?Tf7Qmo2w/Ak9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1757c35b-5af8-420c-0e38-08d8bbf45ed4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 21:02:31.2273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hePAWrkL/sXQf4tTHy+jdjqMUf5HdQJd3I55aoZVRaQH5c0A1IyNkxgVlyNN7+NSO8erAXlyzapK9gTRelvfDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4767
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use it to call disply code dependent on device->drv_data
before it's set to NULL on device unplug

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 20 ++++++++++++++++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 ++++++++++--
 drivers/gpu/drm/amd/include/amd_shared.h          |  2 ++
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 90c8353..45e23e3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2529,6 +2529,24 @@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
 	return 0;
 }
 
+static int amdgpu_device_ip_fini_early(struct amdgpu_device *adev)
+{
+	int i, r;
+
+	for (i = 0; i < adev->num_ip_blocks; i++) {
+		if (!adev->ip_blocks[i].version->funcs->early_fini)
+			continue;
+
+		r = adev->ip_blocks[i].version->funcs->early_fini((void *)adev);
+		if (r) {
+			DRM_DEBUG("early_fini of IP block <%s> failed %d\n",
+				  adev->ip_blocks[i].version->funcs->name, r);
+		}
+	}
+
+	return 0;
+}
+
 /**
  * amdgpu_device_ip_fini - run fini for hardware IPs
  *
@@ -3613,6 +3631,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 	amdgpu_fbdev_fini(adev);
 
 	amdgpu_irq_fini_hw(adev);
+
+	amdgpu_device_ip_fini_early(adev);
 }
 
 void amdgpu_device_fini_sw(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 86c2b2c..9b24f3e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1156,6 +1156,15 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
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
@@ -1164,8 +1173,6 @@ static void amdgpu_dm_fini(struct amdgpu_device *adev)
 		drm_encoder_cleanup(&adev->dm.mst_encoders[i].base);
 	}
 
-	amdgpu_dm_audio_fini(adev);
-
 	amdgpu_dm_destroy_drm_device(&adev->dm);
 
 #ifdef CONFIG_DRM_AMD_DC_HDCP
@@ -2175,6 +2182,7 @@ static const struct amd_ip_funcs amdgpu_dm_funcs = {
 	.late_init = dm_late_init,
 	.sw_init = dm_sw_init,
 	.sw_fini = dm_sw_fini,
+	.early_fini = amdgpu_dm_early_fini,
 	.hw_init = dm_hw_init,
 	.hw_fini = dm_hw_fini,
 	.suspend = dm_suspend,
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 9676016..63bb846 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -239,6 +239,7 @@ enum amd_dpm_forced_level;
  * @late_init: sets up late driver/hw state (post hw_init) - Optional
  * @sw_init: sets up driver state, does not configure hw
  * @sw_fini: tears down driver state, does not configure hw
+ * @early_fini: tears down stuff before dev detached from driver
  * @hw_init: sets up the hw state
  * @hw_fini: tears down the hw state
  * @late_fini: final cleanup
@@ -267,6 +268,7 @@ struct amd_ip_funcs {
 	int (*late_init)(void *handle);
 	int (*sw_init)(void *handle);
 	int (*sw_fini)(void *handle);
+	int (*early_fini)(void *handle);
 	int (*hw_init)(void *handle);
 	int (*hw_fini)(void *handle);
 	void (*late_fini)(void *handle);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
