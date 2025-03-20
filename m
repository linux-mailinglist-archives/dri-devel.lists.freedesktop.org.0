Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8C4A6AD68
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BCD10E6A7;
	Thu, 20 Mar 2025 18:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C6BJm6LI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7978C10E69B;
 Thu, 20 Mar 2025 18:53:06 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3cda56e1dffso7891615ab.1; 
 Thu, 20 Mar 2025 11:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496786; x=1743101586; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MlpyI1Cbu0G4E1iYQnKaYcyXlhpWchDiOL6/URF3toQ=;
 b=C6BJm6LIkLdeKfDiWRO6jclRW1RvXiSKnBy4zEEFlH0iyauQhNovzRgZ7mmQatIFE+
 yIn76mEGeTR6xV1sdrGOlDKC9KfnFTNVwtdjLYuJydINfD5s1k0Ldqnqc385qihMAAI6
 VcXWPbuzAI3RVYsEzpWBALW2M3TlE949IUB8NOszqww6Itn6jFUXJbBYCeyFsJBgdI6Q
 /mnE4Ap6+cYlJp1Hz+KOii/NiR0btFZdx+U1rb/RqJ8wLZDvETKsTdN0Oyy95GwvZEMw
 DxbdqwAIyMEDghoWnbsOTcFa+kwjjJKzPP7DmWdrzXIxqgtsC1kVtLoI76ZBK4RZlpQf
 xO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496786; x=1743101586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MlpyI1Cbu0G4E1iYQnKaYcyXlhpWchDiOL6/URF3toQ=;
 b=RVMwidu3e6YfjY+Nk/4Y9SdkUAd+f1pAZKy2qbHLSQo2OSG4bS0p4YmqNbXYjwTNrs
 CZz7I0teUgQNgjCYqqsA0vSdlmmJzNktvQEQ42K4I/3u3gE7rig7MkbgIfn3Q66Tbghw
 T+MfCg0UIVy7RkQkeD8ogJeF3GUA+m7b0/JYomm6OlPiGQSfqZxugXQwT9AekPot++1O
 Xuq+gubsenGlZzu8FfdBvxEjJGTo5hGSmUWXfDq8n5gxXaiEvZgds2IrPF6q1p8NV3+V
 RHyVG/pIGn+fyFznrPsjhGehd28NsrUcJ26El26XXD6XIgpCgF6FXoJdUq5+1mMW7Nuj
 dzFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGa6vXA9/uOChKzfQN2bi7qIWs7YQ0jTbc3UeGNXhitpTNXEE6G6QuwgQhRF0qMjPSZ6CoEB20@lists.freedesktop.org,
 AJvYcCVz9soxXFXKzEv5sVjvkp3cQp+l5OHOk8Yef1tJQ2YonIy62HsuY0xuazsI4bRMwZ3yFgriYz8/bZck@lists.freedesktop.org,
 AJvYcCWmvcE89H7+IeJkWVUhVsXmZbfOV1V86AMQTr4/hY0pk3di1w62HQlc1TjGh7jAkkBItFu9p8EDUUU+oZGIHKCUlg==@lists.freedesktop.org,
 AJvYcCWuIRXR6uRXofca7WOtlIzNSElFRoqcxeVKJj0xvS3kRBd52dOaA5hCNBe0r3F24YdgC7MFOyv6ulJR@lists.freedesktop.org,
 AJvYcCXIcs9Ka0o0G7sn6ca+EdyqOUOM5wDHg1Xh6TMKCv8lJiShePomct8BB3s803rGTDIYeCG3CmkQerGe2JEdMA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVgUfzBKLJZtQCrXio3TYPGT+97bsHMKa05EXncEiNGVS6zQWt
 /fIM6AX80BwxtEcm0RutcfY8e0oqYHiEuMdEz9OaJLbhxV0BgaHC
X-Gm-Gg: ASbGncuVkRo9PoZyQTO62w2tDmwRizj+oQW6/LTmyRBTN4h8yVjrBX6NtMJoCrSrMou
 xQ/AJNReM5U5izPGysU7YIWt88oYwM+2vGWEmDvxY8WLvwAvOcgbiprAbbtPk2/kU0WSRx5Ydsl
 NjSlFFjf6wwIY489pUmaTe9xSMMiPRb+9BI2HMicZHLsVKaNEQ/uySYTp5lGUO2gDbK+iSudosw
 eWnwfL5KQ/bj0/ZYeFHW+cA/X2Buw6ajf5NpCfFz/s/77bBHffivVq49nZWVdw7IOLY+q3zyPg7
 PvrMelPMbOMa0eM6fG1CY4zAYO7n1FLGaZUD5CAQGWJp0Q/hsulvLZF9fy1rpaTGF3s6GZGNVwe
 xqw==
X-Google-Smtp-Source: AGHT+IHZGJevvkMs4YxEUV0pCQu6gVQ//x6whWye34wVeeLCxKLW2X7NtRjdgFS2bgshHHbVSK2SGA==
X-Received: by 2002:a05:6602:c8b:b0:85b:4ad2:16ef with SMTP id
 ca18e2360f4ac-85e2cb0e8d8mr38905139f.9.1742496785621; 
 Thu, 20 Mar 2025 11:53:05 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:05 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 04/59] dyndbg: reword "class unknown, " to "class:_UNKNOWN_"
Date: Thu, 20 Mar 2025 12:51:42 -0600
Message-ID: <20250320185238.447458-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

When a dyndbg classname is unknown to a kernel module (as before
previous patch), the callsite is un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it uniquely greppable.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5a007952f7f2..147540c57154 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1154,7 +1154,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 
-- 
2.49.0

