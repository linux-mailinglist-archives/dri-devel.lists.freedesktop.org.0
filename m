Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF9D589BD2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 14:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B025D97998;
	Thu,  4 Aug 2022 12:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6279749C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 12:41:45 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id f192so9783654pfa.9
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 05:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=w0Xxsd10rxzXzo6/5gdWcIy61xCxC4G1bz1u1E9fXCo=;
 b=qD8j7MqqhHWzCEXuJN+GpeSzUdlAxRyaiur92DU6at98u5tgv2exchm9KnIJRPGGwS
 4RgMLhbFh/yr8Q5O4ECnkUGj9S8gVPjiXPm2LAFsx62EZjdxCo/OrIO5X5UEUWZsK5PU
 UJFOkziuTiJVtruzn+BZy2AXNBM9tOueP9AeUKB8Os84d2OHraomImWx0uk3mxj4ocS9
 yt97Dn5UzB1sUM9GM90TBP/DX0MFg4Jas3MDnu477/0yYH7Q8QAuxZGpZ0l1JAg0BiAr
 f1sP+x3t5jzGDNAbbDywp0l0mt82aC4dm5lR37ou1KVyg69+j4Q+f6p4AxwrxFDJ3bHw
 8OLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=w0Xxsd10rxzXzo6/5gdWcIy61xCxC4G1bz1u1E9fXCo=;
 b=qKwpfvqUvtG/jHmjplBuFZYV2bu7+1ZmWka1PPBFgWXqan6y/Lr2lKDuTsOcxaP05W
 /MoU7UPY/5/ChyfbL9vHuwljfaW/KDVR4+vLWfRGtOZbDUSi/tsc3R/Ew6p220wpDXDO
 khDkFGGqs91AyOi/ELhROV5u1+r4sENn8KW22zVcr8HutaU/nYKEHcGb0eag70286MmS
 tw9d8ymu3xJWNZ9KaiigZk9+ArRXhtZhNcepb3SLit39G3tREsIJ03dFdP3dt10UnOGI
 5B+O8fQFo5cFMWVAW+TaqBllzSxC5U/+UPNXA66f+i4zBhe5p+2cTqEsl3iXCA5zkKCg
 4Uuw==
X-Gm-Message-State: ACgBeo0i6IVfkmNXLLWpfB4ANnklrboGT+o8IukcYW3WHilqbk4kI+yw
 1d5kI9Yra8yrAHSsuMvCng==
X-Google-Smtp-Source: AA6agR5DWlGw0W1xZXujx2KGDv9sHfvTIt+iTdErPfZLMXgRlBBtcYlNDb72wX2TK2CqsJhy7Jwogw==
X-Received: by 2002:a63:1658:0:b0:41a:4118:f4b9 with SMTP id
 24-20020a631658000000b0041a4118f4b9mr1497090pgw.153.1659616904598; 
 Thu, 04 Aug 2022 05:41:44 -0700 (PDT)
Received: from localhost.localdomain ([166.111.133.51])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a63bf48000000b0041b672e93c2sm1070769pgo.17.2022.08.04.05.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 05:41:44 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: deller@gmx.de, adaplas@gmail.com, santiago@crfreenet.org,
 akpm@linux-foundation.org
Subject: [PATCH 1/3] video: fbdev: vt8623fb: Check the size of screen before
 memset_io()
Date: Thu,  4 Aug 2022 20:41:23 +0800
Message-Id: <20220804124125.3506755-2-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220804124125.3506755-1-zheyuma97@gmail.com>
References: <20220804124125.3506755-1-zheyuma97@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the function vt8623fb_set_par(), the value of 'screen_size' is
calculated by the user input. If the user provides the improper value,
the value of 'screen_size' may larger than 'info->screen_size', which
may cause the following bug:

[  583.339036] BUG: unable to handle page fault for address: ffffc90005000000
[  583.339049] #PF: supervisor write access in kernel mode
[  583.339052] #PF: error_code(0x0002) - not-present page
[  583.339074] RIP: 0010:memset_orig+0x33/0xb0
[  583.339110] Call Trace:
[  583.339118]  vt8623fb_set_par+0x11cd/0x21e0
[  583.339146]  fb_set_var+0x604/0xeb0
[  583.339181]  do_fb_ioctl+0x234/0x670
[  583.339209]  fb_ioctl+0xdd/0x130

Fix the this by checking the value of 'screen_size' before memset_io().

Fixes: 558b7bd86c32 ("vt8623fb: new framebuffer driver for VIA VT8623")
Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/video/fbdev/vt8623fb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/vt8623fb.c b/drivers/video/fbdev/vt8623fb.c
index a92a8c670cf0..4274c6efb249 100644
--- a/drivers/video/fbdev/vt8623fb.c
+++ b/drivers/video/fbdev/vt8623fb.c
@@ -507,6 +507,8 @@ static int vt8623fb_set_par(struct fb_info *info)
 			 (info->var.vmode & FB_VMODE_DOUBLE) ? 2 : 1, 1,
 			 1, info->node);
 
+	if (screen_size > info->screen_size)
+		screen_size = info->screen_size;
 	memset_io(info->screen_base, 0x00, screen_size);
 
 	/* Device and screen back on */
-- 
2.25.1

