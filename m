Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FE14358D9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 05:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9156EA65;
	Thu, 21 Oct 2021 03:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2448E6E3FE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 03:10:35 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id v20so17505660plo.7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 20:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9TThp1HI4kpOvu/0H4PBMLArwdOhxuUAZO1JZOsPPQg=;
 b=jMQX1CMFe17DbcK4X1+9H2+7H9PUAFf267h3c519tPcIGA5xJapzyKFi57EeNVQ3Kz
 tOHu1uW1+yj7SHaBrFW6bjgV22rsExZ+7t2M9llWo92DfIZP0wZnXPll14ktcS08ckf3
 Ui4ihs5JrCeSmS3eH5Nl4tfoRUaJy6XZKAAzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9TThp1HI4kpOvu/0H4PBMLArwdOhxuUAZO1JZOsPPQg=;
 b=3JxaMRzejP4fFi+bFBMB+Q8JYBUBJ74fuuiePoA/XX/6jySYQfqqczi1dYse5vQIgJ
 bm2KKHZBqA6HUWyPWcYAbJjJhih7fj5P29RDaI/JJ/kEgMrL/2mWwEymsWZiQjayIZAM
 nBtI7YMc2S5pamFwqVztsp3GvyvsVR/Oh7oSjYXIuWx/F0C2AgnkxGvE0DDfFtwJdZhd
 9VNLAAtJmr68h6NPMC8425SBe2Lt4d7eGxpKlDI27oQ81tCIrLxkIFFF72nJQCsZ1EfO
 5/ISs9SUpNeMXWh5IxirZJWHIbaZGejC7uQApjZCxvde22Pqe7l8wYtvPTkqX7wfqy0M
 WAOw==
X-Gm-Message-State: AOAM531+GpDgIpFBBwhYFYiCFhg6q929ARV0EoRbPAW8aO8lmLC40JzH
 kYu5DSTAFPh6B+0px1S0JzM6XpC6oHkZgg==
X-Google-Smtp-Source: ABdhPJwjQC+qCihdnzdY1vNpbSK51KgkxFZVSGTlOO3vcnbR+OzHP2rYtlawrDqsb8r7WMaWxTk2PQ==
X-Received: by 2002:a17:902:a613:b0:13d:d95c:c892 with SMTP id
 u19-20020a170902a61300b0013dd95cc892mr2861830plq.35.1634785834417; 
 Wed, 20 Oct 2021 20:10:34 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:21a4:fcf9:f5bb:f740])
 by smtp.gmail.com with ESMTPSA id z1sm4016255pfh.150.2021.10.20.20.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:10:33 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: kaleshsingh@google.com,
	daniel@ffwll.ch,
	rostedt@goodmis.org
Subject: [RFC PATCH 5/8] drm: start using drm_gem_trace_gpu_mem_instance
Date: Wed, 20 Oct 2021 20:10:24 -0700
Message-Id: <20211021031027.537-6-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211021031027.537-1-gurchetansingh@chromium.org>
References: <20211021031027.537-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- drm_gem_handle_create_tail(..) increases the per instance
  memory counter.

- drm_gem_object_release_handle(..) decreases the per instance
  memory counter.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/drm_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 528d7b29dccf..6f70419f2c90 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -298,6 +298,7 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
 {
 	struct drm_file *file_priv = data;
 	struct drm_gem_object *obj = ptr;
+	struct drm_device *dev = file_priv->minor->dev;
 
 	if (obj->funcs->close)
 		obj->funcs->close(obj, file_priv);
@@ -305,6 +306,7 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
 	drm_gem_remove_prime_handles(obj, file_priv);
 	drm_vma_node_revoke(&obj->vma_node, file_priv);
 
+	drm_gem_trace_gpu_mem_instance(dev, file_priv, -obj->size, false);
 	drm_gem_object_handle_put_unlocked(obj);
 
 	return 0;
@@ -447,6 +449,7 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
 			goto err_revoke;
 	}
 
+	drm_gem_trace_gpu_mem_instance(dev, file_priv, obj->size, false);
 	*handlep = handle;
 	return 0;
 
-- 
2.25.1

