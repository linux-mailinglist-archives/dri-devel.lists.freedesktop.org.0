Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 960FD558D3A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 04:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E8F10E69B;
	Fri, 24 Jun 2022 02:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50D110E67C;
 Fri, 24 Jun 2022 02:29:06 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id
 dw10-20020a17090b094a00b001ed00a16eb4so1483551pjb.2; 
 Thu, 23 Jun 2022 19:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KTOc/d+oYEo3KCLS/ApdmDM5i1P831XT3HEgoNa9jFg=;
 b=XYqgC7SBFPlJmaT51rH7p5TmW21W/f3GTkx6yYyilD+uIM9ac3rLrrT3fh1m2HA0dJ
 8yO2Uo2vpIWo5uF6WEQa0RTfvmrbXpVh7NdGWTowuLMK26RD7wGgYuDivDsmTgkWPQnS
 biqnPZUqnZbzNdI2w5HzeKw73fT2ALFVOqimA/iWKm9JRRIR4siV9vhcJs2SCyU8+g82
 hL0ex9lTg6DnU3Wxf/SxvuafG8LLKUEWW3F8nPteMeQfDcpt7hiYck6sFz6yACy0CQpe
 AnU2dcRcsNviM4kvXavlekPs6OeQwJZ/6/eMXKLofpv6Sd5PsTY0oFmh4N+8/ONuvUv+
 iZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KTOc/d+oYEo3KCLS/ApdmDM5i1P831XT3HEgoNa9jFg=;
 b=Xc86eZH3EWV2KOQOo6JgSuR2up8Stm7A/F1VjdVzN0v1z033Plm4VRma6puVXfUP8U
 TsbhVV/WfWq+fTx8KxAKY/nWFP01OhnFp65q9d1e6/IaLLAfghVgaG3vYlLKio0X6/TZ
 PX5sd4j+krcQSYJ69/kDxWlnckngiL7mJ0EBwg0RPflqqFHLRsib5HFuPWbDGaxQaigo
 d5f+10mnbyXEdeqhaAD0FEZrmA44PyMD9FnhBDue7tzo7bS2tDKihtbAis8VJv6p/N/P
 BorpfudL34n9xq/XH+MzH8l70NKTit9iMGRfW3bLHLX5DPjuz/YunvHSZwipjMWOJp0/
 iYGA==
X-Gm-Message-State: AJIora+vDPOxsylTzOLdgMdq2lovAH2X9VCH0obvLzQ8FlONuI6huYqR
 wI+kzldko40BMB+lAeBXNco=
X-Google-Smtp-Source: AGRyM1tYmK815ZiopKTsyYzm2EOC5BJDMMDs0xwZPS+5x1ROtrsm8Oe2NhA10w597fwsTyA7ciKliQ==
X-Received: by 2002:a17:902:f7d3:b0:16a:208e:b2c4 with SMTP id
 h19-20020a170902f7d300b0016a208eb2c4mr24216887plw.64.1656037746397; 
 Thu, 23 Jun 2022 19:29:06 -0700 (PDT)
Received: from localhost.localdomain ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a056a000d5800b00517c84fd24asm348559pfv.172.2022.06.23.19.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 19:29:05 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, ville.syrjala@linux.intel.com, jose.souza@intel.com,
 lyude@redhat.com, matthew.d.roper@intel.com, anshuman.gupta@intel.com,
 heying24@huawei.com, james.ausmus@intel.com
Subject: [PATCH RESEND] drm: i915: fix a possible refcount leak in
 intel_dp_add_mst_connector()
Date: Fri, 24 Jun 2022 10:28:13 +0800
Message-Id: <20220624022813.10796-1-hbh25y@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hangyu Hua <hbh25y@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If drm_connector_init fails, intel_connector_free will be called to take
care of proper free. So it is necessary to drop the refcount of port
before intel_connector_free.

Fixes: 091a4f91942a ("drm/i915: Handle drm-layer errors in intel_dp_add_mst_connector")
Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 061b277e5ce7..14d2a64193b2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -839,6 +839,7 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 	ret = drm_connector_init(dev, connector, &intel_dp_mst_connector_funcs,
 				 DRM_MODE_CONNECTOR_DisplayPort);
 	if (ret) {
+		drm_dp_mst_put_port_malloc(port);
 		intel_connector_free(intel_connector);
 		return NULL;
 	}
-- 
2.25.1

