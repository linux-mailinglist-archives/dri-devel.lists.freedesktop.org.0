Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BE88BA338
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 00:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296E61126EE;
	Thu,  2 May 2024 22:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="h7+FHtd3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807791126F4
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 22:33:46 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6f4178aec15so2719382b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 15:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714689226; x=1715294026;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FS85aS0uSYWPmkJmR+HxkNl8OY9pDJKR/ix6jc3gM1o=;
 b=h7+FHtd3vfLs32TLdegJT6TjeStXP11xuQcgLHUe3P4m0JfYKZVyRUIafYR/Yqu4pD
 dEiokBgu2VRmXndPMFWP4UDypCYYDtD9mPsKtcKwvQ+Kzrwkk9BA9qYUPHdRIf9giTVF
 BlOTPyA7qdWCBmq80u2RAajrsWl22c/oF/6yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714689226; x=1715294026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FS85aS0uSYWPmkJmR+HxkNl8OY9pDJKR/ix6jc3gM1o=;
 b=BUia721HrxQ7hn/xXOuk5S+mZEF0x8iKHIMC+PB8LVHGfRYCThsRFY3ttgLfm1HaIq
 JoAPnil9YiEKAeWZWLECMzQ9zRHh7U9oyqy1rzvRiLsSTXjmokT2VspG2Qb4uZFPjk/f
 rzxy2ow9Pi9pOTYx0I3tkyut2v3zZeU5PDo/bKTjHfDchWYWmzEcnTrK2QCkQfdp32/w
 ZLjcv6LjFnh3xilGcIQIkPABdw/4xopuWFEsX2m5T3PEON6HK5jrOhl9XJZANYoSMYgG
 ICRGaQES2P++hLKzhF5Pn1lC8dqtYcYI1qsKCfb2ev+A01yIHeTHyxks+Kkx3mu0AL43
 nynQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuOUzjKZbAS+SQM8CtoaWbHTYI45xzJ+lFvFfvF3fRwTqfSCvOqYcVm/rUkOdLeqg6hFEymNyjhhdL/qz/Mg1Gbg5k9k9ZIsxCpfj1y94M
X-Gm-Message-State: AOJu0YzzExKY8zpNfMh4WCNWLQthQE3eEtsj5/P2vZ5AlphiXCeU9WVq
 sPmqgT9EkguDdX49SCLaElHeSWJY679ogqIGYuxGWW3oUQ7yScagrjHBf5FEzQ==
X-Google-Smtp-Source: AGHT+IHPqWSEIWAkmTHA3m+ip5N1siYc+jc02yV1sSYNCUk2VbsJlQut2h0V+Wbt+chL+SgMhgBGWw==
X-Received: by 2002:a05:6a21:1f27:b0:1ac:6762:e62e with SMTP id
 ry39-20020a056a211f2700b001ac6762e62emr1201922pzb.30.1714689225930; 
 Thu, 02 May 2024 15:33:45 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 eu6-20020a17090af94600b002b3631c9270sm2784217pjb.25.2024.05.02.15.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 15:33:42 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
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
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH 1/5] fs: Do not allow get_file() to resurrect 0 f_count
Date: Thu,  2 May 2024 15:33:36 -0700
Message-Id: <20240502223341.1835070-1-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502222252.work.690-kees@kernel.org>
References: <20240502222252.work.690-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=923; i=keescook@chromium.org;
 h=from:subject; bh=WtgCtyIMNT2LXHS8P/KpT13C94RxNhKJ7RovKI+clEE=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBmNBTDS8z47/RFROL1IOhhstMS1R8chpsln1UTA
 /ua0FxEWaCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZjQUwwAKCRCJcvTf3G3A
 JmiTD/9h3vxAjfd+x38LUO8iBg0XaVYG0fE+uUAgPtl4+tThkzIHVPwRZvUaAttpv0rxblAgfyt
 blgim7dvZLmsZwvtY+fG0B7Ex0KmlH4jF9o/0oOrFCCJcHFKogjX9q8vOq7nXb0AutdLQxXbALT
 Gi07OKXY6BfixXgXojnjmDsDX37JKM+9aMT/Js5FWDOhIaFSpn/b4bEgh4VvE5aUCW2AMcqbZUa
 5fIMXU+GdA6q1EHkPu/V/oANVb9vi6kkL3MQRMd2Q6yY/QjA5EVHCA2u8w+Wu2DgUCffgY3zli5
 QvqPOdlTd2unyBGzT+05ygn2f+4E7JW9FczuGQ9wfArVgUiCUZ5OrOhU7YpgHTgtmZhuA/XKvrb
 2uemrbNiU2fmNpil1TqgxnryEz0MfaYDb8BjLOmchF87oBK0wKbVOHNJjVVSoKmqPh3qEk1jC2s
 uHic4zSh8WIZc/ycwpUNqcghKK0fL0v0apyhBiLHa7PYDDRWE89n4xXFDk8p3es23xa8pvtFZ3p
 xrXlj4DW1sDT08plpkk0UXHYq6K8qAaSw1Ts1IwjwkVHo95wmegwPwc3/U1ZfqsuTr9BG7ugDI5
 LiSdxoiZF/Q9dl04c99LliAAzAHYWqj9BQJwJkkOe2KTTQ5L/Hi4L4GT4RdcdaHuJAF0JTaTtR2
 hEa2Zvq5tUpbQpQ==
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

If f_count reaches 0, calling get_file() should be a failure. Adjust to
use atomic_long_inc_not_zero() and return NULL on failure. In the future
get_file() can be annotated with __must_check, though that is not
currently possible.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
Cc: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org
---
 include/linux/fs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 00fc429b0af0..210bbbfe9b83 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1038,7 +1038,8 @@ struct file_handle {
 
 static inline struct file *get_file(struct file *f)
 {
-	atomic_long_inc(&f->f_count);
+	if (unlikely(!atomic_long_inc_not_zero(&f->f_count)))
+		return NULL;
 	return f;
 }
 
-- 
2.34.1

