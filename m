Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9203B8587
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 16:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112236E9F6;
	Wed, 30 Jun 2021 14:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1AD6E9F6;
 Wed, 30 Jun 2021 14:55:52 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 g24-20020a17090ace98b029017225d0c013so3190621pju.1; 
 Wed, 30 Jun 2021 07:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7TptsW5OQ3GR+u/tITdCBbefhDZ5KPjgj9kl0duGn/0=;
 b=jQMcYfmo4WOy762+XlXq7rREStvEn1K/QbSMcETHOaImZDMR6TV8ygdhXa4cDZQhA2
 SFEOD/Ken2OZVNKzwUGscD4H1Wn0L6dYPUVM3B+ON0AfnAhbAEeh8lb4Wu8C36bsnU59
 SA0z3caBP7tlt9vECTP+aPMUnQlX37E5u4gu0vG7NEn7J5zFwhqgVf+biiNr8aCnVBln
 bzCgj9RFB/v0jMtUFdOgjkhanDDI6HmeUoKdFqohEWrZKz8tf01y6CI/yXjVhp6OMaef
 3CwRMFzak934JJTSNqZdrAnmp3iTkOHLfRpmQhpmffIbDOtF8LQgDL8nJdEHtAWdbQAb
 mXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7TptsW5OQ3GR+u/tITdCBbefhDZ5KPjgj9kl0duGn/0=;
 b=bMRqclXmaoEdYr6pqTEmRBg77ntrPGO5Z0Bn5Hfar8v+11i9v+E7aJpHQKtjcsJlvr
 rsjKdfIMYS3r1OwBuoMJTxubGciQb39OLatns9ukEJlIPE0glnBGpDK9vLI0bIzGJxih
 ioO/G8LhZ7z3F+pwQPLxKj17mCKztbFkACQWQs84OB67+muqQyfqJncC0xsvUyW66UKf
 UR2PseYDSjgTTUFwPa1gcqHEl2h7AnyxavxoZijwDU3N7jPf0NWkbCyYCzvZvtdr4ehq
 ewUcdPC58LA/ltGDTszhGFAi2v0z89UeOcXCr/gKv7j0q6K5Axx93Xk/7g+tC65bzjag
 AEBw==
X-Gm-Message-State: AOAM533h64w2ik9EkNFbDxMI6+jFnemO8KeBe66RBiquIEAB82fjgtKi
 /Z9v93yd6j6BSbgCJyuIMbs=
X-Google-Smtp-Source: ABdhPJzlakShd++NdtFkoi8/aMmEkS+Gpz+BqRr8GgeXQvHyNR1eldpRvcZf+RI+EEcYEAP/mljnpw==
X-Received: by 2002:a17:90b:19d4:: with SMTP id
 nm20mr4798973pjb.134.1625064951982; 
 Wed, 30 Jun 2021 07:55:51 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id d13sm7157234pjr.49.2021.06.30.07.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 07:55:51 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v6 2/4] drm: avoid circular locks in __drm_mode_object_find
Date: Wed, 30 Jun 2021 22:54:02 +0800
Message-Id: <20210630145404.5958-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630145404.5958-1-desmondcheongzx@gmail.com>
References: <20210630145404.5958-1-desmondcheongzx@gmail.com>
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 skhan@linuxfoundation.org, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In a future patch, _drm_lease_held will dereference drm_file->master
only after making a call to drm_file_get_master which increments the
reference count of drm_file->master while holding a lock on
drm_device.master_mutex.

In preparation for this, the call to _drm_lease_held should be moved
out from the section locked by &dev->mode_config.idr_mutex. This
avoids inverting the lock hierarchy for
&dev->master_mutex --> &dev->mode_config.idr_mutex

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_mode_object.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index b26588b52795..63d35f1f98dd 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -146,16 +146,18 @@ struct drm_mode_object *__drm_mode_object_find(struct drm_device *dev,
 	if (obj && obj->id != id)
 		obj = NULL;
 
-	if (obj && drm_mode_object_lease_required(obj->type) &&
-	    !_drm_lease_held(file_priv, obj->id))
-		obj = NULL;
-
 	if (obj && obj->free_cb) {
 		if (!kref_get_unless_zero(&obj->refcount))
 			obj = NULL;
 	}
 	mutex_unlock(&dev->mode_config.idr_mutex);
 
+	if (obj && drm_mode_object_lease_required(obj->type) &&
+		!_drm_lease_held(file_priv, obj->id)) {
+		drm_mode_object_put(obj);
+		obj = NULL;
+	}
+
 	return obj;
 }
 
-- 
2.25.1

