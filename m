Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CC5738438
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D501A10E45F;
	Wed, 21 Jun 2023 13:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2722310E45F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 13:00:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 42BF31FE32;
 Wed, 21 Jun 2023 13:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687352434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=M41pYkFSa4aBAqH2vMgv0DDFTfqWwurHsAkneJjmqxI=;
 b=D3Vr1rVV87eYjlZ3yXwRWvGPTYCJ0Buk1g22r2k6R+1cXq54vmf76I5j23BbfeBIF9EeoH
 +tEdSWT8EONpToO7Ixj/sX3RGOlHCRzsilWARcEACXsrAm+QwTEXJG6UZrv2rojclQ3CjG
 pc+DAJ2AGYmqKsT+DImZS6Vdoyft720=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687352434;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=M41pYkFSa4aBAqH2vMgv0DDFTfqWwurHsAkneJjmqxI=;
 b=zaahEe2Z2XVoHzZFsoWoH45W9UI4O4DHa/rSDOhYfmDn312RZ8J2lLDnrxd78iAY/bQfmw
 1gwt0wpXyPE0pTAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1956A134B1;
 Wed, 21 Jun 2023 13:00:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DxU2BXL0kmTaWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Jun 2023 13:00:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com, suijingfeng@loongson.cn
Subject: [PATCH v2 00/14] drm/ast: Refactor the device-detection code
Date: Wed, 21 Jun 2023 14:53:34 +0200
Message-ID: <20230621130032.3568-1-tzimmermann@suse.de>
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
the driver into something more understandable.

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
model into a single function. Both need to be done in the same place
and affect each other.

Tested on AST1100 and AST2300.

v2:
	* use standard 16-bit PCI access (Jingfeng)
	* various cleanups

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
  drm/ast: Move widescreen and tx-chip detection into separate helpers
  drm/ast: Merge config and chip detection

 drivers/gpu/drm/ast/ast_dp501.c |   6 +-
 drivers/gpu/drm/ast/ast_drv.h   |  94 +++++++---
 drivers/gpu/drm/ast/ast_main.c  | 319 +++++++++++++++++++-------------
 drivers/gpu/drm/ast/ast_mm.c    |   2 -
 drivers/gpu/drm/ast/ast_mode.c  |  35 ++--
 drivers/gpu/drm/ast/ast_post.c  |  74 ++------
 6 files changed, 290 insertions(+), 240 deletions(-)


base-commit: 32e260cd0d16cee6f33e747679f168d63ea54bf6
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: cbc453ee02fae02af22fbfdce56ab732c7a88c36
prerequisite-patch-id: d3145eae4b35a1290199af6ff6cd5abfebc82033
prerequisite-patch-id: 242b6bc45675f1f1a62572542d75c89d4864f15a
-- 
2.41.0

