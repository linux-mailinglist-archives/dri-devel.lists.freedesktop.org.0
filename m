Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 391DD832D2F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 17:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212DD10E1A4;
	Fri, 19 Jan 2024 16:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5193910E9B7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 16:33:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkAD/e0MZ8whQyZPkG7792DRzPI6y9fPyQQOgj258wpyCNcLrpzrfy7OO4AJblMQEQDJW4zJmb4AnL9b2JxxzWXXcGLcXwZ7OTk5vzVov4Icq25K94HVkqah2WMFwvjj5KsePSW+4L5LegF1XM+K2XbDhsP7nDhhQBmCjrheVZer5waE5ub4FgI6A5GYI909ZYlChxJefjuf0i6un3QcTk4z9DV1oxpOzAGGuCXdStrn4RfAi/bfi+mFt1Yj5yL9Nz75KXjL8+sE9Qt2gThZ8mGrSOH4vL0UwIrTRG4U5z589Sf2k3MU0IfjpQ8Ja1dQ/o5IueheCBQ3xEwFjOT+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpmMGPsOiiqY7VfyYJgNG+z6cJ4Xw4bCoJAVGBakggQ=;
 b=oSeD4UMKRy8KHwtTPmJ53RT0K/l1LdyLZk3yp0PXwTXEB2kH8puUbh21eryEZ0XldUsZ1EFdVmZPPZBW2MOsIh4+rL76zeMuPaFWNPGbpAeMyPgiwgottSEOpkNTQPjEqgeXYC2VkttbQ8guB2PFqBDrKOrlCSQrudkI8HgXqpH6aeB5Lcmd7TD0DYlmc0P6PJSxcZah26/0W52lZVqq75aQGI2sdEP27Ihhf58Mjhe9S6hZfa+pY4I5yrrHj0glpBkGkpiIENvSQ0lIimJsf3q3xcS4tljQgW/dUJ0GsGX2fhazDYevqjhH5a6PPd5Z6lzylr2f2PNeBZdE5wZS1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpmMGPsOiiqY7VfyYJgNG+z6cJ4Xw4bCoJAVGBakggQ=;
 b=IezLL1k8U8zk6rPhIckao+zzPdJ2igtN7PkNHWaU+vWG+3+jJCnIYnWeqAR0y92CKZaMQnS9Hfi1zb58l6Aob6D5wTsGz0WJemzX/ifl1hwYM5yAM2ZR4VPPA9e0AD6bYK4m76joMsXsVvySh+HKG3sOv5aWCggluyaWYR6SRQs2eZxBcGvQ1dLDlee0oOqoVbgc3olBhQF0ZEBL+qyd6TSvK1YTfLpC8C/syL185peLZKyYMfNnLYf9/0nP6YEuy4jBYe6TRH1ApXp4uKkszDCocSfC7M34SFELteOjpO/wogw1pgZ39LNCuAzKeInZzVObz5neCfKAhQSCSFlzDw==
Received: from MN2PR03CA0017.namprd03.prod.outlook.com (2603:10b6:208:23a::22)
 by PH8PR12MB7025.namprd12.prod.outlook.com (2603:10b6:510:1bc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Fri, 19 Jan
 2024 16:33:16 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::44) by MN2PR03CA0017.outlook.office365.com
 (2603:10b6:208:23a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24 via Frontend
 Transport; Fri, 19 Jan 2024 16:33:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Fri, 19 Jan 2024 16:33:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 19 Jan
 2024 08:32:54 -0800
Received: from precision-5760.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 19 Jan 2024 08:32:53 -0800
From: Erik Kurzinger <ekurzinger@nvidia.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/3] drm/syncobj: call drm_syncobj_fence_add_wait when
 WAIT_AVAILABLE flag is set
Date: Fri, 19 Jan 2024 08:32:06 -0800
Message-ID: <20240119163208.3723457-1-ekurzinger@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|PH8PR12MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: 9347e854-69fd-4e2f-8ad9-08dc190c5666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SnkxFUmtcOn9hWY0OvfWy2aVkVvQb/SA7LaLO28H1OqV287D13Eoqr3xKwbF8l715EBT93eeMTvYH3ti2NIVBf2FVydNOKkqvfP9ugevqwkZTn5RfNbsiRW3Vv0mPtYJhtw1+2y8Y6bnXV27AX83gTmMM/RxQirpaQKpII41Hf6dHTsALJ/zXlJGoqN3WOVi3/DJJJRQEcyfI0AAW5nO2L63XTUQHPeSHkJQfeJJ3TZID6HfqT1R0gbNgw+vz1YXxDFkDO9KHeVZqQpur/7xNwiThU8jFMrtlL+R2r88rBBkp/hhnruWkWDahX3mMu81SYt1MqzvhMZD8XxYs5fBURGV4HuyTVjXYOwlLBzEO9dc+nlpSFCq97iR8OtYoCjp4m8N3vquiXI+bbqxFL9tNSNfbaoY/iL411/8RUGQDepH+wWMIkeHgedIPI+rzb9STRoC+3+PgpH8crgBfyIQ9yqoR1hrpC93+8hMpbn/YzUA7EWFBoqJY+tkeKobc5RWQz2yAKkUEK4Pt0Xg8pZ+EtyTz+VKUxTmIo6mCX5Ay4uZFXscdGDib6yogC7MM8gxbS36EEoThUnRi6WJ+GHhyrjloTXEmly6tviCH6i6UVVJbD0R9PNhWM00NpQCKPHfgH/szyZol9NW436NRWLW7GmnqQwrWpfZp5F63xqJkMrlMBe54fOKrIF4VEtiVqU6Qt9Vy4ArEC79YEIcSHh4WkO9tlWk5YX4U4MbnalVl4bYWcHPyHPhTtd1+dFu/SoqdhRYleIF/JMLhpWIkbMslQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799012)(36840700001)(40470700004)(46966006)(7696005)(36860700001)(26005)(6666004)(16526019)(2616005)(1076003)(336012)(107886003)(426003)(47076005)(70206006)(8936002)(4326008)(8676002)(2906002)(966005)(316002)(70586007)(6916009)(54906003)(5660300002)(478600001)(41300700001)(86362001)(82740400003)(7636003)(356005)(83380400001)(36756003)(40460700003)(40480700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 16:33:15.7599 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9347e854-69fd-4e2f-8ad9-08dc190c5666
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7025
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
Cc: david1.zhou@amd.com, Erik
 Kurzinger <ekurzinger@nvidia.com>, jajones@nvidia.com, kbrenneman@nvidia.com,
 ashafer@nvidia.com, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When waiting for a syncobj timeline point whose fence has not yet been
submitted with the WAIT_FOR_SUBMIT flag, a callback is registered using
drm_syncobj_fence_add_wait and the thread is put to sleep until the
timeout expires. If the fence is submitted before then,
drm_syncobj_add_point will wake up the sleeping thread immediately which
will proceed to wait for the fence to be signaled.

However, if the WAIT_AVAILABLE flag is used instead,
drm_syncobj_fence_add_wait won't get called, meaning the waiting thread
will always sleep for the full timeout duration, even if the fence gets
submitted earlier. If it turns out that the fence *has* been submitted
by the time it eventually wakes up, it will still indicate to userspace
that the wait completed successfully (it won't return -ETIME), but it
will have taken much longer than it should have.

To fix this, we must call drm_syncobj_fence_add_wait if *either* the
WAIT_FOR_SUBMIT flag or the WAIT_AVAILABLE flag is set. The only
difference being that with WAIT_FOR_SUBMIT we will also wait for the
fence to be signaled after it has been submitted while with
WAIT_AVAILABLE we will return immediately.

IGT test patch: https://lists.freedesktop.org/archives/igt-dev/2024-January/067537.html

v1 -> v2: adjust lockdep_assert_none_held_once condition

Fixes: 01d6c3578379 ("drm/syncobj: add support for timeline point wait v8")
Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
---
 drivers/gpu/drm/drm_syncobj.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 94ebc71e5be5..97be8b140599 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1058,7 +1058,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 	uint64_t *points;
 	uint32_t signaled_count, i;
 
-	if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT)
+	if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
+		     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE))
 		lockdep_assert_none_held_once();
 
 	points = kmalloc_array(count, sizeof(*points), GFP_KERNEL);
@@ -1127,7 +1128,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 	 * fallthough and try a 0 timeout wait!
 	 */
 
-	if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT) {
+	if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
+		     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
 		for (i = 0; i < count; ++i)
 			drm_syncobj_fence_add_wait(syncobjs[i], &entries[i]);
 	}
-- 
2.43.0

