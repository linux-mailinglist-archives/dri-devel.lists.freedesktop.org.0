Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBE3971069
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA5910E307;
	Mon,  9 Sep 2024 07:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DDIf03Uh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E997610E307;
 Mon,  9 Sep 2024 07:56:54 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-374c326c638so2985728f8f.2; 
 Mon, 09 Sep 2024 00:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868613; x=1726473413; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uWDfXNbOPKK8OkK/H/srkd9h9NgocC7Imjlm69NJz1o=;
 b=DDIf03Uhf8op6gUiMPyNCOhwzKzEGqFtyERqn4/fRRb7rW2AdUZt48CbGedOauyjKh
 F1dbqEtHTEZA3wVcun3ODh8Wv9qMbvbK/RszywM1cmzUlpi3j/7WWikYXbRD1jbqvdvg
 rjP+uBEyEqVrEsvevUir3V3wqE0PVuVkHi/WY/F78upKxtzp2tuZbbx3+NHSwb+j/Im0
 6oOIJCdvxKXmHCASzUGTICdOEEAO2ZUYts/vQqdbamtzqQ9riEIvaRzPMaUERgU4aGiN
 /WINnnuOn2tlpyH4e8Of+Tw9e7z4cWFpLEJ+ARofuPa7LD+RbOaODDrs2Q0LpYfuvd4T
 iMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868613; x=1726473413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uWDfXNbOPKK8OkK/H/srkd9h9NgocC7Imjlm69NJz1o=;
 b=KtjynGNoKso6L+eRfDrn3Wqj6jgC6UTbIRLLGdTIEQzLBtyXHF1kJaBrKp2LdeoWl3
 YRGdXj0Ay+X2OOzBWxD+Xjq+QDiKPoI3olAka0S415JJ7musFcnJkR2fVmpazVJkCpzd
 3EVkSLoaqSBhTVFykpFjlvHqkWRt4ITI82o4gqwmReXbVxlcrtX8252ML0GiuKEM52pO
 Pufan8hJPucaJ5AcbeUTe9WthfJ/BHeoOHHtiB7m+CSQsJwaKPStGBIvtoiaYzRG0Hnk
 ZciZV8ttwngu3FvzOSttlHqhrS4x9NJnD1RPjifawE59gjfMAFM2XGlY2A2TlTsKE5ND
 ZnZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTlvEA7o1rEd4jdjGTR+sv5EDxjNPD15HZZ+BkuJQ3C0yoOhAyadLUHB4fNzF1xaluuD2YhC2fObw=@lists.freedesktop.org,
 AJvYcCXr7ctQJHCn9swDpU+IbjOLJSsbgFEOd3wYHen2SEpmRR/RtnwKVmm46RFWvOqr5oyIJ5teIzTMYVWp@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnMZvnV92+6cTR/6bHTrXlwa1Zh1gHkqnP9chMGZ1+gnjF7VmR
 pOttg+VsGOVb9c41Wpta37LHfryA8n0/Kz6XYxbocKEMw4KyweD0
X-Google-Smtp-Source: AGHT+IEJwY2izSi9JvPnlSkxsbiABRBgLXcw/WN/9+VtYgXEpeqF7jtackiugNKAcXHsm6kUmrt+Ng==
X-Received: by 2002:a05:6000:e07:b0:368:7fbc:4062 with SMTP id
 ffacd0b85a97d-378895e2f23mr6668484f8f.33.1725868613138; 
 Mon, 09 Sep 2024 00:56:53 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:56:52 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RESEND v2 04/19] drm/lib: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:47 +0200
Message-ID: <20240909075641.258968-5-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
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

