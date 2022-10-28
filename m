Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E421961112E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 14:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA5210E1B7;
	Fri, 28 Oct 2022 12:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7093010E1B7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 12:22:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 46AE721A72;
 Fri, 28 Oct 2022 12:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666959751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SuHkMfGNEosBpax5gPbN6BaTE8IpT0eeXj/Wb5WvQgU=;
 b=HrLQSoI4LXVmjwWeFm76KdSg7ctdro5t8KPMIppvViKLQIIuD2Md/26i9fpQRpAO8Jspyq
 lY0cEeju0j4MnliwHwTsM8RvZBT8xQ0RHXi03pWM0COKVeWD9uutoEt5qumccOsmDGForA
 yKpAE5u6zhbzPmrbDMF49a60dzz0VuM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666959751;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SuHkMfGNEosBpax5gPbN6BaTE8IpT0eeXj/Wb5WvQgU=;
 b=5vqCOGbA7MjWgDIsgcMEJWHJzV4CVsHhOIu5Va+rTUcS+2GQZNAookYWEnhz17UiWnrs7g
 F7quQPvF8MMz2wCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 171871377D;
 Fri, 28 Oct 2022 12:22:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Cj2oBIfJW2MScwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Oct 2022 12:22:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.stein@ew.tq-group.com, javierm@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v2 0/2] drm/ofdrm: Fix sparse warnings
Date: Fri, 28 Oct 2022 14:22:27 +0200
Message-Id: <20221028122229.21780-1-tzimmermann@suse.de>
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

v2:
	* convert PCI ID endianness (Alex)

Thomas Zimmermann (2):
  drm/ofdrm: Convert PCI IDs to CPU endianness for comparing
  drm/ofdrm: Cast error pointers to void __iomem *

 drivers/gpu/drm/tiny/ofdrm.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)


base-commit: 746559738f1335241ea686566cb654847c20d7a4
-- 
2.38.0

