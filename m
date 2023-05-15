Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCD3702A80
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 12:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B5910E197;
	Mon, 15 May 2023 10:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA5E10E197
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 10:32:32 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3063891d61aso11991552f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 03:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684146748; x=1686738748;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BqAu0JmjDleKQlM543bGZcHgQbf6Z8XGhiW21a09aAQ=;
 b=Tz4La/hO+jiAlAXOH2ZQPLEXyK4CwN1/aan7v+r101w9HvEn2CkZQkAqag98DqXpnN
 DLZ9uN9nCH7tQLRyNRsYTLC7CNSyoTgtobulW1+WTFGJPrt+8H6dqDkMdKaQmK6nD3JI
 4cl5v3Q6ncTJKY8gs8Lg5PwgkUme/zfa3RQT0spyGVFQVoo3bzcMKtaCxPMNdCC2Uken
 1gkbMVClWvPPDOGY2o1fP37CYvKqQWC8hLlHfsW7SnSvAIu7YVpQYtE3456F/loZs8Mm
 KGGF3/nI+L/cyIIMahMjIDZpVh3M3n6JwCQCLEhI79AKH/QhMTvELSrxvyAce8wQreMV
 6xFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684146748; x=1686738748;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BqAu0JmjDleKQlM543bGZcHgQbf6Z8XGhiW21a09aAQ=;
 b=MpF4T1raAigZtKoolYP2Q1V9B52Gw/Mux+DoACKZ5fsfouH5xd7LtjGswZs2T5vr5V
 JZsGIe93Ss1nb4QsNEKR54Jevgh/Nw9rVafBqAlT5TVpobvRcAlK/wD5g6XyesZp+2Xh
 JW3FDho0YccVJlih6a2nW52a3pwli4PwJ++9kIwf7t6KfcGU7O+rLAfo1VXQBAhePjMA
 tUFe385YqYPLosoUubW0AMyhf4JjeqPTn6a1J2DWztM7Ws69t383lxQuYadCIUOK3SJY
 99zR/JrqgzQC+3lMJA50AYiiZJhtOYDvyvN2CpeGvxIYkPAvdrkeSNHuKoRbuGIRZZR8
 GZSg==
X-Gm-Message-State: AC+VfDxUVOkdOn+MD8HtQqh6nTtGrGqE/zSQXX2m/5D9HASoJFSn1XDv
 1h8pNGU7SCeYcOdhLbDkfB5aqw==
X-Google-Smtp-Source: ACHHUZ7KZ13Xu/SKezwjzKAinEgmeswPWWjWo9a3m9hp12Jl8Iklcxp1Jheflnku8GT5jGlAoVZgsw==
X-Received: by 2002:adf:ef8c:0:b0:306:8034:b2e4 with SMTP id
 d12-20020adfef8c000000b003068034b2e4mr22445723wro.69.1684146747805; 
 Mon, 15 May 2023 03:32:27 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 c1-20020adffb01000000b00309257ad16csm1223820wrr.29.2023.05.15.03.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 03:32:26 -0700 (PDT)
Date: Mon, 15 May 2023 13:32:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Koby Elbaz <kelbaz@habana.ai>
Subject: [PATCH] accel/habanalabs: fix gaudi2_get_tpc_idle_status() return
Message-ID: <c8000ec5-18e9-4e25-aeb1-3a6ce467d5f6@kili.mountain>
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
Cc: kernel-janitors@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 Dani Liberman <dliberman@habana.ai>, dri-devel@lists.freedesktop.org,
 Dafna Hirschfeld <dhirschfeld@habana.ai>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Tomer Tayar <ttayar@habana.ai>, Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The gaudi2_get_tpc_idle_status() function returned the incorrect variable
so it always returned true.

Fixes: d85f0531b928 ("accel/habanalabs: break is_idle function into per-engine sub-routines")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Not tested.

 drivers/accel/habanalabs/gaudi2/gaudi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index b778cf764a68..5539c84ee717 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -7231,7 +7231,7 @@ static bool gaudi2_get_tpc_idle_status(struct hl_device *hdev, u64 *mask_arr, u8
 
 	gaudi2_iterate_tpcs(hdev, &tpc_iter);
 
-	return tpc_idle_data.is_idle;
+	return *tpc_idle_data.is_idle;
 }
 
 static bool gaudi2_get_decoder_idle_status(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
-- 
2.39.2

