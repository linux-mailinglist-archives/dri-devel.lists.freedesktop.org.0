Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E45D078585D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 14:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055FC10E434;
	Wed, 23 Aug 2023 12:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE90010E42F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 12:56:16 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2bba6fc4339so86130121fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 05:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692795375; x=1693400175;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WML/yephaQhDmSkYaQilPoOdlfPN/mMwj3HRzRGa9sQ=;
 b=ceQgV3ViQC6BYsSciNJ8Sb77oNmOUxrP42TGeRQVplyv0/Syln37fBYK6c/1XoLIeu
 2sXKIHaSaKzH2Q7veoq6uznglB/64POjlU2WXtLLQLB9pG74trW5upvv1N6aB94BOKmu
 GiU2Ed1qsR3mlHR5JUyHicD4KUe3VhL5MD/7emkgO6L38RrQ+B7g3+0qvE3Xl8daue5S
 DaEq+vghyPCFt/NlsFQURtG0L3I8SSWqH9NXVlYjbEeJjM4t4+NFwZ4zY5i/o/53S7pH
 r3ldO5XfIaFcVUUKWxZAFZXoxhDQW00IR1vw3YU/YxeR0v1j0rWTERimzU8ZFD0c76SL
 pjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692795375; x=1693400175;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WML/yephaQhDmSkYaQilPoOdlfPN/mMwj3HRzRGa9sQ=;
 b=Y619JKRDczlif/1JHibwApoxzNXp3+OX+dmf8Gri5JHnb6wSFLebk0gQEwnzyoiJ1R
 ocTZVmEfiGVcwm4Pd4kyTMJnh/eLyjTjDKaNYQVo3uNeKLDE3KN3Xvi3LDuK4z80a4Kl
 LSYAElI62z/SdFozX7cv3XrzW/CJQYo/S2d1uHvdKBeHci2h9hzAjAlY/jeYbwRi9S24
 r/QAhjufTAvHLyljvd2RuocFfusRoO3VzIyvHJexRfnc9sU6FYpxzm/CvGadHSgDFmHZ
 k6ZjZrdw3M8pjpup0V14yGoQ/hN/quDN1lCADIeFk9AW5kZyp9jhmTl18jJxgeGg70xU
 wO/w==
X-Gm-Message-State: AOJu0Yz6dnNF00IxMrNNpf0ft9QsC9e4HLr5Y+b0D8CtfqLqLSWrOMse
 gkHiwVX8LrP8/cI6t2VncSS/Fg==
X-Google-Smtp-Source: AGHT+IEuUJpmZVu+/uPNhfKbdCCkm0GkQTrh1fP5WTUuymrLJwbuyLzlFyb6c6K3+SohT5jzeUQAsg==
X-Received: by 2002:a2e:3208:0:b0:2bc:d5c3:e86e with SMTP id
 y8-20020a2e3208000000b002bcd5c3e86emr3279689ljy.4.1692795375196; 
 Wed, 23 Aug 2023 05:56:15 -0700 (PDT)
Received: from [192.168.1.101] (abyj76.neoplus.adsl.tpnet.pl. [83.9.29.76])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05651c011200b002b6db0ed72fsm3220256ljb.48.2023.08.23.05.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 05:56:14 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 23 Aug 2023 14:56:03 +0200
Subject: [PATCH v3 10/10] drm/msm/a6xx: Poll for GBIF unhalt status in hw_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v3-10-4ee67ccbaf9d@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v3-0-4ee67ccbaf9d@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v3-0-4ee67ccbaf9d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692795358; l=1394;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=S69YtysEIHJMxY5KNnuCyMTYR/1rqHR9OdffW35mR5k=;
 b=C+vhtS17NfkOlAy63aCz44wrp4s5iNe+t3ePly8Xm3w/2HTmaNPacD2OedVXggpsO/jOlFh+w
 dVmnJNP5eMbDggeTQAkCqDDvoveGRVe/ElqK1WiZmLPox+EHCX5SA+Z
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
2.42.0

