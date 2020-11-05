Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E9E2A915F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09ED6EE0B;
	Fri,  6 Nov 2020 08:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E83A6EDD9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 18:16:20 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id w7so483260pjy.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 10:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=8DAc+yqZFTta9RaCxZpWb6+nPvWwsd8gU2kgzP9O8nc=;
 b=NDDHLjmKCrwxORbkYjMPorLHS+6jqgXsTkedKqV0bhbGMIiZdDpX3u2gGayQO4iQL9
 VRanoOw05oECWNtoGEqgHQrXzhBNN8O6SCxY0U9pTN9fHeQ2+shkjTqd86TQQ4Mk7zqw
 qSXvQDz/nCLepFzTwLsJoFwn0poktE8iyyzVhd2aeMo6osmBph6keMEaoTnqFMJR0MsI
 1Kk0iOaZzPA6JRPJiqbFMqLB+a7OGB8DnFpvoX32lgMQfM75KOacMW8lJbGKqiBiw+QX
 rVQQz1c2W6RLzaPMjH0mH1eMYar/JrWRhVb8qgqwzJHI9cVqlo7dvgJSMGposDJL2rVQ
 kAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=8DAc+yqZFTta9RaCxZpWb6+nPvWwsd8gU2kgzP9O8nc=;
 b=JhD8vUXQAx/8XPXW2uFBABB2480CzEeamoB//5ti2oqa0I7fLH8hJ7Ci8znTR4Z7R5
 lqhynzVG/ax/tOXLp5U6O1FEfLMRTh1qY/ASArShNclwxgUAGnKIKv+p/4XwLdLEKRrz
 E0PnFQ+wLy+H0W368oj5U0PWTyFC3T/doPI1oBmkzQgEXZNo+WCme/cjPCBaVtjCsbbm
 lGKGMrbH5CVMxtSAloiFNMATvEhKzzFO2P55oo7h33yQ4ZBTRFEqFu+MlgW+AmCjbe4k
 BYyE6g4lPe8MIu3WV3U51l0Qsmxli3BIcSeYF8A/YoCr7t61jBUaldMAJkka4YPu/roM
 iInQ==
X-Gm-Message-State: AOAM530ycR6lsK967vPMGx6ZQGGsRGloza/99vE8NmPcOjLdEfhj3/3j
 036++wC9V4/WpCRcMPAxvXc=
X-Google-Smtp-Source: ABdhPJxFb/P68iReWq/rQU77ozYWg2HQsHgI3Jdm1aL9Q9i/nGtoo22bjdLmibG1FNtQPPFxGYjq/g==
X-Received: by 2002:a17:90b:4a4e:: with SMTP id
 lb14mr1740465pjb.23.1604600179899; 
 Thu, 05 Nov 2020 10:16:19 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id i11sm3259743pfq.156.2020.11.05.10.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 10:16:19 -0800 (PST)
Date: Thu, 5 Nov 2020 23:46:13 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vc4: replace idr_init() by idr_init_base()
Message-ID: <20201105181613.GA42968@localhost>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: mh12gx2825@gmail.com, maxime@cerno.tech
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

idr_init() uses base 0 which is an invalid identifier for this driver.
The idr_alloc for this driver uses VC4_PERFMONID_MIN as start value for
ID range and it is #defined to 1. The new function idr_init_base allows
IDR to set the ID lookup from base 1. This avoids all lookups that
otherwise starts from 0 since 0 is always unused / available.

References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_perfmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
index f4aa75efd16b..7d40f421d922 100644
--- a/drivers/gpu/drm/vc4/vc4_perfmon.c
+++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
@@ -77,7 +77,7 @@ struct vc4_perfmon *vc4_perfmon_find(struct vc4_file *vc4file, int id)
 void vc4_perfmon_open_file(struct vc4_file *vc4file)
 {
 	mutex_init(&vc4file->perfmon.lock);
-	idr_init(&vc4file->perfmon.idr);
+	idr_init_base(&vc4file->perfmon.idr, 1);
 }
 
 static int vc4_perfmon_idr_del(int id, void *elem, void *data)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
