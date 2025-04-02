Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EB9A79462
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC68C10E8B8;
	Wed,  2 Apr 2025 17:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VykCYApp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE3A10E8B0;
 Wed,  2 Apr 2025 17:43:05 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3cfc8772469so414895ab.3; 
 Wed, 02 Apr 2025 10:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615785; x=1744220585; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/+QMYU6kMnFOETa/gyjW3XwbPIpROUU0JSPdCI4eHHw=;
 b=VykCYAppdYYwszap+5AjEvEiybSwMGHFoQTIhZBqKSFz3DSq/E1glPS9QukrxboN7R
 lRPCwh6igLEVVgd5KoOo1cJLs8rGhr1Jai95L1vmjpH2Bgyqw9TZYlxrNg/HLJsP5vi3
 3lzEMJ+KpCJjrduHthfmbuwzCnEFG/NdJW/kzLn3Kp3SG38997KvX4iv27SOQfMpotX4
 7R3L+O8Q9jwbPaxw0urc5A4TfDE4v+AmCLc8VeRv5dpaDgRjdno3WyzCNKUWEMhGZ344
 oo814GaejLZwXfu23W5rKgq1X5bfQRwjmkdq5uh+44gvOZnqeee0ObW2RbLIY4UU0UKD
 EOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615785; x=1744220585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/+QMYU6kMnFOETa/gyjW3XwbPIpROUU0JSPdCI4eHHw=;
 b=ATa+EL5f8nzuqG9221kLImRwbEMzvTKn8lYf336seKXcnqJvPi6x2e3DrLnUKqga1g
 fu+u/++Sx6ew0WKuDIOVy8p9TMQQXEwzkt0zuiaZL8ExPD9rSdTMxAO+QvPhmPM7y/C2
 CTxUopcuOQO77HTFOPD+YvqYFlv3r40xPRJ0Sjsboe+fx89XY4+v1AJz8BRwGQZQBiCo
 rJ63XtxXLQ3G62dIN5cr6p6Yp8rBOhGb4tJr6KAsA2zLcWP1HEn4gkA+q4u+4enmN73K
 OpKCIk4ycMg85fc9pDuEqADdOFpKSacyqH2zgj7ukREj3hGv+SYQ/6QOnP4+laf+9Q9v
 zi5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUpXVKf1sPcRG+7u3arkWnBq9LvR2G7l0ROxV5YBelwT0wWYZTy6rXg/Pg13LirI4OsrV6b0JLIT73@lists.freedesktop.org,
 AJvYcCWoIYUps/AciFFRYTiqiAQqjFsvH9PJWffFdjB9mYsTPYR4Lrka5bEBBE25eGHSFUXA/sHTYkJv@lists.freedesktop.org,
 AJvYcCWv1a6cq0l1FWqIN8G59PXZfkrTkLj5pbMfm1LENR2d1rkIptDiQnTeA/nSoUrovjcTrdH4U/BRiPoLOp3ayg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvJ652+z9TA2x2P9L24SH1M3OglmGuSHPxoBuotoXDwQSDM7Lk
 ZAYTeQs94VAUEjOQ7Cs/OiCbscXehMJ/7xKROMzAoXepntTvpOjf
X-Gm-Gg: ASbGncsz74b51Lh8u03Q8szNLmddAu+rLjBAdX9V4iFSCdprzGlVnEBtZHQmTkuObF2
 Q2YR66dlOS8jtDnM/8h1ckghCxjIHviwF3M6ezwO3x+hwqkt4F+dCx0ZOXMcV0r1gTCdIndeJep
 EEFzlGn12mqhP/WTMFLPZqHOLRwve2uedZVD1iBt4USVgD+DFaVHbTCnRWFsg96xylNZse4ePTD
 hont0GVtcoOmbxCsM0sxTJ6ZZSXeqI5jpg66nvqc31YgQ2IkfnasAqJUSoYDxn4mqy3hprZLrrl
 FaFB/GMBceLdrQr1hpnLgXltaMQGOFIQKhou1TATymmYqeN16VPUe5grb4KrMZta2a/oNObPPpH
 +sw==
X-Google-Smtp-Source: AGHT+IH6nE+1RRyptl+hnFIsnD98qBIE2DJ5GwLkp49MBABtaplmtxYAgbpkZKesyp6M7QVsZiqFPg==
X-Received: by 2002:a05:6e02:144a:b0:3d2:aa73:7b7a with SMTP id
 e9e14a558f8ab-3d5e0939424mr211440705ab.12.1743615785077; 
 Wed, 02 Apr 2025 10:43:05 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:43:04 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 53/54] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Wed,  2 Apr 2025 11:41:55 -0600
Message-ID: <20250402174156.1246171-54-jim.cromie@gmail.com>
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

Time for some thorough CI.

Also, the previous 18 patches could perhaps be replaced by a single
invocation of DYNDBG_CLASSMAP_USE, from a C-file linked into all drm
drivers & helpers.  I didn't find such a file, nor a drm-client
linkage item in the Makefile.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index fbef3f471bd0..c7d6adbe17eb 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -53,8 +53,7 @@ config DRM_DEBUG_MM
 
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
-	default n
-	depends on BROKEN
+	default y
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.49.0

