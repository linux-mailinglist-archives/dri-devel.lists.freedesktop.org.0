Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4210F3F4F2B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 19:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D1589F77;
	Mon, 23 Aug 2021 17:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB72389F77;
 Mon, 23 Aug 2021 17:15:16 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id e7so17249920pgk.2;
 Mon, 23 Aug 2021 10:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hm7YjUyiFZ/KTSC9DbXmgQsGRHrND7m8Eh1agHCitnc=;
 b=Hu/UENdhdrmnyEohbXjETfe98nCnQf8T8kz+WnnhfYxirR40EcXoYicthiSNlyfrcb
 1lHg9PI3AXl9NLdgjZ4EU8M4i912WQf3ymjcc7aXDI0XLN1xmGz3rA6QVpw9gs5l2OpW
 86Y2Eedl3Q4JoMLcWHVKVgUIqzoizNTypNNak8pnpJrX4u5u/tg8fqh5/44/CYdTkLOA
 XSlamsA1X2jhY7mwMKM3nc21+0+ezmpLz0kILFICQ0ZQDaAXuEVCYgYkKPDlffhPTZWp
 BplkzcNDyd3p2Ln14BcgB/bX9pWtjtvpdL6stk05ncLvT8bR9N+WrzlyFE0GiiqN+DKJ
 zVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hm7YjUyiFZ/KTSC9DbXmgQsGRHrND7m8Eh1agHCitnc=;
 b=iJh+Fp+BW4/CM1beVkteJbkJHjHH+JOl60qWL+qMtMdAb9+oP+HGn1zYElF3mM1knF
 uE+LoAJvtesrGYhFPZ6z3oka92KzR+z5mjtnBmSFlAfZyKB4v3uLyOuX7oXaHoxiR6iX
 2vGq92JihmbgkHIuwGn6tOYbnKyOSACEMVQzdHPkpM7gKK7J4lh0pLyQEWaVXHDjaVQT
 kCl/cZms8aVZPkpuK+209/JEIAIFhLdYmHHNIv/KwDIo/awindMVUm04f/Cm/J1Gy1tZ
 GOcyEiGXrDj98LHeJSruQ+uyVYVJV59TW/7uOBVbw1u01vBNsB1gazyjbv0A06fLvsNk
 EuwA==
X-Gm-Message-State: AOAM53198Np1a+57NWQgnlmExuhW7q75oG75mJXBIOCeHPD1E0BiBZBY
 AUjrdO6RlEEb4vAYJ5gvMvQ=
X-Google-Smtp-Source: ABdhPJxBpFsyIM9dqaqeLqzsQR5HT/rpYYPihnEULHz191fxer+tshG8eCUcMaE58dbnOQ/FiYxw9w==
X-Received: by 2002:a65:5a8e:: with SMTP id c14mr32646227pgt.125.1629738916506; 
 Mon, 23 Aug 2021 10:15:16 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id q4sm14290830pjd.52.2021.08.23.10.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 10:15:16 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v5 1/6] drm: fix null ptr dereference in drm_master_release
Date: Tue, 24 Aug 2021 01:14:32 +0800
Message-Id: <20210823171437.829404-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823171437.829404-1-desmondcheongzx@gmail.com>
References: <20210823171437.829404-1-desmondcheongzx@gmail.com>
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

