Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7E6B085A3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 08:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07CF10E703;
	Thu, 17 Jul 2025 06:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="SbfnN39U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B6510E6EF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 06:58:17 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-748fe69a7baso639657b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 23:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1752735497; x=1753340297;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5D4Zj64qlLFOiqXv/wSX0OcGR87OOiTqr+HfIllhQOk=;
 b=SbfnN39U0sR2EGnz6CBybAragPOamWAosEATkdWvexNV1H93oqehYwt8KwajU0Sjc4
 NE2kKgkexGu3bqPKZq5iShWQ28jGNFGAX33SQB+3Ru/IjM3/d0Z7+qEJHZaKR//dZKM9
 QyL17yVYsOpCZvFLYOvNVP9MfWv46br62mRef6+/hE2LEw7MbfpVRE2S3aBuHeM76e7+
 3I1+YzRTpB22aP4g5RPoYQ6AjD2iuCYghhU8HZwYqrxB7hTZCWqrDm5FpZIOp+lomvk2
 3abuUsj3YryJaA+PsawEBREJyvv0B0fLiI3VUXXuk5gjI4S9YFNvdG0inucOvf+Xg6XR
 D/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752735497; x=1753340297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5D4Zj64qlLFOiqXv/wSX0OcGR87OOiTqr+HfIllhQOk=;
 b=KfxaKh7xd2zlRN2hScaOW3YiJOUd/zCrXW41apcFUBxzKbBp9cmFki7lsDRgY48XSU
 5W8Cb//VVAOf0tUgYhp3F7jcYYQOxEbKeFdd0GVlz32MSfRPNZ53ith5BRDuiC1tryPT
 qa0MqAua78b37U72ht/zMyAqVml1BEaDfNMM8pSSi15fVtiiljAUv9o6WaVTK+mkM/T+
 u0Hi31GlPZmWUtPQakaKVkIuvK7le3yU3fHtSs9t89Zn6EnlZbu4uatPNh6/zl8NaZxq
 U3Cbe0M7ygIgLygzzzPv768p3bx6nfOxPCreoIC9UcJS+EPFlYqMvKnm4mS9tyrA7pxr
 jmmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz24XzJLJCxk9toRF9ypMEnm3/TRJjiQFZZvPpCYCBlcQhsEkfUWy0I16EbmAuEU3qCBXXDQSKNho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhLNFoHNy5YC9Ojz2KZRFP6Xevl41uPnKDT0y8nnT3EK/Ekl0w
 62kxc2gdkn1DLF5LRriXK2yJEcpLlBsAZVBizsw/lLPocHT/R7U1s4wPcDlQ4FP0S6z8KwbFDI5
 f4X6f1vb2yg==
X-Gm-Gg: ASbGncs3HkBCn1YVdEwS//ih481avCywvniM5oLeT2NVV7tK5X5tRGLavOwHi12/60Q
 5cQxr+PF2RSMXVCMflXEdlD4K3bGE5cRIz9bNJLFNlsvqWiI+8pMMH9nAcbba9KgVO9fp0k8sMy
 IthrJQ+w8JT+iUoW+VB16Jlt8aqexZ2R6Ixh8pwaVe9QKRC0VSJAo0yHspx8rUWX3MBx24KuRgM
 YGj1RBIXaLFdyU9bMSN1IwDuhzTYhCv9BbkDNt3pHAoUfieWeo5surZ+sdTpApXIufiFTMF6BJk
 p+sAmZ25L+WvxTNEOxGtlq+dYg5r1IVjLiDn+wGlnqODH5r5lt9sr0AjMibv2BR0n3xyMZFIhRr
 wqSgKQuwYs7QfpibqfKdQVy8GgalaLL2PQWaVOJKPN9KYSzoMKcRM7A==
X-Google-Smtp-Source: AGHT+IF4uL0UE6/IVMLL8a5IBc0w9BS0oX81DCNFSPt471frTtvJ5jahdDuVoKlFV7+0mFnbfKekmA==
X-Received: by 2002:a05:6a20:6a10:b0:203:bb65:995a with SMTP id
 adf61e73a8af0-2390dc51b64mr2966437637.30.1752735496874; 
 Wed, 16 Jul 2025 23:58:16 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f4bc51sm15157293b3a.116.2025.07.16.23.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 23:58:16 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com,
 diogo.ivo@tecnico.ulisboa.pt, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 4/4] drm: docs: Update task from drm TODO list
Date: Thu, 17 Jul 2025 00:57:56 -0600
Message-ID: <20250717065757.246122-5-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250717065757.246122-1-me@brighamcampbell.com>
References: <20250717065757.246122-1-me@brighamcampbell.com>
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
2.49.0

