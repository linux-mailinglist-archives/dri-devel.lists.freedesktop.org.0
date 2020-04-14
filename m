Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BDD1A8A7F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 21:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE516E563;
	Tue, 14 Apr 2020 19:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90636E55E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 19:03:02 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id g74so14496860qke.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Qx+9uJOtenCeFNWJQn8/GXTaoex2bmlkCDWgniXI+ZU=;
 b=Pym8bfR7Gg2SFIjtkrpH3i99R3yaBV/sVMg+GrDhN+1uEfZbZNShC7p/2YFGKedq7I
 cfVSa9ty6LwtX9FirYHQ1czwqckx5uEa91Il3Oc7kTWnYugekyTfLHuvS1gbShaLTkas
 CGQioOVtDTntWActVDzN9h765S622eX4COcqXqBuiqqTdFMc0oVMX7vAA/E2PV3RufTr
 0ncoaCkRpbRUco+DNRQKzd22xjYxf7up9dRfLSu31wUoHvUj/sORm63+CFoc/IqfGv+F
 i5cwTnK0J0CVePVcnB4prpkUe8knDAhXQ3z62UMCHLxpiYhMFU2BD5fBHq6Iju8PsBlI
 hFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Qx+9uJOtenCeFNWJQn8/GXTaoex2bmlkCDWgniXI+ZU=;
 b=a8haG0uQfcirgX+AE1E7hSS0hXi3Qb4B0LfH02dsTdt+qNaVBvWVB1JtQtkhbG/NKb
 XoWeXrZQ7sSZOa9n6QjFbthN7WRTikGgAIK/cRx2CzX+KdiWdYjhClwyMkyhcZcLN8Yo
 bT9PP9cVxvhYVuoOK4PwHYR+7ykGpX267zVXDxMe3eyHP5vjhh5FlX5plyn9H4fal9il
 Ui0dZCey8e7mN7P+AvZuafsvp91xLwwz0tqWyo/8c8mIP6R+LsiX/amGgMBiSChRsOBY
 LdTRBxyCWR7jN0eGmTJDnAF2z7kQuAblTs/JDTajcYgU8d4VOBO/2XZj++V9ui0Gj6Lv
 BBdw==
X-Gm-Message-State: AGi0PuZANhJts7m6ZOyCubCnLEvEGb8pxmVOThzb3D9rU2x1JzcNk2+x
 PixagQ2a2/Jiv6Q1Y0KGgJ3J2yAgPKT/0w==
X-Google-Smtp-Source: APiQypIo6NVa3ggkrGir9Av9BKxhR8YxgO3E79REfl10Nl4HP+r06ERk/mZOw3BERhNtE8IuJR7XJw==
X-Received: by 2002:a37:9e92:: with SMTP id h140mr22324127qke.24.1586890981611; 
 Tue, 14 Apr 2020 12:03:01 -0700 (PDT)
Received: from localhost (mobile-166-170-55-13.mycingular.net. [166.170.55.13])
 by smtp.gmail.com with ESMTPSA id z18sm12048224qtz.77.2020.04.14.12.03.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Apr 2020 12:03:01 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	ramalingam.c@intel.com
Subject: [PATCH v2] drm: Fix HDCP failures when SRM fw is missing
Date: Tue, 14 Apr 2020 15:02:55 -0400
Message-Id: <20200414190258.38873-1-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200414184835.2878-1-sean@poorly.run>
References: <20200414184835.2878-1-sean@poorly.run>
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
cannot be found. It also checks the return value from request_srm such
that we won't end up trying to parse the ksv list if there is an error
fetching it.

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

Changes in v2:
-Noticed a couple other things to clean up
---

Sorry for the quick rev, noticed a couple other loose ends that should
be cleaned up.

 drivers/gpu/drm/drm_hdcp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
index 7f386adcf872..910108ccaae1 100644
--- a/drivers/gpu/drm/drm_hdcp.c
+++ b/drivers/gpu/drm/drm_hdcp.c
@@ -241,8 +241,12 @@ static int drm_hdcp_request_srm(struct drm_device *drm_dev,
 
 	ret = request_firmware_direct(&fw, (const char *)fw_name,
 				      drm_dev->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		*revoked_ksv_cnt = 0;
+		*revoked_ksv_list = NULL;
+		ret = 0;
 		goto exit;
+	}
 
 	if (fw->size && fw->data)
 		ret = drm_hdcp_srm_update(fw->data, fw->size, revoked_ksv_list,
@@ -287,6 +291,8 @@ int drm_hdcp_check_ksvs_revoked(struct drm_device *drm_dev, u8 *ksvs,
 
 	ret = drm_hdcp_request_srm(drm_dev, &revoked_ksv_list,
 				   &revoked_ksv_cnt);
+	if (ret)
+		return ret;
 
 	/* revoked_ksv_cnt will be zero when above function failed */
 	for (i = 0; i < revoked_ksv_cnt; i++)
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
