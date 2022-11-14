Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 922C6628BFB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 23:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1B210E33C;
	Mon, 14 Nov 2022 22:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5B410E339
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 22:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668464327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O/M4W3uv7gwCZ1OdzG4UeM3eO9Q4aCQx77adsACSB0c=;
 b=dJ5iQu48CKb9ClMtg50GY2b4Mt277uWPxCXzNqD44W9nyt7rosvSLhWHc5QyEdJ/t83OhH
 8TV529gjx9l2fyORHzd3GjIoa0Wq+mTANwcfmIpoRGxm6mrSHeZmWhhZHGklTs6dEZDBOG
 /DI7mxeQPoWWKiv7cEWgJe0nNn0hQEI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-xk6AjHqqOZyE6qJvTWmfFg-1; Mon, 14 Nov 2022 17:18:44 -0500
X-MC-Unique: xk6AjHqqOZyE6qJvTWmfFg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07A692A59559;
 Mon, 14 Nov 2022 22:18:43 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4761E4022C3;
 Mon, 14 Nov 2022 22:18:42 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/amdgpu/dm/dp_mst: Don't grab mst_mgr->lock when
 computing DSC state
Date: Mon, 14 Nov 2022 17:17:55 -0500
Message-Id: <20221114221754.385090-5-lyude@redhat.com>
In-Reply-To: <20221114221754.385090-1-lyude@redhat.com>
References: <20221114221754.385090-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <Roman.Li@amd.com>, stable@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we've fixed the issue with using the incorrect topology manager,
we're actually grabbing the topology manager's lock - and consequently
deadlocking. Luckily for us though, there's actually nothing in AMD's DSC
state computation code that really should need this lock. The one exception
is the mutex_lock() in dm_dp_mst_is_port_support_mode(), however we grab no
locks beneath &mgr->lock there so that should be fine to leave be.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Gitlab issue: https://gitlab.freedesktop.org/drm/amd/-/issues/2171
Fixes: 8c20a1ed9b4f ("drm/amd/display: MST DSC compute fair share")
Cc: <stable@vger.kernel.org> # v5.6+
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 5196c9a0e432d..59648f5ffb59d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1148,10 +1148,8 @@ int compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
 			continue;
 
 		mst_mgr = aconnector->port->mgr;
-		mutex_lock(&mst_mgr->lock);
 		ret = compute_mst_dsc_configs_for_link(state, dc_state, stream->link, vars, mst_mgr,
 						       &link_vars_start_index);
-		mutex_unlock(&mst_mgr->lock);
 		if (ret != 0)
 			return ret;
 
@@ -1208,10 +1206,8 @@ static int pre_compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
 			continue;
 
 		mst_mgr = aconnector->port->mgr;
-		mutex_lock(&mst_mgr->lock);
 		ret = compute_mst_dsc_configs_for_link(state, dc_state, stream->link, vars, mst_mgr,
 						       &link_vars_start_index);
-		mutex_unlock(&mst_mgr->lock);
 		if (ret != 0)
 			return ret;
 
-- 
2.37.3

