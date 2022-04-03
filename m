Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1064E4F0A28
	for <lists+dri-devel@lfdr.de>; Sun,  3 Apr 2022 16:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D4010E86B;
	Sun,  3 Apr 2022 14:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AF610E86B
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Apr 2022 14:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648995711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2NzOUXV5geNPV1jFPan7KnjsKEym0Ss9ltF3bQDMSJk=;
 b=fMMgzNyv5qKOgEO0VkDFDzs08/M7KLVFqMih22fKhgF0G68KK8mGnrUgzGMBSE8X7uWKGd
 kqtqrqX3Mjr133qVOQHsxZoWOtxeOdPz43RmJRyPwuhRna1s8KqHOw4PtJTkOE8GkyGZsa
 WYh5MDiG69XiBro37eTcxg07v2s07Jk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-HLp-15DuPKGsT5KeiqWFcg-1; Sun, 03 Apr 2022 10:21:47 -0400
X-MC-Unique: HLp-15DuPKGsT5KeiqWFcg-1
Received: by mail-qk1-f197.google.com with SMTP id
 bj2-20020a05620a190200b005084968bb24so4768582qkb.23
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Apr 2022 07:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2NzOUXV5geNPV1jFPan7KnjsKEym0Ss9ltF3bQDMSJk=;
 b=ZGHpgmWGS+4OVJpHVMIlMsEbm0IbM7+OONJFfrA2jPEEpSA5ime9MiBtnuDyx7U3GL
 UnUJfN1QiiQZbxV50UdrtEjpF8uTm1kzmtu9CnvCJIdquPibjITnIdGhPLCrwAXaJF6V
 Hhq/hZUYj6RLpUGiAqFMW84TzZe+n8k/BOWY6pmzUC1Q/QgaQ/oUoRHKUju78mYZe3Ua
 OkNNd+C3OFE68SsJ68EM6FfQmFIM0KeukdSwzU4coUJyCr38Ez1kSuif0X8IvG7sW4BT
 KfuIZ4XNiRoGb5u9d1tpj0Pq/c7+GE85R82I1Mc+baZXKEA8mnq+g0NaArFl4ob/x1Av
 YKkA==
X-Gm-Message-State: AOAM532cq3KhMr1/ddTa7PLfJ9Zm8e+2s54Vbx6PMWQbOD1y1ghm9h3k
 u47/UPiOw4g/UJuIJZfTYC5VbvRogii0keTQoxpsLxArcl5eUYjqk3nIF6PPpFRx+wwFquqxJJu
 QGBu7FD23dbY2Wfk0Ez8NgSgzWUOk
X-Received: by 2002:a05:6214:da9:b0:441:2d37:1fdf with SMTP id
 h9-20020a0562140da900b004412d371fdfmr14150774qvh.14.1648995707220; 
 Sun, 03 Apr 2022 07:21:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvPjZwizmTlC5AqPbCRYoH/kd4u1WRNzlEq/em0QPB+9sK5Zmh1lXeSdZpIFrdpTz7Zx+Gqg==
X-Received: by 2002:a05:6214:da9:b0:441:2d37:1fdf with SMTP id
 h9-20020a0562140da900b004412d371fdfmr14150757qvh.14.1648995707058; 
 Sun, 03 Apr 2022 07:21:47 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 h6-20020ac85e06000000b002e1e8a98abbsm6194271qtx.41.2022.04.03.07.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 07:21:46 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, wenjing.liu@amd.com, waynelin@amd.com,
 Anson.Jacob@amd.com, Yu-ting.Shen@amd.com, keescook@chromium.org,
 nicholas.kazlauskas@amd.com
Subject: [PATCH] drm/amd/display: cleanup extern usage in function definition
Date: Sun,  3 Apr 2022 10:21:37 -0400
Message-Id: <20220403142137.2234322-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
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

Smatch reports this issue
hdcp1_execution.c:500:29: warning: function
  'mod_hdcp_hdcp1_dp_execution' with external linkage
  has definition

The storage-class-specifier extern is not needed in a
definition, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
index 6ec918af3bff..1ddb4f5eac8e 100644
--- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
+++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
@@ -497,9 +497,9 @@ enum mod_hdcp_status mod_hdcp_hdcp1_execution(struct mod_hdcp *hdcp,
 	return status;
 }
 
-extern enum mod_hdcp_status mod_hdcp_hdcp1_dp_execution(struct mod_hdcp *hdcp,
-		struct mod_hdcp_event_context *event_ctx,
-		struct mod_hdcp_transition_input_hdcp1 *input)
+enum mod_hdcp_status mod_hdcp_hdcp1_dp_execution(struct mod_hdcp *hdcp,
+						 struct mod_hdcp_event_context *event_ctx,
+						 struct mod_hdcp_transition_input_hdcp1 *input)
 {
 	enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
 
-- 
2.27.0

