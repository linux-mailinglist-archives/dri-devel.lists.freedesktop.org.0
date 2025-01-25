Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C534AA1C19F
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC6810EA87;
	Sat, 25 Jan 2025 06:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kd8M6YcM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EB910EA84;
 Sat, 25 Jan 2025 06:47:30 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3cfc8772469so5194895ab.3; 
 Fri, 24 Jan 2025 22:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787650; x=1738392450; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jU6LwNcJf+1qCGpisTck4NmcFzAnLgO+JmsbcvhTW5Y=;
 b=kd8M6YcMVaNJHwc7QtJvrui47QkqKBZXq131adbNmFRPKCYAGrwDvA6WJB6wPlL8eW
 fIEO8y4hZ21KPNePq5Q4f5A4Ro4vQRx7WI6UnSlKdUjCRl5MxMr0C3jb9ZaTcyZVrw4l
 LrnSFZVmaF/oE1wUWqSaSiOYXooe7eRiQQ1G9iFtn/TuiDFnwKZ88bl2BrQHPNMW8vj+
 rkQenuzGzpXwdQ1MX3bcm81s1XCY+J5WVFGemPG8iwMkIlbRw3uY/jppwZJBHXDDtyaQ
 YcgcYyr365cATrp3RSaBhpj5mnbpsvXQyIsvCRrLad0rJ4pmtiZUcanmzOCEum/OAkZ4
 XN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787650; x=1738392450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jU6LwNcJf+1qCGpisTck4NmcFzAnLgO+JmsbcvhTW5Y=;
 b=NUwqW35eL+2qBX3QSLoJTbi8TDLhomvoUTDmsIZgYKh5Rn30/7uGZnNRLr2byI5dDz
 0UztpViT4CABFPDEbmOKJumnv21ek+uj4fJJgQa/Il5Nv2jqN+Ya4s3VU3cs+hFdsORk
 2GRk1YMzgsnJWyEaXFeSqsdLOljcE6EkF4H1TeTrNQOdqkeYeNCuMIneqIDG3vCbScx+
 HspA7/HTDeO44N839vJrkQDEa/HdvJqfzsayXbLSgYo4mtTRCJkW3k+1b5cFcvGnS+P7
 63kaQw3a8pLK+D7zcQSzxBBHddhwyH7fGNrB+ef4/RITgOS2N2qBCwqU8G21kNJS8IU2
 73Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx6vE3XkcvbgZAunemYS/rD2p5iWn8fP/L+jgA7tA6HV4mrn0P+vxM23G7SIeXRE3xL5KuQNDzI5gGDECabQ==@lists.freedesktop.org,
 AJvYcCVOOaiqQnVeB5MmKF1qxR4k4GoRFJGxVBpKOHkj2e+MI6/q6kFFyjpK/QtdKzyMdZsrhAsjpmt/@lists.freedesktop.org,
 AJvYcCXHPWMqRX4UQtqTso6VEkSeeGUgYdhs0y6x+DppnO01GApYp5q9KsKmTkjy+39g1KmcJlWxv5ZGdZn/@lists.freedesktop.org,
 AJvYcCXrp08knF9ohrXJgl4yqhS5uZ/wESkgn/NkIBukSD5R2j2UkkLmVL9J7fgHvXD4i6XEA67ncMlAWWkj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxI5ISksyC/2QoDGrZGU+vJgmHKmm8BCQmlBVrir6dtfkiKw8I6
 DxvFUT+xPcDEGNWihhITkhH+4XV3EnSJH/jZQH5Wk2sUxukLggzfB7rQjQ==
X-Gm-Gg: ASbGnct8iYzZAJXJngpQ09HI3jLSW0Rc7lO9ooSOhq9U/5FcSaDIqQJ6lc1cSZ8i0PN
 RkXN1dsB52gfX0YIQgKKW37d/mg+y3l67qybXvKgooa/JgyQDoaS5ALGXL5j97/hecSlv6MUncM
 QkBztzAhy3KDhTzCSKt9JZDP22n+6RYArI2n1GTjz7ou+yJ8jCtdS6TvV6uGpfi5JtYIHbR2ggc
 bTLDpIJIxaKiNXMzNFiiGnIzshnZToFjqJU9a+5vj0Z7yh69kTrLJn/lGisZuWM8fffRggi3JDw
 +dhFrjqLuFnb64xwS7HeQWIxztKItzg6Ka2IQQ==
X-Google-Smtp-Source: AGHT+IHa2Qexgyp2+jWWz3OzYTEauOKi/oF88Wv+H5AMShMh8gmnOOv/yeYeTqHTM89uZp3AjCMbVA==
X-Received: by 2002:a05:6e02:2383:b0:3a7:be5e:e22d with SMTP id
 e9e14a558f8ab-3cf743c99c4mr293832725ab.2.1737787650054; 
 Fri, 24 Jan 2025 22:47:30 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:29 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 49/63] drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
Date: Fri, 24 Jan 2025 23:46:03 -0700
Message-ID: <20250125064619.8305-50-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

Invoke DRM_CLASSMAP_USE from xe_drm_client.c.  When built with
CONFIG_DRM_USE_DYNAMIC_DEBUG=y, this tells dydnbg that Xe uses
has drm.debug calls.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 22f0f1a6dfd5..6d36c2ae4f93 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -21,6 +21,8 @@
 #include "xe_pm.h"
 #include "xe_trace.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /**
  * DOC: DRM Client usage stats
  *
-- 
2.48.1

