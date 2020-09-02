Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6F625A289
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 03:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134296E2D8;
	Wed,  2 Sep 2020 01:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462CF6E137;
 Wed,  2 Sep 2020 01:07:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kB9Vi3bMLw0xk6Rrpthz5M/8t4hqFyJZM5YBVMYdElVleC7Y9VwhZVXb0aF5kw9JOkV+SbdOBadRibW28yibczrW1Vy/yGwwL3zEh65iQodN62Ai0AiCLXPNVBHsgtzyLnCpEwb5//9Kk3z4HfXFaqUwAqHqhWzeJGBxl1M3Oe2gehs+JwfTFXxjBHy97GHbQBxX/oZtQ0Rvsn5HwhERt6WPw9f6Hxgm9yL//rI2GuMJp98eNNI/5xaUnj3XgHwiMu75Esn2DhVTCR85Bmpj7lhVfefomX/1q7l6AidP3So47Sh26elrUgu57Q23Mnj+Imq3OGUdGSqpkkZ6l5hOUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3x+jrburrUAFAECICalsVafk3pNpqHovAC/1JekOKs=;
 b=XP5MuVG1bE9491/oaQF7h1zj67L8nCwVTS7URVKC44XyPcUxM1Ktn2iO8sjrJ5HIvWAdxfeAVZ2PPbFgof3uOMGKww0mZpsJreVAaa/49IdJrUH1YU6UqDo5fYoFZV9helw0aDtomTv5FtcQ2X2RnDr6XBFJUJ30z/rX6ATItgeCm1QR1XwUfa8KTSIGSUq5/SZHQn3qS2yPztpWXKXZ6B0pyCxuYi8XwfDPyX8cTOwiuFaxzeFrPjY9EHAdzDt06VjJMKno9ZVlRGdCPHwi4pE/oZBcVz5VRd3ldkNJB2d5h1dnPF4aUf8t3vSxWVKS4kaIW0MNEISRuMPjAR0Q4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3x+jrburrUAFAECICalsVafk3pNpqHovAC/1JekOKs=;
 b=3e5ekS89mkaJQw6Kv3yvoVPakRA3utm67OAlX7NBmx2pMo6Htw3V5WS098SleUXv+SLRBJnclZ8Kbpje0AfXfm5mJjdInqu7Eoi3VUYDG92W+d/hCn6pQl5xgsWSHcf6TUz4rNBeuTHQaI7Dfaxn7wAdzeZuzN20g3wAWAJ/Vt0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB4058.namprd12.prod.outlook.com (2603:10b6:5:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 2 Sep
 2020 01:07:17 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 01:07:17 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm: No warn for drivers who provide release
Date: Tue,  1 Sep 2020 21:06:43 -0400
Message-Id: <20200902010645.26943-2-luben.tuikov@amd.com>
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
 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 01:07:16 +0000
X-Mailer: git-send-email 2.28.0.394.ge197136389
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 51fa65ae-9cdb-4084-d806-08d84edc88c4
X-MS-TrafficTypeDiagnostic: DM6PR12MB4058:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB40582CB79873535C9DE4B86F992F0@DM6PR12MB4058.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v1lBrXH1/fyJ5M8dR3fvvD3MSC3RJb/WjekMKWErxFbRWb8dQ4biO9Xl1I3YuLdo6rUbXhhRnYbxUle6O65JPTvB7X2hgflRuSivuTmYbF++s4nUx6xUA8qrWgc0PnFpombbP4eov2/0LSSbElq+M33j3peotSzIbJRKETN0mwV1DEs/OSZ62eMn3ZGAre8dbQcbf+TSfTEE92cFZvHuOsSUa0uLnl9jeWhEsBvlpUZmgTqy8FNMDZNa3ncYsPsq0r1N9UpAhHgM4yz7w2g4RkumNIdPPyT2yl1yaRv+m2mTULTSHKAoBjH3OptHM5G2gQfOmUgjtsi/LNqjF+QGrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(2616005)(8936002)(52116002)(44832011)(316002)(83380400001)(956004)(66556008)(4326008)(66946007)(36756003)(66476007)(16576012)(8676002)(54906003)(478600001)(6666004)(6486002)(1076003)(86362001)(5660300002)(26005)(2906002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: n8AQS3X7YcXs2KHE6hdXnHogEwltrIMk5+0MIvqpT+xsYG0xabyU9zm7l22ouaRbhH3mNFG5y68I9shzDVApnl/yTFWBZ0N4OAgcx/z3uQm0NdZwLBS6070UhCYrajE7WIqePZW+i3LaGlpltEb8s9pxQkl8BbgfRFrwv5f3aHfGyr2czkzI0gmL8ZL1azaERsI86G/n6ElotMFa853WMWK2HtztPHs3XR70RKtfUjMdItHtZy6+YuGtbRUUQQRnLpRUnRz8rxr+nEAPJQ4cRibx2lhd73JjqeNCVk3p+n5zAzscfJQQnRO8dVxFmozSZVl/NpIj1XD8xIwH6LszQE8kazs0Ze435LS1D993VAjT8tQlLP3FIhDp4nGLYz3+M7T8svURbjKHH4HK/UkUytKPYoGg6hchQyzTNtzBnmGapMKpkRJ70BYbiQWVinakzWotf2U2f5Uc3pSccQNQaH41LA+TLCOvCNPP8RUqZT20nGMyzzw5tmQULPf98louAcibqLa24cUbkpyTZGVHWdj21juw7HZuOyg8kYBBc5yaY+taXOczq6Lar4nXrXfyEpWINiwfIVJifjB/ahf0dUwGKyvzUJ/xelaG/ckLnc2NPtnEjWkxVwIdywgFNIyRVpyBxsA2BAUjfbWyGce84w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fa65ae-9cdb-4084-d806-08d84edc88c4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 01:07:17.1906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EEWXOvUoVOSg9Qot0Htsj2P9iPdwpoJYwRTJHPhc4j3KRKwXP4EGJu2C4gERKhsQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4058
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

Drivers usually allocate their container
struct at PCI probe time, then call drm_dev_init(),
which initializes the contained DRM dev kref to 1.

A DRM driver may provide their own kref
release method, which frees the container
object, the container of the DRM device,
on the last "put" which usually comes
after the PCI device has been freed
with PCI and with DRM.

If a driver has provided their own "release"
method in the drm_driver structure, then
do not check "managed.final_kfree", and thus
do not splat a WARN_ON in the kernel log
when a driver which implements "release"
is loaded.

This patch adds this one-line check.

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/drm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 13068fdf4331..952455dedb8c 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -935,7 +935,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	if (!driver->load)
 		drm_mode_config_validate(dev);
 
-	WARN_ON(!dev->managed.final_kfree);
+	if (!driver->release)
+		WARN_ON(!dev->managed.final_kfree);
 
 	if (drm_dev_needs_global_mutex(dev))
 		mutex_lock(&drm_global_mutex);
-- 
2.28.0.394.ge197136389

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
