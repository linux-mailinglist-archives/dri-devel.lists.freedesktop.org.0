Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 602E6626467
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 23:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEEC10E8D8;
	Fri, 11 Nov 2022 22:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1399E10E1D8;
 Fri, 11 Nov 2022 22:17:31 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id e19so3173581ili.4;
 Fri, 11 Nov 2022 14:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8/Lx+Pa2dFiRyEx0ifPOdZSFdKCDCLW5/FmUbDCcn+o=;
 b=gHpllJRNYJcNVB2eV+E8j+4S+LQqxPt4l27JqgK3prZ46SKc5hn+WWl94VK3n8to5v
 T4inCKYIozxITPtw84HPA3lfMJJumGfwdh5m1EqVAA9MENsQPgq/QvUhYrP2ABulqwqZ
 Svl2NLH33vYSDySxAjCjCbur6z4aSHGlva40wO189QFq3N1tioiNs6HydeEgAJGABjes
 3nN3q3O8jIC/ssTxL+ibWk1dinGBN64YngpQbJYFhq/nFE0sJiWgnezgGZA9495UNXF0
 lMzYeNfryArIiErwM9zlXJAk4dyaoH2Of2wtpDE0ioiu3zVjzKp2sTStVRfydgMGX29Z
 yr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/Lx+Pa2dFiRyEx0ifPOdZSFdKCDCLW5/FmUbDCcn+o=;
 b=Sn0ZlG9nqiH+uSr8/D9I6RUOEirGTcIWTpHFI8xbeZW4tbMZjurK7ks/J77H0g5n29
 gCjCtetiU8GAXTQaXS5hB96j/JCHiPpN+c6OywUHzUJE5UCwW1K07ywirZd3dIu8FFbV
 1LDJivsjL5S+0M0ADTBc6qq0LFkHw1ccjerHKgyr06ZbzGKllv3u1ZHQcyaq5jDYvmAU
 nB8mMorYwq6tdZJEog3CbFJxWV91LWV63Kw9TSMFPHrQX3wby6j+p5RFeVheBK7IMikI
 8upHghdJME3trRhsYbGXbSm+UMWXbD4I7ViCx2VMhY/nl4hpeL6RWwi8mTIR46ldOVP6
 HlpQ==
X-Gm-Message-State: ANoB5pkm+RhCFC28MYGtkrRdhtjO6FiPRb2MeEizWLgdyvKL4vIg7p9Y
 6Wn1FT7NEJKHT4Y0COsq37Y=
X-Google-Smtp-Source: AA0mqf4V6UIR9nWd3D0T6FPvRTELxE97Ao7nri/Rg7QowQy6sqit1lDf0FUhjvJblHHuBU5OpZXm5Q==
X-Received: by 2002:a05:6e02:12a2:b0:2eb:1f07:5a7e with SMTP id
 f2-20020a056e0212a200b002eb1f075a7emr1993165ilr.0.1668205050060; 
 Fri, 11 Nov 2022 14:17:30 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 c5-20020a928e05000000b002f611806ae9sm1113457ild.60.2022.11.11.14.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 14:17:29 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] dyndbg: fix readback value on LEVEL_NAMES interfaces
Date: Fri, 11 Nov 2022 15:17:13 -0700
Message-Id: <20221111221715.563020-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111221715.563020-1-jim.cromie@gmail.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <20221111221715.563020-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since sysfs knobs should generally read-back what was just written
(unless theres a good reason to do otherwise), this result (using
test_dynamic_debug.ko) is suboptimal:

  echo L3 > p_level_names
  cat p_level_names
  4

Fix this with a -1 offset in LEVEL_NAMES readback.

NOTE:

Calling this a BUG is debatable, and the above is slightly inaccurate
wrt "read-back"; whats written is a LEVEL_NAME (a string).  Whats read
back is an integer, giving the 'edge' of the 'low-pass-filter'

The actual test looks like:

RTT: L4 -> p_level_names : 4 :: DOING: levels 4-1
[   17.509594] dyndbg: "L4" > p_level_names:0x4
[   17.510115] dyndbg: apply: 0x1f to: 0xf
[   17.510506] dyndbg: query 0: "class L4 +p" mod:*
[   17.510992] dyndbg: split into words: "class" "L4" "+p"
[   17.511521] dyndbg: op='+'
[   17.511811] dyndbg: flags=0x1
[   17.512127] dyndbg: *flagsp=0x1 *maskp=0xffffffff
[   17.512604] dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=L4
[   17.513414] dyndbg: applied: func="" file="" module="" format="" lineno=0-0 class=L4
[   17.514204] dyndbg: processed 1 queries, with 1 matches, 0 errs
[   17.514809] dyndbg: bit_4: 1 matches on class: L4 -> 0x1f
[   17.515355] dyndbg: p_level_names: changed bit-4: "L4" f->1f
[   17.515933] dyndbg: total matches: 1
crap [[ 5 != 4 ]]

This -1 adjustment just reports the edge consistently with its
input-mapping.

Fixes: b9400852c080 (dyndbg: add drm.debug style (drm/parameters/debug) bitmap support)

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 009f2ead09c1..48ca1387a409 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -794,6 +794,8 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 		return scnprintf(buffer, PAGE_SIZE, "0x%lx\n", *dcp->bits);
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
+		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl - 1);
+
 	case DD_CLASS_TYPE_LEVEL_NUM:
 		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
 	default:
-- 
2.38.1

