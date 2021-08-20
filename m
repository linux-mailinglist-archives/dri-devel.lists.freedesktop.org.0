Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEFA3F29C4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 12:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B5A6EA52;
	Fri, 20 Aug 2021 10:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7266EA50;
 Fri, 20 Aug 2021 10:03:38 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id f3so5695906plg.3;
 Fri, 20 Aug 2021 03:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hm7YjUyiFZ/KTSC9DbXmgQsGRHrND7m8Eh1agHCitnc=;
 b=RRV2JyZgw8WjZHw+NGUYxj0uYQ4too9agb5VqtdVkn47PSkI01SJ8WjRPtsiVTKUtk
 r+OhkYkzHTR+/VNwcA8rc4OexXEeKCDdjdVcU+h/lxslrEmtdQk3ZCa5J9o6SSmLK4c9
 kiVACl2KhEeIgFzOwmHOM7mnMrBt83HsnrSmWTklRanG9qOgXEmAm5/W/VXjwXZzrfr/
 qXHv4Ejm9aMXIcVdfVeRqFxEYWff+6KMRPYaFijWp8tEWHAhzft0TKL2uND6h4sdO7g6
 94dElz0+iAOPKxI9r4gBUAXbBXWY2dxnG8Y0iAjcc5m0kTTI4UvwTztBnktQTI6NbUvJ
 t+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hm7YjUyiFZ/KTSC9DbXmgQsGRHrND7m8Eh1agHCitnc=;
 b=fuG5fjqZrR7GQON/9ex0GLVXZ46Uewe+MLn9FoypMIKVgRbO5JJgkMZWfkpYmUCZrW
 rKvS9oHfGEJdS1MQUHK4Woysbu7TmDmks/AhCcSIftJvVcsK8UTGH5kNBAXfQ2V5gZll
 Zjntr3xdc8PfWwa7/UjKStuwlDJWFAebSKlSh2IJJg+Oz21wQf24tQbRdEdfT1v3jwqf
 vJPlkTDn9YeGQh3w+VpY86OFJnDnGmrxcHMklqX9O0dFdUIYsk/qNig7VG/14fJi22Ph
 U+vKG+Ffo+1YrJFDUM7+lJRn2Bmrzm/Vchb24EVeMGWgbq6Tf/aMnSa16ogu3qd/03yJ
 UqqA==
X-Gm-Message-State: AOAM530iZ29ggdAhJFwXjkVt+yupF8Y8R3UPbQSFATkFugK73D4wvbU3
 yQSffobcJfwCibQFYtqjg+2MGn4pX1CZnJ7nt2A=
X-Google-Smtp-Source: ABdhPJyAeCCNd+ZV72qw0T8ygRx7UffbRCyZoymA+AzlwiE7NY2E4dqxozaw/GJQAV5PfnujFnMZpQ==
X-Received: by 2002:a17:902:a503:b029:12b:2429:385e with SMTP id
 s3-20020a170902a503b029012b2429385emr15898527plq.64.1629453818332; 
 Fri, 20 Aug 2021 03:03:38 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id i8sm6503876pfo.117.2021.08.20.03.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 03:03:37 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v4 1/5] drm: fix null ptr dereference in drm_master_release
Date: Fri, 20 Aug 2021 18:02:47 +0800
Message-Id: <20210820100251.448346-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820100251.448346-1-desmondcheongzx@gmail.com>
References: <20210820100251.448346-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_master_release can be called on a drm_file without a master, which
results in a null ptr dereference of file_priv->master->magic_map. The
three cases are:

1. Error path in drm_open_helper
  drm_open():
    drm_open_helper():
      drm_master_open():
        drm_new_set_master(); <--- returns -ENOMEM,
                                   drm_file.master not set
      drm_file_free():
        drm_master_release(); <--- NULL ptr dereference
                                   (file_priv->master->magic_map)

2. Error path in mock_drm_getfile
  mock_drm_getfile():
    anon_inode_getfile(); <--- returns error, drm_file.master not set
    drm_file_free():
      drm_master_release(); <--- NULL ptr dereference
                                 (file_priv->master->magic_map)

3. In drm_client_close, as drm_client_open doesn't set up a master

drm_file.master is set up in drm_open_helper through the call to
drm_master_open, so we mirror it with a call to drm_master_release in
drm_close_helper, and remove drm_master_release from drm_file_free to
avoid the null ptr dereference.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_file.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ed25168619fc..90b62f360da1 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -282,9 +282,6 @@ void drm_file_free(struct drm_file *file)
 
 	drm_legacy_ctxbitmap_flush(dev, file);
 
-	if (drm_is_primary_client(file))
-		drm_master_release(file);
-
 	if (dev->driver->postclose)
 		dev->driver->postclose(dev, file);
 
@@ -305,6 +302,9 @@ static void drm_close_helper(struct file *filp)
 	list_del(&file_priv->lhead);
 	mutex_unlock(&dev->filelist_mutex);
 
+	if (drm_is_primary_client(file_priv))
+		drm_master_release(file_priv);
+
 	drm_file_free(file_priv);
 }
 
-- 
2.25.1

