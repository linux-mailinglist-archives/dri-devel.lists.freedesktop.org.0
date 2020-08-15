Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973D724506A
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 04:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0656EC5E;
	Sat, 15 Aug 2020 02:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BC76EC59;
 Sat, 15 Aug 2020 02:49:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7kGUPa0VxaNU5RNlFi5Gcfj5c4FAicxutrMntrmWbZnzmEeH1Oif0wwGVJpyVACPrSTYgMVx4t7yEehMqDyHs8FNsd7wiTytKlio6Dmh8wQQh5K/z4uj48PNyFU8cFCAOO1VaUrMGSqCwNknRTw5joQweqgcqae1qYXZmXNgElO7O64oKj732ibaX11vTkexfeS/9qTF0wV6uqnGLOgCeKeAJg1uRUgYpJRUp7WYISJ9ubzJUIkhk7NKDR0jFUUk6h43HlnDAyrTz4kP8MUKcbUeQzoqd7oN39i8NN5lFh1xWJHVgLJUEF+w6tabVnZ7f6ALJ+ztWczSePG3UdadQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yb0qt7A+t5/FAo2Tas1i+C+fLE1LgFACOST+MsDVXUc=;
 b=RbWdu85/jDaCMGojJFTbrePv/gS/ZjgB0quf9h2zo/pIn56kcsJ6U8VtVAFKeX9DC6p71hYTHCAzQz8P2QKW+WouA3lGvget32WjPkqNjN2d1b6QlYBbkCBhSd1swSMT1dpi9SO3e4ULfOQb7rtkxx3T1ELgefjXKzsSRTeikKuesVOb4EgLOtYJNntD0V7tbltPspYyW5B14ugnU4hkldRazQ1IpLYeHhcMUoJx5SZ71HKrh8U4BYzP0bvl0ZGR8rA786pURB3Z8N2nQw923VLIti2DW3aHh3mA0XvwrgL6mhl5r8xGxfSB3QCxqg/Tqy2tcUIcv2+Ck3afTiwuTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yb0qt7A+t5/FAo2Tas1i+C+fLE1LgFACOST+MsDVXUc=;
 b=ylllpFwQevMXJc6hG8Mo84eqDOlmYym/Te/mVSY3DbRk67srDsMU5n6hYWkzjxJ7aHjSxoWzUr9HN/JRCThnb9Fj6FMr6HaME0jFH8iQOqoeJtAFh/NoF8wUGFTVKBQOlZmTXLCYRcZhpumbKX6n0JML3NXT6rA12MOEidBQdfY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB2620.namprd12.prod.outlook.com (2603:10b6:5:42::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.22; Sat, 15 Aug
 2020 02:49:10 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3283.015; Sat, 15 Aug 2020
 02:49:10 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/scheduler: Remove priority macro INVALID (v2)
Date: Fri, 14 Aug 2020 22:48:52 -0400
Message-Id: <20200815024852.4355-3-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.28.0.215.g878e727637
In-Reply-To: <20200815024852.4355-1-luben.tuikov@amd.com>
References: <20200815024852.4355-1-luben.tuikov@amd.com>
X-ClientProxiedBy: YTOPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::49) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by
 YTOPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Sat, 15 Aug 2020 02:49:10 +0000
X-Mailer: git-send-email 2.28.0.215.g878e727637
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7a7ea67b-66bc-4d10-4376-08d840c5c964
X-MS-TrafficTypeDiagnostic: DM6PR12MB2620:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB26205BA496128FC12D77CD7999410@DM6PR12MB2620.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WmLJ2tP/n1pdpAc94aJUk5xb/PA9d5ec/CvYrQeyvU7ypy87cjpluX0/Y91VgycVsxCDZVlu26ziJCYzWjp9dpb+xA38A9k6AAtXisECYbG1j+hyTaGjEmLIXNBNV4dzH8bgVptB7qaYeYWenPmjIlxLQwsy2hyJniotmCbFal/fyeiOkCJ7xPt4FyFqGpfspFpg8FEEpqyk90fC8EJzH1+s+UxvxPHT3nSwU2MwTd0XAYmICOeYFQhtwKsUem9kMEGyVf3aVN4zGE7okFxaUhO9dBJezy1Y+ezgYzGlGVQSPrp6CijWjCR+urjxoi/c/bf/dalRLDv7G5WufLM4Iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(8676002)(2906002)(7696005)(52116002)(66476007)(26005)(8936002)(6486002)(66556008)(66946007)(6666004)(2616005)(83380400001)(54906003)(16526019)(44832011)(5660300002)(4326008)(36756003)(316002)(956004)(86362001)(1076003)(450100002)(186003)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: O8jR85pRuRZPKM2hsGZDMG0VDLFm+76fePeUb0zJPn+8DRYyCdIeTn7EoeIEENfwjHkngs9aJZgU8Mw6NZxb/6KhlVEx/2vBCHw2TWc5kplvWJqOs2lijGs60jauhQ/mYYbMM58O/AgKS+4fuSZnrCGz5EypNax5FyvtSrdN//wzdVXdr7h7nEzd63s6MPmuSFjLxJZxyfVqnMd52mSbXh8WE7thJMrdFgrpAqlMXUzIyBm4nbLugYtP9tMQMoFlGKM7Zcxx26iDrbIlVIiB4BdbmGj0br+CamVI5itaN2bHuVXnka0VkYS+q/aAowzfqWnaheeGmDW/nh7n3+W3S84Iv9lU+yEyKYcvTPvC2SIQeSEENgkObW2jRUglvRaW3kmE7ZfGJq3lEsPCH9EHJviqghBhCi0BLjyRvoIMKckA+J6C+GwfGTPvZ/C0gPC2PNTFi6K0tOEKwjwHyjEIuXrDHwFxkh3QGt/A7SDH6RdOFUEF+qagKQb+vvFHzsa3BsvFDvlCJkWSetCIlvSPc7FKgnfvmUeq8vbFsVXPX0O8dlk2l1EmqSQBTh4RoRuofNrEoQAiPu/VQfrlEfZfs0EKaG7tB8DfyAx/DgpNbHi4biwbjAMHwUz6e0pR8t/3O6wmMVngqixKVb43pm7Eaw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7ea67b-66bc-4d10-4376-08d840c5c964
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2020 02:49:10.7389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8CNNTu40UV+aRSEczZUPii95xFAMdrYSelffYHRE5vgXp5tIpVi24xlJINWuswM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2620
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

Remove DRM_SCHED_PRIORITY_INVALID. We no longer
carry around an invalid priority and cut it off
at the source.

Backwards compatibility behaviour of AMDGPU CTX
IOCTL passing in garbage for context priority
from user space and then mapping that to
DRM_SCHED_PRIORITY_NORMAL is preserved.

v2: Revert "res"  --> "r" and
           "prio" --> "priority".

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c   |  5 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c | 40 +++++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.h |  3 +-
 include/drm/gpu_scheduler.h               |  1 -
 4 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 68eaa4f687a6..0a980f59cfd0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -392,13 +392,12 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
 	struct amdgpu_device *adev = dev->dev_private;
 	struct amdgpu_fpriv *fpriv = filp->driver_priv;
 
-	r = 0;
 	id = args->in.ctx_id;
-	priority = amdgpu_to_sched_priority(args->in.priority);
+	r = amdgpu_to_sched_priority(args->in.priority, &priority);
 
 	/* For backwards compatibility reasons, we need to accept
 	 * ioctls with garbage in the priority field */
-	if (priority == DRM_SCHED_PRIORITY_INVALID)
+	if (r == -EINVAL)
 		priority = DRM_SCHED_PRIORITY_NORMAL;
 
 	switch (args->in.op) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
index 17661ede9488..9581283a4c78 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
@@ -32,24 +32,32 @@
 
 #include "amdgpu_vm.h"
 
-enum drm_sched_priority amdgpu_to_sched_priority(int amdgpu_priority)
+int amdgpu_to_sched_priority(int amdgpu_priority,
+			     enum drm_sched_priority *prio)
 {
 	switch (amdgpu_priority) {
 	case AMDGPU_CTX_PRIORITY_VERY_HIGH:
-		return DRM_SCHED_PRIORITY_HIGH;
+		*prio = DRM_SCHED_PRIORITY_HIGH;
+		break;
 	case AMDGPU_CTX_PRIORITY_HIGH:
-		return DRM_SCHED_PRIORITY_HIGH;
+		*prio = DRM_SCHED_PRIORITY_HIGH;
+		break;
 	case AMDGPU_CTX_PRIORITY_NORMAL:
-		return DRM_SCHED_PRIORITY_NORMAL;
+		*prio = DRM_SCHED_PRIORITY_NORMAL;
+		break;
 	case AMDGPU_CTX_PRIORITY_LOW:
 	case AMDGPU_CTX_PRIORITY_VERY_LOW:
-		return DRM_SCHED_PRIORITY_MIN;
+		*prio = DRM_SCHED_PRIORITY_MIN;
+		break;
 	case AMDGPU_CTX_PRIORITY_UNSET:
-		return DRM_SCHED_PRIORITY_UNSET;
+		*prio = DRM_SCHED_PRIORITY_UNSET;
+		break;
 	default:
 		WARN(1, "Invalid context priority %d\n", amdgpu_priority);
-		return DRM_SCHED_PRIORITY_INVALID;
+		return -EINVAL;
 	}
+
+	return 0;
 }
 
 static int amdgpu_sched_process_priority_override(struct amdgpu_device *adev,
@@ -119,9 +127,20 @@ int amdgpu_sched_ioctl(struct drm_device *dev, void *data,
 	enum drm_sched_priority priority;
 	int r;
 
-	priority = amdgpu_to_sched_priority(args->in.priority);
-	if (priority == DRM_SCHED_PRIORITY_INVALID)
+	/* First check the op, then the op's argument.
+	 */
+	switch (args->in.op) {
+	case AMDGPU_SCHED_OP_PROCESS_PRIORITY_OVERRIDE:
+	case AMDGPU_SCHED_OP_CONTEXT_PRIORITY_OVERRIDE:
+		break;
+	default:
+		DRM_ERROR("Invalid sched op specified: %d\n", args->in.op);
 		return -EINVAL;
+	}
+
+	r = amdgpu_to_sched_priority(args->in.priority, &priority);
+	if (r)
+		return r;
 
 	switch (args->in.op) {
 	case AMDGPU_SCHED_OP_PROCESS_PRIORITY_OVERRIDE:
@@ -136,7 +155,8 @@ int amdgpu_sched_ioctl(struct drm_device *dev, void *data,
 							   priority);
 		break;
 	default:
-		DRM_ERROR("Invalid sched op specified: %d\n", args->in.op);
+		/* Impossible.
+		 */
 		r = -EINVAL;
 		break;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.h
index 12299fd95691..67e5b2472f6a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.h
@@ -30,7 +30,8 @@ enum drm_sched_priority;
 struct drm_device;
 struct drm_file;
 
-enum drm_sched_priority amdgpu_to_sched_priority(int amdgpu_priority);
+int amdgpu_to_sched_priority(int amdgpu_priority,
+			     enum drm_sched_priority *prio);
 int amdgpu_sched_ioctl(struct drm_device *dev, void *data,
 		       struct drm_file *filp);
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index ed998464ded4..5eb464248621 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -43,7 +43,6 @@ enum drm_sched_priority {
 	DRM_SCHED_PRIORITY_KERNEL,
 
 	DRM_SCHED_PRIORITY_COUNT,
-	DRM_SCHED_PRIORITY_INVALID = -1,
 	DRM_SCHED_PRIORITY_UNSET = -2
 };
 
-- 
2.28.0.215.g878e727637

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
