Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C5E4651B4
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 16:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8916EDFE;
	Wed,  1 Dec 2021 15:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A796EDF8
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 15:31:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B2BB71FD5B;
 Wed,  1 Dec 2021 15:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638372661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nFAh1V79b3utKdNN1754qLKUx1RM6QAgneR5DYQJSvY=;
 b=HN5rsFYt63k/xcGL2T0Er3WF9gK89cJHCIxP4BgOsgoV+h4fde3643Ig9YMqSRoQuo19iO
 pRM21V52rFo9KTRlVt6J7n288gQGNjIY7Y0eAsBLMnw0LdGibyxxz5NchwYxB20BUl1r7V
 XYSFijCNqIctS6uCffGieCNJgvJNShA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638372661;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nFAh1V79b3utKdNN1754qLKUx1RM6QAgneR5DYQJSvY=;
 b=2GBjh6LaQh5CDvSsqL0VumAMvskwAhXaZvuctqd8VHmH79rcfoqhydDfJ/S7NgZd+QrT97
 767ViM9TdHuXV3DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8749113CE4;
 Wed,  1 Dec 2021 15:31:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wIntHzWVp2GkfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Dec 2021 15:31:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch,
	sam@ravnborg.org
Subject: [PATCH 0/3] ast: Fix I2C corner cases wrt init/cleanup
Date: Wed,  1 Dec 2021 16:30:57 +0100
Message-Id: <20211201153100.403-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.0
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
this isn't correctly implemented in several places. Fix this. Also
add managed cleanup of the I2C code, and fail if the connector setup
fail.

Tested on AST2100 hardware.

Thomas Zimmermann (3):
  drm/ast: Handle failed I2C initialization gracefully
  drm/ast: Convert I2C code to managed cleanup
  drm/ast: Fail if connector initialization fails

 drivers/gpu/drm/ast/ast_mode.c | 52 ++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 25 deletions(-)


base-commit: 6a8f90ec433e2f5de5fc16d7a4839771b7027cc0
--
2.34.0

