Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EE8733322
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 16:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDC010E634;
	Fri, 16 Jun 2023 14:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F3810E629
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:07:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7D7401F853;
 Fri, 16 Jun 2023 14:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686924461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=396giAWWm30kR1j/LWVbAhqOPnRK36I9bEyhjDwwaUo=;
 b=0KkP6u+XSmZH4emWHPm3GH0X/BT8D+5oX8g0KM9tqBazaFneBA+F70MhZSgH6+PugMIBAc
 NeCMziNkC/fdoc5w71thQjKjDTGn7LO0q1sVYn3oN3H3Img6AQHEdf2PK+1NRHunNh/Elq
 /Gac+HX3OQOu5Ph6I+fKzf1XO7H9jKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686924461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=396giAWWm30kR1j/LWVbAhqOPnRK36I9bEyhjDwwaUo=;
 b=zz2ZwOOyLT6a/4u9n4z9sZpXSd86QlQ8Uz0k+8YmErDQl1n0S+ppUKet0ecd5HHZru8SUk
 jXZSqZCzcwRg/fAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 52972138E8;
 Fri, 16 Jun 2023 14:07:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IOP9Eq1sjGTfWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jun 2023 14:07:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com
Subject: [PATCH 00/14] drm/ast: Refactor the device-detection code
Date: Fri, 16 Jun 2023 15:52:22 +0200
Message-ID: <20230616140739.32042-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
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

Ast's code for detecting the device type and features is convoluted.
It mixes up several state fields, chip types and sub-models. Rework
the driver into somehting more understandable.

Patches 1 fixes a long-standing bug. The affected code has never
worked correctly.

Patches 2 to 8 make various changes to the init code, or remove dead
and duplicated code paths.

Patch 9 introduces chip generations. Until now, ast used the value
of enum ast_chip to represent a certain set of related modes, and
also used the enum to represent individal models. This makes the
driver code hard to understand in certain places. The patch encodes
a chip generation in each model enum and converts the driver to use
it.

Patches 10 to 12 replace duplicated model checks with the correct
enum value. Detection of wide-screen functionality and the transmitter
chip can then be moved into individual functions in patch 13.

Patch 14 merges the detection of the silicon revision and the chip
model into s single function. Both need to be done in the same place
and affect each other.

Tested on AST1100 and AST2300.

Thomas Zimmermann (14):
  drm/ast: Fix DRAM init on AST2200
  drm/ast: Remove vga2_clone field
  drm/ast: Implement register helpers in ast_drv.h
  drm/ast: Remove dead else branch in POST code
  drm/ast: Remove device POSTing and config from chip detection
  drm/ast: Set PCI config before accessing I/O registers
  drm/ast: Enable and unlock device access early during init
  drm/ast: Set up release action right after enabling MMIO
  drm/ast: Distinguish among chip generations
  drm/ast: Detect AST 1300 model
  drm/ast: Detect AST 1400 model
  drm/ast: Detect AST 2510 model
  drm/ast: Move widescreen- and tx-chip detection into separate helpers
  drm/ast: Merge config and chip detection

 drivers/gpu/drm/ast/ast_dp501.c |   6 +-
 drivers/gpu/drm/ast/ast_drv.h   |  97 +++++++---
 drivers/gpu/drm/ast/ast_main.c  | 320 +++++++++++++++++++-------------
 drivers/gpu/drm/ast/ast_mm.c    |   2 -
 drivers/gpu/drm/ast/ast_mode.c  |  35 ++--
 drivers/gpu/drm/ast/ast_post.c  |  74 ++------
 6 files changed, 294 insertions(+), 240 deletions(-)

-- 
2.41.0

