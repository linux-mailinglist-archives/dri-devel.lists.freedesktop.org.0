Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C12692F9A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 09:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227D110E0D8;
	Sat, 11 Feb 2023 08:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7228510ECCD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 10:55:47 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id a5so2007910ilk.6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 02:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KlHNZK7Ipphoh6oQQOjJZTI5Uk+UmtoXmM8QD+p6cpA=;
 b=ZQA3F2f/vvilqXVsTDxG6KAd3wzfYF32eO+a/vCK7tgV0s8PJ8Vi1z1v0r9ctIuP7z
 L1PiH7Yv29tObke/KqdQ8+TfAXqaJjvT6whosDawT8A/6AmLzsMO1nwKBfJg2hFL0CKj
 QWQwoiVY7ZZF3dT4+/hDdK1gT3BI0H5MSJMs5P/7OtzlnRVPkN7Wx5tSzBma4n1z46OY
 KQ3EATyxlv+MYcLiM+23y3PIWcNozGb33TZXnNmWcphE33DfeGWQeEjhQ507br76yLib
 aNKOFgd103r6+UxMv+Ike+q/49xKjiAmZLJm9V9Ka9Q571yvPEoiwaEPLyk7YbNoRn9V
 QJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KlHNZK7Ipphoh6oQQOjJZTI5Uk+UmtoXmM8QD+p6cpA=;
 b=A4xCwYaQr+3vapSSxWlvuc3Fdp5YDMscx0GamU4S3x8+uy3ZKRGbmWYy+LTCqMDCDe
 vZH1/aC/Fr3JPR1bZhl8bD73ofiKWcEbVJ1OOKObAyoM0mPEqlE++dXABLv9v32oMG10
 zDjPNq2g8u9x3iONBETyCVK0pv9NHfx5ppb1+5pXeuBTuP1//NYCYei7rcaI7GMB6Plz
 Ai//7NHTJbzfCNMpCgXBpzlqJRGBCD1QLY9BrGvD/hEMlNTcOFglcJ8PUv71ggrcyMS1
 U57rIcWrF44zvuFDkpvr8HOxeUSerhBS3y37MB5xwYGOaA9gMmczLjHonQJzADfiCe+c
 xb6A==
X-Gm-Message-State: AO0yUKVaqmaa9jr3oIGMV+w0GedJaZwkjDa1/ntj5IPTfjYx2XAwk6Gg
 zKBN5313aMqgA8UWWu948GHPIg==
X-Google-Smtp-Source: AK7set9gKfpf0UYsachTDlYwQ6F574rlSgQhr5a2WcPhuB2hW4zjT0pifMBEvWBvC/hsQsBDlgfG3A==
X-Received: by 2002:a92:8e4f:0:b0:30f:5f1f:8927 with SMTP id
 k15-20020a928e4f000000b0030f5f1f8927mr11829892ilh.20.1676026546625; 
 Fri, 10 Feb 2023 02:55:46 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:5982:e253:f3:ec01])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a922908000000b003140001a5e6sm258104ilg.83.2023.02.10.02.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 02:55:46 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 10 Feb 2023 11:55:34 +0100
Subject: [PATCH] drm/meson/meson_venc: Relax the supported mode checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230210-relax_dmt_limits-v1-0-a1474624d530@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: b4 0.10.1
X-Mailman-Approved-At: Sat, 11 Feb 2023 08:53:49 +0000
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
Cc: linux-amlogic@lists.infradead.org, Carlo Caione <ccaione@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Relax a bit the supported modes list by including also 480x1920. This
was actually tested on real hardware and it works correctly.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
drm/meson/meson_venc: Add more supported resolutions.

In particular relax the resolution checks to allow more resolutions like
480x1920.

To: Neil Armstrong <neil.armstrong@linaro.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/meson/meson_venc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 3c55ed003359..5b3621589a9f 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -866,10 +866,10 @@ meson_venc_hdmi_supported_mode(const struct drm_display_mode *mode)
 			    DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC))
 		return MODE_BAD;
 
-	if (mode->hdisplay < 640 || mode->hdisplay > 1920)
+	if (mode->hdisplay < 480 || mode->hdisplay > 1920)
 		return MODE_BAD_HVALUE;
 
-	if (mode->vdisplay < 480 || mode->vdisplay > 1200)
+	if (mode->vdisplay < 480 || mode->vdisplay > 1920)
 		return MODE_BAD_VVALUE;
 
 	return MODE_OK;

---
base-commit: 38c1e0c65865426676123cc9a127526fa02bcac6
change-id: 20230210-relax_dmt_limits-355e2a1c7ccf

Best regards,
-- 
Carlo Caione
