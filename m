Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E6E9F044E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 06:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6ABA10E074;
	Fri, 13 Dec 2024 05:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NKATDm9k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DE710E074;
 Fri, 13 Dec 2024 05:46:52 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2161eb95317so12934855ad.1; 
 Thu, 12 Dec 2024 21:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734068812; x=1734673612; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yq/q3oQ+1coBzSyYiu7PIQ9YY0FE8S8wlVnD6GFmf1s=;
 b=NKATDm9kWEnh8wI6I25i/UyYOqc8SqyoqKlWX3z5D38k3QbBN/L3Q0SosEl5hoCXyp
 mGXKC1g5TIqAmozRuXW+o1Nz5KkCATM3Qaxg6I57oFw4HJXhCmEpHjok7z+euo6jWb4o
 eIckCEw3jH1VTChWGNhjrPH9YKus1ab0tUzojQfZiWobejOnhi5e8VEZ3onL8jr4uoil
 mFpqdga0Ixa/kMMlVR2+fscvcqEvXCu9Ir7Ns1ZrU+3BOvWqcWYagi4UPbbMTlde+ykE
 HNEBXne75ZNuI+mfvNcSM1Y12z7yXlFlhclFh9F3r7o6gWczSs2uyP2i7ZIzRtXJOzEj
 TiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734068812; x=1734673612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yq/q3oQ+1coBzSyYiu7PIQ9YY0FE8S8wlVnD6GFmf1s=;
 b=N1N2sYKl+olTQmXmhEcQMS+otg2RvcuVkW0gQyyHA2A6ScxgkuCkLekhMGtLcCdext
 M4GM9Z49f8EaZPlNFj6QeWbQu8Cz2EyD6JitfIqdnetaNdqT7IIXP6oXhRy1s8x5uKrU
 eZKLH9IXa8UKRRubT/4z0Zjr5n/2emw8MbmVHVwX6kj6TZtDKBP5FtRRrU519viZVXyM
 4ju07wgl5V6Y3anH6gSqZcpr+5Y9nyS1nLls2MSJZ97clzcXv/Z77vCYi94o82SbM9/M
 3PBZQvoFBbsju+v9bTiwSZftNE3UaEPmNhz6x609pZNJ3JBJj13C3hiL+H0OqnTIXB8A
 RIlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVV6c+BTdm+daVY7T4bcu20MT5YbzKYpHqniQKxKQFNh8kjjvCnPU68Hqq4TCTGAAtpa1/41rxTw==@lists.freedesktop.org,
 AJvYcCVQMvoZsOewL0hs2GJ+a3EPDOykQI7JI4/ugNkkLc7UPpI9yL9wkSFiEaKXog6aaSfobNDNC3T9i/c=@lists.freedesktop.org,
 AJvYcCVjf1W3hvkE8c3JCWW6e5sF7kh1jTokhjmpVgFYCoCQ5utQPXJ4LEKYNJs7oO3HGj2M3K9f0TMuMpU=@lists.freedesktop.org,
 AJvYcCX3zU5+Vsu67wMvoG5i44kiWJdwaVvcbxW4Dw7Elo1vvt9X3SB1TEkUk13DwHSlpHYnSy6rknuG6ZF0@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6UzLbAdFP5T5w9TKeXi6Wh+VSvFtuitFJu0RaAi2hQiCuXaYQ
 Uy50iIUm+TGsA0mpmc9w4dy3M/doW8Mh2vBQQg0RdO3zIjWGFTDx
X-Gm-Gg: ASbGncvcR/BvKqvh6PbLuFEdV7woJZ9a/SHglt+uZPELWgfyVLPGQCB1Z65Dv2L5T9K
 8W8ih37ddvcpd3XFYt6EVD9Pl3GyWxMY7EWJFAp8+3Rs4N2ceDt6BIvXV/ga7/+kFneXVKOaf2l
 qlzL1LFhnUmjR1tx0PdFQGk0o2WfT7aWjFHPnXpXV4qNpy+cgswzIQ7PelApLYqhYOdn/E2RsPI
 NBE254HWlgytxBsVD9RfLp8zbwmqV/kyW2e1qcHP4vnST8LpIlT8qCXeTbJztCCBmpdMvMrcWHj
 UFltnNo=
X-Google-Smtp-Source: AGHT+IFWBnsyszL3fKLErMwBwi/nv5YJk8bNHSLutoorKV6bDApMEi8hBMM4652Yq5VqnH7LBX6qQg==
X-Received: by 2002:a17:903:2a8d:b0:215:a3e4:d251 with SMTP id
 d9443c01a7336-2189298bb21mr20543965ad.6.1734068811964; 
 Thu, 12 Dec 2024 21:46:51 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-216483dd292sm82564985ad.226.2024.12.12.21.46.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Dec 2024 21:46:51 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 x86@kernel.org, linux-snps-arc@lists.infradead.org,
 linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev,
 Yafang Shao <laoar.shao@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 1/7] vsprintf: Add %pTN to print task name
Date: Fri, 13 Dec 2024 13:46:04 +0800
Message-Id: <20241213054610.55843-2-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241213054610.55843-1-laoar.shao@gmail.com>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
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

Since the task->comm is guaranteed to be NUL-ternimated, we can print it
directly. Add a new vsnprintf format specifier "%pTN" to print task comm,
where 'p' represents the task Pointer, 'T' stands for Task, and 'N' denots
Name. With this abstraction, the user no longer needs to care about
retrieving task name.

checkpatch.pl is updated accordingly.

Link: https://lore.kernel.org/bpf/CAHk-=wgqrwFXK-CO8-V4fwUh5ymnUZ=wJnFyufV1dM9rC1t3Lg@mail.gmail.com
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andy Whitcroft <apw@canonical.com>
Cc: Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 lib/vsprintf.c        | 18 ++++++++++++++++++
 scripts/checkpatch.pl |  6 ++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 6ac02bbb7df1..bb1018d79655 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -2273,6 +2273,17 @@ char *resource_or_range(const char *fmt, char *buf, char *end, void *ptr,
 	return resource_string(buf, end, ptr, spec, fmt);
 }
 
+static noinline_for_stack
+char *task_name_string(char *buf, char *end, struct task_struct *p,
+		       struct printf_spec spec)
+{
+	if (check_pointer(&buf, end, p, spec))
+		return buf;
+
+	buf = string(buf, end, p->comm, spec);
+	return buf;
+}
+
 int __init no_hash_pointers_enable(char *str)
 {
 	if (no_hash_pointers)
@@ -2525,6 +2536,13 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 		default:
 			return error_string(buf, end, "(einval)", spec);
 		}
+	case 'T':
+		switch (fmt[1]) {
+		case 'N':
+			return task_name_string(buf, end, ptr, spec);
+		default:
+			return error_string(buf, end, "(einval)", spec);
+		}
 	default:
 		return default_pointer(buf, end, ptr, spec);
 	}
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9eed3683ad76..fe0d80f55ce8 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6908,11 +6908,13 @@ sub process {
 					$specifier = $1;
 					$extension = $2;
 					$qualifier = $3;
-					if ($extension !~ /[4SsBKRraEehMmIiUDdgVCbGNOxtf]/ ||
+					if ($extension !~ /[4SsBKRraEehMmIiUDdgVCbGNOxtfT]/ ||
 					    ($extension eq "f" &&
 					     defined $qualifier && $qualifier !~ /^w/) ||
 					    ($extension eq "4" &&
-					     defined $qualifier && $qualifier !~ /^cc/)) {
+					     defined $qualifier && $qualifier !~ /^cc/) ||
+					    ($extension eq "T" &&
+					     defined $qualifier && $qualifier ne "N")) {
 						$bad_specifier = $specifier;
 						last;
 					}
-- 
2.43.5

