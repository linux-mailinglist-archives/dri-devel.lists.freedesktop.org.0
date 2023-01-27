Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2641767DB54
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 02:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1223710E3D8;
	Fri, 27 Jan 2023 01:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2234110E3D8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 01:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674783523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZaWLbVYYzGv21vJO7aGswdiJnWhUW0nGAziQI0ZtQyY=;
 b=O75XAEsABhVtryOQg2zDJYJFny4sUYa1nVt6ArP8MdQiLkRm4gQdrOITxDGKBX42igUiyK
 S1JyWrvcUOa8rKNT5iM1beh0sYX7NZ+t1rOi8SFiOJse3cWVOE1FLOAK3Y1Oj89ObZH6k1
 j273lJ6lT461YtYqj0XuF+HY2tLLO/U=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-222-H4OrTUNIPmGivNpqAKZyag-1; Thu, 26 Jan 2023 20:38:32 -0500
X-MC-Unique: H4OrTUNIPmGivNpqAKZyag-1
Received: by mail-qv1-f70.google.com with SMTP id
 lv8-20020a056214578800b0053477624294so2047503qvb.22
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 17:38:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZaWLbVYYzGv21vJO7aGswdiJnWhUW0nGAziQI0ZtQyY=;
 b=tt8M23PebUDFFsZ8fEUSCrDirAvOoVQDAL5z8ZURlDHkKtNEm0TXcdCwtRDMNiVEwA
 oU8oZWD7jc9EYqoADfeEcQza30PNlspgrxqPP0BTZbdxBhpBgvZ2pA0YrbyFaR+PyaUm
 wWrZzwTgOWBGNliKTbC5PGX4Y60Z3FkEA4goBW2+nzBhbbaG41UHLi3vT5e/UWtEpyKZ
 GCyZzBjTaVhGm5hzgrnvb3bzeIQtHTp4+0BN5BwlFeidonWm8Xk026u9WVOS9QaCHnx4
 7aQ9JtZet3nnKXwkBMK+OUGuom2flEiNYUVWF5LjG8yQivRPXsZY7sZP5JElMnk3Wh5C
 bwJQ==
X-Gm-Message-State: AFqh2krv3k3CXkkBMcRIdWQgB2W6DuriNavHHuwnf90SJK7ZinSBacvg
 41VvyMq0xpJBii+jKXWNGCTvf+Xthe9zlvFC9T8C2Ed0KNHMaJTs8ytBwE2QaG41Khmw3ttwWQJ
 Iu5rLYl19Sm5r2p4vxe5z22jOBr2C
X-Received: by 2002:a05:6214:e8e:b0:4ed:fb72:9186 with SMTP id
 hf14-20020a0562140e8e00b004edfb729186mr82795458qvb.0.1674783511661; 
 Thu, 26 Jan 2023 17:38:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvj0I8ZKFown/tFr5t6mdJxPm3gmzyISiA4AAWzoztipBf2zfexnkIA+fwENP+IzIKg1Fl40g==
X-Received: by 2002:a05:6214:e8e:b0:4ed:fb72:9186 with SMTP id
 hf14-20020a0562140e8e00b004edfb729186mr82795411qvb.0.1674783511392; 
 Thu, 26 Jan 2023 17:38:31 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 dm30-20020a05620a1d5e00b00704a2a40cf2sm2013364qkb.38.2023.01.26.17.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 17:38:30 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Anthony.Koo@amd.com, alex.hung@amd.com,
 aurabindo.pillai@amd.com, Roman.Li@amd.com, wenjing.liu@amd.com,
 Dillon.Varone@amd.com, mwen@igalia.com, dingchen.zhang@amd.com,
 martin.tsai@amd.com, aric.cyr@amd.com, Wesley.Chalmers@amd.com,
 Max.Tseng@amd.com, sivapiriyan.kumarasamy@amd.com, Tony.Cheng@amd.com
Subject: [PATCH] drm/amd/display: reduce else-if to else in
 dcn10_blank_pixel_data()
Date: Thu, 26 Jan 2023 17:38:23 -0800
Message-Id: <20230127013823.832698-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

checkpatch reports
drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c:2902:13: style:
  Expression is always true because 'else if' condition is opposite to previous condition at line 2895. [multiCondition]
 } else if (blank) {
            ^
drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c:2895:6: note: first condition
 if (!blank) {
     ^
drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c:2902:13: note: else if condition is opposite to first condition
 } else if (blank) {

It is not necessary to explicitly the check != condition, an else is simplier.

Fixes: aa5a57773042 ("drm/amd/display: Vari-bright looks disabled near end of MM14")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index bb155734ac93..f735ae5e045f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -2899,7 +2899,7 @@ void dcn10_blank_pixel_data(
 			dc->hwss.set_pipe(pipe_ctx);
 			stream_res->abm->funcs->set_abm_level(stream_res->abm, stream->abm_level);
 		}
-	} else if (blank) {
+	} else {
 		dc->hwss.set_abm_immediate_disable(pipe_ctx);
 		if (stream_res->tg->funcs->set_blank) {
 			stream_res->tg->funcs->wait_for_state(stream_res->tg, CRTC_STATE_VBLANK);
-- 
2.26.3

