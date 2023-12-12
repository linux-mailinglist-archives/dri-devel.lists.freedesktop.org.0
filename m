Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE17D80F74C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 20:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3EE10E09D;
	Tue, 12 Dec 2023 19:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7374810E09D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 19:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702411087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vio5W2CXh8VIVVnye0VQz+L8cj+HSZDsPzluUFJanUo=;
 b=fzPQ/zDhRC9CxSEIlGYCp0bjwbK4usLZOV1EGPhE/0SgO5pzt+Rg91kEEIzHQmlx8KaGRp
 LmNYppmVsCy07EGN0I/eE1OIfWAOQ71aJfeViIlb17b+UXSkRJO9uW39ZBDX4mC65c0JpJ
 lGJsLbpgH/6Qe0voo65axPa59daDWMI=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-70rKR0r6OT2tOq1YQbhSLw-1; Tue, 12 Dec 2023 14:58:06 -0500
X-MC-Unique: 70rKR0r6OT2tOq1YQbhSLw-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-5d67fc68a82so72024097b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 11:58:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702411085; x=1703015885;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vio5W2CXh8VIVVnye0VQz+L8cj+HSZDsPzluUFJanUo=;
 b=Pe8hJWm1iyMIQvAAc7MrBgBSF7rUp9epOuRSxzw45AElORXfg17r15EQmDjvYmZzU6
 3+v72kmRgWrmJkMFFSIYYRskixteIcwp5F9wMaLFSbiz4ui97MyyI6djaJgnZ7q+BLx6
 EzlY3MFAb5p5mHj7AVtYFVLTzMjTD+uxCItE4UWtD+iTZAWW8cpQmbIBFqYfgiB0DXwe
 J43phHPD5bdtHlTU+Jg7dGhNoJ6nytI0ggJiW74pBdW4j1UgkCLfVOJBH4ttiLYS18ZS
 v1PAfV9PxNHMgtxfwtJmPwW999sJhtirHbbRc7Jyt+SCMDTWLvceNYIpJUjboim168rR
 rxpg==
X-Gm-Message-State: AOJu0YwjN7NLXwfRirfYOgxqqy0XzV+Kl5QLC7/TIKCG/I1BRnlPv2qy
 N5pq/hu7uKUST/zvJhVY8VPI8ZmYSA73L2HdwRbqYJ4lEq0sTu3pOucfXMK7ZGErBh0EAc6eqxV
 HJhgbX56w3G/VRjnEaTXi7XpfmKbx
X-Received: by 2002:a05:690c:3185:b0:5e1:e50b:ab5c with SMTP id
 fd5-20020a05690c318500b005e1e50bab5cmr1351518ywb.1.1702411085546; 
 Tue, 12 Dec 2023 11:58:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzll/KfEEeFGXHCYWsZvQiNpoKwD81UlefsjiQ4B9Q//3lL6+1EqEwS9Dic0uVUQCzigLnuQ==
X-Received: by 2002:a05:690c:3185:b0:5e1:e50b:ab5c with SMTP id
 fd5-20020a05690c318500b005e1e50bab5cmr1351514ywb.1.1702411085342; 
 Tue, 12 Dec 2023 11:58:05 -0800 (PST)
Received: from x1.redhat.com (c-73-214-169-22.hsd1.pa.comcast.net.
 [73.214.169.22]) by smtp.gmail.com with ESMTPSA id
 g184-20020a0dc4c1000000b005a7d46770f2sm3985306ywd.83.2023.12.12.11.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 11:58:04 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
To: hdegoede@redhat.com,
	deller@gmx.de
Subject: [PATCH] fbdev/simplefb: change loglevel when the power domains cannot
 be parsed
Date: Tue, 12 Dec 2023 14:57:54 -0500
Message-ID: <20231212195754.232303-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, treding@nvidia.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the power domains cannot be parsed, the message is incorrectly
logged as an info message. Let's change this to an error since an error
is returned.

Fixes: 92a511a568e4 ("fbdev/simplefb: Add support for generic power-domains")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/video/fbdev/simplefb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 6f58ee276ad1..028a56525047 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -470,7 +470,7 @@ static int simplefb_attach_genpds(struct simplefb_par *par,
 		if (err == -ENOENT)
 			return 0;
 
-		dev_info(dev, "failed to parse power-domains: %d\n", err);
+		dev_err(dev, "failed to parse power-domains: %d\n", err);
 		return err;
 	}
 
-- 
2.43.0

