Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F978B4A265
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 08:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FD810E62B;
	Tue,  9 Sep 2025 06:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HzBVCt4f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091B310E62B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 06:38:02 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-251ace3e7caso36384095ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 23:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757399881; x=1758004681; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=25UWmpQf5SbKYiEprNQF1Lau5aR6d2EunzG6nL5zuBo=;
 b=HzBVCt4fHQpD3qhUW4oQ8MjY4UEXRRVH1OvUoDy//DkNUqMCP6MklpEiRDF+8Mm7jg
 N/1rkKnVDG5xmXTd33SSPYOCrYx+uGB7ybFLJ3eETh2U3iYwknREEQf9zTFRC8mFcPHL
 KO5/7rq7dDMVhPabqylnoJ8IjOwiQqMpAMvobanPwS/SEtJNfH3rPUYwcQM1lhQFip53
 PIPKFjND8TtZ5Y6aQ69N4HA7FiM1jeOo1SWqPdx9DKaoxHKJxt26hIIZB+fz9UjfrwC+
 PI6W37CO3VUaGHD1J0RTXRUa66P3lgQ4VbMuRQ8QwCohcMG4QR3aB7+bIIhymnAKlY+2
 AN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757399881; x=1758004681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=25UWmpQf5SbKYiEprNQF1Lau5aR6d2EunzG6nL5zuBo=;
 b=AqLeW7+2lVGEt8dY4fkssdDT0GntKVWrNWkjnK3hZanj82YAeOvhiZIm1DSCNrHaep
 QVq72o67yWXuQeHaCEhd52XOE3/KOXT9oNkm0wRqi3FOxefp1NoLqsKSuVL3ypyYSyt1
 OFPtAgOPwFTV7Z5s7buowCkDtZT9FYwFjvqSM/bcKyWY8XNUlzik1vbe3KsvLt8HblGS
 jR6xzEIynGO4js1GuHlDIq7Fs0LThWy6H/447SCY7JJI/Qbx6S3EWKE3gXElA9mBmsEh
 gbDv2Zq6Ce1PB3cHRhZxaga4LUBDU8k6NqhBZ9stsYUh70WpKF+4KIZflrdgvVV2+g6V
 FZYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKOdY41opBJ976MmWGHkQX4GAPZy5ukc4QMT2d5/ez7s8HhTUNtbI5JMbfarmTJUqOukzBgO2/cN8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkYsvFe1PiyyhWLvqtvOtrYmY88h5rF9tSnkqTRWMIVuAP3tFH
 TV0I9M0m1ukUA18F3OjRhtkFYlfy24DUANx/uzMq0XnTSydtL8AD7a/w
X-Gm-Gg: ASbGncurK7vEsKL+25FcAo9lPkgukI7s13Thsr6Do1SkgFRaPM4DBJ3Z03fpifqXK2m
 RcWx34pU7VbiAhrR1jDmggptcTjCu6NPItnnDfh7UkMm1caherk984msMbWq2YnJxJylYDwYp1X
 Y2RQey6pnRlvMwbVXeyYyfc90sU++kFSAm0idfj+hRF84YfUcIXwPW+R8VkrQv9OU485KyG9E2R
 45qIF+pspSBrAqyGgeA1Bqw324Zj4If0TxdRinCMmujAUYhmRy6ki3kgbHfhLXoOwWcfHOlyJyh
 TILDgwfmpZoiYHblpjfqIH+cBOMrqmbXEu5haEMfoTnpiaWWGIZQTcMfqhQWp3CPJ/bT0n+rcLs
 E5rN5tWQjVvaaU4l901K8yCR0wvA8QVmBF1Ro
X-Google-Smtp-Source: AGHT+IFFSNt/TerbKOH/mJyFNdTgR/Ln9+8EsB6tolM8c81vOQhFBupjVWJyh52QWZXF3IA6RTkAgg==
X-Received: by 2002:a17:902:f78f:b0:24c:ea17:e322 with SMTP id
 d9443c01a7336-2516d817c2dmr141370545ad.3.1757399881492; 
 Mon, 08 Sep 2025 23:38:01 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32b8ba6e145sm15157694a91.22.2025.09.08.23.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 23:37:58 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 534E041FA3A5; Tue, 09 Sep 2025 13:37:56 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Helge Deller <deller@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 2/3] Documentation: fbcon: Reindent 8th step of
 attach/detach/unload
Date: Tue,  9 Sep 2025 13:37:42 +0700
Message-ID: <20250909063744.30053-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909063744.30053-1-bagasdotme@gmail.com>
References: <20250909063744.30053-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443; i=bagasdotme@gmail.com;
 h=from:subject; bh=1YacTfXCdJtgWi2zW6TivDngANaEgZA7E1AouXXqbn4=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBn7Tx28Gh9mctv9ptsR4dle9jxzmIqdrgjfesJ3UVz8d
 H5kRWdMRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACZiVsbw342j+u7xNOaQJtNm
 53B1v0mH+uXcjnmJv8iQTj4rNPvqW4b/8Za5n7JXP9Lb9qNY/+VV1sqmSY233onwc51MDmRYHPW
 IBwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Properly indent 8th step text (as enumerated list item) to be inline
with other steps.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/fb/fbcon.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/fb/fbcon.rst b/Documentation/fb/fbcon.rst
index b9ddc145aa9f6a..3ed98b3ce64713 100644
--- a/Documentation/fb/fbcon.rst
+++ b/Documentation/fb/fbcon.rst
@@ -251,11 +251,11 @@ restored properly. The following is one of the several methods that you can do:
        echo 1 > /sys/class/vtconsole/vtcon1/bind
 
 8. Once fbcon is unbound, all drivers registered to the system will also
-become unbound.  This means that fbcon and individual framebuffer drivers
-can be unloaded or reloaded at will. Reloading the drivers or fbcon will
-automatically bind the console, fbcon and the drivers together. Unloading
-all the drivers without unloading fbcon will make it impossible for the
-console to bind fbcon.
+   become unbound.  This means that fbcon and individual framebuffer drivers
+   can be unloaded or reloaded at will. Reloading the drivers or fbcon will
+   automatically bind the console, fbcon and the drivers together. Unloading
+   all the drivers without unloading fbcon will make it impossible for the
+   console to bind fbcon.
 
 Notes for vesafb users:
 =======================
-- 
An old man doll... just what I always wanted! - Clara

