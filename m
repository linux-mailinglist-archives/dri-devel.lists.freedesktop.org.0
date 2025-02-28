Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45465A495C7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0FB10EC53;
	Fri, 28 Feb 2025 09:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PHgkfMpk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6tMpn/8B";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PHgkfMpk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6tMpn/8B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D3C10EC4D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 09:48:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2C06F21162;
 Fri, 28 Feb 2025 09:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740736127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hxjwB5ssmiJFQaf5/G6dJMnLc1VC/yrWC3xStOXGtfQ=;
 b=PHgkfMpkOOjv2y8yPE4o1Cl3oi+5rNeiSMFOpBFqUB6IVrO6YDSDQtxes/te9NpaE0etR9
 UQ1PaA8e71p/G0V8iHn11NAHZp8TAskepMiu4BOi2uh3qSGI11zuJaAOZVU6lYDFf3Mv+F
 nwI70VXZpcgmmw463EMlvW7k8MQjnUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740736127;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hxjwB5ssmiJFQaf5/G6dJMnLc1VC/yrWC3xStOXGtfQ=;
 b=6tMpn/8BxtMk28wHQIdcK7nn3ZABRYtiBX92P+5AgM49rsX3ahM2tS9qkWrfPGWsUFSgsz
 nTKasfed/8fdSlBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740736127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hxjwB5ssmiJFQaf5/G6dJMnLc1VC/yrWC3xStOXGtfQ=;
 b=PHgkfMpkOOjv2y8yPE4o1Cl3oi+5rNeiSMFOpBFqUB6IVrO6YDSDQtxes/te9NpaE0etR9
 UQ1PaA8e71p/G0V8iHn11NAHZp8TAskepMiu4BOi2uh3qSGI11zuJaAOZVU6lYDFf3Mv+F
 nwI70VXZpcgmmw463EMlvW7k8MQjnUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740736127;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hxjwB5ssmiJFQaf5/G6dJMnLc1VC/yrWC3xStOXGtfQ=;
 b=6tMpn/8BxtMk28wHQIdcK7nn3ZABRYtiBX92P+5AgM49rsX3ahM2tS9qkWrfPGWsUFSgsz
 nTKasfed/8fdSlBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C86BF1344A;
 Fri, 28 Feb 2025 09:48:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hGgnL36GwWfKVAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Feb 2025 09:48:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 airlied@redhat.com, sean@poorly.run, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/4] drm: Provide a dedicated DMA device for PRIME import
Date: Fri, 28 Feb 2025 10:32:50 +0100
Message-ID: <20250228094457.239442-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[ffwll.ch,redhat.com,gmail.com,linux.intel.com,kernel.org,poorly.run,linaro.org,amd.com];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
 RCVD_COUNT_TWO(0.00)[2]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
X-Spam-Flag: NO
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Importing dma-bufs via PRIME requires a DMA-capable hardware device.
This is not the case for USB, where DMA is controller entirely by the
USB controller instead of the USB devices.

Drivers for USB-based hardware maintainer their own workaround for this
problem. The original ideas to resolve this was to provide different
PRIME helpers for such devices, but the dma-buf code assumes DMA
functionality as well. So that ideas is not realistic.

Let's instead turn the current workaround into a feature. It will also
be useful in other code.

Patch 1 add a dma_device field to struct drm_device and makes the PRIME
code use it. Patches 2 to 4 replace related driver code.

There are other possible users of the new field. The exynos and mediatek
drivers already maintain a dedicated DMA device for non-PRIME code. They
could likely use dma_dev as well. GEM-DMA helpers currently allocate DMA
memory with the regular parent device. They should support the dma_dev
settings as well.

Tested with udl.

Thomas Zimmermann (4):
  drm/prime: Support dedicated DMA device for dma-buf imports
  drm/gm12u320: Set struct drm_device.dma_dev
  drm/gud: Set struct drm_device.dma_dev
  drm/udl: Set struct drm_device.dma_dev

 drivers/gpu/drm/drm_drv.c          |  2 ++
 drivers/gpu/drm/drm_prime.c        |  2 +-
 drivers/gpu/drm/gud/gud_drv.c      | 26 +++----------------
 drivers/gpu/drm/gud/gud_internal.h |  1 -
 drivers/gpu/drm/tiny/gm12u320.c    | 41 ++++++------------------------
 drivers/gpu/drm/udl/udl_drv.c      | 17 -------------
 drivers/gpu/drm/udl/udl_drv.h      |  1 -
 drivers/gpu/drm/udl/udl_main.c     |  9 ++-----
 include/drm/drm_device.h           | 37 +++++++++++++++++++++++++++
 9 files changed, 53 insertions(+), 83 deletions(-)

-- 
2.48.1

