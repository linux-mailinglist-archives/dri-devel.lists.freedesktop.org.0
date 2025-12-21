Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B844DCD458E
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 21:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511F510E3EC;
	Sun, 21 Dec 2025 20:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L9+2Y8p2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6334310E1ED
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 15:33:03 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-64d30dc4ed7so1171353a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 07:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766331182; x=1766935982; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tfKTmo4nJELW1fqaLs3q/xm7GxRxsQ6W6reyaDZwX/4=;
 b=L9+2Y8p2V9I1Q8bBPU0sxPl+5TUyhql/Al/S/2jRrmR3mWF9Y8FWvtwRlLz7G6QLBu
 zMtQHk49SEAI3wWdYcyBZ6DruwH29s4Iiw04zyTNVDevJBYKx+5PbM5ET5UX35AIe7KI
 0UabIFdkY6GF4E7KWOfLNznoOsz2sPLGqJKD16n4uRQghUZp0HcTtgwBivph5UniB/eZ
 M1vWELVnyXF/OEMUnadYkUtDgyiuvPgGLyFcNaPOQVjBp4ddQs5p7cw1YkgQphfSdNa1
 VoQnN4qJFKFBl9fjl8/wFijZyTch0pycEr3F+o4yeNsggKuWom1Rd0NSFEQHwY4pAivx
 a1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766331182; x=1766935982;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tfKTmo4nJELW1fqaLs3q/xm7GxRxsQ6W6reyaDZwX/4=;
 b=EHOjklcZBqwlZ3PkMN+Y+IBXnQyzPr4KBg7H4WvIA0WF17YoN6LBTfNDkQ6Hd6h6yq
 HdTHQ7sKlL4T7ScwyO0IoqJ1l+CC3JfuO1ZQEVpOPvA7oj0ouTM8ZceDXXFq/dluqlWA
 JrMZ0fm+6Up5cNSrntxkODFiwkRwyVxvVTKsM5IT+Q5ZRkrdGViPOclBLKmIE3n83Mwp
 YhGkvrdgEFfmcw3msyj5GIhwtRJZWedj7ym5LuBaB+2w7XylN7yUnYBBmPbKLsAal/zQ
 kmH1+4YnUB/OxgsqYmV9nJ3W028cWThtgSrcpF3mLHqg4zCN2XCBZiZH4skJEeVX1hHL
 Vp9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9/u4EmHdoIhUrhhGCZwbNgBh09+iXWgN2m4WT1Y5W0Uc/sjqAA8io7e7WPrAFIKttUz95hk1RmfE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkIfUcDCUmuYlQdBOiG87oz67lvU7EgmQ5EBtupxRnHFE4S6lu
 MMmUqhbo5URkRGTTpOmEcV42gsUmazw8IrwCtPAhu7rJSuVJz7jXFJ0X
X-Gm-Gg: AY/fxX722tLq3/38EdoKAXS9ABaL4dwQziTVuFKOqZhFZdSwZoYLMLUzN8nrqCjXYh/
 tFYnBo1UZ3yzxqam2eexzRq3l3mtsXYXSaIph13+Y88At1DcYDWmx3FHGDxM+zS2JxnWGTA+SG8
 Lv7O26LN5PWWWbeTG4juO2JUCPg3ySOqIItSQDB1ESXdt70Ow0bbn42z56XSrf1VIMz3k6l8GwQ
 ZMCFHYxEJR5BzfNrt6scfIFagG/SsoWZcbG05wT401K/6NkJVnXYsclcVFBCCL+TP/8G/qWFq9k
 TsERDDNz6eOQZHYPVQR7/kxrxH2x+jcdNb65l6PSK9+WMJkp2k1K7hXAlhiEmcQdfCG9ziISAm8
 YVz6NrFL45x6aHb0u1rixEWjOSEFfB49BEAamUejNxGa14dvoBzNQCL9VoskpXPuM10ugK48PO5
 g=
X-Google-Smtp-Source: AGHT+IHCJZ9Sq/rnbPBZLh9tgt8wtX1m3fVtbRYW12r7euLP7G7Br1Ulnd8nM/hRB9h1cJ2bDI4bvQ==
X-Received: by 2002:a05:6402:40cb:b0:64b:bb79:96bb with SMTP id
 4fb4d7f45d1cf-64bbb799a91mr5639423a12.24.1766331181695; 
 Sun, 21 Dec 2025 07:33:01 -0800 (PST)
Received: from prometheus ([85.11.110.37]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b916adc61sm7629741a12.31.2025.12.21.07.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Dec 2025 07:33:01 -0800 (PST)
From: Szymon Wilczek <swilczek.lx@gmail.com>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, Szymon Wilczek <swilczek.lx@gmail.com>,
 syzbot+4317d7108e14e5d56308@syzkaller.appspotmail.com
Subject: [PATCH] dma-buf: fix WARNING in dma_buf_vmap
Date: Sun, 21 Dec 2025 16:32:50 +0100
Message-ID: <20251221153250.17591-1-swilczek.lx@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 21 Dec 2025 20:27:00 +0000
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

When a driver's vmap callback returns an error (e.g. -ENOMEM), dma_buf_vmap()
triggers a WARN_ON_ONCE(). This is incorrect as vmap operations can legitimately
fail due to resource exhaustion or other transient conditions, as documented.

Fix this by removing the WARN_ON_ONCE(). The error code is already correctly
propagated to the caller.

Reported-by: syzbot+4317d7108e14e5d56308@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=4317d7108e14e5d56308
Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>
---
 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index edaa9e4ee4ae..14b55f67ee1c 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1525,7 +1525,7 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
 	BUG_ON(iosys_map_is_set(&dmabuf->vmap_ptr));
 
 	ret = dmabuf->ops->vmap(dmabuf, &ptr);
-	if (WARN_ON_ONCE(ret))
+	if (ret)
 		return ret;
 
 	dmabuf->vmap_ptr = ptr;
-- 
2.52.0

