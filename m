Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FF44693D5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06B57A403;
	Mon,  6 Dec 2021 10:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C013272DA4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 09:11:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5DF42212BA;
 Mon,  6 Dec 2021 09:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638781889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=N3hPv4sxladXc5DC7KBdtP2ySpiFeOIn8eTMyXFy4mI=;
 b=1Uxa0t575s1H0O1USfbJ71eLvdjs8latQkHfo80XmYUIxLkoXRBhTq7M3wgRSzD4WsS3Py
 mSzKPCKVCF8kIEAF6sIHoRhjsHuUfwimjd3/HabQX6NEtwkjBDjvsDvYP+0K/48GQddW+p
 XSitFW+jH3DtSOSpl/2OqnAR77nVn88=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638781889;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=N3hPv4sxladXc5DC7KBdtP2ySpiFeOIn8eTMyXFy4mI=;
 b=VoQ8eVqZyaw2/44XMWuq+RAKXk6/e8LOzlenj7FL6bV5+/yM69ipiN/luR/V+durVPKZvl
 NxO3KoLSPkcKFLDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3371213B27;
 Mon,  6 Dec 2021 09:11:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id g3+NC8HTrWE8IwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Dec 2021 09:11:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
Subject: [PATCH v2 0/3] ast: Fix I2C corner cases wrt init/cleanup
Date: Mon,  6 Dec 2021 10:11:22 +0100
Message-Id: <20211206091125.29501-1-tzimmermann@suse.de>
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

The VGA connector in ast is supposed to work without I2C. Currently,
this isn't implemented correctly in several places. Fix this. Also
add managed cleanup of the I2C code and move it into separate source
file.

Tested on AST2100 hardware.

v2:
	* init edid to NULL to avoid uninitialized read
	* drop test for drm_connector_init() for now
	* move I2C code into separate source file

Thomas Zimmermann (3):
  drm/ast: Handle failed I2C initialization gracefully
  drm/ast: Convert I2C code to managed cleanup
  drm/ast: Move I2C code into separate source file

 drivers/gpu/drm/ast/Makefile   |   2 +-
 drivers/gpu/drm/ast/ast_drv.h  |   3 +
 drivers/gpu/drm/ast/ast_i2c.c  | 152 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_mode.c | 151 +++-----------------------------
 4 files changed, 167 insertions(+), 141 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_i2c.c


base-commit: 909bf926eaf382123d9b215871143d9e3cf44aa3
--
2.34.1

