Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC1279AC6F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 01:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C35A10E394;
	Mon, 11 Sep 2023 23:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A29910E386;
 Mon, 11 Sep 2023 23:09:08 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-34e202a9cc9so16177695ab.2; 
 Mon, 11 Sep 2023 16:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694473747; x=1695078547; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fcAgeVHnxNNRvfl+2uM1osGvKKovW40vicb6K15Ndz8=;
 b=TBYxvL53lrbTQlbD91jrU7s3DAe/qQQFuCn4qGpSMhj8ybNLmeIB2dnD/3ikrCP3if
 TkjGxtWYi3797cSKdus5LJqiD2Pbac/VtptsoHKmTcRZccYD0NzpnqSEjSyoYVWJcs1v
 7iau6VUwIyTnfpH1vy63nPcQhpsUWe+6bdLQ5QEod3rkG8fYOWEvmT4QSmkm4dCdhT9E
 XXRsw5MjQkVeIbPNBGMfxMyt9v19xkbc1HczXqSykOH1u+yKYVlDqtA/pccxHp3VnWyc
 aKMtT4/FgYpsVEHrRvpN3L/RkFr2KhEb98jYbGWgx2F7MzREoAyHp+3xJIQLu4MW1hGx
 plCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694473747; x=1695078547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fcAgeVHnxNNRvfl+2uM1osGvKKovW40vicb6K15Ndz8=;
 b=We7+ZTVSWT0A3sDREuCIimU+Ixe8JwpdOz2OWI3Utq3fpjRhMdMlhQBKeCshvojWIj
 3rlE5Bo8AGPECjl0yPpbwTpPiF6X5IwKxCKjdjVUPrxwLYrbDDHpymnBxs/1YMYEjf4z
 ZMCK3xpiBwcMEhHCiDx+sQDFl57nDwS7UclfBC9nJsMTTl5sNKmMw7Jt3zb6f5Bb9jSu
 tJU3uPcKbZv6D4NP4Jjy6Bi8KQnzppc4qVWkhpg5ieRUbQNhewuhcN+zZLgwcwNbMLs0
 RGF8FbuHvC9k/oLXcZ3p3dD7OFVI2m7Cs9oZqgjkfILvEDKZCifs7xfN3ZQCawDiQpvF
 sghQ==
X-Gm-Message-State: AOJu0Yw5+J4Db3nQJw6oKHrLWbpgjZXaOmv1shIAibflTtldN87pPjgB
 XjfjDiI71Rhj4aD9NT/2Kgs=
X-Google-Smtp-Source: AGHT+IGm8XJJjgEBdcXS6iFzgL2wU9gzTG524paxkBRkx7pWMbgnsFowJbau/w+sUivI5RVDg02BfA==
X-Received: by 2002:a05:6e02:1a85:b0:34f:49cb:40a9 with SMTP id
 k5-20020a056e021a8500b0034f49cb40a9mr12781961ilv.4.1694473747663; 
 Mon, 11 Sep 2023 16:09:07 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 z4-20020a029f04000000b00423240c7296sm2512607jal.69.2023.09.11.16.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 16:09:07 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, mcgrof@kernel.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH v6 20/22] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Mon, 11 Sep 2023 17:08:36 -0600
Message-ID: <20230911230838.14461-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230911230838.14461-1-jim.cromie@gmail.com>
References: <20230911230838.14461-1-jim.cromie@gmail.com>
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
Cc: linux-doc@vger.kernel.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lots of burn-in testing needed before signing, upstreaming.

NOTE: I set default Y to maximize testing by default.
Is there a better way to do this ?

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index afb3b2f5f425..27bbb03e84dd 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -52,8 +52,7 @@ config DRM_DEBUG_MM
 
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
-	default n
-	depends on BROKEN
+	default y
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.41.0

