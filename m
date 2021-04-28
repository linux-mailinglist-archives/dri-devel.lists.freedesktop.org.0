Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9787936DB16
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7626EB97;
	Wed, 28 Apr 2021 15:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311686EB68;
 Wed, 28 Apr 2021 15:13:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcazOf2KAz6f3OR5paLcKXq0To1s5nAWLaHPHQXzJteFYnUoh2CQjefoTyRfJqSg29Zpx3fqGcEUsVPCyDA03J4HuSyfL+Oz8ecUZRHBhmgK2wIYprDRA4O3oWJ+8TH/BYH3kRlmurmUM/fVZSEOJVA0c27Na7PkbXGhDFfv4R1f77nDeDwbvFby1Q2esaMI7yV2Dsw+yM40OHv3s5jCuAEo1uJCnpWpvj3Xad6mAezleD4BIy8Oe0jGKaeYyIuDXx8zeeSzXfRDXfDTgSVxnAVL7cAUKNyNbRwFwfo+uHBtYEgC0eJVkL2VzNj7I7zGZI6iW+8+LMIwVzyjRQPJSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzivJfSoUBAQWvGZdfqbypvxwjVVB7vUjRR8QnYNApE=;
 b=mPP1umtYOLRA7z/WXFYX8S5esESnhSAvFK3hkEcfTlK3sSlg9j0hafrnHYvDXTB4hP00ohsvql9ttxO1nwEquYCQDM+Dv2hLZ4xKIu3sGyUbfVFoyWNwLWEJZqk3bzs/Tpu22AaFQmnWrDa8KPCdexJkDALwnSoVNdGZE1N8HOnagx5bxovLtUtq+O2c/p/fW49EV/kEiy8uMNB2JFBAF3qWuqJ1/SizV/2gRyZaSByC7YmARUwrnKGi1oT69dWGkGjPPmTm8yQT0+1D0ngJa3WaaVv+sMPAsDIPckXZuB69czaYHaERfEK7+hDagLjSBT9+tH5ivHBx3mpNSDIdBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzivJfSoUBAQWvGZdfqbypvxwjVVB7vUjRR8QnYNApE=;
 b=aAL47qo7B/r7tjOl/7Xt5c66QfjwcI8pgEpL0ygdSCtRxShJq0mo0tozWeUr53WZuelJC12QUZSWH8i0MHj1x9Qb/UrNqJC11+0tpdyM7wQR011KJUbQXiK9sAtenA10JWHT1E74xbpzZjfg86jQ7YymSjClkjg0/uQVngPzZfA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2749.namprd12.prod.outlook.com (2603:10b6:805:6d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Wed, 28 Apr
 2021 15:13:11 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:13:11 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 22/27] drm/amd/display: Scope all DM queued work with
 drm_dev_enter/exit
Date: Wed, 28 Apr 2021 11:12:02 -0400
Message-Id: <20210428151207.1212258-23-andrey.grodzovsky@amd.com>
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
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:13:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b85e3b6-4552-4279-9c70-08d90a58234c
X-MS-TrafficTypeDiagnostic: SN6PR12MB2749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2749FC451BB12EAD78E2DB42EA409@SN6PR12MB2749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:68;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x1RKhK11Dr4WlnQRCmPDLr4VQufiF6dB+8G0kX4G2if+1tYdDihzDYaD6sIrzizs5CuTClgupHhMt8mxKgYMd+x9/M4Xp4N1ky4tQhLWnu2EFR0hNUP/GfmZdibjCkqCeMtAaujU7c2sqvzb4afXhCX9OWlDPkZau/qDd4sizZ7wlJe+6iUXomAEOumXY98hqt9kfv9PkOdGVty6JWYe14bx3+HD9OkVPOUxORpdIOTWZEfEnoS5ODdbi7V8nrd247gA/4i9vgyhxp1ETsSkhoIfYrn/ftw4j1C6Vw3eVq8ifSm0IQ1AUaF+f4KwMGZc+osMQzDGtr6A8DCsGyPSWlUo9kUXQnq6hz8DxDStPZ2bantXUIFX7BO31eaiuRv1x6u2JoqBR/tGixUv6oy6suGAFW1Cv4lKp24uo0NXaCAj2q+42SH/WMk64DH2PdiQTo41pulQQJC3IJGg4KaN3tI7/72q4IYEKXvKBKGvJuMJT53BfJV0S99Jsg/23Ujtx+6tBDaEq9XGzfxO6LkSmRjUxdzR3KnH2B/73X0jj3VqjDA4BqnqddnqCaIhF21YNcIJZ97QldnFNQkS/u53Hzi2e4s0aZoclzljeT97PY0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(16526019)(6666004)(6512007)(2616005)(1076003)(2906002)(6636002)(66556008)(186003)(86362001)(5660300002)(8936002)(83380400001)(6486002)(478600001)(44832011)(38100700002)(66946007)(52116002)(6506007)(66476007)(8676002)(4326008)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2ACJ5KeH3uyXWQ4R1ud9fJbhGzafVSlyVvFWa4EnKV1zMKlFCW9cxicz45oa?=
 =?us-ascii?Q?f8SvpMsJHtRFdwln3dFFovoAFopiLgt3j0crshQw/ffTs1Mt7lwAhGNRquQy?=
 =?us-ascii?Q?E4Ql472DYqSa9VyZnDFZO4AJLY/m1HlDYfAn67gtzLSRkz6ABee1llXJIK/5?=
 =?us-ascii?Q?UBaUIz37Y6Ox9sZNv9DZqV2DBZ8mN3FGRhFS0mORuUTSTZi8o9G6rAXxwzck?=
 =?us-ascii?Q?GsEVBaAlGzqWE7yLeGAvFvDWHJ8pWXlEe5mHRpQTgf/BppTu3wOgX4LZ4y2U?=
 =?us-ascii?Q?P4Pa1YsLK4hXRTfNKO5hSXI1C4DrU/ZidgTG1JkB4E12zGpZIiqtiWSOPvl7?=
 =?us-ascii?Q?+C/mwnklnU+buQPtw4RWtptIsp0yN++HOSxEOIfq89TyvwG50zoB175l6CpR?=
 =?us-ascii?Q?OtxomgsPUwy7P0y9olC/AP1GyGfHy4atn78e8DUdnQwRzXR+1vQtd/DdedOx?=
 =?us-ascii?Q?fZRIiMS6efFCDLubLgSfRnCnqgLnvOYoARfES4UHzuoynf8oP07QIxb+m2Ye?=
 =?us-ascii?Q?tDwhUxeh93ijClnFZshFvLnb4Id0e3qSOsYeDZb27Z9pEcFuVykZryh+F0j2?=
 =?us-ascii?Q?g4UsUSUc6DQGCLYN8g/AtbyVOYV/IwSp6KwuaiJXDh9BOC/oRVhawd5gIVQV?=
 =?us-ascii?Q?jzcDwQhjm55zV8DG232iAVdWbj+MCpsk/vluf0GqBxYtsij/FsUMxt50HE+B?=
 =?us-ascii?Q?P4QYJ1XHp6kcpxImebPnXKrHCchYXbKBMoh3H0B2QfIgMZhnF6LaWS4tKvmd?=
 =?us-ascii?Q?FJ2yHdSRvEsPV/JnV2exOf9HNt4guFN/P/ImRqieQCb47OLug+ZbdD2bCZRl?=
 =?us-ascii?Q?+oL0oNF45hpjJ4dITlpZ2oQXPTxFkxGvK043v+u0otSK0IZU4H/ZIBOxunPi?=
 =?us-ascii?Q?D/jzGB5XzWwGC7+K7r9NoucM6+fjcu4oCZ3frUe4FPInGBg0n+oEIyJ5q93/?=
 =?us-ascii?Q?TfUfC7CE79iHNFWIa9uPU15+jHp5luWz55Nep39hF5QAcz+MocQDX42k/lsO?=
 =?us-ascii?Q?/LSA227FpSHnFZFKO+NPd7OjmhpLmLqn2Kc41V7Q1oMAoUoYxBPb1o9GZg2s?=
 =?us-ascii?Q?GRFJcIFFG8+mXmhQDc+VrJ5SwYcFyRGccuZjhOpVFC3Ouf/D97uX5YuM0gAU?=
 =?us-ascii?Q?pZesVBycSLIZmqDpXZ70elEd9rhoJVERmJ3yo/YwvF0La8oCKLHEVHTpJHZZ?=
 =?us-ascii?Q?jThMNetBOA36mCdl95XZpZeKAd4kHVbgTvbKbk2+C+UkMuLytJWsllPS3T7c?=
 =?us-ascii?Q?LgijGt53wWXSJCG4hE7CrBmxju6SK0U+TYJC3HOZb9QfcpWmBGs8YF+X9Epy?=
 =?us-ascii?Q?6ihIhrdBkeqasauFSxiBqYyNtN/QEf+kG+lOwpJozC/xkYs87N3InnnCc34Y?=
 =?us-ascii?Q?ZfWD/MyeFWzGMe5lDMJJ6PGymlDv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b85e3b6-4552-4279-9c70-08d90a58234c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:13:11.6638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSTeXZTCwCPDbHYCOt9686yHGB60m7hCxTbxPgAcLinNusjfJHXFati8aP7dX0jBirwQrzv5QhiIi8RxYaPSnQ==
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
 .../amd/display/amdgpu_dm/amdgpu_dm_hdcp.c    | 124 +++++++++++-------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c |  24 +++-
 2 files changed, 98 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
index 0cdbfcd475ec..81ea5a1ea46b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
@@ -28,6 +28,7 @@
 #include "amdgpu_dm.h"
 #include "dm_helpers.h"
 #include <drm/drm_hdcp.h>
+#include <drm/drm_drv.h>
 #include "hdcp_psp.h"
 
 /*
@@ -260,20 +261,27 @@ void hdcp_handle_cpirq(struct hdcp_workqueue *hdcp_work, unsigned int link_index
 static void event_callback(struct work_struct *work)
 {
 	struct hdcp_workqueue *hdcp_work;
+	int idx;
 
 	hdcp_work = container_of(to_delayed_work(work), struct hdcp_workqueue,
 				      callback_dwork);
 
-	mutex_lock(&hdcp_work->mutex);
+	if (drm_dev_enter(hdcp_work->aconnector->base.dev, &idx)) {
 
-	cancel_delayed_work(&hdcp_work->callback_dwork);
+		mutex_lock(&hdcp_work->mutex);
 
-	mod_hdcp_process_event(&hdcp_work->hdcp, MOD_HDCP_EVENT_CALLBACK,
-			       &hdcp_work->output);
+		cancel_delayed_work(&hdcp_work->callback_dwork);
+
+		mod_hdcp_process_event(&hdcp_work->hdcp, MOD_HDCP_EVENT_CALLBACK,
+				       &hdcp_work->output);
 
-	process_output(hdcp_work);
+		process_output(hdcp_work);
 
-	mutex_unlock(&hdcp_work->mutex);
+		mutex_unlock(&hdcp_work->mutex);
+
+		drm_dev_exit(idx);
+
+	}
 
 
 }
@@ -284,34 +292,41 @@ static void event_property_update(struct work_struct *work)
 	struct amdgpu_dm_connector *aconnector = hdcp_work->aconnector;
 	struct drm_device *dev = hdcp_work->aconnector->base.dev;
 	long ret;
+	int idx;
+
+	if (drm_dev_enter(dev, &idx)) {
+
+		drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
+		mutex_lock(&hdcp_work->mutex);
 
-	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
-	mutex_lock(&hdcp_work->mutex);
 
+		if (aconnector->base.state->commit) {
+			ret = wait_for_completion_interruptible_timeout(&aconnector->base.state->commit->hw_done, 10 * HZ);
 
-	if (aconnector->base.state->commit) {
-		ret = wait_for_completion_interruptible_timeout(&aconnector->base.state->commit->hw_done, 10 * HZ);
+			if (ret == 0) {
+				DRM_ERROR("HDCP state unknown! Setting it to DESIRED");
+				hdcp_work->encryption_status = MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF;
+			}
+		}
 
-		if (ret == 0) {
-			DRM_ERROR("HDCP state unknown! Setting it to DESIRED");
-			hdcp_work->encryption_status = MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF;
+		if (hdcp_work->encryption_status != MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF) {
+			if (aconnector->base.state->hdcp_content_type == DRM_MODE_HDCP_CONTENT_TYPE0 &&
+			    hdcp_work->encryption_status <= MOD_HDCP_ENCRYPTION_STATUS_HDCP2_TYPE0_ON)
+				drm_hdcp_update_content_protection(&aconnector->base, DRM_MODE_CONTENT_PROTECTION_ENABLED);
+			else if (aconnector->base.state->hdcp_content_type == DRM_MODE_HDCP_CONTENT_TYPE1 &&
+				 hdcp_work->encryption_status == MOD_HDCP_ENCRYPTION_STATUS_HDCP2_TYPE1_ON)
+				drm_hdcp_update_content_protection(&aconnector->base, DRM_MODE_CONTENT_PROTECTION_ENABLED);
+		} else {
+			drm_hdcp_update_content_protection(&aconnector->base, DRM_MODE_CONTENT_PROTECTION_DESIRED);
 		}
-	}
 
-	if (hdcp_work->encryption_status != MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF) {
-		if (aconnector->base.state->hdcp_content_type == DRM_MODE_HDCP_CONTENT_TYPE0 &&
-		    hdcp_work->encryption_status <= MOD_HDCP_ENCRYPTION_STATUS_HDCP2_TYPE0_ON)
-			drm_hdcp_update_content_protection(&aconnector->base, DRM_MODE_CONTENT_PROTECTION_ENABLED);
-		else if (aconnector->base.state->hdcp_content_type == DRM_MODE_HDCP_CONTENT_TYPE1 &&
-			 hdcp_work->encryption_status == MOD_HDCP_ENCRYPTION_STATUS_HDCP2_TYPE1_ON)
-			drm_hdcp_update_content_protection(&aconnector->base, DRM_MODE_CONTENT_PROTECTION_ENABLED);
-	} else {
-		drm_hdcp_update_content_protection(&aconnector->base, DRM_MODE_CONTENT_PROTECTION_DESIRED);
-	}
 
+		mutex_unlock(&hdcp_work->mutex);
+		drm_modeset_unlock(&dev->mode_config.connection_mutex);
+
+		drm_dev_exit(idx);
 
-	mutex_unlock(&hdcp_work->mutex);
-	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+	}
 }
 
 static void event_property_validate(struct work_struct *work)
@@ -320,58 +335,77 @@ static void event_property_validate(struct work_struct *work)
 		container_of(to_delayed_work(work), struct hdcp_workqueue, property_validate_dwork);
 	struct mod_hdcp_display_query query;
 	struct amdgpu_dm_connector *aconnector = hdcp_work->aconnector;
+	int idx;
 
 	if (!aconnector)
 		return;
 
-	mutex_lock(&hdcp_work->mutex);
+	if (drm_dev_enter(hdcp_work->aconnector->base.dev, &idx)) {
 
-	query.encryption_status = MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF;
-	mod_hdcp_query_display(&hdcp_work->hdcp, aconnector->base.index, &query);
+		mutex_lock(&hdcp_work->mutex);
 
-	if (query.encryption_status != hdcp_work->encryption_status) {
-		hdcp_work->encryption_status = query.encryption_status;
-		schedule_work(&hdcp_work->property_update_work);
-	}
+		query.encryption_status = MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF;
+		mod_hdcp_query_display(&hdcp_work->hdcp, aconnector->base.index, &query);
+
+		if (query.encryption_status != hdcp_work->encryption_status) {
+			hdcp_work->encryption_status = query.encryption_status;
+			schedule_work(&hdcp_work->property_update_work);
+		}
+
+		mutex_unlock(&hdcp_work->mutex);
 
-	mutex_unlock(&hdcp_work->mutex);
+		drm_dev_exit(idx);
+
+	}
 }
 
 static void event_watchdog_timer(struct work_struct *work)
 {
 	struct hdcp_workqueue *hdcp_work;
+	int idx;
 
 	hdcp_work = container_of(to_delayed_work(work),
 				      struct hdcp_workqueue,
 				      watchdog_timer_dwork);
 
-	mutex_lock(&hdcp_work->mutex);
+	if (drm_dev_enter(hdcp_work->aconnector->base.dev, &idx)) {
 
-	cancel_delayed_work(&hdcp_work->watchdog_timer_dwork);
+		mutex_lock(&hdcp_work->mutex);
 
-	mod_hdcp_process_event(&hdcp_work->hdcp,
-			       MOD_HDCP_EVENT_WATCHDOG_TIMEOUT,
-			       &hdcp_work->output);
+		cancel_delayed_work(&hdcp_work->watchdog_timer_dwork);
 
-	process_output(hdcp_work);
+		mod_hdcp_process_event(&hdcp_work->hdcp,
+				       MOD_HDCP_EVENT_WATCHDOG_TIMEOUT,
+				       &hdcp_work->output);
 
-	mutex_unlock(&hdcp_work->mutex);
+		process_output(hdcp_work);
+
+		mutex_unlock(&hdcp_work->mutex);
+
+		drm_dev_exit(idx);
+	}
 
 }
 
 static void event_cpirq(struct work_struct *work)
 {
 	struct hdcp_workqueue *hdcp_work;
+	int idx;
 
 	hdcp_work = container_of(work, struct hdcp_workqueue, cpirq_work);
 
-	mutex_lock(&hdcp_work->mutex);
+	if (drm_dev_enter(hdcp_work->aconnector->base.dev, &idx)) {
 
-	mod_hdcp_process_event(&hdcp_work->hdcp, MOD_HDCP_EVENT_CPIRQ, &hdcp_work->output);
+		mutex_lock(&hdcp_work->mutex);
 
-	process_output(hdcp_work);
+		mod_hdcp_process_event(&hdcp_work->hdcp, MOD_HDCP_EVENT_CPIRQ, &hdcp_work->output);
 
-	mutex_unlock(&hdcp_work->mutex);
+		process_output(hdcp_work);
+
+		mutex_unlock(&hdcp_work->mutex);
+
+		drm_dev_exit(idx);
+	}
 
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
index e0000c180ed1..d8ee552d373e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
@@ -30,6 +30,8 @@
 #include "amdgpu_dm.h"
 #include "amdgpu_dm_irq.h"
 
+#include <drm/drm_drv.h>
+
 /**
  * DOC: overview
  *
@@ -115,15 +117,27 @@ static void dm_irq_work_func(struct work_struct *work)
 		container_of(work, struct irq_list_head, work);
 	struct list_head *handler_list = &irq_list_head->head;
 	struct amdgpu_dm_irq_handler_data *handler_data;
+	int idx;
+
+
+	handler_data = list_first_entry_or_null(handler_list, struct amdgpu_dm_irq_handler_data, list);
+
+	if (!handler_data)
+		return;
 
-	list_for_each_entry(handler_data, handler_list, list) {
-		DRM_DEBUG_KMS("DM_IRQ: work_func: for dal_src=%d\n",
+	if (drm_dev_enter(handler_data->dm->ddev, &idx)) {
+
+		list_for_each_entry(handler_data, handler_list, list) {
+			DRM_DEBUG_KMS("DM_IRQ: work_func: for dal_src=%d\n",
+					handler_data->irq_source);
+
+			DRM_DEBUG_KMS("DM_IRQ: schedule_work: for dal_src=%d\n",
 				handler_data->irq_source);
 
-		DRM_DEBUG_KMS("DM_IRQ: schedule_work: for dal_src=%d\n",
-			handler_data->irq_source);
+			handler_data->handler(handler_data->handler_arg);
+		}
 
-		handler_data->handler(handler_data->handler_arg);
+		drm_dev_exit(idx);
 	}
 
 	/* Call a DAL subcomponent which registered for interrupt notification
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
