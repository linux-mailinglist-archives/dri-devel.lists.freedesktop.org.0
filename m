Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3CD7C748A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 19:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9488110E57B;
	Thu, 12 Oct 2023 17:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB9B10E55A;
 Thu, 12 Oct 2023 17:22:08 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-79fe87cd74eso48034439f.3; 
 Thu, 12 Oct 2023 10:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697131327; x=1697736127; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wnBLKUk9O3xETUCsilAg0vyOCJCY1VGcTM3FhTYpKWY=;
 b=OHBozhDOManDQyVHVe8MdI1O5zns/ZLLt3KpLKdoKFIbUfMWodcxE5uFx/gGE3+yTO
 w7FKCZYd/G+B3ceaI1nbyGNwvnf5yHBO4wZVWp/P6eeQQU+ckjyf6AnEs1TeRJNypeTM
 AkxV3HX0PUEWrsHoWeWt3JQllu5sgu4kmMal1wN9Nj5XBSEmEDMub6MYBpkiVoPbnLaY
 /FBsBg3Cpkg0VILzSau9Np4T+QrJGX34Ik9wnU82b9O/S9MFvopwRzNNelrtodbki2us
 qD0OrDkkqvm2kwr9RobByhNsSL4h7i7agCy/D0BnuJ9vse5FWKHnueBJLtTvWpfMKmUM
 3BNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697131327; x=1697736127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wnBLKUk9O3xETUCsilAg0vyOCJCY1VGcTM3FhTYpKWY=;
 b=sQ6gkqmQXl9M6GuS8O15Q+kdFtV93oxtEFDUpHpbJeblMD95V8bqTFuarjxxWDq5WP
 4cX9FhZyjk3vVRRRNy/6QjuanDFYmqcH+z3gE699tHTv3/Kw8BKsdAr2oIknEXKoCI9W
 E9h4m8HaP6MGtbVKv3vrPxW1N281K/ixRQ5i0PlzHnBlOeck8vWsnyiz+YzUQyimBgef
 6f66X2Ll5A52Tfe03kKgEhCj8NTAZZcTHYdpv3CSwwtzNt/7mimEFNrP39amSuCP9DRp
 Q8N7f7DMu5KBhoSttitbs4bNtMfi0dhu6e/OK16Ew5ttJVUjucCiplVc/cqjvQo/RLFJ
 g1qA==
X-Gm-Message-State: AOJu0YzXP5a340iNj3xeCdV7kApS1vRzT2pLVK76d56f7dJxMY2u6iCd
 JwWj+PHhoMLhg/jB+7nvq70=
X-Google-Smtp-Source: AGHT+IFpbfRnBrgPW4IEW44BazUZxQseAXdtHGsGKsp7DLNKg8MghbtpPSrpD3uVR1lc7lXiDFp2JA==
X-Received: by 2002:a5e:8f4d:0:b0:791:2db5:c779 with SMTP id
 x13-20020a5e8f4d000000b007912db5c779mr30620110iop.10.1697131327569; 
 Thu, 12 Oct 2023 10:22:07 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 r25-20020a028819000000b0043cef0711c1sm3992211jai.158.2023.10.12.10.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 10:22:07 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 19/25] dyndbg: reserve flag bit _DPRINTK_FLAGS_PREFIX_CACHED
Date: Thu, 12 Oct 2023 11:21:30 -0600
Message-ID: <20231012172137.3286566-20-jim.cromie@gmail.com>
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

