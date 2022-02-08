Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72234AE2D9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 22:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFB210E37E;
	Tue,  8 Feb 2022 21:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B8810E37E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 21:08:36 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id s18so571900wrv.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 13:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4crFuo44YkHTtsyu93ovw2eXFVSYs3TA5dMCqcACcfE=;
 b=jQi7DARCTOMXz5tC+EIC8+SSebNsfkWcI1vfAOcJgnkqRbrl9Gbw9DcNTrzkF5/AM4
 UoT9eQCdb6EjYX8w+Ub2a2EKqQNnkAABbTe0Xq0077w3volpOypc1EzJp4JNSjN1cszY
 SUvcPj044oQe627lpXmNgf2p1UJPbTY4Y4FlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4crFuo44YkHTtsyu93ovw2eXFVSYs3TA5dMCqcACcfE=;
 b=ZWn0nSNKaHc7p37wxPOupRD/G+B24RM7Ix4pRv3nTzMvMh9ejXZCk0B1lX+UtZJMJS
 XPu/ZnAhheoVE9cXkHvv7be/eLqCg3JKhYEoTKxsRnwwUOEu5DEONmnjaiyB2/fhVZgb
 ceyVSKIj4c9bbwg1274p5j5kl95VK31UMaiGnviLvaG734Vm29QznM64wWE3KQuad6RQ
 ilDqmRxX3wZtYGMzyeVhB+NyPQAIQtUr1eg+ja3tMTO/lr71K2CXWvhKJ+7IoEkC7to0
 2iKqZYVB2cnYgnujJBOOkAlbch5vyDkG3hFBzWiR4hkUYzjyCTVFLL8L111WR1c4Ad4n
 AqzQ==
X-Gm-Message-State: AOAM532js9ZAtLYnptsH3k/F2+bFrdhsgQVpe3/LWNq2v8tM62I9fe6N
 5KPCI/hFaaz8KIdDbu4xIjkirPjk+VpTgg==
X-Google-Smtp-Source: ABdhPJxyfY2skHNX0EzH+SvK1Ftr+4E95xGCkY+AUHxfLXuaNP8ZqaFebSt7JML9HJcvQyhPEOh1kA==
X-Received: by 2002:a5d:6da8:: with SMTP id u8mr5134612wrs.362.1644354514804; 
 Tue, 08 Feb 2022 13:08:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o14sm3033561wmr.3.2022.02.08.13.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 13:08:34 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 04/19] fbcon: delete delayed loading code
Date: Tue,  8 Feb 2022 22:08:09 +0100
Message-Id: <20220208210824.2238981-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Before

commit 6104c37094e729f3d4ce65797002112735d49cd1
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue Aug 1 17:32:07 2017 +0200

    fbcon: Make fbcon a built-time depency for fbdev

it was possible to load fbcon and fbdev drivers in any order, which
means that fbcon init had to handle the case where fbdev drivers where
already registered.

This is no longer possible, hence delete that code.

Note that the exit case is a bit more complex and will be done in a
separate patch.

Since I had to audit the entire fbcon load code I also spotted a wrong
function name in a comment in fbcon_startup(), which this patch also
fixes.

v2: Explain why we also fix the comment (Sam)

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Du Cheng <ducheng2@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index b75e638cb83d..83f0223f5333 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -944,7 +944,7 @@ static const char *fbcon_startup(void)
 		return display_desc;
 	/*
 	 * Instead of blindly using registered_fb[0], we use info_idx, set by
-	 * fb_console_init();
+	 * fbcon_fb_registered();
 	 */
 	info = registered_fb[info_idx];
 	if (!info)
@@ -3299,17 +3299,6 @@ static void fbcon_start(void)
 		return;
 	}
 #endif
-
-	if (num_registered_fb) {
-		int i;
-
-		for_each_registered_fb(i) {
-			info_idx = i;
-			break;
-		}
-
-		do_fbcon_takeover(0);
-	}
 }
 
 static void fbcon_exit(void)
-- 
2.34.1

