Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0B8B0AEA7
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 10:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7907810E1EB;
	Sat, 19 Jul 2025 08:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="GNc65ZYw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B124510E1E6
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 08:27:10 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-74801bc6dc5so2954997b3a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 01:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1752913630; x=1753518430;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4rHylqCjx1w2oDPs7/xM2Riq8NSJ9PhhkdUN4+cutX8=;
 b=GNc65ZYwklgBCfT5MQtXohaDtYtbUUDaLAZU+MGInDlg+laJVG0ln0k7C3zyMyaMmP
 Ep4WnVzzQem8jQpVj+RkTXj9aZkuioWWR2DF6U4dUewKuZfEgQ+Fwtxm+ZzliqfSIbFo
 d3EFKOJCwFg+JYxTiOxrwbOC0/WyTi9GRRbWpuu5AW2v4Bh6eUuem5ZJDdRUdXKCqoiK
 ea52dW51rvP22If16ifSWBjNBYfFMd01DZCi45RM4KvMYRi0bjd1VrTO7MC1+8yXlUf0
 tbmdsKXQgs9MbkJ9hJCs6+rouwFRhX6gxDFcZZ3rsF55rUEegSsL08fOGObeCJhwCo3D
 4RaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752913630; x=1753518430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4rHylqCjx1w2oDPs7/xM2Riq8NSJ9PhhkdUN4+cutX8=;
 b=BvRL3OiAbugux4p2sb6CP/XE3UWK3/Yr26plPS0/M5jby00i90go1HgyfOqPDIcRw8
 0KboBu6bjHuZLSJKHHyAcC0XsmhOIfwpP69p5NCaeW4BtHpM5E1qI9+vjCN+oc4llGwX
 GNmK+DVaOjFRTbtQlkz0bwYX6VP8EQ9Rb/Lwj74VJeXe+u+9qkRaRxG+qpm/lp7hNFQC
 IK+k1PSk4jmb/j5goZMz6iVHVv3CFA+7pDxgfv7rf0ojYoY3ey++fM4YP+7VIQV9T4yq
 aG9wpMY64gyQBWS1Fsy++9VtMi7PeZhOtQDaGDSvAbBOL/ApFGiqJOnLLcszNAXA006b
 KvKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCKnzJsOIsQNjY81iPcpgtTgNbr9z6jsOIVvjo56g926hWlS1XJqhv1yhKDrv5gJ0Xw5cpCRDdc+w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0F51L1NHwwC1B1vc8TTT7EOcZmpU2EEvXjp8xGkAlToTyK9g4
 1y09UFOEgmKN47SqfyNtTLuiyr0aM7ahE9VZy5owizYc+I8MzneLIyY6E43SLPAs/fo=
X-Gm-Gg: ASbGncsedqPrkKe3KwyqyZWLEdEbgm/nhaf7tmrEaWkA/5Jpxl05tJPxfutlMjI1xN5
 cGH9YWnSt4eQSaXISHtJ1OJBBo/79ClhJ/rA2004kmxSthHI0WJpW3/rVvClL4a2SKBLrcYnVQp
 NWad3LJPxbdTs2xKmvfe6Yr3eXcGk9StQzAaO7zeTB4GVg/Esc8QfMNWqt4f3Wrlho4ZPntKQy0
 T7ev9Ui5EO3rdwzbG6aXJLGZ2EpXV48t7L15QdvhgcR7pdUQJFbNOXu+r6TLdGbymysrAPDBrMk
 gpAn9TsO78W8eaNqH1hKnKAJsgIFa8UswX5DpviZ66L2tP7N4CWk+1a9N7a7bvv2sy+YuJaDmAx
 51ZNAVkJ7Kec0BB6/E3Av40q5BPuJHm6ePdE90+ZFuEsB2D70/Q==
X-Google-Smtp-Source: AGHT+IGatphEHSAKw7z/xW0LGtlPVyO0W6ZIkOclORHs8NjYT1LzsjnDPk9buZ2iABOLqZ0brWLSNw==
X-Received: by 2002:a05:6a00:4c93:b0:736:5969:2b6f with SMTP id
 d2e1a72fcca58-75837586b17mr13305132b3a.6.1752913630098; 
 Sat, 19 Jul 2025 01:27:10 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb157635sm2475260b3a.83.2025.07.19.01.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 01:27:09 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com,
 diogo.ivo@tecnico.ulisboa.pt, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v5 4/4] drm: docs: Update task from drm TODO list
Date: Sat, 19 Jul 2025 02:26:38 -0600
Message-ID: <20250719082639.307545-5-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250719082639.307545-1-me@brighamcampbell.com>
References: <20250719082639.307545-1-me@brighamcampbell.com>
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

Update TODO item from drm documentation to contain more applicable
information regarding the removal of deprecated MIPI DSI functions and
no longer reference functions which have already been removed from the
kernel.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 Documentation/gpu/todo.rst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index be8637da3fe9..92db80793bba 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -497,19 +497,19 @@ Contact: Douglas Anderson <dianders@chromium.org>
 
 Level: Intermediate
 
-Transition away from using mipi_dsi_*_write_seq()
--------------------------------------------------
+Transition away from using deprecated MIPI DSI functions
+--------------------------------------------------------
 
-The macros mipi_dsi_generic_write_seq() and mipi_dsi_dcs_write_seq() are
-non-intuitive because, if there are errors, they return out of the *caller's*
-function. We should move all callers to use mipi_dsi_generic_write_seq_multi()
-and mipi_dsi_dcs_write_seq_multi() macros instead.
+There are many functions defined in ``drm_mipi_dsi.c`` which have been
+deprecated. Each deprecated function was deprecated in favor of its `multi`
+variant (e.g. `mipi_dsi_generic_write()` and `mipi_dsi_generic_write_multi()`).
+The `multi` variant of a function includes improved error handling and logic
+which makes it more convenient to make several calls in a row, as most MIPI
+drivers do.
 
-Once all callers are transitioned, the macros and the functions that they call,
-mipi_dsi_generic_write_chatty() and mipi_dsi_dcs_write_buffer_chatty(), can
-probably be removed. Alternatively, if people feel like the _multi() variants
-are overkill for some use cases, we could keep the mipi_dsi_*_write_seq()
-variants but change them not to return out of the caller.
+Drivers should be updated to use undeprecated functions. Once all usages of the
+deprecated MIPI DSI functions have been removed, their definitions may be
+removed from ``drm_mipi_dsi.c``.
 
 Contact: Douglas Anderson <dianders@chromium.org>
 
-- 
2.50.1

