Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A392539F2A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BADE1134DB;
	Wed,  1 Jun 2022 08:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A251134DB
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:18:56 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id i1so1096273plg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 01:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xeMLg+35N7hSrKTKnxWGY/ydjeaKMZYeAKhgclNfW00=;
 b=QnX8EAqj1NdSiodi34RQfAUVxRFwDNNVr9xsWDQow2cE5INydMl18CERAzjA7RQN9L
 iyrE/btER8fTucQ5/nH8nOa+GoOQ9wwDukPAOPagcGYHZmiKcSWDkDl3u3+Kw0OY8n8L
 b9x8pOz1UR8mWvMu4W3ha9pWcmlyQb2tDBHP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xeMLg+35N7hSrKTKnxWGY/ydjeaKMZYeAKhgclNfW00=;
 b=L7oYhHNc0Xqs6NJJ/nPikeuwzgpJaqp6/ITaEQkhDsp62egg2BRK3x7T1hPXAGoPy0
 1LjeuAr9UIKnuKRX0D8EihTzlWH4d4I+CvPgC8a7Kp0UfSwjny4jy2+mZ8TW8SSIdg9D
 la3njcnhocQ/6iNYFj7DKEqih1dE7o1sUaUMaTLi2eIc2bSvE761C4WMiXnwcF+vcsN8
 4qA9d4VRrAT9UttWI4EFvWYVsYPrYIxE/+x++o51lNmxJHd8H4Ge/O9MSI9w5HiY0EZv
 vT//sb+ab+2YK02fq4IDP+DZivRbcD1RzJisVaP+TFpsZCAXE92nQUD5W6jpUEaH0POe
 CyQA==
X-Gm-Message-State: AOAM5324eJiEVXDmdmYtjTOF9xX13zG+m+ha0Kb27SEL1HrctKIRRJns
 9J99moCkRrjAuQC22e69Xgtweg==
X-Google-Smtp-Source: ABdhPJzLVGMo42m5euNK4kp07ZocNgWlb4mGFb+T8VtJCH8enEAQQ9fbe9dx6N+5RtJX12cxrzs+SA==
X-Received: by 2002:a17:90b:4ac9:b0:1e3:1dca:d995 with SMTP id
 mh9-20020a17090b4ac900b001e31dcad995mr11560854pjb.111.1654071535681; 
 Wed, 01 Jun 2022 01:18:55 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
 by smtp.gmail.com with ESMTPSA id
 c3-20020aa78803000000b0050dc7628182sm824680pfo.92.2022.06.01.01.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 01:18:55 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 7/8] drm/panel: elida-kd35t133: Implement .get_orientation
 callback
Date: Wed,  1 Jun 2022 16:18:22 +0800
Message-Id: <20220601081823.1038797-8-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601081823.1038797-1-hsinyi@chromium.org>
References: <20220601081823.1038797-1-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To return the orientation property to drm/kms driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index 80227617a4d6..079ed71f660c 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -222,10 +222,18 @@ static int kd35t133_get_modes(struct drm_panel *panel,
 	return 1;
 }
 
+static enum drm_panel_orientation kd35t133_get_orientation(struct drm_panel *panel)
+{
+       struct kd35t133 *ctx = panel_to_kd35t133(panel);
+
+       return ctx->orientation;
+}
+
 static const struct drm_panel_funcs kd35t133_funcs = {
 	.unprepare	= kd35t133_unprepare,
 	.prepare	= kd35t133_prepare,
 	.get_modes	= kd35t133_get_modes,
+	.get_orientation = kd35t133_get_orientation,
 };
 
 static int kd35t133_probe(struct mipi_dsi_device *dsi)
-- 
2.36.1.255.ge46751e96f-goog

