Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5948260F697
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 13:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A5010E0CE;
	Thu, 27 Oct 2022 11:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A445110E2DB
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 11:57:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 29BA121FE5;
 Thu, 27 Oct 2022 11:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666871832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PhIpoiiLD4ESVVQkOC4NsxeuRxChDPpBKVZ9XMwQb0o=;
 b=fJ4ytQEnwOP/tWXZRT0d+IuZF2jul22rgpmH7bit7glQUB6SPr76tV9cECTPBi04j7PARw
 2Ga84OLG3Ry0cl62RKaXiMKo6PElFPDDM2JXn4IgkFAiavWgEk6dTWmD89S8MmtzRiC42D
 RlQ21uZNMKRkLYNuKYI9/KlLACVdAhU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666871832;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PhIpoiiLD4ESVVQkOC4NsxeuRxChDPpBKVZ9XMwQb0o=;
 b=7hUPOEmulvmAJ9ptnffynVJPe5eywWiZHv2tqBXWwh/eJHb+/fZxgePlRJM0Nfpna3lLYw
 /k1z8OBiaAp1YbAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 04E1813357;
 Thu, 27 Oct 2022 11:57:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cBEBABhyWmOFNQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Oct 2022 11:57:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH 1/2] drm/ofdrm: Cast PCI IDs to u32 for comparing
Date: Thu, 27 Oct 2022 13:57:06 +0200
Message-Id: <20221027115707.17980-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221027115707.17980-1-tzimmermann@suse.de>
References: <20221027115707.17980-1-tzimmermann@suse.de>
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
as type __be32. Cast PCI vendor and device IDs from __be32 to u32
before comparing them to constants. Fixes sparse warnings shown below.

  drivers/gpu/drm/tiny/ofdrm.c:237:17: warning: restricted __be32 degrades to integer
  drivers/gpu/drm/tiny/ofdrm.c:238:18: warning: restricted __be32 degrades to integer
  drivers/gpu/drm/tiny/ofdrm.c:238:54: warning: restricted __be32 degrades to integer

See [1] for the bug report.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/dri-devel/202210192208.D888I6X7-lkp@intel.com/ # [1]
---
 drivers/gpu/drm/tiny/ofdrm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 0e1cc2369afcc..0da8b248ccc6e 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -231,8 +231,11 @@ static u64 display_get_address_of(struct drm_device *dev, struct device_node *of
 	return address;
 }
 
-static bool is_avivo(__be32 vendor, __be32 device)
+static bool is_avivo(__be32 vendor_id, __be32 device_id)
 {
+	u32 vendor = (__force u32)vendor_id;
+	u32 device = (__force u32)device_id;
+
 	/* This will match most R5xx */
 	return (vendor == PCI_VENDOR_ID_ATI) &&
 	       ((device >= PCI_VENDOR_ID_ATI_R520 && device < 0x7800) ||
-- 
2.38.0

