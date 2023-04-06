Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F47B6D9BE1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 17:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54C610E37F;
	Thu,  6 Apr 2023 15:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1710110EC39
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 15:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680793930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NSn+nRCslEryVjK0HtPumS1/tOG58g41+w55ryKigfs=;
 b=X9N9QCjO1CAUYlr/mCGiinYF5qJifBm8Xi5vX/eoNMMhcUpU1DyeyqO+Ks+jFl7C7e4xA2
 GyWAazvzzeihSoYBpl/lNocxnN45WmhyWvPLKDRYb7Gy+CtRueRl+xMBcz21/ihE5tjEoX
 lc7rI7Wjdk9NhT1j74r/TBadJvKW11U=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-HLKz5PGJO9GglDDYZBDYoQ-1; Thu, 06 Apr 2023 11:12:09 -0400
X-MC-Unique: HLKz5PGJO9GglDDYZBDYoQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 m7-20020a05622a118700b003e4e203bc30so24585416qtk.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 08:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680793929;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NSn+nRCslEryVjK0HtPumS1/tOG58g41+w55ryKigfs=;
 b=JPfH4RyHe4sA943VoAzXvYtwITwrIBVMyvmOE0vrmYf7LLxkVzcW+wpitHByYm72js
 PNg83wW2L+t4AvmjkTF14KJN2tfwh2gTbnItgs8DOJuDEXIXRYIwF2PD8lGqMUXzeUhz
 hX77I8NmMAWHFhE/VZXObwe4fYr/JGDo8ynKUtkCk2RggV++8pp1ddbPr9lnHy4W95TN
 yIwawEcJFaDpx5cSoJz2/aq41PM79ONocIc2h/77B/27TjwsmsmubWwK7zm17RionWIB
 pdJPo0562XlX/BFq9qVDc0t4i3GEGEq5qKTVAZwfq7e0WhaQ5S+OXNlOXnUNOiDy8j+Y
 4zoA==
X-Gm-Message-State: AAQBX9eww29K3oVSkvN4kKZ8OU1g3wm3KBH4xhsEoISk+L6sCA7H2YyK
 CknwAPiVw/5WEymVq3J22gn34IHwnKSlfP1omu3+G4F3RTkIdy3cHPkCR5F2eT/m59ZwKxM1uXI
 LmFDP8m20OFo09tNmj4qqzXQIztSt
X-Received: by 2002:a05:622a:1b8e:b0:3e3:9185:cb15 with SMTP id
 bp14-20020a05622a1b8e00b003e39185cb15mr10026993qtb.7.1680793928910; 
 Thu, 06 Apr 2023 08:12:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350bJN3Jui5XS+d47ytIyV2akENug5dzstCuhxddOfSziXsi9Rpj+9r/J7pf5mpXHRWOYQwBV3Q==
X-Received: by 2002:a05:622a:1b8e:b0:3e3:9185:cb15 with SMTP id
 bp14-20020a05622a1b8e00b003e39185cb15mr10026966qtb.7.1680793928666; 
 Thu, 06 Apr 2023 08:12:08 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 p6-20020ac84606000000b003d3b9f79b4asm470296qtn.68.2023.04.06.08.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 08:12:08 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: emma@anholt.net, mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/vc4: remove unused render_wait variable
Date: Thu,  6 Apr 2023 11:12:03 -0400
Message-Id: <20230406151203.1953812-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch reports
drivers/gpu/drm/vc4/vc4_irq.c:60:1: warning: symbol
  'render_wait' was not declared. Should it be static?

This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/vc4/vc4_irq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_irq.c b/drivers/gpu/drm/vc4/vc4_irq.c
index 1e6db0121ccd..563b3dfeb9b9 100644
--- a/drivers/gpu/drm/vc4/vc4_irq.c
+++ b/drivers/gpu/drm/vc4/vc4_irq.c
@@ -57,8 +57,6 @@
 			 V3D_INT_FLDONE | \
 			 V3D_INT_FRDONE)
 
-DECLARE_WAIT_QUEUE_HEAD(render_wait);
-
 static void
 vc4_overflow_mem_work(struct work_struct *work)
 {
-- 
2.27.0

