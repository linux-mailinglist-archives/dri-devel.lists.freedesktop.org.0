Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B61268567
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001216E1F9;
	Mon, 14 Sep 2020 07:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A337B6E137;
 Sat, 12 Sep 2020 10:27:18 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id z17so409257pgc.4;
 Sat, 12 Sep 2020 03:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MDZ5tcssoN7AbeNjNp+bLVbRjIJciCMr92xa5Hx/HY4=;
 b=nNZi/QPOo0AwKKxuth4gfBStBk+2tlBba7+k/2APtcsgykjdf9wSvxxN3TQLwVmlOz
 figSwPN80C7NwjRwMaZVyVYCRZyAS0QTEv/r1woDUXTcxGX2NdsLZmL5lXa2pRDQa3K8
 oIm/XR7pFMYBFziXhzpNimhFax9cD+dqmaq0YVqoGzs9qLigylhsDMJib5J3MA6+q6sU
 X7mMzbx5NmFWjChZhaoMopScwe5HKKM+2JzAiMeo0KygmJRdKZPlliieCQF7vAzapiGk
 8MY0vhND/ectdugWWQQFdoiWvbcmisZxkXHLjvxQ7JwE0BRFVilm2ZnYmDTrzbsXKcd1
 ZLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MDZ5tcssoN7AbeNjNp+bLVbRjIJciCMr92xa5Hx/HY4=;
 b=UEKiFo3eOMGn2VfSTscuY+GJR/6oziudvz4ACzT4PfVxy1IdoX21sfQYsSDNQQqxsp
 9lPP54BcAdH+Cdt8TXLE0vlzYz1Q05ZDoOW2wuj2IrspjMFlfODKr8ZUZtM1op0W4J9D
 4dlo23c4YnoLve4CrOL63A0/IHFHwszpFHzYqXs3iF/T4gH5UQdVGIg2idwM6qVWqipx
 TMe8F1bflDbLs0RaLo/VufT1JRSfJhXN+1v7ct8BINxaAffKVPlAPYF/1hOdfyTCtOjP
 2PCMnox9wiqY+57tR2dcxIgz3zN3SyJ0OMrQKyqypkwq7ZMG1h4wCC7fkspUv8IzyrzD
 q87w==
X-Gm-Message-State: AOAM533RfZfXsb1WLxm2jhRUYJYyhmvTEFaFCqTYHneEsJHSTRxMmdj2
 ZthU+gSwLb6GdJc1qJuzaT8=
X-Google-Smtp-Source: ABdhPJxxWnEKYjAbcCapguCSGmEUGdBpDiFLyNyEkVyiOZddIbZLkp/S9efbYDisB/iwqK5b/ZRk/w==
X-Received: by 2002:aa7:961b:0:b029:13e:d13d:a140 with SMTP id
 q27-20020aa7961b0000b029013ed13da140mr5964208pfg.40.1599906438045; 
 Sat, 12 Sep 2020 03:27:18 -0700 (PDT)
Received: from ZB-PF0YQ8ZU.360buyad.local
 (f.a4.5177.ip4.static.sl-reverse.com. [119.81.164.15])
 by smtp.gmail.com with ESMTPSA id g21sm4910276pfh.30.2020.09.12.03.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 03:27:17 -0700 (PDT)
From: Zhenzhong Duan <zhenzhong.duan@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/a6xx: fix a potential overflow issue
Date: Sat, 12 Sep 2020 18:25:58 +0800
Message-Id: <20200912102558.656-1-zhenzhong.duan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: freedreno@lists.freedesktop.org, jonathan@marek.ca, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
 dri-devel@lists.freedesktop.org, sean@poorly.run,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's allocating an array of a6xx_gpu_state_obj structure rathor than
its pointers.

This patch fix it.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index b12f5b4..e9ede19 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -875,7 +875,7 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
 	int i;
 
 	a6xx_state->indexed_regs = state_kcalloc(a6xx_state, count,
-		sizeof(a6xx_state->indexed_regs));
+		sizeof(*a6xx_state->indexed_regs));
 	if (!a6xx_state->indexed_regs)
 		return;
 
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
