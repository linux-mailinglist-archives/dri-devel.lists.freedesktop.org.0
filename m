Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56788924A7C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EFC10E6DC;
	Tue,  2 Jul 2024 21:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fujtVhKl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D1010E6DF;
 Tue,  2 Jul 2024 21:58:53 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-7f3cd64e71cso138058539f.3; 
 Tue, 02 Jul 2024 14:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957533; x=1720562333; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FbmqLbQI8HTQzNGF8HQCP2HSLNy1cuHjZEiMFoqqHgs=;
 b=fujtVhKl1k6JDElMk5UUNDrhSRanUS0X9t7ZBODeUVo9JlnlcACj9hOX2iR0YgmPk2
 tvkpXC9ATRDvXgNwnLdqdlMD3EVtkIYSEcBZRf+QRCXhMUEzjL8aJvl4+wGVifNtTzXv
 RExA6tXSPr4nz6txtBbXxADb29W3fbBFpnPwS32eqJc9m4e08tlthUHqeWcaGlAFuSMN
 697PMz+jWxBKh1pe/RDVYLiZ27twgbhufxSn9JjsROZ9+LJRf9nxHy1PYvyYcyLCJwL6
 VjUnaMbOIAyT4IUTFcYACHvcsZ3w4hd5GwM+Qi7+fcUFgiJDctU/Mcq8bY260XTeb+ET
 QmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957533; x=1720562333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FbmqLbQI8HTQzNGF8HQCP2HSLNy1cuHjZEiMFoqqHgs=;
 b=Z7AzoEj74OmMpTx6CiQYiRpV+x7b0SSQXm8oOGvqBXpKstOl+SGUomoS5nimXJQpif
 KNbrttxFsK+Uoj2tlC1RE7il/4a21YUeyrr7/Kl3fB4qxxwlJMiuj+W2zHwcV2/ljDjF
 qJJTPRdKWnwgZa2sqE11KjrEiIZDsOYmUFEJ8qXqHKv1mOBkWXxmWoz7Jo8RRp/H+9uD
 B6Hb7DoEweE+SgOVwumDNfgXAnaXvYPJaqLzvR8dPxBRPI0olipziTm+9Y7tGG2NTVVD
 OR1vjTSH9Ec/6C/Rh9/M1OZ/6aNuhLeyzxEQf63UdmmZzk6wyAh3zGWVSkyBepLzwJpY
 o9dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHNmh/dgLubEMe8H+OLgkvD0B0041E62T5ys8tijk/JGQTKV4AsvqXINFKClYXE3ThFcswhw2LsY4miT3/thGHps+KzlwiGpNICfQjYHRmPH/24zH7bSfU0H8wpD5QjzC+JIsUozcA42ZFCvL1ylKaSbkKp11nhymPMGNwoWCMCsR+LJyqlYrvWOOkHcMfYICqmNtWspcWcwoQoqDTAGFrNgSxN50glXg1UltxraPPmiJqVi8=
X-Gm-Message-State: AOJu0Yy+SxkKItTDC3D3nksPCHWXDf4D+vJEeFwXd14vNKxXSrIVvCZN
 hOX8FXfBhxASb/zv4iKavlPfP3f7NfubettL/mwiG3KjNH8zPenh
X-Google-Smtp-Source: AGHT+IGlV5e4CX2/hYLHSwwmfK8aU2Z7WZzMU6zQISMzjPh/8c+A5mSKEdQB89WlGTCmF6ZX4oDK1g==
X-Received: by 2002:a5e:8c05:0:b0:7f6:2b2d:8ad4 with SMTP id
 ca18e2360f4ac-7f62edff929mr1067071239f.4.1719957532918; 
 Tue, 02 Jul 2024 14:58:52 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:52 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 32/53] DRM-CLASSMAP-USE in drm-drv.c
Date: Tue,  2 Jul 2024 15:57:22 -0600
Message-ID: <20240702215804.2201271-33-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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

---
 drivers/gpu/drm/drm_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 243cacb3575c..f511d40f577a 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -56,6 +56,9 @@ MODULE_LICENSE("GPL and additional rights");
 static DEFINE_SPINLOCK(drm_minor_lock);
 static struct idr drm_minors_idr;
 
+/* single ref for all clients ? */
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * If the drm core fails to init for whatever reason,
  * we should prevent any drivers from registering with it.
-- 
2.45.2

