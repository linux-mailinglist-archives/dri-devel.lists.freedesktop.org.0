Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD239924A95
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E97110E6E6;
	Tue,  2 Jul 2024 21:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KmVzE0WY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DEA10E6E6;
 Tue,  2 Jul 2024 21:59:07 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7f61f41eef0so205091339f.3; 
 Tue, 02 Jul 2024 14:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957547; x=1720562347; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+GNz3zEEsQ52HQj9oGak+wZ8oAPfmA3LCU3EZ10XWgs=;
 b=KmVzE0WYY7Ea/qxyruql23OtJ/M68dbcPgKTVkk2A3onZIwITzhjQ5Du167itlF/Sk
 D2nPErJvvrQjv2kqPtDlKOSgs7cQbXwmUumxRwVgI9ebB6DXMhVIxvPNbqrAhHNI0g5o
 ZdIBP1ryQk8isG9Qet4trXmTTfJ340nWP8Uj7mFNYurFprOnu54PD9ihiHpZ7+MPiHYy
 8dLTynzuNDeaVKdBJetV7mSHAfyZC50p3hzG7W9muRHuMpriTdibpFN4dUxmFUqK4/PA
 qR54wwPjYcikhEnLujnmNx2+qZlfq6L6MN1xfNcDyvCyUnj98Nzw0/1csJCsOgkcqFck
 w+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957547; x=1720562347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+GNz3zEEsQ52HQj9oGak+wZ8oAPfmA3LCU3EZ10XWgs=;
 b=hVhfq6RDXv6a90tKT3hCM4m1ls5elpcFuSh97PjsMg8YJon8MdluAI9YlhBjZ59EeG
 LEAOgVpDMIredvyaLD+e91AZfIHY7rLOzMLvCMN1j6y6kx3g6n/Kf/THTevkAAEGz/9a
 cySVzT2D+0HC9ZSv3xFJE8zvOX6J9K0vca2LJ8F47v2mHeZBa+Da5o6h9SRv5qRYl+pP
 JFTprQbpE7JUYkwFLtYa2H0I/rk3/h5qc06QtV6QC2l3VT8XfsgHYgXOqPbYdNTheA9i
 wT4eckWllo85Qgrr1rCK4UBuqNJ0+kh+wV4z7FBERzoq8Bu1Xd4es5Ea2mDNXPzQMOo7
 /nPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp1KXNqGautLel4EX+v2daovVaUZotZOiruDdvmm5CsP7i3qGShnWAMLdQlmFf5pVWTNiBJyI2NXPhHutQQkT+5j8eULjhjPT7xLK8K9iyLI67IhKma9SN3SmTErfYw00ttItVnDalAaH2ZQ3+IOpDYqXX5tBxo21xIiS/FvFGgNBm5ArDtc0qhNeX3VU4D6HUt6jPwQvNLlUe7ykqoKn8veFsNCszso2KMJmC44OTkDcKfkA=
X-Gm-Message-State: AOJu0YxfWp9fIpki2ZZQbnPtrK73MU38AeG7dowmMSbpulA0DBBDsCB/
 jDhso3qdHiRKUyAEdeW+AXwaNQDrLpt0jDf416+b4QiF1E5FnqFy
X-Google-Smtp-Source: AGHT+IGqAAyTYDzyBFrvtILHBMnk+bUW4/hZCTzpIaKmJrgPR4f3UslJ2gwGQZPDM8okTSwxG1QIrQ==
X-Received: by 2002:a6b:7214:0:b0:7f3:d8ac:d15b with SMTP id
 ca18e2360f4ac-7f62ee54681mr1081093439f.11.1719957547290; 
 Tue, 02 Jul 2024 14:59:07 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:06 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 38/53] drm-print: workaround unused variable compiler meh
Date: Tue,  2 Jul 2024 15:57:35 -0600
Message-ID: <20240702215804.2201271-46-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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

With CONFIG_DRM_USE_DYNAMIC_DEBUG=y, I'm getting an unused variable
warning/error on 'category', though the usage follows immediately, in
drm_debug_enabled().

This drops the local var and refs the field directly in the
macro-call, which avoids the warning.  For static-key optimized
dyndbg, the macro doesn't actually check the category, since the
static-key patches in the proper state.  This is also likely why the
auto var appears to be unused by the compiler.

commit 9fd6f61a297e ("drm/print: add drm_dbg_printer() for drm device specific printer")
CC: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index efdf82f8cbbb..c400441cd77e 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -183,11 +183,10 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 {
 	const struct drm_device *drm = p->arg;
 	const struct device *dev = drm ? drm->dev : NULL;
-	enum drm_debug_category category = p->category;
 	const char *prefix = p->prefix ?: "";
 	const char *prefix_pad = p->prefix ? " " : "";
 
-	if (!__drm_debug_enabled(category))
+	if (!__drm_debug_enabled(p->category))
 		return;
 
 	/* Note: __builtin_return_address(0) is useless here. */
-- 
2.45.2

