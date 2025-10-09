Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B7EBCA741
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 19:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5E410EACF;
	Thu,  9 Oct 2025 17:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f5aeN0Nh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FFB10EAD9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 17:58:55 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-42e758963e4so11459635ab.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 10:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032734; x=1760637534; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pU2dh1AcXNpIKiB0LgzN/RHkM4liyYcW5Vvv24TZfyg=;
 b=f5aeN0NhO9k3xDakgGg4s6SDBZtldx7Df2GD+RkXJrDR8jy9nwele2/aj3LRRCXVmm
 Szndy2dVazeQgHhPG338Vd+JKHbcOcy93lZIy8lq4S1xtqSzMWCiffKSjhoCU79FW4ok
 Y4Tv7JyPWGFrLdIkeuRS9bJFAYSoROnx2gNEXboe19zK7XM58tUYFyh3Zo8veWxJrofI
 AawR8CmGuLqfbf11OysWhzW5bSNvDWjzE+9yNXidX3jxMw/R4xDmNMFnR/K1oVB60l7S
 EEYCeWvXkIOveY/r7LtQQmJc/Lonn1Gru6Afel5vmqCWQJpXn5vsSxRFg6uT0LdloDIZ
 Ht+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032734; x=1760637534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pU2dh1AcXNpIKiB0LgzN/RHkM4liyYcW5Vvv24TZfyg=;
 b=QV9M5G0H0ScmCRDMVBBW+hGFCFflWSzDJZW95vMi1Q3CAnRVPhrN6J52QBSwz8ReRZ
 6Zi9eDYCEuG6LZluBhjNgy7OL3uhOyDkZ4qAPUJR/KNoFb/KoaPAEjZniTFxWAfXfmBP
 ldVn6qLBuYKQ6L2nGUcp9vScBUkCX+kZqO8m6JATnaY6wH3FQ7pPJDiFCRbFAbeXzRlh
 sZvmC0A+VPcUCSmceNKJjOQyCUEXQObGKOvGwPIDdhqSt5CtKA9EDEfV+ESpuAw/Xj9I
 OeLF2piQcyt9hwHTHr76ZtFQ0fA9KQdungxBtu04d/WXe+YBlFd0Zh3QYFaQhOK3BKMq
 n5Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMSopO6dpF3XNDmg/v4ykIRz/sE1UV9Hu/jrIl1a/kz9PK+ydKrsPXtm9VxB8lZ4EOaAbwpQ3emBw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxpk0MW11Dtt66S6RC/yhsBxRepvb0njjkzi8eoFv159GOgHGgb
 JytZJVhv9i49lo0Ip7E//3ENfUz5WRyWLp2Fu5h//iafZ7FbV9hmUiJl
X-Gm-Gg: ASbGncuA6wH2Kko2Zhy4TWsxe3vHg49aSq/Tat6vrLS84+kyHMopgFug9LSJSjpm82H
 Ko8XfwlEYdM6OIFI79N7L0BubGipewQlSjy8wQbZ1Qvmgq4r1sBMThdJteL74XBfbM+ASA1kghP
 exZ4HzEcHopuz5b2UgMrRBAUAKWBqRF2Y3QflZoAEw5jFlymrJlOzktHFkMwAQjNdJiS9LFjFG7
 k6lUD0+P5cnUqQEvuIn2iz5OhaKHeU8FO8rLPTgo0553zf0vSbBRORJSnIZJCdIsjsg+g4wBDuD
 OlF1YABaHYolaX1PDMmhNY8LfkZuZQ7lqjMaHGzzI9M5fhDXMILcUDh6UKO8tz+d5vW1Apkxsdv
 lm7owFYVWfKsP3AW8fIYDCuCLlnuM8jRVtjOAjFDaydP5cOPd1UigKEM0gSImy1xezbGyPDODHM
 UyGTiFrF4k/gNpM/W8RcvA5CT9K7Nw7v1d//ABCA==
X-Google-Smtp-Source: AGHT+IGG3nRCWoDD4V/nkCQ4bWDSLxtN1n0qdt7xwh20BiNzOL9cD9tMw7g0yxq5IwKvmpy6qvXj6A==
X-Received: by 2002:a05:6e02:270a:b0:425:951f:52fa with SMTP id
 e9e14a558f8ab-42f87376e77mr84960835ab.14.1760032734175; 
 Thu, 09 Oct 2025 10:58:54 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:58:53 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 07/30] dyndbg: tweak pr_fmt to avoid expansion conflicts
Date: Thu,  9 Oct 2025 11:58:11 -0600
Message-ID: <20251009175834.1024308-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
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

Disambiguate pr_fmt(fmt) arg, by changing it to _FMT_, to avoid naming
confusion with many later macros also using that argname.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 55df35df093b..2751056a5240 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -11,7 +11,7 @@
  * Copyright (C) 2013 Du, Changbin <changbin.du@gmail.com>
  */
 
-#define pr_fmt(fmt) "dyndbg: " fmt
+#define pr_fmt(_FMT_) "dyndbg: " _FMT_
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.51.0

