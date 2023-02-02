Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9BD687C5B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 12:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD6A10E184;
	Thu,  2 Feb 2023 11:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED72910E184
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 11:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q0mloO5zA9Q4e1v1bB1TvvWGQJNzEV2eRcI0LFKgLg0=; b=EerMgFcd9XDXgbWQS0Aur8EBkM
 fcpIJL5wQT3F11rK34vB0bgzp5SedxiGKpJjmklE9/A9bDYiaVJrBcyFZUnfWJVGEMqJz8OykkqK2
 AKTETAnRuY3HgGnNI4m4hFIMduQPUrdK9eaKWMUXEjCoB2rTuMDMWmUIyZKcGTtK8RjbIvz1858bR
 ZyIPd87ukHgmHctO1/4IWaoi5/NtpozMMq76hVn/OBxp45960hUzS+vANwXdeaJCRyjcz4H5bhafQ
 adrfx58lzNrEruFrmATAf5fRwlnxEwCqRQrZu0Ha5zDPJpS1fT9mDyi9DIt0ePtW6WHfj1vVoqMIE
 1NqMz2ag==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pNXqD-007IGk-8T; Thu, 02 Feb 2023 12:33:21 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH v2 0/2] drm/vc4: Improve drm_gem_object handling
Date: Thu,  2 Feb 2023 08:19:42 -0300
Message-Id: <20230202111943.111757-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.1
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

Currently, the array of BOs that are lookup up at the start of exec is being
instantiated as drm_gem_dma_object, which is not needed and makes it difficult
to use the drm_gem_objects_lookup() helper. Therefore, replace
drm_gem_dma_object for drm_gem_object and then replace obj lookup steps with
drm_gem_objects_lookup().

v1 -> v2:

* Add André Almeida's Reviewed-by.

Best Regards,
- Maíra Canal

Maíra Canal (2):
  drm/vc4: replace drm_gem_dma_object for drm_gem_object in vc4_exec_info
  drm/vc4: replace obj lookup steps with drm_gem_objects_lookup

 drivers/gpu/drm/vc4/vc4_drv.h      |  2 +-
 drivers/gpu/drm/vc4/vc4_gem.c      | 78 +++++++-----------------------
 drivers/gpu/drm/vc4/vc4_validate.c |  4 +-
 3 files changed, 21 insertions(+), 63 deletions(-)

-- 
2.39.1

