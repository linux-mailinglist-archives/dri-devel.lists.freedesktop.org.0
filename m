Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167D02EC648
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 23:39:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9BC6E250;
	Wed,  6 Jan 2021 22:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0636E250
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 22:39:16 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id t8so4279771iov.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jan 2021 14:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=en5EqfnXWrYrHrETjfMt0dxIpEKJxkPrUalRRmjntzo=;
 b=TuccGCZFfBGJlNqhVjkHp8pspAKW4KPL/GnuA5NsvQD5y8rNWOYu3en5HpAVMksmyw
 FouW9QsZzQGF8W4l+qtrcDnnbFmjYZBnmEY0YVdjY4Sw458H5i+gWRNNAotYvBUQvb4Z
 ov/ssrpmTuZmTbvjoLEJbOLcSXk0LXSIdOkQ83kk+NJ1nVJg1sE6Sj6Lf9N8ex674uHE
 tCJrrI9gZhFb7LFcjW+jT7+bnQbWbyRUndJzo5DnbB7+oTM59v1It5m5L0XJ8o1v+DQF
 O1q+EprYRUBEP2mOYlTGx44dNaOqZBXTjv6DDOBgIdvYos9Ge1BjjApzl11Di56/bQWD
 aLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=en5EqfnXWrYrHrETjfMt0dxIpEKJxkPrUalRRmjntzo=;
 b=FE3FOxLJK6ZreJeX7aO3pQfYKHVeV4MyAiynICDjGpnBTOVNMbMfYav2AgDQCgLkbj
 FWb6A9k8c9B1gQAB1Nh5dxQEXARAOq6aFS+2m/HiPEUJA+wpccVvmrifRry5LWRLdjIT
 MtODo0XfLSrJp4Unpdb//E1sGAnk5kS2HazZBfHMniw+SsGgcZiLW1qmutsQr3TsuoQP
 fCXXyXvNMsdUGsofVR5EhLOljAnP8KSrIf4z8h3AaQAZYqCfibxGC65A7YtjXymC678M
 /JPjKPCsfMAEgj0bgl6EI8jJyC8S78hIH7/HrhEd1UpuVzlpDdmAkjsVrRL4Ngxkc6X/
 xftA==
X-Gm-Message-State: AOAM532n3zVsf0TuOhUB1IFeA9hII8UVw4mK29ucjKwY/bj5jqvPCPLI
 ntSq/V0LzegXYKYe+wWP2b9Myoy6IqLadhy8
X-Google-Smtp-Source: ABdhPJw3ZVBn8ZlpvaDF9jKJoWWnmtDFHyWaNLOxDw/Mi/7LnJWt5RXesttJsEb3ysdsSobgvje/dQ==
X-Received: by 2002:a6b:93d5:: with SMTP id v204mr4534864iod.155.1609972756035; 
 Wed, 06 Jan 2021 14:39:16 -0800 (PST)
Received: from localhost (8.sub-174-193-22.myvzw.com. [174.193.22.8])
 by smtp.gmail.com with ESMTPSA id f20sm2848025ilj.14.2021.01.06.14.39.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Jan 2021 14:39:15 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/hdcp: Disable the QSES check for HDCP 1.4 over MST
Date: Wed,  6 Jan 2021 17:38:58 -0500
Message-Id: <20210106223909.34476-1-sean@poorly.run>
X-Mailer: git-send-email 2.28.0
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
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

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 26 +-------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index 03424d20e9f7..b6a9606bf09a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -640,30 +640,6 @@ intel_dp_mst_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
 	return ret;
 }
 
-static
-bool intel_dp_mst_hdcp_check_link(struct intel_digital_port *dig_port,
-				  struct intel_connector *connector)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	struct intel_dp *intel_dp = &dig_port->dp;
-	struct drm_dp_query_stream_enc_status_ack_reply reply;
-	int ret;
-
-	if (!intel_dp_hdcp_check_link(dig_port, connector))
-		return false;
-
-	ret = drm_dp_send_query_stream_enc_status(&intel_dp->mst_mgr,
-						  connector->port, &reply);
-	if (ret) {
-		drm_dbg_kms(&i915->drm,
-			    "[CONNECTOR:%d:%s] failed QSES ret=%d\n",
-			    connector->base.base.id, connector->base.name, ret);
-		return false;
-	}
-
-	return reply.auth_completed && reply.encryption_enabled;
-}
-
 static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
 	.write_an_aksv = intel_dp_hdcp_write_an_aksv,
 	.read_bksv = intel_dp_hdcp_read_bksv,
@@ -674,7 +650,7 @@ static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
 	.read_ksv_fifo = intel_dp_hdcp_read_ksv_fifo,
 	.read_v_prime_part = intel_dp_hdcp_read_v_prime_part,
 	.toggle_signalling = intel_dp_mst_hdcp_toggle_signalling,
-	.check_link = intel_dp_mst_hdcp_check_link,
+	.check_link = intel_dp_hdcp_check_link,
 	.hdcp_capable = intel_dp_hdcp_capable,
 
 	.protocol = HDCP_PROTOCOL_DP,
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
