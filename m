Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C399FA6AD8C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31ABE10E699;
	Thu, 20 Mar 2025 18:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LCiUNLXv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16ECB10E687;
 Thu, 20 Mar 2025 18:53:31 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-85b58d26336so94019339f.2; 
 Thu, 20 Mar 2025 11:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496810; x=1743101610; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N/TmguIcilYWi0b4T/ZXyXvq5cs5z5jPAwptJanq78o=;
 b=LCiUNLXvDY01MHrdxasE19DdLLt6CYaZ4R34pv+Yf53HKnH7kwPJS0z1rvhVJKp1m8
 BeFw3fgBAVzvDgqbZ9e0FeUkiKJ/PtY7AKSiIppxox52BpxYbJoyYg1WTjUja+sGavCQ
 Y76ih27w26cd6LHaCSoNp7z8LLQM1DOYDJLgtlRwKqrtSzzI6WhBJvM+4QGXgZiZhGUb
 svpLvFSoYUGtRvKZW/5/IKpAUbZ/RoxMDTg7Uu6VJggRaICBN7fh/G3igVpURPpD26f1
 oXPg8oU8HJcQ7kstNeFE3TJdrBL5TSo/L9ktddnYi4X4oY63+U3Tm+uao87chmKX2sWE
 8M9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496810; x=1743101610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N/TmguIcilYWi0b4T/ZXyXvq5cs5z5jPAwptJanq78o=;
 b=o1GxfwLkDZJo8Zl7f8MBmIgS2Xt/dmlWMJ8z08C12Tlfy+SkZMA5rU968B+awaGlUn
 cN6UpTtHWbDA2AyeKeMWCzUp2EONkrMBkqJ29KQdsWvnzE0/J4QWlru07lEayQYgZvrP
 pA+oa199xWxJHYGV5daU6QnwpbogwYEn/VPiTq3y1bPBUCvlo0Ozm2nCPGqxjRqVCy2M
 nx2TYhVolSyIJZwYbGPOmlydMc9b9hxAGreSyK5Kb/lW1H8j5Rj8DyvgJadW3pBv45t6
 Q9WKvgiVeiBDYJbvrHy6SFvNTz0zYdOoI1CB/MXVB4siWMG/Fu1gjQ4m6keZEWmB5+dc
 h1OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNYS0sTQjtg4M89qQ8V6FGHIBGP/dcg2sWMd4SUcsKrGlgisVyBqoRbao+fqSjAfvHwSHy6s1D@lists.freedesktop.org,
 AJvYcCVe3Srte/DxwAF6Gn4DWMFDksDU06kUbdLTle+24kdQEfa5uLwRY9gf8BTxKLJNXMLhZ+VxCG0zJW8B@lists.freedesktop.org,
 AJvYcCWUedLwKcN6SoiX77ayVKIcWqLsc2+n5oDGjfPxmvhO9yD2Zq0nDX4AhJqT+rvmPMtMi3XG71y5jH3V@lists.freedesktop.org,
 AJvYcCWW6Yb4pFFSg93+rKXZb9oDHjXw9mBMdHjeQo49aS7wPhGS3AKFA6odhubqb6L3Fkdn+0fTUCWBkYCyT/5aEw==@lists.freedesktop.org,
 AJvYcCXvleLloDKi9IJi0Oqnmo2y/6jndLS5Uv7P3qB4qWjg2MB72a9htG4d8uz7Bd+1m5tdCZ/eCvWG7TQ4RPwM/BX93A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRyUVkcAHOvy9lvYufcSJoEFTTsCM3OYE+Lc7cxnAHlyECcK3/
 3zXVebY3xlj5bKUB3FMps23DNEPPyPLX7qO1WGZTCyOq+PPtG+No
X-Gm-Gg: ASbGnctDswHTRKpzmqC0+bRJsbOz7lmu+wY5hu8H7evASas/3WgyajRtEu1xsjGzpir
 tZniJyrgB3/du1GBsIiY9IpDNSjnWBUDVlHiCh/vdENqAkJUmYeg7a3eah1FzviGfY7SMA45Br/
 viteu8kFq3sdabtKl/xfMmxOQjBauEjJmHDWt7zfeg4J5nW3wtnitHvwCs+bySVG5OcaTFCaUOh
 GDQF4P0UU9xXsFn4sTcAWeesRoGLXsLafkAW8ByioOfKq1O/wb01tgdtAdbaqWTA61VilpknhrZ
 sZnZYmcqHwKInEw0qr7BL9HvprhJ5GhhNDMio29wSlUcUz8rtb0cpkwPSBUUlV5TF86OneWAzOR
 bfA==
X-Google-Smtp-Source: AGHT+IFyIwb+RWjlXVmPJReqZ7Gaf5mcrnSGy/txhhCgyUW+11xOhYLGUO72gS3V0AUotv0u6Xegpw==
X-Received: by 2002:a05:6602:4013:b0:85d:115b:bb3f with SMTP id
 ca18e2360f4ac-85e2ca64287mr43643139f.6.1742496810314; 
 Thu, 20 Mar 2025 11:53:30 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:29 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 24/59] dyndbg: treat comma as a token separator
Date: Thu, 20 Mar 2025 12:52:02 -0600
Message-ID: <20250320185238.447458-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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
index cd3eec5bb81c..168663629ef2 100644
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
2.49.0

