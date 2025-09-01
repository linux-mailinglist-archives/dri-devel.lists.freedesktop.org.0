Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D05B3E2BF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319CC10E449;
	Mon,  1 Sep 2025 12:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hfitr/Ht";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C241A10E445
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:26:12 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-45b7722ea37so14174555e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756729571; x=1757334371; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3dM96E55Q2d+IuiT1HFvvKMogR+YhmA24qq/y8oh26w=;
 b=Hfitr/HtUsiSdbCIzFa73Wc5vVhUJc1PJlEpT8HxTJyN2ozTOWVvQ3j1y1lK6GEAWj
 5TwSggZzNzw16Nz4oMTlorNtmKtkWXzdd8XqNWHoBS0mozwO94r23N/541IiROzNJZws
 YI6RhvrUknyKsdrKVrysDGGpYsXWZa3x+qUbRGU/K/vEWGVe1GVvHUEbYVpIivx94rue
 YycBMolAd1S1vuquJd4P2Oa0dHE/QQVqoa/9OzSQ5DkYCzFuRBGR4I/OG6RxTAcuI67X
 8xvppdnn6/ovNJ3SUvfyiOmWE2SZPDSktIX04/UblC9x+8sIqfBCmPS94JokB+0whO0K
 McLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756729571; x=1757334371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3dM96E55Q2d+IuiT1HFvvKMogR+YhmA24qq/y8oh26w=;
 b=d+PQ4rRFuZZDSTTQv0zEBcSaTguSLYJCoWwA4j5sORCjQPxO1jisWJ+c1KfjEBAaTq
 wKbexHW+n4lirSnptK6X5Dul8tHM01pJLcIGclkfiN8xM7hgfmIOUfsCaawHzps8zx2X
 +ILVF5IpuNi5uOlIIO/qPKTvR6+K/X8jTW9kpSxdTfQzLhF90aJdTgAfPnQiMt5kECRH
 umwWMdP/wXSalhG7+X8a5+WqGQEKe02nTesPlJ/Kw8oJEf0Sw1maIkvyloX4WUg4qb36
 eeIZrxkLanr2Mdp1Tl2UnNQa3XMcum33ZU6ZRZYEk8fxvWNobvld1uoIJjHI4wpAcwV9
 bHww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWamenETX8ca8YVPtTCulwHHVZmPKGNc1vFOzrVJIjKYx0pbpVlKOSsiApTkiU2bWSPmXPXucc+g18=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyridNr5Jpb30JoyDQsIeEFGzsT9U+954cJF/NFmRu+x1z8rYI0
 W048yWAZzRgRQTbqziAp7MmJ5oT0+SX22GWkxfxrKIT8RZ3AMw/iYCgC
X-Gm-Gg: ASbGnctMXOtGnDWK9yk7PPCwO9gjkw9WHdo9V1msyxFBMSSjuR/qccGjnxDwLPiOiwY
 20ou8gv6HsEIc8cLDO8577QvosCJ2jTIijVYsHkkk0u3kcYtrwZ6uKRaikVwbcrdVjBbHH6uU+t
 acfsJQvx7SLcZVA3Q0Wge+P4nZ2D1Yl9JpodqBUAgViZCqR+dLi5nfh4wH61rnpS8U2sN0q3Fy6
 qno7jtyEEb2nMegUo0W+FrhppPC467ClacsLkSIGIGin5rQrI09DlDbYnH8307xBWBb8eJp9zl2
 wZTjHQqLYTEY8zqNxbcSCBT80oqkeR4Ts0MDDsfft/XeaAM/Me9/5tihN0fQ3TE25t+z+CouKAz
 /3RjsglTlxyGUi3Et8Q==
X-Google-Smtp-Source: AGHT+IERl739fULguTB8wwYqhn80dq/ta43RUTSs6JPhZjlt4LfeVOI7iahJopxrHeUJTf3jhOn4PA==
X-Received: by 2002:a05:600c:1f96:b0:45b:7510:4042 with SMTP id
 5b1f17b1804b1-45b84c65642mr76911685e9.17.1756729571065; 
 Mon, 01 Sep 2025 05:26:11 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b74950639sm207297055e9.17.2025.09.01.05.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 05:26:10 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Mark Yacoub <markyacoub@google.com>
Subject: [PATCH v6 13/16] drm/vkms: Remove completed task from the TODO list
Date: Mon,  1 Sep 2025 14:25:38 +0200
Message-ID: <20250901122541.9983-14-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901122541.9983-1-jose.exposito89@gmail.com>
References: <20250901122541.9983-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Remove the configfs related TODO items from the "Runtime Configuration"
section.

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 31a3880ad83c..364b574a8cae 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -233,21 +233,14 @@ Runtime Configuration
 ---------------------
 
 We want to be able to reconfigure vkms instance without having to reload the
-module. Use/Test-cases:
+module through configfs. Use/Test-cases:
 
 - Hotplug/hotremove connectors on the fly (to be able to test DP MST handling
   of compositors).
 
-- Configure planes/crtcs/connectors (we'd need some code to have more than 1 of
-  them first).
-
 - Change output configuration: Plug/unplug screens, change EDID, allow changing
   the refresh rate.
 
-The currently proposed solution is to expose vkms configuration through
-configfs. All existing module options should be supported through configfs
-too.
-
 Writeback support
 -----------------
 
-- 
2.51.0

