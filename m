Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25C34C4F9C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 21:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E9C10E7D4;
	Fri, 25 Feb 2022 20:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D786210E7D4;
 Fri, 25 Feb 2022 20:25:39 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id q11so5719456pln.11;
 Fri, 25 Feb 2022 12:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BvDoeq2u/2/duKShEemTMjq5MiVNSY0a+G2ydC7I2To=;
 b=o1OzQU49xzdYXAIsISiigma1Fn1Py86Q0QNyrGPPa0fv+WsPYfNfXr1B1+bxBehh14
 s0qbzbLhDuZvMkoj6/IVcPxbkTVZDTOdaxhMm6kyhQJwTjhMffNp20HpAf9iKwWiNdXv
 /2N0LtfkO1twBvlK3a7WAavAY5YFq3yfwdmhw246OSen3fLSUyyh9xbIEmV/u9SMJKIx
 DkQ5dQfIvMX040iewmWXjUyH34DDlYnG2NKoA2ySHhLZhARVAo+0XxXXWm1K7W03u4nn
 t0eUtmYJEgm9lOgtb0AZ8HJX60KtMwgTEmBK78I7a0kfIu+IsRV9N051e62+xc+9SzG1
 hmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BvDoeq2u/2/duKShEemTMjq5MiVNSY0a+G2ydC7I2To=;
 b=oStrWChSATAXVvGk5hXPT5LKOniu7lpX3S5EILG5ztf5lVcf8GzZxw//qFvhwWYI9Y
 lS8dcrq2hHWRd+7iZJnlsCb/+S/OKg2c9GmnoQ3ppD8k3xWo9b+4HmuMhZRtWXvsfq9Q
 c0NKp3bdls1HWgW1fd21q0bdCnLgbm1zqocysV/bREJyyWpRSSgnbMPq6iwoiOcDV8la
 vz8yWY+RBFgia6WZnqVvbMcNrEx/ZcskU5FPLqHQ9ByCYEmIZ8JbjOgQbR4Q2m6ccEJV
 0gX/hGdkLZXVVX5HHBQcC81p1YGhBhOX0g+iiPiBEHzJTTzz/qSIuKw6yBRNdt+qgk3O
 pj0g==
X-Gm-Message-State: AOAM532tugszaDZGQyLkbNIGqlxg5hZvRFti8OJZlqaclb9PDqsACjbY
 DrVeJxnc1fUNkEASDZuIHPRcOritQVE=
X-Google-Smtp-Source: ABdhPJx1OEwFFgxKLCQGCjpGEvJKL0DuprEa4VCYsCHFLhVId9kxLr0Y7/KAYE9GBz6ewotnoJPTCg==
X-Received: by 2002:a17:90a:c6:b0:1bc:c0be:4696 with SMTP id
 v6-20020a17090a00c600b001bcc0be4696mr4856224pjd.7.1645820738785; 
 Fri, 25 Feb 2022 12:25:38 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a634303000000b00374da8cb24fsm3319914pga.50.2022.02.25.12.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 12:25:37 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm: Extend DEFINE_DRM_GEM_FOPS() for optional fops
Date: Fri, 25 Feb 2022 12:26:12 -0800
Message-Id: <20220225202614.225197-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Extend the helper macro so we don't have to throw it away if driver adds
support for optional fops, like show_fdinfo().

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 include/drm/drm_gem.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 35e7f44c2a75..987e78b18244 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -327,7 +327,7 @@ struct drm_gem_object {
  * non-static version of this you're probably doing it wrong and will break the
  * THIS_MODULE reference by accident.
  */
-#define DEFINE_DRM_GEM_FOPS(name) \
+#define DEFINE_DRM_GEM_FOPS(name, ...) \
 	static const struct file_operations name = {\
 		.owner		= THIS_MODULE,\
 		.open		= drm_open,\
@@ -338,6 +338,7 @@ struct drm_gem_object {
 		.read		= drm_read,\
 		.llseek		= noop_llseek,\
 		.mmap		= drm_gem_mmap,\
+		##__VA_ARGS__\
 	}
 
 void drm_gem_object_release(struct drm_gem_object *obj);
-- 
2.35.1

