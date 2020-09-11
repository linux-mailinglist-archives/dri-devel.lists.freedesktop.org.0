Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E20D2661B4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 17:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C89D6EA7F;
	Fri, 11 Sep 2020 15:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAEB6EA7D;
 Fri, 11 Sep 2020 15:00:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVye1pkXboDDMZoUY/64wuVU8ixDGcsBrYO4QfACmRqRa3XrcxUWp1S1LWIGDS8Xo8Q5Ov1Bt89zSmJV2PENb7OXmiqESiHr3ZHa9qHqdFPcEa2cbTe2s/DoYYrPUodGL1OQ3TqJjEb7vuu/4MU3KZORlXKbXOaK7qnz0//knbU7Tuww9tbXX9a60cJtJv2t9X+YsR5dmXsRk01axv3HxwRJqil1f+wYFF3aZkyPKBot7jnVZg05hheoW2V4GveZ3qLQRangaGkDqj1sHXM5XoeWqp9r50j+hhYqePDLztUugE89OaCQmI/XA3jHyEY9QE8LzzfU0BMSEgNzbZXCvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weOxQUQB5RUpbq6rgfqy3vqokZqHIdeAziqdnzCsEsA=;
 b=eP8dwsJzPymzluXKLRTEbSItvi/V5BecPcHCyum3YObPadt+Aol743cQTXUQHeKzelJmrS7RwKptwZJnt2ZI8FTI3KHNoOHOOxvfgOrF09VzBwZEV+ZOvdawbzd1/mBIqYPn5lcv44/gMSxRWSAKEwpOV4IogKxcGyjuwch1LZ+8R5s+svppJigQz73FJyQL5b3tqHnqJJgkvg1Ej7+mV6Sd6yAsWjw15fH++mZShUhQSmszQTM0BsMrbLy+K/lJahwZCcnHfWFcJjOmK/pc2oHWC9cLaYeviLewOp3tj9IbsgU5btGnV8G4QKl5Q6XcGK3f4+NeAVmSZcHEYGtkMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weOxQUQB5RUpbq6rgfqy3vqokZqHIdeAziqdnzCsEsA=;
 b=wVgFDdCbnMYQrJYH+NDb6MdfbhpDHAVjnFRKvd4qoy9FwP+b9WbbOLRxYz/nawKoXwXVMxzqvatGTDhmItK+KbzZ4jSHUHIGgG/pLL+19a61deCj0FBndITbceJGSUM+quBFVtvEF3/N71r4/zGN+MbfpduIwXybOUz0IBItNmc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20)
 by DM6PR12MB3082.namprd12.prod.outlook.com (2603:10b6:5:11b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Fri, 11 Sep
 2020 14:59:59 +0000
Received: from DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e]) by DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e%8]) with mapi id 15.20.3370.017; Fri, 11 Sep 2020
 14:59:59 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] drm/amd/display: Add tracepoint for amdgpu_dm
Date: Fri, 11 Sep 2020 10:59:25 -0400
Message-Id: <20200911145927.401322-3-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200911145927.401322-1-Rodrigo.Siqueira@amd.com>
References: <20200911145927.401322-1-Rodrigo.Siqueira@amd.com>
X-ClientProxiedBy: YTOPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::37) To DM6PR12MB4124.namprd12.prod.outlook.com
 (2603:10b6:5:221::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60::e9a1) by
 YTOPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Fri, 11 Sep 2020 14:59:59 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [2607:fea8:56e0:6d60::e9a1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b5d17172-75b9-41c6-4f10-08d856635a96
X-MS-TrafficTypeDiagnostic: DM6PR12MB3082:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB308240610DDF9B28FD6EACDF98240@DM6PR12MB3082.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:83;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xtgRp/EXI4a9fbKjWwDFvBWyD1Q1+sonGWckUHJ6d2IaQ6FdmzxSdfWPQFXY219gwcsxzy49coQ3uvP6KndfEDq1Q67INJmXu3qTaPH1Mg7oK3F4GrOzuHNXSZ+OnzDgJXGn9xSkYNJEPcyCsbwq0k5Xuar1kEU6lkXYKWo5XbQGtj9+Pw+20gAZ0BSXb7o4Dw2UUCDgn3yzFuA8nKOwepBFbR8fc/O6RltMc97IxIApdxX+/QY87oE0Z4DwGSZB2ZGePUA866oMYKJgV4lBMTHpq3g0uxHRT1CBQdN9wdhgMFmEuVk6ii1lQQzGzm4NxjaH4h14VGBxkmtL1C0g/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4124.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(66476007)(86362001)(1076003)(52116002)(83380400001)(2906002)(6506007)(8676002)(316002)(30864003)(66556008)(5660300002)(186003)(6666004)(478600001)(8936002)(4326008)(6486002)(36756003)(66946007)(6512007)(16526019)(54906003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: sKsvxVYcPYvvD/wfadZE0qeqVR5zon2njUuQHqb9RuVKToPNYOd/uqB5XJGnt9BxAOBYR4WgUDczqZ01HBhMYVhJjSFCjDlopRV2hgwt5SoW0VFbUwkjzds5yzgCX12DFz7zb9DPDTXBEH2HEHFbQVONrw2NQu875t9ftKW0MSTXaqPx5xs/O/gOAgu8PhhzCDKCKvyT9QaX5Euz8z3MuqWsTjvlNPdCdf8ZDbDD/rQcEBWgVpiCLD/kgZf1IJffw7Nw0kUzpOckRcqqj0vpdEN7sDWUguaaL33L+yvLJOWIlhoycGadJy7oIQWuRFQOJc4EGU0DxixDj9MRJm1iBJWCahAfCGV0SSagTliYWwzCd4jLAYpnm3BttbVHWYnfNY5GvetleclmVIb1OU+ogDt6P6+kqK7AXdOvwG/CfLzMWr3TQBoqUOHClUVOHOh1SAzLt6l8x9h1/zkGYvB2CIkBIQG7AAnKiyWTj1xyTjtLnwaPbvckURBHwgQrvWDz4mZhLAlLSsPzdCX7/S1KcQ7cHOzQ0bqx2fd2K5+N7dIiMZi3FMvZZmH+b+bc7Wvyd6nwWBt+UtxTa1Pr/GtD9OcI3LmlE/mxqS1iwbcHuH5MjU0em2E4vvz5iAfj2iFpafdftEQJV89oo7IoCmoOKV/AWv3TIkvqZLZiUPeFH+U=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d17172-75b9-41c6-4f10-08d856635a96
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 14:59:59.6089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQi9DJXK2tgnz+wHpW50mBnCNlMo4tSXwq1cyKnuL9R73Nr0YmYAkNypI+InfR/O/3o+ruOb+W0zND5o7HuoYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3082
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, hersenxs.wu@amd.com,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Debug amdgpu_dm could be a complicated task, therefore, this commit adds
tracepoints in some convenient functions such as plane and connector
check inside amdgpu_dm.

Co-developed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  17 ++
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 287 ++++++++++++++++++
 2 files changed, 304 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index cb624ee70545..552ca67c2a71 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5424,6 +5424,8 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
 	struct drm_crtc_state *new_crtc_state;
 	int ret;
 
+	trace_amdgpu_dm_connector_atomic_check(new_con_state);
+
 	if (!crtc)
 		return 0;
 
@@ -5542,6 +5544,8 @@ static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	struct dm_crtc_state *dm_crtc_state = to_dm_crtc_state(state);
 	int ret = -EINVAL;
 
+	trace_amdgpu_dm_crtc_atomic_check(state);
+
 	dm_update_crtc_active_planes(crtc, state);
 
 	if (unlikely(!dm_crtc_state->stream &&
@@ -5916,6 +5920,8 @@ static int dm_plane_atomic_check(struct drm_plane *plane,
 	struct drm_crtc_state *new_crtc_state;
 	int ret;
 
+	trace_amdgpu_dm_plane_atomic_check(state);
+
 	dm_plane_state = to_dm_plane_state(state);
 
 	if (!dm_plane_state->dc_state)
@@ -5956,6 +5962,8 @@ static void dm_plane_atomic_async_update(struct drm_plane *plane,
 	struct drm_plane_state *old_state =
 		drm_atomic_get_old_plane_state(new_state->state, plane);
 
+	trace_amdgpu_dm_atomic_update_cursor(new_state);
+
 	swap(plane->state->fb, new_state->fb);
 
 	plane->state->src_x = new_state->src_x;
@@ -7546,6 +7554,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	int crtc_disable_count = 0;
 	bool mode_set_reset_required = false;
 
+	trace_amdgpu_dm_atomic_commit_tail_begin(state);
+
 	drm_atomic_helper_update_legacy_modeset_state(dev, state);
 
 	dm_state = dm_atomic_get_new_state(state);
@@ -8616,6 +8626,8 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 	int ret, i;
 	bool lock_and_validation_needed = false;
 
+	trace_amdgpu_dm_atomic_check_begin(state);
+
 	ret = drm_atomic_helper_check_modeset(dev, state);
 	if (ret)
 		goto fail;
@@ -8912,6 +8924,9 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 
 	/* Must be success */
 	WARN_ON(ret);
+
+	trace_amdgpu_dm_atomic_check_finish(state, ret);
+
 	return ret;
 
 fail:
@@ -8922,6 +8937,8 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 	else
 		DRM_DEBUG_DRIVER("Atomic check failed with err: %d \n", ret);
 
+	trace_amdgpu_dm_atomic_check_finish(state, ret);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
index dd34e11b1079..5fb4c4a5c349 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
@@ -30,6 +30,12 @@
 #define _AMDGPU_DM_TRACE_H_
 
 #include <linux/tracepoint.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_atomic.h>
 
 DECLARE_EVENT_CLASS(amdgpu_dc_reg_template,
 		    TP_PROTO(unsigned long *count, uint32_t reg, uint32_t value),
@@ -89,6 +95,287 @@ TRACE_EVENT(amdgpu_dc_performance,
 			(unsigned long)__entry->write_delta,
 			(unsigned long)__entry->writes)
 );
+
+TRACE_EVENT(amdgpu_dm_connector_atomic_check,
+	    TP_PROTO(const struct drm_connector_state *state),
+	    TP_ARGS(state),
+
+	    TP_STRUCT__entry(
+			     __field(uint32_t, conn_id)
+			     __field(const struct drm_connector_state *, conn_state)
+			     __field(const struct drm_atomic_state *, state)
+			     __field(const struct drm_crtc_commit *, commit)
+			     __field(uint32_t, crtc_id)
+			     __field(uint32_t, best_encoder_id)
+			     __field(enum drm_link_status, link_status)
+			     __field(bool, self_refresh_aware)
+			     __field(enum hdmi_picture_aspect, picture_aspect_ratio)
+			     __field(unsigned int, content_type)
+			     __field(unsigned int, hdcp_content_type)
+			     __field(unsigned int, content_protection)
+			     __field(unsigned int, scaling_mode)
+			     __field(u32, colorspace)
+			     __field(u8, max_requested_bpc)
+			     __field(u8, max_bpc)
+	    ),
+
+	    TP_fast_assign(
+			   __entry->conn_id = state->connector->base.id;
+			   __entry->conn_state = state;
+			   __entry->state = state->state;
+			   __entry->commit = state->commit;
+			   __entry->crtc_id = state->crtc ? state->crtc->base.id : 0;
+			   __entry->best_encoder_id = state->best_encoder ?
+						      state->best_encoder->base.id : 0;
+			   __entry->link_status = state->link_status;
+			   __entry->self_refresh_aware = state->self_refresh_aware;
+			   __entry->picture_aspect_ratio = state->picture_aspect_ratio;
+			   __entry->content_type = state->content_type;
+			   __entry->hdcp_content_type = state->hdcp_content_type;
+			   __entry->content_protection = state->content_protection;
+			   __entry->scaling_mode = state->scaling_mode;
+			   __entry->colorspace = state->colorspace;
+			   __entry->max_requested_bpc = state->max_requested_bpc;
+			   __entry->max_bpc = state->max_bpc;
+	    ),
+
+	    TP_printk("conn_id=%u conn_state=%p state=%p commit=%p crtc_id=%u "
+		      "best_encoder_id=%u link_status=%d self_refresh_aware=%d "
+		      "picture_aspect_ratio=%d content_type=%u "
+		      "hdcp_content_type=%u content_protection=%u scaling_mode=%u "
+		      "colorspace=%u max_requested_bpc=%u max_bpc=%u",
+		      __entry->conn_id, __entry->conn_state, __entry->state,
+		      __entry->commit, __entry->crtc_id, __entry->best_encoder_id,
+		      __entry->link_status, __entry->self_refresh_aware,
+		      __entry->picture_aspect_ratio, __entry->content_type,
+		      __entry->hdcp_content_type, __entry->content_protection,
+		      __entry->scaling_mode, __entry->colorspace,
+		      __entry->max_requested_bpc, __entry->max_bpc)
+);
+
+TRACE_EVENT(amdgpu_dm_crtc_atomic_check,
+	    TP_PROTO(const struct drm_crtc_state *state),
+	    TP_ARGS(state),
+
+	    TP_STRUCT__entry(
+			     __field(const struct drm_atomic_state *, state)
+			     __field(const struct drm_crtc_state *, crtc_state)
+			     __field(const struct drm_crtc_commit *, commit)
+			     __field(uint32_t, crtc_id)
+			     __field(bool, enable)
+			     __field(bool, active)
+			     __field(bool, planes_changed)
+			     __field(bool, mode_changed)
+			     __field(bool, active_changed)
+			     __field(bool, connectors_changed)
+			     __field(bool, zpos_changed)
+			     __field(bool, color_mgmt_changed)
+			     __field(bool, no_vblank)
+			     __field(bool, async_flip)
+			     __field(bool, vrr_enabled)
+			     __field(bool, self_refresh_active)
+			     __field(u32, plane_mask)
+			     __field(u32, connector_mask)
+			     __field(u32, encoder_mask)
+	    ),
+
+	    TP_fast_assign(
+			   __entry->state = state->state;
+			   __entry->crtc_state = state;
+			   __entry->crtc_id = state->crtc->base.id;
+			   __entry->commit = state->commit;
+			   __entry->enable = state->enable;
+			   __entry->active = state->active;
+			   __entry->planes_changed = state->planes_changed;
+			   __entry->mode_changed = state->mode_changed;
+			   __entry->active_changed = state->active_changed;
+			   __entry->connectors_changed = state->connectors_changed;
+			   __entry->zpos_changed = state->zpos_changed;
+			   __entry->color_mgmt_changed = state->color_mgmt_changed;
+			   __entry->no_vblank = state->no_vblank;
+			   __entry->async_flip = state->async_flip;
+			   __entry->vrr_enabled = state->vrr_enabled;
+			   __entry->self_refresh_active = state->self_refresh_active;
+			   __entry->plane_mask = state->plane_mask;
+			   __entry->connector_mask = state->connector_mask;
+			   __entry->encoder_mask = state->encoder_mask;
+	    ),
+
+	    TP_printk("crtc_id=%u crtc_state=%p state=%p commit=%p changed("
+		      "planes=%d mode=%d active=%d conn=%d zpos=%d color_mgmt=%d) "
+		      "state(enable=%d active=%d async_flip=%d vrr_enabled=%d "
+		      "self_refresh_active=%d no_vblank=%d) mask(plane=%x conn=%x "
+		      "enc=%x)",
+		      __entry->crtc_id, __entry->crtc_state, __entry->state,
+		      __entry->commit, __entry->planes_changed,
+		      __entry->mode_changed, __entry->active_changed,
+		      __entry->connectors_changed, __entry->zpos_changed,
+		      __entry->color_mgmt_changed, __entry->enable, __entry->active,
+		      __entry->async_flip, __entry->vrr_enabled,
+		      __entry->self_refresh_active, __entry->no_vblank,
+		      __entry->plane_mask, __entry->connector_mask,
+		      __entry->encoder_mask)
+);
+
+DECLARE_EVENT_CLASS(amdgpu_dm_plane_state_template,
+	    TP_PROTO(const struct drm_plane_state *state),
+	    TP_ARGS(state),
+	    TP_STRUCT__entry(
+			     __field(uint32_t, plane_id)
+			     __field(enum drm_plane_type, plane_type)
+			     __field(const struct drm_plane_state *, plane_state)
+			     __field(const struct drm_atomic_state *, state)
+			     __field(uint32_t, crtc_id)
+			     __field(uint32_t, fb_id)
+			     __field(uint32_t, fb_format)
+			     __field(uint8_t, fb_planes)
+			     __field(uint64_t, fb_modifier)
+			     __field(const struct dma_fence *, fence)
+			     __field(int32_t, crtc_x)
+			     __field(int32_t, crtc_y)
+			     __field(uint32_t, crtc_w)
+			     __field(uint32_t, crtc_h)
+			     __field(uint32_t, src_x)
+			     __field(uint32_t, src_y)
+			     __field(uint32_t, src_w)
+			     __field(uint32_t, src_h)
+			     __field(u32, alpha)
+			     __field(uint32_t, pixel_blend_mode)
+			     __field(unsigned int, rotation)
+			     __field(unsigned int, zpos)
+			     __field(unsigned int, normalized_zpos)
+			     __field(enum drm_color_encoding, color_encoding)
+			     __field(enum drm_color_range, color_range)
+			     __field(bool, visible)
+	    ),
+
+	    TP_fast_assign(
+			   __entry->plane_id = state->plane->base.id;
+			   __entry->plane_type = state->plane->type;
+			   __entry->plane_state = state;
+			   __entry->state = state->state;
+			   __entry->crtc_id = state->crtc ? state->crtc->base.id : 0;
+			   __entry->fb_id = state->fb ? state->fb->base.id : 0;
+			   __entry->fb_format = state->fb ? state->fb->format->format : 0;
+			   __entry->fb_planes = state->fb ? state->fb->format->num_planes : 0;
+			   __entry->fb_modifier = state->fb ? state->fb->modifier : 0;
+			   __entry->fence = state->fence;
+			   __entry->crtc_x = state->crtc_x;
+			   __entry->crtc_y = state->crtc_y;
+			   __entry->crtc_w = state->crtc_w;
+			   __entry->crtc_h = state->crtc_h;
+			   __entry->src_x = state->src_x >> 16;
+			   __entry->src_y = state->src_y >> 16;
+			   __entry->src_w = state->src_w >> 16;
+			   __entry->src_h = state->src_h >> 16;
+			   __entry->alpha = state->alpha;
+			   __entry->pixel_blend_mode = state->pixel_blend_mode;
+			   __entry->rotation = state->rotation;
+			   __entry->zpos = state->zpos;
+			   __entry->normalized_zpos = state->normalized_zpos;
+			   __entry->color_encoding = state->color_encoding;
+			   __entry->color_range = state->color_range;
+			   __entry->visible = state->visible;
+	    ),
+
+	    TP_printk("plane_id=%u plane_type=%d plane_state=%p state=%p "
+		      "crtc_id=%u fb(id=%u fmt=%c%c%c%c planes=%u mod=%llu) "
+		      "fence=%p crtc_x=%d crtc_y=%d crtc_w=%u crtc_h=%u "
+		      "src_x=%u src_y=%u src_w=%u src_h=%u alpha=%u "
+		      "pixel_blend_mode=%u rotation=%u zpos=%u "
+		      "normalized_zpos=%u color_encoding=%d color_range=%d "
+		      "visible=%d",
+		      __entry->plane_id, __entry->plane_type, __entry->plane_state,
+		      __entry->state, __entry->crtc_id, __entry->fb_id,
+		      (__entry->fb_format & 0xff) ? (__entry->fb_format & 0xff) : 'N',
+		      ((__entry->fb_format >> 8) & 0xff) ? ((__entry->fb_format >> 8) & 0xff) : 'O',
+		      ((__entry->fb_format >> 16) & 0xff) ? ((__entry->fb_format >> 16) & 0xff) : 'N',
+		      ((__entry->fb_format >> 24) & 0x7f) ? ((__entry->fb_format >> 24) & 0x7f) : 'E',
+		      __entry->fb_planes,
+		      __entry->fb_modifier, __entry->fence, __entry->crtc_x,
+		      __entry->crtc_y, __entry->crtc_w, __entry->crtc_h,
+		      __entry->src_x, __entry->src_y, __entry->src_w, __entry->src_h,
+		      __entry->alpha, __entry->pixel_blend_mode, __entry->rotation,
+		      __entry->zpos, __entry->normalized_zpos,
+		      __entry->color_encoding, __entry->color_range,
+		      __entry->visible)
+);
+
+DEFINE_EVENT(amdgpu_dm_plane_state_template, amdgpu_dm_plane_atomic_check,
+	     TP_PROTO(const struct drm_plane_state *state),
+	     TP_ARGS(state));
+
+DEFINE_EVENT(amdgpu_dm_plane_state_template, amdgpu_dm_atomic_update_cursor,
+	     TP_PROTO(const struct drm_plane_state *state),
+	     TP_ARGS(state));
+
+TRACE_EVENT(amdgpu_dm_atomic_state_template,
+	    TP_PROTO(const struct drm_atomic_state *state),
+	    TP_ARGS(state),
+
+	    TP_STRUCT__entry(
+			     __field(const struct drm_atomic_state *, state)
+			     __field(bool, allow_modeset)
+			     __field(bool, legacy_cursor_update)
+			     __field(bool, async_update)
+			     __field(bool, duplicated)
+			     __field(int, num_connector)
+			     __field(int, num_private_objs)
+	    ),
+
+	    TP_fast_assign(
+			   __entry->state = state;
+			   __entry->allow_modeset = state->allow_modeset;
+			   __entry->legacy_cursor_update = state->legacy_cursor_update;
+			   __entry->async_update = state->async_update;
+			   __entry->duplicated = state->duplicated;
+			   __entry->num_connector = state->num_connector;
+			   __entry->num_private_objs = state->num_private_objs;
+	    ),
+
+	    TP_printk("state=%p allow_modeset=%d legacy_cursor_update=%d "
+		      "async_update=%d duplicated=%d num_connector=%d "
+		      "num_private_objs=%d",
+		      __entry->state, __entry->allow_modeset, __entry->legacy_cursor_update,
+		      __entry->async_update, __entry->duplicated, __entry->num_connector,
+		      __entry->num_private_objs)
+);
+
+DEFINE_EVENT(amdgpu_dm_atomic_state_template, amdgpu_dm_atomic_commit_tail_begin,
+	     TP_PROTO(const struct drm_atomic_state *state),
+	     TP_ARGS(state));
+
+DEFINE_EVENT(amdgpu_dm_atomic_state_template, amdgpu_dm_atomic_commit_tail_finish,
+	     TP_PROTO(const struct drm_atomic_state *state),
+	     TP_ARGS(state));
+
+DEFINE_EVENT(amdgpu_dm_atomic_state_template, amdgpu_dm_atomic_check_begin,
+	     TP_PROTO(const struct drm_atomic_state *state),
+	     TP_ARGS(state));
+
+TRACE_EVENT(amdgpu_dm_atomic_check_finish,
+	    TP_PROTO(const struct drm_atomic_state *state, int res),
+	    TP_ARGS(state, res),
+
+	    TP_STRUCT__entry(
+			     __field(const struct drm_atomic_state *, state)
+			     __field(int, res)
+			     __field(bool, async_update)
+			     __field(bool, allow_modeset)
+	    ),
+
+	    TP_fast_assign(
+			   __entry->state = state;
+			   __entry->res = res;
+			   __entry->async_update = state->async_update;
+			   __entry->allow_modeset = state->allow_modeset;
+	    ),
+
+	    TP_printk("state=%p res=%d async_update=%d allow_modeset=%d",
+		      __entry->state, __entry->res,
+		      __entry->async_update, __entry->allow_modeset)
+);
+
 #endif /* _AMDGPU_DM_TRACE_H_ */
 
 #undef TRACE_INCLUDE_PATH
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
