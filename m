Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E38A793F9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B1310E878;
	Wed,  2 Apr 2025 17:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OBGGiWH9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79BD10E87F;
 Wed,  2 Apr 2025 17:42:18 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3ce868498d3so417875ab.3; 
 Wed, 02 Apr 2025 10:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615738; x=1744220538; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MlpyI1Cbu0G4E1iYQnKaYcyXlhpWchDiOL6/URF3toQ=;
 b=OBGGiWH9RNgLsJgIhvInu8yYXz5d3U6Hpbjz5hcK6Ndcok/YZNBnKy4BKut8r6f5yk
 lcqTux1HKyd9Hel3lmiqdKp/k9C8xq2+1qHFhEJ55yVNVC+doS5ZnMC1KU5L+8+zyPJK
 IYbcYzIsSAp3wLyAFvlxH0pgylHowinjXnvW+dk0+AaebNyZcLR0cWbRtSl+ffGJPPLr
 D5PrXzTvzqMt06t3+kwj7+CK3OdpxfQy4/MOyrLwC1mI9+HPindi8shDCQWmrUgYkjFM
 6uZTApAfWuMpzn5JPMmo/IUnwa6naaFSA95dwOqdkJb5eZ55O30JXBQPS/lGUCoMUGgZ
 Chhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615738; x=1744220538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MlpyI1Cbu0G4E1iYQnKaYcyXlhpWchDiOL6/URF3toQ=;
 b=xA6yZOVecQis2HpQi/e2kobAUjdeOvfq5G5Zx7l33PMOOElkjGBm6GK9aXcEz8u/VA
 znpuDTngaSYP0fUo0b1+nNx09zW8PmlUeYOimDx9WnnKMj2MYbQnXGl6sQ4bfr7iIL5r
 j75WLU9Dtsmv2UI6ipi9bDd10hor9kRyxVwQ83tduzERtcw2eKlO1djeXemZBiKuTFED
 NlG98ez5m/7VPZN46n4dxnpYGfIJpIWsOnxDQ+9yJW+Hee0WffY26c+tHj0xwy7OcGm8
 E7lJ/DgL3W0naGnb2f4rKUpBcS6/1Tl7jcEX9KYc1N5zgRko4EXcUJij1DQMrlOcjujQ
 aBjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNt0zTOmYYre6yVBRRk/4skArhcH9jrwiebBcG27DEXRvhGYIxecLhmXyasRDbjaQjmiaE5oO7Xntd@lists.freedesktop.org,
 AJvYcCX1dgIuS+yqWT1hxgpTssrIZjeJPQTVett1LRmwoPeGxAJOhE1rn7FdrYL/H38zKIFRMqy+HanV@lists.freedesktop.org,
 AJvYcCXtwfDYwNC4CMhW2bwho8lsAPqHsepTqAkRAjBdjz1Wx+QOwjIkvW6Hy99YSOWIZRL/1hmUYWWVCn4qx/nlfg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiWO0NsfNnfiexDn9TVInzHTAmUvB0uL17nmdxGmmDYkHRqlun
 ggRcoZveoljaPPVglh69+7cZBaQaL7uhXUsao10Q+/ojDHl4ivXB
X-Gm-Gg: ASbGnctnkxu6AZPYKfuaVJ1pj7AH3z0IQq/zbUZiLnJCa5xiXLiEOyADGFhRXBGC+Zs
 JQb45pdehh2XVFnpgc7q8vSAREJwTKJ2ekb1u514sfRPDEr2QpNqixfD+LhjUawf3B2CTT+kIPK
 bH55jd29V6NxNtxq6XV8C/Gd7o5tfhrUscENCpg+ShqO2wlAxs1SUcSb/dDGbenKk/wQlQGcF5E
 lXVUnBkqWBz3kUPgtJH1a9qJmEmUDOcqdkc3Gi4gy1dSFMF9oBFYls3rNVTHOcKOn0YC7/rxA+B
 z059z4zQiMHdeArosoN8BgUtSXjO4XcGYxpIbekZlILz5mwYbMrUBm2pga24OiDxEcAEa1tArHf
 8Ts2bufTkl3qH
X-Google-Smtp-Source: AGHT+IHHjhRDu+SE+n8jz0Z3ClAuEczfqEXMN4CVftbZdgfRPuFKsZB0dnMkVBgAMrRiDsGR5bLubQ==
X-Received: by 2002:a05:6e02:2703:b0:3d5:d743:8089 with SMTP id
 e9e14a558f8ab-3d6d548b160mr32428905ab.7.1743615738025; 
 Wed, 02 Apr 2025 10:42:18 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:17 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 05/54] dyndbg: reword "class unknown, " to "class:_UNKNOWN_"
Date: Wed,  2 Apr 2025 11:41:07 -0600
Message-ID: <20250402174156.1246171-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5a007952f7f2..147540c57154 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1154,7 +1154,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 
-- 
2.49.0

