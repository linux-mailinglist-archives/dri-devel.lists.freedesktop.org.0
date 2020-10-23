Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5212E2974FD
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABD46F8E5;
	Fri, 23 Oct 2020 16:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429AE6F8F4;
 Fri, 23 Oct 2020 16:50:34 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id 1so1221409ple.2;
 Fri, 23 Oct 2020 09:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rnfI6CR6MNrByW/oTFh3EaIyTTFNdfmHTDNbySXUNoA=;
 b=Muohvj7O0oK09MXn0QM6Uj4fGLynOfHZ9rnLrkOxQzUIA3YYK9s7E7k1pTfBfHXuKO
 Yz/5/9jNTYahvExGjQWsUYuvgS6AeviiDwKnZWOwDEzyoGJUN2sIgOLpttHk5Q6WIsY2
 dpyeScX7H8jUAyYRaf6ng8TCF68laaV599dzjm3akNwtBrZKB2VzvQll3zb5rNth6das
 mezxpuYX5O+xo116WaqkTeQsRZQImTTPnvYoER3YQt2f0j+RvWqcubYe/FETfvPx4yqY
 IW/FW1rNAi87ixq1VzFAxNeFFdK0GsIyjiY49rVLyFojDe0buZhkeBxJS3M4iZ3x2WUg
 AImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rnfI6CR6MNrByW/oTFh3EaIyTTFNdfmHTDNbySXUNoA=;
 b=qw8QBE+yLQh32nhMgt6uBQ8qqnGDikVajVZlbOdomiAij2kc2ZgFm9ZI1uQMq45oR/
 uOFXJOmmYexjAi4JdLME6WQ42xprF9Lz2D4jTsWf8tICSWYIGcYSRi/SQ1AJc/VMrFoR
 EJYVgBIXy+B+6aPTbMy+gYN+irbu2ttC/iyVPJsl/hl1S6+gM2ZL4R22AhXn6TXlyr45
 Hv8DMHOSm15jDRYri9PP34lfPxnf6hB5E4V+DzRPO+rbwOVFcXKfOJX0mIzigtwnW3Yo
 1FDt3SjybWu54k7IFPadutybbY9U3YS6UizoIYSCseyhK6G/bzIVO7goupbrEvEBDJ9V
 kMlw==
X-Gm-Message-State: AOAM5335OOXw8DkRPxmjgn/e1QYxobloTfoROIzz7h/EAqm4E4XQDK9w
 Toc7YiWDoKk9vGa+39TF/b8SRCLY3WLNzw==
X-Google-Smtp-Source: ABdhPJyS77JBbY9pncch+9LvadZzVAZxGMDfX//aH2HbO3UEx0cugM4bjeMvIN+39aVdiYUVxVHhzw==
X-Received: by 2002:a17:902:b785:b029:d3:d779:7806 with SMTP id
 e5-20020a170902b785b02900d3d7797806mr3210644pls.70.1603471833259; 
 Fri, 23 Oct 2020 09:50:33 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 z18sm2622020pfn.158.2020.10.23.09.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:50:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 10/23] drm/msm: Use correct drm_gem_object_put() in fail
 case
Date: Fri, 23 Oct 2020 09:51:11 -0700
Message-Id: <20201023165136.561680-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We only want to use the _unlocked() variant in the unlocked case.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 17afa627ea3d..992cda7e4995 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1140,7 +1140,11 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 	return obj;
 
 fail:
-	drm_gem_object_put(obj);
+	if (struct_mutex_locked) {
+		drm_gem_object_put_locked(obj);
+	} else {
+		drm_gem_object_put(obj);
+	}
 	return ERR_PTR(ret);
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
