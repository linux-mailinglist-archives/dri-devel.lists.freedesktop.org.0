Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2327453C029
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 23:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2678A112985;
	Thu,  2 Jun 2022 21:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5457F10E427
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 21:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654203671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oqtjLES5h9VyqujFfP0LIXi0+7ZX2bu0LxgK1iAi69Q=;
 b=U9avYneDIlBG87XTRH4qQN5K4J2pAN078eK5WNsYk+dnhQzixJEWfP3t2vv+XFc2KYg9HC
 H7tuIVZfeQoIPHWzNNIM4ukrj9wCqciiDPUB59PLDdDwRy92Lv7SDPRM8QCb0zuxVM4adK
 QwJNxZdzKVOq1TVkwG4SvU2d+NYjK5E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-niFFMZ9nMa2Ed0rJvorMbQ-1; Thu, 02 Jun 2022 17:01:08 -0400
X-MC-Unique: niFFMZ9nMa2Ed0rJvorMbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 609E8101A54E;
 Thu,  2 Jun 2022 21:01:07 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.34.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD5671410F36;
 Thu,  2 Jun 2022 21:01:06 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: amd-gfx@freedesktop.org
Subject: [PATCH 2/3] drm/amdgpu/dm/mst: Stop grabbing mst_mgr->lock in
 pre_compute_mst_dsc_configs_for_state()
Date: Thu,  2 Jun 2022 17:00:55 -0400
Message-Id: <20220602210056.73316-3-lyude@redhat.com>
In-Reply-To: <20220602210056.73316-1-lyude@redhat.com>
References: <20220602210056.73316-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <Roman.Li@amd.com>, Hersen Wu <hersenwu@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>,
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This lock is only needed if you're iterating through the in-memory topology
(e.g. drm_dp_mst_branch->ports, drm_dp_mst_port->mstb, etc.). This doesn't
actually seem to be what's going on here though, so we can just drop this
lock.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index cb3b0e08acc4..1259f2f7a8f9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1112,16 +1112,12 @@ static bool
 		if (!is_dsc_need_re_compute(state, dc_state, stream->link))
 			continue;
 
-		mutex_lock(&aconnector->mst_mgr.lock);
 		if (!compute_mst_dsc_configs_for_link(state,
 						      dc_state,
 						      stream->link,
 						      vars,
-						      &link_vars_start_index)) {
-			mutex_unlock(&aconnector->mst_mgr.lock);
+						      &link_vars_start_index))
 			return false;
-		}
-		mutex_unlock(&aconnector->mst_mgr.lock);
 
 		for (j = 0; j < dc_state->stream_count; j++) {
 			if (dc_state->streams[j]->link == stream->link)
-- 
2.35.3

