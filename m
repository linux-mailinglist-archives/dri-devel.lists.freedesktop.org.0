Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9128D1C025
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 02:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4049810E593;
	Wed, 14 Jan 2026 01:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YLmuVhPF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f66.google.com (mail-oa1-f66.google.com
 [209.85.160.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEFA10E596
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:59:08 +0000 (UTC)
Received: by mail-oa1-f66.google.com with SMTP id
 586e51a60fabf-3ed15120e55so5668376fac.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768355948; x=1768960748; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U7ftMB0O2RO6V6KEGBmyXf/qaI8CtnkfkNTYnuarQaQ=;
 b=YLmuVhPF3Cn62mBr76iLyYNhFHKGDoAYoiRvoF5DastuoRbdoywUN/np2ZMrMotvSG
 IIuKXYEkr+v6zTk3KWPvGtVT38PWiDmSmnHogIhAuNyYs51O/82fsugM/GzyiKTyZ999
 wyLmmCgdfKfkv8BPCN+9hWInuAbX8yjYkRn1viYxDOM3b2w35Xgur9y/mORfX9qzI5cW
 spmPegvWZxGRI80hrA1aMYpfgoz2CQCW0VIveVgXxou/aOTrbQiq81RzqQFgpi4ALrkC
 h3yGpkG61H78jgGvh8rOYg+sjA+czfDGYw6VIxE8TDH7YehjaQwg8qyfwBEnZOtkaGLZ
 wVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768355948; x=1768960748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U7ftMB0O2RO6V6KEGBmyXf/qaI8CtnkfkNTYnuarQaQ=;
 b=Xt10RwfwgNGVo9AEIevnHHLobQCBmUhT1zwFJMVx/qaoMXTFD85w9a2ZrFMZwZZpe4
 Q0KmzrBDsdTVGBEZtSWxE5WaBWnUxYoG3WRWVoNWH1nQym73WvCsNoRjlXAGzY+qj2lr
 m9fffKRzUf1/PtCWiQg7rW5KaJxOqKbC5/gPx8/aEIvnbEIxuJO+04F6hkctc6bJy10G
 fjpWbq8JRR34IUdk0DVBCvfDPioc7Br3dRnZcJBi4DKqpGqPJRQCMRm92yJ1my32kRKa
 bBd2A0Gau80d899sF21CnLo/CbEfi9wgmeP+pNtSkkDVRlnfgioZe0wmLLyVHT5QdMQt
 wMiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnZIlbQr0Dgd5F2C5kY4OGXvLmWxFv0l/XNgorK9mBbaWQKQCT2JLyz4GouWAQzY+XCCmVXoCe8uA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLfox5foy9GRTpqwt0e0NqFXAafOpQ6uvIeM9XDYSsKF+icfIz
 JTH4JCZ8w6w2LeXvXX3F2UoJEEe9pzXx1B4gOY6iz+ZUDzgX2TbpG7bA
X-Gm-Gg: AY/fxX577mdKHTwoiq0PKxDsgV1FLUw4u418RjTes8tUrZIPN2QEniDjjiuv5CLr/ZA
 qp88hxB4JVGM1g95y84aKK15E1+kkSgvTvN6MlGZeDK47JJA8cUaU263SrdEcZcFs+M9z2ObqXp
 EvXBGUcmfDcHGrHL3HzesIUE5kbduZxVYan0zFaP/apYpmbTYIGNT3edIAE+vHgUPUSopNECQud
 F1jvisJUL+5Qh9uzXopVA9oxhgSsRKupCYPjqbymAm1wPQ/l7hbaSuHJ7In7GiNIMiOdG+jiBjB
 C+3JAPHShkqCmUXdfeP9zfpE0YWeAr+40HYA3AVjNj5Jp9nfHnHeoObei/Juf1AN+Q3dHpWBWSW
 2TyAPeAhU98aQm5XkJ7qtREKLRJKjvKLKNS4IPJkj+NY+LWhyhANI5DeDezNO5v7MuJQ8P55IIb
 IzdGBZnIKkyy3hUpGxEGom930ar4ElUqkT+dcg
X-Received: by 2002:a05:6871:3a0f:b0:3ec:44ca:ca33 with SMTP id
 586e51a60fabf-40406f3b654mr743821fac.4.1768355947689; 
 Tue, 13 Jan 2026 17:59:07 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-4040cba2d2asm341362fac.5.2026.01.13.17.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 17:59:07 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 06/31] dyndbg: reword "class unknown, " to "class:_UNKNOWN_"
Date: Tue, 13 Jan 2026 18:57:22 -0700
Message-ID: <20260114015815.1565725-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
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

When a dyndbg classname is unknown to a kernel module (as before
previous patch), the callsite is un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it uniquely greppable.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index eb5146bcfaca..cb171088850c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1165,7 +1165,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 
-- 
2.52.0

