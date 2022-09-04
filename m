Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA025AC7B0
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4175010E1BE;
	Sun,  4 Sep 2022 21:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D4610E2CB;
 Sun,  4 Sep 2022 21:43:05 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id 62so5674429iov.5;
 Sun, 04 Sep 2022 14:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=gc3CEPtxYjk29+Wh9qd9Uhba+Qcycq/xTeA557V/yJA=;
 b=pjBlhL+ATdSasCB8eiAlDBtg6VQZe3cAxxbzs1dn4fhsTGll1ZJKZVPkMR2mAe6vQD
 +1ZUleBqb9yFLUkLQLuRp4esV7jUMm+9nkPY8LhEgMfb+aZzAVC2mkPJrqbpGbEQhkRo
 beZ5FNifB5rdJxWg7R8D5bcVcnK7tDty4bpm3uL/kbFe0gGnoJy6MFouLJWvzkGtbSFw
 KbDqjScDXUcFQ9R/5Be0XLDU0graPMWJvrt9XQvpuQIZmHQO8jVZA6GPpMTQquJWxpzE
 uymD2AvAzBcc+9sFlbROngihXuT8MzFti5OGgYB/TVQyB52NFye/DNbIZ9Wq82jlh8uk
 kuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gc3CEPtxYjk29+Wh9qd9Uhba+Qcycq/xTeA557V/yJA=;
 b=aDGqCwjdA+bWLEIBtyn+2NjY/j2CF/7TdOJRCEZHdERfGB1Z4A4segeRQ2oj/yeOSU
 k85aROVZZdqzYQ4k0oxHX5QDmTb+vvDOg5gjhTwDhDOkrqZ0ilce6rtU7IFgaRBc3+g6
 T0SgAZ1YdqOny+VsQwbmVrVir/RESYaLWFRfGCE9xYeeTzZ0UEPQSJZabuXwDGeWYQ/s
 BuRPDjXAx3tnFtn0lztTnYlpsmFwpbL6HrUsgFACFRo3HrMcC9FzjliMVF1QbsFYaRA3
 c0PD5G8dUyAb8xyq34R0CXkY8UhvL3ag6Mo5xYSrh3rWF5VhiodwEr7dA4ewyFGwPrN7
 dENg==
X-Gm-Message-State: ACgBeo3efeaURAKS0u/8VUQMvjU/QZ3jJvddx9dF7mbbZhrjGq6izDQk
 t8w0H6xnZzUhN0I5tIyR9ow=
X-Google-Smtp-Source: AA6agR62BzXzT17KlWx9uqQOlpAhM116jyafKxT3anpuAMgqBhik1FZ5pmVPGg2GE9QdKZVv5ooKrQ==
X-Received: by 2002:a05:6638:24c2:b0:346:ce9e:3eff with SMTP id
 y2-20020a05663824c200b00346ce9e3effmr25894336jat.262.1662327784843; 
 Sun, 04 Sep 2022 14:43:04 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:43:04 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 57/57] dyndbg: fiddle with readback value on LEVEL_NAMES
 types
Date: Sun,  4 Sep 2022 15:41:34 -0600
Message-Id: <20220904214134.408619-58-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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

my test scripts were writing one val, reading back val+1

  echo L3 > p_level_names
  cat p_level_names
  L4

fix this w a -1 offset.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 11fea1f818a7..7d458601a61b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -830,6 +830,8 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 		return scnprintf(buffer, PAGE_SIZE, "0x%lx\n", *dcp->bits);
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
+		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl - 1);
+
 	case DD_CLASS_TYPE_LEVEL_NUM:
 		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
 	default:
-- 
2.37.2

