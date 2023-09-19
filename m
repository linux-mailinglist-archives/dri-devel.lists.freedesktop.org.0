Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F350A7A587C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 06:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB4610E39D;
	Tue, 19 Sep 2023 04:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCC610E39D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 04:45:33 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d815354ea7fso5379670276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 21:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695098732; x=1695703532;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=IH7UIUO8ZPh8JCHOo7ZA6yz3Au2q4EsS6YyTIw9aKQM=;
 b=wOT4oJkiaArksqf2bTZG9gOiLBz25XuF0bmXKSZFYs/1F2JD/yrYNWgnpS9syHEwl3
 urvtgWL5OSfqgTwwLG5xl2LUIkQzUBE/03JUcgK4hGaO+TkLc4ocdlnbI343uH9K1YZK
 Ka6wDolRn8RCh21/HE4FZuqXIPdMnPz7zNh/VYM8ajw3Gy8cRKCFrHpSvSxKrDPP+UV7
 8a3Ecaz46G1vY5De6Ynw6CFAfPza8SmoIz9IKIOa/jIUfHBQhzdT3ymYlGnteYnmbZNz
 +uUS9fVtSE152TRxQdOauvTLW4awZ4t1khql1iNLEuyIoHHzFIje5xqW5wW7DYrxF2ML
 lEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695098732; x=1695703532;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IH7UIUO8ZPh8JCHOo7ZA6yz3Au2q4EsS6YyTIw9aKQM=;
 b=weBD7N8vN2iVlTdA69kBVPC3MhzuDDyZPjCDu3bG4CqUsc7B8ZBJk6PlkmaPaSAXbk
 wQCttVpnGbYgxBm3dT/u5WO6GYO8gK88rRIunxVk8/gFEX6nz3k+wLlVnoun0cVMFKPJ
 G6LFhIy/hxKdvRApGdx06CV3LNroQJNRx2H8+famGvB2y4Hq1BDr7BDPeZ95j1cHWYHI
 MAIj594LsENDH29++HZoktsmOrc5ALZjWrzd+7Q+PeXUiaLaKSkz/1DIhP+yzLRWFUuu
 yCeTuNxvYY9kOQHWQUi6Q+EJm/DBJjmWp+zdKey7NDvuSHGuOzaWsHNe1wHKITRj7ZXe
 QpWQ==
X-Gm-Message-State: AOJu0Ywa9sOaOU73uz2Ae/CKi6JhtolActOJLzhhsr3Nj2KSTw/DpZfZ
 FXdE+H7/1Y66S2JNN2ThP1Jhrz9HRcHuwlVY6w==
X-Google-Smtp-Source: AGHT+IHgcK/N83YQ2mNdvYNGNQ3V9bMbqdSZuQLWzK+X7XDxRHWEcfL/+F8t4NeNL6PFrFoRAaYVuWOSmy3X6XLJNw==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:4cf:b0:d7b:92d7:5629 with
 SMTP id v15-20020a05690204cf00b00d7b92d75629mr255983ybs.8.1695098732152; Mon,
 18 Sep 2023 21:45:32 -0700 (PDT)
Date: Tue, 19 Sep 2023 04:45:31 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGonCWUC/62OQQ6CMBBFr0K6dgwtmFBX3sMQY4ahNNKWdGoDI
 dzd6hnc/fcX7/9dMEVLLK7VLiJlyzb4AupUCZye3hDYobBQtWpqLVvgFD0uGwzRZooMZnmX7MB
 qeQFDDpjmMREnBhfw9cDgE60JEHRXY0eIxaJE8S+RRrv+tu994clyCnH7Xcny2/5jNUuQgM2o1
 TDqVlF9MyGYmc4YnOiP4/gA0XNhdwMBAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695098731; l=1817;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=dI5rbVcmWedpnF/X5f5wXCMNbP0y4Fo65/6bHnEkkxs=;
 b=BLWueVk++F3LH/WYjvrqTYV8xX1dOK4/fe3O/DQC75Af+g3syikmsn7FwpllYX2rkC8Q/Wvv2
 9roNWKMlLldDU48PuASAjnlrScRPVNPmFQ8IAPjpB3Kw1zSg3O0+Uh9
X-Mailer: b4 0.12.3
Message-ID: <20230919-strncpy-drivers-gpu-drm-i915-gem-selftests-mock_context-c-v2-1-0b5778423bd7@google.com>
Subject: [PATCH v2] drm/i915: refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
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
Cc: intel-gfx@lists.freedesktop.org, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

We should prefer more robust and less ambiguous string interfaces.

A suitable replacement is `strscpy` [2] due to the fact that it
guarantees NUL-termination on the destination buffer without
unnecessarily NUL-padding. `ctx` is zero allocated and as such strncpy's
NUL-padding behavior was strictly a performance hit which is now
resolved.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v2:
- drop the `... - 1` (thanks Kees)
- Link to v1: https://lore.kernel.org/r/20230914-strncpy-drivers-gpu-drm-i915-gem-selftests-mock_context-c-v1-1-c3f92df942e0@google.com
---
 drivers/gpu/drm/i915/gem/selftests/mock_context.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
index 8ac6726ec16b..e199d7dbb876 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
@@ -36,7 +36,7 @@ mock_context(struct drm_i915_private *i915,
 	if (name) {
 		struct i915_ppgtt *ppgtt;
 
-		strncpy(ctx->name, name, sizeof(ctx->name) - 1);
+		strscpy(ctx->name, name, sizeof(ctx->name));
 
 		ppgtt = mock_ppgtt(i915, name);
 		if (!ppgtt)

---
base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
change-id: 20230914-strncpy-drivers-gpu-drm-i915-gem-selftests-mock_context-c-980c8ecc9142

Best regards,
--
Justin Stitt <justinstitt@google.com>

