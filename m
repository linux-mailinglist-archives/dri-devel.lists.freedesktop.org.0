Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFD7A79403
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297D010E884;
	Wed,  2 Apr 2025 17:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XuSIj1dN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F44210E878;
 Wed,  2 Apr 2025 17:42:16 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3cfce97a3d9so562555ab.2; 
 Wed, 02 Apr 2025 10:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615736; x=1744220536; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=td1hbocEroQ+eFWd3dryN89mziTxSjQWv4lhLkRyiDg=;
 b=XuSIj1dNG/TuJXM1rUN1BkmzVaFQu22iIm3PfY0iqBbPnZUIrVNvO7GsTm9KwMXumQ
 +pTXYOI3ek21FqRBtNzYVlhOihvSEVDe3oXPGfuYjeNTvuFq+1rvvacvfrwh7dVjSzFN
 +eNVYA6Y7ftLL3t2y061xeUAkTsxT5R7IpaoSWGqpSZOpB7+0mm22UAuQvgRDFuVb4zt
 85QCs+WDIVgzvdp7ImLPqlzfWp1Di6McvE7TSX0eIJN3LsOFSuI2FjcyFo0GKjB3vgph
 UOWFE7GNxlyzf8YBYNh254BA6aGq7FqoMB8NrCKig5yGGgUhNUzs7TM16FejMButUyG4
 GauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615736; x=1744220536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=td1hbocEroQ+eFWd3dryN89mziTxSjQWv4lhLkRyiDg=;
 b=VUpPaos32g05UtjSgdYdUDh+50C2lqxnci1uWGu7Nt+zm0al/0xVnQwd+PIQNGHG9j
 2tpQiMg6IWTVCFCvnk7dpyI98dKf0wOZmCnvFkxyT9r6glbLRxMr53jUgXcmLaYbpgMz
 0ol0DOrKkSne+7e75BTmRtFACOUBoacQG9CLWIt9sLwcNPhSiMdcVXx/hK6AOb5TMFe/
 CDFLFvhH1d7QUkF4xfzZhxAmxQ7JKy/kILMctqtgKhV+1W+tay+tmCtCjsDUQwzUSdkz
 FR8UIRZ4w1Idhg45AIefiOmRAeBuMJHPhWWB6p8qxPrgxAwmeqWOl2I1ZVuEefA5Zana
 djbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsezR0e921hYB+uzyj+MRYoAb+nZhwBqMAlcyj89kQQLH6ZBFwxbx6MXREfLThrgjYBv+iPTizyrpMYKRA5A==@lists.freedesktop.org,
 AJvYcCWL7x6DXE6CjkKi+YwYRGObCMOtlM5eLm/J3sjsOiMVdGPVh86osQHbVcBGmlKLDnfIteUM1JY72b//@lists.freedesktop.org,
 AJvYcCXDdV3TMw/VFz5gc7+uQiFdmLnxKmxwBEoO6e6i9hwmiWea53EArxK4bH9HHhxcjUB+VtRY+Tuh@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlsUQ4CmtjtgfNTla+2Yo3gOXt9LssYtHFyw7So2fZ4fMg/bGc
 t+hAzxCmypk2JMghX/X+kTTn5QfUHU9xRYbxTaASdJDjETrGQYzk
X-Gm-Gg: ASbGncvhkBHVCL6n3i4bCcLdCWz8nhuRn2LzPu1cWctY6hlLiYO3l7kKxDg/8zDD6kk
 0yiU6Gr1Rih7HiLWkuC2xjsYllCNEwpu+IxsWFgQpJYgoOviha716tLzu+3UkITNvZPgm2YDRYi
 HHHvV4jDc3Nn/RL+Q9ygGvsmPxa6POVsDOhfBYbNFODpnKvzjZoKas/uksQhfSy91qSqe15YWsl
 ofanTr7gBWrdPnRvgge3Dj+f2SoOh/dTJj5x7W/+teSOe7NfYuCmVAbKCaXiccvI8ySML6+5M8Y
 ZmDTWnxpbABLgx629RdzCmb9gjD57Ri0GKy6Dzzzs7JC6GvarYkyAM+pbD+6gEGLOT1p65RRau/
 tPfq/a2Uxw21A
X-Google-Smtp-Source: AGHT+IFoghihjH4MYpOsA0qp+LY0KBRJDcJg5fZDrmZZoUA3dpTLzhFFCuTnSVLmEdCyPs5O9yahhg==
X-Received: by 2002:a05:6e02:378c:b0:3d4:276:9a1b with SMTP id
 e9e14a558f8ab-3d5e09cda1bmr184969825ab.16.1743615735764; 
 Wed, 02 Apr 2025 10:42:15 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:15 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v3 03/54] docs/dyndbg: explain flags parse 1st
Date: Wed,  2 Apr 2025 11:41:05 -0600
Message-ID: <20250402174156.1246171-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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
2.49.0

