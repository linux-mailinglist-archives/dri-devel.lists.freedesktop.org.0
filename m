Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E50EF1CD48A
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 11:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F49189DA9;
	Mon, 11 May 2020 09:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E8189E0C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 09:11:54 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u16so18268017wmc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 02:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kypGotJsMo32YHf8OUx+eQZgE4BXycYY0Yyrzee1xg4=;
 b=BFrWfiefay0G3axbOIvAU7cL37XL0viEFlie/9f9z/E/mFIyz7gZQoFRa+kNZK4LQx
 XBOAAjgo9eXYRtibV6b8JVgQXHu/raQFY9l+V/l90+qLnl7fWQMjeziBAPOHwuPSFxCx
 NRDFbLWUul18dgcd2jgUu1QFdBk9GP0ZhMwg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kypGotJsMo32YHf8OUx+eQZgE4BXycYY0Yyrzee1xg4=;
 b=RcuANXnSMaS0xswtsCe7qHRBSXRsMCpyZ+VAO3amSr95r+l/GMkcqS4pZugvj1FOMJ
 TmqqGqff8qItAXppiCRH/o+wTXBldpn4lsRqkMjc1gDVcihDohCLwxf4MoMAFOzsIxNF
 rWq3PDLmfGGg8561+PIsO+HaDqpFrRHIxmmfehYKtWnQ71uxLApY5j53qZIiZr5Ko9qK
 0Le5qds4xiEmpBg/+emjreBOzvBlw99OVwdWEGyhV6lFLeH/BAD+7qF7jPuoJmhZUQ+5
 1+XDgEosREmiR+w0hbPA/7ovarxfKqT1YqWwRvz9CdNcFqJDah3LMJtscqx1PH6RYD2R
 wUdg==
X-Gm-Message-State: AGi0PubaXfkZuKjfiAtYNEYU56R7oK1V7sn2SgiiO78uWmWQaKfXdloj
 nwT8WUnlKbFzxfSnLcZjlzsI4A==
X-Google-Smtp-Source: APiQypJu6MhVzS21pUOPY5hvSgBf8+CIjEHG8jg44vuH9LazUaM1m9dy/ExDV8ceiF+NtEDozOxG/w==
X-Received: by 2002:a1c:acc8:: with SMTP id
 v191mr24673393wme.128.1589188313116; 
 Mon, 11 May 2020 02:11:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t4sm17506299wri.54.2020.05.11.02.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 02:11:52 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] drm/writeback: don't set fence->ops to default
Date: Mon, 11 May 2020 11:11:40 +0200
Message-Id: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's the default.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_writeback.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 43d9e3bb3a94..dccf4504f1bb 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -108,7 +108,6 @@ static const struct dma_fence_ops drm_writeback_fence_ops = {
 	.get_driver_name = drm_writeback_fence_get_driver_name,
 	.get_timeline_name = drm_writeback_fence_get_timeline_name,
 	.enable_signaling = drm_writeback_fence_enable_signaling,
-	.wait = dma_fence_default_wait,
 };
 
 static int create_writeback_properties(struct drm_device *dev)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
