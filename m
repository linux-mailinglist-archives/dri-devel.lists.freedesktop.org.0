Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E704C4AED0D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C72810E59E;
	Wed,  9 Feb 2022 08:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6D910E59E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 08:48:22 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id y8so1212408qtn.8
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 00:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VGdhIE5RG442DELBhFAVFpR6XS4hpzdg4tGBVA8vUWc=;
 b=bBl0GrPApUyp9PKJrzZqGzE2GGrRkM9plAwR+Z3Y3Z5PPbvXHnNUw2sEdQOnDJDa+D
 9t9stRmRhcDGlY0eRoXncTHtpPoAln863IeNlUPtg17MZ0YbAffrmhg3aZTSIQ3+Jmos
 dG6lkh1if7EaNBoMufbF7I/un80y68bwIvmDGmv6ROk9kqKUgJNXCPR7MawgLlmjhs92
 3jOnnd0gszVCokFPZ+VApCt89c+cseXtiU29mWJyqc7PLuUjaWIUwHjv9o2vNCm8WoDc
 +TObwhVnJ60Y9FDSIHwpAhak0qGkLSkUY7qQ/lLkliqg0ORRKF0aIo6aZEIAHSrbxJ+I
 DNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VGdhIE5RG442DELBhFAVFpR6XS4hpzdg4tGBVA8vUWc=;
 b=whPJRCmqohd9Vd3YA9/k0F586z641UPkcMocsa8L7GFpMsPijZ1orJMIg8wPniEssS
 Ba9u1PbUqaRk9GzN0xpsjL2ifZAx7ni2uvaa4tySte7mWxJzsMArE6oPOfpO10PX0uYm
 NfqstWwJvFIoSX7e4+5CKYS3PP31zMFGsh7IcZzaELwDd/qJczDqbiXlb4z6u7ihfDxp
 JRh5Eu8Y0SlIAD1J2+5PGkJ7gsMi/lsQjvhbIoFzujkFPQ9ibSek8yZldZ3/SYeOEgKS
 MWnYrMzeozEfDZil3F3sbFfBf2FCdkj8hZgrrJUHnFBvbwh5+Ia8726H49yKbHC3v/5P
 gvfw==
X-Gm-Message-State: AOAM533165imwP2zWJlvBnjlKB7O79CgWmcpUU1wTFCENfWwc5dtUXfv
 QdxB3nVL7eB0VAtm/u85eBd5rqLQKRQ=
X-Google-Smtp-Source: ABdhPJyiOBYIcPBMcHHZfwdm7yELi0V71MeIsgZstO1OYCnrhoVrPiuIYR6gLmFJ5OgCeb24mFuAUw==
X-Received: by 2002:ac8:5a52:: with SMTP id o18mr626863qta.33.1644396501284;
 Wed, 09 Feb 2022 00:48:21 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id w13sm7857289qkb.106.2022.02.09.00.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 00:48:20 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: deller@gmx.de
Subject: [PATCH] fbcon: use min() to make code cleaner
Date: Wed,  9 Feb 2022 08:48:10 +0000
Message-Id: <20220209084810.1561184-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-fbdev@vger.kernel.org, ducheng2@gmail.com,
 penguin-kernel@I-love.SAKURA.ne.jp, daniel.vetter@ffwll.ch,
 Zeal Robot <zealci@zte.com.cn>, deng.changcheng@zte.com.cn,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, cssk@net-c.es,
 geert@linux-m68k.org, svens@stackframe.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Use min() in order to make code cleaner.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/video/fbdev/core/fbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index f36829eeb5a9..61171159fee2 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -602,7 +602,7 @@ static void fbcon_prepare_logo(struct vc_data *vc, struct fb_info *info,
 		save = kmalloc(array3_size(logo_lines, new_cols, 2),
 			       GFP_KERNEL);
 		if (save) {
-			int i = cols < new_cols ? cols : new_cols;
+			int i = min(cols, new_cols);
 			scr_memsetw(save, erase, array3_size(logo_lines, new_cols, 2));
 			r = q - step;
 			for (cnt = 0; cnt < logo_lines; cnt++, r += i)
-- 
2.25.1

