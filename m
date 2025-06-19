Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43292AE03C2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 13:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BC010EA04;
	Thu, 19 Jun 2025 11:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nWf6BkRt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JUa2I3DQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nWf6BkRt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JUa2I3DQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AFB10E9F6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 11:34:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 763E1210F6;
 Thu, 19 Jun 2025 11:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750332880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HyDUks/3HBCcDKyjeU3On+lhhKFqES47w+fmEVXl3lM=;
 b=nWf6BkRtEZVYi7wKUHvQ6uO4zXDPR1YPYMppq5S5SUpHrk/ylzTnH7ri7VuLRh3J9z6IwF
 Fglg6ijfeWl3/VBFKMngR8+reAZAxiHAucQ9tAVPwG1ucB/eetlV6BwEz2nKq3JyrdXUqM
 kVoHCtLSqEP7PG9atBLoSh8SgxQJeDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750332880;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HyDUks/3HBCcDKyjeU3On+lhhKFqES47w+fmEVXl3lM=;
 b=JUa2I3DQaofWBLWLhOOG9mlKpHeT8IKAIWjGCr7lqgjBajX5GzlPuui0jP/73D6Bo7xhFB
 C3HtbGQB9fcBq/Bw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nWf6BkRt;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JUa2I3DQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750332880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HyDUks/3HBCcDKyjeU3On+lhhKFqES47w+fmEVXl3lM=;
 b=nWf6BkRtEZVYi7wKUHvQ6uO4zXDPR1YPYMppq5S5SUpHrk/ylzTnH7ri7VuLRh3J9z6IwF
 Fglg6ijfeWl3/VBFKMngR8+reAZAxiHAucQ9tAVPwG1ucB/eetlV6BwEz2nKq3JyrdXUqM
 kVoHCtLSqEP7PG9atBLoSh8SgxQJeDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750332880;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HyDUks/3HBCcDKyjeU3On+lhhKFqES47w+fmEVXl3lM=;
 b=JUa2I3DQaofWBLWLhOOG9mlKpHeT8IKAIWjGCr7lqgjBajX5GzlPuui0jP/73D6Bo7xhFB
 C3HtbGQB9fcBq/Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 21149139CE;
 Thu, 19 Jun 2025 11:34:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PjSoBtD1U2hKbQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 19 Jun 2025 11:34:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, jonathanh@nvidia.com,
 sumit.semwal@linaro.org, christian.koenig@amd.com, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/tegra: Avoid using import_attach directly
Date: Thu, 19 Jun 2025 13:26:59 +0200
Message-ID: <20250619113100.70292-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 763E1210F6
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.51 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,nvidia.com,linaro.org,amd.com,ffwll.ch];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 TAGGED_RCPT(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

The field import_attach of struct drm_gem_object is often only
required by PRIME code. In other places, replace its use with
clearer alternatives.

Thomas Zimmermann (2):
  drm/tegra: Test for imported buffers with drm_gem_is_imported()
  drm/tegra: Use dma_buf from GEM object instance

 drivers/gpu/drm/tegra/gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.49.0

