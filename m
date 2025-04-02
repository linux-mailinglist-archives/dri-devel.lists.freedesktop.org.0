Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49533A7944D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A6B10E8A9;
	Wed,  2 Apr 2025 17:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X4JABFT0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1964E10E8A2;
 Wed,  2 Apr 2025 17:42:56 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-3d5eb0ec2bdso423955ab.2; 
 Wed, 02 Apr 2025 10:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615775; x=1744220575; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ck+/k2kUl1gxvAy57O83XENj4jmXSLh8yxG6/aZ/GV4=;
 b=X4JABFT0g7/OpFzdHFV5CqSB09cP/j9Qu33x8HDJKth2ad9WW8foRMMsyolEdJ7920
 SrV2L9nkfnd7WLr25OapS0iO0Tr91Tas1Klwl0dcgkAo2RBddQUT1KB/MnRZYWwwV2YM
 IL9LyYR7eiDV+P89Zl+aCXSLsucxwkznxFt2qKK8Xxrid+EqY9Y323LaVdRwxzQj6Vxd
 i6oP5Jxvojg7wndE+mBhVKDAbtUTplmO+0PukKu+9eRqC5Xo+HViNDnwoV7CggL0HthC
 UWPTI/VU7WDRqwFlln01guT4meXpswgv0JAyUvwcG+R6o2QrceSQwtYlSA06UUm2EMGr
 f7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615775; x=1744220575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ck+/k2kUl1gxvAy57O83XENj4jmXSLh8yxG6/aZ/GV4=;
 b=PDx+lCQVwQ3FUTUrG3uxUr9mB+SbPH+ruJNLdIaW/31CZF4nIHGYouovUEVh0mwPuW
 6Qw1pioFbXzy6WEDH8hCV6AnqtPFsHz1Vc1CSZCm0YE4KBi2pvygyDPngfqm0zSojlSK
 5myzboFAsaQkZVh3GZd1NyJoxYR3WAWgGn885Q3TvUHoE0GZHMeTZ6l4XsU2eHW8LAWi
 X5z8a8nFkXGqf5u+H9xXbFaC2jUbIugLuVh8inVUd0kFxlglsQBPj7viihlWGP61iwev
 oWTMdaAEniVYzFgMFnHs3CW/HyJrsK6tUgPiK8Kj6NQID+1I2GnYlI3qwUhgeG0evxM+
 BN0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOmKFYpy44NG26M7YSpZLEoi+vFwyGMYG1G9i6ckar+EPosGyyCE0xeVzCJi/juBK7pAuiHj+b@lists.freedesktop.org,
 AJvYcCWbNki5/UrwVcuKZZGKp4yaR4e9kBN9NRP0QcW/1q9msQFm0utKJgZUgwgzrVTAiUgz2chvUMv/lxLd@lists.freedesktop.org,
 AJvYcCWoR+UVUEhjqjq309UbfNtAUNeCqUOEk83fZQ099nIb3Reaepz1mQhMaMlNoLowa0O3217YhFxDE+BGxQmGTA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzH5A2g/lSJgTffZeKLJBPtk9HlqDWXvQW69EHvGhzO7KAn4x7j
 M7Xuv27Ga4yHtXthVRFPdMqf2N8NOKED7TfpOvV5Ybx0WWcnOGm1
X-Gm-Gg: ASbGncuJ2D7wZraS3PLLh5QqZhU+SEtqPtgmrhSTZWFPYTg+guQ2vBWqqe8BSYjVNGF
 lhRTj6Oo7wLKmpKJ7TuDv3b3inRv5m9dCDs0N5lUV4FPsbZ49sp1iGUXeM/UZCDBohR7cxwtmcB
 yghcRjS0TNQFFHYNfIjRr63QhZB9SMrtxH+uq9Z5h7kli0D03fUUqYn+fFVgEzLCDM5s6B1/KW+
 9A6E4v7dt3ETP8dIeSTNBTnjAgJIfin+ofcVlq62CVuEhiMdKIMI5nx8HHs4rkoSyyyKfw6LmTL
 VKyMg/dE3XkdEQZDL9PGsQcfOuRjCo6nBucvVpE5MJrLw70bS4isUOjlWIMz/Y4qslgDwD9hXZ1
 9ng==
X-Google-Smtp-Source: AGHT+IHOrTfoglNfhTLG8b2lwZ1DeIxr9/rPRHu/zfzN/2T0Ub79/SVMCDvXhpVtgwBAHBV2XSusPA==
X-Received: by 2002:a05:6e02:1a67:b0:3d0:21aa:a752 with SMTP id
 e9e14a558f8ab-3d5e08eaf0emr82506525ab.2.1743615775316; 
 Wed, 02 Apr 2025 10:42:55 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:54 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 42/54] drm-dyndbg: add DRM_CLASSMAP_USE to bochs
Date: Wed,  2 Apr 2025 11:41:44 -0600
Message-ID: <20250402174156.1246171-43-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

tiny/bochs has 5 DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/tiny/bochs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 8706763af8fb..dbcc8ba70dfa 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -59,6 +59,8 @@ static int bochs_modeset = -1;
 static int defx = 1024;
 static int defy = 768;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 module_param_named(modeset, bochs_modeset, int, 0444);
 MODULE_PARM_DESC(modeset, "enable/disable kernel modesetting");
 
-- 
2.49.0

