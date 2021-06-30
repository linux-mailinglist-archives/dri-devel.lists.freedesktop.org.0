Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5198B3B7F0A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 10:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFF86E955;
	Wed, 30 Jun 2021 08:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A376E0BE;
 Wed, 30 Jun 2021 08:31:00 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EB0381FE4A;
 Wed, 30 Jun 2021 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625041858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AM0rtVZOFiCif//eHXibzf2MBkqsuD0I5qGo1zTYcQM=;
 b=cgQz0Cn5mHZl3dcTtv3KEOKZjQmCR76edxim/4oZROafUbxe0mGxtIjVweM+6mwufEi+Hc
 DWVFcZYubI9iXX09lYfeelJ1/s5nf4YqTb1bGI4sIleo3mNSqIi0AVPRSQyuH7mz4dBMsI
 M1hLE9LAKw0ZHLLiFHjRkzGvjrPwOJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625041858;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AM0rtVZOFiCif//eHXibzf2MBkqsuD0I5qGo1zTYcQM=;
 b=ovXwgd7P+iN1TdSQ9vaZm+ErjVw29iD0QeeIMNrDZ9bB+Vwf39xWU8myrwb8PcU2Co9EKW
 yLP9lVgTSVWVioBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 903BC11906;
 Wed, 30 Jun 2021 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625041858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AM0rtVZOFiCif//eHXibzf2MBkqsuD0I5qGo1zTYcQM=;
 b=cgQz0Cn5mHZl3dcTtv3KEOKZjQmCR76edxim/4oZROafUbxe0mGxtIjVweM+6mwufEi+Hc
 DWVFcZYubI9iXX09lYfeelJ1/s5nf4YqTb1bGI4sIleo3mNSqIi0AVPRSQyuH7mz4dBMsI
 M1hLE9LAKw0ZHLLiFHjRkzGvjrPwOJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625041858;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AM0rtVZOFiCif//eHXibzf2MBkqsuD0I5qGo1zTYcQM=;
 b=ovXwgd7P+iN1TdSQ9vaZm+ErjVw29iD0QeeIMNrDZ9bB+Vwf39xWU8myrwb8PcU2Co9EKW
 yLP9lVgTSVWVioBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 7raYH8Ir3GDkQQAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 30 Jun 2021 08:30:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk, mika.kuoppala@linux.intel.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 lucas.demarchi@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH v2 0/2] drm/i915: IRQ fixes
Date: Wed, 30 Jun 2021 10:30:55 +0200
Message-Id: <20210630083057.5475-1-tzimmermann@suse.de>
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

(was: drm/i915: Drop all references to DRM IRQ midlayer)

Fix a bug in the usage of IRQs and cleanup references to the DRM
IRQ midlayer.

Preferably this patchset would be merged through drm-misc-next.

Thomas Zimmermann (2):
  drm/i915: Use the correct IRQ during resume
  drm/i915: Drop all references to DRM IRQ midlayer

 drivers/gpu/drm/i915/gt/intel_ring_submission.c |  2 +-
 drivers/gpu/drm/i915/i915_drv.c                 |  1 -
 drivers/gpu/drm/i915/i915_irq.c                 | 10 +++++-----
 drivers/gpu/drm/i915/i915_irq.h                 |  1 +
 4 files changed, 7 insertions(+), 7 deletions(-)


base-commit: 67f5a18128770817e4218a9e496d2bf5047c51e8
--
2.32.0

