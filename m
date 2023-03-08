Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B096B0A9A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 15:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C98E10E5D9;
	Wed,  8 Mar 2023 14:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0B010E5D9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 14:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678284596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mXndFig5MxMz39oru/IvohSxV+rytJfkgOQsYDdo+fQ=;
 b=ffxHazF8B3m3mSowOSaS9bamaqrIkGp52lqmrwMyptgSdDpQ2t4O+MNI8R1ZV+C3fSx0Aw
 9smbtRqR0OG5Akr6tvQ1HYBuV1dWFOS8YpnJuYlJoW7DDux4q+NjzusWgVZDo+jbMMftle
 LwD3ZXiyklTsBjep5qfD4Kdf6fB3sug=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-hs4CwjZ_NH2AiNxEjMTAuA-1; Wed, 08 Mar 2023 09:09:55 -0500
X-MC-Unique: hs4CwjZ_NH2AiNxEjMTAuA-1
Received: by mail-qv1-f72.google.com with SMTP id
 z3-20020ad44143000000b005771ea56ab6so9345764qvp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 06:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678284593;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mXndFig5MxMz39oru/IvohSxV+rytJfkgOQsYDdo+fQ=;
 b=4Eu4hfHfd+7L3zIC5sUwK8TnZM8QZyXnQ4Du35kU5ZVZZH7U3AQA/KHuB7TAlmdlMC
 ZAS7q4Ql41RcYQwQuTLXp0K6aQeF/bYHMlZ4ZOBwK+etfilgereGj6axfR/BYK5foBak
 AvEWHDu48DTg3ZsPgx1UJxXaAZ/igY17musnj5IKTNR5JOxnY6u+wPRUTP2cqfQHWfQt
 rbV/+Rv3yIMnDDFD5FNHisWzTtMITe4qlHFvIjtXV1Drc1N3W9z7MyKTngkXArtRUs/w
 3/iUfZHA3dfziNMFn2Uj5DBAhZDf7QlnXRVg8EZD58SCQM0zVIE39FRTLR5naHSD1KS0
 sHAQ==
X-Gm-Message-State: AO0yUKU33qBYweD862LVd2h5l51QA5irzPK/clrMQ3zCROqWvzoTk/4T
 kGxLXDmi7zdF3U8wQ7TANYYoC7PO4FvyNB+ER2/v3dnLpfDHfdU8uz9coQWAVd2uJG3JRHb7B/J
 i7dFpFxcdkKyzVn6o+n7ZjefGvNsN
X-Received: by 2002:a05:622a:1443:b0:3bf:d4c3:365d with SMTP id
 v3-20020a05622a144300b003bfd4c3365dmr4212482qtx.14.1678284593682; 
 Wed, 08 Mar 2023 06:09:53 -0800 (PST)
X-Google-Smtp-Source: AK7set/OjUR2DEyaB2HDQqosX6A/GPRFh2BbK8gtM7CV145ROLD4Op15ZKZMuAH5bQJg0F1d3/souw==
X-Received: by 2002:a05:622a:1443:b0:3bf:d4c3:365d with SMTP id
 v3-20020a05622a144300b003bfd4c3365dmr4212441qtx.14.1678284593432; 
 Wed, 08 Mar 2023 06:09:53 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 b1-20020ac812c1000000b003bfa932525dsm11523571qtj.51.2023.03.08.06.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 06:09:53 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, lyude@redhat.com, Wayne.Lin@amd.com,
 hersenxs.wu@amd.com, hamza.mahfooz@amd.com, Jerry.Zuo@amd.com
Subject: [PATCH] drm/amd/display: remove unused variable res_pool
Date: Wed,  8 Mar 2023 09:09:43 -0500
Message-Id: <20230308140943.2009970-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With gcc and W=1, there is this error
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:1214:31:
  error: variable ‘res_pool’ set but not used [-Werror=unused-but-set-variable]
 1214 |         struct resource_pool *res_pool;
      |                               ^~~~~~~~

Since res_pool is unused, remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 2739bef9b90c..4b9b5e4050fc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1211,7 +1211,6 @@ static int pre_compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
 	bool computed_streams[MAX_PIPES];
 	struct amdgpu_dm_connector *aconnector;
 	struct drm_dp_mst_topology_mgr *mst_mgr;
-	struct resource_pool *res_pool;
 	int link_vars_start_index = 0;
 	int ret = 0;
 
@@ -1220,7 +1219,6 @@ static int pre_compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
 
 	for (i = 0; i < dc_state->stream_count; i++) {
 		stream = dc_state->streams[i];
-		res_pool = stream->ctx->dc->res_pool;
 
 		if (stream->signal != SIGNAL_TYPE_DISPLAY_PORT_MST)
 			continue;
-- 
2.27.0

