Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A60B57C7427
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 19:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D5C10E52D;
	Thu, 12 Oct 2023 17:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8047210E51B;
 Thu, 12 Oct 2023 17:21:48 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-79f9acc857cso43705639f.2; 
 Thu, 12 Oct 2023 10:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697131308; x=1697736108; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ctyB3lbzkdQhDzqOoTWBErv3Q5efkvJrKvFBj8oTC8=;
 b=Ms/eEsYLQW4NyGwjunuMv8OOJ65U5mQmJZ6NCAP4Smn0r7/3KX5Ah25kVZm9GnDTl+
 D1LsWEbM5NbQsTgV9a/IXNk6SUReT4Y16n5Sk1OnDeI9Bt7GJlwHhVuJ4bbXdgI/PPse
 qkQj9HgoIzkvfW86Rdg/Tl8CPMSjzTgVapIiP+4jOiByTQSk9Wjj2h5J4rCJ+fzoxCh9
 gfcaG4XU6TcOgBHtAAW8PPq9Ts1uQHuMRHCddJee0UbRC+Vu2cyAu1Ux3DlzOX8pQODT
 NmytGBzwFjCF0JfkyIjPNSaChHgCMzaAXt1vQnUUT1n091qGdnx8Y02zkUtvVLENrbkP
 d05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697131308; x=1697736108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ctyB3lbzkdQhDzqOoTWBErv3Q5efkvJrKvFBj8oTC8=;
 b=KZgLDMXlbSuI5ZRyiJfoa5HPMcWmVDJLszPuyQaz3MYbryi5hTXwj0NL4ohcl/zjYw
 toG/JKT0DC40r8YPSvnyh7p5ix+fUIBclfFPi36DH+dD7SYJy/6zbHbl6VQXkq0bpPN5
 2eJMcXMAnQz2grYNzaTSfQymxNfGUSkp42RJE1h3XuaYc4A2LEblbxbKwicVqYGWn6hF
 aOEX3T12plk5Jd+kRgaz1SrRXoSEbg+rD0a2ZbvC0hSr+RmRwO3GNQQaEw50lmGxMIAV
 o9dyXv7hxt/w+4PK1n+Z3KDNPlkCl9xqfF2bxTptYHj7ErJkawubPtyMVKj/E7D906Dn
 w0FQ==
X-Gm-Message-State: AOJu0YwvFo4MYwaoDaDh+UQCwpx81tooc3266b1WbTBJtnEh2n4MVTYi
 iG6/HoQWVdxmBmorTxQMMtE=
X-Google-Smtp-Source: AGHT+IEYEoup2+xxLMAtY5S5JU/QjH2X7dDsZoIBInq6ntlj/YADC88/xMNNWWbfetWVAVtM9gkktA==
X-Received: by 2002:a5e:8815:0:b0:790:fab3:2047 with SMTP id
 l21-20020a5e8815000000b00790fab32047mr27393492ioj.4.1697131307754; 
 Thu, 12 Oct 2023 10:21:47 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 r25-20020a028819000000b0043cef0711c1sm3992211jai.158.2023.10.12.10.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 10:21:47 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 02/25] dyndbg: reword "class unknown, " to "class:_UNKNOWN_"
Date: Thu, 12 Oct 2023 11:21:13 -0600
Message-ID: <20231012172137.3286566-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012172137.3286566-1-jim.cromie@gmail.com>
References: <20231012172137.3286566-1-jim.cromie@gmail.com>
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
Cc: groeck@google.com, linux-doc@vger.kernel.org, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, yanivt@google.com, seanpaul@chromium.org,
 bleung@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This appears in the control-file to report an unknown class-name, which
indicates that the class_id is not authorized, and dyndbg will ignore
changes to it.  Generally, this means that a DYNDBG_CLASSMAP_DEFINE or
DYNDBG_CLASSMAP_USE is missing.

But the word "unknown" appears in quite a few prdbg formats, so thats
a suboptimal search term to find occurrences of the problem.  Thus
change it to "_UNKNOWN_" which properly shouts the condition.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 6fba6423cc10..ceb3067a5c83 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1151,7 +1151,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_puts(m, "\n");
 
-- 
2.41.0

