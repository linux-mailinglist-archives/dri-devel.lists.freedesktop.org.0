Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 573E1702EBE
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 15:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0FA10E077;
	Mon, 15 May 2023 13:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B93D10E077
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 13:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2o7BlJPC0mCLKXOG8WJdUqvpRveP+c2YhyOQkpN1D9E=; b=cEHojLeBrf2WZ1i0lB5wDLYRj2
 anuADGrTxg7Ug6vf/27N0pbPrdPsxM0zqhZzNAoLFzvzkmtu5DNjFOfQ24BTMkj109ZLD9UPc6/Pi
 pLZA0dQwG8Kesfm41gbKLcwCQBK7XPOt7UwFSOmcjkXAB1YL1gj92QCPpYHqQMd3K3Adb2W9t9VhJ
 rRufflXN/T+nCI6O0tM06zwoEQxSHtdWmqHaAgEhsj73QZh6VwxXf05Uw/3yViwJlbNgmchdfKAp1
 26h4KIHx1zGQY86Wxdk52CylCvQh9Ql2mSpnEiONDFQj40Sxpb9fz03CCUTBk2F8DQ3kIKmgsCw+w
 u32fPeJA==;
Received: from gwsc.sc.usp.br ([143.107.225.16] helo=bowie.sc.usp.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pyYcm-009tiB-Oe; Mon, 15 May 2023 15:52:29 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH 0/3] drm/vkms: Minor Improvements
Date: Mon, 15 May 2023 10:52:02 -0300
Message-Id: <20230515135204.115393-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.40.1
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series addresses some minor improvements to the writeback
functionality. The first patch intends to reduce the critical section
of a spinlock by removing assignments that don't need to be protected
by a lock. The second patch enables the support for ARGB8888 on the
writeback. Finally, the third patch refactors the pixel conversion
functions of the writeback functionality. This patch is a follow-up of
a previous patchset [1], in which Melissa suggested to apply the same
refactor to the writeback pixel conversion functions.

[1] https://lore.kernel.org/dri-devel/20230418130525.128733-1-mcanal@igalia.com/T/

Best Regards,
- Maíra

Maíra Canal (3):
  drm/vkms: Reduce critical section
  drm/vkms: Enable ARGB8888 support for writeback
  drm/vkms: Isolate writeback pixel conversion functions

 drivers/gpu/drm/vkms/vkms_composer.c  |   4 +-
 drivers/gpu/drm/vkms/vkms_drv.h       |   4 +-
 drivers/gpu/drm/vkms/vkms_formats.c   | 140 +++++++++++---------------
 drivers/gpu/drm/vkms/vkms_formats.h   |   2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |   9 +-
 5 files changed, 68 insertions(+), 91 deletions(-)

-- 
2.40.1

