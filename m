Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5184E87D995
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 10:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA2610E572;
	Sat, 16 Mar 2024 09:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Mr/B79zO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E55B10E572
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 09:28:13 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-513a6416058so4057904e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 02:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710581291; x=1711186091; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aohr4d7BClKxelEDFFKHCRuY2eGHwzyMDzY2KtCl00o=;
 b=Mr/B79zO2450rREBZK9OSogeY3jh7KqKmtU0fH4ZHrwfmUb1NkTiX/EeFjC1S3TVbf
 f85GNLaKkgS3xI1TDjIW47BnUNIeyrj1BcJlr1GZV2USEphS/2nxnJ+rd+EREUnc8jOg
 SJ7CVAvXFTOHBlkKiFwIt7m5u/UIa7YRWz4uFBkfCYH+DtjQzMwqZFtWrkD/+pEQj1d9
 C0UGMzNRc3dfVWGvoVs2vtXY2UQsseE2rf9CIZ8C6KwwabaF/NFUuNBFFLu2+UGoa5b3
 cATtaxd/z6MVcBJs6KYKILh2XGBv4MgrJvioOObRSQ2PGxfVX0H8T1T2JYPkaBGc7qSl
 Q4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710581291; x=1711186091;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aohr4d7BClKxelEDFFKHCRuY2eGHwzyMDzY2KtCl00o=;
 b=P8oTf333qiEssXeqe9nWzYWSC5QGpwdI06oeOID7Sey6p6qfxAYcbvMpnOENmlEfed
 mmcy8PVx0IQExss5lL2/o7c8IOYr6bON0JRdkRuYlMZl7lQdJ4aM7907eEDJtJxPR62f
 quv9IrmPHo9m94hUhA42wBkOYzw1c7Hh9mZaOdUk4jiQ387Xs1eMwi0vJyvclWdyH4sY
 J2GjCBgd5iMIXjExZsjNQzWYf6LcY3yQ/BiZ5sJ9EPjEtdoNXuqn/ze/rTt/r4YC6mxK
 pVtpz+aSy/xDx9tLpLhhceUqfF++wA+By9G/Pdld6nW4cEnUKwSqkSRJOdd6hOH6Zxm/
 4dkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW90gWwBYKmlOhpU5sAPqW7WnjQe8C2uJjg9mk6z0WHQT1hkNwNBmfT6kKUmpnhd4VRISfceTLEpx7/cDnxDfHvx50JpbfLj8es5KsERLP1
X-Gm-Message-State: AOJu0YzQF8VH/bGQQrJXoA/KP6MQURGqwDtTXTHMdRV+PF957d0diLDv
 Rb3Lczj4PSmJ5NeD22GhQpHg7ew1EwXUxw0hByZn3IIcnuVVL/iEDmsnGn0M1FE=
X-Google-Smtp-Source: AGHT+IEcnp7qiM6IXTp0ox63XBBssfGbXKm5O93H133J9J0QTjrgFwKlcFwMjSWaSlH8P9wUdPdZJQ==
X-Received: by 2002:a19:4353:0:b0:513:cc34:342a with SMTP id
 m19-20020a194353000000b00513cc34342amr4706454lfj.14.1710581290898; 
 Sat, 16 Mar 2024 02:28:10 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c4f9400b00412f8bf2d82sm11391125wmq.28.2024.03.16.02.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Mar 2024 02:28:10 -0700 (PDT)
Date: Sat, 16 Mar 2024 12:28:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, Jun Lei <jun.lei@amd.com>,
 Alex Hung <alex.hung@amd.com>, Daniel Miess <daniel.miess@amd.com>,
 Sung Joon Kim <sungkim@amd.com>,
 Yang Li <yang.lee@linux.alibaba.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: delete unnecessary check in
 dcn35_set_long_vblank()
Message-ID: <56712ad5-ed41-4d64-a317-10cc1275137a@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"timing" is "&pipe_ctx[i]->stream->timing" where ->timing is not the
first struct member of ->stream.  So it's the address which points into
the middle of a struct.  It can't be NULL so delete the NULL check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
index 2e8ec58a16eb..87cfd9f1cec9 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
@@ -1411,10 +1411,7 @@ void dcn35_set_long_vblank(struct pipe_ctx **pipe_ctx,
 		if (pipe_ctx[i]->stream) {
 			struct dc_crtc_timing *timing = &pipe_ctx[i]->stream->timing;
 
-			if (timing)
-				params.vertical_blank_start = timing->v_total - timing->v_front_porch;
-			else
-				params.vertical_blank_start = 0;
+			params.vertical_blank_start = timing->v_total - timing->v_front_porch;
 
 			if ((pipe_ctx[i]->stream_res.tg != NULL) && pipe_ctx[i]->stream_res.tg->funcs &&
 				pipe_ctx[i]->stream_res.tg->funcs->set_long_vtotal)
-- 
2.43.0

