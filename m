Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2F9774C33
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 23:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962BA10E3F6;
	Tue,  8 Aug 2023 21:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6518110E3F6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 21:03:19 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b9f0b7af65so94584461fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Aug 2023 14:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691528597; x=1692133397;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QHqFXZ6x0OPm4ZMw7WQeV7WZNp4cmRIh/Av5DgwSNhQ=;
 b=GQUbyw4eRYjKwQkU5ZMU/yeNnQVDHGDQdMvp/qWJGIY57WAbwVGFi3beDujQ6DoFkD
 deiVVsvTtEZZT6uz3lACeVQkh5886v4aLsOAyuUfgqCdxir+SLFu3rEcv/obMnTgAxV6
 yeT6l1GhG/sudeo/uTTdKZ6jai9Xn4aKc26RgdSxgq++VhsSyRGJvplJDSb6NoUkD/GT
 n7gasiqw7oDvjknFzGddWUp60RVM3W+FruMhz6u1/NVVghH+5FQtkH0QLVLDIku2uxVB
 KXS6GSjqoyok0rp9k5ki1PYoDqyKfqxCOF6v9cL4guXjzVK7F5scYE3AT77rYIwvzera
 R0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691528597; x=1692133397;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QHqFXZ6x0OPm4ZMw7WQeV7WZNp4cmRIh/Av5DgwSNhQ=;
 b=j5jHHY4UQoks+LJuZdtPY0a4oYHLlX+0NNGL2Q+uUB48LiiVYMzrk9UnDlFSopTb+3
 BUU1uHkb5fMfHtWGuCyG8evOPa+p7lGYA547vfrvOMdJgoZu7dj3gMLfHthrkMGChiPD
 8KLacAwyfSpBZ8nWmBlBtxGTW8B4dc9A73OnaOsyxG2uckhdqLhx5OztHGDYsu/AvGh7
 P5PpV7iXnpTU9mW75iB/n5FNIl+AvGHvGeXFMr0D3U3l8Dfj3sRrcqUO2Y7niOo7ObRt
 DCGFzYt0FHRj/lj/tAaeTE1U+TOk5YaNtQDArlW++6JbI3W6ChdvCNNeq4uttBGYmBpm
 nr0g==
X-Gm-Message-State: AOJu0YyxNYM7Znc1MvftT/IxNEyOdMDorv8zrQN8ihkeasE+T7ya//NW
 IWU2OvVRUjv7aJX90cw1cn7t6w==
X-Google-Smtp-Source: AGHT+IFIE0Szj/KgGDm5MrS0BWlSGQSLooWZrPv7OJdSkMIOa28C2Xb44HY47TOrwSvtshviQefZoA==
X-Received: by 2002:a2e:9d54:0:b0:2b9:dfd1:3808 with SMTP id
 y20-20020a2e9d54000000b002b9dfd13808mr460068ljj.25.1691528597563; 
 Tue, 08 Aug 2023 14:03:17 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a2eb0eb000000b002b6cc17add3sm2431483ljl.25.2023.08.08.14.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 14:03:17 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 08 Aug 2023 23:02:52 +0200
Subject: [PATCH v2 14/14] drm/msm/a6xx: Poll for GBIF unhalt status in hw_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v2-14-1439e1b2343f@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691528566; l=1394;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=adxhdr38vQ+H8w1ud+VW4JLIkAtv3z4AL0XqkuOgPHs=;
 b=XQDGBxuHYfbbYepOx78RUkDMexkbi9oIwe5G+gOBDPTNfeODBiBmltLstJo8wG7FOZvlbmixK
 dJY8My1JyIxAjexcNUki8A3SAwf+Ej9E7lDVtfvwQXhZtaZ6C1DidhH
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some GPUs - particularly A7xx ones - are really really stubborn and
sometimes take a longer-than-expected time to finish unhalting GBIF.

Note that this is not caused by the request a few lines above.

Poll for the unhalt ack to make sure we're not trying to write bits to
an essentially dead GPU that can't receive data on its end of the bus.
Failing to do this will result in inexplicable GMU timeouts or worse.

This is a rather ugly hack which introduces a whole lot of latency.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2313620084b6..11cb410e0ac7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1629,6 +1629,10 @@ static int hw_init(struct msm_gpu *gpu)
 		mb();
 	}
 
+	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
+	if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
+		spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
+
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
 	if (adreno_is_a619_holi(adreno_gpu))

-- 
2.41.0

