Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 981DC67D6CE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 21:50:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793F610E2B5;
	Thu, 26 Jan 2023 20:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0AD10E2B5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 20:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674766194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oGi4tyQZKR9EF1nkoMYIGWcX8cZ8bAVtY0RE3pjhZwE=;
 b=dPHieeAt8oj941OD8AhMfDCLwdZAUpBXIkZ4FsAdN30VHnCncVNwibdiam+z46C7OV0w5x
 mr73DuewG7hFd+U7J7klEEAnyfq3z+E0gG2qu1s6KKKW7fV3fSf2F0WMzGjLtbl97EK+bZ
 khuhGYe6bGLtYEHdCKjdhWlAdINz+e0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-124-iNA5HoL-N8-kQtKeak0dKg-1; Thu, 26 Jan 2023 15:49:50 -0500
X-MC-Unique: iNA5HoL-N8-kQtKeak0dKg-1
Received: by mail-qv1-f72.google.com with SMTP id
 e5-20020a056214110500b0053547681552so1704035qvs.8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 12:49:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oGi4tyQZKR9EF1nkoMYIGWcX8cZ8bAVtY0RE3pjhZwE=;
 b=Rg+yU/fXLwkc+eHUxQDZZcn+N4tFzYGXYrB2LrlFXH0CKdSi7dBYsVRhTfMRIEAo7K
 TUd0Pm5ZiNUFGr+FXwxCnY86WxAtHNtopPRR0sLEi2SDolw/WyxV4BY/4yv8bvxYqHc9
 vJYGTW92X9v+sqhRkYnV5KegKpzZ4RIDFqObY1VHldalNHo0rxaejus9f+XYtlRDX4no
 GeAcAhjH9jmpI8SNz976HpXhp4go46suPjjXHkzI0Zgy6QmlEd4kctCA6wO1ltK4vMzK
 nZl6pwqDNJxcUWU/mrPjweWPN48f2GZkJjCqpFJlnw/QszGm3z4rczIw1iiApwrwzGtr
 uXTQ==
X-Gm-Message-State: AO0yUKVeosBp5Rg8EUFEgeOBptWRJuOXtx49bfvHG8iqaPnv5PGq+4Ku
 x7bPiEgRV7DlWrIE0r2GYB4/Joj6Ys7VYI6wz6ecMZySEEu9a7nUYtq49xLCs5ohP2Auden/Gwm
 HysB3WWS1VYBOhVcxogtJFPDffL37
X-Received: by 2002:a05:6214:192c:b0:537:708d:3fef with SMTP id
 es12-20020a056214192c00b00537708d3fefmr11926908qvb.38.1674766190512; 
 Thu, 26 Jan 2023 12:49:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+ugItgaazXYqO9kQT722ufZwbkvuzBNI79A9vAf2gUEGkugVHZxtq7UGpUs+gPeO2hRZ5rIA==
X-Received: by 2002:a05:6214:192c:b0:537:708d:3fef with SMTP id
 es12-20020a056214192c00b00537708d3fefmr11926871qvb.38.1674766190258; 
 Thu, 26 Jan 2023 12:49:50 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 b24-20020a05620a0f9800b006fafaac72a6sm1544573qkn.84.2023.01.26.12.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 12:49:49 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, jun.lei@amd.com, Alvin.Lee2@amd.com,
 Nevenko.Stupar@amd.com, Dillon.Varone@amd.com, george.shen@amd.com,
 rdunlap@infradead.org, David.Galiffi@amd.com
Subject: [PATCH] drm/amd/display: reduce else-if to else in
 dcn32_calculate_dlg_params()
Date: Thu, 26 Jan 2023 12:49:35 -0800
Message-Id: <20230126204935.819030-1-trix@redhat.com>
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

cppcheck reports
drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c:1403:76: style:
  Expression is always true because 'else if' condition is opposite to previous condition at line 1396. [multiCondition]
   } else if (context->res_ctx.pipe_ctx[i].stream->mall_stream_config.type == SUBVP_PHANTOM) {
                                                                           ^
drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c:1396:69: note: first condition
   if (context->res_ctx.pipe_ctx[i].stream->mall_stream_config.type != SUBVP_PHANTOM) {
                                                                    ^
drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c:1403:76: note: else if condition is opposite to first condition
   } else if (context->res_ctx.pipe_ctx[i].stream->mall_stream_config.type == SUBVP_PHANTOM) {

It is not necessary to explicitly the check != condition, an else is simplier.

Fixes: 238debcaebe4 ("drm/amd/display: Use DML for MALL SS and Subvp allocation calculations")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index 0dc1a03999b6..c96cbd88e20d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -1400,7 +1400,7 @@ static void dcn32_calculate_dlg_params(struct dc *dc, struct dc_state *context,
 					/* SS PSR On: all active surfaces part of streams not supporting PSR stored in MALL */
 					context->bw_ctx.bw.dcn.mall_ss_psr_active_size_bytes += context->res_ctx.pipe_ctx[i].surface_size_in_mall_bytes;
 				}
-			} else if (context->res_ctx.pipe_ctx[i].stream->mall_stream_config.type == SUBVP_PHANTOM) {
+			} else {
 				/* SUBVP: phantom surfaces only stored in MALL */
 				context->bw_ctx.bw.dcn.mall_subvp_size_bytes += context->res_ctx.pipe_ctx[i].surface_size_in_mall_bytes;
 			}
-- 
2.26.3

