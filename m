Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EBFCD0EC3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 17:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFDC10F03E;
	Fri, 19 Dec 2025 16:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="gjBlVZ5M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C5610F03D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 16:41:20 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id
 a640c23a62f3a-b735b89501fso244642266b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 08:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1766162479; x=1766767279; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t2kzU44j8jBSDtGQe926o+4fjeshGhfwHjfNhdVR/KY=;
 b=gjBlVZ5M+gm7yEKgxiu6qKZjh62byYVwZdfWhSCFgcnrl5gcsUE7likFCpjbxZf+fO
 1NTGRBVb3bEkFgH4GcCaJt5rYTOEY4tRa8XoCg+uG93KhStn6euUBAysfwOj/vDL5b8L
 bvmvSml6SzleeERw0yn0n7SpF3NNc2lML9x4kyorXCaPjSWB2C3NLbD9OgG1Lmswk4P9
 WS8nuI+oE0N20RL+CHtxHI/s6ipx+cn2vJnNpm4h/djvwA6ZBUwgYBUsPZm5zdsgOCJj
 nHaxVleKV8tAwxybWCk+o3uL4WpEDPPRYVU90WnSMGNFBW7OcwZqOZLI3128W/e2lyJz
 4LbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766162479; x=1766767279;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t2kzU44j8jBSDtGQe926o+4fjeshGhfwHjfNhdVR/KY=;
 b=C/WOWk+jb/6sFDAa478j80pxMGvVh23hBQgmUyzMZ4S4xBmE9EUYZLSr4ibMumPlPy
 aGi4TCV0QzL5P769FOMnG5bvq21GATojAxQVPDn2nlpkLtOfXJiHeVXdPQev6m/6YoK0
 4EAbNvofM38XhozX664UJ780kkPHZmhA7Ja6+V3C3HkXCt7xMUzEXrcOmjxR+JyWffY3
 K5mdnCYqSMdiHGzxOSeLiRHqd6JCTSaMLG0TZzyYKaegXW4cuoKkvVUMbkEkbA8dUMw+
 uj+gnJIv3dvdtZfI7vN9KuWbwnz3rpu2kjEnn9bApqozNCYoTvxVzMDmFRdCJqPQSKUs
 Wh0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0Mqxu1+uJ2FwzcWklRddkI7Pm8/j+LBo6oLmNz4TFHFn2eYY9RwMCj1YGKcMU0iIxICqcRkFcK7M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJ+210W5riDXFPYQG/LVbAWGKaoVRU7Wdo3oJY/qHjwdNkO0Nq
 g2SZmtdlY1MuD4jxSWXBQ6uvIGWxDWSEShvAiewXGpxjY1Lzpy94/a7Bll35wAmqZk4=
X-Gm-Gg: AY/fxX4X4YeNe91ujzzWu7HkRlUdtCFlbbcNF+PA2oQW3fI1Rl8VQvrkFrB/tomj1As
 o7CT0XCYWq+q55MKIEHHfV2+7siQ/4VZCinxc1edi8T/0gjo4toWL00lP+AbE5wwLhqKCGaFbHR
 ltsB2Ysz72OCY725GEI9AjUB/DCx3/xKIWVHVKjrCARL9nKHEBVShlnx35j2OtYIfmBdQ8HgmCX
 fQDlHqQXgwZabBFreKEyDPoubBYWpFJheYGFJ9G6WQ9XQYOUdfOro5yOlmtZzxyNpEge5yqV3eZ
 6dVYZ7QvKZGE3ZbGtR1+VPzI+7YkgBr6omujA4O78k4OQoPe0oXKu76HJL4oHCPR94nbqlQMIsT
 o23/3UZFcTpjlEd8dt3IEBu12dCkVkbkdk3/OOsxPbxeUX2FIGiutQhDwbOOWkq3cSKtk01mRq9
 D6R8zGDWMfrGP5jneDdtSJL90RcS3gGUq58jRGE6f2v4fACfFkne/pyV+e4ytq/El1sozkojtX/
 Hk3xt0EGCa37WlqgdegAjEZ7WFNtgQSaxk=
X-Google-Smtp-Source: AGHT+IEaFbfo58dESu/7UUTqBgyeHYsfx7xP4W4fAJTOuAdSjlywqklvueTJX6xzQc9E0FRh5v+ocg==
X-Received: by 2002:a17:906:6a25:b0:b73:9b49:2dc7 with SMTP id
 a640c23a62f3a-b8037183ebfmr324320966b.52.1766162478678; 
 Fri, 19 Dec 2025 08:41:18 -0800 (PST)
Received: from [192.168.178.182]
 (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:3b89:c600:71a4:84f:6409:1447])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f4ef1fsm270073866b.64.2025.12.19.08.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 08:41:18 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH RFC 0/6] Attempt to bring up display on Milos SoC
Date: Fri, 19 Dec 2025 17:41:06 +0100
Message-Id: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACKARWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0NL3dzMnPxi3dyU4mLdtEQDczNjM0tjc3NTJaCGgqLUtMwKsGHRSkF
 uzkqxtbUAXpnMk2EAAAA=
X-Change-ID: 20251219-milos-mdss-fa0763693775
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766162477; l=3814;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ucfG3/xpPbSz5u5wmkm8abE5HIantGt2GhrnIFQVyic=;
 b=6kFDJkb27+1S/KM6JtihyCmbtRfH48KsMI4CJJ+vZfiHNxUP/S4L+J3+uHLZNu3O/bEmA1LN6
 5ms4n3cr1YuDx9lAahnXN5ZpgXhIzqSkw4Z5VGf6d3ucTmnay9J+m/s
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
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

Hi all,

This is a very WIP RFC series that attempts to add display support for
Milos, in particular on The Fairphone (Gen. 6) using the SM7635.

I have excluded sending panel driver and dt-bindings to reduce the patch
count, since they should not be relevant for now.

The data in the patches is mostly derived from the downstream msm-6.1
kernel for this SoC, named "volcano" downstream.

https://gerrit-public.fairphone.software/plugins/gitiles/platform/vendor/qcom/proprietary/display-devicetree/+/refs/heads/odm/rc/target/15/fp6/display/volcano-sde-common.dtsi

While I'm fairly sure a good chunk of the data is correct (marked "OK"),
there's still many unknowns (marked "TODO" or similar) that you can
see in the patches.

Unfortunately it doesn't work yet, with the screen staying dark and
these errors appearing in dmesg repeatedly.

[    6.541696] [drm:dpu_encoder_frame_done_timeout:2727] [dpu error]enc33 frame done timeout
[    6.587091] [drm:_dpu_encoder_phys_cmd_wait_for_idle] *ERROR* id:33 pp:2 kickoff timeout 0 cnt 1 koff_cnt 1
[    6.587387] [drm:dpu_encoder_phys_cmd_prepare_for_kickoff] *ERROR* failed wait_for_idle: id:33 ret:-110 pp:2
[    6.589509] [drm:dpu_encoder_helper_hw_reset:1763] [dpu error]enc33 ctl 1 reset failure
[    6.637482] [drm:dpu_encoder_frame_done_timeout:2727] [dpu error]enc33 frame done timeout
[    6.680077] [drm:dpu_encoder_phys_cmd_wait_for_commit_done] *ERROR* failed wait_for_idle: id:33 ret:-110 intf:1
[    6.680356] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for commit done returned -110
[    6.684517] [drm:dpu_encoder_helper_hw_reset:1763] [dpu error]enc33 ctl 1 reset failure
[    6.729507] [drm:dpu_encoder_frame_done_timeout:2727] [dpu error]enc33 frame done timeout

The panel is the BOE BJ631JHM-T71-D900 with a Novatek NT37705 driver IC,
running in command mode (not video mode).

The vsync/TE pin should be configured correctly:

~ # cat /sys/kernel/debug/pinctrl/f100000.pinctrl/pinmux-pins | grep GPIO_129
pin 129 (GPIO_129): device ae94000.dsi.0 function mdp_vsync group gpio129

A full dmesg can be found at https://public.lucaweiss.eu/tmp/milos-mdss-log-2025-12-19.txt

Schematics of the device are also available if somebody wants to take a
look, starting on page 109:
https://www.fairphone.com/wp-content/uploads/2025/08/Fairphone-Gen.-6_-Information-on-how-to-repair-dispose-of-and-recycle-EN-NL-FR-DE.pdf

Please let me know if you have any ideas what could be wrong and how to
fix it. Thanks!

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (6):
      soc: qcom: ubwc: Add config for Milos
      drm/msm/dsi: add support for DSI-PHY on Milos
      drm/msm: mdss: Add Milos support
      drm/msm/dpu: Add Milos support
      arm64: dts: qcom: milos: Add MDSS
      arm64: dts: qcom: milos-fairphone-fp6: Enable panel

 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  71 +++++-
 arch/arm64/boot/dts/qcom/milos.dtsi                | 211 ++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h | 284 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  22 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  24 ++
 drivers/gpu/drm/msm/msm_mdss.c                     |   5 +
 drivers/soc/qcom/ubwc_config.c                     |  12 +
 11 files changed, 627 insertions(+), 7 deletions(-)
---
base-commit: 167013d059d5c4a09d49068408044c7a65a26cee
change-id: 20251219-milos-mdss-fa0763693775

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

