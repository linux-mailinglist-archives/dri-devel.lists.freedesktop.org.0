Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0303323D353
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 22:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29BB883F4;
	Wed,  5 Aug 2020 20:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806A4883F4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 20:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596661165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=jAIXysMz+ztRK+9IphGR8JksjwMIkYoVzpw6WZkH4eA=;
 b=EOA8ssfzQrFWX/31bv4xoTNYvqyLViyo+P1/FQ5P5yCRxPIaSMlW+2Xy9KyLJXkNsLRH2a
 ijwSVXbnkeIl0fTjwJ/bvYB7w3D1ERmOnoSV2RFSTtaGU7LSGH/z2awsnVPHBMwSxkYTvi
 EQIuuXua6xfvpy0/0GjZ8nb1HXN6418=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-g0skWtfmMtqxhbDSM06VUA-1; Wed, 05 Aug 2020 16:59:23 -0400
X-MC-Unique: g0skWtfmMtqxhbDSM06VUA-1
Received: by mail-qk1-f199.google.com with SMTP id k142so31888037qke.7
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 13:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jAIXysMz+ztRK+9IphGR8JksjwMIkYoVzpw6WZkH4eA=;
 b=sxGTTTlrwb4Ekfk+/XnkAADrxo5bQvHO30WiNvSqAM/apZWnSXqFwCnvM9wCwuyl5d
 7Xh9jW5DDsIzCj66U++yA2mLxkCTfyJvEUAmgRVFq7AWLabtqcbUfumCvf29Gp7yOSuV
 LZYNdokGUj88bBY2vSABddH/aoHpOZ6+JI2cwe81sr5ETfWX32LCXBpEqJ046ug6awgT
 jHHZ6vsFuPnw3lW5O6oa15cA8RDhZvY2fKcZ4zmeTW9qAVoRClBAvYUNTP3lR8SQEHh3
 mbxuSk1zr+x+BbrDeL9Q0wvUup0aWVoCursirHkfiLYx9u45SD7CS13/O/Jnm5lKZZto
 7yLg==
X-Gm-Message-State: AOAM531mdO1ZSAoAxxcJCTbntpiKwk5w5fhaQGGWYElX/sfsetgTlAaU
 Y3OAHBED8ysVPsgm0/uTNlPzYKrEwXo91ep6cM2j5rY2eP6A1bdXwYiU9w7Qt3NGEnNuGp/aeGS
 IulLm7iBkBuKndMFTk8ZGg9oT8eWD
X-Received: by 2002:a37:84c:: with SMTP id 73mr5330202qki.464.1596661163155;
 Wed, 05 Aug 2020 13:59:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMeglqrJbSFSxjPBAaJs2BV5HNNaqoHH3sQfpvvAW+bLdrzYALcTYC6CF/kqo4ivso2fbfUg==
X-Received: by 2002:a37:84c:: with SMTP id 73mr5330186qki.464.1596661162880;
 Wed, 05 Aug 2020 13:59:22 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id c21sm2346084qka.9.2020.08.05.13.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 13:59:22 -0700 (PDT)
From: trix@redhat.com
To: patrik.r.jakobsson@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 airlied@redhat.com, yakui.zhao@intel.com, alan@linux.intel.com
Subject: [PATCH] drm/gma500: fix error check
Date: Wed,  5 Aug 2020 13:59:11 -0700
Message-Id: <20200805205911.20927-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

Reviewing this block of code in cdv_intel_dp_init()

ret = cdv_intel_dp_aux_native_read(gma_encoder, DP_DPCD_REV, ...

cdv_intel_edp_panel_vdd_off(gma_encoder);
if (ret == 0) {
	/* if this fails, presume the device is a ghost */
	DRM_INFO("failed to retrieve link info, disabling eDP\n");
	drm_encoder_cleanup(encoder);
	cdv_intel_dp_destroy(connector);
	goto err_priv;
} else {

The (ret == 0) is not strict enough.
cdv_intel_dp_aux_native_read() returns > 0 on success
otherwise it is failure.

So change to <=

Fixes: d112a8163f83 ("gma500/cdv: Add eDP support")

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index f41cbb753bb4..720a767118c9 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -2078,7 +2078,7 @@ cdv_intel_dp_init(struct drm_device *dev, struct psb_intel_mode_device *mode_dev
 					       intel_dp->dpcd,
 					       sizeof(intel_dp->dpcd));
 		cdv_intel_edp_panel_vdd_off(gma_encoder);
-		if (ret == 0) {
+		if (ret <= 0) {
 			/* if this fails, presume the device is a ghost */
 			DRM_INFO("failed to retrieve link info, disabling eDP\n");
 			drm_encoder_cleanup(encoder);
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
