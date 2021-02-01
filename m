Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB0730B9BB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6F96E90A;
	Tue,  2 Feb 2021 08:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0606E7FE
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 15:55:09 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id q7so3931767iob.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 07:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=nELeOgIxrJtAKHJAjCMFea7kU54jCDRyGoM/8l+Px0E=;
 b=PbufQ9iQC4YKJpi6oMy3xT+FRJfFwu6npdZBUwldcGxzxnaU4aIyZKWgTPkctHDdLu
 yY/sRDRuL9mV9E5azwcmc6MBxYxNkeotLtObuOTVrQfdJqGBaZWlag2sLEzyMqoJMKKX
 yu//gFkqqJS03UT7eEagAH13ZirmLeSBgz2LrAMpzzlorxlWwNrWMHmpmVQ3wqNTKnkF
 yOkqFhAuY4WJqwmpNcXGR3wZeEG4dar6d/H4v3DH/YXmC3uM/tBqwdThE2/+c0KBuqB8
 zoVo+3RAaiLEOK+oXE/MzIqrWyJyjR+6rpT8J2A919nhfaFz/FQggfszs40ckbriEkFL
 XrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nELeOgIxrJtAKHJAjCMFea7kU54jCDRyGoM/8l+Px0E=;
 b=Kh+EMF2BgJDxRXmS0HPp9ZXQCAAEEhoPEqJ4wS8/WT49LNRcTt/RXih7yub+X7vtQD
 ibL23jEYK3kLIrdDfDKzTX71xFCKK1JbQCryr8ouYaFEVi0xHtaxAJJNNZZ6lJOi9Xwe
 v2oLRfmYXch8ifbchJAnbbVrnV84pffLHLdFhYICd1ZIa4Fw2V20/4IxrrDumg942em4
 kTey+SEzt6HQLbBf0Eh2Tp2ub5W5snD/5zrojqClTJRyQELK/eEu1TpX9o/uVAVSWLAU
 5huPKJiVQzEOy6GK/1xlmN/+TlOGhXCdFhK1fvAF+3paL4+V+Zy9UHkAmOz54D/xuCr2
 VJlw==
X-Gm-Message-State: AOAM533jG4GDiYncSBKdZgXIRm8x4pernc8rDJQK4z2oO+BT18VrwwXF
 Z6D+Ci6meM74EDuKy2RhULM=
X-Google-Smtp-Source: ABdhPJw1VnhYH2T8wY5WxQ9OmdQpouFofYvk8eNksW5NkaAlvXq13G9aPbst9Dg3Uw3gPt+Bcpqujw==
X-Received: by 2002:a05:6602:2f93:: with SMTP id
 u19mr13038281iow.110.1612194908883; 
 Mon, 01 Feb 2021 07:55:08 -0800 (PST)
Received: from spring-Precision-5820-Tower.cs.umn.edu
 ([2607:ea00:101:3c74:b4b0:f34c:770:f33f])
 by smtp.gmail.com with ESMTPSA id m19sm9508020ila.81.2021.02.01.07.55.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 07:55:08 -0800 (PST)
From: Wenjia Zhao <driverfuzzing@gmail.com>
To: 
Subject: [PATCH 2/3] fix the out-of-bounds access of dramsr13
Date: Mon,  1 Feb 2021 09:54:58 -0600
Message-Id: <1612194898-44732-1-git-send-email-driverfuzzing@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: linux-fbdev@vger.kernel.org, driverfuzzing@gmail.com,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Wenjia Zhao <driverfuzzing@gmail.com>
---
 drivers/video/fbdev/sis/sis_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 03c736f..6774252 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -4834,7 +4834,7 @@ static int sisfb_post_xgi_ramsize(struct sis_video_info *ivideo)
 	sisfb_post_xgi_delay(ivideo, 1);
 
 	j = (ivideo->chip == XGI_20) ? 5 : 9;
-	k = (ivideo->chip == XGI_20) ? 12 : 4;
+	k = (ivideo->chip == XGI_20) ? 11 : 3;
 	status = -EIO;
 
 	for(i = 0; i < k; i++) {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
