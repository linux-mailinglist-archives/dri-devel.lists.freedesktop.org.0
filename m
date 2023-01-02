Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D9265B24B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 13:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E10710E31B;
	Mon,  2 Jan 2023 12:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BBB10E31B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 12:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AvW4I9oLms1w8aftufZa9GpPMmmLdl/m7r3DUrKGxmI=; b=CvJhee1WCp2BTEuUWhh3IyatcH
 3DMk9mQ3JDM7Ima/tDqtAxJShAyug5APttW6YIi5Gnn1G1JaBPw0j1PIfUpGImqTe6GYaMyfoRSQQ
 aXhnEH5CS/v/zUeX4Z+bBrPb+hSoutPMpEbBhjbO+iCbA5ill29JlY5tUMeqdQ8oaDfokYTbAXVC9
 pWVMmvsfLuksukwKO90lHPftiWTXofbu1mugLDfV3CnyuOq0Yq3QWWDhfoFNyqkELidd6rDEv8Jxy
 JvyYFf2bcv3OPtlkJ0qzVN6fD7/4Yz5gGUFBXzoi7lYLwbqnyXyVPcnfSEosIHfLuU4L+0pu5A1F3
 Qka+3LvQ==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pCKCJ-00FGSv-Tt; Mon, 02 Jan 2023 13:45:48 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/2] drm/vc4: Improve drm_gem_object handling
Date: Mon,  2 Jan 2023 09:45:33 -0300
Message-Id: <20230102124535.139202-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, the array of BOs that are lookup up at the start of exec is being
instantiated as drm_gem_dma_object, which is not needed and makes it difficult
to use the drm_gem_objects_lookup() helper. Therefore, replace
drm_gem_dma_object for drm_gem_object and then replace obj lookup steps with
drm_gem_objects_lookup().

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
2.38.1

