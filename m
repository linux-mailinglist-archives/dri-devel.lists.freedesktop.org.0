Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E7F5AC7D0
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F4410EA4A;
	Sun,  4 Sep 2022 21:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA0E10E2A9;
 Sun,  4 Sep 2022 21:43:02 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id p187so5653229iod.8;
 Sun, 04 Sep 2022 14:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bXSeYH0zduNfWYtAn2/GFLXR9T03/2CnSS0WiVim3VQ=;
 b=Kz5c1apWMX0yddvgXTrt/BjoeN52CrK81vVC2ejDG94BrieUIvPuQxqUc9mOpTS/PP
 HWECHkoY/OGUf08e39Nmu5OrgrRhJWG04JFoAaPLsxT6JyFH/YDSudtSKAU+VFekFYsq
 Vod9PDrJCKlyWzWt7qenFWfsvqXS3nuOE+JpI9yW2OwLoVmYddOY5g5wBsTWGPdp/8D4
 T8EWSg90FSXg58mfxM0h4Ijo4DgetN371n10Vzcly6r5kLaSzcQu1NTLn9EFrrE/z+XJ
 JBzGq1uSt6X2fse4mVKP1vmF2LWn1W1sfDqy+6kqDBUE4JOdFjuhQGLvtnC0Saz04FMW
 fgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bXSeYH0zduNfWYtAn2/GFLXR9T03/2CnSS0WiVim3VQ=;
 b=FlIOT/nAibk5KswXBEb+JEIbIyqGQMw8vTZb90YgI+QhtB1FJap2M8NQ4xCT+H8fc7
 vOkP+90KgtTtUuvJJSPsFkZ+31nxmPR4JoVnbYiw6E4gLqyNeLk/KM7VMnA45vm0OTIi
 y7HaVKdmUe2SKy9Ie4RK8oKsxB6bFkcqk34gHmM9HuCTlzRiyeQD/JGMOu1GS68R0Iax
 kR6+YfDt/HVgxolRqVsvOHv7TwX7BABnREg10VfRAfnoq+/FkNjj3NQrgSHvEJc+QbM+
 TYsrzsFT0foDnemUqrQm372zpS1U5qt2WxDyd4Ax4FEBG6p7i6yYfB6+TGvrMLpYtiUr
 hfyw==
X-Gm-Message-State: ACgBeo0m8EQXUyPxZZDTB+aw2hmpz/bWsWMDuj3jsy4Hu4n6N6XQwdlH
 UwtKkCnfW61Lfpyy6Ch7f/w=
X-Google-Smtp-Source: AA6agR4F0Y5uoS0j9obmZc9hPIHDQS7tGY0siR2ILOqRr5ep1L+AxeY27R3APLGSgxbHOp+TIgipXA==
X-Received: by 2002:a05:6638:40a8:b0:346:8e3c:8141 with SMTP id
 m40-20020a05663840a800b003468e3c8141mr24647914jam.107.1662327782109; 
 Sun, 04 Sep 2022 14:43:02 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:43:01 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 54/57] dyndbg: add .gnu.linkonce. & __dyndbg* sections in
 module.lds.h
Date: Sun,  4 Sep 2022 15:41:31 -0600
Message-Id: <20220904214134.408619-55-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For a long time now, loadable modules have tacitly linked the __dyndbg
section into the .ko, as is observable in dmesg by enabling module.c's
pr_debugs and loading a module.  Recently, __dyndbg_sites was added,
following the original model.

But now, we need to explicitly name those (__dyndbg, __dyndbg_sites)
sections in order to place new .gnu.linkonce.dyndbg* sections in front
of them.

This gives us the properties we need for _ddebug_map_site() to drop
the _ddebug.site pointer:

   fixed offset from &__dyndbg[N] to &__dyndbg[0]
   container_of gets &header
   header has ptr to __dyndbg_sites[]
   __dyndbg_sites[_map] gives de-duplicated site recs

NOTE

HEAD~1 took headers off front of descs,sites and saved them into
_ddebug_info, this puts the gnu.linkonce.* records into those vectors.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/module.lds.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/module.lds.h b/include/asm-generic/module.lds.h
index f210d5c1b78b..328c48dfc88c 100644
--- a/include/asm-generic/module.lds.h
+++ b/include/asm-generic/module.lds.h
@@ -4,7 +4,17 @@
 
 /*
  * <asm/module.lds.h> can specify arch-specific sections for linking modules.
- * Empty for the asm-generic header.
+ *
+ * For loadable modules with CONFIG_DYNAMIC_DEBUG, we need to keep the
+ * 2 __dyndbg* ELF sections, which are loaded by module.c
+ *
+ * Pack the 2 __dyndbg* input sections with their respective
+ * .gnu.linkonce. header records into 2 output sections, with those
+ * header records in the 0th element.
  */
+SECTIONS {
+__dyndbg_sites	: ALIGN(8) { *(.gnu.linkonce.dyndbg_site) *(__dyndbg_sites) }
+__dyndbg	: ALIGN(8) { *(.gnu.linkonce.dyndbg)	  *(__dyndbg) }
+}
 
 #endif /* __ASM_GENERIC_MODULE_LDS_H */
-- 
2.37.2

