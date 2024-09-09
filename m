Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1844970ECB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E3210E2E2;
	Mon,  9 Sep 2024 07:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HazWVBfC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D3210E2E2;
 Mon,  9 Sep 2024 07:08:24 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42cb58d810eso3995145e9.0; 
 Mon, 09 Sep 2024 00:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865702; x=1726470502; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uWDfXNbOPKK8OkK/H/srkd9h9NgocC7Imjlm69NJz1o=;
 b=HazWVBfCrXQXLU3YRjUl424H5JnFcA9Ko17dGSEFRIAvV1xKvQkQyug3j2IdWlupA2
 oc1mDQ2bivBmdQigQYZJp+EjJfvrLFKAjjYVxyig/3m74kzTpUm9+0hzzb4V6TJeRLuN
 npr01ZLtvsTUHk34md0uUfeJ+LU4aADF2COPeGgKVpvnaMYJX2FJWkIFi5zHFSx+/c1A
 //6HjDz8qISu97k9pJWwtkXep56ADepLtUOFjtNoNpyMuwz/u5yD3cnc5vbum4XE4ZS3
 zACR1meScSz97yPaOi+So/RSolgq8/eh4Gq5D4gf6WJ8IBHPw+HjzFakPtLKZJ3JcVw9
 RZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865702; x=1726470502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uWDfXNbOPKK8OkK/H/srkd9h9NgocC7Imjlm69NJz1o=;
 b=rMUOYCsmAnLw2x6WhRYYhMCSNs9kMDea41paXOGLas2nPLo4dsfdpJsTX1SIuFzK2P
 9ITWL3hZP+2fkViHZUqrBFe2dsCb5qgAS8EeVkmab8kvJtq9nflnbHFDfyM2seOs9Gab
 u9nANTs+DAMFxp3N9aRgJQlg+37ziIQsxYc7T+MPvrb9j2h806phZM8g9wxNlOnB4K9l
 HUkWvT0YfBW13QK6wDYrCtxULsCWh+M3mOoyU+RoZHvjpCQPGdKcwei6Ljqrz9GpyKji
 GD5Z7dhv+ydPWHLNraehfnyVnwWdRrPlG1BiutgNCfLLO0UnedisEkDVJimqalLJggWg
 mAJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfx+wazmrAk1NjX8N0eeQFZPBLY0ExNlrRfRMMu/JSHaO1k5WPll6KpovEMKhTNlyQdThscYuMxlM=@lists.freedesktop.org,
 AJvYcCXPc8f2aYXbGH6O5W8bPCDsAbEKsiUsVq73123UhbvadI21jYH1lOreDVQuXlDRHJ5V7+f74eMCsuzh@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUpXVCcsKUPF7Kt++r8ek/lJv112dnuVsxCqXzngV8CL9T+0QW
 cEbvBNEYtwnpNZ0/aSegjqL7+3k5KuKRzbj26xd5nXZ93zNaVxbV
X-Google-Smtp-Source: AGHT+IEyQpNRm6Z1Ke3uw6VOA9a0jndOIVoKsF8nIAl4IA619+tgnWwmZALCM8p4dz4tk9TqSiSrJA==
X-Received: by 2002:a5d:5406:0:b0:378:7de8:df33 with SMTP id
 ffacd0b85a97d-378888478bfmr5359523f8f.31.1725865702294; 
 Mon, 09 Sep 2024 00:08:22 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:20 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 04/19] drm/lib: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:18 +0200
Message-ID: <20240909070742.75425-5-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/lib/drm_random.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lib/drm_random.h b/drivers/gpu/drm/lib/drm_random.h
index 5543bf0474bc..9f827260a89d 100644
--- a/drivers/gpu/drm/lib/drm_random.h
+++ b/drivers/gpu/drm/lib/drm_random.h
@@ -6,7 +6,7 @@
  * be transposed to lib/ at the earliest convenience.
  */
 
-#include <linux/random.h>
+#include <linux/prandom.h>
 
 #define DRM_RND_STATE_INITIALIZER(seed__) ({				\
 	struct rnd_state state__;					\
-- 
2.46.0

