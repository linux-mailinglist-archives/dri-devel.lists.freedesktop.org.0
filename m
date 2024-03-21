Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E818D885D44
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 17:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0342610EEF9;
	Thu, 21 Mar 2024 16:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="JvOXEUY2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MFwPFIET";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JvOXEUY2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MFwPFIET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1AA10EEEB;
 Thu, 21 Mar 2024 16:19:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 29C185D111;
 Thu, 21 Mar 2024 16:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711037990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=+8C86hRw6A2lRO5GemWT2IaUMP1b3S0LGNcWDiLAJPo=;
 b=JvOXEUY23wMSO3GSERXQu59RObfe9qpCueaYJ/Hiue91Oxl555DgBHDL6UbxXUIUjTHbs6
 MHOMi9xTHwEJHP0u3pbM9s4we+hxBEJtNxZzFjEq0uMIxmhGHpMW46EPhb/aWISoML2yVz
 HNMPet/1kXYdVg/PsFRuZQEPMoI9SxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711037990;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=+8C86hRw6A2lRO5GemWT2IaUMP1b3S0LGNcWDiLAJPo=;
 b=MFwPFIETQxMacwTcARYL81zmttkuu8UY867wP3YXIej1OJqGstV3fgf/ymOtTw1h88QaMZ
 dGlvi5kNHd3dZzAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711037990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=+8C86hRw6A2lRO5GemWT2IaUMP1b3S0LGNcWDiLAJPo=;
 b=JvOXEUY23wMSO3GSERXQu59RObfe9qpCueaYJ/Hiue91Oxl555DgBHDL6UbxXUIUjTHbs6
 MHOMi9xTHwEJHP0u3pbM9s4we+hxBEJtNxZzFjEq0uMIxmhGHpMW46EPhb/aWISoML2yVz
 HNMPet/1kXYdVg/PsFRuZQEPMoI9SxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711037990;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=+8C86hRw6A2lRO5GemWT2IaUMP1b3S0LGNcWDiLAJPo=;
 b=MFwPFIETQxMacwTcARYL81zmttkuu8UY867wP3YXIej1OJqGstV3fgf/ymOtTw1h88QaMZ
 dGlvi5kNHd3dZzAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE6F5138A1;
 Thu, 21 Mar 2024 16:19:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wQxWKSVe/GVDFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Mar 2024 16:19:49 +0000
Date: Thu, 21 Mar 2024 17:19:48 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20240321161948.GA30430@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Score: -4.51
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[16];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JvOXEUY2;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MFwPFIET
X-Rspamd-Queue-Id: 29C185D111
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

Hi Dave, Sima,

here's the drm-misc-next-fixes PR for this week.

Best regards
Thomas

drm-misc-next-fixes-2024-03-21:
Short summary of fixes pull:

core:
- fix rounding in drm_fixp2int_round()

bridge:
- fix documentation for DRM_BRIDGE_OP_EDID

nouveau:
- don't check devinit disable on GSP

sun4i:
- fix 64-bit division on 32-bit architectures

tests:
- fix dependency on DRM_KMS_HELPER
The following changes since commit 9dd81b2e1ec72a3759f8d6bb6e9cbef93aab6227:

  drm/exynos: simplify the return value handling in exynos_dp_get_modes() (2024-03-13 10:44:14 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2024-03-21

for you to fetch changes up to 5d4e8ae6e57b025802aadf55a4775c55cceb75f1:

  nouveau/gsp: don't check devinit disable on GSP. (2024-03-19 14:34:55 +0100)

----------------------------------------------------------------
Short summary of fixes pull:

core:
- fix rounding in drm_fixp2int_round()

bridge:
- fix documentation for DRM_BRIDGE_OP_EDID

nouveau:
- don't check devinit disable on GSP

sun4i:
- fix 64-bit division on 32-bit architectures

tests:
- fix dependency on DRM_KMS_HELPER

----------------------------------------------------------------
Arthur Grillo (1):
      drm: Fix drm_fixp2int_round() making it add 0.5

Dave Airlie (1):
      nouveau/gsp: don't check devinit disable on GSP.

Dmitry Baryshkov (1):
      drm/bridge: correct DRM_BRIDGE_OP_EDID documentation

Karolina Stolarek (1):
      drm/tests: Build KMS helpers when DRM_KUNIT_TEST_HELPERS is enabled

Maxime Ripard (1):
      drm/sun4i: hdmi: Fix u64 div on 32bit arch

 drivers/gpu/drm/Kconfig                            | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c | 1 -
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             | 2 +-
 include/drm/drm_bridge.h                           | 4 ++--
 include/drm/drm_fixed.h                            | 3 +--
 5 files changed, 5 insertions(+), 7 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
