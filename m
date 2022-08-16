Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5640D595F38
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 17:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90E38D994;
	Tue, 16 Aug 2022 15:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0195B8D994
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 15:37:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 97A781FE53;
 Tue, 16 Aug 2022 15:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660664220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=P009cW09xrhcJJVDDp3flRZgQWcxLyS3VXOA3fJen8U=;
 b=t7tQ66YPO6qthRPGmocjobqeUAC9p7q/CHWmlwYNkFipHxUbu2VGqIpDliqJfeOl0Odbx1
 PbMnnp6saElm5aUpA4XycMDdntJOQp3ncDttf+/icWaSFl3sIV6cVzlQJey3a7FvKllX0m
 2TD6Kdmjt+sO/kfc6HaWEwHz7cWGTqY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660664220;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=P009cW09xrhcJJVDDp3flRZgQWcxLyS3VXOA3fJen8U=;
 b=LEdS3+yxjJypiO+qzOQmG4/0ZUg8C2FFXE1wCxX1V3TuXGJvSMe4EyL65mGtSb+83SdZOQ
 fQdXC3o9NiSM9TAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E09F139B7;
 Tue, 16 Aug 2022 15:37:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id s+AkFpy5+2LKJAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 16 Aug 2022 15:37:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/12] drm/udl: More fixes
Date: Tue, 16 Aug 2022 17:36:43 +0200
Message-Id: <20220816153655.27526-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this patch set contains more fixes for UDL driver, to be applied on
top of my previous patch set [*].  It covers the PM problems,
regressions in the previous patch set, fixes for the stalls on some
systems, as well as more hardening.


Takashi

[*] https://lore.kernel.org/r/20220804075826.27036-1-tiwai@suse.de

===

Takashi Iwai (8):
  Revert "drm/udl: Kill pending URBs at suspend and disconnect"
  drm/udl: Suppress error print for -EPROTO at URB completion
  drm/udl: Increase the default URB list size to 20
  drm/udl: Drop unneeded alignment
  drm/udl: Fix potential URB leaks
  drm/udl: Fix inconsistent urbs.count value during udl_free_urb_list()
  drm/udl: Don't re-initialize stuff at retrying the URB list allocation
  drm/udl: Sync pending URBs at the end of suspend

Thomas Zimmermann (4):
  drm/udl: Restore display mode on resume
  drm/udl: Add reset_resume
  drm/udl: Enable damage clipping
  drm/udl: Add parameter to set number of URBs

 drivers/gpu/drm/udl/udl_drv.c      | 19 +++++-
 drivers/gpu/drm/udl/udl_drv.h      | 13 +---
 drivers/gpu/drm/udl/udl_main.c     | 97 +++++++++++++++---------------
 drivers/gpu/drm/udl/udl_modeset.c  | 42 ++++---------
 drivers/gpu/drm/udl/udl_transfer.c | 45 ++------------
 5 files changed, 86 insertions(+), 130 deletions(-)

-- 
2.35.3

