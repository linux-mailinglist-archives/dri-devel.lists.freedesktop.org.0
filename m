Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE2062028A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 23:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432C310E57C;
	Mon,  7 Nov 2022 22:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B9510E57C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 22:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XW4en+FXtuU7AeOU4Nz6A3vrLZ+LD/LMQcdGwCIrXWs=; b=coQMHD2OJUN7M7rXdPwhKvRhP9
 qoRt+tMffyIkrAWHTzXrYFTIFMUeFHB6L1ztmy/xxqVj7cLaPGbg1A0IkCY+BkbMxsX1rHNtlqcrw
 CgHiNO0ioTxep1i+rkYj3DvDrTZoQl2dq9TLY65687moAkPhKka7k1Ih8qWa2isIDVRQeNRYRrXLq
 kQ+R1al2gYaUP7VIY3AH7TpKtBAqKHOHqOJhzRRaASQet9ewm89l/YF/t/ZdS31RTW4KlOgQE40k8
 WmCD/m7HGVTD13wKBNMVlllqDKJT6+46TCpbBogbQqAmineC2HFgx05nAt6UUkvizSl2Zbxi2bcEJ
 VenNJdsA==;
Received: from [177.34.169.227] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1osAur-00E9qX-6q; Mon, 07 Nov 2022 23:48:29 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/2] Balance mutex_init and mutex_destroy calls
Date: Mon,  7 Nov 2022 19:46:54 -0300
Message-Id: <20221107224656.278135-1-mcanal@igalia.com>
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
Cc: "Juan A . Suarez" <jasuarez@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series introduces some changes to assure the correct resource release on
the V3D driver, especially the mutex. Currently, the V3D has no mutex_destroy()
calls, which means that a mutex is being instantiated, but it is not being
released by the end of its use.

So, use the DRM-managed mutex_init variants when possible to manage the mutex
release and add mutex_destroy() calls when not possible.

Best Regards,
- Maíra Canal

Maíra Canal (2):
  drm/v3d: switch to drmm_mutex_init
  drm/v3d: add missing mutex_destroy

 drivers/gpu/drm/v3d/v3d_gem.c     | 17 +++++++++++++----
 drivers/gpu/drm/v3d/v3d_perfmon.c |  2 ++
 2 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.38.1

