Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B063429CF64
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 11:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EF26E0A0;
	Wed, 28 Oct 2020 10:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.codeweavers.com (mail.codeweavers.com [50.203.203.244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056F06E0A0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 10:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codeweavers.com; s=6377696661; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ke8ru2nwwTDhxVma02Ma+eTl2gqB9rritpItZX2OXyY=; b=u3fI44cEBiDvjzI5K2GP3f8t7u
 /18UYdaq1UJ7JV+xW3y/4Qz48M38DICnmMH137AIlxw5ibrjYwKksT6Z16bhdc6Rg8cYM48mWNV9A
 PaV7rtGAHhuKWYj6V7Mh8CkZXTfixePh9jbxzne6d3aVrHB83fCk3gK1xYg320WMXMZs=;
Received: from [10.69.141.123] (helo=dell.localdomain)
 by mail.codeweavers.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <pgofman@codeweavers.com>)
 id 1kXiLZ-0006Qe-BC; Wed, 28 Oct 2020 05:06:27 -0500
From: Paul Gofman <pgofman@codeweavers.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 2/2] include: Avoid potentially infinite loop in
 log2_int().
Date: Wed, 28 Oct 2020 13:06:02 +0300
Message-Id: <20201028100602.168752-2-pgofman@codeweavers.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028100602.168752-1-pgofman@codeweavers.com>
References: <20201028100602.168752-1-pgofman@codeweavers.com>
MIME-Version: 1.0
X-Spam-Score: -40.4
X-Spam-Report: Spam detection software,
 running on the system "mail.codeweavers.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Paul Gofman <pgofman@codeweavers.com> ---
 util_math.h
 | 3 +++ 1 file changed, 3 insertions(+) diff --git a/util_math.h b/util_math.h
 index e2fa95f5..f6bbe192 100644 --- a/util_math.h +++ b/util_math.h @@ -38,6
 +38,9 @@ static inline unsigned log2_int(unsigned x) if (x < 2) { return
 0; } + if ( [...] 
 Content analysis details:   (-40.4 points, 5.0 required)
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
 util_math.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/util_math.h b/util_math.h
index e2fa95f5..f6bbe192 100644
--- a/util_math.h
+++ b/util_math.h
@@ -38,6 +38,9 @@ static inline unsigned log2_int(unsigned x)
     if (x < 2) {
         return 0;
     }
+    if (x & 0x80000000) {
+        return 31;
+    }
     for (l = 2; ; l++) {
         if ((unsigned)(1 << l) > x) {
             return l - 1;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
