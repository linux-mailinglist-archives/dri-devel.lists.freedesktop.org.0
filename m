Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81739C6B8DA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9E210E519;
	Tue, 18 Nov 2025 20:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HzYKx8Ht";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B2010E516
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:11 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-94880a46f3fso190305039f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497150; x=1764101950; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4afc/l7ZL2LBNmErPEN2OigdP0Sw4I667Xea7+C9EDA=;
 b=HzYKx8HtCjoKzfMMi/CEQ0nqJb4deYIQgX5821+Q6AOx6uDNRmpYElNZkArIALyORD
 nxpD4Rh4VvSHgMYEKwRTrX2zInkTyrNyjaHl/eg/NUL9RCDNz2LWNhji9FV8C9gWNa9q
 JhdhvfNg8aBjC2RtU+fmoyTN6I8dKn1ldjh+ySOT+3AAQs8YzS7zCzfdI2/nydKqsPbX
 x52AbYwGq9ZW6SSVRYOYQkAk8SCZHOrd44yZMnKtrHGf4QxcOhEXnIQ/Bjkh3O6eKiTX
 NkruXP2HgIwIFGgKCL3MxoxD1E8Ywoy3/rDNPMjqb0X4JiUWa6jHV7f3LbODi2l3GIhz
 vkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497150; x=1764101950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4afc/l7ZL2LBNmErPEN2OigdP0Sw4I667Xea7+C9EDA=;
 b=ZJlnCVyjUQAo64JHRcVsfn2MLs94kT/jwnZxjv2c6iKd7q49p55B3qe64385V7bBbw
 iqEJNuClp+iU5ZdIEzUnpQnxBfqgtFbrTr31DIfJ4jpZyNliOYQHeSNID8JUGNyCTW3U
 VE5DH1NJeG5uYMrdk8wk4P3ohu+RPdMGRSLjxnRKl1ZddJqgNgBwEd/G5S44PfjuMhp+
 0Gcfdc0UlI27zcW4a3Ff/IQCifzPT8ZWMamOY0m4aYhULxdp1hUZxKt3wsz70wPk1mon
 APceppWdjcQEnu5Kg0CJZ8ZJeQAxZJuudfilup4aG7bBWDY8AR0YsrY6CExhW5Nj6BX8
 r0LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYcSsXXN77L1PYIynRgklzCr71UZa5mGcL1aLMoMvqtlzgteojkdiXPpBPLF5lkg5vG9s1XOpsQWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEc65DaUb/FEpwJhmB2oOVZ4gPnBZui3iZ/DDdNEmUBTDHwM++
 WI6/qkprWxkyhi8lrdBBFiHk0swUdL7/N42eUHNus1DUw0m0pIk3fhpv
X-Gm-Gg: ASbGncuPF79xodDef42HPm88ceEQ3cKkgPKQIE/M7bvbXms6UjMMxNdzW3xeqfIExxC
 JZsFc8a8kh9C4I+IpxAgAUclPexY0TYEKpLvVaU8Kvvb0PWoqYq1NR9hRNc8AEm1oIwbt0Ik9xB
 z63IviTBaUvdFatgcrhPy++/fHMag6ojOqJG12RgbJFSFXmnBtbSjdBiqyiRBt/hSZQgGwXmWd0
 /O4CXjYXEWctSSBoxyu+/yGpGN1iPz2xNz6ZLfoobeDTB9+v+Ogpru7miMgcV/eBzNj7COXZGwU
 +Djr+fZTSOnuJlH+x2ty83ObGvzaF9ZvvbIo0ALQyJEdXI0VygkpETshiHOjPomyNSKbFIgFTX0
 7nk2y9e0vMqm0rnqI86MHjee/iOZdhcs+PQROLsK5/+U7F2RQIOwo8eli/xABMoaNTWSte7mSno
 G1k4g0tzfQSbVDXJ0GwOwdURQq7u6DJ8qQXraOFlpR5Lv3KSc8EmFRfGA6lhfM1VA6hKE=
X-Google-Smtp-Source: AGHT+IH3Ve8rrcRMGDLE8gCfe7PvQeNj002rNmbx8Fly9yuAypwNlp2pxF2aoKhPM6TjRphQeqgWdA==
X-Received: by 2002:a05:6602:486:b0:945:a7ce:646c with SMTP id
 ca18e2360f4ac-948e0d640camr1939043639f.10.1763497150587; 
 Tue, 18 Nov 2025 12:19:10 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:10 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 09/31] dyndbg: tweak pr_fmt to avoid expansion conflicts
Date: Tue, 18 Nov 2025 13:18:19 -0700
Message-ID: <20251118201842.1447666-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
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
index d2ff203d0873..21c1db7e8705 100644
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
2.51.1

