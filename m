Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A43CDDF3F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 18:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECE911B194;
	Thu, 25 Dec 2025 17:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VXCys8XV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f65.google.com (mail-yx1-f65.google.com
 [74.125.224.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB7411A4C8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 17:09:36 +0000 (UTC)
Received: by mail-yx1-f65.google.com with SMTP id
 956f58d0204a3-6467b7c3853so3220285d50.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 09:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766682575; x=1767287375; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RyNbxONE5FjE3NQ/ds0QsvOq9j9R5HrwQHi/I2IB5ps=;
 b=VXCys8XV+oeKOcsDQV1AHQjTgGWsqZkXUUvIV2tCMod/1UE6ah4bSreCCLA8yytngT
 v+ump9Xo8mWaxDHvCq6Gt0tZXREFwWyn5yhpDbZUf7Aedg6/eGhU/9ep4BtbuEXtktgj
 gp3Qktpqk3kSwG8Wv2L+5AyTJUkYvQVSInpJAw+LwdY5Y9DLeEPPMSqZjf/mPpL9tHzJ
 R9VZbhYozIZMKxVS2B1RwyokeNilmhRxfeSAZxen9vT2u5BKzk5ppl+1VVyMgE65HXUi
 ollA4qOdGTxFarm6sfjYiD8wUF8M/ZuJZF3/7HcOFxph5zmf6kIAATjltv3W4lM/US4A
 TrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766682575; x=1767287375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RyNbxONE5FjE3NQ/ds0QsvOq9j9R5HrwQHi/I2IB5ps=;
 b=v1xIot8gtYNNyl268VKTQ9TP5VReQdwtbS5aIgyuZCM5xceFQf2HleFx1lTu0nZDHw
 HaNxU939+jozNkkwJrTQWNZjlZZLI9MNKTBK3E47rnCSHPvBfAHXmZ5TgfJKgaGqZzq8
 W1ApJCW11F0leIUYYzKEVJ/5jtanUyFwYd6632aHpz9zyET/0vlyumyDVwU5e+lD2Wb4
 3jrN7gBYC12AegZWBr32MZb0s3x/X/GcvU4Og+pQvpwrSccgnz6D6YlZjvAWN+Y16TA9
 G+leaentaezi1whofwrcnZdkUX9vGdmwNGzaOvtimrJFoRaX++03eGFR+/a4IN1w1ExX
 cI3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm18teLSbb9PYlaKlto48OUtzty5xUsDfW9OzzIbhkXOuJnKCKauLw8bQQsIJgtqzoug4RCNp7olI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzSTAzCjNGdIsRsxHHyXId3BPQhhHgTtG9vCDz+C2FBnPQDCJC
 bNFuhvUtrk7D8uvoUwRse0y/3wgNbz8iZACSpxOd5d+W8UlW9G/wHXlX
X-Gm-Gg: AY/fxX74F8wijHAL+vQoFn7Xi7MR8vyBfFld4lQMDs7CSIL2/RiVna1RlFTw4Grt1Xx
 A/jEkhrpeXw9SbPJ7YZq1TUvyE/PErJ4r5Ncw3zMtRcJW8VSqR7TyQm8tJAUH+GI8J20y5bON1M
 2Y6fnyhBWu4ugT2nG3KyrGltVgDdQcBE6ZEsbA3KKa/ptg2zNDQ/s4HUduhw7iw2GHOVBj5HXGg
 nOWTz5pjZmBfyGL2ndbwNoSM1mFRd16L8yOVw9Ra29hlZmjDhYukI41PIK/zj+MtlbSJY4JD1KB
 rjG78ULB2vq6xovimihTL85zAZ9ivmCfKWHK3P/ctPmXSBR1eOxC1deVUxxhkUUxqvxzAfC7tjX
 rl2W5NNlapjwo1ROgDW5MaM7KJalI588znCajQ4/27hJ+hpTt1qCFhchb9uO2pyvfyhIodfxTRB
 0BiCvucBdqq3HYxA2pqg==
X-Google-Smtp-Source: AGHT+IFE8h6DvR/wQ+jE4yfmtCWCvhxSn9K0kIAiE1b9fgSbqcan4jtnrPelALLy8Mk/xvjxVHggUw==
X-Received: by 2002:a53:c5ca:0:b0:645:5467:29e7 with SMTP id
 956f58d0204a3-6466a8b4e26mr13238687d50.24.1766682575137; 
 Thu, 25 Dec 2025 09:09:35 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:5a70:118b:3656:4527])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78fb44f3f64sm75744107b3.27.2025.12.25.09.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Dec 2025 09:09:34 -0800 (PST)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
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
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH v4 2/7] moduleparam: include required headers explicitly
Date: Thu, 25 Dec 2025 12:09:24 -0500
Message-ID: <20251225170930.1151781-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251225170930.1151781-1-yury.norov@gmail.com>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
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
index 915f32f7d888..03a977168c52 100644
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

