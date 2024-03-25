Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EE5889AAD
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 11:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E8910E72F;
	Mon, 25 Mar 2024 10:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hJZh+b5R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D43310E72F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:33:26 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-515a86daf09so1537556e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 03:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711362804; x=1711967604; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IlSF/XzYfABBPkSuT+dcOfufwQU4xv4Qhn96JVhkpvs=;
 b=hJZh+b5R2M0nzAVrg5WT+56t7zVQFs3lLgi7n9WoopN6NQNGTThew9bxa87VHnV6ib
 3h2TIguh2Kbl11ZE/Wn7WV8oAHAumPCICTccSxF/Tnxj6o8Z+YRVNbb1HSDW9zjaukbu
 BpjY2B2tH9BeSVrURqnbn0mwlzKdGvItiXiD0ybUSeRWTJcsCboeK54VTl5mJNAiKQMq
 vX/CglfGb/fovtuCo8pzl679vInUM+R6/USB/+dRxN2/eo6hNXj83qCxIYzRRkdX3Y1s
 VC5Qd6m+SxmPcVv+WPHrzykNBHQF1ziFksPMtIfgOp+MGSjYJDJcOeDqHKqsSb7K9mQ5
 BF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711362804; x=1711967604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IlSF/XzYfABBPkSuT+dcOfufwQU4xv4Qhn96JVhkpvs=;
 b=M9m7nRS4UjjEmeQ/BxJMVcloz2AEI6O1D73rtwrIbIlBsNy4dV4qmQBlj3t5MesDT6
 OGnsQ2gtH/3x5oHJuLRntqOSoAmgaDh2DnpbQeH8dq6jKcmrru6AoPuGxys25rLcYjIJ
 gIsZmrUbpW8BBt0HmpliZVlLAt5S62EVf+1QIjrRX4RD5svc+6TSXqIPNV/h1R349WiD
 afDTRozG+JvMEuNdOqQfQfCuXUERrQQPKojhUOzG3Ry9MvhCCga0sj0WWajIave0/Ikr
 4fXjqhN+9TR5mPp14cqcrOlrilLg0rU8NlJwqMJC6GvOMS0GLClxJPblYqqivLtcbR2G
 XavQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8t2oUs4inNDYmuHNHA0m7FCOAID8x0G546x6/DQmMezQh51mnKSdLrMZagt+pQEl3l//VTMksIDsI+CkQbJGRuBS+Xs6pvmLu7uXgNQW6
X-Gm-Message-State: AOJu0YxacCi48J90BVwYFz1S/aKu+jfm/XfslJxyJ9XHkGTdLYENpwb5
 5wYeVcUBmKr+PuVizm+SYOLBRbGtLpCHzsbHxDmmHcmC/Ky5CcI8wISCYEZOaes=
X-Google-Smtp-Source: AGHT+IE5PQzQdX9H1hgeYc8OivCnUMTMVa7putOS9zMdbQ3op2eD2+msOoq0IZkoh8Nh+wl5dBNx7g==
X-Received: by 2002:a19:f615:0:b0:513:aa0d:d3cc with SMTP id
 x21-20020a19f615000000b00513aa0dd3ccmr4818948lfe.34.1711362804207; 
 Mon, 25 Mar 2024 03:33:24 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 g17-20020a056402091100b0056c0cec810bsm1166030edz.85.2024.03.25.03.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 03:33:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [RESEND PATCH] dt-bindings: display: sony,
 td4353-jdi: allow width-mm and height-mm
Date: Mon, 25 Mar 2024 11:32:27 +0100
Message-Id: <20240325103227.27474-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow width and height properties from panel-common.yaml, already used
on some boards:

  sdm845-sony-xperia-tama-apollo.dtb: panel@0: 'height-mm', 'width-mm' do not match any of the regexes: 'pinctrl-[0-9]+'

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Rob, could you pick up this one? Was on the list for almost a year.


 .../devicetree/bindings/display/panel/sony,td4353-jdi.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml b/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
index b6b885b4c22d..07bce556ad40 100644
--- a/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
@@ -23,6 +23,8 @@ properties:
   reg: true
 
   backlight: true
+  width-mm: true
+  height-mm: true
 
   vddio-supply:
     description: VDDIO 1.8V supply
-- 
2.34.1

