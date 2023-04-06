Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3816D949E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 13:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52C310E4F6;
	Thu,  6 Apr 2023 11:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF1910EB55
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 11:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680778974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F9cjdA8/GM7kIIzZALenJgnn3cYAeF/whaYu+OzAjvc=;
 b=ezSCrzRd+bN4rSToZnUpIAh5y3oFON5crckoNlEB+x/9d8zridF+SwT9QAJFrUmrqVU2ts
 gawOoOZOSX+Rr/Oe74GOc/vxntfkYDbYuhPrfOjnyCAIgxfQkLWi13TdV1rLd+L91lb4Di
 NWf2Mr10qrrQimjF4UVDN/WpJ3uSuWA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-H6lUEByAPgybHPakBV6Reg-1; Thu, 06 Apr 2023 07:02:53 -0400
X-MC-Unique: H6lUEByAPgybHPakBV6Reg-1
Received: by mail-wm1-f69.google.com with SMTP id
 iv10-20020a05600c548a00b003ee112e6df1so18534218wmb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 04:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680778972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F9cjdA8/GM7kIIzZALenJgnn3cYAeF/whaYu+OzAjvc=;
 b=oeKzSwYVaHGSHedLFAnaXyRWplYTbpJxewgXEp6ncr39h3owHxZ3+TnlMHTo4EUIx3
 c3oOrS+81UXilNrhmMevO4uegxPcPQcNuoEqxYx9kaczvSrhN8nhkRwweU/lrmmmiO2w
 7Ze5mhu5QvJecEBSQ/vk2FUF2gbFehEIWCujGJgwfdekdVq2BLq9eqKFpNPFGrsuIjpw
 Y5pvV4+G15E9DlEo5sk37Wj5Tc90KS0LdKPmLg+PgU30qiWPLMjiPAkL3kmNK+z0FfWM
 m45qmGf0zkzVKX1LN1nFVP2SzvA+XQO9JPiEjDRndvkm6ZQ5vqUfsjfUwxU5XtqUTKNw
 S39w==
X-Gm-Message-State: AAQBX9fFF4nDc70nHAupSOMDhTTSqeQJi704FnR0GCNeLGWhdl2uuucb
 J9Pd2T+rMOOs3xEEWxBkwyDULJY3BP6f208KTbo7aKpSewLt3L92VGNP0W93ZY5V8Qx1AaKMZAA
 LsuhyP4g1CIo+Nu6ZHqQOF4ETp3lf
X-Received: by 2002:adf:f28a:0:b0:2d2:f3e3:115d with SMTP id
 k10-20020adff28a000000b002d2f3e3115dmr6654961wro.59.1680778972337; 
 Thu, 06 Apr 2023 04:02:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZhDfxJ48AEmW3f3aTzEoMHnQcU1JUU1xAt9aEv3bXUTNXx0HNCm06lU7fTSOAH8n5JDmM9ng==
X-Received: by 2002:adf:f28a:0:b0:2d2:f3e3:115d with SMTP id
 k10-20020adff28a000000b002d2f3e3115dmr6654939wro.59.1680778971990; 
 Thu, 06 Apr 2023 04:02:51 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b6-20020a05600010c600b002d8566128e5sm1472401wrx.25.2023.04.06.04.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 04:02:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/vkms: Drop vkms_connector_destroy() wrapper
Date: Thu,  6 Apr 2023 13:02:34 +0200
Message-Id: <20230406110235.3092055-2-javierm@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406110235.3092055-1-javierm@redhat.com>
References: <20230406110235.3092055-1-javierm@redhat.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>, Marius Vlad <marius.vlad@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This helper is just a wrapper that calls drm_connector_cleanup(), there's
no need to have another level of indirection.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/vkms/vkms_output.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 991857125bb4..4de6f8ae38be 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -6,14 +6,9 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
-static void vkms_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-}
-
 static const struct drm_connector_funcs vkms_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = vkms_connector_destroy,
+	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-- 
2.40.0

