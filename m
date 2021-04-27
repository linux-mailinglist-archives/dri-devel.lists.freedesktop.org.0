Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4457E36C1FF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 11:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358466E925;
	Tue, 27 Apr 2021 09:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BB26E90B;
 Tue, 27 Apr 2021 09:44:57 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id g10so1215548edb.0;
 Tue, 27 Apr 2021 02:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n42LGu+VcJUysptGCXvSA/WZLd2LrRzztiVguwQc09Q=;
 b=XnxbtZIP9SkSEsgl/ckHpw1mbDkpCAbaBdzHz3ZSFlbx2gsgLrN1J1ZJTdFntFmCDD
 vFj4ZlVGFz/PLNXQLttws2gflfuvezcSTbVLLwKtoa6pbbEJ36wJza1ZQEugP4o7rrim
 MZ5TGnwldkEUDlkjbENXJ08ZpMRalXbMrm5OFzrPX8ZdV+L40u455YOff/d0OiZPybdZ
 Rg/hfYGJviGADJTzeQH9Pqo83jESrLoesmL3sMWkiOhXaVR7tH6o1Wgs+mgsTblxPa7x
 NAVmSz03XdKwT15NB02n2QBfRxTVhFp4VdhSAYthW375amQtjaaXYLWaD5K1j7eQrNa7
 OzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n42LGu+VcJUysptGCXvSA/WZLd2LrRzztiVguwQc09Q=;
 b=sqAytNGW2NLo+z6ypI0aMJSeR4OsWDoP/JPSlYTQU85elYde81sB10SIeoIiyx9KTI
 siFWAUtFGQ4rA0g3Z0O1axCr+EqP3n00jLx3tA9eo96oBN03nGUZJGA3/vCaZE/eCrXd
 eHg4RF9+VySFEE3qRX2KI/u4fWufy2j5OjE1GNj9eay96zG/j+oVxas5d85IpIkPWchR
 pMONJ5Nx71NBoy55198cKdtDzMwNkoEWdrtNRsgnf4KaMo3HBaoLh+No5cjm5n7k1tus
 UvP7iCEVCOZyRdKvEId1WlHfvep+Erw71xS1pUs3MBX26Jz5YneCw8ab+oQtZ1dt1DEs
 pOkw==
X-Gm-Message-State: AOAM531qRbeHKcNfNNNGAfzD4HtVT9H3K7IYZjF1VY+yzy0orzqG2jP/
 UJqp6B/wIYWAC5GB0dELJe4=
X-Google-Smtp-Source: ABdhPJwDsvVc3VedFDCEoCLMmkddpD77bEIQAmQYJT61GMi3hBoYlkyBR2tvMEkQ0+KlR0/0sYS4uQ==
X-Received: by 2002:a50:eb89:: with SMTP id y9mr3229136edr.172.1619516696345; 
 Tue, 27 Apr 2021 02:44:56 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id mf27sm7602704ejb.63.2021.04.27.02.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:44:55 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 shaoyunl <shaoyun.liu@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4] drm/amd/amdgpu/amdgpu_drv.c: Replace drm_modeset_lock_all
 with drm_modeset_lock
Date: Tue, 27 Apr 2021 11:44:49 +0200
Message-Id: <20210427094449.14730-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_modeset_lock_all() is not needed here, so it is replaced with
drm_modeset_lock(). The crtc list around which we are looping never
changes, therefore the only lock we need is to protect access to
crtc->state.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---

Changes from v3: CC'ed more (previously missing) maintainers.
Changes from v2: Drop file name from the Subject. Cc'ed all maintainers.
Changes from v1: Removed unnecessary braces around single statement
block.

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 80130c1c0c68..39204dbc168b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1595,17 +1595,15 @@ static int amdgpu_pmops_runtime_idle(struct device *dev)
 	if (amdgpu_device_has_dc_support(adev)) {
 		struct drm_crtc *crtc;
 
-		drm_modeset_lock_all(drm_dev);
-
 		drm_for_each_crtc(crtc, drm_dev) {
-			if (crtc->state->active) {
+			drm_modeset_lock(&crtc->mutex, NULL);
+			if (crtc->state->active)
 				ret = -EBUSY;
+			drm_modeset_unlock(&crtc->mutex);
+			if (ret < 0)
 				break;
-			}
 		}
 
-		drm_modeset_unlock_all(drm_dev);
-
 	} else {
 		struct drm_connector *list_connector;
 		struct drm_connector_list_iter iter;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
