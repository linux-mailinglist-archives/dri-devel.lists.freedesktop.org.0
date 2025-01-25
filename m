Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DC2A1C19D
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA3E10EA6C;
	Sat, 25 Jan 2025 06:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X9uKx2WK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3348C10EA76;
 Sat, 25 Jan 2025 06:47:24 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-844e9b8b0b9so206430739f.0; 
 Fri, 24 Jan 2025 22:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787643; x=1738392443; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jK0UrBy056BGUqJ1ryqJN7gZOTsk9pTFsv0ec8+B0yU=;
 b=X9uKx2WKf63SRcHRiE8UDBihoGaKKkquZWvEzzZsL2qolQcFOriJa6JRUckjnBTewm
 Ka/OK7aAaaG/DPcBgA7+VouP72JvG3v+TAG8YkubN/iwqQpSTzufAaF9SHFO559GuxWj
 R9IQcJ2Kqj2mXLJXNtGjLNn5QtpBl1fGHW1d1FkYQpN6dAxGSlEL3MlFDKdm29qGlM7u
 7FhopjUzSgLLvqMCcN0PqlcWM13TXrkAKV8eIKUHa1T6JFpHgO5LuSlLnz1BoWYKy5At
 fnZerpvdYJnMdeturzy1gdBkRjrdP+hwR4vMCdyczvs1n7iL4C3yV5Fgs96UlJLh4qGo
 zefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787643; x=1738392443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jK0UrBy056BGUqJ1ryqJN7gZOTsk9pTFsv0ec8+B0yU=;
 b=wR6TEYqUg2AkBeNsFMtg6jOiyO0LudidrzeTqdNDJ8brH2LCzoVkRAU/dCAZfvO1jS
 AKyn5YD2qpsrBcsZE7X9nYrZBm8tasL8jtUqtu1/6AJ7K1Ada600/c7+NiratRZn6hVF
 GrufRdw6gOvvqCtTlanJ/UnRax48CwlxFMYGe0oq39ZXIDtz5kLjrcHdTXAY6UPlDu6/
 Dqf2RqYBlFEf+qxc0JMqFD+AIrRNNBEYTN8gYpL05Wt4cv82C0JWcAiNgpEU9Z484/PS
 fVzOSfPp5lMqjGuNtX/v6+chAxv8wj9GpyJrBArFqYN4mSBfZCwmtXzPNRXiqX29VW5p
 UAqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiGP1JdfQqZGKDgB62XfNFz79ml9PUuj+tE117rCWlS0y9aTUo/5yJPQDj6PpABigcJety86gMGrp2@lists.freedesktop.org,
 AJvYcCWogUU5NCQWuPtAw9eisRXo4ZWvaVwEZtnYGUjIPoLVQfxlsWrXDeQNg/ZU76lQELgP2hRZNdOgBrbY@lists.freedesktop.org,
 AJvYcCXFpy2ckIlKmSlrH45yqIoov99kZSC/91JuafowUxcBO8PT59/M1fSojUtB7ypapswl0GHYdb1a@lists.freedesktop.org,
 AJvYcCXn7DvXET5Sm6Up08yZYqtbnIxVrBDW0Rp0cf3ZABOBxQTgyfLecTzkI5ywer5LsgyeZ4JjedF292coIsJr6A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1S+Okq8w01fpDNP5r7cjC9uFWI1ECTnuwB5Zb7QxR+s0mcDvn
 LKL361k+zHyUPk222YtdmJdCChIWMZK1ZyxXYe/gXaxDnhL8QmjgwOjv7g==
X-Gm-Gg: ASbGncuUBQVISOEcH13Re47PNvkPovjL3ZHRUVptjwBgEOjYNszoIKzWPpuKQb5bwGl
 kiD2XtVqdHmfBVdzQzr+MHcmLhzGLQJ8Xe3OjLRyHOyzNw0wjcHMhZwTcsDTmO6Rgh1BgEWo7pY
 a02jiUN0vXuqDmNQI1/vAXLOc+qOA4xFApfr7tdA2NdsTrgH1uoLvTvnfTW6a37TgU+wfSI1Had
 VKx8naWF4KBhcxIAGtrN7TVizeyg8qU+y8iwjpJIzT23h7mZ+A7cNhCsTCWZTQPZF0NAIlGleBU
 hUXoLW1m+LKvA6W93kCsPGZiyi8BLFZUCyyrkA==
X-Google-Smtp-Source: AGHT+IHayxOMJs31PstVOcXn+82f63fxvtyYlv8CLQzhR0Q1eGOVyp3qvY9W6qSZ3tkYze4hI3v78g==
X-Received: by 2002:a05:6602:27cb:b0:83a:b500:3513 with SMTP id
 ca18e2360f4ac-851b62426b6mr3493044439f.8.1737787643439; 
 Fri, 24 Jan 2025 22:47:23 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:22 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 43/63] drm-print: fix config-dependent unused variable
Date: Fri, 24 Jan 2025 23:45:57 -0700
Message-ID: <20250125064619.8305-44-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

With CONFIG_DRM_USE_DYNAMIC_DEBUG=y, __drm_printfn_dbg() gets an
unused variable warning/error on 'category', even though the usage
follows immediately, in drm_debug_enabled(category).

For static-key optimized dyndbg, the macro doesn't actually check the
category var, since the static-key patches in the proper state.  The
compiler evidently sees this lack of reference and complains.

So this drops the local var and refs the field directly in the
macro-call, which avoids the warning/error.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index b5fe0c37dcee..dcdf21eb73f1 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -212,9 +212,8 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 {
 	const struct drm_device *drm = p->arg;
 	const struct device *dev = drm ? drm->dev : NULL;
-	enum drm_debug_category category = p->category;
 
-	if (!__drm_debug_enabled(category))
+	if (!__drm_debug_enabled(p->category))
 		return;
 
 	__drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);
-- 
2.48.1

