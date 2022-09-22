Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD2B5E6341
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 15:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D22C10EB0A;
	Thu, 22 Sep 2022 13:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8117210EB08
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 13:09:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 27D011F88B;
 Thu, 22 Sep 2022 13:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663852186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=jT1iqJAKNDgaOozvp0plAaHcmEgQlAFuay4hO6xX8No=;
 b=v2lt7H4u6pkrfURWgKThdx7puczcYWy8B5YfM/JEsKzOX4fSYMa4yG2XPF8Ph8ND5a7kUW
 mLm/p53c73KaAmYwBFSj3EuT1R5HoIjqoLQuz5joDHnoXIXoZoqnisQ0rfSoTPWIwXIWf/
 1Ol1syxqlbpdQH3s6uGnAdWE7SDYZWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663852186;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=jT1iqJAKNDgaOozvp0plAaHcmEgQlAFuay4hO6xX8No=;
 b=1/hg+Sb4qgpbAA92XNsY4P3jCTcDm1vYmb97gdXRrpLokr4OdaB/Edw130PCJCA9uFW0+l
 iwfwvu/DDXA26RAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E97D81346B;
 Thu, 22 Sep 2022 13:09:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id etwVOJleLGMSbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 22 Sep 2022 13:09:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 0/5] drm/simpledrm: Various improvements
Date: Thu, 22 Sep 2022 15:09:39 +0200
Message-Id: <20220922130944.27138-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
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

This patchset contains various improvements to simpledrm that have
piled up over time.

Thomas Zimmermann (5):
  drm/simpledrm: Compute linestride with drm_format_info_min_pitch()
  drm/simpledrm: Use drm_atomic_get_new_plane_state()
  drm/simpledrm: Remove !fb check from atomic_update
  drm/simpledrm: Iterate over damage clips
  drm/simpledrm: Synchronize access to GEM BOs

 drivers/gpu/drm/tiny/simpledrm.c | 48 +++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 20 deletions(-)


base-commit: a7d5d07d5ac5ac58ec81932b3f732e3127d17af9
-- 
2.37.3

