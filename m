Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC25A617AAF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 11:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1111710E5CD;
	Thu,  3 Nov 2022 10:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06AE10E5CC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 10:16:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 59EFD1F6E6;
 Thu,  3 Nov 2022 10:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667470589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nKWHnNEQ/XMOYS/BALDTZW1hlwOIWk7JYAD42BLxXhs=;
 b=FAXYJohCkj+DSuIybXEhWh+2yeuAkSLZmn2eWIW7LTfvy/xlZe4GVYI13QFOn8FxLLStHI
 cT36sG2yQRWKPoAGoqouGBe+qOF6DeWj5QzaAmZ5cHG5p4DxrtfXx+xPdES1PW4aBpv3ma
 IzDoCsnUKFYRGaI1jpazHdB4BCr3180=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667470589;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nKWHnNEQ/XMOYS/BALDTZW1hlwOIWk7JYAD42BLxXhs=;
 b=r9QkkZNH0NvvibCMyfH4z7g9NhYwZPNW/6swPAEikeTi2Qw3kbZvJdlh2UyJLcG3CpBx39
 DXIpO+dFlVbbXrAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 22A9113AAF;
 Thu,  3 Nov 2022 10:16:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cWyJB/2UY2PTcgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Nov 2022 10:16:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.stein@ew.tq-group.com, javierm@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 0/2] drm/ofdrm: Fix sparse warnings
Date: Thu,  3 Nov 2022 11:16:25 +0100
Message-Id: <20221103101627.32502-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
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

Fix two types of sparse warnings in ofdrm. Reported by the LKP bot.

v3:
	* use IOMEM_ERR_PTR() (Javier)
v2:
	* convert PCI ID endianness (Alex)

Thomas Zimmermann (2):
  drm/ofdrm: Convert PCI IDs to CPU endianness for comparing
  drm/ofdrm: Cast error pointers to void __iomem *

 drivers/gpu/drm/tiny/ofdrm.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)


base-commit: f5a9fb2d688dfc6efa1fd779a2d225048bfb10f9
-- 
2.38.0

