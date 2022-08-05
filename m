Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C3D58B22E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5D4AD9BC;
	Fri,  5 Aug 2022 21:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4379A0512;
 Fri,  5 Aug 2022 21:54:51 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id x64so2872149iof.1;
 Fri, 05 Aug 2022 14:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=V3EmUW3uCJhVtlfIw0MXAC6Ylt2LCS6+A+4ZDgY1kTo=;
 b=ShBrGYIwiJ5Z5UFM4aatUf0XZbdzveqaHYzBMbd00rDzxakjjXMab/x0Q0YHiYMC5s
 PdQvJ3lkSWbzReG+11eWSG0qdPBf3i3lhEtcnYkfW++CfbyH1OiFePCxGAINrxxSSVGn
 Gp6W0nSfj5GQfhzkSYmhCOClGsvHRgvDIVz5I9VEINcxbayuH6yrjofEm0TmMkORLGUB
 HhuaGjdFI8t/lZ5V/9x/H7ZGQoC7FGsnXbpRULy73MmTkOf6MjhGLuVNmKpw0DNGeK+L
 jD74miLkviGk2LZHs3/D4xolo/pZN3NNYt/DoWJixqqM1WVZfLkt6FLfz6SqEVbrALGd
 T0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=V3EmUW3uCJhVtlfIw0MXAC6Ylt2LCS6+A+4ZDgY1kTo=;
 b=L8rxbE/DQIgdB0hRd4w707wdtZdIQ8GVR1Zpji/DazgYG4juVG9eSVjM/9pK/ET1T7
 vouPPLaQBSFzAR5Ke2MbDG8jHThR6xCb09Yb28NcPqzlLEQxWWm5VOKrJv3EmflJ9sNa
 fvxguHEO5OsN50OVjEcsBwk2yJ4swaNWyCWJauB2k0KMNafLl42ez8Ikx0xLf73HwwlE
 BqHmjOtHcnFl30v2zYHWayUX0U1XyNzEdGgUjaYGhQ/oNgbwM8WNgYZMPimtibGSP7d8
 9M40szMlfofMeL+rjvbHu/nqw1vJ+VijtDdAAciRhYF08uofs+wMDvXFGHRFScG+BWU7
 DxSQ==
X-Gm-Message-State: ACgBeo2wWatBaJcOPiJpS98XThlFISEae5TXVkAqjWcIrcjoSlr5/NFZ
 mlYuGPWrSN438Kh/DzJBfUk=
X-Google-Smtp-Source: AA6agR5vaPMifnt//T6bSjIi//2udEDTd2tRxQPbcvsCKYwI5779ubMpxC1YlLcWEXL4yXw/5ukcsA==
X-Received: by 2002:a02:cb47:0:b0:342:8e65:7518 with SMTP id
 k7-20020a02cb47000000b003428e657518mr3942262jap.242.1659736490879; 
 Fri, 05 Aug 2022 14:54:50 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:50 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 27/33] drm-print: add drm_dbg_driver to improve namespace
 symmetry
Date: Fri,  5 Aug 2022 15:53:49 -0600
Message-Id: <20220805215355.3509287-28-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805215355.3509287-1-jim.cromie@gmail.com>
References: <20220805215355.3509287-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org
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
2.37.1

