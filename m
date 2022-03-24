Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2152E4E5F13
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 08:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB1D10E770;
	Thu, 24 Mar 2022 07:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9BD10E770
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 07:06:32 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id yy13so7271829ejb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 00:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gyjq9zdDhX6RlmCOAFpwWrWqHwqUR/OK0/YrxmP9mpE=;
 b=Nkjpyy9ZyUVLrvtPqSrFBmdZO0gQSf1HZ/lGBJRfGxBuIBZvGttXqZ9Yi3goQh7XwP
 tfW0Aw+eZLOvvUmz/j/Ai7HSKUSx6k+BabRVwHINjfk8kUS2Uw21dwDbKlTNdy8KtMM9
 p/L3+1ko9RSZVa0HmXTnTCIYJjgGNZCLW3T6qf+DSysj0876kU9Eq+/DTF/Lr4o7XEri
 4TuTn/f6u+YF6CY1ZRbfdZWyq3ruzVaUw/79lzXKHUckh9mj1k+XyDdXCoLwR983TPN5
 /atmeF97PAqqSGvq9PatGilN75mw2mcLsQz0DM5cVYj0HVJBseb8f40KfqE3m/EuD1a1
 GCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gyjq9zdDhX6RlmCOAFpwWrWqHwqUR/OK0/YrxmP9mpE=;
 b=ZFfSHRdM8E1BMdEyRuWDd7HDdSJ5PZVSCE9NMWffZYAtNCXBnqVl48KZYAU+Gjsn9L
 8q1ohlVh0KH8wXxp5f97pZRhqILDTwMpPO6f9/Sfd6WKWcoE+lu4fBla2cj1S6A+dCKR
 E/FA+88n/1OoKsaAozbzhu/oKolNmL7kz8RjA2yH+3d1k5PA9l9n6xneEyrOqCZND1gW
 kQZsVyURSyneJOpLCOgnQvpOEP0mOJS7MIutaplYk+zH5XLxzBqt+VQI9NOPpyGpurAc
 ovNzv/P/j7xN3Yz8QViEJkK1UquAT6sHmRK0CzWIvb27fcAb+eLweT1pczGPIeQ5orIp
 WKMA==
X-Gm-Message-State: AOAM530VTtwxwtAglPz082e5PUQ8KOk6S2Cp8A+HJ+wWc05APe+qqvKC
 5mKpxeZyjjH/wYbkrKS5O/Q=
X-Google-Smtp-Source: ABdhPJyUE78skfv/AqLpnp/mVa6k6QKT8XGbJKI2o7hjsYtY7V0495iNlUhXbzcX1tm6egg7oWrh5w==
X-Received: by 2002:a17:907:60c8:b0:6da:83f0:9eaa with SMTP id
 hv8-20020a17090760c800b006da83f09eaamr4064343ejc.605.1648105591138; 
 Thu, 24 Mar 2022 00:06:31 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 o7-20020a17090608c700b006cef23cf158sm763537eje.175.2022.03.24.00.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 00:06:30 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH] backlight: replace usage of found with dedicated list
 iterator variable
Date: Thu, 24 Mar 2022 08:06:08 +0100
Message-Id: <20220324070608.57057-1-jakobkoschel@gmail.com>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux-fbdev@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Jakob Koschel <jakobkoschel@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To move the list iterator variable into the list_for_each_entry_*()
macro in the future it should be avoided to use the list iterator
variable after the loop body.

To *never* use the list iterator variable after the loop it was
concluded to use a separate iterator variable instead of a
found boolean [1].

This removes the need to use a found variable and simply checking if
the variable was set, can determine if the break/goto was hit.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/video/backlight/backlight.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 4ae6fae94ac2..c05380d7a09e 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -479,19 +479,18 @@ EXPORT_SYMBOL(backlight_device_register);
  */
 struct backlight_device *backlight_device_get_by_type(enum backlight_type type)
 {
-	bool found = false;
-	struct backlight_device *bd;
+	struct backlight_device *bd = NULL, *iter;
 
 	mutex_lock(&backlight_dev_list_mutex);
-	list_for_each_entry(bd, &backlight_dev_list, entry) {
-		if (bd->props.type == type) {
-			found = true;
+	list_for_each_entry(iter, &backlight_dev_list, entry) {
+		if (iter->props.type == type) {
+			bd = iter;
 			break;
 		}
 	}
 	mutex_unlock(&backlight_dev_list_mutex);
 
-	return found ? bd : NULL;
+	return bd;
 }
 EXPORT_SYMBOL(backlight_device_get_by_type);
 

base-commit: f443e374ae131c168a065ea1748feac6b2e76613
-- 
2.25.1

