Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8593061112F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 14:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE1110E1E0;
	Fri, 28 Oct 2022 12:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E0F10E1E0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 12:22:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7A7E71F38D;
 Fri, 28 Oct 2022 12:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666959751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SaQol00PS6OLwZNoHMgClwuSp868CgMQqrWKu60OjPE=;
 b=UULSORHlSsgFL0ohxmH8fQXaL9IcxBWAdUsTjFUdUoBqScMYmGgMvluMNfhvEbcJOVoffC
 5TBy0l6/YvkadbSBwQ8sLs0Am5KUtbXiGL3EGJBK9xBce+SfcCY0uTuPLMa445N/ELhRKy
 uYJZApg9cM8kXqHtr1GfKPryFmYZviU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666959751;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SaQol00PS6OLwZNoHMgClwuSp868CgMQqrWKu60OjPE=;
 b=2kLxSIFzm2pZu6GU1ILRkL3zUHRuxxWoZvzuutVmwYTLHdSXMhx8bk9D3rE+NQOZhyvUKw
 r3fHAIyc1I2F90Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4BBA71377D;
 Fri, 28 Oct 2022 12:22:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oPpYEYfJW2MScwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Oct 2022 12:22:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.stein@ew.tq-group.com, javierm@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v2 1/2] drm/ofdrm: Convert PCI IDs to CPU endianness for
 comparing
Date: Fri, 28 Oct 2022 14:22:28 +0200
Message-Id: <20221028122229.21780-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221028122229.21780-1-tzimmermann@suse.de>
References: <20221028122229.21780-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Properties of 32-bit integers are returned from the OF device tree
as type __be32. Convert PCI vendor and device IDs from __be32 to host
endianness before comparing them to constants. All relevant machines
are old, big-endian Macintosh systems; hence the bug never happened
in practice.

Fixes sparse warnings shown below.

  drivers/gpu/drm/tiny/ofdrm.c:237:17: warning: restricted __be32 degrades to integer
  drivers/gpu/drm/tiny/ofdrm.c:238:18: warning: restricted __be32 degrades to integer
  drivers/gpu/drm/tiny/ofdrm.c:238:54: warning: restricted __be32 degrades to integer

See [1] for the bug report.

v2:
	* convert endianness (Alex)

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/dri-devel/202210192208.D888I6X7-lkp@intel.com/ # [1]
---
 drivers/gpu/drm/tiny/ofdrm.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 0e1cc2369afcc..44f13a2b372be 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -231,7 +231,7 @@ static u64 display_get_address_of(struct drm_device *dev, struct device_node *of
 	return address;
 }
 
-static bool is_avivo(__be32 vendor, __be32 device)
+static bool is_avivo(u32 vendor, u32 device)
 {
 	/* This will match most R5xx */
 	return (vendor == PCI_VENDOR_ID_ATI) &&
@@ -265,8 +265,13 @@ static enum ofdrm_model display_get_model_of(struct drm_device *dev, struct devi
 		of_parent = of_get_parent(of_node);
 		vendor_p = of_get_property(of_parent, "vendor-id", NULL);
 		device_p = of_get_property(of_parent, "device-id", NULL);
-		if (vendor_p && device_p && is_avivo(*vendor_p, *device_p))
-			model = OFDRM_MODEL_AVIVO;
+		if (vendor_p && device_p) {
+			u32 vendor = be32_to_cpup(vendor_p);
+			u32 device = be32_to_cpup(device_p);
+
+			if (is_avivo(vendor, device))
+				model = OFDRM_MODEL_AVIVO;
+		}
 		of_node_put(of_parent);
 	} else if (of_device_is_compatible(of_node, "qemu,std-vga")) {
 		model = OFDRM_MODEL_QEMU;
-- 
2.38.0

