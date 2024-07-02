Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291E1924A3F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AFF10E6C0;
	Tue,  2 Jul 2024 21:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q61yQr5q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133E510E6BE;
 Tue,  2 Jul 2024 21:58:19 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7f61f41eef0so205060239f.3; 
 Tue, 02 Jul 2024 14:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957498; x=1720562298; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4gHhZlZC9lRM4IBPTZ/FMwaYyy9pebB6jMENYSRc4Ds=;
 b=Q61yQr5qtpgVKP0+V+NmqKjuwJn2NNN48lH+FVxbfJp/nhEzYPCRzquztlfk/Bgryz
 Ts5MDejq8urhlPCEVCjsdBCCmSlV3apel8GQZ/EuYizwXEjfeV0RL5RzA08SseozvIvB
 P/uy7lm7LNEzNe1STTOV32Fk1YATkPbewCraPWRIi/d+y9PPyjktLy0ZAnKR5BX156hE
 0ZLoImFOlNrc7kmcWXUC36ro4IrtZkNvkj8CXxnEQLACnQ7Pn47CxuulGA7i7K08Oplf
 T4sEw45e2+e0f+H7W8Pz8IDXeIyv468gnMqOQUTvk+0B3qfskNjGnmxCFavD63nQVyE6
 zRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957498; x=1720562298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4gHhZlZC9lRM4IBPTZ/FMwaYyy9pebB6jMENYSRc4Ds=;
 b=LTBBjD6v/P9OspYRI1JruO0wO4eNVkZq9kXOQRlZhBLfGdxlt/hR/bZUyFUCcHhl+a
 9Hu5rTpuLLTgia7DAjkC1YX93ygg8f3vN2E213oXb5BYuQfImVIIgfiDHEhdzs9+dnL6
 HGGf0dn/f0au1UsYyBZONuhINoaFYt1L1LM+niyQtv+TvlFAPBJ/3eiJIwWNKN0rQm/g
 NL/ocqk106TFl0Df81vTIeMrUCrElJz9WE3EacJZwpAVkutJrqfZsuMP+seKWWiGKf7C
 7r6fDHa7oQJITQLDM7tHeS+mReYCUQs13nz8HJDNxmXWIbGBKgQpw4fafs7Dw+mEEjAe
 JS5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8xe+nBJOqq/qsNgs7jug0rskHtTCYGlJAeQ5tCJoklRlHtTj2ju8XFeorJzhKdzD1sFY6S7jJZH+sYHy+6iSNnJUiNbJ6yrlZI5vfGB8GzEfvrQyIRClktbARwiHoyDdd8zdTmSU/EQbJpespjyDTjC0bZpAgwGt9W+yzgF0x92M72IFRw1Ir36VCjrv8ek0b2qYZadFjBk1Ep51HB+HkMblwy8NlWlBJWQ7dpM4PKVmwCZM=
X-Gm-Message-State: AOJu0YzQj/XGdLApdKFWgS8YS30LN0OX3mKD/mEarN8BlwX62LtgHEow
 IDx+Cf9imytD/ExyOUAUOfR+xrVXt+yRPg/5kL1WLwB3mPGXy1T0YU+f2Q==
X-Google-Smtp-Source: AGHT+IGvsn87+MenBdfimxbbj/1jff8gsxfSw490RrEkjixo7jQ/GQOm1e+Gm6LnX0EupXDxk6SVWg==
X-Received: by 2002:a05:6602:1651:b0:7f6:51ac:bba9 with SMTP id
 ca18e2360f4ac-7f651acbd92mr409433439f.10.1719957498297; 
 Tue, 02 Jul 2024 14:58:18 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:17 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 03/52] dyndbg: reword "class unknown, " to "class:_UNKNOWN_"
Date: Tue,  2 Jul 2024 15:56:53 -0600
Message-ID: <20240702215804.2201271-4-jim.cromie@gmail.com>
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

When a dyndbg classname is unknown to a kernel module (as before
previous patch), the callsite is un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it exceedingly greppable.

NB: pr_debugs are only alterable via >control, and to protect class'd
debug's from unintended alteration, "class name" must be given to
change them.  Classmaps map known classes to reserved .class_ids (the
1..64 val range per module).

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index f2c5e7910bb1..73ccf947d4aa 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1154,7 +1154,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_puts(m, "\n");
 
-- 
2.45.2

