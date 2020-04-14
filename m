Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA9C1A8A14
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CABB6E52E;
	Tue, 14 Apr 2020 18:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75466E52D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:48:38 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id l25so14515256qkk.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=6yzQmC4w0ygPYVxz9suanugjLM83UH8h3lByA0VCiMA=;
 b=cAEi95OSVoYMxPUPRRQ8P7aBzCq8iAWXDDnkVEIltb6Csmr/PTAqZ8uUgHj9KUrqdV
 QJf2dsphTPAsP6WLs7/Rlxy9qC7eCJ5RPO+/dwa9TTw8JifcBXEZjNy0+J95RAPH5BNM
 2wDMugg/9uMxbui+zrvAKweLF+If5y7NjbwtMOXKMugA8qc9c1RAPh86Taz0u9RvZ4p4
 LavIgMLzqRn7WrqOohi0GNcBWVJYMTjy7CN1qdP05mLO9DK5OI147ZRffqFQ5rJrtoNM
 GOj1s6DlGKmKASYh0om8z0BP/PDGdWF9y6gZYVDCN7KhkNJEvlW7FrdLcUkl5yIVGT9J
 NAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6yzQmC4w0ygPYVxz9suanugjLM83UH8h3lByA0VCiMA=;
 b=JHkoraCVlc31ix5nv0rviFwoXMIEqOZ6Yckhw3hQq5JoGUUt/hJkb/Irl4spQ1m/kU
 Ow3vafY80iT2IF5ftCIt5K/WdvD+Hz9eMiND2AgXu5uKqLcG3pcAtE7GbDtKvXgT7RrK
 UtdSHXg+D9AVQVUYDFa1MRiAp9u5etbD9ipeFIHESQ8lUl3EEoWsGxxbOo+GM7EoOI1T
 4VgkG6iJwtEqtvndPslNTZg5SLtp9L1A1qVvrFbAHEPKVtwKemR1y/0NOpSEXPaWHn0Y
 +3mwtIGj9VnlVBOI7myH6AfnjYY/XfmsACC5BfgfKNFWqi5SyYYtBxVsVNxdKEU2faOv
 ILTw==
X-Gm-Message-State: AGi0PuaIgRjEEALCbV9IYp+anPJH3A7Ni1AQuePmnYGTUMybynWg2fxh
 vpz608h3liLpGa4kbEKdjwvCdBjcJofISw==
X-Google-Smtp-Source: APiQypKMY6bMG74EyHD+GoZ12sBeFRvtchEAfByEmex7yDdu4T+2CkMF22ApyxuG74lJ5sRXGajdyA==
X-Received: by 2002:ae9:ed56:: with SMTP id c83mr18610142qkg.244.1586890117683; 
 Tue, 14 Apr 2020 11:48:37 -0700 (PDT)
Received: from localhost (mobile-166-170-55-13.mycingular.net. [166.170.55.13])
 by smtp.gmail.com with ESMTPSA id f1sm10522199qkl.91.2020.04.14.11.48.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Apr 2020 11:48:36 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	ramalingam.c@intel.com
Subject: [PATCH] drm: Fix HDCP failures when SRM fw is missing
Date: Tue, 14 Apr 2020 14:48:26 -0400
Message-Id: <20200414184835.2878-1-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

The SRM cleanup in 79643fddd6eb2 ("drm/hdcp: optimizing the srm
handling") inadvertently altered the behavior of HDCP auth when
the SRM firmware is missing. Before that patch, missing SRM was
interpreted as the device having no revoked keys. With that patch,
if the SRM fw file is missing we reject _all_ keys.

This patch fixes that regression by returning success if the file
cannot be found.

Fixes: 79643fddd6eb ("drm/hdcp: optimizing the srm handling")
Cc: stable@vger.kernel.org
Cc: Ramalingam C <ramalingam.c@intel.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_hdcp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
index 7f386adcf872..3c36005d367b 100644
--- a/drivers/gpu/drm/drm_hdcp.c
+++ b/drivers/gpu/drm/drm_hdcp.c
@@ -241,8 +241,10 @@ static int drm_hdcp_request_srm(struct drm_device *drm_dev,
 
 	ret = request_firmware_direct(&fw, (const char *)fw_name,
 				      drm_dev->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		ret = 0;
 		goto exit;
+	}
 
 	if (fw->size && fw->data)
 		ret = drm_hdcp_srm_update(fw->data, fw->size, revoked_ksv_list,
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
