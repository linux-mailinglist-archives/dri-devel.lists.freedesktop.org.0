Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4E52A58C9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 22:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73626E901;
	Tue,  3 Nov 2020 21:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818146E900;
 Tue,  3 Nov 2020 21:54:59 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id r7so16807617qkf.3;
 Tue, 03 Nov 2020 13:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FOknlbnKpCVAtGSWxlqPW1DtkJzZpjPZuumMdi6S168=;
 b=oB2hszEdB0Fi8YkuL1JObVz7xviMJZP73w+zBWXll4hEboZ0EIVE67BrJPbRuoV1id
 jrFPOeLZSnrxF+asrEKHjTHkE1JZQKP2PwICUqFZdXd8FVuYKin8kdw1vhgRADxaDr/g
 y5dCc8owptOVpHFa3/o+pK5QJ2KyJofUz6UBjdm0FG6zuJggMpfwcIcrjC4EMvo7uz8S
 vjp5ujH5RSRE+fbPfD3glgdpTvbrrnlGXLjDnEYCMlrhRSDmvi/mATD2FZvQ1uivbpyi
 /P+sBy2PdulTN1vtu3qWPHnMxXkX3EfjjBx38HTL1apn/ALcNDplF8kQwlsrYffqj4ZV
 N9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FOknlbnKpCVAtGSWxlqPW1DtkJzZpjPZuumMdi6S168=;
 b=N5nnRpZTxconGKyGoB4G91O5aLkOK7fJwE9JNo9d45v/w00yw00eSpzQ3nzwSEYXb1
 7Qp+ykDXplOvQ7rgUs3YPM2cQD/hU0j026BeIrPtqmsy5f3GeFwSlGk8NNrMcERBPaQl
 iJBYzXK8IxD/Pss1RcUThUDIDnMgIqU+FvK/gnbx9vmVhYIlIQS9BDRaKSva8VGEeaoQ
 2VsGxrxak2w1gnRH+lxf2qGbVKJ8kDJ6GpkzZve9bzIJ8vSYJC1gQMPz5142yBNhQm1w
 CgbCNFMLG3DbYIP+Bg+/zOYf6gfO24yF3zyT/NdHb+57+8Wt2denkPV5FhY67IH76LLk
 cyHQ==
X-Gm-Message-State: AOAM533ZDLX8vd8B1YvWOK6nOOtFXskTaLM/R4PHIUnGCzFO5kiNqCz8
 UzexQVVi7D87cdqm9oYhkKwDVnHMVio=
X-Google-Smtp-Source: ABdhPJw04lczAquEKXi2vrXX4KWwW/s5tV1D/U3W+IC1TWFRlQXAJWuj44hOue/IvuOrUXhik9Ga6w==
X-Received: by 2002:a37:9bc6:: with SMTP id
 d189mr11472504qke.117.1604440498534; 
 Tue, 03 Nov 2020 13:54:58 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id x22sm48890qki.104.2020.11.03.13.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 13:54:57 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/virt: fix handling of the atomic flag
Date: Tue,  3 Nov 2020 16:54:50 -0500
Message-Id: <20201103215450.815572-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
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
Cc: Alex Deucher <alexander.deucher@amd.com>, daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the per device drm driver feature flags rather than the
global one.  This way we can make the drm driver struct const.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index d0aea5e39531..8aff6ef50f91 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -47,11 +47,13 @@ bool amdgpu_virt_mmio_blocked(struct amdgpu_device *adev)
 
 void amdgpu_virt_init_setting(struct amdgpu_device *adev)
 {
+	struct drm_device *ddev = adev_to_drm(adev);
+
 	/* enable virtual display */
 	if (adev->mode_info.num_crtc == 0)
 		adev->mode_info.num_crtc = 1;
 	adev->enable_virtual_display = true;
-	adev_to_drm(adev)->driver->driver_features &= ~DRIVER_ATOMIC;
+	ddev->driver_features &= ~DRIVER_ATOMIC;
 	adev->cg_flags = 0;
 	adev->pg_flags = 0;
 }
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
