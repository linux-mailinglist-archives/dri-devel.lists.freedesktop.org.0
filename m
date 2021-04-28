Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA5336DAF7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA696EB72;
	Wed, 28 Apr 2021 15:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6F36EB6C;
 Wed, 28 Apr 2021 15:13:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlspMSbwS2uOwU6cUkfk6sakE08kRJhWjyGaKbYrOGYoe58ZfE/J2pSq6ZoR2SJfnr1Rq2sdoPJlQhWADTbNP9HlGmjyG+j0V3mnF6bpb3I3NNzRAMxskYCqED2DBTRjP/7L6jwDJCB5boxbb5iynkGLvtioBJ4e2NP+a6LRMnkeJ3Yybp3c+7h3wBPMctnnn0FJ+wwPCo3G7/yS9p4rJ46SqmCjA4Z/25F9JXDPkNSxEaZK8RWNH3Vym0oYUVAkJTWVJHugPOKZHpSzaH5dH18E6xmSGaGJGwrXp4kmHSClBWXNh+hS2zRDViv8q789euneQjgjDPhz8pXPrDQxow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oi6EUX0FKfCptExWIFjDRDfgt19i4KeMWV08PIEKsVE=;
 b=XZojVhrC4j+hGWiaRPcVYoUNOLP/4AqSQD7gDpuQjHViwmjj4XqCoHc765ZYtTNdOPCpBezEsRiv2jkQfhcyKd1LfocA0k+i9LB9aSGYilUQOtwm7MM3m3QaRsIGrN+N3HQa5IjVJD8j2dp7UbxDFvcbya5CocoHRL5zaY9F+SW2aJFTVVGmPhSfeAawUPiu80VaVbZHaum4HN0b0L/SORsLF/xFdL+ijxIDlbbLu31pbKdzrDn65qcS8otMjUpgK1wSScPMr7/jPnUgDFu1HewZfhZCKLBQyIx3LSbKtkgT+STYXby8ILhP7orhJ6PXwqOXS7fkfspCa+Ck7o224w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oi6EUX0FKfCptExWIFjDRDfgt19i4KeMWV08PIEKsVE=;
 b=EhH6/RJDfZIIqb5LHQ9obMHatgtkhEN0Ph7uhfdyw0C5QTSNX1Hu6WUqvfZ34Fk9Q9prDETaLp8/e/2aJO14IZxnizsvnJEKY2CB8zu4IMIBtgbrcxJRMDp9rdbWdwxzuZkI6Z3P9RiZuqIcvS/Znxj9b9nKGBg26vTTQ4/+jgA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2749.namprd12.prod.outlook.com (2603:10b6:805:6d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Wed, 28 Apr
 2021 15:13:08 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:13:08 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 20/27] drm: Scope all DRM IOCTLs  with drm_dev_enter/exit
Date: Wed, 28 Apr 2021 11:12:00 -0400
Message-Id: <20210428151207.1212258-21-andrey.grodzovsky@amd.com>
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
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:13:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c08a66c7-c932-4bb1-7c4f-08d90a58212c
X-MS-TrafficTypeDiagnostic: SN6PR12MB2749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2749C2ECDF9504DB26678531EA409@SN6PR12MB2749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /2gAl/SYK//TcPDdgy/D24UqABDaWrXdfcsL2upOip+l7G0j/j/KjJ0+TdRYqYbnB74O7PWQg5jYutpz9GhTtFvxUZQuVQedqrHBtY3ztPVl+80jbbeL2sBQ8+PaNE5TJYbNVTwdrd/uRHxKCly9p0bX4OIVTH1DyKd0PI+okPlKUr0T9+7mbUWSxtDlLnctl9W2whhlNhIzQ4UnSOYt7i5mApQhTpRuv/EdjsTKxzK04Wp1IWRBA8h+6Jt0Hu85JpI5hK0Idp4PxdKZP5KHshE1qi55TL+3lDvI0/IndI7xHMmHQyKlpaLU0bPrk6ItiX7eMB1xJ/mmEnGfM06G9VZ2KRoo2uZR83WGV4vJIP46hlj9eNpxKUuhz7vG/RCNHcw9ec7/hku+JlHJs8V6Mro8+LxBn23X7fvqlh5/86BvQu5fXePMswGUXqI2uoUZfhdM6aaO2HEz/lUcna2Pegp9wNFcCFN7YcWBjeKRURKxQnp402ok+LhtDMCY8xAQXfU+outz8tL2Vn5PzTiG8guMNXzWrp064lUmYY6mG8g1Ao8L2iduF+0Fij1DWVYClzDx1yvs+k5dbaRdbld8wE4wnK2bf4waEcRWMguWU8c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(16526019)(6666004)(6512007)(2616005)(1076003)(2906002)(6636002)(66556008)(186003)(86362001)(5660300002)(8936002)(83380400001)(6486002)(478600001)(44832011)(38100700002)(66946007)(52116002)(6506007)(66476007)(8676002)(4326008)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4YmPK/ATM/9/Pfbn/eouuYah88GuWGZjherXf7imh7mT6M/udxzyImSc9JF1?=
 =?us-ascii?Q?KOLY6vf8uvI1pdT4O5ylWz4z4PHRXPFwGcnyJZDxfQZ8JWi00zRSFfG60Exy?=
 =?us-ascii?Q?/aGN3bnuyzG6lNL3+3MIO8iaj1IEyPst2AAXdWcn4W65xRgqltQIDBHvXWkz?=
 =?us-ascii?Q?QtfHTrjRuLs1+5pEgqxR7gj0KEbemZEBqv6fTsqFifFc1gs5HbteMEA5s2oV?=
 =?us-ascii?Q?vgbvIjP5azw4HcP6yP9klUOFzXxaNnmO8rpHfuctxemmB1zthKStFt/Ivcr9?=
 =?us-ascii?Q?0M//+YhJCSWB/YTnWn31P6do14o5/dHROOgNPsVsyKbPRLRWNa4V95ViRP1f?=
 =?us-ascii?Q?E3OPDtLVuPXUAUqe8QwFbqW1pQhU155qAzqzuBKVdZBbNhhdWuve+7mBaTYD?=
 =?us-ascii?Q?21ryLrgx5sjo49ykEF+G1MuxqhRQQ2kMeJcj+8CijEOAQzlLaDCmRYY3QYCD?=
 =?us-ascii?Q?dKVmAqZRftkFoWWBPsjOkTDaoqJWifYaN4ju1Izflz3cKhTGusn8TjOuxcCt?=
 =?us-ascii?Q?X/zbkaP9gXN49E/u6Jj+qlhgjx3wsHfHUk2tcgxgF63nOYpfl43OOYSQsnQg?=
 =?us-ascii?Q?q5q1d3TVt31cxrUEAHXh7kKepwg/EuOupQsQT/L/k+Weo6OC1OV8OYcuV3LZ?=
 =?us-ascii?Q?QwRM20xU+hiyeXe2Sy9r4uwPkqWvimwR+cKc2R154Q58mBqr56edMhVlyLs3?=
 =?us-ascii?Q?CThBSMZWwJj6/IAT7JbIpKmXdPrWRh19dVV9YhB6Pduif2Rg9ze+yKA7mKp6?=
 =?us-ascii?Q?EbJ4BrjRQa9MhEePIe5laLk3qhIlBRCBv5hSACsu3xyymwPdkkIk1Sx9Xhxf?=
 =?us-ascii?Q?ZUVJiUd3oHRZNlJZgpxt3SsjTSO/Ba3s5YL1VqgV1LKN9F4wxZEjfB721gfQ?=
 =?us-ascii?Q?vA4oVAY9z8kMcoMqRJUAWXgcUKi6QPH1f10dUMvBE6SHmLo7w2cZwllAW8Ja?=
 =?us-ascii?Q?sZba5xDqUZKRiMhjeGAtVodeAqG99uLrAfWHGgJ/oREF54ctPhr78GpVUlQw?=
 =?us-ascii?Q?LgD7d3HZrPovn9JAv/v1WJ0/hTapcd19U/RCT1VzWLRVfj/t9cWyUsFkYyfA?=
 =?us-ascii?Q?v3mw7zs0sFqIPA2PqePajFwti8yrFlsIE6p3r+m460/5hAX6foUYshyREqtY?=
 =?us-ascii?Q?G625PF+qbPbxNf2N8YBF7lKs72UYaJ0BN4Gh8l9hXwyRCOfahWJr9KPQ/t13?=
 =?us-ascii?Q?ONmzfXd3rfMKxNvq2efCbqmG/GGQC4MSToysZ/aQ9S9kuE9rcUKMB5TGXykq?=
 =?us-ascii?Q?/Msjg+5mUfFYYkof1WzaYes2KCCOUj/LNMbARNvybylcYSQghqw3WKyp/Soj?=
 =?us-ascii?Q?dcGEdkR0+3OYUitqxfUUNcfXqF7LaMcK/6hnSNRrj7runIjGC4OzyXJhWYgl?=
 =?us-ascii?Q?nEzBNla35sZicSV+csuo7c8ZbGzf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08a66c7-c932-4bb1-7c4f-08d90a58212c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:13:08.0658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mgm8L703L8P9+PdXrScBVak30Rg/eX/iMS7ywBJHzl8rkHMM35gLPmn8L3nKngrAXl1NDlAnyrTugXwOWzM2OQ==
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

With this calling drm_dev_unplug will flush and block
all in flight IOCTLs

Also, add feature such that if device supports graceful unplug
we enclose entire IOCTL in SRCU critical section.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/drm_ioctl.c | 15 +++++++++++++--
 include/drm/drm_drv.h       |  6 ++++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index d273d1a8603a..5882ef2183bb 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -815,7 +815,7 @@ long drm_ioctl(struct file *filp,
 	const struct drm_ioctl_desc *ioctl = NULL;
 	drm_ioctl_t *func;
 	unsigned int nr = DRM_IOCTL_NR(cmd);
-	int retcode = -EINVAL;
+	int idx, retcode = -EINVAL;
 	char stack_kdata[128];
 	char *kdata = NULL;
 	unsigned int in_size, out_size, drv_size, ksize;
@@ -884,7 +884,18 @@ long drm_ioctl(struct file *filp,
 	if (ksize > in_size)
 		memset(kdata + in_size, 0, ksize - in_size);
 
-	retcode = drm_ioctl_kernel(filp, func, kdata, ioctl->flags);
+	if (drm_core_check_feature(dev, DRIVER_HOTUNPLUG_SUPPORT)) {
+		if (drm_dev_enter(dev, &idx)) {
+			retcode = drm_ioctl_kernel(filp, func, kdata, ioctl->flags);
+			drm_dev_exit(idx);
+		} else {
+			retcode = -ENODEV;
+			goto err_i1;
+		}
+	} else {
+		retcode = drm_ioctl_kernel(filp, func, kdata, ioctl->flags);
+	}
+
 	if (copy_to_user((void __user *)arg, kdata, out_size) != 0)
 		retcode = -EFAULT;
 
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index b439ae1921b8..63e05cec46c1 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -94,6 +94,12 @@ enum drm_driver_feature {
 	 * synchronization of command submission.
 	 */
 	DRIVER_SYNCOBJ_TIMELINE         = BIT(6),
+	/**
+	 * @DRIVER_NO_HOTUNPLUG_SUPPORT:
+	 *
+	 * Driver support gracefull remove.
+	 */
+	DRIVER_HOTUNPLUG_SUPPORT         = BIT(7),
 
 	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
