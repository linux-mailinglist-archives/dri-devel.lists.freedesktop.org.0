Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF31A350555
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 19:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9606EB23;
	Wed, 31 Mar 2021 17:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BE46EB10
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 16:43:18 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id d12so9001680lfv.11
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=69RsZQP8V4UnpYZy11fJRF0FoC9i++XGLM1UOmQqQnI=;
 b=W+uXbX6Ts6KkMF2YvgXpeKrn+NQqRdR/Qqw0iTCmDUacJN5uw9QId9sK/1BCSrcVji
 qelyj3Ca/VK/LrSTCFxp87yrfducIHJaP1YKI47su8de3N5othmYnmcl9+e4/1U36KpL
 NIv8uYGy0ejNhW6MwNEl+GNSGRHE706RtvukzNBne9zgYurq9b2/gNOKtNQTTV8N6kAG
 lErbXIZLbjyw2S9YKWbXhYqrEGggH1hxvjy0UUwGbnijIWK2znnwe30xROOIoHYos2Od
 XjOfrd7XT8+LnVRNNzbSCez7hr6q9D8NkXoQvyRMDt9NaRzcIHkofMIlVrtNwJsXxTS9
 DRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=69RsZQP8V4UnpYZy11fJRF0FoC9i++XGLM1UOmQqQnI=;
 b=FWDmxtbujTGIrfZx/JvRQ7C4ZCnrHCATP3tetVVrEGs37JdX5y3M2OTz0WmbUtL1t/
 YEuuxDubWOWGCxIve5G1iiTiNHq3ISzQXdsLEbOiL880sclUEgUQCGFqMQOtQIDy5Bh2
 hOlDi1RbB4jI/PnvZiL34ixdEf4WuV55n/66BpKlrMu1rvPaaiWarO/frMCtIVGnwlQN
 RyLOvOTCphy8vakJ4lEA+Ma9S0IMbsmy0xrRZieKusrK0VhPCPHgS4sOjzkqEV+ISNDu
 ztvzOaiIHk+5euAb9b/ZCd/4rCqyAaVdNjbwVP1Q8C1gbj5BCdlps20fN5TCb9QZwWI3
 PSAQ==
X-Gm-Message-State: AOAM530bYl/oD6Zz6oFPLh3zYE7Prxdf+FOeMoDhF8kOI2Qr532Kj33d
 YDd6cK0aU7pmtWk29nDX/90=
X-Google-Smtp-Source: ABdhPJxxYaJdGpCQu9/PXOwwFdn2/rCA6ETsp9cNioEKjPNiv81oe1C3luZPdEINCLjDzVD6tLLIPg==
X-Received: by 2002:a19:c18f:: with SMTP id r137mr2559820lff.519.1617208995107; 
 Wed, 31 Mar 2021 09:43:15 -0700 (PDT)
Received: from localhost.localdomain (cable-hki-50dc2f-26.dhcp.inet.fi.
 [80.220.47.26])
 by smtp.gmail.com with ESMTPSA id b25sm277693lff.268.2021.03.31.09.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 09:43:14 -0700 (PDT)
From: Hassan Shahbazi <h.shahbazi.git@gmail.com>
To: gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jirislaby@kernel.org,
 yepeilin.cs@gmail.com
Subject: [PATCH] fix NULL pointer deference crash
Date: Wed, 31 Mar 2021 19:34:29 +0300
Message-Id: <20210331163425.8092-1-h.shahbazi.git@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 31 Mar 2021 17:21:40 +0000
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
Cc: Hassan Shahbazi <h.shahbazi.git@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch has fixed a NULL pointer deference crash in hiding the cursor. It 
is verified by syzbot patch tester.

Reported by: syzbot
https://syzkaller.appspot.com/bug?id=defb47bf56e1c14d5687280c7bb91ce7b608b94b

Signed-off-by: Hassan Shahbazi <h.shahbazi.git@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 44a5cd2f54cc..ee252d1c43c6 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1333,8 +1333,9 @@ static void fbcon_cursor(struct vc_data *vc, int mode)
 
 	ops->cursor_flash = (mode == CM_ERASE) ? 0 : 1;
 
-	ops->cursor(vc, info, mode, get_color(vc, info, c, 1),
-		    get_color(vc, info, c, 0));
+	if (ops && ops->cursor)
+		ops->cursor(vc, info, mode, get_color(vc, info, c, 1),
+				get_color(vc, info, c, 0));
 }
 
 static int scrollback_phys_max = 0;
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
