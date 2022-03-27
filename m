Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 641034E85DA
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 07:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E7910EFBA;
	Sun, 27 Mar 2022 05:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A6910EFBA
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 05:09:54 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id b8so11104762pjb.4
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Mar 2022 22:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Z5EKWPKNzm8cvte72SjRtTGquUZgoqCpRIcSt/1/Umc=;
 b=FnYg8OIV24UEG074PlR98g0sAQBcYruqIeBvx2BeyUoc80DP9s3Fh6wm7+IBoxFkrN
 fs5u0bIRN/SKumQOTvt1Pnoo/ijLoT2zs0elPLbCbNZ+Yx9fn+SZBo9JusCnaKCHIL8d
 HfNBXzm2aDM+wvR2hCCqYd5mznYqibR3UAcS+/63FWs5er3Y65rMh9q56sEC7CCx6wPp
 nyak+en+A7F08K3YevlNm11d9Q11D4dE+0uOCM4cVcjdD1Iz2lbJFm66aALvPvBFlljO
 MZ16hBGVD6nY2XPl4JXIC1/KhAljDDi2FgW0rBWPtKxTNKz5aNdz+fkKqiEQt76fblEZ
 UgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Z5EKWPKNzm8cvte72SjRtTGquUZgoqCpRIcSt/1/Umc=;
 b=X+Fo9JOZrZH9dwucZJE1zbr79/TDmXVGhrw3kH/cImGdZhjSgiJHWEBjARoHJTuKwL
 XpvgpZblrqu+YmYzDmf4B+KBBTDt4ZebeKiRoD8ZiTjgp6MhfxvgoydRbTc3T2s6A62A
 u6HRe42rm97wQyL+R5387Uu0bUGsHR0N23v/uoCIdMpPeruFANNMoKt3HbKPZYROMwUZ
 A6XZajTIf2k7RdzuA4A7th/oEgdWhlPXWB77ybyP7YPCzwtfoSKToEUwXs/O1LGwVFW2
 uVjNKf9iSXapRAKb71wGHBgesvrWf4A85YCrik65DhExOLRxbaBqD2AIvq1cs+gyomim
 ClCQ==
X-Gm-Message-State: AOAM5300XLJ4CCl+FWrkGMujkOUjw0gm9208THHC0fzgC6tlgSwclBX1
 NPlYgaEvKGxLy6GHCRxGwD8=
X-Google-Smtp-Source: ABdhPJzZI5uxOvxHFTaIAz9af0GpXXF0sc7MoA1wfxo+9D+L4evJjKE+DpgwZgK80tVBlHrlLpW6Bg==
X-Received: by 2002:a17:90a:a58e:b0:1bd:4752:90cf with SMTP id
 b14-20020a17090aa58e00b001bd475290cfmr22038142pjq.54.1648357794360; 
 Sat, 26 Mar 2022 22:09:54 -0700 (PDT)
Received: from localhost.localdomain ([115.220.243.108])
 by smtp.googlemail.com with ESMTPSA id
 e19-20020a637453000000b003821bdb8103sm9561015pgn.83.2022.03.26.22.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 22:09:53 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: airlied@linux.ie
Subject: [PATCH] virtio-gpu: fix a missing check to avoid NULL dereference
Date: Sun, 27 Mar 2022 13:09:45 +0800
Message-Id: <20220327050945.1614-1-xiam0nd.tong@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gurchetansingh@chromium.org, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 kraxel@redhat.com, airlied@redhat.com,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'cache_ent' could be set NULL inside virtio_gpu_cmd_get_capset()
and it will lead to a NULL dereference by a lately use of it
(i.e., ptr = cache_ent->caps_cache). Fix it with a NULL check.

Fixes: 62fb7a5e10962 ("virtio-gpu: add 3d/virgl support")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index c708bab555c6..b0f1c4d8fd23 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -579,8 +579,10 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
 	spin_unlock(&vgdev->display_info_lock);
 
 	/* not in cache - need to talk to hw */
-	virtio_gpu_cmd_get_capset(vgdev, found_valid, args->cap_set_ver,
+	ret = virtio_gpu_cmd_get_capset(vgdev, found_valid, args->cap_set_ver,
 				  &cache_ent);
+	if (ret)
+		return ret;
 	virtio_gpu_notify(vgdev);
 
 copy_exit:

base-commit: f443e374ae131c168a065ea1748feac6b2e76613
-- 
2.17.1

