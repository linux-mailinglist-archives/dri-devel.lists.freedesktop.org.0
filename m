Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57C8631A23
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 08:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FF810E145;
	Mon, 21 Nov 2022 07:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BAA10E145;
 Mon, 21 Nov 2022 07:26:07 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id f3so10401643pgc.2;
 Sun, 20 Nov 2022 23:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C1MiOaGlNC43gZkqyEAf4nEibj9lSNJWEeV4vVtbOJE=;
 b=JGYzC6xqmct/PfIsIWjPN63rryv70dobhe3MPkw8h85uVfj85DjOITM2umZT/uEIkW
 fQzlMlsoFaL/uDPE4PT3MotMLZ16xLqfQI5uR/mmqez22GVROEiHybxzj5ET/9EwdImy
 w6dDvpnxM4xgSpoJltBFyuKs6JANcGcU9ycLlLc1Dv6IFuQh/yYY23EIFMymed2xZ7Y0
 7Jcwri8zMp3DyzoqYyU1XNAU39kV0w4zwcexZiV8iY98BSigxr9R/U+PBr+7hyxH9gCa
 KJIS/B2pBx2tY25R8qhNj6MYXUQLJT2ollMY1N+w0dAvPs2UydLM49HJFFwa5pAfhJKu
 Vg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C1MiOaGlNC43gZkqyEAf4nEibj9lSNJWEeV4vVtbOJE=;
 b=y2ZH4Yd64x1Z5LoKdiqrxJU+wonW5fYXmzpeGg253WQCRqJU6r76e1XHBjK+x0g9Mn
 GGbiHUKTgqevGsM69p75k6Q8+gflfD1BNNZNoSLztKg+clYnQwiGI9TaVxWmZAwUwM96
 NIrAWrg7/I8O15VzXYB4Z+hrG0ixJzu2y6QqLR43kLHJ/TCQ06RfiZt1GTLNx1+sVQO2
 qZkRUV81eJqrK77rO09fuY2A+QjV/V5vRwLqW6783iTVvLG8BPVP4JR3HauRzk6RkN0S
 ZgQ9vLJT83y5c5N2Y8a85U4nLuLAx8kMGU7aqON25HhxCNS+IBe1LFZQ+PYvCVJRdBID
 3pcA==
X-Gm-Message-State: ANoB5pkGRazl+fH1xVpT8ZZmtP0QA7QbaUyeuc9wRu6zHmuj//8iAmVc
 uU/Qnl+iBlAtcvEPDBgAtcU=
X-Google-Smtp-Source: AA0mqf4FdlwzUnYoZupo+TMdLcrqocwbaFhD1CVO4P3v50a87ag8Ulr8W9ot/Fuo4EzzPkiR+iLexQ==
X-Received: by 2002:a62:f24e:0:b0:572:149c:e278 with SMTP id
 y14-20020a62f24e000000b00572149ce278mr19200844pfl.8.1669015567395; 
 Sun, 20 Nov 2022 23:26:07 -0800 (PST)
Received: from mail.google.com (125-237-50-34-fibre.sparkbb.co.nz.
 [125.237.50.34]) by smtp.gmail.com with ESMTPSA id
 z18-20020a170902ccd200b0017a032d7ae4sm8933920ple.104.2022.11.20.23.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 23:26:07 -0800 (PST)
Date: Mon, 21 Nov 2022 20:25:58 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
 Rongguang Wei <weirongguang@kylinos.cn>,
 Slark Xiao <slark_xiao@163.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] [next] drm/amdgpu: Replace remaining 1-element array with
 flex-array
Message-ID: <Y3soBt1jmXHUKhW9@mail.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: paulo.miguel.almeida.rodenas@gmail.com, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One-element arrays are deprecated, and we are replacing them with
flexible array members instead. So, replace one-element array with
flexible-array member in struct GOP_VBIOS_CONTENT and refactor the
rest of the code accordingly.

Important to mention is that doing a build before/after this patch
results in no functional binary output differences.

This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
routines on memcpy() and help us make progress towards globally
enabling -fstrict-flex-arrays=3 [1].

Link: https://github.com/KSPP/linux/issues/79
Link: https://github.com/KSPP/linux/issues/238
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836 [1]

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
This should be the last one-element array that had references in source
code. Given the way it was used, no *.c code change was required.

I will move on to the atombios.h in the radeon driver.
---
 drivers/gpu/drm/amd/include/atombios.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
index 4dc738c51771..b78360a71bc9 100644
--- a/drivers/gpu/drm/amd/include/atombios.h
+++ b/drivers/gpu/drm/amd/include/atombios.h
@@ -9292,7 +9292,7 @@ typedef struct {
 
 typedef struct {
   VFCT_IMAGE_HEADER   VbiosHeader;
-  UCHAR   VbiosContent[1];
+  UCHAR   VbiosContent[];
 }GOP_VBIOS_CONTENT;
 
 typedef struct {
-- 
2.37.3

