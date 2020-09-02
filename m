Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACCD25A285
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 03:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604496E10D;
	Wed,  2 Sep 2020 01:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214386E0AD;
 Wed,  2 Sep 2020 01:07:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERO5RsX+/QfGKe7saY8eg8/hNBEHEpAUu7PshV0k8CXmFFP266hQ1mXbGTVGJ/V8N5pbhhJ71EALR2zUa4EEM/lOmOXtpUjx/6tO5dHwGNoFwjKoEFQqZ8H0YYOdh0J0+gWvgz9Zu0Yp+3/s2zVkT83o4bstsHrsTO5HLcioBEgQu6n6Mu3BsZpS5tlBkklJuRLwR9ACl0O7aVkvGkIXxYA+WxlnAWQu3vhr8Y3YuCDUIQpBssGAw6Hu86fnKWEM2BgP+pQwWj/FKf9WhJ4Yw/r/keCTOjHRbORPkDXYoU0UJL1DNntYKd9xFoGU8PO+mqZk4zqwU8POxaHLvCLzLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elBg6O1w+7/6bWiCI8OivqU0ZC/YbvuFcpF1p967eY4=;
 b=K+cObI4AWHWI9WfmkePv7abLLkthiHcIOlB2R7/vs2CjX1xqYMYCTFj7z/QAJxD+h3JXdDTqaztQndRnix2aeytAxbAyDeLUBd3cieGdtiBIBUAgVPGEBLIgSBbK8q1z38PadKLNAEQA5K5tVF8jN+U7kbOWThWwiP0eLAnIzDL9dhWPQVAPXplFyhvERp3STXI4ih5xyh4bWGwPOxd9AyJa/a1tvz3tSSsK0k53Qxb2fChzDs3hwilCw4Cqf6q8E12/xSO4+0zB+hQaF1OxmDdFBWNK4ogc80yfQbJl4bp8yFM3U0hoftEhZ1FXIKHnJruBUM5OLyzlARSxGavLjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elBg6O1w+7/6bWiCI8OivqU0ZC/YbvuFcpF1p967eY4=;
 b=WJm3xhs+k4NJyZfn0s6zwrBW5Zw5UR7YE11cRXRYDxDwHjKrHh3sLYhukt9Ouz3TBjRVFmMcuINmbIoFqPAc64RQMAqnz6bHLJWOIicaVoYwHbat7h9WGE9LqCty2atc02Q4y/WjYnr1ZkHz1myyD8dFkm/rosaei2Y9bqWU0uM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB4516.namprd12.prod.outlook.com (2603:10b6:5:2ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 2 Sep
 2020 01:07:18 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 01:07:18 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amdgpu: Remove superfluous NULL check
Date: Tue,  1 Sep 2020 21:06:45 -0400
Message-Id: <20200902010645.26943-4-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.28.0.394.ge197136389
In-Reply-To: <20200902010645.26943-1-luben.tuikov@amd.com>
References: <20200902010645.26943-1-luben.tuikov@amd.com>
X-ClientProxiedBy: YTXPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::25) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 YTXPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 01:07:17 +0000
X-Mailer: git-send-email 2.28.0.394.ge197136389
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 493a3213-5e0f-4a79-48b5-08d84edc8990
X-MS-TrafficTypeDiagnostic: DM6PR12MB4516:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB45164BFA58B1E448BA53E6EE992F0@DM6PR12MB4516.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gtJMWRulJZBptWk0niwawMoJ6iIkQfnhciW2LIEH9aPsMFYsmVGa0cIxeuGgr+TZk/jh1zY9OL3J2kq1dSbmjZOS0QiwjneLbCzSwokh6hQoAZS/7GnQ+fgck3wqUjxMD/XHVdpow/xx6eGxHQm5IciKa3zA9AoDVBs/ocJML9XkYlz5FMfivHyuPSIP2o+B2HKII4K8nbfGSjhzf2xPz1yiYdf2/Df5xdEKWQ8J5SItkTvqxhYHe/vdgd+VA/PRWVQxHIbzIVcgn+kQ2M8iXQAR9dFChdZf/MWUBiuugL5Ak68lUImiyzG2pjo9QROKz8LS8YizaQTtZDS6q9EiDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(8676002)(956004)(5660300002)(8936002)(44832011)(26005)(66946007)(66556008)(66476007)(478600001)(4326008)(54906003)(6666004)(86362001)(186003)(1076003)(4744005)(6486002)(2616005)(316002)(83380400001)(16576012)(2906002)(52116002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Q3253gqJ+CHW+2ziKWwCKi41eqY2UtgKgGXfgdIFtYFjbLAS26S1dMCAff9/jASQxw3TmzffS9NCHJzEj7DZ2+SqWMDRDTerCNHOJHql7utxZjUvriYQEyDMT/T7mpGgKOpFe+ffh1eMAKM1Ts5v5XwCxm/RFxpKMkf5adnwgzbvHRyOG/j69kXmBzq71o2fWiXgXHabjlYpPHXbgkB1jdVqy0L/juvQWbiUXP895XtOKdI58CmCwP5lxTIRYt8vIeqwJw9hjkEwxrfMSe1qdC+ejPWUGlZKRIjviot+mFb3b7nJ7NIbtxv/ARCOxkFixck25T3dcp4Wvt3CizdGGVSWE68LURYQ/6dfIOPPfFbT7Qb7tLkR7sjLCjUPA7qrrmxPwTkjCl6IgSnKjDBBpaFHH4zcdnU7wY5I44tkaPU6E/Asvjf3dLOJyZvmZDJm3Fu6CN2a9EG+iia99HyVjhVtesRlKPsoh4YzGQBxqcrTHRmjFpg2wa7i6/TNVKZe/xv5BAk4u5MocRHN9YZZmV3cxCCYGFaqAyjNOsNDge4lr5e38Wl9Is+BbDvkT09ZEp5+VB0FEXRSVX0IyvnsKQGVM1NhZotJLYcc40RfHo1VPM1XbNAQ2WfyRBvvcDqnUoQych7Nfgps5I2/6zCfSQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 493a3213-5e0f-4a79-48b5-08d84edc8990
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 01:07:18.2680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R05ubYIFy7A2vvuiGSxFjo204AUkgEKqM2NW4q3Lm4fmjdeS01M4R0mncJArJ7r9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4516
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
 Luben Tuikov <luben.tuikov@amd.com>, Xinhui.Pan@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM device is a static member of
the amdgpu device structure and as such
always exists, so long as the PCI and
thus the amdgpu device exist.

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c4900471beb0..6dcc256b9ebc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3471,9 +3471,6 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
 	struct drm_connector_list_iter iter;
 	int r;
 
-	if (!dev)
-		return -ENODEV;
-
 	adev = drm_to_adev(dev);
 
 	if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
-- 
2.28.0.394.ge197136389

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
