Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617B7A1C172
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAD510EA7C;
	Sat, 25 Jan 2025 06:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FMYzfRgX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF76110E2B7;
 Sat, 25 Jan 2025 06:47:10 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-84a1ce51187so77815539f.1; 
 Fri, 24 Jan 2025 22:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787630; x=1738392430; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x11BZKBrVuF//4sDIzHDHCm/mRQ6/WwpO4x5frMPkhY=;
 b=FMYzfRgXLUKQxSEJFD7/TLI6A4F7+8x1ndvMM+qSyXtgKMc7UYh0LIMOXFt8c+EmAS
 rDlF/L5ZaNjq5AUUcV8ZSzej9V+bJXn7SoXI6f0KHwjjDytkjWul+8K16SbHc1oTSnrk
 vH3Z7m1G5reXdj2bDEnRFVvbxLSdyqk5XC90V+RoH2rsGv9DZBGd4OFm/ARauONq0BYW
 S4NeiYFr/L8ouLusHBVh4acrblsev7BPI+/1DYa8WFczd4ta8W3gb58f9EJ10jgRS+k9
 l5s4ER6aUQr49JHLSyRkQ0TCuhQ5qCffHDiN9ezuUvLMbQ/M0QEPln131MfOmWikPIge
 ZEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787630; x=1738392430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x11BZKBrVuF//4sDIzHDHCm/mRQ6/WwpO4x5frMPkhY=;
 b=AHm3GCVxhkKzoT7famQiekMXQwbBALkz6cBlZhKhj4Dn0Bg3IC35F5UWdNjZQEgKDs
 KXSUqKBHJA2tZ/F/XU/TPIlap29CBRJ8noyuyRDehiFYFqc3w88VJ5hO4rfZMuYIj50X
 EvhOCPBRgBXyyAMFP7Sv/0ShsK+w9mW5FstP5TxjBssUP2PMltGOkWRZ5bwgPi8ff7x6
 WKN6Ql4moS1g5PVaVWX5KPnDTC5Vf3Fw56WR/XlMe8Mr1yxqDFV9a/sVfMiJfguCUQpF
 12YDRthOcJW35CBRR7l6+AsQ/Ck2oWoGO5M3bs0fAulJLeueT2hwSOflaIO1UA73tj1w
 kwVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgBw0QmAy85M5+Iwj2Dn6hj8ootqhdErI7RT6O4RrzWwaGR22OlMFDbTGwXAPxvrFRVmDc43B01w1x@lists.freedesktop.org,
 AJvYcCVCoeSMCOe9UaEGxD97n8VKcqHa9EpIsk6rZNTJ9pFQELYK2p61m87eGii3ojuQpDE7kyGrP5fz@lists.freedesktop.org,
 AJvYcCVeQ/0+CdlyHF0No6z6MdJZ9qqIhGCcuzkBgWNBUu7Hmp7ohXizMZiGTl9U/fm5ZnP0+2bakspYRr3b@lists.freedesktop.org,
 AJvYcCVmdtbbfgsTwL8JTXQuXDXh2RcMMe4oXgJj5upQGsNfMNvNPYxXxg2avP86SGaLFrtLF/Y91118eresz/QQaw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznnTi5qir7fR5HUa3YrgwY/48B4V1yY4wG8fZmU2UIO+Q8zloU
 iEZETZS7IOLLDiALdCF6Mj8OaVdLMjRiYjnZo7zcY3sYS9WIf7tL
X-Gm-Gg: ASbGncvw74iGNi3kBQZkarj3lloqcE5cbkU+qVmvBNmCwatzcJkgczyd2e0FT9a652T
 xodZ48ItgdsnrVFgbVcAMhZ1K4ONZzqQoqqK2CrP923NMF4rhSkaH7OhF7goUbDU/BJRgw873FV
 uAoJIzHjsNYv0Bu1MT8Dm9DofX1bUUmiZ9N4ptixjSF12j8SgO/XMEaMgZPgWKWmvteNEb9VLds
 vNn7IT3CcxkugD+3A0BRUFzH12TNfJklYIcrwAuTYGJZJgCa5JJDD7T2UOyNItnwFIBKNqSy956
 2jA8JVeIbvOchJGLhq+371z/51UnvL6qaXyniA==
X-Google-Smtp-Source: AGHT+IEMjfj5KPBD+MY1YnSxoaWknOFxVXF7E1RjBZMpsyNcxNDm6LNROXUaKAR5kPzioEBH7zCauA==
X-Received: by 2002:a05:6602:3e94:b0:843:e667:f196 with SMTP id
 ca18e2360f4ac-851b61ee917mr3363869739f.4.1737787629916; 
 Fri, 24 Jan 2025 22:47:09 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:09 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 30/63] dyndbg: treat comma as a token separator
Date: Fri, 24 Jan 2025 23:45:44 -0700
Message-ID: <20250125064619.8305-31-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Treat comma as a token terminator, just like a space.  This allows a
user to avoid quoting hassles when spaces are otherwise needed:

 :#> modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

or as a boot arg:

 drm.dyndbg=class,DRM_UT_CORE,+p  # todo: support multi-query here

Given the many ways a boot-line +args can be assembled and then passed
in/down/around shell based tools, this may allow side-stepping all
sorts of quoting hassles thru those layers.

existing query format:

 modprobe test_dynamic_debug dyndbg="class D2_CORE +p"

new format:

 modprobe test_dynamic_debug dyndbg=class,D2_CORE,+p

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 lib/dynamic_debug.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 9283f2866415..56e09e878f80 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -293,6 +293,14 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 	return nfound;
 }
 
+static char *skip_spaces_and_commas(const char *str)
+{
+	str = skip_spaces(str);
+	while (*str == ',')
+		str = skip_spaces(++str);
+	return (char *)str;
+}
+
 /*
  * Split the buffer `buf' into space-separated words.
  * Handles simple " and ' quoting, i.e. without nested,
@@ -306,8 +314,8 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 	while (*buf) {
 		char *end;
 
-		/* Skip leading whitespace */
-		buf = skip_spaces(buf);
+		/* Skip leading whitespace and comma */
+		buf = skip_spaces_and_commas(buf);
 		if (!*buf)
 			break;	/* oh, it was trailing whitespace */
 		if (*buf == '#')
@@ -323,7 +331,7 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 				return -EINVAL;	/* unclosed quote */
 			}
 		} else {
-			for (end = buf; *end && !isspace(*end); end++)
+			for (end = buf; *end && !isspace(*end) && *end != ','; end++)
 				;
 			if (end == buf) {
 				pr_err("parse err after word:%d=%s\n", nwords,
@@ -595,7 +603,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		if (split)
 			*split++ = '\0';
 
-		query = skip_spaces(query);
+		query = skip_spaces_and_commas(query);
+
 		if (!query || !*query || *query == '#')
 			continue;
 
-- 
2.48.1

