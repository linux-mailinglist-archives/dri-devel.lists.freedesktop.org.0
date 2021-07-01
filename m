Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DFA3B9591
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 19:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E0B6EB78;
	Thu,  1 Jul 2021 17:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C9A6E027;
 Thu,  1 Jul 2021 17:36:21 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 54941204FD;
 Thu,  1 Jul 2021 17:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625160980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JhufIsRTh0WyDQp1rAM6FPRIfn8Aoj2dtNDDh3KyPzU=;
 b=PhkEi4ACjxk3S//STKJei2UjBCS1P4YhMypRfv0dzN9Na4Oi//ibZyP//HBZjWh9RhV3Yj
 6RyfQUpDaQW7C2I3U7Uu6OAO5fDvqJLbn+UrdgMbXjPw4VvzO1GnPaqZQnQzV5oUuau7kc
 5n70ReZsZwjBjEmGGMHOIKlhGDA6SJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625160980;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JhufIsRTh0WyDQp1rAM6FPRIfn8Aoj2dtNDDh3KyPzU=;
 b=ii1lQAKOZ+lgvXyNbaiYIfZkv342+GDUBbkFWHiPzbO2Z1Ve7qWWGcpIiix+6FXmv9dbNv
 sNi/jInclX1FjfCg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 0D66B11CD6;
 Thu,  1 Jul 2021 17:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625160980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JhufIsRTh0WyDQp1rAM6FPRIfn8Aoj2dtNDDh3KyPzU=;
 b=PhkEi4ACjxk3S//STKJei2UjBCS1P4YhMypRfv0dzN9Na4Oi//ibZyP//HBZjWh9RhV3Yj
 6RyfQUpDaQW7C2I3U7Uu6OAO5fDvqJLbn+UrdgMbXjPw4VvzO1GnPaqZQnQzV5oUuau7kc
 5n70ReZsZwjBjEmGGMHOIKlhGDA6SJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625160980;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JhufIsRTh0WyDQp1rAM6FPRIfn8Aoj2dtNDDh3KyPzU=;
 b=ii1lQAKOZ+lgvXyNbaiYIfZkv342+GDUBbkFWHiPzbO2Z1Ve7qWWGcpIiix+6FXmv9dbNv
 sNi/jInclX1FjfCg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 81HJART93WCcSwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 01 Jul 2021 17:36:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk, mika.kuoppala@linux.intel.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 lucas.demarchi@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH v5 0/2] drm/i915: IRQ fixes
Date: Thu,  1 Jul 2021 19:36:16 +0200
Message-Id: <20210701173618.10718-1-tzimmermann@suse.de>
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

v5:
	* go back to _hardirq() after CI tests reported atomic
	  context in PCI probe; add rsp comment
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

 drivers/gpu/drm/i915/gt/intel_engine_cs.c       |  2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c |  7 +++++--
 drivers/gpu/drm/i915/i915_drv.c                 |  1 -
 drivers/gpu/drm/i915/i915_irq.c                 | 10 +++++-----
 drivers/gpu/drm/i915/i915_irq.h                 |  1 +
 5 files changed, 12 insertions(+), 9 deletions(-)


base-commit: 67f5a18128770817e4218a9e496d2bf5047c51e8
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: 0cca17365e65370fa95d193ed2f1c88917ee1aef
prerequisite-patch-id: 12b9894350a0b56579d29542943465ef5134751c
prerequisite-patch-id: 3e1c37d3425f4820fe36ea3da57c65e166fe0ee5
prerequisite-patch-id: 1017c860a0bf95ce370d82b8db1745f5548fb321
prerequisite-patch-id: dcc022baab7c172978de9809702c2f4f54323047
prerequisite-patch-id: 0d05ee247042b43d5ab8f3af216e708a8e09bee8
prerequisite-patch-id: 110c411161bed6072c32185940fcd052d0bdb09a
prerequisite-patch-id: d2d1aeccffdfadf2b951487b8605f59c795d84cf
prerequisite-patch-id: 85fe31e27ca13adc0d1bcc7c19b1ce238a77ee6a
prerequisite-patch-id: c61fdacbe035ba5c17f1ff393bc9087f16aaea7b
prerequisite-patch-id: c4821af5dbba4d121769f1da85d91fbb53020ec0
prerequisite-patch-id: 0b20ef3302abfe6dc123dbc54b9dd087865f935b
prerequisite-patch-id: d34eb96cbbdeb91870ace4250ea75920b1653dc2
prerequisite-patch-id: 7f64fce347d15232134d7636ca7a8d9f5bf1a3a0
prerequisite-patch-id: c83be7a285eb6682cdae0df401ab5d4c208f036b
prerequisite-patch-id: eb1a44d2eb2685cea154dd3f17f5f463dfafd39a
prerequisite-patch-id: 92a8c37dae4b8394fd6702f4af58ac7815ac3069
prerequisite-patch-id: f0237988fe4ae6eba143432d1ace8beb52d935f8
prerequisite-patch-id: bcf4d29437ed7cb78225dec4c99249eb40c18302
prerequisite-patch-id: 6407b4c7f1b80af8d329d5f796b30da11959e936
prerequisite-patch-id: 4a69e6e49d691b555f0e0874d638cd204dcb0c48
prerequisite-patch-id: be09cfa8a67dd435a25103b85bd4b1649c5190a3
prerequisite-patch-id: 813ecc9f94251c3d669155faf64c0c9e6a458393
prerequisite-patch-id: beb2b5000a1682cbd74a7e2ab1566fcae5bccbf0
prerequisite-patch-id: 754c8878611864475a0b75fd49ff38e71a21c795
prerequisite-patch-id: d7d4bac3c19f94ba9593143b3c147d83d82cb71f
prerequisite-patch-id: 983d1efbe060743f5951e474961fa431d886d757
prerequisite-patch-id: 3c78b20c3b9315cd39e0ae9ea1510c6121bf9ca9
--
2.32.0

