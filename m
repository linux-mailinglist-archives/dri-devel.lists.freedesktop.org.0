Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DAD5B91B8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 02:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D641010E1EC;
	Thu, 15 Sep 2022 00:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3012210E1CA
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 00:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663201984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FtNtNsp7OqPqPE1l1U/CkF2qeKiAYQ9N67dyPKGWxE4=;
 b=NFRA1HixXuyiH1k1mEJN1760nRAq1XWrWpwlIsLHBiJGPf+OEyCd8HY8dk+0CQtXdt3FWh
 JXmpI1N8JV+XyXDDu9exEmeog/xIAEVICVW2NILG8m+KgzG6kxQWdSDM+2n4ut2k94MhoD
 CAxVi5XOWFWWUlJl4XLPsRlnbnMy+pQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-448-INoZHRXANmWK0unhB7TI8g-1; Wed, 14 Sep 2022 20:33:03 -0400
X-MC-Unique: INoZHRXANmWK0unhB7TI8g-1
Received: by mail-ed1-f72.google.com with SMTP id
 z13-20020a05640240cd00b0045276a79364so4340723edb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 17:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FtNtNsp7OqPqPE1l1U/CkF2qeKiAYQ9N67dyPKGWxE4=;
 b=oQM4PJINQrGhbELkikmywrfqWZDzEbR3+3F+1JHE3u4VAYookbCgHAqCV8Ad3v756z
 KpvWU6ZC/oyRtsFaHH7hoN3C7Z8SAYcyyb4WBw/8cjkDfKa6aLEfNXrwsa1j/JZYN03Q
 qJ6hVVZ1dETaPrts59xFVFnYeKaa47zWMG+OJZZ+EUiya6DVdhmPTvxmiMlpM7Xukx7s
 BIfMvJDCPY3t9T7y+Tx9P/hua0kTrtCBEaDtc6kb5kEk04iB4jy+kO2MW5pUt6ZjOcQ1
 Lkp67rFAWGWP/Ix3YygiuGZh9rC6+7EoxEwmqjLY4ReuA2hA/S3QAphMO48o2mopkqhx
 LTng==
X-Gm-Message-State: ACgBeo3WyRe76mSkn4XcFAKo2K9Q/hAtGVaLmGv+PmBiP97Eo6MqLHVb
 5bdkRSXOHQf0mvg6A4X3Rp6AwjT9U6ptONKz01MzFZsvyFpPCX7/QI7G/rtUo3Zq2ixyFIE0+xl
 8bzC+nWZkjA344AVSLgmW2pYgIyAx
X-Received: by 2002:a17:907:e9e:b0:77f:9688:2714 with SMTP id
 ho30-20020a1709070e9e00b0077f96882714mr9587300ejc.208.1663201982189; 
 Wed, 14 Sep 2022 17:33:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ZRBZU53BRdNeyOhVVcill9G3iLRkCUJ/jYRhr4Dk+1M2YpVqKN5hH2aUWRV4Wra1YNWfF2A==
X-Received: by 2002:a17:907:e9e:b0:77f:9688:2714 with SMTP id
 ho30-20020a1709070e9e00b0077f96882714mr9587289ejc.208.1663201981992; 
 Wed, 14 Sep 2022 17:33:01 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 kx25-20020a170907775900b0073d70df6e56sm8240280ejc.138.2022.09.14.17.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 17:33:01 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH drm-misc-next 6/8] drm/fsl-dcu: plane: protect device
 resources after removal
Date: Thu, 15 Sep 2022 02:32:29 +0200
Message-Id: <20220915003231.363447-7-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915003231.363447-1-dakr@redhat.com>
References: <20220915003231.363447-1-dakr@redhat.com>
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Hardware) resources which are bound to the driver and device lifecycle
must not be accessed after the device and driver are unbound.

However, the DRM device isn't freed as long as the last user didn't
close it, hence userspace can still call into the driver.

Therefore protect the critical sections which are accessing those
resources with drm_dev_enter() and drm_dev_exit().

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index 23ff285da477..1be3062a95df 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -10,6 +10,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -65,7 +66,10 @@ static void fsl_dcu_drm_plane_atomic_disable(struct drm_plane *plane,
 {
 	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(plane->dev);
 	unsigned int value;
-	int index;
+	int index, idx;
+
+	if (!drm_dev_enter(plane->dev, &idx))
+		return;
 
 	index = fsl_dcu_drm_plane_index(plane);
 	if (index < 0)
@@ -74,6 +78,8 @@ static void fsl_dcu_drm_plane_atomic_disable(struct drm_plane *plane,
 	regmap_read(fsl_dev->regmap, DCU_CTRLDESCLN(index, 4), &value);
 	value &= ~DCU_LAYER_EN;
 	regmap_write(fsl_dev->regmap, DCU_CTRLDESCLN(index, 4), value);
+
+	drm_dev_exit(idx);
 }
 
 static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
@@ -86,7 +92,10 @@ static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
 	struct drm_framebuffer *fb = plane->state->fb;
 	struct drm_gem_dma_object *gem;
 	unsigned int alpha = DCU_LAYER_AB_NONE, bpp;
-	int index;
+	int index, idx;
+
+	if (!drm_dev_enter(plane->dev, &idx))
+		return;
 
 	if (!fb)
 		return;
@@ -162,6 +171,7 @@ static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
 			     DCU_LAYER_PRE_SKIP(0));
 	}
 
+	drm_dev_exit(idx);
 	return;
 }
 
-- 
2.37.3

