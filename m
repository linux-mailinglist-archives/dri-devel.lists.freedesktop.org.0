Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA85894ACD8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 17:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA3A10E56F;
	Wed,  7 Aug 2024 15:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="fGVuxe2j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bMl9Tkv6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fGVuxe2j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bMl9Tkv6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046BF10E18A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 15:26:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9015D21A8B;
 Wed,  7 Aug 2024 15:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723044408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HuLDm8AF4KM2JXlRhi/8GhHOyeSqQq9gOrPmYrRRpEo=;
 b=fGVuxe2jpmdSv+XKU3lwSdlQPNDt1dLfIHR/IhY7mH0ojAAAbNGK+2RilWMq0A8+YNqlkZ
 h95Q1HiPJnvCg9SuWJ59chtCrsfjGRDnIkNoQ4IvwIfNMu215+OPJVyN5VTb/8BL6JY+//
 MCoemaMTkq/yORXN7h1BSms12DVtb9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723044408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HuLDm8AF4KM2JXlRhi/8GhHOyeSqQq9gOrPmYrRRpEo=;
 b=bMl9Tkv6DPnlQXd4ybMeYHBtO8w77QP3yfU4doY0nzGVu8Tsub3a+IOU2PvLcfPMzuX6tl
 UMsMA8q/RFclgNAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723044408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HuLDm8AF4KM2JXlRhi/8GhHOyeSqQq9gOrPmYrRRpEo=;
 b=fGVuxe2jpmdSv+XKU3lwSdlQPNDt1dLfIHR/IhY7mH0ojAAAbNGK+2RilWMq0A8+YNqlkZ
 h95Q1HiPJnvCg9SuWJ59chtCrsfjGRDnIkNoQ4IvwIfNMu215+OPJVyN5VTb/8BL6JY+//
 MCoemaMTkq/yORXN7h1BSms12DVtb9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723044408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HuLDm8AF4KM2JXlRhi/8GhHOyeSqQq9gOrPmYrRRpEo=;
 b=bMl9Tkv6DPnlQXd4ybMeYHBtO8w77QP3yfU4doY0nzGVu8Tsub3a+IOU2PvLcfPMzuX6tl
 UMsMA8q/RFclgNAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43D5113297;
 Wed,  7 Aug 2024 15:26:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BnteDziSs2bxewAAD6G6ig
 (envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 15:26:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] ALSA/DRM: vmalloc PCM buffer helper cleanup
Date: Wed,  7 Aug 2024 17:27:21 +0200
Message-ID: <20240807152725.18948-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de];
 TAGGED_RCPT(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[11];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.30
X-Spam-Flag: NO
X-Spam-Level: 
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

Hi,

we still keep the legacy vmalloc ALSA PCM helper API since there is
only a single user of it, namely, the DRM dw-hdmi bridge driver.
In the past, I attempted to change the buffer management of the
driver, but due to the lack of testing, it failed to get merged:
  https://lore.kernel.org/20191210154536.29819-1-tiwai@suse.de

So, this is a second try after some years of gap: now the relevant
code snippet is moved from ALSA core to dw-hdmi driver itself, and the
API functions are dropped.  There should be no functional changes in
the driver.

If DRM people don't mind and give an ack, I can take the change for
dw-hdmi code together with ALSA core code drop via sound tree for
6.12.


thanks,

Takashi

===

Takashi Iwai (2):
  drm/bridge: dw-hdmi: Move vmalloc PCM buffer management into the
    driver
  ALSA: pcm: Drop PCM vmalloc buffer helpers

 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   | 30 ++++++++--
 include/sound/pcm.h                           | 42 -------------
 sound/core/pcm_memory.c                       | 59 -------------------
 3 files changed, 26 insertions(+), 105 deletions(-)

-- 
2.43.0

