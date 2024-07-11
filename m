Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47DF92E0C2
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 09:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E997610E975;
	Thu, 11 Jul 2024 07:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="oZXCfWx+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Yc4nbYyW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xcVJZmUT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SZejFvVu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0440410E974
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 07:24:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 533F0218EC;
 Thu, 11 Jul 2024 07:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720682659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4l3OKoBh8zOr3/FDgi99zRL81lr5tlV2pFxT5sGFgoM=;
 b=oZXCfWx+KS0Whp0Ct5F0R0DUw+N1ca2bJZQ6JcmaTphQZPr/JdbPP//Y2ANqTBG0yxotH9
 U0G2Tr6zFgahDW3/NYNkbp9TjPwSCCcvTm8VcexkHHrSndzHWYUCQ4OMHXk76AVH05dW5O
 pXbxLxsMrGCAoJ8DrkY5YVaG3yQUAmY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720682659;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4l3OKoBh8zOr3/FDgi99zRL81lr5tlV2pFxT5sGFgoM=;
 b=Yc4nbYyWtN4NWQ2NJfeeE1F0vT566CHN4qgpytH0elclMFqWbXwipEVqG5hU3ucUq2Ay3J
 jYDfiwYtCyAMPyBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xcVJZmUT;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SZejFvVu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720682658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4l3OKoBh8zOr3/FDgi99zRL81lr5tlV2pFxT5sGFgoM=;
 b=xcVJZmUTXiNbTs7dI66rdjLCQUBcUVieOeOJpSln0XYOMjjsBuoMgbOfhb7zeK0M8hl3Uk
 NtjHfUROU5wxeTtvx+FjL/jmyr/SxDKqv4yy0i3uzcimttmhDGPFIZA0CUZjPpjR0DWMMH
 s2qaLreJWeagAtwaxFl9mll8DshLjoI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720682658;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4l3OKoBh8zOr3/FDgi99zRL81lr5tlV2pFxT5sGFgoM=;
 b=SZejFvVuL00O+9gg2YfXSkTCpgXjm/p224r1YYogI22NW7DuMQVYO2bWE8wsqI1ReLtU8z
 dzDrijIAZwngMgDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 15AD6139E0;
 Thu, 11 Jul 2024 07:24:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DbWxA6KIj2bTDwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 11 Jul 2024 07:24:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/3] drm/mgag200: Control VIDRST and BMC from CRTC
Date: Thu, 11 Jul 2024 09:23:03 +0200
Message-ID: <20240711072415.11831-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 533F0218EC
X-Spam-Flag: NO
X-Spam-Score: 0.99
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.99 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCPT_COUNT_SEVEN(0.00)[8]; FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spamd-Bar: /
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

(was: drm/mgag200: Handle VIDRST from BMC helpers)

The VIDRST pin controls CRTC synchronization with an external clock
chip, such as a BMC or TV encoder. This patchset separates the CRTC
state from the BMC state and streamlines the driver code.

v3:
- don't clear VIDRST bits unnecessarily (Jocelyn)
v2:
- run BMC and VIDRST logic from CRTC code (Jocelyn)

Thomas Zimmermann (3):
  drm/mgag200: Only set VIDRST bits in CRTC modesetting
  drm/mgag200: Remove vidrst callbacks from struct mgag200_device_funcs
  drm/mgag200: Rename BMC vidrst names

 drivers/gpu/drm/mgag200/mgag200_bmc.c     |  9 ++-----
 drivers/gpu/drm/mgag200/mgag200_drv.h     | 31 ++++++++---------------
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |  9 +++----
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  9 +++----
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  2 --
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |  9 +++----
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  2 --
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 27 +++++++++-----------
 8 files changed, 34 insertions(+), 64 deletions(-)

-- 
2.45.2

