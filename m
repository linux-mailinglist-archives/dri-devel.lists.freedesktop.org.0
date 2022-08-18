Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82859598AEC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 20:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EFD10E23A;
	Thu, 18 Aug 2022 18:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7925010E098
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660846466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W0yvrJCNySNCn52+IL1OETOtNI6hUhlyn5gBnr+tlWk=;
 b=A27Epnl5lDh4NaYYa4fugUKXzfYaflU4890LR0idPQ9Rhu96FYdE46jf20qzZm/hO12IX6
 qulZtV2yFwriHv5bu8xmC+7Lg4Co66fWN77timGAj01JKXM3mPhjxzssMYPc35plONvKyN
 n+3fkOsgvLDV5GiWTSVD23WvR7ifeVc=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-YJM-xAV6OrCuIyVQcH5B1A-1; Thu, 18 Aug 2022 14:14:23 -0400
X-MC-Unique: YJM-xAV6OrCuIyVQcH5B1A-1
Received: by mail-pl1-f200.google.com with SMTP id
 q11-20020a170902dacb00b0016efd6984c3so1390469plx.17
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 11:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=W0yvrJCNySNCn52+IL1OETOtNI6hUhlyn5gBnr+tlWk=;
 b=rJ+JzXWd5XGhhZ4stJXuUOOkEAfOKJ7JDCihUMBK+OKDSlviMHZwu6A1keptjgv5gC
 WSnbqIZHTCKrfDCoRirVKtLiB+VYLm7NhDkT6LJxHG4IsIH1d1Nie7gp3Y8mpoUJ3dVE
 RnNZa8iiN7aEUTKrh9nUJvNxdBRTimdfd8y9DO3MMfsTPHGi4eJUm2PVsx06ItCrPocO
 IK7TQeU8lfdDG3u+On56rPqv/ty3v9ptZuB8eVJsp5Vu+pMrBudEECRVcHv9NTt1EIur
 fpYNo4iFeUQp1vEXtAvGXpD1LBOuH5RpLmVWOvY3An1wg/ZUD0+LVAQFYspZp9NZxrIx
 PMMA==
X-Gm-Message-State: ACgBeo0goy4JzojZ5WmBhMskhK2CW9uHiv1WMseHoGs/NTHfk8VJAxOf
 WSBxdijTPEKLHhGQGISeFfqqddRa/UjxeGxK9Pd2RX2ZW4NXny3WYgCOPzm3DaHgZUE3sjRvTrE
 L8dpV3/B8iWLLlQQJdsPHCK1dUfCW
X-Received: by 2002:a17:90b:1c82:b0:1ee:eb41:b141 with SMTP id
 oo2-20020a17090b1c8200b001eeeb41b141mr4285209pjb.143.1660846462854; 
 Thu, 18 Aug 2022 11:14:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6QokUB9XAiZHout1FdGj0TFG42x0+7uXqK5dl1kBebaN2yKIVrrTUm09/AgqN1PfwicrccCw==
X-Received: by 2002:a17:90b:1c82:b0:1ee:eb41:b141 with SMTP id
 oo2-20020a17090b1c8200b001eeeb41b141mr4285195pjb.143.1660846462606; 
 Thu, 18 Aug 2022 11:14:22 -0700 (PDT)
Received: from xps13.. ([240d:1a:c0d:9f00:4f2f:926a:23dd:8588])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a056a00009000b0052dce4edceesm1960592pfj.169.2022.08.18.11.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 11:14:22 -0700 (PDT)
From: Shigeru Yoshida <syoshida@redhat.com>
To: deller@gmx.de
Subject: [PATCH] fbcon: Properly revert changes when vc_resize() failed
Date: Fri, 19 Aug 2022 03:13:36 +0900
Message-Id: <20220818181336.3504010-1-syoshida@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
 syzbot+a168dbeaaa7778273c1b@syzkaller.appspotmail.com,
 Shigeru Yoshida <syoshida@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fbcon_do_set_font() calls vc_resize() when font size is changed.
However, if if vc_resize() failed, current implementation doesn't
revert changes for font size, and this causes inconsistent state.

syzbot reported unable to handle page fault due to this issue [1].
syzbot's repro uses fault injection which cause failure for memory
allocation, so vc_resize() failed.

This patch fixes this issue by properly revert changes for font
related date when vc_resize() failed.

Link: https://syzkaller.appspot.com/bug?id=3443d3a1fa6d964dd7310a0cb1696d165a3e07c4 [1]
Reported-by: syzbot+a168dbeaaa7778273c1b@syzkaller.appspotmail.com
Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
---
 drivers/video/fbdev/core/fbcon.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index cf9ac4da0a82..825b012debe7 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2401,15 +2401,21 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
-	int resize;
+	int resize, ret, old_userfont, old_width, old_height, old_charcount;
 	char *old_data = NULL;
 
 	resize = (w != vc->vc_font.width) || (h != vc->vc_font.height);
 	if (p->userfont)
 		old_data = vc->vc_font.data;
 	vc->vc_font.data = (void *)(p->fontdata = data);
+	old_userfont = p->userfont;
 	if ((p->userfont = userfont))
 		REFCOUNT(data)++;
+
+	old_width = vc->vc_font.width;
+	old_height = vc->vc_font.height;
+	old_charcount = vc->vc_font.charcount;
+
 	vc->vc_font.width = w;
 	vc->vc_font.height = h;
 	vc->vc_font.charcount = charcount;
@@ -2425,7 +2431,9 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 		rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
 		cols /= w;
 		rows /= h;
-		vc_resize(vc, cols, rows);
+		ret = vc_resize(vc, cols, rows);
+		if (ret)
+			goto err_out;
 	} else if (con_is_visible(vc)
 		   && vc->vc_mode == KD_TEXT) {
 		fbcon_clear_margins(vc, 0);
@@ -2435,6 +2443,21 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 	if (old_data && (--REFCOUNT(old_data) == 0))
 		kfree(old_data - FONT_EXTRA_WORDS * sizeof(int));
 	return 0;
+
+err_out:
+	p->fontdata = old_data;
+	vc->vc_font.data = (void *)old_data;
+
+	if (userfont) {
+		p->userfont = old_userfont;
+		REFCOUNT(data)--;
+	}
+
+	vc->vc_font.width = old_width;
+	vc->vc_font.height = old_height;
+	vc->vc_font.charcount = old_charcount;
+
+	return ret;
 }
 
 /*
-- 
2.37.1

