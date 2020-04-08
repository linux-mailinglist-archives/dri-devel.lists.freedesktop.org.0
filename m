Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A7F1A1BC6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 08:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F716E94B;
	Wed,  8 Apr 2020 06:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362136E94B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 06:05:45 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id 14so4777172qtp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 23:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BolFWd14WO+07x42q+NvjLF3kPvMgvGMwHbwwQBqjHE=;
 b=ZfHaryGpXDZQY+KbquBedmRyvL1FX0SDiI1n5Fboyy62RTY5z5bPq1Kcy9DTrP4+xW
 cCyt7dMLG7rWy+eMn9uqqa0rY9pYVD1tYUk4pQDAGqz/ZqPZUh/Fb2vcB2rxyn3wJoAq
 mvuebJ3j0iZuayHDvCM+dNxT73S7B+YnU7SrtdInTV5FeUbCY1eEpqx0yYd9bdX+Vz0C
 3tkTJU/j+pE4Kf28+FkCjLuPbzQp/JuTEWi6tu5E+SQEppleQlag33CxSq/kEtM2JGkp
 f+qHJy2oBOfoJZhg3t53DMu7d5s0u/z9+EsE8jcZjT/pyjCL8EckSiOIbcSfVAzQidBO
 xtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BolFWd14WO+07x42q+NvjLF3kPvMgvGMwHbwwQBqjHE=;
 b=k1OZXD3bdSr3QUorinUrWi05HAGvFk8bqAX2tlPSNcTfefZ773e5xWot0eUtUtMZi6
 EmBuIoDk7gjN0iOsP685nVTT4d9Oy58KxSeFXdqFs7+VEeQ3Bu/zRr3F4eF9HFIAt5Ni
 83yDuXpEKh9vMucOiApinGR1/P2WkSJ5A3MJS1r3d93OJNsj3wbxHhqnKqd/wvAWgYUl
 XIpmtTGpYbwOjtOoIIkv+7uuQ4/jo8TfF8m6nRnEsf3z5WH/iet++uuRT130rzz1uibh
 X7/iO4YZH59z488oKdP7y7c357WD+x4Jo7iDyLUYMe/fo2b4zHuA3GkxIRW4SJXFmQpR
 zmqQ==
X-Gm-Message-State: AGi0PuatH2VsGjmRHQifNb7hFPDoxkBKxPMDewuPw/jr3dJi/SQA9Woj
 njvOJ56Y3Aw6gP3Px1PVy2VcjRCD4u7GAA==
X-Google-Smtp-Source: APiQypKYgXWEDmkaBN+PUmKCGzuGHbMIRZlG1RL5mDSc50N9gjyso8CL2uET+7OUsu4VE5U1IqYUog==
X-Received: by 2002:ac8:a09:: with SMTP id b9mr5903801qti.190.1586325944311;
 Tue, 07 Apr 2020 23:05:44 -0700 (PDT)
Received: from arch.localdomain (189-69-221-86.dial-up.telesp.net.br.
 [189.69.221.86])
 by smtp.gmail.com with ESMTPSA id w30sm19664170qtw.21.2020.04.07.23.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 23:05:43 -0700 (PDT)
From: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
To: rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, manasi.d.navare@intel.com
Subject: [PATCH 1/2] drm/vkms: Rework vkms_vblank_simulate
Date: Wed,  8 Apr 2020 03:05:02 -0300
Message-Id: <20200408060503.47709-2-gabrielabittencourt00@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408060503.47709-1-gabrielabittencourt00@gmail.com>
References: <20200408060503.47709-1-gabrielabittencourt00@gmail.com>
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
Cc: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Virtual Vblank on VKMS. Rework part of
'vkms_vblank_simulate' for schedule a compose worker outside.

Signed-off-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index ac85e17428f8..a72769b81efe 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -7,6 +7,12 @@
 
 #include "vkms_drv.h"
 
+static bool vkms_queue_compose_worker(struct vkms_output *output,
+				      struct vkms_crtc_state *state)
+{
+	return queue_work(output->composer_workq, &state->composer_work);
+}
+
 static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 {
 	struct vkms_output *output = container_of(timer, struct vkms_output,
@@ -22,12 +28,12 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 
 	spin_lock(&output->lock);
 	ret = drm_crtc_handle_vblank(crtc);
-	if (!ret)
-		DRM_ERROR("vkms failure on handling vblank");
-
 	state = output->composer_state;
 	spin_unlock(&output->lock);
 
+	if (!ret)
+		DRM_ERROR("vkms failure on handling vblank");
+
 	if (state && output->composer_enabled) {
 		u64 frame = drm_crtc_accurate_vblank_count(crtc);
 
@@ -44,7 +50,7 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 		state->crc_pending = true;
 		spin_unlock(&output->composer_lock);
 
-		ret = queue_work(output->composer_workq, &state->composer_work);
+		ret = vkms_queue_compose_worker(output, state);
 		if (!ret)
 			DRM_DEBUG_DRIVER("Composer worker already queued\n");
 	}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
