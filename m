Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E3D3463AA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB566EB9F;
	Tue, 23 Mar 2021 15:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E5A6EB2B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:54:35 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id a7so27918504ejs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4EQdWnddGJ/kQ9X+WOHcXmmOLEE1Ao3uU331cQ38SAg=;
 b=loYgVysE6ORMaaMt+k/B9ApXcwMnpLlrv67LOGmHWZRnexFCFZncKpUuMfgKCQmh+p
 axH8lHObUHObNM04MuUjgUAUnqKLyo8o+1Z3d3M5cZaww0R2IRxS+Q7P6kT+M6/zpZad
 zyMtZdHpUgmVGb3WskwMhhIvaLIssSj3xzotZUU1AEpTQUI4F1uhxAXHgJmVmY7glgVZ
 U2qOcEy1AUIs9Ic5LsZLGEH4le/0grWDlGS9hduRtUikBvMVS9MJBxQwkAtBoHiftdTA
 SQwyY+dILqqDDBKgNoUfbEMoMZw0FRU70e0ENTXtdU0Up8fMxOM5D6vPhJJ5vofY+RH2
 dQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4EQdWnddGJ/kQ9X+WOHcXmmOLEE1Ao3uU331cQ38SAg=;
 b=nNC1+br1srLOF3at9tJVAQCrWPiDZ6SFjhOO1DntHdeKbYtu5Kpbl/liVVQ6lg5K2l
 djtXVg1nMuCJQbToqkJ94BjApu0y5lcljWFmNwO3TMeA03MK0JMDXLNLIEUzdigwGvPT
 g+B7uyF/EehNa680C/AYnfXYncQJofdP+lwmr3AoOCs2hamZenj+kVeA5HbPqnpmPG4o
 Rdc74REkJ48ikX95nHRpdCgfpJqqrfVtYCVJiAV78nBWPWL1L3S/2TEVxu/LoKWIvQ6z
 dSWa62Z9caVlJAWQ4Ca7WVBwf5TyB8U9EYQubP6ITma17WYkHLI8l6jLTx6AAPB6gYXr
 Gz+Q==
X-Gm-Message-State: AOAM532HmayTiOzNaVXo0KQAkjE+/0mOWeou+hfbLTqyd/uCMOpC8mvC
 2tgQKk11FIJ/P3FFVCgE2ME=
X-Google-Smtp-Source: ABdhPJx1K2gXlVJwe1h9YPR2Ax4XDjLRHlSeprdecLslQwhR+AZ6J7RDvfjb1/Z6UkfBvMzUKADe6A==
X-Received: by 2002:a17:906:9386:: with SMTP id
 l6mr5471956ejx.455.1616514874065; 
 Tue, 23 Mar 2021 08:54:34 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id y9sm11295319ejd.110.2021.03.23.08.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:54:33 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 5/9] drm/tegra: fb: Add diagnostics for framebuffer modifiers
Date: Tue, 23 Mar 2021 16:54:33 +0100
Message-Id: <20210323155437.513497-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323155437.513497-1-thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Add a debug message to let the user know when a framebuffer modifier is
not supported.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 01939c57fc74..350f33206076 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -86,6 +86,7 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
 		break;
 
 	default:
+		DRM_DEBUG_KMS("unknown format modifier: %llx\n", modifier);
 		return -EINVAL;
 	}
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
