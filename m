Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5324CD505A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 09:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1091110E5C8;
	Mon, 22 Dec 2025 08:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RQvrTyqo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD1F10E5CB
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 08:24:56 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7bb710d1d1dso5332286b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 00:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391896; x=1766996696; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kgJaffb+G8M2IXpwFpfYggq/3ogV1jI3bmNBB+yiGR4=;
 b=RQvrTyqooS4I1OuftFOJxV7Vemd2N0GjeH7zs5n+Cc3c2Wgu0PE2S0G2thVLoZgwvN
 B+Rv9O1y1bJpFrIPn065S8AA5c6IcfaQTCEretrk7dYigtGb2QNlWgGH/XSGpawoIUr+
 p65UhHMT2W/0bsKFjgSaP+AcR7LI3OE/8iCV3Uhb6Dz3t8h0sVJA4r319o8n6wn9ohYG
 02x7NExK4A+qbnE10ypC/f7CS1pCsMizQyJla1woaIS0b492HNAS/qGvLLP6ed1vJgjg
 dZeooiF8ETS59lfYbyFhViv1gA0y0b4NCq0n5VuB61UKlwAYgKnOgFPAjxVgY+Boz+u6
 bP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391896; x=1766996696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kgJaffb+G8M2IXpwFpfYggq/3ogV1jI3bmNBB+yiGR4=;
 b=JOjCiG73wAneAZBT4u50kj9HGM5LLbyDZ415WkySt/92BAkb5I5YrukRDU/RRLbmQn
 XTbFwpa1r6OYstfS4+X+ecGWa5CMVpnUg7XuB87+tB+7VugATFcS6b9XRenM1VEmEVqr
 voKlWk8bzjP32Q34JFPDzGPF4UFJwQ7DhxshqwlgTw6mSd5N+v613TG6BEHtnLHyPby5
 zdLOqRFR/Qp1jH8Tx5pNqaTaXaUl9/+HVA/lkK/bQ2iPCrJQwuwi1DF1LW6FmJ1E3eC+
 mKPEtgsQRu+mpCY5SWvpY2hANsNfmh7k2AwswYK0R0dM7W8XOj5cQuhtnkPZSG/3HJm1
 8pgA==
X-Gm-Message-State: AOJu0Yymp0YbV/lKMBJIh/bv8dsBP34H3zrffr7oWWAseA9M9FZS5PRt
 VIorwnch/rRu77v3Dyg5z+0Q3O1d1+1pmT6mGknpzFwK3GiPVNC7Uuri
X-Gm-Gg: AY/fxX4XEEYldzUVAf8kMnh5lKdJN7WV42Nk+pN5dk5GSUyxI9VdYiCaXyipJ8jdbcj
 qIWCmBvXJ8n9StCbjIqR2/n2GM6duQUOKHhcSAfYnRQ9K64N9CQAN7obsTeO+JtDhgd90kGO6F4
 hw5ZH1oBcIHnBJi7vXvBxjwEwsm/Dh/zP4FUApZ2N6p+P36KDSjqgM00KfCyqQUWOF9aFC+phV7
 FAVVZ0FzHMV6Wirdb2sTkaTssG4pCsOKHpk6xwXxgru/Rg2zA8NcQlvaw15BdxbXtutZKGQX/Oh
 ES203rGqscs7uVREGGSyabFrVl/DVfuO/55znUkc6Sg2sh7ozpFyqQyZNvcKfEYrbiNerYPsh98
 stXwSXgUaCbCBp7KCJs9E2MTJgMhuxe257XBi7Co/bplPAgVrp8I1aeMxLi+wyzf1r7A9IdST2N
 Cis5aDvZoM
X-Google-Smtp-Source: AGHT+IEBN8n7tfe9iu0lB0z5JyKVlf1YDr7ixcXKx8kSouS/KoZMy7Fhajpfqtky2YSRXNA/9ikrkg==
X-Received: by 2002:a05:6a00:1d12:b0:7b8:16af:3bbc with SMTP id
 d2e1a72fcca58-7ff650ce054mr9990683b3a.31.1766391896403; 
 Mon, 22 Dec 2025 00:24:56 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:24:55 -0800 (PST)
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
Subject: [PATCH v7 20/31] dyndbg: change __dynamic_func_call_cls* macros into
 expressions
Date: Mon, 22 Dec 2025 21:20:37 +1300
Message-ID: <20251222082049.1782440-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
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

The Xe driver's XE_IOCTL_DBG macro calls drm_dbg() from inside an if
(expression).  This breaks when CONFIG_DRM_USE_DYNAMIC_DEBUG=y because
the invoked macro has a do-while-0 wrapper, and is not an expression.

   if (cond && (drm_dbg("expr-form"),1)) {
      ... do some more stuff
   }

Fix for this usage by changing __dynamic_func_call_cls{,_no_desc}
macros into expressions, by replacing the do-while-0s with a ({ })
wrapper.  In the common usage, the trailing ';' converts the
expression into a statement.

   drm_dbg("statement form");

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index d543b84d447e..c4ebbccca5d1 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -217,20 +217,20 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
  * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
  */
-#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
 	if (DYNAMIC_DEBUG_BRANCH(id))				\
 		func(&id, ##__VA_ARGS__);			\
-} while (0)
+})
 #define __dynamic_func_call(id, fmt, func, ...)				\
 	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
 				func, ##__VA_ARGS__)
 
-#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
 	if (DYNAMIC_DEBUG_BRANCH(id))					\
 		func(__VA_ARGS__);					\
-} while (0)
+})
 #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
 	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
 					fmt, func, ##__VA_ARGS__)
-- 
2.52.0

