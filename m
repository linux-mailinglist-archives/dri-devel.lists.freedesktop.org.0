Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0848DB19223
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CDD10E4D4;
	Sun,  3 Aug 2025 03:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eJJ7/PCn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FBD10E4CC;
 Sun,  3 Aug 2025 03:59:44 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-87c79b55898so43526739f.2; 
 Sat, 02 Aug 2025 20:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193584; x=1754798384; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xsd/qFJRqh5DgAbSh3xpznnIfN6HELFfqd9qkYYMxBk=;
 b=eJJ7/PCnR6r87C/kq2s+NUnoevEdqhj99Aw5qY+vOO8/tZOluRMmKVgJIvRtB87vSy
 qd8HL4r+IYqJFuzKMvis58TkyTQfhVLUtZUh8xJXPMRo0tM4/x8rt6igfyVRYsqHarV7
 7bTiPjT0zS1rvJDSU9LGoisO6bVIq4g1qOCuZ+gAkHsrNFP1VaqalivyTWVhDB2P3P46
 GbfHpVZ+tnOQvQurA5d2+Lq5UkKMcGhEwfdPbu6WHwd3+3Fn7mHvX2r4CSr9BiIssBlb
 2AoFHP3p4zQasAoZ0LQo44xTl4UbePQyr0uGoWMCwiq9AuIQVtQ4iuqOmdhjr2xoN0+L
 Dj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193584; x=1754798384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xsd/qFJRqh5DgAbSh3xpznnIfN6HELFfqd9qkYYMxBk=;
 b=jrSIGbCFsKqaWZ6sI5giVbkW0Warf+rX82asV/3416zGg1p9bUeJSGh3K/SnC70j5l
 GJtYCVLdfTzVSxhhV/2P+2ERdTVCHX5mgyJebgapPikZb8uEXkrMTK+nSy+j2wWJpUnu
 RupyKx0yWuzaqnL+x2vIRuYpANPB5/ZhgNm2ODZfj/iBRFHGYAMt68SsJ5YX0XSEFp19
 UdciIGTSQM2lTFmTXQg9bD+CeZgHiFHJRJIyqejIEhLOhwUhLGVcq0uoHOT5p6CrFzuF
 DPwMUPw+sXQcc/hVj18trb6OpTpQChdbdcENGUUrx6+1rUnNVZz2C0JRKtRTeRN1hCrc
 Q1UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOsTnT3TaJwwWnMSmkoEJwxgC30MJ/Nxgn8X/KFXabjMZ8iiNAj6Vpb1bXig7bnWDBsMSlWw2W@lists.freedesktop.org,
 AJvYcCV5GSY2PGyDVuOH8HiZWUOeYm/GJ/J7VHBpj3iZ5O3G1eW/Q55HfEgQgkUQ7h4kHdrCsUmF8ec9JXXs@lists.freedesktop.org,
 AJvYcCW+c38DWsr9a4/4wDAsJYFFup6HJv0D1ZWkqsy3Q/YGgbeAyZiCfmlIMyN+Ven4mhSLXabulm+KIMu8f/B9sQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBSht/IUdvU5nmGEdOI6EW3i4Q+tlfvCZ6fRLW2IwbHxmR7P34
 092XIi273gYW+D7H0NhBQR+6UdYw/JgyQ08nPFBVUmOglkiPG0E97d18
X-Gm-Gg: ASbGncsAqrWJAom53Y6ZJPoexdJI1AZs6NUryXa9WYwOGpY4Me8m76DqEFUGy1gaj0/
 XMsYVd2I5vX5giaYfd+V+i46n0UWQppTfrK7XCFq8yJJ0uTS/aXSDY50v8McDBNA/U7/gQxwKm4
 EGAPY5y9pm9qVvIFXvdnsFJNGXYK1d5G+JW2qV1ajx67PT2VBkG0oqzhmsqTxnFHamlqb0Hsxha
 oJMMP9jSEMYuyUlQHojP72DFLTQHniJsgWsxrQ2zpX5/xobvhLJt0ami+6WEuVUzQHhFY6gYyey
 SqxBmsu9xeTwXvUZ9/e2tJznm0ByzzmKLN0h8nwoqEqKNob6BNCc2FWUtFmzoaVrcc+Y0q9qky1
 wMd+rUJ4uAOe+6awYNcnyllrH5vdeHi7u36IiUfti3DjhLziZQYJFl+40XYK44DgE4F7EQPK6RN
 860Q==
X-Google-Smtp-Source: AGHT+IF5gmZRxVoJe/ZrtZudgNIc0O6RXiQi/MncQOQVxzlu4r2b5IK1NE9kZPr2rom2pyyvDkmK3A==
X-Received: by 2002:a05:6602:2cd5:b0:87e:7359:133d with SMTP id
 ca18e2360f4ac-88168353137mr921122239f.8.1754193583881; 
 Sat, 02 Aug 2025 20:59:43 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 48/58] drm-dyndbg: add DRM_CLASSMAP_USE to radeon
Date: Sat,  2 Aug 2025 21:58:06 -0600
Message-ID: <20250803035816.603405-49-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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

radeon has some DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg about its use of
the class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 267f082bc430a..6eaac728e9665 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -253,6 +253,8 @@ static const struct pci_device_id pciidlist[] = {
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static const struct drm_driver kms_driver;
 
 static int radeon_pci_probe(struct pci_dev *pdev,
-- 
2.50.1

