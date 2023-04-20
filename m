Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A916E9672
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 15:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0367810E2D5;
	Thu, 20 Apr 2023 13:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E29610E0A7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 13:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681999148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m4/JuEsZscBS1QEjsB4TfQCsUwFo0JrhZtOzYqZKIzY=;
 b=J5o9eHlexCND6vN5qOvZO5XlHx2swq6kD1chVNAwKntMU/l8eDVhlEHov59RkR06Q0DN3x
 fuPFrgQ0sAHjmi+3qXRGdEHSqhKOTx0pPfu1/DJ0iOLqn84ly8cSN6Mrjd/TPJSkU0CGZD
 FEy/cpLDWul+rhn/+vkejpmoBcLtkpU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-ZLXppWhLOjqCRJY4cfILSA-1; Thu, 20 Apr 2023 09:59:05 -0400
X-MC-Unique: ZLXppWhLOjqCRJY4cfILSA-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-74e0c32a75eso58131685a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 06:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681999145; x=1684591145;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m4/JuEsZscBS1QEjsB4TfQCsUwFo0JrhZtOzYqZKIzY=;
 b=BvkZQGoueiIcwn3NPjFB05UB34gYsIvCqeYmbzJ3KcvR7gdfOcDFNISqQv7ZlDLkB3
 SF8CMxCEbLm/I7gEU4tsFeZSi9OuZifFY2wt87b+EzsF3wbw8k2iQRrB3VS9mUQ/A6fN
 idAeJ674MSvBtGmpJKAhHMR+f7lU2+M6kutv90lXVHr65QIVxS+YTBRzVIOaHXTaMhUh
 j4VqY+37XW+GR1+uVYw+Il6poP/wPwL/Wi1E14NsDrwtStDmxslauS2QkSivD50kMT1B
 CjMFzZUXCCANDPD1GwYKxYkFKhFvOILkEuMtnCWsWXfEBiiTn6UREuJQ1ilmQ48LyQP5
 I1yQ==
X-Gm-Message-State: AAQBX9eN4Lsu8qkky85RkKxRVShkq7dY47emixNTlwDbP4V5B7fPW/iM
 XJUG9QJoMGFIBcswfe3PJpZKbPWkwyt7DT5mxgEwmxblNKQOjbmikzklJIAc5vQMezUhshZ3hb5
 EOfcqYIYUQC4AIRET1K0gQFVQNRpI
X-Received: by 2002:a05:622a:18a9:b0:3e6:35ec:8a9f with SMTP id
 v41-20020a05622a18a900b003e635ec8a9fmr2276776qtc.59.1681999145137; 
 Thu, 20 Apr 2023 06:59:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZWmwkSKjotOboNJvMVMnZ/90aKxEW+jnR3KliISrG82OxoHSKFPujRz0mheXYNaiH8sWDnrA==
X-Received: by 2002:a05:622a:18a9:b0:3e6:35ec:8a9f with SMTP id
 v41-20020a05622a18a900b003e635ec8a9fmr2276737qtc.59.1681999144890; 
 Thu, 20 Apr 2023 06:59:04 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 z42-20020a05620a262a00b00745f3200f54sm430905qko.112.2023.04.20.06.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 06:59:04 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Alvin.Lee2@amd.com, Jun.Lei@amd.com,
 qingqing.zhuo@amd.com, Max.Tseng@amd.com, Josip.Pavic@amd.com,
 Eric.Yang2@amd.com, aurabindo.pillai@amd.com
Subject: [PATCH] drm/amd/display: return status of dmub_srv_get_fw_boot_status
Date: Thu, 20 Apr 2023 09:59:01 -0400
Message-Id: <20230420135901.3889747-1-trix@redhat.com>
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

gcc with W=1 reports
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:
  In function ‘dc_dmub_srv_optimized_init_done’:
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:184:26:
  error: variable ‘dmub’ set but not used [-Werror=unused-but-set-variable]
  184 |         struct dmub_srv *dmub;
      |                          ^~~~

The return status is never set.
It looks like a call to dmub_srv_get_fw_boot_status is missing.

Fixes: 499e4b1c722e ("drm/amd/display: add mechanism to skip DCN init")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index d15ec32243e2..36d936ab4300 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -182,14 +182,23 @@ bool dc_dmub_srv_cmd_run_list(struct dc_dmub_srv *dc_dmub_srv, unsigned int coun
 bool dc_dmub_srv_optimized_init_done(struct dc_dmub_srv *dc_dmub_srv)
 {
 	struct dmub_srv *dmub;
-	union dmub_fw_boot_status status;
+	struct dc_context *dc_ctx;
+	union dmub_fw_boot_status boot_status;
+	enum dmub_status status;
 
 	if (!dc_dmub_srv || !dc_dmub_srv->dmub)
 		return false;
 
 	dmub = dc_dmub_srv->dmub;
+	dc_ctx = dc_dmub_srv->ctx;
+
+	status = dmub_srv_get_fw_boot_status(dmub, &boot_status);
+	if (status != DMUB_STATUS_OK) {
+		DC_ERROR("Error querying DMUB boot status: error=%d\n", status);
+		return false;
+	}
 
-	return status.bits.optimized_init_done;
+	return boot_status.bits.optimized_init_done;
 }
 
 bool dc_dmub_srv_notify_stream_mask(struct dc_dmub_srv *dc_dmub_srv,
-- 
2.27.0

