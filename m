Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C79A793FF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3B810E87D;
	Wed,  2 Apr 2025 17:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EECV0Ntr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D01C10E881;
 Wed,  2 Apr 2025 17:42:21 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-85b3f92c8dfso526839f.2; 
 Wed, 02 Apr 2025 10:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615741; x=1744220541; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+AN9v4KQ0PiEc7jM3vE8QrHxAiVUi2zmd1sx7ARoRMg=;
 b=EECV0NtrPoq97nYEtYhexUVFl4DxZPI9pmKlZAZni0LFxbNd97Lqv5KURHZXnlmlqg
 OV8OCiO0gZ4WApk+qntbLnEqf7cPEzKnVc7Bq94km1ucqNnObagy99NIxGkrAKKBs1Va
 l85pC/2/HhSF5vdApkxkDm03fOL74hhWK9aqhNfK5XxM0QDnpL3EF+QEaNGKG2CxZ2xv
 SntWJLKtFBjiJ9kFq4WreJY+PG1rCqZwxZCuLaG3us2oLAd8mBnABREWouCzVzdeMXM3
 uuoE4szWho5KSsjLb8WRNR+l2GwWiMZFshom9LJX56+lDoy+pRz2KIBcpG7abvQ1kMis
 MQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615741; x=1744220541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+AN9v4KQ0PiEc7jM3vE8QrHxAiVUi2zmd1sx7ARoRMg=;
 b=FVtLhAb24Djwb7HoScA8Q6ITKPqCDEdsTOg9y1BJj+FWAehGo9GG9BEpNjMZAO58I+
 VbYt8ilcV5GCNd6FZcXuMnK81JmNeVm/Mx8ZNUA+wz/3nRWFKiJMy+HmDHp2xS4+rdXk
 opxjxWq1WqYtkcxwHGDrEW/qmpyw3MJnpVy7L7541yWqbA/XhIIgTFgP6StHNPdf+Ll/
 sdS7iI9hHxIiHQuiQdbAl5zCyfwz7FV/aI5YBPhiMNrI2koGdugL3wwL5+vrEFrzAV5p
 V2pl1a0189XClyf8ciMpGcK8Q7p6cG53Zj6NvHrL04bg9y9lrQ4zAGIVChRNMLR6BgHk
 0m+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvjEHa9Ce2iw5AkDJ0kUm+LBElDQECrV7yYe4qnrqg8KhyD3Af51Ar9onitAa/dLMjkSDQeHOdi/zx+7M20Q==@lists.freedesktop.org,
 AJvYcCWWwK7+ONoZFydScgZbAHa66xrZ4rsLBYPkIDCcwAvbizc2KIX3mBYPw7CXsv4vxERQnqBBdd7Q@lists.freedesktop.org,
 AJvYcCXDhhgsH9NtVwvQ6FmmSEs7kYleiVmIbpEN5c4y0jt0RBZw1c66ATLhkZ0Z0YTSCZcvs5loL+KN3Yl5@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPgSTXdP2opqROgIuvSnhoQsD2fD++7SKTYHh6mkVUhZnwpPnz
 OOb9W46MV0qvKeRfu9p4URKEiuU+WD5uikwhUwKGolBvDGijc8Mb
X-Gm-Gg: ASbGncsvPOYVhSK9ACj83SEjWY14X8KC9r+LziFPVftkE1uW9Kd1TVe7yuVK1q+e51w
 VdGEhf4BEvsuuHban8LgdTcuyX+3hOkgHG5ftG1FeeY2fUPtW0Rz5Fm1A37rjOgt3yYblCFo8kz
 kpV6id2oT7xzHBJf2O+PH6fNUvv8msqJjvw9hvDUsdHERzeUla07hVKRC0B3YYjVJwpIEgK3taA
 E2l4MsZ3LI6jXvgygqTQf6E0/QS/Hl6c38rS1KgJrotc/4MPbCjX25ecAHes3dFEqKUxZJ8HAFZ
 kWrRtZa0KRcnLoAwlVAGknP1FJtIiPpW2wHKv0v3BSB3Ry54GZ0oecFG519KnltaCShTbSekuxp
 hlQ==
X-Google-Smtp-Source: AGHT+IH4Y0UWSmgU+NCi7WHRrVlXFXoekgCq0dMBYgztyw3Hpw5BNtpfhLC0O0dU/4LF+BFX2wTffA==
X-Received: by 2002:a05:6e02:152d:b0:3d3:f64a:38b9 with SMTP id
 e9e14a558f8ab-3d5e09e4828mr192342365ab.15.1743615740615; 
 Wed, 02 Apr 2025 10:42:20 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:19 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 07/54] dyndbg: drop NUM_TYPE_ARRAY
Date: Wed,  2 Apr 2025 11:41:09 -0600
Message-ID: <20250402174156.1246171-8-jim.cromie@gmail.com>
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

ARRAY_SIZE works here, since array decl is complete.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b9afc7731b7c..ac199293d203 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -107,11 +107,9 @@ struct ddebug_class_map {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
 
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
-- 
2.49.0

