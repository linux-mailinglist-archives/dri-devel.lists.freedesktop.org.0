Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A84598EBD5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 10:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD15B10E7E1;
	Thu,  3 Oct 2024 08:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kD4qUyed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F6010E7E1;
 Thu,  3 Oct 2024 08:45:52 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42cacabd2e0so5372755e9.3; 
 Thu, 03 Oct 2024 01:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727945150; x=1728549950; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xKrTJrxaC66IYpmC0zcPIsToT+rr6ixnJrZ/0hCTJes=;
 b=kD4qUyedSbCXe52ciai1ZqmGx/wFCpWUOZThIQtfaM+FiSMON/dGz15qkj/VLAtYYx
 Fol+FZP3nXwzZxGFYgXvZoANIt5u1Bq9KB8gFaj6l1I1Igk5J6iYyF56DHBQg6mzXNLm
 +RwOuLX0djMe1yjAl6SVctMtRgwvStUkjWP0DFgiZM4txAk5g4xy2cy+m2fRcE8rUU1L
 k7euGbyMcFg0DP5M08zwWCSMyPr+37RWtEK5t0wKgBirEOUQ7Y7fC2NwNbG6fQNcNC8Y
 X/oSbZoit1jcws9r+MSXDLZX2zpt+cVFOGaO8LjJpbdcj3pfvpSpMFT2F5CfIIzgPi+v
 y3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727945150; x=1728549950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xKrTJrxaC66IYpmC0zcPIsToT+rr6ixnJrZ/0hCTJes=;
 b=s28jSjA7Cg2YIsdcbemXIRQa6ToWlMzUZ6b7sh2rYF542NFt0hOvaO8qd/RrKKeo6B
 LOBEM4+NAoaYAJ2nRfHBbf9vYoBju0YV7FNbJ+PqW+cF6q0dR1aqN/Exf4otOGz0U/wh
 6AgOqLx9EdH1mhbnlKtdjwI5HZ6YeukaeUdiN3Uhgt3mWrq62MnlovssWlGFqTkwQMzP
 s6sQChrPbARjSWqYzST3+pDwlUtegcCXO1hgaF4Mk8DDewTUSWyYtdOe/SWrVYlBUhir
 EB132EQO6Ssq2aHiz6fUXgzxesbuEKj6NyzEfJAqJ3rsa1ePv20yrnoXlJohLdbBbLes
 BB+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3gawJtNIISpvhNWqbW2bRFCcxhfVgRF50QjvcBLo6zpkKzZihRff0iY+mJg0Kr3SXTsaH3iLnNJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMLcO/iwwN8V645rIU+C4w00MBvnul2a2BFhSlN6P3MCIJC6WN
 4kyjDTVfCHJz6wg3LFCZAZKb+N1u35yRB2kpUzfJ4ClFFf95AiJaV/7icMHD
X-Google-Smtp-Source: AGHT+IHYcJ+v3BvMh9LmMa+x7Pipzt189nt8Wq5bzwu6NOma37eD1ygcwKs6Tjm30wExRNhkHBbT7A==
X-Received: by 2002:adf:f3c9:0:b0:371:79f2:3d5c with SMTP id
 ffacd0b85a97d-37cfb8c84e9mr3308661f8f.31.1727945149887; 
 Thu, 03 Oct 2024 01:45:49 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f771c1401sm27262635e9.0.2024.10.03.01.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 01:45:49 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/i915/active: Use try_cmpxchg() in active_fence_cb()
Date: Thu,  3 Oct 2024 10:44:31 +0200
Message-ID: <20241003084533.871524-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
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

Replace this pattern in active_fence_cb():

    cmpxchg(*ptr, old, new) == old

... with the simpler and faster:

    try_cmpxchg(*ptr, &old, new)

The x86 CMPXCHG instruction returns success in the ZF flag,
so this change saves a compare after the CMPXCHG.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
---
 drivers/gpu/drm/i915/i915_active.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index 5ec293011d99..35319228bc51 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -212,7 +212,7 @@ active_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 	struct i915_active_fence *active =
 		container_of(cb, typeof(*active), cb);
 
-	return cmpxchg(__active_fence_slot(active), fence, NULL) == fence;
+	return try_cmpxchg(__active_fence_slot(active), &fence, NULL);
 }
 
 static void
-- 
2.46.2

