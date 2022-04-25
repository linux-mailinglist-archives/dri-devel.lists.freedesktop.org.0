Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 529FF50DAC6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 09:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD01D10E056;
	Mon, 25 Apr 2022 07:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7255B10E056
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 07:59:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D37DB210E3;
 Mon, 25 Apr 2022 07:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650873582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ubzUEdDUvfo7OAyyoSn7yUggYxZBInbYs45EKbk666s=;
 b=2Zvcgq5WjAee073YKcAyapYKqoZMkldQftiJWw8Q+GIqvetV5HW06I/dprLAdCRuwQ/zIV
 Xrw8TCn9qBVYe5WK5UQHm2HAGPK0u8ybx71dzVV++QJQ5Y5iEjgN8vy6NR4vTEexl4elyk
 h2t2IKTksGddl/8O+bZZuqIee8+ILBk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650873582;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ubzUEdDUvfo7OAyyoSn7yUggYxZBInbYs45EKbk666s=;
 b=+czWM++rKFTQ1fR20UkOJ1v630zBYy99ydLb6pvgQjN5C9OHKqYMyT+Cv22AiZ63DQbvC1
 DuY8HeQLi6OoEyBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9CEB313AED;
 Mon, 25 Apr 2022 07:59:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3hr5JO5UZmIWbwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Apr 2022 07:59:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tiwai@suse.com, tamara.schmitz@suse.com
Subject: [PATCH v2 0/3] drm/format-helper: Support conversion to XRGB8888
Date: Mon, 25 Apr 2022 09:59:36 +0200
Message-Id: <20220425075939.30450-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support conversion from RGB565 and RGB888 to XRGB8888. This enables
simpledrm to work with framebuffers of such formats.

UEFI and/or Grub will usually set 32-bit output in XRGB8888 format.
The issue can be reproduced by enabling simpledrm and requesting a
console framebuffer of different format on the kernel command line;
for example

  nomodeset video=1024x768-16

  or

  nomodeset video=1024x768-24

Conversion helpers will do nothing in this case.

Make this work by implementing the rsp conversion helpers. Also add
a warning about unsupported format conversions. The patchset should
also enable odd userspace configurations, such as running Xorg with
16- or 24-bit color depth.

v2:
	* use helpers for struct drm_rect (Javier)
	* improve commit messages (Javier)

Thomas Zimmermann (3):
  drm/format-helper: Print warning on missing format conversion
  drm/format-helper: Add RGB888-to-XRGB8888 conversion
  drm/format-helper: Add RGB565-to-XRGB8888 conversion

 drivers/gpu/drm/drm_format_helper.c | 95 +++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)


base-commit: 0e7deff6446a4ba2c75f499a0bfa80cd6a15c129
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
-- 
2.36.0

