Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A953FC275
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 08:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A53589B20;
	Tue, 31 Aug 2021 06:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B57D89B20;
 Tue, 31 Aug 2021 06:14:47 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 z24-20020a17090acb1800b0018e87a24300so1641004pjt.0; 
 Mon, 30 Aug 2021 23:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tHn1bKbgKWkWnpZZfeyzrlp2g8PdlS3oPFK4wibr8zM=;
 b=eXIjFmJAssVk3qum2qiXCLhVDT8BHwEP00acuPJC6D3sWtXepsNRzl7WSa6QoQy99y
 dUAJT/Gv/isjtGOA3E207i4Tsg3jM8j5lwtN9mQ5mIE1L4CtzGYd9e/zLEhVdXiEHfEX
 MK3cuuw+X9WOT70++OXU9foFpZmdwQL8+ub9sVd8DFGdh2I4LBOAdF3P8oABbUdS/Y54
 4Qjd1EndwTYPXWN/mnR2yMNqh9M9wuTMFPtmjSuKYEHNCteFwK4boUyHPOoTuD7my/aS
 UQusq/C0g8X0wUQzNjsJflhtzcsL03ZTs8shCqEgQNJ4GLN+7wm4QawSviE32FE7ZpHH
 +2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tHn1bKbgKWkWnpZZfeyzrlp2g8PdlS3oPFK4wibr8zM=;
 b=fV3z1QUy9qUqUFvfa9JEsnso/apO9+bl+sHTYQwLMdvkxFXyTCO4rY47nzQF1OQj06
 rAMcNQ3VJMwXw8UDZ5wojPtYn/lBfBdEU+NvR8NtSJDN9sUZdfXnj9/27mdFNcr+g2Lr
 H1igRGObaD+ZAAcnU0AZ3Qw+bVc0jlDY/I2J4YxpQYzJ+yGJhCAmOh9nW4/SRcghwuN5
 Q0D1PJuS6BIHRKn46GPgbXBDAAGAhR3RU5sy2M6p8mnJXSIOK60+K59OVSk1IqV4eAjl
 y8A76OFNvPHeoWejhuTLoKCm19+6KYuI/AiXkfWQ3f3BjF6T9CBiFHp0MxbyTKx3yNsS
 8ydw==
X-Gm-Message-State: AOAM530fdoxIgf11Q6hCP0O/4nJQw6js/wGiLrjVA7ubGFrgAQ9PQk/v
 Kl1kRkrLO0GmDUVpk0FbA5o=
X-Google-Smtp-Source: ABdhPJzGmBXOz6okx6of+AFSntvusISTlHPl1xEvUsw8GRcQjM3xZQnn+uaj9N1kZDXhTmMeOXLoJw==
X-Received: by 2002:a17:90b:390d:: with SMTP id
 ob13mr3460845pjb.129.1630390486636; 
 Mon, 30 Aug 2021 23:14:46 -0700 (PDT)
Received: from sanitydock.wifi-cloud.jp ([210.160.217.69])
 by smtp.gmail.com with ESMTPSA id z7sm1405724pjr.42.2021.08.30.23.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 23:14:46 -0700 (PDT)
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
Subject: [PATCH v9 1/4] drm: fix null ptr dereference in drm_master_release
Date: Tue, 31 Aug 2021 14:13:45 +0800
Message-Id: <20210831061348.97696-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831061348.97696-1-desmondcheongzx@gmail.com>
References: <20210831061348.97696-1-desmondcheongzx@gmail.com>
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

