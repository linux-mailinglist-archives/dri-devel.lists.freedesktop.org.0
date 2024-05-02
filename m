Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BD58BA335
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 00:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F06510F850;
	Thu,  2 May 2024 22:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NOKGyqIw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8190210F6AA
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 22:33:44 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6ee13f19e7eso7835241b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 15:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714689224; x=1715294024;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1A06K+cPndg/pyM0u+MnZKl+yBNNRhhQ81oQHFD2WfU=;
 b=NOKGyqIwSIXXlZkVuwpJY2wKvjpaOOtvxf8kqVJH3GsFeDpBHd8U9KMfa0vWh8363v
 DE1xvdpG/KlSkmf3qsKqRebokJHpr/ZLrcWEsfMU1M1rAuMUf2VAFysre94LeT0n2snO
 WGteOqEogjK1YcWy6n/kFQP/Wr5PGT7Z5/RRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714689224; x=1715294024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1A06K+cPndg/pyM0u+MnZKl+yBNNRhhQ81oQHFD2WfU=;
 b=lKBVGBdqNapMsKzgfX97EhcN6U9MLJMZ+8OOLgbeA2BmoV3HcjQeCWT7VINbKR+hOv
 ZYkwIeLYBQHg2undeVdYp22Q7CYz0uN/139hHIpVZkHAFpxsaBbiCwDCiIEvdyN3yfLN
 zpBS/uv5QscPTB43r762+CupbW2LwAVVPIqrItHarAmqYEbSzWho7rt0ZGinJLPuoxhL
 Qqb5jPVZKoFizEDZ5KpmlB+JU1clsnH1JB8YZrZPY/82xYFxwO6WA2xyMKaKjEDJqr9N
 al7YzWo35uyVB8D8/Psqu8oL9ogtDGwXgL/4FaJyfTN9Qk3i5fV0Bfo6v7pr2qeTizyW
 zHkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/XNHhLJMH+nH24qgZgAS104VtM8GbGEgb5MDCogDuEm53tb0gfKpwy8rS1KpuYPC1U3hvgA6U399bVvUTFXpEL9N0pkls8iMGttzvwRQY
X-Gm-Message-State: AOJu0YyisB63W+Duv+dI0VF7Z9LcK6J4lgWOuZjkFfGKnCG/cLJUkr6u
 8lDxoPYIuVE/QbsifLmcmyQObTN0F7Nilwn7sgsc00Fns8uyk7pyuJpl4K8E1Q==
X-Google-Smtp-Source: AGHT+IG2YWa+9vY4h3Nt4PaRaRqLrTI7aivCYrlbdPDKTXJ4+9jbccE7kk1f6L0pdlB3sdtwRrv0Kg==
X-Received: by 2002:a05:6a20:2ea1:b0:1a7:64dd:ebe8 with SMTP id
 bj33-20020a056a202ea100b001a764ddebe8mr1102791pzb.49.1714689223844; 
 Thu, 02 May 2024 15:33:43 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a631c4c000000b005c6617b52e6sm1794043pgm.5.2024.05.02.15.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 15:33:42 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH 2/5] drm/vmwgfx: Do not directly manipulate file->f_count
Date: Thu,  2 May 2024 15:33:37 -0700
Message-Id: <20240502223341.1835070-2-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502222252.work.690-kees@kernel.org>
References: <20240502222252.work.690-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187; i=keescook@chromium.org; 
 h=from:subject;
 bh=OUKzE9BVu8bWw6VjJLw4TE6pDmrAN0hiIKHseOy5gQI=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBmNBTDv/zsdqEX/aWrvJELPzlHroMCjXF3QLhey
 S4S5ggvUL6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZjQUwwAKCRCJcvTf3G3A
 JkpxD/oDlial29qMNd66BSgea9O5UW/Aq3fbPMw4W3EMgMW8bVd/2Cha0TLF9V6wPXJVpP9GICw
 eySmpxWOHWSZcjcLDQcl3iM4a9UgU5v0D/1sXfoWYpKb8RVGeGLgKP3alVDBkkX0vAShE079Rgv
 AaOYBsxL4AWKH0J2mPuUNW1OfLBaqETFXnLQBSaj2UyS3/WXTVW1GHxm9VvBJGhFVxuE+wCb6J2
 xOaHDjJd0EfmnXYWA5G0fszOm/QZch9KwaaSnl4bvV6ennST4HrFfxcb3aoODK7M6tHEtze1gql
 3NOu5+wUDcxv68MozmrUGEAXWOvGgTGZ5kugToTTsHflWiG23cemytSMo203nmTfyKc8/u3S0AO
 fT0/foBY7k3RMwGcqYBnsdh1/Jq5xVXpDYVLyMgNRsgW1NXdWmM1cA+dosWN6PMw6lRAue96s9c
 i3rmc1I8FSgzzkU6CVzCHA2OvjWHWnAtCxDZFGoTWPNSt68KMgYxy+w7dhirZS3oY8UA8NByD4z
 iU0Wr8PshZ6X/yOrMNAqrLv/YHZHlXt9M1fl5FRs35Y9Cfj6SaJjRhsWINHqY7XmL7DbZgLHnfT
 2sm2WcxYxdug3OFoyke5UhhyXwLjB1tcBLaU3maUuNFLkfVGdBWJy1b3jBcj9FeFF/FmdXedjLE
 f5Rb9fzOhMoS+kQ==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The correct helper for taking an f_count reference is get_file().
Now that it checks for 0 counts, use it and check results.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/vmwgfx/ttm_object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
index 6806c05e57f6..68d8ee3020b1 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
@@ -475,7 +475,7 @@ void ttm_object_device_release(struct ttm_object_device **p_tdev)
  */
 static bool __must_check get_dma_buf_unless_doomed(struct dma_buf *dmabuf)
 {
-	return atomic_long_inc_not_zero(&dmabuf->file->f_count) != 0L;
+	return get_file(dmabuf->file) != NULL;
 }
 
 /**
-- 
2.34.1

