Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856B8A7945B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099EC10E8A6;
	Wed,  2 Apr 2025 17:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OZ2jxgMl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100DE10E8AD;
 Wed,  2 Apr 2025 17:42:59 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3d43c972616so332285ab.0; 
 Wed, 02 Apr 2025 10:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615778; x=1744220578; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tgy450ZES2ez3J/XkWzr8/KGFStO5bXfg+gAZCZdzzk=;
 b=OZ2jxgMlwhtH+mfEESynlS+ELb613wLNpX4gHmYQXMzoSOs/BqQPPINLwTDJme5zX9
 +jB+RrecSo/Tjf8WHsT2mFMKcxkpTi1x+S6e/e9xzgk7QBtw3rH8xmU+VAqTVj8a9jk/
 +nVQz16pldq+jPqCW+MtokpZm6C9h3jqm/MzO4vawCWgXz9UtOBVCcVa/Y34CrHRvWWJ
 I/hchmOeEW+ex/fa7yeclY30V8juFlBqWeN8MrqRM48ausbapg3J3z7vUBeY0i/xFzAQ
 lCCd1XO4Bi/AFYvUZYYZ/19z/VqyokjVb+lBd6+NgfOIm9Mz4kOHw04OgDF6wEWSgwdO
 ky1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615778; x=1744220578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tgy450ZES2ez3J/XkWzr8/KGFStO5bXfg+gAZCZdzzk=;
 b=EJ7Z21TO/MOERhQLlvbM/Suus2q9XDzro1+Rvn6UhGuEflaxNSaqNNy7g5NWQS/gIz
 Q6+/SbxMe5RfB9fYnkhnNjQJtYxuVusek8T0jy7+p+k6KAgANW4x13vOBndGFmYhHPRl
 K7gd4Bs+E1mS8vCVKGmY0tbL17lrzmbwdVylvjT7ZFd1ckNm+3ErPlZIx8qxa+wLZBHT
 BC5NvRc8ddihWItxOFLZtcOHj8BEdu2NWiIiiQOPCByn2TO8hO6HkBEUQKwEy0tr1FmN
 XMiHpUWc6Cus61kdlzKHu3qFYN4j2TLgxTOIVHUlz6w0wQyfSr3QEbC7pAaLrppiXIKP
 kzBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNZJEExFPzgE+7yL9Bs64ZCI3QCK/NWSAroL0iVRL7MWSrjwhKFlJaSZhmv9TO8xwNMlcyvb86h9Tq@lists.freedesktop.org,
 AJvYcCWVyEGrUSzda97GGDYdscekrJMP1YTSv3Gqw5kHgHQZUx43tEU6Fjrf+E5C4MXG3seRFkkXKOZS@lists.freedesktop.org,
 AJvYcCX++gjBWgsp9dDz8r2d726FzXmEQ3y4Mx2BqDxXxg9+hYDAIuU3riWh7vzlpQyvkWMTJsoAI3X+kN+54Trv/A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZ6l16x6CLBi8JtQettudnCDFDsL/iluTE6rYq9zotsiBJRp3Y
 HepIaDOkzeqLIQ+8qrQf9VebsOdEAuXqfh89U6QzVpBpliN3Dd3u
X-Gm-Gg: ASbGncvH37qdepvV/oXYoe8BxAr6KUyBuNB/sggHJyX1l8h+8eWAFr6nUpqHTuEl+6N
 kW1CGKf3d5lcS75vstcMVLjQ/jqBQJsQvhX1D8T49EKRCAQRzIum54p83M+mngDFreSR81lX9gJ
 Cq20mR7CvEScgGg5JU/dGmUvdBtYt/hszQLO54oiJrpWzmOCyLvMdkqvAUXlKpVlNh4rY469dpQ
 aVESFJDp+mYsFLzglCpxx5P4jxtjutEKUWekC6J3ugef96ms4xa5Q2A9eQdRdxUSgr4Dr3xTUej
 qyz8EMP3bHUKWIT/RtfYr+a6jXYvFGMj3ptUD1uJO34hw7G5sozVWt52mdgvtTzMyxC4p2NUA6i
 q4A==
X-Google-Smtp-Source: AGHT+IGOn5uIZhYGkruQeCbC1f+WjkFMEGOf33zX/XAEqkxeDsXMZ4VsYrJ+aFa+RIq7clpGvTTA5w==
X-Received: by 2002:a05:6e02:1d9d:b0:3d4:2acc:81fa with SMTP id
 e9e14a558f8ab-3d6dcb49685mr7363055ab.2.1743615778123; 
 Wed, 02 Apr 2025 10:42:58 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:57 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 45/54] drm-dyndbg: add DRM_CLASSMAP_USE to radeon
Date: Wed,  2 Apr 2025 11:41:47 -0600
Message-ID: <20250402174156.1246171-46-jim.cromie@gmail.com>
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

radeon has some DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg about its use of
the class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 267f082bc430..6eaac728e966 100644
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
2.49.0

