Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0303D6BAB8B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 10:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C65A10EA04;
	Wed, 15 Mar 2023 09:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D565410E97A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 09:05:24 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id p6so19361213plf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 02:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678871124;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ugYL4TNtZvwrVkLduJBp9Mq9b8UJmnrNVU/4mmVcPg0=;
 b=RwYVOEKud4H6FfMOxVCyC7xeqK63iZXfuB7LiwcmKzNjZvLojhRlIgnoIK7pcdnv4G
 xt31v1sDDk1UqkRWo4OBlJGOQ6XemZAuHfsNZBOdTGsK8/BIIixccCm0KpsR1HbaSNo8
 zX/pljBKEo+XPpGyi1WY3UqFBzu5uCEDeDcMAYq1syaA8lA9cBDB3q6XAB91Df1lR+7H
 rPajgmAZ7uk5/KDCA1nQjWRUq/truKiAWCuX6OEBYY7L+vkzqTr8Jp5x11hz/0fm3gTK
 ucORaHf8rp4hyqSAxnztPqMQW4ilt8OrfVXDTBjf6qB2D+ZZ2Tcnln3NtdZcuttsUe+R
 37aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678871124;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ugYL4TNtZvwrVkLduJBp9Mq9b8UJmnrNVU/4mmVcPg0=;
 b=YiVZbGHzXS3u3gs9SrwlG6VzdMtyAUOoyVWPYIcB5i+KJgHpjgCSifMdUUfU+27b9P
 evFeYpQiMIVdiCHpkG9eCBzQtY/t65Ef2lWPSIa/SvAOzL2yszD+3NFox7+zAFkJATg/
 hzVA7CwcbDyHxufy5CwrBANG/89KCz3f5Y05Nk2WiT3nqogq3ZE1xBmQ7WOHF4mLZ3+d
 7lP+oN4gHAtxUd8F+zqdCi0N+NqKmjoUR4I7mUhWeo/J9oJgVEc5Tut9FD9Nwn7FSQJZ
 OYPsZKuFMxT4uMEQCOkUD3u4yYZBGqQieK6Zfwdg1KWaKkRFnWuIlgwc0Pdy84MCIolf
 xcaQ==
X-Gm-Message-State: AO0yUKXY7+SAV99Yb5dgn39jQk+OVo9sPF1fZYlbhKNdG545lqdn+y9+
 LBuPEa7pyQWnbXRwvAGR/EQ=
X-Google-Smtp-Source: AK7set9XMoP5ypO0me4udx1ZPpoo3BETNGUFYvDOvil4trx5wm/3hqbffm4zvy4f71yn3y7FbxpyaQ==
X-Received: by 2002:a05:6a20:4b0f:b0:d3:5c72:8fb4 with SMTP id
 fp15-20020a056a204b0f00b000d35c728fb4mr11757239pzb.60.1678871124369; 
 Wed, 15 Mar 2023 02:05:24 -0700 (PDT)
Received: from chcpu13.cse.ust.hk (191host119.mobilenet.cse.ust.hk.
 [143.89.191.119]) by smtp.gmail.com with ESMTPSA id
 q25-20020a62e119000000b005d6999eec90sm3006884pfh.120.2023.03.15.02.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 02:05:23 -0700 (PDT)
From: Wei Chen <harperchen1110@gmail.com>
To: dilinger@queued.net
Subject: [PATCH] fbdev: lxfb: Fix potential divide by zero
Date: Wed, 15 Mar 2023 09:05:18 +0000
Message-Id: <20230315090518.1037674-1-harperchen1110@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, linux-geode@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Wei Chen <harperchen1110@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

var->pixclock can be assigned to zero by user. Without proper
check, divide by zero would occur in lx_set_clock.

Error out if var->pixclock is zero.

Signed-off-by: Wei Chen <harperchen1110@gmail.com>
---
 drivers/video/fbdev/geode/lxfb_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/geode/lxfb_core.c b/drivers/video/fbdev/geode/lxfb_core.c
index 8130e9eee2b4..556d8b1a9e06 100644
--- a/drivers/video/fbdev/geode/lxfb_core.c
+++ b/drivers/video/fbdev/geode/lxfb_core.c
@@ -235,6 +235,9 @@ static void get_modedb(struct fb_videomode **modedb, unsigned int *size)
 
 static int lxfb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 {
+	if (!var->pixclock)
+		return -EINVAL;
+
 	if (var->xres > 1920 || var->yres > 1440)
 		return -EINVAL;
 
-- 
2.25.1

