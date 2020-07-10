Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEE621C04A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 01:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627BC6ED76;
	Fri, 10 Jul 2020 23:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697E96ED62
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 23:02:45 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id m16so1648113pls.5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 16:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lCcFDIfWLkWWzSa31vXd7WJo8Tj5ziQlVQDdDR7C5oY=;
 b=eSk70hMUPgz/3k9+jsUUcyV/2ls1oSHGujFrad521MpLwNTFi3jkIVTuxh/psq9MFB
 gSIBJUNMurjt6JR179DwAKtpBcb2MiH1TvrZsLOlNzPYmhQrjv4tVtyc47GV5lmLb02U
 Y1r1UkBY004HeQ7oKUtQr8gSgIwbtrc7TluJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lCcFDIfWLkWWzSa31vXd7WJo8Tj5ziQlVQDdDR7C5oY=;
 b=YihLlaWSovlKl7awyHGcqVYlv1QHfkfWkBXr7eHNVB9KWYDryqZecOIq+QdR+P2h3U
 YT/Sv591yFFdvSGF3N/qAaAL6iIvLqpq/uj/KcoSvBDGkHUtKKSZvv6mXN34v0lF55LE
 GVHyH+/ws23yknd8zPkEm2ECGe0BOhoSSEitZFPsRcdr8L2aCuJ/L91wigRu9TQJ+S3P
 ZfdfDTAWFhwURV66TOY76jN5g9zYc3MAmeL+pX1I9ODGP1bLj5oJtpzbTTE0IDceliwH
 4HtDl2zQCXxlmQNLolAGuRDlFTCSGYdlIKOy5lnLJkO+ea4N2QRBSikMZ/iti/v7tBzR
 EBeg==
X-Gm-Message-State: AOAM53177ycpppnE2ZA5ZjASyn2RhsXYGInm4AVZBx90CiXIqrFUFTjq
 2Oi/3x9AzbMcWLmHikROHHAOFQ==
X-Google-Smtp-Source: ABdhPJz0vohhKOdR4S48Go6SbBkYwUYpvNGQCHrL60amRJ3jBZ6fmwC9ItCPgsI2PgpcjlqG0gq6pA==
X-Received: by 2002:a17:902:bb82:: with SMTP id
 m2mr4020800pls.61.1594422164622; 
 Fri, 10 Jul 2020 16:02:44 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 16:02:44 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/9] drm/msm: Avoid possible infinite probe deferral and speed
 booting
Date: Fri, 10 Jul 2020 16:02:15 -0700
Message-Id: <20200710230224.2265647-1-dianders@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I found that if I ever had a little mistake in my kernel config,
or device tree, or graphics driver that my system would sit in a loop
at bootup trying again and again and again.  An example log was:

  msm ae00000.mdss: bound ae01000.mdp (ops 0xffffffe596e951f8)
  msm_dsi ae94000.dsi: ae94000.dsi supply gdsc not found, using dummy regulator
  msm_dsi_manager_register: failed to register mipi dsi host for DSI 0
  [drm:ti_sn_bridge_probe] *ERROR* could not find any panel node
  ...

I finally tracked it down where this was happening:
  - msm_pdev_probe() is called.
  - msm_pdev_probe() registers drivers.  Registering drivers kicks
    off processing of probe deferrals.
  - component_master_add_with_match() could return -EPROBE_DEFER.
    making msm_pdev_probe() return -EPROBE_DEFER.
  - When msm_pdev_probe() returned the processing of probe deferrals
    happens.
  - Loop back to the start.

It looks like we can fix this by marking "mdss" as a "simple-bus".
I have no idea if people consider this the right thing to do or a
hack.  Hopefully it's the right thing to do.  :-)

Once I do this I notice that my boot gets marginally faster (you
don't need to probe the sub devices over and over) and also if I
have a problem it doesn't loop forever (on my system it still
gets upset about some stuck clocks in that case, but at least I
can boot up).

Unless someone hates this, I'd expect:
- Get Rob H to say that the bindings are OK (if they are) and yell
  that these really need to be converted to yaml (they do).
- Get Sean or Rob C to land the bindings and driver patch.
- Get Andy or Bjorn to land the dts bits.

NOTES:
- The first patch could land either way.  It's just a cleanup.
- I tried to split the dts files into separate patches to ease
  backporting if desired.  Also because I can't actually test most
  of this hardware myself.


Douglas Anderson (9):
  drm/msm: Use the devm variant of of_platform_populate()
  dt-bindings: msm/dpu: Add simple-bus to dpu bindings
  dt-bindings: msm/mdp5: Add simple-bus to dpu bindings
  drm/msm: Avoid manually populating our children if "simple-bus" is
    there
  arm64: dts: qcom: sc7180: Add "simple-bus" to our mdss node
  arm64: dts: qcom: sdm845: Add "simple-bus" to our mdss node
  arm64: dts: qcom: msm8916: Add "simple-bus" to our mdss node
  arm64: dts: qcom: msm8996: Add "simple-bus" to our mdss node
  ARM: dts: qcom: msm8974: Add "simple-bus" to our mdss node

 .../devicetree/bindings/display/msm/dpu.txt   |  4 ++-
 .../devicetree/bindings/display/msm/mdp5.txt  |  2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi           |  2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |  2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  2 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  2 +-
 drivers/gpu/drm/msm/msm_drv.c                 | 34 ++++++++-----------
 8 files changed, 24 insertions(+), 26 deletions(-)

-- 
2.27.0.383.g050319c2ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
