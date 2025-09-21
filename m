Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86927B8E543
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 22:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4595710E15F;
	Sun, 21 Sep 2025 20:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HadGUeKv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2094910E004
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 18:40:27 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b553412a19bso793074a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758480026; x=1759084826; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3wLzqxcgnYwT4Poz7HHxN7qrlVYSiEgUKNZgrhHxkio=;
 b=HadGUeKvBik84sbQhhQNw08+JLjRl0QcwKifu9ieuWiyJhF4EG4hpXnlGlJoBOfEcK
 TVHii7zB/wB6vKRfaX4gOmEM+WwjovOCRib843OdmD31m6rKGLtbCxRNRRLPfq3wlSlD
 UoYe95kxqPGlKS1zIde22Sb9Cgqz9yxMlGoziIS0eVulc0pPi9x28S0p64+JgdBegA7C
 WckBHDzI1AEPN5+Eg5MJ8jkWBJUM1nELq/vNxXT4g1U+3C3U/4FlwLyb8xqKOIoYZjjd
 Zr0+rK50KzvV9/t7YVnNxGnCOeqdeBWKLgHbWdl3gKXk505UnxbZeJhmN9s0gOAono1D
 TEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758480026; x=1759084826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3wLzqxcgnYwT4Poz7HHxN7qrlVYSiEgUKNZgrhHxkio=;
 b=kTpePkuEaoXxWpJL3q4A+hrJdZOGdB8lU8HKqEzvdlNJf/e9JBUbe4j5q3BG0jW7TO
 L8t/72IcU5Qe2qYFeJVMb/YhPOpqratbpdCqJNxrRL5iaQK2Mhj5HGOpeb99XQutSINH
 JlddGPOkobld6FvFOgdkFKU9T3zIES9cONZE4dxAklKvMrboTwfX3UqhJ3Ft7rdIQULO
 uNGS2ctYNdl2PDvixDdFqzKaq/QEwVyejuGuvBFR/QyirJ5axEyn6SzYvOrJIE9nFNeW
 9mzsUrRD3c9QI94+cjSIqJ91TLP8eGau/gCPnvQeCTCgFVkj5qgBAkOprCNqNLXsT0kl
 zLBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDr82XQOdY9PsVPETc1wk2/hKviBALNqQdOE78HBPZwqriHnHARgLQb2VGtzOLnfLRqyYvbApy9hc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjGj4T8nCX3BXcAg9nbPk6vgXhhQZ3rbFuc5nOLCU6cN8fFYUp
 CzJDfoQO3E7Ufd8f+/II+8nxpeVkKuKLQUr1LXPXUHcffZj5JLSh/9iF
X-Gm-Gg: ASbGncvA26hDE0vIpW/eMYO5/r0g84pzEVcpd2EuS5P8u2zGDiijNkUgp2tN++OAhr5
 3A/vYXozVqNAn22AozoJWyw6DBE1UuDSF4kOsoKQWD1WMEYJxJRf9zWHjNYkgczhe7/62WzGgqq
 2dViQ1nsT5cSDYFsuHybCr2T+j/Cfr2URthDC7vVgVnEQV8U/nm17mQlKsQeOUjrNUsrSuf0Uby
 m1RK+9TSrgRz66FAjlvEjt79HdNwI7GZdZjS5cz836OhjPzZp53/pFFTQV/HJitRjbWUHRYssAg
 lEItGDhP8L0LsEHpEAJC30BFQvtiHmjwOCK+c1flI47Elkq21HV9pkZJwB16cpvCGc2wfUAG7/5
 9SIKQCj4U4moWbBC24MxNiImGQiEe
X-Google-Smtp-Source: AGHT+IEtWuYCyhgsDqIGrs0SVKnauGGAW7P33Isy0rJGQr/jYIj+u9i1Vy91MNpDnJyerCFmD/lfjA==
X-Received: by 2002:a17:902:f612:b0:276:305b:14a7 with SMTP id
 d9443c01a7336-276305b1691mr23964445ad.33.1758480026625; 
 Sun, 21 Sep 2025 11:40:26 -0700 (PDT)
Received: from fedora ([45.116.149.13]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269802dfcbesm111053795ad.88.2025.09.21.11.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 11:40:26 -0700 (PDT)
From: rtapadia730@gmail.com
To: neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jessica.zhang@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, corbet@lwn.net,
 Rajeev Tapadia <rtapadia730@gmail.com>
Subject: [PATCH 4/4] drm/todo: remove todo entry for deprecated
 mipi_dsi_*_write_seq()
Date: Mon, 22 Sep 2025 00:07:24 +0530
Message-ID: <20250921183720.237761-8-rtapadia730@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921183720.237761-2-rtapadia730@gmail.com>
References: <20250921183720.237761-2-rtapadia730@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 21 Sep 2025 20:27:20 +0000
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

From: Rajeev Tapadia <rtapadia730@gmail.com>

The todo entry about transitioning from mipi_dsi_*_write_seq() is
completed.

Signed-off-by: Rajeev Tapadia <rtapadia730@gmail.com>
---
 Documentation/gpu/todo.rst | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index be8637da3fe9..76afb8a784e3 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -497,24 +497,6 @@ Contact: Douglas Anderson <dianders@chromium.org>
 
 Level: Intermediate
 
-Transition away from using mipi_dsi_*_write_seq()
--------------------------------------------------
-
-The macros mipi_dsi_generic_write_seq() and mipi_dsi_dcs_write_seq() are
-non-intuitive because, if there are errors, they return out of the *caller's*
-function. We should move all callers to use mipi_dsi_generic_write_seq_multi()
-and mipi_dsi_dcs_write_seq_multi() macros instead.
-
-Once all callers are transitioned, the macros and the functions that they call,
-mipi_dsi_generic_write_chatty() and mipi_dsi_dcs_write_buffer_chatty(), can
-probably be removed. Alternatively, if people feel like the _multi() variants
-are overkill for some use cases, we could keep the mipi_dsi_*_write_seq()
-variants but change them not to return out of the caller.
-
-Contact: Douglas Anderson <dianders@chromium.org>
-
-Level: Starter
-
 Remove devm_drm_put_bridge()
 ----------------------------
 
-- 
2.51.0

