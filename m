Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B02017F1C3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7E26E837;
	Tue, 10 Mar 2020 08:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4AE89CD5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 12:53:40 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a132so9750497wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 05:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KH1VNE2zt1RlYZ8rl8KTG3SK8e66WbruwQJVkNVIE98=;
 b=c8WLYOiCVOo3TcVaTgnTw3VXuNGVreLagIf8x9lrWlUI/FaUFPULrCKTH3PRrBMCE0
 NYbkl6g/ahGSwyC083KTSyICT2cjG7uhyV7GpOs7coflZdu7ALapA431f3RimNbGUJJD
 3sp3/TTIMpcr0IjS4IHRJ7eafDL5O34K+6HyfHmuVJpgUIAvHbiE/mwRGuFploheBc4s
 +D8sGjuke/hh0bXwvbAto2Vq1iMJhcZ3GVNADe87INxRAfzMwEAgq/3vp/kkmxJfMs6Y
 bvn93fJ/F7uDE+1oe/1LceBv/cJ+VBP+04+7CHy+emD3+7fYSH5sgMPsanG1/oEObc+v
 q6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KH1VNE2zt1RlYZ8rl8KTG3SK8e66WbruwQJVkNVIE98=;
 b=TZm4Q4I1qcLxYv+8yYVwSsIxrAJdv696PLSbPXPiVg9wfWdYfOL6KT37RpeHl2urt/
 Ubrc7lRX+Oxq/TP4ZqpyBhfbXDPA/to81qf5wtp/Pj4Ts5+lsbxRTgAkG5VW0i2Ixt1g
 U8aftYiolVakWqRs+GJ5k6npJAvRIcSc350SCd9mXtGIVC7xSbr1LfhdSLE2cxwwOwWC
 O3u4rc5mt+x6SanVSD5uYc5kSK4RslvtevxIyvw6Y50N/QjD0mCC6faGFMVZ3FEmEv5s
 fDKUBgSR8Yf+/GzvLBi1pJKqOXEIV7S2PvvL0aKFuF89jjyS+8qFlsfNdfSNGgvCJswM
 MzxQ==
X-Gm-Message-State: ANhLgQ2pgKXTIxpfxJ4oEbxG5LJW7jStN3pELDzJWpjx9IZD1dw+bhnC
 WPq8T4fiIVjPZ3DEclsOVMk=
X-Google-Smtp-Source: ADFU+vtxz72bTI5i3Dyf4QaCSEg7XW/rjT5sFXoowpjaK8taEIwzAXYNCeUCdqFCnzrrMFztHVPfRw==
X-Received: by 2002:a1c:9e85:: with SMTP id
 h127mr19292611wme.145.1583758419327; 
 Mon, 09 Mar 2020 05:53:39 -0700 (PDT)
Received: from localhost.localdomain (178.43.54.24.ipv4.supernova.orange.pl.
 [178.43.54.24])
 by smtp.gmail.com with ESMTPSA id q1sm19653144wrx.19.2020.03.09.05.53.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Mar 2020 05:53:38 -0700 (PDT)
From: Dominik 'disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>
To: 
Subject: [PATCH] Fix off by one in nvidia driver strncpy size arg
Date: Mon,  9 Mar 2020 13:49:46 +0100
Message-Id: <20200309124947.4502-1-dominik.b.czarnota@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:05 +0000
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dominik.b.czarnota@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: disconnect3d <dominik.b.czarnota@gmail.com>

This patch fixes an off-by-one error in strncpy size argument in
drivers/video/fbdev/nvidia/nvidia.c. The issue is that in:

        strncmp(this_opt, "noaccel", 6)

the passed string literal: "noaccel" has 7 bytes (without the NULL byte)
and the passed size argument is 6. As a result, the logic will also
match/accept string "noacce" or "noacceX".

This bug doesn't seem to have any security impact since its present in
the driver's setup and just accepts slighty changed string to enable the
`noaccel` flag.

Signed-off-by: disconnect3d <dominik.b.czarnota@gmail.com>
---

Notes:
    The bug could also be fixed by changing the size argument to
    `sizeof("string literal")-1` but I am not proposing this change as that
    would have to be changed in other places.
    
    There are also more cases like this in kernel sources which I
    reported/will report soon.
    
    This bug has been found by running a massive grep-like search using
    Google's BigQuery on GitHub repositories data. I am also going to work
    on a CodeQL/Semmle query to be able to find more sophisticated cases
    like this that can't be found via grepping.

 drivers/video/fbdev/nvidia/nvidia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index c583c018304d..b77efeb33477 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -1470,7 +1470,7 @@ static int nvidiafb_setup(char *options)
 			flatpanel = 1;
 		} else if (!strncmp(this_opt, "hwcur", 5)) {
 			hwcur = 1;
-		} else if (!strncmp(this_opt, "noaccel", 6)) {
+		} else if (!strncmp(this_opt, "noaccel", 7)) {
 			noaccel = 1;
 		} else if (!strncmp(this_opt, "noscale", 7)) {
 			noscale = 1;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
