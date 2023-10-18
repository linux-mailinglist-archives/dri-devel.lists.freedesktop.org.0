Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2028B7CE3CF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9675C10E433;
	Wed, 18 Oct 2023 17:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B9210E43E;
 Wed, 18 Oct 2023 17:06:35 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7a669a4ec51so44276739f.3; 
 Wed, 18 Oct 2023 10:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697648795; x=1698253595; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UnWyGzBg+EfQ/17pthf1gkMUPd8BVnFczw04j1DAB6Y=;
 b=BLQpEzUxrtqrtVM+Gs4JbCZ+54H3eoS1EYrg68JB3iicE9n2796EnR+AdULqKeBwfW
 9frP2d4Se9/RZTRDst6WYL9qgtmOWInra6zCQ3txjkLTbNaCGaavBHPLRoKUh/889Gwe
 xMfb6QMUtmum7ZNzjvWOiDLAWtThO7LgTxyhNYvWiOY7XlQn3XLBhcZjdwWePgZkZYh6
 owS5URr4yXhtTHk3Hcm5x+6G1EvqrnXsaJjdyav+7nVzyelG9CE9rPyLyl65TUR2BX12
 fTMhD714/C88olT+hHBUiIEpc+oKIw26/eLEHu6YQ2idFqSfipvvrZe+fzlmbpLTNea/
 HbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697648795; x=1698253595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UnWyGzBg+EfQ/17pthf1gkMUPd8BVnFczw04j1DAB6Y=;
 b=f+XuVZICMXe/Akgi5Qu8XOKwMLlbRNGXGJL/nWtqxWdFkWa8Qgr1PEBTJ2fz6V4vfH
 GcQV0vYgb7MVxzsFxTGxDHH02xfDP8Adj0HvwI9DtECIpG2TLOEyOGU45GuIFlHfdril
 AAT/nN0E1YPxXYiS3FW7+LrDU5QzPy3qaiW2Qvxo7v85VQlJuDPs01GZb0Anf3zlz+lP
 P5uZj/+nxQqFoaRfr0yHXApaM9w+ZT/RaQKb23W71JlG+6/4+Bp9xF7YOa07t87SPpbY
 ZPmWnbgED8NCfNutnBQqdVOhw8lOOKjyHXFz79UO2uo+GE4ZsCOvmclYLbCiqoiF8Qm5
 svfQ==
X-Gm-Message-State: AOJu0YzewaRvXOipcjF/uFJH/Nyt/z7DvhXlBD45ozeG5yYwcuRA/jhZ
 z0WJgkU52KskCQJdl89u7Qs=
X-Google-Smtp-Source: AGHT+IFeheNXZBGnOFX29lWvMdz9W+sw0/6ZtrOHpH1g7X3NeT601F54bgeT0BHNqWdWEMi59Mg+zw==
X-Received: by 2002:a05:6602:1584:b0:790:f735:4d30 with SMTP id
 e4-20020a056602158400b00790f7354d30mr6712709iow.13.1697648794854; 
 Wed, 18 Oct 2023 10:06:34 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 n4-20020a5d8244000000b0079fa1a7cd36sm1228944ioo.30.2023.10.18.10.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 10:06:34 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7c 21/24] dyndbg: change WARN_ON to WARN_ON_ONCE
Date: Wed, 18 Oct 2023 11:06:01 -0600
Message-ID: <20231018170604.569042-22-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018170604.569042-1-jim.cromie@gmail.com>
References: <20231018170604.569042-1-jim.cromie@gmail.com>
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
 rostedt@goodmis.org, mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com,
 bleung@google.com, yanivt@google.com
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
index 9db797a0cf82..213110ec1e9c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1281,7 +1281,7 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 	 */
 	for (i = 0, cli = di->class_users; i < di->num_class_users; i++, cli++) {
 
-		if (WARN_ON(!cli || !cli->map || !cli->user_mod_name))
+		if (WARN_ON_ONCE(!cli || !cli->map || !cli->user_mod_name))
 			continue;
 
 		if (!strcmp(cli->user_mod_name, dt->mod_name)) {
-- 
2.41.0

