Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E236D48AD34
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 13:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E05810E4D0;
	Tue, 11 Jan 2022 12:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C2610E473
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 12:01:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 54CFD21119;
 Tue, 11 Jan 2022 12:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641902461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=L11lTH/ajWBYbs6IR6vqzgdxy/ToLfE4HqEerP8WkG0=;
 b=qHZbADFf+zlwmyRP+4NROcMqHTJxyKB0yVjdXu+QnSph+82OYkIsNIoW/UVY/sY56sCnsc
 ephh+7w7p8Ql8R8rP7OdUM1mfwx9EG8WhbnxzDr0hidAYJHX6UZTfufOdMbXWscVdMJ7Qa
 Js647OhSSM3+6EzQ6ZJKAh/F4qht/+A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641902461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=L11lTH/ajWBYbs6IR6vqzgdxy/ToLfE4HqEerP8WkG0=;
 b=b3esurP6O0fjSfQk4v/sbS9lSfg99zJqoSxgIah/hLc5UrEvfH5dVeApV4xRaYEimwPQOd
 /bfNV00hFPWOPJCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D7A713DD4;
 Tue, 11 Jan 2022 12:01:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3E0wBn1x3WEeFQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jan 2022 12:01:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
Subject: [PATCH 0/8] drm/ast: Untangle connector helpers
Date: Tue, 11 Jan 2022 13:00:50 +0100
Message-Id: <20220111120058.10510-1-tzimmermann@suse.de>
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
Cc: jenmin_yuan@aspeedtech.com, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, tommy_huang@aspeedtech.com,
 arc_sung@aspeedtech.com
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

Thomas Zimmermann (8):
  drm/ast: Fail if connector initialization fails
  drm/ast: Move connector mode_valid function to CRTC
  drm/ast: Remove AST_TX_ITE66121 constant
  drm/ast: Remove unused value dp501_maxclk
  drm/ast: Rename struct ast_connector to struct ast_vga_connector
  drm/ast: Initialize encoder and connector for VGA in helper function
  drm/ast: Move DP501-based connector code into separate helpers
  drm/ast: Move SIL164-based connector code into separate helpers

 drivers/gpu/drm/ast/ast_dp501.c |  58 -----
 drivers/gpu/drm/ast/ast_drv.h   |  37 ++-
 drivers/gpu/drm/ast/ast_mode.c  | 413 +++++++++++++++++++++++---------
 3 files changed, 331 insertions(+), 177 deletions(-)


base-commit: fbce7b8d8df5af8d404b6aeaf63779f91bdbeb5d
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
-- 
2.34.1

