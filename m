Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AD77A8D3D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 21:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6B310E552;
	Wed, 20 Sep 2023 19:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE9E10E54E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 19:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695239794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tt1oyx9UBclJogZ6DRbxVIlbM0rrfuuxabal50tETcg=;
 b=iKzbvR/ct4GOU/tK5Ht+e0CstzYMY2C8J0dFTeSyk1pOVak+2CYeZ3NEQFD38TwFdZVREF
 n/JS5r0i84bo7tRoW3dyJ162Z1qnWMm67gH4mcnyvSifJv/gL4Eoop5ItIr8NOm8l2rvIX
 pcxq/HDqVCiKmuGtQBMuktV8m47CWs8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-f2OOlMuiOtWIB8SvOKjcNQ-1; Wed, 20 Sep 2023 15:56:29 -0400
X-MC-Unique: f2OOlMuiOtWIB8SvOKjcNQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE9991818840;
 Wed, 20 Sep 2023 19:56:28 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9688C15BB8;
 Wed, 20 Sep 2023 19:56:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 4/4] drm/i915/dsi: Add some debug logging to mipi_exec_i2c (v2)
Date: Wed, 20 Sep 2023 21:56:13 +0200
Message-ID: <20230920195613.304091-5-hdegoede@redhat.com>
In-Reply-To: <20230920195613.304091-1-hdegoede@redhat.com>
References: <20230920195613.304091-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add some debug logging to mipi_exec_i2c, to make debugging various
issues seen with it easier.

Changes in v2:
- Drop unnecessary __func__ drm_dbg_kms() argument

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index e56ec3f2d84a..24b2cbcfc1ef 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -565,6 +565,9 @@ static const u8 *mipi_exec_i2c(struct intel_dsi *intel_dsi, const u8 *data)
 	u8 payload_size = *(data + 6);
 	u8 *payload_data;
 
+	drm_dbg_kms(&i915->drm, "bus %d client-addr 0x%02x reg 0x%02x data %*ph\n",
+		    vbt_i2c_bus_num, slave_addr, reg_offset, payload_size, data + 7);
+
 	if (intel_dsi->i2c_bus_num < 0) {
 		intel_dsi->i2c_bus_num = vbt_i2c_bus_num;
 		i2c_acpi_find_adapter(intel_dsi, slave_addr);
-- 
2.41.0

