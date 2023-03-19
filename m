Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B71BF6C0261
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 15:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5456910E4E4;
	Sun, 19 Mar 2023 14:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE93A10E4E4
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 14:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679235805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T/hIkiUkQpnPgtTLze7otKxFbigf/WOsrX7aDGKl4Xk=;
 b=ZUFDNS5VTMXfE/5jQCG2rr4Pk0yKG+FxIi4SuAreKl13Pe48Ki1kcH+YUzX+lEvFNiLIkP
 KPqVESyxeLP53r4yWAxVloAfewGPU1z/ugGI4VvJ1+UAhhv4p3VmQU9siM3QDri2xN2LCh
 /bYLexNpNzBXBEnmYme9Yg2Nf2T3V3g=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-I6fMOPI3NKy7D_3wIamLKA-1; Sun, 19 Mar 2023 10:23:24 -0400
X-MC-Unique: I6fMOPI3NKy7D_3wIamLKA-1
Received: by mail-qt1-f200.google.com with SMTP id
 l2-20020ac87242000000b003bfecc6d046so5360516qtp.17
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 07:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679235804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T/hIkiUkQpnPgtTLze7otKxFbigf/WOsrX7aDGKl4Xk=;
 b=bldwJhMCW9BrK95VzJUVXZZO2a+e0qa/7ABDZmDVz7/da8TpFcEsVkN4FLyTrImVb3
 vi5BeHiukV4IiNeU/08LMG1rkWBAEeb6NiEvgyZpAITudu+QMBEUamJa2nEWUALIHCj7
 Vwi78RK8DxxgNQKjiuYniDJSeGJWdFWmN8JH0KKLnKM/TZU6iQCl3LCsSyQvLtzKAtLR
 CDU00hAobTrddU6Q/GdDPbspEFdVLvCQLICquNf4itoC/fJS6crunG2pinXdEN5OeTXJ
 LcY09EBaUiQfUTz1ETFIBNBDUnCaKGwGh/PXsH5N0xkCZ/4+aCt4zn4cWTYSat8gMDI0
 oKmQ==
X-Gm-Message-State: AO0yUKVd/HSpLvajvnlYcoMbPSdy9QHaKwjySyeU4IyDNmkLsQo+dRsT
 cGHub7hClvReyM1B1XSSPOS5Li9ZrbUrXZY+3IGc0JYeH5a0+l8bISUQMcu46FEEqLDAfD0+vJ6
 jwhrjQaQpoi35dndkQT4MFZSQnCcV
X-Received: by 2002:ac8:5c81:0:b0:3b8:2504:e90a with SMTP id
 r1-20020ac85c81000000b003b82504e90amr14481142qta.3.1679235803807; 
 Sun, 19 Mar 2023 07:23:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set+VdKmYQdrgrfLXblYozKf6KZb4B0tCRITCJXTgRYRA6AKoIA4AB44uaiwX/F6ze/obzO3pzQ==
X-Received: by 2002:ac8:5c81:0:b0:3b8:2504:e90a with SMTP id
 r1-20020ac85c81000000b003b82504e90amr14481124qta.3.1679235803572; 
 Sun, 19 Mar 2023 07:23:23 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 o8-20020ac841c8000000b003de4e646d63sm2103047qtm.32.2023.03.19.07.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Mar 2023 07:23:23 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: patrik.r.jakobsson@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 nathan@kernel.org, ndesaulniers@google.com
Subject: [PATCH] drm/gma500: remove unused gma_pipe_event function
Date: Sun, 19 Mar 2023 10:23:20 -0400
Message-Id: <20230319142320.1704336-1-trix@redhat.com>
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clang with W=1 reports
drivers/gpu/drm/gma500/psb_irq.c:35:19: error: unused function
  'gma_pipe_event' [-Werror,-Wunused-function]
static inline u32 gma_pipe_event(int pipe)
                  ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/gma500/psb_irq.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index d421031462df..343c51250207 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -32,17 +32,6 @@ static inline u32 gma_pipestat(int pipe)
 	BUG();
 }
 
-static inline u32 gma_pipe_event(int pipe)
-{
-	if (pipe == 0)
-		return _PSB_PIPEA_EVENT_FLAG;
-	if (pipe == 1)
-		return _MDFLD_PIPEB_EVENT_FLAG;
-	if (pipe == 2)
-		return _MDFLD_PIPEC_EVENT_FLAG;
-	BUG();
-}
-
 static inline u32 gma_pipeconf(int pipe)
 {
 	if (pipe == 0)
-- 
2.27.0

