Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 393152FF1CB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 18:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8D46E919;
	Thu, 21 Jan 2021 17:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C246E914
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 17:26:27 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id 19so2417287qkh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 09:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/hmJ6IMWFslp7KKucZjB7hkfqVhq/CL/eYPGubDfOkI=;
 b=Vg0+3PUCLYJncMyH9PxLS5lwKuDt0tnbfowU8f/Ij+jWgeG48ONWlJIfEl8CKByipU
 paDNdZnt4oZH/OTeqwPRVMcmki2O/HQxvjPFHP7SKMjpaXz8Km97W27Si0BxoB2P4mCA
 W31XzFcZGA1qi1F7S2rz61ldjYYzxwrK2Em8WaPssBXTTTiPAzeGPaxM2NI2A5YRZd4g
 8Za61XdSBV96gMXEU0zS5uZ0KF6kuX/txmykwuJlzKyLDmnwLW9pU7ub9dhqWQ+HjH4W
 w4o5sukuY/tyFvv92mkzaTQ3AVOCqEvzsDh29chtLfVi9jbdyv/p1n7e6dew8zaByVgV
 69PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/hmJ6IMWFslp7KKucZjB7hkfqVhq/CL/eYPGubDfOkI=;
 b=jlY9tA574EerV3CDI8VVuOzAATTCb1z4jm0H8EJvcD6ntS4WFlZVtTLgeQUhllijjp
 7k7JdXHTpyzOHN0G9zHMVAbd7z38vCVA0sYvRYxNpAjmtDZrdVtQVHvbRpOR/fLal3hK
 JDREo9QO4UDVw4aj8iFFP6x4Cnl0Un6+Td1rYegRFHzItRs8IYU/M/nsaPfZ5m86OHwg
 cQrTadZ1LbUXT8IzVGSAiCwliUvtBaXzpMZFJ4IxDisRkWdFIIC4sy3+fNpf9OYaiq0b
 2AFCgESDYzoThRHLHxxqatWxtO8kkTcBi9frwE39HmCxPQJrF7oUsDBoi/4RpTCYNB3C
 EQqw==
X-Gm-Message-State: AOAM530Vxrk9qR6ICnaNAOB4T6yxqIa6rr9TwE2ZaDcW04jDgEdCcTvU
 mQ2UQ4al+V/wsAztFxFa0Z+OI/025gof26C5
X-Google-Smtp-Source: ABdhPJzX++v+oUlyBE6siUCp196ZdMRbYqIvUzbE9dqzvLShrC0i8zoODgLmA3Pgar3p2YmVxKJ/Zw==
X-Received: by 2002:ae9:ed82:: with SMTP id c124mr756177qkg.399.1611249986682; 
 Thu, 21 Jan 2021 09:26:26 -0800 (PST)
Received: from localhost (197.sub-174-193-0.myvzw.com. [174.193.0.197])
 by smtp.gmail.com with ESMTPSA id p11sm3913326qtb.62.2021.01.21.09.26.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 21 Jan 2021 09:26:25 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/hdcp: Disable the QSES check for HDCP 1.4 over MST
Date: Thu, 21 Jan 2021 12:26:09 -0500
Message-Id: <20210121172620.33066-1-sean@poorly.run>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210106223909.34476-1-sean@poorly.run>
References: <20210106223909.34476-1-sean@poorly.run>
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

The HDCP 1.4 spec does not require the QUERY_STREAM_ENCRYPTION_STATUS
check, it was always a nice-to-have. After deploying this across various
devices, we've determined that some MST bridge chips do not properly
support this call for HDCP 1.4 (namely Synaptics and Realtek).

I had considered creating a quirk for this, but I think it's more
prudent to just disable the check entirely since I don't have an idea
how widespread support is.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210106223909.34476-1-sean@poorly.run #v1

Changes in v2:
-Rebased on -tip
---
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index f372e25edab4..4dba5bb15af5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -722,16 +722,6 @@ static bool intel_dp_mst_get_qses_status(struct intel_digital_port *dig_port,
 	return reply.auth_completed && reply.encryption_enabled;
 }
 
-static
-bool intel_dp_mst_hdcp_check_link(struct intel_digital_port *dig_port,
-				  struct intel_connector *connector)
-{
-	if (!intel_dp_hdcp_check_link(dig_port, connector))
-		return false;
-
-	return intel_dp_mst_get_qses_status(dig_port, connector);
-}
-
 static int
 intel_dp_mst_hdcp2_stream_encryption(struct intel_connector *connector,
 				     bool enable)
@@ -805,7 +795,7 @@ static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
 	.read_v_prime_part = intel_dp_hdcp_read_v_prime_part,
 	.toggle_signalling = intel_dp_hdcp_toggle_signalling,
 	.stream_encryption = intel_dp_mst_hdcp_stream_encryption,
-	.check_link = intel_dp_mst_hdcp_check_link,
+	.check_link = intel_dp_hdcp_check_link,
 	.hdcp_capable = intel_dp_hdcp_capable,
 	.write_2_2_msg = intel_dp_hdcp2_write_msg,
 	.read_2_2_msg = intel_dp_hdcp2_read_msg,
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
