Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C56DB191FF
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AF310E4BB;
	Sun,  3 Aug 2025 03:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lm9I2OBt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFA010E4BE;
 Sun,  3 Aug 2025 03:59:21 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-3e3dbda56a5so9951315ab.2; 
 Sat, 02 Aug 2025 20:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193560; x=1754798360; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QtM07pJzYNN+E8iBAeVUHbxcWX+I3Pz7zufEOWphlcs=;
 b=Lm9I2OBtgZpEpcu/j6f4lFafUcH4dRXTSYXHrmI7fQHco/yW+KkLJ67Cl29lOpBzLr
 sx5BeixQk94F7UUo5rNKVu3sstSa1ZW2sr59K9QeZxHlx1HWjtGndZZyyVEjh83WQYMU
 VVSZk0TAAHapU1YXLT+B5zkPBggxSDoi7/wAN21ACh+8Tpqug9UNulZnqZwzMKar1Hat
 gCMDyJsFke6a4QY4hXTEOjywD8duK4j5BF056dNA1/IqUhegwNh2FqKU3Z9yqwwehHmr
 bfBB86Ure/qCZPbvWie/WgKDFTY6ytiCbtl7Wq/1owkhXdSmVEO3P2qB9rr67V0gLfqJ
 8ROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193560; x=1754798360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QtM07pJzYNN+E8iBAeVUHbxcWX+I3Pz7zufEOWphlcs=;
 b=a9OFuBBR9jTROjfvwXMxfYvzQn+79MlP6+hPnQ3QnzVHR2rg4b2xiRnfYsHRQOwTQG
 1c6Ljb/kZg1IeHl+njOyAXde+dVO8WxUdBs2nahvzqVzKCt/Kkira8RXi3fZWvJwTHrz
 rokpvFcZfDuGnNVCHT7YsUJnbgz3moztOCvPK7pIYIU8NfTY3euUvxHH1Jv9aI1rnKTD
 RdCzHCQMtwKFVygYSJLCGsMVGBfWoCFc1oHfX2ao3r+A4gihwZfHff4i5vUSo76qbN0h
 6tKM3eM2B84SDnsuFO4Ir6jv5F6F+JtOoXUKvbfmEiecjq8MAuYX1KMN2IMLgKDyF94Q
 AjIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAuc3Jtyj6DDr6SRQkErHfC4Jknrpg6HSlOVIH1RBeEyFMg5BGfcMkrCvPtfJLpSB5a1jO56z89POSgp2+gw==@lists.freedesktop.org,
 AJvYcCUfBSKjmAdiVT+xvOtGWML0ObWSgMF/jqQFJZS9ptFVMSSUbhwAxjDvmrqu1YS4czdJ4lKrRAgZ@lists.freedesktop.org,
 AJvYcCVC7wnvL+dS9QVpkzevb75qKF0V2kIouGrnXlSsJqNmuIrs467LXTuBpVMoS1bw0tIB0JNtXQwD+tU6@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyKXP1flmxzh8CUSI+ELnUqb1PhuLxtfI4Oq4nA84Gz4sF5KjZ
 U+n6F3BOkNeVkT1eaSPl9LmzJTy+5N+1LLt8tYGe7wG1PWmZ1tDNIKZn
X-Gm-Gg: ASbGncvEk98Xgp/z5gU2sOhjTCcBPo/4bZaHx/kdX5uxqRUbtxO4GZr7uFYILojmw2M
 oE4YVGg+1cgZFFFahnhTFe2AJ1+b04l4WUpARkDiC3UCDYHqS0y1H1+KAshjbwP7nPAkIbmnuxL
 FkZ4Cn4txw9UMh7FRIqdSsPX41TSh1Hl0CA/GjQMI88tzi+4ARacepJjeZk/o6C6PEKHHalw5po
 EsS6Z/wHPIv+CQd+KWR/z66+kZZ+PJN3uGFmYsWw6/7eb1CT+L6B8JARDOUVuzQN/YXT6mwTijS
 k10PERDiDdV5YjDc4JfLMqEYjjOikN0EBNWteuiuONTOGDhFMvWXQLdJbY5cjBf9TuFNAQJLnec
 sBOu1LnxIhZ+yuyKmciWCeoubSa0x2d7Mdu2Vxcwkk7HVUocMp/UyCSno00xrbs46YUw1AeTjjM
 96u8hkWHA/FD4TYbO8WaXiOmQ=
X-Google-Smtp-Source: AGHT+IEkAFQydYpFJvb1kzqjmURuxfZ7yJ+hop2qWEkeOQ2xbV3exZjxsMe8uB4jwvdg4HEc9Ir9zQ==
X-Received: by 2002:a05:6602:6206:b0:875:ba1e:4d7e with SMTP id
 ca18e2360f4ac-8816832db31mr945512039f.6.1754193560218; 
 Sat, 02 Aug 2025 20:59:20 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:19 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 31/58] dyndbg: add _DPRINTK_FLAGS_INCL_LOOKUP for +mfsl
 flags
Date: Sat,  2 Aug 2025 21:57:49 -0600
Message-ID: <20250803035816.603405-32-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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

dyndbg's dynamic prefixing can get expensive; each enabled callsite's
prefix is sprintf'd into stack-mem, every time a pr_debug is called.

A cache would help, if callsites mark _DPRINTK_FLAGS_PREFIX_CACHED
after saving the prefix string.  But not just yet.

_DPRINTK_FLAGS_INCL_LOOKUP distinguishes from _DPRINTK_FLAGS_INCL_ANY
by selecting *only* module,file,function fields to compose the
cacheable part of the (+tmfsl) dynamic prefix:

-t  thread-id. not part of the "callsite" info, its from current.
    doesn't belong in the cache. it would spoil it.
    do it in outer: dynamic_emit_prefix()

-mfs  module, function, source-file
    they are "lookups", currently to struct _ddebug fields.
    could be accessor macros to "compressed" tables.
    then they might be worth caching, ready for reuse.

-l  line
    this info could go either way.
    I elected to include it in LOOKUP, so in cache/inner fn.
    this makes cache larger but avoids sprintf %d each time.
    smaller cache needs smarter key.

All enabled together, they compose a prefix string like:

  # outer -----inner----------------------
  "[tid] module:function:sourcfile:line: "

So this patch extracts _DPRINTK_FLAGS_INCL_LOOKUP flags-combo out of
_DPRINTK_FLAGS_INCL_ANY, then redefs latter.

Next re-refactor dynamic_emit_prefix inner/outer fns accordingly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 0f7476456614e..d64f13a7a7394 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -40,10 +40,11 @@ struct _ddebug {
 #define _DPRINTK_FLAGS_INCL_SOURCENAME	(1<<5)
 #define _DPRINTK_FLAGS_PREFIX_CACHED	(1<<7)
 
-#define _DPRINTK_FLAGS_INCL_ANY		\
-	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
-	 _DPRINTK_FLAGS_INCL_LINENO  | _DPRINTK_FLAGS_INCL_TID |\
-	 _DPRINTK_FLAGS_INCL_SOURCENAME)
+#define _DPRINTK_FLAGS_INCL_LOOKUP					\
+	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |	\
+	 _DPRINTK_FLAGS_INCL_SOURCENAME | _DPRINTK_FLAGS_INCL_LINENO)
+#define _DPRINTK_FLAGS_INCL_ANY						\
+	(_DPRINTK_FLAGS_INCL_TID | _DPRINTK_FLAGS_INCL_LOOKUP)
 
 #if defined DEBUG
 #define _DPRINTK_FLAGS_DEFAULT _DPRINTK_FLAGS_PRINT
-- 
2.50.1

