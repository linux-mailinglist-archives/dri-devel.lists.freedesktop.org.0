Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F87E23CB98
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 16:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC696E03B;
	Wed,  5 Aug 2020 14:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1B26E03B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596639141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=NXrvFSV+dNzT7Ew4OtdZ4sl3Tp8McXO1LQ3a/45Cy2g=;
 b=VgEO2S3abJSU7ah2yIBi2IIujY3xSqMoU24naCCQi6dRrGS+Fe+MQn1wAx+6BNxhQec2V6
 y03eJwIKyb+EYKFXvOAvGemZJGwhdzk+ejUS+7CinqNcPAJ7i9NqY41f+qnMX8iqnHMQi3
 C2YH4HKNw9k9FozW4eHZx1azbgbs9hQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-iqQAIbY1PoiWI7JpNKlMrA-1; Wed, 05 Aug 2020 10:52:19 -0400
X-MC-Unique: iqQAIbY1PoiWI7JpNKlMrA-1
Received: by mail-qk1-f197.google.com with SMTP id v188so31071390qkb.17
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 07:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=NXrvFSV+dNzT7Ew4OtdZ4sl3Tp8McXO1LQ3a/45Cy2g=;
 b=gVkQT7Uu0JRjRnuBPEsrY1pMDjLCLPtEUV55Sf5IeuUPPYDgL+uURgxP3xa2FZrw4B
 ZXczK/KqpSiaZp3VoniOKmKEOVb82d4VtfzwF+G8PI0tC+vYnLBHbFf9dHHTpXVCE0ul
 xGvp/W6o5pITpZ+9bhxgG4GSJCyxTb5KdqOy48J2hxVI2IEiXElEOQ/92X0r2rR2yD+r
 Icmv3cSXyHMR+yQ9duRLdjXG44oMmebqU5mYk+CWOE9Bd460DEjPCk6Qvv8b6LPeWmnV
 9ABXM8y6hopssd6mfEpDkOu0VmoL/Mme5r2vsDLkHHLFSDpt6k04VYFSE2hvlt6ZhwwF
 hYrQ==
X-Gm-Message-State: AOAM531aJAp5pSHstQOQWamZ36rpALGDHca5MUb3BajOyE7WceQij58z
 fKztRtI81o8OUU+HRN2D8IkA1fUX9AKw1J1udJnqS0oKk7jInTAQtEvsfU8piQnzs9mthHYpRQ1
 MdCTBnL8P3kp+1UKsokVVMF5y4CNj
X-Received: by 2002:ac8:4a99:: with SMTP id l25mr3768024qtq.132.1596639139243; 
 Wed, 05 Aug 2020 07:52:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp5tU+SNu4wENz/P1igk4DE3nEE4fftblfRV1X1lQLG3yUmxqeZIDzwczARUE/HJu8apixFA==
X-Received: by 2002:ac8:4a99:: with SMTP id l25mr3768003qtq.132.1596639138881; 
 Wed, 05 Aug 2020 07:52:18 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id 22sm1868301qkd.64.2020.08.05.07.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 07:52:17 -0700 (PDT)
From: trix@redhat.com
To: thomas@winischhofer.net,
	b.zolnierkie@samsung.com,
	akpm@osdl.org
Subject: [PATCH] video: fbdev: sis: fix null ptr dereference
Date: Wed,  5 Aug 2020 07:52:08 -0700
Message-Id: <20200805145208.17727-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this representative error

init.c:2501:18: warning: Array access (from variable 'queuedata') results
  in a null pointer dereference
      templ |= ((queuedata[i] & 0xc0) << 3);

This is the problem block of code

   if(ModeNo > 0x13) {
      ...
      if(SiS_Pr->ChipType == SIS_730) {
	 queuedata = &FQBQData730[0];
      } else {
	 queuedata = &FQBQData[0];
      }
   } else {

   }

queuedata is not set in the else block

Reviewing the old code, the arrays FQBQData730 and FQBQData were
used directly.

So hoist the setting of queuedata out of the if-else block.

Fixes: 544393fe584d ("[PATCH] sisfb update")

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/video/fbdev/sis/init.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/sis/init.c b/drivers/video/fbdev/sis/init.c
index dfe3eb769638..fde27feae5d0 100644
--- a/drivers/video/fbdev/sis/init.c
+++ b/drivers/video/fbdev/sis/init.c
@@ -2428,6 +2428,11 @@ SiS_SetCRT1FIFO_630(struct SiS_Private *SiS_Pr, unsigned short ModeNo,
 
    i = 0;
 
+	if (SiS_Pr->ChipType == SIS_730)
+		queuedata = &FQBQData730[0];
+	else
+		queuedata = &FQBQData[0];
+
    if(ModeNo > 0x13) {
 
       /* Get VCLK  */
@@ -2445,12 +2450,6 @@ SiS_SetCRT1FIFO_630(struct SiS_Private *SiS_Pr, unsigned short ModeNo,
       /* Get half colordepth */
       colorth = colortharray[(SiS_Pr->SiS_ModeType - ModeEGA)];
 
-      if(SiS_Pr->ChipType == SIS_730) {
-	 queuedata = &FQBQData730[0];
-      } else {
-	 queuedata = &FQBQData[0];
-      }
-
       do {
 	 templ = SiS_CalcDelay2(SiS_Pr, queuedata[i]) * VCLK * colorth;
 
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
