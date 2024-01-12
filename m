Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCBF82C1DD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 15:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB54210EB14;
	Fri, 12 Jan 2024 14:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8D410EAD9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 14:31:14 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-336788cb261so5176913f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 06:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705069873; x=1705674673; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aw07nAMv5oGDdJtDs7MOtSYaErH1ufSaIcr/61fVq1Y=;
 b=IUj1zU2cAiIrQlOByUtzZvSKz2baBkSXwwvcVNN5A+ancUBg1nR/8mSCtpHkMK1J1a
 78N61fJ3o9ZBMcJtlGvka8LW/jnnsyxkDDQSDC0TIJeALdaJpLstB3isPFsT2qfpXQrH
 FfFHKEpCu0Nwc5OsBWtQHB4u579KQcEifLBb205oe0NhGtBAjdSpT65jUtCCbL7I6QPQ
 B9dvZ73Or42Nz5bumMe9vjyBIGcEy3eBX8viDQ1pJl3e9DGnqrQQRIGpEOwstkVJQpM2
 yflX6EyztQU3fB787gPa/maGIydiyCPJii6GpQJD3JAvEySqHKYYh/Q52mK3ImS3RbWK
 EKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705069873; x=1705674673;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aw07nAMv5oGDdJtDs7MOtSYaErH1ufSaIcr/61fVq1Y=;
 b=osEK1od4Mwz9VRxUZwQaSZKUYqwLlYatDGodxetEPUIiS5v8LowkC/LOkRwuvS9kZj
 +IqVqjEfs+ifx8s9Js/HcJb1BP5ygAuIGz1JzC3MTImkWOX5urivaaojhY43x5x2J0An
 AK1m13JEvoF+fE/e9Y86Ls6LNn7W4BxE29IFrviBW9Xggic/e2Q/er4Hygw1o6bbALss
 LYR+5UzxX+nsaNFOeVbx6ZGahoj59qPa6YPBBWNMWmacyWNYBgmzMADYKA+/7DAT+5/c
 IdWfFN0SYTFUFXMdt7pP+xIJHnNpnej7uoSNToquRWFuZ6q4+wSWfoqeb6UlpMJjEOdD
 28Vw==
X-Gm-Message-State: AOJu0YxHG/EtN0Y3dJHCEBVo2PRZm4b/p9ztIF+zyCrRnXTNuPWAlIP1
 /cHkljCtrbfnNBoKuFJUy4jeII2vU5zQxQ==
X-Google-Smtp-Source: AGHT+IFXMCPqgdEgsPkqLjC6vO/Vvti/WhxuK2GBHGBXb1gKi2FF2DFsgVScc5hicSE+pHcaXwfSew==
X-Received: by 2002:a5d:590f:0:b0:337:7680:8ccf with SMTP id
 v15-20020a5d590f000000b0033776808ccfmr817239wrd.56.1705069873001; 
 Fri, 12 Jan 2024 06:31:13 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b00336b8461a5esm4028872wrn.88.2024.01.12.06.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 06:31:12 -0800 (PST)
Date: Fri, 12 Jan 2024 17:31:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Airlie <airlied@gmail.com>
Subject: [PATCH] drm/nouveau/disp/r535: fix error code in r535_dp_aux_xfer()
Message-ID: <5e2be90e-c7b8-4366-ab93-69040734742e@moroto.mountain>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code was shuffled around but the return wasn't updated.  It should
return "ret" instead of "ctrl".

Fixes: 4ae3a20102b2 ("nouveau/gsp: don't free ctrl messages on errors")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
index 6a0a4d3b8902..027867c2a8c5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
@@ -1080,7 +1080,7 @@ r535_dp_aux_xfer(struct nvkm_outp *outp, u8 type, u32 addr, u8 *data, u8 *psize)
 	ret = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
 	if (ret) {
 		nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
-		return PTR_ERR(ctrl);
+		return ret;
 	}
 
 	memcpy(data, ctrl->data, size);
-- 
2.43.0

