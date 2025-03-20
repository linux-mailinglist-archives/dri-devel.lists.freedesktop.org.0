Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D311BA6AD59
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A42610E68B;
	Thu, 20 Mar 2025 18:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hVOhZntI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712B610E689;
 Thu, 20 Mar 2025 18:52:58 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-85da5a3667bso37807839f.1; 
 Thu, 20 Mar 2025 11:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496778; x=1743101578; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GcpeXIgBKTB5NFbofa9/asJwSsA0oVZhqq9QNH8OPg4=;
 b=hVOhZntIJPSFqfu6KaVPLNvCIjrHpLWyrTEhZE2ou1nYBdAm0S0Ms0fEjE8l3NlvOC
 lwSEzTxUzza6zLVLVg+QCnukS3bhYLfGG8ofTn81u2lEHf2sV2LV52uurIHdHjYRWgtc
 9GZeBTGVuP0XBVRUQyD1bABaxY9Aaoo3pM4cEzuDRa1pUzY+IBSdxlpU8//igEOK5Aln
 n67cRckb/KdUATDpgKsC8fsMAIv1sv0rIx320aLQAbVTz0lpPGCFNh+v8CoyRLeD+wQv
 7s14XCoHL+98WY0ioLv8EndIbcK4B/CNgiFYk3w5oYjSLKpJvJiIPs8IeiPxPrfjumv4
 yvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496778; x=1743101578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GcpeXIgBKTB5NFbofa9/asJwSsA0oVZhqq9QNH8OPg4=;
 b=FDRE6xtBvyBaLm2Y0AGgSA3hlUi7/WsD+iMDyFAjDA5t50pKFG4RCCGOHKV1+It1oz
 j6QB/6pjwtuuz74x5y8QNuuqQ2y7z69+CUTh2sC8rAkfkLka6H3Tu9pgxoki+kkjIGv2
 dZBwLfSlXg9QNcOqoFVLY4kIkvZYZCqKj8s8gAlyjtCuST2R5WjcUyNEcaOqX2jd+8Nr
 prONfgYkSkQl4/UFOa+QrDMFUoWr8u6D9u6s6vEQOqfd6EZltMQ2mGP/yku4CKH1gGFb
 Z9Z7H1J6XMnzbTQpg8H/lmb3jBPMNjoPLrUMU1fv5uNJwC6gcrGwUPFTTFIkSENtNsw0
 9ONA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMunA0rhw9RbY8/gZAYsRm6uMRQz5bH3dCS2XnLaLt1eUhHIwrxk53N8B4v0eR5uxMhSqcTV+v@lists.freedesktop.org,
 AJvYcCVYKMX4m4kFeJK7CNNVGUJnTpttveSXnUflewZ2UF/8k7SlFBv5CBAHCcyNYvqT1/LRB5FVc4uwC+C+@lists.freedesktop.org,
 AJvYcCVac93PH38IUncBAMOebPi5ZC+vRy+fvm8ayJMsLUd3axgUSfaX5gKgcS1GQpMCX3riIjoeQRjNP2Ik3BMUOw==@lists.freedesktop.org,
 AJvYcCWfa8Qge1rJAs1vapJofo2EGA1xKjM4Pfhx1V6ar8HAvWS3Gv1UXfi0dWpZAl1+aYf0kKUN40MDAgOIk2sReVfPNw==@lists.freedesktop.org,
 AJvYcCWru1KlDjwvuv5nPMP922NwhE5LP5Q53yYIe1M6gYVXB3FB0qsRSwvGa42lQ72BtvbuwqdiC2HDMsVj@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0k2CXz9LfEwv+cMJYZcTTH3MPnMQkF+e+Tq2WnNN0lGYhjx5v
 xIHzJaVig/VowhugMzOPSOsBzFFZ/o3kz2LrFK6OSXP+lJ1c+oAh
X-Gm-Gg: ASbGncvPW5e2uLvzVWJX9braKWm6ck8TuRs2B10Xb4MRaTgwfpQOXOJgPcICGiCF6Si
 Ag3swkjyKRID+ozuhjptIjsL3iGOp0f0zDhzmbrJABN+8GaD0tMOfXzj9cjdq+rIiBkXb8soE/9
 QvwoxjSvJ1bmIS+cA/YYyfgYTYAX+tY/oGbQJMfKMGMYp6g1g0/KNNAQv7mOKsFmdMdUpBdS5af
 /ASvNPsAFqTNBg9prBzybzd7wwkhd1K7viU1TwyRlp4hEZ0lPsrr77r3dBsDudZwAiSq0Cfteqd
 7gAWmQ6i+ME9UIxBsUUApC/5IPeQfuSTyUfKGkLIM3aZDW1/avfoO0KuoRsX5eYCOecBJgGC7nd
 3cQ==
X-Google-Smtp-Source: AGHT+IG/WcgSDWYGaIGUJzJjoUwRAkD/zIPJ1dWq3GZRtzQHb9p2LQ4+giHWWoVJtCcIbGbNZ3Q//A==
X-Received: by 2002:a05:6602:3719:b0:85b:3791:b2ed with SMTP id
 ca18e2360f4ac-85e2caaa5c7mr41988539f.8.1742496777818; 
 Thu, 20 Mar 2025 11:52:57 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:52:57 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 01/59] vmlinux.lds.h: fixup HEADERED_SECTION{,_BY} macros
Date: Thu, 20 Mar 2025 12:51:39 -0600
Message-ID: <20250320185238.447458-2-jim.cromie@gmail.com>
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

commit 1d926e259d8f ("vmlinux.lds.h: add HEADERED_SECTION_* macros")

I flubbed the defn of the outer 2 macros; they missed the extra arg
needed: _front/_hdr.  Fix it now, before anyone notices.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/vmlinux.lds.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 0d5b186abee8..c9c66089ea2f 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -219,10 +219,11 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 	KEEP(*(.gnu.linkonce.##_sec_))					\
 	BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)
 
-#define HEADERED_SECTION_BY(_sec_, _label_)				\
-	HEADERED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop)
+#define HEADERED_SECTION_BY(_sec_, _label_, _front)			\
+	HEADERED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop, _front)
 
-#define HEADERED_SECTION(_sec)	 HEADERED_SECTION_BY(_sec, _sec)
+#define HEADERED_SECTION(_sec, _front) \
+	HEADERED_SECTION_BY(_sec, _sec, _front)
 
 #ifdef CONFIG_TRACE_BRANCH_PROFILING
 #define LIKELY_PROFILE()						\
-- 
2.49.0

