Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6B23FC370
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 09:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFAF89BFD;
	Tue, 31 Aug 2021 07:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7761489BFC;
 Tue, 31 Aug 2021 07:25:37 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 mw10-20020a17090b4d0a00b0017b59213831so1345012pjb.0; 
 Tue, 31 Aug 2021 00:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tHn1bKbgKWkWnpZZfeyzrlp2g8PdlS3oPFK4wibr8zM=;
 b=pMjwOP/19qT52lkjXq8sDWHfx7YGZ8eUQGoIKFiBmpYZXRbATElia9k4erKkY4o+gx
 bPv9Q+ALqfj6l0g/7NXoYBsBaUHHT+6gpUJC0TZZA35oV6yJRINlv14SbH4wmA+hWnld
 A5j6PaQ1FR2HPB1VVcngEVYOmhQ+NpLjrks7l/GQz3GiD/Ij6t9cbltGAt9Ghki/8W2G
 8wonwnJqSZ31sN7su4nbQ9ehq6UPI2UCarkMqTB4TAcyt0O3UBFAOrpejOLa2u2DFQOG
 seyxkNmsGWqWrmFUoPEtoV5VSb1OXPvizXaVppaQ4FJhDNDk0jkvQTAQjwiWAZ/5FHb6
 r8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tHn1bKbgKWkWnpZZfeyzrlp2g8PdlS3oPFK4wibr8zM=;
 b=GRmxi9Bcr6bc0YgZkFk6GcdMwC5hbWmcsYV5N+/KwE7yunDGzrqN1WfcErlk9sMoUf
 f5En0CHg49OqvfCjAbn3z3bArd29JoKts3G8QKeKcDWE7yMXWbP6dSAcW8q04a82gnn5
 xP1zFkH/9N5/W5F5Y3Edaeoqowlo09oe2jE2b1dah+W7Rimrg42YIH+3gBVkKsSHryNs
 ojR4/8bUER0dzvDzcFJ9qCusLY0HAbGDzIcHsS4cozbB0EBlPEW35FtverG41Rpj0FPC
 uB4BuwMU/xGI5xOeXFZrhMMUCjFaBxGZcGaAmoHrMIxet5GMwXalvniZRo/9/QoD6ZrM
 zfjQ==
X-Gm-Message-State: AOAM531d4NyFn9X+CtlLKuej8rSNmksKN2KSPt40iTU0CgLtGqBPkOlr
 MgPZzEmJTsYF2X/qMkc5w84=
X-Google-Smtp-Source: ABdhPJzpV2t1yFkjJNCWkF5oIEd1fc2kRhKJQqIj82vlMWjQvXBEEUimnllxLVlQqW5CEZE3+9QHpA==
X-Received: by 2002:a17:90a:2e88:: with SMTP id
 r8mr3698988pjd.169.1630394737112; 
 Tue, 31 Aug 2021 00:25:37 -0700 (PDT)
Received: from sanitydock.wifi-cloud.jp ([210.160.217.69])
 by smtp.gmail.com with ESMTPSA id m11sm1720724pjn.2.2021.08.31.00.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 00:25:36 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v10 1/4] drm: fix null ptr dereference in drm_master_release
Date: Tue, 31 Aug 2021 15:24:58 +0800
Message-Id: <20210831072501.184211-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831072501.184211-1-desmondcheongzx@gmail.com>
References: <20210831072501.184211-1-desmondcheongzx@gmail.com>
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

Fixes: 7eeaeb90a6a5 ("drm/file: Don't set master on in-kernel clients")
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: stable@vger.kernel.org
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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

