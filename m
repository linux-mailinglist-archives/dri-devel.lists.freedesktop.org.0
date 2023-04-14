Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DE36E2675
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 17:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D60810E052;
	Fri, 14 Apr 2023 15:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B954710E192
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 15:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681484916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dntWt6MEzqE7MJUvMHAAGJ0dlLTaBYPZeQAgzMBHF18=;
 b=F+M7RY0MxHgqtvAlzXEoqoXq462Gf+ioNYgyeG5Os4eVb9RxZpxYD6R1Oau3T6BODFkhku
 zhr4GXxi8JdALe7Jk6atmguvMKIU00CmvmFeeIAs1Md7yQM3y86TQOPyC3Sv0GRTqAKJUy
 sCCXMprNjfZOfY3LfhMcc93ig1p0co8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-_MF05vS5NZicJwcUa8T3Xg-1; Fri, 14 Apr 2023 11:08:34 -0400
X-MC-Unique: _MF05vS5NZicJwcUa8T3Xg-1
Received: by mail-qt1-f198.google.com with SMTP id
 13-20020ac8570d000000b003e37d3e6de2so13343134qtw.16
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681484914; x=1684076914;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dntWt6MEzqE7MJUvMHAAGJ0dlLTaBYPZeQAgzMBHF18=;
 b=NdN22D+L5bn5Hao/MSarrI6WxA+UwTNsFrhk1qcO7LwBA6eWv/a5THGWQac3NdzNv7
 qzWpb3+yzwI60B5UvhtvAnReWUT+0LeyRL0LnNcH88/VCD6OAbVzCIz8kJN41YeBnTs1
 5Soo/VMcaFx4eBY+knxsiTGy5NbFkP5gFN3D0anSDJLSt5NPN8nqCSVL4BiHqBdB+Z7d
 v8tnnNXepjDeWQV6GDyuCJaQCXxSk6ywLaPd8xHPcvNcoDhbgznQDjZtoMc8UPDuym6z
 jlN+27yduh1hSAa7V5IYTkn5V/HOceSVqul3yjz0DrWnySzBLS/C6Lg/qBmRnGApxLbC
 BpiA==
X-Gm-Message-State: AAQBX9eFce3RSqEy2LvmD21a7i1b+t3KeRuYDP/DqEgVOYRsCwueOJCY
 OynkFWuWMmWbVKdrxX8AYWkfU12yBcYgWfolEM4m/TGlJ6xhEhX0oLLCQK5lTdV0Mq+OwsGM9GY
 KKSwquCJzUCPYFBfippBZgs0jy3/h
X-Received: by 2002:ac8:5ccb:0:b0:3e6:4e79:7401 with SMTP id
 s11-20020ac85ccb000000b003e64e797401mr9604129qta.29.1681484914453; 
 Fri, 14 Apr 2023 08:08:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350YGN/ZPCYxibgTViJjjyz5pv87pPzhZ5EyrP/e3wwVcRZqPGm413XGTEu5OHq/fnESmP3RN0w==
X-Received: by 2002:ac8:5ccb:0:b0:3e6:4e79:7401 with SMTP id
 s11-20020ac85ccb000000b003e64e797401mr9604084qta.29.1681484914150; 
 Fri, 14 Apr 2023 08:08:34 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 eb3-20020a05620a480300b0074b5219b63esm342074qkb.121.2023.04.14.08.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 08:08:33 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, HaoPing.Liu@amd.com, aric.cyr@amd.com,
 qingqing.zhuo@amd.com, hanghong.ma@amd.com, felipe.clark@amd.com,
 Dillon.Varone@amd.com, Mike.Hsieh@amd.com
Subject: [PATCH] drm/amd/display: remove unused variable oldest_index
Date: Fri, 14 Apr 2023 11:08:30 -0400
Message-Id: <20230414150830.3173504-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

cpp_check reports
drivers/gpu/drm/amd/display/modules/freesync/freesync.c:1143:17: style: Variable
  'oldest_index' is assigned a value that is never used. [unreadVariable]
   oldest_index = 0;
                ^

This variable is not used so remove.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/modules/freesync/freesync.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
index 5c41a4751db4..5798c0eafa1f 100644
--- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
+++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
@@ -1137,10 +1137,6 @@ void mod_freesync_handle_preflip(struct mod_freesync *mod_freesync,
 
 	if (in_out_vrr->supported &&
 			in_out_vrr->state == VRR_STATE_ACTIVE_VARIABLE) {
-		unsigned int oldest_index = plane->time.index + 1;
-
-		if (oldest_index >= DC_PLANE_UPDATE_TIMES_MAX)
-			oldest_index = 0;
 
 		last_render_time_in_us = curr_time_stamp_in_us -
 				plane->time.prev_update_time_in_us;
-- 
2.27.0

