Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A03853ACB5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 20:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F3310F0A9;
	Wed,  1 Jun 2022 18:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4437910F440
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 18:23:32 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id h1so2504312plf.11
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 11:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/JhQL6K3uh3O984WIozZ8SgUhIwo1E2fCaDixGouuFc=;
 b=bQe+znboLg5KVUPXFanhDzZUyTtd8/DqaO3vDJEG8jvos5lAcS8YRMPwR4YULDJXsj
 VUwdHTs5Rva3cnmIkL6+hJJYk5zczz5bB21jHPGfDzUxQeai6Mz3pg6hyEPKCZRlKVL6
 8XfbVXwlYmCQe4tsOJqMV7rgw065OFTvi1l/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/JhQL6K3uh3O984WIozZ8SgUhIwo1E2fCaDixGouuFc=;
 b=0EiRzC4cw1RtfrMAtARgqzT8ZiNkPr4QgMK+ZswuCW90ZXV3XXehvS9y3MIaoos1K4
 DlNZsHUM5C0jv2uUEt300MUWXZOTpkollYyRfPdJCUIjYsQCFe6BDBU5qTBLduMvc3oa
 XxUSRpAi9fAEkKuCxq8b2+9SRHjbHJ4f78Hg1ndNaTnHU5a823U7QaVf1LC51eFxkcN9
 MQ0n4zhzr8Psw4/J0Aet2Z+kjuDxSRO91rCvFGQscilb5Qy1YfaTOhfcVjbbpF94ZJzz
 q44dDhB4aIieypUJ5327bMz5joWDDkAje8yza0aWyjMMWv7nfIHTKrOROJCfXrBGgjgZ
 6PKQ==
X-Gm-Message-State: AOAM532SKU394Jq6q/5G5JF9J3Iih4pLL4bGxyxvVotz4smCg3xm7AiA
 3LlzpDkNi/Ihpb5LcpDWlzd5valbQ5SlHfEc
X-Google-Smtp-Source: ABdhPJxkZcEEXs4C3T4YbCZSNWjdVM2FImDp58YVkoQ7Y7Nye2+tmcgRAy4DLVeQEFjt+JV58ido0A==
X-Received: by 2002:a17:90b:33ca:b0:1dc:e5b8:482b with SMTP id
 lk10-20020a17090b33ca00b001dce5b8482bmr35533108pjb.165.1654107811654; 
 Wed, 01 Jun 2022 11:23:31 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:2f43:87c7:551a:ca93])
 by smtp.gmail.com with ESMTPSA id
 ie12-20020a17090b400c00b001e2f0333a86sm1702300pjb.12.2022.06.01.11.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:23:31 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v4] drm/probe-helper: Default to 640x480 if no EDID on DP
Date: Wed,  1 Jun 2022 11:23:24 -0700
Message-Id: <20220601112302.v4.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
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
display. Since we have no true information about the connected
display, these modes are essentially guesses but better than nothing.
At the moment, none of the modes returned is marked as preferred, but
the modes are sorted such that the higher resolution modes are listed
first.

When userspace sees these modes presented by the kernel it needs to
figure out which one to pick. At least one userspace, ChromeOS [1]
seems to use the rules (which seem pretty reasonable):
1. Try to pick the first mode marked as preferred.
2. Try to pick the mode which matches the first detailed timing
   descriptor in the EDID.
3. If no modes were marked as preferred then pick the first mode.

Unfortunately, userspace's rules combined with what the kernel is
doing causes us to fail section 4.2.2.6 (EDID Corruption Detection) of
the DP 1.4a Link CTS. That test case says that, while it's OK to allow
some implementation-specific fall-back modes if the EDID is bad that
userspace should _default_ to 640x480.

Let's fix this by marking 640x480 as default for DP in the no-EDID
case.

NOTES:
- In the discussion around v3 of this patch [2] there was talk about
  solving this in userspace and I even implemented a patch that would
  have solved this for ChromeOS, but then the discussion turned back
  to solving this in the kernel.
- Also in the discussion of v3 [2] it was requested to limit this
83;40900;0c  change to just DP since folks were worried that it would break some
  subtle corner case on VGA or HDMI.

[1] https://source.chromium.org/chromium/chromium/src/+/a051f741d0a15caff2251301efe081c30e0f4a96:ui/ozone/platform/drm/common/drm_util.cc;l=488
[2] https://lore.kernel.org/r/20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
I put Abhinav's Reviewed-by tag from v2 here since this is nearly the
same as v2. Hope this is OK.

Changes in v4:
- Code is back to v2, but limit to just DP.
- Beefed up the commit message.

Changes in v3:
- Don't set preferred, just disable the sort.

Changes in v2:
- Don't modify drm_add_modes_noedid() 'cause that'll break others
- Set 640x480 as preferred in drm_helper_probe_single_connector_modes()

 drivers/gpu/drm/drm_probe_helper.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 425f56280d51..75a71649b64d 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -569,8 +569,17 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 		count = drm_add_override_edid_modes(connector);
 
 	if (count == 0 && (connector->status == connector_status_connected ||
-			   connector->status == connector_status_unknown))
+			   connector->status == connector_status_unknown)) {
 		count = drm_add_modes_noedid(connector, 1024, 768);
+
+		/*
+		 * Section 4.2.2.6 (EDID Corruption Detection) of the DP 1.4a
+		 * Link CTS specifies that 640x480 (the official "failsafe"
+		 * mode) needs to be the default if there's no EDID.
+		 */
+		if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
+			drm_set_preferred_mode(connector, 640, 480);
+	}
 	count += drm_helper_probe_add_cmdline_mode(connector);
 	if (count != 0) {
 		ret = __drm_helper_update_and_validate(connector, maxX, maxY, &ctx);
-- 
2.36.1.255.ge46751e96f-goog

