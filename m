Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BB0970EF0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A5810E2F3;
	Mon,  9 Sep 2024 07:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NkADhmHX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D2810E2F0;
 Mon,  9 Sep 2024 07:08:47 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-374b9761eecso2644740f8f.2; 
 Mon, 09 Sep 2024 00:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865726; x=1726470526; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=diK2vfMDlJNUyXW9lcHoHKMejPsgQZ2jk7i/6JqtmLQ=;
 b=NkADhmHXRiZHdCYG/rQTx8ist+R4MuuU0THUc4jX1ssXHYC7+ZKi5mvp+2gqCLq5Hd
 tA0I/JJZ9nO4gLJA8VsrR0NrXoiTg7J7oYcVe0Fd0yb+1UqUzhTNu9DMGv7sYso/nMfk
 cUU58AU1rs6AXQQt0Jc8GrlAK3X0YdE4GhQH1uPc4V9JK7GdV5A1uh8TuI3oBZ5xAbwh
 wpZ4r+v9dbA3ndXkmjFT2xemJprHTrMvgxgWxxGIJ1jkZOWW1hMBlBO/9GcFugRrK9Gk
 +99ni8/zIviZyrryKDjU9h9c59+jH49Gsi+hAtyCnsat+zdr9ASbG+iPWKY58pBv1Wee
 ve7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865726; x=1726470526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=diK2vfMDlJNUyXW9lcHoHKMejPsgQZ2jk7i/6JqtmLQ=;
 b=k6594kz3OrbvpJ9OQ/zr1i2kXW6UXRIqQprA7Ci12KO67+72KHYrBBIrEehEyC3VWe
 d8M/6f/Hon6uDRr0AO87zjud3KhAHCUyEyATZ0+g1lRekx0fcGEjWSYD13MGp4ETD3jJ
 MQOz0vh17KG413WnsWcfmp8IPbefZYGSgwoukXzyQ2GJUgqmGnjRCbSfTXcUYf345+AV
 a3ykYnrD2W+Xnfm0U49KOT6c8MBePoJhiFos9Vv29BPpF6a2jtz+9IBYgM9N0mkeFAXH
 AW5/VZRMn0qgFePEpxxdFAYYq+vkRnr9AxvkC65pGDbmpmIAZnptVSOcpEbCai1NQZKD
 ygBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUra4i7QZ8JhF+Wy+xW32pukSrBt3EI8ylXgYcyp/l5Vd4n5FUZcom0v7vh29lgjMFuLY/JJfYG+x0=@lists.freedesktop.org,
 AJvYcCWidexnkttpFqj8x7NG4ZsK6LMOuA0RnLUOLDQZQlpU0h5ccvou0iPWhpMV7ncwqPYJL9Zzo7t91c5j@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFSeRzrXMk1rCozNT/NOYxfm3DO6aqZT8FsRdpmyCsJcyNMwgg
 L4usAr37gB4g5EUqQnMYvCpvsh2fAtCGnUtVvtZqC0F5Nhbl0WPB
X-Google-Smtp-Source: AGHT+IH7d2LCOjCEmuJ4w2L75gV8H1NZjK585Hq//GX1VCkES/VJ6SkCqMbky8lLj0QZa/YVXZoH6g==
X-Received: by 2002:a05:6000:e51:b0:371:8f19:bff0 with SMTP id
 ffacd0b85a97d-378895cc423mr6510141f8f.20.1725865725676; 
 Mon, 09 Sep 2024 00:08:45 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:45 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>, "Theodore Ts'o" <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Kent Overstreet <kent.overstreet@linux.dev>
Subject: [PATCH v2 19/19] prandom: Include <linux/percpu.h> in
 <linux/prandom.h>
Date: Mon,  9 Sep 2024 09:05:33 +0200
Message-ID: <20240909070742.75425-20-ubizjak@gmail.com>
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

<linux/percpu.h> include was removed from <linux/prandom.h>
in d9f29deb7fe8 ("prandom: Remove unused include") because
this inclusion broke arm64 due to a circular dependency
on include files.

__percpu tag is defined in include/linux/compiler_types.h, so there
is currently no direct need for the inclusion of <linux/percpu.h>.
However, in [1] we would like to repurpose __percpu tag as a named
address space qualifier, where __percpu macro uses defines from
<linux/percpu.h>.

The circular dependency was removed in xxxxxxxxxxxx ("random: Do not
include <linux/prandom.h> in <linux/random.h>") and it cleared
the path for the inclusion of <linux/percpu.h> in <linux/prandom.h>.

This patch is basically a revert of d9f29deb7fe8
("prandom: Remove unused include").

[1] https://lore.kernel.org/lkml/20240812115945.484051-4-ubizjak@gmail.com/

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
---
 include/linux/prandom.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/prandom.h b/include/linux/prandom.h
index f7f1e5251c67..f2ed5b72b3d6 100644
--- a/include/linux/prandom.h
+++ b/include/linux/prandom.h
@@ -10,6 +10,7 @@
 
 #include <linux/types.h>
 #include <linux/once.h>
+#include <linux/percpu.h>
 #include <linux/random.h>
 
 struct rnd_state {
-- 
2.46.0

