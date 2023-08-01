Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C85676BA71
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 19:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6475710E41C;
	Tue,  1 Aug 2023 17:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A7710E41C;
 Tue,  1 Aug 2023 17:03:28 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3490cce32c4so19273205ab.0; 
 Tue, 01 Aug 2023 10:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690909408; x=1691514208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ge7HQUHFN0SdBhoqRDpb0JNuijpwX6fCYvOeNIH8KRc=;
 b=XoYdmGsTMlulPJct/ABIxSbZoK18Cv7kP1AzUiL91Yb1nBSLYcbtqRKN0DXUroyAVV
 cJwwFC8CBFj9X03dWGM6SvnUMtaaceLMZumTKE7ZHFOdLj7bNXaLe5gRhRFvIsmdzHv6
 uyiquPu8kk/Jiw/7Mtc09FZ3OFL878XoSThLg209/jN+YAZmRrzXtgnD2WTvnM66cAKF
 orQDSxpF0LVVq+Gl7nxjDYQAXPlmL1CqPZCTzx+ZGHsK2qQp8+4BB9E0+G1yB/CqRVrU
 3wXSCYp4vXCaivLas3bj6YihtkUGtlt6mLnqHJFACdc8mtkUew8ev/kTRKklkmhTG/ZQ
 evzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690909408; x=1691514208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ge7HQUHFN0SdBhoqRDpb0JNuijpwX6fCYvOeNIH8KRc=;
 b=YvvBNhWJW0Wf7k8lNE30mzjzDXd5r7mS5W0CJ9NEgWAjINZnWzp2BizmbuKoFzm/kX
 xbx+dQWIinGGzTjRltg7fHeqmenqqiAKPNFEhzwj4Mwr/GPApN+CGC8C86FO4pbz8hYE
 4742KshabI28mt8PCC+kIGc3bdmcpnDTU1HnKUy+9svEB6A0WKsYpRU6UA/L3C6MXWss
 Ou9rVA0Y0Tw6ljH3pOW9oMF5Elwkx9LxOtahVLa9X9mZIlZcramexk5v3bZ13VLIxtKd
 xpJXrxldoJXA2yQ24cRmm/sLajg0ve+C3Cc35hTkoIRUAMNv59d6dqEVR3h4RcV3vnLt
 nWzQ==
X-Gm-Message-State: ABy/qLZgCKMtQHMs4RoTM7Uwk3M4SPF5hgeQioDp7+jie42eAZ4H/WA0
 Vt9MaJ6QhtIQo8mvHAFQtrk=
X-Google-Smtp-Source: APBJJlGltELSLt9anu8HDYWhg8avza3TmSZ4hq49jTZpdTl/+zOZagkQpF4b+AFSmxescLjY6zVaNQ==
X-Received: by 2002:a05:6e02:f44:b0:348:e180:831d with SMTP id
 y4-20020a056e020f4400b00348e180831dmr11360972ilj.20.1690909407776; 
 Tue, 01 Aug 2023 10:03:27 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o20-20020a02c6b4000000b0042b144abf71sm3768577jan.179.2023.08.01.10.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 10:03:27 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, daniel@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 09/22] dyndbg: silence debugs with no-change updates
Date: Tue,  1 Aug 2023 11:02:41 -0600
Message-ID: <20230801170255.163237-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801170255.163237-1-jim.cromie@gmail.com>
References: <20230801170255.163237-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

check for actual changes before announcing them, declutter logs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 2a5cbb68d88d..a8973d1a6896 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -590,7 +590,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
-/* apply a new bitmap to the sys-knob's current bit-state */
+/* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 				     unsigned long *new_bits, unsigned long *old_bits,
 				     const char *query_modname)
@@ -601,8 +601,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
-		  query_modname ?: "");
+	if (*new_bits != *old_bits)
+		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -617,8 +618,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
-	v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
-		  query_modname ?: "");
+	if (*new_bits != *old_bits)
+		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	return matches;
 }
-- 
2.41.0

