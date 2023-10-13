Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDE07C90F6
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 00:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B4A10E6A5;
	Fri, 13 Oct 2023 22:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAA310E64F;
 Fri, 13 Oct 2023 22:48:57 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-35742cbb670so9734375ab.2; 
 Fri, 13 Oct 2023 15:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697237337; x=1697842137; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tOnBISCPbs+GXr5xHkNIZiy97l93WP5W3+/uL75zbGY=;
 b=UJJOl+Q/Nr+K0BRhN2m1uEUiOdCedvBZjJi0ze1OYHeq5kxNasq49g3aaNogL/Ffns
 XV8cEhaEPkv/hMp54jJpZmBPmMSVb/eBp11xlBnxos6lNk4VwnQbYVk1ZdDBpwNxplcT
 2sK40K0UEKhr67iK3H9BR0ftjrknW7F4FWOjtx4Rl1H0+LHa207Wrt70aFF18XA+dNHH
 e7KvgZ7p9uZ4Q3YCJbg54pipBo9uqXyImt2y4SV8IN1k0WfLSm94FjFtILRKUOwwZFrd
 dZnMwVqh4isIfKjB+32M++HTBSg/jYD0VcWY1UWotKY4hr8L8xHIo6RlvbONYsMZYD0m
 bmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697237337; x=1697842137;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tOnBISCPbs+GXr5xHkNIZiy97l93WP5W3+/uL75zbGY=;
 b=BdQWO2bmVs3n/zQiwnMVHDrtwjikmCfpUiBihjjQ+tKhnzH2UYolMxw1QQ5FLjjgLk
 f7uzhnodB8qpXJzcBVLW6pXoJYHh1TD9UvgP3kgvr84TfnzhXOtUoHu8DAcJJbNTPK/n
 qsY3xtiybrBCU3q2euxpKLUMYemu6W9Dujzi4xEdSErgvZDcHNaUC64Ko0pyXHkpvf85
 CDRzZfNiyFi7EySiC3NZBdojkEJ1a24GMtVWUcDj4m7PwR9tHYeaMF1yMSUR8Pb+t6wh
 U04qkfwgWicU7Y2saHYNCK/EHzqADnbn7JEAfnhsEw5DgBYz4xPVbf+iI01FvO6chGJx
 Eu4w==
X-Gm-Message-State: AOJu0Yx/TWY0nEQieR77oGO9cDEkYMetN0wS9FF7xwyZFAAyGhYp907/
 qnvMbX58twDATZbxyRdk6Fk=
X-Google-Smtp-Source: AGHT+IFMnfzPDgT3d0GKACRRcR9UzR1ArRvamspsNH0Ln2meLL20prnc/eNH1S5zKvpzmkuzx2aXNw==
X-Received: by 2002:a05:6e02:1a41:b0:357:4621:10eb with SMTP id
 u1-20020a056e021a4100b00357462110ebmr12755180ilv.4.1697237336878; 
 Fri, 13 Oct 2023 15:48:56 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 15:48:56 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7b 22/25] dyndbg: change WARN_ON to WARN_ON_ONCE
Date: Fri, 13 Oct 2023 16:48:14 -0600
Message-ID: <20231013224818.3456409-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013224818.3456409-1-jim.cromie@gmail.com>
References: <20231013224818.3456409-1-jim.cromie@gmail.com>
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
Cc: lb@semihalf.com, groeck@google.com, linux-doc@vger.kernel.org,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com, bleung@google.com,
 yanivt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This shouldn't ever happen, and 1st 2 conditions never have.

The 3rd condition did happen, due to corrupt linkage due to a missing
align(8) in DYNDBG_CLASSMAP_USE, on the static struct allocation into
the __dyndbg_class_users section.

Not sure whether changing to _ONCE is appropriate - this is a
module-load activity, so it won't continuously spam syslog.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
undo BUG_ON addition
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5825b58043a6..2a5eb64dbc27 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1284,7 +1284,7 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 	 */
 	for_each_boxed_vector(di, class_users, num_class_users, i, cli) {
 
-		if (WARN_ON(!cli || !cli->map || !cli->user_mod_name))
+		if (WARN_ON_ONCE(!cli || !cli->map || !cli->user_mod_name))
 			continue;
 
 		if (!strcmp(cli->user_mod_name, dt->mod_name)) {
-- 
2.41.0

