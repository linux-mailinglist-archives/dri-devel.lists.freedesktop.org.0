Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C79DCA8B16
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 18:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4062E10EB7F;
	Fri,  5 Dec 2025 17:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tf7pMCYu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com
 [74.125.224.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF7510EB77
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 17:52:41 +0000 (UTC)
Received: by mail-yx1-f49.google.com with SMTP id
 956f58d0204a3-6443b62daf6so2151369d50.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 09:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764957161; x=1765561961; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wgVl4UPQOdVuiUQDADihFeO6bzjnbrTXUsfv7qld2JA=;
 b=Tf7pMCYuSfxIhj4C8SLgrvkymAIn4QpBhx67BF6EFxVz0Ttb2sJidlr9ZpjdsTbqWw
 DDj7CXwykeAwFxAUUuiKIyvdNZEtpW/XzI3ZVt2E5rFKBEyB0xDGXc7kKhxOlM2Q1f3S
 raf1Djl4ZAT7hh2qpjH7zvZe27hWnhR/cYPpCLL9GBlFbyfW38k1KSIhvncZCGd25w+x
 Z/naFcg1pWVoT/nQ7bL0fxbjI8rs3/8Y/3i6wy0x/n/7YyNgkl3rdgdPjS9J5DkhMfub
 DNmmNdM7xK3r9El2UmuNLw4N633hsVwZMitZ3wsX23i5dSjUn5g+rpZYGRku5xzzaLsc
 1PsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764957161; x=1765561961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wgVl4UPQOdVuiUQDADihFeO6bzjnbrTXUsfv7qld2JA=;
 b=apeoovfz/PbsshdVFdu3yOKuhCUECh510KO1x464PGs9ln7ijh8cMu6jM9gqXFro0G
 KTePGVZkKRok6hoTcsUIfkcmmSKUXd0WlgTHu+gWSIZ1IeKOs1GLYURoaNfOAKWj/+RS
 IFU3rvV6nKEmNlwMFFJiO52jlrslv7Nm/8r5M0CRp+1nR2y2/wbxBwzF8TbyDuXFFdr5
 ushX5ePSOAlCpMIg+/kgyKQUkoiheGfbTt0K16bivRxUPfGsBWLCt48JKEmPNpjzQg/f
 wKMpAbbtrA3sAtf5H0H2ofivI+S3M+tTwBMgUv0Uk4yKHd/6ny1MuC4hfgHqCkjT3Tx4
 IeBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5KmFBZh2nZsPK6X6pB9Wh0bMHVheGxo2IM/242PobLPAjmjBSYYvG4V0sOkpKPLF6eQDLKsMWmRc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEkQfS77dPnSgZfq7BvFcklNqsBQDrundvyE22euUGqWMhdpzt
 2OV0W4YRjxPnGFhauH7WdqVcvptYSJZo9jqmtyZS2LTg7Y8/mwsoRZET
X-Gm-Gg: ASbGncvFWTjFynN526MNZsfenuZerfhCQZCiMRLjbrr/mCAkkGzxAF3l/t1KibJ5ZDH
 fxRltFrg+UeEnDFLrPdzSjjbtkWt/K7vQlVik0PPTnCtaTmG44GhNRpj5lM8NTDGi+oMvaq1x2X
 +e4SsxxRxxwNpEzxZumg/CHTgzeRjW/HA2J+tfSigtqzot54qdEyMxSnzv4lDUQVaG0jkBkJkcw
 xOGFG+KgBa0L0AqO35TpYkYdGGTyCFi6YxzK/Tb9p3Dfswmnz5y31EeGIZMOCKxknezCFFRZmVo
 538Ee8xQo65xWAlfT7UqL7E6/NaA2Yv34N2xxXOHOuFbrOdbomLAHcKJ9Veov+CBNnRDQ7HNHg0
 c4oCWgLsHUg7fGhfhiV0Fx9gbLNZdnZIdGu6rDCyTMOIWZY1bkXioM/CpRBXKLTneRLuR3mf+16
 wFJa1qTX+HvnP+Jd5L
X-Google-Smtp-Source: AGHT+IEmHQrMAc5KhCOB44tPj+C3L7ufMqCejlU3WOz8uzACjmQ1s89nXnFrR9N4AEaBc1g4PgKHgQ==
X-Received: by 2002:a05:690c:4f12:b0:78c:2803:c819 with SMTP id
 00721157ae682-78c2803ceb0mr17790807b3.22.1764957160598; 
 Fri, 05 Dec 2025 09:52:40 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:be2a:7e4d:3bf:3fbc])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78c1b779458sm18946927b3.35.2025.12.05.09.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 09:52:40 -0800 (PST)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH v3 2/4] moduleparam: include required headers explicitly
Date: Fri,  5 Dec 2025 12:52:33 -0500
Message-ID: <20251205175237.242022-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205175237.242022-1-yury.norov@gmail.com>
References: <20251205175237.242022-1-yury.norov@gmail.com>
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

The following patch drops moduleparam.h dependency on kernel.h. In
preparation to it, list all the required headers explicitly.

Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 include/linux/moduleparam.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index 6907aedc4f74..ca7c8107c7c8 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -2,9 +2,14 @@
 #ifndef _LINUX_MODULE_PARAMS_H
 #define _LINUX_MODULE_PARAMS_H
 /* (C) Copyright 2001, 2002 Rusty Russell IBM Corporation */
+
+#include <linux/array_size.h>
+#include <linux/build_bug.h>
+#include <linux/compiler.h>
 #include <linux/init.h>
 #include <linux/stringify.h>
 #include <linux/kernel.h>
+#include <linux/types.h>
 
 /*
  * The maximum module name length, including the NUL byte.
-- 
2.43.0

