Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 437164AC0CC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 15:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B23C10E599;
	Mon,  7 Feb 2022 14:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A67710E480
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 14:15:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3D00B210E3;
 Mon,  7 Feb 2022 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644243346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=YSRi4upBASE6aCHHobbPb9YPI0sOlDsDlfXZfeZv5Os=;
 b=c2sq0z5SDPPj5HnJnNEXukvVeW+9iRWl9tYCaTHxXLwHwG5N9FsnIZgsJhEcmR62WeBXRh
 MqNu8c58FNorfPwIicyAuxOLkyJRXm7zLPNOaFOOcYBzjR9jx0pQ7j828A1Qgx/BIqKPCY
 McP6N6ak9J4oNfc98QDWAn7E+0IX4oU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644243346;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=YSRi4upBASE6aCHHobbPb9YPI0sOlDsDlfXZfeZv5Os=;
 b=qQY4A736A2KwYvJMSFzu9PNntHF8ZkmSYFoZuGeFlI38lXduxJ7EDHhHvU7sC6bwZnp00x
 g6xoEvcmfXP2PpCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0420713BF5;
 Mon,  7 Feb 2022 14:15:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dg6YO5EpAWKePQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Feb 2022 14:15:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, kuohsiang_chou@aspeedtech.com,
 tommy_huang@aspeedtech.com, jenmin_yuan@aspeedtech.com,
 arc_sung@aspeedtech.com
Subject: [PATCH v2 0/9] drm/ast: Untangle connector helpers
Date: Mon,  7 Feb 2022 15:15:35 +0100
Message-Id: <20220207141544.30015-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ast driver supports different transmitter chips to support DVI
and HDMI connectors. It's al been packed into the same helpers
functons and exported as VGA connector.

Introduce a separate set of connector helpers for each transmitter
chip, and thus connector type. Also provide the correct encoder for
each connector.

This change mostly affects the connector's get_modes helper, where
VGA-, DVI- and HDMI-related code was lumped into the same function.
It's now all separate. While at it, also rework and cleanup the
initialization of the related data structures.

Tested on AST 2100 and AST 2300 hardware. I don't have hardware with
special transmitter chips (SIL164, DP501), so I could only test the VGA
code.

v2:
	* move encoder's preferred-CRTC bitmask setup into separate patch
	  (Javier)

Thomas Zimmermann (9):
  drm/ast: Fail if connector initialization fails
  drm/ast: Move connector mode_valid function to CRTC
  drm/ast: Remove AST_TX_ITE66121 constant
  drm/ast: Remove unused value dp501_maxclk
  drm/ast: Rename struct ast_connector to struct ast_vga_connector
  drm/ast: Initialize encoder and connector for VGA in helper function
  drm/ast: Read encoder possible-CRTC mask from drm_crtc_mask()
  drm/ast: Move DP501-based connector code into separate helpers
  drm/ast: Move SIL164-based connector code into separate helpers

 drivers/gpu/drm/ast/ast_dp501.c |  58 -----
 drivers/gpu/drm/ast/ast_drv.h   |  37 ++-
 drivers/gpu/drm/ast/ast_mode.c  | 413 +++++++++++++++++++++++---------
 3 files changed, 331 insertions(+), 177 deletions(-)


base-commit: 0bb81b5d6db5f689b67f9d8b35323235c45e890f
-- 
2.34.1

