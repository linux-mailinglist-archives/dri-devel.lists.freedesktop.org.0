Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1326C61A630
	for <lists+dri-devel@lfdr.de>; Sat,  5 Nov 2022 00:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9A310E8E0;
	Fri,  4 Nov 2022 23:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB20510E8DC
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 23:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667606382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ffbO6hwMXfi6ia/mJYNAheXY/Bx4C/bAtN/BCx8MV7k=;
 b=iadN6/Tp5XNffoCuo3sB8zaIhiyxRaTha52pRPES2mxW7MCn4MlJ7wVbUSA4N2p9J3/ECr
 3B/e4lDhMEnTyq8ltD4+Jx8FtLnFp3Cxj/Z9kvx7xoDb3RdeLHuN8CAANXKvTdnQNQlTzg
 z8DchZ9aBS++TiKqrvLA0DTxuTjUXoY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-Ef2jqjQmOPuPMfiIymyr5Q-1; Fri, 04 Nov 2022 19:59:37 -0400
X-MC-Unique: Ef2jqjQmOPuPMfiIymyr5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39928833AEC;
 Fri,  4 Nov 2022 23:59:36 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.11.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88C2F112132C;
 Fri,  4 Nov 2022 23:59:35 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/display/dp_mst: Fix
 drm_dp_mst_add_affected_dsc_crtcs() return code
Date: Fri,  4 Nov 2022 19:59:26 -0400
Message-Id: <20221104235926.302883-3-lyude@redhat.com>
In-Reply-To: <20221104235926.302883-1-lyude@redhat.com>
References: <20221104235926.302883-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks like that we're accidentally dropping a pretty important return code
here. For some reason, we just return -EINVAL if we fail to get the MST
topology state. This is wrong: error codes are important and should never
be squashed without being handled, which here seems to have the potential
to cause a deadlock.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 8ec046716ca8 ("drm/dp_mst: Add helper to trigger modeset on affected DSC MST CRTCs")
Cc: <stable@vger.kernel.org> # v5.6+
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index ecd22c038c8c0..51a46689cda70 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5186,7 +5186,7 @@ int drm_dp_mst_add_affected_dsc_crtcs(struct drm_atomic_state *state, struct drm
 	mst_state = drm_atomic_get_mst_topology_state(state, mgr);
 
 	if (IS_ERR(mst_state))
-		return -EINVAL;
+		return PTR_ERR(mst_state);
 
 	list_for_each_entry(pos, &mst_state->payloads, next) {
 
-- 
2.37.3

