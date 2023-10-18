Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D967A7CE3CD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1B310E435;
	Wed, 18 Oct 2023 17:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FD810E431;
 Wed, 18 Oct 2023 17:06:32 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7a66ff282baso22454239f.0; 
 Wed, 18 Oct 2023 10:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697648791; x=1698253591; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wnBLKUk9O3xETUCsilAg0vyOCJCY1VGcTM3FhTYpKWY=;
 b=F4tf69JBn7ixs1tRqRMC81xc8On95/Am9DzqPISd+W9653h25MEWi/tDsTIrf7lzuO
 X6ReyR1oUh+U+9KMb5xYrhDWzEeI3DEGMCrdvXCZ9FcZ/WoimRDy9T8B2eN+jvqbICCD
 JkiUOZZ4HoBkjYPRhD2lVaVDXEBmZJS1TA3BySXsKWBXSaVD6jlNxvz6egf5VHX00g2v
 +Lu3xw4lKyZYgQqpU+gicmHsmVOgMDXEabJhgIrMQUS2pSNh4qXj506TqpSN/icZxV+w
 NR9hyBpzs1hdi4/gzYMBFUCXv96/UEj9g5KnWS/4QX553X5Sf4nXLZ/bITiKy/BkC7+c
 rxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697648791; x=1698253591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wnBLKUk9O3xETUCsilAg0vyOCJCY1VGcTM3FhTYpKWY=;
 b=DVUuEqsZbVCSiqpbEmNFNBnCw5FN64wu8xaPb62UmeKBue+eTSHbZAVnri7zMNrhwb
 SPozXQ8L0e5cuR2JWTJ55451Wi+w3a/skeBiKeXyjxQ8GdAC+ncs3cvFFmBU8Cg7M4fD
 NkPdOLfAPm7vxA6Om0pM9KsfVXeMGqCYk469vIbTmnEJH2U/3GLh6l9B9Fi57Lm3rQ3X
 2lS47Fd2TuuVcmLxAgda7mzOkHaNjGpfrlgVXsePXNWfYvwENh0DTCBQmBieZI55BzUx
 FhTwKulIeZdwJU7x6MWaGuUGgPDaXXADVgXhJF6ROlQGjm4ySVz6ylBGCyMFTxvr1crF
 7Vfg==
X-Gm-Message-State: AOJu0YyG2TNd8SJzBzdtDd4nfO4PMJ7jFu3I2M8fotOpAXxx5UlBt08o
 4hsQB3KhA0Z3fl0qWk8miYw=
X-Google-Smtp-Source: AGHT+IHO6nI4UZVkO1MGJLmf3+IhMzZwOIgWYzq9QH1/8ZQ3okxX0Qw82NbwAuFhs1VVKVleGTXhcg==
X-Received: by 2002:a05:6602:8c6:b0:7a6:793d:2079 with SMTP id
 h6-20020a05660208c600b007a6793d2079mr1483172ioz.1.1697648791342; 
 Wed, 18 Oct 2023 10:06:31 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 n4-20020a5d8244000000b0079fa1a7cd36sm1228944ioo.30.2023.10.18.10.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 10:06:31 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7c 18/24] dyndbg: reserve flag bit
 _DPRINTK_FLAGS_PREFIX_CACHED
Date: Wed, 18 Oct 2023 11:05:58 -0600
Message-ID: <20231018170604.569042-19-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018170604.569042-1-jim.cromie@gmail.com>
References: <20231018170604.569042-1-jim.cromie@gmail.com>
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
 rostedt@goodmis.org, mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com,
 bleung@google.com, yanivt@google.com
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

