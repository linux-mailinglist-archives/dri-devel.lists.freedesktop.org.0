Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E5B29BC2C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 17:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE7E89DB8;
	Tue, 27 Oct 2020 16:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD8289BB0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 16:38:05 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id w65so1232738pfd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T0NQC8q5PZfZ/nsIJ5qKnoN7K1varb2/TGSSOiRrezY=;
 b=M1vwXINyKCI2zbkqZyjRXzOz+OiTTjv5+YsMO5WomPxQ3OpKFOn7449dzir9pXj29D
 N5LsWZQuc+CpSU0G6fApBL8OSc3ryHX6s4+fH7/jMVFh8f3/aTe3/XJ1Ptp/jgX7r+t9
 9xZFjZp26qxDvFk9dfn92Za9iIbief2hH5kZJ6lYpp2Ug7hYAdAIIbpVGHbquuB8px5+
 LJQUV0NFSXrXOEc1N2TBFJmfeEId/wIGYG3QrPBOWi9ebke753T1av3HH461g4YDBEmp
 Rt6Abuk4cHAhe3quvhm7Y+ucPdDhEs7s8FvMm4Xd2uPJGWC7E+Bo6tSPsXJgl9VVG1XI
 FABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T0NQC8q5PZfZ/nsIJ5qKnoN7K1varb2/TGSSOiRrezY=;
 b=nc/3mwatQpQVKGo2IAWx+y1M3JCw0gtR5bnH+QM78UNox56EydmbTv6vmQSBk+mrgA
 hJsvmiyy4lsJXrXW9hELa8xbzej8eTMY8zsihCqabnGccn7c2u0MKN6RFGcwT7Xs0Rl7
 5am+AueD+FClOVxbUfgw8d+QHXBI9pp2BnktZw+T9RTUaVae8/T+JIuTav5r/EynUwRr
 C5H3EWs7JEfUV2E3CjJImUwIzVBV1eCTbdzrO7rbXBDTnNrT2YUFxCKCklXSKYGHa9Ef
 yf2OOIbu0GpqJ9LFIpBMfioaaBCOACgWKTFNZbe4MrKIWSlalaSUf7j6rffb+HUchu2A
 E4vg==
X-Gm-Message-State: AOAM532jxX3c+oGodW9bq3XNNmhxKH6MPk6vUYUJuKjNqesdjg/Mrxxu
 C8IXQxACNdgWoR9P87IHWg==
X-Google-Smtp-Source: ABdhPJxBV7fdXTggzQ998E92lWxE1sdD8P1AgGgCr6mresHIg18LPfPSKo6TccWBfKl7Hovza/PVDw==
X-Received: by 2002:a63:5d61:: with SMTP id o33mr2564224pgm.295.1603816685018; 
 Tue, 27 Oct 2020 09:38:05 -0700 (PDT)
Received: from localhost.localdomain (n11212042025.netvigator.com.
 [112.120.42.25])
 by smtp.gmail.com with ESMTPSA id b7sm3139676pfr.171.2020.10.27.09.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 09:38:04 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4/5] fbcon: Avoid hard-coding built-in font charcount
Date: Tue, 27 Oct 2020 12:37:29 -0400
Message-Id: <a3b1b3cdc160fb9aef389c366f387fb27f0aef38.1603788512.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <6c28279a10dbe7a7e5ac3e3a8dd7c67f8d63a9f2.1603788512.git.yepeilin.cs@gmail.com>
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
 <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
 <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
 <6c28279a10dbe7a7e5ac3e3a8dd7c67f8d63a9f2.1603788512.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jiri Slaby <jirislaby@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fbcon_startup() and fbcon_init() are hard-coding the number of characters
of our built-in fonts as 256. Recently, we included that information in
our kernel font descriptor `struct font_desc`, so use `font->charcount`
instead of a hard-coded value.

This patch depends on patch "Fonts: Add charcount field to font_desc".

Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index cef437817b0d..e563847991b7 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1004,7 +1004,7 @@ static const char *fbcon_startup(void)
 		vc->vc_font.width = font->width;
 		vc->vc_font.height = font->height;
 		vc->vc_font.data = (void *)(p->fontdata = font->data);
-		vc->vc_font.charcount = 256; /* FIXME  Need to support more fonts */
+		vc->vc_font.charcount = font->charcount;
 	} else {
 		p->fontdata = vc->vc_font.data;
 	}
@@ -1083,8 +1083,7 @@ static void fbcon_init(struct vc_data *vc, int init)
 			vc->vc_font.width = font->width;
 			vc->vc_font.height = font->height;
 			vc->vc_font.data = (void *)(p->fontdata = font->data);
-			vc->vc_font.charcount = 256; /* FIXME  Need to
-							support more fonts */
+			vc->vc_font.charcount = font->charcount;
 		}
 	}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
