Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50124A6ADC1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAB510E6A3;
	Thu, 20 Mar 2025 18:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g5KAO4n6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E8E10E6CF;
 Thu, 20 Mar 2025 18:53:57 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-85dac9728cdso28606739f.0; 
 Thu, 20 Mar 2025 11:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496837; x=1743101637; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/3ieg6OYf20TvXEjKUEioS2vPpvBZB2Yv38SKV0x07E=;
 b=g5KAO4n6cNIFTiATtVuJn0S8i+trcLctIde5w0PJpxehteAU2xBk/cp5GtDcKoyKUs
 9Ca0C8OoTPudIvJjJzCad00OqYyqaFF7o8TW9YuBInMgbO5DeZQJ+4OCOplU6GVRTEgT
 NA7nfd+diVIK9zZ/Ip9QcPcMxZ/MELwCXCZ66XimQIStfkkEh/xUt3AL9cj/4WI6thGe
 I/JL04ABdRnaitcKcyyYbGxnf7E71sMN67EaP1mRL4iTJvtgc4W9bHik0O9rDge17nyM
 cS4i5wMbQXbY/Q1TIcbFmBu5NGHIw9lbOVDSDQYgXnt0R5z5mjqA9rSJmqTsL6hA7rLr
 Pbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496837; x=1743101637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/3ieg6OYf20TvXEjKUEioS2vPpvBZB2Yv38SKV0x07E=;
 b=eDZbJJbsY2WSpgj0Gapr12bWpxbhznqCiAuq5dxcFivbREcDe0DgYxJAkNk+6i1Vdj
 9FCvUy74Q/IWBmY3/rG2HRzgepPw2y4hqmr2DzwuLHZfUSgfijW6KgFnhcxs/j/aV39m
 CF7Nj3D4wH9LJf1CDo+HkwdgNMyQY/M8I6kW9cVZt6XZskq4v0zBMEGR00+6d6Oqm2ZX
 bQfY9vFk9dAIvsYEv5Cdd3fuUKaLlYOYcgq7OcVxNZx8284WfMCaT1epckxcIptFR5Q/
 bI9GPQxQ6CvDTpaDWvfzVh2WfB+TlKFkv5aKmGo1yXWkuGoOYa7x9LZF6i4u12+rYpFA
 iGbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWHMj8rjfpX/4+xa6Puo7c4QoYiqtqFkgbHOJdyMFdjF+qFY6Z+q4RbGgRlQh/iWiBbp3YF/6+mlIGbMUqrg==@lists.freedesktop.org,
 AJvYcCWo0xOSryWsfHk/QgmLdG9UwwmbalMorifeFNAz5hxAyeHy5avUGhMGaI8JuZc0nBhhKgIdcFwHXyol@lists.freedesktop.org,
 AJvYcCWoZ20s9aJbZJ7tSJ07d3rYApS38KX/b2+9YMQ987nc+GyHI2z+j1jh85Hp/L0ZHimtklx1RxVG@lists.freedesktop.org,
 AJvYcCXfJz1iVJTL9xuJHQZlgnotC9yKMzalEthT1UHWCZHZfPibW0as1IQLTRq0OYyAskPnIUy/9UZsz5w+a/qxWSGqVw==@lists.freedesktop.org,
 AJvYcCXw1xHVb1BLeaAxnj2idisZjWOMiB9eyymlhdJjAYdUHwfPiRzra/GQR2/tDp2yXXPB3og8OWZOFNYi@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztT62LmmuXXlnaCLAG00iHRHWUVg6g7AIvie/BbD1aMmbQAVzs
 5xYH43GYBJTGwqP5Yid5bHghL6qd8+eAEvepK8zrkRD+arpduw4p
X-Gm-Gg: ASbGncswxDEX0T6rk9+iq4dZWgbnIc29KPo96c1Xv0vddvwMqON97BRGoOeHkJ+osib
 w+h8+i9FGSfqxbUTMiNDu3vJpTScmOFcZoy6VlXiZdQhe4Uv7eSmDz8/ycXe2hUk/dULI5+WP1s
 RqCoIvJ/1WvP7ZLjOl5dv7NVkpD/3cMtlWH4cuu5pWhfz5TNQggbM29etJiwh9LuRATuBAZYnpE
 BlwYKNn6XiwBCszEZpxTqKdzn5a5z4nSRHt3twOCawufI16KC3ZWRte3b9u/B4eUu2GG4QDKF5G
 BIYQxayGeILh618cZ8m41J/bSKcQRvnXg2jdFpKE9EIpGYZKL/U9v4IanQS/zXBjH0ipEchBLN3
 0VS75tSJcg5IS
X-Google-Smtp-Source: AGHT+IEV5S9iAZ4P4kAl5psRQa2kOypMVf8ugJ/2bScFr4uYQKD/pc1j30FSkS+FGYaEZcWCdvjtbQ==
X-Received: by 2002:a05:6602:488b:b0:85e:1879:c708 with SMTP id
 ca18e2360f4ac-85e2ca388bbmr48761539f.1.1742496836822; 
 Thu, 20 Mar 2025 11:53:56 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:56 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 46/59] drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
Date: Thu, 20 Mar 2025 12:52:24 -0600
Message-ID: <20250320185238.447458-47-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

tiny/simpledrm has 3 DRM_UT_DRIVER debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 5d9ab8adf800..bcf2cccac0ec 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -34,6 +34,8 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * Helpers for simplefb
  */
-- 
2.49.0

