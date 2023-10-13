Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D837C90F3
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 00:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D9310E693;
	Fri, 13 Oct 2023 22:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E58210E64F;
 Fri, 13 Oct 2023 22:48:54 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3513b5a9e8eso9842105ab.0; 
 Fri, 13 Oct 2023 15:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697237333; x=1697842133; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wnBLKUk9O3xETUCsilAg0vyOCJCY1VGcTM3FhTYpKWY=;
 b=nOvUv8c2RttakGxsbXqNkdT+6P5SgKH4+hF/hC1CI8ZexKOai+DTB2xpudNpusrb8x
 LGcFf2xjrvQ2u2V754sIldhtF7Z0rCVZaa7KYn10PYNxjIk34YN77SxwoVawteBTBD5T
 Bo8UWpfjBpbXMzaJ58kLOD8Wbjzl+sXMq9yz7YoZOr021evT0LOZnfETwUSKPeMbTknY
 M05gmdcmOp1qGzI94TgB/h1dM7H1WW/9sv1q+OXJSdTlv/XTEBN/KkfJxl02IOaLEg5h
 hirKotWZfRDyU4I4y1ivUdulSfd9Nt4TxnfPaC3B1VGvokyXJ8Ho6nD6BCIQVPF0AOAo
 jvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697237333; x=1697842133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wnBLKUk9O3xETUCsilAg0vyOCJCY1VGcTM3FhTYpKWY=;
 b=QHYuhLUkFCG/iENftY9xNi7jguBBzedmk7IuhVdL+P5/BildHo3J57qAxGZc3cnVTg
 6v8pKOKJTMZUkcub77A7e4/oqeUWEFO3eN6GuBFMKcyNZvLshNTgcqjVEB+4t8o5hQ7W
 HawewKfPeKmVBAwE9DOPcPS6N+e8QfhkXdLI4A4rkbFBorhHh0d5QMPMGibWscLpUVYD
 zQKZWv4IzMleUDvNxZ7StLC58hsnDX4lPacwnRXrjcXQmTYDj8QWasWlS2jhOmiNanPG
 nl3HQ1sMIz0cCWtcW0y/80kD9Z+iRSrk/X11k8e4LFvlrUJ5OeVZVEC2NzqhXvh+E9IL
 oCvQ==
X-Gm-Message-State: AOJu0YxVnNyFtLFpfkV9qQBsAWwS7ZUZC99obCUtYMLpK66DyF5OkVPG
 Qhmn/ix6c9WXHI5X5uPaFM8=
X-Google-Smtp-Source: AGHT+IHJBnSInwEpEahOM99jH0rsVnEtmw1JeshrZau0+PNtsF/3sESjxbLknd+gDdbfHObZb+ARmg==
X-Received: by 2002:a92:da83:0:b0:357:6e14:835f with SMTP id
 u3-20020a92da83000000b003576e14835fmr1403410iln.15.1697237333447; 
 Fri, 13 Oct 2023 15:48:53 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 15:48:52 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7b 19/25] dyndbg: reserve flag bit
 _DPRINTK_FLAGS_PREFIX_CACHED
Date: Fri, 13 Oct 2023 16:48:11 -0600
Message-ID: <20231013224818.3456409-20-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013224818.3456409-1-jim.cromie@gmail.com>
References: <20231013224818.3456409-1-jim.cromie@gmail.com>
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
Cc: lb@semihalf.com, groeck@google.com, linux-doc@vger.kernel.org,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com, bleung@google.com,
 yanivt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reserve bit 7 to remember that a pr-debug callsite is/was:
- enabled, with +p
- wants a dynamic-prefix, with one+ of module:function:sourcfile
- was previously called
- was thus saved in the cache. NOT YET.

Its unclear whether any cache fetch would be faster than 2-3 field
fetches, but theres another factor; the 3 columns in the __dyndbg
section are highly redundant and compressible, but to get the
compression, we need field accessors, which will rebalance the
tradeoff.

So, for now, its just the bit reservation.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index f182f95caabb..927cb14f24e0 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -38,6 +38,7 @@ struct _ddebug {
 #define _DPRINTK_FLAGS_INCL_LINENO	(1<<3)
 #define _DPRINTK_FLAGS_INCL_TID		(1<<4)
 #define _DPRINTK_FLAGS_INCL_SOURCENAME	(1<<5)
+#define _DPRINTK_FLAGS_PREFIX_CACHED	(1<<7)
 
 #define _DPRINTK_FLAGS_INCL_ANY		\
 	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
-- 
2.41.0

