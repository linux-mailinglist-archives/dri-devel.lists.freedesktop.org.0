Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9800F171807
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187AA6ECAC;
	Thu, 27 Feb 2020 12:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584F56E885
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:02:50 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j7so2944874wrp.13
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FMAbn81YysGaNx3Ax4N9Hbye6l0w3UkvwB+0d6uRaC8=;
 b=kcwliqw0h7kmfEHfB6QGxy7vTmRIohokuOQhZsvpGsRsNyHsLL5b9Piu0IOBLciQcw
 lsm1NB22ZrI9j/RkzHHkVklamX1IsggcqtWnwMFudSDIZowCkyTZ9He1EO5xj1AGtwzr
 EG3bhfx8QuoWa4JJgaH19u/2/hyUsfV2/KdXaWVzbswY4HOjL4tbq2T9jo/MJndsxjGW
 9A0exSGYqbyY/vEl5i3hs/8nM+nJjTd2h0vDplIS+qu6YhJAj87MmHeYvXfklgDCsPRn
 sZW7BfemZtXqCVjmoUB3Ad3t5Aei+CQpPoZl80+uvXBDURc0Q6SvksjPCC97vP+i7SNo
 gqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FMAbn81YysGaNx3Ax4N9Hbye6l0w3UkvwB+0d6uRaC8=;
 b=CLJ6u2uLEU0oESBn5EU2YCrJLBE32QQ4ss+W7Dfw+AgjGIZbqIlqCMy9rzEN+gWFjR
 8CYLPL7nhEgwdK/E/7N+GFiH/I56gQ4vP/vvD901roaXYgNp+CjaFVYVBhKFnj9wyjvN
 CpJ+D3i1mfU0dz0qhZ4e08069LodVht30Nyht/J3c7/YOQYa7OO/gUK1BzqBGw9ZK/+V
 IcU0raCs2/u5+DV/O1Yb6gSrfSJK3hOcK14/52ppnYj70szWrREjyxe+F54x/xkyoFzz
 bVxjlrOtbDXKDi2TuUrmTr4hdskjy8awlo8mDxBa672sgC1YxyNn4VbGs4B5zzPbD2XZ
 N3zA==
X-Gm-Message-State: APjAAAWNit7arKVhnNgeUnOvMMrEm0/5Uf2bSbtzt1YM+TySYMhKy5Ak
 BexGtli4N9FE1Cgdvyr7Lq0=
X-Google-Smtp-Source: APXvYqx7FoldVgWhVom1JC/YSiCcWptuniuidY1zT9ZaeFkvv9JU1Km0AG6pK3zl6XCQGzNQisUoQA==
X-Received: by 2002:adf:db84:: with SMTP id u4mr4589350wri.317.1582804969099; 
 Thu, 27 Feb 2020 04:02:49 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:02:48 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de
Subject: [PATCH 02/21] drm: convert the drm_driver.debugfs_init() hook to
 return void.
Date: Thu, 27 Feb 2020 15:02:13 +0300
Message-Id: <20200227120232.19413-3-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200227120232.19413-1-wambui.karugax@gmail.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 12:59:10 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As a result of commit 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail) and changes to various debugfs
functions in drm/core and across various drivers, there is no need for
the drm_driver.debugfs_init() hook to have a return value. Therefore,
declare it as void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 include/drm/drm_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 97109df5beac..c6ae888c672b 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -323,7 +323,7 @@ struct drm_driver {
 	 *
 	 * Allows drivers to create driver-specific debugfs files.
 	 */
-	int (*debugfs_init)(struct drm_minor *minor);
+	void (*debugfs_init)(struct drm_minor *minor);
 
 	/**
 	 * @gem_free_object: deconstructor for drm_gem_objects
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
