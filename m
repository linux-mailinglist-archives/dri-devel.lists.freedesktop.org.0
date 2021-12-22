Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B07FC47CEC4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 10:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FBC10FE0F;
	Wed, 22 Dec 2021 09:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACDA10FF49;
 Wed, 22 Dec 2021 09:05:59 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id i12so1086918wmq.4;
 Wed, 22 Dec 2021 01:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4JUlyn+OB9q/nAkx157+4tz8tby5UzCmjnk2cgpU7/E=;
 b=bu3nJO8MFxa2c3oQBbJ83GmuDcUoW/SXO45yCpT+W+biCuOoDSCSUHLDaLok8S5hJO
 AGIc638dQmhbYpVFO3fcT9cyc67PGfn2OhQTD/r1mPw1TTpNMQjoh0TYQr+U02yOW+tu
 X442JQhjJcoe+krNyki1Sg1bJOTF9j3gNtXaGIIPkZZp3cmiigPYVLCFUFLhsYanQnie
 TuzmHfDaVWrRYXrnE27kVoBZrfZiA2Sk8z72o7/mpw+6dFQl8nVHTQNcderx02plvF5i
 nSPpg9Ra28b5DwLGb8L/YCKoscQfG/MHB4XsUEBcGl83DyyOnlwlpLq4zhH15So0AFvo
 r8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4JUlyn+OB9q/nAkx157+4tz8tby5UzCmjnk2cgpU7/E=;
 b=AQnsA2dwZZb1ibjhIxcETyVX5OBob6IniM4RtpSX6taadInSQt6PIYpMy+VYmtpkwC
 ebV9CIPo0nspdP4YSQDOe61fZQf7XUxax/Lc6/cMqa12YqEzq0/Is9DWsCntBvc5aOfA
 cB/azTmSFGsSG55hyl/x6yVjb79fx8aijqIJ2Q6Z2Jp11sAez3qDujtlCW+MA0M/dpI2
 lLxjqNWMJBLpvXHbWsO33pVYaxYSz7Pfnx/yj2F5wy9iqZicHfBzRqU+SUbL9fpSRqBA
 sw9aDWl8Y7Y2kDcOw4uEysdqXvKN3SYCQVfmIlsuXsNOKmjd+yuQKEWwzGZDvsBHhlIf
 4bow==
X-Gm-Message-State: AOAM533VDibaxPo4A/jum0vNQb3tqZY9peP857tu1ZTbgbyzPPyLvarU
 hzz/8DLQ5yaiuJNhxET5I0Y=
X-Google-Smtp-Source: ABdhPJytwBVNsRsjyCUwyNbd1c89P3F94MwHR3ncwRrz/bBC3+610uzB064VOeAclTRMoqfrorHsTQ==
X-Received: by 2002:a05:600c:c6:: with SMTP id u6mr219660wmm.8.1640163957972; 
 Wed, 22 Dec 2021 01:05:57 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id a22sm1139775wme.19.2021.12.22.01.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 01:05:57 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Subject: [PATCH v2 1/6] =?UTF-8?q?drm/plane:=20Make=20format=5Fmod=5Fsuppo?=
 =?UTF-8?q?rted=20truly=C2=A0optional?=
Date: Wed, 22 Dec 2021 10:05:47 +0100
Message-Id: <20211222090552.25972-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222090552.25972-1-jose.exposito89@gmail.com>
References: <20211222090552.25972-1-jose.exposito89@gmail.com>
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
Cc: airlied@linux.ie, alexandre.torgue@foss.st.com,
 benjamin.gaignard@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 marex@denx.de, linux-imx@nxp.com, intel-gfx@lists.freedesktop.org,
 tzimmermann@suse.de, s.hauer@pengutronix.de, rodrigo.vivi@intel.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, yannick.fertre@foss.st.com,
 linux-kernel@vger.kernel.org, philippe.cornu@foss.st.com,
 mcoquelin.stm32@gmail.com, dmitry.baryshkov@linaro.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The documentation for "drm_plane_funcs.format_mod_supported" reads:

  This *optional* hook is used for the DRM to determine if the given
  format/modifier combination is valid for the plane. This allows the
  DRM to generate the correct format bitmask (which formats apply to
  which modifier), and to validate modifiers at atomic_check time.

  *If not present*, then any modifier in the plane's modifier
  list is allowed with any of the plane's formats.

However, where the function is not present, an invalid IN_FORMATS blob
property with modifiers but no formats is exposed to user-space.

This breaks the latest Weston [1]. For testing purposes, I extracted the
affected code to a standalone program [2].

Make "create_in_format_blob" behave as documented.

[1] https://gitlab.freedesktop.org/wayland/weston/-/blob/9.0/libweston/backend-drm/kms.c#L431
[2] https://github.com/JoseExposito/drm-sandbox/blob/main/in_formats.c

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/drm_plane.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 82afb854141b..c1186b7215ee 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -202,17 +202,13 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 
 	memcpy(formats_ptr(blob_data), plane->format_types, formats_size);
 
-	/* If we can't determine support, just bail */
-	if (!plane->funcs->format_mod_supported)
-		goto done;
-
 	mod = modifiers_ptr(blob_data);
 	for (i = 0; i < plane->modifier_count; i++) {
 		for (j = 0; j < plane->format_count; j++) {
-			if (plane->funcs->format_mod_supported(plane,
+			if (!plane->funcs->format_mod_supported ||
+			    plane->funcs->format_mod_supported(plane,
 							       plane->format_types[j],
 							       plane->modifiers[i])) {
-
 				mod->formats |= 1ULL << j;
 			}
 		}
-- 
2.25.1

