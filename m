Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C525A81AB1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 03:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11D410E7BB;
	Wed,  9 Apr 2025 01:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2A310E040
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 01:46:48 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-736c3e7b390so5890152b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 18:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744163207; x=1744768007;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bLtGuwiraT4GJp3N+SDFtn5CnWkUJWXme9NNEqj3IEA=;
 b=oB2Fd/i2BlW1eBS00hIjEMa0ombi3nVRY0D9a48YBNTlkGCtRyxW5qv9RXkDbbGJdy
 pk85ibAEEB2KrAPZNziy/a7TbGkl780NiEBShz4StsYnHXPZYQba6e5ekMPAH12wLoNk
 vaFcUA9rJiZuNqPxLxifzfLaxLW/RzzT+lk5dmL0j0CxCBkv9q62djOt7E8DAA1Q/qNZ
 TG9ABQB7J+ujg6CVsmvAj+LInHt1m6mlCskntezKqmXDeEb+UCzOJlRX28ZwREblLdM5
 DqPcvMSiJi+BuD2bSAQs0zJeHkTnjD5nRpKGzbA5Zb5MiQ2npwfY9Z6iSwv8i7xcOz1s
 4Xug==
X-Gm-Message-State: AOJu0YyoPpaKO7I010A+IGeVinbVx24GTcT16DDke9CLo143uMb+JZJD
 ZdfdVCOKP7zvs/Ul/5uG1GXOmeI7vub5Jv/VIF2p7QeVwAPbkt00
X-Gm-Gg: ASbGnctK75Mh+xU21WEQFUUSpc3vkO90Z35Fvq3n1S4CLjgksy/T3AXtHMXAE5kxDLz
 C0bAcaH+Dy8CDYTD8VSDzEIuvt8NKrHwJGYowJlTLkgpIjfhHzwWQVxjjLfEe7yiMG+ng+0RolN
 elAC7IWPxkcKJN9XfxfHPvwMEypdnR7/1pS6Jnjy/suv9jdCRytZUUN/7C4/XSGeqBsjt0qYV0C
 sOfoBS9k7/VtDHUm/eEJZbpxleAYsyBt1HGSON6Rp+LYk1kKMHEH+a7yD9jV6K+j6J/FDAirRzH
 nKpliZdL6xJhUgROTgkA+qhT1u9JFahjryr+SILTTmCkRuFFizGL71rQ+eX8
X-Google-Smtp-Source: AGHT+IFFPzsV9RDMpQcjIusJFdTCbtLRmNV4HteldcsbH7jmzqsUrR/t8F1VZCtOvzPi4nOhwN9xfQ==
X-Received: by 2002:a05:6a20:ce47:b0:1f5:7ba7:69d7 with SMTP id
 adf61e73a8af0-201591555f0mr1552429637.3.1744163207613; 
 Tue, 08 Apr 2025 18:46:47 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.169])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b02a11d3b43sm104635a12.39.2025.04.08.18.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 18:46:47 -0700 (PDT)
From: jiangfeng@kylinos.cn
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, andrealmeid@igalia.com, christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Feng Jiang <jiangfeng@kylinos.cn>
Subject: [PATCH v3] drm: Fix potential overflow issue in event_string array
Date: Wed,  9 Apr 2025 09:46:33 +0800
Message-Id: <20250409014633.31303-1-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

From: Feng Jiang <jiangfeng@kylinos.cn>

When calling scnprintf() to append recovery method to event_string,
the second argument should be `sizeof(event_string) - len`, otherwise
there is a potential overflow problem.

Fixes: b7cf9f4ac1b8 ("drm: Introduce device wedged event")
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
v3:
- update the subject

v2:
- update commit message
- keep scnprintf() as a single line
---
 drivers/gpu/drm/drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 17fc5dc708f4..60e5ac179c15 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -549,7 +549,7 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
 		if (drm_WARN_ONCE(dev, !recovery, "invalid recovery method %u\n", opt))
 			break;
 
-		len += scnprintf(event_string + len, sizeof(event_string), "%s,", recovery);
+		len += scnprintf(event_string + len, sizeof(event_string) - len, "%s,", recovery);
 	}
 
 	if (recovery)
-- 
2.25.1

