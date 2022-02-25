Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE2A4C50EA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 22:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68BA10E980;
	Fri, 25 Feb 2022 21:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907BC10E957
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 21:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645825833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dy2T/qK/l4Qm/1tXB2oDxtdVoj2vfg4TjNqn9kq5m9Q=;
 b=FbIawBvLGcFbqqqd+GJ3YglDAvsHH+rY4bFYxXz+fCxd1zakAoW0FDV5bAIXmxw0uZt4eA
 KniqdBEdA36FVUgCvzh4KdbLacMtmf7gxMiQS0MQmtLWgPPfdhUBC8ltjV678grj5ZfWT/
 7TUEfHShH/uGH/viOWyj1fQCIocRZN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-WC_f2qU4PqGnCa8xgzooUA-1; Fri, 25 Feb 2022 16:50:30 -0500
X-MC-Unique: WC_f2qU4PqGnCa8xgzooUA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A3A7180FD71;
 Fri, 25 Feb 2022 21:50:29 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB7B487BB5;
 Fri, 25 Feb 2022 21:49:56 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 3/5] drm/i915/dsi: Add some debug logging to mipi_exec_i2c
Date: Fri, 25 Feb 2022 22:49:32 +0100
Message-Id: <20220225214934.383168-3-hdegoede@redhat.com>
In-Reply-To: <20220225214934.383168-1-hdegoede@redhat.com>
References: <20220225214934.383168-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add some debug logging to mipi_exec_i2c, to make debugging various
issues seen with it easier.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 0da91849efde..215dbfc0af0f 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -464,6 +464,10 @@ static const u8 *mipi_exec_i2c(struct intel_dsi *intel_dsi, const u8 *data)
 	u8 payload_size = *(data + 6);
 	u8 *payload_data;
 
+	drm_dbg_kms(&i915->drm, "%s bus %d client-addr 0x%02x reg 0x%02x data %*ph\n",
+		    __func__, vbt_i2c_bus_num, slave_addr, reg_offset,
+		    payload_size, data + 7);
+
 	if (intel_dsi->i2c_bus_num < 0) {
 		intel_dsi->i2c_bus_num = vbt_i2c_bus_num;
 		i2c_acpi_find_adapter(intel_dsi, slave_addr);
-- 
2.35.1

