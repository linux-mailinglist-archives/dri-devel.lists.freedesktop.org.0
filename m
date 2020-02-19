Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D51A1649E2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 17:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156CC6EC47;
	Wed, 19 Feb 2020 16:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF33893EA;
 Wed, 19 Feb 2020 13:50:54 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t23so735705wmi.1;
 Wed, 19 Feb 2020 05:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JAxgNVMs+kqprjwWCPzpoZ2SvD2juEYl06fjrgdXxKc=;
 b=m/Me70o0UM66u0UgY/fm83Y0jPS+JX/e7pKtjWhfrZf9ey+LtKiWXW4srkYJNcwg9H
 Qv4IHEvRB3ly/lRHJ8dz86jVbqfRsRoiPvCl3ms33qMKZdHvev2QDtsLF4yOvGV4RF6h
 Gip6ZljzOtlHFhZWvZwriBKvhPR8ankNvtDe/19ClIOM2RU9Nf3VP7doON4T9WTvdAHx
 9H/vXGikxSnQyGp5KxeWNPoanTp97UppC367Vkhp46QXZSsLxCp9Xp5puLBkGVOnfAae
 jysBseirMilMzg6VrfnmWqN+6afFALXzCSERuYbM9J9vwxt+gkO+viEZIstdLdNP1Icd
 IkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JAxgNVMs+kqprjwWCPzpoZ2SvD2juEYl06fjrgdXxKc=;
 b=F0Wfy1CC5H7e0FnoWH4IkAgfumeRvsnitBhTqQXvbKUoCmXMMdFZ8h6ZyKtoWLHSjz
 A7ePaKUG8OituhwXZaXCj6AtOtpJF2VbWRvEio6VZpTp0howYtM/g5ymiNhK38ZPTstO
 fYY8rwMdHt8tZRyOmlP32M5hB4Qf821Eu99azGutZ8/5cWQCFSuudYvtMZfmpzbFyyUi
 rjYa2OaG836qTWYYWTNqBiWpST5VJokM4XuIkZmeymT0ALl0sM/fEIEhBqe9H6Chrrhd
 wST/g3m0fifEBdTjbnl8PebyOvrOnqj0cpOfdp36DHcC02TxOnFB6PnVbELLO5Q16dG8
 2opg==
X-Gm-Message-State: APjAAAULhFL3ZkC3e4GOOveq8I4gGq3fW15C9EIOKWKeX/SoxaO0F8mR
 kytyDvBJ2GExlFI4zmPZ2k1cBhsPxINDAg==
X-Google-Smtp-Source: APXvYqzkBhzxuAntsMEoWQsylI5pZMxyufrOsGJ57gDo5SYSX3dUN82M8BNnI0VHD3pmw+pBvFoLZA==
X-Received: by 2002:a05:600c:248:: with SMTP id 8mr10247517wmj.1.1582120252762; 
 Wed, 19 Feb 2020 05:50:52 -0800 (PST)
Received: from brihaspati.fritz.box (p5DE53754.dip0.t-ipconnect.de.
 [93.229.55.84])
 by smtp.gmail.com with ESMTPSA id y1sm3061881wrq.16.2020.02.19.05.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 05:50:52 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm/bochs: use drm_gem_vram_offset to get bo offset v2
Date: Wed, 19 Feb 2020 14:53:21 +0100
Message-Id: <20200219135322.56463-8-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219135322.56463-1-nirmoy.das@amd.com>
References: <20200219135322.56463-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Feb 2020 16:18:11 +0000
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch over to GEM VRAM's implementation to retrieve bo->offset

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/bochs/bochs_kms.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index 8066d7d370d5..18d2ec34534d 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -29,16 +29,21 @@ static void bochs_plane_update(struct bochs_device *bochs,
 			       struct drm_plane_state *state)
 {
 	struct drm_gem_vram_object *gbo;
+	s64 gpu_addr;

 	if (!state->fb || !bochs->stride)
 		return;

 	gbo = drm_gem_vram_of_gem(state->fb->obj[0]);
+	gpu_addr = drm_gem_vram_offset(gbo);
+	if (WARN_ON_ONCE(gpu_addr < 0))
+		return; /* Bug: we didn't pin the BO to VRAM in prepare_fb. */
+
 	bochs_hw_setbase(bochs,
 			 state->crtc_x,
 			 state->crtc_y,
 			 state->fb->pitches[0],
-			 state->fb->offsets[0] + gbo->bo.offset);
+			 state->fb->offsets[0] + gpu_addr);
 	bochs_hw_setformat(bochs, state->fb->format);
 }

--
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
