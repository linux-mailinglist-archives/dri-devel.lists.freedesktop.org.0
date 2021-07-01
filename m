Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF053B8F3C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 10:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE4F6E96D;
	Thu,  1 Jul 2021 08:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6220D6E96D;
 Thu,  1 Jul 2021 08:58:38 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D444D227F8;
 Thu,  1 Jul 2021 08:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625129916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Wb3HKKo4BqOovpNrycvLMDOSJ+96TJIeTRI5q3i6US0=;
 b=zWzYAikyedMp9BjnNpwAcsoVlIp9iq1a/aTFKbv6eGpCNxOrXgWiLM9DMZhmFJx8CiSob9
 Jz30wvuchKRTFvZPvsKjyQnaKXGgOkQ2GLoV5EcQaVzq5ACEyoDgpd2Yf/jR/Vf0KuuoY0
 YH2zv8UbWdX0N98Ki0f1EEl1w7rzwcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625129916;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Wb3HKKo4BqOovpNrycvLMDOSJ+96TJIeTRI5q3i6US0=;
 b=hhDYYgemVCbPhw414HOXEUXwcbw6OsCKKavHs3SHTLpsB7f8nKaGXZoWY9uN4EsO63mpqB
 clllUJGV21hvSyCg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 90F9311CC0;
 Thu,  1 Jul 2021 08:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625129916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Wb3HKKo4BqOovpNrycvLMDOSJ+96TJIeTRI5q3i6US0=;
 b=zWzYAikyedMp9BjnNpwAcsoVlIp9iq1a/aTFKbv6eGpCNxOrXgWiLM9DMZhmFJx8CiSob9
 Jz30wvuchKRTFvZPvsKjyQnaKXGgOkQ2GLoV5EcQaVzq5ACEyoDgpd2Yf/jR/Vf0KuuoY0
 YH2zv8UbWdX0N98Ki0f1EEl1w7rzwcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625129916;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Wb3HKKo4BqOovpNrycvLMDOSJ+96TJIeTRI5q3i6US0=;
 b=hhDYYgemVCbPhw414HOXEUXwcbw6OsCKKavHs3SHTLpsB7f8nKaGXZoWY9uN4EsO63mpqB
 clllUJGV21hvSyCg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id gTp+IryD3WA0IgAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 01 Jul 2021 08:58:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk, mika.kuoppala@linux.intel.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 lucas.demarchi@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH v4 0/2] drm/i915: IRQ fixes
Date: Thu,  1 Jul 2021 10:58:31 +0200
Message-Id: <20210701085833.26566-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a bug in the usage of IRQs and cleanup references to the DRM
IRQ midlayer.

Preferably this patchset would be merged through drm-misc-next.

v4:
	* switch IRQ code to intel_synchronize_irq() (Daniel)
v3:
	* also use intel_synchronize_hardirq() from other callsite
v2:
	* split patch
	* also fix comment
	* add intel_synchronize_hardirq() (Ville)
	* update Fixes tag (Daniel)

Thomas Zimmermann (2):
  drm/i915: Use the correct IRQ during resume
  drm/i915: Drop all references to DRM IRQ midlayer

 drivers/gpu/drm/i915/gt/intel_engine_cs.c       | 2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c | 2 +-
 drivers/gpu/drm/i915/i915_drv.c                 | 1 -
 drivers/gpu/drm/i915/i915_irq.c                 | 5 -----
 4 files changed, 2 insertions(+), 8 deletions(-)


base-commit: 67f5a18128770817e4218a9e496d2bf5047c51e8
--
2.32.0

