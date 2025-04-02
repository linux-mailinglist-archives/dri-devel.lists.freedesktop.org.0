Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81004A79435
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F4410E881;
	Wed,  2 Apr 2025 17:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ky9ExsDM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADDC10E8A2;
 Wed,  2 Apr 2025 17:42:47 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-85ea482e3adso35451839f.0; 
 Wed, 02 Apr 2025 10:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615767; x=1744220567; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jfz5L+gbGfT/xExPgo+08GeL0GIfXertlxd83qmdF8E=;
 b=ky9ExsDMElC1aLkkZpo+JTwdF+EzIDTqBd756eC2ga+2djsQexGuQkIxIJnQgJjEci
 apAtvMq/if0tqjpOcYH5mqf6m6pBRMU49cTF0pPlClffnMLMdbtsNWK78nA23Fq10Fc0
 UDxC8t/TLqqwLN9t//8nC8On/ddRgASUViJRTfnQsiJ44N8X+jM1uudKt6Cv6yDAWSKd
 AltdnXG2dj6aXEACNkMEGwW+uCpCJyVOQerZxVrlcAF+fckUhOK2Tonek/sj5cm2D9ba
 aJqJ32wmSifh0F1aQGgniz23e78BDYV9sZit1f6dH8iXoIT2I3DOEMHN6gueiKcWapA0
 uZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615767; x=1744220567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jfz5L+gbGfT/xExPgo+08GeL0GIfXertlxd83qmdF8E=;
 b=UpLX283xOVHsi/90/vBBcR+Mmbc/XhcQZZtEw7UtaO3aHm0AGCVr1bMh6SF+dGMrhy
 hZcnX8cnBTQi3z35TNv8fb7HSrI5ZE6UE9WtRCIWvwaoPK8SgocTOBu8FJa3NOqGx1iZ
 5GuhMXSoOfDyuWDJOcz4AIU0tAW9dAx8ICthejWgJ/en0DVoJ17KW9naSJ20/eSvPEkm
 cGFEO72I3/rO4TZfPbp1O1XclLFY0qiV1SAnZy1XBWaykmCpiyqyltHV8cvnEXmO0oJk
 LYTp0HeSm+J2YGuy8FgVj4lS03OnuwW+DEjDKWisaXl+hUKcIo0lnt2pcAsxuwB4Bn3f
 JjCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeDQv0PSsVpHtKZV/EZNK26yER2A3zuz7arM6nNnBlujXSbxjgoU6uApQtGOvxIl4eoKBEkUah@lists.freedesktop.org,
 AJvYcCX5voiDFGLTu11HiuAiVOCVOuXw/nZDjtoszQt0E+PEi5K1USAtyDjJtAtzDTOfkpneXs1IJGlNQih97UFgUw==@lists.freedesktop.org,
 AJvYcCXROaNYR4KQ0OUfVO7eR3wk4l4gw8V+WUsJHkrAUNmZ+CcobS3jdfH6mtSPz2LifhJItX7oeDSZhgh7@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4KEoXSk0//XIm6ApjEZbU4YnGsF6poDsyP2eLe2yhndNQSjhY
 a6vLC4LRSndawvFBoZidAv5zkfhnA+lun7OiAF+bPiQsFl/YZQ3z
X-Gm-Gg: ASbGncvdmrK+dvDp7M9LLXMZHbWpH6LCoQ+zHZ/WwjL5yKtW1KGeLPB/Y1g7zB2rTcG
 +KpNIztY8obpZLvmFU03krgUlqI5JkXWKNDLU3Cco3TCwqImr7znpYSMN6QOK5szNWZhsR0SWp+
 ceNQqvta2+FdhGSEetI45KuZtol1YtSL7IFWck9zvqSTjDiG9OclP8IpEbSTj6+u9FP+zEQSZoO
 9ilB0ix9a0XUFLlBUQ3Hp0uOvrhrAxvLNrKd+I0FLtxAd2tfzuGBMXaepT/RCpfTmLiKQCCaqBh
 2ExsktS5DQdqLJ+k79Kx+rVjpIp51bCviui7lYktn3xdNiMEF9FImxmSDLt0QEZdDgfZ4XUN8Yk
 Rjw==
X-Google-Smtp-Source: AGHT+IH23Mb806SUSpux0H1ekpyWa2rzurl+V62I0zvWkX0PXGUg8/Ozal3zIS9c5pZxy7jQ85b1yw==
X-Received: by 2002:a05:6e02:240d:b0:3d4:44:958a with SMTP id
 e9e14a558f8ab-3d6dcb5e21cmr6314435ab.3.1743615767041; 
 Wed, 02 Apr 2025 10:42:47 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:46 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 33/54] drm-print: fix config-dependent unused variable
Date: Wed,  2 Apr 2025 11:41:35 -0600
Message-ID: <20250402174156.1246171-34-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

With CONFIG_DRM_USE_DYNAMIC_DEBUG=y, __drm_printfn_dbg() gets an
unused variable warning/error on 'category', even though the usage
follows immediately, in drm_debug_enabled(category).

For static-key optimized dyndbg, the macro doesn't actually check the
category var, since the static-key patches in the proper state.  The
compiler evidently sees this lack of reference and complains.

So this drops the local var and refs the field directly in the
macro-call, which avoids the warning/error.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_print.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 46d53fe30204..41ad11247b48 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -212,9 +212,8 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 {
 	const struct drm_device *drm = p->arg;
 	const struct device *dev = drm ? drm->dev : NULL;
-	enum drm_debug_category category = p->category;
 
-	if (!__drm_debug_enabled(category))
+	if (!__drm_debug_enabled(p->category))
 		return;
 
 	__drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);
-- 
2.49.0

