Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B5AB191C6
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B4810E3DD;
	Sun,  3 Aug 2025 03:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gYo9DAwI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9EE10E4A8;
 Sun,  3 Aug 2025 03:58:43 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3e3d7b135c2so40558315ab.1; 
 Sat, 02 Aug 2025 20:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193523; x=1754798323; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5LKFK2FQkGbRBipMPdzUP2qSKsnxzgWO8ffhfoPvu04=;
 b=gYo9DAwIwGF57UNx3UDfLJ7aMDyxsWy2A0kc2TwnHqNbKP7swbq+WU8BFie+EthO+6
 paMXrP4FGlAgHbH3OUKkN8oX8H0tcvauvoc7LSPrNEKiWP2r9F23uggDHp3xZwuZ7KsK
 /wV+3K8+7Rnq312ksBu3imS7ftj2FgM+D8N7Prls6LhZuZM2uHIgOyg5jWn6IkCfSZaI
 /EJEEu4yesV33JdIXDAhU9futy2B44ihNOBbjs/3O1xIQS12ceGaKV6BiMhUZRpb7dzg
 Sgus/aDHoIBjkgkzYMwmLAC2VpfPOHVKS+plvjyjr2TyU5YQ5jVmS+oKMhenU+qetCU0
 ek9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193523; x=1754798323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5LKFK2FQkGbRBipMPdzUP2qSKsnxzgWO8ffhfoPvu04=;
 b=tdtvp/uKR0uGUfaomXEedf7eJbt3X6l85Y4dNwArnTxaQvlWEbAbwlJAIKFnt5Fuip
 R0HCA7pNh7xmAyD0Ko2D7L19sCFes219/9DKGBHnAgs8c5ejJbL1X6lw9JRBgehPsei3
 zCWdxDi5y5+DzjnhUc1Yy9fNdIxPsDqwr32oNvPNFLSpjbANh7nZFh8dKRB94Yz+vDdM
 aYp+8QH7ZsbXvImUQmlPISsGfkZaN83p7VEZ+v35tIm3pvlKi0C7fMA+9TETPVPzuR7i
 0Vv6/6WdH3T36CCxYR/eUSs3l7zJSnfPEL5qo5DZK5ZNWBFCyqBM5FjD71kXu9Fuga+s
 KNZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+uW6SB2UIAhUaPtgIELzU4rk/Rhq1/A2I9eyW+ODWeV7weRtW707rl4+pwRFJOm8+NZ7rMFfqmw6IDvPl3A==@lists.freedesktop.org,
 AJvYcCVkSIClPToMjFHO8vEHb3Lkij1phcuWuFohXhpJUevZ+NPVNjnuhy5Kf6PzagkHUybpMgOMSKzwYgi8@lists.freedesktop.org,
 AJvYcCWjLZWJrg1xGAYqLl2HzD5ZQO2YDbvEaQVF6myQo7WXCVT3DP27ul0pFVkFIIPPtbeue5kKiZJn@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yylwtaq9tpXIcI1vfTHLZqkNDla52SnkIJMbgfAeEU8EWPzR5Da
 +ZygUIyQ7YAoX6oQdRgyLMnwSBZNB4iAoHquedxf4ZW3uGid8QJvGWx6
X-Gm-Gg: ASbGnctsB/CO3L+sk0c0oe5G8SVHO5vf3MXEBG1Z0SonwOKOSAHnnhZ7MOqeKjQXc0+
 5IhzjzBzwFF5YkEPp3SOfBs/xjsZWsKdifvETWo24KZR3RLTeT2S5k5mm4XmhEGO/pBMS1KQnBY
 C9rOFlHqzgK95wIU9f+KE+e8Ye21aVlttWYnxOUfjIq95CmADUwftUSlIUBOjjKs+7f4Fuko8Nm
 u4GIUnKS3PzJzk/NjKW37Bw2OmEFT3UXCyL7N+jn68GfIrzP5YvagVFRa71lsQGS1iTgmIbak9J
 KA4yvk8L8sEwkuaGY5w22vJ+gF75Pf1J9wh4RuLXYD7hy4OhuC2744CexKBX5UuC/O38drTWqkc
 0W+uJHQ7+0pizqGkSvS1eV3cw7PavyMNJbFILZUSDuzKb/QUsEURFRR0GZUlqZpRlgJACJPAnlU
 UV92sUfkbruTgNuGyuz0QBb2Q=
X-Google-Smtp-Source: AGHT+IEK8/vwYm1R/fsAxFG9PU2vcozrYZR6RghCEJBk18PG9+D3j285L0ye3PQbY3Q2FqB5Lv0cRw==
X-Received: by 2002:a05:6e02:2220:b0:3e4:1162:6761 with SMTP id
 e9e14a558f8ab-3e416128e06mr102803815ab.9.1754193523038; 
 Sat, 02 Aug 2025 20:58:43 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:58:42 -0700 (PDT)
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
Subject: [PATCH v4 07/58] dyndbg: tweak pr_fmt to avoid expansion conflicts
Date: Sat,  2 Aug 2025 21:57:25 -0600
Message-ID: <20250803035816.603405-8-jim.cromie@gmail.com>
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

Disambiguate pr_fmt(fmt) arg, by changing it to _FMT_, to avoid naming
confusion with many later macros also using that argname.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 55df35df093b0..2751056a5240d 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -11,7 +11,7 @@
  * Copyright (C) 2013 Du, Changbin <changbin.du@gmail.com>
  */
 
-#define pr_fmt(fmt) "dyndbg: " fmt
+#define pr_fmt(_FMT_) "dyndbg: " _FMT_
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.50.1

