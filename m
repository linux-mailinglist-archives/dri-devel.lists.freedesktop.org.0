Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA9219753C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C378189FCC;
	Mon, 30 Mar 2020 07:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E404A6E116
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 15:15:19 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id np9so5192538pjb.4
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 08:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=eOZEHwyhLiVwrcvI4azx0kiz1+8s29d7yo6778qGx/E=;
 b=L0kG5plCpn8C6bTkXsLUcx1wPltxhbs7RgnTXpHANR7D05x0Adp6N8bT9lHnMjpfZK
 2GsyTaaldSFiJx3fwQoaW8MI25a/HtV2Zh3tj+U3Ily2t0MTGkhjA9B7PTJ5cufrlfOg
 0D9hKbDE6AcArLQ87CbdqStgxueddsIfsyToS88BUT0BT00g07L6LMFPYihLNJSQsoEZ
 +UO0hErTyyBRVKCW2z9aRcOcyY9Da9dfoas8SV/pQYRJvXJTfH7k/sa5Cotj1LeudRDo
 N9cDC7BVlyJYDmFxs3ztpA8DlNLf4aSaq1cMxEECyYDMjU+6VZ/w78cptvffmyJYL9Lw
 fQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eOZEHwyhLiVwrcvI4azx0kiz1+8s29d7yo6778qGx/E=;
 b=YzZmQOvcPpGTa/gi1JDz0m1ou1aji0wKRIbRNZpKK0b5LJmp33D047wfUPZWe0g4mT
 kHisOsBpt+GukPUvyqJQJz1nnPkdC3xTjlSfx5/B0oZKsyXi4gzfv6VGnGc2NZSSfPh3
 tp0dy0Bms2enA9s7NF7CousOgXbSbn4DLw2283EaCUxPa2HXHlDzbKemaz6ODVojFl8K
 mgALih3ncAmJAFewf4JHyMssebs2+hPXsikOBAF3fuY2at0teYKkK+Q9SyEiL2uzGCwl
 gJrS7KWH4GJEZOkaydngqZ+ivmIrKfKyAtfDi/LBM4qHp6vvZpTOVlXo8xrOEGcmDoOP
 vOAw==
X-Gm-Message-State: ANhLgQ1OkIKphHtw2KhGF05vFCYtT+Q+Tr3Atc+bRO3y3rAU9ykaalgn
 tgjdVDc8zPSQ5c/Epi0oU0s=
X-Google-Smtp-Source: ADFU+vsY3Swz6pp1AkymSBSWZ30YCmBoRVFPte50OMiTf78PYLBDwAaVhcAdPNjLLlPWRGwYHoESeA==
X-Received: by 2002:a17:90b:3645:: with SMTP id
 nh5mr5628170pjb.104.1585408519476; 
 Sat, 28 Mar 2020 08:15:19 -0700 (PDT)
Received: from localhost (n112120135125.netvigator.com. [112.120.135.125])
 by smtp.gmail.com with ESMTPSA id j21sm418221pgn.30.2020.03.28.08.15.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Mar 2020 08:15:18 -0700 (PDT)
From: Qiujun Huang <hqjagain@gmail.com>
To: b.zolnierkie@samsung.com
Subject: [PATCH] fbcon: fix null-ptr-deref in fbcon_switch
Date: Sat, 28 Mar 2020 23:15:10 +0800
Message-Id: <20200328151511.22932-1-hqjagain@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: daniel.thompson@linaro.org, daniel.vetter@ffwll.ch,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ghalat@redhat.com, sam@ravnborg.org,
 Qiujun Huang <hqjagain@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add check for vc_cons[logo_shown].d, as it can be released by
vt_ioctl(VT_DISALLOCATE).

Reported-by: syzbot+732528bae351682f1f27@syzkaller.appspotmail.com
Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index bb6ae995c2e5..7ee0f7b55829 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2254,7 +2254,7 @@ static int fbcon_switch(struct vc_data *vc)
 		fbcon_update_softback(vc);
 	}
 
-	if (logo_shown >= 0) {
+	if (logo_shown >= 0 && vc_cons_allocated(logo_shown)) {
 		struct vc_data *conp2 = vc_cons[logo_shown].d;
 
 		if (conp2->vc_top == logo_lines
@@ -2852,7 +2852,7 @@ static void fbcon_scrolldelta(struct vc_data *vc, int lines)
 			return;
 		if (vc->vc_mode != KD_TEXT || !lines)
 			return;
-		if (logo_shown >= 0) {
+		if (logo_shown >= 0 && vc_cons_allocated(logo_shown)) {
 			struct vc_data *conp2 = vc_cons[logo_shown].d;
 
 			if (conp2->vc_top == logo_lines
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
