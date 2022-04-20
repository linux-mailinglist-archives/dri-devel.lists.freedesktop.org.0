Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7DD508745
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 13:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF24010E2CA;
	Wed, 20 Apr 2022 11:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440C310E2CA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 11:45:35 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e21so1873558wrc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 04:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/QL7YZ3qS3dDL6elW1m3EUQ1/zKIu/qSDBiWvoRLGXc=;
 b=lfqAS9kAemetWxb1ZkjqPeO7rTkHusUYZmrWo08jYNb5avWHChjNLpJbJwsEQIYHlo
 ZrjozpYmWfXVEH6IokgOkIuLRAQMymd0tIW+kP33tcdpc2eVR945IZfOnfg0SLDbTImj
 E56fBCN6/7iYr4IfdtBLwTc7a4cQXMXOY1ZRDr0d75MjHYc115nQfjjMUdqlHsjsz0ao
 I2xTkEpGVcGck9fQXkTtyYoG0Eqa2Qrdi921CXH2SujFEu+p6H4kiNCUNo5i3daajMvk
 bt92WTffZMGxCw2wFxadIyE+XevhKEkVn2nxjSz5zCdAl2XnqGD/ey7PztdQODwbUibs
 lMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/QL7YZ3qS3dDL6elW1m3EUQ1/zKIu/qSDBiWvoRLGXc=;
 b=p/pjHziQiWKda/rcTS+eUR99/h46iZ7J8TgKLcYUPDhq5N1Bt8bP5eCNw4gKYM2Mtz
 uX+4r/DDLaBG82/anMoR1XwSgqBC6f9LTwsPPvoqH30Cp8Tp3/dR1Mfv4cZEs21TLN/u
 FrRPlrft3dZLKmbhWq6T0mEGZhwDuL+xT51tLPGM62xm2L/dRTG1WOyDGLugdOofBK4+
 +URHR76/yb8vgDKGzxuz7vpfq6fM3e7sI3RaPCCVfrX/L0lxujid+zgcvfSlMKeoEWHV
 rMXlSqkJbSG07xKQHrukS6AibzjZpl4m0KEZn17CFG2h+BTd/O/i/eKnSJRJlssps9Yg
 x6fQ==
X-Gm-Message-State: AOAM532s9jl+LFUr/YJjZfqoVzI/gVtQnxJoj4cyps1vEkwnDArR0Nmh
 /BxobV7DQCU7AsVkpTDMZIY=
X-Google-Smtp-Source: ABdhPJyKwKxl4PoPz8cPDlCO04lSXWS3fheRSE5AnvMWzBwX7KwT1r+BfmumjuVz6vzfAEiBuPK6EQ==
X-Received: by 2002:a05:6000:2c5:b0:20a:9675:d26c with SMTP id
 o5-20020a05600002c500b0020a9675d26cmr11024560wry.185.1650455133639; 
 Wed, 20 Apr 2022 04:45:33 -0700 (PDT)
Received: from localhost.localdomain ([94.73.37.128])
 by smtp.gmail.com with ESMTPSA id
 i74-20020adf90d0000000b0020373ba7beesm17798204wri.0.2022.04.20.04.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 04:45:33 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: emma@anholt.net
Subject: [PATCH v3 0/2] drm/vc4: hdmi: Replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
Date: Wed, 20 Apr 2022 13:44:58 +0200
Message-Id: <20220420114500.187664-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

These patches replace the calls to drm_detect_hdmi_monitor() with the
more efficient drm_display_info.is_hdmi in the VC4 driver and, since
this makes the vc4_hdmi_encoder struct redundant, also removes it.

Thanks,
José Expósito

v1: https://lore.kernel.org/dri-devel/20220406165514.6106-1-jose.exposito89@gmail.com/

v2: https://lore.kernel.org/dri-devel/20220415154745.170597-1-jose.exposito89@gmail.com/T/
    Add the ftrace command used in the first patch
    Remove vc4_hdmi_encoder.hdmi_monitor
    (Thanks to Maxime for suggesting these changes)

v3: Squash the patches present in v2
    Remove vc4_hdmi_encoder
    (Thanks to Maxime for suggesting these changes)

José Expósito (2):
  drm/vc4: hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi
  drm/vc4: hdmi: Remove vc4_hdmi_encoder

 drivers/gpu/drm/vc4/vc4_hdmi.c | 41 +++++++++++++++-------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h | 17 ++------------
 2 files changed, 20 insertions(+), 38 deletions(-)

-- 
2.25.1

