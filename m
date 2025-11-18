Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B6EC6B8CE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBE110E514;
	Tue, 18 Nov 2025 20:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PAdvdXZN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06C710E514
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:05 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-94895f6b144so248045739f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497145; x=1764101945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LLlQvuuD9MiSXKGka7d4IYEwieMdPmkGOdzcDHTOiMk=;
 b=PAdvdXZNRVHI9oH0M4cij+N7LSyEXvjPxr5TGgqMu5MZOAdPeo2etcFdTz+hBBhdF9
 wft0YuSmXCPe17MQB9wmXfnVi3Fia8OxPzixtJKROyZbMCpqTWqNlt+aFb93C0XGvexH
 aNU6lwmNyvE7oz+6dr2qVc9p7VVEA+01kxhG1nqVvMUJjImePBh0YCcINIzh3hjpwV7V
 8wPNJhWdYx+dbXvvvKoefJJyvdXvNZKnFxysolhA4O5NcSCc4RJ7QbSiPcnDGtb66rL2
 dOHt1KnFl0QiV86ou5gkB06H7i2HN/+nmY1ClKmz7POf5ii9ieZGZWNbe/v8vq0gTLD5
 +ZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497145; x=1764101945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LLlQvuuD9MiSXKGka7d4IYEwieMdPmkGOdzcDHTOiMk=;
 b=GnjVjdz36UmrKx4Sihh69/RxWbVPHi2E4Z4DNG58bKNl9vbVjLeGMzIyKjl2//Bajd
 YLWlvyJKcrEt4SUXNYRq3v9R8AroBgAintJfGSsKA8ljB/dXukNtmohGVxFXFtgDnbBI
 0TKilpU85fgldLQCqxOphd+ioBwDopgjdQjx4YMk4tOZZkXxxK53b/WXzQF4+zoZkUV7
 bRrVFLBpiJtmqrJjK4eHw5a7cHdH8ksmUiLYsFTWc0IwoSZ1CRI80VVLC7vCr+jBv9MU
 925cgXNulL3PRgjcCkfYQwSjFZzhVxS3lksGeXhtkKvI4pnqWx7nhL7OTl96eWGC3+e1
 H2rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKQ/sdaqhNzE6oK0gfqxz7JHzNEcAZIa18BYRPekO4DuNPYeew/xtV2RTJXYvTv73cXvQxhLkUrSc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNs9vl0JXKpYO/1nZvesPpozv60mHH6iYAjeOf1fa4oZFGRuf4
 RAqo3NVKg9M68P0fA74qL+9uZxgKKr+zNb1HDrebbWfvwqsdrWeOiDc6a2QdG97M
X-Gm-Gg: ASbGncsD1MfAXtbNVafhMUNdurT4deDCKQJ6eCMfzFxyA4z/rdKZJAJL/yyF/v5fNre
 ZSJFmHKXPeyqm5lXf+HBRrf09pyKe6RxWi+qwr5Zf1ucKrOOeVOWnZqPoi7cY9450mIO8WXLNbu
 xa5sScHeJgGAfuMpMTG/fILbfmnak3SjpItTdqmM5cSRtmMq0q01vSbTJGU4YpIwaKi/CcVrpU/
 IoExM6R+TFunQXEdcvM8mnSqLMwMCvr8bhnrx0Ml55O702LYQOZd1nms9KsamdnvoPh3nFRWutu
 3B9C7/bqPIKN7Tqo7EPAIPgAoNxC/HtfeL39tpkKYfzIDQwYOo+PY2pAjScbQ4B5CYE+IHDeNGE
 UUfmuIk4JUeEJ1czCGovpNhLsof5aM6DcNETOU61wqkiGjsar23JxFzCh0dZrmvyEDJ2/fU9G3U
 eMZmY+LT6lO6bTUFkSaveZAy21zrFi0soyEqwIQVJk0Bjpfe3R7N5b7mdDiQX1u9eoR7I=
X-Google-Smtp-Source: AGHT+IEIscdoyaRBlf+VL0JUqG2kMnrPA8EkFzQ/Jz5eax8vm0Cs6+BH6q+0DbWPfuhn3YzO7H5xxQ==
X-Received: by 2002:a05:6602:1587:b0:92f:20b8:7e22 with SMTP id
 ca18e2360f4ac-948e0de1a6bmr2212655939f.18.1763497144913; 
 Tue, 18 Nov 2025 12:19:04 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:04 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v6 04/31] docs/dyndbg: explain flags parse 1st
Date: Tue, 18 Nov 2025 13:18:14 -0700
Message-ID: <20251118201842.1447666-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
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
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4ac18c0a1d95..63a511f2337b 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,9 +109,18 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
+Note: because the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword values.  Flag errs will hide keyword errs:
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
 keywords are:::
 
   match-spec ::= 'func' string |
-- 
2.51.1

