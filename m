Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC817475DB4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 17:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593ED10E24F;
	Wed, 15 Dec 2021 16:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D2010E247
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 16:42:26 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso18918724wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 08:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NvzzcJBBRe/pXCF+v6jb3YyzpE8towMbOfGTpdBZYQ4=;
 b=Y/he0J6Lou1b7MK8UrLT4EAKChQ6wRnFzIemVHZMZCeMW/WAFa9sWB1PMvV5yKbNLy
 TSGt/WsYV01cW8EELmqGtGPajcsHjRw7qiPH73v5O2s1GHTj89wlriw0XsA7C7eofPmX
 5Gbbn9GRxCxBJ8GsxphD1mzARHA3tTvVDsj7qO6LFzFybTCD0ZftQx87a3BN1eIiW+pm
 b0m+CWGEnjiujkOALyZJD/GMHT1rFs2P9sUb1AN6cvk+4SBbTSIVI0aann4A+xD2rCDw
 QIyB9gDzW2mbRF0RHZHQ15MaIX5ba597mYAQcUo2a6xeR91FOPo+4+wya1/LOtivqiA8
 5ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NvzzcJBBRe/pXCF+v6jb3YyzpE8towMbOfGTpdBZYQ4=;
 b=cBCVJS09icj14laqJ6ynmYCbiJkFpf4c7SkbocFGxrnQTvFHB3nBU46h6xbdGIhqvN
 Flrr7qW6yHO4ezE5q+08+HtABubfrIMho37gzqj5v7OHbkdUgqXc/++HfuTiP3vmfNRq
 CQJx0DoOhkL+pXbMCXV2G4GvfVN4ObA/5QTDhKlP0v7yaAxQGv2SVuHYqCASF7PR7uCO
 NgqW0xDrsk9tnrS/xokepP66dmbD0PaxVTCdxqbsVawLuDTOwUh5JpGjS4WQm77LQd/+
 7j4GMVUomyjtPm8/gh6WTmuXiKi9KjHOA/j5t2WI3bsz4xd2H8BhCD74HUUSbjt+K/I0
 zLIA==
X-Gm-Message-State: AOAM530PvVII/vqJ1uyQ44sUasyAXuVJq1oxHGmIfGIzaSY3vd84Wo9Q
 NI0Cqeh0VSmsfSPeU4qkXRU=
X-Google-Smtp-Source: ABdhPJw4JBTMPtxa5ZwHTVMTxDQkDfoTJZtcvubScnA/WXNuCiBIpsjv1lyrwpTMJDGIIfafuHW4kw==
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr685312wmf.187.1639586544711; 
 Wed, 15 Dec 2021 08:42:24 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id p10sm2670828wrr.24.2021.12.15.08.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:42:24 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Subject: [PATCH] drm/vkms: set plane modifiers
Date: Wed, 15 Dec 2021 17:42:13 +0100
Message-Id: <20211215164213.9760-1-jose.exposito89@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 cphealy@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Where no modifiers are exposed, usually linear modifier is assumed.
However, userspace code is starting to expect IN_FORMATS even when the
only supported modifiers are linear [1].

To avoid possible issues, explicitly set the DRM_FORMAT_MOD_LINEAR
modifier.

[1] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/599/diffs?commit_id=5aea1bc522f0874e6cc07f5120fbcf1736706536

Suggested-by: Chris Healy <cphealy@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 32409e15244b..1666fa59189b 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -20,6 +20,11 @@ static const u32 vkms_plane_formats[] = {
 	DRM_FORMAT_XRGB8888
 };
 
+static const u64 vkms_plane_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
 static struct drm_plane_state *
 vkms_plane_duplicate_state(struct drm_plane *plane)
 {
@@ -189,7 +194,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
 					   &vkms_plane_funcs,
 					   formats, nformats,
-					   NULL, type, NULL);
+					   vkms_plane_modifiers, type, NULL);
 	if (IS_ERR(plane))
 		return plane;
 
-- 
2.25.1

