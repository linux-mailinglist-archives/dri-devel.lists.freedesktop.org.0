Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9D03EFDF0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 09:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2AD46E462;
	Wed, 18 Aug 2021 07:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FB16E461;
 Wed, 18 Aug 2021 07:40:38 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id j1so2057161pjv.3;
 Wed, 18 Aug 2021 00:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=he3hjgMVhcOXzxQ8ZzPKGe5qy8qOVQuZUYfKXwOfAPg=;
 b=V3ChonAMDLG13W4R9mt1UZfcDRlf3NYYG5Rp6zwLe9hoPv7kNaLSz1SBaGSu4gacb2
 IG7pihFofk738zo0sUjjMECc8BKbXHoRFgXUaz+rksmgG1umJdIhslaO4DouScE25nrz
 QhQN0KBGfOlxOAV5gm+r9YxMmPtBF13v/W8YFP2iCl19RlJ5zdD+L2hOm2sa+1iKHZGz
 CgFFYbvwQ/FegyZK22MDmuuW+iQHHAazsx4WnIW9u2x3s0WyVCRHOYH7otiYZitptlk3
 7J02sZUKJx/5shMUykUIDn5WogVBsFWvX2MIVtWcImlFFB8LyqmG2vbSKdj3J6amSb+W
 /hSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=he3hjgMVhcOXzxQ8ZzPKGe5qy8qOVQuZUYfKXwOfAPg=;
 b=HfMeYy2T+SCd8KtL83IYjrPKeWTZvyQbohmLA44q1F9eLWaR66nwiLucgdJotctEuC
 OC96nchsD3gsxxw8HV7s5FsCsbgpQ+IW6IzmTm094yLZ5m+0jrJN/ocv7qZLL3eAneWV
 3jvCd51vPGuPvoNmcEHdBPvoYr/Kvar/PKHKEpxgWejLdZlLJ5PdVK7RBtaLiPTjBCLo
 l5tIAK4mI1HiWzPqVW01CSVJ354lClLkNQ/HkirMmqPqyHX3KR+WYU3xVNHYp8SsPaZo
 cMpNYwBh1nYGpm+MLpJNbaA2amQNeJE2ks96/pvo56g+t7Y5N7Hw8rjHEm4Vo0H4h6pS
 AXtw==
X-Gm-Message-State: AOAM530JSiwe3kRO64JMqq6FcMCfxiMwp2dJ+gnslY83bVTjisJQPD/o
 hVRgkRQW7km2vEeH4bu5gy8=
X-Google-Smtp-Source: ABdhPJykotiJspllqjLdDweoNoswYBNnKnCEjOlyfwnrSucYaBkYPe1fsbb0KtPlQEnYeO0NwCNLag==
X-Received: by 2002:a17:90a:b009:: with SMTP id
 x9mr7893927pjq.97.1629272437819; 
 Wed, 18 Aug 2021 00:40:37 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:40:37 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
 tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3 3/9] drm: check for null master in
 drm_is_current_master_locked
Date: Wed, 18 Aug 2021 15:38:18 +0800
Message-Id: <20210818073824.1560124-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
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

There is a window after calling drm_master_release, and before a file
is freed, where drm_file can have is_master set to true, but both the
drm_file and drm_device have no master.

This could result in wrongly approving permissions in
drm_is_current_master_locked. Add a check that fpriv->master is
non-NULl to guard against this scenario.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 8c0e0dba1611..f9267b21556e 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -66,7 +66,8 @@ static bool drm_is_current_master_locked(struct drm_file *fpriv)
 	lockdep_assert_once(lockdep_is_held(&fpriv->minor->dev->master_lookup_lock) ||
 			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
 
-	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
+	return (fpriv->is_master && fpriv->master &&
+		drm_lease_owner(fpriv->master) == fpriv->minor->dev->master);
 }
 
 /**
-- 
2.25.1

