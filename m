Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CMNBIgtqGk+pQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:03:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E8C20000E
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A43810E9E8;
	Wed,  4 Mar 2026 13:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IuBB5eLp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e/yy5hIm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IuBB5eLp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e/yy5hIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A7E10E9E2
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 13:02:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A429D3E7F7;
 Wed,  4 Mar 2026 13:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772629374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8cWdL4KqJ3qiEDShj9iKehrervW9X40lnlcf0RQeBDE=;
 b=IuBB5eLpiT/YG+fXEvUwh+qi0WJgp2Geg8YK0iaZc3bdzyhtoFPpiNtnEN4t6V8BNczx+2
 Dxt/l+stfxIwtdczfv83RFxejPiZNwPNCF3jsb8xmOBlJaPd4QxyeNGZbue9eAsKgPIaQe
 a+op0DJ0VcCZSRNraUl0x9bwElRlzcY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772629374;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8cWdL4KqJ3qiEDShj9iKehrervW9X40lnlcf0RQeBDE=;
 b=e/yy5hIm64aOvHGoJ51Tk7m1tgBrY7PBGwFnorTawhSZ1bjq7uc8AwebDG7/IUEVdo7GBX
 3/rfzAfBfh8V3gAw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IuBB5eLp;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="e/yy5hIm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772629374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8cWdL4KqJ3qiEDShj9iKehrervW9X40lnlcf0RQeBDE=;
 b=IuBB5eLpiT/YG+fXEvUwh+qi0WJgp2Geg8YK0iaZc3bdzyhtoFPpiNtnEN4t6V8BNczx+2
 Dxt/l+stfxIwtdczfv83RFxejPiZNwPNCF3jsb8xmOBlJaPd4QxyeNGZbue9eAsKgPIaQe
 a+op0DJ0VcCZSRNraUl0x9bwElRlzcY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772629374;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8cWdL4KqJ3qiEDShj9iKehrervW9X40lnlcf0RQeBDE=;
 b=e/yy5hIm64aOvHGoJ51Tk7m1tgBrY7PBGwFnorTawhSZ1bjq7uc8AwebDG7/IUEVdo7GBX
 3/rfzAfBfh8V3gAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 607A83EA69;
 Wed,  4 Mar 2026 13:02:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id V9UUFn4tqGmlNQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Mar 2026 13:02:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] amdgpu,radeon: Test fbdev GEM object in helper
Date: Wed,  4 Mar 2026 13:58:37 +0100
Message-ID: <20260304130250.59008-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
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
X-Rspamd-Queue-Id: B2E8C20000E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Amdgpu and radeon handle GEM objects that refer to fbdev framebuffers
separately from the other GEM objects. Share the test logic in a single
helper that works for all.

This series is purely for cleaning up the drivers. No functional changes
intended.

Thomas Zimmermann (2):
  drm/amdgpu: Move test for fbdev GEM object into generic helper
  drm/radeon: Test for fbdev GEM object with generic helper

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 21 +++------------
 drivers/gpu/drm/drm_fb_helper.c             | 29 +++++++++++++++++++++
 drivers/gpu/drm/radeon/radeon_device.c      |  7 ++---
 drivers/gpu/drm/radeon/radeon_fbdev.c       | 17 ------------
 drivers/gpu/drm/radeon/radeon_mode.h        |  5 ----
 include/drm/drm_fb_helper.h                 |  9 +++++++
 6 files changed, 45 insertions(+), 43 deletions(-)

-- 
2.53.0

