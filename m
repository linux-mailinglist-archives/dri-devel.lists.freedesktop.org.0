Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F26BB4C1C5A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 20:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0B310EA44;
	Wed, 23 Feb 2022 19:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA91010EA38
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 19:38:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4355B21891;
 Wed, 23 Feb 2022 19:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645645087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hTsJbLgi0af/PJW1g8Kt5i9GK08zKD43RJ0xOkUGFn4=;
 b=Vz1BojSTHdKvfRA8SGnkCGxF0ajuIT+otpP2PbpWg8CFHqnDpwCoSVFbEp8YVdZ7C6dbap
 kSthUIWCX2VJrUac2rs1AHTKQfT7VDlHfNbdsh+C+zYFsIuul/GW/lNQ9DVDFoMuKmAj6I
 vsy7anao6eP8Vq7Ch/7UYqfckHM8jgg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645645087;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hTsJbLgi0af/PJW1g8Kt5i9GK08zKD43RJ0xOkUGFn4=;
 b=LVQqJze1gvy+PJCrkLkB3DxMIEoAD4y49DPwL7YEhKZRy7Nf0/5Pb0MNYPMFpv49LQaoK0
 /2UeeIyztom16TDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06C4613C7B;
 Wed, 23 Feb 2022 19:38:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C3iXAB+NFmKfUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 23 Feb 2022 19:38:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, deller@gmx.de, javierm@redhat.com, geert@linux-m68k.org,
 sam@ravnborg.org, kraxel@redhat.com, ppaalanen@gmail.com
Subject: [PATCH v3 0/5] fbdev: Improve performance of fbdev console
Date: Wed, 23 Feb 2022 20:37:59 +0100
Message-Id: <20220223193804.18636-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Optimize performance of the fbdev console for the common case of
software-based clearing and image blitting.

The commit descripton of each patch contains resuls os a simple
microbenchmark. I also tested the full patchset's effect on the
console output by printing directory listings (i7-4790, FullHD,
simpledrm, kernel with debugging).

  > time find /usr/share/doc -type f

In the unoptimized case:

  real    0m6.173s
  user    0m0.044s
  sys     0m6.107s

With optimizations applied:

  real    0m4.754s
  user    0m0.044s
  sys     0m4.698s

In the optimized case, printing the directory listing is ~25% faster
than before.

In v2 of the patchset, after implementing Sam's suggestion to update
cfb_imageblit() as well, it turns out that the compiled code in
sys_imageblit() is still significantly slower than the CFB version. A
fix is probably a larger task and would include architecture-specific
changes. A new TODO item suggests to investigate the performance of the
various helpers and format-conversion functions in DRM and fbdev.

v3:
	* fix description of cfb_imageblit() patch (Pekka)
v2:
	* improve readability for sys_imageblit() (Gerd, Sam)
	* new TODO item for further optimization

Thomas Zimmermann (5):
  fbdev: Improve performance of sys_fillrect()
  fbdev: Improve performance of sys_imageblit()
  fbdev: Remove trailing whitespaces from cfbimgblt.c
  fbdev: Improve performance of cfb_imageblit()
  drm: Add TODO item for optimizing format helpers

 Documentation/gpu/todo.rst             |  22 +++++
 drivers/video/fbdev/core/cfbimgblt.c   | 107 ++++++++++++++++---------
 drivers/video/fbdev/core/sysfillrect.c |  16 +---
 drivers/video/fbdev/core/sysimgblt.c   |  49 ++++++++---
 4 files changed, 133 insertions(+), 61 deletions(-)

-- 
2.35.1

