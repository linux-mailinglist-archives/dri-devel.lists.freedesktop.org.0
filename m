Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D90837927
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 01:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CA210F1A7;
	Tue, 23 Jan 2024 00:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A50A10F1A7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 00:29:58 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2901ac9ba23so1938690a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1705969738; x=1706574538;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ti9Pce6Lpu2kUzlJNdDw3MDPT1cyRxs9AHo9YOvXXwc=;
 b=J8RYq5Xx7WCYIm7r+PCNcYF59dpIJDs83pwjmuw8Z5oRdPNJ0S9+NSKWRb8QJz0cHF
 h2mVYgTooy617T0YnZaXUM/iwaqWFqsjxiRdXgi7pL3YHLmb3wAyi/YxCqfFtZdZpubO
 QAHLu5CzyLdxmjb4qOHP/b9duYGJT8yNP1LKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705969738; x=1706574538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ti9Pce6Lpu2kUzlJNdDw3MDPT1cyRxs9AHo9YOvXXwc=;
 b=HY+upVqHFE2yB2qlAUUndbWMFOBrO7xUvuqmhIVR2UkJeQtt9jYJSEQySyH2/EPwK5
 0AnGbOMUBg8HWlRfeSeYKEEDKsfJgJBt2XMuViz6oRqwlO/W/nx9VxCr8PJ1irYD+xJV
 nBNhbRi+0mGSVEzKZLUzNu9DYE91e8yGK7odTyeEuskONFqXzq5ATu7NNRdmp1WH1IbH
 4uXZtCrDVSlhEWU4R26WHzGF+hitgE1GgpxLO4hTkE0y6LBXk+KAAblk14mcNAk+fcV1
 YcNhdV7jaT75Oz/UkebZ0KCNnlxMCh4FtRQUNIayN7ZML9IzERXnvreV3RBJ5K4+yDlq
 r6FQ==
X-Gm-Message-State: AOJu0Yx0R/y6hmyIxOua4Z9VAu7GyIPla+EZHEpX2Y0m+p8bmRXdstAl
 6E1Wek0nt8J8YjcJ8xMsD9I6L+eVl9y5lA9E9aQyrc3uWJILyOd3riEBu8r0IQ==
X-Google-Smtp-Source: AGHT+IHxysOlKojjA+pzT7YKshwDp7mEoKxiFORi05Ne2gh5Z7r5EGY2fIV1rixzNAo1ByfAlcIy4A==
X-Received: by 2002:a17:90b:3786:b0:290:666f:7be2 with SMTP id
 mz6-20020a17090b378600b00290666f7be2mr1543735pjb.82.1705969738187; 
 Mon, 22 Jan 2024 16:28:58 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 eu7-20020a17090af94700b002902076c395sm9968033pjb.34.2024.01.22.16.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 16:28:46 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 17/82] drm/vc4: Refactor intentional wrap-around calculation
Date: Mon, 22 Jan 2024 16:26:52 -0800
Message-Id: <20240123002814.1396804-17-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122235208.work.748-kees@kernel.org>
References: <20240122235208.work.748-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2558; i=keescook@chromium.org; 
 h=from:subject;
 bh=JgonJZnxkTCS8vYti6xK+vM63BFoTeMVUBVyb+CU9a8=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlrwgFu/g3mFw6uq5pHkL3E8AN7SiAjt9KR8Xix
 +PwApphAJCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZa8IBQAKCRCJcvTf3G3A
 Jge3D/4u45AQKfLOVnFIwiv0NBxYETFmX3tUKTuc2dXJyNb2JL5HZVqwUSUaSPll1jigd0ESq+3
 vBUnoJAMixRc0Wcmv8+S+NzuWlj/nljcpFOhIBrWsZt2Zdv0oFPuvDGXKWBwxohbLWGWqb2Otbc
 y99plRk4kHDWrILvbtqc+mviNEDD63DUOu70L2aT0MgDBP2WJHf/KckoFqWe9Gh49tuCZQHmX0e
 b9/uQAFad4dpfrO0Y7gWYu7QKC3HKK/EUXkvazbYav+WeTBL3JuifNiSmEE7wjLNSEod/GqFdt4
 tnTvyCjEqXGwfLzjaX8TyuOvKZZsj+VZ6ZypG+E8d9qBmL3zZoVTvVXLyaQKv8sSLmPT87PN2tA
 jlCMKrZYqld0WN2mSdTGlYWazdKvBvQ/wfaaeUY70H8G0dj2cWTwoC+wF/Wp/Ph1MIymiasAvIV
 Ntw3se/q/tquahs2oNjMCDDmarRwr38iKcMtNt8Pewb9eY75hXI61eRzFQWcI7e+ksu9xOdHTgy
 eV5ukAWCsrtg03FBRVxNX2eKCgWHTheAxQaBRGBD/XowDB712zwukECG7veQEoxDhY4DqRk3DlO
 ts+/zz0xpt30cc8yvKxN1v+A5ldw0a38veiStkHBXthkzyl3wr9n0DChf/4UhYKH7XME3RBusVq
 0W443HcucToeoOg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Bill Wendling <morbo@google.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Justin Stitt <justinstitt@google.com>, David Airlie <airlied@gmail.com>,
 Kees Cook <keescook@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In an effort to separate intentional arithmetic wrap-around from
unexpected wrap-around, we need to refactor places that depend on this
kind of math. One of the most common code patterns of this is:

	VAR + value < VAR

Notably, this is considered "undefined behavior" for signed and pointer
types, which the kernel works around by using the -fno-strict-overflow
option in the build[1] (which used to just be -fwrapv). Regardless, we
want to get the kernel source to the position where we can meaningfully
instrument arithmetic wrap-around conditions and catch them when they
are unexpected, regardless of whether they are signed[2], unsigned[3],
or pointer[4] types.

Refactor open-coded unsigned wrap-around addition test to use
check_add_overflow(), retaining the result for later usage (which removes
the redundant open-coded addition). This paves the way to enabling the
wrap-around sanitizers in the future.

Link: https://git.kernel.org/linus/68df3755e383e6fecf2354a67b08f92f18536594 [1]
Link: https://github.com/KSPP/linux/issues/26 [2]
Link: https://github.com/KSPP/linux/issues/27 [3]
Link: https://github.com/KSPP/linux/issues/344 [4]
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/vc4/vc4_validate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_validate.c b/drivers/gpu/drm/vc4/vc4_validate.c
index 7dff3ca5af6b..9affba9c58b3 100644
--- a/drivers/gpu/drm/vc4/vc4_validate.c
+++ b/drivers/gpu/drm/vc4/vc4_validate.c
@@ -305,6 +305,7 @@ validate_gl_array_primitive(VALIDATE_ARGS)
 	uint32_t length = *(uint32_t *)(untrusted + 1);
 	uint32_t base_index = *(uint32_t *)(untrusted + 5);
 	uint32_t max_index;
+	uint32_t sum;
 	struct vc4_shader_state *shader_state;
 
 	/* Check overflow condition */
@@ -314,11 +315,11 @@ validate_gl_array_primitive(VALIDATE_ARGS)
 	}
 	shader_state = &exec->shader_state[exec->shader_state_count - 1];
 
-	if (length + base_index < length) {
+	if (check_add_overflow(length, base_index, &sum)) {
 		DRM_DEBUG("primitive vertex count overflow\n");
 		return -EINVAL;
 	}
-	max_index = length + base_index - 1;
+	max_index = sum - 1;
 
 	if (max_index > shader_state->max_index)
 		shader_state->max_index = max_index;
-- 
2.34.1

