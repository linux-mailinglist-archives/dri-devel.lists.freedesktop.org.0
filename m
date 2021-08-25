Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC143F7C1C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 20:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE4E6E3FE;
	Wed, 25 Aug 2021 18:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46F16E3FE
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 18:18:10 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id e16so5204pfc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 11:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JQMLVh8p518b/3f70e1xGp5q4osi5/0uOHOmvHZI8KI=;
 b=j2oVtwZiwap/Lr+6z9XyU/TkHuBLZYiCkk1hps9JeD3LJs6Kn3CV01xA/Og16fRMkn
 5ucJCKoxQVLBF1gOg3LOg8CkH48kwRXQZ1XbuPLoPB0f1Q1X+zeDKVDYoFFDXlLePgkp
 tc10UZcRJW1wtLZczgSTgXw2OwekOrwtPDltw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JQMLVh8p518b/3f70e1xGp5q4osi5/0uOHOmvHZI8KI=;
 b=VR8+YwrFKNJNNeOrKhh/9f5Ia79JPzTLSbe9OYAraiuMa6fnbwRZkcZnt5PrpMKA4v
 H/aDGPAaf3n/Jhyr3K9LviOyD+Ez38P1gkCy0lZNjYMJMdfrFb6EsZp73aPm2LzGvCZu
 Pe8vkcFmIgZF5q+8lHFQRxZNodTW/E4ENjQghEA2jyU3PFE1iRLLiEmKRGi6cwnNIN3S
 rqQS7/4DtdXsUrvADTOyqY2h1dgawV7zgCnF/seGidQSfP0lPDHQAviTopT497y4diE7
 l7fyxWq3n6X0etQ4QJq1IR7mXsz3NvSIhVW0MsWTabZu69/65ku6cH1kQwJrZ3PcY9Jt
 QdtA==
X-Gm-Message-State: AOAM532Hw1hMkXRoVDkoRtNk7tro+zB3S0Ke90E0HTAhel1dWgV2kWeW
 paUeZJqbWTHkZxU6eVrswhUrcQ==
X-Google-Smtp-Source: ABdhPJxNt7HMjDyLOnY9jvCHot7PvGBPflrKq//iRy/hZD970t4n+1tAKbPxCM36phq3GSCpmprvAg==
X-Received: by 2002:aa7:9086:0:b029:39b:6377:17c1 with SMTP id
 i6-20020aa790860000b029039b637717c1mr46146798pfa.11.1629915490418; 
 Wed, 25 Aug 2021 11:18:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l12sm393581pff.182.2021.08.25.11.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 11:18:09 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: Kees Cook <keescook@chromium.org>, Edmund Dea <edmund.j.dea@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH] drm/kmb: Avoid warnings on impossible plane_id
Date: Wed, 25 Aug 2021 11:18:07 -0700
Message-Id: <20210825181807.1138053-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2468; h=from:subject;
 bh=ayGL3nTtXBhmXO1+dOFqn7dP3xjc2moHEVzr5eS5hbQ=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhJoles+iSi8/TcrgLqrEPD56glc8HYMihckLxnx8C
 SpNgn/qJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYSaJXgAKCRCJcvTf3G3AJmhTD/
 4/cuvF+pSPHIc+WlDe0LjwPRoQ4vqJ222edu1HXyrfThq8nwl8bV18+27ltqyvu9rpQVHmWRcyJAJX
 uoKim0qwDeqvk5oz5MNkMBVKKkrOk5M5+3LOrfTsyaGsTVriq5d8AfRpNdlkLN0e8aHn4WwqE5Fe2R
 L615qyAeyupg39I6tLO3QYVc3+EINhOWXmOeoDCoHxY2j66qO2PSEPkqVyaf0EZDl6PBZiFdoR/pNT
 BbBVGYsbO6y9doT9Yls5/mJobgFnhrT3arOx0utGohkwJMmdGVzV4vHrMlu1RcilF/2QnlgzKvV+ic
 jBN2yQHN7CQME0dF2VMRw9fh3qEbzNXyrysHbCa3i4EZm2obqc3tDLwjffgNpwo0r3zYPO0CpmD1Tg
 C8HH/v32xIC1kdzwho9BX6PW/OHD8hQ9y6AEDkhiQDw9Q0+YlupHAHLSVFzicrYOHOfbAIcExDhOe0
 90aqMZz/CT0L89g2IxzbCYWv3bmdKcDNsF0h0B3HsrZCFNp6mIz9oZXGeHP2rOqDP+kBBKAzHJLtRg
 yRBMNNH4ed0CkXo8BDCAsXDi9QNT6lJFQhHOud7BWOZekf5g9hZSQwCA7KdjIKHtVfSuogK+AU5S0y
 iW5tjeTqhto9Km8GPK6DDgtDKRzfSsWa51eL/sPY6Xv7I4eVvBt2UI8nW+QA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

KMB_MAX_PLANES is defined as 1, yet kmb_plane_atomic_disable() had code
for writing beyond 1. It is gated by a WARN_ON() that would skip it,
though, but under some compiler versions, poor Dead Code Elimination
wasn't optimizing away the unused switch cases, leading to array bounds
warnings when building with -Warray-bounds:

drivers/gpu/drm/kmb/kmb_plane.c:135:20: warning: array subscript 3 is above array bounds of 'struct layer_status[1]' [-Warray-bounds]
drivers/gpu/drm/kmb/kmb_plane.c:132:20: warning: array subscript 2 is above array bounds of 'struct layer_status[1]' [-Warray-bounds]
drivers/gpu/drm/kmb/kmb_plane.c:129:20: warning: array subscript 1 is above array bounds of 'struct layer_status[1]' [-Warray-bounds]

Instead, just remove the switch statement entirely and adjust the index
type to match the struct "id" member.

Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: Edmund Dea <edmund.j.dea@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index ecee6782612d..3d46e756f2fe 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -113,7 +113,7 @@ static void kmb_plane_atomic_disable(struct drm_plane *plane,
 				     struct drm_atomic_state *state)
 {
 	struct kmb_plane *kmb_plane = to_kmb_plane(plane);
-	int plane_id = kmb_plane->id;
+	unsigned char plane_id = kmb_plane->id;
 	struct kmb_drm_private *kmb;
 
 	kmb = to_kmb(plane->dev);
@@ -121,21 +121,7 @@ static void kmb_plane_atomic_disable(struct drm_plane *plane,
 	if (WARN_ON(plane_id >= KMB_MAX_PLANES))
 		return;
 
-	switch (plane_id) {
-	case LAYER_0:
-		kmb->plane_status[plane_id].ctrl = LCD_CTRL_VL1_ENABLE;
-		break;
-	case LAYER_1:
-		kmb->plane_status[plane_id].ctrl = LCD_CTRL_VL2_ENABLE;
-		break;
-	case LAYER_2:
-		kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL1_ENABLE;
-		break;
-	case LAYER_3:
-		kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL2_ENABLE;
-		break;
-	}
-
+	kmb->plane_status[plane_id].ctrl = LCD_CTRL_VL1_ENABLE;
 	kmb->plane_status[plane_id].disable = true;
 }
 
-- 
2.30.2

