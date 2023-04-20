Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D17236E8CFD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 10:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F6D10EBD5;
	Thu, 20 Apr 2023 08:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EB010EBD5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 08:41:53 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:4a06:df00:9eb6:d0ff:fe91:8037])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B14C5660325E;
 Thu, 20 Apr 2023 09:41:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681980111;
 bh=eBQ/v0qfb5mSbchCYOGAxBiTs1hHM2uCYA8m+s1NXpQ=;
 h=From:To:Cc:Subject:Date:From;
 b=YZfFWHqeg6jzs2Gkp3YZZ9Xp70XgJ/CHjTNk/Sge8oltMVPPbOxLAFVzID7tIvdTf
 Zpm/jKfnU4OmHP74UxMfO9AvZ7AXqBcbaHsqTYIDTKh08neyqTl8tuii6SseLtuWAn
 tpvDDXNrGdPZ4tNe0eM5p73nsawr4TJey5wGpTIlcheLVE0EA3d67B0ogocgH0AOOh
 KOXSU51wUFPXYPbXA1KHlKjXSOhGBli1QsE2IPEJhF1c8aEEqRKzId7KHoP0sKOG0Y
 Sc0ROegp2HgyqHxJov4L0N57JKZqmrSOkEYuvg8ZoZpUmBefCdU/kP6xVMdwUu+/KS
 DFB7WXUmj0wTw==
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/vkms: Add support for multiple pipes
Date: Thu, 20 Apr 2023 11:41:44 +0300
Message-Id: <20230420084147.19042-1-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: mwen@igalia.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 mcanal@igalia.com, melissa.srw@gmail.com, marius.vlad@collabora.com,
 igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With multiple pipe available we can perform management of outputs at
a more granular level, such that we're able to turn off or on several
outputs at a time, or combinations that arise from doing that. 

The Weston project use VKMS when running its test suite in CI, and we
have now uses cases which would need to ability to set-up the outputs
DPMS/state individually, rather than globally -- which would affect all
outputs. This an attempt on fixing that by giving the possibility to
create more than one pipe, and thus allowing to run tests that could
exercise code paths in the compositor related to management of outputs.

v2: 
  - Replace 'outputs' with 'pipes' as to use the proper terminology 
    (Thomas Zimmermann, Maíra Canal)
  - Fixed passing wrong possible_crtc bitmask when initializing the
    write back connector which address kms_writeback failure (Maíra Canal)
  - Add a feat. note about moving overlay planes between CRTCs (Melissa Wen)


Marius Vlad (3):
  vkms: Pass the correct bitmask for possible crtcs
  vkms: Add support for multiple pipes
  Documentation/gpu/vkms.rst: Added a note about plane migration

 Documentation/gpu/vkms.rst            |  5 +++--
 drivers/gpu/drm/vkms/vkms_crtc.c      |  3 +--
 drivers/gpu/drm/vkms/vkms_drv.c       | 27 ++++++++++++++++++++++-----
 drivers/gpu/drm/vkms/vkms_drv.h       | 11 ++++++++---
 drivers/gpu/drm/vkms/vkms_output.c    |  7 +++----
 drivers/gpu/drm/vkms/vkms_writeback.c | 24 ++++++++++++------------
 6 files changed, 49 insertions(+), 28 deletions(-)

-- 
2.39.2

