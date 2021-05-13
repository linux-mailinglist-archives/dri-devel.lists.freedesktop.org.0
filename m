Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB3338044D
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 09:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1ED26EE2D;
	Fri, 14 May 2021 07:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71396ECF9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 11:43:14 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id e19so3238391pfv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 04:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s1VuF8QYDuULXzkDfZzy2fYjCpqH9mbnMRRACxdLFrE=;
 b=TcHAG5oowcHzcZI3mZ6g/K6KCH4Z0Hjv7UqYycquOg3rs0MeFZbVCnw6Vr+ddIuGSu
 O2n+75OX5WnDTAjsBeztQEjQLky5rTU4tFtNpWqdDnzBrCla+1xBpNtY6wmGVpao0zs6
 XZFGs7NAr65B7izFpBpgthOCF6EvSDRKDgaqdTgZGDX/TyI1mLNPL3zIJi5ShShfU9S+
 RycAJfSj3unFOB26oPv+GHF3ynwkExSd1I2wDyDHiKzP09WLRXfWWpmx79vcuYvuc7r3
 rqPVOjB0wsd/WIuozpp6FGTdiPYtg9kUqZ7qek6gvyM0soLqj4BQ6NdaePYyoZRiW9CB
 urVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s1VuF8QYDuULXzkDfZzy2fYjCpqH9mbnMRRACxdLFrE=;
 b=p6JWxvi6vay0OJKCXSx/6EWGK+fN7ghJxjLt5iuXrKJ85Qqs668MaBLYgeRwrEEkVP
 vjVusuzhh4fpHko0mfe2QVWyhvAfqVhxzIZXH6ZcZG5Een1ftdUcAGv8npHlOZQIuc/g
 X1g10dpAR8mrgA/a8xEdyeBswcEhsmT9iuYPdrQeAyh93stIJxsnb4WwPDTD57YhrYYA
 dQhnjkP9PKbcFd46nonlbZEiBJuc5cisbryoshiXXcH+58OOYA2vW14rfbg5Hlbfs+m/
 Yw6/yGkzzHXYMp374SjX+CY7Z6/q1pXavf51POuRN8TGGXiTtUTA4AZdqbb0FRN9SXDz
 QfOg==
X-Gm-Message-State: AOAM530lcspMgoTMi6Jl8ICmZdvH3PvI669NC8wPWoXGYLhMpzXsGUvk
 3Z/0ZomPjlbcPCRWWT+w9RNbX37XYZw7BVhC
X-Google-Smtp-Source: ABdhPJzxxUnjWpzts/4jkztJsshg+Yh+/d8t7Zesn8LcEpPJsUjbyVJUF5Mo/eZk4k1uN9Od8zNFlg==
X-Received: by 2002:a17:90b:f97:: with SMTP id
 ft23mr14653681pjb.164.1620906194574; 
 Thu, 13 May 2021 04:43:14 -0700 (PDT)
Received: from yguoaz-VirtualBox.hz.ali.com ([106.11.30.42])
 by smtp.googlemail.com with ESMTPSA id f3sm6341949pjo.3.2021.05.13.04.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 04:43:14 -0700 (PDT)
From: Yiyuan GUO <yguoaz@gmail.com>
To: deller@gmx.de
Subject: [PATCH v2] video/logo: protect against divide by zero when reading
 image
Date: Thu, 13 May 2021 19:42:09 +0800
Message-Id: <20210513114209.60457-1-yguoaz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2105121353530.1204552@ramsan.of.borg>
References: <alpine.DEB.2.22.394.2105121353530.1204552@ramsan.of.borg>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 May 2021 07:32:49 +0000
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
Cc: linux-fbdev@vger.kernel.org, yguoaz@gmail.com, geert@linux-m68k.org,
 dri-devel@lists.freedesktop.org, linux-parisc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In video/logo/pnmtologo.c, the function read_image can read from the
image file an integer 0 and pass it to function get_number255, leading
to a divide by zero problem.

Signed-off-by: Yiyuan GUO <yguoaz@gmail.com>
---
 drivers/video/logo/pnmtologo.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/video/logo/pnmtologo.c b/drivers/video/logo/pnmtologo.c
index 4718d7895..d9e8d1d5b 100644
--- a/drivers/video/logo/pnmtologo.c
+++ b/drivers/video/logo/pnmtologo.c
@@ -116,6 +116,16 @@ static unsigned int get_number(FILE *fp)
     return val;
 }
 
+static unsigned int get_maxval(FILE *fp)
+{
+    unsigned int maxval = get_number(fp);
+
+    if (!maxval)
+	die("%s: invalid maxval zero\n", filename);
+
+    return maxval;
+}
+
 static unsigned int get_number255(FILE *fp, unsigned int maxval)
 {
     unsigned int val = get_number(fp);
@@ -182,7 +192,7 @@ static void read_image(void)
 
 	case '2':
 	    /* Plain PGM */
-	    maxval = get_number(fp);
+	    maxval = get_maxval(fp);
 	    for (i = 0; i < logo_height; i++)
 		for (j = 0; j < logo_width; j++)
 		    logo_data[i][j].red = logo_data[i][j].green =
@@ -191,7 +201,7 @@ static void read_image(void)
 
 	case '3':
 	    /* Plain PPM */
-	    maxval = get_number(fp);
+	    maxval = get_maxval(fp);
 	    for (i = 0; i < logo_height; i++)
 		for (j = 0; j < logo_width; j++) {
 		    logo_data[i][j].red = get_number255(fp, maxval);
-- 
2.25.1

