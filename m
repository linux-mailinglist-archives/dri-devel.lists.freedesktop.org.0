Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BE157B9D0
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBEA8EA48;
	Wed, 20 Jul 2022 15:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110338F05D;
 Wed, 20 Jul 2022 15:33:01 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id v185so14532847ioe.11;
 Wed, 20 Jul 2022 08:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JV345slmDZGXvnPNyaFUVDSwkXdPTptctgGFHiASs/s=;
 b=Cged28OGRXoQFdGRASlOqYWRNOaewY7t+zRNZpGu9VrrfceOpM3sIas8x5Q+Wwj1V1
 2KI2jgulfMPwyqpYUH03Jg57RjgYs+7jLonTzC6Ls67HniXTYttlT4mAtgExpfNyMuiq
 cnqZUkKugmbW3TQfEGMjw+WJkrvXpvaiUiEa13L1cqc+tBQb1jL8Z4wiw29KsXOL93Ks
 OENX7IHbzGM/KVYcP0WwDmDzv7YxsJEnw9GXOIm3lp8U23cpzpzpsK0i7JPHjG254aY6
 rvEpjxtSKkfN2QdA78xJOsjyfEvl4SROC0h6u6ccLA9c+noa8sQY6JkrrgWU7puEMc1J
 hp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JV345slmDZGXvnPNyaFUVDSwkXdPTptctgGFHiASs/s=;
 b=C6TU6OWfMTAQW6WHyvJ19n4ixn7zQhBngIrY0VZtBvZnwOeKQUc0XNaF+sMUbrhOGu
 OW0mfI/QsL4R5FQueGf2Om9oII4lNrIUXDznWmVxH0Thc2yFcJSTqQeQUmBVAR4iOTlB
 UNsSwGkK09UTDg4oNyEde77R8SrnKHQ2ZB0b71rcAz1n0OOZFk8KgY7b9D/ZksmTxdRf
 /JCAIdwdFN9PbO1hSCwKx0egBQQRr0UkUSGj0CV/aHRJ4I1G0eIndXZeVWohLR3kGque
 eWRn6F4JxjrpfyA3JXVtswgn6xs1shiS09+NkPZdM/07rdMHqfMlaz7iQwgExyZw3AE6
 E0oQ==
X-Gm-Message-State: AJIora+XFOMbAbCB1h1S+OBZwPpCMjrDu2isYKP4i902//6pM7qDZ7BA
 29ZNXVP97UCvOMNFCwU+5K6bnL+w9bR9hA==
X-Google-Smtp-Source: AGRyM1sKzo/l6Hlcd+eZ9MtZ5QN3nRcl9UOMuucsXhVJV7BjNJhY3IXbw1MQqD+zQCLknaT2K5t79Q==
X-Received: by 2002:a05:6602:26c7:b0:67b:72ef:b87b with SMTP id
 g7-20020a05660226c700b0067b72efb87bmr18326012ioo.175.1658331180019; 
 Wed, 20 Jul 2022 08:33:00 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:32:59 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 03/41] dyndbg: show both old and new in change-info
Date: Wed, 20 Jul 2022 09:31:55 -0600
Message-Id: <20220720153233.144129-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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

print "old => new" flag values to the info("change") message.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index a56c1286ffa4..8faf584f2f4b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -156,7 +156,7 @@ static int ddebug_change(const struct ddebug_query *query,
 	struct ddebug_table *dt;
 	unsigned int newflags;
 	unsigned int nfound = 0;
-	struct flagsbuf fbuf;
+	struct flagsbuf fbuf, nbuf;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -217,11 +217,12 @@ static int ddebug_change(const struct ddebug_query *query,
 				static_branch_enable(&dp->key.dd_key_true);
 			}
 #endif
+			v4pr_info("changed %s:%d [%s]%s %s => %s\n",
+				  trim_prefix(dp->filename), dp->lineno,
+				  dt->mod_name, dp->function,
+				  ddebug_describe_flags(dp->flags, &fbuf),
+				  ddebug_describe_flags(newflags, &nbuf));
 			dp->flags = newflags;
-			v4pr_info("changed %s:%d [%s]%s =%s\n",
-				 trim_prefix(dp->filename), dp->lineno,
-				 dt->mod_name, dp->function,
-				 ddebug_describe_flags(dp->flags, &fbuf));
 		}
 	}
 	mutex_unlock(&ddebug_lock);
-- 
2.36.1

