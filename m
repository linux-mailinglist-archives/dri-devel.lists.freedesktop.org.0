Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 950B32A062C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 14:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3FE6EDCA;
	Fri, 30 Oct 2020 13:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.codeweavers.com (mail.codeweavers.com [50.203.203.244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7B56EDCA
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 13:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codeweavers.com; s=6377696661; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R2/ghOpOjvgrCGIYN63OqPcGbiz0fn9E7LgbNQCb4hs=; b=kZFM86jcrj7ul4/iUDPbgAn+PG
 zajC2fNkiqwCfhZpYWkq92JawuK+9Zr0kJbBbjTPE47PqYUGCPtvgQqdSSh8w0lecFcUR3rMgP9+W
 JSOr/MdGULGCTP8DpWwuxVtNJ8qfY4Bf/q/Ey0hPOPgqLvEQ9uOny1ZIRXaloOchtYMQ=;
Received: from [10.69.141.123] (helo=dell.localdomain)
 by mail.codeweavers.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <pgofman@codeweavers.com>)
 id 1kYU76-0005At-6S; Fri, 30 Oct 2020 08:06:42 -0500
From: Paul Gofman <pgofman@codeweavers.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2 2/2] include: Avoid potentially infinite loop in
 log2_int().
Date: Fri, 30 Oct 2020 16:06:12 +0300
Message-Id: <20201030130612.590543-2-pgofman@codeweavers.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030130612.590543-1-pgofman@codeweavers.com>
References: <20201030130612.590543-1-pgofman@codeweavers.com>
MIME-Version: 1.0
X-Spam-Score: -40.5
X-Spam-Report: Spam detection software,
 running on the system "mail.codeweavers.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Paul Gofman <pgofman@codeweavers.com> --- v2:
 - simplify log2_int implementation. util_math.h | 15 +++++ 1 file changed,
 5 insertions(+), 10 deletions(-) diff --git a/util_math.h b/util_math.h index
 e2fa95f5..32297349 100644 --- a/util_math.h +++ b/util_math.h @@ -33, 16 +33,
 11 @@ Content analysis details:   (-40.5 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 USER_IN_WELCOMELIST    user is listed in 'welcomelist_from'
 -20 USER_IN_WHITELIST      DEPRECATED: See USER_IN_WELCOMELIST
 -20 ALL_TRUSTED            Passed through trusted hosts only via SMTP
 -0.5 BAYES_00               BODY: Bayes spam probability is 0 to 1%
 [score: 0.0000]
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
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
Cc: Paul Gofman <pgofman@codeweavers.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Paul Gofman <pgofman@codeweavers.com>
---
v2:
    - simplify log2_int implementation.

 util_math.h | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/util_math.h b/util_math.h
index e2fa95f5..32297349 100644
--- a/util_math.h
+++ b/util_math.h
@@ -33,16 +33,11 @@
 
 static inline unsigned log2_int(unsigned x)
 {
-    unsigned l;
+    unsigned l = 0;
 
-    if (x < 2) {
-        return 0;
-    }
-    for (l = 2; ; l++) {
-        if ((unsigned)(1 << l) > x) {
-            return l - 1;
-        }
-    }
-    return 0;
+    while (x >>= 1)
+      ++l;
+
+    return l;
 }
 #endif /*_UTIL_MATH_H_*/
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
