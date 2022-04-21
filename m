Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A9E50A7F1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 20:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D253610E381;
	Thu, 21 Apr 2022 18:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326FE10E36B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 18:17:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 84D061F388;
 Thu, 21 Apr 2022 18:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650565052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qYTmc9NzK10wJ1dq9AFOUt62dj8JOL4cETR8ofoWWX4=;
 b=egyh4+B9HSdHCyfT7bRHKTPC6M/5YwvfpUC3jrBIo1jSz3Hx9XDiDA1i1A6D+/QJxK2/kn
 w3mIw9MhLRKRFl5bPYvRoEEli47BPaecrUblUJdVXgIlrJtNX82PfGKird2aKS8581HVpo
 18v9vwBer/LWG4DhOhkNsySS8F0X7mg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650565052;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qYTmc9NzK10wJ1dq9AFOUt62dj8JOL4cETR8ofoWWX4=;
 b=/nufkJsUHO7xSfO1FrgrDtvjW25js1Z9mDDL2lWBMD7wtWlSSZRsv7lF1ci1M3VT6Z6/se
 D2TCuoxQV7nu5yCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 52F9D13446;
 Thu, 21 Apr 2022 18:17:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id O+xNE7yfYWIXGwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Apr 2022 18:17:32 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tiwai@suse.com, tamara.schmitz@suse.com
Subject: [PATCH 0/3] drm/format-helper: Support conversion to XRGB8888
Date: Thu, 21 Apr 2022 20:17:19 +0200
Message-Id: <20220421181722.13936-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
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

(resending with dri-devel in cc)

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

Thomas Zimmermann (3):
  drm/format-helper: Print warning on missing format conversion
  drm/format-helper: Add RGB888-to-XRGB8888 conversion
  drm/format-helper: Add RGB565-to-XRGB8888 conversion

 drivers/gpu/drm/drm_format_helper.c | 95 +++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)


base-commit: d97978df553d768e457cb68c637b2b0a6188b87c
-- 
2.35.1

