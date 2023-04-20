Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BCF6E95B3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 15:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8732E10EC39;
	Thu, 20 Apr 2023 13:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7BA10EC39
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 13:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681996894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pvqliZRx3bFZXXj3TRlgYVKcTGcdvhWSve5Bdh4PePw=;
 b=WoCnfBBE+P1k9rg8mPjvCY4fRjclPLf0tgGglaFnOXWVhzWXxzY1dp2ppB8Fakk8EpwPer
 qzCxktIY3XygTfVZaSRSp1X5a19Jc6oWFcMrtWDQf/hUxGP7jdRcyTR0OEdrwR4h2sRsRl
 iP78zajLav1nfa9+Um44YWGEfBY0FIs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-zEjTW2PpPTGBV86Lq7dAVQ-1; Thu, 20 Apr 2023 09:21:33 -0400
X-MC-Unique: zEjTW2PpPTGBV86Lq7dAVQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-3ef35d8acc0so9471501cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 06:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681996893; x=1684588893;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pvqliZRx3bFZXXj3TRlgYVKcTGcdvhWSve5Bdh4PePw=;
 b=c2kBicjrdfg4tuYsDQqS/xR6H1xycqo0WmjlrcNGuRvXiCwqHjeNVxZjQaBQ82/zSW
 0Obhx/F31a20i8KX0DuSX+907OrUQmin9MGpqT/E64ouB8HNBiOEPhJgTPxoKE9KQ9a4
 Eztz501j264DBxI5kks+MWT3ZF2DOIgP9CSInFvGL+WhhYSVbZyX2ZU5p1lsPbo5M1zM
 uj94/trBT2GebEsgziB/5jku4R4RfgIMVhVURIocunWMlLnHYuR93SOCKGIrBunvYpe+
 eUp8W/jtta/SenujjEDMRyuzGe33FuvfCVUPJ3vEe73466uPyGUJBWmomlobkDCwzdP6
 51yA==
X-Gm-Message-State: AAQBX9fnqMuENXdUg95Usfmd8XsMnjoKssVFRNw7jPaik8nd3kXBiz9z
 O2dIh0cP9H1O/tCI0IwKwozpC9Z2Fk6Y9uh1w7UqWcWXgEBP3KP6hyHz9wEQvJLHCGx1nTBf1qF
 x4+HQaaEk2SJazidtny7oDE0k9xTt
X-Received: by 2002:a05:622a:1:b0:3ef:38a2:9fdb with SMTP id
 x1-20020a05622a000100b003ef38a29fdbmr1373148qtw.60.1681996893053; 
 Thu, 20 Apr 2023 06:21:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350auOzQ5hmP9e5U0LJ8lAJnmKf51VGzZATeBmsYh5r8XbqdU4pHx6XuM5qDCF95LyqUWmJx0nQ==
X-Received: by 2002:a05:622a:1:b0:3ef:38a2:9fdb with SMTP id
 x1-20020a05622a000100b003ef38a29fdbmr1373127qtw.60.1681996892824; 
 Thu, 20 Apr 2023 06:21:32 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a37f702000000b0074acdb873a7sm413158qkj.86.2023.04.20.06.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 06:21:32 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Leon.Huang1@amd.com,
 wenjing.liu@amd.com, qingqing.zhuo@amd.com
Subject: [PATCH] drm/amd/display: return status of abm_feature_support
Date: Thu, 20 Apr 2023 09:21:29 -0400
Message-Id: <20230420132129.3888917-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gcc with W=1 reports
drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm.c:
  In function ‘dmub_abm_set_event_ex’:
drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm.c:138:22: error: variable
  ‘feature_support’ set but not used [-Werror=unused-but-set-variable]
  138 |         unsigned int feature_support;
      |                      ^~~~~~~~~~~~~~~

This variable is not used so remove it.
The status of amb_feature_support should have been returned, so
set ret and return it.

Fixes: b8fe56375f78 ("drm/amd/display: Refactor ABM feature")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
index a66f83a61402..8f285c3be4c6 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
@@ -134,10 +134,9 @@ static bool dmub_abm_set_pipe_ex(struct abm *abm, uint32_t otg_inst, uint32_t op
 static bool dmub_abm_set_event_ex(struct abm *abm, unsigned int full_screen, unsigned int video_mode,
 		unsigned int hdr_mode, unsigned int panel_inst)
 {
-	bool ret = false;
-	unsigned int feature_support;
+	bool ret;
 
-	feature_support = abm_feature_support(abm, panel_inst);
+	ret = abm_feature_support(abm, panel_inst);
 
 	return ret;
 }
-- 
2.27.0

