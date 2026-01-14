Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 325E3D1C018
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 02:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C36B10E56F;
	Wed, 14 Jan 2026 01:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rlahjvib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C946A10E56F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:59:00 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-3ec6c10a295so3646243fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768355940; x=1768960740; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dFfaj1jg7DkAQbZ2xQqGZ0nerYqYJ2u1eC/UX4LEwiY=;
 b=Rlahjvib7sQz8nFQoDzQSdNdqeJ/h8X52SMoQ1bpi4NmM8398BTPYDFsWrb5YKuzn6
 bOU/SEjYHYiN3gMOZok7oFo2quQshNbEaXi6gN8mXat6rx/4ehMeLjRCj5JR6NTasoXR
 Nd54W1TUNtitZJ+hjYhmVLQ6SaNrZbM2Jl+l5vawWJ2IpZowleLK6U/IYLqsqiMnpLR+
 rwRqoz1mUEVErhCuSeXiYq5XphB98+3xGMaBK5GtRH1hAsja75Qi79zt5uAgGbp8IwH9
 vo15Aqn/DJc5y4+rhc3X576XAW5H7kqckdMHiNZqhCC24XmAA7EV7ZXUG8gAeg0FvYS3
 F9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768355940; x=1768960740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dFfaj1jg7DkAQbZ2xQqGZ0nerYqYJ2u1eC/UX4LEwiY=;
 b=Fcry3mQDCzepNlNzD875UkGRpOKgSfed5SWkTfVTeEJ7xaYNkTsSkLrCV6XC6BVwiv
 bZ4QsPPB5uRsdH924tWxviTKdDaVQZpJRDUzugojWukwoJbCcX6SxvnXzGJVgIXcR4Pc
 sdVu6vIq7wy2TgIMleEdLMxc/ZeF7bJ3zEwALm5+otF5SMF/KqHErPkDMH3Pplv6qo8h
 FpsZnDmZIyEhERmLNdxJ8Rr9wZQI8lzc3IhbAU1I9oVHOmNuwGh6xTm+phCqo3STf7V5
 4ZkQ5lFUcs42FZbYDWFyimryk2Qi9tYeeaqZ9OVfnsj1/mbzQXGZOcXmbKhGl1sAHTSB
 X++g==
X-Forwarded-Encrypted: i=1;
 AJvYcCViAeN064ABiKllPiZLoZZwyrJV1SNyMaAun4UTCtUek09pSUIODduxZCI9fHmb/CUZ9HJ8bdTthgQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHl+DDo4CuqYa9reeXTS1pJjILch1i2oiz5tzNIquGqt1Ad9/j
 pVtrTWPIprDv55YJWxW4toQAQpXfbhz5OPxB7KH9u3aggj9InAo1Bvhs
X-Gm-Gg: AY/fxX7Ao7V41I6IYGn7EXtcjXJF8KGJzqphujgdSi9lKtUALZBDifq0RuQRYKOH6Rd
 VXz8N4i3jQLqayyCOq1wLuM4lj9WaeK8+thw7knHMW8hO9hX5vwGpDNkmAqzpDgPwmhMV3nrWZ+
 hy8gIef6q4EIUI/Mq9mmCrSXcxDf0xu7R7FmwibC2FmeODAGzzFVzDJ/uc+x88Tx8Y9OXbXaiuR
 QpX6WLxXf+0N6spgO9sJi25HEF/Ly73DFVCV/lXRzVQ20vcxd6+DhfBqhh8grdH6dwdXLqXm15S
 q2Cy/X+whVAzz7AQMdQdtnmBF/JUUFbsZL1pP2BagL9PjfDjyaNY7nA3JLbuqG+oy9gARvR35zu
 pbjlyl0uatTbi9bESmgh0fYpG8fLh+m/wN8U4qEmXB2rj1wZ5DBMn+PIghK+tfFY3GU9g82I66q
 gohGipQ2eYA4jIH3ABXlMUk6p1jTy6y0QHIImM
X-Received: by 2002:a05:687c:409c:b0:3f5:d9b0:567e with SMTP id
 586e51a60fabf-4040ba70e63mr407331fac.14.1768355939842; 
 Tue, 13 Jan 2026 17:58:59 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-3ffa4e3e844sm15596198fac.9.2026.01.13.17.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 17:58:59 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 04/31] docs/dyndbg: explain flags parse 1st
Date: Tue, 13 Jan 2026 18:57:20 -0700
Message-ID: <20260114015815.1565725-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
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

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4ac18c0a1d95..e76ccd987704 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,10 +109,19 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
-keywords are:::
+Note that since the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword and value.  Flag errs will hide keyword errs::
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
+keywords are::
 
   match-spec ::= 'func' string |
 		 'file' string |
-- 
2.52.0

