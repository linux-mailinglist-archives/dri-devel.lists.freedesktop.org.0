Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3E429FFAE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEB06E9A9;
	Fri, 30 Oct 2020 08:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2F7897FB
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 03:31:56 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id k9so2345815pgt.9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 20:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=/T4zGmBDffm929p//CkvLaNebm6nyFAD9zUf2m9Khc4=;
 b=X1UWJ4sPXdTWBIvP+F+d5R4n1cI/VqlbKPsD5DFU8zgNOzIuU0AC9ZGBu9xoK1nvc9
 nLQpLTzbDXu6GLCZo8rs9F21QC1I/ouTPmpeh9aZRrsPJmQsdSz1mmWiVUDlJ2pxCFBQ
 HsUC+ecXEg0DEsWwh1r1i7yZZrhGSZ3sVXc+21L8sIz1N0MiX+FBnYm9qRkgAol30CU9
 gRgT+nzRfWjSCo4tfKtNOWkwE+WpXvnFmyjFz6L8aXVDOX+8DriE1vxyPtxNOs1NbTPq
 K6vUU6cObxxoRI09vmq3cdOPXcYnXPouUZzw9wcZwy++N2E4Sx1IY1REOHmCj4ER+4Yt
 K3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=/T4zGmBDffm929p//CkvLaNebm6nyFAD9zUf2m9Khc4=;
 b=BNPjfMxbhjEXoIUOeGfvUF35Gc/ohLv+WW2/qBgfkCM848/TMFpkGxGkPR6lvrM2XF
 cVKWD5gJi7KCzpUAZXngQn2d01tYehYsOEiJc+JgUcvO9VIQpjr5J0/XaA3gr5qVMrQx
 BjDNdysb57PROpdN9kwpxkEQhiDWHmiI7DCLk38vHRo2IQa7Sylh3/dWDBlRnTGO1NkM
 UqTfwNn44Ce/7hXZKqt7Pe5gG5l31z5la32L5KBBGysevXRcPkfDZXGF0tmPYYV79iWD
 kkGnWWBjGcA43nIAzL8KNHq/6PNjA6Q2MIKkWC5SVpeFCtr+yPHA5wu1RwjrPdD9+6f5
 PfPw==
X-Gm-Message-State: AOAM5338DsHRFYih3R7ww9ZJ3hCsO8MtFxWnmNpzWiTryNgd1HLupQBT
 PDxdpQBSD0IuVVq3/L2A2Q/RpwRGoGQ=
X-Google-Smtp-Source: ABdhPJxkSyJmnutDKVjlWOgdwKq+ADH5KNQw1TaMs0tFikKarD1tEV+1DKJFm/wnchCxAFJxjRiytg==
X-Received: by 2002:a17:90a:ba8d:: with SMTP id
 t13mr376040pjr.38.1604028716631; 
 Thu, 29 Oct 2020 20:31:56 -0700 (PDT)
Received: from my--box ([103.98.79.70])
 by smtp.gmail.com with ESMTPSA id b17sm3932152pgb.94.2020.10.29.20.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 20:31:56 -0700 (PDT)
Date: Fri, 30 Oct 2020 09:01:50 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: outreachy-kernel@googlegroups.com,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megous@megous.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: st7703: use DEFINE_DEBUGFS_ATTRIBUTE with
 debugfs_create_file_unsafe()
Message-ID: <20201030033150.GA275009@my--box>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: melissa.srw@gmail.com, daniel.vetter@ffwll.ch, mh12gx2825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using DEFINE_DEBUGFS_ATTRIBUTE macro with debugfs_create_file_unsafe()
function in place of the debugfs_create_file() function will make the
file operation struct "reset" aware of the file's lifetime. Additional
details here: https://lists.archive.carbon60.com/linux/kernel/2369498

Issue reported by Coccinelle script:
scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
Please Note: This is a Outreachy project task patch.

 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index c22e7c49e077..89b71d4f810d 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -502,15 +502,14 @@ static int allpixelson_set(void *data, u64 val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(allpixelson_fops, NULL,
-			allpixelson_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(allpixelson_fops, NULL, allpixelson_set, "%llu\n");
 
 static void st7703_debugfs_init(struct st7703 *ctx)
 {
 	ctx->debugfs = debugfs_create_dir(DRV_NAME, NULL);
 
-	debugfs_create_file("allpixelson", 0600, ctx->debugfs, ctx,
-			    &allpixelson_fops);
+	debugfs_create_file_unsafe("allpixelson", 0600, ctx->debugfs, ctx,
+				   &allpixelson_fops);
 }
 
 static void st7703_debugfs_remove(struct st7703 *ctx)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
