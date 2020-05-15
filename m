Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 164EB1D4A09
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9C86EC46;
	Fri, 15 May 2020 09:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109516EC3E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:26 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id n5so1977955wmd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iceSFEjYsMgoMc2AYqn40F50DO/8wmn0G0OUIX+s0uY=;
 b=bMo6nfNpzofIY5dEo8bNRJRm30NG65+hUtAQ332Gk+X0O4JuYbwfgLycwqYWsRKHDH
 /m3TcI+9uE/8VsXp6K3WGH0KGD4Ez61J//xozhuFReZTX2FrEVjFU6RL3zJPd4cWm7lf
 Vc6w9nkXHdGWiiO5r6XKuEoPA03gKFe1Vq7QNnRcW/bATHGwB/gVTyy4HMNo2nvySYBO
 O7kKVuyPfTUqZeh0H0FUFRxx2Nfb50DcDuuEGD94Ev+3J32/rAUNZZnucBbpqWXu2OT+
 +B5pZmoM8bGfswyfHkv4yY5mw2dKHIAyLAotXBIt8toJmG2MVH/FMvTKoRFUmikU9thE
 TlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iceSFEjYsMgoMc2AYqn40F50DO/8wmn0G0OUIX+s0uY=;
 b=fLV9Hu6FJjyBz1EwAnEeDQP/auB/CPfBHmZW54fl/9QRd2mGRWYxHDSnRJ0iwtdpS4
 UzEB8hY5aYLeQ0+/WePxEyw2y7Z1zoXvf2vHnOAXxvor3uBfX2KKf/8hHIDN42AoMKjz
 z7hYbc0ZNW3gZ6GPb1shn+Nnti2F6vP4nd6R4yaOC8e5J+taDhu+TDyUd8KtF69sMf8N
 vYAzJe8ltnSWGpONEIxbuem2vyKEV3JXOJU1t5+vz8/3+RAfaENncKTrL6gBK685z83u
 UzH5vXSZsIGlzFQNsejLBnHBuoLQA8t1HtwSYC96YKns4dU7lxw/R/dbjYf6JtW/JpBd
 yxJA==
X-Gm-Message-State: AOAM531ZCQTIFgrgLtSBOmviteL8tJLgUlx0xTgh6d3OZH/clrSOBPS5
 UgIihEwVI30mxBXEZ7SMYWPEYH0u
X-Google-Smtp-Source: ABdhPJwXEWb0Jm4aH72BhZHvYn1NMiCPKKfowjY46J9RV11L80MDNpC87ZTyZ+f/s3qvHCuCNXOTBw==
X-Received: by 2002:a1c:9e45:: with SMTP id h66mr3161331wme.106.1589536464391; 
 Fri, 15 May 2020 02:54:24 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:23 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 20/38] drm/i915: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:51:00 +0100
Message-Id: <20200515095118.2743122-21-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: emil.l.velikov@gmail.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Spelling out _unlocked for each and every driver is a annoying.
Especially if we consider how many drivers, do not know (or need to)
about the horror stories involving struct_mutex.

Just drop the suffix. It makes the API cleaner.

Done via the following script:

__from=drm_gem_object_put_unlocked
__to=drm_gem_object_put
for __file in $(git grep --name-only $__from); do
  sed -i  "s/$__from/$__to/g" $__file;
done

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 41351cbf31b5..aba7517c2837 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -105,7 +105,7 @@ __attribute__((nonnull))
 static inline void
 i915_gem_object_put(struct drm_i915_gem_object *obj)
 {
-	drm_gem_object_put_unlocked(&obj->base);
+	drm_gem_object_put(&obj->base);
 }
 
 #define assert_object_held(obj) dma_resv_assert_held((obj)->base.resv)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
