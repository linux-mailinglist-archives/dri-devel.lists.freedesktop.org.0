Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJK1FaTFnWnsRwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55C71891AF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B1A10E32C;
	Tue, 24 Feb 2026 15:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="FhZukl3K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="USO5l79l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FhZukl3K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="USO5l79l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA06E10E32C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 15:37:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 757D83F2BD;
 Tue, 24 Feb 2026 15:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SfNwmUiIzpGDpEX5UGKvhHfiPIDf+gJlJetvo/8ipFM=;
 b=FhZukl3KDRKRgXm39JeRd9tqI2NLOz8IXtfmJiAclzSTZHOfx8+3nc+EOmmnJ5IWSl2EyD
 k7n9Oz/Dhr1SSXsTdviEoNc406mBz1vg9eWYZjhc8qKoCtRovO6lZ8mBf+iYhfvX7L1hGx
 vhYM3XALNq2rmmn7q26mxIr54fYCswA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947421;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SfNwmUiIzpGDpEX5UGKvhHfiPIDf+gJlJetvo/8ipFM=;
 b=USO5l79lxO4eRPCtaE2V6BlM6iL1O3I4fM7vsmqRa6kqsByG2HsG0FvBqOcIXrZPq300n8
 Bln6Yb1yNi5pUxAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FhZukl3K;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=USO5l79l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SfNwmUiIzpGDpEX5UGKvhHfiPIDf+gJlJetvo/8ipFM=;
 b=FhZukl3KDRKRgXm39JeRd9tqI2NLOz8IXtfmJiAclzSTZHOfx8+3nc+EOmmnJ5IWSl2EyD
 k7n9Oz/Dhr1SSXsTdviEoNc406mBz1vg9eWYZjhc8qKoCtRovO6lZ8mBf+iYhfvX7L1hGx
 vhYM3XALNq2rmmn7q26mxIr54fYCswA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947421;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SfNwmUiIzpGDpEX5UGKvhHfiPIDf+gJlJetvo/8ipFM=;
 b=USO5l79lxO4eRPCtaE2V6BlM6iL1O3I4fM7vsmqRa6kqsByG2HsG0FvBqOcIXrZPq300n8
 Bln6Yb1yNi5pUxAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 13D5A3EA68;
 Tue, 24 Feb 2026 15:37:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vtFrA53FnWm0FgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Feb 2026 15:37:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, lanzano.alex@gmail.com, kamlesh.gurudasani@gmail.com,
 david@lechnology.com, architanant5@gmail.com, wens@kernel.org,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [RFC PATCH 00/16] drm/mipi-dbi: Replace simple-display helpers with
 regular atomic heleprs
Date: Tue, 24 Feb 2026 16:24:37 +0100
Message-ID: <20260224153656.261351-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.51
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com,lechnology.com,kernel.org,linux.intel.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:javierm@redhat.com,m:lanzano.alex@gmail.com,m:kamlesh.gurudasani@gmail.com,m:david@lechnology.com,m:architanant5@gmail.com,m:wens@kernel.org,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:airlied@gmail.com,m:tzimmermann@suse.de,m:lanzanoalex@gmail.com,m:kamleshgurudasani@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A55C71891AF
X-Rspamd-Action: no action

We keep getting new drivers based on the obsolete simple-display pipeline,
such as the recent driver for st7789v panels. [1] But submitters cannot
know, as the simple-display helpers are fully documented and still used
in several places.

Hence, convert all the mipi-dbi drivers over to regular atomic helpers
and remove simple-display support from mipi-dbi in this series. Then
undocument the helpers and add TODO items for final their removal.

Patch 1 changes the mode-setting logic get CRTC and panel updates into
the correct order. This patch is probably the most fragile change in the
series.

Patches 2 and 3 prepare mipi-dbi to allow for atomic helpers to be used.

Patches 5 to 14 update mipi-dbi drivers one by one. The st7735r driver
requires some additional minor preparation. Overall, the refactoring is
always the same.

Patches 15 abd 16 clean up mipi-dbi and the simple-display helpers.

These patches need some testing, as I can only compile them. At least
one of the drivers should be tried on hardware. Regressions should be
easy to fix, as these changes are mostly refactoring jobs.

[1] https://lore.kernel.org/dri-devel/20260221071351.22772-1-architanant5@gmail.com/

Thomas Zimmermann (16):
  drm/mipi-dbi: Only modify planes on enabled CRTCs
  drm/mipi-dbi: Support custom pipelines with drm_mipi_dbi_dev_init()
  drm/mipi-dbi: Provide callbacks for atomic interfaces
  drm/hx8357d: Use regular atomic helpers; drop simple-display helpers
  drm/ili9163: Use regular atomic helpers; drop simple-display helpers
  drm/ili9225: Use regular atomic helpers; drop simple-display helpers
  drm/ili9341: Use regular atomic helpers; drop simple-display helpers
  drm/ili9486: Use regular atomic helpers; drop simple-display helpers
  drm/mi0283qt: Use regular atomic helpers; drop simple-display helpers
  drm/panel-mipi-dbi: Use regular atomic helpers; drop simple-display
    helpers
  drm/st7586: Use regular atomic helpers; drop simple-display helpers
  drm/st7735r: Rename struct st7735r_priv to struct st7735r_device
  drm/st7735r: Rename priv variable to st7735r
  drm/st7735r: Use regular atomic helpers; drop simple-display helpers
  drm/mipi-dbi: Remove simple-display helpers from mipi-dbi
  drm/simple-kms: Deprecate simple-kms helpers

 Documentation/gpu/drm-kms-helpers.rst   |  12 -
 Documentation/gpu/introduction.rst      |   5 -
 Documentation/gpu/todo.rst              |  32 +++
 drivers/gpu/drm/drm_crtc.c              |   6 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c |  22 --
 drivers/gpu/drm/drm_mipi_dbi.c          | 352 ++++++------------------
 drivers/gpu/drm/drm_modeset_helper.c    |   3 -
 drivers/gpu/drm/drm_simple_kms_helper.c |  83 ------
 drivers/gpu/drm/sitronix/st7586.c       | 194 +++++++++----
 drivers/gpu/drm/sitronix/st7735r.c      | 142 ++++++++--
 drivers/gpu/drm/tiny/hx8357d.c          | 138 +++++++++-
 drivers/gpu/drm/tiny/ili9163.c          | 139 +++++++++-
 drivers/gpu/drm/tiny/ili9225.c          | 193 +++++++++----
 drivers/gpu/drm/tiny/ili9341.c          | 139 +++++++++-
 drivers/gpu/drm/tiny/ili9486.c          | 130 ++++++++-
 drivers/gpu/drm/tiny/mi0283qt.c         | 139 +++++++++-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c   | 142 ++++++++--
 include/drm/drm_mipi_dbi.h              | 140 ++++++----
 include/drm/drm_simple_kms_helper.h     | 216 +--------------
 19 files changed, 1366 insertions(+), 861 deletions(-)


base-commit: 1c44015babd759b8e5234084dffcc08a0b784333
-- 
2.52.0

