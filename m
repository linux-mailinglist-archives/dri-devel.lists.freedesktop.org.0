Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F9E3C8995
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 19:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C966E43A;
	Wed, 14 Jul 2021 17:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7713F6E43A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 17:17:53 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id o201so2648176pfd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 10:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bENsX+LeMytA2zjVecvBK1VL3puGtwAJgEyJncEZ4GQ=;
 b=I2FYLupL1xI0cs2auUwgoUh+J5wb2099XljgutjGzDdgMC2NOVMZ1chfJn4Lxcgyf1
 gZY603cMnrg3wfp1vnXHTZ+0n6CPuKLv/xU4t/WskvzHm7tRGfr+TyFDGZaBbNIOOMsA
 G+nR/GkUT9NOrY2Sxh3428qnfANgBfZoiD8VA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bENsX+LeMytA2zjVecvBK1VL3puGtwAJgEyJncEZ4GQ=;
 b=QhoNzkVCGc25SLPzkmf6gxLGHOMfvCo11PPwzfgfoHn/MOqS9DCcUvoyEk5bBGjcow
 nQXlXtBwkwg9SnuBO2ds5s13c0K0yzpLP0eCbOGwWbjv4FyXMp9u/Nj66+t6+CeiOO1E
 b5aISImOxGM86vkVSXYQQAxGkMa6ls57ha0mgSBs3hmQegXybWGXz/zFDPVE1PENjrku
 7bAxlsvHwI9s2S0qe6H05g1QiBFw06Ufj5ncYvmlY9NOZn4e0M601PpekoS5GF6XLKlL
 1xVEhCdYH4vXnbn08e9Jdf9On0FpV+hnCarcLdhqLaN2ErgwPD6ULxAVzNUsi+MFvfCk
 3HnQ==
X-Gm-Message-State: AOAM533UIerkjzTjDpg7J5ZZzbqD7Mpw5hg6zafhsbjcV3Qz644wC3jQ
 uqHQDStjLA/AcvANk4VMMe/PKFoJLXiI3VCf
X-Google-Smtp-Source: ABdhPJx7n6zTW3KQXf0LlLAL9PN0ojlSxrYavYaK8+VTBLX/hRmUNxtquGxKS1TGfMSy9Px9Y/de8g==
X-Received: by 2002:a62:80c5:0:b029:327:b54f:72f7 with SMTP id
 j188-20020a6280c50000b0290327b54f72f7mr11278437pfd.42.1626283073099; 
 Wed, 14 Jul 2021 10:17:53 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:5a9d:ef42:7eb4:5fea])
 by smtp.gmail.com with ESMTPSA id t2sm6502681pjq.0.2021.07.14.10.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 10:17:52 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rajeev Nandan <rajeevny@codeaurora.org>, Lyude Paul <lyude@redhat.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH] drm/dp: For drm_panel_dp_aux_backlight(),
 init backlight as disabled
Date: Wed, 14 Jul 2021 10:17:46 -0700
Message-Id: <20210714101744.1.Ifc22696b27930749915e383f0108b7bcdc015a6e@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Jingoo Han <jingoohan1@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even after the DP AUX backlight on my board worked OK after applying
the patch ("drm/panel-simple: Power the panel when probing DP AUX
backlight") [1], I still noticed some strange timeouts being reported
by ti_sn_aux_transfer(). Digging, I realized the problem was this:
* Even though `enabled` in `struct dp_aux_backlight` was false, the
  base backlight structure (`base` in that structure) thought that the
  backlight was powered on.
* If userspace wrote to sysfs in this state then we'd try to enable
  the backlight.
* Unfortunatley, enabling the backlight didn't work because the panel
  itself wasn't powered.

We can only use the backlight if the panel is on and the panel is not
officially on when we probe (it's temporarily just on enough for us to
talk to it).

The important thing we want here is to get `BL_CORE_FBBLANK` set since
userspace can't mess with that. This will keep us disabled until
drm_panel enables us, which means that the panel is enabled
first. Ideally we'd just set this in our `props` before calling
devm_backlight_device_register() but the comments in the header file
are pretty explicit that we're not supposed to much with the `state`
ourselves. Because of this, there may be a small window where the
backlight device is registered and someone could try to tweak with the
backlight. This isn't likely to happen and even if it did, I don't
believe this causes any huge problem.

[1] https://lore.kernel.org/lkml/20210714093334.1.Idb41f87e5abae4aee0705db7458b0097fc50e7ab@changeid/

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/drm_dp_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index e8eec20ab364..b5f75ca05774 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -3568,6 +3568,8 @@ int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
 	if (IS_ERR(bl->base))
 		return PTR_ERR(bl->base);
 
+	backlight_disable(bl->base);
+
 	panel->backlight = bl->base;
 
 	return 0;
-- 
2.32.0.93.g670b81a890-goog

