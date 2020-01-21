Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F76144D74
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7819E6FAF9;
	Wed, 22 Jan 2020 08:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8FF6ECF3;
 Tue, 21 Jan 2020 13:46:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d16so3228109wre.10;
 Tue, 21 Jan 2020 05:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=wAY0nGub2moizimjMlOKmqPi5sNjGPoo+Z284BPsaCc=;
 b=cuo9yXLBGjziwDj/A6x10/sKWHDeExpaLuKbn3FeIY5k3mb1BtbvglgOkkpJ27c7jz
 0JDueHaFQXwH2bylKo4sH64kO80d4iKVyTd6+LFNX3BhvAIoNUY8SmXfTiUvyidxetPM
 LCh7mlc4tgsY07y1O+HJs009/v2Gffy3q0Zzci8bbmOp5cfY5mB673j6DHsbAgMTRbMv
 LQeY5vrx4vKmg5uYfHEYPHU1b+TjlmjcDiHwZXBPF5Ml5UXcQ+VyGbRkJe4DeRg1qQ73
 simo3o6HgJMPU9iSLG8HtXpvWBwn/va5w5By/Lj2H5S1FQQmBXRIipulGs3uevG1nqYv
 mhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=wAY0nGub2moizimjMlOKmqPi5sNjGPoo+Z284BPsaCc=;
 b=qhOc4JSkE81MYXGcaQwcqKRKiv+BCS27cVy4WswSuLDEgWGsAqAvkGveu+gStaN8yJ
 ghteE+N+M0/IOmswgG5s31RI7llJBjwhGbIvvJZGju+Ema1+2uvqlfv0pANC3v2pGZPk
 dvApItBPdcRZjtZhraJrg3KTLVvJ4UnPy2uIqLPG+yK6WnZ4EO9AVoFnbFWQgHHUqi8x
 PvMZUcYJD5+NquBin4JI9WpELzMQSImGM5Q5KtNpaheUc+KDz+IXZwSYBnXoLoiSO4TN
 pXn5a1wYmOgN2YV1VyJnJ1h3xKe3SHslSHXokE1IGaC1Em6TxMe+6Kxp8Ah/Zj577GXr
 SBMg==
X-Gm-Message-State: APjAAAW6ymHQOZn0BGtl3bkiQyVk5AIb9MTWXjxt2mj8qheKA/XyoNCQ
 wdu/iPLqHpI+mHyCdpMV/sA=
X-Google-Smtp-Source: APXvYqwM+GcOM1c9G2LksV3HvuxQf28J4FTXh6Lj7WmD431sO3LHrradtTe08HLQBb5B96WUcsT2yQ==
X-Received: by 2002:a5d:640d:: with SMTP id z13mr5181359wru.181.1579614369515; 
 Tue, 21 Jan 2020 05:46:09 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id x17sm51590093wrt.74.2020.01.21.05.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 05:46:09 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] drm/i915/atomic: use struct drm_device logging macros
Date: Tue, 21 Jan 2020 16:45:55 +0300
Message-Id: <20200121134559.17355-2-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200121134559.17355-1-wambui.karugax@gmail.com>
References: <20200121134559.17355-1-wambui.karugax@gmail.com>
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert to the new struct drm_based logging macros to replace the printk
based macros in i915/display/intel_atomic_plane.c.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 3e97af682b1b..8cbb29a860a3 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -183,10 +183,11 @@ bool intel_plane_calc_min_cdclk(struct intel_atomic_state *state,
 	 * must be true since we have crtc_state).
 	 */
 	if (crtc_state->min_cdclk[plane->id] > dev_priv->cdclk.logical.cdclk) {
-		DRM_DEBUG_KMS("[PLANE:%d:%s] min_cdclk (%d kHz) > logical cdclk (%d kHz)\n",
-			      plane->base.base.id, plane->base.name,
-			      crtc_state->min_cdclk[plane->id],
-			      dev_priv->cdclk.logical.cdclk);
+		drm_dbg_kms(&dev_priv->drm,
+			    "[PLANE:%d:%s] min_cdclk (%d kHz) > logical cdclk (%d kHz)\n",
+			    plane->base.base.id, plane->base.name,
+			    crtc_state->min_cdclk[plane->id],
+			    dev_priv->cdclk.logical.cdclk);
 		return true;
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
