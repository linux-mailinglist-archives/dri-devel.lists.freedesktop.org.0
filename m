Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24549AFC444
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 09:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A62310E5AB;
	Tue,  8 Jul 2025 07:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="VnyipZUf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842B210E5AB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 07:39:13 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-73972a54919so3537470b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 00:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1751960353; x=1752565153;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oRg4Q6pPPZIs4EHGk7HynlZtava7RS7MLv1CsBp8mUo=;
 b=VnyipZUfv4MybPW2Kjqd4I7mdBM5+VUN5Up9w6y3QgxQX1mGWWYFhOnMM4qmJLwLgs
 JAHJDlvUQlFGdy8SOTxhx0j+daMgRjCHdaZT6YmsXmIhCwQ8s45ouW2/c15sHWntZH7s
 O/Ia/xmFaKxxUvy+/2uOvxJHoAyaSR3l/MFQJsQ9jIl9MS0GgwY6w3OJE+7O9RoQ0G4x
 8oaYkb2Ar1WPtVYZRJIYaC+WTO5FtvREuXlSJapqZUcVpw6MLHVsf2XhaVSCegRkq9F0
 sGrgs9FVGoQWsHZQqEJayojsQJ9GUzDQ3RD4rTtx9Mthmx8k19e8hBCQQB3kbfHr0z8o
 Tbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751960353; x=1752565153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oRg4Q6pPPZIs4EHGk7HynlZtava7RS7MLv1CsBp8mUo=;
 b=S0+NtIUg+ukqN2bXIXCbybrJKWjHdjIb0cnWXPBPM4N4QkMZ8mlCU2PB5937rQdjEG
 LjTFGR0Deq8I/54UYZSOgaU3QJfuD1LJ/9YiGvAxwehk05grVPfDIDLzHzr2bZswCBnl
 0bSdBui37C1ezWJLtKSHhGj+Ey1l//Co750siQQUpXQgVd15a9plaNBn/quu2GuCl3z7
 MQpu6uKs8OZR4M+MBXYVW/QGU2+xnfGhv0f9XDMsVMuW88xnbnCxQUC/8MTZhq6gsqhl
 qQKzDLX1Mns/X9oNTdsbstNwvQ4AztkEB5dpdOzx7oR0MxwRPLEphw1xVUPYEkZ8haQg
 oEIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpZsm7Al+j+iHxRvX+4GAuCIm25z1xJEQGAkU64UUjidGWvqYo1fAH4TLZRLhROuy+10UYLLSs9LM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyo4RY/YyDBLHtZ7lP/cm0py14faSv33OpY8bB7Hc4Xk/HlQLkN
 buRNe095LEYP1BKflx36LIml6emF1BX+7PLfU49VXScLPBr68+KwYWvrtI/9aOcGiSo=
X-Gm-Gg: ASbGncsh5u5/Yq8CRrUVzTmL+/vMuUs6AJkT7kIffqjHjreAkQD6pk28N7E+60Aqe/N
 KvL4QQFS8aaMdXZlcZyYcyOZ1Hk0VXeAzQ0JawbEccwctDTnU+SldD5TXmgBWQ+pIkUeTX/FOUo
 2sgDgATOgZpaiTI6E/NuHyHoRh/njyPnAjeCNIPw05nxWiFqTYEaQRz92qhA7ba1+oRgX2oYTVV
 5REtZEMH39JOp4GTk2+nQrfKNlaRAjoOu9XI033ABt3asNAZyIrg09/1qP6okf0dNqentslk8vK
 GJKR023U6n0s566k8geNX7+FDFvjqeidUZmPFYnnvmWrE0YCDv7M8wYnube3iM/yzKVHySOV1a+
 kbA2D3JI8S6yFVGNT9xI1te8tqXEj
X-Google-Smtp-Source: AGHT+IEnB2D8Zt2lhCwV3+7VTxWI7MKuZHKxw4k42U2GFJK7fV9zJULR3jSg0DBPKK8gXEtouNDbPQ==
X-Received: by 2002:a05:6a21:204:b0:226:d189:bbd9 with SMTP id
 adf61e73a8af0-226d189bc3amr13874192637.18.1751960352969; 
 Tue, 08 Jul 2025 00:39:12 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce42a540bsm11633523b3a.140.2025.07.08.00.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 00:39:12 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v2 3/3] drm: docs: Update task from drm TODO list
Date: Tue,  8 Jul 2025 01:39:00 -0600
Message-ID: <20250708073901.90027-4-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708073901.90027-1-me@brighamcampbell.com>
References: <20250708073901.90027-1-me@brighamcampbell.com>
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

