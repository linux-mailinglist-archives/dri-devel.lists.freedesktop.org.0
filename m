Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDC1A79433
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A89D10E8A8;
	Wed,  2 Apr 2025 17:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZUh24d+A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D465B10E8A2;
 Wed,  2 Apr 2025 17:42:44 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3d6d6d82633so490965ab.0; 
 Wed, 02 Apr 2025 10:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615764; x=1744220564; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TtBnrd8yWB3oKPUJX24gJEUHr1Wu50+TDt3ZzWgKjdc=;
 b=ZUh24d+At2WQVsf0XFB5OQMjjWmiKrWUf1YQJbjT5Q9mfVeBRCuQKstcgB5weE+YB6
 /72mCigMRdrQR5HBSSwxv3Kw2dMk54oldRjpRYulA1ezK2+Q9uerPi9z0H371c2iE+vZ
 3fhyCY8IXEFzFZe1QcSrugxsDoPcWywi9aSLwU85ofjC1/+5D46lYDUrao17W2oKPLIO
 k9z2Gn9bNhm0wBPCC5Tpmnk5Uqw2rAek7EK3zggrIU4uLdPS52HSVpVEEjPndbKfN/2s
 in0cWW/Uaj3mB+mC3tavsTjwVPMMfCCq3Hor7f1akIuEAuPAfe4wWcYTRALIQYauCKec
 y6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615764; x=1744220564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TtBnrd8yWB3oKPUJX24gJEUHr1Wu50+TDt3ZzWgKjdc=;
 b=WCf5lY45O5WdIMhdaCIJJ79zHcDm1ewCY+1UoYUBMtzd0PZSAy4mVWp0CXToRg5idZ
 HNFHb3o0fkEJeH8PK2INRToX3KUdxA+ofZaG4eblgTJsLbirsoeGnkU1mYrntNByWFWT
 bVRmWvbST13ScgFXejh5GEQv6O+Ig//DnmSztHoPWCvz3tYzssv38zTxSphKj+QhmRwL
 f5GvnAKZnI5KCc1FQav4Z+owuVdslrc7Ra3YHv0y4kGlCv+70yKrYsWvdHj9pKiglJoZ
 /g7tgbzPjSoWpNATHSgTA+g8cB+N0BbXtfZHnxCfgR7hci1qIKsp0rs5nwRyc3XNFRlC
 b0DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU31JOB4XIzH4wIMkTZPnLr7xZdxw3Ii2Z4vbQQf8JEMd12IVEvehBplJwMfOj9V+k27aoED2eaN9fG@lists.freedesktop.org,
 AJvYcCUzrG9TCxWtXf1B2u8ItnPSjdCVJQ5JBqe7LwU6KX1KONyayLaUNw2DI+N5kbgaxIXEPkpPyIyhGI2aBqNvrQ==@lists.freedesktop.org,
 AJvYcCWEKw8lDpLlky1+979vTy1ppudqYz4KrMBsqgwlMa7BeU955vEYDEUU9b2lKYEnyT7R0APp4/8C@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKRff1nO0NoPD1VCoIOhhq48EpWYrWaMCmawCav+aAlcOaLfST
 B5HbeAaF08OaMVIVWKCSGT0LdZnuviP5ddw1xGbDOaIMorJe+Smn
X-Gm-Gg: ASbGncsN0Ei+MzwM6AOeSD5zddHEzqxrWzTfxuZlH06fX0Wl68uQvxd7iM1DwViPGW7
 NpIxasWOqWoCx8avXnQuXUlUq8h6ywNdhlN2pzA3JI4Nol+ceR9mz5pEuQKwXpnQF99a1ntzaLP
 HYF+0WP9oiI7fSqrLoaRVzsfGS1HoZ/sofzIsrRZQPN2nFzlB7SFJMbAHg+ViBDfflkdWtgOsEP
 ye96Lu4pDu9RGChRYI3hMgIYWmNrzzOvngLUc87eun19akGjEQDxmJd663x92xwk5+ulBnepG5l
 rTHqX+KmOf0MUfhFYK+DHZ1PuRN7jk9X2GYBjZWPuhqPhKL1BVseqxb2tXFk/BHv/fQWtv75Eot
 X9A==
X-Google-Smtp-Source: AGHT+IGTBl3lbbr6SJDgP5PSLh5HQqCvYpL4DLPKQgcBrXs/j8ELoLu+4SyOVWtWqWN9s2TkWLcitA==
X-Received: by 2002:a05:6e02:1a8f:b0:3d3:ff5c:287 with SMTP id
 e9e14a558f8ab-3d6d5535a0amr31636715ab.14.1743615764063; 
 Wed, 02 Apr 2025 10:42:44 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 30/54] drm: use correct ccflags-y spelling
Date: Wed,  2 Apr 2025 11:41:32 -0600
Message-ID: <20250402174156.1246171-31-jim.cromie@gmail.com>
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

Incorrectly spelled CFLAGS- failed to add -DDYNAMIC_DEBUG_MODULE,
which disabled dynamic-debug in modules built with:

CONFIG_DYNAMIC_DEBUG=n		# 1
CONFIG_DYNAMIC_DEBUG_CORE=y	# 2
CONFIG_DRM_USE_DYNAMIC_DEBUG=y	# 3

NB: this adds the flag (when 3) more often than strictly needed;
modules built with CONFIG_DYNAMIC_DEBUG=y (!1) don't need the flag.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 19fb370fbc56..704f94efc804 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 # Unconditionally enable W=1 warnings locally
 # --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
-- 
2.49.0

