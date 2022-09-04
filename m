Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9050B5AC758
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96B910E334;
	Sun,  4 Sep 2022 21:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221A610E163;
 Sun,  4 Sep 2022 21:42:36 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id q81so5653842iod.9;
 Sun, 04 Sep 2022 14:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=JJmkd9QkaZyaFdemWU+lkrR5661ckSN9S5LOBM0abWI=;
 b=Ekp5LSqCs4NIcDItFljM2WjOwt/efnWVaMW3yCqrqsUihOs5E0jY1gRnas7XeEnwXQ
 mJczoHE301+UhR2sdrk2Z8XMrus7OmPoIHzPLx9pOfthkP14wtWEMeSmcVDFGWB/CtdJ
 QoGwdbXBIatuJbFnjhsoLD7HBBwTwthzbbd/ephKZj4F869SAIYstaCw9X5XldSmfsj5
 425BY3FM/yceTIl0QRHpBbqSrZ3pLSgxz0QvSfOSxR2x3onovMe0LjQXpUS5rZwJQTDD
 f0EEtc2lmFOrlMPRrbL5XtYdvoUv6FfCFWPMR8AZBn6i4YQ82dbzn0YVDauHfrda6dbp
 qmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JJmkd9QkaZyaFdemWU+lkrR5661ckSN9S5LOBM0abWI=;
 b=7LYv/A3jHQI3iUfUepe58WbM44skBeBGRz7HqdPLwY6uaxVemy078FU2I7exh5Pxuy
 5GkLErj1XrjtW6v9LNcarzLXP3GkyTuqug85jSWPY9lfk0ioGWs2gk9uV5Sr0WS7er/Q
 tcAKLkyVBCAjrR62BwQqGP54mi7zbL2f3NeGxupvlnum84dV/7hK5VsS+cuTl/PUSo3q
 MdpZKG4WR9LkhXXJoQUEs+e4L3dUhZ+Wqs1xPn8ZY2Zs7ilUggHq61kTYOiMEEjwy88n
 qgFpoVelJhwS3BWdyj/q73Q65BtMt4RShxLQYfG4vBNntKKKJIdBCXV0Eq1/hyMG8XDG
 t3vA==
X-Gm-Message-State: ACgBeo0wSxbc3Ad/JVRsKS9fTtKE/NF49wYniqNgaBS7EqTC9NBA1erq
 IxhcnIBA2DYVN686adqpLXka5yPLk5E=
X-Google-Smtp-Source: AA6agR6Y58eeN88K8D4OKhkCxT/e0VQuWiJ6m00+40bBTPAFdN9SV1gHrr39O9uhC7t16UdJ5cZYpQ==
X-Received: by 2002:a05:6638:224:b0:350:6e7b:8e59 with SMTP id
 f4-20020a056638022400b003506e7b8e59mr4269174jaq.237.1662327755824; 
 Sun, 04 Sep 2022 14:42:35 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:35 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 27/57] drm-print: add drm_dbg_driver to improve namespace
 symmetry
Date: Sun,  4 Sep 2022 15:41:04 -0600
Message-Id: <20220904214134.408619-28-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_print defines all of these:
    drm_dbg_{core,kms,prime,atomic,vbl,lease,_dp,_drmres}

but not drm_dbg_driver itself, since it was the original drm_dbg.

To improve namespace symmetry, change the drm_dbg defn to
drm_dbg_driver, and redef grandfathered name to symmetric one.

This will help with nouveau, which uses its own stack of macros to
construct calls to dev_info, dev_dbg, etc, for which adaptation means
drm_dbg_##driver constructs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index f8bb3e7158c6..dfdd81c3287c 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -468,7 +468,7 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 #define drm_dbg_core(drm, fmt, ...)					\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
-#define drm_dbg(drm, fmt, ...)						\
+#define drm_dbg_driver(drm, fmt, ...)						\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
 #define drm_dbg_kms(drm, fmt, ...)					\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
@@ -487,6 +487,7 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 #define drm_dbg_drmres(drm, fmt, ...)					\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
 
+#define drm_dbg(drm, fmt, ...)	drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
 
 /*
  * printk based logging
-- 
2.37.2

