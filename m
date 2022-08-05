Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7899958B237
	for <lists+dri-devel@lfdr.de>; Sat,  6 Aug 2022 00:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C878AD91E;
	Fri,  5 Aug 2022 21:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAA512ACD7;
 Fri,  5 Aug 2022 21:54:35 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id d139so2863736iof.4;
 Fri, 05 Aug 2022 14:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Wy5iLP6AZumShjO+0eNESryd3jL0wHYWEmUuoQeB6Wk=;
 b=FJi9ZS8yNGWRuVXEb1kvd352nLf1hSziwSVWIreKLSVMpu8X1lYShDpLSG9DVDiQja
 82lnfmTC2tmKCrZLriqdeqfnM8e6qf48GgYX45/llrO+De/9603wtfNrO5/eA1JI0dDj
 9GaziLwHSRjV4Y5rbQp9HqPwwG/4cBnULRwRUkXoacFn1iUOiHt2LnRFGZCuTnpz+8Xe
 f6JsXNI1JUK5pPe9PVM2ltwYzcidAYcZlXtUUbQp0AlcSs1VB9kXIdc2/mR+4iNQObCx
 4ZDMAd560TWKJ3kItAwAObe++DeFtMS/nWUW9rAtgdHZM6tyOjviEK5TqVVn7A76ghSP
 J+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Wy5iLP6AZumShjO+0eNESryd3jL0wHYWEmUuoQeB6Wk=;
 b=7a62jqW/A296cOb8bSisSTjFcBlozmUE8OnHXEvI/Rlw+kJMzprj61nJu4DfQJGVCb
 GBEEqzBjsW/3qJFzySyuxZqIPp+eheOXJqINDujW7McV892cSlkKATt34sJgldhMHeF7
 Uw6Qs3EIxPTvcbHpriDCTpXeKTFOpVDb/QQv8n2cT56M1HrJyp6i5O0z4ZkZF+FwcIsV
 vdGjbhcw99yC7wgILzEqI/LqL8SoTsAyBn+I1Kv6hXYbOiBZWzjokLTyPhd3KwukDahw
 kXpK/cxARRSxQ+oM+M+vG4cl3jkzgz7orL23cA4F3NgBIy16TkTP79szB2LJBNrPEGj/
 xD8A==
X-Gm-Message-State: ACgBeo3sT3zDaDReXGwu9fyVagZu5j5HIQV5K+SiN37b+KUh1QnBLmpY
 ZV7CNUrSmby9KtiEC9K3Xqk=
X-Google-Smtp-Source: AA6agR5rftNopfD1MVDtLO+pW5nBNveJnieow1ouxMckvYPN9UxAo5uwg6bO3/M4RzbjvwaptL/vLA==
X-Received: by 2002:a05:6638:1408:b0:342:86c4:52bd with SMTP id
 k8-20020a056638140800b0034286c452bdmr3980760jad.119.1659736474811; 
 Fri, 05 Aug 2022 14:54:34 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:34 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 13/33] dyndbg: add __pr_debug_cls for testing
Date: Fri,  5 Aug 2022 15:53:35 -0600
Message-Id: <20220805215355.3509287-14-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805215355.3509287-1-jim.cromie@gmail.com>
References: <20220805215355.3509287-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For selftest purposes, add __pr_debug_cls(class, fmt, ...)

I didn't think we'd need to define this, since DRM effectively has it
already in drm_dbg, drm_devdbg.  But test_dynamic_debug needs it in
order to demonstrate all the moving parts.

Note the __ prefix; its not intended for general use, at least until a
need emerges.  ISTM the drm.debug model (macro wrappers inserting enum
const 1st arg) is the baseline approach.

That said, nouveau might want it for easy use in its debug macros. TBD.

NB: it does require a builtin-constant class, __pr_debug_cls(i++, ...)
is disallowed by compiler.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b6803f7e818f..cb4696c91901 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -221,6 +221,13 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 				   KERN_DEBUG, prefix_str, prefix_type,	\
 				   rowsize, groupsize, buf, len, ascii)
 
+/* for test only, generally expect drm.debug style macro wrappers */
+#define __pr_debug_cls(cls, fmt, ...) do {			\
+	BUILD_BUG_ON_MSG(!__builtin_constant_p(cls),		\
+			 "expecting constant class int/enum");	\
+	dynamic_pr_debug_cls(cls, fmt, ##__VA_ARGS__);		\
+	} while (0)
+
 #else /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
 #include <linux/string.h>
-- 
2.37.1

