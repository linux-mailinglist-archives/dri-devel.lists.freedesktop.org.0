Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7790AFADD0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 09:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2AE510E2E1;
	Mon,  7 Jul 2025 07:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="BHS6Nf2p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624B410E2E1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 07:57:35 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b34a71d9208so1736193a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 00:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1751875055; x=1752479855;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/MC/xohKHOcg+vnOOSNCEDTYlZuTz6zJxo6U8fkD0yY=;
 b=BHS6Nf2pFkZinbAs/5HJ+h4F7YWevOFLAs/owuc4sxbXmBOvkiVoo50Fl1/ef1KHfY
 VbeQymPvobXLaKug6leL7JaHUhfrpn/+IaYGaCquJjIQmZfUZsyke+oySj33McHQ4jQK
 fbSelnuw6TJzGu/5GnhGa634hcFKHtpUBejZKj7D22M0WWKeH/EEvSrZKQoTosrQIUxQ
 AcFprbKK0nhZXtx8LxA4G2PX6VGXioBLs7SANRG/NVXHFnRrUyZFIh0KpId6E9g2H9gC
 lkCqci1NBmZXA05Qk13Q8vE7NSiIxCOXwO62VkocKcsiVW2aBR+bvsG38rxb9VGDQt5O
 VW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751875055; x=1752479855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/MC/xohKHOcg+vnOOSNCEDTYlZuTz6zJxo6U8fkD0yY=;
 b=MixEzCnELQW58AkUceef1Qmz20W7E131bRyfcyBsJ0shWIfLISVUAYRlEk+3vV/+wL
 n7eDnq9upeJJHyiv2C391nCFQoxio6VzQLLkZ7pbQBTme4rNjwFS7IUO0TcBNqcInLJ+
 hbdeWqD415QIIbXy9jcw7DsW6etxntvb1vLBuwBhV3nsj8UNqx8SND089jvR69GEt8oD
 +EB+KzI+y3sYxkt8NfQC4QLlIw4bIa8YM4ewSrNWZ/B2t80tu6WKz+z0WS3qhRNzNacx
 HgstwQfjVqUf+gSWaDq0jkagH4TYqMspJE/rZ1ZESVFlFctBHo6gCgsm7JZ4AZV+TcCc
 70cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLANg6jVbOTZKZVvLcac/jxFkmrc7Wghb+/v11bchWp+briKAHuEitMFs2lST+2hP048YyyfV/76A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3MBkHkh17dwEN9AjZ/F1/RjXt6il0XafdKltkaGXQr1RamdYg
 T5Mt7Y2O/ZanPq2jf0KUXSkciDVg/oh00XzRnSUu4Fv0FeZvupeJo5falErxYfz3iWU=
X-Gm-Gg: ASbGncshdCIfuS/O+qs42Z2jpzC8bgEi8JcqQGcg+34U9KlxZ/OUnhhHDV4va1nOZOj
 FpBetEDw5BYoeWF/A9TE6XJxgCdPJfMKJ/nJpHttDs7FJe4sMVTqCFvvFwbnbLkOEfWXdaIY7DH
 roy7SsWOKxX/RobkKlY5QDpLT/0ufEzJjce/yL8UH6NGmsS6TGgPL8pRkT+vAPfMTdSiwb8P19t
 A7iPphI6rLsh9ccibyprKmbMyA+WUoqGIrMPB8d2/HRaDnBJOvAxtp67/oWeo+kE5sVnL8BoZpy
 MD05OhjqJ6+O5Yfrs11R9q35GR7GmN9PYSoCDYISEp7yYJrTlj18oK/9PwlGbBmMoHpWQFqkZqu
 19qoUPeoFelN9E46xzg==
X-Google-Smtp-Source: AGHT+IEG3rUVLj/sU9Sc3cCmT/rktoO/r9+WAKUWx4b+U8GR+jBcTNhe69ooHHcJV8ngN58Oe5tUvA==
X-Received: by 2002:a05:6a20:2583:b0:21f:54f0:3b84 with SMTP id
 adf61e73a8af0-2260b96873fmr18892440637.35.1751875054860; 
 Mon, 07 Jul 2025 00:57:34 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee62f8bdsm8246476a12.57.2025.07.07.00.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 00:57:34 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH 3/3] drm: docs: Remove completed task from drm TODO list
Date: Mon,  7 Jul 2025 01:56:58 -0600
Message-ID: <20250707075659.75810-4-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707075659.75810-1-me@brighamcampbell.com>
References: <20250707075659.75810-1-me@brighamcampbell.com>
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

Remove TODO item from drm documentation to transition away from using
mipi_dsi_*_write_seq() macros now that the work is complete.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
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
2.49.0

