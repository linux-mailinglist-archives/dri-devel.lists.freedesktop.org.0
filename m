Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F62C6B8FA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD9E10E51D;
	Tue, 18 Nov 2025 20:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VDlWh+/D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E1410E516
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:08 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-94895f6b144so248047539f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497147; x=1764101947; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X8Z5E1c4xW6f3MIhZNpeEMkA/pwyFDqpSOaofHjCxO0=;
 b=VDlWh+/DJAgIC89Q2KDgW71zGzB5kqwx73XZ4/yWIKTyC7Z7DpkCccQqzJsZSNIJUZ
 6P3bj7zAmTFowlT3J7s1hGP77yeYw3j5wz4ukb0X5O0VkVR8r66al8Pfv8IzumtTkot0
 cW2DiyzEy78XrDD/2Y+yzKTCJM1vy6yxvdxI2XFYowNo0UkHYLdFGjNWY4BCGE4afcOu
 cxRXXR5K6MNbaFVjFctYpJo1qpNBJDTg6J+xdD2BUr1YMeqP4DQLnWxJQAJxz/6njPkl
 0TBESYkfH7VMnyda7rCGOebRaJEd7a5ccTHt2m2QAVKXkOYDSfmtT64LcREOXZ/ElSu7
 cpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497147; x=1764101947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X8Z5E1c4xW6f3MIhZNpeEMkA/pwyFDqpSOaofHjCxO0=;
 b=o1LmnO+q2TU5KvL7AZ8K065yXA2DFESkXM7ybf/lk7jbCJa2rSoct2Ie7i9EInXS1a
 Ly5Nqyka1zoUkqvG93gZHRTwWDdDS3ODEA97wRlgUE4B4vDk38n6Y87QXklqFkmKnm0F
 lZ3gvVd0yPUk8kOTbrIIeckN60YECLjMnlvx5Yt14CHS/QEvAtrwX5acVwyn03pvLb2G
 vnchVeT3RIzU+Uphd38GC8ZzXNBtDza8Or1ftVhkHM7GGezXJWER402m4uWNdU8lNjBg
 mquqaXkCH3jwOxJzrGxACJCSQwBeqfVaS3DCKrqaU15MMm/ZvMCHX/ZwZWknsyJXLT+a
 ln1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGMfBrN+Aw1dFDCg0U5YBv8ZKah9lUkF0TyTkhfSlQ0AfeVjFVS/prLNTVELVnABlGPovOGIAV5Hs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6Tjy7nUxTiYg8h08rKfpHLOj0Jn1Sk6EbbyiL68yIMos1No6G
 gpFSW0ztlcMqpKq7Aj6tVpqQz1MErldH2da1hNE8KBO18CUbixGfJPjY
X-Gm-Gg: ASbGncto90+XUh5crgrVNuIpeKAhVHRbaYQsQl6tPeh0yCZFjjoSmdSFdJzahoDRCgP
 dcG63gYmRy7LL5K8nTLV6955G+O9+9ziqwn3R+G4qLohyNnmj/rlMzyTW4jxZGcLSoUSoHGZpjX
 mz/w8vrs+R3AUCg2N99CyWAHi21s00da0cUA2YcmG1YSaXuC7Yo3O3rzJtgUpoHRZLMUGMPm+83
 Nv4+2oDt/U2Vz7LfvXeYMa2UJubXm2kUmWu2RpNQ8U8SJdX+/Pb9GjtMnEudmL5fLo3HNjBuoy6
 IeHIylxJTeeUES2gBee8Je3L8lFLeMa8JVe19+qFQnduQfyk29yqCRTpmgl4+bLo2joaIVnT4+P
 F0hJR20L4+7yHUhXolyuIgqdB02KU/u9ChH/040YAHLGXdYWjB4IcFmvgPdI7uBtv70PNmjlssQ
 rWPE9ino7f3Kh9zPOHnF4LgZQ6kOdR5tuU/4EJbkLNoa9VXR1mLcE4o9+rgCPYQCYAyVTb3Pw7m
 +epqw==
X-Google-Smtp-Source: AGHT+IGK4KGIUTf4W77J7sq9n5vXqukmUNoZUaDS2Y7hGtS6m3I1J/vwD+lcc8EF3iCZoSjToqUTEA==
X-Received: by 2002:a05:6602:600f:b0:948:c594:9a06 with SMTP id
 ca18e2360f4ac-948e0d782a7mr1965215039f.12.1763497147373; 
 Tue, 18 Nov 2025 12:19:07 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:06 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 06/31] dyndbg: reword "class unknown, " to "class:_UNKNOWN_"
Date: Tue, 18 Nov 2025 13:18:16 -0700
Message-ID: <20251118201842.1447666-7-jim.cromie@gmail.com>
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
index eb5146bcfaca..cb171088850c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1165,7 +1165,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 
-- 
2.51.1

