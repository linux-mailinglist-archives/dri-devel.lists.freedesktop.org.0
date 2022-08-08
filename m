Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF7058D09F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 01:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBE612B143;
	Mon,  8 Aug 2022 23:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4410A113F18
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 23:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660002825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dghKN9sgINB8op+a+z7QukDv2xnE+e1D1M1hzE9qLkk=;
 b=cUivvg5jNmyl9qjj2KVWVXF1y/3+9nVYO0Qf7PYvpb4CZYdKGz5S1z26i5hjtqrPVqkJnG
 CoMpQvGVVWH8OnqbQI/vQ6quX7pADctqw2jT6JnvrfQlvCeexKcp3r5hJ4yk5glMEBj57Q
 N5CkWcNrIV/ZNLgNeCIDDeOcuKLgd2w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-wJLvFiSUPSybksW7uvRfog-1; Mon, 08 Aug 2022 19:53:40 -0400
X-MC-Unique: wJLvFiSUPSybksW7uvRfog-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 746348037B5;
 Mon,  8 Aug 2022 23:53:39 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.17.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE38FC15BA1;
 Mon,  8 Aug 2022 23:53:38 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [RFC v2 02/18] drm/amdgpu/dm/mst: Rename get_payload_table()
Date: Mon,  8 Aug 2022 19:51:47 -0400
Message-Id: <20220808235203.123892-3-lyude@redhat.com>
In-Reply-To: <20220808235203.123892-1-lyude@redhat.com>
References: <20220808235203.123892-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: Ian Chen <ian.chen@amd.com>, Colin Ian King <colin.king@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <Roman.Li@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Leo Li <sunpeng.li@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Claudio Suarez <cssk@net-c.es>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function isn't too confusing if you see the comment around the
call-site for it, but if you don't then it's not at all obvious this is
meant to copy DRM's payload table over to DC's internal state structs.
Seeing this function before finding that comment definitely threw me into a
loop a few times.

So, let's rename this to make it's purpose more obvious regardless of where
in the code you are.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 3aa385860eea..77c545e670d5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -153,8 +153,9 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	return result;
 }
 
-static void get_payload_table(struct amdgpu_dm_connector *aconnector,
-			      struct dc_dp_mst_stream_allocation_table *proposed_table)
+static void
+fill_dc_mst_payload_table_from_drm(struct amdgpu_dm_connector *aconnector,
+				   struct dc_dp_mst_stream_allocation_table *proposed_table)
 {
 	int i;
 	struct drm_dp_mst_topology_mgr *mst_mgr =
@@ -252,7 +253,7 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 	 * stream. AMD ASIC stream slot allocation should follow the same
 	 * sequence. copy DRM MST allocation to dc */
 
-	get_payload_table(aconnector, proposed_table);
+	fill_dc_mst_payload_table_from_drm(aconnector, proposed_table);
 
 	return true;
 }
-- 
2.37.1

