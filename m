Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEA7600D8A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 13:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186B910ED48;
	Mon, 17 Oct 2022 11:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69CE10ED3A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 11:15:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 29E4220407;
 Mon, 17 Oct 2022 11:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666005312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6Nb1TZTtU5oADQNyt2GoTdqjmh5j834IvAQJMY3C79A=;
 b=xlYCVQIL74kHzLPnmrfuhQKuVnDxu+vnT9uOj864c0N5cuUi2GI9mB4olY0IqK2FO2DsjX
 OiaGRyimpSGbCjo8iQtaCBEcdQF1oHczYDUNpJg6PPVshfkRveAKQaca4Wpb/P+uABveEs
 m6k0grpLTmwN5uluyvb9RS428sK7dow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666005312;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6Nb1TZTtU5oADQNyt2GoTdqjmh5j834IvAQJMY3C79A=;
 b=qs1ISMhxzNsAawsPlwC4Vjn1uwZsQIuvMjvlRYs5ciGgEf35vmSACq2Pbf6V7apVjGCe9/
 oX0EIBV7K3d7AbDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D16D513ABE;
 Mon, 17 Oct 2022 11:15:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TbYlMj85TWOgBwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Oct 2022 11:15:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, hdegoede@redhat.com,
 noralf@tronnes.org, david@lechnology.com, airlied@redhat.com,
 sean@poorly.run
Subject: [PATCH 0/5] drm: Add new plane helpers to begin/end FB access
Date: Mon, 17 Oct 2022 13:15:05 +0200
Message-Id: <20221017111510.20818-1-tzimmermann@suse.de>
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

This patchset adds the callbacks begin_fb_access and end_fb_access
to struct drm_plane_helper_funcs. They provide hooks to acquire and
release resources that are only held during the commit. It adds
related simple-KMS helpers and converts a number of drivers.

A number of drivers call drm_gem_fb_begin_cpu_access() in the plane's
atomic_update. While the call can fail, it's too late to handle the
error correctly within the atomic update. A correct place would be in
prepare_fb, where the atomic commit can still be aborted upon errors.

But the corresponding drm_gem_fb_end_cpu_access() needs to be called
at the end of the commit, so that the BO resource is available again
for other drivers. Hence, calling drm_Gem_fb_end_cpu_access() cannot
be located in the plane's cleanup_pl, which is only called after the
next page flip. (With an unbounded waiting time in between.)

Therefore introduce the begin_fb_access and end_fb_access callbacks in
struct drm_plane_helper_funcs. The atomic helpers call begin_fb_access
when preparing the planes for the commit and end_fb_access when
cleaning up afterwards. The argument to end_fb_access is the new plane
state, so that acquired resources are not held after the end of the
commit.

With this in place, move drm_gem_fb_{begin,end}_cpu_access() behind
the new callbacks for shadow-plane helpers and 2 other drivers. For
the shadow-plane helpers, also move the automatic vmap/vunmap behind
the new callbacks. The shadow-plane mapping is only required during
the atomic commit.

Tested with combinations of radeon, udl and simpledrm under X11, Weston
and Wayland-Gnome.

Thomas Zimmermann (5):
  drm/atomic-helper: Add {begin,end}_fb_access to plane helpers
  drm/gem: Implement shadow-plane {begin,end}_fb_access with vmap
  drm/gem: Handle drm_gem_{begin,end}_cpu_access() in shadow-plane
    helpers
  drm/repaper: Implement {begin,end}_fb_access helpers
  drm/st7586: Implement {begin,end}_fb_access helpers

 drivers/gpu/drm/drm_atomic_helper.c      | 34 ++++++++++-
 drivers/gpu/drm/drm_gem_atomic_helper.c  | 78 +++++++++++++-----------
 drivers/gpu/drm/drm_simple_kms_helper.c  | 26 ++++++++
 drivers/gpu/drm/solomon/ssd130x.c        | 10 +--
 drivers/gpu/drm/tiny/gm12u320.c          | 10 +--
 drivers/gpu/drm/tiny/ofdrm.c             |  8 +--
 drivers/gpu/drm/tiny/repaper.c           | 30 +++++++--
 drivers/gpu/drm/tiny/simpledrm.c         | 10 +--
 drivers/gpu/drm/tiny/st7586.c            | 44 ++++++++-----
 drivers/gpu/drm/udl/udl_modeset.c        | 11 +---
 include/drm/drm_gem_atomic_helper.h      | 20 +++---
 include/drm/drm_modeset_helper_vtables.h | 27 ++++++++
 include/drm/drm_simple_kms_helper.h      | 20 ++++++
 13 files changed, 217 insertions(+), 111 deletions(-)


base-commit: 8c797a984264f04708d2099e83c85978a0fede89
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6
-- 
2.38.0

