Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EC86D6CAA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 20:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982AB10E386;
	Tue,  4 Apr 2023 18:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E8B10E3B3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 18:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680634414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j0M5QDGBellEBnHKe7QL0tgh7mmOP32p1W0jTZXhVvA=;
 b=N2WJZEJf44Nhp/ZLvK4rdXGakICFLLx53iWptFrzYPFc3OPFY+kHRLDb2Di2KmNEH4T35J
 zfh2ZK8KsWsVl7wp0VgFRr43sAeqdOHcRE8z8h780BfOxT5tZzpQc8g9jqwEK62SniYXxl
 EQIi+mHIGwLsWT8FW5elBAKb2i5OcH0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-ze3ClMPyOxijS9t9gpujGg-1; Tue, 04 Apr 2023 14:53:33 -0400
X-MC-Unique: ze3ClMPyOxijS9t9gpujGg-1
Received: by mail-qv1-f71.google.com with SMTP id
 y19-20020ad445b3000000b005a5123cb627so15050125qvu.20
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 11:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680634413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j0M5QDGBellEBnHKe7QL0tgh7mmOP32p1W0jTZXhVvA=;
 b=eltz+BRzhS3yCJ9rODbOt2bPHqP2cPTPSM80dj6jQFgEZ4BQWlKd5gETnjabOQXbc9
 +FpCTkIisd38nQ9Zm6NUQU8FRjNpToPu62VmYXzfmIrXMYZ+ZT0FRCmNicXf1NPZUU2G
 5OHZUG4pxWkKSI8ohfioMmPC7oaa/BvaluMrNlXCnJzYqEk39czXPvsh61Fq2kuLQGj2
 raDM/dadK1iP8ii87rgGKQnblJuuRayqn8OQT8O8b1zCZkMmXE5EDZ7G1MMrWx9UprIU
 HqVhZPu4kWoxmVOtvLMUFTIfBAh/zdYPyLVP7LoF+oBMSy2SAcrjy7TGagMNF6fgtetv
 bh1g==
X-Gm-Message-State: AAQBX9dgD/h/jOJrbOTF2fqsLbpiRJLUEjg9Ozm7MsVVsXQqr8/Ylabo
 iVUl0K7jp5BLWBybRLyjHsYOHbq0sNe03dLVl7q0EpjCuMGfrq3OA27jdkeZIfwV388aGUolPWN
 /I+IQJMXUxhz2QO7RLPPoCmIGiea2
X-Received: by 2002:a05:622a:138b:b0:3e4:e8be:c3a4 with SMTP id
 o11-20020a05622a138b00b003e4e8bec3a4mr741071qtk.56.1680634412997; 
 Tue, 04 Apr 2023 11:53:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350aHha48xVckQMZBBBOfNL67WaM8+Vk8RyO27WZmOEbqXBCe+GmWfP76gbamBPcNYhZvXnXLKA==
X-Received: by 2002:a05:622a:138b:b0:3e4:e8be:c3a4 with SMTP id
 o11-20020a05622a138b00b003e4e8bec3a4mr741035qtk.56.1680634412694; 
 Tue, 04 Apr 2023 11:53:32 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 f9-20020ac84989000000b003e38f7e4562sm3400800qtq.69.2023.04.04.11.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 11:53:32 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, vladimir.lypak@gmail.com
Subject: [PATCH] drm/msm/mdp5: set varaiable msm8x76_config
 storage-class-specifier to static
Date: Tue,  4 Apr 2023 14:53:29 -0400
Message-Id: <20230404185329.1925964-1-trix@redhat.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tom Rix <trix@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch reports
drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:658:26: warning: symbol
  'msm8x76_config' was not declared. Should it be static?

This variable is only used in one file so should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 1f1555aa02d2..2eec2d78f32a 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -655,7 +655,7 @@ static const struct mdp5_cfg_hw msm8x96_config = {
 	.max_clk = 412500000,
 };
 
-const struct mdp5_cfg_hw msm8x76_config = {
+static const struct mdp5_cfg_hw msm8x76_config = {
 	.name = "msm8x76",
 	.mdp = {
 		.count = 1,
-- 
2.27.0

