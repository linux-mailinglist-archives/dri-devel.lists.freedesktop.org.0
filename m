Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC205225E3
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 22:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D2A10ECC2;
	Tue, 10 May 2022 20:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50ACB10ECC2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 20:53:06 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id 137so544pgb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 13:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+HZZAVCUgB4PR5HOSv738zuWZd6viwdct4jZ4FZSIU0=;
 b=oWmYD10TXbpQiIJ/xzCl7IxKeJeRGHnNIYoe2NzGF8Z40b9A089yZu2d/GnlCuSqdo
 q6ZIKf55c1K3Q602V8ZhCPmbryBHAVSR29GFjetx8dPxfxwpeelua5Oe9dNh49PzFRnz
 msgXH2br9qxGT5GVAPoL2u6hWcb2Le2llWrms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+HZZAVCUgB4PR5HOSv738zuWZd6viwdct4jZ4FZSIU0=;
 b=1AbPCKOAwcSl0ToAi+S/UZdidsD02Z8VU+lqDRVELmd47HnhkS9js0jUnlYZBFn4Dw
 wDfN+HSCS0SQRcFUODV2UEhnTECzQEqgne9MC60dP5H6/3Na4uUerWyJJ8EVd78xPLA7
 pjtYJ8PyiNDV84tJKdaoJ96hsWTo3VGnyTJoHu0vnYeDYOTGKxab+PjWGkJQCpcLZhd3
 pvqr8Zb5+kbY/q1s7yUibw2lFbPntPDF8EfUhTA3JJIYifJJ/zPEhMHplSp3UoXYJVG2
 hAseEq/pMDXRSc0THlcql6pRj1kIQVXIDXlglHxZgtxpVghbUZPCgBpvHfHLZ2+C8YBM
 U4GA==
X-Gm-Message-State: AOAM532MBHqpPS1Ih5qVuMvCaFrv6zgD9hW7oh0bJUMLMI0Z2247470G
 dsufgYd7aHyB1AnZXgv6HRLMpEr+qRh2n8Kr5TE=
X-Google-Smtp-Source: ABdhPJx51SH/5x8d1+7L4D8y1N7o70vXFdfzujmC9MaUWLZcKl14rafYh/2Xs1SSzWyvWcqe2COx9Q==
X-Received: by 2002:a62:d0c5:0:b0:50d:a467:3cc8 with SMTP id
 p188-20020a62d0c5000000b0050da4673cc8mr22146677pfg.81.1652215985737; 
 Tue, 10 May 2022 13:53:05 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6f08:624c:c762:d238])
 by smtp.gmail.com with ESMTPSA id
 lr10-20020a17090b4b8a00b001d2edf4b513sm92975pjb.56.2022.05.10.13.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 13:53:05 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/probe-helper: Default to 640x480 if no EDID
Date: Tue, 10 May 2022 13:51:11 -0700
Message-Id: <20220510135101.v2.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
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
Cc: quic_sbillaka@quicinc.com, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 tzimmermann@suse.de, dmitry.baryshkov@linaro.org, quic_aravindh@quicinc.com,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we're unable to read the EDID for a display because it's corrupt /
bogus / invalid then we'll add a set of standard modes for the
display. When userspace looks at these modes it doesn't really have a
good concept for which mode to pick and it'll likely pick the highest
resolution one by default. That's probably not ideal because the modes
were purely guesses on the part of the Linux kernel.

Let's instead set 640x480 as the "preferred" mode when we have no EDID.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Note that this is the second of two related and similar-sounding but
different patches. See also ("drm/probe-helper: For DP, add 640x480 if
all other modes are bad") [1]. I'm hoping to land _both_ of the
patches since they address different issues. This patch addresses the
case of a corrupt EDID and having 640x480 be the default in the
"guessed" modes. The other patch handles the case where the EDID
_isn't_ corrupt but all the modes listed can't be made with the
existing situations. The two patches can land in either order.

Also note that I didn't carry any Tested-by / Reviewed-by tags since
the patch is now quite different.

[1] https://lore.kernel.org/r/20220510131309.v2.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid

Changes in v2:
- Don't modify drm_add_modes_noedid() 'cause that'll break others
- Set 640x480 as preferred in drm_helper_probe_single_connector_modes()

 drivers/gpu/drm/drm_probe_helper.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 682359512996..1fbb9a8c315c 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -516,8 +516,17 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 		count = drm_add_override_edid_modes(connector);
 
 	if (count == 0 && (connector->status == connector_status_connected ||
-			   connector->status == connector_status_unknown))
+			   connector->status == connector_status_unknown)) {
 		count = drm_add_modes_noedid(connector, 1024, 768);
+
+		/*
+		 * Give userspace a hint that we don't have a lot of confidence
+		 * in these modes (we totally guessed) by marking 640x480 as
+		 * preferred. This is low clock rate and incredibly common as
+		 * a failsafe mode.
+		 */
+		drm_set_preferred_mode(connector, 640, 480);
+	}
 	count += drm_helper_probe_add_cmdline_mode(connector);
 	if (count == 0)
 		goto prune;
-- 
2.36.0.550.gb090851708-goog

