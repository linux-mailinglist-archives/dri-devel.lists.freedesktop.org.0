Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFBB7CE365
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A3610E404;
	Wed, 18 Oct 2023 17:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CA010E3FF;
 Wed, 18 Oct 2023 17:06:12 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-79fd60f40ebso175703039f.1; 
 Wed, 18 Oct 2023 10:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697648772; x=1698253572; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ctyB3lbzkdQhDzqOoTWBErv3Q5efkvJrKvFBj8oTC8=;
 b=AgPAeisfdmKoBSbTak3/UJvoG2iy2Zp80N3DUOoaXJ9kOlTW4XSqT3WK9HgjZPzpOr
 gNawq1qs2HUaymslgsOEBeGtT9bGiEBIqaK/o5oSuQOH49KOygHAQhb12CYbFUs5dHSu
 y/FdvbY3uHQBgTq5qRzWRIuc7bs/0baaeajPOh6aje6DGyLeY+3/yYpFTpmZL497DYcR
 2lyZ5oF0W5m3LRA5Uo2hg1eBlXSYMh5/IPA+Kn8HoTrysBkwmR3kct+SFIJRjPTjqAGq
 Y/xN8ZQhLKSvo3hAbnsGlFp306UfXBZNk5QG7uHfK8Y4nnq9bPJDACzm099IP7XQrQ66
 na2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697648772; x=1698253572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ctyB3lbzkdQhDzqOoTWBErv3Q5efkvJrKvFBj8oTC8=;
 b=sWN/FjykgjorgLSnHWad05yUrlKI0oOI2hvP+tQUoDkAGs+O+gvmIr22Xuo9OSzdkq
 zG6HAhrhO1FUEKB1cmXaxJbw25xAkzlqGRr2xdV/ceTBiL2BAoDWAvmUuhD26KBKYrcK
 j0lvaczlMz/MrYgoiLOpNmHYoabGr4/4vn/4k4bRAAWbQgWEAob5hulJt1msAiXSxWPM
 aSfBHv9Y+v6a0b67A6xZFRmcI2A/y8oMReLaLdDD34bCp+0LkkA1gmvNbFP4MKO1x4OL
 qqbRCzhThADh77zkOCWPXhyVHGdTx1DYLkf/ByGHmSmxuovTMJPVA1TDGXAYu288iGQ+
 XdVw==
X-Gm-Message-State: AOJu0Yzs1VbQ/jC8/6jAbYhDMF21naqAOT7eMOb6sVEGcoPoWD6BE5oo
 6A5pUtIeAem/Ea9Z3Tugazn+4je7jFChGA==
X-Google-Smtp-Source: AGHT+IEVOEqYR1bLjUL265nBqQl4ufL7qKQgsJ6xo+Ioj0FHEoq+lERcF7qknhIgjNBA2fErjZMwUg==
X-Received: by 2002:a05:6602:158d:b0:785:d5d4:9f26 with SMTP id
 e13-20020a056602158d00b00785d5d49f26mr5816349iow.9.1697648772072; 
 Wed, 18 Oct 2023 10:06:12 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 n4-20020a5d8244000000b0079fa1a7cd36sm1228944ioo.30.2023.10.18.10.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 10:06:11 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7c 02/24] dyndbg: reword "class unknown,
 " to "class:_UNKNOWN_"
Date: Wed, 18 Oct 2023 11:05:42 -0600
Message-ID: <20231018170604.569042-3-jim.cromie@gmail.com>
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

This appears in the control-file to report an unknown class-name, which
indicates that the class_id is not authorized, and dyndbg will ignore
changes to it.  Generally, this means that a DYNDBG_CLASSMAP_DEFINE or
DYNDBG_CLASSMAP_USE is missing.

But the word "unknown" appears in quite a few prdbg formats, so thats
a suboptimal search term to find occurrences of the problem.  Thus
change it to "_UNKNOWN_" which properly shouts the condition.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 6fba6423cc10..ceb3067a5c83 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1151,7 +1151,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_puts(m, "\n");
 
-- 
2.41.0

