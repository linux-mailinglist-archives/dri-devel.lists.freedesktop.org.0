Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A146FA1C186
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3C110EA7A;
	Sat, 25 Jan 2025 06:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dT2FONh6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB3010E2CF;
 Sat, 25 Jan 2025 06:47:16 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3a9c9f2a569so20551825ab.0; 
 Fri, 24 Jan 2025 22:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787636; x=1738392436; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jfhcWZrz83wYOYEIdNpEF1X0nPHND6LQ2XiKG1miCwc=;
 b=dT2FONh6i9L/UJjEDh5tuFK+qaIC68LE0zjizmEempmvq0dLWYYBGkQvfVrgrerlOd
 OFqEB5uZbRPYpWHStYv/quItvBPdy1j5JTqqTnynhiu5soN3RXno9TCCuD/ZJdsmanek
 RaN5uQjYKjQCzRt92Ly91sRsW93gKGSranFoZsLA0X1e0yP4CY52LNi8e0bU21zh/q3O
 R2iHslvAt3FftomS9dDKa+ANW9Iei7XJvn1iwbCQPFHPym11Zmx1EmQuIZXIH1T2OC5N
 ID2XDZRIvUAzGun0ighPJAjM8Y5+qgxC5l9enzFZrylFz57TQIroCo4SsiEnojawsxOG
 0dHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787636; x=1738392436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jfhcWZrz83wYOYEIdNpEF1X0nPHND6LQ2XiKG1miCwc=;
 b=DhsgjI+I2Hdb4si2XjMkW2ofl0JrhvEnJBPWooS8VZqz2WX5XhwhpwTj6tz5GUBwvg
 XIcEVVuKw6pgLAGgJpp7KNyXZbo8VgOy0XiwJ9p8buItOoEP0TqTGUbOGp1htNYFit2J
 LGu2DzTSY8OSAM9c4sKUEzyCvd0xjzZ9hs8pkEHHvlbuOjnuotuMblZW+LiUK6UEsb1E
 VL8It/KpeBS3ETEMNEDS2jo3Slp4m7jd2i9TqdGvV6SXbBOL5jUL+UnwnRg9/JCNu5o0
 s0UZNrFM2TYyTrS4OFnbw9lpnMUgC6YlddlX/NH7khjs3fqjpbmrnduBEeMIOTz1VwDz
 2Npg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUReo4QsQuo91CjmjbmUs8GPDKTX0OWHA/1cyKY6Lv/qEdK3hdEqJjNVSMfJLb88sUsXvEj5FnynO1hEmTsyw==@lists.freedesktop.org,
 AJvYcCVwbi5KP4HO0vOSLWc4elxk39PqOjI5iGCzwqKIhHzjgWjffbAYP827i89cswXZiKxvjQt5+T0Ko7RO@lists.freedesktop.org,
 AJvYcCWqtTBIR8uiC/dicUd102Zy4u/K3zoD82kww6c0AYT9WUEi9j3etdQ4Pg3tnYaAEOHUmgmNCrNUhDUp@lists.freedesktop.org,
 AJvYcCXzKDx188OKrvl9W5+3XBFEPmHvZOARVTcCEdvx31I8neVnVnphXQePUp+g+dnQvL2gxeH+XfHV@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVN/EC3aobuESNGg3tOxv+M2EEwC2rBKGQKxpAeJZ+RwqyfomZ
 FERWM+emM+l+g+wK6ZJhBS7f2bQg+c0Jpu4JQPjGQ5u+ncuflgkh
X-Gm-Gg: ASbGnctp+LZGvAtm+KuXJww4VN1Fc4m/mSltOsNnMJ9I1SIT3KGEcIZOCJpuPlH0Gqv
 HkJFoXJ5XwfEKqTHXWDge4hZIUiyu7EhinA1q15NbXNNPu4NjyTishx4jWY/b7Szv2z4FwnoikZ
 43ITNUCqD760p/bl9d7Hk+qXJ8bVkOfa5nZnW8JVc472mY6xCfCAk12kKJ4yg9Bzb+LzUQj13Fc
 qgO9HFnUkfhVPVvHf9CZp2wkBnW7/H4avW42w2VJCcXcp3IZakMAMlygBbr3m0XJE14drF3AivP
 JBimInjWcONtB5WPRFU1ay3xVEUohEntrUx9GA==
X-Google-Smtp-Source: AGHT+IEOc8EmSIZbznFHHPXX84xuy1I6pZ+yKmSAQ2gwM3rRL/NYDxG3wxu+D0E1wbsVsa/ZJEfxwQ==
X-Received: by 2002:a05:6e02:3f03:b0:3ce:87e3:c26c with SMTP id
 e9e14a558f8ab-3cf743df88amr329678565ab.5.1737787636061; 
 Fri, 24 Jan 2025 22:47:16 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:15 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 36/63] docs/dyndbg: explain flags parse 1st
Date: Fri, 24 Jan 2025 23:45:50 -0700
Message-ID: <20250125064619.8305-37-jim.cromie@gmail.com>
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

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index c3537f8689e6..89810ebaca8c 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -112,6 +112,16 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
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
 A match specification is a keyword, which selects the attribute of
 the callsite to be compared, and a value to compare against.  Possible
 keywords are:::
-- 
2.48.1

