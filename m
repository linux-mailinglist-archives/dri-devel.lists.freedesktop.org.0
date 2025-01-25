Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ACBA1C137
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B260F10E2B2;
	Sat, 25 Jan 2025 06:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SHTw7X2D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549CE10E120;
 Sat, 25 Jan 2025 06:46:38 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3ce873818a3so24590735ab.1; 
 Fri, 24 Jan 2025 22:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787597; x=1738392397; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AU/BJVCrYw/L98CqP4xWM6IdTrod6CaHL5wpnn7zk9I=;
 b=SHTw7X2DXqBHpSIX/O5EttJP7Ntw6RLuDvFAy4g4NZAWRzFFKw9mucp+10xW92MmNW
 ZnCpoM/jmOW4iV8W6gAefSboR6HvBUmK3uuduwhnU3NWsBjQXdnFQKctHdcC4Jd3969h
 E3cyoNnky44dfYWhR6tb8cb8FlLVAPqGr30lAYSAeV06QyFo9BYlHgZF26dZmK9VzN2f
 I2ma5DmhmQims8DfGw/I2v40OGsdbFSYxiKdWfCPButVhX1Qdjr3paeWf+KdwQz7W/P9
 8U77xAK9QgCFNwq6b9Rk64bgNKlJpVdzj4CeNge4oYmIKp+42d5YbPYmk/ElSNR0HpZI
 QeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787597; x=1738392397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AU/BJVCrYw/L98CqP4xWM6IdTrod6CaHL5wpnn7zk9I=;
 b=fdS5ow2Ermji9CwQD1v2J6dRegg5SRBCkoovRb24EoFWfWD+sNjL8JWm8v+G4m/Tkl
 yDP5ygaqlpzZigiA4w/+bP+hiOmaxhl1jhNc6Qs8EOHvY3edhQR4Sju2noqPFs4oIiyv
 KL55zBcKij21vvL+gFnz7UCZu4ME0Qc/WTiU7pDEZfuoAfa/btnBRXQ+aCdlQHPOj170
 1HtL6Sa0oW+cwFrwUs2tXJeQq5wwRM2G6loyo0E7MHoW2b4q+eme+LUtyKJI7ZV0yZAD
 MhAJQoo1Th6HhBBcP5CMxOekZyfw0ygHe5w4ExNtX2nQ6xsj5pou/PPapuLNrFjbIno9
 2xyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSkQLSJeZ+UpLBYt6XO/HFuUkVa3HsuALtkHYflgw2onEkFy9I1O45ZSfoegvHIVviJfDv4Jv9@lists.freedesktop.org,
 AJvYcCWTUOOh0jq5lgxueNm7bSvpbQJUgEV8Chu1ElWfFAxZiSGDY18wabMvrHaKAIjlZmhzPyecQAA1L3MO@lists.freedesktop.org,
 AJvYcCWuKGX5QOqtQj0RBFQUSiGeX1ySjn2dR4Cwiswm6hzR382GyVmgcdxGOBDIW3QD+ti4aE6EtIMjcMd6@lists.freedesktop.org,
 AJvYcCXvWpFE8D4WQ3Igj5u0duZcLmvk/mlzIN3KloUMBzbLzKb8pztrmAT+n4XA5HqZ0sLllvJ7osf5bm4DsPOhaQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yykl2bXh+6xoGfC5Y4h8KGPW1HoG//6Isopi8ksf104CNDYTIiz
 rhFUVXuYtj8/HH8qTp1PcbP9Qi2CGRuPUTr/OvnvAAPCSDQljius
X-Gm-Gg: ASbGnctr0RCysA5XS+OkmhSuM3kiZA+kFw9Xg53O3YKz+5XsW9ZXVZYfc3e3Mzf3TdP
 TtCJ+/O2LGCtIfhD5kQdn5IkZS20QpzyGqXCX8ZqwM6OH9KYXLqffMjO/910727sriYr5INQHCT
 2XooGn0wam9xtb3AvvHnk79Gf1I5ENbgeejGkifP41sAQ1fOC+HrWpe2xIXbPjg/48WDbNCWzlY
 Ge0xhJoX8JASEM1uN9mQRhU6jbUwPf8ZbC2ZYyHugVdQQWu5En15f2vBGe5cVn+iXsQ3tGbgbk8
 /Exyn8c9lFI7C6GoXOz01P8pIRYjXZ9Nvovh5Q==
X-Google-Smtp-Source: AGHT+IGGQmsmMU4LyFcc13bApx7ltT6qUdG974W1OcN8PUVNTeEuTSdgnGp/+eHsAuANJUqP1kdN+Q==
X-Received: by 2002:a05:6e02:1fe2:b0:3a7:88f2:cfa9 with SMTP id
 e9e14a558f8ab-3cf744386c6mr233064305ab.11.1737787597495; 
 Fri, 24 Jan 2025 22:46:37 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:37 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 01/63] docs/dyndbg: update examples \012 to \n
Date: Fri, 24 Jan 2025 23:45:15 -0700
Message-ID: <20250125064619.8305-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

commit 47ea6f99d06e ("dyndbg: use ESCAPE_SPACE for cat control")

changed the control-file to display format strings with "\n" rather
than "\012".  Update the docs to match the new reality.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 7c036590cd07..691e0f7d4de1 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -57,12 +57,12 @@ query/commands to the control file.  Example::
   # grease the interface
   :#> alias ddcmd='echo $* > /proc/dynamic_debug/control'
 
-  :#> ddcmd '-p; module main func run* +p'
+  :#> ddcmd '-p; module main func run* +p'	# disable all, then enable main
   :#> grep =p /proc/dynamic_debug/control
-  init/main.c:1424 [main]run_init_process =p "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =p "    %s\012"
-  init/main.c:1427 [main]run_init_process =p "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =p "    %s\012"
+  init/main.c:1424 [main]run_init_process =p "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =p "    %s\n"
+  init/main.c:1427 [main]run_init_process =p "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =p "    %s\n"
 
 Error messages go to console/syslog::
 
-- 
2.48.1

