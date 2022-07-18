Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1843C577B34
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32409A9C7C;
	Mon, 18 Jul 2022 06:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A89A9C74;
 Mon, 18 Jul 2022 06:38:21 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id r70so7397688iod.10;
 Sun, 17 Jul 2022 23:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bL9SmfHfMALFFeL2xDE9zET8U2WS92AMIVOZQAHdFgM=;
 b=h+eAw8Vy4pXPgifcf+p3FqRHVbdvVA82OkgAhPZ+bNSYYQ3kc7v71rW9VUb9mcJVe7
 Uhotfy6Ar6He/57CLyPe7s7dMSm1qpLXL43LVnOkfGCEoiOE3zvIjVqFkzk48mD3yh+0
 /uYFrS3TH1F0YigXGqxCoKp/fxXwMe7MHgrC9XFIY+CmMp5/8U31S4/jHjgvi7bj356G
 wWOg2HzR7YoNWwLyy37C22nN2hauRLGTTdsa53IGYMnkISbyFfTX+4WMZI3sS4i48AM6
 bjvf2+Aue4OVq3LJlYDurxjbdYN2kbYmbQoS1lGLVn7tJB43zuHVBXWf98tdGkhhC7l2
 D5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bL9SmfHfMALFFeL2xDE9zET8U2WS92AMIVOZQAHdFgM=;
 b=F3gLOY+qMdC9IBbfQyL09n3+ffXnHFfAbsbG8aLw9Cjsvd3GLujupTj8+1b/RIdfEF
 Yybv+mmEj5sBGDCLv9a3eogkXDvYX3I6ah5+nzH5P6Z5juVeevh8FEFprZtr5sojlLPk
 7DmHgQKjmdCNTW6bylR7ZTkUqtFrG9StiBL9HiUGuJLlOexcxG6nTc2mvSrJwRJcxJx7
 ZTv/hoyYL0v0xeipXZyt7VruZFynGZAnvBSMDmg2GSz2dELStNj3JkruGFSRqrKTW1hF
 7YFTZTsxoRvwfiIk1hd6PkD23oU88IJajcFggV7wxYiUIKfA+PivEBMYc4Q0T72+hQX0
 39tQ==
X-Gm-Message-State: AJIora97XnpddEkNAbZooMF9vDdqftdgKZmOjNinmHeU4v+bkCUJAHCJ
 1FdKheWQ6NcT4LZWO+srxjw=
X-Google-Smtp-Source: AGRyM1vJdxabQoXnRFWcTamOq8FgkcbeJ8AnCLSjbFUiwJSOx1Idty6gMQVZ5XoRlNOfH5axokI3bQ==
X-Received: by 2002:a05:6602:150f:b0:669:3a9e:e1f3 with SMTP id
 g15-20020a056602150f00b006693a9ee1f3mr12715465iow.35.1658126301077; 
 Sun, 17 Jul 2022 23:38:21 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:20 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 04/41] dyndbg: reverse module walk in cat control
Date: Mon, 18 Jul 2022 00:35:48 -0600
Message-Id: <20220718063641.9179-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

/proc/dynamic_debug/control walks the prdbg catalog in "reverse",
fix this by adding new ddebug_tables to tail of list.

This puts init/main.c entries 1st, which looks intentional.

no functional changes.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 8faf584f2f4b..7fb99492c16f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -970,7 +970,7 @@ int ddebug_add_module(struct _ddebug *tab, unsigned int n,
 	dt->ddebugs = tab;
 
 	mutex_lock(&ddebug_lock);
-	list_add(&dt->link, &ddebug_tables);
+	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
 	vpr_info("%3u debug prints in module %s\n", n, dt->mod_name);
-- 
2.36.1

